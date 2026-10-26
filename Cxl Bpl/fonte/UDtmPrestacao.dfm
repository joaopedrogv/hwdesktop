object DtmPrestacao: TDtmPrestacao
  OldCreateOrder = False
  Height = 457
  Width = 769
  object IBTransPrestacao: TIBTransaction
    DefaultDatabase = dtmAtivo.bancoHw
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 128
    Top = 16
  end
  object QrPendPrestacao: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransPrestacao
    SQL.Strings = (
      'select'
      
        'selec,cod_cred, tipo_doc_c, n_doc_c,cod_cliente,Nome_c,Valor_c,d' +
        'ata_venc_c,'
      
        'vl_rq_pg_cxl,status_cxl_rq,dia_cxl,op_cxl,valor_corr,valor_desc,' +
        'valor_acresc,LOTE_CXL,'
      
        'tp_rec_cxl,cpfcgc,juros_cob,tp_doc_v,N_doc_v,CODIGO_EMP,COD_EMP_' +
        'MULT,CODIGO_CTRL,'
      
        'COONAOFISCAL,US_CANCELOU,DT_US_CANCELOU,OBS_PARACREDITO,CODIGO_V' +
        'END,TIP_CNT,NSERIEECF,COD_TERMINAL, data_venda, op_cx'
      'from CONTROLE_CREDITOS '
      'Where (dia_cxl is null or dia_cxl = :vdatafec) and '
      'status_c is null and '
      
        '(op_cxl = :vop or op_cxl is null or op_cxl = 0) AND CODIGO_EMP =' +
        ' :COD_EMPRESA'
      'order by nome_c,n_doc_c')
    Left = 216
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'vdatafec'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'vop'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'COD_EMPRESA'
        ParamType = ptUnknown
      end>
    object QrPendPrestacaoSELEC: TIBStringField
      FieldName = 'SELEC'
      Origin = '"CONTROLE_CREDITOS"."SELEC"'
      ProviderFlags = [pfInWhere]
      FixedChar = True
      Size = 1
    end
    object QrPendPrestacaoCOD_CRED: TIntegerField
      FieldName = 'COD_CRED'
      Origin = '"CONTROLE_CREDITOS"."COD_CRED"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QrPendPrestacaoTIPO_DOC_C: TStringField
      FieldName = 'TIPO_DOC_C'
      Size = 15
    end
    object QrPendPrestacaoN_DOC_C: TIBStringField
      FieldName = 'N_DOC_C'
      Origin = '"CONTROLE_CREDITOS"."N_DOC_C"'
      FixedChar = True
    end
    object QrPendPrestacaoCOD_CLIENTE: TIntegerField
      FieldName = 'COD_CLIENTE'
      Origin = '"CONTROLE_CREDITOS"."COD_CLIENTE"'
    end
    object QrPendPrestacaoNOME_C: TIBStringField
      FieldName = 'NOME_C'
      Origin = '"CONTROLE_CREDITOS"."NOME_C"'
      Size = 35
    end
    object QrPendPrestacaoVALOR_C: TFloatField
      FieldName = 'VALOR_C'
      Origin = '"CONTROLE_CREDITOS"."VALOR_C"'
    end
    object QrPendPrestacaoDATA_VENC_C: TDateTimeField
      FieldName = 'DATA_VENC_C'
      Origin = '"CONTROLE_CREDITOS"."DATA_VENC_C"'
    end
    object QrPendPrestacaoVL_RQ_PG_CXL: TFloatField
      FieldName = 'VL_RQ_PG_CXL'
      Origin = '"CONTROLE_CREDITOS"."VL_RQ_PG_CXL"'
    end
    object QrPendPrestacaoSTATUS_CXL_RQ: TIBStringField
      FieldName = 'STATUS_CXL_RQ'
      Origin = '"CONTROLE_CREDITOS"."STATUS_CXL_RQ"'
      FixedChar = True
      Size = 1
    end
    object QrPendPrestacaoDIA_CXL: TDateTimeField
      FieldName = 'DIA_CXL'
      Origin = '"CONTROLE_CREDITOS"."DIA_CXL"'
    end
    object QrPendPrestacaoOP_CXL: TIntegerField
      FieldName = 'OP_CXL'
      Origin = '"CONTROLE_CREDITOS"."OP_CXL"'
    end
    object QrPendPrestacaoVALOR_CORR: TFloatField
      FieldName = 'VALOR_CORR'
      Origin = '"CONTROLE_CREDITOS"."VALOR_CORR"'
    end
    object QrPendPrestacaoVALOR_DESC: TFloatField
      FieldName = 'VALOR_DESC'
      Origin = '"CONTROLE_CREDITOS"."VALOR_DESC"'
    end
    object QrPendPrestacaoVALOR_ACRESC: TFloatField
      FieldName = 'VALOR_ACRESC'
      Origin = '"CONTROLE_CREDITOS"."VALOR_ACRESC"'
    end
    object QrPendPrestacaoLOTE_CXL: TIntegerField
      FieldName = 'LOTE_CXL'
      Origin = '"CONTROLE_CREDITOS"."LOTE_CXL"'
    end
    object QrPendPrestacaoTP_REC_CXL: TIBStringField
      FieldName = 'TP_REC_CXL'
      Origin = '"CONTROLE_CREDITOS"."TP_REC_CXL"'
      FixedChar = True
      Size = 1
    end
    object QrPendPrestacaoCPFCGC: TIBStringField
      FieldName = 'CPFCGC'
      Origin = '"CONTROLE_CREDITOS"."CPFCGC"'
      FixedChar = True
      Size = 18
    end
    object QrPendPrestacaoJUROS_COB: TFloatField
      FieldName = 'JUROS_COB'
      Origin = '"CONTROLE_CREDITOS"."JUROS_COB"'
    end
    object QrPendPrestacaoTP_DOC_V: TIBStringField
      FieldName = 'TP_DOC_V'
      Origin = '"CONTROLE_CREDITOS"."TP_DOC_V"'
      FixedChar = True
      Size = 6
    end
    object QrPendPrestacaoN_DOC_V: TIntegerField
      FieldName = 'N_DOC_V'
      Origin = '"CONTROLE_CREDITOS"."N_DOC_V"'
    end
    object QrPendPrestacaoCODIGO_EMP: TIntegerField
      FieldName = 'CODIGO_EMP'
      Origin = '"CONTROLE_CREDITOS"."CODIGO_EMP"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QrPendPrestacaoCOD_EMP_MULT: TIntegerField
      FieldName = 'COD_EMP_MULT'
      Origin = '"CONTROLE_CREDITOS"."COD_EMP_MULT"'
    end
    object QrPendPrestacaoCODIGO_CTRL: TIntegerField
      FieldName = 'CODIGO_CTRL'
      Origin = '"CONTROLE_CREDITOS"."CODIGO_CTRL"'
      Required = True
    end
    object QrPendPrestacaoCOONAOFISCAL: TIntegerField
      FieldName = 'COONAOFISCAL'
      Origin = '"CONTROLE_CREDITOS"."COONAOFISCAL"'
    end
    object QrPendPrestacaoUS_CANCELOU: TIBStringField
      FieldName = 'US_CANCELOU'
      Origin = '"CONTROLE_CREDITOS"."US_CANCELOU"'
      Size = 10
    end
    object QrPendPrestacaoDT_US_CANCELOU: TDateTimeField
      FieldName = 'DT_US_CANCELOU'
      Origin = '"CONTROLE_CREDITOS"."DT_US_CANCELOU"'
    end
    object QrPendPrestacaoOBS_PARACREDITO: TIBStringField
      FieldName = 'OBS_PARACREDITO'
      Origin = '"CONTROLE_CREDITOS"."OBS_PARACREDITO"'
      Size = 50
    end
    object QrPendPrestacaoCODIGO_VEND: TIntegerField
      FieldName = 'CODIGO_VEND'
      Origin = '"CONTROLE_CREDITOS"."CODIGO_VEND"'
    end
    object QrPendPrestacaoTIP_CNT: TIBStringField
      DisplayLabel = 'TIPO CNT'
      FieldName = 'TIP_CNT'
      Origin = '"CONTROLE_CREDITOS"."TIP_CNT"'
      FixedChar = True
      Size = 1
    end
    object QrPendPrestacaoNSERIEECF: TIBStringField
      DisplayLabel = 'N. SERIE ECF'
      FieldName = 'NSERIEECF'
      Origin = '"CONTROLE_CREDITOS"."NSERIEECF"'
    end
    object QrPendPrestacaoCOD_TERMINAL: TIntegerField
      DisplayLabel = 'COD. TERMINAL'
      FieldName = 'COD_TERMINAL'
      Origin = '"CONTROLE_CREDITOS"."COD_TERMINAL"'
    end
    object QrPendPrestacaoDATA_VENDA: TDateTimeField
      FieldName = 'DATA_VENDA'
    end
    object QrPendPrestacaoOP_CX: TIntegerField
      FieldName = 'OP_CX'
      Origin = '"CONTROLE_CREDITOS"."OP_CX"'
    end
  end
  object CdsPendPrestacao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspPendPrestacao'
    BeforeOpen = CdsPendPrestacaoBeforeOpen
    Left = 320
    Top = 16
    object CdsPendPrestacaoSELEC: TStringField
      Tag = 2
      DisplayLabel = 'Sel'
      FieldName = 'SELEC'
      ProviderFlags = [pfInWhere]
      FixedChar = True
      Size = 1
    end
    object CdsPendPrestacaoCOD_CRED: TIntegerField
      Tag = 2
      DisplayLabel = 'C'#243'digo Cr'#233'dito'
      FieldName = 'COD_CRED'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CdsPendPrestacaoTIPO_DOC_C: TStringField
      DisplayLabel = 'Tipo Credito'
      FieldName = 'TIPO_DOC_C'
      Size = 15
    end
    object CdsPendPrestacaoN_DOC_C: TStringField
      DisplayLabel = 'N'#186' do Documento'
      FieldName = 'N_DOC_C'
      FixedChar = True
    end
    object CdsPendPrestacaoCOD_CLIENTE: TIntegerField
      DisplayLabel = 'C'#243'd. Cliente'
      FieldName = 'COD_CLIENTE'
    end
    object CdsPendPrestacaoNOME_C: TStringField
      DisplayLabel = 'Nome do cliente'
      FieldName = 'NOME_C'
      Size = 35
    end
    object CdsPendPrestacaoVALOR_C: TFloatField
      DisplayLabel = 'Valor do Documento'
      FieldName = 'VALOR_C'
      DisplayFormat = '#,##0.00'
    end
    object CdsPendPrestacaoDATA_VENC_C: TDateTimeField
      DisplayLabel = 'Data Vencimento'
      FieldName = 'DATA_VENC_C'
    end
    object CdsPendPrestacaoVL_RQ_PG_CXL: TFloatField
      DisplayLabel = 'Valor Pago'
      FieldName = 'VL_RQ_PG_CXL'
      DisplayFormat = '#,##0.00'
    end
    object CdsPendPrestacaoSTATUS_CXL_RQ: TStringField
      DisplayLabel = 'Status Rec'
      FieldName = 'STATUS_CXL_RQ'
      FixedChar = True
      Size = 1
    end
    object CdsPendPrestacaoDIA_CXL: TDateTimeField
      DisplayLabel = 'Dia do Caixa'
      FieldName = 'DIA_CXL'
    end
    object CdsPendPrestacaoOP_CXL: TIntegerField
      DisplayLabel = 'Operador'
      FieldName = 'OP_CXL'
    end
    object CdsPendPrestacaoVALOR_CORR: TFloatField
      DisplayLabel = 'Valor Corrigido'
      FieldName = 'VALOR_CORR'
      DisplayFormat = '#,##0.00'
    end
    object CdsPendPrestacaoVALOR_DESC: TFloatField
      DisplayLabel = 'Valor Desconto'
      FieldName = 'VALOR_DESC'
      DisplayFormat = '#,##0.00'
    end
    object CdsPendPrestacaoVALOR_ACRESC: TFloatField
      DisplayLabel = 'Valor Acrescimo'
      FieldName = 'VALOR_ACRESC'
      DisplayFormat = '#,##0.00'
    end
    object CdsPendPrestacaoLOTE_CXL: TIntegerField
      DisplayLabel = 'Lote Quita'#231#227'o Cxl'
      FieldName = 'LOTE_CXL'
    end
    object CdsPendPrestacaoTP_REC_CXL: TStringField
      DisplayLabel = 'Tipo Recebimento'
      FieldName = 'TP_REC_CXL'
      FixedChar = True
      Size = 1
    end
    object CdsPendPrestacaoCPFCGC: TStringField
      DisplayLabel = 'CPF ou CNPJ'
      FieldName = 'CPFCGC'
      FixedChar = True
      Size = 18
    end
    object CdsPendPrestacaoJUROS_COB: TFloatField
      DisplayLabel = 'Juros Cobrados'
      FieldName = 'JUROS_COB'
      DisplayFormat = '#,##0.00'
    end
    object CdsPendPrestacaoTP_DOC_V: TStringField
      DisplayLabel = 'Tipo Doc. Venda'
      FieldName = 'TP_DOC_V'
      FixedChar = True
      Size = 6
    end
    object CdsPendPrestacaoN_DOC_V: TIntegerField
      DisplayLabel = 'N'#186' Doc. Venda'
      FieldName = 'N_DOC_V'
    end
    object CdsPendPrestacaoCODIGO_EMP: TIntegerField
      Tag = 1
      DisplayLabel = 'C'#243'd. Empresa'
      FieldName = 'CODIGO_EMP'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
    end
    object CdsPendPrestacaoCOD_EMP_MULT: TIntegerField
      Tag = 1
      DisplayLabel = 'C'#243'd. Mult. Empresa'
      FieldName = 'COD_EMP_MULT'
      Visible = False
    end
    object CdsPendPrestacaoCODIGO_CTRL: TIntegerField
      DisplayLabel = 'Controle Cr'#233'dito'
      FieldName = 'CODIGO_CTRL'
      Required = True
    end
    object CdsPendPrestacaoCOONAOFISCAL: TIntegerField
      DisplayLabel = 'COO N'#227'o Fiscal'
      FieldName = 'COONAOFISCAL'
    end
    object CdsPendPrestacaoUS_CANCELOU: TStringField
      DisplayLabel = 'Usu'#225'rio que Cancelou Rec.'
      FieldName = 'US_CANCELOU'
      Size = 10
    end
    object CdsPendPrestacaoDT_US_CANCELOU: TDateTimeField
      DisplayLabel = 'Data Canc. Rec.'
      FieldName = 'DT_US_CANCELOU'
    end
    object CdsPendPrestacaoOBS_PARACREDITO: TStringField
      DisplayLabel = 'Obs. deste Cred.'
      FieldName = 'OBS_PARACREDITO'
      Size = 50
    end
    object CdsPendPrestacaoCODIGO_VEND: TIntegerField
      DisplayLabel = 'Vendedor'
      FieldName = 'CODIGO_VEND'
    end
    object CdsPendPrestacaoTIP_CNT: TStringField
      DisplayLabel = 'Tip CNT'
      FieldName = 'TIP_CNT'
      FixedChar = True
      Size = 1
    end
    object CdsPendPrestacaoNSERIEECF: TStringField
      DisplayLabel = 'Num Serie ECF'
      FieldName = 'NSERIEECF'
    end
    object CdsPendPrestacaoCOD_TERMINAL: TIntegerField
      DisplayLabel = 'Cod Terminal'
      FieldName = 'COD_TERMINAL'
    end
    object CdsPendPrestacaoDIF: TStringField
      DisplayLabel = 'Dif'
      FieldKind = fkInternalCalc
      FieldName = 'DIF'
      ProviderFlags = []
      Size = 1
    end
    object CdsPendPrestacaoDATA_VENDA: TDateTimeField
      DisplayLabel = 'Data Venda'
      FieldName = 'DATA_VENDA'
    end
    object CdsPendPrestacaoOP_CX: TIntegerField
      DisplayLabel = 'Operador Financ'
      FieldName = 'OP_CX'
    end
  end
  object DspPendPrestacao: TDataSetProvider
    DataSet = QrPendPrestacao
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 416
    Top = 16
  end
  object CdsBuscas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspBuscas'
    Left = 320
    Top = 88
  end
  object DspBuscas: TDataSetProvider
    DataSet = QrBuscas
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 416
    Top = 88
  end
  object QrBuscas: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransPrestacao
    Left = 216
    Top = 88
  end
  object DtPendPrestacao: TDataSource
    DataSet = CdsPendPrestacao
    Left = 512
    Top = 24
  end
  object SpIncCodigoCxl: TIBStoredProc
    Database = dtmAtivo.bancoHw
    Transaction = IBTransPrestacao
    StoredProcName = 'INCREMENTA_CODIGO'
    Left = 512
    Top = 80
  end
  object RdImpRec: TRDprint
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
    TamanhoQteLinhas = 33
    TamanhoQteColunas = 80
    TamanhoQteLPP = Seis
    NumerodeCopias = 1
    FonteTamanhoPadrao = S10cpp
    FonteEstiloPadrao = []
    Orientacao = poPortrait
    Left = 208
    Top = 192
  end
end
