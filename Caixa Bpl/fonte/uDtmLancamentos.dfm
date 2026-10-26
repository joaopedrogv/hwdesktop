object dtmLancamentos: TdtmLancamentos
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 498
  Width = 844
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
  object qrBuscas2: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    Left = 240
    Top = 8
  end
  object qrLancamentos: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select  lancamentos.*,'
      'controles.nome_ctrl, empresa.identificacao_emp,'
      
        'p_contas.desc_plc, grupos_ct.desc_gr, depart_ct.desc_dep, p_cont' +
        'as.cod_cta_contabil, p_contas_contabil.nome_cta  from LANCAMENTO' +
        'S'
      
        'left join controles on lancamentos.codigo_ctrl = controles.codig' +
        'o_ctrl and lancamentos.cod_emp_mult = controles.codigo_emp'
      
        'left join empresa on empresa.cod_empresa = lancamentos.cod_emp_m' +
        'ult'
      
        'left join p_contas on p_contas.n_conta_plc = lancamentos.n_conta' +
        '_plc'
      'left join grupos_ct on p_contas.grup_ct = grupos_ct.grup_ct'
      'left join depart_ct on grupos_ct.cod_dep = depart_ct.cod_dep'
      
        'left join p_contas_contabil on p_contas_contabil.cod_cta = p_con' +
        'tas.cod_cta_contabil and p_contas_contabil.cod_empresa = lancame' +
        'ntos.codigo_emp'
      'where  lancamentos.cod_lanc = 0'
      'and lancamentos.codigo_emp = 0')
    Left = 29
    Top = 64
  end
  object dspLancamentos: TDataSetProvider
    DataSet = qrLancamentos
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 29
    Top = 112
  end
  object cdsLancamentos: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspLancamentos'
    BeforeOpen = cdsLancamentosBeforeOpen
    Left = 29
    Top = 160
    object cdsLancamentosCOD_LANC: TIntegerField
      Tag = 2
      DisplayLabel = 'Codigo'
      FieldName = 'COD_LANC'
      Required = True
    end
    object cdsLancamentosDATA: TDateTimeField
      Tag = 2
      DisplayLabel = 'Data'
      FieldName = 'DATA'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsLancamentosTIPO_L: TStringField
      Tag = 2
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO_L'
      FixedChar = True
      Size = 1
    end
    object cdsLancamentosN_CONTA_PLC: TFloatField
      DisplayLabel = 'Num da Conta'
      FieldName = 'N_CONTA_PLC'
    end
    object cdsLancamentosCODIGO_CTRL: TIntegerField
      Tag = 2
      DisplayLabel = 'Codigo Controle'
      FieldName = 'CODIGO_CTRL'
      Required = True
    end
    object cdsLancamentosNOME_CTRL: TStringField
      Tag = 2
      DisplayLabel = 'Nome Controle'
      FieldName = 'NOME_CTRL'
      ProviderFlags = []
      Size = 35
    end
    object cdsLancamentosNDOC_L: TStringField
      DisplayLabel = 'Num Documento'
      FieldName = 'NDOC_L'
      FixedChar = True
      Size = 10
    end
    object cdsLancamentosHISTORICO_L: TStringField
      DisplayLabel = 'Historico'
      FieldName = 'HISTORICO_L'
      FixedChar = True
      Size = 100
    end
    object cdsLancamentosVALOR_L: TFloatField
      Tag = 2
      DisplayLabel = 'Valor'
      FieldName = 'VALOR_L'
      DisplayFormat = '##0.00'
    end
    object cdsLancamentosSTATUS_L: TStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS_L'
      FixedChar = True
      Size = 10
    end
    object cdsLancamentosDATQ_L: TDateTimeField
      DisplayLabel = 'Data Quita'#231#227'o'
      FieldName = 'DATQ_L'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsLancamentosNATL: TStringField
      DisplayLabel = 'Natureza'
      FieldName = 'NATL'
      FixedChar = True
      Size = 1
    end
    object cdsLancamentosDIA_FCD: TDateTimeField
      DisplayLabel = 'Dia Fechamento'
      FieldName = 'DIA_FCD'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsLancamentosNMOV: TIntegerField
      DisplayLabel = 'Num Movimento Caixa'
      FieldName = 'NMOV'
    end
    object cdsLancamentosLOTE: TIntegerField
      DisplayLabel = 'Lote de Pagamento'
      FieldName = 'LOTE'
    end
    object cdsLancamentosTIP_CNT: TStringField
      DisplayLabel = 'Tipo(C/N)'
      FieldName = 'TIP_CNT'
      FixedChar = True
      Size = 1
    end
    object cdsLancamentosDATA_CXL: TDateTimeField
      DisplayLabel = 'Data Caixa Auxiliar'
      FieldName = 'DATA_CXL'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsLancamentosLANC_VENDA: TStringField
      DisplayLabel = 'Lan'#231'amento de Venda?'
      FieldName = 'LANC_VENDA'
      FixedChar = True
      Size = 1
    end
    object cdsLancamentosDATA_REM_REC: TDateTimeField
      DisplayLabel = 'Data da Remessa'
      FieldName = 'DATA_REM_REC'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsLancamentosTP_MOD: TStringField
      DisplayLabel = 'N'#227'o Modificativo?'
      FieldName = 'TP_MOD'
      FixedChar = True
      Size = 1
    end
    object cdsLancamentosCOD_TERM: TIntegerField
      DisplayLabel = 'Codigo do Terminal'
      FieldName = 'COD_TERM'
    end
    object cdsLancamentosDT_COMPENSADO: TDateTimeField
      DisplayLabel = 'Data Compensa'#231#227'o'
      FieldName = 'DT_COMPENSADO'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsLancamentosNOMINAL_L: TStringField
      DisplayLabel = 'Nome do recebedor'
      FieldName = 'NOMINAL_L'
      FixedChar = True
      Size = 35
    end
    object cdsLancamentosN_CHEQ_L: TStringField
      DisplayLabel = 'Num Doc/Cheque'
      FieldName = 'N_CHEQ_L'
      FixedChar = True
      Size = 10
    end
    object cdsLancamentosDATA_VENC_CHEQ_L: TDateTimeField
      DisplayLabel = 'Data Venc Cheque'
      FieldName = 'DATA_VENC_CHEQ_L'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsLancamentosVL_CONTABIL: TFloatField
      DisplayLabel = 'Valor Cont'#225'bil'
      FieldName = 'VL_CONTABIL'
      DisplayFormat = '##0.00'
    end
    object cdsLancamentosLOTE_ENT: TIntegerField
      DisplayLabel = 'Lote Entrada'
      FieldName = 'LOTE_ENT'
    end
    object cdsLancamentosLOTE_QUIT: TIntegerField
      DisplayLabel = 'Lote Quit'
      FieldName = 'LOTE_QUIT'
    end
    object cdsLancamentosOP_CXL: TIntegerField
      DisplayLabel = 'Operador do CXL'
      FieldName = 'OP_CXL'
    end
    object cdsLancamentosDTREFERENCIA: TDateTimeField
      DisplayLabel = 'Data Refer'#234'ncia'
      FieldName = 'DTREFERENCIA'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsLancamentosCODIGO_EMP: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'CODIGO_EMP'
      Required = True
    end
    object cdsLancamentosCOD_OCORRENCIA: TIntegerField
      DisplayLabel = 'Cod Ocorrencia Bancaria'
      FieldName = 'COD_OCORRENCIA'
    end
    object cdsLancamentosDATA_OCORRENCIA: TDateTimeField
      DisplayLabel = 'Data Ocorrencia'
      FieldName = 'DATA_OCORRENCIA'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsLancamentosCOD_ADM: TIntegerField
      DisplayLabel = 'Cod Adm'
      FieldName = 'COD_ADM'
    end
    object cdsLancamentosCOD_DESPESA: TIntegerField
      DisplayLabel = 'Cod Despesa'
      FieldName = 'COD_DESPESA'
    end
    object cdsLancamentosCOD_EMP_MULT: TIntegerField
      DisplayLabel = 'Cod Unificada'
      FieldName = 'COD_EMP_MULT'
    end
    object cdsLancamentosIDENTIFICACAO_EMP: TStringField
      DisplayLabel = 'Unificada'
      FieldName = 'IDENTIFICACAO_EMP'
      ProviderFlags = []
      Size = 64
    end
    object cdsLancamentosNOME_CTA: TStringField
      DisplayLabel = 'Descricao Conta Contabil'
      FieldName = 'NOME_CTA'
      Origin = '"P_CONTAS_CONTABIL"."NOME_CTA"'
      ProviderFlags = []
      Size = 60
    end
    object cdsLancamentosDESC_PLC: TStringField
      DisplayLabel = 'Descricao Conta'
      FieldName = 'DESC_PLC'
      Origin = '"P_CONTAS"."DESC_PLC"'
      ProviderFlags = []
      FixedChar = True
      Size = 30
    end
    object cdsLancamentosDESC_GR: TStringField
      DisplayLabel = 'Descricao Grupo Conta'
      FieldName = 'DESC_GR'
      Origin = '"GRUPOS_CT"."DESC_GR"'
      ProviderFlags = []
      FixedChar = True
      Size = 35
    end
    object cdsLancamentosDESC_DEP: TStringField
      DisplayLabel = 'Descricao Departamento Conta'
      FieldName = 'DESC_DEP'
      Origin = '"DEPART_CT"."DESC_DEP"'
      ProviderFlags = []
      Size = 35
    end
    object cdsLancamentosCOD_CTA_CONTABIL: TStringField
      DisplayLabel = 'Cod Conta Contabil'
      FieldName = 'COD_CTA_CONTABIL'
      ProviderFlags = []
      Size = 60
    end
    object cdsLancamentosCOD_CONTRAPARTIDA: TIntegerField
      DisplayLabel = 'Lote Contrapartida Lanc'
      FieldName = 'COD_CONTRAPARTIDA'
    end
    object cdsLancamentosCOD_CONTRAPARTIDA_CTP: TIntegerField
      DisplayLabel = 'Lote Contrapartida Ctp'
      FieldName = 'COD_CONTRAPARTIDA_CTP'
    end
    object cdsLancamentosLANC_AVULSO: TStringField
      DisplayLabel = 'Lanc Avulso'
      FieldName = 'LANC_AVULSO'
      FixedChar = True
      Size = 1
    end
    object cdsLancamentosID_FINANC_CONFERE: TIntegerField
      Tag = 1
      DisplayLabel = 'Id Financ Confere'
      FieldName = 'ID_FINANC_CONFERE'
    end
    object cdsLancamentosARQ_EXTRATO_ADM: TStringField
      DisplayLabel = 'Arq Extrado Adm'
      FieldName = 'ARQ_EXTRATO_ADM'
      Size = 255
    end
    object cdsLancamentosDATA_ARQUIVO: TDateTimeField
      DisplayLabel = 'Data Extrado Adm'
      FieldName = 'DATA_ARQUIVO'
    end
  end
  object dsLancamentos: TDataSource
    DataSet = cdsLancamentos
    Left = 29
    Top = 208
  end
  object qrPCont: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      
        'select pc.n_conta_plc, pc.desc_plc, pc.sthab, pc.tipo_plc, g.des' +
        'c_gr, d.desc_dep from p_contas pc'
      'left join grupos_ct g on g.grup_ct = pc.grup_ct'
      'left join depart_ct d on d.cod_dep = g.cod_dep')
    Left = 125
    Top = 64
  end
  object dspPcont: TDataSetProvider
    DataSet = qrPCont
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 125
    Top = 112
  end
  object cdsPCont: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspPcont'
    BeforeOpen = cdsLancamentosBeforeOpen
    Left = 125
    Top = 160
  end
  object dsPCont: TDataSource
    DataSet = cdsPCont
    Left = 125
    Top = 208
  end
  object qrCtrl: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      
        'select c.codigo_ctrl, c.nome_ctrl, c.contr_banc, c.nat_lanc, c.n' +
        'at_ctrl, c.saldo_at_ctrl, c.DATA_CONF_SALD_BANC from controles c')
    Left = 205
    Top = 64
  end
  object dspCtrl: TDataSetProvider
    DataSet = qrCtrl
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 205
    Top = 112
  end
  object cdsCtrl: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspCtrl'
    BeforeOpen = cdsLancamentosBeforeOpen
    Left = 205
    Top = 160
  end
  object dsCtrl: TDataSource
    DataSet = cdsCtrl
    Left = 205
    Top = 208
  end
  object dsBuscas: TDataSource
    Left = 304
    Top = 8
  end
  object dsBuscas2: TDataSource
    Left = 368
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
    Left = 264
    Top = 72
  end
  object IbQrResumo: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    Left = 264
    Top = 120
  end
  object IbQrSlCtrl: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    Left = 264
    Top = 168
  end
  object IbQrBoletim: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    Left = 264
    Top = 216
  end
  object IbSaldoCtrl: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    Left = 336
    Top = 69
  end
  object DspSaldoCtrl: TDataSetProvider
    DataSet = IbSaldoCtrl
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 336
    Top = 120
  end
  object CdsSaldoCtrl: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspSaldoCtrl'
    BeforeOpen = cdsLancamentosBeforeOpen
    Left = 336
    Top = 168
  end
  object IbFechDia: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    Left = 407
    Top = 66
  end
  object DspFechDia: TDataSetProvider
    DataSet = IbFechDia
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 406
    Top = 119
  end
  object CdsFechDia: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspFechDia'
    BeforeOpen = cdsLancamentosBeforeOpen
    Left = 408
    Top = 168
  end
  object DsFechDia: TDataSource
    DataSet = CdsFechDia
    Left = 408
    Top = 224
  end
  object qrSaldoCtrl: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    Left = 648
    Top = 125
  end
  object dsSaldoCtrl: TDataSource
    Left = 720
    Top = 128
  end
  object qrBuscasGerais: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    Left = 688
    Top = 181
  end
  object qrEmpresasUnificadas: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      
        'select emp.cod_empresa, (emp.identificacao_emp ||'#39' - '#39'|| emp.cnp' +
        'j_emp) identificacao_emp from empresa emp'
      'where emp.cod_empresa in (1)')
    Left = 509
    Top = 56
  end
  object dspEmpresasUnificadas: TDataSetProvider
    DataSet = qrEmpresasUnificadas
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 509
    Top = 112
  end
  object cdsEmpresasUnificadas: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspEmpresasUnificadas'
    BeforeOpen = cdsLancamentosBeforeOpen
    Left = 509
    Top = 160
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
    Left = 509
    Top = 216
  end
  object qrAcompens: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select lancamentos.cod_emp_mult "Cod Unificada", '
      #39'AV'#39' "Tipo Pag", lancamentos.N_conta_plc "Num.Conta", '
      
        'lancamentos.ndoc_l "Num. Doc", lancamentos.n_cheq_l "Num.Cheque"' +
        ', '
      'trim(lancamentos.historico_l) || '
      '    (case when (lancamentos.cod_lanc > 0 and '
      
        '               (case when (lancamentos.lote_quit > 0) then lanca' +
        'mentos.lote_quit '
      
        '                         when (lancamentos.lote_ent > 0) then la' +
        'ncamentos.lote_ent '
      
        '                           when (lancamentos.lote > 0) then lanc' +
        'amentos.lote end) > 0) then '
      '              '#39' - LANC '#39' || lancamentos.cod_lanc || '
      
        '                             (case when (lancamentos.lote > 0) t' +
        'hen lancamentos.lote '
      
        '                    when (lancamentos.lote_quit > 0) then lancam' +
        'entos.lote_quit '
      
        '                                       when (lancamentos.lote_en' +
        't > 0) then lancamentos.lote_ent '
      '                                         end) '
      '          when (lancamentos.cod_lanc > 0) then '
      '           '#39' - LANC  '#39' || lancamentos.cod_lanc'
      '          when (lancamentos.lote > 0) then '
      '           '#39' - LT.PG '#39' || lancamentos.lote '
      '          when (lancamentos.lote_quit > 0) then '
      '           '#39' - LT.CRD '#39' || lancamentos.lote_quit '
      '          when (lancamentos.lote_ent > 0) then '
      '           '#39' - LT.CRD '#39' || lancamentos.lote_ent '
      '          else '
      '           '#39#39' end) "Hist'#243'rico", '
      
        'coalesce(lancamentos.valor_l, 0) "Valor", lancamentos.dia_fcd "D' +
        'ata Compensa'#231#227'o",'
      
        'lancamentos.dt_compensado "Dia Concilia'#231#227'o", lancamentos.cod_lan' +
        'c "Cod. Lancamento", '
      
        'lancamentos.tipo_l "Tipo Lan'#231'amento", lancamentos.data "Data Lan' +
        #231'amento", '
      'empresa.identificacao_emp "Unificada" '
      'from lancamentos '
      
        'inner join empresa on empresa.cod_empresa = lancamentos.cod_emp_' +
        'mult '
      'where lancamentos.codigo_ctrl = :codigo_ctrl '
      
        'and ((lancamentos.dt_compensado = :diaFFinanceiro) or (lancament' +
        'os.dt_compensado is null)) '
      
        'and lancamentos.data <= :vdtfinan and lancamentos.codigo_emp = :' +
        'codigo_emp ')
    Left = 37
    Top = 280
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigo_ctrl'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'diaFFinanceiro'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'vdtfinan'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'codigo_emp'
        ParamType = ptUnknown
      end>
  end
  object dspAcompens: TDataSetProvider
    DataSet = qrAcompens
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 37
    Top = 328
  end
  object cdsAcompens: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspAcompens'
    BeforeOpen = cdsLancamentosBeforeOpen
    Left = 37
    Top = 376
    object cdsAcompensSEL: TStringField
      DisplayLabel = 'Sel'
      FieldKind = fkInternalCalc
      FieldName = 'SEL'
      Size = 1
    end
    object cdsAcompensCodUnificada: TIntegerField
      FieldName = 'Cod Unificada'
    end
    object cdsAcompensTipoPag: TStringField
      FieldName = 'Tipo Pag'
      FixedChar = True
      Size = 2
    end
    object cdsAcompensNumConta: TFloatField
      FieldName = 'Num.Conta'
    end
    object cdsAcompensNumDoc: TStringField
      FieldName = 'Num. Doc'
      FixedChar = True
      Size = 10
    end
    object cdsAcompensNumCheque: TStringField
      FieldName = 'Num.Cheque'
      FixedChar = True
      Size = 10
    end
    object cdsAcompensHistrico: TStringField
      FieldName = 'Hist'#243'rico'
      Size = 98
    end
    object cdsAcompensValor: TFloatField
      FieldName = 'Valor'
    end
    object cdsAcompensDataCompensao: TDateTimeField
      FieldName = 'Data Compensa'#231#227'o'
    end
    object cdsAcompensDiaConciliao: TDateTimeField
      FieldName = 'Dia Concilia'#231#227'o'
    end
    object cdsAcompensCodLancamento: TIntegerField
      FieldName = 'Cod. Lancamento'
      Required = True
    end
    object cdsAcompensTipoLanamento: TStringField
      FieldName = 'Tipo Lan'#231'amento'
      FixedChar = True
      Size = 1
    end
    object cdsAcompensDataLanamento: TDateTimeField
      FieldName = 'Data Lan'#231'amento'
    end
    object cdsAcompensDataVencimento: TDateTimeField
      FieldName = 'Data Venc Cheque'
    end
    object cdsAcompensUnificada: TStringField
      FieldName = 'Unificada'
      Size = 64
    end
  end
  object dsAcompens: TDataSource
    DataSet = cdsAcompens
    Left = 37
    Top = 424
  end
  object qrControles: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select '
      'CODIGO_CTRL "Cod. Controle",'
      'FLUXO_CTRL "Fluxo de Caixa",'
      'N_BANCO_CTRL "Num. do Banco",'
      'NOME_CTRL "Nome do Controle/Banco",'
      'N_CONTA_CTRL "Num.Conta Banco",'
      'CONTR_BANC "Controle Banc'#225'rio",'
      'FONE_CTRL "Fone do Banco" '
      
        'from controles where contr_banc = '#39'S'#39' and codigo_emp = :codigo_e' +
        'mp '
      'order by codigo_ctrl')
    Left = 125
    Top = 280
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigo_emp'
        ParamType = ptUnknown
      end>
  end
  object dspControles: TDataSetProvider
    DataSet = qrControles
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 125
    Top = 328
  end
  object cdsControles: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspControles'
    BeforeOpen = cdsLancamentosBeforeOpen
    Left = 125
    Top = 376
    object cdsControlesCodControle: TIntegerField
      FieldName = 'Cod. Controle'
      Required = True
    end
    object cdsControlesFluxodeCaixa: TStringField
      FieldName = 'Fluxo de Caixa'
      FixedChar = True
      Size = 1
    end
    object cdsControlesNumdoBanco: TStringField
      FieldName = 'Num. do Banco'
      FixedChar = True
      Size = 10
    end
    object cdsControlesNomedoControleBanco: TStringField
      FieldName = 'Nome do Controle/Banco'
      Size = 35
    end
    object cdsControlesNumContaBanco: TStringField
      FieldName = 'Num.Conta Banco'
      FixedChar = True
      Size = 15
    end
    object cdsControlesControleBancrio: TStringField
      FieldName = 'Controle Banc'#225'rio'
      FixedChar = True
      Size = 1
    end
    object cdsControlesFonedoBanco: TStringField
      FieldName = 'Fone do Banco'
      FixedChar = True
      Size = 13
    end
  end
  object dsControles: TDataSource
    DataSet = cdsControles
    Left = 125
    Top = 424
  end
  object qrRecibosEstornar: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select rec.*,'
      '(select case when (count(ndoc) > 0) then 1 else 0 end formas'
      
        'from existe_formas (rec.nrecibo, '#39'REC'#39', rec.cod_empresa)) formas' +
        ' from recibos rec'
      'where ((status_rec is null) or (status_rec = '#39#39'))')
    Left = 237
    Top = 280
  end
  object dspRecibosEstornar: TDataSetProvider
    DataSet = qrRecibosEstornar
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 237
    Top = 328
  end
  object cdsRecibosEstornar: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspRecibosEstornar'
    BeforeOpen = cdsLancamentosBeforeOpen
    Left = 237
    Top = 376
    object cdsRecibosEstornarSEL: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'SEL'
      Size = 1
    end
    object cdsRecibosEstornarNRECIBO: TIntegerField
      FieldName = 'NRECIBO'
      Required = True
    end
    object cdsRecibosEstornarCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsRecibosEstornarVALOR: TFloatField
      FieldName = 'VALOR'
      currency = True
    end
    object cdsRecibosEstornarREFERENCIA1: TStringField
      FieldName = 'REFERENCIA1'
      FixedChar = True
      Size = 66
    end
    object cdsRecibosEstornarREFERENCIA2: TStringField
      FieldName = 'REFERENCIA2'
      FixedChar = True
      Size = 66
    end
    object cdsRecibosEstornarREFERENCIA3: TStringField
      FieldName = 'REFERENCIA3'
      FixedChar = True
      Size = 66
    end
    object cdsRecibosEstornarREFERENCIA4: TStringField
      FieldName = 'REFERENCIA4'
      FixedChar = True
      Size = 66
    end
    object cdsRecibosEstornarBENEF_CLIENT: TStringField
      FieldName = 'BENEF_CLIENT'
      FixedChar = True
      Size = 40
    end
    object cdsRecibosEstornarNOME_DEV: TStringField
      FieldName = 'NOME_DEV'
      FixedChar = True
      Size = 50
    end
    object cdsRecibosEstornarDATA_REC: TDateTimeField
      FieldName = 'DATA_REC'
    end
    object cdsRecibosEstornarLOCALDATA: TStringField
      FieldName = 'LOCALDATA'
      FixedChar = True
      Size = 70
    end
    object cdsRecibosEstornarRECANT: TStringField
      FieldName = 'RECANT'
      FixedChar = True
      Size = 1
    end
    object cdsRecibosEstornarSTATUS_REC: TStringField
      FieldName = 'STATUS_REC'
      FixedChar = True
      Size = 10
    end
    object cdsRecibosEstornarCOD_BENEF: TIntegerField
      FieldName = 'COD_BENEF'
    end
    object cdsRecibosEstornarDEPREC: TStringField
      FieldName = 'DEPREC'
      FixedChar = True
      Size = 1
    end
    object cdsRecibosEstornarNDOCANT: TIntegerField
      FieldName = 'NDOCANT'
    end
    object cdsRecibosEstornarDIA_CXL: TDateTimeField
      FieldName = 'DIA_CXL'
    end
    object cdsRecibosEstornarN_MOV_CXL: TIntegerField
      FieldName = 'N_MOV_CXL'
    end
    object cdsRecibosEstornarOBS_CXL_RQ: TStringField
      FieldName = 'OBS_CXL_RQ'
      FixedChar = True
      Size = 50
    end
    object cdsRecibosEstornarSTATUS_CXL_RQ: TStringField
      FieldName = 'STATUS_CXL_RQ'
      FixedChar = True
      Size = 1
    end
    object cdsRecibosEstornarVL_RQ_PG_CXL: TFloatField
      FieldName = 'VL_RQ_PG_CXL'
    end
    object cdsRecibosEstornarDATA_BAIXA: TDateTimeField
      FieldName = 'DATA_BAIXA'
    end
    object cdsRecibosEstornarHISTORICO_REC: TStringField
      FieldName = 'HISTORICO_REC'
      FixedChar = True
      Size = 50
    end
    object cdsRecibosEstornarCOD_PREP: TIntegerField
      FieldName = 'COD_PREP'
    end
    object cdsRecibosEstornarSELEC: TStringField
      FieldName = 'SELEC'
      FixedChar = True
      Size = 1
    end
    object cdsRecibosEstornarOP_CXL: TIntegerField
      FieldName = 'OP_CXL'
    end
    object cdsRecibosEstornarCOD_US: TIntegerField
      FieldName = 'COD_US'
    end
    object cdsRecibosEstornarATIVO: TIntegerField
      FieldName = 'ATIVO'
    end
    object cdsRecibosEstornarCOD_DEVEDOR: TIntegerField
      FieldName = 'COD_DEVEDOR'
    end
    object cdsRecibosEstornarVALOR_ORIG: TFloatField
      FieldName = 'VALOR_ORIG'
    end
    object cdsRecibosEstornarNUM_NF: TIntegerField
      FieldName = 'NUM_NF'
    end
    object cdsRecibosEstornarSERIE_NF: TStringField
      FieldName = 'SERIE_NF'
      Size = 5
    end
    object cdsRecibosEstornarDEVOLUCAO: TStringField
      FieldName = 'DEVOLUCAO'
      FixedChar = True
      Size = 1
    end
    object cdsRecibosEstornarNUM_REC_DEP: TStringField
      FieldName = 'NUM_REC_DEP'
      Size = 11
    end
    object cdsRecibosEstornarATRAVES1: TStringField
      FieldName = 'ATRAVES1'
      Size = 66
    end
    object cdsRecibosEstornarATRAVES2: TStringField
      FieldName = 'ATRAVES2'
      Size = 66
    end
    object cdsRecibosEstornarATRAVES3: TStringField
      FieldName = 'ATRAVES3'
      Size = 66
    end
    object cdsRecibosEstornarOBSERVACAO1: TStringField
      FieldName = 'OBSERVACAO1'
      Size = 66
    end
    object cdsRecibosEstornarOBSERVACAO2: TStringField
      FieldName = 'OBSERVACAO2'
      Size = 66
    end
    object cdsRecibosEstornarOBSERVACAO3: TStringField
      FieldName = 'OBSERVACAO3'
      Size = 66
    end
    object cdsRecibosEstornarCOD_DEPTO: TIntegerField
      FieldName = 'COD_DEPTO'
    end
    object cdsRecibosEstornarCOD_NF: TIntegerField
      FieldName = 'COD_NF'
    end
    object cdsRecibosEstornarPRG_FID: TStringField
      FieldName = 'PRG_FID'
      FixedChar = True
      Size = 1
    end
    object cdsRecibosEstornarCOD_LOCACAO: TIntegerField
      FieldName = 'COD_LOCACAO'
    end
    object cdsRecibosEstornarVALOR_ESTORNADO: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'VALOR_ESTORNADO'
    end
    object cdsRecibosEstornarFORMAS: TIntegerField
      FieldName = 'FORMAS'
    end
  end
  object dsRecibosEstornar: TDataSource
    DataSet = cdsRecibosEstornar
    Left = 237
    Top = 424
  end
  object qrLancFP: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      
        'select '#39'FP'#39' seqtipo, formpagamento.seqform, formpagamento.n_proc' +
        'essamento,'
      
        'formpagamento.nrequisicao, formpagamento.ndoc, formpagamento.tpd' +
        'ocs,'
      
        'formpagamento.cod_controle, controles.nome_ctrl, formpagamento.d' +
        'ata_mov, formpagamento.data_venc, formpagamento.valordoc,'
      'formpagamento.valordoc as valor_corr,'
      #39'QUITADO'#39' status,'
      'formpagamento.data_venc datq,'
      
        'formpagamento.cod_cliente, clientes.cpfcgc, clientes.nome_client' +
        'e, clientes.razao from lancamentos'
      
        'inner join formpagamento on formpagamento.n_processamento = lanc' +
        'amentos.cod_lanc and formpagamento.cod_empresa = lancamentos.cod' +
        '_emp_mult'
      
        'inner join controles on controles.codigo_ctrl = formpagamento.co' +
        'd_controle and controles.codigo_emp = formpagamento.cod_empresa'
      
        'inner join clientes on clientes.cod_cliente = formpagamento.cod_' +
        'cliente and clientes.cod_empresa = formpagamento.cod_empresa'
      'where lancamentos.data = '#39'18.08.2025'#39
      'and lancamentos.codigo_emp = 1')
    Left = 333
    Top = 280
  end
  object dspLancFP: TDataSetProvider
    DataSet = qrLancFP
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 333
    Top = 328
  end
  object cdsLancFP: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspLancFP'
    BeforeOpen = cdsLancamentosBeforeOpen
    Left = 333
    Top = 376
    object cdsLancFPSEQFORM: TIntegerField
      DisplayLabel = 'Cod Orig'
      FieldName = 'SEQFORM'
      Required = True
    end
    object cdsLancFPSEQTIPO: TStringField
      DisplayLabel = 'Tipo Orig'
      FieldName = 'SEQTIPO'
      FixedChar = True
      Size = 4
    end
    object cdsLancFPNREQUISICAO: TIntegerField
      DisplayLabel = 'Num Doc'
      FieldName = 'NREQUISICAO'
    end
    object cdsLancFPTPDOCS: TStringField
      DisplayLabel = 'Tipo Doc'
      FieldName = 'TPDOCS'
      Size = 6
    end
    object cdsLancFPDATA_MOV: TDateTimeField
      DisplayLabel = 'Data Mov'
      FieldName = 'DATA_MOV'
    end
    object cdsLancFPVALORDOC: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VALORDOC'
      DisplayFormat = '##0.00'
    end
    object cdsLancFPVALOR_CORR: TFloatField
      DisplayLabel = 'Valor Corrigido'
      FieldName = 'VALOR_CORR'
      DisplayFormat = '##0.00'
    end
    object cdsLancFPCOD_CONTROLE: TIntegerField
      DisplayLabel = 'Cod Controle'
      FieldName = 'COD_CONTROLE'
    end
    object cdsLancFPNOME_CTRL: TStringField
      DisplayLabel = 'Controle'
      FieldName = 'NOME_CTRL'
      Size = 35
    end
    object cdsLancFPNDOC: TStringField
      DisplayLabel = 'Num Documento'
      FieldName = 'NDOC'
    end
    object cdsLancFPDATA_VENC: TDateTimeField
      DisplayLabel = 'Data Venc'
      FieldName = 'DATA_VENC'
    end
    object cdsLancFPSTATUS: TStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      FixedChar = True
      Size = 10
    end
    object cdsLancFPDATQ: TDateTimeField
      DisplayLabel = 'Data Quitacao'
      FieldName = 'DATQ'
    end
    object cdsLancFPCOD_CLIENTE: TIntegerField
      DisplayLabel = 'Cod Cliente'
      FieldName = 'COD_CLIENTE'
    end
    object cdsLancFPCPFCGC: TStringField
      DisplayLabel = 'CPF/CNPJ Cliente'
      FieldName = 'CPFCGC'
      Size = 18
    end
    object cdsLancFPNOME_CLIENTE: TStringField
      DisplayLabel = 'Nome Fantasia Clente'
      FieldName = 'NOME_CLIENTE'
      Required = True
      Size = 35
    end
    object cdsLancFPRAZAO: TStringField
      DisplayLabel = 'Razao Social Cliente'
      FieldName = 'RAZAO'
      Required = True
      Size = 60
    end
    object cdsLancFPN_PROCESSAMENTO: TIntegerField
      DisplayLabel = 'Cod Lanc'
      FieldName = 'N_PROCESSAMENTO'
    end
  end
  object dsLancFP: TDataSource
    DataSet = cdsLancFP
    Left = 333
    Top = 424
  end
  object qrDocSendoRec: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select '
      #39'CC'#39' seqtipo,'
      'controle_creditos.cod_cred, '
      'controle_creditos.codigo_emp, '
      'controle_creditos.n_doc_v, '
      'controle_creditos.n_doc_c, '
      'controle_creditos.tp_doc_v, '
      'null n_ch,'
      'controle_creditos.codigo_ctrl, '
      'controles.nome_ctrl, '
      'controle_creditos.data_rec_c, '
      'controle_creditos.data_venc_c, '
      
        'coalesce(controle_creditos.valor_original, controle_creditos.val' +
        'or_c) valor_c, '
      'controle_creditos.status_c, '
      'controle_creditos.datq_c, '
      'controle_creditos.status_cx, '
      'controle_creditos.op_cx,'
      'controle_creditos.cod_cliente, '
      'coalesce(clientes.cpfcgc, controle_creditos.cpfcgc) cpfcgc, '
      
        'coalesce(clientes.nome_cliente, controle_creditos.nome_c) nome_c' +
        'liente, '
      
        'coalesce(clientes.razao, controle_creditos.razao) razao from con' +
        'trole_creditos '
      
        'inner join empresa on empresa.cod_empresa = controle_creditos.co' +
        'digo_emp '
      
        'left join controles on controles.codigo_ctrl = controle_creditos' +
        '.codigo_ctrl and controles.codigo_emp = controle_creditos.cod_em' +
        'p_mult '
      
        'left join clientes on clientes.cod_cliente = controle_creditos.c' +
        'od_cliente and clientes.cod_empresa = controle_creditos.cod_emp_' +
        'mult '
      'where controle_creditos.status_cx = '#39'R'#39' '
      'and (case when (empresa.financeiro_unificado = '#39'S'#39') then '
      '            empresa.codigo_unificadora '
      '          else '
      '            controle_creditos.codigo_emp '
      '     end) =  :codEmpresa'
      'union all '
      'select '
      #39'CH'#39' seqtipo,'
      'controle_cheque.codigo_ch, '
      'controle_cheque.codigo_emp, '
      'controle_cheque.n_doc_v, '
      'controle_cheque.n_doc_v, '
      'controle_cheque.tp_doc_v, '
      'controle_cheque.n_ch,'
      'controle_cheque.codigo_ctrl, '
      'controles.nome_ctrl, '
      'controle_cheque.data_rec, '
      'controle_cheque.data_venc, '
      'controle_cheque.valor_ch, '
      'controle_cheque.status_ch, '
      'controle_cheque.datq_ch, '
      'controle_cheque.status_cx,'
      'controle_cheque.op_cx, '
      'controle_cheque.cod_cliente, '
      'coalesce(clientes.cpfcgc, controle_cheque.cpfcgc) cpfcgc, '
      
        'coalesce(clientes.nome_cliente, controle_cheque.nome_ch) nome_cl' +
        'iente, '
      
        'coalesce(clientes.razao, controle_cheque.razao) razao from contr' +
        'ole_cheque '
      
        'inner join empresa on empresa.cod_empresa = controle_cheque.codi' +
        'go_emp '
      
        'left join controles on controles.codigo_ctrl = controle_cheque.c' +
        'odigo_ctrl and controles.codigo_emp = controle_cheque.cod_emp_mu' +
        'lt '
      
        'left join clientes on clientes.cod_cliente = controle_cheque.cod' +
        '_cliente and clientes.cod_empresa = controle_cheque.cod_emp_mult' +
        ' '
      'where controle_cheque.status_cx = '#39'R'#39' '
      'and (case when (empresa.financeiro_unificado = '#39'S'#39') then '
      '            empresa.codigo_unificadora '
      '          else '
      '            controle_cheque.codigo_emp '
      '     end) =  :codEmpresa')
    Left = 429
    Top = 280
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codEmpresa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'codEmpresa'
        ParamType = ptUnknown
      end>
  end
  object dspDocSendoRec: TDataSetProvider
    DataSet = qrDocSendoRec
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 429
    Top = 328
  end
  object cdsDocSendoRec: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspDocSendoRec'
    BeforeOpen = cdsLancamentosBeforeOpen
    Left = 429
    Top = 376
    object cdsDocSendoRecSEL: TStringField
      DisplayLabel = 'Sel'
      FieldKind = fkInternalCalc
      FieldName = 'SEL'
      Size = 1
    end
    object cdsDocSendoRecSEQTIPO: TStringField
      DisplayLabel = 'Tipo Orig'
      FieldName = 'SEQTIPO'
      FixedChar = True
      Size = 2
    end
    object cdsDocSendoRecCOD_CRED: TIntegerField
      DisplayLabel = 'Cod Orig'
      FieldName = 'COD_CRED'
      Required = True
    end
    object cdsDocSendoRecN_DOC_V: TIntegerField
      DisplayLabel = 'Num Doc Venda'
      FieldName = 'N_DOC_V'
    end
    object cdsDocSendoRecN_DOC_C: TStringField
      DisplayLabel = 'Num Documento'
      FieldName = 'N_DOC_C'
    end
    object cdsDocSendoRecTP_DOC_V: TStringField
      DisplayLabel = 'Tipo Doc Venda'
      FieldName = 'TP_DOC_V'
      FixedChar = True
      Size = 6
    end
    object cdsDocSendoRecN_CH: TStringField
      DisplayLabel = 'Num Cheque'
      FieldName = 'N_CH'
    end
    object cdsDocSendoRecCODIGO_CTRL: TIntegerField
      DisplayLabel = 'Cod Controle'
      FieldName = 'CODIGO_CTRL'
      Required = True
    end
    object cdsDocSendoRecNOME_CTRL: TStringField
      DisplayLabel = 'Controle'
      FieldName = 'NOME_CTRL'
      Size = 35
    end
    object cdsDocSendoRecDATA_REC_C: TDateTimeField
      DisplayLabel = 'Data Cadastro'
      FieldName = 'DATA_REC_C'
    end
    object cdsDocSendoRecDATA_VENC_C: TDateTimeField
      DisplayLabel = 'Data Venc'
      FieldName = 'DATA_VENC_C'
    end
    object cdsDocSendoRecVALOR_C: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VALOR_C'
      DisplayFormat = '##0.00'
    end
    object cdsDocSendoRecSTATUS_C: TStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS_C'
      FixedChar = True
      Size = 10
    end
    object cdsDocSendoRecDATQ_C: TDateTimeField
      DisplayLabel = 'Data Quitacao'
      FieldName = 'DATQ_C'
    end
    object cdsDocSendoRecSTATUS_CX: TStringField
      DisplayLabel = 'Recebendo'
      FieldName = 'STATUS_CX'
      FixedChar = True
      Size = 1
    end
    object cdsDocSendoRecOP_CX: TIntegerField
      DisplayLabel = 'Operador Recebendo'
      FieldName = 'OP_CX'
    end
    object cdsDocSendoRecCOD_CLIENTE: TIntegerField
      DisplayLabel = 'Cod Cliente'
      FieldName = 'COD_CLIENTE'
    end
    object cdsDocSendoRecCPFCGC: TStringField
      DisplayLabel = 'CPF/CNPJ Cliente'
      FieldName = 'CPFCGC'
      Size = 18
    end
    object cdsDocSendoRecNOME_CLIENTE: TStringField
      DisplayLabel = 'Nome Fantasia Clente'
      FieldName = 'NOME_CLIENTE'
      Size = 35
    end
    object cdsDocSendoRecRAZAO: TStringField
      DisplayLabel = 'Razao Social Cliente'
      FieldName = 'RAZAO'
      Size = 60
    end
    object cdsDocSendoRecCODIGO_EMP: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'CODIGO_EMP'
      Visible = False
    end
  end
  object dsDocSendoRec: TDataSource
    DataSet = cdsDocSendoRec
    Left = 429
    Top = 424
  end
end
