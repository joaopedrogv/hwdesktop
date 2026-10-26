object dtmImportPDVFinan: TdtmImportPDVFinan
  OldCreateOrder = False
  Height = 656
  Width = 1647
  object qrPDV: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      
        'select tf.cod_terminal, tf.nome_terminal, ti.num_serie_ecf, tf.e' +
        'nd_terminal from terminalf tf'
      
        'inner join terminal_impressoras ti on ti.cod_terminal = tf.cod_t' +
        'erminal and'
      'ti.cod_empresa = tf.cod_empresa and ti.atual = '#39'S'#39
      'order by tf.cod_terminal')
    Left = 29
    Top = 64
  end
  object dspPDV: TDataSetProvider
    DataSet = qrPDV
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 29
    Top = 112
  end
  object cdsPDV: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPDV'
    BeforeOpen = cdsPDVBeforeOpen
    Left = 29
    Top = 160
    object cdsPDVCOD_TERMINAL: TIntegerField
      DisplayLabel = 'Numero'
      FieldName = 'COD_TERMINAL'
      Required = True
    end
    object cdsPDVNOME_TERMINAL: TStringField
      DisplayLabel = 'Caixa'
      FieldName = 'NOME_TERMINAL'
      Required = True
      FixedChar = True
      Size = 30
    end
    object cdsPDVNUM_SERIE_ECF: TStringField
      FieldName = 'NUM_SERIE_ECF'
      Required = True
    end
    object cdsPDVEND_TERMINAL: TStringField
      FieldName = 'END_TERMINAL'
      Size = 100
    end
  end
  object dsPDV: TDataSource
    DataSet = cdsPDV
    Left = 29
    Top = 208
  end
  object SpIncCodigo: TIBStoredProc
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    StoredProcName = 'INCREMENTA_CODIGO'
    Left = 33
    Top = 9
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
    Left = 112
    Top = 8
  end
  object qrBuscas: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    Left = 184
    Top = 8
  end
  object qrSomaPDV: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select fc.finalizador, fi.descricao,'
      
        'sum( case when fc.tipo_doc = '#39'SAN'#39' then (fc.valor)   else 0 end ' +
        ') Sangria,'
      
        'sum( case when fc.tipo_doc = '#39'SUP'#39' then (fc.valor)   else 0 end ' +
        ') Suprimento,'
      
        'sum( case when fc.tipo_doc = '#39'REC'#39' then (fc.valor)   else 0 end ' +
        ') Prestacao,'
      
        'sum( case when fc.tipo_doc = '#39'CUP'#39' then (fc.valor)   else 0 end ' +
        ') Valor,'
      
        'sum( case when fc.tipo_doc = '#39'SAN'#39' then (-1 * fc.valor)   else f' +
        'c.valor end ) Total'
      'from fincupom fc'
      
        'inner join finalizadores fi on fi.cod_terminal = fc.cod_terminal' +
        ' and'
      
        'fi.nserieecf = fc.nserieecf and fi.cod_empresa = fc.cod_empresa ' +
        'and'
      'fi.cod_finalizador = fc.finalizador'
      
        'where fc.cod_terminal = :cod_terminal and fc.nserieecf = :nserie' +
        'ecf and'
      'fc.cod_empresa = :cod_empresa and fc.data = :data'
      'group by 1,2')
    Left = 109
    Top = 64
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cod_terminal'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nserieecf'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cod_empresa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'data'
        ParamType = ptUnknown
      end>
  end
  object dspSomaPDV: TDataSetProvider
    DataSet = qrSomaPDV
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 109
    Top = 112
  end
  object cdsSomaPDV: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSomaPDV'
    BeforeOpen = cdsPDVBeforeOpen
    Left = 109
    Top = 160
    object cdsSomaPDVFINALIZADOR: TIntegerField
      DisplayLabel = 'Fin'
      FieldName = 'FINALIZADOR'
    end
    object cdsSomaPDVDESCRICAO: TStringField
      DisplayLabel = 'Meio de Pagamento'
      FieldName = 'DESCRICAO'
      Size = 30
    end
    object cdsSomaPDVVALOR: TFloatField
      DisplayLabel = 'Cupons'
      FieldName = 'VALOR'
      DisplayFormat = '##0.00'
    end
    object cdsSomaPDVVALOR_INFORMADO: TFloatField
      DisplayLabel = 'Obtido'
      FieldKind = fkInternalCalc
      FieldName = 'VALOR_INFORMADO'
      DisplayFormat = '##0.00'
    end
    object cdsSomaPDVSANGRIA: TFloatField
      DisplayLabel = 'Sangria'
      FieldName = 'SANGRIA'
      DisplayFormat = '##0.00'
    end
    object cdsSomaPDVSUPRIMENTO: TFloatField
      DisplayLabel = 'Suprimento'
      FieldName = 'SUPRIMENTO'
      DisplayFormat = '##0.00'
    end
    object cdsSomaPDVPRESTACAO: TFloatField
      DisplayLabel = 'Presta'#231#227'o'
      FieldName = 'PRESTACAO'
      DisplayFormat = '##0.00'
    end
    object cdsSomaPDVTOTAL: TFloatField
      DisplayLabel = 'Total'
      FieldName = 'TOTAL'
      DisplayFormat = '##0.00'
    end
  end
  object dsSomaPDV: TDataSource
    DataSet = cdsSomaPDV
    Left = 109
    Top = 208
  end
  object qrMov: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select * from movimento_pdv_finan mf'
      'where mf.cod_terminal = :cod_terminal and'
      'mf.nserieecf = :nserieecf and'
      'mf.cod_empresa = :cod_empresa and'
      'mf.data_movimento = :data_movimento and'
      'mf.operador = :operador')
    Left = 181
    Top = 64
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cod_terminal'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nserieecf'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cod_empresa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'data_movimento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'operador'
        ParamType = ptUnknown
      end>
  end
  object dspMov: TDataSetProvider
    DataSet = qrMov
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 181
    Top = 112
  end
  object cdsMov: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspMov'
    BeforeOpen = cdsPDVBeforeOpen
    Left = 181
    Top = 160
    object cdsMovCOD_TERMINAL: TIntegerField
      FieldName = 'COD_TERMINAL'
      Required = True
    end
    object cdsMovNSERIEECF: TStringField
      FieldName = 'NSERIEECF'
      Required = True
    end
    object cdsMovCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsMovDATA_MOVIMENTO: TDateTimeField
      FieldName = 'DATA_MOVIMENTO'
      Required = True
    end
    object cdsMovOPERADOR: TIntegerField
      FieldName = 'OPERADOR'
      Required = True
    end
    object cdsMovTIPO_MOV: TStringField
      FieldName = 'TIPO_MOV'
      Required = True
      FixedChar = True
      Size = 3
    end
    object cdsMovCODIGO_TAB: TIntegerField
      FieldName = 'CODIGO_TAB'
      Required = True
    end
    object cdsMovDESCRICAO_TAB: TStringField
      FieldName = 'DESCRICAO_TAB'
      Size = 32
    end
    object cdsMovVALOR_OPERACAO: TFloatField
      FieldName = 'VALOR_OPERACAO'
    end
    object cdsMovDATA_LANCAMENTO: TDateTimeField
      FieldName = 'DATA_LANCAMENTO'
    end
  end
  object dsMov: TDataSource
    DataSet = cdsMov
    Left = 181
    Top = 208
  end
  object cdsFP: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 320
    Top = 8
    object cdsFPN_CONTA_PLC: TFloatField
      DisplayLabel = 'Num Plano Contas'
      FieldName = 'N_CONTA_PLC'
    end
    object cdsFPTPDOCS: TStringField
      DisplayLabel = 'DOC'
      FieldName = 'TPDOCS'
      Size = 6
    end
    object cdsFPTIPDOC: TStringField
      DisplayLabel = 'Ctrl'
      FieldName = 'TIPDOC'
      Size = 2
    end
    object cdsFPVALORDOC: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VALORDOC'
      DisplayFormat = '##0.00'
    end
    object cdsFPHISTORICO: TStringField
      DisplayLabel = 'Hist'#243'rico'
      FieldName = 'HISTORICO'
      Size = 80
    end
    object cdsFPNREQUISICAO: TIntegerField
      DisplayLabel = 'Cupom'
      FieldName = 'NREQUISICAO'
    end
    object cdsFPCOD_CONTROLE: TIntegerField
      DisplayLabel = 'Controle'
      FieldName = 'COD_CONTROLE'
    end
    object cdsFPNDOC: TStringField
      DisplayLabel = 'Num Doc'
      FieldName = 'NDOC'
    end
    object cdsFPTIP_CNT: TStringField
      DisplayLabel = 'Cnt'
      FieldName = 'TIP_CNT'
      Size = 1
    end
    object cdsFPCLIENTE: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
      Size = 60
    end
    object cdsFPDATA_VENC: TDateField
      DisplayLabel = 'Data Vencimento'
      FieldName = 'DATA_VENC'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsFPAGENCIA: TStringField
      DisplayLabel = 'Agencia'
      FieldName = 'AGENCIA'
      Size = 10
    end
    object cdsFPCONTA: TStringField
      DisplayLabel = 'Conta'
      FieldName = 'CONTA'
      Size = 15
    end
    object cdsFPBANCO: TStringField
      DisplayLabel = 'Banco'
      FieldName = 'BANCO'
      Size = 35
    end
    object cdsFPCOD_CLI_TERC: TIntegerField
      DisplayLabel = 'Cod Terc'
      FieldName = 'COD_CLI_TERC'
    end
    object cdsFPTERCEIROS: TStringField
      DisplayLabel = 'Terceiro'
      FieldName = 'TERCEIROS'
      Size = 80
    end
    object cdsFPOPERADOR: TIntegerField
      DisplayLabel = 'Operador'
      FieldName = 'OPERADOR'
    end
    object cdsFPDATA_MOV: TDateField
      DisplayLabel = 'Data Movimento'
      FieldName = 'DATA_MOV'
    end
    object cdsFPCOD_CLIENTE: TIntegerField
      DisplayLabel = 'Cod Cliente'
      FieldName = 'COD_CLIENTE'
    end
    object cdsFPN_AUT_CART: TStringField
      DisplayLabel = 'Num Aut Cart'#227'o'
      FieldName = 'N_AUT_CART'
    end
    object cdsFPCOD_BANCO: TIntegerField
      DisplayLabel = 'Num Banco'
      FieldName = 'COD_BANCO'
    end
    object cdsFPFINALIZADOR: TIntegerField
      DisplayLabel = 'Finalizador'
      FieldName = 'FINALIZADOR'
    end
    object cdsFPN_PROCESSAMENTO: TIntegerField
      DisplayLabel = 'Num Processamento'
      FieldName = 'N_PROCESSAMENTO'
    end
    object cdsFPCOD_BANCO_STR: TStringField
      DisplayLabel = 'Cod Banco'
      FieldName = 'COD_BANCO_STR'
      Size = 11
    end
    object cdsFPN_DOCNSU_ADM: TStringField
      DisplayLabel = 'Num Doc Adm(NSU)'
      FieldName = 'N_DOCNSU_ADM'
      Size = 10
    end
    object cdsFPCOD_TERMINAL_ADM: TStringField
      DisplayLabel = 'Cod Terminal Cart'#227'o'
      FieldName = 'COD_TERMINAL_ADM'
      Size = 10
    end
    object cdsFPDESC_TERMINAL_ADM: TStringField
      FieldName = 'DESC_TERMINAL_ADM'
      Size = 30
    end
    object cdsFPNPARCELA: TIntegerField
      DisplayLabel = 'Num Parc'
      FieldName = 'NPARCELA'
    end
    object cdsFPQTDE_PARC: TIntegerField
      DisplayLabel = 'Qtde Parc'
      FieldName = 'QTDE_PARC'
    end
    object cdsFPDEB_CRED: TStringField
      DisplayLabel = 'Deb Cred'
      FieldName = 'DEB_CRED'
      Size = 1
    end
    object cdsFPCOD_BANDEIRA_ADM: TIntegerField
      DisplayLabel = 'Cod Bandeira Adm'
      FieldName = 'COD_BANDEIRA_ADM'
    end
    object cdsFPDESC_BANDEIRA: TStringField
      DisplayLabel = 'Bandeira Adm'
      FieldName = 'DESC_BANDEIRA'
      Size = 50
    end
    object cdsFPVALORDOC_LIQ: TFloatField
      FieldName = 'VALORDOC_LIQ'
    end
  end
  object dsFP: TDataSource
    DataSet = cdsFP
    Left = 376
    Top = 8
  end
  object cdsCons: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 448
    Top = 8
    object cdsConsCOD_CONTROLE: TIntegerField
      DisplayLabel = 'Numero'
      FieldName = 'COD_CONTROLE'
    end
    object cdsConsNOME_CTRL: TStringField
      DisplayLabel = 'Controle'
      FieldName = 'NOME_CTRL'
      Size = 35
    end
    object cdsConsVALOR: TFloatField
      DisplayLabel = 'Soma'
      FieldName = 'VALOR'
      DisplayFormat = '##0.00'
    end
  end
  object dsCons: TDataSource
    DataSet = cdsCons
    Left = 504
    Top = 8
  end
  object qrCtrl: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      
        'select ct.codigo_ctrl, ct.nome_ctrl, ct.tp_plano, ct.cod_finaliz' +
        'ador, ct.docs, ct.taxa_cartao from controles ct'
      'where ct.codigo_emp = :cod_empresa')
    Left = 253
    Top = 64
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cod_empresa'
        ParamType = ptUnknown
      end>
  end
  object dspCtrl: TDataSetProvider
    DataSet = qrCtrl
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 253
    Top = 112
  end
  object cdsCtrl: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCtrl'
    BeforeOpen = cdsPDVBeforeOpen
    Left = 253
    Top = 160
    object cdsCtrlCODIGO_CTRL: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO_CTRL'
      Required = True
    end
    object cdsCtrlNOME_CTRL: TStringField
      DisplayLabel = 'Controle'
      FieldName = 'NOME_CTRL'
      Size = 35
    end
    object cdsCtrlTP_PLANO: TStringField
      DisplayLabel = 'Plano'
      FieldName = 'TP_PLANO'
      FixedChar = True
      Size = 1
    end
    object cdsCtrlCOD_FINALIZADOR: TIntegerField
      DisplayLabel = 'Finalizador ECF'
      FieldName = 'COD_FINALIZADOR'
    end
    object cdsCtrlDOCS: TStringField
      DisplayLabel = 'TP'
      FieldName = 'DOCS'
      FixedChar = True
      Size = 2
    end
    object cdsCtrlTAXA_CARTAO: TFloatField
      DisplayLabel = 'Taxa Cart'#227'o'
      FieldName = 'TAXA_CARTAO'
    end
    object cdsCtrlNAO_GERA_FINAN: TStringField
      DisplayLabel = 'N'#227'o Gerar Financeiro'
      FieldName = 'NAO_GERA_FINAN'
      Size = 1
    end
    object cdsCtrlBAIXA_AUTOMATICA: TStringField
      DisplayLabel = 'Baixa Autom'#225'tica'
      FieldName = 'BAIXA_AUTOMATICA'
      Size = 1
    end
    object cdsCtrlN_CONTA_BX_AUTO: TFloatField
      DisplayLabel = 'Num Conta Plc Baixa Automatica'
      FieldName = 'N_CONTA_BX_AUTO'
    end
  end
  object dsCtrl: TDataSource
    DataSet = cdsCtrl
    Left = 253
    Top = 208
  end
  object qrBuscas2: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    Left = 240
    Top = 8
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
    OpcoesPreview.Preview = False
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
    TamanhoQteColunas = 80
    TamanhoQteLPP = Seis
    NumerodeCopias = 1
    FonteTamanhoPadrao = S10cpp
    FonteEstiloPadrao = []
    Orientacao = poPortrait
    Left = 592
    Top = 8
  end
  object qrControleBanco: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select * from controles where CONTR_BANC = '#39'S'#39' and DOCS = '#39'N'#39)
    Left = 496
    Top = 56
  end
  object dsControleBanco: TDataSource
    DataSet = cdsControleBanco
    Left = 493
    Top = 208
  end
  object qrCobreBem: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select * from cobrebem')
    Left = 328
    Top = 64
  end
  object dsCobrebem: TDataSource
    DataSet = cdsCobrebem
    Left = 333
    Top = 208
  end
  object dspCobrebem: TDataSetProvider
    DataSet = qrCobreBem
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 333
    Top = 112
  end
  object cdsCobrebem: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCobrebem'
    BeforeOpen = cdsPDVBeforeOpen
    Left = 333
    Top = 160
    object cdsCobrebemCOD_COBREBEM: TIntegerField
      FieldName = 'COD_COBREBEM'
      Required = True
    end
    object cdsCobrebemCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsCobrebemCODIGO_CTRL: TIntegerField
      FieldName = 'CODIGO_CTRL'
    end
    object cdsCobrebemBANCO: TStringField
      FieldName = 'BANCO'
      FixedChar = True
      Size = 3
    end
    object cdsCobrebemCODIGOAGENCIA: TStringField
      FieldName = 'CODIGOAGENCIA'
    end
    object cdsCobrebemNUMEROCONTACORRENTE: TStringField
      FieldName = 'NUMEROCONTACORRENTE'
    end
    object cdsCobrebemCODIGOCEDENTE: TStringField
      FieldName = 'CODIGOCEDENTE'
    end
    object cdsCobrebemINICIONOSSONUMERO: TStringField
      FieldName = 'INICIONOSSONUMERO'
    end
    object cdsCobrebemFIMNOSSONUMERO: TStringField
      FieldName = 'FIMNOSSONUMERO'
    end
    object cdsCobrebemPROXIMONOSSONUMERO: TStringField
      FieldName = 'PROXIMONOSSONUMERO'
    end
    object cdsCobrebemTIPODOCUMENTOCOBRANCA: TStringField
      FieldName = 'TIPODOCUMENTOCOBRANCA'
      Size = 10
    end
    object cdsCobrebemLAYOUTARQUIVOREMESSA: TStringField
      FieldName = 'LAYOUTARQUIVOREMESSA'
    end
    object cdsCobrebemLAYOUTARQUIVORETORNO: TStringField
      FieldName = 'LAYOUTARQUIVORETORNO'
    end
    object cdsCobrebemLAYOUTBOLETOIMPRESSO: TStringField
      FieldName = 'LAYOUTBOLETOIMPRESSO'
      Size = 30
    end
    object cdsCobrebemLAYOUTBOLETOSEMAIL: TStringField
      FieldName = 'LAYOUTBOLETOSEMAIL'
      Size = 30
    end
    object cdsCobrebemHTMLBOLETO: TMemoField
      FieldName = 'HTMLBOLETO'
      BlobType = ftMemo
      Size = 8
    end
    object cdsCobrebemHTMLBOLETOEMAIL: TMemoField
      FieldName = 'HTMLBOLETOEMAIL'
      BlobType = ftMemo
      Size = 8
    end
    object cdsCobrebemOUTRODADOCONFIGURACAO1: TStringField
      FieldName = 'OUTRODADOCONFIGURACAO1'
    end
    object cdsCobrebemOUTRODADOCONFIGURACAO2: TStringField
      FieldName = 'OUTRODADOCONFIGURACAO2'
    end
    object cdsCobrebemARQUIVOLICENCA: TStringField
      FieldName = 'ARQUIVOLICENCA'
      Size = 128
    end
    object cdsCobrebemIMAGENSBOLETO: TStringField
      FieldName = 'IMAGENSBOLETO'
      Size = 128
    end
    object cdsCobrebemIMAGENSLOGOTIPO: TStringField
      FieldName = 'IMAGENSLOGOTIPO'
      Size = 128
    end
    object cdsCobrebemIDENTIFICACAOCEDENTE: TStringField
      FieldName = 'IDENTIFICACAOCEDENTE'
      Size = 64
    end
    object cdsCobrebemIDENTIFICACAOCEDENTE1: TStringField
      FieldName = 'IDENTIFICACAOCEDENTE1'
      Size = 64
    end
    object cdsCobrebemENDERECOREMESSARETORNO: TStringField
      FieldName = 'ENDERECOREMESSARETORNO'
      Size = 128
    end
    object cdsCobrebemEMAIL_ENDERECOCEDENTE: TStringField
      FieldName = 'EMAIL_ENDERECOCEDENTE'
      Size = 64
    end
    object cdsCobrebemEMAIL_URLIMAGENSBOLETO: TStringField
      FieldName = 'EMAIL_URLIMAGENSBOLETO'
      Size = 256
    end
    object cdsCobrebemEMAIL_URLIMAGENSLOGOTIPO: TStringField
      FieldName = 'EMAIL_URLIMAGENSLOGOTIPO'
      Size = 256
    end
    object cdsCobrebemEMAIL_SMTP_SERVIDOR: TStringField
      FieldName = 'EMAIL_SMTP_SERVIDOR'
      Size = 128
    end
    object cdsCobrebemEMAIL_SMTP_PORTA: TIntegerField
      FieldName = 'EMAIL_SMTP_PORTA'
    end
    object cdsCobrebemEMAIL_SMTP_USUARIO: TStringField
      FieldName = 'EMAIL_SMTP_USUARIO'
      Size = 32
    end
    object cdsCobrebemEMAIL_SMTP_SENHA: TStringField
      FieldName = 'EMAIL_SMTP_SENHA'
      Size = 32
    end
    object cdsCobrebemEMAIL_ASSUNTO: TStringField
      FieldName = 'EMAIL_ASSUNTO'
      Size = 64
    end
    object cdsCobrebemSEQUENCIA_REMESSA: TIntegerField
      FieldName = 'SEQUENCIA_REMESSA'
    end
    object cdsCobrebemQTDEDIGNOSSONUMERO: TSmallintField
      FieldName = 'QTDEDIGNOSSONUMERO'
    end
    object cdsCobrebemDIASPROTESTO: TSmallintField
      FieldName = 'DIASPROTESTO'
    end
    object cdsCobrebemATIVO: TIntegerField
      FieldName = 'ATIVO'
    end
    object cdsCobrebemCODIGO_BAIXA: TStringField
      FieldName = 'CODIGO_BAIXA'
    end
    object cdsCobrebemCODIGO_RECUSA: TStringField
      FieldName = 'CODIGO_RECUSA'
    end
    object cdsCobrebemDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object cdsCobrebemCODIGO_CTRL_ENT: TIntegerField
      FieldName = 'CODIGO_CTRL_ENT'
    end
    object cdsCobrebemDESCONS_DIGVERIF: TStringField
      FieldName = 'DESCONS_DIGVERIF'
      FixedChar = True
      Size = 1
    end
    object cdsCobrebemOUTRAS_CONFIG_BOL: TMemoField
      FieldName = 'OUTRAS_CONFIG_BOL'
      BlobType = ftMemo
      Size = 8
    end
    object cdsCobrebemLICENCA: TMemoField
      Tag = 1
      FieldName = 'LICENCA'
      BlobType = ftMemo
      Size = 8
    end
    object cdsCobrebemLOGOTIPO: TMemoField
      Tag = 1
      FieldName = 'LOGOTIPO'
      BlobType = ftMemo
      Size = 8
    end
    object cdsCobrebemLOGOBANCO: TMemoField
      Tag = 1
      FieldName = 'LOGOBANCO'
      BlobType = ftMemo
      Size = 8
    end
    object cdsCobrebemCODBARRAS_A: TMemoField
      Tag = 1
      FieldName = 'CODBARRAS_A'
      BlobType = ftMemo
      Size = 8
    end
    object cdsCobrebemCODBARRAS_B: TMemoField
      Tag = 1
      FieldName = 'CODBARRAS_B'
      BlobType = ftMemo
      Size = 8
    end
    object cdsCobrebemCODBARRAS_C: TMemoField
      Tag = 1
      FieldName = 'CODBARRAS_C'
      BlobType = ftMemo
      Size = 8
    end
    object cdsCobrebemCODBARRAS_D: TMemoField
      Tag = 1
      FieldName = 'CODBARRAS_D'
      BlobType = ftMemo
      Size = 8
    end
    object cdsCobrebemTIPO_API: TStringField
      Tag = 1
      FieldName = 'TIPO_API'
      FixedChar = True
      Size = 1
    end
    object cdsCobrebemLICENCA_GENERICA: TStringField
      FieldName = 'LICENCA_GENERICA'
      FixedChar = True
      Size = 1
    end
    object cdsCobrebemNOME_EMP_GENERICO: TStringField
      FieldName = 'NOME_EMP_GENERICO'
      Size = 50
    end
    object cdsCobrebemCPF_CNPJ_GENERICO: TStringField
      FieldName = 'CPF_CNPJ_GENERICO'
      Size = 18
    end
  end
  object qrControleCreditos: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select * from controle_creditos')
    Left = 415
    Top = 78
  end
  object dsControleCreditos: TDataSource
    DataSet = cdsControleCreditos
    Left = 412
    Top = 222
  end
  object dspControleCreditos: TDataSetProvider
    DataSet = qrControleCreditos
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    OnGetTableName = dspControleCreditosGetTableName
    Left = 412
    Top = 126
  end
  object cdsControleCreditos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspControleCreditos'
    BeforeOpen = cdsPDVBeforeOpen
    Left = 412
    Top = 174
    object cdsControleCreditosCOD_CRED: TIntegerField
      DisplayLabel = 'C'#243'digo do cr'#233'dito'
      FieldName = 'COD_CRED'
      Required = True
    end
    object cdsControleCreditosCOD_CLIENTE: TIntegerField
      DisplayLabel = 'C'#243'digo do cliente'
      FieldName = 'COD_CLIENTE'
    end
    object cdsControleCreditosNOME_C: TStringField
      DisplayLabel = 'Nome do cliente'
      FieldName = 'NOME_C'
      Size = 35
    end
    object cdsControleCreditosRAZAO: TStringField
      DisplayLabel = 'Raz'#227'o Social'
      FieldName = 'RAZAO'
      Size = 60
    end
    object cdsControleCreditosN_SEQ_BOL: TIntegerField
      DisplayLabel = 'N'#250'mero de sequencia do boleto'
      FieldName = 'N_SEQ_BOL'
    end
    object cdsControleCreditosN_CONTA_PLC: TFloatField
      DisplayLabel = 'N'#250'mero da conta'
      FieldName = 'N_CONTA_PLC'
    end
    object cdsControleCreditosCODIGO_CTRL: TIntegerField
      DisplayLabel = 'C'#243'digo do controlre gerado'
      FieldName = 'CODIGO_CTRL'
      Required = True
    end
    object cdsControleCreditosN_DUPL_C: TIntegerField
      FieldName = 'N_DUPL_C'
    end
    object cdsControleCreditosDATA_REC_C: TDateTimeField
      DisplayLabel = 'Data cr'#233'dito movimenta'#231#227'o caixa'
      FieldName = 'DATA_REC_C'
    end
    object cdsControleCreditosTIPO_DOC_C: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO_DOC_C'
      FixedChar = True
      Size = 15
    end
    object cdsControleCreditosHISTORICO_C: TStringField
      DisplayLabel = 'Hist'#243'rico'
      FieldName = 'HISTORICO_C'
      Size = 100
    end
    object cdsControleCreditosDATA_VENC_C: TDateTimeField
      DisplayLabel = 'Data de vencimento'
      FieldName = 'DATA_VENC_C'
    end
    object cdsControleCreditosVALOR_C: TFloatField
      DisplayLabel = 'Valor cr'#233'dito'
      FieldName = 'VALOR_C'
    end
    object cdsControleCreditosSTATUS_C: TStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS_C'
      FixedChar = True
      Size = 10
    end
    object cdsControleCreditosDATQ_C: TDateTimeField
      DisplayLabel = 'Data quita'#231#227'o movimenta'#231#227'o financeiro'
      FieldName = 'DATQ_C'
    end
    object cdsControleCreditosNATL_C: TStringField
      FieldName = 'NATL_C'
      FixedChar = True
      Size = 1
    end
    object cdsControleCreditosLOTE: TIntegerField
      DisplayLabel = 'C'#243'digo lote contas a pagar'
      FieldName = 'LOTE'
    end
    object cdsControleCreditosOBS_C: TStringField
      DisplayLabel = 'Observa'#231#245'es baixa'
      FieldName = 'OBS_C'
      Size = 60
    end
    object cdsControleCreditosTP_DOC_V: TStringField
      DisplayLabel = 'Tipo de venda'
      FieldName = 'TP_DOC_V'
      FixedChar = True
      Size = 6
    end
    object cdsControleCreditosN_DOC_V: TIntegerField
      DisplayLabel = 'C'#243'digo de venda'
      FieldName = 'N_DOC_V'
    end
    object cdsControleCreditosN_DOC_C: TStringField
      DisplayLabel = 'N'#250'mero do documento'
      FieldName = 'N_DOC_C'
      FixedChar = True
    end
    object cdsControleCreditosDATA_RETORNO_QUITACAO: TDateTimeField
      DisplayLabel = 'Data de quita'#231#227'o pelo arquivo de retorno'
      FieldName = 'DATA_RETORNO_QUITACAO'
    end
    object cdsControleCreditosSELEC: TStringField
      FieldName = 'SELEC'
      FixedChar = True
      Size = 1
    end
    object cdsControleCreditosCOD_CLI_TERC: TIntegerField
      DisplayLabel = 'C'#243'digo cliente terceiro'
      FieldName = 'COD_CLI_TERC'
    end
    object cdsControleCreditosNOME_TERC: TStringField
      DisplayLabel = 'Nome cliente terceiro'
      FieldName = 'NOME_TERC'
      Size = 35
    end
    object cdsControleCreditosTIP_CNT: TStringField
      FieldName = 'TIP_CNT'
      FixedChar = True
      Size = 1
    end
    object cdsControleCreditosDATA_CXL: TDateTimeField
      DisplayLabel = 'Data do caixa'
      FieldName = 'DATA_CXL'
    end
    object cdsControleCreditosCODIGO_VEND: TIntegerField
      DisplayLabel = 'C'#243'digo do vendedor'
      FieldName = 'CODIGO_VEND'
    end
    object cdsControleCreditosTIP_BAIXA: TStringField
      DisplayLabel = 'Tipo de baixa'
      FieldName = 'TIP_BAIXA'
      FixedChar = True
      Size = 1
    end
    object cdsControleCreditosDATA_REM_REC: TDateTimeField
      DisplayLabel = 'Data da remessa ou processamento'
      FieldName = 'DATA_REM_REC'
    end
    object cdsControleCreditosCOD_TERM: TIntegerField
      DisplayLabel = 'C'#243'digo do terminal ECF'
      FieldName = 'COD_TERM'
    end
    object cdsControleCreditosDATA_BAIXA: TDateTimeField
      DisplayLabel = 'Data da baixa pelo financeiro'
      FieldName = 'DATA_BAIXA'
    end
    object cdsControleCreditosDATA_VENDA: TDateTimeField
      DisplayLabel = 'Data da venda'
      FieldName = 'DATA_VENDA'
    end
    object cdsControleCreditosVALOR_CORR: TFloatField
      DisplayLabel = 'Valor corrigido'
      FieldName = 'VALOR_CORR'
    end
    object cdsControleCreditosCODIGO_FUNC: TIntegerField
      DisplayLabel = 'C'#243'digo do colaborador'
      FieldName = 'CODIGO_FUNC'
    end
    object cdsControleCreditosLOTE_QUIT: TIntegerField
      DisplayLabel = 'Lote de quita'#231#227'o'
      FieldName = 'LOTE_QUIT'
    end
    object cdsControleCreditosVALOR_DESC: TFloatField
      DisplayLabel = 'Valor dos descontos'
      FieldName = 'VALOR_DESC'
    end
    object cdsControleCreditosVALOR_ACRESC: TFloatField
      DisplayLabel = 'Valor dos acrescimom'
      FieldName = 'VALOR_ACRESC'
    end
    object cdsControleCreditosLOTE_ENT: TIntegerField
      DisplayLabel = 'Lote de entrada'
      FieldName = 'LOTE_ENT'
    end
    object cdsControleCreditosDIA_CXL: TDateTimeField
      DisplayLabel = 'Dia movienta'#231#227'o caixa auxiliar'
      FieldName = 'DIA_CXL'
    end
    object cdsControleCreditosSTATUS_CXL_RQ: TStringField
      DisplayLabel = 'Status caixa auxiliar'
      FieldName = 'STATUS_CXL_RQ'
      FixedChar = True
      Size = 1
    end
    object cdsControleCreditosVL_RQ_PG_CXL: TFloatField
      DisplayLabel = 'Valor recebido caixa auxiliar'
      FieldName = 'VL_RQ_PG_CXL'
    end
    object cdsControleCreditosOP_CXL: TIntegerField
      DisplayLabel = 'Operador do caixa auxiliar'
      FieldName = 'OP_CXL'
    end
    object cdsControleCreditosCPFCGC: TStringField
      DisplayLabel = 'CPF do cliente'
      FieldName = 'CPFCGC'
      FixedChar = True
      Size = 18
    end
    object cdsControleCreditosLOTE_CXL: TIntegerField
      DisplayLabel = 'Lote caixa auxiliar'
      FieldName = 'LOTE_CXL'
    end
    object cdsControleCreditosTP_REC_CXL: TStringField
      DisplayLabel = 'Tipo recebimento caixa auxiliar'
      FieldName = 'TP_REC_CXL'
      FixedChar = True
      Size = 1
    end
    object cdsControleCreditosPRCSS: TStringField
      DisplayLabel = 'Processamento de baixa pelo caixa auxiliar'
      FieldName = 'PRCSS'
      FixedChar = True
      Size = 1
    end
    object cdsControleCreditosJUROS_COB: TFloatField
      DisplayLabel = 'Juros cobrados no pagamento'
      FieldName = 'JUROS_COB'
    end
    object cdsControleCreditosCOD_IT_CARTAS: TIntegerField
      DisplayLabel = 'C'#243'digo do item de cartas'
      FieldName = 'COD_IT_CARTAS'
    end
    object cdsControleCreditosDT_REG_CARTAS: TDateTimeField
      DisplayLabel = 'Data do envio de cartas'
      FieldName = 'DT_REG_CARTAS'
    end
    object cdsControleCreditosCOD_CARTA: TIntegerField
      DisplayLabel = 'C'#243'digo da carta'
      FieldName = 'COD_CARTA'
    end
    object cdsControleCreditosN_AUT_CART: TStringField
      DisplayLabel = 'N'#250'mero da autoriza'#231#227'o do cart'#227'o'
      FieldName = 'N_AUT_CART'
      FixedChar = True
    end
    object cdsControleCreditosCOD_FATURAMENTO: TIntegerField
      DisplayLabel = 'C'#243'digo do faturamento'
      FieldName = 'COD_FATURAMENTO'
    end
    object cdsControleCreditosLOTE_NEG: TIntegerField
      DisplayLabel = 'Lote de negativa'#231#227'o'
      FieldName = 'LOTE_NEG'
    end
    object cdsControleCreditosDATA_LOTE_NEG: TDateTimeField
      DisplayLabel = 'Data lote de negativa'#231#227'o'
      FieldName = 'DATA_LOTE_NEG'
    end
    object cdsControleCreditosCODIGO_EMP: TIntegerField
      DisplayLabel = 'C'#243'digo da empresa'
      FieldName = 'CODIGO_EMP'
      Required = True
    end
    object cdsControleCreditosCOD_EMP_MULT: TIntegerField
      DisplayLabel = 'C'#243'digo da empresa multiloja'
      FieldName = 'COD_EMP_MULT'
    end
    object cdsControleCreditosNUM_NOTA: TIntegerField
      FieldName = 'NUM_NOTA'
    end
    object cdsControleCreditosNREQ: TIntegerField
      FieldName = 'NREQ'
    end
    object cdsControleCreditosN_OS: TIntegerField
      FieldName = 'N_OS'
    end
    object cdsControleCreditosNCOMANDO: TIntegerField
      FieldName = 'NCOMANDO'
    end
    object cdsControleCreditosNGRP: TIntegerField
      FieldName = 'NGRP'
    end
    object cdsControleCreditosCOONAOFISCAL: TIntegerField
      FieldName = 'COONAOFISCAL'
    end
    object cdsControleCreditosNOSSO_NUMERO_BANCO: TStringField
      DisplayLabel = 'Nosso N'#250'mero'
      FieldName = 'NOSSO_NUMERO_BANCO'
    end
    object cdsControleCreditosTAXA_COBRANCA: TFloatField
      DisplayLabel = 'Taxa de cobran'#231'a'
      FieldName = 'TAXA_COBRANCA'
    end
    object cdsControleCreditosUS_CANCELOU: TStringField
      DisplayLabel = 'C'#243'digo usu'#225'rio cancelamento do recebimento'
      FieldName = 'US_CANCELOU'
      Size = 10
    end
    object cdsControleCreditosDT_US_CANCELOU: TDateTimeField
      DisplayLabel = 'Data usu'#225'rio cancelamento do recebimento'
      FieldName = 'DT_US_CANCELOU'
    end
    object cdsControleCreditosOBS_PARACREDITO: TStringField
      DisplayLabel = 'Observa'#231#245'es do recebimento'
      FieldName = 'OBS_PARACREDITO'
      Size = 50
    end
    object cdsControleCreditosDTORIGINAL_C: TDateTimeField
      DisplayLabel = 'Data original'
      FieldName = 'DTORIGINAL_C'
    end
    object cdsControleCreditosDATA_PREV_REC: TDateTimeField
      FieldName = 'DATA_PREV_REC'
    end
    object cdsControleCreditosDEPENDENTE: TStringField
      DisplayLabel = 'Nome do dependente'
      FieldName = 'DEPENDENTE'
      Size = 35
    end
    object cdsControleCreditosNSERIEECF: TStringField
      FieldName = 'NSERIEECF'
    end
    object cdsControleCreditosCOD_TERMINAL: TIntegerField
      FieldName = 'COD_TERMINAL'
    end
    object cdsControleCreditosCOD_COBREBEM: TIntegerField
      DisplayLabel = 'C'#243'digo Cobrebem'
      FieldName = 'COD_COBREBEM'
    end
    object cdsControleCreditosOCORRENCIABANCARIA: TMemoField
      DisplayLabel = 'Informa'#231#227'o banc'#225'ria'
      FieldName = 'OCORRENCIABANCARIA'
      BlobType = ftMemo
      Size = 8
    end
    object cdsControleCreditosVALOR_LIQUIDO: TFloatField
      DisplayLabel = 'Valor L'#237'quido'
      FieldName = 'VALOR_LIQUIDO'
      DisplayFormat = '##0.00'
    end
    object cdsControleCreditosVL_BAIXA_COMISSAO: TFloatField
      FieldName = 'VL_BAIXA_COMISSAO'
    end
    object cdsControleCreditosVL_BAIXA_COMISSAO_GER: TFloatField
      FieldName = 'VL_BAIXA_COMISSAO_GER'
    end
    object cdsControleCreditosUS_CAD: TIntegerField
      FieldName = 'US_CAD'
    end
    object cdsControleCreditosNPARCELA: TIntegerField
      FieldName = 'NPARCELA'
    end
    object cdsControleCreditosN_DOCNSU_ADM: TStringField
      FieldName = 'N_DOCNSU_ADM'
      Size = 10
    end
    object cdsControleCreditosCOD_TERMINAL_ADM: TStringField
      FieldName = 'COD_TERMINAL_ADM'
      Size = 10
    end
    object cdsControleCreditosDESC_TERMINAL_ADM: TStringField
      FieldName = 'DESC_TERMINAL_ADM'
      Size = 30
    end
    object cdsControleCreditosCOD_ADM: TIntegerField
      FieldName = 'COD_ADM'
    end
    object cdsControleCreditosDESC_ADM: TStringField
      FieldName = 'DESC_ADM'
      Size = 30
    end
    object cdsControleCreditosCOD_BANDEIRA_ADM: TIntegerField
      DisplayLabel = 'Cod Bandeira'
      FieldName = 'COD_BANDEIRA_ADM'
    end
    object cdsControleCreditosDESC_BANDEIRA: TStringField
      DisplayLabel = 'Bandeira'
      FieldName = 'DESC_BANDEIRA'
      Size = 50
    end
    object cdsControleCreditosUS_BX: TIntegerField
      FieldName = 'US_BX'
    end
    object cdsControleCreditosVL_CONTABIL: TFloatField
      FieldName = 'VL_CONTABIL'
    end
    object cdsControleCreditosCOD_CONTRAPARTIDA: TIntegerField
      DisplayLabel = 'Lote Contrapartida Lanc'
      FieldName = 'COD_CONTRAPARTIDA'
    end
    object cdsControleCreditosCOD_CONTRAPARTIDA_CTP: TIntegerField
      DisplayLabel = 'Lote Contrapartida Ctp'
      FieldName = 'COD_CONTRAPARTIDA_CTP'
    end
    object cdsControleCreditosCOD_EMP_LOTE: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Emp Lote'
      FieldName = 'COD_EMP_LOTE'
    end
    object cdsControleCreditosQTDE_PARC: TIntegerField
      DisplayLabel = 'Qtde Parc'
      FieldName = 'QTDE_PARC'
    end
    object cdsControleCreditosDEB_CRED: TStringField
      DisplayLabel = 'Deb Cred'
      FieldName = 'DEB_CRED'
      FixedChar = True
      Size = 1
    end
  end
  object dspControleBanco: TDataSetProvider
    DataSet = qrControleBanco
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 493
    Top = 104
  end
  object cdsControleBanco: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspControleBanco'
    BeforeOpen = cdsPDVBeforeOpen
    Left = 493
    Top = 152
    object cdsControleBancoCODIGO_CTRL: TIntegerField
      FieldName = 'CODIGO_CTRL'
      Required = True
    end
    object cdsControleBancoNOME_CTRL: TStringField
      FieldName = 'NOME_CTRL'
      Size = 35
    end
    object cdsControleBancoN_BANCO_CTRL: TStringField
      FieldName = 'N_BANCO_CTRL'
      FixedChar = True
      Size = 10
    end
    object cdsControleBancoCOD_COBREBEM: TIntegerField
      FieldName = 'COD_COBREBEM'
    end
  end
  object dsCBX: TDataSource
    DataSet = cdsCBX
    Left = 776
    Top = 144
  end
  object cdsCBX: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 780
    Top = 88
    object cdsCBXSEL: TStringField
      DisplayLabel = 'Sel'
      FieldKind = fkInternalCalc
      FieldName = 'SEL'
      Size = 1
    end
    object cdsCBXN_DOC_C: TStringField
      DisplayLabel = 'N'#250'mero do documento'
      FieldName = 'N_DOC_C'
    end
    object cdsCBXNOME_C: TStringField
      DisplayLabel = 'Nome do cliente'
      FieldName = 'NOME_C'
      Size = 35
    end
    object cdsCBXRAZAO: TStringField
      DisplayLabel = 'Raz'#227'o Social'
      DisplayWidth = 60
      FieldName = 'RAZAO'
      Size = 35
    end
    object cdsCBXVALOR_C: TCurrencyField
      DisplayLabel = 'Valor'
      FieldName = 'VALOR_C'
      DisplayFormat = '##0.00'
    end
    object cdsCBXDATA_VENC_C: TDateField
      DisplayLabel = 'Vencimento'
      FieldName = 'DATA_VENC_C'
    end
    object cdsCBXCOD_CRED: TIntegerField
      DisplayLabel = 'C'#243'digo do cr'#233'dito'
      FieldName = 'COD_CRED'
    end
    object cdsCBXTIPO_DOC_C: TStringField
      DisplayLabel = 'Tipo de documento'
      FieldName = 'TIPO_DOC_C'
      Size = 15
    end
    object cdsCBXCODIGO_EMP: TIntegerField
      Tag = 1
      DisplayLabel = 'C'#243'digo da empresa'
      FieldName = 'CODIGO_EMP'
    end
    object cdsCBXHISTORICO_C: TStringField
      DisplayLabel = 'Hist'#243'rico'
      FieldName = 'HISTORICO_C'
      Size = 100
    end
    object cdsCBXCOD_COBREBEM: TIntegerField
      DisplayLabel = 'Cod Cobrebem'
      FieldName = 'COD_COBREBEM'
    end
    object cdsCBXNOSSO_NUMERO_BANCO: TStringField
      DisplayLabel = 'Nosso n'#250'mero'
      FieldName = 'NOSSO_NUMERO_BANCO'
    end
    object cdsCBXVALOR_PAGO: TCurrencyField
      DisplayLabel = 'Valor pago'
      FieldName = 'VALOR_PAGO'
      DisplayFormat = '##0.00'
    end
    object cdsCBXDATA_PAGAMENTO: TDateField
      DisplayLabel = 'Data do pagamento'
      FieldName = 'DATA_PAGAMENTO'
    end
    object cdsCBXVALOR_JUROS: TCurrencyField
      DisplayLabel = 'Juros'
      FieldName = 'VALOR_JUROS'
      DisplayFormat = '##0.00'
    end
    object cdsCBXVALOR_DESCONTO: TCurrencyField
      DisplayLabel = 'Desconto'
      FieldName = 'VALOR_DESCONTO'
      DisplayFormat = '##0.00'
    end
    object cdsCBXTAXA_COBRANCA: TCurrencyField
      DisplayLabel = 'Taxa de cobran'#231'a'
      FieldName = 'TAXA_COBRANCA'
      DisplayFormat = '##0.00'
    end
    object cdsCBXSTATUS: TStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS_C'
    end
    object cdsCBXOCORRENCIABANCARIA: TMemoField
      DisplayLabel = 'Informa'#231#227'o banc'#225'ria'
      FieldName = 'OCORRENCIABANCARIA'
      OnGetText = cdsCBXOCORRENCIABANCARIAGetText
      OnSetText = cdsCBXOCORRENCIABANCARIASetText
      BlobType = ftMemo
      Size = 8
    end
    object cdsCBXCOD_EMP_MULT: TIntegerField
      DisplayLabel = 'Cod Unificada'
      FieldName = 'COD_EMP_MULT'
    end
  end
  object qrLoteQuit: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select * from lote_quit WHERE N_LOTE_QUIT = 0')
    Left = 32
    Top = 280
  end
  object dspLoteQuit: TDataSetProvider
    DataSet = qrLoteQuit
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    OnGetTableName = dspLoteQuitGetTableName
    Left = 29
    Top = 328
  end
  object cdsLoteQuit: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspLoteQuit'
    BeforeOpen = cdsPDVBeforeOpen
    Left = 29
    Top = 376
    object cdsLoteQuitN_LOTE_QUIT: TIntegerField
      FieldName = 'N_LOTE_QUIT'
      Required = True
    end
    object cdsLoteQuitDATA_L_QUIT: TDateTimeField
      FieldName = 'DATA_L_QUIT'
      Required = True
    end
    object cdsLoteQuitCODIGO_EMP: TIntegerField
      FieldName = 'CODIGO_EMP'
      Required = True
    end
    object cdsLoteQuitSELEC: TStringField
      FieldName = 'SELEC'
      FixedChar = True
      Size = 1
    end
    object cdsLoteQuitDATA_CXL_QUIT: TDateTimeField
      FieldName = 'DATA_CXL_QUIT'
    end
    object cdsLoteQuitSTATUS: TStringField
      FieldName = 'STATUS'
      FixedChar = True
      Size = 10
    end
  end
  object qrFechCaixa: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select * from fech_Dia where CODIGO_EMP <> -1 '
      'order by dia_fcd'
      '')
    Left = 112
    Top = 272
  end
  object dspFechCaixa: TDataSetProvider
    DataSet = qrFechCaixa
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 109
    Top = 328
  end
  object cdsFechCaixa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFechCaixa'
    BeforeOpen = cdsPDVBeforeOpen
    Left = 109
    Top = 376
    object cdsFechCaixaDIA_FCD: TDateTimeField
      FieldName = 'DIA_FCD'
      Origin = '"FECH_DIA"."DIA_FCD"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsFechCaixaNMOV: TIntegerField
      FieldName = 'NMOV'
      Origin = '"FECH_DIA"."NMOV"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsFechCaixaTOT_E_FCD: TFloatField
      FieldName = 'TOT_E_FCD'
      Origin = '"FECH_DIA"."TOT_E_FCD"'
    end
    object cdsFechCaixaTOT_S_FCD: TFloatField
      FieldName = 'TOT_S_FCD'
      Origin = '"FECH_DIA"."TOT_S_FCD"'
    end
    object cdsFechCaixaCODIGO_EMP: TIntegerField
      FieldName = 'CODIGO_EMP'
      Origin = '"FECH_DIA"."CODIGO_EMP"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
  end
  object qrBaixaCredito: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'Select * from Baixa_creditos where seq_bxcred <> -1')
    Left = 200
    Top = 272
  end
  object dspBaixaCredito: TDataSetProvider
    DataSet = qrBaixaCredito
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 197
    Top = 328
  end
  object cdsBaixaCredito: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspBaixaCredito'
    BeforeOpen = cdsPDVBeforeOpen
    Left = 197
    Top = 376
    object cdsBaixaCreditoSEQ_BXCRED: TIntegerField
      FieldName = 'SEQ_BXCRED'
      Required = True
    end
    object cdsBaixaCreditoCOD_CRED: TIntegerField
      FieldName = 'COD_CRED'
      Required = True
    end
    object cdsBaixaCreditoCODIGO_CTRL: TIntegerField
      FieldName = 'CODIGO_CTRL'
    end
    object cdsBaixaCreditoCOD_CLIENTE: TIntegerField
      FieldName = 'COD_CLIENTE'
    end
    object cdsBaixaCreditoNOME_C: TStringField
      FieldName = 'NOME_C'
      FixedChar = True
      Size = 35
    end
    object cdsBaixaCreditoDATA_REC_C: TDateTimeField
      FieldName = 'DATA_REC_C'
    end
    object cdsBaixaCreditoTIPO_DOC_C: TStringField
      FieldName = 'TIPO_DOC_C'
      FixedChar = True
      Size = 15
    end
    object cdsBaixaCreditoHISTORICO_C: TStringField
      FieldName = 'HISTORICO_C'
      FixedChar = True
      Size = 100
    end
    object cdsBaixaCreditoDATA_VENC_C: TDateTimeField
      FieldName = 'DATA_VENC_C'
    end
    object cdsBaixaCreditoVALOR_C: TFloatField
      FieldName = 'VALOR_C'
    end
    object cdsBaixaCreditoDATQ_C: TDateTimeField
      FieldName = 'DATQ_C'
    end
    object cdsBaixaCreditoNATL_C: TStringField
      FieldName = 'NATL_C'
      FixedChar = True
      Size = 1
    end
    object cdsBaixaCreditoLOTE: TIntegerField
      FieldName = 'LOTE'
    end
    object cdsBaixaCreditoOBS_C: TStringField
      FieldName = 'OBS_C'
      FixedChar = True
      Size = 60
    end
    object cdsBaixaCreditoTP_DOC_V: TStringField
      FieldName = 'TP_DOC_V'
      FixedChar = True
      Size = 6
    end
    object cdsBaixaCreditoN_DOC_V: TIntegerField
      FieldName = 'N_DOC_V'
    end
    object cdsBaixaCreditoN_DOC_C: TStringField
      FieldName = 'N_DOC_C'
      FixedChar = True
    end
    object cdsBaixaCreditoCOD_CLI_TERC: TIntegerField
      FieldName = 'COD_CLI_TERC'
    end
    object cdsBaixaCreditoNOME_TERC: TStringField
      FieldName = 'NOME_TERC'
      FixedChar = True
      Size = 35
    end
    object cdsBaixaCreditoTIP_CNT: TStringField
      FieldName = 'TIP_CNT'
      FixedChar = True
      Size = 1
    end
    object cdsBaixaCreditoCODIGO_VEND: TIntegerField
      FieldName = 'CODIGO_VEND'
    end
    object cdsBaixaCreditoTIP_BAIXA: TStringField
      FieldName = 'TIP_BAIXA'
      FixedChar = True
      Size = 1
    end
    object cdsBaixaCreditoDATA_BAIXA: TDateTimeField
      FieldName = 'DATA_BAIXA'
    end
    object cdsBaixaCreditoDATA_VENDA: TDateTimeField
      FieldName = 'DATA_VENDA'
    end
    object cdsBaixaCreditoVALOR_QUITADO: TFloatField
      FieldName = 'VALOR_QUITADO'
    end
    object cdsBaixaCreditoVALOR_CORR: TFloatField
      FieldName = 'VALOR_CORR'
    end
    object cdsBaixaCreditoTP_OPERACAO: TStringField
      FieldName = 'TP_OPERACAO'
      FixedChar = True
      Size = 1
    end
    object cdsBaixaCreditoLOTE_QUIT: TIntegerField
      FieldName = 'LOTE_QUIT'
    end
    object cdsBaixaCreditoLOTE_ENT: TIntegerField
      FieldName = 'LOTE_ENT'
    end
    object cdsBaixaCreditoVALOR_DESC: TFloatField
      FieldName = 'VALOR_DESC'
    end
    object cdsBaixaCreditoVALOR_ACRESC: TFloatField
      FieldName = 'VALOR_ACRESC'
    end
    object cdsBaixaCreditoDIA_CXL: TDateTimeField
      FieldName = 'DIA_CXL'
    end
    object cdsBaixaCreditoSTATUS_CXL_RQ: TStringField
      FieldName = 'STATUS_CXL_RQ'
      FixedChar = True
      Size = 1
    end
    object cdsBaixaCreditoVL_RQ_PG_CXL: TFloatField
      FieldName = 'VL_RQ_PG_CXL'
    end
    object cdsBaixaCreditoOP_CXL: TIntegerField
      FieldName = 'OP_CXL'
    end
    object cdsBaixaCreditoCPFCGC: TStringField
      FieldName = 'CPFCGC'
      FixedChar = True
      Size = 18
    end
    object cdsBaixaCreditoLOTE_CXL: TIntegerField
      FieldName = 'LOTE_CXL'
    end
    object cdsBaixaCreditoJUROS_COB: TFloatField
      FieldName = 'JUROS_COB'
    end
    object cdsBaixaCreditoCOD_EMP_MULT: TIntegerField
      FieldName = 'COD_EMP_MULT'
    end
    object cdsBaixaCreditoCODIGO_EMP: TIntegerField
      FieldName = 'CODIGO_EMP'
      Required = True
    end
    object cdsBaixaCreditoDT_BAIXA_COMISSAO: TDateTimeField
      FieldName = 'DT_BAIXA_COMISSAO'
    end
    object cdsBaixaCreditoVL_BAIXA_COMISSAO: TFloatField
      FieldName = 'VL_BAIXA_COMISSAO'
    end
    object cdsBaixaCreditoVL_RECIBO: TFloatField
      FieldName = 'VL_RECIBO'
    end
    object cdsBaixaCreditoCOONAOFISCAL: TIntegerField
      FieldName = 'COONAOFISCAL'
    end
    object cdsBaixaCreditoNSERIEECF: TStringField
      FieldName = 'NSERIEECF'
    end
    object cdsBaixaCreditoCOD_TERMINAL: TIntegerField
      FieldName = 'COD_TERMINAL'
    end
    object cdsBaixaCreditoOCORRENCIABANCARIA: TMemoField
      FieldName = 'OCORRENCIABANCARIA'
      BlobType = ftMemo
      Size = 8
    end
    object cdsBaixaCreditoVL_BAIXA_COMISSAO_GER: TFloatField
      FieldName = 'VL_BAIXA_COMISSAO_GER'
    end
    object cdsBaixaCreditoUS_BX: TIntegerField
      FieldName = 'US_BX'
    end
    object cdsBaixaCreditoVL_CONTABIL: TFloatField
      FieldName = 'VL_CONTABIL'
    end
  end
  object qrLancamentos: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      
        'select l.cod_lanc,l.data,l.tipo_l,l.n_conta_plc,l.codigo_ctrl,c.' +
        'nome_ctrl,l.ndoc_l,'
      
        'l.historico_l,l.valor_l ,l.status_l,l.datq_l,l.natl,L.dia_fcd,l.' +
        'nmov,l.lote,l.codigo_emp,'
      
        'l.tip_cnt,l.data_cxl,l.lanc_venda,l.data_rem_rec,l.tp_mod,l.cod_' +
        'term,'
      
        'l.dt_compensado,l.nominal_l,l.n_cheq_l,l.vl_contabil,l.lote_ent,' +
        'l.cod_Emp_mult,l.op_cxl,l.dtreferencia,l.cod_ocorrencia,l.data_o' +
        'correncia, l.id_financ_confere from Lancamentos l,controles c wh' +
        'ere '
      'l.cod_lanc <> -1 ')
    Left = 296
    Top = 272
  end
  object dspLancamentos: TDataSetProvider
    DataSet = qrLancamentos
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 293
    Top = 328
  end
  object cdsLancamentos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspLancamentos'
    BeforeOpen = cdsPDVBeforeOpen
    Left = 293
    Top = 376
  end
  object TransRetorno: TIBTransaction
    DefaultDatabase = dtmAtivo.bancoHw
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 792
    Top = 8
  end
  object qrContaLigacao: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select * from Cont_Lig where COD_EMP = -50')
    Left = 384
    Top = 272
  end
  object dspContaLigacao: TDataSetProvider
    DataSet = qrContaLigacao
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 381
    Top = 328
  end
  object cdsContaLigacao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspContaLigacao'
    BeforeOpen = cdsPDVBeforeOpen
    Left = 381
    Top = 376
    object cdsContaLigacaoCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
    end
    object cdsContaLigacaoNCON_V_PROD: TFloatField
      FieldName = 'NCON_V_PROD'
    end
    object cdsContaLigacaoCONTR_V_PROD: TIntegerField
      FieldName = 'CONTR_V_PROD'
    end
    object cdsContaLigacaoNCON_V_SERV: TFloatField
      FieldName = 'NCON_V_SERV'
    end
    object cdsContaLigacaoCONTR_V_SERV: TIntegerField
      FieldName = 'CONTR_V_SERV'
    end
    object cdsContaLigacaoNCON_C_PROD: TFloatField
      FieldName = 'NCON_C_PROD'
    end
    object cdsContaLigacaoCONTR_C_PROD: TIntegerField
      FieldName = 'CONTR_C_PROD'
    end
    object cdsContaLigacaoNCON_C_VEIC: TFloatField
      FieldName = 'NCON_C_VEIC'
    end
    object cdsContaLigacaoCONTR_C_VEIC: TIntegerField
      FieldName = 'CONTR_C_VEIC'
    end
    object cdsContaLigacaoNCON_S_CHQ: TFloatField
      FieldName = 'NCON_S_CHQ'
    end
    object cdsContaLigacaoCONTR_S_CHQ: TIntegerField
      FieldName = 'CONTR_S_CHQ'
    end
    object cdsContaLigacaoNCON_S_CRD: TFloatField
      FieldName = 'NCON_S_CRD'
    end
    object cdsContaLigacaoCONTR_S_CRD: TIntegerField
      FieldName = 'CONTR_S_CRD'
    end
    object cdsContaLigacaoCONTA_ICM: TFloatField
      FieldName = 'CONTA_ICM'
    end
    object cdsContaLigacaoCONTA_PIS: TFloatField
      FieldName = 'CONTA_PIS'
    end
    object cdsContaLigacaoGR_REINV: TIntegerField
      FieldName = 'GR_REINV'
    end
    object cdsContaLigacaoNCON_D_PREST: TFloatField
      FieldName = 'NCON_D_PREST'
    end
    object cdsContaLigacaoNCON_J_PREST: TFloatField
      FieldName = 'NCON_J_PREST'
    end
    object cdsContaLigacaoNCON_MANU_EQUIP: TFloatField
      FieldName = 'NCON_MANU_EQUIP'
    end
    object cdsContaLigacaoCONTR_MANU_EQUIP: TIntegerField
      FieldName = 'CONTR_MANU_EQUIP'
    end
    object cdsContaLigacaoNCON_TARIFABANCARIA: TFloatField
      FieldName = 'NCON_TARIFABANCARIA'
    end
    object cdsContaLigacaoNCON_ED_PREST: TFloatField
      FieldName = 'NCON_ED_PREST'
    end
    object cdsContaLigacaoNCON_SJ_PREST: TFloatField
      FieldName = 'NCON_SJ_PREST'
    end
    object cdsContaLigacaoNCON_S_VALE: TFloatField
      FieldName = 'NCON_S_VALE'
    end
    object cdsContaLigacaoNCON_LANCDIFCTP: TFloatField
      FieldName = 'NCON_LANCDIFCTP'
    end
    object cdsContaLigacaoNCON_SOBRA: TFloatField
      FieldName = 'NCON_SOBRA'
    end
    object cdsContaLigacaoNCON_QUEBRA: TFloatField
      FieldName = 'NCON_QUEBRA'
    end
    object cdsContaLigacaoNCON_TARIFAINTERMPAG: TFloatField
      FieldName = 'NCON_TARIFAINTERMPAG'
    end
    object cdsContaLigacaoNCON_ENT_DESCDESP: TFloatField
      FieldName = 'NCON_ENT_DESCDESP'
    end
    object cdsContaLigacaoNCON_C_FRETE: TFloatField
      FieldName = 'NCON_C_FRETE'
    end
    object cdsContaLigacaoNCON_E_TRANSF: TFloatField
      FieldName = 'NCON_E_TRANSF'
    end
    object cdsContaLigacaoNCON_S_TRANSF: TFloatField
      FieldName = 'NCON_S_TRANSF'
    end
  end
  object qrBoletos: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select * from boletas where N_SEQ_BOL = -50')
    Left = 480
    Top = 272
  end
  object dspBoletos: TDataSetProvider
    DataSet = qrBoletos
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 480
    Top = 328
  end
  object cdsBoletos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspBoletos'
    BeforeOpen = cdsPDVBeforeOpen
    Left = 477
    Top = 384
    object cdsBoletosN_SEQ_BOL: TIntegerField
      FieldName = 'N_SEQ_BOL'
      Required = True
    end
    object cdsBoletosCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsBoletosNUM_NF_VND: TIntegerField
      FieldName = 'NUM_NF_VND'
    end
    object cdsBoletosN_CUPOM: TIntegerField
      FieldName = 'N_CUPOM'
    end
    object cdsBoletosN_PDV: TIntegerField
      FieldName = 'N_PDV'
    end
    object cdsBoletosCOD_CRED: TIntegerField
      FieldName = 'COD_CRED'
    end
    object cdsBoletosDATA_EM_BOL: TDateTimeField
      FieldName = 'DATA_EM_BOL'
    end
    object cdsBoletosDATA_VEN_BOL: TDateTimeField
      FieldName = 'DATA_VEN_BOL'
    end
    object cdsBoletosN_DOC_BOL: TStringField
      FieldName = 'N_DOC_BOL'
      Size = 10
    end
    object cdsBoletosVL_DOC_BOL: TFloatField
      FieldName = 'VL_DOC_BOL'
    end
    object cdsBoletosOBS_BOL: TStringField
      FieldName = 'OBS_BOL'
      Size = 45
    end
    object cdsBoletosM_DIA_BOL: TFloatField
      FieldName = 'M_DIA_BOL'
    end
    object cdsBoletosMULT_ATR_BOL: TFloatField
      FieldName = 'MULT_ATR_BOL'
    end
    object cdsBoletosCOD_CLIENTE: TIntegerField
      FieldName = 'COD_CLIENTE'
    end
    object cdsBoletosLOCALPAG: TStringField
      FieldName = 'LOCALPAG'
      Size = 40
    end
    object cdsBoletosOBS_BOL1: TStringField
      FieldName = 'OBS_BOL1'
      Size = 45
    end
    object cdsBoletosATIVO: TIntegerField
      FieldName = 'ATIVO'
    end
    object cdsBoletosNOSSO_NUMERO_BANCO: TStringField
      FieldName = 'NOSSO_NUMERO_BANCO'
    end
    object cdsBoletosCOD_CONTROLE_CX: TIntegerField
      FieldName = 'COD_CONTROLE_CX'
    end
    object cdsBoletosREMESSA_ENVIADA: TStringField
      FieldName = 'REMESSA_ENVIADA'
      FixedChar = True
      Size = 1
    end
    object cdsBoletosSUB_SERIE: TIntegerField
      FieldName = 'SUB_SERIE'
    end
    object cdsBoletosDATA_REMESSA: TDateTimeField
      FieldName = 'DATA_REMESSA'
    end
    object cdsBoletosCOD_COBREBEM: TIntegerField
      FieldName = 'COD_COBREBEM'
    end
    object cdsBoletosCOD_SEQ_REMESSA: TIntegerField
      FieldName = 'COD_SEQ_REMESSA'
    end
    object cdsBoletosSTATUS: TStringField
      FieldName = 'STATUS'
      FixedChar = True
      Size = 7
    end
    object cdsBoletosTIPO_EMISSAO: TStringField
      FieldName = 'TIPO_EMISSAO'
    end
    object cdsBoletosOCORRENCIABANCARIA: TBlobField
      FieldName = 'OCORRENCIABANCARIA'
      Size = 8
    end
  end
  object qrQuitarCreditos: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select c.banco, c.descricao, cc.* from controle_creditos cc'
      
        'inner join boletas b on b.nosso_numero_banco = cc.nosso_numero_b' +
        'anco and b.n_doc_bol = cc.n_doc_c and b.cod_empresa = cc.codigo_' +
        'emp'
      
        'inner join cobrebem c on c.cod_cobrebem = b.cod_cobrebem and c.c' +
        'od_empresa = b.cod_empresa')
    Left = 580
    Top = 64
  end
  object dspQuitarCreditos: TDataSetProvider
    DataSet = qrQuitarCreditos
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 581
    Top = 112
  end
  object cdsQuitarCreditos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspQuitarCreditos'
    BeforeOpen = cdsPDVBeforeOpen
    Left = 581
    Top = 160
    object IntegerField1: TIntegerField
      DisplayLabel = 'C'#243'digo do cr'#233'dito'
      FieldName = 'COD_CRED'
      Required = True
    end
    object IntegerField2: TIntegerField
      DisplayLabel = 'N'#250'mero de sequencia do boleto'
      FieldName = 'N_SEQ_BOL'
    end
    object FloatField1: TFloatField
      DisplayLabel = 'N'#250'mero da conta'
      FieldName = 'N_CONTA_PLC'
    end
    object IntegerField3: TIntegerField
      DisplayLabel = 'C'#243'digo do controlre gerado'
      FieldName = 'CODIGO_CTRL'
      Required = True
    end
    object IntegerField4: TIntegerField
      DisplayLabel = 'C'#243'digo do cliente'
      FieldName = 'COD_CLIENTE'
    end
    object IntegerField5: TIntegerField
      FieldName = 'N_DUPL_C'
    end
    object StringField1: TStringField
      DisplayLabel = 'Nome do cliente'
      FieldName = 'NOME_C'
      Size = 35
    end
    object DateTimeField1: TDateTimeField
      DisplayLabel = 'Data cr'#233'dito movimenta'#231#227'o caixa'
      FieldName = 'DATA_REC_C'
    end
    object StringField2: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO_DOC_C'
      FixedChar = True
      Size = 15
    end
    object StringField3: TStringField
      DisplayLabel = 'Hist'#243'rico'
      FieldName = 'HISTORICO_C'
      Size = 100
    end
    object DateTimeField2: TDateTimeField
      DisplayLabel = 'Data de vencimento'
      FieldName = 'DATA_VENC_C'
    end
    object FloatField2: TFloatField
      DisplayLabel = 'Valor cr'#233'dito'
      FieldName = 'VALOR_C'
      currency = True
    end
    object StringField4: TStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS_C'
      FixedChar = True
      Size = 10
    end
    object DateTimeField3: TDateTimeField
      DisplayLabel = 'Data quita'#231#227'o movimenta'#231#227'o financeiro'
      FieldName = 'DATQ_C'
    end
    object StringField5: TStringField
      FieldName = 'NATL_C'
      FixedChar = True
      Size = 1
    end
    object IntegerField6: TIntegerField
      DisplayLabel = 'C'#243'digo lote contas a pagar'
      FieldName = 'LOTE'
    end
    object StringField6: TStringField
      DisplayLabel = 'Observa'#231#245'es baixa'
      FieldName = 'OBS_C'
      Size = 60
    end
    object StringField7: TStringField
      DisplayLabel = 'Tipo de venda'
      FieldName = 'TP_DOC_V'
      FixedChar = True
      Size = 6
    end
    object IntegerField7: TIntegerField
      DisplayLabel = 'C'#243'digo de venda'
      FieldName = 'N_DOC_V'
    end
    object StringField8: TStringField
      DisplayLabel = 'N'#250'mero do documento'
      FieldName = 'N_DOC_C'
      FixedChar = True
    end
    object StringField9: TStringField
      FieldName = 'SELEC'
      FixedChar = True
      Size = 1
    end
    object IntegerField8: TIntegerField
      DisplayLabel = 'C'#243'digo cliente terceiro'
      FieldName = 'COD_CLI_TERC'
    end
    object StringField10: TStringField
      DisplayLabel = 'Nome cliente terceiro'
      FieldName = 'NOME_TERC'
      Size = 35
    end
    object StringField11: TStringField
      FieldName = 'TIP_CNT'
      FixedChar = True
      Size = 1
    end
    object DateTimeField4: TDateTimeField
      DisplayLabel = 'Data do caixa'
      FieldName = 'DATA_CXL'
    end
    object IntegerField9: TIntegerField
      DisplayLabel = 'C'#243'digo do vendedor'
      FieldName = 'CODIGO_VEND'
    end
    object StringField12: TStringField
      DisplayLabel = 'Tipo de baixa'
      FieldName = 'TIP_BAIXA'
      FixedChar = True
      Size = 1
    end
    object DateTimeField5: TDateTimeField
      DisplayLabel = 'Data da remessa ou processamento'
      FieldName = 'DATA_REM_REC'
    end
    object IntegerField10: TIntegerField
      DisplayLabel = 'C'#243'digo do terminal ECF'
      FieldName = 'COD_TERM'
    end
    object DateTimeField6: TDateTimeField
      DisplayLabel = 'Data da baixa pelo financeiro'
      FieldName = 'DATA_BAIXA'
    end
    object DateTimeField7: TDateTimeField
      DisplayLabel = 'Data da venda'
      FieldName = 'DATA_VENDA'
    end
    object FloatField3: TFloatField
      DisplayLabel = 'Valor corrigido'
      FieldName = 'VALOR_CORR'
      currency = True
    end
    object IntegerField11: TIntegerField
      DisplayLabel = 'C'#243'digo do colaborador'
      FieldName = 'CODIGO_FUNC'
    end
    object IntegerField12: TIntegerField
      DisplayLabel = 'Lote de quita'#231#227'o'
      FieldName = 'LOTE_QUIT'
    end
    object FloatField4: TFloatField
      DisplayLabel = 'Valor dos descontos'
      FieldName = 'VALOR_DESC'
    end
    object cdsQuitarCreditosVALOR_ACRESC: TFloatField
      DisplayLabel = 'Valor dos acrescimo'
      FieldName = 'VALOR_ACRESC'
    end
    object IntegerField13: TIntegerField
      DisplayLabel = 'Lote de entrada'
      FieldName = 'LOTE_ENT'
    end
    object DateTimeField8: TDateTimeField
      DisplayLabel = 'Dia movienta'#231#227'o caixa auxiliar'
      FieldName = 'DIA_CXL'
    end
    object StringField13: TStringField
      DisplayLabel = 'Status caixa auxiliar'
      FieldName = 'STATUS_CXL_RQ'
      FixedChar = True
      Size = 1
    end
    object FloatField5: TFloatField
      DisplayLabel = 'Valor recebido caixa auxiliar'
      FieldName = 'VL_RQ_PG_CXL'
    end
    object IntegerField14: TIntegerField
      DisplayLabel = 'Operador do caixa auxiliar'
      FieldName = 'OP_CXL'
    end
    object StringField14: TStringField
      DisplayLabel = 'CPF do cliente'
      FieldName = 'CPFCGC'
      FixedChar = True
      Size = 18
    end
    object IntegerField15: TIntegerField
      DisplayLabel = 'Lote caixa auxiliar'
      FieldName = 'LOTE_CXL'
    end
    object StringField15: TStringField
      DisplayLabel = 'Tipo recebimento caixa auxiliar'
      FieldName = 'TP_REC_CXL'
      FixedChar = True
      Size = 1
    end
    object StringField16: TStringField
      DisplayLabel = 'Processamento de baixa pelo caixa auxiliar'
      FieldName = 'PRCSS'
      FixedChar = True
      Size = 1
    end
    object FloatField6: TFloatField
      DisplayLabel = 'Juros cobrados no pagamento'
      FieldName = 'JUROS_COB'
    end
    object IntegerField16: TIntegerField
      DisplayLabel = 'C'#243'digo do item de cartas'
      FieldName = 'COD_IT_CARTAS'
    end
    object DateTimeField9: TDateTimeField
      DisplayLabel = 'Data do envio de cartas'
      FieldName = 'DT_REG_CARTAS'
    end
    object IntegerField17: TIntegerField
      DisplayLabel = 'C'#243'digo da carta'
      FieldName = 'COD_CARTA'
    end
    object StringField17: TStringField
      DisplayLabel = 'N'#250'mero da autoriza'#231#227'o do cart'#227'o'
      FieldName = 'N_AUT_CART'
      FixedChar = True
    end
    object IntegerField18: TIntegerField
      DisplayLabel = 'C'#243'digo do faturamento'
      FieldName = 'COD_FATURAMENTO'
    end
    object IntegerField19: TIntegerField
      DisplayLabel = 'Lote de negativa'#231#227'o'
      FieldName = 'LOTE_NEG'
    end
    object DateTimeField10: TDateTimeField
      DisplayLabel = 'Data lote de negativa'#231#227'o'
      FieldName = 'DATA_LOTE_NEG'
    end
    object IntegerField20: TIntegerField
      DisplayLabel = 'C'#243'digo da empresa'
      FieldName = 'CODIGO_EMP'
      Required = True
    end
    object IntegerField21: TIntegerField
      DisplayLabel = 'C'#243'digo da empresa multiloja'
      FieldName = 'COD_EMP_MULT'
    end
    object IntegerField22: TIntegerField
      FieldName = 'NUM_NOTA'
    end
    object IntegerField23: TIntegerField
      FieldName = 'NREQ'
    end
    object IntegerField24: TIntegerField
      FieldName = 'N_OS'
    end
    object IntegerField25: TIntegerField
      FieldName = 'NCOMANDO'
    end
    object IntegerField26: TIntegerField
      FieldName = 'NGRP'
    end
    object IntegerField27: TIntegerField
      FieldName = 'COONAOFISCAL'
    end
    object StringField18: TStringField
      DisplayLabel = 'Nosso N'#250'mero'
      FieldName = 'NOSSO_NUMERO_BANCO'
    end
    object FloatField7: TFloatField
      DisplayLabel = 'Taxa de cobran'#231'a'
      FieldName = 'TAXA_COBRANCA'
    end
    object StringField19: TStringField
      DisplayLabel = 'C'#243'digo usu'#225'rio cancelamento do recebimento'
      FieldName = 'US_CANCELOU'
      Size = 10
    end
    object DateTimeField11: TDateTimeField
      DisplayLabel = 'Data usu'#225'rio cancelamento do recebimento'
      FieldName = 'DT_US_CANCELOU'
    end
    object StringField20: TStringField
      DisplayLabel = 'Observa'#231#245'es do recebimento'
      FieldName = 'OBS_PARACREDITO'
      Size = 50
    end
    object DateTimeField12: TDateTimeField
      DisplayLabel = 'Data original'
      FieldName = 'DTORIGINAL_C'
    end
    object DateTimeField13: TDateTimeField
      FieldName = 'DATA_PREV_REC'
    end
    object StringField21: TStringField
      DisplayLabel = 'Nome do dependente'
      FieldName = 'DEPENDENTE'
      Size = 35
    end
    object StringField22: TStringField
      FieldName = 'NSERIEECF'
    end
    object IntegerField28: TIntegerField
      FieldName = 'COD_TERMINAL'
    end
    object IntegerField29: TIntegerField
      DisplayLabel = 'C'#243'digo Cobrebem'
      FieldName = 'COD_COBREBEM'
    end
    object cdsQuitarCreditosRAZAO: TStringField
      FieldName = 'RAZAO'
      Size = 60
    end
    object cdsQuitarCreditosDATA_RETORNO_QUITACAO: TDateTimeField
      FieldName = 'DATA_RETORNO_QUITACAO'
    end
    object cdsQuitarCreditosCOD_EMP_LOTE: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Emp Lote'
      FieldName = 'COD_EMP_LOTE'
    end
  end
  object bancoPDV: TIBDatabase
    DatabaseName = '127.0.0.1:C:\BasesAuto\Fiscal.fdb'
    Params.Strings = (
      'user_name=sysdba'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = transacaoPDV
    Left = 880
    Top = 8
  end
  object transacaoPDV: TIBTransaction
    DefaultDatabase = bancoPDV
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 880
    Top = 56
  end
  object qrBuscasPDV: TIBQuery
    Database = bancoPDV
    Transaction = transacaoPDV
    Left = 880
    Top = 104
  end
  object qrFPG: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      
        'select fp.*,'#39' '#39' num_rec_dep, '#39' '#39' num_rec_parc  from FORMPAGAMENT' +
        'O fp')
    Left = 549
    Top = 273
  end
  object dspFPG: TDataSetProvider
    DataSet = qrFPG
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 549
    Top = 321
  end
  object cdsFPG: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFPG'
    BeforeOpen = cdsPDVBeforeOpen
    Left = 549
    Top = 369
    object cdsFPGN_CONTA_PLC: TFloatField
      DisplayLabel = 'N'#186' da Conta'
      FieldName = 'N_CONTA_PLC'
    end
    object cdsFPGTIPDOC: TStringField
      DisplayLabel = 'TP'
      FieldName = 'TIPDOC'
      FixedChar = True
      Size = 2
    end
    object cdsFPGTPDOCS: TStringField
      DisplayLabel = 'Tip Doc'#39's'
      FieldName = 'TPDOCS'
      Size = 6
    end
    object cdsFPGNREQUISICAO: TIntegerField
      DisplayLabel = 'N'#186' Venda'
      FieldName = 'NREQUISICAO'
    end
    object cdsFPGNDOC: TStringField
      DisplayLabel = 'N'#186' Doc'
      FieldName = 'NDOC'
    end
    object cdsFPGNUM_REC_DEP: TStringField
      DisplayLabel = 'N'#186' Venda'
      FieldName = 'NUM_REC_DEP'
      FixedChar = True
      Size = 1
    end
    object cdsFPGNUM_REC_PARC: TStringField
      DisplayLabel = 'N'#186' Doc'
      FieldName = 'NUM_REC_PARC'
      FixedChar = True
      Size = 1
    end
    object cdsFPGHISTORICO: TStringField
      DisplayLabel = 'Hist'#243'rico'
      FieldName = 'HISTORICO'
      Size = 80
    end
    object cdsFPGVALORDOC: TFloatField
      DisplayLabel = 'Valor Doc'
      FieldName = 'VALORDOC'
      DisplayFormat = '##0.00'
    end
    object cdsFPGDATA_MOV: TDateTimeField
      DisplayLabel = 'Data Mov'
      FieldName = 'DATA_MOV'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsFPGDATA_VENC: TDateTimeField
      DisplayLabel = 'Data Vencimento'
      FieldName = 'DATA_VENC'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsFPGCOD_CONTROLE: TIntegerField
      DisplayLabel = 'Controle'
      FieldName = 'COD_CONTROLE'
    end
    object cdsFPGCLIENTE: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
      Size = 60
    end
    object cdsFPGCOD_CLIENTE: TIntegerField
      DisplayLabel = 'Cod Cliente'
      FieldName = 'COD_CLIENTE'
    end
    object cdsFPGCOD_BANCO: TIntegerField
      DisplayLabel = 'Cod Banco'
      FieldName = 'COD_BANCO'
      Visible = False
    end
    object cdsFPGCOD_BANCO_STR: TStringField
      DisplayLabel = 'Cod Banco'
      FieldName = 'COD_BANCO_STR'
      Size = 11
    end
    object cdsFPGTERCEIROS: TStringField
      DisplayLabel = 'Terceiros'
      FieldName = 'TERCEIROS'
      Size = 80
    end
    object cdsFPGOPERADOR: TIntegerField
      DisplayLabel = 'Vendedor'
      FieldName = 'OPERADOR'
    end
    object cdsFPGTIP_CNT: TStringField
      DisplayLabel = 'Tipo Lanc'
      FieldName = 'TIP_CNT'
      FixedChar = True
      Size = 1
    end
    object cdsFPGSEQFORM: TIntegerField
      FieldName = 'SEQFORM'
      Required = True
    end
    object cdsFPGCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsFPGPRCSS: TStringField
      DisplayLabel = 'Processamento Financeiro'
      FieldName = 'PRCSS'
      FixedChar = True
      Size = 1
    end
    object cdsFPGAGENCIA: TStringField
      FieldName = 'AGENCIA'
      Size = 10
    end
    object cdsFPGCONTA: TStringField
      FieldName = 'CONTA'
      Size = 15
    end
    object cdsFPGBANCO: TStringField
      FieldName = 'BANCO'
      Size = 35
    end
    object cdsFPGCOD_CLI_TERC: TIntegerField
      FieldName = 'COD_CLI_TERC'
    end
    object cdsFPGOP_CXL: TIntegerField
      DisplayLabel = 'Operador CXL'
      FieldName = 'OP_CXL'
    end
    object cdsFPGCODIGO_FUNC: TIntegerField
      FieldName = 'CODIGO_FUNC'
    end
    object cdsFPGN_AUT_CART: TStringField
      FieldName = 'N_AUT_CART'
      FixedChar = True
    end
    object cdsFPGPLANO: TStringField
      FieldName = 'PLANO'
      FixedChar = True
      Size = 1
    end
    object cdsFPGATIVO: TIntegerField
      FieldName = 'ATIVO'
    end
    object cdsFPGNUM_NOTA: TIntegerField
      FieldName = 'NUM_NOTA'
    end
    object cdsFPGSUB_SERIE: TIntegerField
      FieldName = 'SUB_SERIE'
    end
    object cdsFPGNOSSO_NUMERO_BANCO: TStringField
      FieldName = 'NOSSO_NUMERO_BANCO'
    end
    object cdsFPGRECIBO: TStringField
      FieldName = 'RECIBO'
      FixedChar = True
      Size = 1
    end
    object cdsFPGNCOO_ECF: TIntegerField
      FieldName = 'NCOO_ECF'
    end
    object cdsFPGSECAO: TIntegerField
      FieldName = 'SECAO'
    end
    object cdsFPGCOD_TERMINAL: TIntegerField
      FieldName = 'COD_TERMINAL'
    end
    object cdsFPGNSERIEECF: TStringField
      FieldName = 'NSERIEECF'
    end
    object cdsFPGREGISTRO: TIntegerField
      FieldName = 'REGISTRO'
    end
    object cdsFPGREC_TIPVEND: TStringField
      FieldName = 'REC_TIPVEND'
      FixedChar = True
      Size = 3
    end
    object cdsFPGREC_NUMVEND: TIntegerField
      FieldName = 'REC_NUMVEND'
    end
    object cdsFPGN_PROCESSAMENTO: TIntegerField
      DisplayLabel = 'Num Processamento Financeiro'
      FieldName = 'N_PROCESSAMENTO'
    end
    object cdsFPGREF_FRETE: TStringField
      FieldName = 'REF_FRETE'
      FixedChar = True
      Size = 1
    end
    object cdsFPGVALOR_CONTABIL: TFloatField
      FieldName = 'VALOR_CONTABIL'
    end
    object cdsFPGSEL: TStringField
      DisplayLabel = 'Sel'
      FieldKind = fkInternalCalc
      FieldName = 'SEL'
      Size = 1
    end
    object cdsFPGVL_BAIXA_COMISSAO: TFloatField
      FieldName = 'VL_BAIXA_COMISSAO'
    end
    object cdsFPGVL_BAIXA_COMISSAO_GER: TFloatField
      FieldName = 'VL_BAIXA_COMISSAO_GER'
    end
    object cdsFPGUS_CAD: TIntegerField
      FieldName = 'US_CAD'
    end
    object cdsFPGN_DOCNSU_ADM: TStringField
      DisplayLabel = 'NSU Transa'#231#227'o Cart'#227'o'
      FieldName = 'N_DOCNSU_ADM'
      Size = 10
    end
    object cdsFPGCOD_TERMINAL_ADM: TStringField
      DisplayLabel = 'Terminal Cart'#227'o'
      FieldName = 'COD_TERMINAL_ADM'
      Size = 10
    end
    object cdsFPGDESC_TERMINAL_ADM: TStringField
      FieldName = 'DESC_TERMINAL_ADM'
      Size = 30
    end
    object cdsFPGCOD_BANDEIRA_ADM: TIntegerField
      FieldName = 'COD_BANDEIRA_ADM'
    end
    object cdsFPGDESC_BANDEIRA: TStringField
      FieldName = 'DESC_BANDEIRA'
      Size = 50
    end
    object cdsFPGNPARCELA: TIntegerField
      FieldName = 'NPARCELA'
    end
    object cdsFPGQTDE_PARC: TIntegerField
      FieldName = 'QTDE_PARC'
    end
    object cdsFPGDEB_CRED: TStringField
      FieldName = 'DEB_CRED'
      FixedChar = True
      Size = 1
    end
    object cdsFPGCOD_COBREBEM: TIntegerField
      FieldName = 'COD_COBREBEM'
    end
    object cdsFPGVALORDOC_LIQ: TFloatField
      FieldName = 'VALORDOC_LIQ'
    end
  end
  object dsFPG: TDataSource
    AutoEdit = False
    DataSet = cdsFPG
    Left = 549
    Top = 417
  end
  object qrPrest: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      
        'select nome_c,data_venc_c,dia_cxl,vl_rq_pg_cxl,op_cxl, cod_cred,' +
        ' codigo_emp, cod_emp_mult, lote_cxl,tp_rec_cxl,prcss,valor_c'
      'from controle_creditos where cod_cred = -1 and codigo_emp = 0')
    Left = 613
    Top = 273
  end
  object dspPrest: TDataSetProvider
    DataSet = qrPrest
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 613
    Top = 321
  end
  object cdsPrest: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPrest'
    BeforeOpen = cdsPDVBeforeOpen
    Left = 613
    Top = 369
    object cdsPrestCOD_CLIENTE: TIntegerField
      DisplayLabel = 'Cod Cliente'
      FieldName = 'COD_CLIENTE'
    end
    object cdsPrestNOME_C: TStringField
      DisplayLabel = 'Nome Cliente'
      FieldName = 'NOME_C'
      Size = 35
    end
    object cdsPrestDATA_REC_C: TDateTimeField
      DisplayLabel = 'Data Cadastro'
      FieldName = 'DATA_REC_C'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsPrestDATA_VENC_C: TDateTimeField
      DisplayLabel = 'Data Vencimento'
      FieldName = 'DATA_VENC_C'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsPrestDIA_CXL: TDateTimeField
      DisplayLabel = 'Dia Cxl'
      FieldName = 'DIA_CXL'
    end
    object cdsPrestVL_RQ_PG_CXL: TFloatField
      DisplayLabel = 'Valor Pago Cxl'
      FieldName = 'VL_RQ_PG_CXL'
      DisplayFormat = '##0.00'
    end
    object cdsPrestOP_CXL: TIntegerField
      DisplayLabel = 'Operador'
      FieldName = 'OP_CXL'
    end
    object cdsPrestCOD_CRED: TIntegerField
      DisplayLabel = 'Cod Credito'
      FieldName = 'COD_CRED'
      Required = True
    end
    object cdsPrestCODIGO_EMP: TIntegerField
      DisplayLabel = 'Cod Empresa'
      FieldName = 'CODIGO_EMP'
    end
    object cdsPrestCOD_EMP_MULT: TIntegerField
      DisplayLabel = 'Cod Emp Mult'
      FieldName = 'COD_EMP_MULT'
    end
    object cdsPrestCODIGO_CTRL: TIntegerField
      DisplayLabel = 'Cod Controle'
      FieldName = 'CODIGO_CTRL'
    end
    object cdsPrestN_DOC_V: TIntegerField
      DisplayLabel = 'Num Venda'
      FieldName = 'N_DOC_V'
    end
    object cdsPrestN_DOC_C: TStringField
      DisplayLabel = 'Num Documento'
      FieldName = 'N_DOC_C'
    end
    object cdsPrestTP_DOC_V: TStringField
      DisplayLabel = 'Tipo Doc Venda'
      FieldName = 'TP_DOC_V'
      Size = 6
    end
    object cdsPrestVALOR_C: TFloatField
      DisplayLabel = 'Valor Credito'
      FieldName = 'VALOR_C'
      DisplayFormat = '##0.00'
    end
    object cdsPrestLOTE_CXL: TIntegerField
      DisplayLabel = 'Lote Cxl'
      FieldName = 'LOTE_CXL'
    end
    object cdsPrestTP_REC_CXL: TStringField
      DisplayLabel = 'Tp Rec P/T'
      FieldName = 'TP_REC_CXL'
      FixedChar = True
      Size = 1
    end
    object cdsPrestPRCSS: TStringField
      DisplayLabel = 'Prcss'
      FieldName = 'PRCSS'
      FixedChar = True
      Size = 1
    end
    object cdsPrestHISTORICO_C: TStringField
      FieldName = 'HISTORICO_C'
      Size = 100
    end
  end
  object dsPrest: TDataSource
    DataSet = cdsPrest
    Left = 613
    Top = 417
  end
  object qrSumFp: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      
        'select fp.cod_controle, ct.nome_ctrl, sum(fp.valordoc) soma from' +
        ' controles ct'
      
        'inner join formpagamento fp on fp.cod_controle = ct.codigo_ctrl ' +
        'and'
      'fp.cod_empresa = ct.codigo_emp'
      'group by fp.cod_controle, ct.nome_ctrl')
    Left = 677
    Top = 273
  end
  object dspSumFp: TDataSetProvider
    DataSet = qrSumFp
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 677
    Top = 321
  end
  object cdsSumFp: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSumFp'
    BeforeOpen = cdsPDVBeforeOpen
    Left = 677
    Top = 369
    object cdsSumFpCOD_CONTROLE: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_CONTROLE'
    end
    object cdsSumFpNOME_CTRL: TStringField
      DisplayLabel = 'Controle'
      FieldName = 'NOME_CTRL'
      Size = 35
    end
    object cdsSumFpSOMA: TFloatField
      DisplayLabel = 'Soma'
      FieldName = 'SOMA'
      DisplayFormat = '##0.00'
    end
    object cdsSumFpSOMA2: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'SOMA2'
    end
    object cdsSumFpNAO_GERA_FINAN: TStringField
      FieldName = 'NAO_GERA_FINAN'
      Size = 1
    end
    object cdsSumFpSOMA_CONTABIL: TFloatField
      FieldName = 'SOMA_CONTABIL'
    end
  end
  object dsSumFp: TDataSource
    DataSet = cdsSumFp
    Left = 677
    Top = 417
  end
  object qrFecDCxl: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select * from fecd_cxl fd')
    Left = 749
    Top = 273
  end
  object dspFecDCxl: TDataSetProvider
    DataSet = qrFecDCxl
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 749
    Top = 321
  end
  object cdsFecDCxl: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFecDCxl'
    BeforeOpen = cdsPDVBeforeOpen
    Left = 749
    Top = 369
    object cdsFecDCxlN_MOV_CXL: TIntegerField
      FieldName = 'N_MOV_CXL'
      Required = True
    end
    object cdsFecDCxlDIA_F_CXL: TDateTimeField
      FieldName = 'DIA_F_CXL'
      Required = True
    end
    object cdsFecDCxlTOT_E_CXL: TFloatField
      FieldName = 'TOT_E_CXL'
    end
    object cdsFecDCxlTOT_S_CXL: TFloatField
      FieldName = 'TOT_S_CXL'
    end
    object cdsFecDCxlSALDO_CXL: TFloatField
      FieldName = 'SALDO_CXL'
    end
    object cdsFecDCxlSTATUS_CXL: TStringField
      FieldName = 'STATUS_CXL'
      FixedChar = True
      Size = 10
    end
    object cdsFecDCxlOP_CXL: TIntegerField
      FieldName = 'OP_CXL'
      Required = True
    end
    object cdsFecDCxlCODIGO_EMP: TIntegerField
      FieldName = 'CODIGO_EMP'
      Required = True
    end
  end
  object qrPCont: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select * from P_CONTAS')
    Left = 829
    Top = 273
  end
  object dspPCont: TDataSetProvider
    DataSet = qrPCont
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 829
    Top = 321
  end
  object cdsPCont: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPCont'
    BeforeOpen = cdsPDVBeforeOpen
    Left = 829
    Top = 369
    object cdsPContTIPO_PLC: TStringField
      FieldName = 'TIPO_PLC'
      FixedChar = True
      Size = 1
    end
    object cdsPContN_CONTA_PLC: TFloatField
      FieldName = 'N_CONTA_PLC'
    end
    object cdsPContGRUP_CT: TIntegerField
      FieldName = 'GRUP_CT'
      Required = True
    end
    object cdsPContDESC_PLC: TStringField
      FieldName = 'DESC_PLC'
      Required = True
      FixedChar = True
      Size = 30
    end
    object cdsPContSIGLA_PLC: TStringField
      FieldName = 'SIGLA_PLC'
      FixedChar = True
      Size = 6
    end
    object cdsPContDATA_CAD_PC: TDateTimeField
      FieldName = 'DATA_CAD_PC'
    end
    object cdsPContDATA_MOD_PC: TDateTimeField
      FieldName = 'DATA_MOD_PC'
    end
    object cdsPContTIPO_CTP: TStringField
      FieldName = 'TIPO_CTP'
      FixedChar = True
      Size = 1
    end
    object cdsPContDESC_PADR: TStringField
      FieldName = 'DESC_PADR'
      FixedChar = True
      Size = 30
    end
    object cdsPContCOD_SUB_CT: TIntegerField
      FieldName = 'COD_SUB_CT'
      Required = True
    end
    object cdsPContATIVO: TIntegerField
      FieldName = 'ATIVO'
    end
    object cdsPContSTHAB: TStringField
      FieldName = 'STHAB'
      FixedChar = True
      Size = 1
    end
    object cdsPContCODSEQ_BALANCO: TIntegerField
      FieldName = 'CODSEQ_BALANCO'
    end
    object cdsPContTP_VEICULOS: TStringField
      FieldName = 'TP_VEICULOS'
      Size = 1
    end
    object cdsPContTPRAT: TStringField
      FieldName = 'TPRAT'
      FixedChar = True
      Size = 1
    end
  end
  object qrCh: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select * from CONTROLE_CHEQUE')
    Left = 917
    Top = 273
  end
  object dspCh: TDataSetProvider
    DataSet = qrCh
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 917
    Top = 321
  end
  object cdsCh: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCh'
    BeforeOpen = cdsPDVBeforeOpen
    Left = 917
    Top = 369
    object cdsChCODIGO_CH: TIntegerField
      FieldName = 'CODIGO_CH'
      Required = True
    end
    object cdsChN_CONTA_PLC: TFloatField
      FieldName = 'N_CONTA_PLC'
    end
    object cdsChCODIGO_CTRL: TIntegerField
      FieldName = 'CODIGO_CTRL'
      Required = True
    end
    object cdsChCOD_CLIENTE: TIntegerField
      FieldName = 'COD_CLIENTE'
    end
    object cdsChNOME_CH: TStringField
      FieldName = 'NOME_CH'
      Size = 35
    end
    object cdsChDATA_REC: TDateTimeField
      FieldName = 'DATA_REC'
    end
    object cdsChN_CH: TStringField
      FieldName = 'N_CH'
      FixedChar = True
    end
    object cdsChDATA_VENC: TDateTimeField
      FieldName = 'DATA_VENC'
    end
    object cdsChVALOR_CH: TFloatField
      FieldName = 'VALOR_CH'
    end
    object cdsChSTATUS_CH: TStringField
      FieldName = 'STATUS_CH'
      FixedChar = True
      Size = 10
    end
    object cdsChDATQ_CH: TDateTimeField
      FieldName = 'DATQ_CH'
    end
    object cdsChNATL_CH: TStringField
      FieldName = 'NATL_CH'
      FixedChar = True
      Size = 1
    end
    object cdsChCOD_CLI: TStringField
      FieldName = 'COD_CLI'
      Size = 60
    end
    object cdsChOBS_CH: TStringField
      FieldName = 'OBS_CH'
      Size = 60
    end
    object cdsChLOTE: TIntegerField
      FieldName = 'LOTE'
    end
    object cdsChTP_DOC_V: TStringField
      FieldName = 'TP_DOC_V'
      FixedChar = True
      Size = 6
    end
    object cdsChN_DOC_V: TIntegerField
      FieldName = 'N_DOC_V'
    end
    object cdsChSELEC: TStringField
      FieldName = 'SELEC'
      FixedChar = True
      Size = 1
    end
    object cdsChAGENCIA: TStringField
      FieldName = 'AGENCIA'
      Size = 10
    end
    object cdsChCONTA: TStringField
      FieldName = 'CONTA'
      Size = 15
    end
    object cdsChBANCO: TStringField
      FieldName = 'BANCO'
      Size = 35
    end
    object cdsChCOD_CLI_TERC: TIntegerField
      FieldName = 'COD_CLI_TERC'
    end
    object cdsChNOME_TERC: TStringField
      FieldName = 'NOME_TERC'
      Size = 35
    end
    object cdsChTIP_CNT: TStringField
      FieldName = 'TIP_CNT'
      FixedChar = True
      Size = 1
    end
    object cdsChDATA_CXL: TDateTimeField
      FieldName = 'DATA_CXL'
    end
    object cdsChCODIGO_VEND: TIntegerField
      FieldName = 'CODIGO_VEND'
    end
    object cdsChTIP_BAIXA: TStringField
      FieldName = 'TIP_BAIXA'
      FixedChar = True
      Size = 1
    end
    object cdsChDATA_REM_REC: TDateTimeField
      FieldName = 'DATA_REM_REC'
    end
    object cdsChCOD_TERM: TIntegerField
      FieldName = 'COD_TERM'
    end
    object cdsChHISTORICO_CH: TStringField
      FieldName = 'HISTORICO_CH'
      Size = 30
    end
    object cdsChDATA_VENDA: TDateTimeField
      FieldName = 'DATA_VENDA'
    end
    object cdsChVALOR_CORR: TFloatField
      FieldName = 'VALOR_CORR'
    end
    object cdsChVALOR_DESC: TFloatField
      FieldName = 'VALOR_DESC'
    end
    object cdsChLOTE_QUIT: TIntegerField
      FieldName = 'LOTE_QUIT'
    end
    object cdsChLOTE_ENT: TIntegerField
      FieldName = 'LOTE_ENT'
    end
    object cdsChCODIGO_EMP: TIntegerField
      FieldName = 'CODIGO_EMP'
      Required = True
    end
    object cdsChCPFCGC: TStringField
      FieldName = 'CPFCGC'
      FixedChar = True
      Size = 18
    end
    object cdsChCOD_EMP_MULT: TIntegerField
      FieldName = 'COD_EMP_MULT'
    end
    object cdsChNUM_NOTA: TIntegerField
      FieldName = 'NUM_NOTA'
    end
    object cdsChNREQ: TIntegerField
      FieldName = 'NREQ'
    end
    object cdsChN_OS: TIntegerField
      FieldName = 'N_OS'
    end
    object cdsChNCOMANDO: TIntegerField
      FieldName = 'NCOMANDO'
    end
    object cdsChNGRP: TIntegerField
      FieldName = 'NGRP'
    end
    object cdsChDT_BAIXA_COMISSAO: TDateTimeField
      FieldName = 'DT_BAIXA_COMISSAO'
    end
    object cdsChVL_BAIXA_COMISSAO: TFloatField
      FieldName = 'VL_BAIXA_COMISSAO'
    end
    object cdsChDATA_PREV_REC: TDateTimeField
      FieldName = 'DATA_PREV_REC'
    end
    object cdsChDTORIGINAL_CH: TDateTimeField
      FieldName = 'DTORIGINAL_CH'
    end
    object cdsChRAZAO: TStringField
      FieldName = 'RAZAO'
      Size = 60
    end
    object cdsChID_BANCO: TStringField
      FieldName = 'ID_BANCO'
      Size = 11
    end
    object cdsChVL_BAIXA_COMISSAO_GER: TFloatField
      FieldName = 'VL_BAIXA_COMISSAO_GER'
    end
    object cdsChUS_CAD: TIntegerField
      FieldName = 'US_CAD'
    end
    object cdsChVL_CONTABIL: TFloatField
      FieldName = 'VL_CONTABIL'
    end
    object cdsChCOD_EMP_LOTE: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Emp Lote'
      FieldName = 'COD_EMP_LOTE'
    end
  end
  object qrLoteCxl: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select * from LOTE_CXL')
    Left = 997
    Top = 273
  end
  object dspLoteCxl: TDataSetProvider
    DataSet = qrLoteCxl
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 997
    Top = 321
  end
  object cdsLoteCxl: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspLoteCxl'
    BeforeOpen = cdsPDVBeforeOpen
    Left = 997
    Top = 369
    object cdsLoteCxlN_LOTE_CXL: TIntegerField
      FieldName = 'N_LOTE_CXL'
      Required = True
    end
    object cdsLoteCxlCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsLoteCxlDATA_L_CXL: TDateTimeField
      FieldName = 'DATA_L_CXL'
    end
    object cdsLoteCxlCODIGO_EMP: TIntegerField
      FieldName = 'CODIGO_EMP'
    end
    object cdsLoteCxlSELEC: TStringField
      FieldName = 'SELEC'
      FixedChar = True
      Size = 1
    end
    object cdsLoteCxlDATA_CXL_QUIT: TDateTimeField
      FieldName = 'DATA_CXL_QUIT'
    end
    object cdsLoteCxlOP_CXL: TIntegerField
      FieldName = 'OP_CXL'
    end
    object cdsLoteCxlATIVO: TIntegerField
      FieldName = 'ATIVO'
    end
  end
  object qrFpg2: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select * from FORMPAGAMENTO')
    Left = 29
    Top = 441
  end
  object dspFpg2: TDataSetProvider
    DataSet = qrFpg2
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 29
    Top = 489
  end
  object cdsFpg2: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFpg2'
    BeforeOpen = cdsPDVBeforeOpen
    Left = 29
    Top = 537
  end
  object qrLanc: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select * from lancamentos')
    Left = 1088
    Top = 272
  end
  object dspLanc: TDataSetProvider
    DataSet = qrLanc
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1085
    Top = 328
  end
  object cdsLanc: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspLanc'
    BeforeOpen = cdsPDVBeforeOpen
    Left = 1085
    Top = 376
  end
  object qrVndRec: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      
        'select 1 id, '#39'Venda '#39'||rtrim(tipo)||'#39' N'#186' '#39'||(select result from ' +
        'strzero(nped, 6)) tp,'
      'nped,'
      'tipo,'
      'valor_total,'
      'data_fech'
      'from pedvenda'
      
        'where data_fech >= :dataIni and data_fech <= :dataFim and status' +
        '_ped = '#39'FECHADA'#39' and cod_empresa = :cod_empresa'
      'union'
      
        'select 2 id, '#39'Recibo N'#186' '#39'||(select result from strzero(nrecibo, ' +
        '6)) tp,'
      'nrecibo,'
      #39'REC'#39','
      'valor_orig,'
      'data_rec'
      
        'from recibos where data_rec >= :dataIni and  data_rec <= :dataFi' +
        'm and COD_EMPRESA = :cod_empresa'
      'order by 1 asc, 3 asc')
    Left = 848
    Top = 168
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
        Name = 'cod_empresa'
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
    object qrVndRecID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = []
    end
    object qrVndRecTP: TIBStringField
      FieldName = 'TP'
      ProviderFlags = []
      Size = 140
    end
    object qrVndRecNPED: TIntegerField
      FieldName = 'NPED'
      Origin = '"PEDVENDA"."NPED"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrVndRecTIPO: TIBStringField
      FieldName = 'TIPO'
      Origin = '"PEDVENDA"."TIPO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 3
    end
    object qrVndRecVALOR_TOTAL: TFloatField
      FieldName = 'VALOR_TOTAL'
      Origin = '"PEDVENDA"."VALOR_TOTAL"'
      DisplayFormat = '##0.00'
    end
    object qrVndRecDATA_FECH: TDateTimeField
      FieldName = 'DATA_FECH'
      Origin = '"PEDVENDA"."DATA_FECH"'
    end
  end
  object qrFpVndRec: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      
        'select c.codigo_ctrl,c.nome_ctrl, sum(fp.valordoc) SOMA from for' +
        'mpagamento fp'
      
        'inner join controles c on c.codigo_ctrl = fp.cod_controle and c.' +
        'codigo_emp = fp.cod_empresa'
      
        'where nrequisicao = :nrequisicao and tpdocs = :tpdocs and cod_Em' +
        'presa = :cod_empresa'
      'group by 1, 2')
    Left = 848
    Top = 216
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'nrequisicao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'tpdocs'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cod_empresa'
        ParamType = ptUnknown
      end>
    object qrFpVndRecCODIGO_CTRL: TIntegerField
      FieldName = 'CODIGO_CTRL'
      Origin = '"CONTROLES"."CODIGO_CTRL"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrFpVndRecNOME_CTRL: TIBStringField
      FieldName = 'NOME_CTRL'
      Origin = '"CONTROLES"."NOME_CTRL"'
      Size = 35
    end
    object qrFpVndRecSOMA: TFloatField
      FieldName = 'SOMA'
      ProviderFlags = []
      DisplayFormat = '##0.00'
    end
  end
  object qrLanca: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      
        'select l.cod_lanc,l.data,l.tipo_l,l.n_conta_plc,l.codigo_ctrl,c.' +
        'nome_ctrl,l.ndoc_l,'
      
        'l.historico_l,l.valor_l ,l.status_l,l.datq_l,l.natl,L.dia_fcd,l.' +
        'nmov,l.lote,l.codigo_emp,'
      
        'l.tip_cnt,l.data_cxl,l.lanc_venda,l.data_rem_rec,l.tp_mod,l.cod_' +
        'term,'
      
        'l.dt_compensado,l.nominal_l,l.n_cheq_l,l.vl_contabil,l.lote_ent,' +
        'l.cod_Emp_mult,l.op_cxl,l.dtreferencia,l.cod_ocorrencia,l.data_o' +
        'correncia from Lancamentos l,controles c where '
      'l.cod_lanc = -1 ')
    Left = 272
    Top = 440
  end
  object dspLanca: TDataSetProvider
    DataSet = qrLanca
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 269
    Top = 488
  end
  object cdsLanca: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspLancamentos'
    BeforeOpen = cdsPDVBeforeOpen
    Left = 269
    Top = 544
    object IntegerField30: TIntegerField
      FieldName = 'COD_LANC'
      Required = True
    end
    object DateTimeField14: TDateTimeField
      FieldName = 'DATA'
    end
    object StringField23: TStringField
      FieldName = 'TIPO_L'
      FixedChar = True
      Size = 1
    end
    object FloatField8: TFloatField
      FieldName = 'N_CONTA_PLC'
    end
    object IntegerField31: TIntegerField
      FieldName = 'CODIGO_CTRL'
      Required = True
    end
    object StringField24: TStringField
      FieldName = 'NOME_CTRL'
      Size = 35
    end
    object StringField25: TStringField
      FieldName = 'NDOC_L'
      FixedChar = True
      Size = 10
    end
    object StringField26: TStringField
      FieldName = 'HISTORICO_L'
      FixedChar = True
      Size = 60
    end
    object FloatField9: TFloatField
      FieldName = 'VALOR_L'
    end
    object StringField27: TStringField
      FieldName = 'STATUS_L'
      FixedChar = True
      Size = 10
    end
    object DateTimeField15: TDateTimeField
      FieldName = 'DATQ_L'
    end
    object StringField28: TStringField
      FieldName = 'NATL'
      FixedChar = True
      Size = 1
    end
    object DateTimeField16: TDateTimeField
      FieldName = 'DIA_FCD'
    end
    object IntegerField32: TIntegerField
      FieldName = 'NMOV'
    end
    object IntegerField33: TIntegerField
      FieldName = 'LOTE'
    end
    object IntegerField34: TIntegerField
      FieldName = 'CODIGO_EMP'
      Required = True
    end
    object StringField29: TStringField
      FieldName = 'TIP_CNT'
      FixedChar = True
      Size = 1
    end
    object DateTimeField17: TDateTimeField
      FieldName = 'DATA_CXL'
    end
    object StringField30: TStringField
      FieldName = 'LANC_VENDA'
      FixedChar = True
      Size = 1
    end
    object DateTimeField18: TDateTimeField
      FieldName = 'DATA_REM_REC'
    end
    object StringField31: TStringField
      FieldName = 'TP_MOD'
      FixedChar = True
      Size = 1
    end
    object IntegerField35: TIntegerField
      FieldName = 'COD_TERM'
    end
    object DateTimeField19: TDateTimeField
      FieldName = 'DT_COMPENSADO'
    end
    object StringField32: TStringField
      FieldName = 'NOMINAL_L'
      FixedChar = True
      Size = 35
    end
    object StringField33: TStringField
      FieldName = 'N_CHEQ_L'
      FixedChar = True
      Size = 10
    end
    object FloatField10: TFloatField
      FieldName = 'VL_CONTABIL'
    end
    object IntegerField36: TIntegerField
      FieldName = 'LOTE_ENT'
    end
    object IntegerField37: TIntegerField
      FieldName = 'COD_EMP_MULT'
    end
    object IntegerField38: TIntegerField
      FieldName = 'OP_CXL'
    end
    object DateTimeField20: TDateTimeField
      FieldName = 'DTREFERENCIA'
    end
    object IntegerField39: TIntegerField
      FieldName = 'COD_OCORRENCIA'
    end
    object DateField1: TDateField
      FieldName = 'DATA_OCORRENCIA'
    end
  end
  object qrLancQuit: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      
        'Select l.*,ctr.nome_ctrl from lancamentos l, controles ctr where' +
        ' '
      'l.codigo_ctrl = ctr.codigo_ctrl and l.lote_ent = :vlote '
      
        'and l.codigo_emp = ctr.codigo_emp and l.codigo_emp = :cod_empres' +
        'a')
    Left = 968
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'vlote'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cod_empresa'
        ParamType = ptUnknown
      end>
  end
  object qrChQuit: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    Left = 968
    Top = 56
  end
  object IBQuery3: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    Left = 968
    Top = 112
  end
  object qrRelQuitarCreditos: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      
        'SELECT C.COD_COBREBEM, CR.NOME_CTRL, C.BANCO , C.CODIGOAGENCIA, ' +
        'C.NUMEROCONTACORRENTE, C.CODIGOCEDENTE,'
      'C.DESCRICAO, CC.* FROM CONTROLE_CREDITOS CC'
      
        'INNER JOIN BOLETAS B ON B.NOSSO_NUMERO_BANCO = CC.NOSSO_NUMERO_B' +
        'ANCO AND B.N_DOC_BOL = CC.N_DOC_C AND B.COD_EMPRESA = CC.CODIGO_' +
        'EMP'
      
        'INNER JOIN COBREBEM C ON C.COD_COBREBEM = B.COD_COBREBEM AND C.C' +
        'OD_EMPRESA = B.COD_EMPRESA'
      
        'INNER JOIN CONTROLES CR ON CR.CODIGO_CTRL = C.CODIGO_CTRL AND CR' +
        '.CODIGO_EMP =  C.COD_EMPRESA')
    Left = 691
    Top = 64
  end
  object dspRelQuitarCreditos: TDataSetProvider
    DataSet = qrRelQuitarCreditos
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 690
    Top = 114
  end
  object cdsRelQuitarCreditos: TClientDataSet
    Aggregates = <>
    AutoCalcFields = False
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspRelQuitarCreditos'
    BeforeOpen = cdsRelQuitarCreditosBeforeOpen
    Left = 694
    Top = 161
    object cdsRelQuitarCreditosCOD_COBREBEM: TIntegerField
      FieldName = 'COD_COBREBEM'
      Required = True
    end
    object cdsRelQuitarCreditosNOME_CTRL: TStringField
      FieldName = 'NOME_CTRL'
      Size = 35
    end
    object cdsRelQuitarCreditosBANCO: TStringField
      FieldName = 'BANCO'
      FixedChar = True
      Size = 3
    end
    object cdsRelQuitarCreditosCODIGOAGENCIA: TStringField
      FieldName = 'CODIGOAGENCIA'
    end
    object cdsRelQuitarCreditosNUMEROCONTACORRENTE: TStringField
      FieldName = 'NUMEROCONTACORRENTE'
    end
    object cdsRelQuitarCreditosCODIGOCEDENTE: TStringField
      FieldName = 'CODIGOCEDENTE'
    end
    object cdsRelQuitarCreditosDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object cdsRelQuitarCreditosCOD_CRED: TIntegerField
      FieldName = 'COD_CRED'
      Required = True
    end
    object cdsRelQuitarCreditosN_SEQ_BOL: TIntegerField
      FieldName = 'N_SEQ_BOL'
    end
    object cdsRelQuitarCreditosN_CONTA_PLC: TFloatField
      FieldName = 'N_CONTA_PLC'
    end
    object cdsRelQuitarCreditosCODIGO_CTRL: TIntegerField
      FieldName = 'CODIGO_CTRL'
      Required = True
    end
    object cdsRelQuitarCreditosCOD_CLIENTE: TIntegerField
      FieldName = 'COD_CLIENTE'
    end
    object cdsRelQuitarCreditosN_DUPL_C: TIntegerField
      FieldName = 'N_DUPL_C'
    end
    object cdsRelQuitarCreditosNOME_C: TStringField
      FieldName = 'NOME_C'
      Size = 35
    end
    object cdsRelQuitarCreditosDATA_REC_C: TDateTimeField
      FieldName = 'DATA_REC_C'
    end
    object cdsRelQuitarCreditosTIPO_DOC_C: TStringField
      FieldName = 'TIPO_DOC_C'
      FixedChar = True
      Size = 15
    end
    object cdsRelQuitarCreditosHISTORICO_C: TStringField
      FieldName = 'HISTORICO_C'
      Size = 100
    end
    object cdsRelQuitarCreditosDATA_VENC_C: TDateTimeField
      FieldName = 'DATA_VENC_C'
    end
    object cdsRelQuitarCreditosVALOR_C: TFloatField
      FieldName = 'VALOR_C'
    end
    object cdsRelQuitarCreditosSTATUS_C: TStringField
      FieldName = 'STATUS_C'
      FixedChar = True
      Size = 10
    end
    object cdsRelQuitarCreditosDATQ_C: TDateTimeField
      FieldName = 'DATQ_C'
    end
    object cdsRelQuitarCreditosNATL_C: TStringField
      FieldName = 'NATL_C'
      FixedChar = True
      Size = 1
    end
    object cdsRelQuitarCreditosLOTE: TIntegerField
      FieldName = 'LOTE'
    end
    object cdsRelQuitarCreditosOBS_C: TStringField
      FieldName = 'OBS_C'
      Size = 60
    end
    object cdsRelQuitarCreditosTP_DOC_V: TStringField
      FieldName = 'TP_DOC_V'
      FixedChar = True
      Size = 6
    end
    object cdsRelQuitarCreditosN_DOC_V: TIntegerField
      FieldName = 'N_DOC_V'
    end
    object cdsRelQuitarCreditosN_DOC_C: TStringField
      FieldName = 'N_DOC_C'
      FixedChar = True
    end
    object cdsRelQuitarCreditosSELEC: TStringField
      FieldName = 'SELEC'
      FixedChar = True
      Size = 1
    end
    object cdsRelQuitarCreditosCOD_CLI_TERC: TIntegerField
      FieldName = 'COD_CLI_TERC'
    end
    object cdsRelQuitarCreditosNOME_TERC: TStringField
      FieldName = 'NOME_TERC'
      Size = 35
    end
    object cdsRelQuitarCreditosTIP_CNT: TStringField
      FieldName = 'TIP_CNT'
      FixedChar = True
      Size = 1
    end
    object cdsRelQuitarCreditosDATA_CXL: TDateTimeField
      FieldName = 'DATA_CXL'
    end
    object cdsRelQuitarCreditosCODIGO_VEND: TIntegerField
      FieldName = 'CODIGO_VEND'
    end
    object cdsRelQuitarCreditosTIP_BAIXA: TStringField
      FieldName = 'TIP_BAIXA'
      FixedChar = True
      Size = 1
    end
    object cdsRelQuitarCreditosDATA_REM_REC: TDateTimeField
      FieldName = 'DATA_REM_REC'
    end
    object cdsRelQuitarCreditosCOD_TERM: TIntegerField
      FieldName = 'COD_TERM'
    end
    object cdsRelQuitarCreditosDATA_BAIXA: TDateTimeField
      FieldName = 'DATA_BAIXA'
    end
    object cdsRelQuitarCreditosDATA_VENDA: TDateTimeField
      FieldName = 'DATA_VENDA'
    end
    object cdsRelQuitarCreditosVALOR_CORR: TFloatField
      FieldName = 'VALOR_CORR'
    end
    object cdsRelQuitarCreditosCODIGO_FUNC: TIntegerField
      FieldName = 'CODIGO_FUNC'
    end
    object cdsRelQuitarCreditosVALOR_DESC: TFloatField
      FieldName = 'VALOR_DESC'
    end
    object cdsRelQuitarCreditosVALOR_ACRESC: TFloatField
      FieldName = 'VALOR_ACRESC'
    end
    object cdsRelQuitarCreditosLOTE_QUIT: TIntegerField
      FieldName = 'LOTE_QUIT'
    end
    object cdsRelQuitarCreditosLOTE_ENT: TIntegerField
      FieldName = 'LOTE_ENT'
    end
    object cdsRelQuitarCreditosDIA_CXL: TDateTimeField
      FieldName = 'DIA_CXL'
    end
    object cdsRelQuitarCreditosSTATUS_CXL_RQ: TStringField
      FieldName = 'STATUS_CXL_RQ'
      FixedChar = True
      Size = 1
    end
    object cdsRelQuitarCreditosVL_RQ_PG_CXL: TFloatField
      FieldName = 'VL_RQ_PG_CXL'
    end
    object cdsRelQuitarCreditosOP_CXL: TIntegerField
      FieldName = 'OP_CXL'
    end
    object cdsRelQuitarCreditosCPFCGC: TStringField
      FieldName = 'CPFCGC'
      FixedChar = True
      Size = 18
    end
    object cdsRelQuitarCreditosLOTE_CXL: TIntegerField
      FieldName = 'LOTE_CXL'
    end
    object cdsRelQuitarCreditosTP_REC_CXL: TStringField
      FieldName = 'TP_REC_CXL'
      FixedChar = True
      Size = 1
    end
    object cdsRelQuitarCreditosPRCSS: TStringField
      FieldName = 'PRCSS'
      FixedChar = True
      Size = 1
    end
    object cdsRelQuitarCreditosJUROS_COB: TFloatField
      FieldName = 'JUROS_COB'
    end
    object cdsRelQuitarCreditosCOD_IT_CARTAS: TIntegerField
      FieldName = 'COD_IT_CARTAS'
    end
    object cdsRelQuitarCreditosDT_REG_CARTAS: TDateTimeField
      FieldName = 'DT_REG_CARTAS'
    end
    object cdsRelQuitarCreditosCOD_CARTA: TIntegerField
      FieldName = 'COD_CARTA'
    end
    object cdsRelQuitarCreditosN_AUT_CART: TStringField
      FieldName = 'N_AUT_CART'
      FixedChar = True
    end
    object cdsRelQuitarCreditosCOD_FATURAMENTO: TIntegerField
      FieldName = 'COD_FATURAMENTO'
    end
    object cdsRelQuitarCreditosLOTE_NEG: TIntegerField
      FieldName = 'LOTE_NEG'
    end
    object cdsRelQuitarCreditosDATA_LOTE_NEG: TDateTimeField
      FieldName = 'DATA_LOTE_NEG'
    end
    object cdsRelQuitarCreditosCODIGO_EMP: TIntegerField
      FieldName = 'CODIGO_EMP'
      Required = True
    end
    object cdsRelQuitarCreditosCOD_EMP_MULT: TIntegerField
      FieldName = 'COD_EMP_MULT'
    end
    object cdsRelQuitarCreditosNUM_NOTA: TIntegerField
      FieldName = 'NUM_NOTA'
    end
    object cdsRelQuitarCreditosNREQ: TIntegerField
      FieldName = 'NREQ'
    end
    object cdsRelQuitarCreditosN_OS: TIntegerField
      FieldName = 'N_OS'
    end
    object cdsRelQuitarCreditosNCOMANDO: TIntegerField
      FieldName = 'NCOMANDO'
    end
    object cdsRelQuitarCreditosNGRP: TIntegerField
      FieldName = 'NGRP'
    end
    object cdsRelQuitarCreditosCOONAOFISCAL: TIntegerField
      FieldName = 'COONAOFISCAL'
    end
    object cdsRelQuitarCreditosNOSSO_NUMERO_BANCO: TStringField
      FieldName = 'NOSSO_NUMERO_BANCO'
    end
    object cdsRelQuitarCreditosTAXA_COBRANCA: TFloatField
      FieldName = 'TAXA_COBRANCA'
    end
    object cdsRelQuitarCreditosUS_CANCELOU: TStringField
      FieldName = 'US_CANCELOU'
      Size = 10
    end
    object cdsRelQuitarCreditosDT_US_CANCELOU: TDateTimeField
      FieldName = 'DT_US_CANCELOU'
    end
    object cdsRelQuitarCreditosOBS_PARACREDITO: TStringField
      FieldName = 'OBS_PARACREDITO'
      Size = 50
    end
    object cdsRelQuitarCreditosDTORIGINAL_C: TDateTimeField
      FieldName = 'DTORIGINAL_C'
    end
    object cdsRelQuitarCreditosDATA_PREV_REC: TDateTimeField
      FieldName = 'DATA_PREV_REC'
    end
    object cdsRelQuitarCreditosDEPENDENTE: TStringField
      FieldName = 'DEPENDENTE'
      Size = 35
    end
    object cdsRelQuitarCreditosNSERIEECF: TStringField
      FieldName = 'NSERIEECF'
    end
    object cdsRelQuitarCreditosCOD_TERMINAL: TIntegerField
      FieldName = 'COD_TERMINAL'
    end
    object cdsRelQuitarCreditosCOD_COBREBEM1: TIntegerField
      FieldName = 'COD_COBREBEM1'
    end
    object cdsRelQuitarCreditosRAZAO: TStringField
      FieldName = 'RAZAO'
      Size = 60
    end
    object cdsRelQuitarCreditosDATA_RETORNO_QUITACAO: TDateTimeField
      FieldName = 'DATA_RETORNO_QUITACAO'
    end
    object cdsRelQuitarCreditosOCORRENCIABANCARIA: TMemoField
      FieldName = 'OCORRENCIABANCARIA'
      BlobType = ftMemo
      Size = 8
    end
    object cdsRelQuitarCreditosVALOR_ORIGINAL: TFloatField
      FieldName = 'VALOR_ORIGINAL'
    end
    object cdsRelQuitarCreditosVALOR_LIQUIDO: TFloatField
      FieldName = 'VALOR_LIQUIDO'
    end
    object cdsRelQuitarCreditosSTATUS_CX: TStringField
      FieldName = 'STATUS_CX'
      FixedChar = True
      Size = 1
    end
    object cdsRelQuitarCreditosOP_CX: TIntegerField
      FieldName = 'OP_CX'
    end
    object cdsRelQuitarCreditosIDCARNE: TIntegerField
      FieldName = 'IDCARNE'
    end
  end
  object qrContasBanc: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select cb.*, c.nome_cliente from contasbancarias cb'
      
        'inner join clientes c on c.cod_cliente = cb.cod_cliente and c.co' +
        'd_empresa = cb.cod_empresa'
      'where cb.cod_cliente = 0 and cb.cod_empresa = 0')
    Left = 373
    Top = 440
  end
  object dspContasBanc: TDataSetProvider
    DataSet = qrContasBanc
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 373
    Top = 488
  end
  object cdsContasBanc: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspContasBanc'
    BeforeOpen = cdsPDVBeforeOpen
    Left = 373
    Top = 536
    object cdsContasBancCOD_CLIENTE: TIntegerField
      DisplayLabel = 'Cod Cliente'
      FieldName = 'COD_CLIENTE'
      Required = True
    end
    object cdsContasBancNOME_CLIENTE: TStringField
      DisplayLabel = 'Nome Cliente'
      FieldName = 'NOME_CLIENTE'
      Required = True
      Size = 35
    end
    object cdsContasBancAGENCIA: TStringField
      DisplayLabel = 'Ag'#234'ncia'
      FieldName = 'AGENCIA'
      Required = True
      Size = 10
    end
    object cdsContasBancCONTA: TStringField
      DisplayLabel = 'Conta'
      FieldName = 'CONTA'
      Required = True
      Size = 15
    end
    object cdsContasBancCODBANCO: TStringField
      DisplayLabel = 'Codigo Banco'
      FieldName = 'CODBANCO'
      Size = 11
    end
    object cdsContasBancBANCO: TStringField
      DisplayLabel = 'Banco'
      FieldName = 'BANCO'
      Required = True
      Size = 35
    end
    object cdsContasBancCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsContasBancATIVO: TIntegerField
      FieldName = 'ATIVO'
    end
  end
  object dsContasBanc: TDataSource
    DataSet = cdsContasBanc
    Left = 373
    Top = 584
  end
  object qrTermCartao: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      
        'select tc.* from terminal_cartao tc where tc.cod_empresa = :cod_' +
        'empresa and tc.ativo = 1')
    Left = 101
    Top = 440
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cod_empresa'
        ParamType = ptUnknown
      end>
  end
  object dspTermCartao: TDataSetProvider
    DataSet = qrTermCartao
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 101
    Top = 488
  end
  object cdsTermCartao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTermCartao'
    BeforeOpen = cdsPDVBeforeOpen
    Left = 101
    Top = 536
    object cdsTermCartaoCOD_TERM_ADM: TStringField
      FieldName = 'COD_TERM_ADM'
      Required = True
      Size = 10
    end
    object cdsTermCartaoCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsTermCartaoCOD_ADM: TIntegerField
      FieldName = 'COD_ADM'
      Required = True
    end
    object cdsTermCartaoCOD_TERMINALF: TIntegerField
      FieldName = 'COD_TERMINALF'
    end
    object cdsTermCartaoDESC_TERM_ADM: TStringField
      FieldName = 'DESC_TERM_ADM'
      Size = 30
    end
  end
  object dsTermCartao: TDataSource
    DataSet = cdsTermCartao
    Left = 101
    Top = 584
  end
  object qrNegativacao: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    Left = 1032
    Top = 8
  end
  object qrEmpresasUnificadas: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = dtmAtivo.IbTransCol
    SQL.Strings = (
      
        'select emp.cod_empresa, (emp.identificacao_emp ||'#39' - '#39'|| emp.cnp' +
        'j_emp) identificacao_emp from empresa emp'
      'where emp.cod_empresa in (1)')
    Left = 1117
  end
  object dspEmpresasUnificadas: TDataSetProvider
    DataSet = qrEmpresasUnificadas
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1117
    Top = 56
  end
  object cdsEmpresasUnificadas: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspEmpresasUnificadas'
    BeforeOpen = cdsPDVBeforeOpen
    Left = 1117
    Top = 104
    object cdsEmpresasUnificadasCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsEmpresasUnificadasIDENTIFICACAO_EMP: TStringField
      FieldName = 'IDENTIFICACAO_EMP'
      Size = 85
    end
  end
  object dsEmpresasUnificadas: TDataSource
    DataSet = cdsEmpresasUnificadas
    Left = 1117
    Top = 160
  end
  object IBDatabaseUnificada: TIBDatabase
    Params.Strings = (
      'user_name=sysdba'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = IBTransactionUnificada
    Left = 1240
    Top = 3
  end
  object qrBuscasUnificada: TIBQuery
    Database = IBDatabaseUnificada
    Transaction = IBTransactionUnificada
    SQL.Strings = (
      
        'select distinct cf.natop_v CFOP, nat.descricao_nop DESCRICAO, na' +
        't.tipv_veiculo TIPV, '#39'CFT'#39' TIPO from com_fat cf  inner join nat_' +
        'op nat on nat.codigo_nop = cf.natop_v  where cf.cod_empresa = 1 ' +
        'union  select distinct nfi.codigo_nop CFOP, nat.descricao_nop DE' +
        'SCRICAO, nat.tipv_veiculo TIPV, '#39'NF'#39' TIPO from notafiscal_item n' +
        'fi  inner join nat_op nat on nat.codigo_nop = nfi.codigo_nop  wh' +
        'ere nfi.tipo_item = '#39'V'#39' and nfi.cod_empresa = 1 order by 1, 4')
    Left = 1248
    Top = 99
    object qrBuscasUnificadaCFOP: TFloatField
      FieldName = 'CFOP'
      Origin = '"COM_FAT"."NATOP_V"'
    end
    object qrBuscasUnificadaDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = '"NAT_OP"."DESCRICAO_NOP"'
      Size = 100
    end
    object qrBuscasUnificadaTIPV: TIBStringField
      FieldName = 'TIPV'
      Origin = '"NAT_OP"."TIPV_VEICULO"'
      FixedChar = True
      Size = 1
    end
    object qrBuscasUnificadaTIPO: TIBStringField
      FieldName = 'TIPO'
      ProviderFlags = []
      FixedChar = True
      Size = 3
    end
  end
  object IBTransactionUnificada: TIBTransaction
    DefaultDatabase = IBDatabaseUnificada
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 1248
    Top = 163
  end
  object qrEmpresasUnificadas2: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = dtmAtivo.IbTransCol
    SQL.Strings = (
      
        'select emp.cod_empresa, (emp.identificacao_emp ||'#39' - '#39'|| emp.cnp' +
        'j_emp) identificacao_emp from empresa emp'
      'where emp.cod_empresa in (1)')
    Left = 1373
    Top = 8
  end
  object dspEmpresasUnificadas2: TDataSetProvider
    DataSet = qrEmpresasUnificadas2
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1373
    Top = 64
  end
  object cdsEmpresasUnificadas2: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspEmpresasUnificadas2'
    BeforeOpen = cdsPDVBeforeOpen
    Left = 1373
    Top = 112
    object IntegerField40: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object StringField34: TStringField
      FieldName = 'IDENTIFICACAO_EMP'
      Size = 85
    end
  end
  object dsEmpresasUnificadas2: TDataSource
    DataSet = cdsEmpresasUnificadas2
    Left = 1373
    Top = 168
  end
  object qrOcorrenciasBancaria: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = dtmAtivo.IbTransCol
    SQL.Strings = (
      
        'select 1 seqtipo, bol.n_seq_bol, bol.cod_empresa, bol.nosso_nume' +
        'ro_banco, bol.data_em_bol, bol.data_ven_bol,'
      
        'bol.n_doc_bol as titulonumerodocumento, bol.data_ven_bol as titu' +
        'lodatavencimento, bol.api_situacao,'
      'bol.api_codigo_movimento, bol.api_descr_movimento,'
      
        'bol.api_pgt_data, bol.api_pgt_datacredito, bol.api_pgt_realizado' +
        ','
      'bol.api_pgt_valorcredito, bol.api_pgt_valorpago,'
      
        'bol.api_pgt_valortaxacobranca, bol.api_pgt_valoracrescimos, bol.' +
        'api_pgt_valordesconto,'
      
        'bol.api_pgt_valorabatimento, bol.api_pgt_datataxabancaria, bol.a' +
        'pi_pgt_valoroutrasdespesas,'
      'bol.api_pgt_valor_iof,'
      'bol.api_pgt_valoroutroscreditos,'
      'bol.ocorrenciabancaria from boletas bol'
      'where bol.cod_cobrebem = 22'
      'and bol.cod_empresa = 1'
      'and bol.api_idretintegracao = '#39#39)
    Left = 1181
    Top = 272
  end
  object dspOcorrenciasBancaria: TDataSetProvider
    DataSet = qrOcorrenciasBancaria
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1181
    Top = 328
  end
  object cdsOcorrenciasBancaria: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspOcorrenciasBancaria'
    BeforeOpen = cdsPDVBeforeOpen
    Left = 1181
    Top = 376
    object cdsOcorrenciasBancariaSEQTIPO: TIntegerField
      FieldName = 'SEQTIPO'
    end
    object cdsOcorrenciasBancariaN_SEQ_BOL: TIntegerField
      FieldName = 'N_SEQ_BOL'
      Required = True
    end
    object cdsOcorrenciasBancariaCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsOcorrenciasBancariaDATA_EM_BOL: TDateTimeField
      FieldName = 'DATA_EM_BOL'
    end
    object cdsOcorrenciasBancariaDATA_VEN_BOL: TDateTimeField
      FieldName = 'DATA_VEN_BOL'
    end
    object cdsOcorrenciasBancariaNOSSO_NUMERO_BANCO: TStringField
      FieldName = 'NOSSO_NUMERO_BANCO'
    end
    object cdsOcorrenciasBancariaTITULONUMERODOCUMENTO: TStringField
      FieldName = 'TITULONUMERODOCUMENTO'
    end
    object cdsOcorrenciasBancariaTITULODATAVENCIMENTO: TDateTimeField
      FieldName = 'TITULODATAVENCIMENTO'
    end
    object cdsOcorrenciasBancariaAPI_SITUACAO: TStringField
      FieldName = 'API_SITUACAO'
      Size = 16
    end
    object cdsOcorrenciasBancariaAPI_CODIGO_MOVIMENTO: TStringField
      FieldName = 'API_CODIGO_MOVIMENTO'
      Size = 2
    end
    object cdsOcorrenciasBancariaAPI_DESCR_MOVIMENTO: TStringField
      FieldName = 'API_DESCR_MOVIMENTO'
      Size = 50
    end
    object cdsOcorrenciasBancariaAPI_PGT_DATA: TDateTimeField
      FieldName = 'API_PGT_DATA'
    end
    object cdsOcorrenciasBancariaAPI_PGT_DATACREDITO: TDateTimeField
      FieldName = 'API_PGT_DATACREDITO'
    end
    object cdsOcorrenciasBancariaAPI_PGT_REALIZADO: TSmallintField
      FieldName = 'API_PGT_REALIZADO'
    end
    object cdsOcorrenciasBancariaAPI_PGT_VALORCREDITO: TFloatField
      FieldName = 'API_PGT_VALORCREDITO'
    end
    object cdsOcorrenciasBancariaAPI_PGT_VALORPAGO: TFloatField
      FieldName = 'API_PGT_VALORPAGO'
    end
    object cdsOcorrenciasBancariaAPI_PGT_VALORTAXACOBRANCA: TFloatField
      FieldName = 'API_PGT_VALORTAXACOBRANCA'
    end
    object cdsOcorrenciasBancariaAPI_PGT_VALORACRESCIMOS: TFloatField
      FieldName = 'API_PGT_VALORACRESCIMOS'
    end
    object cdsOcorrenciasBancariaAPI_PGT_VALORDESCONTO: TFloatField
      FieldName = 'API_PGT_VALORDESCONTO'
    end
    object cdsOcorrenciasBancariaAPI_PGT_VALORABATIMENTO: TFloatField
      FieldName = 'API_PGT_VALORABATIMENTO'
    end
    object cdsOcorrenciasBancariaAPI_PGT_DATATAXABANCARIA: TFloatField
      FieldName = 'API_PGT_DATATAXABANCARIA'
    end
    object cdsOcorrenciasBancariaAPI_PGT_VALOROUTRASDESPESAS: TFloatField
      FieldName = 'API_PGT_VALOROUTRASDESPESAS'
    end
    object cdsOcorrenciasBancariaAPI_PGT_VALOR_IOF: TFloatField
      FieldName = 'API_PGT_VALOR_IOF'
    end
    object cdsOcorrenciasBancariaAPI_PGT_VALOROUTROSCREDITOS: TFloatField
      FieldName = 'API_PGT_VALOROUTROSCREDITOS'
    end
    object cdsOcorrenciasBancariaOCORRENCIABANCARIA: TMemoField
      FieldName = 'OCORRENCIABANCARIA'
      BlobType = ftMemo
      Size = 8
    end
  end
end
