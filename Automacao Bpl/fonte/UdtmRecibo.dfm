object dtmRecibo: TdtmRecibo
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 384
  Width = 875
  object cdsRecibo: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRecibo'
    BeforeOpen = cdsReciboBeforeOpen
    Left = 40
    Top = 248
    object cdsReciboNRECIBO: TIntegerField
      Tag = 2
      DisplayLabel = 'Num Recibo'
      FieldName = 'NRECIBO'
      Required = True
    end
    object cdsReciboNUM_REC_DEP: TStringField
      DisplayLabel = 'Nro Recibo'
      FieldName = 'NUM_REC_DEP'
      Size = 11
    end
    object cdsReciboCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'C'#243'digo da Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsReciboVALOR: TFloatField
      DisplayLabel = 'Import'#226'ncia'
      FieldName = 'VALOR'
      DisplayFormat = '0.00'
      currency = True
    end
    object cdsReciboREFERENCIA1: TStringField
      DisplayLabel = 'Ref. 1'
      FieldName = 'REFERENCIA1'
      FixedChar = True
      Size = 66
    end
    object cdsReciboREFERENCIA2: TStringField
      DisplayLabel = 'Ref. 2'
      FieldName = 'REFERENCIA2'
      FixedChar = True
      Size = 66
    end
    object cdsReciboREFERENCIA3: TStringField
      DisplayLabel = 'Ref. 3'
      FieldName = 'REFERENCIA3'
      FixedChar = True
      Size = 66
    end
    object cdsReciboREFERENCIA4: TStringField
      DisplayLabel = 'Ref. 4'
      FieldName = 'REFERENCIA4'
      FixedChar = True
      Size = 66
    end
    object cdsReciboBENEF_CLIENT: TStringField
      DisplayLabel = 'Benefici'#225'rio'
      FieldName = 'BENEF_CLIENT'
      FixedChar = True
      Size = 40
    end
    object cdsReciboATRAVES1: TStringField
      DisplayLabel = 'Atraves1'
      FieldName = 'ATRAVES1'
      Size = 66
    end
    object cdsReciboDEPREC: TStringField
      Tag = 1
      DisplayLabel = 'Dpto Emitente'
      FieldName = 'DEPREC'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object cdsReciboATRAVES2: TStringField
      DisplayLabel = 'Atraves2'
      FieldName = 'ATRAVES2'
      Size = 66
    end
    object cdsReciboATRAVES3: TStringField
      DisplayLabel = 'Atraves3'
      FieldName = 'ATRAVES3'
      Size = 66
    end
    object cdsReciboOBSERVACAO1: TStringField
      DisplayLabel = 'Obs1'
      FieldName = 'OBSERVACAO1'
      Size = 66
    end
    object cdsReciboOBSERVACAO2: TStringField
      DisplayLabel = 'Obs2'
      FieldName = 'OBSERVACAO2'
      Size = 66
    end
    object cdsReciboOBSERVACAO3: TStringField
      DisplayLabel = 'Obs3'
      FieldName = 'OBSERVACAO3'
      Size = 66
    end
    object cdsReciboNOME_DEV: TStringField
      DisplayLabel = 'Nome Credor'
      FieldName = 'NOME_DEV'
      FixedChar = True
      Size = 50
    end
    object cdsReciboDATA_REC: TDateTimeField
      DisplayLabel = 'Data Recibo'
      FieldName = 'DATA_REC'
    end
    object cdsReciboLOCALDATA: TStringField
      DisplayLabel = 'Local/data'
      FieldName = 'LOCALDATA'
      FixedChar = True
      Size = 70
    end
    object cdsReciboRECANT: TStringField
      DisplayLabel = 'Recibo antecipado'
      FieldName = 'RECANT'
      FixedChar = True
      Size = 1
    end
    object cdsReciboSTATUS_REC: TStringField
      DisplayLabel = 'Status do Recibo'
      FieldName = 'STATUS_REC'
      FixedChar = True
      Size = 10
    end
    object cdsReciboCOD_BENEF: TIntegerField
      DisplayLabel = 'C'#243'd. Benefici'#225'rio'
      FieldName = 'COD_BENEF'
    end
    object cdsReciboNDOCANT: TIntegerField
      DisplayLabel = 'N'#186' utl. Doc. Baixa '
      FieldName = 'NDOCANT'
    end
    object cdsReciboDIA_CXL: TDateTimeField
      DisplayLabel = 'Dia Mov. Caixa'
      FieldName = 'DIA_CXL'
    end
    object cdsReciboN_MOV_CXL: TIntegerField
      DisplayLabel = 'N'#186' Mov. Caixa Auxiliar'
      FieldName = 'N_MOV_CXL'
    end
    object cdsReciboOBS_CXL_RQ: TStringField
      DisplayLabel = 'Obs. Caixa Aux.'
      FieldName = 'OBS_CXL_RQ'
      FixedChar = True
      Size = 50
    end
    object cdsReciboSTATUS_CXL_RQ: TStringField
      DisplayLabel = 'Status Recibo Caixa Aux.'
      FieldName = 'STATUS_CXL_RQ'
      FixedChar = True
      Size = 1
    end
    object cdsReciboVL_RQ_PG_CXL: TFloatField
      DisplayLabel = 'Valor Pago Caixa Aux.'
      FieldName = 'VL_RQ_PG_CXL'
    end
    object cdsReciboDATA_BAIXA: TDateTimeField
      DisplayLabel = 'Data da Baixa'
      FieldName = 'DATA_BAIXA'
    end
    object cdsReciboHISTORICO_REC: TStringField
      DisplayLabel = 'Hist'#243'rico Recibo'
      FieldName = 'HISTORICO_REC'
      FixedChar = True
      Size = 50
    end
    object cdsReciboCOD_PREP: TIntegerField
      DisplayLabel = 'C'#243'digo Preposto'
      FieldName = 'COD_PREP'
    end
    object cdsReciboSELEC: TStringField
      Tag = 1
      DisplayLabel = 'Sele'#231#227'o'
      FieldName = 'SELEC'
      FixedChar = True
      Size = 1
    end
    object cdsReciboOP_CXL: TIntegerField
      DisplayLabel = 'Op Cxl'
      FieldName = 'OP_CXL'
    end
    object cdsReciboCOD_US: TIntegerField
      DisplayLabel = 'Cod Usuario'
      FieldName = 'COD_US'
    end
    object cdsReciboATIVO: TIntegerField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
    object cdsReciboCOD_DEVEDOR: TIntegerField
      DisplayLabel = 'C'#243'digo Devedor'
      FieldName = 'COD_DEVEDOR'
    end
    object cdsReciboNOME_VENDEDOR: TStringField
      DisplayLabel = 'Usuario'
      FieldName = 'NOME_VENDEDOR'
      ProviderFlags = [pfInWhere]
      Size = 35
    end
    object cdsReciboCOD_DEPTO: TIntegerField
      DisplayLabel = 'Cod Depto'
      FieldName = 'COD_DEPTO'
    end
    object cdsReciboNOME_DEPTO: TStringField
      DisplayLabel = 'Depto'
      FieldName = 'NOME_DEPTO'
      Size = 30
    end
    object cdsReciboCOD_LOCACAO: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Locacao'
      FieldName = 'COD_LOCACAO'
    end
    object cdsReciboCOD_EMP_MULT: TIntegerField
      DisplayLabel = 'Cod Unificada'
      FieldName = 'COD_EMP_MULT'
    end
    object cdsReciboIDENTIFICACAO_EMP: TStringField
      DisplayLabel = 'Unificada'
      FieldName = 'IDENTIFICACAO_EMP'
      Size = 64
    end
    object cdsReciboDATA_VENC: TDateTimeField
      DisplayLabel = 'Data Vencimento'
      FieldName = 'DATA_VENC'
    end
    object cdsReciboVALOR_ORIG: TFloatField
      DisplayLabel = 'Valor Original'
      FieldName = 'VALOR_ORIG'
      DisplayFormat = '0.00'
      currency = True
    end
  end
  object dsRecibo: TDataSource
    DataSet = cdsRecibo
    Left = 40
    Top = 296
  end
  object qrRecibo: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransRecibo
    SQL.Strings = (
      
        'select  RECIBOS.*, EMPRESA.IDENTIFICACAO_EMP, COLABORADOR.NOME_V' +
        'ENDEDOR, DEPTO.NOME_DEPTO from RECIBOS'
      
        'LEFT JOIN COLABORADOR ON COLABORADOR.COD_VENDEDOR = RECIBOS.COD_' +
        'US AND COLABORADOR.COD_EMPRESA = RECIBOS.COD_EMPRESA'
      'LEFT JOIN EMPRESA ON EMPRESA.COD_EMPRESA = RECIBOS.COD_EMPRESA'
      'left join depto on depto.cod_depto = recibos.cod_depto')
    Left = 40
    Top = 152
  end
  object dspRecibo: TDataSetProvider
    DataSet = qrRecibo
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 40
    Top = 200
  end
  object cdsHistRecibo: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspHistRecibo'
    BeforeOpen = cdsReciboBeforeOpen
    Left = 120
    Top = 248
    object cdsHistReciboSEQCAD_REC: TIntegerField
      DisplayLabel = 'Sequ'#234'ncia'
      FieldName = 'SEQCAD_REC'
      Required = True
    end
    object cdsHistReciboCOD_EMPRESA: TIntegerField
      DisplayLabel = 'C'#243'digo da Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsHistReciboNRECIBO: TIntegerField
      DisplayLabel = 'N'#186' Recibo'
      FieldName = 'NRECIBO'
      Required = True
    end
    object cdsHistReciboNUM_REC_DEP: TStringField
      DisplayLabel = 'Num Rec Dep'
      FieldName = 'NUM_REC_DEP'
      Size = 11
    end
    object cdsHistReciboVALOR_BAIXA: TFloatField
      DisplayLabel = 'Valor da Baixa'
      FieldName = 'VALOR_BAIXA'
      currency = True
    end
    object cdsHistReciboVALOR_RECIBO: TFloatField
      DisplayLabel = 'Valor do Recibo'
      FieldName = 'VALOR_RECIBO'
      currency = True
    end
    object cdsHistReciboDATA_REC: TDateTimeField
      DisplayLabel = 'Data Recibo'
      FieldName = 'DATA_REC'
    end
    object cdsHistReciboRECANT: TStringField
      FieldName = 'RECANT'
      FixedChar = True
      Size = 1
    end
    object cdsHistReciboNDOCANT: TIntegerField
      DisplayLabel = 'Num. Documento'
      FieldName = 'NDOCANT'
    end
    object cdsHistReciboDATA_BAIXA: TDateTimeField
      DisplayLabel = 'Data Baixa'
      FieldName = 'DATA_BAIXA'
    end
    object cdsHistReciboHISTORICO_REC: TStringField
      DisplayLabel = 'Hist'#243'rico'
      FieldName = 'HISTORICO_REC'
      FixedChar = True
      Size = 50
    end
    object cdsHistReciboATIVO: TIntegerField
      FieldName = 'ATIVO'
    end
    object cdsHistReciboCOD_US: TIntegerField
      FieldName = 'COD_US'
    end
    object cdsHistReciboTP_DOC_BAIXA: TStringField
      FieldName = 'TP_DOC_BAIXA'
      FixedChar = True
      Size = 3
    end
    object cdsHistReciboTP_BAIXA: TStringField
      DisplayLabel = 'Tipo de Baixa(T/P)'
      FieldName = 'TP_BAIXA'
      FixedChar = True
      Size = 1
    end
  end
  object dsHistRecibo: TDataSource
    DataSet = cdsHistRecibo
    Left = 120
    Top = 296
  end
  object qrHistRecibo: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransRecibo
    SQL.Strings = (
      'SELECT HIST_REC.*, RECIBOS.NUM_REC_DEP FROM HIST_REC'
      
        'LEFT JOIN RECIBOS ON RECIBOS.NRECIBO = HIST_REC.NRECIBO AND RECI' +
        'BOS.COD_EMPRESA = HIST_REC.COD_EMPRESA')
    Left = 120
    Top = 152
  end
  object dspHistRecibo: TDataSetProvider
    DataSet = qrHistRecibo
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 120
    Top = 200
  end
  object IBTransRecibo: TIBTransaction
    Active = True
    DefaultDatabase = dtmAtivo.bancoHw
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 40
    Top = 24
  end
  object qrBuscas: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransRecibo
    Left = 40
    Top = 80
  end
  object qrClientes: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransRecibo
    SQL.Strings = (
      'select * from CLIENTES')
    Left = 224
    Top = 160
  end
  object dsClientes: TDataSource
    DataSet = qrClientes
    Left = 224
    Top = 208
  end
  object qrDev: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransRecibo
    SQL.Strings = (
      'select c.cod_cliente,c.nome_cliente,'
      'case'
      '    when char_length(c.cpfcgc) = 11 then '#39'CPF: '#39'||c.cpfcgc'
      '    when char_length(c.cpfcgc) = 14 then '#39'CNPJ: '#39'||c.cpfcgc'
      '    else '#39'CPF/CNPJ: '#39'||c.cpfcgc'
      'end cpfcgc,'
      #39'Fone: '#39'||c.fone_cliente fone_cliente,'
      'case'
      
        '    when (not c.num_end_cliente is null) and (not c.complemento ' +
        'is null) then c.endereco||'#39', '#39'||c.num_end_cliente||'#39' '#39'||c.comple' +
        'mento'
      
        '    when not c.num_end_cliente is null then c.endereco||'#39', '#39'||c.' +
        'num_end_cliente'
      '    when not c.endereco is null then c.endereco'
      '    else '#39#39
      'end endereco,'
      'case'
      
        '    when ( not cid.nome_cidade is null) then c.cep||'#39' - '#39'||trim(' +
        'cid.nome_cidade)||'#39' - '#39'||es.sigla_uf'
      '    else c.cep||'#39' - '#39'||es.sigla_uf'
      'end cepcidadeuf'
      'from clientes c'
      'left join cidades cid on cid.cod_cidade =  c.cod_cidade'
      'inner join estados es on es.codigo_uf = c.codigo_uf')
    Left = 320
    Top = 160
    object qrDevCOD_CLIENTE: TIntegerField
      FieldName = 'COD_CLIENTE'
      Origin = '"CLIENTES"."COD_CLIENTE"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrDevNOME_CLIENTE: TIBStringField
      FieldName = 'NOME_CLIENTE'
      Origin = '"CLIENTES"."NOME_CLIENTE"'
      Required = True
      Size = 35
    end
    object qrDevCPFCGC: TIBStringField
      FieldName = 'CPFCGC'
      ProviderFlags = []
      Size = 28
    end
    object qrDevFONE_CLIENTE: TIBStringField
      FieldName = 'FONE_CLIENTE'
      ProviderFlags = []
      Size = 19
    end
    object qrDevENDERECO: TIBStringField
      FieldName = 'ENDERECO'
      ProviderFlags = []
      Size = 124
    end
    object qrDevCEPCIDADEUF: TIBStringField
      FieldName = 'CEPCIDADEUF'
      ProviderFlags = []
      Size = 47
    end
  end
  object dsDev: TDataSource
    DataSet = qrDev
    Left = 320
    Top = 208
  end
  object SpIncCodigo: TIBStoredProc
    Database = dtmAtivo.bancoHw
    Transaction = IBTransRecibo
    StoredProcName = 'INCREMENTA_CODIGO'
    Left = 120
    Top = 24
  end
  object qrUF: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransRecibo
    SQL.Strings = (
      'select * from ESTADOS')
    Left = 456
    Top = 160
  end
  object dsUF: TDataSource
    DataSet = qrUF
    Left = 456
    Top = 208
  end
  object qrClRec: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransRecibo
    SQL.Strings = (
      'select c.cod_cliente,c.nome_cliente,'
      'case'
      '    when char_length(c.cpfcgc) = 11 then '#39'CPF: '#39'||c.cpfcgc'
      '    when char_length(c.cpfcgc) = 14 then '#39'CNPJ: '#39'||c.cpfcgc'
      '    else '#39'CPF/CNPJ: '#39'||c.cpfcgc'
      'end cpfcgc,'
      #39'Fone: '#39'||c.fone_cliente fone_cliente,'
      'case'
      
        '    when (not c.num_end_cliente is null) and (not c.complemento ' +
        'is null) then c.endereco||'#39', '#39'||c.num_end_cliente||'#39' '#39'||c.comple' +
        'mento||'#39' - '#39'||c.bairro'
      
        '    when not c.num_end_cliente is null then c.endereco||'#39', '#39'||c.' +
        'num_end_cliente||'#39' - '#39'||c.bairro'
      '    when not c.endereco is null then c.endereco||'#39' - '#39'||c.bairro'
      '    else '#39#39'||'#39' - '#39'||c.bairro'
      'end endereco,'
      'case'
      
        '    when ( not c.cidade is null) then c.cep||'#39' - '#39'||trim(c.cidad' +
        'e)||'#39' - '#39'||es.sigla_uf'
      '    else c.cep||'#39' - '#39'||es.sigla_uf'
      'end cepcidadeuf, c.cidade'
      'from clientes c'
      'inner join estados es on es.codigo_uf = c.codigo_uf'
      
        'where c.ativo = 1 and c.cod_empresa = :cod_empresa and c.cod_cli' +
        'ente = :cod_cliente')
    Left = 512
    Top = 160
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cod_empresa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cod_cliente'
        ParamType = ptUnknown
      end>
    object qrClRecCOD_CLIENTE: TIntegerField
      FieldName = 'COD_CLIENTE'
      Origin = '"CLIENTES"."COD_CLIENTE"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrClRecNOME_CLIENTE: TIBStringField
      FieldName = 'NOME_CLIENTE'
      Origin = '"CLIENTES"."NOME_CLIENTE"'
      Required = True
      Size = 35
    end
    object qrClRecCPFCGC: TIBStringField
      FieldName = 'CPFCGC'
      ProviderFlags = []
      Size = 28
    end
    object qrClRecFONE_CLIENTE: TIBStringField
      FieldName = 'FONE_CLIENTE'
      ProviderFlags = []
      Size = 19
    end
    object qrClRecENDERECO: TIBStringField
      FieldName = 'ENDERECO'
      ProviderFlags = []
      Size = 162
    end
    object qrClRecCEPCIDADEUF: TIBStringField
      FieldName = 'CEPCIDADEUF'
      ProviderFlags = []
      Size = 47
    end
    object qrClRecCIDADE: TIBStringField
      FieldName = 'CIDADE'
      Origin = '"CLIENTES"."CIDADE"'
      Required = True
      Size = 30
    end
  end
  object dsClRec: TDataSource
    AutoEdit = False
    DataSet = cdsClrec
    Left = 512
    Top = 296
  end
  object cdsClrec: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftUnknown
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        ParamType = ptUnknown
      end>
    ProviderName = 'dspClRec'
    BeforeOpen = cdsReciboBeforeOpen
    Left = 512
    Top = 256
    object cdsClrecCOD_CLIENTE: TIntegerField
      FieldName = 'COD_CLIENTE'
      Required = True
    end
    object cdsClrecNOME_CLIENTE: TStringField
      FieldName = 'NOME_CLIENTE'
      Required = True
      Size = 35
    end
    object cdsClrecCPFCGC: TStringField
      FieldName = 'CPFCGC'
      Size = 28
    end
    object cdsClrecFONE_CLIENTE: TStringField
      FieldName = 'FONE_CLIENTE'
      Size = 19
    end
    object cdsClrecENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 162
    end
    object cdsClrecCEPCIDADEUF: TStringField
      FieldName = 'CEPCIDADEUF'
      Size = 47
    end
    object cdsClrecCIDADE: TStringField
      FieldName = 'CIDADE'
      Required = True
      Size = 30
    end
  end
  object dspClRec: TDataSetProvider
    DataSet = qrClRec
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 512
    Top = 208
  end
  object qrPrep: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransRecibo
    SQL.Strings = (
      'select c.cod_cliente,c.nome_cliente from clientes c')
    Left = 392
    Top = 160
    object qrPrepCOD_CLIENTE: TIntegerField
      FieldName = 'COD_CLIENTE'
      Origin = '"CLIENTES"."COD_CLIENTE"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrPrepNOME_CLIENTE: TIBStringField
      FieldName = 'NOME_CLIENTE'
      Origin = '"CLIENTES"."NOME_CLIENTE"'
      Required = True
      Size = 35
    end
  end
  object dsPrep: TDataSource
    AutoEdit = False
    DataSet = qrPrep
    Left = 392
    Top = 208
  end
  object qrColaborador: TIBQuery
    Tag = 2
    Database = dtmAtivo.bancoHw
    Transaction = IBTransRecibo
    SQL.Strings = (
      'select cod_vendedor, nome_vendedor from colaborador')
    Left = 581
    Top = 157
  end
  object dspColaborador: TDataSetProvider
    DataSet = qrColaborador
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 581
    Top = 208
  end
  object cdsColaborador: TClientDataSet
    Aggregates = <>
    AutoCalcFields = False
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspColaborador'
    BeforeOpen = cdsReciboBeforeOpen
    Left = 581
    Top = 257
    object cdsColaboradorCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
      Required = True
    end
    object cdsColaboradorNOME_VENDEDOR: TStringField
      FieldName = 'NOME_VENDEDOR'
      Size = 35
    end
  end
  object dsColaborador: TDataSource
    DataSet = cdsColaborador
    Left = 581
    Top = 311
  end
  object qrDepto: TIBQuery
    Tag = 2
    Database = dtmAtivo.bancoHw
    Transaction = IBTransRecibo
    SQL.Strings = (
      'SELECT COD_DEPTO, NOME_DEPTO, INICIAIS_DEPTO FROM DEPTO')
    Left = 669
    Top = 157
  end
  object dspDepto: TDataSetProvider
    DataSet = qrDepto
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 669
    Top = 208
  end
  object cdsDepto: TClientDataSet
    Aggregates = <>
    AutoCalcFields = False
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspDepto'
    BeforeOpen = cdsReciboBeforeOpen
    Left = 669
    Top = 257
    object cdsDeptoCOD_DEPTO: TIntegerField
      DisplayLabel = 'Cod Depto'
      FieldName = 'COD_DEPTO'
      Required = True
    end
    object cdsDeptoNOME_DEPTO: TStringField
      DisplayLabel = 'Depto'
      FieldName = 'NOME_DEPTO'
      Size = 30
    end
    object cdsDeptoINICIAIS_DEPTO: TStringField
      DisplayLabel = 'Sigla'
      FieldName = 'INICIAIS_DEPTO'
      Size = 3
    end
  end
  object dsDepto: TDataSource
    DataSet = cdsDepto
    Left = 669
    Top = 311
  end
  object qrEmpresasUnificadas: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = dtmAtivo.IbTransCol
    SQL.Strings = (
      
        'select emp.cod_empresa, (emp.identificacao_emp ||'#39' - '#39'|| emp.cnp' +
        'j_emp) identificacao_emp from empresa emp'
      'where emp.cod_empresa in (1)')
    Left = 773
    Top = 152
  end
  object dspEmpresasUnificadas: TDataSetProvider
    DataSet = qrEmpresasUnificadas
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 773
    Top = 208
  end
  object cdsEmpresasUnificadas: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspEmpresasUnificadas'
    BeforeOpen = cdsReciboBeforeOpen
    Left = 773
    Top = 256
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
    Left = 773
    Top = 312
  end
  object DataSetProvider1: TDataSetProvider
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 317
    Top = 40
  end
end
