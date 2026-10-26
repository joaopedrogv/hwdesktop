object DtmCadBasicos: TDtmCadBasicos
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 1681
  Width = 2819
  object IBTransCadastroBasico: TIBTransaction
    DefaultDatabase = dtmAtivo.bancoHw
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 719
    Top = 690
  end
  object qrDepartamentos: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransCadastroBasico
    SQL.Strings = (
      'SELECT * FROM DEPTO '
      'where ativo=1')
    Left = 18
    Top = 49
  end
  object qrBuscasDep: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransCadastroBasico
    Left = 18
    Top = 1
  end
  object dspDepartametos: TDataSetProvider
    DataSet = qrDepartamentos
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 18
    Top = 96
  end
  object CdsDepartamentos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDepartametos'
    BeforeOpen = CdsDepartamentosBeforeOpen
    Left = 18
    Top = 145
    object CdsDepartamentosCOD_DEPTO: TIntegerField
      Tag = 2
      DisplayLabel = 'Codigo'
      FieldName = 'COD_DEPTO'
      Required = True
    end
    object CdsDepartamentosNOME_DEPTO: TStringField
      Tag = 2
      DisplayLabel = 'Nome Departamento'
      FieldName = 'NOME_DEPTO'
      Size = 30
    end
    object CdsDepartamentosATIVO: TIntegerField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
    object CdsDepartamentosCOD_DPTOCX: TIntegerField
      DisplayLabel = 'Departamento CX'
      FieldName = 'COD_DPTOCX'
    end
    object CdsDepartamentosINICIAIS_DEPTO: TStringField
      DisplayLabel = 'Iniciais'
      FieldName = 'INICIAIS_DEPTO'
      Size = 3
    end
  end
  object dsDepartamentos: TDataSource
    DataSet = CdsDepartamentos
    Left = 18
    Top = 194
  end
  object SpIncCodigo: TIBStoredProc
    Database = dtmAtivo.bancoHw
    Transaction = IBTransCadastroBasico
    StoredProcName = 'INCREMENTA_CODIGO'
    Left = 598
    Top = 504
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
  object RdpCadBasicos: TRDprint
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
    Left = 537
    Top = 512
  end
  object qrMarcas: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransCadastroBasico
    SQL.Strings = (
      'select MARCA_PROD.*, MARCA_PROD_EC.ID_COMMERCE from MARCA_PROD'
      'LEFT JOIN MARCA_PROD_EC ON'
      
        'MARCA_PROD_EC.COD_MARCA =  MARCA_PROD.COD_MARCA AND  MARCA_PROD_' +
        'EC.COD_EMPRESA = 1 '
      'WHERE MARCA_PROD.ATIVO = 1')
    Left = 88
    Top = 49
  end
  object qrBuscasMarca: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransCadastroBasico
    Left = 88
  end
  object dspMarcas: TDataSetProvider
    DataSet = qrMarcas
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 88
    Top = 96
  end
  object cdsMarcas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspMarcas'
    BeforeOpen = CdsDepartamentosBeforeOpen
    Left = 88
    Top = 145
    object cdsMarcasSEL: TStringField
      DisplayLabel = 'Sel'
      FieldKind = fkInternalCalc
      FieldName = 'SEL'
      Size = 1
    end
    object cdsMarcasCOD_MARCA: TIntegerField
      Tag = 2
      DisplayLabel = 'Codigo'
      FieldName = 'COD_MARCA'
      Origin = '"MARCA_PROD"."COD_MARCA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsMarcasDESCRICAO_MARCA: TStringField
      Tag = 2
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO_MARCA'
      Origin = '"MARCA_PROD"."DESCRICAO_MARCA"'
      FixedChar = True
      Size = 30
    end
    object cdsMarcasCOD_USUARIO: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Usu'#225'rio que Cadastrou'
      FieldName = 'COD_USUARIO'
      Origin = '"MARCA_PROD"."COD_USUARIO"'
    end
    object cdsMarcasCOD_USUARIO_ALT: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Usu'#225'rio que Alterou'
      FieldName = 'COD_USUARIO_ALT'
      Origin = '"MARCA_PROD"."COD_USUARIO_ALT"'
    end
    object cdsMarcasATIVO: TIntegerField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
      Origin = '"MARCA_PROD"."ATIVO"'
    end
    object cdsMarcasTIPO_MARCA: TStringField
      DisplayLabel = 'Tipo de Marca'
      FieldName = 'TIPO_MARCA'
      Origin = '"MARCA_PROD"."TIPO_MARCA"'
      FixedChar = True
      Size = 1
    end
    object cdsMarcasDESCRICAO_EC: TStringField
      DisplayLabel = 'Descricao Ecommerce'
      FieldName = 'DESCRICAO_EC'
      Size = 30
    end
    object cdsMarcasID_COMMERCE: TLargeintField
      DisplayLabel = 'Id Commerce'
      FieldName = 'ID_COMMERCE'
    end
  end
  object dsMarcas: TDataSource
    DataSet = cdsMarcas
    Left = 88
    Top = 190
  end
  object qrTipoServ: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransCadastroBasico
    SQL.Strings = (
      'SELECT * FROM TIPO_SERVICO '
      'where ativo=1')
    Left = 160
    Top = 46
  end
  object qrBuscasTipoServ: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransCadastroBasico
    Left = 160
    Top = 1
  end
  object dspTipoServ: TDataSetProvider
    DataSet = qrTipoServ
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 160
    Top = 93
  end
  object cdsTipoServ: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTipoServ'
    BeforeOpen = CdsDepartamentosBeforeOpen
    Left = 160
    Top = 142
    object cdsTipoServCOD_SERVICO: TIntegerField
      DisplayLabel = 'Cod Servi'#231'o'
      FieldName = 'COD_SERVICO'
      Required = True
    end
    object cdsTipoServDESC_SERVICO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESC_SERVICO'
      FixedChar = True
      Size = 60
    end
    object cdsTipoServVALOR_SERVICO: TFloatField
      DisplayLabel = 'Valor do Servi'#231'o'
      FieldName = 'VALOR_SERVICO'
    end
    object cdsTipoServSHONDA: TStringField
      DisplayLabel = 'M'#227'o de obra Honda'
      FieldName = 'SHONDA'
      FixedChar = True
      Size = 1
    end
    object cdsTipoServALTCOD: TStringField
      DisplayLabel = 'Altera Desc ou valor no Cupom'
      FieldName = 'ALTCOD'
      FixedChar = True
      Size = 1
    end
    object cdsTipoServDATA_CAD_TIPO: TDateTimeField
      DisplayLabel = 'Data de cadastro'
      FieldName = 'DATA_CAD_TIPO'
    end
    object cdsTipoServDATA_MOD_TIPO: TDateTimeField
      DisplayLabel = 'Data de altera'#231#227'o'
      FieldName = 'DATA_MOD_TIPO'
    end
    object cdsTipoServSTIPO: TStringField
      DisplayLabel = 'Tipo de servi'#231'o'
      FieldName = 'STIPO'
      FixedChar = True
      Size = 1
    end
    object cdsTipoServTMO: TFloatField
      FieldName = 'TMO'
    end
    object cdsTipoServALIQ_ISS: TFloatField
      DisplayLabel = 'Al'#237'quota de ISS'
      FieldName = 'ALIQ_ISS'
    end
    object cdsTipoServATIVO: TIntegerField
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
    object cdsTipoServCOD_ESPE_SEG: TIntegerField
      DisplayLabel = 'Cod Esp'#233'cie Segmenta'#231#227'o Serv.'
      FieldName = 'COD_ESPE_SEG'
    end
    object cdsTipoServCODIGO_NOP: TFloatField
      DisplayLabel = 'CFOP'
      FieldName = 'CODIGO_NOP'
    end
    object cdsTipoServTMOSERVSIMULT: TStringField
      DisplayLabel = 'TMO Simult'#226'neo'
      FieldName = 'TMOSERVSIMULT'
      FixedChar = True
      Size = 1
    end
    object cdsTipoServALT_DESC: TStringField
      DisplayLabel = 'Altera Descri'#231#227'o'
      FieldName = 'ALT_DESC'
      FixedChar = True
      Size = 1
    end
    object cdsTipoServSERV_PROP_TERC: TStringField
      DisplayLabel = 'Servi'#231'o ou Produto de Terceiro'
      FieldName = 'SERV_PROP_TERC'
      FixedChar = True
      Size = 1
    end
    object cdsTipoServISENTO_SERV: TStringField
      DisplayLabel = 'Servi'#231'o Isento'
      FieldName = 'ISENTO_SERV'
      FixedChar = True
      Size = 1
    end
    object cdsTipoServN_INCIDENCIA_SERV: TStringField
      DisplayLabel = 'N'#227'o Incid'#234'ncia no Servi'#231'o'
      FieldName = 'N_INCIDENCIA_SERV'
      FixedChar = True
      Size = 1
    end
    object cdsTipoServARREDONDAR_TRUNCAR: TStringField
      DisplayLabel = 'Arredondar ou Truncar'
      FieldName = 'ARREDONDAR_TRUNCAR'
      FixedChar = True
      Size = 1
    end
  end
  object dsTipoServ: TDataSource
    DataSet = cdsTipoServ
    Left = 160
    Top = 191
  end
  object qrEspecieSeg: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransCadastroBasico
    SQL.Strings = (
      'SELECT * FROM ESPECIE_VEICULO')
    Left = 263
    Top = 589
    object qrEspecieSegCODIGO_ESP: TIntegerField
      FieldName = 'CODIGO_ESP'
      Origin = '"ESPECIE_VEICULO"."CODIGO_ESP"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrEspecieSegDESCRICAO_ESP: TIBStringField
      FieldName = 'DESCRICAO_ESP'
      Origin = '"ESPECIE_VEICULO"."DESCRICAO_ESP"'
      FixedChar = True
      Size = 30
    end
  end
  object dsEspecieSeg: TDataSource
    DataSet = qrEspecieSeg
    Left = 273
    Top = 659
  end
  object qrCFOP: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransCadastroBasico
    SQL.Strings = (
      'select * from nat_op where ativo=1')
    Left = 421
    Top = 589
    object qrCFOPCODIGO_NOP: TFloatField
      FieldName = 'CODIGO_NOP'
      Origin = '"NAT_OP"."CODIGO_NOP"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qrCFOPDESCRICAO_NOP: TIBStringField
      FieldName = 'DESCRICAO_NOP'
      Origin = '"NAT_OP"."DESCRICAO_NOP"'
      Size = 100
    end
  end
  object dsCFOP: TDataSource
    DataSet = qrCFOP
    Left = 430
    Top = 658
  end
  object qrPPSProdutos: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransCadastroBasico
    SQL.Strings = (
      
        'select * from pps_produtos where ativo=1 order by NOME_FORNECEDO' +
        'R')
    Left = 224
    Top = 59
  end
  object qrBuscasPPS: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransCadastroBasico
    Left = 226
    Top = 7
  end
  object dspPPSProdutos: TDataSetProvider
    DataSet = qrPPSProdutos
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 224
    Top = 106
  end
  object cdsPPSProdutos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPPSProdutos'
    BeforeOpen = CdsDepartamentosBeforeOpen
    Left = 224
    Top = 155
    object cdsPPSProdutosCOD_PPS: TStringField
      DisplayLabel = 'PPS Produto'
      FieldName = 'COD_PPS'
      Required = True
      FixedChar = True
      Size = 2
    end
    object cdsPPSProdutosCODIGO_F: TIntegerField
      DisplayLabel = 'Cod Fornecedor'
      FieldName = 'CODIGO_F'
      Required = True
    end
    object cdsPPSProdutosCOD_EMPRESA: TIntegerField
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsPPSProdutosMARKUP_PPS: TFloatField
      DisplayLabel = 'Mark UP PPS'
      FieldName = 'MARKUP_PPS'
    end
    object cdsPPSProdutosNOME_FORNECEDOR: TStringField
      DisplayLabel = 'Fornecedor'
      FieldName = 'NOME_FORNECEDOR'
      FixedChar = True
      Size = 35
    end
    object cdsPPSProdutosATIVO: TIntegerField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
      Visible = False
    end
  end
  object dsPPSProdutos: TDataSource
    DataSet = cdsPPSProdutos
    Left = 224
    Top = 204
  end
  object qrFornecedor: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransCadastroBasico
    SQL.Strings = (
      'select CODIGO_F, NOME  from FORNECEDOR where ativo=1')
    Left = 366
    Top = 590
    object qrFornecedorCODIGO_F: TIntegerField
      FieldName = 'CODIGO_F'
      Origin = '"FORNECEDOR"."CODIGO_F"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrFornecedorNOME: TIBStringField
      FieldName = 'NOME'
      Origin = '"FORNECEDOR"."NOME"'
      Size = 35
    end
  end
  object dsFornecedor: TDataSource
    DataSet = qrFornecedor
    Left = 375
    Top = 658
  end
  object qrNatOperacao: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransCadastroBasico
    SQL.Strings = (
      'select * from NAT_OP')
    Left = 293
    Top = 40
  end
  object dsNatOperacao: TDataSource
    DataSet = cdsNatOperacao
    Left = 293
    Top = 193
  end
  object cdsNatOperacao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspNatOperacao'
    BeforeOpen = CdsDepartamentosBeforeOpen
    Left = 293
    Top = 144
    object cdsNatOperacaoCODIGO_NOP: TFloatField
      Tag = 2
      DisplayLabel = 'CFOP'
      FieldName = 'CODIGO_NOP'
    end
    object cdsNatOperacaoDESCRICAO_NOP: TStringField
      Tag = 2
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 192
      FieldName = 'DESCRICAO_NOP'
      Size = 192
    end
    object cdsNatOperacaoPRECC: TStringField
      DisplayLabel = 'Pre'#231'o de Custo'
      FieldName = 'PRECC'
      FixedChar = True
      Size = 1
    end
    object cdsNatOperacaoCOMIMP: TStringField
      DisplayLabel = 'Saida c/ Imp.'
      FieldName = 'COMIMP'
      FixedChar = True
      Size = 1
    end
    object cdsNatOperacaoSEM_IMPOSTO: TStringField
      DisplayLabel = 'Sem Imp. NF'
      FieldName = 'SEM_IMPOSTO'
      FixedChar = True
      Size = 1
    end
    object cdsNatOperacaoCALC_CUSTO: TStringField
      DisplayLabel = 'Calcular Custo'
      FieldName = 'CALC_CUSTO'
      FixedChar = True
      Size = 1
    end
    object cdsNatOperacaoALIQ_INT_SAID: TFloatField
      DisplayLabel = 'Al'#237'quota Saida Venda'
      FieldName = 'ALIQ_INT_SAID'
    end
    object cdsNatOperacaoATIVO: TIntegerField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
    object cdsNatOperacaoALT_EST: TStringField
      DisplayLabel = 'Alterar Estoque'
      FieldName = 'ALT_EST'
      FixedChar = True
      Size = 1
    end
    object cdsNatOperacaoMOSTRAR_REL_COMPRAS: TStringField
      Tag = 2
      DisplayLabel = 'Mostrar Rel. Compras'
      FieldName = 'MOSTRAR_REL_COMPRAS'
      FixedChar = True
      Size = 1
    end
    object cdsNatOperacaoCFOP_CONV: TFloatField
      DisplayLabel = 'CFOP Conv'
      FieldName = 'CFOP_CONV'
    end
    object cdsNatOperacaoNAT_BC_CRED: TStringField
      DisplayLabel = 'Natureza Base C'#225'lculo Cr'#233'dito SPED PIS/COFINS'
      FieldName = 'NAT_BC_CRED'
      Size = 2
    end
    object cdsNatOperacaoCREDITO_PIS_COFINS: TStringField
      DisplayLabel = 'Gerador de Cr'#233'dito de PIS/COFINS'
      FieldName = 'CREDITO_PIS_COFINS'
      FixedChar = True
      Size = 1
    end
    object cdsNatOperacaoRECEITA_PIS_COFINS: TStringField
      DisplayLabel = 'Gerador de Receita de PIS/COFINS'
      FieldName = 'RECEITA_PIS_COFINS'
      FixedChar = True
      Size = 1
    end
    object cdsNatOperacaoDEVOLUCAO_SPED: TStringField
      DisplayLabel = 'Devolu'#231#227'o SPED?'
      FieldName = 'DEVOLUCAO_SPED'
      Size = 1
    end
    object cdsNatOperacaoDEVOLUCAO: TStringField
      DisplayLabel = 'Devolu'#231#227'o?'
      FieldName = 'DEVOLUCAO'
      Size = 1
    end
    object cdsNatOperacaoTIPV: TStringField
      DisplayLabel = 'Tipo Venda Padrao'
      FieldName = 'TIPV'
      Size = 1
    end
    object cdsNatOperacaoCOD_INF: TIntegerField
      DisplayLabel = 'Cod Inf Compl'
      FieldName = 'COD_INF'
    end
    object cdsNatOperacaoTIPV_VEICULO: TStringField
      DisplayLabel = 'Tipo OP'
      FieldName = 'TIPV_VEICULO'
      Size = 1
    end
    object cdsNatOperacaoUSA_BX_RETORNO_FIN: TStringField
      DisplayLabel = 'CFOP de retorno de mercadorias (Devolu'#231#245'es, Retornos, etc)'
      FieldName = 'USA_BX_RETORNO_FIN'
      Size = 1
    end
    object cdsNatOperacaoFATURAMENTO: TStringField
      DisplayLabel = 'Faturamento'
      FieldName = 'FATURAMENTO'
      FixedChar = True
      Size = 1
    end
    object cdsNatOperacaoCOMPRA: TStringField
      DisplayLabel = 'Compra'
      FieldName = 'COMPRA'
      FixedChar = True
      Size = 1
    end
    object cdsNatOperacaoORDEMEXIBICAO: TSmallintField
      DisplayLabel = 'Ordem Exib'
      FieldName = 'ORDEMEXIBICAO'
    end
    object cdsNatOperacaoTIPO_OPERACAO: TStringField
      DisplayLabel = 'Novo/Usado'
      FieldName = 'TIPO_OPERACAO'
      FixedChar = True
      Size = 1
    end
    object cdsNatOperacaoSEMVINCULO_VND: TStringField
      DisplayLabel = 'Sem V'#237'nculo Pedidos'
      FieldName = 'SEMVINCULO_VND'
      Size = 1
    end
    object cdsNatOperacaoCFOP_CONV_SAIDA_INTRA: TFloatField
      DisplayLabel = 'CFOP Saida Intraestadual'
      FieldName = 'CFOP_CONV_SAIDA_INTRA'
    end
    object cdsNatOperacaoCFOP_CONV_SAIDA_INTER: TFloatField
      DisplayLabel = 'CFOP Saida Interestadual'
      FieldName = 'CFOP_CONV_SAIDA_INTER'
    end
  end
  object dspNatOperacao: TDataSetProvider
    DataSet = qrNatOperacao
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 293
    Top = 95
  end
  object qrCondPgto: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransCadastroBasico
    SQL.Strings = (
      
        'Select COND_PAG.*, COND_PAG_TABPRECO.COD_TAB_PRECO  from COND_PA' +
        'G'
      
        'LEFT JOIN COND_PAG_TABPRECO ON COND_PAG_TABPRECO.COD_COND_PAG = ' +
        'COND_PAG.COD_COND_PAG AND COND_PAG_TABPRECO.COD_EMPRESA = 1'
      'where 1 = 0')
    Left = 356
    Top = 53
  end
  object dspCondPgto: TDataSetProvider
    DataSet = qrCondPgto
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 356
    Top = 100
  end
  object cdsCondPgto: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCondPgto'
    BeforeOpen = CdsDepartamentosBeforeOpen
    Left = 356
    Top = 149
    object cdsCondPgtoSEL: TStringField
      DisplayLabel = 'Sel'
      FieldKind = fkInternalCalc
      FieldName = 'SEL'
      Size = 1
    end
    object cdsCondPgtoCOD_COND_PAG: TIntegerField
      Tag = 2
      DisplayLabel = 'Codigo'
      FieldName = 'COD_COND_PAG'
      Required = True
    end
    object cdsCondPgtoDESC_COND_PAG: TStringField
      Tag = 2
      DisplayLabel = 'Descricao'
      FieldName = 'DESC_COND_PAG'
      Size = 30
    end
    object cdsCondPgtoSEQPRECO: TStringField
      DisplayLabel = 'Seq Preco'
      FieldName = 'SEQPRECO'
      FixedChar = True
      Size = 1
    end
    object cdsCondPgtoMAX_DESC: TFloatField
      DisplayLabel = 'Max Desconto (%)'
      FieldName = 'MAX_DESC'
    end
    object cdsCondPgtoATIVO: TIntegerField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
      Visible = False
    end
    object cdsCondPgtoNATUREZA_CP: TStringField
      DisplayLabel = 'Natureza'
      FieldName = 'NATUREZA_CP'
      FixedChar = True
      Size = 1
    end
    object cdsCondPgtoCOD_TAB_PRECO: TIntegerField
      DisplayLabel = 'Cod TabPreco'
      FieldName = 'COD_TAB_PRECO'
    end
    object cdsCondPgtoMODALIDADE: TStringField
      DisplayLabel = 'Modalidade'
      FieldName = 'MODALIDADE'
      Size = 1
    end
    object cdsCondPgtoCONSIDERAR_DIA_UTIL: TStringField
      DisplayLabel = 'Considerar dia util'
      FieldName = 'CONSIDERAR_DIA_UTIL'
      Size = 3
    end
    object cdsCondPgtoPARCELAS_ADICIONAIS: TSmallintField
      DisplayLabel = 'Max Parcelas Adicionais'
      FieldName = 'PARCELAS_ADICIONAIS'
    end
    object cdsCondPgtoCOND_PADRAO_CL: TStringField
      DisplayLabel = 'Condi'#231#227'o de padr'#227'o clientes (vendas)'
      FieldName = 'COND_PADRAO_CL_VND'
      FixedChar = True
      Size = 1
    end
    object cdsCondPgtoCOND_PADRAO_CL_PREST: TStringField
      DisplayLabel = 'Condi'#231#227'o de padr'#227'o clientes (presta'#231#245'es)'
      FieldName = 'COND_PADRAO_CL_PREST'
      FixedChar = True
      Size = 1
    end
  end
  object dsCondPgto: TDataSource
    DataSet = cdsCondPgto
    Left = 356
    Top = 198
  end
  object qrContFatura: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransCadastroBasico
    SQL.Strings = (
      'select * from TIPO_FATURAMENTO')
    Left = 418
    Top = 50
  end
  object dspContFatura: TDataSetProvider
    DataSet = qrContFatura
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 418
    Top = 97
  end
  object cdsContFatura: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspContFatura'
    BeforeOpen = CdsDepartamentosBeforeOpen
    Left = 418
    Top = 146
    object cdsContFaturaCODIGO_FATURAMENTO: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO_FATURAMENTO'
      Required = True
    end
    object cdsContFaturaDESC_FAT: TStringField
      DisplayLabel = 'Desci'#231#227'o'
      FieldName = 'DESC_FAT'
      FixedChar = True
      Size = 30
    end
    object cdsContFaturaSTATUS_F: TStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS_F'
      FixedChar = True
      Size = 10
    end
    object cdsContFaturaATIVO: TIntegerField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
  end
  object dsContFatura: TDataSource
    DataSet = cdsContFatura
    Left = 418
    Top = 195
  end
  object dsUF: TDataSource
    DataSet = qrUF
    Left = 323
    Top = 658
  end
  object qrUF: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransCadastroBasico
    SQL.Strings = (
      'Select * from ESTADOS'
      '')
    Left = 315
    Top = 590
  end
  object qrTransportador: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransCadastroBasico
    SQL.Strings = (
      'select * from TRANSPORTADOR')
    Left = 274
    Top = 274
  end
  object dspTransportador: TDataSetProvider
    DataSet = qrTransportador
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 274
    Top = 331
  end
  object cdsTransportador: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTransportador'
    BeforeOpen = CdsDepartamentosBeforeOpen
    Left = 282
    Top = 382
    object cdsTransportadorSEL: TStringField
      DisplayLabel = 'Sel'
      FieldKind = fkInternalCalc
      FieldName = 'SEL'
      Size = 1
    end
    object cdsTransportadorCODIGO_TR: TIntegerField
      Tag = 2
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO_TR'
      Required = True
    end
    object cdsTransportadorCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'C'#243'digo Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsTransportadorNOME_TR: TStringField
      Tag = 2
      DisplayLabel = 'Nome'
      FieldName = 'NOME_TR'
      FixedChar = True
      Size = 60
    end
    object cdsTransportadorCNPJ_TR: TStringField
      Tag = 2
      DisplayLabel = 'CNPJ'
      FieldName = 'CNPJ_TR'
      FixedChar = True
      Size = 14
    end
    object cdsTransportadorEND_TR: TStringField
      DisplayLabel = 'Endere'#231'o'
      FieldName = 'END_TR'
      FixedChar = True
      Size = 40
    end
    object cdsTransportadorMUNICIPIO_TR: TStringField
      DisplayLabel = 'Munic'#237'pio'
      FieldName = 'MUNICIPIO_TR'
      FixedChar = True
      Size = 25
    end
    object cdsTransportadorUF_TR: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'UF_TR'
    end
    object cdsTransportadorFONE_TR: TStringField
      DisplayLabel = 'Fone'
      FieldName = 'FONE_TR'
      EditMask = '(99) 9999-9999;0;_'
      FixedChar = True
      Size = 13
    end
    object cdsTransportadorFAX_TR: TStringField
      DisplayLabel = 'Fax'
      FieldName = 'FAX_TR'
      EditMask = '(99) 9999-9999;0;_'
      FixedChar = True
      Size = 13
    end
    object cdsTransportadorIE_TR: TStringField
      DisplayLabel = 'Insc. Estad.'
      FieldName = 'IE_TR'
      FixedChar = True
      Size = 14
    end
    object cdsTransportadorATIVO: TIntegerField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
    object cdsTransportadorCODIGOANTT: TStringField
      DisplayLabel = 'C'#243'digo ANTT'
      FieldName = 'CODIGOANTT'
      Size = 21
    end
    object cdsTransportadorCIDADE_IBGE: TIntegerField
      DisplayLabel = 'Codigo Cidade IBGE'
      FieldName = 'CIDADE_IBGE'
    end
  end
  object dsTransportador: TDataSource
    DataSet = cdsTransportador
    Left = 274
    Top = 431
  end
  object TransNatOperacao: TIBTransaction
    DefaultDatabase = dtmAtivo.bancoHw
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 421
    Top = 706
  end
  object qrBuscas: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransCadastroBasico
    SQL.Strings = (
      'Select * from ESTADOS'
      '')
    Left = 423
    Top = 1118
  end
  object qrContador: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransCadastroBasico
    SQL.Strings = (
      'select *  from CONTADOR')
    Left = 483
    Top = 48
  end
  object dspContador: TDataSetProvider
    DataSet = qrContador
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 483
    Top = 95
  end
  object dsContador: TDataSource
    DataSet = cdsContador
    Left = 483
    Top = 193
  end
  object cdsContador: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspContador'
    BeforeOpen = CdsDepartamentosBeforeOpen
    Left = 483
    Top = 144
    object cdsContadorCOD_CONTADOR: TIntegerField
      Tag = 2
      DisplayLabel = 'Codigo'
      FieldName = 'COD_CONTADOR'
      Required = True
    end
    object cdsContadorCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'C'#243'digo da Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsContadorCODIGO_UF: TIntegerField
      DisplayLabel = 'Cod UF'
      FieldName = 'CODIGO_UF'
    end
    object cdsContadorCPFCNPJ_CONT: TStringField
      DisplayLabel = 'CPF/CNPJ'
      FieldName = 'CPFCNPJ_CONT'
      FixedChar = True
      Size = 18
    end
    object cdsContadorNOME_CONT: TStringField
      Tag = 2
      DisplayLabel = 'Nome'
      FieldName = 'NOME_CONT'
      Size = 50
    end
    object cdsContadorENDERECO_CONT: TStringField
      DisplayLabel = 'Endere'#231'o'
      FieldName = 'ENDERECO_CONT'
      Size = 50
    end
    object cdsContadorBAIRRO_CONT: TStringField
      DisplayLabel = 'Bairro'
      FieldName = 'BAIRRO_CONT'
      Size = 30
    end
    object cdsContadorCIDADE_CONT: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'CIDADE_CONT'
      Size = 30
    end
    object cdsContadorCEP_CONT: TStringField
      DisplayLabel = 'CEP'
      FieldName = 'CEP_CONT'
      EditMask = '00000\-999;0;_'
      FixedChar = True
      Size = 9
    end
    object cdsContadorFONE_CONT: TStringField
      DisplayLabel = 'Fone 1'
      FieldName = 'FONE_CONT'
      EditMask = '(99) 9999-9999;0;_'
      FixedChar = True
      Size = 14
    end
    object cdsContadorRAMAL_CONT: TStringField
      DisplayLabel = 'Ramal'
      FieldName = 'RAMAL_CONT'
      FixedChar = True
      Size = 5
    end
    object cdsContadorCONTATO_CONT: TStringField
      DisplayLabel = 'Contato'
      FieldName = 'CONTATO_CONT'
    end
    object cdsContadorOUTROTEL_CONT: TStringField
      DisplayLabel = 'Fone 2'
      FieldName = 'OUTROTEL_CONT'
      EditMask = '(99) 9999-9999;0;_'
      FixedChar = True
      Size = 14
    end
    object cdsContadorOBS_CONT: TStringField
      Tag = 1
      DisplayLabel = 'Observa'#231#227'o'
      FieldName = 'OBS_CONT'
      Size = 80
    end
    object cdsContadorEMAIL_CONT: TStringField
      DisplayLabel = 'E-mail'
      FieldName = 'EMAIL_CONT'
      Size = 50
    end
    object cdsContadorFAX_CONT: TStringField
      DisplayLabel = 'Fax'
      FieldName = 'FAX_CONT'
      EditMask = '(99) 9999-9999;0;_'
      FixedChar = True
      Size = 14
    end
    object cdsContadorDT_CAD_CONT: TDateTimeField
      DisplayLabel = 'Data de cadastro'
      FieldName = 'DT_CAD_CONT'
    end
    object cdsContadorCOD_CIDADE: TSmallintField
      DisplayLabel = 'Cod Cidade'
      FieldName = 'COD_CIDADE'
    end
    object cdsContadorCOD_BAIRRO: TSmallintField
      DisplayLabel = 'Cod Bairro'
      FieldName = 'COD_BAIRRO'
    end
    object cdsContadorATIVO: TIntegerField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
    object cdsContadorCRC: TStringField
      FieldName = 'CRC'
      Size = 15
    end
    object cdsContadorCNPJ_ESCRITORIO: TStringField
      DisplayLabel = 'CNPJ Escrit'#243'rio'
      FieldName = 'CNPJ_ESCRITORIO'
      Size = 18
    end
    object cdsContadorNUMERO: TIntegerField
      DisplayLabel = 'Numero Endere'#231'o'
      FieldName = 'NUMERO'
    end
    object cdsContadorCOMPLEMENTO: TStringField
      DisplayLabel = 'Complemento'
      FieldName = 'COMPLEMENTO'
      Size = 60
    end
    object cdsContadorNOME_ESCRITORIO: TStringField
      DisplayLabel = 'Nome Escrit'#243'rio'
      FieldName = 'NOME_ESCRITORIO'
      Size = 50
    end
  end
  object qrPerfil: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransCadastroBasico
    SQL.Strings = (
      'select * from TAB_PERFIL')
    Left = 533
    Top = 57
  end
  object dspPerfil: TDataSetProvider
    DataSet = qrPerfil
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 533
    Top = 104
  end
  object dsPerfil: TDataSource
    DataSet = cdsPerfil
    Left = 533
    Top = 202
  end
  object cdsPerfil: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPerfil'
    BeforeOpen = CdsDepartamentosBeforeOpen
    Left = 533
    Top = 153
    object cdsPerfilCAMPO_PERFIL: TIntegerField
      Tag = 2
      DisplayLabel = 'Codigo'
      FieldName = 'CAMPO_PERFIL'
      Required = True
    end
    object cdsPerfilDESCRICAO: TStringField
      Tag = 2
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      FixedChar = True
      Size = 50
    end
    object cdsPerfilATIVO: TIntegerField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
  end
  object qrSenha: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransSenha
    SQL.Strings = (
      'select * from SENHAS')
    Left = 581
    Top = 50
  end
  object dspSenha: TDataSetProvider
    DataSet = qrSenha
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 581
    Top = 97
  end
  object dsSenha: TDataSource
    DataSet = cdsSenha
    Left = 581
    Top = 195
  end
  object cdsSenha: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSenha'
    BeforeOpen = CdsDepartamentosBeforeOpen
    Left = 581
    Top = 146
    object cdsSenhaSEL: TStringField
      DisplayLabel = 'Sel'
      FieldKind = fkInternalCalc
      FieldName = 'SEL'
      Size = 1
    end
    object cdsSenhaCODIGO: TIntegerField
      Tag = 2
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO'
      Origin = '"SENHAS"."CODIGO"'
      Required = True
    end
    object cdsSenhaUSUARIO: TStringField
      Tag = 2
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'USUARIO'
      Origin = '"SENHAS"."USUARIO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 10
    end
    object cdsSenhaCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Origin = '"SENHAS"."COD_EMPRESA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsSenhaSENHA: TStringField
      Tag = 1
      DisplayLabel = 'Senha'
      FieldName = 'SENHA'
      Origin = '"SENHAS"."SENHA"'
      FixedChar = True
      Size = 6
    end
    object cdsSenhaNOME_US: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME_US'
      Origin = '"SENHAS"."NOME_US"'
      FixedChar = True
      Size = 30
    end
    object cdsSenhaNIVEL_US: TIntegerField
      DisplayLabel = 'N'#237'vel'
      FieldName = 'NIVEL_US'
      Origin = '"SENHAS"."NIVEL_US"'
    end
    object cdsSenhaESTOQ_NEG: TStringField
      DisplayLabel = 'Est. Negativo'
      FieldName = 'ESTOQ_NEG'
      Origin = '"SENHAS"."ESTOQ_NEG"'
      FixedChar = True
      Size = 1
    end
    object cdsSenhaCONTRA_SENHA: TStringField
      Tag = 1
      DisplayLabel = 'Conta Senha'
      FieldName = 'CONTRA_SENHA'
      Origin = '"SENHAS"."CONTRA_SENHA"'
      FixedChar = True
      Size = 6
    end
    object cdsSenhaDEPART: TStringField
      DisplayLabel = 'Departamento'
      FieldName = 'DEPART'
      Origin = '"SENHAS"."DEPART"'
      FixedChar = True
      Size = 30
    end
    object cdsSenhaIMAGENS_US: TStringField
      DisplayLabel = 'Imagem'
      FieldName = 'IMAGENS_US'
      Origin = '"SENHAS"."IMAGENS_US"'
      FixedChar = True
      Size = 30
    end
    object cdsSenhaIMP_US: TStringField
      DisplayLabel = 'Modo Imp.'
      FieldName = 'IMP_US'
      Origin = '"SENHAS"."IMP_US"'
      FixedChar = True
      Size = 15
    end
    object cdsSenhaALT_CAB: TStringField
      DisplayLabel = 'Alt. Cabe'#231'alho'
      FieldName = 'ALT_CAB'
      Origin = '"SENHAS"."ALT_CAB"'
      FixedChar = True
      Size = 1
    end
    object cdsSenhaALT_IMP: TStringField
      DisplayLabel = 'Alt. Impressora'
      FieldName = 'ALT_IMP'
      Origin = '"SENHAS"."ALT_IMP"'
      FixedChar = True
      Size = 1
    end
    object cdsSenhaDATA_CAD_S: TDateTimeField
      DisplayLabel = 'Data do Cadastro'
      FieldName = 'DATA_CAD_S'
      Origin = '"SENHAS"."DATA_CAD_S"'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsSenhaDATA_MOD_S: TDateTimeField
      DisplayLabel = 'Data Modifica'#231#227'o'
      FieldName = 'DATA_MOD_S'
      Origin = '"SENHAS"."DATA_MOD_S"'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsSenhaATIVO: TIntegerField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
      Origin = '"SENHAS"."ATIVO"'
    end
    object cdsSenhaEMP_PADRAO: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Emp Padr'#227'o'
      FieldName = 'EMP_PADRAO'
    end
    object cdsSenhaEXIBIR_MENSAGEM_CONSORCIO: TStringField
      DisplayLabel = 'Mens. Consorcio'
      FieldName = 'EXIBIR_MENSAGEM_CONSORCIO'
      FixedChar = True
      Size = 1
    end
    object cdsSenhaLIBERAR_ACESSO: TStringField
      DisplayLabel = 'Liberar Acesso'
      FieldName = 'LIBERAR_ACESSO'
      FixedChar = True
      Size = 1
    end
    object cdsSenhaCOD_PERFIL_HORAS_TRAB: TIntegerField
      DisplayLabel = 'Cod Horario Trab'
      FieldName = 'COD_PERFIL_HORAS_TRAB'
    end
  end
  object dsImpressoras: TDataSource
    DataSet = cdsImpressoras
    Left = 648
    Top = 196
  end
  object cdsImpressoras: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspImpressoras'
    BeforeOpen = CdsDepartamentosBeforeOpen
    Left = 648
    Top = 147
    object cdsImpressorasIDENTIFICACAO: TStringField
      Tag = 2
      DisplayLabel = 'Identifica'#231#227'o'
      FieldName = 'IDENTIFICACAO'
      Required = True
      FixedChar = True
      Size = 6
    end
    object cdsImpressorasTIPO_ECF: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO_ECF'
    end
    object cdsImpressorasMARCA_ECF: TStringField
      DisplayLabel = 'Marca'
      FieldName = 'MARCA_ECF'
    end
    object cdsImpressorasMODELO_ECF: TStringField
      DisplayLabel = 'Modelo'
      FieldName = 'MODELO_ECF'
      Size = 35
    end
    object cdsImpressorasVERSAOSB: TStringField
      DisplayLabel = 'Vers'#227'o'
      FieldName = 'VERSAOSB'
    end
    object cdsImpressorasQTDELACRESEXTSL: TIntegerField
      DisplayLabel = 'Qtde Lacres Ext. SL'
      FieldName = 'QTDELACRESEXTSL'
    end
    object cdsImpressorasQTDELACRESEXTFAB: TIntegerField
      DisplayLabel = 'Qtde Lacres Ext. Fab'
      FieldName = 'QTDELACRESEXTFAB'
    end
    object cdsImpressorasTEMFD: TStringField
      DisplayLabel = 'Tem MFD ?'
      FieldName = 'TEMFD'
      FixedChar = True
      Size = 1
    end
    object cdsImpressorasLACREMFD: TStringField
      DisplayLabel = 'Lacre MFD ?'
      FieldName = 'LACREMFD'
      FixedChar = True
      Size = 1
    end
    object cdsImpressorasATO_APROVACAO: TStringField
      DisplayLabel = 'Ato Homologat'#243'rio'
      FieldName = 'ATO_APROVACAO'
      Size = 30
    end
    object cdsImpressorasATIVO: TIntegerField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
  end
  object dspImpressoras: TDataSetProvider
    DataSet = qrImpressoras
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 648
    Top = 98
  end
  object qrImpressoras: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransCadastroBasico
    SQL.Strings = (
      'select * from IMPRESSORAS_CNIEE')
    Left = 648
    Top = 51
  end
  object dsBairro: TDataSource
    DataSet = qrBairro
    Left = 9
    Top = 657
  end
  object qrBairro: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransCadastroBasico
    SQL.Strings = (
      'Select * from Bairros'
      ''
      '')
    Left = 1
    Top = 588
  end
  object dsCidade: TDataSource
    DataSet = qrCidade
    Left = 56
    Top = 658
  end
  object qrCidade: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransCadastroBasico
    SQL.Strings = (
      'select * from cidades'
      ''
      ''
      '')
    Left = 47
    Top = 591
  end
  object dsColaborador: TDataSource
    DataSet = qrColaborador
    Left = 119
    Top = 658
  end
  object qrColaborador: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransCadastroBasico
    SQL.Strings = (
      'Select * from COLABORADOR'
      ''
      '')
    Left = 110
    Top = 588
  end
  object dsDPTO: TDataSource
    DataSet = qrDPTO
    Left = 175
    Top = 658
  end
  object qrDPTO: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransCadastroBasico
    SQL.Strings = (
      'SELECT * FROM DEPTO'
      ''
      '')
    Left = 166
    Top = 588
  end
  object qrTaxaJuros: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransEmpresa
    SQL.Strings = (
      'select * from TABJUROS')
    Left = 600
    Top = 274
  end
  object dsTaxaJuros: TDataSource
    DataSet = cdsTaxaJuros
    Left = 600
    Top = 431
  end
  object dspTaxaJuros: TDataSetProvider
    DataSet = qrTaxaJuros
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 600
    Top = 331
  end
  object cdsTaxaJuros: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTaxaJuros'
    BeforeOpen = CdsDepartamentosBeforeOpen
    Left = 608
    Top = 382
    object cdsTaxaJurosNPREST_J: TIntegerField
      DisplayLabel = 'N'#186' da Presta'#231#227'o'
      FieldName = 'NPREST_J'
      Required = True
    end
    object cdsTaxaJurosJUROS_J: TFloatField
      DisplayLabel = 'Juro Praticado'
      FieldName = 'JUROS_J'
    end
    object cdsTaxaJurosCOD_EMPRESA: TIntegerField
      DisplayLabel = 'C'#243'd. Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
      Visible = False
    end
    object cdsTaxaJurosCOEF_J: TStringField
      DisplayLabel = 'Coeficiente'
      FieldName = 'COEF_J'
      FixedChar = True
      Size = 10
    end
    object cdsTaxaJurosATIVO: TIntegerField
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
      Visible = False
    end
  end
  object qrEmpresa: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransEmpresa
    SQL.Strings = (
      'select * from EMPRESA')
    Left = 709
    Top = 48
  end
  object dsEmpresa: TDataSource
    DataSet = cdsEmpresa
    Left = 709
    Top = 193
  end
  object dspEmpresa: TDataSetProvider
    DataSet = qrEmpresa
    Constraints = False
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 709
    Top = 95
  end
  object cdsEmpresa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEmpresa'
    BeforeOpen = CdsDepartamentosBeforeOpen
    Left = 709
    Top = 144
    object cdsEmpresaCOD_EMPRESA: TIntegerField
      Tag = 2
      DisplayLabel = 'Codigo'
      FieldName = 'COD_EMPRESA'
      Origin = '"EMPRESA"."COD_EMPRESA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsEmpresaNOME_EMP: TStringField
      Tag = 2
      DisplayLabel = 'Empresa'
      FieldName = 'NOME_EMP'
      Origin = '"EMPRESA"."NOME_EMP"'
      Size = 50
    end
    object cdsEmpresaENDRECO_EMP: TStringField
      DisplayLabel = 'Endere'#231'o'
      FieldName = 'ENDRECO_EMP'
      Origin = '"EMPRESA"."ENDRECO_EMP"'
      Size = 50
    end
    object cdsEmpresaBAIRRO_EMP: TStringField
      DisplayLabel = 'Bairro'
      FieldName = 'BAIRRO_EMP'
      Origin = '"EMPRESA"."BAIRRO_EMP"'
      Size = 30
    end
    object cdsEmpresaCIDADE_EMP: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'CIDADE_EMP'
      Origin = '"EMPRESA"."CIDADE_EMP"'
      Size = 30
    end
    object cdsEmpresaCEP_EMP: TStringField
      DisplayLabel = 'CEP'
      FieldName = 'CEP_EMP'
      Origin = '"EMPRESA"."CEP_EMP"'
      EditMask = '00000\-999;0;_'
      FixedChar = True
      Size = 9
    end
    object cdsEmpresaUF_EMP: TIntegerField
      DisplayLabel = 'UF'
      FieldName = 'UF_EMP'
      Origin = '"EMPRESA"."UF_EMP"'
    end
    object cdsEmpresaCGC_EMP: TStringField
      DisplayLabel = 'CNPJ'
      FieldName = 'CGC_EMP'
      Origin = '"EMPRESA"."CGC_EMP"'
      Size = 18
    end
    object cdsEmpresaIE_EMP: TStringField
      DisplayLabel = 'Insc. Estadual'
      FieldName = 'IE_EMP'
      Origin = '"EMPRESA"."IE_EMP"'
      Size = 18
    end
    object cdsEmpresaIM_EMP: TStringField
      DisplayLabel = 'Insc. Municipal'
      FieldName = 'IM_EMP'
      Origin = '"EMPRESA"."IM_EMP"'
      Size = 18
    end
    object cdsEmpresaOBSERV_EMP: TStringField
      DisplayLabel = 'Obs.'
      FieldName = 'OBSERV_EMP'
      Origin = '"EMPRESA"."OBSERV_EMP"'
      Size = 60
    end
    object cdsEmpresaTELEFONE_EMP: TStringField
      DisplayLabel = 'Fone'
      FieldName = 'TELEFONE_EMP'
      Origin = '"EMPRESA"."TELEFONE_EMP"'
      EditMask = '(99)9999-99999;1;_'
      Size = 14
    end
    object cdsEmpresaPROP_EMP: TStringField
      DisplayLabel = 'Propriet'#225'rio'
      FieldName = 'PROP_EMP'
      Origin = '"EMPRESA"."PROP_EMP"'
      Size = 40
    end
    object cdsEmpresaCAIXA_INTEGRADO: TStringField
      DisplayLabel = 'Caixa Integrado'
      FieldName = 'CAIXA_INTEGRADO'
      Origin = '"EMPRESA"."CAIXA_INTEGRADO"'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaFILIAL: TStringField
      DisplayLabel = 'Filial'
      FieldName = 'FILIAL'
      Origin = '"EMPRESA"."FILIAL"'
      Size = 21
    end
    object cdsEmpresaG_CI: TIntegerField
      DisplayLabel = 'Gr. Imp.Vnd'
      FieldName = 'G_CI'
      Origin = '"EMPRESA"."G_CI"'
    end
    object cdsEmpresaG_CDV: TIntegerField
      DisplayLabel = 'Gr.Desp.Vari'#225'vel'
      FieldName = 'G_CDV'
      Origin = '"EMPRESA"."G_CDV"'
    end
    object cdsEmpresaG_CDF: TIntegerField
      DisplayLabel = 'Gr Desp. Fixas'
      FieldName = 'G_CDF'
      Origin = '"EMPRESA"."G_CDF"'
    end
    object cdsEmpresaG_CRO: TIntegerField
      DisplayLabel = 'Gr.Rec.(Outras)'
      FieldName = 'G_CRO'
      Origin = '"EMPRESA"."G_CRO"'
    end
    object cdsEmpresaG_CSE: TIntegerField
      DisplayLabel = 'Gr. Reinvest'
      FieldName = 'G_CSE'
      Origin = '"EMPRESA"."G_CSE"'
    end
    object cdsEmpresaEM_NF: TStringField
      DisplayLabel = 'Emiss'#227'o de Nota Fiscal'
      FieldName = 'EM_NF'
      Origin = '"EMPRESA"."EM_NF"'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaMOD_FAT: TStringField
      DisplayLabel = 'M'#243'dulo Faturamento'
      FieldName = 'MOD_FAT'
      Origin = '"EMPRESA"."MOD_FAT"'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaQT_SERV_NF: TIntegerField
      DisplayLabel = 'Quant. Servi'#231'o Nota Fiscal'
      FieldName = 'QT_SERV_NF'
      Origin = '"EMPRESA"."QT_SERV_NF"'
    end
    object cdsEmpresaQT_PROD_NF: TIntegerField
      DisplayLabel = 'Quant. Total Prod. Nota Fiscal'
      FieldName = 'QT_PROD_NF'
      Origin = '"EMPRESA"."QT_PROD_NF"'
    end
    object cdsEmpresaDEB_CRED: TStringField
      DisplayLabel = 'D'#233'bito/Credito'
      FieldName = 'DEB_CRED'
      Origin = '"EMPRESA"."DEB_CRED"'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaCONEXAO: TStringField
      DisplayLabel = 'Conex'#227'o'
      FieldName = 'CONEXAO'
      Origin = '"EMPRESA"."CONEXAO"'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaN_PED: TStringField
      DisplayLabel = 'N'#250'mero Ped'
      FieldName = 'N_PED'
      Origin = '"EMPRESA"."N_PED"'
      Size = 10
    end
    object cdsEmpresaCONCESS: TStringField
      DisplayLabel = 'Concession'#225'ria'
      FieldName = 'CONCESS'
      Origin = '"EMPRESA"."CONCESS"'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaOBS_PAD_OS: TMemoField
      Tag = 1
      DisplayLabel = 'Observa'#231#227'o Padr'#227'o OS'
      FieldName = 'OBS_PAD_OS'
      Origin = '"EMPRESA"."OBS_PAD_OS"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
    object cdsEmpresaVND_AB_CUSTO: TStringField
      DisplayLabel = 'Venda Abaixo do Custo'
      FieldName = 'VND_AB_CUSTO'
      Origin = '"EMPRESA"."VND_AB_CUSTO"'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaTX_JUROS: TFloatField
      DisplayLabel = 'Taxa Juros'
      FieldName = 'TX_JUROS'
      Origin = '"EMPRESA"."TX_JUROS"'
    end
    object cdsEmpresaMULTAS: TFloatField
      DisplayLabel = 'Multas'
      FieldName = 'MULTAS'
      Origin = '"EMPRESA"."MULTAS"'
    end
    object cdsEmpresaQTDE_ITENS_NF: TIntegerField
      DisplayLabel = 'Quant. Servi'#231'o Nota Fiscal'
      FieldName = 'QTDE_ITENS_NF'
      Origin = '"EMPRESA"."QTDE_ITENS_NF"'
    end
    object cdsEmpresaNOTA_FISCAL: TIntegerField
      DisplayLabel = 'Nota Ativa'
      FieldName = 'NOTA_FISCAL'
      Origin = '"EMPRESA"."NOTA_FISCAL"'
    end
    object cdsEmpresaPORTA_IMPRESSAO: TStringField
      DisplayLabel = 'Porta da Impressora'
      FieldName = 'PORTA_IMPRESSAO'
      Origin = '"EMPRESA"."PORTA_IMPRESSAO"'
      Size = 60
    end
    object cdsEmpresaCALCULADORA: TStringField
      DisplayLabel = 'Calculadora'
      FieldName = 'CALCULADORA'
      Origin = '"EMPRESA"."CALCULADORA"'
      Size = 80
    end
    object cdsEmpresaTAMANHOLETRA: TStringField
      DisplayLabel = 'Tamanho Letra p/ Regua'
      FieldName = 'TAMANHOLETRA'
      Origin = '"EMPRESA"."TAMANHOLETRA"'
      Size = 10
    end
    object cdsEmpresaQTDE_LINHASNF: TIntegerField
      DisplayLabel = 'Quant.Linhas da Nota Fiscal'
      FieldName = 'QTDE_LINHASNF'
      Origin = '"EMPRESA"."QTDE_LINHASNF"'
    end
    object cdsEmpresaISS_EMP: TFloatField
      DisplayLabel = 'Al'#237'quota do ISS'
      FieldName = 'ISS_EMP'
      Origin = '"EMPRESA"."ISS_EMP"'
    end
    object cdsEmpresaQTMESSUG: TIntegerField
      DisplayLabel = 'Qtde Meses Sugest'#227'o'
      FieldName = 'QTMESSUG'
      Origin = '"EMPRESA"."QTMESSUG"'
    end
    object cdsEmpresaCABREQ: TStringField
      DisplayLabel = 'Cabe'#231'alho Req'
      FieldName = 'CABREQ'
      Origin = '"EMPRESA"."CABREQ"'
      Size = 15
    end
    object cdsEmpresaCABOS: TStringField
      DisplayLabel = 'Cabe'#231'alho O.S.'
      FieldName = 'CABOS'
      Origin = '"EMPRESA"."CABOS"'
      Size = 15
    end
    object cdsEmpresaDADVAP: TStringField
      DisplayLabel = 'Aparelho Nos Serv.'
      FieldName = 'DADVAP'
      Origin = '"EMPRESA"."DADVAP"'
      FixedChar = True
      Size = 3
    end
    object cdsEmpresaNUMERO_END: TIntegerField
      DisplayLabel = 'N'#186
      FieldName = 'NUMERO_END'
      Origin = '"EMPRESA"."NUMERO_END"'
    end
    object cdsEmpresaALIQPADRAO: TFloatField
      DisplayLabel = 'Aliq. Padrao ICMS'
      FieldName = 'ALIQPADRAO'
      Origin = '"EMPRESA"."ALIQPADRAO"'
    end
    object cdsEmpresaTP_SUG: TIntegerField
      DisplayLabel = 'Tempo Processamento'
      FieldName = 'TP_SUG'
      Origin = '"EMPRESA"."TP_SUG"'
    end
    object cdsEmpresaTE_SUG: TIntegerField
      DisplayLabel = 'Tempo de Entrega'
      FieldName = 'TE_SUG'
      Origin = '"EMPRESA"."TE_SUG"'
    end
    object cdsEmpresaTA_SUG: TIntegerField
      DisplayLabel = 'Tempo de Aloca'#231#227'o'
      FieldName = 'TA_SUG'
      Origin = '"EMPRESA"."TA_SUG"'
    end
    object cdsEmpresaFP_SUG: TIntegerField
      DisplayLabel = 'Frequ'#234'ncia Pedido'
      FieldName = 'FP_SUG'
      Origin = '"EMPRESA"."FP_SUG"'
    end
    object cdsEmpresaMES_RET_SERV1: TIntegerField
      DisplayLabel = 'M. Ret. Veiculo 1'
      FieldName = 'MES_RET_SERV1'
      Origin = '"EMPRESA"."MES_RET_SERV1"'
    end
    object cdsEmpresaKM_RET_SERV1: TIntegerField
      DisplayLabel = 'KM Ret. Veic 1'
      FieldName = 'KM_RET_SERV1'
      Origin = '"EMPRESA"."KM_RET_SERV1"'
    end
    object cdsEmpresaMES_RET_SERV3: TIntegerField
      DisplayLabel = 'M. Ret. Veiculo 2'
      FieldName = 'MES_RET_SERV3'
      Origin = '"EMPRESA"."MES_RET_SERV3"'
    end
    object cdsEmpresaKM_RET_SERV3: TIntegerField
      DisplayLabel = 'KM Ret. Veic 2'
      FieldName = 'KM_RET_SERV3'
      Origin = '"EMPRESA"."KM_RET_SERV3"'
    end
    object cdsEmpresaEMAIL_EMP: TStringField
      DisplayLabel = 'E-mail'
      FieldName = 'EMAIL_EMP'
      Origin = '"EMPRESA"."EMAIL_EMP"'
      Size = 50
    end
    object cdsEmpresaSMTP_EMP: TStringField
      DisplayLabel = 'Servidor SMTP'
      FieldName = 'SMTP_EMP'
      Origin = '"EMPRESA"."SMTP_EMP"'
      Size = 50
    end
    object cdsEmpresaLOGIN_EMP: TStringField
      DisplayLabel = 'Login'
      FieldName = 'LOGIN_EMP'
      Origin = '"EMPRESA"."LOGIN_EMP"'
      Size = 50
    end
    object cdsEmpresaCPPADPROD: TStringField
      DisplayLabel = 'Campo Produto'
      FieldName = 'CPPADPROD'
      Origin = '"EMPRESA"."CPPADPROD"'
      Size = 40
    end
    object cdsEmpresaCPPADCL: TStringField
      DisplayLabel = 'Campo Cliente'
      FieldName = 'CPPADCL'
      Origin = '"EMPRESA"."CPPADCL"'
      Size = 40
    end
    object cdsEmpresaCPPADVEI: TStringField
      DisplayLabel = 'Campo Ve'#237'culo'
      FieldName = 'CPPADVEI'
      Origin = '"EMPRESA"."CPPADVEI"'
      Size = 40
    end
    object cdsEmpresaLOCAL_PAG: TStringField
      DisplayLabel = 'Local Pagamento'
      FieldName = 'LOCAL_PAG'
      Origin = '"EMPRESA"."LOCAL_PAG"'
      Size = 60
    end
    object cdsEmpresaTOTDESC_EMP: TFloatField
      DisplayLabel = 'M'#225'ximo de Desconto Varejo(%)'
      FieldName = 'TOTDESC_EMP'
      Origin = '"EMPRESA"."TOTDESC_EMP"'
    end
    object cdsEmpresaUTIL_AUD: TStringField
      DisplayLabel = 'Usar Auditoria'
      FieldName = 'UTIL_AUD'
      Origin = '"EMPRESA"."UTIL_AUD"'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaUTIL_PESQE: TStringField
      DisplayLabel = 'Pesquisa Exata'
      FieldName = 'UTIL_PESQE'
      Origin = '"EMPRESA"."UTIL_PESQE"'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaARREDOND: TStringField
      DisplayLabel = 'Usar Arredondamento'
      FieldName = 'ARREDOND'
      Origin = '"EMPRESA"."ARREDOND"'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaTOTDESC_EMPA: TFloatField
      DisplayLabel = 'M'#225'ximo Desconto Atacado:(%)'
      FieldName = 'TOTDESC_EMPA'
      Origin = '"EMPRESA"."TOTDESC_EMPA"'
    end
    object cdsEmpresaMIN_MARGEM_V: TFloatField
      DisplayLabel = 'M'#237'nimo Margem(Br) P/ Varejo'
      FieldName = 'MIN_MARGEM_V'
      Origin = '"EMPRESA"."MIN_MARGEM_V"'
    end
    object cdsEmpresaMIN_MARGEM_A: TFloatField
      DisplayLabel = 'M'#237'nimo Margem(Br) P/ Atacado'
      FieldName = 'MIN_MARGEM_A'
      Origin = '"EMPRESA"."MIN_MARGEM_A"'
    end
    object cdsEmpresaALT_PERC_MARGEM: TStringField
      DisplayLabel = 'Alt Perc.Margem'
      FieldName = 'ALT_PERC_MARGEM'
      Origin = '"EMPRESA"."ALT_PERC_MARGEM"'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaAPRES_ESTR: TStringField
      DisplayLabel = 'Apresentar Est.Real'
      FieldName = 'APRES_ESTR'
      Origin = '"EMPRESA"."APRES_ESTR"'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaDIAS_DEMO_EMP: TIntegerField
      DisplayLabel = 'Dias Demonstra'#231#227'o Produto'
      FieldName = 'DIAS_DEMO_EMP'
      Origin = '"EMPRESA"."DIAS_DEMO_EMP"'
    end
    object S: TIntegerField
      DisplayLabel = 'Dias Reserva Produto'
      FieldName = 'DIAS_RES_EMP'
      Origin = '"EMPRESA"."DIAS_RES_EMP"'
    end
    object cdsEmpresaOBS_BOL: TStringField
      DisplayLabel = 'Obs. Protesto'
      FieldName = 'OBS_BOL'
      Origin = '"EMPRESA"."OBS_BOL"'
      Size = 45
    end
    object cdsEmpresaOBS_DECL_OS: TMemoField
      Tag = 1
      DisplayLabel = 'Declara'#231#227'o Padr'#227'o'
      FieldName = 'OBS_DECL_OS'
      Origin = '"EMPRESA"."OBS_DECL_OS"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
    object cdsEmpresaDECL_OBS_OS: TStringField
      DisplayLabel = 'Decl. em OBS.'
      FieldName = 'DECL_OBS_OS'
      Origin = '"EMPRESA"."DECL_OBS_OS"'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaG_CI_VEIC: TIntegerField
      DisplayLabel = 'Gr. Imp.Vnd.'
      FieldName = 'G_CI_VEIC'
      Origin = '"EMPRESA"."G_CI_VEIC"'
    end
    object cdsEmpresaG_CDV_VEIC: TIntegerField
      DisplayLabel = 'Gr.Desp.Vari'#225'vel'
      FieldName = 'G_CDV_VEIC'
      Origin = '"EMPRESA"."G_CDV_VEIC"'
    end
    object cdsEmpresaG_CDF_VEIC: TIntegerField
      DisplayLabel = 'Gr Desp. Fixas'
      FieldName = 'G_CDF_VEIC'
      Origin = '"EMPRESA"."G_CDF_VEIC"'
    end
    object cdsEmpresaG_CRO_VEIC: TIntegerField
      DisplayLabel = 'Gr.Rec.(Outras)'
      FieldName = 'G_CRO_VEIC'
      Origin = '"EMPRESA"."G_CRO_VEIC"'
    end
    object cdsEmpresaG_CSE_VEIC: TIntegerField
      DisplayLabel = 'Gr. Reinvest.'
      FieldName = 'G_CSE_VEIC'
      Origin = '"EMPRESA"."G_CSE_VEIC"'
    end
    object cdsEmpresaG_CI_SERV: TIntegerField
      DisplayLabel = 'Gr. Imp.Vnd.'
      FieldName = 'G_CI_SERV'
      Origin = '"EMPRESA"."G_CI_SERV"'
    end
    object cdsEmpresaG_CDV_SERV: TIntegerField
      DisplayLabel = 'Gr.Desp.Vari'#225'vel'
      FieldName = 'G_CDV_SERV'
      Origin = '"EMPRESA"."G_CDV_SERV"'
    end
    object cdsEmpresaG_CDF_SERV: TIntegerField
      DisplayLabel = 'Gr Desp. Fixas'
      FieldName = 'G_CDF_SERV'
      Origin = '"EMPRESA"."G_CDF_SERV"'
    end
    object cdsEmpresaG_CRO_SERV: TIntegerField
      DisplayLabel = 'Gr.Rec.(Outras)'
      FieldName = 'G_CRO_SERV'
      Origin = '"EMPRESA"."G_CRO_SERV"'
    end
    object cdsEmpresaG_CSE_SERV: TIntegerField
      DisplayLabel = 'Gr. Reinvest.'
      FieldName = 'G_CSE_SERV'
      Origin = '"EMPRESA"."G_CSE_SERV"'
    end
    object cdsEmpresaG_IR_ADM: TIntegerField
      DisplayLabel = 'Gr. Imp.Renda'
      FieldName = 'G_IR_ADM'
      Origin = '"EMPRESA"."G_IR_ADM"'
    end
    object cdsEmpresaG_CTRS_ADM: TIntegerField
      DisplayLabel = 'Gr. Contr Social'
      FieldName = 'G_CTRS_ADM'
      Origin = '"EMPRESA"."G_CTRS_ADM"'
    end
    object cdsEmpresaG_REM_ADM: TIntegerField
      DisplayLabel = 'Rem. Cap. Terc.'
      FieldName = 'G_REM_ADM'
      Origin = '"EMPRESA"."G_REM_ADM"'
    end
    object cdsEmpresaG_REIV_ADM: TIntegerField
      DisplayLabel = 'Reinvestimentos'
      FieldName = 'G_REIV_ADM'
      Origin = '"EMPRESA"."G_REIV_ADM"'
    end
    object cdsEmpresaG_DF_ADM: TIntegerField
      DisplayLabel = 'Desp. Fixas'
      FieldName = 'G_DF_ADM'
      Origin = '"EMPRESA"."G_DF_ADM"'
    end
    object cdsEmpresaG_DV_ADM: TIntegerField
      DisplayLabel = 'Desp. Vari'#225'veis'
      FieldName = 'G_DV_ADM'
      Origin = '"EMPRESA"."G_DV_ADM"'
    end
    object cdsEmpresaCOFINS_EMP: TFloatField
      DisplayLabel = 'Cofins'
      FieldName = 'COFINS_EMP'
      Origin = '"EMPRESA"."COFINS_EMP"'
    end
    object cdsEmpresaPIS_EMP: TFloatField
      DisplayLabel = 'Pis'
      FieldName = 'PIS_EMP'
      Origin = '"EMPRESA"."PIS_EMP"'
    end
    object cdsEmpresaCOMISS_PROD_EMP: TFloatField
      DisplayLabel = 'Comiss'#227'o Prod.'
      FieldName = 'COMISS_PROD_EMP'
      Origin = '"EMPRESA"."COMISS_PROD_EMP"'
    end
    object cdsEmpresaENC_SOBR_COM: TFloatField
      DisplayLabel = 'Encargo Sobre Comiss'#227'o'
      FieldName = 'ENC_SOBR_COM'
      Origin = '"EMPRESA"."ENC_SOBR_COM"'
    end
    object cdsEmpresaCUSTO_EST_EMP: TFloatField
      DisplayLabel = 'Custo do Estoque'
      FieldName = 'CUSTO_EST_EMP'
      Origin = '"EMPRESA"."CUSTO_EST_EMP"'
    end
    object cdsEmpresaOUT_ENC_EMP: TFloatField
      DisplayLabel = 'Outros Encargos'
      FieldName = 'OUT_ENC_EMP'
      Origin = '"EMPRESA"."OUT_ENC_EMP"'
    end
    object cdsEmpresaDESP_FIXAS: TFloatField
      DisplayLabel = 'Despesas Fixas'
      FieldName = 'DESP_FIXAS'
      Origin = '"EMPRESA"."DESP_FIXAS"'
    end
    object cdsEmpresaJR_CMP_EMP: TFloatField
      DisplayLabel = 'Juros Compra Prazo'
      FieldName = 'JR_CMP_EMP'
      Origin = '"EMPRESA"."JR_CMP_EMP"'
    end
    object cdsEmpresaIMP_RENDA: TFloatField
      DisplayLabel = 'Imposto de Renda'
      FieldName = 'IMP_RENDA'
      Origin = '"EMPRESA"."IMP_RENDA"'
    end
    object cdsEmpresaCONTR_S_EMP: TFloatField
      DisplayLabel = 'Contribui'#231#227'o Social'
      FieldName = 'CONTR_S_EMP'
      Origin = '"EMPRESA"."CONTR_S_EMP"'
    end
    object cdsEmpresaIMP_RENDA_ADICIONAL: TFloatField
      DisplayLabel = 'Adicional do Imposto de Renda'
      FieldName = 'IMP_RENDA_ADICIONAL'
    end
    object cdsEmpresaSIMPLES_EMP: TFloatField
      DisplayLabel = 'Simples'
      FieldName = 'SIMPLES_EMP'
      Origin = '"EMPRESA"."SIMPLES_EMP"'
    end
    object cdsEmpresaMIN_M_LQ_A: TFloatField
      DisplayLabel = 'M'#237'nimo Margem(Lq) P/ Atacado'
      FieldName = 'MIN_M_LQ_A'
      Origin = '"EMPRESA"."MIN_M_LQ_A"'
    end
    object cdsEmpresaMIN_M_LQ_V: TFloatField
      DisplayLabel = 'M'#237'nimo Margem(Lq) P/ Varejo'
      FieldName = 'MIN_M_LQ_V'
      Origin = '"EMPRESA"."MIN_M_LQ_V"'
    end
    object nn: TStringField
      DisplayLabel = 'Perc. p/ Produto Marg. Minima'
      FieldName = 'US_MINM_PROD'
      Origin = '"EMPRESA"."US_MINM_PROD"'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaCPMF_EMP: TFloatField
      DisplayLabel = 'Cpmf'
      FieldName = 'CPMF_EMP'
      Origin = '"EMPRESA"."CPMF_EMP"'
    end
    object cdsEmpresaN_CONC_ASS: TIntegerField
      DisplayLabel = 'C'#243'd. Concess.'
      FieldName = 'N_CONC_ASS'
      Origin = '"EMPRESA"."N_CONC_ASS"'
    end
    object cdsEmpresaCASAS_DECIMAIS: TIntegerField
      DisplayLabel = 'Qtd Casas Decimais'
      FieldName = 'CASAS_DECIMAIS'
      Origin = '"EMPRESA"."CASAS_DECIMAIS"'
    end
    object cdsEmpresaSEG_PROD_SERV: TStringField
      DisplayLabel = 'Segmentar Produtos por Servi'#231'os'
      FieldName = 'SEG_PROD_SERV'
      Origin = '"EMPRESA"."SEG_PROD_SERV"'
      FixedChar = True
      Size = 2
    end
    object cdsEmpresaDIAS_PREC_TAB: TIntegerField
      DisplayLabel = 'Dias p/ Pre'#231'o de Tabela'
      FieldName = 'DIAS_PREC_TAB'
      Origin = '"EMPRESA"."DIAS_PREC_TAB"'
    end
    object cdsEmpresaPRAZO_MED_VND: TIntegerField
      DisplayLabel = 'Prazo M'#233'dio p/ Vnd.'
      FieldName = 'PRAZO_MED_VND'
      Origin = '"EMPRESA"."PRAZO_MED_VND"'
    end
    object cdsEmpresaCUSTO_BOLETA: TFloatField
      DisplayLabel = 'Custo Boleta'
      FieldName = 'CUSTO_BOLETA'
      Origin = '"EMPRESA"."CUSTO_BOLETA"'
    end
    object cdsEmpresaTX_CARTAO: TFloatField
      DisplayLabel = 'Taxa Cart'#227'o'
      FieldName = 'TX_CARTAO'
      Origin = '"EMPRESA"."TX_CARTAO"'
    end
    object cdsEmpresaPERC_VND_CARTAO: TFloatField
      DisplayLabel = 'Perc. de Venda Cart'#227'o'
      FieldName = 'PERC_VND_CARTAO'
      Origin = '"EMPRESA"."PERC_VND_CARTAO"'
    end
    object cdsEmpresaTX_CARTAO_PARC: TFloatField
      DisplayLabel = 'Taxa Cart'#227'o Parcelado'
      FieldName = 'TX_CARTAO_PARC'
      Origin = '"EMPRESA"."TX_CARTAO_PARC"'
    end
    object cdsEmpresaDIAS_REC_FIN: TIntegerField
      DisplayLabel = 'Dias de Rec. Financeira'
      FieldName = 'DIAS_REC_FIN'
      Origin = '"EMPRESA"."DIAS_REC_FIN"'
    end
    object cdsEmpresaADIC_FIN: TFloatField
      DisplayLabel = 'Adic. Cobrado Financeira'
      FieldName = 'ADIC_FIN'
      Origin = '"EMPRESA"."ADIC_FIN"'
    end
    object cdsEmpresaVND_MIN_FIN: TFloatField
      DisplayLabel = 'Valor de Venda Minima finan.'
      FieldName = 'VND_MIN_FIN'
      Origin = '"EMPRESA"."VND_MIN_FIN"'
    end
    object cdsEmpresaVERSAO: TIntegerField
      DisplayLabel = 'Vers'#227'o'
      FieldName = 'VERSAO'
      Origin = '"EMPRESA"."VERSAO"'
    end
    object cdsEmpresaARREDONDA_PRECO: TStringField
      DisplayLabel = 'Arredondar pre'#231'os de produtos'
      FieldName = 'ARREDONDA_PRECO'
      Origin = '"EMPRESA"."ARREDONDA_PRECO"'
      FixedChar = True
      Size = 4
    end
    object cdsEmpresaMENSAGEM_EMP: TStringField
      DisplayLabel = 'Mensagem'
      FieldName = 'MENSAGEM_EMP'
      Origin = '"EMPRESA"."MENSAGEM_EMP"'
      Size = 130
    end
    object cdsEmpresaMAXDESCPARC: TFloatField
      DisplayLabel = 'Max. Desconto em Parcelas(Cxl)'
      FieldName = 'MAXDESCPARC'
      Origin = '"EMPRESA"."MAXDESCPARC"'
    end
    object cdsEmpresaUS_ROMANEIO: TStringField
      DisplayLabel = 'Usar Impr. por Romaneio'
      FieldName = 'US_ROMANEIO'
      Origin = '"EMPRESA"."US_ROMANEIO"'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaALMOX: TStringField
      DisplayLabel = 'Usar Controle de Estoque Fechado'
      FieldName = 'ALMOX'
      Origin = '"EMPRESA"."ALMOX"'
      FixedChar = True
      Size = 2
    end
    object cdsEmpresaATIVO: TIntegerField
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
      Origin = '"EMPRESA"."ATIVO"'
    end
    object cdsEmpresaUS_DECL_REQ: TStringField
      DisplayLabel = 'Usar Declara'#231#227'o Req.'
      FieldName = 'US_DECL_REQ'
      Origin = '"EMPRESA"."US_DECL_REQ"'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaAT_PRECREP: TStringField
      DisplayLabel = 'Alterar Pre'#231'o Repos.'
      FieldName = 'AT_PRECREP'
      Origin = '"EMPRESA"."AT_PRECREP"'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaUSPREVENDA: TStringField
      DisplayLabel = 'Usar DAV ECF Req.'
      FieldName = 'USPREVENDA'
      Origin = '"EMPRESA"."USPREVENDA"'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaUSPREVENDA_OS: TStringField
      DisplayLabel = 'Usar DAV ECF O.S.'
      FieldName = 'USPREVENDA_OS'
      Origin = '"EMPRESA"."USPREVENDA_OS"'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaAUT_SERV_CUPOM: TStringField
      DisplayLabel = 'Emitir cupom de servi'#231'os'
      FieldName = 'AUT_SERV_CUPOM'
      Origin = '"EMPRESA"."AUT_SERV_CUPOM"'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaSUB_SERIE: TIntegerField
      DisplayLabel = 'Sub S'#233'rie da Nf Venda'
      FieldName = 'SUB_SERIE'
      Origin = '"EMPRESA"."SUB_SERIE"'
    end
    object cdsEmpresaSEQ_ARQ_REMESSA: TIntegerField
      DisplayLabel = 'Sequencia Arquivo Remessa'
      FieldName = 'SEQ_ARQ_REMESSA'
      Origin = '"EMPRESA"."SEQ_ARQ_REMESSA"'
    end
    object cdsEmpresaRECIBO_HTML_BOLETO: TBlobField
      Tag = 1
      DisplayLabel = 'Layout Recibo Boleto Html'
      FieldName = 'RECIBO_HTML_BOLETO'
      Origin = '"EMPRESA"."RECIBO_HTML_BOLETO"'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
    object cdsEmpresaATRIBUIR_DATA_SERVIDOR: TStringField
      DisplayLabel = 'Atribuir data do servidor  em fechamento de vendas'
      FieldName = 'ATRIBUIR_DATA_SERVIDOR'
      Origin = '"EMPRESA"."ATRIBUIR_DATA_SERVIDOR"'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaCFOP_PAD_PROD: TFloatField
      DisplayLabel = 'CFOP Padr'#227'o para Produtos'
      FieldName = 'CFOP_PAD_PROD'
      Origin = '"EMPRESA"."CFOP_PAD_PROD"'
    end
    object cdsEmpresaCFOP_PAD_SERV: TFloatField
      DisplayLabel = 'CFOP Padr'#227'o para Servi'#231'os'
      FieldName = 'CFOP_PAD_SERV'
      Origin = '"EMPRESA"."CFOP_PAD_SERV"'
    end
    object cdsEmpresaQTDE_CARAC_ITENSNF: TIntegerField
      DisplayLabel = 'Qtde Caracteres Desc Itens'
      FieldName = 'QTDE_CARAC_ITENSNF'
      Origin = '"EMPRESA"."QTDE_CARAC_ITENSNF"'
    end
    object cdsEmpresaENDERECOHWFFDB: TStringField
      DisplayLabel = 'Endere'#231'o HWF.FDB Serv.'
      FieldName = 'ENDERECOHWFFDB'
      Origin = '"EMPRESA"."ENDERECOHWFFDB"'
      Size = 50
    end
    object cdsEmpresaITAUTO: TStringField
      DisplayLabel = 'Transf. Automacao'
      FieldName = 'ITAUTO'
      Origin = '"EMPRESA"."ITAUTO"'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaTPIMPRE: TStringField
      DisplayLabel = 'Tipo Impress.'
      FieldName = 'TPIMPRE'
      Origin = '"EMPRESA"."TPIMPRE"'
      FixedChar = True
      Size = 15
    end
    object cdsEmpresaCODBARRADO: TIntegerField
      DisplayLabel = 'C'#243'digo Barrado'
      FieldName = 'CODBARRADO'
      Origin = '"EMPRESA"."CODBARRADO"'
    end
    object cdsEmpresaCODDBARRADO: TIntegerField
      DisplayLabel = 'C'#243'digo Liberado'
      FieldName = 'CODDBARRADO'
      Origin = '"EMPRESA"."CODDBARRADO"'
    end
    object cdsEmpresaNOME_CDL: TStringField
      DisplayLabel = 'Nome CDL'
      FieldName = 'NOME_CDL'
      Origin = '"EMPRESA"."NOME_CDL"'
      FixedChar = True
      Size = 60
    end
    object cdsEmpresaUF_CDL: TStringField
      DisplayLabel = 'UF'
      FieldName = 'UF_CDL'
      Origin = '"EMPRESA"."UF_CDL"'
      FixedChar = True
      Size = 2
    end
    object cdsEmpresaFONE_CDL: TStringField
      DisplayLabel = 'Fone CDL'
      FieldName = 'FONE_CDL'
      Origin = '"EMPRESA"."FONE_CDL"'
      EditMask = '(99) 9999-9999;0;_'
      FixedChar = True
      Size = 13
    end
    object cdsEmpresaENDERECO_CDL: TStringField
      DisplayLabel = 'Endere'#231'o'
      FieldName = 'ENDERECO_CDL'
      Origin = '"EMPRESA"."ENDERECO_CDL"'
      FixedChar = True
      Size = 30
    end
    object cdsEmpresaBAIRRO_CDL: TStringField
      DisplayLabel = 'Bairro CDL'
      FieldName = 'BAIRRO_CDL'
      Origin = '"EMPRESA"."BAIRRO_CDL"'
      FixedChar = True
      Size = 25
    end
    object cdsEmpresaCOD_EMP_CDL: TIntegerField
      DisplayLabel = 'N'#250'mero Emp. CDL'
      FieldName = 'COD_EMP_CDL'
      Origin = '"EMPRESA"."COD_EMP_CDL"'
    end
    object cdsEmpresaDIAS_CAR_JUROS: TIntegerField
      FieldName = 'DIAS_CAR_JUROS'
      Origin = '"EMPRESA"."DIAS_CAR_JUROS"'
    end
    object cdsEmpresaORDERBY_CRED: TStringField
      DisplayLabel = 'Ordem de Pesquisa de Cr'#233'dito'
      FieldName = 'ORDERBY_CRED'
      Origin = '"EMPRESA"."ORDERBY_CRED"'
    end
    object cdsEmpresaORDERBY_CH: TStringField
      DisplayLabel = 'Ordem de Pesquisa de Cheque'
      FieldName = 'ORDERBY_CH'
      Origin = '"EMPRESA"."ORDERBY_CH"'
    end
    object cdsEmpresaESTADO_EMP: TStringField
      FieldName = 'ESTADO_EMP'
      Origin = '"EMPRESA"."ESTADO_EMP"'
      FixedChar = True
      Size = 2
    end
    object cdsEmpresaNFE_CAMINHO_CERT: TStringField
      DisplayLabel = 'End. Certificado'
      DisplayWidth = 256
      FieldName = 'NFE_CAMINHO_CERT'
      Origin = '"EMPRESA"."NFE_CAMINHO_CERT"'
      Size = 256
    end
    object cdsEmpresaNFE_SENHA__CERT: TStringField
      DisplayLabel = 'Senha Certificado'
      FieldName = 'NFE_SENHA__CERT'
      Origin = '"EMPRESA"."NFE_SENHA__CERT"'
      Size = 30
    end
    object cdsEmpresaNFE_NUMSERIE_CERT: TStringField
      DisplayLabel = 'Num S'#233'rie Certificado'
      FieldName = 'NFE_NUMSERIE_CERT'
      Origin = '"EMPRESA"."NFE_NUMSERIE_CERT"'
      Size = 50
    end
    object cdsEmpresaNFE_DANFE_TIPO: TStringField
      DisplayLabel = 'Tipo de DANFE'
      FieldName = 'NFE_DANFE_TIPO'
      Origin = '"EMPRESA"."NFE_DANFE_TIPO"'
      Size = 15
    end
    object cdsEmpresaNFE_DANFE_FOREMISS: TStringField
      DisplayLabel = 'Forma Emiss NF-e'
      FieldName = 'NFE_DANFE_FOREMISS'
      Origin = '"EMPRESA"."NFE_DANFE_FOREMISS"'
      Size = 15
    end
    object cdsEmpresaNFE_LOGOMARCA: TStringField
      DisplayLabel = 'Caminho Logo'
      FieldName = 'NFE_LOGOMARCA'
      Origin = '"EMPRESA"."NFE_LOGOMARCA"'
      Size = 100
    end
    object cdsEmpresaNFE_LOGPATH: TStringField
      DisplayLabel = 'Caminho XML'
      FieldName = 'NFE_LOGPATH'
      Origin = '"EMPRESA"."NFE_LOGPATH"'
      Size = 100
    end
    object cdsEmpresaWEBSERV_UF: TStringField
      DisplayLabel = 'UF WebService'
      FieldName = 'WEBSERV_UF'
      Origin = '"EMPRESA"."WEBSERV_UF"'
      Size = 2
    end
    object cdsEmpresaWEBSERV_AMBIENTE: TStringField
      DisplayLabel = 'Ambiente WebService'
      FieldName = 'WEBSERV_AMBIENTE'
      Origin = '"EMPRESA"."WEBSERV_AMBIENTE"'
      Size = 15
    end
    object cdsEmpresaWEBSERV_VISUALIZAR: TStringField
      DisplayLabel = 'Visualizar WebService'
      FieldName = 'WEBSERV_VISUALIZAR'
      Origin = '"EMPRESA"."WEBSERV_VISUALIZAR"'
      Size = 5
    end
    object cdsEmpresaDIAS_AVISO: TIntegerField
      DisplayLabel = 'Dias Aviso'
      FieldName = 'DIAS_AVISO'
      Origin = '"EMPRESA"."DIAS_AVISO"'
    end
    object cdsEmpresaNFE_ENDRELRAVE: TStringField
      DisplayLabel = 'End Modelo DANFE'
      FieldName = 'NFE_ENDRELRAVE'
      Origin = '"EMPRESA"."NFE_ENDRELRAVE"'
      Size = 80
    end
    object cdsEmpresaNFE_ENDERECOPDF: TStringField
      DisplayLabel = 'End exportar PDF'
      FieldName = 'NFE_ENDERECOPDF'
      Origin = '"EMPRESA"."NFE_ENDERECOPDF"'
      Size = 80
    end
    object cdsEmpresaPORTA_SMTP: TIntegerField
      DisplayLabel = 'Porta SMTP'
      FieldName = 'PORTA_SMTP'
      Origin = '"EMPRESA"."PORTA_SMTP"'
    end
    object cdsEmpresaENVIAEMAILNFE: TStringField
      DisplayLabel = 'Enviar e-mail NF-e'
      FieldName = 'ENVIAEMAILNFE'
      Origin = '"EMPRESA"."ENVIAEMAILNFE"'
      Size = 1
    end
    object cdsEmpresaASSUNTO_NFE: TStringField
      DisplayLabel = 'Assunto e-mail'
      FieldName = 'ASSUNTO_NFE'
      Origin = '"EMPRESA"."ASSUNTO_NFE"'
      Size = 70
    end
    object cdsEmpresaEMAIL_USASSL: TStringField
      DisplayLabel = 'Usar SSL'
      FieldName = 'EMAIL_USASSL'
      Origin = '"EMPRESA"."EMAIL_USASSL"'
      Size = 1
    end
    object cdsEmpresaEMAIL_SENHA: TStringField
      DisplayLabel = 'Senha e-mail'
      FieldName = 'EMAIL_SENHA'
      Origin = '"EMPRESA"."EMAIL_SENHA"'
      Size = 30
    end
    object cdsEmpresaMENSAGEM_NFE: TBlobField
      DisplayLabel = 'Mensagem e-mail'
      FieldName = 'MENSAGEM_NFE'
      Origin = '"EMPRESA"."MENSAGEM_NFE"'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
    object cdsEmpresaIBGE_COD_CIDADE: TIntegerField
      DisplayLabel = 'Cod IBGE Cidade'
      FieldName = 'IBGE_COD_CIDADE'
      Origin = '"EMPRESA"."IBGE_COD_CIDADE"'
    end
    object cdsEmpresaIBGE_CODIGO_UF: TIntegerField
      DisplayLabel = 'Cod IBGE Estado'
      FieldName = 'IBGE_CODIGO_UF'
      Origin = '"EMPRESA"."IBGE_CODIGO_UF"'
    end
    object cdsEmpresaMODELO_NF: TStringField
      DisplayLabel = 'Modelo NF-e'
      FieldName = 'MODELO_NF'
      Origin = '"EMPRESA"."MODELO_NF"'
      Size = 3
    end
    object cdsEmpresaSERIE_SCAN: TIntegerField
      DisplayLabel = 'S'#233'rie SCAN'
      FieldName = 'SERIE_SCAN'
      Origin = '"EMPRESA"."SERIE_SCAN"'
    end
    object cdsEmpresaUSO_SERVICO_NFE: TStringField
      DisplayLabel = 'Usar Servi'#231'o NF-e'
      FieldName = 'USO_SERVICO_NFE'
      Origin = '"EMPRESA"."USO_SERVICO_NFE"'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaSERIE_SERV_NFE: TIntegerField
      DisplayLabel = 'S'#233'rie Servi'#231'o NF-e:'
      FieldName = 'SERIE_SERV_NFE'
      Origin = '"EMPRESA"."SERIE_SERV_NFE"'
    end
    object cdsEmpresaMODELO_NF_SERV: TStringField
      DisplayLabel = 'Modelo NF-e Servi'#231'o'
      FieldName = 'MODELO_NF_SERV'
      Origin = '"EMPRESA"."MODELO_NF_SERV"'
      Size = 3
    end
    object cdsEmpresaUS_EDICAOCLIENTE_VENDA: TStringField
      DisplayLabel = 'Editar cadastro do cliente na venda'
      FieldName = 'US_EDICAOCLIENTE_VENDA'
      Origin = '"EMPRESA"."US_EDICAOCLIENTE_VENDA"'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaREGIME: TStringField
      DisplayLabel = 'Regime'
      FieldName = 'REGIME'
      Origin = '"EMPRESA"."REGIME"'
    end
    object cdsEmpresaCOD_EMP: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Emp.'
      FieldName = 'COD_EMP'
      Origin = '"EMPRESA"."COD_EMP"'
    end
    object cdsEmpresaNUM_CREDENC_INTERVENTOR: TStringField
      DisplayLabel = 'N'#186' do Termo de Creden.'
      FieldName = 'NUM_CREDENC_INTERVENTOR'
      Origin = '"EMPRESA"."NUM_CREDENC_INTERVENTOR"'
    end
    object cdsEmpresaFANTASIA_EMP: TStringField
      DisplayLabel = 'Nome Fantasia'
      FieldName = 'FANTASIA_EMP'
      Origin = '"EMPRESA"."FANTASIA_EMP"'
      Size = 50
    end
    object cdsEmpresaSPED_IND_PERFIL: TStringField
      DisplayLabel = 'Ind Perfil SPED'
      FieldName = 'SPED_IND_PERFIL'
      Origin = '"EMPRESA"."SPED_IND_PERFIL"'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaSPED_SUFRAMA: TStringField
      DisplayLabel = 'SUFRAMA'
      FieldName = 'SPED_SUFRAMA'
      Origin = '"EMPRESA"."SPED_SUFRAMA"'
      Size = 9
    end
    object cdsEmpresaSPED_IND_ATIV: TIntegerField
      DisplayLabel = 'Ind Atividade'
      FieldName = 'SPED_IND_ATIV'
      Origin = '"EMPRESA"."SPED_IND_ATIV"'
    end
    object cdsEmpresaCOD_CONTADOR: TIntegerField
      DisplayLabel = 'Contador'
      FieldName = 'COD_CONTADOR'
      Origin = '"EMPRESA"."COD_CONTADOR"'
    end
    object cdsEmpresaCOMPLEMENTO_EMP: TStringField
      DisplayLabel = 'Complemento'
      FieldName = 'COMPLEMENTO_EMP'
      Origin = '"EMPRESA"."COMPLEMENTO_EMP"'
      Size = 50
    end
    object cdsEmpresaALIQ_SIMPLES_ICM: TFloatField
      DisplayLabel = 'ICMS Simples'
      FieldName = 'ALIQ_SIMPLES_ICM'
      Origin = '"EMPRESA"."ALIQ_SIMPLES_ICM"'
    end
    object cdsEmpresaALIQ_SIMPLES_ISS: TFloatField
      DisplayLabel = 'ISS Simples'
      FieldName = 'ALIQ_SIMPLES_ISS'
      Origin = '"EMPRESA"."ALIQ_SIMPLES_ISS"'
    end
    object cdsEmpresaCODDEPPRODUTOS: TIntegerField
      DisplayLabel = 'Cod Depto de '
      FieldName = 'CODDEPPRODUTOS'
      Origin = '"EMPRESA"."CODDEPPRODUTOS"'
    end
    object cdsEmpresaCODDEPOFICINA: TIntegerField
      FieldName = 'CODDEPOFICINA'
      Origin = '"EMPRESA"."CODDEPOFICINA"'
    end
    object cdsEmpresaCODDEPVEICULOS: TIntegerField
      FieldName = 'CODDEPVEICULOS'
      Origin = '"EMPRESA"."CODDEPVEICULOS"'
    end
    object cdsEmpresaDIAS_TRABALHO_MES: TIntegerField
      FieldName = 'DIAS_TRABALHO_MES'
      Origin = '"EMPRESA"."DIAS_TRABALHO_MES"'
    end
    object cdsEmpresaUSAR_REGRAS_NCM: TStringField
      DisplayLabel = 'Usar Regras de NCM'
      FieldName = 'USAR_REGRAS_NCM'
      Origin = '"EMPRESA"."USAR_REGRAS_NCM"'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaEST_SEGURACAPROD: TIntegerField
      DisplayLabel = 'Estoque de Seguran'#231'a Padr'#227'o'
      FieldName = 'EST_SEGURACAPROD'
      Origin = '"EMPRESA"."EST_SEGURACAPROD"'
    end
    object cdsEmpresaNFE_GRAVALOG: TStringField
      DisplayLabel = 'Gravar Log das NF-E'
      FieldName = 'NFE_GRAVALOG'
      Origin = '"EMPRESA"."NFE_GRAVALOG"'
      Size = 1
    end
    object cdsEmpresaNFE_TMPRETORNOMIL: TIntegerField
      DisplayLabel = 'Tempo de espera em milisegundos'
      FieldName = 'NFE_TMPRETORNOMIL'
      Origin = '"EMPRESA"."NFE_TMPRETORNOMIL"'
    end
    object cdsEmpresaNFE_QTDELIMITENFPEND: TIntegerField
      DisplayLabel = 'Qtde M'#225'x. NF-e sem autoriza'#231#227'o'
      FieldName = 'NFE_QTDELIMITENFPEND'
      Origin = '"EMPRESA"."NFE_QTDELIMITENFPEND"'
    end
    object cdsEmpresaNFEPENDEMDIAS: TIntegerField
      DisplayLabel = 'Qtde M'#225'x. dias NF sem autoriza'#231#227'o'
      FieldName = 'NFEPENDEMDIAS'
      Origin = '"EMPRESA"."NFEPENDEMDIAS"'
    end
    object cdsEmpresaCNAE_FISCAL: TStringField
      DisplayLabel = 'CNAE Fiscal'
      FieldName = 'CNAE_FISCAL'
      Origin = '"EMPRESA"."CNAE_FISCAL"'
      Size = 7
    end
    object cdsEmpresaDESCONSIDERAR_ICMS_NFENT: TStringField
      DisplayLabel = 'Desconsid ICM NFe - Xml'
      FieldName = 'DESCONSIDERAR_ICMS_NFENT'
      Origin = '"EMPRESA"."DESCONSIDERAR_ICMS_NFENT"'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaBUSCA_COD_NO_PROD: TStringField
      DisplayLabel = 'Busca Codigo No Produto'
      FieldName = 'BUSCA_COD_NO_PROD'
      Origin = '"EMPRESA"."BUSCA_COD_NO_PROD"'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaCONF_FORMPAGAMENTO: TStringField
      DisplayLabel = 'Forma de Pagamento'
      FieldName = 'CONF_FORMPAGAMENTO'
      Origin = '"EMPRESA"."CONF_FORMPAGAMENTO"'
      FixedChar = True
      Size = 3
    end
    object cdsEmpresaCOD_SERV_PADRAO: TIntegerField
      FieldName = 'COD_SERV_PADRAO'
      Origin = '"EMPRESA"."COD_SERV_PADRAO"'
    end
    object cdsEmpresaMS_VAL_LIQ_NFE: TStringField
      FieldName = 'MS_VAL_LIQ_NFE'
      Origin = '"EMPRESA"."MS_VAL_LIQ_NFE"'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaNFS_NATOP: TIntegerField
      FieldName = 'NFS_NATOP'
      Origin = '"EMPRESA"."NFS_NATOP"'
    end
    object cdsEmpresaNFS_REGIMETRIB: TIntegerField
      FieldName = 'NFS_REGIMETRIB'
      Origin = '"EMPRESA"."NFS_REGIMETRIB"'
    end
    object cdsEmpresaNFS_OPTANTESIMPLES: TIntegerField
      FieldName = 'NFS_OPTANTESIMPLES'
      Origin = '"EMPRESA"."NFS_OPTANTESIMPLES"'
    end
    object cdsEmpresaINCENTIVADORCULT: TIntegerField
      FieldName = 'INCENTIVADORCULT'
      Origin = '"EMPRESA"."INCENTIVADORCULT"'
    end
    object cdsEmpresaNFS_CERT: TStringField
      DisplayWidth = 300
      FieldName = 'NFS_CERT'
      Origin = '"EMPRESA"."NFS_CERT"'
      Size = 300
    end
    object cdsEmpresaENV_NFSE: TStringField
      FieldName = 'ENV_NFSE'
      Origin = '"EMPRESA"."ENV_NFSE"'
      Size = 5
    end
    object cdsEmpresaENDERECO_PREF: TStringField
      FieldName = 'ENDERECO_PREF'
      Origin = '"EMPRESA"."ENDERECO_PREF"'
      Size = 50
    end
    object cdsEmpresaBAIRRO_PREF: TStringField
      FieldName = 'BAIRRO_PREF'
      Origin = '"EMPRESA"."BAIRRO_PREF"'
      Size = 30
    end
    object cdsEmpresaCEP_PREF: TStringField
      FieldName = 'CEP_PREF'
      Origin = '"EMPRESA"."CEP_PREF"'
      FixedChar = True
      Size = 9
    end
    object cdsEmpresaLICENCANFSE: TStringField
      FieldName = 'LICENCANFSE'
      Origin = '"EMPRESA"."LICENCANFSE"'
      Size = 300
    end
    object cdsEmpresaPORTA_SMTPTSL: TIntegerField
      FieldName = 'PORTA_SMTPTSL'
      Origin = '"EMPRESA"."PORTA_SMTPTSL"'
    end
    object cdsEmpresaCONFERIR_DIFERENCA_ENTRADA: TStringField
      DisplayLabel = 'Conf Dif Ent NF'
      FieldName = 'CONFERIR_DIFERENCA_ENTRADA'
      Origin = '"EMPRESA"."CONFERIR_DIFERENCA_ENTRADA"'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaMAXIMO_DIFERENCA_ENTRADA: TFloatField
      DisplayLabel = 'Max Dif Ent NF'
      FieldName = 'MAXIMO_DIFERENCA_ENTRADA'
      Origin = '"EMPRESA"."MAXIMO_DIFERENCA_ENTRADA"'
      DisplayFormat = '##0.00'
    end
    object cdsEmpresaCOD_SERV_PAD_RETORNO: TIntegerField
      DisplayLabel = 'Cod Serv Padrao Retorno'
      FieldName = 'COD_SERV_PAD_RETORNO'
      Origin = '"EMPRESA"."COD_SERV_PAD_RETORNO"'
    end
    object cdsEmpresaPLACA_PAD_RETORNO: TStringField
      DisplayLabel = 'Placa Padrao O.S. Retorno'
      FieldName = 'PLACA_PAD_RETORNO'
      Origin = '"EMPRESA"."PLACA_PAD_RETORNO"'
      FixedChar = True
      Size = 7
    end
    object cdsEmpresaSPED_MATRIZ_FILIAL: TStringField
      DisplayLabel = 'Matriz/Filial'
      FieldName = 'SPED_MATRIZ_FILIAL'
      Origin = '"EMPRESA"."SPED_MATRIZ_FILIAL"'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaSPED_IND_NAT_PJ: TStringField
      DisplayLabel = 'Natureza PJ'
      FieldName = 'SPED_IND_NAT_PJ'
      Origin = '"EMPRESA"."SPED_IND_NAT_PJ"'
      FixedChar = True
      Size = 2
    end
    object cdsEmpresaSPED_COD_INC_TRIB: TSmallintField
      DisplayLabel = 'Ind Incidencia Trib'
      FieldName = 'SPED_COD_INC_TRIB'
      Origin = '"EMPRESA"."SPED_COD_INC_TRIB"'
    end
    object cdsEmpresaSPED_IND_APRO_CRED: TSmallintField
      DisplayLabel = 'Ind apropropria'#231#227'o Cred'
      FieldName = 'SPED_IND_APRO_CRED'
      Origin = '"EMPRESA"."SPED_IND_APRO_CRED"'
    end
    object cdsEmpresaSPED_COD_TIPO_CONT: TSmallintField
      DisplayLabel = 'Ind Tipo de Contrib'
      FieldName = 'SPED_COD_TIPO_CONT'
      Origin = '"EMPRESA"."SPED_COD_TIPO_CONT"'
    end
    object cdsEmpresaGERAR_SPED_PISCOFINS: TStringField
      DisplayLabel = 'Gerar SPED PIS/COFINS?'
      FieldName = 'GERAR_SPED_PISCOFINS'
      Origin = '"EMPRESA"."GERAR_SPED_PISCOFINS"'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaCFOP_PAD_DEVOLUCAO: TFloatField
      DisplayLabel = 'CFOP Padrao Devolu'#231#227'o'
      FieldName = 'CFOP_PAD_DEVOLUCAO'
      Origin = '"EMPRESA"."CFOP_PAD_DEVOLUCAO"'
    end
    object cdsEmpresaUSAR_REGRA_CFOP_CST_ENTRADA: TStringField
      DisplayLabel = 'Usar regras CFOP CST Entrada'
      FieldName = 'USAR_REGRA_CFOP_CST_ENTRADA'
      Origin = '"EMPRESA"."USAR_REGRA_CFOP_CST_ENTRADA"'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaUSAR_REGRA_CFOP_CST_SAIDA: TStringField
      DisplayLabel = 'Usar regras CFOP CST na Sa'#237'da'
      FieldName = 'USAR_REGRA_CFOP_CST_SAIDA'
      Origin = '"EMPRESA"."USAR_REGRA_CFOP_CST_SAIDA"'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaTIPV_VENDARAPIDA: TStringField
      FieldName = 'TIPV_VENDARAPIDA'
      Origin = '"EMPRESA"."TIPV_VENDARAPIDA"'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaQUITARBOLETOPELOSISTEMA: TStringField
      DisplayLabel = 'Quitar boletos pelo sistema'
      FieldName = 'QUITARBOLETOPELOSISTEMA'
      Origin = '"EMPRESA"."QUITARBOLETOPELOSISTEMA"'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaCODIGO_PRODUTO_SEQUENCIAL: TStringField
      DisplayLabel = 'Codigo Sequencial no Produto'
      FieldName = 'CODIGO_PRODUTO_SEQUENCIAL'
      Origin = '"EMPRESA"."CODIGO_PRODUTO_SEQUENCIAL"'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaDIGITOSGRUP: TSmallintField
      DisplayLabel = 'M'#225'scara Digitos Grupo'
      FieldName = 'DIGITOSGRUP'
      Origin = '"EMPRESA"."DIGITOSGRUP"'
    end
    object cdsEmpresaDIGITOSEMP: TSmallintField
      DisplayLabel = 'M'#225'scara Digitos Empresa'
      FieldName = 'DIGITOSEMP'
      Origin = '"EMPRESA"."DIGITOSEMP"'
    end
    object cdsEmpresaIMPRIMIRBOLETONF: TStringField
      DisplayLabel = 'Imprimir boleto pela Nota Fiscal'
      FieldName = 'IMPRIMIRBOLETONF'
      Origin = '"EMPRESA"."IMPRIMIRBOLETONF"'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaIMPRIMIRBOLETO_OS: TStringField
      DisplayLabel = 'Imprimir boleto pela OS'
      FieldName = 'IMPRIMIRBOLETO_OS'
      Origin = '"EMPRESA"."IMPRIMIRBOLETO_OS"'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaTIPOORC_ORCRAPIDO: TStringField
      DisplayLabel = 'Tipo Orc Padrao'
      FieldName = 'TIPOORC_ORCRAPIDO'
      Origin = '"EMPRESA"."TIPOORC_ORCRAPIDO"'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaUSAR_BARRAMENTO_AUTOMATICO: TStringField
      DisplayLabel = 'Usar Barramento Autom'#225'tico?'
      FieldName = 'USAR_BARRAMENTO_AUTOMATICO'
      Origin = '"EMPRESA"."USAR_BARRAMENTO_AUTOMATICO"'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaDTDEF_CLASSEP: TDateTimeField
      FieldName = 'DTDEF_CLASSEP'
      Origin = '"EMPRESA"."DTDEF_CLASSEP"'
    end
    object cdsEmpresaDTDEFINICAO_GE: TDateTimeField
      FieldName = 'DTDEFINICAO_GE'
      Origin = '"EMPRESA"."DTDEFINICAO_GE"'
    end
    object cdsEmpresaQTDMES_CLASSEP: TIntegerField
      FieldName = 'QTDMES_CLASSEP'
      Origin = '"EMPRESA"."QTDMES_CLASSEP"'
    end
    object cdsEmpresaQTDMES_GE: TIntegerField
      FieldName = 'QTDMES_GE'
      Origin = '"EMPRESA"."QTDMES_GE"'
    end
    object cdsEmpresaDTDEF_CLASSE_S: TDateTimeField
      FieldName = 'DTDEF_CLASSE_S'
      Origin = '"EMPRESA"."DTDEF_CLASSE_S"'
    end
    object cdsEmpresaQTDMES_CLASSE_S: TIntegerField
      FieldName = 'QTDMES_CLASSE_S'
      Origin = '"EMPRESA"."QTDMES_CLASSE_S"'
    end
    object cdsEmpresaFILTRAR_TIP_CNT: TStringField
      DisplayLabel = 'Filtrar Contas a Pagar'
      FieldName = 'FILTRAR_TIP_CNT'
      Origin = '"EMPRESA"."FILTRAR_TIP_CNT"'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaSPED_IND_REG_CUM: TSmallintField
      DisplayLabel = 'Ind Crit Escrit - SEPD'
      FieldName = 'SPED_IND_REG_CUM'
      Origin = '"EMPRESA"."SPED_IND_REG_CUM"'
    end
    object cdsEmpresaNF_USAR_FORMAPAG_PED: TStringField
      DisplayLabel = 'Na Nota Fiscal Usar Formas de pagamento do Pedido'
      FieldName = 'NF_USAR_FORMAPAG_PED'
      Origin = '"EMPRESA"."NF_USAR_FORMAPAG_PED"'
      Size = 1
    end
    object cdsEmpresaVERSAO_RETAGUARDA: TIntegerField
      DisplayLabel = 'Ver'#227'o Sistema Retaguarda'
      FieldName = 'VERSAO_RETAGUARDA'
      Origin = '"EMPRESA"."VERSAO_RETAGUARDA"'
    end
    object cdsEmpresaUSARMARKUPPRODVND: TStringField
      FieldName = 'USARMARKUPPRODVND'
      Origin = '"EMPRESA"."USARMARKUPPRODVND"'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaUSAR_CLIENTE_PRODUCAO: TStringField
      DisplayLabel = 'Usar Cliente na Produ'#231#227'o'
      FieldName = 'USAR_CLIENTE_PRODUCAO'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaUSAR_PRODUCAO_TIPO: TStringField
      DisplayLabel = 'Usar M'#243'dulo de Produ'#231#227'o'
      FieldName = 'USAR_PRODUCAO_TIPO'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaPRECISAO_PRODUCAO_D: TSmallintField
      DisplayLabel = 'Precis'#227'o do M'#243'dulo de Produ'#231#227'o Detalhada'
      FieldName = 'PRECISAO_PRODUCAO_D'
    end
    object cdsEmpresaOC_VENDEDOR_POR_SETOR: TStringField
      DisplayLabel = 'OC: Vendedor no Setor'
      FieldName = 'OC_VENDEDOR_POR_SETOR'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaOC_TIPO_CONTROLE: TStringField
      DisplayLabel = 'OC: Tipo Controle'
      FieldName = 'OC_TIPO_CONTROLE'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaOC_USAR_ORDEM_CARREGAMENTO: TStringField
      DisplayLabel = 'OC: Usar Ordem de Carregamento'
      FieldName = 'OC_USAR_ORDEM_CARREGAMENTO'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaOC_TIPO_PADRAO_ENTREGA: TStringField
      DisplayLabel = 'OC: Tipo Entrega'
      FieldName = 'OC_TIPO_PADRAO_ENTREGA'
      Size = 10
    end
    object cdsEmpresaOC_EFETUAR_CONFERENCIA: TStringField
      DisplayLabel = 'OC: Efetuar Conferencia'
      FieldName = 'OC_EFETUAR_CONFERENCIA'
      Size = 1
    end
    object cdsEmpresaVENDA_APROVACAO_GERENCIA: TStringField
      DisplayLabel = 'Vnd: Aprovacao Gerente'
      FieldName = 'VENDA_APROVACAO_GERENCIA'
      Size = 1
    end
    object cdsEmpresaUSAR_DEVOLUCAO_INTERNA: TStringField
      DisplayLabel = 'Usar Controle Interno Devolu'#231#227'o'
      FieldName = 'USAR_DEVOLUCAO_INTERNA'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaMONTAR_REQ_AUT_NF: TStringField
      DisplayLabel = 'Montar Requisi'#231#227'o Ao emitir NF'
      FieldName = 'MONTAR_REQ_AUT_NF'
      Size = 1
    end
    object cdsEmpresaNF_VFE_USAR: TStringField
      DisplayLabel = 'Usar lan'#231'amentos de NF de venda fora do estabelecimento'
      FieldName = 'NF_VFE_USAR'
      Size = 1
    end
    object cdsEmpresaNF_VFE_SERIE: TStringField
      DisplayLabel = 'S'#233'rie da NF venda fora do estabelecimento'
      FieldName = 'NF_VFE_SERIE'
      Size = 3
    end
    object cdsEmpresaNF_VFE_MODELO: TStringField
      DisplayLabel = 'Modelo NF Venda fora do estabelecimento'
      FieldName = 'NF_VFE_MODELO'
      Size = 3
    end
    object cdsEmpresaCLI_INICIOVND_RAPIDA: TStringField
      FieldName = 'CLI_INICIOVND_RAPIDA'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaEMAIL_COBRANCA: TStringField
      DisplayLabel = 'E-mail de Cobran'#231'a'
      FieldName = 'EMAIL_COBRANCA'
      Size = 50
    end
    object cdsEmpresaLOGIN_COBRANCA: TStringField
      DisplayLabel = 'Login/e-mail cobran'#231'a'
      FieldName = 'LOGIN_COBRANCA'
      Size = 50
    end
    object cdsEmpresaSENHA_EMAIL_COBRANCA: TStringField
      DisplayLabel = 'Senha do e-mail'
      FieldName = 'SENHA_EMAIL_COBRANCA'
      Size = 32
    end
    object cdsEmpresaREMETENTE_EMAIL_COBRANCA: TStringField
      DisplayLabel = 'Nome do remetente'
      FieldName = 'REMETENTE_EMAIL_COBRANCA'
      Size = 50
    end
    object cdsEmpresaSMTP_COBRANCA: TStringField
      DisplayLabel = 'Servidor SMTP'
      FieldName = 'SMTP_COBRANCA'
      Size = 50
    end
    object cdsEmpresaSMTPPORTA_COBRANCA: TIntegerField
      DisplayLabel = 'PORTA SMTP'
      FieldName = 'SMTPPORTA_COBRANCA'
    end
    object cdsEmpresaASSUNTO_COBRANCA: TStringField
      DisplayLabel = 'Assunto padr'#227'o'
      FieldName = 'ASSUNTO_COBRANCA'
      Size = 70
    end
    object cdsEmpresaMSG_COBRANCA: TMemoField
      DisplayLabel = 'Mensagem padr'#227'o'
      FieldName = 'MSG_COBRANCA'
      BlobType = ftMemo
      Size = 8
    end
    object cdsEmpresaREPETIR_ITEMVND: TStringField
      DisplayLabel = 'Repetir Itens na Venda'
      FieldName = 'REPETIR_ITEMVND'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaUSAR_TELEVENDA: TStringField
      DisplayLabel = 'Usar Televenda'
      FieldName = 'USAR_TELEVENDA'
      Size = 1
    end
    object cdsEmpresaDIAS_CONTATO_TLV: TSmallintField
      DisplayLabel = 'Dias para contato padr'#227'o Televenda'
      FieldName = 'DIAS_CONTATO_TLV'
    end
    object cdsEmpresaCONTRIBUINTE_IPI: TStringField
      DisplayLabel = 'Contribuinte IPI'
      FieldName = 'CONTRIBUINTE_IPI'
      Size = 1
    end
    object cdsEmpresaPAF_USAR_PREVENDA: TStringField
      DisplayLabel = 'Usar Pr'#233'-Venda'
      FieldName = 'PAF_USAR_PREVENDA'
      Size = 1
    end
    object cdsEmpresaAGENDA_OFICINA: TStringField
      Tag = 1
      FieldName = 'AGENDA_OFICINA'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaHORA_MANHA_SEM: TStringField
      Tag = 1
      FieldName = 'HORA_MANHA_SEM'
      FixedChar = True
      Size = 5
    end
    object cdsEmpresaHORA_TARDE_SEM: TStringField
      Tag = 1
      FieldName = 'HORA_TARDE_SEM'
      FixedChar = True
      Size = 5
    end
    object cdsEmpresaHORA_MANHA_SAB: TStringField
      Tag = 1
      FieldName = 'HORA_MANHA_SAB'
      FixedChar = True
      Size = 5
    end
    object cdsEmpresaHORA_TARDE_SAB: TStringField
      Tag = 1
      FieldName = 'HORA_TARDE_SAB'
      FixedChar = True
      Size = 5
    end
    object cdsEmpresaUSAR_DOMINGO_AGENDA: TStringField
      Tag = 1
      FieldName = 'USAR_DOMINGO_AGENDA'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaHORA_MANHA_DOM: TStringField
      Tag = 1
      FieldName = 'HORA_MANHA_DOM'
      FixedChar = True
      Size = 5
    end
    object cdsEmpresaHORA_TARDE_DOM: TStringField
      Tag = 1
      FieldName = 'HORA_TARDE_DOM'
      FixedChar = True
      Size = 5
    end
    object cdsEmpresaQTDE_DIAS_SEM_COMP_CART: TIntegerField
      DisplayLabel = 'Qtde Dias Sem Compra para remover carteira'
      FieldName = 'QTDE_DIAS_SEM_COMP_CART'
    end
    object cdsEmpresaASSOCIAR_CART_VND_TLV: TStringField
      DisplayLabel = 'Associar Carteira ao Vendedor na Televenda'
      DisplayWidth = 1
      FieldName = 'ASSOCIAR_CART_VND_TLV'
    end
    object cdsEmpresaDISPONIBILIDADE_MEC_OS: TStringField
      Tag = 1
      FieldName = 'DISPONIBILIDADE_MEC_OS'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaQUANT_OS_ABERTA_BOX: TSmallintField
      Tag = 1
      FieldName = 'QUANT_OS_ABERTA_BOX'
    end
    object cdsEmpresaVERSAO_ABRASF: TSmallintField
      FieldName = 'VERSAO_ABRASF'
    end
    object cdsEmpresaUSARENVRPSSINCRONO: TStringField
      FieldName = 'USARENVRPSSINCRONO'
      Size = 1
    end
    object cdsEmpresaTIPO_VENDA_REQ_TLVND: TStringField
      DisplayLabel = 'Tipo Venda Televenda'
      FieldName = 'TIPO_VENDA_REQ_TLVND'
      Size = 1
    end
    object cdsEmpresaTIPO_VENDA_OS_TLVND: TStringField
      DisplayLabel = 'Tipo OS Televenda'
      FieldName = 'TIPO_VENDA_OS_TLVND'
      Size = 10
    end
    object cdsEmpresaCOMB_HAB_PROD: TStringField
      Tag = 1
      DisplayLabel = 'Combust. Produto'
      FieldName = 'COMB_HAB_PROD'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaTIPV_VENDAPADRAO: TStringField
      FieldName = 'TIPV_VENDAPADRAO'
      Size = 1
    end
    object cdsEmpresaBOL_CONF_NF: TStringField
      DisplayLabel = 'Confirmar para gerar boletos na NF'
      FieldName = 'BOL_CONF_NF'
      Size = 1
    end
    object cdsEmpresaSPED_APURAR_ST: TStringField
      DisplayLabel = 'Apurar ST (Sped Fiscal)'
      FieldName = 'SPED_APURAR_ST'
      Size = 1
    end
    object cdsEmpresaIND_APUR_IPI: TIntegerField
      DisplayLabel = 'Indicador de Apura'#231#227'o de IPI'
      FieldName = 'IND_APUR_IPI'
    end
    object cdsEmpresaMETODO_PMV: TStringField
      DisplayLabel = 'Metodo para calculo do Prazo medio de venda'
      FieldName = 'METODO_PMV'
      Size = 8
    end
    object cdsEmpresaUSAR_COMISSAO_RECEB_PROP: TStringField
      DisplayLabel = 'Usar comiss'#227'o por Recebimento Proporcional'
      FieldName = 'USAR_COMISSAO_RECEB_PROP'
      Size = 1
    end
    object cdsEmpresaSPED_F_DIA_VENC_ICMS: TSmallintField
      DisplayLabel = 'Sped - Dia Vencimento ICMS'
      FieldName = 'SPED_F_DIA_VENC_ICMS'
    end
    object cdsEmpresaSPED_F_COD_OB_REC_E116: TStringField
      DisplayLabel = 'Sped - Codigo obriga'#231#227'o a recolher de ICMS (E116 - COD_OR)'
      FieldName = 'SPED_F_COD_OB_REC_E116'
      Size = 3
    end
    object cdsEmpresaSPED_F_COD_OB_REC_E250: TStringField
      DisplayLabel = 'Sped - Codigo obriga'#231#227'o a recolher de ICMS ST(E250 - COD_OR)'
      FieldName = 'SPED_F_COD_OB_REC_E250'
      Size = 3
    end
    object cdsEmpresaSPED_F_COD_REC_E116: TStringField
      DisplayLabel = 'Sped - Codigo de receita referente '#224' obriga'#231#227'o (E116 - COD_REC)'
      FieldName = 'SPED_F_COD_REC_E116'
      Size = 64
    end
    object cdsEmpresaSPED_F_COD_REC_E250: TStringField
      DisplayLabel = 'Sped - Codigo de receita referente '#224' obriga'#231#227'o (E250 - COD_REC)'
      FieldName = 'SPED_F_COD_REC_E250'
      Size = 64
    end
    object cdsEmpresaVINCULAR_VEIC_OBJ: TStringField
      DisplayLabel = 'Vincular Veic/Obj ao Servi'#231'o'
      FieldName = 'VINCULAR_VEIC_OBJ'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaINTERV_MENS: TIntegerField
      FieldName = 'INTERV_MENS'
    end
    object cdsEmpresaUSAR_CONTROLE_FP_CLIENTE: TStringField
      DisplayLabel = 'Usar politicas de pagamento do Cliente'
      FieldName = 'USAR_CONTROLE_FP_CLIENTE'
      Size = 1
    end
    object cdsEmpresaUSAR_CONTROLE_FP_VENDA: TStringField
      DisplayLabel = 'Usar politicas de pagamento da Venda'
      FieldName = 'USAR_CONTROLE_FP_VENDA'
      Size = 1
    end
    object cdsEmpresaUSAR_UMA_VND_POR_NF: TStringField
      DisplayLabel = 'Usar uma Venda por Nota Fiscal'
      FieldName = 'USAR_UMA_VND_POR_NF'
      Size = 1
    end
    object cdsEmpresaMAX_DESC_AVISTA: TFloatField
      DisplayLabel = 
        'Percentual M'#225'ximo de desconto a vista a ser permitido no Caixa A' +
        'uxiliar'
      FieldName = 'MAX_DESC_AVISTA'
      DisplayFormat = '##0.00'
    end
    object cdsEmpresaUSAR_ALT_PRECO_ENT_NF: TStringField
      DisplayLabel = 'Usar Alteraca'#231#227'o Pre'#231'o de Venda Digita'#231#227'o Item NF'
      FieldName = 'USAR_ALT_PRECO_ENT_NF'
      Size = 1
    end
    object cdsEmpresaPADRAO_CONSUMIDOR_FINAL: TStringField
      DisplayLabel = 'Cadastrar cliente como consumidor final'
      FieldName = 'PADRAO_CONSUMIDOR_FINAL'
      Size = 1
    end
    object cdsEmpresaUSAR_FECH_CARGA_CXL: TStringField
      DisplayLabel = 'Usar Fechamento Carga CXL'
      FieldName = 'USAR_FECH_CARGA_CXL'
      Size = 1
    end
    object cdsEmpresaREPROCESSARCARTAS: TStringField
      DisplayLabel = 'Reprocessar Cartas de Cobran'#231'a'
      FieldName = 'REPROCESSARCARTAS'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaDIASENTRECARTAS: TIntegerField
      DisplayLabel = 'Dias entre cartas de cobran'#231'a'
      FieldName = 'DIASENTRECARTAS'
    end
    object cdsEmpresaALIQ_TRIB_SERV: TFloatField
      DisplayLabel = 'Aliquota padr'#227'o dos Tributos  para Servi'#231'os (De Olho no Imposto)'
      FieldName = 'ALIQ_TRIB_SERV'
      DisplayFormat = '##0.00'
    end
    object cdsEmpresaALIQ_TRIB_PROD: TFloatField
      DisplayLabel = 'Aliquota padr'#227'o dos Tributos  para Produtos (De Olho no Imposto)'
      FieldName = 'ALIQ_TRIB_PROD'
    end
    object cdsEmpresaUSAR_VR_DEV_FORMPAG: TStringField
      DisplayLabel = 
        'Usar Vale Compra Devolu'#231#245'es Automaticamente na Forma de Pagament' +
        'o'
      FieldName = 'USAR_VR_DEV_FORMPAG'
      Size = 1
    end
    object cdsEmpresaURL_SUPORTE_ONLINE: TStringField
      DisplayLabel = 'Url de Suporte Online'
      FieldName = 'URL_SUPORTE_ONLINE'
      Size = 256
    end
    object cdsEmpresaEMAIL_COB_AUTENTICAR: TStringField
      DisplayLabel = 'Autentica'#231#227'o no e-mail Cobran'#231'a'
      FieldName = 'EMAIL_COB_AUTENTICAR'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaEMAIL_COB_SEGURANCASSL: TStringField
      DisplayLabel = 'Conex'#227'o SSL no e-mail Cobran'#231'a'
      FieldName = 'EMAIL_COB_SEGURANCASSL'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaXML_NFE_USAR_COR: TStringField
      DisplayLabel = 'Usar c'#243'digo da cor do Fabricante ou DENATRAN vindo do XML'
      FieldName = 'XML_NFE_USAR_COR'
      Size = 1
    end
    object cdsEmpresaVERSAO_VEICULO: TStringField
      Tag = 1
      FieldName = 'VERSAO_VEICULO'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaCLIENTE_ALMOX: TStringField
      Tag = 1
      FieldName = 'CLIENTE_ALMOX'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaASSUNTO_DAV: TStringField
      Tag = 1
      FieldName = 'ASSUNTO_DAV'
      Size = 70
    end
    object cdsEmpresaMSG_DAV: TMemoField
      Tag = 1
      FieldName = 'MSG_DAV'
      BlobType = ftMemo
      Size = 8
    end
    object cdsEmpresaCOPIAR_HWF_TERM_RET: TStringField
      DisplayLabel = 'Responsavel pela c'#243'pia HwF'
      FieldName = 'COPIAR_HWF_TERM_RET'
      Origin = '"EMPRESA"."COPIAR_HWF_TERM_RET"'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaDIRETORIO_HWF_TERM: TStringField
      DisplayLabel = 'Diret'#243'rio para disponibilizar HwF'
      FieldName = 'DIRETORIO_HWF_TERM'
      Size = 256
    end
    object cdsEmpresaINTERV_KM_SERV: TIntegerField
      DisplayLabel = 'Intervalo de KM entre Revis'#245'es:'
      FieldName = 'INTERV_KM_SERV'
    end
    object cdsEmpresaUSAR_LOGO: TStringField
      Tag = 1
      DisplayLabel = 'Usar Logo'
      FieldName = 'USAR_LOGO'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaUSAR_REDUCAO_INVERTIDA: TStringField
      DisplayLabel = 'Usar % de Redu'#231#227'o invertido'
      FieldName = 'USAR_REDUCAO_INVERTIDA'
      Size = 1
    end
    object cdsEmpresaIDENTIFICACAO_EMP: TStringField
      DisplayLabel = 'Identifica'#231#227'o da Empresa'
      FieldName = 'IDENTIFICACAO_EMP'
      Size = 64
    end
    object cdsEmpresaCOD_SERV_INTERM: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Serv Interm'
      FieldName = 'COD_SERV_INTERM'
    end
    object cdsEmpresaVERSAO_DEOLHOIMPOSTO: TStringField
      Tag = 1
      DisplayLabel = 'Versao de Olho no Imposto'
      FieldName = 'VERSAO_DEOLHOIMPOSTO'
      FixedChar = True
      Size = 10
    end
    object cdsEmpresaUSAR_CONFERENCIA_ENTRADA: TStringField
      DisplayLabel = 'Conferencia Cega Entrada'
      FieldName = 'USAR_CONFERENCIA_ENTRADA'
      Size = 1
    end
    object cdsEmpresaOC_TIPO_MONTAGEM: TStringField
      DisplayLabel = 'O.C. Tipo Montagem'
      FieldName = 'OC_TIPO_MONTAGEM'
      Size = 1
    end
    object cdsEmpresaOC_ALT_PED_OC_FECH: TStringField
      DisplayLabel = 'O.C. Permitir alteracao de pedidos com O.C. Aberta'
      FieldName = 'OC_ALT_PED_OC_FECH'
      Size = 1
    end
    object cdsEmpresaPRE_NOTA_TRANSF_CNPJ: TMemoField
      DisplayLabel = 'CNPJ'#39's para gerar Pre-Notas de transferencia'
      FieldName = 'PRE_NOTA_TRANSF_CNPJ'
      BlobType = ftMemo
      Size = 8
    end
    object cdsEmpresaPRE_NOTA_TRANSF_CFOP: TMemoField
      DisplayLabel = 'CFOP'#39's para gerar Pre-Notas de transferencia'
      FieldName = 'PRE_NOTA_TRANSF_CFOP'
      BlobType = ftMemo
      Size = 8
    end
    object cdsEmpresaNF_VEIC_MOSTRAR_NF_FAB: TStringField
      DisplayLabel = 'NF Veiculos - Mostrar dados da NF do Fabricante'
      FieldName = 'NF_VEIC_MOSTRAR_NF_FAB'
      Size = 1
    end
    object cdsEmpresaFIN_LANC_SOBRA_QUEBRA: TStringField
      DisplayLabel = 'Financeiro. Lancar Sobra ou Quebra de Caixa'
      FieldName = 'FIN_LANC_SOBRA_QUEBRA'
      Size = 1
    end
    object cdsEmpresaVND_TOLER_PERC_MARKUP: TFloatField
      DisplayLabel = 'Percentual de Tolerancia na Venda a menor do MarkUp'
      FieldName = 'VND_TOLER_PERC_MARKUP'
    end
    object cdsEmpresaCONF_CEGA_SAIDA: TStringField
      DisplayLabel = 'Conferencia Cega Saida'
      FieldName = 'CONF_CEGA_SAIDA'
      FixedChar = True
      Size = 2
    end
    object cdsEmpresaUSARPOLITICASDESC: TStringField
      DisplayLabel = 'Pol'#237'ticas Desc.'
      FieldName = 'USARPOLITICASDESC'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaVND_FECH_DEPOIS_DE_AUT: TStringField
      DisplayLabel = 'Fechar venda Ap'#243's Financeiro Autorizar'
      FieldName = 'VND_FECH_DEPOIS_DE_AUT'
      Size = 1
    end
    object cdsEmpresaCFGMOB_TIPV: TStringField
      Tag = 1
      DisplayLabel = 'Tipo de Venda Mob'
      FieldName = 'CFGMOB_TIPV'
      Size = 1
    end
    object cdsEmpresaCFGMOB_VERIFIICAEST: TStringField
      Tag = 1
      DisplayLabel = 'Verificar Estoque Mob'
      FieldName = 'CFGMOB_VERIFIICAEST'
      Size = 1
    end
    object cdsEmpresaCFGMOB_REPESTOQUE: TStringField
      Tag = 1
      DisplayLabel = 'Repetir Produto Mob'
      FieldName = 'CFGMOB_REPESTOQUE'
      Size = 1
    end
    object cdsEmpresaCFGMOB_AUTOINC: TStringField
      Tag = 1
      DisplayLabel = 'Auto Inc Mob'
      FieldName = 'CFGMOB_AUTOINC'
      Size = 1
    end
    object cdsEmpresaCFGMOB_CODFATURAMENTO: TStringField
      Tag = 1
      DisplayLabel = 'Cod Faturamento Mob'
      FieldName = 'CFGMOB_CODFATURAMENTO'
      Size = 30
    end
    object cdsEmpresaCFGMOB_VSOM: TStringField
      Tag = 1
      DisplayLabel = 'Usar Som Mob'
      FieldName = 'CFGMOB_VSOM'
      Size = 1
    end
    object cdsEmpresaCFGMOB_MASCARAALOC: TStringField
      Tag = 1
      DisplayLabel = 'Mascara Locacao Mob'
      FieldName = 'CFGMOB_MASCARAALOC'
      Size = 8
    end
    object cdsEmpresaCFGMOB_VUSARCARTEIRA: TStringField
      Tag = 1
      DisplayLabel = 'Usar Carteira Vendedor Mob'
      FieldName = 'CFGMOB_VUSARCARTEIRA'
      Size = 1
    end
    object cdsEmpresaCFGMOB_VVERMENSENTRADA: TStringField
      Tag = 1
      DisplayLabel = 'Verificar Mensagem Mob'
      FieldName = 'CFGMOB_VVERMENSENTRADA'
      Size = 1
    end
    object cdsEmpresaCFGMOB_ATPARCIAL: TStringField
      DisplayLabel = 'Atualizacao Parcial'
      FieldName = 'CFGMOB_ATPARCIAL'
      Size = 1
    end
    object cdsEmpresaTIPOMDFE: TStringField
      DisplayLabel = 'Tipo Emiss'#227'o MDF-e'
      FieldName = 'TIPOMDFE'
      Size = 40
    end
    object cdsEmpresaRNTRC: TIntegerField
      FieldName = 'RNTRC'
    end
    object cdsEmpresaCIOT: TIntegerField
      FieldName = 'CIOT'
    end
    object cdsEmpresaSERIE_MDFE: TSmallintField
      DisplayLabel = 'S'#233'rie do MDF-e'
      FieldName = 'SERIE_MDFE'
    end
    object cdsEmpresaSPED_C481_LIQ: TStringField
      DisplayLabel = 
        'EFD Contribui'#231#245'es - Apresentar valor l'#237'quido dos cupons no arqui' +
        'vo eletr'#244'nico'
      FieldName = 'SPED_C481_LIQ'
      Size = 1
    end
    object cdsEmpresaCFOP_PAD_PRODUCAO_MP: TIntegerField
      DisplayLabel = 'CFOP Padr'#227'o NF Baixa MP e Insumos'
      FieldName = 'CFOP_PAD_PRODUCAO_MP'
    end
    object cdsEmpresaNAOVERIF_EMP_ARQRETORNO: TStringField
      Tag = 1
      DisplayLabel = 'Nao Verificar CNPJ ao Quitar Boletos'
      FieldName = 'NAOVERIF_EMP_ARQRETORNO'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaGERA_FATURAS_NF_VEIC: TStringField
      DisplayLabel = 'Gerar faturas para notas fiscais de ve'#237'culos'
      FieldName = 'GERA_FATURAS_NF_VEIC'
      Size = 1
    end
    object cdsEmpresaSPED_REGISTROS_LIQ: TStringField
      DisplayLabel = 
        'Gerar valor l'#237'quido nos registros do EFD Contribui'#231#245'es (executo ' +
        'cupons fiscais)'
      FieldName = 'SPED_REGISTROS_LIQ'
      Size = 1
    end
    object cdsEmpresaUS_ENVMENSCADCL1: TStringField
      Tag = 1
      FieldName = 'US_ENVMENSCADCL1'
      Visible = False
      Size = 10
    end
    object cdsEmpresaUS_ENVMENSCADCL2: TStringField
      Tag = 1
      FieldName = 'US_ENVMENSCADCL2'
      Visible = False
      Size = 10
    end
    object cdsEmpresaSPED_STIPI_OUTD: TStringField
      DisplayLabel = 'Apurar ST e IPI em Outras Despesas'
      FieldName = 'SPED_STIPI_OUTD'
      Size = 1
    end
    object cdsEmpresaTP_EMP: TStringField
      Tag = 1
      FieldName = 'TP_EMP'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaINF_RED_LUCRO: TStringField
      Tag = 1
      FieldName = 'INF_RED_LUCRO'
      Size = 1
    end
    object cdsEmpresaPERC_COMISSAO_V_VEIC: TFloatField
      Tag = 1
      FieldName = 'PERC_COMISSAO_V_VEIC'
      Visible = False
    end
    object cdsEmpresaPERC_COMISSAO_G_VEIC: TFloatField
      Tag = 1
      FieldName = 'PERC_COMISSAO_G_VEIC'
      Visible = False
    end
    object cdsEmpresaPERC_RET_BANCO_V_VEIC: TFloatField
      Tag = 1
      FieldName = 'PERC_RET_BANCO_V_VEIC'
      Visible = False
    end
    object cdsEmpresaPERC_RET_BANCO_G_VEIC: TFloatField
      Tag = 1
      FieldName = 'PERC_RET_BANCO_G_VEIC'
      Visible = False
    end
    object cdsEmpresaSENHA_CONTRATO_VEIC: TStringField
      Tag = 1
      FieldName = 'SENHA_CONTRATO_VEIC'
      Visible = False
      Size = 16
    end
    object cdsEmpresaABATER_ITENS: TStringField
      Tag = 1
      FieldName = 'ABATER_ITENS'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaCONF_CNPJ_TRANSFDEP: TStringField
      Tag = 1
      FieldName = 'CONF_CNPJ_TRANSFDEP'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaCONS_DEPOSITO_ESTOQUE: TStringField
      Tag = 1
      FieldName = 'CONS_DEPOSITO_ESTOQUE'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaSPED_P_COD_REC_PIS: TStringField
      DisplayLabel = 'Codigo da Receita ref a contribuicao do PIS(M205)'
      FieldName = 'SPED_P_COD_REC_PIS'
      Size = 6
    end
    object cdsEmpresaSPED_P_COD_REC_COFINS: TStringField
      DisplayLabel = 'Codigo da Receita ref a contribuicao do COFINS(M605)'
      FieldName = 'SPED_P_COD_REC_COFINS'
      Size = 6
    end
    object cdsEmpresaDESB_CL_CONTAS_QUIT: TStringField
      DisplayLabel = 'Desnegativar cliente ao quitar todos os documentos'
      FieldName = 'DESB_CL_CONTAS_QUIT'
      Size = 1
    end
    object cdsEmpresaCOD_CTRL_MTUSADAS: TIntegerField
      Tag = 1
      FieldName = 'COD_CTRL_MTUSADAS'
      Visible = False
    end
    object cdsEmpresaUSAR_CHECKCHECK: TStringField
      Tag = 1
      FieldName = 'USAR_CHECKCHECK'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaIDAPL_CHECKCHECK: TStringField
      Tag = 1
      FieldName = 'IDAPL_CHECKCHECK'
      Visible = False
    end
    object cdsEmpresaCDACESSO_CHECKCHECK: TStringField
      Tag = 1
      FieldName = 'CDACESSO_CHECKCHECK'
      Visible = False
    end
    object cdsEmpresaPWS_CHECKCHECK: TStringField
      Tag = 1
      FieldName = 'PWS_CHECKCHECK'
      Visible = False
    end
    object cdsEmpresaVENC_UI_ITENSVND: TDateTimeField
      DisplayLabel = 'Venc. U.I. Itens Vnd'
      FieldName = 'VENC_UI_ITENSVND'
      EditMask = '!99/99/9999;1;_'
    end
    object cdsEmpresaCONF_CEGA_FECHAR_VENDA: TStringField
      DisplayLabel = 'Conf. Cega Fechar Venda'
      FieldName = 'CONF_CEGA_FECHAR_VENDA'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaUSAR_SEPARACAO_PED: TStringField
      DisplayLabel = 'Usar separa'#231#227'o no Pedido(REQ)'
      FieldName = 'USAR_SEPARACAO_PED'
      Size = 1
    end
    object cdsEmpresaACRESC_CARACTERES_CHASSI: TStringField
      Tag = 1
      FieldName = 'ACRESC_CARACTERES_CHASSI'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaUS_CFG_CST_SAIDA_NFST: TStringField
      DisplayLabel = 'Ativar calc ST NF Saida CST 10, 30 ou 70'
      FieldName = 'US_CFG_CST_SAIDA_NFST'
      Size = 1
    end
    object cdsEmpresaNFSE_OBSOS_SEMENTER: TStringField
      DisplayLabel = 'Quebra de Linha Obs NFS-e'
      FieldName = 'NFSE_OBSOS_SEMENTER'
      Size = 1
    end
    object cdsEmpresaFINANCEIRO_UNIFICADO: TStringField
      DisplayLabel = 'Financeiro Unificado'
      FieldName = 'FINANCEIRO_UNIFICADO'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaCODIGO_UNIFICADORA: TIntegerField
      DisplayLabel = 'Codigo Unificadora'
      FieldName = 'CODIGO_UNIFICADORA'
    end
    object cdsEmpresaUSARDEBITOCREDITO: TStringField
      DisplayLabel = 'Usar Debito Credito'
      FieldName = 'USARDEBITOCREDITO'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaLANCDEBCRED_DEV: TStringField
      DisplayLabel = 'Debito Cred Devolucao'
      FieldName = 'LANCDEBCRED_DEV'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaPERC_LANCDEBCRED_DEV: TFloatField
      DisplayLabel = 'Perc. Debito Cred Devolucao'
      FieldName = 'PERC_LANCDEBCRED_DEV'
    end
    object cdsEmpresaENV_MAIL_MARK: TStringField
      DisplayLabel = 'Env Email Marketing'
      FieldName = 'ENV_MAIL_MARK'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaNFE_AUTXML: TStringField
      Tag = 3
      DisplayLabel = 'Lista CPF/CNPJ Aut. XLML'
      FieldName = 'NFE_AUTXML'
      Size = 256
    end
    object cdsEmpresaDIAS_RES_BANCO: TIntegerField
      Tag = 1
      FieldName = 'DIAS_RES_BANCO'
    end
    object cdsEmpresaMASCARA_GRUPO_COTA_RD: TStringField
      Tag = 1
      FieldName = 'MASCARA_GRUPO_COTA_RD'
    end
    object cdsEmpresaAGRUPAR_HISTORICO_VEIC: TStringField
      Tag = 1
      FieldName = 'AGRUPAR_HISTORICO_VEIC'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaENV_EMAIL_RESERVA_VEIC: TStringField
      FieldName = 'ENV_EMAIL_RESERVA_VEIC'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaREORDENAR_FILA_RES: TStringField
      Tag = 1
      FieldName = 'REORDENAR_FILA_RES'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaSQL_ORDEM_FILA_RES: TMemoField
      Tag = 1
      FieldName = 'SQL_ORDEM_FILA_RES'
      Visible = False
      BlobType = ftMemo
      Size = 8
    end
    object cdsEmpresaCTR_PLANO_VEIC: TStringField
      Tag = 1
      FieldName = 'CTR_PLANO_VEIC'
      Visible = False
      Size = 100
    end
    object cdsEmpresaEMAIL_USATLS: TStringField
      DisplayLabel = 'Usar TLS'
      FieldName = 'EMAIL_USATLS'
      Size = 1
    end
  end
  object IBTransEmpresa: TIBTransaction
    DefaultDatabase = dtmAtivo.bancoHw
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 493
    Top = 706
  end
  object qrProcessos: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransEmpresa
    SQL.Strings = (
      'select *  from TABELA_PROCESSOS')
    Left = 658
    Top = 274
  end
  object dsProcessos: TDataSource
    DataSet = cdsProcessos
    Left = 658
    Top = 431
  end
  object dspProcessos: TDataSetProvider
    DataSet = qrProcessos
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 658
    Top = 333
  end
  object cdsProcessos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProcessos'
    BeforeOpen = CdsDepartamentosBeforeOpen
    Left = 666
    Top = 382
    object cdsProcessosCOD_PROCESSO: TStringField
      FieldName = 'COD_PROCESSO'
      Required = True
      FixedChar = True
      Size = 10
    end
    object cdsProcessosCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsProcessosNOME_PROCESSO: TStringField
      FieldName = 'NOME_PROCESSO'
      Size = 50
    end
    object cdsProcessosNIVEL_PROCESSO: TIntegerField
      FieldName = 'NIVEL_PROCESSO'
      Required = True
    end
    object cdsProcessosSENHA_GERENTE: TStringField
      FieldName = 'SENHA_GERENTE'
      FixedChar = True
      Size = 1
    end
    object cdsProcessosFORM: TStringField
      FieldName = 'FORM'
      Size = 30
    end
    object cdsProcessosATIVO: TIntegerField
      FieldName = 'ATIVO'
    end
  end
  object dscabNF: TDataSource
    DataSet = qrCabNF
    Left = 217
    Top = 659
  end
  object qrCabNF: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransEmpresa
    SQL.Strings = (
      'SELECT * FROM CABECALHO_NF '
      ''
      '')
    Left = 209
    Top = 589
  end
  object dsErp: TDataSource
    DataSet = cdsErp
    Left = 708
    Top = 431
  end
  object cdsErp: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspErp'
    BeforeOpen = CdsDepartamentosBeforeOpen
    Left = 716
    Top = 382
    object cdsErpCOD_APLICATIVO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_APLICATIVO'
      Required = True
    end
    object cdsErpNOME_APLICATIVO: TStringField
      DisplayLabel = 'Aplicativo'
      FieldName = 'NOME_APLICATIVO'
      Size = 64
    end
  end
  object dspErp: TDataSetProvider
    DataSet = qrErp
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 708
    Top = 331
  end
  object qrErp: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransSenha
    SQL.Strings = (
      'select * from ERP')
    Left = 708
    Top = 274
  end
  object qrSenhas_erp: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransSenha
    SQL.Strings = (
      'select * from SENHAS_ERP')
    Left = 211
    Top = 274
  end
  object dsSenhas_erp: TDataSource
    DataSet = cdsSenhas_erp
    Left = 211
    Top = 431
  end
  object cdsSenhas_erp: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSenhas_erp'
    BeforeOpen = CdsDepartamentosBeforeOpen
    Left = 219
    Top = 382
    object cdsSenhas_erpUSUARIO: TStringField
      DisplayLabel = 'Codigo Usu'#225'rio'
      FieldName = 'USUARIO'
      Required = True
      FixedChar = True
      Size = 10
    end
    object cdsSenhas_erpCOD_EMPRESA: TIntegerField
      DisplayLabel = 'C'#243'digo Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsSenhas_erpCOD_APLICATIVO: TIntegerField
      DisplayLabel = 'C'#243'digo Aplicativo'
      FieldName = 'COD_APLICATIVO'
      Required = True
    end
    object cdsSenhas_erpAplicativo: TStringField
      FieldKind = fkLookup
      FieldName = 'Aplicativo'
      LookupDataSet = cdsErp
      LookupKeyFields = 'COD_APLICATIVO'
      LookupResultField = 'NOME_APLICATIVO'
      KeyFields = 'COD_APLICATIVO'
      Size = 25
      Lookup = True
    end
  end
  object dspSenhas_erp: TDataSetProvider
    DataSet = qrSenhas_erp
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 211
    Top = 331
  end
  object IBTransSenha: TIBTransaction
    DefaultDatabase = dtmAtivo.bancoHw
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 577
    Top = 706
  end
  object qrBairros: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransBairro
    SQL.Strings = (
      'SELECT * FROM BAIRROS')
    Left = 13
    Top = 274
  end
  object dspBairros: TDataSetProvider
    DataSet = qrBairros
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 13
    Top = 331
  end
  object cdsBairros: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspBairros'
    BeforeOpen = CdsDepartamentosBeforeOpen
    Left = 15
    Top = 382
    object cdsBairrosCOD_BAIRRO: TIntegerField
      DisplayLabel = 'Cod Bairro'
      FieldName = 'COD_BAIRRO'
      Required = True
    end
    object cdsBairrosNOME_BAIRRO: TStringField
      Tag = 2
      DisplayLabel = 'Nome do Bairro'
      FieldName = 'NOME_BAIRRO'
      Size = 30
    end
    object cdsBairrosCOD_USUARIO: TIntegerField
      DisplayLabel = 'Usu'#225'rio que Cadastrou'
      FieldName = 'COD_USUARIO'
    end
    object cdsBairrosCOD_USUARIO_ALT: TIntegerField
      DisplayLabel = 'Usu'#225'rio que Alterou'
      FieldName = 'COD_USUARIO_ALT'
    end
    object cdsBairrosATIVO: TIntegerField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
  end
  object dsBairros: TDataSource
    DataSet = cdsBairros
    Left = 3
    Top = 431
  end
  object IBTransBairro: TIBTransaction
    DefaultDatabase = dtmAtivo.bancoHw
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 12
    Top = 707
  end
  object qrBuscasB: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransBairro
    Left = 713
    Top = 573
  end
  object qrAbreCidadeIBGE: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransPesquisa
    SQL.Strings = (
      'SELECT * FROM CIDADES_IBGE')
    Left = 565
    Top = 588
    object qrAbreCidadeIBGECODIGO_MUN_IBGE: TIntegerField
      FieldName = 'CODIGO_MUN_IBGE'
      Origin = '"CIDADES_IBGE"."CODIGO_MUN_IBGE"'
      Required = True
    end
    object qrAbreCidadeIBGENOME_MUNICIPIO: TIBStringField
      FieldName = 'NOME_MUNICIPIO'
      Origin = '"CIDADES_IBGE"."NOME_MUNICIPIO"'
      Size = 50
    end
    object qrAbreCidadeIBGENOME_UF: TIBStringField
      FieldName = 'NOME_UF'
      Origin = '"CIDADES_IBGE"."NOME_UF"'
      Size = 50
    end
  end
  object IBTransPesquisa: TIBTransaction
    DefaultDatabase = dtmAtivo.bancoHw
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 98
    Top = 705
  end
  object qrCidades: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransCidade
    SQL.Strings = (
      'SELECT * FROM CIDADES')
    Left = 60
    Top = 274
  end
  object dspCidades: TDataSetProvider
    DataSet = qrCidades
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 52
    Top = 331
  end
  object cdsCidades: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCidades'
    BeforeOpen = CdsDepartamentosBeforeOpen
    Left = 61
    Top = 382
    object cdsCidadesCOD_CIDADE: TIntegerField
      Tag = 2
      DisplayLabel = 'Cod Cidade'
      FieldName = 'COD_CIDADE'
      Required = True
    end
    object cdsCidadesNOME_CIDADE: TStringField
      Tag = 2
      DisplayLabel = 'Nome da Cidade'
      FieldName = 'NOME_CIDADE'
      Size = 30
    end
    object cdsCidadesCOD_USUARIO: TIntegerField
      DisplayLabel = 'Usu'#225'rio que Cadastrou'
      FieldName = 'COD_USUARIO'
    end
    object cdsCidadesCOD_USUARIO_ALT: TIntegerField
      DisplayLabel = 'Usu'#225'rio que Alterou'
      FieldName = 'COD_USUARIO_ALT'
    end
    object cdsCidadesATIVO: TIntegerField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
    object cdsCidadesIBGE_COD_CIDADE: TIntegerField
      DisplayLabel = 'Cod Cidade IBGE'
      FieldName = 'IBGE_COD_CIDADE'
    end
    object cdsCidadesZFM_ALC: TStringField
      DisplayLabel = 'ZFM ALC?'
      FieldName = 'ZFM_ALC'
      Size = 1
    end
  end
  object dsCidades: TDataSource
    DataSet = cdsCidades
    Left = 52
    Top = 431
  end
  object IBTransCidade: TIBTransaction
    DefaultDatabase = dtmAtivo.bancoHw
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 262
    Top = 708
  end
  object qrBuscasCidade: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransCidade
    Left = 423
    Top = 1015
  end
  object dsAbreCidadeIBGE: TDataSource
    DataSet = qrAbreCidadeIBGE
    Left = 577
    Top = 655
  end
  object qrAbreEstadoIBGE: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransPesquisa
    SQL.Strings = (
      'SELECT * FROM CIDADES_IBGE')
    Left = 481
    Top = 588
    object qrAbreEstadoIBGECODIGO_UF_IBGE: TIntegerField
      FieldName = 'CODIGO_UF_IBGE'
      Origin = '"CIDADES_IBGE"."CODIGO_UF_IBGE"'
      Required = True
    end
    object qrAbreEstadoIBGENOME_UF: TIBStringField
      FieldName = 'NOME_UF'
      Origin = '"CIDADES_IBGE"."NOME_UF"'
      Size = 50
    end
  end
  object dsAbreEstadoIBGE: TDataSource
    DataSet = qrAbreEstadoIBGE
    Left = 498
    Top = 656
  end
  object qrEstados: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransEstado
    SQL.Strings = (
      'SELECT * FROM Estados where ativo = 1')
    Left = 110
    Top = 274
  end
  object dspEstados: TDataSetProvider
    DataSet = qrEstados
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 102
    Top = 331
  end
  object cdsEstados: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEstados'
    BeforeOpen = CdsDepartamentosBeforeOpen
    Left = 109
    Top = 382
    object cdsEstadosCODIGO_UF: TIntegerField
      DisplayLabel = 'Cod Estado'
      FieldName = 'CODIGO_UF'
      Required = True
    end
    object cdsEstadosNOME_UF: TStringField
      Tag = 2
      DisplayLabel = 'Nome do Estado'
      FieldName = 'NOME_UF'
      Size = 30
    end
    object cdsEstadosSIGLA_UF: TStringField
      Tag = 2
      DisplayLabel = 'Sigla'
      FieldName = 'SIGLA_UF'
      EditMask = 'll;0;_'
      FixedChar = True
      Size = 2
    end
    object cdsEstadosATIVO: TIntegerField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
    object cdsEstadosIBGE_CODIGO_UF: TIntegerField
      DisplayLabel = 'Cod UF no IBGE'
      FieldName = 'IBGE_CODIGO_UF'
    end
    object cdsEstadosALIQ_INTRA: TFloatField
      DisplayLabel = 'Al'#237'quota Interna de ICMS'
      FieldName = 'ALIQ_INTRA'
    end
    object cdsEstadosMASCARA_FONE: TStringField
      Tag = 1
      DisplayLabel = 'Mascara Telefone'
      FieldName = 'MASCARA_FONE'
      Visible = False
    end
    object cdsEstadosPFCP: TFloatField
      FieldName = 'PFCP'
      DisplayFormat = '##0.00'
    end
  end
  object dsEstados: TDataSource
    DataSet = cdsEstados
    Left = 100
    Top = 431
  end
  object IBTransEstado: TIBTransaction
    DefaultDatabase = dtmAtivo.bancoHw
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 338
    Top = 708
  end
  object qrBuscasE: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransEstado
    Left = 423
    Top = 1066
  end
  object qrCFOPMud: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransCfopCst
    SQL.Strings = (
      'select * from cfop_mud where ativo=1'
      '')
    Left = 151
    Top = 274
  end
  object dspCFOPMud: TDataSetProvider
    DataSet = qrCFOPMud
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 154
    Top = 331
  end
  object cdsCFOPMud: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCFOPMud'
    BeforeOpen = CdsDepartamentosBeforeOpen
    Left = 161
    Top = 382
    object cdsCFOPMudCODIGO_UF: TIntegerField
      DisplayLabel = 'UF de Origem'
      FieldName = 'CODIGO_UF'
      Required = True
    end
    object cdsCFOPMudNATOP_INT_NC: TFloatField
      DisplayLabel = 'Nat. Op. Interna N'#227'o Contribuinte'
      FieldName = 'NATOP_INT_NC'
    end
    object cdsCFOPMudICM_INT: TFloatField
      DisplayLabel = 'ICMS Interno N'#227'o Contribuinte'
      FieldName = 'ICM_INT'
    end
    object cdsCFOPMudNATOP_INT_C: TFloatField
      DisplayLabel = 'Nat. Op. Interna Contribuinte'
      FieldName = 'NATOP_INT_C'
    end
    object cdsCFOPMudICM_INT_C: TFloatField
      DisplayLabel = 'ICMS Interno Contribuinte'
      FieldName = 'ICM_INT_C'
    end
    object cdsCFOPMudNATOP_EXT_NC: TFloatField
      DisplayLabel = 'Nat. Op. Externa N'#227'o Contribuinte'
      FieldName = 'NATOP_EXT_NC'
    end
    object cdsCFOPMudNATOP_EXT_C: TFloatField
      DisplayLabel = 'Nat. Op. Externa Contribuinte'
      FieldName = 'NATOP_EXT_C'
    end
    object cdsCFOPMudICM_EXT_NC: TFloatField
      DisplayLabel = 'ICMS Externo N'#227'o Contribuinte:'
      FieldName = 'ICM_EXT_NC'
    end
    object cdsCFOPMudICM_EXT_C: TFloatField
      DisplayLabel = 'ICMS Externo Contribuinte:'
      FieldName = 'ICM_EXT_C'
    end
    object cdsCFOPMudUF_DESTINO: TIntegerField
      DisplayLabel = 'UF de Destino'
      FieldName = 'UF_DESTINO'
      Required = True
    end
    object cdsCFOPMudATIVO: TIntegerField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
  end
  object dsCFOPMud: TDataSource
    DataSet = cdsCFOPMud
    Left = 156
    Top = 431
  end
  object qrCstMudGeral: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransCfopCst
    SQL.Strings = (
      'select * from cst_mud_geral')
    Left = 477
    Top = 274
  end
  object dspCstMudGeral: TDataSetProvider
    DataSet = qrCstMudGeral
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 485
    Top = 331
  end
  object cdsCstMudGeral: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCstMudGeral'
    BeforeOpen = CdsDepartamentosBeforeOpen
    Left = 495
    Top = 382
    object cdsCstMudGeralUF_ORIGEM: TIntegerField
      DisplayLabel = 'UF de Origem'
      FieldName = 'UF_ORIGEM'
      Required = True
    end
    object cdsCstMudGeralUF_DESTINO: TIntegerField
      DisplayLabel = 'UF de Destino'
      FieldName = 'UF_DESTINO'
      Required = True
    end
    object cdsCstMudGeralCST_INTERNO: TStringField
      DisplayLabel = 'CST Interno'
      FieldName = 'CST_INTERNO'
      FixedChar = True
      Size = 3
    end
    object cdsCstMudGeralCST_EXTERNO: TStringField
      DisplayLabel = 'CST Externo'
      FieldName = 'CST_EXTERNO'
      FixedChar = True
      Size = 3
    end
    object cdsCstMudGeralALIQ_INTERNA: TFloatField
      DisplayLabel = 'Al'#237'quota Interna de ICMS'
      FieldName = 'ALIQ_INTERNA'
    end
    object cdsCstMudGeralALIQ_EXTERNA: TFloatField
      DisplayLabel = 'Al'#237'quota Externa de ICMS'
      FieldName = 'ALIQ_EXTERNA'
    end
    object cdsCstMudGeralCFOP_INTERNO: TFloatField
      DisplayLabel = 'CFOP Interno'
      FieldName = 'CFOP_INTERNO'
    end
    object cdsCstMudGeralCFOP_EXTERNO: TFloatField
      DisplayLabel = 'CFOP Externo'
      FieldName = 'CFOP_EXTERNO'
    end
  end
  object dsCstMudGeral: TDataSource
    DataSet = cdsCstMudGeral
    Left = 487
    Top = 431
  end
  object qrCfopUFDestino: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransCfopCst
    SQL.Strings = (
      'SELECT * FROM Estados where ativo = 1')
    Left = 339
    Top = 274
  end
  object dspCfopUFDestino: TDataSetProvider
    DataSet = qrCfopUFDestino
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 347
    Top = 331
  end
  object cdsCfopUFDestino: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCfopUFDestino'
    BeforeOpen = CdsDepartamentosBeforeOpen
    Left = 349
    Top = 382
    object cdsCfopUFDestinoCODIGO_UF: TIntegerField
      FieldName = 'CODIGO_UF'
      Required = True
    end
    object cdsCfopUFDestinoNOME_UF: TStringField
      FieldName = 'NOME_UF'
      Size = 30
    end
    object cdsCfopUFDestinoSIGLA_UF: TStringField
      FieldName = 'SIGLA_UF'
      FixedChar = True
      Size = 2
    end
    object cdsCfopUFDestinoATIVO: TIntegerField
      FieldName = 'ATIVO'
    end
  end
  object dsCfopUFDestino: TDataSource
    DataSet = cdsCfopUFDestino
    Left = 345
    Top = 431
  end
  object IBTransCfopCst: TIBTransaction
    DefaultDatabase = dtmAtivo.bancoHw
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 178
    Top = 711
  end
  object qrBuscasCfopCst: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransCfopCst
    Left = 707
    Top = 627
  end
  object qrCfopUFOrigem: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransCfopCst
    SQL.Strings = (
      'SELECT * FROM ESTADOS WHERE ativo=1')
    Left = 414
    Top = 274
  end
  object dsCfopUFOrigem: TDataSource
    DataSet = cdsCfopUFOrigem
    Left = 418
    Top = 431
  end
  object dspCfopUFOrigem: TDataSetProvider
    DataSet = qrCfopUFOrigem
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 415
    Top = 331
  end
  object cdsCfopUFOrigem: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCfopUFOrigem'
    BeforeOpen = CdsDepartamentosBeforeOpen
    Left = 425
    Top = 382
    object cdsCfopUFOrigemCODIGO_UF: TIntegerField
      FieldName = 'CODIGO_UF'
      Required = True
    end
    object cdsCfopUFOrigemNOME_UF: TStringField
      FieldName = 'NOME_UF'
      Size = 30
    end
    object cdsCfopUFOrigemSIGLA_UF: TStringField
      FieldName = 'SIGLA_UF'
      FixedChar = True
      Size = 2
    end
    object cdsCfopUFOrigemATIVO: TIntegerField
      FieldName = 'ATIVO'
    end
    object cdsCfopUFOrigemIBGE_CODIGO_UF: TIntegerField
      FieldName = 'IBGE_CODIGO_UF'
    end
    object cdsCfopUFOrigemALIQ_INTRA: TFloatField
      FieldName = 'ALIQ_INTRA'
    end
  end
  object qrSTEmp: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransEmpresa
    SQL.Strings = (
      'select * from EMPRESA_SUBSTITUTO')
    Left = 543
    Top = 274
  end
  object dspSTEmp: TDataSetProvider
    DataSet = qrSTEmp
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 543
    Top = 332
  end
  object cdsSTEmp: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSTEmp'
    BeforeOpen = CdsDepartamentosBeforeOpen
    Left = 551
    Top = 382
    object cdsSTEmpCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
      Visible = False
    end
    object cdsSTEmpSIGLA_UF: TStringField
      DisplayLabel = 'Sigla UF'
      FieldName = 'SIGLA_UF'
      Required = True
      FixedChar = True
      Size = 2
    end
    object cdsSTEmpINSCRICAO: TStringField
      DisplayLabel = 'Inscri'#231#227'o ST'
      FieldName = 'INSCRICAO'
      Required = True
      Size = 18
    end
  end
  object dsSTEmp: TDataSource
    DataSet = cdsSTEmp
    Left = 543
    Top = 431
  end
  object CdsDpto: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspDepto'
    BeforeOpen = CdsDepartamentosBeforeOpen
    Left = 758
    Top = 97
    object CdsDptoCOD_DEP: TIntegerField
      FieldName = 'COD_DEP'
      Required = True
    end
    object CdsDptoDESC_DEP: TStringField
      FieldName = 'DESC_DEP'
      Size = 35
    end
    object CdsDptoPERC_DEP: TFloatField
      FieldName = 'PERC_DEP'
    end
    object CdsDptoTP_DEP: TStringField
      FieldName = 'TP_DEP'
      FixedChar = True
      Size = 1
    end
    object CdsDptoTIPOFAT: TStringField
      FieldName = 'TIPOFAT'
      FixedChar = True
      Size = 40
    end
    object CdsDptoTIPDEVDEP: TStringField
      FieldName = 'TIPDEVDEP'
      Size = 15
    end
  end
  object DtDepto: TDataSource
    DataSet = CdsDpto
    Left = 759
    Top = 146
  end
  object IbDepto: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IbTransGestorHW
    SQL.Strings = (
      'select * from DEPART_CT')
    Left = 758
    Top = 3
  end
  object DspDepto: TDataSetProvider
    DataSet = IbDepto
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 758
    Top = 49
  end
  object IbTransGestorHW: TIBTransaction
    DefaultDatabase = dtmAtivo.bancoHw
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 648
    Top = 706
  end
  object CdsApuracaoDep: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspApuracaoDep'
    BeforeOpen = CdsDepartamentosBeforeOpen
    Left = 423
    Top = 875
    object CdsApuracaoDepANO: TIntegerField
      FieldName = 'ANO'
      Required = True
    end
    object CdsApuracaoDepMES: TIntegerField
      FieldName = 'MES'
      Required = True
    end
    object CdsApuracaoDepCOD_DEP: TIntegerField
      FieldName = 'COD_DEP'
      Required = True
    end
    object CdsApuracaoDepTPDESP: TStringField
      FieldName = 'TPDESP'
      Required = True
      FixedChar = True
      Size = 4
    end
    object CdsApuracaoDepCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object CdsApuracaoDepVALOR: TFloatField
      FieldName = 'VALOR'
      DisplayFormat = '#0.00'
    end
    object CdsApuracaoDepPE: TFloatField
      FieldName = 'PE'
      DisplayFormat = '#0.00'
    end
    object CdsApuracaoDepDNADEP: TStringField
      FieldName = 'DNADEP'
      FixedChar = True
      Size = 50
    end
    object CdsApuracaoDepATIVO: TIntegerField
      FieldName = 'ATIVO'
    end
    object CdsApuracaoDepDATACAD_AP: TDateTimeField
      FieldName = 'DATACAD_AP'
    end
    object CdsApuracaoDepPERC_VALOR: TFloatField
      FieldName = 'PERC_VALOR'
    end
    object CdsApuracaoDepVALOR_DINHEIRO: TFloatField
      FieldName = 'VALOR_DINHEIRO'
      DisplayFormat = '#0.00'
    end
    object CdsApuracaoDepVALOR_FATURADO: TFloatField
      FieldName = 'VALOR_FATURADO'
      DisplayFormat = '#0.00'
    end
    object CdsApuracaoDepMARGMIN: TFloatField
      FieldName = 'MARGMIN'
    end
    object CdsApuracaoDepMARKUPMIN: TFloatField
      FieldName = 'MARKUPMIN'
    end
    object CdsApuracaoDepAPURACAO_CONTABIL: TStringField
      FieldName = 'APURACAO_CONTABIL'
      Size = 1
    end
    object CdsApuracaoDepAPURACAO_MEDIA: TStringField
      FieldName = 'APURACAO_MEDIA'
      Size = 1
    end
    object CdsApuracaoDepAPURACAO_MEDIA_MESES: TSmallintField
      FieldName = 'APURACAO_MEDIA_MESES'
    end
  end
  object DtApuracaoDep: TDataSource
    DataSet = CdsApuracaoDep
    Left = 423
    Top = 921
  end
  object DspApuracaoDep: TDataSetProvider
    DataSet = IbApuracaoDep
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 423
    Top = 824
  end
  object IbApuracaoDep: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IbTransGestorHW
    SQL.Strings = (
      'select * from APURACAO_DEPTO where ativo = 1')
    Left = 423
    Top = 776
  end
  object qrBuscasGestor: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IbTransGestorHW
    SQL.Strings = (
      'Select * from ESTADOS'
      '')
    Left = 592
    Top = 65535
  end
  object qrBuscasEmp: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransEmpresa
    SQL.Strings = (
      'Select * from ESTADOS'
      '')
    Left = 705
  end
  object qrAbreDPTO_CT: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransPesquisa
    SQL.Strings = (
      'SELECT * FROM DEPART_CT WHERE TP_DEP = '#39'I'#39)
    Left = 641
    Top = 589
    object qrAbreDPTO_CTCOD_DEP: TIntegerField
      FieldName = 'COD_DEP'
      Origin = '"DEPART_CT"."COD_DEP"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrAbreDPTO_CTDESC_DEP: TIBStringField
      FieldName = 'DESC_DEP'
      Origin = '"DEPART_CT"."DESC_DEP"'
      Size = 35
    end
  end
  object dsAbreDPTO_CT: TDataSource
    DataSet = qrAbreDPTO_CT
    Left = 641
    Top = 655
  end
  object qrCores: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransCor
    SQL.Strings = (
      'SELECT * FROM CODIGO_CORFAB')
    Left = 12
    Top = 776
  end
  object dspCores: TDataSetProvider
    DataSet = qrCores
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 12
    Top = 824
  end
  object cdsCores: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCores'
    BeforeOpen = CdsDepartamentosBeforeOpen
    Left = 12
    Top = 875
    object cdsCoresCOD_COR: TIntegerField
      Tag = 2
      DisplayLabel = 'Cod Cor'
      FieldName = 'COD_COR'
      Origin = '"CODIGO_CORFAB"."COD_COR"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsCoresDESCRICAO_COR: TStringField
      Tag = 2
      DisplayLabel = 'Descricao'
      FieldName = 'DESCRICAO_COR'
      Origin = '"CODIGO_CORFAB"."DESCRICAO_COR"'
      FixedChar = True
      Size = 30
    end
    object cdsCoresTIPO_PINTURA: TStringField
      DisplayLabel = 'Tipo pintura'
      FieldName = 'TIPO_PINTURA'
      Origin = '"CODIGO_CORFAB"."TIPO_PINTURA"'
      FixedChar = True
      Size = 1
    end
    object cdsCoresATIVO: TIntegerField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
      Origin = '"CODIGO_CORFAB"."ATIVO"'
      Visible = False
    end
    object cdsCoresCODCORDENATRAM: TIntegerField
      DisplayLabel = 'Cod DENATRAM'
      FieldName = 'CODCORDENATRAM'
      Origin = '"CODIGO_CORFAB"."CODCORDENATRAM"'
    end
    object cdsCoresUS_CAD: TIntegerField
      DisplayLabel = 'Us Cad'
      FieldName = 'US_CAD'
    end
    object cdsCoresDATA_CAD: TDateTimeField
      DisplayLabel = 'Data Cad'
      FieldName = 'DATA_CAD'
    end
    object cdsCoresUS_EDIT: TIntegerField
      DisplayLabel = 'Us Alter'
      FieldName = 'US_EDIT'
    end
    object cdsCoresDATA_EDIT: TDateTimeField
      DisplayLabel = 'Data Alter'
      FieldName = 'DATA_EDIT'
    end
  end
  object dsCores: TDataSource
    DataSet = cdsCores
    Left = 12
    Top = 921
  end
  object qrCor: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransCadastroBasico
    SQL.Strings = (
      'Select * from codigo_corfab'
      ''
      '')
    Left = 12
    Top = 1015
  end
  object dsCor: TDataSource
    DataSet = qrCor
    Left = 12
    Top = 1066
  end
  object IBTransCor: TIBTransaction
    DefaultDatabase = dtmAtivo.bancoHw
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 12
    Top = 1118
  end
  object qrCombustiveis: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransCombustivel
    SQL.Strings = (
      'SELECT * FROM TP_COMB_RENAVAM')
    Left = 83
    Top = 795
  end
  object dsp_Combustiveis: TDataSetProvider
    DataSet = qrCombustiveis
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 83
    Top = 845
  end
  object cdsCombustiveis: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp_Combustiveis'
    BeforeOpen = CdsDepartamentosBeforeOpen
    Left = 83
    Top = 899
    object cdsCombustiveisCODIGO_TPCOMB: TIntegerField
      Tag = 2
      DisplayLabel = 'Cod Combustivel'
      FieldName = 'CODIGO_TPCOMB'
      Required = True
    end
    object cdsCombustiveisDESCR_COMB: TStringField
      Tag = 2
      DisplayLabel = 'Descricao'
      FieldName = 'DESCR_COMB'
      Size = 50
    end
    object cdsCombustiveisATIVO: TIntegerField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
  end
  object dsCombustiveis: TDataSource
    DataSet = cdsCombustiveis
    Left = 83
    Top = 953
  end
  object qrCombustivel: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransCadastroBasico
    SQL.Strings = (
      'Select * from TP_COMB_RENAVAM'
      ''
      '')
    Left = 83
    Top = 1039
  end
  object dsCombustivel: TDataSource
    DataSet = qrCombustivel
    Left = 83
    Top = 1094
  end
  object IBTransCombustivel: TIBTransaction
    DefaultDatabase = dtmAtivo.bancoHw
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 83
    Top = 1150
  end
  object qrTipoPendencias: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransTipoPendencia
    SQL.Strings = (
      'SELECT * FROM TIPO_PENDENCIA')
    Left = 154
    Top = 776
  end
  object dspTipoPendencias: TDataSetProvider
    DataSet = qrTipoPendencias
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 154
    Top = 824
  end
  object cdsTipoPendencias: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTipoPendencias'
    BeforeOpen = CdsDepartamentosBeforeOpen
    Left = 154
    Top = 875
    object cdsTipoPendenciasCOD_TP_PENDENCIA: TIntegerField
      Tag = 2
      DisplayLabel = 'Cod Tipo pendencia'
      FieldName = 'COD_TP_PENDENCIA'
      Required = True
    end
    object cdsTipoPendenciasDESCRICAO: TStringField
      Tag = 2
      DisplayLabel = 'Descricao'
      FieldName = 'DESCRICAO'
      Size = 30
    end
    object cdsTipoPendenciasATIVO: TSmallintField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
  end
  object dsTipoPendencias: TDataSource
    DataSet = cdsTipoPendencias
    Left = 154
    Top = 921
  end
  object qrTipoPendencia: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransCadastroBasico
    SQL.Strings = (
      'Select * from TIPO_PENDENCIA'
      ''
      '')
    Left = 154
    Top = 1015
  end
  object dsTipoPendencia: TDataSource
    DataSet = qrTipoPendencia
    Left = 154
    Top = 1066
  end
  object IBTransTipoPendencia: TIBTransaction
    DefaultDatabase = dtmAtivo.bancoHw
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 154
    Top = 1118
  end
  object qrTipoDespesas: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransTipoDespesa
    SQL.Strings = (
      'SELECT * FROM TIPO_DESPESA')
    Left = 291
    Top = 776
  end
  object dspTipoDespesas: TDataSetProvider
    DataSet = qrTipoDespesas
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 291
    Top = 824
  end
  object cdsTipoDespesas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTipoDespesas'
    BeforeOpen = CdsDepartamentosBeforeOpen
    Left = 291
    Top = 875
    object cdsTipoDespesasCOD_TP_DESPESA: TIntegerField
      Tag = 2
      DisplayLabel = 'Codigo'
      FieldName = 'COD_TP_DESPESA'
      Origin = '"TIPO_DESPESA"."COD_TP_DESPESA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsTipoDespesasDESCRICAO: TStringField
      Tag = 2
      DisplayLabel = 'Descricao'
      FieldName = 'DESCRICAO'
      Origin = '"TIPO_DESPESA"."DESCRICAO"'
      Size = 50
    end
    object cdsTipoDespesasN_CONTA_PLC: TFloatField
      DisplayLabel = 'N Conta'
      FieldName = 'N_CONTA_PLC'
    end
    object cdsTipoDespesasATIVO: TSmallintField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
      Origin = '"TIPO_DESPESA"."ATIVO"'
      Visible = False
    end
  end
  object dsTipoDespesas: TDataSource
    DataSet = cdsTipoDespesas
    Left = 291
    Top = 921
  end
  object qrTipoDespesa: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransCadastroBasico
    SQL.Strings = (
      'Select * from TIPO_DESPESA'
      ''
      '')
    Left = 291
    Top = 1015
  end
  object dsTipoDespesa: TDataSource
    DataSet = qrTipoDespesa
    Left = 291
    Top = 1066
  end
  object IBTransTipoDespesa: TIBTransaction
    DefaultDatabase = dtmAtivo.bancoHw
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 291
    Top = 1118
  end
  object qrCEP: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransCadastroBasico
    SQL.Strings = (
      'Select * from CEP'
      ''
      '')
    Left = 357
    Top = 1039
  end
  object dsCEP: TDataSource
    DataSet = qrCEP
    Left = 357
    Top = 1094
  end
  object IBTransCEP: TIBTransaction
    DefaultDatabase = dtmAtivo.bancoHw
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 357
    Top = 1150
  end
  object qrCEPs: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransCEP
    SQL.Strings = (
      'SELECT * FROM CEP')
    Left = 357
    Top = 795
  end
  object dspCEPs: TDataSetProvider
    DataSet = qrCEPs
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 357
    Top = 845
  end
  object cdsCEPs: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCEPs'
    BeforeOpen = CdsDepartamentosBeforeOpen
    Left = 357
    Top = 899
    object cdsCEPsCOD_CEP: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Cep'
      FieldName = 'COD_CEP'
      Required = True
    end
    object cdsCEPsCOD_CORREIOS: TStringField
      Tag = 2
      DisplayLabel = 'CEP'
      FieldName = 'COD_CORREIOS'
      EditMask = '00000\-999;0;'
      FixedChar = True
      Size = 9
    end
    object cdsCEPsENDERECO: TStringField
      DisplayLabel = 'Logradouro'
      FieldName = 'ENDERECO'
      Size = 50
    end
    object cdsCEPsBAIRRO: TStringField
      DisplayLabel = 'Bairro'
      FieldName = 'BAIRRO'
      Size = 50
    end
    object cdsCEPsCIDADE: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'CIDADE'
      Size = 50
    end
    object cdsCEPsESTADO: TStringField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
      Size = 50
    end
    object cdsCEPsCOD_BAIRRO: TIntegerField
      DisplayLabel = 'Cod Bairro'
      FieldName = 'COD_BAIRRO'
    end
    object cdsCEPsCOD_CIDADE: TIntegerField
      DisplayLabel = 'Cod cidade'
      FieldName = 'COD_CIDADE'
    end
    object cdsCEPsCOD_ESTADO: TIntegerField
      DisplayLabel = 'Cod Estado'
      FieldName = 'COD_ESTADO'
    end
    object cdsCEPsATIVO: TSmallintField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
    object cdsCEPsSIGLA_ESTADO: TStringField
      DisplayLabel = 'Sigla estado'
      FieldName = 'SIGLA_ESTADO'
      FixedChar = True
      Size = 2
    end
  end
  object dsCEPs: TDataSource
    DataSet = cdsCEPs
    Left = 357
    Top = 953
  end
  object qrAbreCidades: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransPesquisa
    SQL.Strings = (
      'SELECT * FROM CIDADES WHERE ativo=1')
    Left = 796
    Top = 846
    object qrAbreCidadesCOD_CIDADE: TIntegerField
      FieldName = 'COD_CIDADE'
      Origin = '"CIDADES"."COD_CIDADE"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrAbreCidadesNOME_CIDADE: TIBStringField
      FieldName = 'NOME_CIDADE'
      Origin = '"CIDADES"."NOME_CIDADE"'
      Size = 30
    end
  end
  object dsAbreCidades: TDataSource
    DataSet = qrAbreCidades
    Left = 879
    Top = 843
  end
  object qrAbreBairros: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransPesquisa
    SQL.Strings = (
      'SELECT * FROM BAIRROS WHERE ativo=1')
    Left = 796
    Top = 904
    object qrAbreBairrosCOD_BAIRRO: TIntegerField
      FieldName = 'COD_BAIRRO'
      Origin = '"BAIRROS"."COD_BAIRRO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrAbreBairrosNOME_BAIRRO: TIBStringField
      FieldName = 'NOME_BAIRRO'
      Origin = '"BAIRROS"."NOME_BAIRRO"'
      Size = 30
    end
  end
  object dsAbreBairros: TDataSource
    DataSet = qrAbreBairros
    Left = 879
    Top = 906
  end
  object qrTAG: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransCadastroBasico
    SQL.Strings = (
      'Select * from MACRO'
      ''
      '')
    Left = 493
    Top = 1038
  end
  object dsTAG: TDataSource
    DataSet = qrTAG
    Left = 493
    Top = 1093
  end
  object IBTransTAG: TIBTransaction
    DefaultDatabase = dtmAtivo.bancoHw
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 493
    Top = 1149
  end
  object qrTAGs: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransTAG
    SQL.Strings = (
      'SELECT * FROM MACRO')
    Left = 493
    Top = 794
  end
  object dspTAGs: TDataSetProvider
    DataSet = qrTAGs
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 493
    Top = 844
  end
  object cdsTAGs: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTAGs'
    BeforeOpen = CdsDepartamentosBeforeOpen
    Left = 493
    Top = 898
    object cdsTAGsMACRO: TIntegerField
      Tag = 2
      DisplayLabel = 'Cod TAG'
      FieldName = 'MACRO'
      Required = True
    end
    object cdsTAGsCODIGO: TIntegerField
      Tag = 1
      DisplayLabel = 'Padrao'
      FieldName = 'CODIGO'
      Required = True
    end
    object cdsTAGsNOME: TStringField
      Tag = 2
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Size = 64
    end
    object cdsTAGsDESCRICAO: TStringField
      DisplayLabel = 'Descricao'
      FieldName = 'DESCRICAO'
      Size = 64
    end
    object cdsTAGsTABELA: TStringField
      DisplayLabel = 'Tabela'
      FieldName = 'TABELA'
      Size = 40
    end
    object cdsTAGsCAMPO: TStringField
      DisplayLabel = 'Campo'
      FieldName = 'CAMPO'
      Size = 40
    end
    object cdsTAGsRELACIONAMENTO: TIntegerField
      Tag = 1
      DisplayLabel = 'Relacionamento'
      FieldName = 'RELACIONAMENTO'
    end
    object cdsTAGsTABELA_RELAC: TStringField
      DisplayLabel = 'Tabela de relacionamento'
      FieldName = 'TABELA_RELAC'
      Size = 40
    end
    object cdsTAGsCAMPO_RELAC: TStringField
      DisplayLabel = 'Campo de relacionamento'
      FieldName = 'CAMPO_RELAC'
      Size = 40
    end
    object cdsTAGsCAMPO_RETORNO: TStringField
      DisplayLabel = 'Campo de exibicao'
      FieldName = 'CAMPO_RETORNO'
      Size = 40
    end
    object cdsTAGsBASE: TIntegerField
      Tag = 1
      DisplayLabel = 'Padrao 2'
      FieldName = 'BASE'
      Required = True
    end
    object cdsTAGsATIVO: TIntegerField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
    object cdsTAGsRELACIONAMENTO2: TIntegerField
      DisplayLabel = 'Relacionamento 2'
      FieldName = 'RELACIONAMENTO2'
    end
    object cdsTAGsCAMPO2: TStringField
      DisplayLabel = 'Campo 2'
      FieldName = 'CAMPO2'
      Size = 40
    end
    object cdsTAGsTABELA_RELAC2: TStringField
      DisplayLabel = 'Tabela de relacionamento 2'
      FieldName = 'TABELA_RELAC2'
      Size = 40
    end
    object cdsTAGsCAMPO_RELAC2: TStringField
      DisplayLabel = 'Campo de relacionamento 2'
      FieldName = 'CAMPO_RELAC2'
      Size = 40
    end
  end
  object dsTAGs: TDataSource
    DataSet = cdsTAGs
    Left = 493
    Top = 952
  end
  object dsBuscaTAG: TDataSource
    AutoEdit = False
    DataSet = qrBuscaTAG
    Left = 879
    Top = 962
  end
  object qrBuscaTAG: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransPesquisa
    SQL.Strings = (
      'SELECT * FROM MACRO')
    Left = 797
    Top = 965
  end
  object qrContratos: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransCadastroBasico
    SQL.Strings = (
      'SELECT * FROM CONTRATO')
    Left = 699
    Top = 787
  end
  object dspContratos: TDataSetProvider
    DataSet = qrContratos
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 699
    Top = 835
  end
  object cdsContratos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspContratos'
    BeforeOpen = CdsDepartamentosBeforeOpen
    Left = 699
    Top = 886
    object cdsContratosCOD_CONTRATO: TIntegerField
      Tag = 1
      DisplayLabel = 'Padr'#227'o'
      FieldName = 'COD_CONTRATO'
      Required = True
    end
    object cdsContratosCODIGO: TIntegerField
      Tag = 2
      DisplayLabel = 'Cod Contrato'
      FieldName = 'CODIGO'
      Required = True
    end
    object cdsContratosCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod empresa'
      FieldName = 'COD_EMPRESA'
    end
    object cdsContratosDESCRICAO: TStringField
      Tag = 2
      DisplayLabel = 'Descricao'
      FieldName = 'DESCRICAO'
      Size = 70
    end
    object cdsContratosFORMULARIO: TStringField
      DisplayLabel = 'Formulario'
      FieldName = 'FORMULARIO'
      Size = 70
    end
    object cdsContratosTIPO: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 70
    end
    object cdsContratosTEXTO: TMemoField
      Tag = 1
      DisplayLabel = 'Texto'
      FieldName = 'TEXTO'
      BlobType = ftMemo
      Size = 8
    end
    object cdsContratosATIVO: TSmallintField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
    object cdsContratosTIPO_ARQUIVO: TStringField
      Tag = 1
      DisplayLabel = 'Tipo arquivo'
      FieldName = 'TIPO_ARQUIVO'
      FixedChar = True
      Size = 1
    end
  end
  object dsContratos: TDataSource
    DataSet = cdsContratos
    Left = 699
    Top = 932
  end
  object qrContrato: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransContrato
    SQL.Strings = (
      'Select * from CONTRATO'
      ''
      '')
    Left = 563
    Top = 1018
  end
  object dsContrato: TDataSource
    DataSet = qrContrato
    Left = 563
    Top = 1069
  end
  object IBTransContrato: TIBTransaction
    DefaultDatabase = dtmAtivo.bancoHw
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 563
    Top = 1121
  end
  object qrTABELA: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransCadastroBasico
    Left = 661
    Top = 1024
  end
  object qrOpcional: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransOpcionais
    SQL.Strings = (
      'SELECT * FROM OPCIONAIS')
    Left = 19
    Top = 1209
  end
  object dspOpcional: TDataSetProvider
    DataSet = qrOpcional
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 19
    Top = 1257
  end
  object cdsOpcional: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspOpcional'
    BeforeOpen = CdsDepartamentosBeforeOpen
    Left = 19
    Top = 1308
    object cdsOpcionalCOD_OPCIONAIS: TIntegerField
      Tag = 2
      DisplayLabel = 'Cod Opcional'
      FieldName = 'COD_OPCIONAIS'
      Required = True
    end
    object cdsOpcionalCODIGO_FABRICA: TStringField
      DisplayLabel = 'Cod Fabrica'
      FieldName = 'CODIGO_FABRICA'
      Size = 30
    end
    object cdsOpcionalDESCRICAO: TStringField
      Tag = 2
      DisplayLabel = 'Descricao'
      FieldName = 'DESCRICAO'
      Size = 80
    end
    object cdsOpcionalATIVO: TSmallintField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
  end
  object dsOpcional: TDataSource
    DataSet = cdsOpcional
    Left = 19
    Top = 1354
  end
  object qrOpcionais: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransCadastroBasico
    SQL.Strings = (
      'Select * from OPCIONAIS'
      ''
      '')
    Left = 19
    Top = 1448
  end
  object dsOpcionais: TDataSource
    DataSet = qrOpcionais
    Left = 19
    Top = 1499
  end
  object IBTransOpcionais: TIBTransaction
    DefaultDatabase = dtmAtivo.bancoHw
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 19
    Top = 1551
  end
  object qrKitsOpcionais: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransKitOpcional
    SQL.Strings = (
      'SELECT * FROM KITS_OPCIONAIS')
    Left = 91
    Top = 1233
  end
  object dspKitsOpcionais: TDataSetProvider
    DataSet = qrKitsOpcionais
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 91
    Top = 1281
  end
  object cdsKitsOpcionais: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspKitsOpcionais'
    BeforeOpen = CdsDepartamentosBeforeOpen
    Left = 91
    Top = 1332
    object cdsKitsOpcionaisCOD_KITS_VEICULOS: TIntegerField
      FieldName = 'COD_KITS_VEICULOS'
      Required = True
    end
    object cdsKitsOpcionaisCOD_OPCIONAIS: TIntegerField
      FieldName = 'COD_OPCIONAIS'
      Required = True
    end
  end
  object dsKitsOpcionais: TDataSource
    DataSet = cdsKitsOpcionais
    Left = 91
    Top = 1378
  end
  object qrKitOpcional: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransCadastroBasico
    SQL.Strings = (
      'Select * from OPCIONAIS'
      ''
      '')
    Left = 91
    Top = 1472
  end
  object dsKitOpcional: TDataSource
    DataSet = qrKitOpcional
    Left = 91
    Top = 1523
  end
  object IBTransKitOpcional: TIBTransaction
    DefaultDatabase = dtmAtivo.bancoHw
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 91
    Top = 1575
  end
  object qrAbreCor: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransPesquisa
    SQL.Strings = (
      'SELECT * FROM CODIGO_CORFAB WHERE COD_COR=0')
    Left = 666
    Top = 1084
    object qrAbreCorCOD_COR: TIntegerField
      FieldName = 'COD_COR'
      Origin = '"CODIGO_CORFAB"."COD_COR"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrAbreCorDESCRICAO_COR: TIBStringField
      FieldName = 'DESCRICAO_COR'
      Origin = '"CODIGO_CORFAB"."DESCRICAO_COR"'
      FixedChar = True
      Size = 30
    end
    object qrAbreCorCODCORDENATRAM: TIntegerField
      FieldName = 'CODCORDENATRAM'
      Origin = '"CODIGO_CORFAB"."CODCORDENATRAM"'
    end
  end
  object dsLocCor: TDataSource
    DataSet = qrAbreCor
    Left = 749
    Top = 1082
  end
  object qrEspecies: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransEspecie
    SQL.Strings = (
      'SELECT * FROM ESPECIE_VEICULO')
    Left = 218
    Top = 800
  end
  object dspEspecies: TDataSetProvider
    DataSet = qrEspecies
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 218
    Top = 848
  end
  object cdsEspecies: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEspecies'
    BeforeOpen = CdsDepartamentosBeforeOpen
    Left = 218
    Top = 899
    object cdsEspeciesCODIGO_ESP: TIntegerField
      Tag = 2
      DisplayLabel = 'Cod Especie'
      FieldName = 'CODIGO_ESP'
      Required = True
    end
    object cdsEspeciesDESCRICAO_ESP: TStringField
      Tag = 2
      DisplayLabel = 'Descricao'
      FieldName = 'DESCRICAO_ESP'
      FixedChar = True
      Size = 30
    end
    object cdsEspeciesOBSERVACAO_ESP: TStringField
      DisplayLabel = 'Observacao'
      FieldName = 'OBSERVACAO_ESP'
      FixedChar = True
      Size = 40
    end
    object cdsEspeciesATIVO: TIntegerField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
  end
  object dsEspecies: TDataSource
    DataSet = cdsEspecies
    Left = 218
    Top = 945
  end
  object qrEspecie: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransCadastroBasico
    SQL.Strings = (
      'Select * from TIPO_PENDENCIA'
      ''
      '')
    Left = 218
    Top = 1039
  end
  object dsEspecie: TDataSource
    DataSet = qrEspecie
    Left = 218
    Top = 1090
  end
  object IBTransEspecie: TIBTransaction
    DefaultDatabase = dtmAtivo.bancoHw
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 218
    Top = 1142
  end
  object cdsRegCFOPCST: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRegCFOPCST'
    BeforeOpen = CdsDepartamentosBeforeOpen
    Left = 896
    Top = 296
    object cdsRegCFOPCSTCFOP: TFloatField
      FieldName = 'CFOP'
    end
    object cdsRegCFOPCSTCST: TStringField
      FieldName = 'CST'
      Required = True
      FixedChar = True
      Size = 3
    end
    object cdsRegCFOPCSTCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
      Visible = False
    end
    object cdsRegCFOPCSTICMS_OBRIGATORIO: TStringField
      DisplayLabel = 'Destacar ICMS'
      FieldName = 'ICMS_OBRIGATORIO'
      FixedChar = True
      Size = 1
    end
    object cdsRegCFOPCSTICMSST_OBRIGATORIO: TStringField
      DisplayLabel = 'Destacar ICMS ST'
      FieldName = 'ICMSST_OBRIGATORIO'
      FixedChar = True
      Size = 1
    end
  end
  object qrRegCFOPCST: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransCadastroBasico
    SQL.Strings = (
      'select * from CFOP_CST_ENTRADA')
    Left = 893
    Top = 207
  end
  object dspRegCFOPCST: TDataSetProvider
    DataSet = qrRegCFOPCST
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 893
    Top = 254
  end
  object dsRegCFOPCST: TDataSource
    DataSet = cdsRegCFOPCST
    Left = 893
    Top = 342
  end
  object qrAbreEstados: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransPesquisa
    SQL.Strings = (
      'SELECT * FROM ESTADOS WHERE ATIVO = 1')
    Left = 744
    Top = 774
    object qrAbreEstadosCODIGO_UF: TIntegerField
      FieldName = 'CODIGO_UF'
      Origin = '"ESTADOS"."CODIGO_UF"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrAbreEstadosNOME_UF: TIBStringField
      FieldName = 'NOME_UF'
      Origin = '"ESTADOS"."NOME_UF"'
      Size = 30
    end
    object qrAbreEstadosSIGLA_UF: TIBStringField
      FieldName = 'SIGLA_UF'
      Origin = '"ESTADOS"."SIGLA_UF"'
      FixedChar = True
      Size = 2
    end
  end
  object dsAbreEstados: TDataSource
    DataSet = qrAbreEstados
    Left = 833
    Top = 772
  end
  object qrContaLig: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransCadastroBasico
    SQL.Strings = (
      'select * from CONT_LIG')
    Left = 817
    Top = 5
  end
  object dspContaLig: TDataSetProvider
    DataSet = qrContaLig
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 817
    Top = 48
  end
  object cdsContaLig: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspContaLig'
    BeforeOpen = CdsDepartamentosBeforeOpen
    Left = 817
    Top = 93
    object cdsContaLigCOD_EMP: TIntegerField
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMP'
      Required = True
    end
    object cdsContaLigNCON_V_PROD: TFloatField
      DisplayLabel = 'N'#186' da Conta Venda Produtos'
      FieldName = 'NCON_V_PROD'
    end
    object cdsContaLigCONTR_V_PROD: TIntegerField
      DisplayLabel = 'Controle Correspondente'
      FieldName = 'CONTR_V_PROD'
    end
    object cdsContaLigNCON_V_SERV: TFloatField
      DisplayLabel = 'N'#186' de Conta Venda Servi'#231'o'
      FieldName = 'NCON_V_SERV'
    end
    object cdsContaLigCONTR_V_SERV: TIntegerField
      DisplayLabel = 'Controle Correspondente'
      FieldName = 'CONTR_V_SERV'
    end
    object cdsContaLigNCON_C_PROD: TFloatField
      DisplayLabel = 'N'#186' Conta Compra Produtos'
      FieldName = 'NCON_C_PROD'
    end
    object cdsContaLigCONTR_C_PROD: TIntegerField
      DisplayLabel = 'Controle Correspondente'
      FieldName = 'CONTR_C_PROD'
    end
    object cdsContaLigNCON_C_VEIC: TFloatField
      DisplayLabel = 'N'#186' Conta Compra Ve'#237'culos'
      FieldName = 'NCON_C_VEIC'
    end
    object cdsContaLigCONTR_C_VEIC: TIntegerField
      DisplayLabel = 'Controle Correspondente'
      FieldName = 'CONTR_C_VEIC'
    end
    object cdsContaLigNCON_S_CHQ: TFloatField
      DisplayLabel = 'N'#186' Conta Sa'#237'da Cheques'
      FieldName = 'NCON_S_CHQ'
    end
    object cdsContaLigCONTR_S_CHQ: TIntegerField
      DisplayLabel = 'Controle Correspondente'
      FieldName = 'CONTR_S_CHQ'
    end
    object cdsContaLigNCON_S_CRD: TFloatField
      DisplayLabel = 'N'#186' Conta Sa'#237'da Cr'#233'ditos Padr'#227'o'
      FieldName = 'NCON_S_CRD'
    end
    object cdsContaLigCONTR_S_CRD: TIntegerField
      DisplayLabel = 'Controle Correspondente'
      FieldName = 'CONTR_S_CRD'
    end
    object cdsContaLigCONTA_ICM: TFloatField
      DisplayLabel = 'Conta ICMS Ve'#237'culo'
      FieldName = 'CONTA_ICM'
    end
    object cdsContaLigCONTA_PIS: TFloatField
      DisplayLabel = 'Conta PIS/COFINS V.'
      FieldName = 'CONTA_PIS'
    end
    object cdsContaLigGR_REINV: TIntegerField
      Tag = 1
      FieldName = 'GR_REINV'
    end
    object cdsContaLigNCON_D_PREST: TFloatField
      DisplayLabel = 'Conta Desc. Prest.'
      FieldName = 'NCON_D_PREST'
    end
    object cdsContaLigNCON_J_PREST: TFloatField
      DisplayLabel = 'Conta Juros Prest.'
      FieldName = 'NCON_J_PREST'
    end
    object cdsContaLigNCON_MANU_EQUIP: TFloatField
      FieldName = 'NCON_MANU_EQUIP'
    end
    object cdsContaLigCONTR_MANU_EQUIP: TIntegerField
      FieldName = 'CONTR_MANU_EQUIP'
    end
    object cdsContaLigNCON_TARIFABANCARIA: TFloatField
      FieldName = 'NCON_TARIFABANCARIA'
    end
    object cdsContaLigNCON_LANCDIFCTP: TFloatField
      DisplayLabel = 'Conta Lanc. diferen'#231'a CTP'
      FieldName = 'NCON_LANCDIFCTP'
    end
    object cdsContaLigNCON_SOBRA: TFloatField
      FieldName = 'NCON_SOBRA'
    end
    object cdsContaLigNCON_QUEBRA: TFloatField
      FieldName = 'NCON_QUEBRA'
    end
    object cdsContaLigNCON_ED_PREST: TFloatField
      FieldName = 'NCON_ED_PREST'
    end
    object cdsContaLigNCON_SJ_PREST: TFloatField
      FieldName = 'NCON_SJ_PREST'
    end
    object cdsContaLigNCON_S_VALE: TFloatField
      FieldName = 'NCON_S_VALE'
    end
    object cdsContaLigNCON_TARIFAINTERMPAG: TFloatField
      FieldName = 'NCON_TARIFAINTERMPAG'
    end
    object cdsContaLigNCON_ENT_DESCDESP: TFloatField
      FieldName = 'NCON_ENT_DESCDESP'
    end
    object cdsContaLigNCON_C_FRETE: TFloatField
      FieldName = 'NCON_C_FRETE'
    end
    object cdsContaLigNCON_E_TRANSF: TFloatField
      FieldName = 'NCON_E_TRANSF'
    end
    object cdsContaLigNCON_S_TRANSF: TFloatField
      FieldName = 'NCON_S_TRANSF'
    end
    object cdsContaLigCONTR_REC: TIntegerField
      FieldName = 'CONTR_REC'
    end
  end
  object dsContaLig: TDataSource
    DataSet = cdsContaLig
    Left = 817
    Top = 139
  end
  object qrKitsVeiculos: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransKitVeiculo
    SQL.Strings = (
      'SELECT * FROM KITS_VEICULOS')
    Left = 179
    Top = 1201
  end
  object dspKitsVeiculos: TDataSetProvider
    DataSet = qrKitsVeiculos
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 179
    Top = 1249
  end
  object cdsKitsVeiculos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspKitsOpcionais'
    BeforeOpen = CdsDepartamentosBeforeOpen
    Left = 179
    Top = 1300
    object cdsKitsVeiculosCOD_KITS_VEICULOS: TIntegerField
      FieldName = 'COD_KITS_VEICULOS'
      Required = True
    end
    object cdsKitsVeiculosCOD_OPCIONAIS: TIntegerField
      FieldName = 'COD_OPCIONAIS'
      Required = True
    end
  end
  object dsKitsVeiculos: TDataSource
    DataSet = cdsKitsVeiculos
    Left = 179
    Top = 1346
  end
  object qrKitVeiculo: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransCadastroBasico
    SQL.Strings = (
      'Select * from OPCIONAIS'
      ''
      '')
    Left = 179
    Top = 1440
  end
  object dsKitVeiculo: TDataSource
    DataSet = qrKitVeiculo
    Left = 179
    Top = 1491
  end
  object IBTransKitVeiculo: TIBTransaction
    DefaultDatabase = dtmAtivo.bancoHw
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 179
    Top = 1543
  end
  object cdsKitsVeiculosIBQuery: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransKitOpcional
    SQL.Strings = (
      'SELECT * FROM OPCIONAIS')
    Left = 91
    Top = 1233
  end
  object cdsKitsVeiculosDataSetProvider: TDataSetProvider
    DataSet = qrKitsOpcionais
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 91
    Top = 1281
  end
  object cdsKitsVeiculosClientDataSet: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspKitsOpcionais'
    BeforeOpen = CdsDepartamentosBeforeOpen
    Left = 91
    Top = 1332
    object IntegerField1: TIntegerField
      Tag = 2
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_OPCIONAIS'
      Required = True
    end
    object StringField1: TStringField
      DisplayLabel = 'C'#243'digo de F'#225'brica'
      FieldName = 'CODIGO_FABRICA'
      Size = 30
    end
    object StringField2: TStringField
      Tag = 2
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      Size = 80
    end
    object SmallintField1: TSmallintField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
  end
  object cdsKitsVeiculosDataSource: TDataSource
    DataSet = cdsKitsOpcionais
    Left = 91
    Top = 1378
  end
  object cdsKitsVeiculosIBQuery2: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransCadastroBasico
    SQL.Strings = (
      'Select * from OPCIONAIS'
      ''
      '')
    Left = 91
    Top = 1472
  end
  object cdsKitsVeiculosDataSource2: TDataSource
    DataSet = qrKitOpcional
    Left = 91
    Top = 1523
  end
  object cdsKitsVeiculosIBTransaction: TIBTransaction
    DefaultDatabase = dtmAtivo.bancoHw
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 91
    Top = 1575
  end
  object cdsDescNatOp: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDescNatOp'
    BeforeOpen = CdsDepartamentosBeforeOpen
    Left = 976
    Top = 296
    object cdsDescNatOpCODIGO_NOP: TFloatField
      DisplayLabel = 'CFOP'
      FieldName = 'CODIGO_NOP'
    end
    object cdsDescNatOpDESCRICAO_NOP: TStringField
      DisplayLabel = 'Descri'#231#227'o Natureza de Opera'#231#227'o'
      FieldName = 'DESCRICAO_NOP'
      Required = True
      Size = 100
    end
    object cdsDescNatOpATIVO: TSmallintField
      FieldName = 'ATIVO'
    end
    object cdsDescNatOpNITEM_NOP_DESC: TIntegerField
      DisplayLabel = 'N Item'
      FieldName = 'NITEM_NOP_DESC'
    end
  end
  object qrDescNatOp: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransCadastroBasico
    SQL.Strings = (
      'select * from NAT_OP_DESCRICAO'
      'where codigo_nop = 0 and ativo = 0')
    Left = 973
    Top = 207
  end
  object dspDescNatOp: TDataSetProvider
    DataSet = qrDescNatOp
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 973
    Top = 254
  end
  object dsDescNatOp: TDataSource
    DataSet = cdsDescNatOp
    Left = 973
    Top = 342
  end
  object qrCtLigContabil: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransCadastroBasico
    SQL.Strings = (
      'select * from CONT_LIG_CONTABIL')
    Left = 895
    Top = 5
  end
  object dspCtLigContabil: TDataSetProvider
    DataSet = qrCtLigContabil
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 895
    Top = 48
  end
  object cdsCtLigContabil: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCtLigContabil'
    BeforeOpen = CdsDepartamentosBeforeOpen
    Left = 895
    Top = 93
    object cdsCtLigContabilCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
    end
    object cdsCtLigContabilCOD_CTA_ESTOQUE: TStringField
      DisplayLabel = 'Conta Estoque Mercadorias'
      FieldName = 'COD_CTA_ESTOQUE'
      Size = 60
    end
    object cdsCtLigContabilCOD_CTA_CMV: TStringField
      DisplayLabel = 'Conta CMV'
      FieldName = 'COD_CTA_CMV'
      Size = 60
    end
    object cdsCtLigContabilCOD_CTA_EST_VEIC_NOVO: TStringField
      DisplayLabel = 'Conta Estoque Ve'#237'culos Novos'
      FieldName = 'COD_CTA_EST_VEIC_NOVO'
      Size = 60
    end
    object cdsCtLigContabilCOD_CTA_EST_VEIC_SEMI: TStringField
      DisplayLabel = 'Conta Estoque Ve'#237'culos Usados'
      FieldName = 'COD_CTA_EST_VEIC_SEMI'
      Size = 60
    end
  end
  object dsCtLigContabil: TDataSource
    DataSet = cdsCtLigContabil
    Left = 895
    Top = 139
  end
  object qrTipoPreco: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransTipoPreco
    Left = 653
    Top = 508
  end
  object IBTransTipoPreco: TIBTransaction
    DefaultDatabase = dtmAtivo.bancoHw
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 705
    Top = 506
  end
  object IBTransBox: TIBTransaction
    DefaultDatabase = dtmAtivo.bancoHw
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 817
    Top = 694
  end
  object qrBox: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransCadastroBasico
    SQL.Strings = (
      'select * from BOX')
    Left = 957
    Top = 5
  end
  object dspBox: TDataSetProvider
    DataSet = qrBox
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 957
    Top = 48
  end
  object cdsBox: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspBox'
    BeforeOpen = cdsBoxBeforeOpen
    Left = 957
    Top = 93
    object cdsBoxCOD_BOX: TIntegerField
      Tag = 2
      DisplayLabel = 'Cod Box'
      FieldName = 'COD_BOX'
      Required = True
    end
    object cdsBoxCOD_EMPRESA: TIntegerField
      Tag = 1
      FieldName = 'COD_EMPRESA'
      Required = True
      Visible = False
    end
    object cdsBoxDESCR_BOX: TStringField
      Tag = 2
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCR_BOX'
      Size = 30
    end
    object cdsBoxTMO_SERVICOS: TFloatField
      Tag = 2
      DisplayLabel = 'Tmo'
      FieldName = 'TMO_SERVICOS'
    end
    object cdsBoxATIVO: TIntegerField
      Tag = 1
      FieldName = 'ATIVO'
    end
  end
  object dsBox: TDataSource
    DataSet = cdsBox
    Left = 957
    Top = 139
  end
  object qrFeriado: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransCadastroBasico
    SQL.Strings = (
      'select * from Feriado')
    Left = 1013
    Top = 3
  end
  object dspFeriado: TDataSetProvider
    DataSet = qrFeriado
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1013
    Top = 46
  end
  object cdsFeriado: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFeriado'
    BeforeOpen = cdsFeriadoBeforeOpen
    Left = 1013
    Top = 91
    object cdsFeriadoCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Codigo Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsFeriadoDATA_FERIADO: TDateTimeField
      Tag = 2
      DisplayLabel = 'Data Feriado'
      FieldName = 'DATA_FERIADO'
      Required = True
      EditMask = '!99/99/0000;1;_'
    end
    object cdsFeriadoDESCR_FERIADO: TStringField
      Tag = 2
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCR_FERIADO'
      Size = 60
    end
    object cdsFeriadoTIPO_FERIADO: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO_FERIADO'
      Size = 10
    end
    object cdsFeriadoTURNO: TStringField
      Tag = 2
      DisplayLabel = 'Turno'
      FieldName = 'TURNO'
      FixedChar = True
      Size = 1
    end
    object cdsFeriadoATIVO: TIntegerField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
  end
  object dsFeriado: TDataSource
    DataSet = cdsFeriado
    Left = 1013
    Top = 137
  end
  object dspModCartas: TDataSetProvider
    DataSet = qrModCartas
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 888
    Top = 464
  end
  object qrModCartas: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransModCartas
    SQL.Strings = (
      'SELECT MODCARTAS.*,'
      'MSG_APLICATIVO.APLICATIVO FROM MODCARTAS'
      
        'LEFT JOIN MSG_APLICATIVO ON MSG_APLICATIVO.ID = MODCARTAS.ID_MSG' +
        '_APLICATIVO'
      'WHERE COALESCE(MODCARTAS.ATIVO, 0) <> 1')
    Left = 888
    Top = 417
  end
  object cdsModCartas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspModCartas'
    BeforeOpen = CdsDepartamentosBeforeOpen
    Left = 888
    Top = 509
    object cdsModCartasCOD_CARTA: TIntegerField
      Tag = 2
      DisplayLabel = 'Codigo'
      FieldName = 'COD_CARTA'
      Required = True
    end
    object cdsModCartasCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsModCartasDESCRICAO: TStringField
      Tag = 2
      DisplayLabel = 'Descricao'
      FieldName = 'DESCRICAO'
      FixedChar = True
      Size = 64
    end
    object cdsModCartasDADOS_CARTA: TMemoField
      DisplayLabel = 'Dados'
      FieldName = 'DADOS_CARTA'
      OnGetText = cdsModCartasDADOS_CARTAGetText
      BlobType = ftMemo
      Size = 8
    end
    object cdsModCartasATIVO: TIntegerField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
    object cdsModCartasCOBRANCA: TStringField
      Tag = 1
      DisplayLabel = 'Cobranca'
      FieldName = 'COBRANCA'
      FixedChar = True
      Size = 1
    end
    object cdsModCartasTIPO: TStringField
      Tag = 1
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Required = True
      FixedChar = True
      Size = 3
    end
    object cdsModCartasFORMULARIOS: TStringField
      DisplayLabel = 'Formularios'
      FieldName = 'FORMULARIOS'
      Size = 64
    end
    object cdsModCartasTIPO_CONTRATO: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO_CONTRATO'
      Size = 64
    end
    object cdsModCartasUSAR_SERVICO: TStringField
      DisplayLabel = 'Usar servico'
      FieldName = 'USAR_SERVICO'
      FixedChar = True
      Size = 1
    end
    object cdsModCartasCOD_ORIG_PLATAFORMA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Aplicativo'
      FieldName = 'ID_MSG_APLICATIVO'
    end
    object cdsModCartasTEMPLATE: TStringField
      DisplayLabel = 'Template'
      FieldName = 'TEMPLATE'
      Size = 64
    end
    object cdsModCartasPLATAFORMA: TStringField
      DisplayLabel = 'Aplicativo'
      FieldName = 'APLICATIVO'
      Size = 50
    end
    object cdsModCartasID_CONSULTAS_SQL: TStringField
      DisplayLabel = 'Consulta Sql'
      FieldName = 'ID_CONSULTAS_SQL'
      Size = 36
    end
    object cdsModCartasUNICO_DOC: TStringField
      DisplayLabel = 'Doc'
      FieldName = 'DOC'
      Size = 1
    end
  end
  object dsModCartas: TDataSource
    DataSet = cdsModCartas
    Left = 888
    Top = 554
  end
  object IBTransModCartas: TIBTransaction
    DefaultDatabase = dtmAtivo.bancoHw
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 886
    Top = 600
  end
  object spModCarta: TIBStoredProc
    Database = dtmAtivo.bancoHw
    Transaction = IBTransModCartas
    StoredProcName = 'INCREMENTA_CODIGO'
    Left = 969
    Top = 600
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
  object qrTipoVendas: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransCadastroBasico
    SQL.Strings = (
      'select * from tipo_vendas')
    Left = 1079
    Top = 3
  end
  object dspTipoVendas: TDataSetProvider
    DataSet = qrTipoVendas
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1079
    Top = 46
  end
  object cdsTipoVendas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTipoVendas'
    BeforeOpen = cdsTipoVendasBeforeOpen
    Left = 1079
    Top = 91
    object cdsTipoVendasCOD_TIPO: TIntegerField
      Tag = 2
      DisplayLabel = 'Codigo'
      FieldName = 'COD_TIPO'
      Required = True
    end
    object cdsTipoVendasTIPO: TStringField
      Tag = 2
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Required = True
      FixedChar = True
      Size = 3
    end
    object cdsTipoVendasDESCRICAO: TStringField
      Tag = 2
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      Required = True
      Size = 40
    end
    object cdsTipoVendasTIPO_OS: TStringField
      Tag = 2
      DisplayLabel = 'Tipo OS'
      FieldName = 'TIPO_OS'
      Size = 40
    end
    object cdsTipoVendasSIGLA: TStringField
      Tag = 2
      DisplayLabel = 'Sigla'
      FieldName = 'SIGLA'
      FixedChar = True
      Size = 1
    end
    object cdsTipoVendasVENDA: TStringField
      Tag = 2
      DisplayLabel = 'Venda'
      FieldName = 'VENDA'
      FixedChar = True
      Size = 1
    end
    object cdsTipoVendasVENDA_CNT: TStringField
      Tag = 2
      DisplayLabel = 'Venda CNT'
      FieldName = 'VENDA_CNT'
      FixedChar = True
      Size = 1
    end
    object cdsTipoVendasATIVO: TSmallintField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
      Visible = False
    end
    object cdsTipoVendasCOMGARANTIA: TStringField
      Tag = 2
      DisplayLabel = 'Com Garantia'
      FieldName = 'COMGARANTIA'
      FixedChar = True
      Size = 1
    end
    object cdsTipoVendasPERMITIR_CUPOM_SERVICO: TStringField
      Tag = 2
      DisplayLabel = 'Permitir Cupom Servi'#231'o'
      FieldName = 'PERMITIR_CUPOM_SERVICO'
      FixedChar = True
      Size = 1
    end
    object cdsTipoVendasORDEMEXIBICAO: TSmallintField
      Tag = 2
      DisplayLabel = 'Ordem Exibi'#231#227'o'
      FieldName = 'ORDEMEXIBICAO'
    end
    object cdsTipoVendasCONFIGFECHVND: TStringField
      Tag = 2
      DisplayLabel = 'Confirmar Fechamento na Venda'
      FieldName = 'CONFIGFECHVND'
      FixedChar = True
      Size = 1
    end
    object cdsTipoVendasUSAR_LIBERACAO_GERENTE: TStringField
      DisplayLabel = 'Usar Libera'#231#227'o Gerente'
      FieldName = 'USAR_LIBERACAO_GERENTE'
      Size = 1
    end
    object cdsTipoVendasUSARPRECOCUSTO: TStringField
      DisplayLabel = 'Usar Pre'#231'o de Custo'
      FieldName = 'USARPRECOCUSTO'
      FixedChar = True
      Size = 1
    end
    object cdsTipoVendasUSAR_LIBERACAO_FINANCEIRO: TStringField
      DisplayLabel = 'Usar Libera'#231#227'o Financeiro'
      FieldName = 'USAR_LIBERACAO_FINANCEIRO'
      Size = 1
    end
    object cdsTipoVendasUSAR_CONFERENCIA_PRODUTO: TStringField
      DisplayLabel = 'Usar Conferencia Itens'
      FieldName = 'USAR_CONFERENCIA_PRODUTO'
      FixedChar = True
      Size = 1
    end
    object cdsTipoVendasN_USAR_CONFERENCIA_PRODUTO: TStringField
      DisplayLabel = 'Nao Usar Conferencia Itens'
      FieldName = 'N_USAR_CONFERENCIA_PRODUTO'
      FixedChar = True
      Size = 1
    end
    object cdsTipoVendasCONSUMO: TStringField
      DisplayLabel = 'Indicador de Consumo'
      FieldName = 'CONSUMO'
      Size = 1
    end
    object cdsTipoVendasOBSERVACAO: TMemoField
      DisplayLabel = 'Observacao'
      FieldName = 'OBSERVACAO'
      OnGetText = cdsTipoVendasOBSERVACAOGetText
      BlobType = ftMemo
      Size = 8
    end
    object cdsTipoVendasTPREST: TStringField
      DisplayLabel = 'Restricao NFE'
      FieldName = 'TPREST'
      FixedChar = True
      Size = 1
    end
    object cdsTipoVendasUSAR_DEBCRED: TStringField
      DisplayLabel = 'Debito e Credito'
      FieldName = 'USAR_DEBCRED'
      FixedChar = True
      Size = 1
    end
    object cdsTipoVendasVERIFICA_FUNCCOLAB_ITOS: TStringField
      DisplayLabel = 'Verifica Func Colaborador'
      FieldName = 'VERIFICA_FUNCCOLAB_ITOS'
      FixedChar = True
      Size = 1
    end
    object cdsTipoVendasENV_EMAIL: TStringField
      DisplayLabel = 'Env Email'
      FieldName = 'ENV_EMAIL'
      FixedChar = True
      Size = 1
    end
    object cdsTipoVendasIMP_CONTRATO_VEIC: TStringField
      DisplayLabel = 'Imprimir contrato'
      FieldName = 'IMP_CONTRATO_VEIC'
      Size = 1
    end
    object cdsTipoVendasAREA_EXEC: TStringField
      DisplayLabel = 'Area Exec'
      FieldName = 'AREA_EXEC'
      Size = 30
    end
    object cdsTipoVendasSALVAR_ITENS_AUTOMATIC: TStringField
      DisplayLabel = 'Salvar itens automaticamente'
      FieldName = 'SALVAR_ITENS_AUTOMATIC'
      FixedChar = True
      Size = 1
    end
    object cdsTipoVendasREPETIR_ITEMVND: TStringField
      DisplayLabel = 'Repetir itens na venda'
      FieldName = 'REPETIR_ITEMVND'
      FixedChar = True
      Size = 1
    end
    object cdsTipoVendasGERAR_PONTOS: TStringField
      DisplayLabel = 'Gerar Pontos'
      FieldName = 'GERAR_PONTOS'
      FixedChar = True
      Size = 1
    end
    object cdsTipoVendasRECEBER_FINANCEIRO: TStringField
      DisplayLabel = 'Receber Financeiro'
      FieldName = 'RECEBER_FINANCEIRO'
      FixedChar = True
      Size = 1
    end
  end
  object dsTipoVendas: TDataSource
    DataSet = cdsTipoVendas
    Left = 1079
    Top = 137
  end
  object qrPerfilComissao: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransCadastroBasico
    SQL.Strings = (
      'select * from perfil_comissao')
    Left = 1164
    Top = 3
  end
  object dspPerfilComissao: TDataSetProvider
    DataSet = qrPerfilComissao
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1164
    Top = 46
  end
  object cdsPerfilComissao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPerfilComissao'
    BeforeOpen = cdsPerfilComissaoBeforeOpen
    Left = 1164
    Top = 91
    object cdsPerfilComissaoCODIGO_PERFIL: TIntegerField
      Tag = 2
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO_PERFIL'
      Required = True
    end
    object cdsPerfilComissaoNOME_PERFIL: TStringField
      Tag = 2
      DisplayLabel = 'Perfil'
      FieldName = 'NOME_PERFIL'
      FixedChar = True
      Size = 30
    end
    object cdsPerfilComissaoTIPO_PERFIL: TStringField
      Tag = 2
      DisplayLabel = 'Agrupado por:'
      FieldName = 'TIPO_PERFIL'
      FixedChar = True
    end
    object cdsPerfilComissaoABRANG_PERFIL: TStringField
      Tag = 2
      DisplayLabel = 'Comiss'#227'o por'
      FieldName = 'ABRANG_PERFIL'
      FixedChar = True
    end
    object cdsPerfilComissaoEM_CIMA_PERFIL: TStringField
      Tag = 2
      DisplayLabel = 'Em Cima'
      FieldName = 'EM_CIMA_PERFIL'
      FixedChar = True
    end
    object cdsPerfilComissaoTIPO_SERV_PROD: TStringField
      Tag = 2
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO_SERV_PROD'
      FixedChar = True
    end
    object cdsPerfilComissaoFLAG_SERV_PROD: TStringField
      Tag = 2
      DisplayLabel = 'Sele'#231#227'o'
      FieldName = 'FLAG_SERV_PROD'
      FixedChar = True
    end
    object cdsPerfilComissaoCONTEUDO_FLAG: TMemoField
      Tag = 2
      DisplayLabel = 'Tipo Sele'#231#227'o'
      FieldName = 'CONTEUDO_FLAG'
      OnGetText = cdsPerfilComissaoCONTEUDO_FLAGGetText
      BlobType = ftMemo
      Size = 8
    end
    object cdsPerfilComissaoTABELAS_PERFIL: TMemoField
      Tag = 2
      DisplayLabel = 'Tabelas Perfil'
      FieldName = 'TABELAS_PERFIL'
      OnGetText = cdsPerfilComissaoTABELAS_PERFILGetText
      BlobType = ftMemo
      Size = 8
    end
    object cdsPerfilComissaoDATA_CADASTRO: TDateTimeField
      Tag = 2
      DisplayLabel = 'Data Perifl'
      FieldName = 'DATA_CADASTRO'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsPerfilComissaoPERC_PESO: TFloatField
      Tag = 2
      DisplayLabel = 'Perc. Peso'
      FieldName = 'PERC_PESO'
    end
    object cdsPerfilComissaoPERC_LANCDEBCRED: TFloatField
      Tag = 2
      DisplayLabel = 'Perc. Lanc. Deb. Cred.'
      FieldName = 'PERC_LANCDEBCRED'
    end
    object cdsPerfilComissaoATIVO: TIntegerField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
      Visible = False
    end
  end
  object dsPerfilComissao: TDataSource
    DataSet = cdsPerfilComissao
    Left = 1164
    Top = 137
  end
  object qrMetasVendas: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransCadastroBasico
    SQL.Strings = (
      
        'select * from METAS_VENDAS WHERE COD_EMPRESA = :COD_EMPRESA AND ' +
        'ATIVO = 1'
      '')
    Left = 1252
    Top = 2
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'COD_EMPRESA'
        ParamType = ptUnknown
      end>
  end
  object dspMetasVendas: TDataSetProvider
    DataSet = qrMetasVendas
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1252
    Top = 45
  end
  object cdsMetasVendas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspMetasVendas'
    BeforeOpen = cdsMetasVendasBeforeOpen
    Left = 1252
    Top = 90
    object cdsMetasVendasCODIGO_META: TIntegerField
      Tag = 2
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO_META'
      Required = True
    end
    object cdsMetasVendasCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Codigo Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
      Visible = False
    end
    object cdsMetasVendasDESCRICAO_META: TStringField
      Tag = 2
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO_META'
      FixedChar = True
      Size = 30
    end
    object cdsMetasVendasVALOR_META: TFloatField
      Tag = 2
      DisplayLabel = 'Valor Inicial Meta'
      FieldName = 'VALOR_META'
      currency = True
    end
    object cdsMetasVendasVALOR_META1: TFloatField
      Tag = 2
      DisplayLabel = 'Valor Final Meta'
      FieldName = 'VALOR_META1'
      currency = True
    end
    object cdsMetasVendasCOMISSAO_META: TFloatField
      Tag = 2
      DisplayLabel = 'Comiss'#227'o'
      FieldName = 'COMISSAO_META'
    end
    object cdsMetasVendasMES_META: TIntegerField
      Tag = 2
      DisplayLabel = 'M'#234's'
      FieldName = 'MES_META'
    end
    object cdsMetasVendasANO_META: TIntegerField
      Tag = 2
      DisplayLabel = 'Ano'
      FieldName = 'ANO_META'
    end
    object cdsMetasVendasTIPO_META: TStringField
      Tag = 2
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO_META'
      FixedChar = True
      Size = 1
    end
    object cdsMetasVendasDATA_CADASTRO: TDateTimeField
      Tag = 2
      DisplayLabel = 'Data'
      FieldName = 'DATA_CADASTRO'
    end
    object cdsMetasVendasATIVO: TIntegerField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
      Visible = False
    end
  end
  object dsMetasVendas: TDataSource
    DataSet = cdsMetasVendas
    Left = 1252
    Top = 136
  end
  object qrTipoComissaoCons: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransCadastroBasico
    Left = 1198
    Top = 417
  end
  object dspTipoComissaoCons: TDataSetProvider
    DataSet = qrTipoComissaoCons
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1198
    Top = 465
  end
  object cdsTipoComissaoCons: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTipoComissaoCons'
    BeforeOpen = cdsPerfilComissaoBeforeOpen
    Left = 1198
    Top = 507
  end
  object dsTipoComissaoCons: TDataSource
    DataSet = cdsTipoComissaoCons
    Left = 1198
    Top = 554
  end
  object qrMetasPerfis: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransCadastroBasico
    SQL.Strings = (
      
        'select pm.*, mv.descricao_meta, pc.nome_perfil from perfil_metas' +
        ' pm'
      
        '      inner join metas_vendas mv on mv.codigo_meta = pm.codigo_m' +
        'eta and mv.cod_empresa = pm.cod_empresa'
      
        '      inner join perfil_comissao pc on pc.codigo_perfil = pm.cod' +
        'igo_perfil '
      'where pm.cod_empresa = :COD_EMPRESA and pm.ativo =1'
      '')
    Left = 1253
    Top = 207
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'COD_EMPRESA'
        ParamType = ptUnknown
      end>
  end
  object dspMetasPerfis: TDataSetProvider
    DataSet = qrMetasPerfis
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1253
    Top = 254
  end
  object cdsMetasPerfis: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspMetasPerfis'
    BeforeOpen = cdsMetasPerfisBeforeOpen
    Left = 1256
    Top = 296
    object cdsMetasPerfisCODIGO_META: TIntegerField
      Tag = 2
      DisplayLabel = 'Cod Meta'
      FieldName = 'CODIGO_META'
      Required = True
    end
    object cdsMetasPerfisDESCRICAO_META: TStringField
      Tag = 2
      DisplayLabel = 'Meta'
      FieldName = 'DESCRICAO_META'
      ProviderFlags = [pfInWhere]
      FixedChar = True
      Size = 30
    end
    object cdsMetasPerfisCODIGO_PERFIL: TIntegerField
      Tag = 2
      DisplayLabel = 'Cod Perfil'
      FieldName = 'CODIGO_PERFIL'
      Required = True
    end
    object cdsMetasPerfisNOME_PERFIL: TStringField
      Tag = 2
      DisplayLabel = 'Perfil'
      FieldName = 'NOME_PERFIL'
      ProviderFlags = [pfInWhere]
      FixedChar = True
      Size = 30
    end
    object cdsMetasPerfisCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
      Visible = False
    end
    object cdsMetasPerfisATIVO: TIntegerField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
      Visible = False
    end
  end
  object dsMetasPerfis: TDataSource
    DataSet = cdsMetasPerfis
    Left = 1253
    Top = 344
  end
  object qrMetasCons: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransCadastroBasico
    SQL.Strings = (
      ' select m.codigo_meta, m.descricao_meta from metas_vendas m'
      ' where m.cod_empresa = 0 and m.ativo = 0')
    Left = 1314
    Top = 415
  end
  object dspMetasCons: TDataSetProvider
    DataSet = qrMetasCons
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1314
    Top = 464
  end
  object cdsMetasCons: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspMetasCons'
    BeforeOpen = cdsPerfilComissaoBeforeOpen
    Left = 1314
    Top = 506
    object cdsMetasConsCODIGO_META: TIntegerField
      FieldName = 'CODIGO_META'
      Required = True
    end
    object cdsMetasConsDESCRICAO_META: TStringField
      FieldName = 'DESCRICAO_META'
      FixedChar = True
      Size = 30
    end
  end
  object dsMetasCons: TDataSource
    DataSet = cdsMetasCons
    Left = 1314
    Top = 553
  end
  object dspPerfilCons: TDataSetProvider
    DataSet = qrPerfilCons
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1181
    Top = 254
  end
  object cdsPerfilCons: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPerfilCons'
    BeforeOpen = cdsPerfilComissaoBeforeOpen
    Left = 1184
    Top = 296
    object cdsPerfilConsCODIGO_PERFIL: TIntegerField
      FieldName = 'CODIGO_PERFIL'
      Required = True
    end
    object cdsPerfilConsNOME_PERFIL: TStringField
      FieldName = 'NOME_PERFIL'
      FixedChar = True
      Size = 30
    end
  end
  object dsPerfilCons: TDataSource
    DataSet = cdsPerfilCons
    Left = 1181
    Top = 345
  end
  object qrPerfilCons: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransCadastroBasico
    SQL.Strings = (
      ' select p.codigo_perfil, p.nome_perfil from perfil_comissao p'
      ' where p.ativo = 0')
    Left = 1181
    Top = 207
  end
  object qrTipoVendasCons: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransCadastroBasico
    SQL.Strings = (
      'select * from TIPO_VENDAS where ativo = 1 and venda = '#39'S'#39)
    Left = 1054
    Top = 417
  end
  object dspTipoVendasCons: TDataSetProvider
    DataSet = qrTipoVendasCons
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1054
    Top = 465
  end
  object cdsTipoVendasCons: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTipoVendasCons'
    BeforeOpen = cdsPerfilComissaoBeforeOpen
    Left = 1054
    Top = 507
    object cdsTipoVendasConsCOD_TIPO: TIntegerField
      FieldName = 'COD_TIPO'
      Required = True
    end
    object cdsTipoVendasConsTIPO: TStringField
      FieldName = 'TIPO'
      Required = True
      FixedChar = True
      Size = 3
    end
    object cdsTipoVendasConsDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
    end
    object cdsTipoVendasConsTIPO_OS: TStringField
      FieldName = 'TIPO_OS'
      Size = 40
    end
    object cdsTipoVendasConsSIGLA: TStringField
      FieldName = 'SIGLA'
      FixedChar = True
      Size = 1
    end
    object cdsTipoVendasConsVENDA: TStringField
      FieldName = 'VENDA'
      FixedChar = True
      Size = 1
    end
    object cdsTipoVendasConsATIVO: TSmallintField
      FieldName = 'ATIVO'
    end
    object cdsTipoVendasConsCOMGARANTIA: TStringField
      FieldName = 'COMGARANTIA'
      FixedChar = True
      Size = 1
    end
    object cdsTipoVendasConsPERMITIR_CUPOM_SERVICO: TStringField
      FieldName = 'PERMITIR_CUPOM_SERVICO'
      FixedChar = True
      Size = 1
    end
    object cdsTipoVendasConsORDEMEXIBICAO: TSmallintField
      FieldName = 'ORDEMEXIBICAO'
    end
    object cdsTipoVendasConsCONFIGFECHVND: TStringField
      FieldName = 'CONFIGFECHVND'
      FixedChar = True
      Size = 1
    end
  end
  object dsTipoVendasCons: TDataSource
    DataSet = cdsTipoVendasCons
    Left = 1054
    Top = 554
  end
  object qrBoxOsOberta: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransCadastroBasico
    SQL.Strings = (
      'select b.cod_box,ps.nped, p.data_ped, p.status_ped from box b'
      
        '      inner join agenda_itens ai on ai.cod_box = b.cod_box and a' +
        'i.cod_empresa = b.cod_empresa '
      
        '      inner join agenda a on ai.cod_agenda = a.cod_agenda and ai' +
        '.cod_empresa = a.cod_empresa '
      
        '      inner join pedvenda_serv ps on ps.cod_servico = ai.cod_ser' +
        'vico and ps.nped = a.nped '
      
        '      inner join pedvenda p on ps.nped = p.nped and p.tipo = ps.' +
        'tipo and p.cod_empresa = ps.cod_empresa '
      
        '      where ((p.status_ped ='#39#39') or (p.status_ped is null) or (p.' +
        'status_ped='#39'ABERTA'#39'))'
      '      and b.cod_box = -1  and p.cod_empresa = :COD_EMPRESA')
    Left = 1051
    Top = 207
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'COD_EMPRESA'
        ParamType = ptUnknown
      end>
  end
  object dspBoxOsOberta: TDataSetProvider
    DataSet = qrBoxOsOberta
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1051
    Top = 254
  end
  object cdsBoxOsOberta: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspBoxOsOberta'
    BeforeOpen = cdsMetasPerfisBeforeOpen
    Left = 1048
    Top = 296
    object cdsBoxOsObertaCOD_BOX: TIntegerField
      DisplayLabel = 'Cod Box'
      FieldName = 'COD_BOX'
      Required = True
    end
    object cdsBoxOsObertaNPED: TIntegerField
      DisplayLabel = 'N'#186' OS'
      FieldName = 'NPED'
      Required = True
    end
    object cdsBoxOsObertaDATA_PED: TDateTimeField
      DisplayLabel = 'Data OS'
      FieldName = 'DATA_PED'
    end
    object cdsBoxOsObertaSTATUS_PED: TStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS_PED'
      Size = 10
    end
  end
  object dsBoxOsOberta: TDataSource
    DataSet = cdsBoxOsOberta
    Left = 1051
    Top = 342
  end
  object dspCtrl: TDataSetProvider
    DataSet = qrCtrl
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1117
    Top = 254
  end
  object cdsCtrl: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCtrl'
    BeforeOpen = cdsPerfilComissaoBeforeOpen
    Left = 1120
    Top = 296
    object cdsCtrlCODIGO_CTRL: TIntegerField
      FieldName = 'CODIGO_CTRL'
      Required = True
    end
    object cdsCtrlNOME_CTRL: TStringField
      FieldName = 'NOME_CTRL'
      Size = 35
    end
  end
  object dsCtrl: TDataSource
    DataSet = cdsCtrl
    Left = 1117
    Top = 345
  end
  object qrCtrl: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransCadastroBasico
    SQL.Strings = (
      
        'select codigo_ctrl, nome_ctrl from controles where codigo_emp = ' +
        '0 and codigo_ctrl = 0')
    Left = 1117
    Top = 207
  end
  object dspRegrasCartas: TDataSetProvider
    DataSet = qrRegrasCartas
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 968
    Top = 464
  end
  object qrRegrasCartas: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransModCartas
    SQL.Strings = (
      'select * from regradecartas'
      '')
    Left = 968
    Top = 417
  end
  object cdsRegrasCartas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRegrasCartas'
    BeforeOpen = CdsDepartamentosBeforeOpen
    Left = 968
    Top = 509
    object cdsRegrasCartasCOD_CARTA: TIntegerField
      FieldName = 'COD_CARTA'
      Required = True
    end
    object cdsRegrasCartasCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsRegrasCartasCODANT_PROCESSAMENTO: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'CODANT_PROCESSAMENTO'
    end
    object cdsRegrasCartasCODANT_REPROCESSAMENTO: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'CODANT_REPROCESSAMENTO'
    end
  end
  object dsRegrasCartas: TDataSource
    DataSet = cdsRegrasCartas
    Left = 968
    Top = 554
  end
  object qrEmpSenha: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransSenha
    SQL.Strings = (
      
        'select cod_empresa, identificacao_emp, cgc_emp from empresa wher' +
        'e cod_empresa <> 0')
    Left = 1333
    Top = 2
  end
  object dspEmpSenha: TDataSetProvider
    DataSet = qrEmpSenha
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1333
    Top = 49
  end
  object dsEmpSenha: TDataSource
    DataSet = cdsEmpSenha
    Left = 1333
    Top = 147
  end
  object cdsEmpSenha: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEmpSenha'
    BeforeOpen = CdsDepartamentosBeforeOpen
    Left = 1333
    Top = 98
    object cdsEmpSenhaCOD_EMPRESA: TIntegerField
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
    end
    object cdsEmpSenhaIDENTIFICACAO_EMP: TStringField
      DisplayLabel = 'Identifica'#231#227'o Empresa'
      FieldName = 'IDENTIFICACAO_EMP'
      Size = 64
    end
    object cdsEmpSenhaCGC_EMP: TStringField
      DisplayLabel = 'CNPJ'
      FieldName = 'CGC_EMP'
      Size = 18
    end
  end
  object qrBuscaSenha: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransSenha
    SQL.Strings = (
      'select * from SENHAS')
    Left = 533
    Top = 65530
  end
  object qrCadastrosEmp: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransEmpresa
    SQL.Strings = (
      'select * from cadastros_emp where 1=1')
    Left = 1413
    Top = 2
  end
  object dspCadastrosEmp: TDataSetProvider
    DataSet = qrCadastrosEmp
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1413
    Top = 49
  end
  object dsCadastrosEmp: TDataSource
    DataSet = cdsCadastrosEmp
    Left = 1413
    Top = 147
  end
  object cdsCadastrosEmp: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCadastrosEmp'
    BeforeOpen = CdsDepartamentosBeforeOpen
    Left = 1413
    Top = 98
    object cdsCadastrosEmpCOD_EMP_ACESSO: TIntegerField
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMP_ACESSO'
    end
    object cdsCadastrosEmpCADASTRO: TStringField
      DisplayLabel = 'Acesso ao cadastro'
      FieldName = 'CADASTRO'
      Size = 64
    end
    object cdsCadastrosEmpNIVEL_INCLUSAO: TSmallintField
      DisplayLabel = 'N'#237'vel Inclus'#227'o'
      FieldName = 'NIVEL_INCLUSAO'
    end
    object cdsCadastrosEmpNIVEL_ALTERACAO: TSmallintField
      DisplayLabel = 'N'#237'vel Altera'#231#227'o'
      FieldName = 'NIVEL_ALTERACAO'
    end
    object cdsCadastrosEmpNIVEL_EXCLUSAO: TSmallintField
      DisplayLabel = 'N'#237'vel Exclus'#227'o'
      FieldName = 'NIVEL_EXCLUSAO'
    end
  end
  object dspRegraCondPag: TDataSetProvider
    DataSet = qrRegraCondPag
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1057
    Top = 703
  end
  object qrRegraCondPag: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTRegrasVND
    SQL.Strings = (
      'select cp.cod_cond_pag,cp.desc_cond_pag,'
      '(select distinct rv.cod_regravnd'
      'from  regravnd_condpag rc  inner join regras_vendas rv'
      
        'on rc.cod_regravnd=rv.cod_regravnd and rc.cod_empresa=rv.cod_emp' +
        'resa'
      
        'where rc.cod_regravnd=-1 and cp.cod_cond_pag=rc.cod_cond_pag and' +
        ' rv.cod_empresa=-1) as cod_regravnd'
      ' from cond_pag cp')
    Left = 1057
    Top = 658
  end
  object cdsRegraCondPag: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRegraCondPag'
    BeforeOpen = cdsFeriadoBeforeOpen
    Left = 1057
    Top = 745
    object cdsRegraCondPagCOD_COND_PAG: TIntegerField
      DisplayLabel = 'Cod Cond Pag'
      FieldName = 'COD_COND_PAG'
      Required = True
    end
    object cdsRegraCondPagDESC_COND_PAG: TStringField
      DisplayLabel = 'Descri'#231#227'o Condi'#231#227'o Pag'
      FieldName = 'DESC_COND_PAG'
      Size = 30
    end
    object cdsRegraCondPagCOD_REGRAVND: TIntegerField
      DisplayLabel = 'Cod Regra'
      FieldName = 'COD_REGRAVND'
      Required = True
    end
  end
  object dsRegraCondPag: TDataSource
    DataSet = cdsRegraCondPag
    Left = 1058
    Top = 792
  end
  object qrRegraVND: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTRegrasVND
    SQL.Strings = (
      'select REGRAS_VENDAS.* from REGRAS_VENDAS '
      'where  REGRAS_VENDAS.cod_empresa=-1')
    Left = 961
    Top = 658
  end
  object dspRegraVND: TDataSetProvider
    DataSet = qrRegraVND
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 961
    Top = 703
  end
  object cdsRegraVND: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRegraVND'
    BeforeOpen = cdsFeriadoBeforeOpen
    Left = 961
    Top = 745
    object cdsRegraVNDCOD_REGRAVND: TIntegerField
      DisplayLabel = 'Cod Regra'
      FieldName = 'COD_REGRAVND'
      Origin = '"REGRAS_VENDAS"."COD_REGRAVND"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsRegraVNDCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Origin = '"REGRAS_VENDAS"."COD_EMPRESA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsRegraVNDDESCRICAO: TStringField
      DisplayLabel = 'Regra'
      FieldName = 'DESCRICAO'
      Size = 32
    end
    object cdsRegraVNDTIPO: TStringField
      Tag = 1
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Origin = '"REGRAS_VENDAS"."TIPO"'
      Required = True
      FixedChar = True
      Size = 3
    end
    object cdsRegraVNDPESSOAFISICA: TStringField
      DisplayLabel = 'Pessoa F'#237'sica'
      FieldName = 'PESSOAFISICA'
      Origin = '"REGRAS_VENDAS"."PESSOAFISICA"'
      FixedChar = True
      Size = 1
    end
    object cdsRegraVNDCODIGO_CTRL: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Controle'
      FieldName = 'CODIGO_CTRL'
      Required = True
    end
    object cdsRegraVNDTIPOVND_OS: TStringField
      Tag = 1
      DisplayLabel = 'Tipo Venda/OS'
      FieldName = 'TIPOVND_OS'
      Origin = '"REGRAS_VENDAS"."TIPOVND_OS"'
      Required = True
      Size = 10
    end
    object cdsRegraVNDVALORMINDOC: TFloatField
      DisplayLabel = 'Valor Min Doc'
      FieldName = 'VALORMINDOC'
      currency = True
    end
    object cdsRegraVNDVALORMAXDOC: TFloatField
      DisplayLabel = 'Valor Max Doc'
      FieldName = 'VALORMAXDOC'
      currency = True
    end
    object cdsRegraVNDPARCELAMIN: TFloatField
      DisplayLabel = 'Valor Min Parcela'
      FieldName = 'PARCELAMIN'
      Origin = '"REGRAS_VENDAS"."PARCELAMIN"'
      currency = True
    end
    object cdsRegraVNDPARCELAMAX: TFloatField
      DisplayLabel = 'Valor Max Parcela'
      FieldName = 'PARCELAMAX'
      currency = True
    end
    object cdsRegraVNDMAXPARCELAS: TIntegerField
      DisplayLabel = 'Max Parcelas'
      FieldName = 'MAXPARCELAS'
      Origin = '"REGRAS_VENDAS"."MAXPARCELAS"'
    end
    object cdsRegraVNDPRAZOMAX: TIntegerField
      DisplayLabel = 'Prazo M'#225'ximo'
      FieldName = 'PRAZOMAX'
    end
    object cdsRegraVNDPERMITEDESC: TStringField
      Tag = 1
      DisplayLabel = 'Perm Desc'
      FieldName = 'PERMITEDESC'
      FixedChar = True
      Size = 1
    end
    object cdsRegraVNDMAX_DESCPROD: TFloatField
      DisplayLabel = 'Max Desc Prod (%)'
      FieldName = 'MAX_DESCPROD'
      DisplayFormat = '##0.000'
    end
    object cdsRegraVNDMAX_DESCSERV: TFloatField
      DisplayLabel = 'Max Desc Serv (%)'
      FieldName = 'MAX_DESCSERV'
      DisplayFormat = '##0.000'
    end
    object cdsRegraVNDMAX_DESC: TFloatField
      DisplayLabel = 'Max Desc Doc (%)'
      FieldName = 'MAX_DESC'
      DisplayFormat = '##0.000'
    end
    object cdsRegraVNDVLVND_MINDESC: TFloatField
      Tag = 1
      DisplayLabel = 'M'#237'nimo para Desconto'
      FieldName = 'VLVND_MINDESC'
    end
    object cdsRegraVNDSOBREPOR_PROMOCAO: TStringField
      Tag = 1
      DisplayLabel = 'Sobrepor pre'#231'o promocional'
      FieldName = 'SOBREPOR_PROMOCAO'
      FixedChar = True
      Size = 1
    end
    object cdsRegraVNDSOBREPOR_TABPRECO: TStringField
      Tag = 1
      DisplayLabel = 'Sobrepor pre'#231'o de tabela'
      FieldName = 'SOBREPOR_TABPRECO'
      FixedChar = True
      Size = 1
    end
    object cdsRegraVNDSOBREPOR_MAXDESCPROD: TStringField
      Tag = 1
      DisplayLabel = 'Sobrepor max. desconto item'
      FieldName = 'SOBREPOR_MAXDESCPROD'
      FixedChar = True
      Size = 1
    end
    object cdsRegraVNDATIVO: TSmallintField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
      Origin = '"REGRAS_VENDAS"."ATIVO"'
    end
  end
  object dsRegraVND: TDataSource
    DataSet = cdsRegraVND
    Left = 962
    Top = 792
  end
  object IBTRegrasVND: TIBTransaction
    DefaultDatabase = dtmAtivo.bancoHw
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 961
    Top = 834
  end
  object qrCondPgtoTabPreco: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransCadastroBasico
    SQL.Strings = (
      'select p.*, t.descr_tipo from promocao p'
      
        'inner join tipo_preco t on t.cod_tppreco = p.cod_tppreco and t.c' +
        'od_empresa = p.cod_empresa'
      
        'where p.cod_promocao > 0 and t.tipo = '#39'T'#39' and p.ativo = 1 and p.' +
        'cod_empresa = 0'
      'order by p.descr_promocao asc')
    Left = 1348
    Top = 205
  end
  object dspCondPgtoTabPreco: TDataSetProvider
    DataSet = qrCondPgtoTabPreco
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1348
    Top = 252
  end
  object cdsCondPgtoTabPreco: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCondPgtoTabPreco'
    BeforeOpen = CdsDepartamentosBeforeOpen
    Left = 1348
    Top = 301
    object cdsCondPgtoTabPrecoCOD_PROMOCAO: TIntegerField
      FieldName = 'COD_PROMOCAO'
      Required = True
    end
    object cdsCondPgtoTabPrecoCOD_TPPRECO: TIntegerField
      FieldName = 'COD_TPPRECO'
      Required = True
    end
    object cdsCondPgtoTabPrecoCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsCondPgtoTabPrecoDESCR_PROMOCAO: TStringField
      FieldName = 'DESCR_PROMOCAO'
      Size = 128
    end
    object cdsCondPgtoTabPrecoORDEM: TIntegerField
      FieldName = 'ORDEM'
    end
    object cdsCondPgtoTabPrecoATIVO: TIntegerField
      FieldName = 'ATIVO'
    end
    object cdsCondPgtoTabPrecoDATA_INI: TDateTimeField
      FieldName = 'DATA_INI'
    end
    object cdsCondPgtoTabPrecoDATA_FIM: TDateTimeField
      FieldName = 'DATA_FIM'
    end
    object cdsCondPgtoTabPrecoHORA_INI: TStringField
      FieldName = 'HORA_INI'
      Size = 8
    end
    object cdsCondPgtoTabPrecoHORA_FIM: TStringField
      FieldName = 'HORA_FIM'
      Size = 8
    end
    object cdsCondPgtoTabPrecoDESCR_TIPO: TStringField
      FieldName = 'DESCR_TIPO'
    end
  end
  object dsCondPgtoTabPreco: TDataSource
    DataSet = cdsCondPgtoTabPreco
    Left = 1348
    Top = 350
  end
  object qrPContas: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransCadastroBasico
    SQL.Strings = (
      
        'select p.n_conta_plc, p.desc_plc, p.desc_padr, p.tipo_plc from p' +
        '_contas p')
    Left = 1104
    Top = 416
  end
  object dspPContas: TDataSetProvider
    DataSet = qrPContas
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1104
    Top = 465
  end
  object cdsPContas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPContas'
    BeforeOpen = cdsPerfilComissaoBeforeOpen
    Left = 1105
    Top = 507
    object cdsPContasN_CONTA_PLC: TFloatField
      FieldName = 'N_CONTA_PLC'
    end
    object cdsPContasDESC_PLC: TStringField
      FieldName = 'DESC_PLC'
      Required = True
      FixedChar = True
      Size = 30
    end
    object cdsPContasDESC_PADR: TStringField
      FieldName = 'DESC_PADR'
      FixedChar = True
      Size = 30
    end
    object cdsPContasTIPO_PLC: TStringField
      FieldName = 'TIPO_PLC'
      FixedChar = True
      Size = 1
    end
  end
  object dsPContas: TDataSource
    DataSet = cdsPContas
    Left = 1105
    Top = 554
  end
  object qrCadastrosEmpTabelas: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransCadastroBasico
    SQL.Strings = (
      
        'SELECT RDB$RELATION_NAME NOME_TABELA FROM RDB$RELATIONS WHERE RD' +
        'B$VIEW_BLR IS NULL AND (RDB$SYSTEM_FLAG = 0 OR RDB$SYSTEM_FLAG I' +
        'S NULL)')
    Left = 1436
    Top = 205
  end
  object dspCadastrosEmpTabelas: TDataSetProvider
    DataSet = qrCadastrosEmpTabelas
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1436
    Top = 252
  end
  object cdsCadastrosEmpTabelas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCadastrosEmpTabelas'
    BeforeOpen = CdsDepartamentosBeforeOpen
    Left = 1436
    Top = 301
    object cdsCadastrosEmpTabelasNOME_TABELA: TStringField
      FieldName = 'NOME_TABELA'
      FixedChar = True
      Size = 93
    end
  end
  object dsCadastrosEmpTabelas: TDataSource
    DataSet = cdsCadastrosEmpTabelas
    Left = 1436
    Top = 350
  end
  object qrControlesEmp: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransCadastroBasico
    SQL.Strings = (
      
        'select (c.codigo_ctrl ||'#39' - '#39'|| c.nome_ctrl) nome_ctrl, c.* from' +
        ' controles c where c.cxent = '#39'S'#39
      ' and c.ativo = 1 and c.codigo_emp = 1 order by c.CODIGO_CTRL')
    Left = 1394
    Top = 407
  end
  object dspControlesEmp: TDataSetProvider
    DataSet = qrControlesEmp
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1394
    Top = 456
  end
  object cdsControlesEmp: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspControlesEmp'
    BeforeOpen = cdsPerfilComissaoBeforeOpen
    Left = 1395
    Top = 506
    object cdsControlesEmpNOME_CTRL: TStringField
      FieldName = 'NOME_CTRL'
      Size = 49
    end
    object cdsControlesEmpCODIGO_CTRL: TIntegerField
      FieldName = 'CODIGO_CTRL'
      Required = True
    end
    object cdsControlesEmpFLUXO_CTRL: TStringField
      FieldName = 'FLUXO_CTRL'
      FixedChar = True
      Size = 1
    end
    object cdsControlesEmpN_BANCO_CTRL: TStringField
      FieldName = 'N_BANCO_CTRL'
      FixedChar = True
      Size = 10
    end
    object cdsControlesEmpNOME_CTRL1: TStringField
      FieldName = 'NOME_CTRL1'
      Size = 35
    end
    object cdsControlesEmpEND_CTRL: TStringField
      FieldName = 'END_CTRL'
      Size = 30
    end
    object cdsControlesEmpBAIRRO_CTRL: TStringField
      FieldName = 'BAIRRO_CTRL'
    end
    object cdsControlesEmpCID_CTRL: TStringField
      FieldName = 'CID_CTRL'
    end
    object cdsControlesEmpUF_CTRL: TStringField
      FieldName = 'UF_CTRL'
      FixedChar = True
      Size = 2
    end
    object cdsControlesEmpCEP_CTRL: TStringField
      FieldName = 'CEP_CTRL'
      FixedChar = True
      Size = 9
    end
    object cdsControlesEmpCONTATO_CTRL: TStringField
      FieldName = 'CONTATO_CTRL'
      Size = 15
    end
    object cdsControlesEmpFONE_CTRL: TStringField
      FieldName = 'FONE_CTRL'
      FixedChar = True
      Size = 13
    end
    object cdsControlesEmpN_CONTA_CTRL: TStringField
      FieldName = 'N_CONTA_CTRL'
      FixedChar = True
      Size = 15
    end
    object cdsControlesEmpSALDO_ANT_CTRL: TFloatField
      FieldName = 'SALDO_ANT_CTRL'
    end
    object cdsControlesEmpSALDO_AT_CTRL: TFloatField
      FieldName = 'SALDO_AT_CTRL'
    end
    object cdsControlesEmpSOBRA_CTRL: TFloatField
      FieldName = 'SOBRA_CTRL'
    end
    object cdsControlesEmpCOMPSALDO: TStringField
      FieldName = 'COMPSALDO'
      FixedChar = True
      Size = 1
    end
    object cdsControlesEmpDOCS: TStringField
      FieldName = 'DOCS'
      FixedChar = True
      Size = 2
    end
    object cdsControlesEmpCXENT: TStringField
      FieldName = 'CXENT'
      FixedChar = True
      Size = 1
    end
    object cdsControlesEmpQPERF: TIntegerField
      FieldName = 'QPERF'
    end
    object cdsControlesEmpQSEQPERF: TIntegerField
      FieldName = 'QSEQPERF'
    end
    object cdsControlesEmpNAT_LANC: TStringField
      FieldName = 'NAT_LANC'
      FixedChar = True
      Size = 1
    end
    object cdsControlesEmpCONTR_BANC: TStringField
      FieldName = 'CONTR_BANC'
      FixedChar = True
      Size = 1
    end
    object cdsControlesEmpCRD_F_VND: TStringField
      FieldName = 'CRD_F_VND'
      FixedChar = True
      Size = 1
    end
    object cdsControlesEmpTP_PLANO: TStringField
      FieldName = 'TP_PLANO'
      FixedChar = True
      Size = 1
    end
    object cdsControlesEmpNAT_CTRL: TStringField
      FieldName = 'NAT_CTRL'
      FixedChar = True
      Size = 1
    end
    object cdsControlesEmpDEB_SAI_CNT: TStringField
      FieldName = 'DEB_SAI_CNT'
      FixedChar = True
      Size = 1
    end
    object cdsControlesEmpCODIGO_EMP: TIntegerField
      FieldName = 'CODIGO_EMP'
      Required = True
    end
    object cdsControlesEmpN_AGENCIA_CTRL: TStringField
      FieldName = 'N_AGENCIA_CTRL'
      Size = 10
    end
    object cdsControlesEmpCAMINHO_LICENCA_CTRL: TStringField
      FieldName = 'CAMINHO_LICENCA_CTRL'
      Size = 50
    end
    object cdsControlesEmpCAMINHO_LOGOTIPO_CTRL: TStringField
      FieldName = 'CAMINHO_LOGOTIPO_CTRL'
      Size = 50
    end
    object cdsControlesEmpUSAR_BOLETO: TStringField
      FieldName = 'USAR_BOLETO'
      FixedChar = True
      Size = 1
    end
    object cdsControlesEmpIDENTIF_CEDENTE: TStringField
      FieldName = 'IDENTIF_CEDENTE'
      Size = 40
    end
    object cdsControlesEmpCAMINHO_REMESSA: TStringField
      FieldName = 'CAMINHO_REMESSA'
      Size = 50
    end
    object cdsControlesEmpCOD_CEDENTE: TStringField
      FieldName = 'COD_CEDENTE'
    end
    object cdsControlesEmpINICIO_NOSSO_NUMRERO: TStringField
      FieldName = 'INICIO_NOSSO_NUMRERO'
    end
    object cdsControlesEmpFIM_NOSSO_NUMERO: TStringField
      FieldName = 'FIM_NOSSO_NUMERO'
    end
    object cdsControlesEmpPROXIMO_NOSSO_NUMERO: TStringField
      FieldName = 'PROXIMO_NOSSO_NUMERO'
    end
    object cdsControlesEmpCOD_FINALIZADOR: TIntegerField
      FieldName = 'COD_FINALIZADOR'
    end
    object cdsControlesEmpCODSEQ_BALANCO: TIntegerField
      FieldName = 'CODSEQ_BALANCO'
    end
    object cdsControlesEmpTIPODOCUMENTOCOBRANCA: TStringField
      FieldName = 'TIPODOCUMENTOCOBRANCA'
      Size = 10
    end
    object cdsControlesEmpOUTRODADOCONFIGURACAO1: TStringField
      FieldName = 'OUTRODADOCONFIGURACAO1'
    end
    object cdsControlesEmpOUTRODADOCONFIGURACAO2: TStringField
      FieldName = 'OUTRODADOCONFIGURACAO2'
    end
    object cdsControlesEmpLAYOUTARQUIVOREMESSA: TStringField
      FieldName = 'LAYOUTARQUIVOREMESSA'
    end
    object cdsControlesEmpIND_TIT: TStringField
      FieldName = 'IND_TIT'
      FixedChar = True
      Size = 2
    end
    object cdsControlesEmpCARTAO_SPED: TSmallintField
      FieldName = 'CARTAO_SPED'
    end
    object cdsControlesEmpCARTAO_SPED_PART: TIntegerField
      FieldName = 'CARTAO_SPED_PART'
    end
    object cdsControlesEmpCODIGO_BAIXA: TStringField
      FieldName = 'CODIGO_BAIXA'
    end
    object cdsControlesEmpCODIGO_RECUSA: TStringField
      FieldName = 'CODIGO_RECUSA'
    end
    object cdsControlesEmpATIVO: TSmallintField
      FieldName = 'ATIVO'
    end
    object cdsControlesEmpCOD_COBREBEM: TIntegerField
      FieldName = 'COD_COBREBEM'
    end
    object cdsControlesEmpBARRAR_AUTOMATICO: TStringField
      FieldName = 'BARRAR_AUTOMATICO'
      FixedChar = True
      Size = 1
    end
    object cdsControlesEmpTAXA_CARTAO: TFloatField
      FieldName = 'TAXA_CARTAO'
    end
    object cdsControlesEmpNOME_CONTABIL: TStringField
      FieldName = 'NOME_CONTABIL'
      Size = 35
    end
    object cdsControlesEmpENTRA_PREST_CXL: TStringField
      FieldName = 'ENTRA_PREST_CXL'
      FixedChar = True
      Size = 1
    end
    object cdsControlesEmpN_CONTA_PLC_TX_CARTAO: TFloatField
      FieldName = 'N_CONTA_PLC_TX_CARTAO'
    end
    object cdsControlesEmpCTRL_SAIDA_TX_CARTAO: TIntegerField
      FieldName = 'CTRL_SAIDA_TX_CARTAO'
    end
    object cdsControlesEmpGERAR_COMISSAO: TStringField
      FieldName = 'GERAR_COMISSAO'
      FixedChar = True
      Size = 1
    end
    object cdsControlesEmpENTRA_PMV: TStringField
      FieldName = 'ENTRA_PMV'
      FixedChar = True
      Size = 1
    end
    object cdsControlesEmpINICIAL_TPVND_MOBILE: TStringField
      FieldName = 'INICIAL_TPVND_MOBILE'
      FixedChar = True
      Size = 1
    end
    object cdsControlesEmpAGENCIA_CTRL: TStringField
      FieldName = 'AGENCIA_CTRL'
      Size = 10
    end
    object cdsControlesEmpN_CONTA_PLC_TARIFA_CARTAO: TFloatField
      FieldName = 'N_CONTA_PLC_TARIFA_CARTAO'
    end
    object cdsControlesEmpFP_PADRAO_CL: TStringField
      FieldName = 'FP_PADRAO_CL'
      FixedChar = True
      Size = 1
    end
    object cdsControlesEmpNAO_GERA_FINAN: TStringField
      FieldName = 'NAO_GERA_FINAN'
      FixedChar = True
      Size = 1
    end
    object cdsControlesEmpBAIXA_AUTOMATICA: TStringField
      FieldName = 'BAIXA_AUTOMATICA'
      FixedChar = True
      Size = 1
    end
    object cdsControlesEmpN_CONTA_BX_AUTO: TFloatField
      FieldName = 'N_CONTA_BX_AUTO'
    end
    object cdsControlesEmpRETORNOS: TStringField
      FieldName = 'RETORNOS'
      FixedChar = True
      Size = 1
    end
  end
  object dsControlesEmp: TDataSource
    DataSet = cdsControlesEmp
    Left = 1395
    Top = 553
  end
  object qrTAGsCons: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransTAG
    SQL.Strings = (
      'SELECT * FROM MACRO')
    Left = 581
    Top = 794
  end
  object dspTAGsCons: TDataSetProvider
    DataSet = qrTAGsCons
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 581
    Top = 844
  end
  object dsTAGsCons: TDataSource
    DataSet = cdsTAGsCons
    Left = 581
    Top = 952
  end
  object cdsTAGsCons: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTAGsCons'
    BeforeOpen = CdsDepartamentosBeforeOpen
    Left = 582
    Top = 898
    object cdsTAGsConsMACRO: TIntegerField
      Tag = 2
      DisplayLabel = 'Cod TAG'
      FieldName = 'MACRO'
      Required = True
    end
    object cdsTAGsConsCODIGO: TIntegerField
      Tag = 1
      DisplayLabel = 'Padrao'
      FieldName = 'CODIGO'
      Required = True
    end
    object cdsTAGsConsNOME: TStringField
      Tag = 2
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Size = 64
    end
    object cdsTAGsConsDESCRICAO: TStringField
      DisplayLabel = 'Descricao'
      FieldName = 'DESCRICAO'
      Size = 64
    end
    object cdsTAGsConsTABELA: TStringField
      DisplayLabel = 'Tabela'
      FieldName = 'TABELA'
      Size = 40
    end
    object cdsTAGsConsCAMPO: TStringField
      DisplayLabel = 'Campo'
      FieldName = 'CAMPO'
      Size = 40
    end
    object cdsTAGsConsRELACIONAMENTO: TIntegerField
      Tag = 1
      DisplayLabel = 'Relacionamento'
      FieldName = 'RELACIONAMENTO'
    end
    object cdsTAGsConsTABELA_RELAC: TStringField
      DisplayLabel = 'Tabela de relacionamento'
      FieldName = 'TABELA_RELAC'
      Size = 40
    end
    object cdsTAGsConsCAMPO_RELAC: TStringField
      DisplayLabel = 'Campo de relacionamento'
      FieldName = 'CAMPO_RELAC'
      Size = 40
    end
    object cdsTAGsConsCAMPO_RETORNO: TStringField
      DisplayLabel = 'Campo de exibicao'
      FieldName = 'CAMPO_RETORNO'
      Size = 40
    end
    object cdsTAGsConsBASE: TIntegerField
      Tag = 1
      DisplayLabel = 'Padrao 2'
      FieldName = 'BASE'
      Required = True
    end
    object cdsTAGsConsATIVO: TIntegerField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
    object cdsTAGsConsRELACIONAMENTO2: TIntegerField
      DisplayLabel = 'Relacionamento 2'
      FieldName = 'RELACIONAMENTO2'
    end
    object cdsTAGsConsCAMPO2: TStringField
      DisplayLabel = 'Campo 2'
      FieldName = 'CAMPO2'
      Size = 40
    end
    object cdsTAGsConsTABELA_RELAC2: TStringField
      DisplayLabel = 'Tabela de relacionamento 2'
      FieldName = 'TABELA_RELAC2'
      Size = 40
    end
    object cdsTAGsConsCAMPO_RELAC2: TStringField
      DisplayLabel = 'Campo de relacionamento 2'
      FieldName = 'CAMPO_RELAC2'
      Size = 40
    end
  end
  object qrTipoReserva: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransCadastroBasico
    SQL.Strings = (
      'select * from tipo_reserva')
    Left = 1580
    Top = 205
  end
  object dspTipoReserva: TDataSetProvider
    DataSet = qrTipoReserva
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1580
    Top = 252
  end
  object cdsTipoReserva: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTipoReserva'
    BeforeOpen = cdsTipoReservaBeforeOpen
    Left = 1580
    Top = 301
    object cdsTipoReservaCODIGO: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO'
      Required = True
    end
    object cdsTipoReservaTIPO: TStringField
      Tag = 1
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Required = True
      FixedChar = True
      Size = 3
    end
    object cdsTipoReservaTIPO_RES: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO_RES'
      FixedChar = True
      Size = 1
    end
    object cdsTipoReservaDESCRICAO: TStringField
      DisplayLabel = 'Descricao'
      FieldName = 'DESCRICAO'
      Size = 40
    end
    object cdsTipoReservaSIGLA: TStringField
      DisplayLabel = 'Sigla'
      FieldName = 'SIGLA'
      FixedChar = True
      Size = 4
    end
    object cdsTipoReservaORDEMEXIBICAO: TSmallintField
      DisplayLabel = 'Ordem exibicao'
      FieldName = 'ORDEMEXIBICAO'
    end
    object cdsTipoReservaQUANT_DIAS_RESERVA: TIntegerField
      DisplayLabel = 'Dias reserva'
      FieldName = 'QUANT_DIAS_RESERVA'
    end
    object cdsTipoReservaDIAS_RENOV: TIntegerField
      DisplayLabel = 'Dias renov'
      FieldName = 'DIAS_RENOV'
    end
    object cdsTipoReservaVISUALIZAR_RESERVAS_VENC: TStringField
      DisplayLabel = 'Visualizar reservas'
      FieldName = 'VISUALIZAR_RESERVAS_VENC'
      FixedChar = True
      Size = 1
    end
    object cdsTipoReservaRETIRAR_RESERVAS_VENC: TStringField
      DisplayLabel = 'Retirar reserva'
      FieldName = 'RETIRAR_RESERVAS_VENC'
      FixedChar = True
      Size = 1
    end
    object cdsTipoReservaATIVO: TIntegerField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
    object cdsTipoReservaCONFIG_VENDEDOR: TStringField
      DisplayLabel = 'Config vendedor'
      FieldName = 'CONFIG_VENDEDOR'
      FixedChar = True
      Size = 1
    end
    object cdsTipoReservaCONFIG_CLIENTE: TStringField
      DisplayLabel = 'Config cliente'
      FieldName = 'CONFIG_CLIENTE'
      FixedChar = True
      Size = 1
    end
    object cdsTipoReservaMENSAGEM_VENC_DIAS: TIntegerField
      DisplayLabel = 'Dias mensagem'
      FieldName = 'MENSAGEM_VENC_DIAS'
    end
    object cdsTipoReservaQUANT_DIAS_RESERVA_ASS: TIntegerField
      DisplayLabel = 'Dias reserva apos assembleia'
      FieldName = 'QUANT_DIAS_RESERVA_ASS'
    end
    object cdsTipoReservaDIAS_RENOV_ASS: TIntegerField
      DisplayLabel = 'Dias renov apos assembleia'
      FieldName = 'DIAS_RENOV_ASS'
    end
    object cdsTipoReservaDIAS_RESERV_APOS_VENC: TIntegerField
      DisplayLabel = 'Dias Res Apos Venc'
      FieldName = 'DIAS_RESERV_APOS_VENC'
    end
  end
  object dsTipoReserva: TDataSource
    DataSet = cdsTipoReserva
    Left = 1580
    Top = 350
  end
  object qrRegrasSugServ: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransCadastroBasico
    SQL.Strings = (
      'select r.* from REGRAS_SUG r'
      'where r.cod_empresa = 1')
    Left = 1708
    Top = 197
  end
  object dspRegrasSugServ: TDataSetProvider
    DataSet = qrRegrasSugServ
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1708
    Top = 244
  end
  object cdsRegrasSugServ: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRegrasSugServ'
    BeforeOpen = CdsDepartamentosBeforeOpen
    Left = 1708
    Top = 293
    object cdsRegrasSugServCODIGO: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO'
      Required = True
    end
    object cdsRegrasSugServCOD_EMPRESA: TIntegerField
      Tag = 1
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsRegrasSugServTIPO: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsRegrasSugServDESCRICAO: TStringField
      DisplayLabel = 'Descricao'
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object cdsRegrasSugServMES_RET_SERV1: TIntegerField
      DisplayLabel = 'Mes primeira revisao'
      FieldName = 'MES_RET_SERV1'
    end
    object cdsRegrasSugServMES_RET_SERV2: TIntegerField
      DisplayLabel = 'Mes segunda revisao'
      FieldName = 'MES_RET_SERV2'
    end
    object cdsRegrasSugServINTERV_MES_SERV: TIntegerField
      DisplayLabel = 'Interv meses revisoes'
      FieldName = 'INTERV_MES_SERV'
    end
    object cdsRegrasSugServKM_RET_SERV1: TIntegerField
      DisplayLabel = 'Km primeira revisao'
      FieldName = 'KM_RET_SERV1'
    end
    object cdsRegrasSugServKM_RET_SERV2: TIntegerField
      DisplayLabel = 'Km segunda revisao'
      FieldName = 'KM_RET_SERV2'
    end
    object cdsRegrasSugServINTERV_KM_SERV: TIntegerField
      DisplayLabel = 'Interv km revisoes'
      FieldName = 'INTERV_KM_SERV'
    end
    object cdsRegrasSugServUS_CAD: TIntegerField
      DisplayLabel = 'Us Cad'
      FieldName = 'US_CAD'
    end
    object cdsRegrasSugServDATA_CAD: TDateTimeField
      DisplayLabel = 'Data Cad'
      FieldName = 'DATA_CAD'
    end
    object cdsRegrasSugServHORA_CAD: TStringField
      DisplayLabel = 'Hora Cad'
      FieldName = 'HORA_CAD'
      FixedChar = True
      Size = 8
    end
    object cdsRegrasSugServUS_MOD: TIntegerField
      DisplayLabel = 'Us Alter'
      FieldName = 'US_MOD'
    end
    object cdsRegrasSugServDATA_MOD: TDateTimeField
      DisplayLabel = 'Data Alter'
      FieldName = 'DATA_MOD'
    end
    object cdsRegrasSugServHORA_MOD: TStringField
      DisplayLabel = 'Hora Alter'
      FieldName = 'HORA_MOD'
      FixedChar = True
      Size = 8
    end
    object cdsRegrasSugServATIVO: TIntegerField
      Tag = 1
      FieldName = 'ATIVO'
    end
  end
  object dsRegrasSugServ: TDataSource
    DataSet = cdsRegrasSugServ
    Left = 1708
    Top = 342
  end
  object qrModVeiculosServ: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransCadastroBasico
    SQL.Strings = (
      'select codigo, descricao from tipmodelo'
      'where ativo = 1 and cod_empresa = 1')
    Left = 1596
    Top = 413
  end
  object dspModVeiculosServ: TDataSetProvider
    DataSet = qrModVeiculosServ
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1596
    Top = 460
  end
  object cdsModVeiculosServ: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspModVeiculosServ'
    BeforeOpen = CdsDepartamentosBeforeOpen
    Left = 1596
    Top = 509
    object cdsModVeiculosServSEL: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'SEL'
      Size = 1
    end
    object cdsModVeiculosServCODIGO: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO'
      Required = True
    end
    object cdsModVeiculosServDESCRICAO: TStringField
      DisplayLabel = 'Descricao'
      FieldName = 'DESCRICAO'
      Size = 60
    end
  end
  object dsModVeiculosServ: TDataSource
    DataSet = cdsModVeiculosServ
    Left = 1596
    Top = 558
  end
  object qrRegrasSugServItens: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransCadastroBasico
    SQL.Strings = (
      'select * from REGRAS_SUG_ITENS')
    Left = 1852
    Top = 205
  end
  object dspRegrasSugServItens: TDataSetProvider
    DataSet = qrRegrasSugServItens
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1852
    Top = 252
  end
  object cdsRegrasSugServItens: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRegrasSugServItens'
    BeforeOpen = CdsDepartamentosBeforeOpen
    Left = 1852
    Top = 301
    object cdsRegrasSugServItensCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object cdsRegrasSugServItensCOD_TIPO: TIntegerField
      FieldName = 'COD_TIPO'
      Required = True
    end
    object cdsRegrasSugServItensCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsRegrasSugServItensTIPO: TStringField
      FieldName = 'TIPO'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object dsRegrasSugServItens: TDataSource
    DataSet = cdsRegrasSugServItens
    Left = 1852
    Top = 350
  end
  object qrEquipamentosServ: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransCadastroBasico
    SQL.Strings = (
      'select cod_equip, nom_equip from equipamento'
      'where ativo = 1 and cod_empresa = :cod_empresa')
    Left = 1732
    Top = 421
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cod_empresa'
        ParamType = ptUnknown
      end>
  end
  object dspEquipamentosServ: TDataSetProvider
    DataSet = qrEquipamentosServ
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1732
    Top = 468
  end
  object cdsEquipamentosServ: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEquipamentosServ'
    BeforeOpen = CdsDepartamentosBeforeOpen
    Left = 1732
    Top = 517
    object StringField3: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'SEL'
      Size = 1
    end
    object cdsEquipamentosServCOD_EQUIP: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'COD_EQUIP'
      Required = True
    end
    object cdsEquipamentosServNOM_EQUIP: TStringField
      DisplayLabel = 'Descricao'
      FieldName = 'NOM_EQUIP'
      Size = 32
    end
  end
  object dsEquipamentosServ: TDataSource
    DataSet = cdsEquipamentosServ
    Left = 1732
    Top = 566
  end
  object qrSugestaoServ: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransCadastroBasico
    SQL.Strings = (
      'select distinct sugestaoservico.cod_empresa, '
      'sugestaoservico.cod_equip, sugestaoservico.cod_veic, '
      'sugestaoservico.ndoc_ant, sugestaoservico.tpdoc_ant,'
      'sugestaoservico.data_ult_serv, sugestaoservico.km_ult_serv,'
      
        'sugestaoservico.chassi, sugestaoservico.placa, veiculos.anofab, ' +
        'veiculos.anomod,'
      
        'veiculos.data_cad data_cad_tipo, sugestaoservico.data, sugestaos' +
        'ervico.cod_cliente,'
      
        'clientes.codigo_uf, estados.sigla_uf, clientes.cod_cidade, cidad' +
        'es.nome_cidade, clientes.cod_bairro, bairros.nome_bairro,'
      'clientes.cep, clientes.endereco, clientes.num_end_cliente,'
      
        'case when (sugestaoservico.cod_equip > 0) then equipamento.nom_e' +
        'quip else veiculos.descmodelo end descricao_tp,'
      
        'clientes.nome_cliente, clientes.razao, clientes.fone_cliente, cl' +
        'ientes.email, '
      
        'sugestaoservico.ult_atd, colaborador.nome_vendedor, sugestaoserv' +
        'ico.ativo, sugestaoservico.cod_agenda,'
      
        'sugestaoservico.status, SUGESTAOSERVICO.NDOC, SUGESTAOSERVICO.TP' +
        'DOC, SUGESTAOSERVICO.US_CAD, SUGESTAOSERVICO.DATA_CAD, SUGESTAOS' +
        'ERVICO.HORA_CAD,'
      'SUGESTAOSERVICO.COD_SUG_AV from sugestaoservico'
      
        'left join equipamento on equipamento.cod_equip = sugestaoservico' +
        '.cod_equip and equipamento.cod_empresa = sugestaoservico.cod_emp' +
        'resa '
      
        'left join veiculos on veiculos.codigo = sugestaoservico.cod_veic' +
        ' and veiculos.chassi = sugestaoservico.chassi and veiculos.placa' +
        ' = sugestaoservico.placa'
      
        'left join clientes on clientes.cod_cliente = sugestaoservico.cod' +
        '_cliente AND clientes.cod_empresa = sugestaoservico.cod_empresa '
      'left join estados on clientes.codigo_uf = estados.codigo_uf'
      'left join cidades on clientes.cod_cidade = cidades.cod_cidade'
      'left join bairros on clientes.cod_bairro = bairros.cod_bairro'
      
        'left join colaborador on colaborador.cod_vendedor = sugestaoserv' +
        'ico.ult_atd and colaborador.cod_empresa = sugestaoservico.cod_em' +
        'presa'
      
        'where sugestaoservico.ativo = 0 and sugestaoservico.cod_empresa ' +
        '= 0')
    Left = 1516
    Top = 65533
  end
  object dspSugestaoServ: TDataSetProvider
    DataSet = qrSugestaoServ
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1516
    Top = 44
  end
  object cdsSugestaoServ: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSugestaoServ'
    BeforeOpen = CdsDepartamentosBeforeOpen
    Left = 1516
    Top = 93
    object cdsSugestaoServCOD_CLIENTE: TIntegerField
      DisplayLabel = 'Cod Cliente'
      FieldName = 'COD_CLIENTE'
    end
    object cdsSugestaoServNOME_CLIENTE: TStringField
      DisplayLabel = 'Nome Fantasia'
      FieldName = 'NOME_CLIENTE'
      ProviderFlags = [pfInWhere]
      FixedChar = True
      Size = 35
    end
    object cdsSugestaoServRAZAO: TStringField
      DisplayLabel = 'Razao'
      FieldName = 'RAZAO'
      ProviderFlags = [pfInWhere]
      Size = 60
    end
    object cdsSugestaoServDESCRICAO_TP: TStringField
      DisplayLabel = 'Descricao'
      FieldName = 'DESCRICAO_TP'
      Size = 60
    end
    object cdsSugestaoServCOD_EQUIP: TIntegerField
      DisplayLabel = 'Cod Equip'
      FieldName = 'COD_EQUIP'
    end
    object cdsSugestaoServCOD_VEIC: TIntegerField
      DisplayLabel = 'Cod Veic'
      FieldName = 'COD_VEIC'
    end
    object cdsSugestaoServCHASSI: TStringField
      DisplayLabel = 'Chassi'
      FieldName = 'CHASSI'
      Size = 17
    end
    object cdsSugestaoServPLACA: TStringField
      DisplayLabel = 'Placa'
      FieldName = 'PLACA'
      Size = 10
    end
    object cdsSugestaoServANOFAB: TIntegerField
      DisplayLabel = 'Ano Fab'
      FieldName = 'ANOFAB'
    end
    object cdsSugestaoServANOMOD: TIntegerField
      DisplayLabel = 'Ano Mod'
      FieldName = 'ANOMOD'
    end
    object cdsSugestaoServDATA: TDateTimeField
      DisplayLabel = 'Data Sug'
      FieldName = 'DATA'
    end
    object cdsSugestaoServDATA_CAD_TIPO: TDateTimeField
      DisplayLabel = 'Data Compra'
      FieldName = 'DATA_CAD_TIPO'
    end
    object cdsSugestaoServULT_ATD: TIntegerField
      DisplayLabel = 'Cod Ult Atd'
      FieldName = 'ULT_ATD'
    end
    object cdsSugestaoServNDOC_ANT: TIntegerField
      DisplayLabel = 'Num Ult OS'
      FieldName = 'NDOC_ANT'
    end
    object cdsSugestaoServDATA_ULT_SERV: TDateTimeField
      DisplayLabel = 'Data Ult Serv'
      FieldName = 'DATA_ULT_SERV'
    end
    object cdsSugestaoServKM_ULT_SERV: TIntegerField
      DisplayLabel = 'Km Ult Serv'
      FieldName = 'KM_ULT_SERV'
    end
    object cdsSugestaoServNOME_VENDEDOR: TStringField
      DisplayLabel = 'Ult Atendente'
      FieldName = 'NOME_VENDEDOR'
      ProviderFlags = [pfInWhere]
      Size = 35
    end
    object cdsSugestaoServFONE_CLIENTE: TStringField
      DisplayLabel = 'Fone'
      FieldName = 'FONE_CLIENTE'
      ProviderFlags = [pfInWhere]
      FixedChar = True
      Size = 13
    end
    object cdsSugestaoServEMAIL: TStringField
      DisplayLabel = 'Email'
      FieldName = 'EMAIL'
      ProviderFlags = [pfInWhere]
      Size = 256
    end
    object cdsSugestaoServCOD_AGENDA: TIntegerField
      DisplayLabel = 'Cod Agenda'
      FieldName = 'COD_AGENDA'
    end
    object cdsSugestaoServSTATUS: TStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      Size = 10
    end
    object cdsSugestaoServUS_CAD: TIntegerField
      DisplayLabel = 'Us Cad'
      FieldName = 'US_CAD'
    end
    object cdsSugestaoServNDOC: TIntegerField
      DisplayLabel = 'Num Doc'
      FieldName = 'NDOC'
    end
    object cdsSugestaoServTPDOC: TStringField
      DisplayLabel = 'Tipo Doc'
      FieldName = 'TPDOC'
      FixedChar = True
      Size = 3
    end
    object cdsSugestaoServDATA_CAD: TDateTimeField
      DisplayLabel = 'Data Cad'
      FieldName = 'DATA_CAD'
    end
    object cdsSugestaoServHORA_CAD: TStringField
      DisplayLabel = 'Hora Cad'
      FieldName = 'HORA_CAD'
      FixedChar = True
      Size = 8
    end
    object cdsSugestaoServATIVO: TIntegerField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
      Visible = False
    end
    object cdsSugestaoServCODIGO_UF: TIntegerField
      DisplayLabel = 'Cod UF'
      FieldName = 'CODIGO_UF'
    end
    object cdsSugestaoServSIGLA_UF: TStringField
      DisplayLabel = 'Sigla UF'
      FieldName = 'SIGLA_UF'
      FixedChar = True
      Size = 2
    end
    object cdsSugestaoServCOD_CIDADE: TSmallintField
      DisplayLabel = 'Cod Cidade'
      FieldName = 'COD_CIDADE'
    end
    object cdsSugestaoServNOME_CIDADE: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'NOME_CIDADE'
      Size = 30
    end
    object cdsSugestaoServCOD_BAIRRO: TSmallintField
      DisplayLabel = 'Cod Bairro'
      FieldName = 'COD_BAIRRO'
    end
    object cdsSugestaoServNOME_BAIRRO: TStringField
      DisplayLabel = 'Bairro'
      FieldName = 'NOME_BAIRRO'
      Size = 30
    end
    object cdsSugestaoServCEP: TStringField
      DisplayLabel = 'Cep'
      FieldName = 'CEP'
      FixedChar = True
      Size = 9
    end
    object cdsSugestaoServENDERECO: TStringField
      DisplayLabel = 'Endereco'
      FieldName = 'ENDERECO'
      Size = 50
    end
    object cdsSugestaoServNUM_END_CLIENTE: TStringField
      DisplayLabel = 'Num End'
      FieldName = 'NUM_END_CLIENTE'
      Size = 60
    end
    object cdsSugestaoServCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
      Visible = False
    end
    object cdsSugestaoServTPDOC_ANT: TStringField
      Tag = 1
      DisplayLabel = 'Tp Doc Ant'
      FieldName = 'TPDOC_ANT'
      Visible = False
      FixedChar = True
      Size = 3
    end
  end
  object dsSugestaoServ: TDataSource
    DataSet = cdsSugestaoServ
    Left = 1516
    Top = 142
  end
  object qrSugestaoServItens: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransCadastroBasico
    SQL.Strings = (
      'SELECT SUGESTAOSERVICO.*, REGRAS_SUG.DESCRICAO,'
      
        'REGRAS_SUG.MES_RET_SERV1, REGRAS_SUG.MES_RET_SERV2, REGRAS_SUG.I' +
        'NTERV_MES_SERV,'
      
        'REGRAS_SUG.KM_RET_SERV1, REGRAS_SUG.KM_RET_SERV2, REGRAS_SUG.INT' +
        'ERV_KM_SERV,'
      
        'CASE WHEN (SUGESTAOSERVICO.COD_EQUIP > 0) THEN EQUIPAMENTO.NOM_E' +
        'QUIP ELSE VEICULOS.DESCMODELO END DESCRICAO_TP,'
      
        'CLIENTES.NOME_CLIENTE, CLIENTES.RAZAO, CLIENTES.FONE_CLIENTE, CL' +
        'IENTES.EMAIL,'
      'COLABORADOR.NOME_VENDEDOR'
      'FROM SUGESTAOSERVICO'
      
        'LEFT JOIN EQUIPAMENTO ON EQUIPAMENTO.COD_EQUIP = SUGESTAOSERVICO' +
        '.COD_EQUIP AND EQUIPAMENTO.COD_EMPRESA = SUGESTAOSERVICO.COD_EMP' +
        'RESA'
      
        'LEFT JOIN VEICULOS ON VEICULOS.CODIGO = SUGESTAOSERVICO.COD_VEIC' +
        ' AND VEICULOS.CHASSI = SUGESTAOSERVICO.CHASSI AND VEICULOS.PLACA' +
        ' = SUGESTAOSERVICO.PLACA'
      
        'INNER JOIN REGRAS_SUG_ITENS ON REGRAS_SUG_ITENS.COD_TIPO = VEICU' +
        'LOS.MODELO AND REGRAS_SUG_ITENS.COD_EMPRESA = SUGESTAOSERVICO.CO' +
        'D_EMPRESA'
      
        'INNER JOIN REGRAS_SUG ON REGRAS_SUG.CODIGO = REGRAS_SUG_ITENS.CO' +
        'DIGO AND REGRAS_SUG.COD_EMPRESA = REGRAS_SUG_ITENS.COD_EMPRESA'
      
        'LEFT JOIN CLIENTES ON CLIENTES.COD_CLIENTE = SUGESTAOSERVICO.COD' +
        '_CLIENTE AND CLIENTES.COD_EMPRESA = SUGESTAOSERVICO.COD_EMPRESA'
      
        'LEFT JOIN COLABORADOR ON COLABORADOR.COD_VENDEDOR = SUGESTAOSERV' +
        'ICO.ULT_ATD AND COLABORADOR.COD_EMPRESA = SUGESTAOSERVICO.COD_EM' +
        'PRESA'
      
        'WHERE SUGESTAOSERVICO.COD_EMPRESA = 1 and SUGESTAOSERVICO.ativo ' +
        '= 1 order by SUGESTAOSERVICO.CHASSI')
    Left = 1612
    Top = 65533
  end
  object dspSugestaoServItens: TDataSetProvider
    DataSet = qrSugestaoServItens
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1612
    Top = 44
  end
  object cdsSugestaoServItens: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSugestaoServItens'
    BeforeOpen = CdsDepartamentosBeforeOpen
    Left = 1612
    Top = 93
    object cdsSugestaoServItensSEL: TStringField
      DisplayLabel = 'Sel'
      FieldKind = fkInternalCalc
      FieldName = 'SEL'
      Size = 1
    end
    object cdsSugestaoServItensTIPO: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 40
    end
    object cdsSugestaoServItensDIAS: TIntegerField
      DisplayLabel = 'Dias'
      FieldName = 'DIAS'
    end
    object DateTimeField1: TDateTimeField
      DisplayLabel = 'Data Sug'
      FieldName = 'DATA'
    end
    object IntegerField2: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Cliente'
      FieldName = 'COD_CLIENTE'
      Visible = False
    end
    object StringField4: TStringField
      Tag = 1
      DisplayLabel = 'Nome Fantasia'
      FieldName = 'NOME_CLIENTE'
      ProviderFlags = [pfInWhere]
      Visible = False
      FixedChar = True
      Size = 35
    end
    object cdsSugestaoServItensCOD_SERV_SUG: TIntegerField
      DisplayLabel = 'Cod Serv Sug'
      FieldName = 'COD_SERV_SUG'
    end
    object cdsSugestaoServItensDESCRICAO: TStringField
      DisplayLabel = 'Servico Sug'
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object cdsSugestaoServItensMES_RET_SERV1: TIntegerField
      Tag = 1
      DisplayLabel = 'Mes Prim Rev'
      FieldName = 'MES_RET_SERV1'
    end
    object cdsSugestaoServItensMES_RET_SERV2: TIntegerField
      DisplayLabel = 'Mes Seg Rev'
      FieldName = 'MES_RET_SERV2'
    end
    object cdsSugestaoServItensINTERV_MES_SERV: TIntegerField
      DisplayLabel = 'Inter Meses Rev'
      FieldName = 'INTERV_MES_SERV'
    end
    object cdsSugestaoServItensKM_RET_SERV1: TIntegerField
      DisplayLabel = 'Km Prim Rev'
      FieldName = 'KM_RET_SERV1'
    end
    object cdsSugestaoServItensKM_RET_SERV2: TIntegerField
      DisplayLabel = 'Km Seg Rev'
      FieldName = 'KM_RET_SERV2'
    end
    object cdsSugestaoServItensINTERV_KM_SERV: TIntegerField
      DisplayLabel = 'Inter Km Rev'
      FieldName = 'INTERV_KM_SERV'
    end
    object StringField5: TStringField
      Tag = 1
      DisplayLabel = 'Razao'
      FieldName = 'RAZAO'
      ProviderFlags = [pfInWhere]
      Visible = False
      Size = 60
    end
    object StringField6: TStringField
      Tag = 1
      DisplayLabel = 'Descricao'
      FieldName = 'DESCRICAO_TP'
      Visible = False
      Size = 60
    end
    object IntegerField3: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Equip'
      FieldName = 'COD_EQUIP'
      Visible = False
    end
    object IntegerField4: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Veic'
      FieldName = 'COD_VEIC'
      Visible = False
    end
    object StringField7: TStringField
      Tag = 1
      DisplayLabel = 'Chassi'
      FieldName = 'CHASSI'
      Visible = False
      Size = 17
    end
    object StringField8: TStringField
      Tag = 1
      DisplayLabel = 'Placa'
      FieldName = 'PLACA'
      Visible = False
      Size = 10
    end
    object cdsSugestaoServItensHORA: TStringField
      Tag = 1
      DisplayLabel = 'Hora'
      FieldName = 'HORA'
      Visible = False
      FixedChar = True
      Size = 8
    end
    object IntegerField5: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Ult Atd'
      FieldName = 'ULT_ATD'
      Visible = False
    end
    object StringField9: TStringField
      Tag = 1
      DisplayLabel = 'Ult Atendente'
      FieldName = 'NOME_VENDEDOR'
      ProviderFlags = [pfInWhere]
      Visible = False
      Size = 35
    end
    object StringField10: TStringField
      Tag = 1
      DisplayLabel = 'Fone'
      FieldName = 'FONE_CLIENTE'
      ProviderFlags = [pfInWhere]
      Visible = False
      FixedChar = True
      Size = 13
    end
    object StringField11: TStringField
      Tag = 1
      DisplayLabel = 'Email'
      FieldName = 'EMAIL'
      ProviderFlags = [pfInWhere]
      Visible = False
      Size = 256
    end
    object IntegerField6: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
      Visible = False
    end
    object IntegerField7: TIntegerField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
      Visible = False
    end
    object cdsSugestaoServItensCOD_SUG: TIntegerField
      Tag = 1
      DisplayLabel = 'Codigo'
      FieldName = 'COD_SUG'
      Required = True
      Visible = False
    end
    object cdsSugestaoServItensCOD_SUG_OS: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Servico'
      FieldName = 'COD_SUG_OS'
      Visible = False
    end
    object cdsSugestaoServItensCOD_AGENDA: TIntegerField
      Tag = 1
      FieldName = 'COD_AGENDA'
      Visible = False
    end
    object cdsSugestaoServItensUS_CAD: TIntegerField
      Tag = 1
      DisplayLabel = 'Us Cad'
      FieldName = 'US_CAD'
      Visible = False
    end
    object cdsSugestaoServItensDATA_CAD: TDateTimeField
      Tag = 1
      DisplayLabel = 'Data Cad'
      FieldName = 'DATA_CAD'
      Visible = False
    end
    object cdsSugestaoServItensHORA_CAD: TStringField
      Tag = 1
      DisplayLabel = 'Hora Cad'
      FieldName = 'HORA_CAD'
      Visible = False
      FixedChar = True
      Size = 8
    end
    object cdsSugestaoServItensUS_MOD: TIntegerField
      Tag = 1
      DisplayLabel = 'Us Mod'
      FieldName = 'US_MOD'
      Visible = False
    end
    object cdsSugestaoServItensDATA_MOD: TDateTimeField
      Tag = 1
      DisplayLabel = 'Data Mod'
      FieldName = 'DATA_MOD'
      Visible = False
    end
    object cdsSugestaoServItensHORA_MOD: TStringField
      Tag = 1
      DisplayLabel = 'Hora Mod'
      FieldName = 'HORA_MOD'
      Visible = False
      FixedChar = True
      Size = 8
    end
    object cdsSugestaoServItensSTATUS: TStringField
      Tag = 1
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      Visible = False
      Size = 10
    end
    object cdsSugestaoServItensNDOC: TIntegerField
      Tag = 1
      FieldName = 'NDOC'
      Visible = False
    end
    object cdsSugestaoServItensTPDOC: TStringField
      Tag = 1
      FieldName = 'TPDOC'
      Visible = False
      FixedChar = True
      Size = 3
    end
    object cdsSugestaoServItensNDOC_ANT: TIntegerField
      DisplayLabel = 'Num OS'
      FieldName = 'NDOC_ANT'
    end
    object cdsSugestaoServItensDATA_DOC_ANT: TDateTimeField
      DisplayLabel = 'Data OS'
      FieldName = 'DATA_DOC_ANT'
    end
    object cdsSugestaoServItensDATA_DOC: TDateTimeField
      Tag = 1
      FieldName = 'DATA_DOC'
      Visible = False
    end
    object cdsSugestaoServItensTPDOC_ANT: TStringField
      Tag = 1
      DisplayLabel = 'Tipo Doc '
      FieldName = 'TPDOC_ANT'
      Visible = False
      FixedChar = True
      Size = 3
    end
    object cdsSugestaoServItensDATA_ULT_SERV: TDateTimeField
      Tag = 1
      FieldName = 'DATA_ULT_SERV'
      Visible = False
    end
    object cdsSugestaoServItensKM_ULT_SERV: TIntegerField
      Tag = 1
      FieldName = 'KM_ULT_SERV'
      Visible = False
    end
  end
  object dsSugestaoServItens: TDataSource
    DataSet = cdsSugestaoServItens
    Left = 1612
    Top = 142
  end
  object qrOcorrenciasSug: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransCadastroBasico
    SQL.Strings = (
      'SELECT * FROM OCORRENCIA_SUG'
      'WHERE COD_EMPRESA = 1')
    Left = 1724
    Top = 65533
  end
  object dspOcorrenciasSug: TDataSetProvider
    DataSet = qrOcorrenciasSug
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1724
    Top = 44
  end
  object cdsOcorrenciasSug: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspOcorrenciasSug'
    BeforeOpen = CdsDepartamentosBeforeOpen
    Left = 1724
    Top = 93
    object cdsOcorrenciasSugCOD_OCORR: TIntegerField
      DisplayLabel = 'Cod Ocorrencia'
      FieldName = 'COD_OCORR'
      Required = True
    end
    object cdsOcorrenciasSugCOD_EMPRESA: TIntegerField
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsOcorrenciasSugCOD_EQUIP: TIntegerField
      DisplayLabel = 'Cod Equip'
      FieldName = 'COD_EQUIP'
    end
    object cdsOcorrenciasSugCOD_VEIC: TIntegerField
      DisplayLabel = 'Cod Veic'
      FieldName = 'COD_VEIC'
    end
    object cdsOcorrenciasSugCHASSI: TStringField
      DisplayLabel = 'Chassi'
      FieldName = 'CHASSI'
      Size = 17
    end
    object cdsOcorrenciasSugPLACA: TStringField
      DisplayLabel = 'Placa'
      FieldName = 'PLACA'
      Size = 10
    end
    object cdsOcorrenciasSugOBSERVACAO: TMemoField
      DisplayLabel = 'Obs'
      FieldName = 'OBSERVACAO'
      OnGetText = cdsOcorrenciasSugOBSERVACAOGetText
      BlobType = ftMemo
      Size = 8
    end
    object cdsOcorrenciasSugUS_CAD: TIntegerField
      DisplayLabel = 'Us Cad'
      FieldName = 'US_CAD'
    end
    object cdsOcorrenciasSugDATA_CAD: TDateTimeField
      DisplayLabel = 'Data Cad'
      FieldName = 'DATA_CAD'
    end
    object cdsOcorrenciasSugHORA_CAD: TStringField
      DisplayLabel = 'Hora Cad'
      FieldName = 'HORA_CAD'
      FixedChar = True
      Size = 8
    end
  end
  object dsOcorrenciasSug: TDataSource
    DataSet = cdsOcorrenciasSug
    Left = 1724
    Top = 142
  end
  object qrOrdemServico: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransCadastroBasico
    SQL.Strings = (
      
        'SELECT PD.DATA_PED, PD.DATA_FECH, PD.STATUS_PED, PD.COD_VENDEDOR' +
        ', COL.NOME_VENDEDOR,'
      'PD.COD_EQUIP,  PD.COD_VEICULO, PD.CHASSI, PD.PLACA, PD.KM_V,'
      'PD.COD_CLIENTE,  CL.NOME_CLIENTE, PD.NPED FROM PEDVENDA PD'
      
        'LEFT JOIN COLABORADOR COL ON COL.COD_VENDEDOR = PD.COD_VENDEDOR ' +
        'AND COL.COD_EMPRESA = PD.COD_EMPRESA'
      
        'LEFT JOIN CLIENTES CL ON CL.COD_CLIENTE = PD.COD_CLIENTE AND CL.' +
        'COD_EMPRESA = PD.COD_EMPRESA'
      'WHERE PD.TIPO = '#39'OS'#39' AND PD.STATUS_PED = '#39'FECHADA'#39
      'AND PD.COD_EQUIP = :COD_EQUIP'
      'AND PD.COD_EMPRESA = :COD_EMPRESA'
      'ORDER BY 1 DESC, 2 DESC')
    Left = 1820
    Top = 65533
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'COD_EQUIP'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'COD_EMPRESA'
        ParamType = ptUnknown
      end>
  end
  object dspOrdemServico: TDataSetProvider
    DataSet = qrOrdemServico
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1820
    Top = 44
  end
  object cdsOrdemServico: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspOrdemServico'
    BeforeOpen = CdsDepartamentosBeforeOpen
    Left = 1820
    Top = 93
    object cdsOrdemServicoNPED: TIntegerField
      DisplayLabel = 'Num OS'
      FieldName = 'NPED'
      Required = True
    end
    object cdsOrdemServicoDATA_PED: TDateTimeField
      DisplayLabel = 'Data OS'
      FieldName = 'DATA_PED'
    end
    object cdsOrdemServicoDATA_FECH: TDateTimeField
      DisplayLabel = 'Data Fechamento'
      FieldName = 'DATA_FECH'
    end
    object cdsOrdemServicoSTATUS_PED: TStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS_PED'
      Size = 10
    end
    object cdsOrdemServicoCOD_VENDEDOR: TIntegerField
      DisplayLabel = 'Cod Vendedor'
      FieldName = 'COD_VENDEDOR'
      Required = True
    end
    object cdsOrdemServicoNOME_VENDEDOR: TStringField
      DisplayLabel = 'Vendedor'
      FieldName = 'NOME_VENDEDOR'
      Size = 35
    end
    object cdsOrdemServicoCOD_EQUIP: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Equip'
      FieldName = 'COD_EQUIP'
      Visible = False
    end
    object cdsOrdemServicoCOD_VEICULO: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Veiculo'
      FieldName = 'COD_VEICULO'
      Visible = False
    end
    object cdsOrdemServicoCHASSI: TStringField
      Tag = 1
      DisplayLabel = 'Chassi'
      FieldName = 'CHASSI'
      Visible = False
      Size = 17
    end
    object cdsOrdemServicoPLACA: TStringField
      Tag = 1
      DisplayLabel = 'Placa'
      FieldName = 'PLACA'
      Visible = False
      Size = 10
    end
    object cdsOrdemServicoKM_V: TIntegerField
      DisplayLabel = 'Km'
      FieldName = 'KM_V'
    end
    object cdsOrdemServicoCOD_CLIENTE: TIntegerField
      DisplayLabel = 'Cod Cliente'
      FieldName = 'COD_CLIENTE'
      Required = True
    end
    object cdsOrdemServicoNOME_CLIENTE: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'NOME_CLIENTE'
      FixedChar = True
      Size = 35
    end
  end
  object dsOrdemServico: TDataSource
    DataSet = cdsOrdemServico
    Left = 1820
    Top = 142
  end
  object qrEmpresaRep: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransEmpresa
    SQL.Strings = (
      'select * from EMPRESA')
    Left = 1917
  end
  object dsEmpresaRep: TDataSource
    DataSet = cdsEmpresaRep
    Left = 1917
    Top = 145
  end
  object dspEmpresaRep: TDataSetProvider
    DataSet = qrEmpresaRep
    Constraints = False
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1917
    Top = 47
  end
  object cdsEmpresaRep: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEmpresa'
    BeforeOpen = CdsDepartamentosBeforeOpen
    Left = 1917
    Top = 96
    object IntegerField8: TIntegerField
      Tag = 2
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_EMPRESA'
      Origin = '"EMPRESA"."COD_EMPRESA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object StringField12: TStringField
      Tag = 2
      DisplayLabel = 'Empresa'
      FieldName = 'NOME_EMP'
      Origin = '"EMPRESA"."NOME_EMP"'
      Size = 50
    end
    object cdsEmpresaRepIDENTIFICACAO_EMP: TStringField
      DisplayLabel = 'Empresa'
      FieldName = 'IDENTIFICACAO_EMP'
      Size = 64
    end
    object StringField17: TStringField
      DisplayLabel = 'CNPJ'
      FieldName = 'CGC_EMP'
      Origin = '"EMPRESA"."CGC_EMP"'
      Size = 18
    end
    object cdsEmpresaRepEMP_REPL_INTERNA: TIntegerField
      FieldName = 'EMP_REPL_INTERNA'
    end
  end
  object qrExecoesProc: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransEmpresa
    SQL.Strings = (
      
        'select tu.*, tb.nome_processo, tb.nivel_processo, tb.senha_geren' +
        'te from tabela_processos_usuarios tu'
      
        'inner join tabela_processos tb on tb.cod_processo = tu.cod_proce' +
        'sso and tb.cod_empresa = tu.cod_empresa'
      'where tu.usuario = :usuario and tb.cod_empresa = 1')
    Left = 1965
    Top = 216
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'usuario'
        ParamType = ptUnknown
      end>
  end
  object dsExecoesProc: TDataSource
    DataSet = cdsExecoesProc
    Left = 1965
    Top = 361
  end
  object dspExecoesProc: TDataSetProvider
    DataSet = qrExecoesProc
    Constraints = False
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1965
    Top = 263
  end
  object cdsExecoesProc: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspExecoesProc'
    BeforeOpen = CdsDepartamentosBeforeOpen
    Left = 1965
    Top = 312
    object cdsExecoesProcCOD_PROCESSO: TStringField
      DisplayLabel = 'Processo'
      FieldName = 'COD_PROCESSO'
      Required = True
      FixedChar = True
      Size = 10
    end
    object cdsExecoesProcNOME_PROCESSO: TStringField
      DisplayLabel = 'Descricao Processo'
      FieldName = 'NOME_PROCESSO'
      Size = 50
    end
    object cdsExecoesProcCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
      Visible = False
    end
    object cdsExecoesProcUSUARIO: TStringField
      DisplayLabel = 'Usuario'
      FieldName = 'USUARIO'
      Required = True
      FixedChar = True
      Size = 10
    end
    object cdsExecoesProcUSUARIO_AUTORIZOU: TStringField
      DisplayLabel = 'Usuario que autorizou'
      FieldName = 'USUARIO_AUTORIZOU'
      FixedChar = True
      Size = 10
    end
    object cdsExecoesProcNIVEL_PROCESSO: TIntegerField
      DisplayLabel = 'Nivel  Processo'
      FieldName = 'NIVEL_PROCESSO'
      Required = True
    end
    object cdsExecoesProcSENHA_GERENTE: TStringField
      DisplayLabel = 'Senha Gerente'
      FieldName = 'SENHA_GERENTE'
      FixedChar = True
      Size = 1
    end
    object cdsExecoesProcDATA_AUTORIZACAO: TDateTimeField
      DisplayLabel = 'Data Autorizacao'
      FieldName = 'DATA_AUTORIZACAO'
    end
  end
  object dspControlesNot: TDataSetProvider
    DataSet = qrControlesNot
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1856
    Top = 472
  end
  object qrControlesNot: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransModCartas
    SQL.Strings = (
      
        'select ctr.codigo_ctrl, ctr.codigo_emp, ctr.nome_ctrl, ctr.env_n' +
        'otificacao from controles ctr'
      'where ctr.codigo_emp = 1'
      'and ctr.docs = '#39'S2'#39
      'and ctr.ativo = 1'
      'order by 1')
    Left = 1856
    Top = 425
  end
  object cdsControlesNot: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspControlesNot'
    BeforeOpen = CdsDepartamentosBeforeOpen
    Left = 1856
    Top = 517
    object cdsControlesNotSEL: TStringField
      DisplayLabel = 'Sel'
      FieldKind = fkInternalCalc
      FieldName = 'SEL'
      Size = 1
    end
    object cdsControlesNotCODIGO_CTRL: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO_CTRL'
      Required = True
    end
    object cdsControlesNotCODIGO_EMP: TIntegerField
      DisplayLabel = 'Cod Empresa'
      FieldName = 'CODIGO_EMP'
      Required = True
    end
    object cdsControlesNotNOME_CTRL: TStringField
      DisplayLabel = 'Descricao'
      FieldName = 'NOME_CTRL'
      Size = 35
    end
    object cdsControlesNotENV_NOTIFICACAO: TStringField
      DisplayLabel = 'Env Notificacao'
      FieldName = 'ENV_NOTIFICACAO'
      FixedChar = True
      Size = 1
    end
  end
  object dsControlesNot: TDataSource
    DataSet = cdsControlesNot
    Left = 1856
    Top = 562
  end
  object qrProdutosEC_CA: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransEmpresa
    SQL.Strings = (
      'SELECT PS.* FROM VW_PRODUTOS_EC PS '
      'WHERE PS.COD_EMPRESA = 0')
    Left = 2029
  end
  object dsProdutosEC_CA: TDataSource
    DataSet = cdsProdutosEC_CA
    Left = 2029
    Top = 145
  end
  object dspProdutosEC_CA: TDataSetProvider
    DataSet = qrProdutosEC_CA
    Constraints = False
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 2029
    Top = 47
  end
  object cdsProdutosEC_CA: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProdutosEC_CA'
    BeforeOpen = CdsDepartamentosBeforeOpen
    Left = 2029
    Top = 96
    object cdsProdutosEC_CASEL: TStringField
      DisplayLabel = 'Sel'
      FieldKind = fkInternalCalc
      FieldName = 'SEL'
      Size = 1
    end
    object cdsProdutosEC_CATIPO: TIntegerField
      Tag = 1
      DisplayLabel = 'Tipo1'
      FieldName = 'TIPO'
      ReadOnly = True
    end
    object cdsProdutosEC_CAAPI: TStringField
      FieldName = 'API'
      ReadOnly = True
    end
    object cdsProdutosEC_CAGRUPO_PROD: TIntegerField
      DisplayLabel = 'Grupo Prod/Cod Servico'
      FieldName = 'GRUPO_PROD'
      ReadOnly = True
    end
    object cdsProdutosEC_CACOD_PROD: TStringField
      DisplayLabel = 'Cod Prod/Tipo'
      FieldName = 'COD_PROD'
      ReadOnly = True
      FixedChar = True
      Size = 6
    end
    object cdsProdutosEC_CACOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      ReadOnly = True
    end
    object cdsProdutosEC_CAATIVO: TIntegerField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
      ReadOnly = True
    end
    object cdsProdutosEC_CANUM_FAB_PROD: TStringField
      DisplayLabel = 'Num Fab Prod'
      FieldName = 'NUM_FAB_PROD'
      ReadOnly = True
      FixedChar = True
    end
    object cdsProdutosEC_CADESCR_PROD_RES: TStringField
      DisplayLabel = 'Descricao Resumida'
      FieldName = 'DESCR_PROD_RES'
      ReadOnly = True
      Size = 131
    end
    object cdsProdutosEC_CADESCR_PROD_COMPL: TMemoField
      Tag = 1
      DisplayLabel = 'Descricao Completa'
      FieldName = 'DESCR_PROD_COMPL'
      ReadOnly = True
      OnGetText = cdsProdutosEC_CADESCR_PROD_COMPLGetText
      BlobType = ftMemo
      Size = 8
    end
    object cdsProdutosEC_CASINC_ECOMMERCE: TStringField
      DisplayLabel = 'Env Ecommerce'
      FieldName = 'SINC_ECOMMERCE'
      FixedChar = True
      Size = 1
    end
    object cdsProdutosEC_CAID_COMMERCE: TLargeintField
      DisplayLabel = 'Id Ecommerce'
      FieldName = 'ID_COMMERCE'
      ReadOnly = True
    end
    object cdsProdutosEC_CADISPONIVEL: TStringField
      DisplayLabel = 'Disponivel'
      FieldName = 'DISPONIVEL'
      FixedChar = True
      Size = 1
    end
    object cdsProdutosEC_CAENV_COMERCIO_ABERTO: TStringField
      DisplayLabel = 'Env Comercio Aberto'
      FieldName = 'ENV_COMERCIO_ABERTO'
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object cdsProdutosEC_CAID_COMERCIO_ABERTO: TIntegerField
      DisplayLabel = 'Id Comercio Aberto'
      FieldName = 'ID_COMERCIO_ABERTO'
      ReadOnly = True
    end
    object cdsProdutosEC_CADESCRICAO_MARCA: TStringField
      DisplayLabel = 'Marca'
      FieldName = 'DESCRICAO_MARCA'
      ReadOnly = True
      FixedChar = True
      Size = 30
    end
    object cdsProdutosEC_CAREFERENCE: TStringField
      DisplayLabel = 'Referencia'
      FieldName = 'REFERENCE'
      ReadOnly = True
    end
    object cdsProdutosEC_CACOM_GRADE: TStringField
      Tag = 1
      DisplayLabel = 'Com Grade'
      FieldName = 'COM_GRADE'
      ReadOnly = True
      Size = 11
    end
    object cdsProdutosEC_CACOD_GRADE: TIntegerField
      DisplayLabel = 'Cod Grade'
      FieldName = 'COD_GRADE'
      ReadOnly = True
    end
    object cdsProdutosEC_CAGRADE1: TStringField
      DisplayLabel = 'Grade 1'
      FieldName = 'GRADE1'
      ReadOnly = True
      Size = 100
    end
    object cdsProdutosEC_CAGRADE2: TStringField
      DisplayLabel = 'Grade 2'
      FieldName = 'GRADE2'
      ReadOnly = True
      Size = 100
    end
    object cdsProdutosEC_CAEST_DISP: TFloatField
      DisplayLabel = 'Estoque Disponivel'
      FieldName = 'EST_DISP'
      ReadOnly = True
    end
    object cdsProdutosEC_CAEST_DISP_GRADE: TFloatField
      DisplayLabel = 'Estoque Disponivel Grade'
      FieldName = 'EST_DISP_GRADE'
      ReadOnly = True
    end
    object cdsProdutosEC_CAEST_MINIMO: TFloatField
      DisplayLabel = 'Estoque Minimo'
      FieldName = 'EST_MINIMO'
      ReadOnly = True
    end
    object cdsProdutosEC_CAMANUAL_EST_DISP: TFloatField
      DisplayLabel = 'Estoque Disponivel'
      FieldName = 'MANUAL_EST_DISP'
      ReadOnly = True
    end
    object cdsProdutosEC_CAMANUAL_EST_DISP_GRADE: TFloatField
      DisplayLabel = 'Estoque Disponivel Grade'
      FieldName = 'MANUAL_EST_DISP_GRADE'
      ReadOnly = True
    end
    object cdsProdutosEC_CAMANUAL_EST_MINIMO: TFloatField
      DisplayLabel = 'Estoque Minimo'
      FieldName = 'MANUAL_EST_MINIMO'
      ReadOnly = True
    end
    object cdsProdutosEC_CAAPI_PRECO_TABELA: TFloatField
      DisplayLabel = 'Preco Tabela (API)'
      FieldName = 'API_PRECO_TABELA'
      ReadOnly = True
    end
    object cdsProdutosEC_CAPRECO_TABELA: TFloatField
      DisplayLabel = 'Preco Tabela'
      FieldName = 'PRECO_TABELA'
      ReadOnly = True
    end
    object cdsProdutosEC_CADESCRICAOPROMOCAO: TStringField
      DisplayLabel = 'Promocao'
      FieldName = 'DESCRICAOPROMOCAO'
      ReadOnly = True
      Size = 128
    end
    object cdsProdutosEC_CAVALORPROMOCAO: TFloatField
      DisplayLabel = 'Valor Promocional'
      FieldName = 'VALORPROMOCAO'
      ReadOnly = True
    end
    object cdsProdutosEC_CADATAINICIOPROMOCAO: TDateTimeField
      DisplayLabel = 'Data Inicio Promocao'
      FieldName = 'DATAINICIOPROMOCAO'
      ReadOnly = True
    end
    object cdsProdutosEC_CAHORAINICIOPROMOCAO: TStringField
      DisplayLabel = 'Hora Inicio Promocao'
      FieldName = 'HORAINICIOPROMOCAO'
      ReadOnly = True
      Size = 8
    end
    object cdsProdutosEC_CADATAFIMPROMOCAO: TDateTimeField
      DisplayLabel = 'Data Final Promocao'
      FieldName = 'DATAFIMPROMOCAO'
      ReadOnly = True
    end
    object cdsProdutosEC_CAHORAFIMPROMOCAO: TStringField
      DisplayLabel = 'Hora Final Promocao'
      FieldName = 'HORAFIMPROMOCAO'
      ReadOnly = True
      Size = 8
    end
    object cdsProdutosEC_CAPRECO_A_COMBINAR_EC: TStringField
      DisplayLabel = 'Preco a combinar Ecommerce'
      FieldName = 'PRECO_A_COMBINAR_EC'
      FixedChar = True
      Size = 1
    end
    object cdsProdutosEC_CAPRECO_A_COMBINAR_CA: TStringField
      DisplayLabel = 'Preco a combinar Comercio Aberto'
      FieldName = 'PRECO_A_COMBINAR_CA'
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object cdsProdutosEC_CAPROMOCIONAL: TStringField
      DisplayLabel = 'Promocional'
      FieldName = 'PROMOCIONAL'
      FixedChar = True
      Size = 1
    end
    object cdsProdutosEC_CAFRETE_GRATIS: TStringField
      DisplayLabel = 'Fretes Gratis'
      FieldName = 'FRETE_GRATIS'
      FixedChar = True
      Size = 1
    end
    object cdsProdutosEC_CALANCAMENTO: TStringField
      DisplayLabel = 'Lancamento'
      FieldName = 'LANCAMENTO'
      FixedChar = True
      Size = 1
    end
    object cdsProdutosEC_CADESTAQUE: TStringField
      DisplayLabel = 'Destaque'
      FieldName = 'DESTAQUE'
      FixedChar = True
      Size = 1
    end
    object cdsProdutosEC_CATERMOS_ACEITE: TStringField
      DisplayLabel = 'Termos de Aceite'
      FieldName = 'TERMOS_ACEITE'
      FixedChar = True
      Size = 1
    end
    object cdsProdutosEC_CAVARIACAO: TStringField
      DisplayLabel = 'Variacao'
      FieldName = 'VARIACAO'
      FixedChar = True
      Size = 1
    end
    object cdsProdutosEC_CACOMPREJUNTO: TStringField
      DisplayLabel = 'Compre Junto'
      FieldName = 'COMPREJUNTO'
      FixedChar = True
      Size = 1
    end
    object cdsProdutosEC_CAVIRTUAL: TStringField
      DisplayLabel = 'Virtual'
      FieldName = 'VIRTUAL'
      FixedChar = True
      Size = 1
    end
  end
  object qrConciliacaoTiposLancamentos: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransCadastroBasico
    SQL.Strings = (
      
        'select conciliacao_tipo_lanc.*, p_contas_e.desc_plc as desc_plc_' +
        'e, p_contas_s.desc_plc as desc_plc_s from conciliacao_tipo_lanc'
      
        'left join p_contas p_contas_e on p_contas_e.n_conta_plc = concil' +
        'iacao_tipo_lanc.n_conta_plc_e'
      
        'left join p_contas p_contas_s on p_contas_s.n_conta_plc = concil' +
        'iacao_tipo_lanc.n_conta_plc_s')
    Left = 1997
    Top = 424
  end
  object dsConciliacaoTiposLancamentos: TDataSource
    DataSet = cdsConciliacaoTiposLancamentos
    Left = 1997
    Top = 569
  end
  object dspConciliacaoTiposLancamentos: TDataSetProvider
    DataSet = qrConciliacaoTiposLancamentos
    Constraints = False
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1997
    Top = 471
  end
  object cdsConciliacaoTiposLancamentos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConciliacaoTiposLancamentos'
    BeforeOpen = CdsDepartamentosBeforeOpen
    Left = 1997
    Top = 520
    object cdsConciliacaoTiposLancamentosSEL: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'SEL'
      Size = 1
    end
    object cdsConciliacaoTiposLancamentosID: TIntegerField
      DisplayLabel = 'Id Lancamento'
      FieldName = 'ID'
      Required = True
    end
    object cdsConciliacaoTiposLancamentosDESCRICAO: TStringField
      DisplayLabel = 'Tipo Lancamento'
      FieldName = 'DESCRICAO'
      Size = 150
    end
    object cdsConciliacaoTiposLancamentosATIVO: TIntegerField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
    object cdsConciliacaoTiposLancamentosN_CONTA_PLC_E: TFloatField
      DisplayLabel = 'Num Conta E'
      FieldName = 'N_CONTA_PLC_E'
    end
    object cdsConciliacaoTiposLancamentosN_CONTA_PLC_S: TFloatField
      DisplayLabel = 'Num Conta S'
      FieldName = 'N_CONTA_PLC_S'
    end
    object cdsConciliacaoTiposLancamentosDESC_PLC_E: TStringField
      DisplayLabel = 'Descricao Conta E'
      FieldName = 'DESC_PLC_E'
      FixedChar = True
      Size = 30
    end
    object cdsConciliacaoTiposLancamentosDESC_PLC_S: TStringField
      DisplayLabel = 'Descricao Conta S'
      FieldName = 'DESC_PLC_S'
      FixedChar = True
      Size = 30
    end
  end
  object qrPContasTiposLancE: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransCadastroBasico
    SQL.Strings = (
      'select n_conta_plc, desc_plc from p_contas '
      'where ativo = 1 '
      'order by desc_plc')
    Left = 2325
    Top = 208
  end
  object dsPContasTiposLancE: TDataSource
    DataSet = cdsPContasTiposLancE
    Left = 2325
    Top = 362
  end
  object dspPContasTiposLancE: TDataSetProvider
    DataSet = qrPContasTiposLancE
    Constraints = False
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 2325
    Top = 255
  end
  object cdsPContasTiposLancE: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPContasTiposLancE'
    BeforeOpen = CdsDepartamentosBeforeOpen
    Left = 2325
    Top = 307
    object cdsPContasTiposLancEN_CONTA_PLC: TFloatField
      FieldName = 'N_CONTA_PLC'
    end
    object cdsPContasTiposLancEDESC_PLC: TStringField
      FieldName = 'DESC_PLC'
      Required = True
      FixedChar = True
      Size = 30
    end
  end
  object qrImagensDoc: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransEmpresa
    SQL.Strings = (
      'SELECT IMAGENS_DOC.* FROM IMAGENS_DOC'
      'WHERE COD_IMG = 0 AND COD_EMPRESA = 0')
    Left = 2157
  end
  object dsImagensDoc: TDataSource
    DataSet = cdsImagensDoc
    Left = 2157
    Top = 145
  end
  object dspImagensDoc: TDataSetProvider
    DataSet = qrImagensDoc
    Constraints = False
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 2157
    Top = 47
  end
  object cdsImagensDoc: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspImagensDoc'
    BeforeOpen = CdsDepartamentosBeforeOpen
    Left = 2157
    Top = 96
    object cdsImagensDocCOD_IMG: TIntegerField
      DisplayLabel = 'Cod Img'
      FieldName = 'COD_IMG'
      Required = True
    end
    object cdsImagensDocCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsImagensDocIMAGEM: TMemoField
      DisplayLabel = 'Imagem'
      FieldName = 'IMAGEM'
      BlobType = ftMemo
      Size = 8
    end
    object cdsImagensDocUS_CAD: TIntegerField
      DisplayLabel = 'Us Cad'
      FieldName = 'US_CAD'
    end
    object cdsImagensDocDATA_CAD: TDateTimeField
      FieldName = 'DATA_CAD'
    end
  end
  object qrComissaoFaixaDesc: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransCadastroBasico
    SQL.Strings = (
      'select * from comissao_faixa_desconto')
    Left = 2277
  end
  object dsComissaoFaixaDesc: TDataSource
    DataSet = cdsComissaoFaixaDesc
    Left = 2277
    Top = 154
  end
  object dspComissaoFaixaDesc: TDataSetProvider
    DataSet = qrComissaoFaixaDesc
    Constraints = False
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 2277
    Top = 47
  end
  object cdsComissaoFaixaDesc: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspComissaoFaixaDesc'
    BeforeOpen = CdsDepartamentosBeforeOpen
    Left = 2277
    Top = 99
    object cdsComissaoFaixaDescCODIGO: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO'
      Required = True
    end
    object cdsComissaoFaixaDescCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsComissaoFaixaDescDESCRICAO: TStringField
      DisplayLabel = 'Descricao'
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object cdsComissaoFaixaDescTIPO: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 10
    end
    object cdsComissaoFaixaDescATIVO: TIntegerField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
  end
  object qrComissaoFaixaDescVig: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransCadastroBasico
    SQL.Strings = (
      'select * from comissao_faixa_desconto_vig')
    Left = 2421
  end
  object dsComissaoFaixaDescVig: TDataSource
    DataSet = cdsComissaoFaixaDescVig
    Left = 2421
    Top = 154
  end
  object dspComissaoFaixaDescVig: TDataSetProvider
    DataSet = qrComissaoFaixaDescVig
    Constraints = False
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 2421
    Top = 47
  end
  object cdsComissaoFaixaDescVig: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspComissaoFaixaDescVig'
    BeforeOpen = CdsDepartamentosBeforeOpen
    Left = 2421
    Top = 99
    object cdsComissaoFaixaDescVigCOD_VIG: TIntegerField
      FieldName = 'COD_VIG'
      Required = True
    end
    object cdsComissaoFaixaDescVigCODIGO: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO'
      Required = True
    end
    object cdsComissaoFaixaDescVigCOD_EMPRESA: TIntegerField
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsComissaoFaixaDescVigDTINI_VIG: TDateTimeField
      DisplayLabel = 'Data inicial vigencia'
      FieldName = 'DTINI_VIG'
      Required = True
      EditMask = '!99/99/0000;1;_'
    end
    object cdsComissaoFaixaDescVigDTFIM_VIG: TDateTimeField
      DisplayLabel = 'Data final vigencia'
      FieldName = 'DTFIM_VIG'
      Required = True
      EditMask = '!99/99/0000;1;_'
    end
  end
  object qrComissaoFaixaDescPerc: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransCadastroBasico
    SQL.Strings = (
      'select * perc'
      'where cod_perc = 0'
      'and cod_vig = 0'
      'and codigo = 0'
      'and cod_empresa = 0')
    Left = 2573
  end
  object dsComissaoFaixaDescPerc: TDataSource
    DataSet = cdsComissaoFaixaDescPerc
    Left = 2573
    Top = 154
  end
  object dspComissaoFaixaDescPerc: TDataSetProvider
    DataSet = qrComissaoFaixaDescPerc
    Constraints = False
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 2573
    Top = 47
  end
  object cdsComissaoFaixaDescPerc: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspComissaoFaixaDescPerc'
    BeforeOpen = CdsDepartamentosBeforeOpen
    Left = 2573
    Top = 99
    object cdsComissaoFaixaDescPercCOD_PERC: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Perc'
      FieldName = 'COD_PERC'
      Required = True
    end
    object cdsComissaoFaixaDescPercCOD_VIG: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Ving'
      FieldName = 'COD_VIG'
      Required = True
    end
    object cdsComissaoFaixaDescPercCODIGO: TIntegerField
      Tag = 1
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO'
      Required = True
    end
    object cdsComissaoFaixaDescPercCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsComissaoFaixaDescPercPERC_DESC_INI: TFloatField
      DisplayLabel = 'Desc inicial (%)'
      FieldName = 'PERC_DESC_INI'
      DisplayFormat = '##0.000'
    end
    object cdsComissaoFaixaDescPercPERC_DESC_FIM: TFloatField
      DisplayLabel = 'Desc final (%)'
      FieldName = 'PERC_DESC_FIM'
      DisplayFormat = '##0.000'
    end
    object cdsComissaoFaixaDescPercPERC_COMISSAO: TFloatField
      DisplayLabel = 'Comiss'#227'o (%)'
      FieldName = 'PERC_COMISSAO'
      DisplayFormat = '##0.000'
    end
  end
  object qrRegrasTravOsReq: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransCadastroBasico
    SQL.Strings = (
      'select * from regras_travosreq')
    Left = 2613
    Top = 208
  end
  object dsRegrasTravOsReq: TDataSource
    DataSet = cdsRegrasTravOsReq
    Left = 2613
    Top = 362
  end
  object dspRegrasTravOsReq: TDataSetProvider
    DataSet = qrRegrasTravOsReq
    Constraints = False
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 2613
    Top = 255
  end
  object cdsRegrasTravOsReq: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRegrasTravOsReq'
    BeforeOpen = CdsDepartamentosBeforeOpen
    Left = 2613
    Top = 307
    object cdsRegrasTravOsReqTIPO: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Required = True
      Size = 3
    end
    object cdsRegrasTravOsReqTIPV: TStringField
      DisplayLabel = 'Tipo Venda'
      FieldName = 'TIPV'
      Required = True
      Size = 10
    end
    object cdsRegrasTravOsReqQTDE_DIAS: TIntegerField
      DisplayLabel = 'Qtde Dias'
      FieldName = 'QTDE_DIAS'
      Required = True
    end
    object cdsRegrasTravOsReqQTDE_DIAS_RES: TIntegerField
      DisplayLabel = 'Qtde Dias Reserva'
      FieldName = 'QTDE_DIAS_RES'
    end
    object cdsRegrasTravOsReqNIVEL_US: TIntegerField
      DisplayLabel = 'Nivel Usuario'
      FieldName = 'NIVEL_US'
    end
    object cdsRegrasTravOsReqATIVO: TIntegerField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
    object cdsRegrasTravOsReqCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
  end
  object dspRegraControle: TDataSetProvider
    DataSet = qrRegraControle
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1153
    Top = 703
  end
  object qrRegraControle: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTRegrasVND
    SQL.Strings = (
      'select ctrl.codigo_ctrl, ctrl.nome_ctrl, '
      '(select distinct rv.cod_regravnd '
      ' from regravnd_controle rctrl '
      ' inner join regras_vendas rv on '
      '         rctrl.cod_regravnd = rv.cod_regravnd '
      '     and rctrl.cod_empresa = rv.cod_empresa '
      ' where rctrl.cod_regravnd =  1'
      ' and ctrl.codigo_ctrl = rctrl.codigo_ctrl '
      ' and rv.cod_empresa =  1) as cod_regravnd from controles ctrl'
      'where ctrl.codigo_emp = 1'
      'and ctrl.ativo = 1')
    Left = 1153
    Top = 658
  end
  object cdsRegraControle: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRegraControle'
    BeforeOpen = cdsFeriadoBeforeOpen
    Left = 1153
    Top = 745
    object cdsRegraControleCODIGO_CTRL: TIntegerField
      DisplayLabel = 'Cod Controle'
      FieldName = 'CODIGO_CTRL'
      Required = True
    end
    object cdsRegraControleNOME_CTRL: TStringField
      DisplayLabel = 'Descri'#231#227'o Controle'
      FieldName = 'NOME_CTRL'
      Size = 35
    end
    object cdsRegraControleCOD_REGRAVND: TIntegerField
      DisplayLabel = 'Cod Regra'
      FieldName = 'COD_REGRAVND'
    end
  end
  object dsRegraControle: TDataSource
    DataSet = cdsRegraControle
    Left = 1154
    Top = 792
  end
  object dspRegraTipoVndOS: TDataSetProvider
    DataSet = qrRegraTipoVndOS
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1257
    Top = 703
  end
  object qrRegraTipoVndOS: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTRegrasVND
    SQL.Strings = (
      'select tp.tipo,'
      
        'case when (tp.tipo = '#39'REQ'#39') then tp.sigla else tp.tipo_os end si' +
        'gla, tp.descricao,'
      '(select distinct rv.cod_regravnd '
      ' from regravnd_tipo_vendas rtp'
      ' inner join regras_vendas rv on '
      '         rtp.cod_regravnd = rv.cod_regravnd'
      '     and rtp.cod_empresa = rv.cod_empresa'
      ' where rtp.cod_regravnd =  1'
      
        ' and case when (tp.tipo = '#39'REQ'#39') then tp.sigla else tp.tipo_os e' +
        'nd = rtp.tipovnd_os'
      ' and rv.cod_empresa = 1) as cod_regravnd from tipo_vendas tp'
      'where tp.ativo = 1'
      'and tp.tipo in ('#39'REQ'#39', '#39'OS'#39')')
    Left = 1257
    Top = 658
  end
  object cdsRegraTipoVndOS: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRegraTipoVndOS'
    BeforeOpen = cdsFeriadoBeforeOpen
    Left = 1257
    Top = 745
    object cdsRegraTipoVndOSSIGLA: TStringField
      DisplayLabel = 'Tipo Vnd'
      FieldName = 'SIGLA'
      Size = 40
    end
    object cdsRegraTipoVndOSDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o Tipo Vnd'
      FieldName = 'DESCRICAO'
      Required = True
      Size = 40
    end
    object cdsRegraTipoVndOSTIPO: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Required = True
      FixedChar = True
      Size = 3
    end
    object cdsRegraTipoVndOSCOD_REGRAVND: TIntegerField
      DisplayLabel = 'Cod Regra'
      FieldName = 'COD_REGRAVND'
    end
  end
  object dsRegraTipoVndOS: TDataSource
    DataSet = cdsRegraTipoVndOS
    Left = 1258
    Top = 792
  end
  object dspRegraTipo: TDataSetProvider
    DataSet = qrRegraTipo
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1361
    Top = 703
  end
  object qrRegraTipo: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTRegrasVND
    SQL.Strings = (
      'select '#39'REQ'#39' tipo,'
      '(select distinct rt.cod_regravnd from regravnd_tipo rt'
      ' inner join regras_vendas rv on'
      ' rt.cod_regravnd = rv.cod_regravnd'
      ' and rt.cod_empresa = rv.cod_empresa'
      ' where rt.cod_regravnd = :COD_REGRAVND'
      ' and rt.cod_empresa = :codEmpresa'
      ' and rt.tipo = '#39'REQ'#39
      ') as cod_regravnd  from rdb$database')
    Left = 1361
    Top = 658
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'COD_REGRAVND'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'codEmpresa'
        ParamType = ptUnknown
      end>
  end
  object cdsRegraTipo: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRegraTipo'
    BeforeOpen = cdsFeriadoBeforeOpen
    Left = 1361
    Top = 745
    object cdsRegraTipoTIPO: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      FixedChar = True
      Size = 3
    end
    object cdsRegraTipoCOD_REGRAVND: TIntegerField
      DisplayLabel = 'Cod Regra'
      FieldName = 'COD_REGRAVND'
    end
  end
  object dsRegraTipo: TDataSource
    DataSet = cdsRegraTipo
    Left = 1362
    Top = 792
  end
  object dsEmpresaDefCondPag: TDataSource
    DataSet = cdsEmpresaDefCondPag
    Left = 796
    Top = 423
  end
  object cdsEmpresaDefCondPag: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEmpresaDefCondPag'
    BeforeOpen = CdsDepartamentosBeforeOpen
    Left = 796
    Top = 374
    object cdsEmpresaDefCondPagSEL: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'SEL'
    end
    object cdsEmpresaDefCondPagCOD_EMPRESA: TIntegerField
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsEmpresaDefCondPagIDENTIFICACAO_EMP: TStringField
      DisplayLabel = 'Empresa'
      FieldName = 'IDENTIFICACAO_EMP'
      Size = 64
    end
  end
  object dspEmpresaDefCondPag: TDataSetProvider
    DataSet = qrEmpresaDefCondPag
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 796
    Top = 323
  end
  object qrEmpresaDefCondPag: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransSenha
    SQL.Strings = (
      'select emp.cod_empresa,'
      
        'coalesce(emp.identificacao_emp, emp.nome_emp) identificacao_emp ' +
        'from empresa emp'
      'inner join cond_pag cond on 1 = 1'
      'where cond.cod_cond_pag = :cod_cond_pag')
    Left = 796
    Top = 274
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cod_cond_pag'
        ParamType = ptUnknown
      end>
  end
  object qrPContasTiposLancS: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransCadastroBasico
    SQL.Strings = (
      'select n_conta_plc, desc_plc from p_contas '
      'where ativo = 1 '
      'order by desc_plc')
    Left = 2469
    Top = 208
  end
  object dsPContasTiposLancS: TDataSource
    DataSet = cdsPContasTiposLancS
    Left = 2469
    Top = 362
  end
  object dspPContasTiposLancS: TDataSetProvider
    DataSet = qrPContasTiposLancS
    Constraints = False
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 2469
    Top = 255
  end
  object cdsPContasTiposLancS: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPContasTiposLancS'
    BeforeOpen = CdsDepartamentosBeforeOpen
    Left = 2469
    Top = 307
    object FloatField1: TFloatField
      FieldName = 'N_CONTA_PLC'
    end
    object StringField13: TStringField
      FieldName = 'DESC_PLC'
      Required = True
      FixedChar = True
      Size = 30
    end
  end
  object qrConciliacaoEmpAdq: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransCadastroBasico
    SQL.Strings = (
      'select conciliacao_estab_emp.*,'
      'conciliacao_adquirente.nome,'
      'empresa.identificacao_emp from conciliacao_estab_emp'
      'left join conciliacao_adquirente on'
      
        '    conciliacao_adquirente.id = conciliacao_estab_emp.id_adquire' +
        'nte'
      'left join empresa on'
      '    empresa.cod_empresa = conciliacao_estab_emp.cod_estab'
      'where conciliacao_adquirente.id > 0')
    Left = 2349
    Top = 432
  end
  object dsConciliacaoEmpAdq: TDataSource
    DataSet = cdsConciliacaoEmpAdq
    Left = 2349
    Top = 577
  end
  object dspConciliacaoEmpAdq: TDataSetProvider
    DataSet = qrConciliacaoEmpAdq
    Constraints = False
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 2349
    Top = 479
  end
  object cdsConciliacaoEmpAdq: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConciliacaoEmpAdq'
    BeforeOpen = CdsDepartamentosBeforeOpen
    Left = 2349
    Top = 528
    object cdsConciliacaoEmpAdqID_ADQUIRENTE: TIntegerField
      DisplayLabel = 'Id Adquirente'
      FieldName = 'ID_ADQUIRENTE'
      Required = True
    end
    object cdsConciliacaoEmpAdqCOD_EMPRESA: TIntegerField
      DisplayLabel = 'Cod Estabelecimento'
      FieldName = 'COD_ESTAB'
      Required = True
    end
    object cdsConciliacaoEmpAdqCODIGO: TStringField
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO'
      Required = True
    end
    object cdsConciliacaoEmpAdqNOME: TStringField
      DisplayLabel = 'Adquirente'
      FieldName = 'NOME'
      Size = 30
    end
    object cdsConciliacaoEmpAdqIDENTIFICACAO_EMP: TStringField
      DisplayLabel = 'Estabelecimento'
      FieldName = 'IDENTIFICACAO_EMP'
      Size = 64
    end
  end
  object qrConciliacaoAdq: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransCadastroBasico
    SQL.Strings = (
      'select adq.id, adq.nome from conciliacao_adquirente adq'
      'where ativo = 1')
    Left = 2477
    Top = 432
  end
  object dsConciliacaoAdq: TDataSource
    DataSet = cdsConciliacaoAdq
    Left = 2477
    Top = 577
  end
  object dspConciliacaoAdq: TDataSetProvider
    DataSet = qrConciliacaoAdq
    Constraints = False
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 2477
    Top = 479
  end
  object cdsConciliacaoAdq: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConciliacaoAdq'
    BeforeOpen = CdsDepartamentosBeforeOpen
    Left = 2477
    Top = 528
    object cdsConciliacaoAdqID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsConciliacaoAdqNOME: TStringField
      FieldName = 'NOME'
      Size = 30
    end
  end
  object qrConciliacaoEmp: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransCadastroBasico
    SQL.Strings = (
      'select cod_empresa, identificacao_emp from empresa'
      'where ativo = 1')
    Left = 2581
    Top = 432
  end
  object dsConciliacaoEmp: TDataSource
    DataSet = cdsConciliacaoEmp
    Left = 2581
    Top = 577
  end
  object dspConciliacaoEmp: TDataSetProvider
    DataSet = qrConciliacaoEmp
    Constraints = False
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 2581
    Top = 479
  end
  object cdsConciliacaoEmp: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConciliacaoEmp'
    BeforeOpen = CdsDepartamentosBeforeOpen
    Left = 2581
    Top = 528
    object cdsConciliacaoEmpCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsConciliacaoEmpIDENTIFICACAO_EMP: TStringField
      FieldName = 'IDENTIFICACAO_EMP'
      Size = 64
    end
  end
  object qrConciliacaoCodAjuste: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransCadastroBasico
    SQL.Strings = (
      
        'select conciliacao_cod_ajuste.*, p_contas_e.desc_plc as desc_plc' +
        '_e, p_contas_s.desc_plc as desc_plc_s from conciliacao_cod_ajust' +
        'e'
      
        'left join p_contas p_contas_e on p_contas_e.n_conta_plc = concil' +
        'iacao_cod_ajuste.n_conta_plc_e'
      
        'left join p_contas p_contas_s on p_contas_s.n_conta_plc = concil' +
        'iacao_cod_ajuste.n_conta_plc_s')
    Left = 2181
    Top = 432
  end
  object dsConciliacaoCodAjuste: TDataSource
    DataSet = cdsConciliacaoCodAjuste
    Left = 2181
    Top = 577
  end
  object dspConciliacaoCodAjuste: TDataSetProvider
    DataSet = qrConciliacaoCodAjuste
    Constraints = False
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 2181
    Top = 479
  end
  object cdsConciliacaoCodAjuste: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConciliacaoCodAjuste'
    BeforeOpen = CdsDepartamentosBeforeOpen
    Left = 2181
    Top = 528
    object StringField16: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'SEL'
      Size = 1
    end
    object IntegerField9: TIntegerField
      DisplayLabel = 'Id Ajuste'
      FieldName = 'ID'
      Required = True
    end
    object StringField18: TStringField
      DisplayLabel = 'Ajuste'
      FieldName = 'DESCRICAO'
      Size = 200
    end
    object StringField19: TStringField
      DisplayLabel = 'Tipo Ajuste'
      FieldName = 'TIPO'
    end
    object FloatField4: TFloatField
      DisplayLabel = 'Num Conta E'
      FieldName = 'N_CONTA_PLC_E'
    end
    object FloatField5: TFloatField
      DisplayLabel = 'Num Conta S'
      FieldName = 'N_CONTA_PLC_S'
    end
    object StringField20: TStringField
      DisplayLabel = 'Descricao Conta E'
      FieldName = 'DESC_PLC_E'
      FixedChar = True
      Size = 30
    end
    object StringField21: TStringField
      DisplayLabel = 'Descricao Conta S'
      FieldName = 'DESC_PLC_S'
      FixedChar = True
      Size = 30
    end
  end
  object qrPContasCodAjusteE: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransCadastroBasico
    SQL.Strings = (
      'select n_conta_plc, desc_plc from p_contas '
      'where ativo = 1 '
      'order by desc_plc')
    Left = 2069
    Top = 208
  end
  object dsPContasCodAjusteE: TDataSource
    DataSet = cdsPContasCodAjusteE
    Left = 2069
    Top = 362
  end
  object dspPContasCodAjusteE: TDataSetProvider
    DataSet = qrPContasCodAjusteE
    Constraints = False
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 2069
    Top = 263
  end
  object cdsPContasCodAjusteE: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPContasTiposLancE'
    BeforeOpen = CdsDepartamentosBeforeOpen
    Left = 2069
    Top = 315
    object FloatField2: TFloatField
      FieldName = 'N_CONTA_PLC'
    end
    object StringField14: TStringField
      FieldName = 'DESC_PLC'
      Required = True
      FixedChar = True
      Size = 30
    end
  end
  object qrPContasCodAjusteS: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransCadastroBasico
    SQL.Strings = (
      'select n_conta_plc, desc_plc from p_contas '
      'where ativo = 1 '
      'order by desc_plc')
    Left = 2197
    Top = 208
  end
  object dsPContasCodAjusteS: TDataSource
    DataSet = cdsPContasCodAjusteS
    Left = 2197
    Top = 362
  end
  object dspPContasCodAjusteS: TDataSetProvider
    DataSet = qrPContasCodAjusteS
    Constraints = False
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 2197
    Top = 263
  end
  object cdsPContasCodAjusteS: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPContasTiposLancS'
    BeforeOpen = CdsDepartamentosBeforeOpen
    Left = 2197
    Top = 307
    object FloatField3: TFloatField
      FieldName = 'N_CONTA_PLC'
    end
    object StringField15: TStringField
      FieldName = 'DESC_PLC'
      Required = True
      FixedChar = True
      Size = 30
    end
  end
  object qrPerfilHorasTrabalho: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransCadastroBasico
    SQL.Strings = (
      'select * from perfil_horas_trabalho')
    Left = 275
    Top = 1209
  end
  object dspPerfilHorasTrabalho: TDataSetProvider
    DataSet = qrPerfilHorasTrabalho
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 275
    Top = 1257
  end
  object cdsPerfilHorasTrabalho: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPerfilHorasTrabalho'
    BeforeOpen = CdsDepartamentosBeforeOpen
    Left = 275
    Top = 1308
    object cdsPerfilHorasTrabalhoCODIGO: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO'
      Required = True
    end
    object cdsPerfilHorasTrabalhoCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsPerfilHorasTrabalhoDESCRICAO: TStringField
      DisplayLabel = 'Descricao'
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object cdsPerfilHorasTrabalhoDATA_CAD: TDateTimeField
      DisplayLabel = 'Data Cadastro'
      FieldName = 'DATA_CAD'
    end
    object cdsPerfilHorasTrabalhoDATA_MOD: TDateTimeField
      DisplayLabel = 'Data Modificacao'
      FieldName = 'DATA_MOD'
    end
    object cdsPerfilHorasTrabalhoATIVO: TIntegerField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
  end
  object dsPerfilHorasTrabalho: TDataSource
    DataSet = cdsPerfilHorasTrabalho
    Left = 275
    Top = 1354
  end
  object qrPerfilHorasTrabalhoDia: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransCadastroBasico
    SQL.Strings = (
      'select * from perfil_horas_trabalho_dia')
    Left = 411
    Top = 1209
  end
  object dspPerfilHorasTrabalhoDia: TDataSetProvider
    DataSet = qrPerfilHorasTrabalhoDia
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 411
    Top = 1257
  end
  object cdsPerfilHorasTrabalhoDia: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPerfilHorasTrabalhoDia'
    BeforeOpen = CdsDepartamentosBeforeOpen
    Left = 411
    Top = 1308
    object cdsPerfilHorasTrabalhoDiaCODIGO: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO'
      Required = True
    end
    object cdsPerfilHorasTrabalhoDiaCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsPerfilHorasTrabalhoDiaDIA_SEMANA: TIntegerField
      DisplayLabel = 'Dia Semana'
      FieldName = 'DIA_SEMANA'
      Required = True
    end
    object cdsPerfilHorasTrabalhoDiaHORA_INI: TStringField
      DisplayLabel = 'Hora Ini'
      FieldName = 'HORA_INI'
      FixedChar = True
      Size = 2
    end
    object cdsPerfilHorasTrabalhoDiaMINUTO_INI: TStringField
      DisplayLabel = 'Minuto Ini'
      FieldName = 'MINUTO_INI'
      FixedChar = True
      Size = 2
    end
    object cdsPerfilHorasTrabalhoDiaHORA_FIM: TStringField
      DisplayLabel = 'Hora Fim'
      FieldName = 'HORA_FIM'
      FixedChar = True
      Size = 2
    end
    object cdsPerfilHorasTrabalhoDiaMINUTO_FIM: TStringField
      DisplayLabel = 'Minuto Fim'
      FieldName = 'MINUTO_FIM'
      FixedChar = True
      Size = 2
    end
  end
  object dsPerfilHorasTrabalhoDia: TDataSource
    DataSet = cdsPerfilHorasTrabalhoDia
    Left = 411
    Top = 1354
  end
  object qrPerfilHorasTrabalhoCons: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransCadastroBasico
    SQL.Strings = (
      
        'select CODIGO, COD_EMPRESA, DESCRICAO, ATIVO from perfil_horas_t' +
        'rabalho')
    Left = 555
    Top = 1201
  end
  object dspPerfilHorasTrabalhoCons: TDataSetProvider
    DataSet = qrPerfilHorasTrabalhoCons
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 555
    Top = 1249
  end
  object cdsPerfilHorasTrabalhoCons: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPerfilHorasTrabalhoCons'
    BeforeOpen = CdsDepartamentosBeforeOpen
    Left = 555
    Top = 1300
    object cdsPerfilHorasTrabalhoConsCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object cdsPerfilHorasTrabalhoConsCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsPerfilHorasTrabalhoConsDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object cdsPerfilHorasTrabalhoConsATIVO: TIntegerField
      FieldName = 'ATIVO'
    end
  end
  object dsPerfilHorasTrabalhoCons: TDataSource
    DataSet = cdsPerfilHorasTrabalhoCons
    Left = 555
    Top = 1346
  end
  object qrAplicativo: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransCadastroBasico
    SQL.Strings = (
      'select id, aplicativo from msg_aplicativo')
    Left = 675
    Top = 1201
  end
  object dspAplicativo: TDataSetProvider
    DataSet = qrAplicativo
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 675
    Top = 1249
  end
  object cdsAplicativo: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAplicativo'
    BeforeOpen = CdsDepartamentosBeforeOpen
    Left = 675
    Top = 1300
    object IntegerField10: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object StringField22: TStringField
      FieldName = 'APLICATIVO'
      Size = 50
    end
  end
  object dsAplicativo: TDataSource
    DataSet = cdsAplicativo
    Left = 675
    Top = 1346
  end
  object dspConsultaSql: TDataSetProvider
    DataSet = qrConsultaSql
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1473
    Top = 703
  end
  object qrConsultaSql: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTRegrasVND
    SQL.Strings = (
      'select * from consultas_sql')
    Left = 1473
    Top = 658
  end
  object cdsConsultaSql: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConsultaSql'
    BeforeOpen = cdsFeriadoBeforeOpen
    Left = 1473
    Top = 745
    object cdsConsultaSqlID: TStringField
      FieldName = 'ID'
      Required = True
      Size = 36
    end
  end
  object dsConsultaSql: TDataSource
    DataSet = cdsConsultaSql
    Left = 1474
    Top = 792
  end
end
