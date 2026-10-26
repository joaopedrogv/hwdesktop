object dtmContasAReceber: TdtmContasAReceber
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 742
  Width = 2367
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
    Active = True
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
  object qrCtrlCh: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      
        'select cq.*, '#39' '#39' n_doc_v_temp, retorna_pag_cr.form_pag, controle' +
        's.nome_ctrl, emp.identificacao_emp,'
      
        'p_contas.desc_plc,grupos_ct.desc_gr, depart_ct.desc_dep,p_contas' +
        '.cod_cta_contabil, p_contas_contabil.nome_cta,'
      
        't.status_f, c.nome_cliente, c.razao razao_cliente, c.cpfcgc cpfc' +
        'gc_cliente,'
      'c.cep, c.endereco, c.num_end_cliente, c.complemento,'
      'c.fone_cliente, c.fone_celular, c.email, '
      'c.cod_localidade,  l.localidade, l.cod_setor, s.setor,'
      
        'est.sigla_uf, cid.nome_cidade, bai.nome_bairro  from controle_ch' +
        'eque cq'
      'left join empresa emp on emp.cod_empresa = cq.cod_emp_mult'
      
        'left join controles on controles.codigo_ctrl = cq.codigo_ctrl an' +
        'd controles.codigo_emp = cq.cod_emp_mult'
      'left join p_contas on p_contas.n_conta_plc = cq.n_conta_plc'
      'left join grupos_ct on p_contas.grup_ct = grupos_ct.grup_ct'
      'left join depart_ct on grupos_ct.cod_dep = depart_ct.cod_dep'
      
        'left join p_contas_contabil on p_contas_contabil.cod_cta = p_con' +
        'tas.cod_cta_contabil and p_contas_contabil.cod_empresa = cq.cod_' +
        'emp_mult'
      
        'left join clientes c on c.cod_cliente = cq.cod_cliente and c.cod' +
        '_empresa = cq.cod_emp_mult'
      
        'left join localidade l on l.cod_localidade = c.cod_localidade an' +
        'd l.cod_empresa = c.cod_empresa '
      
        'left join setor s on s.cod_setor = l.cod_setor and s.cod_empresa' +
        ' = l.cod_empresa'
      
        'left join tipo_faturamento t on t.codigo_faturamento = c.codigo_' +
        'faturamento'
      'left join estados est on est.codigo_uf = c.codigo_uf'
      'left join cidades cid on cid.cod_cidade = c.cod_cidade'
      'left join bairros bai on bai.cod_bairro = c.cod_bairro'
      
        'left join retorna_pag_cr (cq.lote_quit, cq.datq_ch, 1, 1, '#39#39') on' +
        ' 1 = 1'
      'where cq.codigo_ch = 0 and cq.codigo_emp = 0')
    Left = 29
    Top = 64
  end
  object dspCtrlCh: TDataSetProvider
    DataSet = qrCtrlCh
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 29
    Top = 112
  end
  object cdsCtrlCh: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspCtrlCh'
    BeforeOpen = cdsCtrlChBeforeOpen
    Left = 29
    Top = 160
    object cdsCtrlChSEL: TStringField
      Tag = 2
      DisplayLabel = 'Sel'
      FieldKind = fkInternalCalc
      FieldName = 'SEL'
      Size = 1
    end
    object cdsCtrlChNOME_CH: TStringField
      DisplayLabel = 'Nome Cliente'
      FieldName = 'NOME_CH'
      Size = 35
    end
    object cdsCtrlChN_CH: TStringField
      DisplayLabel = 'Num Cheque'
      FieldName = 'N_CH'
      FixedChar = True
    end
    object cdsCtrlChDATA_VENC: TDateTimeField
      Tag = 2
      DisplayLabel = 'Data Vencimento'
      FieldName = 'DATA_VENC'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsCtrlChVALOR_CH: TFloatField
      Tag = 2
      DisplayLabel = 'Valor Cheque'
      FieldName = 'VALOR_CH'
      DisplayFormat = '##0.00'
    end
    object cdsCtrlChVALOR_CORR: TFloatField
      DisplayLabel = 'Valor Corrigido'
      FieldName = 'VALOR_CORR'
      DisplayFormat = '##0.00'
    end
    object cdsCtrlChVALOR_DESC: TFloatField
      DisplayLabel = 'Valor Desconto'
      FieldName = 'VALOR_DESC'
      DisplayFormat = '##0.00'
    end
    object cdsCtrlChVALOR_ACRESC: TFloatField
      DisplayLabel = 'Valor Acrescimo'
      FieldName = 'VALOR_ACRESC'
      DisplayFormat = '##0.00'
    end
    object cdsCtrlChCODIGO_CH: TIntegerField
      Tag = 2
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO_CH'
      Required = True
    end
    object cdsCtrlChSTATUS_CH: TStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS_CH'
      FixedChar = True
      Size = 10
    end
    object cdsCtrlChN_CONTA_PLC: TFloatField
      DisplayLabel = 'Num da Conta'
      FieldName = 'N_CONTA_PLC'
    end
    object cdsCtrlChCODIGO_CTRL: TIntegerField
      DisplayLabel = 'Codigo Controle'
      FieldName = 'CODIGO_CTRL'
      Required = True
    end
    object cdsCtrlChRAZAO: TStringField
      DisplayLabel = 'Razao Social Cliente'
      FieldName = 'RAZAO'
      Size = 60
    end
    object cdsCtrlChCOD_CLIENTE: TIntegerField
      DisplayLabel = 'Codigo Cliente'
      FieldName = 'COD_CLIENTE'
    end
    object cdsCtrlChDATA_REC: TDateTimeField
      DisplayLabel = 'Data Cadastro'
      FieldName = 'DATA_REC'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsCtrlChHISTORICO_CH: TStringField
      DisplayLabel = 'Historico'
      FieldName = 'HISTORICO_CH'
      Size = 100
    end
    object cdsCtrlChDATQ_CH: TDateTimeField
      DisplayLabel = 'Data Quita'#231#227'o'
      FieldName = 'DATQ_CH'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsCtrlChNATL_CH: TStringField
      DisplayLabel = 'Natureza(C/N)'
      FieldName = 'NATL_CH'
      FixedChar = True
      Size = 1
    end
    object cdsCtrlChCOD_CLI: TStringField
      DisplayLabel = 'Codigo CI'
      FieldName = 'COD_CLI'
      Size = 60
    end
    object cdsCtrlChOBS_CH: TStringField
      DisplayLabel = 'Observa'#231#227'o'
      FieldName = 'OBS_CH'
      Size = 60
    end
    object cdsCtrlChLOTE: TIntegerField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
    end
    object cdsCtrlChTP_DOC_V: TStringField
      DisplayLabel = 'Tipo Doc Venda'
      FieldName = 'TP_DOC_V'
      FixedChar = True
      Size = 6
    end
    object cdsCtrlChN_DOC_V: TIntegerField
      DisplayLabel = 'Num Doc Venda'
      FieldName = 'N_DOC_V'
    end
    object cdsCtrlChN_DOC_V_TEMP: TStringField
      DisplayLabel = 'Num Doc Vnd'
      FieldName = 'N_DOC_V_TEMP'
      FixedChar = True
    end
    object cdsCtrlChDATA_BAIXA: TDateTimeField
      DisplayLabel = 'Data Real da Baixa'
      FieldName = 'DATA_BAIXA'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsCtrlChDATA_VENDA: TDateTimeField
      DisplayLabel = 'Data Venda'
      FieldName = 'DATA_VENDA'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsCtrlChAGENCIA: TStringField
      DisplayLabel = 'Agencia'
      FieldName = 'AGENCIA'
      Size = 10
    end
    object cdsCtrlChCONTA: TStringField
      DisplayLabel = 'Conta'
      FieldName = 'CONTA'
      Size = 15
    end
    object cdsCtrlChBANCO: TStringField
      DisplayLabel = 'Banco'
      FieldName = 'BANCO'
      Size = 35
    end
    object cdsCtrlChCOD_CLI_TERC: TIntegerField
      DisplayLabel = 'Codigo Cliente Terceiro'
      FieldName = 'COD_CLI_TERC'
    end
    object cdsCtrlChNOME_TERC: TStringField
      DisplayLabel = 'Nome Terceiro'
      FieldName = 'NOME_TERC'
      Size = 35
    end
    object cdsCtrlChTIP_CNT: TStringField
      DisplayLabel = 'Tipo Cadastro(C/N)'
      FieldName = 'TIP_CNT'
      FixedChar = True
      Size = 1
    end
    object cdsCtrlChDATA_CXL: TDateTimeField
      DisplayLabel = 'Data Caixa Auxiliar'
      FieldName = 'DATA_CXL'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsCtrlChCODIGO_VEND: TIntegerField
      DisplayLabel = 'Codigo Vendedor'
      FieldName = 'CODIGO_VEND'
    end
    object cdsCtrlChDATA_REM_REC: TDateTimeField
      DisplayLabel = 'Data Remessa'
      FieldName = 'DATA_REM_REC'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsCtrlChCOD_TERM: TIntegerField
      DisplayLabel = 'Codigo Terminal'
      FieldName = 'COD_TERM'
    end
    object cdsCtrlChLOTE_QUIT: TIntegerField
      DisplayLabel = 'Lote Baixa'
      FieldName = 'LOTE_QUIT'
    end
    object cdsCtrlChLOTE_ENT: TIntegerField
      DisplayLabel = 'Lote Cadastro'
      FieldName = 'LOTE_ENT'
    end
    object cdsCtrlChCPFCGC: TStringField
      DisplayLabel = 'CPF/CNPJ Cliente'
      FieldName = 'CPFCGC'
      FixedChar = True
      Size = 18
    end
    object cdsCtrlChDT_BAIXA_COMISSAO: TDateTimeField
      DisplayLabel = 'Data Baixa Comiss'#227'o'
      FieldName = 'DT_BAIXA_COMISSAO'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsCtrlChVL_BAIXA_COMISSAO: TFloatField
      DisplayLabel = 'Valor Baixa Comiss'#227'o'
      FieldName = 'VL_BAIXA_COMISSAO'
      DisplayFormat = '##0.00'
    end
    object cdsCtrlChDTORIGINAL_CH: TDateTimeField
      DisplayLabel = 'Data Original Cheque'
      FieldName = 'DTORIGINAL_CH'
    end
    object cdsCtrlChID_BANCO: TStringField
      DisplayLabel = 'Num Banco'
      FieldName = 'ID_BANCO'
      Size = 11
    end
    object cdsCtrlChCODIGO_EMP: TIntegerField
      Tag = 1
      DisplayLabel = 'Codigo Empresa'
      FieldName = 'CODIGO_EMP'
      Required = True
    end
    object cdsCtrlChSELEC: TStringField
      Tag = 1
      DisplayLabel = 'S'
      FieldName = 'SELEC'
      FixedChar = True
      Size = 1
    end
    object cdsCtrlChOP_CXL: TIntegerField
      DisplayLabel = 'Op Fin'
      FieldName = 'OP_CXL'
    end
    object cdsCtrlChSTATUS_CXL_RQ: TStringField
      DisplayLabel = 'Status Rec Cxl'
      FieldName = 'STATUS_CXL_RQ'
      FixedChar = True
      Size = 1
    end
    object cdsCtrlChSTATUS_CX: TStringField
      DisplayLabel = 'Recebendo'
      FieldName = 'STATUS_CX'
      Size = 1
    end
    object cdsCtrlChOP_CX: TIntegerField
      DisplayLabel = 'Operador Recebendo'
      FieldName = 'OP_CX'
    end
    object cdsCtrlChTIP_BAIXA: TStringField
      DisplayLabel = 'Tipo Baixa'
      FieldName = 'TIP_BAIXA'
      FixedChar = True
      Size = 1
    end
    object cdsCtrlChVL_BAIXA_COMISSAO_GER: TFloatField
      DisplayLabel = 'Valor Baixa Comiss'#227'o Gerente'
      FieldName = 'VL_BAIXA_COMISSAO_GER'
      DisplayFormat = '#0.000'
    end
    object cdsCtrlChUS_CAD: TIntegerField
      DisplayLabel = 'Usuario que cadastrou'
      FieldName = 'US_CAD'
    end
    object cdsCtrlChCOD_EMP_MULT: TIntegerField
      DisplayLabel = 'Cod Unificada'
      FieldName = 'COD_EMP_MULT'
    end
    object cdsCtrlChIDENTIFICACAO_EMP: TStringField
      DisplayLabel = 'Unificada'
      FieldName = 'IDENTIFICACAO_EMP'
      Size = 64
    end
    object cdsCtrlChUS_BX: TIntegerField
      DisplayLabel = 'Usuario que Baixou'
      FieldName = 'US_BX'
    end
    object cdsCtrlChVL_CONTABIL: TFloatField
      DisplayLabel = 'Valor Cont'#225'bil'
      FieldName = 'VL_CONTABIL'
      DisplayFormat = '##0.00'
    end
    object cdsCtrlChCOD_CONTRAPARTIDA: TIntegerField
      DisplayLabel = 'Lote Contrapartida Lanc'
      FieldName = 'COD_CONTRAPARTIDA'
    end
    object cdsCtrlChCOD_CONTRAPARTIDA_CTP: TIntegerField
      DisplayLabel = 'Lote Contrapartida Ctp'
      FieldName = 'COD_CONTRAPARTIDA_CTP'
    end
    object cdsCtrlChCOD_EMP_LOTE: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Emp Lote'
      FieldName = 'COD_EMP_LOTE'
    end
    object cdsCtrlChNOME_CLIENTE: TStringField
      Tag = 1
      DisplayLabel = 'Z..'
      FieldName = 'NOME_CLIENTE'
      FixedChar = True
      Size = 35
    end
    object cdsCtrlChRAZAO_CLIENTE: TStringField
      Tag = 1
      DisplayLabel = 'Z..'
      FieldName = 'RAZAO_CLIENTE'
      Size = 60
    end
    object cdsCtrlChCPFCGC_CLIENTE: TStringField
      Tag = 1
      DisplayLabel = 'Z..'
      FieldName = 'CPFCGC_CLIENTE'
      Size = 18
    end
    object cdsCtrlChCEP: TStringField
      DisplayLabel = 'Cep'
      FieldName = 'CEP'
      FixedChar = True
      Size = 9
    end
    object cdsCtrlChENDERECO: TStringField
      DisplayLabel = 'Endereco'
      FieldName = 'ENDERECO'
      Size = 50
    end
    object cdsCtrlChNUM_END_CLIENTE: TStringField
      DisplayLabel = 'Num End Cliente'
      FieldName = 'NUM_END_CLIENTE'
      Size = 60
    end
    object cdsCtrlChCOMPLEMENTO: TStringField
      DisplayLabel = 'Complemento'
      FieldName = 'COMPLEMENTO'
      Size = 60
    end
    object cdsCtrlChFONE_CLIENTE: TStringField
      DisplayLabel = 'Fone Cliente'
      FieldName = 'FONE_CLIENTE'
      FixedChar = True
      Size = 13
    end
    object cdsCtrlChFONE_CELULAR: TStringField
      DisplayLabel = 'Celular'
      FieldName = 'FONE_CELULAR'
      FixedChar = True
      Size = 13
    end
    object cdsCtrlChEMAIL: TStringField
      DisplayLabel = 'Email'
      FieldName = 'EMAIL'
      Size = 256
    end
    object cdsCtrlChSTATUS_F: TStringField
      DisplayLabel = 'Status Faturamento'
      FieldName = 'STATUS_F'
      FixedChar = True
      Size = 10
    end
    object cdsCtrlChSIGLA_UF: TStringField
      DisplayLabel = 'Estado Cliente'
      FieldName = 'SIGLA_UF'
      FixedChar = True
      Size = 2
    end
    object cdsCtrlChNOME_CIDADE: TStringField
      DisplayLabel = 'Cidade Cliente'
      FieldName = 'NOME_CIDADE'
      Size = 30
    end
    object cdsCtrlChNOME_BAIRRO: TStringField
      DisplayLabel = 'Bairro Cliente'
      FieldName = 'NOME_BAIRRO'
      Size = 30
    end
    object cdsCtrlChNOME_CTA: TStringField
      DisplayLabel = 'Descricao Conta Contabil'
      FieldName = 'NOME_CTA'
      Size = 60
    end
    object cdsCtrlChDESC_PLC: TStringField
      DisplayLabel = 'Descricao Conta'
      FieldName = 'DESC_PLC'
      FixedChar = True
      Size = 30
    end
    object cdsCtrlChDESC_GR: TStringField
      DisplayLabel = 'Descricao Grupo Conta'
      FieldName = 'DESC_GR'
      FixedChar = True
      Size = 35
    end
    object cdsCtrlChDESC_DEP: TStringField
      DisplayLabel = 'Descricao Departamento Conta'
      FieldName = 'DESC_DEP'
      Size = 35
    end
    object cdsCtrlChCOD_CTA_CONTABIL: TStringField
      DisplayLabel = 'Cod Conta Contabil'
      FieldName = 'COD_CTA_CONTABIL'
      Size = 60
    end
    object cdsCtrlChNOME_CTRL: TStringField
      DisplayLabel = 'Nome Controle'
      FieldName = 'NOME_CTRL'
      Size = 35
    end
    object cdsCtrlChDATA_PREV_REC: TDateTimeField
      DisplayLabel = 'Data Prev Rec'
      FieldName = 'DATA_PREV_REC'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsCtrlChFORM_PAG: TStringField
      DisplayLabel = 'Form Pag'
      FieldName = 'FORM_PAG'
      Size = 200
    end
    object cdsCtrlChARQ_EXTRATO_ADM: TStringField
      DisplayLabel = 'Arq Extrato Adm'
      FieldName = 'ARQ_EXTRATO_ADM'
      Size = 255
    end
    object cdsCtrlChDATA_ARQUIVO: TDateTimeField
      DisplayLabel = 'Data Extrato Adm'
      FieldName = 'DATA_ARQUIVO'
    end
    object cdsCtrlChDATA_DESM: TDateTimeField
      DisplayLabel = 'Data Desmarcado'
      FieldName = 'DATA_DESM'
    end
    object cdsCtrlChOP_DESM: TIntegerField
      DisplayLabel = 'Operador Desmarcou'
      FieldName = 'OP_DESM'
    end
    object cdsCtrlChCOD_LOCALIDADE: TIntegerField
      DisplayLabel = 'Cod Localidade'
      FieldName = 'COD_LOCALIDADE'
    end
    object cdsCtrlChLOCALIDADE: TStringField
      DisplayLabel = 'Localidade'
      FieldName = 'LOCALIDADE'
      Size = 64
    end
    object cdsCtrlChCOD_SETOR: TIntegerField
      DisplayLabel = 'Cod Setor'
      FieldName = 'COD_SETOR'
    end
    object cdsCtrlChSETOR: TStringField
      DisplayLabel = 'Setor'
      FieldName = 'SETOR'
      Size = 64
    end
  end
  object dsCtrlCh: TDataSource
    AutoEdit = False
    DataSet = cdsCtrlCh
    Left = 29
    Top = 208
  end
  object qrPCont: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      
        'select pc.n_conta_plc, pc.desc_plc, pc.sthab, pc.tipo_plc, g.des' +
        'c_gr, d.desc_dep, pc.tipo_ctp from p_contas pc'
      'left join grupos_ct g on g.grup_ct = pc.grup_ct'
      'left join depart_ct d on d.cod_dep = g.cod_dep')
    Left = 245
    Top = 64
  end
  object dspPcont: TDataSetProvider
    DataSet = qrPCont
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 245
    Top = 112
  end
  object cdsPCont: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspPcont'
    BeforeOpen = cdsCtrlChBeforeOpen
    Left = 245
    Top = 160
  end
  object dsPCont: TDataSource
    DataSet = cdsPCont
    Left = 245
    Top = 208
  end
  object qrCtrl: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      
        'select c.codigo_ctrl, c.nome_ctrl, c.contr_banc, c.nat_lanc, c.n' +
        'at_ctrl, c.saldo_at_ctrl, c.qperf, c.barrar_automatico, c.docs, ' +
        'c.taxa_cartao, c.tp_plano, c.cartao_sped from controles c')
    Left = 301
    Top = 64
  end
  object dspCtrl: TDataSetProvider
    DataSet = qrCtrl
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 301
    Top = 112
  end
  object cdsCtrl: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspCtrl'
    BeforeOpen = cdsCtrlChBeforeOpen
    Left = 301
    Top = 160
  end
  object dsCtrl: TDataSource
    AutoEdit = False
    DataSet = cdsCtrl
    Left = 301
    Top = 208
  end
  object dsBuscas: TDataSource
    Left = 248
    Top = 8
  end
  object qrCtrlCr: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      
        'select cc.*,  '#39' '#39' n_doc_c_temp, '#39' '#39' n_doc_v_temp, retorna_pag_cr' +
        '.form_pag, controles.nome_ctrl, emp.identificacao_emp,'
      
        'p_contas.desc_plc,grupos_ct.desc_gr, depart_ct.desc_dep,p_contas' +
        '.cod_cta_contabil, p_contas_contabil.nome_cta,'
      'c.nome_cliente, c.razao razao_cliente, c.cpfcgc cpfcgc_cliente,'
      'c.cep, c.endereco, c.num_end_cliente, c.complemento,'
      'c.fone_cliente, c.fone_celular, c.email, '
      'c.cod_localidade, l.localidade, l.cod_setor, s.setor,'
      
        't.status_f, est.sigla_uf, cid.nome_cidade, bai.nome_bairro from ' +
        'controle_creditos cc'
      'left join empresa emp on emp.cod_empresa = cc.cod_emp_mult'
      
        'left join controles on controles.codigo_ctrl = cc.codigo_ctrl an' +
        'd controles.codigo_emp = cc.cod_emp_mult'
      'left join p_contas on p_contas.n_conta_plc = cc.n_conta_plc'
      'left join grupos_ct on p_contas.grup_ct = grupos_ct.grup_ct'
      'left join depart_ct on grupos_ct.cod_dep = depart_ct.cod_dep'
      
        'left join p_contas_contabil on p_contas_contabil.cod_cta = p_con' +
        'tas.cod_cta_contabil and p_contas_contabil.cod_empresa = cc.cod_' +
        'emp_mult'
      
        'inner join clientes c on c.cod_cliente = cc.cod_cliente and c.co' +
        'd_empresa = cc.cod_emp_mult'
      
        'left join localidade l on l.cod_localidade = c.cod_localidade an' +
        'd l.cod_empresa = c.cod_empresa '
      
        'left join setor s on s.cod_setor = l.cod_setor and s.cod_empresa' +
        ' = l.cod_empresa'
      
        'left join tipo_faturamento t on t.codigo_faturamento = c.codigo_' +
        'faturamento'
      'left join estados est on est.codigo_uf = c.codigo_uf'
      'left join cidades cid on cid.cod_cidade = c.cod_cidade'
      'left join bairros bai on bai.cod_bairro = c.cod_bairro'
      
        'left join retorna_pag_cr (cc.lote_quit, cc.datq_c, 1, 1, '#39#39') on ' +
        '1 = 1'
      'where cc.cod_cred = 0 and cc.codigo_emp = 0'
      ''
      '')
    Left = 101
    Top = 64
  end
  object dspCtrlCr: TDataSetProvider
    DataSet = qrCtrlCr
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 101
    Top = 112
  end
  object cdsCtrlCr: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspCtrlCr'
    BeforeOpen = cdsCtrlChBeforeOpen
    Left = 101
    Top = 160
    object cdsCtrlCrSEL: TStringField
      Tag = 2
      DisplayLabel = 'Sel'
      FieldKind = fkInternalCalc
      FieldName = 'SEL'
      Size = 1
    end
    object cdsCtrlCrTIPO_DOC_C: TStringField
      DisplayLabel = 'Tipo Documento'
      FieldName = 'TIPO_DOC_C'
      FixedChar = True
      Size = 15
    end
    object cdsCtrlCrNOME_C: TStringField
      DisplayLabel = 'Nome Cliente'
      FieldName = 'NOME_C'
      Size = 35
    end
    object cdsCtrlCrN_DOC_C: TStringField
      DisplayLabel = 'Num Documento'
      FieldName = 'N_DOC_C'
      OnGetText = cdsCtrlCrN_DOC_CGetText
    end
    object cdsCtrlCrN_DOC_C_TEMP: TStringField
      DisplayLabel = 'Num Doc'
      FieldName = 'N_DOC_C_TEMP'
      FixedChar = True
    end
    object cdsCtrlCrDATA_VENC_C: TDateTimeField
      Tag = 2
      DisplayLabel = 'Data Vencimento'
      FieldName = 'DATA_VENC_C'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsCtrlCrVALOR_C: TFloatField
      Tag = 2
      DisplayLabel = 'Valor Credito'
      FieldName = 'VALOR_C'
      DisplayFormat = '##0.00'
    end
    object cdsCtrlCrVALOR_CORR: TFloatField
      DisplayLabel = 'Valor Corrigido'
      FieldName = 'VALOR_CORR'
      DisplayFormat = '##0.00'
    end
    object cdsCtrlCrVALOR_DESC: TFloatField
      DisplayLabel = 'Valor Desconto'
      FieldName = 'VALOR_DESC'
      DisplayFormat = '##0.00'
    end
    object cdsCtrlCrVALOR_ACRESC: TFloatField
      DisplayLabel = 'Valor Acrescimo'
      FieldName = 'VALOR_ACRESC'
      DisplayFormat = '##0.00'
    end
    object cdsCtrlCrVALOR_ORIGINAL: TFloatField
      DisplayLabel = 'Valor Original'
      FieldName = 'VALOR_ORIGINAL'
      DisplayFormat = '##0.00'
    end
    object cdsCtrlCrVALOR_LIQUIDO: TFloatField
      DisplayLabel = 'Valor L'#237'quido'
      FieldName = 'VALOR_LIQUIDO'
      DisplayFormat = '##0.00'
    end
    object cdsCtrlCrSTATUS_C: TStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS_C'
      FixedChar = True
      Size = 10
    end
    object cdsCtrlCrCOD_CRED: TIntegerField
      Tag = 2
      DisplayLabel = 'Codigo'
      FieldName = 'COD_CRED'
      Required = True
    end
    object cdsCtrlCrHISTORICO_C: TStringField
      DisplayLabel = 'Historico'
      FieldName = 'HISTORICO_C'
      Size = 100
    end
    object cdsCtrlCrN_CONTA_PLC: TFloatField
      DisplayLabel = 'Num da Conta'
      FieldName = 'N_CONTA_PLC'
    end
    object cdsCtrlCrCODIGO_CTRL: TIntegerField
      DisplayLabel = 'Codigo Controle'
      FieldName = 'CODIGO_CTRL'
      Required = True
    end
    object cdsCtrlCrRAZAO: TStringField
      DisplayLabel = 'Razao Social Cliente'
      FieldName = 'RAZAO'
      Size = 60
    end
    object cdsCtrlCrCOD_CLIENTE: TIntegerField
      DisplayLabel = 'Codigo Cliente'
      FieldName = 'COD_CLIENTE'
    end
    object cdsCtrlCrDATA_REC_C: TDateTimeField
      DisplayLabel = 'Data Cadastro'
      FieldName = 'DATA_REC_C'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsCtrlCrDATQ_C: TDateTimeField
      DisplayLabel = 'Data Quita'#231#227'o'
      FieldName = 'DATQ_C'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsCtrlCrNATL_C: TStringField
      DisplayLabel = 'Natureza(C/N)'
      FieldName = 'NATL_C'
      FixedChar = True
      Size = 1
    end
    object cdsCtrlCrN_DOC_V: TIntegerField
      DisplayLabel = 'Num Doc Venda'
      FieldName = 'N_DOC_V'
    end
    object cdsCtrlCrTP_DOC_V: TStringField
      DisplayLabel = 'Tipo Doc Venda'
      FieldName = 'TP_DOC_V'
      FixedChar = True
      Size = 6
    end
    object cdsCtrlCrNPARCELA: TIntegerField
      DisplayLabel = 'Num Parcela'
      FieldName = 'NPARCELA'
    end
    object cdsCtrlCrQTDE_PARC: TIntegerField
      DisplayLabel = 'Qtde Parcelas'
      FieldName = 'QTDE_PARC'
    end
    object cdsCtrlCrN_DOC_V_TEMP: TStringField
      DisplayLabel = 'Num Doc Vnd'
      FieldName = 'N_DOC_V_TEMP'
      FixedChar = True
      Size = 1
    end
    object cdsCtrlCrJUROS_COB: TFloatField
      DisplayLabel = 'Valor Juros Cobrado'
      FieldName = 'JUROS_COB'
      DisplayFormat = '##0.00'
    end
    object cdsCtrlCrTAXA_COBRANCA: TFloatField
      DisplayLabel = 'Valor Taxa Cobran'#231'a'
      FieldName = 'TAXA_COBRANCA'
      DisplayFormat = '##0.00'
    end
    object cdsCtrlCrNOSSO_NUMERO_BANCO: TStringField
      DisplayLabel = 'Nosso Numero Boleto'
      FieldName = 'NOSSO_NUMERO_BANCO'
    end
    object cdsCtrlCrOCORRENCIABANCARIA: TMemoField
      DisplayLabel = 'Informa'#231#227'o Banc'#225'ria'
      FieldName = 'OCORRENCIABANCARIA'
      OnGetText = cdsCtrlCrOCORRENCIABANCARIAGetText
      BlobType = ftMemo
      Size = 8
    end
    object cdsCtrlCrLOTE: TIntegerField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
    end
    object cdsCtrlCrLOTE_QUIT: TIntegerField
      DisplayLabel = 'Lote Baixa'
      FieldName = 'LOTE_QUIT'
    end
    object cdsCtrlCrLOTE_ENT: TIntegerField
      DisplayLabel = 'Lote Cadastro'
      FieldName = 'LOTE_ENT'
    end
    object cdsCtrlCrLOTE_CXL: TIntegerField
      DisplayLabel = 'Lote CXL'
      FieldName = 'LOTE_CXL'
    end
    object cdsCtrlCrTIP_CNT: TStringField
      DisplayLabel = 'Tipo Cadastro(C/N)'
      FieldName = 'TIP_CNT'
      FixedChar = True
      Size = 1
    end
    object cdsCtrlCrLOTE_NEG: TIntegerField
      DisplayLabel = 'Lote Negativa'#231#227'o'
      FieldName = 'LOTE_NEG'
    end
    object cdsCtrlCrCOD_CLI_TERC: TIntegerField
      DisplayLabel = 'Codigo Cliente Terceiro'
      FieldName = 'COD_CLI_TERC'
    end
    object cdsCtrlCrNOME_TERC: TStringField
      DisplayLabel = 'Nome Terceiro'
      FieldName = 'NOME_TERC'
      Size = 35
    end
    object cdsCtrlCrDATA_CXL: TDateTimeField
      DisplayLabel = 'Data Caixa Auxiliar'
      FieldName = 'DATA_CXL'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsCtrlCrCODIGO_VEND: TIntegerField
      DisplayLabel = 'Codigo Vendedor'
      FieldName = 'CODIGO_VEND'
    end
    object cdsCtrlCrN_DUPL_C: TIntegerField
      DisplayLabel = 'Num Duplicata'
      FieldName = 'N_DUPL_C'
    end
    object cdsCtrlCrDATA_REM_REC: TDateTimeField
      DisplayLabel = 'Data Remessa'
      FieldName = 'DATA_REM_REC'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsCtrlCrCOD_TERM: TIntegerField
      DisplayLabel = 'Codigo Terminal'
      FieldName = 'COD_TERM'
    end
    object cdsCtrlCrDATA_BAIXA: TDateTimeField
      DisplayLabel = 'Data Real da Baixa'
      FieldName = 'DATA_BAIXA'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsCtrlCrDATA_VENDA: TDateTimeField
      DisplayLabel = 'Data Venda'
      FieldName = 'DATA_VENDA'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsCtrlCrCODIGO_FUNC: TIntegerField
      DisplayLabel = 'Codigo Func'
      FieldName = 'CODIGO_FUNC'
    end
    object cdsCtrlCrDIA_CXL: TDateTimeField
      DisplayLabel = 'Dia CXL'
      FieldName = 'DIA_CXL'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsCtrlCrSTATUS_CXL_RQ: TStringField
      DisplayLabel = 'Status Recebimento CXL'
      FieldName = 'STATUS_CXL_RQ'
      FixedChar = True
      Size = 1
    end
    object cdsCtrlCrVL_RQ_PG_CXL: TFloatField
      DisplayLabel = 'Valor Recebido Cxl'
      FieldName = 'VL_RQ_PG_CXL'
      DisplayFormat = '##0.00'
    end
    object cdsCtrlCrOP_CXL: TIntegerField
      DisplayLabel = 'Operador CXL'
      FieldName = 'OP_CXL'
    end
    object cdsCtrlCrTP_REC_CXL: TStringField
      DisplayLabel = 'Tipo Recebimento CXL'
      FieldName = 'TP_REC_CXL'
      FixedChar = True
      Size = 1
    end
    object cdsCtrlCrCPFCGC: TStringField
      DisplayLabel = 'CPF/CNPJ Cliente'
      FieldName = 'CPFCGC'
      FixedChar = True
      Size = 18
    end
    object cdsCtrlCrPRCSS: TStringField
      DisplayLabel = 'Processamento'
      FieldName = 'PRCSS'
      FixedChar = True
      Size = 1
    end
    object cdsCtrlCrCOD_IT_CARTAS: TIntegerField
      DisplayLabel = 'Codigo Item Carta'
      FieldName = 'COD_IT_CARTAS'
    end
    object cdsCtrlCrDT_REG_CARTAS: TDateTimeField
      DisplayLabel = 'Data Envio Carta'
      FieldName = 'DT_REG_CARTAS'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsCtrlCrN_SEQ_BOL: TIntegerField
      DisplayLabel = 'Num Seq Bol'
      FieldName = 'N_SEQ_BOL'
    end
    object cdsCtrlCrCOD_CARTA: TIntegerField
      DisplayLabel = 'Codigo Carta Cobran'#231'a'
      FieldName = 'COD_CARTA'
    end
    object cdsCtrlCrN_DOCNSU_ADM: TStringField
      DisplayLabel = 'Num Doc/NSU/CV'
      FieldName = 'N_DOCNSU_ADM'
      Size = 10
    end
    object cdsCtrlCrN_AUT_CART: TStringField
      DisplayLabel = 'Num Aut Cartao'
      FieldName = 'N_AUT_CART'
      FixedChar = True
    end
    object cdsCtrlCrCOD_FATURAMENTO: TIntegerField
      DisplayLabel = 'Codigo Faturamento'
      FieldName = 'COD_FATURAMENTO'
    end
    object cdsCtrlCrDATA_LOTE_NEG: TDateTimeField
      DisplayLabel = 'Data Lote Negativa'#231#227'o'
      FieldName = 'DATA_LOTE_NEG'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsCtrlCrNUM_NOTA: TIntegerField
      DisplayLabel = 'Num Nf'
      FieldName = 'NUM_NOTA'
    end
    object cdsCtrlCrNREQ: TIntegerField
      DisplayLabel = 'Num REQ'
      FieldName = 'NREQ'
    end
    object cdsCtrlCrN_OS: TIntegerField
      DisplayLabel = 'Num OS'
      FieldName = 'N_OS'
    end
    object cdsCtrlCrNCOMANDO: TIntegerField
      DisplayLabel = 'Num Comando'
      FieldName = 'NCOMANDO'
    end
    object cdsCtrlCrNGRP: TIntegerField
      DisplayLabel = 'Num GRP'
      FieldName = 'NGRP'
    end
    object cdsCtrlCrUS_CANCELOU: TStringField
      DisplayLabel = 'Codigo Usuario Cancelou'
      FieldName = 'US_CANCELOU'
      Size = 10
    end
    object cdsCtrlCrDT_US_CANCELOU: TDateTimeField
      DisplayLabel = 'Data que o Usuario Cancelou'
      FieldName = 'DT_US_CANCELOU'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsCtrlCrOBS_C: TStringField
      DisplayLabel = 'Observa'#231#227'o'
      FieldName = 'OBS_C'
      Size = 60
    end
    object cdsCtrlCrOBS_PARACREDITO: TStringField
      DisplayLabel = 'Observa'#231#227'o para Cr'#233'dito'
      FieldName = 'OBS_PARACREDITO'
      Size = 50
    end
    object cdsCtrlCrDTORIGINAL_C: TDateTimeField
      DisplayLabel = 'Data Original do Cr'#233'dito'
      FieldName = 'DTORIGINAL_C'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsCtrlCrDEPENDENTE: TStringField
      DisplayLabel = 'Nome Dependente'
      FieldName = 'DEPENDENTE'
      Size = 35
    end
    object cdsCtrlCrCOD_TERMINAL: TIntegerField
      DisplayLabel = 'Codigo Caixa ECF'
      FieldName = 'COD_TERMINAL'
    end
    object cdsCtrlCrCOONAOFISCAL: TIntegerField
      DisplayLabel = 'COO N'#227'o Fiscal'
      FieldName = 'COONAOFISCAL'
    end
    object cdsCtrlCrNSERIEECF: TStringField
      DisplayLabel = 'Num Serie ECF'
      FieldName = 'NSERIEECF'
    end
    object cdsCtrlCrCODIGO_EMP: TIntegerField
      Tag = 1
      DisplayLabel = 'Codigo Empresa'
      FieldName = 'CODIGO_EMP'
      Required = True
    end
    object cdsCtrlCrSELEC: TStringField
      Tag = 1
      DisplayLabel = 'S'
      FieldName = 'SELEC'
      FixedChar = True
      Size = 1
    end
    object cdsCtrlCrNOME_CTRL: TStringField
      Tag = 1
      DisplayLabel = 'Controle'
      FieldKind = fkLookup
      FieldName = 'NOME_CTRL'
      LookupDataSet = cdsCtrl
      LookupKeyFields = 'CODIGO_CTRL'
      LookupResultField = 'NOME_CTRL'
      KeyFields = 'CODIGO_CTRL'
      Visible = False
      Size = 35
      Lookup = True
    end
    object cdsCtrlCrSTATUS_CX: TStringField
      DisplayLabel = 'Recebendo'
      FieldName = 'STATUS_CX'
      Size = 1
    end
    object cdsCtrlCrOP_CX: TIntegerField
      DisplayLabel = 'Operador Recebendo'
      FieldName = 'OP_CX'
    end
    object cdsCtrlCrTIP_BAIXA: TStringField
      DisplayLabel = 'Tipo Baixa'
      FieldName = 'TIP_BAIXA'
      FixedChar = True
      Size = 1
    end
    object cdsCtrlCrIDCARNE: TIntegerField
      DisplayLabel = 'Numero do Carne'
      FieldName = 'IDCARNE'
    end
    object cdsCtrlCrCOD_OBS: TIntegerField
      Tag = 1
      FieldName = 'COD_OBS'
    end
    object cdsCtrlCrVL_BAIXA_COMISSAO: TFloatField
      DisplayLabel = 'Valor Comiss'#227'o'
      FieldName = 'VL_BAIXA_COMISSAO'
      DisplayFormat = '#0.000'
    end
    object cdsCtrlCrVL_BAIXA_COMISSAO_GER: TFloatField
      DisplayLabel = 'Valor Comiss'#227'o Gerente'
      FieldName = 'VL_BAIXA_COMISSAO_GER'
      DisplayFormat = '#0.000'
    end
    object cdsCtrlCrSTATUS_ADM: TIntegerField
      DisplayLabel = 'Status Adm'
      FieldName = 'STATUS_ADM'
    end
    object cdsCtrlCrDESC_STATUS_ADM: TStringField
      DisplayLabel = 'Descri'#231#227'o Status Adm'
      FieldName = 'DESC_STATUS_ADM'
      Size = 50
    end
    object cdsCtrlCrNSU_RO_ADM: TStringField
      DisplayLabel = 'NSU RO Adm'
      FieldName = 'NSU_RO_ADM'
      Size = 15
    end
    object cdsCtrlCrRO_ADM: TIntegerField
      DisplayLabel = 'Num RO Adm'
      FieldName = 'RO_ADM'
    end
    object cdsCtrlCrCOD_TERMINAL_ADM: TStringField
      DisplayLabel = 'Cod. Terminal Adm'
      FieldName = 'COD_TERMINAL_ADM'
      Size = 10
    end
    object cdsCtrlCrDESC_TERMINAL_ADM: TStringField
      DisplayLabel = 'Descri'#231#227'o Terminal Adm'
      FieldName = 'DESC_TERMINAL_ADM'
      Size = 30
    end
    object cdsCtrlCrCOD_ADM: TIntegerField
      DisplayLabel = 'Cod. Adm Cartao'
      FieldName = 'COD_ADM'
    end
    object cdsCtrlCrDESC_ADM: TStringField
      DisplayLabel = 'Descri'#231#227'o Adm Cartao'
      FieldName = 'DESC_ADM'
      Size = 30
    end
    object cdsCtrlCrCOD_BANDEIRA_ADM: TIntegerField
      DisplayLabel = 'Cod. Bandeira'
      FieldName = 'COD_BANDEIRA_ADM'
    end
    object cdsCtrlCrDESC_BANDEIRA: TStringField
      DisplayLabel = 'Descri'#231#227'o Bandeira'
      FieldName = 'DESC_BANDEIRA'
      Size = 50
    end
    object cdsCtrlCrTIPO_PROD_ADM: TIntegerField
      DisplayLabel = 'Tipo Produto Adm'
      FieldName = 'TIPO_PROD_ADM'
    end
    object cdsCtrlCrDESC_TIPO_PROD_ADM: TStringField
      DisplayLabel = 'Descri'#231#227'o Produto Adm'
      FieldName = 'DESC_TIPO_PROD_ADM'
      Size = 50
    end
    object cdsCtrlCrIND_ANTEC_RO_ADM: TStringField
      DisplayLabel = 'Indicador Antecipa'#231#227'o Adm'
      FieldName = 'IND_ANTEC_RO_ADM'
      Size = 50
    end
    object cdsCtrlCrIND_OR_AJUSTE_ADM: TIntegerField
      DisplayLabel = 'Indicador Origem Ajuste Adm'
      FieldName = 'IND_OR_AJUSTE_ADM'
    end
    object cdsCtrlCrIND_OR_DESC_AJUSTE: TStringField
      DisplayLabel = 'Descri'#231#227'o Origem Ajuste Adm'
      FieldName = 'IND_OR_DESC_AJUSTE'
      Size = 50
    end
    object cdsCtrlCrTAXA_CARTAO_CRED: TFloatField
      DisplayLabel = 'Comiss'#227'o Cart'#227'o Adm'
      FieldName = 'TAXA_CARTAO_CRED'
    end
    object cdsCtrlCrTARIFA_CARTAO_CRED: TFloatField
      DisplayLabel = 'Tarifa Adm'
      FieldName = 'TARIFA_CARTAO_CRED'
    end
    object cdsCtrlCrIDBAIXA_CARTAO: TIntegerField
      DisplayLabel = 'Lote Baixa Adm'
      FieldName = 'IDBAIXA_CARTAO'
    end
    object cdsCtrlCrIDDEV_CARTAO: TIntegerField
      DisplayLabel = 'Lote Dev Adm'
      FieldName = 'IDDEV_CARTAO'
    end
    object cdsCtrlCrCODIGO_CTRL_CRED: TIntegerField
      DisplayLabel = 'Controle p/ Cr'#233'd Baixa Adm'
      FieldName = 'CODIGO_CTRL_CRED'
    end
    object cdsCtrlCrUS_CAD: TIntegerField
      DisplayLabel = 'Usuario que cadastrou'
      FieldName = 'US_CAD'
    end
    object cdsCtrlCrNOME_CLIENTE: TStringField
      Tag = 1
      DisplayLabel = 'Z..'
      FieldName = 'NOME_CLIENTE'
      Size = 35
    end
    object cdsCtrlCrRAZAO_CLIENTE: TStringField
      Tag = 1
      DisplayLabel = 'Z..'
      FieldName = 'RAZAO_CLIENTE'
      Size = 60
    end
    object cdsCtrlCrCPFCGC_CLIENTE: TStringField
      Tag = 1
      DisplayLabel = 'Z..'
      FieldName = 'CPFCGC_CLIENTE'
      Size = 18
    end
    object cdsCtrlCrCEP: TStringField
      DisplayLabel = 'Cep'
      FieldName = 'CEP'
      FixedChar = True
      Size = 9
    end
    object cdsCtrlCrENDERECO: TStringField
      DisplayLabel = 'Endereco'
      FieldName = 'ENDERECO'
      Size = 50
    end
    object cdsCtrlCrNUM_END_CLIENTE: TStringField
      DisplayLabel = 'Num End Cliente'
      FieldName = 'NUM_END_CLIENTE'
      Size = 60
    end
    object cdsCtrlCrCOMPLEMENTO: TStringField
      DisplayLabel = 'Complemento'
      FieldName = 'COMPLEMENTO'
      Size = 60
    end
    object cdsCtrlCrFONE_CLIENTE: TStringField
      DisplayLabel = 'Fone Cliente'
      FieldName = 'FONE_CLIENTE'
      FixedChar = True
      Size = 13
    end
    object cdsCtrlCrFONE_CELULAR: TStringField
      DisplayLabel = 'Celular'
      FieldName = 'FONE_CELULAR'
      FixedChar = True
      Size = 13
    end
    object cdsCtrlCrEMAIL: TStringField
      DisplayLabel = 'Email'
      FieldName = 'EMAIL'
      Size = 256
    end
    object cdsCtrlCrSTATUS_F: TStringField
      DisplayLabel = 'Status Faturamento'
      FieldName = 'STATUS_F'
      Size = 10
    end
    object cdsCtrlCrSIGLA_UF: TStringField
      DisplayLabel = 'Estado Cliente'
      FieldName = 'SIGLA_UF'
      FixedChar = True
      Size = 2
    end
    object cdsCtrlCrNOME_CIDADE: TStringField
      DisplayLabel = 'Cidade Cliente'
      FieldName = 'NOME_CIDADE'
      Size = 30
    end
    object cdsCtrlCrNOME_BAIRRO: TStringField
      DisplayLabel = 'Bairro Cliente'
      FieldName = 'NOME_BAIRRO'
      Size = 30
    end
    object cdsCtrlCrCOD_COBREBEM: TIntegerField
      DisplayLabel = 'Cod Convenio'
      FieldName = 'COD_COBREBEM'
    end
    object cdsCtrlCrDATA_RETORNO_QUITACAO: TDateTimeField
      Tag = 1
      DisplayLabel = 'Data Retorno'
      FieldName = 'DATA_RETORNO_QUITACAO'
    end
    object cdsCtrlCrDT_BAIXA_COMISSAO: TDateTimeField
      Tag = 1
      DisplayLabel = 'Data Baixa Comissao'
      FieldName = 'DT_BAIXA_COMISSAO'
    end
    object cdsCtrlCrDATA_DESBARRAMENTO: TDateTimeField
      DisplayLabel = 'Data desnegativa'#231#227'o'
      FieldName = 'DATA_DESBARRAMENTO'
    end
    object cdsCtrlCrVL_VENDA: TFloatField
      DisplayLabel = 'Valor Venda Cartao'
      FieldName = 'VL_VENDA'
      DisplayFormat = '##0.00'
    end
    object cdsCtrlCrCOD_EMP_MULT: TIntegerField
      DisplayLabel = 'Cod Unificada'
      FieldName = 'COD_EMP_MULT'
    end
    object cdsCtrlCrIDENTIFICACAO_EMP: TStringField
      DisplayLabel = 'Unificada'
      FieldName = 'IDENTIFICACAO_EMP'
      Size = 64
    end
    object cdsCtrlCrUS_BX: TIntegerField
      DisplayLabel = 'Usuario que Baixou'
      FieldName = 'US_BX'
    end
    object cdsCtrlCrVL_CONTABIL: TFloatField
      DisplayLabel = 'Valor Cont'#225'bil'
      FieldName = 'VL_CONTABIL'
      DisplayFormat = '##0.00'
    end
    object cdsCtrlCrCOD_CONTRAPARTIDA: TIntegerField
      DisplayLabel = 'Lote Contrapartida Lanc'
      FieldName = 'COD_CONTRAPARTIDA'
    end
    object cdsCtrlCrCOD_CONTRAPARTIDA_CTP: TIntegerField
      DisplayLabel = 'Lote Contrapartida Ctp'
      FieldName = 'COD_CONTRAPARTIDA_CTP'
    end
    object cdsCtrlCrCOD_EMP_LOTE: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Emp Lote'
      FieldName = 'COD_EMP_LOTE'
    end
    object cdsCtrlCrDEB_CRED: TStringField
      DisplayLabel = 'Debito ou Credito'
      FieldName = 'DEB_CRED'
      FixedChar = True
      Size = 1
    end
    object cdsCtrlCrID_FINANC_CONFERE: TIntegerField
      Tag = 1
      DisplayLabel = 'Id Financ Confere'
      FieldName = 'ID_FINANC_CONFERE'
    end
    object cdsCtrlCrNOME_CTA: TStringField
      DisplayLabel = 'Descricao Conta Contabil'
      FieldName = 'NOME_CTA'
      Size = 60
    end
    object cdsCtrlCrDESC_PLC: TStringField
      DisplayLabel = 'Descricao Conta'
      FieldName = 'DESC_PLC'
      FixedChar = True
      Size = 30
    end
    object cdsCtrlCrDESC_GR: TStringField
      DisplayLabel = 'Descricao Grupo Conta'
      FieldName = 'DESC_GR'
      FixedChar = True
      Size = 35
    end
    object cdsCtrlCrDESC_DEP: TStringField
      DisplayLabel = 'Descricao Departamento Conta'
      FieldName = 'DESC_DEP'
      Size = 35
    end
    object cdsCtrlCrCOD_CTA_CONTABIL: TStringField
      DisplayLabel = 'Cod Conta Contabil'
      FieldName = 'COD_CTA_CONTABIL'
      Size = 60
    end
    object cdsCtrlCrDATA_PREV_REC: TDateTimeField
      DisplayLabel = 'Data Prev Rec'
      FieldName = 'DATA_PREV_REC'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsCtrlCrFORM_PAG: TStringField
      DisplayLabel = 'Form Pag'
      FieldName = 'FORM_PAG'
      Size = 200
    end
    object cdsCtrlCrARQ_EXTRATO_ADM: TStringField
      DisplayLabel = 'Arq Extrato Adm'
      FieldName = 'ARQ_EXTRATO_ADM'
      Size = 255
    end
    object cdsCtrlCrDATA_ARQUIVO: TDateTimeField
      DisplayLabel = 'Data Extrato Adm'
      FieldName = 'DATA_ARQUIVO'
    end
    object cdsCtrlCrDATA_DESM: TDateTimeField
      DisplayLabel = 'Data Desmarcado'
      FieldName = 'DATA_DESM'
    end
    object cdsCtrlCrOP_DESM: TIntegerField
      DisplayLabel = 'Operador Desmarcou'
      FieldName = 'OP_DESM'
    end
    object cdsCtrlCrCOD_LOCALIDADE: TIntegerField
      DisplayLabel = 'Cod Localidade'
      FieldName = 'COD_LOCALIDADE'
    end
    object cdsCtrlCrLOCALIDADE: TStringField
      DisplayLabel = 'Localidade'
      FieldName = 'LOCALIDADE'
      Size = 64
    end
    object cdsCtrlCrCOD_SETOR: TIntegerField
      DisplayLabel = 'Cod Setor'
      FieldName = 'COD_SETOR'
    end
    object cdsCtrlCrSETOR: TStringField
      DisplayLabel = 'Setor'
      FieldName = 'SETOR'
      Size = 64
    end
  end
  object dsCtrlCr: TDataSource
    DataSet = cdsCtrlCr
    Left = 101
    Top = 208
  end
  object qrContasBanc: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select cb.*, c.nome_cliente from contasbancarias cb'
      
        'inner join clientes c on c.cod_cliente = cb.cod_cliente and c.co' +
        'd_empresa = cb.cod_empresa'
      'where cb.cod_cliente = 0 and cb.cod_empresa = 0')
    Left = 389
    Top = 64
  end
  object dspContasBanc: TDataSetProvider
    DataSet = qrContasBanc
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 389
    Top = 112
  end
  object cdsContasBanc: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspContasBanc'
    BeforeOpen = cdsCtrlChBeforeOpen
    Left = 389
    Top = 160
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
    Left = 389
    Top = 208
  end
  object qrCl: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      
        'select cod_cliente, nome_cliente from clientes where cod_cliente' +
        ' = 0 and cod_empresa = 0')
    Left = 461
    Top = 64
  end
  object dspCl: TDataSetProvider
    DataSet = qrCl
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 461
    Top = 112
  end
  object cdsCl: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspCl'
    BeforeOpen = cdsCtrlChBeforeOpen
    Left = 461
    Top = 160
  end
  object dsCl: TDataSource
    DataSet = cdsCl
    Left = 461
    Top = 208
  end
  object transacaoOutra: TIBTransaction
    DefaultDatabase = dtmAtivo.bancoHw
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 432
    Top = 8
  end
  object qrOutra: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacaoOutra
    Left = 512
    Top = 8
  end
  object qrBuscas2: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    Left = 304
    Top = 8
  end
  object qrBxCred: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select '#39' '#39' n_doc_v_temp, bc.* from baixa_creditos bc'
      'where bc.cod_cred = 0 and bc.codigo_emp = 0')
    Left = 509
    Top = 72
  end
  object dspBxCred: TDataSetProvider
    DataSet = qrBxCred
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 509
    Top = 120
  end
  object cdsBxCred: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspBxCred'
    BeforeOpen = cdsCtrlChBeforeOpen
    Left = 509
    Top = 168
    object cdsBxCredSEQ_BXCRED: TIntegerField
      DisplayLabel = 'Seq Baixa'
      FieldName = 'SEQ_BXCRED'
      Required = True
    end
    object cdsBxCredDATQ_C: TDateTimeField
      DisplayLabel = 'Data Quita'#231#227'o'
      FieldName = 'DATQ_C'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsBxCredVALOR_QUITADO: TFloatField
      DisplayLabel = 'Valor Baixado'
      FieldName = 'VALOR_QUITADO'
      DisplayFormat = '##0.00'
    end
    object cdsBxCredTIPO_DOC_C: TStringField
      DisplayLabel = 'Tipo Documento'
      FieldName = 'TIPO_DOC_C'
      FixedChar = True
      Size = 15
    end
    object cdsBxCredN_DOC_C: TStringField
      DisplayLabel = 'Num Documento'
      FieldName = 'N_DOC_C'
      FixedChar = True
    end
    object cdsBxCredDATA_VENC_C: TDateTimeField
      Tag = 2
      DisplayLabel = 'Data Vencimento'
      FieldName = 'DATA_VENC_C'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsBxCredHISTORICO_C: TStringField
      DisplayLabel = 'Historico'
      FieldName = 'HISTORICO_C'
      Size = 100
    end
    object cdsBxCredVALOR_C: TFloatField
      Tag = 2
      DisplayLabel = 'Valor Credito'
      FieldName = 'VALOR_C'
      DisplayFormat = '##0.00'
    end
    object cdsBxCredVALOR_CORR: TFloatField
      DisplayLabel = 'Valor Corrigido'
      FieldName = 'VALOR_CORR'
      DisplayFormat = '##0.00'
    end
    object cdsBxCredVALOR_DESC: TFloatField
      DisplayLabel = 'Valor Desconto'
      FieldName = 'VALOR_DESC'
      DisplayFormat = '##0.00'
    end
    object cdsBxCredVALOR_ACRESC: TFloatField
      DisplayLabel = 'Valor Acrescimo'
      FieldName = 'VALOR_ACRESC'
      DisplayFormat = '##0.00'
    end
    object cdsBxCredCOD_CRED: TIntegerField
      Tag = 2
      DisplayLabel = 'Codigo'
      FieldName = 'COD_CRED'
      Required = True
    end
    object cdsBxCredCODIGO_CTRL: TIntegerField
      DisplayLabel = 'Codigo Controle'
      FieldName = 'CODIGO_CTRL'
      Required = True
    end
    object cdsBxCredCOD_CLIENTE: TIntegerField
      DisplayLabel = 'Codigo Cliente'
      FieldName = 'COD_CLIENTE'
    end
    object cdsBxCredDATA_REC_C: TDateTimeField
      DisplayLabel = 'Data Cadastro'
      FieldName = 'DATA_REC_C'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsBxCredNATL_C: TStringField
      DisplayLabel = 'Natureza(C/N)'
      FieldName = 'NATL_C'
      FixedChar = True
      Size = 1
    end
    object cdsBxCredTP_DOC_V: TStringField
      DisplayLabel = 'Tipo Doc Venda'
      FieldName = 'TP_DOC_V'
      FixedChar = True
      Size = 6
    end
    object cdsBxCredN_DOC_V: TIntegerField
      DisplayLabel = 'Num Doc Venda'
      FieldName = 'N_DOC_V'
    end
    object cdsBxCredN_DOC_V_TEMP: TStringField
      DisplayLabel = 'Num Doc Vnd'
      FieldName = 'N_DOC_V_TEMP'
      FixedChar = True
      Size = 1
    end
    object cdsBxCredJUROS_COB: TFloatField
      DisplayLabel = 'Valor Juros Cobrado'
      FieldName = 'JUROS_COB'
      DisplayFormat = '##0.00'
    end
    object cdsBxCredOCORRENCIABANCARIA: TMemoField
      DisplayLabel = 'Informa'#231#227'o Banc'#225'ria'
      FieldName = 'OCORRENCIABANCARIA'
      BlobType = ftMemo
      Size = 8
    end
    object cdsBxCredLOTE: TIntegerField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
    end
    object cdsBxCredLOTE_QUIT: TIntegerField
      DisplayLabel = 'Lote Baixa'
      FieldName = 'LOTE_QUIT'
    end
    object cdsBxCredLOTE_ENT: TIntegerField
      DisplayLabel = 'Lote Cadastro'
      FieldName = 'LOTE_ENT'
    end
    object cdsBxCredLOTE_CXL: TIntegerField
      DisplayLabel = 'Lote CXL'
      FieldName = 'LOTE_CXL'
    end
    object cdsBxCredTIP_CNT: TStringField
      DisplayLabel = 'Tipo Cadastro(C/N)'
      FieldName = 'TIP_CNT'
      FixedChar = True
      Size = 1
    end
    object cdsBxCredCOD_CLI_TERC: TIntegerField
      DisplayLabel = 'Codigo Cliente Terceiro'
      FieldName = 'COD_CLI_TERC'
    end
    object cdsBxCredNOME_TERC: TStringField
      DisplayLabel = 'Nome Terceiro'
      FieldName = 'NOME_TERC'
      Size = 35
    end
    object cdsBxCredCODIGO_VEND: TIntegerField
      DisplayLabel = 'Codigo Vendedor'
      FieldName = 'CODIGO_VEND'
    end
    object cdsBxCredTIP_BAIXA: TStringField
      DisplayLabel = 'Tipo Baixa'
      FieldName = 'TIP_BAIXA'
      FixedChar = True
      Size = 1
    end
    object cdsBxCredDATA_BAIXA: TDateTimeField
      DisplayLabel = 'Data Real da Baixa'
      FieldName = 'DATA_BAIXA'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsBxCredDATA_VENDA: TDateTimeField
      DisplayLabel = 'Data Venda'
      FieldName = 'DATA_VENDA'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsBxCredDIA_CXL: TDateTimeField
      DisplayLabel = 'Dia CXL'
      FieldName = 'DIA_CXL'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsBxCredSTATUS_CXL_RQ: TStringField
      DisplayLabel = 'Status Recebimento CXL'
      FieldName = 'STATUS_CXL_RQ'
      FixedChar = True
      Size = 1
    end
    object cdsBxCredVL_RQ_PG_CXL: TFloatField
      DisplayLabel = 'Valor Recebido Cxl'
      FieldName = 'VL_RQ_PG_CXL'
      DisplayFormat = '##0.00'
    end
    object cdsBxCredOP_CXL: TIntegerField
      DisplayLabel = 'Operador CXL'
      FieldName = 'OP_CXL'
    end
    object cdsBxCredCPFCGC: TStringField
      DisplayLabel = 'CPF/CNPJ'
      FieldName = 'CPFCGC'
      FixedChar = True
      Size = 18
    end
    object cdsBxCredNOME_C: TStringField
      DisplayLabel = 'Nome Cliente'
      FieldName = 'NOME_C'
      Size = 35
    end
    object cdsBxCredOBS_C: TStringField
      DisplayLabel = 'Observa'#231#227'o'
      FieldName = 'OBS_C'
      Size = 60
    end
    object cdsBxCredCOD_TERMINAL: TIntegerField
      DisplayLabel = 'Codigo Caixa ECF'
      FieldName = 'COD_TERMINAL'
    end
    object cdsBxCredCOONAOFISCAL: TIntegerField
      DisplayLabel = 'COO N'#227'o Fiscal'
      FieldName = 'COONAOFISCAL'
    end
    object cdsBxCredNSERIEECF: TStringField
      DisplayLabel = 'Num Serie ECF'
      FieldName = 'NSERIEECF'
    end
    object cdsBxCredCODIGO_EMP: TIntegerField
      Tag = 1
      DisplayLabel = 'Codigo Empresa'
      FieldName = 'CODIGO_EMP'
      Required = True
    end
    object cdsBxCredCOD_EMP_MULT: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Emp Mult'
      FieldName = 'COD_EMP_MULT'
    end
    object cdsBxCredTP_OPERACAO: TStringField
      DisplayLabel = 'Total ou Parcial'
      FieldName = 'TP_OPERACAO'
      FixedChar = True
      Size = 1
    end
    object cdsBxCredDT_BAIXA_COMISSAO: TDateTimeField
      DisplayLabel = 'Data Baixa Comiss'#227'o'
      FieldName = 'DT_BAIXA_COMISSAO'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsBxCredVL_BAIXA_COMISSAO: TFloatField
      DisplayLabel = 'Valor Baixa Comiss'#227'o'
      FieldName = 'VL_BAIXA_COMISSAO'
      DisplayFormat = '##0.00'
    end
    object cdsBxCredVL_RECIBO: TFloatField
      DisplayLabel = 'Valor Recibo'
      FieldName = 'VL_RECIBO'
      DisplayFormat = '##0.00'
    end
    object cdsBxCredUS_BX: TIntegerField
      DisplayLabel = 'Usuario que Baixou'
      FieldName = 'US_BX'
    end
    object cdsBxCredVL_CONTABIL: TFloatField
      DisplayLabel = 'Valor Cont'#225'bil'
      FieldName = 'VL_CONTABIL'
      DisplayFormat = '##0.00'
    end
    object cdsBxCredCOD_EMP_LOTE: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Emp Lote'
      FieldName = 'COD_EMP_LOTE'
    end
  end
  object dsBxCred: TDataSource
    DataSet = cdsBxCred
    Left = 509
    Top = 216
  end
  object qrBxCh: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select '#39' '#39' n_doc_v_temp, cc.* from controle_cheque cc'
      'where cc.codigo_ch = 0 and cc.codigo_emp = 0')
    Left = 581
    Top = 72
  end
  object dspBxCh: TDataSetProvider
    DataSet = qrBxCh
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 581
    Top = 120
  end
  object cdsBxCh: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspBxCh'
    BeforeOpen = cdsCtrlChBeforeOpen
    Left = 581
    Top = 168
    object cdsBxChNOME_CH: TStringField
      DisplayLabel = 'Nome Cliente'
      FieldName = 'NOME_CH'
      Size = 35
    end
    object cdsBxChVALOR_CH: TFloatField
      Tag = 2
      DisplayLabel = 'Valor Cheque'
      FieldName = 'VALOR_CH'
      DisplayFormat = '##0.00'
    end
    object cdsBxChSTATUS_CH: TStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS_CH'
      FixedChar = True
      Size = 10
    end
    object cdsBxChDATQ_CH: TDateTimeField
      DisplayLabel = 'Data Quita'#231#227'o'
      FieldName = 'DATQ_CH'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsBxChVALOR_CORR: TFloatField
      DisplayLabel = 'Valor Corrigido'
      FieldName = 'VALOR_CORR'
      DisplayFormat = '##0.00'
    end
    object cdsBxChDATA_VENC: TDateTimeField
      Tag = 2
      DisplayLabel = 'Data Vencimento'
      FieldName = 'DATA_VENC'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsBxChVALOR_DESC: TFloatField
      DisplayLabel = 'Valor Desconto'
      FieldName = 'VALOR_DESC'
      DisplayFormat = '##0.00'
    end
    object cdsBxChVALOR_ACRESC: TFloatField
      DisplayLabel = 'Valor Acrescimo'
      FieldName = 'VALOR_ACRESC'
      DisplayFormat = '##0.00'
    end
    object cdsBxChCODIGO_CH: TIntegerField
      Tag = 2
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO_CH'
      Required = True
    end
    object cdsBxChRAZAO: TStringField
      DisplayLabel = 'Razao Social Cliente'
      FieldName = 'RAZAO'
      Size = 60
    end
    object cdsBxChN_CH: TStringField
      DisplayLabel = 'Num Cheque'
      FieldName = 'N_CH'
      FixedChar = True
    end
    object cdsBxChN_CONTA_PLC: TFloatField
      DisplayLabel = 'Num da Conta'
      FieldName = 'N_CONTA_PLC'
    end
    object cdsBxChCODIGO_CTRL: TIntegerField
      DisplayLabel = 'Codigo Controle'
      FieldName = 'CODIGO_CTRL'
      Required = True
    end
    object cdsBxChCOD_CLIENTE: TIntegerField
      DisplayLabel = 'Codigo Cliente'
      FieldName = 'COD_CLIENTE'
    end
    object cdsBxChDATA_REC: TDateTimeField
      DisplayLabel = 'Data Cadastro'
      FieldName = 'DATA_REC'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsBxChHISTORICO_CH: TStringField
      DisplayLabel = 'Historico'
      FieldName = 'HISTORICO_CH'
      Size = 100
    end
    object cdsBxChNATL_CH: TStringField
      DisplayLabel = 'Natureza(C/N)'
      FieldName = 'NATL_CH'
      FixedChar = True
      Size = 1
    end
    object cdsBxChCOD_CLI: TStringField
      DisplayLabel = 'Codigo CI'
      FieldName = 'COD_CLI'
      Size = 60
    end
    object cdsBxChOBS_CH: TStringField
      DisplayLabel = 'Observa'#231#227'o'
      FieldName = 'OBS_CH'
      Size = 60
    end
    object cdsBxChLOTE: TIntegerField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
    end
    object cdsBxChTP_DOC_V: TStringField
      DisplayLabel = 'Tipo Doc Venda'
      FieldName = 'TP_DOC_V'
      FixedChar = True
      Size = 6
    end
    object cdsBxChN_DOC_V: TIntegerField
      DisplayLabel = 'Num Doc Venda'
      FieldName = 'N_DOC_V'
    end
    object cdsBxChN_DOC_V_TEMP: TStringField
      DisplayLabel = 'Num Doc Vnd'
      FieldName = 'N_DOC_V_TEMP'
      FixedChar = True
      Size = 1
    end
    object cdsBxChDTORIGINAL_CH: TDateTimeField
      DisplayLabel = 'Data Original Cheque'
      FieldName = 'DTORIGINAL_CH'
    end
    object cdsBxChDATA_VENDA: TDateTimeField
      DisplayLabel = 'Data Venda'
      FieldName = 'DATA_VENDA'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsBxChAGENCIA: TStringField
      DisplayLabel = 'Agencia'
      FieldName = 'AGENCIA'
      Size = 10
    end
    object cdsBxChCONTA: TStringField
      DisplayLabel = 'Conta'
      FieldName = 'CONTA'
      Size = 15
    end
    object cdsBxChBANCO: TStringField
      DisplayLabel = 'Banco'
      FieldName = 'BANCO'
      Size = 35
    end
    object cdsBxChCOD_CLI_TERC: TIntegerField
      DisplayLabel = 'Codigo Cliente Terceiro'
      FieldName = 'COD_CLI_TERC'
    end
    object cdsBxChNOME_TERC: TStringField
      DisplayLabel = 'Nome Terceiro'
      FieldName = 'NOME_TERC'
      Size = 35
    end
    object cdsBxChTIP_CNT: TStringField
      DisplayLabel = 'Tipo Cadastro(C/N)'
      FieldName = 'TIP_CNT'
      FixedChar = True
      Size = 1
    end
    object cdsBxChDATA_CXL: TDateTimeField
      DisplayLabel = 'Data Caixa Auxiliar'
      FieldName = 'DATA_CXL'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsBxChCODIGO_VEND: TIntegerField
      DisplayLabel = 'Codigo Vendedor'
      FieldName = 'CODIGO_VEND'
    end
    object cdsBxChTIP_BAIXA: TStringField
      DisplayLabel = 'Tipo Baixa'
      FieldName = 'TIP_BAIXA'
      FixedChar = True
      Size = 1
    end
    object cdsBxChDATA_REM_REC: TDateTimeField
      DisplayLabel = 'Data Remessa'
      FieldName = 'DATA_REM_REC'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsBxChCOD_TERM: TIntegerField
      DisplayLabel = 'Codigo Terminal'
      FieldName = 'COD_TERM'
    end
    object cdsBxChLOTE_QUIT: TIntegerField
      DisplayLabel = 'Lote Baixa'
      FieldName = 'LOTE_QUIT'
    end
    object cdsBxChLOTE_ENT: TIntegerField
      DisplayLabel = 'Lote Cadastro'
      FieldName = 'LOTE_ENT'
    end
    object cdsBxChCPFCGC: TStringField
      DisplayLabel = 'CPF/CNPJ'
      FieldName = 'CPFCGC'
      FixedChar = True
      Size = 18
    end
    object cdsBxChDT_BAIXA_COMISSAO: TDateTimeField
      DisplayLabel = 'Data Baixa Comiss'#227'o'
      FieldName = 'DT_BAIXA_COMISSAO'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsBxChVL_BAIXA_COMISSAO: TFloatField
      DisplayLabel = 'Valor Baixa Comiss'#227'o'
      FieldName = 'VL_BAIXA_COMISSAO'
      DisplayFormat = '##0.00'
    end
    object cdsBxChID_BANCO: TStringField
      DisplayLabel = 'Num Banco'
      FieldName = 'ID_BANCO'
      Size = 11
    end
    object cdsBxChCODIGO_EMP: TIntegerField
      Tag = 1
      DisplayLabel = 'Codigo Empresa'
      FieldName = 'CODIGO_EMP'
      Required = True
    end
    object cdsBxChCOD_EMP_MULT: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Emp Multi'
      FieldName = 'COD_EMP_MULT'
    end
    object cdsBxChSELEC: TStringField
      Tag = 1
      DisplayLabel = 'S'
      FieldName = 'SELEC'
      FixedChar = True
      Size = 1
    end
    object cdsBxChSEL: TStringField
      Tag = 2
      DisplayLabel = 'Sel'
      FieldKind = fkInternalCalc
      FieldName = 'SEL'
      Size = 1
    end
    object cdsBxChVL_CONTABIL: TFloatField
      DisplayLabel = 'Valor Cont'#225'bil'
      FieldName = 'VL_CONTABIL'
      DisplayFormat = '##0.00'
    end
    object cdsBxChCOD_EMP_LOTE: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Emp Lote'
      FieldName = 'COD_EMP_LOTE'
    end
  end
  object dsBxCh: TDataSource
    AutoEdit = False
    DataSet = cdsBxCh
    Left = 581
    Top = 216
  end
  object dsCtrlCh2: TDataSource
    AutoEdit = False
    DataSet = cdsCtrlCh
    Left = 29
    Top = 256
  end
  object dsCtrlCr2: TDataSource
    DataSet = cdsCtrlCr
    Left = 101
    Top = 256
  end
  object qrRec: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      
        'select * from recibos where ((recant = '#39'S'#39') or (recant = '#39'O'#39')) a' +
        'nd ((status_rec is null) or (status_rec = '#39#39')) and COD_EMPRESA =' +
        ' 0 and ATIVO = 1')
    Left = 173
    Top = 64
  end
  object dspRec: TDataSetProvider
    DataSet = qrRec
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 173
    Top = 112
  end
  object dsRec: TDataSource
    AutoEdit = False
    DataSet = cdsRec
    Left = 173
    Top = 208
  end
  object cdsRec: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRec'
    BeforeOpen = cdsCtrlChBeforeOpen
    Left = 173
    Top = 159
    object cdsRecSELEC: TStringField
      DisplayLabel = 'Sel'
      FieldName = 'SELEC'
      FixedChar = True
      Size = 1
    end
    object cdsRecDATA_REC: TDateTimeField
      DisplayLabel = 'Data Recibo'
      FieldName = 'DATA_REC'
    end
    object cdsRecNRECIBO: TIntegerField
      DisplayLabel = 'N'#186' Recibo'
      FieldName = 'NRECIBO'
      Required = True
    end
    object cdsRecNUM_REC_DEP: TStringField
      DisplayLabel = 'N'#176' Rec Dep'
      FieldName = 'NUM_REC_DEP'
      Size = 11
    end
    object cdsRecVALOR: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VALOR'
      DisplayFormat = '##0.00'
    end
    object cdsRecVALOR_UT: TFloatField
      DisplayLabel = 'Valor a Utilizar'
      FieldKind = fkInternalCalc
      FieldName = 'VALOR_UT'
      DisplayFormat = '##0.00'
    end
    object cdsRecNOME_DEV: TStringField
      DisplayLabel = 'Pagante'
      FieldName = 'NOME_DEV'
      FixedChar = True
      Size = 50
    end
    object cdsRecSTATUS_REC: TStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS_REC'
      FixedChar = True
      Size = 10
    end
    object cdsRecREFERENCIA1: TStringField
      DisplayLabel = 'Linha 1'
      FieldName = 'REFERENCIA1'
      FixedChar = True
      Size = 66
    end
    object cdsRecREFERENCIA2: TStringField
      DisplayLabel = 'Linha 2'
      FieldName = 'REFERENCIA2'
      FixedChar = True
      Size = 66
    end
    object cdsRecREFERENCIA3: TStringField
      DisplayLabel = 'Linha 3'
      FieldName = 'REFERENCIA3'
      FixedChar = True
      Size = 66
    end
    object cdsRecREFERENCIA4: TStringField
      DisplayLabel = 'Linha 4'
      FieldName = 'REFERENCIA4'
      FixedChar = True
      Size = 66
    end
    object cdsRecCOD_BENEF: TIntegerField
      DisplayLabel = 'N'#186' Benefici'#225'rio'
      FieldName = 'COD_BENEF'
    end
    object cdsRecBENEF_CLIENT: TStringField
      DisplayLabel = 'Benefici'#225'rio'
      FieldName = 'BENEF_CLIENT'
      FixedChar = True
      Size = 40
    end
    object cdsRecCOD_DEVEDOR: TIntegerField
      DisplayLabel = 'C'#243'd Pagante'
      FieldName = 'COD_DEVEDOR'
    end
    object cdsRecLOCALDATA: TStringField
      DisplayLabel = 'Local e Data'
      FieldName = 'LOCALDATA'
      FixedChar = True
      Size = 70
    end
    object cdsRecRECANT: TStringField
      DisplayLabel = 'Recibo Antecipado'
      FieldName = 'RECANT'
      FixedChar = True
      Size = 1
    end
    object cdsRecDEPREC: TStringField
      DisplayLabel = 'Departamento'
      FieldName = 'DEPREC'
      FixedChar = True
      Size = 1
    end
    object cdsRecNDOCANT: TIntegerField
      DisplayLabel = 'N'#186' Doc Venda'
      FieldName = 'NDOCANT'
    end
    object cdsRecDIA_CXL: TDateTimeField
      DisplayLabel = 'Data Caixa Auxiliar'
      FieldName = 'DIA_CXL'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsRecN_MOV_CXL: TIntegerField
      DisplayLabel = 'N'#186' Movimento Caixa Auxiliar'
      FieldName = 'N_MOV_CXL'
    end
    object cdsRecOBS_CXL_RQ: TStringField
      DisplayLabel = 'Obs Caixa Auxiliar'
      FieldName = 'OBS_CXL_RQ'
      FixedChar = True
      Size = 50
    end
    object cdsRecSTATUS_CXL_RQ: TStringField
      DisplayLabel = 'Status Caixa Auxiliar'
      FieldName = 'STATUS_CXL_RQ'
      FixedChar = True
      Size = 1
    end
    object cdsRecVL_RQ_PG_CXL: TFloatField
      DisplayLabel = 'Valor Paga Caixa Auxiliar'
      FieldName = 'VL_RQ_PG_CXL'
      currency = True
    end
    object cdsRecDATA_BAIXA: TDateTimeField
      DisplayLabel = 'Data Baixa'
      FieldName = 'DATA_BAIXA'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsRecHISTORICO_REC: TStringField
      DisplayLabel = 'Hist'#243'rico'
      FieldName = 'HISTORICO_REC'
      FixedChar = True
      Size = 50
    end
    object cdsRecCOD_PREP: TIntegerField
      DisplayLabel = 'N'#186' Preposto'
      FieldName = 'COD_PREP'
    end
    object cdsRecOP_CXL: TIntegerField
      DisplayLabel = 'N'#186' Operador'
      FieldName = 'OP_CXL'
    end
    object cdsRecCOD_US: TIntegerField
      DisplayLabel = 'N'#186' Usu'#225'rio'
      FieldName = 'COD_US'
    end
    object cdsRecNUM_NF: TIntegerField
      DisplayLabel = 'Num NF'
      FieldName = 'NUM_NF'
    end
    object cdsRecSERIE_NF: TStringField
      DisplayLabel = 'S'#233'rie NF'
      FieldName = 'SERIE_NF'
      Size = 5
    end
    object cdsRecCOD_EMPRESA: TIntegerField
      DisplayLabel = 'C'#243'digo Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsRecATRAVES1: TStringField
      DisplayLabel = 'Atraves 1'
      FieldName = 'ATRAVES1'
      Size = 66
    end
    object cdsRecATRAVES2: TStringField
      DisplayLabel = 'Atraves 2'
      FieldName = 'ATRAVES2'
      Size = 66
    end
    object cdsRecATRAVES3: TStringField
      DisplayLabel = 'Atraves 3'
      FieldName = 'ATRAVES3'
      Size = 66
    end
    object cdsRecOBSERVACAO1: TStringField
      DisplayLabel = 'Observacao 1'
      FieldName = 'OBSERVACAO1'
      Size = 66
    end
    object cdsRecOBSERVACAO2: TStringField
      DisplayLabel = 'Observacao 2'
      FieldName = 'OBSERVACAO2'
      Size = 66
    end
    object cdsRecOBSERVACAO3: TStringField
      DisplayLabel = 'Observacao 3'
      FieldName = 'OBSERVACAO3'
      Size = 66
    end
    object cdsRecCOD_EMP_MULT: TIntegerField
      DisplayLabel = 'Cod Unificada'
      FieldName = 'COD_EMP_MULT'
    end
  end
  object qrItensCarta: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransCartas
    SQL.Strings = (
      'select ITENS_CARTA.*,clientes.email,clientes.cidade '
      'from  ITENS_CARTA '
      'inner join clientes'
      
        'on ITENS_CARTA .cod_cliente=clientes.cod_cliente and ITENS_CARTA' +
        '.cod_empresa=clientes.cod_empresa'
      'where ITENS_CARTA.codigo=-1 and ITENS_CARTA.cod_empresa=-1')
    Left = 701
    Top = 72
  end
  object dspItensCarta: TDataSetProvider
    DataSet = qrItensCarta
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 701
    Top = 119
  end
  object cdsItensCarta: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspItensCarta'
    BeforeOpen = cdsCtrlChBeforeOpen
    Left = 702
    Top = 168
    object cdsItensCartaSEL: TStringField
      DisplayLabel = 'Sel'
      FieldKind = fkInternalCalc
      FieldName = 'SEL'
      ProviderFlags = []
      Size = 1
    end
    object cdsItensCartaCODIGO: TIntegerField
      Tag = 2
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      Required = True
    end
    object cdsItensCartaCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod. Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsItensCartaDATA: TDateTimeField
      Tag = 2
      DisplayLabel = 'Data Processamento'
      FieldName = 'DATA'
    end
    object cdsItensCartaCONDICAO: TIntegerField
      Tag = 1
      FieldName = 'CONDICAO'
    end
    object cdsItensCartaCOD_CARTA: TIntegerField
      Tag = 2
      DisplayLabel = 'Cod. Carta'
      FieldName = 'COD_CARTA'
    end
    object cdsItensCartaCOD_CLIENTE: TIntegerField
      DisplayLabel = 'Cod. Cliente'
      FieldName = 'COD_CLIENTE'
    end
    object cdsItensCartaNOME_CLIENTE: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'NOME_CLIENTE'
      Size = 50
    end
    object cdsItensCartaDT_SOLUCAO: TDateTimeField
      Tag = 2
      DisplayLabel = 'Data Solu'#231#227'o'
      FieldName = 'DT_SOLUCAO'
    end
    object cdsItensCartaDIAS_ATRASO: TIntegerField
      Tag = 1
      DisplayLabel = 'Dias de Atraso'
      FieldName = 'DIAS_ATRASO'
    end
    object cdsItensCartaATIVO: TIntegerField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
    object cdsItensCartaCOD_FATURAMENTO: TIntegerField
      DisplayLabel = 'Cod. Faturamento'
      FieldName = 'COD_FATURAMENTO'
    end
    object cdsItensCartaDIAS_ATRASO_PED: TIntegerField
      DisplayLabel = 'Dias de Atraso Pesquisados'
      FieldName = 'DIAS_ATRASO_PED'
    end
    object cdsItensCartaCOD_CONTROLE: TStringField
      DisplayLabel = 'Cod.Controles Pesq.'
      FieldName = 'COD_CONTROLE'
      Size = 32
    end
    object cdsItensCartaSTATUSCARTA: TStringField
      Tag = 2
      DisplayLabel = 'Status Carta'
      FieldName = 'STATUSCARTA'
      ProviderFlags = [pfInWhere, pfHidden]
      FixedChar = True
      Size = 11
    end
    object cdsItensCartaEMAIL: TStringField
      DisplayLabel = 'E-mail do cliente'
      FieldName = 'EMAIL'
      ProviderFlags = [pfInWhere, pfHidden]
      Size = 50
    end
    object cdsItensCartaCIDADE: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'CIDADE'
      ProviderFlags = [pfInWhere, pfHidden]
      Size = 30
    end
    object cdsItensCartaCOD_CRED: TIntegerField
      Tag = 1
      FieldName = 'COD_CRED'
    end
    object cdsItensCartaVERSAOCARTA: TSmallintField
      Tag = 1
      FieldName = 'VERSAOCARTA'
      Visible = False
    end
    object cdsItensCartaREPROCESSAMENTO: TDateTimeField
      DisplayLabel = 'Reprocessamento'
      FieldName = 'REPROCESSAMENTO'
    end
    object cdsItensCartaSOLUCIONADA: TStringField
      Tag = 2
      DisplayLabel = 'Solucionada'
      FieldName = 'SOLUCIONADA'
      ProviderFlags = [pfInWhere, pfHidden]
      ReadOnly = True
      FixedChar = True
      Size = 3
    end
    object cdsItensCartaNUMREPROCESSAMENTO: TIntegerField
      DisplayLabel = 'Num.Reprocessamentos'
      FieldName = 'NUMREPROCESSAMENTO'
    end
    object cdsItensCartaCOD_EMP_MULT: TIntegerField
      DisplayLabel = 'Cod Unificada'
      FieldName = 'COD_EMP_MULT'
    end
  end
  object dsItensCarta: TDataSource
    DataSet = cdsItensCarta
    Left = 703
    Top = 214
  end
  object IBTransCartas: TIBTransaction
    DefaultDatabase = dtmAtivo.bancoHw
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 704
    Top = 8
  end
  object SpIncCodigoCarta: TIBStoredProc
    Database = dtmAtivo.bancoHw
    Transaction = IBTransCartas
    StoredProcName = 'INCREMENTA_CODIGO'
    Left = 622
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
  object qrCredCartas: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransCartas
    SQL.Strings = (
      'select itc.*, mc.descricao,'
      '    case when coalesce(cc.status_c,'#39#39')='#39'QUITADO'#39
      '    then '#39'QUITADO'#39' else '#39'N'#195'O QUITADO'#39' end as status_c,cc.n_doc_c'
      '    from itens_carta_cred itc inner join itens_carta ic'
      
        '    on itc.cod_itemcarta=ic.codigo and itc.cod_empresa=ic.cod_em' +
        'presa'
      '    inner join controle_creditos cc'
      
        '    on itc.cod_cred=cc.cod_cred and itc.cod_empresa=cc.codigo_em' +
        'p'
      '    inner join modcartas mc'
      
        '    on ic.cod_carta=mc.cod_carta and ic.cod_empresa=mc.cod_empre' +
        'sa'
      '    where ic.cod_empresa=-1'
      '    and itc.cod_itemcarta =-1')
    Left = 781
    Top = 72
  end
  object dspCredCartas: TDataSetProvider
    DataSet = qrCredCartas
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 781
    Top = 119
  end
  object cdsCredCartas: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspCredCartas'
    BeforeOpen = cdsCtrlChBeforeOpen
    Left = 782
    Top = 168
    object cdsCredCartasCOD_ITEMCARTA: TIntegerField
      Tag = 2
      DisplayLabel = 'Cod. Item'
      FieldName = 'COD_ITEMCARTA'
      Origin = '"ITENS_CARTA_CRED"."COD_ITEMCARTA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsCredCartasCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod. Empresa'
      FieldName = 'COD_EMPRESA'
      Origin = '"ITENS_CARTA_CRED"."COD_EMPRESA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
    end
    object cdsCredCartasN_DOC_C: TStringField
      DisplayLabel = 'Num.Documento'
      FieldName = 'N_DOC_C'
      Origin = '"CONTROLE_CREDITOS"."N_DOC_C"'
      ProviderFlags = [pfInWhere, pfHidden]
      ReadOnly = True
      FixedChar = True
    end
    object cdsCredCartasCOD_CRED: TIntegerField
      Tag = 2
      DisplayLabel = 'Cod. Cr'#233'dito'
      FieldName = 'COD_CRED'
      Origin = '"ITENS_CARTA_CRED"."COD_CRED"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsCredCartasSTATUS_C: TStringField
      DisplayLabel = 'Status Cr'#233'dito'
      FieldName = 'STATUS_C'
      ProviderFlags = [pfInWhere, pfHidden]
      ReadOnly = True
      FixedChar = True
      Size = 11
    end
    object cdsCredCartasDT_SOLUCAO_CRED: TDateTimeField
      Tag = 2
      DisplayLabel = 'Data Solu'#231#227'o'
      FieldName = 'DT_SOLUCAO_CRED'
      Origin = '"ITENS_CARTA_CRED"."DT_SOLUCAO_CRED"'
    end
    object cdsCredCartasDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o Carta'
      FieldName = 'DESCRICAO'
      Origin = '"MODCARTAS"."DESCRICAO"'
      ProviderFlags = [pfInWhere, pfHidden]
      ReadOnly = True
      Size = 25
    end
    object cdsCredCartasDIAS_ATRASO: TIntegerField
      DisplayLabel = 'Dias de Atraso Cred.'
      FieldName = 'DIAS_ATRASO'
      Origin = '"ITENS_CARTA_CRED"."DIAS_ATRASO"'
    end
    object cdsCredCartasCODIGO_CTRL: TIntegerField
      DisplayLabel = 'Cod.Controle'
      FieldName = 'CODIGO_CTRL'
    end
    object cdsCredCartasSOLUCIONADO: TStringField
      DisplayLabel = 'Solucionado'
      FieldName = 'SOLUCIONADO'
      Origin = '"ITENS_CARTA_CRED"."SOLUCIONADO"'
      FixedChar = True
      Size = 1
    end
  end
  object dsCredCartas: TDataSource
    DataSet = cdsCredCartas
    Left = 783
    Top = 214
  end
  object Qrbuscas1: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    Left = 240
    Top = 256
  end
  object Qrbuscas3: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    Left = 304
    Top = 256
  end
  object CdsDeptoEndiv: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 384
    Top = 256
    object CdsDeptoEndivDEPTO: TStringField
      FieldName = 'DEPTO'
      Size = 30
    end
    object CdsDeptoEndivVALORDEPTO: TCurrencyField
      FieldName = 'VALORDEPTO'
    end
    object CdsDeptoEndivVALORAUMENTO: TCurrencyField
      FieldName = 'VALORAUMENTO'
    end
    object CdsDeptoEndivVALORAMORT: TCurrencyField
      FieldName = 'VALORAMORT'
    end
  end
  object qrObsCred: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select o.*, c.nome_vendedor from observacao o'
      
        'left join colaborador c on c.cod_vendedor = o.cod_usuario and c.' +
        'cod_empresa = o.cod_empresa'
      'where o.cod_obs = 0 and o.cod_empresa=0')
    Left = 861
    Top = 72
  end
  object dspObsCred: TDataSetProvider
    DataSet = qrObsCred
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 861
    Top = 119
  end
  object cdsObsCred: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspObsCred'
    BeforeOpen = cdsCtrlChBeforeOpen
    Left = 862
    Top = 168
    object cdsObsCredCOD_OBS: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_OBS'
      Required = True
    end
    object cdsObsCredCOD_EMPRESA: TIntegerField
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsObsCredDATA_OBS: TDateTimeField
      DisplayLabel = 'Data'
      FieldName = 'DATA_OBS'
    end
    object cdsObsCredHORA_OBS: TTimeField
      DisplayLabel = 'Hora'
      FieldName = 'HORA_OBS'
    end
    object cdsObsCredOBSERVACAO: TMemoField
      DisplayLabel = 'Observa'#231#227'o'
      FieldName = 'OBSERVACAO'
      OnGetText = cdsObsCredOBSERVACAOGetText
      BlobType = ftMemo
      Size = 8
    end
    object cdsObsCredCOD_USUARIO: TIntegerField
      DisplayLabel = 'Cod Usu'#225'rio'
      FieldName = 'COD_USUARIO'
    end
    object cdsObsCredNOME_VENDEDOR: TStringField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'NOME_VENDEDOR'
      ProviderFlags = []
      Size = 35
    end
    object cdsObsCredNITEM: TIntegerField
      DisplayLabel = 'Num.Item'
      FieldName = 'NITEM'
      Required = True
    end
  end
  object dsObsCred: TDataSource
    AutoEdit = False
    DataSet = cdsObsCred
    Left = 863
    Top = 214
  end
  object DsListaExtCartao: TDataSource
    DataSet = CdslistaExtCartao
    Left = 464
    Top = 322
  end
  object CdslistaExtCartao: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 464
    Top = 266
    object CdslistaExtCartaoDTPROCESSAMENTO: TDateField
      DisplayLabel = 'Dt. Arquivo'
      FieldName = 'DTPROCESSAMENTO'
    end
    object CdslistaExtCartaoCOD_TIPOEXTRATO: TIntegerField
      DisplayLabel = 'Cod Extrato'
      FieldName = 'COD_TIPOEXTRATO'
    end
    object CdslistaExtCartaoTIPOEXTRATO: TStringField
      DisplayLabel = 'Descri'#231#227'o Extrato'
      FieldName = 'TIPOEXTRATO'
      Size = 30
    end
    object CdslistaExtCartaoSTATUS_PROC: TStringField
      DisplayLabel = 'Status Processamento'
      FieldName = 'STATUS_PROC'
      Size = 25
    end
    object CdslistaExtCartaoNUM_DOC_ADM: TStringField
      DisplayLabel = 'Num Doc Adm(NSU)'
      FieldName = 'NUM_DOC_ADM'
      Size = 10
    end
    object CdslistaExtCartaoNUM_DOC_CRED: TStringField
      DisplayLabel = 'Num. Doc. Cr'#233'dito'
      FieldName = 'NUM_DOC_CRED'
    end
    object CdslistaExtCartaoN_AUT_CART_CRED: TStringField
      DisplayLabel = 'Num Autoriza'#231#227'o'
      FieldName = 'N_AUT_CART_CRED'
    end
    object CdslistaExtCartaoNPARCELA: TIntegerField
      DisplayLabel = 'Num Parcela'
      FieldName = 'NPARCELA'
    end
    object CdslistaExtCartaoVALORPARCELA: TCurrencyField
      DisplayLabel = 'Valor Parcela Adm'
      FieldName = 'VALORPARCELA'
      DisplayFormat = '##0.00'
    end
    object CdslistaExtCartaoVALOR_C: TCurrencyField
      DisplayLabel = 'Valor Cr'#233'dito'
      FieldName = 'VALOR_C'
      DisplayFormat = '##0.00'
    end
    object CdslistaExtCartaoTAXA_CARTAO_CRED: TCurrencyField
      DisplayLabel = 'Comiss'#227'o Cart'#227'o'
      FieldName = 'TAXA_CARTAO_CRED'
      DisplayFormat = '##0.00'
    end
    object CdslistaExtCartaoNOME_C: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'NOME_C'
      Size = 35
    end
    object CdslistaExtCartaoSTATUS_ADM: TIntegerField
      DisplayLabel = 'Cod Status Adm'
      FieldName = 'STATUS_ADM'
    end
    object CdslistaExtCartaoDESC_STATUS_ADM: TStringField
      DisplayLabel = 'Status Adm'
      FieldName = 'DESC_STATUS_ADM'
      Size = 50
    end
    object CdslistaExtCartaoDATA_PREV_PAG: TDateField
      DisplayLabel = 'Prev Pgto'
      FieldName = 'DATA_PREV_PAG'
    end
    object CdslistaExtCartaoCOD_TERMINAL_ADM: TStringField
      DisplayLabel = 'Num Terminal Cart'#227'o'
      FieldName = 'COD_TERMINAL_ADM'
      Size = 10
    end
    object CdslistaExtCartaoPERCTXCARTAO: TFloatField
      DisplayLabel = 'Perc.Tx.Cart'#227'o'
      FieldName = 'PERCTXCARTAO'
      DisplayFormat = '##0.00'
    end
    object CdslistaExtCartaoTARIFA_CARTAO: TCurrencyField
      DisplayLabel = 'Tarifa Cart'#227'o'
      FieldName = 'TARIFA_CARTAO'
    end
    object CdslistaExtCartaoRO_ADM: TIntegerField
      DisplayLabel = 'Num RO Adm'
      FieldName = 'RO_ADM'
    end
    object CdslistaExtCartaoTIPO_PROD_ADM: TIntegerField
      DisplayLabel = 'C'#243'digo do Produto Adm'
      FieldName = 'TIPO_PROD_ADM'
    end
    object CdslistaExtCartaoDESC_TIPO_PROD_ADM: TStringField
      DisplayLabel = 'Descri'#231#227'o Produto Adm'
      FieldName = 'DESC_TIPO_PROD_ADM'
      Size = 50
    end
    object CdslistaExtCartaoCOD_BANDEIRA_ADM: TIntegerField
      DisplayLabel = 'C'#243'digo Bandeira'
      FieldName = 'COD_BANDEIRA_ADM'
    end
    object CdslistaExtCartaoDESC_BANDEIRA: TStringField
      DisplayLabel = 'Descri'#231#227'o Bandeira'
      FieldName = 'DESC_BANDEIRA'
      Size = 50
    end
    object CdslistaExtCartaoIND_ANTEC_RO_ADM: TStringField
      DisplayLabel = 'Indicador Antecipa'#231#227'o RO'
      FieldName = 'IND_ANTEC_RO_ADM'
      Size = 50
    end
    object CdslistaExtCartaoIND_OR_AJUSTE_ADM: TIntegerField
      DisplayLabel = 'Cod Origem do Ajuste'
      FieldName = 'IND_OR_AJUSTE_ADM'
    end
    object CdslistaExtCartaoIND_OR_DESC_AJUSTE: TStringField
      DisplayLabel = 'Origem Ajuste'
      FieldName = 'IND_OR_DESC_AJUSTE'
      Size = 50
    end
    object CdslistaExtCartaoARQ_EXTRATO_ADM: TStringField
      DisplayLabel = 'Arquivo Extrato'
      FieldName = 'ARQ_EXTRATO_ADM'
      Size = 255
    end
    object CdslistaExtCartaoCOD_CRED: TIntegerField
      DisplayLabel = 'Cod Cr'#233'dito'
      FieldName = 'COD_CRED'
    end
    object CdslistaExtCartaoCOD_CONTROLE_CRED: TIntegerField
      DisplayLabel = 'C'#243'digo Controle p/ Cr'#233'dito'
      FieldName = 'CODIGO_CTRL'
    end
    object CdslistaExtCartaoNOME_CONTROLE_CRED: TStringField
      DisplayLabel = 'Nome Controle p/ Cr'#233'dito'
      FieldName = 'NOME_CTRL'
      Size = 30
    end
    object CdslistaExtCartaoAGENCIA_BANCO: TStringField
      DisplayLabel = 'Ag'#234'ncia Controle p/ Credito'
      FieldName = 'AGENCIA_CTRL'
      Size = 10
    end
    object CdslistaExtCartaoN_CONTA_CTRL: TStringField
      DisplayLabel = 'Conta Corrente p/ cr'#233'dito'
      FieldName = 'N_CONTA_CTRL'
      Size = 15
    end
    object CdslistaExtCartaoNSU_RO_ADM: TStringField
      DisplayLabel = 'NSU RO Adm'
      FieldName = 'NSU_RO_ADM'
      Size = 15
    end
    object CdslistaExtCartaoTIPO_TRANSACAO: TStringField
      DisplayLabel = 'Descri'#231#227'o Transa'#231#227'o'
      FieldName = 'TIPO_TRANSACAO'
      Size = 30
    end
    object CdslistaExtCartaoCOD_TIPOTRANS: TIntegerField
      DisplayLabel = 'C'#243'digo Transa'#231#227'o'
      FieldName = 'COD_TIPOTRANS'
    end
    object CdslistaExtCartaoIDBAIXA_CARTAO: TIntegerField
      DisplayLabel = 'Id.de Baixa'
      FieldName = 'IDBAIXA_CARTAO'
    end
    object CdslistaExtCartaoCOD_ADM: TIntegerField
      DisplayLabel = 'C'#243'd. Administradora'
      FieldName = 'COD_ADM'
    end
    object CdslistaExtCartaoDTVENDA: TDateTimeField
      DisplayLabel = 'Data Venda Cart'#227'o'
      FieldName = 'DTVENDA'
    end
    object CdslistaExtCartaoSEQID: TIntegerField
      DisplayLabel = 'Seq.ID.Pend'#234'ncias'
      FieldName = 'SEQID'
    end
    object CdslistaExtCartaoQTDE_PARC: TIntegerField
      DisplayLabel = 'Qtde Total Parcelas'
      FieldName = 'QTDE_PARC'
    end
    object CdslistaExtCartaoVL_VENDA: TCurrencyField
      DisplayLabel = 'Valor Venda'
      FieldName = 'VL_VENDA'
    end
    object CdslistaExtCartaoCOD_EMP_MULT: TIntegerField
      DisplayLabel = 'Cod Unificada'
      FieldName = 'COD_EMP_MULT'
    end
    object CdslistaExtCartaoDESCR_OCORRENCIA_CONFERE: TStringField
      FieldName = 'DESCR_OCORRENCIA_CONFERE'
      Size = 30
    end
    object CdslistaExtCartaoCONFERE: TStringField
      FieldName = 'CONFERE'
      Size = 1
    end
    object CdslistaExtCartaoID_FINANC_CONFERE: TIntegerField
      FieldName = 'ID_FINANC_CONFERE'
    end
    object CdslistaExtCartaoACQUIRER_ID: TIntegerField
      FieldName = 'ACQUIRER_ID'
    end
    object CdslistaExtCartaoCOD_AJUSTE: TStringField
      FieldName = 'COD_AJUSTE_COD'
      Size = 5
    end
    object CdslistaExtCartaoTIPO_LANCAMENTO_COD: TStringField
      FieldName = 'TIPO_LANCAMENTO_COD'
      Size = 5
    end
    object CdslistaExtCartaoDATA_ARQUIVO: TDateTimeField
      FieldName = 'DATA_ARQUIVO'
    end
  end
  object ibAdmcartao: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select (a.cod_adm || a.cod_empresa) cod_adm_temp,'
      'a.descricao_adm as descricao_adm_temp,'
      'a.* from adm_cartao a')
    Left = 728
    Top = 266
  end
  object dtadmcartao: TDataSource
    DataSet = cdsAdmcartao
    Left = 800
    Top = 266
  end
  object dspadmcartao: TDataSetProvider
    DataSet = ibAdmcartao
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 728
    Top = 314
  end
  object cdsAdmcartao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspadmcartao'
    BeforeOpen = cdsCtrlChBeforeOpen
    Left = 728
    Top = 362
    object cdsAdmcartaoCOD_ADM: TIntegerField
      FieldName = 'COD_ADM'
      Required = True
    end
    object cdsAdmcartaoDESCRICAO_ADM: TStringField
      FieldName = 'DESCRICAO_ADM'
      Required = True
      FixedChar = True
      Size = 30
    end
    object cdsAdmcartaoNUM_ESTAB_ADM: TIntegerField
      FieldName = 'NUM_ESTAB_ADM'
    end
    object cdsAdmcartaoEND_ARQUIVO_ADM: TStringField
      FieldName = 'END_ARQUIVO_ADM'
      Size = 255
    end
    object cdsAdmcartaoATIVO: TIntegerField
      FieldName = 'ATIVO'
    end
    object cdsAdmcartaoCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
    end
    object cdsAdmcartaoCOD_ADM_TEMP: TStringField
      FieldName = 'COD_ADM_TEMP'
      Size = 22
    end
    object cdsAdmcartaoDESCRICAO_ADM_TEMP: TStringField
      FieldName = 'DESCRICAO_ADM_TEMP'
      Required = True
      Size = 30
    end
  end
  object IbPendencias_adm: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select * from PENDENCIAS_CARTAO')
    Left = 600
    Top = 264
  end
  object DspPendencias_adm: TDataSetProvider
    DataSet = IbPendencias_adm
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 592
    Top = 312
  end
  object CdsPendencias_adm: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspPendencias_adm'
    BeforeOpen = cdsCtrlChBeforeOpen
    Left = 592
    Top = 368
    object CdsPendencias_admSEQID: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'SEQID'
      Required = True
    end
    object CdsPendencias_admCOD_ADM: TIntegerField
      DisplayLabel = 'Cod ADM'
      FieldName = 'COD_ADM'
      Required = True
    end
    object CdsPendencias_admCOD_EMPRESA: TIntegerField
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object CdsPendencias_admDTPROCESSAMENTO: TDateTimeField
      DisplayLabel = 'Data Processamento'
      FieldName = 'DTPROCESSAMENTO'
    end
    object CdsPendencias_admCOD_TIPOEXTRATO: TIntegerField
      DisplayLabel = 'Cod Tipo Extrato'
      FieldName = 'COD_TIPOEXTRATO'
    end
    object CdsPendencias_admTIPOEXTRATO: TStringField
      DisplayLabel = 'Tipo Extrato'
      FieldName = 'TIPOEXTRATO'
      Size = 30
    end
    object CdsPendencias_admSTATUS_PROC: TStringField
      DisplayLabel = 'Status Processamento'
      FieldName = 'STATUS_PROC'
      Size = 25
    end
    object CdsPendencias_admNUM_DOC_ADM: TStringField
      DisplayLabel = 'Num Doc Adm (NSU)'
      FieldName = 'NUM_DOC_ADM'
    end
    object CdsPendencias_admN_AUT_CART_CRED: TStringField
      DisplayLabel = 'Num Aut Cartao'
      FieldName = 'N_AUT_CART_CRED'
    end
    object CdsPendencias_admNPARCELA: TIntegerField
      DisplayLabel = 'Num Parcela'
      FieldName = 'NPARCELA'
    end
    object CdsPendencias_admVALOR_C: TFloatField
      DisplayLabel = 'Valor Credito'
      FieldName = 'VALOR_C'
    end
    object CdsPendencias_admTAXA_CARTAO_CRED: TFloatField
      DisplayLabel = 'Taxa Cartao'
      FieldName = 'TAXA_CARTAO_CRED'
    end
    object CdsPendencias_admNOME_C: TStringField
      DisplayLabel = 'Nome Cliente'
      FieldName = 'NOME_C'
      Size = 35
    end
    object CdsPendencias_admSTATUS_ADM: TIntegerField
      DisplayLabel = 'Cod Status ADM'
      FieldName = 'STATUS_ADM'
    end
    object CdsPendencias_admDESC_STATUS_ADM: TStringField
      DisplayLabel = 'Status ADM'
      FieldName = 'DESC_STATUS_ADM'
      Size = 50
    end
    object CdsPendencias_admDATA_PREV_PAG: TDateTimeField
      DisplayLabel = 'Data Prev Pagto'
      FieldName = 'DATA_PREV_PAG'
    end
    object CdsPendencias_admCOD_TERMINAL_ADM: TStringField
      DisplayLabel = 'Cod Terminal ADM'
      FieldName = 'COD_TERMINAL_ADM'
      Size = 10
    end
    object CdsPendencias_admPERCTXCARTAO: TFloatField
      DisplayLabel = 'Perc Taxa Cartao'
      FieldName = 'PERCTXCARTAO'
    end
    object CdsPendencias_admTARIFA_CARTAO: TFloatField
      DisplayLabel = 'Tarifa Cart'#227'o'
      FieldName = 'TARIFA_CARTAO'
    end
    object CdsPendencias_admRO_ADM: TIntegerField
      DisplayLabel = 'Num RO Adm'
      FieldName = 'RO_ADM'
    end
    object CdsPendencias_admTIPO_PROD_ADM: TIntegerField
      DisplayLabel = 'C'#243'digo do Produto ADM'
      FieldName = 'TIPO_PROD_ADM'
    end
    object CdsPendencias_admDESC_TIPO_PROD_ADM: TStringField
      DisplayLabel = 'Descri'#231#227'o do Produto ADM'
      FieldName = 'DESC_TIPO_PROD_ADM'
      Size = 50
    end
    object CdsPendencias_admCOD_BANDEIRA_ADM: TIntegerField
      DisplayLabel = 'Cod Bandeira'
      FieldName = 'COD_BANDEIRA_ADM'
    end
    object CdsPendencias_admDESC_BANDEIRA: TStringField
      DisplayLabel = 'Descri'#231#227'o da Bandeira'
      FieldName = 'DESC_BANDEIRA'
      Size = 50
    end
    object CdsPendencias_admIND_ANTEC_RO_ADM: TStringField
      DisplayLabel = 'Indicador Antecipa'#231#227'o RO'
      FieldName = 'IND_ANTEC_RO_ADM'
      Size = 50
    end
    object CdsPendencias_admIND_OR_AJUSTE_ADM: TIntegerField
      DisplayLabel = 'Codigo de Origem do Ajuste'
      FieldName = 'IND_OR_AJUSTE_ADM'
    end
    object CdsPendencias_admIND_OR_DESC_AJUSTE: TStringField
      DisplayLabel = 'Descri'#231#227'o de Origem do Ajuste'
      FieldName = 'IND_OR_DESC_AJUSTE'
      Size = 50
    end
    object CdsPendencias_admARQ_EXTRATO_ADM: TStringField
      DisplayLabel = 'Arquivo Extrato'
      FieldName = 'ARQ_EXTRATO_ADM'
      Size = 255
    end
    object CdsPendencias_admCOD_CRED: TIntegerField
      DisplayLabel = 'Cod Cred'
      FieldName = 'COD_CRED'
    end
    object CdsPendencias_admCODIGO_CTRL: TIntegerField
      DisplayLabel = 'Codigo Ctrl p/ Credito'
      FieldName = 'CODIGO_CTRL'
    end
    object CdsPendencias_admNOME_CTRL: TStringField
      DisplayLabel = 'Nome Ctrl p/ Credito'
      FieldName = 'NOME_CTRL'
      Size = 30
    end
    object CdsPendencias_admAGENCIA_CTRL: TStringField
      DisplayLabel = 'Agencia p/ Credito'
      FieldName = 'AGENCIA_CTRL'
      Size = 10
    end
    object CdsPendencias_admN_CONTA_CTRL: TStringField
      DisplayLabel = 'Conta p/ Credito'
      FieldName = 'N_CONTA_CTRL'
      Size = 15
    end
    object CdsPendencias_admNSU_RO_ADM: TStringField
      DisplayLabel = 'NSU RO Adm'
      FieldName = 'NSU_RO_ADM'
      Size = 15
    end
    object CdsPendencias_admTIPO_TRANSACAO: TStringField
      DisplayLabel = 'Descri'#231#227'o Transa'#231#227'o'
      FieldName = 'TIPO_TRANSACAO'
      Size = 30
    end
    object CdsPendencias_admCOD_TIPOTRANS: TIntegerField
      DisplayLabel = 'Cod Transa'#231#227'o'
      FieldName = 'COD_TIPOTRANS'
    end
    object CdsPendencias_admIDBAIXA_CARTAO: TIntegerField
      DisplayLabel = 'Id de Baixa'
      FieldName = 'IDBAIXA_CARTAO'
    end
    object CdsPendencias_admATIVO: TIntegerField
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
    object CdsPendencias_admNUM_DOC_CRED: TStringField
      DisplayLabel = 'Num Doc Cred'
      FieldName = 'NUM_DOC_CRED'
    end
    object CdsPendencias_admVALORPARCELA: TFloatField
      DisplayLabel = 'Valor Parcela'
      FieldName = 'VALORPARCELA'
      DisplayFormat = '##0.00'
    end
    object CdsPendencias_admDTVENDA: TDateTimeField
      FieldName = 'DTVENDA'
    end
    object CdsPendencias_admQTDE_PARC: TIntegerField
      FieldName = 'QTDE_PARC'
    end
    object CdsPendencias_admVL_VENDA: TFloatField
      FieldName = 'VL_VENDA'
    end
    object CdsPendencias_admCOD_EMP_MULT: TIntegerField
      DisplayLabel = 'Cod Unificada'
      FieldName = 'COD_EMP_MULT'
    end
  end
  object dsPendencias_adm: TDataSource
    DataSet = CdsPendencias_adm
    Left = 592
    Top = 416
  end
  object qrTermCart: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = dtmAtivo.IbTransCol
    SQL.Strings = (
      'select tc.*, a.descricao_adm from terminal_cartao tc '
      
        'inner join adm_cartao a on a.cod_adm = tc.cod_adm and a.cod_empr' +
        'esa = tc.cod_empresa where tc.cod_adm = 0 and tc.cod_empresa = 0')
    Left = 952
    Top = 240
  end
  object dspTermCart: TDataSetProvider
    DataSet = qrTermCart
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 952
    Top = 284
  end
  object cdsTermCart: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTermCart'
    BeforeOpen = cdsCtrlChBeforeOpen
    Left = 952
    Top = 328
    object cdsTermCartCOD_TERM_ADM: TStringField
      Tag = 2
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_TERM_ADM'
      Required = True
      Size = 10
    end
    object cdsTermCartDESC_TERM_ADM: TStringField
      Tag = 2
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESC_TERM_ADM'
      Size = 30
    end
    object cdsTermCartCOD_TERMINALF: TIntegerField
      Alignment = taLeftJustify
      DisplayLabel = 'C'#243'digo Terminal Fiscal'
      FieldName = 'COD_TERMINALF'
    end
    object cdsTermCartCOD_ADM: TIntegerField
      DisplayLabel = 'C'#243'digo Administradora'
      FieldName = 'COD_ADM'
      Required = True
    end
    object cdsTermCartATIVO: TIntegerField
      Tag = 1
      FieldName = 'ATIVO'
    end
    object cdsTermCartCOD_EMPRESA: TIntegerField
      Tag = 1
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsTermCartDESCRICAO_ADM: TStringField
      FieldName = 'DESCRICAO_ADM'
    end
  end
  object dsTermCart: TDataSource
    AutoEdit = False
    DataSet = cdsTermCart
    Left = 952
    Top = 375
  end
  object qrRelConciliaCartao: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      
        'select cc.valor_c, cc.cod_cred, case when c.cod_cliente is null ' +
        'then cc.nome_c else c.nome_cliente end nome_c,'
      
        'case when c.cod_cliente is null then cc.razao else c.razao end r' +
        'azao,'
      
        'cc.cod_terminal_adm, cc.codigo_ctrl_cred, cc.cod_adm, cc.taxa_ca' +
        'rtao_cred, cc.tarifa_cartao_cred,'
      
        'a.descricao_adm, ct.nome_ctrl, ct.agencia_ctrl, ct.n_conta_ctrl,' +
        ' rtrim(cc.n_doc_c) n_doc_c, cc.nparcela, a.num_estab_adm, cc.dat' +
        'a_venc_c, cc.datq_c, cc.desc_tipo_prod_adm, cc.n_aut_cart, cc.n_' +
        'docnsu_adm, cc.data_venda,cc.data_baixa,cc.qtde_parc,cc.vl_venda'
      'from controle_creditos cc'
      
        'left join clientes c on c.cod_cliente = cc.cod_cliente and c.cod' +
        '_empresa = cc.codigo_emp'
      
        'left join adm_cartao a on a.cod_adm = cc.cod_adm and a.cod_empre' +
        'sa = cc.codigo_emp'
      
        'left join controles ct on ct.codigo_ctrl = cc.codigo_ctrl_cred a' +
        'nd ct.codigo_emp = cc.codigo_emp'
      'where'
      'cc.data_venda >= 0 and cc.data_venda <= 0 and'
      
        'cc.idbaixa_cartao > 0 and cc.codigo_emp = 0 and cc.status_c = '#39'Q' +
        'UITADO'#39)
    Left = 856
    Top = 8
    object qrRelConciliaCartaoVALOR_C: TFloatField
      FieldName = 'VALOR_C'
      Origin = '"CONTROLE_CREDITOS"."VALOR_C"'
    end
    object qrRelConciliaCartaoNOME_C: TIBStringField
      FieldName = 'NOME_C'
      ProviderFlags = []
      Size = 35
    end
    object qrRelConciliaCartaoRAZAO: TIBStringField
      FieldName = 'RAZAO'
      ProviderFlags = []
      Size = 60
    end
    object qrRelConciliaCartaoCOD_TERMINAL_ADM: TIBStringField
      FieldName = 'COD_TERMINAL_ADM'
      Origin = '"CONTROLE_CREDITOS"."COD_TERMINAL_ADM"'
      Size = 10
    end
    object qrRelConciliaCartaoCODIGO_CTRL_CRED: TIntegerField
      FieldName = 'CODIGO_CTRL_CRED'
      Origin = '"CONTROLE_CREDITOS"."CODIGO_CTRL_CRED"'
    end
    object qrRelConciliaCartaoCOD_ADM: TIntegerField
      FieldName = 'COD_ADM'
      Origin = '"CONTROLE_CREDITOS"."COD_ADM"'
    end
    object qrRelConciliaCartaoTAXA_CARTAO_CRED: TFloatField
      FieldName = 'TAXA_CARTAO_CRED'
      Origin = '"CONTROLE_CREDITOS"."TAXA_CARTAO_CRED"'
    end
    object qrRelConciliaCartaoTARIFA_CARTAO_CRED: TFloatField
      FieldName = 'TARIFA_CARTAO_CRED'
      Origin = '"CONTROLE_CREDITOS"."TARIFA_CARTAO_CRED"'
    end
    object qrRelConciliaCartaoDESCRICAO_ADM: TIBStringField
      FieldName = 'DESCRICAO_ADM'
      Origin = '"ADM_CARTAO"."DESCRICAO_ADM"'
      Size = 30
    end
    object qrRelConciliaCartaoNOME_CTRL: TIBStringField
      FieldName = 'NOME_CTRL'
      Origin = '"CONTROLES"."NOME_CTRL"'
      Size = 35
    end
    object qrRelConciliaCartaoAGENCIA_CTRL: TIBStringField
      FieldName = 'AGENCIA_CTRL'
      Origin = '"CONTROLES"."AGENCIA_CTRL"'
      Size = 10
    end
    object qrRelConciliaCartaoN_CONTA_CTRL: TIBStringField
      FieldName = 'N_CONTA_CTRL'
      Origin = '"CONTROLES"."N_CONTA_CTRL"'
      FixedChar = True
      Size = 15
    end
    object qrRelConciliaCartaoNPARCELA: TIntegerField
      FieldName = 'NPARCELA'
      Origin = '"CONTROLE_CREDITOS"."NPARCELA"'
    end
    object qrRelConciliaCartaoCOD_CRED: TIntegerField
      FieldName = 'COD_CRED'
      Origin = '"CONTROLE_CREDITOS"."COD_CRED"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrRelConciliaCartaoNUM_ESTAB_ADM: TIntegerField
      FieldName = 'NUM_ESTAB_ADM'
      Origin = '"ADM_CARTAO"."NUM_ESTAB_ADM"'
    end
    object qrRelConciliaCartaoDATA_VENC_C: TDateTimeField
      FieldName = 'DATA_VENC_C'
      Origin = '"CONTROLE_CREDITOS"."DATA_VENC_C"'
    end
    object qrRelConciliaCartaoDATQ_C: TDateTimeField
      FieldName = 'DATQ_C'
      Origin = '"CONTROLE_CREDITOS"."DATQ_C"'
    end
    object qrRelConciliaCartaoDESC_TIPO_PROD_ADM: TIBStringField
      FieldName = 'DESC_TIPO_PROD_ADM'
      Origin = '"CONTROLE_CREDITOS"."DESC_TIPO_PROD_ADM"'
      Size = 50
    end
    object qrRelConciliaCartaoN_AUT_CART: TIBStringField
      FieldName = 'N_AUT_CART'
      Origin = '"CONTROLE_CREDITOS"."N_AUT_CART"'
      FixedChar = True
    end
    object qrRelConciliaCartaoN_DOCNSU_ADM: TIBStringField
      FieldName = 'N_DOCNSU_ADM'
      Origin = '"CONTROLE_CREDITOS"."N_DOCNSU_ADM"'
      Size = 10
    end
    object qrRelConciliaCartaoN_DOC_C: TIBStringField
      FieldName = 'N_DOC_C'
      ProviderFlags = []
      Size = 80
    end
    object qrRelConciliaCartaoDATA_VENDA: TDateTimeField
      FieldName = 'DATA_VENDA'
      Origin = '"CONTROLE_CREDITOS"."DATA_VENDA"'
    end
    object qrRelConciliaCartaoDATA_BAIXA: TDateTimeField
      FieldName = 'DATA_BAIXA'
      Origin = '"CONTROLE_CREDITOS"."DATA_BAIXA"'
    end
    object qrRelConciliaCartaoQTDE_PARC: TIntegerField
      FieldName = 'QTDE_PARC'
      Origin = '"CONTROLE_CREDITOS"."QTDE_PARC"'
    end
    object qrRelConciliaCartaoVL_VENDA: TFloatField
      FieldName = 'VL_VENDA'
      Origin = '"CONTROLE_CREDITOS"."VL_VENDA"'
    end
    object qrRelConciliaCartaoCOD_EMP_MULT: TIntegerField
      FieldName = 'COD_EMP_MULT'
      Origin = '"CONTROLE_CREDITOS"."COD_EMP_MULT"'
      DisplayFormat = '000'
    end
  end
  object qrCtrlCrCartao: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      
        'select cc.*, c.nome_cliente, c.razao razao_cliente, cid.nome_cid' +
        'ade from controle_creditos cc'
      
        'inner join clientes c on c.cod_cliente = cc.cod_cliente and c.co' +
        'd_empresa = cc.codigo_emp'
      'left join cidades cid on cid.cod_cidade = c.cod_cidade'
      'where cc.cod_cred = 0 and cc.codigo_emp = 0')
    Left = 957
    Top = 24
  end
  object dspCtrlCrCartao: TDataSetProvider
    DataSet = qrCtrlCrCartao
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 957
    Top = 72
  end
  object cdsCtrlCrCartao: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspCtrlCrCartao'
    BeforeOpen = cdsCtrlChBeforeOpen
    Left = 957
    Top = 120
  end
  object dsCtrlCrCartao: TDataSource
    DataSet = cdsCtrlCrCartao
    Left = 957
    Top = 168
  end
  object qrNFRet: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      
        'select nf.num_nf, nf.serie, nf.modelo_nf, nf.data_lanc, nfi.num_' +
        'fab_prod, nfi.grupo_prod, nfi.cod_prod, nfi.descricao_item, nfi.' +
        'quantidade, nfi.valor_unitario, nfi.valor_total,'
      'nfi.cod_nf, nfi.nitem'
      'from notafiscal nf'
      
        'inner join notafiscal_item nfi on nfi.cod_nf = nf.cod_nf and nfi' +
        '.cod_empresa = nf.cod_empresa'
      
        'inner join nat_op n on n.codigo_nop = nfi.codigo_nop and n.usa_b' +
        'x_retorno_fin = '#39'S'#39
      
        'where nf.cod_cliente = :cod_cliente and nf.cod_empresa = :cod_em' +
        'presa')
    Left = 29
    Top = 312
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cod_cliente'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cod_empresa'
        ParamType = ptUnknown
      end>
  end
  object dspNFRet: TDataSetProvider
    DataSet = qrNFRet
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 29
    Top = 360
  end
  object cdsNFRet: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspNFRet'
    BeforeOpen = cdsCtrlChBeforeOpen
    Left = 29
    Top = 408
    object cdsNFRetNUM_NF: TIntegerField
      DisplayLabel = 'Num NF'
      FieldName = 'NUM_NF'
      Required = True
    end
    object cdsNFRetSERIE: TStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 5
    end
    object cdsNFRetMODELO_NF: TStringField
      DisplayLabel = 'Modelo'
      FieldName = 'MODELO_NF'
      Size = 3
    end
    object cdsNFRetDATA_LANC: TDateTimeField
      DisplayLabel = 'Data'
      FieldName = 'DATA_LANC'
    end
    object cdsNFRetNUM_FAB_PROD: TStringField
      DisplayLabel = 'Num Fab Prod'
      FieldName = 'NUM_FAB_PROD'
    end
    object cdsNFRetGRUPO_PROD: TIntegerField
      DisplayLabel = 'Grupo'
      FieldName = 'GRUPO_PROD'
    end
    object cdsNFRetCOD_PROD: TStringField
      DisplayLabel = 'Cod Prod'
      FieldName = 'COD_PROD'
      FixedChar = True
      Size = 6
    end
    object cdsNFRetDESCRICAO_ITEM: TStringField
      DisplayLabel = 'Descri'#231#227'o Mercadoria'
      FieldName = 'DESCRICAO_ITEM'
      Size = 75
    end
    object cdsNFRetQUANTIDADE: TFloatField
      DisplayLabel = 'Qtde'
      FieldName = 'QUANTIDADE'
    end
    object cdsNFRetVALOR_UNITARIO: TFloatField
      DisplayLabel = 'Vl Unit'
      FieldName = 'VALOR_UNITARIO'
    end
    object cdsNFRetVALOR_TOTAL: TFloatField
      DisplayLabel = 'Vl Total'
      FieldName = 'VALOR_TOTAL'
    end
    object cdsNFRetCOD_NF: TIntegerField
      DisplayLabel = 'Cod NF'
      FieldName = 'COD_NF'
      Required = True
    end
    object cdsNFRetNITEM: TIntegerField
      DisplayLabel = 'N Item'
      FieldName = 'NITEM'
      Required = True
    end
    object cdsNFRetCOD_CRED_RET_FIN: TIntegerField
      DisplayLabel = 'Credito vinculado'
      FieldName = 'COD_CRED_RET_FIN'
    end
    object cdsNFRetCOD_EMPRESA: TIntegerField
      DisplayLabel = 'Unificada'
      FieldName = 'COD_EMPRESA'
    end
  end
  object dsNFRet: TDataSource
    AutoEdit = False
    DataSet = cdsNFRet
    Left = 29
    Top = 456
  end
  object qrEmpresasUnificadas: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = dtmAtivo.IbTransCol
    SQL.Strings = (
      
        'select emp.cod_empresa, (emp.identificacao_emp ||'#39' - '#39'|| emp.cnp' +
        'j_emp) identificacao_emp from empresa emp'
      'where emp.cod_empresa in (1)')
    Left = 1061
    Top = 64
  end
  object dspEmpresasUnificadas: TDataSetProvider
    DataSet = qrEmpresasUnificadas
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1061
    Top = 120
  end
  object cdsEmpresasUnificadas: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspEmpresasUnificadas'
    BeforeOpen = cdsCtrlChBeforeOpen
    Left = 1061
    Top = 168
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
    Left = 1061
    Top = 224
  end
  object qrCtrlCr3: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select controle_creditos.*, '#39' '#39' n_doc_c_temp, '#39' '#39' n_doc_v_temp,'
      
        'empresa.identificacao_emp, clientes.nome_cliente, clientes.razao' +
        ' razao_cliente, cidades.nome_cidade, tipo_faturamento.status_f f' +
        'rom controle_creditos '
      
        'left join empresa on empresa.cod_empresa = controle_creditos.cod' +
        '_emp_mult '
      
        'left join clientes on clientes.cod_cliente = controle_creditos.c' +
        'od_cliente and clientes.cod_empresa = controle_creditos.cod_emp_' +
        'mult '
      
        'left join recibos on recibos.nrecibo = controle_creditos.n_doc_v' +
        ' and recibos.cod_empresa = controle_creditos.codigo_emp and cont' +
        'role_creditos.tp_doc_v = '#39'REC'#39' '
      'left join cidades on cidades.cod_cidade = clientes.cod_cidade '
      
        'left join tipo_faturamento on tipo_faturamento.codigo_faturament' +
        'o = clientes.codigo_faturamento '
      
        'where controle_creditos.codigo_emp =  0 and controle_creditos.co' +
        'd_cred =  0')
    Left = 176
    Top = 312
  end
  object dspCtrlCr3: TDataSetProvider
    DataSet = qrCtrlCr3
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 176
    Top = 408
  end
  object dsCtrlCr3: TDataSource
    DataSet = qrCtrlCr3
    Left = 176
    Top = 456
  end
  object qrCtrlCh3: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      
        'select controle_cheque.*, '#39' '#39' n_doc_v_temp, empresa.identificaca' +
        'o_emp from controle_cheque'
      
        'left join empresa on empresa.cod_empresa = controle_cheque.cod_e' +
        'mp_mult'
      
        'left join recibos on recibos.nrecibo = controle_cheque.n_doc_v a' +
        'nd recibos.cod_empresa = controle_cheque.codigo_emp and controle' +
        '_cheque.tp_doc_v = '#39'REC'#39
      
        'where controle_cheque.codigo_emp = 0 and controle_cheque.codigo_' +
        'ch = 0')
    Left = 112
    Top = 312
  end
  object dspCtrlCh3: TDataSetProvider
    DataSet = qrCtrlCh3
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 112
    Top = 408
  end
  object dsCtrlCh3: TDataSource
    DataSet = cdsCtrlCh3
    Left = 112
    Top = 456
  end
  object qrRec3: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      
        'select * from recibos where ((recant = '#39'S'#39') or (recant = '#39'O'#39')) a' +
        'nd ((status_rec is null) or (status_rec = '#39#39')) and COD_EMPRESA =' +
        ' 0 and ATIVO = 1')
    Left = 237
    Top = 312
  end
  object dspRec3: TDataSetProvider
    DataSet = qrRec3
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 237
    Top = 408
  end
  object dsRec3: TDataSource
    AutoEdit = False
    DataSet = cdsRec3
    Left = 237
    Top = 456
  end
  object cdsCtrlCr3: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspCtrlCr3'
    BeforeOpen = cdsCtrlChBeforeOpen
    Left = 173
    Top = 360
    object StringField23: TStringField
      Tag = 2
      DisplayLabel = 'Sel'
      FieldKind = fkInternalCalc
      FieldName = 'SEL'
      Size = 1
    end
    object StringField24: TStringField
      DisplayLabel = 'Tipo Documento'
      FieldName = 'TIPO_DOC_C'
      FixedChar = True
      Size = 15
    end
    object StringField25: TStringField
      DisplayLabel = 'Nome Cliente'
      FieldName = 'NOME_C'
      Size = 35
    end
    object StringField26: TStringField
      DisplayLabel = 'Num Documento'
      FieldName = 'N_DOC_C'
      OnGetText = cdsCtrlCrN_DOC_CGetText
    end
    object StringField27: TStringField
      DisplayLabel = 'Num Doc'
      FieldName = 'N_DOC_C_TEMP'
      FixedChar = True
    end
    object DateTimeField4: TDateTimeField
      Tag = 2
      DisplayLabel = 'Data Vencimento'
      FieldName = 'DATA_VENC_C'
      EditMask = '!99/99/0000;1;_'
    end
    object FloatField4: TFloatField
      Tag = 2
      DisplayLabel = 'Valor Credito'
      FieldName = 'VALOR_C'
      DisplayFormat = '##0.00'
    end
    object FloatField5: TFloatField
      DisplayLabel = 'Valor Corrigido'
      FieldName = 'VALOR_CORR'
      DisplayFormat = '##0.00'
    end
    object FloatField6: TFloatField
      DisplayLabel = 'Valor Desconto'
      FieldName = 'VALOR_DESC'
      DisplayFormat = '##0.00'
    end
    object cdsCtrlCr3VALOR_ACRESC: TFloatField
      DisplayLabel = 'Valor Acrescimo'
      FieldName = 'VALOR_ACRESC'
      DisplayFormat = '##0.00'
    end
    object FloatField7: TFloatField
      DisplayLabel = 'Valor Original'
      FieldName = 'VALOR_ORIGINAL'
      DisplayFormat = '##0.00'
    end
    object FloatField8: TFloatField
      DisplayLabel = 'Valor L'#237'quido'
      FieldName = 'VALOR_LIQUIDO'
      DisplayFormat = '##0.00'
    end
    object StringField28: TStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS_C'
      FixedChar = True
      Size = 10
    end
    object IntegerField11: TIntegerField
      Tag = 2
      DisplayLabel = 'Codigo'
      FieldName = 'COD_CRED'
      Required = True
    end
    object StringField29: TStringField
      DisplayLabel = 'Historico'
      FieldName = 'HISTORICO_C'
      Size = 100
    end
    object FloatField9: TFloatField
      DisplayLabel = 'Num da Conta'
      FieldName = 'N_CONTA_PLC'
    end
    object IntegerField12: TIntegerField
      DisplayLabel = 'Codigo Controle'
      FieldName = 'CODIGO_CTRL'
      Required = True
    end
    object StringField30: TStringField
      DisplayLabel = 'Razao Social Cliente'
      FieldName = 'RAZAO'
      Size = 60
    end
    object IntegerField13: TIntegerField
      DisplayLabel = 'Codigo Cliente'
      FieldName = 'COD_CLIENTE'
    end
    object DateTimeField5: TDateTimeField
      DisplayLabel = 'Data Cadastro'
      FieldName = 'DATA_REC_C'
      EditMask = '!99/99/0000;1;_'
    end
    object DateTimeField6: TDateTimeField
      DisplayLabel = 'Data Quita'#231#227'o'
      FieldName = 'DATQ_C'
      EditMask = '!99/99/0000;1;_'
    end
    object StringField31: TStringField
      DisplayLabel = 'Natureza(C/N)'
      FieldName = 'NATL_C'
      FixedChar = True
      Size = 1
    end
    object StringField32: TStringField
      DisplayLabel = 'Tipo Doc Venda'
      FieldName = 'TP_DOC_V'
      FixedChar = True
      Size = 6
    end
    object IntegerField14: TIntegerField
      DisplayLabel = 'Num Doc Venda'
      FieldName = 'N_DOC_V'
    end
    object StringField33: TStringField
      DisplayLabel = 'Num Doc Vnd'
      FieldName = 'N_DOC_V_TEMP'
      FixedChar = True
      Size = 1
    end
    object FloatField10: TFloatField
      DisplayLabel = 'Valor Juros Cobrado'
      FieldName = 'JUROS_COB'
      DisplayFormat = '##0.00'
    end
    object FloatField11: TFloatField
      DisplayLabel = 'Valor Taxa Cobran'#231'a'
      FieldName = 'TAXA_COBRANCA'
      DisplayFormat = '##0.00'
    end
    object StringField34: TStringField
      DisplayLabel = 'Nosso Numero Boleto'
      FieldName = 'NOSSO_NUMERO_BANCO'
    end
    object MemoField1: TMemoField
      DisplayLabel = 'Informa'#231#227'o Banc'#225'ria'
      FieldName = 'OCORRENCIABANCARIA'
      OnGetText = cdsCtrlCrOCORRENCIABANCARIAGetText
      BlobType = ftMemo
      Size = 8
    end
    object IntegerField15: TIntegerField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
    end
    object IntegerField16: TIntegerField
      DisplayLabel = 'Lote Baixa'
      FieldName = 'LOTE_QUIT'
    end
    object IntegerField17: TIntegerField
      DisplayLabel = 'Lote Cadastro'
      FieldName = 'LOTE_ENT'
    end
    object IntegerField18: TIntegerField
      DisplayLabel = 'Lote CXL'
      FieldName = 'LOTE_CXL'
    end
    object StringField35: TStringField
      DisplayLabel = 'Tipo Cadastro(C/N)'
      FieldName = 'TIP_CNT'
      FixedChar = True
      Size = 1
    end
    object IntegerField19: TIntegerField
      DisplayLabel = 'Lote Negativa'#231#227'o'
      FieldName = 'LOTE_NEG'
    end
    object IntegerField20: TIntegerField
      DisplayLabel = 'Codigo Cliente Terceiro'
      FieldName = 'COD_CLI_TERC'
    end
    object StringField36: TStringField
      DisplayLabel = 'Nome Terceiro'
      FieldName = 'NOME_TERC'
      Size = 35
    end
    object DateTimeField7: TDateTimeField
      DisplayLabel = 'Data Caixa Auxiliar'
      FieldName = 'DATA_CXL'
      EditMask = '!99/99/0000;1;_'
    end
    object IntegerField21: TIntegerField
      DisplayLabel = 'Codigo Vendedor'
      FieldName = 'CODIGO_VEND'
    end
    object IntegerField22: TIntegerField
      DisplayLabel = 'Num Duplicata'
      FieldName = 'N_DUPL_C'
    end
    object DateTimeField8: TDateTimeField
      DisplayLabel = 'Data Remessa'
      FieldName = 'DATA_REM_REC'
      EditMask = '!99/99/0000;1;_'
    end
    object IntegerField23: TIntegerField
      DisplayLabel = 'Codigo Terminal'
      FieldName = 'COD_TERM'
    end
    object DateTimeField9: TDateTimeField
      DisplayLabel = 'Data Real da Baixa'
      FieldName = 'DATA_BAIXA'
      EditMask = '!99/99/0000;1;_'
    end
    object DateTimeField10: TDateTimeField
      DisplayLabel = 'Data Venda'
      FieldName = 'DATA_VENDA'
      EditMask = '!99/99/0000;1;_'
    end
    object IntegerField24: TIntegerField
      DisplayLabel = 'Codigo Func'
      FieldName = 'CODIGO_FUNC'
    end
    object DateTimeField11: TDateTimeField
      DisplayLabel = 'Dia CXL'
      FieldName = 'DIA_CXL'
      EditMask = '!99/99/0000;1;_'
    end
    object StringField37: TStringField
      DisplayLabel = 'Status Recebimento CXL'
      FieldName = 'STATUS_CXL_RQ'
      FixedChar = True
      Size = 1
    end
    object FloatField12: TFloatField
      DisplayLabel = 'Valor Recebido Cxl'
      FieldName = 'VL_RQ_PG_CXL'
      DisplayFormat = '##0.00'
    end
    object IntegerField25: TIntegerField
      DisplayLabel = 'Operador CXL'
      FieldName = 'OP_CXL'
    end
    object StringField38: TStringField
      DisplayLabel = 'Tipo Recebimento CXL'
      FieldName = 'TP_REC_CXL'
      FixedChar = True
      Size = 1
    end
    object StringField39: TStringField
      DisplayLabel = 'CPF/CNPJ'
      FieldName = 'CPFCGC'
      FixedChar = True
      Size = 18
    end
    object StringField40: TStringField
      DisplayLabel = 'Processamento'
      FieldName = 'PRCSS'
      FixedChar = True
      Size = 1
    end
    object IntegerField26: TIntegerField
      DisplayLabel = 'Codigo Item Carta'
      FieldName = 'COD_IT_CARTAS'
    end
    object DateTimeField12: TDateTimeField
      DisplayLabel = 'Data Envio Carta'
      FieldName = 'DT_REG_CARTAS'
      EditMask = '!99/99/0000;1;_'
    end
    object IntegerField27: TIntegerField
      DisplayLabel = 'Num Seq Bol'
      FieldName = 'N_SEQ_BOL'
    end
    object IntegerField28: TIntegerField
      DisplayLabel = 'Codigo Carta Cobran'#231'a'
      FieldName = 'COD_CARTA'
    end
    object IntegerField29: TIntegerField
      DisplayLabel = 'Codigo Faturamento'
      FieldName = 'COD_FATURAMENTO'
    end
    object DateTimeField13: TDateTimeField
      DisplayLabel = 'Data Lote Negativa'#231#227'o'
      FieldName = 'DATA_LOTE_NEG'
      EditMask = '!99/99/0000;1;_'
    end
    object IntegerField30: TIntegerField
      DisplayLabel = 'Num Nf'
      FieldName = 'NUM_NOTA'
    end
    object IntegerField31: TIntegerField
      DisplayLabel = 'Num REQ'
      FieldName = 'NREQ'
    end
    object IntegerField32: TIntegerField
      DisplayLabel = 'Num OS'
      FieldName = 'N_OS'
    end
    object IntegerField33: TIntegerField
      DisplayLabel = 'Num Comando'
      FieldName = 'NCOMANDO'
    end
    object IntegerField34: TIntegerField
      DisplayLabel = 'Num GRP'
      FieldName = 'NGRP'
    end
    object StringField42: TStringField
      DisplayLabel = 'Codigo Usuario Cancelou'
      FieldName = 'US_CANCELOU'
      Size = 10
    end
    object DateTimeField14: TDateTimeField
      DisplayLabel = 'Data que o Usuario Cancelou'
      FieldName = 'DT_US_CANCELOU'
      EditMask = '!99/99/0000;1;_'
    end
    object StringField43: TStringField
      DisplayLabel = 'Observa'#231#227'o'
      FieldName = 'OBS_C'
      Size = 60
    end
    object StringField44: TStringField
      DisplayLabel = 'Observa'#231#227'o para Cr'#233'dito'
      FieldName = 'OBS_PARACREDITO'
      Size = 50
    end
    object DateTimeField15: TDateTimeField
      DisplayLabel = 'Data Original do Cr'#233'dito'
      FieldName = 'DTORIGINAL_C'
      EditMask = '!99/99/0000;1;_'
    end
    object StringField45: TStringField
      DisplayLabel = 'Nome Dependente'
      FieldName = 'DEPENDENTE'
      Size = 35
    end
    object IntegerField35: TIntegerField
      DisplayLabel = 'Codigo Caixa ECF'
      FieldName = 'COD_TERMINAL'
    end
    object IntegerField36: TIntegerField
      DisplayLabel = 'COO N'#227'o Fiscal'
      FieldName = 'COONAOFISCAL'
    end
    object StringField46: TStringField
      DisplayLabel = 'Num Serie ECF'
      FieldName = 'NSERIEECF'
    end
    object IntegerField37: TIntegerField
      Tag = 1
      DisplayLabel = 'Codigo Empresa'
      FieldName = 'CODIGO_EMP'
      Required = True
    end
    object StringField47: TStringField
      Tag = 1
      DisplayLabel = 'S'
      FieldName = 'SELEC'
      FixedChar = True
      Size = 1
    end
    object StringField48: TStringField
      Tag = 1
      DisplayLabel = 'Controle'
      FieldKind = fkLookup
      FieldName = 'NOME_CTRL'
      LookupDataSet = cdsCtrl
      LookupKeyFields = 'CODIGO_CTRL'
      LookupResultField = 'NOME_CTRL'
      KeyFields = 'CODIGO_CTRL'
      Visible = False
      Size = 35
      Lookup = True
    end
    object StringField49: TStringField
      DisplayLabel = 'Recebendo'
      FieldName = 'STATUS_CX'
      Size = 1
    end
    object IntegerField38: TIntegerField
      DisplayLabel = 'Operador Recebendo'
      FieldName = 'OP_CX'
    end
    object StringField50: TStringField
      DisplayLabel = 'Tipo Baixa'
      FieldName = 'TIP_BAIXA'
      FixedChar = True
      Size = 1
    end
    object IntegerField39: TIntegerField
      DisplayLabel = 'Numero do Carne'
      FieldName = 'IDCARNE'
    end
    object IntegerField40: TIntegerField
      Tag = 1
      FieldName = 'COD_OBS'
    end
    object FloatField13: TFloatField
      DisplayLabel = 'Valor Comiss'#227'o'
      FieldName = 'VL_BAIXA_COMISSAO'
      DisplayFormat = '#0.000'
    end
    object FloatField14: TFloatField
      DisplayLabel = 'Valor Comiss'#227'o Gerente'
      FieldName = 'VL_BAIXA_COMISSAO_GER'
      DisplayFormat = '#0.000'
    end
    object IntegerField41: TIntegerField
      DisplayLabel = 'Num Parcela'
      FieldName = 'NPARCELA'
    end
    object StringField51: TStringField
      DisplayLabel = 'Num Doc/NSU/CV'
      FieldName = 'N_DOCNSU_ADM'
      Size = 10
    end
    object StringField41: TStringField
      DisplayLabel = 'Num Aut Cartao'
      FieldName = 'N_AUT_CART'
      FixedChar = True
    end
    object IntegerField42: TIntegerField
      DisplayLabel = 'Status Adm'
      FieldName = 'STATUS_ADM'
    end
    object StringField52: TStringField
      DisplayLabel = 'Descri'#231#227'o Status Adm'
      FieldName = 'DESC_STATUS_ADM'
      Size = 50
    end
    object StringField53: TStringField
      DisplayLabel = 'NSU RO Adm'
      FieldName = 'NSU_RO_ADM'
      Size = 15
    end
    object IntegerField43: TIntegerField
      DisplayLabel = 'Num RO Adm'
      FieldName = 'RO_ADM'
    end
    object StringField54: TStringField
      DisplayLabel = 'Cod. Terminal Adm'
      FieldName = 'COD_TERMINAL_ADM'
      Size = 10
    end
    object cdsCtrlCr3DESC_TERMINAL_ADM: TStringField
      DisplayLabel = 'Descri'#231#227'o Terminal Adm'
      FieldName = 'DESC_TERMINAL_ADM'
      Size = 30
    end
    object IntegerField49: TIntegerField
      DisplayLabel = 'Cod. Adm Cartao'
      FieldName = 'COD_ADM'
    end
    object cdsCtrlCr3DESC_ADM: TStringField
      DisplayLabel = 'Descri'#231#227'o Adm Cartao'
      FieldName = 'DESC_ADM'
      Size = 30
    end
    object IntegerField45: TIntegerField
      DisplayLabel = 'Cod. Bandeira'
      FieldName = 'COD_BANDEIRA_ADM'
    end
    object StringField56: TStringField
      DisplayLabel = 'Descri'#231#227'o Bandeira'
      FieldName = 'DESC_BANDEIRA'
      Size = 50
    end
    object IntegerField44: TIntegerField
      DisplayLabel = 'Tipo Produto Adm'
      FieldName = 'TIPO_PROD_ADM'
    end
    object StringField55: TStringField
      DisplayLabel = 'Descri'#231#227'o Produto Adm'
      FieldName = 'DESC_TIPO_PROD_ADM'
      Size = 50
    end
    object StringField57: TStringField
      DisplayLabel = 'Indicador Antecipa'#231#227'o Adm'
      FieldName = 'IND_ANTEC_RO_ADM'
      Size = 50
    end
    object IntegerField46: TIntegerField
      DisplayLabel = 'Indicador Origem Ajuste Adm'
      FieldName = 'IND_OR_AJUSTE_ADM'
    end
    object StringField58: TStringField
      DisplayLabel = 'Descri'#231#227'o Origem Ajuste Adm'
      FieldName = 'IND_OR_DESC_AJUSTE'
      Size = 50
    end
    object FloatField15: TFloatField
      DisplayLabel = 'Comiss'#227'o Cart'#227'o Adm'
      FieldName = 'TAXA_CARTAO_CRED'
    end
    object FloatField16: TFloatField
      DisplayLabel = 'Tarifa Adm'
      FieldName = 'TARIFA_CARTAO_CRED'
    end
    object IntegerField47: TIntegerField
      DisplayLabel = 'Lote Baixa Adm'
      FieldName = 'IDBAIXA_CARTAO'
    end
    object cdsCtrlCr3IDDEV_CARTAO: TIntegerField
      DisplayLabel = 'Lote Dev Adm'
      FieldName = 'IDDEV_CARTAO'
    end
    object IntegerField48: TIntegerField
      DisplayLabel = 'Controle p/ Cr'#233'd Baixa Adm'
      FieldName = 'CODIGO_CTRL_CRED'
    end
    object IntegerField50: TIntegerField
      DisplayLabel = 'Usuario que cadastrou'
      FieldName = 'US_CAD'
    end
    object StringField60: TStringField
      Tag = 1
      DisplayLabel = 'Z..'
      FieldName = 'NOME_CLIENTE'
      Size = 35
    end
    object StringField61: TStringField
      Tag = 1
      DisplayLabel = 'Z..'
      FieldName = 'RAZAO_CLIENTE'
      Size = 60
    end
    object StringField62: TStringField
      DisplayLabel = 'Cidade Cliente'
      FieldName = 'NOME_CIDADE'
      Size = 30
    end
    object DateTimeField16: TDateTimeField
      Tag = 1
      DisplayLabel = 'Data Prev Rec'
      FieldName = 'DATA_PREV_REC'
    end
    object IntegerField51: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod CB'
      FieldName = 'COD_COBREBEM'
    end
    object DateTimeField17: TDateTimeField
      Tag = 1
      DisplayLabel = 'Data Retorno'
      FieldName = 'DATA_RETORNO_QUITACAO'
    end
    object DateTimeField18: TDateTimeField
      Tag = 1
      DisplayLabel = 'Data Baixa Comissao'
      FieldName = 'DT_BAIXA_COMISSAO'
    end
    object StringField63: TStringField
      DisplayLabel = 'Status Faturamento'
      FieldName = 'STATUS_F'
      Size = 10
    end
    object DateTimeField19: TDateTimeField
      DisplayLabel = 'Data desnegativa'#231#227'o'
      FieldName = 'DATA_DESBARRAMENTO'
    end
    object IntegerField52: TIntegerField
      DisplayLabel = 'Qtde Parcelas Cartao'
      FieldName = 'QTDE_PARC'
    end
    object FloatField17: TFloatField
      DisplayLabel = 'Valor Venda Cartao'
      FieldName = 'VL_VENDA'
      DisplayFormat = '##0.00'
    end
    object IntegerField53: TIntegerField
      DisplayLabel = 'Cod Unificada'
      FieldName = 'COD_EMP_MULT'
    end
    object StringField64: TStringField
      DisplayLabel = 'Unificada'
      FieldName = 'IDENTIFICACAO_EMP'
      Size = 64
    end
    object IntegerField54: TIntegerField
      DisplayLabel = 'Usuario que Baixou'
      FieldName = 'US_BX'
    end
    object FloatField18: TFloatField
      DisplayLabel = 'Valor Cont'#225'bil'
      FieldName = 'VL_CONTABIL'
      DisplayFormat = '##0.00'
    end
    object IntegerField55: TIntegerField
      DisplayLabel = 'Lote Contrapartida Lanc'
      FieldName = 'COD_CONTRAPARTIDA'
    end
    object cdsCtrlCr3COD_CONTRAPARTIDA_CTP: TIntegerField
      DisplayLabel = 'Lote Contrapartida Ctp'
      FieldName = 'COD_CONTRAPARTIDA_CTP'
    end
    object cdsCtrlCr3COD_EMP_LOTE: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Emp Lote'
      FieldName = 'COD_EMP_LOTE'
    end
    object cdsCtrlCr3ID_FINANC_CONFERE: TIntegerField
      DisplayLabel = 'Id Financ Confere'
      FieldName = 'ID_FINANC_CONFERE'
    end
    object StringField59: TStringField
      DisplayLabel = 'Arq Extrato Adm'
      FieldName = 'ARQ_EXTRATO_ADM'
      Size = 255
    end
    object cdsCtrlCr3DATA_ARQUIVO: TDateTimeField
      DisplayLabel = 'Data Extrato Adm'
      FieldName = 'DATA_ARQUIVO'
    end
    object cdsCtrlCr3DATA_DESM: TDateTimeField
      DisplayLabel = 'Data Desmarcado'
      FieldName = 'DATA_DESM'
    end
    object cdsCtrlCr3OP_DESM: TIntegerField
      DisplayLabel = 'Operador Desmarcou'
      FieldName = 'OP_DESM'
    end
  end
  object cdsCtrlCh3: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspCtrlCh3'
    BeforeOpen = cdsCtrlChBeforeOpen
    Left = 109
    Top = 360
    object StringField65: TStringField
      Tag = 2
      DisplayLabel = 'Sel'
      FieldKind = fkInternalCalc
      FieldName = 'SEL'
      Size = 1
    end
    object StringField66: TStringField
      DisplayLabel = 'Nome Cliente'
      FieldName = 'NOME_CH'
      Size = 35
    end
    object StringField67: TStringField
      DisplayLabel = 'Num Cheque'
      FieldName = 'N_CH'
      FixedChar = True
    end
    object DateTimeField20: TDateTimeField
      Tag = 2
      DisplayLabel = 'Data Vencimento'
      FieldName = 'DATA_VENC'
      EditMask = '!99/99/0000;1;_'
    end
    object FloatField19: TFloatField
      Tag = 2
      DisplayLabel = 'Valor Cheque'
      FieldName = 'VALOR_CH'
      DisplayFormat = '##0.00'
    end
    object FloatField20: TFloatField
      DisplayLabel = 'Valor Corrigido'
      FieldName = 'VALOR_CORR'
      DisplayFormat = '##0.00'
    end
    object FloatField21: TFloatField
      DisplayLabel = 'Valor Desconto'
      FieldName = 'VALOR_DESC'
      DisplayFormat = '##0.00'
    end
    object cdsCtrlCh3VALOR_ACRESC: TFloatField
      DisplayLabel = 'Valor Acrescimo'
      FieldName = 'VALOR_ACRESC'
      DisplayFormat = '##0.00'
    end
    object IntegerField56: TIntegerField
      Tag = 2
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO_CH'
      Required = True
    end
    object StringField68: TStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS_CH'
      FixedChar = True
      Size = 10
    end
    object FloatField22: TFloatField
      DisplayLabel = 'Num da Conta'
      FieldName = 'N_CONTA_PLC'
    end
    object IntegerField57: TIntegerField
      DisplayLabel = 'Codigo Controle'
      FieldName = 'CODIGO_CTRL'
      Required = True
    end
    object StringField69: TStringField
      DisplayLabel = 'Razao Social Cliente'
      FieldName = 'RAZAO'
      Size = 60
    end
    object IntegerField58: TIntegerField
      DisplayLabel = 'Codigo Cliente'
      FieldName = 'COD_CLIENTE'
    end
    object DateTimeField21: TDateTimeField
      DisplayLabel = 'Data Cadastro'
      FieldName = 'DATA_REC'
      EditMask = '!99/99/0000;1;_'
    end
    object StringField70: TStringField
      DisplayLabel = 'Historico'
      FieldName = 'HISTORICO_CH'
      Size = 100
    end
    object DateTimeField22: TDateTimeField
      DisplayLabel = 'Data Quita'#231#227'o'
      FieldName = 'DATQ_CH'
      EditMask = '!99/99/0000;1;_'
    end
    object StringField71: TStringField
      DisplayLabel = 'Natureza(C/N)'
      FieldName = 'NATL_CH'
      FixedChar = True
      Size = 1
    end
    object StringField72: TStringField
      DisplayLabel = 'Codigo CI'
      FieldName = 'COD_CLI'
      Size = 60
    end
    object StringField73: TStringField
      DisplayLabel = 'Observa'#231#227'o'
      FieldName = 'OBS_CH'
      Size = 60
    end
    object IntegerField59: TIntegerField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
    end
    object StringField74: TStringField
      DisplayLabel = 'Tipo Doc Venda'
      FieldName = 'TP_DOC_V'
      FixedChar = True
      Size = 6
    end
    object IntegerField60: TIntegerField
      DisplayLabel = 'Num Doc Venda'
      FieldName = 'N_DOC_V'
    end
    object StringField75: TStringField
      DisplayLabel = 'Num Doc Vnd'
      FieldName = 'N_DOC_V_TEMP'
      FixedChar = True
    end
    object cdsCtrlCh3DATA_BAIXA: TDateTimeField
      DisplayLabel = 'Data Real da Baixa'
      FieldName = 'DATA_BAIXA'
      EditMask = '!99/99/0000;1;_'
    end
    object DateTimeField23: TDateTimeField
      DisplayLabel = 'Data Venda'
      FieldName = 'DATA_VENDA'
      EditMask = '!99/99/0000;1;_'
    end
    object StringField76: TStringField
      DisplayLabel = 'Agencia'
      FieldName = 'AGENCIA'
      Size = 10
    end
    object StringField77: TStringField
      DisplayLabel = 'Conta'
      FieldName = 'CONTA'
      Size = 15
    end
    object StringField78: TStringField
      DisplayLabel = 'Banco'
      FieldName = 'BANCO'
      Size = 35
    end
    object IntegerField61: TIntegerField
      DisplayLabel = 'Codigo Cliente Terceiro'
      FieldName = 'COD_CLI_TERC'
    end
    object StringField79: TStringField
      DisplayLabel = 'Nome Terceiro'
      FieldName = 'NOME_TERC'
      Size = 35
    end
    object StringField80: TStringField
      DisplayLabel = 'Tipo Cadastro(C/N)'
      FieldName = 'TIP_CNT'
      FixedChar = True
      Size = 1
    end
    object DateTimeField24: TDateTimeField
      DisplayLabel = 'Data Caixa Auxiliar'
      FieldName = 'DATA_CXL'
      EditMask = '!99/99/0000;1;_'
    end
    object IntegerField62: TIntegerField
      DisplayLabel = 'Codigo Vendedor'
      FieldName = 'CODIGO_VEND'
    end
    object DateTimeField25: TDateTimeField
      DisplayLabel = 'Data Remessa'
      FieldName = 'DATA_REM_REC'
      EditMask = '!99/99/0000;1;_'
    end
    object IntegerField63: TIntegerField
      DisplayLabel = 'Codigo Terminal'
      FieldName = 'COD_TERM'
    end
    object IntegerField64: TIntegerField
      DisplayLabel = 'Lote Baixa'
      FieldName = 'LOTE_QUIT'
    end
    object IntegerField65: TIntegerField
      DisplayLabel = 'Lote Cadastro'
      FieldName = 'LOTE_ENT'
    end
    object StringField81: TStringField
      DisplayLabel = 'CPF/CNPJ'
      FieldName = 'CPFCGC'
      FixedChar = True
      Size = 18
    end
    object DateTimeField26: TDateTimeField
      DisplayLabel = 'Data Baixa Comiss'#227'o'
      FieldName = 'DT_BAIXA_COMISSAO'
      EditMask = '!99/99/0000;1;_'
    end
    object FloatField23: TFloatField
      DisplayLabel = 'Valor Baixa Comiss'#227'o'
      FieldName = 'VL_BAIXA_COMISSAO'
      DisplayFormat = '##0.00'
    end
    object DateTimeField27: TDateTimeField
      DisplayLabel = 'Data Original Cheque'
      FieldName = 'DTORIGINAL_CH'
    end
    object StringField82: TStringField
      DisplayLabel = 'Num Banco'
      FieldName = 'ID_BANCO'
      Size = 11
    end
    object IntegerField66: TIntegerField
      Tag = 1
      DisplayLabel = 'Codigo Empresa'
      FieldName = 'CODIGO_EMP'
      Required = True
    end
    object StringField83: TStringField
      Tag = 1
      DisplayLabel = 'S'
      FieldName = 'SELEC'
      FixedChar = True
      Size = 1
    end
    object IntegerField67: TIntegerField
      DisplayLabel = 'Op Fin'
      FieldName = 'OP_CXL'
    end
    object StringField84: TStringField
      DisplayLabel = 'Status Rec Cxl'
      FieldName = 'STATUS_CXL_RQ'
      FixedChar = True
      Size = 1
    end
    object StringField85: TStringField
      DisplayLabel = 'Recebendo'
      FieldName = 'STATUS_CX'
      Size = 1
    end
    object IntegerField68: TIntegerField
      DisplayLabel = 'Operador Recebendo'
      FieldName = 'OP_CX'
    end
    object StringField86: TStringField
      DisplayLabel = 'Tipo Baixa'
      FieldName = 'TIP_BAIXA'
      FixedChar = True
      Size = 1
    end
    object FloatField24: TFloatField
      DisplayLabel = 'Valor Baixa Comiss'#227'o Gerente'
      FieldName = 'VL_BAIXA_COMISSAO_GER'
      DisplayFormat = '#0.000'
    end
    object IntegerField69: TIntegerField
      DisplayLabel = 'Usuario que cadastrou'
      FieldName = 'US_CAD'
    end
    object IntegerField70: TIntegerField
      DisplayLabel = 'Cod Unificada'
      FieldName = 'COD_EMP_MULT'
    end
    object StringField87: TStringField
      DisplayLabel = 'Unificada'
      FieldName = 'IDENTIFICACAO_EMP'
      Size = 64
    end
    object IntegerField71: TIntegerField
      DisplayLabel = 'Usuario que Baixou'
      FieldName = 'US_BX'
    end
    object FloatField25: TFloatField
      DisplayLabel = 'Valor Cont'#225'bil'
      FieldName = 'VL_CONTABIL'
      DisplayFormat = '##0.00'
    end
    object IntegerField72: TIntegerField
      DisplayLabel = 'Lote Contrapartida Lanc'
      FieldName = 'COD_CONTRAPARTIDA'
    end
    object cdsCtrlCh3COD_CONTRAPARTIDA_CTP: TIntegerField
      DisplayLabel = 'Lote Contrapartida Ctp'
      FieldName = 'COD_CONTRAPARTIDA_CTP'
    end
    object cdsCtrlCh3COD_EMP_LOTE: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Emp Lote'
      FieldName = 'COD_EMP_LOTE'
    end
    object cdsCtrlCh3ARQ_EXTRATO_ADM: TStringField
      DisplayLabel = 'Arq Extrato Adm'
      FieldName = 'ARQ_EXTRATO_ADM'
      Size = 255
    end
    object cdsCtrlCh3DATA_ARQUIVO: TDateTimeField
      DisplayLabel = 'Data Extrato Adm'
      FieldName = 'DATA_ARQUIVO'
    end
    object cdsCtrlCh3DATA_PREV_REC: TDateTimeField
      DisplayLabel = 'Data Prev Rec'
      FieldName = 'DATA_PREV_REC'
    end
    object cdsCtrlCh3DATA_DESM: TDateTimeField
      DisplayLabel = 'Data Desmarcado'
      FieldName = 'DATA_DESM'
    end
    object cdsCtrlCh3OP_DESM: TIntegerField
      DisplayLabel = 'Operador Desmarcou'
      FieldName = 'OP_DESM'
    end
  end
  object cdsRec3: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRec3'
    BeforeOpen = cdsCtrlChBeforeOpen
    Left = 237
    Top = 359
    object StringField1: TStringField
      DisplayLabel = 'Sel'
      FieldName = 'SELEC'
      FixedChar = True
      Size = 1
    end
    object DateTimeField1: TDateTimeField
      DisplayLabel = 'Data Recibo'
      FieldName = 'DATA_REC'
    end
    object IntegerField1: TIntegerField
      DisplayLabel = 'N'#186' Recibo'
      FieldName = 'NRECIBO'
      Required = True
    end
    object StringField2: TStringField
      DisplayLabel = 'N'#176' Rec Dep'
      FieldName = 'NUM_REC_DEP'
      Size = 11
    end
    object FloatField1: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VALOR'
      DisplayFormat = '##0.00'
    end
    object FloatField2: TFloatField
      DisplayLabel = 'Valor a Utilizar'
      FieldKind = fkInternalCalc
      FieldName = 'VALOR_UT'
      DisplayFormat = '##0.00'
    end
    object StringField3: TStringField
      DisplayLabel = 'Pagante'
      FieldName = 'NOME_DEV'
      FixedChar = True
      Size = 50
    end
    object StringField4: TStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS_REC'
      FixedChar = True
      Size = 10
    end
    object StringField5: TStringField
      DisplayLabel = 'Linha 1'
      FieldName = 'REFERENCIA1'
      FixedChar = True
      Size = 66
    end
    object StringField6: TStringField
      DisplayLabel = 'Linha 2'
      FieldName = 'REFERENCIA2'
      FixedChar = True
      Size = 66
    end
    object StringField7: TStringField
      DisplayLabel = 'Linha 3'
      FieldName = 'REFERENCIA3'
      FixedChar = True
      Size = 66
    end
    object StringField8: TStringField
      DisplayLabel = 'Linha 4'
      FieldName = 'REFERENCIA4'
      FixedChar = True
      Size = 66
    end
    object IntegerField2: TIntegerField
      DisplayLabel = 'N'#186' Benefici'#225'rio'
      FieldName = 'COD_BENEF'
    end
    object StringField9: TStringField
      DisplayLabel = 'Benefici'#225'rio'
      FieldName = 'BENEF_CLIENT'
      FixedChar = True
      Size = 40
    end
    object IntegerField3: TIntegerField
      DisplayLabel = 'C'#243'd Pagante'
      FieldName = 'COD_DEVEDOR'
    end
    object StringField10: TStringField
      DisplayLabel = 'Local e Data'
      FieldName = 'LOCALDATA'
      FixedChar = True
      Size = 70
    end
    object StringField11: TStringField
      DisplayLabel = 'Recibo Antecipado'
      FieldName = 'RECANT'
      FixedChar = True
      Size = 1
    end
    object StringField12: TStringField
      DisplayLabel = 'Departamento'
      FieldName = 'DEPREC'
      FixedChar = True
      Size = 1
    end
    object IntegerField4: TIntegerField
      DisplayLabel = 'N'#186' Doc Venda'
      FieldName = 'NDOCANT'
    end
    object DateTimeField2: TDateTimeField
      DisplayLabel = 'Data Caixa Auxiliar'
      FieldName = 'DIA_CXL'
      EditMask = '!99/99/0000;1;_'
    end
    object IntegerField5: TIntegerField
      DisplayLabel = 'N'#186' Movimento Caixa Auxiliar'
      FieldName = 'N_MOV_CXL'
    end
    object StringField13: TStringField
      DisplayLabel = 'Obs Caixa Auxiliar'
      FieldName = 'OBS_CXL_RQ'
      FixedChar = True
      Size = 50
    end
    object StringField14: TStringField
      DisplayLabel = 'Status Caixa Auxiliar'
      FieldName = 'STATUS_CXL_RQ'
      FixedChar = True
      Size = 1
    end
    object FloatField3: TFloatField
      DisplayLabel = 'Valor Paga Caixa Auxiliar'
      FieldName = 'VL_RQ_PG_CXL'
      currency = True
    end
    object DateTimeField3: TDateTimeField
      DisplayLabel = 'Data Baixa'
      FieldName = 'DATA_BAIXA'
      EditMask = '!99/99/0000;1;_'
    end
    object StringField15: TStringField
      DisplayLabel = 'Hist'#243'rico'
      FieldName = 'HISTORICO_REC'
      FixedChar = True
      Size = 50
    end
    object IntegerField6: TIntegerField
      DisplayLabel = 'N'#186' Preposto'
      FieldName = 'COD_PREP'
    end
    object IntegerField7: TIntegerField
      DisplayLabel = 'N'#186' Operador'
      FieldName = 'OP_CXL'
    end
    object IntegerField8: TIntegerField
      DisplayLabel = 'N'#186' Usu'#225'rio'
      FieldName = 'COD_US'
    end
    object IntegerField9: TIntegerField
      DisplayLabel = 'Num NF'
      FieldName = 'NUM_NF'
    end
    object StringField16: TStringField
      DisplayLabel = 'S'#233'rie NF'
      FieldName = 'SERIE_NF'
      Size = 5
    end
    object IntegerField10: TIntegerField
      DisplayLabel = 'C'#243'digo Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object StringField17: TStringField
      DisplayLabel = 'Atraves 1'
      FieldName = 'ATRAVES1'
      Size = 66
    end
    object StringField18: TStringField
      DisplayLabel = 'Atraves 2'
      FieldName = 'ATRAVES2'
      Size = 66
    end
    object StringField19: TStringField
      DisplayLabel = 'Atraves 3'
      FieldName = 'ATRAVES3'
      Size = 66
    end
    object StringField20: TStringField
      DisplayLabel = 'Observacao 1'
      FieldName = 'OBSERVACAO1'
      Size = 66
    end
    object StringField21: TStringField
      DisplayLabel = 'Observacao 2'
      FieldName = 'OBSERVACAO2'
      Size = 66
    end
    object StringField22: TStringField
      DisplayLabel = 'Observacao 3'
      FieldName = 'OBSERVACAO3'
      Size = 66
    end
  end
  object qrBandeiraCartao: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = dtmAtivo.IbTransCol
    SQL.Strings = (
      'select * from bandeiras_cartao'
      'where cod_empresa = 1 and ativo = 1')
    Left = 1048
    Top = 296
  end
  object dspBandeiraCartao: TDataSetProvider
    DataSet = qrBandeiraCartao
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1048
    Top = 340
  end
  object cdsBandeiraCartao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspBandeiraCartao'
    BeforeOpen = cdsCtrlChBeforeOpen
    Left = 1048
    Top = 384
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
    AutoEdit = False
    DataSet = cdsBandeiraCartao
    Left = 1048
    Top = 431
  end
  object qrEnvNotFinanc: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select NOTIFICACAO_CREDITOS.*, CONTROLE_CREDITOS.N_DOC_C, '
      'CONTROLE_CREDITOS.DATA_REC_C,CONTROLE_CREDITOS.DATA_VENC_C,'
      
        'CONTROLE_CREDITOS.VALOR_C, CONTROLE_CREDITOS.VALOR_CORR, CONTROL' +
        'E_CREDITOS.STATUS_C,'
      'CONTROLE_CREDITOS.DATQ_C, CONTROLE_CREDITOS.TIPO_DOC_C,'
      
        'CONTROLE_CREDITOS.CODIGO_CTRL, CONTROLES.NOME_CTRL, CONTROLE_CRE' +
        'DITOS.NOSSO_NUMERO_BANCO,'
      'CONTROLE_CREDITOS.NPARCELA, CONTROLE_CREDITOS.QTDE_PARC, '
      'MSG_APLICATIVO.APLICATIVO, MSG_PLATAFORMA.PLATAFORMA,'
      'CLIENTES.NOME_CLIENTE, CLIENTES.RAZAO, CLIENTES.CPFCGC'
      'from NOTIFICACAO_CREDITOS'
      'INNER JOIN MSG_APLICATIVO ON '
      '    MSG_APLICATIVO.ID = NOTIFICACAO_CREDITOS.ID_MSG_APLICATIVO'
      'INNER JOIN MSG_PLATAFORMA ON'
      '   MSG_PLATAFORMA.ID = NOTIFICACAO_CREDITOS.ID_MSG_PLATAFORMA'
      
        '   AND MSG_PLATAFORMA.COD_EMPRESA = NOTIFICACAO_CREDITOS.COD_EMP' +
        'RESA'
      'INNER JOIN CONTROLE_CREDITOS ON'
      '    CONTROLE_CREDITOS.COD_CRED = NOTIFICACAO_CREDITOS.COD_CRED'
      
        '    AND CONTROLE_CREDITOS.CODIGO_EMP = NOTIFICACAO_CREDITOS.COD_' +
        'EMPRESA'
      
        '    AND CONTROLE_CREDITOS.COD_EMP_MULT = NOTIFICACAO_CREDITOS.CO' +
        'D_EMP_MULT'
      'INNER JOIN CLIENTES ON'
      '    CLIENTES.COD_CLIENTE = NOTIFICACAO_CREDITOS.COD_CLIENTE'
      '    AND CLIENTES.COD_EMPRESA = NOTIFICACAO_CREDITOS.COD_EMP_MULT'
      'INNER JOIN CONTROLES ON'
      '    CONTROLES.CODIGO_CTRL = CONTROLE_CREDITOS.CODIGO_CTRL'
      '    AND CONTROLES.CODIGO_EMP = CONTROLE_CREDITOS.CODIGO_EMP')
    Left = 333
    Top = 312
  end
  object dspEnvNotFinanc: TDataSetProvider
    DataSet = qrEnvNotFinanc
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 333
    Top = 408
  end
  object dsEnvNotFinanc: TDataSource
    AutoEdit = False
    DataSet = cdsEnvNotFinanc
    Left = 333
    Top = 456
  end
  object cdsEnvNotFinanc: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEnvNotFinanc'
    BeforeOpen = cdsCtrlChBeforeOpen
    Left = 333
    Top = 359
    object cdsEnvNotFinancCODIGO: TIntegerField
      Tag = 2
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO'
      Required = True
    end
    object cdsEnvNotFinancCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsEnvNotFinancCOD_EMP_MULT: TIntegerField
      DisplayLabel = 'Cod Unificada'
      FieldName = 'COD_EMP_MULT'
      Required = True
    end
    object cdsEnvNotFinancTIPO: TStringField
      Tag = 1
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Required = True
      FixedChar = True
      Size = 3
    end
    object cdsEnvNotFinancPLATAFORMA: TStringField
      DisplayLabel = 'Aplicativo'
      FieldName = 'APLICATIVO'
      Size = 50
    end
    object cdsEnvNotFinancPLATAFORMA2: TStringField
      DisplayLabel = 'Plataforma'
      FieldName = 'PLATAFORMA'
      Size = 50
    end
    object cdsEnvNotFinancEMAIL: TMemoField
      DisplayLabel = 'Identificacao'
      FieldName = 'EMAIL'
      OnGetText = cdsEnvNotFinancEMAILGetText
      BlobType = ftMemo
      Size = 8
    end
    object cdsEnvNotFinancTIPO_CONTRATO: TStringField
      DisplayLabel = 'Tipo Notif'
      FieldName = 'TIPO_CONTRATO'
      Required = True
      Size = 64
    end
    object cdsEnvNotFinancDATA: TDateTimeField
      DisplayLabel = 'Data/Hora'
      FieldName = 'DATA'
      Required = True
    end
    object cdsEnvNotFinancCOD_CRED: TIntegerField
      DisplayLabel = 'Cod Cred'
      FieldName = 'COD_CRED'
      Required = True
    end
    object cdsEnvNotFinancCOD_CLIENTE: TIntegerField
      DisplayLabel = 'Cod Cliente'
      FieldName = 'COD_CLIENTE'
      Required = True
    end
    object cdsEnvNotFinancASSUNTO: TStringField
      DisplayLabel = 'Assunto'
      FieldName = 'ASSUNTO'
      Size = 64
    end
    object cdsEnvNotFinancHTML: TMemoField
      Tag = 2
      DisplayLabel = 'Mensagem'
      FieldName = 'HTML'
      OnGetText = cdsEnvNotFinancHTMLGetText
      BlobType = ftMemo
      Size = 8
    end
    object cdsEnvNotFinancATIVO: TIntegerField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
      Required = True
    end
    object cdsEnvNotFinancTIPO_DOC_C: TStringField
      DisplayLabel = 'Tipo Documento'
      FieldName = 'TIPO_DOC_C'
      FixedChar = True
      Size = 15
    end
    object cdsEnvNotFinancN_DOC_C: TStringField
      DisplayLabel = 'Num Documento'
      FieldName = 'N_DOC_C'
      FixedChar = True
    end
    object cdsEnvNotFinancDATA_REC_C: TDateTimeField
      DisplayLabel = 'Data Cadastro'
      FieldName = 'DATA_REC_C'
    end
    object cdsEnvNotFinancDATA_VENC_C: TDateTimeField
      DisplayLabel = 'Data Vencimento'
      FieldName = 'DATA_VENC_C'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsEnvNotFinancVALOR_C: TFloatField
      DisplayLabel = 'Valor Credito'
      FieldName = 'VALOR_C'
      DisplayFormat = '##0.00'
    end
    object cdsEnvNotFinancVALOR_CORR: TFloatField
      DisplayLabel = 'Valor Corrigido'
      FieldName = 'VALOR_CORR'
      DisplayFormat = '##0.00'
    end
    object cdsEnvNotFinancSTATUS_C: TStringField
      DisplayLabel = 'Status Cred'
      FieldName = 'STATUS_C'
      FixedChar = True
      Size = 10
    end
    object cdsEnvNotFinancDATQ_C: TDateTimeField
      DisplayLabel = 'Data Quita'#231#227'o'
      FieldName = 'DATQ_C'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsEnvNotFinancCODIGO_CTRL: TIntegerField
      DisplayLabel = 'Cod Controle'
      FieldName = 'CODIGO_CTRL'
      Required = True
    end
    object cdsEnvNotFinancNOME_CTRL: TStringField
      DisplayLabel = 'Controle'
      FieldName = 'NOME_CTRL'
      Size = 35
    end
    object cdsEnvNotFinancNOSSO_NUMERO_BANCO: TStringField
      DisplayLabel = 'Nosso Numero'
      FieldName = 'NOSSO_NUMERO_BANCO'
    end
    object cdsEnvNotFinancNPARCELA: TIntegerField
      DisplayLabel = 'Num Parcela'
      FieldName = 'NPARCELA'
    end
    object cdsEnvNotFinancQTDE_PARC: TIntegerField
      DisplayLabel = 'Qtde Parcela'
      FieldName = 'QTDE_PARC'
    end
    object cdsEnvNotFinancNOME_CLIENTE: TStringField
      DisplayLabel = 'Nome do Cliente'
      FieldName = 'NOME_CLIENTE'
      Required = True
      FixedChar = True
      Size = 35
    end
    object cdsEnvNotFinancRAZAO: TStringField
      DisplayLabel = 'Razao Social'
      FieldName = 'RAZAO'
      Required = True
      Size = 60
    end
    object cdsEnvNotFinancCPFCGC: TStringField
      DisplayLabel = 'CPF / CNPJ'
      FieldName = 'CPFCGC'
      Size = 18
    end
    object cdsEnvNotFinancSTATUS_ENV: TStringField
      DisplayLabel = 'Status Env'
      FieldName = 'STATUS_ENV'
      Size = 2
    end
    object cdsEnvNotFinancOBS_ENV: TMemoField
      DisplayLabel = 'Obs Env'
      FieldName = 'OBS_ENV'
      OnGetText = cdsEnvNotFinancOBS_ENVGetText
      BlobType = ftMemo
      Size = 8
    end
    object cdsEnvNotFinancUUID: TStringField
      DisplayLabel = 'Guid'
      FieldName = 'UUID'
      Size = 50
    end
    object cdsEnvNotFinancCOD_CARTA: TIntegerField
      DisplayLabel = 'Cod Carta'
      FieldName = 'COD_CARTA'
      Required = True
    end
    object cdsEnvNotFinancID_MSG_APLICATIVO: TIntegerField
      Tag = 1
      DisplayLabel = 'Id Aplicativo'
      FieldName = 'ID_MSG_APLICATIVO'
    end
    object cdsEnvNotFinancID_MSG_PLATAFORMA: TIntegerField
      Tag = 1
      DisplayLabel = 'Id Plataforma'
      FieldName = 'ID_MSG_PLATAFORMA'
    end
    object cdsEnvNotFinancORIGEM: TStringField
      DisplayLabel = 'Origem'
      FieldName = 'ORIGEM'
      Size = 3
    end
    object cdsEnvNotFinancDESTINO: TStringField
      DisplayLabel = 'Destino'
      FieldName = 'DESTINO'
      Size = 3
    end
  end
  object qrConciliacaoFinanceiro: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      
        'select DATA, DATE_, REQUEST_DATE, EFFECTED_DATE, PAYMENT_DATE, B' +
        'ANK_SHIPPING_DATE, ID, COD_EMPRESA, ARQUIVO, DATA_ARQUIVO, ESTAB' +
        'LISHMENT_NUMBER, NSU, AUTHORIZATION_NUMBER,'
      
        'TYPE_, TYPE_DESCRIPTION, ACQUIRER_ID, ACQUIRER_NAME, BRAND_ID, B' +
        'RAND_NAME,'
      'EVENT_TYPE,  EVENT_TYPE_DESCRIPTION,'
      'DESCRIPTION, BANK_RECON_STATUS, BANK_RECON_DESCRIPTION,'
      'GROSS_AMOUNT, EVENT_NET_AMOUNT, BATCH_NET_AMOUNT,'
      
        'GROSS_EVENT_AMOUNT, BATCH_GROSS_AMOUNT, TAX, SALE_TAX, CUSTOMER_' +
        'TAX, INSTALLMENT_NUMBER, INSTALLMENTS_TOTAL,'
      'BANK_NUMBER, BANK_NAME, BRANCH_NUMBER, ACCOUNT_NUMBER,'
      
        'IDENTIFICACAO_EMP, CODIGO_CTRL, NOME_CTRL, CODIGO_CTRL_TX, NOME_' +
        'CTRL_TX,'
      
        'N_CONTA_PLC_TX_CARTAO, N_CONTA_PLC_TARIFA_CARTAO, N_CONTA_PLC, D' +
        'ESC_PLC,'
      
        'COD_CRED, N_DOC_V, N_DOC_C, TP_DOC_V, VALOR_C, VALOR_LIQUIDO, VA' +
        'LOR_ORIGINAL, '
      
        'DATA_REC_C, DATA_VENC_C, STATUS_C, DATQ_C, TAXA_CRED, COD_CLIENT' +
        'E, NOME_CLIENTE, RAZAO,'
      
        'COD_TERMINAL_ADM, DESC_TERM_ADM, COD_ADM, DESCRICAO_ADM, COD_BAN' +
        'DEIRA_ADM, DESC_BANDEIRA_ADM, QTDE_REG, PIX_ID, FORM_PAG_COD,FOR' +
        'M_PAG,COD_AJUSTE_COD, COD_AJUSTE,BANDEIRA_COD,BANDEIRA,STATUS_PA' +
        'G_COD,STATUS_PAG,STATUS_PAG_ST, TIPO_LANCAMENTO_COD, TIPO_LANCAM' +
        'ENTO,TIPO_LIQUIDACAO_COD,TIPO_LIQUIDACAO, TIPO_ANTECIPACAO_COD, ' +
        'TIPO_ANTECIPACAO,TIPO_CARTAO_COD, TIPO_CARTAO, MOTIVO_REJ_COD, M' +
        'OTIVO_REJ, GRUPO_CARTAO_COD, GRUPO_CARTAO, TIPO_TRANSACAO_COD, T' +
        'IPO_TRANSACAO, STATUS_TRANSF_COD,'
      
        'STATUS_TRANSF, STATUS_TRANSF_ST, ORIGEM_AJUSTE_COD, ORIGEM_AJUST' +
        'E'
      'from VW_CONCILIACAO_FINANCEIRO'
      'where DATE_ >= '#39'01/01/2000'#39
      'and DATE_ <= '#39'01/01/2000'#39
      'and COD_EMPRESA = 1')
    Left = 1221
    Top = 72
  end
  object dspConciliacaoFinanceiro: TDataSetProvider
    DataSet = qrConciliacaoFinanceiro
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1221
    Top = 128
  end
  object cdsConciliacaoFinanceiro: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspConciliacaoFinanceiro'
    BeforeOpen = cdsCtrlChBeforeOpen
    Left = 1221
    Top = 176
    object cdsConciliacaoFinanceiroSEL: TStringField
      DisplayLabel = 'Sel'
      FieldKind = fkInternalCalc
      FieldName = 'SEL'
      Size = 1
    end
    object cdsConciliacaoFinanceiroESTABLISHMENT_NUMBER: TStringField
      DisplayLabel = 'Estabelecimento'
      FieldName = 'ESTABLISHMENT_NUMBER'
      ReadOnly = True
      Size = 30
    end
    object cdsConciliacaoFinanceiroDATA: TDateTimeField
      DisplayLabel = 'Data'
      FieldName = 'DATA'
    end
    object cdsConciliacaoFinanceiroNSU: TStringField
      DisplayLabel = 'Num Doc/NSU/CV'
      FieldName = 'NSU'
    end
    object cdsConciliacaoFinanceiroAUTHORIZATION_NUMBER: TStringField
      DisplayLabel = 'Num Aut Cartao'
      FieldName = 'AUTHORIZATION_NUMBER'
    end
    object cdsConciliacaoFinanceiroINSTALLMENT_NUMBER: TIntegerField
      DisplayLabel = 'Num Parc'
      FieldName = 'INSTALLMENT_NUMBER'
    end
    object cdsConciliacaoFinanceiroINSTALLMENTS_TOTAL: TIntegerField
      DisplayLabel = 'Qtde Parc'
      FieldName = 'INSTALLMENTS_TOTAL'
    end
    object cdsConciliacaoFinanceiroTYPE_: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Tipo'
      FieldName = 'TYPE_'
    end
    object cdsConciliacaoFinanceiroTYPE_DESCRIPTION: TStringField
      Tag = 1
      DisplayLabel = 'Tipo'
      FieldName = 'TYPE_DESCRIPTION'
      Size = 30
    end
    object cdsConciliacaoFinanceiroACQUIRER_ID: TIntegerField
      Tag = 1
      DisplayLabel = 'Adquirente Id'
      FieldName = 'ACQUIRER_ID'
    end
    object cdsConciliacaoFinanceiroACQUIRER_NAME: TStringField
      DisplayLabel = 'Adquirente'
      FieldName = 'ACQUIRER_NAME'
      Size = 30
    end
    object cdsConciliacaoFinanceiroBRAND_ID: TIntegerField
      Tag = 1
      DisplayLabel = 'Bandeira Id'
      FieldName = 'BRAND_ID'
    end
    object cdsConciliacaoFinanceiroBRAND_NAME: TStringField
      DisplayLabel = 'Bandeira'
      FieldName = 'BRAND_NAME'
      Size = 30
    end
    object cdsConciliacaoFinanceiroEVENT_TYPE: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Evento'
      FieldName = 'EVENT_TYPE'
    end
    object cdsConciliacaoFinanceiroEVENT_TYPE_DESCRIPTION: TStringField
      DisplayLabel = 'Evento'
      FieldName = 'EVENT_TYPE_DESCRIPTION'
      Size = 30
    end
    object cdsConciliacaoFinanceiroDESCRIPTION: TStringField
      DisplayLabel = 'Descricao'
      FieldName = 'DESCRIPTION'
      Size = 250
    end
    object cdsConciliacaoFinanceiroDATA_REC_C: TDateTimeField
      DisplayLabel = 'Data Cadastro'
      FieldName = 'DATA_REC_C'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsConciliacaoFinanceiroDATA_VENC_C: TDateTimeField
      DisplayLabel = 'Data Vencimento'
      FieldName = 'DATA_VENC_C'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsConciliacaoFinanceiroPAYMENT_DATE: TDateTimeField
      DisplayLabel = 'Data Pag'
      FieldName = 'PAYMENT_DATE'
      ReadOnly = True
    end
    object cdsConciliacaoFinanceiroVALOR_C: TFloatField
      DisplayLabel = 'Valor Credito'
      FieldName = 'VALOR_C'
      DisplayFormat = '##0.00'
    end
    object cdsConciliacaoFinanceiroVALOR_LIQUIDO: TFloatField
      DisplayLabel = 'Valor Liquido Cred'
      FieldName = 'VALOR_LIQUIDO'
      DisplayFormat = '##0.00'
    end
    object cdsConciliacaoFinanceiroVALOR_ORIGINAL: TFloatField
      Tag = 1
      DisplayLabel = 'Valor Original cred'
      FieldName = 'VALOR_ORIGINAL'
      DisplayFormat = '##0.00'
    end
    object cdsConciliacaoFinanceiroEVENT_NET_AMOUNT: TFloatField
      DisplayLabel = 'Valor Liquido'
      FieldName = 'EVENT_NET_AMOUNT'
      DisplayFormat = '##0.00'
    end
    object cdsConciliacaoFinanceiroTAX: TFloatField
      DisplayLabel = 'Taxa no pagamento (%)'
      FieldName = 'TAX'
      DisplayFormat = '##0.00'
    end
    object cdsConciliacaoFinanceiroSALE_TAX: TFloatField
      Tag = 1
      DisplayLabel = 'Taxa na venda (%)'
      FieldName = 'SALE_TAX'
      DisplayFormat = '##0.00'
    end
    object cdsConciliacaoFinanceiroCUSTOMER_TAX: TFloatField
      Tag = 1
      DisplayLabel = 'Taxa cadastrada confere (%)'
      FieldName = 'CUSTOMER_TAX'
      DisplayFormat = '##0.00'
    end
    object cdsConciliacaoFinanceiroTAXA_CRED: TFloatField
      DisplayLabel = 'Taxa aplicada sistema (%)'
      FieldName = 'TAXA_CRED'
      DisplayFormat = '##0.00'
    end
    object cdsConciliacaoFinanceiroBANK_NUMBER: TIntegerField
      DisplayLabel = 'Num Banco'
      FieldName = 'BANK_NUMBER'
    end
    object cdsConciliacaoFinanceiroBANK_NAME: TStringField
      DisplayLabel = 'Banco'
      FieldName = 'BANK_NAME'
      Size = 30
    end
    object cdsConciliacaoFinanceiroBRANCH_NUMBER: TIntegerField
      DisplayLabel = 'Agencia'
      FieldName = 'BRANCH_NUMBER'
    end
    object cdsConciliacaoFinanceiroACCOUNT_NUMBER: TStringField
      DisplayLabel = 'Numero Conta'
      FieldName = 'ACCOUNT_NUMBER'
    end
    object cdsConciliacaoFinanceiroN_CONTA_PLC: TFloatField
      DisplayLabel = 'Num Conta'
      FieldName = 'N_CONTA_PLC'
    end
    object cdsConciliacaoFinanceiroDESC_PLC: TStringField
      DisplayLabel = 'Descri'#231#227'o de Contas'
      FieldName = 'DESC_PLC'
      FixedChar = True
      Size = 30
    end
    object cdsConciliacaoFinanceiroCODIGO_CTRL: TIntegerField
      DisplayLabel = 'Cod Controle'
      FieldName = 'CODIGO_CTRL'
    end
    object cdsConciliacaoFinanceiroNOME_CTRL: TStringField
      DisplayLabel = 'Controle'
      FieldName = 'NOME_CTRL'
      Size = 35
    end
    object cdsConciliacaoFinanceiroN_DOC_C: TStringField
      DisplayLabel = 'Num Documento'
      FieldName = 'N_DOC_C'
      FixedChar = True
    end
    object cdsConciliacaoFinanceiroN_DOC_V: TIntegerField
      DisplayLabel = 'Num Doc Venda'
      FieldName = 'N_DOC_V'
    end
    object cdsConciliacaoFinanceiroTP_DOC_V: TStringField
      DisplayLabel = 'Tipo Doc Venda'
      FieldName = 'TP_DOC_V'
      FixedChar = True
      Size = 6
    end
    object cdsConciliacaoFinanceiroSTATUS_C: TStringField
      DisplayLabel = 'Status Cred'
      FieldName = 'STATUS_C'
      FixedChar = True
      Size = 10
    end
    object cdsConciliacaoFinanceiroDATQ_C: TDateTimeField
      DisplayLabel = 'Data Quitacao'
      FieldName = 'DATQ_C'
    end
    object cdsConciliacaoFinanceiroCOD_CRED: TIntegerField
      DisplayLabel = 'Cod Cred'
      FieldName = 'COD_CRED'
    end
    object cdsConciliacaoFinanceiroID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
      Required = True
    end
    object cdsConciliacaoFinanceiroBANK_RECON_DESCRIPTION: TStringField
      DisplayLabel = 'Situacao'
      FieldName = 'BANK_RECON_DESCRIPTION'
      FixedChar = True
      Size = 25
    end
    object cdsConciliacaoFinanceiroBANK_RECON_STATUS: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Situacao'
      FieldName = 'BANK_RECON_STATUS'
    end
    object cdsConciliacaoFinanceiroCOD_CLIENTE: TIntegerField
      DisplayLabel = 'Cod Cliente'
      FieldName = 'COD_CLIENTE'
    end
    object cdsConciliacaoFinanceiroNOME_CLIENTE: TStringField
      DisplayLabel = 'Nome Fantasia (Cliente)'
      FieldName = 'NOME_CLIENTE'
      Size = 35
    end
    object cdsConciliacaoFinanceiroRAZAO: TStringField
      DisplayLabel = 'Razao Social (Cliente)'
      FieldName = 'RAZAO'
      ReadOnly = True
      Size = 60
    end
    object cdsConciliacaoFinanceiroCODIGO_CTRL_TX: TIntegerField
      Tag = 1
      FieldName = 'CODIGO_CTRL_TX'
    end
    object cdsConciliacaoFinanceiroNOME_CTRL_TX: TStringField
      Tag = 1
      FieldName = 'NOME_CTRL_TX'
      FixedChar = True
      Size = 1
    end
    object cdsConciliacaoFinanceiroN_CONTA_PLC_TX_CARTAO: TFloatField
      Tag = 1
      DisplayLabel = 'Num Conta Taxa Cartao'
      FieldName = 'N_CONTA_PLC_TX_CARTAO'
    end
    object cdsConciliacaoFinanceiroN_CONTA_PLC_TARIFA_CARTAO: TFloatField
      Tag = 1
      DisplayLabel = 'Num Conta Tarifa Cartao'
      FieldName = 'N_CONTA_PLC_TARIFA_CARTAO'
    end
    object cdsConciliacaoFinanceiroCOD_EMPRESA: TIntegerField
      DisplayLabel = 'Cod Unificada'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsConciliacaoFinanceiroIDENTIFICACAO_EMP: TStringField
      DisplayLabel = 'Unificada'
      FieldName = 'IDENTIFICACAO_EMP'
      Size = 64
    end
    object cdsConciliacaoFinanceiroGROSS_AMOUNT: TFloatField
      DisplayLabel = 'Valor Total Bruto'
      FieldName = 'GROSS_AMOUNT'
      DisplayFormat = '##0.00'
    end
    object cdsConciliacaoFinanceiroBATCH_NET_AMOUNT: TFloatField
      DisplayLabel = 'Valor Liquido Lote'
      FieldName = 'BATCH_NET_AMOUNT'
      DisplayFormat = '##0.00'
    end
    object cdsConciliacaoFinanceiroCOD_TERMINAL_ADM: TStringField
      DisplayLabel = 'Cod Terminal'
      FieldName = 'COD_TERMINAL_ADM'
      FixedChar = True
      Size = 1
    end
    object cdsConciliacaoFinanceiroDESC_TERM_ADM: TStringField
      DisplayLabel = 'Terminal'
      FieldName = 'DESC_TERM_ADM'
      FixedChar = True
      Size = 1
    end
    object cdsConciliacaoFinanceiroCOD_ADM: TIntegerField
      DisplayLabel = 'Cod Adm'
      FieldName = 'COD_ADM'
      ReadOnly = True
    end
    object cdsConciliacaoFinanceiroDESCRICAO_ADM: TStringField
      DisplayLabel = 'Adm'
      FieldName = 'DESCRICAO_ADM'
      FixedChar = True
      Size = 1
    end
    object cdsConciliacaoFinanceiroCOD_BANDEIRA_ADM: TIntegerField
      DisplayLabel = 'Cod Bandeira Adm'
      FieldName = 'COD_BANDEIRA_ADM'
      ReadOnly = True
    end
    object cdsConciliacaoFinanceiroDESC_BANDEIRA_ADM: TStringField
      DisplayLabel = 'Bandeira Adm'
      FieldName = 'DESC_BANDEIRA_ADM'
      ReadOnly = True
      Size = 32
    end
    object cdsConciliacaoFinanceiroQTDE_REG: TIntegerField
      Tag = 1
      DisplayLabel = 'Qtde Reg'
      FieldName = 'QTDE_REG'
      ReadOnly = True
    end
    object cdsConciliacaoFinanceiroPIX_ID: TStringField
      DisplayLabel = 'Pix Id'
      FieldName = 'PIX_ID'
      ReadOnly = True
      Size = 36
    end
    object cdsConciliacaoFinanceiroGROSS_EVENT_AMOUNT: TFloatField
      Tag = 1
      FieldName = 'GROSS_EVENT_AMOUNT'
      ReadOnly = True
    end
    object cdsConciliacaoFinanceiroBATCH_GROSS_AMOUNT: TFloatField
      Tag = 1
      FieldName = 'BATCH_GROSS_AMOUNT'
      ReadOnly = True
    end
    object cdsConciliacaoFinanceiroFORM_PAG_COD: TStringField
      DisplayLabel = 'Forma Pag Cod'
      FieldName = 'FORM_PAG_COD'
      ReadOnly = True
      Size = 5
    end
    object cdsConciliacaoFinanceiroFORM_PAG: TStringField
      DisplayLabel = 'Form Pag'
      FieldName = 'FORM_PAG'
      Size = 100
    end
    object cdsConciliacaoFinanceiroCOD_AJUSTE_COD: TStringField
      DisplayLabel = 'Ajuste Cod'
      FieldName = 'COD_AJUSTE_COD'
      ReadOnly = True
      Size = 5
    end
    object cdsConciliacaoFinanceiroCOD_AJUSTE: TStringField
      DisplayLabel = 'Ajuste'
      FieldName = 'COD_AJUSTE'
      Size = 200
    end
    object cdsConciliacaoFinanceiroBANDEIRA_COD: TStringField
      DisplayLabel = 'Bandeira Cod'
      FieldName = 'BANDEIRA_COD'
      Size = 5
    end
    object cdsConciliacaoFinanceiroBANDEIRA: TStringField
      DisplayLabel = 'Bandeira'
      FieldName = 'BANDEIRA'
      Size = 30
    end
    object cdsConciliacaoFinanceiroSTATUS_PAG_COD: TStringField
      DisplayLabel = 'Status Pag Cod'
      FieldName = 'STATUS_PAG_COD'
      ReadOnly = True
      Size = 5
    end
    object cdsConciliacaoFinanceiroSTATUS_PAG: TStringField
      DisplayLabel = 'Status Pag'
      FieldName = 'STATUS_PAG'
      Size = 100
    end
    object cdsConciliacaoFinanceiroSTATUS_PAG_ST: TStringField
      DisplayLabel = 'Status Pag St'
      FieldName = 'STATUS_PAG_ST'
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object cdsConciliacaoFinanceiroTIPO_LANCAMENTO_COD: TStringField
      DisplayLabel = 'Tipo Lancamento Cod'
      FieldName = 'TIPO_LANCAMENTO_COD'
      ReadOnly = True
      Size = 5
    end
    object cdsConciliacaoFinanceiroTIPO_LANCAMENTO: TStringField
      DisplayLabel = 'Tipo Lancamento'
      FieldName = 'TIPO_LANCAMENTO'
      Size = 150
    end
    object cdsConciliacaoFinanceiroTIPO_LIQUIDACAO_COD: TStringField
      DisplayLabel = 'Tipo Liquidacao Cod'
      FieldName = 'TIPO_LIQUIDACAO_COD'
      ReadOnly = True
      Size = 5
    end
    object cdsConciliacaoFinanceiroTIPO_LIQUIDACAO: TStringField
      DisplayLabel = 'Tipo Liquidacao'
      FieldName = 'TIPO_LIQUIDACAO'
      Size = 30
    end
    object cdsConciliacaoFinanceiroTIPO_ANTECIPACAO_COD: TStringField
      DisplayLabel = 'Tipo Antecipacao Cod'
      FieldName = 'TIPO_ANTECIPACAO_COD'
      ReadOnly = True
      Size = 5
    end
    object cdsConciliacaoFinanceiroTIPO_ANTECIPACAO: TStringField
      DisplayLabel = 'Tipo Antecipacao'
      FieldName = 'TIPO_ANTECIPACAO'
      Size = 30
    end
    object cdsConciliacaoFinanceiroTIPO_CARTAO_COD: TStringField
      DisplayLabel = 'Tipo Cartao Cod'
      FieldName = 'TIPO_CARTAO_COD'
      ReadOnly = True
      Size = 5
    end
    object cdsConciliacaoFinanceiroTIPO_CARTAO: TStringField
      DisplayLabel = 'Tipo Cartao'
      FieldName = 'TIPO_CARTAO'
      Size = 50
    end
    object cdsConciliacaoFinanceiroMOTIVO_REJ_COD: TStringField
      DisplayLabel = 'Motivo Rejeicao Cod'
      FieldName = 'MOTIVO_REJ_COD'
      ReadOnly = True
      Size = 5
    end
    object cdsConciliacaoFinanceiroMOTIVO_REJ: TStringField
      DisplayLabel = 'Motivo Rejeicao'
      FieldName = 'MOTIVO_REJ'
      Size = 50
    end
    object cdsConciliacaoFinanceiroGRUPO_CARTAO_COD: TStringField
      DisplayLabel = 'Grupo Cartao Cod'
      FieldName = 'GRUPO_CARTAO_COD'
      ReadOnly = True
      Size = 5
    end
    object cdsConciliacaoFinanceiroGRUPO_CARTAO: TStringField
      DisplayLabel = 'Grupo Cartao'
      FieldName = 'GRUPO_CARTAO'
      Size = 100
    end
    object cdsConciliacaoFinanceiroTIPO_TRANSACAO_COD: TStringField
      DisplayLabel = 'Tipo Transacao Cod'
      FieldName = 'TIPO_TRANSACAO_COD'
      ReadOnly = True
      Size = 5
    end
    object cdsConciliacaoFinanceiroTIPO_TRANSACAO: TStringField
      DisplayLabel = 'Tipo Transacao'
      FieldName = 'TIPO_TRANSACAO'
      Size = 30
    end
    object cdsConciliacaoFinanceiroSTATUS_TRANSF_COD: TStringField
      DisplayLabel = 'Status Transf Cod'
      FieldName = 'STATUS_TRANSF_COD'
      ReadOnly = True
      Size = 5
    end
    object cdsConciliacaoFinanceiroSTATUS_TRANSF: TStringField
      DisplayLabel = 'Status Transf'
      FieldName = 'STATUS_TRANSF'
      Size = 50
    end
    object cdsConciliacaoFinanceiroSTATUS_TRANSF_ST: TStringField
      DisplayLabel = 'Status Transf St'
      FieldName = 'STATUS_TRANSF_ST'
      FixedChar = True
      Size = 1
    end
    object cdsConciliacaoFinanceiroORIGEM_AJUSTE_COD: TStringField
      DisplayLabel = 'Origem Ajuste Cod'
      FieldName = 'ORIGEM_AJUSTE_COD'
      ReadOnly = True
      Size = 5
    end
    object cdsConciliacaoFinanceiroORIGEM_AJUSTE: TStringField
      DisplayLabel = 'Origem Ajuste'
      FieldName = 'ORIGEM_AJUSTE'
      Size = 50
    end
    object cdsConciliacaoFinanceiroDATE_: TDateTimeField
      DisplayLabel = 'Data Mov'
      FieldName = 'DATE_'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsConciliacaoFinanceiroREQUEST_DATE: TDateTimeField
      DisplayLabel = 'Data Mov Orig'
      FieldName = 'REQUEST_DATE'
      ReadOnly = True
    end
    object cdsConciliacaoFinanceiroEFFECTED_DATE: TDateTimeField
      DisplayLabel = 'Data Efetivada'
      FieldName = 'EFFECTED_DATE'
      ReadOnly = True
    end
    object cdsConciliacaoFinanceiroBANK_SHIPPING_DATE: TDateTimeField
      DisplayLabel = 'Data Env Banco'
      FieldName = 'BANK_SHIPPING_DATE'
      ReadOnly = True
    end
    object cdsConciliacaoFinanceiroARQUIVO: TStringField
      DisplayLabel = 'Arquivo'
      FieldName = 'ARQUIVO'
      ReadOnly = True
      Size = 255
    end
    object cdsConciliacaoFinanceiroDATA_ARQUIVO: TDateTimeField
      DisplayLabel = 'Data Arquivo'
      FieldName = 'DATA_ARQUIVO'
      ReadOnly = True
    end
  end
  object dsConciliacaoFinanceiro: TDataSource
    DataSet = cdsConciliacaoFinanceiro
    Left = 1221
    Top = 232
  end
  object qrConciliacaoPendencias: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      
        'select DATA, DATE_, REQUEST_DATE, EFFECTED_DATE, PAYMENT_DATE, B' +
        'ANK_SHIPPING_DATE, ID, COD_EMPRESA, ARQUIVO, DATA_ARQUIVO, ESTAB' +
        'LISHMENT_NUMBER, NSU, AUTHORIZATION_NUMBER,  TYPE_, TYPE_DESCRIP' +
        'TION, '
      'ACQUIRER_ID, ACQUIRER_NAME, '
      'BRAND_ID, BRAND_NAME, '
      'EVENT_TYPE, EVENT_TYPE_DESCRIPTION, DESCRIPTION, '
      'BANK_RECON_STATUS, BANK_RECON_DESCRIPTION, '
      'GROSS_AMOUNT, EVENT_NET_AMOUNT, BATCH_NET_AMOUNT,'
      'TAX, SALE_TAX, CUSTOMER_TAX, '
      'INSTALLMENT_NUMBER, INSTALLMENTS_TOTAL, '
      'BANK_NUMBER, BANK_NAME, BRANCH_NUMBER, ACCOUNT_NUMBER, '
      'IDENTIFICACAO_EMP, '
      'CODIGO_CTRL, NOME_CTRL, '
      'CODIGO_CTRL_TX, NOME_CTRL_TX, N_CONTA_PLC_TX_CARTAO, '
      'N_CONTA_PLC, DESC_PLC, '
      'COD_CRED, N_DOC_V, N_DOC_C, TP_DOC_V, '
      
        'VALOR_C, VALOR_LIQUIDO, VALOR_ORIGINAL, DATA_REC_C, DATA_VENC_C,' +
        ' DATQ_C, STATUS_C, TAXA_CRED,'
      
        'COD_TERMINAL_ADM,  DESC_TERM_ADM, COD_ADM, DESCRICAO_ADM, COD_BA' +
        'NDEIRA_ADM, DESC_BANDEIRA_ADM, PIX_ID, FORM_PAG_COD,FORM_PAG,COD' +
        '_AJUSTE_COD, COD_AJUSTE,BANDEIRA_COD,BANDEIRA,STATUS_PAG_COD,STA' +
        'TUS_PAG,STATUS_PAG_ST, TIPO_LANCAMENTO_COD, TIPO_LANCAMENTO,TIPO' +
        '_LIQUIDACAO_COD,TIPO_LIQUIDACAO, TIPO_ANTECIPACAO_COD, TIPO_ANTE' +
        'CIPACAO,TIPO_CARTAO_COD, TIPO_CARTAO, MOTIVO_REJ_COD, MOTIVO_REJ' +
        ', GRUPO_CARTAO_COD, GRUPO_CARTAO, TIPO_TRANSACAO_COD, TIPO_TRANS' +
        'ACAO, STATUS_TRANSF_COD,'
      
        'STATUS_TRANSF, STATUS_TRANSF_ST, ORIGEM_AJUSTE_COD, ORIGEM_AJUST' +
        'E '
      'from VW_CONCILIACAO_PENDENCIAS_CONF '
      'where DATE_ >= '#39'01/01/2000'#39
      'and DATE_ <= '#39'01/01/2000'#39
      'and COD_EMPRESA = 1')
    Left = 1221
    Top = 296
  end
  object dspConciliacaoPendencias: TDataSetProvider
    DataSet = qrConciliacaoPendencias
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1221
    Top = 352
  end
  object dsConciliacaoPendencias: TDataSource
    DataSet = cdsConciliacaoPendencias
    Left = 1221
    Top = 456
  end
  object qrCtrlCrConciliacao: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select cc.cod_cred, cc.codigo_emp, cc.cod_emp_mult,'
      'cc.n_docnsu_adm, cc.n_aut_cart,'
      'cc.nparcela, cc.qtde_parc,'
      'cc.codigo_ctrl, ctrl.nome_ctrl,'
      'cc.n_doc_v, cc.n_doc_c, cc.tp_doc_v,'
      'cc.valor_c, cc.valor_liquido,'
      'cc.arq_extrato_adm, cc.data_arquivo,'
      'cc.cod_terminal_adm, adm.descricao_adm,'
      'cc.cod_bandeira_adm, band.descricao,'
      'emp.identificacao_emp from controle_creditos cc'
      'left join conciliacao_financeiro cf on'
      '    cf.nsu = cc.n_docnsu_adm'
      '    and cf.authorization_number = cc.n_aut_cart'
      
        '    and coalesce(cf.installment_number, 1) = coalesce(cc.nparcel' +
        'a, 1)'
      '    and cf.cod_empresa = cc.cod_emp_mult'
      '    and cf.id is null'
      'inner join empresa emp on'
      '    emp.cod_empresa = cc.cod_emp_mult'
      'inner join controles ctrl on'
      '    ctrl.codigo_ctrl = cc.codigo_ctrl'
      '    and ctrl.codigo_emp = cc.cod_emp_mult'
      '    and ctrl.tp_plano = '#39'C'#39
      'left join terminal_cartao termc on'
      '    termc.cod_term_adm = cc.cod_terminal_adm'
      '    and termc.cod_empresa = cc.cod_emp_mult'
      'left join adm_cartao adm on'
      '    adm.cod_adm = termc.cod_adm'
      '    and adm.cod_empresa = termc.cod_empresa'
      'left join bandeiras_cartao band on'
      '    band.cod_bandeira = cc.cod_bandeira_adm'
      '    and band.cod_empresa = cc.cod_emp_mult'
      'where cc.data_rec_c >= '#39'01.01.2000'#39
      'and cc.cod_emp_mult = 1'
      'and cc.status_c is null'
      'and coalesce(cc.n_docnsu_adm, '#39#39') <> '#39#39
      'and coalesce(cc.n_aut_cart, '#39#39') <> '#39#39)
    Left = 1784
    Top = 295
  end
  object dspCtrlCrConciliacao: TDataSetProvider
    DataSet = qrCtrlCrConciliacao
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1784
    Top = 351
  end
  object cdsCtrlCrConciliacao: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspCtrlCrConciliacao'
    BeforeOpen = cdsCtrlChBeforeOpen
    Left = 1784
    Top = 399
    object StringField90: TStringField
      Tag = 2
      DisplayLabel = 'Sel'
      FieldKind = fkInternalCalc
      FieldName = 'SEL'
      Size = 1
    end
    object StringField93: TStringField
      DisplayLabel = 'Tipo Documento'
      FieldName = 'TIPO_DOC_C'
      FixedChar = True
      Size = 15
    end
    object StringField94: TStringField
      DisplayLabel = 'Nome Cliente'
      FieldName = 'NOME_C'
      Size = 35
    end
    object StringField97: TStringField
      DisplayLabel = 'Num Documento'
      FieldName = 'N_DOC_C'
      OnGetText = cdsCtrlCrN_DOC_CGetText
    end
    object DateTimeField31: TDateTimeField
      Tag = 2
      DisplayLabel = 'Data Vencimento'
      FieldName = 'DATA_VENC_C'
      EditMask = '!99/99/0000;1;_'
    end
    object FloatField27: TFloatField
      Tag = 2
      DisplayLabel = 'Valor Credito'
      FieldName = 'VALOR_C'
      DisplayFormat = '##0.00'
    end
    object FloatField28: TFloatField
      DisplayLabel = 'Valor Corrigido'
      FieldName = 'VALOR_CORR'
      DisplayFormat = '##0.00'
    end
    object FloatField30: TFloatField
      DisplayLabel = 'Valor Desconto'
      FieldName = 'VALOR_DESC'
      DisplayFormat = '##0.00'
    end
    object ii: TFloatField
      DisplayLabel = 'Valor Acrescimo'
      FieldName = 'VALOR_ACRESC'
      DisplayFormat = '##0.00'
    end
    object FloatField32: TFloatField
      DisplayLabel = 'Valor Original'
      FieldName = 'VALOR_ORIGINAL'
      DisplayFormat = '##0.00'
    end
    object FloatField33: TFloatField
      DisplayLabel = 'Valor L'#237'quido'
      FieldName = 'VALOR_LIQUIDO'
      DisplayFormat = '##0.00'
    end
    object StringField99: TStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS_C'
      FixedChar = True
      Size = 10
    end
    object IntegerField75: TIntegerField
      Tag = 2
      DisplayLabel = 'Codigo'
      FieldName = 'COD_CRED'
      Required = True
    end
    object StringField100: TStringField
      DisplayLabel = 'Historico'
      FieldName = 'HISTORICO_C'
      Size = 100
    end
    object FloatField34: TFloatField
      DisplayLabel = 'Num da Conta'
      FieldName = 'N_CONTA_PLC'
    end
    object IntegerField76: TIntegerField
      DisplayLabel = 'Codigo Controle'
      FieldName = 'CODIGO_CTRL'
      Required = True
    end
    object StringField101: TStringField
      DisplayLabel = 'Razao Social Cliente'
      FieldName = 'RAZAO'
      Size = 60
    end
    object IntegerField77: TIntegerField
      DisplayLabel = 'Codigo Cliente'
      FieldName = 'COD_CLIENTE'
    end
    object DateTimeField32: TDateTimeField
      DisplayLabel = 'Data Cadastro'
      FieldName = 'DATA_REC_C'
      EditMask = '!99/99/0000;1;_'
    end
    object DateTimeField33: TDateTimeField
      DisplayLabel = 'Data Quita'#231#227'o'
      FieldName = 'DATQ_C'
      EditMask = '!99/99/0000;1;_'
    end
    object StringField102: TStringField
      DisplayLabel = 'Natureza(C/N)'
      FieldName = 'NATL_C'
      FixedChar = True
      Size = 1
    end
    object IntegerField80: TIntegerField
      DisplayLabel = 'Num Doc Venda'
      FieldName = 'N_DOC_V'
    end
    object StringField103: TStringField
      DisplayLabel = 'Tipo Doc Venda'
      FieldName = 'TP_DOC_V'
      FixedChar = True
      Size = 6
    end
    object IntegerField81: TIntegerField
      DisplayLabel = 'Num Parcela'
      FieldName = 'NPARCELA'
    end
    object IntegerField82: TIntegerField
      DisplayLabel = 'Qtde Parcelas'
      FieldName = 'QTDE_PARC'
    end
    object FloatField35: TFloatField
      DisplayLabel = 'Valor Juros Cobrado'
      FieldName = 'JUROS_COB'
      DisplayFormat = '##0.00'
    end
    object FloatField36: TFloatField
      DisplayLabel = 'Valor Taxa Cobran'#231'a'
      FieldName = 'TAXA_COBRANCA'
      DisplayFormat = '##0.00'
    end
    object StringField105: TStringField
      DisplayLabel = 'Nosso Numero Boleto'
      FieldName = 'NOSSO_NUMERO_BANCO'
    end
    object MemoField2: TMemoField
      DisplayLabel = 'Informa'#231#227'o Banc'#225'ria'
      FieldName = 'OCORRENCIABANCARIA'
      OnGetText = cdsCtrlCrOCORRENCIABANCARIAGetText
      BlobType = ftMemo
      Size = 8
    end
    object IntegerField83: TIntegerField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
    end
    object IntegerField84: TIntegerField
      DisplayLabel = 'Lote Baixa'
      FieldName = 'LOTE_QUIT'
    end
    object IntegerField85: TIntegerField
      DisplayLabel = 'Lote Cadastro'
      FieldName = 'LOTE_ENT'
    end
    object IntegerField86: TIntegerField
      DisplayLabel = 'Lote CXL'
      FieldName = 'LOTE_CXL'
    end
    object StringField106: TStringField
      DisplayLabel = 'Tipo Cadastro(C/N)'
      FieldName = 'TIP_CNT'
      FixedChar = True
      Size = 1
    end
    object IntegerField87: TIntegerField
      DisplayLabel = 'Lote Negativa'#231#227'o'
      FieldName = 'LOTE_NEG'
    end
    object IntegerField88: TIntegerField
      DisplayLabel = 'Codigo Cliente Terceiro'
      FieldName = 'COD_CLI_TERC'
    end
    object StringField107: TStringField
      DisplayLabel = 'Nome Terceiro'
      FieldName = 'NOME_TERC'
      Size = 35
    end
    object DateTimeField34: TDateTimeField
      DisplayLabel = 'Data Caixa Auxiliar'
      FieldName = 'DATA_CXL'
      EditMask = '!99/99/0000;1;_'
    end
    object IntegerField89: TIntegerField
      DisplayLabel = 'Codigo Vendedor'
      FieldName = 'CODIGO_VEND'
    end
    object IntegerField90: TIntegerField
      DisplayLabel = 'Num Duplicata'
      FieldName = 'N_DUPL_C'
    end
    object DateTimeField35: TDateTimeField
      DisplayLabel = 'Data Remessa'
      FieldName = 'DATA_REM_REC'
      EditMask = '!99/99/0000;1;_'
    end
    object IntegerField91: TIntegerField
      DisplayLabel = 'Codigo Terminal'
      FieldName = 'COD_TERM'
    end
    object DateTimeField36: TDateTimeField
      DisplayLabel = 'Data Real da Baixa'
      FieldName = 'DATA_BAIXA'
      EditMask = '!99/99/0000;1;_'
    end
    object DateTimeField37: TDateTimeField
      DisplayLabel = 'Data Venda'
      FieldName = 'DATA_VENDA'
      EditMask = '!99/99/0000;1;_'
    end
    object IntegerField92: TIntegerField
      DisplayLabel = 'Codigo Func'
      FieldName = 'CODIGO_FUNC'
    end
    object DateTimeField38: TDateTimeField
      DisplayLabel = 'Dia CXL'
      FieldName = 'DIA_CXL'
      EditMask = '!99/99/0000;1;_'
    end
    object StringField108: TStringField
      DisplayLabel = 'Status Recebimento CXL'
      FieldName = 'STATUS_CXL_RQ'
      FixedChar = True
      Size = 1
    end
    object FloatField37: TFloatField
      DisplayLabel = 'Valor Recebido Cxl'
      FieldName = 'VL_RQ_PG_CXL'
      DisplayFormat = '##0.00'
    end
    object IntegerField93: TIntegerField
      DisplayLabel = 'Operador CXL'
      FieldName = 'OP_CXL'
    end
    object StringField109: TStringField
      DisplayLabel = 'Tipo Recebimento CXL'
      FieldName = 'TP_REC_CXL'
      FixedChar = True
      Size = 1
    end
    object StringField110: TStringField
      DisplayLabel = 'CPF/CNPJ'
      FieldName = 'CPFCGC'
      FixedChar = True
      Size = 18
    end
    object StringField111: TStringField
      DisplayLabel = 'Processamento'
      FieldName = 'PRCSS'
      FixedChar = True
      Size = 1
    end
    object IntegerField94: TIntegerField
      DisplayLabel = 'Codigo Item Carta'
      FieldName = 'COD_IT_CARTAS'
    end
    object DateTimeField39: TDateTimeField
      DisplayLabel = 'Data Envio Carta'
      FieldName = 'DT_REG_CARTAS'
      EditMask = '!99/99/0000;1;_'
    end
    object IntegerField95: TIntegerField
      DisplayLabel = 'Num Seq Bol'
      FieldName = 'N_SEQ_BOL'
    end
    object IntegerField96: TIntegerField
      DisplayLabel = 'Codigo Carta Cobran'#231'a'
      FieldName = 'COD_CARTA'
    end
    object StringField122: TStringField
      DisplayLabel = 'Num Doc/NSU/CV'
      FieldName = 'N_DOCNSU_ADM'
      Size = 10
    end
    object StringField112: TStringField
      DisplayLabel = 'Num Aut Cartao'
      FieldName = 'N_AUT_CART'
      FixedChar = True
    end
    object IntegerField97: TIntegerField
      DisplayLabel = 'Codigo Faturamento'
      FieldName = 'COD_FATURAMENTO'
    end
    object DateTimeField40: TDateTimeField
      DisplayLabel = 'Data Lote Negativa'#231#227'o'
      FieldName = 'DATA_LOTE_NEG'
      EditMask = '!99/99/0000;1;_'
    end
    object IntegerField98: TIntegerField
      DisplayLabel = 'Num Nf'
      FieldName = 'NUM_NOTA'
    end
    object IntegerField99: TIntegerField
      DisplayLabel = 'Num REQ'
      FieldName = 'NREQ'
    end
    object IntegerField100: TIntegerField
      DisplayLabel = 'Num OS'
      FieldName = 'N_OS'
    end
    object IntegerField101: TIntegerField
      DisplayLabel = 'Num Comando'
      FieldName = 'NCOMANDO'
    end
    object IntegerField102: TIntegerField
      DisplayLabel = 'Num GRP'
      FieldName = 'NGRP'
    end
    object StringField113: TStringField
      DisplayLabel = 'Codigo Usuario Cancelou'
      FieldName = 'US_CANCELOU'
      Size = 10
    end
    object DateTimeField41: TDateTimeField
      DisplayLabel = 'Data que o Usuario Cancelou'
      FieldName = 'DT_US_CANCELOU'
      EditMask = '!99/99/0000;1;_'
    end
    object StringField114: TStringField
      DisplayLabel = 'Observa'#231#227'o'
      FieldName = 'OBS_C'
      Size = 60
    end
    object StringField115: TStringField
      DisplayLabel = 'Observa'#231#227'o para Cr'#233'dito'
      FieldName = 'OBS_PARACREDITO'
      Size = 50
    end
    object DateTimeField42: TDateTimeField
      DisplayLabel = 'Data Original do Cr'#233'dito'
      FieldName = 'DTORIGINAL_C'
      EditMask = '!99/99/0000;1;_'
    end
    object StringField116: TStringField
      DisplayLabel = 'Nome Dependente'
      FieldName = 'DEPENDENTE'
      Size = 35
    end
    object IntegerField103: TIntegerField
      DisplayLabel = 'Codigo Caixa ECF'
      FieldName = 'COD_TERMINAL'
    end
    object IntegerField104: TIntegerField
      DisplayLabel = 'COO N'#227'o Fiscal'
      FieldName = 'COONAOFISCAL'
    end
    object StringField117: TStringField
      DisplayLabel = 'Num Serie ECF'
      FieldName = 'NSERIEECF'
    end
    object IntegerField105: TIntegerField
      Tag = 1
      DisplayLabel = 'Codigo Empresa'
      FieldName = 'CODIGO_EMP'
      Required = True
    end
    object StringField118: TStringField
      Tag = 1
      DisplayLabel = 'S'
      FieldName = 'SELEC'
      FixedChar = True
      Size = 1
    end
    object StringField119: TStringField
      Tag = 1
      DisplayLabel = 'Controle'
      FieldKind = fkLookup
      FieldName = 'NOME_CTRL'
      LookupDataSet = cdsCtrl
      LookupKeyFields = 'CODIGO_CTRL'
      LookupResultField = 'NOME_CTRL'
      KeyFields = 'CODIGO_CTRL'
      Visible = False
      Size = 35
      Lookup = True
    end
    object StringField120: TStringField
      DisplayLabel = 'Recebendo'
      FieldName = 'STATUS_CX'
      Size = 1
    end
    object IntegerField106: TIntegerField
      DisplayLabel = 'Operador Recebendo'
      FieldName = 'OP_CX'
    end
    object StringField121: TStringField
      DisplayLabel = 'Tipo Baixa'
      FieldName = 'TIP_BAIXA'
      FixedChar = True
      Size = 1
    end
    object IntegerField107: TIntegerField
      DisplayLabel = 'Numero do Carne'
      FieldName = 'IDCARNE'
    end
    object IntegerField108: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Obs'
      FieldName = 'COD_OBS'
    end
    object FloatField38: TFloatField
      DisplayLabel = 'Valor Comiss'#227'o'
      FieldName = 'VL_BAIXA_COMISSAO'
      DisplayFormat = '#0.000'
    end
    object FloatField39: TFloatField
      DisplayLabel = 'Valor Comiss'#227'o Gerente'
      FieldName = 'VL_BAIXA_COMISSAO_GER'
      DisplayFormat = '#0.000'
    end
    object IntegerField109: TIntegerField
      DisplayLabel = 'Status Adm'
      FieldName = 'STATUS_ADM'
    end
    object StringField123: TStringField
      DisplayLabel = 'Descri'#231#227'o Status Adm'
      FieldName = 'DESC_STATUS_ADM'
      Size = 50
    end
    object StringField124: TStringField
      DisplayLabel = 'NSU RO Adm'
      FieldName = 'NSU_RO_ADM'
      Size = 15
    end
    object IntegerField110: TIntegerField
      DisplayLabel = 'Num RO Adm'
      FieldName = 'RO_ADM'
    end
    object StringField125: TStringField
      DisplayLabel = 'Cod Terminal Adm'
      FieldName = 'COD_TERMINAL_ADM'
      Size = 10
    end
    object IntegerField111: TIntegerField
      DisplayLabel = 'Tipo Produto Adm'
      FieldName = 'TIPO_PROD_ADM'
    end
    object StringField126: TStringField
      DisplayLabel = 'Descri'#231#227'o Produto Adm'
      FieldName = 'DESC_TIPO_PROD_ADM'
      Size = 50
    end
    object IntegerField112: TIntegerField
      DisplayLabel = 'Cod Bandeira'
      FieldName = 'COD_BANDEIRA_ADM'
    end
    object StringField127: TStringField
      DisplayLabel = 'Descri'#231#227'o Bandeira Adm'
      FieldName = 'DESC_BANDEIRA'
      Size = 50
    end
    object StringField128: TStringField
      DisplayLabel = 'Indicador Antecipa'#231#227'o Adm'
      FieldName = 'IND_ANTEC_RO_ADM'
      Size = 50
    end
    object IntegerField113: TIntegerField
      DisplayLabel = 'Indicador Origem Ajuste Adm'
      FieldName = 'IND_OR_AJUSTE_ADM'
    end
    object StringField129: TStringField
      DisplayLabel = 'Descri'#231#227'o Origem Ajuste Adm'
      FieldName = 'IND_OR_DESC_AJUSTE'
      Size = 50
    end
    object FloatField40: TFloatField
      DisplayLabel = 'Comiss'#227'o Cart'#227'o Adm'
      FieldName = 'TAXA_CARTAO_CRED'
    end
    object FloatField41: TFloatField
      DisplayLabel = 'Tarifa Adm'
      FieldName = 'TARIFA_CARTAO_CRED'
    end
    object IntegerField114: TIntegerField
      DisplayLabel = 'Lote Baixa Adm'
      FieldName = 'IDBAIXA_CARTAO'
    end
    object cdsCtrlCrConciliacaoIDDEV_CARTAO: TIntegerField
      DisplayLabel = 'Lote Dev Adm'
      FieldName = 'IDDEV_CARTAO'
    end
    object IntegerField115: TIntegerField
      DisplayLabel = 'Controle p/ Cr'#233'd Baixa Adm'
      FieldName = 'CODIGO_CTRL_CRED'
    end
    object IntegerField116: TIntegerField
      DisplayLabel = 'Cod Adm Cartao'
      FieldName = 'COD_ADM'
    end
    object IntegerField117: TIntegerField
      DisplayLabel = 'Usuario que cadastrou'
      FieldName = 'US_CAD'
    end
    object DateTimeField43: TDateTimeField
      Tag = 1
      DisplayLabel = 'Data Prev Rec'
      FieldName = 'DATA_PREV_REC'
    end
    object IntegerField118: TIntegerField
      DisplayLabel = 'Cod Cobrebem'
      FieldName = 'COD_COBREBEM'
    end
    object DateTimeField44: TDateTimeField
      Tag = 1
      DisplayLabel = 'Data Retorno'
      FieldName = 'DATA_RETORNO_QUITACAO'
    end
    object DateTimeField45: TDateTimeField
      Tag = 1
      DisplayLabel = 'Data Baixa Comissao'
      FieldName = 'DT_BAIXA_COMISSAO'
    end
    object DateTimeField46: TDateTimeField
      DisplayLabel = 'Data Desnegativa'#231#227'o'
      FieldName = 'DATA_DESBARRAMENTO'
    end
    object FloatField42: TFloatField
      DisplayLabel = 'Valor Venda Cartao'
      FieldName = 'VL_VENDA'
      DisplayFormat = '##0.00'
    end
    object IntegerField119: TIntegerField
      DisplayLabel = 'Cod Unificada'
      FieldName = 'COD_EMP_MULT'
    end
    object IntegerField120: TIntegerField
      DisplayLabel = 'Usuario que Baixou'
      FieldName = 'US_BX'
    end
    object FloatField43: TFloatField
      DisplayLabel = 'Valor Cont'#225'bil'
      FieldName = 'VL_CONTABIL'
      DisplayFormat = '##0.00'
    end
    object IntegerField121: TIntegerField
      DisplayLabel = 'Lote Contrapartida Lanc'
      FieldName = 'COD_CONTRAPARTIDA'
    end
    object IntegerField122: TIntegerField
      DisplayLabel = 'Lote Contrapartida Ctp'
      FieldName = 'COD_CONTRAPARTIDA_CTP'
    end
    object IntegerField123: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Emp Lote'
      FieldName = 'COD_EMP_LOTE'
    end
    object StringField136: TStringField
      DisplayLabel = 'Debito ou Credito'
      FieldName = 'DEB_CRED'
      FixedChar = True
      Size = 1
    end
    object StringField130: TStringField
      DisplayLabel = 'Arquivo'
      FieldName = 'ARQ_EXTRATO_ADM'
      Size = 255
    end
    object cdsCtrlCrConciliacaoDATA_ARQUIVO: TDateTimeField
      DisplayLabel = 'Data Arquivo'
      FieldName = 'DATA_ARQUIVO'
    end
  end
  object dsCtrlCrConciliacao: TDataSource
    DataSet = cdsCtrlCrConciliacao
    Left = 1784
    Top = 455
  end
  object qrAdmCartaoConciliacao: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      
        'select 0 cod_empresa, 0 codigo, '#39'Todos'#39' identificacao_emp from r' +
        'db$database'
      'union all'
      
        'select conciliacao_estab_emp.cod_estab, conciliacao_estab_emp.co' +
        'digo, empresa.identificacao_emp  from conciliacao_estab_emp'
      
        'inner join empresa on empresa.cod_empresa = conciliacao_estab_em' +
        'p.cod_estab'
      'order by 1, 2')
    Left = 1357
    Top = 520
  end
  object dspAdmCartaoConciliacao: TDataSetProvider
    DataSet = qrAdmCartaoConciliacao
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1357
    Top = 576
  end
  object cdsAdmCartaoConciliacao: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspAdmCartaoConciliacao'
    BeforeOpen = cdsCtrlChBeforeOpen
    Left = 1357
    Top = 624
    object cdsAdmCartaoConciliacaoORDEM: TStringField
      FieldName = 'ORDEM'
      Required = True
      Size = 30
    end
    object cdsAdmCartaoConciliacaoID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsAdmCartaoConciliacaoNOME: TStringField
      FieldName = 'NOME'
      Size = 30
    end
    object cdsAdmCartaoConciliacaoCOD_ADM: TIntegerField
      FieldName = 'COD_ADM'
      Required = True
    end
  end
  object dsAdmCartaoConciliacao: TDataSource
    DataSet = cdsAdmCartaoConciliacao
    Left = 1357
    Top = 680
  end
  object qrConciliacaoUnificadas: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      
        'select cod_empresa, coalesce(identificacao_emp, nome_emp) identi' +
        'ficacao_emp from empresa'
      'where ativo = 1')
    Left = 1357
    Top = 72
  end
  object dspConciliacaoUnificadas: TDataSetProvider
    DataSet = qrConciliacaoUnificadas
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1357
    Top = 128
  end
  object cdsConciliacaoUnificadas: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspConciliacaoUnificadas'
    BeforeOpen = cdsCtrlChBeforeOpen
    Left = 1357
    Top = 176
    object cdsConciliacaoUnificadasCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsConciliacaoUnificadasIDENTIFICACAO_EMP: TStringField
      FieldName = 'IDENTIFICACAO_EMP'
      Size = 64
    end
  end
  object dsConciliacaoUnificadas: TDataSource
    DataSet = cdsConciliacaoUnificadas
    Left = 1357
    Top = 232
  end
  object qrConciliacaoBandeira: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      
        'select '#39'A'#39' ordem, id, nome, 0 cod_bandeira from conciliacao_band' +
        'eira')
    Left = 1837
    Top = 528
  end
  object dspConciliacaoBandeira: TDataSetProvider
    DataSet = qrConciliacaoBandeira
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1837
    Top = 584
  end
  object cdsConciliacaoBandeira: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspConciliacaoBandeira'
    BeforeOpen = cdsCtrlChBeforeOpen
    Left = 1837
    Top = 632
    object cdsConciliacaoBandeiraORDEM: TStringField
      FieldName = 'ORDEM'
      FixedChar = True
      Size = 1
    end
    object cdsConciliacaoBandeiraID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsConciliacaoBandeiraNOME: TStringField
      FieldName = 'NOME'
      Size = 30
    end
    object cdsConciliacaoBandeiraCOD_BANDEIRA: TIntegerField
      FieldName = 'COD_BANDEIRA'
    end
  end
  object dsConciliacaoBandeira: TDataSource
    DataSet = cdsConciliacaoBandeira
    Left = 1837
    Top = 688
  end
  object cdsConciliacaoPendencias: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspConciliacaoPendencias'
    BeforeOpen = cdsCtrlChBeforeOpen
    Left = 1221
    Top = 400
    object cdsConciliacaoPendenciasSEL: TStringField
      DisplayLabel = 'Sel'
      FieldKind = fkInternalCalc
      FieldName = 'SEL'
      Size = 1
    end
    object cdsConciliacaoPendenciasESTABLISHMENT_NUMBER: TStringField
      DisplayLabel = 'Estabelecimento'
      FieldName = 'ESTABLISHMENT_NUMBER'
      Size = 30
    end
    object cdsConciliacaoPendenciasDATA: TDateTimeField
      DisplayLabel = 'Data'
      FieldName = 'DATA'
    end
    object StringField88: TStringField
      DisplayLabel = 'Num Doc/NSU/CV'
      FieldName = 'NSU'
    end
    object StringField89: TStringField
      DisplayLabel = 'Num Aut Cartao'
      FieldName = 'AUTHORIZATION_NUMBER'
    end
    object IntegerField127: TIntegerField
      DisplayLabel = 'Num Parc'
      FieldName = 'INSTALLMENT_NUMBER'
    end
    object IntegerField128: TIntegerField
      DisplayLabel = 'Qtde Parc'
      FieldName = 'INSTALLMENTS_TOTAL'
    end
    object IntegerField78: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Tipo'
      FieldName = 'TYPE_'
    end
    object StringField91: TStringField
      Tag = 1
      DisplayLabel = 'Tipo'
      FieldName = 'TYPE_DESCRIPTION'
      Size = 30
    end
    object IntegerField79: TIntegerField
      Tag = 1
      DisplayLabel = 'Adquirente Id'
      FieldName = 'ACQUIRER_ID'
    end
    object StringField92: TStringField
      DisplayLabel = 'Adquirente'
      FieldName = 'ACQUIRER_NAME'
      Size = 30
    end
    object IntegerField124: TIntegerField
      Tag = 1
      DisplayLabel = 'Bandeira Id'
      FieldName = 'BRAND_ID'
    end
    object StringField95: TStringField
      DisplayLabel = 'Bandeira'
      FieldName = 'BRAND_NAME'
      Size = 30
    end
    object IntegerField125: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Evento'
      FieldName = 'EVENT_TYPE'
    end
    object StringField96: TStringField
      DisplayLabel = 'Evento'
      FieldName = 'EVENT_TYPE_DESCRIPTION'
      Size = 150
    end
    object StringField98: TStringField
      DisplayLabel = 'Descricao'
      FieldName = 'DESCRIPTION'
      Size = 250
    end
    object DateTimeField29: TDateTimeField
      DisplayLabel = 'Data Cadastro'
      FieldName = 'DATA_REC_C'
      EditMask = '!99/99/0000;1;_'
    end
    object DateTimeField30: TDateTimeField
      DisplayLabel = 'Data Vencimento'
      FieldName = 'DATA_VENC_C'
      EditMask = '!99/99/0000;1;_'
    end
    object FloatField48: TFloatField
      DisplayLabel = 'Valor Credito'
      FieldName = 'VALOR_C'
      DisplayFormat = '##0.00'
    end
    object cdsConciliacaoPendenciasVALOR_LIQUIDO: TFloatField
      DisplayLabel = 'Valor Liquido Cred'
      FieldName = 'VALOR_LIQUIDO'
      ReadOnly = True
      DisplayFormat = '##0.00'
    end
    object cdsConciliacaoPendenciasVALOR_ORIGINAL: TFloatField
      Tag = 1
      DisplayLabel = 'Valor Original Cred'
      FieldName = 'VALOR_ORIGINAL'
      DisplayFormat = '##0.00'
    end
    object FloatField29: TFloatField
      DisplayLabel = 'Valor Liquido'
      FieldName = 'EVENT_NET_AMOUNT'
      DisplayFormat = '##0.00'
    end
    object FloatField44: TFloatField
      DisplayLabel = 'Taxa no pagamento (%)'
      FieldName = 'TAX'
      DisplayFormat = '##0.00'
    end
    object FloatField45: TFloatField
      Tag = 1
      DisplayLabel = 'Taxa na venda (%)'
      FieldName = 'SALE_TAX'
      DisplayFormat = '##0.00'
    end
    object FloatField46: TFloatField
      Tag = 1
      DisplayLabel = 'Taxa cadastrada confere (%)'
      FieldName = 'CUSTOMER_TAX'
      DisplayFormat = '##0.00'
    end
    object cdsConciliacaoPendenciasTAXA_CRED: TFloatField
      DisplayLabel = 'Taxa aplicada sistema (%)'
      FieldName = 'TAXA_CRED'
      DisplayFormat = '##0.00'
    end
    object IntegerField129: TIntegerField
      DisplayLabel = 'Num Banco'
      FieldName = 'BANK_NUMBER'
    end
    object StringField131: TStringField
      DisplayLabel = 'Banco'
      FieldName = 'BANK_NAME'
      Size = 30
    end
    object IntegerField130: TIntegerField
      DisplayLabel = 'Agencia'
      FieldName = 'BRANCH_NUMBER'
    end
    object StringField132: TStringField
      DisplayLabel = 'Numero Conta'
      FieldName = 'ACCOUNT_NUMBER'
    end
    object FloatField47: TFloatField
      DisplayLabel = 'Num Conta'
      FieldName = 'N_CONTA_PLC'
    end
    object StringField133: TStringField
      DisplayLabel = 'Descri'#231#227'o de Contas'
      FieldName = 'DESC_PLC'
      FixedChar = True
      Size = 30
    end
    object IntegerField131: TIntegerField
      DisplayLabel = 'Cod Controle'
      FieldName = 'CODIGO_CTRL'
    end
    object StringField134: TStringField
      DisplayLabel = 'Controle'
      FieldName = 'NOME_CTRL'
      Size = 35
    end
    object StringField135: TStringField
      DisplayLabel = 'Num Documento'
      FieldName = 'N_DOC_C'
      FixedChar = True
    end
    object IntegerField133: TIntegerField
      DisplayLabel = 'Num Doc Venda'
      FieldName = 'N_DOC_V'
    end
    object StringField137: TStringField
      DisplayLabel = 'Tipo Doc Venda'
      FieldName = 'TP_DOC_V'
      FixedChar = True
      Size = 6
    end
    object StringField138: TStringField
      DisplayLabel = 'Status Cred'
      FieldName = 'STATUS_C'
      FixedChar = True
      Size = 10
    end
    object cdsConciliacaoPendenciasDATQ_C: TDateTimeField
      DisplayLabel = 'Data Quitacao'
      FieldName = 'DATQ_C'
    end
    object IntegerField132: TIntegerField
      DisplayLabel = 'Cod Cred'
      FieldName = 'COD_CRED'
    end
    object IntegerField73: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
      Required = True
    end
    object StringField104: TStringField
      DisplayLabel = 'Situacao'
      FieldName = 'BANK_RECON_DESCRIPTION'
      FixedChar = True
      Size = 25
    end
    object IntegerField126: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Situacao'
      FieldName = 'BANK_RECON_STATUS'
    end
    object IntegerField134: TIntegerField
      Tag = 1
      FieldName = 'CODIGO_CTRL_TX'
    end
    object StringField139: TStringField
      Tag = 1
      FieldName = 'NOME_CTRL_TX'
      FixedChar = True
      Size = 1
    end
    object FloatField49: TFloatField
      Tag = 1
      DisplayLabel = 'Num Conta Taxa Cartao'
      FieldName = 'N_CONTA_PLC_TX_CARTAO'
    end
    object IntegerField74: TIntegerField
      DisplayLabel = 'Cod Unificada'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsConciliacaoPendenciasIDENTIFICACAO_EMP: TStringField
      DisplayLabel = 'Unificada'
      FieldName = 'IDENTIFICACAO_EMP'
      Size = 64
    end
    object FloatField26: TFloatField
      DisplayLabel = 'Valor Total Bruto'
      FieldName = 'GROSS_AMOUNT'
      DisplayFormat = '##0.00'
    end
    object FloatField31: TFloatField
      DisplayLabel = 'Valor Liquido Lote'
      FieldName = 'BATCH_NET_AMOUNT'
      DisplayFormat = '##0.00'
    end
    object cdsConciliacaoPendenciasCOD_TERMINAL_ADM: TStringField
      DisplayLabel = 'Cod Terminal'
      FieldName = 'COD_TERMINAL_ADM'
      Size = 10
    end
    object cdsConciliacaoPendenciasDESC_TERM_ADM: TStringField
      DisplayLabel = 'Terminal'
      FieldName = 'DESC_TERM_ADM'
      Size = 30
    end
    object cdsConciliacaoPendenciasCOD_ADM: TIntegerField
      DisplayLabel = 'Cod Adm'
      FieldName = 'COD_ADM'
    end
    object cdsConciliacaoPendenciasDESCRICAO_ADM: TStringField
      DisplayLabel = 'Adm'
      FieldName = 'DESCRICAO_ADM'
      Size = 30
    end
    object cdsConciliacaoPendenciasCOD_BANDEIRA_ADM: TIntegerField
      DisplayLabel = 'Cod Bandeira Adm'
      FieldName = 'COD_BANDEIRA_ADM'
    end
    object cdsConciliacaoPendenciasDESC_BANDEIRA_ADM: TStringField
      DisplayLabel = 'Bandeira Adm'
      FieldName = 'DESC_BANDEIRA_ADM'
      Size = 32
    end
    object cdsConciliacaoPendenciasPIX_ID: TStringField
      DisplayLabel = 'Pix Id'
      FieldName = 'PIX_ID'
      ReadOnly = True
      Size = 36
    end
    object cdsConciliacaoPendenciasFORM_PAG_COD: TStringField
      DisplayLabel = 'Forma Pag Cod'
      FieldName = 'FORM_PAG_COD'
      ReadOnly = True
      Size = 5
    end
    object cdsConciliacaoPendenciasFORM_PAG: TStringField
      DisplayLabel = 'Form Pag'
      FieldName = 'FORM_PAG'
      ReadOnly = True
      Size = 100
    end
    object cdsConciliacaoPendenciasCOD_AJUSTE_COD: TStringField
      DisplayLabel = 'Ajuste Cod'
      FieldName = 'COD_AJUSTE_COD'
      ReadOnly = True
      Size = 5
    end
    object cdsConciliacaoPendenciasCOD_AJUSTE: TStringField
      DisplayLabel = 'Ajuste'
      FieldName = 'COD_AJUSTE'
      ReadOnly = True
      Size = 200
    end
    object cdsConciliacaoPendenciasBANDEIRA_COD: TStringField
      DisplayLabel = 'Bandeira Cod'
      FieldName = 'BANDEIRA_COD'
      ReadOnly = True
      Size = 5
    end
    object cdsConciliacaoPendenciasBANDEIRA: TStringField
      DisplayLabel = 'Bandeira'
      FieldName = 'BANDEIRA'
      ReadOnly = True
      Size = 30
    end
    object cdsConciliacaoPendenciasSTATUS_PAG_COD: TStringField
      DisplayLabel = 'Status Pag Cod'
      FieldName = 'STATUS_PAG_COD'
      ReadOnly = True
      Size = 5
    end
    object cdsConciliacaoPendenciasSTATUS_PAG: TStringField
      DisplayLabel = 'Status Pag'
      FieldName = 'STATUS_PAG'
      ReadOnly = True
      Size = 100
    end
    object cdsConciliacaoPendenciasSTATUS_PAG_ST: TStringField
      DisplayLabel = 'Status Pag St'
      FieldName = 'STATUS_PAG_ST'
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object cdsConciliacaoPendenciasTIPO_LANCAMENTO_COD: TStringField
      DisplayLabel = 'Tipo Lancamento Cod'
      FieldName = 'TIPO_LANCAMENTO_COD'
      ReadOnly = True
      Size = 5
    end
    object cdsConciliacaoPendenciasTIPO_LANCAMENTO: TStringField
      DisplayLabel = 'Tipo Lancamento'
      FieldName = 'TIPO_LANCAMENTO'
      ReadOnly = True
      Size = 150
    end
    object cdsConciliacaoPendenciasTIPO_LIQUIDACAO_COD: TStringField
      DisplayLabel = 'Tipo Liquidacao Cod'
      FieldName = 'TIPO_LIQUIDACAO_COD'
      ReadOnly = True
      Size = 5
    end
    object cdsConciliacaoPendenciasTIPO_LIQUIDACAO: TStringField
      DisplayLabel = 'Tipo Liquidacao'
      FieldName = 'TIPO_LIQUIDACAO'
      ReadOnly = True
      Size = 30
    end
    object cdsConciliacaoPendenciasTIPO_ANTECIPACAO_COD: TStringField
      DisplayLabel = 'Tipo Antecipacao Cod'
      FieldName = 'TIPO_ANTECIPACAO_COD'
      ReadOnly = True
      Size = 5
    end
    object cdsConciliacaoPendenciasTIPO_ANTECIPACAO: TStringField
      DisplayLabel = 'Tipo Antecipacao'
      FieldName = 'TIPO_ANTECIPACAO'
      ReadOnly = True
      Size = 30
    end
    object cdsConciliacaoPendenciasTIPO_CARTAO_COD: TStringField
      DisplayLabel = 'Tipo Cartao Cod'
      FieldName = 'TIPO_CARTAO_COD'
      ReadOnly = True
      Size = 5
    end
    object cdsConciliacaoPendenciasTIPO_CARTAO: TStringField
      DisplayLabel = 'Tipo Cartao'
      FieldName = 'TIPO_CARTAO'
      ReadOnly = True
      Size = 50
    end
    object cdsConciliacaoPendenciasMOTIVO_REJ_COD: TStringField
      DisplayLabel = 'Motivo Rejeicao Cod'
      FieldName = 'MOTIVO_REJ_COD'
      ReadOnly = True
      Size = 5
    end
    object cdsConciliacaoPendenciasMOTIVO_REJ: TStringField
      DisplayLabel = 'Motivo Rejeicao'
      FieldName = 'MOTIVO_REJ'
      ReadOnly = True
      Size = 50
    end
    object cdsConciliacaoPendenciasGRUPO_CARTAO_COD: TStringField
      DisplayLabel = 'Grupo Cartao Cod'
      FieldName = 'GRUPO_CARTAO_COD'
      ReadOnly = True
      Size = 5
    end
    object cdsConciliacaoPendenciasGRUPO_CARTAO: TStringField
      DisplayLabel = 'Grupo Cartao'
      FieldName = 'GRUPO_CARTAO'
      ReadOnly = True
      Size = 100
    end
    object cdsConciliacaoPendenciasTIPO_TRANSACAO_COD: TStringField
      DisplayLabel = 'Tipo Transacao Cod'
      FieldName = 'TIPO_TRANSACAO_COD'
      ReadOnly = True
      Size = 5
    end
    object cdsConciliacaoPendenciasTIPO_TRANSACAO: TStringField
      DisplayLabel = 'Tipo Transacao'
      FieldName = 'TIPO_TRANSACAO'
      ReadOnly = True
      Size = 30
    end
    object cdsConciliacaoPendenciasSTATUS_TRANSF_COD: TStringField
      DisplayLabel = 'Status Transf Cod'
      FieldName = 'STATUS_TRANSF_COD'
      ReadOnly = True
      Size = 5
    end
    object cdsConciliacaoPendenciasSTATUS_TRANSF: TStringField
      DisplayLabel = 'Status Transf'
      FieldName = 'STATUS_TRANSF'
      ReadOnly = True
      Size = 50
    end
    object cdsConciliacaoPendenciasSTATUS_TRANSF_ST: TStringField
      DisplayLabel = 'Status Transf St'
      FieldName = 'STATUS_TRANSF_ST'
      FixedChar = True
      Size = 1
    end
    object cdsConciliacaoPendenciasORIGEM_AJUSTE_COD: TStringField
      DisplayLabel = 'Origem Ajuste Cod'
      FieldName = 'ORIGEM_AJUSTE_COD'
      ReadOnly = True
      Size = 5
    end
    object cdsConciliacaoPendenciasORIGEM_AJUSTE: TStringField
      DisplayLabel = 'Origem Ajuste'
      FieldName = 'ORIGEM_AJUSTE'
      ReadOnly = True
      Size = 50
    end
    object DateTimeField28: TDateTimeField
      DisplayLabel = 'Data Mov'
      FieldName = 'DATE_'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsConciliacaoPendenciasREQUEST_DATE: TDateTimeField
      DisplayLabel = 'Data Orig'
      FieldName = 'REQUEST_DATE'
      ReadOnly = True
    end
    object cdsConciliacaoPendenciasEFFECTED_DATE: TDateTimeField
      DisplayLabel = 'Data Efetivada'
      FieldName = 'EFFECTED_DATE'
      ReadOnly = True
    end
    object cdsConciliacaoPendenciasPAYMENT_DATE: TDateTimeField
      DisplayLabel = 'Data Pag'
      FieldName = 'PAYMENT_DATE'
      ReadOnly = True
    end
    object cdsConciliacaoPendenciasBANK_SHIPPING_DATE: TDateTimeField
      DisplayLabel = 'Data Env Banco'
      FieldName = 'BANK_SHIPPING_DATE'
      ReadOnly = True
    end
    object cdsConciliacaoPendenciasARQUIVO: TStringField
      DisplayLabel = 'Arquivo'
      FieldName = 'ARQUIVO'
      ReadOnly = True
      Size = 255
    end
    object cdsConciliacaoPendenciasDATA_ARQUIVO: TDateTimeField
      DisplayLabel = 'Data Arquivo'
      FieldName = 'DATA_ARQUIVO'
      ReadOnly = True
    end
  end
  object qrAdmCartaoConciliacao2: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select conciliacao_adquirente.nome as ordem,'
      'conciliacao_adquirente.id,'
      'conciliacao_adquirente.nome,'
      
        'coalesce((select first 1 adm_cartao.cod_adquirente from adm_cart' +
        'ao'
      'where adm_cartao.cod_adquirente = conciliacao_adquirente.id'
      'and adm_cartao.cod_empresa = conciliacao_adquirente.cod_empresa'
      
        'and adm_cartao.ativo = 1), 0) cod_adm from conciliacao_adquirent' +
        'e'
      'where conciliacao_adquirente.cod_empresa = 1'
      'and conciliacao_adquirente.ativo = 1')
    Left = 1493
    Top = 520
  end
  object dspAdmCartaoConciliacao2: TDataSetProvider
    DataSet = qrAdmCartaoConciliacao2
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1493
    Top = 576
  end
  object cdsAdmCartaoConciliacao2: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspAdmCartaoConciliacao2'
    BeforeOpen = cdsCtrlChBeforeOpen
    Left = 1493
    Top = 624
    object StringField140: TStringField
      FieldName = 'ORDEM'
      Required = True
      Size = 30
    end
    object IntegerField135: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object StringField141: TStringField
      FieldName = 'NOME'
      Size = 30
    end
    object IntegerField136: TIntegerField
      FieldName = 'COD_ADM'
      Required = True
    end
  end
  object dsAdmCartaoConciliacao2: TDataSource
    DataSet = cdsAdmCartaoConciliacao2
    Left = 1493
    Top = 680
  end
  object qrConciliacaoUnificadas2: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      
        'select cod_empresa, coalesce(identificacao_emp, nome_emp) identi' +
        'ficacao_emp from empresa'
      'where ativo = 1')
    Left = 1485
    Top = 72
  end
  object dspConciliacaoUnificadas2: TDataSetProvider
    DataSet = qrConciliacaoUnificadas2
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1485
    Top = 128
  end
  object cdsConciliacaoUnificadas2: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspConciliacaoUnificadas2'
    BeforeOpen = cdsCtrlChBeforeOpen
    Left = 1485
    Top = 176
    object IntegerField137: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object StringField142: TStringField
      FieldName = 'IDENTIFICACAO_EMP'
      Size = 64
    end
  end
  object dsConciliacaoUnificadas2: TDataSource
    DataSet = cdsConciliacaoUnificadas2
    Left = 1485
    Top = 232
  end
  object qrConciliacaoBandeira2: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      
        'select '#39'A'#39' ordem, id, nome, 0 cod_bandeira from conciliacao_band' +
        'eira')
    Left = 1965
    Top = 528
  end
  object dspConciliacaoBandeira2: TDataSetProvider
    DataSet = qrConciliacaoBandeira2
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1965
    Top = 584
  end
  object cdsConciliacaoBandeira2: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspConciliacaoBandeira2'
    BeforeOpen = cdsCtrlChBeforeOpen
    Left = 1965
    Top = 632
    object StringField143: TStringField
      FieldName = 'ORDEM'
      FixedChar = True
      Size = 1
    end
    object IntegerField138: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object StringField144: TStringField
      FieldName = 'NOME'
      Size = 30
    end
    object cdsConciliacaoBandeira2COD_BANDEIRA: TIntegerField
      FieldName = 'COD_BANDEIRA'
    end
  end
  object dsConciliacaoBandeira2: TDataSource
    DataSet = cdsConciliacaoBandeira2
    Left = 1965
    Top = 688
  end
  object qrCtrlCrConciliacao2: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select COD_CRED, CODIGO_EMP, COD_EMP_MULT, '
      'DATA_REC_C, DATA_VENC_C, '
      'N_DOCNSU_ADM, N_AUT_CART, '
      'NPARCELA, QTDE_PARC, '
      'CODIGO_CTRL, NOME_CTRL, '
      'N_DOC_V, N_DOC_C, TP_DOC_V, '
      'VALOR_C, VALOR_LIQUIDO, VALOR_ORIGINAL,'
      'DATQ_C, STATUS_C, TAXA_CRED,'
      'COD_CLIENTE, '
      'NOME_CLIENTE, '
      'COD_TERMINAL_ADM, DESC_TERM_ADM, COD_ADM, DESCRICAO_ADM, '
      'COD_BANDEIRA_ADM, DESC_BANDEIRA_ADM,'
      'NOME_C, IDENTIFICACAO_EMP '
      'from VW_CONCILIACAO_PENDENCIAS_CRED '
      'where DATA_REC_C = '#39'01/01/1899'#39
      'and CODIGO_EMP = 1')
    Left = 1896
    Top = 295
  end
  object dspCtrlCrConciliacao2: TDataSetProvider
    DataSet = qrCtrlCrConciliacao2
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1896
    Top = 351
  end
  object cdsCtrlCrConciliacao2: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspCtrlCrConciliacao2'
    BeforeOpen = cdsCtrlChBeforeOpen
    Left = 1896
    Top = 399
    object cdsCtrlCrConciliacao2DATA_VENC_C: TDateTimeField
      DisplayLabel = 'Data Vencimento'
      FieldName = 'DATA_VENC_C'
    end
    object cdsCtrlCrConciliacao2N_DOCNSU_ADM: TStringField
      DisplayLabel = 'Num Doc/NSU/CV'
      FieldName = 'N_DOCNSU_ADM'
      Size = 10
    end
    object cdsCtrlCrConciliacao2N_AUT_CART: TStringField
      DisplayLabel = 'Num Aut Cartao'
      FieldName = 'N_AUT_CART'
      FixedChar = True
    end
    object cdsCtrlCrConciliacao2NPARCELA: TIntegerField
      DisplayLabel = 'Num Parc'
      FieldName = 'NPARCELA'
    end
    object cdsCtrlCrConciliacao2QTDE_PARC: TIntegerField
      DisplayLabel = 'Qtde Parc'
      FieldName = 'QTDE_PARC'
    end
    object cdsCtrlCrConciliacao2VALOR_C: TFloatField
      DisplayLabel = 'Valor Credito'
      FieldName = 'VALOR_C'
      DisplayFormat = '##0.00'
    end
    object cdsCtrlCrConciliacao2VALOR_LIQUIDO: TFloatField
      DisplayLabel = 'Valor Liquido'
      FieldName = 'VALOR_LIQUIDO'
      DisplayFormat = '##0.00'
    end
    object cdsCtrlCrConciliacao2VALOR_ORIGINAL: TFloatField
      Tag = 1
      DisplayLabel = 'Valor Original'
      FieldName = 'VALOR_ORIGINAL'
      DisplayFormat = '##0.00'
    end
    object cdsCtrlCrConciliacao2NOME_CTRL: TStringField
      DisplayLabel = 'Controle'
      FieldName = 'NOME_CTRL'
      Size = 35
    end
    object cdsCtrlCrConciliacao2N_DOC_C: TStringField
      DisplayLabel = 'Num Documento'
      FieldName = 'N_DOC_C'
      FixedChar = True
    end
    object cdsCtrlCrConciliacao2N_DOC_V: TIntegerField
      DisplayLabel = 'Num Doc Venda'
      FieldName = 'N_DOC_V'
    end
    object cdsCtrlCrConciliacao2TP_DOC_V: TStringField
      DisplayLabel = 'Tipo Doc Venda'
      FieldName = 'TP_DOC_V'
      FixedChar = True
      Size = 6
    end
    object cdsCtrlCrConciliacao2DATA_REC_C: TDateTimeField
      DisplayLabel = 'Data Cadastro'
      FieldName = 'DATA_REC_C'
    end
    object cdsCtrlCrConciliacao2TAXA_CRED: TFloatField
      DisplayLabel = 'Taxa cadastrada sistema (%)'
      FieldName = 'TAXA_CRED'
      ReadOnly = True
      DisplayFormat = '##0.00'
    end
    object cdsCtrlCrConciliacao2COD_CLIENTE: TIntegerField
      DisplayLabel = 'Cod Cliente'
      FieldName = 'COD_CLIENTE'
    end
    object cdsCtrlCrConciliacao2NOME_CLIENTE: TStringField
      DisplayLabel = 'Nome Cliente'
      FieldName = 'NOME_CLIENTE'
      FixedChar = True
      Size = 35
    end
    object cdsCtrlCrConciliacao2CODIGO_CTRL: TIntegerField
      DisplayLabel = 'Cod Controle'
      FieldName = 'CODIGO_CTRL'
      Required = True
    end
    object cdsCtrlCrConciliacao2COD_TERMINAL_ADM: TStringField
      DisplayLabel = 'Cod Terminal'
      FieldName = 'COD_TERMINAL_ADM'
      Size = 10
    end
    object cdsCtrlCrConciliacao2DESC_TERM_ADM: TStringField
      DisplayLabel = 'Terminal'
      FieldName = 'DESC_TERM_ADM'
      Size = 30
    end
    object cdsCtrlCrConciliacao2COD_ADM: TIntegerField
      DisplayLabel = 'Cod Adm'
      FieldName = 'COD_ADM'
    end
    object cdsCtrlCrConciliacao2DESCRICAO_ADM: TStringField
      DisplayLabel = 'Adm'
      FieldName = 'DESCRICAO_ADM'
      Size = 30
    end
    object cdsCtrlCrConciliacao2COD_BANDEIRA_ADM: TIntegerField
      DisplayLabel = 'Cod Bandeira Adm'
      FieldName = 'COD_BANDEIRA_ADM'
    end
    object cdsCtrlCrConciliacao2DESC_BANDEIRA_ADM: TStringField
      DisplayLabel = 'Bandeira Adm'
      FieldName = 'DESC_BANDEIRA_ADM'
      ReadOnly = True
      Size = 32
    end
    object cdsCtrlCrConciliacao2STATUS_C: TStringField
      DisplayLabel = 'Status Cred'
      FieldName = 'STATUS_C'
      FixedChar = True
      Size = 10
    end
    object cdsCtrlCrConciliacao2DATQ_C: TDateTimeField
      DisplayLabel = 'Data Quitacao'
      FieldName = 'DATQ_C'
    end
    object cdsCtrlCrConciliacao2COD_EMP_MULT: TIntegerField
      DisplayLabel = 'Cod Unificada'
      FieldName = 'COD_EMP_MULT'
    end
    object cdsCtrlCrConciliacao2COD_CRED: TIntegerField
      DisplayLabel = 'Cod Cred'
      FieldName = 'COD_CRED'
      Required = True
    end
    object cdsCtrlCrConciliacao2NOME_C: TStringField
      DisplayLabel = 'Nome Cliente'
      FieldName = 'NOME_C'
      Size = 35
    end
    object cdsCtrlCrConciliacao2IDENTIFICACAO_EMP: TStringField
      DisplayLabel = 'Unificada'
      FieldName = 'IDENTIFICACAO_EMP'
      Size = 64
    end
    object cdsCtrlCrConciliacao2CODIGO_EMP: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'CODIGO_EMP'
      Required = True
    end
  end
  object dsCtrlCrConciliacao2: TDataSource
    DataSet = cdsCtrlCrConciliacao2
    Left = 1896
    Top = 455
  end
  object qrCtrlCrConciliacao3: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      
        'select DATA, DATE_, REQUEST_DATE, EFFECTED_DATE, PAYMENT_DATE, B' +
        'ANK_SHIPPING_DATE, ID, '
      'COD_CRED, CODIGO_EMP, COD_EMP_MULT, '
      
        'DATA_REC_C, DATA_VENC_C, N_DOCNSU_ADM, N_AUT_CART, NPARCELA, QTD' +
        'E_PARC, '
      'CODIGO_CTRL, NOME_CTRL, N_DOC_V, N_DOC_C, TP_DOC_V, '
      
        'VALOR_C, VALOR_LIQUIDO, VALOR_ORIGINAL, DATQ_C, STATUS_C, TAXA_C' +
        'RED,'
      'COD_CLIENTE, NOME_CLIENTE, '
      
        'COD_TERMINAL_ADM, DESC_TERM_ADM, COD_ADM, DESCRICAO_ADM, COD_BAN' +
        'DEIRA_ADM, DESC_BANCEIRA_ADM, '
      'ARQUIVO, DATA_ARQUIVO,'
      'NOME_C, IDENTIFICACAO_EMP '
      'from VW_CONCILIACAO_CRED_DIV_DTVALOR '
      'where DATA_VENC_C >= '#39'01/01/2000'#39
      'and DATA_VENC_C <= '#39'01/01/2000'#39
      'and CODIGO_EMP = 1'
      'AND DATQ_C IS NULL'
      'and DATA_VENC_C is not null'
      'and DATA_VENC_C < 0'
      'and coalesce(N_DOCNSU_ADM, '#39#39') <> '#39#39
      'and coalesce(N_AUT_CART, '#39#39') <> '#39#39)
    Left = 2016
    Top = 295
  end
  object dspCtrlCrConciliacao3: TDataSetProvider
    DataSet = qrCtrlCrConciliacao3
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 2016
    Top = 351
  end
  object cdsCtrlCrConciliacao3: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspCtrlCrConciliacao3'
    BeforeOpen = cdsCtrlChBeforeOpen
    Left = 2016
    Top = 399
    object cdsCtrlCrConciliacao3DATA: TDateTimeField
      DisplayLabel = 'Data'
      FieldName = 'DATA'
      ReadOnly = True
    end
    object StringField145: TStringField
      DisplayLabel = 'Num Doc/NSU/CV'
      FieldName = 'N_DOCNSU_ADM'
      Size = 10
    end
    object StringField146: TStringField
      DisplayLabel = 'Num Aut Cartao'
      FieldName = 'N_AUT_CART'
      FixedChar = True
    end
    object IntegerField139: TIntegerField
      DisplayLabel = 'Num Parc'
      FieldName = 'NPARCELA'
    end
    object IntegerField140: TIntegerField
      DisplayLabel = 'Qtde Parc'
      FieldName = 'QTDE_PARC'
    end
    object FloatField50: TFloatField
      DisplayLabel = 'Valor Credito'
      FieldName = 'VALOR_C'
      DisplayFormat = '##0.00'
    end
    object FloatField51: TFloatField
      DisplayLabel = 'Valor Liquido'
      FieldName = 'VALOR_LIQUIDO'
      DisplayFormat = '##0.00'
    end
    object cdsCtrlCrConciliacao3VALOR_ORIGINAL: TFloatField
      Tag = 1
      DisplayLabel = 'Valor Original'
      FieldName = 'VALOR_ORIGINAL'
      DisplayFormat = '##0.00'
    end
    object StringField151: TStringField
      DisplayLabel = 'Controle'
      FieldName = 'NOME_CTRL'
      Size = 35
    end
    object DateTimeField47: TDateTimeField
      DisplayLabel = 'Data Vencimento'
      FieldName = 'DATA_VENC_C'
    end
    object cdsCtrlCrConciliacao3PAYMENT_DATE: TDateTimeField
      DisplayLabel = 'Data Pag'
      FieldName = 'PAYMENT_DATE'
    end
    object StringField152: TStringField
      DisplayLabel = 'Num Documento'
      FieldName = 'N_DOC_C'
      FixedChar = True
    end
    object IntegerField143: TIntegerField
      DisplayLabel = 'Num Doc Venda'
      FieldName = 'N_DOC_V'
    end
    object StringField153: TStringField
      DisplayLabel = 'Tipo Doc Venda'
      FieldName = 'TP_DOC_V'
      FixedChar = True
      Size = 6
    end
    object DateTimeField48: TDateTimeField
      DisplayLabel = 'Data Cadastro'
      FieldName = 'DATA_REC_C'
    end
    object cdsCtrlCrConciliacao3TAXA_CRED: TFloatField
      DisplayLabel = 'Taxa cadastrada sistema (%)'
      FieldName = 'TAXA_CRED'
      ReadOnly = True
      DisplayFormat = '##0.00'
    end
    object cdsCtrlCrConciliacao3COD_CLIENTE: TIntegerField
      DisplayLabel = 'Cod Cliente'
      FieldName = 'COD_CLIENTE'
    end
    object cdsCtrlCrConciliacao3NOME_CLIENTE: TStringField
      DisplayLabel = 'Nome Cliente'
      FieldName = 'NOME_CLIENTE'
      FixedChar = True
      Size = 35
    end
    object IntegerField144: TIntegerField
      DisplayLabel = 'Cod Controle'
      FieldName = 'CODIGO_CTRL'
      Required = True
    end
    object StringField147: TStringField
      DisplayLabel = 'Cod Terminal'
      FieldName = 'COD_TERMINAL_ADM'
      Size = 10
    end
    object StringField148: TStringField
      DisplayLabel = 'Terminal'
      FieldName = 'DESC_TERM_ADM'
      Size = 30
    end
    object IntegerField141: TIntegerField
      DisplayLabel = 'Cod Adm'
      FieldName = 'COD_ADM'
    end
    object StringField149: TStringField
      DisplayLabel = 'Adm'
      FieldName = 'DESCRICAO_ADM'
      Size = 30
    end
    object IntegerField142: TIntegerField
      DisplayLabel = 'Cod Bandeira Adm'
      FieldName = 'COD_BANDEIRA_ADM'
    end
    object cdsCtrlCrConciliacao3DESC_BANCEIRA_ADM: TStringField
      DisplayLabel = 'Bandeira Adm'
      FieldName = 'DESC_BANCEIRA_ADM'
      Size = 32
    end
    object StringField154: TStringField
      DisplayLabel = 'Status Cred'
      FieldName = 'STATUS_C'
      FixedChar = True
      Size = 10
    end
    object cdsCtrlCrConciliacao3DATQ_C: TDateTimeField
      DisplayLabel = 'Data Quitacao'
      FieldName = 'DATQ_C'
    end
    object IntegerField145: TIntegerField
      DisplayLabel = 'Cod Unificada'
      FieldName = 'COD_EMP_MULT'
    end
    object IntegerField146: TIntegerField
      DisplayLabel = 'Cod Cred'
      FieldName = 'COD_CRED'
      Required = True
    end
    object StringField155: TStringField
      DisplayLabel = 'Nome Cliente'
      FieldName = 'NOME_C'
      Size = 35
    end
    object StringField156: TStringField
      DisplayLabel = 'Unificada'
      FieldName = 'IDENTIFICACAO_EMP'
      Size = 64
    end
    object IntegerField147: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'CODIGO_EMP'
      Required = True
    end
    object cdsCtrlCrConciliacao3ID: TIntegerField
      DisplayLabel = 'Id Financeiro'
      FieldName = 'ID'
    end
    object cdsCtrlCrConciliacao3DATE_: TDateTimeField
      DisplayLabel = 'Data Mov'
      FieldName = 'DATE_'
    end
    object cdsCtrlCrConciliacao3REQUEST_DATE: TDateTimeField
      DisplayLabel = 'Data Mov Orig'
      FieldName = 'REQUEST_DATE'
    end
    object cdsCtrlCrConciliacao3EFFECTED_DATE: TDateTimeField
      DisplayLabel = 'Data Efetivada'
      FieldName = 'EFFECTED_DATE'
    end
    object cdsCtrlCrConciliacao3BANK_SHIPPING_DATE: TDateTimeField
      DisplayLabel = 'Data Env Banco'
      FieldName = 'BANK_SHIPPING_DATE'
    end
    object cdsCtrlCrConciliacao3ARQUIVO: TStringField
      DisplayLabel = 'Arquivo'
      FieldName = 'ARQUIVO'
      Size = 255
    end
    object cdsCtrlCrConciliacao3DATA_ARQUIVO: TDateTimeField
      DisplayLabel = 'Data Arquivo'
      FieldName = 'DATA_ARQUIVO'
    end
  end
  object dsCtrlCrConciliacao3: TDataSource
    DataSet = cdsCtrlCrConciliacao3
    Left = 2016
    Top = 455
  end
  object qrConciliacaoPendencias2: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select ESTABLISHMENT_NUMBER, DATA, DATE_, '
      
        'REQUEST_DATE, EFFECTED_DATE, PAYMENT_DATE, BANK_SHIPPING_DATE, A' +
        'RQUIVO, DATA_ARQUIVO,'
      'ID, COD_EMPRESA, NSU, AUTHORIZATION_NUMBER,  '
      'TYPE_, TYPE_DESCRIPTION, '
      'ACQUIRER_ID, ACQUIRER_NAME, '
      'BRAND_ID, BRAND_NAME, '
      'EVENT_TYPE, EVENT_TYPE_DESCRIPTION, DESCRIPTION, '
      'BANK_RECON_STATUS, BANK_RECON_DESCRIPTION, '
      'GROSS_AMOUNT, EVENT_NET_AMOUNT, BATCH_NET_AMOUNT,'
      'TAX, SALE_TAX, CUSTOMER_TAX, '
      'INSTALLMENT_NUMBER, INSTALLMENTS_TOTAL, '
      'BANK_NUMBER, BANK_NAME, BRANCH_NUMBER, ACCOUNT_NUMBER, '
      'IDENTIFICACAO_EMP, '
      'CODIGO_CTRL, NOME_CTRL, '
      'CODIGO_CTRL_TX, NOME_CTRL_TX, N_CONTA_PLC_TX_CARTAO, '
      'N_CONTA_PLC, DESC_PLC, '
      'COD_CRED, N_DOC_V, N_DOC_C, TP_DOC_V, '
      
        'VALOR_C, VALOR_LIQUIDO, VALOR_ORIGINAL, DATA_REC_C, DATA_VENC_C,' +
        ' DATQ_C, STATUS_C, TAXA_CRED,'
      
        'COD_TERMINAL_ADM,  DESC_TERM_ADM, COD_ADM, DESCRICAO_ADM, COD_BA' +
        'NDEIRA_ADM, DESC_BANDEIRA_ADM, PIX_ID, FORM_PAG_COD,FORM_PAG,COD' +
        '_AJUSTE_COD, COD_AJUSTE,BANDEIRA_COD,BANDEIRA,STATUS_PAG_COD,STA' +
        'TUS_PAG,STATUS_PAG_ST, TIPO_LANCAMENTO_COD, TIPO_LANCAMENTO,TIPO' +
        '_LIQUIDACAO_COD,TIPO_LIQUIDACAO, TIPO_ANTECIPACAO_COD, TIPO_ANTE' +
        'CIPACAO,TIPO_CARTAO_COD, TIPO_CARTAO, MOTIVO_REJ_COD, MOTIVO_REJ' +
        ', GRUPO_CARTAO_COD, GRUPO_CARTAO, TIPO_TRANSACAO_COD, TIPO_TRANS' +
        'ACAO, STATUS_TRANSF_COD,'
      
        'STATUS_TRANSF, STATUS_TRANSF_ST, ORIGEM_AJUSTE_COD, ORIGEM_AJUST' +
        'E '
      'from VW_CONCILIACAO_PENDENCIAS_CONF '
      'where DATE_ >= '#39'01/01/2000'#39
      'and DATE_ <= '#39'01/01/2000'#39
      'and COD_EMPRESA = 1')
    Left = 1357
    Top = 296
  end
  object dspConciliacaoPendencias2: TDataSetProvider
    DataSet = qrConciliacaoPendencias2
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1357
    Top = 352
  end
  object dsConciliacaoPendencias2: TDataSource
    DataSet = cdsConciliacaoPendencias2
    Left = 1357
    Top = 456
  end
  object cdsConciliacaoPendencias2: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspConciliacaoPendencias2'
    BeforeOpen = cdsCtrlChBeforeOpen
    Left = 1357
    Top = 400
    object StringField150: TStringField
      DisplayLabel = 'Sel'
      FieldKind = fkInternalCalc
      FieldName = 'SEL'
      Size = 1
    end
    object cdsConciliacaoPendencias2ESTABLISHMENT_NUMBER: TStringField
      DisplayLabel = 'Estabelecimento'
      FieldName = 'ESTABLISHMENT_NUMBER'
      ReadOnly = True
      Size = 30
    end
    object cdsConciliacaoPendencias2DATA: TDateTimeField
      DisplayLabel = 'Data'
      FieldName = 'DATA'
      ReadOnly = True
    end
    object StringField157: TStringField
      DisplayLabel = 'Num Doc/NSU/CV'
      FieldName = 'NSU'
    end
    object StringField158: TStringField
      DisplayLabel = 'Num Aut Cartao'
      FieldName = 'AUTHORIZATION_NUMBER'
    end
    object IntegerField148: TIntegerField
      DisplayLabel = 'Num Parc'
      FieldName = 'INSTALLMENT_NUMBER'
    end
    object IntegerField149: TIntegerField
      DisplayLabel = 'Qtde Parc'
      FieldName = 'INSTALLMENTS_TOTAL'
    end
    object IntegerField150: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Tipo'
      FieldName = 'TYPE_'
    end
    object StringField159: TStringField
      Tag = 1
      DisplayLabel = 'Tipo'
      FieldName = 'TYPE_DESCRIPTION'
      Size = 30
    end
    object IntegerField151: TIntegerField
      Tag = 1
      DisplayLabel = 'Adquirente Id'
      FieldName = 'ACQUIRER_ID'
    end
    object StringField160: TStringField
      DisplayLabel = 'Adquirente'
      FieldName = 'ACQUIRER_NAME'
      Size = 30
    end
    object IntegerField152: TIntegerField
      Tag = 1
      DisplayLabel = 'Bandeira Id'
      FieldName = 'BRAND_ID'
    end
    object StringField161: TStringField
      DisplayLabel = 'Bandeira'
      FieldName = 'BRAND_NAME'
      Size = 30
    end
    object IntegerField153: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Evento'
      FieldName = 'EVENT_TYPE'
    end
    object StringField162: TStringField
      DisplayLabel = 'Evento'
      FieldName = 'EVENT_TYPE_DESCRIPTION'
      Size = 150
    end
    object StringField163: TStringField
      DisplayLabel = 'Descricao'
      FieldName = 'DESCRIPTION'
      Size = 250
    end
    object DateTimeField50: TDateTimeField
      DisplayLabel = 'Data Cadastro'
      FieldName = 'DATA_REC_C'
      EditMask = '!99/99/0000;1;_'
    end
    object DateTimeField51: TDateTimeField
      DisplayLabel = 'Data Vencimento'
      FieldName = 'DATA_VENC_C'
      EditMask = '!99/99/0000;1;_'
    end
    object FloatField52: TFloatField
      DisplayLabel = 'Valor Credito'
      FieldName = 'VALOR_C'
      DisplayFormat = '##0.00'
    end
    object cdsConciliacaoPendencias2VALOR_LIQUIDO: TFloatField
      DisplayLabel = 'Valor Liquido Cred'
      FieldName = 'VALOR_LIQUIDO'
      ReadOnly = True
      DisplayFormat = '##0.00'
    end
    object cdsConciliacaoPendencias2VALOR_ORIGINAL: TFloatField
      Tag = 1
      DisplayLabel = 'Valor Original Cred'
      FieldName = 'VALOR_ORIGINAL'
      DisplayFormat = '##0.00'
    end
    object FloatField59: TFloatField
      DisplayLabel = 'Valor Liquido'
      FieldName = 'EVENT_NET_AMOUNT'
      DisplayFormat = '##0.00'
    end
    object StringField173: TStringField
      DisplayLabel = 'Unificada'
      FieldName = 'IDENTIFICACAO_EMP'
      Size = 64
    end
    object FloatField54: TFloatField
      DisplayLabel = 'Taxa no pagamento (%)'
      FieldName = 'TAX'
      DisplayFormat = '##0.00'
    end
    object FloatField55: TFloatField
      Tag = 1
      DisplayLabel = 'Taxa na venda (%)'
      FieldName = 'SALE_TAX'
      DisplayFormat = '##0.00'
    end
    object FloatField56: TFloatField
      Tag = 1
      DisplayLabel = 'Taxa cadastrada confere (%)'
      FieldName = 'CUSTOMER_TAX'
      DisplayFormat = '##0.00'
    end
    object cdsConciliacaoPendencias2TAXA_CRED: TFloatField
      DisplayLabel = 'Taxa aplicada sistema (%)'
      FieldName = 'TAXA_CRED'
      DisplayFormat = '##0.00'
    end
    object IntegerField155: TIntegerField
      DisplayLabel = 'Num Banco'
      FieldName = 'BANK_NUMBER'
    end
    object StringField165: TStringField
      DisplayLabel = 'Banco'
      FieldName = 'BANK_NAME'
      Size = 30
    end
    object IntegerField156: TIntegerField
      DisplayLabel = 'Agencia'
      FieldName = 'BRANCH_NUMBER'
    end
    object StringField166: TStringField
      DisplayLabel = 'Numero Conta'
      FieldName = 'ACCOUNT_NUMBER'
    end
    object FloatField57: TFloatField
      DisplayLabel = 'Num Conta'
      FieldName = 'N_CONTA_PLC'
    end
    object StringField167: TStringField
      DisplayLabel = 'Descri'#231#227'o de Contas'
      FieldName = 'DESC_PLC'
      FixedChar = True
      Size = 30
    end
    object IntegerField157: TIntegerField
      DisplayLabel = 'Cod Controle'
      FieldName = 'CODIGO_CTRL'
    end
    object StringField168: TStringField
      DisplayLabel = 'Controle'
      FieldName = 'NOME_CTRL'
      Size = 35
    end
    object StringField169: TStringField
      DisplayLabel = 'Num Documento'
      FieldName = 'N_DOC_C'
      FixedChar = True
    end
    object IntegerField158: TIntegerField
      DisplayLabel = 'Num Doc Venda'
      FieldName = 'N_DOC_V'
    end
    object StringField170: TStringField
      DisplayLabel = 'Tipo Doc Venda'
      FieldName = 'TP_DOC_V'
      FixedChar = True
      Size = 6
    end
    object StringField171: TStringField
      DisplayLabel = 'Status Cred'
      FieldName = 'STATUS_C'
      FixedChar = True
      Size = 10
    end
    object DateTimeField52: TDateTimeField
      DisplayLabel = 'Data Quitacao'
      FieldName = 'DATQ_C'
    end
    object IntegerField159: TIntegerField
      DisplayLabel = 'Cod Cred'
      FieldName = 'COD_CRED'
    end
    object IntegerField160: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
      Required = True
    end
    object StringField164: TStringField
      DisplayLabel = 'Situacao'
      FieldName = 'BANK_RECON_DESCRIPTION'
      FixedChar = True
      Size = 25
    end
    object IntegerField154: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Situacao'
      FieldName = 'BANK_RECON_STATUS'
    end
    object IntegerField161: TIntegerField
      Tag = 1
      FieldName = 'CODIGO_CTRL_TX'
    end
    object StringField172: TStringField
      Tag = 1
      FieldName = 'NOME_CTRL_TX'
      FixedChar = True
      Size = 1
    end
    object FloatField58: TFloatField
      Tag = 1
      DisplayLabel = 'Num Conta Taxa Cartao'
      FieldName = 'N_CONTA_PLC_TX_CARTAO'
    end
    object IntegerField162: TIntegerField
      DisplayLabel = 'Cod Unificada'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object FloatField60: TFloatField
      DisplayLabel = 'Valor Total Bruto'
      FieldName = 'GROSS_AMOUNT'
      DisplayFormat = '##0.00'
    end
    object FloatField53: TFloatField
      DisplayLabel = 'Valor Liquido Lote'
      FieldName = 'BATCH_NET_AMOUNT'
      DisplayFormat = '##0.00'
    end
    object StringField174: TStringField
      DisplayLabel = 'Cod Terminal'
      FieldName = 'COD_TERMINAL_ADM'
      Size = 10
    end
    object StringField175: TStringField
      DisplayLabel = 'Terminal'
      FieldName = 'DESC_TERM_ADM'
      Size = 30
    end
    object IntegerField163: TIntegerField
      DisplayLabel = 'Cod Adm'
      FieldName = 'COD_ADM'
    end
    object StringField176: TStringField
      DisplayLabel = 'Adm'
      FieldName = 'DESCRICAO_ADM'
      Size = 30
    end
    object IntegerField164: TIntegerField
      DisplayLabel = 'Cod Bandeira Adm'
      FieldName = 'COD_BANDEIRA_ADM'
    end
    object StringField177: TStringField
      DisplayLabel = 'Bandeira Adm'
      FieldName = 'DESC_BANDEIRA_ADM'
      Size = 32
    end
    object cdsConciliacaoPendencias2PIX_ID: TStringField
      DisplayLabel = 'Pix Id'
      FieldName = 'PIX_ID'
      ReadOnly = True
      Size = 36
    end
    object cdsConciliacaoPendencias2FORM_PAG_COD: TStringField
      DisplayLabel = 'Forma Pag Cod'
      FieldName = 'FORM_PAG_COD'
      ReadOnly = True
      Size = 5
    end
    object cdsConciliacaoPendencias2FORM_PAG: TStringField
      DisplayLabel = 'Form Pag'
      FieldName = 'FORM_PAG'
      ReadOnly = True
      Size = 100
    end
    object cdsConciliacaoPendencias2COD_AJUSTE_COD: TStringField
      DisplayLabel = 'Ajuste Cod'
      FieldName = 'COD_AJUSTE_COD'
      ReadOnly = True
      Size = 5
    end
    object cdsConciliacaoPendencias2COD_AJUSTE: TStringField
      DisplayLabel = 'Ajuste'
      FieldName = 'COD_AJUSTE'
      ReadOnly = True
      Size = 200
    end
    object cdsConciliacaoPendencias2BANDEIRA_COD: TStringField
      DisplayLabel = 'Bandeira Cod'
      FieldName = 'BANDEIRA_COD'
      ReadOnly = True
      Size = 5
    end
    object cdsConciliacaoPendencias2BANDEIRA: TStringField
      DisplayLabel = 'Bandeira'
      FieldName = 'BANDEIRA'
      ReadOnly = True
      Size = 30
    end
    object cdsConciliacaoPendencias2STATUS_PAG_COD: TStringField
      DisplayLabel = 'Status Pag Cod'
      FieldName = 'STATUS_PAG_COD'
      ReadOnly = True
      Size = 5
    end
    object cdsConciliacaoPendencias2STATUS_PAG: TStringField
      DisplayLabel = 'Status Pag'
      FieldName = 'STATUS_PAG'
      ReadOnly = True
      Size = 100
    end
    object cdsConciliacaoPendencias2STATUS_PAG_ST: TStringField
      DisplayLabel = 'Status Pag St'
      FieldName = 'STATUS_PAG_ST'
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object cdsConciliacaoPendencias2TIPO_LANCAMENTO_COD: TStringField
      DisplayLabel = 'Tipo Lancamento Cod'
      FieldName = 'TIPO_LANCAMENTO_COD'
      ReadOnly = True
      Size = 5
    end
    object cdsConciliacaoPendencias2TIPO_LANCAMENTO: TStringField
      DisplayLabel = 'Tipo Lancamento'
      FieldName = 'TIPO_LANCAMENTO'
      ReadOnly = True
      Size = 150
    end
    object cdsConciliacaoPendencias2TIPO_LIQUIDACAO_COD: TStringField
      DisplayLabel = 'Tipo Liquidacao Cod'
      FieldName = 'TIPO_LIQUIDACAO_COD'
      ReadOnly = True
      Size = 5
    end
    object cdsConciliacaoPendencias2TIPO_LIQUIDACAO: TStringField
      DisplayLabel = 'Tipo Liquidacao'
      FieldName = 'TIPO_LIQUIDACAO'
      ReadOnly = True
      Size = 30
    end
    object cdsConciliacaoPendencias2TIPO_ANTECIPACAO_COD: TStringField
      DisplayLabel = 'Tipo Antecipacao Cod'
      FieldName = 'TIPO_ANTECIPACAO_COD'
      ReadOnly = True
      Size = 5
    end
    object cdsConciliacaoPendencias2TIPO_ANTECIPACAO: TStringField
      DisplayLabel = 'Tipo Antecipacao'
      FieldName = 'TIPO_ANTECIPACAO'
      ReadOnly = True
      Size = 30
    end
    object cdsConciliacaoPendencias2TIPO_CARTAO_COD: TStringField
      DisplayLabel = 'Tipo Cartao Cod'
      FieldName = 'TIPO_CARTAO_COD'
      ReadOnly = True
      Size = 5
    end
    object cdsConciliacaoPendencias2TIPO_CARTAO: TStringField
      DisplayLabel = 'Tipo Cartao'
      FieldName = 'TIPO_CARTAO'
      ReadOnly = True
      Size = 50
    end
    object cdsConciliacaoPendencias2MOTIVO_REJ_COD: TStringField
      DisplayLabel = 'Motivo Rejeicao Cod'
      FieldName = 'MOTIVO_REJ_COD'
      ReadOnly = True
      Size = 5
    end
    object cdsConciliacaoPendencias2MOTIVO_REJ: TStringField
      DisplayLabel = 'Motivo Rejeicao'
      FieldName = 'MOTIVO_REJ'
      ReadOnly = True
      Size = 50
    end
    object cdsConciliacaoPendencias2GRUPO_CARTAO_COD: TStringField
      DisplayLabel = 'Grupo Cartao Cod'
      FieldName = 'GRUPO_CARTAO_COD'
      ReadOnly = True
      Size = 5
    end
    object cdsConciliacaoPendencias2GRUPO_CARTAO: TStringField
      DisplayLabel = 'Grupo Cartao'
      FieldName = 'GRUPO_CARTAO'
      ReadOnly = True
      Size = 100
    end
    object cdsConciliacaoPendencias2TIPO_TRANSACAO_COD: TStringField
      DisplayLabel = 'Tipo Transacao Cod'
      FieldName = 'TIPO_TRANSACAO_COD'
      ReadOnly = True
      Size = 5
    end
    object cdsConciliacaoPendencias2TIPO_TRANSACAO: TStringField
      DisplayLabel = 'Tipo Transacao'
      FieldName = 'TIPO_TRANSACAO'
      ReadOnly = True
      Size = 30
    end
    object cdsConciliacaoPendencias2STATUS_TRANSF_COD: TStringField
      DisplayLabel = 'Status Transf Cod'
      FieldName = 'STATUS_TRANSF_COD'
      ReadOnly = True
      Size = 5
    end
    object cdsConciliacaoPendencias2STATUS_TRANSF: TStringField
      DisplayLabel = 'Status Transf'
      FieldName = 'STATUS_TRANSF'
      ReadOnly = True
      Size = 50
    end
    object cdsConciliacaoPendencias2STATUS_TRANSF_ST: TStringField
      DisplayLabel = 'Status Transf St'
      FieldName = 'STATUS_TRANSF_ST'
      FixedChar = True
      Size = 1
    end
    object cdsConciliacaoPendencias2ORIGEM_AJUSTE_COD: TStringField
      DisplayLabel = 'Origem Ajuste Cod'
      FieldName = 'ORIGEM_AJUSTE_COD'
      ReadOnly = True
      Size = 5
    end
    object cdsConciliacaoPendencias2ORIGEM_AJUSTE: TStringField
      DisplayLabel = 'Origem Ajuste'
      FieldName = 'ORIGEM_AJUSTE'
      ReadOnly = True
      Size = 50
    end
    object DateTimeField49: TDateTimeField
      DisplayLabel = 'Data Mov'
      FieldName = 'DATE_'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsConciliacaoPendencias2REQUEST_DATE: TDateTimeField
      DisplayLabel = 'Data Mov Orig'
      FieldName = 'REQUEST_DATE'
      ReadOnly = True
    end
    object cdsConciliacaoPendencias2EFFECTED_DATE: TDateTimeField
      DisplayLabel = 'Data Efetivada'
      FieldName = 'EFFECTED_DATE'
      ReadOnly = True
    end
    object cdsConciliacaoPendencias2PAYMENT_DATE: TDateTimeField
      DisplayLabel = 'Data Pag'
      FieldName = 'PAYMENT_DATE'
      ReadOnly = True
    end
    object cdsConciliacaoPendencias2BANK_SHIPPING_DATE: TDateTimeField
      DisplayLabel = 'Data Env Banco'
      FieldName = 'BANK_SHIPPING_DATE'
      ReadOnly = True
    end
    object cdsConciliacaoPendencias2ARQUIVO: TStringField
      DisplayLabel = 'Arquivo'
      FieldName = 'ARQUIVO'
      ReadOnly = True
      Size = 255
    end
    object cdsConciliacaoPendencias2DATA_ARQUIVO: TDateTimeField
      DisplayLabel = 'Data Arquivo'
      FieldName = 'DATA_ARQUIVO'
      ReadOnly = True
    end
  end
  object qrConciliacaoPendencias3: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select ESTABLISHMENT_NUMBER, DATA, DATE_, '
      
        'REQUEST_DATE, EFFECTED_DATE, PAYMENT_DATE, BANK_SHIPPING_DATE, A' +
        'RQUIVO, DATA_ARQUIVO,'
      'ID, COD_EMPRESA, NSU, AUTHORIZATION_NUMBER,  '
      'TYPE_, TYPE_DESCRIPTION, '
      'ACQUIRER_ID, ACQUIRER_NAME, '
      'BRAND_ID, BRAND_NAME, '
      'EVENT_TYPE, EVENT_TYPE_DESCRIPTION, DESCRIPTION, '
      'BANK_RECON_STATUS, BANK_RECON_DESCRIPTION, '
      'GROSS_AMOUNT, EVENT_NET_AMOUNT, BATCH_NET_AMOUNT,'
      'TAX, SALE_TAX, CUSTOMER_TAX, '
      'INSTALLMENT_NUMBER, INSTALLMENTS_TOTAL, '
      'BANK_NUMBER, BANK_NAME, BRANCH_NUMBER, ACCOUNT_NUMBER, '
      'IDENTIFICACAO_EMP, '
      'CODIGO_CTRL, NOME_CTRL, '
      'CODIGO_CTRL_TX, NOME_CTRL_TX, N_CONTA_PLC_TX_CARTAO, '
      'N_CONTA_PLC, DESC_PLC, '
      'COD_CRED, N_DOC_V, N_DOC_C, TP_DOC_V, '
      
        'VALOR_C, VALOR_LIQUIDO, VALOR_ORIGINAL, DATA_REC_C, DATA_VENC_C,' +
        ' DATQ_C, STATUS_C, TAXA_CRED,'
      
        'COD_TERMINAL_ADM,  DESC_TERM_ADM, COD_ADM, DESCRICAO_ADM, COD_BA' +
        'NDEIRA_ADM, DESC_BANDEIRA_ADM, PIX_ID, FORM_PAG_COD,FORM_PAG,COD' +
        '_AJUSTE_COD, COD_AJUSTE,BANDEIRA_COD,BANDEIRA,STATUS_PAG_COD,STA' +
        'TUS_PAG,STATUS_PAG_ST, TIPO_LANCAMENTO_COD, TIPO_LANCAMENTO,TIPO' +
        '_LIQUIDACAO_COD,TIPO_LIQUIDACAO, TIPO_ANTECIPACAO_COD, TIPO_ANTE' +
        'CIPACAO,TIPO_CARTAO_COD, TIPO_CARTAO, MOTIVO_REJ_COD, MOTIVO_REJ' +
        ', GRUPO_CARTAO_COD, GRUPO_CARTAO, TIPO_TRANSACAO_COD, TIPO_TRANS' +
        'ACAO, STATUS_TRANSF_COD,'
      'STATUS_TRANSF, ORIGEM_AJUSTE_COD, ORIGEM_AJUSTE '
      'from VW_CONCILIACAO_PENDENCIAS_CONF '
      'where DATE_ >= '#39'01/01/2000'#39
      'and DATE_ <= '#39'01/01/2000'#39
      'and COD_EMPRESA = 1')
    Left = 1493
    Top = 296
  end
  object dspConciliacaoPendencias3: TDataSetProvider
    DataSet = qrConciliacaoPendencias3
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1493
    Top = 352
  end
  object dsConciliacaoPendencias3: TDataSource
    DataSet = cdsConciliacaoPendencias3
    Left = 1493
    Top = 456
  end
  object cdsConciliacaoPendencias3: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspConciliacaoPendencias2'
    BeforeOpen = cdsCtrlChBeforeOpen
    Left = 1493
    Top = 400
    object StringField178: TStringField
      DisplayLabel = 'Sel'
      FieldKind = fkInternalCalc
      FieldName = 'SEL'
      Size = 1
    end
    object cdsConciliacaoPendencias3ESTABLISHMENT_NUMBER: TStringField
      DisplayLabel = 'Estabelecimento'
      FieldName = 'ESTABLISHMENT_NUMBER'
      ReadOnly = True
      Size = 30
    end
    object cdsConciliacaoPendencias3DATA: TDateTimeField
      DisplayLabel = 'Data'
      FieldName = 'DATA'
      ReadOnly = True
    end
    object StringField179: TStringField
      DisplayLabel = 'Num Doc/NSU/CV'
      FieldName = 'NSU'
    end
    object StringField180: TStringField
      DisplayLabel = 'Num Aut Cartao'
      FieldName = 'AUTHORIZATION_NUMBER'
    end
    object IntegerField165: TIntegerField
      DisplayLabel = 'Num Parc'
      FieldName = 'INSTALLMENT_NUMBER'
    end
    object IntegerField166: TIntegerField
      DisplayLabel = 'Qtde Parc'
      FieldName = 'INSTALLMENTS_TOTAL'
    end
    object IntegerField167: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Tipo'
      FieldName = 'TYPE_'
    end
    object StringField181: TStringField
      Tag = 1
      DisplayLabel = 'Tipo'
      FieldName = 'TYPE_DESCRIPTION'
      Size = 30
    end
    object IntegerField168: TIntegerField
      Tag = 1
      DisplayLabel = 'Adquirente Id'
      FieldName = 'ACQUIRER_ID'
    end
    object StringField182: TStringField
      DisplayLabel = 'Adquirente'
      FieldName = 'ACQUIRER_NAME'
      Size = 30
    end
    object IntegerField169: TIntegerField
      Tag = 1
      DisplayLabel = 'Bandeira Id'
      FieldName = 'BRAND_ID'
    end
    object StringField183: TStringField
      DisplayLabel = 'Bandeira'
      FieldName = 'BRAND_NAME'
      Size = 30
    end
    object IntegerField170: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Evento'
      FieldName = 'EVENT_TYPE'
    end
    object StringField184: TStringField
      DisplayLabel = 'Evento'
      FieldName = 'EVENT_TYPE_DESCRIPTION'
      Size = 150
    end
    object StringField185: TStringField
      DisplayLabel = 'Descricao'
      FieldName = 'DESCRIPTION'
      Size = 250
    end
    object FloatField61: TFloatField
      DisplayLabel = 'Valor Credito'
      FieldName = 'VALOR_C'
      DisplayFormat = '##0.00'
    end
    object FloatField62: TFloatField
      DisplayLabel = 'Valor Liquido Cred'
      FieldName = 'VALOR_LIQUIDO'
      ReadOnly = True
      DisplayFormat = '##0.00'
    end
    object cdsConciliacaoPendencias3VALOR_ORIGINAL: TFloatField
      Tag = 1
      DisplayLabel = 'Valor Original Cred'
      FieldName = 'VALOR_ORIGINAL'
      DisplayFormat = '##0.00'
    end
    object FloatField69: TFloatField
      DisplayLabel = 'Valor Liquido'
      FieldName = 'EVENT_NET_AMOUNT'
      DisplayFormat = '##0.00'
    end
    object DateTimeField55: TDateTimeField
      DisplayLabel = 'Data Vencimento'
      FieldName = 'DATA_VENC_C'
      EditMask = '!99/99/0000;1;_'
    end
    object DateTimeField54: TDateTimeField
      DisplayLabel = 'Data Cadastro'
      FieldName = 'DATA_REC_C'
      EditMask = '!99/99/0000;1;_'
    end
    object FloatField64: TFloatField
      DisplayLabel = 'Taxa no pagamento (%)'
      FieldName = 'TAX'
      DisplayFormat = '##0.00'
    end
    object FloatField65: TFloatField
      Tag = 1
      DisplayLabel = 'Taxa na venda (%)'
      FieldName = 'SALE_TAX'
      DisplayFormat = '##0.00'
    end
    object FloatField66: TFloatField
      Tag = 1
      DisplayLabel = 'Taxa cadastrada confere (%)'
      FieldName = 'CUSTOMER_TAX'
      DisplayFormat = '##0.00'
    end
    object cdsConciliacaoPendencias3TAXA_CRED: TFloatField
      DisplayLabel = 'Taxa aplicada sistema (%)'
      FieldName = 'TAXA_CRED'
      DisplayFormat = '##0.00'
    end
    object IntegerField171: TIntegerField
      DisplayLabel = 'Num Banco'
      FieldName = 'BANK_NUMBER'
    end
    object StringField186: TStringField
      DisplayLabel = 'Banco'
      FieldName = 'BANK_NAME'
      Size = 30
    end
    object IntegerField172: TIntegerField
      DisplayLabel = 'Agencia'
      FieldName = 'BRANCH_NUMBER'
    end
    object StringField187: TStringField
      DisplayLabel = 'Numero Conta'
      FieldName = 'ACCOUNT_NUMBER'
    end
    object FloatField67: TFloatField
      DisplayLabel = 'Num Conta'
      FieldName = 'N_CONTA_PLC'
    end
    object StringField188: TStringField
      DisplayLabel = 'Descri'#231#227'o de Contas'
      FieldName = 'DESC_PLC'
      FixedChar = True
      Size = 30
    end
    object IntegerField173: TIntegerField
      DisplayLabel = 'Cod Controle'
      FieldName = 'CODIGO_CTRL'
    end
    object StringField189: TStringField
      DisplayLabel = 'Controle'
      FieldName = 'NOME_CTRL'
      Size = 35
    end
    object StringField190: TStringField
      DisplayLabel = 'Num Documento'
      FieldName = 'N_DOC_C'
      FixedChar = True
    end
    object IntegerField174: TIntegerField
      DisplayLabel = 'Num Doc Venda'
      FieldName = 'N_DOC_V'
    end
    object StringField191: TStringField
      DisplayLabel = 'Tipo Doc Venda'
      FieldName = 'TP_DOC_V'
      FixedChar = True
      Size = 6
    end
    object StringField192: TStringField
      DisplayLabel = 'Status Cred'
      FieldName = 'STATUS_C'
      FixedChar = True
      Size = 10
    end
    object DateTimeField56: TDateTimeField
      DisplayLabel = 'Data Quitacao'
      FieldName = 'DATQ_C'
    end
    object IntegerField175: TIntegerField
      DisplayLabel = 'Cod Cred'
      FieldName = 'COD_CRED'
    end
    object IntegerField176: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
      Required = True
    end
    object StringField193: TStringField
      DisplayLabel = 'Situacao'
      FieldName = 'BANK_RECON_DESCRIPTION'
      FixedChar = True
      Size = 25
    end
    object IntegerField177: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Situacao'
      FieldName = 'BANK_RECON_STATUS'
    end
    object IntegerField178: TIntegerField
      Tag = 1
      FieldName = 'CODIGO_CTRL_TX'
    end
    object StringField194: TStringField
      Tag = 1
      FieldName = 'NOME_CTRL_TX'
      FixedChar = True
      Size = 1
    end
    object FloatField68: TFloatField
      Tag = 1
      DisplayLabel = 'Num Conta Taxa Cartao'
      FieldName = 'N_CONTA_PLC_TX_CARTAO'
    end
    object IntegerField179: TIntegerField
      DisplayLabel = 'Cod Unificada'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object StringField195: TStringField
      DisplayLabel = 'Unificada'
      FieldName = 'IDENTIFICACAO_EMP'
      Size = 64
    end
    object FloatField70: TFloatField
      DisplayLabel = 'Valor Total Bruto'
      FieldName = 'GROSS_AMOUNT'
      DisplayFormat = '##0.00'
    end
    object FloatField63: TFloatField
      DisplayLabel = 'Valor Liquido Lote'
      FieldName = 'BATCH_NET_AMOUNT'
      DisplayFormat = '##0.00'
    end
    object StringField196: TStringField
      DisplayLabel = 'Cod Terminal'
      FieldName = 'COD_TERMINAL_ADM'
      Size = 10
    end
    object StringField197: TStringField
      DisplayLabel = 'Terminal'
      FieldName = 'DESC_TERM_ADM'
      Size = 30
    end
    object IntegerField180: TIntegerField
      DisplayLabel = 'Cod Adm'
      FieldName = 'COD_ADM'
    end
    object StringField198: TStringField
      DisplayLabel = 'Adm'
      FieldName = 'DESCRICAO_ADM'
      Size = 30
    end
    object IntegerField181: TIntegerField
      DisplayLabel = 'Cod Bandeira Adm'
      FieldName = 'COD_BANDEIRA_ADM'
    end
    object StringField199: TStringField
      DisplayLabel = 'Bandeira Adm'
      FieldName = 'DESC_BANDEIRA_ADM'
      Size = 32
    end
    object cdsConciliacaoPendencias3PIX_ID: TStringField
      DisplayLabel = 'Pix Id'
      FieldName = 'PIX_ID'
      ReadOnly = True
      Size = 36
    end
    object cdsConciliacaoPendencias3FORM_PAG_COD: TStringField
      DisplayLabel = 'Forma Pag Cod'
      FieldName = 'FORM_PAG_COD'
      ReadOnly = True
      Size = 5
    end
    object cdsConciliacaoPendencias3FORM_PAG: TStringField
      DisplayLabel = 'Forma Pag'
      FieldName = 'FORM_PAG'
      ReadOnly = True
      Size = 100
    end
    object cdsConciliacaoPendencias3COD_AJUSTE_COD: TStringField
      DisplayLabel = 'Ajuste Cod'
      FieldName = 'COD_AJUSTE_COD'
      ReadOnly = True
      Size = 5
    end
    object cdsConciliacaoPendencias3COD_AJUSTE: TStringField
      DisplayLabel = 'Ajuste'
      FieldName = 'COD_AJUSTE'
      ReadOnly = True
      Size = 200
    end
    object cdsConciliacaoPendencias3BANDEIRA_COD: TStringField
      DisplayLabel = 'Bandeira Cod'
      FieldName = 'BANDEIRA_COD'
      ReadOnly = True
      Size = 5
    end
    object cdsConciliacaoPendencias3BANDEIRA: TStringField
      DisplayLabel = 'Bandeira'
      FieldName = 'BANDEIRA'
      ReadOnly = True
      Size = 30
    end
    object cdsConciliacaoPendencias3STATUS_PAG_COD: TStringField
      DisplayLabel = 'Status Pag Cod'
      FieldName = 'STATUS_PAG_COD'
      ReadOnly = True
      Size = 5
    end
    object cdsConciliacaoPendencias3STATUS_PAG: TStringField
      DisplayLabel = 'Status Pag'
      FieldName = 'STATUS_PAG'
      ReadOnly = True
      Size = 100
    end
    object cdsConciliacaoPendencias3STATUS_PAG_ST: TStringField
      DisplayLabel = 'Status Pag St'
      FieldName = 'STATUS_PAG_ST'
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object cdsConciliacaoPendencias3TIPO_LANCAMENTO_COD: TStringField
      DisplayLabel = 'Tipo Lancamento Cod'
      FieldName = 'TIPO_LANCAMENTO_COD'
      ReadOnly = True
      Size = 5
    end
    object cdsConciliacaoPendencias3TIPO_LANCAMENTO: TStringField
      DisplayLabel = 'Tipo Lancamento'
      FieldName = 'TIPO_LANCAMENTO'
      ReadOnly = True
      Size = 150
    end
    object cdsConciliacaoPendencias3TIPO_LIQUIDACAO_COD: TStringField
      DisplayLabel = 'Tipo Liquidacao Cod'
      DisplayWidth = 5
      FieldName = 'TIPO_LIQUIDACAO_COD'
      ReadOnly = True
      Size = 5
    end
    object cdsConciliacaoPendencias3TIPO_LIQUIDACAO: TStringField
      DisplayLabel = 'Tipo Liquidacao'
      FieldName = 'TIPO_LIQUIDACAO'
      ReadOnly = True
      Size = 30
    end
    object cdsConciliacaoPendencias3TIPO_ANTECIPACAO_COD: TStringField
      DisplayLabel = 'Tipo Antecipacao Cod'
      FieldName = 'TIPO_ANTECIPACAO_COD'
      ReadOnly = True
      Size = 5
    end
    object cdsConciliacaoPendencias3TIPO_ANTECIPACAO: TStringField
      DisplayLabel = 'Tipo Antecipacao'
      FieldName = 'TIPO_ANTECIPACAO'
      ReadOnly = True
      Size = 30
    end
    object cdsConciliacaoPendencias3TIPO_CARTAO_COD: TStringField
      DisplayLabel = 'Tipo Cartao Cod'
      FieldName = 'TIPO_CARTAO_COD'
      ReadOnly = True
      Size = 5
    end
    object cdsConciliacaoPendencias3TIPO_CARTAO: TStringField
      DisplayLabel = 'Tipo Cartao'
      FieldName = 'TIPO_CARTAO'
      ReadOnly = True
      Size = 50
    end
    object cdsConciliacaoPendencias3MOTIVO_REJ_COD: TStringField
      DisplayLabel = 'Motivo Rejeicao Cod'
      FieldName = 'MOTIVO_REJ_COD'
      ReadOnly = True
      Size = 5
    end
    object cdsConciliacaoPendencias3MOTIVO_REJ: TStringField
      DisplayLabel = 'Motivo Rejeicao'
      FieldName = 'MOTIVO_REJ'
      ReadOnly = True
      Size = 50
    end
    object cdsConciliacaoPendencias3GRUPO_CARTAO_COD: TStringField
      DisplayLabel = 'Grupo Cartao Cod'
      FieldName = 'GRUPO_CARTAO_COD'
      ReadOnly = True
      Size = 5
    end
    object cdsConciliacaoPendencias3GRUPO_CARTAO: TStringField
      DisplayLabel = 'Grupo Cartao'
      FieldName = 'GRUPO_CARTAO'
      ReadOnly = True
      Size = 100
    end
    object cdsConciliacaoPendencias3TIPO_TRANSACAO_COD: TStringField
      DisplayLabel = 'Tipo Transacao Cod'
      FieldName = 'TIPO_TRANSACAO_COD'
      ReadOnly = True
      Size = 5
    end
    object cdsConciliacaoPendencias3TIPO_TRANSACAO: TStringField
      DisplayLabel = 'Tipo Transacao'
      FieldName = 'TIPO_TRANSACAO'
      ReadOnly = True
      Size = 30
    end
    object cdsConciliacaoPendencias3STATUS_TRANSF_COD: TStringField
      DisplayLabel = 'Status Transf Cod'
      FieldName = 'STATUS_TRANSF_COD'
      ReadOnly = True
      Size = 5
    end
    object cdsConciliacaoPendencias3STATUS_TRANSF: TStringField
      DisplayLabel = 'Status Transf'
      FieldName = 'STATUS_TRANSF'
      ReadOnly = True
      Size = 50
    end
    object cdsConciliacaoPendencias3STATUS_TRANSF_ST: TStringField
      DisplayLabel = 'Status Transf St'
      FieldName = 'STATUS_TRANSF_ST'
      FixedChar = True
      Size = 1
    end
    object cdsConciliacaoPendencias3ORIGEM_AJUSTE_COD: TStringField
      DisplayLabel = 'Origem Ajuste Cod'
      FieldName = 'ORIGEM_AJUSTE_COD'
      ReadOnly = True
      Size = 5
    end
    object cdsConciliacaoPendencias3ORIGEM_AJUSTE: TStringField
      DisplayLabel = 'Origem Ajuste'
      FieldName = 'ORIGEM_AJUSTE'
      ReadOnly = True
      Size = 50
    end
    object DateTimeField53: TDateTimeField
      DisplayLabel = 'Data Mov'
      FieldName = 'DATE_'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsConciliacaoPendencias3REQUEST_DATE: TDateTimeField
      DisplayLabel = 'Data Mov Orig'
      FieldName = 'REQUEST_DATE'
      ReadOnly = True
    end
    object cdsConciliacaoPendencias3EFFECTED_DATE: TDateTimeField
      DisplayLabel = 'Data Efetivada'
      FieldName = 'EFFECTED_DATE'
      ReadOnly = True
    end
    object cdsConciliacaoPendencias3PAYMENT_DATE: TDateTimeField
      DisplayLabel = 'Data Pag'
      FieldName = 'PAYMENT_DATE'
      ReadOnly = True
    end
    object cdsConciliacaoPendencias3BANK_SHIPPING_DATE: TDateTimeField
      DisplayLabel = 'Data Env Banco'
      FieldName = 'BANK_SHIPPING_DATE'
      ReadOnly = True
    end
    object cdsConciliacaoPendencias3ARQUIVO: TStringField
      DisplayLabel = 'Arquivo'
      FieldName = 'ARQUIVO'
      ReadOnly = True
      Size = 255
    end
    object cdsConciliacaoPendencias3DATA_ARQUIVO: TDateTimeField
      DisplayLabel = 'Data Arquivo'
      FieldName = 'DATA_ARQUIVO'
      ReadOnly = True
    end
  end
  object qrConciliacaoFinanceiroRec: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      
        'select DATA, DATE_,REQUEST_DATE, EFFECTED_DATE, PAYMENT_DATE, BA' +
        'NK_SHIPPING_DATE, ID, COD_EMPRESA, ARQUIVO, DATA_ARQUIVO, ESTABL' +
        'ISHMENT_NUMBER, NSU, AUTHORIZATION_NUMBER,'
      
        'TYPE_, TYPE_DESCRIPTION, ACQUIRER_ID, ACQUIRER_NAME, BRAND_ID, B' +
        'RAND_NAME,'
      'EVENT_TYPE,  EVENT_TYPE_DESCRIPTION,'
      'DESCRIPTION, BANK_RECON_STATUS, BANK_RECON_DESCRIPTION,'
      'GROSS_AMOUNT, EVENT_NET_AMOUNT, BATCH_NET_AMOUNT,'
      
        'TAX, SALE_TAX, CUSTOMER_TAX, INSTALLMENT_NUMBER, INSTALLMENTS_TO' +
        'TAL,'
      'BANK_NUMBER, BANK_NAME, BRANCH_NUMBER, ACCOUNT_NUMBER,'
      
        'IDENTIFICACAO_EMP, CODIGO_CTRL, NOME_CTRL, CODIGO_CTRL_TX, NOME_' +
        'CTRL_TX,'
      
        'N_CONTA_PLC_TX_CARTAO, N_CONTA_PLC_TARIFA_CARTAO, N_CONTA_PLC, D' +
        'ESC_PLC,'
      
        'COD_CRED, N_DOC_V, N_DOC_C, TP_DOC_V, VALOR_C, VALOR_LIQUIDO, VA' +
        'LOR_ORIGINAL, '
      
        'DATA_REC_C, DATA_VENC_C, STATUS_C, DATQ_C, TAXA_CRED, COD_CLIENT' +
        'E, NOME_CLIENTE, RAZAO,'
      
        'COD_TERMINAL_ADM, DESC_TERM_ADM, COD_ADM, DESCRICAO_ADM, COD_BAN' +
        'DEIRA_ADM, DESC_BANDEIRA_ADM,'
      'PIX_ID,'
      
        'FORM_PAG_COD,FORM_PAG,COD_AJUSTE_COD, COD_AJUSTE,BANDEIRA_COD,BA' +
        'NDEIRA,STATUS_PAG_COD,STATUS_PAG, STATUS_PAG_ST, TIPO_LANCAMENTO' +
        '_COD, TIPO_LANCAMENTO,TIPO_LIQUIDACAO_COD,TIPO_LIQUIDACAO, TIPO_' +
        'ANTECIPACAO_COD, TIPO_ANTECIPACAO,TIPO_CARTAO_COD, TIPO_CARTAO, ' +
        'MOTIVO_REJ_COD, MOTIVO_REJ, GRUPO_CARTAO_COD, GRUPO_CARTAO, TIPO' +
        '_TRANSACAO_COD, TIPO_TRANSACAO, STATUS_TRANSF_COD,'
      
        'STATUS_TRANSF, STATUS_TRANSF_ST, ORIGEM_AJUSTE_COD, ORIGEM_AJUST' +
        'E'
      'from VW_CONCILIACAO_FINANCEIRO'
      'where DATE_ >= '#39'01/01/2000'#39
      'and DATE_ <= '#39'01/01/2000'#39
      'and COD_EMPRESA = 1')
    Left = 1653
    Top = 296
  end
  object dspConciliacaoFinanceiroRec: TDataSetProvider
    DataSet = qrConciliacaoFinanceiroRec
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1653
    Top = 352
  end
  object cdsConciliacaoFinanceiroRec: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspConciliacaoFinanceiroRec'
    BeforeOpen = cdsCtrlChBeforeOpen
    Left = 1653
    Top = 400
    object cdsConciliacaoFinanceiroRecESTABLISHMENT_NUMBER: TStringField
      DisplayLabel = 'Estabelecimento'
      FieldName = 'ESTABLISHMENT_NUMBER'
      Size = 30
    end
    object cdsConciliacaoFinanceiroRecDATA: TDateTimeField
      DisplayLabel = 'Data'
      FieldName = 'DATA'
    end
    object StringField205: TStringField
      DisplayLabel = 'Evento'
      FieldName = 'EVENT_TYPE_DESCRIPTION'
      Size = 30
    end
    object StringField200: TStringField
      DisplayLabel = 'Num Doc/NSU/CV'
      FieldName = 'NSU'
    end
    object StringField201: TStringField
      DisplayLabel = 'Num Aut Cartao'
      FieldName = 'AUTHORIZATION_NUMBER'
    end
    object IntegerField182: TIntegerField
      DisplayLabel = 'Num Parc'
      FieldName = 'INSTALLMENT_NUMBER'
    end
    object IntegerField183: TIntegerField
      DisplayLabel = 'Qtde Parc'
      FieldName = 'INSTALLMENTS_TOTAL'
    end
    object FloatField71: TFloatField
      DisplayLabel = 'Valor Credito'
      FieldName = 'VALOR_C'
      DisplayFormat = '##0.00'
    end
    object FloatField72: TFloatField
      DisplayLabel = 'Valor Liquido Cred'
      FieldName = 'VALOR_LIQUIDO'
      DisplayFormat = '##0.00'
    end
    object FloatField74: TFloatField
      DisplayLabel = 'Valor Liquido'
      FieldName = 'EVENT_NET_AMOUNT'
      DisplayFormat = '##0.00'
    end
    object DateTimeField58: TDateTimeField
      DisplayLabel = 'Data Cadastro'
      FieldName = 'DATA_REC_C'
      EditMask = '!99/99/0000;1;_'
    end
    object DateTimeField59: TDateTimeField
      DisplayLabel = 'Data Vencimento'
      FieldName = 'DATA_VENC_C'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsConciliacaoFinanceiroRecPAYMENT_DATE: TDateTimeField
      DisplayLabel = 'Data Pag'
      FieldName = 'PAYMENT_DATE'
      ReadOnly = True
    end
    object IntegerField185: TIntegerField
      Tag = 1
      DisplayLabel = 'Adquirente Id'
      FieldName = 'ACQUIRER_ID'
    end
    object StringField203: TStringField
      DisplayLabel = 'Adquirente'
      FieldName = 'ACQUIRER_NAME'
      Size = 30
    end
    object IntegerField186: TIntegerField
      Tag = 1
      DisplayLabel = 'Bandeira Id'
      FieldName = 'BRAND_ID'
    end
    object StringField204: TStringField
      DisplayLabel = 'Bandeira'
      FieldName = 'BRAND_NAME'
      Size = 30
    end
    object IntegerField187: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Evento'
      FieldName = 'EVENT_TYPE'
    end
    object StringField206: TStringField
      DisplayLabel = 'Descricao'
      FieldName = 'DESCRIPTION'
      Size = 250
    end
    object FloatField73: TFloatField
      Tag = 1
      DisplayLabel = 'Valor Original cred'
      FieldName = 'VALOR_ORIGINAL'
      DisplayFormat = '##0.00'
    end
    object FloatField75: TFloatField
      DisplayLabel = 'Taxa no pagamento (%)'
      FieldName = 'TAX'
      DisplayFormat = '##0.00'
    end
    object StringField202: TStringField
      Tag = 1
      DisplayLabel = 'Tipo'
      FieldName = 'TYPE_DESCRIPTION'
      Size = 30
    end
    object IntegerField184: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Tipo'
      FieldName = 'TYPE_'
    end
    object FloatField76: TFloatField
      Tag = 1
      DisplayLabel = 'Taxa na venda (%)'
      FieldName = 'SALE_TAX'
      DisplayFormat = '##0.00'
    end
    object FloatField77: TFloatField
      Tag = 1
      DisplayLabel = 'Taxa cadastrada confere (%)'
      FieldName = 'CUSTOMER_TAX'
      DisplayFormat = '##0.00'
    end
    object FloatField78: TFloatField
      DisplayLabel = 'Taxa aplicada sistema (%)'
      FieldName = 'TAXA_CRED'
      DisplayFormat = '##0.00'
    end
    object IntegerField188: TIntegerField
      DisplayLabel = 'Num Banco'
      FieldName = 'BANK_NUMBER'
    end
    object StringField207: TStringField
      DisplayLabel = 'Banco'
      FieldName = 'BANK_NAME'
      Size = 30
    end
    object IntegerField189: TIntegerField
      DisplayLabel = 'Agencia'
      FieldName = 'BRANCH_NUMBER'
    end
    object StringField208: TStringField
      DisplayLabel = 'Numero Conta'
      FieldName = 'ACCOUNT_NUMBER'
    end
    object FloatField79: TFloatField
      DisplayLabel = 'Num Conta'
      FieldName = 'N_CONTA_PLC'
    end
    object StringField209: TStringField
      DisplayLabel = 'Descri'#231#227'o de Contas'
      FieldName = 'DESC_PLC'
      FixedChar = True
      Size = 30
    end
    object IntegerField190: TIntegerField
      DisplayLabel = 'Cod Controle'
      FieldName = 'CODIGO_CTRL'
    end
    object StringField210: TStringField
      DisplayLabel = 'Controle'
      FieldName = 'NOME_CTRL'
      Size = 35
    end
    object StringField211: TStringField
      DisplayLabel = 'Num Documento'
      FieldName = 'N_DOC_C'
      FixedChar = True
    end
    object IntegerField191: TIntegerField
      DisplayLabel = 'Num Doc Venda'
      FieldName = 'N_DOC_V'
    end
    object StringField212: TStringField
      DisplayLabel = 'Tipo Doc Venda'
      FieldName = 'TP_DOC_V'
      FixedChar = True
      Size = 6
    end
    object StringField213: TStringField
      DisplayLabel = 'Status Cred'
      FieldName = 'STATUS_C'
      FixedChar = True
      Size = 10
    end
    object DateTimeField60: TDateTimeField
      DisplayLabel = 'Data Quitacao'
      FieldName = 'DATQ_C'
    end
    object IntegerField192: TIntegerField
      DisplayLabel = 'Cod Cred'
      FieldName = 'COD_CRED'
    end
    object IntegerField193: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
      Required = True
    end
    object StringField214: TStringField
      DisplayLabel = 'Situacao'
      FieldName = 'BANK_RECON_DESCRIPTION'
      FixedChar = True
      Size = 25
    end
    object IntegerField194: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Situacao'
      FieldName = 'BANK_RECON_STATUS'
    end
    object IntegerField195: TIntegerField
      DisplayLabel = 'Cod Cliente'
      FieldName = 'COD_CLIENTE'
    end
    object StringField215: TStringField
      DisplayLabel = 'Nome Fantasia (Cliente)'
      FieldName = 'NOME_CLIENTE'
      Size = 35
    end
    object cdsConciliacaoFinanceiroRecRAZAO: TStringField
      DisplayLabel = 'Razao Social (Cliente)'
      FieldName = 'RAZAO'
      ReadOnly = True
      Size = 60
    end
    object IntegerField196: TIntegerField
      Tag = 1
      FieldName = 'CODIGO_CTRL_TX'
    end
    object StringField216: TStringField
      Tag = 1
      FieldName = 'NOME_CTRL_TX'
      FixedChar = True
      Size = 1
    end
    object FloatField80: TFloatField
      Tag = 1
      DisplayLabel = 'Num Conta Taxa Cartao'
      FieldName = 'N_CONTA_PLC_TX_CARTAO'
    end
    object FloatField81: TFloatField
      Tag = 1
      DisplayLabel = 'Num Conta Tarifa Cartao'
      FieldName = 'N_CONTA_PLC_TARIFA_CARTAO'
    end
    object IntegerField197: TIntegerField
      DisplayLabel = 'Cod Unificada'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object StringField217: TStringField
      DisplayLabel = 'Unificada'
      FieldName = 'IDENTIFICACAO_EMP'
      Size = 64
    end
    object FloatField82: TFloatField
      DisplayLabel = 'Valor Total Bruto'
      FieldName = 'GROSS_AMOUNT'
      DisplayFormat = '##0.00'
    end
    object FloatField83: TFloatField
      DisplayLabel = 'Valor Liquido Lote'
      FieldName = 'BATCH_NET_AMOUNT'
      DisplayFormat = '##0.00'
    end
    object StringField218: TStringField
      DisplayLabel = 'Cod Terminal'
      FieldName = 'COD_TERMINAL_ADM'
      FixedChar = True
      Size = 1
    end
    object StringField219: TStringField
      DisplayLabel = 'Terminal'
      FieldName = 'DESC_TERM_ADM'
      FixedChar = True
      Size = 1
    end
    object IntegerField198: TIntegerField
      DisplayLabel = 'Cod Adm'
      FieldName = 'COD_ADM'
      ReadOnly = True
    end
    object StringField220: TStringField
      DisplayLabel = 'Adm'
      FieldName = 'DESCRICAO_ADM'
      FixedChar = True
      Size = 1
    end
    object IntegerField199: TIntegerField
      DisplayLabel = 'Cod Bandeira Adm'
      FieldName = 'COD_BANDEIRA_ADM'
      ReadOnly = True
    end
    object StringField221: TStringField
      DisplayLabel = 'Bandeira Adm'
      FieldName = 'DESC_BANDEIRA_ADM'
      ReadOnly = True
      Size = 32
    end
    object cdsConciliacaoFinanceiroRecPIX_ID: TStringField
      DisplayLabel = 'Pix Id'
      FieldName = 'PIX_ID'
      ReadOnly = True
      Size = 36
    end
    object cdsConciliacaoFinanceiroRecFORM_PAG_COD: TStringField
      DisplayLabel = 'Forma Pag Cod'
      FieldName = 'FORM_PAG_COD'
      ReadOnly = True
      Size = 5
    end
    object cdsConciliacaoFinanceiroRecFORM_PAG: TStringField
      DisplayLabel = 'Forma Pag'
      FieldName = 'FORM_PAG'
      Size = 100
    end
    object cdsConciliacaoFinanceiroRecCOD_AJUSTE_COD: TStringField
      DisplayLabel = 'Cod Ajuste Cod'
      FieldName = 'COD_AJUSTE_COD'
      ReadOnly = True
      Size = 5
    end
    object cdsConciliacaoFinanceiroRecCOD_AJUSTE: TStringField
      DisplayLabel = 'Cod Ajuste'
      FieldName = 'COD_AJUSTE'
      Size = 200
    end
    object cdsConciliacaoFinanceiroRecBANDEIRA_COD: TStringField
      DisplayLabel = 'Bandeira Cod'
      FieldName = 'BANDEIRA_COD'
      Size = 5
    end
    object cdsConciliacaoFinanceiroRecBANDEIRA: TStringField
      DisplayLabel = 'Bandeira'
      FieldName = 'BANDEIRA'
      Size = 30
    end
    object cdsConciliacaoFinanceiroRecSTATUS_PAG_COD: TStringField
      DisplayLabel = 'Status Pag Cod'
      FieldName = 'STATUS_PAG_COD'
      ReadOnly = True
      Size = 5
    end
    object cdsConciliacaoFinanceiroRecSTATUS_PAG: TStringField
      FieldName = 'STATUS_PAG'
      Size = 100
    end
    object cdsConciliacaoFinanceiroRecSTATUS_PAG_ST: TStringField
      DisplayLabel = 'Status Pag St'
      FieldName = 'STATUS_PAG_ST'
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object cdsConciliacaoFinanceiroRecTIPO_LANCAMENTO_COD: TStringField
      DisplayLabel = 'Tipo Lancamento Cod'
      FieldName = 'TIPO_LANCAMENTO_COD'
      ReadOnly = True
      Size = 5
    end
    object cdsConciliacaoFinanceiroRecTIPO_LANCAMENTO: TStringField
      DisplayLabel = 'Tipo Lancamento'
      FieldName = 'TIPO_LANCAMENTO'
      Size = 150
    end
    object cdsConciliacaoFinanceiroRecTIPO_LIQUIDACAO_COD: TStringField
      DisplayLabel = 'Tipo Liquidacao Cod'
      FieldName = 'TIPO_LIQUIDACAO_COD'
      ReadOnly = True
      Size = 5
    end
    object cdsConciliacaoFinanceiroRecTIPO_LIQUIDACAO: TStringField
      DisplayLabel = 'Tipo Liquidacao'
      FieldName = 'TIPO_LIQUIDACAO'
      Size = 30
    end
    object cdsConciliacaoFinanceiroRecTIPO_ANTECIPACAO_COD: TStringField
      DisplayLabel = 'Tipo Antecipacao Cod'
      FieldName = 'TIPO_ANTECIPACAO_COD'
      ReadOnly = True
      Size = 5
    end
    object cdsConciliacaoFinanceiroRecTIPO_ANTECIPACAO: TStringField
      DisplayLabel = 'Tipo Antecipacao'
      FieldName = 'TIPO_ANTECIPACAO'
      Size = 30
    end
    object cdsConciliacaoFinanceiroRecTIPO_CARTAO_COD: TStringField
      DisplayLabel = 'Tipo Cartao Cod'
      FieldName = 'TIPO_CARTAO_COD'
      ReadOnly = True
      Size = 5
    end
    object cdsConciliacaoFinanceiroRecTIPO_CARTAO: TStringField
      DisplayLabel = 'Tipo Cartao'
      FieldName = 'TIPO_CARTAO'
      Size = 50
    end
    object cdsConciliacaoFinanceiroRecMOTIVO_REJ_COD: TStringField
      DisplayLabel = 'Motivo Rejeicao Cod'
      FieldName = 'MOTIVO_REJ_COD'
      ReadOnly = True
      Size = 5
    end
    object cdsConciliacaoFinanceiroRecMOTIVO_REJ: TStringField
      DisplayLabel = 'Motivo Rejeicao'
      FieldName = 'MOTIVO_REJ'
      Size = 50
    end
    object cdsConciliacaoFinanceiroRecGRUPO_CARTAO_COD: TStringField
      DisplayLabel = 'Grupo Cartao Cod'
      FieldName = 'GRUPO_CARTAO_COD'
      ReadOnly = True
      Size = 5
    end
    object cdsConciliacaoFinanceiroRecGRUPO_CARTAO: TStringField
      DisplayLabel = 'Grupo Cartao'
      FieldName = 'GRUPO_CARTAO'
      Size = 100
    end
    object cdsConciliacaoFinanceiroRecTIPO_TRANSACAO_COD: TStringField
      DisplayLabel = 'Tipo Transacao Cod'
      FieldName = 'TIPO_TRANSACAO_COD'
      ReadOnly = True
      Size = 5
    end
    object cdsConciliacaoFinanceiroRecTIPO_TRANSACAO: TStringField
      DisplayLabel = 'Tipo Transacao'
      FieldName = 'TIPO_TRANSACAO'
      Size = 30
    end
    object cdsConciliacaoFinanceiroRecSTATUS_TRANSF_COD: TStringField
      DisplayLabel = 'Status Transf Cod'
      FieldName = 'STATUS_TRANSF_COD'
      ReadOnly = True
      Size = 5
    end
    object cdsConciliacaoFinanceiroRecSTATUS_TRANSF: TStringField
      DisplayLabel = 'Status Transf'
      FieldName = 'STATUS_TRANSF'
      Size = 50
    end
    object cdsConciliacaoFinanceiroRecSTATUS_TRANSF_ST: TStringField
      DisplayLabel = 'Status Transf St'
      FieldName = 'STATUS_TRANSF_ST'
      FixedChar = True
      Size = 1
    end
    object cdsConciliacaoFinanceiroRecORIGEM_AJUSTE: TStringField
      DisplayLabel = 'Origem Ajuste'
      FieldName = 'ORIGEM_AJUSTE'
      Size = 50
    end
    object cdsConciliacaoFinanceiroRecORIGEM_AJUSTE_COD: TStringField
      DisplayLabel = 'Origem Ajuste Cod'
      FieldName = 'ORIGEM_AJUSTE_COD'
      ReadOnly = True
      Size = 5
    end
    object DateTimeField57: TDateTimeField
      DisplayLabel = 'Data Mov'
      FieldName = 'DATE_'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsConciliacaoFinanceiroRecREQUEST_DATE: TDateTimeField
      DisplayLabel = 'Data Orig'
      FieldName = 'REQUEST_DATE'
      ReadOnly = True
    end
    object cdsConciliacaoFinanceiroRecEFFECTED_DATE: TDateTimeField
      DisplayLabel = 'Data Efetivada'
      FieldName = 'EFFECTED_DATE'
      ReadOnly = True
    end
    object cdsConciliacaoFinanceiroRecBANK_SHIPPING_DATE: TDateTimeField
      DisplayLabel = 'Data Env Banco'
      FieldName = 'BANK_SHIPPING_DATE'
      ReadOnly = True
    end
    object cdsConciliacaoFinanceiroRecARQUIVO: TStringField
      DisplayLabel = 'Arquivo'
      FieldName = 'ARQUIVO'
      ReadOnly = True
      Size = 255
    end
    object cdsConciliacaoFinanceiroRecDATA_ARQUIVO: TDateTimeField
      DisplayLabel = 'Data Arquivo'
      FieldName = 'DATA_ARQUIVO'
      ReadOnly = True
    end
  end
  object dsConciliacaoFinanceiroRec: TDataSource
    DataSet = cdsConciliacaoFinanceiroRec
    Left = 1653
    Top = 456
  end
  object qrConciliacaoCielo: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      
        'select nf.num_nf, nf.serie, nf.modelo_nf, nf.data_lanc, nfi.num_' +
        'fab_prod, nfi.grupo_prod, nfi.cod_prod, nfi.descricao_item, nfi.' +
        'quantidade, nfi.valor_unitario, nfi.valor_total,'
      'nfi.cod_nf, nfi.nitem'
      'from notafiscal nf'
      
        'inner join notafiscal_item nfi on nfi.cod_nf = nf.cod_nf and nfi' +
        '.cod_empresa = nf.cod_empresa'
      
        'inner join nat_op n on n.codigo_nop = nfi.codigo_nop and n.usa_b' +
        'x_retorno_fin = '#39'S'#39
      
        'where nf.cod_cliente = :cod_cliente and nf.cod_empresa = :cod_em' +
        'presa')
    Left = 37
    Top = 512
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cod_cliente'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cod_empresa'
        ParamType = ptUnknown
      end>
  end
  object dspConciliacaoCielo: TDataSetProvider
    DataSet = qrConciliacaoCielo
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 37
    Top = 560
  end
  object cdsConciliacaoCielo: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspConciliacaoCielo'
    BeforeOpen = cdsCtrlChBeforeOpen
    Left = 37
    Top = 608
    object IntegerField200: TIntegerField
      DisplayLabel = 'Num NF'
      FieldName = 'NUM_NF'
      Required = True
    end
    object StringField222: TStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 5
    end
    object StringField223: TStringField
      DisplayLabel = 'Modelo'
      FieldName = 'MODELO_NF'
      Size = 3
    end
    object DateTimeField61: TDateTimeField
      DisplayLabel = 'Data'
      FieldName = 'DATA_LANC'
    end
    object StringField224: TStringField
      DisplayLabel = 'Num Fab Prod'
      FieldName = 'NUM_FAB_PROD'
    end
    object IntegerField201: TIntegerField
      DisplayLabel = 'Grupo'
      FieldName = 'GRUPO_PROD'
    end
    object StringField225: TStringField
      DisplayLabel = 'Cod Prod'
      FieldName = 'COD_PROD'
      FixedChar = True
      Size = 6
    end
    object StringField226: TStringField
      DisplayLabel = 'Descri'#231#227'o Mercadoria'
      FieldName = 'DESCRICAO_ITEM'
      Size = 75
    end
    object FloatField84: TFloatField
      DisplayLabel = 'Qtde'
      FieldName = 'QUANTIDADE'
    end
    object FloatField85: TFloatField
      DisplayLabel = 'Vl Unit'
      FieldName = 'VALOR_UNITARIO'
    end
    object FloatField86: TFloatField
      DisplayLabel = 'Vl Total'
      FieldName = 'VALOR_TOTAL'
    end
    object IntegerField202: TIntegerField
      DisplayLabel = 'Cod NF'
      FieldName = 'COD_NF'
      Required = True
    end
    object IntegerField203: TIntegerField
      DisplayLabel = 'N Item'
      FieldName = 'NITEM'
      Required = True
    end
    object IntegerField204: TIntegerField
      DisplayLabel = 'Credito vinculado'
      FieldName = 'COD_CRED_RET_FIN'
    end
    object IntegerField205: TIntegerField
      DisplayLabel = 'Unificada'
      FieldName = 'COD_EMPRESA'
    end
  end
  object dsConciliacaoCielo: TDataSource
    AutoEdit = False
    DataSet = cdsConciliacaoCielo
    Left = 37
    Top = 656
  end
  object qrNumEstConciliacao: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      
        'select 0 cod_empresa, 0 codigo, '#39'Todos'#39' identificacao_emp from r' +
        'db$database'
      'union all'
      
        'select conciliacao_estab_emp.cod_estab, conciliacao_estab_emp.co' +
        'digo, empresa.identificacao_emp  from conciliacao_estab_emp'
      
        'inner join empresa on empresa.cod_empresa = conciliacao_estab_em' +
        'p.cod_estab'
      'order by 1, 2')
    Left = 1773
    Top = 72
  end
  object dspNumEstConciliacao: TDataSetProvider
    DataSet = qrNumEstConciliacao
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1773
    Top = 128
  end
  object cdsNumEstConciliacao: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspNumEstConciliacao'
    BeforeOpen = cdsCtrlChBeforeOpen
    Left = 1773
    Top = 176
    object cdsNumEstConciliacaoCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
    end
    object cdsNumEstConciliacaoCODIGO: TStringField
      FieldName = 'CODIGO'
    end
    object cdsNumEstConciliacaoIDENTIFICACAO_EMP: TStringField
      FieldName = 'IDENTIFICACAO_EMP'
      Size = 64
    end
  end
  object dsNumEstConciliacao: TDataSource
    DataSet = cdsNumEstConciliacao
    Left = 1773
    Top = 232
  end
  object qrNumEstConciliacao2: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      
        'select 0 cod_empresa, 0 codigo, '#39'Todos'#39' identificacao_emp from r' +
        'db$database'
      'union all'
      
        'select conciliacao_estab_emp.cod_estab, conciliacao_estab_emp.co' +
        'digo, empresa.identificacao_emp  from conciliacao_estab_emp'
      
        'inner join empresa on empresa.cod_empresa = conciliacao_estab_em' +
        'p.cod_estab'
      'order by 1, 2')
    Left = 1893
    Top = 72
  end
  object dspNumEstConciliacao2: TDataSetProvider
    DataSet = qrNumEstConciliacao2
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1893
    Top = 128
  end
  object cdsNumEstConciliacao2: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspNumEstConciliacao2'
    BeforeOpen = cdsCtrlChBeforeOpen
    Left = 1893
    Top = 176
    object IntegerField206: TIntegerField
      FieldName = 'COD_EMPRESA'
    end
    object StringField227: TStringField
      FieldName = 'CODIGO'
    end
    object StringField228: TStringField
      FieldName = 'IDENTIFICACAO_EMP'
      Size = 64
    end
  end
  object dsNumEstConciliacao2: TDataSource
    DataSet = cdsNumEstConciliacao2
    Left = 1893
    Top = 232
  end
  object qrConciliacaoFinanceiroAdm: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      
        'select DATA, DATE_, REQUEST_DATE, EFFECTED_DATE, PAYMENT_DATE, B' +
        'ANK_SHIPPING_DATE, ID, COD_EMPRESA, ARQUIVO, DATA_ARQUIVO, ESTAB' +
        'LISHMENT_NUMBER, NSU, AUTHORIZATION_NUMBER,'
      
        'TYPE_, TYPE_DESCRIPTION, ACQUIRER_ID, ACQUIRER_NAME, BRAND_ID, B' +
        'RAND_NAME,'
      'EVENT_TYPE,  EVENT_TYPE_DESCRIPTION,'
      'DESCRIPTION, BANK_RECON_STATUS, BANK_RECON_DESCRIPTION,'
      'GROSS_AMOUNT, EVENT_NET_AMOUNT, BATCH_NET_AMOUNT,'
      
        'GROSS_EVENT_AMOUNT, BATCH_GROSS_AMOUNT, TAX, SALE_TAX, CUSTOMER_' +
        'TAX, INSTALLMENT_NUMBER, INSTALLMENTS_TOTAL,'
      'BANK_NUMBER, BANK_NAME, BRANCH_NUMBER, ACCOUNT_NUMBER,'
      
        'IDENTIFICACAO_EMP, CODIGO_CTRL, NOME_CTRL, CODIGO_CTRL_TX, NOME_' +
        'CTRL_TX,'
      
        'N_CONTA_PLC_TX_CARTAO, N_CONTA_PLC_TARIFA_CARTAO, N_CONTA_PLC, D' +
        'ESC_PLC,'
      
        'COD_CRED, N_DOC_V, N_DOC_C, TP_DOC_V, VALOR_C, VALOR_LIQUIDO, VA' +
        'LOR_ORIGINAL, '
      
        'DATA_REC_C, DATA_VENC_C, STATUS_C, DATQ_C, STATUSQ_C, TAXA_CRED,' +
        ' COD_CLIENTE, NOME_CLIENTE, RAZAO,'
      
        'COD_TERMINAL_ADM, DESC_TERM_ADM, COD_ADM, DESCRICAO_ADM, COD_BAN' +
        'DEIRA_ADM, DESC_BANDEIRA_ADM, PIX_ID, FORM_PAG_COD,FORM_PAG,COD_' +
        'AJUSTE_COD, COD_AJUSTE,BANDEIRA_COD,BANDEIRA,STATUS_PAG_COD,STAT' +
        'US_PAG,STATUS_PAG_ST, TIPO_LANCAMENTO_COD, TIPO_LANCAMENTO,TIPO_' +
        'LIQUIDACAO_COD,TIPO_LIQUIDACAO, TIPO_ANTECIPACAO_COD, TIPO_ANTEC' +
        'IPACAO,TIPO_CARTAO_COD, TIPO_CARTAO, MOTIVO_REJ_COD, MOTIVO_REJ,' +
        ' GRUPO_CARTAO_COD, GRUPO_CARTAO, TIPO_TRANSACAO_COD, TIPO_TRANSA' +
        'CAO, STATUS_TRANSF_COD,'
      
        'STATUS_TRANSF, STATUS_TRANSF_ST, ORIGEM_AJUSTE_COD, ORIGEM_AJUST' +
        'E'
      'from VW_CONCILIACAO_FINANC_ADM'
      'where DATE_ >= '#39'01/01/2000'#39
      'and DATE_ <= '#39'01/01/2000'#39
      'and COD_EMPRESA = 1')
    Left = 1221
    Top = 528
  end
  object dspConciliacaoFinanceiroAdm: TDataSetProvider
    DataSet = qrConciliacaoFinanceiroAdm
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1221
    Top = 584
  end
  object cdsConciliacaoFinanceiroAdm: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspConciliacaoFinanceiroAdm'
    BeforeOpen = cdsCtrlChBeforeOpen
    Left = 1221
    Top = 632
    object StringField230: TStringField
      DisplayLabel = 'Estabelecimento'
      FieldName = 'ESTABLISHMENT_NUMBER'
      ReadOnly = True
      Size = 30
    end
    object DateTimeField62: TDateTimeField
      DisplayLabel = 'Data'
      FieldName = 'DATA'
    end
    object StringField231: TStringField
      DisplayLabel = 'Num Doc/NSU/CV'
      FieldName = 'NSU'
    end
    object StringField232: TStringField
      DisplayLabel = 'Num Aut Cartao'
      FieldName = 'AUTHORIZATION_NUMBER'
    end
    object IntegerField207: TIntegerField
      DisplayLabel = 'Num Parc'
      FieldName = 'INSTALLMENT_NUMBER'
    end
    object IntegerField208: TIntegerField
      DisplayLabel = 'Qtde Parc'
      FieldName = 'INSTALLMENTS_TOTAL'
    end
    object IntegerField209: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Tipo'
      FieldName = 'TYPE_'
    end
    object StringField233: TStringField
      Tag = 1
      DisplayLabel = 'Tipo'
      FieldName = 'TYPE_DESCRIPTION'
      Size = 30
    end
    object IntegerField210: TIntegerField
      Tag = 1
      DisplayLabel = 'Adquirente Id'
      FieldName = 'ACQUIRER_ID'
    end
    object StringField234: TStringField
      DisplayLabel = 'Adquirente'
      FieldName = 'ACQUIRER_NAME'
      Size = 30
    end
    object IntegerField211: TIntegerField
      Tag = 1
      DisplayLabel = 'Bandeira Id'
      FieldName = 'BRAND_ID'
    end
    object StringField235: TStringField
      DisplayLabel = 'Bandeira'
      FieldName = 'BRAND_NAME'
      Size = 30
    end
    object IntegerField212: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Evento'
      FieldName = 'EVENT_TYPE'
    end
    object StringField236: TStringField
      DisplayLabel = 'Evento'
      FieldName = 'EVENT_TYPE_DESCRIPTION'
      Size = 30
    end
    object cdsConciliacaoFinanceiroAdmSTATUSQ_C: TStringField
      DisplayLabel = 'Status Cred'
      FieldName = 'STATUSQ_C'
      ReadOnly = True
      FixedChar = True
      Size = 9
    end
    object DateTimeField63: TDateTimeField
      DisplayLabel = 'Data Cadastro'
      FieldName = 'DATA_REC_C'
      EditMask = '!99/99/0000;1;_'
    end
    object DateTimeField64: TDateTimeField
      DisplayLabel = 'Data Vencimento'
      FieldName = 'DATA_VENC_C'
      EditMask = '!99/99/0000;1;_'
    end
    object DateTimeField69: TDateTimeField
      DisplayLabel = 'Data Pag'
      FieldName = 'PAYMENT_DATE'
      ReadOnly = True
    end
    object DateTimeField65: TDateTimeField
      DisplayLabel = 'Data Quitacao'
      FieldName = 'DATQ_C'
    end
    object FloatField87: TFloatField
      DisplayLabel = 'Valor Credito'
      FieldName = 'VALOR_C'
      DisplayFormat = '##0.00'
    end
    object FloatField88: TFloatField
      DisplayLabel = 'Valor Liquido Cred'
      FieldName = 'VALOR_LIQUIDO'
      DisplayFormat = '##0.00'
    end
    object FloatField90: TFloatField
      DisplayLabel = 'Valor Liquido'
      FieldName = 'EVENT_NET_AMOUNT'
      DisplayFormat = '##0.00'
    end
    object FloatField89: TFloatField
      Tag = 1
      DisplayLabel = 'Valor Original cred'
      FieldName = 'VALOR_ORIGINAL'
      DisplayFormat = '##0.00'
    end
    object FloatField91: TFloatField
      DisplayLabel = 'Taxa no pagamento (%)'
      FieldName = 'TAX'
      DisplayFormat = '##0.00'
    end
    object FloatField92: TFloatField
      Tag = 1
      DisplayLabel = 'Taxa na venda (%)'
      FieldName = 'SALE_TAX'
      DisplayFormat = '##0.00'
    end
    object FloatField93: TFloatField
      Tag = 1
      DisplayLabel = 'Taxa cadastrada confere (%)'
      FieldName = 'CUSTOMER_TAX'
      DisplayFormat = '##0.00'
    end
    object FloatField94: TFloatField
      DisplayLabel = 'Taxa aplicada sistema (%)'
      FieldName = 'TAXA_CRED'
      DisplayFormat = '##0.00'
    end
    object StringField237: TStringField
      DisplayLabel = 'Descricao'
      FieldName = 'DESCRIPTION'
      Size = 250
    end
    object IntegerField213: TIntegerField
      DisplayLabel = 'Num Banco'
      FieldName = 'BANK_NUMBER'
    end
    object StringField238: TStringField
      DisplayLabel = 'Banco'
      FieldName = 'BANK_NAME'
      Size = 30
    end
    object IntegerField214: TIntegerField
      DisplayLabel = 'Agencia'
      FieldName = 'BRANCH_NUMBER'
    end
    object StringField239: TStringField
      DisplayLabel = 'Numero Conta'
      FieldName = 'ACCOUNT_NUMBER'
    end
    object FloatField95: TFloatField
      DisplayLabel = 'Num Conta'
      FieldName = 'N_CONTA_PLC'
    end
    object StringField240: TStringField
      DisplayLabel = 'Descri'#231#227'o de Contas'
      FieldName = 'DESC_PLC'
      FixedChar = True
      Size = 30
    end
    object IntegerField215: TIntegerField
      DisplayLabel = 'Cod Controle'
      FieldName = 'CODIGO_CTRL'
    end
    object StringField241: TStringField
      DisplayLabel = 'Controle'
      FieldName = 'NOME_CTRL'
      Size = 35
    end
    object StringField242: TStringField
      DisplayLabel = 'Num Documento'
      FieldName = 'N_DOC_C'
      FixedChar = True
    end
    object IntegerField216: TIntegerField
      DisplayLabel = 'Num Doc Venda'
      FieldName = 'N_DOC_V'
    end
    object StringField243: TStringField
      DisplayLabel = 'Tipo Doc Venda'
      FieldName = 'TP_DOC_V'
      FixedChar = True
      Size = 6
    end
    object StringField244: TStringField
      DisplayLabel = 'Status Cred'
      FieldName = 'STATUS_C'
      FixedChar = True
      Size = 10
    end
    object IntegerField217: TIntegerField
      DisplayLabel = 'Cod Cred'
      FieldName = 'COD_CRED'
    end
    object IntegerField218: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
      Required = True
    end
    object StringField245: TStringField
      DisplayLabel = 'Situacao'
      FieldName = 'BANK_RECON_DESCRIPTION'
      FixedChar = True
      Size = 25
    end
    object IntegerField219: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Situacao'
      FieldName = 'BANK_RECON_STATUS'
    end
    object IntegerField220: TIntegerField
      DisplayLabel = 'Cod Cliente'
      FieldName = 'COD_CLIENTE'
    end
    object StringField246: TStringField
      DisplayLabel = 'Nome Fantasia (Cliente)'
      FieldName = 'NOME_CLIENTE'
      Size = 35
    end
    object StringField247: TStringField
      DisplayLabel = 'Razao Social (Cliente)'
      FieldName = 'RAZAO'
      ReadOnly = True
      Size = 60
    end
    object IntegerField221: TIntegerField
      Tag = 1
      FieldName = 'CODIGO_CTRL_TX'
    end
    object StringField248: TStringField
      Tag = 1
      FieldName = 'NOME_CTRL_TX'
      FixedChar = True
      Size = 1
    end
    object FloatField96: TFloatField
      Tag = 1
      DisplayLabel = 'Num Conta Taxa Cartao'
      FieldName = 'N_CONTA_PLC_TX_CARTAO'
    end
    object FloatField97: TFloatField
      Tag = 1
      DisplayLabel = 'Num Conta Tarifa Cartao'
      FieldName = 'N_CONTA_PLC_TARIFA_CARTAO'
    end
    object IntegerField222: TIntegerField
      DisplayLabel = 'Cod Unificada'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object StringField249: TStringField
      DisplayLabel = 'Unificada'
      FieldName = 'IDENTIFICACAO_EMP'
      Size = 64
    end
    object FloatField98: TFloatField
      DisplayLabel = 'Valor Total Bruto'
      FieldName = 'GROSS_AMOUNT'
      DisplayFormat = '##0.00'
    end
    object FloatField99: TFloatField
      DisplayLabel = 'Valor Liquido Lote'
      FieldName = 'BATCH_NET_AMOUNT'
      DisplayFormat = '##0.00'
    end
    object StringField250: TStringField
      DisplayLabel = 'Cod Terminal'
      FieldName = 'COD_TERMINAL_ADM'
      FixedChar = True
      Size = 1
    end
    object StringField251: TStringField
      DisplayLabel = 'Terminal'
      FieldName = 'DESC_TERM_ADM'
      FixedChar = True
      Size = 1
    end
    object IntegerField223: TIntegerField
      DisplayLabel = 'Cod Adm'
      FieldName = 'COD_ADM'
      ReadOnly = True
    end
    object StringField252: TStringField
      DisplayLabel = 'Adm'
      FieldName = 'DESCRICAO_ADM'
      FixedChar = True
      Size = 1
    end
    object IntegerField224: TIntegerField
      DisplayLabel = 'Cod Bandeira Adm'
      FieldName = 'COD_BANDEIRA_ADM'
      ReadOnly = True
    end
    object StringField253: TStringField
      DisplayLabel = 'Bandeira Adm'
      FieldName = 'DESC_BANDEIRA_ADM'
      ReadOnly = True
      Size = 32
    end
    object StringField254: TStringField
      DisplayLabel = 'Pix Id'
      FieldName = 'PIX_ID'
      ReadOnly = True
      Size = 36
    end
    object FloatField100: TFloatField
      Tag = 1
      FieldName = 'GROSS_EVENT_AMOUNT'
      ReadOnly = True
    end
    object FloatField101: TFloatField
      Tag = 1
      FieldName = 'BATCH_GROSS_AMOUNT'
      ReadOnly = True
    end
    object StringField255: TStringField
      DisplayLabel = 'Forma Pag Cod'
      FieldName = 'FORM_PAG_COD'
      ReadOnly = True
      Size = 5
    end
    object StringField256: TStringField
      DisplayLabel = 'Form Pag'
      FieldName = 'FORM_PAG'
      Size = 100
    end
    object StringField257: TStringField
      DisplayLabel = 'Ajuste Cod'
      FieldName = 'COD_AJUSTE_COD'
      ReadOnly = True
      Size = 5
    end
    object StringField258: TStringField
      DisplayLabel = 'Ajuste'
      FieldName = 'COD_AJUSTE'
      Size = 200
    end
    object StringField259: TStringField
      DisplayLabel = 'Bandeira Cod'
      FieldName = 'BANDEIRA_COD'
      Size = 5
    end
    object StringField260: TStringField
      DisplayLabel = 'Bandeira'
      FieldName = 'BANDEIRA'
      Size = 30
    end
    object StringField261: TStringField
      DisplayLabel = 'Status Pag Cod'
      FieldName = 'STATUS_PAG_COD'
      ReadOnly = True
      Size = 5
    end
    object StringField262: TStringField
      DisplayLabel = 'Status Pag'
      FieldName = 'STATUS_PAG'
      Size = 100
    end
    object StringField263: TStringField
      DisplayLabel = 'Status Pag St'
      FieldName = 'STATUS_PAG_ST'
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object StringField264: TStringField
      DisplayLabel = 'Tipo Lancamento Cod'
      FieldName = 'TIPO_LANCAMENTO_COD'
      ReadOnly = True
      Size = 5
    end
    object StringField265: TStringField
      DisplayLabel = 'Tipo Lancamento'
      FieldName = 'TIPO_LANCAMENTO'
      Size = 150
    end
    object StringField266: TStringField
      DisplayLabel = 'Tipo Liquidacao Cod'
      FieldName = 'TIPO_LIQUIDACAO_COD'
      ReadOnly = True
      Size = 5
    end
    object StringField267: TStringField
      DisplayLabel = 'Tipo Liquidacao'
      FieldName = 'TIPO_LIQUIDACAO'
      Size = 30
    end
    object StringField268: TStringField
      DisplayLabel = 'Tipo Antecipacao Cod'
      FieldName = 'TIPO_ANTECIPACAO_COD'
      ReadOnly = True
      Size = 5
    end
    object StringField269: TStringField
      DisplayLabel = 'Tipo Antecipacao'
      FieldName = 'TIPO_ANTECIPACAO'
      Size = 30
    end
    object StringField270: TStringField
      DisplayLabel = 'Tipo Cartao Cod'
      FieldName = 'TIPO_CARTAO_COD'
      ReadOnly = True
      Size = 5
    end
    object StringField271: TStringField
      DisplayLabel = 'Tipo Cartao'
      FieldName = 'TIPO_CARTAO'
      Size = 50
    end
    object StringField272: TStringField
      DisplayLabel = 'Motivo Rejeicao Cod'
      FieldName = 'MOTIVO_REJ_COD'
      ReadOnly = True
      Size = 5
    end
    object StringField273: TStringField
      DisplayLabel = 'Motivo Rejeicao'
      FieldName = 'MOTIVO_REJ'
      Size = 50
    end
    object StringField274: TStringField
      DisplayLabel = 'Grupo Cartao Cod'
      FieldName = 'GRUPO_CARTAO_COD'
      ReadOnly = True
      Size = 5
    end
    object StringField275: TStringField
      DisplayLabel = 'Grupo Cartao'
      FieldName = 'GRUPO_CARTAO'
      Size = 100
    end
    object StringField276: TStringField
      DisplayLabel = 'Tipo Transacao Cod'
      FieldName = 'TIPO_TRANSACAO_COD'
      ReadOnly = True
      Size = 5
    end
    object StringField277: TStringField
      DisplayLabel = 'Tipo Transacao'
      FieldName = 'TIPO_TRANSACAO'
      Size = 30
    end
    object StringField278: TStringField
      DisplayLabel = 'Status Transf Cod'
      FieldName = 'STATUS_TRANSF_COD'
      ReadOnly = True
      Size = 5
    end
    object StringField279: TStringField
      DisplayLabel = 'Status Transf'
      FieldName = 'STATUS_TRANSF'
      Size = 50
    end
    object StringField280: TStringField
      DisplayLabel = 'Status Transf St'
      FieldName = 'STATUS_TRANSF_ST'
      FixedChar = True
      Size = 1
    end
    object StringField281: TStringField
      DisplayLabel = 'Origem Ajuste Cod'
      FieldName = 'ORIGEM_AJUSTE_COD'
      ReadOnly = True
      Size = 5
    end
    object StringField282: TStringField
      DisplayLabel = 'Origem Ajuste'
      FieldName = 'ORIGEM_AJUSTE'
      Size = 50
    end
    object DateTimeField66: TDateTimeField
      DisplayLabel = 'Data Mov'
      FieldName = 'DATE_'
      EditMask = '!99/99/0000;1;_'
    end
    object DateTimeField67: TDateTimeField
      DisplayLabel = 'Data Mov Orig'
      FieldName = 'REQUEST_DATE'
      ReadOnly = True
    end
    object DateTimeField68: TDateTimeField
      DisplayLabel = 'Data Efetivada'
      FieldName = 'EFFECTED_DATE'
      ReadOnly = True
    end
    object DateTimeField70: TDateTimeField
      DisplayLabel = 'Data Env Banco'
      FieldName = 'BANK_SHIPPING_DATE'
      ReadOnly = True
    end
    object StringField283: TStringField
      DisplayLabel = 'Arquivo'
      FieldName = 'ARQUIVO'
      ReadOnly = True
      Size = 255
    end
    object cdsConciliacaoFinanceiroAdmDATA_ARQUIVO: TDateTimeField
      DisplayLabel = 'Data Arquivo'
      FieldName = 'DATA_ARQUIVO'
      ReadOnly = True
    end
  end
  object dsConciliacaoFinanceiroAdm: TDataSource
    DataSet = cdsConciliacaoFinanceiroAdm
    Left = 1221
    Top = 688
  end
  object qrAdmCartaoConciliacao3: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select conciliacao_adquirente.nome as ordem,'
      'conciliacao_adquirente.id,'
      'conciliacao_adquirente.nome,'
      
        'coalesce((select first 1 adm_cartao.cod_adquirente from adm_cart' +
        'ao'
      'where adm_cartao.cod_adquirente = conciliacao_adquirente.id'
      'and adm_cartao.cod_empresa = conciliacao_adquirente.cod_empresa'
      
        'and adm_cartao.ativo = 1), 0) cod_adm from conciliacao_adquirent' +
        'e'
      'where conciliacao_adquirente.cod_empresa = 1'
      'and conciliacao_adquirente.ativo = 1')
    Left = 1629
    Top = 520
  end
  object dspAdmCartaoConciliacao3: TDataSetProvider
    DataSet = qrAdmCartaoConciliacao3
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1629
    Top = 576
  end
  object cdsAdmCartaoConciliacao3: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspAdmCartaoConciliacao3'
    BeforeOpen = cdsCtrlChBeforeOpen
    Left = 1629
    Top = 624
    object StringField284: TStringField
      FieldName = 'ORDEM'
      Required = True
      Size = 30
    end
    object IntegerField225: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object StringField285: TStringField
      FieldName = 'NOME'
      Size = 30
    end
    object IntegerField226: TIntegerField
      FieldName = 'COD_ADM'
      Required = True
    end
  end
  object dsAdmCartaoConciliacao3: TDataSource
    DataSet = cdsAdmCartaoConciliacao3
    Left = 1629
    Top = 680
  end
  object qrConciliacaoBandeira3: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      
        'select '#39'A'#39' ordem, id, nome, 0 cod_bandeira from conciliacao_band' +
        'eira')
    Left = 2093
    Top = 528
  end
  object dspConciliacaoBandeira3: TDataSetProvider
    DataSet = qrConciliacaoBandeira3
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 2093
    Top = 584
  end
  object cdsConciliacaoBandeira3: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspConciliacaoBandeira3'
    BeforeOpen = cdsCtrlChBeforeOpen
    Left = 2093
    Top = 632
    object StringField286: TStringField
      FieldName = 'ORDEM'
      FixedChar = True
      Size = 1
    end
    object IntegerField227: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object StringField287: TStringField
      FieldName = 'NOME'
      Size = 30
    end
    object IntegerField228: TIntegerField
      FieldName = 'COD_BANDEIRA'
    end
  end
  object dsConciliacaoBandeira3: TDataSource
    DataSet = cdsConciliacaoBandeira3
    Left = 2093
    Top = 688
  end
  object qrConciliacaoUnificadas3: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      
        'select cod_empresa, coalesce(identificacao_emp, nome_emp) identi' +
        'ficacao_emp from empresa'
      'where ativo = 1')
    Left = 1621
    Top = 72
  end
  object dspConciliacaoUnificadas3: TDataSetProvider
    DataSet = qrConciliacaoUnificadas3
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1621
    Top = 128
  end
  object cdsConciliacaoUnificadas3: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspConciliacaoUnificadas3'
    BeforeOpen = cdsCtrlChBeforeOpen
    Left = 1621
    Top = 176
    object IntegerField229: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object StringField288: TStringField
      FieldName = 'IDENTIFICACAO_EMP'
      Size = 64
    end
  end
  object dsConciliacaoUnificadas3: TDataSource
    DataSet = cdsConciliacaoUnificadas3
    Left = 1621
    Top = 232
  end
  object qrNumEstConciliacao3: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      
        'select 0 cod_empresa, 0 codigo, '#39'Todos'#39' identificacao_emp from r' +
        'db$database'
      'union all'
      
        'select conciliacao_estab_emp.cod_estab, conciliacao_estab_emp.co' +
        'digo, empresa.identificacao_emp  from conciliacao_estab_emp'
      
        'inner join empresa on empresa.cod_empresa = conciliacao_estab_em' +
        'p.cod_estab'
      'order by 1, 2')
    Left = 2013
    Top = 72
  end
  object dspNumEstConciliacao3: TDataSetProvider
    DataSet = qrNumEstConciliacao3
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 2013
    Top = 128
  end
  object cdsNumEstConciliacao3: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspNumEstConciliacao3'
    BeforeOpen = cdsCtrlChBeforeOpen
    Left = 2013
    Top = 176
    object IntegerField230: TIntegerField
      FieldName = 'COD_EMPRESA'
    end
    object StringField289: TStringField
      FieldName = 'CODIGO'
    end
    object StringField290: TStringField
      FieldName = 'IDENTIFICACAO_EMP'
      Size = 64
    end
  end
  object dsNumEstConciliacao3: TDataSource
    DataSet = cdsNumEstConciliacao3
    Left = 2013
    Top = 232
  end
  object qrNegativarCliente: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select neg.* from sp_negativar_desnegativar_cl'
      '(-1, 1, 0, '#39'F'#39', current_date, current_date, current_date) neg')
    Left = 168
    Top = 512
  end
  object cdsNegativarCliente: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspNegativarCliente'
    BeforeOpen = cdsCtrlChBeforeOpen
    Left = 165
    Top = 560
    object cdsNegativarClienteSEL: TStringField
      Tag = 2
      DisplayLabel = 'Sel'
      FieldKind = fkInternalCalc
      FieldName = 'SEL'
      Size = 1
    end
    object cdsNegativarClienteNOME_CLIENTE: TStringField
      DisplayLabel = 'Nome Cliente'
      FieldName = 'NOME_CLIENTE'
      Required = True
      FixedChar = True
      Size = 35
    end
    object cdsNegativarClienteRAZAO: TStringField
      DisplayLabel = 'Raz'#227'o Social'
      FieldName = 'RAZAO'
      Required = True
      Size = 60
    end
    object cdsNegativarClienteCPFCGC: TStringField
      DisplayLabel = 'CPF / CNPJ'
      FieldName = 'CPFCGC'
      Size = 18
    end
    object cdsNegativarClienteCODIGO_FATURAMENTO: TIntegerField
      Tag = 1
      DisplayLabel = 'Codigo Faturamento'
      FieldName = 'CODIGO_FATURAMENTO'
      Visible = False
    end
    object cdsNegativarClienteDESC_FAT: TStringField
      DisplayLabel = 'Faturamento'
      FieldName = 'DESC_FAT'
      FixedChar = True
      Size = 30
    end
    object cdsNegativarClienteSTATUS_F: TStringField
      Tag = 1
      DisplayLabel = 'Status Faturamento'
      FieldName = 'STATUS_F'
      Visible = False
      FixedChar = True
      Size = 10
    end
    object cdsNegativarClienteVALOR: TFloatField
      DisplayLabel = 'Valor Credi'#225'rio'
      FieldName = 'VALOR'
      currency = True
    end
    object cdsNegativarClienteQTDE: TIntegerField
      DisplayLabel = 'Qtde Credi'#225'rio'
      FieldName = 'QTDE'
    end
    object cdsNegativarClienteCOD_CLIENTE: TIntegerField
      Tag = 2
      DisplayLabel = 'Cod Cliente'
      FieldName = 'COD_CLIENTE'
    end
    object cdsNegativarClienteCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Visible = False
    end
  end
  object dspNegativarCliente: TDataSetProvider
    DataSet = qrNegativarCliente
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 168
    Top = 608
  end
  object dsNegativarCliente: TDataSource
    DataSet = cdsNegativarCliente
    Left = 168
    Top = 656
  end
  object qrDesNegativarCliente: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select neg.* from sp_negativar_desnegativar_cl'
      '(-1, 1, 1, '#39'F'#39', current_date, current_date, current_date) neg')
    Left = 416
    Top = 512
  end
  object cdsDesNegativarCliente: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspDesNegativarCliente'
    BeforeOpen = cdsCtrlChBeforeOpen
    Left = 413
    Top = 560
    object cdsDesNegativarClienteSEL: TStringField
      Tag = 2
      DisplayLabel = 'Sel'
      FieldKind = fkInternalCalc
      FieldName = 'SEL'
      Size = 1
    end
    object StringField229: TStringField
      DisplayLabel = 'Nome Cliente'
      FieldName = 'NOME_CLIENTE'
      Required = True
      FixedChar = True
      Size = 35
    end
    object StringField291: TStringField
      DisplayLabel = 'Raz'#227'o Social'
      FieldName = 'RAZAO'
      Required = True
      Size = 60
    end
    object StringField292: TStringField
      DisplayLabel = 'CPF / CNPJ'
      FieldName = 'CPFCGC'
      Size = 18
    end
    object cdsDesNegativarClienteCODIGO_FATURAMENTO: TIntegerField
      Tag = 1
      DisplayLabel = 'Codigo Fatuamento'
      FieldName = 'CODIGO_FATURAMENTO'
      Visible = False
    end
    object cdsDesNegativarClienteDESC_FAT: TStringField
      DisplayLabel = 'Faturamento'
      FieldName = 'DESC_FAT'
      FixedChar = True
      Size = 30
    end
    object cdsDesNegativarClienteSTATUS_F: TStringField
      Tag = 1
      DisplayLabel = 'Status Faturamento'
      FieldName = 'STATUS_F'
      Visible = False
      FixedChar = True
      Size = 10
    end
    object FloatField102: TFloatField
      DisplayLabel = 'Valor Credi'#225'rio'
      FieldName = 'VALOR'
      currency = True
    end
    object IntegerField233: TIntegerField
      DisplayLabel = 'Qtde Credi'#225'rio'
      FieldName = 'QTDE'
    end
    object IntegerField231: TIntegerField
      Tag = 2
      DisplayLabel = 'Cod Cliente'
      FieldName = 'COD_CLIENTE'
    end
    object IntegerField232: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Visible = False
    end
  end
  object dspDesNegativarCliente: TDataSetProvider
    DataSet = qrDesNegativarCliente
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 416
    Top = 608
  end
  object dsDesNegativarCliente: TDataSource
    DataSet = cdsDesNegativarCliente
    Left = 416
    Top = 656
  end
  object qrCredNegativarCliente: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select * from sp_neg_desneg_cl_cred'
      '('#39#39', -1, 1, '#39'F'#39', current_date, current_date, current_date)')
    Left = 288
    Top = 512
  end
  object cdsCredNegativarCliente: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspCredNegativarCliente'
    BeforeOpen = cdsCtrlChBeforeOpen
    Left = 285
    Top = 560
    object cdsCredNegativarClienteCOD_EMP_MULT: TIntegerField
      DisplayLabel = 'Emp'
      FieldName = 'COD_EMP_MULT'
    end
    object cdsCredNegativarClienteCOD_CRED: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'COD_CRED'
    end
    object cdsCredNegativarClienteTIPO_DOC_C: TStringField
      DisplayLabel = 'Tipo Documento'
      DisplayWidth = 15
      FieldName = 'TIPO_DOC_C'
      Size = 15
    end
    object cdsCredNegativarClienteN_CH: TStringField
      DisplayLabel = 'Num Cheque'
      FieldName = 'N_CH'
    end
    object cdsCredNegativarClienteN_DOC_V: TIntegerField
      DisplayLabel = 'Num Doc Venda'
      FieldName = 'N_DOC_V'
    end
    object cdsCredNegativarClienteN_DOC_C: TStringField
      DisplayLabel = 'Num Documento'
      FieldName = 'N_DOC_C'
    end
    object cdsCredNegativarClienteTP_DOC_V: TStringField
      DisplayLabel = 'Tipo Doc Venda'
      FieldName = 'TP_DOC_V'
      Size = 6
    end
    object cdsCredNegativarClienteVALOR_C: TFloatField
      DisplayLabel = 'Valor Credito'
      FieldName = 'VALOR_C'
      DisplayFormat = '##0.00'
    end
    object cdsCredNegativarClienteVALOR_CORR: TFloatField
      DisplayLabel = 'Valor Corrigido'
      FieldName = 'VALOR_CORR'
      DisplayFormat = '##0.00'
    end
    object cdsCredNegativarClienteDATA_REC_C: TDateTimeField
      DisplayLabel = 'Data Cadastro'
      FieldName = 'DATA_REC_C'
    end
    object cdsCredNegativarClienteDATA_VENC_C: TDateTimeField
      DisplayLabel = 'Data Vencimento'
      FieldName = 'DATA_VENC_C'
    end
    object cdsCredNegativarClienteDATA_PREV_REC: TDateTimeField
      DisplayLabel = 'Data Prev Rec'
      FieldName = 'DATA_PREV_REC'
    end
    object cdsCredNegativarClienteDATQ_C: TDateTimeField
      DisplayLabel = 'Data Quita'#231#227'o'
      FieldName = 'DATQ_C'
    end
    object cdsCredNegativarClienteSTATUS_C: TStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS_C'
      Size = 10
    end
    object cdsCredNegativarClienteCODIGO_CTRL: TIntegerField
      DisplayLabel = 'Cod Controle'
      FieldName = 'CODIGO_CTRL'
    end
    object cdsCredNegativarClienteNOME_CTRL: TStringField
      DisplayLabel = 'Controle'
      FieldName = 'NOME_CTRL'
      Size = 35
    end
    object cdsCredNegativarClienteCOD_CLIENTE: TIntegerField
      DisplayLabel = 'Cod Cliente'
      FieldName = 'COD_CLIENTE'
    end
    object cdsCredNegativarClienteNOME_CLIENTE: TStringField
      DisplayLabel = 'Nome Fantasia'
      FieldName = 'NOME_CLIENTE'
      Size = 35
    end
    object cdsCredNegativarClienteRAZAO: TStringField
      DisplayLabel = 'Raz'#227'o Social'
      FieldName = 'RAZAO'
      Size = 60
    end
    object cdsCredNegativarClienteCPFCGC: TStringField
      DisplayLabel = 'CPF / CNPJ'
      FieldName = 'CPFCGC'
      Size = 18
    end
  end
  object dspCredNegativarCliente: TDataSetProvider
    DataSet = qrCredNegativarCliente
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 288
    Top = 608
  end
  object dsCredNegativarCliente: TDataSource
    DataSet = cdsCredNegativarCliente
    Left = 288
    Top = 656
  end
  object qrCredDesNegativarCliente: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select * from sp_neg_desneg_cl_cred'
      '('#39#39', -1, 1, '#39'F'#39', current_date, current_date, current_date)')
    Left = 552
    Top = 512
  end
  object cdsCredDesNegativarCliente: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspCredDesNegativarCliente'
    BeforeOpen = cdsCtrlChBeforeOpen
    Left = 549
    Top = 560
    object IntegerField234: TIntegerField
      DisplayLabel = 'Emp'
      FieldName = 'COD_EMP_MULT'
    end
    object cdsCredDesNegativarClienteCOD_CRED: TIntegerField
      Tag = 2
      DisplayLabel = 'Codigo'
      FieldName = 'COD_CRED'
      Required = True
    end
    object StringField293: TStringField
      DisplayLabel = 'Tipo Documento'
      FieldName = 'TIPO_DOC_C'
      FixedChar = True
      Size = 15
    end
    object cdsCredDesNegativarClienteN_CH: TStringField
      DisplayLabel = 'Num Cheque'
      FieldName = 'N_CH'
      FixedChar = True
    end
    object IntegerField235: TIntegerField
      Tag = 2
      DisplayLabel = 'Num Doc Venda'
      FieldName = 'N_DOC_V'
    end
    object StringField294: TStringField
      Tag = 2
      DisplayLabel = 'Num Documento'
      FieldName = 'N_DOC_C'
      FixedChar = True
    end
    object StringField295: TStringField
      Tag = 2
      DisplayLabel = 'Tipo Doc Venda'
      FieldName = 'TP_DOC_V'
      FixedChar = True
      Size = 6
    end
    object FloatField103: TFloatField
      Tag = 2
      DisplayLabel = 'Valor Credito'
      FieldName = 'VALOR_C'
      DisplayFormat = '##0.00'
    end
    object FloatField104: TFloatField
      DisplayLabel = 'Valor Corrigido'
      FieldName = 'VALOR_CORR'
      DisplayFormat = '##0.00'
    end
    object DateTimeField71: TDateTimeField
      Tag = 2
      DisplayLabel = 'Data Cadastro'
      FieldName = 'DATA_REC_C'
    end
    object DateTimeField72: TDateTimeField
      Tag = 2
      DisplayLabel = 'Data Vencimento'
      FieldName = 'DATA_VENC_C'
    end
    object cdsCredDesNegativarClienteDATA_PREV_REC: TDateTimeField
      DisplayLabel = 'Data Prev Rec'
      FieldName = 'DATA_PREV_REC'
    end
    object cdsCredDesNegativarClienteDATQ_C: TDateTimeField
      DisplayLabel = 'Data Quita'#231#227'o'
      FieldName = 'DATQ_C'
    end
    object cdsCredDesNegativarClienteSTATUS_C: TStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS_C'
      FixedChar = True
      Size = 10
    end
    object IntegerField236: TIntegerField
      DisplayLabel = 'Cod Controle'
      FieldName = 'CODIGO_CTRL'
      Required = True
    end
    object StringField296: TStringField
      DisplayLabel = 'Controle'
      FieldName = 'NOME_CTRL'
      Size = 35
    end
    object cdsCredDesNegativarClienteCOD_CLIENTE: TIntegerField
      DisplayLabel = 'Cod Cliente'
      FieldName = 'COD_CLIENTE'
    end
    object cdsCredDesNegativarClienteNOME_CLIENTE: TStringField
      DisplayLabel = 'Nome Fantasia'
      FieldName = 'NOME_CLIENTE'
      Required = True
      Size = 35
    end
    object cdsCredDesNegativarClienteRAZAO: TStringField
      DisplayLabel = 'Raz'#227'o Social'
      FieldName = 'RAZAO'
      Required = True
      Size = 60
    end
    object cdsCredDesNegativarClienteCPFCGC: TStringField
      DisplayLabel = 'CPF / CNPJ'
      FieldName = 'CPFCGC'
      Size = 18
    end
  end
  object dspCredDesNegativarCliente: TDataSetProvider
    DataSet = qrCredDesNegativarCliente
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 552
    Top = 608
  end
  object dsCredDesNegativarCliente: TDataSource
    DataSet = cdsCredDesNegativarCliente
    Left = 552
    Top = 656
  end
  object qrDesNegativarCliente2: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select neg.* from sp_desnegativar_cl'
      '(0, 1, '#39'F'#39', current_date, current_date, current_date) neg')
    Left = 696
    Top = 512
  end
  object cdsDesNegativarCliente2: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspDesNegativarCliente2'
    BeforeOpen = cdsCtrlChBeforeOpen
    Left = 693
    Top = 560
    object cdsDesNegativarCliente2SEL: TStringField
      Tag = 2
      DisplayLabel = 'Sel'
      FieldKind = fkInternalCalc
      FieldName = 'SEL'
      Size = 1
    end
    object cdsDesNegativarCliente2NOME_CLIENTE: TStringField
      DisplayLabel = 'Nome Cliente'
      FieldName = 'NOME_CLIENTE'
      Size = 35
    end
    object cdsDesNegativarCliente2RAZAO: TStringField
      DisplayLabel = 'Raz'#227'o Social'
      FieldName = 'RAZAO'
      Size = 60
    end
    object cdsDesNegativarCliente2CPFCGC: TStringField
      DisplayLabel = 'CPF / CNPJ'
      FieldName = 'CPFCGC'
      Size = 18
    end
    object cdsDesNegativarCliente2CODIGO_FATURAMENTO: TIntegerField
      DisplayLabel = 'Codigo Faturamento'
      FieldName = 'CODIGO_FATURAMENTO'
    end
    object cdsDesNegativarCliente2DESC_FAT: TStringField
      DisplayLabel = 'Faturamento'
      FieldName = 'DESC_FAT'
      Size = 30
    end
    object cdsDesNegativarCliente2STATUS_F: TStringField
      DisplayLabel = 'Status Faturamento'
      FieldName = 'STATUS_F'
      Size = 10
    end
    object cdsDesNegativarCliente2COD_CLIENTE: TIntegerField
      Tag = 2
      DisplayLabel = 'Cod Cliente'
      FieldName = 'COD_CLIENTE'
    end
    object cdsDesNegativarCliente2COD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Visible = False
    end
  end
  object dspDesNegativarCliente2: TDataSetProvider
    DataSet = qrDesNegativarCliente2
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 696
    Top = 608
  end
  object dsDesNegativarCliente2: TDataSource
    DataSet = cdsDesNegativarCliente2
    Left = 696
    Top = 656
  end
  object qrCredDesNegativarCliente2: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select cred.* from sp_desneg_cl_cred'
      
        '('#39#39', -1, 1, '#39'AMBOS'#39', '#39'F'#39', current_date, current_date, current_da' +
        'te) cred')
    Left = 840
    Top = 512
  end
  object cdsCredDesNegativarCliente2: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspCredDesNegativarCliente2'
    BeforeOpen = cdsCtrlChBeforeOpen
    Left = 837
    Top = 560
    object cdsCredDesNegativarCliente2COD_EMP_MULT: TIntegerField
      DisplayLabel = 'Emp'
      FieldName = 'COD_EMP_MULT'
    end
    object cdsCredDesNegativarCliente2COD_CRED: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'COD_CRED'
    end
    object cdsCredDesNegativarCliente2TIPO_DOC_C: TStringField
      DisplayLabel = 'Tipo Documento'
      FieldName = 'TIPO_DOC_C'
      Size = 15
    end
    object cdsCredDesNegativarCliente2N_CH: TStringField
      DisplayLabel = 'Num Cheque'
      FieldName = 'N_CH'
    end
    object cdsCredDesNegativarCliente2N_DOC_V: TIntegerField
      DisplayLabel = 'Num Doc Venda'
      FieldName = 'N_DOC_V'
    end
    object cdsCredDesNegativarCliente2N_DOC_C: TStringField
      DisplayLabel = 'Num Documento'
      FieldName = 'N_DOC_C'
      FixedChar = True
    end
    object cdsCredDesNegativarCliente2TP_DOC_V: TStringField
      DisplayLabel = 'Tipo Doc Venda'
      FieldName = 'TP_DOC_V'
      FixedChar = True
      Size = 6
    end
    object cdsCredDesNegativarCliente2VALOR_C: TFloatField
      DisplayLabel = 'Valor Credito'
      FieldName = 'VALOR_C'
      DisplayFormat = '##0.00'
    end
    object cdsCredDesNegativarCliente2VALOR_CORR: TFloatField
      DisplayLabel = 'Valor Corrigido'
      FieldName = 'VALOR_CORR'
      DisplayFormat = '##0.00'
    end
    object cdsCredDesNegativarCliente2DATA_REC_C: TDateTimeField
      DisplayLabel = 'Data Cadastro'
      FieldName = 'DATA_REC_C'
    end
    object cdsCredDesNegativarCliente2DATA_VENC_C: TDateTimeField
      DisplayLabel = 'Data Vencimento'
      FieldName = 'DATA_VENC_C'
    end
    object cdsCredDesNegativarCliente2DATA_PREV_REC: TDateTimeField
      DisplayLabel = 'Data Prev Rec'
      FieldName = 'DATA_PREV_REC'
    end
    object cdsCredDesNegativarCliente2DATQ_C: TDateTimeField
      DisplayLabel = 'Data Quita'#231#227'o'
      FieldName = 'DATQ_C'
    end
    object cdsCredDesNegativarCliente2STATUS_C: TStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS_C'
      Size = 10
    end
    object cdsCredDesNegativarCliente2CODIGO_CTRL: TIntegerField
      DisplayLabel = 'Cod Controle'
      FieldName = 'CODIGO_CTRL'
    end
    object cdsCredDesNegativarCliente2NOME_CTRL: TStringField
      DisplayLabel = 'Controle'
      FieldName = 'NOME_CTRL'
      Size = 35
    end
    object cdsCredDesNegativarCliente2COD_CLIENTE: TIntegerField
      DisplayLabel = 'Cod Cliente'
      FieldName = 'COD_CLIENTE'
    end
    object cdsCredDesNegativarCliente2NOME_CLIENTE: TStringField
      DisplayLabel = 'Nome Fantasia'
      FieldName = 'NOME_CLIENTE'
      Size = 35
    end
    object cdsCredDesNegativarCliente2RAZAO: TStringField
      DisplayLabel = 'Raz'#227'o Social'
      FieldName = 'RAZAO'
      Size = 60
    end
    object cdsCredDesNegativarCliente2CPFCGC: TStringField
      DisplayLabel = 'CPF / CNPJ'
      FieldName = 'CPFCGC'
      Size = 18
    end
  end
  object dspCredDesNegativarCliente2: TDataSetProvider
    DataSet = qrCredDesNegativarCliente2
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 840
    Top = 608
  end
  object dsCredDesNegativarCliente2: TDataSource
    DataSet = cdsCredDesNegativarCliente2
    Left = 840
    Top = 656
  end
  object qrDocEletronicoNot: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      
        'select doc_eletronico.seqid, doc_eletronico.doc, doc_eletronico.' +
        'data from doc_eletronico')
    Left = 1024
    Top = 512
  end
  object cdsDocEletronicoNot: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspDocEletronicoNot'
    BeforeOpen = cdsCtrlChBeforeOpen
    Left = 1021
    Top = 560
    object cdsDocEletronicoNotSEQID: TLargeintField
      DisplayLabel = 'Id'
      FieldName = 'SEQID'
      Required = True
    end
    object cdsDocEletronicoNotDOC: TMemoField
      DisplayLabel = 'Doc'
      FieldName = 'DOC'
      BlobType = ftMemo
      Size = 8
    end
    object cdsDocEletronicoNotDATA: TDateTimeField
      DisplayLabel = 'Data'
      FieldName = 'DATA'
    end
  end
  object dspDocEletronicoNot: TDataSetProvider
    DataSet = qrDocEletronicoNot
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1024
    Top = 608
  end
  object dsDocEletronicoNot: TDataSource
    DataSet = cdsDocEletronicoNot
    Left = 1024
    Top = 656
  end
  object qrDocumentosOrigem: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select '
      'pedvenda.nped,'
      'pedvenda.tipo,'
      'pedvenda.cod_empresa,'
      'pedvenda.data_ped,'
      'pedvenda.data_fech,'
      'pedvenda.valor_total,'
      'pedvenda.tot_prod,'
      'pedvenda.tot_serv,'
      'pedvenda.tot_prod_terc,'
      'pedvenda.tot_serv_terc,'
      'clientes.nome_cliente, '
      'clientes.razao,'
      'clientes.cpfcgc from pedvenda'
      
        'inner join clientes on clientes.cod_cliente = pedvenda.cod_clien' +
        'te and clientes.cod_empresa = pedvenda.cod_empresa'
      'where pedvenda.nped = :nped'
      'and pedvenda.tipo = :tipo'
      'and pedvenda.cod_empresa = :cod_empresa')
    Left = 2133
    Top = 72
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'nped'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'tipo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cod_empresa'
        ParamType = ptUnknown
      end>
  end
  object dspDocumentosOrigem: TDataSetProvider
    DataSet = qrDocumentosOrigem
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 2133
    Top = 128
  end
  object cdsDocumentosOrigem: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspDocumentosOrigem'
    BeforeOpen = cdsCtrlChBeforeOpen
    Left = 2133
    Top = 176
    object cdsDocumentosOrigemNPED: TIntegerField
      DisplayLabel = 'Num Pedido'
      FieldName = 'NPED'
      Required = True
    end
    object cdsDocumentosOrigemTIPO: TStringField
      DisplayLabel = 'Tipo Pedido'
      FieldName = 'TIPO'
      Required = True
      FixedChar = True
      Size = 3
    end
    object cdsDocumentosOrigemCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsDocumentosOrigemDATA_PED: TDateTimeField
      DisplayLabel = 'Data Pedido'
      FieldName = 'DATA_PED'
    end
    object cdsDocumentosOrigemDATA_FECH: TDateTimeField
      DisplayLabel = 'Data Fechamento'
      FieldName = 'DATA_FECH'
    end
    object cdsDocumentosOrigemVALOR_TOTAL: TFloatField
      DisplayLabel = 'Valor Total'
      FieldName = 'VALOR_TOTAL'
      currency = True
    end
    object cdsDocumentosOrigemTOT_PROD: TFloatField
      DisplayLabel = 'Total Produtos'
      FieldName = 'TOT_PROD'
      currency = True
    end
    object cdsDocumentosOrigemTOT_SERV: TFloatField
      DisplayLabel = 'Total Servi'#231'os'
      FieldName = 'TOT_SERV'
      currency = True
    end
    object cdsDocumentosOrigemTOT_PROD_TERC: TFloatField
      DisplayLabel = 'Total Produtos Terc'
      FieldName = 'TOT_PROD_TERC'
      currency = True
    end
    object cdsDocumentosOrigemTOT_SERV_TERC: TFloatField
      DisplayLabel = 'Total Servi'#231'os Terc'
      FieldName = 'TOT_SERV_TERC'
      currency = True
    end
    object cdsDocumentosOrigemNOME_CLIENTE: TStringField
      DisplayLabel = 'Nome Fantasia'
      FieldName = 'NOME_CLIENTE'
      Required = True
      Size = 35
    end
    object cdsDocumentosOrigemRAZAO: TStringField
      DisplayLabel = 'Raz'#227'o Social'
      FieldName = 'RAZAO'
      Required = True
      Size = 60
    end
    object cdsDocumentosOrigemCPFCGC: TStringField
      DisplayLabel = 'CPF / CNPJ'
      FieldName = 'CPFCGC'
      Size = 18
    end
  end
  object dsDocumentosOrigem: TDataSource
    DataSet = cdsDocumentosOrigem
    Left = 2133
    Top = 232
  end
end
