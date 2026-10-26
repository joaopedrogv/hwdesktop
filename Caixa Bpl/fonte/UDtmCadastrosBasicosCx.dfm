object DtmCadBasicosCx: TDtmCadBasicosCx
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 816
  Width = 1142
  object IBTransBoletos: TIBTransaction
    DefaultDatabase = dtmAtivo.bancoHw
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 48
    Top = 8
  end
  object qrBuscas: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransBoletos
    Left = 535
    Top = 16
    ParamData = <
      item
        DataType = ftFloat
        Name = 'vcontas'
        ParamType = ptUnknown
      end>
  end
  object qrControles: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransBoletos
    SQL.Strings = (
      'select * from CONTROLES')
    Left = 137
    Top = 16
  end
  object dsControles: TDataSource
    DataSet = cdsControles
    Left = 136
    Top = 149
  end
  object cdsControles: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspControles'
    BeforeOpen = cdsBoletosBeforeOpen
    Left = 136
    Top = 105
    object cdsControlesSEL: TStringField
      DisplayLabel = 'Sel'
      FieldKind = fkInternalCalc
      FieldName = 'SEL'
      Size = 1
    end
    object cdsControlesCODIGO_CTRL: TIntegerField
      DisplayLabel = 'Cod Controle'
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
      DisplayLabel = 'Num Banco'
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
      DisplayLabel = 'Endereco Controle'
      FieldName = 'END_CTRL'
      Size = 30
    end
    object cdsControlesBAIRRO_CTRL: TStringField
      DisplayLabel = 'Bairro Controle'
      FieldName = 'BAIRRO_CTRL'
    end
    object cdsControlesCID_CTRL: TStringField
      DisplayLabel = 'Cidade Controle'
      FieldName = 'CID_CTRL'
    end
    object cdsControlesUF_CTRL: TStringField
      DisplayLabel = 'Estado Controle'
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
      DisplayLabel = 'Telefone Controle'
      FieldName = 'FONE_CTRL'
      FixedChar = True
      Size = 13
    end
    object cdsControlesN_CONTA_CTRL: TStringField
      DisplayLabel = 'N'#186' Conta Controle'
      FieldName = 'N_CONTA_CTRL'
      FixedChar = True
      Size = 15
    end
    object cdsControlesSALDO_ANT_CTRL: TFloatField
      DisplayLabel = 'Saldo Anterior Controle'
      FieldName = 'SALDO_ANT_CTRL'
    end
    object cdsControlesSALDO_AT_CTRL: TFloatField
      DisplayLabel = 'Saldo Atual Controle'
      FieldName = 'SALDO_AT_CTRL'
    end
    object cdsControlesSOBRA_CTRL: TFloatField
      DisplayLabel = 'Sobra Controle'
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
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'CODIGO_EMP'
      Required = True
    end
    object cdsControlesN_AGENCIA_CTRL: TStringField
      Tag = 1
      DisplayLabel = 'Num agencia'
      FieldName = 'N_AGENCIA_CTRL'
      Size = 10
    end
    object cdsControlesCAMINHO_LICENCA_CTRL: TStringField
      Tag = 1
      DisplayLabel = 'Caminho licenca'
      FieldName = 'CAMINHO_LICENCA_CTRL'
      Size = 50
    end
    object cdsControlesCAMINHO_LOGOTIPO_CTRL: TStringField
      Tag = 1
      DisplayLabel = 'Caminho Logotipo'
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
      DisplayLabel = 'Identificacao Cedente'
      FieldName = 'IDENTIF_CEDENTE'
      Size = 40
    end
    object cdsControlesCAMINHO_REMESSA: TStringField
      Tag = 1
      DisplayLabel = 'Caminho Remessa'
      FieldName = 'CAMINHO_REMESSA'
      Size = 50
    end
    object cdsControlesCOD_CEDENTE: TStringField
      DisplayLabel = 'Cod Cedente'
      FieldName = 'COD_CEDENTE'
    end
    object cdsControlesINICIO_NOSSO_NUMRERO: TStringField
      Tag = 1
      DisplayLabel = 'Inicio Nosso Numero'
      FieldName = 'INICIO_NOSSO_NUMRERO'
    end
    object cdsControlesFIM_NOSSO_NUMERO: TStringField
      Tag = 1
      DisplayLabel = 'Fim Nosso Numero'
      FieldName = 'FIM_NOSSO_NUMERO'
    end
    object cdsControlesPROXIMO_NOSSO_NUMERO: TStringField
      Tag = 1
      DisplayLabel = 'Proximo Nosso Numero'
      FieldName = 'PROXIMO_NOSSO_NUMERO'
    end
    object cdsControlesCOD_FINALIZADOR: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Finalizador'
      FieldName = 'COD_FINALIZADOR'
    end
    object cdsControlesCODSEQ_BALANCO: TIntegerField
      DisplayLabel = 'Cod Seq Balanco'
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
      DisplayLabel = 'Codigo institui'#231#227'o de pagamento(SPED)'
      FieldName = 'CARTAO_SPED_PART'
    end
    object cdsControlesCODIGO_BAIXA: TStringField
      DisplayLabel = 'Cod Faixa Boleto'
      FieldName = 'CODIGO_BAIXA'
    end
    object cdsControlesCODIGO_RECUSA: TStringField
      DisplayLabel = 'Cod Recusa Boleto'
      FieldName = 'CODIGO_RECUSA'
    end
    object cdsControlesATIVO: TIntegerField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
    object cdsControlesCOD_COBREBEM: TIntegerField
      DisplayLabel = 'Cod Cobrebem'
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
      DisplayLabel = 'Nome Contabil'
      FieldName = 'NOME_CONTABIL'
      Size = 35
    end
    object cdsControlesENTRA_PREST_CXL: TStringField
      DisplayLabel = 'Entrar Prestacoes CXL'
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
    object cdsControlesGERAR_COMISSAO: TStringField
      DisplayLabel = 'Gerar Comiss'#227'o'
      FieldName = 'GERAR_COMISSAO'
      Size = 1
    end
    object cdsControlesENTRA_PMV: TStringField
      DisplayLabel = 'Entra no Prazo medio de venda'
      FieldName = 'ENTRA_PMV'
      Size = 1
    end
    object cdsControlesINICIAL_TPVND_MOBILE: TStringField
      DisplayLabel = 'Inicial Tipo de Venda Mobile'
      FieldName = 'INICIAL_TPVND_MOBILE'
      FixedChar = True
      Size = 1
    end
    object cdsControlesAGENCIA_CTRL: TStringField
      DisplayLabel = 'Ag'#234'ncia'
      FieldName = 'AGENCIA_CTRL'
      Size = 10
    end
    object cdsControlesN_CONTA_PLC_TARIFA_CARTAO: TFloatField
      DisplayLabel = 'N'#186' Conta Tarifa Cartao'
      FieldName = 'N_CONTA_PLC_TARIFA_CARTAO'
    end
    object cdsControlesFP_PADRAO_CL: TStringField
      DisplayLabel = 'Forma de Pagamento padr'#227'o clientes'
      FieldName = 'FP_PADRAO_CL'
      Size = 1
    end
    object cdsControlesNAO_GERA_FINAN: TStringField
      DisplayLabel = 'N'#227'o gerar registros Financeiros'
      FieldName = 'NAO_GERA_FINAN'
      Size = 1
    end
    object cdsControlesBAIXA_AUTOMATICA: TStringField
      DisplayLabel = 'Baixa Autom'#225'tica'
      FieldName = 'BAIXA_AUTOMATICA'
      Size = 1
    end
    object cdsControlesN_CONTA_BX_AUTO: TFloatField
      DisplayLabel = 'Num Conta Plc Baixa Autom'#225'tica'
      FieldName = 'N_CONTA_BX_AUTO'
    end
    object cdsControlesRETORNOS: TStringField
      DisplayLabel = 'Ativar controle de retorno de mercadorias'
      FieldName = 'RETORNOS'
      Size = 1
    end
    object cdsControlesTIPO_PARCELAMENTO: TStringField
      DisplayLabel = 'Tipo de Parcelamento'
      FieldName = 'TIPO_PARCELAMENTO'
      Size = 2
    end
    object cdsControlesDIA_BASE_PARCELAMENTO: TStringField
      DisplayLabel = 'Dia base parcelas'
      FieldName = 'DIA_BASE_PARCELAMENTO'
      Size = 2
    end
    object cdsControlesNFCE_TPAG: TSmallintField
      DisplayLabel = 'NFC-e Tipo de Pagamento'
      FieldName = 'NFCE_TPAG'
    end
    object cdsControlesNFCE_TBAND: TSmallintField
      DisplayLabel = 'NFC-e Bandeira Padr'#227'o'
      FieldName = 'NFCE_TBAND'
    end
    object cdsControlesDIAS_ENT_FLUXO: TIntegerField
      DisplayLabel = 'Dias Ent Fluxo'
      FieldName = 'DIAS_ENT_FLUXO'
    end
    object cdsControlesEXIBIR_RESUMO_FINANCEIRO: TStringField
      DisplayLabel = 'Exibir nos relatorios financeiros'
      FieldName = 'EXIBIR_RESUMO_FINANCEIRO'
      FixedChar = True
      Size = 1
    end
    object cdsControlesRECEBER_CTP: TStringField
      DisplayLabel = 'Receber no CTP'
      FieldName = 'RECEBER_CTP'
      FixedChar = True
      Size = 1
    end
    object cdsControlesCONTRAPARTIDA: TStringField
      DisplayLabel = 'Exibir na contrapartida'
      FieldName = 'CONTRAPARTIDA'
      FixedChar = True
      Size = 1
    end
    object cdsControlesDESAT_VINC_BALANCO: TStringField
      Tag = 1
      DisplayLabel = 'Desativar vinculo balac'
      FieldName = 'DESAT_VINC_BALANCO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object cdsControlesFP_REGRA_FIDELIDADE: TStringField
      DisplayLabel = 'Forma Prog Fid'
      FieldName = 'FP_REGRA_FIDELIDADE'
    end
    object cdsControlesTEF_TIPO: TSmallintField
      DisplayLabel = 'Tipo TEF'
      FieldName = 'TEF_TIPO'
    end
    object cdsControlesTEF_ID_CARTDIG: TStringField
      DisplayLabel = 'Carteira Digital Id(TEF)'
      FieldName = 'TEF_ID_CARTDIG'
      Size = 8
    end
    object cdsControlesTEF_ID_PSP: TStringField
      DisplayLabel = 'Id PSP(TEF)'
      FieldName = 'TEF_ID_PSP'
      Size = 8
    end
    object cdsControlesCARTAO_SPED_PART_IT: TIntegerField
      DisplayLabel = 'Codigo institui'#231#227'o de intermedia'#231#227'o pagamento(SPED)'
      FieldName = 'CARTAO_SPED_PART_IT'
    end
    object cdsControlesEXIBIR_DOC: TStringField
      DisplayLabel = 'Exibir Doc'
      FieldName = 'EXIBIR_DOC'
      FixedChar = True
      Size = 1
    end
    object cdsControlesBARRAMENTO_AUTOMATICO: TStringField
      DisplayLabel = 'Barramento Automatico'
      FieldName = 'BARRAMENTO_AUTOMATICO'
      FixedChar = True
      Size = 1
    end
  end
  object dspControles: TDataSetProvider
    DataSet = qrControles
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 136
    Top = 60
  end
  object qrClientes: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransBoletos
    SQL.Strings = (
      'select * from CLIENTES')
    Left = 216
    Top = 16
  end
  object dsClientes: TDataSource
    DataSet = cdsClientes
    Left = 216
    Top = 149
  end
  object cdsClientes: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspClientes'
    BeforeOpen = cdsBoletosBeforeOpen
    Left = 216
    Top = 105
    object cdsClientesCOD_CLIENTE: TIntegerField
      FieldName = 'COD_CLIENTE'
      Required = True
    end
    object cdsClientesCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsClientesCODIGO_UF: TIntegerField
      FieldName = 'CODIGO_UF'
      Required = True
    end
    object cdsClientesCODIGO_TIPO: TIntegerField
      FieldName = 'CODIGO_TIPO'
    end
    object cdsClientesCODIGO_FATURAMENTO: TIntegerField
      FieldName = 'CODIGO_FATURAMENTO'
    end
    object cdsClientesEST_CODIGO_UF: TIntegerField
      FieldName = 'EST_CODIGO_UF'
      Required = True
    end
    object cdsClientesCPFCGC: TStringField
      FieldName = 'CPFCGC'
      Size = 18
    end
    object cdsClientesNOME_CLIENTE: TStringField
      FieldName = 'NOME_CLIENTE'
      Required = True
      Size = 35
    end
    object cdsClientesRAZAO: TStringField
      FieldName = 'RAZAO'
      Required = True
      Size = 60
    end
    object cdsClientesCIDADE: TStringField
      FieldName = 'CIDADE'
      Required = True
      Size = 30
    end
    object cdsClientesCEP: TStringField
      FieldName = 'CEP'
      Required = True
      FixedChar = True
      Size = 9
    end
    object cdsClientesINSC_EST: TStringField
      FieldName = 'INSC_EST'
      Size = 18
    end
    object cdsClientesFAX: TStringField
      FieldName = 'FAX'
      FixedChar = True
      Size = 14
    end
    object cdsClientesCIDA_COBRANCA: TStringField
      FieldName = 'CIDA_COBRANCA'
      Size = 30
    end
    object cdsClientesCEP_COBRANCA: TStringField
      FieldName = 'CEP_COBRANCA'
      FixedChar = True
      Size = 9
    end
    object cdsClientesOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Size = 200
    end
    object cdsClientesDATA_CADASTRO: TDateTimeField
      FieldName = 'DATA_CADASTRO'
    end
    object cdsClientesLIMITE_CREDITO: TFloatField
      FieldName = 'LIMITE_CREDITO'
    end
    object cdsClientesCONTATO: TStringField
      FieldName = 'CONTATO'
      Size = 10
    end
    object cdsClientesNATURALID: TStringField
      FieldName = 'NATURALID'
    end
    object cdsClientesCONJUGE: TStringField
      FieldName = 'CONJUGE'
      Size = 35
    end
    object cdsClientesLOC_TRAB: TStringField
      FieldName = 'LOC_TRAB'
      Size = 30
    end
    object cdsClientesEND_TRAB: TStringField
      FieldName = 'END_TRAB'
      Size = 35
    end
    object cdsClientesFONE_TRAB: TStringField
      FieldName = 'FONE_TRAB'
      FixedChar = True
      Size = 14
    end
    object cdsClientesCARGO: TStringField
      FieldName = 'CARGO'
      Size = 15
    end
    object cdsClientesRG: TStringField
      FieldName = 'RG'
      FixedChar = True
      Size = 10
    end
    object cdsClientesEXPEDIC: TDateTimeField
      FieldName = 'EXPEDIC'
    end
    object cdsClientesORG_EXPEDIC: TStringField
      FieldName = 'ORG_EXPEDIC'
    end
    object cdsClientesCTPS: TStringField
      FieldName = 'CTPS'
      FixedChar = True
      Size = 10
    end
    object cdsClientesREF_BANC1: TStringField
      FieldName = 'REF_BANC1'
      Size = 30
    end
    object cdsClientesFONE_BANC1: TStringField
      FieldName = 'FONE_BANC1'
      FixedChar = True
      Size = 14
    end
    object cdsClientesREF_BANC2: TStringField
      FieldName = 'REF_BANC2'
      Size = 30
    end
    object cdsClientesFONE_BANC2: TStringField
      FieldName = 'FONE_BANC2'
      FixedChar = True
      Size = 14
    end
    object cdsClientesREF_COM1: TStringField
      FieldName = 'REF_COM1'
      Size = 30
    end
    object cdsClientesEND_COM1: TStringField
      FieldName = 'END_COM1'
      Size = 30
    end
    object cdsClientesFONE_COM1: TStringField
      FieldName = 'FONE_COM1'
      FixedChar = True
      Size = 14
    end
    object cdsClientesINFORM: TStringField
      FieldName = 'INFORM'
      Size = 30
    end
    object cdsClientesPRI_COMPR: TDateTimeField
      FieldName = 'PRI_COMPR'
    end
    object cdsClientesULT_COMPR: TDateTimeField
      FieldName = 'ULT_COMPR'
    end
    object cdsClientesCONCEITO: TStringField
      FieldName = 'CONCEITO'
      Size = 15
    end
    object cdsClientesREF_COM2: TStringField
      FieldName = 'REF_COM2'
      Size = 30
    end
    object cdsClientesEND_COM2: TStringField
      FieldName = 'END_COM2'
      Size = 30
    end
    object cdsClientesFONE_COM2: TStringField
      FieldName = 'FONE_COM2'
      FixedChar = True
      Size = 14
    end
    object cdsClientesINFORM2: TStringField
      FieldName = 'INFORM2'
      Size = 30
    end
    object cdsClientesPRI_COMPR2: TDateTimeField
      FieldName = 'PRI_COMPR2'
    end
    object cdsClientesULT_COMPR2: TDateTimeField
      FieldName = 'ULT_COMPR2'
    end
    object cdsClientesCONCEITO2: TStringField
      FieldName = 'CONCEITO2'
      Size = 15
    end
    object cdsClientesSPCL: TDateTimeField
      FieldName = 'SPCL'
    end
    object cdsClientesSPCEST: TDateTimeField
      FieldName = 'SPCEST'
    end
    object cdsClientesREGSPC: TDateTimeField
      FieldName = 'REGSPC'
    end
    object cdsClientesREGSPCCH: TDateTimeField
      FieldName = 'REGSPCCH'
    end
    object cdsClientesUS_CAD_CLI: TIntegerField
      FieldName = 'US_CAD_CLI'
    end
    object cdsClientesFONE_CLIENTE: TStringField
      FieldName = 'FONE_CLIENTE'
      FixedChar = True
      Size = 13
    end
    object cdsClientesENDERECO: TStringField
      FieldName = 'ENDERECO'
      Required = True
      Size = 50
    end
    object cdsClientesBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Required = True
      Size = 35
    end
    object cdsClientesEND_COBRANCA: TStringField
      FieldName = 'END_COBRANCA'
      Size = 50
    end
    object cdsClientesBAIRRO_COBRANCA: TStringField
      FieldName = 'BAIRRO_COBRANCA'
      Size = 35
    end
    object cdsClientesOBS_DIV: TMemoField
      FieldName = 'OBS_DIV'
      BlobType = ftMemo
      Size = 8
    end
    object cdsClientesPAI: TStringField
      FieldName = 'PAI'
      Size = 35
    end
    object cdsClientesMAE: TStringField
      FieldName = 'MAE'
      Size = 35
    end
    object cdsClientesDATA_NASC: TDateTimeField
      FieldName = 'DATA_NASC'
    end
    object cdsClientesEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 50
    end
    object cdsClientesCOD_CONVENIO: TIntegerField
      FieldName = 'COD_CONVENIO'
    end
    object cdsClientesCONVENIADO: TStringField
      FieldName = 'CONVENIADO'
      FixedChar = True
      Size = 1
    end
    object cdsClientesDIA_VENC: TIntegerField
      FieldName = 'DIA_VENC'
    end
    object cdsClientesDATA_MOD_CAD: TDateTimeField
      FieldName = 'DATA_MOD_CAD'
    end
    object cdsClientesCODIGO_EMP: TIntegerField
      FieldName = 'CODIGO_EMP'
    end
    object cdsClientesCATEGORIA: TStringField
      FieldName = 'CATEGORIA'
      FixedChar = True
      Size = 8
    end
    object cdsClientesCLQTDCOMPRA: TStringField
      FieldName = 'CLQTDCOMPRA'
      FixedChar = True
      Size = 2
    end
    object cdsClientesCLSOMACOMPRA: TStringField
      FieldName = 'CLSOMACOMPRA'
      FixedChar = True
      Size = 2
    end
    object cdsClientesCLULTIMACOMPRA: TStringField
      FieldName = 'CLULTIMACOMPRA'
      FixedChar = True
      Size = 2
    end
    object cdsClientesCLATRASOCOMPRA: TStringField
      FieldName = 'CLATRASOCOMPRA'
      FixedChar = True
      Size = 2
    end
    object cdsClientesCLLUCROCLIENTE: TStringField
      FieldName = 'CLLUCROCLIENTE'
      FixedChar = True
      Size = 2
    end
    object cdsClientesLUCROCLIENTE: TFloatField
      FieldName = 'LUCROCLIENTE'
    end
    object cdsClientesTIPOCLIENTE: TStringField
      FieldName = 'TIPOCLIENTE'
      FixedChar = True
      Size = 6
    end
    object cdsClientesCLQTDVEICULO: TStringField
      FieldName = 'CLQTDVEICULO'
      FixedChar = True
      Size = 2
    end
    object cdsClientesCLSOMAVEICULO: TStringField
      FieldName = 'CLSOMAVEICULO'
      FixedChar = True
      Size = 2
    end
    object cdsClientesCLULTIMOVEICULO: TStringField
      FieldName = 'CLULTIMOVEICULO'
      FixedChar = True
      Size = 2
    end
    object cdsClientesCLLUCROVEICULO: TStringField
      FieldName = 'CLLUCROVEICULO'
      FixedChar = True
      Size = 2
    end
    object cdsClientesLUCROCLIENTE_V: TFloatField
      FieldName = 'LUCROCLIENTE_V'
    end
    object cdsClientesV_Q_VEICULO: TFloatField
      FieldName = 'V_Q_VEICULO'
    end
    object cdsClientesM_Q_VEICULO: TFloatField
      FieldName = 'M_Q_VEICULO'
    end
    object cdsClientesV_T_VEICULO: TFloatField
      FieldName = 'V_T_VEICULO'
    end
    object cdsClientesM_T_VEICULO: TFloatField
      FieldName = 'M_T_VEICULO'
    end
    object cdsClientesV_L_VEICULO: TFloatField
      FieldName = 'V_L_VEICULO'
    end
    object cdsClientesM_L_VEICULO: TFloatField
      FieldName = 'M_L_VEICULO'
    end
    object cdsClientesDATA_ULT_VENDA_V: TDateTimeField
      FieldName = 'DATA_ULT_VENDA_V'
    end
    object cdsClientesMEDIA_FREQUENCIA_V: TFloatField
      FieldName = 'MEDIA_FREQUENCIA_V'
    end
    object cdsClientesMEDIAFREQUENCIA: TFloatField
      FieldName = 'MEDIAFREQUENCIA'
    end
    object cdsClientesV_Q_COMPRA: TFloatField
      FieldName = 'V_Q_COMPRA'
    end
    object cdsClientesM_Q_COMPRA: TFloatField
      FieldName = 'M_Q_COMPRA'
    end
    object cdsClientesV_T_COMPRA: TFloatField
      FieldName = 'V_T_COMPRA'
    end
    object cdsClientesM_T_COMPRA: TFloatField
      FieldName = 'M_T_COMPRA'
    end
    object cdsClientesV_L_COMPRA: TFloatField
      FieldName = 'V_L_COMPRA'
    end
    object cdsClientesM_L_COMPRA: TFloatField
      FieldName = 'M_L_COMPRA'
    end
    object cdsClientesV_A_COMPRA: TFloatField
      FieldName = 'V_A_COMPRA'
    end
    object cdsClientesM_A_COMPRA: TFloatField
      FieldName = 'M_A_COMPRA'
    end
    object cdsClientesDATA_ULT_COMPRA: TDateTimeField
      FieldName = 'DATA_ULT_COMPRA'
    end
    object cdsClientesNEC_ACOMP: TStringField
      FieldName = 'NEC_ACOMP'
      FixedChar = True
      Size = 1
    end
    object cdsClientesDIAS_ACOMP: TIntegerField
      FieldName = 'DIAS_ACOMP'
    end
    object cdsClientesSEXO: TStringField
      FieldName = 'SEXO'
      FixedChar = True
      Size = 1
    end
    object cdsClientesRAMO_ATIVIDADE: TStringField
      FieldName = 'RAMO_ATIVIDADE'
      Size = 60
    end
    object cdsClientesCOD_CIDADE: TSmallintField
      FieldName = 'COD_CIDADE'
    end
    object cdsClientesCOD_BAIRRO: TSmallintField
      FieldName = 'COD_BAIRRO'
    end
    object cdsClientesCOD_CIDADE_COBRANCA: TSmallintField
      FieldName = 'COD_CIDADE_COBRANCA'
    end
    object cdsClientesCOD_BAIRRO_COBRANCA: TSmallintField
      FieldName = 'COD_BAIRRO_COBRANCA'
    end
    object cdsClientesESTADO_CIVIL: TStringField
      FieldName = 'ESTADO_CIVIL'
      Size = 32
    end
    object cdsClientesTIPVCLIENTE: TStringField
      FieldName = 'TIPVCLIENTE'
      FixedChar = True
      Size = 1
    end
    object cdsClientesCAMP_PR_VENDA: TStringField
      FieldName = 'CAMP_PR_VENDA'
    end
    object cdsClientesPERC_DESC: TFloatField
      FieldName = 'PERC_DESC'
    end
    object cdsClientesATIVO: TIntegerField
      FieldName = 'ATIVO'
    end
    object cdsClientesCOD_CONTADOR: TIntegerField
      FieldName = 'COD_CONTADOR'
    end
    object cdsClientesTIPO: TStringField
      FieldName = 'TIPO'
      FixedChar = True
      Size = 1
    end
    object cdsClientesBARRADO: TStringField
      FieldName = 'BARRADO'
      FixedChar = True
      Size = 1
    end
    object cdsClientesNUM_END_CLIENTE: TIntegerField
      FieldName = 'NUM_END_CLIENTE'
    end
    object cdsClientesUSUARIO_C: TStringField
      FieldName = 'USUARIO_C'
    end
    object cdsClientesSENHA_C: TStringField
      FieldName = 'SENHA_C'
    end
    object cdsClientesCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Size = 60
    end
    object cdsClientesINSC_SUB_F: TStringField
      FieldName = 'INSC_SUB_F'
      FixedChar = True
      Size = 18
    end
    object cdsClientesCDMICROEPP: TStringField
      FieldName = 'CDMICROEPP'
      FixedChar = True
      Size = 1
    end
    object cdsClientesTEL_RES_CF: TStringField
      FieldName = 'TEL_RES_CF'
      FixedChar = True
      Size = 14
    end
    object cdsClientesRAMAL: TStringField
      FieldName = 'RAMAL'
      FixedChar = True
      Size = 5
    end
    object cdsClientesCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
    end
  end
  object dspClientes: TDataSetProvider
    DataSet = qrClientes
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 216
    Top = 60
  end
  object SpIncCodigo: TIBStoredProc
    Database = dtmAtivo.bancoHw
    Transaction = IBTransBoletos
    StoredProcName = 'INCREMENTA_CODIGO'
    Left = 45
    Top = 89
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
  object qrImpressao: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransBoletos
    Left = 48
    Top = 144
  end
  object qrBalanco: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransBoletos
    SQL.Strings = (
      'select * from dados_balanco')
    Left = 296
    Top = 16
  end
  object dspBalanco: TDataSetProvider
    DataSet = qrBalanco
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 296
    Top = 60
  end
  object cdsBalanco: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspBalanco'
    BeforeOpen = cdsBoletosBeforeOpen
    Left = 296
    Top = 105
    object cdsBalancoCODSEQ_BALANCO: TIntegerField
      DisplayLabel = 'C'#243'd. Sequ'#234'ncia'
      FieldName = 'CODSEQ_BALANCO'
      Required = True
    end
    object cdsBalancoTIPO_BALANCO: TStringField
      DisplayLabel = 'Grupo Balan'#231'o'
      FieldName = 'TIPO_BALANCO'
      Required = True
      Size = 7
    end
    object cdsBalancoCODIGO_INT_BAL: TStringField
      DisplayLabel = 'Seq. Interna Balan'#231'o'
      FieldName = 'CODIGO_INT_BAL'
      Required = True
      Size = 10
    end
    object cdsBalancoDESC_BALANCO: TStringField
      DisplayLabel = 'Descri'#231#227'o Balan'#231'o'
      FieldName = 'DESC_BALANCO'
      Required = True
      FixedChar = True
      Size = 30
    end
    object cdsBalancoATIVO: TIntegerField
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
    object cdsBalancoSUBTIPO: TStringField
      DisplayLabel = 'Sub Tipo do Balan'#231'o'
      FieldName = 'SUBTIPO'
    end
    object cdsBalancoPRAZOINICIAL: TIntegerField
      DisplayLabel = 'Prazo Inicial'
      FieldName = 'PRAZOINICIAL'
    end
    object cdsBalancoPRAZOFINAL: TIntegerField
      DisplayLabel = 'Prazo Final'
      FieldName = 'PRAZOFINAL'
    end
    object cdsBalancoSINAL: TStringField
      DisplayLabel = 'Sinal'
      FieldName = 'SINAL'
      Size = 1
    end
  end
  object dsBalanco: TDataSource
    DataSet = cdsBalanco
    Left = 296
    Top = 149
  end
  object qrCtrlBalanco: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransBoletos
    SQL.Strings = (
      'select c.*, d.tipo_balanco, d.codigo_int_bal, d.desc_balanco,'
      
        'd.subtipo, d.sinal, d.prazoinicial, d.prazofinal, emp.identifica' +
        'cao_emp from controles_balanco c '
      'inner join empresa emp on emp.cod_empresa = c.cod_empresa'
      
        'inner join dados_balanco d on d.codseq_balanco = c.codseq_balanc' +
        'o')
    Left = 376
    Top = 16
    object qrCtrlBalancoCODIGO_CTRL: TIntegerField
      FieldName = 'CODIGO_CTRL'
      Origin = '"CONTROLES_BALANCO"."CODIGO_CTRL"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrCtrlBalancoCODSEQ_BALANCO: TIntegerField
      FieldName = 'CODSEQ_BALANCO'
      Origin = '"CONTROLES_BALANCO"."CODSEQ_BALANCO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrCtrlBalancoCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Origin = '"CONTROLES_BALANCO"."COD_EMPRESA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrCtrlBalancoATIVO: TIntegerField
      FieldName = 'ATIVO'
      Origin = '"CONTROLES_BALANCO"."ATIVO"'
    end
    object qrCtrlBalancoTIPO_BALANCO: TIBStringField
      FieldName = 'TIPO_BALANCO'
      Origin = '"DADOS_BALANCO"."TIPO_BALANCO"'
      ProviderFlags = []
      Size = 7
    end
    object qrCtrlBalancoCODIGO_INT_BAL: TIBStringField
      FieldName = 'CODIGO_INT_BAL'
      Origin = '"DADOS_BALANCO"."CODIGO_INT_BAL"'
      ProviderFlags = []
      Size = 10
    end
    object qrCtrlBalancoDESC_BALANCO: TIBStringField
      FieldName = 'DESC_BALANCO'
      Origin = '"DADOS_BALANCO"."DESC_BALANCO"'
      ProviderFlags = []
      FixedChar = True
      Size = 30
    end
    object qrCtrlBalancoSUBTIPO: TIBStringField
      FieldName = 'SUBTIPO'
      Origin = '"DADOS_BALANCO"."SUBTIPO"'
      ProviderFlags = []
    end
    object qrCtrlBalancoSINAL: TIBStringField
      FieldName = 'SINAL'
      Origin = '"DADOS_BALANCO"."SINAL"'
      ProviderFlags = []
      Size = 1
    end
    object qrCtrlBalancoPRAZOINICIAL: TIntegerField
      FieldName = 'PRAZOINICIAL'
      Origin = '"DADOS_BALANCO"."PRAZOINICIAL"'
      ProviderFlags = []
    end
    object qrCtrlBalancoPRAZOFINAL: TIntegerField
      FieldName = 'PRAZOFINAL'
      Origin = '"DADOS_BALANCO"."PRAZOFINAL"'
      ProviderFlags = []
    end
    object qrCtrlBalancoIDENTIFICACAO_EMP: TIBStringField
      FieldName = 'IDENTIFICACAO_EMP'
      Origin = '"EMPRESA"."IDENTIFICACAO_EMP"'
      ProviderFlags = []
      Size = 64
    end
  end
  object dspCtrlBalanco: TDataSetProvider
    DataSet = qrCtrlBalanco
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 376
    Top = 60
  end
  object dsCtrlBalanco: TDataSource
    DataSet = cdsCtrlBalanco
    Left = 376
    Top = 149
  end
  object qrCobrebem: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransBoletos
    SQL.Strings = (
      'select * from COBREBEM')
    Left = 456
    Top = 16
  end
  object dspCobrebem: TDataSetProvider
    DataSet = qrCobrebem
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 456
    Top = 60
  end
  object dsCobrebem: TDataSource
    Left = 456
    Top = 149
  end
  object qrPlanoContas: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransBoletos
    SQL.Strings = (
      'select * from P_Contas where ativo = 1 order by desc_plc')
    Left = 40
    Top = 200
  end
  object dspPlanoContas: TDataSetProvider
    DataSet = qrPlanoContas
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 40
    Top = 244
  end
  object cdsPlanoContas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPlanoContas'
    BeforeOpen = cdsBoletosBeforeOpen
    Left = 40
    Top = 291
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
      DisplayLabel = 'Tipo da Conta'
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
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
      Visible = False
    end
    object cdsPlanoContasSTHAB: TStringField
      Tag = 1
      FieldName = 'STHAB'
      Visible = False
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
    object cdsPlanoContasGERAR_CONTRAPARTIDA: TStringField
      DisplayLabel = 'Gerar Contrapartida'
      FieldName = 'GERAR_CONTRAPARTIDA'
      FixedChar = True
      Size = 1
    end
    object cdsPlanoContasDESAT_VINC_BALANCO: TStringField
      Tag = 1
      DisplayLabel = 'Desativar vinculo balac'
      FieldName = 'DESAT_VINC_BALANCO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object cdsPlanoContasESTORNAR_VALE: TStringField
      DisplayLabel = 'Estornar Vale'
      FieldName = 'ESTORNAR_VALE'
      FixedChar = True
      Size = 1
    end
    object cdsPlanoContasRATEIO_EMPRESA: TStringField
      DisplayLabel = 'Rateio entre empresas'
      FieldName = 'RATEIO_EMPRESA'
      FixedChar = True
      Size = 1
    end
    object cdsPlanoContasCPFCGC_FORNECEDOR: TStringField
      DisplayLabel = 'CPF/CNPJ Fornecedor'
      FieldName = 'CPFCGC_FORNECEDOR'
      Size = 18
    end
  end
  object dsPlanoContas: TDataSource
    DataSet = cdsPlanoContas
    Left = 40
    Top = 338
  end
  object qrGrupoPC: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransBoletos
    SQL.Strings = (
      
        'select ct.*,dp.desc_dep from Grupos_Ct ct,depart_ct dp where ct.' +
        'cod_dep =dp.cod_dep'
      '')
    Left = 128
    Top = 200
  end
  object dspGrupoPC: TDataSetProvider
    DataSet = qrGrupoPC
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 128
    Top = 244
  end
  object cdsGrupoPC: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspGrupoPC'
    BeforeOpen = cdsBoletosBeforeOpen
    Left = 128
    Top = 290
    object cdsGrupoPCGRUP_CT: TIntegerField
      DisplayLabel = 'N'#250'mero do Grupo'
      FieldName = 'GRUP_CT'
      Required = True
    end
    object cdsGrupoPCDESC_GR: TStringField
      DisplayLabel = 'Descri'#231#227'o do Grupo'
      FieldName = 'DESC_GR'
      FixedChar = True
      Size = 35
    end
    object cdsGrupoPCTIPO_GR: TStringField
      DisplayLabel = 'Tipo de Grupo'
      FieldName = 'TIPO_GR'
      FixedChar = True
      Size = 1
    end
    object cdsGrupoPCCOD_DEP: TIntegerField
      DisplayLabel = 'C'#243'digo Departamento'
      FieldName = 'COD_DEP'
    end
    object cdsGrupoPCCOD_DRE: TIntegerField
      DisplayLabel = 'C'#243'digo DRE'
      FieldName = 'COD_DRE'
    end
    object cdsGrupoPCDESC_DEP: TStringField
      FieldName = 'DESC_DEP'
      ProviderFlags = []
      Size = 35
    end
    object cdsGrupoPCTIPO_GR2: TStringField
      DisplayLabel = 'Tipo de Grupo 2'
      FieldName = 'TIPO_GR2'
    end
  end
  object dsGrupoPC: TDataSource
    DataSet = cdsGrupoPC
    Left = 128
    Top = 336
  end
  object qrSubGrupoPC: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransBoletos
    SQL.Strings = (
      'select * from SUB_GRUP_CT')
    Left = 208
    Top = 200
  end
  object dspSubGrupoPC: TDataSetProvider
    DataSet = qrSubGrupoPC
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 208
    Top = 244
  end
  object cdsSubGrupoPC: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSubGrupoPC'
    BeforeOpen = cdsBoletosBeforeOpen
    Left = 208
    Top = 290
    object cdsSubGrupoPCCOD_SUB_CT: TIntegerField
      DisplayLabel = 'N'#250'mero do Sub Grupo'
      FieldName = 'COD_SUB_CT'
      Required = True
    end
    object cdsSubGrupoPCDESC_SUB_CT: TStringField
      DisplayLabel = 'Descri'#231#227'o Sub Grupo'
      FieldName = 'DESC_SUB_CT'
      Required = True
      FixedChar = True
      Size = 30
    end
    object cdsSubGrupoPCORDEM_SUB_CT: TIntegerField
      DisplayLabel = 'Ordem Seq. Sub Grupo'
      FieldName = 'ORDEM_SUB_CT'
    end
    object cdsSubGrupoPCDATA_CAD_PC: TDateTimeField
      DisplayLabel = 'Data Cadastro '
      FieldName = 'DATA_CAD_PC'
    end
    object cdsSubGrupoPCDATA_MOD_PC: TDateTimeField
      DisplayLabel = 'Data Modifica'#231#227'o'
      FieldName = 'DATA_MOD_PC'
    end
  end
  object dsSubGrupoPC: TDataSource
    DataSet = cdsSubGrupoPC
    Left = 208
    Top = 339
  end
  object qrDadosDre: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransBoletos
    SQL.Strings = (
      'select * from DADOS_DRE where ATIVO = 1'
      '')
    Left = 356
    Top = 204
  end
  object dspDadosDre: TDataSetProvider
    DataSet = qrDadosDre
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 355
    Top = 248
  end
  object cdsDadosDre: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDadosDre'
    BeforeOpen = cdsBoletosBeforeOpen
    Left = 355
    Top = 292
    object cdsDadosDreCOD_DRE: TIntegerField
      FieldName = 'COD_DRE'
      Required = True
    end
    object cdsDadosDreNOME_DRE: TStringField
      FieldName = 'NOME_DRE'
      Size = 40
    end
    object cdsDadosDreATIVO: TIntegerField
      FieldName = 'ATIVO'
    end
  end
  object dsDadosDre: TDataSource
    DataSet = cdsDadosDre
    Left = 355
    Top = 339
  end
  object qrRateioDpto: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransBoletos
    SQL.Strings = (
      'select * from REL_DEPTO')
    Left = 427
    Top = 203
  end
  object dspRateioDpto: TDataSetProvider
    DataSet = qrRateioDpto
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 427
    Top = 247
  end
  object cdsRateioDpto: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRateioDpto'
    BeforeOpen = cdsBoletosBeforeOpen
    Left = 427
    Top = 292
    object cdsRateioDptoCOD_DEP: TIntegerField
      DisplayLabel = 'C'#243'digo Departamento'
      FieldName = 'COD_DEP'
      Required = True
    end
    object cdsRateioDptoCOD_DEPRAT: TIntegerField
      DisplayLabel = 'Departamento Destino para Rateio'
      FieldName = 'COD_DEPRAT'
      Required = True
    end
    object cdsRateioDptoTPRAT: TStringField
      DisplayLabel = 'Origem Tipo de Venda'
      FieldName = 'TPRAT'
      Required = True
      Size = 40
    end
    object cdsRateioDptoMEDQTDRATFAT: TIntegerField
      DisplayLabel = 'Qtde de M'#234'ses para Rateio'
      FieldName = 'MEDQTDRATFAT'
      Required = True
    end
    object cdsRateioDptoATIVO: TIntegerField
      Tag = 1
      FieldName = 'ATIVO'
    end
    object cdsRateioDptoRATEM: TStringField
      DisplayLabel = 'Tipos de Venda Destino do Rateio'
      FieldName = 'RATEM'
      Required = True
      Size = 40
    end
    object cdsRateioDptoTPRATCNT: TStringField
      DisplayLabel = 'Origem Tipo de Venda Contabil'
      FieldName = 'TPRATCNT'
      Size = 40
    end
    object cdsRateioDptoRATEMCNT: TStringField
      DisplayLabel = 'Tipos de Venda Destino do Rateio Contabil'
      FieldName = 'RATEMCNT'
      Size = 128
    end
  end
  object dsRateioDpto: TDataSource
    DataSet = cdsRateioDpto
    Left = 427
    Top = 338
  end
  object dsBuscas: TDataSource
    DataSet = qrBuscas
    Left = 536
    Top = 68
  end
  object qrDptoDestino: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransBoletos
    SQL.Strings = (
      'select * from DEPART_CT where tp_dep <> '#39'I'#39)
    Left = 503
    Top = 204
  end
  object dspDptoDestino: TDataSetProvider
    DataSet = qrDptoDestino
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 503
    Top = 248
  end
  object cdsDptoDestino: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDptoDestino'
    BeforeOpen = cdsBoletosBeforeOpen
    Left = 503
    Top = 292
    object cdsDptoDestinoCOD_DEP: TIntegerField
      FieldName = 'COD_DEP'
      Required = True
    end
    object cdsDptoDestinoDESC_DEP: TStringField
      FieldName = 'DESC_DEP'
      Size = 35
    end
    object cdsDptoDestinoPERC_DEP: TFloatField
      FieldName = 'PERC_DEP'
    end
    object cdsDptoDestinoTP_DEP: TStringField
      FieldName = 'TP_DEP'
      FixedChar = True
      Size = 1
    end
    object cdsDptoDestinoTIPDEVDEP: TStringField
      FieldName = 'TIPDEVDEP'
      Size = 15
    end
    object cdsDptoDestinoTIPOFAT: TStringField
      FieldName = 'TIPOFAT'
      FixedChar = True
      Size = 40
    end
  end
  object dsDptoDestino: TDataSource
    DataSet = cdsDptoDestino
    Left = 503
    Top = 336
  end
  object qrPContasM: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransBoletos
    SQL.Strings = (
      'select * from P_CONTAS_M')
    Left = 575
    Top = 200
  end
  object dspPContasM: TDataSetProvider
    DataSet = qrPContasM
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 575
    Top = 244
  end
  object cdsPContasM: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPContasM'
    BeforeOpen = cdsBoletosBeforeOpen
    Left = 575
    Top = 291
    object cdsPContasMN_CONTA_PLC: TFloatField
      FieldName = 'N_CONTA_PLC'
    end
    object cdsPContasMMES_PLC: TIntegerField
      FieldName = 'MES_PLC'
      Required = True
    end
    object cdsPContasMANO_PLC: TIntegerField
      FieldName = 'ANO_PLC'
      Required = True
    end
    object cdsPContasMVL_M_PLC: TFloatField
      FieldName = 'VL_M_PLC'
    end
    object cdsPContasMDATA_CAD_PC: TDateTimeField
      FieldName = 'DATA_CAD_PC'
    end
    object cdsPContasMDATA_MOD_PC: TDateTimeField
      FieldName = 'DATA_MOD_PC'
    end
    object cdsPContasMCODIGO_EMP: TIntegerField
      FieldName = 'CODIGO_EMP'
      Required = True
    end
  end
  object dsPContasM: TDataSource
    DataSet = cdsPContasM
    Left = 575
    Top = 338
  end
  object qrEmpresa: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransBoletos
    SQL.Strings = (
      'select * from EMPRESA')
    Left = 643
    Top = 200
  end
  object dspEmpresa: TDataSetProvider
    DataSet = qrEmpresa
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 643
    Top = 244
  end
  object cdsEmpresa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEmpresa'
    BeforeOpen = cdsBoletosBeforeOpen
    Left = 643
    Top = 289
    object cdsEmpresaCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsEmpresaNOME_EMP: TStringField
      FieldName = 'NOME_EMP'
      Size = 50
    end
    object cdsEmpresaENDERECO_EMP: TStringField
      FieldName = 'ENDERECO_EMP'
      Size = 50
    end
    object cdsEmpresaBAIRRO_EMP: TStringField
      FieldName = 'BAIRRO_EMP'
      Size = 30
    end
    object cdsEmpresaCIDADE_EMP: TStringField
      FieldName = 'CIDADE_EMP'
      Size = 30
    end
    object cdsEmpresaCEP_EMP: TStringField
      FieldName = 'CEP_EMP'
      FixedChar = True
      Size = 9
    end
    object cdsEmpresaUF_EMP: TIntegerField
      FieldName = 'UF_EMP'
    end
    object cdsEmpresaCGC_EMP: TStringField
      FieldName = 'CGC_EMP'
      Size = 18
    end
    object cdsEmpresaCNPJ_EMP: TStringField
      FieldName = 'CNPJ_EMP'
      Size = 18
    end
    object cdsEmpresaIE_EMP: TStringField
      FieldName = 'IE_EMP'
      Size = 18
    end
    object cdsEmpresaIM_EMP: TStringField
      FieldName = 'IM_EMP'
      Size = 18
    end
    object cdsEmpresaOBSERV_EMP: TStringField
      FieldName = 'OBSERV_EMP'
      Size = 60
    end
    object cdsEmpresaTELEFONE_EMP: TStringField
      FieldName = 'TELEFONE_EMP'
      Size = 14
    end
    object cdsEmpresaPROP_EMP: TStringField
      FieldName = 'PROP_EMP'
      Size = 40
    end
    object cdsEmpresaCAIXA_INTEGRADO: TStringField
      FieldName = 'CAIXA_INTEGRADO'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaFILIAL: TStringField
      FieldName = 'FILIAL'
      Size = 21
    end
    object cdsEmpresaG_CI: TIntegerField
      FieldName = 'G_CI'
    end
    object cdsEmpresaG_CDV: TIntegerField
      FieldName = 'G_CDV'
    end
    object cdsEmpresaG_CDF: TIntegerField
      FieldName = 'G_CDF'
    end
    object cdsEmpresaG_CRO: TIntegerField
      FieldName = 'G_CRO'
    end
    object cdsEmpresaG_CSE: TIntegerField
      FieldName = 'G_CSE'
    end
    object cdsEmpresaEM_NF: TStringField
      FieldName = 'EM_NF'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaMOD_FAT: TStringField
      FieldName = 'MOD_FAT'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaQT_SERV_NF: TIntegerField
      FieldName = 'QT_SERV_NF'
    end
    object cdsEmpresaQT_PROD_NF: TIntegerField
      FieldName = 'QT_PROD_NF'
    end
    object cdsEmpresaDEB_CRED: TStringField
      FieldName = 'DEB_CRED'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaCONEXAO: TStringField
      FieldName = 'CONEXAO'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaN_PED: TStringField
      FieldName = 'N_PED'
      Size = 10
    end
    object cdsEmpresaCONCESS: TStringField
      FieldName = 'CONCESS'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaOBS_PAD_OS: TMemoField
      FieldName = 'OBS_PAD_OS'
      BlobType = ftMemo
      Size = 8
    end
    object cdsEmpresaVND_AB_CUSTO: TStringField
      FieldName = 'VND_AB_CUSTO'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaTX_JUROS: TFloatField
      FieldName = 'TX_JUROS'
    end
    object cdsEmpresaMULTAS: TFloatField
      FieldName = 'MULTAS'
    end
    object cdsEmpresaQTDE_ITENS_NF: TIntegerField
      FieldName = 'QTDE_ITENS_NF'
    end
    object cdsEmpresaNOTA_FISCAL: TIntegerField
      FieldName = 'NOTA_FISCAL'
    end
    object cdsEmpresaPORTA_IMPRESSAO: TStringField
      FieldName = 'PORTA_IMPRESSAO'
      Size = 60
    end
    object cdsEmpresaCALCULADORA: TStringField
      FieldName = 'CALCULADORA'
      Size = 80
    end
    object cdsEmpresaTAMANHOLETRA: TStringField
      FieldName = 'TAMANHOLETRA'
      Size = 10
    end
    object cdsEmpresaQTDE_LINHASNF: TIntegerField
      FieldName = 'QTDE_LINHASNF'
    end
    object cdsEmpresaISS_EMP: TFloatField
      FieldName = 'ISS_EMP'
    end
    object cdsEmpresaQTMESSUG: TIntegerField
      FieldName = 'QTMESSUG'
    end
    object cdsEmpresaCABREQ: TStringField
      FieldName = 'CABREQ'
      Size = 15
    end
    object cdsEmpresaCABOS: TStringField
      FieldName = 'CABOS'
      Size = 15
    end
    object cdsEmpresaDADVAP: TStringField
      FieldName = 'DADVAP'
      FixedChar = True
      Size = 3
    end
    object cdsEmpresaPASTA_FRENTE: TStringField
      FieldName = 'PASTA_FRENTE'
      Size = 21
    end
    object cdsEmpresaNUMERO_END: TIntegerField
      FieldName = 'NUMERO_END'
    end
    object cdsEmpresaALIQPADRAO: TFloatField
      FieldName = 'ALIQPADRAO'
    end
    object cdsEmpresaTP_SUG: TIntegerField
      FieldName = 'TP_SUG'
    end
    object cdsEmpresaTE_SUG: TIntegerField
      FieldName = 'TE_SUG'
    end
    object cdsEmpresaTA_SUG: TIntegerField
      FieldName = 'TA_SUG'
    end
    object cdsEmpresaFP_SUG: TIntegerField
      FieldName = 'FP_SUG'
    end
    object cdsEmpresaMES_RET_SERV1: TIntegerField
      FieldName = 'MES_RET_SERV1'
    end
    object cdsEmpresaKM_RET_SERV1: TIntegerField
      FieldName = 'KM_RET_SERV1'
    end
    object cdsEmpresaMES_RET_SERV3: TIntegerField
      FieldName = 'MES_RET_SERV3'
    end
    object cdsEmpresaKM_RET_SERV3: TIntegerField
      FieldName = 'KM_RET_SERV3'
    end
    object cdsEmpresaINTERV_KM_SERV: TIntegerField
      FieldName = 'INTERV_KM_SERV'
    end
    object cdsEmpresaEMAIL_EMP: TStringField
      FieldName = 'EMAIL_EMP'
      Size = 50
    end
    object cdsEmpresaSMTP_EMP: TStringField
      FieldName = 'SMTP_EMP'
      Size = 50
    end
    object cdsEmpresaLOGIN_EMP: TStringField
      FieldName = 'LOGIN_EMP'
      Size = 50
    end
    object cdsEmpresaCOD_SERV_PADRAO: TIntegerField
      FieldName = 'COD_SERV_PADRAO'
    end
    object cdsEmpresaCPPADPROD: TStringField
      FieldName = 'CPPADPROD'
      Size = 40
    end
    object cdsEmpresaCPPADCL: TStringField
      FieldName = 'CPPADCL'
      Size = 40
    end
    object cdsEmpresaCPPADVEI: TStringField
      FieldName = 'CPPADVEI'
      Size = 40
    end
    object cdsEmpresaLOCAL_PAG: TStringField
      FieldName = 'LOCAL_PAG'
      Size = 60
    end
    object cdsEmpresaTOTDESC_EMP: TFloatField
      FieldName = 'TOTDESC_EMP'
    end
    object cdsEmpresaUTIL_AUD: TStringField
      FieldName = 'UTIL_AUD'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaUTIL_PESQE: TStringField
      FieldName = 'UTIL_PESQE'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaARREDOND: TStringField
      FieldName = 'ARREDOND'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaTOTDESC_EMPA: TFloatField
      FieldName = 'TOTDESC_EMPA'
    end
    object cdsEmpresaMIN_MARGEM_V: TFloatField
      FieldName = 'MIN_MARGEM_V'
    end
    object cdsEmpresaMIN_MARGEM_A: TFloatField
      FieldName = 'MIN_MARGEM_A'
    end
    object cdsEmpresaALT_PERC_MARGEM: TStringField
      FieldName = 'ALT_PERC_MARGEM'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaAPRES_ESTR: TStringField
      FieldName = 'APRES_ESTR'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaDIAS_DEMO_EMP: TIntegerField
      FieldName = 'DIAS_DEMO_EMP'
    end
    object cdsEmpresaDIAS_RES_EMP: TIntegerField
      FieldName = 'DIAS_RES_EMP'
    end
    object cdsEmpresaOBS_BOL: TStringField
      FieldName = 'OBS_BOL'
      Size = 45
    end
    object cdsEmpresaOBS_DECL_OS: TMemoField
      FieldName = 'OBS_DECL_OS'
      BlobType = ftMemo
      Size = 8
    end
    object cdsEmpresaDECL_OBS_OS: TStringField
      FieldName = 'DECL_OBS_OS'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaG_CI_VEIC: TIntegerField
      FieldName = 'G_CI_VEIC'
    end
    object cdsEmpresaG_CDV_VEIC: TIntegerField
      FieldName = 'G_CDV_VEIC'
    end
    object cdsEmpresaG_CDF_VEIC: TIntegerField
      FieldName = 'G_CDF_VEIC'
    end
    object cdsEmpresaG_CRO_VEIC: TIntegerField
      FieldName = 'G_CRO_VEIC'
    end
    object cdsEmpresaG_CSE_VEIC: TIntegerField
      FieldName = 'G_CSE_VEIC'
    end
    object cdsEmpresaG_CI_SERV: TIntegerField
      FieldName = 'G_CI_SERV'
    end
    object cdsEmpresaG_CDV_SERV: TIntegerField
      FieldName = 'G_CDV_SERV'
    end
    object cdsEmpresaG_CDF_SERV: TIntegerField
      FieldName = 'G_CDF_SERV'
    end
    object cdsEmpresaG_CRO_SERV: TIntegerField
      FieldName = 'G_CRO_SERV'
    end
    object cdsEmpresaG_CSE_SERV: TIntegerField
      FieldName = 'G_CSE_SERV'
    end
    object cdsEmpresaG_IR_ADM: TIntegerField
      FieldName = 'G_IR_ADM'
    end
    object cdsEmpresaG_CTRS_ADM: TIntegerField
      FieldName = 'G_CTRS_ADM'
    end
    object cdsEmpresaG_REM_ADM: TIntegerField
      FieldName = 'G_REM_ADM'
    end
    object cdsEmpresaG_REIV_ADM: TIntegerField
      FieldName = 'G_REIV_ADM'
    end
    object cdsEmpresaG_DF_ADM: TIntegerField
      FieldName = 'G_DF_ADM'
    end
    object cdsEmpresaG_DV_ADM: TIntegerField
      FieldName = 'G_DV_ADM'
    end
    object cdsEmpresaCOFINS_EMP: TFloatField
      FieldName = 'COFINS_EMP'
    end
    object cdsEmpresaPIS_EMP: TFloatField
      FieldName = 'PIS_EMP'
    end
    object cdsEmpresaCOMISS_PROD_EMP: TFloatField
      FieldName = 'COMISS_PROD_EMP'
    end
    object cdsEmpresaENC_SOBR_COM: TFloatField
      FieldName = 'ENC_SOBR_COM'
    end
    object cdsEmpresaCUSTO_EST_EMP: TFloatField
      FieldName = 'CUSTO_EST_EMP'
    end
    object cdsEmpresaOUT_ENC_EMP: TFloatField
      FieldName = 'OUT_ENC_EMP'
    end
    object cdsEmpresaDESP_FIXAS: TFloatField
      FieldName = 'DESP_FIXAS'
    end
    object cdsEmpresaJR_CMP_EMP: TFloatField
      FieldName = 'JR_CMP_EMP'
    end
    object cdsEmpresaIMP_RENDA: TFloatField
      FieldName = 'IMP_RENDA'
    end
    object cdsEmpresaCONTR_S_EMP: TFloatField
      FieldName = 'CONTR_S_EMP'
    end
    object cdsEmpresaSIMPLES_EMP: TFloatField
      FieldName = 'SIMPLES_EMP'
    end
    object cdsEmpresaMIN_M_LQ_A: TFloatField
      FieldName = 'MIN_M_LQ_A'
    end
    object cdsEmpresaMIN_M_LQ_V: TFloatField
      FieldName = 'MIN_M_LQ_V'
    end
    object cdsEmpresaUS_MINM_PROD: TStringField
      FieldName = 'US_MINM_PROD'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaCPMF_EMP: TFloatField
      FieldName = 'CPMF_EMP'
    end
    object cdsEmpresaN_CONC_ASS: TIntegerField
      FieldName = 'N_CONC_ASS'
    end
    object cdsEmpresaCASAS_DECIMAIS: TIntegerField
      FieldName = 'CASAS_DECIMAIS'
    end
    object cdsEmpresaSEG_PROD_SERV: TStringField
      FieldName = 'SEG_PROD_SERV'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaDIAS_PREC_TAB: TIntegerField
      FieldName = 'DIAS_PREC_TAB'
    end
    object cdsEmpresaPRAZO_MED_VND: TIntegerField
      FieldName = 'PRAZO_MED_VND'
    end
    object cdsEmpresaCUSTO_BOLETA: TFloatField
      FieldName = 'CUSTO_BOLETA'
    end
    object cdsEmpresaTX_CARTAO: TFloatField
      FieldName = 'TX_CARTAO'
    end
    object cdsEmpresaPERC_VND_CARTAO: TFloatField
      FieldName = 'PERC_VND_CARTAO'
    end
    object cdsEmpresaTX_CARTAO_PARC: TFloatField
      FieldName = 'TX_CARTAO_PARC'
    end
    object cdsEmpresaDIAS_REC_FIN: TIntegerField
      FieldName = 'DIAS_REC_FIN'
    end
    object cdsEmpresaADIC_FIN: TFloatField
      FieldName = 'ADIC_FIN'
    end
    object cdsEmpresaVND_MIN_FIN: TFloatField
      FieldName = 'VND_MIN_FIN'
    end
    object cdsEmpresaVERSAO: TIntegerField
      FieldName = 'VERSAO'
    end
    object cdsEmpresaARREDONDA_PRECO: TStringField
      FieldName = 'ARREDONDA_PRECO'
      FixedChar = True
      Size = 4
    end
    object cdsEmpresaMENSAGEM_EMP: TStringField
      FieldName = 'MENSAGEM_EMP'
      Size = 40
    end
    object cdsEmpresaMAXDESCPARC: TFloatField
      FieldName = 'MAXDESCPARC'
    end
    object cdsEmpresaUS_ROMANEIO: TStringField
      FieldName = 'US_ROMANEIO'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaALMOX: TStringField
      FieldName = 'ALMOX'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaATIVO: TIntegerField
      FieldName = 'ATIVO'
    end
    object cdsEmpresaUS_DECL_REQ: TStringField
      FieldName = 'US_DECL_REQ'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaAT_PRECREP: TStringField
      FieldName = 'AT_PRECREP'
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
    object cdsEmpresaAUT_SERV_CUPOM: TStringField
      FieldName = 'AUT_SERV_CUPOM'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaSUB_SERIE: TIntegerField
      FieldName = 'SUB_SERIE'
    end
    object cdsEmpresaSEQ_ARQ_REMESSA: TIntegerField
      FieldName = 'SEQ_ARQ_REMESSA'
    end
    object cdsEmpresaRECIBO_HTML_BOLETO: TBlobField
      FieldName = 'RECIBO_HTML_BOLETO'
      Size = 8
    end
    object cdsEmpresaPROXIMO_NOSSO_NUMERO: TStringField
      FieldName = 'PROXIMO_NOSSO_NUMERO'
    end
    object cdsEmpresaENDRECO_EMP: TStringField
      FieldName = 'ENDRECO_EMP'
      Size = 50
    end
    object cdsEmpresaATRIBUIR_DATA_SERVIDOR: TStringField
      FieldName = 'ATRIBUIR_DATA_SERVIDOR'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaCFOP_PAD_PROD: TFloatField
      FieldName = 'CFOP_PAD_PROD'
    end
    object cdsEmpresaCFOP_PAD_SERV: TFloatField
      FieldName = 'CFOP_PAD_SERV'
    end
    object cdsEmpresaQTDE_CARAC_ITENSNF: TIntegerField
      FieldName = 'QTDE_CARAC_ITENSNF'
    end
    object cdsEmpresaENDERECOHWFFDB: TStringField
      FieldName = 'ENDERECOHWFFDB'
      Size = 50
    end
    object cdsEmpresaITAUTO: TStringField
      FieldName = 'ITAUTO'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaTPIMPRE: TStringField
      FieldName = 'TPIMPRE'
      FixedChar = True
      Size = 15
    end
    object cdsEmpresaCODBARRADO: TIntegerField
      FieldName = 'CODBARRADO'
    end
    object cdsEmpresaCODDBARRADO: TIntegerField
      FieldName = 'CODDBARRADO'
    end
    object cdsEmpresaNOME_CDL: TStringField
      FieldName = 'NOME_CDL'
      FixedChar = True
      Size = 60
    end
    object cdsEmpresaUF_CDL: TStringField
      FieldName = 'UF_CDL'
      FixedChar = True
      Size = 2
    end
    object cdsEmpresaFONE_CDL: TStringField
      FieldName = 'FONE_CDL'
      FixedChar = True
      Size = 13
    end
    object cdsEmpresaENDERECO_CDL: TStringField
      FieldName = 'ENDERECO_CDL'
      FixedChar = True
      Size = 30
    end
    object cdsEmpresaBAIRRO_CDL: TStringField
      FieldName = 'BAIRRO_CDL'
      FixedChar = True
      Size = 25
    end
    object cdsEmpresaCOD_EMP_CDL: TIntegerField
      FieldName = 'COD_EMP_CDL'
    end
    object cdsEmpresaDIAS_CAR_JUROS: TIntegerField
      FieldName = 'DIAS_CAR_JUROS'
    end
    object cdsEmpresaORDERBY_CRED: TStringField
      FieldName = 'ORDERBY_CRED'
    end
    object cdsEmpresaORDERBY_CH: TStringField
      FieldName = 'ORDERBY_CH'
    end
    object cdsEmpresaESTADO_EMP: TStringField
      FieldName = 'ESTADO_EMP'
      FixedChar = True
      Size = 2
    end
    object cdsEmpresaNFE_CAMINHO_CERT: TStringField
      FieldName = 'NFE_CAMINHO_CERT'
      Size = 50
    end
    object cdsEmpresaNFE_SENHA__CERT: TStringField
      FieldName = 'NFE_SENHA__CERT'
      Size = 30
    end
    object cdsEmpresaNFE_NUMSERIE_CERT: TStringField
      FieldName = 'NFE_NUMSERIE_CERT'
      Size = 50
    end
    object cdsEmpresaNFE_DANFE_TIPO: TStringField
      FieldName = 'NFE_DANFE_TIPO'
      Size = 15
    end
    object cdsEmpresaNFE_DANFE_FOREMISS: TStringField
      FieldName = 'NFE_DANFE_FOREMISS'
      Size = 15
    end
    object cdsEmpresaNFE_LOGOMARCA: TStringField
      FieldName = 'NFE_LOGOMARCA'
      Size = 100
    end
    object cdsEmpresaNFE_LOGPATH: TStringField
      FieldName = 'NFE_LOGPATH'
      Size = 100
    end
    object cdsEmpresaWEBSERV_UF: TStringField
      FieldName = 'WEBSERV_UF'
      Size = 2
    end
    object cdsEmpresaWEBSERV_AMBIENTE: TStringField
      FieldName = 'WEBSERV_AMBIENTE'
      Size = 15
    end
    object cdsEmpresaWEBSERV_VISUALIZAR: TStringField
      FieldName = 'WEBSERV_VISUALIZAR'
      Size = 5
    end
    object cdsEmpresaDIAS_AVISO: TIntegerField
      FieldName = 'DIAS_AVISO'
    end
    object cdsEmpresaNFE_ENDRELRAVE: TStringField
      FieldName = 'NFE_ENDRELRAVE'
      Size = 80
    end
    object cdsEmpresaNFE_ENDERECOPDF: TStringField
      FieldName = 'NFE_ENDERECOPDF'
      Size = 80
    end
    object cdsEmpresaPORTA_SMTP: TIntegerField
      FieldName = 'PORTA_SMTP'
    end
    object cdsEmpresaENVIAEMAILNFE: TStringField
      FieldName = 'ENVIAEMAILNFE'
      Size = 1
    end
    object cdsEmpresaASSUNTO_NFE: TStringField
      FieldName = 'ASSUNTO_NFE'
      Size = 70
    end
    object cdsEmpresaEMAIL_USASSL: TStringField
      FieldName = 'EMAIL_USASSL'
      Size = 1
    end
    object cdsEmpresaEMAIL_SENHA: TStringField
      FieldName = 'EMAIL_SENHA'
      Size = 30
    end
    object cdsEmpresaMENSAGEM_NFE: TBlobField
      FieldName = 'MENSAGEM_NFE'
      Size = 8
    end
    object cdsEmpresaIBGE_COD_CIDADE: TIntegerField
      FieldName = 'IBGE_COD_CIDADE'
    end
    object cdsEmpresaIBGE_CODIGO_UF: TIntegerField
      FieldName = 'IBGE_CODIGO_UF'
    end
    object cdsEmpresaMODELO_NF: TStringField
      FieldName = 'MODELO_NF'
      Size = 3
    end
    object cdsEmpresaSERIE_SCAN: TIntegerField
      FieldName = 'SERIE_SCAN'
    end
    object cdsEmpresaUSO_SERVICO_NFE: TStringField
      FieldName = 'USO_SERVICO_NFE'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaSERIE_SERV_NFE: TIntegerField
      FieldName = 'SERIE_SERV_NFE'
    end
    object cdsEmpresaMODELO_NF_SERV: TStringField
      FieldName = 'MODELO_NF_SERV'
      Size = 3
    end
    object cdsEmpresaUS_EDICAOCLIENTE_VENDA: TStringField
      FieldName = 'US_EDICAOCLIENTE_VENDA'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaCOPIAR_HWF_TERM_RET: TStringField
      FieldName = 'COPIAR_HWF_TERM_RET'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
    end
    object cdsEmpresaREGIME: TStringField
      FieldName = 'REGIME'
    end
    object cdsEmpresaNUM_CREDENC_INTERVENTOR: TStringField
      FieldName = 'NUM_CREDENC_INTERVENTOR'
    end
    object cdsEmpresaDTDEF_CLASSEP: TDateTimeField
      FieldName = 'DTDEF_CLASSEP'
    end
    object cdsEmpresaDTDEFINICAO_GE: TDateTimeField
      FieldName = 'DTDEFINICAO_GE'
    end
    object cdsEmpresaQTDMES_CLASSEP: TIntegerField
      FieldName = 'QTDMES_CLASSEP'
    end
    object cdsEmpresaQTDMES_GE: TIntegerField
      FieldName = 'QTDMES_GE'
    end
    object cdsEmpresaEST_SEGURACAPROD: TIntegerField
      FieldName = 'EST_SEGURACAPROD'
    end
    object cdsEmpresaCODDEPPRODUTOS: TIntegerField
      FieldName = 'CODDEPPRODUTOS'
    end
    object cdsEmpresaCODDEPOFICINA: TIntegerField
      FieldName = 'CODDEPOFICINA'
    end
    object cdsEmpresaCODDEPVEICULOS: TIntegerField
      FieldName = 'CODDEPVEICULOS'
    end
    object cdsEmpresaDTDEF_CLASSE_S: TDateTimeField
      FieldName = 'DTDEF_CLASSE_S'
    end
    object cdsEmpresaQTDMES_CLASSE_S: TIntegerField
      FieldName = 'QTDMES_CLASSE_S'
    end
    object cdsEmpresaCODDEPVEICULOSUS: TIntegerField
      FieldName = 'CODDEPVEICULOSUS'
    end
    object cdsEmpresaDIAS_TRABALHO_MES: TIntegerField
      FieldName = 'DIAS_TRABALHO_MES'
    end
    object cdsEmpresaUSAR_REGRAS_NCM: TStringField
      FieldName = 'USAR_REGRAS_NCM'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaDTEMP: TStringField
      FieldName = 'DTEMP'
      Size = 16
    end
    object cdsEmpresaSPED_IND_PERFIL: TStringField
      FieldName = 'SPED_IND_PERFIL'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaSPED_SUFRAMA: TStringField
      FieldName = 'SPED_SUFRAMA'
      Size = 9
    end
    object cdsEmpresaSPED_IND_ATIV: TIntegerField
      FieldName = 'SPED_IND_ATIV'
    end
    object cdsEmpresaCOD_CONTADOR: TIntegerField
      FieldName = 'COD_CONTADOR'
    end
    object cdsEmpresaFANTASIA_EMP: TStringField
      FieldName = 'FANTASIA_EMP'
      Size = 50
    end
    object cdsEmpresaCOMPLEMENTO_EMP: TStringField
      FieldName = 'COMPLEMENTO_EMP'
      Size = 50
    end
    object cdsEmpresaNFE_DHCONT: TDateTimeField
      FieldName = 'NFE_DHCONT'
    end
    object cdsEmpresaNFE_XJUST: TStringField
      FieldName = 'NFE_XJUST'
      Size = 256
    end
    object cdsEmpresaALIQ_SIMPLES_ICM: TFloatField
      FieldName = 'ALIQ_SIMPLES_ICM'
    end
    object cdsEmpresaALIQ_SIMPLES_ISS: TFloatField
      FieldName = 'ALIQ_SIMPLES_ISS'
    end
    object cdsEmpresaNFE_GRAVALOG: TStringField
      FieldName = 'NFE_GRAVALOG'
      Size = 1
    end
    object cdsEmpresaNFE_TMPRETORNOMIL: TIntegerField
      FieldName = 'NFE_TMPRETORNOMIL'
    end
    object cdsEmpresaNFE_QTDELIMITENFPEND: TIntegerField
      FieldName = 'NFE_QTDELIMITENFPEND'
    end
    object cdsEmpresaNFEPENDEMDIAS: TIntegerField
      FieldName = 'NFEPENDEMDIAS'
    end
    object cdsEmpresaCNAE_FISCAL: TStringField
      FieldName = 'CNAE_FISCAL'
      Size = 7
    end
    object cdsEmpresaCFOP_PAD_DEVOLUCAO: TFloatField
      FieldName = 'CFOP_PAD_DEVOLUCAO'
    end
    object cdsEmpresaBUSCA_COD_NO_PROD: TStringField
      FieldName = 'BUSCA_COD_NO_PROD'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaCONF_FORMPAGAMENTO: TStringField
      FieldName = 'CONF_FORMPAGAMENTO'
      FixedChar = True
      Size = 3
    end
    object cdsEmpresaDESCONSIDERAR_ICMS_NFENT: TStringField
      FieldName = 'DESCONSIDERAR_ICMS_NFENT'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaIND_APUR_IPI: TSmallintField
      FieldName = 'IND_APUR_IPI'
    end
    object cdsEmpresaMS_VAL_LIQ_NFE: TStringField
      FieldName = 'MS_VAL_LIQ_NFE'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaCONFERIR_DIFERENCA_ENTRADA: TStringField
      FieldName = 'CONFERIR_DIFERENCA_ENTRADA'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaMAXIMO_DIFERENCA_ENTRADA: TFloatField
      FieldName = 'MAXIMO_DIFERENCA_ENTRADA'
    end
    object cdsEmpresaNFS_NATOP: TIntegerField
      FieldName = 'NFS_NATOP'
    end
    object cdsEmpresaNFS_REGIMETRIB: TIntegerField
      FieldName = 'NFS_REGIMETRIB'
    end
    object cdsEmpresaNFS_OPTANTESIMPLES: TIntegerField
      FieldName = 'NFS_OPTANTESIMPLES'
    end
    object cdsEmpresaINCENTIVADORCULT: TIntegerField
      FieldName = 'INCENTIVADORCULT'
    end
    object cdsEmpresaNFS_CERT: TStringField
      FieldName = 'NFS_CERT'
      Size = 200
    end
    object cdsEmpresaENV_NFSE: TStringField
      FieldName = 'ENV_NFSE'
      Size = 5
    end
    object cdsEmpresaLICENCANFSE: TStringField
      FieldName = 'LICENCANFSE'
      Size = 300
    end
    object cdsEmpresaENDERECO_PREF: TStringField
      FieldName = 'ENDERECO_PREF'
      Size = 50
    end
    object cdsEmpresaBAIRRO_PREF: TStringField
      FieldName = 'BAIRRO_PREF'
      Size = 30
    end
    object cdsEmpresaCEP_PREF: TStringField
      FieldName = 'CEP_PREF'
      FixedChar = True
      Size = 9
    end
    object cdsEmpresaPORTA_SMTPTSL: TIntegerField
      FieldName = 'PORTA_SMTPTSL'
    end
    object cdsEmpresaCOD_SERV_PAD_RETORNO: TIntegerField
      FieldName = 'COD_SERV_PAD_RETORNO'
    end
    object cdsEmpresaPLACA_PAD_RETORNO: TStringField
      FieldName = 'PLACA_PAD_RETORNO'
      FixedChar = True
      Size = 7
    end
    object cdsEmpresaSPED_MATRIZ_FILIAL: TStringField
      FieldName = 'SPED_MATRIZ_FILIAL'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaSPED_IND_NAT_PJ: TStringField
      FieldName = 'SPED_IND_NAT_PJ'
      FixedChar = True
      Size = 2
    end
    object cdsEmpresaSPED_COD_INC_TRIB: TSmallintField
      FieldName = 'SPED_COD_INC_TRIB'
    end
    object cdsEmpresaSPED_IND_APRO_CRED: TSmallintField
      FieldName = 'SPED_IND_APRO_CRED'
    end
    object cdsEmpresaSPED_COD_TIPO_CONT: TSmallintField
      FieldName = 'SPED_COD_TIPO_CONT'
    end
    object cdsEmpresaGERAR_SPED_PISCOFINS: TStringField
      FieldName = 'GERAR_SPED_PISCOFINS'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaUSAR_REGRA_CFOP_CST_ENTRADA: TStringField
      FieldName = 'USAR_REGRA_CFOP_CST_ENTRADA'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaUSAR_REGRA_CFOP_CST_SAIDA: TStringField
      FieldName = 'USAR_REGRA_CFOP_CST_SAIDA'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaMD5: TStringField
      FieldName = 'MD5'
      Size = 256
    end
  end
  object dsEmpresa: TDataSource
    DataSet = cdsEmpresa
    Left = 643
    Top = 337
  end
  object qrRateioContas: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransBoletos
    SQL.Strings = (
      'select * from CONTAS_REL_ORIGEM')
    Left = 720
    Top = 200
  end
  object dspRateioContas: TDataSetProvider
    DataSet = qrRateioContas
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 720
    Top = 244
  end
  object cdsRateioContas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRateioContas'
    BeforeOpen = cdsBoletosBeforeOpen
    Left = 720
    Top = 288
    object cdsRateioContasN_CONTA_PLC_OR: TFloatField
      DisplayLabel = 'N'#250'mero Conta Origem'
      FieldName = 'N_CONTA_PLC_OR'
    end
    object cdsRateioContasN_CONTA_PLC_VAL: TFloatField
      Tag = 1
      DisplayLabel = 'N'#186' Conta de Origem para Rateio'
      FieldName = 'N_CONTA_PLC_VAL'
    end
    object cdsRateioContasN_CONTA_DEST: TFloatField
      DisplayLabel = 'N'#250'mero Conta Destino para Rateio'
      FieldName = 'N_CONTA_DEST'
    end
    object cdsRateioContasMESES: TIntegerField
      Tag = 1
      DisplayLabel = 'M'#234'ses'
      FieldName = 'MESES'
    end
  end
  object dsRateioContas: TDataSource
    DataSet = cdsRateioContas
    Left = 720
    Top = 335
  end
  object qrHistPContas: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransBoletos
    SQL.Strings = (
      'select * from HISTORICO_P_CONTAS')
    Left = 32
    Top = 384
  end
  object dspHistPContas: TDataSetProvider
    DataSet = qrHistPContas
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 32
    Top = 432
  end
  object cdsHistPContas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspHistPContas'
    BeforeOpen = cdsBoletosBeforeOpen
    Left = 32
    Top = 480
    object cdsHistPContasNUMERO_CONTA: TFloatField
      DisplayLabel = 'N'#250'mero da Conta'
      FieldName = 'NUMERO_CONTA'
    end
    object cdsHistPContasHISTORICO: TStringField
      DisplayLabel = 'Hist'#243'rico da Conta'
      FieldName = 'HISTORICO'
      Required = True
      Size = 60
    end
    object cdsHistPContasATIVO: TIntegerField
      Tag = 1
      FieldName = 'ATIVO'
    end
  end
  object dsHistPContas: TDataSource
    DataSet = cdsHistPContas
    Left = 32
    Top = 528
  end
  object qrPContasBalanco: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransBoletos
    SQL.Strings = (
      'select p.*, d.tipo_balanco, d.codigo_int_bal, d.desc_balanco,'
      
        'd.subtipo, d.sinal, d.prazoinicial, d.prazofinal, emp.identifica' +
        'cao_emp from p_contas_balanco p'
      'inner join empresa emp on emp.cod_empresa = p.cod_empresa'
      
        'inner join dados_balanco d on d.codseq_balanco = p.codseq_balanc' +
        'o'
      '')
    Left = 120
    Top = 384
    object qrPContasBalancoN_CONTA_PLC: TFloatField
      FieldName = 'N_CONTA_PLC'
      Origin = '"P_CONTAS_BALANCO"."N_CONTA_PLC"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qrPContasBalancoCODSEQ_BALANCO: TIntegerField
      FieldName = 'CODSEQ_BALANCO'
      Origin = '"P_CONTAS_BALANCO"."CODSEQ_BALANCO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrPContasBalancoCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Origin = '"P_CONTAS_BALANCO"."COD_EMPRESA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrPContasBalancoATIVO: TIntegerField
      FieldName = 'ATIVO'
      Origin = '"P_CONTAS_BALANCO"."ATIVO"'
    end
    object qrPContasBalancoTIPO_BALANCO: TIBStringField
      FieldName = 'TIPO_BALANCO'
      Origin = '"DADOS_BALANCO"."TIPO_BALANCO"'
      ProviderFlags = []
      Size = 7
    end
    object qrPContasBalancoCODIGO_INT_BAL: TIBStringField
      FieldName = 'CODIGO_INT_BAL'
      Origin = '"DADOS_BALANCO"."CODIGO_INT_BAL"'
      ProviderFlags = []
      Size = 10
    end
    object qrPContasBalancoDESC_BALANCO: TIBStringField
      FieldName = 'DESC_BALANCO'
      Origin = '"DADOS_BALANCO"."DESC_BALANCO"'
      ProviderFlags = []
      FixedChar = True
      Size = 30
    end
    object qrPContasBalancoSUBTIPO: TIBStringField
      FieldName = 'SUBTIPO'
      Origin = '"DADOS_BALANCO"."SUBTIPO"'
      ProviderFlags = []
    end
    object qrPContasBalancoSINAL: TIBStringField
      FieldName = 'SINAL'
      Origin = '"DADOS_BALANCO"."SINAL"'
      ProviderFlags = []
      Size = 1
    end
    object qrPContasBalancoIDENTIFICACAO_EMP: TIBStringField
      FieldName = 'IDENTIFICACAO_EMP'
      Origin = '"EMPRESA"."IDENTIFICACAO_EMP"'
      ProviderFlags = []
      Size = 64
    end
    object qrPContasBalancoPRAZOINICIAL: TIntegerField
      FieldName = 'PRAZOINICIAL'
      Origin = '"DADOS_BALANCO"."PRAZOINICIAL"'
      ProviderFlags = []
    end
    object qrPContasBalancoPRAZOFINAL: TIntegerField
      FieldName = 'PRAZOFINAL'
      Origin = '"DADOS_BALANCO"."PRAZOFINAL"'
      ProviderFlags = []
    end
  end
  object dspPContasBalanco: TDataSetProvider
    DataSet = qrPContasBalanco
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 120
    Top = 432
  end
  object cdsPContasBalanco: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPContasBalanco'
    BeforeOpen = cdsBoletosBeforeOpen
    Left = 120
    Top = 480
    object cdsPContasBalancoN_CONTA_PLC: TFloatField
      FieldName = 'N_CONTA_PLC'
    end
    object cdsPContasBalancoCODSEQ_BALANCO: TIntegerField
      DisplayLabel = 'C'#243'd. Sequ'#234'ncia'
      FieldName = 'CODSEQ_BALANCO'
      Required = True
    end
    object cdsPContasBalancoCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsPContasBalancoATIVO: TIntegerField
      FieldName = 'ATIVO'
    end
    object cdsPContasBalancoTIPO_BALANCO: TStringField
      FieldName = 'TIPO_BALANCO'
      ProviderFlags = []
      ReadOnly = True
      Size = 7
    end
    object cdsPContasBalancoCODIGO_INT_BAL: TStringField
      FieldName = 'CODIGO_INT_BAL'
      ProviderFlags = []
      ReadOnly = True
      Size = 10
    end
    object cdsPContasBalancoDESC_BALANCO: TStringField
      FieldName = 'DESC_BALANCO'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 30
    end
    object cdsPContasBalancoSUBTIPO: TStringField
      FieldName = 'SUBTIPO'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsPContasBalancoSINAL: TStringField
      FieldName = 'SINAL'
      ProviderFlags = []
      ReadOnly = True
      Size = 1
    end
    object cdsPContasBalancoPRAZOINICIAL: TIntegerField
      FieldName = 'PRAZOINICIAL'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsPContasBalancoPRAZOFINAL: TIntegerField
      FieldName = 'PRAZOFINAL'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsPContasBalancoIDENTIFICACAO_EMP: TStringField
      DisplayLabel = 'Empresa'
      FieldName = 'IDENTIFICACAO_EMP'
      ProviderFlags = []
      Size = 64
    end
  end
  object dsPContasBalanco: TDataSource
    DataSet = cdsPContasBalanco
    Left = 120
    Top = 528
  end
  object qrDptoGrupo: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransBoletos
    SQL.Strings = (
      'select * from DEPART_CT')
    Left = 288
    Top = 200
  end
  object cdsDptoGrupo: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDptoGrupo'
    Left = 288
    Top = 291
    object cdsDptoGrupoCOD_DEP: TIntegerField
      DisplayLabel = 'N'#250'mero do Departamento'
      FieldName = 'COD_DEP'
      Required = True
    end
    object cdsDptoGrupoDESC_DEP: TStringField
      DisplayLabel = 'Descri'#231#227'o do Departamento'
      FieldName = 'DESC_DEP'
      Size = 35
    end
    object cdsDptoGrupoPERC_DEP: TFloatField
      DisplayLabel = 'Percentual do Departamento'
      FieldName = 'PERC_DEP'
    end
    object cdsDptoGrupoTP_DEP: TStringField
      DisplayLabel = 'Tipo de Departamento (T/I)'
      FieldName = 'TP_DEP'
      FixedChar = True
      Size = 1
    end
    object cdsDptoGrupoTIPDEVDEP: TStringField
      FieldName = 'TIPDEVDEP'
    end
    object cdsDptoGrupoTIPOFAT: TStringField
      FieldName = 'TIPOFAT'
      FixedChar = True
      Size = 40
    end
    object cdsDptoGrupoTIPOFATCNT: TStringField
      FieldName = 'TIPOFATCNT'
      Size = 40
    end
    object cdsDptoGrupoTIPDEVDEPCNT: TStringField
      FieldName = 'TIPDEVDEPCNT'
    end
  end
  object dspDptoGrupo: TDataSetProvider
    DataSet = qrDptoGrupo
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 288
    Top = 245
  end
  object dsDptoGrupo: TDataSource
    DataSet = cdsDptoGrupo
    Left = 288
    Top = 339
  end
  object qrAdmCartao: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransBoletos
    SQL.Strings = (
      'select * from ADM_CARTAO WHERE COD_ADM = 0 and COD_EMPRESA = 0')
    Left = 800
    Top = 200
  end
  object dspAdmCartao: TDataSetProvider
    DataSet = qrAdmCartao
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 800
    Top = 244
  end
  object cdsAdmCartao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAdmCartao'
    BeforeOpen = cdsBoletosBeforeOpen
    Left = 800
    Top = 288
    object cdsAdmCartaoCOD_ADM: TIntegerField
      Tag = 2
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_ADM'
      Required = True
    end
    object cdsAdmCartaoDESCRICAO_ADM: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO_ADM'
      Required = True
      Size = 30
    end
    object cdsAdmCartaoNUM_ESTAB_ADM: TIntegerField
      Alignment = taLeftJustify
      DisplayLabel = 'N'#250'mero estabelecimento'
      FieldName = 'NUM_ESTAB_ADM'
    end
    object cdsAdmCartaoEND_ARQUIVO_ADM: TStringField
      DisplayLabel = 'Endere'#231'o arquivo Administradora'
      FieldName = 'END_ARQUIVO_ADM'
      Size = 255
    end
    object cdsAdmCartaoCOD_CLIENTE: TIntegerField
      DisplayLabel = 'C'#243'digo Cliente'
      FieldName = 'COD_CLIENTE'
      Required = True
    end
    object cdsAdmCartaoATIVO: TIntegerField
      Tag = 1
      FieldName = 'ATIVO'
    end
    object cdsAdmCartaoCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsAdmCartaoREDES: TMemoField
      FieldName = 'REDES'
      BlobType = ftMemo
      Size = 8
    end
    object cdsAdmCartaoTAXA_POR_CONTROLE_BANDEIRA: TStringField
      DisplayLabel = 'Definr taxa do cartao por'
      FieldName = 'TAXA_POR_CONTROLE_BANDEIRA'
      FixedChar = True
      Size = 1
    end
    object cdsAdmCartaoCOD_ADQUIRENTE: TIntegerField
      DisplayLabel = 'Cod Adquirente'
      FieldName = 'COD_ADQUIRENTE'
    end
    object cdsAdmCartaoCAMPO_NSU_OBRIG: TStringField
      DisplayLabel = 'Campo Num Doc/NSU/CV obrigatorio'
      FieldName = 'CAMPO_NSU_OBRIG'
      Size = 1
    end
    object cdsAdmCartaoCAMPO_NUM_AUT_OBRIG: TStringField
      DisplayLabel = 'Campo Num Aut obrigatorio'
      FieldName = 'CAMPO_NUM_AUT_OBRIG'
      Size = 1
    end
  end
  object dsAdmCartao: TDataSource
    AutoEdit = False
    DataSet = cdsAdmCartao
    Left = 800
    Top = 335
  end
  object qrTerminalCartao: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransBoletos
    SQL.Strings = (
      'select tc.* from terminal_cartao tc '
      
        'inner join adm_cartao a on a.cod_adm = tc.cod_adm and a.cod_empr' +
        'esa = tc.cod_empresa where tc.cod_adm = 0 and tc.cod_empresa = 0')
    Left = 880
    Top = 200
  end
  object dspTerminalCartao: TDataSetProvider
    DataSet = qrTerminalCartao
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 880
    Top = 244
  end
  object cdsTerminalCartao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTerminalCartao'
    BeforeOpen = cdsBoletosBeforeOpen
    Left = 880
    Top = 288
    object cdsTerminalCartaoCOD_TERM_ADM: TStringField
      Tag = 2
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_TERM_ADM'
      Required = True
      Size = 10
    end
    object cdsTerminalCartaoDESC_TERM_ADM: TStringField
      Tag = 2
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESC_TERM_ADM'
      Size = 30
    end
    object cdsTerminalCartaoCOD_TERMINALF: TIntegerField
      Alignment = taLeftJustify
      DisplayLabel = 'C'#243'digo Terminal Fiscal'
      FieldName = 'COD_TERMINALF'
    end
    object cdsTerminalCartaoCOD_ADM: TIntegerField
      DisplayLabel = 'C'#243'digo Administradora'
      FieldName = 'COD_ADM'
      Required = True
    end
    object cdsTerminalCartaoATIVO: TIntegerField
      Tag = 1
      FieldName = 'ATIVO'
    end
    object cdsTerminalCartaoCOD_EMPRESA: TIntegerField
      Tag = 1
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsTerminalCartaoTIPO: TStringField
      FieldName = 'TIPO'
      Size = 1
    end
  end
  object dsTerminalCartao: TDataSource
    AutoEdit = False
    DataSet = cdsTerminalCartao
    Left = 880
    Top = 335
  end
  object qrOcorrenciaAdm: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransBoletos
    SQL.Strings = (
      
        'select OCORRENCIA_ADM.*, pe.desc_plc as desc_plc_e, ps.desc_plc ' +
        'as desc_plc_s from ocorrencia_adm o'
      
        'left join p_contas pe on pe.n_conta_plc = OCORRENCIA_ADM.n_conta' +
        '_plc_adm'
      
        'left join p_contas ps on ps.n_conta_plc = OCORRENCIA_ADM.n_conta' +
        '_plce_adm'
      
        'where OCORRENCIA_ADM.id_ocorr_adm = 0 and pe.desc_plc_e = '#39' '#39' an' +
        'd ps.desc_plc_s = '#39' '#39)
    Left = 960
    Top = 200
  end
  object dspOcorrenciaAdm: TDataSetProvider
    DataSet = qrOcorrenciaAdm
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 960
    Top = 244
  end
  object cdsOcorrenciaAdm: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspOcorrenciaAdm'
    BeforeOpen = cdsBoletosBeforeOpen
    Left = 960
    Top = 288
    object cdsOcorrenciaAdmID_OCORR_ADM: TIntegerField
      Tag = 2
      Alignment = taLeftJustify
      DisplayLabel = 'C'#243'digo'
      FieldName = 'ID_OCORR_ADM'
      Required = True
    end
    object cdsOcorrenciaAdmTIPO_TABELA_ADM: TStringField
      DisplayLabel = 'Tipo Tabela'
      FieldName = 'TIPO_TABELA_ADM'
      Required = True
      Size = 30
    end
    object cdsOcorrenciaAdmIDTABELA_ADM: TIntegerField
      Alignment = taLeftJustify
      DisplayLabel = 'ID Tabela Adm'
      FieldName = 'IDTABELA_ADM'
      Required = True
    end
    object cdsOcorrenciaAdmDESC_OCORR_ADM: TStringField
      DisplayLabel = 'Descri'#231#227'o Ocorrencia'
      FieldName = 'DESC_OCORR_ADM'
      Size = 50
    end
    object cdsOcorrenciaAdmN_CONTA_PLC_ADM: TFloatField
      Alignment = taLeftJustify
      DisplayLabel = 'C'#243'digo Pl. Contas Saida'
      FieldName = 'N_CONTA_PLC_ADM'
    end
    object cdsOcorrenciaAdmN_CONTA_PLCE_ADM: TFloatField
      Alignment = taLeftJustify
      DisplayLabel = 'C'#243'digo Pl. Contas Entrada'
      FieldName = 'N_CONTA_PLCE_ADM'
    end
    object cdsOcorrenciaAdmDESC_PLC_S: TStringField
      DisplayLabel = 'Descri'#231#227'o Pl. Contas Saida'
      FieldName = 'DESC_PLC_S'
      FixedChar = True
      Size = 30
    end
    object cdsOcorrenciaAdmDESC_PLC_E: TStringField
      DisplayLabel = 'Descri'#231#227'o Pl. Contas Entrada'
      FieldName = 'DESC_PLC_E'
      FixedChar = True
      Size = 30
    end
    object cdsOcorrenciaAdmATIVO: TIntegerField
      Tag = 1
      FieldName = 'ATIVO'
    end
  end
  object dsOcorrenciaAdm: TDataSource
    AutoEdit = False
    DataSet = cdsOcorrenciaAdm
    Left = 960
    Top = 335
  end
  object qrPlanoContasBusca: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransBoletos
    SQL.Strings = (
      
        'select * from P_Contas where ativo = 1 and tipo_plc = '#39'E'#39' order ' +
        'by desc_plc')
    Left = 960
    Top = 384
  end
  object dspPlanoContasBusca: TDataSetProvider
    DataSet = qrPlanoContasBusca
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 960
    Top = 428
  end
  object cdsPlanoContasBusca: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPlanoContasBusca'
    BeforeOpen = cdsBoletosBeforeOpen
    Left = 960
    Top = 472
    object cdsPlanoContasBuscaN_CONTA_PLC: TFloatField
      FieldName = 'N_CONTA_PLC'
    end
    object cdsPlanoContasBuscaGRUP_CT: TIntegerField
      FieldName = 'GRUP_CT'
      Required = True
    end
    object cdsPlanoContasBuscaDESC_PLC: TStringField
      FieldName = 'DESC_PLC'
      Required = True
      FixedChar = True
      Size = 30
    end
    object cdsPlanoContasBuscaTIPO_PLC: TStringField
      FieldName = 'TIPO_PLC'
      FixedChar = True
      Size = 1
    end
    object cdsPlanoContasBuscaSIGLA_PLC: TStringField
      FieldName = 'SIGLA_PLC'
      FixedChar = True
      Size = 6
    end
    object cdsPlanoContasBuscaDATA_CAD_PC: TDateTimeField
      FieldName = 'DATA_CAD_PC'
    end
    object cdsPlanoContasBuscaDATA_MOD_PC: TDateTimeField
      FieldName = 'DATA_MOD_PC'
    end
    object cdsPlanoContasBuscaTIPO_CTP: TStringField
      FieldName = 'TIPO_CTP'
      FixedChar = True
      Size = 1
    end
    object cdsPlanoContasBuscaDESC_PADR: TStringField
      FieldName = 'DESC_PADR'
      FixedChar = True
      Size = 30
    end
    object cdsPlanoContasBuscaCOD_SUB_CT: TIntegerField
      FieldName = 'COD_SUB_CT'
      Required = True
    end
    object cdsPlanoContasBuscaATIVO: TIntegerField
      FieldName = 'ATIVO'
    end
    object cdsPlanoContasBuscaSTHAB: TStringField
      FieldName = 'STHAB'
      FixedChar = True
      Size = 1
    end
    object cdsPlanoContasBuscaCODSEQ_BALANCO: TIntegerField
      FieldName = 'CODSEQ_BALANCO'
    end
    object cdsPlanoContasBuscaTP_VEICULOS: TStringField
      FieldName = 'TP_VEICULOS'
      Size = 1
    end
    object cdsPlanoContasBuscaTPRAT: TStringField
      FieldName = 'TPRAT'
      FixedChar = True
      Size = 1
    end
  end
  object dsPlanoContasBusca: TDataSource
    AutoEdit = False
    DataSet = cdsPlanoContasBusca
    Left = 960
    Top = 519
  end
  object qrPlanoContasBuscaSaida: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransBoletos
    SQL.Strings = (
      
        'select * from P_Contas where ativo = 1 and tipo_plc = '#39'S'#39' order ' +
        'by desc_plc')
    Left = 840
    Top = 376
  end
  object dspPlanoContasBuscaSaida: TDataSetProvider
    DataSet = qrPlanoContasBuscaSaida
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 840
    Top = 428
  end
  object cdsPlanoContasBuscaSaida: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPlanoContasBuscaSaida'
    BeforeOpen = cdsBoletosBeforeOpen
    Left = 840
    Top = 472
    object FloatField1: TFloatField
      FieldName = 'N_CONTA_PLC'
    end
    object IntegerField1: TIntegerField
      FieldName = 'GRUP_CT'
      Required = True
    end
    object StringField1: TStringField
      FieldName = 'DESC_PLC'
      Required = True
      FixedChar = True
      Size = 30
    end
    object StringField2: TStringField
      FieldName = 'TIPO_PLC'
      FixedChar = True
      Size = 1
    end
    object StringField3: TStringField
      FieldName = 'SIGLA_PLC'
      FixedChar = True
      Size = 6
    end
    object DateTimeField1: TDateTimeField
      FieldName = 'DATA_CAD_PC'
    end
    object DateTimeField2: TDateTimeField
      FieldName = 'DATA_MOD_PC'
    end
    object StringField4: TStringField
      FieldName = 'TIPO_CTP'
      FixedChar = True
      Size = 1
    end
    object StringField5: TStringField
      FieldName = 'DESC_PADR'
      FixedChar = True
      Size = 30
    end
    object IntegerField2: TIntegerField
      FieldName = 'COD_SUB_CT'
      Required = True
    end
    object IntegerField3: TIntegerField
      FieldName = 'ATIVO'
    end
    object StringField6: TStringField
      FieldName = 'STHAB'
      FixedChar = True
      Size = 1
    end
    object IntegerField4: TIntegerField
      FieldName = 'CODSEQ_BALANCO'
    end
    object StringField7: TStringField
      FieldName = 'TP_VEICULOS'
      Size = 1
    end
    object StringField8: TStringField
      FieldName = 'TPRAT'
      FixedChar = True
      Size = 1
    end
  end
  object dsPlanoContasBuscaSaida: TDataSource
    AutoEdit = False
    DataSet = cdsPlanoContasBuscaSaida
    Left = 840
    Top = 519
  end
  object dsBandCartao: TDataSource
    AutoEdit = False
    DataSet = cdsBandCartao
    Left = 640
    Top = 64
  end
  object cdsBandCartao: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 640
    Top = 16
    object cdsBandCartaoCOD_BANDEIRA: TIntegerField
      Tag = 2
      DisplayLabel = 'Codigo Bandeira'
      FieldName = 'COD_BANDEIRA'
    end
    object cdsBandCartaoCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Codigo Empresa'
      FieldName = 'COD_EMPRESA'
    end
    object cdsBandCartaoDESCRICAO: TStringField
      Tag = 2
      DisplayLabel = 'Descricao da Bandeira'
      DisplayWidth = 32
      FieldName = 'DESCRICAO'
      Size = 32
    end
    object cdsBandCartaoATIVO: TSmallintField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
  end
  object dsTxBandeiras: TDataSource
    AutoEdit = False
    DataSet = cdsTxBandeiras
    Left = 736
    Top = 64
  end
  object cdsTxBandeiras: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 736
    Top = 16
    object cdsTxBandeirasDESCRICAO_ADM: TStringField
      DisplayLabel = 'Administradora'
      FieldName = 'DESCRICAO_ADM'
      Size = 30
    end
    object cdsTxBandeirasDESCRICAO_BAND: TStringField
      DisplayLabel = 'Bandeira'
      DisplayWidth = 32
      FieldName = 'DESCRICAO_BAND'
      Size = 32
    end
    object cdsTxBandeirasPARCELAS_DE: TSmallintField
      DisplayLabel = 'Parc de'
      FieldName = 'PARCELAS_DE'
    end
    object cdsTxBandeirasPARCELAS_ATE: TSmallintField
      DisplayLabel = 'Parc at'#233
      FieldName = 'PARCELAS_ATE'
    end
    object cdsTxBandeirasTAXA: TFloatField
      DisplayLabel = 'Taxa'
      FieldName = 'TAXA'
    end
    object cdsTxBandeirasDEBITO_CREDITO: TStringField
      DisplayLabel = 'Debito ou Credito'
      FieldName = 'DEBITO_CREDITO'
      Size = 1
    end
    object cdsTxBandeirasSEQID: TIntegerField
      Tag = 2
      DisplayLabel = 'ID'
      FieldName = 'SEQID'
    end
    object cdsTxBandeirasCOD_BANDEIRA: TIntegerField
      DisplayLabel = 'Cod Bandeira'
      FieldName = 'COD_BANDEIRA'
    end
    object cdsTxBandeirasCOD_ADM: TIntegerField
      DisplayLabel = 'Cod Adm'
      FieldName = 'COD_ADM'
    end
    object cdsTxBandeirasCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
    end
    object cdsTxBandeirasATIVOB: TSmallintField
      Tag = 1
      DisplayLabel = 'Bandeira Ativa'
      FieldName = 'ATIVOB'
    end
  end
  object cdsCobrebem: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCobrebem'
    BeforeOpen = cdsBoletosBeforeOpen
    Left = 456
    Top = 105
    object cdsCobrebemCOD_COBREBEM: TIntegerField
      FieldName = 'COD_COBREBEM'
      Required = True
    end
    object cdsCobrebemCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsCobrebemCODIGO_CTRL: TIntegerField
      FieldName = 'CODIGO_CTRL'
    end
    object cdsCobrebemBANCO: TStringField
      FieldName = 'BANCO'
      FixedChar = True
      Size = 3
    end
    object cdsCobrebemCODIGOAGENCIA: TStringField
      FieldName = 'CODIGOAGENCIA'
    end
    object cdsCobrebemNUMEROCONTACORRENTE: TStringField
      FieldName = 'NUMEROCONTACORRENTE'
    end
    object cdsCobrebemCODIGOCEDENTE: TStringField
      FieldName = 'CODIGOCEDENTE'
    end
    object cdsCobrebemINICIONOSSONUMERO: TStringField
      FieldName = 'INICIONOSSONUMERO'
    end
    object cdsCobrebemFIMNOSSONUMERO: TStringField
      FieldName = 'FIMNOSSONUMERO'
    end
    object cdsCobrebemPROXIMONOSSONUMERO: TStringField
      FieldName = 'PROXIMONOSSONUMERO'
    end
    object cdsCobrebemTIPODOCUMENTOCOBRANCA: TStringField
      FieldName = 'TIPODOCUMENTOCOBRANCA'
      Size = 10
    end
    object cdsCobrebemLAYOUTARQUIVOREMESSA: TStringField
      FieldName = 'LAYOUTARQUIVOREMESSA'
    end
    object cdsCobrebemLAYOUTARQUIVORETORNO: TStringField
      FieldName = 'LAYOUTARQUIVORETORNO'
    end
    object cdsCobrebemLAYOUTBOLETOIMPRESSO: TStringField
      FieldName = 'LAYOUTBOLETOIMPRESSO'
      Size = 30
    end
    object cdsCobrebemLAYOUTBOLETOSEMAIL: TStringField
      FieldName = 'LAYOUTBOLETOSEMAIL'
      Size = 30
    end
    object cdsCobrebemHTMLBOLETO: TMemoField
      FieldName = 'HTMLBOLETO'
      BlobType = ftMemo
      Size = 8
    end
    object cdsCobrebemHTMLBOLETOEMAIL: TMemoField
      FieldName = 'HTMLBOLETOEMAIL'
      BlobType = ftMemo
      Size = 8
    end
    object cdsCobrebemOUTRODADOCONFIGURACAO1: TStringField
      FieldName = 'OUTRODADOCONFIGURACAO1'
    end
    object cdsCobrebemOUTRODADOCONFIGURACAO2: TStringField
      FieldName = 'OUTRODADOCONFIGURACAO2'
    end
    object cdsCobrebemARQUIVOLICENCA: TStringField
      FieldName = 'ARQUIVOLICENCA'
      Size = 128
    end
    object cdsCobrebemIMAGENSBOLETO: TStringField
      FieldName = 'IMAGENSBOLETO'
      Size = 128
    end
    object cdsCobrebemIMAGENSLOGOTIPO: TStringField
      FieldName = 'IMAGENSLOGOTIPO'
      Size = 128
    end
    object cdsCobrebemIDENTIFICACAOCEDENTE: TStringField
      FieldName = 'IDENTIFICACAOCEDENTE'
      Size = 64
    end
    object cdsCobrebemIDENTIFICACAOCEDENTE1: TStringField
      FieldName = 'IDENTIFICACAOCEDENTE1'
      Size = 64
    end
    object cdsCobrebemENDERECOREMESSARETORNO: TStringField
      FieldName = 'ENDERECOREMESSARETORNO'
      Size = 128
    end
    object cdsCobrebemEMAIL_ENDERECOCEDENTE: TStringField
      FieldName = 'EMAIL_ENDERECOCEDENTE'
      Size = 64
    end
    object cdsCobrebemEMAIL_URLIMAGENSBOLETO: TStringField
      FieldName = 'EMAIL_URLIMAGENSBOLETO'
      Size = 256
    end
    object cdsCobrebemEMAIL_URLIMAGENSLOGOTIPO: TStringField
      FieldName = 'EMAIL_URLIMAGENSLOGOTIPO'
      Size = 256
    end
    object cdsCobrebemEMAIL_SMTP_SERVIDOR: TStringField
      FieldName = 'EMAIL_SMTP_SERVIDOR'
      Size = 128
    end
    object cdsCobrebemEMAIL_SMTP_PORTA: TIntegerField
      FieldName = 'EMAIL_SMTP_PORTA'
    end
    object cdsCobrebemEMAIL_SMTP_USUARIO: TStringField
      FieldName = 'EMAIL_SMTP_USUARIO'
      Size = 32
    end
    object cdsCobrebemEMAIL_SMTP_SENHA: TStringField
      FieldName = 'EMAIL_SMTP_SENHA'
      Size = 32
    end
    object cdsCobrebemEMAIL_ASSUNTO: TStringField
      FieldName = 'EMAIL_ASSUNTO'
      Size = 64
    end
    object cdsCobrebemSEQUENCIA_REMESSA: TIntegerField
      FieldName = 'SEQUENCIA_REMESSA'
    end
    object cdsCobrebemQTDEDIGNOSSONUMERO: TSmallintField
      FieldName = 'QTDEDIGNOSSONUMERO'
    end
    object cdsCobrebemDIASPROTESTO: TSmallintField
      FieldName = 'DIASPROTESTO'
    end
    object cdsCobrebemATIVO: TIntegerField
      FieldName = 'ATIVO'
    end
    object cdsCobrebemCODIGO_BAIXA: TStringField
      FieldName = 'CODIGO_BAIXA'
    end
    object cdsCobrebemCODIGO_RECUSA: TStringField
      FieldName = 'CODIGO_RECUSA'
    end
  end
  object cdsCtrlBalanco: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCtrlBalanco'
    BeforeOpen = cdsBoletosBeforeOpen
    Left = 376
    Top = 111
    object IntegerField11: TIntegerField
      DisplayLabel = 'C'#243'digo Controle'
      FieldName = 'CODIGO_CTRL'
      Required = True
    end
    object IntegerField12: TIntegerField
      DisplayLabel = 'C'#243'd. Sequ'#234'ncia'
      FieldName = 'CODSEQ_BALANCO'
      Required = True
    end
    object IntegerField13: TIntegerField
      DisplayLabel = 'C'#243'd. Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object IntegerField14: TIntegerField
      FieldName = 'ATIVO'
    end
    object StringField15: TStringField
      FieldName = 'TIPO_BALANCO'
      ProviderFlags = []
      Visible = False
      Size = 7
    end
    object StringField16: TStringField
      FieldName = 'CODIGO_INT_BAL'
      ProviderFlags = []
      Visible = False
      Size = 10
    end
    object StringField17: TStringField
      FieldName = 'DESC_BALANCO'
      ProviderFlags = []
      Visible = False
      FixedChar = True
      Size = 30
    end
    object StringField18: TStringField
      FieldName = 'SUBTIPO'
      ProviderFlags = []
      Visible = False
    end
    object StringField19: TStringField
      FieldName = 'SINAL'
      ProviderFlags = []
      Visible = False
      Size = 1
    end
    object IntegerField15: TIntegerField
      FieldName = 'PRAZOINICIAL'
      ProviderFlags = []
      Visible = False
    end
    object IntegerField16: TIntegerField
      FieldName = 'PRAZOFINAL'
      ProviderFlags = []
      Visible = False
    end
    object StringField20: TStringField
      DisplayLabel = 'Empresa'
      FieldName = 'IDENTIFICACAO_EMP'
      ProviderFlags = []
      Visible = False
      Size = 64
    end
  end
  object qrConciliacaoAdquirente: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransBoletos
    SQL.Strings = (
      'select * from CONCILIACAO_ADQUIRENTE')
    Left = 1072
    Top = 200
  end
  object dspConciliacaoAdquirente: TDataSetProvider
    DataSet = qrConciliacaoAdquirente
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1072
    Top = 244
  end
  object cdsConciliacaoAdquirente: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConciliacaoAdquirente'
    BeforeOpen = cdsBoletosBeforeOpen
    Left = 1072
    Top = 288
    object cdsConciliacaoAdquirenteID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsConciliacaoAdquirenteNOME: TStringField
      FieldName = 'NOME'
      Size = 30
    end
    object cdsConciliacaoAdquirenteATIVO: TSmallintField
      FieldName = 'ATIVO'
    end
  end
  object dsConciliacaoAdquirente: TDataSource
    AutoEdit = False
    DataSet = cdsConciliacaoAdquirente
    Left = 1072
    Top = 335
  end
  object qrEmpresaDefControle: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransBoletos
    SQL.Strings = (
      'select emp.cod_empresa,'
      
        'coalesce(emp.identificacao_emp, emp.nome_emp) identificacao_emp ' +
        'from empresa emp'
      'where emp.financeiro_unificado = '#39'S'#39
      'and emp.codigo_unificadora = 1')
    Left = 872
    Top = 8
  end
  object dspEmpresaDefControle: TDataSetProvider
    DataSet = qrEmpresaDefControle
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 872
    Top = 52
  end
  object dsEmpresaDefControle: TDataSource
    DataSet = cdsEmpresaDefControle
    Left = 872
    Top = 141
  end
  object cdsEmpresaDefControle: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEmpresaDefControle'
    BeforeOpen = cdsBoletosBeforeOpen
    Left = 872
    Top = 97
    object cdsEmpresaDefControleSEL: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'SEL'
      Size = 1
    end
    object cdsEmpresaDefControleCOD_EMPRESA: TIntegerField
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsEmpresaDefControleIDENTIFICACAO_EMP: TStringField
      DisplayLabel = 'Empresa'
      FieldName = 'IDENTIFICACAO_EMP'
      Size = 64
    end
  end
  object qrTaxaEcommerce: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransBoletos
    SQL.Strings = (
      'select ec.*, ctrl.nome_ctrl from controles_taxas_ecommerce ec'
      
        'inner join controles ctrl on ctrl.codigo_ctrl = ec.codigo_ctrl a' +
        'nd ctrl.codigo_emp = ec.cod_empresa'
      'where ec.cod_empresa = 1')
    Left = 224
    Top = 392
  end
  object dspTaxaEcommerce: TDataSetProvider
    DataSet = qrTaxaEcommerce
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 224
    Top = 436
  end
  object cdsTaxaEcommerce: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTaxaEcommerce'
    BeforeOpen = cdsBoletosBeforeOpen
    Left = 224
    Top = 483
    object cdsTaxaEcommerceSEQID: TIntegerField
      Tag = 1
      DisplayLabel = 'Codigo'
      FieldName = 'SEQID'
      Required = True
    end
    object cdsTaxaEcommerceCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsTaxaEcommerceCODIGO_CTRL: TIntegerField
      Tag = 1
      DisplayLabel = 'Codigo Ctrl'
      FieldName = 'CODIGO_CTRL'
      Required = True
    end
    object cdsTaxaEcommerceCONS_FRETE_REGRA: TStringField
      DisplayLabel = 'Cons regra sobre valor do frete'
      FieldName = 'CONS_FRETE_REGRA'
      FixedChar = True
      Size = 1
    end
    object cdsTaxaEcommerceDEBITO_CREDITO: TStringField
      Tag = 1
      DisplayLabel = 'Deb ou Cred'
      FieldName = 'DEBITO_CREDITO'
      FixedChar = True
      Size = 1
    end
    object cdsTaxaEcommerceVALOR_DE: TFloatField
      DisplayLabel = 'Valor de'
      FieldName = 'VALOR_DE'
      DisplayFormat = '##0.00'
    end
    object cdsTaxaEcommerceVALOR_ATE: TFloatField
      DisplayLabel = 'Valor at'#233
      FieldName = 'VALOR_ATE'
      DisplayFormat = '##0.00'
    end
    object cdsTaxaEcommercePARCELAS_DE: TSmallintField
      DisplayLabel = 'Parc de'
      FieldName = 'PARCELAS_DE'
    end
    object cdsTaxaEcommercePARCELAS_ATE: TSmallintField
      DisplayLabel = 'Parc at'#233
      FieldName = 'PARCELAS_ATE'
    end
    object cdsTaxaEcommerceHAB_TAXA_PROD: TStringField
      DisplayLabel = 'Calcular comiss'#227'o sobre produto'
      FieldName = 'HAB_TAXA_PROD'
      FixedChar = True
      Size = 1
    end
    object cdsTaxaEcommerceTAXA_PROD: TFloatField
      DisplayLabel = 'Comiss'#227'o produto  (%)'
      FieldName = 'TAXA_PROD'
      DisplayFormat = '##0.00'
    end
    object cdsTaxaEcommerceHAB_TAXA_FRETE: TStringField
      DisplayLabel = 'Calcular comiss'#227'o sobre frete'
      FieldName = 'HAB_TAXA_FRETE'
      FixedChar = True
      Size = 1
    end
    object cdsTaxaEcommerceTAXA_FRETE: TFloatField
      DisplayLabel = 'Comiss'#227'o frete (%)'
      FieldName = 'TAXA_FRETE'
      DisplayFormat = '##0.00'
    end
    object cdsTaxaEcommerceHAB_TAXA_POR_PEDIDO: TStringField
      DisplayLabel = 'Usar taxa fixa por pedido'
      FieldName = 'HAB_TAXA_POR_PEDIDO'
      FixedChar = True
      Size = 1
    end
    object cdsTaxaEcommerceVL_TAXA_POR_PEDIDO: TFloatField
      DisplayLabel = 'Taxa fixa por pedido (R$)'
      FieldName = 'VL_TAXA_POR_PEDIDO'
      DisplayFormat = '##0.00'
    end
    object cdsTaxaEcommerceHAB_TAXA_POR_ITEM: TStringField
      DisplayLabel = 'Usar taxa fixa por item'
      FieldName = 'HAB_TAXA_POR_ITEM'
      FixedChar = True
      Size = 1
    end
    object cdsTaxaEcommerceVL_TAXA_POR_ITEM: TFloatField
      DisplayLabel = 'Taxa fixa por item (R$)'
      FieldName = 'VL_TAXA_POR_ITEM'
      DisplayFormat = '##0.00'
    end
    object cdsTaxaEcommerceHAB_TAXA_POR_UNIDADE: TStringField
      DisplayLabel = 'Usar taxa fixa por unidade'
      FieldName = 'HAB_TAXA_POR_UNIDADE'
      FixedChar = True
      Size = 1
    end
    object cdsTaxaEcommerceVL_TAXA_POR_UNIDADE: TFloatField
      DisplayLabel = 'Taxa fixa por unidade (R$)'
      FieldName = 'VL_TAXA_POR_UNIDADE'
      DisplayFormat = '##0.00'
    end
    object cdsTaxaEcommerceFRETE_CONTA_SMART_PLACE: TStringField
      DisplayLabel = 'Frete por conta Marketplace'
      FieldName = 'FRETE_CONTA_SMART_PLACE'
      FixedChar = True
      Size = 1
    end
    object cdsTaxaEcommerceATIVO: TIntegerField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
    object cdsTaxaEcommerceNOME_CTRL: TStringField
      Tag = 1
      DisplayLabel = 'Controle'
      FieldName = 'NOME_CTRL'
      Size = 35
    end
  end
  object dsTaxaEcommerce: TDataSource
    DataSet = cdsTaxaEcommerce
    Left = 224
    Top = 530
  end
  object qrEmpresasUnificadas: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransBoletos
    SQL.Strings = (
      
        'select emp.cod_empresa, (emp.identificacao_emp ||'#39' - '#39'|| emp.cnp' +
        'j_emp) identificacao_emp from empresa emp'
      'where emp.cod_empresa in (1)')
    Left = 336
    Top = 392
  end
  object dspEmpresasUnificadas: TDataSetProvider
    DataSet = qrEmpresasUnificadas
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 336
    Top = 436
  end
  object cdsEmpresasUnificadas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEmpresasUnificadas'
    BeforeOpen = cdsBoletosBeforeOpen
    Left = 336
    Top = 483
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
    Left = 336
    Top = 530
  end
  object qrFornecedorConta: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransBoletos
    SQL.Strings = (
      
        'select cod_cliente, cod_empresa, nome_cliente, razao, cpfcgc, ti' +
        'po from clientes')
    Left = 504
    Top = 400
  end
  object dspFornecedorConta: TDataSetProvider
    DataSet = qrFornecedorConta
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 504
    Top = 444
  end
  object cdsFornecedorConta: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFornecedorConta'
    BeforeOpen = cdsBoletosBeforeOpen
    Left = 504
    Top = 491
    object cdsFornecedorContaCOD_CLIENTE: TIntegerField
      FieldName = 'COD_CLIENTE'
      Required = True
    end
    object cdsFornecedorContaCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsFornecedorContaNOME_CLIENTE: TStringField
      FieldName = 'NOME_CLIENTE'
      Required = True
      FixedChar = True
      Size = 35
    end
    object cdsFornecedorContaRAZAO: TStringField
      FieldName = 'RAZAO'
      Required = True
      Size = 60
    end
    object cdsFornecedorContaCPFCGC: TStringField
      FieldName = 'CPFCGC'
      Size = 18
    end
    object cdsFornecedorContaTIPO: TStringField
      FieldName = 'TIPO'
      FixedChar = True
      Size = 1
    end
  end
  object dsFornecedorConta: TDataSource
    DataSet = cdsFornecedorConta
    Left = 504
    Top = 538
  end
  object qrPlanoContasClientes: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransBoletos
    SQL.Strings = (
      'select * from p_contas_clientes')
    Left = 640
    Top = 400
  end
  object dspPlanoContasClientes: TDataSetProvider
    DataSet = qrPlanoContasClientes
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 640
    Top = 444
  end
  object cdsPlanoContasClientes: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPlanoContasClientes'
    BeforeOpen = cdsBoletosBeforeOpen
    Left = 640
    Top = 491
    object cdsPlanoContasClientesN_CONTA_PLC: TFloatField
      DisplayLabel = 'N'#186' Conta'
      FieldName = 'N_CONTA_PLC'
    end
    object cdsPlanoContasClientesCPFCGC: TStringField
      DisplayLabel = 'CPF/CNPJ Fornecedor'
      FieldName = 'CPFCGC'
      Required = True
      Size = 18
    end
    object cdsPlanoContasClientesNOME_CLIENTE: TStringField
      DisplayLabel = 'Cliente'
      FieldKind = fkInternalCalc
      FieldName = 'NOME_CLIENTE'
      Size = 35
    end
    object cdsPlanoContasClientesRAZAO: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'RAZAO'
      Size = 60
    end
  end
  object dsPlanoContasClientes: TDataSource
    DataSet = cdsPlanoContasClientes
    Left = 640
    Top = 538
  end
  object qrPlanoContasRel: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransBoletos
    SQL.Strings = (
      'select * from p_contas_rel')
    Left = 32
    Top = 600
  end
  object dspPlanoContasRel: TDataSetProvider
    DataSet = qrPlanoContasRel
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 32
    Top = 644
  end
  object cdsPlanoContasRel: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPlanoContasRel'
    BeforeOpen = cdsBoletosBeforeOpen
    Left = 32
    Top = 691
    object cdsPlanoContasRelCODIGO: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO'
      Required = True
    end
    object cdsPlanoContasRelNATUREZA: TStringField
      DisplayLabel = 'Natureza'
      FieldName = 'NATUREZA'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsPlanoContasRelDESCRICAO: TStringField
      DisplayLabel = 'Descricao'
      FieldName = 'DESCRICAO'
      Size = 100
    end
    object cdsPlanoContasRelPADRAO: TStringField
      Tag = 1
      DisplayLabel = 'Padrao'
      FieldName = 'PADRAO'
      Size = 1
    end
    object cdsPlanoContasRelATIVO: TIntegerField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
  end
  object dsPlanoContasRel: TDataSource
    DataSet = cdsPlanoContasRel
    Left = 32
    Top = 738
  end
end
