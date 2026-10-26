object dtmFP: TdtmFP
  OldCreateOrder = False
  Height = 652
  Width = 1155
  object transacao: TIBTransaction
    DefaultDatabase = dtmAtivo.bancoHw
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 64
    Top = 8
  end
  object SpIncCodigo: TIBStoredProc
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    StoredProcName = 'INCREMENTA_CODIGO'
    Left = 120
    Top = 8
  end
  object qrBuscas: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    Left = 184
    Top = 8
  end
  object dspBuscas: TDataSetProvider
    DataSet = qrBuscas
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 240
    Top = 8
  end
  object cdsBuscas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspBuscas'
    BeforeOpen = cdsBuscasBeforeOpen
    Left = 304
    Top = 8
  end
  object IBQuery1: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    Left = 792
    Top = 104
  end
  object IBQuery2: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    Left = 792
    Top = 104
  end
  object qrDetalhes: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      
        'select fp.data_mov,fp.tpdocs, fp.nrequisicao,fp.ndoc,c.nome_ctrl' +
        ',fp.cod_cliente,fp.cliente,'
      
        'fp.historico, fp.valordoc, fp.data_venc,fp.terceiros,fp.tipdoc, ' +
        'fp.cod_controle,fp.cod_empresa,'
      'case when fp.tpdocs = '#39'REC'#39' then '#39'Recibo Antecipado'#39
      '  else c.nome_ctrl'
      
        'end formaDePagamento, fp.n_processamento, fp.nosso_numero_banco,' +
        ' '#39' '#39' num_rec_dep, '#39' '#39' num_rec_parc'
      'from formpagamento fp'
      
        'inner join controles c on c.codigo_ctrl = fp.cod_controle and c.' +
        'codigo_emp = fp.cod_empresa'
      'where fp.ativo = 1')
    Left = 704
    Top = 72
  end
  object qrHistRec: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select * from HIST_REC')
    Left = 176
    Top = 72
  end
  object qrRecibo: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select * from RECIBOS')
    Left = 104
    Top = 72
  end
  object qrFormPag: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      
        'select fp.*, '#39' '#39' num_rec_dep, '#39' '#39' num_rec_parc from FORMPAGAMENT' +
        'O fp')
    Left = 24
    Top = 72
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    BeforeOpen = cdsBuscasBeforeOpen
    Left = 792
    Top = 152
  end
  object ClientDataSet2: TClientDataSet
    Aggregates = <>
    Params = <>
    BeforeOpen = cdsBuscasBeforeOpen
    Left = 792
    Top = 152
  end
  object ClientDataSet3: TClientDataSet
    Aggregates = <>
    Params = <>
    BeforeOpen = cdsBuscasBeforeOpen
    Left = 792
    Top = 152
  end
  object cdsDetalhes: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDetalhes'
    BeforeOpen = cdsBuscasBeforeOpen
    Left = 704
    Top = 168
    object cdsDetalhesFORMADEPAGAMENTO: TStringField
      DisplayLabel = 'Forma Pag'
      FieldName = 'FORMADEPAGAMENTO'
      ProviderFlags = []
      Size = 35
    end
    object cdsDetalhesDATA_MOV: TDateTimeField
      DisplayLabel = 'Data Movimento'
      FieldName = 'DATA_MOV'
      Origin = '"FORMPAGAMENTO"."DATA_MOV"'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsDetalhesVALORDOC: TFloatField
      DisplayLabel = 'Valor Documento'
      FieldName = 'VALORDOC'
      Origin = '"FORMPAGAMENTO"."VALORDOC"'
      currency = True
    end
    object cdsDetalhesDATA_VENC: TDateTimeField
      DisplayLabel = 'Data Vencimento'
      FieldName = 'DATA_VENC'
      Origin = '"FORMPAGAMENTO"."DATA_VENC"'
    end
    object cdsDetalhesTPDOCS: TStringField
      DisplayLabel = 'Tipo Doc'
      FieldName = 'TPDOCS'
      Origin = '"FORMPAGAMENTO"."TPDOCS"'
      Size = 6
    end
    object cdsDetalhesNREQUISICAO: TIntegerField
      DisplayLabel = 'N'#186' Venda'
      FieldName = 'NREQUISICAO'
      Origin = '"FORMPAGAMENTO"."NREQUISICAO"'
    end
    object cdsDetalhesNUM_REC_DEP: TStringField
      DisplayLabel = 'N'#186' Venda'
      FieldName = 'NUM_REC_DEP'
      FixedChar = True
      Size = 1
    end
    object cdsDetalhesNDOC: TStringField
      DisplayLabel = 'N'#186' Documento'
      FieldName = 'NDOC'
      Origin = '"FORMPAGAMENTO"."NDOC"'
    end
    object cdsDetalhesNUM_REC_PARC: TStringField
      DisplayLabel = 'N'#186' Documento'
      FieldName = 'NUM_REC_PARC'
      FixedChar = True
      Size = 1
    end
    object cdsDetalhesNOME_CTRL: TStringField
      DisplayLabel = 'Controle'
      FieldName = 'NOME_CTRL'
      Origin = '"CONTROLES"."NOME_CTRL"'
      Size = 35
    end
    object cdsDetalhesCLIENTE: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
      Origin = '"FORMPAGAMENTO"."CLIENTE"'
      Size = 60
    end
    object cdsDetalhesHISTORICO: TStringField
      DisplayLabel = 'Hist'#243'rico'
      FieldName = 'HISTORICO'
      Origin = '"FORMPAGAMENTO"."HISTORICO"'
      Size = 80
    end
    object cdsDetalhesTERCEIROS: TStringField
      DisplayLabel = 'Terceiro'
      FieldName = 'TERCEIROS'
      Origin = '"FORMPAGAMENTO"."TERCEIROS"'
      Size = 80
    end
    object cdsDetalhesTIPDOC: TStringField
      DisplayLabel = 'Tipo Venda'
      FieldName = 'TIPDOC'
      Origin = '"FORMPAGAMENTO"."TIPDOC"'
      FixedChar = True
      Size = 2
    end
    object cdsDetalhesCOD_CONTROLE: TIntegerField
      DisplayLabel = 'Cod Controle'
      FieldName = 'COD_CONTROLE'
      Origin = '"FORMPAGAMENTO"."COD_CONTROLE"'
    end
    object cdsDetalhesCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Origin = '"FORMPAGAMENTO"."COD_EMPRESA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
    end
    object cdsDetalhesCOD_CLIENTE: TIntegerField
      FieldName = 'COD_CLIENTE'
    end
    object cdsDetalhesN_PROCESSAMENTO: TIntegerField
      DisplayLabel = 'Num Processamento Financeiro'
      FieldName = 'N_PROCESSAMENTO'
    end
    object cdsDetalhesNOSSO_NUMERO_BANCO: TStringField
      DisplayLabel = 'Nosso Numero'
      FieldName = 'NOSSO_NUMERO_BANCO'
    end
    object cdsDetalhesN_DOCNSU_ADM: TStringField
      DisplayLabel = 'Num Doc/NSU/CV'
      FieldName = 'N_DOCNSU_ADM'
      Size = 10
    end
    object cdsDetalhesN_AUT_CART: TStringField
      DisplayLabel = 'Num Aut Cartao'
      FieldName = 'N_AUT_CART'
    end
    object cdsDetalhesCOD_TERMINAL_ADM: TStringField
      DisplayLabel = 'Cod Terminal Adm'
      FieldName = 'COD_TERMINAL_ADM'
      Size = 10
    end
    object cdsDetalhesDESC_TERMINAL_ADM: TStringField
      DisplayLabel = 'Terminal Adm'
      FieldName = 'DESC_TERMINAL_ADM'
      Size = 30
    end
    object cdsDetalhesCOD_ADM: TIntegerField
      DisplayLabel = 'Cod Adm'
      FieldName = 'COD_ADM'
    end
    object cdsDetalhesDESC_ADM: TStringField
      DisplayLabel = 'Adm'
      FieldName = 'DESC_ADM'
      Size = 30
    end
    object cdsDetalhesCOD_BANDEIRA_ADM: TIntegerField
      DisplayLabel = 'Cod Bandeira Adm'
      FieldName = 'COD_BANDEIRA_ADM'
    end
    object cdsDetalhesDESC_BANDEIRA: TStringField
      DisplayLabel = 'Bandeira Adm'
      FieldName = 'DESC_BANDEIRA'
      Size = 50
    end
    object cdsDetalhesNPARCELA: TIntegerField
      DisplayLabel = 'Num Parcela'
      FieldName = 'NPARCELA'
    end
    object cdsDetalhesQTDE_PARC: TIntegerField
      DisplayLabel = 'Qtde Parcela'
      FieldName = 'QTDE_PARC'
    end
    object cdsDetalhesREC_NUMVEND: TIntegerField
      FieldName = 'REC_NUMVEND'
    end
    object cdsDetalhesREC_TIPVEND: TStringField
      FieldName = 'REC_TIPVEND'
      Size = 3
    end
    object cdsDetalhesRECIBO: TStringField
      FieldName = 'RECIBO'
      Size = 1
    end
    object cdsDetalhesSEQFORM: TIntegerField
      DisplayLabel = 'Seq'
      FieldName = 'SEQFORM'
    end
  end
  object cdsHistRec: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspHistRec'
    BeforeOpen = cdsBuscasBeforeOpen
    Left = 176
    Top = 168
  end
  object cdsRecibo: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRecibo'
    BeforeOpen = cdsBuscasBeforeOpen
    Left = 104
    Top = 168
    object cdsReciboSELEC: TStringField
      DisplayLabel = 'Sel'
      FieldName = 'SELEC'
      FixedChar = True
      Size = 1
    end
    object cdsReciboCOD_EMP_MULT: TIntegerField
      DisplayLabel = 'Cod Unificada'
      FieldName = 'COD_EMP_MULT'
    end
    object cdsReciboNRECIBO: TIntegerField
      DisplayLabel = 'N'#186' Recibo'
      FieldName = 'NRECIBO'
      Required = True
    end
    object cdsReciboNUM_REC_DEP: TStringField
      DisplayLabel = 'N'#176' Rec Dep'
      FieldName = 'NUM_REC_DEP'
      Size = 11
    end
    object cdsReciboVALOR: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VALOR'
      currency = True
    end
    object cdsReciboNOME_DEV: TStringField
      DisplayLabel = 'Nome Credor'
      FieldName = 'NOME_DEV'
      FixedChar = True
      Size = 50
    end
    object cdsReciboCOD_BENEF: TIntegerField
      DisplayLabel = 'N'#186' Benefici'#225'rio'
      FieldName = 'COD_BENEF'
    end
    object cdsReciboBENEF_CLIENT: TStringField
      DisplayLabel = 'Benefici'#225'rio'
      FieldName = 'BENEF_CLIENT'
      FixedChar = True
      Size = 40
    end
    object cdsReciboSTATUS_REC: TStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS_REC'
      FixedChar = True
      Size = 10
    end
    object cdsReciboDATA_BAIXA: TDateTimeField
      DisplayLabel = 'Data Baixa'
      FieldName = 'DATA_BAIXA'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsReciboDATA_REC: TDateTimeField
      DisplayLabel = 'Data Recebimento'
      FieldName = 'DATA_REC'
    end
    object cdsReciboREFERENCIA1: TStringField
      DisplayLabel = 'Linha 1'
      FieldName = 'REFERENCIA1'
      FixedChar = True
      Size = 66
    end
    object cdsReciboREFERENCIA2: TStringField
      DisplayLabel = 'Linha 2'
      FieldName = 'REFERENCIA2'
      FixedChar = True
      Size = 66
    end
    object cdsReciboREFERENCIA3: TStringField
      DisplayLabel = 'Linha 3'
      FieldName = 'REFERENCIA3'
      FixedChar = True
      Size = 66
    end
    object cdsReciboREFERENCIA4: TStringField
      DisplayLabel = 'Linha 4'
      FieldName = 'REFERENCIA4'
      FixedChar = True
      Size = 66
    end
    object cdsReciboCOD_DEVEDOR: TIntegerField
      DisplayLabel = 'C'#243'd Pagante'
      FieldName = 'COD_DEVEDOR'
    end
    object cdsReciboLOCALDATA: TStringField
      DisplayLabel = 'Local e Data'
      FieldName = 'LOCALDATA'
      FixedChar = True
      Size = 70
    end
    object cdsReciboRECANT: TStringField
      DisplayLabel = 'Recibo Antecipado'
      FieldName = 'RECANT'
      FixedChar = True
      Size = 1
    end
    object cdsReciboDEPREC: TStringField
      DisplayLabel = 'Departamento'
      FieldName = 'DEPREC'
      FixedChar = True
      Size = 1
    end
    object cdsReciboNDOCANT: TIntegerField
      DisplayLabel = 'N'#186' Doc Venda'
      FieldName = 'NDOCANT'
    end
    object cdsReciboDIA_CXL: TDateTimeField
      DisplayLabel = 'Data Caixa Auxiliar'
      FieldName = 'DIA_CXL'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsReciboN_MOV_CXL: TIntegerField
      DisplayLabel = 'N'#186' Movimento Caixa Auxiliar'
      FieldName = 'N_MOV_CXL'
    end
    object cdsReciboOBS_CXL_RQ: TStringField
      DisplayLabel = 'Obs Caixa Auxiliar'
      FieldName = 'OBS_CXL_RQ'
      FixedChar = True
      Size = 50
    end
    object cdsReciboSTATUS_CXL_RQ: TStringField
      DisplayLabel = 'Status Caixa Auxiliar'
      FieldName = 'STATUS_CXL_RQ'
      FixedChar = True
      Size = 1
    end
    object cdsReciboVL_RQ_PG_CXL: TFloatField
      DisplayLabel = 'Valor Paga Caixa Auxiliar'
      FieldName = 'VL_RQ_PG_CXL'
      currency = True
    end
    object cdsReciboHISTORICO_REC: TStringField
      DisplayLabel = 'Hist'#243'rico'
      FieldName = 'HISTORICO_REC'
      FixedChar = True
      Size = 50
    end
    object cdsReciboCOD_PREP: TIntegerField
      DisplayLabel = 'N'#186' Preposto'
      FieldName = 'COD_PREP'
    end
    object cdsReciboOP_CXL: TIntegerField
      DisplayLabel = 'N'#186' Operador'
      FieldName = 'OP_CXL'
    end
    object cdsReciboCOD_US: TIntegerField
      DisplayLabel = 'N'#186' Usu'#225'rio'
      FieldName = 'COD_US'
    end
    object cdsReciboATRAVES1: TStringField
      DisplayLabel = 'Atraves 1'
      FieldName = 'ATRAVES1'
      Size = 66
    end
    object cdsReciboATRAVES2: TStringField
      DisplayLabel = 'Atraves 2'
      FieldName = 'ATRAVES2'
      Size = 66
    end
    object cdsReciboATRAVES3: TStringField
      DisplayLabel = 'Atraves 3'
      FieldName = 'ATRAVES3'
      Size = 66
    end
    object cdsReciboOBSERVACAO1: TStringField
      DisplayLabel = 'Observacao 1'
      FieldName = 'OBSERVACAO1'
      Size = 66
    end
    object cdsReciboOBSERVACAO2: TStringField
      DisplayLabel = 'Observacao 2'
      FieldName = 'OBSERVACAO2'
      Size = 66
    end
    object cdsReciboOBSERVACAO3: TStringField
      DisplayLabel = 'Observacao 3'
      FieldName = 'OBSERVACAO3'
      Size = 66
    end
    object cdsReciboCOD_LOCACAO: TIntegerField
      DisplayLabel = 'Cod Locacao'
      FieldName = 'COD_LOCACAO'
    end
    object cdsReciboCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'C'#243'digo Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
  end
  object cdsFormPag: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFormPag'
    BeforeOpen = cdsBuscasBeforeOpen
    Left = 24
    Top = 168
    object cdsFormPagSEQFORM: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'SEQFORM'
      Required = True
    end
    object cdsFormPagCOD_EMPRESA: TIntegerField
      DisplayLabel = 'C'#243'digo Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsFormPagNREQUISICAO: TIntegerField
      DisplayLabel = 'N'#186' Venda'
      FieldName = 'NREQUISICAO'
    end
    object cdsFormPagNUM_REC_DEP: TStringField
      DisplayLabel = 'N Venda'
      FieldName = 'NUM_REC_DEP'
      FixedChar = True
      Size = 1
    end
    object cdsFormPagNDOC: TStringField
      DisplayLabel = 'N'#186' Doc'
      FieldName = 'NDOC'
    end
    object cdsFormPagNUM_REC_PARC: TStringField
      DisplayLabel = 'N Doc'
      FieldName = 'NUM_REC_PARC'
      FixedChar = True
      Size = 1
    end
    object cdsFormPagTIPDOC: TStringField
      DisplayLabel = 'Tipo Doc'
      FieldName = 'TIPDOC'
      FixedChar = True
      Size = 2
    end
    object cdsFormPagCOD_CONTROLE: TIntegerField
      DisplayLabel = 'C'#243'digo Controle'
      FieldName = 'COD_CONTROLE'
    end
    object cdsFormPagCOD_CLIENTE: TIntegerField
      DisplayLabel = 'C'#243'digo Cliente'
      FieldName = 'COD_CLIENTE'
    end
    object cdsFormPagCLIENTE: TStringField
      DisplayLabel = 'Nome Cliente'
      FieldName = 'CLIENTE'
      Size = 60
    end
    object cdsFormPagHISTORICO: TStringField
      DisplayLabel = 'Hist'#243'rico'
      FieldName = 'HISTORICO'
      Size = 80
    end
    object cdsFormPagCOD_BANCO: TIntegerField
      DisplayLabel = 'C'#243'digo banco'
      FieldName = 'COD_BANCO'
      Visible = False
    end
    object cdsFormPagCOD_BANCO_STR: TStringField
      DisplayLabel = 'C'#243'digo banco'
      FieldName = 'COD_BANCO_STR'
      Size = 11
    end
    object cdsFormPagBANCO: TStringField
      DisplayLabel = 'Banco'
      FieldName = 'BANCO'
      Size = 35
    end
    object cdsFormPagCOD_CLI_TERC: TIntegerField
      DisplayLabel = 'C'#243'digo Terceiro'
      FieldName = 'COD_CLI_TERC'
    end
    object cdsFormPagTERCEIROS: TStringField
      DisplayLabel = 'Nome Terceiros'
      FieldName = 'TERCEIROS'
      Size = 80
    end
    object cdsFormPagDATA_MOV: TDateTimeField
      DisplayLabel = 'Data Movimento'
      FieldName = 'DATA_MOV'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsFormPagVALORDOC: TFloatField
      DisplayLabel = 'Valor Doc'
      FieldName = 'VALORDOC'
      currency = True
    end
    object cdsFormPagTPDOCS: TStringField
      DisplayLabel = 'Doc Tp'
      FieldName = 'TPDOCS'
      FixedChar = True
      Size = 6
    end
    object cdsFormPagN_CONTA_PLC: TFloatField
      DisplayLabel = 'N'#186' Plano'
      FieldName = 'N_CONTA_PLC'
    end
    object cdsFormPagDATA_VENC: TDateTimeField
      DisplayLabel = 'Data Vencimento'
      FieldName = 'DATA_VENC'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsFormPagPRCSS: TStringField
      DisplayLabel = 'Processada'
      FieldName = 'PRCSS'
      FixedChar = True
      Size = 1
    end
    object cdsFormPagAGENCIA: TStringField
      DisplayLabel = 'Ag'#234'ncia'
      FieldName = 'AGENCIA'
      Size = 10
    end
    object cdsFormPagCONTA: TStringField
      DisplayLabel = 'Conta'
      FieldName = 'CONTA'
      Size = 15
    end
    object cdsFormPagOPERADOR: TIntegerField
      DisplayLabel = 'N'#186' Vendedor'
      FieldName = 'OPERADOR'
    end
    object cdsFormPagOP_CXL: TIntegerField
      DisplayLabel = 'N'#186' Operador'
      FieldName = 'OP_CXL'
    end
    object cdsFormPagCODIGO_FUNC: TIntegerField
      DisplayLabel = 'N'#186' Funcion'#225'rio'
      FieldName = 'CODIGO_FUNC'
    end
    object cdsFormPagTIP_CNT: TStringField
      DisplayLabel = 'Cont'#225'bil'
      FieldName = 'TIP_CNT'
      FixedChar = True
      Size = 1
    end
    object cdsFormPagN_DOCNSU_ADM: TStringField
      DisplayLabel = 'Num Doc/NSU/CV'
      FieldName = 'N_DOCNSU_ADM'
      Size = 10
    end
    object cdsFormPagN_AUT_CART: TStringField
      DisplayLabel = 'Num Aut Cartao'
      FieldName = 'N_AUT_CART'
      FixedChar = True
    end
    object cdsFormPagPLANO: TStringField
      DisplayLabel = 'Plano'
      FieldName = 'PLANO'
      FixedChar = True
      Size = 1
    end
    object cdsFormPagNUM_NOTA: TIntegerField
      DisplayLabel = 'N'#186' Nota Fiscal'
      FieldName = 'NUM_NOTA'
    end
    object cdsFormPagSUB_SERIE: TIntegerField
      DisplayLabel = 'Sub S'#233'rie NF'
      FieldName = 'SUB_SERIE'
    end
    object cdsFormPagNOSSO_NUMERO_BANCO: TStringField
      DisplayLabel = 'Nosso N'#250'mero'
      FieldName = 'NOSSO_NUMERO_BANCO'
    end
    object cdsFormPagRECIBO: TStringField
      DisplayLabel = 'Recibo'
      FieldName = 'RECIBO'
      FixedChar = True
      Size = 1
    end
    object cdsFormPagREC_TIPVEND: TStringField
      FieldName = 'REC_TIPVEND'
      FixedChar = True
      Size = 3
    end
    object cdsFormPagREC_NUMVEND: TIntegerField
      FieldName = 'REC_NUMVEND'
    end
    object cdsFormPagCONTROLE: TStringField
      FieldKind = fkLookup
      FieldName = 'CONTROLE'
      LookupDataSet = cdsCtrl
      LookupKeyFields = 'CODIGO_CTRL'
      LookupResultField = 'NOME_CTRL'
      KeyFields = 'COD_CONTROLE'
      Size = 35
      Lookup = True
    end
    object cdsFormPagREF_FRETE: TStringField
      FieldName = 'REF_FRETE'
      FixedChar = True
      Size = 1
    end
    object cdsFormPagVALOR_CONTABIL: TFloatField
      FieldName = 'VALOR_CONTABIL'
    end
    object cdsFormPagVL_BAIXA_COMISSAO: TFloatField
      FieldName = 'VL_BAIXA_COMISSAO'
    end
    object cdsFormPagVL_BAIXA_COMISSAO_GER: TFloatField
      FieldName = 'VL_BAIXA_COMISSAO_GER'
    end
    object cdsFormPagN_REC: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'N_REC'
    end
    object cdsFormPagUS_CAD: TIntegerField
      DisplayLabel = 'Usuario que cadastrou'
      FieldName = 'US_CAD'
    end
    object cdsFormPagNPARCELA: TIntegerField
      FieldName = 'NPARCELA'
    end
    object cdsFormPagCOD_TERMINAL_ADM: TStringField
      DisplayLabel = 'Cod Term Adm'
      FieldName = 'COD_TERMINAL_ADM'
      Size = 10
    end
    object cdsFormPagDESC_TERMINAL_ADM: TStringField
      DisplayLabel = 'Term Adm'
      FieldName = 'DESC_TERMINAL_ADM'
      Size = 30
    end
    object cdsFormPagMD5: TStringField
      FieldName = 'MD5'
      Size = 32
    end
    object cdsFormPagSECAO: TIntegerField
      FieldName = 'SECAO'
    end
    object cdsFormPagTEF: TStringField
      FieldName = 'TEF'
      Size = 1
    end
    object cdsFormPagCOD_NFCE: TIntegerField
      FieldName = 'COD_NFCE'
    end
    object cdsFormPagPRG_FID: TStringField
      Tag = 1
      FieldName = 'PRG_FID'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object cdsFormPagSEQUENCIA: TIntegerField
      Tag = 1
      FieldKind = fkInternalCalc
      FieldName = 'SEQUENCIA'
      Visible = False
    end
    object cdsFormPagVL_JUROS: TFloatField
      FieldName = 'VL_JUROS'
    end
    object cdsFormPagMETODO_PAG_ID: TIntegerField
      FieldName = 'METODO_PAG_ID'
    end
    object cdsFormPagLOCAL_VENDA: TStringField
      FieldName = 'LOCAL_VENDA'
      Size = 80
    end
    object cdsFormPagINTERMEDIADOR: TStringField
      FieldName = 'INTERMEDIADOR'
      Size = 80
    end
    object cdsFormPagINTERM_NUMVEND: TIntegerField
      FieldName = 'INTERM_NUMVEND'
    end
    object cdsFormPagCOD_UNIFICADA: TIntegerField
      FieldName = 'COD_UNIFICADA'
    end
    object cdsFormPagDEB_CRED: TStringField
      FieldName = 'DEB_CRED'
      FixedChar = True
      Size = 1
    end
    object cdsFormPagQTDE_PARC: TIntegerField
      FieldName = 'QTDE_PARC'
    end
    object cdsFormPagCOD_ADM: TIntegerField
      FieldName = 'COD_ADM'
    end
    object cdsFormPagDESC_ADM: TStringField
      FieldName = 'DESC_ADM'
      Size = 30
    end
    object cdsFormPagCOD_BANDEIRA_ADM: TIntegerField
      FieldName = 'COD_BANDEIRA_ADM'
    end
    object cdsFormPagDESC_BANDEIRA: TStringField
      FieldName = 'DESC_BANDEIRA'
      Size = 50
    end
    object cdsFormPagCOD_COBREBEM: TIntegerField
      FieldName = 'COD_COBREBEM'
    end
    object cdsFormPagCXL: TStringField
      FieldName = 'CXL'
      FixedChar = True
      Size = 1
    end
    object cdsFormPagGUID_TR_CARTAO: TStringField
      FieldName = 'GUID_TR_CARTAO'
      Size = 36
    end
    object cdsFormPagVALORDOC_LIQ: TFloatField
      FieldName = 'VALORDOC_LIQ'
    end
    object cdsFormPagCONTROLE_TEMP: TStringField
      DisplayWidth = 35
      FieldKind = fkInternalCalc
      FieldName = 'CONTROLE_TEMP'
      Size = 35
    end
    object cdsFormPagPERMITIR_EXCLUIR: TStringField
      Tag = 1
      FieldName = 'PERMITIR_EXCLUIR'
      FixedChar = True
      Size = 1
    end
  end
  object DataSetProvider1: TDataSetProvider
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 784
    Top = 56
  end
  object DataSetProvider2: TDataSetProvider
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 784
    Top = 56
  end
  object DataSetProvider3: TDataSetProvider
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 784
    Top = 56
  end
  object dspDetalhes: TDataSetProvider
    DataSet = qrDetalhes
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 704
    Top = 120
  end
  object dspHistRec: TDataSetProvider
    DataSet = qrHistRec
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 176
    Top = 120
  end
  object dspRecibo: TDataSetProvider
    DataSet = qrRecibo
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 104
    Top = 120
  end
  object dspFormPag: TDataSetProvider
    DataSet = qrFormPag
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 24
    Top = 120
  end
  object DataSource1: TDataSource
    AutoEdit = False
    Left = 768
    Top = 8
  end
  object DataSource2: TDataSource
    AutoEdit = False
    Left = 768
    Top = 8
  end
  object DataSource3: TDataSource
    AutoEdit = False
    Left = 768
    Top = 8
  end
  object dsDestalhes: TDataSource
    AutoEdit = False
    DataSet = cdsDetalhes
    Left = 704
    Top = 216
  end
  object dsHistRec: TDataSource
    AutoEdit = False
    DataSet = cdsHistRec
    Left = 176
    Top = 216
  end
  object dsRecibo: TDataSource
    AutoEdit = False
    DataSet = cdsRecibo
    Left = 104
    Top = 216
  end
  object dsFormPag: TDataSource
    AutoEdit = False
    DataSet = cdsFormPag2
    Left = 24
    Top = 216
  end
  object qrBanco: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select * from CODIGO_BANCO')
    Left = 256
    Top = 72
  end
  object cdsBanco: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspBanco'
    BeforeOpen = cdsBuscasBeforeOpen
    Left = 256
    Top = 168
    object cdsBancoCOD_BANCO: TIntegerField
      FieldName = 'COD_BANCO'
      Required = True
    end
    object cdsBancoDESC_BANCO: TStringField
      FieldName = 'DESC_BANCO'
      FixedChar = True
      Size = 30
    end
    object cdsBancoQTLNBOL: TIntegerField
      FieldName = 'QTLNBOL'
    end
    object cdsBancoENTRELINHAS: TStringField
      FieldName = 'ENTRELINHAS'
      FixedChar = True
    end
    object cdsBancoPORTA_IMPRESSAO: TStringField
      FieldName = 'PORTA_IMPRESSAO'
      Size = 60
    end
    object cdsBancoCOD_CONTROLE_CX: TIntegerField
      FieldName = 'COD_CONTROLE_CX'
    end
  end
  object dspBanco: TDataSetProvider
    DataSet = qrBanco
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 256
    Top = 120
  end
  object dsBanco: TDataSource
    AutoEdit = False
    DataSet = cdsBanco
    Left = 256
    Top = 216
  end
  object qrJuros: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select * from TABJUROS')
    Left = 336
    Top = 72
  end
  object cdsJuros: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspJuros'
    BeforeOpen = cdsBuscasBeforeOpen
    Left = 336
    Top = 168
    object cdsJurosNPREST_J: TIntegerField
      FieldName = 'NPREST_J'
      Required = True
    end
    object cdsJurosJUROS_J: TFloatField
      FieldName = 'JUROS_J'
    end
    object cdsJurosCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsJurosCOEF_J: TStringField
      FieldName = 'COEF_J'
      FixedChar = True
      Size = 10
    end
  end
  object dspJuros: TDataSetProvider
    DataSet = qrJuros
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 336
    Top = 120
  end
  object dsJuros: TDataSource
    AutoEdit = False
    DataSet = cdsJuros
    Left = 336
    Top = 216
  end
  object qrControle: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      
        'select CODIGO_CTRL, DOCS, NOME_CTRL, USAR_BOLETO, TP_PLANO, CART' +
        'AO_SPED from CONTROLES')
    Left = 408
    Top = 72
  end
  object cdsControle: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'CODIGO_CTRL'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'DOCS'
        Attributes = [faFixed]
        DataType = ftString
        Size = 2
      end
      item
        Name = 'NOME_CTRL'
        DataType = ftString
        Size = 35
      end
      item
        Name = 'USAR_BOLETO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'TP_PLANO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'CARTAO_SPED'
        DataType = ftSmallint
      end>
    IndexDefs = <
      item
        Name = 'NomeControle'
        Fields = 'NOME_CTRL'
      end
      item
        Name = 'CodigoCOntrole'
        Fields = 'CODIGO_CTRL'
      end>
    IndexFieldNames = 'CODIGO_CTRL'
    Params = <>
    ProviderName = 'dspControle'
    StoreDefs = True
    BeforeOpen = cdsBuscasBeforeOpen
    Left = 408
    Top = 168
    object cdsControleCODIGO_CTRL: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO_CTRL'
      Origin = '"CONTROLES"."CODIGO_CTRL"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsControleNOME_CTRL: TStringField
      DisplayLabel = 'Controle'
      FieldName = 'NOME_CTRL'
      Origin = '"CONTROLES"."NOME_CTRL"'
      FixedChar = True
      Size = 35
    end
    object cdsControleDOCS: TStringField
      DisplayLabel = 'Doc'
      FieldName = 'DOCS'
      Origin = '"CONTROLES"."DOCS"'
      FixedChar = True
      Size = 2
    end
    object cdsControleUSAR_BOLETO: TStringField
      DisplayLabel = 'Usar Boleto'
      FieldName = 'USAR_BOLETO'
      Origin = '"CONTROLES"."USAR_BOLETO"'
      FixedChar = True
      Size = 1
    end
    object cdsControleTP_PLANO: TStringField
      DisplayLabel = 'Tp Plano'
      FieldName = 'TP_PLANO'
      Origin = '"CONTROLES"."TP_PLANO"'
      FixedChar = True
      Size = 1
    end
    object cdsControleTIPO_PARCELAMENTO: TStringField
      FieldName = 'TIPO_PARCELAMENTO'
      Size = 2
    end
    object cdsControleDIA_BASE_PARCELAMENTO: TStringField
      FieldName = 'DIA_BASE_PARCELAMENTO'
      Size = 2
    end
    object cdsControleQSEQPERF: TIntegerField
      FieldName = 'QSEQPERF'
    end
    object cdsControleQSEQPERF_TEMP: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'QSEQPERF_TEMP'
    end
    object cdsControleCARTAO_SPED: TSmallintField
      FieldName = 'CARTAO_SPED'
    end
    object cdsControleTEF_TIPO: TSmallintField
      FieldName = 'TEF_TIPO'
    end
    object cdsControleTEF_ID_CARTDIG: TStringField
      FieldName = 'TEF_ID_CARTDIG'
      Size = 8
    end
    object cdsControleTEF_ID_PSP: TStringField
      FieldName = 'TEF_ID_PSP'
      Size = 8
    end
  end
  object dspControle: TDataSetProvider
    DataSet = qrControle
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 408
    Top = 120
  end
  object dsControle: TDataSource
    AutoEdit = False
    DataSet = cdsControle
    Left = 408
    Top = 216
  end
  object qrCondPag: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select * from COND_PAG')
    Left = 480
    Top = 72
  end
  object cdsCondPag: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCondPag'
    BeforeOpen = cdsBuscasBeforeOpen
    Left = 480
    Top = 168
    object cdsCondPagCOD_COND_PAG: TIntegerField
      FieldName = 'COD_COND_PAG'
      Required = True
    end
    object cdsCondPagDESC_COND_PAG: TStringField
      FieldName = 'DESC_COND_PAG'
      FixedChar = True
      Size = 30
    end
    object cdsCondPagSEQPRECO: TStringField
      FieldName = 'SEQPRECO'
      FixedChar = True
      Size = 1
    end
    object cdsCondPagMAX_DESC: TFloatField
      FieldName = 'MAX_DESC'
    end
    object cdsCondPagFINALIZADOR_CUPOM: TIntegerField
      FieldName = 'FINALIZADOR_CUPOM'
    end
  end
  object dspCondPag: TDataSetProvider
    DataSet = qrCondPag
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 480
    Top = 120
  end
  object dsCondPag: TDataSource
    AutoEdit = False
    DataSet = cdsCondPag
    Left = 480
    Top = 216
  end
  object transacaoFiscal: TIBTransaction
    DefaultDatabase = dtmAtivo.bancoFiscal
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 456
    Top = 8
  end
  object qrFDCxl: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select * from FECD_CXL')
    Left = 560
    Top = 72
  end
  object cdsFDCxl: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFDCxl'
    BeforeOpen = cdsBuscasBeforeOpen
    Left = 560
    Top = 168
    object cdsFDCxlN_MOV_CXL: TIntegerField
      FieldName = 'N_MOV_CXL'
      Required = True
    end
    object cdsFDCxlDIA_F_CXL: TDateTimeField
      FieldName = 'DIA_F_CXL'
      Required = True
    end
    object cdsFDCxlTOT_E_CXL: TFloatField
      FieldName = 'TOT_E_CXL'
    end
    object cdsFDCxlTOT_S_CXL: TFloatField
      FieldName = 'TOT_S_CXL'
    end
    object cdsFDCxlSALDO_CXL: TFloatField
      FieldName = 'SALDO_CXL'
    end
    object cdsFDCxlSTATUS_CXL: TStringField
      FieldName = 'STATUS_CXL'
      FixedChar = True
      Size = 10
    end
    object cdsFDCxlOP_CXL: TIntegerField
      FieldName = 'OP_CXL'
      Required = True
    end
    object cdsFDCxlCODIGO_EMP: TIntegerField
      FieldName = 'CODIGO_EMP'
      Required = True
    end
  end
  object dspFDCxl: TDataSetProvider
    DataSet = qrFDCxl
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 560
    Top = 120
  end
  object dsFDCxl: TDataSource
    AutoEdit = False
    DataSet = cdsFDCxl
    Left = 560
    Top = 216
  end
  object qrLancXcl: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select * from LANCCXL')
    Left = 640
    Top = 72
  end
  object cdsLancCxl: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspLancCxl'
    BeforeOpen = cdsBuscasBeforeOpen
    Left = 640
    Top = 168
    object cdsLancCxlCOD_LANCXL: TIntegerField
      FieldName = 'COD_LANCXL'
      Required = True
    end
    object cdsLancCxlTIPO_DOC_CXL: TStringField
      FieldName = 'TIPO_DOC_CXL'
      FixedChar = True
      Size = 3
    end
    object cdsLancCxlDATA_LC_CXL: TDateTimeField
      FieldName = 'DATA_LC_CXL'
    end
    object cdsLancCxlN_DOC_CXL: TIntegerField
      FieldName = 'N_DOC_CXL'
    end
    object cdsLancCxlTIPO_LANC_CXL: TStringField
      FieldName = 'TIPO_LANC_CXL'
      FixedChar = True
      Size = 1
    end
    object cdsLancCxlHISTORICO_CXL: TStringField
      FieldName = 'HISTORICO_CXL'
      Required = True
      FixedChar = True
      Size = 50
    end
    object cdsLancCxlVALOR_CXL: TFloatField
      FieldName = 'VALOR_CXL'
    end
    object cdsLancCxlSDD: TStringField
      FieldName = 'SDD'
      FixedChar = True
      Size = 1
    end
    object cdsLancCxlTR: TStringField
      FieldName = 'TR'
      FixedChar = True
      Size = 1
    end
    object cdsLancCxlOP_CXL: TIntegerField
      FieldName = 'OP_CXL'
    end
    object cdsLancCxlN_CONTA_PLC: TFloatField
      FieldName = 'N_CONTA_PLC'
    end
    object cdsLancCxlCODIGO_EMP: TIntegerField
      FieldName = 'CODIGO_EMP'
      Required = True
    end
    object cdsLancCxlN_REC: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'N_REC'
    end
    object cdsLancCxlREFRECIBO: TStringField
      FieldName = 'REFRECIBO'
      Size = 1
    end
    object cdsLancCxlTAXA_INTERMEDIADOR: TStringField
      FieldName = 'TAXA_INTERMEDIADOR'
      FixedChar = True
      Size = 1
    end
  end
  object dspLancCxl: TDataSetProvider
    DataSet = qrLancXcl
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 640
    Top = 120
  end
  object dsLancCxl: TDataSource
    AutoEdit = False
    DataSet = cdsLancCxl
    Left = 640
    Top = 216
  end
  object transacaoHwF: TIBTransaction
    DefaultDatabase = dtmAtivo.bancoHwF
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 632
    Top = 8
  end
  object qrControleF: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      
        'select CODIGO_CTRL, DOCS, NOME_CTRL, USAR_BOLETO, TP_PLANO from ' +
        'CONTROLES')
    Left = 176
    Top = 288
  end
  object cdsControleF: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'CODIGO_CTRL'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'DOCS'
        Attributes = [faFixed]
        DataType = ftString
        Size = 2
      end
      item
        Name = 'NOME_CTRL'
        Attributes = [faFixed]
        DataType = ftString
        Size = 35
      end
      item
        Name = 'USAR_BOLETO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'TP_PLANO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end>
    IndexDefs = <
      item
        Name = 'NomeControle'
        Fields = 'NOME_CTRL'
      end
      item
        Name = 'CodigoCOntrole'
        Fields = 'CODIGO_CTRL'
      end>
    IndexFieldNames = 'CODIGO_CTRL'
    Params = <>
    ProviderName = 'dspControleF'
    StoreDefs = True
    BeforeOpen = cdsBuscasBeforeOpen
    Left = 176
    Top = 384
    object cdsControleFCODIGO_CTRL: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO_CTRL'
      Required = True
    end
    object cdsControleFNOME_CTRL: TStringField
      DisplayLabel = 'Controle'
      FieldName = 'NOME_CTRL'
      FixedChar = True
      Size = 35
    end
    object cdsControleFDOCS: TStringField
      DisplayLabel = 'Doc'
      FieldName = 'DOCS'
      FixedChar = True
      Size = 2
    end
    object cdsControleFUSAR_BOLETO: TStringField
      DisplayLabel = 'Usar Boleto'
      FieldName = 'USAR_BOLETO'
      FixedChar = True
      Size = 1
    end
    object cdsControleFTP_PLANO: TStringField
      DisplayLabel = 'Tp Plano'
      FieldName = 'TP_PLANO'
      FixedChar = True
      Size = 1
    end
    object cdsControleFTIPO_PARCELAMENTO: TStringField
      FieldName = 'TIPO_PARCELAMENTO'
      Size = 2
    end
    object cdsControleFDIA_BASE_PARCELAMENTO: TStringField
      FieldName = 'DIA_BASE_PARCELAMENTO'
      Size = 2
    end
    object cdsControleFQSEQPERF: TIntegerField
      FieldName = 'QSEQPERF'
    end
  end
  object dspControleF: TDataSetProvider
    DataSet = qrControleF
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 176
    Top = 336
  end
  object qrCondPagF: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select * from COND_PAG')
    Left = 248
    Top = 288
  end
  object cdsCondPagF: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCondPagF'
    BeforeOpen = cdsBuscasBeforeOpen
    Left = 248
    Top = 384
    object cdsCondPagFCOD_COND_PAG: TIntegerField
      FieldName = 'COD_COND_PAG'
      Required = True
    end
    object cdsCondPagFDESC_COND_PAG: TStringField
      FieldName = 'DESC_COND_PAG'
      FixedChar = True
      Size = 30
    end
    object cdsCondPagFSEQPRECO: TStringField
      FieldName = 'SEQPRECO'
      FixedChar = True
      Size = 1
    end
    object cdsCondPagFMAX_DESC: TFloatField
      FieldName = 'MAX_DESC'
    end
    object cdsCondPagFFINALIZADOR_CUPOM: TIntegerField
      FieldName = 'FINALIZADOR_CUPOM'
    end
  end
  object dspCondPagF: TDataSetProvider
    DataSet = qrCondPagF
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 248
    Top = 336
  end
  object qrBancoF: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select * from CODIGO_BANCO')
    Left = 104
    Top = 288
  end
  object dspBancoF: TDataSetProvider
    DataSet = qrBancoF
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 104
    Top = 336
  end
  object cdsBancoF: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspBancoF'
    BeforeOpen = cdsBuscasBeforeOpen
    Left = 104
    Top = 384
    object cdsBancoFCOD_BANCO: TIntegerField
      FieldName = 'COD_BANCO'
      Required = True
    end
    object cdsBancoFDESC_BANCO: TStringField
      FieldName = 'DESC_BANCO'
      FixedChar = True
      Size = 30
    end
    object cdsBancoFQTLNBOL: TIntegerField
      FieldName = 'QTLNBOL'
    end
    object cdsBancoFENTRELINHAS: TStringField
      FieldName = 'ENTRELINHAS'
      FixedChar = True
    end
    object cdsBancoFPORTA_IMPRESSAO: TStringField
      FieldName = 'PORTA_IMPRESSAO'
      Size = 60
    end
    object cdsBancoFCOD_CONTROLE_CX: TIntegerField
      FieldName = 'COD_CONTROLE_CX'
    end
  end
  object qrBuscasF: TIBQuery
    Database = dtmAtivo.bancoFiscal
    Transaction = transacaoFiscal
    Left = 520
    Top = 8
  end
  object qrBuscasHwF: TIBQuery
    Database = dtmAtivo.bancoHwF
    Transaction = transacaoHwF
    Left = 704
    Top = 8
  end
  object qrJurosF: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select * from TABJUROS')
    Left = 328
    Top = 288
  end
  object cdsJurosF: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspJurosF'
    BeforeOpen = cdsBuscasBeforeOpen
    Left = 328
    Top = 384
    object cdsJurosFNPREST_J: TIntegerField
      FieldName = 'NPREST_J'
      Required = True
    end
    object cdsJurosFJUROS_J: TFloatField
      FieldName = 'JUROS_J'
    end
    object cdsJurosFCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsJurosFCOEF_J: TStringField
      FieldName = 'COEF_J'
      FixedChar = True
      Size = 10
    end
    object cdsJurosFATIVO: TIntegerField
      FieldName = 'ATIVO'
    end
  end
  object dspJurosF: TDataSetProvider
    DataSet = qrJurosF
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 328
    Top = 336
  end
  object qrFormPagF: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select * from FORMPAGAMENTO')
    Left = 24
    Top = 288
  end
  object dspFormPagF: TDataSetProvider
    DataSet = qrFormPagF
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 24
    Top = 336
  end
  object cdsFormPagF: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFormPagF'
    BeforeOpen = cdsBuscasBeforeOpen
    Left = 24
    Top = 384
    object cdsFormPagFSEQFORM: TIntegerField
      DisplayLabel = 'Sequencia'
      FieldName = 'SEQFORM'
      Required = True
    end
    object cdsFormPagFCOD_EMPRESA: TIntegerField
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsFormPagFNREQUISICAO: TIntegerField
      DisplayLabel = 'N'#186' Venda'
      FieldName = 'NREQUISICAO'
    end
    object cdsFormPagFNDOC: TStringField
      DisplayLabel = 'N'#186' Doc'
      FieldName = 'NDOC'
    end
    object cdsFormPagFTIPDOC: TStringField
      DisplayLabel = 'Tip Doc'
      FieldName = 'TIPDOC'
      FixedChar = True
      Size = 2
    end
    object cdsFormPagFCOD_CONTROLE: TIntegerField
      DisplayLabel = 'Cod Controle'
      FieldName = 'COD_CONTROLE'
    end
    object cdsFormPagFCLIENTE: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
      Size = 60
    end
    object cdsFormPagFCOD_CLIENTE: TIntegerField
      DisplayLabel = 'Cod Cliente'
      FieldName = 'COD_CLIENTE'
    end
    object cdsFormPagFHISTORICO: TStringField
      DisplayLabel = 'Hist'#243'rico'
      FieldName = 'HISTORICO'
      Size = 80
    end
    object cdsFormPagFCOD_BANCO: TIntegerField
      DisplayLabel = 'Cod Banco'
      FieldName = 'COD_BANCO'
    end
    object cdsFormPagFTERCEIROS: TStringField
      DisplayLabel = 'Terceiro'
      FieldName = 'TERCEIROS'
      Size = 80
    end
    object cdsFormPagFDATA_MOV: TDateTimeField
      DisplayLabel = 'Data Movimento'
      FieldName = 'DATA_MOV'
    end
    object cdsFormPagFVALORDOC: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VALORDOC'
    end
    object cdsFormPagFTPDOCS: TStringField
      DisplayLabel = 'Tipo Doc'
      FieldName = 'TPDOCS'
      Size = 6
    end
    object cdsFormPagFN_CONTA_PLC: TFloatField
      DisplayLabel = 'N'#186' Plano Contas'
      FieldName = 'N_CONTA_PLC'
    end
    object cdsFormPagFDATA_VENC: TDateTimeField
      DisplayLabel = 'Data Vencimento'
      FieldName = 'DATA_VENC'
    end
    object cdsFormPagFPRCSS: TStringField
      DisplayLabel = 'Processada'
      FieldName = 'PRCSS'
      FixedChar = True
      Size = 1
    end
    object cdsFormPagFAGENCIA: TStringField
      DisplayLabel = 'Agencia'
      FieldName = 'AGENCIA'
      Size = 10
    end
    object cdsFormPagFCONTA: TStringField
      DisplayLabel = 'Conta'
      FieldName = 'CONTA'
      Size = 15
    end
    object cdsFormPagFBANCO: TStringField
      DisplayLabel = 'Banco'
      FieldName = 'BANCO'
      Size = 35
    end
    object cdsFormPagFCOD_CLI_TERC: TIntegerField
      DisplayLabel = 'Cod Cliente Terceiro'
      FieldName = 'COD_CLI_TERC'
    end
    object cdsFormPagFOPERADOR: TIntegerField
      DisplayLabel = 'Operador'
      FieldName = 'OPERADOR'
    end
    object cdsFormPagFTIP_CNT: TStringField
      DisplayLabel = 'Tip Cont'#225'bil'
      FieldName = 'TIP_CNT'
      FixedChar = True
      Size = 1
    end
    object cdsFormPagFOP_CXL: TIntegerField
      DisplayLabel = 'Cod Operador Cxl'
      FieldName = 'OP_CXL'
    end
    object cdsFormPagFCODIGO_FUNC: TIntegerField
      DisplayLabel = 'Cod Funcion'#225'rio'
      FieldName = 'CODIGO_FUNC'
    end
    object cdsFormPagFN_AUT_CART: TStringField
      DisplayLabel = 'Num Aut Cartao'
      FieldName = 'N_AUT_CART'
      FixedChar = True
    end
    object cdsFormPagFPLANO: TStringField
      DisplayLabel = 'Plano'
      FieldName = 'PLANO'
      FixedChar = True
      Size = 1
    end
    object cdsFormPagFNUM_NOTA: TIntegerField
      DisplayLabel = 'Num Nota'
      FieldName = 'NUM_NOTA'
    end
    object cdsFormPagFSUB_SERIE: TIntegerField
      DisplayLabel = 'Sub S'#233'rie'
      FieldName = 'SUB_SERIE'
    end
    object cdsFormPagFNOSSO_NUMERO_BANCO: TStringField
      DisplayLabel = 'Nosso Numero'
      FieldName = 'NOSSO_NUMERO_BANCO'
    end
    object cdsFormPagFRECIBO: TStringField
      DisplayLabel = 'Recibo'
      FieldName = 'RECIBO'
      FixedChar = True
      Size = 1
    end
    object cdsFormPagFNCOO_ECF: TIntegerField
      DisplayLabel = 'N Cupom'
      FieldName = 'NCOO_ECF'
    end
    object cdsFormPagFSECAO: TIntegerField
      DisplayLabel = 'Secao Cupom'
      FieldName = 'SECAO'
    end
    object cdsFormPagFCOD_TERMINAL: TIntegerField
      DisplayLabel = 'Cod Terminal'
      FieldName = 'COD_TERMINAL'
    end
    object cdsFormPagFNSERIEECF: TStringField
      DisplayLabel = 'N Serie ECF'
      FieldName = 'NSERIEECF'
    end
    object cdsFormPagFREGISTRO: TIntegerField
      FieldName = 'REGISTRO'
    end
    object cdsFormPagFPRG_FID: TStringField
      Tag = 1
      FieldName = 'PRG_FID'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object cdsFormPagFVALORDOCBRUTO: TFloatField
      FieldName = 'VALORDOCBRUTO'
    end
    object cdsFormPagFCONTROLE_TEMP: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'CONTROLE_TEMP'
      Size = 35
    end
  end
  object cdsFormPag2: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 368
    Top = 8
    object cdsFormPag2SEQFORM: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'SEQFORM'
      Required = True
    end
    object cdsFormPag2COD_EMPRESA: TIntegerField
      DisplayLabel = 'C'#243'digo Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsFormPag2NREQUISICAO: TIntegerField
      DisplayLabel = 'N'#186' Venda'
      FieldName = 'NREQUISICAO'
    end
    object cdsFormPag2NDOC: TStringField
      DisplayLabel = 'N'#186' Doc'
      FieldName = 'NDOC'
    end
    object cdsFormPag2TIPDOC: TStringField
      DisplayLabel = 'Tipo Doc'
      FieldName = 'TIPDOC'
      FixedChar = True
      Size = 2
    end
    object cdsFormPag2COD_CONTROLE: TIntegerField
      DisplayLabel = 'C'#243'digo Controle'
      FieldName = 'COD_CONTROLE'
    end
    object cdsFormPag2COD_CLIENTE: TIntegerField
      DisplayLabel = 'C'#243'digo Cliente'
      FieldName = 'COD_CLIENTE'
    end
    object cdsFormPag2CLIENTE: TStringField
      DisplayLabel = 'Nome Cliente'
      FieldName = 'CLIENTE'
      Size = 60
    end
    object cdsFormPag2HISTORICO: TStringField
      DisplayLabel = 'Hist'#243'rico'
      FieldName = 'HISTORICO'
      Size = 80
    end
    object cdsFormPag2COD_BANCO: TIntegerField
      DisplayLabel = 'C'#243'digo banco'
      FieldName = 'COD_BANCO'
    end
    object cdsFormPag2BANCO: TStringField
      DisplayLabel = 'Banco'
      FieldName = 'BANCO'
      Size = 35
    end
    object cdsFormPag2COD_CLI_TERC: TIntegerField
      DisplayLabel = 'C'#243'digo Terceiro'
      FieldName = 'COD_CLI_TERC'
    end
    object cdsFormPag2TERCEIROS: TStringField
      DisplayLabel = 'Nome Terceiros'
      FieldName = 'TERCEIROS'
      Size = 80
    end
    object cdsFormPag2DATA_MOV: TDateTimeField
      DisplayLabel = 'Data Movimento'
      FieldName = 'DATA_MOV'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsFormPag2VALORDOC: TFloatField
      DisplayLabel = 'Valor Doc'
      FieldName = 'VALORDOC'
      currency = True
    end
    object cdsFormPag2TPDOCS: TStringField
      DisplayLabel = 'Doc Tp'
      FieldName = 'TPDOCS'
      FixedChar = True
      Size = 6
    end
    object cdsFormPag2N_CONTA_PLC: TFloatField
      DisplayLabel = 'N'#186' Plano'
      FieldName = 'N_CONTA_PLC'
    end
    object cdsFormPag2DATA_VENC: TDateTimeField
      DisplayLabel = 'Data Vencimento'
      FieldName = 'DATA_VENC'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsFormPag2PRCSS: TStringField
      DisplayLabel = 'Processada'
      FieldName = 'PRCSS'
      FixedChar = True
      Size = 1
    end
    object cdsFormPag2AGENCIA: TStringField
      DisplayLabel = 'Ag'#234'ncia'
      FieldName = 'AGENCIA'
      Size = 10
    end
    object cdsFormPag2CONTA: TStringField
      DisplayLabel = 'Conta'
      FieldName = 'CONTA'
      Size = 15
    end
    object cdsFormPag2OPERADOR: TIntegerField
      DisplayLabel = 'N'#186' Vendedor'
      FieldName = 'OPERADOR'
    end
    object cdsFormPag2OP_CXL: TIntegerField
      DisplayLabel = 'N'#186' Operador'
      FieldName = 'OP_CXL'
    end
    object cdsFormPag2CODIGO_FUNC: TIntegerField
      DisplayLabel = 'N'#186' Funcion'#225'rio'
      FieldName = 'CODIGO_FUNC'
    end
    object cdsFormPag2TIP_CNT: TStringField
      DisplayLabel = 'Cont'#225'bil'
      FieldName = 'TIP_CNT'
      FixedChar = True
      Size = 1
    end
    object cdsFormPag2N_AUT_CART: TStringField
      DisplayLabel = 'N'#186' Autencica'#231#227'o Cart'#227'o'
      FieldName = 'N_AUT_CART'
      FixedChar = True
    end
    object cdsFormPag2PLANO: TStringField
      DisplayLabel = 'Plano'
      FieldName = 'PLANO'
      FixedChar = True
      Size = 1
    end
    object cdsFormPag2NUM_NOTA: TIntegerField
      DisplayLabel = 'N'#186' Nota Fiscal'
      FieldName = 'NUM_NOTA'
    end
    object cdsFormPag2SUB_SERIE: TIntegerField
      DisplayLabel = 'Sub S'#233'rie NF'
      FieldName = 'SUB_SERIE'
    end
    object cdsFormPag2NOSSO_NUMERO_BANCO: TStringField
      DisplayLabel = 'Nosso N'#250'mero'
      FieldName = 'NOSSO_NUMERO_BANCO'
    end
    object cdsFormPag2RECIBO: TStringField
      DisplayLabel = 'Recibo'
      FieldName = 'RECIBO'
      FixedChar = True
      Size = 1
    end
    object cdsFormPag2REC_TIPVEND: TStringField
      FieldName = 'REC_TIPVEND'
      FixedChar = True
      Size = 3
    end
    object cdsFormPag2REC_NUMVEND: TIntegerField
      FieldName = 'REC_NUMVEND'
    end
    object cdsFormPag2CONTROLE: TStringField
      FieldKind = fkLookup
      FieldName = 'CONTROLE'
      LookupDataSet = cdsCtrl
      LookupKeyFields = 'CODIGO_CTRL'
      LookupResultField = 'NOME_CTRL'
      KeyFields = 'COD_CONTROLE'
      Size = 35
      Lookup = True
    end
    object cdsFormPag2REF_FRETE: TStringField
      FieldName = 'REF_FRETE'
      Size = 1
    end
    object cdsFormPag2VALOR_CONTABIL: TFloatField
      FieldName = 'VALOR_CONTABIL'
    end
    object cdsFormPag2COD_BANCO_STR: TStringField
      FieldName = 'COD_BANCO_STR'
      Size = 11
    end
    object cdsFormPag2VL_BAIXA_COMISSAO: TFloatField
      FieldName = 'VL_BAIXA_COMISSAO'
    end
    object cdsFormPag2VL_BAIXA_COMISSAO_GER: TFloatField
      FieldName = 'VL_BAIXA_COMISSAO_GER'
    end
    object cdsFormPag2N_REC: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'N_REC'
    end
    object cdsFormPag2PERMITIR_EXCLUIR: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'PERMITIR_EXCLUIR'
      Size = 1
    end
    object cdsFormPag2US_CAD: TIntegerField
      DisplayLabel = 'Usuario que cadastrou'
      FieldName = 'US_CAD'
    end
    object cdsFormPag2NPARCELA: TIntegerField
      FieldName = 'NPARCELA'
    end
    object cdsFormPag2N_DOCNSU_ADM: TStringField
      FieldName = 'N_DOCNSU_ADM'
      Size = 10
    end
    object cdsFormPag2COD_TERMINAL_ADM: TStringField
      FieldName = 'COD_TERMINAL_ADM'
      Size = 10
    end
    object cdsFormPag2CONTROLE_TEMP: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'CONTROLE_TEMP'
      Size = 35
    end
  end
  object dspEmpresa: TDataSetProvider
    DataSet = qrEmpresa
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 405
    Top = 337
  end
  object qrEmpresa: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      
        'SELECT DIAS_PREC_TAB,PRAZO_MED_VND,CUSTO_BOLETA,TX_CARTAO,PERC_V' +
        'ND_CARTAO,DIAS_REC_FIN,ADIC_FIN,VND_MIN_FIN,TX_JUROS,CASAS_DECIM' +
        'AIS,TX_CARTAO_PARC,TOTDESC_EMP,TOTDESC_EMPA FROM EMPRESA'
      'where ativo=1')
    Left = 405
    Top = 287
  end
  object cdsEmpresa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEmpresa'
    BeforeOpen = cdsBuscasBeforeOpen
    Left = 405
    Top = 386
    object cdsEmpresaDIAS_PREC_TAB: TIntegerField
      FieldName = 'DIAS_PREC_TAB'
    end
    object cdsEmpresaPRAZO_MED_VND: TIntegerField
      FieldName = 'PRAZO_MED_VND'
    end
    object cdsEmpresaCUSTO_BOLETA: TFloatField
      FieldName = 'CUSTO_BOLETA'
    end
    object cdsEmpresaTX_CARTAO: TFloatField
      FieldName = 'TX_CARTAO'
    end
    object cdsEmpresaPERC_VND_CARTAO: TFloatField
      FieldName = 'PERC_VND_CARTAO'
    end
    object cdsEmpresaDIAS_REC_FIN: TIntegerField
      FieldName = 'DIAS_REC_FIN'
    end
    object cdsEmpresaADIC_FIN: TFloatField
      FieldName = 'ADIC_FIN'
    end
    object cdsEmpresaVND_MIN_FIN: TFloatField
      FieldName = 'VND_MIN_FIN'
    end
    object cdsEmpresaTX_JUROS: TFloatField
      FieldName = 'TX_JUROS'
    end
    object cdsEmpresaCASAS_DECIMAIS: TIntegerField
      FieldName = 'CASAS_DECIMAIS'
    end
    object cdsEmpresaTX_CARTAO_PARC: TFloatField
      FieldName = 'TX_CARTAO_PARC'
    end
    object cdsEmpresaTOTDESC_EMP: TFloatField
      FieldName = 'TOTDESC_EMP'
    end
    object cdsEmpresaTOTDESC_EMPA: TFloatField
      FieldName = 'TOTDESC_EMPA'
    end
  end
  object dspPlano: TDataSetProvider
    DataSet = qrPlano
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 477
    Top = 337
  end
  object qrPlano: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select * from PLANO_PAG')
    Left = 477
    Top = 287
  end
  object cdsPlano: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPlano'
    BeforeOpen = cdsBuscasBeforeOpen
    Left = 477
    Top = 386
    object cdsPlanoSEQPLANO: TIntegerField
      FieldName = 'SEQPLANO'
      Required = True
    end
    object cdsPlanoCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsPlanoNREQUISICAO: TIntegerField
      FieldName = 'NREQUISICAO'
    end
    object cdsPlanoTIPDOC: TStringField
      FieldName = 'TIPDOC'
      FixedChar = True
      Size = 2
    end
    object cdsPlanoCOD_CONTROLE: TIntegerField
      FieldName = 'COD_CONTROLE'
    end
    object cdsPlanoCOD_CLIENTE: TIntegerField
      FieldName = 'COD_CLIENTE'
    end
    object cdsPlanoHISTORICO: TStringField
      FieldName = 'HISTORICO'
      Size = 80
    end
    object cdsPlanoDATA_MOV: TDateTimeField
      FieldName = 'DATA_MOV'
    end
    object cdsPlanoVALORDOC: TFloatField
      FieldName = 'VALORDOC'
    end
    object cdsPlanoTPDOCS: TStringField
      FieldName = 'TPDOCS'
      FixedChar = True
      Size = 6
    end
    object cdsPlanoDATA_VENC: TDateTimeField
      FieldName = 'DATA_VENC'
    end
    object cdsPlanoOPERADOR: TIntegerField
      FieldName = 'OPERADOR'
    end
    object cdsPlanoTIP_CNT: TStringField
      FieldName = 'TIP_CNT'
      FixedChar = True
      Size = 1
    end
    object cdsPlanoTEXTO_PLANO: TMemoField
      FieldName = 'TEXTO_PLANO'
      BlobType = ftMemo
      Size = 8
    end
    object cdsPlanoNOME_CTRL: TStringField
      FieldName = 'NOME_CTRL'
      Size = 35
    end
    object cdsPlanoENTRVALOR: TStringField
      FieldName = 'ENTRVALOR'
      Size = 1
    end
    object cdsPlanoVALOROPERACAO: TFloatField
      FieldName = 'VALOROPERACAO'
    end
    object cdsPlanoVALOR_REAL: TFloatField
      FieldName = 'VALOR_REAL'
    end
    object cdsPlanoVALOR_NF: TFloatField
      FieldName = 'VALOR_NF'
    end
  end
  object dspBolFp: TDataSetProvider
    DataSet = qrBolFp
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 557
    Top = 337
  end
  object qrBolFp: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      
        'select b.data_ven_bol, b.n_doc_bol, b.vl_doc_bol, ct.codigo_ctrl' +
        ','
      'c.cod_cliente, c.nome_cliente, b.nosso_numero_banco'
      'from boletas b'
      
        'left join controles ct on ct.codigo_ctrl = b.cod_controle_cx and' +
        ' ct.codigo_emp = b.cod_empresa'
      
        'left join clientes c on c.cod_cliente = b.cod_cliente and c.cod_' +
        'empresa = b.cod_empresa'
      
        'where b.num_nf_vnd = :nnf and b.sub_serie = :ss and b.cod_empres' +
        'a = :cod_empresa'
      'and b.ativo = 1 and b.cod_controle_cx > 0')
    Left = 557
    Top = 287
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'nnf'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ss'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cod_empresa'
        ParamType = ptUnknown
      end>
  end
  object cdsBolFp: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspBolFp'
    BeforeOpen = cdsBuscasBeforeOpen
    Left = 557
    Top = 386
  end
  object dspJurosPl2: TDataSetProvider
    DataSet = qrJurosPl2
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 629
    Top = 337
  end
  object qrJurosPl2: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select * from tabjuros_plano')
    Left = 629
    Top = 287
  end
  object cdsJurosPl2: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspJurosPl2'
    BeforeOpen = cdsBuscasBeforeOpen
    Left = 629
    Top = 386
    object cdsJurosPl2NUMERO_PRESTACOES: TIntegerField
      DisplayLabel = 'N'#186' Parcelas'
      FieldName = 'NUMERO_PRESTACOES'
      Required = True
    end
    object cdsJurosPl2COD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsJurosPl2JUROS_CARTAO: TFloatField
      DisplayLabel = 'Cart'#227'o'
      FieldName = 'JUROS_CARTAO'
    end
    object cdsJurosPl2JUROS_CARTAO_COM_ENTRADA: TFloatField
      DisplayLabel = 'Cart'#227'o c/ Ent'
      FieldName = 'JUROS_CARTAO_COM_ENTRADA'
    end
    object cdsJurosPl2JUROS_CHEQUE: TFloatField
      DisplayLabel = 'Cheque'
      FieldName = 'JUROS_CHEQUE'
    end
    object cdsJurosPl2JUROS_CHEQUE_COM_ENTRADA: TFloatField
      DisplayLabel = 'Cheque c/ Ent'
      FieldName = 'JUROS_CHEQUE_COM_ENTRADA'
    end
    object cdsJurosPl2JUROS_BOLETA: TFloatField
      DisplayLabel = 'Boleta'
      FieldName = 'JUROS_BOLETA'
    end
    object cdsJurosPl2JUROS_BOLETA_COM_ENTRADA: TFloatField
      DisplayLabel = 'Boleta c/ Ent'
      FieldName = 'JUROS_BOLETA_COM_ENTRADA'
    end
    object cdsJurosPl2JUROS_CREDIARIO: TFloatField
      DisplayLabel = 'Credi'#225'rio'
      FieldName = 'JUROS_CREDIARIO'
    end
    object cdsJurosPl2JUROS_CREDIARIO_COM_ENTRADA: TFloatField
      DisplayLabel = 'Credi'#225'rio c/ Ent'
      FieldName = 'JUROS_CREDIARIO_COM_ENTRADA'
    end
  end
  object dspPlano2: TDataSetProvider
    DataSet = qrPlano2
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 709
    Top = 337
  end
  object qrPlano2: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select * from plano_pag')
    Left = 709
    Top = 287
  end
  object cdsPlano2: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPlano2'
    BeforeOpen = cdsBuscasBeforeOpen
    Left = 709
    Top = 386
    object cdsPlano2SEQPLANO: TIntegerField
      FieldName = 'SEQPLANO'
      Required = True
    end
    object cdsPlano2COD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsPlano2NREQUISICAO: TIntegerField
      FieldName = 'NREQUISICAO'
    end
    object cdsPlano2TIPDOC: TStringField
      FieldName = 'TIPDOC'
      FixedChar = True
      Size = 2
    end
    object cdsPlano2COD_CONTROLE: TIntegerField
      FieldName = 'COD_CONTROLE'
    end
    object cdsPlano2COD_CLIENTE: TIntegerField
      FieldName = 'COD_CLIENTE'
    end
    object cdsPlano2HISTORICO: TStringField
      FieldName = 'HISTORICO'
      Size = 80
    end
    object cdsPlano2DATA_MOV: TDateTimeField
      FieldName = 'DATA_MOV'
    end
    object cdsPlano2VALORDOC: TFloatField
      FieldName = 'VALORDOC'
    end
    object cdsPlano2TPDOCS: TStringField
      FieldName = 'TPDOCS'
      FixedChar = True
      Size = 6
    end
    object cdsPlano2DATA_VENC: TDateTimeField
      FieldName = 'DATA_VENC'
    end
    object cdsPlano2OPERADOR: TIntegerField
      FieldName = 'OPERADOR'
    end
    object cdsPlano2TIP_CNT: TStringField
      FieldName = 'TIP_CNT'
      FixedChar = True
      Size = 1
    end
    object cdsPlano2TEXTO_PLANO: TMemoField
      FieldName = 'TEXTO_PLANO'
      BlobType = ftMemo
      Size = 8
    end
    object cdsPlano2ATIVO: TIntegerField
      FieldName = 'ATIVO'
    end
  end
  object dsJurosPl2: TDataSource
    DataSet = cdsJurosPl2
    Left = 632
    Top = 432
  end
  object qrColaborador: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select cod_vendedor, nome_vendedor from colaborador')
    Left = 864
    Top = 72
  end
  object cdsColaborador: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspColaborador'
    BeforeOpen = cdsBuscasBeforeOpen
    Left = 864
    Top = 168
    object cdsColaboradorCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
      Required = True
    end
    object cdsColaboradorNOME_VENDEDOR: TStringField
      FieldName = 'NOME_VENDEDOR'
      Size = 35
    end
  end
  object dspColaborador: TDataSetProvider
    DataSet = qrColaborador
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 864
    Top = 120
  end
  object dsColaborador: TDataSource
    AutoEdit = False
    DataSet = cdsColaborador
    Left = 864
    Top = 216
  end
  object qrContasBanc: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select cb.*, c.nome_cliente from contasbancarias cb'
      
        'inner join clientes c on c.cod_cliente = cb.cod_cliente and c.co' +
        'd_empresa = cb.cod_empresa'
      'where cb.cod_cliente = 0 and cb.cod_empresa = 0')
    Left = 797
    Top = 272
  end
  object dspContasBanc: TDataSetProvider
    DataSet = qrContasBanc
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 797
    Top = 320
  end
  object cdsContasBanc: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspContasBanc'
    BeforeOpen = cdsBuscasBeforeOpen
    Left = 797
    Top = 368
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
    Left = 797
    Top = 416
  end
  object qrBuscas2: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    Left = 16
    Top = 8
  end
  object qrCtrl: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      
        'select CODIGO_CTRL, DOCS, NOME_CTRL, USAR_BOLETO, TP_PLANO from ' +
        'CONTROLES')
    Left = 880
    Top = 272
  end
  object cdsCtrl: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'CODIGO_CTRL'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'DOCS'
        Attributes = [faFixed]
        DataType = ftString
        Size = 2
      end
      item
        Name = 'NOME_CTRL'
        DataType = ftString
        Size = 35
      end
      item
        Name = 'USAR_BOLETO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'TP_PLANO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end>
    IndexDefs = <
      item
        Name = 'NomeControle'
        Fields = 'NOME_CTRL'
      end
      item
        Name = 'CodigoCOntrole'
        Fields = 'CODIGO_CTRL'
      end>
    IndexFieldNames = 'CODIGO_CTRL'
    Params = <>
    ProviderName = 'dspCtrl'
    StoreDefs = True
    BeforeOpen = cdsBuscasBeforeOpen
    Left = 880
    Top = 368
    object IntegerField1: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO_CTRL'
      Origin = '"CONTROLES"."CODIGO_CTRL"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object StringField1: TStringField
      DisplayLabel = 'Controle'
      FieldName = 'NOME_CTRL'
      Origin = '"CONTROLES"."NOME_CTRL"'
      FixedChar = True
      Size = 35
    end
    object StringField2: TStringField
      DisplayLabel = 'Doc'
      FieldName = 'DOCS'
      Origin = '"CONTROLES"."DOCS"'
      FixedChar = True
      Size = 2
    end
    object StringField3: TStringField
      DisplayLabel = 'Usar Boleto'
      FieldName = 'USAR_BOLETO'
      Origin = '"CONTROLES"."USAR_BOLETO"'
      FixedChar = True
      Size = 1
    end
    object StringField4: TStringField
      DisplayLabel = 'Tp Plano'
      FieldName = 'TP_PLANO'
      Origin = '"CONTROLES"."TP_PLANO"'
      FixedChar = True
      Size = 1
    end
  end
  object dspCtrl: TDataSetProvider
    DataSet = qrCtrl
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 880
    Top = 320
  end
  object qrTermCartao: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      
        'select tc.*, ac.taxa_por_controle_bandeira from terminal_cartao ' +
        'tc'
      
        'inner join adm_cartao ac on ac.cod_adm = tc.cod_adm and ac.cod_e' +
        'mpresa = tc.cod_empresa and ac.ativo = 1'
      'where tc.cod_empresa = 2 and tc.ativo = 1')
    Left = 941
    Top = 64
  end
  object dspTermCartao: TDataSetProvider
    DataSet = qrTermCartao
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 941
    Top = 112
  end
  object cdsTermCartao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTermCartao'
    BeforeOpen = cdsBuscasBeforeOpen
    Left = 941
    Top = 160
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
    object cdsTermCartaoTAXA_POR_CONTROLE_BANDEIRA: TStringField
      FieldName = 'TAXA_POR_CONTROLE_BANDEIRA'
      FixedChar = True
      Size = 1
    end
  end
  object dsTermCartao: TDataSource
    DataSet = cdsTermCartao
    Left = 941
    Top = 208
  end
  object qrEcommerce: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      
        'select 0 seqform, fe.cod_empresa, fe.local_venda, fe.intermediad' +
        'or, fe.valordoc, fe.cliente, fe.cod_cliente,'
      
        'fe.metodo_pag_id, fe.data_cad, count(*) qtde from formpagamento_' +
        'ec fe'
      
        'inner join pedvenda pd on pd.nped = fe.nrequisicao and pd.tipo =' +
        ' fe.tpdocs and pd.cod_empresa = fe.cod_empresa'
      'group by 1, 2, 3, 4, 5, 6, 7, 8, 9'
      'order by metodo_pag_id')
    Left = 24
    Top = 440
  end
  object cdsEcommerce: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEcommerce'
    BeforeOpen = cdsBuscasBeforeOpen
    Left = 24
    Top = 536
    object cdsEcommerceSEL: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'SEL'
      Size = 1
    end
    object cdsEcommerceUTILIZADO: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'UTILIZADO'
      Size = 1
    end
    object cdsEcommerceCOD_CONTROLE: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'COD_CONTROLE'
    end
    object cdsEcommerceNOME_CTRL: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'NOME_CTRL'
      Size = 35
    end
    object cdsEcommerceDOCS: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'DOCS'
      Size = 2
    end
    object cdsEcommerceSEQFORM: TIntegerField
      FieldName = 'SEQFORM'
    end
    object cdsEcommerceCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsEcommerceLOCAL_VENDA: TStringField
      FieldName = 'LOCAL_VENDA'
      Size = 80
    end
    object cdsEcommerceINTERMEDIADOR: TStringField
      FieldName = 'INTERMEDIADOR'
      Size = 80
    end
    object cdsEcommerceVALORDOC: TFloatField
      FieldName = 'VALORDOC'
      currency = True
    end
    object cdsEcommerceCLIENTE: TStringField
      FieldName = 'CLIENTE'
      Size = 60
    end
    object cdsEcommerceCOD_CLIENTE: TIntegerField
      FieldName = 'COD_CLIENTE'
    end
    object cdsEcommerceMETODO_PAG_ID: TIntegerField
      FieldName = 'METODO_PAG_ID'
    end
    object cdsEcommerceDATA_CAD: TDateTimeField
      Tag = 1
      DisplayLabel = 'Data Cad'
      FieldName = 'DATA_CAD'
      Visible = False
    end
    object cdsEcommerceQTDE: TIntegerField
      FieldName = 'QTDE'
    end
  end
  object dspEcommerce: TDataSetProvider
    DataSet = qrEcommerce
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 24
    Top = 488
  end
  object dsEcommerce: TDataSource
    AutoEdit = False
    DataSet = cdsEcommerce
    Left = 24
    Top = 584
  end
  object qrIntermediadorPag: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      
        'select inter.*, ctr.nome_ctrl, cond.desc_cond_pag from intermedi' +
        'ador_controle_ec inter'
      'left join controles ctr on ctr.codigo_ctrl = inter.codigo_ctrl'
      '    and ctr.codigo_emp = inter.cod_empresa'
      
        'left join cond_pag cond on cond.cod_cond_pag = inter.cod_cond_pa' +
        'g')
    Left = 120
    Top = 440
  end
  object cdsIntermediadorPag: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspIntermediadorPag'
    BeforeOpen = cdsBuscasBeforeOpen
    Left = 120
    Top = 536
    object cdsIntermediadorPagSEQID: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'SEQID'
      Required = True
    end
    object cdsIntermediadorPagCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
      Visible = False
    end
    object cdsIntermediadorPagLOCAL_VENDA: TStringField
      DisplayLabel = 'Local Venda'
      FieldName = 'LOCAL_VENDA'
      Size = 80
    end
    object cdsIntermediadorPagINTERMEDIADOR: TStringField
      DisplayLabel = 'Intermediador Pag'
      FieldName = 'INTERMEDIADOR'
      Required = True
      Size = 80
    end
    object cdsIntermediadorPagCODIGO_CTRL: TIntegerField
      DisplayLabel = 'Cod Controle'
      DisplayWidth = 10
      FieldName = 'CODIGO_CTRL'
      Required = True
    end
    object cdsIntermediadorPagMETODO_PAG_ID: TIntegerField
      DisplayLabel = 'Id Metodo Pag'
      FieldName = 'METODO_PAG_ID'
    end
    object cdsIntermediadorPagNOME_CTRL: TStringField
      DisplayLabel = 'Controle'
      FieldName = 'NOME_CTRL'
      Size = 35
    end
    object cdsIntermediadorPagCOD_COND_PAG: TIntegerField
      DisplayLabel = 'Cod Cond Pag'
      FieldName = 'COD_COND_PAG'
    end
    object cdsIntermediadorPagDESC_COND_PAG: TStringField
      DisplayLabel = 'Cond Pag'
      FieldName = 'DESC_COND_PAG'
      Size = 30
    end
    object cdsIntermediadorPagIDCADINTTRAN: TStringField
      DisplayLabel = 'Identifica'#231#227'o da empresa no intermediador de pagamento'
      FieldName = 'IDCADINTTRAN'
      Size = 60
    end
  end
  object dspIntermediadorPag: TDataSetProvider
    DataSet = qrIntermediadorPag
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 120
    Top = 488
  end
  object dsIntermediadorPag: TDataSource
    AutoEdit = False
    DataSet = cdsIntermediadorPag
    Left = 120
    Top = 584
  end
  object qrCtrlIntermediadorPag: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      
        'select CODIGO_CTRL, DOCS, NOME_CTRL, USAR_BOLETO, TP_PLANO from ' +
        'CONTROLES')
    Left = 256
    Top = 440
  end
  object cdsCtrlIntermediadorPag: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCtrlIntermediadorPag'
    BeforeOpen = cdsBuscasBeforeOpen
    Left = 256
    Top = 536
    object cdsCtrlIntermediadorPagCODIGO_CTRL: TIntegerField
      FieldName = 'CODIGO_CTRL'
      Required = True
    end
    object cdsCtrlIntermediadorPagDOCS: TStringField
      FieldName = 'DOCS'
      FixedChar = True
      Size = 2
    end
    object cdsCtrlIntermediadorPagNOME_CTRL: TStringField
      FieldName = 'NOME_CTRL'
      Size = 35
    end
    object cdsCtrlIntermediadorPagUSAR_BOLETO: TStringField
      FieldName = 'USAR_BOLETO'
      FixedChar = True
      Size = 1
    end
    object cdsCtrlIntermediadorPagTP_PLANO: TStringField
      FieldName = 'TP_PLANO'
      FixedChar = True
      Size = 1
    end
  end
  object dspCtrlIntermediadorPag: TDataSetProvider
    DataSet = qrCtrlIntermediadorPag
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 256
    Top = 488
  end
  object dsCtrlIntermediadorPag: TDataSource
    AutoEdit = False
    DataSet = cdsCtrlIntermediadorPag
    Left = 256
    Top = 584
  end
  object qrVincIntermediadorPag: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      
        'select CODIGO_CTRL, DOCS, NOME_CTRL, USAR_BOLETO, TP_PLANO from ' +
        'CONTROLES')
    Left = 536
    Top = 440
  end
  object cdsVincIntermediadorPag: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspVincIntermediadorPag'
    BeforeOpen = cdsBuscasBeforeOpen
    Left = 536
    Top = 536
    object IntegerField6: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'SEQID'
      Required = True
    end
    object IntegerField7: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
      Visible = False
    end
    object StringField7: TStringField
      DisplayLabel = 'Intermediador Pag'
      FieldName = 'INTERMEDIADOR'
      Required = True
      Size = 80
    end
    object IntegerField8: TIntegerField
      DisplayLabel = 'Cod Controle'
      DisplayWidth = 10
      FieldName = 'CODIGO_CTRL'
      Required = True
    end
    object IntegerField9: TIntegerField
      DisplayLabel = 'Id Metodo Pag'
      FieldName = 'METODO_PAG_ID'
    end
    object StringField8: TStringField
      DisplayLabel = 'Controle'
      FieldName = 'NOME_CTRL'
      Size = 35
    end
  end
  object dspVincIntermediadorPag: TDataSetProvider
    DataSet = qrVincIntermediadorPag
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 536
    Top = 488
  end
  object dsVincIntermediadorPag: TDataSource
    AutoEdit = False
    DataSet = cdsVincIntermediadorPag
    Left = 536
    Top = 584
  end
  object qrCondPagIntermediadorPag: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select * from COND_PAG')
    Left = 400
    Top = 440
  end
  object cdsCondPagIntermediadorPag: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCondPagIntermediadorPag'
    BeforeOpen = cdsBuscasBeforeOpen
    Left = 400
    Top = 536
    object cdsCondPagIntermediadorPagCOD_COND_PAG: TIntegerField
      FieldName = 'COD_COND_PAG'
      Required = True
    end
    object cdsCondPagIntermediadorPagDESC_COND_PAG: TStringField
      FieldName = 'DESC_COND_PAG'
      Size = 30
    end
    object cdsCondPagIntermediadorPagSEQPRECO: TStringField
      FieldName = 'SEQPRECO'
      FixedChar = True
      Size = 1
    end
    object cdsCondPagIntermediadorPagMAX_DESC: TFloatField
      FieldName = 'MAX_DESC'
    end
    object cdsCondPagIntermediadorPagFINALIZADOR_CUPOM: TIntegerField
      FieldName = 'FINALIZADOR_CUPOM'
    end
  end
  object dspCondPagIntermediadorPag: TDataSetProvider
    DataSet = qrCondPagIntermediadorPag
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 400
    Top = 488
  end
  object dsCondPagIntermediadorPag: TDataSource
    AutoEdit = False
    DataSet = cdsCondPagIntermediadorPag
    Left = 400
    Top = 584
  end
  object qrValeCupom: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select vl.*  from vale_cupons vl'
      'where vl.cod_empresa = :cod_empresa')
    Left = 704
    Top = 448
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cod_empresa'
        ParamType = ptUnknown
      end>
  end
  object cdsValeCupom: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspValeCupom'
    BeforeOpen = cdsBuscasBeforeOpen
    Left = 704
    Top = 544
    object cdsValeCupomSEL: TStringField
      DisplayLabel = 'Sel'
      FieldKind = fkInternalCalc
      FieldName = 'SEL'
      Size = 1
    end
    object cdsValeCupomCODIGO: TStringField
      FieldName = 'CODIGO'
      Required = True
      Size = 32
    end
    object cdsValeCupomERP_API: TStringField
      FieldName = 'ERP_API'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsValeCupomCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsValeCupomNOME: TStringField
      FieldName = 'NOME'
      Size = 100
    end
    object cdsValeCupomCPF: TStringField
      FieldName = 'CPF'
      Size = 18
    end
    object cdsValeCupomCARTAO: TStringField
      FieldName = 'CARTAO'
      Size = 100
    end
    object cdsValeCupomPONTOS: TFloatField
      FieldName = 'PONTOS'
    end
    object cdsValeCupomVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object cdsValeCupomDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 100
    end
    object cdsValeCupomEMPRESA: TStringField
      FieldName = 'EMPRESA'
      Size = 100
    end
    object cdsValeCupomVALIDADO: TDateTimeField
      FieldName = 'VALIDADO'
    end
    object cdsValeCupomOPERADOR: TStringField
      FieldName = 'OPERADOR'
      Size = 100
    end
    object cdsValeCupomDATAHORA: TDateTimeField
      FieldName = 'DATAHORA'
    end
    object cdsValeCupomNDOC: TIntegerField
      FieldName = 'NDOC'
    end
    object cdsValeCupomTIPODOC: TStringField
      FieldName = 'TIPODOC'
      FixedChar = True
      Size = 3
    end
    object cdsValeCupomCOD_EMP_TIPODOC: TIntegerField
      FieldName = 'COD_EMP_TIPODOC'
    end
    object cdsValeCupomNUM_DOC: TIntegerField
      FieldName = 'NUM_DOC'
    end
    object cdsValeCupomTIPO_DOC: TStringField
      FieldName = 'TIPO_DOC'
      FixedChar = True
      Size = 3
    end
    object cdsValeCupomCOD_EMP_DOC: TIntegerField
      FieldName = 'COD_EMP_DOC'
    end
  end
  object dspValeCupom: TDataSetProvider
    DataSet = qrValeCupom
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 704
    Top = 496
  end
  object dsValeCupom: TDataSource
    AutoEdit = False
    DataSet = cdsValeCupom
    Left = 704
    Top = 592
  end
  object qrBandeiraCartao: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      
        'select bd.* from bandeiras_cartao bd where bd.cod_empresa = :cod' +
        '_empresa and bd.ativo = 1')
    Left = 1045
    Top = 64
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cod_empresa'
        ParamType = ptUnknown
      end>
  end
  object dspBandeiraCartao: TDataSetProvider
    DataSet = qrBandeiraCartao
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1045
    Top = 112
  end
  object cdsBandeiraCartao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspBandeiraCartao'
    BeforeOpen = cdsBuscasBeforeOpen
    Left = 1045
    Top = 160
    object cdsBandeiraCartaoCOD_BANDEIRA: TIntegerField
      FieldName = 'COD_BANDEIRA'
      Required = True
    end
    object cdsBandeiraCartaoCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsBandeiraCartaoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 32
    end
    object cdsBandeiraCartaoATIVO: TSmallintField
      FieldName = 'ATIVO'
    end
  end
  object dsBandeiraCartao: TDataSource
    DataSet = cdsBandeiraCartao
    Left = 1045
    Top = 208
  end
end
