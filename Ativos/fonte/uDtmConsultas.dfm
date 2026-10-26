object dtmConsultas: TdtmConsultas
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 835
  Width = 2217
  object transConsulta: TIBTransaction
    DefaultDatabase = dtmAtivo.bancoHw
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 32
    Top = 8
  end
  object qrPesqTr: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transConsulta
    SQL.Strings = (
      'select * from TRANSPORTADOR')
    Left = 696
    Top = 26
  end
  object qrPesqSub: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transConsulta
    SQL.Strings = (
      'select * from SUB_GRUPO')
    Left = 632
    Top = 26
  end
  object qrPesqprod: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transConsulta
    SQL.Strings = (
      'select PRODUTOS.*  from PRODUTOS')
    Left = 760
    Top = 26
  end
  object qrPesqGr: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transConsulta
    SQL.Strings = (
      'select * from GRUPOS')
    Left = 568
    Top = 26
  end
  object qrPesqForn: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transConsulta
    SQL.Strings = (
      'select * from FORNECEDOR')
    Left = 216
    Top = 24
  end
  object qrPesqCl: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transConsulta
    SQL.Strings = (
      'select * from CLIENTES')
    Left = 152
    Top = 24
  end
  object qrPesqCid: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transConsulta
    SQL.Strings = (
      'select * from CIDADES')
    Left = 344
    Top = 24
  end
  object qrPesqBai: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transConsulta
    SQL.Strings = (
      'select * from BAIRROS')
    Left = 280
    Top = 24
  end
  object dspCl: TDataSetProvider
    DataSet = qrPesqCl
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 152
    Top = 80
  end
  object dspForn: TDataSetProvider
    DataSet = qrPesqForn
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 216
    Top = 80
  end
  object dspbai: TDataSetProvider
    DataSet = qrPesqBai
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 280
    Top = 80
  end
  object dspCid: TDataSetProvider
    DataSet = qrPesqCid
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 344
    Top = 80
  end
  object dspGr: TDataSetProvider
    DataSet = qrPesqGr
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 568
    Top = 82
  end
  object dspSub: TDataSetProvider
    DataSet = qrPesqSub
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 632
    Top = 82
  end
  object dspTr: TDataSetProvider
    DataSet = qrPesqTr
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 696
    Top = 82
  end
  object dspProd: TDataSetProvider
    DataSet = qrPesqprod
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 760
    Top = 82
  end
  object cdsPCl: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspCl'
    ReadOnly = True
    BeforeOpen = cdsPGrBeforeOpen
    Left = 152
    Top = 136
    object cdsPClCOD_CLIENTE: TIntegerField
      Tag = 2
      DisplayLabel = 'Codigo'
      FieldName = 'COD_CLIENTE'
      Required = True
    end
    object cdsPClNOME_CLIENTE: TStringField
      Tag = 2
      DisplayLabel = 'Nome'
      FieldName = 'NOME_CLIENTE'
      Required = True
      Size = 35
    end
    object cdsPClFONE_CLIENTE: TStringField
      DisplayLabel = 'Telefone'
      FieldName = 'FONE_CLIENTE'
      EditMask = '(99) 9999-9999;0;_'
      FixedChar = True
      Size = 13
    end
    object cdsPClFONE_CELULAR: TStringField
      DisplayLabel = 'Celular'
      FieldName = 'FONE_CELULAR'
      EditMask = '(99) 99999-9999;0;_'
      FixedChar = True
      Size = 13
    end
    object cdsPClCPFCGC: TStringField
      DisplayLabel = 'CPF/CNPJ'
      FieldName = 'CPFCGC'
      Size = 18
    end
    object cdsPClENDERECO: TStringField
      DisplayLabel = 'Endere'#231'o'
      FieldName = 'ENDERECO'
      Required = True
      Size = 50
    end
    object cdsPClCIDADE: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'CIDADE'
      Required = True
      Size = 30
    end
    object cdsPClBAIRRO: TStringField
      DisplayLabel = 'Bairro'
      FieldName = 'BAIRRO'
      Required = True
      Size = 35
    end
    object cdsPClCEP: TStringField
      FieldName = 'CEP'
      Required = True
      FixedChar = True
      Size = 9
    end
    object cdsPClNATURALID: TStringField
      DisplayLabel = 'Naturalidade'
      FieldName = 'NATURALID'
      Required = True
    end
    object cdsPClRAZAO: TStringField
      DisplayLabel = 'Raz'#227'o'
      FieldName = 'RAZAO'
      Required = True
      Size = 60
    end
    object cdsPClINSC_EST: TStringField
      DisplayLabel = 'Insc Estadual'
      FieldName = 'INSC_EST'
      Size = 18
    end
    object cdsPClRG: TStringField
      DisplayLabel = 'Identidade'
      FieldName = 'RG'
      FixedChar = True
      Size = 10
    end
    object cdsPClEXPEDIC: TDateTimeField
      DisplayLabel = 'Data Exp Ident'
      FieldName = 'EXPEDIC'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsPClORG_EXPEDIC: TStringField
      DisplayLabel = 'Org Exp Ident'
      FieldName = 'ORG_EXPEDIC'
    end
    object cdsPClCTPS: TStringField
      DisplayLabel = 'Cart Trabalho'
      FieldName = 'CTPS'
      FixedChar = True
      Size = 10
    end
    object cdsPClFAX: TStringField
      DisplayLabel = 'Fax'
      FieldName = 'FAX'
      EditMask = '(99) 9999-9999;0;_'
      FixedChar = True
      Size = 14
    end
    object cdsPClCIDA_COBRANCA: TStringField
      DisplayLabel = 'Cidade Cob'
      FieldName = 'CIDA_COBRANCA'
      Size = 30
    end
    object cdsPClCEP_COBRANCA: TStringField
      DisplayLabel = 'CEP Cob'
      FieldName = 'CEP_COBRANCA'
      FixedChar = True
      Size = 9
    end
    object cdsPClDATA_CADASTRO: TDateTimeField
      DisplayLabel = 'Data Cadastro'
      FieldName = 'DATA_CADASTRO'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsPClLIMITE_CREDITO: TFloatField
      DisplayLabel = 'Limite de Cr'#233'dito'
      FieldName = 'LIMITE_CREDITO'
      currency = True
    end
    object cdsPClCONTATO: TStringField
      DisplayLabel = 'Contato'
      FieldName = 'CONTATO'
      Size = 10
    end
    object cdsPClSEXO: TStringField
      DisplayLabel = 'Sexo'
      FieldName = 'SEXO'
      FixedChar = True
      Size = 1
    end
    object cdsPClCONJUGE: TStringField
      DisplayLabel = 'C'#244'njuge'
      FieldName = 'CONJUGE'
      Size = 35
    end
    object cdsPClLOC_TRAB: TStringField
      DisplayLabel = 'Local Trabalho'
      FieldName = 'LOC_TRAB'
      Size = 30
    end
    object cdsPClEND_TRAB: TStringField
      DisplayLabel = 'Endere'#231'o Trab'
      FieldName = 'END_TRAB'
      Size = 35
    end
    object cdsPClFONE_TRAB: TStringField
      DisplayLabel = 'Fone Trab'
      FieldName = 'FONE_TRAB'
      EditMask = '!\(99\)9000-0000;0;_'
      FixedChar = True
      Size = 14
    end
    object cdsPClCARGO: TStringField
      DisplayLabel = 'Cargo'
      FieldName = 'CARGO'
      Size = 15
    end
    object cdsPClSPCL: TDateTimeField
      DisplayLabel = 'Data Nada consta SPC Local'
      FieldName = 'SPCL'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsPClSPCEST: TDateTimeField
      DisplayLabel = 'Data Nada consta SPC Nacional'
      FieldName = 'SPCEST'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsPClEND_COBRANCA: TStringField
      DisplayLabel = 'Endere'#231'o Cob'
      FieldName = 'END_COBRANCA'
      Size = 50
    end
    object cdsPClBAIRRO_COBRANCA: TStringField
      DisplayLabel = 'Bairro Cob'
      FieldName = 'BAIRRO_COBRANCA'
      Size = 35
    end
    object cdsPClPAI: TStringField
      DisplayLabel = 'Pai'
      FieldName = 'PAI'
      Size = 35
    end
    object cdsPClMAE: TStringField
      DisplayLabel = 'M'#227'e'
      FieldName = 'MAE'
      Size = 35
    end
    object cdsPClDATA_NASC: TDateTimeField
      DisplayLabel = 'Data Nascimento'
      FieldName = 'DATA_NASC'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsPClEMAIL: TStringField
      DisplayLabel = 'e-mail'
      FieldName = 'EMAIL'
      Size = 50
    end
    object cdsPClCONVENIADO: TStringField
      DisplayLabel = 'Conveniado'
      FieldName = 'CONVENIADO'
      FixedChar = True
      Size = 1
    end
    object cdsPClDIA_VENC: TIntegerField
      DisplayLabel = 'Dia base de Vencimento'
      FieldName = 'DIA_VENC'
    end
    object cdsPClTIPOCLIENTE: TStringField
      DisplayLabel = 'Tipo Cliente'
      FieldName = 'TIPOCLIENTE'
      FixedChar = True
      Size = 6
    end
    object cdsPClDATA_ULT_COMPRA: TDateTimeField
      DisplayLabel = 'Data Ultima Compra'
      FieldName = 'DATA_ULT_COMPRA'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsPClNEC_ACOMP: TStringField
      DisplayLabel = 'Nec Acompanhamento'
      FieldName = 'NEC_ACOMP'
      FixedChar = True
      Size = 1
    end
    object cdsPClRAMO_ATIVIDADE: TStringField
      DisplayLabel = 'Ramo Atividade'
      FieldName = 'RAMO_ATIVIDADE'
      Size = 60
    end
    object cdsPClESTADO_CIVIL: TStringField
      DisplayLabel = 'Estado Civil'
      FieldName = 'ESTADO_CIVIL'
      Size = 32
    end
    object cdsPClTIPVCLIENTE: TStringField
      DisplayLabel = 'Tipo Venda'
      FieldName = 'TIPVCLIENTE'
      FixedChar = True
      Size = 1
    end
    object cdsPClCOD_CONVENIO: TIntegerField
      DisplayLabel = 'Conv'#234'nio'
      FieldName = 'COD_CONVENIO'
    end
    object cdsPClCODIGO_UF: TIntegerField
      DisplayLabel = 'Codigo Estado'
      FieldName = 'CODIGO_UF'
      Required = True
    end
    object cdsPClATIVO: TIntegerField
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
    object cdsPClCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
      Visible = False
    end
    object cdsPClCODIGO_FATURAMENTO: TIntegerField
      DisplayLabel = 'Cod Faturamento'
      FieldName = 'CODIGO_FATURAMENTO'
    end
    object cdsPClCL_GERAR_PONTOS: TStringField
      DisplayLabel = 'Gerar pontos'
      FieldName = 'CL_GERAR_PONTOS'
      FixedChar = True
      Size = 1
    end
    object cdsPClOBSERVACAO: TStringField
      DisplayLabel = 'Observacao Geral'
      FieldName = 'OBSERVACAO'
      Size = 200
    end
    object cdsPClOBS_DIV: TMemoField
      DisplayLabel = 'Observacao SPC'
      FieldName = 'OBS_DIV'
      BlobType = ftMemo
      Size = 8
    end
    object cdsPClOBS_REQ_OS: TStringField
      DisplayLabel = 'Observacao REQ OS'
      FieldName = 'OBS_REQ_OS'
      Size = 130
    end
    object cdsPClID_COMMERCE: TLargeintField
      DisplayLabel = 'Id Ecommerce'
      FieldName = 'ID_COMMERCE'
    end
  end
  object cdsPForn: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspForn'
    ReadOnly = True
    BeforeOpen = cdsPGrBeforeOpen
    Left = 216
    Top = 136
    object cdsPFornCODIGO_F: TIntegerField
      Tag = 2
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO_F'
      Required = True
    end
    object cdsPFornNOME: TStringField
      Tag = 2
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Size = 35
    end
    object cdsPFornCPF_CGC_F: TStringField
      DisplayLabel = 'CPF/ENPJ:'
      FieldName = 'CPF_CGC_F'
      FixedChar = True
      Size = 18
    end
    object cdsPFornIE_F: TStringField
      DisplayLabel = 'Insc Estadual'
      FieldName = 'IE_F'
      FixedChar = True
      Size = 18
    end
    object cdsPFornEND_F: TStringField
      DisplayLabel = 'Endere'#231'co'
      FieldName = 'END_F'
      Size = 35
    end
    object cdsPFornBAIRF: TStringField
      DisplayLabel = 'Bairro'
      FieldName = 'BAIRF'
      Size = 35
    end
    object cdsPFornCIDA_F: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'CIDA_F'
      Size = 35
    end
    object cdsPFornCEP_F: TStringField
      DisplayLabel = 'CEP'
      FieldName = 'CEP_F'
      FixedChar = True
      Size = 9
    end
    object cdsPFornFONE_F: TStringField
      DisplayLabel = 'Telefone'
      FieldName = 'FONE_F'
      EditMask = '!\(99\)9000-0000;0;_'
      FixedChar = True
      Size = 14
    end
    object cdsPFornRAMAL_F: TStringField
      DisplayLabel = 'Ramal'
      FieldName = 'RAMAL_F'
      FixedChar = True
      Size = 5
    end
    object cdsPFornCONTATO_F: TStringField
      DisplayLabel = 'Contato'
      FieldName = 'CONTATO_F'
      Size = 10
    end
    object cdsPFornEMAIL_F: TStringField
      DisplayLabel = 'e-mail'
      FieldName = 'EMAIL_F'
      FixedChar = True
      Size = 30
    end
    object cdsPFornFAX_F: TStringField
      DisplayLabel = 'Fax'
      FieldName = 'FAX_F'
      EditMask = '!\(99\)9000-0000;0;_'
      FixedChar = True
      Size = 14
    end
    object cdsPFornDATA_CADASTRO: TDateTimeField
      DisplayLabel = 'Data cadastro'
      FieldName = 'DATA_CADASTRO'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsPFornCODIGO_UF: TIntegerField
      DisplayLabel = 'C'#243'digo Estado'
      FieldName = 'CODIGO_UF'
      Required = True
    end
    object cdsPFornCOD_EMPRESA: TIntegerField
      DisplayLabel = 'C'#243'd. Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsPFornATIVO: TIntegerField
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
  end
  object cdsPBai: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspbai'
    ReadOnly = True
    BeforeOpen = cdsPGrBeforeOpen
    Left = 280
    Top = 136
    object cdsPBaiCOD_BAIRRO: TIntegerField
      Tag = 2
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_BAIRRO'
      Required = True
    end
    object cdsPBaiNOME_BAIRRO: TStringField
      Tag = 2
      DisplayLabel = 'Nome do Bairro'
      FieldName = 'NOME_BAIRRO'
      Size = 30
    end
    object cdsPBaiATIVO: TIntegerField
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
  end
  object cdsPCid: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspCid'
    ReadOnly = True
    BeforeOpen = cdsPGrBeforeOpen
    Left = 344
    Top = 136
    object cdsPCidCOD_CIDADE: TIntegerField
      Tag = 2
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_CIDADE'
      Required = True
    end
    object cdsPCidNOME_CIDADE: TStringField
      Tag = 2
      DisplayLabel = 'Nome da Cidade'
      FieldName = 'NOME_CIDADE'
      Size = 30
    end
    object cdsPCidATIVO: TIntegerField
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
  end
  object cdsPGr: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspGr'
    ReadOnly = True
    BeforeOpen = cdsPGrBeforeOpen
    Left = 568
    Top = 138
    object cdsPGrCODIGO_GRUP: TIntegerField
      Tag = 2
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO_GRUP'
      Required = True
    end
    object cdsPGrDESCRICAO: TStringField
      Tag = 2
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      Size = 80
    end
    object cdsPGrSEQPERF: TIntegerField
      FieldName = 'SEQPERF'
    end
    object cdsPGrATIVO: TIntegerField
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
  end
  object cdsPSub: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspSub'
    ReadOnly = True
    BeforeOpen = cdsPGrBeforeOpen
    Left = 632
    Top = 138
    object cdsPSubCODIGO_SUBGR: TIntegerField
      Tag = 2
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO_SUBGR'
      Required = True
    end
    object cdsPSubDESCRICAO: TStringField
      Tag = 2
      DisplayLabel = 'Sub Grupo'
      FieldName = 'DESCRICAO'
      Size = 80
    end
    object cdsPSubCOD_GRUPO: TIntegerField
      DisplayLabel = 'Cod Grupo'
      FieldName = 'COD_GRUPO'
    end
    object cdsPSubATIVO: TIntegerField
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
  end
  object cdsPTr: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspTr'
    ReadOnly = True
    BeforeOpen = cdsPGrBeforeOpen
    Left = 696
    Top = 138
    object cdsPTrCODIGO_TR: TIntegerField
      Tag = 2
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO_TR'
      Required = True
    end
    object cdsPTrNOME_TR: TStringField
      Tag = 2
      DisplayLabel = 'Transportador'
      FieldName = 'NOME_TR'
      FixedChar = True
      Size = 60
    end
    object cdsPTrCNPJ_TR: TStringField
      DisplayLabel = 'CNPJ'
      FieldName = 'CNPJ_TR'
      FixedChar = True
      Size = 14
    end
    object cdsPTrEND_TR: TStringField
      DisplayLabel = 'Endere'#231'o'
      FieldName = 'END_TR'
      FixedChar = True
      Size = 40
    end
    object cdsPTrMUNICIPIO_TR: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'MUNICIPIO_TR'
      FixedChar = True
      Size = 25
    end
    object cdsPTrUF_TR: TIntegerField
      DisplayLabel = 'Codigo Estado'
      FieldName = 'UF_TR'
    end
    object cdsPTrIE_TR: TStringField
      DisplayLabel = 'Insc Estadual'
      FieldName = 'IE_TR'
      FixedChar = True
      Size = 14
    end
    object cdsPTrCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'C'#243'd. Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
      Visible = False
    end
    object cdsPTrATIVO: TIntegerField
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
  end
  object cdsPProd: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspProd'
    BeforeOpen = cdsPGrBeforeOpen
    Left = 761
    Top = 138
    object cdsPProdGRUPO_PROD: TIntegerField
      Tag = 2
      DisplayLabel = 'Grupo Produto'
      FieldName = 'GRUPO_PROD'
      Required = True
    end
    object cdsPProdCOD_PROD: TStringField
      Tag = 2
      DisplayLabel = 'Cod Produto'
      FieldName = 'COD_PROD'
      Required = True
      FixedChar = True
      Size = 6
    end
    object cdsPProdDESCR_PROD: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 60
      FieldName = 'DESCR_PROD'
      FixedChar = True
      Size = 75
    end
    object cdsPProdPREC_TAB_PROD: TFloatField
      DisplayLabel = 'Pre'#231'o Varejo'
      FieldName = 'PREC_TAB_PROD'
      DisplayFormat = '##0.00'
      currency = True
    end
    object cdsPProdNUM_FAB_PROD: TStringField
      DisplayLabel = 'Numero Fabrica'#231#227'o'
      FieldName = 'NUM_FAB_PROD'
      FixedChar = True
    end
    object cdsPProdLOCACAO_PROD: TStringField
      DisplayLabel = 'Loca'#231#227'o'
      FieldName = 'LOCACAO_PROD'
      EditMask = '99-L-999;0;_'
      FixedChar = True
      Size = 8
    end
    object cdsPProdLOCACAO_PROD_1: TStringField
      DisplayLabel = 'Loca'#231#227'o 1'
      FieldName = 'LOCACAO_PROD_1'
      EditMask = '99-L-999;0;_'
      FixedChar = True
      Size = 8
    end
    object cdsPProdPREC_CUSM_PROD: TFloatField
      Tag = 3
      DisplayLabel = 'Pre'#231'o Custo M'#233'dio'
      FieldName = 'PREC_CUSM_PROD'
      DisplayFormat = '##0.00'
      currency = True
    end
    object cdsPProdPREC_CUS_PROD: TFloatField
      Tag = 3
      DisplayLabel = #218'ltimo Pre'#231'o Custo'
      FieldName = 'PREC_CUS_PROD'
      DisplayFormat = '##0.00'
      currency = True
    end
    object cdsPProdCODIGO_NOP: TFloatField
      DisplayLabel = 'Cod Natureza Opera'#231#227'o'
      FieldName = 'CODIGO_NOP'
    end
    object cdsPProdEST_F: TFloatField
      DisplayLabel = 'Estoque F'#237'sico'
      FieldName = 'EST_F'
      DisplayFormat = '##0.000'
    end
    object cdsPProdEST_R: TFloatField
      Tag = 1
      DisplayLabel = 'Estoque Dep'#243'sito'
      FieldName = 'EST_R'
      Visible = False
      DisplayFormat = '##0.000'
    end
    object cdsPProdDESCR_PROD_RED: TStringField
      DisplayLabel = 'Descri'#231#227'o Reduzida'
      FieldName = 'DESCR_PROD_RED'
      Size = 35
    end
    object cdsPProdCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
      Visible = False
    end
    object cdsPProdSUB_G_PROD: TIntegerField
      DisplayLabel = 'Cod Sub Grupo'
      FieldName = 'SUB_G_PROD'
    end
    object cdsPProdAPLICACAO_PROD: TStringField
      DisplayLabel = 'Aplica'#231#227'o'
      FieldName = 'APLICACAO_PROD'
      Size = 150
    end
    object cdsPProdDATA_ULT_COMPRA: TDateTimeField
      DisplayLabel = 'Data '#218'ltima Compra'
      FieldName = 'DATA_ULT_COMPRA'
      EditMask = '!99/99/9999;1;_'
    end
    object cdsPProdVL_ULT_COMPRA: TFloatField
      DisplayLabel = 'Valor '#218'ltima Compra'
      FieldName = 'VL_ULT_COMPRA'
      DisplayFormat = '##0.00'
      currency = True
    end
    object cdsPProdN_CRI_PROD: TFloatField
      DisplayLabel = 'N'#237'vel Cr'#237'tico'
      FieldName = 'N_CRI_PROD'
      DisplayFormat = '##0.000'
    end
    object cdsPProdN_MIN_PROD: TFloatField
      DisplayLabel = 'N'#237'vel M'#237'nimo'
      FieldName = 'N_MIN_PROD'
      DisplayFormat = '##0.000'
    end
    object cdsPProdN_MAX_PROD: TFloatField
      DisplayLabel = 'N'#237'vel M'#225'ximo'
      FieldName = 'N_MAX_PROD'
      DisplayFormat = '##0.000'
    end
    object cdsPProdPREC_REP_PROD: TFloatField
      DisplayLabel = 'Pre'#231'o Reposi'#231#227'o'
      FieldName = 'PREC_REP_PROD'
      DisplayFormat = '##0.00'
      currency = True
    end
    object cdsPProdCLASSE_PROD: TStringField
      DisplayLabel = 'Classe do Produto'
      FieldName = 'CLASSE_PROD'
      FixedChar = True
      Size = 1
    end
    object cdsPProdIPI_PROD: TFloatField
      DisplayLabel = 'IPI do Produto'
      FieldName = 'IPI_PROD'
    end
    object cdsPProdNUM_NF_REC: TIntegerField
      DisplayLabel = 'Numero Nota Fiscal Recebimento'
      FieldName = 'NUM_NF_REC'
    end
    object cdsPProdICM_PROD: TFloatField
      DisplayLabel = 'ICMS'
      FieldName = 'ICM_PROD'
    end
    object cdsPProdQREQ_PROD: TFloatField
      DisplayLabel = 'Quantidade Requisi'#231#227'o'
      FieldName = 'QREQ_PROD'
    end
    object cdsPProdQCONF_PROD: TFloatField
      DisplayLabel = 'Quantidade Confirmada'
      FieldName = 'QCONF_PROD'
    end
    object cdsPProdPREC_30_PROD: TFloatField
      DisplayLabel = 'Pre'#231'o 30 dias'
      FieldName = 'PREC_30_PROD'
      DisplayFormat = '##0.00'
      currency = True
    end
    object cdsPProdPREC_60_PROD: TFloatField
      DisplayLabel = 'Pre'#231'o 60 dias'
      FieldName = 'PREC_60_PROD'
      DisplayFormat = '##0.00'
      currency = True
    end
    object cdsPProdPREC_90_PROD: TFloatField
      DisplayLabel = 'Pre'#231'o 90 dias'
      FieldName = 'PREC_90_PROD'
      DisplayFormat = '##0.00'
      currency = True
    end
    object cdsPProdPERC_TB_PROD: TFloatField
      DisplayLabel = 'Markup Varejo Desejado'
      FieldName = 'PERC_TB_PROD'
      DisplayFormat = '##0.00'
    end
    object cdsPProdPERC_TB_VARE: TFloatField
      DisplayLabel = 'PMM Varejo'
      FieldName = 'PERC_TB_VARE'
      DisplayFormat = '##0.00'
    end
    object cdsPProdPERC_TB_PRODA: TFloatField
      DisplayLabel = 'Markup Atacado Desejado'
      FieldName = 'PERC_TB_PRODA'
    end
    object cdsPProdPERC_TB_ATAC: TFloatField
      DisplayLabel = 'PMM Atacado'
      FieldName = 'PERC_TB_ATAC'
      DisplayFormat = '##0.00'
    end
    object cdsPProdPERC_TB_PROD3: TFloatField
      DisplayLabel = 'Markup 30 dias Desejado'
      FieldName = 'PERC_TB_PROD3'
      DisplayFormat = '##0.00'
    end
    object cdsPProdPERC_TB_PROD6: TFloatField
      DisplayLabel = 'Markup 60 dias Desejado'
      FieldName = 'PERC_TB_PROD6'
      DisplayFormat = '##0.00'
    end
    object cdsPProdPERC_TB_PROD9: TFloatField
      DisplayLabel = 'Markup 90 dias Desejado'
      FieldName = 'PERC_TB_PROD9'
      DisplayFormat = '##0.00'
    end
    object cdsPProdPERC_RED_PROD: TFloatField
      DisplayLabel = 'Percentual Redu'#231#227'o Produto'
      FieldName = 'PERC_RED_PROD'
    end
    object cdsPProdMARCA_P: TStringField
      DisplayLabel = 'Marca'
      FieldName = 'MARCA_P'
      FixedChar = True
      Size = 10
    end
    object cdsPProdALT_COD_CUPOM: TStringField
      DisplayLabel = 'Codigo Cupom'
      FieldName = 'ALT_COD_CUPOM'
      FixedChar = True
      Size = 1
    end
    object cdsPProdCOD_CUST_PROD: TStringField
      DisplayLabel = 'Cod Custo Produto'
      FieldName = 'COD_CUST_PROD'
      FixedChar = True
      Size = 6
    end
    object cdsPProdCOMISSAO_PROD: TFloatField
      DisplayLabel = 'Comiss'#227'o'
      FieldName = 'COMISSAO_PROD'
    end
    object cdsPProdISENTO_PROD: TStringField
      DisplayLabel = 'Produto Isento'
      FieldName = 'ISENTO_PROD'
      FixedChar = True
      Size = 1
    end
    object cdsPProdN_INCIDENCIA_PROD: TStringField
      DisplayLabel = 'N'#227'o Incid'#234'ncia Produto'
      FieldName = 'N_INCIDENCIA_PROD'
      FixedChar = True
      Size = 1
    end
    object cdsPProdQUANT_PROD_BL: TFloatField
      DisplayLabel = 'Quantidade Produto Embalagem'
      FieldName = 'QUANT_PROD_BL'
    end
    object cdsPProdLOCACAO1_BL: TStringField
      DisplayLabel = 'Loca'#231#227'o 1 Embalagem'
      FieldName = 'LOCACAO1_BL'
      FixedChar = True
      Size = 8
    end
    object cdsPProdLOCACAO2_BL: TStringField
      DisplayLabel = 'Loca'#231#227'o 2 Embalagem'
      FieldName = 'LOCACAO2_BL'
      FixedChar = True
      Size = 8
    end
    object cdsPProdUNIDADE: TStringField
      DisplayLabel = 'Unidade'
      FieldName = 'UNIDADE'
      Size = 3
    end
    object cdsPProdALT_DESC_CUPOM: TStringField
      DisplayLabel = 'Altera Descri'#231#227'o Cupom'
      FieldName = 'ALT_DESC_CUPOM'
      FixedChar = True
      Size = 1
    end
    object cdsPProdCST_PROD: TStringField
      DisplayLabel = 'CST'
      FieldName = 'CST_PROD'
      FixedChar = True
      Size = 3
    end
    object cdsPProdCLINV: TStringField
      DisplayLabel = 'Classifica'#231#227'o por Valor'
      FieldName = 'CLINV'
      FixedChar = True
      Size = 1
    end
    object cdsPProdCLPRECO: TStringField
      DisplayLabel = 'Classifica'#231#227'o por Pre'#231'o'
      FieldName = 'CLPRECO'
      FixedChar = True
      Size = 2
    end
    object cdsPProdCLPOP: TStringField
      DisplayLabel = 'Classifica'#231#227'o por Popularidade'
      FieldName = 'CLPOP'
      FixedChar = True
      Size = 2
    end
    object cdsPProdCLQTV: TStringField
      DisplayLabel = 'Classifica'#231#227'o por Volume Venda'
      FieldName = 'CLQTV'
      FixedChar = True
      Size = 2
    end
    object cdsPProdCLFRV: TStringField
      DisplayLabel = 'Classifica'#231#227'o por Frequ'#234'ncia Venda'
      FieldName = 'CLFRV'
      FixedChar = True
      Size = 2
    end
    object cdsPProdCLATL: TStringField
      DisplayLabel = 'Classifica'#231#227'o por Atualidade Venda'
      FieldName = 'CLATL'
      FixedChar = True
      Size = 2
    end
    object cdsPProdDT_ULT_VND: TDateTimeField
      DisplayLabel = 'Data '#218'ltima Venda'
      FieldName = 'DT_ULT_VND'
    end
    object cdsPProdDT_ULT_VNDA: TDateTimeField
      DisplayLabel = 'Data '#218'ltima Venda Antes'
      FieldName = 'DT_ULT_VNDA'
    end
    object cdsPProdPREC_PUBLICO: TFloatField
      DisplayLabel = 'Pre'#231'o Atacado'
      FieldName = 'PREC_PUBLICO'
      DisplayFormat = '##0.00'
      currency = True
    end
    object cdsPProdCOD_PPS: TStringField
      DisplayLabel = 'C'#243'digo PPS'
      FieldName = 'COD_PPS'
      FixedChar = True
      Size = 2
    end
    object cdsPProdDAT_CAD_PROD: TDateTimeField
      DisplayLabel = 'Data Cadastro'
      FieldName = 'DAT_CAD_PROD'
    end
    object cdsPProdDAT_MOD_PROD: TDateTimeField
      DisplayLabel = 'Data Modificac'#227'o'
      FieldName = 'DAT_MOD_PROD'
    end
    object cdsPProdPREC_CUSR_PROD: TFloatField
      Tag = 3
      DisplayLabel = 'Pre'#231'o Custo Real'
      FieldName = 'PREC_CUSR_PROD'
      DisplayFormat = '##0.00'
      currency = True
    end
    object cdsPProdCOD_DSGS: TStringField
      DisplayLabel = 'C'#243'digo DSGS'
      FieldName = 'COD_DSGS'
      EditMask = '0.00.0.00;0;_'
      FixedChar = True
      Size = 6
    end
    object cdsPProdISENTO_PIS: TStringField
      DisplayLabel = 'ISENTO PIS/CONFINS'
      FieldName = 'ISENTO_PIS'
      FixedChar = True
      Size = 1
    end
    object cdsPProdESTC: TFloatField
      DisplayLabel = 'Estoque C'
      FieldName = 'ESTC'
    end
    object cdsPProdESTS: TFloatField
      DisplayLabel = 'Estoque S'
      FieldName = 'ESTS'
    end
    object cdsPProdESTM: TFloatField
      DisplayLabel = 'Estoque M'
      FieldName = 'ESTM'
    end
    object cdsPProdPREC_CUS_MNF: TFloatField
      Tag = 3
      DisplayLabel = 'Pre'#231'o Custo da MNF'
      FieldName = 'PREC_CUS_MNF'
      DisplayFormat = '##0.00'
      currency = True
    end
    object cdsPProdEMB_PROD: TStringField
      DisplayLabel = 'Embalagem'
      FieldName = 'EMB_PROD'
      FixedChar = True
      Size = 10
    end
    object cdsPProdPERC_SUBSTTR: TFloatField
      DisplayLabel = 'Percentual Substitui'#231#227'o Tribut'#225'ria'
      FieldName = 'PERC_SUBSTTR'
    end
    object cdsPProdQTDEMB: TFloatField
      DisplayLabel = 'Quantidade Embalagem'
      FieldName = 'QTDEMB'
    end
    object cdsPProdBALANCA_PROD: TStringField
      DisplayLabel = 'Balan'#231'a'
      FieldName = 'BALANCA_PROD'
      FixedChar = True
      Size = 1
    end
    object cdsPProdVALIDADE_PROD: TStringField
      DisplayLabel = 'Validade'
      FieldName = 'VALIDADE_PROD'
      FixedChar = True
      Size = 2
    end
    object cdsPProdPREC_CUSR_MNF: TFloatField
      Tag = 3
      DisplayLabel = 'Pre'#231'o Custo Real MNF'
      FieldName = 'PREC_CUSR_MNF'
      DisplayFormat = '##0.00'
      currency = True
    end
    object cdsPProdPERC_FRETE_PROD: TFloatField
      DisplayLabel = 'Percentual Frete'
      FieldName = 'PERC_FRETE_PROD'
      DisplayFormat = '##0.00'
    end
    object cdsPProdPREC_CUSMR_PROD: TFloatField
      Tag = 3
      DisplayLabel = 'Pre'#231'o Custo M'#233'dio Real'
      FieldName = 'PREC_CUSMR_PROD'
      DisplayFormat = '##0.00'
      currency = True
    end
    object cdsPProdESTSUBSTR: TStringField
      DisplayLabel = 'Estados Substitui'#231#227'o Tribut'#225'ria'
      FieldName = 'ESTSUBSTR'
      FixedChar = True
      Size = 80
    end
    object cdsPProdCOMISSAO_PROD_GER: TFloatField
      DisplayLabel = 'Comiss'#227'o Gerente'
      FieldName = 'COMISSAO_PROD_GER'
      DisplayFormat = '##0.00'
    end
    object cdsPProdCUSTO_HONDA: TFloatField
      DisplayLabel = 'Custo Honda'
      FieldName = 'CUSTO_HONDA'
    end
    object cdsPProdALIQ_RED_PROD: TFloatField
      DisplayLabel = 'Al'#237'quota Redu'#231#227'o Produto'
      FieldName = 'ALIQ_RED_PROD'
    end
    object cdsPProdTIP_PROD_IND: TStringField
      DisplayLabel = 'Tipo Produto Indicado'
      FieldName = 'TIP_PROD_IND'
      FixedChar = True
      Size = 5
    end
    object cdsPProdICMANT_SUB: TFloatField
      DisplayLabel = 'ICMS Substitui'#231#227'o Tribut'#225'ria'
      FieldName = 'ICMANT_SUB'
    end
    object cdsPProdNEC_ACOMP: TStringField
      DisplayLabel = 'Necessita de Acompanhamento'
      FieldName = 'NEC_ACOMP'
      FixedChar = True
      Size = 1
    end
    object cdsPProdDIAS_ACOMP: TIntegerField
      DisplayLabel = 'Dias de Acompanhamento'
      FieldName = 'DIAS_ACOMP'
    end
    object cdsPProdNBM: TStringField
      DisplayLabel = 'Codigo NBM'
      FieldName = 'NBM'
      FixedChar = True
      Size = 8
    end
    object cdsPProdPERC_AD_30: TFloatField
      DisplayLabel = 'Percentual Aumento 30 dias'
      FieldName = 'PERC_AD_30'
      DisplayFormat = '##0.00'
    end
    object cdsPProdPERC_AD_60: TFloatField
      DisplayLabel = 'Percentual Aumento 60 dias'
      FieldName = 'PERC_AD_60'
      DisplayFormat = '##0.00'
    end
    object cdsPProdPERC_AD_90: TFloatField
      DisplayLabel = 'Percentual Aumento 90 dias'
      FieldName = 'PERC_AD_90'
      DisplayFormat = '##0.00'
    end
    object cdsPProdDATA_MOD_PR: TDateTimeField
      DisplayLabel = 'Data Modifica'#231#227'o Produto'
      FieldName = 'DATA_MOD_PR'
    end
    object cdsPProdPESO_LIQ_PROD: TFloatField
      DisplayLabel = 'Peso L'#237'quido Produto'
      FieldName = 'PESO_LIQ_PROD'
    end
    object cdsPProdPESO_BRUT_PROD: TFloatField
      DisplayLabel = 'Peso Bruto Produto'
      FieldName = 'PESO_BRUT_PROD'
    end
    object cdsPProdLOC_DEP: TStringField
      DisplayLabel = 'Loca'#231#227'o do Dep'#243'sito'
      FieldName = 'LOC_DEP'
      FixedChar = True
      Size = 8
    end
    object cdsPProdCOD_MARCA: TIntegerField
      DisplayLabel = 'Cod Marca'
      FieldName = 'COD_MARCA'
    end
    object cdsPProdTOT_ALIQ: TStringField
      DisplayLabel = 'Totalizador redu'#231#227'o no ECF'
      FieldName = 'TOT_ALIQ'
      FixedChar = True
      Size = 4
    end
    object cdsPProdDATA_ULT_AJUSTE: TDateTimeField
      DisplayLabel = 'Data '#218'ltimo Pre'#231'o de Ajusto'
      FieldName = 'DATA_ULT_AJUSTE'
    end
    object cdsPProdPRECO_AJUSTE: TFloatField
      DisplayLabel = 'Pre'#231'o de Ajuste'
      FieldName = 'PRECO_AJUSTE'
      DisplayFormat = '##0.00'
      currency = True
    end
    object cdsPProdALIQ_INTERNA_NFENT: TFloatField
      DisplayLabel = 'Al'#237'quota Interna NF Entrada'
      FieldName = 'ALIQ_INTERNA_NFENT'
    end
    object cdsPProdCOD_RECEITA: TIntegerField
      DisplayLabel = 'C'#243'd. Receita'
      FieldName = 'COD_RECEITA'
    end
    object cdsPProdPERMITIR_DESCONTO: TStringField
      DisplayLabel = 'Permitir Desconto'
      FieldName = 'PERMITIR_DESCONTO'
      FixedChar = True
      Size = 1
    end
    object cdsPProdARREDONDAR_TRUNCAR: TStringField
      DisplayLabel = 'Arredondar/Truncar'
      FieldName = 'ARREDONDAR_TRUNCAR'
      FixedChar = True
      Size = 1
    end
    object cdsPProdEM_PROMOCAO: TStringField
      DisplayLabel = 'Em Promo'#231#227'o'
      FieldName = 'EM_PROMOCAO'
      FixedChar = True
      Size = 1
    end
    object cdsPProdPRECO_PROMOCAO: TFloatField
      DisplayLabel = 'Pre'#231'o de Promo'#231#227'o'
      FieldName = 'PRECO_PROMOCAO'
      DisplayFormat = '##0.00'
      currency = True
    end
    object cdsPProdTIPO_FAB: TStringField
      DisplayLabel = 'Tipo de Fabrica'#231#227'o'
      FieldName = 'TIPO_FAB'
      Size = 1
    end
    object cdsPProdCSDECQTDE: TStringField
      DisplayLabel = 'N'#186' de Casas Decimais para Quantidade'
      FieldName = 'CSDECQTDE'
      Required = True
      Size = 1
    end
    object cdsPProdCSDECVLUNT: TStringField
      DisplayLabel = 'N'#186' de Casas Decimais para Valor Unit'#225'rio'
      FieldName = 'CSDECVLUNT'
      Required = True
      Size = 1
    end
    object cdsPProdCONSUMO: TStringField
      DisplayLabel = 'Consumo'
      FieldName = 'CONSUMO'
      FixedChar = True
      Size = 1
    end
    object cdsPProdFORA_LINHA: TStringField
      DisplayLabel = 'Fora de Linha'
      FieldName = 'FORA_LINHA'
      FixedChar = True
      Size = 1
    end
    object cdsPProdATIVO: TIntegerField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
      Visible = False
    end
    object cdsPProdICMS_RECOMPOSICAO: TFloatField
      DisplayLabel = 'ICMS Recomposi'#231#227'o'
      FieldName = 'ICMS_RECOMPOSICAO'
      DisplayFormat = '#0.000'
    end
    object cdsPProdCRIAR_PRODUCAO_AUT: TStringField
      DisplayLabel = 'Gerar producao automaticamente'
      FieldName = 'CRIAR_PRODUCAO_AUT'
      FixedChar = True
      Size = 1
    end
    object cdsPProdID_COMMERCE: TLargeintField
      DisplayLabel = 'Id Ecommerce'
      FieldName = 'ID_COMMERCE'
    end
    object cdsPProdID_COMERCIO_ABERTO: TIntegerField
      DisplayLabel = 'Id Comercio Aberto'
      FieldName = 'ID_COMERCIO_ABERTO'
    end
    object cdsPProdDETALHES_PROD: TMemoField
      DisplayLabel = 'Detalhes / Caracteristicas'
      FieldName = 'DETALHES_PROD'
      BlobType = ftMemo
    end
    object cdsPProdOBSERVACOES: TMemoField
      DisplayLabel = 'Observacoes'
      FieldName = 'OBSERVACOES'
      BlobType = ftMemo
    end
  end
  object qrPesqNbm: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transConsulta
    SQL.Strings = (
      'select * from nbm')
    Left = 146
    Top = 198
  end
  object dspNbm: TDataSetProvider
    DataSet = qrPesqNbm
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 143
    Top = 252
  end
  object cdsPNbm: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspNBM'
    ReadOnly = True
    BeforeOpen = cdsPGrBeforeOpen
    Left = 145
    Top = 309
    object cdsPNbmCOD_NCM: TStringField
      DisplayLabel = 'Codigo NCM'
      FieldName = 'COD_NCM'
      FixedChar = True
      Size = 8
    end
    object cdsPNbmNOME_NCM: TStringField
      DisplayLabel = 'Descri'#231#227'o NCM'
      FieldName = 'NOME_NCM'
      Size = 60
    end
    object cdsPNbmUSAR_MVA_AJUSTADO: TStringField
      DisplayLabel = 'MVA Ajustado'
      FieldName = 'USAR_MVA_AJUSTADO'
      FixedChar = True
      Size = 1
    end
    object cdsPNbmREFERENCIA: TStringField
      DisplayLabel = 'Unidade'
      FieldName = 'REFERENCIA'
      Size = 4
    end
    object cdsPNbmMVA: TFloatField
      FieldName = 'MVA'
    end
    object cdsPNbmMVA_INTER: TFloatField
      DisplayLabel = 'MVA Interestadual'
      FieldName = 'MVA_INTER'
    end
    object cdsPNbmALIQ_INTRA: TFloatField
      DisplayLabel = 'Aliq Intra Estadual'
      FieldName = 'ALIQ_INTRA'
    end
  end
  object qrPesqVeic: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transConsulta
    SQL.Strings = (
      'select VEICULOS.*, CLIENTES.NOME_CLIENTE, CLIENTES.RAZAO, '
      'CLIENTES.CEP, CLIENTES.ENDERECO, CLIENTES.NUM_END_CLIENTE,'
      'CLIENTES.FONE_CLIENTE, CLIENTES.FONE_CELULAR, CLIENTES.EMAIL, '
      
        'ESTADOS.SIGLA_UF, CIDADES.NOME_CIDADE, BAIRROS.NOME_BAIRRO, LOCA' +
        'LIDADE.LOCALIDADE, SETOR.SETOR from VEICULOS'
      
        'LEFT JOIN CLIENTES ON CLIENTES.COD_CLIENTE = VEICULOS.COD_CLIENT' +
        'E AND CLIENTES.COD_EMPRESA = VEICULOS.COD_EMPRESA '
      'LEFT JOIN ESTADOS ON ESTADOS.CODIGO_UF = CLIENTES.CODIGO_UF '
      'LEFT JOIN CIDADES ON CIDADES.COD_CIDADE = CLIENTES.COD_CIDADE '
      'LEFT JOIN BAIRROS ON BAIRROS.COD_BAIRRO = CLIENTES.COD_BAIRRO '
      
        'LEFT JOIN LOCALIDADE ON LOCALIDADE.COD_LOCALIDADE = CLIENTES.COD' +
        '_LOCALIDADE AND LOCALIDADE.COD_EMPRESA = CLIENTES.COD_EMPRESA'
      
        'LEFT JOIN SETOR ON SETOR.COD_SETOR = LOCALIDADE.COD_SETOR AND SE' +
        'TOR.COD_EMPRESA = LOCALIDADE.COD_EMPRESA')
    Left = 209
    Top = 198
  end
  object dspVeic: TDataSetProvider
    DataSet = qrPesqVeic
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 206
    Top = 252
  end
  object cdsPVeic: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspVeic'
    ReadOnly = True
    BeforeOpen = cdsPGrBeforeOpen
    Left = 208
    Top = 309
    object cdsPVeicCODIGO: TIntegerField
      Tag = 2
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO'
      Required = True
    end
    object cdsPVeicPLACA: TStringField
      Tag = 2
      DisplayLabel = 'Placa'
      FieldName = 'PLACA'
      Required = True
      FixedChar = True
      Size = 10
    end
    object cdsPVeicCHASSI: TStringField
      Tag = 2
      DisplayLabel = 'Chassi'
      FieldName = 'CHASSI'
      Required = True
      FixedChar = True
      Size = 17
    end
    object cdsPVeicCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
      Visible = False
    end
    object cdsPVeicCOD_CLIENTE: TIntegerField
      DisplayLabel = 'Cod Cliente'
      FieldName = 'COD_CLIENTE'
      Required = True
    end
    object cdsPVeicESPECIE: TStringField
      DisplayLabel = 'Esp'#233'cie'
      FieldName = 'ESPECIE'
      FixedChar = True
      Size = 15
    end
    object cdsPVeicMARCA_V: TStringField
      DisplayLabel = 'Marca'
      FieldName = 'MARCA_V'
      FixedChar = True
      Size = 15
    end
    object cdsPVeicMODELO: TIntegerField
      DisplayLabel = 'Modelo'
      FieldName = 'MODELO'
    end
    object cdsPVeicDESCMODELO: TStringField
      DisplayLabel = 'Descri'#231#227'o Modelo'
      FieldName = 'DESCMODELO'
      FixedChar = True
      Size = 30
    end
    object cdsPVeicMOTOR: TStringField
      DisplayLabel = 'Motor'
      FieldName = 'MOTOR'
      FixedChar = True
      Size = 15
    end
    object cdsPVeicCOR: TStringField
      DisplayLabel = 'Cor'
      FieldName = 'COR'
      FixedChar = True
      Size = 10
    end
    object cdsPVeicANOFAB: TIntegerField
      DisplayLabel = 'Ano Fabric.'
      FieldName = 'ANOFAB'
    end
    object cdsPVeicANOMOD: TIntegerField
      DisplayLabel = 'Ano Modelo'
      FieldName = 'ANOMOD'
    end
    object cdsPVeicCILINDROS: TIntegerField
      DisplayLabel = 'Cilindros'
      FieldName = 'CILINDROS'
    end
    object cdsPVeicCOMBUSTIVEL: TStringField
      DisplayLabel = 'Combust'#237'vel'
      FieldName = 'COMBUSTIVEL'
      FixedChar = True
      Size = 8
    end
    object cdsPVeicCILINDRADA: TFloatField
      DisplayLabel = 'Cilindradas'
      FieldName = 'CILINDRADA'
    end
    object cdsPVeicLOTACAO: TStringField
      DisplayLabel = 'Lotacao'
      FieldName = 'LOTACAO'
      FixedChar = True
      Size = 10
    end
    object cdsPVeicRENAVAM: TStringField
      DisplayLabel = 'Renavam'
      FieldName = 'RENAVAM'
      FixedChar = True
      Size = 9
    end
    object cdsPVeicDATA_VENDA: TDateTimeField
      DisplayLabel = 'Data Venda'
      FieldName = 'DATA_VENDA'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsPVeicOBS: TStringField
      DisplayLabel = 'Obs'
      FieldName = 'OBS'
      FixedChar = True
      Size = 45
    end
    object cdsPVeicDATA_CAD: TDateTimeField
      DisplayLabel = 'Data Cadastro'
      FieldName = 'DATA_CAD'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsPVeicUS_CAD: TIntegerField
      Tag = 1
      DisplayLabel = 'Usuario Cad'
      FieldName = 'US_CAD'
      Visible = False
    end
    object cdsPVeicHP: TFloatField
      FieldName = 'HP'
    end
    object cdsPVeicCOD_ESPE_SEG: TIntegerField
      DisplayLabel = 'Cod Segmento'
      FieldName = 'COD_ESPE_SEG'
    end
    object cdsPVeicATIVO: TIntegerField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
      Visible = False
    end
    object cdsPVeicNOME_CLIENTE: TStringField
      DisplayLabel = 'Nome Cliente (Nome Fantasia)'
      FieldName = 'NOME_CLIENTE'
      Size = 35
    end
    object cdsPVeicRAZAO: TStringField
      DisplayLabel = 'Nome Cliente (Razao Social)'
      FieldName = 'RAZAO'
      Size = 60
    end
    object cdsPVeicCEP: TStringField
      DisplayLabel = 'Cep Cliente'
      FieldName = 'CEP'
      FixedChar = True
      Size = 9
    end
    object cdsPVeicENDERECO: TStringField
      DisplayLabel = 'Endereco Cliente'
      FieldName = 'ENDERECO'
      Size = 50
    end
    object cdsPVeicNUM_END_CLIENTE: TStringField
      DisplayLabel = 'Num Endereco Cliente'
      FieldName = 'NUM_END_CLIENTE'
      Size = 60
    end
    object cdsPVeicFONE_CLIENTE: TStringField
      DisplayLabel = 'Telefone Cliente'
      FieldName = 'FONE_CLIENTE'
      FixedChar = True
      Size = 13
    end
    object cdsPVeicFONE_CELULAR: TStringField
      DisplayLabel = 'Celular Cliente'
      FieldName = 'FONE_CELULAR'
      FixedChar = True
      Size = 13
    end
    object cdsPVeicEMAIL: TStringField
      DisplayLabel = 'Email Cliente'
      FieldName = 'EMAIL'
      Size = 256
    end
    object cdsPVeicSIGLA_UF: TStringField
      DisplayLabel = 'Estado'
      FieldName = 'SIGLA_UF'
      FixedChar = True
      Size = 2
    end
    object cdsPVeicNOME_CIDADE: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'NOME_CIDADE'
      Size = 30
    end
    object cdsPVeicNOME_BAIRRO: TStringField
      DisplayLabel = 'Bairro'
      FieldName = 'NOME_BAIRRO'
      Size = 30
    end
    object cdsPVeicLOCALIDADE: TStringField
      DisplayLabel = 'Localidade'
      FieldName = 'LOCALIDADE'
      Size = 64
    end
    object cdsPVeicSETOR: TStringField
      DisplayLabel = 'Setor'
      FieldName = 'SETOR'
      Size = 64
    end
  end
  object qrPesqApar: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transConsulta
    SQL.Strings = (
      'select equipamento.*,'
      'case when (equipamento.tip_equip = '#39'e'#39') then '
      '    clientes.nome_cliente '
      'else '
      '    colaborador.nome_vendedor end nome_proprietario, '
      'case when (equipamento.tip_equip = '#39'e'#39') then '
      '    clientes.razao '
      'else '
      '    colaborador.nome_vendedor end razao_proprietario, '
      'case when (equipamento.tip_equip = '#39'e'#39') then '
      '    clientes.cep'
      'else '
      '    colaborador.cep_vendedor end cep_proprietario, '
      'case when (equipamento.tip_equip = '#39'e'#39') then '
      '    clientes.endereco '
      'else '
      '    colaborador.end_vendedor end endereco_proprietario, '
      'case when (equipamento.tip_equip = '#39'e'#39') then '
      '    clientes.num_end_cliente'
      'else '
      '    '#39#39' end num_end_proprietario, '
      'case when (equipamento.tip_equip = '#39'e'#39') then '
      '    clientes.fone_cliente '
      'else '
      '    colaborador.fone_vendedor end fone_proprietario, '
      'case when (equipamento.tip_equip = '#39'e'#39') then '
      '    clientes.fone_celular '
      'else '
      '    '#39#39' end celular_proprietario, '
      'case when (equipamento.tip_equip = '#39'e'#39') then '
      '    clientes.email '
      'else '
      '    colaborador.email end email_proprietario, '
      'case when (equipamento.tip_equip = '#39'e'#39') then '
      '   estados.sigla_uf '
      'else '
      '   est.sigla_uf end sigla_proprietario, '
      'case when (equipamento.tip_equip = '#39'e'#39') then '
      '   cidades.nome_cidade '
      'else '
      '   cid.nome_cidade end cidade_proprietario, '
      'case when (equipamento.tip_equip = '#39'e'#39') then '
      '   bairros.nome_bairro'
      'else '
      '   bai.nome_bairro end bairro_proprietario,'
      'case when (equipamento.tip_equip = '#39'e'#39') then '
      '      localidade.localidade '
      'else '
      '    '#39#39' end localidade_proprietario, '
      'case when (equipamento.tip_equip = '#39'e'#39') then '
      '    setor.setor'
      'else '
      '    '#39#39' end setor_proprietario from equipamento'
      
        'left join clientes on clientes.cod_cliente = equipamento.cod_pro' +
        'p and clientes.cod_empresa = equipamento.cod_empresa '
      'left join estados on estados.codigo_uf = clientes.codigo_uf '
      'left join cidades on cidades.cod_cidade = clientes.cod_cidade '
      'left join bairros on bairros.cod_bairro = clientes.cod_bairro'
      
        'left join localidade on localidade.cod_localidade = clientes.cod' +
        '_localidade and localidade.cod_empresa = clientes.cod_empresa '
      
        'left join setor on setor.cod_setor = localidade.cod_setor and se' +
        'tor.cod_empresa = localidade.cod_empresa '
      
        'left join colaborador on colaborador.cod_vendedor = equipamento.' +
        'cod_prop and colaborador.cod_empresa = equipamento.cod_empresa '
      'left join estados est on est.codigo_uf = colaborador.codigo_uf '
      
        'left join cidades cid on cid.cod_cidade = colaborador.cod_cidade' +
        ' '
      'left join bairros bai on bai.cod_bairro = colaborador.cod_bairro')
    Left = 271
    Top = 198
  end
  object dspApar: TDataSetProvider
    DataSet = qrPesqApar
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 268
    Top = 252
  end
  object cdsPApar: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspApar'
    ReadOnly = True
    BeforeOpen = cdsPGrBeforeOpen
    Left = 270
    Top = 309
    object cdsPAparCOD_EQUIP: TIntegerField
      Tag = 2
      DisplayLabel = 'Codigo'
      FieldName = 'COD_EQUIP'
      Required = True
    end
    object cdsPAparCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
      Visible = False
    end
    object cdsPAparDAT_CAD_EQUI: TDateTimeField
      DisplayLabel = 'Data Cadastro'
      FieldName = 'DAT_CAD_EQUI'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsPAparESTADO_EQUI: TMemoField
      DisplayLabel = 'Estado Equip'
      FieldName = 'ESTADO_EQUI'
      OnGetText = cdsPAparESTADO_EQUIGetText
      BlobType = ftMemo
      Size = 8
    end
    object cdsPAparTIP_EQUIP: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIP_EQUIP'
      FixedChar = True
      Size = 1
    end
    object cdsPAparVLR_EQUI: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VLR_EQUI'
    end
    object cdsPAparIND_DEPREC: TFloatField
      DisplayLabel = 'Indice Dep'
      FieldName = 'IND_DEPREC'
    end
    object cdsPAparCOD_DEPART: TIntegerField
      DisplayLabel = 'Cod Depart'
      FieldName = 'COD_DEPART'
    end
    object cdsPAparCOD_PROP: TIntegerField
      DisplayLabel = 'Cod Proprietario'
      FieldName = 'COD_PROP'
    end
    object cdsPAparNOM_EQUIP: TStringField
      Tag = 2
      DisplayLabel = 'Nome Equip'
      FieldName = 'NOM_EQUIP'
      Size = 32
    end
    object cdsPAparN_SERIE: TStringField
      DisplayLabel = 'N'#176' S'#233'rie'
      FieldName = 'N_SERIE'
      Size = 32
    end
    object cdsPAparCOD_MARCA: TIntegerField
      DisplayLabel = 'Cod Marca'
      FieldName = 'COD_MARCA'
      Required = True
    end
    object cdsPAparMARCA: TStringField
      DisplayLabel = 'Marca'
      FieldName = 'MARCA'
      Size = 32
    end
    object cdsPAparMODELO: TStringField
      DisplayLabel = 'Modelo'
      FieldName = 'MODELO'
      Size = 32
    end
    object cdsPAparCOR: TStringField
      DisplayLabel = 'Cor'
      FieldName = 'COR'
      Size = 16
    end
    object cdsPAparATIVO: TIntegerField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
      Visible = False
    end
    object cdsPAparCOMCONTRATO: TStringField
      DisplayLabel = 'Com Contrato'
      FieldName = 'COMCONTRATO'
      FixedChar = True
      Size = 1
    end
    object cdsPAparNOME_PROPRIETARIO: TStringField
      DisplayLabel = 'Nome Proprietario (Nome Fantasia)'
      FieldName = 'NOME_PROPRIETARIO'
      Size = 35
    end
    object cdsPAparRAZAO_PROPRIETARIO: TStringField
      DisplayLabel = 'Nome Proprietario (Razao Social)'
      FieldName = 'RAZAO_PROPRIETARIO'
      Size = 60
    end
    object cdsPAparCEP_PROPRIETARIO: TStringField
      DisplayLabel = 'Cep Proprietario'
      FieldName = 'CEP_PROPRIETARIO'
      FixedChar = True
      Size = 9
    end
    object cdsPAparENDERECO_PROPRIETARIO: TStringField
      DisplayLabel = 'Endereco Proprietario'
      FieldName = 'ENDERECO_PROPRIETARIO'
      Size = 50
    end
    object cdsPAparNUM_END_PROPRIETARIO: TStringField
      DisplayLabel = 'Num Endereco Proprietario'
      FieldName = 'NUM_END_PROPRIETARIO'
      Size = 60
    end
    object cdsPAparFONE_PROPRIETARIO: TStringField
      DisplayLabel = 'Telefone Proprietario'
      FieldName = 'FONE_PROPRIETARIO'
      FixedChar = True
      Size = 14
    end
    object cdsPAparCELULAR_PROPRIETARIO: TStringField
      DisplayLabel = 'Celular Proprietario'
      FieldName = 'CELULAR_PROPRIETARIO'
      FixedChar = True
      Size = 13
    end
    object cdsPAparEMAIL_PROPRIETARIO: TStringField
      DisplayLabel = 'Email Proprietario'
      FieldName = 'EMAIL_PROPRIETARIO'
      Size = 256
    end
    object cdsPAparSIGLA_PROPRIETARIO: TStringField
      DisplayLabel = 'Estado'
      FieldName = 'SIGLA_PROPRIETARIO'
      FixedChar = True
      Size = 2
    end
    object cdsPAparCIDADE_PROPRIETARIO: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'CIDADE_PROPRIETARIO'
      Size = 30
    end
    object cdsPAparBAIRRO_PROPRIETARIO: TStringField
      DisplayLabel = 'Bairro'
      FieldName = 'BAIRRO_PROPRIETARIO'
      Size = 30
    end
    object cdsPAparLOCALIDADE_PROPRIETARIO: TStringField
      DisplayLabel = 'Localidade'
      FieldName = 'LOCALIDADE_PROPRIETARIO'
      Size = 64
    end
    object cdsPAparSETOR_PROPRIETARIO: TStringField
      DisplayLabel = 'Setor'
      FieldName = 'SETOR_PROPRIETARIO'
      Size = 64
    end
  end
  object qrBuscas: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transConsulta
    Left = 32
    Top = 64
  end
  object qrPesquisa: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transConsulta
    Left = 32
    Top = 120
  end
  object qrPesqCol: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transConsulta
    SQL.Strings = (
      'SELECT * FROM COLABORADOR'
      'where ativo = 1')
    Left = 330
    Top = 198
  end
  object dspCol: TDataSetProvider
    DataSet = qrPesqCol
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 327
    Top = 252
  end
  object cdsPCol: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspCol'
    ReadOnly = True
    BeforeOpen = cdsPGrBeforeOpen
    Left = 329
    Top = 309
    object cdsPColCOD_VENDEDOR: TIntegerField
      DisplayLabel = 'Cod Colaborador'
      FieldName = 'COD_VENDEDOR'
      Required = True
    end
    object cdsPColCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
      Visible = False
    end
    object cdsPColCODIGO_UF: TIntegerField
      DisplayLabel = 'Cod UF'
      FieldName = 'CODIGO_UF'
      Required = True
    end
    object cdsPColCOD_FUNCAO: TIntegerField
      DisplayLabel = 'Cod Funcao'
      FieldName = 'COD_FUNCAO'
    end
    object cdsPColNOME_VENDEDOR: TStringField
      Tag = 2
      DisplayLabel = 'Nome Funcionario'
      FieldName = 'NOME_VENDEDOR'
      Size = 35
    end
    object cdsPColEND_VENDEDOR: TStringField
      DisplayLabel = 'Endereco'
      FieldName = 'END_VENDEDOR'
      Size = 35
    end
    object cdsPColBAIRRO_VENDEDOR: TStringField
      DisplayLabel = 'Bairro'
      FieldName = 'BAIRRO_VENDEDOR'
      Size = 35
    end
    object cdsPColCIDADE_VENDEDOR: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'CIDADE_VENDEDOR'
      Size = 35
    end
    object cdsPColCEP_VENDEDOR: TStringField
      DisplayLabel = 'CEP'
      FieldName = 'CEP_VENDEDOR'
      EditMask = '00000\-999;0;'
      FixedChar = True
      Size = 9
    end
    object cdsPColFONE_VENDEDOR: TStringField
      DisplayLabel = 'Fone'
      FieldName = 'FONE_VENDEDOR'
      EditMask = '(99) 9999-9999;0;_'
      FixedChar = True
      Size = 14
    end
    object cdsPColCPF_VENDEDOR: TStringField
      DisplayLabel = 'CPF'
      FieldName = 'CPF_VENDEDOR'
      FixedChar = True
      Size = 11
    end
    object cdsPColPC_VEND_SERV: TFloatField
      DisplayLabel = 'Porc Venda Servico'
      FieldName = 'PC_VEND_SERV'
    end
    object cdsPColPC_VEND_PROD: TFloatField
      DisplayLabel = 'Porc Venda Produto'
      FieldName = 'PC_VEND_PROD'
    end
    object cdsPColOBS_VENDEDOR: TMemoField
      DisplayLabel = 'Observacao'
      FieldName = 'OBS_VENDEDOR'
      OnGetText = cdsPColOBS_VENDEDORGetText
      BlobType = ftMemo
      Size = 8
    end
    object cdsPColDATA_MOD_COL: TDateTimeField
      DisplayLabel = 'Data Modificacao'
      FieldName = 'DATA_MOD_COL'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsPColDATA_CAD_COL: TDateTimeField
      DisplayLabel = 'Data Cadastro'
      FieldName = 'DATA_CAD_COL'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsPColDAT_NASC_COL: TDateTimeField
      DisplayLabel = 'Data Nasc'
      FieldName = 'DAT_NASC_COL'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsPColNOME_ULT_EMP: TStringField
      DisplayLabel = 'Nome Ult Emprego'
      FieldName = 'NOME_ULT_EMP'
      Size = 30
    end
    object cdsPColENDERECO_ULT_EMP: TStringField
      DisplayLabel = 'Endere'#231'o Ult Emprego'
      FieldName = 'ENDERECO_ULT_EMP'
      Size = 30
    end
    object cdsPColFONE_ULT_EMP: TStringField
      DisplayLabel = 'Fone Ult Emprego'
      FieldName = 'FONE_ULT_EMP'
      EditMask = '!\(99\)0000-0000;1;_'
      FixedChar = True
      Size = 14
    end
    object cdsPColCONT_ULT_EMP: TStringField
      DisplayLabel = 'Contato Ult Emprego'
      FieldName = 'CONT_ULT_EMP'
    end
    object cdsPColULT_SAL_EMP: TFloatField
      DisplayLabel = 'Sal'#225'rio Ult Emprego'
      FieldName = 'ULT_SAL_EMP'
      currency = True
    end
    object cdsPColDTENT_ULT_EMP: TDateTimeField
      DisplayLabel = 'Data Entrada Ult Emprego'
      FieldName = 'DTENT_ULT_EMP'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsPColDTSAI_ULT_EMP: TDateTimeField
      DisplayLabel = 'Data Sa'#237'da Ult Emprego'
      FieldName = 'DTSAI_ULT_EMP'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsPColNOME_PLT_EMP: TStringField
      DisplayLabel = 'Nome plt. Emprego'
      FieldName = 'NOME_PLT_EMP'
      Size = 30
    end
    object cdsPColENDERECO_PLT_EMP: TStringField
      DisplayLabel = 'Endere'#231'o plt Emprego'
      FieldName = 'ENDERECO_PLT_EMP'
      Size = 30
    end
    object cdsPColFONE_PLT_EMP: TStringField
      DisplayLabel = 'Fone plt. Emprego'
      FieldName = 'FONE_PLT_EMP'
      EditMask = '!\(99\)0000-0000;1;_'
      FixedChar = True
      Size = 14
    end
    object cdsPColCONT_PLT_EMP: TStringField
      DisplayLabel = 'Contato plt. Emprego'
      FieldName = 'CONT_PLT_EMP'
    end
    object cdsPColPLT_SAL_EMP: TFloatField
      DisplayLabel = 'Sal'#225'rio plt. Emprego'
      FieldName = 'PLT_SAL_EMP'
      currency = True
    end
    object cdsPColDTENT_PLT_EMP: TDateTimeField
      DisplayLabel = 'Data entradao plt. Emprego'
      FieldName = 'DTENT_PLT_EMP'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsPColDTSAI_PLT_EMP: TDateTimeField
      DisplayLabel = 'Data sa'#237'da plt. Emprego'
      FieldName = 'DTSAI_PLT_EMP'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsPColDT_ULT_FERIAS: TDateTimeField
      DisplayLabel = 'Data ult. F'#233'rias'
      FieldName = 'DT_ULT_FERIAS'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsPColTMP_ULT_FERIAS: TIntegerField
      DisplayLabel = 'Tempo ult. f'#233'rias'
      FieldName = 'TMP_ULT_FERIAS'
    end
    object cdsPColVL_ULT_FERIAS: TFloatField
      DisplayLabel = 'Valor ult. F'#233'rias'
      FieldName = 'VL_ULT_FERIAS'
      currency = True
    end
    object cdsPColDTVND_ULT_FERIAS: TDateTimeField
      DisplayLabel = 'Data venda ult. F'#233'rias'
      FieldName = 'DTVND_ULT_FERIAS'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsPColDT_13_SAL: TDateTimeField
      DisplayLabel = 'Data 13'#186' Sal'#225'rio'
      FieldName = 'DT_13_SAL'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsPColVL_13_SAL: TFloatField
      DisplayLabel = 'Valor 13'#186' Sal'#225'rio'
      FieldName = 'VL_13_SAL'
      currency = True
    end
    object cdsPColVL_SAL: TFloatField
      DisplayLabel = 'Valor Sal'#225'rio'
      FieldName = 'VL_SAL'
      currency = True
    end
    object cdsPColCOD_CIDADE: TSmallintField
      Tag = 1
      DisplayLabel = 'Cod Cidade'
      FieldName = 'COD_CIDADE'
    end
    object cdsPColCOD_BAIRRO: TSmallintField
      Tag = 1
      DisplayLabel = 'Cod Bairro'
      FieldName = 'COD_BAIRRO'
    end
    object cdsPColSALARIO_REGISTRO: TFloatField
      DisplayLabel = 'Sal'#225'rio Reg.'
      FieldName = 'SALARIO_REGISTRO'
      currency = True
    end
    object cdsPColVALOR_SALARIO: TFloatField
      DisplayLabel = 'Valor Sal'#225'rio'
      FieldName = 'VALOR_SALARIO'
      currency = True
    end
    object cdsPColQUANT_SAL_FAMILIA: TFloatField
      DisplayLabel = 'Qtd. Sal. Fam'#237'lia'
      FieldName = 'QUANT_SAL_FAMILIA'
    end
    object cdsPColVALOR_SALARIO_FAMILIA: TFloatField
      DisplayLabel = 'Valor sal'#225'rio Fam'#237'lia'
      FieldName = 'VALOR_SALARIO_FAMILIA'
      currency = True
    end
    object cdsPColPERC_PESO: TFloatField
      DisplayLabel = 'Perc. Peso'
      FieldName = 'PERC_PESO'
    end
    object cdsPColATIVO: TIntegerField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
    object cdsPColEMAIL: TStringField
      DisplayLabel = 'E-mail'
      FieldName = 'EMAIL'
      Size = 50
    end
    object cdsPColSITE: TStringField
      DisplayLabel = 'Site'
      FieldName = 'SITE'
      FixedChar = True
      Size = 1
    end
    object cdsPColFONE_CONTATO: TStringField
      DisplayLabel = 'Fone Contato'
      FieldName = 'FONE_CONTATO'
      FixedChar = True
      Size = 40
    end
    object cdsPColCOD_GERENTE: TIntegerField
      DisplayLabel = 'Cod Gerente'
      FieldName = 'COD_GERENTE'
    end
  end
  object SpIncCodigo: TIBStoredProc
    Database = dtmAtivo.bancoHw
    Transaction = transConsulta
    StoredProcName = 'INCREMENTA_CODIGO'
    Left = 32
    Top = 180
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
  object qrPesqVndPerd: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transConsulta
    SQL.Strings = (
      'SELECT * FROM VENDA_PERDIDA '
      'where ativo = 1'
      'ORDER BY GRUPO_PROD, COD_PROD')
    Left = 396
    Top = 198
  end
  object dspVndPerd: TDataSetProvider
    DataSet = qrPesqVndPerd
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 393
    Top = 252
  end
  object cdsPVndPerd: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspVndPerd'
    BeforeOpen = cdsPGrBeforeOpen
    Left = 395
    Top = 309
    object cdsPVndPerdGRUPO_PROD: TIntegerField
      DisplayLabel = 'Grupo Produto'
      FieldName = 'GRUPO_PROD'
      Required = True
    end
    object cdsPVndPerdCOD_PROD: TStringField
      DisplayLabel = 'C'#243'd. Produto'
      FieldName = 'COD_PROD'
      Required = True
      FixedChar = True
      Size = 6
    end
    object cdsPVndPerdCODIGO_VP: TIntegerField
      DisplayLabel = 'C'#243'd. Venda Perdida'
      FieldName = 'CODIGO_VP'
      Required = True
    end
    object cdsPVndPerdDATA_VNP: TDateTimeField
      DisplayLabel = 'Data Venda Perdida'
      FieldName = 'DATA_VNP'
      Required = True
    end
    object cdsPVndPerdCOD_EMPRESA: TIntegerField
      DisplayLabel = 'C'#243'd. Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsPVndPerdCOD_VENDEDOR: TIntegerField
      DisplayLabel = 'C'#243'd. Vendedor'
      FieldName = 'COD_VENDEDOR'
    end
    object cdsPVndPerdQUANT_PROD_VP: TFloatField
      DisplayLabel = 'Quantidade Perdida'
      FieldName = 'QUANT_PROD_VP'
    end
    object cdsPVndPerdATIVO: TIntegerField
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
  end
  object qrPesqTipoVP: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transConsulta
    SQL.Strings = (
      'SELECT * FROM TIPOVP'
      'where ativo = 1')
    Left = 478
    Top = 198
  end
  object dspTipoVP: TDataSetProvider
    DataSet = qrPesqTipoVP
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 475
    Top = 252
  end
  object cdsPTipoVP: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspTipoVP'
    ReadOnly = True
    BeforeOpen = cdsPGrBeforeOpen
    Left = 477
    Top = 309
    object cdsPTipoVPCODIGO_VP: TIntegerField
      DisplayLabel = 'C'#243'd. Venda Perdida'
      FieldName = 'CODIGO_VP'
      Required = True
    end
    object cdsPTipoVPCOD_EMPRESA: TIntegerField
      DisplayLabel = 'C'#243'd. Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsPTipoVPDESCRICAO_VP: TStringField
      DisplayLabel = 'Descri'#231#227'o Venda Perdida'
      FieldName = 'DESCRICAO_VP'
      FixedChar = True
      Size = 25
    end
    object cdsPTipoVPENT_SUG_VP: TStringField
      DisplayLabel = 'Entrar em Sugest'#227'o de Compra?'
      FieldName = 'ENT_SUG_VP'
      FixedChar = True
      Size = 1
    end
    object cdsPTipoVPBX_ENTR_NFE: TStringField
      DisplayLabel = 'Baixa na Entrada de NFE?'
      FieldName = 'BX_ENTR_NFE'
      FixedChar = True
      Size = 1
    end
    object cdsPTipoVPATIVO: TIntegerField
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
  end
  object qrPesqEst: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transConsulta
    SQL.Strings = (
      'select * from ESTADOS')
    Left = 501
    Top = 24
  end
  object dspEst: TDataSetProvider
    DataSet = qrPesqEst
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 498
    Top = 78
  end
  object cdsPEst: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspEst'
    ReadOnly = True
    BeforeOpen = cdsPGrBeforeOpen
    Left = 500
    Top = 135
    object cdsPEstCODIGO_UF: TIntegerField
      DisplayLabel = 'C'#243'digo do Estado'
      FieldName = 'CODIGO_UF'
      Required = True
    end
    object cdsPEstNOME_UF: TStringField
      DisplayLabel = 'Nome do Estado'
      FieldName = 'NOME_UF'
      Size = 30
    end
    object cdsPEstSIGLA_UF: TStringField
      DisplayLabel = 'Sigla'
      FieldName = 'SIGLA_UF'
      FixedChar = True
      Size = 2
    end
    object cdsPEstATIVO: TIntegerField
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
    object cdsPEstIBGE_CODIGO_UF: TIntegerField
      DisplayLabel = 'Cod do Estado no IBGE'
      FieldName = 'IBGE_CODIGO_UF'
    end
  end
  object qrPesqTipoFatumento: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transConsulta
    SQL.Strings = (
      'select * from TIPO_FATURAMENTO where ativo =1')
    Left = 566
    Top = 198
  end
  object dspTipoFaturamento: TDataSetProvider
    DataSet = qrPesqTipoFatumento
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 570
    Top = 252
  end
  object cdsPTipoFaturamento: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspTipoFaturamento'
    ReadOnly = True
    BeforeOpen = cdsPGrBeforeOpen
    Left = 572
    Top = 309
    object cdsPTipoFaturamentoCODIGO_FATURAMENTO: TIntegerField
      DisplayLabel = 'Cod Faturamento'
      FieldName = 'CODIGO_FATURAMENTO'
      Required = True
    end
    object cdsPTipoFaturamentoDESC_FAT: TStringField
      DisplayLabel = 'Descri'#231#227'o do faturamento'
      FieldName = 'DESC_FAT'
      FixedChar = True
      Size = 30
    end
    object cdsPTipoFaturamentoSTATUS_F: TStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS_F'
      FixedChar = True
      Size = 10
    end
    object cdsPTipoFaturamentoATIVO: TIntegerField
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
  end
  object qrPesqMarca: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transConsulta
    SQL.Strings = (
      'select * from  MARCA_PROD where ativo =1')
    Left = 665
    Top = 198
  end
  object dspMarcas: TDataSetProvider
    DataSet = qrPesqMarca
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 669
    Top = 252
  end
  object cdsPMarcas: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspMarcas'
    ReadOnly = True
    BeforeOpen = cdsPGrBeforeOpen
    Left = 671
    Top = 309
    object cdsPMarcasCOD_MARCA: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'COD_MARCA'
      Required = True
    end
    object cdsPMarcasDESCRICAO_MARCA: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO_MARCA'
      FixedChar = True
      Size = 30
    end
    object cdsPMarcasTIPO_MARCA: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO_MARCA'
      FixedChar = True
      Size = 1
    end
    object cdsPMarcasCOD_USUARIO: TIntegerField
      DisplayLabel = 'Cod usu'#225'rio que cadastrou'
      FieldName = 'COD_USUARIO'
    end
    object cdsPMarcasCOD_USUARIO_ALT: TIntegerField
      DisplayLabel = 'Cod Usu'#225'rio que alterou'
      FieldName = 'COD_USUARIO_ALT'
    end
    object cdsPMarcasATIVO: TIntegerField
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
  end
  object qrPesqDsgs: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transConsulta
    SQL.Strings = (
      'select *  from G_DSGS where 1=0')
    Left = 743
    Top = 198
  end
  object dspDsgs: TDataSetProvider
    DataSet = qrPesqDsgs
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 747
    Top = 252
  end
  object cdsPDsgs: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspDsgs'
    ReadOnly = True
    BeforeOpen = cdsPGrBeforeOpen
    Left = 749
    Top = 309
    object cdsPDsgsCOD_DSGS: TStringField
      DisplayLabel = 'Cod DSGS'
      FieldName = 'COD_DSGS'
      Required = True
      FixedChar = True
      Size = 6
    end
    object cdsPDsgsCOD_EMPRESA: TIntegerField
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsPDsgsN_DEPAR: TStringField
      DisplayLabel = 'Departamento'
      FieldName = 'N_DEPAR'
      FixedChar = True
      Size = 15
    end
    object cdsPDsgsN_SECAO: TStringField
      DisplayLabel = 'Se'#231#227'o'
      FieldName = 'N_SECAO'
      FixedChar = True
    end
    object cdsPDsgsN_GRUPO: TStringField
      DisplayLabel = 'Grupo'
      FieldName = 'N_GRUPO'
      FixedChar = True
    end
    object cdsPDsgsS_GRUPO: TStringField
      DisplayLabel = 'SubGrupo'
      FieldName = 'S_GRUPO'
      FixedChar = True
    end
    object cdsPDsgsP_MARGEM: TStringField
      DisplayLabel = 'Percentual de Margem'
      FieldName = 'P_MARGEM'
      FixedChar = True
    end
    object cdsPDsgsATIVO: TIntegerField
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
  end
  object cdsModVeic: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspMV'
    BeforeOpen = cdsPGrBeforeOpen
    Left = 145
    Top = 473
    object cdsModVeicCODIGO: TIntegerField
      DisplayLabel = 'Cod Modelo'
      FieldName = 'CODIGO'
      Required = True
    end
    object cdsModVeicCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsModVeicDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o do modelo'
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object cdsModVeicCILINDRADA: TIntegerField
      DisplayLabel = 'Cilindradas'
      FieldName = 'CILINDRADA'
    end
    object cdsModVeicDESFAB: TStringField
      DisplayLabel = 'Descri'#231#227'o da F'#225'brica'
      FieldName = 'DESFAB'
    end
    object cdsModVeicCODIGOFAB: TStringField
      DisplayLabel = 'Cod da f'#225'brica'
      FieldName = 'CODIGOFAB'
      FixedChar = True
      Size = 10
    end
    object cdsModVeicCILINDROS: TIntegerField
      DisplayLabel = 'Cilindros'
      FieldName = 'CILINDROS'
    end
    object cdsModVeicCOMBUSTIVEL: TStringField
      DisplayLabel = 'Combust'#237'vel'
      FieldName = 'COMBUSTIVEL'
      FixedChar = True
      Size = 8
    end
    object cdsModVeicHP: TFloatField
      FieldName = 'HP'
    end
    object cdsModVeicLOTACAO: TStringField
      DisplayLabel = 'Lota'#231#227'o'
      FieldName = 'LOTACAO'
      FixedChar = True
      Size = 10
    end
    object cdsModVeicTIPO: TStringField
      DisplayLabel = 'Tipo do modelo'
      FieldName = 'TIPO'
      FixedChar = True
      Size = 12
    end
    object cdsModVeicRENAVAM: TStringField
      DisplayLabel = 'Renavam'
      FieldName = 'RENAVAM'
      FixedChar = True
      Size = 9
    end
    object cdsModVeicAFATURAR: TIntegerField
      DisplayLabel = 'A Faturar'
      FieldName = 'AFATURAR'
    end
    object cdsModVeicVNDESTOQUE: TStringField
      DisplayLabel = 'Venda/Estoque Honda'
      FieldName = 'VNDESTOQUE'
      FixedChar = True
      Size = 1
    end
    object cdsModVeicVALTAB: TFloatField
      DisplayLabel = 'Valor de venda'
      FieldName = 'VALTAB'
    end
    object cdsModVeicVLBICMSUB: TFloatField
      FieldName = 'VLBICMSUB'
    end
    object cdsModVeicVLICMSUB: TFloatField
      FieldName = 'VLICMSUB'
    end
    object cdsModVeicANO1: TIntegerField
      FieldName = 'ANO1'
    end
    object cdsModVeicMODELO1: TIntegerField
      FieldName = 'MODELO1'
    end
    object cdsModVeicINICHASSI1: TStringField
      FieldName = 'INICHASSI1'
      Size = 11
    end
    object cdsModVeicANO2: TIntegerField
      FieldName = 'ANO2'
    end
    object cdsModVeicMODELO2: TIntegerField
      FieldName = 'MODELO2'
    end
    object cdsModVeicINICHASSI2: TStringField
      FieldName = 'INICHASSI2'
      Size = 11
    end
    object cdsModVeicORDTIPO: TIntegerField
      FieldName = 'ORDTIPO'
    end
    object cdsModVeicPISCOFINS: TFloatField
      FieldName = 'PISCOFINS'
    end
    object cdsModVeicCOD_FIPE: TStringField
      FieldName = 'COD_FIPE'
      FixedChar = True
      Size = 8
    end
    object cdsModVeicATIVO: TIntegerField
      FieldName = 'ATIVO'
    end
    object cdsModVeicNOME_PLAN: TStringField
      FieldName = 'NOME_PLAN'
      FixedChar = True
      Size = 30
    end
  end
  object dspMV: TDataSetProvider
    DataSet = qrPesqMV
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 143
    Top = 416
  end
  object qrPesqMV: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transConsulta
    SQL.Strings = (
      'SELECT * FROM TIPMODELO')
    Left = 146
    Top = 364
  end
  object dsVendaPerdida: TDataSource
    DataSet = cdsPVndPerd
    Left = 325
    Top = 473
  end
  object dsTipoVendaPerdida: TDataSource
    DataSet = cdsPTipoVP
    Left = 405
    Top = 473
  end
  object CDSPCLO: TDataSource
    DataSet = cdsPCol
    Left = 504
    Top = 473
  end
  object qrUltimasComprasProd: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transConsulta
    SQL.Strings = (
      
        'select nf4.num_nf,it4.prec_cusm_prod,it4.prec_cus_cnt,it4.vl_mul' +
        'tp,it4.prctb_item,'
      
        'it4.prec_vnd_prod,it4.prec_vnd_proda,nf4.data_lanc,it4.quantidad' +
        'e,it4.valor_unitario,'
      
        'it4.aliq_icm,it4.aliq_ipi,it4.qtdemb,fr.nome_cliente,cond.desc_c' +
        'ond_pag,'
      
        'it4.rateio_desconto,it4.pmargfim,it4.pmargfim_a,it4.perc_frete,n' +
        'f4.da,it4.mnf,nf4.codigo_nop,it4.descricao_item'
      'from notafiscal nf4 inner join notafiscal_item it4'
      'on nf4.cod_nf=it4.cod_nf and nf4.cod_empresa=it4.cod_empresa'
      
        'inner join clientes fr on nf4.cod_cliente = fr.cod_cliente and n' +
        'f4.cod_empresa ='
      
        'fr.cod_empresa inner join cond_pag cond on nf4.cod_cond_pag = co' +
        'nd.cod_cond_pag'
      
        'where it4.grupo_prod = :grupo_prod and it4.cod_prod = :cod_prod ' +
        'and'
      
        ' nf4.natureza_nf='#39'E'#39' and (nf4.status = '#39'Fechada'#39') and nf4.tipo_n' +
        'f = '#39'P'#39
      'and nf4.cod_empresa = :codEmpresa and nf4.ativo=1')
    Left = 590
    Top = 366
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'GRUPO_PROD'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'COD_PROD'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'codEmpresa'
        ParamType = ptUnknown
      end>
    object qrUltimasComprasProdNUM_NF: TIntegerField
      DisplayLabel = 'Num. NF'
      FieldName = 'NUM_NF'
      Origin = '"NOTAFISCAL"."NUM_NF"'
      Required = True
    end
    object qrUltimasComprasProdPREC_CUSM_PROD: TFloatField
      DisplayLabel = 'Custo M'#233'dio Apurado'
      FieldName = 'PREC_CUSM_PROD'
      Origin = '"NOTAFISCAL_ITEM"."PREC_CUSM_PROD"'
      currency = True
    end
    object qrUltimasComprasProdPREC_CUS_CNT: TFloatField
      DisplayLabel = 'Custo desta NF Apurado'
      FieldName = 'PREC_CUS_CNT'
      Origin = '"NOTAFISCAL_ITEM"."PREC_CUS_CNT"'
      currency = True
    end
    object qrUltimasComprasProdPREC_VND_PROD: TFloatField
      DisplayLabel = 'Pre'#231'o de Venda Apurado'
      FieldName = 'PREC_VND_PROD'
      Origin = '"NOTAFISCAL_ITEM"."PREC_VND_PROD"'
      currency = True
    end
    object qrUltimasComprasProdPREC_VND_PRODA: TFloatField
      DisplayLabel = 'Pre'#231'o de Venda Atacado Apurado'
      FieldName = 'PREC_VND_PRODA'
      Origin = '"NOTAFISCAL_ITEM"."PREC_VND_PRODA"'
      currency = True
    end
    object qrUltimasComprasProdQUANTIDADE: TFloatField
      DisplayLabel = 'Qtde'
      FieldName = 'QUANTIDADE'
      Origin = '"NOTAFISCAL_ITEM"."QUANTIDADE"'
      DisplayFormat = '#0.0000'
    end
    object qrUltimasComprasProdVALOR_UNITARIO: TFloatField
      DisplayLabel = 'Valor Unit'#225'rio NF'
      FieldName = 'VALOR_UNITARIO'
      Origin = '"NOTAFISCAL_ITEM"."VALOR_UNITARIO"'
      currency = True
    end
    object qrUltimasComprasProdDATA_LANC: TDateTimeField
      DisplayLabel = 'Data Entrada'
      FieldName = 'DATA_LANC'
      Origin = '"NOTAFISCAL"."DATA_LANC"'
    end
    object qrUltimasComprasProdPRCTB_ITEM: TFloatField
      DisplayLabel = 'Markup Sugerido para Pre'#231'o de Venda'
      FieldName = 'PRCTB_ITEM'
      Origin = '"NOTAFISCAL_ITEM"."PRCTB_ITEM"'
      DisplayFormat = '#0.00'
    end
    object qrUltimasComprasProdPMARGFIM: TFloatField
      DisplayLabel = 'Markup Utilizado para Pre'#231'o de Venda'
      FieldName = 'PMARGFIM'
      Origin = '"NOTAFISCAL_ITEM"."PMARGFIM"'
      DisplayFormat = '#0.00'
    end
    object qrUltimasComprasProdPMARGFIM_A: TFloatField
      DisplayLabel = 'Markup Utilizado para Pre'#231'o Atacado'
      FieldName = 'PMARGFIM_A'
      Origin = '"NOTAFISCAL_ITEM"."PMARGFIM_A"'
      DisplayFormat = '#0.00'
    end
    object qrUltimasComprasProdALIQ_ICM: TFloatField
      DisplayLabel = '% ICMS'
      FieldName = 'ALIQ_ICM'
      Origin = '"NOTAFISCAL_ITEM"."ALIQ_ICM"'
      DisplayFormat = '#0.00'
    end
    object qrUltimasComprasProdALIQ_IPI: TFloatField
      DisplayLabel = '% IPI'
      FieldName = 'ALIQ_IPI'
      Origin = '"NOTAFISCAL_ITEM"."ALIQ_IPI"'
      DisplayFormat = '#0.00'
    end
    object qrUltimasComprasProdNOME_CLIENTE: TIBStringField
      DisplayLabel = 'Fornecedor'
      FieldName = 'NOME_CLIENTE'
      Origin = '"CLIENTES"."NOME_CLIENTE"'
      Required = True
      FixedChar = True
      Size = 35
    end
    object qrUltimasComprasProdQTDEMB: TFloatField
      DisplayLabel = 'Qtde Embalagem'
      FieldName = 'QTDEMB'
      Origin = '"NOTAFISCAL_ITEM"."QTDEMB"'
    end
    object qrUltimasComprasProdDESC_COND_PAG: TIBStringField
      DisplayLabel = 'Cond. Pagamento'
      FieldName = 'DESC_COND_PAG'
      Origin = '"COND_PAG"."DESC_COND_PAG"'
      Size = 30
    end
    object qrUltimasComprasProdRATEIO_DESCONTO: TFloatField
      DisplayLabel = 'Rateio Desconto para este Item'
      FieldName = 'RATEIO_DESCONTO'
      Origin = '"NOTAFISCAL_ITEM"."RATEIO_DESCONTO"'
    end
    object qrUltimasComprasProdPERC_FRETE: TFloatField
      DisplayLabel = '% Frete'
      FieldName = 'PERC_FRETE'
      Origin = '"NOTAFISCAL_ITEM"."PERC_FRETE"'
      DisplayFormat = '#0.00'
    end
    object qrUltimasComprasProdDA: TIBStringField
      FieldName = 'DA'
      Origin = '"NOTAFISCAL"."DA"'
      FixedChar = True
      Size = 1
    end
    object qrUltimasComprasProdMNF: TIBStringField
      FieldName = 'MNF'
      Origin = '"NOTAFISCAL_ITEM"."MNF"'
      FixedChar = True
      Size = 1
    end
    object qrUltimasComprasProdCODIGO_NOP: TFloatField
      DisplayLabel = 'Natureza de Opera'#231#227'o'
      FieldName = 'CODIGO_NOP'
      Origin = '"NOTAFISCAL"."CODIGO_NOP"'
    end
    object qrUltimasComprasProdVL_MULTP: TFloatField
      DisplayLabel = 'Multiplicador Utilizado para Custo Real'
      FieldName = 'VL_MULTP'
      Origin = '"NOTAFISCAL_ITEM"."VL_MULTP"'
    end
    object qrUltimasComprasProdDESCRICAO_ITEM: TIBStringField
      DisplayLabel = 'Descri'#231#227'o do Produto'
      FieldName = 'DESCRICAO_ITEM'
      Origin = '"NOTAFISCAL_ITEM"."DESCRICAO_ITEM"'
      Size = 60
    end
  end
  object dsUltimasComprasProd: TDataSource
    DataSet = qrUltimasComprasProd
    Left = 589
    Top = 425
  end
  object qrUltimoBalancoProd: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transConsulta
    SQL.Strings = (
      'select GRUPO_PROD,COD_PROD,NUM_FAB_PROD,QUANT_EST,'
      
        '    DATA_CADASTRO,DATA_CONFIRM,LOCACAO_PROD,LOCACAO_PROD_1,QUANT' +
        '_TRANS,QUANT_REQ,TIP_BAL,QTD_DIF_BAL'
      '     from estoque_ini where grupo_prod = :GRUPO_PROD'
      '     and cod_prod = :COD_PROD'
      '     and (not data_confirm is null)'
      '     and COD_EMPRESA = :codEmpresa  and ativo=1'
      '     order by data_confirm')
    Left = 622
    Top = 694
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'GRUPO_PROD'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'COD_PROD'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'codEmpresa'
        ParamType = ptUnknown
      end>
    object qrUltimoBalancoProdGRUPO_PROD: TIntegerField
      DisplayLabel = 'Grupo Produto'
      FieldName = 'GRUPO_PROD'
      Origin = '"ESTOQUE_INI"."GRUPO_PROD"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrUltimoBalancoProdCOD_PROD: TIBStringField
      DisplayLabel = 'Cod Produto'
      FieldName = 'COD_PROD'
      Origin = '"ESTOQUE_INI"."COD_PROD"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 6
    end
    object qrUltimoBalancoProdNUM_FAB_PROD: TIBStringField
      DisplayLabel = 'Num. de Fabrica'#231#227'o'
      FieldName = 'NUM_FAB_PROD'
      Origin = '"ESTOQUE_INI"."NUM_FAB_PROD"'
      FixedChar = True
    end
    object qrUltimoBalancoProdQUANT_EST: TFloatField
      DisplayLabel = 'Quantidade Contada'
      FieldName = 'QUANT_EST'
      Origin = '"ESTOQUE_INI"."QUANT_EST"'
      DisplayFormat = '##0.000'
    end
    object qrUltimoBalancoProdDATA_CADASTRO: TDateTimeField
      DisplayLabel = 'Data de Cadastro'
      FieldName = 'DATA_CADASTRO'
      Origin = '"ESTOQUE_INI"."DATA_CADASTRO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrUltimoBalancoProdDATA_CONFIRM: TDateTimeField
      DisplayLabel = 'Data Confirma'#231#227'o Balan'#231'o'
      FieldName = 'DATA_CONFIRM'
      Origin = '"ESTOQUE_INI"."DATA_CONFIRM"'
    end
    object qrUltimoBalancoProdLOCACAO_PROD: TIBStringField
      DisplayLabel = 'Loca'#231#227'o'
      FieldName = 'LOCACAO_PROD'
      Origin = '"ESTOQUE_INI"."LOCACAO_PROD"'
      FixedChar = True
      Size = 8
    end
    object qrUltimoBalancoProdLOCACAO_PROD_1: TIBStringField
      DisplayLabel = 'Loca'#231#227'o 1'
      FieldName = 'LOCACAO_PROD_1'
      Origin = '"ESTOQUE_INI"."LOCACAO_PROD_1"'
      FixedChar = True
      Size = 8
    end
    object qrUltimoBalancoProdQUANT_TRANS: TFloatField
      DisplayLabel = 'Quantidade Transferida'
      FieldName = 'QUANT_TRANS'
      Origin = '"ESTOQUE_INI"."QUANT_TRANS"'
      DisplayFormat = '##0.000'
    end
    object qrUltimoBalancoProdQUANT_REQ: TFloatField
      DisplayLabel = 'Quantidade em Requisi'#231#227'o'
      FieldName = 'QUANT_REQ'
      Origin = '"ESTOQUE_INI"."QUANT_REQ"'
      DisplayFormat = '##0.000'
    end
    object qrUltimoBalancoProdTIP_BAL: TIBStringField
      DisplayLabel = 'Tipo Balan'#231'o'
      FieldName = 'TIP_BAL'
      Origin = '"ESTOQUE_INI"."TIP_BAL"'
      FixedChar = True
      Size = 1
    end
    object qrUltimoBalancoProdQTD_DIF_BAL: TFloatField
      DisplayLabel = 'Quantidade Diferente'
      FieldName = 'QTD_DIF_BAL'
      Origin = '"ESTOQUE_INI"."QTD_DIF_BAL"'
      DisplayFormat = '##0.000'
    end
  end
  object dsUltimoBalancoProd: TDataSource
    DataSet = qrUltimoBalancoProd
    Left = 621
    Top = 761
  end
  object qrPesqClConv: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transConsulta
    SQL.Strings = (
      'select * from CLIENTES')
    Left = 840
    Top = 26
  end
  object dspPesqClConv: TDataSetProvider
    DataSet = qrPesqClConv
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 840
    Top = 82
  end
  object cdsPesqClConv: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspPesqClConv'
    ReadOnly = True
    BeforeOpen = cdsPGrBeforeOpen
    Left = 840
    Top = 138
    object cdsPesqClConvCOD_CLIENTE: TIntegerField
      Tag = 2
      DisplayLabel = 'Codigo'
      FieldName = 'COD_CLIENTE'
      Required = True
    end
    object cdsPesqClConvNOME_CLIENTE: TStringField
      Tag = 2
      DisplayLabel = 'Nome'
      FieldName = 'NOME_CLIENTE'
      Required = True
      Size = 35
    end
    object cdsPesqClConvFONE_CLIENTE: TStringField
      DisplayLabel = 'Telefone'
      FieldName = 'FONE_CLIENTE'
      EditMask = '(99) 9999-9999;0;_'
      FixedChar = True
      Size = 13
    end
    object cdsPesqClConvCPFCGC: TStringField
      DisplayLabel = 'CPF/CNPJ'
      FieldName = 'CPFCGC'
      Size = 18
    end
    object cdsPesqClConvENDERECO: TStringField
      DisplayLabel = 'Endere'#231'o'
      FieldName = 'ENDERECO'
      Required = True
      Size = 50
    end
    object cdsPesqClConvCIDADE: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'CIDADE'
      Required = True
      Size = 30
    end
    object cdsPesqClConvBAIRRO: TStringField
      DisplayLabel = 'Bairro'
      FieldName = 'BAIRRO'
      Required = True
      Size = 35
    end
    object cdsPesqClConvCEP: TStringField
      FieldName = 'CEP'
      Required = True
      FixedChar = True
      Size = 9
    end
    object cdsPesqClConvNATURALID: TStringField
      DisplayLabel = 'Naturalidade'
      FieldName = 'NATURALID'
      Required = True
    end
    object cdsPesqClConvRAZAO: TStringField
      DisplayLabel = 'Raz'#227'o'
      FieldName = 'RAZAO'
      Required = True
      Size = 60
    end
    object cdsPesqClConvINSC_EST: TStringField
      DisplayLabel = 'Insc Estadual'
      FieldName = 'INSC_EST'
      Size = 18
    end
    object cdsPesqClConvRG: TStringField
      DisplayLabel = 'Identidade'
      FieldName = 'RG'
      FixedChar = True
      Size = 10
    end
    object cdsPesqClConvEXPEDIC: TDateTimeField
      DisplayLabel = 'Data Exp Ident'
      FieldName = 'EXPEDIC'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsPesqClConvORG_EXPEDIC: TStringField
      DisplayLabel = 'Org Exp Ident'
      FieldName = 'ORG_EXPEDIC'
    end
    object cdsPesqClConvCTPS: TStringField
      DisplayLabel = 'Cart Trabalho'
      FieldName = 'CTPS'
      FixedChar = True
      Size = 10
    end
    object cdsPesqClConvFAX: TStringField
      DisplayLabel = 'Fax'
      FieldName = 'FAX'
      EditMask = '(99) 9999-9999;0;_'
      FixedChar = True
      Size = 14
    end
    object cdsPesqClConvCIDA_COBRANCA: TStringField
      DisplayLabel = 'Cidade Cob'
      FieldName = 'CIDA_COBRANCA'
      Size = 30
    end
    object cdsPesqClConvCEP_COBRANCA: TStringField
      DisplayLabel = 'CEP Cob'
      FieldName = 'CEP_COBRANCA'
      FixedChar = True
      Size = 9
    end
    object cdsPesqClConvDATA_CADASTRO: TDateTimeField
      DisplayLabel = 'Data Cadastro'
      FieldName = 'DATA_CADASTRO'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsPesqClConvLIMITE_CREDITO: TFloatField
      DisplayLabel = 'Limite de Cr'#233'dito'
      FieldName = 'LIMITE_CREDITO'
      currency = True
    end
    object cdsPesqClConvCONTATO: TStringField
      DisplayLabel = 'Contato'
      FieldName = 'CONTATO'
      Size = 10
    end
    object cdsPesqClConvSEXO: TStringField
      DisplayLabel = 'Sexo'
      FieldName = 'SEXO'
      FixedChar = True
      Size = 1
    end
    object cdsPesqClConvCONJUGE: TStringField
      DisplayLabel = 'C'#244'njuge'
      FieldName = 'CONJUGE'
      Size = 35
    end
    object cdsPesqClConvLOC_TRAB: TStringField
      DisplayLabel = 'Local Trabalho'
      FieldName = 'LOC_TRAB'
      Size = 30
    end
    object cdsPesqClConvEND_TRAB: TStringField
      DisplayLabel = 'Endere'#231'o Trab'
      FieldName = 'END_TRAB'
      Size = 35
    end
    object cdsPesqClConvFONE_TRAB: TStringField
      DisplayLabel = 'Fone Trab'
      FieldName = 'FONE_TRAB'
      EditMask = '!\(99\)9000-0000;0;_'
      FixedChar = True
      Size = 14
    end
    object cdsPesqClConvCARGO: TStringField
      DisplayLabel = 'Cargo'
      FieldName = 'CARGO'
      Size = 15
    end
    object cdsPesqClConvSPCL: TDateTimeField
      DisplayLabel = 'Data Nada consta SPC Local'
      FieldName = 'SPCL'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsPesqClConvSPCEST: TDateTimeField
      DisplayLabel = 'Data Nada consta SPC Nacional'
      FieldName = 'SPCEST'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsPesqClConvEND_COBRANCA: TStringField
      DisplayLabel = 'Endere'#231'o Cob'
      FieldName = 'END_COBRANCA'
      Size = 50
    end
    object cdsPesqClConvBAIRRO_COBRANCA: TStringField
      DisplayLabel = 'Bairro Cob'
      FieldName = 'BAIRRO_COBRANCA'
      Size = 35
    end
    object cdsPesqClConvPAI: TStringField
      DisplayLabel = 'Pai'
      FieldName = 'PAI'
      Size = 35
    end
    object cdsPesqClConvMAE: TStringField
      DisplayLabel = 'M'#227'e'
      FieldName = 'MAE'
      Size = 35
    end
    object cdsPesqClConvDATA_NASC: TDateTimeField
      DisplayLabel = 'Data Nascimento'
      FieldName = 'DATA_NASC'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsPesqClConvEMAIL: TStringField
      DisplayLabel = 'e-mail'
      FieldName = 'EMAIL'
      Size = 50
    end
    object cdsPesqClConvCONVENIADO: TStringField
      DisplayLabel = 'Conveniado'
      FieldName = 'CONVENIADO'
      FixedChar = True
      Size = 1
    end
    object cdsPesqClConvDIA_VENC: TIntegerField
      DisplayLabel = 'Dia base de Vencimento'
      FieldName = 'DIA_VENC'
    end
    object cdsPesqClConvTIPOCLIENTE: TStringField
      DisplayLabel = 'Tipo Cliente'
      FieldName = 'TIPOCLIENTE'
      FixedChar = True
      Size = 6
    end
    object cdsPesqClConvDATA_ULT_COMPRA: TDateTimeField
      DisplayLabel = 'Data Ultima Compra'
      FieldName = 'DATA_ULT_COMPRA'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsPesqClConvNEC_ACOMP: TStringField
      DisplayLabel = 'Nec Acompanhamento'
      FieldName = 'NEC_ACOMP'
      FixedChar = True
      Size = 1
    end
    object cdsPesqClConvRAMO_ATIVIDADE: TStringField
      DisplayLabel = 'Ramo Atividade'
      FieldName = 'RAMO_ATIVIDADE'
      Size = 60
    end
    object cdsPesqClConvESTADO_CIVIL: TStringField
      DisplayLabel = 'Estado Civil'
      FieldName = 'ESTADO_CIVIL'
      Size = 32
    end
    object cdsPesqClConvTIPVCLIENTE: TStringField
      DisplayLabel = 'Tipo Venda'
      FieldName = 'TIPVCLIENTE'
      FixedChar = True
      Size = 1
    end
    object cdsPesqClConvCOD_CONVENIO: TIntegerField
      DisplayLabel = 'Conv'#234'nio'
      FieldName = 'COD_CONVENIO'
    end
    object cdsPesqClConvCODIGO_UF: TIntegerField
      DisplayLabel = 'Codigo Estado'
      FieldName = 'CODIGO_UF'
      Required = True
    end
    object cdsPesqClConvCODIGO_FATURAMENTO: TIntegerField
      DisplayLabel = 'Cod Faturamento'
      FieldName = 'CODIGO_FATURAMENTO'
    end
    object cdsPesqClConvATIVO: TIntegerField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
      Visible = False
    end
    object cdsPesqClConvCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
      Visible = False
    end
    object cdsPesqClConvOBSERVACAO: TStringField
      DisplayLabel = 'Observacao Geral'
      FieldName = 'OBSERVACAO'
      Size = 200
    end
    object cdsPesqClConvOBS_DIV: TMemoField
      DisplayLabel = 'Observacao SPC'
      FieldName = 'OBS_DIV'
      BlobType = ftMemo
      Size = 8
    end
    object cdsPesqClConvOBS_REQ_OS: TStringField
      DisplayLabel = 'Observacao REQ OS'
      FieldName = 'OBS_REQ_OS'
      Size = 130
    end
    object cdsPesqClConvID_COMMERCE: TLargeintField
      DisplayLabel = 'Id Ecommerce'
      FieldName = 'ID_COMMERCE'
    end
  end
  object qrPesqCidIBGE: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transConsulta
    SQL.Strings = (
      'select *  from CIDADES_IBGE')
    Left = 416
    Top = 24
  end
  object dspCidIBGE: TDataSetProvider
    DataSet = qrPesqCidIBGE
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 416
    Top = 80
  end
  object cdsPCidIBGE: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspCidIBGE'
    ReadOnly = True
    BeforeOpen = cdsPGrBeforeOpen
    Left = 416
    Top = 136
    object cdsPCidIBGECODIGO_UF_IBGE: TIntegerField
      DisplayLabel = 'Cod UF no IBGE'
      FieldName = 'CODIGO_UF_IBGE'
      Required = True
    end
    object cdsPCidIBGENOME_UF: TStringField
      DisplayLabel = 'Nome do Estado no IBGE'
      FieldName = 'NOME_UF'
      Size = 50
    end
    object cdsPCidIBGECODIGO_MUN_IBGE: TIntegerField
      DisplayLabel = 'Cod Munic'#237'pio no IBGE'
      FieldName = 'CODIGO_MUN_IBGE'
      Required = True
    end
    object cdsPCidIBGENOME_MUNICIPIO: TStringField
      DisplayLabel = 'Nome do Munic'#237'pio no IBGE'
      FieldName = 'NOME_MUNICIPIO'
      Size = 50
    end
    object cdsPCidIBGEATIVO: TIntegerField
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
  end
  object qrPesqKits: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transConsulta
    SQL.Strings = (
      'select * from kits_prod where 1=0')
    Left = 799
    Top = 198
  end
  object dspKits: TDataSetProvider
    DataSet = qrPesqKits
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 802
    Top = 254
  end
  object cdsPKits: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspKits'
    BeforeOpen = cdsPGrBeforeOpen
    Left = 802
    Top = 309
    object cdsPKitsCODIGO_KIT: TIntegerField
      DisplayLabel = 'C'#243'digo do Kit'
      FieldName = 'CODIGO_KIT'
      Required = True
    end
    object cdsPKitsCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsPKitsDESCRICAO_KIT: TStringField
      DisplayLabel = 'Descri'#231#227'o do Kit'
      FieldName = 'DESCRICAO_KIT'
      FixedChar = True
      Size = 40
    end
    object cdsPKitsKIT_TODO: TStringField
      DisplayLabel = 'Kit Completo'
      FieldName = 'KIT_TODO'
      FixedChar = True
      Size = 1
    end
    object cdsPKitsATIVO: TIntegerField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
  end
  object qrPesqTipoServ: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transConsulta
    SQL.Strings = (
      'SELECT * FROM TIPO_SERVICO '
      'where ativo=1')
    Left = 867
    Top = 200
  end
  object dspTipoServ: TDataSetProvider
    DataSet = qrPesqTipoServ
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 867
    Top = 247
  end
  object cdsPTipoServ: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspTipoServ'
    BeforeOpen = cdsPGrBeforeOpen
    Left = 867
    Top = 304
    object cdsPTipoServCOD_SERVICO: TIntegerField
      DisplayLabel = 'Cod Servi'#231'o'
      FieldName = 'COD_SERVICO'
      Required = True
    end
    object cdsPTipoServDESC_SERVICO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESC_SERVICO'
      FixedChar = True
      Size = 60
    end
    object cdsPTipoServVALOR_SERVICO: TFloatField
      DisplayLabel = 'Valor do Servi'#231'o'
      FieldName = 'VALOR_SERVICO'
    end
    object cdsPTipoServSHONDA: TStringField
      DisplayLabel = 'M'#227'o de obra Honda'
      FieldName = 'SHONDA'
      FixedChar = True
      Size = 1
    end
    object cdsPTipoServALTCOD: TStringField
      DisplayLabel = 'Altera Desc ou valor no Cupom'
      FieldName = 'ALTCOD'
      FixedChar = True
      Size = 1
    end
    object cdsPTipoServDATA_CAD_TIPO: TDateTimeField
      DisplayLabel = 'Data Cadastro'
      FieldName = 'DATA_CAD_TIPO'
    end
    object cdsPTipoServDATA_MOD_TIPO: TDateTimeField
      DisplayLabel = 'Data Altera'#231#227'o'
      FieldName = 'DATA_MOD_TIPO'
    end
    object cdsPTipoServSTIPO: TStringField
      DisplayLabel = 'Tipo de servi'#231'o'
      FieldName = 'STIPO'
      FixedChar = True
      Size = 1
    end
    object cdsPTipoServTMO: TFloatField
      FieldName = 'TMO'
    end
    object cdsPTipoServALIQ_ISS: TFloatField
      DisplayLabel = 'Al'#237'quota de ISS'
      FieldName = 'ALIQ_ISS'
    end
    object cdsPTipoServATIVO: TIntegerField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
    object cdsPTipoServCOD_ESPE_SEG: TIntegerField
      DisplayLabel = 'Cod Esp'#233'cie Segmenta'#231#227'o Serv.'
      FieldName = 'COD_ESPE_SEG'
    end
    object cdsPTipoServCODIGO_NOP: TFloatField
      DisplayLabel = 'CFOP'
      FieldName = 'CODIGO_NOP'
    end
    object cdsPTipoServTMOSERVSIMULT: TStringField
      DisplayLabel = 'TMO Simult'#226'neo'
      FieldName = 'TMOSERVSIMULT'
      FixedChar = True
      Size = 1
    end
    object cdsPTipoServALT_DESC: TStringField
      DisplayLabel = 'Altera Descri'#231#227'o'
      FieldName = 'ALT_DESC'
      FixedChar = True
      Size = 1
    end
    object cdsPTipoServSERV_PROP_TERC: TStringField
      DisplayLabel = 'Servi'#231'o ou Produto de Terceiro'
      FieldName = 'SERV_PROP_TERC'
      FixedChar = True
      Size = 1
    end
    object cdsPTipoServISENTO_SERV: TStringField
      DisplayLabel = 'Servi'#231'o Isento'
      FieldName = 'ISENTO_SERV'
      FixedChar = True
      Size = 1
    end
    object cdsPTipoServN_INCIDENCIA_SERV: TStringField
      DisplayLabel = 'N'#227'o Incid'#234'ncia no Servi'#231'o'
      FieldName = 'N_INCIDENCIA_SERV'
      FixedChar = True
      Size = 1
    end
    object cdsPTipoServARREDONDAR_TRUNCAR: TStringField
      DisplayLabel = 'Arredondar ou Truncar'
      FieldName = 'ARREDONDAR_TRUNCAR'
      FixedChar = True
      Size = 1
    end
    object cdsPTipoServCLASSE_SERV: TStringField
      DisplayLabel = 'Classe do Servi'#231'o'
      FieldName = 'CLASSE_SERV'
      FixedChar = True
      Size = 1
    end
    object cdsPTipoServCLASSE_QTD: TStringField
      DisplayLabel = 'Volume da demanda'
      FieldName = 'CLASSE_QTD'
      FixedChar = True
      Size = 2
    end
    object cdsPTipoServCLASSE_POP: TStringField
      DisplayLabel = 'Popularidade'
      FieldName = 'CLASSE_POP'
      FixedChar = True
      Size = 2
    end
    object cdsPTipoServCLASSE_ATL: TStringField
      DisplayLabel = 'Atualidade'
      FieldName = 'CLASSE_ATL'
      FixedChar = True
      Size = 2
    end
    object cdsPTipoServDMD: TFloatField
      DisplayLabel = 'Demanda M'#233'dia Di'#225'ria'
      FieldName = 'DMD'
      DisplayFormat = '##0.0000'
    end
  end
  object qrPesqPerfilP: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transConsulta
    SQL.Strings = (
      'SELECT * FROM Perfil_Produtos'
      'where  ativo = 1'
      '')
    Left = 209
    Top = 362
  end
  object dspPerfilP: TDataSetProvider
    DataSet = qrPesqPerfilP
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 209
    Top = 413
  end
  object cdsPerfilP: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspPerfilP'
    BeforeOpen = cdsPGrBeforeOpen
    Left = 209
    Top = 472
    object cdsPerfilPCOD_PERFIL: TIntegerField
      DisplayLabel = 'Cod Perfil'
      FieldName = 'COD_PERFIL'
      Required = True
    end
    object cdsPerfilPCOD_EMPRESA: TIntegerField
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsPerfilPCODIGO_NOP: TFloatField
      DisplayLabel = 'Cod Natureza Opera'#231#227'o'
      FieldName = 'CODIGO_NOP'
    end
    object cdsPerfilPSUB_G_PROD: TIntegerField
      DisplayLabel = 'Cod Sub Grupo Produto'
      FieldName = 'SUB_G_PROD'
    end
    object cdsPerfilPLOCACAO_PROD: TStringField
      DisplayLabel = 'Loca'#231#227'o do Produto'
      FieldName = 'LOCACAO_PROD'
      EditMask = '99-L-999;0;_'
      FixedChar = True
      Size = 8
    end
    object cdsPerfilPLOCACAO_PROD_1: TStringField
      DisplayLabel = 'Loca'#231#227'o do Produto 1'
      FieldName = 'LOCACAO_PROD_1'
      EditMask = '99-L-999;0;_'
      FixedChar = True
      Size = 8
    end
    object cdsPerfilPDESCR_PROD: TStringField
      DisplayLabel = 'Descri'#231#227'o do Produto'
      FieldName = 'DESCR_PROD'
      FixedChar = True
      Size = 75
    end
    object cdsPerfilPIPI_PROD: TFloatField
      DisplayLabel = 'IPI do Produto'
      FieldName = 'IPI_PROD'
      DisplayFormat = '##0.00'
    end
    object cdsPerfilPICM_PROD: TFloatField
      DisplayLabel = 'ICMS do Produto'
      FieldName = 'ICM_PROD'
      DisplayFormat = '##0.00'
    end
    object cdsPerfilPPERC_TB_PROD: TFloatField
      DisplayLabel = 'Percentual Tabela Produto'
      FieldName = 'PERC_TB_PROD'
      DisplayFormat = '##0.00'
    end
    object cdsPerfilPMARCA_P: TStringField
      DisplayLabel = 'Marca do Produto'
      FieldName = 'MARCA_P'
      FixedChar = True
      Size = 10
    end
    object cdsPerfilPALT_COD_CUPOM: TStringField
      DisplayLabel = 'Codigo Cupom'
      FieldName = 'ALT_COD_CUPOM'
      FixedChar = True
      Size = 1
    end
    object cdsPerfilPPERC_RED_PROD: TFloatField
      DisplayLabel = 'Percentual Redu'#231#227'o Produto'
      FieldName = 'PERC_RED_PROD'
      DisplayFormat = '##0.00'
    end
    object cdsPerfilPCOMISSAO_PROD: TFloatField
      DisplayLabel = 'Comiss'#227'o Produto'
      FieldName = 'COMISSAO_PROD'
    end
    object cdsPerfilPISENTO_PROD: TStringField
      DisplayLabel = 'Produto Isento'
      FieldName = 'ISENTO_PROD'
      FixedChar = True
      Size = 1
    end
    object cdsPerfilPN_INCIDENCIA_PROD: TStringField
      DisplayLabel = 'N'#227'o Incid'#234'ncia Produto'
      FieldName = 'N_INCIDENCIA_PROD'
      FixedChar = True
      Size = 1
    end
    object cdsPerfilPUNIDADE: TStringField
      DisplayLabel = 'Unidade'
      FieldName = 'UNIDADE'
      Size = 3
    end
    object cdsPerfilPPERC_TB_PROD3: TFloatField
      DisplayLabel = 'Percentual Tabela Produto 30 dias'
      FieldName = 'PERC_TB_PROD3'
      DisplayFormat = '##0.00'
    end
    object cdsPerfilPPERC_TB_PROD6: TFloatField
      DisplayLabel = 'Percentual Tabela Produto 60 dias'
      FieldName = 'PERC_TB_PROD6'
      DisplayFormat = '##0.00'
    end
    object cdsPerfilPPERC_TB_PROD9: TFloatField
      DisplayLabel = 'Percentual Tabela Produto 90 dias'
      FieldName = 'PERC_TB_PROD9'
      DisplayFormat = '##0.00'
    end
    object cdsPerfilPALT_DESC_CUPOM: TStringField
      DisplayLabel = 'Altera Descri'#231#227'o Cupom'
      FieldName = 'ALT_DESC_CUPOM'
      FixedChar = True
      Size = 1
    end
    object cdsPerfilPCST_PROD: TStringField
      DisplayLabel = 'CST Produto'
      FieldName = 'CST_PROD'
      FixedChar = True
      Size = 3
    end
    object cdsPerfilPCOD_PPS: TStringField
      DisplayLabel = 'Codigo PPS'
      FieldName = 'COD_PPS'
      FixedChar = True
      Size = 2
    end
    object cdsPerfilPCOD_DSGS: TStringField
      DisplayLabel = 'Codigo DSGS'
      FieldName = 'COD_DSGS'
      EditMask = '0.00.0.00;0;_'
      FixedChar = True
      Size = 6
    end
    object cdsPerfilPISENTO_PIS: TStringField
      DisplayLabel = 'Isento PIS/CONFINS'
      FieldName = 'ISENTO_PIS'
      FixedChar = True
      Size = 1
    end
    object cdsPerfilPEMB_PROD: TStringField
      DisplayLabel = 'Embalagem Produto'
      FieldName = 'EMB_PROD'
      FixedChar = True
      Size = 10
    end
    object cdsPerfilPPERC_SUBSTTR: TFloatField
      DisplayLabel = 'Percentual Substitui'#231#227'o Tribut'#225'ria'
      FieldName = 'PERC_SUBSTTR'
      DisplayFormat = '##0.00'
    end
    object cdsPerfilPQTDEMB: TFloatField
      DisplayLabel = 'Quantidade Embalagem'
      FieldName = 'QTDEMB'
    end
    object cdsPerfilPBALANCA_PROD: TStringField
      DisplayLabel = 'Balan'#231'a Produto'
      FieldName = 'BALANCA_PROD'
      FixedChar = True
      Size = 1
    end
    object cdsPerfilPVALIDADE_PROD: TStringField
      DisplayLabel = 'Validade Produto'
      FieldName = 'VALIDADE_PROD'
      FixedChar = True
      Size = 2
    end
    object cdsPerfilPESTSUBSTR: TStringField
      DisplayLabel = 'Estados Substitui'#231#227'o Tribut'#225'ria'
      FieldName = 'ESTSUBSTR'
      FixedChar = True
      Size = 80
    end
    object cdsPerfilPCOMISSAO_PROD_GER: TFloatField
      DisplayLabel = 'Comiss'#227'o Produto Gerente'
      FieldName = 'COMISSAO_PROD_GER'
      DisplayFormat = '##0.00'
    end
    object cdsPerfilPALIQ_RED_PROD: TFloatField
      DisplayLabel = 'Al'#237'quota Redu'#231#227'o Produto'
      FieldName = 'ALIQ_RED_PROD'
    end
    object cdsPerfilPTIP_PROD_IND: TStringField
      DisplayLabel = 'Tipo Produto Indicado'
      FieldName = 'TIP_PROD_IND'
      FixedChar = True
      Size = 5
    end
    object cdsPerfilPPERC_TB_ATAC: TFloatField
      DisplayLabel = 'Percentual Tabela Atacado'
      FieldName = 'PERC_TB_ATAC'
      DisplayFormat = '##0.00'
    end
    object cdsPerfilPPERC_TB_VARE: TFloatField
      DisplayLabel = 'Percentual Tabela Varejo'
      FieldName = 'PERC_TB_VARE'
      DisplayFormat = '##0.00'
    end
    object cdsPerfilPNEC_ACOMP: TStringField
      DisplayLabel = 'Necessita de Acompanhamento'
      FieldName = 'NEC_ACOMP'
      FixedChar = True
      Size = 1
    end
    object cdsPerfilPDIAS_ACOMP: TIntegerField
      DisplayLabel = 'Dias de Acompanhamento'
      FieldName = 'DIAS_ACOMP'
    end
    object cdsPerfilPNBM: TStringField
      DisplayLabel = 'Codigo NBM'
      FieldName = 'NBM'
      FixedChar = True
      Size = 8
    end
    object cdsPerfilPPERC_AD_30: TFloatField
      DisplayLabel = 'Percentual Aumento 30 dias'
      FieldName = 'PERC_AD_30'
      DisplayFormat = '##0.00'
    end
    object cdsPerfilPPERC_AD_60: TFloatField
      DisplayLabel = 'Percentual Aumento 60 dias'
      FieldName = 'PERC_AD_60'
      DisplayFormat = '##0.00'
    end
    object cdsPerfilPPERC_AD_90: TFloatField
      DisplayLabel = 'Percentual Aumento 90 dias'
      FieldName = 'PERC_AD_90'
      DisplayFormat = '##0.00'
    end
    object cdsPerfilPDESCR_PERFIL: TStringField
      DisplayLabel = 'Descri'#231#227'o do Perfil'
      FieldName = 'DESCR_PERFIL'
      FixedChar = True
      Size = 30
    end
    object cdsPerfilPATIVO: TIntegerField
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
    object cdsPerfilPCOD_MARCA: TIntegerField
      DisplayLabel = 'Cod Marca'
      FieldName = 'COD_MARCA'
    end
    object cdsPerfilPTOT_ALIQ: TStringField
      DisplayLabel = 'Totalizador redu'#231#227'o no ECF'
      FieldName = 'TOT_ALIQ'
      FixedChar = True
      Size = 4
    end
  end
  object qrPesqNtOp: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transConsulta
    AfterCancel = cdsPGrBeforeOpen
    SQL.Strings = (
      'select * from NAT_OP')
    Left = 904
    Top = 26
  end
  object dspPNtOp: TDataSetProvider
    DataSet = qrPesqNtOp
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 904
    Top = 82
  end
  object cdsPNatOp: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspPNtOp'
    ReadOnly = True
    BeforeOpen = cdsPGrBeforeOpen
    Left = 904
    Top = 138
    object cdsPNatOpCODIGO_NOP: TFloatField
      Tag = 2
      DisplayLabel = 'CFOP'
      FieldName = 'CODIGO_NOP'
    end
    object cdsPNatOpDESCRICAO_NOP: TStringField
      Tag = 2
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO_NOP'
      Size = 100
    end
    object cdsPNatOpPRECC: TStringField
      DisplayLabel = 'Pre'#231'o Custo'
      FieldName = 'PRECC'
      FixedChar = True
      Size = 1
    end
    object cdsPNatOpCOMIMP: TStringField
      DisplayLabel = 'Com Imposto'
      FieldName = 'COMIMP'
      FixedChar = True
      Size = 1
    end
    object cdsPNatOpSEM_IMPOSTO: TStringField
      DisplayLabel = 'Calcular Imposto'
      FieldName = 'SEM_IMPOSTO'
      FixedChar = True
      Size = 1
    end
    object cdsPNatOpCALC_CUSTO: TStringField
      DisplayLabel = 'Calcular Custo'
      FieldName = 'CALC_CUSTO'
      FixedChar = True
      Size = 1
    end
    object cdsPNatOpALIQ_INT_SAID: TFloatField
      DisplayLabel = 'Aliq Pad Venda'
      FieldName = 'ALIQ_INT_SAID'
    end
    object cdsPNatOpTIPV: TStringField
      DisplayLabel = 'Tipo Venda Padrao'
      FieldName = 'TIPV'
      FixedChar = True
      Size = 1
    end
    object cdsPNatOpATIVO: TIntegerField
      Tag = 1
      FieldName = 'ATIVO'
    end
    object cdsPNatOpALT_EST: TStringField
      DisplayLabel = 'Alterar Estoque'
      FieldName = 'ALT_EST'
      FixedChar = True
      Size = 1
    end
    object cdsPNatOpMOSTRAR_REL_COMPRAS: TStringField
      DisplayLabel = 'Mostrar Relatorio'
      FieldName = 'MOSTRAR_REL_COMPRAS'
      FixedChar = True
      Size = 1
    end
    object cdsPNatOpTIPV_VEICULO: TStringField
      DisplayLabel = 'Tipo OP'
      FieldName = 'TIPV_VEICULO'
      FixedChar = True
      Size = 1
    end
    object cdsPNatOpORDEMEXIBICAO: TSmallintField
      DisplayLabel = 'Ordem Exib'
      FieldName = 'ORDEMEXIBICAO'
    end
    object cdsPNatOpTIPO_OPERACAO: TStringField
      DisplayLabel = 'Novo/Usado'
      FieldName = 'TIPO_OPERACAO'
      FixedChar = True
      Size = 1
    end
    object cdsPNatOpFATURAMENTO: TStringField
      DisplayLabel = 'Faturamento'
      FieldName = 'FATURAMENTO'
      FixedChar = True
      Size = 1
    end
  end
  object qrNtOpD: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transConsulta
    AfterCancel = cdsPGrBeforeOpen
    SQL.Strings = (
      'select * from NAT_OP_DESCRICAO')
    Left = 960
    Top = 26
  end
  object dspNtOpD: TDataSetProvider
    DataSet = qrNtOpD
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 960
    Top = 82
  end
  object cdsNtOpD: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspNtOpD'
    ReadOnly = True
    BeforeOpen = cdsPGrBeforeOpen
    Left = 960
    Top = 138
    object cdsNtOpDCODIGO_NOP: TFloatField
      Tag = 2
      DisplayLabel = 'CFOP'
      FieldName = 'CODIGO_NOP'
    end
    object cdsNtOpDDESCRICAO_NOP: TStringField
      Tag = 2
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO_NOP'
      Required = True
      Size = 100
    end
  end
  object qrEspVeic: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transConsulta
    SQL.Strings = (
      'select * from ESPECIE_VEICULO')
    Left = 1123
    Top = 208
  end
  object dspEspVeic: TDataSetProvider
    DataSet = qrEspVeic
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 1123
    Top = 255
  end
  object cdsEspVeic: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspEspVeic'
    BeforeOpen = cdsPGrBeforeOpen
    Left = 1123
    Top = 312
    object cdsEspVeicCODIGO_ESP: TIntegerField
      DisplayLabel = 'Cod Esp'
      FieldName = 'CODIGO_ESP'
      Required = True
    end
    object cdsEspVeicDESCRICAO_ESP: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO_ESP'
      FixedChar = True
      Size = 30
    end
    object cdsEspVeicOBSERVACAO_ESP: TStringField
      DisplayLabel = 'Observa'#231#227'o'
      FieldName = 'OBSERVACAO_ESP'
      FixedChar = True
      Size = 40
    end
  end
  object qrContador: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transConsulta
    SQL.Strings = (
      'select *  from CONTADOR')
    Left = 810
    Top = 368
  end
  object dspContador: TDataSetProvider
    DataSet = qrContador
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 810
    Top = 415
  end
  object cdsContador: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspContador'
    BeforeOpen = cdsPGrBeforeOpen
    Left = 810
    Top = 464
    object cdsContadorCOD_CONTADOR: TIntegerField
      Tag = 2
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_CONTADOR'
      Required = True
    end
    object cdsContadorCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'C'#243'digo da Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsContadorCODIGO_UF: TIntegerField
      DisplayLabel = 'Cod UF'
      FieldName = 'CODIGO_UF'
    end
    object cdsContadorCPFCNPJ_CONT: TStringField
      DisplayLabel = 'CPF/CNPJ'
      FieldName = 'CPFCNPJ_CONT'
      FixedChar = True
      Size = 18
    end
    object cdsContadorNOME_CONT: TStringField
      Tag = 2
      DisplayLabel = 'Nome'
      FieldName = 'NOME_CONT'
      Size = 50
    end
    object cdsContadorENDERECO_CONT: TStringField
      DisplayLabel = 'Endere'#231'o'
      FieldName = 'ENDERECO_CONT'
      Size = 50
    end
    object cdsContadorBAIRRO_CONT: TStringField
      DisplayLabel = 'Bairro'
      FieldName = 'BAIRRO_CONT'
      Size = 30
    end
    object cdsContadorCIDADE_CONT: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'CIDADE_CONT'
      Size = 30
    end
    object cdsContadorCEP_CONT: TStringField
      DisplayLabel = 'CEP'
      FieldName = 'CEP_CONT'
      EditMask = '00000\-999;1;_'
      FixedChar = True
      Size = 9
    end
    object cdsContadorFONE_CONT: TStringField
      DisplayLabel = 'Fone 1'
      FieldName = 'FONE_CONT'
      EditMask = '(99) 9999-9999;0;_'
      FixedChar = True
      Size = 14
    end
    object cdsContadorRAMAL_CONT: TStringField
      DisplayLabel = 'Ramal'
      FieldName = 'RAMAL_CONT'
      FixedChar = True
      Size = 5
    end
    object cdsContadorCONTATO_CONT: TStringField
      DisplayLabel = 'Contato'
      FieldName = 'CONTATO_CONT'
    end
    object cdsContadorOUTROTEL_CONT: TStringField
      DisplayLabel = 'Fone 2'
      FieldName = 'OUTROTEL_CONT'
      EditMask = '(99) 9999-9999;0;_'
      FixedChar = True
      Size = 14
    end
    object cdsContadorOBS_CONT: TStringField
      Tag = 1
      DisplayLabel = 'Observa'#231#227'o'
      FieldName = 'OBS_CONT'
      Size = 80
    end
    object cdsContadorEMAIL_CONT: TStringField
      DisplayLabel = 'E-mail'
      FieldName = 'EMAIL_CONT'
      Size = 50
    end
    object cdsContadorFAX_CONT: TStringField
      DisplayLabel = 'Fax'
      FieldName = 'FAX_CONT'
      EditMask = '(99) 9999-9999;0;_'
      FixedChar = True
      Size = 14
    end
    object cdsContadorDT_CAD_CONT: TDateTimeField
      DisplayLabel = 'Data de cadastro'
      FieldName = 'DT_CAD_CONT'
    end
    object cdsContadorCOD_CIDADE: TSmallintField
      DisplayLabel = 'Cod Cidade'
      FieldName = 'COD_CIDADE'
    end
    object cdsContadorCOD_BAIRRO: TSmallintField
      DisplayLabel = 'Cod Bairro'
      FieldName = 'COD_BAIRRO'
    end
    object cdsContadorATIVO: TIntegerField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
    object cdsContadorCRC: TStringField
      FieldName = 'CRC'
      Size = 15
    end
    object cdsContadorCNPJ_ESCRITORIO: TStringField
      DisplayLabel = 'CNPJ Escrit'#243'rio'
      FieldName = 'CNPJ_ESCRITORIO'
      Size = 18
    end
    object cdsContadorNUMERO: TIntegerField
      DisplayLabel = 'Numero Endere'#231'o'
      FieldName = 'NUMERO'
    end
    object cdsContadorCOMPLEMENTO: TStringField
      DisplayLabel = 'Complemento'
      FieldName = 'COMPLEMENTO'
      Size = 60
    end
    object cdsContadorNOME_ESCRITORIO: TStringField
      DisplayLabel = 'Nome Escrit'#243'rio'
      FieldName = 'NOME_ESCRITORIO'
      Size = 50
    end
  end
  object qrPlContasC: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = dtmAtivo.IbTransCol
    SQL.Strings = (
      'select * from P_CONTAS_CONTABIL')
    Left = 877
    Top = 368
  end
  object dspPlContasC: TDataSetProvider
    DataSet = qrPlContasC
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 877
    Top = 416
  end
  object cdsPlContasC: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspPlContasC'
    BeforeOpen = cdsPGrBeforeOpen
    Left = 877
    Top = 464
    object cdsPlContasCCOD_CTA: TStringField
      Tag = 2
      DisplayLabel = 'Codigo'
      FieldName = 'COD_CTA'
      Required = True
      Size = 60
    end
    object cdsPlContasCCOD_EMPRESA: TIntegerField
      Tag = 1
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsPlContasCNOME_CTA: TStringField
      Tag = 2
      DisplayLabel = 'Descri'#231#227'o da Conta'
      FieldName = 'NOME_CTA'
      Required = True
      Size = 60
    end
    object cdsPlContasCCOD_NAT_CC: TStringField
      Tag = 2
      DisplayLabel = 'Cod Natureza'
      FieldName = 'COD_NAT_CC'
      Required = True
      FixedChar = True
      Size = 2
    end
    object cdsPlContasCIND_CTA: TStringField
      Tag = 2
      DisplayLabel = 'Indicador'
      FieldName = 'IND_CTA'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsPlContasCNIVEL: TSmallintField
      Tag = 2
      DisplayLabel = 'N'#237'vel'
      FieldName = 'NIVEL'
      Required = True
    end
    object cdsPlContasCDT_ALT: TDateTimeField
      DisplayLabel = 'Data Inclus'#227'o/Altera'#231#227'o'
      FieldName = 'DT_ALT'
    end
    object cdsPlContasCATIVO: TSmallintField
      Tag = 1
      FieldName = 'ATIVO'
    end
  end
  object qrCCusto: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = dtmAtivo.IbTransCol
    SQL.Strings = (
      'select * from CENTRO_CUSTOS')
    Left = 941
    Top = 368
  end
  object dspCCusto: TDataSetProvider
    DataSet = qrCCusto
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 941
    Top = 416
  end
  object cdsCCusto: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspCCusto'
    BeforeOpen = cdsPGrBeforeOpen
    Left = 941
    Top = 464
    object cdsCCustoCOD_CCUS: TIntegerField
      Tag = 2
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_CCUS'
      Required = True
    end
    object cdsCCustoCOD_EMPRESA: TIntegerField
      Tag = 1
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsCCustoCCUS: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'CCUS'
      Required = True
      Size = 60
    end
    object cdsCCustoDT_ALT: TDateTimeField
      DisplayLabel = 'Data Inclus'#227'o/Altera'#231#227'o'
      FieldName = 'DT_ALT'
    end
    object cdsCCustoATIVO: TSmallintField
      Tag = 1
      FieldName = 'ATIVO'
    end
  end
  object qrBanco: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = dtmAtivo.IbTransCol
    SQL.Strings = (
      'select * from  CODIGO_BANCO')
    Left = 141
    Top = 536
  end
  object dspBanco: TDataSetProvider
    DataSet = qrBanco
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 141
    Top = 584
  end
  object cdsBanco: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspBanco'
    BeforeOpen = cdsPGrBeforeOpen
    Left = 141
    Top = 632
    object cdsBancoCOD_BANCO: TIntegerField
      Tag = 2
      DisplayLabel = 'C'#243'digo Banco'
      FieldName = 'COD_BANCO'
      Required = True
    end
    object cdsBancoDESC_BANCO: TStringField
      Tag = 2
      DisplayLabel = 'Banco'
      FieldName = 'DESC_BANCO'
      Size = 30
    end
    object cdsBancoCOD_CONTROLE_CX: TIntegerField
      DisplayLabel = 'Ctrl Cx'
      FieldName = 'COD_CONTROLE_CX'
    end
  end
  object qrCombustivel: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = dtmAtivo.IbTransCol
    SQL.Strings = (
      'select * from  TP_COMB_RENAVAM WHERE ATIVO = 1')
    Left = 229
    Top = 528
  end
  object dspCombustivel: TDataSetProvider
    DataSet = qrCombustivel
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 229
    Top = 576
  end
  object cdsCombustivel: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspCombustivel'
    BeforeOpen = cdsPGrBeforeOpen
    Left = 229
    Top = 624
    object cdsCombustivelCODIGO_TPCOMB: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO_TPCOMB'
      Required = True
    end
    object cdsCombustivelDESCR_COMB: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCR_COMB'
      Size = 50
    end
    object cdsCombustivelATIVO: TIntegerField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
  end
  object qrCor: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = dtmAtivo.IbTransCol
    SQL.Strings = (
      'select * from  CODIGO_CORFAB WHERE ATIVO = 1')
    Left = 325
    Top = 528
  end
  object dspCor: TDataSetProvider
    DataSet = qrCor
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 325
    Top = 576
  end
  object cdsCor: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCor'
    Left = 325
    Top = 624
    object cdsCorCOD_COR: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'COD_COR'
      Required = True
    end
    object cdsCorDESCRICAO_COR: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO_COR'
      FixedChar = True
      Size = 30
    end
    object cdsCorATIVO: TIntegerField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
      Visible = False
    end
  end
  object qrGradeProd: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transConsulta
    Left = 710
    Top = 526
  end
  object dsGradeProd: TDataSource
    DataSet = cdsGradeProd
    Left = 797
    Top = 577
  end
  object dspGradeProd: TDataSetProvider
    DataSet = qrGradeProd
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 709
    Top = 576
  end
  object cdsGradeProd: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspGradeProd'
    BeforeOpen = cdsPGrBeforeOpen
    Left = 797
    Top = 528
    object cdsGradeProdcod_grade: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'cod_grade'
    end
    object cdsGradeProddescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descricao'
      Size = 32
    end
    object cdsGradeProddescricao1: TStringField
      DisplayLabel = 'Descri'#231#227'o 2'
      FieldName = 'descricao1'
      Size = 32
    end
    object cdsGradeProdqtd_item_disponivel: TFloatField
      DisplayLabel = 'Quantidade dispon'#237'vel'
      FieldName = 'qtd_item_disponivel'
    end
    object cdsGradeProdqtde: TFloatField
      DisplayLabel = 'Quantidade Total'
      FieldName = 'qtde'
    end
    object cdsGradeProdqtd_item_pedAberto: TFloatField
      DisplayLabel = 'Quantidade em aberto'
      FieldName = 'qtd_item_pedAberto'
    end
  end
  object cdsGradeProdClientDataSet: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspCor'
    BeforeOpen = cdsPGrBeforeOpen
    Left = 389
    Top = 696
    object cdsGradeProdIntegerField: TIntegerField
      DisplayLabel = 'Cod Cor'
      FieldName = 'COD_COR'
      Required = True
    end
    object cdsGradeProdStringField: TStringField
      DisplayLabel = 'Descricao'
      FieldName = 'DESCRICAO_COR'
      FixedChar = True
      Size = 30
    end
    object cdsGradeProdIntegerField2: TIntegerField
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
  end
  object qrGradeProdOutEmp: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transConsulta
    Left = 894
    Top = 526
  end
  object dsGradeProdOutEmp: TDataSource
    DataSet = qrGradeProdOutEmp
    Left = 1007
    Top = 576
  end
  object dspGradeProdOutEmp: TDataSetProvider
    DataSet = qrGradeProdOutEmp
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 893
    Top = 576
  end
  object cdsGradeProdOutEmp: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspGradeProd'
    Left = 1005
    Top = 520
    object IntegerField1: TIntegerField
      DisplayLabel = 'C'#243'digo da grade'
      FieldName = 'cod_grade'
    end
    object StringField1: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descricao'
      Size = 32
    end
    object StringField2: TStringField
      DisplayLabel = 'Descri'#231#227'o 2'
      FieldName = 'descricao1'
      Size = 32
    end
    object IntegerField2: TIntegerField
      DisplayLabel = 'Quantidade dispon'#237'vel'
      FieldName = 'qtd_item_disponivel'
    end
    object IntegerField3: TIntegerField
      DisplayLabel = 'Quantidade Total'
      FieldName = 'qtde'
    end
    object IntegerField4: TIntegerField
      DisplayLabel = 'Quantidade em aberto'
      FieldName = 'qtd_item_pedAberto'
    end
  end
  object qrCEP: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transConsulta
    SQL.Strings = (
      'select * from CEP')
    Left = 624
    Top = 520
  end
  object dspCEP: TDataSetProvider
    DataSet = qrCEP
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 624
    Top = 576
  end
  object cdsCEP: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspCEP'
    BeforeOpen = cdsPGrBeforeOpen
    Left = 621
    Top = 627
    object cdsCEPCOD_CEP: TIntegerField
      Tag = 1
      DisplayLabel = 'Codigo'
      FieldName = 'COD_CEP'
      Required = True
    end
    object cdsCEPCOD_CORREIOS: TStringField
      Tag = 2
      DisplayLabel = 'CEP'
      FieldName = 'COD_CORREIOS'
      EditMask = '00000\-999;0;'
      FixedChar = True
      Size = 9
    end
    object cdsCEPENDERECO: TStringField
      DisplayLabel = 'Logradouro'
      FieldName = 'ENDERECO'
      Size = 40
    end
    object cdsCEPBAIRRO: TStringField
      DisplayLabel = 'Bairro'
      FieldName = 'BAIRRO'
      Size = 50
    end
    object cdsCEPCIDADE: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'CIDADE'
      Size = 50
    end
    object cdsCEPESTADO: TStringField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
      Size = 50
    end
    object cdsCEPCOD_BAIRRO: TIntegerField
      DisplayLabel = 'Cod Bairro'
      FieldName = 'COD_BAIRRO'
    end
    object cdsCEPCOD_CIDADE: TIntegerField
      DisplayLabel = 'Cod Cidade'
      FieldName = 'COD_CIDADE'
    end
    object cdsCEPCOD_ESTADO: TIntegerField
      DisplayLabel = 'Cod Estado'
      FieldName = 'COD_ESTADO'
    end
    object cdsCEPATIVO: TSmallintField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
  end
  object qrBuscasProd: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transConsulta
    Left = 1104
    Top = 600
  end
  object qrAcaoJud: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transConsulta
    SQL.Strings = (
      'select * from SPED_PROC_REF_ACAO_JUDICIAL'
      'where cod_acao_judicial = 0')
    Left = 1021
    Top = 24
  end
  object dspAcaoJud: TDataSetProvider
    DataSet = qrAcaoJud
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1021
    Top = 72
  end
  object cdsAcaoJud: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspAcaoJud'
    BeforeOpen = cdsPGrBeforeOpen
    Left = 1021
    Top = 120
    object cdsAcaoJudCOD_ACAO_JUDICIAL: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'COD_ACAO_JUDICIAL'
      Required = True
    end
    object cdsAcaoJudNUM_PROC: TStringField
      Tag = 2
      DisplayLabel = 'N'#250'mero Processo'
      FieldName = 'NUM_PROC'
      Required = True
    end
    object cdsAcaoJudID_SEC_JUD: TStringField
      Tag = 2
      DisplayLabel = 'Se'#231#227'o Judici'#225'ria'
      FieldName = 'ID_SEC_JUD'
      Required = True
      Size = 128
    end
    object cdsAcaoJudID_VARA: TStringField
      Tag = 2
      DisplayLabel = 'Identifica'#231#227'o da Vara'
      FieldName = 'ID_VARA'
      Required = True
      Size = 2
    end
    object cdsAcaoJudIND_NAT_ACAO: TStringField
      Tag = 2
      DisplayLabel = 'Natureza da A'#231#227'o Judicial'
      FieldName = 'IND_NAT_ACAO'
      Required = True
      FixedChar = True
      Size = 2
    end
    object cdsAcaoJudDESC_DEC_JUD: TStringField
      DisplayLabel = 'Descri'#231#227'o Resumida dos Efeitos Tribut'#225'rios'
      FieldName = 'DESC_DEC_JUD'
      Size = 100
    end
    object cdsAcaoJudDT_SENT_JUD: TDateTimeField
      DisplayLabel = 'Data Sente'#231'a/Decis'#227'o Judicial'
      FieldName = 'DT_SENT_JUD'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsAcaoJudDATA_LANC: TDateTimeField
      DisplayLabel = 'Data Lan'#231'amento'
      FieldName = 'DATA_LANC'
    end
  end
  object qrProcAdm: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transConsulta
    SQL.Strings = (
      'select * from SPED_PROC_REF_ADMINISTRATIVO'
      'where cod_adm = 0')
    Left = 1085
    Top = 24
  end
  object dspProcAdm: TDataSetProvider
    DataSet = qrProcAdm
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1085
    Top = 72
  end
  object cdsProcAdm: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspProcAdm'
    BeforeOpen = cdsPGrBeforeOpen
    Left = 1085
    Top = 120
    object cdsProcAdmCOD_ADM: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_ADM'
      Required = True
    end
    object cdsProcAdmNUM_PROC: TStringField
      DisplayLabel = 'N'#250'mero Processo'
      FieldName = 'NUM_PROC'
      Required = True
    end
    object cdsProcAdmIND_NAT_ACAO: TStringField
      DisplayLabel = 'Natureza do Processo Administrativo'
      FieldName = 'IND_NAT_ACAO'
      Required = True
      FixedChar = True
      Size = 2
    end
    object cdsProcAdmDT_DEC_ADM: TDateTimeField
      DisplayLabel = 'Data do Despacho/Decis'#227'o Administrativa'
      FieldName = 'DT_DEC_ADM'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsProcAdmDATA_LANC: TDateTimeField
      DisplayLabel = 'Data Lan'#231'amento'
      FieldName = 'DATA_LANC'
      EditMask = '!99/99/0000;1;_'
    end
  end
  object qrNf: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transConsulta
    SQL.Strings = (
      'select * from NOTAFISCAL')
    Left = 1144
    Top = 24
  end
  object dspNf: TDataSetProvider
    DataSet = qrNf
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1144
    Top = 72
  end
  object cdsNf: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspNf'
    BeforeOpen = cdsPGrBeforeOpen
    Left = 1144
    Top = 120
    object cdsNfCOD_NF: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'COD_NF'
      Required = True
    end
    object cdsNfNUM_NF: TIntegerField
      Tag = 2
      DisplayLabel = 'Num NF'
      FieldName = 'NUM_NF'
      Required = True
    end
    object cdsNfNATUREZA_NF: TStringField
      Tag = 2
      DisplayLabel = 'E/S'
      FieldName = 'NATUREZA_NF'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsNfTIPO_NF: TStringField
      Tag = 2
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO_NF'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsNfDATA_LANC: TDateTimeField
      Tag = 2
      DisplayLabel = 'Data Lan'#231'amento'
      FieldName = 'DATA_LANC'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsNfVALOR_TOTAL: TFloatField
      Tag = 2
      DisplayLabel = 'Valor Total NF'
      FieldName = 'VALOR_TOTAL'
    end
    object cdsNfEMISSAO_PROPRIA: TStringField
      DisplayLabel = 'Emissao Propria'
      FieldName = 'EMISSAO_PROPRIA'
      FixedChar = True
      Size = 1
    end
    object cdsNfSTATUS: TStringField
      DisplayLabel = 'Status NF'
      FieldName = 'STATUS'
      Size = 10
    end
    object cdsNfSITUACAO_NFE: TStringField
      DisplayLabel = 'Situacao NF-e'
      FieldName = 'SITUACAO_NFE'
      Size = 40
    end
    object cdsNfMODELO_NF: TStringField
      DisplayLabel = 'Modelo'
      FieldName = 'MODELO_NF'
      Size = 3
    end
    object cdsNfSERIE: TStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 5
    end
    object cdsNfCOD_CLIENTE: TIntegerField
      DisplayLabel = 'Cod Cliente'
      FieldName = 'COD_CLIENTE'
      Required = True
    end
    object cdsNfCODIGO_NOP: TFloatField
      Tag = 2
      DisplayLabel = 'CFOP'
      FieldName = 'CODIGO_NOP'
      DisplayFormat = '##0.'
    end
    object cdsNfDESC_NATOP: TStringField
      DisplayLabel = 'Descricao CFOP'
      DisplayWidth = 128
      FieldName = 'DESC_NATOP'
      Size = 128
    end
    object cdsNfCOD_COND_PAG: TIntegerField
      Tag = 2
      DisplayLabel = 'Cod Cond Pag'
      FieldName = 'COD_COND_PAG'
    end
    object cdsNfCOD_VENDEDOR: TIntegerField
      DisplayLabel = 'Cod Usuario'
      FieldName = 'COD_VENDEDOR'
      Required = True
    end
    object cdsNfDATA_CONTABIL: TDateTimeField
      DisplayLabel = 'Data Contabil'
      FieldName = 'DATA_CONTABIL'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsNfDATA_ENT_SAIDA: TDateTimeField
      DisplayLabel = 'Data Entrada/Saida'
      FieldName = 'DATA_ENT_SAIDA'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsNfVALOR_PROD: TFloatField
      DisplayLabel = 'Valor Produtos'
      FieldName = 'VALOR_PROD'
    end
    object cdsNfVALOR_SERV: TFloatField
      DisplayLabel = 'Valor Servi'#231'os'
      FieldName = 'VALOR_SERV'
    end
    object cdsNfALIQ_ICM: TFloatField
      DisplayLabel = '% ICMS'
      FieldName = 'ALIQ_ICM'
    end
    object cdsNfBASE_ICM: TFloatField
      DisplayLabel = 'Base ICMS'
      FieldName = 'BASE_ICM'
    end
    object cdsNfVALOR_ICM: TFloatField
      DisplayLabel = 'Valor ICMS'
      FieldName = 'VALOR_ICM'
    end
    object cdsNfVALOR_DESC: TFloatField
      DisplayLabel = 'Desconto'
      FieldName = 'VALOR_DESC'
    end
    object cdsNfVALOR_DESC_P: TFloatField
      DisplayLabel = 'Desc Produtos'
      FieldName = 'VALOR_DESC_P'
    end
    object cdsNfVALOR_DESC_S: TFloatField
      DisplayLabel = 'Desc Servi'#231'os'
      FieldName = 'VALOR_DESC_S'
    end
    object cdsNfALIQ_IRRF: TFloatField
      DisplayLabel = 'IRRF'
      FieldName = 'ALIQ_IRRF'
    end
    object cdsNfALIQ_ISS: TFloatField
      DisplayLabel = '% ISS'
      FieldName = 'ALIQ_ISS'
    end
    object cdsNfBASE_ISS: TFloatField
      DisplayLabel = 'Base ISS'
      FieldName = 'BASE_ISS'
    end
    object cdsNfVALOR_ISS: TFloatField
      DisplayLabel = 'Valor ISS'
      FieldName = 'VALOR_ISS'
    end
    object cdsNfBASE_ICMSUB: TFloatField
      DisplayLabel = 'Base ICMS Sub'
      FieldName = 'BASE_ICMSUB'
    end
    object cdsNfVALOR_ICMSUB: TFloatField
      DisplayLabel = 'Valor ICMS Sub'
      FieldName = 'VALOR_ICMSUB'
    end
    object cdsNfVALOR_FRETE: TFloatField
      DisplayLabel = 'Valor Frete'
      FieldName = 'VALOR_FRETE'
    end
    object cdsNfVALOR_SEGURO: TFloatField
      DisplayLabel = 'Valor Seguro'
      FieldName = 'VALOR_SEGURO'
    end
    object cdsNfVALOR_OUT_DESP: TFloatField
      DisplayLabel = 'Outras Desp'
      FieldName = 'VALOR_OUT_DESP'
    end
    object cdsNfVALOR_DESP_PF: TFloatField
      DisplayLabel = 'Desp PF'
      FieldName = 'VALOR_DESP_PF'
    end
    object cdsNfBASE_IPI: TFloatField
      DisplayLabel = 'Base IPI'
      FieldName = 'BASE_IPI'
    end
    object cdsNfVALOR_IPI: TFloatField
      DisplayLabel = 'Valor IPI'
      FieldName = 'VALOR_IPI'
    end
    object cdsNfVALOR_ACRES_FIN: TFloatField
      DisplayLabel = 'Acresc. Finan.'
      FieldName = 'VALOR_ACRES_FIN'
    end
    object cdsNfCODIGO_TR: TIntegerField
      Tag = 1
      DisplayLabel = 'Transportador'
      FieldName = 'CODIGO_TR'
    end
    object cdsNfCRT: TStringField
      FieldName = 'CRT'
      FixedChar = True
      Size = 1
    end
    object cdsNfOBS: TMemoField
      Tag = 1
      DisplayLabel = 'Observa'#231#227'o'
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 8
    end
    object cdsNfFRETE_BASE_IPI: TStringField
      DisplayLabel = 'Frente Base IPI'
      FieldName = 'FRETE_BASE_IPI'
      FixedChar = True
      Size = 1
    end
    object cdsNfFRETE_F_NFE: TStringField
      DisplayLabel = 'Frete Fora NF'
      FieldName = 'FRETE_F_NFE'
      FixedChar = True
      Size = 1
    end
    object cdsNfFRETE_BASE_ICM: TStringField
      DisplayLabel = 'Frete Base ICMS'
      FieldName = 'FRETE_BASE_ICM'
      FixedChar = True
      Size = 1
    end
    object cdsNfFRETECONTA_TR: TStringField
      DisplayLabel = 'Frete p/ Conta'
      FieldName = 'FRETECONTA_TR'
      FixedChar = True
      Size = 1
    end
    object cdsNfPLACA_TR: TStringField
      DisplayLabel = 'Placa Transp'
      FieldName = 'PLACA_TR'
      Size = 7
    end
    object cdsNfUF_PLACA_TR: TStringField
      DisplayLabel = 'UF Placa'
      FieldName = 'UF_PLACA_TR'
      FixedChar = True
      Size = 2
    end
    object cdsNfQTDE_VOLUMES_TR: TIntegerField
      DisplayLabel = 'Volumes'
      FieldName = 'QTDE_VOLUMES_TR'
    end
    object cdsNfESPECIE_TR: TStringField
      DisplayLabel = 'Especie'
      FieldName = 'ESPECIE_TR'
      Size = 15
    end
    object cdsNfMARCA_TR: TStringField
      DisplayLabel = 'Marca'
      FieldName = 'MARCA_TR'
      Size = 15
    end
    object cdsNfNUMERO_TR: TStringField
      DisplayLabel = 'Numero'
      FieldName = 'NUMERO_TR'
      Size = 15
    end
    object cdsNfNUM_PED: TIntegerField
      DisplayLabel = 'Num Pedido'
      FieldName = 'NUM_PED'
    end
    object cdsNfANTEC_TRIB: TStringField
      DisplayLabel = 'Antecipacao Tributaria'
      FieldName = 'ANTEC_TRIB'
      FixedChar = True
      Size = 1
    end
    object cdsNfDEVOLUCAO: TStringField
      DisplayLabel = 'Nf de Devolu'#231#227'o'
      FieldName = 'DEVOLUCAO'
      FixedChar = True
      Size = 3
    end
    object cdsNfBENEF_FISCAL: TStringField
      DisplayLabel = 'Benef Fiscal'
      FieldName = 'BENEF_FISCAL'
      FixedChar = True
      Size = 1
    end
    object cdsNfCONF_ENT: TStringField
      DisplayLabel = 'Conf Ent'
      FieldName = 'CONF_ENT'
      FixedChar = True
      Size = 1
    end
    object cdsNfTP_NF: TStringField
      Tag = 1
      DisplayLabel = 'Tp NF'
      FieldName = 'TP_NF'
      FixedChar = True
      Size = 1
    end
    object cdsNfDA: TStringField
      FieldName = 'DA'
      FixedChar = True
      Size = 1
    end
    object cdsNfMNF: TStringField
      Tag = 1
      FieldName = 'MNF'
      FixedChar = True
      Size = 1
    end
    object cdsNfNUM_NFEM: TIntegerField
      DisplayLabel = 'Num Nf Emiss'#227'o Pr'#243'pria'
      FieldName = 'NUM_NFEM'
    end
    object cdsNfATIVO: TIntegerField
      FieldName = 'ATIVO'
    end
    object cdsNfCOD_USUARIO: TIntegerField
      DisplayLabel = 'Cod Usuario'
      FieldName = 'COD_USUARIO'
    end
    object cdsNfNUM_NF_EMT: TIntegerField
      DisplayLabel = 'Num NF Emt'
      FieldName = 'NUM_NF_EMT'
    end
    object cdsNfSERIE_EMT: TStringField
      DisplayLabel = 'Serie Emt'
      FieldName = 'SERIE_EMT'
      Size = 5
    end
    object cdsNfTIPO_DESCONTO: TStringField
      DisplayLabel = 'Desconto Item/Rateio'
      FieldName = 'TIPO_DESCONTO'
      Size = 1
    end
    object cdsNfPESO_B: TFloatField
      DisplayLabel = 'Peso Bruto'
      FieldName = 'PESO_B'
    end
    object cdsNfPESO_L: TFloatField
      DisplayLabel = 'Peso Liquido'
      FieldName = 'PESO_L'
    end
    object cdsNfVALOR_PIS: TFloatField
      DisplayLabel = 'Valor PIS'
      FieldName = 'VALOR_PIS'
    end
    object cdsNfVALOR_PIS_ST: TFloatField
      DisplayLabel = 'Valor PIS ST'
      FieldName = 'VALOR_PIS_ST'
    end
    object cdsNfVALOR_COFINS: TFloatField
      DisplayLabel = 'Valor COFINS'
      FieldName = 'VALOR_COFINS'
    end
    object cdsNfVALOR_COFINS_ST: TFloatField
      DisplayLabel = 'Valor COFINS ST'
      FieldName = 'VALOR_COFINS_ST'
    end
    object cdsNfSUBSERIE: TStringField
      DisplayLabel = 'SubSerie'
      FieldName = 'SUBSERIE'
      Size = 5
    end
    object cdsNfEXTEMPORANEO: TStringField
      DisplayLabel = 'Extemporaneo'
      FieldName = 'EXTEMPORANEO'
      FixedChar = True
      Size = 1
    end
    object cdsNfDADOS_INTERESSE_FISCO: TMemoField
      DisplayLabel = 'Dados Adicionais (Apenas de Interesse ao Fisco)'
      FieldName = 'DADOS_INTERESSE_FISCO'
      BlobType = ftMemo
      Size = 8
    end
    object cdsNfDADOS_LANCAMENTO_FISCAL: TMemoField
      DisplayLabel = 'Lancamento Fiscal'
      FieldName = 'DADOS_LANCAMENTO_FISCAL'
      BlobType = ftMemo
      Size = 8
    end
    object cdsNfTIPO_EMISSAO: TStringField
      DisplayLabel = 'Tipo Emissao NF-e'
      FieldName = 'TIPO_EMISSAO'
      FixedChar = True
      Size = 1
    end
    object cdsNfNFE_CMSG: TSmallintField
      DisplayLabel = 'Cod Msg'
      FieldName = 'NFE_CMSG'
    end
    object cdsNfNFE_XMSG: TStringField
      DisplayLabel = 'Mensag. SEFAZ'
      FieldName = 'NFE_XMSG'
      Size = 200
    end
    object cdsNfCOD_NF_REF: TIntegerField
      DisplayLabel = 'Cod NF Ref'
      FieldName = 'COD_NF_REF'
    end
    object cdsNfNUM_NF_COMPL: TIntegerField
      DisplayLabel = 'Num NF Ref'
      FieldName = 'NUM_NF_COMPL'
    end
    object cdsNfSERIE_COMPL: TStringField
      DisplayLabel = 'Serie NF Ref'
      FieldName = 'SERIE_COMPL'
      Size = 5
    end
    object cdsNfHORA_ENT_SAIDA: TTimeField
      DisplayLabel = 'Hora Entrada/Saida'
      FieldName = 'HORA_ENT_SAIDA'
      EditMask = '!90:00:00;1;_'
    end
    object cdsNfNFE_DPEC_CSTAT: TSmallintField
      DisplayLabel = 'NF-e. DPEC. C'#243'digo do status da resposta'
      FieldName = 'NFE_DPEC_CSTAT'
    end
    object cdsNfNFE_DPEC_XMOTIVO: TStringField
      DisplayLabel = 'NF-e. Descri'#231#227'o literal do status da resposta'
      FieldName = 'NFE_DPEC_XMOTIVO'
      Size = 256
    end
    object cdsNfNFE_DPEC_NREGDPEC: TStringField
      DisplayLabel = 'NF-e. Num DPEC'
      FieldName = 'NFE_DPEC_NREGDPEC'
      Size = 17
    end
    object cdsNfNFE_DHCONT: TDateTimeField
      DisplayLabel = 'NF-e. Data e Hora da entrada em contingencia'
      FieldName = 'NFE_DHCONT'
      EditMask = '!99/99/0000 00:00:00;1;_'
    end
    object cdsNfNFE_XJUST: TStringField
      DisplayLabel = 'NF-e. Justificativa da entrada em contingencia'
      FieldName = 'NFE_XJUST'
      Size = 256
    end
    object cdsNfN_COMANDO: TIntegerField
      DisplayLabel = 'Num Comando'
      FieldName = 'N_COMANDO'
    end
    object cdsNfALIQ_ICM_SIMPLES: TFloatField
      DisplayLabel = 'Aliq Simples'
      FieldName = 'ALIQ_ICM_SIMPLES'
    end
    object cdsNfBASE_ICM_SIMPLES: TFloatField
      DisplayLabel = 'Base ICM Simples'
      FieldName = 'BASE_ICM_SIMPLES'
    end
    object cdsNfVALOR_ICM_SIMPLES: TFloatField
      DisplayLabel = 'Valor ICM Simples'
      FieldName = 'VALOR_ICM_SIMPLES'
    end
    object cdsNfINSCRICAO_SUBSTITUTO: TStringField
      DisplayLabel = 'Insc Substituto'
      FieldName = 'INSCRICAO_SUBSTITUTO'
      Size = 18
    end
    object cdsNfCNAE_FISCAL: TStringField
      DisplayLabel = 'CNAE Fiscal'
      FieldName = 'CNAE_FISCAL'
      Size = 7
    end
    object cdsNfIM_EMP: TStringField
      DisplayLabel = 'Insc Municipal'
      FieldName = 'IM_EMP'
      Size = 18
    end
    object cdsNfNUM_GERADO: TStringField
      DisplayLabel = 'Num Ger'
      FieldName = 'NUM_GERADO'
      FixedChar = True
      Size = 1
    end
    object cdsNfN_CAIXA: TIntegerField
      DisplayLabel = 'Num Caixa'
      FieldName = 'N_CAIXA'
    end
    object cdsNfCOD_CONS: TStringField
      DisplayLabel = 'Classe Consumo Energia Eletrica'
      FieldName = 'COD_CONS'
      FixedChar = True
      Size = 2
    end
    object cdsNfVL_FORN: TFloatField
      DisplayLabel = 'Valor Fornecido'
      FieldName = 'VL_FORN'
    end
    object cdsNfVL_SERV_NT: TFloatField
      DisplayLabel = 'Valor Serv Nao Trib ICM'
      FieldName = 'VL_SERV_NT'
    end
    object cdsNfVL_TERC: TFloatField
      DisplayLabel = 'Valor Terceiros'
      FieldName = 'VL_TERC'
    end
    object cdsNfLOTE_NFE: TIntegerField
      DisplayLabel = 'Lote NF-e'
      FieldName = 'LOTE_NFE'
    end
    object cdsNfIPI_BASE_ICM: TStringField
      DisplayLabel = 'IPI na Base ICM'
      FieldName = 'IPI_BASE_ICM'
      FixedChar = True
      Size = 1
    end
    object cdsNfCONF_PISCOFINS: TStringField
      DisplayLabel = 'Conf PISCOFINS'
      FieldName = 'CONF_PISCOFINS'
      FixedChar = True
      Size = 1
    end
    object cdsNfCOMPLEMENTAR_ENT: TStringField
      DisplayLabel = 'Entrada Complementar'
      FieldName = 'COMPLEMENTAR_ENT'
      FixedChar = True
      Size = 1
    end
    object cdsNfCOD_EMPRESA: TIntegerField
      Tag = 1
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsNfRESULTADO_ENVIO: TStringField
      DisplayLabel = 'Resultado Envio NF-e'
      FieldName = 'RESULTADO_ENVIO'
      Size = 30
    end
    object cdsNfDATA_AUTORIZACAO: TDateTimeField
      DisplayLabel = 'Data Autorizacao NF-e'
      FieldName = 'DATA_AUTORIZACAO'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsNfDATAHORA_ENVIO: TDateTimeField
      DisplayLabel = 'Data/Hora Envio NF-e'
      FieldName = 'DATAHORA_ENVIO'
      EditMask = '!99/99/0000 90:00:00;1;_'
    end
    object cdsNfHORA_ENVIO: TStringField
      DisplayLabel = 'Hora Envio NF-e'
      FieldName = 'HORA_ENVIO'
      EditMask = '!90:00:00;1;_'
      Size = 8
    end
    object cdsNfDIGEST: TStringField
      DisplayLabel = 'Digest NF-e'
      FieldName = 'DIGEST'
      Size = 40
    end
    object cdsNfPROTOCOLO: TStringField
      DisplayLabel = 'Protocolo NF-e'
      FieldName = 'PROTOCOLO'
      Size = 40
    end
    object cdsNfCODIGOERRO: TStringField
      DisplayLabel = 'Cod Erro NF-e'
      FieldName = 'CODIGOERRO'
      Size = 10
    end
    object cdsNfDESCRICAOERRO: TStringField
      DisplayLabel = 'Descricao Erro NF-e'
      FieldName = 'DESCRICAOERRO'
      Size = 50
    end
    object cdsNfTEMPORESPOSTA: TSmallintField
      DisplayLabel = 'Tempo Resposta NF-e'
      FieldName = 'TEMPORESPOSTA'
    end
    object cdsNfTIPONFE: TStringField
      DisplayLabel = 'Tipo NF-e'
      FieldName = 'TIPONFE'
      Size = 40
    end
    object cdsNfDANFEIMPRESSO: TStringField
      DisplayLabel = 'Danfe Impresso NF-e'
      FieldName = 'DANFEIMPRESSO'
      Size = 5
    end
    object cdsNfCHAVE_NFE: TStringField
      DisplayLabel = 'Chave NF-e'
      FieldName = 'CHAVE_NFE'
      Size = 60
    end
    object cdsNfSEL_NFE: TIntegerField
      Tag = 1
      FieldName = 'SEL_NFE'
    end
    object cdsNfN_FORM_SEGURANCA: TIntegerField
      DisplayLabel = 'Num Form Seg'
      FieldName = 'N_FORM_SEGURANCA'
    end
    object cdsNfNUM_NF_VNDANT: TIntegerField
      DisplayLabel = 'Num Nf Ant'
      FieldName = 'NUM_NF_VNDANT'
    end
    object cdsNfSUB_SERIEANT: TIntegerField
      DisplayLabel = 'Sub Serie Ant'
      FieldName = 'SUB_SERIEANT'
    end
    object cdsNfJUST_CANCELAMENTO: TStringField
      DisplayLabel = 'Justificativa Cancelamento NF-e'
      FieldName = 'JUST_CANCELAMENTO'
      Size = 60
    end
    object cdsNfCOM_PROD: TStringField
      DisplayLabel = 'Com Produtos'
      FieldName = 'COM_PROD'
      Size = 1
    end
    object cdsNfCOM_SERV: TStringField
      DisplayLabel = 'Com Servicos'
      FieldName = 'COM_SERV'
      Size = 1
    end
    object cdsNfINUTILNFANT: TStringField
      DisplayLabel = 'Inutilizar NF-e Ant.'
      FieldName = 'INUTILNFANT'
      Size = 1
    end
  end
  object qrInfCompl: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transConsulta
    SQL.Strings = (
      'select * from SPED_INFORMACAO_COMPLEMENTAR'
      'where cod_inf = 0 and cod_empresa = 0')
    Left = 1197
    Top = 24
  end
  object dspInfCompl: TDataSetProvider
    DataSet = qrInfCompl
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1197
    Top = 72
  end
  object cdsInfCompl: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspInfCompl'
    BeforeOpen = cdsPGrBeforeOpen
    Left = 1197
    Top = 120
    object cdsInfComplCOD_INF: TIntegerField
      Tag = 2
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_INF'
      Required = True
    end
    object cdsInfComplTIPO: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
    end
    object cdsInfComplTXT: TStringField
      Tag = 2
      DisplayLabel = 'Texto'
      FieldName = 'TXT'
      Size = 510
    end
    object cdsInfComplTXT_COMPL: TStringField
      DisplayLabel = 'Texto Complementar'
      FieldName = 'TXT_COMPL'
      Size = 510
    end
    object cdsInfComplATIVO: TSmallintField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
    object cdsInfComplCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
  end
  object qrLocalidade: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transConsulta
    SQL.Strings = (
      
        'select localidade.*, s.setor, c.nome_vendedor, i.nome_cidade, e.' +
        'sigla_uf from localidade'
      
        'inner join setor s on s.cod_setor = localidade.cod_setor and s.c' +
        'od_empresa = localidade.cod_empresa'
      
        'left join colaborador c on c.cod_vendedor = s.cod_vendedor and c' +
        '.cod_empresa = s.cod_empresa'
      'left join cidades i on i.cod_cidade = localidade.cod_cidade'
      'left join estados e on e.codigo_uf = localidade.cod_estado'
      
        'where localidade.cod_localidade = 0 and localidade.cod_empresa =' +
        ' 0')
    Left = 1275
    Top = 24
  end
  object dspLocalidade: TDataSetProvider
    DataSet = qrLocalidade
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1275
    Top = 72
  end
  object cdsLocalidade: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspLocalidade'
    BeforeOpen = cdsPGrBeforeOpen
    Left = 1275
    Top = 120
    object cdsLocalidadeCOD_LOCALIDADE: TIntegerField
      Tag = 2
      DisplayLabel = 'Codigo'
      FieldName = 'COD_LOCALIDADE'
      Required = True
    end
    object cdsLocalidadeLOCALIDADE: TStringField
      Tag = 2
      DisplayLabel = 'Localidade'
      FieldName = 'LOCALIDADE'
      Size = 64
    end
    object cdsLocalidadeCOD_SETOR: TIntegerField
      DisplayLabel = 'Codigo Setor'
      FieldName = 'COD_SETOR'
      Required = True
    end
    object cdsLocalidadeCOD_CIDADE: TIntegerField
      DisplayLabel = 'Codigo Cidade'
      FieldName = 'COD_CIDADE'
    end
    object cdsLocalidadeCOD_ESTADO: TIntegerField
      DisplayLabel = 'Codigo Estado'
      FieldName = 'COD_ESTADO'
    end
    object cdsLocalidadeCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Codigo Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsLocalidadeATIVO: TSmallintField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
  end
  object qrPromocaoTab: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transConsulta
    SQL.Strings = (
      'select p.ordem, tp.descr_tipo,'
      '  case when coalesce(l.cod_localidade, 0) > 0 then l.localidade'
      '    when coalesce(st.cod_setor, 0) > 0 then st.setor'
      '    when coalesce(cd.cod_cidade, 0) > 0 then cd.nome_cidade'
      '    else p.descr_promocao'
      '  end descricao,'
      '    pp.valor_promocao, pp.porcentagem, pp.max_desc'
      '  from promocao_produto pp'
      
        '     inner join tipo_preco tp on tp.cod_tppreco = pp.cod_tppreco' +
        ' and tp.cod_empresa = pp.cod_empresa'
      
        '     inner join produtos pr on pr.grupo_prod = pp.grupo_prod and' +
        ' pr.cod_prod = pp.cod_prod and pr.cod_empresa = pp.cod_empresa'
      
        '     left join localidade l on l.cod_localidade = pp.cod_localid' +
        'ade and l.cod_empresa = pp.cod_empresa'
      
        '     left join setor st on st.cod_setor = pp.cod_setor and st.co' +
        'd_empresa = pp.cod_empresa'
      '     left join cidades cd on cd.cod_cidade = pp.cod_cidade'
      
        '     inner join promocao p on p.cod_promocao = pp.cod_promocao a' +
        'nd p.cod_tppreco = pp.cod_tppreco and p.cod_empresa = pp.cod_emp' +
        'resa'
      '     where pr.ativo = 1 and pp.cod_empresa = 0')
    Left = 1491
    Top = 24
    object qrPromocaoTabDESCR_TIPO: TIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'DESCR_TIPO'
      Origin = '"TIPO_PRECO"."DESCR_TIPO"'
    end
    object qrPromocaoTabDESCRICAO: TIBStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      ProviderFlags = []
      Size = 60
    end
    object qrPromocaoTabVALOR_PROMOCAO: TFloatField
      DisplayLabel = 'Valor (R$)'
      FieldName = 'VALOR_PROMOCAO'
      Origin = '"PROMOCAO_PRODUTO"."VALOR_PROMOCAO"'
      DisplayFormat = '##0.00'
    end
    object qrPromocaoTabPORCENTAGEM: TFloatField
      DisplayLabel = 'Acresc/Desc (%)'
      FieldName = 'PORCENTAGEM'
      Origin = '"PROMOCAO_PRODUTO"."PORCENTAGEM"'
      DisplayFormat = '##0.00'
    end
    object qrPromocaoTabMAX_DESC: TFloatField
      DisplayLabel = 'Desc Max (%)'
      FieldName = 'MAX_DESC'
      Origin = '"PROMOCAO_PRODUTO"."MAX_DESC"'
      DisplayFormat = '##0.00'
    end
    object qrPromocaoTabORDEM: TIntegerField
      Tag = 1
      DisplayLabel = 'Ordem'
      FieldName = 'ORDEM'
      Origin = '"PROMOCAO"."ORDEM"'
    end
  end
  object dspPromocaoTab: TDataSetProvider
    DataSet = qrPromocaoTab
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1491
    Top = 72
  end
  object cdsPromocaoTab: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspPromocaoTab'
    BeforeOpen = cdsPGrBeforeOpen
    Left = 1491
    Top = 120
  end
  object dsPromocaoTab: TDataSource
    DataSet = qrPromocaoTab
    Left = 1488
    Top = 176
  end
  object qrPesqVendedor: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transConsulta
    SQL.Strings = (
      'SELECT COLABORADOR.* FROM COLABORADOR'
      'LEFT JOIN FUNCOES ON FUNCOES.COD_FUNCAO = COLABORADOR.COD_FUNCAO'
      
        'where COLABORADOR.ativo = 1 and COLABORADOR.cod_funcao = 17 or C' +
        'OLABORADOR.cod_funcao  =18')
    Left = 284
    Top = 362
  end
  object dspPesqVendedor: TDataSetProvider
    DataSet = qrPesqVendedor
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 279
    Top = 412
  end
  object cdsPesqVendedor: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspCol'
    ReadOnly = True
    BeforeOpen = cdsPGrBeforeOpen
    Left = 281
    Top = 469
    object IntegerField5: TIntegerField
      DisplayLabel = 'Cod Colaborador'
      FieldName = 'COD_VENDEDOR'
      Required = True
    end
    object IntegerField6: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
      Visible = False
    end
    object IntegerField7: TIntegerField
      DisplayLabel = 'Cod Uf'
      FieldName = 'CODIGO_UF'
      Required = True
    end
    object IntegerField8: TIntegerField
      DisplayLabel = 'Cod Funcao'
      FieldName = 'COD_FUNCAO'
    end
    object StringField3: TStringField
      Tag = 2
      DisplayLabel = 'Nome Funcionario'
      FieldName = 'NOME_VENDEDOR'
      Size = 35
    end
    object StringField4: TStringField
      DisplayLabel = 'Endereco'
      FieldName = 'END_VENDEDOR'
      Size = 35
    end
    object StringField5: TStringField
      DisplayLabel = 'Bairro'
      FieldName = 'BAIRRO_VENDEDOR'
      Size = 35
    end
    object StringField6: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'CIDADE_VENDEDOR'
      Size = 35
    end
    object StringField7: TStringField
      DisplayLabel = 'CEP'
      FieldName = 'CEP_VENDEDOR'
      EditMask = '00000\-999;0;'
      FixedChar = True
      Size = 9
    end
    object StringField8: TStringField
      DisplayLabel = 'Fone'
      FieldName = 'FONE_VENDEDOR'
      EditMask = '(99) 9999-9999;0;_'
      FixedChar = True
      Size = 14
    end
    object StringField9: TStringField
      DisplayLabel = 'CPF'
      FieldName = 'CPF_VENDEDOR'
      FixedChar = True
      Size = 11
    end
    object FloatField1: TFloatField
      DisplayLabel = 'Porc Venda Servico'
      FieldName = 'PC_VEND_SERV'
    end
    object FloatField2: TFloatField
      DisplayLabel = 'Porc Venda Produto'
      FieldName = 'PC_VEND_PROD'
    end
    object MemoField1: TMemoField
      DisplayLabel = 'Observacao'
      FieldName = 'OBS_VENDEDOR'
      OnGetText = MemoField1GetText
      BlobType = ftMemo
      Size = 8
    end
    object DateTimeField1: TDateTimeField
      DisplayLabel = 'Data Modifica'#231#227'o'
      FieldName = 'DATA_MOD_COL'
      EditMask = '!99/99/0000;1;_'
    end
    object DateTimeField2: TDateTimeField
      DisplayLabel = 'Data Cadastro'
      FieldName = 'DATA_CAD_COL'
      EditMask = '!99/99/0000;1;_'
    end
    object DateTimeField3: TDateTimeField
      DisplayLabel = 'Data Nasc'
      FieldName = 'DAT_NASC_COL'
      EditMask = '!99/99/0000;1;_'
    end
    object StringField10: TStringField
      DisplayLabel = 'Nome Ult. Emprego'
      FieldName = 'NOME_ULT_EMP'
      Size = 30
    end
    object StringField11: TStringField
      DisplayLabel = 'Endere'#231'o Ult. Emprego'
      FieldName = 'ENDERECO_ULT_EMP'
      Size = 30
    end
    object StringField12: TStringField
      DisplayLabel = 'Fone Ult. Emprego'
      FieldName = 'FONE_ULT_EMP'
      EditMask = '!\(99\)0000-0000;1;_'
      FixedChar = True
      Size = 14
    end
    object StringField13: TStringField
      DisplayLabel = 'Contato Ult. Emprego'
      FieldName = 'CONT_ULT_EMP'
    end
    object FloatField3: TFloatField
      DisplayLabel = 'Sal'#225'rio Ult. Emprego'
      FieldName = 'ULT_SAL_EMP'
      currency = True
    end
    object DateTimeField4: TDateTimeField
      DisplayLabel = 'Data entrada Ult. Emprego'
      FieldName = 'DTENT_ULT_EMP'
      EditMask = '!99/99/0000;1;_'
    end
    object DateTimeField5: TDateTimeField
      DisplayLabel = 'Data Sa'#237'da ult. Emprego'
      FieldName = 'DTSAI_ULT_EMP'
      EditMask = '!99/99/0000;1;_'
    end
    object StringField14: TStringField
      DisplayLabel = 'Nome plt. Emprego'
      FieldName = 'NOME_PLT_EMP'
      Size = 30
    end
    object StringField15: TStringField
      DisplayLabel = 'Endere'#231'o plt Emprego'
      FieldName = 'ENDERECO_PLT_EMP'
      Size = 30
    end
    object StringField16: TStringField
      DisplayLabel = 'Fone plt. Emprego'
      FieldName = 'FONE_PLT_EMP'
      EditMask = '!\(99\)0000-0000;1;_'
      FixedChar = True
      Size = 14
    end
    object StringField17: TStringField
      DisplayLabel = 'Contato plt. Emprego'
      FieldName = 'CONT_PLT_EMP'
    end
    object FloatField4: TFloatField
      DisplayLabel = 'Salario plt. Emprego'
      FieldName = 'PLT_SAL_EMP'
      currency = True
    end
    object DateTimeField6: TDateTimeField
      DisplayLabel = 'Data entradao plt. Emprego'
      FieldName = 'DTENT_PLT_EMP'
      EditMask = '!99/99/0000;1;_'
    end
    object DateTimeField7: TDateTimeField
      DisplayLabel = 'Data sa'#237'da plt. Emprego'
      FieldName = 'DTSAI_PLT_EMP'
      EditMask = '!99/99/0000;1;_'
    end
    object DateTimeField8: TDateTimeField
      DisplayLabel = 'Data ult. F'#233'rias'
      FieldName = 'DT_ULT_FERIAS'
      EditMask = '!99/99/0000;1;_'
    end
    object IntegerField9: TIntegerField
      DisplayLabel = 'Tempo ult. f'#233'rias'
      FieldName = 'TMP_ULT_FERIAS'
    end
    object FloatField5: TFloatField
      DisplayLabel = 'Valor ult. F'#233'rias'
      FieldName = 'VL_ULT_FERIAS'
      currency = True
    end
    object DateTimeField9: TDateTimeField
      DisplayLabel = 'Data venda ult. F'#233'rias'
      FieldName = 'DTVND_ULT_FERIAS'
      EditMask = '!99/99/0000;1;_'
    end
    object DateTimeField10: TDateTimeField
      DisplayLabel = 'Data 13'#186' Sal'#225'rio'
      FieldName = 'DT_13_SAL'
      EditMask = '!99/99/0000;1;_'
    end
    object FloatField6: TFloatField
      DisplayLabel = 'Valor 13'#186' Sal'#225'rio'
      FieldName = 'VL_13_SAL'
      currency = True
    end
    object FloatField7: TFloatField
      DisplayLabel = 'Valor Sal'#225'rio'
      FieldName = 'VL_SAL'
      currency = True
    end
    object SmallintField1: TSmallintField
      Tag = 1
      DisplayLabel = 'Cod Cidade'
      FieldName = 'COD_CIDADE'
    end
    object SmallintField2: TSmallintField
      Tag = 1
      DisplayLabel = 'Cod Bairro'
      FieldName = 'COD_BAIRRO'
    end
    object FloatField8: TFloatField
      DisplayLabel = 'Sal'#225'rio Reg.'
      FieldName = 'SALARIO_REGISTRO'
      currency = True
    end
    object FloatField9: TFloatField
      DisplayLabel = 'Valor Sal'#225'rio'
      FieldName = 'VALOR_SALARIO'
      currency = True
    end
    object FloatField10: TFloatField
      DisplayLabel = 'Qtd. Sal. Fam'#237'lia'
      FieldName = 'QUANT_SAL_FAMILIA'
    end
    object FloatField11: TFloatField
      DisplayLabel = 'Valor sal'#225'rio Fam'#237'lia'
      FieldName = 'VALOR_SALARIO_FAMILIA'
      currency = True
    end
    object FloatField12: TFloatField
      DisplayLabel = 'Perc. Peso'
      FieldName = 'PERC_PESO'
    end
    object IntegerField10: TIntegerField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
    object StringField18: TStringField
      DisplayLabel = 'E-mail'
      FieldName = 'EMAIL'
      Size = 50
    end
    object StringField19: TStringField
      DisplayLabel = 'Site'
      FieldName = 'SITE'
      FixedChar = True
      Size = 1
    end
    object StringField20: TStringField
      DisplayLabel = 'Fone Contato'
      FieldName = 'FONE_CONTATO'
      FixedChar = True
      Size = 40
    end
    object IntegerField11: TIntegerField
      DisplayLabel = 'Codigo Gerente'
      FieldName = 'COD_GERENTE'
    end
  end
  object qrPlanoContas: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transConsulta
    SQL.Strings = (
      'select * from P_Contas where ativo = 1 order by desc_plc')
    Left = 1576
    Top = 24
  end
  object dspPlanoContas: TDataSetProvider
    DataSet = qrPlanoContas
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1576
    Top = 68
  end
  object cdsPlanoContas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPlanoContas'
    BeforeOpen = cdsPGrBeforeOpen
    Left = 1576
    Top = 115
    object cdsPlanoContasN_CONTA_PLC: TFloatField
      DisplayLabel = 'N'#186' Conta'
      FieldName = 'N_CONTA_PLC'
    end
    object cdsPlanoContasGRUP_CT: TIntegerField
      DisplayLabel = 'Grupo de Contas'
      FieldName = 'GRUP_CT'
      Required = True
    end
    object cdsPlanoContasDESC_PLC: TStringField
      DisplayLabel = 'Descri'#231#227'o de Contas'
      FieldName = 'DESC_PLC'
      Required = True
      FixedChar = True
      Size = 30
    end
    object cdsPlanoContasTIPO_PLC: TStringField
      DisplayLabel = 'Tipo Conta (E/S)'
      FieldName = 'TIPO_PLC'
      FixedChar = True
      Size = 1
    end
    object cdsPlanoContasSIGLA_PLC: TStringField
      DisplayLabel = 'Sigla da Conta'
      FieldName = 'SIGLA_PLC'
      FixedChar = True
      Size = 6
    end
    object cdsPlanoContasDATA_CAD_PC: TDateTimeField
      DisplayLabel = 'Data Cadastro da Conta'
      FieldName = 'DATA_CAD_PC'
    end
    object cdsPlanoContasDATA_MOD_PC: TDateTimeField
      DisplayLabel = 'Data Modifica'#231#227'o da Conta'
      FieldName = 'DATA_MOD_PC'
    end
    object cdsPlanoContasTIPO_CTP: TStringField
      DisplayLabel = 'Tipo da Conta (D/F)'
      FieldName = 'TIPO_CTP'
      FixedChar = True
      Size = 1
    end
    object cdsPlanoContasDESC_PADR: TStringField
      DisplayLabel = 'Descri'#231#227'o Padr'#227'o'
      FieldName = 'DESC_PADR'
      FixedChar = True
      Size = 30
    end
    object cdsPlanoContasCOD_SUB_CT: TIntegerField
      DisplayLabel = 'C'#243'd. Sub Grupo'
      FieldName = 'COD_SUB_CT'
      Required = True
    end
    object cdsPlanoContasATIVO: TIntegerField
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
    object cdsPlanoContasSTHAB: TStringField
      FieldName = 'STHAB'
      FixedChar = True
      Size = 1
    end
    object cdsPlanoContasCODSEQ_BALANCO: TIntegerField
      DisplayLabel = 'C'#243'd. S'#233'q. Balan'#231'o'
      FieldName = 'CODSEQ_BALANCO'
    end
    object cdsPlanoContasTP_VEICULOS: TStringField
      DisplayLabel = 'Tipo Ve'#237'culos'
      FieldName = 'TP_VEICULOS'
      Size = 1
    end
    object cdsPlanoContasTPRAT: TStringField
      FieldName = 'TPRAT'
      FixedChar = True
      Size = 1
    end
    object cdsPlanoContasCOD_CTA_CONTABIL: TStringField
      DisplayLabel = 'Codigo da Conta Contabil'
      FieldName = 'COD_CTA_CONTABIL'
      Size = 60
    end
    object cdsPlanoContasORD_CTA_CONTABIL: TIntegerField
      DisplayLabel = 'Ordem Contabil'
      FieldName = 'ORD_CTA_CONTABIL'
    end
    object cdsPlanoContasCONTA_REFERENCIA: TStringField
      DisplayLabel = 'Conta de Referencia'
      FieldName = 'CONTA_REFERENCIA'
      Size = 1
    end
  end
  object qrControles: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transConsulta
    SQL.Strings = (
      'select * from CONTROLES')
    Left = 1649
    Top = 24
  end
  object cdsControles: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspControles'
    BeforeOpen = cdsPGrBeforeOpen
    Left = 1648
    Top = 113
    object cdsControlesCODIGO_CTRL: TIntegerField
      DisplayLabel = 'C'#243'digo do Controle'
      FieldName = 'CODIGO_CTRL'
      Required = True
    end
    object cdsControlesFLUXO_CTRL: TStringField
      DisplayLabel = 'Saldo Inicial Fluxo Caixa ?'
      FieldName = 'FLUXO_CTRL'
      FixedChar = True
      Size = 1
    end
    object cdsControlesN_BANCO_CTRL: TStringField
      DisplayLabel = 'N'#186' Banco'
      FieldName = 'N_BANCO_CTRL'
      FixedChar = True
      Size = 10
    end
    object cdsControlesNOME_CTRL: TStringField
      DisplayLabel = 'Nome do Controle'
      FieldName = 'NOME_CTRL'
      Size = 35
    end
    object cdsControlesEND_CTRL: TStringField
      DisplayLabel = 'Endere'#231'o do Controle'
      FieldName = 'END_CTRL'
      Size = 30
    end
    object cdsControlesBAIRRO_CTRL: TStringField
      DisplayLabel = 'Bairro do Controle'
      FieldName = 'BAIRRO_CTRL'
    end
    object cdsControlesCID_CTRL: TStringField
      DisplayLabel = 'Cidade do Controle'
      FieldName = 'CID_CTRL'
    end
    object cdsControlesUF_CTRL: TStringField
      DisplayLabel = 'Estado do Controle'
      FieldName = 'UF_CTRL'
      FixedChar = True
      Size = 2
    end
    object cdsControlesCEP_CTRL: TStringField
      DisplayLabel = 'CEP Controle'
      FieldName = 'CEP_CTRL'
      FixedChar = True
      Size = 9
    end
    object cdsControlesCONTATO_CTRL: TStringField
      DisplayLabel = 'Contato Controle'
      FieldName = 'CONTATO_CTRL'
      Size = 15
    end
    object cdsControlesFONE_CTRL: TStringField
      DisplayLabel = 'Telefone do Controle'
      FieldName = 'FONE_CTRL'
      FixedChar = True
      Size = 13
    end
    object cdsControlesN_CONTA_CTRL: TStringField
      DisplayLabel = 'N'#186' Conta do Controle'
      FieldName = 'N_CONTA_CTRL'
      FixedChar = True
      Size = 15
    end
    object cdsControlesSALDO_ANT_CTRL: TFloatField
      DisplayLabel = 'Saldo Anterior do Controle'
      FieldName = 'SALDO_ANT_CTRL'
    end
    object cdsControlesSALDO_AT_CTRL: TFloatField
      DisplayLabel = 'Saldo Atual do Controle'
      FieldName = 'SALDO_AT_CTRL'
    end
    object cdsControlesSOBRA_CTRL: TFloatField
      DisplayLabel = 'Sobra do Controle'
      FieldName = 'SOBRA_CTRL'
    end
    object cdsControlesCOMPSALDO: TStringField
      DisplayLabel = 'Composi'#231#227'o de Saldo de Caixa ?'
      FieldName = 'COMPSALDO'
      FixedChar = True
      Size = 1
    end
    object cdsControlesDOCS: TStringField
      DisplayLabel = 'Controle de Documentos (S1,S2,N)'
      FieldName = 'DOCS'
      FixedChar = True
      Size = 2
    end
    object cdsControlesCXENT: TStringField
      DisplayLabel = 'Entrar em Condi'#231#245'es Automa'#231#227'o ?'
      FieldName = 'CXENT'
      FixedChar = True
      Size = 1
    end
    object cdsControlesQPERF: TIntegerField
      DisplayLabel = 'Sequencia Performace/Balanco'
      FieldName = 'QPERF'
    end
    object cdsControlesQSEQPERF: TIntegerField
      DisplayLabel = 'Ordem dento da Performance'
      FieldName = 'QSEQPERF'
    end
    object cdsControlesNAT_LANC: TStringField
      DisplayLabel = 'Natureza do Lan'#231'amento Padr'#227'o (S/N)'
      FieldName = 'NAT_LANC'
      FixedChar = True
      Size = 1
    end
    object cdsControlesCONTR_BANC: TStringField
      DisplayLabel = 'Controle Banc'#225'rio (S/N) ?'
      FieldName = 'CONTR_BANC'
      FixedChar = True
      Size = 1
    end
    object cdsControlesCRD_F_VND: TStringField
      Tag = 1
      FieldName = 'CRD_F_VND'
      FixedChar = True
      Size = 1
    end
    object cdsControlesTP_PLANO: TStringField
      DisplayLabel = 'Tipo do Plano'
      FieldName = 'TP_PLANO'
      FixedChar = True
      Size = 1
    end
    object cdsControlesNAT_CTRL: TStringField
      DisplayLabel = 'Natureza do Controle'
      FieldName = 'NAT_CTRL'
      FixedChar = True
      Size = 1
    end
    object cdsControlesDEB_SAI_CNT: TStringField
      DisplayLabel = 'Acerto Caixa Cont'#225'bil'
      FieldName = 'DEB_SAI_CNT'
      FixedChar = True
      Size = 1
    end
    object cdsControlesCODIGO_EMP: TIntegerField
      DisplayLabel = 'C'#243'digo da Empresa'
      FieldName = 'CODIGO_EMP'
      Required = True
    end
    object cdsControlesN_AGENCIA_CTRL: TStringField
      Tag = 1
      FieldName = 'N_AGENCIA_CTRL'
      Size = 10
    end
    object cdsControlesCAMINHO_LICENCA_CTRL: TStringField
      Tag = 1
      FieldName = 'CAMINHO_LICENCA_CTRL'
      Size = 50
    end
    object cdsControlesCAMINHO_LOGOTIPO_CTRL: TStringField
      Tag = 1
      FieldName = 'CAMINHO_LOGOTIPO_CTRL'
      Size = 50
    end
    object cdsControlesUSAR_BOLETO: TStringField
      DisplayLabel = 'Usar Boleto'
      FieldName = 'USAR_BOLETO'
      FixedChar = True
      Size = 1
    end
    object cdsControlesIDENTIF_CEDENTE: TStringField
      Tag = 1
      FieldName = 'IDENTIF_CEDENTE'
      Size = 40
    end
    object cdsControlesCAMINHO_REMESSA: TStringField
      Tag = 1
      FieldName = 'CAMINHO_REMESSA'
      Size = 50
    end
    object cdsControlesCOD_CEDENTE: TStringField
      DisplayLabel = 'C'#243'digo Cedente'
      FieldName = 'COD_CEDENTE'
    end
    object cdsControlesINICIO_NOSSO_NUMRERO: TStringField
      Tag = 1
      FieldName = 'INICIO_NOSSO_NUMRERO'
    end
    object cdsControlesFIM_NOSSO_NUMERO: TStringField
      Tag = 1
      FieldName = 'FIM_NOSSO_NUMERO'
    end
    object cdsControlesPROXIMO_NOSSO_NUMERO: TStringField
      Tag = 1
      FieldName = 'PROXIMO_NOSSO_NUMERO'
    end
    object cdsControlesCOD_FINALIZADOR: TIntegerField
      Tag = 1
      FieldName = 'COD_FINALIZADOR'
    end
    object cdsControlesCODSEQ_BALANCO: TIntegerField
      DisplayLabel = 'C'#243'd. S'#233'q. Balan'#231'o'
      FieldName = 'CODSEQ_BALANCO'
    end
    object cdsControlesTIPODOCUMENTOCOBRANCA: TStringField
      DisplayLabel = 'Tipo Documento de Cobran'#231'a'
      FieldName = 'TIPODOCUMENTOCOBRANCA'
      Size = 10
    end
    object cdsControlesOUTRODADOCONFIGURACAO1: TStringField
      DisplayLabel = 'Dados Configura'#231#227'o 1'
      FieldName = 'OUTRODADOCONFIGURACAO1'
    end
    object cdsControlesOUTRODADOCONFIGURACAO2: TStringField
      DisplayLabel = 'Dados Configura'#231#227'o 2'
      FieldName = 'OUTRODADOCONFIGURACAO2'
    end
    object cdsControlesLAYOUTARQUIVOREMESSA: TStringField
      DisplayLabel = 'Layout Arquivo Remessa'
      FieldName = 'LAYOUTARQUIVOREMESSA'
    end
    object cdsControlesIND_TIT: TStringField
      DisplayLabel = 'Indicador T'#237'tulo de Cr'#233'dito'
      FieldName = 'IND_TIT'
      FixedChar = True
      Size = 2
    end
    object cdsControlesCARTAO_SPED: TSmallintField
      DisplayLabel = 'Sped Cart'#227'o'
      FieldName = 'CARTAO_SPED'
    end
    object cdsControlesCARTAO_SPED_PART: TIntegerField
      DisplayLabel = 'C'#243'd. Adm. Cart'#227'o'
      FieldName = 'CARTAO_SPED_PART'
    end
    object cdsControlesCODIGO_BAIXA: TStringField
      DisplayLabel = 'C'#243'd. Faixa do Boleto'
      FieldName = 'CODIGO_BAIXA'
    end
    object cdsControlesCODIGO_RECUSA: TStringField
      DisplayLabel = 'C'#243'd. Recusa do Boleto'
      FieldName = 'CODIGO_RECUSA'
    end
    object cdsControlesATIVO: TIntegerField
      FieldName = 'ATIVO'
    end
    object cdsControlesCOD_COBREBEM: TIntegerField
      FieldName = 'COD_COBREBEM'
    end
    object cdsControlesBARRAR_AUTOMATICO: TStringField
      DisplayLabel = 'Usar Barramento Autom'#225'tico'
      FieldName = 'BARRAR_AUTOMATICO'
      FixedChar = True
      Size = 1
    end
    object cdsControlesTAXA_CARTAO: TFloatField
      DisplayLabel = 'Taxa Cart'#227'o Cr'#233'dito'
      FieldName = 'TAXA_CARTAO'
    end
    object cdsControlesNOME_CONTABIL: TStringField
      FieldName = 'NOME_CONTABIL'
      Size = 35
    end
    object cdsControlesENTRA_PREST_CXL: TStringField
      FieldName = 'ENTRA_PREST_CXL'
      FixedChar = True
      Size = 1
    end
    object cdsControlesN_CONTA_PLC_TX_CARTAO: TFloatField
      DisplayLabel = 'N'#176' Conta Taxa Cart'#227'o'
      FieldName = 'N_CONTA_PLC_TX_CARTAO'
    end
    object cdsControlesCTRL_SAIDA_TX_CARTAO: TIntegerField
      DisplayLabel = 'Controle Saida Taxa Cart'#227'o (Banco)'
      FieldName = 'CTRL_SAIDA_TX_CARTAO'
    end
  end
  object dspControles: TDataSetProvider
    DataSet = qrControles
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1648
    Top = 68
  end
  object qrPesqGrade: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transConsulta
    SQL.Strings = (
      'select * from GRADE  where ativo =1')
    Left = 1193
    Top = 206
  end
  object dspGrade: TDataSetProvider
    DataSet = qrPesqGrade
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 1197
    Top = 260
  end
  object cdsPGrade: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspGrade'
    ReadOnly = True
    BeforeOpen = cdsPGrBeforeOpen
    Left = 1199
    Top = 317
    object cdsPGradeCOD_GRADE: TIntegerField
      DisplayLabel = 'Cod Grade'
      FieldName = 'COD_GRADE'
      Required = True
    end
    object cdsPGradeCOD_EMPRESA: TIntegerField
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsPGradeDESCRICAO: TStringField
      DisplayLabel = 'Descricao'
      FieldName = 'DESCRICAO'
      Size = 32
    end
    object cdsPGradeDESCRICAO1: TStringField
      DisplayLabel = 'Descricao1'
      FieldName = 'DESCRICAO1'
      Size = 32
    end
    object cdsPGradeATIVO: TIntegerField
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
  end
  object qrSetor: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transConsulta
    SQL.Strings = (
      'select * from setor')
    Left = 1713
    Top = 24
  end
  object cdsSetor: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSetor'
    BeforeOpen = cdsPGrBeforeOpen
    Left = 1712
    Top = 113
    object cdsSetorCOD_SETOR: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_SETOR'
      Required = True
    end
    object cdsSetorCOD_EMPRESA: TIntegerField
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsSetorSETOR: TStringField
      DisplayLabel = 'Setor'
      FieldName = 'SETOR'
      Size = 64
    end
    object cdsSetorCOD_VENDEDOR: TIntegerField
      DisplayLabel = 'Cod Vendedor'
      FieldName = 'COD_VENDEDOR'
    end
    object cdsSetorATIVO: TSmallintField
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
  end
  object dspSetor: TDataSetProvider
    DataSet = qrSetor
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1712
    Top = 68
  end
  object qrLancF: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transConsulta
    SQL.Strings = (
      'select * from SPED_LANCAMENTO_FISCAL'
      'where cod_obs = 0')
    Left = 1765
    Top = 24
  end
  object dspLancF: TDataSetProvider
    DataSet = qrLancF
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1765
    Top = 72
  end
  object cdsLancF: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspLancF'
    BeforeOpen = cdsPGrBeforeOpen
    Left = 1765
    Top = 120
    object cdsLancFCOD_OBS: TIntegerField
      Tag = 2
      DisplayLabel = 'Codigo'
      FieldName = 'COD_OBS'
      Required = True
    end
    object cdsLancFCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsLancFTXT: TStringField
      Tag = 2
      DisplayLabel = 'Observa'#231#227'o'
      FieldName = 'TXT'
      Size = 255
    end
  end
  object qrPesqPromocao: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transConsulta
    SQL.Strings = (
      'select * from PROMOCAO'
      'where cod_promocao > 0')
    Left = 1419
    Top = 24
  end
  object dspPromocao: TDataSetProvider
    DataSet = qrPesqPromocao
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1419
    Top = 72
  end
  object cdsPromocao: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspPromocao'
    BeforeOpen = cdsPGrBeforeOpen
    Left = 1419
    Top = 120
    object cdsPromocaoCOD_PROMOCAO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_PROMOCAO'
      Required = True
    end
    object cdsPromocaoDESCR_PROMOCAO: TStringField
      DisplayLabel = 'Descricao'
      FieldName = 'DESCR_PROMOCAO'
      Size = 128
    end
    object cdsPromocaoORDEM: TIntegerField
      DisplayLabel = 'Ordem'
      FieldName = 'ORDEM'
    end
    object cdsPromocaoDATA_INI: TDateTimeField
      DisplayLabel = 'Data Ini'
      FieldName = 'DATA_INI'
    end
    object cdsPromocaoHORA_INI: TStringField
      DisplayLabel = 'Hora Ini'
      FieldName = 'HORA_INI'
      Size = 8
    end
    object cdsPromocaoDATA_FIM: TDateTimeField
      DisplayLabel = 'Data Fim'
      FieldName = 'DATA_FIM'
    end
    object cdsPromocaoHORA_FIM: TStringField
      DisplayLabel = 'Hora Fim'
      FieldName = 'HORA_FIM'
      Size = 8
    end
    object cdsPromocaoCOD_EMPRESA: TIntegerField
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsPromocaoATIVO: TIntegerField
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
  end
  object qrPesqLocalidade: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transConsulta
    SQL.Strings = (
      'select * from localidade')
    Left = 1347
    Top = 24
  end
  object dspPesqLocalidade: TDataSetProvider
    DataSet = qrPesqLocalidade
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1347
    Top = 72
  end
  object cdsPesqLocalidade: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspPesqLocalidade'
    BeforeOpen = cdsPGrBeforeOpen
    Left = 1347
    Top = 120
    object cdsPesqLocalidadeCOD_LOCALIDADE: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_LOCALIDADE'
      Required = True
    end
    object cdsPesqLocalidadeCOD_EMPRESA: TIntegerField
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsPesqLocalidadeCOD_SETOR: TIntegerField
      DisplayLabel = 'Cod Setor'
      FieldName = 'COD_SETOR'
      Required = True
    end
    object cdsPesqLocalidadeLOCALIDADE: TStringField
      DisplayLabel = 'Localidade'
      FieldName = 'LOCALIDADE'
      Size = 64
    end
    object cdsPesqLocalidadeCOD_CIDADE: TIntegerField
      DisplayLabel = 'Cod Cidade'
      FieldName = 'COD_CIDADE'
    end
    object cdsPesqLocalidadeCOD_ESTADO: TIntegerField
      DisplayLabel = 'Cod Estado'
      FieldName = 'COD_ESTADO'
    end
    object cdsPesqLocalidadeATIVO: TSmallintField
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
  end
  object qrTipoDespesa: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = dtmAtivo.IbTransCol
    SQL.Strings = (
      'SELECT * FROM TIPO_DESPESA WHERE ATIVO = 1')
    Left = 506
    Top = 526
  end
  object dspTipoDespesa: TDataSetProvider
    DataSet = qrTipoDespesa
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 506
    Top = 574
  end
  object cdsTipoDespesa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTipoDespesa'
    Left = 506
    Top = 622
    object cdsTipoDespesaCOD_TP_DESPESA: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'COD_TP_DESPESA'
      Required = True
    end
    object cdsTipoDespesaDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object cdsTipoDespesaATIVO: TSmallintField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
      Visible = False
    end
  end
  object qrTipoPendencia: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = dtmAtivo.IbTransCol
    SQL.Strings = (
      'SELECT * FROM TIPO_PENDENCIA WHERE ATIVO = 1')
    Left = 405
    Top = 528
  end
  object dspTipoPendencia: TDataSetProvider
    DataSet = qrTipoPendencia
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 405
    Top = 576
  end
  object cdsTipoPendencia: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTipoPendencia'
    Left = 405
    Top = 624
    object cdsTipoPendenciaCOD_TP_PENDENCIA: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'COD_TP_PENDENCIA'
      Required = True
    end
    object cdsTipoPendenciaDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      Size = 30
    end
    object cdsTipoPendenciaATIVO: TSmallintField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
      Visible = False
    end
  end
  object qrEstMoto: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transConsulta
    SQL.Strings = (
      'select * from EST_MOTO  where ativo =1')
    Left = 1278
    Top = 206
  end
  object dspEstMoto: TDataSetProvider
    DataSet = qrEstMoto
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 1282
    Top = 260
  end
  object cdsEstMoto: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspEstMoto'
    ReadOnly = True
    BeforeOpen = cdsPGrBeforeOpen
    Left = 1284
    Top = 317
    object cdsEstMotoCHASSI_C: TStringField
      DisplayLabel = 'Chassi'
      FieldName = 'CHASSI_C'
      Required = True
      FixedChar = True
      Size = 17
    end
    object cdsEstMotoCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
      Visible = False
    end
    object cdsEstMotoCODIGO: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO'
    end
    object cdsEstMotoSTATUS_USO: TStringField
      DisplayLabel = 'Novo/Usado'
      FieldName = 'STATUS_USO'
      FixedChar = True
      Size = 1
    end
    object cdsEstMotoPOSICAO: TStringField
      DisplayLabel = 'Posicao'
      FieldName = 'POSICAO'
      Size = 16
    end
    object cdsEstMotoDESCRICAO_VERSAOEST: TStringField
      DisplayLabel = 'Modelo'
      FieldName = 'DESCRICAO_VERSAOEST'
      FixedChar = True
      Size = 25
    end
    object cdsEstMotoMARCAEST: TStringField
      Tag = 1
      DisplayLabel = 'Marca'
      FieldName = 'MARCAEST'
      Size = 32
    end
    object cdsEstMotoVERSAOEST: TIntegerField
      DisplayLabel = 'Cod Modelo'
      FieldName = 'VERSAOEST'
    end
    object cdsEstMotoANO_FABEST: TIntegerField
      DisplayLabel = 'Ano Fab'
      FieldName = 'ANO_FABEST'
    end
    object cdsEstMotoANO_MODEST: TIntegerField
      DisplayLabel = 'Ano Mod'
      FieldName = 'ANO_MODEST'
    end
    object cdsEstMotoCOREST: TStringField
      DisplayLabel = 'Cor'
      FieldName = 'COREST'
      FixedChar = True
      Size = 10
    end
    object cdsEstMotoCILINDROSEST: TIntegerField
      DisplayLabel = 'Cilindros'
      FieldName = 'CILINDROSEST'
    end
    object cdsEstMotoCOMBUSTIVELEST: TStringField
      DisplayLabel = 'Combustivel'
      FieldName = 'COMBUSTIVELEST'
      FixedChar = True
      Size = 8
    end
    object cdsEstMotoCILINDRADAEST: TFloatField
      DisplayLabel = 'Cilindrada'
      FieldName = 'CILINDRADAEST'
    end
    object cdsEstMotoHPEST: TFloatField
      DisplayLabel = 'HP'
      FieldName = 'HPEST'
    end
    object cdsEstMotoNUM_NOTA: TIntegerField
      DisplayLabel = 'Num NF'
      FieldName = 'NUM_NOTA'
      Required = True
    end
    object cdsEstMotoDATA_CH_NOTA: TDateTimeField
      DisplayLabel = 'Data Nota'
      FieldName = 'DATA_CH_NOTA'
    end
    object cdsEstMotoLOTACAOEST: TStringField
      DisplayLabel = 'Locacao'
      FieldName = 'LOTACAOEST'
      FixedChar = True
      Size = 10
    end
    object cdsEstMotoTIPOEST: TStringField
      DisplayLabel = 'Especie'
      FieldName = 'TIPOEST'
      FixedChar = True
      Size = 12
    end
    object cdsEstMotoRENAVAMEST: TStringField
      DisplayLabel = 'Renavam'
      FieldName = 'RENAVAMEST'
      FixedChar = True
      Size = 9
    end
    object cdsEstMotoPRECO_TABEST: TFloatField
      Tag = 1
      DisplayLabel = 'Preco Tabela'
      FieldName = 'PRECO_TABEST'
      Visible = False
    end
    object cdsEstMotoFRETE_AQUISICAOEST: TFloatField
      Tag = 1
      DisplayLabel = 'Frete Aquisicao'
      FieldName = 'FRETE_AQUISICAOEST'
      Visible = False
    end
    object cdsEstMotoFRETE_VENDAEST: TFloatField
      Tag = 1
      DisplayLabel = 'Frete Venda'
      FieldName = 'FRETE_VENDAEST'
      Visible = False
    end
    object cdsEstMotoBASE_CALC_ICM_SUBEST: TFloatField
      Tag = 1
      DisplayLabel = 'Base Calc ICM Sub'
      FieldName = 'BASE_CALC_ICM_SUBEST'
      Visible = False
    end
    object cdsEstMotoVALOR_ICM_SUBEST: TFloatField
      Tag = 1
      DisplayLabel = 'Valor Icm SUb'
      FieldName = 'VALOR_ICM_SUBEST'
      Visible = False
    end
    object cdsEstMotoOBS_ITEMEST: TStringField
      Tag = 1
      DisplayLabel = 'Obs Item'
      FieldName = 'OBS_ITEMEST'
      Visible = False
      FixedChar = True
      Size = 30
    end
    object cdsEstMotoMOTOREST: TStringField
      DisplayLabel = 'Motor'
      FieldName = 'MOTOREST'
      FixedChar = True
      Size = 15
    end
    object cdsEstMotoPLACAEST: TStringField
      DisplayLabel = 'Placa'
      FieldName = 'PLACAEST'
      FixedChar = True
      Size = 10
    end
    object cdsEstMotoCERTIFICADOEST: TStringField
      Tag = 1
      DisplayLabel = 'Certificado'
      FieldName = 'CERTIFICADOEST'
      Visible = False
      FixedChar = True
      Size = 9
    end
    object cdsEstMotoDATA_CERTIFICADOEST: TDateTimeField
      Tag = 1
      DisplayLabel = 'Data Certificado'
      FieldName = 'DATA_CERTIFICADOEST'
      Visible = False
    end
    object cdsEstMotoCATEGORIAEST: TStringField
      Tag = 1
      DisplayLabel = 'Categoria '
      FieldName = 'CATEGORIAEST'
      Visible = False
      FixedChar = True
      Size = 10
    end
    object cdsEstMotoSITUACAO: TStringField
      Tag = 1
      DisplayLabel = 'Situacao'
      FieldName = 'SITUACAO'
      Visible = False
      FixedChar = True
      Size = 15
    end
    object cdsEstMotoTIPO_RES: TStringField
      Tag = 1
      DisplayLabel = 'Tipo Res'
      FieldName = 'TIPO_RES'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object cdsEstMotoDATA_RES: TDateTimeField
      Tag = 1
      DisplayLabel = 'Data Res'
      FieldName = 'DATA_RES'
      Visible = False
    end
    object cdsEstMotoVENDEDOR_RES: TIntegerField
      Tag = 1
      DisplayLabel = 'Vendedor Res'
      FieldName = 'VENDEDOR_RES'
      Visible = False
    end
    object cdsEstMotoTIPO_VENDA: TStringField
      DisplayLabel = 'Tipo Venda'
      FieldName = 'TIPO_VENDA'
      FixedChar = True
      Size = 10
    end
    object cdsEstMotoCOD_CLIENTE: TIntegerField
      DisplayLabel = 'Cod Cliente'
      FieldName = 'COD_CLIENTE'
    end
    object cdsEstMotoSTATUS_RES: TStringField
      Tag = 1
      DisplayLabel = 'Status Res'
      FieldName = 'STATUS_RES'
      Visible = False
      FixedChar = True
      Size = 10
    end
    object cdsEstMotoNOME_RES: TStringField
      Tag = 1
      DisplayLabel = 'Nome Res'
      FieldName = 'NOME_RES'
      Visible = False
      FixedChar = True
      Size = 35
    end
    object cdsEstMotoSIT_RES: TStringField
      Tag = 1
      DisplayLabel = 'Situacao Res'
      FieldName = 'SIT_RES'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object cdsEstMotoCOD_FORNECEDOR: TIntegerField
      DisplayLabel = 'Cod Fornec'
      FieldName = 'COD_FORNECEDOR'
    end
    object cdsEstMotoATIVO: TIntegerField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
      Visible = False
    end
    object cdsEstMotoDATA_VEN: TDateTimeField
      DisplayLabel = 'Data Venda'
      FieldName = 'DATA_VEN'
    end
    object cdsEstMotoNSERIE: TStringField
      DisplayLabel = 'Serie'
      FieldName = 'NSERIE'
      Size = 9
    end
    object cdsEstMotoCOD_COR: TIntegerField
      DisplayLabel = 'Cod Cor'
      FieldName = 'COD_COR'
    end
    object cdsEstMotoTIP_PINTURA: TStringField
      DisplayLabel = 'Tp Pintura'
      FieldName = 'TIP_PINTURA'
      FixedChar = True
      Size = 1
    end
    object cdsEstMotoCOD_COMBUSTIVEL: TIntegerField
      DisplayLabel = 'Cod Combustivel'
      FieldName = 'COD_COMBUSTIVEL'
    end
    object cdsEstMotoCOD_MARCA: TIntegerField
      DisplayLabel = 'Cod Marca'
      FieldName = 'COD_MARCA'
    end
    object cdsEstMotoSTATUS_ESTOQUE: TStringField
      Tag = 1
      DisplayLabel = 'Estoque'
      FieldName = 'STATUS_ESTOQUE'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object cdsEstMotoSTATUS_TRANSDEP: TStringField
      Tag = 1
      DisplayLabel = 'Transf Dep'
      FieldName = 'STATUS_TRANSDEP'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object cdsEstMotoSTATUS_DEMONST: TStringField
      Tag = 1
      DisplayLabel = 'Demonstracao'
      FieldName = 'STATUS_DEMONST'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object cdsEstMotoCOD_ESPE_SEG: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Esp Seg'
      FieldName = 'COD_ESPE_SEG'
      Visible = False
    end
    object cdsEstMotoOBS_RES: TBlobField
      Tag = 1
      DisplayLabel = 'Obs'
      FieldName = 'OBS_RES'
      Visible = False
      OnGetText = cdsEstMotoOBS_RESGetText
      Size = 8
    end
    object cdsEstMotoFONE_RES: TStringField
      Tag = 1
      DisplayLabel = 'Fone Res'
      FieldName = 'FONE_RES'
      Visible = False
      FixedChar = True
      Size = 13
    end
    object cdsEstMotoSERIE: TStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 5
    end
  end
  object qrNBS: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transConsulta
    SQL.Strings = (
      'select * from nbs')
    Left = 1837
    Top = 24
  end
  object dspNBS: TDataSetProvider
    DataSet = qrNBS
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1837
    Top = 72
  end
  object cdsNBS: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspNBS'
    BeforeOpen = cdsPGrBeforeOpen
    Left = 1837
    Top = 120
    object cdsNBSCOD_NBS: TStringField
      DisplayLabel = 'Cod NBS'
      FieldName = 'COD_NBS'
      Required = True
      Size = 8
    end
    object cdsNBSDESCRICAO_NBS: TStringField
      DisplayLabel = 'Descricao'
      FieldName = 'DESCRICAO_NBS'
      Required = True
      Size = 256
    end
    object cdsNBSALIQNAC: TFloatField
      DisplayLabel = 'Aliq Nac'
      FieldName = 'ALIQNAC'
    end
    object cdsNBSALIQIMP: TFloatField
      DisplayLabel = 'Aliq Imp'
      FieldName = 'ALIQIMP'
    end
  end
  object qrCondPag: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = dtmAtivo.IbTransCol
    SQL.Strings = (
      'select * from COND_PAG')
    Left = 1021
    Top = 368
  end
  object dspCondPag: TDataSetProvider
    DataSet = qrCondPag
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1021
    Top = 416
  end
  object cdsCondPag: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspCondPag'
    BeforeOpen = cdsPGrBeforeOpen
    Left = 1021
    Top = 464
    object cdsCondPagCOD_COND_PAG: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'COD_COND_PAG'
      Required = True
    end
    object cdsCondPagDESC_COND_PAG: TStringField
      DisplayLabel = 'Descricao'
      FieldName = 'DESC_COND_PAG'
      Size = 30
    end
    object cdsCondPagSEQPRECO: TStringField
      DisplayLabel = 'Seq Preco'
      FieldName = 'SEQPRECO'
      FixedChar = True
      Size = 1
    end
    object cdsCondPagMAX_DESC: TFloatField
      DisplayLabel = 'Max Desconto (%)'
      FieldName = 'MAX_DESC'
    end
    object cdsCondPagATIVO: TIntegerField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
      Visible = False
    end
    object cdsCondPagFINALIZADOR_CUPOM: TIntegerField
      Tag = 1
      DisplayLabel = 'Finalizador Cupom'
      FieldName = 'FINALIZADOR_CUPOM'
      Visible = False
    end
    object cdsCondPagNATUREZA_CP: TStringField
      DisplayLabel = 'Natureza'
      FieldName = 'NATUREZA_CP'
      FixedChar = True
      Size = 1
    end
    object cdsCondPagMODALIDADE: TStringField
      DisplayLabel = 'Modalidade'
      FieldName = 'MODALIDADE'
      FixedChar = True
      Size = 1
    end
    object cdsCondPagCONSIDERAR_DIA_UTIL: TStringField
      DisplayLabel = 'Considerar dia util'
      FieldName = 'CONSIDERAR_DIA_UTIL'
      Size = 3
    end
    object cdsCondPagPARCELAS_ADICIONAIS: TSmallintField
      DisplayLabel = 'Parcelas adicionais'
      FieldName = 'PARCELAS_ADICIONAIS'
    end
    object cdsCondPagCOND_PADRAO_CL_VND: TStringField
      DisplayLabel = 'Padrao Venda'
      FieldName = 'COND_PADRAO_CL_VND'
      FixedChar = True
      Size = 1
    end
    object cdsCondPagCOND_PADRAO_CL_PREST: TStringField
      DisplayLabel = 'Padrao Prestacao'
      FieldName = 'COND_PADRAO_CL_PREST'
      FixedChar = True
      Size = 1
    end
  end
  object qrPedido: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transConsulta
    SQL.Strings = (
      'select * from pedido where ativo = 1 order by num_ped')
    Left = 1904
    Top = 24
  end
  object dspPedido: TDataSetProvider
    DataSet = qrPedido
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1904
    Top = 68
  end
  object cdsPedido: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPedido'
    BeforeOpen = cdsPGrBeforeOpen
    Left = 1904
    Top = 115
    object cdsPedidoNUM_PED: TIntegerField
      DisplayLabel = 'Num Ped'
      FieldName = 'NUM_PED'
      Required = True
    end
    object cdsPedidoCOD_EMPRESA: TIntegerField
      Tag = 1
      FieldName = 'COD_EMPRESA'
      Required = True
      Visible = False
    end
    object cdsPedidoCODIGO_F: TIntegerField
      DisplayLabel = 'Codigo Fornecedor'
      FieldName = 'CODIGO_F'
      Required = True
    end
    object cdsPedidoCOD_VENDEDOR: TIntegerField
      Tag = 1
      FieldName = 'COD_VENDEDOR'
      Required = True
      Visible = False
    end
    object cdsPedidoDATA_ENV_PED: TDateTimeField
      DisplayLabel = 'Data Envio'
      FieldName = 'DATA_ENV_PED'
    end
    object cdsPedidoTIPO_PED: TStringField
      DisplayLabel = 'Tipo Pedido'
      FieldName = 'TIPO_PED'
      FixedChar = True
      Size = 7
    end
    object cdsPedidoSTATUS_PED: TStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS_PED'
      FixedChar = True
      Size = 10
    end
    object cdsPedidoDATA_CHG_PED: TDateTimeField
      DisplayLabel = 'Data de Efetiva'#231#227'o'
      FieldName = 'DATA_CHG_PED'
    end
    object cdsPedidoVAL_TOT_PED: TFloatField
      DisplayLabel = 'Valor Total'
      FieldName = 'VAL_TOT_PED'
    end
    object cdsPedidoATIVO: TIntegerField
      Tag = 1
      FieldName = 'ATIVO'
      Visible = False
    end
    object cdsPedidoADD_PRODUCAO: TStringField
      Tag = 1
      FieldName = 'ADD_PRODUCAO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object cdsPedidoSTATUS_PRODUCAO: TStringField
      Tag = 1
      FieldName = 'STATUS_PRODUCAO'
      Visible = False
      Size = 10
    end
    object cdsPedidoNUM_PRODUCAO: TIntegerField
      Tag = 1
      FieldName = 'NUM_PRODUCAO'
      Visible = False
    end
    object cdsPedidoCOD_EMPRESA_PRODUCAO: TIntegerField
      Tag = 1
      FieldName = 'COD_EMPRESA_PRODUCAO'
      Visible = False
    end
    object cdsPedidoCOD_COND_PAG: TIntegerField
      DisplayLabel = 'Cod Cond Pag'
      FieldName = 'COD_COND_PAG'
    end
    object cdsPedidoFORMPAG: TBlobField
      Tag = 1
      FieldName = 'FORMPAG'
      Visible = False
      Size = 8
    end
    object cdsPedidoVLFORMPAG: TBlobField
      Tag = 1
      FieldName = 'VLFORMPAG'
      Visible = False
      Size = 8
    end
    object cdsPedidoFRETE_BASE_IPI: TStringField
      Tag = 1
      FieldName = 'FRETE_BASE_IPI'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object cdsPedidoIPI_BASE_ICM: TStringField
      Tag = 1
      FieldName = 'IPI_BASE_ICM'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object cdsPedidoNUM_COTACAO: TIntegerField
      Tag = 1
      FieldName = 'NUM_COTACAO'
      Visible = False
    end
    object cdsPedidoOBS: TMemoField
      Tag = 1
      FieldName = 'OBS'
      Visible = False
      BlobType = ftMemo
      Size = 8
    end
    object cdsPedidoDATA_PED: TDateTimeField
      DisplayLabel = 'Data Cadastro'
      FieldName = 'DATA_PED'
    end
  end
  object qrPedvenda: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transConsulta
    SQL.Strings = (
      'select * from pedvenda')
    Left = 1984
    Top = 21
  end
  object dspPedvenda: TDataSetProvider
    DataSet = qrPedvenda
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1984
    Top = 65
  end
  object cdsPedvenda: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspPedvenda'
    BeforeOpen = cdsPGrBeforeOpen
    Left = 1984
    Top = 112
    object cdsPedvendaNPED: TIntegerField
      FieldName = 'NPED'
      Required = True
    end
    object cdsPedvendaTIPO: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Required = True
      FixedChar = True
      Size = 3
    end
    object cdsPedvendaCOD_CLIENTE: TIntegerField
      DisplayLabel = 'Cod Cliente'
      FieldName = 'COD_CLIENTE'
      Required = True
    end
    object cdsPedvendaCOD_VENDEDOR: TIntegerField
      DisplayLabel = 'Cod Vendedor'
      FieldName = 'COD_VENDEDOR'
      Required = True
    end
    object cdsPedvendaCOD_COND_PAG: TIntegerField
      DisplayLabel = 'Cod Cond Pag'
      FieldName = 'COD_COND_PAG'
    end
    object cdsPedvendaDATA_PED: TDateTimeField
      DisplayLabel = 'Data Ped'
      FieldName = 'DATA_PED'
    end
    object cdsPedvendaDATA_FECH: TDateTimeField
      DisplayLabel = 'Data Fech'
      FieldName = 'DATA_FECH'
    end
    object cdsPedvendaVALOR_TOTAL: TFloatField
      DisplayLabel = 'Valor Total'
      FieldName = 'VALOR_TOTAL'
    end
    object cdsPedvendaDESCONTO: TFloatField
      DisplayLabel = 'Desconto'
      FieldName = 'DESCONTO'
    end
    object cdsPedvendaOBS_PED: TStringField
      DisplayLabel = 'Obs Ped'
      FieldName = 'OBS_PED'
      Size = 50
    end
    object cdsPedvendaSTATUS_PED: TStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS_PED'
      Size = 10
    end
    object cdsPedvendaTIPV: TStringField
      DisplayLabel = 'TipV'
      FieldName = 'TIPV'
      FixedChar = True
      Size = 1
    end
    object cdsPedvendaPLACA: TStringField
      DisplayLabel = 'Placa'
      FieldName = 'PLACA'
      Size = 10
    end
    object cdsPedvendaCHASSI: TStringField
      DisplayLabel = 'Chassi'
      FieldName = 'CHASSI'
      Size = 17
    end
    object cdsPedvendaKM_V: TIntegerField
      DisplayLabel = 'KM'
      FieldName = 'KM_V'
    end
    object cdsPedvendaTOT_PROD: TFloatField
      DisplayLabel = 'Tot Prod'
      FieldName = 'TOT_PROD'
    end
    object cdsPedvendaTOT_SERV: TFloatField
      DisplayLabel = 'Tot Serv'
      FieldName = 'TOT_SERV'
    end
  end
  object qrProdOutEmp: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transConsulta
    SQL.Strings = (
      'select pr.num_fab_prod,en.IDENTIFICACAO_EMP,en.cod_empresa,'
      
        'pr.est_f+pr.est_r est_f,(Select sum(pp.quant_ped_item) from pedv' +
        'enda_prod pp,pedvenda p where'
      
        'p.tipo='#39'OS'#39' and pp.cod_prod = pr.Cod_prod and pp.grupo_prod = pr' +
        '.grupo_prod and pp.nped = p.nped and pp.tipo = p.tipo'
      
        'and p.data_fech is null and p.COD_EMPRESA = pr.cod_empresa and p' +
        '.ATIVO=1'
      
        'and p.COD_EMPRESA = pp.COD_EMPRESA and ((pp.status is null) or (' +
        'pp.status <> '#39'CANCELADO'#39'))) PENDOS,(Select sum(pp.quant_ped_item' +
        ') from pedvenda_prod pp,pedvenda p where'
      
        'p.tipo='#39'REQ'#39' and pp.cod_prod = pr.cod_prod and pp.grupo_prod = p' +
        'r.grupo_prod and pp.nped = p.nped and pp.tipo = p.tipo'
      
        'and p.data_fech is null and p.COD_EMPRESA = pr.cod_empresa and p' +
        '.ATIVO=1 and p.COD_EMPRESA = pp.COD_EMPRESA and ((pp.status is n' +
        'ull) or (pp.status <> '#39'CANCELADO'#39'))) PENDREQ,'
      
        '(select sum(coalesce(c.quant,0)) from controle_almoxarifado c wh' +
        'ere c.grupo_prod = pr.grupo_prod'
      
        'and c.cod_prod = pr.cod_prod and c.cod_empresa = pr.cod_empresa)' +
        ' PENDALMOX,'
      
        '(select sum(coalesce(pi.quantidade_utilizada,0) + coalesce(pi.qu' +
        'antidade_perda,0)) from producao pd'
      
        'inner join producao_item_indice pi on pi.cod_producao = pd.cod_p' +
        'roducao and pi.cod_empresa = pd.cod_empresa'
      
        'where pd.data_fechamento is null and pd.cod_empresa = pr.cod_emp' +
        'resa'
      
        'and pi.grupo_prod = PR.grupo_prod and pi.cod_prod = PR.cod_prod)' +
        ' PENDPRODUCAO,'
      
        '(pr.est_f-coalesce((Select sum(pp.quant_ped_item) from pedvenda_' +
        'prod pp,pedvenda p where'
      
        'p.tipo<>'#39'ORC'#39' and pp.cod_prod = pr.cod_prod and pp.grupo_prod = ' +
        'pr.grupo_prod and pp.nped = p.nped and pp.tipo = p.tipo'
      
        'and p.data_fech is null and p.COD_EMPRESA = pr.cod_empresa and p' +
        '.ATIVO=1 and p.COD_EMPRESA = pp.COD_EMPRESA and ((pp.status is n' +
        'ull) or (pp.status <> '#39'CANCELADO'#39'))),0)'
      
        '-coalesce((select sum(coalesce(pi.quantidade_utilizada,0) + coal' +
        'esce(pi.quantidade_perda,0)) from producao pd'
      
        'inner join producao_item_indice pi on pi.cod_producao = pd.cod_p' +
        'roducao and pi.cod_empresa = pd.cod_empresa'
      
        'where pd.data_fechamento is null and pd.cod_empresa = pr.cod_emp' +
        'resa'
      
        'and pi.grupo_prod = PR.grupo_prod and pi.cod_prod = PR.cod_prod)' +
        ',0)'
      
        '- coalesce( (select sum(coalesce(c.quant,0)) from controle_almox' +
        'arifado c where c.grupo_prod = pr.grupo_prod'
      
        'and c.cod_prod = pr.cod_prod and c.cod_empresa = pr.cod_empresa)' +
        ', 0) '
      
        ') SaldoLiquido,pr.grupo_prod,pr.cod_prod, pr.PREC_TAB_PROD, pr.P' +
        'REC_30_PROD, pr.PREC_60_PROD, pr.PREC_90_PROD, pr.PREC_PUBLICO '
      'from produtos pr,empresa en where pr.grupo_prod = 0'
      'and pr.cod_prod = '#39#39
      'and pr.cod_empresa <>  1  and pr.cod_empresa = en.cod_empresa')
    Left = 1382
    Top = 214
  end
  object dspProdOutEmp: TDataSetProvider
    DataSet = qrProdOutEmp
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 1386
    Top = 268
  end
  object cdsProdOutEmp: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspProdOutEmp'
    ReadOnly = True
    BeforeOpen = cdsPGrBeforeOpen
    Left = 1388
    Top = 325
    object cdsProdOutEmpNUM_FAB_PROD: TStringField
      DisplayLabel = 'N'#250'mero de Fabrica'#231#227'o'
      FieldName = 'NUM_FAB_PROD'
      FixedChar = True
    end
    object cdsProdOutEmpIDENTIFICACAO_EMP: TStringField
      DisplayLabel = 'Empresa'
      FieldName = 'IDENTIFICACAO_EMP'
      Size = 64
    end
    object cdsProdOutEmpCOD_EMPRESA: TIntegerField
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsProdOutEmpEST_F: TFloatField
      DisplayLabel = 'Estoque Fisico'
      FieldName = 'EST_F'
    end
    object cdsProdOutEmpPENDOS: TFloatField
      DisplayLabel = 'Pendencias OS'
      FieldName = 'PENDOS'
    end
    object cdsProdOutEmpPENDREQ: TFloatField
      DisplayLabel = 'Pendencias REQ'
      FieldName = 'PENDREQ'
    end
    object cdsProdOutEmpPENDALMOX: TFloatField
      DisplayLabel = 'Pendencias Carrinho Vendedor'
      FieldName = 'PENDALMOX'
    end
    object cdsProdOutEmpPENDPRODUCAO: TFloatField
      DisplayLabel = 'Pendencias Producao'
      FieldName = 'PENDPRODUCAO'
    end
    object cdsProdOutEmpSALDOLIQUIDO: TFloatField
      DisplayLabel = 'Estoque Disponivel'
      FieldName = 'SALDOLIQUIDO'
    end
    object cdsProdOutEmpGRUPO_PROD: TIntegerField
      DisplayLabel = 'Grupo'
      FieldName = 'GRUPO_PROD'
      Required = True
    end
    object cdsProdOutEmpCOD_PROD: TStringField
      DisplayLabel = 'Cod Produto'
      FieldName = 'COD_PROD'
      Required = True
      FixedChar = True
      Size = 6
    end
    object cdsProdOutEmpPREC_TAB_PROD: TFloatField
      DisplayLabel = 'Preco Tabela'
      FieldName = 'PREC_TAB_PROD'
      EditFormat = '#.###.000'
    end
    object cdsProdOutEmpPREC_30_PROD: TFloatField
      DisplayLabel = 'Preco 30 dias'
      FieldName = 'PREC_30_PROD'
      EditFormat = '#.###.000'
    end
    object cdsProdOutEmpPREC_60_PROD: TFloatField
      DisplayLabel = 'Preco 60 dias'
      FieldName = 'PREC_60_PROD'
      EditFormat = '#.###.000'
    end
    object cdsProdOutEmpPREC_90_PROD: TFloatField
      DisplayLabel = 'Preco 90 dias'
      FieldName = 'PREC_90_PROD'
      EditFormat = '#.###.000'
    end
    object cdsProdOutEmpPREC_PUBLICO: TFloatField
      DisplayLabel = 'Preco Atacado'
      FieldName = 'PREC_PUBLICO'
    end
  end
  object qrPesqTpCliente: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transConsulta
    SQL.Strings = (
      'select * from tipos_clientes')
    Left = 2064
    Top = 18
  end
  object dspPesqTpCliente: TDataSetProvider
    DataSet = qrPesqTpCliente
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 2064
    Top = 66
  end
  object cdsPesqTpCliente: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspPesqTpCliente'
    BeforeOpen = cdsPGrBeforeOpen
    Left = 2065
    Top = 114
    object cdsPesqTpClienteCODIGO_TIPO: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO_TIPO'
      Required = True
    end
    object cdsPesqTpClienteDESCRICAO_TIPO: TStringField
      DisplayLabel = 'Descricao'
      FieldName = 'DESCRICAO_TIPO'
      FixedChar = True
      Size = 30
    end
  end
  object qrPesqPromocaoP: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transConsulta
    SQL.Strings = (
      'SELECT CADPROMOCAO.COD_PROMOCAO,  CADPROMOCAO.COD_EMPRESA,'
      'CADPROMOCAO.DESCR_PROMOCAO, CADPROMOCAO.ORDEM,'
      
        'CADPROMOCAO.DATA_INI, CADPROMOCAO.DATA_FIM, CADPROMOCAO.HORA_INI' +
        ', CADPROMOCAO.HORA_FIM FROM CADPROMOCAO')
    Left = 1480
    Top = 234
  end
  object dspPesqPromocaoP: TDataSetProvider
    DataSet = qrPesqPromocaoP
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 1480
    Top = 282
  end
  object cdsPesqPromocaoP: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspPesqPromocaoP'
    BeforeOpen = cdsPGrBeforeOpen
    Left = 1481
    Top = 330
    object cdsPesqPromocaoPCOD_PROMOCAO: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'COD_PROMOCAO'
    end
    object cdsPesqPromocaoPCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Visible = False
    end
    object cdsPesqPromocaoPDESCR_PROMOCAO: TStringField
      DisplayLabel = 'Descricao'
      FieldName = 'DESCR_PROMOCAO'
      Size = 128
    end
    object cdsPesqPromocaoPORDEM: TIntegerField
      DisplayLabel = 'Ordem'
      FieldName = 'ORDEM'
    end
    object cdsPesqPromocaoPDATA_INI: TDateTimeField
      DisplayLabel = 'Data ini'
      FieldName = 'DATA_INI'
    end
    object cdsPesqPromocaoPDATA_FIM: TDateTimeField
      DisplayLabel = 'Data Fim'
      FieldName = 'DATA_FIM'
    end
    object cdsPesqPromocaoPHORA_INI: TStringField
      DisplayLabel = 'Hora ini'
      FieldName = 'HORA_INI'
      Size = 8
    end
    object cdsPesqPromocaoPHORA_FIM: TStringField
      DisplayLabel = 'Hora fim'
      FieldName = 'HORA_FIM'
      Size = 8
    end
  end
  object qrPesqTabelaP: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transConsulta
    SQL.Strings = (
      'SELECT CADTABELA.COD_PROMOCAO,  CADTABELA.COD_EMPRESA,'
      'CADTABELA.DESCR_PROMOCAO FROM CADTABELA')
    Left = 1608
    Top = 234
  end
  object dspPesqTabelaP: TDataSetProvider
    DataSet = qrPesqTabelaP
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 1608
    Top = 282
  end
  object cdsPesqTabelaP: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspPesqTabelaP'
    BeforeOpen = cdsPGrBeforeOpen
    Left = 1609
    Top = 330
    object cdsPesqTabelaPCOD_PROMOCAO: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'COD_PROMOCAO'
    end
    object cdsPesqTabelaPCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Visible = False
    end
    object cdsPesqTabelaPDESCR_PROMOCAO: TStringField
      DisplayLabel = 'Descricao'
      FieldName = 'DESCR_PROMOCAO'
      Size = 128
    end
  end
  object IBQuery1: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transConsulta
    SQL.Strings = (
      'SELECT CADPROMOCAO.COD_PROMOCAO,  CADPROMOCAO.COD_EMPRESA,'
      'CADPROMOCAO.DESCR_PROMOCAO, CADPROMOCAO.ORDEM,'
      
        'CADPROMOCAO.DATA_INI, CADPROMOCAO.DATA_FIM, CADPROMOCAO.HORA_INI' +
        ', CADPROMOCAO.HORA_FIM FROM CADPROMOCAO')
    Left = 1672
    Top = 234
  end
  object qrPesqTabelaPromocaoP: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transConsulta
    SQL.Strings = (
      'SELECT CADPROMOCAO.COD_PROMOCAO,  CADPROMOCAO.COD_EMPRESA,'
      'CADPROMOCAO.DESCR_PROMOCAO, CADPROMOCAO.ORDEM,'
      
        'CADPROMOCAO.DATA_INI, CADPROMOCAO.DATA_FIM, CADPROMOCAO.HORA_INI' +
        ', CADPROMOCAO.HORA_FIM FROM CADPROMOCAO')
    Left = 1480
    Top = 394
  end
  object dspPesqTabelaPromocaoP: TDataSetProvider
    DataSet = qrPesqTabelaPromocaoP
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 1480
    Top = 442
  end
  object cdsPesqTabelaPromocaoP: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspPesqTabelaP'
    BeforeOpen = cdsPGrBeforeOpen
    Left = 1481
    Top = 490
    object IntegerField12: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'COD_PROMOCAO'
    end
    object IntegerField13: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Visible = False
    end
    object StringField21: TStringField
      DisplayLabel = 'Descricao'
      FieldName = 'DESCR_PROMOCAO'
      Size = 128
    end
    object IntegerField14: TIntegerField
      DisplayLabel = 'Ordem'
      FieldName = 'ORDEM'
    end
    object DateTimeField11: TDateTimeField
      DisplayLabel = 'Data ini'
      FieldName = 'DATA_INI'
    end
    object DateTimeField12: TDateTimeField
      DisplayLabel = 'Data Fim'
      FieldName = 'DATA_FIM'
    end
    object StringField22: TStringField
      DisplayLabel = 'Hora ini'
      FieldName = 'HORA_INI'
      Size = 8
    end
    object StringField23: TStringField
      DisplayLabel = 'Hora fim'
      FieldName = 'HORA_FIM'
      Size = 8
    end
  end
  object qrPesqServicosEmp: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transConsulta
    SQL.Strings = (
      'SELECT * FROM SERVICOS_EMP'
      'where ativo=1')
    Left = 955
    Top = 200
  end
  object dspServicosEmp: TDataSetProvider
    DataSet = qrPesqServicosEmp
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 955
    Top = 247
  end
  object cdsPServicosEmp: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspTipoServ'
    BeforeOpen = cdsPGrBeforeOpen
    Left = 955
    Top = 304
    object IntegerField15: TIntegerField
      DisplayLabel = 'Cod Servi'#231'o'
      FieldName = 'COD_SERVICO'
      Required = True
    end
    object StringField24: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESC_SERVICO'
      FixedChar = True
      Size = 60
    end
    object FloatField13: TFloatField
      DisplayLabel = 'Valor do Servi'#231'o'
      FieldName = 'VALOR_SERVICO'
    end
    object StringField25: TStringField
      DisplayLabel = 'M'#227'o de obra Honda'
      FieldName = 'SHONDA'
      FixedChar = True
      Size = 1
    end
    object StringField26: TStringField
      DisplayLabel = 'Altera Desc ou valor no Cupom'
      FieldName = 'ALTCOD'
      FixedChar = True
      Size = 1
    end
    object DateTimeField13: TDateTimeField
      DisplayLabel = 'Data Cadastro'
      FieldName = 'DATA_CAD_TIPO'
    end
    object DateTimeField14: TDateTimeField
      DisplayLabel = 'Data Altera'#231#227'o'
      FieldName = 'DATA_MOD_TIPO'
    end
    object StringField27: TStringField
      DisplayLabel = 'Tipo de servi'#231'o'
      FieldName = 'STIPO'
      FixedChar = True
      Size = 1
    end
    object FloatField14: TFloatField
      FieldName = 'TMO'
    end
    object FloatField15: TFloatField
      DisplayLabel = 'Al'#237'quota de ISS'
      FieldName = 'ALIQ_ISS'
    end
    object IntegerField16: TIntegerField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
    object IntegerField17: TIntegerField
      DisplayLabel = 'Cod Esp'#233'cie Segmenta'#231#227'o Serv.'
      FieldName = 'COD_ESPE_SEG'
    end
    object FloatField16: TFloatField
      DisplayLabel = 'CFOP'
      FieldName = 'CODIGO_NOP'
    end
    object StringField28: TStringField
      DisplayLabel = 'TMO Simult'#226'neo'
      FieldName = 'TMOSERVSIMULT'
      FixedChar = True
      Size = 1
    end
    object StringField29: TStringField
      DisplayLabel = 'Altera Descri'#231#227'o'
      FieldName = 'ALT_DESC'
      FixedChar = True
      Size = 1
    end
    object StringField30: TStringField
      DisplayLabel = 'Servi'#231'o ou Produto de Terceiro'
      FieldName = 'SERV_PROP_TERC'
      FixedChar = True
      Size = 1
    end
    object StringField31: TStringField
      DisplayLabel = 'Servi'#231'o Isento'
      FieldName = 'ISENTO_SERV'
      FixedChar = True
      Size = 1
    end
    object StringField32: TStringField
      DisplayLabel = 'N'#227'o Incid'#234'ncia no Servi'#231'o'
      FieldName = 'N_INCIDENCIA_SERV'
      FixedChar = True
      Size = 1
    end
    object StringField33: TStringField
      DisplayLabel = 'Arredondar ou Truncar'
      FieldName = 'ARREDONDAR_TRUNCAR'
      FixedChar = True
      Size = 1
    end
    object StringField34: TStringField
      DisplayLabel = 'Classe do Servi'#231'o'
      FieldName = 'CLASSE_SERV'
      FixedChar = True
      Size = 1
    end
    object StringField35: TStringField
      DisplayLabel = 'Volume da demanda'
      FieldName = 'CLASSE_QTD'
      FixedChar = True
      Size = 2
    end
    object StringField36: TStringField
      DisplayLabel = 'Popularidade'
      FieldName = 'CLASSE_POP'
      FixedChar = True
      Size = 2
    end
    object StringField37: TStringField
      DisplayLabel = 'Atualidade'
      FieldName = 'CLASSE_ATL'
      FixedChar = True
      Size = 2
    end
    object FloatField17: TFloatField
      DisplayLabel = 'Demanda M'#233'dia Di'#225'ria'
      FieldName = 'DMD'
      DisplayFormat = '##0.0000'
    end
  end
  object qrPesqPart: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transConsulta
    SQL.Strings = (
      'SELECT * FROM PARTICIPANTE'
      'where ativo = 1')
    Left = 90
    Top = 198
  end
  object dspPart: TDataSetProvider
    DataSet = qrPesqPart
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 87
    Top = 252
  end
  object cdsPPart: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspPart'
    ReadOnly = True
    BeforeOpen = cdsPGrBeforeOpen
    Left = 89
    Top = 309
    object cdsPPartCOD_PARTICIPANTE: TIntegerField
      DisplayLabel = 'Cod Participante'
      FieldName = 'COD_PARTICIPANTE'
      Required = True
    end
    object cdsPPartCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
      Visible = False
    end
    object cdsPPartCODIGO_UF: TSmallintField
      DisplayLabel = 'Cod UF'
      FieldName = 'CODIGO_UF'
    end
    object cdsPPartCOD_CIDADE: TSmallintField
      DisplayLabel = 'Cod Cidade'
      FieldName = 'COD_CIDADE'
    end
    object cdsPPartCOD_BAIRRO: TSmallintField
      DisplayLabel = 'Cod Bairro'
      FieldName = 'COD_BAIRRO'
    end
    object cdsPPartNOME_PARTICIPANTE: TStringField
      DisplayLabel = 'Participante'
      FieldName = 'NOME_PARTICIPANTE'
      Size = 35
    end
    object cdsPPartEND_PARTICIPANTE: TStringField
      DisplayLabel = 'Endereco'
      FieldName = 'END_PARTICIPANTE'
      Size = 35
    end
    object cdsPPartBAIRRO_PARTICIPANTE: TStringField
      DisplayLabel = 'Bairro'
      FieldName = 'BAIRRO_PARTICIPANTE'
      Size = 35
    end
    object cdsPPartCIDADE_PARTICIPANTE: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'CIDADE_PARTICIPANTE'
      Size = 35
    end
    object cdsPPartSIGLA_UF: TStringField
      DisplayLabel = 'Sigla'
      FieldName = 'SIGLA_UF'
      FixedChar = True
      Size = 2
    end
    object cdsPPartCEP_PARTICIPANTE: TStringField
      DisplayLabel = 'Cep'
      FieldName = 'CEP_PARTICIPANTE'
      FixedChar = True
      Size = 9
    end
    object cdsPPartFONE_PARTICIPANTE: TStringField
      DisplayLabel = 'Fone'
      FieldName = 'FONE_PARTICIPANTE'
      FixedChar = True
      Size = 14
    end
    object cdsPPartCPF_PARTICIPANTE: TStringField
      DisplayLabel = 'CPF'
      FieldName = 'CPF_PARTICIPANTE'
      FixedChar = True
      Size = 11
    end
    object cdsPPartOBS_PARTICIPANTE: TMemoField
      DisplayLabel = 'Observacao'
      FieldName = 'OBS_PARTICIPANTE'
      OnGetText = cdsPPartOBS_PARTICIPANTEGetText
      BlobType = ftMemo
      Size = 8
    end
    object cdsPPartDATA_MOD_PART: TDateTimeField
      DisplayLabel = 'Data Modificacao'
      FieldName = 'DATA_MOD_PART'
    end
    object cdsPPartDATA_CAD_PART: TDateTimeField
      DisplayLabel = 'Data Cadastro'
      FieldName = 'DATA_CAD_PART'
    end
    object cdsPPartDAT_NASC_PART: TDateTimeField
      DisplayLabel = 'Data Nascimento'
      FieldName = 'DAT_NASC_PART'
    end
    object cdsPPartEMAIL: TStringField
      DisplayLabel = 'Email'
      FieldName = 'EMAIL'
      Size = 128
    end
    object cdsPPartFONE_CONTATO: TStringField
      DisplayLabel = 'Fone Contato'
      FieldName = 'FONE_CONTATO'
      FixedChar = True
      Size = 40
    end
    object cdsPPartATIVO: TIntegerField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
      Visible = False
    end
    object cdsPPartPC_VEND_PROD: TFloatField
      DisplayLabel = 'Porc Venda Produto'
      FieldName = 'PC_VEND_PROD'
    end
  end
  object qrProdutoAcabado: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transConsulta
    SQL.Strings = (
      
        'select produtos.grupo_prod, produtos.cod_prod, produtos.cod_empr' +
        'esa,'
      'produtos.num_fab_prod, produtos.descr_prod,'
      'coalesce((select estoque from getestoque_recursivo('
      '    produtos.grupo_prod,'
      '    produtos.cod_prod,'
      '    produtos.cod_empresa,'
      '    cod_grade_prod.cod_grade)'
      '), 0) qtde_produzir,'
      
        'iif(coalesce(cod_grade_prod.cod_grade, 0) > 0, coalesce(cod_grad' +
        'e_prod.qtde, 0), coalesce(produtos.est_f, 0)) est_f,'
      'coalesce((select estoque from getestoquedisponivel ('
      '    produtos.grupo_prod,'
      '    produtos.cod_prod,'
      
        '    iif(coalesce(cod_grade_prod.cod_grade, 0) > 0, coalesce(cod_' +
        'grade_prod.cod_grade, 0), 0),'
      '    produtos.cod_empresa,'
      '    0,'
      '    '#39#39','
      '    0,'
      '    0)'
      '), 0) estoque,'
      'coalesce(cod_grade_prod.cod_grade, 0) cod_grade,  '
      
        'iif(coalesce(cod_grade_prod.cod_grade, 0) > 0, coalesce(grade.de' +
        'scricao, '#39'SEM GRADE'#39'), '#39'SEM GRADE'#39') grade,'
      
        'coalesce((select first 1 produtos_pdc_var.id_ind from produtos_p' +
        'dc_var'
      
        '          where produtos_pdc_var.grupo_prod = produtos.grupo_pro' +
        'd'
      '          and produtos_pdc_var.cod_prod = produtos.cod_prod'
      
        '          and produtos_pdc_var.cod_empresa = produtos.cod_empres' +
        'a'
      
        '                    and produtos_pdc_var.cod_grade = coalesce(co' +
        'd_grade_prod.cod_grade, 0)), 0) id_ind from produtos'
      'left join cod_grade_prod on'
      '    cod_grade_prod.grupo_prod = produtos.grupo_prod'
      '    and cod_grade_prod.cod_prod = produtos.cod_prod'
      '    and cod_grade_prod.cod_empresa = produtos.cod_empresa'
      'left join grade on '
      '    grade.cod_grade = cod_grade_prod.cod_grade '
      '    and grade.cod_empresa = cod_grade_prod.cod_empresa '
      'where produtos.grupo_prod = :pgrupo_prod'
      'and produtos.cod_prod = :pcod_prod'
      'and produtos.cod_empresa = :pcod_empresa')
    Left = 1795
    Top = 232
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pgrupo_prod'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pcod_prod'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pcod_empresa'
        ParamType = ptUnknown
      end>
  end
  object dspProdutoAcabado: TDataSetProvider
    DataSet = qrProdutoAcabado
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1795
    Top = 280
  end
  object cdsProdutoAcabado: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspProdutoAcabado'
    BeforeOpen = cdsPGrBeforeOpen
    Left = 1795
    Top = 328
    object cdsProdutoAcabadoGRUPO_PROD: TIntegerField
      DisplayLabel = 'Grupo Prod'
      FieldName = 'GRUPO_PROD'
      Required = True
    end
    object cdsProdutoAcabadoCOD_PROD: TStringField
      DisplayLabel = 'Cod Prod'
      FieldName = 'COD_PROD'
      Required = True
      FixedChar = True
      Size = 6
    end
    object cdsProdutoAcabadoCOD_EMPRESA: TIntegerField
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsProdutoAcabadoNUM_FAB_PROD: TStringField
      DisplayLabel = 'Numero Fabricante'
      FieldName = 'NUM_FAB_PROD'
      FixedChar = True
    end
    object cdsProdutoAcabadoDESCR_PROD: TStringField
      DisplayLabel = 'Descr Prod'
      FieldName = 'DESCR_PROD'
      FixedChar = True
      Size = 75
    end
    object cdsProdutoAcabadoQTDE_PRODUZIR: TFloatField
      DisplayLabel = 'Qtde Produzir'
      FieldName = 'QTDE_PRODUZIR'
    end
    object cdsProdutoAcabadoEST_F: TFloatField
      DisplayLabel = 'Estoque F'#237'sico'
      FieldName = 'EST_F'
    end
    object cdsProdutoAcabadoESTOQUE: TFloatField
      DisplayLabel = 'Estoque Dispon'#237'vel'
      FieldName = 'ESTOQUE'
    end
    object cdsProdutoAcabadoCOD_GRADE: TIntegerField
      DisplayLabel = 'Cod Grade'
      FieldName = 'COD_GRADE'
    end
    object cdsProdutoAcabadoGRADE: TStringField
      DisplayLabel = 'Grade'
      FieldName = 'GRADE'
      Size = 32
    end
    object cdsProdutoAcabadoGRADE1: TStringField
      FieldName = 'GRADE1'
      Size = 32
    end
    object cdsProdutoAcabadoID_IND: TIntegerField
      FieldName = 'ID_IND'
    end
  end
  object dsProdutoAcabado: TDataSource
    DataSet = cdsProdutoAcabado
    Left = 1792
    Top = 384
  end
  object qrMateriasPrimasAcabado: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transConsulta
    SQL.Strings = (
      
        'select produtos.grupo_prod, produtos.cod_prod, produtos.cod_empr' +
        'esa,'
      'produtos.num_fab_prod, produtos.descr_prod,'
      'coalesce(indice_tecnico.quant, 0) quant, '
      '(coalesce((select estoque from getestoquedisponivel ('
      '    produtos.grupo_prod,'
      '    produtos.cod_prod,'
      
        '    iif(coalesce(cod_grade_prod.cod_grade, 0) > 0, coalesce(cod_' +
        'grade_prod.cod_grade, 0), 0),'
      '    produtos.cod_empresa,'
      '    0,'
      '    '#39#39','
      '    0,'
      '    0)'
      '), 0) - coalesce(indice_tecnico.quant, 0) ) qtde_produzir,'
      'coalesce(produtos.est_f, 0) est_f,'
      'coalesce((select estoque from getestoquedisponivel ('
      '    produtos.grupo_prod,'
      '    produtos.cod_prod,'
      
        '    iif(coalesce(cod_grade_prod.cod_grade, 0) > 0, coalesce(cod_' +
        'grade_prod.cod_grade, 0), 0),'
      '    produtos.cod_empresa,'
      '    0,'
      '    '#39#39','
      '    0,'
      '    0)'
      '), 0) estoque,'
      
        'iif(coalesce(cod_grade_prod.cod_grade,  0) > 0, coalesce(cod_gra' +
        'de_prod.cod_grade,  0), 0) cod_grade,'
      
        'iif(coalesce(cod_grade_prod.cod_grade,  0) > 0, coalesce(grade.d' +
        'escricao, '#39'SEM GRADE'#39'), '#39#39') grade'
      ' from indice_tecnico'
      'inner join produtos on'
      '    produtos.grupo_prod = indice_tecnico.grupo_prod_mprima'
      '    and produtos.cod_prod = indice_tecnico.cod_prod_mprima'
      '    and produtos.cod_empresa = indice_tecnico.cod_empresa'
      'left join cod_grade_prod on'
      '    cod_grade_prod.grupo_prod = produtos.grupo_prod'
      '    and cod_grade_prod.cod_prod = produtos.cod_prod'
      '    and cod_grade_prod.cod_empresa = produtos.cod_empresa'
      'left join grade on'
      '    grade.cod_grade = cod_grade_prod.cod_grade'
      '    and grade.cod_empresa = cod_grade_prod.cod_empresa'
      'where indice_tecnico.grupo_prod_acabado = 1'
      'and indice_tecnico.cod_prod_acabado = '#39'00124'#39
      'and indice_tecnico.cod_empresa = 1')
    Left = 1979
    Top = 240
  end
  object dspMateriasPrimasAcabado: TDataSetProvider
    DataSet = qrMateriasPrimasAcabado
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1979
    Top = 288
  end
  object cdsMateriasPrimasAcabado: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspMateriasPrimasAcabado'
    BeforeOpen = cdsPGrBeforeOpen
    Left = 1979
    Top = 336
    object cdsMateriasPrimasAcabadoGRUPO_PROD: TIntegerField
      DisplayLabel = 'Grupo Prod'
      FieldName = 'GRUPO_PROD'
      Required = True
    end
    object cdsMateriasPrimasAcabadoCOD_PROD: TStringField
      DisplayLabel = 'Cod Prod'
      FieldName = 'COD_PROD'
      Required = True
      FixedChar = True
      Size = 6
    end
    object cdsMateriasPrimasAcabadoCOD_EMPRESA: TIntegerField
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsMateriasPrimasAcabadoNUM_FAB_PROD: TStringField
      DisplayLabel = 'Numero Fabricante'
      FieldName = 'NUM_FAB_PROD'
      FixedChar = True
    end
    object cdsMateriasPrimasAcabadoDESCR_PROD: TStringField
      DisplayLabel = 'Descr Prod'
      DisplayWidth = 75
      FieldName = 'DESCR_PROD'
      FixedChar = True
      Size = 75
    end
    object cdsMateriasPrimasAcabadoQUANT: TFloatField
      DisplayLabel = 'Qtde Prima/Em/Emb'
      FieldName = 'QUANT'
    end
    object cdsMateriasPrimasAcabadoQTDE_PRODUZIR: TFloatField
      DisplayLabel = 'Qtde Produzir'
      FieldName = 'QTDE_PRODUZIR'
    end
    object cdsMateriasPrimasAcabadoEST_F: TFloatField
      DisplayLabel = 'Estoque F'#237'sico'
      FieldName = 'EST_F'
    end
    object cdsMateriasPrimasAcabadoESTOQUE: TFloatField
      DisplayLabel = 'Estoque Dispon'#237'vel'
      FieldName = 'ESTOQUE'
    end
    object cdsMateriasPrimasAcabadoCOD_GRADE: TIntegerField
      DisplayLabel = 'Cod Grade'
      FieldName = 'COD_GRADE'
    end
    object cdsMateriasPrimasAcabadoGRADE: TStringField
      DisplayLabel = 'Grade'
      FieldName = 'GRADE'
      Size = 32
    end
    object cdsMateriasPrimasAcabadoGRADE1: TStringField
      FieldName = 'GRADE1'
      Size = 32
    end
    object cdsMateriasPrimasAcabadoID_IND: TIntegerField
      FieldName = 'ID_IND'
    end
    object cdsMateriasPrimasAcabadoID_IND_IT: TIntegerField
      FieldName = 'ID_IND_IT'
    end
  end
  object dsMateriasPrimasAcabado: TDataSource
    DataSet = cdsMateriasPrimasAcabado
    Left = 1976
    Top = 392
  end
  object qrComissaoFaixaDesc: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = dtmAtivo.IbTransCol
    SQL.Strings = (
      'select * FROM COMISSAO_FAIXA_DESCONTO'
      'WHERE TIPO = '#39'ESPECIFICA'#39)
    Left = 48
    Top = 526
  end
  object dspComissaoFaixaDesc: TDataSetProvider
    DataSet = qrComissaoFaixaDesc
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 48
    Top = 574
  end
  object cdsComissaoFaixaDesc: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspComissaoFaixaDesc'
    Left = 48
    Top = 622
    object cdsComissaoFaixaDescCODIGO: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO'
      Required = True
    end
    object cdsComissaoFaixaDescCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
      Visible = False
    end
    object cdsComissaoFaixaDescDESCRICAO: TStringField
      DisplayLabel = 'Descricao'
      FieldName = 'DESCRICAO'
      Required = True
      Size = 50
    end
    object cdsComissaoFaixaDescTIPO: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Required = True
      Size = 10
    end
    object cdsComissaoFaixaDescATIVO: TIntegerField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
      Visible = False
    end
  end
  object IBQuery2: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = dtmAtivo.IbTransCol
    SQL.Strings = (
      'select * from COND_PAG')
    Left = 1045
    Top = 200
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = IBQuery2
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1045
    Top = 248
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspCondPag'
    BeforeOpen = cdsPGrBeforeOpen
    Left = 1045
    Top = 296
    object IntegerField18: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'COD_COND_PAG'
      Required = True
    end
    object StringField38: TStringField
      DisplayLabel = 'Descricao'
      FieldName = 'DESC_COND_PAG'
      Size = 30
    end
    object StringField39: TStringField
      DisplayLabel = 'Seq Preco'
      FieldName = 'SEQPRECO'
      FixedChar = True
      Size = 1
    end
    object FloatField18: TFloatField
      DisplayLabel = 'Max Desconto (%)'
      FieldName = 'MAX_DESC'
    end
    object IntegerField19: TIntegerField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
      Visible = False
    end
    object IntegerField20: TIntegerField
      Tag = 1
      DisplayLabel = 'Finalizador Cupom'
      FieldName = 'FINALIZADOR_CUPOM'
      Visible = False
    end
    object StringField40: TStringField
      DisplayLabel = 'Natureza'
      FieldName = 'NATUREZA_CP'
      FixedChar = True
      Size = 1
    end
  end
  object qrCondicoesPagamentoEmp: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = dtmAtivo.IbTransCol
    SQL.Strings = (
      'select * from CONDICOES_PAGAMENTO_EMP')
    Left = 1149
    Top = 368
  end
  object dspCondicoesPagamentoEmp: TDataSetProvider
    DataSet = qrCondicoesPagamentoEmp
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1149
    Top = 416
  end
  object cdsCondicoesPagamentoEmp: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspCondicoesPagamentoEmp'
    BeforeOpen = cdsPGrBeforeOpen
    Left = 1149
    Top = 464
    object IntegerField21: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'COD_COND_PAG'
      Required = True
    end
    object StringField41: TStringField
      DisplayLabel = 'Descricao'
      FieldName = 'DESC_COND_PAG'
      Size = 30
    end
    object StringField42: TStringField
      DisplayLabel = 'Seq Preco'
      FieldName = 'SEQPRECO'
      FixedChar = True
      Size = 1
    end
    object FloatField19: TFloatField
      DisplayLabel = 'Max Desconto (%)'
      FieldName = 'MAX_DESC'
    end
    object IntegerField22: TIntegerField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
      Visible = False
    end
    object IntegerField23: TIntegerField
      Tag = 1
      DisplayLabel = 'Finalizador Cupom'
      FieldName = 'FINALIZADOR_CUPOM'
      Visible = False
    end
    object StringField43: TStringField
      DisplayLabel = 'Natureza'
      FieldName = 'NATUREZA_CP'
      FixedChar = True
      Size = 1
    end
    object cdsCondicoesPagamentoEmpMODALIDADE: TStringField
      DisplayLabel = 'Modalidade'
      FieldName = 'MODALIDADE'
      FixedChar = True
      Size = 1
    end
    object cdsCondicoesPagamentoEmpCONSIDERAR_DIA_UTIL: TStringField
      DisplayLabel = 'Considerar dia util'
      FieldName = 'CONSIDERAR_DIA_UTIL'
      Size = 3
    end
    object cdsCondicoesPagamentoEmpPARCELAS_ADICIONAIS: TSmallintField
      DisplayLabel = 'Parcelas adicionais'
      FieldName = 'PARCELAS_ADICIONAIS'
    end
    object cdsCondicoesPagamentoEmpCOND_PADRAO_CL_VND: TStringField
      DisplayLabel = 'Padrao Venda'
      FieldName = 'COND_PADRAO_CL_VND'
      FixedChar = True
      Size = 1
    end
    object cdsCondicoesPagamentoEmpCOND_PADRAO_CL_PREST: TStringField
      DisplayLabel = 'Padrao Prestacao'
      FieldName = 'COND_PADRAO_CL_PREST'
      FixedChar = True
      Size = 1
    end
  end
  object qrCodBarraProd: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = dtmAtivo.IbTransCol
    SQL.Strings = (
      'SELECT * from COD_BARRA')
    Left = 37
    Top = 368
  end
  object dspCodBarraProd: TDataSetProvider
    DataSet = qrCodBarraProd
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 37
    Top = 416
  end
  object cdsCodBarraProd: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspCodBarraProd'
    BeforeOpen = cdsPGrBeforeOpen
    Left = 37
    Top = 472
    object cdsCodBarraProdCOD_BARRA: TStringField
      Tag = 2
      DisplayLabel = 'Codigo'
      FieldName = 'COD_BARRA'
      Required = True
      FixedChar = True
    end
    object cdsCodBarraProdGRUPO_PROD: TIntegerField
      Tag = 1
      DisplayLabel = 'Grupo Produto'
      FieldName = 'GRUPO_PROD'
      Required = True
    end
    object cdsCodBarraProdCOD_PROD: TStringField
      Tag = 1
      DisplayLabel = 'Cod Produto'
      FieldName = 'COD_PROD'
      Required = True
      FixedChar = True
      Size = 6
    end
    object cdsCodBarraProdCOD_GRADE: TIntegerField
      DisplayLabel = 'Cod Grade'
      FieldName = 'COD_GRADE'
      OnGetText = cdsCodBarraProdCOD_GRADEGetText
    end
    object cdsCodBarraProdCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsCodBarraProdDAT_CAD_CDBAR: TDateTimeField
      Tag = 1
      DisplayLabel = 'Data Cadastro'
      FieldName = 'DAT_CAD_CDBAR'
    end
    object cdsCodBarraProdDAT_MOD_CDBAR: TDateTimeField
      Tag = 1
      DisplayLabel = 'Data Modifica'#231#227'o'
      FieldName = 'DAT_MOD_CDBAR'
    end
    object cdsCodBarraProdATIVO: TIntegerField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
  end
  object qrUltimoBalancoGrade: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transConsulta
    SQL.Strings = (
      
        'select ESTOQUE_INI_GRADE.GRUPO_PROD, ESTOQUE_INI_GRADE.COD_PROD,' +
        ' '
      'ESTOQUE_INI_GRADE.COD_GRADE, '
      'GRADE.DESCRICAO, '
      'GRADE.DESCRICAO1, '
      'ESTOQUE_INI_GRADE.NUM_FAB_PROD, ESTOQUE_INI_GRADE.QUANT_EST,'
      
        'ESTOQUE_INI_GRADE.DATA_CADASTRO, ESTOQUE_INI_GRADE.DATA_CONFIRM,' +
        ' '
      
        'ESTOQUE_INI_GRADE.LOCACAO_PROD, ESTOQUE_INI_GRADE.LOCACAO_PROD_1' +
        ', '
      
        'ESTOQUE_INI_GRADE.QUANT_TRANS, ESTOQUE_INI_GRADE.QUANT_REQ, ESTO' +
        'QUE_INI_GRADE.QTD_DIF_BAL from ESTOQUE_INI_GRADE '
      
        'left join GRADE on GRADE.COD_GRADE = ESTOQUE_INI_GRADE.COD_EMPRE' +
        'SA and GRADE.COD_EMPRESA = ESTOQUE_INI_GRADE.COD_EMPRESA ')
    Left = 742
    Top = 694
    object qrUltimoBalancoGradeGRUPO_PROD: TIntegerField
      DisplayLabel = 'Grupo Produto'
      FieldName = 'GRUPO_PROD'
      Origin = '"ESTOQUE_INI_GRADE"."GRUPO_PROD"'
      Visible = False
    end
    object qrUltimoBalancoGradeCOD_PROD: TStringField
      FieldName = 'COD_PROD'
      Origin = '"ESTOQUE_INI_GRADE"."COD_PROD"'
      Visible = False
      Size = 6
    end
    object qrUltimoBalancoGradeCOD_GRADE: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'COD_GRADE'
      Origin = '"ESTOQUE_INI_GRADE"."COD_GRADE"'
    end
    object qrUltimoBalancoGradeDESCRICAO: TStringField
      DisplayLabel = 'Descricao'
      FieldName = 'DESCRICAO'
      Size = 32
    end
    object qrUltimoBalancoGradeDESCRICAO1: TStringField
      DisplayLabel = 'Descricao 2'
      FieldName = 'DESCRICAO1'
      Size = 32
    end
    object qrUltimoBalancoGradeNUM_FAB_PROD: TStringField
      DisplayLabel = 'Num. de Fabrica'#231#227'o'
      FieldName = 'NUM_FAB_PROD'
      Origin = '"ESTOQUE_INI_GRADE"."NUM_FAB_PROD"'
      Visible = False
    end
    object FloatField20: TFloatField
      DisplayLabel = 'Quantidade Contada'
      FieldName = 'QUANT_EST'
      Origin = '"ESTOQUE_INI_GRADE"."QUANT_EST"'
      DisplayFormat = '##0.000'
    end
    object DateTimeField15: TDateTimeField
      DisplayLabel = 'Data de Cadastro'
      FieldName = 'DATA_CADASTRO'
      Origin = '"ESTOQUE_INI_GRADE"."DATA_CADASTRO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
    end
    object DateTimeField16: TDateTimeField
      DisplayLabel = 'Data Confirma'#231#227'o Balan'#231'o'
      FieldName = 'DATA_CONFIRM'
      Origin = '"ESTOQUE_INI_GRADE"."DATA_CONFIRM"'
      Visible = False
    end
    object IBStringField3: TIBStringField
      DisplayLabel = 'Loca'#231#227'o'
      FieldName = 'LOCACAO_PROD'
      Origin = '"ESTOQUE_INI_GRADE"."LOCACAO_PROD"'
      FixedChar = True
      Size = 8
    end
    object IBStringField4: TIBStringField
      DisplayLabel = 'Loca'#231#227'o 1'
      FieldName = 'LOCACAO_PROD_1'
      Origin = '"ESTOQUE_INI_GRADE"."LOCACAO_PROD_1"'
      FixedChar = True
      Size = 8
    end
    object FloatField21: TFloatField
      DisplayLabel = 'Quantidade Transferida'
      FieldName = 'QUANT_TRANS'
      Origin = '"ESTOQUE_INI_GRADE"."QUANT_TRANS"'
      DisplayFormat = '##0.000'
    end
    object FloatField22: TFloatField
      DisplayLabel = 'Quantidade em Requisi'#231#227'o'
      FieldName = 'QUANT_REQ'
      Origin = '"ESTOQUE_INI_GRADE"."QUANT_REQ"'
      DisplayFormat = '##0.000'
    end
    object FloatField23: TFloatField
      DisplayLabel = 'Quantidade Diferente'
      FieldName = 'QTD_DIF_BAL'
      Origin = '"ESTOQUE_INI_GRADE"."QTD_DIF_BAL"'
      DisplayFormat = '##0.000'
    end
  end
  object dsUltimoBalancoGrade: TDataSource
    DataSet = qrUltimoBalancoGrade
    Left = 749
    Top = 761
  end
end
