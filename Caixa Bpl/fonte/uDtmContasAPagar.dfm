object dtmContasAPagar: TdtmContasAPagar
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 378
  Width = 1229
  object dsContaAPagar: TDataSource
    DataSet = cdsContaAPagar
    Left = 31
    Top = 216
  end
  object cdsContaAPagar: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspContaAPagar'
    BeforeOpen = cdsContaAPagarBeforeOpen
    Left = 31
    Top = 160
    object cdsContaAPagarSEL: TStringField
      Tag = 2
      DisplayLabel = 'Sel'
      FieldKind = fkInternalCalc
      FieldName = 'SEL'
      ProviderFlags = []
      Size = 1
    end
    object cdsContaAPagarNOME_FOR_CTP: TStringField
      DisplayLabel = 'Nome Fornecedor'
      FieldName = 'NOME_FOR_CTP'
      Origin = '"CONTAS_A_PAGAR"."NOME_FOR_CTP"'
      Size = 35
    end
    object cdsContaAPagarN_DOC_CTP: TStringField
      DisplayLabel = 'Num Documento'
      DisplayWidth = 14
      FieldName = 'N_DOC_CTP'
      Origin = '"CONTAS_A_PAGAR"."N_DOC_CTP"'
    end
    object cdsContaAPagarHISTORICO_CTP: TStringField
      DisplayLabel = 'Hist'#243'rico'
      FieldName = 'HISTORICO_CTP'
      Origin = '"CONTAS_A_PAGAR"."HISTORICO_CTP"'
      Size = 100
    end
    object cdsContaAPagarDATA_VENC_CTP: TDateTimeField
      DisplayLabel = 'Data Vencimento'
      DisplayWidth = 10
      FieldName = 'DATA_VENC_CTP'
      Origin = '"CONTAS_A_PAGAR"."DATA_VENC_CTP"'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsContaAPagarVALOR_CTP: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VALOR_CTP'
      Origin = '"CONTAS_A_PAGAR"."VALOR_CTP"'
      currency = True
    end
    object cdsContaAPagarVALOR_PAGO: TFloatField
      DisplayLabel = 'Valor Pago'
      FieldName = 'VALOR_PAGO'
      Origin = '"CONTAS_A_PAGAR"."VALOR_PAGO"'
      currency = True
    end
    object cdsContaAPagarCOD_CONTRP: TIntegerField
      DisplayLabel = 'Cod Seq Pagar'
      FieldName = 'COD_CONTRP'
      Origin = '"CONTAS_A_PAGAR"."COD_CONTRP"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsContaAPagarN_CONTA_PLC: TFloatField
      DisplayLabel = 'Num Conta Plano'
      FieldName = 'N_CONTA_PLC'
      Origin = '"CONTAS_A_PAGAR"."N_CONTA_PLC"'
    end
    object cdsContaAPagarDATA_ENT_CTP: TDateTimeField
      DisplayLabel = 'Data Entrada'
      FieldName = 'DATA_ENT_CTP'
      Origin = '"CONTAS_A_PAGAR"."DATA_ENT_CTP"'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsContaAPagarCODIGO_CTRL: TIntegerField
      DisplayLabel = 'Cod Controle'
      FieldName = 'CODIGO_CTRL'
      Origin = '"CONTAS_A_PAGAR"."CODIGO_CTRL"'
      Required = True
    end
    object cdsContaAPagarDTREFERENCIA: TDateTimeField
      DisplayLabel = 'Data de Refer'#234'ncia'
      FieldName = 'DTREFERENCIA'
      Origin = '"CONTAS_A_PAGAR"."DTREFERENCIA"'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsContaAPagarNUM_NOTA_NFE: TIntegerField
      DisplayLabel = 'Num Nota Compra'
      FieldName = 'NUM_NOTA_NFE'
      Origin = '"CONTAS_A_PAGAR"."NUM_NOTA_NFE"'
    end
    object cdsContaAPagarCOD_FORN_NFE: TIntegerField
      DisplayLabel = 'Cod Fornecedor'
      FieldName = 'COD_FORN_NFE'
      Origin = '"CONTAS_A_PAGAR"."COD_FORN_NFE"'
    end
    object cdsContaAPagarSTATUS_CTP: TStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS_CTP'
      Origin = '"CONTAS_A_PAGAR"."STATUS_CTP"'
      FixedChar = True
      Size = 10
    end
    object cdsContaAPagarDATQ_CTP: TDateTimeField
      DisplayLabel = 'Data Quita'#231#227'o'
      FieldName = 'DATQ_CTP'
      Origin = '"CONTAS_A_PAGAR"."DATQ_CTP"'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsContaAPagarNATL_CTP: TStringField
      DisplayLabel = 'Natureza Lan'#231'amento(C/N)'
      FieldName = 'NATL_CTP'
      Origin = '"CONTAS_A_PAGAR"."NATL_CTP"'
      FixedChar = True
      Size = 1
    end
    object cdsContaAPagarTIPO_CTP: TStringField
      DisplayLabel = 'Tipo de Conta(D/F)'
      FieldName = 'TIPO_CTP'
      Origin = '"CONTAS_A_PAGAR"."TIPO_CTP"'
      FixedChar = True
      Size = 1
    end
    object cdsContaAPagarNPARCELA: TIntegerField
      DisplayLabel = 'Num Parcela'
      FieldName = 'NPARCELA'
    end
    object cdsContaAPagarQTDE_PARC: TIntegerField
      DisplayLabel = 'Qtde Parcelas'
      FieldName = 'QTDE_PARC'
    end
    object cdsContaAPagarLOTE: TIntegerField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
      Origin = '"CONTAS_A_PAGAR"."LOTE"'
    end
    object cdsContaAPagarTIPO_FOR_DUP: TStringField
      DisplayLabel = 'Tipo For. Dupl'
      FieldName = 'TIPO_FOR_DUP'
      Origin = '"CONTAS_A_PAGAR"."TIPO_FOR_DUP"'
      FixedChar = True
      Size = 2
    end
    object cdsContaAPagarSUBT_FOR_DUP: TStringField
      DisplayLabel = 'Subtipo For. Dupl'
      FieldName = 'SUBT_FOR_DUP'
      Origin = '"CONTAS_A_PAGAR"."SUBT_FOR_DUP"'
      FixedChar = True
      Size = 2
    end
    object cdsContaAPagarDATA_CXL: TDateTimeField
      DisplayLabel = 'Data Caixa Auxiliar'
      FieldName = 'DATA_CXL'
      Origin = '"CONTAS_A_PAGAR"."DATA_CXL"'
    end
    object cdsContaAPagarTIP_CNT: TStringField
      DisplayLabel = 'Tipo Lanc Cont(C/N)'
      FieldName = 'TIP_CNT'
      Origin = '"CONTAS_A_PAGAR"."TIP_CNT"'
      FixedChar = True
      Size = 1
    end
    object cdsContaAPagarN_CHEQ_CTP: TStringField
      DisplayLabel = 'Num Cheque Ctp'
      FieldName = 'N_CHEQ_CTP'
      Origin = '"CONTAS_A_PAGAR"."N_CHEQ_CTP"'
      FixedChar = True
      Size = 10
    end
    object cdsContaAPagarNOMINAL_CTP: TStringField
      DisplayLabel = 'Nominal a'
      FieldName = 'NOMINAL_CTP'
      Origin = '"CONTAS_A_PAGAR"."NOMINAL_CTP"'
      Size = 35
    end
    object cdsContaAPagarDT_COMPENS: TDateTimeField
      DisplayLabel = 'Data da Compensa'#231#227'o'
      FieldName = 'DT_COMPENS'
      Origin = '"CONTAS_A_PAGAR"."DT_COMPENS"'
    end
    object cdsContaAPagarCHASSI_CONC: TStringField
      DisplayLabel = 'Chassi Concession'#225'ria'
      FieldName = 'CHASSI_CONC'
      Origin = '"CONTAS_A_PAGAR"."CHASSI_CONC"'
      FixedChar = True
      Size = 17
    end
    object cdsContaAPagarDATA_BAIXA: TDateTimeField
      DisplayLabel = 'Data Real da Baixa'
      FieldName = 'DATA_BAIXA'
      Origin = '"CONTAS_A_PAGAR"."DATA_BAIXA"'
    end
    object cdsContaAPagarACEITE_CTP: TStringField
      DisplayLabel = 'Aceite CTP'
      FieldName = 'ACEITE_CTP'
      Origin = '"CONTAS_A_PAGAR"."ACEITE_CTP"'
      FixedChar = True
      Size = 1
    end
    object cdsContaAPagarVL_CONTABIL: TFloatField
      DisplayLabel = 'Valor Cont'#225'bil'
      FieldName = 'VL_CONTABIL'
      Origin = '"CONTAS_A_PAGAR"."VL_CONTABIL"'
      currency = True
    end
    object cdsContaAPagarCODIGO_EMP: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'CODIGO_EMP'
      Origin = '"CONTAS_A_PAGAR"."CODIGO_EMP"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsContaAPagarCPF_CGC_F: TStringField
      DisplayLabel = 'CPF/CNPJ'
      FieldName = 'CPF_CGC_F'
      Origin = '"CONTAS_A_PAGAR"."CPF_CGC_F"'
      FixedChar = True
      Size = 18
    end
    object cdsContaAPagarNOME_BANCO_DUPL: TStringField
      DisplayLabel = 'Nome Banco'
      FieldName = 'NOME_BANCO_DUPL'
      Origin = '"CONTAS_A_PAGAR"."NOME_BANCO_DUPL"'
      Size = 10
    end
    object cdsContaAPagarSTATUS_HONDA: TStringField
      DisplayLabel = 'Status Montadora'
      FieldName = 'STATUS_HONDA'
      Origin = '"CONTAS_A_PAGAR"."STATUS_HONDA"'
      FixedChar = True
      Size = 10
    end
    object cdsContaAPagarDATA_PREV_PG: TDateTimeField
      DisplayLabel = 'Data Prev PG'
      FieldName = 'DATA_PREV_PG'
      Origin = '"CONTAS_A_PAGAR"."DATA_PREV_PG"'
    end
    object cdsContaAPagarCOD_EQUIP: TIntegerField
      DisplayLabel = 'Cod Equip'
      FieldName = 'COD_EQUIP'
      Origin = '"CONTAS_A_PAGAR"."COD_EQUIP"'
    end
    object cdsContaAPagarHISTRAT: TStringField
      FieldName = 'HISTRAT'
      Origin = '"CONTAS_A_PAGAR"."HISTRAT"'
      Size = 50
    end
    object cdsContaAPagarN_CONTA_PLC_OR: TFloatField
      DisplayLabel = 'Num Conta Plano Origem'
      FieldName = 'N_CONTA_PLC_OR'
      Origin = '"CONTAS_A_PAGAR"."N_CONTA_PLC_OR"'
    end
    object cdsContaAPagarTPRAT: TStringField
      FieldName = 'TPRAT'
      Origin = '"CONTAS_A_PAGAR"."TPRAT"'
      FixedChar = True
      Size = 1
    end
    object cdsContaAPagarENTRA_PREVISAO: TStringField
      DisplayLabel = 'Previs'#227'o Compet'#234'ncia'
      FieldName = 'ENTRA_PREVISAO'
      Origin = '"CONTAS_A_PAGAR"."ENTRA_PREVISAO"'
      FixedChar = True
      Size = 1
    end
    object cdsContaAPagarSERIE: TStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Origin = '"CONTAS_A_PAGAR"."SERIE"'
      Size = 5
    end
    object cdsContaAPagarN_DOC_CTP_ORIG: TStringField
      DisplayLabel = 'Num Documento Original'
      FieldName = 'N_DOC_CTP_ORIG'
      Origin = '"CONTAS_A_PAGAR"."N_DOC_CTP_ORIG"'
    end
    object cdsContaAPagarVALOR_CTP_ORIG: TFloatField
      DisplayLabel = 'Valor Documento Original'
      FieldName = 'VALOR_CTP_ORIG'
      Origin = '"CONTAS_A_PAGAR"."VALOR_CTP_ORIG"'
      currency = True
    end
    object cdsContaAPagarREF_FRETE: TStringField
      DisplayLabel = 'Referente a frete'
      FieldName = 'REF_FRETE'
      Origin = '"CONTAS_A_PAGAR"."REF_FRETE"'
      FixedChar = True
      Size = 1
    end
    object cdsContaAPagarSELEC: TStringField
      DisplayLabel = 'Sele'#231#227'o'
      FieldName = 'SELEC'
      Origin = '"CONTAS_A_PAGAR"."SELEC"'
      FixedChar = True
      Size = 1
    end
    object cdsContaAPagarOP_CX: TIntegerField
      DisplayLabel = 'Operador Pagando'
      FieldName = 'OP_CX'
      Origin = '"CONTAS_A_PAGAR"."OP_CX"'
    end
    object cdsContaAPagarCOD_OBS: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Obs'
      FieldName = 'COD_OBS'
      Origin = '"CONTAS_A_PAGAR"."COD_OBS"'
    end
    object cdsContaAPagarNSU_RO_ADM: TStringField
      DisplayLabel = 'NSU RO ADM'
      FieldName = 'NSU_RO_ADM'
      Origin = '"CONTAS_A_PAGAR"."NSU_RO_ADM"'
      Size = 15
    end
    object cdsContaAPagarRO_ADM: TIntegerField
      DisplayLabel = 'Num RO ADM'
      FieldName = 'RO_ADM'
      Origin = '"CONTAS_A_PAGAR"."RO_ADM"'
    end
    object cdsContaAPagarCOD_ADM: TIntegerField
      DisplayLabel = 'Cod Administradora'
      FieldName = 'COD_ADM'
    end
    object cdsContaAPagarCOD_DESPESA: TIntegerField
      DisplayLabel = 'Cod Despesa'
      FieldName = 'COD_DESPESA'
    end
    object cdsContaAPagarCOD_EMP_MULT: TIntegerField
      DisplayLabel = 'Cod Unificada'
      FieldName = 'COD_EMP_MULT'
      Origin = '"CONTAS_A_PAGAR"."COD_EMP_MULT"'
    end
    object cdsContaAPagarNOME_CTRL: TStringField
      DisplayLabel = 'Controle'
      FieldName = 'NOME_CTRL'
      ProviderFlags = []
      Size = 35
    end
    object cdsContaAPagarIDENTIFICACAO_EMP: TStringField
      DisplayLabel = 'Unificada'
      FieldName = 'IDENTIFICACAO_EMP'
      ProviderFlags = []
      Size = 64
    end
    object cdsContaAPagarCOD_USUARIO_PROCESS: TIntegerField
      DisplayLabel = 'Cod Usuario Process'
      FieldName = 'COD_USUARIO_PROCESS'
    end
    object cdsContaAPagarDATA_PROCESS: TDateTimeField
      DisplayLabel = 'Data Process'
      FieldName = 'DATA_PROCESS'
    end
    object cdsContaAPagarHORA_PROCESS: TStringField
      DisplayLabel = 'Hora Process'
      FieldName = 'HORA_PROCESS'
      FixedChar = True
      Size = 8
    end
    object cdsContaAPagarNOMEARQ_PROCESS: TStringField
      DisplayLabel = 'Arquivo Process'
      FieldName = 'NOMEARQ_PROCESS'
      Size = 50
    end
    object cdsContaAPagarUS_CAD: TIntegerField
      DisplayLabel = 'Usuario que Cadastrou'
      FieldName = 'US_CAD'
    end
    object cdsContaAPagarUS_BX: TIntegerField
      DisplayLabel = 'Usuario que Quitou'
      FieldName = 'US_BX'
    end
    object cdsContaAPagarNOME_CTA: TStringField
      DisplayLabel = 'Descricao Conta Contabil'
      FieldName = 'NOME_CTA'
      Origin = '"P_CONTAS_CONTABIL"."NOME_CTA"'
      ProviderFlags = []
      Size = 60
    end
    object cdsContaAPagarDESC_PLC: TStringField
      DisplayLabel = 'Descricao Conta'
      FieldName = 'DESC_PLC'
      Origin = '"P_CONTAS"."DESC_PLC"'
      ProviderFlags = []
      FixedChar = True
      Size = 30
    end
    object cdsContaAPagarDESC_GR: TStringField
      DisplayLabel = 'Descricao Grupo Conta'
      FieldName = 'DESC_GR'
      Origin = '"GRUPOS_CT"."DESC_GR"'
      ProviderFlags = []
      FixedChar = True
      Size = 35
    end
    object cdsContaAPagarDESC_DEP: TStringField
      DisplayLabel = 'Descricao Departamento Conta'
      FieldName = 'DESC_DEP'
      Origin = '"DEPART_CT"."DESC_DEP"'
      ProviderFlags = []
      Size = 35
    end
    object cdsContaAPagarCOD_CTA: TStringField
      DisplayLabel = 'Cod Conta Contabil'
      FieldName = 'COD_CTA'
      Origin = '"P_CONTAS_CONTABIL"."COD_CTA"'
      ProviderFlags = []
      Size = 60
    end
    object cdsContaAPagarCOD_CONTRAPARTIDA: TIntegerField
      DisplayLabel = 'Lote Contrapartida Lanc'
      FieldName = 'COD_CONTRAPARTIDA'
    end
    object cdsContaAPagarCOD_CONTRAPARTIDA_CTP: TIntegerField
      DisplayLabel = 'Lote Contrapartida Ctp'
      FieldName = 'COD_CONTRAPARTIDA_CTP'
    end
    object cdsContaAPagarID_FINANC_CONFERE: TIntegerField
      Tag = 1
      DisplayLabel = 'Id Financ Confere'
      FieldName = 'ID_FINANC_CONFERE'
    end
    object cdsContaAPagarLOTE_QUIT_PARC: TIntegerField
      Tag = 1
      DisplayLabel = 'Lote Baixar Parc'
      FieldName = 'LOTE_QUIT_PARC'
    end
    object cdsContaAPagarCOD_CONTRP_ORIG: TIntegerField
      DisplayLabel = 'Cod Seq Pagar Orig'
      FieldName = 'COD_CONTRP_ORIG'
    end
    object cdsContaAPagarLOTE_ENT: TIntegerField
      Tag = 1
      DisplayLabel = 'Lote Ent'
      FieldName = 'LOTE_ENT'
    end
    object cdsContaAPagarFORM_PAG: TStringField
      DisplayLabel = 'Form Pag'
      FieldName = 'FORM_PAG'
      ProviderFlags = []
      Size = 200
    end
    object cdsContaAPagarARQ_EXTRATO_ADM: TStringField
      DisplayLabel = 'Arq Extrado Adm'
      FieldName = 'ARQ_EXTRATO_ADM'
      Origin = '"CONTAS_A_PAGAR"."ARQ_EXTRATO_ADM"'
      Size = 255
    end
    object cdsContaAPagarDATA_ARQUIVO: TDateTimeField
      DisplayLabel = 'Data Extrado Adm'
      FieldName = 'DATA_ARQUIVO'
    end
    object cdsContaAPagarNPED: TIntegerField
      DisplayLabel = 'Num Doc'
      FieldName = 'NPED'
    end
    object cdsContaAPagarTIPO_NPED: TStringField
      DisplayLabel = 'Tipo Doc'
      FieldName = 'TIPO_NPED'
      FixedChar = True
      Size = 3
    end
    object cdsContaAPagarDATA_DESM: TDateTimeField
      DisplayLabel = 'Data Desmarcado'
      FieldName = 'DATA_DESM'
    end
    object cdsContaAPagarOP_DESM: TIntegerField
      DisplayLabel = 'Operador Desmarcou'
      FieldName = 'OP_DESM'
    end
  end
  object dspContaAPagar: TDataSetProvider
    DataSet = qrContaAPagar
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    OnGetTableName = dspContaAPagarGetTableName
    Left = 30
    Top = 112
  end
  object SpIncCodigo: TIBStoredProc
    Database = dtmAtivo.bancoHw
    Transaction = transContaAPagar
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
  object transContaAPagar: TIBTransaction
    DefaultDatabase = dtmAtivo.bancoHw
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 120
    Top = 8
  end
  object qrBuscasCntAPagar: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transContaAPagar
    Left = 232
    Top = 8
  end
  object dsLocFornec: TDataSource
    DataSet = cdsLocFornec
    Left = 114
    Top = 216
  end
  object cdsLocFornec: TClientDataSet
    Tag = 1
    Aggregates = <>
    Params = <>
    ProviderName = 'dspLocFornec'
    BeforeOpen = cdsContaAPagarBeforeOpen
    Left = 114
    Top = 160
    object cdsLocFornecCOD_CLIENTE: TIntegerField
      FieldName = 'COD_CLIENTE'
      Required = True
    end
    object cdsLocFornecCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsLocFornecNOME_CLIENTE: TStringField
      FieldName = 'NOME_CLIENTE'
      Required = True
      Size = 35
    end
    object cdsLocFornecRAZAO: TStringField
      FieldName = 'RAZAO'
      Required = True
      Size = 60
    end
  end
  object dspLocFornec: TDataSetProvider
    DataSet = qrLocFornec
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 113
    Top = 112
  end
  object qrLocFornec: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transContaAPagar
    SQL.Strings = (
      'select *  from clientes where cod_cliente=0 and cod_empresa = 0')
    Left = 112
    Top = 64
  end
  object dsPContas: TDataSource
    DataSet = cdsPContas
    Left = 187
    Top = 215
  end
  object cdsPContas: TClientDataSet
    Tag = 1
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPContas'
    BeforeOpen = cdsContaAPagarBeforeOpen
    Left = 187
    Top = 159
    object cdsPContasN_CONTA_PLC: TFloatField
      FieldName = 'N_CONTA_PLC'
    end
    object cdsPContasGRUP_CT: TIntegerField
      FieldName = 'GRUP_CT'
      Required = True
    end
    object cdsPContasDESC_PLC: TStringField
      FieldName = 'DESC_PLC'
      Required = True
      FixedChar = True
      Size = 30
    end
    object cdsPContasTIPO_PLC: TStringField
      FieldName = 'TIPO_PLC'
      FixedChar = True
      Size = 1
    end
    object cdsPContasSIGLA_PLC: TStringField
      FieldName = 'SIGLA_PLC'
      FixedChar = True
      Size = 6
    end
    object cdsPContasDATA_CAD_PC: TDateTimeField
      FieldName = 'DATA_CAD_PC'
    end
    object cdsPContasDATA_MOD_PC: TDateTimeField
      FieldName = 'DATA_MOD_PC'
    end
    object cdsPContasTIPO_CTP: TStringField
      FieldName = 'TIPO_CTP'
      FixedChar = True
      Size = 1
    end
    object cdsPContasDESC_PADR: TStringField
      FieldName = 'DESC_PADR'
      FixedChar = True
      Size = 30
    end
    object cdsPContasCOD_SUB_CT: TIntegerField
      FieldName = 'COD_SUB_CT'
      Required = True
    end
    object cdsPContasATIVO: TIntegerField
      FieldName = 'ATIVO'
    end
    object cdsPContasSTHAB: TStringField
      FieldName = 'STHAB'
      FixedChar = True
      Size = 1
    end
    object cdsPContasCODSEQ_BALANCO: TIntegerField
      FieldName = 'CODSEQ_BALANCO'
    end
    object cdsPContasTP_VEICULOS: TStringField
      FieldName = 'TP_VEICULOS'
      Size = 1
    end
    object cdsPContasTPRAT: TStringField
      FieldName = 'TPRAT'
      FixedChar = True
      Size = 1
    end
    object cdsPContasCPFCGC_FORNECEDOR: TStringField
      FieldName = 'CPFCGC_FORNECEDOR'
      Size = 18
    end
  end
  object dspPContas: TDataSetProvider
    DataSet = qrPContas
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 187
    Top = 111
  end
  object qrPContas: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transContaAPagar
    SQL.Strings = (
      'select * from P_Contas where ativo = 1 order by desc_plc')
    Left = 187
    Top = 63
  end
  object dsControles: TDataSource
    DataSet = cdsControles
    Left = 258
    Top = 215
  end
  object cdsControles: TClientDataSet
    Tag = 1
    Aggregates = <>
    Params = <>
    ProviderName = 'dspControles'
    BeforeOpen = cdsContaAPagarBeforeOpen
    Left = 258
    Top = 159
    object cdsControlesCODIGO_CTRL: TIntegerField
      FieldName = 'CODIGO_CTRL'
      Required = True
    end
    object cdsControlesNOME_CTRL: TStringField
      FieldName = 'NOME_CTRL'
      Size = 35
    end
    object cdsControlesDOCS: TStringField
      FieldName = 'DOCS'
      FixedChar = True
      Size = 2
    end
    object cdsControlesCONTR_BANC: TStringField
      FieldName = 'CONTR_BANC'
      FixedChar = True
      Size = 1
    end
    object cdsControlesNAT_LANC: TStringField
      FieldName = 'NAT_LANC'
      Size = 1
    end
  end
  object dspControles: TDataSetProvider
    DataSet = qrControles
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 258
    Top = 111
  end
  object qrControles: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transContaAPagar
    SQL.Strings = (
      
        'select codigo_ctrl, nome_ctrl, docs, contr_banc, nat_lanc from c' +
        'ontroles where CODIGO_EMP = 0'
      'order by codigo_ctrl')
    Left = 258
    Top = 63
  end
  object dsLancamentos: TDataSource
    DataSet = cdsLancamentos
    Left = 341
    Top = 214
  end
  object cdsLancamentos: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspLancamentos'
    BeforeOpen = cdsContaAPagarBeforeOpen
    Left = 341
    Top = 158
    object cdsLancamentosCOD_LANC: TIntegerField
      FieldName = 'COD_LANC'
      Required = True
    end
    object cdsLancamentosN_CONTA_PLC: TFloatField
      FieldName = 'N_CONTA_PLC'
    end
    object cdsLancamentosCODIGO_CTRL: TIntegerField
      FieldName = 'CODIGO_CTRL'
      Required = True
    end
    object cdsLancamentosDIA_FCD: TDateTimeField
      FieldName = 'DIA_FCD'
    end
    object cdsLancamentosNMOV: TIntegerField
      FieldName = 'NMOV'
    end
    object cdsLancamentosTIPO_L: TStringField
      FieldName = 'TIPO_L'
      FixedChar = True
      Size = 1
    end
    object cdsLancamentosDATA: TDateTimeField
      FieldName = 'DATA'
    end
    object cdsLancamentosNDOC_L: TStringField
      FieldName = 'NDOC_L'
      FixedChar = True
      Size = 10
    end
    object cdsLancamentosHISTORICO_L: TStringField
      FieldName = 'HISTORICO_L'
      FixedChar = True
      Size = 100
    end
    object cdsLancamentosVALOR_L: TFloatField
      FieldName = 'VALOR_L'
    end
    object cdsLancamentosSTATUS_L: TStringField
      FieldName = 'STATUS_L'
      FixedChar = True
      Size = 10
    end
    object cdsLancamentosDATQ_L: TDateTimeField
      FieldName = 'DATQ_L'
    end
    object cdsLancamentosNATL: TStringField
      FieldName = 'NATL'
      FixedChar = True
      Size = 1
    end
    object cdsLancamentosLOTE: TIntegerField
      FieldName = 'LOTE'
    end
    object cdsLancamentosTIP_CNT: TStringField
      FieldName = 'TIP_CNT'
      FixedChar = True
      Size = 1
    end
    object cdsLancamentosDATA_CXL: TDateTimeField
      FieldName = 'DATA_CXL'
    end
    object cdsLancamentosLANC_VENDA: TStringField
      FieldName = 'LANC_VENDA'
      FixedChar = True
      Size = 1
    end
    object cdsLancamentosDATA_REM_REC: TDateTimeField
      FieldName = 'DATA_REM_REC'
    end
    object cdsLancamentosTP_MOD: TStringField
      FieldName = 'TP_MOD'
      FixedChar = True
      Size = 1
    end
    object cdsLancamentosCOD_TERM: TIntegerField
      FieldName = 'COD_TERM'
    end
    object cdsLancamentosDT_COMPENSADO: TDateTimeField
      FieldName = 'DT_COMPENSADO'
    end
    object cdsLancamentosNOMINAL_L: TStringField
      FieldName = 'NOMINAL_L'
      FixedChar = True
      Size = 35
    end
    object cdsLancamentosN_CHEQ_L: TStringField
      FieldName = 'N_CHEQ_L'
      FixedChar = True
      Size = 10
    end
    object cdsLancamentosVL_CONTABIL: TFloatField
      FieldName = 'VL_CONTABIL'
    end
    object cdsLancamentosLOTE_ENT: TIntegerField
      FieldName = 'LOTE_ENT'
    end
    object cdsLancamentosCODIGO_EMP: TIntegerField
      FieldName = 'CODIGO_EMP'
      Required = True
    end
    object cdsLancamentosCOD_EMP_MULT: TIntegerField
      FieldName = 'COD_EMP_MULT'
    end
    object cdsLancamentosOP_CXL: TIntegerField
      FieldName = 'OP_CXL'
    end
    object cdsLancamentosCOD_EQUIP: TIntegerField
      FieldName = 'COD_EQUIP'
    end
    object cdsLancamentosHISTRAT: TStringField
      FieldName = 'HISTRAT'
      Size = 50
    end
    object cdsLancamentosN_CONTA_PLC_OR: TFloatField
      FieldName = 'N_CONTA_PLC_OR'
    end
    object cdsLancamentosTIPRAT: TStringField
      FieldName = 'TIPRAT'
      FixedChar = True
      Size = 1
    end
    object cdsLancamentosDTREFERENCIA: TDateTimeField
      FieldName = 'DTREFERENCIA'
    end
    object cdsLancamentosCOD_CONTRAPARTIDA: TIntegerField
      DisplayLabel = 'Lote Contrapartida Lanc'
      FieldName = 'COD_CONTRAPARTIDA'
    end
    object cdsLancamentosCOD_CONTRAPARTIDA_CTP: TIntegerField
      DisplayLabel = 'Lote Contrapartida Ctp'
      FieldName = 'COD_CONTRAPARTIDA_CTP'
    end
    object cdsLancamentosDATA_VENC_CHEQ_L: TDateTimeField
      FieldName = 'DATA_VENC_CHEQ_L'
    end
  end
  object dspLancamentos: TDataSetProvider
    DataSet = qrLancamentos
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 341
    Top = 110
  end
  object qrLancamentos: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transContaAPagar
    SQL.Strings = (
      'select * from lancamentos l where l.codigo_emp=1')
    Left = 341
    Top = 62
  end
  object qrBuscasLanc: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transContaAPagar
    Left = 336
    Top = 8
  end
  object dsControleCH: TDataSource
    DataSet = cdsControleCH
    Left = 445
    Top = 214
  end
  object cdsControleCH: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspControleCH'
    BeforeOpen = cdsContaAPagarBeforeOpen
    Left = 445
    Top = 158
    object cdsControleCHSEL: TStringField
      Tag = 2
      DisplayLabel = 'Sel'
      FieldKind = fkInternalCalc
      FieldName = 'SEL'
      ProviderFlags = []
      Size = 1
    end
    object cdsControleCHNOME_CH: TStringField
      DisplayLabel = 'Nome Cliente'
      FieldName = 'NOME_CH'
      Size = 35
    end
    object cdsControleCHN_CH: TStringField
      DisplayLabel = 'Num Cheque'
      FieldName = 'N_CH'
      FixedChar = True
    end
    object cdsControleCHDATA_VENC: TDateTimeField
      Tag = 2
      DisplayLabel = 'Data Vencimento'
      FieldName = 'DATA_VENC'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsControleCHVALOR_CH: TFloatField
      Tag = 2
      DisplayLabel = 'Valor Cheque'
      FieldName = 'VALOR_CH'
      DisplayFormat = '##0.00'
    end
    object cdsControleCHVALOR_CORR: TFloatField
      DisplayLabel = 'Valor Corrigido'
      FieldName = 'VALOR_CORR'
      DisplayFormat = '##0.00'
    end
    object cdsControleCHVALOR_DESC: TFloatField
      DisplayLabel = 'Valor Desconto'
      FieldName = 'VALOR_DESC'
      DisplayFormat = '##0.00'
    end
    object cdsControleCHCODIGO_CH: TIntegerField
      Tag = 2
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO_CH'
      Required = True
    end
    object cdsControleCHSTATUS_CH: TStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS_CH'
      FixedChar = True
      Size = 10
    end
    object cdsControleCHN_CONTA_PLC: TFloatField
      DisplayLabel = 'Num da Conta'
      FieldName = 'N_CONTA_PLC'
    end
    object cdsControleCHCODIGO_CTRL: TIntegerField
      DisplayLabel = 'Codigo Controle'
      FieldName = 'CODIGO_CTRL'
      Required = True
    end
    object cdsControleCHRAZAO: TStringField
      DisplayLabel = 'Razao Social Cliente'
      FieldName = 'RAZAO'
      Size = 60
    end
    object cdsControleCHCOD_CLIENTE: TIntegerField
      DisplayLabel = 'Codigo Cliente'
      FieldName = 'COD_CLIENTE'
    end
    object cdsControleCHDATA_REC: TDateTimeField
      DisplayLabel = 'Data Cadastro'
      FieldName = 'DATA_REC'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsControleCHHISTORICO_CH: TStringField
      DisplayLabel = 'Historico'
      FieldName = 'HISTORICO_CH'
      Size = 100
    end
    object cdsControleCHDATQ_CH: TDateTimeField
      DisplayLabel = 'Data Quita'#231#227'o'
      FieldName = 'DATQ_CH'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsControleCHNATL_CH: TStringField
      DisplayLabel = 'Natureza(C/N)'
      FieldName = 'NATL_CH'
      FixedChar = True
      Size = 1
    end
    object cdsControleCHCOD_CLI: TStringField
      DisplayLabel = 'Codigo CI'
      FieldName = 'COD_CLI'
      Size = 60
    end
    object cdsControleCHOBS_CH: TStringField
      DisplayLabel = 'Observa'#231#227'o'
      FieldName = 'OBS_CH'
      Size = 60
    end
    object cdsControleCHLOTE: TIntegerField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
    end
    object cdsControleCHTP_DOC_V: TStringField
      DisplayLabel = 'Tipo Doc Venda'
      FieldName = 'TP_DOC_V'
      FixedChar = True
      Size = 6
    end
    object cdsControleCHN_DOC_V: TIntegerField
      DisplayLabel = 'Num Doc Venda'
      FieldName = 'N_DOC_V'
    end
    object cdsControleCHDATA_VENDA: TDateTimeField
      DisplayLabel = 'Data Venda'
      FieldName = 'DATA_VENDA'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsControleCHAGENCIA: TStringField
      DisplayLabel = 'Agencia'
      FieldName = 'AGENCIA'
      Size = 10
    end
    object cdsControleCHCONTA: TStringField
      DisplayLabel = 'Conta'
      FieldName = 'CONTA'
      Size = 15
    end
    object cdsControleCHBANCO: TStringField
      DisplayLabel = 'Banco'
      FieldName = 'BANCO'
      Size = 35
    end
    object cdsControleCHCOD_CLI_TERC: TIntegerField
      DisplayLabel = 'Codigo Cliente Terceiro'
      FieldName = 'COD_CLI_TERC'
    end
    object cdsControleCHNOME_TERC: TStringField
      DisplayLabel = 'Nome Terceiro'
      FieldName = 'NOME_TERC'
      Size = 35
    end
    object cdsControleCHTIP_CNT: TStringField
      DisplayLabel = 'Tipo Cadastro(C/N)'
      FieldName = 'TIP_CNT'
      FixedChar = True
      Size = 1
    end
    object cdsControleCHDATA_CXL: TDateTimeField
      DisplayLabel = 'Data Caixa Auxiliar'
      FieldName = 'DATA_CXL'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsControleCHCODIGO_VEND: TIntegerField
      DisplayLabel = 'Codigo Vendedor'
      FieldName = 'CODIGO_VEND'
    end
    object cdsControleCHTIP_BAIXA: TStringField
      DisplayLabel = 'Tipo Baixa'
      FieldName = 'TIP_BAIXA'
      FixedChar = True
      Size = 1
    end
    object cdsControleCHDATA_REM_REC: TDateTimeField
      DisplayLabel = 'Data Remessa'
      FieldName = 'DATA_REM_REC'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsControleCHCOD_TERM: TIntegerField
      DisplayLabel = 'Codigo Terminal'
      FieldName = 'COD_TERM'
    end
    object cdsControleCHLOTE_QUIT: TIntegerField
      DisplayLabel = 'Lote Baixa'
      FieldName = 'LOTE_QUIT'
    end
    object cdsControleCHLOTE_ENT: TIntegerField
      DisplayLabel = 'Lote Cadastro'
      FieldName = 'LOTE_ENT'
    end
    object cdsControleCHCPFCGC: TStringField
      DisplayLabel = 'CPF/CNPJ'
      FieldName = 'CPFCGC'
      FixedChar = True
      Size = 18
    end
    object cdsControleCHDT_BAIXA_COMISSAO: TDateTimeField
      DisplayLabel = 'Data Baixa Comiss'#227'o'
      FieldName = 'DT_BAIXA_COMISSAO'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsControleCHVL_BAIXA_COMISSAO: TFloatField
      DisplayLabel = 'Valor Baixa Comiss'#227'o'
      FieldName = 'VL_BAIXA_COMISSAO'
      DisplayFormat = '##0.00'
    end
    object cdsControleCHDTORIGINAL_CH: TDateTimeField
      DisplayLabel = 'Data Original Cheque'
      FieldName = 'DTORIGINAL_CH'
    end
    object cdsControleCHID_BANCO: TStringField
      DisplayLabel = 'Num Banco'
      FieldName = 'ID_BANCO'
      Size = 11
    end
    object cdsControleCHCODIGO_EMP: TIntegerField
      Tag = 1
      DisplayLabel = 'Codigo Empresa'
      FieldName = 'CODIGO_EMP'
      Required = True
    end
    object cdsControleCHCOD_EMP_MULT: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Emp Multi'
      FieldName = 'COD_EMP_MULT'
    end
    object cdsControleCHSELEC: TStringField
      Tag = 1
      DisplayLabel = 'S'
      FieldName = 'SELEC'
      FixedChar = True
      Size = 1
    end
    object cdsControleCHOP_CXL: TIntegerField
      DisplayLabel = 'Op Fin'
      FieldName = 'OP_CXL'
    end
    object cdsControleCHSTATUS_CXL_RQ: TStringField
      DisplayLabel = 'Status Rec'
      FieldName = 'STATUS_CXL_RQ'
      FixedChar = True
      Size = 1
    end
    object cdsControleCHSTATUS_CX: TStringField
      DisplayLabel = 'Status CX'
      FieldName = 'STATUS_CX'
      FixedChar = True
      Size = 1
    end
    object cdsControleCHOP_CX: TIntegerField
      DisplayLabel = 'Operador Caixa'
      FieldName = 'OP_CX'
    end
    object cdsControleCHUS_BX: TIntegerField
      DisplayLabel = 'Usuario que Baixou'
      FieldName = 'US_BX'
    end
    object cdsControleCHCOD_EMP_LOTE: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Emp Lote'
      FieldName = 'COD_EMP_LOTE'
    end
    object cdsControleCHCOD_CONTRAPARTIDA: TIntegerField
      DisplayLabel = 'Lote Contrapartida Lanc'
      FieldName = 'COD_CONTRAPARTIDA'
    end
    object cdsControleCHCOD_CONTRAPARTIDA_CTP: TIntegerField
      DisplayLabel = 'Lote Contrapartida Ctp'
      FieldName = 'COD_CONTRAPARTIDA_CTP'
    end
  end
  object dspControleCH: TDataSetProvider
    DataSet = qrControleCH
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 445
    Top = 110
  end
  object qrControleCH: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transContaAPagar
    SQL.Strings = (
      'select * from controle_cheque where codigo_emp=1')
    Left = 445
    Top = 62
  end
  object qrBuscasControleCH: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transContaAPagar
    Left = 440
    Top = 8
  end
  object cdsLoteLanc: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspLoteLanc'
    BeforeOpen = cdsContaAPagarBeforeOpen
    Left = 857
    Top = 148
    object cdsLoteLancN_LOTE: TIntegerField
      DisplayLabel = 'Num. Lote'
      FieldName = 'N_LOTE'
      Required = True
    end
    object cdsLoteLancDATA_LOTE: TDateTimeField
      DisplayLabel = 'Data do Lote'
      FieldName = 'DATA_LOTE'
    end
    object cdsLoteLancCOD_EMP_MULT: TIntegerField
      DisplayLabel = 'Cod. Emp. Mult.'
      FieldName = 'COD_EMP_MULT'
    end
    object cdsLoteLancCODIGO_EMP: TIntegerField
      DisplayLabel = 'Cod. Empresa'
      FieldName = 'CODIGO_EMP'
      Required = True
    end
    object cdsLoteLancSELEC: TStringField
      DisplayLabel = 'Sele'#231#227'o'
      FieldName = 'SELEC'
      FixedChar = True
      Size = 1
    end
    object cdsLoteLancDATA_CXL: TDateTimeField
      DisplayLabel = 'Dia do Cxl'
      FieldName = 'DATA_CXL'
    end
    object cdsLoteLancSTATUS: TStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      Size = 10
    end
  end
  object dspLoteLanc: TDataSetProvider
    DataSet = qrLoteLanc
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 857
    Top = 100
  end
  object qrLoteLanc: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transContaAPagar
    SQL.Strings = (
      'select * from lote_lanc WHERE CODIGO_EMP = -1 order by n_lote')
    Left = 857
    Top = 52
  end
  object dsLoteLanc: TDataSource
    DataSet = cdsLoteLanc
    Left = 853
    Top = 206
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
    Left = 376
    Top = 320
  end
  object qrBuscas2: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transContaAPagar
    Left = 24
    Top = 280
  end
  object CdsRateioContaConta: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 120
    Top = 280
    object CdsRateioContaContaCONTAOR: TFloatField
      DisplayLabel = 'Conta Origem'
      FieldName = 'CONTAOR'
    end
    object CdsRateioContaContaCONTAVALOR: TFloatField
      DisplayLabel = 'Conta An'#225'lise'
      FieldName = 'CONTAVALOR'
    end
    object CdsRateioContaContaDESCRICAOCONTAVALOR: TStringField
      DisplayLabel = 'Descri'#231#227'o Conta An'#225'lise'
      FieldName = 'DESCRICAOCONTAVALOR'
    end
    object CdsRateioContaContaCONTADEST: TFloatField
      DisplayLabel = 'Conta de Destino'
      FieldName = 'CONTADEST'
    end
    object CdsRateioContaContaDESCRICAO_CONTA: TStringField
      DisplayLabel = 'Descr. Conta Destino'
      FieldName = 'DESCRICAO_CONTA'
    end
    object CdsRateioContaContaMES_ANO: TStringField
      DisplayLabel = 'M'#234's/Ano Refer'#234'ncia'
      FieldName = 'MES_ANO'
    end
    object CdsRateioContaContaVALORORIGEM: TFloatField
      DisplayLabel = 'Valor An'#225'lise'
      FieldName = 'VALORORIGEM'
      currency = True
    end
    object CdsRateioContaContaPERCORIGEM: TFloatField
      DisplayLabel = 'Percentual Proporcional'
      FieldName = 'PERCORIGEM'
      DisplayFormat = '##0.00'
    end
    object CdsRateioContaContaVALORDESTINO: TFloatField
      DisplayLabel = 'Valor Destino'
      FieldName = 'VALORDESTINO'
      currency = True
    end
    object CdsRateioContaContaDEPTO: TStringField
      DisplayLabel = 'Depto'
      FieldName = 'DEPTO'
    end
    object CdsRateioContaContaVALORDESTINOCNT: TFloatField
      DisplayLabel = 'Valor Destino CNT'
      FieldName = 'VALORDESTINOCNT'
      currency = True
    end
  end
  object DtDefRateios: TDataSource
    DataSet = CdsRateioContaConta
    Left = 216
    Top = 280
  end
  object qrObsCred: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transContaAPagar
    SQL.Strings = (
      'select o.*, c.nome_vendedor from observacao o'
      
        'left join colaborador c on c.cod_vendedor = o.cod_usuario and c.' +
        'cod_empresa = o.cod_empresa'
      'where o.cod_obs = 0 and o.cod_empresa=0')
    Left = 925
    Top = 56
  end
  object dspObsCred: TDataSetProvider
    DataSet = qrObsCred
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 925
    Top = 103
  end
  object cdsObsCred: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspObsCred'
    BeforeOpen = cdsContaAPagarBeforeOpen
    Left = 926
    Top = 152
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
      FieldName = 'NITEM'
      Required = True
    end
  end
  object dsObsCred: TDataSource
    AutoEdit = False
    DataSet = cdsObsCred
    Left = 927
    Top = 198
  end
  object qrEmpresasUnificadas: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = dtmAtivo.IbTransCol
    SQL.Strings = (
      
        'select emp.cod_empresa, (emp.identificacao_emp ||'#39' - '#39'|| emp.cnp' +
        'j_emp) identificacao_emp, cgc_emp from empresa emp'
      'where emp.cod_empresa in (1)')
    Left = 1013
    Top = 56
  end
  object dspEmpresasUnificadas: TDataSetProvider
    DataSet = qrEmpresasUnificadas
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1013
    Top = 112
  end
  object cdsEmpresasUnificadas: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspEmpresasUnificadas'
    BeforeOpen = cdsContaAPagarBeforeOpen
    Left = 1013
    Top = 160
    object cdsEmpresasUnificadasSEL: TStringField
      DisplayLabel = 'Sel'
      FieldKind = fkInternalCalc
      FieldName = 'SEL'
      Size = 1
    end
    object cdsEmpresasUnificadasCOD_EMPRESA: TIntegerField
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsEmpresasUnificadasIDENTIFICACAO_EMP: TStringField
      DisplayLabel = 'Empresa'
      FieldName = 'IDENTIFICACAO_EMP'
      Size = 85
    end
    object cdsEmpresasUnificadasCGC_EMP: TStringField
      FieldName = 'CGC_EMP'
      Visible = False
      Size = 18
    end
    object cdsEmpresasUnificadasVALORDESTINO: TFloatField
      Tag = 1
      FieldKind = fkInternalCalc
      FieldName = 'VALORDESTINO'
      Visible = False
    end
    object cdsEmpresasUnificadasVALORDESTINOCNT: TFloatField
      Tag = 1
      FieldKind = fkInternalCalc
      FieldName = 'VALORDESTINOCNT'
      Visible = False
    end
  end
  object dsEmpresasUnificadas: TDataSource
    DataSet = cdsEmpresasUnificadas
    Left = 1013
    Top = 216
  end
  object dsControleCR: TDataSource
    DataSet = cdsControleCR
    Left = 557
    Top = 214
  end
  object cdsControleCR: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspControleCR'
    BeforeOpen = cdsContaAPagarBeforeOpen
    Left = 557
    Top = 158
    object cdsControleCRSEL: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'SEL'
      Size = 1
    end
    object cdsControleCRNOME_C: TStringField
      DisplayLabel = 'Nome Cliente'
      FieldName = 'NOME_C'
      Size = 35
    end
    object cdsControleCRDATA_VENC_C: TDateTimeField
      DisplayLabel = 'Data Vencimento'
      FieldName = 'DATA_VENC_C'
    end
    object cdsControleCRVALOR_C: TFloatField
      DisplayLabel = 'Valor Cr'#233'dito'
      FieldName = 'VALOR_C'
      DisplayFormat = '##0.00'
    end
    object cdsControleCRCOD_CRED: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'COD_CRED'
      Required = True
    end
    object cdsControleCRSTATUS_C: TStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS_C'
      FixedChar = True
      Size = 10
    end
    object cdsControleCRN_CONTA_PLC: TFloatField
      DisplayLabel = 'Num da Conta'
      FieldName = 'N_CONTA_PLC'
    end
    object cdsControleCRCODIGO_CTRL: TIntegerField
      DisplayLabel = 'Codigo Controle'
      FieldName = 'CODIGO_CTRL'
      Required = True
    end
    object cdsControleCRRAZAO: TStringField
      DisplayLabel = 'Razao Social Cliente'
      FieldName = 'RAZAO'
      Size = 60
    end
    object cdsControleCRCOD_CLIENTE: TIntegerField
      DisplayLabel = 'Cod Cliente'
      FieldName = 'COD_CLIENTE'
    end
    object cdsControleCRDATA_REC_C: TDateTimeField
      DisplayLabel = 'Data Cadastro'
      FieldName = 'DATA_REC_C'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsControleCRHISTORICO_C: TStringField
      DisplayLabel = 'Historico'
      FieldName = 'HISTORICO_C'
      Size = 100
    end
    object cdsControleCRTIPO_DOC_C: TStringField
      FieldName = 'TIPO_DOC_C'
      FixedChar = True
      Size = 15
    end
    object cdsControleCRDATQ_C: TDateTimeField
      DisplayLabel = 'Data Quita'#231#227'o'
      FieldName = 'DATQ_C'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsControleCRNATL_C: TStringField
      DisplayLabel = 'Natureza(C/N)'
      FieldName = 'NATL_C'
      FixedChar = True
      Size = 1
    end
    object cdsControleCROBS_C: TStringField
      DisplayLabel = 'Observa'#231#227'o'
      FieldName = 'OBS_C'
      Size = 60
    end
    object cdsControleCRLOTE: TIntegerField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
    end
    object cdsControleCRTP_DOC_V: TStringField
      DisplayLabel = 'Tipo Doc Venda'
      FieldName = 'TP_DOC_V'
      FixedChar = True
      Size = 6
    end
    object cdsControleCRN_DOC_V: TIntegerField
      DisplayLabel = 'Num Doc Venda'
      FieldName = 'N_DOC_V'
    end
    object cdsControleCRN_DOC_C: TStringField
      DisplayLabel = 'Num Doc Venda 2'
      FieldName = 'N_DOC_C'
      FixedChar = True
    end
    object cdsControleCRDATA_VENDA: TDateTimeField
      DisplayLabel = 'Data Venda'
      FieldName = 'DATA_VENDA'
    end
    object cdsControleCRCOD_CLI_TERC: TIntegerField
      DisplayLabel = 'Codigo Cliente Terceiro'
      FieldName = 'COD_CLI_TERC'
    end
    object cdsControleCRNOME_TERC: TStringField
      DisplayLabel = 'Nome Terceiro'
      FieldName = 'NOME_TERC'
      Size = 35
    end
    object cdsControleCRTIP_CNT: TStringField
      DisplayLabel = 'Tipo Cadastro(C/N)'
      FieldName = 'TIP_CNT'
      FixedChar = True
      Size = 1
    end
    object cdsControleCRDATA_CXL: TDateTimeField
      DisplayLabel = 'Data Caixa Auxiliar'
      FieldName = 'DATA_CXL'
    end
    object cdsControleCRCODIGO_VEND: TIntegerField
      DisplayLabel = 'Codigo Vendedor'
      FieldName = 'CODIGO_VEND'
    end
    object cdsControleCRTIP_BAIXA: TStringField
      DisplayLabel = 'Tipo Baixa'
      FieldName = 'TIP_BAIXA'
      FixedChar = True
      Size = 1
    end
    object cdsControleCRDATA_REM_REC: TDateTimeField
      DisplayLabel = 'Data Remessa'
      FieldName = 'DATA_REM_REC'
    end
    object cdsControleCRCOD_TERM: TIntegerField
      DisplayLabel = 'Codigo Terminal'
      FieldName = 'COD_TERM'
    end
    object cdsControleCRLOTE_QUIT: TIntegerField
      DisplayLabel = 'Lote Baixa'
      FieldName = 'LOTE_QUIT'
    end
    object cdsControleCRLOTE_ENT: TIntegerField
      DisplayLabel = 'Lote Cadastro'
      FieldName = 'LOTE_ENT'
    end
    object cdsControleCRCPFCGC: TStringField
      DisplayLabel = 'CPF/CNPJ'
      FieldName = 'CPFCGC'
      FixedChar = True
      Size = 18
    end
    object cdsControleCRDT_BAIXA_COMISSAO: TDateTimeField
      DisplayLabel = 'Data Baixa Comiss'#227'o'
      FieldName = 'DT_BAIXA_COMISSAO'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsControleCRVL_BAIXA_COMISSAO: TFloatField
      DisplayLabel = 'Valor Baixa Comiss'#227'o'
      FieldName = 'VL_BAIXA_COMISSAO'
      DisplayFormat = '##0.00'
    end
    object cdsControleCRDTORIGINAL_C: TDateTimeField
      DisplayLabel = 'Data Original Credito'
      FieldName = 'DTORIGINAL_C'
    end
    object cdsControleCRCODIGO_EMP: TIntegerField
      Tag = 1
      DisplayLabel = 'Codigo Empresa'
      FieldName = 'CODIGO_EMP'
      Required = True
    end
    object cdsControleCRCOD_EMP_MULT: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Emp Multi'
      FieldName = 'COD_EMP_MULT'
    end
    object cdsControleCRSELEC: TStringField
      DisplayLabel = 'S'
      FieldName = 'SELEC'
      FixedChar = True
      Size = 1
    end
    object cdsControleCROP_CXL: TIntegerField
      DisplayLabel = 'Op Fin'
      FieldName = 'OP_CXL'
    end
    object cdsControleCRSTATUS_CXL_RQ: TStringField
      DisplayLabel = 'Status Rec'
      FieldName = 'STATUS_CXL_RQ'
      FixedChar = True
      Size = 1
    end
    object cdsControleCRSTATUS_CX: TStringField
      DisplayLabel = 'Status CX'
      FieldName = 'STATUS_CX'
      FixedChar = True
      Size = 1
    end
    object cdsControleCROP_CX: TIntegerField
      DisplayLabel = 'Operador Caixa'
      FieldName = 'OP_CX'
    end
    object cdsControleCRUS_BX: TIntegerField
      DisplayLabel = 'Usuario que Baixou'
      FieldName = 'US_BX'
    end
    object cdsControleCRNOSSO_NUMERO_BANCO: TStringField
      DisplayLabel = 'Nosso Numero'
      FieldName = 'NOSSO_NUMERO_BANCO'
    end
    object cdsControleCRCOD_EMP_LOTE: TIntegerField
      DisplayLabel = 'Cod Emp Lote'
      FieldName = 'COD_EMP_LOTE'
    end
    object cdsControleCRCOD_CONTRAPARTIDA: TIntegerField
      DisplayLabel = 'Lote Contrapartida Lanc'
      FieldName = 'COD_CONTRAPARTIDA'
    end
    object cdsControleCRCOD_CONTRAPARTIDA_CTP: TIntegerField
      DisplayLabel = 'Lote Contrapartida Ctp'
      FieldName = 'COD_CONTRAPARTIDA_CTP'
    end
  end
  object dspControleCR: TDataSetProvider
    DataSet = qrControleCR
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 557
    Top = 110
  end
  object qrControleCR: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transContaAPagar
    SQL.Strings = (
      'select * from controle_creditos where codigo_emp=1')
    Left = 557
    Top = 62
  end
  object qrBuscasControleCR: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transContaAPagar
    Left = 552
    Top = 8
  end
  object dsDetalhesConta: TDataSource
    DataSet = cdsDetalhesConta
    Left = 767
    Top = 208
  end
  object dspDetalhesConta: TDataSetProvider
    DataSet = qrDetalhesConta
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    OnGetTableName = dspContaAPagarGetTableName
    Left = 766
    Top = 104
  end
  object qrDetalhesConta: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transContaAPagar
    SQL.Strings = (
      
        'select contas_a_pagar.*, controles.nome_ctrl, empresa.identifica' +
        'cao_emp, '
      
        'p_contas_contabil.cod_cta, p_contas_contabil.nome_cta, retorna_p' +
        'ag_ctp.form_pag from contas_a_pagar '
      
        'left join controles on controles.codigo_ctrl = contas_a_pagar.co' +
        'digo_ctrl and controles.codigo_emp = contas_a_pagar.codigo_emp '
      
        'left join empresa on empresa.cod_empresa = contas_a_pagar.cod_em' +
        'p_mult '
      
        'left join p_contas on p_contas.n_conta_plc = contas_a_pagar.n_co' +
        'nta_plc '
      
        'left join p_contas_contabil on p_contas_contabil.cod_cta = p_con' +
        'tas.cod_cta_contabil and p_contas_contabil.cod_empresa = contas_' +
        'a_pagar.cod_emp_mult '
      
        'left join retorna_pag_ctp (contas_a_pagar.lote, contas_a_pagar.c' +
        'odigo_emp, 0, '#39#39') on 1 = 1'
      'where contas_a_pagar.cod_contrp =  1'
      'and contas_a_pagar.codigo_emp =  1')
    Left = 765
    Top = 56
    object IntegerField23: TIntegerField
      FieldName = 'COD_CONTRP'
      Origin = '"CONTAS_A_PAGAR"."COD_CONTRP"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IntegerField24: TIntegerField
      FieldName = 'NUM_NOTA_NFE'
      Origin = '"CONTAS_A_PAGAR"."NUM_NOTA_NFE"'
    end
    object IntegerField25: TIntegerField
      FieldName = 'COD_FORN_NFE'
      Origin = '"CONTAS_A_PAGAR"."COD_FORN_NFE"'
    end
    object IntegerField26: TIntegerField
      FieldName = 'CODIGO_CTRL'
      Origin = '"CONTAS_A_PAGAR"."CODIGO_CTRL"'
      Required = True
    end
    object FloatField7: TFloatField
      FieldName = 'N_CONTA_PLC'
      Origin = '"CONTAS_A_PAGAR"."N_CONTA_PLC"'
    end
    object IBStringField1: TIBStringField
      FieldName = 'NOME_FOR_CTP'
      Origin = '"CONTAS_A_PAGAR"."NOME_FOR_CTP"'
      Size = 35
    end
    object DateTimeField10: TDateTimeField
      FieldName = 'DATA_ENT_CTP'
      Origin = '"CONTAS_A_PAGAR"."DATA_ENT_CTP"'
    end
    object IBStringField2: TIBStringField
      FieldName = 'N_DOC_CTP'
      Origin = '"CONTAS_A_PAGAR"."N_DOC_CTP"'
    end
    object FloatField8: TFloatField
      FieldName = 'VALOR_CTP'
      Origin = '"CONTAS_A_PAGAR"."VALOR_CTP"'
    end
    object IBStringField3: TIBStringField
      FieldName = 'STATUS_CTP'
      Origin = '"CONTAS_A_PAGAR"."STATUS_CTP"'
      FixedChar = True
      Size = 10
    end
    object DateTimeField11: TDateTimeField
      FieldName = 'DATQ_CTP'
      Origin = '"CONTAS_A_PAGAR"."DATQ_CTP"'
    end
    object IBStringField4: TIBStringField
      FieldName = 'NATL_CTP'
      Origin = '"CONTAS_A_PAGAR"."NATL_CTP"'
      FixedChar = True
      Size = 1
    end
    object DateTimeField12: TDateTimeField
      FieldName = 'DATA_VENC_CTP'
      Origin = '"CONTAS_A_PAGAR"."DATA_VENC_CTP"'
    end
    object IBStringField5: TIBStringField
      FieldName = 'TIPO_CTP'
      Origin = '"CONTAS_A_PAGAR"."TIPO_CTP"'
      FixedChar = True
      Size = 1
    end
    object IntegerField27: TIntegerField
      FieldName = 'LOTE'
      Origin = '"CONTAS_A_PAGAR"."LOTE"'
    end
    object IBStringField6: TIBStringField
      FieldName = 'TIPO_FOR_DUP'
      Origin = '"CONTAS_A_PAGAR"."TIPO_FOR_DUP"'
      FixedChar = True
      Size = 2
    end
    object IBStringField7: TIBStringField
      FieldName = 'SUBT_FOR_DUP'
      Origin = '"CONTAS_A_PAGAR"."SUBT_FOR_DUP"'
      FixedChar = True
      Size = 2
    end
    object IBStringField8: TIBStringField
      FieldName = 'SELEC'
      Origin = '"CONTAS_A_PAGAR"."SELEC"'
      FixedChar = True
      Size = 1
    end
    object IBStringField9: TIBStringField
      FieldName = 'HISTORICO_CTP'
      Origin = '"CONTAS_A_PAGAR"."HISTORICO_CTP"'
      Size = 100
    end
    object DateTimeField13: TDateTimeField
      FieldName = 'DATA_CXL'
      Origin = '"CONTAS_A_PAGAR"."DATA_CXL"'
    end
    object IBStringField10: TIBStringField
      FieldName = 'TIP_CNT'
      Origin = '"CONTAS_A_PAGAR"."TIP_CNT"'
      FixedChar = True
      Size = 1
    end
    object IBStringField11: TIBStringField
      FieldName = 'N_CHEQ_CTP'
      Origin = '"CONTAS_A_PAGAR"."N_CHEQ_CTP"'
      FixedChar = True
      Size = 10
    end
    object IBStringField12: TIBStringField
      FieldName = 'NOMINAL_CTP'
      Origin = '"CONTAS_A_PAGAR"."NOMINAL_CTP"'
      Size = 35
    end
    object DateTimeField14: TDateTimeField
      FieldName = 'DT_COMPENS'
      Origin = '"CONTAS_A_PAGAR"."DT_COMPENS"'
    end
    object IBStringField13: TIBStringField
      FieldName = 'CHASSI_CONC'
      Origin = '"CONTAS_A_PAGAR"."CHASSI_CONC"'
      FixedChar = True
      Size = 17
    end
    object DateTimeField15: TDateTimeField
      FieldName = 'DATA_BAIXA'
      Origin = '"CONTAS_A_PAGAR"."DATA_BAIXA"'
    end
    object FloatField9: TFloatField
      FieldName = 'VALOR_PAGO'
      Origin = '"CONTAS_A_PAGAR"."VALOR_PAGO"'
    end
    object IBStringField14: TIBStringField
      FieldName = 'ACEITE_CTP'
      Origin = '"CONTAS_A_PAGAR"."ACEITE_CTP"'
      FixedChar = True
      Size = 1
    end
    object FloatField10: TFloatField
      FieldName = 'VL_CONTABIL'
      Origin = '"CONTAS_A_PAGAR"."VL_CONTABIL"'
    end
    object IntegerField28: TIntegerField
      FieldName = 'CODIGO_EMP'
      Origin = '"CONTAS_A_PAGAR"."CODIGO_EMP"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IBStringField15: TIBStringField
      FieldName = 'CPF_CGC_F'
      Origin = '"CONTAS_A_PAGAR"."CPF_CGC_F"'
      FixedChar = True
      Size = 18
    end
    object IntegerField29: TIntegerField
      FieldName = 'COD_EMP_MULT'
      Origin = '"CONTAS_A_PAGAR"."COD_EMP_MULT"'
    end
    object IBStringField16: TIBStringField
      FieldName = 'NOME_BANCO_DUPL'
      Origin = '"CONTAS_A_PAGAR"."NOME_BANCO_DUPL"'
      Size = 10
    end
    object IBStringField17: TIBStringField
      FieldName = 'STATUS_HONDA'
      Origin = '"CONTAS_A_PAGAR"."STATUS_HONDA"'
      FixedChar = True
      Size = 10
    end
    object DateTimeField16: TDateTimeField
      FieldName = 'DATA_PREV_PG'
      Origin = '"CONTAS_A_PAGAR"."DATA_PREV_PG"'
    end
    object IntegerField30: TIntegerField
      FieldName = 'COD_EQUIP'
      Origin = '"CONTAS_A_PAGAR"."COD_EQUIP"'
    end
    object IBStringField18: TIBStringField
      FieldName = 'HISTRAT'
      Origin = '"CONTAS_A_PAGAR"."HISTRAT"'
      Size = 50
    end
    object FloatField11: TFloatField
      FieldName = 'N_CONTA_PLC_OR'
      Origin = '"CONTAS_A_PAGAR"."N_CONTA_PLC_OR"'
    end
    object IBStringField19: TIBStringField
      FieldName = 'TPRAT'
      Origin = '"CONTAS_A_PAGAR"."TPRAT"'
      FixedChar = True
      Size = 1
    end
    object DateTimeField17: TDateTimeField
      FieldName = 'DTREFERENCIA'
      Origin = '"CONTAS_A_PAGAR"."DTREFERENCIA"'
    end
    object IBStringField20: TIBStringField
      FieldName = 'ENTRA_PREVISAO'
      Origin = '"CONTAS_A_PAGAR"."ENTRA_PREVISAO"'
      FixedChar = True
      Size = 1
    end
    object IBStringField21: TIBStringField
      FieldName = 'SERIE'
      Origin = '"CONTAS_A_PAGAR"."SERIE"'
      Size = 5
    end
    object IBStringField22: TIBStringField
      FieldName = 'N_DOC_CTP_ORIG'
      Origin = '"CONTAS_A_PAGAR"."N_DOC_CTP_ORIG"'
    end
    object FloatField12: TFloatField
      FieldName = 'VALOR_CTP_ORIG'
      Origin = '"CONTAS_A_PAGAR"."VALOR_CTP_ORIG"'
    end
    object IBStringField23: TIBStringField
      FieldName = 'REF_FRETE'
      Origin = '"CONTAS_A_PAGAR"."REF_FRETE"'
      FixedChar = True
      Size = 1
    end
    object IntegerField31: TIntegerField
      FieldName = 'OP_CX'
      Origin = '"CONTAS_A_PAGAR"."OP_CX"'
    end
    object IntegerField32: TIntegerField
      FieldName = 'COD_OBS'
      Origin = '"CONTAS_A_PAGAR"."COD_OBS"'
    end
    object IBStringField24: TIBStringField
      FieldName = 'NSU_RO_ADM'
      Origin = '"CONTAS_A_PAGAR"."NSU_RO_ADM"'
      Size = 15
    end
    object IBStringField25: TIBStringField
      FieldName = 'ARQ_EXTRATO_ADM'
      Origin = '"CONTAS_A_PAGAR"."ARQ_EXTRATO_ADM"'
      Size = 255
    end
    object IntegerField33: TIntegerField
      FieldName = 'RO_ADM'
      Origin = '"CONTAS_A_PAGAR"."RO_ADM"'
    end
    object IntegerField34: TIntegerField
      FieldName = 'COD_ADM'
      Origin = '"CONTAS_A_PAGAR"."COD_ADM"'
    end
    object IntegerField35: TIntegerField
      FieldName = 'COD_DESPESA'
      Origin = '"CONTAS_A_PAGAR"."COD_DESPESA"'
    end
    object IBStringField26: TIBStringField
      FieldName = 'ALTERADO'
      Origin = '"CONTAS_A_PAGAR"."ALTERADO"'
      FixedChar = True
      Size = 1
    end
    object IntegerField36: TIntegerField
      FieldName = 'COD_USUARIO_PROCESS'
      Origin = '"CONTAS_A_PAGAR"."COD_USUARIO_PROCESS"'
    end
    object DateTimeField18: TDateTimeField
      FieldName = 'DATA_PROCESS'
      Origin = '"CONTAS_A_PAGAR"."DATA_PROCESS"'
    end
    object IBStringField27: TIBStringField
      FieldName = 'HORA_PROCESS'
      Origin = '"CONTAS_A_PAGAR"."HORA_PROCESS"'
      FixedChar = True
      Size = 8
    end
    object IBStringField28: TIBStringField
      FieldName = 'NOMEARQ_PROCESS'
      Origin = '"CONTAS_A_PAGAR"."NOMEARQ_PROCESS"'
      Size = 50
    end
    object IntegerField37: TIntegerField
      FieldName = 'US_CAD'
      Origin = '"CONTAS_A_PAGAR"."US_CAD"'
    end
    object IntegerField38: TIntegerField
      FieldName = 'US_BX'
      Origin = '"CONTAS_A_PAGAR"."US_BX"'
    end
    object qrDetalhesContaNOME_CTRL: TIBStringField
      FieldName = 'NOME_CTRL'
      Origin = '"CONTROLES"."NOME_CTRL"'
      ProviderFlags = []
      Size = 35
    end
    object IBStringField29: TIBStringField
      FieldName = 'IDENTIFICACAO_EMP'
      Origin = '"EMPRESA"."IDENTIFICACAO_EMP"'
      ProviderFlags = []
      Size = 64
    end
    object IBStringField30: TIBStringField
      FieldName = 'COD_CTA'
      Origin = '"P_CONTAS_CONTABIL"."COD_CTA"'
      ProviderFlags = []
      Size = 60
    end
    object IBStringField31: TIBStringField
      FieldName = 'NOME_CTA'
      Origin = '"P_CONTAS_CONTABIL"."NOME_CTA"'
      ProviderFlags = []
      Size = 60
    end
    object IntegerField39: TIntegerField
      FieldName = 'COD_CONTRAPARTIDA'
      Origin = '"CONTAS_A_PAGAR"."COD_CONTRAPARTIDA"'
    end
    object IntegerField40: TIntegerField
      FieldName = 'COD_CONTRAPARTIDA_CTP'
      Origin = '"CONTAS_A_PAGAR"."COD_CONTRAPARTIDA_CTP"'
    end
    object IntegerField41: TIntegerField
      FieldName = 'NPARCELA'
      Origin = '"CONTAS_A_PAGAR"."NPARCELA"'
    end
    object IntegerField42: TIntegerField
      FieldName = 'QTDE_PARC'
      Origin = '"CONTAS_A_PAGAR"."QTDE_PARC"'
    end
    object IntegerField43: TIntegerField
      FieldName = 'ID_FINANC_CONFERE'
      Origin = '"CONTAS_A_PAGAR"."ID_FINANC_CONFERE"'
    end
    object IntegerField44: TIntegerField
      FieldName = 'LOTE_QUIT_PARC'
      Origin = '"CONTAS_A_PAGAR"."LOTE_QUIT_PARC"'
    end
    object qrDetalhesContaCOD_CONTRP_ORIG: TIntegerField
      FieldName = 'COD_CONTRP_ORIG'
      Origin = '"CONTAS_A_PAGAR"."COD_CONTRP_ORIG"'
    end
    object qrDetalhesContaFORM_PAG: TIBStringField
      FieldName = 'FORM_PAG'
      Origin = '"RETORNA_PAG_CTP"."FORM_PAG"'
      ProviderFlags = []
      Size = 200
    end
  end
  object cdsDetalhesConta: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspDetalhesConta'
    BeforeOpen = cdsContaAPagarBeforeOpen
    Left = 767
    Top = 152
    object DateTimeField4: TDateTimeField
      DisplayLabel = 'Data Quita'#231#227'o'
      FieldName = 'DATQ_CTP'
      Origin = '"CONTAS_A_PAGAR"."DATQ_CTP"'
      EditMask = '!99/99/0000;1;_'
    end
    object FloatField2: TFloatField
      DisplayLabel = 'Valor Pago'
      FieldName = 'VALOR_PAGO'
      Origin = '"CONTAS_A_PAGAR"."VALOR_PAGO"'
      currency = True
    end
    object StringField3: TStringField
      DisplayLabel = 'Num Documento'
      DisplayWidth = 14
      FieldName = 'N_DOC_CTP'
      Origin = '"CONTAS_A_PAGAR"."N_DOC_CTP"'
    end
    object IntegerField3: TIntegerField
      DisplayLabel = 'Num Nota Compra'
      FieldName = 'NUM_NOTA_NFE'
      Origin = '"CONTAS_A_PAGAR"."NUM_NOTA_NFE"'
    end
    object DateTimeField1: TDateTimeField
      DisplayLabel = 'Data Vencimento'
      DisplayWidth = 10
      FieldName = 'DATA_VENC_CTP'
      Origin = '"CONTAS_A_PAGAR"."DATA_VENC_CTP"'
      EditMask = '!99/99/0000;1;_'
    end
    object StringField4: TStringField
      DisplayLabel = 'Hist'#243'rico'
      FieldName = 'HISTORICO_CTP'
      Origin = '"CONTAS_A_PAGAR"."HISTORICO_CTP"'
      Size = 100
    end
    object FloatField1: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VALOR_CTP'
      Origin = '"CONTAS_A_PAGAR"."VALOR_CTP"'
      currency = True
    end
    object IntegerField1: TIntegerField
      DisplayLabel = 'Cod Seq Pagar'
      FieldName = 'COD_CONTRP'
      Origin = '"CONTAS_A_PAGAR"."COD_CONTRP"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IntegerField2: TIntegerField
      DisplayLabel = 'Cod Controle'
      FieldName = 'CODIGO_CTRL'
      Origin = '"CONTAS_A_PAGAR"."CODIGO_CTRL"'
      Required = True
    end
    object IntegerField4: TIntegerField
      DisplayLabel = 'Cod Fornecedor'
      FieldName = 'COD_FORN_NFE'
      Origin = '"CONTAS_A_PAGAR"."COD_FORN_NFE"'
    end
    object DateTimeField2: TDateTimeField
      DisplayLabel = 'Data Entrada'
      FieldName = 'DATA_ENT_CTP'
      Origin = '"CONTAS_A_PAGAR"."DATA_ENT_CTP"'
      EditMask = '!99/99/0000;1;_'
    end
    object StringField2: TStringField
      DisplayLabel = 'Nome Fornecedor'
      FieldName = 'NOME_FOR_CTP'
      Origin = '"CONTAS_A_PAGAR"."NOME_FOR_CTP"'
      Size = 35
    end
    object FloatField3: TFloatField
      DisplayLabel = 'Num Conta Plano'
      FieldName = 'N_CONTA_PLC'
      Origin = '"CONTAS_A_PAGAR"."N_CONTA_PLC"'
    end
    object DateTimeField3: TDateTimeField
      DisplayLabel = 'Data de Refer'#234'ncia'
      FieldName = 'DTREFERENCIA'
      Origin = '"CONTAS_A_PAGAR"."DTREFERENCIA"'
      EditMask = '!99/99/0000;1;_'
    end
    object StringField5: TStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS_CTP'
      Origin = '"CONTAS_A_PAGAR"."STATUS_CTP"'
      FixedChar = True
      Size = 10
    end
    object StringField6: TStringField
      DisplayLabel = 'Natureza Lan'#231'amento(C/N)'
      FieldName = 'NATL_CTP'
      Origin = '"CONTAS_A_PAGAR"."NATL_CTP"'
      FixedChar = True
      Size = 1
    end
    object StringField7: TStringField
      DisplayLabel = 'Tipo de Conta(D/F)'
      FieldName = 'TIPO_CTP'
      Origin = '"CONTAS_A_PAGAR"."TIPO_CTP"'
      FixedChar = True
      Size = 1
    end
    object IntegerField5: TIntegerField
      DisplayLabel = 'Num Parcela'
      FieldName = 'NPARCELA'
    end
    object IntegerField6: TIntegerField
      DisplayLabel = 'Qtde Parcelas'
      FieldName = 'QTDE_PARC'
    end
    object IntegerField7: TIntegerField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
      Origin = '"CONTAS_A_PAGAR"."LOTE"'
    end
    object StringField8: TStringField
      DisplayLabel = 'Tipo For. Dupl'
      FieldName = 'TIPO_FOR_DUP'
      Origin = '"CONTAS_A_PAGAR"."TIPO_FOR_DUP"'
      FixedChar = True
      Size = 2
    end
    object StringField9: TStringField
      DisplayLabel = 'Subtipo For. Dupl'
      FieldName = 'SUBT_FOR_DUP'
      Origin = '"CONTAS_A_PAGAR"."SUBT_FOR_DUP"'
      FixedChar = True
      Size = 2
    end
    object DateTimeField5: TDateTimeField
      DisplayLabel = 'Data Caixa Auxiliar'
      FieldName = 'DATA_CXL'
      Origin = '"CONTAS_A_PAGAR"."DATA_CXL"'
    end
    object StringField10: TStringField
      DisplayLabel = 'Tipo Lanc Cont(C/N)'
      FieldName = 'TIP_CNT'
      Origin = '"CONTAS_A_PAGAR"."TIP_CNT"'
      FixedChar = True
      Size = 1
    end
    object StringField11: TStringField
      DisplayLabel = 'Num Cheque Ctp'
      FieldName = 'N_CHEQ_CTP'
      Origin = '"CONTAS_A_PAGAR"."N_CHEQ_CTP"'
      FixedChar = True
      Size = 10
    end
    object StringField12: TStringField
      DisplayLabel = 'Nominal a'
      FieldName = 'NOMINAL_CTP'
      Origin = '"CONTAS_A_PAGAR"."NOMINAL_CTP"'
      Size = 35
    end
    object DateTimeField6: TDateTimeField
      DisplayLabel = 'Data da Compensa'#231#227'o'
      FieldName = 'DT_COMPENS'
      Origin = '"CONTAS_A_PAGAR"."DT_COMPENS"'
    end
    object StringField13: TStringField
      DisplayLabel = 'Chassi Concession'#225'ria'
      FieldName = 'CHASSI_CONC'
      Origin = '"CONTAS_A_PAGAR"."CHASSI_CONC"'
      FixedChar = True
      Size = 17
    end
    object DateTimeField7: TDateTimeField
      DisplayLabel = 'Data Real da Baixa'
      FieldName = 'DATA_BAIXA'
      Origin = '"CONTAS_A_PAGAR"."DATA_BAIXA"'
    end
    object StringField14: TStringField
      DisplayLabel = 'Aceite CTP'
      FieldName = 'ACEITE_CTP'
      Origin = '"CONTAS_A_PAGAR"."ACEITE_CTP"'
      FixedChar = True
      Size = 1
    end
    object FloatField4: TFloatField
      DisplayLabel = 'Valor Cont'#225'bil'
      FieldName = 'VL_CONTABIL'
      Origin = '"CONTAS_A_PAGAR"."VL_CONTABIL"'
      currency = True
    end
    object IntegerField8: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'CODIGO_EMP'
      Origin = '"CONTAS_A_PAGAR"."CODIGO_EMP"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object StringField15: TStringField
      DisplayLabel = 'CPF/CNPJ'
      FieldName = 'CPF_CGC_F'
      Origin = '"CONTAS_A_PAGAR"."CPF_CGC_F"'
      FixedChar = True
      Size = 18
    end
    object StringField16: TStringField
      DisplayLabel = 'Nome Banco'
      FieldName = 'NOME_BANCO_DUPL'
      Origin = '"CONTAS_A_PAGAR"."NOME_BANCO_DUPL"'
      Size = 10
    end
    object StringField17: TStringField
      DisplayLabel = 'Status Montadora'
      FieldName = 'STATUS_HONDA'
      Origin = '"CONTAS_A_PAGAR"."STATUS_HONDA"'
      FixedChar = True
      Size = 10
    end
    object DateTimeField8: TDateTimeField
      DisplayLabel = 'Data Prev PG'
      FieldName = 'DATA_PREV_PG'
      Origin = '"CONTAS_A_PAGAR"."DATA_PREV_PG"'
    end
    object IntegerField9: TIntegerField
      DisplayLabel = 'Cod Equip'
      FieldName = 'COD_EQUIP'
      Origin = '"CONTAS_A_PAGAR"."COD_EQUIP"'
    end
    object StringField18: TStringField
      FieldName = 'HISTRAT'
      Origin = '"CONTAS_A_PAGAR"."HISTRAT"'
      Size = 50
    end
    object FloatField5: TFloatField
      DisplayLabel = 'Num Conta Plano Origem'
      FieldName = 'N_CONTA_PLC_OR'
      Origin = '"CONTAS_A_PAGAR"."N_CONTA_PLC_OR"'
    end
    object StringField19: TStringField
      FieldName = 'TPRAT'
      Origin = '"CONTAS_A_PAGAR"."TPRAT"'
      FixedChar = True
      Size = 1
    end
    object StringField20: TStringField
      DisplayLabel = 'Previs'#227'o Compet'#234'ncia'
      FieldName = 'ENTRA_PREVISAO'
      Origin = '"CONTAS_A_PAGAR"."ENTRA_PREVISAO"'
      FixedChar = True
      Size = 1
    end
    object StringField21: TStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Origin = '"CONTAS_A_PAGAR"."SERIE"'
      Size = 5
    end
    object StringField22: TStringField
      DisplayLabel = 'N. Documento Original'
      FieldName = 'N_DOC_CTP_ORIG'
      Origin = '"CONTAS_A_PAGAR"."N_DOC_CTP_ORIG"'
    end
    object FloatField6: TFloatField
      DisplayLabel = 'Valor Documento Original'
      FieldName = 'VALOR_CTP_ORIG'
      Origin = '"CONTAS_A_PAGAR"."VALOR_CTP_ORIG"'
    end
    object StringField23: TStringField
      DisplayLabel = 'Referente a frete'
      FieldName = 'REF_FRETE'
      Origin = '"CONTAS_A_PAGAR"."REF_FRETE"'
      FixedChar = True
      Size = 1
    end
    object StringField24: TStringField
      DisplayLabel = 'Sele'#231#227'o'
      FieldName = 'SELEC'
      Origin = '"CONTAS_A_PAGAR"."SELEC"'
      FixedChar = True
      Size = 1
    end
    object IntegerField10: TIntegerField
      DisplayLabel = 'Operador Pagando'
      FieldName = 'OP_CX'
      Origin = '"CONTAS_A_PAGAR"."OP_CX"'
    end
    object IntegerField11: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Obs'
      FieldName = 'COD_OBS'
      Origin = '"CONTAS_A_PAGAR"."COD_OBS"'
    end
    object StringField25: TStringField
      DisplayLabel = 'NSU RO ADM'
      FieldName = 'NSU_RO_ADM'
      Origin = '"CONTAS_A_PAGAR"."NSU_RO_ADM"'
      Size = 15
    end
    object IntegerField12: TIntegerField
      DisplayLabel = 'Num RO ADM'
      FieldName = 'RO_ADM'
      Origin = '"CONTAS_A_PAGAR"."RO_ADM"'
    end
    object IntegerField13: TIntegerField
      DisplayLabel = 'Cod Administradora'
      FieldName = 'COD_ADM'
    end
    object StringField26: TStringField
      DisplayLabel = 'Arquivo Extrado ADM'
      FieldName = 'ARQ_EXTRATO_ADM'
      Origin = '"CONTAS_A_PAGAR"."ARQ_EXTRATO_ADM"'
      Size = 255
    end
    object IntegerField14: TIntegerField
      DisplayLabel = 'Cod Despesa'
      FieldName = 'COD_DESPESA'
    end
    object IntegerField15: TIntegerField
      DisplayLabel = 'Cod Unificada'
      FieldName = 'COD_EMP_MULT'
      Origin = '"CONTAS_A_PAGAR"."COD_EMP_MULT"'
    end
    object cdsDetalhesContaNOME_CTRL: TStringField
      DisplayLabel = 'Controle'
      FieldName = 'NOME_CTRL'
      ProviderFlags = []
      Size = 35
    end
    object StringField27: TStringField
      DisplayLabel = 'Unificada'
      FieldName = 'IDENTIFICACAO_EMP'
      ProviderFlags = []
      Size = 64
    end
    object StringField30: TStringField
      DisplayLabel = 'Descricao Conta Contabil'
      FieldName = 'NOME_CTA'
      Origin = '"P_CONTAS_CONTABIL"."NOME_CTA"'
      ProviderFlags = []
      Size = 60
    end
    object StringField31: TStringField
      DisplayLabel = 'Cod Conta Contabil'
      FieldName = 'COD_CTA'
      Origin = '"P_CONTAS_CONTABIL"."COD_CTA"'
      ProviderFlags = []
      Size = 60
    end
    object IntegerField16: TIntegerField
      DisplayLabel = 'Cod Usuario Process'
      FieldName = 'COD_USUARIO_PROCESS'
    end
    object DateTimeField9: TDateTimeField
      DisplayLabel = 'Data Process'
      FieldName = 'DATA_PROCESS'
    end
    object StringField28: TStringField
      DisplayLabel = 'Hora Process'
      FieldName = 'HORA_PROCESS'
      FixedChar = True
      Size = 8
    end
    object StringField29: TStringField
      DisplayLabel = 'Arquivo Process'
      FieldName = 'NOMEARQ_PROCESS'
      Size = 50
    end
    object IntegerField17: TIntegerField
      DisplayLabel = 'Usuario que Cadastrou'
      FieldName = 'US_CAD'
    end
    object IntegerField18: TIntegerField
      DisplayLabel = 'Usuario que Quitou'
      FieldName = 'US_BX'
    end
    object IntegerField19: TIntegerField
      DisplayLabel = 'Lote Contrapartida Lanc'
      FieldName = 'COD_CONTRAPARTIDA'
    end
    object IntegerField20: TIntegerField
      DisplayLabel = 'Lote Contrapartida Ctp'
      FieldName = 'COD_CONTRAPARTIDA_CTP'
    end
    object IntegerField21: TIntegerField
      Tag = 1
      DisplayLabel = 'Id Financ Confere'
      FieldName = 'ID_FINANC_CONFERE'
    end
    object IntegerField22: TIntegerField
      Tag = 1
      DisplayLabel = 'Lote Baixar Parc'
      FieldName = 'LOTE_QUIT_PARC'
    end
    object cdsDetalhesContaCOD_CONTRP_ORIG: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Seq Pagar Orig'
      FieldName = 'COD_CONTRP_ORIG'
    end
    object cdsDetalhesContaFORM_PAG: TStringField
      FieldName = 'FORM_PAG'
      ProviderFlags = []
      Size = 200
    end
  end
  object dsControleCTP: TDataSource
    DataSet = cdsControleCTP
    Left = 661
    Top = 214
  end
  object cdsControleCTP: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspControleCTP'
    BeforeOpen = cdsContaAPagarBeforeOpen
    Left = 661
    Top = 158
    object cdsControleCTPCOD_CONTRP: TIntegerField
      FieldName = 'COD_CONTRP'
      Required = True
    end
    object cdsControleCTPNUM_NOTA_NFE: TIntegerField
      FieldName = 'NUM_NOTA_NFE'
    end
    object cdsControleCTPCOD_FORN_NFE: TIntegerField
      FieldName = 'COD_FORN_NFE'
    end
    object cdsControleCTPCODIGO_CTRL: TIntegerField
      FieldName = 'CODIGO_CTRL'
      Required = True
    end
    object cdsControleCTPN_CONTA_PLC: TFloatField
      FieldName = 'N_CONTA_PLC'
    end
    object cdsControleCTPNOME_FOR_CTP: TStringField
      FieldName = 'NOME_FOR_CTP'
      Size = 35
    end
    object cdsControleCTPDATA_ENT_CTP: TDateTimeField
      FieldName = 'DATA_ENT_CTP'
    end
    object cdsControleCTPN_DOC_CTP: TStringField
      FieldName = 'N_DOC_CTP'
    end
    object cdsControleCTPVALOR_CTP: TFloatField
      FieldName = 'VALOR_CTP'
    end
    object cdsControleCTPSTATUS_CTP: TStringField
      FieldName = 'STATUS_CTP'
      FixedChar = True
      Size = 10
    end
    object cdsControleCTPDATQ_CTP: TDateTimeField
      FieldName = 'DATQ_CTP'
    end
    object cdsControleCTPNATL_CTP: TStringField
      FieldName = 'NATL_CTP'
      FixedChar = True
      Size = 1
    end
    object cdsControleCTPDATA_VENC_CTP: TDateTimeField
      FieldName = 'DATA_VENC_CTP'
    end
    object cdsControleCTPTIPO_CTP: TStringField
      FieldName = 'TIPO_CTP'
      FixedChar = True
      Size = 1
    end
    object cdsControleCTPLOTE: TIntegerField
      FieldName = 'LOTE'
    end
    object cdsControleCTPTIPO_FOR_DUP: TStringField
      FieldName = 'TIPO_FOR_DUP'
      FixedChar = True
      Size = 2
    end
    object cdsControleCTPSUBT_FOR_DUP: TStringField
      FieldName = 'SUBT_FOR_DUP'
      FixedChar = True
      Size = 2
    end
    object cdsControleCTPSELEC: TStringField
      FieldName = 'SELEC'
      FixedChar = True
      Size = 1
    end
    object cdsControleCTPHISTORICO_CTP: TStringField
      FieldName = 'HISTORICO_CTP'
      Size = 100
    end
    object cdsControleCTPDATA_CXL: TDateTimeField
      FieldName = 'DATA_CXL'
    end
    object cdsControleCTPTIP_CNT: TStringField
      FieldName = 'TIP_CNT'
      FixedChar = True
      Size = 1
    end
    object cdsControleCTPN_CHEQ_CTP: TStringField
      FieldName = 'N_CHEQ_CTP'
      FixedChar = True
      Size = 10
    end
    object cdsControleCTPNOMINAL_CTP: TStringField
      FieldName = 'NOMINAL_CTP'
      Size = 35
    end
    object cdsControleCTPDT_COMPENS: TDateTimeField
      FieldName = 'DT_COMPENS'
    end
    object cdsControleCTPCHASSI_CONC: TStringField
      FieldName = 'CHASSI_CONC'
      FixedChar = True
      Size = 17
    end
    object cdsControleCTPDATA_BAIXA: TDateTimeField
      FieldName = 'DATA_BAIXA'
    end
    object cdsControleCTPVALOR_PAGO: TFloatField
      FieldName = 'VALOR_PAGO'
    end
    object cdsControleCTPACEITE_CTP: TStringField
      FieldName = 'ACEITE_CTP'
      FixedChar = True
      Size = 1
    end
    object cdsControleCTPVL_CONTABIL: TFloatField
      FieldName = 'VL_CONTABIL'
    end
    object cdsControleCTPCODIGO_EMP: TIntegerField
      FieldName = 'CODIGO_EMP'
      Required = True
    end
    object cdsControleCTPCPF_CGC_F: TStringField
      FieldName = 'CPF_CGC_F'
      FixedChar = True
      Size = 18
    end
    object cdsControleCTPCOD_EMP_MULT: TIntegerField
      FieldName = 'COD_EMP_MULT'
    end
    object cdsControleCTPNOME_BANCO_DUPL: TStringField
      FieldName = 'NOME_BANCO_DUPL'
      Size = 10
    end
    object cdsControleCTPSTATUS_HONDA: TStringField
      FieldName = 'STATUS_HONDA'
      FixedChar = True
      Size = 10
    end
    object cdsControleCTPDATA_PREV_PG: TDateTimeField
      FieldName = 'DATA_PREV_PG'
    end
    object cdsControleCTPCOD_EQUIP: TIntegerField
      FieldName = 'COD_EQUIP'
    end
    object cdsControleCTPHISTRAT: TStringField
      FieldName = 'HISTRAT'
      Size = 50
    end
    object cdsControleCTPN_CONTA_PLC_OR: TFloatField
      FieldName = 'N_CONTA_PLC_OR'
    end
    object cdsControleCTPTPRAT: TStringField
      FieldName = 'TPRAT'
      FixedChar = True
      Size = 1
    end
    object cdsControleCTPDTREFERENCIA: TDateTimeField
      FieldName = 'DTREFERENCIA'
    end
    object cdsControleCTPENTRA_PREVISAO: TStringField
      FieldName = 'ENTRA_PREVISAO'
      FixedChar = True
      Size = 1
    end
    object cdsControleCTPSERIE: TStringField
      FieldName = 'SERIE'
      Size = 5
    end
    object cdsControleCTPN_DOC_CTP_ORIG: TStringField
      FieldName = 'N_DOC_CTP_ORIG'
    end
    object cdsControleCTPVALOR_CTP_ORIG: TFloatField
      FieldName = 'VALOR_CTP_ORIG'
    end
    object cdsControleCTPREF_FRETE: TStringField
      FieldName = 'REF_FRETE'
      FixedChar = True
      Size = 1
    end
    object cdsControleCTPOP_CX: TIntegerField
      FieldName = 'OP_CX'
    end
    object cdsControleCTPCOD_OBS: TIntegerField
      FieldName = 'COD_OBS'
    end
    object cdsControleCTPNSU_RO_ADM: TStringField
      FieldName = 'NSU_RO_ADM'
      Size = 15
    end
    object cdsControleCTPARQ_EXTRATO_ADM: TStringField
      FieldName = 'ARQ_EXTRATO_ADM'
      Size = 255
    end
    object cdsControleCTPRO_ADM: TIntegerField
      FieldName = 'RO_ADM'
    end
    object cdsControleCTPCOD_ADM: TIntegerField
      FieldName = 'COD_ADM'
    end
    object cdsControleCTPCOD_DESPESA: TIntegerField
      FieldName = 'COD_DESPESA'
    end
    object cdsControleCTPALTERADO: TStringField
      FieldName = 'ALTERADO'
      FixedChar = True
      Size = 1
    end
    object cdsControleCTPCOD_USUARIO_PROCESS: TIntegerField
      FieldName = 'COD_USUARIO_PROCESS'
    end
    object cdsControleCTPDATA_PROCESS: TDateTimeField
      FieldName = 'DATA_PROCESS'
    end
    object cdsControleCTPHORA_PROCESS: TStringField
      FieldName = 'HORA_PROCESS'
      FixedChar = True
      Size = 8
    end
    object cdsControleCTPNOMEARQ_PROCESS: TStringField
      FieldName = 'NOMEARQ_PROCESS'
      Size = 50
    end
    object cdsControleCTPUS_CAD: TIntegerField
      FieldName = 'US_CAD'
    end
    object cdsControleCTPUS_BX: TIntegerField
      FieldName = 'US_BX'
    end
    object cdsControleCTPCOD_CONTRAPARTIDA: TIntegerField
      FieldName = 'COD_CONTRAPARTIDA'
    end
    object cdsControleCTPNPED: TIntegerField
      FieldName = 'NPED'
    end
    object cdsControleCTPTIPO_NPED: TStringField
      FieldName = 'TIPO_NPED'
      FixedChar = True
      Size = 3
    end
    object cdsControleCTPCOD_CONTRAPARTIDA_CTP: TIntegerField
      FieldName = 'COD_CONTRAPARTIDA_CTP'
    end
    object cdsControleCTPNPARCELA: TIntegerField
      FieldName = 'NPARCELA'
    end
    object cdsControleCTPQTDE_PARC: TIntegerField
      FieldName = 'QTDE_PARC'
    end
    object cdsControleCTPHWCREDID: TIntegerField
      FieldName = 'HWCREDID'
    end
    object cdsControleCTPID_FINANC_CONFERE: TIntegerField
      FieldName = 'ID_FINANC_CONFERE'
    end
    object cdsControleCTPLOTE_QUIT_PARC: TIntegerField
      FieldName = 'LOTE_QUIT_PARC'
    end
    object cdsControleCTPCOD_CONTRP_ORIG: TIntegerField
      FieldName = 'COD_CONTRP_ORIG'
    end
    object cdsControleCTPLOTE_ENT: TIntegerField
      FieldName = 'LOTE_ENT'
    end
  end
  object dspControleCTP: TDataSetProvider
    DataSet = qrControleCTP
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 661
    Top = 110
  end
  object qrControleCTP: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transContaAPagar
    SQL.Strings = (
      'select first 1 * from contas_a_pagar')
    Left = 661
    Top = 62
  end
  object qrContaAPagar: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transContaAPagar
    SQL.Strings = (
      
        'select contas_a_pagar.*, controles.nome_ctrl, emp.identificacao_' +
        'emp,'
      
        'p_contas.desc_plc,grupos_ct.desc_gr, depart_ct.desc_dep,p_contas' +
        '_contabil.cod_cta, p_contas_contabil.nome_cta, retorna_pag_ctp.f' +
        'orm_pag from contas_a_pagar'
      
        'left join controles on controles.codigo_ctrl = contas_a_pagar.co' +
        'digo_ctrl and controles.codigo_emp = contas_a_pagar.codigo_emp'
      
        'left join empresa emp on emp.cod_empresa = contas_a_pagar.cod_em' +
        'p_mult'
      
        'left join p_contas on p_contas.n_conta_plc = contas_a_pagar.n_co' +
        'nta_plc'
      'left join grupos_ct on p_contas.grup_ct = grupos_ct.grup_ct'
      'left join depart_ct on grupos_ct.cod_dep = depart_ct.cod_dep'
      
        'left join p_contas_contabil on p_contas_contabil.cod_cta = p_con' +
        'tas.cod_cta_contabil and p_contas_contabil.cod_empresa = contas_' +
        'a_pagar.cod_emp_mult'
      
        'left join retorna_pag_ctp (contas_a_pagar.lote, contas_a_pagar.c' +
        'odigo_emp, 0, '#39#39') on 1 = 1'
      
        'where contas_a_pagar.cod_contrp = 0 and contas_a_pagar.codigo_em' +
        'p = 0')
    Left = 32
    Top = 64
    object qrContaAPagarCOD_CONTRP: TIntegerField
      FieldName = 'COD_CONTRP'
      Origin = '"CONTAS_A_PAGAR"."COD_CONTRP"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrContaAPagarNUM_NOTA_NFE: TIntegerField
      FieldName = 'NUM_NOTA_NFE'
      Origin = '"CONTAS_A_PAGAR"."NUM_NOTA_NFE"'
    end
    object qrContaAPagarCOD_FORN_NFE: TIntegerField
      FieldName = 'COD_FORN_NFE'
      Origin = '"CONTAS_A_PAGAR"."COD_FORN_NFE"'
    end
    object qrContaAPagarCODIGO_CTRL: TIntegerField
      FieldName = 'CODIGO_CTRL'
      Origin = '"CONTAS_A_PAGAR"."CODIGO_CTRL"'
      Required = True
    end
    object qrContaAPagarN_CONTA_PLC: TFloatField
      FieldName = 'N_CONTA_PLC'
      Origin = '"CONTAS_A_PAGAR"."N_CONTA_PLC"'
    end
    object qrContaAPagarNOME_FOR_CTP: TIBStringField
      FieldName = 'NOME_FOR_CTP'
      Origin = '"CONTAS_A_PAGAR"."NOME_FOR_CTP"'
      Size = 35
    end
    object qrContaAPagarDATA_ENT_CTP: TDateTimeField
      FieldName = 'DATA_ENT_CTP'
      Origin = '"CONTAS_A_PAGAR"."DATA_ENT_CTP"'
    end
    object qrContaAPagarN_DOC_CTP: TIBStringField
      FieldName = 'N_DOC_CTP'
      Origin = '"CONTAS_A_PAGAR"."N_DOC_CTP"'
    end
    object qrContaAPagarVALOR_CTP: TFloatField
      FieldName = 'VALOR_CTP'
      Origin = '"CONTAS_A_PAGAR"."VALOR_CTP"'
    end
    object qrContaAPagarSTATUS_CTP: TIBStringField
      FieldName = 'STATUS_CTP'
      Origin = '"CONTAS_A_PAGAR"."STATUS_CTP"'
      FixedChar = True
      Size = 10
    end
    object qrContaAPagarDATQ_CTP: TDateTimeField
      FieldName = 'DATQ_CTP'
      Origin = '"CONTAS_A_PAGAR"."DATQ_CTP"'
    end
    object qrContaAPagarNATL_CTP: TIBStringField
      FieldName = 'NATL_CTP'
      Origin = '"CONTAS_A_PAGAR"."NATL_CTP"'
      FixedChar = True
      Size = 1
    end
    object qrContaAPagarDATA_VENC_CTP: TDateTimeField
      FieldName = 'DATA_VENC_CTP'
      Origin = '"CONTAS_A_PAGAR"."DATA_VENC_CTP"'
    end
    object qrContaAPagarTIPO_CTP: TIBStringField
      FieldName = 'TIPO_CTP'
      Origin = '"CONTAS_A_PAGAR"."TIPO_CTP"'
      FixedChar = True
      Size = 1
    end
    object qrContaAPagarLOTE: TIntegerField
      FieldName = 'LOTE'
      Origin = '"CONTAS_A_PAGAR"."LOTE"'
    end
    object qrContaAPagarTIPO_FOR_DUP: TIBStringField
      FieldName = 'TIPO_FOR_DUP'
      Origin = '"CONTAS_A_PAGAR"."TIPO_FOR_DUP"'
      FixedChar = True
      Size = 2
    end
    object qrContaAPagarSUBT_FOR_DUP: TIBStringField
      FieldName = 'SUBT_FOR_DUP'
      Origin = '"CONTAS_A_PAGAR"."SUBT_FOR_DUP"'
      FixedChar = True
      Size = 2
    end
    object qrContaAPagarSELEC: TIBStringField
      FieldName = 'SELEC'
      Origin = '"CONTAS_A_PAGAR"."SELEC"'
      FixedChar = True
      Size = 1
    end
    object qrContaAPagarHISTORICO_CTP: TIBStringField
      FieldName = 'HISTORICO_CTP'
      Origin = '"CONTAS_A_PAGAR"."HISTORICO_CTP"'
      Size = 100
    end
    object qrContaAPagarDATA_CXL: TDateTimeField
      FieldName = 'DATA_CXL'
      Origin = '"CONTAS_A_PAGAR"."DATA_CXL"'
    end
    object qrContaAPagarTIP_CNT: TIBStringField
      FieldName = 'TIP_CNT'
      Origin = '"CONTAS_A_PAGAR"."TIP_CNT"'
      FixedChar = True
      Size = 1
    end
    object qrContaAPagarN_CHEQ_CTP: TIBStringField
      FieldName = 'N_CHEQ_CTP'
      Origin = '"CONTAS_A_PAGAR"."N_CHEQ_CTP"'
      FixedChar = True
      Size = 10
    end
    object qrContaAPagarNOMINAL_CTP: TIBStringField
      FieldName = 'NOMINAL_CTP'
      Origin = '"CONTAS_A_PAGAR"."NOMINAL_CTP"'
      Size = 35
    end
    object qrContaAPagarDT_COMPENS: TDateTimeField
      FieldName = 'DT_COMPENS'
      Origin = '"CONTAS_A_PAGAR"."DT_COMPENS"'
    end
    object qrContaAPagarCHASSI_CONC: TIBStringField
      FieldName = 'CHASSI_CONC'
      Origin = '"CONTAS_A_PAGAR"."CHASSI_CONC"'
      FixedChar = True
      Size = 17
    end
    object qrContaAPagarDATA_BAIXA: TDateTimeField
      FieldName = 'DATA_BAIXA'
      Origin = '"CONTAS_A_PAGAR"."DATA_BAIXA"'
    end
    object qrContaAPagarVALOR_PAGO: TFloatField
      FieldName = 'VALOR_PAGO'
      Origin = '"CONTAS_A_PAGAR"."VALOR_PAGO"'
    end
    object qrContaAPagarACEITE_CTP: TIBStringField
      FieldName = 'ACEITE_CTP'
      Origin = '"CONTAS_A_PAGAR"."ACEITE_CTP"'
      FixedChar = True
      Size = 1
    end
    object qrContaAPagarVL_CONTABIL: TFloatField
      FieldName = 'VL_CONTABIL'
      Origin = '"CONTAS_A_PAGAR"."VL_CONTABIL"'
    end
    object qrContaAPagarCODIGO_EMP: TIntegerField
      FieldName = 'CODIGO_EMP'
      Origin = '"CONTAS_A_PAGAR"."CODIGO_EMP"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrContaAPagarCPF_CGC_F: TIBStringField
      FieldName = 'CPF_CGC_F'
      Origin = '"CONTAS_A_PAGAR"."CPF_CGC_F"'
      FixedChar = True
      Size = 18
    end
    object qrContaAPagarCOD_EMP_MULT: TIntegerField
      FieldName = 'COD_EMP_MULT'
      Origin = '"CONTAS_A_PAGAR"."COD_EMP_MULT"'
    end
    object qrContaAPagarNOME_BANCO_DUPL: TIBStringField
      FieldName = 'NOME_BANCO_DUPL'
      Origin = '"CONTAS_A_PAGAR"."NOME_BANCO_DUPL"'
      Size = 10
    end
    object qrContaAPagarSTATUS_HONDA: TIBStringField
      FieldName = 'STATUS_HONDA'
      Origin = '"CONTAS_A_PAGAR"."STATUS_HONDA"'
      FixedChar = True
      Size = 10
    end
    object qrContaAPagarDATA_PREV_PG: TDateTimeField
      FieldName = 'DATA_PREV_PG'
      Origin = '"CONTAS_A_PAGAR"."DATA_PREV_PG"'
    end
    object qrContaAPagarCOD_EQUIP: TIntegerField
      FieldName = 'COD_EQUIP'
      Origin = '"CONTAS_A_PAGAR"."COD_EQUIP"'
    end
    object qrContaAPagarHISTRAT: TIBStringField
      FieldName = 'HISTRAT'
      Origin = '"CONTAS_A_PAGAR"."HISTRAT"'
      Size = 50
    end
    object qrContaAPagarN_CONTA_PLC_OR: TFloatField
      FieldName = 'N_CONTA_PLC_OR'
      Origin = '"CONTAS_A_PAGAR"."N_CONTA_PLC_OR"'
    end
    object qrContaAPagarTPRAT: TIBStringField
      FieldName = 'TPRAT'
      Origin = '"CONTAS_A_PAGAR"."TPRAT"'
      FixedChar = True
      Size = 1
    end
    object qrContaAPagarDTREFERENCIA: TDateTimeField
      FieldName = 'DTREFERENCIA'
      Origin = '"CONTAS_A_PAGAR"."DTREFERENCIA"'
    end
    object qrContaAPagarENTRA_PREVISAO: TIBStringField
      FieldName = 'ENTRA_PREVISAO'
      Origin = '"CONTAS_A_PAGAR"."ENTRA_PREVISAO"'
      FixedChar = True
      Size = 1
    end
    object qrContaAPagarSERIE: TIBStringField
      FieldName = 'SERIE'
      Origin = '"CONTAS_A_PAGAR"."SERIE"'
      Size = 5
    end
    object qrContaAPagarN_DOC_CTP_ORIG: TIBStringField
      FieldName = 'N_DOC_CTP_ORIG'
      Origin = '"CONTAS_A_PAGAR"."N_DOC_CTP_ORIG"'
    end
    object qrContaAPagarVALOR_CTP_ORIG: TFloatField
      FieldName = 'VALOR_CTP_ORIG'
      Origin = '"CONTAS_A_PAGAR"."VALOR_CTP_ORIG"'
    end
    object qrContaAPagarREF_FRETE: TIBStringField
      FieldName = 'REF_FRETE'
      Origin = '"CONTAS_A_PAGAR"."REF_FRETE"'
      FixedChar = True
      Size = 1
    end
    object qrContaAPagarOP_CX: TIntegerField
      FieldName = 'OP_CX'
      Origin = '"CONTAS_A_PAGAR"."OP_CX"'
    end
    object qrContaAPagarCOD_OBS: TIntegerField
      FieldName = 'COD_OBS'
      Origin = '"CONTAS_A_PAGAR"."COD_OBS"'
    end
    object qrContaAPagarNSU_RO_ADM: TIBStringField
      FieldName = 'NSU_RO_ADM'
      Origin = '"CONTAS_A_PAGAR"."NSU_RO_ADM"'
      Size = 15
    end
    object qrContaAPagarRO_ADM: TIntegerField
      FieldName = 'RO_ADM'
      Origin = '"CONTAS_A_PAGAR"."RO_ADM"'
    end
    object qrContaAPagarCOD_ADM: TIntegerField
      FieldName = 'COD_ADM'
      Origin = '"CONTAS_A_PAGAR"."COD_ADM"'
    end
    object qrContaAPagarCOD_DESPESA: TIntegerField
      FieldName = 'COD_DESPESA'
      Origin = '"CONTAS_A_PAGAR"."COD_DESPESA"'
    end
    object qrContaAPagarALTERADO: TIBStringField
      FieldName = 'ALTERADO'
      Origin = '"CONTAS_A_PAGAR"."ALTERADO"'
      FixedChar = True
      Size = 1
    end
    object qrContaAPagarCOD_USUARIO_PROCESS: TIntegerField
      FieldName = 'COD_USUARIO_PROCESS'
      Origin = '"CONTAS_A_PAGAR"."COD_USUARIO_PROCESS"'
    end
    object qrContaAPagarDATA_PROCESS: TDateTimeField
      FieldName = 'DATA_PROCESS'
      Origin = '"CONTAS_A_PAGAR"."DATA_PROCESS"'
    end
    object qrContaAPagarHORA_PROCESS: TIBStringField
      FieldName = 'HORA_PROCESS'
      Origin = '"CONTAS_A_PAGAR"."HORA_PROCESS"'
      FixedChar = True
      Size = 8
    end
    object qrContaAPagarNOMEARQ_PROCESS: TIBStringField
      FieldName = 'NOMEARQ_PROCESS'
      Origin = '"CONTAS_A_PAGAR"."NOMEARQ_PROCESS"'
      Size = 50
    end
    object qrContaAPagarUS_CAD: TIntegerField
      FieldName = 'US_CAD'
      Origin = '"CONTAS_A_PAGAR"."US_CAD"'
    end
    object qrContaAPagarUS_BX: TIntegerField
      FieldName = 'US_BX'
      Origin = '"CONTAS_A_PAGAR"."US_BX"'
    end
    object qrContaAPagarCOD_CONTRAPARTIDA: TIntegerField
      FieldName = 'COD_CONTRAPARTIDA'
      Origin = '"CONTAS_A_PAGAR"."COD_CONTRAPARTIDA"'
    end
    object qrContaAPagarCOD_CONTRAPARTIDA_CTP: TIntegerField
      FieldName = 'COD_CONTRAPARTIDA_CTP'
      Origin = '"CONTAS_A_PAGAR"."COD_CONTRAPARTIDA_CTP"'
    end
    object qrContaAPagarNPARCELA: TIntegerField
      FieldName = 'NPARCELA'
      Origin = '"CONTAS_A_PAGAR"."NPARCELA"'
    end
    object qrContaAPagarQTDE_PARC: TIntegerField
      FieldName = 'QTDE_PARC'
      Origin = '"CONTAS_A_PAGAR"."QTDE_PARC"'
    end
    object qrContaAPagarID_FINANC_CONFERE: TIntegerField
      FieldName = 'ID_FINANC_CONFERE'
      Origin = '"CONTAS_A_PAGAR"."ID_FINANC_CONFERE"'
    end
    object qrContaAPagarLOTE_QUIT_PARC: TIntegerField
      FieldName = 'LOTE_QUIT_PARC'
      Origin = '"CONTAS_A_PAGAR"."LOTE_QUIT_PARC"'
    end
    object qrContaAPagarCOD_CONTRP_ORIG: TIntegerField
      FieldName = 'COD_CONTRP_ORIG'
      Origin = '"CONTAS_A_PAGAR"."COD_CONTRP_ORIG"'
    end
    object qrContaAPagarLOTE_ENT: TIntegerField
      FieldName = 'LOTE_ENT'
      Origin = '"CONTAS_A_PAGAR"."LOTE_ENT"'
    end
    object qrContaAPagarNOME_CTRL: TIBStringField
      FieldName = 'NOME_CTRL'
      Origin = '"CONTROLES"."NOME_CTRL"'
      ProviderFlags = []
      Size = 35
    end
    object qrContaAPagarIDENTIFICACAO_EMP: TIBStringField
      FieldName = 'IDENTIFICACAO_EMP'
      Origin = '"EMPRESA"."IDENTIFICACAO_EMP"'
      ProviderFlags = []
      Size = 64
    end
    object qrContaAPagarDESC_PLC: TIBStringField
      FieldName = 'DESC_PLC'
      Origin = '"P_CONTAS"."DESC_PLC"'
      ProviderFlags = []
      FixedChar = True
      Size = 30
    end
    object qrContaAPagarDESC_GR: TIBStringField
      FieldName = 'DESC_GR'
      Origin = '"GRUPOS_CT"."DESC_GR"'
      ProviderFlags = []
      FixedChar = True
      Size = 35
    end
    object qrContaAPagarDESC_DEP: TIBStringField
      FieldName = 'DESC_DEP'
      Origin = '"DEPART_CT"."DESC_DEP"'
      ProviderFlags = []
      Size = 35
    end
    object qrContaAPagarCOD_CTA: TIBStringField
      FieldName = 'COD_CTA'
      Origin = '"P_CONTAS_CONTABIL"."COD_CTA"'
      ProviderFlags = []
      Size = 60
    end
    object qrContaAPagarNOME_CTA: TIBStringField
      FieldName = 'NOME_CTA'
      Origin = '"P_CONTAS_CONTABIL"."NOME_CTA"'
      ProviderFlags = []
      Size = 60
    end
    object qrContaAPagarFORM_PAG: TIBStringField
      FieldName = 'FORM_PAG'
      Origin = '"RETORNA_PAG_CTP"."FORM_PAG"'
      ProviderFlags = []
      Size = 200
    end
    object qrContaAPagarARQ_EXTRATO_ADM: TIBStringField
      FieldName = 'ARQ_EXTRATO_ADM'
      Origin = '"CONTAS_A_PAGAR"."ARQ_EXTRATO_ADM"'
      Size = 255
    end
    object qrContaAPagarDATA_ARQUIVO: TDateTimeField
      FieldName = 'DATA_ARQUIVO'
      Origin = '"CONTAS_A_PAGAR"."DATA_ARQUIVO"'
    end
    object qrContaAPagarNPED: TIntegerField
      FieldName = 'NPED'
      Origin = '"CONTAS_A_PAGAR"."NPED"'
    end
    object qrContaAPagarTIPO_NPED: TIBStringField
      FieldName = 'TIPO_NPED'
      Origin = '"CONTAS_A_PAGAR"."TIPO_NPED"'
      FixedChar = True
      Size = 3
    end
    object qrContaAPagarDATA_DESM: TDateTimeField
      FieldName = 'DATA_DESM'
    end
    object qrContaAPagarOP_DESM: TIntegerField
      FieldName = 'OP_DESM'
    end
  end
  object qrBuscasControleCTP: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transContaAPagar
    Left = 664
    Top = 8
  end
end
