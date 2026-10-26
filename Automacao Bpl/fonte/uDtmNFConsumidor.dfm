object dtmNFConsumidor: TdtmNFConsumidor
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 573
  Width = 1092
  object qrNFCe: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      
        'select nfce.cod_nfce, nfce.cod_empresa, nfce.cod_cliente, nfce.s' +
        'erie, nfce.num_nf, nfce.modelo, nfce.dhemi, nfce.data_lanc, nfce' +
        '.status,'
      
        '       nfce.natop, nfce.tpimp, nfce.tpemis, nfce.tpamb, nfce.ind' +
        'pres, nfce.situacao_nfce, nfce.chave_nfce, nfce.nprot, nfce.vbc,' +
        ' nfce.vicms,'
      
        '       nfce.vprod, nfce.vfrete, nfce.vseg, nfce.vdesc, nfce.vpis' +
        ', nfce.vcofins, nfce.voutro, nfce.vnf, nfce.vtottrib, nfce.modfr' +
        'ete,'
      
        '       nfce.tr_codigo, nfce.data_cad, nfce.data_mod, nfce.us_mod' +
        ', nfce.desc_por_item, nfce.seqpreco, nfce.infadfisco, nfce.infcp' +
        'l,'
      
        '       nfce.ativo, nfce.cstat, nfce.xmotivo, nfce.digval, nfce.d' +
        'hrecbto, nfce.msgretorno, nfce.cmunfgibs, nfce.dfe_trib_ignorar,'
      
        '       nfce.vnftot, nfce.vbcibscbs, nfce.ibsuf_vdif, nfce.ibsuf_' +
        'vdevtrib, nfce.vibsuf, nfce.ibsmun_vdif, nfce.ibsmun_vdevtrib, n' +
        'fce.vibsmun,'
      
        '       nfce.vibs, nfce.cbs_vdif, nfce.cbs_vdevtrib, nfce.vcbs, n' +
        'fce.vibsmono, nfce.vcbsmono, nfce.vibsmonoreten, nfce.vcbsmonore' +
        'ten,'
      '       nfce.vibsmonoret, nfce.vcbsmonoret, nfce.vis'
      'from nfce'
      'where nfce.cod_nfce = 0 and nfce.cod_empresa = 0')
    Left = 29
    Top = 64
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
  object dspNFCe: TDataSetProvider
    DataSet = qrNFCe
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 29
    Top = 112
  end
  object cdsNFCe: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspNFCe'
    BeforeOpen = cdsNFCeBeforeOpen
    Left = 29
    Top = 160
    object cdsNFCeCOD_NFCE: TIntegerField
      Tag = 2
      DisplayLabel = 'Codigo'
      FieldName = 'COD_NFCE'
      Required = True
    end
    object cdsNFCeCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsNFCeSERIE: TSmallintField
      Tag = 2
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
    end
    object cdsNFCeNUM_NF: TIntegerField
      Tag = 2
      DisplayLabel = 'Num NF'
      FieldName = 'NUM_NF'
    end
    object cdsNFCeSTATUS: TStringField
      Tag = 2
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      Size = 10
    end
    object cdsNFCeMODELO: TStringField
      DisplayLabel = 'Modelo'
      FieldName = 'MODELO'
      FixedChar = True
      Size = 2
    end
    object cdsNFCeVNF: TFloatField
      Tag = 2
      DisplayLabel = 'Valor Liquido NF'
      FieldName = 'VNF'
      DisplayFormat = '#,##0.00'
    end
    object cdsNFCeDHEMI: TDateTimeField
      DisplayLabel = 'Data Emissao'
      FieldName = 'DHEMI'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsNFCeDATA_LANC: TDateTimeField
      Tag = 2
      DisplayLabel = 'Data Lancamento'
      FieldName = 'DATA_LANC'
    end
    object cdsNFCeTPIMP: TStringField
      DisplayLabel = 'Forma Impressao'
      FieldName = 'TPIMP'
      FixedChar = True
      Size = 1
    end
    object cdsNFCeTPEMIS: TStringField
      DisplayLabel = 'Tipo Emissao'
      FieldName = 'TPEMIS'
      FixedChar = True
      Size = 1
    end
    object cdsNFCeTPAMB: TStringField
      DisplayLabel = 'Ambiente'
      FieldName = 'TPAMB'
      FixedChar = True
      Size = 1
    end
    object cdsNFCeINDPRES: TStringField
      DisplayLabel = 'Ind Presenca'
      FieldName = 'INDPRES'
      FixedChar = True
      Size = 1
    end
    object cdsNFCeCOD_CLIENTE: TIntegerField
      DisplayLabel = 'Cod Cliente'
      FieldName = 'COD_CLIENTE'
    end
    object cdsNFCeNATOP: TStringField
      DisplayLabel = 'Natureza de Opera'#231#227'o'
      FieldName = 'NATOP'
      Size = 60
    end
    object cdsNFCeSITUACAO_NFCE: TStringField
      Tag = 2
      DisplayLabel = 'Situa'#231#227'o NFC-e'
      FieldName = 'SITUACAO_NFCE'
      Size = 16
    end
    object cdsNFCeCHAVE_NFCE: TStringField
      Tag = 2
      DisplayLabel = 'Chave NFC-e'
      FieldName = 'CHAVE_NFCE'
      Size = 44
    end
    object cdsNFCeNPROT: TStringField
      DisplayLabel = 'Num Protocolo'
      FieldName = 'NPROT'
      Size = 17
    end
    object cdsNFCeVBC: TFloatField
      DisplayLabel = 'Base ICMS'
      FieldName = 'VBC'
      DisplayFormat = '#,##0.00'
    end
    object cdsNFCeVICMS: TFloatField
      DisplayLabel = 'Valor ICMS'
      FieldName = 'VICMS'
      DisplayFormat = '#,##0.00'
    end
    object cdsNFCeVPROD: TFloatField
      DisplayLabel = 'Valor Produtos'
      FieldName = 'VPROD'
      DisplayFormat = '#,##0.00'
    end
    object cdsNFCeVFRETE: TFloatField
      DisplayLabel = 'Frete'
      FieldName = 'VFRETE'
      DisplayFormat = '#,##0.00'
    end
    object cdsNFCeVSEG: TFloatField
      DisplayLabel = 'Seguro'
      FieldName = 'VSEG'
      DisplayFormat = '#,##0.00'
    end
    object cdsNFCeVDESC: TFloatField
      DisplayLabel = 'Desconto'
      FieldName = 'VDESC'
      DisplayFormat = '#,##0.00'
    end
    object cdsNFCeVPIS: TFloatField
      DisplayLabel = 'Valor PIS'
      FieldName = 'VPIS'
      DisplayFormat = '#,##0.00'
    end
    object cdsNFCeVCOFINS: TFloatField
      DisplayLabel = 'Valor COFINS'
      FieldName = 'VCOFINS'
      DisplayFormat = '#,##0.00'
    end
    object cdsNFCeVOUTRO: TFloatField
      DisplayLabel = 'Outros Valores'
      FieldName = 'VOUTRO'
      DisplayFormat = '#,##0.00'
    end
    object cdsNFCeVTOTTRIB: TFloatField
      DisplayLabel = 'Valor Total dos Tributos'
      FieldName = 'VTOTTRIB'
      DisplayFormat = '#,##0.00'
    end
    object cdsNFCeMODFRETE: TStringField
      DisplayLabel = 'Modalidade Frete'
      FieldName = 'MODFRETE'
      FixedChar = True
      Size = 1
    end
    object cdsNFCeTR_CODIGO: TIntegerField
      DisplayLabel = 'Cod Transportador'
      FieldName = 'TR_CODIGO'
    end
    object cdsNFCeDATA_CAD: TDateTimeField
      DisplayLabel = 'Data Cadastro'
      FieldName = 'DATA_CAD'
    end
    object cdsNFCeDATA_MOD: TDateTimeField
      DisplayLabel = 'Data Modificacao'
      FieldName = 'DATA_MOD'
    end
    object cdsNFCeUS_MOD: TIntegerField
      DisplayLabel = 'Usuario Modificou'
      FieldName = 'US_MOD'
    end
    object cdsNFCeDESC_POR_ITEM: TStringField
      DisplayLabel = 'Calc Desc Por Item'
      FieldName = 'DESC_POR_ITEM'
      FixedChar = True
      Size = 1
    end
    object cdsNFCeSEQPRECO: TStringField
      DisplayLabel = 'Seq Preco'
      FieldName = 'SEQPRECO'
      FixedChar = True
      Size = 1
    end
    object cdsNFCeINFADFISCO: TMemoField
      DisplayLabel = 'Informacao Interesse Fisco'
      FieldName = 'INFADFISCO'
      BlobType = ftMemo
      Size = 8
    end
    object cdsNFCeINFCPL: TMemoField
      DisplayLabel = 'Informacao Interesse contribuinte'
      FieldName = 'INFCPL'
      BlobType = ftMemo
      Size = 8
    end
    object cdsNFCeATIVO: TSmallintField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
      Visible = False
    end
    object cdsNFCeCSTAT: TStringField
      DisplayLabel = 'Codigo Status Resposta NFC-e'
      FieldName = 'CSTAT'
      Size = 4
    end
    object cdsNFCeXMOTIVO: TStringField
      DisplayLabel = 'Descri'#231#227'o da resposta'
      FieldName = 'XMOTIVO'
      Size = 255
    end
    object cdsNFCeDIGVAL: TStringField
      DisplayLabel = 'DigestValue'
      FieldName = 'DIGVAL'
      Size = 28
    end
    object cdsNFCeDHRECBTO: TDateTimeField
      DisplayLabel = 'Data  de Processamento da NFC-e pelo WS'
      FieldName = 'DHRECBTO'
    end
    object cdsNFCeMSGRETORNO: TStringField
      DisplayLabel = 'Erro de retorno no Envio da NFC-e'
      FieldName = 'MSGRETORNO'
      Size = 255
    end
    object cdsNFCeCOD_VENDEDOR: TIntegerField
      DisplayLabel = 'Cod Vendedor'
      FieldName = 'COD_VENDEDOR'
    end
    object cdsNFCeCOD_COND_PAG: TIntegerField
      DisplayLabel = 'Cod Cond Pag'
      FieldName = 'COD_COND_PAG'
    end
    object cdsNFCeFRETE_NA_BASE: TStringField
      DisplayLabel = 'Frete na Base'
      FieldName = 'FRETE_NA_BASE'
      Size = 1
    end
    object cdsNFCePED_ORIGEM_NUM: TIntegerField
      DisplayLabel = 'Num Venda Origem'
      FieldName = 'PED_ORIGEM_NUM'
    end
    object cdsNFCePED_ORIGEM_TIP: TStringField
      DisplayLabel = 'Tipo Venda Origem'
      FieldName = 'PED_ORIGEM_TIP'
      Size = 3
    end
    object cdsNFCePED_DESTINO_NUM: TIntegerField
      DisplayLabel = 'Num Venda Gerada'
      FieldName = 'PED_DESTINO_NUM'
    end
    object cdsNFCePED_DESTINO_TIP: TStringField
      DisplayLabel = 'Tipo Venda Gerada'
      FieldName = 'PED_DESTINO_TIP'
      Size = 3
    end
    object cdsNFCeVFCP: TFloatField
      DisplayLabel = 'Valor(FCP)'
      FieldName = 'VFCP'
      DisplayFormat = '#,##0.00'
    end
    object cdsNFCeVFCPST: TFloatField
      DisplayLabel = 'Valor ST(FCP)'
      FieldName = 'VFCPST'
      DisplayFormat = '#,##0.00'
    end
    object cdsNFCeVFCPSTRET: TFloatField
      DisplayLabel = 'Valor ST Retido(FCP)'
      FieldName = 'VFCPSTRET'
      DisplayFormat = '#,##0.00'
    end
    object cdsNFCeVTROCO: TFloatField
      DisplayLabel = 'Troco'
      FieldName = 'VTROCO'
      DisplayFormat = '#,##0.00'
    end
    object cdsNFCeNFE_VERSAO: TStringField
      DisplayLabel = 'Vers'#227'o NFe'
      FieldName = 'NFE_VERSAO'
      Size = 8
    end
    object cdsNFCeCOD_EMISSOR: TIntegerField
      DisplayLabel = 'Caixa'
      FieldName = 'COD_EMISSOR'
      DisplayFormat = '000'
    end
    object cdsNFCeSEL: TStringField
      Tag = 2
      FieldKind = fkInternalCalc
      FieldName = 'SEL'
      Size = 1
    end
    object cdsNFCeCOD_NFCE_CONTING: TIntegerField
      DisplayLabel = 'ID NFCe Contingencia'
      FieldName = 'COD_NFCE_CONTING'
    end
    object cdsNFCeCOD_NFCE_ORIGINAL: TIntegerField
      DisplayLabel = 'ID NFCe Original'
      FieldName = 'COD_NFCE_ORIGINAL'
    end
    object cdsNFCeNORC: TIntegerField
      DisplayLabel = 'Num Orc'
      FieldName = 'NORC'
    end
    object cdsNFCeOPERADOR: TIntegerField
      DisplayLabel = 'Operador'
      FieldName = 'OPERADOR'
    end
    object cdsNFCeMOV_ID: TIntegerField
      DisplayLabel = 'Movimento'
      FieldName = 'MOV_ID'
    end
    object cdsNFCeCANC_DHRECBTO: TDateTimeField
      DisplayLabel = 'Data do cancelamento'
      FieldName = 'CANC_DHRECBTO'
    end
    object cdsNFCeCANC_XJUST: TStringField
      DisplayLabel = 'Justificativa do cancelamento'
      FieldName = 'CANC_XJUST'
      Size = 255
    end
    object cdsNFCeINUT_DHRECBTO: TDateTimeField
      DisplayLabel = 'Data da inutiliza'#231#227'o'
      FieldName = 'INUT_DHRECBTO'
    end
    object cdsNFCeINUT_XJUST: TStringField
      DisplayLabel = 'Justificativa da inutiliza'#231#227'o'
      FieldName = 'INUT_XJUST'
      Size = 255
    end
    object cdsNFCeINDINTERMED: TStringField
      DisplayLabel = 'Intermediador/Marketplace?'
      FieldName = 'INDINTERMED'
      Size = 1
    end
    object cdsNFCeINFINTERMED_CNPJ: TStringField
      DisplayLabel = 'Interme/Market CNPJ'
      FieldName = 'INFINTERMED_CNPJ'
      Size = 14
    end
    object cdsNFCeINFINTERMED_IDCADINTTRAN: TStringField
      DisplayLabel = 'Interme/Market Identifica'#231#227'o'
      FieldName = 'INFINTERMED_IDCADINTTRAN'
      Size = 60
    end
    object cdsNFCeCOD_NFCE_COMPLEMENTADA: TIntegerField
      DisplayLabel = 'Cod NFCe Complementada'
      FieldName = 'COD_NFCE_COMPLEMENTADA'
    end
    object cdsNFCeCMUNFGIBS: TIntegerField
      DisplayLabel = 'Codigo Municipio consumo, fato gerador do IBSCBS'
      FieldName = 'CMUNFGIBS'
    end
    object cdsNFCeDFE_TRIB_IGNORAR: TSmallintField
      DisplayLabel = 'Ignorar Tributos RTC'
      FieldName = 'DFE_TRIB_IGNORAR'
    end
    object cdsNFCeVNFTOT: TBCDField
      DisplayLabel = 'Valor total NF com IBS CBS IS'
      FieldName = 'VNFTOT'
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsNFCeVBCIBSCBS: TBCDField
      DisplayLabel = 'Base IBSCBS'
      FieldName = 'VBCIBSCBS'
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsNFCeIBSUF_VDIF: TBCDField
      DisplayLabel = 'Valor diferimento IBS UF'
      FieldName = 'IBSUF_VDIF'
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsNFCeIBSUF_VDEVTRIB: TBCDField
      DisplayLabel = 'Valor devolucao  tributos IBS UF'
      FieldName = 'IBSUF_VDEVTRIB'
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsNFCeVIBSUF: TBCDField
      DisplayLabel = 'Valor IBS UF'
      FieldName = 'VIBSUF'
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsNFCeIBSMUN_VDIF: TBCDField
      DisplayLabel = 'Valor diferimento IBS Municipio'
      FieldName = 'IBSMUN_VDIF'
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsNFCeIBSMUN_VDEVTRIB: TBCDField
      DisplayLabel = 'Valor devolucao  tributos IBS Municipio'
      FieldName = 'IBSMUN_VDEVTRIB'
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsNFCeVIBSMUN: TBCDField
      DisplayLabel = 'Valor IBS Municipio'
      FieldName = 'VIBSMUN'
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsNFCeVIBS: TBCDField
      DisplayLabel = 'Valor IBS total'
      FieldName = 'VIBS'
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsNFCeCBS_VDIF: TBCDField
      DisplayLabel = 'Valor diferimento CBS'
      FieldName = 'CBS_VDIF'
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsNFCeCBS_VDEVTRIB: TBCDField
      DisplayLabel = 'Valor devolucao  tributos CBS'
      FieldName = 'CBS_VDEVTRIB'
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsNFCeVCBS: TBCDField
      DisplayLabel = 'Valor CBS'
      FieldName = 'VCBS'
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsNFCeVIBSMONO: TBCDField
      DisplayLabel = 'Valor IBS monofasico'
      FieldName = 'VIBSMONO'
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsNFCeVCBSMONO: TBCDField
      DisplayLabel = 'Valor CBS Monofasica'
      FieldName = 'VCBSMONO'
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsNFCeVIBSMONORETEN: TBCDField
      DisplayLabel = 'Valor IBS monofasico sujeito a retencao'
      FieldName = 'VIBSMONORETEN'
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsNFCeVCBSMONORETEN: TBCDField
      DisplayLabel = 'Valor CBS monofasica sujeita a retencao'
      FieldName = 'VCBSMONORETEN'
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsNFCeVIBSMONORET: TBCDField
      DisplayLabel = 'Valor IBS retido anteriormente'
      FieldName = 'VIBSMONORET'
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsNFCeVCBSMONORET: TBCDField
      DisplayLabel = 'Valor CBS retida anteriormente'
      FieldName = 'VCBSMONORET'
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsNFCeVIS: TBCDField
      DisplayLabel = 'Valor Imposto Seletivo'
      FieldName = 'VIS'
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsNFCeOP_INTERNA_ID: TStringField
      Tag = 1
      DisplayLabel = 'Op Interna Id'
      FieldName = 'OP_INTERNA_ID'
      Size = 36
    end
  end
  object dsNFCe: TDataSource
    AutoEdit = False
    DataSet = cdsNFCe
    Left = 29
    Top = 208
  end
  object qrEmissor: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      
        'select nfc_emissor.cod_emissor, nfc_emissor.cod_empresa, nfc_emi' +
        'ssor.nome_emissor, nfc_emissor.serie_nfce, nfc_emissor.tipo, nfc' +
        '_emissor.identificador, nfc_emissor.token, nfc_emissor.data_cad,' +
        ' nfc_emissor.data_mod, nfc_emissor.us_mod from nfc_emissor'
      
        'where nfc_emissor.cod_emissor = 0 and nfc_emissor.cod_empresa = ' +
        '0')
    Left = 29
    Top = 280
  end
  object dspEmissor: TDataSetProvider
    DataSet = qrEmissor
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 29
    Top = 328
  end
  object cdsEmissor: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspEmissor'
    BeforeOpen = cdsNFCeBeforeOpen
    Left = 29
    Top = 376
    object cdsEmissorCOD_EMISSOR: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'COD_EMISSOR'
      Required = True
    end
    object cdsEmissorCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsEmissorNOME_EMISSOR: TStringField
      DisplayLabel = 'Nome Emissor'
      FieldName = 'NOME_EMISSOR'
      Size = 32
    end
    object cdsEmissorSERIE_NFCE: TSmallintField
      DisplayLabel = 'Serie NFC-e'
      FieldName = 'SERIE_NFCE'
    end
    object cdsEmissorSERIE_NFCE_OFF: TSmallintField
      DisplayLabel = 'Serie NFC-e Offline'
      FieldName = 'SERIE_NFCE_OFF'
    end
    object cdsEmissorTIPO: TStringField
      DisplayLabel = 'Tipo Emissor'
      FieldName = 'TIPO'
      Size = 8
    end
    object cdsEmissorIDENTIFICADOR: TStringField
      DisplayLabel = 'Identificador'
      FieldName = 'IDENTIFICADOR'
      FixedChar = True
      Size = 12
    end
    object cdsEmissorTOKEN: TStringField
      DisplayLabel = 'Token'
      FieldName = 'TOKEN'
      Size = 16
    end
    object cdsEmissorDATA_CAD: TDateTimeField
      DisplayLabel = 'Data Cadastro'
      FieldName = 'DATA_CAD'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsEmissorDATA_MOD: TDateTimeField
      DisplayLabel = 'Data Modificacao'
      FieldName = 'DATA_MOD'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsEmissorUS_MOD: TIntegerField
      DisplayLabel = 'Usuario alterou'
      FieldName = 'US_MOD'
    end
    object cdsEmissorCLIENT_OR_SERVER: TStringField
      DisplayLabel = 'Cliente ou Servidor'
      FieldName = 'CLIENT_OR_SERVER'
      Size = 1
    end
    object cdsEmissorSERVER_AUTORIZACAO: TStringField
      DisplayLabel = 'Servi'#231'o de autorizacao'
      FieldName = 'SERVER_AUTORIZACAO'
      Size = 1
    end
    object cdsEmissorSERVER_IMPRESSAO: TStringField
      DisplayLabel = 'Servi'#231'o de Impress'#227'o'
      FieldName = 'SERVER_IMPRESSAO'
      Size = 1
    end
    object cdsEmissorSERVER_EMAIL: TStringField
      DisplayLabel = 'Servi'#231'o de email'
      FieldName = 'SERVER_EMAIL'
      Size = 1
    end
    object cdsEmissorLIB_SSL: TSmallintField
      DisplayLabel = 'Lib SSL'
      FieldName = 'LIB_SSL'
    end
    object cdsEmissorLIB_SSLCRYPTLIB: TSmallintField
      DisplayLabel = 'Lib Crypt'
      FieldName = 'LIB_SSLCRYPTLIB'
    end
    object cdsEmissorLIB_SSLHTTPLIB: TSmallintField
      DisplayLabel = 'Lib Http'
      FieldName = 'LIB_SSLHTTPLIB'
    end
    object cdsEmissorLIB_SSLXMLSIGNLIB: TSmallintField
      DisplayLabel = 'Lib XML Sign'
      FieldName = 'LIB_SSLXMLSIGNLIB'
    end
    object cdsEmissorREFRESH_TOKEN: TStringField
      DisplayLabel = 'Token Api'
      FieldName = 'REFRESH_TOKEN'
      Size = 256
    end
    object cdsEmissorDATA_API_ONLINE: TDateTimeField
      DisplayLabel = 'Data Api Online'
      FieldName = 'DATA_API_ONLINE'
    end
    object cdsEmissorDATA_API_ERROR: TDateTimeField
      DisplayLabel = 'Data Api Erro'
      FieldName = 'DATA_API_ERROR'
    end
  end
  object dsEmissor: TDataSource
    AutoEdit = False
    DataSet = cdsEmissor
    Left = 29
    Top = 424
  end
  object qrBuscas1: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    Left = 256
    Top = 8
  end
  object qrTransporta: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      
        'select clientes.cod_cliente, clientes.nome_cliente, clientes.raz' +
        'ao, clientes.cpfcgc from clientes'
      'where clientes.cod_cliente = 0 and clientes.cod_empresa = 0')
    Left = 104
    Top = 280
  end
  object dspTransporta: TDataSetProvider
    DataSet = qrTransporta
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 104
    Top = 328
  end
  object cdsTransporta: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspTransporta'
    BeforeOpen = cdsNFCeBeforeOpen
    Left = 104
    Top = 376
    object cdsTransportaCOD_CLIENTE: TIntegerField
      DisplayLabel = 'Cod Cliente'
      FieldName = 'COD_CLIENTE'
      Required = True
    end
    object cdsTransportaNOME_CLIENTE: TStringField
      DisplayLabel = 'Nome Transportador'
      FieldName = 'NOME_CLIENTE'
      Required = True
      Size = 35
    end
    object cdsTransportaRAZAO: TStringField
      DisplayLabel = 'Razao Social'
      FieldName = 'RAZAO'
      Required = True
      Size = 60
    end
    object cdsTransportaCPFCGC: TStringField
      DisplayLabel = 'CNPJ'
      FieldName = 'CPFCGC'
      Size = 18
    end
  end
  object dsTransporta: TDataSource
    AutoEdit = False
    DataSet = cdsTransporta
    Left = 104
    Top = 424
  end
  object qrNFCe_It: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select'
      
        'nfce_item.cod_nfce, nfce_item.cod_empresa, nfce_item.seqid, nfce' +
        '_item.nitem, nfce_item.tipo_item, nfce_item.grupo_prod, nfce_ite' +
        'm.cod_prod, nfce_item.cod_grade, nfce_item.num_fab_prod, nfce_it' +
        'em.cean, nfce_item.ncm, nfce_item.cfop, nfce_item.xprod, nfce_it' +
        'em.ucom, nfce_item.qcom, nfce_item.vuncom, nfce_item.vprod, nfce' +
        '_item.vfrete, nfce_item.vseg, nfce_item.vdesc, nfce_item.voutro,' +
        ' nfce_item.prec_cusm_prod, nfce_item.cest, nfce_item.nfci, nfce_' +
        'item.vtottrib, nfce_item.icm_orig, nfce_item.icm_cst, nfce_item.' +
        'icm_modbc, nfce_item.icm_predbc, nfce_item.icm_vbc, nfce_item.ic' +
        'm_picms, nfce_item.icm_vicms, nfce_item.icm_vbcstret, nfce_item.' +
        'icm_vicmsstret, nfce_item.icm_csosn, nfce_item.icm_pcredsn, nfce' +
        '_item.icm_vcredicmssn, nfce_item.pis_cst, nfce_item.pis_vbc, nfc' +
        'e_item.pis_ppis, nfce_item.pis_vpis, nfce_item.pis_qbcprod, nfce' +
        '_item.pis_valiqprod, nfce_item.cofins_cst, nfce_item.cofins_vbc,' +
        ' nfce_item.cofins_pcofins, nfce_item.cofins_vcofins, nfce_item.c' +
        'ofins_qbcprod, nfce_item.cofins_valiqprod, nfce_item.iss_vbc, nf' +
        'ce_item.iss_valiq, nfce_item.iss_vissqn, nfce_item.iss_cmunfg, n' +
        'fce_item.iss_clistserv, nfce_item.iss_vdeducao, nfce_item.iss_vo' +
        'utro, nfce_item.iss_vdescincond, nfce_item.iss_vdesccond, nfce_i' +
        'tem.iss_vissret, nfce_item.iss_indiss, nfce_item.iss_indincentiv' +
        'o, nfce_item.iss_retido, nfce_item.cod_servico, nfce_item.frete_' +
        'na_base'
      'from nfce_item'
      
        'where nfce_item.cod_nfce = 0 and nfce_item.cod_empresa = 0 and n' +
        'fce_item.seqid = 0')
    Left = 93
    Top = 65
  end
  object dspNFCe_It: TDataSetProvider
    DataSet = qrNFCe_It
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 93
    Top = 113
  end
  object cdsNFCe_It: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspNFCe_It'
    BeforeOpen = cdsNFCeBeforeOpen
    Left = 93
    Top = 161
    object cdsNFCe_ItCOD_NFCE: TIntegerField
      DisplayLabel = 'Codigo NFCe'
      FieldName = 'COD_NFCE'
      Required = True
    end
    object cdsNFCe_ItCOD_EMPRESA: TIntegerField
      DisplayLabel = 'CodEmpresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsNFCe_ItSEQID: TIntegerField
      DisplayLabel = 'SeqID'
      FieldName = 'SEQID'
      Required = True
    end
    object cdsNFCe_ItNITEM: TIntegerField
      DisplayLabel = 'Num Item'
      FieldName = 'NITEM'
    end
    object cdsNFCe_ItTIPO_ITEM: TStringField
      DisplayLabel = 'Tipo Item'
      FieldName = 'TIPO_ITEM'
      Size = 1
    end
    object cdsNFCe_ItGRUPO_PROD: TIntegerField
      DisplayLabel = 'Grupo Prod'
      FieldName = 'GRUPO_PROD'
    end
    object cdsNFCe_ItCOD_PROD: TStringField
      DisplayLabel = 'Cod Prod'
      FieldName = 'COD_PROD'
      FixedChar = True
      Size = 6
    end
    object cdsNFCe_ItCOD_GRADE: TIntegerField
      DisplayLabel = 'Cod Grade'
      FieldName = 'COD_GRADE'
    end
    object cdsNFCe_ItNUM_FAB_PROD: TStringField
      DisplayLabel = 'Num Fab Prod'
      FieldName = 'NUM_FAB_PROD'
    end
    object cdsNFCe_ItUVND: TStringField
      DisplayLabel = 'Und'
      FieldName = 'UVND'
      Size = 6
    end
    object cdsNFCe_ItCEAN: TStringField
      DisplayLabel = 'EAN'
      FieldName = 'CEAN'
      Size = 14
    end
    object cdsNFCe_ItXPROD: TStringField
      DisplayLabel = 'Descricao Item'
      FieldName = 'XPROD'
      Size = 120
    end
    object cdsNFCe_ItNCM: TStringField
      FieldName = 'NCM'
      Size = 8
    end
    object cdsNFCe_ItCFOP: TSmallintField
      FieldName = 'CFOP'
    end
    object cdsNFCe_ItQCOM: TFloatField
      DisplayLabel = 'Quantidade(Princ)'
      FieldName = 'QCOM'
    end
    object cdsNFCe_ItVUNCOM: TFloatField
      DisplayLabel = 'Valor Unitario(Princ)'
      FieldName = 'VUNCOM'
    end
    object cdsNFCe_ItVPROD: TFloatField
      DisplayLabel = 'Valor Total'
      FieldName = 'VPROD'
      DisplayFormat = '#,##0.00'
    end
    object cdsNFCe_ItVFRETE: TFloatField
      DisplayLabel = 'Rat Frete'
      FieldName = 'VFRETE'
      DisplayFormat = '#,##0.00'
    end
    object cdsNFCe_ItVSEG: TFloatField
      DisplayLabel = 'Rat Seguro'
      FieldName = 'VSEG'
      DisplayFormat = '#,##0.00'
    end
    object cdsNFCe_ItVDESC: TFloatField
      DisplayLabel = 'Rat Desconto'
      FieldName = 'VDESC'
      DisplayFormat = '#,##0.00'
    end
    object cdsNFCe_ItVOUTRO: TFloatField
      DisplayLabel = 'Rat Outros'
      FieldName = 'VOUTRO'
      DisplayFormat = '#,##0.00'
    end
    object cdsNFCe_ItVTOTTRIB: TFloatField
      DisplayLabel = 'Total Tributos'
      FieldName = 'VTOTTRIB'
      DisplayFormat = '#,##0.00'
    end
    object cdsNFCe_ItCEST: TStringField
      FieldName = 'CEST'
      Size = 7
    end
    object cdsNFCe_ItICM_ORIG: TStringField
      DisplayLabel = 'ICMS Orig'
      FieldName = 'ICM_ORIG'
      FixedChar = True
      Size = 1
    end
    object cdsNFCe_ItICM_CST: TStringField
      DisplayLabel = 'ICMS CST'
      FieldName = 'ICM_CST'
      FixedChar = True
      Size = 2
    end
    object cdsNFCe_ItICM_MODBC: TFloatField
      DisplayLabel = 'ICMS Mod BC'
      FieldName = 'ICM_MODBC'
    end
    object cdsNFCe_ItICM_PREDBC: TFloatField
      DisplayLabel = 'ICMS Perc Red BC'
      FieldName = 'ICM_PREDBC'
    end
    object cdsNFCe_ItICM_VBC: TFloatField
      DisplayLabel = 'ICMS Base Calc'
      FieldName = 'ICM_VBC'
      DisplayFormat = '#,##0.00'
    end
    object cdsNFCe_ItICM_PICMS: TFloatField
      DisplayLabel = 'ICMS Aliquota'
      FieldName = 'ICM_PICMS'
      DisplayFormat = '#,##0.00'
    end
    object cdsNFCe_ItICM_VICMS: TFloatField
      DisplayLabel = 'ICMS Valor'
      FieldName = 'ICM_VICMS'
      DisplayFormat = '#,##0.00'
    end
    object cdsNFCe_ItICM_CSOSN: TStringField
      DisplayLabel = 'ICMS CSOSN'
      FieldName = 'ICM_CSOSN'
      FixedChar = True
      Size = 3
    end
    object cdsNFCe_ItICM_PCREDSN: TFloatField
      DisplayLabel = 'ICMS Cred Simples Nac'
      FieldName = 'ICM_PCREDSN'
      DisplayFormat = '#,##0.00'
    end
    object cdsNFCe_ItICM_VCREDICMSSN: TFloatField
      DisplayLabel = 'ICMS Valor Cred Simples Nac'
      FieldName = 'ICM_VCREDICMSSN'
      DisplayFormat = '#,##0.00'
    end
    object cdsNFCe_ItVICMSMONORET: TFloatField
      DisplayLabel = 'ICM Mono cobrado anteriormente'
      FieldName = 'VICMSMONORET'
    end
    object cdsNFCe_ItADREMICMSRET: TFloatField
      DisplayLabel = 'Aliq ad rem ICM Mono cobrado anteriormente'
      FieldName = 'ADREMICMSRET'
    end
    object cdsNFCe_ItQBCMONORET: TFloatField
      DisplayLabel = 'ICM Qtde BC Mono cobrado anteriormente'
      FieldName = 'QBCMONORET'
    end
    object cdsNFCe_ItPIS_CST: TStringField
      DisplayLabel = 'PIS CST'
      FieldName = 'PIS_CST'
      FixedChar = True
      Size = 2
    end
    object cdsNFCe_ItPIS_VBC: TFloatField
      DisplayLabel = 'PIS Base Calc'
      FieldName = 'PIS_VBC'
      DisplayFormat = '#,##0.00'
    end
    object cdsNFCe_ItPIS_PPIS: TFloatField
      DisplayLabel = 'PIS Aliquota'
      FieldName = 'PIS_PPIS'
      DisplayFormat = '#,##0.00'
    end
    object cdsNFCe_ItPIS_VPIS: TFloatField
      DisplayLabel = 'PIS Valor'
      FieldName = 'PIS_VPIS'
      DisplayFormat = '#,##0.00'
    end
    object cdsNFCe_ItPIS_QBCPROD: TFloatField
      DisplayLabel = 'PIS Qtde Base Calc'
      FieldName = 'PIS_QBCPROD'
    end
    object cdsNFCe_ItPIS_VALIQPROD: TFloatField
      DisplayLabel = 'PIS Aliq em R$'
      FieldName = 'PIS_VALIQPROD'
      DisplayFormat = '#,##0.00'
    end
    object cdsNFCe_ItCOFINS_CST: TStringField
      DisplayLabel = 'COFINS CST'
      FieldName = 'COFINS_CST'
      FixedChar = True
      Size = 2
    end
    object cdsNFCe_ItCOFINS_VBC: TFloatField
      DisplayLabel = 'COFINS Base Calc'
      FieldName = 'COFINS_VBC'
      DisplayFormat = '#,##0.00'
    end
    object cdsNFCe_ItCOFINS_PCOFINS: TFloatField
      DisplayLabel = 'COFINS Aliquota'
      FieldName = 'COFINS_PCOFINS'
      DisplayFormat = '#,##0.00'
    end
    object cdsNFCe_ItCOFINS_VCOFINS: TFloatField
      DisplayLabel = 'COFINS Valor'
      FieldName = 'COFINS_VCOFINS'
      DisplayFormat = '#,##0.00'
    end
    object cdsNFCe_ItCOFINS_QBCPROD: TFloatField
      DisplayLabel = 'COFINS Qtde Base Calc'
      FieldName = 'COFINS_QBCPROD'
    end
    object cdsNFCe_ItCOFINS_VALIQPROD: TFloatField
      DisplayLabel = 'COFINS Aliq em R$'
      FieldName = 'COFINS_VALIQPROD'
      DisplayFormat = '#,##0.00'
    end
    object cdsNFCe_ItISS_VBC: TFloatField
      DisplayLabel = 'ISS Base Calc'
      FieldName = 'ISS_VBC'
      DisplayFormat = '#,##0.00'
    end
    object cdsNFCe_ItISS_VALIQ: TFloatField
      DisplayLabel = 'ISS Aliquota'
      FieldName = 'ISS_VALIQ'
      DisplayFormat = '#,##0.00'
    end
    object cdsNFCe_ItISS_VISSQN: TFloatField
      DisplayLabel = 'ISS Valor'
      FieldName = 'ISS_VISSQN'
      DisplayFormat = '#,##0.00'
    end
    object cdsNFCe_ItISS_CMUNFG: TIntegerField
      DisplayLabel = 'ISS Municipio'
      FieldName = 'ISS_CMUNFG'
    end
    object cdsNFCe_ItISS_CLISTSERV: TStringField
      DisplayLabel = 'ISS Cod Lista'
      FieldName = 'ISS_CLISTSERV'
      FixedChar = True
      Size = 5
    end
    object cdsNFCe_ItISS_VDEDUCAO: TFloatField
      DisplayLabel = 'ISS Deducao'
      FieldName = 'ISS_VDEDUCAO'
      DisplayFormat = '#,##0.00'
    end
    object cdsNFCe_ItISS_VOUTRO: TFloatField
      DisplayLabel = 'ISS Outras Reten'#231#245'es'
      FieldName = 'ISS_VOUTRO'
      DisplayFormat = '#,##0.00'
    end
    object cdsNFCe_ItISS_VDESCINCOND: TFloatField
      DisplayLabel = 'ISS Desc Incondicional'
      FieldName = 'ISS_VDESCINCOND'
      DisplayFormat = '#,##0.00'
    end
    object cdsNFCe_ItISS_VDESCCOND: TFloatField
      DisplayLabel = 'ISS Desconto Condicional'
      FieldName = 'ISS_VDESCCOND'
      DisplayFormat = '#,##0.00'
    end
    object cdsNFCe_ItISS_VISSRET: TFloatField
      DisplayLabel = 'ISS Valor Retido'
      FieldName = 'ISS_VISSRET'
      DisplayFormat = '#,##0.00'
    end
    object cdsNFCe_ItISS_INDISS: TStringField
      DisplayLabel = 'ISS Indicador'
      FieldName = 'ISS_INDISS'
      FixedChar = True
      Size = 2
    end
    object cdsNFCe_ItISS_INDINCENTIVO: TStringField
      DisplayLabel = 'ISS Ind Incentivo Fiscal'
      FieldName = 'ISS_INDINCENTIVO'
      FixedChar = True
      Size = 1
    end
    object cdsNFCe_ItISS_RETIDO: TStringField
      DisplayLabel = 'ISS Retido'
      FieldName = 'ISS_RETIDO'
      FixedChar = True
      Size = 1
    end
    object cdsNFCe_ItCOD_SERVICO: TIntegerField
      DisplayLabel = 'ISS Codigo Servico'
      FieldName = 'COD_SERVICO'
    end
    object cdsNFCe_ItNFCI: TStringField
      FieldName = 'NFCI'
      Size = 36
    end
    object cdsNFCe_ItFRETE_NA_BASE: TStringField
      DisplayLabel = 'Frete Base Calc'
      FieldName = 'FRETE_NA_BASE'
      Size = 1
    end
    object cdsNFCe_ItPREC_CUSM_PROD: TFloatField
      DisplayLabel = 'Custo M'#233'dio do produto'
      FieldName = 'PREC_CUSM_PROD'
    end
    object cdsNFCe_ItALTERA_ESTOQUE_CFOP: TStringField
      DisplayLabel = 'CFOP Altera estoque'
      FieldName = 'ALTERA_ESTOQUE_CFOP'
      Size = 1
    end
    object cdsNFCe_ItPREC_CUS_PROD: TFloatField
      DisplayLabel = #218'ltimo Custo'
      FieldName = 'PREC_CUS_PROD'
    end
    object cdsNFCe_ItNAT_REC: TStringField
      FieldName = 'NAT_REC'
      Size = 3
    end
    object cdsNFCe_ItCOMB_CPRODANP: TStringField
      FieldName = 'COMB_CPRODANP'
      Size = 9
    end
    object cdsNFCe_ItCOMB_DESCANP: TStringField
      FieldName = 'COMB_DESCANP'
      Size = 95
    end
    object cdsNFCe_ItCOMB_PGLP: TFloatField
      FieldName = 'COMB_PGLP'
    end
    object cdsNFCe_ItCOMB_PGNN: TFloatField
      FieldName = 'COMB_PGNN'
    end
    object cdsNFCe_ItCOMB_PGNI: TFloatField
      FieldName = 'COMB_PGNI'
    end
    object cdsNFCe_ItCOMB_VPART: TFloatField
      FieldName = 'COMB_VPART'
    end
    object cdsNFCe_ItCOMB_CODIF: TStringField
      FieldName = 'COMB_CODIF'
      Size = 21
    end
    object cdsNFCe_ItCOMB_UFCONS: TStringField
      FieldName = 'COMB_UFCONS'
      Size = 2
    end
    object cdsNFCe_ItFCP_PFCP: TFloatField
      FieldName = 'FCP_PFCP'
    end
    object cdsNFCe_ItFCP_PFCPST: TFloatField
      FieldName = 'FCP_PFCPST'
    end
    object cdsNFCe_ItICM_PICMSEFET: TFloatField
      FieldName = 'ICM_PICMSEFET'
    end
    object cdsNFCe_ItICM_PREDBCEFET: TFloatField
      FieldName = 'ICM_PREDBCEFET'
    end
    object cdsNFCe_ItESC_INDESCALA: TStringField
      FieldName = 'ESC_INDESCALA'
      Size = 1
    end
    object cdsNFCe_ItESC_CNPJFAB: TStringField
      FieldName = 'ESC_CNPJFAB'
      Size = 14
    end
    object cdsNFCe_ItFCP_VBCFCPSTRET: TFloatField
      FieldName = 'FCP_VBCFCPSTRET'
    end
    object cdsNFCe_ItFCP_PFCPSTRET: TFloatField
      FieldName = 'FCP_PFCPSTRET'
    end
    object cdsNFCe_ItFCP_VFCPSTRET: TFloatField
      FieldName = 'FCP_VFCPSTRET'
    end
    object cdsNFCe_ItNITEM_ORC: TIntegerField
      FieldName = 'NITEM_ORC'
    end
    object cdsNFCe_ItSEL: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'SEL'
      Size = 1
    end
    object cdsNFCe_ItQTRIB: TFloatField
      DisplayLabel = 'Quantidade tribut'#225'vel'
      FieldName = 'QTRIB'
    end
    object cdsNFCe_ItUTRIB: TStringField
      DisplayLabel = 'Unidade tribut'#225'vel'
      FieldName = 'UTRIB'
      Size = 6
    end
    object cdsNFCe_ItUCOM: TStringField
      DisplayLabel = 'Und(Princ)'
      FieldName = 'UCOM'
      Size = 6
    end
    object cdsNFCe_ItUVND_FATOR: TFloatField
      DisplayLabel = 'Fator Unidade'
      FieldName = 'UVND_FATOR'
    end
    object cdsNFCe_ItFCP_VBCFCP: TFloatField
      FieldName = 'FCP_VBCFCP'
    end
    object cdsNFCe_ItFCP_VFCP: TFloatField
      FieldName = 'FCP_VFCP'
    end
    object cdsNFCe_ItVITEM: TBCDField
      DisplayLabel = 'Valor Liquido'
      FieldName = 'VITEM'
      Size = 2
    end
    object cdsNFCe_ItDFE_TRIB_ID: TStringField
      Tag = 1
      DisplayLabel = 'Tributos DFe Id'
      FieldName = 'DFE_TRIB_ID'
      Size = 36
    end
  end
  object dsNFCe_It: TDataSource
    AutoEdit = False
    DataSet = cdsNFCe_It
    Left = 93
    Top = 209
  end
  object qrProd: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select'
      ''
      
        'produtos.grupo_prod, produtos.cod_prod, produtos.num_fab_prod, c' +
        'od_barra.cod_barra,'
      
        ' produtos.unidade, produtos.descr_prod, produtos.descr_prod_red,' +
        ' produtos.nbm,'
      
        ' produtos.codigo_nop, produtos.cst_prod, produtos.cst_pis, produ' +
        'tos.cst_cofins,'
      
        ' produtos.prec_tab_prod, produtos.cest,  produtos.nfci, produtos' +
        '.aliq_pis_diferenciada,'
      
        ' produtos.aliq_cofins_diferenciada, produtos.perc_red_prod, prod' +
        'utos.icm_prod,'
      
        ' produtos.marca_p, produtos.permitir_desconto, produtos.em_promo' +
        'cao, produtos.preco_promocao,'
      
        ' produtos.prec_30_prod, produtos.prec_60_prod, produtos.prec_90_' +
        'prod, produtos.prec_cusm_prod,'
      ' produtos.prec_cus_prod, produtos.csosn, produtos.nat_rec,'
      
        ' produtos.comb_cprodanp, produtos.comb_descanp, produtos.comb_pg' +
        'lp, produtos.comb_pgnn,'
      ' produtos.comb_pgni, produtos.comb_vpart, produtos.comb_codif,'
      
        ' nat_op.alt_est, cod_grade_prod.cod_grade, grade.descricao, grad' +
        'e.descricao1'
      ''
      'from produtos'
      
        'inner join cod_barra on cod_barra.grupo_prod = produtos.grupo_pr' +
        'od and'
      
        'cod_barra.cod_prod = produtos.cod_prod and cod_barra.cod_empresa' +
        ' = produtos.cod_empresa'
      
        'left join cod_grade_prod on cod_grade_prod.grupo_prod = produtos' +
        '.grupo_prod'
      
        'and cod_grade_prod.cod_prod = produtos.cod_prod and cod_grade_pr' +
        'od.cod_empresa = produtos.cod_empresa'
      
        'left join grade on grade.cod_grade = cod_grade_prod.cod_grade an' +
        'd grade.cod_empresa = cod_grade_prod.cod_empresa'
      'left join nat_op on nat_op.codigo_nop = produtos.codigo_nop'
      
        'where produtos.grupo_prod = 0 and produtos.cod_prod = '#39#39' and pro' +
        'dutos.cod_empresa = 0')
    Left = 175
    Top = 280
  end
  object dspProd: TDataSetProvider
    DataSet = qrProd
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 175
    Top = 328
  end
  object cdsProd: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspProd'
    BeforeOpen = cdsNFCeBeforeOpen
    Left = 175
    Top = 376
    object cdsProdGRUPO_PROD: TIntegerField
      DisplayLabel = 'Grupo Prod'
      FieldName = 'GRUPO_PROD'
      Required = True
    end
    object cdsProdCOD_PROD: TStringField
      DisplayLabel = 'Cod Prod'
      FieldName = 'COD_PROD'
      Required = True
      FixedChar = True
      Size = 6
    end
    object cdsProdCOD_GRADE: TIntegerField
      FieldName = 'COD_GRADE'
    end
    object cdsProdNUM_FAB_PROD: TStringField
      DisplayLabel = 'Num Fab Prod'
      FieldName = 'NUM_FAB_PROD'
      FixedChar = True
    end
    object cdsProdCOD_BARRA: TStringField
      DisplayLabel = 'Cod Barras'
      FieldName = 'COD_BARRA'
      Required = True
      FixedChar = True
    end
    object cdsProdUNIDADE: TStringField
      DisplayLabel = 'Unid'
      FieldName = 'UNIDADE'
      Size = 6
    end
    object cdsProdDESCR_PROD: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCR_PROD'
      FixedChar = True
      Size = 75
    end
    object cdsProdDESCR_PROD_RED: TStringField
      DisplayLabel = 'Descri'#231#227'o Reduzida'
      FieldName = 'DESCR_PROD_RED'
      Size = 35
    end
    object cdsProdNBM: TStringField
      DisplayLabel = 'NCM'
      FieldName = 'NBM'
      FixedChar = True
      Size = 8
    end
    object cdsProdCODIGO_NOP: TFloatField
      DisplayLabel = 'CFOP'
      FieldName = 'CODIGO_NOP'
    end
    object cdsProdCST_PROD: TStringField
      DisplayLabel = 'CST ICMS'
      FieldName = 'CST_PROD'
      FixedChar = True
      Size = 3
    end
    object cdsProdCSOSN: TStringField
      FieldName = 'CSOSN'
      FixedChar = True
      Size = 3
    end
    object cdsProdCST_PIS: TStringField
      DisplayLabel = 'CST PIS'
      FieldName = 'CST_PIS'
      FixedChar = True
      Size = 2
    end
    object cdsProdCST_COFINS: TStringField
      DisplayLabel = 'CST COFINS'
      FieldName = 'CST_COFINS'
      FixedChar = True
      Size = 2
    end
    object cdsProdPREC_TAB_PROD: TFloatField
      DisplayLabel = 'Pre'#231'o Tabela'
      FieldName = 'PREC_TAB_PROD'
      DisplayFormat = '#,##0.000'
    end
    object cdsProdCEST: TStringField
      FieldName = 'CEST'
      Size = 7
    end
    object cdsProdNFCI: TStringField
      FieldName = 'NFCI'
      Size = 36
    end
    object cdsProdALIQ_PIS_DIFERENCIADA: TFloatField
      DisplayLabel = 'Aliq PIS Dif ou R$'
      FieldName = 'ALIQ_PIS_DIFERENCIADA'
      DisplayFormat = '#,##0.000'
    end
    object cdsProdALIQ_COFINS_DIFERENCIADA: TFloatField
      DisplayLabel = 'Aliq CFOINS Dif ou R$'
      FieldName = 'ALIQ_COFINS_DIFERENCIADA'
      DisplayFormat = '#,##0.000'
    end
    object cdsProdPERC_RED_PROD: TFloatField
      DisplayLabel = '% Reducao BC ICMS'
      FieldName = 'PERC_RED_PROD'
      DisplayFormat = '#,##0.00'
    end
    object cdsProdICM_PROD: TFloatField
      DisplayLabel = 'Aliquota ICMS'
      FieldName = 'ICM_PROD'
      DisplayFormat = '#,##0.00'
    end
    object cdsProdMARCA_P: TStringField
      DisplayLabel = 'Marca'
      FieldName = 'MARCA_P'
      FixedChar = True
      Size = 10
    end
    object cdsProdPERMITIR_DESCONTO: TStringField
      DisplayLabel = 'Permite Desconto'
      FieldName = 'PERMITIR_DESCONTO'
      FixedChar = True
      Size = 1
    end
    object cdsProdEM_PROMOCAO: TStringField
      DisplayLabel = 'Em Promo'#231#227'o'
      FieldName = 'EM_PROMOCAO'
      FixedChar = True
      Size = 1
    end
    object cdsProdPRECO_PROMOCAO: TFloatField
      DisplayLabel = 'Pre'#231'o Promo'#231#227'o'
      FieldName = 'PRECO_PROMOCAO'
    end
    object cdsProdPREC_30_PROD: TFloatField
      DisplayLabel = 'Preco 30 dias'
      FieldName = 'PREC_30_PROD'
      DisplayFormat = '#,##0.000'
    end
    object cdsProdPREC_60_PROD: TFloatField
      DisplayLabel = 'Preco 60 dias'
      FieldName = 'PREC_60_PROD'
      DisplayFormat = '#,##0.000'
    end
    object cdsProdPREC_90_PROD: TFloatField
      DisplayLabel = 'Preco 90 dias'
      FieldName = 'PREC_90_PROD'
      DisplayFormat = '#,##0.000'
    end
    object cdsProdPREC_CUS_PROD: TFloatField
      FieldName = 'PREC_CUS_PROD'
      DisplayFormat = '#,##0.000'
    end
    object cdsProdPREC_CUSM_PROD: TFloatField
      FieldName = 'PREC_CUSM_PROD'
      Visible = False
      DisplayFormat = '#,##0.000'
    end
    object cdsProdDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 32
    end
    object cdsProdDESCRICAO1: TStringField
      FieldName = 'DESCRICAO1'
      Size = 32
    end
    object cdsProdALT_EST: TStringField
      FieldName = 'ALT_EST'
      Size = 1
    end
    object cdsProdNAT_REC: TStringField
      FieldName = 'NAT_REC'
      Size = 3
    end
    object cdsProdCOMB_CPRODANP: TStringField
      DisplayLabel = 'Cod ANP(Comb)'
      FieldName = 'COMB_CPRODANP'
      Size = 9
    end
    object cdsProdCOMB_DESCANP: TStringField
      DisplayLabel = 'Desc. ANP(Comb)'
      FieldName = 'COMB_DESCANP'
      Size = 95
    end
    object cdsProdCOMB_PGLP: TFloatField
      DisplayLabel = '%GLP(Comb)'
      FieldName = 'COMB_PGLP'
    end
    object cdsProdCOMB_PGNN: TFloatField
      DisplayLabel = '%Gas Nat Nacional(Comb)'
      FieldName = 'COMB_PGNN'
    end
    object cdsProdCOMB_PGNI: TFloatField
      DisplayLabel = '%Gas Nat Importado(Comb)'
      FieldName = 'COMB_PGNI'
    end
    object cdsProdCOMB_VPART: TFloatField
      DisplayLabel = 'Valor de Partida(Comb)'
      FieldName = 'COMB_VPART'
    end
    object cdsProdCOMB_CODIF: TStringField
      DisplayLabel = 'CODIF(Comb)'
      FieldName = 'COMB_CODIF'
      Size = 21
    end
    object cdsProdFCP_ALIQ: TFloatField
      DisplayLabel = 'Aliq(FCP)'
      FieldName = 'FCP_ALIQ'
      DisplayFormat = '#,##0.00'
    end
    object cdsProdNFE_INDESCALA: TStringField
      DisplayLabel = 'Indicador de escala relevante'
      FieldName = 'NFE_INDESCALA'
      Size = 1
    end
    object cdsProdNFE_CNPJFAB: TStringField
      DisplayLabel = 'CNPJ do Fabricante'
      FieldName = 'NFE_CNPJFAB'
      Size = 14
    end
    object cdsProdFCP_VBCFCPSTRET: TFloatField
      DisplayLabel = 'Base ST Retida Ant(FCP)'
      FieldName = 'FCP_VBCFCPSTRET'
      DisplayFormat = '#,##0.00'
    end
    object cdsProdFCP_PFCPSTRET: TFloatField
      DisplayLabel = 'Aliq ST Retida Ant(FCP)'
      FieldName = 'FCP_PFCPSTRET'
      DisplayFormat = '#,##0.00'
    end
    object cdsProdFCP_VFCPSTRET: TFloatField
      DisplayLabel = 'Valor ST Retida Ant(FCP)'
      FieldName = 'FCP_VFCPSTRET'
      DisplayFormat = '#,##0.00'
    end
    object cdsProdALT_COD_CUPOM: TStringField
      FieldName = 'ALT_COD_CUPOM'
      Size = 1
    end
    object cdsProdALT_DESC_CUPOM: TStringField
      FieldName = 'ALT_DESC_CUPOM'
      Size = 1
    end
    object cdsProdLISTA_IMAGENS: TMemoField
      FieldName = 'LISTA_IMAGENS'
      BlobType = ftMemo
    end
    object cdsProdVICMSMONORET: TFloatField
      DisplayLabel = 'Valor ICMS Mono cobrado em opera'#231#227'o anterior'
      FieldName = 'VICMSMONORET'
      DisplayFormat = '#,##0.00'
    end
    object cdsProdADREMICMSRET: TFloatField
      DisplayLabel = 'Aliq ad rem ICMS Mono cobrado em opera'#231#227'o anterior'
      FieldName = 'ADREMICMSRET'
      DisplayFormat = '#,##0.0000'
    end
    object cdsProdNFE_QTRIB: TFloatField
      DisplayLabel = 'Quantidade tribut'#225'vel'
      FieldName = 'NFE_QTRIB'
    end
    object cdsProdNFE_UTRIB: TStringField
      DisplayLabel = 'Unidade tribut'#225'vel'
      FieldName = 'NFE_UTRIB'
      Size = 6
    end
    object cdsProdGRUPO_FISCAL_IBSCBS: TStringField
      Tag = 1
      FieldName = 'GRUPO_FISCAL_IBSCBS'
      Visible = False
      Size = 36
    end
  end
  object dsProd: TDataSource
    AutoEdit = False
    DataSet = cdsProd
    Left = 175
    Top = 424
  end
  object qrServ: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select'
      
        'tipo_servico.cod_servico, tipo_servico.desc_servico, tipo_servic' +
        'o.valor_servico,'
      
        'tiposerviconfse.cod_tpservico, tiposerviconfse.desc_tpservico, t' +
        'ipo_servico.aliq_iss,'
      
        'tipo_servico.cst_pis, tipo_servico.cst_cofins, tipo_servico.codi' +
        'go_nop,'
      
        'tipo_servico.isento_serv, tipo_servico.n_incidencia_serv, tipo_s' +
        'ervico.iss_retido,'
      'tipo_servico.unidade'
      'from tipo_servico'
      
        'left join tiposerviconfse on tiposerviconfse.cod_tpservico = tip' +
        'o_servico.nfs_servico'
      'where tipo_servico.cod_servico = 0')
    Left = 227
    Top = 280
  end
  object dspServ: TDataSetProvider
    DataSet = qrServ
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 227
    Top = 328
  end
  object cdsServ: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspServ'
    BeforeOpen = cdsNFCeBeforeOpen
    Left = 227
    Top = 376
    object cdsServCOD_SERVICO: TIntegerField
      DisplayLabel = 'Cod Servico'
      FieldName = 'COD_SERVICO'
      Required = True
    end
    object cdsServDESC_SERVICO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESC_SERVICO'
      FixedChar = True
      Size = 60
    end
    object cdsServVALOR_SERVICO: TFloatField
      DisplayLabel = 'Valor Servi'#231'o'
      FieldName = 'VALOR_SERVICO'
    end
    object cdsServUNIDADE: TStringField
      DisplayLabel = 'Und'
      FieldName = 'UNIDADE'
      Size = 3
    end
    object cdsServCOD_TPSERVICO: TStringField
      DisplayLabel = 'Cod Lista Serv'
      FieldName = 'COD_TPSERVICO'
      FixedChar = True
      Size = 5
    end
    object cdsServDESC_TPSERVICO: TStringField
      DisplayLabel = 'Descri'#231#227'o Serv Lista'
      FieldName = 'DESC_TPSERVICO'
      Size = 200
    end
    object cdsServALIQ_ISS: TFloatField
      DisplayLabel = 'Aliquota ISS'
      FieldName = 'ALIQ_ISS'
    end
    object cdsServCST_PIS: TStringField
      DisplayLabel = 'CST PIS'
      FieldName = 'CST_PIS'
      FixedChar = True
      Size = 2
    end
    object cdsServCST_COFINS: TStringField
      DisplayLabel = 'CST COFINS'
      FieldName = 'CST_COFINS'
      FixedChar = True
      Size = 2
    end
    object cdsServCODIGO_NOP: TFloatField
      DisplayLabel = 'CFOP'
      FieldName = 'CODIGO_NOP'
    end
    object cdsServISENTO_SERV: TStringField
      DisplayLabel = 'ISS Isento'
      FieldName = 'ISENTO_SERV'
      FixedChar = True
      Size = 1
    end
    object cdsServN_INCIDENCIA_SERV: TStringField
      DisplayLabel = 'ISS N'#227'o Incidente'
      FieldName = 'N_INCIDENCIA_SERV'
      FixedChar = True
      Size = 1
    end
    object cdsServISS_RETIDO: TIntegerField
      DisplayLabel = 'ISS Retido'
      FieldName = 'ISS_RETIDO'
    end
  end
  object dsServ: TDataSource
    AutoEdit = False
    DataSet = cdsServ
    Left = 227
    Top = 424
  end
  object qrNFCe_Pag: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select'
      
        'nfce_pagamento.cod_nfce, nfce_pagamento.cod_empresa, nfce_pagame' +
        'nto.seqid,'
      
        'nfce_pagamento.tpag, nfce_pagamento.vpag, nfce_pagamento.cnpj, n' +
        'fce_pagamento.tband,'
      
        'nfce_pagamento.caut, nfce_pagamento.cod_controle, controles.nome' +
        '_ctrl'
      'from nfce_pagamento'
      
        'left join controles on controles.codigo_ctrl = nfce_pagamento.co' +
        'd_controle and'
      'controles.codigo_emp = nfce_pagamento.cod_empresa'
      
        'where nfce_pagamento.cod_nfce = 0 and nfce_pagamento.cod_empresa' +
        ' = 0 and nfce_pagamento.seqid = 0')
    Left = 165
    Top = 65
  end
  object dspNFCe_Pag: TDataSetProvider
    DataSet = qrNFCe_Pag
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 165
    Top = 113
  end
  object cdsNFCe_Pag: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspNFCe_Pag'
    BeforeOpen = cdsNFCeBeforeOpen
    Left = 165
    Top = 161
    object cdsNFCe_PagCOD_NFCE: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'COD_NFCE'
      Required = True
    end
    object cdsNFCe_PagCOD_EMPRESA: TIntegerField
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsNFCe_PagSEQID: TIntegerField
      DisplayLabel = 'SeqID'
      FieldName = 'SEQID'
      Required = True
    end
    object cdsNFCe_PagTPAG: TSmallintField
      DisplayLabel = 'Tipo Pagamento'
      FieldName = 'TPAG'
    end
    object cdsNFCe_PagVPAG: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VPAG'
      DisplayFormat = '#,##0.00'
    end
    object cdsNFCe_PagTBAND: TSmallintField
      DisplayLabel = 'Bandeira do Cartao'
      FieldName = 'TBAND'
    end
    object cdsNFCe_PagCAUT: TStringField
      DisplayLabel = 'Numero de Autoriza'#231#227'o'
      FieldName = 'CAUT'
    end
    object cdsNFCe_PagCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 14
    end
    object cdsNFCe_PagCOD_CONTROLE: TIntegerField
      DisplayLabel = 'Cod Controle'
      FieldName = 'COD_CONTROLE'
    end
    object cdsNFCe_PagNOME_CTRL: TStringField
      DisplayLabel = 'Forma de Pagamento'
      FieldName = 'NOME_CTRL'
      Size = 35
    end
    object cdsNFCe_PagINDPAG: TStringField
      DisplayLabel = 'Ind Pag'
      FieldName = 'INDPAG'
      Size = 1
    end
    object cdsNFCe_PagID_TR_CARTAO: TIntegerField
      DisplayLabel = 'Transacao Cartao Id'
      FieldName = 'ID_TR_CARTAO'
    end
    object cdsNFCe_PagGUID_TR_CARTAO: TStringField
      DisplayLabel = 'Transacao Cartao Guid'
      FieldName = 'GUID_TR_CARTAO'
      Size = 36
    end
  end
  object dsNFCe_Pag: TDataSource
    AutoEdit = False
    DataSet = cdsNFCe_Pag
    Left = 165
    Top = 209
  end
  object qrCtrlFormPag: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      
        'select '#39'C'#39'||controles.codigo_ctrl ID, controles.codigo_ctrl, con' +
        'troles.nome_ctrl, controles.nfce_tpag, clientes.cpfcgc,'
      'controles.cartao_sped, controles.qseqperf'
      'from controles'
      
        'inner join clientes on clientes.cod_cliente = controles.cartao_s' +
        'ped_part and clientes.cod_empresa = controles.codigo_emp'
      
        'where controles.cxent = '#39'S'#39' and controles.codigo_emp = 1 and con' +
        'troles.nfce_tpag > 0'
      'and controles.cartao_sped in (1, 2)'
      'union'
      
        'select '#39'C'#39'||controles.codigo_ctrl ID, controles.codigo_ctrl, con' +
        'troles.nome_ctrl, controles.nfce_tpag, '#39' '#39' cpfcgc,'
      'controles.cartao_sped, controles.qseqperf'
      'from controles'
      
        'where controles.cxent = '#39'S'#39' and controles.codigo_emp = 1 and con' +
        'troles.nfce_tpag > 0'
      'and coalesce(controles.cartao_sped,0) not in (1, 2)'
      'union'
      
        'select '#39'N01'#39', 0, '#39'01 - Dinheiro'#39'         ,  1, '#39' '#39', 0, 901 from ' +
        'rdb$database union'
      
        'select '#39'N02'#39', 0, '#39'02 - Cheque'#39'           ,  2, '#39' '#39', 0, 902 from ' +
        'rdb$database union'
      
        'select '#39'N03'#39', 0, '#39'03 - Cart'#227'o de Cr'#233'dito'#39',  3, '#39' '#39', 0, 903 from ' +
        'rdb$database union'
      
        'select '#39'N04'#39', 0, '#39'04 - Cart'#227'o de D'#233'bito'#39' ,  4, '#39' '#39', 0, 904 from ' +
        'rdb$database union'
      
        'select '#39'N05'#39', 0, '#39'05 - Cr'#233'dito Loja'#39'     ,  5, '#39' '#39', 0, 905 from ' +
        'rdb$database union'
      
        'select '#39'N10'#39', 0, '#39'10 - Vale Alimenta'#231#227'o'#39' , 10, '#39' '#39', 0, 910 from ' +
        'rdb$database union'
      
        'select '#39'N11'#39', 0, '#39'11 - Vale Refei'#231#227'o'#39'    , 11, '#39' '#39', 0, 911 from ' +
        'rdb$database union'
      
        'select '#39'N12'#39', 0, '#39'12 - Vale Presente'#39'    , 12, '#39' '#39', 0, 912 from ' +
        'rdb$database union'
      
        'select '#39'N13'#39', 0, '#39'13 - Vale Combust'#237'vel'#39' , 13, '#39' '#39', 0, 913 from ' +
        'rdb$database union'
      
        'select '#39'N99'#39', 0, '#39'99 - Outros'#39'           , 99, '#39' '#39', 0, 999 from ' +
        'rdb$database'
      'order by 7')
    Left = 315
    Top = 280
  end
  object dspCtrlFormPag: TDataSetProvider
    DataSet = qrCtrlFormPag
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 315
    Top = 328
  end
  object cdsCtrlFormPag: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspCtrlFormPag'
    BeforeOpen = cdsNFCeBeforeOpen
    Left = 315
    Top = 376
    object cdsCtrlFormPagID: TStringField
      FieldName = 'ID'
      Size = 12
    end
    object cdsCtrlFormPagCODIGO_CTRL: TIntegerField
      FieldName = 'CODIGO_CTRL'
      Required = True
    end
    object cdsCtrlFormPagNOME_CTRL: TStringField
      FieldName = 'NOME_CTRL'
      Size = 35
    end
    object cdsCtrlFormPagNFCE_TPAG: TIntegerField
      FieldName = 'NFCE_TPAG'
    end
    object cdsCtrlFormPagCPFCGC: TStringField
      FieldName = 'CPFCGC'
      Size = 18
    end
    object cdsCtrlFormPagCARTAO_SPED: TIntegerField
      FieldName = 'CARTAO_SPED'
    end
    object cdsCtrlFormPagQSEQPERF: TIntegerField
      FieldName = 'QSEQPERF'
    end
    object cdsCtrlFormPagNAT_CTRL: TStringField
      FieldName = 'NAT_CTRL'
      Size = 1
    end
    object cdsCtrlFormPagDISPLAYV2: TStringField
      FieldKind = fkCalculated
      FieldName = 'DISPLAYV2'
      Size = 256
      Calculated = True
    end
    object cdsCtrlFormPagTP_PLANO: TStringField
      FieldName = 'TP_PLANO'
      Size = 1
    end
    object cdsCtrlFormPagDOCS: TStringField
      FieldName = 'DOCS'
      Size = 2
    end
    object cdsCtrlFormPagTEF_TIPO: TSmallintField
      FieldName = 'TEF_TIPO'
    end
    object cdsCtrlFormPagTEF_ID_CARTDIG: TStringField
      FieldName = 'TEF_ID_CARTDIG'
      Size = 8
    end
    object cdsCtrlFormPagTEF_ID_PSP: TStringField
      FieldName = 'TEF_ID_PSP'
      Size = 8
    end
  end
  object dsCtrlFormPag: TDataSource
    AutoEdit = False
    DataSet = cdsCtrlFormPag
    Left = 315
    Top = 424
  end
  object qrNFCe_Config: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select'
      
        'nfce_config.cod_empresa, nfce_config.usar_conf_nfe, nfce_config.' +
        'cert_arquivopfx, nfce_config.cert_num_serie, nfce_config.cert_se' +
        'nha, nfce_config.csc_id1, nfce_config.csc_token1, nfce_config.cs' +
        'c_id2, nfce_config.csc_token2, nfce_config.ws_uf, nfce_config.ws' +
        '_tbamb, nfce_config.ws_sinc_assinc, nfce_config.ws_aguardar, nfc' +
        'e_config.ws_tentativas, nfce_config.ws_intervalo, nfce_config.ws' +
        '_proxy_host, nfce_config.ws_proxy_port, nfce_config.ws_proxy_use' +
        'r, nfce_config.ws_proxy_pass, nfce_config.ws_timeout, nfce_confi' +
        'g.ws_visualizar, nfce_config.arq_path_salvar, nfce_config.arq_pa' +
        'th_schema, nfce_config.arq_logo_emp, nfce_config.email_smpt_host' +
        ', nfce_config.email_smtp_porta, nfce_config.email_username, nfce' +
        '_config.email_password, nfce_config.email_usa_ssl, nfce_config.e' +
        'mail_assunto, nfce_config.email_mensagem, nfce_config.tpemis, nf' +
        'ce_config.dhcont, nfce_config.xjust'
      'from nfce_config'
      'where nfce_config.cod_empresa = 0')
    Left = 405
    Top = 281
  end
  object dspNFCe_Config: TDataSetProvider
    DataSet = qrNFCe_Config
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 405
    Top = 329
  end
  object cdsNFCe_Config: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspNFCe_Config'
    BeforeOpen = cdsNFCeBeforeOpen
    Left = 405
    Top = 377
    object cdsNFCe_ConfigCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsNFCe_ConfigUSAR_CONF_NFE: TStringField
      FieldName = 'USAR_CONF_NFE'
      FixedChar = True
      Size = 1
    end
    object cdsNFCe_ConfigCERT_ARQUIVOPFX: TStringField
      FieldName = 'CERT_ARQUIVOPFX'
      Size = 256
    end
    object cdsNFCe_ConfigCERT_NUM_SERIE: TStringField
      FieldName = 'CERT_NUM_SERIE'
      Size = 64
    end
    object cdsNFCe_ConfigCERT_SENHA: TStringField
      FieldName = 'CERT_SENHA'
      Size = 32
    end
    object cdsNFCe_ConfigCSC_ID1: TStringField
      FieldName = 'CSC_ID1'
      Size = 6
    end
    object cdsNFCe_ConfigCSC_TOKEN1: TStringField
      FieldName = 'CSC_TOKEN1'
      Size = 36
    end
    object cdsNFCe_ConfigCSC_ID2: TStringField
      FieldName = 'CSC_ID2'
      Size = 6
    end
    object cdsNFCe_ConfigCSC_TOKEN2: TStringField
      FieldName = 'CSC_TOKEN2'
      Size = 36
    end
    object cdsNFCe_ConfigWS_UF: TStringField
      FieldName = 'WS_UF'
      FixedChar = True
      Size = 2
    end
    object cdsNFCe_ConfigWS_TBAMB: TStringField
      FieldName = 'WS_TBAMB'
      FixedChar = True
      Size = 1
    end
    object cdsNFCe_ConfigWS_SINC_ASSINC: TStringField
      FieldName = 'WS_SINC_ASSINC'
      FixedChar = True
      Size = 1
    end
    object cdsNFCe_ConfigWS_AGUARDAR: TSmallintField
      FieldName = 'WS_AGUARDAR'
    end
    object cdsNFCe_ConfigWS_TENTATIVAS: TSmallintField
      FieldName = 'WS_TENTATIVAS'
    end
    object cdsNFCe_ConfigWS_INTERVALO: TSmallintField
      FieldName = 'WS_INTERVALO'
    end
    object cdsNFCe_ConfigWS_PROXY_HOST: TStringField
      FieldName = 'WS_PROXY_HOST'
      Size = 64
    end
    object cdsNFCe_ConfigWS_PROXY_PORT: TStringField
      FieldName = 'WS_PROXY_PORT'
      Size = 32
    end
    object cdsNFCe_ConfigWS_PROXY_USER: TStringField
      FieldName = 'WS_PROXY_USER'
      Size = 64
    end
    object cdsNFCe_ConfigWS_PROXY_PASS: TStringField
      FieldName = 'WS_PROXY_PASS'
      Size = 64
    end
    object cdsNFCe_ConfigWS_TIMEOUT: TSmallintField
      FieldName = 'WS_TIMEOUT'
    end
    object cdsNFCe_ConfigWS_VISUALIZAR: TStringField
      FieldName = 'WS_VISUALIZAR'
      FixedChar = True
      Size = 1
    end
    object cdsNFCe_ConfigARQ_PATH_SALVAR: TStringField
      FieldName = 'ARQ_PATH_SALVAR'
      Size = 256
    end
    object cdsNFCe_ConfigARQ_PATH_SCHEMA: TStringField
      FieldName = 'ARQ_PATH_SCHEMA'
      Size = 256
    end
    object cdsNFCe_ConfigARQ_LOGO_EMP: TStringField
      FieldName = 'ARQ_LOGO_EMP'
      Size = 256
    end
    object cdsNFCe_ConfigEMAIL_SMPT_HOST: TStringField
      FieldName = 'EMAIL_SMPT_HOST'
      Size = 50
    end
    object cdsNFCe_ConfigEMAIL_SMTP_PORTA: TIntegerField
      FieldName = 'EMAIL_SMTP_PORTA'
    end
    object cdsNFCe_ConfigEMAIL_USERNAME: TStringField
      FieldName = 'EMAIL_USERNAME'
      Size = 50
    end
    object cdsNFCe_ConfigEMAIL_PASSWORD: TStringField
      DisplayLabel = 'Mensagem de email'
      FieldName = 'EMAIL_PASSWORD'
      Size = 30
    end
    object cdsNFCe_ConfigEMAIL_USA_SSL: TStringField
      FieldName = 'EMAIL_USA_SSL'
      FixedChar = True
      Size = 1
    end
    object cdsNFCe_ConfigEMAIL_USA_TLS: TStringField
      FieldName = 'EMAIL_USA_TLS'
      Size = 1
    end
    object cdsNFCe_ConfigEMAIL_ASSUNTO: TStringField
      FieldName = 'EMAIL_ASSUNTO'
      Size = 70
    end
    object cdsNFCe_ConfigEMAIL_MENSAGEM: TMemoField
      FieldName = 'EMAIL_MENSAGEM'
      BlobType = ftMemo
      Size = 8
    end
    object cdsNFCe_ConfigTPEMIS: TSmallintField
      DisplayLabel = 'Tipo de Emissao'
      FieldName = 'TPEMIS'
    end
    object cdsNFCe_ConfigXJUST: TStringField
      DisplayLabel = 'Justificativa da entrada em conting'#234'ncia'
      FieldName = 'XJUST'
      Size = 256
    end
    object cdsNFCe_ConfigWS_LIB_SSL: TSmallintField
      FieldName = 'WS_LIB_SSL'
    end
    object cdsNFCe_ConfigXJUST_AUTO: TStringField
      FieldName = 'XJUST_AUTO'
      Size = 256
    end
    object cdsNFCe_ConfigDHCONT: TDateTimeField
      FieldName = 'DHCONT'
    end
    object cdsNFCe_ConfigCERT_DADOSPFX: TMemoField
      Tag = 1
      FieldName = 'CERT_DADOSPFX'
      BlobType = ftMemo
    end
  end
  object dsNFCe_Config: TDataSource
    AutoEdit = False
    DataSet = cdsNFCe_Config
    Left = 405
    Top = 425
  end
  object qrNFCe_Dest: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      
        'select nfce_dest.cod_nfce, nfce_dest.cod_empresa, nfce_dest.cnpj' +
        'cpf, nfce_dest.xnome, nfce_dest.email, nfce_dest.xlgr, nfce_dest' +
        '.nro, nfce_dest.xcpl, nfce_dest.xbairro, nfce_dest.cmun, nfce_de' +
        'st.xmun, nfce_dest.uf, nfce_dest.cep, nfce_dest.fone'
      'from nfce_dest'
      'where nfce_dest.cod_nfce = 0 and nfce_dest.cod_empresa = 0')
    Left = 237
    Top = 65
  end
  object dspNFCe_Dest: TDataSetProvider
    DataSet = qrNFCe_Dest
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 237
    Top = 113
  end
  object cdsNFCe_Dest: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspNFCe_Dest'
    BeforeOpen = cdsNFCeBeforeOpen
    Left = 237
    Top = 161
    object cdsNFCe_DestCOD_NFCE: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'COD_NFCE'
      Required = True
    end
    object cdsNFCe_DestCOD_EMPRESA: TIntegerField
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsNFCe_DestCNPJCPF: TStringField
      DisplayLabel = 'CPF/CNPJ'
      FieldName = 'CNPJCPF'
      Size = 14
    end
    object cdsNFCe_DestXNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'XNOME'
      Size = 60
    end
    object cdsNFCe_DestEMAIL: TStringField
      DisplayLabel = 'email'
      FieldName = 'EMAIL'
      Size = 256
    end
    object cdsNFCe_DestXLGR: TStringField
      DisplayLabel = 'Logradouro'
      FieldName = 'XLGR'
      Size = 60
    end
    object cdsNFCe_DestNRO: TStringField
      DisplayLabel = 'Numero'
      FieldName = 'NRO'
      Size = 60
    end
    object cdsNFCe_DestXCPL: TStringField
      DisplayLabel = 'Complemento'
      FieldName = 'XCPL'
      Size = 60
    end
    object cdsNFCe_DestXBAIRRO: TStringField
      DisplayLabel = 'Bairro'
      FieldName = 'XBAIRRO'
      Size = 60
    end
    object cdsNFCe_DestCMUN: TIntegerField
      DisplayLabel = 'IBGE Cidade'
      FieldName = 'CMUN'
    end
    object cdsNFCe_DestXMUN: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'XMUN'
      Size = 60
    end
    object cdsNFCe_DestUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object cdsNFCe_DestCEP: TStringField
      FieldName = 'CEP'
      Size = 8
    end
    object cdsNFCe_DestFONE: TStringField
      DisplayLabel = 'Fone'
      FieldName = 'FONE'
      Size = 14
    end
  end
  object dsNFCe_Dest: TDataSource
    AutoEdit = False
    DataSet = cdsNFCe_Dest
    Left = 237
    Top = 209
  end
end
