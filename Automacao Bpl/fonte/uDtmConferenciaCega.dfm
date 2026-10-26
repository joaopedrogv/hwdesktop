object dtmConferenciaCega: TdtmConferenciaCega
  OldCreateOrder = False
  Height = 349
  Width = 738
  object transacao: TIBTransaction
    DefaultDatabase = dtmAtivo.bancoHw
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 48
    Top = 24
  end
  object qrBuscas: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    Left = 47
    Top = 72
  end
  object qrConfCegaCabecalho: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select c.*, cl.nome_cliente from conferencia_cega c'
      
        'left join clientes cl on cl.cod_cliente = c.cod_cliente and cl.c' +
        'od_empresa = c.cod_empresa'
      'where c.cod_conferencia = 0 and c.cod_empresa = 0')
    Left = 48
    Top = 128
  end
  object dspConfCegaCabecalho: TDataSetProvider
    DataSet = qrConfCegaCabecalho
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 48
    Top = 176
  end
  object cdsConfCegaCabecalho: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConfCegaCabecalho'
    BeforeOpen = cdsCargaVendaBeforeOpen
    Left = 48
    Top = 224
    object cdsConfCegaCabecalhoCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Codigo Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsConfCegaCabecalhoCOD_CONFERENCIA: TIntegerField
      Tag = 2
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_CONFERENCIA'
      Required = True
    end
    object cdsConfCegaCabecalhoTIPO_CONFERENCIA: TStringField
      DisplayLabel = 'Tipo Confer'#234'ncia'
      DisplayWidth = 5
      FieldName = 'TIPO_CONFERENCIA'
      Required = True
      FixedChar = True
      Size = 5
    end
    object cdsConfCegaCabecalhoSTATUS: TStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      FixedChar = True
      Size = 7
    end
    object cdsConfCegaCabecalhoDATA_FECHAMENTO: TDateTimeField
      DisplayLabel = 'Data Fechamento'
      FieldName = 'DATA_FECHAMENTO'
    end
    object cdsConfCegaCabecalhoCONTAGEM: TStringField
      DisplayLabel = 'Contagem'
      FieldName = 'CONTAGEM'
      FixedChar = True
      Size = 8
    end
    object cdsConfCegaCabecalhoSTATUS_CONTAGEM_ATUAL: TStringField
      DisplayLabel = 'Status Contagem Atual'
      FieldName = 'STATUS_CONTAGEM_ATUAL'
      FixedChar = True
      Size = 7
    end
    object cdsConfCegaCabecalhoDATA_FECHAMENTO_PRIMEIRA: TDateTimeField
      DisplayLabel = 'Data Fechamento Primeira'
      FieldName = 'DATA_FECHAMENTO_PRIMEIRA'
      Visible = False
    end
    object cdsConfCegaCabecalhoCOD_USUARIO_PRIMEIRA: TIntegerField
      DisplayLabel = 'Usu'#225'rio Primeira Contagem'
      FieldName = 'COD_USUARIO_PRIMEIRA'
    end
    object cdsConfCegaCabecalhoDATA_FECHAMENTO_SEGUNDA: TDateTimeField
      DisplayLabel = 'Data Fechamento Segunda'
      FieldName = 'DATA_FECHAMENTO_SEGUNDA'
    end
    object cdsConfCegaCabecalhoCOD_USUARIO_SEGUNDA: TIntegerField
      DisplayLabel = 'Usu'#225'rio Segunda Contagem'
      FieldName = 'COD_USUARIO_SEGUNDA'
    end
    object cdsConfCegaCabecalhoDATA_FECHAMENTO_TERCEIRA: TDateTimeField
      DisplayLabel = 'Data Fechamento Terceira'
      FieldName = 'DATA_FECHAMENTO_TERCEIRA'
    end
    object cdsConfCegaCabecalhoCOD_USUARIO_TERCEIRA: TIntegerField
      DisplayLabel = 'Usu'#225'rio Terceira Contagem'
      FieldName = 'COD_USUARIO_TERCEIRA'
    end
    object cdsConfCegaCabecalhoDATA_INCLUSAO: TDateTimeField
      DisplayLabel = 'Data Inclus'#227'o'
      FieldName = 'DATA_INCLUSAO'
      Required = True
    end
    object cdsConfCegaCabecalhoCOD_USUARIO: TIntegerField
      DisplayLabel = 'Cod. Usu'#225'rio'
      FieldName = 'COD_USUARIO'
      Required = True
    end
    object cdsConfCegaCabecalhoDATA_HORA_FECHAMENTO: TDateTimeField
      Tag = 1
      DisplayLabel = 'Data Hora Fechamento'
      FieldName = 'DATA_HORA_FECHAMENTO'
    end
    object cdsConfCegaCabecalhoDATA_HORA_INCLUSAO: TDateTimeField
      Tag = 1
      DisplayLabel = 'Data Hora Inclusao'
      FieldName = 'DATA_HORA_INCLUSAO'
      Required = True
    end
    object cdsConfCegaCabecalhoDATA_HORA_FECHAMENTO_PRIMEIRA: TDateTimeField
      Tag = 1
      DisplayLabel = 'Data Hora Fechamento Primeira'
      FieldName = 'DATA_HORA_FECHAMENTO_PRIMEIRA'
    end
    object cdsConfCegaCabecalhoDATA_HORA_FECHAMENTO_SEGUNDA: TDateTimeField
      Tag = 1
      DisplayLabel = 'Data Hora Fechamento Segunda'
      FieldName = 'DATA_HORA_FECHAMENTO_SEGUNDA'
    end
    object cdsConfCegaCabecalhoDATA_HORA_FECHAMENTO_TERCEIRA: TDateTimeField
      Tag = 1
      DisplayLabel = 'Data Hora Fechamento Terceira'
      FieldName = 'DATA_HORA_FECHAMENTO_TERCEIRA'
    end
    object cdsConfCegaCabecalhoCOD_CLIENTE: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod. Cliente'
      FieldName = 'COD_CLIENTE'
    end
    object cdsConfCegaCabecalhoNOME_CLIENTE: TStringField
      Tag = 1
      DisplayLabel = 'Nome Cliente'
      FieldName = 'NOME_CLIENTE'
      Size = 35
    end
    object cdsConfCegaCabecalhoNUM_DOC: TIntegerField
      Tag = 1
      DisplayLabel = 'Num Doc'
      FieldName = 'NUM_DOC'
      Required = True
    end
    object cdsConfCegaCabecalhoDATA_DOC: TDateTimeField
      Tag = 1
      DisplayLabel = 'Data Doc'
      FieldName = 'DATA_DOC'
      Required = True
    end
    object cdsConfCegaCabecalhoATIVO: TIntegerField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
      Required = True
    end
    object cdsConfCegaCabecalhoCONTAR_DIVERGENTES: TStringField
      Tag = 1
      DisplayLabel = 'Contar Divergentes'
      FieldName = 'CONTAR_DIVERGENTES'
      FixedChar = True
      Size = 1
    end
    object cdsConfCegaCabecalhoOBSERVACAO: TMemoField
      DisplayLabel = 'Observa'#231#227'o'
      FieldName = 'OBSERVACAO'
      OnGetText = cdsConfCegaCabecalhoOBSERVACAOGetText
      BlobType = ftMemo
      Size = 8
    end
    object cdsConfCegaCabecalhoIDENTIFICACAO: TStringField
      DisplayLabel = 'Identifica'#231#227'o no Mobile'
      DisplayWidth = 50
      FieldName = 'IDENTIFICACAO'
      Size = 50
    end
    object cdsConfCegaCabecalhoCONFERINDO: TStringField
      DisplayLabel = 'Conferindo'
      FieldName = 'CONFERINDO'
      FixedChar = True
      Size = 1
    end
  end
  object dsConfCegaCabecalho: TDataSource
    AutoEdit = False
    DataSet = cdsConfCegaCabecalho
    Left = 48
    Top = 280
  end
  object cdsCargaVenda: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCargaVenda'
    BeforeOpen = cdsCargaVendaBeforeOpen
    Left = 238
    Top = 225
    object cdsCargaVendaSEL: TStringField
      DisplayLabel = 'Sel'
      FieldKind = fkInternalCalc
      FieldName = 'SEL'
      Size = 1
    end
    object cdsCargaVendaNPED: TIntegerField
      DisplayLabel = 'Num REQ'
      FieldName = 'NPED'
      Required = True
    end
    object cdsCargaVendaTIPO: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Required = True
      FixedChar = True
      Size = 3
    end
    object cdsCargaVendaCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsCargaVendaCOD_CLIENTE: TIntegerField
      DisplayLabel = 'Cod. Cliente'
      FieldName = 'COD_CLIENTE'
      Required = True
    end
    object cdsCargaVendaNOME_CLIENTE: TStringField
      DisplayLabel = 'Nome Cliente'
      FieldName = 'NOME_CLIENTE'
      Required = True
      Size = 35
    end
    object cdsCargaVendaCOD_VENDEDOR: TIntegerField
      DisplayLabel = 'Vendedor'
      FieldName = 'COD_VENDEDOR'
      Required = True
    end
    object cdsCargaVendaCOD_COND_PAG: TIntegerField
      FieldName = 'COD_COND_PAG'
    end
    object cdsCargaVendaDATA_FECH: TDateTimeField
      DisplayLabel = 'Data fechamento'
      FieldName = 'DATA_FECH'
    end
    object cdsCargaVendaVALOR_TOTAL: TFloatField
      DisplayLabel = 'Valor total'
      FieldName = 'VALOR_TOTAL'
    end
    object cdsCargaVendaOBS_PED: TStringField
      FieldName = 'OBS_PED'
      Size = 50
    end
    object cdsCargaVendaSTATUS_PED: TStringField
      DisplayLabel = 'Status REQ'
      FieldName = 'STATUS_PED'
      Size = 10
    end
    object cdsCargaVendaTIPV: TStringField
      DisplayLabel = 'Tipo de Venda'
      FieldName = 'TIPV'
      FixedChar = True
      Size = 1
    end
    object cdsCargaVendaNCUPOM: TIntegerField
      DisplayLabel = 'COO Cupom'
      FieldName = 'NCUPOM'
    end
    object cdsCargaVendaNUM_NF: TIntegerField
      DisplayLabel = 'Num NF'
      FieldName = 'NUM_NF'
    end
    object cdsCargaVendaSERIE_NF: TStringField
      DisplayLabel = 'Serie NF'
      FieldName = 'SERIE_NF'
      Size = 5
    end
    object cdsCargaVendaATIVO: TIntegerField
      FieldName = 'ATIVO'
    end
    object cdsCargaVendaCOD_CARGA: TIntegerField
      DisplayLabel = 'Cod Carga'
      FieldName = 'COD_CARGA'
    end
    object cdsCargaVendaIDMOBILE: TIntegerField
      DisplayLabel = 'Id. Mobile'
      FieldName = 'IDMOBILE'
    end
    object cdsCargaVendaCOD_CONTROLE: TIntegerField
      DisplayLabel = 'Cod. Controle'
      FieldName = 'COD_CONTROLE'
    end
  end
  object dsCargaVenda: TDataSource
    AutoEdit = False
    DataSet = cdsCargaVenda
    Left = 238
    Top = 281
  end
  object qrCargaVenda: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      
        'select p.nped, p.tipo ,p.cod_empresa, p.cod_cliente, c.nome_clie' +
        'nte, p.cod_vendedor, p.cod_cond_pag, p.data_fech, p.valor_total,' +
        ' p.obs_ped, p.status_ped, p.tipv, p.ncupom, p.num_nf, p.serie_nf' +
        ', p.ativo, p.cod_carga, p.idmobile, p.cod_controle from pedvenda' +
        ' p '
      'inner join clientes c on c.cod_cliente = p.cod_cliente'
      'where p.cod_carga = 0 and p.tipo = '#39'REQ'#39'  and p.cod_empresa = 0 '
      'and p.ativo = 1')
    Left = 238
    Top = 129
  end
  object dspCargaVenda: TDataSetProvider
    DataSet = qrCargaVenda
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 238
    Top = 177
  end
  object SpIncCodigo: TIBStoredProc
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    StoredProcName = 'INCREMENTA_CODIGO'
    Left = 157
    Top = 25
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
  object qrConfCegaItens: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select co. * from conferencia_cega_itens co'
      
        'left join produtos p on p.grupo_prod = co.grupo_prod and p.cod_p' +
        'rod = co.cod_prod and p.cod_empresa = co.cod_empresa'
      'where co.cod_conferencia = 0 and co.cod_empresa = 0')
    Left = 152
    Top = 129
  end
  object dspConfCegaItens: TDataSetProvider
    DataSet = qrConfCegaItens
    Options = [poAllowMultiRecordUpdates, poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 152
    Top = 177
  end
  object cdsConfCegaItens: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConfCegaItens'
    BeforeOpen = cdsCargaVendaBeforeOpen
    Left = 152
    Top = 225
    object cdsConfCegaItensCOD_CONFERENCIA: TIntegerField
      Tag = 1
      FieldName = 'COD_CONFERENCIA'
      Required = True
    end
    object cdsConfCegaItensCOD_EMPRESA: TIntegerField
      Tag = 1
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsConfCegaItensNITEM: TIntegerField
      DisplayLabel = 'N'#186' Item'
      FieldName = 'NITEM'
      Required = True
    end
    object cdsConfCegaItensDESCR_PROD: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCR_PROD'
      Size = 75
    end
    object cdsConfCegaItensQUANT: TFloatField
      DisplayLabel = 'Quantidade'
      FieldName = 'QUANT'
      DisplayFormat = '##0.0000'
    end
    object cdsConfCegaItensPRIMEIRA_CONTAGEM: TFloatField
      DisplayLabel = '1'#170' Contagem'
      FieldName = 'PRIMEIRA_CONTAGEM'
      DisplayFormat = '##0.0000'
    end
    object cdsConfCegaItensPRIMEIRA_CONTAGEM_DIF: TFloatField
      DisplayLabel = '1'#186' Contagem Dif.'
      FieldName = 'PRIMEIRA_CONTAGEM_DIF'
      DisplayFormat = '##0.0000'
    end
    object cdsConfCegaItensSEGUNDA_CONTAGEM: TFloatField
      DisplayLabel = '2'#186' Contagem'
      FieldName = 'SEGUNDA_CONTAGEM'
      DisplayFormat = '##0.0000'
    end
    object cdsConfCegaItensSEGUNDA_CONTAGEM_DIF: TFloatField
      DisplayLabel = '2'#170' Contagem Dif.'
      FieldName = 'SEGUNDA_CONTAGEM_DIF'
      DisplayFormat = '##0.0000'
    end
    object cdsConfCegaItensTERCEIRA_CONTAGEM: TFloatField
      DisplayLabel = '3'#186' Contagem'
      FieldName = 'TERCEIRA_CONTAGEM'
      DisplayFormat = '##0.0000'
    end
    object cdsConfCegaItensTERCEIRA_CONTAGEM_DIF: TFloatField
      DisplayLabel = '3'#170' Contagem Dif.'
      FieldName = 'TERCEIRA_CONTAGEM_DIF'
    end
    object cdsConfCegaItensUN_PRODUTO: TStringField
      DisplayLabel = 'Unidade de Medida Produtos'
      FieldName = 'UN_PRODUTO'
      FixedChar = True
      Size = 3
    end
    object cdsConfCegaItensUN_NF: TStringField
      DisplayLabel = 'Unidade de Medida NF'
      FieldName = 'UN_NF'
      FixedChar = True
      Size = 3
    end
    object cdsConfCegaItensNUM_FAB_FORNECEDOR: TStringField
      DisplayLabel = 'Numero de Fabrica'#231#227'o'
      FieldName = 'NUM_FAB_FORNECEDOR'
    end
    object cdsConfCegaItensEAN13: TStringField
      FieldName = 'EAN13'
      Size = 13
    end
    object cdsConfCegaItensGRUPO_PROD: TIntegerField
      DisplayLabel = 'Grupo'
      FieldName = 'GRUPO_PROD'
      Required = True
    end
    object cdsConfCegaItensCOD_PROD: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_PROD'
      Required = True
      FixedChar = True
      Size = 6
    end
    object cdsConfCegaItensATIVO: TIntegerField
      Tag = 1
      FieldName = 'ATIVO'
      Required = True
    end
  end
  object qrINf: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      
        'select * from NOTAFISCAL_ITEM where cod_nf = 0 and cod_empresa =' +
        ' 0')
    Left = 320
    Top = 128
  end
  object dspINf: TDataSetProvider
    DataSet = qrINf
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 320
    Top = 176
  end
  object cdsINf: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspINf'
    BeforeOpen = cdsCargaVendaBeforeOpen
    Left = 320
    Top = 224
    object cdsINfCOD_NF: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_NF'
      Required = True
    end
    object cdsINfNITEM: TIntegerField
      DisplayLabel = 'N'#186' Item'
      FieldName = 'NITEM'
      Required = True
    end
    object cdsINfGRUPO_PROD: TIntegerField
      DisplayLabel = 'Grupo'
      FieldName = 'GRUPO_PROD'
    end
    object cdsINfCOD_PROD: TStringField
      DisplayLabel = 'C'#243'd Prod'
      FieldName = 'COD_PROD'
      FixedChar = True
      Size = 6
    end
    object cdsINfCOD_SERVICO: TIntegerField
      DisplayLabel = 'Cod Serv'
      FieldName = 'COD_SERVICO'
    end
    object cdsINfCHASSI: TStringField
      DisplayLabel = 'Chassi'
      FieldName = 'CHASSI'
      FixedChar = True
      Size = 17
    end
    object cdsINfCODIGO_NOP: TFloatField
      DisplayLabel = 'CFOP'
      FieldName = 'CODIGO_NOP'
      DisplayFormat = '##0.'
    end
    object cdsINfDESC_NATOP: TStringField
      DisplayLabel = 'Descr. CFOP'
      DisplayWidth = 128
      FieldName = 'DESC_NATOP'
      Size = 128
    end
    object cdsINfCST: TStringField
      FieldName = 'CST'
      FixedChar = True
      Size = 3
    end
    object cdsINfCSOSN: TStringField
      FieldName = 'CSOSN'
      FixedChar = True
      Size = 3
    end
    object cdsINfREFERENCIA: TStringField
      DisplayLabel = 'Ref'
      FieldName = 'REFERENCIA'
      FixedChar = True
      Size = 3
    end
    object cdsINfNUM_FAB_PROD: TStringField
      DisplayLabel = 'Num Fab prod'
      FieldName = 'NUM_FAB_PROD'
      FixedChar = True
    end
    object cdsINfDESCRICAO_ITEM: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO_ITEM'
      Size = 75
    end
    object cdsINfNCM: TStringField
      DisplayLabel = 'NCM/SH'
      FieldName = 'NCM'
      Size = 8
    end
    object cdsINfDATA_VALIDADE: TDateTimeField
      DisplayLabel = 'Data Validade'
      FieldName = 'DATA_VALIDADE'
    end
    object cdsINfQUANTIDADE: TFloatField
      DisplayLabel = 'Qtde'
      FieldName = 'QUANTIDADE'
    end
    object cdsINfVALOR_UNITARIO: TFloatField
      DisplayLabel = 'Valor Unit'
      FieldName = 'VALOR_UNITARIO'
    end
    object cdsINfVALOR_TOTAL: TFloatField
      DisplayLabel = 'Valor Tot'
      FieldName = 'VALOR_TOTAL'
    end
    object cdsINfALIQ_ICM: TFloatField
      DisplayLabel = '% ICMS'
      FieldName = 'ALIQ_ICM'
    end
    object cdsINfBASE_ICM: TFloatField
      DisplayLabel = 'Base ICMS'
      FieldName = 'BASE_ICM'
    end
    object cdsINfVALOR_ICM: TFloatField
      DisplayLabel = 'Valor ICMS'
      FieldName = 'VALOR_ICM'
    end
    object cdsINfALIQ_ICMSUB: TFloatField
      DisplayLabel = '% ICMS Sub'
      FieldName = 'ALIQ_ICMSUB'
    end
    object cdsINfBASE_ICMSUB: TFloatField
      DisplayLabel = 'Base ICMS Sub'
      FieldName = 'BASE_ICMSUB'
    end
    object cdsINfVALOR_ICMSUB: TFloatField
      DisplayLabel = 'Valor ICMS Sub'
      FieldName = 'VALOR_ICMSUB'
    end
    object cdsINfPERC_RED_PROD_SUB: TFloatField
      DisplayLabel = '% Red ICMS ST'
      FieldName = 'PERC_RED_PROD_SUB'
    end
    object cdsINfBASE_ICMANT_SUB: TFloatField
      DisplayLabel = 'Base ICMS Ant'
      FieldName = 'BASE_ICMANT_SUB'
    end
    object cdsINfVALOR_ICMANT_SUB: TFloatField
      DisplayLabel = 'Valor ICMS Ant'
      FieldName = 'VALOR_ICMANT_SUB'
    end
    object cdsINfALIQ_IPI: TFloatField
      DisplayLabel = '% IPI'
      FieldName = 'ALIQ_IPI'
    end
    object cdsINfVALOR_IPI: TFloatField
      DisplayLabel = 'Valor IPI'
      FieldName = 'VALOR_IPI'
    end
    object cdsINfPERC_RED_PROD: TFloatField
      DisplayLabel = '% Red Base'
      FieldName = 'PERC_RED_PROD'
    end
    object cdsINfPERC_DESCONTO: TFloatField
      DisplayLabel = 'Desconto %'
      FieldName = 'PERC_DESCONTO'
    end
    object cdsINfVALOR_DESCONTO_PERC: TFloatField
      DisplayLabel = 'Desconto $'
      FieldName = 'VALOR_DESCONTO_PERC'
      DisplayFormat = '##0.0000'
    end
    object cdsINfRATEIO_DESCONTO: TFloatField
      DisplayLabel = 'Rateio Desc $'
      FieldName = 'RATEIO_DESCONTO'
      DisplayFormat = '##0.0000'
    end
    object cdsINfMVA: TFloatField
      FieldName = 'MVA'
    end
    object cdsINfRATEIO_SEGURO: TFloatField
      DisplayLabel = 'Seguro'
      FieldName = 'RATEIO_SEGURO'
      DisplayFormat = '##0.0000'
    end
    object cdsINfRATEIO_OUTDESP: TFloatField
      DisplayLabel = 'Out Despesas'
      FieldName = 'RATEIO_OUTDESP'
      DisplayFormat = '##0.0000'
    end
    object cdsINfRATEIO_FRETE: TFloatField
      DisplayLabel = 'Frete'
      FieldName = 'RATEIO_FRETE'
      DisplayFormat = '##0.0000'
    end
    object cdsINfRATEIO_ACRES_FIN: TFloatField
      DisplayLabel = 'Acresc Finan'
      FieldName = 'RATEIO_ACRES_FIN'
      DisplayFormat = '##0.0000'
    end
    object cdsINfRATEIO_DESP_PF: TFloatField
      DisplayLabel = 'Desp PF'
      FieldName = 'RATEIO_DESP_PF'
      DisplayFormat = '##0.0000'
    end
    object cdsINfPERC_FRETE: TFloatField
      DisplayLabel = '% Frete'
      FieldName = 'PERC_FRETE'
    end
    object cdsINfPRCTB_ITEM: TFloatField
      DisplayLabel = 'MarkUp'
      FieldName = 'PRCTB_ITEM'
    end
    object cdsINfPRCTB_ITEMA: TFloatField
      DisplayLabel = 'MarkUp Atacado'
      FieldName = 'PRCTB_ITEMA'
    end
    object cdsINfPREC_CUS_CNT: TFloatField
      DisplayLabel = 'Custo $'
      FieldName = 'PREC_CUS_CNT'
    end
    object cdsINfPREC_VND_PROD: TFloatField
      DisplayLabel = 'Pre'#231'o Venda'
      FieldName = 'PREC_VND_PROD'
    end
    object cdsINfPREC_VND_PRODA: TFloatField
      DisplayLabel = 'Pre'#231'o Venda Atacado'
      FieldName = 'PREC_VND_PRODA'
    end
    object cdsINfPREC_CUS_REP: TFloatField
      DisplayLabel = 'Custo Reposi'#231#227'o $'
      FieldName = 'PREC_CUS_REP'
    end
    object cdsINfPREC_CUSM_PROD: TFloatField
      DisplayLabel = 'Custo M'#233'dio $'
      FieldName = 'PREC_CUSM_PROD'
    end
    object cdsINfPMARGFIM: TFloatField
      DisplayLabel = '% Margem'
      FieldName = 'PMARGFIM'
      DisplayFormat = '##0.0000'
    end
    object cdsINfPMARGFIM_A: TFloatField
      DisplayLabel = '% Margem Atacado'
      FieldName = 'PMARGFIM_A'
      DisplayFormat = '##0.0000'
    end
    object cdsINfQTDEMB: TFloatField
      DisplayLabel = 'Qtde Itens p/ Emb'
      FieldName = 'QTDEMB'
    end
    object cdsINfQTDEMBREC: TFloatField
      DisplayLabel = 'Qtde de Emb'
      FieldName = 'QTDEMBREC'
    end
    object cdsINfVLREMBNF: TFloatField
      DisplayLabel = 'Valor da Emb'
      FieldName = 'VLREMBNF'
    end
    object cdsINfVLBRUREAL: TFloatField
      FieldName = 'VLBRUREAL'
    end
    object cdsINfPDESC_R: TFloatField
      FieldName = 'PDESC_R'
    end
    object cdsINfVLREMBNFR: TFloatField
      FieldName = 'VLREMBNFR'
    end
    object cdsINfVLUN_B_NFE: TFloatField
      FieldName = 'VLUN_B_NFE'
    end
    object cdsINfVLISENTO: TFloatField
      DisplayLabel = 'Isento $'
      FieldName = 'VLISENTO'
    end
    object cdsINfVLOUTRAS: TFloatField
      DisplayLabel = 'Outras $'
      FieldName = 'VLOUTRAS'
    end
    object cdsINfVLN_TRIB: TFloatField
      DisplayLabel = 'N'#227'o Trib $'
      FieldName = 'VLN_TRIB'
    end
    object cdsINfCAMP_ENTEST: TStringField
      DisplayLabel = 'Ent Estoque'
      FieldName = 'CAMP_ENTEST'
      FixedChar = True
      Size = 1
    end
    object cdsINfSEQ_DEVOLUCAO: TIntegerField
      FieldName = 'SEQ_DEVOLUCAO'
    end
    object cdsINfMNF: TStringField
      FieldName = 'MNF'
      FixedChar = True
      Size = 1
    end
    object cdsINfALTERA_ESTOQUE_CFOP: TStringField
      DisplayLabel = 'Alterou Estoque'
      FieldName = 'ALTERA_ESTOQUE_CFOP'
      FixedChar = True
      Size = 1
    end
    object cdsINfNPED: TIntegerField
      DisplayLabel = 'N'#186' Venda'
      FieldName = 'NPED'
    end
    object cdsINfTIPO_PED: TStringField
      DisplayLabel = 'Tipo Venda'
      FieldName = 'TIPO_PED'
      FixedChar = True
      Size = 3
    end
    object cdsINfTIPO_ITEM: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO_ITEM'
      FixedChar = True
      Size = 1
    end
    object cdsINfNITEM_PED: TIntegerField
      DisplayLabel = 'N'#186' Item Venda'
      FieldName = 'NITEM_PED'
    end
    object cdsINfCOD_EMPRESA: TIntegerField
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsINfBASE_IPI: TFloatField
      DisplayLabel = 'Base IPI'
      FieldName = 'BASE_IPI'
    end
    object cdsINfPERC_RED_IPI: TFloatField
      DisplayLabel = '% Red IPI'
      FieldName = 'PERC_RED_IPI'
    end
    object cdsINfPERMITIR_DESCONTO: TStringField
      DisplayLabel = 'Permitir Desconto'
      FieldName = 'PERMITIR_DESCONTO'
      FixedChar = True
      Size = 1
    end
    object cdsINfALIQ_ICM_SIMPLES: TFloatField
      DisplayLabel = '%ICMS Simples'
      FieldName = 'ALIQ_ICM_SIMPLES'
      Visible = False
    end
    object cdsINfBASE_ICM_SIMPLES: TFloatField
      DisplayLabel = 'Base ICM Simples'
      FieldName = 'BASE_ICM_SIMPLES'
      Visible = False
    end
    object cdsINfVALOR_ICM_SIMPLES: TFloatField
      DisplayLabel = 'Valor ICM Simples'
      FieldName = 'VALOR_ICM_SIMPLES'
      Visible = False
    end
    object cdsINfALIQ_ISS: TFloatField
      DisplayLabel = 'Aliq ISS'
      FieldName = 'ALIQ_ISS'
    end
    object cdsINfBASE_ISS: TFloatField
      DisplayLabel = 'Base ISS'
      FieldName = 'BASE_ISS'
    end
    object cdsINfVALOR_ISS: TFloatField
      DisplayLabel = 'Valor ISS'
      FieldName = 'VALOR_ISS'
    end
    object cdsINfTERMINAL: TIntegerField
      DisplayLabel = 'Terminal ECF'
      FieldName = 'TERMINAL'
    end
    object cdsINfNCUPOM: TIntegerField
      DisplayLabel = 'N'#186' Cupom'
      FieldName = 'NCUPOM'
    end
    object cdsINfNSERIEECF: TStringField
      DisplayLabel = 'N'#186' S'#233'rie ECF'
      FieldName = 'NSERIEECF'
    end
    object cdsINfALTERA_CUSTO_CFOP: TStringField
      DisplayLabel = 'Altera Custo'
      FieldName = 'ALTERA_CUSTO_CFOP'
      FixedChar = True
      Size = 1
    end
    object cdsINfDESCRICAO_ITEM_OUTRAS: TMemoField
      FieldName = 'DESCRICAO_ITEM_OUTRAS'
      BlobType = ftMemo
      Size = 8
    end
    object cdsINfECF: TStringField
      DisplayLabel = 'ECF?'
      FieldName = 'ECF'
      FixedChar = True
      Size = 1
    end
    object cdsINfPESO_B: TFloatField
      DisplayLabel = 'Peso Bruto'
      FieldName = 'PESO_B'
    end
    object cdsINfPESO_L: TFloatField
      DisplayLabel = 'Peso Liquido'
      FieldName = 'PESO_L'
    end
    object cdsINfDATA_CUPOM: TDateTimeField
      DisplayLabel = 'Data Cupom'
      FieldName = 'DATA_CUPOM'
    end
    object cdsINfVALOR_DIF: TFloatField
      DisplayLabel = 'Dif ICMS/Compl ST'
      FieldName = 'VALOR_DIF'
    end
    object cdsINfINDTOT: TSmallintField
      FieldName = 'INDTOT'
    end
    object cdsINfMODBCST: TIntegerField
      FieldName = 'MODBCST'
    end
    object cdsINfMODBC: TIntegerField
      FieldName = 'MODBC'
    end
    object cdsINfVALOR_ICM_STDES: TFloatField
      FieldName = 'VALOR_ICM_STDES'
    end
    object cdsINfVL_MULTP: TFloatField
      FieldName = 'VL_MULTP'
    end
    object cdsINfPR_CUSC_PROD: TFloatField
      FieldName = 'PR_CUSC_PROD'
    end
    object cdsINfPREC_CUS_R: TFloatField
      FieldName = 'PREC_CUS_R'
    end
    object cdsINfCST_PIS: TStringField
      DisplayLabel = 'CST PIS'
      FieldName = 'CST_PIS'
      FixedChar = True
      Size = 2
    end
    object cdsINfALIQ_PIS: TFloatField
      DisplayLabel = 'Aliq PIS'
      FieldName = 'ALIQ_PIS'
      DisplayFormat = '#0.0000'
    end
    object cdsINfVALOR_PIS: TFloatField
      DisplayLabel = 'Valor PIS'
      FieldName = 'VALOR_PIS'
    end
    object cdsINfCST_COFINS: TStringField
      DisplayLabel = 'CST COFINS'
      FieldName = 'CST_COFINS'
      FixedChar = True
      Size = 2
    end
    object cdsINfALIQ_COFINS: TFloatField
      DisplayLabel = 'Aliq COFINS'
      FieldName = 'ALIQ_COFINS'
      DisplayFormat = '#0.0000'
    end
    object cdsINfVALOR_COFINS: TFloatField
      DisplayLabel = 'Valor COFINS'
      FieldName = 'VALOR_COFINS'
    end
    object cdsINfNUM_FAB_FORNECEDOR: TStringField
      DisplayLabel = 'Num Fab Fornecedor'
      FieldName = 'NUM_FAB_FORNECEDOR'
    end
    object cdsINfCONSUMO: TStringField
      DisplayLabel = 'Consumo'
      FieldName = 'CONSUMO'
      FixedChar = True
      Size = 1
    end
    object cdsINfPISCOFINS: TFloatField
      FieldName = 'PISCOFINS'
    end
    object cdsINfCST_IPI: TStringField
      DisplayLabel = 'CST IPI'
      FieldName = 'CST_IPI'
      FixedChar = True
      Size = 2
    end
    object cdsINfBASE_ICMSUB_ANT: TFloatField
      DisplayLabel = 'Base ICM Ant'
      FieldName = 'BASE_ICMSUB_ANT'
    end
    object cdsINfVALOR_ICMSUB_ANT: TFloatField
      DisplayLabel = 'Valor ICM Ant'
      FieldName = 'VALOR_ICMSUB_ANT'
    end
    object cdsINfIMPORT_XML: TStringField
      DisplayLabel = 'Import Xml'
      FieldName = 'IMPORT_XML'
      FixedChar = True
      Size = 1
    end
    object cdsINfBASE_PIS: TFloatField
      DisplayLabel = 'Base PIS'
      FieldName = 'BASE_PIS'
    end
    object cdsINfBASE_COFINS: TFloatField
      DisplayLabel = 'Base COFINS'
      FieldName = 'BASE_COFINS'
    end
    object cdsINfQUANT_BC_PIS: TFloatField
      DisplayLabel = 'Qtde Base PIS'
      FieldName = 'QUANT_BC_PIS'
    end
    object cdsINfALIQ_PIS_QUANT: TFloatField
      DisplayLabel = 'Aliq PIS Qtde'
      FieldName = 'ALIQ_PIS_QUANT'
      DisplayFormat = '#0.00'
    end
    object cdsINfQUANT_BC_COFINS: TFloatField
      DisplayLabel = 'Qtde Base COFINS'
      FieldName = 'QUANT_BC_COFINS'
    end
    object cdsINfALIQ_COFINS_QUANT: TFloatField
      DisplayLabel = 'Aliq COFINS Qtde'
      FieldName = 'ALIQ_COFINS_QUANT'
      DisplayFormat = '#0.00'
    end
    object cdsINfANTEC_TRIB: TStringField
      FieldName = 'ANTEC_TRIB'
      FixedChar = True
      Size = 1
    end
    object cdsINfPREC_30_PROD: TFloatField
      DisplayLabel = 'Pre'#231'o 30 Dias'
      FieldName = 'PREC_30_PROD'
      DisplayFormat = '##0.00'
    end
    object cdsINfPREC_60_PROD: TFloatField
      DisplayLabel = 'Pre'#231'o 60 Dias'
      FieldName = 'PREC_60_PROD'
      DisplayFormat = '##0.00'
    end
    object cdsINfPREC_90_PROD: TFloatField
      DisplayLabel = 'Pre'#231'o 90 Dias'
      FieldName = 'PREC_90_PROD'
      DisplayFormat = '##0.00'
    end
    object cdsINfSELG: TStringField
      DisplayLabel = 'Sel G'
      FieldKind = fkInternalCalc
      FieldName = 'SELG'
      Size = 1
    end
    object cdsINfNAT_REC: TStringField
      DisplayLabel = 'Natureza Receita PIS/COFINS'
      FieldName = 'NAT_REC'
      Size = 3
    end
    object cdsINfCOD_NF_DEV: TIntegerField
      DisplayLabel = 'C'#243'digo da NF Devolvida'
      FieldName = 'COD_NF_DEV'
    end
    object cdsINfNITEM_DEV: TSmallintField
      DisplayLabel = 'N'#186' Item na NF devolvida'
      FieldName = 'NITEM_DEV'
    end
    object cdsINfBASE_II: TFloatField
      DisplayLabel = 'Base do II'
      FieldName = 'BASE_II'
      DisplayFormat = '#0.00'
    end
    object cdsINfVALOR_DESPADU_II: TFloatField
      DisplayLabel = 'Valor Despesas Aduaneiras II'
      FieldName = 'VALOR_DESPADU_II'
      DisplayFormat = '#0.00'
    end
    object cdsINfVALOR_II: TFloatField
      DisplayLabel = 'Valor do II'
      FieldName = 'VALOR_II'
      DisplayFormat = '#0.00'
    end
    object cdsINfVALOR_IOF_II: TFloatField
      DisplayLabel = 'IOF sobre II'
      FieldName = 'VALOR_IOF_II'
      DisplayFormat = '#0.00'
    end
    object cdsINfALIQ_PIS_ST: TFloatField
      FieldName = 'ALIQ_PIS_ST'
    end
    object cdsINfALIQ_COFINS_ST: TFloatField
      FieldName = 'ALIQ_COFINS_ST'
    end
    object cdsINfBASE_PIS_ST: TFloatField
      FieldName = 'BASE_PIS_ST'
    end
    object cdsINfBASE_COFINS_ST: TFloatField
      FieldName = 'BASE_COFINS_ST'
    end
    object cdsINfVALOR_PIS_ST: TFloatField
      FieldName = 'VALOR_PIS_ST'
    end
    object cdsINfVALOR_COFINS_ST: TFloatField
      FieldName = 'VALOR_COFINS_ST'
    end
    object cdsINfSEQID_DEVOLUCAO: TIntegerField
      FieldName = 'SEQID_DEVOLUCAO'
    end
    object cdsINfNITEM_REM_VFE: TIntegerField
      FieldName = 'NITEM_REM_VFE'
    end
    object cdsINfCOD_GRADE: TIntegerField
      DisplayLabel = 'Cod Grade'
      FieldName = 'COD_GRADE'
    end
    object cdsINfCOMB_CPRODANP: TStringField
      FieldName = 'COMB_CPRODANP'
      Size = 9
    end
    object cdsINfCOMB_CODIF: TStringField
      FieldName = 'COMB_CODIF'
      Size = 21
    end
    object cdsINfCOMB_QTEMP: TFloatField
      FieldName = 'COMB_QTEMP'
    end
    object cdsINfCOMB_UFCONS: TStringField
      FieldName = 'COMB_UFCONS'
      Size = 2
    end
    object cdsINfCOMB_CIDE_QBCPROD: TFloatField
      FieldName = 'COMB_CIDE_QBCPROD'
    end
    object cdsINfCOMB_CIDE_VALIQPROD: TFloatField
      FieldName = 'COMB_CIDE_VALIQPROD'
    end
    object cdsINfCOMB_CIDE_VCIDE: TFloatField
      FieldName = 'COMB_CIDE_VCIDE'
    end
    object cdsINfVTOTTRIB: TFloatField
      DisplayLabel = 'Tributos(De Olho no Imposto)'
      FieldName = 'VTOTTRIB'
    end
    object cdsINfXPED_COMPRA: TStringField
      DisplayLabel = 'N'#176' Pedido de Compra do Cliente'
      FieldName = 'XPED_COMPRA'
      Size = 15
    end
    object cdsINfNITEMPED_COMPRA: TIntegerField
      DisplayLabel = 'N'#176' Item no Pedido de Compra do Cliente'
      FieldName = 'NITEMPED_COMPRA'
    end
    object cdsINfUNIDADE_NF: TStringField
      FieldName = 'UNIDADE_NF'
      FixedChar = True
      Size = 3
    end
    object cdsINfEAN13: TStringField
      FieldName = 'EAN13'
      FixedChar = True
      Size = 13
    end
  end
  object dsProd: TDataSource
    DataSet = cdsProd
    Left = 400
    Top = 278
  end
  object cdsProd: TClientDataSet
    Aggregates = <>
    AutoCalcFields = False
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspProd'
    BeforeOpen = cdsCargaVendaBeforeOpen
    Left = 400
    Top = 222
  end
  object dspProd: TDataSetProvider
    DataSet = qrProd
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 400
    Top = 174
  end
  object qrProd: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      
        'select * from produtos where grupo_prod = 0 and cod_prod = 0 and' +
        ' cod_empresa = 0')
    Left = 400
    Top = 128
  end
  object dsCodBarra: TDataSource
    DataSet = cdsCodBarra
    Left = 472
    Top = 278
  end
  object cdsCodBarra: TClientDataSet
    Aggregates = <>
    AutoCalcFields = False
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspCodBarra'
    BeforeOpen = cdsCargaVendaBeforeOpen
    Left = 472
    Top = 222
  end
  object dspCodBarra: TDataSetProvider
    DataSet = qrCodBarra
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 472
    Top = 174
  end
  object qrCodBarra: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      
        'select * from cod_barra where grupo_prod = 0 and cod_prod = 0 an' +
        'd cod_empresa = 0')
    Left = 472
    Top = 128
  end
  object dspCodigoFornecedor: TDataSetProvider
    DataSet = qrCodigoFornecedor
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 560
    Top = 174
  end
  object qrCodigoFornecedor: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      
        'select * from codigo_fornecedor cf where cf.cod_fornecedor = 0 a' +
        'nd cf.grupo_prod = 0 and cf.cod_prod = 0 and cf.cod_empresa = 0')
    Left = 560
    Top = 128
  end
  object cdsCodigoFornecedor: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspCodigoFornecedor'
    BeforeOpen = cdsCargaVendaBeforeOpen
    Left = 560
    Top = 224
    object cdsCodigoFornecedorCOD_FORNECEDOR: TIntegerField
      FieldName = 'COD_FORNECEDOR'
      Required = True
    end
    object cdsCodigoFornecedorGRUPO_PROD: TIntegerField
      FieldName = 'GRUPO_PROD'
      Required = True
    end
    object cdsCodigoFornecedorCOD_PROD: TStringField
      FieldName = 'COD_PROD'
      Required = True
      FixedChar = True
      Size = 6
    end
    object cdsCodigoFornecedorCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsCodigoFornecedorNUM_FAB_FORNECEDOR: TStringField
      DisplayWidth = 60
      FieldName = 'NUM_FAB_FORNECEDOR'
      Required = True
      Size = 60
    end
    object cdsCodigoFornecedorATIVO: TIntegerField
      FieldName = 'ATIVO'
    end
    object cdsCodigoFornecedorDATA_CADASTRO: TDateTimeField
      FieldName = 'DATA_CADASTRO'
    end
    object cdsCodigoFornecedorDATA_MODIFICACAO: TDateTimeField
      FieldName = 'DATA_MODIFICACAO'
    end
    object cdsCodigoFornecedorCOD_GRADE: TIntegerField
      FieldName = 'COD_GRADE'
    end
    object cdsCodigoFornecedorSEQID: TIntegerField
      FieldName = 'SEQID'
    end
  end
  object qrBuscas2: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    Left = 159
    Top = 72
  end
  object dsLoteNF: TDataSource
    AutoEdit = False
    DataSet = qrBuscas
    Left = 150
    Top = 281
  end
end
