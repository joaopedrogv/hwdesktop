object DtmBalcao: TDtmBalcao
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 527
  Width = 698
  object IbTransBalcao: TIBTransaction
    DefaultDatabase = dtmAtivo.bancoHw
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 16
    Top = 8
  end
  object QrPendBalcao: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IbTransBalcao
    SQL.Strings = (
      
        'select rq.nped,rq.tipo,cl.nome_cliente,rq.valor_total,rq.data_pe' +
        'd,rq.data_fech,'
      
        'rq.obs_cxl_rq,rq.vl_pago_cxl,rq.status_cxl_rq,rq.dia_cxl,rq.desc' +
        'onto,rq.desc_p_prod,rq.desc_p_serv,'
      
        'cl.cod_cliente,rq.cod_cond_pag,rq.cod_vendedor,rq.op_cxl,rq.vl_e' +
        'ntrada,'
      
        'rq.codigo_ctrl,rq.cod_empresa,rq.NPREVENDA,rq.NCUPOM,rq.NSERIEEC' +
        'F,rq.OPERADOR,rq.NUM_NF,rq.DATA_NF,rq.TIPO_OS,rq.NUM_NFEEXT, rq.' +
        'cod_carga, rq.id_commerce, rq.local_venda'
      'from pedvenda rq,CLIENTES CL'
      'Where rq.data_fech is not null and'
      
        '(rq.dia_cxl is null or rq.dia_cxl = :vdatafec) and rq.cod_client' +
        'e = cl.cod_cliente '
      
        'and rq.cod_empresa = cl.cod_empresa and (rq.op_cxl = :vop or rq.' +
        'op_cxl is null or rq.op_cxl = 0)'
      
        'and rq.cod_empresa = :cod_empresa and rq.ativo = 1 order by rq.d' +
        'ata_fech,rq.nped')
    Left = 24
    Top = 72
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'vdatafec'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'vop'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'cod_empresa'
        ParamType = ptUnknown
      end>
  end
  object DspPendBalcao: TDataSetProvider
    DataSet = QrPendBalcao
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 24
    Top = 120
  end
  object CdsPendBalcao1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspPendBalcao'
    BeforeOpen = CdsPendBalcao1BeforeOpen
    Left = 424
    Top = 312
    object CdsPendBalcao1NREQ: TIntegerField
      DisplayLabel = 'N. Req.'
      FieldName = 'NREQ'
      Origin = '"REQVENDA"."NREQ"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CdsPendBalcao1NPREVENDA: TIntegerField
      DisplayLabel = 'DAV'
      FieldName = 'NPREVENDA'
      Origin = '"REQVENDA"."NPREVENDA"'
      ProviderFlags = []
    end
    object CdsPendBalcao1NOME_CLIENTE: TStringField
      DisplayLabel = 'Nome do Cliente'
      FieldName = 'NOME_CLIENTE'
      Origin = '"CLIENTES"."NOME_CLIENTE"'
      ProviderFlags = []
      Required = True
      Size = 35
    end
    object CdsPendBalcao1VALOR_TOTAL: TFloatField
      DisplayLabel = 'Valor Total'
      FieldName = 'VALOR_TOTAL'
      Origin = '"REQVENDA"."VALOR_TOTAL"'
      ProviderFlags = []
    end
    object CdsPendBalcao1DATA_REQ: TDateTimeField
      DisplayLabel = 'Data Requisi'#231#227'o'
      FieldName = 'DATA_REQ'
      Origin = '"REQVENDA"."DATA_REQ"'
      ProviderFlags = []
    end
    object CdsPendBalcao1DATA_C: TDateTimeField
      DisplayLabel = 'Data Fechamento'
      FieldName = 'DATA_C'
      Origin = '"REQVENDA"."DATA_C"'
      ProviderFlags = []
    end
    object CdsPendBalcao1OBS_CXL_RQ: TStringField
      DisplayLabel = 'Obs. Caixa Auxiliar'
      FieldName = 'OBS_CXL_RQ'
      Origin = '"REQVENDA"."OBS_CXL_RQ"'
      ProviderFlags = []
      FixedChar = True
      Size = 50
    end
    object CdsPendBalcao1VL_RQ_PG_CXL: TFloatField
      DisplayLabel = 'Valor Pago'
      FieldName = 'VL_RQ_PG_CXL'
      Origin = '"REQVENDA"."VL_RQ_PG_CXL"'
      ProviderFlags = [pfInUpdate]
    end
    object CdsPendBalcao1STATUS_CXL_RQ: TStringField
      DisplayLabel = 'Status CXL'
      FieldName = 'STATUS_CXL_RQ'
      Origin = '"REQVENDA"."STATUS_CXL_RQ"'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object CdsPendBalcao1DIA_CXL: TDateTimeField
      DisplayLabel = 'Dia CXL'
      FieldName = 'DIA_CXL'
      Origin = '"REQVENDA"."DIA_CXL"'
      ProviderFlags = [pfInUpdate]
    end
    object CdsPendBalcao1V_DESC: TFloatField
      DisplayLabel = 'Valor Desconto'
      FieldName = 'V_DESC'
      Origin = '"REQVENDA"."V_DESC"'
      ProviderFlags = []
    end
    object CdsPendBalcao1P_DESC: TFloatField
      DisplayLabel = 'Perc. Desconto'
      FieldName = 'P_DESC'
      Origin = '"REQVENDA"."P_DESC"'
      ProviderFlags = []
    end
    object CdsPendBalcao1COD_CLIENTE: TIntegerField
      DisplayLabel = 'C'#243'd. Cliente'
      FieldName = 'COD_CLIENTE'
      Origin = '"CLIENTES"."COD_CLIENTE"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CdsPendBalcao1COD_COND_PAG: TIntegerField
      DisplayLabel = 'C'#243'd. Cond. Pagamento'
      FieldName = 'COD_COND_PAG'
      Origin = '"REQVENDA"."COD_COND_PAG"'
      ProviderFlags = []
      Required = True
    end
    object CdsPendBalcao1COD_VENDEDOR: TIntegerField
      DisplayLabel = 'C'#243'd. Vendedor'
      FieldName = 'COD_VENDEDOR'
      Origin = '"REQVENDA"."COD_VENDEDOR"'
      ProviderFlags = []
      Required = True
    end
    object CdsPendBalcao1OP_CXL: TIntegerField
      DisplayLabel = 'Operador CXL'
      FieldName = 'OP_CXL'
      Origin = '"REQVENDA"."OP_CXL"'
      ProviderFlags = [pfInUpdate]
    end
    object CdsPendBalcao1VL_ENTRADA: TFloatField
      DisplayLabel = 'Valor Entrada'
      FieldName = 'VL_ENTRADA'
      Origin = '"REQVENDA"."VL_ENTRADA"'
      ProviderFlags = []
    end
    object CdsPendBalcao1CODIGO_CTRL: TIntegerField
      DisplayLabel = 'C'#243'digo Controle'
      FieldName = 'CODIGO_CTRL'
      Origin = '"REQVENDA"."CODIGO_CTRL"'
      ProviderFlags = []
    end
    object CdsPendBalcao1COD_EMPRESA: TIntegerField
      DisplayLabel = 'C'#243'digo Empresa'
      FieldName = 'COD_EMPRESA'
      Origin = '"REQVENDA"."COD_EMPRESA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CdsPendBalcao1NCUPOM: TIntegerField
      DisplayLabel = 'N. Cupom'
      FieldName = 'NCUPOM'
      Origin = '"REQVENDA"."NCUPOM"'
      ProviderFlags = []
    end
    object CdsPendBalcao1NSERIEECF: TStringField
      DisplayLabel = 'N. ECF'
      FieldName = 'NSERIEECF'
      Origin = '"REQVENDA"."NSERIEECF"'
      ProviderFlags = []
      FixedChar = True
    end
    object CdsPendBalcao1OPERADOR: TIntegerField
      DisplayLabel = 'Operador'
      FieldName = 'OPERADOR'
      Origin = '"REQVENDA"."OPERADOR"'
      ProviderFlags = []
    end
  end
  object cdsBuscas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspBuscas'
    Left = 240
    Top = 6
  end
  object dspBuscas: TDataSetProvider
    DataSet = qrBuscas
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 160
    Top = 6
  end
  object qrBuscas: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IbTransBalcao
    Left = 88
    Top = 6
  end
  object QrFecDia: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IbTransBalcao
    SQL.Strings = (
      
        'select * from fecd_cxl where op_cxl = :vop and codigo_emp = :COD' +
        '_EMPRESA'
      'order by dia_f_cxl ')
    Left = 324
    Top = 72
    ParamData = <
      item
        DataType = ftInteger
        Name = 'vop'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'COD_EMPRESA'
        ParamType = ptUnknown
      end>
  end
  object DtPendReq: TDataSource
    AutoEdit = False
    DataSet = CdsPendBalcao
    Left = 24
    Top = 224
  end
  object QrPendOS: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IbTransBalcao
    SQL.Strings = (
      
        'select rq.nped,rq.tipo,cl.nome_cliente,rq.valor_total,rq.data_pe' +
        'd,rq.data_fech,'
      
        'rq.obs_cxl_rq,rq.vl_pago_cxl,rq.status_cxl_rq,rq.dia_cxl,rq.desc' +
        'onto,rq.desc_p_prod,rq.desc_p_serv,'
      
        'cl.cod_cliente,rq.cod_cond_pag,rq.cod_vendedor,rq.op_cxl,rq.vl_e' +
        'ntrada,'
      
        'rq.codigo_ctrl,rq.cod_empresa,rq.NPREVENDA,rq.NCUPOM,rq.NSERIEEC' +
        'F,rq.OPERADOR'
      'from pedvenda rq,CLIENTES CL'
      'Where rq.data_fech is not null and'
      
        '(rq.dia_cxl is null or rq.dia_cxl = :vdatafec) and rq.cod_client' +
        'e = cl.cod_cliente '
      
        'and rq.cod_empresa = cl.cod_empresa and (rq.op_cxl = :vop or rq.' +
        'op_cxl is null or rq.op_cxl = 0)'
      
        'and rq.cod_empresa = :cod_empresa and rq.ativo = 1 order by rq.d' +
        'ata_fech,rq.nped')
    Left = 124
    Top = 72
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'vdatafec'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'vop'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'cod_empresa'
        ParamType = ptUnknown
      end>
  end
  object DspPendOS: TDataSetProvider
    DataSet = QrPendOS
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 124
    Top = 120
  end
  object CdsPendOS1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspPendBalcao'
    BeforeOpen = CdsPendBalcao1BeforeOpen
    Left = 524
    Top = 312
    object CdsPendOS1N_OS: TIntegerField
      DisplayLabel = 'N. OS'
      FieldName = 'N_OS'
      Required = True
    end
    object CdsPendOS1NPREVENDA: TIntegerField
      DisplayLabel = 'DAV'
      FieldName = 'NPREVENDA'
    end
    object CdsPendOS1NOME_CLIENTE: TStringField
      DisplayLabel = 'Nome Cliente'
      FieldName = 'NOME_CLIENTE'
      Required = True
      Size = 35
    end
    object CdsPendOS1VALOR_OS: TFloatField
      DisplayLabel = 'Valor O.S.'
      FieldName = 'VALOR_OS'
    end
    object CdsPendOS1DATA_OS: TDateTimeField
      DisplayLabel = 'Data da O.S.'
      FieldName = 'DATA_OS'
    end
    object CdsPendOS1DATA_FEC_OS: TDateTimeField
      DisplayLabel = 'Data Fechamento O.S.'
      FieldName = 'DATA_FEC_OS'
    end
    object CdsPendOS1OBS_CXL_OS: TStringField
      DisplayLabel = 'Obs. para o Caixa'
      FieldName = 'OBS_CXL_OS'
      FixedChar = True
      Size = 50
    end
    object CdsPendOS1VL_PAGO_CXL: TFloatField
      DisplayLabel = 'Valor Pago'
      FieldName = 'VL_PAGO_CXL'
    end
    object CdsPendOS1STATUS_CXL_OS: TStringField
      DisplayLabel = 'Status Rec. O.S.'
      FieldName = 'STATUS_CXL_OS'
      FixedChar = True
      Size = 1
    end
    object CdsPendOS1DIA_CXL: TDateTimeField
      DisplayLabel = 'Dia Rec. Cxl'
      FieldName = 'DIA_CXL'
    end
    object CdsPendOS1COD_CLIENTE: TIntegerField
      DisplayLabel = 'C'#243'digo Cliente'
      FieldName = 'COD_CLIENTE'
      Required = True
    end
    object CdsPendOS1DESC_VL_OS: TFloatField
      DisplayLabel = 'Desconto Valor '
      FieldName = 'DESC_VL_OS'
    end
    object CdsPendOS1DESC_P_PROD: TFloatField
      DisplayLabel = 'Desconto Perc. Produtos'
      FieldName = 'DESC_P_PROD'
    end
    object CdsPendOS1DESC_P_SERV: TFloatField
      DisplayLabel = 'Desconto Perc. Servi'#231'o'
      FieldName = 'DESC_P_SERV'
    end
    object CdsPendOS1TOT_PROD_OS: TFloatField
      DisplayLabel = 'Total Produtos'
      FieldName = 'TOT_PROD_OS'
    end
    object CdsPendOS1TOT_SERV_OS: TFloatField
      DisplayLabel = 'Total Servi'#231'os'
      FieldName = 'TOT_SERV_OS'
    end
    object CdsPendOS1COD_COND_PAG: TIntegerField
      DisplayLabel = 'C'#243'digo Cond. Pagamento'
      FieldName = 'COD_COND_PAG'
    end
    object CdsPendOS1OBS_OS: TMemoField
      DisplayLabel = 'Obs. O.S.'
      FieldName = 'OBS_OS'
      BlobType = ftMemo
      Size = 8
    end
    object CdsPendOS1COD_VENDEDOR: TIntegerField
      DisplayLabel = 'C'#243'd. Vendedor'
      FieldName = 'COD_VENDEDOR'
      Required = True
    end
    object CdsPendOS1OP_CXL: TIntegerField
      DisplayLabel = 'Op. Caixa'
      FieldName = 'OP_CXL'
    end
    object CdsPendOS1COD_EMPRESA: TIntegerField
      DisplayLabel = 'C'#243'digo da Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object CdsPendOS1NCUPOM: TIntegerField
      DisplayLabel = 'N. CUPOM'
      FieldName = 'NCUPOM'
    end
    object CdsPendOS1NSERIEECF: TStringField
      DisplayLabel = 'N. SERIE ECF'
      FieldName = 'NSERIEECF'
      FixedChar = True
    end
    object CdsPendOS1OPERADOR: TIntegerField
      FieldName = 'OPERADOR'
    end
  end
  object DtPendOS: TDataSource
    DataSet = CdsPendOS
    Left = 124
    Top = 224
  end
  object QrPendVeic: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IbTransBalcao
    SQL.Strings = (
      
        'select * from Com_fat  Where (dia_cxl is null or dia_cxl = :vdat' +
        'afec)  and'
      'status_v is null and'
      
        '(op_cxl = :vop or op_cxl is null or op_cxl = 0) and cod_empresa ' +
        '= :cod_empresa'
      'and ativo = 1 order by data_ven,n_comando')
    Left = 224
    Top = 72
    ParamData = <
      item
        DataType = ftDate
        Name = 'vdatafec'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'vop'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'cod_empresa'
        ParamType = ptUnknown
      end>
  end
  object DspPendVeic: TDataSetProvider
    DataSet = QrPendVeic
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 224
    Top = 120
  end
  object CdsPendVeic: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspPendVeic'
    BeforeOpen = CdsPendBalcao1BeforeOpen
    Left = 224
    Top = 176
    object CdsPendVeicN_COMANDO: TIntegerField
      Tag = 2
      DisplayLabel = 'N. Comando'
      FieldName = 'N_COMANDO'
      Required = True
    end
    object CdsPendVeicNUM_NOTA_V: TIntegerField
      DisplayLabel = 'N. Nota Fiscal'
      FieldName = 'NUM_NOTA_V'
    end
    object CdsPendVeicCHASSIV: TStringField
      DisplayLabel = 'Chassi'
      FieldName = 'CHASSIV'
      FixedChar = True
      Size = 17
    end
    object CdsPendVeicNOME_RECEB: TStringField
      DisplayLabel = 'Nome Respons'#225'vel'
      FieldName = 'NOME_RECEB'
      FixedChar = True
      Size = 30
    end
    object CdsPendVeicVALOR_A_REC: TFloatField
      DisplayLabel = 'Valor a Receber'
      FieldName = 'VALOR_A_REC'
      DisplayFormat = '#,##0.00'
    end
    object CdsPendVeicSTATUS_CXL_RQ: TStringField
      DisplayLabel = 'Status CXL'
      FieldName = 'STATUS_CXL_RQ'
      FixedChar = True
      Size = 1
    end
    object CdsPendVeicVL_RQ_PG_CXL: TFloatField
      DisplayLabel = 'Valor Pago'
      FieldName = 'VL_RQ_PG_CXL'
      DisplayFormat = '#,##0.00'
    end
    object CdsPendVeicDIA_CXL: TDateTimeField
      DisplayLabel = 'Dia CXL'
      FieldName = 'DIA_CXL'
    end
    object CdsPendVeicDATA_FECH: TDateTimeField
      DisplayLabel = 'Data Fechamento'
      FieldName = 'DATA_FECH'
    end
    object CdsPendVeicDESCONTO_V: TFloatField
      DisplayLabel = 'Valor Desconto'
      FieldName = 'DESCONTO_V'
    end
    object CdsPendVeicDATA_VEN: TDateTimeField
      DisplayLabel = 'Data Comando'
      FieldName = 'DATA_VEN'
    end
    object CdsPendVeicOP_CXL: TIntegerField
      DisplayLabel = 'Operador CXL'
      FieldName = 'OP_CXL'
    end
    object CdsPendVeicCLIENTES_V: TIntegerField
      DisplayLabel = 'C'#243'digo Cliente'
      FieldName = 'CLIENTES_V'
    end
    object CdsPendVeicCOVEND_V: TIntegerField
      DisplayLabel = 'C'#243'd. Vendedor'
      FieldName = 'COVEND_V'
    end
    object CdsPendVeicFONE_RECEB: TStringField
      DisplayLabel = 'Fone Respons'#225'vel'
      FieldName = 'FONE_RECEB'
      FixedChar = True
      Size = 13
    end
    object CdsPendVeicNATOP_V: TFloatField
      DisplayLabel = 'Natureza Opera'#231#227'o'
      FieldName = 'NATOP_V'
    end
    object CdsPendVeicCONDPAG_V: TIntegerField
      DisplayLabel = 'Cond. Pagamento'
      FieldName = 'CONDPAG_V'
    end
    object CdsPendVeicMODELO_NF: TStringField
      DisplayLabel = 'Modelo NF'
      FieldName = 'MODELO_NF'
      Size = 3
    end
    object CdsPendVeicSITUACAO_NFE: TStringField
      DisplayLabel = 'Situacao NF'
      FieldName = 'SITUACAO_NFE'
      Size = 40
    end
    object CdsPendVeicTIPO_VENDA_V: TStringField
      DisplayLabel = 'Tipo Venda'
      FieldName = 'TIPO_VENDA_V'
      FixedChar = True
      Size = 1
    end
    object CdsPendVeicCONFUS: TStringField
      Tag = 1
      DisplayLabel = 'Confus'
      FieldName = 'CONFUS'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object CdsPendVeicREC_ANT: TIntegerField
      Tag = 1
      DisplayLabel = 'Rec Ant'
      FieldName = 'REC_ANT'
      Visible = False
    end
    object CdsPendVeicSUB_SERIE: TIntegerField
      Tag = 1
      DisplayLabel = 'Sub Serie'
      FieldName = 'SUB_SERIE'
      Visible = False
    end
    object CdsPendVeicSERIE: TStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 5
    end
    object CdsPendVeicPROTOCOLO: TStringField
      DisplayLabel = 'Protocolo NFe'
      FieldName = 'PROTOCOLO'
      Size = 40
    end
    object CdsPendVeicCODIGOERRO: TStringField
      DisplayLabel = 'C'#243'digo NFe'
      FieldName = 'CODIGOERRO'
      Size = 10
    end
    object CdsPendVeicDESCRICAOERRO: TStringField
      DisplayLabel = 'Descri'#231#227'o NFe'
      FieldName = 'DESCRICAOERRO'
      Size = 50
    end
    object CdsPendVeicCHAVE_NFE: TStringField
      DisplayLabel = 'Chave NFe'
      FieldName = 'CHAVE_NFE'
      Size = 60
    end
    object CdsPendVeicTIPONFE: TStringField
      DisplayLabel = 'Tipo NFE'
      FieldName = 'TIPONFE'
      Size = 40
    end
    object CdsPendVeicNATUREZA: TStringField
      Tag = 1
      DisplayLabel = 'Natureza'
      FieldName = 'NATUREZA'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object CdsPendVeicTIPV_VEICULO: TStringField
      Tag = 1
      DisplayLabel = 'Tipo Op'
      FieldName = 'TIPV_VEICULO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object CdsPendVeicALTERA_ESTOQUE_CFOP: TStringField
      Tag = 1
      DisplayLabel = 'Altera Estoque CFOP'
      FieldName = 'ALTERA_ESTOQUE_CFOP'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object CdsPendVeicMODELO: TStringField
      Tag = 1
      DisplayLabel = 'Modelo'
      FieldName = 'MODELO'
      Visible = False
      Size = 10
    end
    object CdsPendVeicCOD_ESTMOTO: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Estmoto'
      FieldName = 'COD_ESTMOTO'
      Visible = False
    end
    object CdsPendVeicCOD_CONCESS: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Concess'
      FieldName = 'COD_CONCESS'
      Visible = False
    end
    object CdsPendVeicCOD_INTERMED: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Intermed'
      FieldName = 'COD_INTERMED'
      Visible = False
    end
    object CdsPendVeicCOD_CLI_VENDE: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Cli Vend'
      FieldName = 'COD_CLI_VENDE'
      Visible = False
    end
    object CdsPendVeicCOD_GERENTE: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Gerente'
      FieldName = 'COD_GERENTE'
      Visible = False
    end
    object CdsPendVeicEMISSAO_PROPRIA: TStringField
      DisplayLabel = 'Emissao Propria'
      FieldName = 'EMISSAO_PROPRIA'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object CdsPendVeicHORA_FECH: TStringField
      Tag = 1
      DisplayLabel = 'Hora Fech'
      FieldName = 'HORA_FECH'
      Visible = False
      FixedChar = True
      Size = 8
    end
    object CdsPendVeicDIFCX: TStringField
      Tag = 1
      FieldKind = fkInternalCalc
      FieldName = 'DIFCX'
      Size = 1
    end
  end
  object DtPendVeic: TDataSource
    AutoEdit = False
    DataSet = CdsPendVeic
    Left = 224
    Top = 224
  end
  object IbDbCCia: TIBDatabase
    DatabaseName = '127.0.0.1:c:\basesauto\ccia\Ccia.gdb'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    Left = 432
    Top = 8
  end
  object QrPendCCia: TIBQuery
    Database = IbDbCCia
    Transaction = IbTransCCia
    SQL.Strings = (
      
        'select * from VENDAVEICULO Where (dia_cxl is null or dia_cxl = :' +
        'vdatafec) and  (op_cxl = :vop or op_cxl is null or op_cxl = 0)')
    Left = 224
    Top = 336
    ParamData = <
      item
        DataType = ftDate
        Name = 'vdatafec'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'vop'
        ParamType = ptUnknown
      end>
  end
  object IbTransCCia: TIBTransaction
    DefaultDatabase = IbDbCCia
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 504
    Top = 8
  end
  object QrPendRec: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IbTransBalcao
    SQL.Strings = (
      
        'select * from recibos  Where (dia_cxl is null or dia_cxl = :vdat' +
        'afec)  and'
      
        '(op_cxl = :vop or op_cxl is null or op_cxl = 0)  and nrecibo < 1' +
        '00000'
      'AND COD_EMPRESA = :COD_EMPRESA AND ATIVO = 1 '
      'order by nrecibo')
    Left = 424
    Top = 72
    ParamData = <
      item
        DataType = ftDate
        Name = 'vdatafec'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'vop'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'COD_EMPRESA'
        ParamType = ptUnknown
      end>
  end
  object DspPendRec: TDataSetProvider
    DataSet = QrPendRec
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 424
    Top = 120
  end
  object CdsPendRec: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspPendRec'
    BeforeOpen = CdsPendBalcao1BeforeOpen
    Left = 424
    Top = 176
    object CdsPendRecNRECIBO: TIntegerField
      Tag = 2
      DisplayLabel = 'N. Recibo'
      FieldName = 'NRECIBO'
      Required = True
    end
    object CdsPendRecNUM_REC_DEP: TStringField
      Tag = 2
      DisplayLabel = 'N. Rec Dep'
      FieldName = 'NUM_REC_DEP'
      Size = 11
    end
    object CdsPendRecDATA_REC: TDateTimeField
      DisplayLabel = 'Data do Recibo'
      FieldName = 'DATA_REC'
    end
    object CdsPendRecVALOR: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VALOR'
      DisplayFormat = '#,##0.00'
    end
    object CdsPendRecDIA_CXL: TDateTimeField
      DisplayLabel = 'Dia CXL'
      FieldName = 'DIA_CXL'
    end
    object CdsPendRecOBS_CXL_RQ: TStringField
      DisplayLabel = 'Obs. CXL'
      FieldName = 'OBS_CXL_RQ'
      FixedChar = True
      Size = 50
    end
    object CdsPendRecSTATUS_CXL_RQ: TStringField
      DisplayLabel = 'Status CXL'
      FieldName = 'STATUS_CXL_RQ'
      FixedChar = True
      Size = 1
    end
    object CdsPendRecVL_RQ_PG_CXL: TFloatField
      DisplayLabel = 'Valor Pago'
      FieldName = 'VL_RQ_PG_CXL'
      DisplayFormat = '#,##0.00'
    end
    object CdsPendRecOP_CXL: TIntegerField
      DisplayLabel = 'Operador CXL'
      FieldName = 'OP_CXL'
    end
    object CdsPendRecNOME_DEV: TStringField
      DisplayLabel = 'Nome Credor'
      FieldName = 'NOME_DEV'
      FixedChar = True
      Size = 50
    end
    object CdsPendRecREFERENCIA1: TStringField
      DisplayLabel = 'Refer'#234'ncia 1'
      FieldName = 'REFERENCIA1'
      FixedChar = True
      Size = 66
    end
    object CdsPendRecREFERENCIA2: TStringField
      DisplayLabel = 'Refer'#234'ncia 2'
      FieldName = 'REFERENCIA2'
      FixedChar = True
      Size = 66
    end
    object CdsPendRecREFERENCIA3: TStringField
      DisplayLabel = 'Refer'#234'ncia 3'
      FieldName = 'REFERENCIA3'
      FixedChar = True
      Size = 66
    end
    object CdsPendRecREFERENCIA4: TStringField
      DisplayLabel = 'Refer'#234'ncia 4'
      FieldName = 'REFERENCIA4'
      FixedChar = True
      Size = 66
    end
    object CdsPendRecCOD_BENEF: TIntegerField
      DisplayLabel = 'C'#243'd. Benefici'#225'rio'
      FieldName = 'COD_BENEF'
    end
    object CdsPendRecBENEF_CLIENT: TStringField
      DisplayLabel = 'Benefici'#225'rio'
      FieldName = 'BENEF_CLIENT'
      FixedChar = True
      Size = 40
    end
    object CdsPendRecLOCALDATA: TStringField
      DisplayLabel = 'Local e Data Recibo'
      FieldName = 'LOCALDATA'
      FixedChar = True
      Size = 70
    end
    object CdsPendRecRECANT: TStringField
      DisplayLabel = 'Recibo Antecipado?'
      FieldName = 'RECANT'
      FixedChar = True
      Size = 1
    end
    object CdsPendRecCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'C'#243'd. Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
      Visible = False
    end
    object CdsPendRecNDOCANT: TIntegerField
      DisplayLabel = 'N. Doc. Antecipado'
      FieldName = 'NDOCANT'
    end
    object CdsPendRecN_MOV_CXL: TIntegerField
      DisplayLabel = 'N. Mov. CXL'
      FieldName = 'N_MOV_CXL'
    end
    object CdsPendRecHISTORICO_REC: TStringField
      DisplayLabel = 'Ultimo Hist'#243'rico'
      FieldName = 'HISTORICO_REC'
      FixedChar = True
      Size = 50
    end
    object CdsPendRecCOD_US: TIntegerField
      DisplayLabel = 'C'#243'digo Usu'#225'rio'
      FieldName = 'COD_US'
    end
    object CdsPendRecVALOR_ORIG: TFloatField
      DisplayLabel = 'Valor Original'
      FieldName = 'VALOR_ORIG'
      DisplayFormat = '#,##0.00'
    end
    object CdsPendRecCOD_DEVEDOR: TIntegerField
      DisplayLabel = 'Cod Devedor'
      FieldName = 'COD_DEVEDOR'
    end
    object CdsPendRecATRAVES1: TStringField
      DisplayLabel = 'Atraves 1'
      FieldName = 'ATRAVES1'
      Size = 66
    end
    object CdsPendRecATRAVES2: TStringField
      DisplayLabel = 'Atraves 2'
      FieldName = 'ATRAVES2'
      Size = 66
    end
    object CdsPendRecATRAVES3: TStringField
      DisplayLabel = 'Atraves 3'
      FieldName = 'ATRAVES3'
      Size = 66
    end
    object CdsPendRecOBSERVACAO1: TStringField
      DisplayLabel = 'Observacao 1'
      FieldName = 'OBSERVACAO1'
      Size = 66
    end
    object CdsPendRecOBSERVACAO2: TStringField
      DisplayLabel = 'Observacao 2'
      FieldName = 'OBSERVACAO2'
      Size = 66
    end
    object CdsPendRecOBSERVACAO3: TStringField
      DisplayLabel = 'Observacao 3'
      FieldName = 'OBSERVACAO3'
      Size = 66
    end
    object CdsPendRecCXL: TStringField
      Tag = 1
      DisplayLabel = 'Cxl'
      FieldName = 'CXL'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object DtPendRec: TDataSource
    DataSet = CdsPendRec
    Left = 424
    Top = 224
  end
  object QrLancCXL: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IbTransBalcao
    SQL.Strings = (
      
        'select * from lanccxl where data_lc_cxl = :vdata and op_cxl = :v' +
        'op'
      'and codigo_emp = :cod_empresa')
    Left = 524
    Top = 72
    ParamData = <
      item
        DataType = ftDate
        Name = 'vdata'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'vop'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'cod_empresa'
        ParamType = ptUnknown
      end>
  end
  object DspLanccxl: TDataSetProvider
    DataSet = QrLancCXL
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 524
    Top = 120
  end
  object CdsLancCXL: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspLanccxl'
    BeforeOpen = CdsPendBalcao1BeforeOpen
    Left = 524
    Top = 176
    object CdsLancCXLCOD_LANCXL: TIntegerField
      Tag = 2
      DisplayLabel = 'C'#243'digo Lan'#231'amento'
      FieldName = 'COD_LANCXL'
      Required = True
    end
    object CdsLancCXLTIPO_DOC_CXL: TStringField
      DisplayLabel = 'Tipo Documento Lan'#231'amento'
      FieldName = 'TIPO_DOC_CXL'
      FixedChar = True
      Size = 3
    end
    object CdsLancCXLDATA_LC_CXL: TDateTimeField
      DisplayLabel = 'Data Lan'#231'amento'
      FieldName = 'DATA_LC_CXL'
    end
    object CdsLancCXLN_DOC_CXL: TIntegerField
      DisplayLabel = 'N. Documento'
      FieldName = 'N_DOC_CXL'
    end
    object CdsLancCXLTIPO_LANC_CXL: TStringField
      DisplayLabel = 'Tipo Lan'#231'amento'
      FieldName = 'TIPO_LANC_CXL'
      FixedChar = True
      Size = 1
    end
    object CdsLancCXLHISTORICO_CXL: TStringField
      DisplayLabel = 'Hist'#243'rico lan'#231'amento'
      FieldName = 'HISTORICO_CXL'
      Required = True
      FixedChar = True
      Size = 50
    end
    object CdsLancCXLVALOR_CXL: TFloatField
      DisplayLabel = 'Valor Lan'#231'amento'
      FieldName = 'VALOR_CXL'
      DisplayFormat = '#,##0.00'
    end
    object CdsLancCXLSDD: TStringField
      FieldName = 'SDD'
      FixedChar = True
      Size = 1
    end
    object CdsLancCXLTR: TStringField
      FieldName = 'TR'
      FixedChar = True
      Size = 1
    end
    object CdsLancCXLOP_CXL: TIntegerField
      DisplayLabel = 'Operador'
      FieldName = 'OP_CXL'
    end
    object CdsLancCXLN_CONTA_PLC: TFloatField
      DisplayLabel = 'N. Conta'
      FieldName = 'N_CONTA_PLC'
    end
    object CdsLancCXLCODIGO_EMP: TIntegerField
      Tag = 1
      DisplayLabel = 'C'#243'digo Empresa'
      FieldName = 'CODIGO_EMP'
      Required = True
      Visible = False
    end
  end
  object DtLancCxl: TDataSource
    DataSet = CdsLancCXL
    Left = 524
    Top = 224
  end
  object QrContrFormas: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IbTransBalcao
    SQL.Strings = (
      
        'select cx.nome_ctrl,sum(fr.valordoc),cx.codigo_ctrl, sum(fr.vl_j' +
        'uros) vl_juros from controles cx,'
      'formpagamento fr where fr.data_mov = :vdata and '
      
        'fr.cod_controle = cx.codigo_ctrl and fr.op_cxl = :vop and fr.cod' +
        '_empresa = '
      'cx.codigo_emp and fr.cod_empresa = :cod_empresa AND fr.ATIVO = 1'
      'group by cx.nome_ctrl,cx.codigo_ctrl')
    Left = 624
    Top = 72
    ParamData = <
      item
        DataType = ftDate
        Name = 'vdata'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'vop'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'cod_empresa'
        ParamType = ptUnknown
      end>
  end
  object DspContrFormas: TDataSetProvider
    DataSet = QrContrFormas
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 624
    Top = 120
  end
  object CdsContrFormas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspContrFormas'
    BeforeOpen = CdsPendBalcao1BeforeOpen
    Left = 624
    Top = 176
    object CdsContrFormasNOME_CTRL: TStringField
      DisplayLabel = 'Controle'
      FieldName = 'NOME_CTRL'
      Size = 35
    end
    object CdsContrFormasSUM: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'SUM'
      DisplayFormat = '#,##0.00'
    end
    object CdsContrFormasCODIGO_CTRL: TIntegerField
      DisplayLabel = 'C'#243'digo Controle'
      FieldName = 'CODIGO_CTRL'
    end
    object CdsContrFormasVL_JUROS: TFloatField
      Tag = 1
      FieldName = 'VL_JUROS'
      Visible = False
    end
  end
  object QrDetalhesCtrl: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IbTransBalcao
    SQL.Strings = (
      'SELECT data_mov,tpdocs,nrequisicao,ndoc,cliente,'
      'historico,valordoc,data_venc,terceiros,cod_controle,seqform,'
      #39' '#39' num_rec_dep, '#39' '#39' num_rec_parc'
      'FROM FORMPAGAMENTO'
      'WHERE  data_mov = :vdata and cod_controle = :vcod '
      'and op_cxl = :vop order by data_venc'
      ''
      '')
    Left = 24
    Top = 328
    ParamData = <
      item
        DataType = ftDate
        Name = 'vdata'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'vcod'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'vop'
        ParamType = ptUnknown
      end>
    object QrDetalhesCtrlDATA_MOV: TDateTimeField
      DisplayLabel = 'DATA MOVIMENTO'
      FieldName = 'DATA_MOV'
      Origin = '"FORMPAGAMENTO"."DATA_MOV"'
    end
    object QrDetalhesCtrlTPDOCS: TIBStringField
      DisplayLabel = 'TIPO DOCUMENTO'
      FieldName = 'TPDOCS'
      Origin = '"FORMPAGAMENTO"."TPDOCS"'
      Size = 6
    end
    object QrDetalhesCtrlNREQUISICAO: TIntegerField
      DisplayLabel = 'N. DOCUMENTO'
      FieldName = 'NREQUISICAO'
      Origin = '"FORMPAGAMENTO"."NREQUISICAO"'
    end
    object QrDetalhesCtrlNUM_REC_DEP: TIBStringField
      DisplayLabel = 'N. DOCUMENTO'
      FieldName = 'NUM_REC_DEP'
      ProviderFlags = []
      FixedChar = True
      Size = 11
    end
    object QrDetalhesCtrlNDOC: TIBStringField
      DisplayLabel = 'N. SEQ. DOCUMENTO'
      FieldName = 'NDOC'
      Origin = '"FORMPAGAMENTO"."NDOC"'
    end
    object QrDetalhesCtrlNUM_REC_PARC: TIBStringField
      DisplayLabel = 'N. SEQ. DOCUMENTO'
      FieldName = 'NUM_REC_PARC'
      ProviderFlags = []
      FixedChar = True
    end
    object QrDetalhesCtrlCLIENTE: TIBStringField
      FieldName = 'CLIENTE'
      Origin = '"FORMPAGAMENTO"."CLIENTE"'
      Size = 60
    end
    object QrDetalhesCtrlHISTORICO: TIBStringField
      DisplayLabel = 'HIST'#211'RICO'
      FieldName = 'HISTORICO'
      Origin = '"FORMPAGAMENTO"."HISTORICO"'
      Size = 80
    end
    object QrDetalhesCtrlVALORDOC: TFloatField
      DisplayLabel = 'VALOR'
      FieldName = 'VALORDOC'
      Origin = '"FORMPAGAMENTO"."VALORDOC"'
      DisplayFormat = '#,##0.00'
    end
    object QrDetalhesCtrlDATA_VENC: TDateTimeField
      DisplayLabel = 'DATA VENCIMENTO'
      FieldName = 'DATA_VENC'
      Origin = '"FORMPAGAMENTO"."DATA_VENC"'
    end
    object QrDetalhesCtrlTERCEIROS: TIBStringField
      FieldName = 'TERCEIROS'
      Origin = '"FORMPAGAMENTO"."TERCEIROS"'
      Size = 80
    end
    object QrDetalhesCtrlCOD_CONTROLE: TIntegerField
      DisplayLabel = 'CONTROLE'
      FieldName = 'COD_CONTROLE'
      Origin = '"FORMPAGAMENTO"."COD_CONTROLE"'
    end
    object QrDetalhesCtrlSEQFORM: TIntegerField
      FieldName = 'SEQFORM'
      Origin = '"FORMPAGAMENTO"."SEQFORM"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
  end
  object DtDetalhesCtrl: TDataSource
    DataSet = QrDetalhesCtrl
    Left = 24
    Top = 384
  end
  object DspFecdCxl: TDataSetProvider
    DataSet = QrFecDia
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 324
    Top = 120
  end
  object CdsFecDia: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspFecdCxl'
    BeforeOpen = CdsPendBalcao1BeforeOpen
    Left = 324
    Top = 176
    object CdsFecDiaN_MOV_CXL: TIntegerField
      Tag = 2
      DisplayLabel = 'N. Movimento'
      FieldName = 'N_MOV_CXL'
      Origin = '"FECD_CXL"."N_MOV_CXL"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CdsFecDiaDIA_F_CXL: TDateTimeField
      Tag = 2
      DisplayLabel = 'Dia Fechamento'
      FieldName = 'DIA_F_CXL'
      Origin = '"FECD_CXL"."DIA_F_CXL"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CdsFecDiaSTATUS_CXL: TStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS_CXL'
      Origin = '"FECD_CXL"."STATUS_CXL"'
      FixedChar = True
      Size = 10
    end
    object CdsFecDiaOP_CXL: TIntegerField
      DisplayLabel = 'Operador'
      FieldName = 'OP_CXL'
      Origin = '"FECD_CXL"."OP_CXL"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CdsFecDiaCODIGO_EMP: TIntegerField
      Tag = 1
      DisplayLabel = 'Empresa'
      FieldName = 'CODIGO_EMP'
      Origin = '"FECD_CXL"."CODIGO_EMP"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
    end
  end
  object SpIncCodigoCxl: TIBStoredProc
    Database = dtmAtivo.bancoHw
    Transaction = IbTransBalcao
    StoredProcName = 'INCREMENTA_CODIGO'
    Left = 328
    Top = 16
  end
  object DtFecDia: TDataSource
    DataSet = CdsFecDia
    Left = 324
    Top = 224
  end
  object DtCtrlFormas: TDataSource
    DataSet = CdsContrFormas
    Left = 624
    Top = 224
  end
  object IbComandoPesq: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IbTransBalcao
    SQL.Strings = (
      'select * from com_fat where n_comando = :ncomando')
    Left = 124
    Top = 328
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ncomando'
        ParamType = ptUnknown
      end>
    object IbComandoPesqN_COMANDO: TIntegerField
      FieldName = 'N_COMANDO'
      Origin = '"COM_FAT"."N_COMANDO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IbComandoPesqCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Origin = '"COM_FAT"."COD_EMPRESA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IbComandoPesqNUM_NOTA_V: TIntegerField
      FieldName = 'NUM_NOTA_V'
      Origin = '"COM_FAT"."NUM_NOTA_V"'
    end
    object IbComandoPesqCHASSIV: TIBStringField
      FieldName = 'CHASSIV'
      Origin = '"COM_FAT"."CHASSIV"'
      FixedChar = True
      Size = 17
    end
    object IbComandoPesqNAT_V: TIBStringField
      FieldName = 'NAT_V'
      Origin = '"COM_FAT"."NAT_V"'
      FixedChar = True
      Size = 1
    end
    object IbComandoPesqNOME_RECEB: TIBStringField
      FieldName = 'NOME_RECEB'
      Origin = '"COM_FAT"."NOME_RECEB"'
      FixedChar = True
      Size = 30
    end
    object IbComandoPesqFONE_RECEB: TIBStringField
      FieldName = 'FONE_RECEB'
      Origin = '"COM_FAT"."FONE_RECEB"'
      FixedChar = True
      Size = 13
    end
    object IbComandoPesqVALOR_REAL: TFloatField
      FieldName = 'VALOR_REAL'
      Origin = '"COM_FAT"."VALOR_REAL"'
    end
    object IbComandoPesqVALOR_A_REC: TFloatField
      FieldName = 'VALOR_A_REC'
      Origin = '"COM_FAT"."VALOR_A_REC"'
    end
    object IbComandoPesqCODIGO_US: TIntegerField
      FieldName = 'CODIGO_US'
      Origin = '"COM_FAT"."CODIGO_US"'
    end
    object IbComandoPesqTIPO_VENDA_V: TIBStringField
      FieldName = 'TIPO_VENDA_V'
      Origin = '"COM_FAT"."TIPO_VENDA_V"'
      FixedChar = True
      Size = 1
    end
    object IbComandoPesqCLIENTES_V: TIntegerField
      FieldName = 'CLIENTES_V'
      Origin = '"COM_FAT"."CLIENTES_V"'
    end
    object IbComandoPesqCOVEND_V: TIntegerField
      FieldName = 'COVEND_V'
      Origin = '"COM_FAT"."COVEND_V"'
    end
    object IbComandoPesqCONDPAG_V: TIntegerField
      FieldName = 'CONDPAG_V'
      Origin = '"COM_FAT"."CONDPAG_V"'
    end
    object IbComandoPesqNATOP_V: TFloatField
      FieldName = 'NATOP_V'
      Origin = '"COM_FAT"."NATOP_V"'
    end
    object IbComandoPesqCODFISC_V: TIBStringField
      FieldName = 'CODFISC_V'
      Origin = '"COM_FAT"."CODFISC_V"'
      FixedChar = True
      Size = 10
    end
    object IbComandoPesqPRVEN_V: TFloatField
      FieldName = 'PRVEN_V'
      Origin = '"COM_FAT"."PRVEN_V"'
    end
    object IbComandoPesqFRETE_V: TFloatField
      FieldName = 'FRETE_V'
      Origin = '"COM_FAT"."FRETE_V"'
    end
    object IbComandoPesqSEGURO_V: TFloatField
      FieldName = 'SEGURO_V'
      Origin = '"COM_FAT"."SEGURO_V"'
    end
    object IbComandoPesqOUTDESP_V: TFloatField
      FieldName = 'OUTDESP_V'
      Origin = '"COM_FAT"."OUTDESP_V"'
    end
    object IbComandoPesqALICM_V: TFloatField
      FieldName = 'ALICM_V'
      Origin = '"COM_FAT"."ALICM_V"'
    end
    object IbComandoPesqREDB_V: TIBStringField
      FieldName = 'REDB_V'
      Origin = '"COM_FAT"."REDB_V"'
      FixedChar = True
      Size = 1
    end
    object IbComandoPesqOBS_V: TMemoField
      FieldName = 'OBS_V'
      Origin = '"COM_FAT"."OBS_V"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
    object IbComandoPesqDESCONTO_V: TFloatField
      FieldName = 'DESCONTO_V'
      Origin = '"COM_FAT"."DESCONTO_V"'
    end
    object IbComandoPesqINSCSUB_V: TIBStringField
      FieldName = 'INSCSUB_V'
      Origin = '"COM_FAT"."INSCSUB_V"'
      FixedChar = True
      Size = 18
    end
    object IbComandoPesqVALTOT_V: TFloatField
      FieldName = 'VALTOT_V'
      Origin = '"COM_FAT"."VALTOT_V"'
    end
    object IbComandoPesqDATA_VEN: TDateTimeField
      FieldName = 'DATA_VEN'
      Origin = '"COM_FAT"."DATA_VEN"'
    end
    object IbComandoPesqSTATUS_V: TIBStringField
      FieldName = 'STATUS_V'
      Origin = '"COM_FAT"."STATUS_V"'
      FixedChar = True
      Size = 10
    end
    object IbComandoPesqTIPO_V: TIBStringField
      FieldName = 'TIPO_V'
      Origin = '"COM_FAT"."TIPO_V"'
      FixedChar = True
      Size = 4
    end
    object IbComandoPesqBICMSUB_V: TFloatField
      FieldName = 'BICMSUB_V'
      Origin = '"COM_FAT"."BICMSUB_V"'
    end
    object IbComandoPesqVLICMSUB_V: TFloatField
      FieldName = 'VLICMSUB_V'
      Origin = '"COM_FAT"."VLICMSUB_V"'
    end
    object IbComandoPesqVERSAO_V: TIntegerField
      FieldName = 'VERSAO_V'
      Origin = '"COM_FAT"."VERSAO_V"'
    end
    object IbComandoPesqGRUPO_C_V: TIBStringField
      FieldName = 'GRUPO_C_V'
      Origin = '"COM_FAT"."GRUPO_C_V"'
      FixedChar = True
      Size = 10
    end
    object IbComandoPesqINF_CORPO_V: TMemoField
      FieldName = 'INF_CORPO_V'
      Origin = '"COM_FAT"."INF_CORPO_V"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
    object IbComandoPesqDIA_CXL: TDateTimeField
      FieldName = 'DIA_CXL'
      Origin = '"COM_FAT"."DIA_CXL"'
    end
    object IbComandoPesqN_MOV_CXL: TIntegerField
      FieldName = 'N_MOV_CXL'
      Origin = '"COM_FAT"."N_MOV_CXL"'
    end
    object IbComandoPesqSTATUS_CXL_RQ: TIBStringField
      FieldName = 'STATUS_CXL_RQ'
      Origin = '"COM_FAT"."STATUS_CXL_RQ"'
      FixedChar = True
      Size = 1
    end
    object IbComandoPesqVL_RQ_PG_CXL: TFloatField
      FieldName = 'VL_RQ_PG_CXL'
      Origin = '"COM_FAT"."VL_RQ_PG_CXL"'
    end
    object IbComandoPesqVALOBS1: TFloatField
      FieldName = 'VALOBS1'
      Origin = '"COM_FAT"."VALOBS1"'
    end
    object IbComandoPesqVALOBS2: TFloatField
      FieldName = 'VALOBS2'
      Origin = '"COM_FAT"."VALOBS2"'
    end
    object IbComandoPesqVALOBS3: TFloatField
      FieldName = 'VALOBS3'
      Origin = '"COM_FAT"."VALOBS3"'
    end
    object IbComandoPesqVALOBS4: TFloatField
      FieldName = 'VALOBS4'
      Origin = '"COM_FAT"."VALOBS4"'
    end
    object IbComandoPesqVALOBS5: TFloatField
      FieldName = 'VALOBS5'
      Origin = '"COM_FAT"."VALOBS5"'
    end
    object IbComandoPesqDADOS_V: TMemoField
      FieldName = 'DADOS_V'
      Origin = '"COM_FAT"."DADOS_V"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
    object IbComandoPesqCODIGO_TR: TIntegerField
      FieldName = 'CODIGO_TR'
      Origin = '"COM_FAT"."CODIGO_TR"'
    end
    object IbComandoPesqBASE_ICM_V: TFloatField
      FieldName = 'BASE_ICM_V'
      Origin = '"COM_FAT"."BASE_ICM_V"'
    end
    object IbComandoPesqICMS_V: TFloatField
      FieldName = 'ICMS_V'
      Origin = '"COM_FAT"."ICMS_V"'
    end
    object IbComandoPesqCONFUS: TIBStringField
      FieldName = 'CONFUS'
      Origin = '"COM_FAT"."CONFUS"'
      FixedChar = True
      Size = 1
    end
    object IbComandoPesqPEDRA_C_V: TIntegerField
      FieldName = 'PEDRA_C_V'
      Origin = '"COM_FAT"."PEDRA_C_V"'
    end
    object IbComandoPesqPLACA_V_TR: TIBStringField
      FieldName = 'PLACA_V_TR'
      Origin = '"COM_FAT"."PLACA_V_TR"'
      FixedChar = True
      Size = 7
    end
    object IbComandoPesqFRC_VND: TIBStringField
      FieldName = 'FRC_VND'
      Origin = '"COM_FAT"."FRC_VND"'
      FixedChar = True
      Size = 1
    end
    object IbComandoPesqV_QUANT_VND: TIBStringField
      FieldName = 'V_QUANT_VND'
      Origin = '"COM_FAT"."V_QUANT_VND"'
      FixedChar = True
      Size = 10
    end
    object IbComandoPesqESPECIE_VND: TIBStringField
      FieldName = 'ESPECIE_VND'
      Origin = '"COM_FAT"."ESPECIE_VND"'
      FixedChar = True
      Size = 15
    end
    object IbComandoPesqMARCA_VND: TIBStringField
      FieldName = 'MARCA_VND'
      Origin = '"COM_FAT"."MARCA_VND"'
      FixedChar = True
      Size = 15
    end
    object IbComandoPesqNUMERO_VND: TIBStringField
      FieldName = 'NUMERO_VND'
      Origin = '"COM_FAT"."NUMERO_VND"'
      FixedChar = True
      Size = 15
    end
    object IbComandoPesqPESO_B_VND: TIBStringField
      FieldName = 'PESO_B_VND'
      Origin = '"COM_FAT"."PESO_B_VND"'
      FixedChar = True
      Size = 10
    end
    object IbComandoPesqPESO_L_VND: TIBStringField
      FieldName = 'PESO_L_VND'
      Origin = '"COM_FAT"."PESO_L_VND"'
      FixedChar = True
      Size = 10
    end
    object IbComandoPesqUF_PLACA_TR: TIBStringField
      FieldName = 'UF_PLACA_TR'
      Origin = '"COM_FAT"."UF_PLACA_TR"'
      FixedChar = True
      Size = 2
    end
    object IbComandoPesqSITUACAO: TIBStringField
      FieldName = 'SITUACAO'
      Origin = '"COM_FAT"."SITUACAO"'
      FixedChar = True
      Size = 10
    end
    object IbComandoPesqOBS1: TIBStringField
      FieldName = 'OBS1'
      Origin = '"COM_FAT"."OBS1"'
      FixedChar = True
      Size = 60
    end
    object IbComandoPesqOBS2: TIBStringField
      FieldName = 'OBS2'
      Origin = '"COM_FAT"."OBS2"'
      FixedChar = True
      Size = 60
    end
    object IbComandoPesqOBS3: TIBStringField
      FieldName = 'OBS3'
      Origin = '"COM_FAT"."OBS3"'
      FixedChar = True
      Size = 60
    end
    object IbComandoPesqOBS4: TIBStringField
      FieldName = 'OBS4'
      Origin = '"COM_FAT"."OBS4"'
      FixedChar = True
      Size = 60
    end
    object IbComandoPesqOBS5: TIBStringField
      FieldName = 'OBS5'
      Origin = '"COM_FAT"."OBS5"'
      FixedChar = True
      Size = 60
    end
    object IbComandoPesqREC_ANT: TIntegerField
      FieldName = 'REC_ANT'
      Origin = '"COM_FAT"."REC_ANT"'
    end
    object IbComandoPesqOP_CXL: TIntegerField
      FieldName = 'OP_CXL'
      Origin = '"COM_FAT"."OP_CXL"'
    end
    object IbComandoPesqATIVO: TIntegerField
      FieldName = 'ATIVO'
      Origin = '"COM_FAT"."ATIVO"'
    end
    object IbComandoPesqDTSITUACAO: TDateTimeField
      FieldName = 'DTSITUACAO'
      Origin = '"COM_FAT"."DTSITUACAO"'
    end
    object IbComandoPesqDT_ENT_SAID: TDateTimeField
      FieldName = 'DT_ENT_SAID'
      Origin = '"COM_FAT"."DT_ENT_SAID"'
    end
  end
  object DtComandoPesq: TDataSource
    DataSet = IbComandoPesq
    Left = 124
    Top = 384
  end
  object IBQuery1: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IbTransBalcao
    SQL.Strings = (
      
        'select rq.nped,cl.nome_cliente,rq.valor_total,rq.data_ped,rq.dat' +
        'a_fech,'
      
        'rq.obs_cxl_rq,rq.vl_pago_cxl,rq.status_cxl_rq,rq.dia_cxl,rq.desc' +
        'onto,rq.desc_p_prod,rq.desc_p_serv,'
      
        'cl.cod_cliente,rq.cod_cond_pag,rq.cod_vendedor,rq.op_cxl,rq.vl_e' +
        'ntrada,'
      
        'rq.codigo_ctrl,rq.cod_empresa,rq.NPREVENDA,rq.NCUPOM,rq.NSERIEEC' +
        'F,rq.OPERADOR'
      'from pedvenda rq,CLIENTES CL'
      'Where rq.data_fech is not null and'
      
        '(rq.dia_cxl is null or rq.dia_cxl = :vdatafec) and rq.cod_client' +
        'e = cl.cod_cliente '
      
        'and rq.cod_empresa = cl.cod_empresa and (rq.op_cxl = :vop or rq.' +
        'op_cxl is null or rq.op_cxl = 0)'
      
        'and rq.cod_empresa = :cod_empresa and rq.ativo = 1 order by rq.d' +
        'ata_fech,rq.nped')
    Left = 312
    Top = 304
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
        Name = 'cod_empresa'
        ParamType = ptUnknown
      end>
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = IBQuery1
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 312
    Top = 360
  end
  object CdsPendOS: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspPendOS'
    BeforeOpen = CdsPendBalcao1BeforeOpen
    Left = 124
    Top = 176
    object CdsPendOSNPED: TIntegerField
      Tag = 2
      DisplayLabel = 'N. Req.'
      FieldName = 'NPED'
      Origin = '"PEDVENDA"."NPED"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IntegerField2: TIntegerField
      DisplayLabel = 'DAV'
      FieldName = 'NPREVENDA'
      Origin = '"PEDVENDA"."NPREVENDA"'
      ProviderFlags = []
    end
    object IntegerField9: TIntegerField
      DisplayLabel = 'N. Cupom'
      FieldName = 'NCUPOM'
      Origin = '"PEDVENDA"."NCUPOM"'
      ProviderFlags = []
    end
    object StringField1: TStringField
      DisplayLabel = 'Nome do Cliente'
      FieldName = 'NOME_CLIENTE'
      Origin = '"CLIENTES"."NOME_CLIENTE"'
      ProviderFlags = []
      Required = True
      Size = 35
    end
    object FloatField1: TFloatField
      DisplayLabel = 'Valor Total'
      FieldName = 'VALOR_TOTAL'
      Origin = '"PEDVENDA"."VALOR_TOTAL"'
      ProviderFlags = []
      DisplayFormat = '#,##0.00'
    end
    object CdsPendOSDATA_PED: TDateTimeField
      DisplayLabel = 'Data Requisi'#231#227'o'
      FieldName = 'DATA_PED'
      Origin = '"PEDVENDA"."DATA_PED"'
    end
    object CdsPendOSDATA_FECH: TDateTimeField
      DisplayLabel = 'Data Fechamento'
      FieldName = 'DATA_FECH'
      Origin = '"PEDVENDA"."DATA_FECH"'
    end
    object StringField2: TStringField
      DisplayLabel = 'Obs. Caixa Auxiliar'
      FieldName = 'OBS_CXL_RQ'
      Origin = '"PEDVENDA"."OBS_CXL_RQ"'
      ProviderFlags = []
      FixedChar = True
      Size = 50
    end
    object CdsPendOSVL_PAGO_CXL: TFloatField
      DisplayLabel = 'Valor Pago'
      FieldName = 'VL_PAGO_CXL'
      Origin = '"PEDVENDA"."VL_PAGO_CXL"'
      DisplayFormat = '#,##0.00'
    end
    object StringField3: TStringField
      DisplayLabel = 'Status CXL'
      FieldName = 'STATUS_CXL_RQ'
      Origin = '"PEDVENDA"."STATUS_CXL_RQ"'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object DateTimeField3: TDateTimeField
      DisplayLabel = 'Dia CXL'
      FieldName = 'DIA_CXL'
      Origin = '"PEDVENDA"."DIA_CXL"'
      ProviderFlags = [pfInUpdate]
    end
    object CdsPendOSDESCONTO: TFloatField
      DisplayLabel = 'Valor Desconto'
      FieldName = 'DESCONTO'
      Origin = '"PEDVENDA"."DESCONTO"'
      DisplayFormat = '#,##0.00'
    end
    object CdsPendOSDESC_P_PROD: TFloatField
      DisplayLabel = 'Perc. Desconto'
      FieldName = 'DESC_P_PROD'
      Origin = '"PEDVENDA"."DESC_P_PROD"'
    end
    object CdsPendOSDESC_P_SERV: TFloatField
      DisplayLabel = 'Perc. Desconto Serv'
      FieldName = 'DESC_P_SERV'
      Origin = '"PEDVENDA"."DESC_P_SERV"'
    end
    object IntegerField3: TIntegerField
      DisplayLabel = 'C'#243'd. Cliente'
      FieldName = 'COD_CLIENTE'
      Origin = '"CLIENTES"."COD_CLIENTE"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IntegerField4: TIntegerField
      DisplayLabel = 'C'#243'd. Cond. Pagamento'
      FieldName = 'COD_COND_PAG'
      Origin = '"PEDVENDA"."COD_COND_PAG"'
      ProviderFlags = []
      Required = True
    end
    object IntegerField5: TIntegerField
      DisplayLabel = 'C'#243'd. Vendedor'
      FieldName = 'COD_VENDEDOR'
      Origin = '"PEDVENDA"."COD_VENDEDOR"'
      ProviderFlags = []
      Required = True
    end
    object IntegerField6: TIntegerField
      DisplayLabel = 'Operador CXL'
      FieldName = 'OP_CXL'
      Origin = '"PEDVENDA"."OP_CXL"'
      ProviderFlags = [pfInUpdate]
    end
    object FloatField5: TFloatField
      DisplayLabel = 'Valor Entrada'
      FieldName = 'VL_ENTRADA'
      Origin = '"PEDVENDA"."VL_ENTRADA"'
      ProviderFlags = []
      DisplayFormat = '#,##0.00'
    end
    object IntegerField7: TIntegerField
      DisplayLabel = 'C'#243'digo Controle'
      FieldName = 'CODIGO_CTRL'
      Origin = '"PEDVENDA"."CODIGO_CTRL"'
      ProviderFlags = []
    end
    object IntegerField8: TIntegerField
      Tag = 1
      DisplayLabel = 'C'#243'digo Empresa'
      FieldName = 'COD_EMPRESA'
      Origin = '"PEDVENDA"."COD_EMPRESA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
    end
    object StringField4: TStringField
      DisplayLabel = 'N. ECF'
      FieldName = 'NSERIEECF'
      Origin = '"PEDVENDA"."NSERIEECF"'
      ProviderFlags = []
      FixedChar = True
    end
    object IntegerField10: TIntegerField
      DisplayLabel = 'Operador'
      FieldName = 'OPERADOR'
      Origin = '"PEDVENDA"."OPERADOR"'
      ProviderFlags = []
    end
    object CdsPendOSTIPO: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Required = True
      Visible = False
      FixedChar = True
      Size = 3
    end
    object CdsPendOSCOD_NFCE: TIntegerField
      DisplayLabel = 'Cod NFCe'
      FieldName = 'COD_NFCE'
    end
    object CdsPendOSNUM_NFCE: TIntegerField
      DisplayLabel = 'Num NFCe'
      FieldName = 'NUM_NFCE'
    end
    object CdsPendOSOP_NFCE: TIntegerField
      FieldName = 'OP_NFCE'
    end
    object CdsPendOSCX_NFCE: TIntegerField
      FieldName = 'CX_NFCE'
    end
  end
  object CdsPendBalcao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspPendBalcao'
    BeforeOpen = CdsPendBalcao1BeforeOpen
    Left = 24
    Top = 176
    object CdsPendBalcaoNPED: TIntegerField
      Tag = 2
      DisplayLabel = 'N. Req.'
      FieldName = 'NPED'
      Origin = '"PEDVENDA"."NPED"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IntegerField1: TIntegerField
      DisplayLabel = 'DAV'
      FieldName = 'NPREVENDA'
      Origin = '"PEDVENDA"."NPREVENDA"'
      ProviderFlags = []
    end
    object IntegerField17: TIntegerField
      DisplayLabel = 'N. Cupom'
      FieldName = 'NCUPOM'
      Origin = '"PEDVENDA"."NCUPOM"'
      ProviderFlags = []
    end
    object StringField5: TStringField
      DisplayLabel = 'Nome do Cliente'
      FieldName = 'NOME_CLIENTE'
      Origin = '"CLIENTES"."NOME_CLIENTE"'
      ProviderFlags = []
      Required = True
      Size = 35
    end
    object FloatField2: TFloatField
      DisplayLabel = 'Valor Total'
      FieldName = 'VALOR_TOTAL'
      Origin = '"PEDVENDA"."VALOR_TOTAL"'
      ProviderFlags = []
      DisplayFormat = '#,##0.00'
    end
    object CdsPendBalcaoDATA_PED: TDateTimeField
      DisplayLabel = 'Data Requisi'#231#227'o'
      FieldName = 'DATA_PED'
      Origin = '"PEDVENDA"."DATA_PED"'
    end
    object CdsPendBalcaoDATA_FECH: TDateTimeField
      DisplayLabel = 'Data Fechamento'
      FieldName = 'DATA_FECH'
      Origin = '"PEDVENDA"."DATA_FECH"'
    end
    object StringField6: TStringField
      DisplayLabel = 'Obs. Caixa Auxiliar'
      FieldName = 'OBS_CXL_RQ'
      Origin = '"PEDVENDA"."OBS_CXL_RQ"'
      ProviderFlags = []
      FixedChar = True
      Size = 50
    end
    object CdsPendBalcaoVL_PAGO_CXL: TFloatField
      DisplayLabel = 'Valor Pago'
      FieldName = 'VL_PAGO_CXL'
      Origin = '"PEDVENDA"."VL_PAGO_CXL"'
      DisplayFormat = '#,##0.00'
    end
    object StringField7: TStringField
      DisplayLabel = 'Status CXL'
      FieldName = 'STATUS_CXL_RQ'
      Origin = '"PEDVENDA"."STATUS_CXL_RQ"'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object DateTimeField1: TDateTimeField
      DisplayLabel = 'Dia CXL'
      FieldName = 'DIA_CXL'
      Origin = '"PEDVENDA"."DIA_CXL"'
      ProviderFlags = [pfInUpdate]
    end
    object CdsPendBalcaoDESCONTO: TFloatField
      DisplayLabel = 'Valor Desconto'
      FieldName = 'DESCONTO'
      Origin = '"PEDVENDA"."DESCONTO"'
      DisplayFormat = '#,##0.00'
    end
    object CdsPendBalcaoDESC_P_PROD: TFloatField
      DisplayLabel = 'Perc. Desconto'
      FieldName = 'DESC_P_PROD'
      Origin = '"PEDVENDA"."DESC_P_PROD"'
    end
    object CdsPendBalcaoDESC_P_SERV: TFloatField
      DisplayLabel = 'Perc. Desconto Serv'
      FieldName = 'DESC_P_SERV'
      Origin = '"PEDVENDA"."DESC_P_SERV"'
    end
    object IntegerField11: TIntegerField
      DisplayLabel = 'C'#243'd. Cliente'
      FieldName = 'COD_CLIENTE'
      Origin = '"CLIENTES"."COD_CLIENTE"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IntegerField12: TIntegerField
      DisplayLabel = 'C'#243'd. Cond. Pagamento'
      FieldName = 'COD_COND_PAG'
      Origin = '"PEDVENDA"."COD_COND_PAG"'
      ProviderFlags = []
    end
    object IntegerField13: TIntegerField
      DisplayLabel = 'C'#243'd. Vendedor'
      FieldName = 'COD_VENDEDOR'
      Origin = '"PEDVENDA"."COD_VENDEDOR"'
      ProviderFlags = []
      Required = True
    end
    object IntegerField14: TIntegerField
      DisplayLabel = 'Operador CXL'
      FieldName = 'OP_CXL'
      Origin = '"PEDVENDA"."OP_CXL"'
      ProviderFlags = [pfInUpdate]
    end
    object FloatField3: TFloatField
      DisplayLabel = 'Valor Entrada'
      FieldName = 'VL_ENTRADA'
      Origin = '"PEDVENDA"."VL_ENTRADA"'
      ProviderFlags = []
      DisplayFormat = '#,##0.00'
    end
    object IntegerField15: TIntegerField
      DisplayLabel = 'C'#243'digo Controle'
      FieldName = 'CODIGO_CTRL'
      Origin = '"PEDVENDA"."CODIGO_CTRL"'
      ProviderFlags = []
    end
    object IntegerField16: TIntegerField
      Tag = 1
      DisplayLabel = 'C'#243'digo Empresa'
      FieldName = 'COD_EMPRESA'
      Origin = '"PEDVENDA"."COD_EMPRESA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
    end
    object StringField8: TStringField
      DisplayLabel = 'N. ECF'
      FieldName = 'NSERIEECF'
      Origin = '"PEDVENDA"."NSERIEECF"'
      ProviderFlags = []
      FixedChar = True
    end
    object IntegerField18: TIntegerField
      DisplayLabel = 'Operador'
      FieldName = 'OPERADOR'
      Origin = '"PEDVENDA"."OPERADOR"'
      ProviderFlags = []
    end
    object CdsPendBalcaoTIPO: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Required = True
      Visible = False
      FixedChar = True
      Size = 3
    end
    object CdsPendBalcaoNUM_NF: TIntegerField
      DisplayLabel = 'Num. NF'
      FieldName = 'NUM_NF'
    end
    object CdsPendBalcaoDATA_NF: TDateTimeField
      DisplayLabel = 'Data NF.'
      FieldName = 'DATA_NF'
    end
    object CdsPendBalcaoTIPO_OS: TStringField
      DisplayLabel = 'Tipo OS'
      FieldName = 'TIPO_OS'
      Size = 10
    end
    object CdsPendBalcaoCOD_CARGA: TIntegerField
      DisplayLabel = 'Carga'
      FieldName = 'COD_CARGA'
    end
    object CdsPendBalcaoVALOR_DESC_AVISTA: TFloatField
      DisplayLabel = 'Desc a Vista'
      FieldName = 'VALOR_DESC_AVISTA'
      DisplayFormat = '#,##0.00'
    end
    object CdsPendBalcaoTOT_PROD: TFloatField
      DisplayLabel = 'Tot Prod'
      FieldName = 'TOT_PROD'
      DisplayFormat = '#,##0.00'
    end
    object CdsPendBalcaoNUM_NFEEXT: TLargeintField
      DisplayLabel = 'Num NF Ext'
      FieldName = 'NUM_NFEEXT'
    end
    object CdsPendBalcaoCOD_NFCE: TIntegerField
      DisplayLabel = 'Cod NFCe'
      FieldName = 'COD_NFCE'
    end
    object CdsPendBalcaoNUM_NFCE: TIntegerField
      DisplayLabel = 'Num NFCe'
      FieldName = 'NUM_NFCE'
    end
    object CdsPendBalcaoDIFCX: TStringField
      Tag = 1
      FieldKind = fkInternalCalc
      FieldName = 'DIFCX'
      Size = 1
    end
    object CdsPendBalcaoOP_NFCE: TIntegerField
      DisplayLabel = 'Operador(NFCe)'
      FieldName = 'OP_NFCE'
    end
    object CdsPendBalcaoID_COMMERCE: TLargeintField
      DisplayLabel = 'Id Ecommerce'
      FieldName = 'ID_COMMERCE'
    end
    object CdsPendBalcaoCX_NFCE: TIntegerField
      DisplayLabel = 'Caixa(NFCe)'
      FieldName = 'CX_NFCE'
    end
    object CdsPendBalcaoLOCAL_VENDA: TStringField
      DisplayLabel = 'Local Venda'
      FieldName = 'LOCAL_VENDA'
      Size = 80
    end
    object CdsPendBalcaoNF_AC_CALCTRIB: TStringField
      Tag = 1
      DisplayLabel = 'NF AC Calc Trib'
      FieldName = 'NF_AC_CALCTRIB'
      Size = 1
    end
    object CdsPendBalcaoCOD_CLI_FAT: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Cli Fat'
      FieldName = 'COD_CLI_FAT'
    end
  end
  object QrBuscasGeral: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IbTransBalcao
    Left = 224
    Top = 390
  end
  object qrBuscas2: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IbTransBalcao
    Left = 568
    Top = 6
  end
  object qrBuscas3: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IbTransBalcao
    Left = 624
    Top = 6
  end
end
