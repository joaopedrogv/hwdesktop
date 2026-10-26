object dtmDAVF: TdtmDAVF
  OldCreateOrder = False
  Height = 564
  Width = 871
  object transacaoRet: TIBTransaction
    DefaultDatabase = dtmAtivo.bancoHw
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 96
    Top = 8
  end
  object qrBuscas: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacaoRet
    Left = 168
    Top = 7
  end
  object SpIncCodigo: TIBStoredProc
    Database = dtmAtivo.bancoHw
    Transaction = transacaoRet
    StoredProcName = 'INCREMENTA_CODIGO'
    Left = 232
    Top = 8
  end
  object qrDAVF: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacaoRet
    SQL.Strings = (
      
        'select pd.nped,pd.tipo,pd.cod_cliente,c.nome_cliente,pd.cod_vend' +
        'edor, pd.data_fech,pd.valor_total,pd.desconto,'
      'pd.acrescimo,pd.nprevenda,pd.ncupom'
      'from pedvenda pd'
      
        'inner join clientes c on c.cod_cliente = pd.cod_cliente and c.co' +
        'd_empresa = pd.cod_empresa')
    Left = 30
    Top = 64
  end
  object dspDAVF: TDataSetProvider
    DataSet = qrDAVF
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 30
    Top = 117
  end
  object cdsDAVF: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDAVF'
    BeforeOpen = cdsDAVFBeforeOpen
    Left = 30
    Top = 172
    object cdsDAVFNPED: TIntegerField
      DisplayLabel = 'N'#186' Venda'
      FieldName = 'NPED'
      Origin = '"PEDVENDA"."NPED"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsDAVFTIPO: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Origin = '"PEDVENDA"."TIPO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      FixedChar = True
      Size = 3
    end
    object cdsDAVFCOD_CLIENTE: TIntegerField
      FieldName = 'COD_CLIENTE'
      Origin = '"PEDVENDA"."COD_CLIENTE"'
      Required = True
      Visible = False
    end
    object cdsDAVFNOME_CLIENTE: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'NOME_CLIENTE'
      Origin = '"CLIENTES"."NOME_CLIENTE"'
      Required = True
      Size = 35
    end
    object cdsDAVFCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
      Origin = '"PEDVENDA"."COD_VENDEDOR"'
      Required = True
      Visible = False
    end
    object cdsDAVFVALOR_TOTAL: TFloatField
      DisplayLabel = 'Valor Venda'
      FieldName = 'VALOR_TOTAL'
      Origin = '"PEDVENDA"."VALOR_TOTAL"'
      currency = True
    end
    object cdsDAVFDESCONTO: TFloatField
      DisplayLabel = 'Desconto'
      FieldName = 'DESCONTO'
      Origin = '"PEDVENDA"."DESCONTO"'
      currency = True
    end
    object cdsDAVFACRESCIMO: TFloatField
      DisplayLabel = 'Acr'#233'scimo'
      FieldName = 'ACRESCIMO'
      Origin = '"PEDVENDA"."ACRESCIMO"'
      currency = True
    end
    object cdsDAVFNPREVENDA: TIntegerField
      DisplayLabel = 'N'#186' DAV'
      FieldName = 'NPREVENDA'
      Origin = '"PEDVENDA"."NPREVENDA"'
    end
    object cdsDAVFDATA_FECH: TDateTimeField
      DisplayLabel = 'Data Fechamentos'
      FieldName = 'DATA_FECH'
      Origin = '"PEDVENDA"."DATA_FECH"'
    end
    object cdsDAVFNCUPOM: TIntegerField
      FieldName = 'NCUPOM'
    end
    object cdsDAVFCOO_IMPRESSAO: TIntegerField
      FieldName = 'COO_IMPRESSAO'
    end
    object cdsDAVFCOO_CONTA_CLIENTE: TIntegerField
      FieldName = 'COO_CONTA_CLIENTE'
    end
    object cdsDAVFCER_CONTA_CLIENTE: TIntegerField
      FieldName = 'CER_CONTA_CLIENTE'
    end
    object cdsDAVFTIPV: TStringField
      DisplayLabel = 'Tip Vnd'
      FieldName = 'TIPV'
      Size = 1
    end
  end
  object dsDAVF: TDataSource
    AutoEdit = False
    DataSet = cdsDAVF
    Left = 30
    Top = 223
  end
  object qrItDAVF: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacaoRet
    SQL.Strings = (
      
        'select '#39'P'#39' tipo ,pp.nped,pp.cod_prod,pp.grupo_prod grupoOuServ,p' +
        'p.cod_empresa, pp.num_fab_prod,'
      
        'pp.quant_ped_item qtde, pp.vlun_ped_item vl_unit,pp.descr_prod_p' +
        'ed descr,p.descr_prod_red d_red,'
      
        'pp.rateio_desc,pp.rateio_acresc,p.csdecqtde,p.csdecvlunt, pp.cod' +
        '_grade, pp.status, pp.nitem'
      'from pedvenda_prod pp'
      
        'inner join produtos p on p.grupo_prod = pp.grupo_prod and p.cod_' +
        'prod = pp.cod_prod'
      'and p.cod_empresa = pp.cod_empresa'
      'union'
      
        'select '#39'S'#39' tipo, ps.nped, ps.cod_servico cod_prod, ps.cod_servic' +
        'o grupoOuServ,ps.cod_empresa,ps.cod_servico num_fab_prod,'
      
        'ps.quant_serv_ped qtde,ps.valor_un_serv vl_unit,ps.desc_serv_ped' +
        ' descr,'#39#39' d_red,'
      
        'ps.rateio_desc,ps.rateio_acresc,2 csdecqtde,2 csdcvlunt, 0 cod_g' +
        'rade, ps.status, ps.nitem from pedvenda_serv ps')
    Left = 118
    Top = 64
  end
  object dspItDAVF: TDataSetProvider
    DataSet = qrItDAVF
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 118
    Top = 117
  end
  object cdsItDAVF: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspItDAVF'
    BeforeOpen = cdsDAVFBeforeOpen
    Left = 118
    Top = 172
    object cdsItDAVFTIPO: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      FixedChar = True
      Size = 1
    end
    object cdsItDAVFNPED: TIntegerField
      FieldName = 'NPED'
      Required = True
      Visible = False
    end
    object cdsItDAVFCOD_PROD: TStringField
      DisplayLabel = 'C'#243'digo Produto'
      FieldName = 'COD_PROD'
      Required = True
      FixedChar = True
      Size = 6
    end
    object cdsItDAVFGRUPOOUSERV: TIntegerField
      DisplayLabel = 'Grupo ou Servi'#231'o'
      FieldName = 'GRUPOOUSERV'
      Required = True
    end
    object cdsItDAVFCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
      Visible = False
    end
    object cdsItDAVFNUM_FAB_PROD: TStringField
      DisplayLabel = 'C'#243'digo Barras'
      FieldName = 'NUM_FAB_PROD'
      FixedChar = True
    end
    object cdsItDAVFQTDE: TFloatField
      DisplayLabel = 'Quantidade'
      FieldName = 'QTDE'
    end
    object cdsItDAVFVL_UNIT: TFloatField
      DisplayLabel = 'Valor Unit'
      FieldName = 'VL_UNIT'
      currency = True
    end
    object cdsItDAVFDESCR: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCR'
      Size = 60
    end
    object cdsItDAVFD_RED: TStringField
      DisplayLabel = 'Descri'#231#227'o Cupom'
      FieldName = 'D_RED'
      Size = 35
    end
    object cdsItDAVFRATEIO_DESC: TFloatField
      DisplayLabel = 'Desconto'
      FieldName = 'RATEIO_DESC'
      currency = True
    end
    object cdsItDAVFRATEIO_ACRESC: TFloatField
      DisplayLabel = 'Acr'#233'scimo'
      FieldName = 'RATEIO_ACRESC'
      currency = True
    end
    object cdsItDAVFCSDECQTDE: TStringField
      FieldName = 'CSDECQTDE'
      Visible = False
      Size = 11
    end
    object cdsItDAVFCSDECVLUNT: TStringField
      FieldName = 'CSDECVLUNT'
      Visible = False
      Size = 11
    end
    object cdsItDAVFCOD_GRADE: TIntegerField
      DisplayLabel = 'Grade'
      FieldName = 'COD_GRADE'
    end
    object cdsItDAVFSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 10
    end
    object cdsItDAVFNITEM: TIntegerField
      FieldName = 'NITEM'
    end
    object cdsItDAVFPCUST_MC: TFloatField
      FieldName = 'PCUST_MC'
    end
    object cdsItDAVFCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
    end
  end
  object dsItDAVF: TDataSource
    AutoEdit = False
    DataSet = cdsItDAVF
    Left = 118
    Top = 223
  end
  object qrFrmPg: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacaoRet
    SQL.Strings = (
      'select * from FORMPAGAMENTO')
    Left = 200
    Top = 64
  end
  object dspFrmPg: TDataSetProvider
    DataSet = qrFrmPg
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 200
    Top = 112
  end
  object cdsFrmPg: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFrmPg'
    BeforeOpen = cdsDAVFBeforeOpen
    Left = 200
    Top = 168
    object cdsFrmPgCOD_CONTROLE: TIntegerField
      FieldName = 'COD_CONTROLE'
    end
    object cdsFrmPgVALORDOC: TFloatField
      FieldName = 'VALORDOC'
    end
  end
  object dsFrmPg: TDataSource
    DataSet = cdsFrmPg
    Left = 200
    Top = 216
  end
  object qrPV: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacaoRet
    SQL.Strings = (
      'select * from PEDVENDA')
    Left = 388
    Top = 68
  end
  object dspPV: TDataSetProvider
    DataSet = qrPV
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 384
    Top = 120
  end
  object cdsPV: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPV'
    BeforeOpen = cdsDAVFBeforeOpen
    Left = 384
    Top = 176
    object cdsPVNPED: TIntegerField
      FieldName = 'NPED'
      Required = True
    end
    object cdsPVCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsPVCOD_CLIENTE: TIntegerField
      FieldName = 'COD_CLIENTE'
      Required = True
    end
    object cdsPVCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
      Required = True
    end
    object cdsPVCOD_COND_PAG: TIntegerField
      FieldName = 'COD_COND_PAG'
      Required = True
    end
    object cdsPVTIPO: TStringField
      FieldName = 'TIPO'
      Required = True
      FixedChar = True
      Size = 3
    end
    object cdsPVN_MOV_CXL: TIntegerField
      FieldName = 'N_MOV_CXL'
    end
    object cdsPVDIA_CXL: TDateTimeField
      FieldName = 'DIA_CXL'
    end
    object cdsPVDATA_PED: TDateTimeField
      FieldName = 'DATA_PED'
    end
    object cdsPVDATA_FECH: TDateTimeField
      FieldName = 'DATA_FECH'
    end
    object cdsPVDATVENC: TDateTimeField
      FieldName = 'DATVENC'
    end
    object cdsPVVALOR_TOTAL: TFloatField
      FieldName = 'VALOR_TOTAL'
    end
    object cdsPVDESC_P_PROD: TFloatField
      FieldName = 'DESC_P_PROD'
    end
    object cdsPVDESC_P_SERV: TFloatField
      FieldName = 'DESC_P_SERV'
    end
    object cdsPVDESCONTO: TFloatField
      FieldName = 'DESCONTO'
    end
    object cdsPVOBS_PED: TStringField
      FieldName = 'OBS_PED'
      Size = 50
    end
    object cdsPVSTATUS_PED: TStringField
      FieldName = 'STATUS_PED'
      Size = 10
    end
    object cdsPVTIPV: TStringField
      FieldName = 'TIPV'
      FixedChar = True
      Size = 1
    end
    object cdsPVOBS_CXL_RQ: TStringField
      FieldName = 'OBS_CXL_RQ'
      Size = 50
    end
    object cdsPVSTATUS_CXL_RQ: TStringField
      FieldName = 'STATUS_CXL_RQ'
      FixedChar = True
      Size = 1
    end
    object cdsPVVL_PAGO_CXL: TFloatField
      FieldName = 'VL_PAGO_CXL'
    end
    object cdsPVSELEC: TStringField
      FieldName = 'SELEC'
      FixedChar = True
      Size = 1
    end
    object cdsPVTIPOR: TStringField
      FieldName = 'TIPOR'
      FixedChar = True
      Size = 1
    end
    object cdsPVHORAABERTURA: TIntegerField
      FieldName = 'HORAABERTURA'
    end
    object cdsPVMINABERTURA: TIntegerField
      FieldName = 'MINABERTURA'
    end
    object cdsPVHORAFECHAMENTO: TIntegerField
      FieldName = 'HORAFECHAMENTO'
    end
    object cdsPVMINFECHAMENTO: TIntegerField
      FieldName = 'MINFECHAMENTO'
    end
    object cdsPVHORASUBTOTAL: TIntegerField
      FieldName = 'HORASUBTOTAL'
    end
    object cdsPVMINSUBTOTAL: TIntegerField
      FieldName = 'MINSUBTOTAL'
    end
    object cdsPVNCUPOM: TIntegerField
      FieldName = 'NCUPOM'
    end
    object cdsPVOPERADOR: TIntegerField
      FieldName = 'OPERADOR'
    end
    object cdsPVDA: TStringField
      FieldName = 'DA'
      FixedChar = True
      Size = 1
    end
    object cdsPVNSERIEECF: TStringField
      FieldName = 'NSERIEECF'
    end
    object cdsPVNOME_RECEB: TStringField
      FieldName = 'NOME_RECEB'
      Size = 40
    end
    object cdsPVEND_RECEB: TStringField
      FieldName = 'END_RECEB'
      Size = 35
    end
    object cdsPVBAIRRO_RECEB: TStringField
      FieldName = 'BAIRRO_RECEB'
    end
    object cdsPVCIDA_RECEB: TStringField
      FieldName = 'CIDA_RECEB'
      Size = 15
    end
    object cdsPVCEP_RECEB: TStringField
      FieldName = 'CEP_RECEB'
      FixedChar = True
      Size = 8
    end
    object cdsPVFONE_RECEB: TStringField
      FieldName = 'FONE_RECEB'
      Size = 14
    end
    object cdsPVOBS_MINUTA: TMemoField
      FieldName = 'OBS_MINUTA'
      BlobType = ftMemo
      Size = 8
    end
    object cdsPVGRUPO_PROD: TIntegerField
      FieldName = 'GRUPO_PROD'
    end
    object cdsPVCOD_PROD: TStringField
      FieldName = 'COD_PROD'
      FixedChar = True
      Size = 6
    end
    object cdsPVOP_CXL: TIntegerField
      FieldName = 'OP_CXL'
    end
    object cdsPVCOD_CIDADE_RECEB: TSmallintField
      FieldName = 'COD_CIDADE_RECEB'
    end
    object cdsPVCOD_BAIRRO_RECEB: TSmallintField
      FieldName = 'COD_BAIRRO_RECEB'
    end
    object cdsPVVL_ENTRADA: TFloatField
      FieldName = 'VL_ENTRADA'
    end
    object cdsPVCODIGO_CTRL: TIntegerField
      FieldName = 'CODIGO_CTRL'
    end
    object cdsPVNPREVENDA: TIntegerField
      FieldName = 'NPREVENDA'
    end
    object cdsPVSTAT_REQ: TStringField
      FieldName = 'STAT_REQ'
      FixedChar = True
      Size = 1
    end
    object cdsPVACRESC_P_PROD: TFloatField
      FieldName = 'ACRESC_P_PROD'
    end
    object cdsPVACRESC_P_SERV: TFloatField
      FieldName = 'ACRESC_P_SERV'
    end
    object cdsPVACRESCIMO: TFloatField
      FieldName = 'ACRESCIMO'
    end
    object cdsPVPLACA: TStringField
      FieldName = 'PLACA'
      Size = 10
    end
    object cdsPVCHASSI: TStringField
      FieldName = 'CHASSI'
      Size = 17
    end
    object cdsPVKM_V: TIntegerField
      FieldName = 'KM_V'
    end
    object cdsPVORC_PROD: TIntegerField
      FieldName = 'ORC_PROD'
    end
    object cdsPVDT_PROMETIDA: TDateTimeField
      FieldName = 'DT_PROMETIDA'
    end
    object cdsPVOBS_OS: TMemoField
      FieldName = 'OBS_OS'
      BlobType = ftMemo
      Size = 8
    end
    object cdsPVAPARELHO_PED: TStringField
      FieldName = 'APARELHO_PED'
      Size = 50
    end
    object cdsPVGUARDA_VOL: TStringField
      FieldName = 'GUARDA_VOL'
      Size = 10
    end
    object cdsPVCOMBUST_VEIC: TStringField
      FieldName = 'COMBUST_VEIC'
      FixedChar = True
      Size = 3
    end
    object cdsPVDEFEITO: TMemoField
      FieldName = 'DEFEITO'
      BlobType = ftMemo
      Size = 8
    end
    object cdsPVESTADO_VEIC: TMemoField
      FieldName = 'ESTADO_VEIC'
      BlobType = ftMemo
      Size = 8
    end
    object cdsPVACESSORIOS: TMemoField
      FieldName = 'ACESSORIOS'
      BlobType = ftMemo
      Size = 8
    end
    object cdsPVTIPO_OS: TStringField
      FieldName = 'TIPO_OS'
      Size = 10
    end
    object cdsPVH_ENT: TDateTimeField
      FieldName = 'H_ENT'
    end
    object cdsPVH_PROMETIDA: TDateTimeField
      FieldName = 'H_PROMETIDA'
    end
    object cdsPVDATA_NF: TDateTimeField
      FieldName = 'DATA_NF'
    end
    object cdsPVDT_NFGARANTIA: TDateTimeField
      FieldName = 'DT_NFGARANTIA'
    end
    object cdsPVTOT_PROD: TFloatField
      FieldName = 'TOT_PROD'
    end
    object cdsPVTOT_SERV: TFloatField
      FieldName = 'TOT_SERV'
    end
    object cdsPVTP_ABORD: TStringField
      FieldName = 'TP_ABORD'
      FixedChar = True
      Size = 3
    end
    object cdsPVFR_PAGBOSCH: TStringField
      FieldName = 'FR_PAGBOSCH'
      FixedChar = True
      Size = 3
    end
    object cdsPVSEQ_FECH: TIntegerField
      FieldName = 'SEQ_FECH'
    end
    object cdsPVEM_NF: TStringField
      FieldName = 'EM_NF'
      FixedChar = True
      Size = 1
    end
    object cdsPVCOD_EQUIP: TIntegerField
      FieldName = 'COD_EQUIP'
    end
    object cdsPVN_SERIE: TStringField
      FieldName = 'N_SERIE'
      Size = 32
    end
    object cdsPVNUM_NF: TIntegerField
      FieldName = 'NUM_NF'
    end
    object cdsPVOBS_LIVRO_REG: TStringField
      FieldName = 'OBS_LIVRO_REG'
      Size = 32
    end
    object cdsPVVALOR_NF: TFloatField
      FieldName = 'VALOR_NF'
    end
    object cdsPVNF_PGARANTIA: TIntegerField
      FieldName = 'NF_PGARANTIA'
    end
    object cdsPVNOME_NF_GARANTIA: TStringField
      FieldName = 'NOME_NF_GARANTIA'
      Size = 60
    end
    object cdsPVHORA_FECH: TStringField
      FieldName = 'HORA_FECH'
      FixedChar = True
      Size = 8
    end
    object cdsPVST_TERM_SERV: TStringField
      FieldName = 'ST_TERM_SERV'
      FixedChar = True
      Size = 10
    end
    object cdsPVREGISTRO_DE_ENTREGA: TStringField
      FieldName = 'REGISTRO_DE_ENTREGA'
      Size = 100
    end
    object cdsPVTIPO_ORC: TStringField
      FieldName = 'TIPO_ORC'
      FixedChar = True
      Size = 1
    end
    object cdsPVSTATUS_CUPOM: TStringField
      FieldName = 'STATUS_CUPOM'
      FixedChar = True
      Size = 1
    end
    object cdsPVCODTERM_STATUS: TIntegerField
      FieldName = 'CODTERM_STATUS'
    end
    object cdsPVCPFCGC: TStringField
      FieldName = 'CPFCGC'
      FixedChar = True
      Size = 18
    end
    object cdsPVNOME_CLI_ORC: TStringField
      FieldName = 'NOME_CLI_ORC'
      Size = 35
    end
    object cdsPVCOD_ORCAMENTO: TIntegerField
      FieldName = 'COD_ORCAMENTO'
    end
    object cdsPVOBS_RED_OS: TStringField
      FieldName = 'OBS_RED_OS'
      Size = 50
    end
    object cdsPVDATA_CUPOM: TDateTimeField
      FieldName = 'DATA_CUPOM'
    end
    object cdsPVCCF_CUPOM: TIntegerField
      FieldName = 'CCF_CUPOM'
    end
  end
  object dsPV: TDataSource
    DataSet = cdsPV
    Left = 384
    Top = 224
  end
  object qrProdPV: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacaoRet
    SQL.Strings = (
      'select * from PEDVENDA_PROD')
    Left = 476
    Top = 68
  end
  object dspProdPV: TDataSetProvider
    DataSet = qrProdPV
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 480
    Top = 120
  end
  object cdsProdPV: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProdPV'
    BeforeOpen = cdsDAVFBeforeOpen
    Left = 480
    Top = 176
    object cdsProdPVNPED: TIntegerField
      FieldName = 'NPED'
      Required = True
    end
    object cdsProdPVGRUPO_PROD: TIntegerField
      FieldName = 'GRUPO_PROD'
      Required = True
    end
    object cdsProdPVCOD_PROD: TStringField
      FieldName = 'COD_PROD'
      Required = True
      FixedChar = True
      Size = 6
    end
    object cdsProdPVCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsProdPVCOD_GRADE: TIntegerField
      FieldName = 'COD_GRADE'
    end
    object cdsProdPVCODIGO_NOP: TFloatField
      FieldName = 'CODIGO_NOP'
    end
    object cdsProdPVNUM_FAB_PROD: TStringField
      FieldName = 'NUM_FAB_PROD'
      FixedChar = True
    end
    object cdsProdPVDESCR_PROD_PED: TStringField
      FieldName = 'DESCR_PROD_PED'
      Size = 60
    end
    object cdsProdPVQUANT_PED_ITEM: TFloatField
      FieldName = 'QUANT_PED_ITEM'
    end
    object cdsProdPVVLUN_PED_ITEM: TFloatField
      FieldName = 'VLUN_PED_ITEM'
    end
    object cdsProdPVVLTOT_PED_ITEM: TFloatField
      FieldName = 'VLTOT_PED_ITEM'
    end
    object cdsProdPVVLUN_ORIG: TFloatField
      FieldName = 'VLUN_ORIG'
    end
    object cdsProdPVVLUN_PED_NF: TFloatField
      FieldName = 'VLUN_PED_NF'
    end
    object cdsProdPVVLTOT_PED_NF: TFloatField
      FieldName = 'VLTOT_PED_NF'
    end
    object cdsProdPVRATEIO_DESC: TFloatField
      FieldName = 'RATEIO_DESC'
    end
    object cdsProdPVRATEIO_ACRESC: TFloatField
      FieldName = 'RATEIO_ACRESC'
    end
    object cdsProdPVN_NF: TIntegerField
      FieldName = 'N_NF'
    end
    object cdsProdPVALIQUOTA_CP: TStringField
      FieldName = 'ALIQUOTA_CP'
      FixedChar = True
      Size = 4
    end
    object cdsProdPVRATDSAS: TFloatField
      FieldName = 'RATDSAS'
    end
    object cdsProdPVCOMISS_PROD: TFloatField
      FieldName = 'COMISS_PROD'
    end
    object cdsProdPVCOMISS_PROD_GER: TFloatField
      FieldName = 'COMISS_PROD_GER'
    end
    object cdsProdPVANO_FAB_PROD: TIntegerField
      FieldName = 'ANO_FAB_PROD'
    end
    object cdsProdPVN_SERIE_PROD: TStringField
      FieldName = 'N_SERIE_PROD'
      Size = 15
    end
    object cdsProdPVMODELO: TStringField
      FieldName = 'MODELO'
      Size = 15
    end
    object cdsProdPVCOR: TStringField
      FieldName = 'COR'
      Size = 10
    end
    object cdsProdPVPCUST_C: TFloatField
      FieldName = 'PCUST_C'
    end
    object cdsProdPVPCUST_R: TFloatField
      FieldName = 'PCUST_R'
    end
    object cdsProdPVPCUST_MC: TFloatField
      FieldName = 'PCUST_MC'
    end
    object cdsProdPVPCUST_MR: TFloatField
      FieldName = 'PCUST_MR'
    end
    object cdsProdPVTP_NF_PED: TStringField
      FieldName = 'TP_NF_PED'
      FixedChar = True
      Size = 1
    end
    object cdsProdPVSIT_ATD: TStringField
      FieldName = 'SIT_ATD'
      FixedChar = True
      Size = 2
    end
    object cdsProdPVSEL: TStringField
      FieldName = 'SEL'
      FixedChar = True
      Size = 1
    end
    object cdsProdPVDATA_ATD: TDateTimeField
      FieldName = 'DATA_ATD'
    end
    object cdsProdPVHORA_ATD: TStringField
      FieldName = 'HORA_ATD'
      FixedChar = True
      Size = 8
    end
    object cdsProdPVCODIGO_KIT: TIntegerField
      FieldName = 'CODIGO_KIT'
    end
    object cdsProdPVICMANT_SUB: TFloatField
      FieldName = 'ICMANT_SUB'
    end
    object cdsProdPVCOD_SEG_SERV: TIntegerField
      FieldName = 'COD_SEG_SERV'
    end
    object cdsProdPVCOL_COD_VENDEDOR: TIntegerField
      FieldName = 'COL_COD_VENDEDOR'
    end
    object cdsProdPVDESC_ITEM: TFloatField
      FieldName = 'DESC_ITEM'
    end
    object cdsProdPVACRESC_ITEM: TFloatField
      FieldName = 'ACRESC_ITEM'
    end
    object cdsProdPVCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
    end
    object cdsProdPVDATA_TRANSF: TDateTimeField
      FieldName = 'DATA_TRANSF'
    end
    object cdsProdPVDATA_DEV: TDateTimeField
      FieldName = 'DATA_DEV'
    end
    object cdsProdPVNOME_VEND: TStringField
      FieldName = 'NOME_VEND'
      Size = 35
    end
    object cdsProdPVNOME_VEND1: TStringField
      FieldName = 'NOME_VEND1'
      Size = 35
    end
    object cdsProdPVQT_DEV: TFloatField
      FieldName = 'QT_DEV'
    end
    object cdsProdPVTIPO: TStringField
      FieldName = 'TIPO'
      Required = True
      FixedChar = True
      Size = 3
    end
    object cdsProdPVNITEM: TIntegerField
      FieldName = 'NITEM'
      Required = True
    end
  end
  object dsProdPV: TDataSource
    DataSet = cdsProdPV
    Left = 480
    Top = 224
  end
  object qrServPV: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacaoRet
    SQL.Strings = (
      'select * from PEDVENDA_SERV')
    Left = 548
    Top = 68
  end
  object dspServPV: TDataSetProvider
    DataSet = qrServPV
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 552
    Top = 120
  end
  object cdsServPV: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspServPV'
    BeforeOpen = cdsDAVFBeforeOpen
    Left = 552
    Top = 176
    object cdsServPVNPED: TIntegerField
      FieldName = 'NPED'
      Required = True
    end
    object cdsServPVCOD_SERVICO: TIntegerField
      FieldName = 'COD_SERVICO'
      Required = True
    end
    object cdsServPVCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsServPVCODIGO_NOP: TFloatField
      FieldName = 'CODIGO_NOP'
    end
    object cdsServPVCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
      Required = True
    end
    object cdsServPVQUANT_SERV_PED: TFloatField
      FieldName = 'QUANT_SERV_PED'
    end
    object cdsServPVVALOR_UN_SERV: TFloatField
      FieldName = 'VALOR_UN_SERV'
    end
    object cdsServPVVALOR_TOT_SERV: TFloatField
      FieldName = 'VALOR_TOT_SERV'
    end
    object cdsServPVVLUN_ORIG: TFloatField
      FieldName = 'VLUN_ORIG'
    end
    object cdsServPVPRC_INT_SERV: TFloatField
      FieldName = 'PRC_INT_SERV'
    end
    object cdsServPVRATEIO_DESC: TFloatField
      FieldName = 'RATEIO_DESC'
    end
    object cdsServPVRATEIO_ACRESC: TFloatField
      FieldName = 'RATEIO_ACRESC'
    end
    object cdsServPVN_NF: TLargeintField
      FieldName = 'N_NF'
    end
    object cdsServPVDESC_SERV_PED: TStringField
      FieldName = 'DESC_SERV_PED'
      Size = 60
    end
    object cdsServPVCOD_VENDEDOR1: TIntegerField
      FieldName = 'COD_VENDEDOR1'
    end
    object cdsServPVNOME_VEND: TStringField
      FieldName = 'NOME_VEND'
      Size = 35
    end
    object cdsServPVNOME_VEND1: TStringField
      FieldName = 'NOME_VEND1'
      Size = 35
    end
    object cdsServPVATIVO: TIntegerField
      FieldName = 'ATIVO'
    end
    object cdsServPVTIPO: TStringField
      FieldName = 'TIPO'
      Required = True
      FixedChar = True
      Size = 3
    end
    object cdsServPVTMO_SERV: TFloatField
      FieldName = 'TMO_SERV'
    end
    object cdsServPVSUBGSERVICO: TIntegerField
      FieldName = 'SUBGSERVICO'
    end
    object cdsServPVDESC_ITEM: TFloatField
      FieldName = 'DESC_ITEM'
    end
    object cdsServPVACRESC_ITEM: TFloatField
      FieldName = 'ACRESC_ITEM'
    end
    object cdsServPVNITEM: TIntegerField
      FieldName = 'NITEM'
      Required = True
    end
  end
  object dsServPV: TDataSource
    DataSet = cdsServPV
    Left = 552
    Top = 224
  end
  object qrCP: TIBQuery
    Database = dtmAtivo.bancoFiscal
    Transaction = ibTransCp
    SQL.Strings = (
      'select * from CUPOM')
    Left = 668
    Top = 68
  end
  object dspCP: TDataSetProvider
    DataSet = qrCP
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 672
    Top = 120
  end
  object cdsCP: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCP'
    BeforeOpen = cdsDAVFBeforeOpen
    Left = 672
    Top = 176
    object cdsCPCOD_TERMINAL: TIntegerField
      FieldName = 'COD_TERMINAL'
      Required = True
    end
    object cdsCPNSERIEECF: TStringField
      FieldName = 'NSERIEECF'
      Required = True
    end
    object cdsCPCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsCPREGISTRO: TIntegerField
      FieldName = 'REGISTRO'
      Required = True
    end
    object cdsCPCUPOM: TIntegerField
      FieldName = 'CUPOM'
      Required = True
    end
    object cdsCPDATA: TDateTimeField
      FieldName = 'DATA'
      Required = True
    end
    object cdsCPCLIENTE: TIntegerField
      FieldName = 'CLIENTE'
    end
    object cdsCPFORMAPAG: TStringField
      FieldName = 'FORMAPAG'
    end
    object cdsCPVALORPAGO: TFloatField
      FieldName = 'VALORPAGO'
    end
    object cdsCPTOTAL: TFloatField
      FieldName = 'TOTAL'
    end
    object cdsCPCONDPGTO: TStringField
      FieldName = 'CONDPGTO'
    end
    object cdsCPVALOR_DESC: TFloatField
      FieldName = 'VALOR_DESC'
    end
    object cdsCPVALOR_ACRES: TFloatField
      FieldName = 'VALOR_ACRES'
    end
    object cdsCPCOLABORADOR: TIntegerField
      FieldName = 'COLABORADOR'
    end
    object cdsCPSTATUS_CP: TStringField
      FieldName = 'STATUS_CP'
      Size = 10
    end
    object cdsCPHORAABERTURA: TTimeField
      FieldName = 'HORAABERTURA'
    end
    object cdsCPHORAFECHAMENTO: TTimeField
      FieldName = 'HORAFECHAMENTO'
    end
    object cdsCPHORASUBTOTAL: TTimeField
      FieldName = 'HORASUBTOTAL'
    end
    object cdsCPVALORCUPOM: TFloatField
      FieldName = 'VALORCUPOM'
    end
    object cdsCPPED: TIntegerField
      FieldName = 'PED'
    end
    object cdsCPPREVENDA: TIntegerField
      FieldName = 'PREVENDA'
    end
    object cdsCPCCF: TIntegerField
      FieldName = 'CCF'
      Required = True
    end
    object cdsCPACRES_DESC: TStringField
      FieldName = 'ACRES_DESC'
      FixedChar = True
      Size = 1
    end
    object cdsCPVALORACRES_DESC: TFloatField
      FieldName = 'VALORACRES_DESC'
    end
  end
  object DataSource1: TDataSource
    DataSet = cdsCP
    Left = 672
    Top = 224
  end
  object qrCP2: TIBQuery
    Database = dtmAtivo.bancoFiscal
    Transaction = ibTransCp
    SQL.Strings = (
      'select * from CUPOM2')
    Left = 740
    Top = 68
  end
  object dspCP2: TDataSetProvider
    DataSet = qrCP2
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 744
    Top = 120
  end
  object cdsCP2: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCP2'
    BeforeOpen = cdsDAVFBeforeOpen
    Left = 744
    Top = 176
    object cdsCP2COD_TERMINAL: TIntegerField
      FieldName = 'COD_TERMINAL'
      Required = True
    end
    object cdsCP2NSERIEECF: TStringField
      FieldName = 'NSERIEECF'
      Required = True
    end
    object cdsCP2COD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsCP2REGISTRO: TIntegerField
      FieldName = 'REGISTRO'
      Required = True
    end
    object cdsCP2NITEM: TIntegerField
      FieldName = 'NITEM'
      Required = True
    end
    object cdsCP2CUPOM: TIntegerField
      FieldName = 'CUPOM'
      Required = True
    end
    object cdsCP2ORDEM: TIntegerField
      FieldName = 'ORDEM'
      Required = True
    end
    object cdsCP2GRUPO_PROD: TIntegerField
      FieldName = 'GRUPO_PROD'
    end
    object cdsCP2COD_PROD: TStringField
      FieldName = 'COD_PROD'
      FixedChar = True
      Size = 6
    end
    object cdsCP2CODBARRA: TStringField
      FieldName = 'CODBARRA'
    end
    object cdsCP2QUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
    end
    object cdsCP2PRECO: TFloatField
      FieldName = 'PRECO'
    end
    object cdsCP2ALIQUOTA_IT: TStringField
      FieldName = 'ALIQUOTA_IT'
      FixedChar = True
      Size = 4
    end
    object cdsCP2STATUS_IT: TStringField
      FieldName = 'STATUS_IT'
      Size = 10
    end
    object cdsCP2TOTAL: TFloatField
      FieldName = 'TOTAL'
    end
    object cdsCP2DESCR_IT: TStringField
      FieldName = 'DESCR_IT'
      Size = 29
    end
    object cdsCP2PERC_DESC: TFloatField
      FieldName = 'PERC_DESC'
    end
    object cdsCP2PERC_ACRESC: TFloatField
      FieldName = 'PERC_ACRESC'
    end
    object cdsCP2RAT_ACRES: TFloatField
      FieldName = 'RAT_ACRES'
    end
    object cdsCP2RAT_DESC: TFloatField
      FieldName = 'RAT_DESC'
    end
    object cdsCP2DESCALIQ: TStringField
      FieldName = 'DESCALIQ'
      Required = True
      Size = 7
    end
    object cdsCP2CSDECQTDE: TStringField
      FieldName = 'CSDECQTDE'
      Required = True
      Size = 1
    end
    object cdsCP2CSDECVLUNT: TStringField
      FieldName = 'CSDECVLUNT'
      Required = True
      Size = 1
    end
    object cdsCP2RAT_DG: TFloatField
      FieldName = 'RAT_DG'
    end
    object cdsCP2PROD_SERV: TStringField
      FieldName = 'PROD_SERV'
      FixedChar = True
      Size = 1
    end
  end
  object DataSource2: TDataSource
    DataSet = cdsCP2
    Left = 744
    Top = 224
  end
  object ibTransCp: TIBTransaction
    DefaultDatabase = dtmAtivo.bancoFiscal
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 688
    Top = 16
  end
  object SpBxEst: TIBStoredProc
    Database = dtmAtivo.bancoHw
    Transaction = transacaoRet
    StoredProcName = 'BAIXA_ESTOQUE'
    Left = 328
    Top = 8
  end
  object qrPrestCx: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacaoRet
    SQL.Strings = (
      'select * from PRESTACOES_FISCAL')
    Left = 29
    Top = 296
  end
  object dsPPrestCx: TDataSetProvider
    DataSet = qrPrestCx
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 28
    Top = 349
  end
  object cdsPrestCx: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsPPrestCx'
    BeforeOpen = cdsDAVFBeforeOpen
    Left = 28
    Top = 404
    object cdsPrestCxCOD_CRED: TIntegerField
      DisplayLabel = 'C'#243'd Cred'
      FieldName = 'COD_CRED'
      Origin = '"PRESTACOES_FISCAL"."COD_CRED"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsPrestCxCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Origin = '"PRESTACOES_FISCAL"."COD_EMPRESA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
    end
    object cdsPrestCxVALOR_PRESTACAO: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VALOR_PRESTACAO'
      Origin = '"PRESTACOES_FISCAL"."VALOR_PRESTACAO"'
      DisplayFormat = '##0.00'
    end
    object cdsPrestCxN_DOC_C: TStringField
      DisplayLabel = 'Num Doc'
      FieldName = 'N_DOC_C'
      Origin = '"PRESTACOES_FISCAL"."N_DOC_C"'
    end
    object cdsPrestCxDATA_VENC_C: TDateTimeField
      DisplayLabel = 'Vencimento'
      FieldName = 'DATA_VENC_C'
      Origin = '"PRESTACOES_FISCAL"."DATA_VENC_C"'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsPrestCxTP_DOC_V: TStringField
      DisplayLabel = 'Tp Venda'
      FieldName = 'TP_DOC_V'
      Origin = '"PRESTACOES_FISCAL"."TP_DOC_V"'
      Size = 6
    end
    object cdsPrestCxN_DOC_V: TIntegerField
      DisplayLabel = 'Numero Venda'
      FieldName = 'N_DOC_V'
      Origin = '"PRESTACOES_FISCAL"."N_DOC_V"'
    end
    object cdsPrestCxCOD_TERMINAL: TIntegerField
      DisplayLabel = 'Terminal'
      FieldName = 'COD_TERMINAL'
      Origin = '"PRESTACOES_FISCAL"."COD_TERMINAL"'
    end
    object cdsPrestCxNSERIEECF: TStringField
      DisplayLabel = 'Num S'#233'rie ECF'
      FieldName = 'NSERIEECF'
      Origin = '"PRESTACOES_FISCAL"."NSERIEECF"'
    end
    object cdsPrestCxSTATUS: TStringField
      DisplayLabel = 'Status'
      DisplayWidth = 20
      FieldName = 'STATUS'
      Origin = '"PRESTACOES_FISCAL"."STATUS"'
    end
    object cdsPrestCxTOTALIZADOR: TSmallintField
      DisplayLabel = 'Totalizador'
      FieldName = 'TOTALIZADOR'
      Origin = '"PRESTACOES_FISCAL"."TOTALIZADOR"'
    end
    object cdsPrestCxFINALIZADOR: TSmallintField
      DisplayLabel = 'Finalizador'
      FieldName = 'FINALIZADOR'
      Origin = '"PRESTACOES_FISCAL"."FINALIZADOR"'
    end
    object cdsPrestCxCOO_DOCUMENTO: TIntegerField
      FieldName = 'COO_DOCUMENTO'
    end
  end
  object dsPrestCx: TDataSource
    AutoEdit = False
    DataSet = cdsPrestCx
    Left = 30
    Top = 456
  end
  object qrPrestCred: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacaoRet
    SQL.Strings = (
      
        'select cc.cod_cred, cc.data_venc_c, cc.valor_c, cc.tp_rec_cxl, c' +
        'c.dia_cxl, cc.vl_rq_pg_cxl, cc.n_doc_c, cc.tp_doc_v, cc.n_doc_v,' +
        ' cc.op_cxl from controle_creditos cc'
      
        'where cc.data_venc_c >= :dataIni and cc.data_venc_c <= :dataFim ' +
        'and'
      '((cc.status_c is null) or (cc.status_c <> '#39'QUITADO'#39')) and'
      
        '((cc.coonaofiscal is null) or (cc.coonaofiscal = 0)) and cc.codi' +
        'go_emp = 1')
    Left = 101
    Top = 296
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
      end>
  end
  object dspPrestCred: TDataSetProvider
    DataSet = qrPrestCred
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 100
    Top = 349
  end
  object cdsPrestCred: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPrestCred'
    BeforeOpen = cdsDAVFBeforeOpen
    Left = 100
    Top = 404
    object cdsPrestCredCOD_CRED: TIntegerField
      DisplayLabel = 'Cod Cred'
      FieldName = 'COD_CRED'
      Required = True
    end
    object cdsPrestCredDATA_VENC_C: TDateTimeField
      DisplayLabel = 'Vencimento'
      FieldName = 'DATA_VENC_C'
    end
    object cdsPrestCredVALOR_C: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VALOR_C'
    end
    object cdsPrestCredTP_REC_CXL: TStringField
      DisplayLabel = 'Tp Baixa'
      FieldName = 'TP_REC_CXL'
      FixedChar = True
      Size = 1
    end
    object cdsPrestCredDIA_CXL: TDateTimeField
      DisplayLabel = 'Dia Cxl'
      FieldName = 'DIA_CXL'
    end
    object cdsPrestCredVL_RQ_PG_CXL: TFloatField
      DisplayLabel = 'Pago Cxl'
      FieldName = 'VL_RQ_PG_CXL'
    end
    object cdsPrestCredN_DOC_C: TStringField
      DisplayLabel = 'Num Doc'
      FieldName = 'N_DOC_C'
      FixedChar = True
    end
    object cdsPrestCredTP_DOC_V: TStringField
      DisplayLabel = 'Tp Doc venda'
      FieldName = 'TP_DOC_V'
      FixedChar = True
      Size = 6
    end
    object cdsPrestCredN_DOC_V: TIntegerField
      DisplayLabel = 'Num Venda'
      FieldName = 'N_DOC_V'
    end
    object cdsPrestCredOP_CXL: TIntegerField
      FieldName = 'OP_CXL'
    end
    object cdsPrestCredVALOR_CORR: TFloatField
      DisplayLabel = 'Valor Corrigido'
      FieldName = 'VALOR_CORR'
    end
  end
  object dsPrestCred: TDataSource
    AutoEdit = False
    DataSet = cdsPrestCred
    Left = 102
    Top = 456
  end
  object SpVoltaEst: TIBStoredProc
    Database = dtmAtivo.bancoHw
    Transaction = transacaoRet
    StoredProcName = 'AUMENTA_ESTOQUE'
    Left = 380
    Top = 9
    ParamData = <
      item
        DataType = ftInteger
        Name = 'VGRUPO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'VCOD_PROD'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'QUANT'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VESTS'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VESTM'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VESTC'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'VDATA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'COD_EMPRESA'
        ParamType = ptInput
      end>
  end
  object qrItPV: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacaoRet
    SQL.Strings = (
      
        'select '#39'P'#39' tipo ,pp.nped,pp.cod_prod,pp.grupo_prod grupoOuServ,p' +
        'p.cod_empresa, pp.num_fab_prod,'
      
        'pp.quant_ped_item qtde, pp.vlun_ped_item vl_unit,pp.descr_prod_p' +
        'ed descr,p.descr_prod_red d_red,'
      
        'pp.rateio_desc,pp.rateio_acresc,p.csdecqtde,p.csdecvlunt, pp.cod' +
        '_grade, pp.status, pp.nitem'
      'from pedvenda_prod pp'
      
        'inner join produtos p on p.grupo_prod = pp.grupo_prod and p.cod_' +
        'prod = pp.cod_prod'
      'and p.cod_empresa = pp.cod_empresa'
      'union'
      
        'select '#39'S'#39' tipo, ps.nped, ps.cod_servico cod_prod, ps.cod_servic' +
        'o grupoOuServ,ps.cod_empresa,ps.cod_servico num_fab_prod,'
      
        'ps.quant_serv_ped qtde,ps.valor_un_serv vl_unit,ps.desc_serv_ped' +
        ' descr,'#39#39' d_red,'
      
        'ps.rateio_desc,ps.rateio_acresc,2 csdecqtde,2 csdcvlunt, 0 cod_g' +
        'rade, ps.status, ps.nitem from pedvenda_serv ps')
    Left = 414
    Top = 288
  end
  object dspItPV: TDataSetProvider
    DataSet = qrItPV
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 414
    Top = 341
  end
  object cdsItPV: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspItPV'
    BeforeOpen = cdsDAVFBeforeOpen
    Left = 414
    Top = 396
    object cdsItPVTIPO: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      FixedChar = True
      Size = 1
    end
    object cdsItPVNPED: TIntegerField
      FieldName = 'NPED'
      Required = True
      Visible = False
    end
    object cdsItPVCOD_PROD: TStringField
      DisplayLabel = 'C'#243'digo Produto'
      FieldName = 'COD_PROD'
      Required = True
      FixedChar = True
      Size = 6
    end
    object cdsItPVGRUPOOUSERV: TIntegerField
      DisplayLabel = 'Grupo ou Servi'#231'o'
      FieldName = 'GRUPOOUSERV'
      Required = True
    end
    object cdsItPVCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
      Visible = False
    end
    object cdsItPVNUM_FAB_PROD: TStringField
      DisplayLabel = 'C'#243'digo Barras'
      FieldName = 'NUM_FAB_PROD'
      FixedChar = True
    end
    object cdsItPVQTDE: TFloatField
      DisplayLabel = 'Quantidade'
      FieldName = 'QTDE'
    end
    object cdsItPVVL_UNIT: TFloatField
      DisplayLabel = 'Valor Unit'
      FieldName = 'VL_UNIT'
      currency = True
    end
    object cdsItPVDESCR: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCR'
      Size = 60
    end
    object cdsItPVD_RED: TStringField
      DisplayLabel = 'Descri'#231#227'o Cupom'
      FieldName = 'D_RED'
      Size = 35
    end
    object cdsItPVRATEIO_DESC: TFloatField
      DisplayLabel = 'Desconto'
      FieldName = 'RATEIO_DESC'
      currency = True
    end
    object cdsItPVRATEIO_ACRESC: TFloatField
      DisplayLabel = 'Acr'#233'scimo'
      FieldName = 'RATEIO_ACRESC'
      currency = True
    end
    object cdsItPVCSDECQTDE: TStringField
      FieldName = 'CSDECQTDE'
      Visible = False
      Size = 11
    end
    object cdsItPVCSDECVLUNT: TStringField
      FieldName = 'CSDECVLUNT'
      Visible = False
      Size = 11
    end
    object cdsItPVCOD_GRADE: TIntegerField
      DisplayLabel = 'Grade'
      FieldName = 'COD_GRADE'
    end
    object cdsItPVSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 10
    end
    object cdsItPVNITEM: TIntegerField
      FieldName = 'NITEM'
    end
    object cdsItPVPCUST_MC: TFloatField
      FieldName = 'PCUST_MC'
    end
  end
  object dsItPV: TDataSource
    AutoEdit = False
    DataSet = cdsItPV
    Left = 414
    Top = 447
  end
  object qrPrV: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacaoRet
    SQL.Strings = (
      
        'select pd.nped, pd.tipo, pd.cod_cliente, c.nome_cliente, pd.cod_' +
        'vendedor, pd.data_fech, pd.valor_total, pd.desconto,'
      
        'pd.acrescimo, pd.paf_num_prevenda, pd.status_cupom, pd.codterm_s' +
        'tatus, pd.ncupom, pd.coo_impressao'
      'from pedvenda pd'
      
        'inner join clientes c on c.cod_cliente = pd.cod_cliente and c.co' +
        'd_empresa = pd.cod_empresa'
      
        'and (c.insc_est = '#39'ISENTO'#39' or (c.insc_est is null) or c.insc_est' +
        ' = '#39#39')'
      'where pd.nped = 0 and pd.cod_empresa = 0 and pd.tipo = '#39#39)
    Left = 312
    Top = 280
  end
  object dspPrV: TDataSetProvider
    DataSet = qrPrV
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 312
    Top = 336
  end
  object cdsPrV: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPrV'
    BeforeOpen = cdsDAVFBeforeOpen
    Left = 312
    Top = 392
    object cdsPrVNPED: TIntegerField
      FieldName = 'NPED'
      Required = True
    end
    object cdsPrVTIPO: TStringField
      FieldName = 'TIPO'
      Required = True
      FixedChar = True
      Size = 3
    end
    object cdsPrVCOD_CLIENTE: TIntegerField
      FieldName = 'COD_CLIENTE'
      Required = True
    end
    object cdsPrVNOME_CLIENTE: TStringField
      FieldName = 'NOME_CLIENTE'
      Required = True
      Size = 35
    end
    object cdsPrVCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
      Required = True
    end
    object cdsPrVDATA_FECH: TDateTimeField
      FieldName = 'DATA_FECH'
    end
    object cdsPrVVALOR_TOTAL: TFloatField
      FieldName = 'VALOR_TOTAL'
    end
    object cdsPrVDESCONTO: TFloatField
      FieldName = 'DESCONTO'
    end
    object cdsPrVACRESCIMO: TFloatField
      FieldName = 'ACRESCIMO'
    end
    object cdsPrVPAF_NUM_PREVENDA: TIntegerField
      FieldName = 'PAF_NUM_PREVENDA'
    end
    object cdsPrVSTATUS_CUPOM: TStringField
      FieldName = 'STATUS_CUPOM'
      FixedChar = True
      Size = 1
    end
    object cdsPrVCODTERM_STATUS: TIntegerField
      FieldName = 'CODTERM_STATUS'
    end
    object cdsPrVNCUPOM: TIntegerField
      FieldName = 'NCUPOM'
    end
    object cdsPrVCOO_IMPRESSAO: TIntegerField
      FieldName = 'COO_IMPRESSAO'
    end
    object cdsPrVTIPV: TStringField
      FieldName = 'TIPV'
      Size = 1
    end
  end
  object dsPrV: TDataSource
    DataSet = cdsPrV
    Left = 312
    Top = 448
  end
  object qrBuscas2: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacaoRet
    Left = 456
    Top = 7
  end
end
