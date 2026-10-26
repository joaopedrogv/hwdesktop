object dtmCIAP: TdtmCIAP
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 479
  Width = 975
  object SpIncCodigo: TIBStoredProc
    Database = dtmAtivo.bancoHw
    Transaction = transacao
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
  object transacao: TIBTransaction
    DefaultDatabase = dtmAtivo.bancoHw
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 112
    Top = 8
  end
  object qrPlContasC: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select * from P_CONTAS_CONTABIL')
    Left = 29
    Top = 64
  end
  object dspPlContasC: TDataSetProvider
    DataSet = qrPlContasC
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 29
    Top = 112
  end
  object cdsPlContasC: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPlContasC'
    BeforeOpen = cdsPlContasCBeforeOpen
    Left = 29
    Top = 160
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
    object cdsPlContasCTIPO_REL: TStringField
      DisplayLabel = 'Tipo no Relatorio'
      FieldName = 'TIPO_REL'
      Size = 10
    end
    object cdsPlContasCSINAL: TStringField
      DisplayLabel = 'Sinal'
      FieldName = 'SINAL'
      Size = 1
    end
    object cdsPlContasCFORMULA: TStringField
      DisplayLabel = 'Formula'
      FieldName = 'FORMULA'
      Size = 128
    end
    object cdsPlContasCSOMARGRUPO: TStringField
      DisplayLabel = 'Grupo de Somat'#243'rio'
      FieldName = 'SOMARGRUPO'
      Size = 1
    end
    object cdsPlContasCSPED: TStringField
      DisplayLabel = 'Montar no Sped'
      FieldName = 'SPED'
      Size = 1
    end
    object cdsPlContasCCOD_CTA_REF: TStringField
      DisplayLabel = 'Cod Conta Referenciada RFB'
      FieldName = 'COD_CTA_REF'
      Size = 60
    end
    object cdsPlContasCCNPJ_EST: TStringField
      DisplayLabel = ' CNPJ do estabelecimento'
      FieldName = 'CNPJ_EST'
      Size = 14
    end
    object cdsPlContasCCOD_CONTADOR: TIntegerField
      DisplayLabel = 'Cod Contabilidade/Contador'
      FieldName = 'COD_CONTADOR'
    end
  end
  object dsPlContasC: TDataSource
    DataSet = cdsPlContasC
    Left = 29
    Top = 208
  end
  object qrBuscas: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    Left = 200
    Top = 8
  end
  object qrCCusto: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select * from CENTRO_CUSTOS')
    Left = 109
    Top = 64
  end
  object dspCCusto: TDataSetProvider
    DataSet = qrCCusto
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 109
    Top = 112
  end
  object cdsCCusto: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCCusto'
    BeforeOpen = cdsPlContasCBeforeOpen
    Left = 109
    Top = 160
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
  object dsCCusto: TDataSource
    DataSet = cdsCCusto
    Left = 109
    Top = 208
  end
  object qrMovCiap: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select * from MOVIMENTO_CIAP')
    Left = 181
    Top = 64
  end
  object dspMovCiap: TDataSetProvider
    DataSet = qrMovCiap
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 181
    Top = 112
  end
  object cdsMovCiap: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspMovCiap'
    BeforeOpen = cdsPlContasCBeforeOpen
    Left = 181
    Top = 160
    object cdsMovCiapCOD_IND_BEM: TIntegerField
      Tag = 2
      DisplayLabel = 'Codigo Bem'
      FieldName = 'COD_IND_BEM'
      Required = True
    end
    object cdsMovCiapDT_MOV: TDateTimeField
      Tag = 2
      DisplayLabel = 'Data Movimento'
      FieldName = 'DT_MOV'
      Required = True
      EditMask = '!99/99/0000;1;_'
    end
    object cdsMovCiapTIPO_MOV: TStringField
      Tag = 2
      DisplayLabel = 'Tipo Mov'
      FieldName = 'TIPO_MOV'
      Required = True
      FixedChar = True
      Size = 2
    end
    object cdsMovCiapCOD_EMPRESA: TIntegerField
      Tag = 1
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsMovCiapVL_IMOB_ICMS_OP: TFloatField
      Tag = 2
      DisplayLabel = 'Valor ICMS Op Prop E'
      FieldName = 'VL_IMOB_ICMS_OP'
      DisplayFormat = '##0.00'
    end
    object cdsMovCiapVL_IMOB_ICMS_ST: TFloatField
      Tag = 2
      DisplayLabel = 'Valor ICMS ST Op Ent'
      FieldName = 'VL_IMOB_ICMS_ST'
      DisplayFormat = '##0.00'
    end
    object cdsMovCiapVL_IMOB_ICMS_FRT: TFloatField
      Tag = 2
      DisplayLabel = 'Valor ICMS Sobre Frete'
      FieldName = 'VL_IMOB_ICMS_FRT'
      DisplayFormat = '##0.00'
    end
    object cdsMovCiapVL_IMOB_ICMS_DIF: TFloatField
      Tag = 2
      DisplayLabel = 'Valor ICMS. Dif Aliq'
      FieldName = 'VL_IMOB_ICMS_DIF'
      DisplayFormat = '##0.00'
    end
    object cdsMovCiapNUM_PARC: TSmallintField
      Tag = 2
      DisplayLabel = 'Num Parcelas ICMS'
      FieldName = 'NUM_PARC'
    end
    object cdsMovCiapVL_PARC_PASS: TFloatField
      Tag = 2
      DisplayLabel = 'Valor Parcela'
      FieldName = 'VL_PARC_PASS'
      DisplayFormat = '##0.00'
    end
    object cdsMovCiapEMISSAO_PROPRIA: TStringField
      DisplayLabel = 'Emiss Prop:'
      FieldName = 'EMISSAO_PROPRIA'
      FixedChar = True
      Size = 1
    end
    object cdsMovCiapCOD_CLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'COD_CLIENTE'
    end
    object cdsMovCiapMODELO_NF: TStringField
      DisplayLabel = 'Modelo NF'
      FieldName = 'MODELO_NF'
      Size = 3
    end
    object cdsMovCiapSERIE: TStringField
      DisplayLabel = 'S'#233'rie NF'
      FieldName = 'SERIE'
      Size = 5
    end
    object cdsMovCiapNUM_NF: TIntegerField
      DisplayLabel = 'Num NF'
      FieldName = 'NUM_NF'
    end
    object cdsMovCiapCHV_NFE_CTE: TStringField
      DisplayLabel = 'Chave NF-e'
      FieldName = 'CHV_NFE_CTE'
      Size = 60
    end
    object cdsMovCiapDATA_DOC: TDateTimeField
      DisplayLabel = 'Data Emiss'#227'o'
      FieldName = 'DATA_DOC'
    end
    object cdsMovCiapNUM_ITEM: TIntegerField
      DisplayLabel = 'Numero do Item'
      FieldName = 'NUM_ITEM'
    end
    object cdsMovCiapGRUPO_PROD: TIntegerField
      DisplayLabel = 'Grupo Prod'
      FieldName = 'GRUPO_PROD'
    end
    object cdsMovCiapCOD_PROD: TStringField
      DisplayLabel = 'Cod Prod'
      FieldName = 'COD_PROD'
      FixedChar = True
      Size = 6
    end
    object cdsMovCiapNUM_DA: TStringField
      DisplayLabel = 'Num Doc Arrecada'#231#227'o'
      FieldName = 'NUM_DA'
      Size = 128
    end
    object cdsMovCiapQTDE: TFloatField
      DisplayLabel = 'Qtde aplicada'
      FieldName = 'QTDE'
    end
    object cdsMovCiapUNID: TStringField
      DisplayLabel = 'Unidade NF'
      FieldName = 'UNID'
      Size = 6
    end
    object cdsMovCiapVL_ICMS_OP_APLICADO: TFloatField
      DisplayLabel = 'Vr ICMS OP Aplicado'
      FieldName = 'VL_ICMS_OP_APLICADO'
    end
    object cdsMovCiapVL_ICMS_ST_APLICADO: TFloatField
      DisplayLabel = 'Vr ICMS ST Aplicado'
      FieldName = 'VL_ICMS_ST_APLICADO'
    end
    object cdsMovCiapVL_ICMS_FRT_APLICADO: TFloatField
      DisplayLabel = 'Vr ICMS Frete CT Aplicado'
      FieldName = 'VL_ICMS_FRT_APLICADO'
    end
    object cdsMovCiapVL_ICMS_DIF_APLICADO: TFloatField
      DisplayLabel = 'Vr ICMS Diferencial Aiq Aplicado'
      FieldName = 'VL_ICMS_DIF_APLICADO'
    end
  end
  object dsMovCiap: TDataSource
    DataSet = cdsMovCiap
    Left = 181
    Top = 208
  end
  object qrEquipamentos: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'SELECT * FROM EQUIPAMENTO where 1=0')
    Left = 268
    Top = 65
  end
  object dspEquipamentos: TDataSetProvider
    DataSet = qrEquipamentos
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 267
    Top = 111
  end
  object cdsEquipamentos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEquipamentos'
    BeforeOpen = cdsPlContasCBeforeOpen
    Left = 268
    Top = 156
    object cdsEquipamentosCOD_EQUIP: TIntegerField
      DisplayLabel = 'Cod. Equipamento'
      FieldName = 'COD_EQUIP'
      Required = True
    end
    object cdsEquipamentosCOD_EMPRESA: TIntegerField
      DisplayLabel = 'Cod. Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsEquipamentosDAT_CAD_EQUI: TDateTimeField
      DisplayLabel = 'Data Cadastro Equipamento'
      FieldName = 'DAT_CAD_EQUI'
    end
    object cdsEquipamentosESTADO_EQUI: TMemoField
      DisplayLabel = 'Conserva'#231#227'o do Equipamento'
      FieldName = 'ESTADO_EQUI'
      BlobType = ftMemo
      Size = 8
    end
    object cdsEquipamentosTIP_EQUIP: TStringField
      DisplayLabel = 'Tipo de Equipamento'
      FieldName = 'TIP_EQUIP'
      FixedChar = True
      Size = 1
    end
    object cdsEquipamentosVLR_EQUI: TFloatField
      DisplayLabel = 'Valor do Equipamento'
      FieldName = 'VLR_EQUI'
      currency = True
    end
    object cdsEquipamentosIND_DEPREC: TFloatField
      DisplayLabel = #205'ndice de Deprecia'#231#227'o'
      FieldName = 'IND_DEPREC'
    end
    object cdsEquipamentosCOD_DEPART: TIntegerField
      DisplayLabel = 'Cod. Departamento'
      FieldName = 'COD_DEPART'
    end
    object cdsEquipamentosCOD_PROP: TIntegerField
      DisplayLabel = 'Cod. do Propriet'#225'rio do Equipamento'
      FieldName = 'COD_PROP'
    end
    object cdsEquipamentosNOM_EQUIP: TStringField
      DisplayLabel = 'Nome do Equipamento'
      FieldName = 'NOM_EQUIP'
      Size = 32
    end
    object cdsEquipamentosN_SERIE: TStringField
      DisplayLabel = 'N'#250'mero de S'#233'rie'
      FieldName = 'N_SERIE'
      Size = 32
    end
    object cdsEquipamentosMARCA: TStringField
      DisplayLabel = 'Marca'
      FieldName = 'MARCA'
      Size = 32
    end
    object cdsEquipamentosMODELO: TStringField
      DisplayLabel = 'Modelo'
      FieldName = 'MODELO'
      Size = 32
    end
    object cdsEquipamentosCOR: TStringField
      DisplayLabel = 'Cor'
      FieldName = 'COR'
      Size = 16
    end
    object cdsEquipamentosATIVO: TIntegerField
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
    object cdsEquipamentosCOD_MARCA: TIntegerField
      DisplayLabel = 'Cod. Marca'
      FieldName = 'COD_MARCA'
      Required = True
    end
    object cdsEquipamentosIDENTIFICACAO: TStringField
      DisplayLabel = 'Identifica'#231#227'o'
      FieldName = 'IDENTIFICACAO'
      FixedChar = True
      Size = 6
    end
    object cdsEquipamentosN_SERIE_FAB: TStringField
      DisplayLabel = 'N'#186' de S'#233'rie do Fabricante ECF'
      FieldName = 'N_SERIE_FAB'
    end
    object cdsEquipamentosN_MEMORIA_FISCAL: TStringField
      DisplayLabel = 'N'#186' Mem'#243'ria Fiscal ECF'
      FieldName = 'N_MEMORIA_FISCAL'
    end
    object cdsEquipamentosCODSEQ_BALANCO: TIntegerField
      FieldName = 'CODSEQ_BALANCO'
    end
    object cdsEquipamentosTIPEQUIP: TStringField
      FieldName = 'TIPEQUIP'
      Size = 1
    end
    object cdsEquipamentosIDENT_MERC: TStringField
      DisplayLabel = '1: Bem-2:Componente'
      FieldName = 'IDENT_MERC'
      FixedChar = True
      Size = 1
    end
    object cdsEquipamentosCOD_PRNC: TIntegerField
      DisplayLabel = 'C'#243'digo Bem Principal'
      FieldName = 'COD_PRNC'
    end
    object cdsEquipamentosCOD_CTA_EQ: TStringField
      DisplayLabel = 'Conta Cont'#225'bil'
      FieldName = 'COD_CTA_EQ'
      Size = 60
    end
    object cdsEquipamentosNR_PARC: TSmallintField
      DisplayLabel = 'N Parcelas Aprop'
      FieldName = 'NR_PARC'
    end
    object cdsEquipamentosCOD_CCUS: TSmallintField
      DisplayLabel = 'Centro Custos'
      FieldName = 'COD_CCUS'
    end
    object cdsEquipamentosFUNC: TMemoField
      DisplayLabel = 'Fun'#231#227'o'
      FieldName = 'FUNC'
      BlobType = ftMemo
      Size = 8
    end
    object cdsEquipamentosVIDA_UTIL: TSmallintField
      DisplayLabel = 'Vida Util'
      FieldName = 'VIDA_UTIL'
    end
    object cdsEquipamentosSPED: TStringField
      DisplayLabel = 'Sped Fiscal'
      FieldName = 'SPED'
      FixedChar = True
      Size = 1
    end
  end
  object dsEquipamentos: TDataSource
    DataSet = cdsEquipamentos
    Left = 269
    Top = 206
  end
  object qrNf: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select * from NOTAFISCAL')
    Left = 352
    Top = 64
  end
  object dspNf: TDataSetProvider
    DataSet = qrNf
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 352
    Top = 112
  end
  object cdsNf: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspNf'
    BeforeOpen = cdsPlContasCBeforeOpen
    Left = 352
    Top = 160
    object cdsNfCOD_NF: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_NF'
      Required = True
    end
    object cdsNfCOD_EMPRESA: TIntegerField
      Tag = 1
      FieldName = 'COD_EMPRESA'
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
    object cdsNfNUM_NF: TIntegerField
      Tag = 2
      DisplayLabel = 'N'#186' NF'
      FieldName = 'NUM_NF'
      Required = True
    end
    object cdsNfSERIE: TStringField
      DisplayLabel = 'S'#233'rie'
      FieldName = 'SERIE'
      Size = 5
    end
    object cdsNfCODIGO_NOP: TFloatField
      Tag = 2
      DisplayLabel = 'CFOP'
      FieldName = 'CODIGO_NOP'
      DisplayFormat = '##0.'
    end
    object cdsNfDESC_NATOP: TStringField
      DisplayLabel = 'Descri'#231#227'o CFOP'
      DisplayWidth = 128
      FieldName = 'DESC_NATOP'
      Size = 128
    end
    object cdsNfCOD_CLIENTE: TIntegerField
      DisplayLabel = 'C'#243'd Cliente'
      FieldName = 'COD_CLIENTE'
      Required = True
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
      DisplayLabel = 'Data Cont'#225'bil'
      FieldName = 'DATA_CONTABIL'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsNfDATA_ENT_SAIDA: TDateTimeField
      DisplayLabel = 'Data Entrada/Sa'#237'da'
      FieldName = 'DATA_ENT_SAIDA'
      EditMask = '!99/99/0000;1;_'
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
    object cdsNfMODELO_NF: TStringField
      DisplayLabel = 'Modelo'
      FieldName = 'MODELO_NF'
      Size = 3
    end
    object cdsNfSTATUS: TStringField
      DisplayLabel = 'Status NF'
      FieldName = 'STATUS'
      Size = 10
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
      DisplayLabel = 'Esp'#233'cie'
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
    object cdsNfRESULTADO_ENVIO: TStringField
      DisplayLabel = 'Resultado Envio NF-e'
      FieldName = 'RESULTADO_ENVIO'
      Size = 30
    end
    object cdsNfDATA_AUTORIZACAO: TDateTimeField
      DisplayLabel = 'Data Autoriza'#231#227'o NF-e'
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
    object cdsNfSITUACAO_NFE: TStringField
      DisplayLabel = 'Situa'#231#227'o NF-e'
      FieldName = 'SITUACAO_NFE'
      Size = 40
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
      DisplayLabel = 'Descri'#231#227'o Erro NF-e'
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
      DisplayLabel = 'N'#186' Form Seg'
      FieldName = 'N_FORM_SEGURANCA'
    end
    object cdsNfNUM_NF_VNDANT: TIntegerField
      DisplayLabel = 'N'#186' Nf Ant'
      FieldName = 'NUM_NF_VNDANT'
    end
    object cdsNfSUB_SERIEANT: TIntegerField
      DisplayLabel = 'Sub S'#233'rie Ant'
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
      DisplayLabel = 'Com Servi'#231'os'
      FieldName = 'COM_SERV'
      Size = 1
    end
    object cdsNfINUTILNFANT: TStringField
      DisplayLabel = 'Inutilizar NF-e Ant.'
      FieldName = 'INUTILNFANT'
      Size = 1
    end
    object cdsNfEMISSAO_PROPRIA: TStringField
      DisplayLabel = 'Emiss'#227'o Pr'#243'pria'
      FieldName = 'EMISSAO_PROPRIA'
      FixedChar = True
      Size = 1
    end
    object cdsNfNUM_PED: TIntegerField
      DisplayLabel = 'N'#186' Pedido'
      FieldName = 'NUM_PED'
    end
    object cdsNfANTEC_TRIB: TStringField
      DisplayLabel = 'Antecipa'#231#227'o Tribut'#225'ria'
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
      Tag = 1
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
      DisplayLabel = 'N'#186' Nf Emiss'#227'o Pr'#243'pria'
      FieldName = 'NUM_NFEM'
    end
    object cdsNfATIVO: TIntegerField
      FieldName = 'ATIVO'
    end
    object cdsNfCOD_USUARIO: TIntegerField
      DisplayLabel = 'Cod Usu'#225'rio'
      FieldName = 'COD_USUARIO'
    end
    object cdsNfNUM_NF_EMT: TIntegerField
      DisplayLabel = 'N'#186' NF Emt'
      FieldName = 'NUM_NF_EMT'
    end
    object cdsNfSERIE_EMT: TStringField
      DisplayLabel = 'S'#233'rie Emt'
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
      DisplayLabel = 'Peso L'#237'quido'
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
      DisplayLabel = 'SubS'#233'rie'
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
      DisplayLabel = 'Lan'#231'amento Fiscal'
      FieldName = 'DADOS_LANCAMENTO_FISCAL'
      BlobType = ftMemo
      Size = 8
    end
    object cdsNfTIPO_EMISSAO: TStringField
      DisplayLabel = 'Tipo Emiss'#227'o NF-e'
      FieldName = 'TIPO_EMISSAO'
      FixedChar = True
      Size = 1
    end
    object cdsNfNFE_CMSG: TSmallintField
      DisplayLabel = 'C'#243'd Msg'
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
      DisplayLabel = 'N'#186' NF Ref'
      FieldName = 'NUM_NF_COMPL'
    end
    object cdsNfSERIE_COMPL: TStringField
      DisplayLabel = 'S'#233'rie NF Ref'
      FieldName = 'SERIE_COMPL'
      Size = 5
    end
    object cdsNfHORA_ENT_SAIDA: TTimeField
      DisplayLabel = 'Hora Entrada/Sa'#237'da'
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
      DisplayLabel = 'NF-e. N'#250'mero DPEC'
      FieldName = 'NFE_DPEC_NREGDPEC'
      Size = 17
    end
    object cdsNfNFE_DHCONT: TDateTimeField
      DisplayLabel = 'NF-e. Data e Hora da entrada em conting'#234'ncia'
      FieldName = 'NFE_DHCONT'
      EditMask = '!99/99/0000 00:00:00;1;_'
    end
    object cdsNfNFE_XJUST: TStringField
      DisplayLabel = 'NF-e. Justificativa da entrada em conting'#234'ncia'
      FieldName = 'NFE_XJUST'
      Size = 256
    end
    object cdsNfN_COMANDO: TIntegerField
      DisplayLabel = 'N'#186' Comando'
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
      DisplayLabel = 'N'#186' Ger'
      FieldName = 'NUM_GERADO'
      FixedChar = True
      Size = 1
    end
    object cdsNfN_CAIXA: TIntegerField
      DisplayLabel = 'N'#186' Caixa'
      FieldName = 'N_CAIXA'
    end
    object cdsNfCOD_CONS: TStringField
      DisplayLabel = 'Classe Consumo Energia El'#233'trica'
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
  end
  object dsNf: TDataSource
    AutoEdit = False
    DataSet = cdsNf
    Left = 352
    Top = 208
  end
  object qrINf: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select * from NOTAFISCAL_ITEM')
    Left = 400
    Top = 64
  end
  object dspINf: TDataSetProvider
    DataSet = qrINf
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 400
    Top = 112
  end
  object cdsINf: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspINf'
    BeforeOpen = cdsPlContasCBeforeOpen
    Left = 400
    Top = 160
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
      Size = 60
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
      DisplayLabel = 'Valot Tot'
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
  end
  object dsINf: TDataSource
    AutoEdit = False
    DataSet = cdsINf
    Left = 400
    Top = 208
  end
  object qrContCF: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select * from SPED_CONT_CRED_FISC')
    Left = 477
    Top = 64
  end
  object dspContCF: TDataSetProvider
    DataSet = qrContCF
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 477
    Top = 112
  end
  object cdsContCF: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspContCF'
    BeforeOpen = cdsPlContasCBeforeOpen
    Left = 477
    Top = 160
    object cdsContCFCOD_CONT_CRED_F: TIntegerField
      Tag = 2
      DisplayLabel = 'Sequencia'
      FieldName = 'COD_CONT_CRED_F'
      Required = True
    end
    object cdsContCFCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsContCFDATA_MOVIMENTO: TDateTimeField
      Tag = 2
      DisplayLabel = 'Data'
      FieldName = 'DATA_MOVIMENTO'
      Required = True
      EditMask = '!99/99/0000;1;_'
    end
    object cdsContCFCOD_AJ_APUR: TStringField
      Tag = 2
      DisplayLabel = 'Codigo Ajuste'
      FieldName = 'COD_AJ_APUR'
      Required = True
      FixedChar = True
      Size = 8
    end
    object cdsContCFSLD_CRED: TFloatField
      Tag = 2
      DisplayLabel = 'Saldo de Creditos Periodos Anteriores'
      FieldName = 'SLD_CRED'
    end
    object cdsContCFCRED_APR: TFloatField
      Tag = 2
      DisplayLabel = 'Cr'#233'dito apropriado no m'#234's'
      FieldName = 'CRED_APR'
    end
    object cdsContCFCRED_RECEB: TFloatField
      Tag = 2
      DisplayLabel = 'Cr'#233'ditos recebidos por transfer'#234'ncia'
      FieldName = 'CRED_RECEB'
    end
    object cdsContCFCRED_UTIL: TFloatField
      Tag = 2
      DisplayLabel = 'Cr'#233'ditos utilizados no per'#237'odo'
      FieldName = 'CRED_UTIL'
    end
    object cdsContCFSLD_CRED_FIM: TFloatField
      Tag = 2
      DisplayLabel = 
        'Saldo de cr'#233'dito fiscal acumulado a transportar para o per'#237'odo s' +
        'eguinte'
      FieldName = 'SLD_CRED_FIM'
    end
  end
  object dsContCF: TDataSource
    DataSet = cdsContCF
    Left = 477
    Top = 208
  end
  object qrItContCF: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select * from SPED_CONT_CRED_FISC_UTIL')
    Left = 565
    Top = 64
  end
  object dspItContCF: TDataSetProvider
    DataSet = qrItContCF
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 565
    Top = 112
  end
  object cdsItContCF: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspItContCF'
    BeforeOpen = cdsPlContasCBeforeOpen
    Left = 565
    Top = 160
    object cdsItContCFCOD_CONT_CRED_F: TIntegerField
      DisplayLabel = 'Seq'
      FieldName = 'COD_CONT_CRED_F'
      Required = True
    end
    object cdsItContCFCOD_EMPRESA: TIntegerField
      DisplayLabel = 'CodEmpresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsItContCFTIPO_UTIL: TStringField
      DisplayLabel = 'Tipo de utiliza'#231#227'o do cr'#233'dito'
      FieldName = 'TIPO_UTIL'
      Required = True
      FixedChar = True
      Size = 4
    end
    object cdsItContCFNR_DOC: TStringField
      DisplayLabel = 'N'#250'mero do documento utilizado na baixa de cr'#233'ditos'
      FieldName = 'NR_DOC'
    end
    object cdsItContCFVL_CRED_UTIL: TFloatField
      DisplayLabel = 'Total de cr'#233'dito utilizado'
      FieldName = 'VL_CRED_UTIL'
    end
  end
  object dsItContCf: TDataSource
    DataSet = cdsItContCF
    Left = 565
    Top = 208
  end
  object qrCSTRel: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select * from RELACAO_CST_PIS_PCONTAS')
    Left = 645
    Top = 64
  end
  object dspCSTRel: TDataSetProvider
    DataSet = qrCSTRel
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 645
    Top = 112
  end
  object cdsCSTRel: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCSTRel'
    BeforeOpen = cdsPlContasCBeforeOpen
    Left = 645
    Top = 160
    object cdsCSTRelCST: TStringField
      DisplayLabel = 'CST PIS COFINS'
      FieldName = 'CST'
      Required = True
      FixedChar = True
      Size = 2
    end
    object cdsCSTRelTIPO: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsCSTRelSUBTIPO: TStringField
      DisplayLabel = 'Sub Tipo'
      FieldName = 'SUBTIPO'
      Required = True
    end
    object cdsCSTRelCOD_CTA: TStringField
      DisplayLabel = 'Conta Anal'#237'tica'
      FieldName = 'COD_CTA'
      Required = True
      Size = 60
    end
  end
  object dsCSTRel: TDataSource
    DataSet = cdsCSTRel
    Left = 645
    Top = 208
  end
end
