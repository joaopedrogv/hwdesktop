object dtmNfSerieD: TdtmNfSerieD
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 442
  Width = 611
  object IBTransNfSerieD: TIBTransaction
    Tag = 100
    Active = True
    DefaultDatabase = dtmAtivo.bancoHw
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 32
    Top = 1
  end
  object qrBuscas: TIBQuery
    Tag = 99
    Database = dtmAtivo.bancoHw
    Transaction = IBTransNfSerieD
    Left = 393
    Top = 1
  end
  object SpIncCodigo: TIBStoredProc
    Tag = 100
    Database = dtmAtivo.bancoFiscal
    Transaction = IBTransNfSerieD
    StoredProcName = 'INCREMENTA_CODIGO'
    Left = 116
    Top = 1
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
  object qrNFSD: TIBQuery
    Tag = 100
    Database = dtmAtivo.bancoHw
    Transaction = IBTransNfSerieD
    SQL.Strings = (
      'select * from NF_SERIE_D')
    Left = 20
    Top = 54
  end
  object dspNFSD: TDataSetProvider
    DataSet = qrNFSD
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 20
    Top = 113
  end
  object cdsNFSD: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspNFSD'
    BeforeOpen = cdsNFSDBeforeOpen
    Left = 20
    Top = 170
    object cdsNFSDNUMERONOTA: TIntegerField
      Tag = 2
      DisplayLabel = 'N'#186' Ordem'
      FieldName = 'NUMERONOTA'
      Required = True
    end
    object cdsNFSDCOD_CLIENTE: TIntegerField
      DisplayLabel = 'Cod Cliente'
      FieldName = 'COD_CLIENTE'
      Required = True
    end
    object cdsNFSDDATAEMISSAO: TDateTimeField
      DisplayLabel = 'Data Emiss'#227'o'
      FieldName = 'DATAEMISSAO'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsNFSDCOD_VENDEDOR: TIntegerField
      DisplayLabel = 'Vendedor'
      FieldName = 'COD_VENDEDOR'
    end
    object cdsNFSDSTATUS: TStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
    end
    object cdsNFSDSERIE: TStringField
      DisplayLabel = 'S'#233'rie'
      FieldName = 'SERIE'
      FixedChar = True
      Size = 3
    end
    object cdsNFSDSUBSERIE: TStringField
      DisplayLabel = 'Sub S'#233'rie'
      FieldName = 'SUBSERIE'
      FixedChar = True
      Size = 2
    end
    object cdsNFSDVALOR_GERAL: TFloatField
      DisplayLabel = 'Valor Total'
      FieldName = 'VALOR_GERAL'
      currency = True
    end
    object cdsNFSDB_CALC_ICMS: TFloatField
      DisplayLabel = 'Base ICMS'
      FieldName = 'B_CALC_ICMS'
      currency = True
    end
    object cdsNFSDVALOR_ICMS: TFloatField
      DisplayLabel = 'Valor ICMS'
      FieldName = 'VALOR_ICMS'
      currency = True
    end
    object cdsNFSDISENTA_N_TRIB: TFloatField
      DisplayLabel = 'Valor Isenta'
      FieldName = 'ISENTA_N_TRIB'
      currency = True
    end
    object cdsNFSDOUTRAS: TFloatField
      DisplayLabel = 'Valor Outras'
      FieldName = 'OUTRAS'
      currency = True
    end
    object cdsNFSDALIQUOTA: TFloatField
      DisplayLabel = 'Al'#237'quota'
      FieldName = 'ALIQUOTA'
    end
    object cdsNFSDCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsNFSDATIVO: TIntegerField
      Tag = 1
      FieldName = 'ATIVO'
    end
    object cdsNFSDMODELO: TStringField
      DisplayLabel = 'Modelo'
      FieldName = 'MODELO'
      FixedChar = True
      Size = 2
    end
    object cdsNFSDDATAENTRADA: TDateTimeField
      DisplayLabel = 'Data Entrada'
      FieldName = 'DATAENTRADA'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsNFSDNPED: TIntegerField
      DisplayLabel = 'Num Doc'
      FieldName = 'NPED'
    end
    object cdsNFSDTIPO_PED: TStringField
      DisplayLabel = 'Tipo Doc'
      FieldName = 'TIPO_PED'
      Size = 3
    end
  end
  object dsNFSD: TDataSource
    AutoEdit = False
    DataSet = cdsNFSD
    Left = 20
    Top = 231
  end
  object qrItNFSD: TIBQuery
    Tag = 100
    Database = dtmAtivo.bancoHw
    Transaction = IBTransNfSerieD
    SQL.Strings = (
      'select * from NF_SERIE_D_ITENS')
    Left = 99
    Top = 54
  end
  object dspItNFSD: TDataSetProvider
    DataSet = qrItNFSD
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 99
    Top = 113
  end
  object cdsItNFSD: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspItNFSD'
    BeforeOpen = cdsNFSDBeforeOpen
    Left = 99
    Top = 170
    object cdsItNFSDNUMERONOTA: TIntegerField
      DisplayLabel = 'N'#186' Ordem'
      FieldName = 'NUMERONOTA'
      Required = True
    end
    object cdsItNFSDGRUPO_PROD: TIntegerField
      DisplayLabel = 'Grupo'
      FieldName = 'GRUPO_PROD'
      Required = True
    end
    object cdsItNFSDCOD_PROD: TStringField
      DisplayLabel = 'C'#243'digo Prod'
      FieldName = 'COD_PROD'
      Required = True
      FixedChar = True
      Size = 6
    end
    object cdsItNFSDCOD_EMPRESA: TIntegerField
      Tag = 2
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsItNFSDNUM_FAB_PROD: TStringField
      DisplayLabel = 'Num Fabrica'#231#227'o'
      FieldName = 'NUM_FAB_PROD'
      FixedChar = True
    end
    object cdsItNFSDQUANTID_ITEM: TFloatField
      DisplayLabel = 'Quantidade'
      FieldName = 'QUANTID_ITEM'
    end
    object cdsItNFSDVL_UN_ITEM: TFloatField
      DisplayLabel = 'Valor Unit'
      FieldName = 'VL_UN_ITEM'
      currency = True
    end
    object cdsItNFSDVL_TOT_ITEM: TFloatField
      DisplayLabel = 'Valor Total'
      FieldName = 'VL_TOT_ITEM'
      currency = True
    end
    object cdsItNFSDALIQUOTA: TFloatField
      DisplayLabel = 'Al'#237'quota'
      FieldName = 'ALIQUOTA'
    end
    object cdsItNFSDATIVO: TIntegerField
      Tag = 2
      FieldName = 'ATIVO'
    end
    object cdsItNFSDDESC_PROD: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESC_PROD'
      Size = 60
    end
    object cdsItNFSDISENTO: TStringField
      DisplayLabel = 'Isento'
      FieldName = 'ISENTO'
      FixedChar = True
      Size = 1
    end
    object cdsItNFSDNITEM: TIntegerField
      DisplayLabel = 'N'#186' Item'
      FieldName = 'NITEM'
      Required = True
    end
    object cdsItNFSDMARCA: TStringField
      FieldName = 'MARCA'
      Size = 32
    end
    object cdsItNFSDMODELO: TStringField
      FieldName = 'MODELO'
      Size = 32
    end
    object cdsItNFSDTIPO: TStringField
      FieldName = 'TIPO'
      Size = 32
    end
    object cdsItNFSDESPECIE: TStringField
      FieldName = 'ESPECIE'
      Size = 32
    end
    object cdsItNFSDQUALIDADE: TStringField
      FieldName = 'QUALIDADE'
      Size = 32
    end
    object cdsItNFSDBASE_ICM: TFloatField
      DisplayLabel = 'Base ICMS'
      FieldName = 'BASE_ICM'
    end
    object cdsItNFSDVALOR_ICM: TFloatField
      DisplayLabel = 'Valor ICMS'
      FieldName = 'VALOR_ICM'
    end
    object cdsItNFSDPREC_CUSM_PROD: TFloatField
      DisplayLabel = 'Custo'
      FieldName = 'PREC_CUSM_PROD'
    end
    object cdsItNFSDNPED: TIntegerField
      DisplayLabel = 'Num Doc'
      FieldName = 'NPED'
    end
    object cdsItNFSDTIPO_PED: TStringField
      DisplayLabel = 'Tipo Doc'
      FieldName = 'TIPO_PED'
      Size = 3
    end
    object cdsItNFSDNITEM_PED: TIntegerField
      DisplayLabel = 'Item Doc'
      FieldName = 'NITEM_PED'
    end
  end
  object dsItNFSD: TDataSource
    AutoEdit = False
    DataSet = cdsItNFSD
    Left = 99
    Top = 231
  end
  object qrClientes: TIBQuery
    Tag = 99
    Database = dtmAtivo.bancoHw
    Transaction = IBTransNfSerieD
    SQL.Strings = (
      'SELECT *'
      'FROM CLIENTES '
      'WHERE  ativo=1')
    Left = 177
    Top = 54
  end
  object dspClientes: TDataSetProvider
    DataSet = qrClientes
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 177
    Top = 113
  end
  object cdsClientes: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspClientes'
    BeforeOpen = cdsNFSDBeforeOpen
    Left = 177
    Top = 170
    object cdsClientesCOD_CLIENTE: TIntegerField
      FieldName = 'COD_CLIENTE'
    end
    object cdsClientesNOME_CLIENTE: TStringField
      FieldName = 'NOME_CLIENTE'
      Size = 35
    end
    object cdsClientesLIMITE_CREDITO: TFloatField
      FieldName = 'LIMITE_CREDITO'
    end
    object cdsClientesENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 50
    end
    object cdsClientesCODIGO_FATURAMENTO: TIntegerField
      FieldName = 'CODIGO_FATURAMENTO'
    end
    object cdsClientesTIPVCLIENTE: TStringField
      FieldName = 'TIPVCLIENTE'
      FixedChar = True
      Size = 1
    end
    object cdsClientesCAMP_PR_VENDA: TStringField
      FieldName = 'CAMP_PR_VENDA'
    end
    object cdsClientesCPFCGC: TStringField
      FieldName = 'CPFCGC'
      Size = 18
    end
    object cdsClientesRAZAO: TStringField
      FieldName = 'RAZAO'
      Size = 60
    end
    object cdsClientesBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 35
    end
    object cdsClientesCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 30
    end
    object cdsClientesCODIGO_UF: TIntegerField
      FieldName = 'CODIGO_UF'
    end
    object cdsClientesCEP: TStringField
      FieldName = 'CEP'
      FixedChar = True
      Size = 9
    end
    object cdsClientesINSC_EST: TStringField
      FieldName = 'INSC_EST'
      Size = 18
    end
    object cdsClientesFONE_CLIENTE: TStringField
      FieldName = 'FONE_CLIENTE'
      FixedChar = True
      Size = 13
    end
    object cdsClientesDATA_ULT_COMPRA: TDateTimeField
      FieldName = 'DATA_ULT_COMPRA'
    end
    object cdsClientesTIPOCLIENTE: TStringField
      FieldName = 'TIPOCLIENTE'
      FixedChar = True
      Size = 6
    end
    object cdsClientesCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
    end
  end
  object dsClientes: TDataSource
    DataSet = cdsClientes
    Left = 177
    Top = 231
  end
  object qrColaborador: TIBQuery
    Tag = 99
    Database = dtmAtivo.bancoHw
    Transaction = IBTransNfSerieD
    SQL.Strings = (
      'SELECT C.*,F.desc_funcao, F.tpdocs_vnd FROM COLABORADOR C'
      'INNER JOIN funcoes F ON F.cod_funcao  = C.cod_funcao'
      'WHERE C.cod_empresa = 1 AND C.ativo = 1')
    Left = 256
    Top = 54
  end
  object dspColaborador: TDataSetProvider
    DataSet = qrColaborador
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 256
    Top = 113
  end
  object cdsColaborador: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspColaborador'
    BeforeOpen = cdsNFSDBeforeOpen
    Left = 256
    Top = 170
    object cdsColaboradorCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
      Required = True
    end
    object cdsColaboradorCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsColaboradorCODIGO_UF: TIntegerField
      FieldName = 'CODIGO_UF'
      Required = True
    end
    object cdsColaboradorCOD_FUNCAO: TIntegerField
      FieldName = 'COD_FUNCAO'
      Required = True
    end
    object cdsColaboradorNOME_VENDEDOR: TStringField
      FieldName = 'NOME_VENDEDOR'
      Size = 35
    end
    object cdsColaboradorEND_VENDEDOR: TStringField
      FieldName = 'END_VENDEDOR'
      Size = 35
    end
    object cdsColaboradorBAIRRO_VENDEDOR: TStringField
      FieldName = 'BAIRRO_VENDEDOR'
      Size = 35
    end
    object cdsColaboradorCIDADE_VENDEDOR: TStringField
      FieldName = 'CIDADE_VENDEDOR'
      Size = 35
    end
    object cdsColaboradorCEP_VENDEDOR: TStringField
      FieldName = 'CEP_VENDEDOR'
      FixedChar = True
      Size = 9
    end
    object cdsColaboradorFONE_VENDEDOR: TStringField
      FieldName = 'FONE_VENDEDOR'
      FixedChar = True
      Size = 14
    end
    object cdsColaboradorCPF_VENDEDOR: TStringField
      FieldName = 'CPF_VENDEDOR'
      FixedChar = True
      Size = 11
    end
    object cdsColaboradorPC_VEND_SERV: TFloatField
      FieldName = 'PC_VEND_SERV'
    end
    object cdsColaboradorPC_VEND_PROD: TFloatField
      FieldName = 'PC_VEND_PROD'
    end
    object cdsColaboradorOBS_VENDEDOR: TMemoField
      FieldName = 'OBS_VENDEDOR'
      BlobType = ftMemo
      Size = 8
    end
    object cdsColaboradorDATA_MOD_COL: TDateTimeField
      FieldName = 'DATA_MOD_COL'
    end
    object cdsColaboradorDATA_CAD_COL: TDateTimeField
      FieldName = 'DATA_CAD_COL'
    end
    object cdsColaboradorDAT_NASC_COL: TDateTimeField
      FieldName = 'DAT_NASC_COL'
    end
    object cdsColaboradorNOME_ULT_EMP: TStringField
      FieldName = 'NOME_ULT_EMP'
      Size = 30
    end
    object cdsColaboradorENDERECO_ULT_EMP: TStringField
      FieldName = 'ENDERECO_ULT_EMP'
      Size = 30
    end
    object cdsColaboradorFONE_ULT_EMP: TStringField
      FieldName = 'FONE_ULT_EMP'
      FixedChar = True
      Size = 14
    end
    object cdsColaboradorCONT_ULT_EMP: TStringField
      FieldName = 'CONT_ULT_EMP'
    end
    object cdsColaboradorULT_SAL_EMP: TFloatField
      FieldName = 'ULT_SAL_EMP'
    end
    object cdsColaboradorDTENT_ULT_EMP: TDateTimeField
      FieldName = 'DTENT_ULT_EMP'
    end
    object cdsColaboradorDTSAI_ULT_EMP: TDateTimeField
      FieldName = 'DTSAI_ULT_EMP'
    end
    object cdsColaboradorNOME_PLT_EMP: TStringField
      FieldName = 'NOME_PLT_EMP'
      Size = 30
    end
    object cdsColaboradorENDERECO_PLT_EMP: TStringField
      FieldName = 'ENDERECO_PLT_EMP'
      Size = 30
    end
    object cdsColaboradorFONE_PLT_EMP: TStringField
      FieldName = 'FONE_PLT_EMP'
      FixedChar = True
      Size = 14
    end
    object cdsColaboradorCONT_PLT_EMP: TStringField
      FieldName = 'CONT_PLT_EMP'
    end
    object cdsColaboradorPLT_SAL_EMP: TFloatField
      FieldName = 'PLT_SAL_EMP'
    end
    object cdsColaboradorDTENT_PLT_EMP: TDateTimeField
      FieldName = 'DTENT_PLT_EMP'
    end
    object cdsColaboradorDTSAI_PLT_EMP: TDateTimeField
      FieldName = 'DTSAI_PLT_EMP'
    end
    object cdsColaboradorDT_ULT_FERIAS: TDateTimeField
      FieldName = 'DT_ULT_FERIAS'
    end
    object cdsColaboradorTMP_ULT_FERIAS: TIntegerField
      FieldName = 'TMP_ULT_FERIAS'
    end
    object cdsColaboradorVL_ULT_FERIAS: TFloatField
      FieldName = 'VL_ULT_FERIAS'
    end
    object cdsColaboradorDTVND_ULT_FERIAS: TDateTimeField
      FieldName = 'DTVND_ULT_FERIAS'
    end
    object cdsColaboradorDT_13_SAL: TDateTimeField
      FieldName = 'DT_13_SAL'
    end
    object cdsColaboradorVL_13_SAL: TFloatField
      FieldName = 'VL_13_SAL'
    end
    object cdsColaboradorVL_SAL: TFloatField
      FieldName = 'VL_SAL'
    end
    object cdsColaboradorCOD_CIDADE: TSmallintField
      FieldName = 'COD_CIDADE'
    end
    object cdsColaboradorCOD_BAIRRO: TSmallintField
      FieldName = 'COD_BAIRRO'
    end
    object cdsColaboradorSALARIO_REGISTRO: TFloatField
      FieldName = 'SALARIO_REGISTRO'
    end
    object cdsColaboradorVALOR_SALARIO: TFloatField
      FieldName = 'VALOR_SALARIO'
    end
    object cdsColaboradorQUANT_SAL_FAMILIA: TFloatField
      FieldName = 'QUANT_SAL_FAMILIA'
    end
    object cdsColaboradorVALOR_SALARIO_FAMILIA: TFloatField
      FieldName = 'VALOR_SALARIO_FAMILIA'
    end
    object cdsColaboradorPERC_PESO: TFloatField
      FieldName = 'PERC_PESO'
    end
    object cdsColaboradorATIVO: TIntegerField
      FieldName = 'ATIVO'
    end
    object cdsColaboradorEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 50
    end
    object cdsColaboradorSITE: TStringField
      FieldName = 'SITE'
      FixedChar = True
      Size = 1
    end
    object cdsColaboradorFONE_CONTATO: TStringField
      FieldName = 'FONE_CONTATO'
      FixedChar = True
      Size = 40
    end
    object cdsColaboradorDESC_FUNCAO: TStringField
      FieldName = 'DESC_FUNCAO'
      FixedChar = True
      Size = 30
    end
    object cdsColaboradorTPDOCS_VND: TMemoField
      FieldName = 'TPDOCS_VND'
      BlobType = ftMemo
      Size = 8
    end
  end
  object dsColaborador: TDataSource
    DataSet = cdsColaborador
    Left = 256
    Top = 231
  end
  object dspEmpresa: TDataSetProvider
    DataSet = qrEmpresa
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 327
    Top = 113
  end
  object qrEmpresa: TIBQuery
    Tag = 99
    Database = dtmAtivo.bancoHw
    Transaction = IBTransNfSerieD
    SQL.Strings = (
      'SELECT * FROM EMPRESA'
      'where ativo=1')
    Left = 327
    Top = 54
  end
  object cdsEmpresa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEmpresa'
    BeforeOpen = cdsNFSDBeforeOpen
    Left = 327
    Top = 170
    object cdsEmpresaEM_NF: TStringField
      FieldName = 'EM_NF'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaUSPREVENDA: TStringField
      FieldName = 'USPREVENDA'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaUSPREVENDA_OS: TStringField
      FieldName = 'USPREVENDA_OS'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaSEG_PROD_SERV: TStringField
      FieldName = 'SEG_PROD_SERV'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaMENSAGEM_EMP: TStringField
      FieldName = 'MENSAGEM_EMP'
      Size = 40
    end
    object cdsEmpresaOBS_DECL_OS: TMemoField
      FieldName = 'OBS_DECL_OS'
      BlobType = ftMemo
      Size = 8
    end
    object cdsEmpresaCONCESS: TStringField
      FieldName = 'CONCESS'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaCASAS_DECIMAIS: TIntegerField
      FieldName = 'CASAS_DECIMAIS'
    end
    object cdsEmpresaCFOP_PAD_PROD: TFloatField
      FieldName = 'CFOP_PAD_PROD'
    end
    object cdsEmpresaARREDOND: TStringField
      FieldName = 'ARREDOND'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaMIN_MARGEM_V: TFloatField
      FieldName = 'MIN_MARGEM_V'
    end
    object cdsEmpresaMIN_MARGEM_A: TFloatField
      FieldName = 'MIN_MARGEM_A'
    end
    object cdsEmpresaAPRES_ESTR: TStringField
      FieldName = 'APRES_ESTR'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaUS_MINM_PROD: TStringField
      FieldName = 'US_MINM_PROD'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaTELEFONE_EMP: TStringField
      FieldName = 'TELEFONE_EMP'
      Size = 14
    end
    object cdsEmpresaNOME_EMP: TStringField
      FieldName = 'NOME_EMP'
      Size = 50
    end
    object cdsEmpresaMOD_FAT: TStringField
      FieldName = 'MOD_FAT'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaUS_DECL_REQ: TStringField
      FieldName = 'US_DECL_REQ'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaAUT_SERV_CUPOM: TStringField
      FieldName = 'AUT_SERV_CUPOM'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaCGC_EMP: TStringField
      FieldName = 'CGC_EMP'
      Size = 18
    end
    object cdsEmpresaOBS_PAD_OS: TMemoField
      FieldName = 'OBS_PAD_OS'
      BlobType = ftMemo
      Size = 8
    end
    object cdsEmpresaDADVAP: TStringField
      FieldName = 'DADVAP'
      FixedChar = True
      Size = 3
    end
    object cdsEmpresaALMOX: TStringField
      FieldName = 'ALMOX'
      FixedChar = True
      Size = 1
    end
  end
  object dspBarra: TDataSetProvider
    DataSet = qrBarra
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 471
    Top = 113
  end
  object qrBarra: TIBQuery
    Tag = 99
    Database = dtmAtivo.bancoHw
    Transaction = IBTransNfSerieD
    SQL.Strings = (
      'select * from COD_BARRA')
    Left = 471
    Top = 54
  end
  object cdsBarra: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspBarra'
    BeforeOpen = cdsNFSDBeforeOpen
    Left = 471
    Top = 170
    object cdsBarraCOD_BARRA: TStringField
      FieldName = 'COD_BARRA'
      Required = True
      FixedChar = True
    end
    object cdsBarraGRUPO_PROD: TIntegerField
      FieldName = 'GRUPO_PROD'
      Required = True
    end
    object cdsBarraCOD_PROD: TStringField
      FieldName = 'COD_PROD'
      Required = True
      FixedChar = True
      Size = 6
    end
  end
  object dspProd: TDataSetProvider
    DataSet = qrProd
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 392
    Top = 113
  end
  object qrProd: TIBQuery
    Tag = 99
    Database = dtmAtivo.bancoHw
    Transaction = IBTransNfSerieD
    SQL.Strings = (
      'select p.*,'
      'coalesce(est.estoque, 0) estoque_disponivel,'
      'coalesce(est.est_prima, 0) estoque_produzir from PRODUTOS p'
      
        'left join getestoquedisponivel(p.grupo_prod, p.cod_prod, 0, p.co' +
        'd_empresa, 0, '#39#39', 0, 0) est on 1 = 1 ')
    Left = 392
    Top = 54
  end
  object cdsProd: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProd'
    BeforeOpen = cdsNFSDBeforeOpen
    Left = 392
    Top = 170
    object cdsProdPERC_TB_ATAC: TFloatField
      FieldName = 'PERC_TB_ATAC'
      DisplayFormat = '#,##0.000'
    end
    object cdsProdPERC_TB_VARE: TFloatField
      FieldName = 'PERC_TB_VARE'
      DisplayFormat = '#,##0.000'
    end
    object cdsProdPREC_CUS_PROD: TFloatField
      FieldName = 'PREC_CUS_PROD'
      currency = True
    end
    object cdsProdPREC_TAB_PROD: TFloatField
      FieldName = 'PREC_TAB_PROD'
      currency = True
    end
    object cdsProdPREC_30_PROD: TFloatField
      FieldName = 'PREC_30_PROD'
      currency = True
    end
    object cdsProdPREC_60_PROD: TFloatField
      FieldName = 'PREC_60_PROD'
      currency = True
    end
    object cdsProdPREC_90_PROD: TFloatField
      FieldName = 'PREC_90_PROD'
      currency = True
    end
    object cdsProdPERMITIR_DESCONTO: TStringField
      FieldName = 'PERMITIR_DESCONTO'
      FixedChar = True
      Size = 1
    end
    object cdsProdEM_PROMOCAO: TStringField
      FieldName = 'EM_PROMOCAO'
      FixedChar = True
      Size = 1
    end
    object cdsProdPRECO_PROMOCAO: TFloatField
      FieldName = 'PRECO_PROMOCAO'
      currency = True
    end
    object cdsProdGRUPO_PROD: TIntegerField
      FieldName = 'GRUPO_PROD'
      Required = True
    end
    object cdsProdCOD_PROD: TStringField
      FieldName = 'COD_PROD'
      Required = True
      FixedChar = True
      Size = 6
    end
    object cdsProdCODIGO_NOP: TFloatField
      FieldName = 'CODIGO_NOP'
    end
    object cdsProdDESCR_PROD: TStringField
      FieldName = 'DESCR_PROD'
      FixedChar = True
      Size = 75
    end
    object cdsProdICM_PROD: TFloatField
      FieldName = 'ICM_PROD'
    end
    object cdsProdNUM_FAB_PROD: TStringField
      FieldName = 'NUM_FAB_PROD'
      FixedChar = True
    end
    object cdsProdPREC_PUBLICO: TFloatField
      FieldName = 'PREC_PUBLICO'
      currency = True
    end
    object cdsProdPREC_CUSR_PROD: TFloatField
      FieldName = 'PREC_CUSR_PROD'
      currency = True
    end
    object cdsProdPREC_CUS_MNF: TFloatField
      FieldName = 'PREC_CUS_MNF'
      currency = True
    end
    object cdsProdPREC_CUSM_PROD: TFloatField
      FieldName = 'PREC_CUSM_PROD'
      currency = True
    end
    object cdsProdPREC_CUSMR_PROD: TFloatField
      FieldName = 'PREC_CUSMR_PROD'
      currency = True
    end
    object cdsProdICMANT_SUB: TFloatField
      FieldName = 'ICMANT_SUB'
    end
    object cdsProdPREC_CUSR_MNF: TFloatField
      FieldName = 'PREC_CUSR_MNF'
      currency = True
    end
    object cdsProdEST_F: TFloatField
      FieldName = 'EST_F'
    end
    object cdsProdDESCR_PROD_RED: TStringField
      FieldName = 'DESCR_PROD_RED'
      Size = 35
    end
    object cdsProdCSDECQTDE: TStringField
      FieldName = 'CSDECQTDE'
      Size = 1
    end
    object cdsProdCSDECVLUNT: TStringField
      FieldName = 'CSDECVLUNT'
      Size = 1
    end
    object cdsProdCONSUMO: TStringField
      FieldName = 'CONSUMO'
      FixedChar = True
      Size = 1
    end
    object cdsProdPESO_BRUT_PROD: TFloatField
      FieldName = 'PESO_BRUT_PROD'
    end
    object cdsProdISENTO_PROD: TStringField
      FieldName = 'ISENTO_PROD'
      FixedChar = True
      Size = 1
    end
    object cdsProdPERC_RED_PROD: TFloatField
      FieldName = 'PERC_RED_PROD'
      DisplayFormat = '#,##0.000'
    end
    object cdsProdESTOQUE_DISPONIVEL: TFloatField
      FieldName = 'ESTOQUE_DISPONIVEL'
      DisplayFormat = '#,##0.000'
    end
    object cdsProdESTOQUE_PRODUZIR: TFloatField
      FieldName = 'ESTOQUE_PRODUZIR'
      DisplayFormat = '#,##0.000'
    end
  end
  object IBTransaction1: TIBTransaction
    Tag = 99
    DefaultDatabase = dtmAtivo.bancoHw
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 304
  end
  object qrBuscasPAF: TIBQuery
    Tag = 100
    Database = dtmAtivo.bancoHw
    Transaction = IBTransNfSerieD
    Left = 192
  end
  object SpIncCodigo2: TIBStoredProc
    Tag = 100
    Database = dtmAtivo.bancoHw
    Transaction = IBTransNfSerieD
    StoredProcName = 'INCREMENTA_CODIGO'
    Left = 548
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
end
