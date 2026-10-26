object DtmNFEHW: TDtmNFEHW
  OldCreateOrder = False
  Height = 398
  Width = 882
  object IbTransNFe: TIBTransaction
    DefaultDatabase = IbConexaoNFe
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 32
    Top = 256
  end
  object IbConexaoNFe: TIBDatabase
    DatabaseName = 'note-jp:D:\Hw\bases\clientes\Hwauto.Brilhante.fdb'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    ServerType = 'IBServer'
    Left = 24
    Top = 24
  end
  object IbNFe: TIBQuery
    Database = IbConexaoNFe
    Transaction = IbTransNFe
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      
        'SELECT  NF.SEL_NFE, NF.NUM_NF,NF.TIPO_NF, NF.COD_EMPRESA,NF.NATU' +
        'REZA_NF,'
      'CL.COD_CLIENTE,CL.NOME_CLIENTE,'
      'NF.DATA_CONTABIL,NF.SERIE,NF.DATA_ENT_SAIDA,'
      'NF.CHAVE_NFE,NF.RESULTADO_ENVIO,'
      'NF.DATA_AUTORIZACAO,NF.SITUACAO_NFE,NF.DIGEST,'
      'NF.PROTOCOLO,NF.CODIGOERRO,NF.DESCRICAOERRO,'
      'NF.TEMPORESPOSTA,NF.HORA_ENVIO,NF.TIPONFE,'
      'NF.DANFEIMPRESSO,DATAHORA_ENVIO,NF.BASE_ICM,'
      
        'NF.VALOR_ICM,NF.VALOR_TOTAL,NF.VALOR_PROD,NF.BASE_ICMSUB,NF.VALO' +
        'R_ICMSUB,'
      
        'NF.VALOR_FRETE,NF.VALOR_SEGURO,NF.VALOR_DESC,NF.VALOR_IPI,NF.VAL' +
        'OR_OUT_DESP,'
      
        'NF.VALOR_IRRF,NF.CODIGO_NOP,NF.DESC_NATOP,JUST_CANCELAMENTO,NF.C' +
        'OD_COND_PAG,NF.NUM_NF_VNDANT,NF.SUB_SERIEANT,NF.OBS,NF.CODIGO_TR' +
        ','
      'NF.PLACA_TR,NF.FRETECONTA_TR,NF.QTDE_VOLUMES_TR,NF.ESPECIE_TR,'
      
        'NF.MARCA_TR,NF.NUMERO_TR,NF.PESO_B,NF.PESO_L,NF.UF_PLACA_TR,NF.N' +
        'FE_DHCONT,NF.NFE_XJUST,NF.NFE_DPEC_NREGDPEC,'
      
        'NF.NFE_DPEC_XMOTIVO,NF.DADOS_INTERESSE_FISCO,NF.TIPO_EMISSAO,NF.' +
        'NUM_NF_EMT,NF.SERIE_EMT,NF.HORA_ENT_SAIDA,NF.CRT,NF.COD_NF,'
      
        'NF.NFE_CMSG,NF.NFE_XMSG,NF.CNAE_FISCAL,NF.INSCRICAO_SUBSTITUTO,N' +
        'F.IM_EMP,NF.VALOR_SERV,NF.BASE_ISS,NF.VALOR_ISS,NF.ALIQ_ISS,NF.S' +
        'TATUS,NF.LOTE_NFE,NF.N_COMANDO,NF.DATA_LANC,NF.VALOR_PIS,NF.VALO' +
        'R_COFINS,NF.NFE_RECIBO,NF.STAT_NFERECIBO'
      
        'FROM NOTAFISCAL NF, CLIENTES CL WHERE NF.COD_CLIENTE = CL.COD_CL' +
        'IENTE AND NF.COD_EMPRESA = CL.COD_EMPRESA AND NF.ATIVO = 1')
    Left = 184
    Top = 24
  end
  object DspNFe: TDataSetProvider
    DataSet = IbNFe
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 184
    Top = 72
  end
  object CdsNFeVenda: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspNFe'
    BeforeOpen = CdsNFeVendaBeforeOpen
    AfterScroll = CdsNFeVendaAfterScroll
    Left = 176
    Top = 128
    object CdsNFeVendaSEL_NFE: TIntegerField
      DisplayLabel = 'SEL'
      FieldName = 'SEL_NFE'
    end
    object CdsNFeVendaNUM_NF: TIntegerField
      DisplayLabel = 'Num. Nota'
      FieldName = 'NUM_NF'
      Required = True
    end
    object CdsNFeVendaSITUACAO_NFE: TWideStringField
      DisplayLabel = 'Situa'#231#227'o NFe'
      FieldName = 'SITUACAO_NFE'
      Size = 40
    end
    object CdsNFeVendaNATUREZA_NF: TWideStringField
      DisplayLabel = 'Natureza da NF'
      FieldName = 'NATUREZA_NF'
      Required = True
      FixedChar = True
      Size = 1
    end
    object CdsNFeVendaCHAVE_NFE: TWideStringField
      DisplayLabel = 'Chave NFe'
      FieldName = 'CHAVE_NFE'
      Size = 60
    end
    object CdsNFeVendaDATA_CONTABIL: TDateTimeField
      DisplayLabel = 'Data Emiss'#227'o'
      FieldName = 'DATA_CONTABIL'
    end
    object CdsNFeVendaTIPO_NF: TWideStringField
      DisplayLabel = 'Tipo Nota Fiscal'
      FieldName = 'TIPO_NF'
      Required = True
      FixedChar = True
      Size = 1
    end
    object CdsNFeVendaCOD_CLIENTE: TIntegerField
      DisplayLabel = 'C'#243'digo Cliente'
      FieldName = 'COD_CLIENTE'
      Required = True
    end
    object CdsNFeVendaSERIE: TWideStringField
      DisplayLabel = 'S'#233'rie'
      FieldName = 'SERIE'
      Size = 5
    end
    object CdsNFeVendaDATA_ENT_SAIDA: TDateTimeField
      DisplayLabel = 'Data Entrada/Sa'#237'da'
      FieldName = 'DATA_ENT_SAIDA'
    end
    object CdsNFeVendaNFE_DPEC_NREGDPEC: TWideStringField
      DisplayLabel = 'N. Registro DPEC'
      FieldName = 'NFE_DPEC_NREGDPEC'
      Size = 17
    end
    object CdsNFeVendaCOD_EMPRESA: TIntegerField
      DisplayLabel = 'C'#243'd. Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object CdsNFeVendaRESULTADO_ENVIO: TWideStringField
      DisplayLabel = 'Resulta Envio'
      FieldName = 'RESULTADO_ENVIO'
      Size = 30
    end
    object CdsNFeVendaDATA_AUTORIZACAO: TDateTimeField
      DisplayLabel = 'Data Autoriza'#231#227'o'
      FieldName = 'DATA_AUTORIZACAO'
    end
    object CdsNFeVendaDIGEST: TWideStringField
      DisplayLabel = 'Digest'
      FieldName = 'DIGEST'
      Size = 40
    end
    object CdsNFeVendaNFE_DPEC_XMOTIVO: TWideStringField
      DisplayLabel = 'Motivo DPEC'
      FieldName = 'NFE_DPEC_XMOTIVO'
      Size = 256
    end
    object CdsNFeVendaNFE_XJUST: TWideStringField
      DisplayLabel = 'Justificativa Conting'#234'ncia'
      FieldName = 'NFE_XJUST'
      Size = 256
    end
    object CdsNFeVendaNFE_DHCONT: TDateTimeField
      DisplayLabel = 'Data/Hora Conting'#234'ncia'
      FieldName = 'NFE_DHCONT'
    end
    object CdsNFeVendaPROTOCOLO: TWideStringField
      DisplayLabel = 'Protocolo'
      FieldName = 'PROTOCOLO'
      Size = 40
    end
    object CdsNFeVendaCODIGOERRO: TWideStringField
      DisplayLabel = 'C'#243'digo do Erro'
      FieldName = 'CODIGOERRO'
      Size = 10
    end
    object CdsNFeVendaDESCRICAOERRO: TWideStringField
      DisplayLabel = 'Descri'#231#227'o do Erro'
      FieldName = 'DESCRICAOERRO'
      Size = 50
    end
    object CdsNFeVendaTEMPORESPOSTA: TSmallintField
      DisplayLabel = 'Tempo de Resposta'
      FieldName = 'TEMPORESPOSTA'
    end
    object CdsNFeVendaHORA_ENVIO: TWideStringField
      DisplayLabel = 'Hora de Envio'
      FieldName = 'HORA_ENVIO'
      Size = 8
    end
    object CdsNFeVendaTIPONFE: TWideStringField
      DisplayLabel = 'Tipo de Emiss'#227'o'
      FieldName = 'TIPONFE'
      Size = 40
    end
    object CdsNFeVendaDANFEIMPRESSO: TWideStringField
      DisplayLabel = 'Danfe Impresso?'
      FieldName = 'DANFEIMPRESSO'
      Size = 5
    end
    object CdsNFeVendaDATAHORA_ENVIO: TDateTimeField
      DisplayLabel = 'Data/Hora de Envio'
      FieldName = 'DATAHORA_ENVIO'
    end
    object CdsNFeVendaBASE_ICM: TFloatField
      DisplayLabel = 'Base ICMS'
      FieldName = 'BASE_ICM'
    end
    object CdsNFeVendaVALOR_ICM: TFloatField
      DisplayLabel = 'Valor ICMS'
      FieldName = 'VALOR_ICM'
    end
    object CdsNFeVendaVALOR_TOTAL: TFloatField
      DisplayLabel = 'Valor Total'
      FieldName = 'VALOR_TOTAL'
    end
    object CdsNFeVendaVALOR_PROD: TFloatField
      DisplayLabel = 'Valor Total Produtos'
      FieldName = 'VALOR_PROD'
    end
    object CdsNFeVendaBASE_ICMSUB: TFloatField
      DisplayLabel = 'Base ICMS Subst'
      FieldName = 'BASE_ICMSUB'
    end
    object CdsNFeVendaVALOR_ICMSUB: TFloatField
      DisplayLabel = 'Valor ICMS Substit'
      FieldName = 'VALOR_ICMSUB'
    end
    object CdsNFeVendaVALOR_FRETE: TFloatField
      DisplayLabel = 'Valor Frete'
      FieldName = 'VALOR_FRETE'
    end
    object CdsNFeVendaVALOR_SEGURO: TFloatField
      DisplayLabel = 'Valor Seguro'
      FieldName = 'VALOR_SEGURO'
    end
    object CdsNFeVendaVALOR_DESC: TFloatField
      DisplayLabel = 'Valor Desconto'
      FieldName = 'VALOR_DESC'
    end
    object CdsNFeVendaVALOR_IPI: TFloatField
      DisplayLabel = 'Valor IPI'
      FieldName = 'VALOR_IPI'
    end
    object CdsNFeVendaVALOR_OUT_DESP: TFloatField
      DisplayLabel = 'Valor Outras Despesas'
      FieldName = 'VALOR_OUT_DESP'
    end
    object CdsNFeVendaVALOR_IRRF: TFloatField
      DisplayLabel = 'Valor IRRF'
      FieldName = 'VALOR_IRRF'
    end
    object CdsNFeVendaCODIGO_NOP: TFloatField
      DisplayLabel = 'Natureza Opera'#231#227'o'
      FieldName = 'CODIGO_NOP'
    end
    object CdsNFeVendaDESC_NATOP: TWideStringField
      DisplayLabel = 'Descri'#231#227'o Natureza'
      FieldName = 'DESC_NATOP'
      Size = 128
    end
    object CdsNFeVendaJUST_CANCELAMENTO: TWideStringField
      DisplayLabel = 'Justificativa Cancelamento'
      FieldName = 'JUST_CANCELAMENTO'
      Size = 60
    end
    object CdsNFeVendaCOD_COND_PAG: TIntegerField
      DisplayLabel = 'Cod. Condi'#231#227'o Pagamento'
      FieldName = 'COD_COND_PAG'
    end
    object CdsNFeVendaNUM_NF_VNDANT: TIntegerField
      DisplayLabel = 'Num. NF Anterior Contig.'
      FieldName = 'NUM_NF_VNDANT'
    end
    object CdsNFeVendaSUB_SERIEANT: TIntegerField
      DisplayLabel = 'S'#233'rie NF Anterior Contig'
      FieldName = 'SUB_SERIEANT'
    end
    object CdsNFeVendaOBS: TWideMemoField
      DisplayLabel = 'Obs.'
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 8
    end
    object CdsNFeVendaCODIGO_TR: TIntegerField
      DisplayLabel = 'C'#243'digo Transportador'
      FieldName = 'CODIGO_TR'
    end
    object CdsNFeVendaPLACA_TR: TWideStringField
      DisplayLabel = 'Placa Transportador'
      FieldName = 'PLACA_TR'
      Size = 7
    end
    object CdsNFeVendaFRETECONTA_TR: TWideStringField
      DisplayLabel = 'Frete por conta'
      FieldName = 'FRETECONTA_TR'
      FixedChar = True
      Size = 1
    end
    object CdsNFeVendaQTDE_VOLUMES_TR: TIntegerField
      DisplayLabel = 'Qtde de Volumes transportados'
      FieldName = 'QTDE_VOLUMES_TR'
    end
    object CdsNFeVendaESPECIE_TR: TWideStringField
      DisplayLabel = 'Esp'#233'cie Transportado'
      FieldName = 'ESPECIE_TR'
      Size = 15
    end
    object CdsNFeVendaMARCA_TR: TWideStringField
      DisplayLabel = 'Marca Transportado'
      FieldName = 'MARCA_TR'
      Size = 15
    end
    object CdsNFeVendaNUMERO_TR: TWideStringField
      DisplayLabel = 'N'#250'mero Transportado'
      FieldName = 'NUMERO_TR'
      Size = 15
    end
    object CdsNFeVendaPESO_B: TFloatField
      DisplayLabel = 'Peso Bruto'
      FieldName = 'PESO_B'
    end
    object CdsNFeVendaPESO_L: TFloatField
      DisplayLabel = 'Peso L'#237'quido'
      FieldName = 'PESO_L'
    end
    object CdsNFeVendaUF_PLACA_TR: TWideStringField
      DisplayLabel = 'UF Placa Transportador'
      FieldName = 'UF_PLACA_TR'
      FixedChar = True
      Size = 2
    end
    object CdsNFeVendaDADOS_INTERESSE_FISCO: TWideMemoField
      FieldName = 'DADOS_INTERESSE_FISCO'
      BlobType = ftMemo
      Size = 8
    end
    object CdsNFeVendaTIPO_EMISSAO: TWideStringField
      FieldName = 'TIPO_EMISSAO'
      FixedChar = True
      Size = 1
    end
    object CdsNFeVendaNUM_NF_EMT: TIntegerField
      DisplayLabel = 'Nota Fiscal Referenciada'
      FieldName = 'NUM_NF_EMT'
    end
    object CdsNFeVendaSERIE_EMT: TWideStringField
      DisplayLabel = 'S'#233'rie NF Referenciada'
      FieldName = 'SERIE_EMT'
      Size = 5
    end
    object CdsNFeVendaHORA_ENT_SAIDA: TTimeField
      DisplayLabel = 'Hora Entrada/Sa'#237'da'
      FieldName = 'HORA_ENT_SAIDA'
    end
    object CdsNFeVendaCRT: TWideStringField
      DisplayLabel = 'Crt'
      FieldName = 'CRT'
      FixedChar = True
      Size = 1
    end
    object CdsNFeVendaCOD_NF: TIntegerField
      DisplayLabel = 'C'#243'digo Seq. Nota Fiscal'
      FieldName = 'COD_NF'
      Required = True
    end
    object CdsNFeVendaNFE_CMSG: TSmallintField
      FieldName = 'NFE_CMSG'
    end
    object CdsNFeVendaNFE_XMSG: TWideStringField
      FieldName = 'NFE_XMSG'
      Size = 200
    end
    object CdsNFeVendaCNAE_FISCAL: TWideStringField
      FieldName = 'CNAE_FISCAL'
      Size = 7
    end
    object CdsNFeVendaINSCRICAO_SUBSTITUTO: TWideStringField
      FieldName = 'INSCRICAO_SUBSTITUTO'
      Size = 18
    end
    object CdsNFeVendaIM_EMP: TWideStringField
      FieldName = 'IM_EMP'
      Size = 18
    end
    object CdsNFeVendaVALOR_SERV: TFloatField
      FieldName = 'VALOR_SERV'
    end
    object CdsNFeVendaBASE_ISS: TFloatField
      FieldName = 'BASE_ISS'
    end
    object CdsNFeVendaVALOR_ISS: TFloatField
      FieldName = 'VALOR_ISS'
    end
    object CdsNFeVendaALIQ_ISS: TFloatField
      FieldName = 'ALIQ_ISS'
    end
    object CdsNFeVendaSTATUS: TWideStringField
      FieldName = 'STATUS'
      Size = 10
    end
    object CdsNFeVendaLOTE_NFE: TIntegerField
      DisplayLabel = 'Lote NFe'
      FieldName = 'LOTE_NFE'
    end
    object CdsNFeVendaN_COMANDO: TIntegerField
      FieldName = 'N_COMANDO'
    end
    object CdsNFeVendaDATA_LANC: TDateTimeField
      FieldName = 'DATA_LANC'
    end
    object CdsNFeVendaVALOR_PIS: TFloatField
      FieldName = 'VALOR_PIS'
    end
    object CdsNFeVendaVALOR_COFINS: TFloatField
      FieldName = 'VALOR_COFINS'
    end
    object CdsNFeVendaVALOR_II: TFloatField
      FieldName = 'VALOR_II'
      DisplayFormat = '#0.00'
    end
    object CdsNFeVendaNFE_RECIBO: TWideStringField
      DisplayLabel = 'Recibo do Lote NFe'
      FieldName = 'NFE_RECIBO'
    end
    object CdsNFeVendaSTAT_NFERECIBO: TWideStringField
      DisplayLabel = 'Status Recibo do Lote NFe'
      FieldName = 'STAT_NFERECIBO'
    end
    object CdsNFeVendaUFEMBARQ: TWideStringField
      DisplayLabel = 'UF Embarque Exporta'#231#227'o'
      FieldName = 'UFEMBARQ'
      Size = 2
    end
    object CdsNFeVendaXLOCEMBARQ: TWideStringField
      DisplayLabel = 'Local Embarque Exporta'#231#227'o'
      FieldName = 'XLOCEMBARQ'
      Size = 60
    end
    object CdsNFeVendaSERIE_COMPL: TWideStringField
      DisplayLabel = 'Serie NF Complementar'
      FieldName = 'SERIE_COMPL'
      Size = 5
    end
    object CdsNFeVendaNUM_NF_COMPL: TIntegerField
      DisplayLabel = 'Num NF Complementar'
      FieldName = 'NUM_NF_COMPL'
    end
    object CdsNFeVendaVTOTTRIB: TFloatField
      DisplayLabel = 'Total Tributos'
      FieldName = 'VTOTTRIB'
    end
    object CdsNFeVendaNFE_INDPRES: TWideStringField
      FieldName = 'NFE_INDPRES'
      Size = 1
    end
    object CdsNFeVendaNFE_IDDEST: TWideStringField
      FieldName = 'NFE_IDDEST'
      Size = 1
    end
    object CdsNFeVendaHORA_EMISSAO: TWideStringField
      FieldName = 'HORA_EMISSAO'
      Size = 8
    end
    object CdsNFeVendaCONSUMIDOR_FINAL: TWideStringField
      FieldName = 'CONSUMIDOR_FINAL'
      Size = 1
    end
    object CdsNFeVendaXLOCDESPACHO: TWideStringField
      FieldName = 'XLOCDESPACHO'
      Size = 60
    end
    object CdsNFeVendaVFCPUFDEST: TFloatField
      DisplayLabel = 'Valor total ICMS FCP'
      FieldName = 'VFCPUFDEST'
      DisplayFormat = '##0.00'
    end
    object CdsNFeVendaVICMSUFDEST: TFloatField
      DisplayLabel = 'Valor total ICMS Interestadual UF Destino'
      FieldName = 'VICMSUFDEST'
      DisplayFormat = '##0.00'
    end
    object CdsNFeVendaVICMSUFREMET: TFloatField
      DisplayLabel = 'Valor total ICMS Interestadual UF  Remetente'
      FieldName = 'VICMSUFREMET'
      DisplayFormat = '##0.00'
    end
    object CdsNFeVendaNFE_INDIEDEST: TSmallintField
      DisplayLabel = 'Indicador de Inscricao Estadual do Destinatario'
      FieldName = 'NFE_INDIEDEST'
    end
    object CdsNFeVendaCNFE: TIntegerField
      FieldName = 'CNFE'
    end
  end
  object IbBuscas: TIBQuery
    Database = IbConexaoNFe
    Transaction = IbTransNFe
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 32
    Top = 80
  end
  object DtNFe: TDataSource
    DataSet = CdsNFeVenda
    Left = 360
    Top = 80
  end
  object QrClientesLook: TIBQuery
    Database = IbConexaoNFe
    Transaction = IbTransNFe
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from clientes')
    Left = 24
    Top = 312
  end
  object IbEmpresa: TIBQuery
    Database = IbConexaoNFe
    Transaction = IbTransNFe
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from empresa')
    Left = 320
    Top = 32
  end
  object DspEmpresa: TDataSetProvider
    DataSet = IbEmpresa
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 240
    Top = 24
  end
  object CdsEmpresa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspEmpresa'
    BeforeOpen = CdsNFeVendaBeforeOpen
    Left = 32
    Top = 144
  end
  object IbItensNFvENDA: TIBQuery
    Database = IbConexaoNFe
    Transaction = IbTransNFe
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 104
    Top = 24
  end
  object DspitNfVenda: TDataSetProvider
    DataSet = IbItensNFvENDA
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 104
    Top = 72
  end
  object CdsItNfVenda: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspitNfVenda'
    BeforeOpen = CdsNFeVendaBeforeOpen
    Left = 96
    Top = 136
  end
  object CdsClientes: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspCliente'
    BeforeOpen = CdsNFeVendaBeforeOpen
    Left = 176
    Top = 256
  end
  object IbCliente: TIBQuery
    Database = IbConexaoNFe
    Transaction = IbTransNFe
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from clientes')
    Left = 96
    Top = 256
  end
  object DspCliente: TDataSetProvider
    DataSet = IbCliente
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 184
    Top = 200
  end
  object SpIncCodigo: TIBStoredProc
    Database = IbConexaoNFe
    Transaction = IbTransNFe
    StoredProcName = 'INCREMENTA_CODIGO'
    Left = 32
    Top = 204
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
  object DtClienteForn: TDataSource
    DataSet = IbCliente
    Left = 112
    Top = 200
  end
  object IbEstados: TIBQuery
    Database = IbConexaoNFe
    Transaction = IbTransNFe
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from estados where ativo = 1')
    Left = 240
    Top = 88
  end
  object CdsEstados: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspEstados'
    BeforeOpen = CdsNFeVendaBeforeOpen
    Left = 248
    Top = 208
  end
  object DspEstados: TDataSetProvider
    DataSet = IbEstados
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 248
    Top = 144
  end
  object IbBuscasAdic: TIBQuery
    Database = IbConexaoNFe
    Transaction = IbTransNFe
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 336
    Top = 144
  end
  object IbNFSe: TIBQuery
    Database = IbConexaoNFe
    Transaction = IbTransNFe
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      ''
      
        'select nome_cliente, nped, tipo, aliq_iss, nfs_servico, cnae_ser' +
        'v, vl_liq, valornf, cidade, cod_rps, n_nf, cod_empresa, data_fec' +
        'h,'
      
        '       status_nfse, iss_retido, ctiss, ctribnac, ctribmun, cnbs,' +
        ' nfse_nacional, modelo_nfse, emissao_rps, cod_cliente, codigo_ve' +
        'rwsnfse,'
      
        '       irrf_servico, issret_servico, pisrf_servico, cofinsrf_ser' +
        'vico, csslrf_servico, bruto'
      'from vw_rps_nfse'
      'where 1=0')
    Left = 424
    Top = 40
  end
  object DspNFSe: TDataSetProvider
    DataSet = IbNFSe
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 424
    Top = 104
  end
  object CdsNFSe: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspNFSe'
    BeforeOpen = CdsNFeVendaBeforeOpen
    AfterScroll = CdsNFSeAfterScroll
    Left = 424
    Top = 168
    object CdsNFSeDATA_FECH: TDateTimeField
      DisplayLabel = 'PEDVENDA.DATA_FECH'
      FieldName = 'DATA_FECH'
    end
    object CdsNFSeCOD_RPS: TIntegerField
      DisplayLabel = 'PEDVENDA_SERV.COD_RPS'
      FieldName = 'COD_RPS'
    end
    object CdsNFSeNOME_CLIENTE: TWideStringField
      DisplayLabel = 'CLIENTES.NOME_CLIENTE'
      FieldName = 'NOME_CLIENTE'
      FixedChar = True
      Size = 35
    end
    object CdsNFSeNPED: TIntegerField
      DisplayLabel = 'PEDVENDA.NPED'
      FieldName = 'NPED'
    end
    object CdsNFSeN_NF: TLargeintField
      FieldName = 'N_NF'
    end
    object CdsNFSeVL_LIQ: TFloatField
      FieldName = 'VL_LIQ'
      ReadOnly = True
      DisplayFormat = '#,##0.00'
    end
    object CdsNFSeVALORNF: TFloatField
      FieldName = 'VALORNF'
      DisplayFormat = '#,##0.00'
    end
    object CdsNFSeSTATUS_NFSE: TWideStringField
      DisplayLabel = 'PEDVENDA_SERV.STATUS_NFSE'
      FieldName = 'STATUS_NFSE'
    end
    object CdsNFSeTIPO: TWideStringField
      DisplayLabel = 'PEDVENDA.TIPO'
      FieldName = 'TIPO'
      FixedChar = True
      Size = 3
    end
    object CdsNFSeALIQ_ISS: TFloatField
      DisplayLabel = 'TIPO_SERVICO.ALIQ_ISS'
      FieldName = 'ALIQ_ISS'
      DisplayFormat = '#,##0.00'
    end
    object CdsNFSeNFS_SERVICO: TWideStringField
      DisplayLabel = 'TIPO_SERVICO.NFS_SERVICO'
      FieldName = 'NFS_SERVICO'
      FixedChar = True
      Size = 5
    end
    object CdsNFSeCNAE_SERV: TIntegerField
      DisplayLabel = 'TIPO_SERVICO.CNAE_SERV'
      FieldName = 'CNAE_SERV'
    end
    object CdsNFSeCIDADE: TWideStringField
      DisplayLabel = 'CLIENTES.CIDADE'
      FieldName = 'CIDADE'
      Size = 30
    end
    object CdsNFSeCOD_EMPRESA: TIntegerField
      DisplayLabel = 'PEDVENDA.COD_EMPRESA'
      FieldName = 'COD_EMPRESA'
    end
    object CdsNFSeISS_RETIDO: TIntegerField
      FieldName = 'ISS_RETIDO'
    end
    object CdsNFSeCTISS: TWideStringField
      FieldName = 'CTISS'
      Size = 9
    end
    object CdsNFSeCTRIBNAC: TWideStringField
      FieldName = 'CTRIBNAC'
      ReadOnly = True
      FixedChar = True
      Size = 6
    end
    object CdsNFSeCTRIBMUN: TWideStringField
      FieldName = 'CTRIBMUN'
      ReadOnly = True
      FixedChar = True
      Size = 3
    end
    object CdsNFSeCNBS: TWideStringField
      FieldName = 'CNBS'
      ReadOnly = True
      FixedChar = True
      Size = 9
    end
    object CdsNFSeNFSE_NACIONAL: TIntegerField
      FieldName = 'NFSE_NACIONAL'
      ReadOnly = True
    end
    object CdsNFSeMODELO_NFSE: TWideStringField
      FieldName = 'MODELO_NFSE'
      ReadOnly = True
      Size = 3
    end
    object CdsNFSeEMISSAO_RPS: TDateTimeField
      FieldName = 'EMISSAO_RPS'
      ReadOnly = True
    end
    object CdsNFSeCOD_CLIENTE: TIntegerField
      FieldName = 'COD_CLIENTE'
      ReadOnly = True
    end
    object CdsNFSeCODIGO_VERWSNFSE: TWideStringField
      FieldName = 'CODIGO_VERWSNFSE'
      ReadOnly = True
      Size = 50
    end
    object CdsNFSeIRRF_SERVICO: TFloatField
      FieldName = 'IRRF_SERVICO'
      ReadOnly = True
      DisplayFormat = '#,##0.00'
    end
    object CdsNFSeISSRET_SERVICO: TFloatField
      FieldName = 'ISSRET_SERVICO'
      ReadOnly = True
      DisplayFormat = '#,##0.00'
    end
    object CdsNFSePISRF_SERVICO: TFloatField
      FieldName = 'PISRF_SERVICO'
      ReadOnly = True
      DisplayFormat = '#,##0.00'
    end
    object CdsNFSeCOFINSRF_SERVICO: TFloatField
      FieldName = 'COFINSRF_SERVICO'
      ReadOnly = True
      DisplayFormat = '#,##0.00'
    end
    object CdsNFSeCSSLRF_SERVICO: TFloatField
      FieldName = 'CSSLRF_SERVICO'
      ReadOnly = True
      DisplayFormat = '#,##0.00'
    end
    object CdsNFSeBRUTO: TFloatField
      FieldName = 'BRUTO'
      ReadOnly = True
      DisplayFormat = '#,##0.00'
    end
  end
  object DtNFSe: TDataSource
    DataSet = CdsNFSe
    Left = 496
    Top = 48
  end
  object IbMontaNFSe: TIBQuery
    Database = IbConexaoNFe
    Transaction = IbTransNFe
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 504
    Top = 104
  end
  object DspMontaNFSe: TDataSetProvider
    DataSet = IbMontaNFSe
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 504
    Top = 160
  end
  object CdsMontaNFSe: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspMontaNFSe'
    BeforeOpen = CdsNFeVendaBeforeOpen
    Left = 584
    Top = 104
  end
  object DtIbBuscasAdic: TDataSource
    DataSet = IbBuscasAdic
    Left = 336
    Top = 200
  end
  object IbCCe: TIBQuery
    Database = IbConexaoNFe
    Transaction = IbTransNFe
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from NOTAFISCAL_CARTA_CORRECAO')
    Left = 248
    Top = 256
  end
  object DspCCe: TDataSetProvider
    DataSet = IbCCe
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 320
    Top = 256
  end
  object CdsCCe: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspCCe'
    BeforeOpen = CdsNFeVendaBeforeOpen
    Left = 384
    Top = 256
    object CdsCCeCOD_NF: TIntegerField
      FieldName = 'COD_NF'
      Required = True
    end
    object CdsCCeCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object CdsCCeIDLOTE: TIntegerField
      FieldName = 'IDLOTE'
      Required = True
    end
    object CdsCCeNSEQEVENTO: TSmallintField
      FieldName = 'NSEQEVENTO'
      Required = True
    end
    object CdsCCeSITUACAO: TWideStringField
      FieldName = 'SITUACAO'
    end
    object CdsCCeXCORRECAO: TWideMemoField
      FieldName = 'XCORRECAO'
      BlobType = ftMemo
      Size = 8
    end
    object CdsCCeCSTAT: TWideStringField
      FieldName = 'CSTAT'
      Size = 4
    end
    object CdsCCeXMOTIVO: TWideStringField
      FieldName = 'XMOTIVO'
      Size = 255
    end
    object CdsCCeNPROT: TWideStringField
      FieldName = 'NPROT'
      Size = 17
    end
    object CdsCCeDHEVENTO: TDateTimeField
      FieldName = 'DHEVENTO'
    end
    object CdsCCeCSTAT_PROC: TIntegerField
      FieldName = 'CSTAT_PROC'
    end
    object CdsCCeXMOTIVO_PROC: TWideStringField
      FieldName = 'XMOTIVO_PROC'
      Size = 255
    end
    object CdsCCeTIPO_EVENTO: TWideStringField
      FieldName = 'TIPO_EVENTO'
      FixedChar = True
      Size = 3
    end
    object CdsCCeXML_EVENTO: TWideMemoField
      FieldName = 'XML_EVENTO'
      BlobType = ftMemo
      Size = 8
    end
    object CdsCCeXML_NFE_EPEC: TWideMemoField
      FieldName = 'XML_NFE_EPEC'
      BlobType = ftMemo
      Size = 8
    end
  end
  object CdsNFDestinadas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspNFDestinadas'
    BeforeOpen = CdsNFeVendaBeforeOpen
    Left = 456
    Top = 248
    object CdsNFDestinadasCHAVE_NFE: TWideStringField
      FieldName = 'CHAVE_NFE'
      Required = True
      Size = 60
    end
    object CdsNFDestinadasCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object CdsNFDestinadasXNOME: TWideStringField
      FieldName = 'XNOME'
      Size = 60
    end
    object CdsNFDestinadasCNPJCPF: TWideStringField
      FieldName = 'CNPJCPF'
      Size = 14
    end
    object CdsNFDestinadasIE: TWideStringField
      FieldName = 'IE'
      Size = 14
    end
    object CdsNFDestinadasDATA_EMISSAO: TDateTimeField
      FieldName = 'DATA_EMISSAO'
    end
    object CdsNFDestinadasTPNF: TWideStringField
      FieldName = 'TPNF'
      Size = 7
    end
    object CdsNFDestinadasVNF: TFloatField
      FieldName = 'VNF'
    end
    object CdsNFDestinadasCSITNFE: TIntegerField
      FieldName = 'CSITNFE'
    end
    object CdsNFDestinadasSTATUS_NFE: TWideStringField
      FieldName = 'STATUS_NFE'
      Size = 10
    end
    object CdsNFDestinadasCSITCONF: TIntegerField
      FieldName = 'CSITCONF'
    end
    object CdsNFDestinadasMANIFESTACAO: TWideStringField
      FieldName = 'MANIFESTACAO'
      Size = 40
    end
    object CdsNFDestinadasBAIXADA: TWideStringField
      FieldName = 'BAIXADA'
      Size = 1
    end
    object CdsNFDestinadasCCE_TEXTO: TWideStringField
      FieldName = 'CCE_TEXTO'
      Size = 1000
    end
    object CdsNFDestinadasPASTA_DOWNLOAD: TWideStringField
      FieldName = 'PASTA_DOWNLOAD'
      Size = 500
    end
    object CdsNFDestinadasDATA_CANC: TDateTimeField
      FieldName = 'DATA_CANC'
    end
    object CdsNFDestinadasDATA_CCE: TDateTimeField
      FieldName = 'DATA_CCE'
    end
    object CdsNFDestinadasIDLOTE: TIntegerField
      FieldName = 'IDLOTE'
    end
    object CdsNFDestinadasDATA_CIENCIA: TDateTimeField
      FieldName = 'DATA_CIENCIA'
    end
    object CdsNFDestinadasDATA_CONFIRM: TDateTimeField
      FieldName = 'DATA_CONFIRM'
    end
    object CdsNFDestinadasDATA_DESCONH: TDateTimeField
      FieldName = 'DATA_DESCONH'
    end
    object CdsNFDestinadasDATA_OPNAOREAL: TDateTimeField
      FieldName = 'DATA_OPNAOREAL'
    end
    object CdsNFDestinadasCSITCONFPEDIDO: TIntegerField
      FieldName = 'CSITCONFPEDIDO'
    end
    object CdsNFDestinadasCULTSTATUSMAN: TIntegerField
      FieldName = 'CULTSTATUSMAN'
    end
    object CdsNFDestinadasULTIMOMOTIVOMAN: TWideStringField
      FieldName = 'ULTIMOMOTIVOMAN'
      Size = 255
    end
    object CdsNFDestinadasNUM_NF: TIntegerField
      FieldName = 'NUM_NF'
    end
    object CdsNFDestinadasSERIE_NF: TIntegerField
      FieldName = 'SERIE_NF'
    end
    object CdsNFDestinadasNSUDFE: TLargeintField
      FieldName = 'NSUDFE'
    end
    object CdsNFDestinadasXJUST: TWideStringField
      FieldName = 'XJUST'
      Size = 255
    end
  end
  object IbNFDestinadas: TIBQuery
    Database = IbConexaoNFe
    Transaction = IbTransNFe
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from NF_DESTINADAS')
    Left = 547
    Top = 248
  end
  object DspNFDestinadas: TDataSetProvider
    DataSet = IbNFDestinadas
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 504
    Top = 205
  end
  object cdsOsparaNFSe: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'NOMECLIENTE;NPED'
    Params = <>
    Left = 587
    Top = 159
    object cdsOsparaNFSeNPED: TIntegerField
      FieldName = 'NPED'
    end
    object cdsOsparaNFSeNOMECLIENTE: TWideStringField
      FieldName = 'NOMECLIENTE'
      Size = 60
    end
  end
  object IbNFSeCanceladas: TIBQuery
    Database = IbConexaoNFe
    Transaction = IbTransNFe
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 624
    Top = 216
  end
  object DtNFSECanceladas: TDataSource
    DataSet = IbNFSeCanceladas
    Left = 632
    Top = 264
  end
  object IbMDFE: TIBQuery
    Database = IbConexaoNFe
    Transaction = IbTransNFe
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from mdfe')
    Left = 664
    Top = 16
  end
  object DspMDFE: TDataSetProvider
    DataSet = IbMDFE
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 664
    Top = 64
  end
  object cdsMDFE: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspMDFE'
    BeforeOpen = CdsNFeVendaBeforeOpen
    Left = 664
    Top = 113
  end
end
