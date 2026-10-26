object DtmClientes: TDtmClientes
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 736
  Width = 2533
  object SpIncCodigo: TIBStoredProc
    Database = dtmAtivo.bancoHw
    Transaction = IBTransClientes
    StoredProcName = 'INCREMENTA_CODIGO'
    Left = 24
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
  object IBTransClientes: TIBTransaction
    DefaultDatabase = dtmAtivo.bancoHw
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 95
    Top = 1
  end
  object qrClientes: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransClientes
    SQL.Strings = (
      
        'select CLIENTES.*, LOCALIDADE.LOCALIDADE, LOCALIDADE.COD_SETOR, ' +
        'SETOR.SETOR from CLIENTES '
      
        'LEFT JOIN LOCALIDADE ON LOCALIDADE.COD_LOCALIDADE = CLIENTES.COD' +
        '_LOCALIDADE AND LOCALIDADE.COD_EMPRESA = CLIENTES.COD_EMPRESA'
      
        'LEFT JOIN SETOR ON SETOR.COD_SETOR = LOCALIDADE.COD_SETOR AND SE' +
        'TOR.COD_EMPRESA = LOCALIDADE.COD_EMPRESA'
      'where CLIENTES.COD_CLIENTE = 0 '
      'AND CLIENTES.COD_EMPRESA = 0')
    Left = 24
    Top = 55
  end
  object dspClientes: TDataSetProvider
    DataSet = qrClientes
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 24
    Top = 100
  end
  object CdsClientes: TClientDataSet
    Aggregates = <>
    DisableStringTrim = True
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspClientes'
    BeforeOpen = CdsClientesBeforeOpen
    Left = 24
    Top = 145
    object CdsClientesSEL: TStringField
      Tag = 2
      DisplayLabel = 'Sel'
      FieldKind = fkInternalCalc
      FieldName = 'SEL'
      ProviderFlags = []
      Size = 1
    end
    object CdsClientesCOD_CLIENTE: TIntegerField
      Tag = 2
      DisplayLabel = 'Cod Cliente'
      FieldName = 'COD_CLIENTE'
      Origin = '"CLIENTES"."COD_CLIENTE"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CdsClientesCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Origin = '"CLIENTES"."COD_EMPRESA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CdsClientesCODIGO_UF: TIntegerField
      DisplayLabel = 'Cod UF'
      FieldName = 'CODIGO_UF'
      Origin = '"CLIENTES"."CODIGO_UF"'
      Required = True
    end
    object CdsClientesCODIGO_TIPO: TIntegerField
      DisplayLabel = 'Cod Tipo Cliente'
      FieldName = 'CODIGO_TIPO'
      Origin = '"CLIENTES"."CODIGO_TIPO"'
      Required = True
    end
    object CdsClientesCODIGO_FATURAMENTO: TIntegerField
      DisplayLabel = 'Cod Faturamento'
      FieldName = 'CODIGO_FATURAMENTO'
      Origin = '"CLIENTES"."CODIGO_FATURAMENTO"'
    end
    object CdsClientesEST_CODIGO_UF: TIntegerField
      DisplayLabel = 'Cod UF Cobran'#231'a '
      FieldName = 'EST_CODIGO_UF'
      Origin = '"CLIENTES"."EST_CODIGO_UF"'
      Required = True
    end
    object CdsClientesCPFCGC: TStringField
      Tag = 2
      DisplayLabel = 'CPF / CNPJ'
      FieldName = 'CPFCGC'
      Origin = '"CLIENTES"."CPFCGC"'
      Size = 18
    end
    object CdsClientesNOME_CLIENTE: TStringField
      Tag = 2
      DisplayLabel = 'Nome do Cliente'
      FieldName = 'NOME_CLIENTE'
      Origin = '"CLIENTES"."NOME_CLIENTE"'
      Required = True
      Size = 35
    end
    object CdsClientesRAZAO: TStringField
      DisplayLabel = 'Raz'#227'o Social'
      FieldName = 'RAZAO'
      Origin = '"CLIENTES"."RAZAO"'
      Required = True
      Size = 60
    end
    object CdsClientesINSC_EST: TStringField
      DisplayLabel = 'Inscri'#231#227'o Estadual'
      FieldName = 'INSC_EST'
      Origin = '"CLIENTES"."INSC_EST"'
      Size = 18
    end
    object CdsClientesFAX: TStringField
      DisplayLabel = 'Fax'
      FieldName = 'FAX'
      Origin = '"CLIENTES"."FAX"'
      EditMask = '(99) 9999-9999;0;_'
      FixedChar = True
      Size = 14
    end
    object CdsClientesOBSERVACAO: TStringField
      DisplayLabel = 'Observa'#231#227'o'
      FieldName = 'OBSERVACAO'
      Origin = '"CLIENTES"."OBSERVACAO"'
      Size = 200
    end
    object CdsClientesDATA_CADASTRO: TDateTimeField
      DisplayLabel = 'Data Cadastro'
      FieldName = 'DATA_CADASTRO'
      Origin = '"CLIENTES"."DATA_CADASTRO"'
      EditMask = '!99/99/9999;1;_'
    end
    object CdsClientesDATA_MOD_CAD: TDateTimeField
      DisplayLabel = 'Data Modificac'#227'o'
      FieldName = 'DATA_MOD_CAD'
      Origin = '"CLIENTES"."DATA_MOD_CAD"'
      EditMask = '!99/99/9999;1;_'
    end
    object CdsClientesLIMITE_CREDITO: TFloatField
      DisplayLabel = 'Limite de Cr'#233'dito'
      FieldName = 'LIMITE_CREDITO'
      Origin = '"CLIENTES"."LIMITE_CREDITO"'
      currency = True
    end
    object CdsClientesCONTATO: TStringField
      DisplayLabel = 'Contato'
      DisplayWidth = 32
      FieldName = 'CONTATO'
      Origin = '"CLIENTES"."CONTATO"'
      Size = 32
    end
    object CdsClientesNATURALID: TStringField
      DisplayLabel = 'Naturalidade'
      FieldName = 'NATURALID'
      Origin = '"CLIENTES"."NATURALID"'
    end
    object CdsClientesCONJUGE: TStringField
      DisplayLabel = 'C'#244'njuge'
      FieldName = 'CONJUGE'
      Origin = '"CLIENTES"."CONJUGE"'
      Size = 35
    end
    object CdsClientesLOC_TRAB: TStringField
      DisplayLabel = 'Local de Trabalho'
      FieldName = 'LOC_TRAB'
      Origin = '"CLIENTES"."LOC_TRAB"'
      Size = 30
    end
    object CdsClientesEND_TRAB: TStringField
      DisplayLabel = 'Endere'#231'o de Trabalho'
      FieldName = 'END_TRAB'
      Origin = '"CLIENTES"."END_TRAB"'
      Size = 35
    end
    object CdsClientesFONE_TRAB: TStringField
      DisplayLabel = 'Fone do Trabalho'
      FieldName = 'FONE_TRAB'
      Origin = '"CLIENTES"."FONE_TRAB"'
      EditMask = '(99) 9999-9999;0;_'
      FixedChar = True
      Size = 14
    end
    object CdsClientesCARGO: TStringField
      DisplayLabel = 'Cargo'
      FieldName = 'CARGO'
      Origin = '"CLIENTES"."CARGO"'
      Size = 15
    end
    object CdsClientesRG: TStringField
      FieldName = 'RG'
      Origin = '"CLIENTES"."RG"'
      FixedChar = True
      Size = 10
    end
    object CdsClientesEXPEDIC: TDateTimeField
      DisplayLabel = 'Data Expedi'#231#227'o RG'
      FieldName = 'EXPEDIC'
      Origin = '"CLIENTES"."EXPEDIC"'
      EditMask = '!99/99/9999;1;_'
    end
    object CdsClientesORG_EXPEDIC: TStringField
      DisplayLabel = #211'rg'#227'o Expedi'#231#227'o RG'
      FieldName = 'ORG_EXPEDIC'
      Origin = '"CLIENTES"."ORG_EXPEDIC"'
    end
    object CdsClientesCTPS: TStringField
      DisplayLabel = 'Num Cartareira Trabalho'
      FieldName = 'CTPS'
      Origin = '"CLIENTES"."CTPS"'
      FixedChar = True
      Size = 10
    end
    object CdsClientesREF_BANC1: TStringField
      DisplayLabel = 'Refer'#234'ncia Banc'#225'ria 1'
      FieldName = 'REF_BANC1'
      Origin = '"CLIENTES"."REF_BANC1"'
      Size = 30
    end
    object CdsClientesFONE_BANC1: TStringField
      DisplayLabel = 'Fone Ref Banco 1'
      FieldName = 'FONE_BANC1'
      Origin = '"CLIENTES"."FONE_BANC1"'
      EditMask = '(99) 9999-9999;0;_'
      FixedChar = True
      Size = 14
    end
    object CdsClientesREF_BANC2: TStringField
      DisplayLabel = 'Refer'#234'ncia Banc'#225'ria 2'
      FieldName = 'REF_BANC2'
      Origin = '"CLIENTES"."REF_BANC2"'
      Size = 30
    end
    object CdsClientesFONE_BANC2: TStringField
      DisplayLabel = 'Fone Ref Banco 2'
      FieldName = 'FONE_BANC2'
      Origin = '"CLIENTES"."FONE_BANC2"'
      EditMask = '(99) 9999-9999;0;_'
      FixedChar = True
      Size = 14
    end
    object CdsClientesREF_COM1: TStringField
      DisplayLabel = 'Refer'#234'ncia Comercial 1'
      FieldName = 'REF_COM1'
      Origin = '"CLIENTES"."REF_COM1"'
      Size = 30
    end
    object CdsClientesEND_COM1: TStringField
      DisplayLabel = 'Endere'#231'o Ref Comercial 1'
      FieldName = 'END_COM1'
      Origin = '"CLIENTES"."END_COM1"'
      Size = 30
    end
    object CdsClientesFONE_COM1: TStringField
      DisplayLabel = 'Fone Ref Comercial 1'
      FieldName = 'FONE_COM1'
      Origin = '"CLIENTES"."FONE_COM1"'
      EditMask = '(99) 9999-9999;0;_'
      FixedChar = True
      Size = 14
    end
    object CdsClientesINFORM: TStringField
      DisplayLabel = 'Informa'#231#227'o Ref Com. 1'
      FieldName = 'INFORM'
      Origin = '"CLIENTES"."INFORM"'
      Size = 30
    end
    object CdsClientesPRI_COMPR: TDateTimeField
      DisplayLabel = 'Data 1'#170' Compra Ref Com 1'
      FieldName = 'PRI_COMPR'
      Origin = '"CLIENTES"."PRI_COMPR"'
      EditMask = '!99/99/9999;1;_'
    end
    object CdsClientesULT_COMPR: TDateTimeField
      DisplayLabel = 'Data '#218'ltima Compra Ref Com 1'
      FieldName = 'ULT_COMPR'
      Origin = '"CLIENTES"."ULT_COMPR"'
      EditMask = '!99/99/9999;1;_'
    end
    object CdsClientesCONCEITO: TStringField
      DisplayLabel = 'Conceito Cli Ref Com 1'
      FieldName = 'CONCEITO'
      Origin = '"CLIENTES"."CONCEITO"'
      Size = 15
    end
    object CdsClientesREF_COM2: TStringField
      DisplayLabel = 'Refer'#234'ncia Comercial 2'
      FieldName = 'REF_COM2'
      Origin = '"CLIENTES"."REF_COM2"'
      Size = 30
    end
    object CdsClientesEND_COM2: TStringField
      DisplayLabel = 'Endere'#231'o Ref Comercial 2'
      FieldName = 'END_COM2'
      Origin = '"CLIENTES"."END_COM2"'
      Size = 30
    end
    object CdsClientesFONE_COM2: TStringField
      DisplayLabel = 'Fone Ref Comercial 2'
      FieldName = 'FONE_COM2'
      Origin = '"CLIENTES"."FONE_COM2"'
      EditMask = '(99) 9999-9999;0;_'
      FixedChar = True
      Size = 14
    end
    object CdsClientesINFORM2: TStringField
      DisplayLabel = 'Informa'#231#227'o Ref Com 2'
      FieldName = 'INFORM2'
      Origin = '"CLIENTES"."INFORM2"'
      Size = 30
    end
    object CdsClientesPRI_COMPR2: TDateTimeField
      DisplayLabel = 'Data 1'#170' Compra Ref Com 2'
      FieldName = 'PRI_COMPR2'
      Origin = '"CLIENTES"."PRI_COMPR2"'
      EditMask = '!99/99/9999;1;_'
    end
    object CdsClientesULT_COMPR2: TDateTimeField
      DisplayLabel = 'Data '#218'ltima Compra Ref Com 2'
      FieldName = 'ULT_COMPR2'
      Origin = '"CLIENTES"."ULT_COMPR2"'
      EditMask = '!99/99/9999;1;_'
    end
    object CdsClientesCONCEITO2: TStringField
      DisplayLabel = 'Conceito Cli Ref Com 2'
      FieldName = 'CONCEITO2'
      Origin = '"CLIENTES"."CONCEITO2"'
      Size = 15
    end
    object CdsClientesSPCL: TDateTimeField
      DisplayLabel = 'Data nada consta SPC Local'
      FieldName = 'SPCL'
      Origin = '"CLIENTES"."SPCL"'
      EditMask = '!99/99/9999;1;_'
    end
    object CdsClientesSPCEST: TDateTimeField
      DisplayLabel = 'Data nada consta SPC Estadual'
      FieldName = 'SPCEST'
      Origin = '"CLIENTES"."SPCEST"'
      EditMask = '!99/99/9999;1;_'
    end
    object CdsClientesREGSPC: TDateTimeField
      DisplayLabel = 'Data Registro no SPC'
      FieldName = 'REGSPC'
      Origin = '"CLIENTES"."REGSPC"'
      EditMask = '!99/99/9999;1;_'
    end
    object CdsClientesREGSPCCH: TDateTimeField
      DisplayLabel = 'Data Registro SPC Cheque'
      FieldName = 'REGSPCCH'
      Origin = '"CLIENTES"."REGSPCCH"'
      EditMask = '!99/99/9999;1;_'
    end
    object CdsClientesUS_CAD_CLI: TIntegerField
      DisplayLabel = 'Usu'#225'rio que cadastrou'
      FieldName = 'US_CAD_CLI'
      Origin = '"CLIENTES"."US_CAD_CLI"'
    end
    object CdsClientesDESC_TP_CLIENTE: TStringField
      DisplayLabel = 'Tipo Cliente'
      FieldName = 'DESC_TP_CLIENTE'
      Size = 30
    end
    object CdsClientesFONE_CLIENTE: TStringField
      DisplayLabel = 'Fone Cliente'
      FieldName = 'FONE_CLIENTE'
      Origin = '"CLIENTES"."FONE_CLIENTE"'
      EditMask = '(99) 9999-9999;0;_'
      FixedChar = True
      Size = 13
    end
    object CdsClientesFONE_CELULAR: TStringField
      DisplayLabel = 'Celular'
      FieldName = 'FONE_CELULAR'
      EditMask = '(99) 99999-9999;0;_'
      FixedChar = True
      Size = 13
    end
    object CdsClientesCEP: TStringField
      FieldName = 'CEP'
      Origin = '"CLIENTES"."CEP"'
      Required = True
      EditMask = '00000\-999;0;'
      FixedChar = True
      Size = 9
    end
    object CdsClientesENDERECO: TStringField
      DisplayLabel = 'Endere'#231'o Cliente'
      FieldName = 'ENDERECO'
      Origin = '"CLIENTES"."ENDERECO"'
      Required = True
      Size = 50
    end
    object CdsClientesCOMPLEMENTO: TStringField
      DisplayLabel = 'Complemento'
      FieldName = 'COMPLEMENTO'
      Size = 60
    end
    object CdsClientesNUM_END_CLIENTE: TStringField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'NUM_END_CLIENTE'
      Size = 60
    end
    object CdsClientesBAIRRO: TStringField
      DisplayLabel = 'Bairro'
      FieldName = 'BAIRRO'
      Origin = '"CLIENTES"."BAIRRO"'
      Required = True
      Size = 35
    end
    object CdsClientesCIDADE: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'CIDADE'
      Origin = '"CLIENTES"."CIDADE"'
      Required = True
      Size = 30
    end
    object CdsClientesESTADOS_UF: TStringField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADOS_UF'
      Size = 2
    end
    object CdsClientesCEP_COBRANCA: TStringField
      DisplayLabel = 'CEP Cobran'#231'a'
      FieldName = 'CEP_COBRANCA'
      Origin = '"CLIENTES"."CEP_COBRANCA"'
      EditMask = '00000\-999;0;'
      FixedChar = True
      Size = 9
    end
    object CdsClientesEND_COBRANCA: TStringField
      DisplayLabel = 'Endere'#231'o Cobran'#231'a'
      FieldName = 'END_COBRANCA'
      Origin = '"CLIENTES"."END_COBRANCA"'
      Size = 50
    end
    object CdsClientesCIDA_COBRANCA: TStringField
      DisplayLabel = 'Cidade Cobran'#231'a'
      FieldName = 'CIDA_COBRANCA'
      Origin = '"CLIENTES"."CIDA_COBRANCA"'
      Size = 30
    end
    object CdsClientesBAIRRO_COBRANCA: TStringField
      DisplayLabel = 'Bairro Cobran'#231'a'
      FieldName = 'BAIRRO_COBRANCA'
      Origin = '"CLIENTES"."BAIRRO_COBRANCA"'
      Size = 35
    end
    object CdsClientesESTADOS_UF_COBRANCA: TStringField
      DisplayLabel = 'Estado Cobran'#231'a'
      FieldName = 'ESTADOS_UF_COBRANCA'
      Size = 2
    end
    object CdsClientesOBS_DIV: TMemoField
      DisplayLabel = 'Obs Diversas'
      FieldName = 'OBS_DIV'
      Origin = '"CLIENTES"."OBS_DIV"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
    object CdsClientesPAI: TStringField
      DisplayLabel = 'Pai'
      FieldName = 'PAI'
      Origin = '"CLIENTES"."PAI"'
      Size = 35
    end
    object CdsClientesMAE: TStringField
      DisplayLabel = 'M'#227'e'
      FieldName = 'MAE'
      Origin = '"CLIENTES"."MAE"'
      Size = 35
    end
    object CdsClientesDATA_NASC: TDateTimeField
      DisplayLabel = 'Data Nascimento'
      FieldName = 'DATA_NASC'
      Origin = '"CLIENTES"."DATA_NASC"'
      EditMask = '!99/99/9999;1;_'
    end
    object CdsClientesEMAIL: TStringField
      DisplayLabel = 'E-mail'
      FieldName = 'EMAIL'
      Origin = '"CLIENTES"."EMAIL"'
      Size = 256
    end
    object CdsClientesCOD_CONVENIO: TIntegerField
      DisplayLabel = 'Cod Conv'#234'nio'
      FieldName = 'COD_CONVENIO'
      Origin = '"CLIENTES"."COD_CONVENIO"'
    end
    object CdsClientesCONVENIADO: TStringField
      DisplayLabel = 'Conveniado'
      FieldName = 'CONVENIADO'
      Origin = '"CLIENTES"."CONVENIADO"'
      FixedChar = True
      Size = 1
    end
    object CdsClientesDIA_VENC: TIntegerField
      DisplayLabel = 'Dia Vencimento'
      FieldName = 'DIA_VENC'
      Origin = '"CLIENTES"."DIA_VENC"'
    end
    object CdsClientesCATEGORIA: TStringField
      DisplayLabel = 'Categoria'
      FieldName = 'CATEGORIA'
      Origin = '"CLIENTES"."CATEGORIA"'
      FixedChar = True
      Size = 8
    end
    object CdsClientesCLQTDCOMPRA: TStringField
      DisplayLabel = 'Classe Qtd Compra'
      FieldName = 'CLQTDCOMPRA'
      Origin = '"CLIENTES"."CLQTDCOMPRA"'
      FixedChar = True
      Size = 2
    end
    object CdsClientesCLSOMACOMPRA: TStringField
      DisplayLabel = 'Classe Soma Compras'
      FieldName = 'CLSOMACOMPRA'
      Origin = '"CLIENTES"."CLSOMACOMPRA"'
      FixedChar = True
      Size = 2
    end
    object CdsClientesCLULTIMACOMPRA: TStringField
      DisplayLabel = 'Classe '#218'ltima Compra'
      FieldName = 'CLULTIMACOMPRA'
      Origin = '"CLIENTES"."CLULTIMACOMPRA"'
      FixedChar = True
      Size = 2
    end
    object CdsClientesCLATRASOCOMPRA: TStringField
      DisplayLabel = 'Classe Atraso Compra'
      FieldName = 'CLATRASOCOMPRA'
      Origin = '"CLIENTES"."CLATRASOCOMPRA"'
      FixedChar = True
      Size = 2
    end
    object CdsClientesCLLUCROCLIENTE: TStringField
      DisplayLabel = 'Classe Lucro Cliente'
      FieldName = 'CLLUCROCLIENTE'
      Origin = '"CLIENTES"."CLLUCROCLIENTE"'
      FixedChar = True
      Size = 2
    end
    object CdsClientesLUCROCLIENTE: TFloatField
      DisplayLabel = 'Lucro Cliente'
      FieldName = 'LUCROCLIENTE'
      Origin = '"CLIENTES"."LUCROCLIENTE"'
    end
    object CdsClientesTIPOCLIENTE: TStringField
      DisplayLabel = 'Tipo Cliente (P/V/S)'
      FieldName = 'TIPOCLIENTE'
      Origin = '"CLIENTES"."TIPOCLIENTE"'
      FixedChar = True
      Size = 6
    end
    object CdsClientesCLQTDVEICULO: TStringField
      DisplayLabel = 'Classe Qtd Ve'#237'culo'
      FieldName = 'CLQTDVEICULO'
      Origin = '"CLIENTES"."CLQTDVEICULO"'
      FixedChar = True
      Size = 2
    end
    object CdsClientesCLSOMAVEICULO: TStringField
      DisplayLabel = 'Classe Soma Ve'#237'culo'
      FieldName = 'CLSOMAVEICULO'
      Origin = '"CLIENTES"."CLSOMAVEICULO"'
      FixedChar = True
      Size = 2
    end
    object CdsClientesCLULTIMOVEICULO: TStringField
      DisplayLabel = 'Classe '#218'ltimo Ve'#237'culo'
      FieldName = 'CLULTIMOVEICULO'
      Origin = '"CLIENTES"."CLULTIMOVEICULO"'
      FixedChar = True
      Size = 2
    end
    object CdsClientesCLLUCROVEICULO: TStringField
      DisplayLabel = 'Classe Lucro Ve'#237'culo'
      FieldName = 'CLLUCROVEICULO'
      Origin = '"CLIENTES"."CLLUCROVEICULO"'
      FixedChar = True
      Size = 2
    end
    object CdsClientesLUCROCLIENTE_V: TFloatField
      DisplayLabel = 'Lucro Cliente Ve'#237'culo'
      FieldName = 'LUCROCLIENTE_V'
      Origin = '"CLIENTES"."LUCROCLIENTE_V"'
    end
    object CdsClientesV_Q_VEICULO: TFloatField
      DisplayLabel = 'Qtd Ve'#237'culos'
      FieldName = 'V_Q_VEICULO'
      Origin = '"CLIENTES"."V_Q_VEICULO"'
    end
    object CdsClientesM_Q_VEICULO: TFloatField
      DisplayLabel = 'Media Qtd Ve'#237'culos'
      FieldName = 'M_Q_VEICULO'
      Origin = '"CLIENTES"."M_Q_VEICULO"'
    end
    object CdsClientesV_T_VEICULO: TFloatField
      DisplayLabel = 'Valor total Ve'#237'culos'
      FieldName = 'V_T_VEICULO'
      Origin = '"CLIENTES"."V_T_VEICULO"'
    end
    object CdsClientesM_T_VEICULO: TFloatField
      DisplayLabel = 'Media Valor Ve'#237'culos'
      FieldName = 'M_T_VEICULO'
      Origin = '"CLIENTES"."M_T_VEICULO"'
    end
    object CdsClientesV_L_VEICULO: TFloatField
      DisplayLabel = 'Lucro Ve'#237'culos'
      FieldName = 'V_L_VEICULO'
      Origin = '"CLIENTES"."V_L_VEICULO"'
    end
    object CdsClientesM_L_VEICULO: TFloatField
      DisplayLabel = 'Media Lucro Ve'#237'culos'
      FieldName = 'M_L_VEICULO'
      Origin = '"CLIENTES"."M_L_VEICULO"'
    end
    object CdsClientesDATA_ULT_VENDA_V: TDateTimeField
      DisplayLabel = 'Dt. '#218'ltima Venda Ve'#237'culo'
      FieldName = 'DATA_ULT_VENDA_V'
      Origin = '"CLIENTES"."DATA_ULT_VENDA_V"'
    end
    object CdsClientesMEDIA_FREQUENCIA_V: TFloatField
      DisplayLabel = 'Media Frequ'#234'ncia Compra V'
      FieldName = 'MEDIA_FREQUENCIA_V'
      Origin = '"CLIENTES"."MEDIA_FREQUENCIA_V"'
    end
    object CdsClientesMEDIAFREQUENCIA: TFloatField
      DisplayLabel = 'Media Frequ'#234'ncia Compra'
      FieldName = 'MEDIAFREQUENCIA'
      Origin = '"CLIENTES"."MEDIAFREQUENCIA"'
    end
    object CdsClientesV_Q_COMPRA: TFloatField
      DisplayLabel = 'Qtd Compras'
      FieldName = 'V_Q_COMPRA'
      Origin = '"CLIENTES"."V_Q_COMPRA"'
    end
    object CdsClientesM_Q_COMPRA: TFloatField
      DisplayLabel = 'Media Qtd Compras'
      FieldName = 'M_Q_COMPRA'
      Origin = '"CLIENTES"."M_Q_COMPRA"'
    end
    object CdsClientesV_T_COMPRA: TFloatField
      DisplayLabel = 'Valor Total Compras'
      FieldName = 'V_T_COMPRA'
      Origin = '"CLIENTES"."V_T_COMPRA"'
    end
    object CdsClientesM_T_COMPRA: TFloatField
      DisplayLabel = 'Media Valor Compras'
      FieldName = 'M_T_COMPRA'
      Origin = '"CLIENTES"."M_T_COMPRA"'
    end
    object CdsClientesV_L_COMPRA: TFloatField
      DisplayLabel = 'Lucro Compras'
      FieldName = 'V_L_COMPRA'
      Origin = '"CLIENTES"."V_L_COMPRA"'
    end
    object CdsClientesM_L_COMPRA: TFloatField
      DisplayLabel = 'Media Lucro Compras'
      FieldName = 'M_L_COMPRA'
      Origin = '"CLIENTES"."M_L_COMPRA"'
    end
    object CdsClientesV_A_COMPRA: TFloatField
      DisplayLabel = 'Qtd Dias Atraso'
      FieldName = 'V_A_COMPRA'
      Origin = '"CLIENTES"."V_A_COMPRA"'
    end
    object CdsClientesM_A_COMPRA: TFloatField
      DisplayLabel = 'Media Dias Atraso'
      FieldName = 'M_A_COMPRA'
      Origin = '"CLIENTES"."M_A_COMPRA"'
    end
    object CdsClientesNEC_ACOMP: TStringField
      DisplayLabel = 'Acompanhamento'
      FieldName = 'NEC_ACOMP'
      Origin = '"CLIENTES"."NEC_ACOMP"'
      FixedChar = True
      Size = 1
    end
    object CdsClientesDIAS_ACOMP: TIntegerField
      DisplayLabel = 'Dias Acompanhamento'
      FieldName = 'DIAS_ACOMP'
      Origin = '"CLIENTES"."DIAS_ACOMP"'
    end
    object CdsClientesSEXO: TStringField
      DisplayLabel = 'Sexo'
      FieldName = 'SEXO'
      Origin = '"CLIENTES"."SEXO"'
      FixedChar = True
      Size = 1
    end
    object CdsClientesRAMO_ATIVIDADE: TStringField
      DisplayLabel = 'Ramo de Atividade'
      FieldName = 'RAMO_ATIVIDADE'
      Origin = '"CLIENTES"."RAMO_ATIVIDADE"'
      Size = 60
    end
    object CdsClientesCOD_CIDADE: TSmallintField
      DisplayLabel = 'Cod Cidade'
      FieldName = 'COD_CIDADE'
      Origin = '"CLIENTES"."COD_CIDADE"'
    end
    object CdsClientesCOD_BAIRRO: TSmallintField
      DisplayLabel = 'Cod Bairro'
      FieldName = 'COD_BAIRRO'
      Origin = '"CLIENTES"."COD_BAIRRO"'
    end
    object CdsClientesCOD_CIDADE_COBRANCA: TSmallintField
      DisplayLabel = 'Cod Cidade Cobran'#231'a'
      FieldName = 'COD_CIDADE_COBRANCA'
      Origin = '"CLIENTES"."COD_CIDADE_COBRANCA"'
    end
    object CdsClientesCOD_BAIRRO_COBRANCA: TSmallintField
      DisplayLabel = 'Cod Bairro Cobran'#231'a'
      FieldName = 'COD_BAIRRO_COBRANCA'
      Origin = '"CLIENTES"."COD_BAIRRO_COBRANCA"'
    end
    object CdsClientesESTADO_CIVIL: TStringField
      DisplayLabel = 'Estado Civ'#237'l '
      FieldName = 'ESTADO_CIVIL'
      Origin = '"CLIENTES"."ESTADO_CIVIL"'
      Size = 32
    end
    object CdsClientesTIPVCLIENTE: TStringField
      DisplayLabel = 'Tipo Venda ao Cliente'
      DisplayWidth = 1
      FieldName = 'TIPVCLIENTE'
      Origin = '"CLIENTES"."TIPVCLIENTE"'
      Size = 1
    end
    object CdsClientesCAMP_PR_VENDA: TStringField
      DisplayLabel = 'Pre'#231'o Venda ao Cliente'
      FieldName = 'CAMP_PR_VENDA'
      Origin = '"CLIENTES"."CAMP_PR_VENDA"'
    end
    object CdsClientesPERC_DESC: TFloatField
      DisplayLabel = 'Maximo Desconto (%)'
      FieldName = 'PERC_DESC'
      Origin = '"CLIENTES"."PERC_DESC"'
    end
    object CdsClientesATIVO: TIntegerField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
      Origin = '"CLIENTES"."ATIVO"'
    end
    object CdsClientesCOD_CONTADOR: TIntegerField
      DisplayLabel = 'Cod Contador'
      FieldName = 'COD_CONTADOR'
      Origin = '"CLIENTES"."COD_CONTADOR"'
    end
    object CdsClientesTIPO: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Origin = '"CLIENTES"."TIPO"'
      FixedChar = True
      Size = 1
    end
    object CdsClientesINSC_SUB_F: TStringField
      DisplayLabel = 'Insc Sub Tribut'#225'rio'
      FieldName = 'INSC_SUB_F'
      Origin = '"CLIENTES"."INSC_SUB_F"'
      FixedChar = True
      Size = 18
    end
    object CdsClientesCDMICROEPP: TStringField
      DisplayLabel = 'Situa'#231#227'o Fornec junto '#224' AF '
      FieldName = 'CDMICROEPP'
      Origin = '"CLIENTES"."CDMICROEPP"'
      FixedChar = True
      Size = 1
    end
    object CdsClientesTEL_RES_CF: TStringField
      DisplayLabel = 'Telefone residencial Fornec'
      FieldName = 'TEL_RES_CF'
      Origin = '"CLIENTES"."TEL_RES_CF"'
      FixedChar = True
      Size = 14
    end
    object CdsClientesRAMAL: TStringField
      DisplayLabel = 'Ramal'
      FieldName = 'RAMAL'
      FixedChar = True
      Size = 5
    end
    object CdsClientesCOD_VENDEDOR: TIntegerField
      DisplayLabel = 'Carteira Venda Mercadorias'
      FieldName = 'COD_VENDEDOR'
    end
    object CdsClientesCOD_VENDEDORV: TIntegerField
      DisplayLabel = 'Carteira Venda Veiculos'
      FieldName = 'COD_VENDEDORV'
    end
    object CdsClientesREGIME: TStringField
      DisplayLabel = 'Regime de Impostos Federais'
      FieldName = 'REGIME'
    end
    object CdsClientesCOD_COND_PAG: TIntegerField
      DisplayLabel = 'Cod Cond Pag'
      FieldName = 'COD_COND_PAG'
    end
    object CdsClientesINSC_MUNICIPAL: TStringField
      DisplayLabel = 'Inscri'#231#227'o Municipal'
      FieldName = 'INSC_MUNICIPAL'
      Size = 15
    end
    object CdsClientesCALCULAR_ST_NF_SAIDA: TStringField
      DisplayLabel = 'Calcular ST Nf Saida'
      FieldName = 'CALCULAR_ST_NF_SAIDA'
      FixedChar = True
      Size = 1
    end
    object CdsClientesCODIGO_SWHW: TIntegerField
      FieldName = 'CODIGO_SWHW'
    end
    object CdsClientesCOD_PAIS: TIntegerField
      DisplayLabel = 'Cod Pais'
      FieldName = 'COD_PAIS'
    end
    object CdsClientesCONSUMIDOR_FINAL: TStringField
      DisplayLabel = 'Consumidor Final'
      FieldName = 'CONSUMIDOR_FINAL'
      Size = 1
    end
    object CdsClientesCOD_LOCALIDADE: TIntegerField
      DisplayLabel = 'Cod Localidade'
      FieldName = 'COD_LOCALIDADE'
    end
    object CdsClientesDATA_AGENDADA: TDateTimeField
      DisplayLabel = 'Data Agendada (Televenda)'
      FieldName = 'DATA_AGENDADA'
      EditMask = '!99/99/0000;1;_'
    end
    object CdsClientesACEITA_CONTATO_TLV: TStringField
      DisplayLabel = 'Televenda - Aceita contato'
      FieldName = 'ACEITA_CONTATO_TLV'
      Size = 1
    end
    object CdsClientesDIAS_CONTATO_TLV: TSmallintField
      DisplayLabel = 'Televenda - Intervalo dias contato'
      FieldName = 'DIAS_CONTATO_TLV'
    end
    object CdsClientesDIASPROTESTO: TSmallintField
      DisplayLabel = 'Dias Protesto'
      FieldName = 'DIASPROTESTO'
    end
    object CdsClientesCOD_TAB_PRECO: TIntegerField
      DisplayLabel = 'Cod Tab Preco'
      FieldName = 'COD_TAB_PRECO'
    end
    object CdsClientesPRAZO_MEDIO_ENT: TFloatField
      DisplayLabel = 'Prazo Entr'
      FieldName = 'PRAZO_MEDIO_ENT'
    end
    object CdsClientesPRAZO_MEDIO_PAG: TFloatField
      DisplayLabel = 'Prazo Pag'
      FieldName = 'PRAZO_MEDIO_PAG'
    end
    object CdsClientesVALOR_ATRIBUTOS: TFloatField
      DisplayLabel = 'Notas Atr'
      FieldName = 'VALOR_ATRIBUTOS'
    end
    object CdsClientesUSAR_LIBERACAO_FINANCEIRO: TStringField
      DisplayLabel = 'Usar Libera'#231#227'o Financeiro'
      FieldName = 'USAR_LIBERACAO_FINANCEIRO'
      Size = 1
    end
    object CdsClientesIDMOBILE_INS: TIntegerField
      DisplayLabel = 'ID Mobile Ins'
      FieldName = 'IDMOBILE_INS'
    end
    object CdsClientesIDMOBILE_ALT: TIntegerField
      DisplayLabel = 'ID Mobile Alt'
      FieldName = 'IDMOBILE_ALT'
    end
    object CdsClientesISS_RETIDO: TIntegerField
      DisplayLabel = 'ISS Retido'
      FieldName = 'ISS_RETIDO'
    end
    object CdsClientesDESB_CL_CONTAS_QUIT: TStringField
      DisplayLabel = 'Desnegativar cliente ao quitar todas as contas'
      FieldName = 'DESB_CL_CONTAS_QUIT'
      Size = 1
    end
    object CdsClientesCNSCHECKCHECK: TStringField
      DisplayLabel = 'Tipo Consulta Check Check'
      FieldName = 'CNSCHECKCHECK'
      Size = 50
    end
    object CdsClientesUSAR_LIM_LIBVND_FINAN: TStringField
      DisplayLabel = 'Permitir vender acima do limite de cr'#233'dito'
      FieldName = 'USAR_LIM_LIBVND_FINAN'
      FixedChar = True
      Size = 1
    end
    object CdsClientesREC_MAIL_MARK: TStringField
      DisplayLabel = 'Rec Email'
      FieldName = 'REC_MAIL_MARK'
      Size = 1
    end
    object CdsClientesIDCONTATO_MARK2: TStringField
      DisplayLabel = 'Id Contato'
      FieldName = 'IDCONTATO_MARK2'
      Size = 36
    end
    object CdsClientesLISTASEMAIL: TStringField
      DisplayLabel = 'Lista Email'
      FieldName = 'LISTASEMAIL'
      Size = 500
    end
    object CdsClientesNFE_INDIEDEST: TSmallintField
      Tag = 3
      DisplayLabel = 'Ind Inscr Estadual'
      FieldName = 'NFE_INDIEDEST'
    end
    object CdsClientesNFE_IDESTRANGEIRO: TStringField
      Tag = 3
      DisplayLabel = 'Ident Destinat Estrangeiro'
      FieldName = 'NFE_IDESTRANGEIRO'
    end
    object CdsClientesNFE_AUTXML: TStringField
      Tag = 3
      DisplayLabel = 'Lista CPF/CNPJ Aut XLML'
      FieldName = 'NFE_AUTXML'
      Size = 256
    end
    object CdsClientesWEBSITE: TStringField
      DisplayLabel = 'website'
      FieldName = 'WEBSITE'
      Size = 128
    end
    object CdsClientesAPELIDO: TStringField
      DisplayLabel = 'Apelido'
      FieldName = 'APELIDO'
      Size = 50
    end
    object CdsClientesONDECOMPROU_POTVEIC: TStringField
      DisplayLabel = 'Onde comprou o veiculo'
      FieldName = 'ONDECOMPROU_POTVEIC'
      Size = 60
    end
    object CdsClientesONDEENTREVISTA_POTVEIC: TStringField
      DisplayLabel = 'Local a entrevista veiculo'
      FieldName = 'ONDEENTREVISTA_POTVEIC'
      Size = 15
    end
    object CdsClientesTIPO_PROP: TStringField
      DisplayLabel = 'Tipo de propaganda da empresa'
      FieldName = 'TIPO_PROP'
      Size = 15
    end
    object CdsClientesDATA_ULT_COMPRAV: TDateTimeField
      DisplayLabel = 'Data ultima compra veiculo'
      FieldName = 'DATA_ULT_COMPRAV'
      EditMask = '!99/99/0000;1;_'
    end
    object CdsClientesCODMODELO_POTVEIC: TIntegerField
      DisplayLabel = 'Cod Modelo Veiculo'
      FieldName = 'CODMODELO_POTVEIC'
    end
    object CdsClientesCOR_POTVEIC: TStringField
      DisplayLabel = 'Cor do veiculo'
      DisplayWidth = 10
      FieldName = 'COR_POTVEIC'
      Size = 10
    end
    object CdsClientesANO_POTVEIC: TSmallintField
      DisplayLabel = 'Ano fabricacao veiculo'
      FieldName = 'ANO_POTVEIC'
    end
    object CdsClientesANOMOD_POTVEIC: TSmallintField
      DisplayLabel = 'Ano modelo veiculo'
      FieldName = 'ANOMOD_POTVEIC'
    end
    object CdsClientesMODELO_POTVEIC: TStringField
      DisplayLabel = 'Descricao veiculo'
      FieldName = 'MODELO_POTVEIC'
      Size = 60
    end
    object CdsClientesUS_MOD_CL: TIntegerField
      DisplayLabel = 'Usuario que modificou'
      FieldName = 'US_MOD_CL'
    end
    object CdsClientesCONTROLES_FP: TStringField
      DisplayLabel = 'Controles Forma de Pagamento'
      FieldName = 'CONTROLES_FP'
      Size = 256
    end
    object CdsClientesCOND_PAG_VND: TStringField
      DisplayLabel = 'Cond Pag Vendas'
      FieldName = 'COND_PAG_VND'
      Size = 256
    end
    object CdsClientesCOND_PAG_PRE: TStringField
      DisplayLabel = 'Cond Pag Presta'#231#245'es'
      FieldName = 'COND_PAG_PRE'
      Size = 256
    end
    object CdsClientesROTA_ENTR: TStringField
      DisplayLabel = 'Rotas de Entrega'
      FieldKind = fkCalculated
      FieldName = 'ROTA_ENTR'
      Size = 16
      Calculated = True
    end
    object CdsClientesID_COMMERCE: TLargeintField
      DisplayLabel = 'Id Ecommerce'
      FieldName = 'ID_COMMERCE'
    end
    object CdsClientesFINALIDADEID: TIntegerField
      DisplayLabel = 'Finalidade Espec'#237'fica ID'
      FieldName = 'FINALIDADEID'
    end
    object CdsClientesCL_GERAR_PONTOS: TStringField
      DisplayLabel = 'Gerar Pontos'
      FieldName = 'CL_GERAR_PONTOS'
      FixedChar = True
      Size = 1
    end
    object CdsClientesTIPO_OBRA_NFSE: TSmallintField
      DisplayLabel = 'Tipo Obra NFSe'
      FieldName = 'TIPO_OBRA_NFSE'
    end
    object CdsClientesREC_NOT: TStringField
      DisplayLabel = 'Receber Notif Financ'
      FieldName = 'REC_NOT'
      FixedChar = True
      Size = 1
    end
    object CdsClientesREP_INT_ACTIVE: TSmallintField
      Tag = 1
      DisplayLabel = 'RepInt Falg'
      FieldName = 'REP_INT_ACTIVE'
    end
    object CdsClientesISUF: TStringField
      DisplayLabel = 'Insc Suframa'
      FieldName = 'ISUF'
      Size = 9
    end
    object CdsClientesNPED_ULT_COMPRA: TIntegerField
      DisplayLabel = 'Num Pedido '#218'ltima Compra'
      FieldName = 'NPED_ULT_COMPRA'
    end
    object CdsClientesTIPO_ULT_COMPRA: TStringField
      DisplayLabel = 'Tipo '#218'ltima Compra'
      FieldName = 'TIPO_ULT_COMPRA'
      Size = 3
    end
    object CdsClientesDATA_ULT_COMPRA: TDateTimeField
      DisplayLabel = 'Data '#218'ltima Compra'
      FieldName = 'DATA_ULT_COMPRA'
      Origin = '"CLIENTES"."DATA_ULT_COMPRA"'
    end
    object CdsClientesVALOR_ULT_COMPRA: TFloatField
      DisplayLabel = 'Valor '#218'ltima Compra'
      FieldName = 'VALOR_ULT_COMPRA'
      currency = True
    end
    object CdsClientesDIA_NASCIMENTO: TStringField
      DisplayLabel = 'Dia Nascimento'
      DisplayWidth = 2
      FieldKind = fkInternalCalc
      FieldName = 'DIA_NASCIMENTO'
    end
    object CdsClientesMES_NASCIMENTO: TStringField
      DisplayLabel = 'Mes Nascimento'
      FieldKind = fkInternalCalc
      FieldName = 'MES_NASCIMENTO'
      Size = 2
    end
    object CdsClientesANO_NASCIMENTO: TStringField
      DisplayLabel = 'Ano Nascimento'
      FieldKind = fkInternalCalc
      FieldName = 'ANO_NASCIMENTO'
      Size = 4
    end
    object CdsClientesINF_DESC_BOL: TStringField
      DisplayLabel = 'Inf Desconto Boleto'
      FieldName = 'INF_DESC_BOL'
      Size = 1
    end
    object CdsClientesRET_FED: TSmallintField
      DisplayLabel = 'Reten'#231#227'o Federal(NFe)'
      FieldName = 'RET_FED'
    end
    object CdsClientesCOD_CLI_FAT: TIntegerField
      DisplayLabel = 'Cod Cliente Faturamento'
      FieldName = 'COD_CLI_FAT'
    end
    object CdsClientesOBS_REQ_OS: TStringField
      DisplayLabel = 'Obs Req/OS'
      FieldName = 'OBS_REQ_OS'
      Size = 130
    end
    object CdsClientesRET_FED_NFS: TSmallintField
      DisplayLabel = 'Reten'#231#227'o Federal(NFSe)'
      FieldName = 'RET_FED_NFS'
    end
    object CdsClientesBARRAMENTO_AUTOMATICO: TStringField
      DisplayLabel = 'Barramento Automatico'
      FieldName = 'BARRAMENTO_AUTOMATICO'
      FixedChar = True
      Size = 1
    end
    object CdsClientesCLIENTE_VINDI_ID: TLargeintField
      DisplayLabel = 'Cliente Id'
      FieldName = 'CLIENTE_VINDI_ID'
    end
    object CdsClientesLOCALIDADE: TStringField
      DisplayLabel = 'Localidade'
      FieldName = 'LOCALIDADE'
      ProviderFlags = [pfInWhere]
      Size = 64
    end
    object CdsClientesCOD_SETOR: TIntegerField
      DisplayLabel = 'Cod Setor'
      FieldName = 'COD_SETOR'
      ProviderFlags = [pfInWhere]
    end
    object CdsClientesSETOR: TStringField
      DisplayLabel = 'Setor'
      FieldName = 'SETOR'
      ProviderFlags = [pfInWhere]
      Size = 64
    end
  end
  object dsClientes: TDataSource
    DataSet = CdsClientes
    Left = 22
    Top = 186
  end
  object qrBuscas: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransClientes
    Left = 22
    Top = 229
  end
  object qrFaturamento: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransFaturamento
    SQL.Strings = (
      'SELECT * FROM Tipo_Faturamento'
      'where ativo=1')
    Left = 165
    Top = 56
  end
  object dspFaturamento: TDataSetProvider
    DataSet = qrFaturamento
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 165
    Top = 101
  end
  object cdsFaturamento: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFaturamento'
    BeforeOpen = CdsClientesBeforeOpen
    Left = 167
    Top = 142
    object cdsFaturamentoSEL: TStringField
      DisplayLabel = 'Sel'
      FieldKind = fkInternalCalc
      FieldName = 'SEL'
      Size = 1
    end
    object cdsFaturamentoCODIGO_FATURAMENTO: TIntegerField
      Tag = 2
      DisplayLabel = 'Cod Faturamento'
      FieldName = 'CODIGO_FATURAMENTO'
      Required = True
    end
    object cdsFaturamentoDESC_FAT: TStringField
      Tag = 2
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESC_FAT'
      FixedChar = True
      Size = 30
    end
    object cdsFaturamentoSTATUS_F: TStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS_F'
      FixedChar = True
      Size = 10
    end
    object cdsFaturamentoATIVO: TIntegerField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
  end
  object dsFaturamento: TDataSource
    DataSet = cdsFaturamento
    Left = 171
    Top = 183
  end
  object qrLContador: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransClientes
    SQL.Strings = (
      'select * from CONTADOR where 1=0')
    Left = 737
    Top = 479
    object qrLContadorCOD_CONTADOR: TIntegerField
      FieldName = 'COD_CONTADOR'
      Origin = '"CONTADOR"."COD_CONTADOR"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrLContadorCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Origin = '"CONTADOR"."COD_EMPRESA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrLContadorCODIGO_UF: TIntegerField
      FieldName = 'CODIGO_UF'
      Origin = '"CONTADOR"."CODIGO_UF"'
    end
    object qrLContadorCPFCNPJ_CONT: TIBStringField
      FieldName = 'CPFCNPJ_CONT'
      Origin = '"CONTADOR"."CPFCNPJ_CONT"'
      FixedChar = True
      Size = 18
    end
    object qrLContadorNOME_CONT: TIBStringField
      FieldName = 'NOME_CONT'
      Origin = '"CONTADOR"."NOME_CONT"'
      Size = 50
    end
    object qrLContadorENDERECO_CONT: TIBStringField
      FieldName = 'ENDERECO_CONT'
      Origin = '"CONTADOR"."ENDERECO_CONT"'
      Size = 50
    end
    object qrLContadorBAIRRO_CONT: TIBStringField
      FieldName = 'BAIRRO_CONT'
      Origin = '"CONTADOR"."BAIRRO_CONT"'
      Size = 30
    end
    object qrLContadorCIDADE_CONT: TIBStringField
      FieldName = 'CIDADE_CONT'
      Origin = '"CONTADOR"."CIDADE_CONT"'
      Size = 30
    end
    object qrLContadorCEP_CONT: TIBStringField
      FieldName = 'CEP_CONT'
      Origin = '"CONTADOR"."CEP_CONT"'
      FixedChar = True
      Size = 9
    end
    object qrLContadorFONE_CONT: TIBStringField
      FieldName = 'FONE_CONT'
      Origin = '"CONTADOR"."FONE_CONT"'
      FixedChar = True
      Size = 14
    end
    object qrLContadorRAMAL_CONT: TIBStringField
      FieldName = 'RAMAL_CONT'
      Origin = '"CONTADOR"."RAMAL_CONT"'
      FixedChar = True
      Size = 5
    end
    object qrLContadorCONTATO_CONT: TIBStringField
      FieldName = 'CONTATO_CONT'
      Origin = '"CONTADOR"."CONTATO_CONT"'
    end
    object qrLContadorOUTROTEL_CONT: TIBStringField
      FieldName = 'OUTROTEL_CONT'
      Origin = '"CONTADOR"."OUTROTEL_CONT"'
      FixedChar = True
      Size = 14
    end
    object qrLContadorOBS_CONT: TIBStringField
      FieldName = 'OBS_CONT'
      Origin = '"CONTADOR"."OBS_CONT"'
      Size = 80
    end
    object qrLContadorEMAIL_CONT: TIBStringField
      FieldName = 'EMAIL_CONT'
      Origin = '"CONTADOR"."EMAIL_CONT"'
      Size = 50
    end
    object qrLContadorFAX_CONT: TIBStringField
      FieldName = 'FAX_CONT'
      Origin = '"CONTADOR"."FAX_CONT"'
      FixedChar = True
      Size = 14
    end
    object qrLContadorDT_CAD_CONT: TDateTimeField
      FieldName = 'DT_CAD_CONT'
      Origin = '"CONTADOR"."DT_CAD_CONT"'
    end
    object qrLContadorCOD_CIDADE: TSmallintField
      FieldName = 'COD_CIDADE'
      Origin = '"CONTADOR"."COD_CIDADE"'
    end
    object qrLContadorCOD_BAIRRO: TSmallintField
      FieldName = 'COD_BAIRRO'
      Origin = '"CONTADOR"."COD_BAIRRO"'
    end
    object qrLContadorATIVO: TIntegerField
      FieldName = 'ATIVO'
      Origin = '"CONTADOR"."ATIVO"'
    end
  end
  object dsLContador: TDataSource
    DataSet = qrLContador
    Left = 740
    Top = 523
  end
  object IBTransCfopCst: TIBTransaction
    DefaultDatabase = dtmAtivo.bancoHw
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 275
    Top = 1
  end
  object IBTransPesquisa: TIBTransaction
    DefaultDatabase = dtmAtivo.bancoHw
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 454
    Top = 1
  end
  object qrPesquisa: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransPesquisa
    Left = 23
    Top = 477
  end
  object qrTipoCliente: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransTipoCliente
    SQL.Strings = (
      'SELECT * FROM TIPOS_CLIENTES where ativo = 1')
    Left = 247
    Top = 55
  end
  object dspTipoCliente: TDataSetProvider
    DataSet = qrTipoCliente
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 251
    Top = 99
  end
  object cdsTipoCliente: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTipoCliente'
    BeforeOpen = CdsClientesBeforeOpen
    Left = 254
    Top = 140
    object cdsTipoClienteSEL: TStringField
      DisplayLabel = 'Sel'
      FieldKind = fkInternalCalc
      FieldName = 'SEL'
      Size = 1
    end
    object cdsTipoClienteCODIGO_TIPO: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO_TIPO'
      Required = True
    end
    object cdsTipoClienteDESCRICAO_TIPO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO_TIPO'
      FixedChar = True
      Size = 30
    end
    object cdsTipoClienteOBSERVACAO_T: TStringField
      DisplayLabel = 'Observa'#231#227'o'
      FieldName = 'OBSERVACAO_T'
      FixedChar = True
      Size = 40
    end
    object cdsTipoClienteATIVO: TIntegerField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
  end
  object dsTipoCliente: TDataSource
    DataSet = cdsTipoCliente
    Left = 257
    Top = 181
  end
  object IBTransTipoCliente: TIBTransaction
    DefaultDatabase = dtmAtivo.bancoHw
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 364
    Top = 1
  end
  object qrBTipoCli: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransTipoCliente
    Left = 258
    Top = 224
  end
  object qrCidadesC: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = dtmAtivo.IbTransCol
    SQL.Strings = (
      'SELECT * FROM CIDADES')
    Left = 272
    Top = 577
    object qrCidadesCCOD_CIDADE: TIntegerField
      FieldName = 'COD_CIDADE'
      Origin = '"CIDADES"."COD_CIDADE"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrCidadesCNOME_CIDADE: TIBStringField
      FieldName = 'NOME_CIDADE'
      Origin = '"CIDADES"."NOME_CIDADE"'
      Size = 30
    end
    object qrCidadesCCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
      Origin = '"CIDADES"."COD_USUARIO"'
    end
    object qrCidadesCCOD_USUARIO_ALT: TIntegerField
      FieldName = 'COD_USUARIO_ALT'
      Origin = '"CIDADES"."COD_USUARIO_ALT"'
    end
    object qrCidadesCATIVO: TIntegerField
      FieldName = 'ATIVO'
      Origin = '"CIDADES"."ATIVO"'
    end
    object qrCidadesCIBGE_COD_CIDADE: TIntegerField
      FieldName = 'IBGE_COD_CIDADE'
      Origin = '"CIDADES"."IBGE_COD_CIDADE"'
    end
  end
  object dsCidadesC: TDataSource
    DataSet = qrCidadesC
    Left = 273
    Top = 621
  end
  object qrBairrosC: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = dtmAtivo.IbTransCol
    SQL.Strings = (
      'SELECT * FROM BAIRROS')
    Left = 341
    Top = 579
    object qrBairrosCCOD_BAIRRO: TIntegerField
      FieldName = 'COD_BAIRRO'
      Origin = '"BAIRROS"."COD_BAIRRO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrBairrosCNOME_BAIRRO: TIBStringField
      FieldName = 'NOME_BAIRRO'
      Origin = '"BAIRROS"."NOME_BAIRRO"'
      Size = 30
    end
    object qrBairrosCCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
      Origin = '"BAIRROS"."COD_USUARIO"'
    end
    object qrBairrosCCOD_USUARIO_ALT: TIntegerField
      FieldName = 'COD_USUARIO_ALT'
      Origin = '"BAIRROS"."COD_USUARIO_ALT"'
    end
    object qrBairrosCATIVO: TIntegerField
      FieldName = 'ATIVO'
      Origin = '"BAIRROS"."ATIVO"'
    end
  end
  object dsBairrosC: TDataSource
    DataSet = qrBairrosC
    Left = 339
    Top = 622
  end
  object qrEstadosC: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = dtmAtivo.IbTransCol
    SQL.Strings = (
      'SELECT * FROM Estados where ativo = 1')
    Left = 404
    Top = 578
    object qrEstadosCCODIGO_UF: TIntegerField
      FieldName = 'CODIGO_UF'
      Origin = '"ESTADOS"."CODIGO_UF"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrEstadosCNOME_UF: TIBStringField
      FieldName = 'NOME_UF'
      Origin = '"ESTADOS"."NOME_UF"'
      Size = 30
    end
    object qrEstadosCSIGLA_UF: TIBStringField
      FieldName = 'SIGLA_UF'
      Origin = '"ESTADOS"."SIGLA_UF"'
      FixedChar = True
      Size = 2
    end
    object qrEstadosCATIVO: TIntegerField
      FieldName = 'ATIVO'
      Origin = '"ESTADOS"."ATIVO"'
    end
    object qrEstadosCIBGE_CODIGO_UF: TIntegerField
      FieldName = 'IBGE_CODIGO_UF'
      Origin = '"ESTADOS"."IBGE_CODIGO_UF"'
    end
  end
  object dsEstadosC: TDataSource
    DataSet = qrEstadosC
    Left = 402
    Top = 622
  end
  object IBTransFaturamento: TIBTransaction
    DefaultDatabase = dtmAtivo.bancoHw
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 185
    Top = 1
  end
  object qrBFaturamento: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransFaturamento
    Left = 171
    Top = 227
  end
  object RdpFichaCliente: TRDprint
    ImpressoraPersonalizada.NomeImpressora = 'Modelo Personalizado - (Epson)'
    ImpressoraPersonalizada.AvancaOitavos = '27 48'
    ImpressoraPersonalizada.AvancaSextos = '27 50'
    ImpressoraPersonalizada.SaltoPagina = '12'
    ImpressoraPersonalizada.TamanhoPagina = '27 67 66'
    ImpressoraPersonalizada.Negrito = '27 69'
    ImpressoraPersonalizada.Italico = '27 52'
    ImpressoraPersonalizada.Sublinhado = '27 45 49'
    ImpressoraPersonalizada.Expandido = '27 14'
    ImpressoraPersonalizada.Normal10 = '18 27 80'
    ImpressoraPersonalizada.Comprimir12 = '18 27 77'
    ImpressoraPersonalizada.Comprimir17 = '27 80 27 15'
    ImpressoraPersonalizada.Comprimir20 = '27 77 27 15'
    ImpressoraPersonalizada.Reset = '27 80 18 20 27 53 27 70 27 45 48'
    ImpressoraPersonalizada.Inicializar = '27 64'
    OpcoesPreview.PaginaZebrada = False
    OpcoesPreview.Remalina = True
    OpcoesPreview.CaptionPreview = 'Rdprint Preview'
    OpcoesPreview.PreviewZoom = 100
    OpcoesPreview.CorPapelPreview = clWhite
    OpcoesPreview.CorLetraPreview = clBlack
    OpcoesPreview.Preview = True
    OpcoesPreview.BotaoSetup = Ativo
    OpcoesPreview.BotaoImprimir = Ativo
    OpcoesPreview.BotaoGravar = Ativo
    OpcoesPreview.BotaoLer = Ativo
    OpcoesPreview.BotaoProcurar = Ativo
    OpcoesPreview.BotaoPDF = Ativo
    OpcoesPreview.BotaoEMAIL = Ativo
    Margens.Left = 10
    Margens.Right = 10
    Margens.Top = 10
    Margens.Bottom = 10
    Autor = Deltress
    RegistroUsuario.NomeRegistro = 'LESTE INFORMATICA LTDA - ME'
    RegistroUsuario.SerieProduto = 'SINGLE-0113/01448'
    RegistroUsuario.AutorizacaoKey = 'VUYG-1QQX-P85V-AWCD-RR5K'
    About = 'RDprint 5.0 - Registrado'
    Acentuacao = Transliterate
    CaptionSetup = 'Rdprint Setup'
    TitulodoRelatorio = 'Gerado por RDprint'
    UsaGerenciadorImpr = True
    CorForm = clBtnFace
    CorFonte = clBlack
    Impressora = Epson
    Mapeamento.Strings = (
      '//--- Grafico Compativel com Windows/USB ---//'
      '//'
      'GRAFICO=GRAFICO'
      'HP=GRAFICO'
      'DESKJET=GRAFICO'
      'LASERJET=GRAFICO'
      'INKJET=GRAFICO'
      'STYLUS=GRAFICO'
      'EPL=GRAFICO'
      'USB=GRAFICO'
      '//'
      '//--- Linha Epson Matricial 9 e 24 agulhas ---//'
      '//'
      'EPSON=EPSON'
      'GENERICO=EPSON'
      'LX-300=EPSON'
      'LX-810=EPSON'
      'FX-2170=EPSON'
      'FX-1170=EPSON'
      'LQ-1170=EPSON'
      'LQ-2170=EPSON'
      'OKIDATA=EPSON'
      '//'
      '//--- Rima e Emilia ---//'
      '//'
      'RIMA=RIMA'
      'EMILIA=RIMA'
      '//'
      '//--- Linha HP/Xerox padr'#227'o PCL ---//'
      '//'
      'PCL=HP'
      '//'
      '//--- Impressoras 40 Colunas ---//'
      '//'
      'DARUMA=BOBINA'
      'SIGTRON=BOBINA'
      'SWEDA=BOBINA'
      'BEMATECH=BOBINA')
    MostrarProgresso = True
    TamanhoQteLinhas = 66
    TamanhoQteColunas = 132
    TamanhoQteLPP = Seis
    NumerodeCopias = 1
    FonteTamanhoPadrao = S17cpp
    FonteEstiloPadrao = []
    Orientacao = poPortrait
    Left = 788
    Top = 1
  end
  object qrCliAdicional: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransClientes
    SQL.Strings = (
      'SELECT * FROM END_PCLIENTES WHERE ATIVO=1'
      '')
    Left = 323
    Top = 55
  end
  object dspCliAdicional: TDataSetProvider
    DataSet = qrCliAdicional
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 326
    Top = 98
  end
  object cdsCliAdicional: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCliAdicional'
    BeforeOpen = CdsClientesBeforeOpen
    Left = 326
    Top = 139
    object cdsCliAdicionalSEQCAD: TIntegerField
      DisplayLabel = 'Sequ'#234'ncia Cadastro'
      FieldName = 'SEQCAD'
      Required = True
    end
    object cdsCliAdicionalCOD_EMPRESA: TIntegerField
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsCliAdicionalCOD_CLFOR: TIntegerField
      DisplayLabel = 'Cod Cliente/Fornecedor'
      FieldName = 'COD_CLFOR'
      Required = True
    end
    object cdsCliAdicionalCATEGORIA: TStringField
      DisplayLabel = 'Categoria'
      FieldName = 'CATEGORIA'
      FixedChar = True
      Size = 8
    end
    object cdsCliAdicionalTIPO_CAD: TStringField
      DisplayLabel = 'Tipo de Cadastro'
      FieldName = 'TIPO_CAD'
      FixedChar = True
      Size = 1
    end
    object cdsCliAdicionalNOME: TStringField
      DisplayLabel = 'Nome do Indicado'
      FieldName = 'NOME'
      Size = 35
    end
    object cdsCliAdicionalENDERECO: TStringField
      DisplayLabel = 'Endere'#231'o do Indicado'
      FieldName = 'ENDERECO'
      Size = 35
    end
    object cdsCliAdicionalBAIRRO: TStringField
      DisplayLabel = 'Bairro do Indicado'
      FieldName = 'BAIRRO'
      Size = 35
    end
    object cdsCliAdicionalCIDADE: TStringField
      DisplayLabel = 'Cidade do Indicado'
      FieldName = 'CIDADE'
      Size = 35
    end
    object cdsCliAdicionalESTADO: TStringField
      DisplayLabel = 'Estado do Indicado'
      FieldName = 'ESTADO'
      FixedChar = True
      Size = 2
    end
    object cdsCliAdicionalCEP: TStringField
      DisplayLabel = 'CEP do Indicado'
      FieldName = 'CEP'
      EditMask = '00000\-999;0;'
      FixedChar = True
      Size = 8
    end
    object cdsCliAdicionalFONE: TStringField
      DisplayLabel = 'Fone do Indicado'
      FieldName = 'FONE'
      EditMask = '(99) 9999-9999;0;_'
      FixedChar = True
      Size = 14
    end
    object cdsCliAdicionalFAX: TStringField
      DisplayLabel = 'Fax do Indicado'
      FieldName = 'FAX'
      EditMask = '(99) 9999-9999;0;_'
      FixedChar = True
      Size = 14
    end
    object cdsCliAdicionalDATA_NASC: TDateTimeField
      DisplayLabel = 'Data Nascimento do Indicado'
      FieldName = 'DATA_NASC'
      EditMask = '!99/99/9999;1;_'
    end
    object cdsCliAdicionalREFERENC: TStringField
      DisplayLabel = 'Refer'#234'ncia para o Indicado'
      FieldName = 'REFERENC'
      Size = 50
    end
    object cdsCliAdicionalMARCA: TStringField
      DisplayLabel = 'Marca'
      FieldName = 'MARCA'
      FixedChar = True
      Size = 1
    end
    object cdsCliAdicionalOBS: TMemoField
      DisplayLabel = 'Observa'#231#227'o sobre o Indicado'
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 8
    end
    object cdsCliAdicionalCOD_CIDADE: TSmallintField
      DisplayLabel = 'Cod Cidade do Indicado'
      FieldName = 'COD_CIDADE'
    end
    object cdsCliAdicionalCOD_BAIRRO: TSmallintField
      DisplayLabel = 'Cod Bairro do Indicado'
      FieldName = 'COD_BAIRRO'
    end
    object cdsCliAdicionalATIVO: TIntegerField
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
    object cdsCliAdicionalEMAIL: TStringField
      DisplayLabel = 'email'
      FieldName = 'EMAIL'
      Size = 256
    end
    object cdsCliAdicionalREC_MAIL_MARK: TStringField
      DisplayLabel = 'Rec Email'
      FieldName = 'REC_MAIL_MARK'
      Size = 1
    end
    object cdsCliAdicionalIDCONTATO_MARK2: TStringField
      DisplayLabel = 'Id Contato'
      FieldName = 'IDCONTATO_MARK2'
      Size = 36
    end
    object cdsCliAdicionalLISTASEMAIL: TStringField
      FieldName = 'LISTASEMAIL'
      Size = 500
    end
    object cdsCliAdicionalUS_MOD_US: TIntegerField
      DisplayLabel = 'Usuario que modificou'
      FieldName = 'US_MOD_US'
    end
  end
  object dsCliAdicional: TDataSource
    DataSet = cdsCliAdicional
    Left = 328
    Top = 181
  end
  object qrBCliAdicional: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransClientes
    Left = 331
    Top = 224
  end
  object qrRepliClientes: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransRepliCliente
    SQL.Strings = (
      'select * from CLIENTES where 1=0')
    Left = 406
    Top = 55
  end
  object dspRepliClientes: TDataSetProvider
    DataSet = qrRepliClientes
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 408
    Top = 98
  end
  object qrBuscasRepli: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransRepliCliente
    Left = 411
    Top = 188
  end
  object qrCstMudCl: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransClientes
    SQL.Strings = (
      'select * from cst_mud_cliente where 1=0'
      '')
    Left = 486
    Top = 55
  end
  object dspCstMudCl: TDataSetProvider
    DataSet = qrCstMudCl
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 487
    Top = 98
  end
  object cdsCstMudCl: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCstMudCl'
    BeforeOpen = CdsClientesBeforeOpen
    Left = 489
    Top = 140
    object cdsCstMudClCOD_CLIENTE: TIntegerField
      DisplayLabel = 'Cod Cliente'
      FieldName = 'COD_CLIENTE'
      Required = True
    end
    object cdsCstMudClCOD_EMPRESA: TIntegerField
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsCstMudClCST_INTERNO: TStringField
      DisplayLabel = 'CST Interno'
      FieldName = 'CST_INTERNO'
      Required = True
      FixedChar = True
      Size = 3
    end
    object cdsCstMudClCST_EXTERNO: TStringField
      DisplayLabel = 'CST Externo'
      FieldName = 'CST_EXTERNO'
      FixedChar = True
      Size = 3
    end
    object cdsCstMudClALIQ_INTERNA: TFloatField
      DisplayLabel = 'ICMS Interno'
      FieldName = 'ALIQ_INTERNA'
    end
    object cdsCstMudClALIQ_EXTERNA: TFloatField
      DisplayLabel = 'ICMS Externo'
      FieldName = 'ALIQ_EXTERNA'
    end
    object cdsCstMudClCFOP_INTERNO: TFloatField
      DisplayLabel = 'CFOP Interno'
      FieldName = 'CFOP_INTERNO'
    end
    object cdsCstMudClCFOP_EXTERNO: TFloatField
      DisplayLabel = 'CFOP Externo'
      FieldName = 'CFOP_EXTERNO'
    end
  end
  object dsCstMudCl: TDataSource
    DataSet = cdsCstMudCl
    Left = 490
    Top = 186
  end
  object qrBuscasCstMudCl: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransClientes
    Left = 500
    Top = 230
  end
  object qrPesquisa1: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransPesquisa
    Left = 81
    Top = 481
  end
  object qrPesquisa2: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransPesquisa
    Left = 145
    Top = 482
  end
  object dsPesquisa: TDataSource
    DataSet = qrPesquisa
    Left = 19
    Top = 527
  end
  object dsPesquisa1: TDataSource
    DataSet = qrPesquisa1
    Left = 85
    Top = 525
  end
  object dsPesquisa2: TDataSource
    DataSet = qrPesquisa2
    Left = 149
    Top = 525
  end
  object qrPClientes: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransClientes
    SQL.Strings = (
      'select * from CLIENTES where 1=0')
    Left = 88
    Top = 55
  end
  object dspPClientes: TDataSetProvider
    DataSet = qrPClientes
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 88
    Top = 99
  end
  object dsPossivelCli: TDataSource
    DataSet = CdsPClientes
    Left = 90
    Top = 183
  end
  object qrBPossivelCli: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransClientes
    Left = 92
    Top = 227
  end
  object qrAbreCidades: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransPesquisa
    SQL.Strings = (
      
        'select c.*, ci.nome_municipio, ci.codigo_mun_ibge, ci.nome_uf fr' +
        'om cidades c'
      
        'left join cidades_ibge ci on ci.codigo_mun_ibge = c.ibge_cod_cid' +
        'ade'
      'where c.ativo = 1')
    Left = 424
    Top = 482
    object qrAbreCidadesCOD_CIDADE: TIntegerField
      FieldName = 'COD_CIDADE'
      Origin = '"CIDADES"."COD_CIDADE"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrAbreCidadesNOME_CIDADE: TIBStringField
      FieldName = 'NOME_CIDADE'
      Origin = '"CIDADES"."NOME_CIDADE"'
      Size = 30
    end
    object qrAbreCidadesNOME_MUNICIPIO: TIBStringField
      FieldName = 'NOME_MUNICIPIO'
      Origin = '"CIDADES_IBGE"."NOME_MUNICIPIO"'
      Size = 50
    end
    object qrAbreCidadesCODIGO_MUN_IBGE: TIntegerField
      FieldName = 'CODIGO_MUN_IBGE'
      Origin = '"CIDADES_IBGE"."CODIGO_MUN_IBGE"'
    end
    object qrAbreCidadesNOME_UF: TIBStringField
      DisplayWidth = 20
      FieldName = 'NOME_UF'
      ProviderFlags = []
    end
  end
  object qrAbreBairros: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransPesquisa
    SQL.Strings = (
      'SELECT * FROM BAIRROS WHERE ativo=1')
    Left = 273
    Top = 483
    object qrAbreBairrosCOD_BAIRRO: TIntegerField
      FieldName = 'COD_BAIRRO'
      Origin = '"BAIRROS"."COD_BAIRRO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrAbreBairrosNOME_BAIRRO: TIBStringField
      FieldName = 'NOME_BAIRRO'
      Origin = '"BAIRROS"."NOME_BAIRRO"'
      Size = 30
    end
  end
  object qrAbreEstados: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransPesquisa
    SQL.Strings = (
      'SELECT * FROM ESTADOS WHERE ativo=1')
    Left = 580
    Top = 482
    object qrAbreEstadosCODIGO_UF: TIntegerField
      FieldName = 'CODIGO_UF'
      Origin = '"ESTADOS"."CODIGO_UF"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrAbreEstadosNOME_UF: TIBStringField
      FieldName = 'NOME_UF'
      Origin = '"ESTADOS"."NOME_UF"'
      Size = 30
    end
    object qrAbreEstadosSIGLA_UF: TIBStringField
      FieldName = 'SIGLA_UF'
      Origin = '"ESTADOS"."SIGLA_UF"'
      FixedChar = True
      Size = 2
    end
  end
  object dsAbreEstados: TDataSource
    DataSet = qrAbreEstados
    Left = 583
    Top = 523
  end
  object dsAbreCidades: TDataSource
    DataSet = qrAbreCidades
    Left = 424
    Top = 525
  end
  object dsAbreBairros: TDataSource
    DataSet = qrAbreBairros
    Left = 277
    Top = 525
  end
  object qrAbreCidades1: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransPesquisa
    Left = 501
    Top = 482
  end
  object qrAbreBairros1: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransPesquisa
    Left = 345
    Top = 482
  end
  object qrAbreEstados1: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransPesquisa
    Left = 660
    Top = 482
  end
  object dsAbreEstados1: TDataSource
    DataSet = qrAbreEstados1
    Left = 662
    Top = 523
  end
  object dsAbreCidades1: TDataSource
    DataSet = qrAbreCidades1
    Left = 506
    Top = 525
  end
  object dsAbreBairros1: TDataSource
    DataSet = qrAbreBairros1
    Left = 350
    Top = 524
  end
  object dsAbreCidadeIBGE: TDataSource
    DataSet = qrAbreCidadeIBGE
    Left = 21
    Top = 620
  end
  object qrAbreCidadeIBGE: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransPesquisa
    SQL.Strings = (
      'SELECT * FROM CIDADES_IBGE')
    Left = 18
    Top = 577
    object qrAbreCidadeIBGECODIGO_MUN_IBGE: TIntegerField
      FieldName = 'CODIGO_MUN_IBGE'
      Origin = '"CIDADES_IBGE"."CODIGO_MUN_IBGE"'
      Required = True
    end
    object qrAbreCidadeIBGENOME_MUNICIPIO: TIBStringField
      FieldName = 'NOME_MUNICIPIO'
      Origin = '"CIDADES_IBGE"."NOME_MUNICIPIO"'
      Size = 50
    end
    object qrAbreCidadeIBGENOME_UF: TIBStringField
      FieldName = 'NOME_UF'
      Origin = '"CIDADES_IBGE"."NOME_UF"'
      Size = 50
    end
  end
  object qrAbreEstadoIBGE: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransPesquisa
    SQL.Strings = (
      'SELECT * FROM CIDADES_IBGE')
    Left = 817
    Top = 480
    object qrAbreEstadoIBGECODIGO_UF_IBGE: TIntegerField
      FieldName = 'CODIGO_UF_IBGE'
      Origin = '"CIDADES_IBGE"."CODIGO_UF_IBGE"'
      Required = True
    end
    object qrAbreEstadoIBGENOME_UF: TIBStringField
      FieldName = 'NOME_UF'
      Origin = '"CIDADES_IBGE"."NOME_UF"'
      Size = 50
    end
  end
  object dsAbreEstadoIBGE: TDataSource
    DataSet = qrAbreEstadoIBGE
    Left = 818
    Top = 521
  end
  object qrLTipoCliente: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransPesquisa
    SQL.Strings = (
      'SELECT * FROM TIPOS_CLIENTES')
    Left = 100
    Top = 577
    object qrLTipoClienteCODIGO_TIPO: TIntegerField
      FieldName = 'CODIGO_TIPO'
      Origin = '"TIPOS_CLIENTES"."CODIGO_TIPO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrLTipoClienteDESCRICAO_TIPO: TIBStringField
      FieldName = 'DESCRICAO_TIPO'
      Origin = '"TIPOS_CLIENTES"."DESCRICAO_TIPO"'
      FixedChar = True
      Size = 30
    end
    object qrLTipoClienteOBSERVACAO_T: TIBStringField
      FieldName = 'OBSERVACAO_T'
      Origin = '"TIPOS_CLIENTES"."OBSERVACAO_T"'
      FixedChar = True
      Size = 40
    end
    object qrLTipoClienteATIVO: TIntegerField
      FieldName = 'ATIVO'
      Origin = '"TIPOS_CLIENTES"."ATIVO"'
    end
  end
  object dsLTipoCliente: TDataSource
    DataSet = qrLTipoCliente
    Left = 104
    Top = 620
  end
  object qrLTipoFaturamento: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransFaturamento
    SQL.Strings = (
      'SELECT * FROM TIPO_FATURAMENTO WHERE ativo=1')
    Left = 188
    Top = 575
    object qrLTipoFaturamentoCODIGO_FATURAMENTO: TIntegerField
      FieldName = 'CODIGO_FATURAMENTO'
      Origin = '"TIPO_FATURAMENTO"."CODIGO_FATURAMENTO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrLTipoFaturamentoDESC_FAT: TIBStringField
      FieldName = 'DESC_FAT'
      Origin = '"TIPO_FATURAMENTO"."DESC_FAT"'
      FixedChar = True
      Size = 30
    end
  end
  object dsLTipoFaturamento: TDataSource
    DataSet = qrLTipoFaturamento
    Left = 190
    Top = 619
  end
  object IBTransRepliCliente: TIBTransaction
    DefaultDatabase = dtmAtivo.bancoHw
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 545
    Top = 1
  end
  object qrLVendedor: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransPesquisa
    SQL.Strings = (
      
        'select c.cod_vendedor,c.nome_vendedor from colaborador c , funco' +
        'es f where c.cod_funcao=f.cod_funcao and f.desc_funcao like '#39'%VE' +
        'NDEDOR%'#39)
    Left = 530
    Top = 578
    object qrLVendedorCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
      Origin = '"COLABORADOR"."COD_VENDEDOR"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrLVendedorNOME_VENDEDOR: TIBStringField
      FieldName = 'NOME_VENDEDOR'
      Origin = '"COLABORADOR"."NOME_VENDEDOR"'
      Size = 35
    end
  end
  object dsLVendedor: TDataSource
    DataSet = qrLVendedor
    Left = 534
    Top = 622
  end
  object qrNFFornec: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransPesquisa
    SQL.Strings = (
      'select * from nf_entrada where 1=0')
    Left = 465
    Top = 579
    object IntegerField14: TIntegerField
      FieldName = 'COD_VENDEDOR'
      Origin = '"COLABORADOR"."COD_VENDEDOR"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IBStringField1: TIBStringField
      FieldName = 'NOME_VENDEDOR'
      Origin = '"COLABORADOR"."NOME_VENDEDOR"'
      Size = 35
    end
  end
  object dsNFFornec: TDataSource
    DataSet = qrNFFornec
    Left = 468
    Top = 622
  end
  object CdsPClientes: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspPClientes'
    BeforeOpen = CdsClientesBeforeOpen
    Left = 90
    Top = 145
    object CdsPClientesSEL: TStringField
      DisplayLabel = 'Sel'
      FieldKind = fkInternalCalc
      FieldName = 'SEL'
      Size = 1
    end
    object CdsPClientesCOD_CLIENTE: TIntegerField
      Tag = 2
      DisplayLabel = 'Cod Cliente'
      FieldName = 'COD_CLIENTE'
      Origin = '"CLIENTES"."COD_CLIENTE"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CdsPClientesCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Origin = '"CLIENTES"."COD_EMPRESA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CdsPClientesCODIGO_UF: TIntegerField
      DisplayLabel = 'Cod UF'
      FieldName = 'CODIGO_UF'
      Origin = '"CLIENTES"."CODIGO_UF"'
      Required = True
    end
    object CdsPClientesCODIGO_TIPO: TIntegerField
      DisplayLabel = 'Cod Tipo Cliente'
      FieldName = 'CODIGO_TIPO'
      Origin = '"CLIENTES"."CODIGO_TIPO"'
      Required = True
    end
    object CdsPClientesCODIGO_FATURAMENTO: TIntegerField
      DisplayLabel = 'Cod Faturamento'
      FieldName = 'CODIGO_FATURAMENTO'
      Origin = '"CLIENTES"."CODIGO_FATURAMENTO"'
    end
    object CdsPClientesEST_CODIGO_UF: TIntegerField
      DisplayLabel = 'Cod UF Cobran'#231'a '
      FieldName = 'EST_CODIGO_UF'
      Origin = '"CLIENTES"."EST_CODIGO_UF"'
      Required = True
    end
    object CdsPClientesCPFCGC: TStringField
      Tag = 2
      DisplayLabel = 'CPF / CNPJ'
      FieldName = 'CPFCGC'
      Origin = '"CLIENTES"."CPFCGC"'
      Size = 18
    end
    object CdsPClientesNOME_CLIENTE: TStringField
      Tag = 2
      DisplayLabel = 'Nome do Cliente'
      FieldName = 'NOME_CLIENTE'
      Origin = '"CLIENTES"."NOME_CLIENTE"'
      Required = True
      Size = 35
    end
    object CdsPClientesRAZAO: TStringField
      DisplayLabel = 'Raz'#227'o Social'
      FieldName = 'RAZAO'
      Origin = '"CLIENTES"."RAZAO"'
      Required = True
      Size = 60
    end
    object CdsPClientesINSC_EST: TStringField
      DisplayLabel = 'Inscri'#231#227'o Estadual'
      FieldName = 'INSC_EST'
      Origin = '"CLIENTES"."INSC_EST"'
      Size = 18
    end
    object CdsPClientesFAX: TStringField
      DisplayLabel = 'Fax'
      FieldName = 'FAX'
      Origin = '"CLIENTES"."FAX"'
      EditMask = '(99) 9999-9999;0;_'
      FixedChar = True
      Size = 14
    end
    object CdsPClientesOBSERVACAO: TStringField
      DisplayLabel = 'Observa'#231#227'o'
      FieldName = 'OBSERVACAO'
      Origin = '"CLIENTES"."OBSERVACAO"'
      Size = 200
    end
    object CdsPClientesDATA_CADASTRO: TDateTimeField
      DisplayLabel = 'Data Cadastro'
      FieldName = 'DATA_CADASTRO'
      Origin = '"CLIENTES"."DATA_CADASTRO"'
      EditMask = '!99/99/9999;1;_'
    end
    object CdsPClientesDATA_MOD_CAD: TDateTimeField
      DisplayLabel = 'Data Modificac'#227'o'
      FieldName = 'DATA_MOD_CAD'
      Origin = '"CLIENTES"."DATA_MOD_CAD"'
      EditMask = '!99/99/9999;1;_'
    end
    object CdsPClientesLIMITE_CREDITO: TFloatField
      DisplayLabel = 'Limite de Cr'#233'dito'
      FieldName = 'LIMITE_CREDITO'
      Origin = '"CLIENTES"."LIMITE_CREDITO"'
      currency = True
    end
    object CdsPClientesCONTATO: TStringField
      DisplayLabel = 'Contato'
      FieldName = 'CONTATO'
      Origin = '"CLIENTES"."CONTATO"'
      Size = 10
    end
    object CdsPClientesNATURALID: TStringField
      DisplayLabel = 'Naturalidade'
      FieldName = 'NATURALID'
      Origin = '"CLIENTES"."NATURALID"'
    end
    object CdsPClientesCONJUGE: TStringField
      DisplayLabel = 'C'#244'njuge'
      FieldName = 'CONJUGE'
      Origin = '"CLIENTES"."CONJUGE"'
      Size = 35
    end
    object CdsPClientesLOC_TRAB: TStringField
      DisplayLabel = 'Local de Trabalho'
      FieldName = 'LOC_TRAB'
      Origin = '"CLIENTES"."LOC_TRAB"'
      Size = 30
    end
    object CdsPClientesEND_TRAB: TStringField
      DisplayLabel = 'Endere'#231'o de Trabalho'
      FieldName = 'END_TRAB'
      Origin = '"CLIENTES"."END_TRAB"'
      Size = 35
    end
    object CdsPClientesFONE_TRAB: TStringField
      DisplayLabel = 'Fone do Trabalho'
      FieldName = 'FONE_TRAB'
      Origin = '"CLIENTES"."FONE_TRAB"'
      EditMask = '(99) 9999-9999;0;_'
      FixedChar = True
      Size = 14
    end
    object CdsPClientesCARGO: TStringField
      DisplayLabel = 'Cargo'
      FieldName = 'CARGO'
      Origin = '"CLIENTES"."CARGO"'
      Size = 15
    end
    object CdsPClientesRG: TStringField
      FieldName = 'RG'
      Origin = '"CLIENTES"."RG"'
      FixedChar = True
      Size = 10
    end
    object CdsPClientesEXPEDIC: TDateTimeField
      DisplayLabel = 'Data Expedi'#231#227'o RG'
      FieldName = 'EXPEDIC'
      Origin = '"CLIENTES"."EXPEDIC"'
      EditMask = '!99/99/9999;1;_'
    end
    object CdsPClientesORG_EXPEDIC: TStringField
      DisplayLabel = #211'rg'#227'o Expedi'#231#227'o RG'
      FieldName = 'ORG_EXPEDIC'
      Origin = '"CLIENTES"."ORG_EXPEDIC"'
    end
    object CdsPClientesCTPS: TStringField
      DisplayLabel = 'Num Cartareira Trabalho'
      FieldName = 'CTPS'
      Origin = '"CLIENTES"."CTPS"'
      FixedChar = True
      Size = 10
    end
    object CdsPClientesREF_BANC1: TStringField
      DisplayLabel = 'Refer'#234'ncia Banc'#225'ria 1'
      FieldName = 'REF_BANC1'
      Origin = '"CLIENTES"."REF_BANC1"'
      Size = 30
    end
    object CdsPClientesFONE_BANC1: TStringField
      DisplayLabel = 'Fone Ref Banco 1'
      FieldName = 'FONE_BANC1'
      Origin = '"CLIENTES"."FONE_BANC1"'
      EditMask = '(99) 9999-9999;0;_'
      FixedChar = True
      Size = 14
    end
    object CdsPClientesREF_BANC2: TStringField
      DisplayLabel = 'Refer'#234'ncia Banc'#225'ria 2'
      FieldName = 'REF_BANC2'
      Origin = '"CLIENTES"."REF_BANC2"'
      Size = 30
    end
    object CdsPClientesFONE_BANC2: TStringField
      DisplayLabel = 'Fone Ref Banco 2'
      FieldName = 'FONE_BANC2'
      Origin = '"CLIENTES"."FONE_BANC2"'
      EditMask = '(99) 9999-9999;0;_'
      FixedChar = True
      Size = 14
    end
    object CdsPClientesREF_COM1: TStringField
      DisplayLabel = 'Refer'#234'ncia Comercial 1'
      FieldName = 'REF_COM1'
      Origin = '"CLIENTES"."REF_COM1"'
      Size = 30
    end
    object CdsPClientesEND_COM1: TStringField
      DisplayLabel = 'Endere'#231'o Ref Comercial 1'
      FieldName = 'END_COM1'
      Origin = '"CLIENTES"."END_COM1"'
      Size = 30
    end
    object CdsPClientesFONE_COM1: TStringField
      DisplayLabel = 'Fone Ref Comercial 1'
      FieldName = 'FONE_COM1'
      Origin = '"CLIENTES"."FONE_COM1"'
      EditMask = '(99) 9999-9999;0;_'
      FixedChar = True
      Size = 14
    end
    object CdsPClientesINFORM: TStringField
      DisplayLabel = 'Informa'#231#227'o Ref Com 1'
      FieldName = 'INFORM'
      Origin = '"CLIENTES"."INFORM"'
      Size = 30
    end
    object CdsPClientesPRI_COMPR: TDateTimeField
      DisplayLabel = 'Data 1'#170' Compra Ref Com 1'
      FieldName = 'PRI_COMPR'
      Origin = '"CLIENTES"."PRI_COMPR"'
      EditMask = '!99/99/9999;1;_'
    end
    object CdsPClientesULT_COMPR: TDateTimeField
      DisplayLabel = 'Data '#218'ltima Compra Ref Com 1'
      FieldName = 'ULT_COMPR'
      Origin = '"CLIENTES"."ULT_COMPR"'
      EditMask = '!99/99/9999;1;_'
    end
    object CdsPClientesCONCEITO: TStringField
      DisplayLabel = 'Conceito Cli Ref Com 1'
      FieldName = 'CONCEITO'
      Origin = '"CLIENTES"."CONCEITO"'
      Size = 15
    end
    object CdsPClientesREF_COM2: TStringField
      DisplayLabel = 'Refer'#234'ncia Comercial 2'
      FieldName = 'REF_COM2'
      Origin = '"CLIENTES"."REF_COM2"'
      Size = 30
    end
    object CdsPClientesEND_COM2: TStringField
      DisplayLabel = 'Endere'#231'o Ref Comercial 2'
      FieldName = 'END_COM2'
      Origin = '"CLIENTES"."END_COM2"'
      Size = 30
    end
    object CdsPClientesFONE_COM2: TStringField
      DisplayLabel = 'Fone Ref Comercial 2'
      FieldName = 'FONE_COM2'
      Origin = '"CLIENTES"."FONE_COM2"'
      EditMask = '(99) 9999-9999;0;_'
      FixedChar = True
      Size = 14
    end
    object CdsPClientesINFORM2: TStringField
      DisplayLabel = 'Informa'#231#227'o Ref Com 2'
      FieldName = 'INFORM2'
      Origin = '"CLIENTES"."INFORM2"'
      Size = 30
    end
    object CdsPClientesPRI_COMPR2: TDateTimeField
      DisplayLabel = 'Data 1'#170' Compra Ref Com 2'
      FieldName = 'PRI_COMPR2'
      Origin = '"CLIENTES"."PRI_COMPR2"'
      EditMask = '!99/99/9999;1;_'
    end
    object CdsPClientesULT_COMPR2: TDateTimeField
      DisplayLabel = 'Data '#218'ltima Compra Ref Com 2'
      FieldName = 'ULT_COMPR2'
      Origin = '"CLIENTES"."ULT_COMPR2"'
      EditMask = '!99/99/9999;1;_'
    end
    object CdsPClientesCONCEITO2: TStringField
      DisplayLabel = 'Conceito Cli Ref Com 2'
      FieldName = 'CONCEITO2'
      Origin = '"CLIENTES"."CONCEITO2"'
      Size = 15
    end
    object CdsPClientesSPCL: TDateTimeField
      DisplayLabel = 'Data nada consta SPC Local'
      FieldName = 'SPCL'
      Origin = '"CLIENTES"."SPCL"'
      EditMask = '!99/99/9999;1;_'
    end
    object CdsPClientesSPCEST: TDateTimeField
      DisplayLabel = 'Data nada consta SPC Estadual'
      FieldName = 'SPCEST'
      Origin = '"CLIENTES"."SPCEST"'
      EditMask = '!99/99/9999;1;_'
    end
    object CdsPClientesREGSPC: TDateTimeField
      DisplayLabel = 'Data Registro no SPC'
      FieldName = 'REGSPC'
      Origin = '"CLIENTES"."REGSPC"'
      EditMask = '!99/99/9999;1;_'
    end
    object CdsPClientesREGSPCCH: TDateTimeField
      DisplayLabel = 'Data Registro SPC Cheque'
      FieldName = 'REGSPCCH'
      Origin = '"CLIENTES"."REGSPCCH"'
      EditMask = '!99/99/9999;1;_'
    end
    object CdsPClientesUS_CAD_CLI: TIntegerField
      DisplayLabel = 'Usu'#225'rio que cadastrou'
      FieldName = 'US_CAD_CLI'
      Origin = '"CLIENTES"."US_CAD_CLI"'
    end
    object CdsPClientesDESC_TP_CLIENTE: TStringField
      DisplayLabel = 'Tipo Cliente'
      FieldName = 'DESC_TP_CLIENTE'
      Size = 30
    end
    object CdsPClientesFONE_CLIENTE: TStringField
      DisplayLabel = 'Fone Cliente'
      FieldName = 'FONE_CLIENTE'
      Origin = '"CLIENTES"."FONE_CLIENTE"'
      EditMask = '(99) 9999-9999;0;_'
      FixedChar = True
      Size = 13
    end
    object CdsPClientesFONE_CELULAR: TStringField
      DisplayLabel = 'Celular'
      FieldName = 'FONE_CELULAR'
      EditMask = '(99) 99999-9999;0;_'
      FixedChar = True
      Size = 13
    end
    object CdsPClientesCEP: TStringField
      FieldName = 'CEP'
      Origin = '"CLIENTES"."CEP"'
      Required = True
      EditMask = '00000\-999;0;'
      FixedChar = True
      Size = 9
    end
    object CdsPClientesENDERECO: TStringField
      DisplayLabel = 'Endere'#231'o Cliente'
      FieldName = 'ENDERECO'
      Origin = '"CLIENTES"."ENDERECO"'
      Required = True
      Size = 50
    end
    object CdsPClientesCOMPLEMENTO: TStringField
      DisplayLabel = 'Complemento'
      FieldName = 'COMPLEMENTO'
      Size = 60
    end
    object CdsPClientesNUM_END_CLIENTE: TStringField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'NUM_END_CLIENTE'
      Size = 60
    end
    object CdsPClientesBAIRRO: TStringField
      DisplayLabel = 'Bairro'
      FieldName = 'BAIRRO'
      Origin = '"CLIENTES"."BAIRRO"'
      Required = True
      Size = 35
    end
    object CdsPClientesCIDADE: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'CIDADE'
      Origin = '"CLIENTES"."CIDADE"'
      Required = True
      Size = 30
    end
    object CdsPClientesESTADOS_UF: TStringField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADOS_UF'
      Size = 2
    end
    object CdsPClientesCEP_COBRANCA: TStringField
      DisplayLabel = 'CEP Cobran'#231'a'
      FieldName = 'CEP_COBRANCA'
      Origin = '"CLIENTES"."CEP_COBRANCA"'
      EditMask = '00000\-999;0;'
      FixedChar = True
      Size = 9
    end
    object CdsPClientesEND_COBRANCA: TStringField
      DisplayLabel = 'Endere'#231'o Cobran'#231'a'
      FieldName = 'END_COBRANCA'
      Origin = '"CLIENTES"."END_COBRANCA"'
      Size = 50
    end
    object CdsPClientesBAIRRO_COBRANCA: TStringField
      DisplayLabel = 'Bairro Cobran'#231'a'
      FieldName = 'BAIRRO_COBRANCA'
      Origin = '"CLIENTES"."BAIRRO_COBRANCA"'
      Size = 35
    end
    object CdsPClientesCIDA_COBRANCA: TStringField
      DisplayLabel = 'Cidade Cobran'#231'a'
      FieldName = 'CIDA_COBRANCA'
      Origin = '"CLIENTES"."CIDA_COBRANCA"'
      Size = 30
    end
    object CdsPClientesESTADOS_UF_COBRANCA: TStringField
      DisplayLabel = 'Estado Cobran'#231'a'
      FieldName = 'ESTADOS_UF_COBRANCA'
      Size = 2
    end
    object CdsPClientesOBS_DIV: TMemoField
      DisplayLabel = 'Obs Diversas'
      FieldName = 'OBS_DIV'
      Origin = '"CLIENTES"."OBS_DIV"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
    object CdsPClientesPAI: TStringField
      DisplayLabel = 'Pai'
      FieldName = 'PAI'
      Origin = '"CLIENTES"."PAI"'
      Size = 35
    end
    object CdsPClientesMAE: TStringField
      DisplayLabel = 'M'#227'e'
      FieldName = 'MAE'
      Origin = '"CLIENTES"."MAE"'
      Size = 35
    end
    object CdsPClientesDATA_NASC: TDateTimeField
      DisplayLabel = 'Data Nascimento'
      FieldName = 'DATA_NASC'
      Origin = '"CLIENTES"."DATA_NASC"'
      EditMask = '!99/99/9999;1;_'
    end
    object CdsPClientesEMAIL: TStringField
      DisplayLabel = 'E-mail'
      FieldName = 'EMAIL'
      Origin = '"CLIENTES"."EMAIL"'
      Size = 256
    end
    object CdsPClientesCOD_CONVENIO: TIntegerField
      DisplayLabel = 'Cod Conv'#234'nio'
      FieldName = 'COD_CONVENIO'
      Origin = '"CLIENTES"."COD_CONVENIO"'
    end
    object CdsPClientesCONVENIADO: TStringField
      DisplayLabel = 'Conveniado'
      FieldName = 'CONVENIADO'
      Origin = '"CLIENTES"."CONVENIADO"'
      FixedChar = True
      Size = 1
    end
    object CdsPClientesDIA_VENC: TIntegerField
      DisplayLabel = 'Dia Vencimento'
      FieldName = 'DIA_VENC'
      Origin = '"CLIENTES"."DIA_VENC"'
    end
    object CdsPClientesCATEGORIA: TStringField
      DisplayLabel = 'Categoria'
      FieldName = 'CATEGORIA'
      Origin = '"CLIENTES"."CATEGORIA"'
      FixedChar = True
      Size = 8
    end
    object CdsPClientesCLQTDCOMPRA: TStringField
      DisplayLabel = 'Classe Qtd Compra'
      FieldName = 'CLQTDCOMPRA'
      Origin = '"CLIENTES"."CLQTDCOMPRA"'
      FixedChar = True
      Size = 2
    end
    object CdsPClientesCLSOMACOMPRA: TStringField
      DisplayLabel = 'Classe Soma Compras'
      FieldName = 'CLSOMACOMPRA'
      Origin = '"CLIENTES"."CLSOMACOMPRA"'
      FixedChar = True
      Size = 2
    end
    object CdsPClientesCLULTIMACOMPRA: TStringField
      DisplayLabel = 'Classe '#218'ltima Compra'
      FieldName = 'CLULTIMACOMPRA'
      Origin = '"CLIENTES"."CLULTIMACOMPRA"'
      FixedChar = True
      Size = 2
    end
    object CdsPClientesCLATRASOCOMPRA: TStringField
      DisplayLabel = 'Classe Atraso Compra'
      FieldName = 'CLATRASOCOMPRA'
      Origin = '"CLIENTES"."CLATRASOCOMPRA"'
      FixedChar = True
      Size = 2
    end
    object CdsPClientesCLLUCROCLIENTE: TStringField
      DisplayLabel = 'Classe Lucro Cliente'
      FieldName = 'CLLUCROCLIENTE'
      Origin = '"CLIENTES"."CLLUCROCLIENTE"'
      FixedChar = True
      Size = 2
    end
    object CdsPClientesLUCROCLIENTE: TFloatField
      DisplayLabel = 'Lucro Cliente'
      FieldName = 'LUCROCLIENTE'
      Origin = '"CLIENTES"."LUCROCLIENTE"'
    end
    object CdsPClientesTIPOCLIENTE: TStringField
      DisplayLabel = 'Tipo Cliente (P/V/S)'
      FieldName = 'TIPOCLIENTE'
      Origin = '"CLIENTES"."TIPOCLIENTE"'
      FixedChar = True
      Size = 6
    end
    object CdsPClientesCLQTDVEICULO: TStringField
      DisplayLabel = 'Classe Qtd Ve'#237'culo'
      FieldName = 'CLQTDVEICULO'
      Origin = '"CLIENTES"."CLQTDVEICULO"'
      FixedChar = True
      Size = 2
    end
    object CdsPClientesCLSOMAVEICULO: TStringField
      DisplayLabel = 'Classe Soma Ve'#237'culo'
      FieldName = 'CLSOMAVEICULO'
      Origin = '"CLIENTES"."CLSOMAVEICULO"'
      FixedChar = True
      Size = 2
    end
    object CdsPClientesCLULTIMOVEICULO: TStringField
      DisplayLabel = 'Classe '#218'ltimo Ve'#237'culo'
      FieldName = 'CLULTIMOVEICULO'
      Origin = '"CLIENTES"."CLULTIMOVEICULO"'
      FixedChar = True
      Size = 2
    end
    object CdsPClientesCLLUCROVEICULO: TStringField
      DisplayLabel = 'Classe Lucro Ve'#237'culo'
      FieldName = 'CLLUCROVEICULO'
      Origin = '"CLIENTES"."CLLUCROVEICULO"'
      FixedChar = True
      Size = 2
    end
    object CdsPClientesLUCROCLIENTE_V: TFloatField
      DisplayLabel = 'Lucro Cliente Ve'#237'culo'
      FieldName = 'LUCROCLIENTE_V'
      Origin = '"CLIENTES"."LUCROCLIENTE_V"'
    end
    object CdsPClientesV_Q_VEICULO: TFloatField
      DisplayLabel = 'Qtd Ve'#237'culos'
      FieldName = 'V_Q_VEICULO'
      Origin = '"CLIENTES"."V_Q_VEICULO"'
    end
    object CdsPClientesM_Q_VEICULO: TFloatField
      DisplayLabel = 'Media Qtd Ve'#237'culos'
      FieldName = 'M_Q_VEICULO'
      Origin = '"CLIENTES"."M_Q_VEICULO"'
    end
    object CdsPClientesV_T_VEICULO: TFloatField
      DisplayLabel = 'Valor total Ve'#237'culos'
      FieldName = 'V_T_VEICULO'
      Origin = '"CLIENTES"."V_T_VEICULO"'
    end
    object CdsPClientesM_T_VEICULO: TFloatField
      DisplayLabel = 'Media Valor Ve'#237'culos'
      FieldName = 'M_T_VEICULO'
      Origin = '"CLIENTES"."M_T_VEICULO"'
    end
    object CdsPClientesV_L_VEICULO: TFloatField
      DisplayLabel = 'Lucro Ve'#237'culos'
      FieldName = 'V_L_VEICULO'
      Origin = '"CLIENTES"."V_L_VEICULO"'
    end
    object CdsPClientesM_L_VEICULO: TFloatField
      DisplayLabel = 'Media Lucro Ve'#237'culos'
      FieldName = 'M_L_VEICULO'
      Origin = '"CLIENTES"."M_L_VEICULO"'
    end
    object CdsPClientesDATA_ULT_VENDA_V: TDateTimeField
      DisplayLabel = 'Data '#218'ltima Venda Ve'#237'culo'
      FieldName = 'DATA_ULT_VENDA_V'
      Origin = '"CLIENTES"."DATA_ULT_VENDA_V"'
    end
    object CdsPClientesMEDIA_FREQUENCIA_V: TFloatField
      DisplayLabel = 'Media Frequ'#234'ncia Compra V.'
      FieldName = 'MEDIA_FREQUENCIA_V'
      Origin = '"CLIENTES"."MEDIA_FREQUENCIA_V"'
    end
    object CdsPClientesMEDIAFREQUENCIA: TFloatField
      DisplayLabel = 'Media Frequ'#234'ncia Compra'
      FieldName = 'MEDIAFREQUENCIA'
      Origin = '"CLIENTES"."MEDIAFREQUENCIA"'
    end
    object CdsPClientesV_Q_COMPRA: TFloatField
      DisplayLabel = 'Qtd Compras'
      FieldName = 'V_Q_COMPRA'
      Origin = '"CLIENTES"."V_Q_COMPRA"'
    end
    object CdsPClientesM_Q_COMPRA: TFloatField
      DisplayLabel = 'Media Qtd Compras'
      FieldName = 'M_Q_COMPRA'
      Origin = '"CLIENTES"."M_Q_COMPRA"'
    end
    object CdsPClientesV_T_COMPRA: TFloatField
      DisplayLabel = 'Valor Total Compras'
      FieldName = 'V_T_COMPRA'
      Origin = '"CLIENTES"."V_T_COMPRA"'
    end
    object CdsPClientesM_T_COMPRA: TFloatField
      DisplayLabel = 'Media Valor Compras'
      FieldName = 'M_T_COMPRA'
      Origin = '"CLIENTES"."M_T_COMPRA"'
    end
    object CdsPClientesV_L_COMPRA: TFloatField
      DisplayLabel = 'Lucro Compras'
      FieldName = 'V_L_COMPRA'
      Origin = '"CLIENTES"."V_L_COMPRA"'
    end
    object CdsPClientesM_L_COMPRA: TFloatField
      DisplayLabel = 'Media Lucro Compras'
      FieldName = 'M_L_COMPRA'
      Origin = '"CLIENTES"."M_L_COMPRA"'
    end
    object CdsPClientesV_A_COMPRA: TFloatField
      DisplayLabel = 'Qtd Dias Atraso'
      FieldName = 'V_A_COMPRA'
      Origin = '"CLIENTES"."V_A_COMPRA"'
    end
    object CdsPClientesM_A_COMPRA: TFloatField
      DisplayLabel = 'Media Dias Atraso'
      FieldName = 'M_A_COMPRA'
      Origin = '"CLIENTES"."M_A_COMPRA"'
    end
    object CdsPClientesDATA_ULT_COMPRA: TDateTimeField
      DisplayLabel = 'Data '#218'ltima Compra'
      FieldName = 'DATA_ULT_COMPRA'
      Origin = '"CLIENTES"."DATA_ULT_COMPRA"'
    end
    object CdsPClientesNEC_ACOMP: TStringField
      DisplayLabel = 'Acompanhamento'
      FieldName = 'NEC_ACOMP'
      Origin = '"CLIENTES"."NEC_ACOMP"'
      FixedChar = True
      Size = 1
    end
    object CdsPClientesDIAS_ACOMP: TIntegerField
      DisplayLabel = 'Dias Acompanhamento'
      FieldName = 'DIAS_ACOMP'
      Origin = '"CLIENTES"."DIAS_ACOMP"'
    end
    object CdsPClientesSEXO: TStringField
      DisplayLabel = 'Sexo'
      FieldName = 'SEXO'
      Origin = '"CLIENTES"."SEXO"'
      FixedChar = True
      Size = 1
    end
    object CdsPClientesRAMO_ATIVIDADE: TStringField
      DisplayLabel = 'Ramo de Atividade'
      FieldName = 'RAMO_ATIVIDADE'
      Origin = '"CLIENTES"."RAMO_ATIVIDADE"'
      Size = 60
    end
    object CdsPClientesCOD_CIDADE: TSmallintField
      DisplayLabel = 'Cod Cidade'
      FieldName = 'COD_CIDADE'
      Origin = '"CLIENTES"."COD_CIDADE"'
    end
    object CdsPClientesCOD_BAIRRO: TSmallintField
      DisplayLabel = 'Cod Bairro'
      FieldName = 'COD_BAIRRO'
      Origin = '"CLIENTES"."COD_BAIRRO"'
    end
    object CdsPClientesCOD_CIDADE_COBRANCA: TSmallintField
      DisplayLabel = 'Cod Cidade Cobran'#231'a'
      FieldName = 'COD_CIDADE_COBRANCA'
      Origin = '"CLIENTES"."COD_CIDADE_COBRANCA"'
    end
    object CdsPClientesCOD_BAIRRO_COBRANCA: TSmallintField
      DisplayLabel = 'Cod Bairro Cobran'#231'a'
      FieldName = 'COD_BAIRRO_COBRANCA'
      Origin = '"CLIENTES"."COD_BAIRRO_COBRANCA"'
    end
    object CdsPClientesESTADO_CIVIL: TStringField
      DisplayLabel = 'Estado Civ'#237'l '
      FieldName = 'ESTADO_CIVIL'
      Origin = '"CLIENTES"."ESTADO_CIVIL"'
      Size = 32
    end
    object CdsPClientesTIPVCLIENTE: TStringField
      DisplayLabel = 'Tipo Venda ao Cliente'
      DisplayWidth = 1
      FieldName = 'TIPVCLIENTE'
      Origin = '"CLIENTES"."TIPVCLIENTE"'
      Size = 1
    end
    object CdsPClientesCAMP_PR_VENDA: TStringField
      DisplayLabel = 'Pre'#231'o Venda ao Cliente'
      FieldName = 'CAMP_PR_VENDA'
      Origin = '"CLIENTES"."CAMP_PR_VENDA"'
    end
    object CdsPClientesPERC_DESC: TFloatField
      DisplayLabel = 'Maximo Desconto (%)'
      FieldName = 'PERC_DESC'
      Origin = '"CLIENTES"."PERC_DESC"'
    end
    object CdsPClientesATIVO: TIntegerField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
      Origin = '"CLIENTES"."ATIVO"'
    end
    object CdsPClientesCOD_CONTADOR: TIntegerField
      DisplayLabel = 'Cod Contador'
      FieldName = 'COD_CONTADOR'
      Origin = '"CLIENTES"."COD_CONTADOR"'
    end
    object CdsPClientesTIPO: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Origin = '"CLIENTES"."TIPO"'
      FixedChar = True
      Size = 1
    end
    object CdsPClientesINSC_SUB_F: TStringField
      DisplayLabel = 'Insc Sub Tribut'#225'rio'
      FieldName = 'INSC_SUB_F'
      Origin = '"CLIENTES"."INSC_SUB_F"'
      FixedChar = True
      Size = 18
    end
    object CdsPClientesCDMICROEPP: TStringField
      DisplayLabel = 'Situa'#231#227'o Fornec junto '#224' AF '
      FieldName = 'CDMICROEPP'
      Origin = '"CLIENTES"."CDMICROEPP"'
      FixedChar = True
      Size = 1
    end
    object CdsPClientesTEL_RES_CF: TStringField
      DisplayLabel = 'Telefone residencial Fornec'
      FieldName = 'TEL_RES_CF'
      Origin = '"CLIENTES"."TEL_RES_CF"'
      FixedChar = True
      Size = 14
    end
    object CdsPClientesRAMAL: TStringField
      DisplayLabel = 'Ramal'
      FieldName = 'RAMAL'
      FixedChar = True
      Size = 5
    end
    object CdsPClientesCOD_VENDEDOR: TIntegerField
      DisplayLabel = 'Carteira'
      FieldName = 'COD_VENDEDOR'
    end
    object CdsPClientesCOD_PAIS: TIntegerField
      DisplayLabel = 'Cod Pais'
      FieldName = 'COD_PAIS'
    end
    object CdsPClientesDIASPROTESTO: TSmallintField
      DisplayLabel = 'Dias Protesto'
      FieldName = 'DIASPROTESTO'
    end
    object CdsPClientesIDMOBILE_INS: TIntegerField
      DisplayLabel = 'ID Mobile INS.'
      FieldName = 'IDMOBILE_INS'
    end
    object CdsPClientesIDMOBILE_ALT: TIntegerField
      DisplayLabel = 'ID Mobile Alt.'
      FieldName = 'IDMOBILE_ALT'
    end
    object CdsPClientesLISTASEMAIL: TStringField
      FieldName = 'LISTASEMAIL'
      Size = 500
    end
    object CdsPClientesAPELIDO: TStringField
      DisplayLabel = 'Apelido'
      FieldName = 'APELIDO'
      Size = 50
    end
    object CdsPClientesCODIGO_SWHW: TIntegerField
      DisplayLabel = 'Codigo SW'
      FieldName = 'CODIGO_SWHW'
    end
  end
  object qrBaixaCredito: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransClientes
    SQL.Strings = (
      'Select * from Baixa_creditos where 1=0')
    Left = 601
    Top = 577
    object qrBaixaCreditoSEQ_BXCRED: TIntegerField
      DisplayLabel = 'Sequ'#234'ncia'
      FieldName = 'SEQ_BXCRED'
      Origin = '"BAIXA_CREDITOS"."SEQ_BXCRED"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrBaixaCreditoCOD_CRED: TIntegerField
      DisplayLabel = 'Cod Cr'#233'dito'
      FieldName = 'COD_CRED'
      Origin = '"BAIXA_CREDITOS"."COD_CRED"'
      Required = True
    end
    object qrBaixaCreditoCODIGO_CTRL: TIntegerField
      DisplayLabel = 'Cod Controle'
      FieldName = 'CODIGO_CTRL'
      Origin = '"BAIXA_CREDITOS"."CODIGO_CTRL"'
    end
    object qrBaixaCreditoDATA_REC_C: TDateTimeField
      DisplayLabel = 'Data Cadastro'
      FieldName = 'DATA_REC_C'
      Origin = '"BAIXA_CREDITOS"."DATA_REC_C"'
    end
    object qrBaixaCreditoTIPO_DOC_C: TIBStringField
      DisplayLabel = 'Tipo de documento'
      FieldName = 'TIPO_DOC_C'
      Origin = '"BAIXA_CREDITOS"."TIPO_DOC_C"'
      FixedChar = True
      Size = 15
    end
    object qrBaixaCreditoHISTORICO_C: TIBStringField
      DisplayLabel = 'Hist'#243'rico'
      FieldName = 'HISTORICO_C'
      Origin = '"BAIXA_CREDITOS"."HISTORICO_C"'
      FixedChar = True
      Size = 100
    end
    object qrBaixaCreditoDATA_VENC_C: TDateTimeField
      DisplayLabel = 'Data Vencimento'
      FieldName = 'DATA_VENC_C'
      Origin = '"BAIXA_CREDITOS"."DATA_VENC_C"'
    end
    object qrBaixaCreditoVALOR_C: TFloatField
      DisplayLabel = 'VL Cr'#233'dito anterior '#224' quita'#231#227'o'
      FieldName = 'VALOR_C'
      Origin = '"BAIXA_CREDITOS"."VALOR_C"'
      currency = True
    end
    object qrBaixaCreditoVALOR_QUITADO: TFloatField
      DisplayLabel = 'Valor Baixado'
      FieldName = 'VALOR_QUITADO'
      Origin = '"BAIXA_CREDITOS"."VALOR_QUITADO"'
      currency = True
    end
    object qrBaixaCreditoVALOR_CORR: TFloatField
      DisplayLabel = 'Valor Corrigido'
      FieldName = 'VALOR_CORR'
      Origin = '"BAIXA_CREDITOS"."VALOR_CORR"'
      currency = True
    end
    object qrBaixaCreditoDATQ_C: TDateTimeField
      DisplayLabel = 'Data Quita'#231#227'o'
      FieldName = 'DATQ_C'
      Origin = '"BAIXA_CREDITOS"."DATQ_C"'
    end
    object qrBaixaCreditoNATL_C: TIBStringField
      DisplayLabel = 'Natureza Cr'#233'dito'
      FieldName = 'NATL_C'
      Origin = '"BAIXA_CREDITOS"."NATL_C"'
      FixedChar = True
      Size = 1
    end
    object qrBaixaCreditoLOTE: TIntegerField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
      Origin = '"BAIXA_CREDITOS"."LOTE"'
    end
    object qrBaixaCreditoTP_DOC_V: TIBStringField
      DisplayLabel = 'Tipo Documento da Venda'
      FieldName = 'TP_DOC_V'
      Origin = '"BAIXA_CREDITOS"."TP_DOC_V"'
      FixedChar = True
      Size = 6
    end
    object qrBaixaCreditoTP_OPERACAO: TIBStringField
      DisplayLabel = 'Baixa Total ou Parcial'
      FieldName = 'TP_OPERACAO'
      Origin = '"BAIXA_CREDITOS"."TP_OPERACAO"'
      FixedChar = True
      Size = 1
    end
    object qrBaixaCreditoOBS_C: TIBStringField
      DisplayLabel = 'Observa'#231#227'o Cr'#233'dito'
      FieldName = 'OBS_C'
      Origin = '"BAIXA_CREDITOS"."OBS_C"'
      FixedChar = True
      Size = 60
    end
    object qrBaixaCreditoN_DOC_V: TIntegerField
      DisplayLabel = 'N'#250'mero do Doc. Venda'
      FieldName = 'N_DOC_V'
      Origin = '"BAIXA_CREDITOS"."N_DOC_V"'
    end
    object qrBaixaCreditoN_DOC_C: TIBStringField
      DisplayLabel = 'N'#186' Documento'
      FieldName = 'N_DOC_C'
      Origin = '"BAIXA_CREDITOS"."N_DOC_C"'
      FixedChar = True
    end
    object qrBaixaCreditoTIP_CNT: TIBStringField
      DisplayLabel = 'Tipo Lancamento'
      FieldName = 'TIP_CNT'
      Origin = '"BAIXA_CREDITOS"."TIP_CNT"'
      FixedChar = True
      Size = 1
    end
    object qrBaixaCreditoCODIGO_VEND: TIntegerField
      DisplayLabel = 'C'#243'digo Vendedor'
      FieldName = 'CODIGO_VEND'
      Origin = '"BAIXA_CREDITOS"."CODIGO_VEND"'
    end
    object qrBaixaCreditoTIP_BAIXA: TIBStringField
      DisplayLabel = 'Tipo de Baixa'
      FieldName = 'TIP_BAIXA'
      Origin = '"BAIXA_CREDITOS"."TIP_BAIXA"'
      FixedChar = True
      Size = 1
    end
    object qrBaixaCreditoCOD_CLIENTE: TIntegerField
      DisplayLabel = 'Cod Cliente'
      FieldName = 'COD_CLIENTE'
      Origin = '"BAIXA_CREDITOS"."COD_CLIENTE"'
    end
    object qrBaixaCreditoNOME_C: TIBStringField
      DisplayLabel = 'Nome do Cliente'
      FieldName = 'NOME_C'
      Origin = '"BAIXA_CREDITOS"."NOME_C"'
      FixedChar = True
      Size = 35
    end
    object qrBaixaCreditoDATA_BAIXA: TDateTimeField
      DisplayLabel = 'Data Real da Baixa'
      FieldName = 'DATA_BAIXA'
      Origin = '"BAIXA_CREDITOS"."DATA_BAIXA"'
    end
    object qrBaixaCreditoNOME_TERC: TIBStringField
      DisplayLabel = 'Nome Cliente Terceiro'
      FieldName = 'NOME_TERC'
      Origin = '"BAIXA_CREDITOS"."NOME_TERC"'
      FixedChar = True
      Size = 35
    end
    object qrBaixaCreditoCOD_CLI_TERC: TIntegerField
      DisplayLabel = 'Cliente Terceiro'
      FieldName = 'COD_CLI_TERC'
      Origin = '"BAIXA_CREDITOS"."COD_CLI_TERC"'
    end
    object qrBaixaCreditoDATA_VENDA: TDateTimeField
      DisplayLabel = 'Data da Venda'
      FieldName = 'DATA_VENDA'
      Origin = '"BAIXA_CREDITOS"."DATA_VENDA"'
    end
    object qrBaixaCreditoLOTE_QUIT: TIntegerField
      DisplayLabel = 'Lote de quita'#231#227'o'
      FieldName = 'LOTE_QUIT'
      Origin = '"BAIXA_CREDITOS"."LOTE_QUIT"'
    end
    object qrBaixaCreditoLOTE_ENT: TIntegerField
      DisplayLabel = 'Lote de entrada referente a quita'#231#227'o'
      FieldName = 'LOTE_ENT'
      Origin = '"BAIXA_CREDITOS"."LOTE_ENT"'
    end
    object qrBaixaCreditoVALOR_DESC: TFloatField
      DisplayLabel = 'Valor do Desconto'
      FieldName = 'VALOR_DESC'
      Origin = '"BAIXA_CREDITOS"."VALOR_DESC"'
    end
    object qrBaixaCreditoVALOR_ACRESC: TFloatField
      DisplayLabel = 'Valor do Acrescimo'
      FieldName = 'VALOR_ACRESC'
      Origin = '"BAIXA_CREDITOS"."VALOR_ACRESC"'
    end
    object qrBaixaCreditoDIA_CXL: TDateTimeField
      DisplayLabel = 'Dia do Caixa Loja'
      FieldName = 'DIA_CXL'
      Origin = '"BAIXA_CREDITOS"."DIA_CXL"'
    end
    object qrBaixaCreditoSTATUS_CXL_RQ: TIBStringField
      DisplayLabel = 'Status do Caixa Loja'
      FieldName = 'STATUS_CXL_RQ'
      Origin = '"BAIXA_CREDITOS"."STATUS_CXL_RQ"'
      FixedChar = True
      Size = 1
    end
    object qrBaixaCreditoVL_RQ_PG_CXL: TFloatField
      DisplayLabel = 'Valor Recebido no Caixa'
      FieldName = 'VL_RQ_PG_CXL'
      Origin = '"BAIXA_CREDITOS"."VL_RQ_PG_CXL"'
    end
    object qrBaixaCreditoOP_CXL: TIntegerField
      DisplayLabel = 'Operador'
      FieldName = 'OP_CXL'
      Origin = '"BAIXA_CREDITOS"."OP_CXL"'
    end
    object qrBaixaCreditoCPFCGC: TIBStringField
      DisplayLabel = 'CNPJ/CPF'
      FieldName = 'CPFCGC'
      Origin = '"BAIXA_CREDITOS"."CPFCGC"'
      FixedChar = True
      Size = 18
    end
    object qrBaixaCreditoLOTE_CXL: TIntegerField
      DisplayLabel = 'Lote do Caixa Loja'
      FieldName = 'LOTE_CXL'
      Origin = '"BAIXA_CREDITOS"."LOTE_CXL"'
    end
    object qrBaixaCreditoJUROS_COB: TFloatField
      DisplayLabel = 'Juros Cobrados'
      FieldName = 'JUROS_COB'
      Origin = '"BAIXA_CREDITOS"."JUROS_COB"'
    end
    object qrBaixaCreditoCOD_EMP_MULT: TIntegerField
      DisplayLabel = 'Cod Empresa Multiloja'
      FieldName = 'COD_EMP_MULT'
      Origin = '"BAIXA_CREDITOS"."COD_EMP_MULT"'
    end
    object qrBaixaCreditoCODIGO_EMP: TIntegerField
      DisplayLabel = 'C'#243'digo da Empresa'
      FieldName = 'CODIGO_EMP'
      Origin = '"BAIXA_CREDITOS"."CODIGO_EMP"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrBaixaCreditoDT_BAIXA_COMISSAO: TDateTimeField
      DisplayLabel = 'Data da Baixa para Comiss'#227'o'
      FieldName = 'DT_BAIXA_COMISSAO'
      Origin = '"BAIXA_CREDITOS"."DT_BAIXA_COMISSAO"'
    end
    object qrBaixaCreditoVL_BAIXA_COMISSAO: TFloatField
      DisplayLabel = 'Valor da Baixa para comiss'#227'o'
      FieldName = 'VL_BAIXA_COMISSAO'
      Origin = '"BAIXA_CREDITOS"."VL_BAIXA_COMISSAO"'
    end
  end
  object dsBaixaCredito: TDataSource
    DataSet = qrBaixaCredito
    Left = 604
    Top = 621
  end
  object qrRelatoriosCli: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransClientes
    SQL.Strings = (
      'Select * from Baixa_creditos where 1=0')
    Left = 782
    Top = 56
  end
  object RdpCliente: TRDprint
    ImpressoraPersonalizada.NomeImpressora = 'Modelo Personalizado - (Epson)'
    ImpressoraPersonalizada.AvancaOitavos = '27 48'
    ImpressoraPersonalizada.AvancaSextos = '27 50'
    ImpressoraPersonalizada.SaltoPagina = '12'
    ImpressoraPersonalizada.TamanhoPagina = '27 67 66'
    ImpressoraPersonalizada.Negrito = '27 69'
    ImpressoraPersonalizada.Italico = '27 52'
    ImpressoraPersonalizada.Sublinhado = '27 45 49'
    ImpressoraPersonalizada.Expandido = '27 14'
    ImpressoraPersonalizada.Normal10 = '18 27 80'
    ImpressoraPersonalizada.Comprimir12 = '18 27 77'
    ImpressoraPersonalizada.Comprimir17 = '27 80 27 15'
    ImpressoraPersonalizada.Comprimir20 = '27 77 27 15'
    ImpressoraPersonalizada.Reset = '27 80 18 20 27 53 27 70 27 45 48'
    ImpressoraPersonalizada.Inicializar = '27 64'
    OpcoesPreview.PaginaZebrada = False
    OpcoesPreview.Remalina = True
    OpcoesPreview.CaptionPreview = 'Rdprint Preview'
    OpcoesPreview.PreviewZoom = 100
    OpcoesPreview.CorPapelPreview = clWhite
    OpcoesPreview.CorLetraPreview = clBlack
    OpcoesPreview.Preview = True
    OpcoesPreview.BotaoSetup = Ativo
    OpcoesPreview.BotaoImprimir = Ativo
    OpcoesPreview.BotaoGravar = Ativo
    OpcoesPreview.BotaoLer = Ativo
    OpcoesPreview.BotaoProcurar = Ativo
    OpcoesPreview.BotaoPDF = Ativo
    OpcoesPreview.BotaoEMAIL = Ativo
    Margens.Left = 10
    Margens.Right = 10
    Margens.Top = 10
    Margens.Bottom = 10
    Autor = Deltress
    RegistroUsuario.NomeRegistro = 'LESTE INFORMATICA LTDA - ME'
    RegistroUsuario.SerieProduto = 'SINGLE-0113/01448'
    RegistroUsuario.AutorizacaoKey = 'VUYG-1QQX-P85V-AWCD-RR5K'
    About = 'RDprint 5.0 - Registrado'
    Acentuacao = Transliterate
    CaptionSetup = 'Rdprint Setup'
    TitulodoRelatorio = 'Gerado por RDprint'
    UsaGerenciadorImpr = True
    CorForm = clBtnFace
    CorFonte = clBlack
    Impressora = Epson
    Mapeamento.Strings = (
      '//--- Grafico Compativel com Windows/USB ---//'
      '//'
      'GRAFICO=GRAFICO'
      'HP=GRAFICO'
      'DESKJET=GRAFICO'
      'LASERJET=GRAFICO'
      'INKJET=GRAFICO'
      'STYLUS=GRAFICO'
      'EPL=GRAFICO'
      'USB=GRAFICO'
      '//'
      '//--- Linha Epson Matricial 9 e 24 agulhas ---//'
      '//'
      'EPSON=EPSON'
      'GENERICO=EPSON'
      'LX-300=EPSON'
      'LX-810=EPSON'
      'FX-2170=EPSON'
      'FX-1170=EPSON'
      'LQ-1170=EPSON'
      'LQ-2170=EPSON'
      'OKIDATA=EPSON'
      '//'
      '//--- Rima e Emilia ---//'
      '//'
      'RIMA=RIMA'
      'EMILIA=RIMA'
      '//'
      '//--- Linha HP/Xerox padr'#227'o PCL ---//'
      '//'
      'PCL=HP'
      '//'
      '//--- Impressoras 40 Colunas ---//'
      '//'
      'DARUMA=BOBINA'
      'SIGTRON=BOBINA'
      'SWEDA=BOBINA'
      'BEMATECH=BOBINA')
    MostrarProgresso = True
    TamanhoQteLinhas = 66
    TamanhoQteColunas = 132
    TamanhoQteLPP = Seis
    NumerodeCopias = 1
    FonteTamanhoPadrao = S17cpp
    FonteEstiloPadrao = []
    Orientacao = poPortrait
    Left = 720
    Top = 1
  end
  object QrLancQuit: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransClientes
    SQL.Strings = (
      
        'Select l.*,ctr.nome_ctrl from lancamentos l, controles ctr where' +
        ' 1=0')
    Left = 666
    Top = 577
    object QrLancQuitNOME_CTRL: TIBStringField
      DisplayLabel = 'Controle'
      FieldName = 'NOME_CTRL'
      Origin = '"CONTROLES"."NOME_CTRL"'
      Size = 35
    end
    object QrLancQuitN_CONTA_PLC: TFloatField
      DisplayLabel = 'N'#186' da Conta'
      FieldName = 'N_CONTA_PLC'
      Origin = '"LANCAMENTOS"."N_CONTA_PLC"'
    end
    object QrLancQuitDATA: TDateTimeField
      DisplayLabel = 'Data Lan'#231'amento'
      FieldName = 'DATA'
      Origin = '"LANCAMENTOS"."DATA"'
    end
    object QrLancQuitHISTORICO_L: TIBStringField
      DisplayLabel = 'Hist'#243'rico'
      FieldName = 'HISTORICO_L'
      Origin = '"LANCAMENTOS"."HISTORICO_L"'
      FixedChar = True
      Size = 100
    end
    object QrLancQuitVALOR_L: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VALOR_L'
      Origin = '"LANCAMENTOS"."VALOR_L"'
    end
    object QrLancQuitVL_CONTABIL: TFloatField
      DisplayLabel = 'Valor Cont'#225'bil'
      FieldName = 'VL_CONTABIL'
      Origin = '"LANCAMENTOS"."VL_CONTABIL"'
    end
  end
  object dsLancQuit: TDataSource
    DataSet = QrLancQuit
    Left = 669
    Top = 621
  end
  object QrCheqQuit: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransClientes
    SQL.Strings = (
      
        'select chq.*,ctr.Nome_ctrl from controle_cheque chq,controles ct' +
        'r where 1=0')
    Left = 726
    Top = 577
    object QrCheqQuitNOME_CTRL: TIBStringField
      DisplayLabel = 'Controle'
      FieldName = 'NOME_CTRL'
      Origin = '"CONTROLES"."NOME_CTRL"'
      Size = 35
    end
    object QrCheqQuitN_CONTA_PLC: TFloatField
      DisplayLabel = 'N'#186' da Conta'
      FieldName = 'N_CONTA_PLC'
      Origin = '"CONTROLE_CHEQUE"."N_CONTA_PLC"'
    end
    object QrCheqQuitNOME_CH: TIBStringField
      DisplayLabel = 'Nome do Cliente'
      FieldName = 'NOME_CH'
      Origin = '"CONTROLE_CHEQUE"."NOME_CH"'
      Size = 35
    end
    object QrCheqQuitDATA_REC: TDateTimeField
      DisplayLabel = 'Data Recebimento'
      FieldName = 'DATA_REC'
      Origin = '"CONTROLE_CHEQUE"."DATA_REC"'
    end
    object QrCheqQuitN_CH: TIBStringField
      DisplayLabel = 'N'#186' do Cheque'
      FieldName = 'N_CH'
      Origin = '"CONTROLE_CHEQUE"."N_CH"'
      FixedChar = True
    end
    object QrCheqQuitDATA_VENC: TDateTimeField
      DisplayLabel = 'Data Vencimento'
      FieldName = 'DATA_VENC'
      Origin = '"CONTROLE_CHEQUE"."DATA_VENC"'
    end
    object QrCheqQuitVALOR_CH: TFloatField
      DisplayLabel = 'Valor Cheque'
      FieldName = 'VALOR_CH'
      Origin = '"CONTROLE_CHEQUE"."VALOR_CH"'
    end
    object QrCheqQuitHISTORICO_CH: TIBStringField
      DisplayLabel = 'Hist'#243'rico do Cheque'
      FieldName = 'HISTORICO_CH'
      Origin = '"CONTROLE_CHEQUE"."HISTORICO_CH"'
      Size = 100
    end
  end
  object dsCheqQuit: TDataSource
    DataSet = QrCheqQuit
    Left = 729
    Top = 621
  end
  object QrCredQuit: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransClientes
    SQL.Strings = (
      
        'select cred.*,ctr.Nome_ctrl from controle_creditos cred,controle' +
        's ctr where 1=0')
    Left = 787
    Top = 577
    object QrCredQuitNOME_CTRL: TIBStringField
      DisplayLabel = 'Controle'
      FieldName = 'NOME_CTRL'
      Origin = '"CONTROLES"."NOME_CTRL"'
      Size = 35
    end
    object QrCredQuitN_CONTA_PLC: TFloatField
      DisplayLabel = 'N'#186' da Conta'
      FieldName = 'N_CONTA_PLC'
      Origin = '"CONTROLE_CREDITOS"."N_CONTA_PLC"'
    end
    object QrCredQuitNOME_C: TIBStringField
      DisplayLabel = 'Nome do Cliente'
      FieldName = 'NOME_C'
      Origin = '"CONTROLE_CREDITOS"."NOME_C"'
      Size = 35
    end
    object QrCredQuitTIPO_DOC_C: TIBStringField
      DisplayLabel = 'Tipo do documento'
      FieldName = 'TIPO_DOC_C'
      Origin = '"CONTROLE_CREDITOS"."TIPO_DOC_C"'
      FixedChar = True
      Size = 15
    end
    object QrCredQuitN_DOC_C: TIBStringField
      DisplayLabel = 'N'#186' do Documento'
      FieldName = 'N_DOC_C'
      Origin = '"CONTROLE_CREDITOS"."N_DOC_C"'
      FixedChar = True
    end
    object QrCredQuitHISTORICO_C: TIBStringField
      DisplayLabel = 'Hist'#243'rico'
      FieldName = 'HISTORICO_C'
      Origin = '"CONTROLE_CREDITOS"."HISTORICO_C"'
      Size = 100
    end
    object QrCredQuitDATA_REC_C: TDateTimeField
      DisplayLabel = 'Data Recebimento'
      FieldName = 'DATA_REC_C'
      Origin = '"CONTROLE_CREDITOS"."DATA_REC_C"'
    end
    object QrCredQuitDATA_VENC_C: TDateTimeField
      DisplayLabel = 'Data Vencimento'
      FieldName = 'DATA_VENC_C'
      Origin = '"CONTROLE_CREDITOS"."DATA_VENC_C"'
    end
    object QrCredQuitVALOR_C: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VALOR_C'
      Origin = '"CONTROLE_CREDITOS"."VALOR_C"'
    end
  end
  object dsCredQuit: TDataSource
    DataSet = QrCredQuit
    Left = 790
    Top = 621
  end
  object SpIncCodigoRepli: TIBStoredProc
    Database = dtmAtivo.bancoHw
    Transaction = IBTransRepliCliente
    StoredProcName = 'INCREMENTA_CODIGO'
    Left = 411
    Top = 232
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
  object qrCondPag: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransClientes
    SQL.Strings = (
      'select cod_cond_pag, desc_cond_pag from cond_pag')
    Left = 552
    Top = 55
  end
  object dspCondPag: TDataSetProvider
    DataSet = qrCondPag
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 553
    Top = 98
  end
  object cdsCondPag: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCondPag'
    BeforeOpen = CdsClientesBeforeOpen
    Left = 555
    Top = 140
    object cdsCondPagCOD_COND_PAG: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'COD_COND_PAG'
      Origin = '"COND_PAG"."COD_COND_PAG"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsCondPagDESC_COND_PAG: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESC_COND_PAG'
      Origin = '"COND_PAG"."DESC_COND_PAG"'
      Size = 30
    end
  end
  object dsCondPag: TDataSource
    DataSet = cdsCondPag
    Left = 556
    Top = 186
  end
  object QrClientesUpdate: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IbTrClientesUpdate
    Left = 780
    Top = 106
  end
  object IbTrClientesUpdate: TIBTransaction
    DefaultDatabase = dtmAtivo.bancoHw
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 642
    Top = 2
  end
  object qrINf: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransClientes
    DataSource = dsLinkMD
    SQL.Strings = (
      
        'select * from notafiscal_item ni where ni.cod_nf= :cod_nf and  n' +
        'i.cod_empresa=:cod_empresa and ni.ativo=1')
    Left = 713
    Top = 53
    ParamData = <
      item
        DataType = ftInteger
        Name = 'COD_NF'
        ParamType = ptInput
        Size = 4
      end
      item
        DataType = ftInteger
        Name = 'COD_EMPRESA'
        ParamType = ptInput
        Size = 4
      end>
  end
  object dspINf: TDataSetProvider
    DataSet = qrINf
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 713
    Top = 96
  end
  object cdsINf: TClientDataSet
    Aggregates = <>
    DataSetField = cdsNfqrINf
    Params = <>
    BeforeOpen = CdsClientesBeforeOpen
    Left = 713
    Top = 140
    object cdsINfCOD_NF: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_NF'
      Origin = '"NOTAFISCAL_ITEM"."COD_NF"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsINfNITEM: TIntegerField
      DisplayLabel = 'N'#186' Item'
      FieldName = 'NITEM'
      Origin = '"NOTAFISCAL_ITEM"."NITEM"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsINfGRUPO_PROD: TIntegerField
      DisplayLabel = 'Grupo'
      FieldName = 'GRUPO_PROD'
      Origin = '"NOTAFISCAL_ITEM"."GRUPO_PROD"'
    end
    object cdsINfCOD_PROD: TStringField
      DisplayLabel = 'C'#243'd Prod'
      FieldName = 'COD_PROD'
      Origin = '"NOTAFISCAL_ITEM"."COD_PROD"'
      FixedChar = True
      Size = 6
    end
    object cdsINfCOD_SERVICO: TIntegerField
      DisplayLabel = 'Cod Serv'
      FieldName = 'COD_SERVICO'
      Origin = '"NOTAFISCAL_ITEM"."COD_SERVICO"'
    end
    object cdsINfCHASSI: TStringField
      DisplayLabel = 'Chassi'
      FieldName = 'CHASSI'
      Origin = '"NOTAFISCAL_ITEM"."CHASSI"'
      FixedChar = True
      Size = 17
    end
    object cdsINfCODIGO_NOP: TFloatField
      DisplayLabel = 'CFOP'
      FieldName = 'CODIGO_NOP'
      Origin = '"NOTAFISCAL_ITEM"."CODIGO_NOP"'
      DisplayFormat = '##0.'
    end
    object cdsINfDESC_NATOP: TStringField
      DisplayLabel = 'Descr. CFOP'
      DisplayWidth = 128
      FieldName = 'DESC_NATOP'
      Origin = '"NOTAFISCAL_ITEM"."DESC_NATOP"'
      Size = 128
    end
    object cdsINfCST: TStringField
      FieldName = 'CST'
      Origin = '"NOTAFISCAL_ITEM"."CST"'
      FixedChar = True
      Size = 3
    end
    object cdsINfCSOSN: TStringField
      FieldName = 'CSOSN'
      Origin = '"NOTAFISCAL_ITEM"."CSOSN"'
      FixedChar = True
      Size = 3
    end
    object cdsINfREFERENCIA: TStringField
      DisplayLabel = 'Ref'
      FieldName = 'REFERENCIA'
      Origin = '"NOTAFISCAL_ITEM"."REFERENCIA"'
      FixedChar = True
      Size = 3
    end
    object cdsINfNUM_FAB_PROD: TStringField
      DisplayLabel = 'Num Fab prod'
      FieldName = 'NUM_FAB_PROD'
      Origin = '"NOTAFISCAL_ITEM"."NUM_FAB_PROD"'
      FixedChar = True
    end
    object cdsINfDESCRICAO_ITEM: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO_ITEM'
      Origin = '"NOTAFISCAL_ITEM"."DESCRICAO_ITEM"'
      Size = 60
    end
    object cdsINfNCM: TStringField
      DisplayLabel = 'NCM/SH'
      FieldName = 'NCM'
      Origin = '"NOTAFISCAL_ITEM"."NCM"'
      Size = 8
    end
    object cdsINfDATA_VALIDADE: TDateTimeField
      DisplayLabel = 'Data Validade'
      FieldName = 'DATA_VALIDADE'
      Origin = '"NOTAFISCAL_ITEM"."DATA_VALIDADE"'
    end
    object cdsINfQUANTIDADE: TFloatField
      DisplayLabel = 'Qtde'
      FieldName = 'QUANTIDADE'
      Origin = '"NOTAFISCAL_ITEM"."QUANTIDADE"'
    end
    object cdsINfVALOR_UNITARIO: TFloatField
      DisplayLabel = 'Valor Unit'
      FieldName = 'VALOR_UNITARIO'
      Origin = '"NOTAFISCAL_ITEM"."VALOR_UNITARIO"'
    end
    object cdsINfVALOR_TOTAL: TFloatField
      DisplayLabel = 'Valot Tot'
      FieldName = 'VALOR_TOTAL'
      Origin = '"NOTAFISCAL_ITEM"."VALOR_TOTAL"'
    end
    object cdsINfALIQ_ICM: TFloatField
      DisplayLabel = '% ICMS'
      FieldName = 'ALIQ_ICM'
      Origin = '"NOTAFISCAL_ITEM"."ALIQ_ICM"'
    end
    object cdsINfBASE_ICM: TFloatField
      DisplayLabel = 'Base ICMS'
      FieldName = 'BASE_ICM'
      Origin = '"NOTAFISCAL_ITEM"."BASE_ICM"'
    end
    object cdsINfVALOR_ICM: TFloatField
      DisplayLabel = 'Valor ICMS'
      FieldName = 'VALOR_ICM'
      Origin = '"NOTAFISCAL_ITEM"."VALOR_ICM"'
    end
    object cdsINfALIQ_ICMSUB: TFloatField
      DisplayLabel = '% ICMS Sub'
      FieldName = 'ALIQ_ICMSUB'
      Origin = '"NOTAFISCAL_ITEM"."ALIQ_ICMSUB"'
    end
    object cdsINfBASE_ICMSUB: TFloatField
      DisplayLabel = 'Base ICMS Sub'
      FieldName = 'BASE_ICMSUB'
      Origin = '"NOTAFISCAL_ITEM"."BASE_ICMSUB"'
    end
    object cdsINfVALOR_ICMSUB: TFloatField
      DisplayLabel = 'Valor ICMS Sub'
      FieldName = 'VALOR_ICMSUB'
      Origin = '"NOTAFISCAL_ITEM"."VALOR_ICMSUB"'
    end
    object cdsINfPERC_RED_PROD_SUB: TFloatField
      DisplayLabel = '% Red ICMS ST'
      FieldName = 'PERC_RED_PROD_SUB'
      Origin = '"NOTAFISCAL_ITEM"."PERC_RED_PROD_SUB"'
    end
    object cdsINfBASE_ICMANT_SUB: TFloatField
      DisplayLabel = 'Base ICMS Ant'
      FieldName = 'BASE_ICMANT_SUB'
      Origin = '"NOTAFISCAL_ITEM"."BASE_ICMANT_SUB"'
    end
    object cdsINfVALOR_ICMANT_SUB: TFloatField
      DisplayLabel = 'Valor ICMS Ant'
      FieldName = 'VALOR_ICMANT_SUB'
      Origin = '"NOTAFISCAL_ITEM"."VALOR_ICMANT_SUB"'
    end
    object cdsINfALIQ_IPI: TFloatField
      DisplayLabel = '% IPI'
      FieldName = 'ALIQ_IPI'
      Origin = '"NOTAFISCAL_ITEM"."ALIQ_IPI"'
    end
    object cdsINfVALOR_IPI: TFloatField
      DisplayLabel = 'Valor IPI'
      FieldName = 'VALOR_IPI'
      Origin = '"NOTAFISCAL_ITEM"."VALOR_IPI"'
    end
    object cdsINfPERC_RED_PROD: TFloatField
      DisplayLabel = '% Red Base'
      FieldName = 'PERC_RED_PROD'
      Origin = '"NOTAFISCAL_ITEM"."PERC_RED_PROD"'
    end
    object cdsINfPERC_DESCONTO: TFloatField
      DisplayLabel = 'Desconto %'
      FieldName = 'PERC_DESCONTO'
      Origin = '"NOTAFISCAL_ITEM"."PERC_DESCONTO"'
    end
    object cdsINfVALOR_DESCONTO_PERC: TFloatField
      DisplayLabel = 'Desconto $'
      FieldName = 'VALOR_DESCONTO_PERC'
      Origin = '"NOTAFISCAL_ITEM"."VALOR_DESCONTO_PERC"'
      DisplayFormat = '##0.0000'
    end
    object cdsINfRATEIO_DESCONTO: TFloatField
      DisplayLabel = 'Rateio Desc $'
      FieldName = 'RATEIO_DESCONTO'
      Origin = '"NOTAFISCAL_ITEM"."RATEIO_DESCONTO"'
      DisplayFormat = '##0.0000'
    end
    object cdsINfMVA: TFloatField
      FieldName = 'MVA'
      Origin = '"NOTAFISCAL_ITEM"."MVA"'
    end
    object cdsINfRATEIO_SEGURO: TFloatField
      DisplayLabel = 'Seguro'
      FieldName = 'RATEIO_SEGURO'
      Origin = '"NOTAFISCAL_ITEM"."RATEIO_SEGURO"'
      DisplayFormat = '##0.0000'
    end
    object cdsINfRATEIO_OUTDESP: TFloatField
      DisplayLabel = 'Out Despesas'
      FieldName = 'RATEIO_OUTDESP'
      Origin = '"NOTAFISCAL_ITEM"."RATEIO_OUTDESP"'
      DisplayFormat = '##0.0000'
    end
    object cdsINfRATEIO_FRETE: TFloatField
      DisplayLabel = 'Frete'
      FieldName = 'RATEIO_FRETE'
      Origin = '"NOTAFISCAL_ITEM"."RATEIO_FRETE"'
      DisplayFormat = '##0.0000'
    end
    object cdsINfRATEIO_ACRES_FIN: TFloatField
      DisplayLabel = 'Acresc Finan'
      FieldName = 'RATEIO_ACRES_FIN'
      Origin = '"NOTAFISCAL_ITEM"."RATEIO_ACRES_FIN"'
      DisplayFormat = '##0.0000'
    end
    object cdsINfRATEIO_DESP_PF: TFloatField
      DisplayLabel = 'Desp PF'
      FieldName = 'RATEIO_DESP_PF'
      Origin = '"NOTAFISCAL_ITEM"."RATEIO_DESP_PF"'
      DisplayFormat = '##0.0000'
    end
    object cdsINfPERC_FRETE: TFloatField
      DisplayLabel = '% Frete'
      FieldName = 'PERC_FRETE'
      Origin = '"NOTAFISCAL_ITEM"."PERC_FRETE"'
    end
    object cdsINfPRCTB_ITEM: TFloatField
      DisplayLabel = 'MarkUp'
      FieldName = 'PRCTB_ITEM'
      Origin = '"NOTAFISCAL_ITEM"."PRCTB_ITEM"'
    end
    object cdsINfPRCTB_ITEMA: TFloatField
      DisplayLabel = 'MarkUp Atacado'
      FieldName = 'PRCTB_ITEMA'
      Origin = '"NOTAFISCAL_ITEM"."PRCTB_ITEMA"'
    end
    object cdsINfPREC_CUS_CNT: TFloatField
      DisplayLabel = 'Custo $'
      FieldName = 'PREC_CUS_CNT'
      Origin = '"NOTAFISCAL_ITEM"."PREC_CUS_CNT"'
    end
    object cdsINfPREC_VND_PROD: TFloatField
      DisplayLabel = 'Pre'#231'o Venda'
      FieldName = 'PREC_VND_PROD'
      Origin = '"NOTAFISCAL_ITEM"."PREC_VND_PROD"'
    end
    object cdsINfPREC_VND_PRODA: TFloatField
      DisplayLabel = 'Pre'#231'o Venda Atacado'
      FieldName = 'PREC_VND_PRODA'
      Origin = '"NOTAFISCAL_ITEM"."PREC_VND_PRODA"'
    end
    object cdsINfPREC_CUS_REP: TFloatField
      DisplayLabel = 'Custo Reposi'#231#227'o $'
      FieldName = 'PREC_CUS_REP'
      Origin = '"NOTAFISCAL_ITEM"."PREC_CUS_REP"'
    end
    object cdsINfPREC_CUSM_PROD: TFloatField
      DisplayLabel = 'Custo M'#233'dio $'
      FieldName = 'PREC_CUSM_PROD'
      Origin = '"NOTAFISCAL_ITEM"."PREC_CUSM_PROD"'
    end
    object cdsINfPMARGFIM: TFloatField
      DisplayLabel = '% Margem'
      FieldName = 'PMARGFIM'
      Origin = '"NOTAFISCAL_ITEM"."PMARGFIM"'
      DisplayFormat = '##0.0000'
    end
    object cdsINfPMARGFIM_A: TFloatField
      DisplayLabel = '% Margem Atacado'
      FieldName = 'PMARGFIM_A'
      Origin = '"NOTAFISCAL_ITEM"."PMARGFIM_A"'
      DisplayFormat = '##0.0000'
    end
    object cdsINfQTDEMB: TFloatField
      DisplayLabel = 'Qtde Itens p/ Emb'
      FieldName = 'QTDEMB'
      Origin = '"NOTAFISCAL_ITEM"."QTDEMB"'
    end
    object cdsINfQTDEMBREC: TFloatField
      DisplayLabel = 'Qtde de Emb'
      FieldName = 'QTDEMBREC'
      Origin = '"NOTAFISCAL_ITEM"."QTDEMBREC"'
    end
    object cdsINfVLREMBNF: TFloatField
      DisplayLabel = 'Valor da Emb'
      FieldName = 'VLREMBNF'
      Origin = '"NOTAFISCAL_ITEM"."VLREMBNF"'
    end
    object cdsINfVLBRUREAL: TFloatField
      FieldName = 'VLBRUREAL'
      Origin = '"NOTAFISCAL_ITEM"."VLBRUREAL"'
    end
    object cdsINfPDESC_R: TFloatField
      FieldName = 'PDESC_R'
      Origin = '"NOTAFISCAL_ITEM"."PDESC_R"'
    end
    object cdsINfVLREMBNFR: TFloatField
      FieldName = 'VLREMBNFR'
      Origin = '"NOTAFISCAL_ITEM"."VLREMBNFR"'
    end
    object cdsINfVLUN_B_NFE: TFloatField
      FieldName = 'VLUN_B_NFE'
      Origin = '"NOTAFISCAL_ITEM"."VLUN_B_NFE"'
    end
    object cdsINfVLISENTO: TFloatField
      DisplayLabel = 'Isento $'
      FieldName = 'VLISENTO'
      Origin = '"NOTAFISCAL_ITEM"."VLISENTO"'
    end
    object cdsINfVLOUTRAS: TFloatField
      DisplayLabel = 'Outras $'
      FieldName = 'VLOUTRAS'
      Origin = '"NOTAFISCAL_ITEM"."VLOUTRAS"'
    end
    object cdsINfVLN_TRIB: TFloatField
      DisplayLabel = 'N'#227'o Trib $'
      FieldName = 'VLN_TRIB'
      Origin = '"NOTAFISCAL_ITEM"."VLN_TRIB"'
    end
    object cdsINfCAMP_ENTEST: TStringField
      DisplayLabel = 'Ent Estoque'
      FieldName = 'CAMP_ENTEST'
      Origin = '"NOTAFISCAL_ITEM"."CAMP_ENTEST"'
      FixedChar = True
      Size = 1
    end
    object cdsINfSEQ_DEVOLUCAO: TIntegerField
      FieldName = 'SEQ_DEVOLUCAO'
      Origin = '"NOTAFISCAL_ITEM"."SEQ_DEVOLUCAO"'
    end
    object cdsINfMNF: TStringField
      FieldName = 'MNF'
      Origin = '"NOTAFISCAL_ITEM"."MNF"'
      FixedChar = True
      Size = 1
    end
    object cdsINfALTERA_ESTOQUE_CFOP: TStringField
      DisplayLabel = 'Alterou Estoque'
      FieldName = 'ALTERA_ESTOQUE_CFOP'
      Origin = '"NOTAFISCAL_ITEM"."ALTERA_ESTOQUE_CFOP"'
      FixedChar = True
      Size = 1
    end
    object cdsINfNPED: TIntegerField
      DisplayLabel = 'N'#186' Venda'
      FieldName = 'NPED'
      Origin = '"NOTAFISCAL_ITEM"."NPED"'
    end
    object cdsINfTIPO_PED: TStringField
      DisplayLabel = 'Tipo Venda'
      FieldName = 'TIPO_PED'
      Origin = '"NOTAFISCAL_ITEM"."TIPO_PED"'
      FixedChar = True
      Size = 3
    end
    object cdsINfTIPO_ITEM: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO_ITEM'
      Origin = '"NOTAFISCAL_ITEM"."TIPO_ITEM"'
      FixedChar = True
      Size = 1
    end
    object cdsINfNITEM_PED: TIntegerField
      DisplayLabel = 'N'#186' Item Venda'
      FieldName = 'NITEM_PED'
      Origin = '"NOTAFISCAL_ITEM"."NITEM_PED"'
    end
    object cdsINfCOD_EMPRESA: TIntegerField
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Origin = '"NOTAFISCAL_ITEM"."COD_EMPRESA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsINfBASE_IPI: TFloatField
      DisplayLabel = 'Base IPI'
      FieldName = 'BASE_IPI'
      Origin = '"NOTAFISCAL_ITEM"."BASE_IPI"'
    end
    object cdsINfPERC_RED_IPI: TFloatField
      DisplayLabel = '% Red IPI'
      FieldName = 'PERC_RED_IPI'
      Origin = '"NOTAFISCAL_ITEM"."PERC_RED_IPI"'
    end
    object cdsINfPERMITIR_DESCONTO: TStringField
      DisplayLabel = 'Permitir Desconto'
      FieldName = 'PERMITIR_DESCONTO'
      Origin = '"NOTAFISCAL_ITEM"."PERMITIR_DESCONTO"'
      FixedChar = True
      Size = 1
    end
    object cdsINfALIQ_ICM_SIMPLES: TFloatField
      DisplayLabel = '%ICMS Simples'
      FieldName = 'ALIQ_ICM_SIMPLES'
      Origin = '"NOTAFISCAL_ITEM"."ALIQ_ICM_SIMPLES"'
      Visible = False
    end
    object cdsINfBASE_ICM_SIMPLES: TFloatField
      DisplayLabel = 'Base ICM Simples'
      FieldName = 'BASE_ICM_SIMPLES'
      Origin = '"NOTAFISCAL_ITEM"."BASE_ICM_SIMPLES"'
      Visible = False
    end
    object cdsINfVALOR_ICM_SIMPLES: TFloatField
      DisplayLabel = 'Valor ICM Simples'
      FieldName = 'VALOR_ICM_SIMPLES'
      Origin = '"NOTAFISCAL_ITEM"."VALOR_ICM_SIMPLES"'
      Visible = False
    end
    object cdsINfALIQ_ISS: TFloatField
      DisplayLabel = 'Aliq ISS'
      FieldName = 'ALIQ_ISS'
      Origin = '"NOTAFISCAL_ITEM"."ALIQ_ISS"'
    end
    object cdsINfBASE_ISS: TFloatField
      DisplayLabel = 'Base ISS'
      FieldName = 'BASE_ISS'
      Origin = '"NOTAFISCAL_ITEM"."BASE_ISS"'
    end
    object cdsINfVALOR_ISS: TFloatField
      DisplayLabel = 'Valor ISS'
      FieldName = 'VALOR_ISS'
      Origin = '"NOTAFISCAL_ITEM"."VALOR_ISS"'
    end
    object cdsINfTERMINAL: TIntegerField
      DisplayLabel = 'Terminal ECF'
      FieldName = 'TERMINAL'
      Origin = '"NOTAFISCAL_ITEM"."TERMINAL"'
    end
    object cdsINfNCUPOM: TIntegerField
      DisplayLabel = 'N'#186' Cupom'
      FieldName = 'NCUPOM'
      Origin = '"NOTAFISCAL_ITEM"."NCUPOM"'
    end
    object cdsINfNSERIEECF: TStringField
      DisplayLabel = 'N'#186' S'#233'rie ECF'
      FieldName = 'NSERIEECF'
      Origin = '"NOTAFISCAL_ITEM"."NSERIEECF"'
    end
    object cdsINfALTERA_CUSTO_CFOP: TStringField
      DisplayLabel = 'Altera Custo'
      FieldName = 'ALTERA_CUSTO_CFOP'
      Origin = '"NOTAFISCAL_ITEM"."ALTERA_CUSTO_CFOP"'
      FixedChar = True
      Size = 1
    end
    object cdsINfDESCRICAO_ITEM_OUTRAS: TMemoField
      FieldName = 'DESCRICAO_ITEM_OUTRAS'
      Origin = '"NOTAFISCAL_ITEM"."DESCRICAO_ITEM_OUTRAS"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
    object cdsINfECF: TStringField
      DisplayLabel = 'ECF?'
      FieldName = 'ECF'
      Origin = '"NOTAFISCAL_ITEM"."ECF"'
      FixedChar = True
      Size = 1
    end
    object cdsINfPESO_B: TFloatField
      DisplayLabel = 'Peso Bruto'
      FieldName = 'PESO_B'
      Origin = '"NOTAFISCAL_ITEM"."PESO_B"'
    end
    object cdsINfPESO_L: TFloatField
      DisplayLabel = 'Peso Liquido'
      FieldName = 'PESO_L'
      Origin = '"NOTAFISCAL_ITEM"."PESO_L"'
    end
    object cdsINfDATA_CUPOM: TDateTimeField
      DisplayLabel = 'Data Cupom'
      FieldName = 'DATA_CUPOM'
      Origin = '"NOTAFISCAL_ITEM"."DATA_CUPOM"'
    end
    object cdsINfVALOR_DIF: TFloatField
      DisplayLabel = 'Dif ICMS/Compl ST'
      FieldName = 'VALOR_DIF'
      Origin = '"NOTAFISCAL_ITEM"."VALOR_DIF"'
    end
    object cdsINfINDTOT: TSmallintField
      FieldName = 'INDTOT'
      Origin = '"NOTAFISCAL_ITEM"."INDTOT"'
    end
    object cdsINfMODBCST: TIntegerField
      FieldName = 'MODBCST'
      Origin = '"NOTAFISCAL_ITEM"."MODBCST"'
    end
    object cdsINfMODBC: TIntegerField
      FieldName = 'MODBC'
      Origin = '"NOTAFISCAL_ITEM"."MODBC"'
    end
    object cdsINfVALOR_ICM_STDES: TFloatField
      FieldName = 'VALOR_ICM_STDES'
      Origin = '"NOTAFISCAL_ITEM"."VALOR_ICM_STDES"'
    end
    object cdsINfVL_MULTP: TFloatField
      FieldName = 'VL_MULTP'
      Origin = '"NOTAFISCAL_ITEM"."VL_MULTP"'
    end
    object cdsINfPR_CUSC_PROD: TFloatField
      FieldName = 'PR_CUSC_PROD'
      Origin = '"NOTAFISCAL_ITEM"."PR_CUSC_PROD"'
    end
    object cdsINfPREC_CUS_R: TFloatField
      FieldName = 'PREC_CUS_R'
      Origin = '"NOTAFISCAL_ITEM"."PREC_CUS_R"'
    end
    object cdsINfCST_PIS: TStringField
      DisplayLabel = 'CST PIS'
      FieldName = 'CST_PIS'
      Origin = '"NOTAFISCAL_ITEM"."CST_PIS"'
      FixedChar = True
      Size = 2
    end
    object cdsINfALIQ_PIS: TFloatField
      DisplayLabel = 'Aliq PIS'
      FieldName = 'ALIQ_PIS'
      Origin = '"NOTAFISCAL_ITEM"."ALIQ_PIS"'
    end
    object cdsINfVALOR_PIS: TFloatField
      DisplayLabel = 'Valor PIS'
      FieldName = 'VALOR_PIS'
      Origin = '"NOTAFISCAL_ITEM"."VALOR_PIS"'
    end
    object cdsINfCST_COFINS: TStringField
      DisplayLabel = 'CST COFINS'
      FieldName = 'CST_COFINS'
      Origin = '"NOTAFISCAL_ITEM"."CST_COFINS"'
      FixedChar = True
      Size = 2
    end
    object cdsINfALIQ_COFINS: TFloatField
      DisplayLabel = 'Aliq COFINS'
      FieldName = 'ALIQ_COFINS'
      Origin = '"NOTAFISCAL_ITEM"."ALIQ_COFINS"'
    end
    object cdsINfVALOR_COFINS: TFloatField
      DisplayLabel = 'Valor COFINS'
      FieldName = 'VALOR_COFINS'
      Origin = '"NOTAFISCAL_ITEM"."VALOR_COFINS"'
    end
    object cdsINfNUM_FAB_FORNECEDOR: TStringField
      DisplayLabel = 'Num Fab Fornecedor'
      FieldName = 'NUM_FAB_FORNECEDOR'
      Origin = '"NOTAFISCAL_ITEM"."NUM_FAB_FORNECEDOR"'
    end
    object cdsINfCONSUMO: TStringField
      DisplayLabel = 'Consumo'
      FieldName = 'CONSUMO'
      Origin = '"NOTAFISCAL_ITEM"."CONSUMO"'
      FixedChar = True
      Size = 1
    end
    object cdsINfPISCOFINS: TFloatField
      FieldName = 'PISCOFINS'
      Origin = '"NOTAFISCAL_ITEM"."PISCOFINS"'
    end
    object cdsINfCST_IPI: TStringField
      DisplayLabel = 'CST IPI'
      FieldName = 'CST_IPI'
      Origin = '"NOTAFISCAL_ITEM"."CST_IPI"'
      FixedChar = True
      Size = 2
    end
    object cdsINfBASE_ICMSUB_ANT: TFloatField
      DisplayLabel = 'Base ICM Ant'
      FieldName = 'BASE_ICMSUB_ANT'
      Origin = '"NOTAFISCAL_ITEM"."BASE_ICMSUB_ANT"'
    end
    object cdsINfVALOR_ICMSUB_ANT: TFloatField
      DisplayLabel = 'Valor ICM Ant'
      FieldName = 'VALOR_ICMSUB_ANT'
      Origin = '"NOTAFISCAL_ITEM"."VALOR_ICMSUB_ANT"'
    end
    object cdsINfRED_LUCRO: TStringField
      FieldName = 'RED_LUCRO'
      Origin = '"NOTAFISCAL_ITEM"."RED_LUCRO"'
      FixedChar = True
      Size = 1
    end
    object cdsINfATIVO: TIntegerField
      FieldName = 'ATIVO'
      Origin = '"NOTAFISCAL_ITEM"."ATIVO"'
    end
    object cdsINfIND_MOV: TSmallintField
      FieldName = 'IND_MOV'
      Origin = '"NOTAFISCAL_ITEM"."IND_MOV"'
    end
  end
  object dsINFDetalhe: TDataSource
    AutoEdit = False
    DataSet = cdsINf
    Left = 661
    Top = 141
  end
  object qrNf: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransClientes
    SQL.Strings = (
      'select *  from NOTAFISCAL where 1=0')
    Left = 606
    Top = 55
  end
  object dspNf: TDataSetProvider
    DataSet = qrNf
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 606
    Top = 98
  end
  object dsLinkMD: TDataSource
    AutoEdit = False
    DataSet = qrNf
    Left = 657
    Top = 54
  end
  object cdsNf: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspNf'
    BeforeOpen = CdsClientesBeforeOpen
    Left = 607
    Top = 143
    object cdsNfCOD_NF: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_NF'
      Origin = '"NOTAFISCAL"."COD_NF"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsNfCOD_EMPRESA: TIntegerField
      Tag = 1
      FieldName = 'COD_EMPRESA'
      Origin = '"NOTAFISCAL"."COD_EMPRESA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsNfNATUREZA_NF: TStringField
      Tag = 2
      DisplayLabel = 'E/S'
      FieldName = 'NATUREZA_NF'
      Origin = '"NOTAFISCAL"."NATUREZA_NF"'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsNfTIPO_NF: TStringField
      Tag = 2
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO_NF'
      Origin = '"NOTAFISCAL"."TIPO_NF"'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsNfNUM_NF: TIntegerField
      Tag = 2
      DisplayLabel = 'N'#186' NF'
      FieldName = 'NUM_NF'
      Origin = '"NOTAFISCAL"."NUM_NF"'
      Required = True
    end
    object cdsNfSERIE: TStringField
      DisplayLabel = 'S'#233'rie'
      FieldName = 'SERIE'
      Origin = '"NOTAFISCAL"."SERIE"'
      Size = 5
    end
    object cdsNfCODIGO_NOP: TFloatField
      Tag = 2
      DisplayLabel = 'CFOP'
      FieldName = 'CODIGO_NOP'
      Origin = '"NOTAFISCAL"."CODIGO_NOP"'
      DisplayFormat = '##0.'
    end
    object cdsNfDESC_NATOP: TStringField
      DisplayLabel = 'Descri'#231#227'o CFOP'
      DisplayWidth = 128
      FieldName = 'DESC_NATOP'
      Origin = '"NOTAFISCAL"."DESC_NATOP"'
      Size = 128
    end
    object cdsNfCOD_CLIENTE: TIntegerField
      DisplayLabel = 'C'#243'd Cliente'
      FieldName = 'COD_CLIENTE'
      Origin = '"NOTAFISCAL"."COD_CLIENTE"'
      Required = True
    end
    object cdsNfCOD_COND_PAG: TIntegerField
      Tag = 2
      DisplayLabel = 'Cod Cond Pag'
      FieldName = 'COD_COND_PAG'
      Origin = '"NOTAFISCAL"."COD_COND_PAG"'
    end
    object cdsNfCOD_VENDEDOR: TIntegerField
      DisplayLabel = 'Cod Usuario'
      FieldName = 'COD_VENDEDOR'
      Origin = '"NOTAFISCAL"."COD_VENDEDOR"'
      Required = True
    end
    object cdsNfDATA_CONTABIL: TDateTimeField
      DisplayLabel = 'Data Cont'#225'bil'
      FieldName = 'DATA_CONTABIL'
      Origin = '"NOTAFISCAL"."DATA_CONTABIL"'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsNfDATA_ENT_SAIDA: TDateTimeField
      DisplayLabel = 'Data Entrada/Sa'#237'da'
      FieldName = 'DATA_ENT_SAIDA'
      Origin = '"NOTAFISCAL"."DATA_ENT_SAIDA"'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsNfDATA_LANC: TDateTimeField
      Tag = 2
      DisplayLabel = 'Data Lan'#231'amento'
      FieldName = 'DATA_LANC'
      Origin = '"NOTAFISCAL"."DATA_LANC"'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsNfVALOR_TOTAL: TFloatField
      Tag = 2
      DisplayLabel = 'Valor Total NF'
      FieldName = 'VALOR_TOTAL'
      Origin = '"NOTAFISCAL"."VALOR_TOTAL"'
    end
    object cdsNfVALOR_PROD: TFloatField
      DisplayLabel = 'Valor Produtos'
      FieldName = 'VALOR_PROD'
      Origin = '"NOTAFISCAL"."VALOR_PROD"'
    end
    object cdsNfVALOR_SERV: TFloatField
      DisplayLabel = 'Valor Servi'#231'os'
      FieldName = 'VALOR_SERV'
      Origin = '"NOTAFISCAL"."VALOR_SERV"'
    end
    object cdsNfALIQ_ICM: TFloatField
      DisplayLabel = '% ICMS'
      FieldName = 'ALIQ_ICM'
      Origin = '"NOTAFISCAL"."ALIQ_ICM"'
    end
    object cdsNfBASE_ICM: TFloatField
      DisplayLabel = 'Base ICMS'
      FieldName = 'BASE_ICM'
      Origin = '"NOTAFISCAL"."BASE_ICM"'
    end
    object cdsNfVALOR_ICM: TFloatField
      DisplayLabel = 'Valor ICMS'
      FieldName = 'VALOR_ICM'
      Origin = '"NOTAFISCAL"."VALOR_ICM"'
    end
    object cdsNfVALOR_DESC: TFloatField
      DisplayLabel = 'Desconto'
      FieldName = 'VALOR_DESC'
      Origin = '"NOTAFISCAL"."VALOR_DESC"'
    end
    object cdsNfVALOR_DESC_P: TFloatField
      DisplayLabel = 'Desc Produtos'
      FieldName = 'VALOR_DESC_P'
      Origin = '"NOTAFISCAL"."VALOR_DESC_P"'
    end
    object cdsNfVALOR_DESC_S: TFloatField
      DisplayLabel = 'Desc Servi'#231'os'
      FieldName = 'VALOR_DESC_S'
      Origin = '"NOTAFISCAL"."VALOR_DESC_S"'
    end
    object cdsNfALIQ_IRRF: TFloatField
      DisplayLabel = 'IRRF'
      FieldName = 'ALIQ_IRRF'
      Origin = '"NOTAFISCAL"."ALIQ_IRRF"'
    end
    object cdsNfALIQ_ISS: TFloatField
      DisplayLabel = '% ISS'
      FieldName = 'ALIQ_ISS'
      Origin = '"NOTAFISCAL"."ALIQ_ISS"'
    end
    object cdsNfBASE_ISS: TFloatField
      DisplayLabel = 'Base ISS'
      FieldName = 'BASE_ISS'
      Origin = '"NOTAFISCAL"."BASE_ISS"'
    end
    object cdsNfVALOR_ISS: TFloatField
      DisplayLabel = 'Valor ISS'
      FieldName = 'VALOR_ISS'
      Origin = '"NOTAFISCAL"."VALOR_ISS"'
    end
    object cdsNfBASE_ICMSUB: TFloatField
      DisplayLabel = 'Base ICMS Sub'
      FieldName = 'BASE_ICMSUB'
      Origin = '"NOTAFISCAL"."BASE_ICMSUB"'
    end
    object cdsNfVALOR_ICMSUB: TFloatField
      DisplayLabel = 'Valor ICMS Sub'
      FieldName = 'VALOR_ICMSUB'
      Origin = '"NOTAFISCAL"."VALOR_ICMSUB"'
    end
    object cdsNfVALOR_FRETE: TFloatField
      DisplayLabel = 'Valor Frete'
      FieldName = 'VALOR_FRETE'
      Origin = '"NOTAFISCAL"."VALOR_FRETE"'
    end
    object cdsNfVALOR_SEGURO: TFloatField
      DisplayLabel = 'Valor Seguro'
      FieldName = 'VALOR_SEGURO'
      Origin = '"NOTAFISCAL"."VALOR_SEGURO"'
    end
    object cdsNfVALOR_OUT_DESP: TFloatField
      DisplayLabel = 'Outras Desp'
      FieldName = 'VALOR_OUT_DESP'
      Origin = '"NOTAFISCAL"."VALOR_OUT_DESP"'
    end
    object cdsNfVALOR_DESP_PF: TFloatField
      DisplayLabel = 'Desp PF'
      FieldName = 'VALOR_DESP_PF'
      Origin = '"NOTAFISCAL"."VALOR_DESP_PF"'
    end
    object cdsNfBASE_IPI: TFloatField
      DisplayLabel = 'Base IPI'
      FieldName = 'BASE_IPI'
      Origin = '"NOTAFISCAL"."BASE_IPI"'
    end
    object cdsNfVALOR_IPI: TFloatField
      DisplayLabel = 'Valor IPI'
      FieldName = 'VALOR_IPI'
      Origin = '"NOTAFISCAL"."VALOR_IPI"'
    end
    object cdsNfVALOR_ACRES_FIN: TFloatField
      DisplayLabel = 'Acresc. Finan.'
      FieldName = 'VALOR_ACRES_FIN'
      Origin = '"NOTAFISCAL"."VALOR_ACRES_FIN"'
    end
    object cdsNfCODIGO_TR: TIntegerField
      Tag = 1
      DisplayLabel = 'Transportador'
      FieldName = 'CODIGO_TR'
      Origin = '"NOTAFISCAL"."CODIGO_TR"'
    end
    object cdsNfMODELO_NF: TStringField
      DisplayLabel = 'Modelo'
      FieldName = 'MODELO_NF'
      Origin = '"NOTAFISCAL"."MODELO_NF"'
      Size = 3
    end
    object cdsNfSTATUS: TStringField
      DisplayLabel = 'Status NF'
      FieldName = 'STATUS'
      Origin = '"NOTAFISCAL"."STATUS"'
      Size = 10
    end
    object cdsNfCRT: TStringField
      FieldName = 'CRT'
      Origin = '"NOTAFISCAL"."CRT"'
      FixedChar = True
      Size = 1
    end
    object cdsNfOBS: TMemoField
      Tag = 1
      DisplayLabel = 'Observa'#231#227'o'
      FieldName = 'OBS'
      Origin = '"NOTAFISCAL"."OBS"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
    object cdsNfFRETE_BASE_IPI: TStringField
      DisplayLabel = 'Frente Base IPI'
      FieldName = 'FRETE_BASE_IPI'
      Origin = '"NOTAFISCAL"."FRETE_BASE_IPI"'
      FixedChar = True
      Size = 1
    end
    object cdsNfFRETE_F_NFE: TStringField
      DisplayLabel = 'Frete Fora NF'
      FieldName = 'FRETE_F_NFE'
      Origin = '"NOTAFISCAL"."FRETE_F_NFE"'
      FixedChar = True
      Size = 1
    end
    object cdsNfFRETE_BASE_ICM: TStringField
      DisplayLabel = 'Frete Base ICMS'
      FieldName = 'FRETE_BASE_ICM'
      Origin = '"NOTAFISCAL"."FRETE_BASE_ICM"'
      FixedChar = True
      Size = 1
    end
    object cdsNfFRETECONTA_TR: TStringField
      DisplayLabel = 'Frete p/ Conta'
      FieldName = 'FRETECONTA_TR'
      Origin = '"NOTAFISCAL"."FRETECONTA_TR"'
      FixedChar = True
      Size = 1
    end
    object cdsNfPLACA_TR: TStringField
      DisplayLabel = 'Placa Transp'
      FieldName = 'PLACA_TR'
      Origin = '"NOTAFISCAL"."PLACA_TR"'
      Size = 7
    end
    object cdsNfUF_PLACA_TR: TStringField
      DisplayLabel = 'UF Placa'
      FieldName = 'UF_PLACA_TR'
      Origin = '"NOTAFISCAL"."UF_PLACA_TR"'
      FixedChar = True
      Size = 2
    end
    object cdsNfQTDE_VOLUMES_TR: TIntegerField
      DisplayLabel = 'Volumes'
      FieldName = 'QTDE_VOLUMES_TR'
      Origin = '"NOTAFISCAL"."QTDE_VOLUMES_TR"'
    end
    object cdsNfESPECIE_TR: TStringField
      DisplayLabel = 'Esp'#233'cie'
      FieldName = 'ESPECIE_TR'
      Origin = '"NOTAFISCAL"."ESPECIE_TR"'
      Size = 15
    end
    object cdsNfMARCA_TR: TStringField
      DisplayLabel = 'Marca'
      FieldName = 'MARCA_TR'
      Origin = '"NOTAFISCAL"."MARCA_TR"'
      Size = 15
    end
    object cdsNfNUMERO_TR: TStringField
      DisplayLabel = 'Numero'
      FieldName = 'NUMERO_TR'
      Origin = '"NOTAFISCAL"."NUMERO_TR"'
      Size = 15
    end
    object cdsNfRESULTADO_ENVIO: TStringField
      DisplayLabel = 'Resultado Envio NF-e'
      FieldName = 'RESULTADO_ENVIO'
      Origin = '"NOTAFISCAL"."RESULTADO_ENVIO"'
      Size = 30
    end
    object cdsNfDATA_AUTORIZACAO: TDateTimeField
      DisplayLabel = 'Data Autoriza'#231#227'o NF-e'
      FieldName = 'DATA_AUTORIZACAO'
      Origin = '"NOTAFISCAL"."DATA_AUTORIZACAO"'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsNfDATAHORA_ENVIO: TDateTimeField
      DisplayLabel = 'Data/Hora Envio NF-e'
      FieldName = 'DATAHORA_ENVIO'
      Origin = '"NOTAFISCAL"."DATAHORA_ENVIO"'
      EditMask = '!99/99/0000 90:00:00;1;_'
    end
    object cdsNfHORA_ENVIO: TStringField
      DisplayLabel = 'Hora Envio NF-e'
      FieldName = 'HORA_ENVIO'
      Origin = '"NOTAFISCAL"."HORA_ENVIO"'
      EditMask = '!90:00:00;1;_'
      Size = 8
    end
    object cdsNfSITUACAO_NFE: TStringField
      DisplayLabel = 'Situa'#231#227'o NF-e'
      FieldName = 'SITUACAO_NFE'
      Origin = '"NOTAFISCAL"."SITUACAO_NFE"'
      Size = 40
    end
    object cdsNfDIGEST: TStringField
      DisplayLabel = 'Digest NF-e'
      FieldName = 'DIGEST'
      Origin = '"NOTAFISCAL"."DIGEST"'
      Size = 40
    end
    object cdsNfPROTOCOLO: TStringField
      DisplayLabel = 'Protocolo NF-e'
      FieldName = 'PROTOCOLO'
      Origin = '"NOTAFISCAL"."PROTOCOLO"'
      Size = 40
    end
    object cdsNfCODIGOERRO: TStringField
      DisplayLabel = 'Cod Erro NF-e'
      FieldName = 'CODIGOERRO'
      Origin = '"NOTAFISCAL"."CODIGOERRO"'
      Size = 10
    end
    object cdsNfDESCRICAOERRO: TStringField
      DisplayLabel = 'Descri'#231#227'o Erro NF-e'
      FieldName = 'DESCRICAOERRO'
      Origin = '"NOTAFISCAL"."DESCRICAOERRO"'
      Size = 50
    end
    object cdsNfTEMPORESPOSTA: TSmallintField
      DisplayLabel = 'Tempo Resposta NF-e'
      FieldName = 'TEMPORESPOSTA'
      Origin = '"NOTAFISCAL"."TEMPORESPOSTA"'
    end
    object cdsNfTIPONFE: TStringField
      DisplayLabel = 'Tipo NF-e'
      FieldName = 'TIPONFE'
      Origin = '"NOTAFISCAL"."TIPONFE"'
      Size = 40
    end
    object cdsNfDANFEIMPRESSO: TStringField
      DisplayLabel = 'Danfe Impresso NF-e'
      FieldName = 'DANFEIMPRESSO'
      Origin = '"NOTAFISCAL"."DANFEIMPRESSO"'
      Size = 5
    end
    object cdsNfCHAVE_NFE: TStringField
      DisplayLabel = 'Chave NF-e'
      FieldName = 'CHAVE_NFE'
      Origin = '"NOTAFISCAL"."CHAVE_NFE"'
      Size = 60
    end
    object cdsNfSEL_NFE: TIntegerField
      Tag = 1
      FieldName = 'SEL_NFE'
      Origin = '"NOTAFISCAL"."SEL_NFE"'
    end
    object cdsNfN_FORM_SEGURANCA: TIntegerField
      DisplayLabel = 'N'#186' Form Seg'
      FieldName = 'N_FORM_SEGURANCA'
      Origin = '"NOTAFISCAL"."N_FORM_SEGURANCA"'
    end
    object cdsNfNUM_NF_VNDANT: TIntegerField
      DisplayLabel = 'N'#186' Nf Ant'
      FieldName = 'NUM_NF_VNDANT'
      Origin = '"NOTAFISCAL"."NUM_NF_VNDANT"'
    end
    object cdsNfSUB_SERIEANT: TIntegerField
      DisplayLabel = 'Sub S'#233'rie Ant'
      FieldName = 'SUB_SERIEANT'
      Origin = '"NOTAFISCAL"."SUB_SERIEANT"'
    end
    object cdsNfJUST_CANCELAMENTO: TStringField
      DisplayLabel = 'Justificativa Cancelamento NF-e'
      FieldName = 'JUST_CANCELAMENTO'
      Origin = '"NOTAFISCAL"."JUST_CANCELAMENTO"'
      Size = 60
    end
    object cdsNfCOM_PROD: TStringField
      DisplayLabel = 'Com Produtos'
      FieldName = 'COM_PROD'
      Origin = '"NOTAFISCAL"."COM_PROD"'
      Size = 1
    end
    object cdsNfCOM_SERV: TStringField
      DisplayLabel = 'Com Servi'#231'os'
      FieldName = 'COM_SERV'
      Origin = '"NOTAFISCAL"."COM_SERV"'
      Size = 1
    end
    object cdsNfINUTILNFANT: TStringField
      DisplayLabel = 'Inutilizar NF-e Ant.'
      FieldName = 'INUTILNFANT'
      Origin = '"NOTAFISCAL"."INUTILNFANT"'
      Size = 1
    end
    object cdsNfEMISSAO_PROPRIA: TStringField
      DisplayLabel = 'Emiss'#227'o Pr'#243'pria'
      FieldName = 'EMISSAO_PROPRIA'
      Origin = '"NOTAFISCAL"."EMISSAO_PROPRIA"'
      FixedChar = True
      Size = 1
    end
    object cdsNfNUM_PED: TIntegerField
      DisplayLabel = 'N'#186' Pedido'
      FieldName = 'NUM_PED'
      Origin = '"NOTAFISCAL"."NUM_PED"'
    end
    object cdsNfANTEC_TRIB: TStringField
      DisplayLabel = 'Antecipa'#231#227'o Tribut'#225'ria'
      FieldName = 'ANTEC_TRIB'
      Origin = '"NOTAFISCAL"."ANTEC_TRIB"'
      FixedChar = True
      Size = 1
    end
    object cdsNfDEVOLUCAO: TStringField
      DisplayLabel = 'Nf de Devolu'#231#227'o'
      FieldName = 'DEVOLUCAO'
      Origin = '"NOTAFISCAL"."DEVOLUCAO"'
      FixedChar = True
      Size = 3
    end
    object cdsNfBENEF_FISCAL: TStringField
      DisplayLabel = 'Benef Fiscal'
      FieldName = 'BENEF_FISCAL'
      Origin = '"NOTAFISCAL"."BENEF_FISCAL"'
      FixedChar = True
      Size = 1
    end
    object cdsNfCONF_ENT: TStringField
      DisplayLabel = 'Conf Ent'
      FieldName = 'CONF_ENT'
      Origin = '"NOTAFISCAL"."CONF_ENT"'
      FixedChar = True
      Size = 1
    end
    object cdsNfTP_NF: TStringField
      Tag = 1
      DisplayLabel = 'Tp NF'
      FieldName = 'TP_NF'
      Origin = '"NOTAFISCAL"."TP_NF"'
      FixedChar = True
      Size = 1
    end
    object cdsNfDA: TStringField
      Tag = 1
      FieldName = 'DA'
      Origin = '"NOTAFISCAL"."DA"'
      FixedChar = True
      Size = 1
    end
    object cdsNfMNF: TStringField
      Tag = 1
      FieldName = 'MNF'
      Origin = '"NOTAFISCAL"."MNF"'
      FixedChar = True
      Size = 1
    end
    object cdsNfNUM_NFEM: TIntegerField
      DisplayLabel = 'N'#186' Nf Emiss'#227'o Pr'#243'pria'
      FieldName = 'NUM_NFEM'
      Origin = '"NOTAFISCAL"."NUM_NFEM"'
    end
    object cdsNfATIVO: TIntegerField
      FieldName = 'ATIVO'
      Origin = '"NOTAFISCAL"."ATIVO"'
    end
    object cdsNfCOD_USUARIO: TIntegerField
      DisplayLabel = 'Cod Usu'#225'rio'
      FieldName = 'COD_USUARIO'
      Origin = '"NOTAFISCAL"."COD_USUARIO"'
    end
    object cdsNfNUM_NF_EMT: TIntegerField
      DisplayLabel = 'N'#186' NF Emt'
      FieldName = 'NUM_NF_EMT'
      Origin = '"NOTAFISCAL"."NUM_NF_EMT"'
    end
    object cdsNfSERIE_EMT: TStringField
      DisplayLabel = 'S'#233'rie Emt'
      FieldName = 'SERIE_EMT'
      Origin = '"NOTAFISCAL"."SERIE_EMT"'
      Size = 5
    end
    object cdsNfTIPO_DESCONTO: TStringField
      DisplayLabel = 'Desconto Item/Rateio'
      FieldName = 'TIPO_DESCONTO'
      Origin = '"NOTAFISCAL"."TIPO_DESCONTO"'
      Size = 1
    end
    object cdsNfPESO_B: TFloatField
      DisplayLabel = 'Peso Bruto'
      FieldName = 'PESO_B'
      Origin = '"NOTAFISCAL"."PESO_B"'
    end
    object cdsNfPESO_L: TFloatField
      DisplayLabel = 'Peso L'#237'quido'
      FieldName = 'PESO_L'
      Origin = '"NOTAFISCAL"."PESO_L"'
    end
    object cdsNfVALOR_PIS: TFloatField
      DisplayLabel = 'Valor PIS'
      FieldName = 'VALOR_PIS'
      Origin = '"NOTAFISCAL"."VALOR_PIS"'
    end
    object cdsNfVALOR_PIS_ST: TFloatField
      DisplayLabel = 'Valor PIS ST'
      FieldName = 'VALOR_PIS_ST'
      Origin = '"NOTAFISCAL"."VALOR_PIS_ST"'
    end
    object cdsNfVALOR_COFINS: TFloatField
      DisplayLabel = 'Valor COFINS'
      FieldName = 'VALOR_COFINS'
      Origin = '"NOTAFISCAL"."VALOR_COFINS"'
    end
    object cdsNfVALOR_COFINS_ST: TFloatField
      DisplayLabel = 'Valor COFINS ST'
      FieldName = 'VALOR_COFINS_ST'
      Origin = '"NOTAFISCAL"."VALOR_COFINS_ST"'
    end
    object cdsNfSUBSERIE: TStringField
      DisplayLabel = 'SubS'#233'rie'
      FieldName = 'SUBSERIE'
      Origin = '"NOTAFISCAL"."SUBSERIE"'
      Size = 5
    end
    object cdsNfEXTEMPORANEO: TStringField
      DisplayLabel = 'Extemporaneo'
      FieldName = 'EXTEMPORANEO'
      Origin = '"NOTAFISCAL"."EXTEMPORANEO"'
      FixedChar = True
      Size = 1
    end
    object cdsNfDADOS_INTERESSE_FISCO: TMemoField
      DisplayLabel = 'Dados Adicionais (Apenas de Interesse ao Fisco)'
      FieldName = 'DADOS_INTERESSE_FISCO'
      Origin = '"NOTAFISCAL"."DADOS_INTERESSE_FISCO"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
    object cdsNfDADOS_LANCAMENTO_FISCAL: TMemoField
      DisplayLabel = 'Lan'#231'amento Fiscal'
      FieldName = 'DADOS_LANCAMENTO_FISCAL'
      Origin = '"NOTAFISCAL"."DADOS_LANCAMENTO_FISCAL"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
    object cdsNfTIPO_EMISSAO: TStringField
      DisplayLabel = 'Tipo Emiss'#227'o NF-e'
      FieldName = 'TIPO_EMISSAO'
      Origin = '"NOTAFISCAL"."TIPO_EMISSAO"'
      FixedChar = True
      Size = 1
    end
    object cdsNfNFE_CMSG: TSmallintField
      DisplayLabel = 'C'#243'd Msg'
      FieldName = 'NFE_CMSG'
      Origin = '"NOTAFISCAL"."NFE_CMSG"'
    end
    object cdsNfNFE_XMSG: TStringField
      DisplayLabel = 'Mensag. SEFAZ'
      FieldName = 'NFE_XMSG'
      Origin = '"NOTAFISCAL"."NFE_XMSG"'
      Size = 200
    end
    object cdsNfCOD_NF_REF: TIntegerField
      DisplayLabel = 'Cod NF Ref'
      FieldName = 'COD_NF_REF'
      Origin = '"NOTAFISCAL"."COD_NF_REF"'
    end
    object cdsNfNUM_NF_COMPL: TIntegerField
      DisplayLabel = 'N'#186' NF Ref'
      FieldName = 'NUM_NF_COMPL'
      Origin = '"NOTAFISCAL"."NUM_NF_COMPL"'
    end
    object cdsNfSERIE_COMPL: TStringField
      DisplayLabel = 'S'#233'rie NF Ref'
      FieldName = 'SERIE_COMPL'
      Origin = '"NOTAFISCAL"."SERIE_COMPL"'
      Size = 5
    end
    object cdsNfHORA_ENT_SAIDA: TTimeField
      DisplayLabel = 'Hora Entrada/Sa'#237'da'
      FieldName = 'HORA_ENT_SAIDA'
      Origin = '"NOTAFISCAL"."HORA_ENT_SAIDA"'
      EditMask = '!90:00:00;1;_'
    end
    object cdsNfNFE_DPEC_CSTAT: TSmallintField
      DisplayLabel = 'NF-e. DPEC. C'#243'digo do status da resposta'
      FieldName = 'NFE_DPEC_CSTAT'
      Origin = '"NOTAFISCAL"."NFE_DPEC_CSTAT"'
    end
    object cdsNfNFE_DPEC_XMOTIVO: TStringField
      DisplayLabel = 'NF-e. Descri'#231#227'o literal do status da resposta'
      FieldName = 'NFE_DPEC_XMOTIVO'
      Origin = '"NOTAFISCAL"."NFE_DPEC_XMOTIVO"'
      Size = 256
    end
    object cdsNfNFE_DPEC_NREGDPEC: TStringField
      DisplayLabel = 'NF-e. N'#250'mero DPEC'
      FieldName = 'NFE_DPEC_NREGDPEC'
      Origin = '"NOTAFISCAL"."NFE_DPEC_NREGDPEC"'
      Size = 17
    end
    object cdsNfNFE_DHCONT: TDateTimeField
      DisplayLabel = 'NF-e. Data e Hora da entrada em conting'#234'ncia'
      FieldName = 'NFE_DHCONT'
      Origin = '"NOTAFISCAL"."NFE_DHCONT"'
      EditMask = '!99/99/0000 00:00:00;1;_'
    end
    object cdsNfNFE_XJUST: TStringField
      DisplayLabel = 'NF-e. Justificativa da entrada em conting'#234'ncia'
      FieldName = 'NFE_XJUST'
      Origin = '"NOTAFISCAL"."NFE_XJUST"'
      Size = 256
    end
    object cdsNfN_COMANDO: TIntegerField
      DisplayLabel = 'N'#186' Comando'
      FieldName = 'N_COMANDO'
      Origin = '"NOTAFISCAL"."N_COMANDO"'
    end
    object cdsNfALIQ_ICM_SIMPLES: TFloatField
      DisplayLabel = 'Aliq Simples'
      FieldName = 'ALIQ_ICM_SIMPLES'
      Origin = '"NOTAFISCAL"."ALIQ_ICM_SIMPLES"'
    end
    object cdsNfBASE_ICM_SIMPLES: TFloatField
      DisplayLabel = 'Base ICM Simples'
      FieldName = 'BASE_ICM_SIMPLES'
      Origin = '"NOTAFISCAL"."BASE_ICM_SIMPLES"'
    end
    object cdsNfVALOR_ICM_SIMPLES: TFloatField
      DisplayLabel = 'Valor ICM Simples'
      FieldName = 'VALOR_ICM_SIMPLES'
      Origin = '"NOTAFISCAL"."VALOR_ICM_SIMPLES"'
    end
    object cdsNfINSCRICAO_SUBSTITUTO: TStringField
      DisplayLabel = 'Insc Substituto'
      FieldName = 'INSCRICAO_SUBSTITUTO'
      Origin = '"NOTAFISCAL"."INSCRICAO_SUBSTITUTO"'
      Size = 18
    end
    object cdsNfCNAE_FISCAL: TStringField
      DisplayLabel = 'CNAE Fiscal'
      FieldName = 'CNAE_FISCAL'
      Origin = '"NOTAFISCAL"."CNAE_FISCAL"'
      Size = 7
    end
    object cdsNfIM_EMP: TStringField
      DisplayLabel = 'Insc Municipal'
      FieldName = 'IM_EMP'
      Origin = '"NOTAFISCAL"."IM_EMP"'
      Size = 18
    end
    object cdsNfNUM_GERADO: TStringField
      DisplayLabel = 'N'#186' Ger'
      FieldName = 'NUM_GERADO'
      Origin = '"NOTAFISCAL"."NUM_GERADO"'
      FixedChar = True
      Size = 1
    end
    object cdsNfN_CAIXA: TIntegerField
      DisplayLabel = 'N'#186' Caixa'
      FieldName = 'N_CAIXA'
      Origin = '"NOTAFISCAL"."N_CAIXA"'
    end
    object cdsNfCOD_CONS: TStringField
      DisplayLabel = 'Classe Consumo Energia El'#233'trica'
      FieldName = 'COD_CONS'
      Origin = '"NOTAFISCAL"."COD_CONS"'
      FixedChar = True
      Size = 2
    end
    object cdsNfVL_FORN: TFloatField
      DisplayLabel = 'Valor Fornecido'
      FieldName = 'VL_FORN'
      Origin = '"NOTAFISCAL"."VL_FORN"'
    end
    object cdsNfVL_SERV_NT: TFloatField
      DisplayLabel = 'Valor Serv Nao Trib ICM'
      FieldName = 'VL_SERV_NT'
      Origin = '"NOTAFISCAL"."VL_SERV_NT"'
    end
    object cdsNfVL_TERC: TFloatField
      DisplayLabel = 'Valor Terceiros'
      FieldName = 'VL_TERC'
      Origin = '"NOTAFISCAL"."VL_TERC"'
    end
    object cdsNfqrINf: TDataSetField
      FieldName = 'qrINf'
      Visible = False
    end
  end
  object dsNFMestre: TDataSource
    AutoEdit = False
    DataSet = cdsNf
    Left = 657
    Top = 97
  end
  object cdsRepliClientes: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRepliClientes'
    BeforeOpen = CdsClientesBeforeOpen
    Left = 410
    Top = 141
  end
  object qrCodForn: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransClientes
    SQL.Strings = (
      
        'select codigo_fornecedor.*, produtos.descr_prod, produtos.num_fa' +
        'b_prod, produtos.aplicacao_prod'
      'from codigo_fornecedor_vw as codigo_fornecedor'
      
        'inner join produtos on produtos.grupo_prod = codigo_fornecedor.g' +
        'rupo_prod and'
      
        'produtos.cod_prod = codigo_fornecedor.cod_prod and produtos.cod_' +
        'empresa = codigo_fornecedor.cod_empresa'
      'where codigo_fornecedor.cod_fornecedor = 1'
      'and codigo_fornecedor.cod_empresa = 1')
    Left = 24
    Top = 287
  end
  object dspCodForn: TDataSetProvider
    DataSet = qrCodForn
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 24
    Top = 332
  end
  object cdsCodForn: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspCodForn'
    BeforeOpen = CdsClientesBeforeOpen
    Left = 24
    Top = 377
    object cdsCodFornCOD_FORNECEDOR: TIntegerField
      FieldName = 'COD_FORNECEDOR'
      Required = True
    end
    object cdsCodFornGRUPO_PROD: TIntegerField
      DisplayLabel = 'Grupo'
      FieldName = 'GRUPO_PROD'
      Required = True
    end
    object cdsCodFornCOD_PROD: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_PROD'
      Required = True
      FixedChar = True
      Size = 6
    end
    object cdsCodFornCOD_GRADE: TIntegerField
      DisplayLabel = 'C'#243'd Grade'
      FieldName = 'COD_GRADE'
    end
    object cdsCodFornCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsCodFornNUM_FAB_FORNECEDOR: TStringField
      DisplayLabel = 'C'#243'digo no Fornecedor'
      FieldName = 'NUM_FAB_FORNECEDOR'
      Required = True
    end
    object cdsCodFornATIVO: TIntegerField
      FieldName = 'ATIVO'
    end
    object cdsCodFornDATA_CADASTRO: TDateTimeField
      FieldName = 'DATA_CADASTRO'
    end
    object cdsCodFornDATA_MODIFICACAO: TDateTimeField
      FieldName = 'DATA_MODIFICACAO'
    end
    object cdsCodFornDESCR_PROD: TStringField
      DisplayLabel = 'Produto'
      FieldName = 'DESCR_PROD'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 75
    end
    object cdsCodFornNUM_FAB_PROD: TStringField
      DisplayLabel = 'C'#243'digo Interno'
      FieldName = 'NUM_FAB_PROD'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
    end
    object cdsCodFornAPLICACAO_PROD: TStringField
      DisplayLabel = 'Aplica'#231#227'o'
      FieldName = 'APLICACAO_PROD'
      ProviderFlags = []
      ReadOnly = True
      Size = 150
    end
    object cdsCodFornSEQID: TIntegerField
      FieldName = 'SEQID'
    end
    object cdsCodFornCPFCGC: TStringField
      FieldName = 'CPFCGC'
      ReadOnly = True
      Size = 18
    end
    object cdsCodFornTABELA: TStringField
      FieldName = 'TABELA'
      ReadOnly = True
      FixedChar = True
      Size = 18
    end
  end
  object dsCodForn: TDataSource
    DataSet = cdsCodForn
    Left = 22
    Top = 418
  end
  object qrFotos: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransClientes
    SQL.Strings = (
      'select * from fotos where CODIGO=0')
    Left = 840
    Top = 55
  end
  object dspFotos: TDataSetProvider
    DataSet = qrFotos
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 840
    Top = 92
  end
  object cdsFotos: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspFotos'
    BeforeOpen = CdsClientesBeforeOpen
    Left = 840
    Top = 137
    object cdsFotosCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object cdsFotosCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsFotosFOTO: TBlobField
      FieldName = 'FOTO'
      Size = 8
    end
    object cdsFotosEXTENSAO: TStringField
      FieldName = 'EXTENSAO'
      Size = 8
    end
    object cdsFotosTIPO: TSmallintField
      FieldName = 'TIPO'
    end
    object cdsFotosNITEM: TIntegerField
      FieldName = 'NITEM'
      Required = True
    end
    object cdsFotosDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 30
    end
  end
  object dsFotos: TDataSource
    DataSet = cdsFotos
    Left = 838
    Top = 178
  end
  object qrBuscaFoto: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransClientes
    Left = 838
    Top = 221
  end
  object dspContratoCl: TDataSetProvider
    DataSet = qrContratoCl
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 96
    Top = 332
  end
  object qrContratoCl: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransClientes
    SQL.Strings = (
      'select cc.cod_contrato, cc.descr_contrato, cc.cod_empresa,'
      
        'cc.cod_cliente, cc.cod_servico, ts.desc_servico, cc.cod_controle' +
        ', c.nome_ctrl, c.usar_boleto,'
      
        'cc.cod_vendedor , co.nome_vendedor, cc.dia_vencimento, cc.dia_fa' +
        'turamento, cc.dias_apos_venc, cc.valor_contrato, cc.valor_prod, ' +
        'cc.valor_serv, cc.data_inicial_vigencia, cc.data_final_vigencia,' +
        ' cc.tipo_os, cc.status, cc.data_inicial_boleto, cc.data_cancelam' +
        'ento, cc.contratos_cada_mes,'
      
        'cc.data_reajuste, cc.perc_reajuste, cc.obs, cc.gerar_nfs, cc.ger' +
        'ar_nf, cc.gerar_rec_loc, cc.gerar_boleto, cc.assinatura_vindi_id' +
        ', cl.nome_cliente, cl.razao, cl.cpfcgc, cl.fone_cliente, cl.fone' +
        '_celular, cl.email, cl.codigo_uf, est.sigla_uf, cl.cod_cidade, c' +
        'id.nome_cidade, cl.cod_bairro, bai.nome_bairro, cl.cep, cl.ender' +
        'eco, cl.num_end_cliente'
      'from clientes_com_contrato cc'
      
        'inner join clientes cl on cl.cod_cliente = cc.cod_cliente and cl' +
        '.cod_empresa = cc.cod_empresa'
      'inner join tipo_servico ts on ts.cod_servico = cc.cod_servico'
      
        'inner join controles c on c.codigo_ctrl = cc.cod_controle and c.' +
        'codigo_emp = cc.cod_empresa'
      
        'inner join colaborador co on co.cod_vendedor = cc.cod_vendedor a' +
        'nd co.cod_empresa = cc.cod_empresa'
      'left join estados est on est.codigo_uf = cl.codigo_uf'
      'left join cidades cid on cid.cod_cidade = cl.cod_cidade'
      'left join bairros bai on bai.cod_bairro = cl.cod_bairro'
      
        'where cc.cod_cliente = 0 and cc.cod_empresa = 0 and cc.cod_servi' +
        'co = 0 and co.ativo = 0')
    Left = 96
    Top = 287
  end
  object cdsContratoCl: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspContratoCl'
    BeforeOpen = CdsClientesBeforeOpen
    Left = 96
    Top = 377
    object cdsContratoClSEL: TStringField
      DisplayLabel = 'Sel'
      FieldKind = fkInternalCalc
      FieldName = 'SEL'
      Size = 1
    end
    object cdsContratoClCOD_CONTRATO: TIntegerField
      DisplayLabel = 'Cod Contrato'
      FieldName = 'COD_CONTRATO'
      Required = True
    end
    object cdsContratoClDESCR_CONTRATO: TStringField
      DisplayLabel = 'Descricao'
      FieldName = 'DESCR_CONTRATO'
      Size = 75
    end
    object cdsContratoClCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsContratoClCOD_CLIENTE: TIntegerField
      DisplayLabel = 'Cod Cliente'
      FieldName = 'COD_CLIENTE'
      Required = True
    end
    object cdsContratoClNOME_CLIENTE: TStringField
      DisplayLabel = 'Nome Cliente'
      FieldName = 'NOME_CLIENTE'
      Required = True
      Size = 35
    end
    object cdsContratoClDESC_SERVICO: TStringField
      Tag = 1
      DisplayLabel = 'Tipo Contrato'
      FieldName = 'DESC_SERVICO'
      FixedChar = True
      Size = 60
    end
    object cdsContratoClNOME_CTRL: TStringField
      DisplayLabel = 'Controle'
      FieldName = 'NOME_CTRL'
      Size = 35
    end
    object cdsContratoClUSAR_BOLETO: TStringField
      DisplayLabel = 'Usar Boleto'
      FieldName = 'USAR_BOLETO'
      Size = 1
    end
    object cdsContratoClNOME_VENDEDOR: TStringField
      DisplayLabel = 'Vendedor'
      FieldName = 'NOME_VENDEDOR'
      Size = 35
    end
    object cdsContratoClDIA_VENCIMENTO: TIntegerField
      DisplayLabel = 'Dia Vencimento'
      FieldName = 'DIA_VENCIMENTO'
    end
    object cdsContratoClDIA_FATURAMENTO: TIntegerField
      DisplayLabel = 'Dia Faturamento'
      FieldName = 'DIA_FATURAMENTO'
    end
    object cdsContratoClDIAS_APOS_VENC: TIntegerField
      DisplayLabel = 'Dias Apos Vencimento'
      FieldName = 'DIAS_APOS_VENC'
    end
    object cdsContratoClVALOR_CONTRATO: TFloatField
      DisplayLabel = 'Valor Contrato'
      FieldName = 'VALOR_CONTRATO'
      currency = True
    end
    object cdsContratoClVALOR_SERV: TFloatField
      DisplayLabel = 'Valor Servicos'
      FieldName = 'VALOR_SERV'
      currency = True
    end
    object cdsContratoClVALOR_PROD: TFloatField
      DisplayLabel = 'Valor Produtos'
      FieldName = 'VALOR_PROD'
      currency = True
    end
    object cdsContratoClSTATUS: TStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
    end
    object cdsContratoClDATA_INICIAL_VIGENCIA: TDateTimeField
      DisplayLabel = 'Data Incial da Vig'#234'ncia'
      FieldName = 'DATA_INICIAL_VIGENCIA'
    end
    object cdsContratoClDATA_FINAL_VIGENCIA: TDateTimeField
      DisplayLabel = 'Data Final da Vig'#234'ncia'
      FieldName = 'DATA_FINAL_VIGENCIA'
    end
    object cdsContratoClDATA_INICIAL_BOLETO: TDateTimeField
      DisplayLabel = 'Data Inicial Impress'#227'o Boleta'
      FieldName = 'DATA_INICIAL_BOLETO'
    end
    object cdsContratoClDATA_CANCELAMENTO: TDateTimeField
      DisplayLabel = 'Data Cancelamento'
      FieldName = 'DATA_CANCELAMENTO'
    end
    object cdsContratoClTIPO_OS: TStringField
      DisplayLabel = 'Tipo OS'
      FieldName = 'TIPO_OS'
      Size = 40
    end
    object cdsContratoClCOD_SERVICO: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Tp Contrato'
      FieldName = 'COD_SERVICO'
      Required = True
    end
    object cdsContratoClCOD_CONTROLE: TIntegerField
      DisplayLabel = 'Cod Controle'
      FieldName = 'COD_CONTROLE'
      Required = True
    end
    object cdsContratoClCOD_VENDEDOR: TIntegerField
      DisplayLabel = 'Cod Vendedor'
      FieldName = 'COD_VENDEDOR'
      Required = True
    end
    object cdsContratoClUS_MOD_CL: TIntegerField
      DisplayLabel = 'Usuario que modificou'
      FieldName = 'US_MOD_CL'
    end
    object cdsContratoClCOD_CTR_INTEGRA: TIntegerField
      DisplayLabel = 'Cod Int'
      FieldName = 'COD_CTR_INTEGRA'
    end
    object cdsContratoClIND_INCLALT: TIntegerField
      DisplayLabel = 'Ind IncAlt'
      FieldName = 'IND_INCLALT'
    end
    object cdsContratoClCONTRATOS_CADA_MES: TIntegerField
      DisplayLabel = 'Gerar contratos a cada mes'
      FieldName = 'CONTRATOS_CADA_MES'
      OnGetText = cdsContratoClCONTRATOS_CADA_MESGetText
    end
    object cdsContratoClOBS: TMemoField
      DisplayLabel = 'Obs'
      FieldName = 'OBS'
      OnGetText = cdsContratoClOBSGetText
      BlobType = ftMemo
      Size = 8
    end
    object cdsContratoClRAZAO: TStringField
      DisplayLabel = 'Razao Cliente'
      FieldName = 'RAZAO'
      Required = True
      Size = 60
    end
    object cdsContratoClCPFCGC: TStringField
      DisplayLabel = 'CPF / CNPJ'
      FieldName = 'CPFCGC'
      Size = 18
    end
    object cdsContratoClFONE_CLIENTE: TStringField
      DisplayLabel = 'Fone'
      FieldName = 'FONE_CLIENTE'
      FixedChar = True
      Size = 13
    end
    object cdsContratoClFONE_CELULAR: TStringField
      DisplayLabel = 'Celular'
      FieldName = 'FONE_CELULAR'
      FixedChar = True
      Size = 13
    end
    object cdsContratoClEMAIL: TStringField
      DisplayLabel = 'Email'
      FieldName = 'EMAIL'
      Size = 256
    end
    object cdsContratoClCODIGO_UF: TIntegerField
      DisplayLabel = 'Cod UF'
      FieldName = 'CODIGO_UF'
      Required = True
    end
    object cdsContratoClSIGLA_UF: TStringField
      DisplayLabel = 'UF'
      FieldName = 'SIGLA_UF'
      FixedChar = True
      Size = 2
    end
    object cdsContratoClCOD_CIDADE: TSmallintField
      DisplayLabel = 'Cod Cidade'
      FieldName = 'COD_CIDADE'
    end
    object cdsContratoClNOME_CIDADE: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'NOME_CIDADE'
      Size = 30
    end
    object cdsContratoClCOD_BAIRRO: TSmallintField
      DisplayLabel = 'Cod Bairro'
      FieldName = 'COD_BAIRRO'
    end
    object cdsContratoClNOME_BAIRRO: TStringField
      DisplayLabel = 'Bairro'
      FieldName = 'NOME_BAIRRO'
      Size = 30
    end
    object cdsContratoClCEP: TStringField
      DisplayLabel = 'Cep'
      FieldName = 'CEP'
      Required = True
      FixedChar = True
      Size = 9
    end
    object cdsContratoClENDERECO: TStringField
      DisplayLabel = 'Endereco'
      FieldName = 'ENDERECO'
      Required = True
      Size = 50
    end
    object cdsContratoClNUM_END_CLIENTE: TStringField
      DisplayLabel = 'Numero'
      FieldName = 'NUM_END_CLIENTE'
      Size = 60
    end
    object cdsContratoClDATA_REAJUSTE: TDateTimeField
      DisplayLabel = 'Data Reajuste'
      FieldName = 'DATA_REAJUSTE'
    end
    object cdsContratoClPERC_REAJUSTE: TFloatField
      DisplayLabel = 'Perc Reajuste'
      FieldName = 'PERC_REAJUSTE'
    end
    object cdsContratoClNFS: TStringField
      DisplayLabel = 'Gerar NFS'
      FieldName = 'GERAR_NFS'
      FixedChar = True
      Size = 1
    end
    object cdsContratoClNF: TStringField
      DisplayLabel = 'Gerar NF'
      FieldName = 'GERAR_NF'
      FixedChar = True
      Size = 1
    end
    object cdsContratoClREC_LOC: TStringField
      DisplayLabel = 'Gerar Recibo Locacao'
      FieldName = 'GERAR_REC_LOC'
      FixedChar = True
      Size = 1
    end
    object cdsContratoClBOLETO: TStringField
      DisplayLabel = 'Gerar Boleto'
      FieldName = 'GERAR_BOLETO'
      FixedChar = True
      Size = 1
    end
    object cdsContratoClASSINATURA_VINDI_ID: TLargeintField
      DisplayLabel = 'Assinatura Id'
      FieldName = 'ASSINATURA_VINDI_ID'
    end
  end
  object dsContratoCl: TDataSource
    DataSet = cdsContratoCl
    Left = 94
    Top = 418
  end
  object dspCtrl: TDataSetProvider
    DataSet = qrCtrl
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 888
    Top = 100
  end
  object qrCtrl: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransClientes
    SQL.Strings = (
      
        'select codigo_ctrl, nome_ctrl, usar_boleto from controles where ' +
        'codigo_emp = 0')
    Left = 888
    Top = 55
  end
  object cdsCtrl: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspCtrl'
    BeforeOpen = CdsClientesBeforeOpen
    Left = 888
    Top = 145
    object cdsCtrlCODIGO_CTRL: TIntegerField
      FieldName = 'CODIGO_CTRL'
    end
    object cdsCtrlNOME_CTRL: TStringField
      FieldName = 'NOME_CTRL'
      Size = 35
    end
    object cdsCtrlUSAR_BOLETO: TStringField
      FieldName = 'USAR_BOLETO'
      FixedChar = True
      Size = 1
    end
    object cdsCtrlSEL: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'SEL'
      Size = 1
    end
  end
  object dsCtrl: TDataSource
    DataSet = cdsCtrl
    Left = 886
    Top = 186
  end
  object dspTipServ: TDataSetProvider
    DataSet = qrTipServ
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 165
    Top = 333
  end
  object qrTipServ: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransClientes
    SQL.Strings = (
      
        'select cod_servico, desc_servico, codigo_nop from tipo_servico w' +
        'here cod_servico = 0')
    Left = 165
    Top = 288
  end
  object cdsTipServ: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspTipServ'
    BeforeOpen = CdsClientesBeforeOpen
    Left = 165
    Top = 378
    object cdsTipServCOD_SERVICO: TIntegerField
      FieldName = 'COD_SERVICO'
    end
    object cdsTipServDESC_SERVICO: TStringField
      FieldName = 'DESC_SERVICO'
      Size = 60
    end
    object cdsTipServCODIGO_NOP: TFloatField
      FieldName = 'CODIGO_NOP'
    end
  end
  object dsTipServ: TDataSource
    DataSet = cdsTipServ
    Left = 163
    Top = 419
  end
  object dspContratosOS: TDataSetProvider
    DataSet = qrContratosOS
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 235
    Top = 333
  end
  object qrContratosOS: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransClientes
    SQL.Strings = (
      
        'select pv.nped, pv.data_ped, pv.data_fech, pv.valor_total, pv.st' +
        'atus_ped, pv.tipo_os, pv.num_nf, pv.data_nf, pv.num_nfeext, pv.d' +
        'ata_nfext, cl.nome_cliente, cl.razao, cl.cpfcgc'
      'from pedvenda pv'
      
        'inner join pedvenda_serv ps on ps.nped = pv.nped and ps.tipo = p' +
        'v.tipo and ps.cod_empresa = pv.cod_empresa'
      
        'inner join clientes cl on cl.cod_cliente = pv.cod_cliente and cl' +
        '.cod_empresa = pv.cod_empresa '
      
        'where pv.cod_cliente = :cod_cliente and ps.cod_servico = :cod_se' +
        'rvico and pv.tipo = '#39'OS'#39)
    Left = 235
    Top = 288
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cod_cliente'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cod_servico'
        ParamType = ptUnknown
      end>
  end
  object cdsContratosOS: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspContratosOS'
    BeforeOpen = CdsClientesBeforeOpen
    Left = 235
    Top = 378
    object cdsContratosOSNPED: TIntegerField
      DisplayLabel = 'N'#176' Venda'
      FieldName = 'NPED'
      Required = True
    end
    object cdsContratosOSDATA_PED: TDateTimeField
      DisplayLabel = 'Data'
      FieldName = 'DATA_PED'
    end
    object cdsContratosOSDATA_FECH: TDateTimeField
      DisplayLabel = 'Data Fech'
      FieldName = 'DATA_FECH'
    end
    object cdsContratosOSVALOR_TOTAL: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VALOR_TOTAL'
      DisplayFormat = '#0.00'
      currency = True
    end
    object cdsContratosOSSTATUS_PED: TStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS_PED'
      Size = 10
    end
    object cdsContratosOSTIPO_OS: TStringField
      DisplayLabel = 'Tipo OS'
      FieldName = 'TIPO_OS'
      Size = 40
    end
    object cdsContratosOSNUM_NF: TIntegerField
      DisplayLabel = 'N'#176' NF'
      FieldName = 'NUM_NF'
    end
    object cdsContratosOSDATA_NF: TDateTimeField
      DisplayLabel = 'Data NF'
      FieldName = 'DATA_NF'
    end
    object cdsContratosOSNUM_NFEEXT: TLargeintField
      DisplayLabel = 'N'#176' NF Ext'
      FieldName = 'NUM_NFEEXT'
    end
    object cdsContratosOSDATA_NFEXT: TDateTimeField
      DisplayLabel = 'Data NF Ext'
      FieldName = 'DATA_NFEXT'
    end
    object cdsContratosOSNOME_CLIENTE: TStringField
      DisplayLabel = 'Nome do Cliente'
      FieldName = 'NOME_CLIENTE'
      Required = True
      Size = 35
    end
    object cdsContratosOSRAZAO: TStringField
      DisplayLabel = 'Raz'#227'o Social'
      FieldName = 'RAZAO'
      Required = True
      Size = 60
    end
    object cdsContratosOSCPFCGC: TStringField
      DisplayLabel = 'CPF / CNPJ'
      FieldName = 'CPFCGC'
      Size = 18
    end
  end
  object dsContratosOS: TDataSource
    DataSet = cdsContratosOS
    Left = 233
    Top = 419
  end
  object qrContratosRel: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransClientes
    AfterScroll = qrContratosRelAfterScroll
    SQL.Strings = (
      
        'select distinct cc.cod_servico, ts.desc_servico from clientes_co' +
        'm_contrato cc'
      'inner join tipo_servico ts on ts.cod_servico = cc.cod_servico')
    Left = 341
    Top = 289
  end
  object qrContratosDetalhesRel: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransClientes
    SQL.Strings = (
      
        'select cc.*, c.razao, c.contato,  c.fone_cliente  from clientes_' +
        'com_contrato cc'
      
        'inner join clientes c on c.cod_cliente = cc.cod_cliente and c.co' +
        'd_empresa = cc.cod_empresa'
      'where cc.cod_servico = :cod_servico')
    Left = 341
    Top = 333
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cod_servico'
        ParamType = ptUnknown
      end>
  end
  object dspPais: TDataSetProvider
    DataSet = qrPais
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 928
    Top = 100
  end
  object qrPais: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransClientes
    SQL.Strings = (
      'select * from paises')
    Left = 928
    Top = 55
  end
  object cdsPais: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspPais'
    BeforeOpen = CdsClientesBeforeOpen
    Left = 928
    Top = 145
    object cdsPaisCOD_PAIS: TIntegerField
      FieldName = 'COD_PAIS'
      Required = True
    end
    object cdsPaisNOME_PAIS: TStringField
      FieldName = 'NOME_PAIS'
      Size = 64
    end
  end
  object dsPais: TDataSource
    DataSet = cdsPais
    Left = 926
    Top = 186
  end
  object qrAgendamento: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransClientes
    SQL.Strings = (
      'select * from agendamentos where codigo=-1')
    Left = 445
    Top = 288
  end
  object dspAgendamento: TDataSetProvider
    DataSet = qrAgendamento
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 445
    Top = 333
  end
  object cdsAgendamento: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspAgendamento'
    BeforeOpen = CdsClientesBeforeOpen
    Left = 445
    Top = 378
    object cdsAgendamentoCODIGO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      Required = True
    end
    object cdsAgendamentoCOD_EMPRESA: TIntegerField
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsAgendamentoCODREAGENDAMENTO: TIntegerField
      DisplayLabel = 'Cod Reagendamento'
      FieldName = 'CODREAGENDAMENTO'
    end
    object cdsAgendamentoCOD_CLIENTE: TIntegerField
      DisplayLabel = 'Cod Cliente'
      FieldName = 'COD_CLIENTE'
    end
    object cdsAgendamentoCOLABORADOR: TIntegerField
      DisplayLabel = 'Colaborador'
      FieldName = 'COLABORADOR'
    end
    object cdsAgendamentoTIPOCONTATO: TStringField
      DisplayLabel = 'Tipo Contato'
      FieldName = 'TIPOCONTATO'
      Size = 32
    end
    object cdsAgendamentoFINALIZACAO: TStringField
      DisplayLabel = 'Finaliza'#231#227'o'
      FieldName = 'FINALIZACAO'
      Size = 32
    end
    object cdsAgendamentoCODFATURAMENTO: TIntegerField
      DisplayLabel = 'Cod Faturamento'
      FieldName = 'CODFATURAMENTO'
    end
    object cdsAgendamentoDESCRICAO: TMemoField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      BlobType = ftMemo
      Size = 8
    end
    object cdsAgendamentoNPED: TIntegerField
      DisplayLabel = 'Num. Pedido'
      FieldName = 'NPED'
    end
    object cdsAgendamentoDATA: TDateTimeField
      DisplayLabel = 'Data'
      FieldName = 'DATA'
    end
    object cdsAgendamentoATIVO: TSmallintField
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
  end
  object dsAgendamento: TDataSource
    DataSet = cdsAgendamento
    Left = 446
    Top = 426
  end
  object dspLocal: TDataSetProvider
    DataSet = qrLocal
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 984
    Top = 100
  end
  object qrLocal: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransClientes
    SQL.Strings = (
      'select l.cod_localidade, l.localidade, s.setor from localidade l'
      
        'left join setor s on s.cod_setor = l.cod_setor and l.cod_empresa' +
        ' = s.cod_setor'
      'where l.ativo = 1 and l.cod_localidade = 0')
    Left = 984
    Top = 55
  end
  object cdsLocal: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspLocal'
    BeforeOpen = CdsClientesBeforeOpen
    Left = 984
    Top = 145
    object cdsLocalCOD_LOCALIDADE: TIntegerField
      FieldName = 'COD_LOCALIDADE'
      Required = True
    end
    object cdsLocalLOCALIDADE: TStringField
      FieldName = 'LOCALIDADE'
      Size = 64
    end
    object cdsLocalSETOR: TStringField
      FieldName = 'SETOR'
      Size = 64
    end
  end
  object dsLocal: TDataSource
    DataSet = cdsLocal
    Left = 982
    Top = 186
  end
  object dsTemp: TDataSource
    AutoEdit = False
    Left = 328
    Top = 392
  end
  object qrItensCarta: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransClientes
    SQL.Strings = (
      
        'select ic.*, case ic.condicao when 1 then '#39'N'#195'O ENVIADA'#39' when 0 t' +
        'hen '#39'ENVIADA'#39' else '#39#39' end "Status Carta" from ITENS_CARTA ic whe' +
        're ic.codigo=-1')
    Left = 538
    Top = 288
  end
  object dspItensCarta: TDataSetProvider
    DataSet = qrItensCarta
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 538
    Top = 333
  end
  object cdsItensCarta: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspItensCarta'
    BeforeOpen = CdsClientesBeforeOpen
    Left = 538
    Top = 378
    object cdsItensCartaCODIGO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      Required = True
    end
    object cdsItensCartaCOD_EMPRESA: TIntegerField
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsItensCartaDATA: TDateTimeField
      DisplayLabel = 'Data Processamento'
      FieldName = 'DATA'
    end
    object cdsItensCartaCONDICAO: TIntegerField
      FieldName = 'CONDICAO'
    end
    object cdsItensCartaCOD_CARTA: TIntegerField
      DisplayLabel = 'Cod Carta'
      FieldName = 'COD_CARTA'
    end
    object cdsItensCartaCOD_CLIENTE: TIntegerField
      DisplayLabel = 'Cod Cliente'
      FieldName = 'COD_CLIENTE'
    end
    object cdsItensCartaNOME_CLIENTE: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'NOME_CLIENTE'
      Size = 50
    end
    object cdsItensCartaDT_SOLUCAO: TDateTimeField
      DisplayLabel = 'Data Solu'#231#227'o'
      FieldName = 'DT_SOLUCAO'
    end
    object cdsItensCartaDIAS_ATRASO: TIntegerField
      DisplayLabel = 'Dias de Atraso'
      FieldName = 'DIAS_ATRASO'
    end
    object cdsItensCartaATIVO: TIntegerField
      FieldName = 'ATIVO'
    end
    object cdsItensCartaCOD_FATURAMENTO: TIntegerField
      DisplayLabel = 'Cod Faturamento'
      FieldName = 'COD_FATURAMENTO'
    end
    object cdsItensCartaDIAS_ATRASO_PED: TIntegerField
      FieldName = 'DIAS_ATRASO_PED'
    end
    object cdsItensCartaCOD_CONTROLE: TIntegerField
      DisplayLabel = 'Cod Controle'
      FieldName = 'COD_CONTROLE'
    end
    object cdsItensCartaCOD_CRED: TIntegerField
      DisplayLabel = 'Cod Cr'#233'dito'
      FieldName = 'COD_CRED'
    end
    object cdsItensCartaStatusCarta: TStringField
      FieldName = 'Status Carta'
      FixedChar = True
      Size = 11
    end
  end
  object dsItensCarta: TDataSource
    DataSet = cdsItensCarta
    Left = 539
    Top = 426
  end
  object qrColaborador: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransClientes
    SQL.Strings = (
      
        'select c.cod_vendedor, c.nome_vendedor, f.desc_funcao from colab' +
        'orador c inner join funcoes f on f.cod_funcao = c.cod_funcao'
      
        'where c.cod_empresa = 0 and c.ativo = 0 and f.desc_funcao ='#39'VEND' +
        'EDOR'#39)
    Left = 1048
    Top = 55
  end
  object dspColaborador: TDataSetProvider
    DataSet = qrColaborador
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1048
    Top = 100
  end
  object cdsColoborador: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspColaborador'
    BeforeOpen = CdsClientesBeforeOpen
    Left = 1048
    Top = 145
    object cdsColoboradorCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
      Required = True
    end
    object cdsColoboradorNOME_VENDEDOR: TStringField
      FieldName = 'NOME_VENDEDOR'
      Size = 35
    end
    object cdsColoboradorDESC_FUNCAO: TStringField
      FieldName = 'DESC_FUNCAO'
      FixedChar = True
      Size = 30
    end
  end
  object dsColaborador: TDataSource
    DataSet = cdsColoborador
    Left = 1046
    Top = 186
  end
  object qrVendedor: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransClientes
    SQL.Strings = (
      'select C.cod_vendedor from colaborador c'
      'inner join funcoes f on f.cod_funcao  = c.cod_funcao'
      'where f.desc_funcao like '#39'%VENDEDOR%'#39' and c.cod_empresa = 1')
    Left = 776
    Top = 287
  end
  object dspVendedor: TDataSetProvider
    DataSet = qrVendedor
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 776
    Top = 332
  end
  object cdsVendedor: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspVendedor'
    BeforeOpen = CdsClientesBeforeOpen
    Left = 776
    Top = 377
    object cdsVendedorCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
      Required = True
    end
  end
  object qrRedist: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransClientes
    SQL.Strings = (
      
        'select c.cod_cliente, c.nome_cliente, c.razao, c.cidade,  c.bair' +
        'ro, l.localidade, s.setor, c.cpfcgc, co.nome_vendedor, co.cod_ve' +
        'ndedor'
      'from clientes c'
      
        'left join localidade l on l.cod_localidade  = c.cod_localidade a' +
        'nd l.cod_empresa = c.cod_empresa'
      
        'left join setor s on s.cod_setor = l.cod_setor and s.cod_empresa' +
        ' = l.cod_empresa'
      
        'left join colaborador co on co.cod_vendedor = c.cod_vendedor and' +
        ' co.cod_empresa = c.cod_empresa'
      'where c.cod_empresa = 0 and c.ativo = 1')
    Left = 1120
    Top = 55
  end
  object dspRedist: TDataSetProvider
    DataSet = qrRedist
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1120
    Top = 100
  end
  object cdsRedist: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspRedist'
    BeforeOpen = CdsClientesBeforeOpen
    Left = 1120
    Top = 145
    object cdsRedistNOME_CLIENTE: TStringField
      FieldName = 'NOME_CLIENTE'
      Required = True
      Size = 35
    end
    object cdsRedistRAZAO: TStringField
      FieldName = 'RAZAO'
      Required = True
      Size = 60
    end
    object cdsRedistCIDADE: TStringField
      FieldName = 'CIDADE'
      Required = True
      Size = 30
    end
    object cdsRedistBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Required = True
      Size = 35
    end
    object cdsRedistLOCALIDADE: TStringField
      FieldName = 'LOCALIDADE'
      Size = 64
    end
    object cdsRedistSETOR: TStringField
      FieldName = 'SETOR'
      Size = 64
    end
    object cdsRedistCPFCGC: TStringField
      FieldName = 'CPFCGC'
      Size = 18
    end
    object cdsRedistNOME_VENDEDOR: TStringField
      FieldName = 'NOME_VENDEDOR'
      Size = 35
    end
    object cdsRedistCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
    end
    object cdsRedistSEL: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'SEL'
      Size = 1
    end
    object cdsRedistCOD_CLIENTE: TIntegerField
      FieldName = 'COD_CLIENTE'
    end
    object cdsRedistENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 600
    end
  end
  object dsRedist: TDataSource
    DataSet = cdsRedist
    Left = 1118
    Top = 186
  end
  object qrModCartas: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransClientes
    SQL.Strings = (
      ' select * from MODCARTAS WHERE '
      'COD_EMPRESA = :COD_EMPRESA AND ATIVO = 1'
      'AND TIPO = '#39'CLI'#39)
    Left = 642
    Top = 288
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'COD_EMPRESA'
        ParamType = ptUnknown
      end>
  end
  object dspModCartas: TDataSetProvider
    DataSet = qrModCartas
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 642
    Top = 333
  end
  object cdsModCartas: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspModCartas'
    BeforeOpen = CdsClientesBeforeOpen
    Left = 642
    Top = 378
    object cdsModCartasCOD_CARTA: TIntegerField
      FieldName = 'COD_CARTA'
      Required = True
    end
    object cdsModCartasCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsModCartasDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 64
    end
    object cdsModCartasDADOS_CARTA: TMemoField
      FieldName = 'DADOS_CARTA'
      BlobType = ftMemo
      Size = 8
    end
    object cdsModCartasATIVO: TIntegerField
      FieldName = 'ATIVO'
    end
    object cdsModCartasCOBRANCA: TStringField
      FieldName = 'COBRANCA'
      FixedChar = True
      Size = 1
    end
    object cdsModCartasTIPO: TStringField
      FieldName = 'TIPO'
      Required = True
      FixedChar = True
      Size = 3
    end
    object cdsModCartasFORMULARIOS: TStringField
      FieldName = 'FORMULARIOS'
      Size = 64
    end
    object cdsModCartasTIPO_CONTRATO: TStringField
      FieldName = 'TIPO_CONTRATO'
      Size = 64
    end
  end
  object dsModCartas: TDataSource
    DataSet = qrModCartas
    Left = 643
    Top = 426
  end
  object qrTabPrecoCli: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransClientes
    SQL.Strings = (
      
        'select p.cod_promocao, p.descr_promocao, p.ordem from promocao p' +
        ' '
      
        'inner join tipo_preco t on t.cod_tppreco = p.cod_tppreco and t.c' +
        'od_empresa = p.cod_empresa where t.tipo = '#39'T'#39' and p.cod_promocao' +
        ' > 0 and p.cod_empresa= 0 order by p.ordem desc')
    Left = 1200
    Top = 55
  end
  object dspTabPrecoCli: TDataSetProvider
    DataSet = qrTabPrecoCli
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1200
    Top = 100
  end
  object cdsTabPrecoCli: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspTabPrecoCli'
    BeforeOpen = CdsClientesBeforeOpen
    Left = 1200
    Top = 145
    object cdsTabPrecoCliORDEM: TIntegerField
      FieldName = 'ORDEM'
    end
    object cdsTabPrecoCliCOD_PROMOCAO: TIntegerField
      FieldName = 'COD_PROMOCAO'
      Required = True
    end
    object cdsTabPrecoCliDESCR_PROMOCAO: TStringField
      FieldName = 'DESCR_PROMOCAO'
      Size = 128
    end
  end
  object dsTabPrecoCli: TDataSource
    DataSet = qrTabPrecoCli
    Left = 1198
    Top = 186
  end
  object cdsAtributos: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspAtributos'
    BeforeOpen = CdsClientesBeforeOpen
    Left = 1289
    Top = 145
    object cdsAtributosCOD_ATRIBUTO: TIntegerField
      FieldName = 'COD_ATRIBUTO'
    end
    object cdsAtributosCOD_CLIENTE: TIntegerField
      FieldName = 'COD_CLIENTE'
    end
    object cdsAtributosDESCRICAO_ATRIBUTO: TStringField
      FieldName = 'DESCRICAO_ATRIBUTO'
      Size = 30
    end
    object cdsAtributosCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
    end
    object cdsAtributosVALOR_ATRIBUTO: TFloatField
      FieldName = 'VALOR_ATRIBUTO'
    end
    object cdsAtributosATIVO: TIntegerField
      FieldName = 'ATIVO'
    end
  end
  object dsAtributos: TDataSource
    DataSet = cdsAtributos
    Left = 1287
    Top = 186
  end
  object qrCheckCheck: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransClientes
    SQL.Strings = (
      
        'select * from consulta_credcl c where c.cod_consultacred = 0 and' +
        ' c.cod_cliente = 0 and c.cod_empresa = 0')
    Left = 880
    Top = 279
  end
  object dspCheckCheck: TDataSetProvider
    DataSet = qrCheckCheck
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 880
    Top = 324
  end
  object cdsCheckCheck: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspCheckCheck'
    BeforeOpen = CdsClientesBeforeOpen
    Left = 880
    Top = 369
    object cdsCheckCheckCOD_CONSULTACRED: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_CONSULTACRED'
      Required = True
    end
    object cdsCheckCheckCOD_CLIENTE: TIntegerField
      DisplayLabel = 'Cod Cliente'
      FieldName = 'COD_CLIENTE'
      Required = True
    end
    object cdsCheckCheckCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
      Visible = False
    end
    object cdsCheckCheckDATA_CONSULTA: TDateTimeField
      DisplayLabel = 'Data Consulta'
      FieldName = 'DATA_CONSULTA'
    end
    object cdsCheckCheckHORA_CONSULTA: TStringField
      DisplayLabel = 'Hora Consulta'
      FieldName = 'HORA_CONSULTA'
      Size = 8
    end
    object cdsCheckCheckDADOS_CONSULTA: TMemoField
      DisplayLabel = 'Dados Consulta'
      FieldName = 'DADOS_CONSULTA'
      OnGetText = cdsCheckCheckDADOS_CONSULTAGetText
      BlobType = ftMemo
      Size = 8
    end
    object cdsCheckCheckORIGEM_CONSULTA: TStringField
      DisplayLabel = 'Origem Consulta'
      FieldName = 'ORIGEM_CONSULTA'
      Size = 80
    end
    object cdsCheckCheckACAO_CONSULTA: TStringField
      DisplayLabel = 'A'#231#227'o Consulta'
      FieldName = 'ACAO_CONSULTA'
      Size = 40
    end
    object cdsCheckCheckATIVO: TIntegerField
      FieldName = 'ATIVO'
      Visible = False
    end
    object cdsCheckCheckUSUARIO_LIBEROU: TStringField
      DisplayLabel = 'Usu'#225'rio Liberou'
      FieldName = 'USUARIO_LIBEROU'
      Size = 10
    end
  end
  object dsCheckCheck: TDataSource
    DataSet = cdsCheckCheck
    Left = 878
    Top = 410
  end
  object qrCheckConf: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransClientes
    SQL.Strings = (
      
        'select * from checkcheck c where c.cod_checkcheck = 0 and c.cod_' +
        'empresa = 0')
    Left = 968
    Top = 279
  end
  object dspCheckConf: TDataSetProvider
    DataSet = qrCheckConf
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 968
    Top = 324
  end
  object cdsCheckConf: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspCheckConf'
    BeforeOpen = CdsClientesBeforeOpen
    Left = 968
    Top = 369
    object cdsCheckConfCOD_CHECKCHECK: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'COD_CHECKCHECK'
      Required = True
    end
    object cdsCheckConfCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
      Visible = False
    end
    object cdsCheckConfTIPO_CONSULTA: TStringField
      FieldName = 'TIPO_CONSULTA'
      Size = 50
    end
    object cdsCheckConfIDPL_CHECKCHECK: TStringField
      FieldName = 'IDPL_CHECKCHECK'
    end
    object cdsCheckConfCDACESSO_CHECKCHECK: TStringField
      FieldName = 'CDACESSO_CHECKCHECK'
    end
    object cdsCheckConfPWS_CHECKCHECK: TStringField
      FieldName = 'PWS_CHECKCHECK'
    end
    object cdsCheckConfATIVO: TIntegerField
      FieldName = 'ATIVO'
      Visible = False
    end
  end
  object dsCheckConf: TDataSource
    DataSet = cdsCheckConf
    Left = 966
    Top = 410
  end
  object qrConsCliente: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransClientes
    SQL.Strings = (
      'select COD_CLIENTE, NOME_CLIENTE, RAZAO'
      ' from CLIENTES where COD_CLIENTE=0')
    Left = 1080
    Top = 279
  end
  object dspConsCliente: TDataSetProvider
    DataSet = qrConsCliente
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1080
    Top = 324
  end
  object cdsConsCliente: TClientDataSet
    Aggregates = <>
    DisableStringTrim = True
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspConsCliente'
    BeforeOpen = CdsClientesBeforeOpen
    Left = 1080
    Top = 369
    object cdsConsClienteCOD_CLIENTE: TIntegerField
      FieldName = 'COD_CLIENTE'
      Required = True
    end
    object cdsConsClienteNOME_CLIENTE: TStringField
      FieldName = 'NOME_CLIENTE'
      Required = True
      Size = 35
    end
    object cdsConsClienteRAZAO: TStringField
      FieldName = 'RAZAO'
      Required = True
      Size = 60
    end
  end
  object dsConsCliente: TDataSource
    DataSet = cdsConsCliente
    Left = 1078
    Top = 410
  end
  object qrGeradorColaborador: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransClientes
    SQL.Strings = (
      'select COD_VENDEDOR, NOME_VENDEDOR FROM COLABORADOR '
      'WHERE COD_EMPRESA = 0')
    Left = 1320
    Top = 279
  end
  object dspGeradorColaborador: TDataSetProvider
    DataSet = qrGeradorColaborador
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1320
    Top = 324
  end
  object cdsGeradorColaborador: TClientDataSet
    Aggregates = <>
    DisableStringTrim = True
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspGeradorColaborador'
    BeforeOpen = CdsClientesBeforeOpen
    Left = 1320
    Top = 369
    object cdsGeradorColaboradorCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
      Required = True
    end
    object cdsGeradorColaboradorNOME_VENDEDOR: TStringField
      FieldName = 'NOME_VENDEDOR'
      Size = 35
    end
  end
  object dsGeradorColaborador: TDataSource
    DataSet = cdsGeradorColaborador
    Left = 1318
    Top = 410
  end
  object qrGeradorSugGrupoOS: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransClientes
    SQL.Strings = (
      'SELECT codigo_subgr, descricao FROM SUB_GRUPO S'
      'WHERE ATIVO = 1')
    Left = 1448
    Top = 279
  end
  object dspGeradorSugGrupoOS: TDataSetProvider
    DataSet = qrGeradorSugGrupoOS
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1448
    Top = 324
  end
  object cdsGeradorSugGrupoOS: TClientDataSet
    Aggregates = <>
    DisableStringTrim = True
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspGeradorSugGrupoOS'
    BeforeOpen = CdsClientesBeforeOpen
    Left = 1448
    Top = 369
    object cdsGeradorSugGrupoOSCODIGO_SUBGR: TIntegerField
      FieldName = 'CODIGO_SUBGR'
      Required = True
    end
    object cdsGeradorSugGrupoOSDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 80
    end
  end
  object dsGeradorSugGrupoOS: TDataSource
    DataSet = cdsGeradorSugGrupoOS
    Left = 1446
    Top = 410
  end
  object qrGeradorStatusTMO: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransClientes
    SQL.Strings = (
      
        'select tp.cod_tipo, trim(tp.tipo_os) TIPO_OS, tp.descricao from ' +
        'tipo_vendas tp'
      'where tp.tipo = '#39'TMO'#39' order by tp.tipo_os')
    Left = 1576
    Top = 279
  end
  object dspGeradorStatusTMO: TDataSetProvider
    DataSet = qrGeradorStatusTMO
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1576
    Top = 324
  end
  object cdsGeradorStatusTMO: TClientDataSet
    Aggregates = <>
    DisableStringTrim = True
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspGeradorStatusTMO'
    BeforeOpen = CdsClientesBeforeOpen
    Left = 1576
    Top = 369
    object cdsGeradorStatusTMOCOD_TIPO: TIntegerField
      FieldName = 'COD_TIPO'
      Required = True
    end
    object cdsGeradorStatusTMOTIPO_OS: TStringField
      FieldName = 'TIPO_OS'
      Size = 10
    end
    object cdsGeradorStatusTMODESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 40
    end
  end
  object dsGeradorStatusTMO: TDataSource
    DataSet = cdsGeradorStatusTMO
    Left = 1574
    Top = 410
  end
  object qrFormasContratos: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransClientes
    Left = 920
    Top = 487
  end
  object dspFormasContratos: TDataSetProvider
    DataSet = qrFormasContratos
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 920
    Top = 532
  end
  object cdsFormasContratos: TClientDataSet
    Aggregates = <>
    DisableStringTrim = True
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspFormasContratos'
    BeforeOpen = CdsClientesBeforeOpen
    Left = 920
    Top = 577
  end
  object dsFormasContratos: TDataSource
    DataSet = cdsFormasContratos
    Left = 918
    Top = 618
  end
  object qrOrdemServContratos: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransClientes
    Left = 1048
    Top = 487
  end
  object dspOrdemServContratos: TDataSetProvider
    DataSet = qrOrdemServContratos
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1048
    Top = 532
  end
  object cdsOrdemServContratos: TClientDataSet
    Aggregates = <>
    DisableStringTrim = True
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspOrdemServContratos'
    BeforeOpen = CdsClientesBeforeOpen
    Left = 1048
    Top = 577
  end
  object dsOrdemServContratos: TDataSource
    DataSet = cdsOrdemServContratos
    Left = 1046
    Top = 618
  end
  object qrItensOrdemServContratos: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransClientes
    Left = 1192
    Top = 487
  end
  object dspItensOrdemServContratos: TDataSetProvider
    DataSet = qrItensOrdemServContratos
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1192
    Top = 532
  end
  object cdsItensOrdemServContratos: TClientDataSet
    Aggregates = <>
    DisableStringTrim = True
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspItensOrdemServContratos'
    BeforeOpen = CdsClientesBeforeOpen
    Left = 1192
    Top = 577
  end
  object dsItensOrdemServContratos: TDataSource
    DataSet = cdsItensOrdemServContratos
    Left = 1190
    Top = 618
  end
  object qrBoletasContratos: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransClientes
    Left = 1336
    Top = 487
  end
  object dspBoletasContratos: TDataSetProvider
    DataSet = qrBoletasContratos
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1336
    Top = 532
  end
  object cdsBoletasContratos: TClientDataSet
    Aggregates = <>
    DisableStringTrim = True
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspBoletasContratos'
    BeforeOpen = CdsClientesBeforeOpen
    Left = 1336
    Top = 577
  end
  object dsBoletasContratos: TDataSource
    DataSet = cdsBoletasContratos
    Left = 1334
    Top = 618
  end
  object qrGeradorOS: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransClientes
    SQL.Strings = (
      
        'SELECT GERADOR_OSBOL.*, OPERADOR.NOME_VENDEDOR AS NOME_OPERADOR,' +
        ' COLABORADOR.NOME_VENDEDOR, SUB_GRUPO.DESCRICAO FROM GERADOR_OSB' +
        'OL'
      
        'LEFT JOIN COLABORADOR OPERADOR ON OPERADOR.COD_VENDEDOR = GERADO' +
        'R_OSBOL.COD_OP_CXL AND OPERADOR.COD_EMPRESA = GERADOR_OSBOL.COD_' +
        'EMPRESA'
      
        'LEFT JOIN COLABORADOR ON COLABORADOR.COD_VENDEDOR = GERADOR_OSBO' +
        'L.COD_VENDEDOR AND COLABORADOR.COD_EMPRESA = GERADOR_OSBOL.COD_E' +
        'MPRESA'
      
        'LEFT JOIN SUB_GRUPO ON SUB_GRUPO.CODIGO_SUBGR = GERADOR_OSBOL.CO' +
        'D_SUB_GRUPO'
      'WHERE GERADOR_OSBOL.COD_EMPRESA = 1')
    Left = 1416
    Top = 55
  end
  object dspGeradorOS: TDataSetProvider
    DataSet = qrGeradorOS
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1416
    Top = 100
  end
  object cdsGeradorOS: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspGeradorOS'
    BeforeOpen = CdsClientesBeforeOpen
    Left = 1416
    Top = 145
    object cdsGeradorOSCOD_GERADOR: TIntegerField
      DisplayLabel = 'Cod Gerador'
      FieldName = 'COD_GERADOR'
      Required = True
    end
    object cdsGeradorOSCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
      Visible = False
    end
    object cdsGeradorOSSTATUS_GERADOR: TStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS_GERADOR'
      Size = 10
    end
    object cdsGeradorOSDATA_BASE_DOC: TDateTimeField
      DisplayLabel = 'Data Base Gerador'
      FieldName = 'DATA_BASE_DOC'
      Required = True
    end
    object cdsGeradorOSDATA_GERADOR: TDateTimeField
      DisplayLabel = 'Data Cad'
      FieldName = 'DATA_GERADOR'
      Required = True
    end
    object cdsGeradorOSMES_VENCIMENTO: TIntegerField
      DisplayLabel = 'Mes Venc'
      FieldName = 'MES_VENCIMENTO'
    end
    object cdsGeradorOSANO_VENCIMENTO: TIntegerField
      DisplayLabel = 'Ano Venc'
      FieldName = 'ANO_VENCIMENTO'
    end
    object cdsGeradorOSDIA_FATURAMENTO_INI: TIntegerField
      DisplayLabel = 'Dia Fat Ini'
      FieldName = 'DIA_FATURAMENTO_INI'
    end
    object cdsGeradorOSDIA_FATURAMENTO_FIM: TIntegerField
      DisplayLabel = 'Dia Fat Fim'
      FieldName = 'DIA_FATURAMENTO_FIM'
    end
    object cdsGeradorOSNOME_OPERADOR: TStringField
      DisplayLabel = 'Operador CXL'
      FieldName = 'NOME_OPERADOR'
      Size = 35
    end
    object cdsGeradorOSNOME_VENDEDOR: TStringField
      DisplayLabel = 'Colaborador'
      FieldName = 'NOME_VENDEDOR'
      Size = 35
    end
    object cdsGeradorOSDESCRICAO: TStringField
      DisplayLabel = 'Sub Grupo'
      FieldName = 'DESCRICAO'
      Size = 80
    end
    object cdsGeradorOSSTATUS_TMO: TStringField
      DisplayLabel = 'Status TMO'
      FieldName = 'STATUS_TMO'
      Size = 40
    end
    object cdsGeradorOSUTILIZA_CXL: TStringField
      DisplayLabel = 'Utiliza CXL'
      FieldName = 'UTILIZA_CXL'
      FixedChar = True
      Size = 1
    end
    object cdsGeradorOSGERAR_BOLETO: TStringField
      DisplayLabel = 'Gerar Boleto'
      FieldName = 'GERAR_BOLETO'
      FixedChar = True
      Size = 1
    end
    object cdsGeradorOSGERAR_BOLETO_PROD_SERV: TStringField
      DisplayLabel = 'Gerar boleto para cada tipo (Prod / Serv)'
      FieldName = 'GERAR_BOLETO_PROD_SERV'
      FixedChar = True
      Size = 1
    end
    object cdsGeradorOSAGRUPAR_CONTR: TStringField
      DisplayLabel = 'Agrupar Contratos'
      FieldName = 'AGRUPAR_CONTR'
      FixedChar = True
      Size = 1
    end
    object cdsGeradorOSDESCONS_CTRL: TStringField
      DisplayLabel = 'Desconsidera Regra Ctr'
      FieldName = 'DESCONS_CTRL'
      FixedChar = True
      Size = 1
    end
    object cdsGeradorOSCOD_OP_CXL: TIntegerField
      DisplayLabel = 'Op CXL'
      FieldName = 'COD_OP_CXL'
    end
    object cdsGeradorOSCOD_VENDEDOR: TIntegerField
      DisplayLabel = 'Cod Colaborador'
      FieldName = 'COD_VENDEDOR'
    end
    object cdsGeradorOSCOD_SUB_GRUPO: TIntegerField
      DisplayLabel = 'Cod Sub Grupo'
      FieldName = 'COD_SUB_GRUPO'
    end
    object cdsGeradorOSVALOR_GERADOR: TFloatField
      DisplayLabel = 'Valor Todos Contratos'
      FieldName = 'VALOR_GERADOR'
      currency = True
    end
    object cdsGeradorOSVALOR_GERADO: TFloatField
      DisplayLabel = 'Valor Contratos Gerados'
      FieldName = 'VALOR_GERADO'
      currency = True
    end
    object cdsGeradorOSVALOR_BOL_GERADOR: TFloatField
      DisplayLabel = 'Valor Todas Boletas'
      FieldName = 'VALOR_BOL_GERADOR'
      currency = True
    end
    object cdsGeradorOSVALOR_BOL_GERADO: TFloatField
      DisplayLabel = 'Valor Boletas Geradas'
      FieldName = 'VALOR_BOL_GERADO'
      currency = True
    end
    object cdsGeradorOSQTDE_GERADOR: TIntegerField
      DisplayLabel = 'Qtde Todos Contratos'
      FieldName = 'QTDE_GERADOR'
    end
    object cdsGeradorOSQTDE_GERADO: TIntegerField
      DisplayLabel = 'Qtde Contratos Gerados'
      FieldName = 'QTDE_GERADO'
    end
    object cdsGeradorOSVINDI: TStringField
      Tag = 1
      DisplayLabel = 'Pag Online'
      FieldName = 'VINDI'
      FixedChar = True
      Size = 1
    end
  end
  object dsGeradorOS: TDataSource
    DataSet = cdsGeradorOS
    Left = 1414
    Top = 186
  end
  object qrEnviarContratosClientes: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransClientes
    SQL.Strings = (
      'SELECT '
      'VW_CONTRATOS_CL.COD_GERADOR, '
      'VW_CONTRATOS_CL.COD_EMPRESA,'
      'VW_CONTRATOS_CL.NPED, '
      'VW_CONTRATOS_CL.TIPO,'
      'VW_CONTRATOS_CL.DATA_PED, '
      'VW_CONTRATOS_CL.DATA_FECH, '
      'VW_CONTRATOS_CL.DATVENC,'
      'VW_CONTRATOS_CL.VALOR_TOTAL, '
      'VW_CONTRATOS_CL.TOT_ACRESCIMO,'
      'VW_CONTRATOS_CL.TOT_DESCONTO,'
      'VW_CONTRATOS_CL.TOT_PROD,'
      'VW_CONTRATOS_CL.TOT_SERV, '
      'VW_CONTRATOS_CL.TOT_PROD_TERC, '
      'VW_CONTRATOS_CL.TOT_SERV_TERC,'
      'VW_CONTRATOS_CL.TOT_FORMPAG, '
      'VW_CONTRATOS_CL.TOT_BOLETAS,'
      'VW_CONTRATOS_CL.STATUS_PED, '
      'VW_CONTRATOS_CL.TIPO_OS, '
      'VW_CONTRATOS_CL.GERAR_NFS, '
      'VW_CONTRATOS_CL.GERAR_NF, '
      'VW_CONTRATOS_CL.GERAR_REC_LOC, '
      'VW_CONTRATOS_CL.GERAR_BOLETO,'
      'VW_CONTRATOS_CL.COD_RPS, '
      'VW_CONTRATOS_CL.NUM_NFS,'
      'VW_CONTRATOS_CL.SERIE_NFS, '
      'VW_CONTRATOS_CL.DATA_NFS, '
      'VW_CONTRATOS_CL.SITUACAO_NFS,'
      'VW_CONTRATOS_CL.DESCRICAOERRO_NFS,'
      'VW_CONTRATOS_CL.DATA_EMAIL_NFS,'
      'VW_CONTRATOS_CL.DATA_WHATSAPP_NFS,'
      'VW_CONTRATOS_CL.COD_NF, '
      'VW_CONTRATOS_CL.NUM_NF,'
      'VW_CONTRATOS_CL.SERIE_NF, '
      'VW_CONTRATOS_CL.DATA_NF, '
      'VW_CONTRATOS_CL.SITUACAO_NF, '
      'VW_CONTRATOS_CL.DESCRICAOERRO_NF,'
      'VW_CONTRATOS_CL.DATA_EMAIL_NF,'
      'VW_CONTRATOS_CL.DATA_WHATSAPP_NF,'
      'VW_CONTRATOS_CL.COD_CONTRATO, '
      'VW_CONTRATOS_CL.DESCR_CONTRATO, '
      'VW_CONTRATOS_CL.COD_CLIENTE, '
      'VW_CONTRATOS_CL.NOME_CLIENTE, '
      'VW_CONTRATOS_CL.RAZAO,'
      'VW_CONTRATOS_CL.CPFCGC, '
      'VW_CONTRATOS_CL.FONE_CLIENTE,'
      'VW_CONTRATOS_CL.FONE_CELULAR,'
      'VW_CONTRATOS_CL.EMAIL,'
      'VW_CONTRATOS_CL.CODIGO_UF,'
      'VW_CONTRATOS_CL.SIGLA_UF,'
      'VW_CONTRATOS_CL.COD_CIDADE,'
      'VW_CONTRATOS_CL.NOME_CIDADE,'
      'VW_CONTRATOS_CL.COD_BAIRRO,'
      'VW_CONTRATOS_CL.NOME_BAIRRO,'
      'VW_CONTRATOS_CL.CEP,'
      'VW_CONTRATOS_CL.ENDERECO,'
      'VW_CONTRATOS_CL.NUM_END_CLIENTE,'
      'VW_CONTRATOS_CL.N_SEQ_BOL, '
      'VW_CONTRATOS_CL.NOSSO_NUMERO_BANCO,'
      'VW_CONTRATOS_CL.DATA_REMESSA,'
      'VW_CONTRATOS_CL.COD_COBREBEM, '
      'VW_CONTRATOS_CL.COD_CONTROLE_CX,'
      'VW_CONTRATOS_CL.DATA_EMAIL_BOL,'
      'VW_CONTRATOS_CL.DATA_WHATSAPP_BOL,'
      'VW_CONTRATOS_CL.DATA_EMAIL_REC,'
      'VW_CONTRATOS_CL.DATA_WHATSAPP_REC,'
      'VW_CONTRATOS_CL.LOCACAO, VW_CONTRATOS_CL.FATURA_VINDI_ID,'
      'VW_CONTRATOS_CL.PEND_NFS,'
      'VW_CONTRATOS_CL.PEND_NF,'
      'VW_CONTRATOS_CL.PEND_REC_LOC,'
      'VW_CONTRATOS_CL.PEND_BOLETO FROM VW_CONTRATOS_CL'
      'WHERE VW_CONTRATOS_CL.COD_GERADOR =  :COD_GERADOR'
      'AND VW_CONTRATOS_CL.COD_EMPRESA =  :COD_EMPRESA'
      'AND VW_CONTRATOS_CL.TIPO = '#39'OS'#39' ')
    Left = 1528
    Top = 55
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'COD_GERADOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'COD_EMPRESA'
        ParamType = ptUnknown
      end>
  end
  object dspEnviarContratosClientes: TDataSetProvider
    DataSet = qrEnviarContratosClientes
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1528
    Top = 100
  end
  object cdsEnviarContratosClientes: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspEnviarContratosClientes'
    BeforeOpen = CdsClientesBeforeOpen
    Left = 1528
    Top = 145
    object cdsEnviarContratosClientesSEL: TStringField
      DisplayLabel = 'Sel'
      FieldKind = fkInternalCalc
      FieldName = 'SEL'
      Size = 1
    end
    object cdsEnviarContratosClientesCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
      Visible = False
    end
    object cdsEnviarContratosClientesNPED: TIntegerField
      DisplayLabel = 'Num OS'
      FieldName = 'NPED'
      Required = True
    end
    object cdsEnviarContratosClientesDATA_PED: TDateTimeField
      DisplayLabel = 'Data OS'
      FieldName = 'DATA_PED'
    end
    object cdsEnviarContratosClientesDATA_FECH: TDateTimeField
      DisplayLabel = 'Data Fech'
      FieldName = 'DATA_FECH'
    end
    object cdsEnviarContratosClientesDATVENC: TDateTimeField
      DisplayLabel = 'Data Vencimento'
      FieldName = 'DATVENC'
    end
    object cdsEnviarContratosClientesVALOR_TOTAL: TFloatField
      DisplayLabel = 'Valor Total'
      FieldName = 'VALOR_TOTAL'
      currency = True
    end
    object cdsEnviarContratosClientesTOT_ACRESCIMO: TFloatField
      DisplayLabel = 'Total Acrescimo'
      FieldName = 'TOT_ACRESCIMO'
      ReadOnly = True
      currency = True
    end
    object cdsEnviarContratosClientesTOT_DESCONTO: TFloatField
      DisplayLabel = 'Total Desconto'
      FieldName = 'TOT_DESCONTO'
      ReadOnly = True
      currency = True
    end
    object cdsEnviarContratosClientesTOT_PROD: TFloatField
      DisplayLabel = 'Total Produtos'
      FieldName = 'TOT_PROD'
      currency = True
    end
    object cdsEnviarContratosClientesTOT_SERV: TFloatField
      DisplayLabel = 'Total Servicos'
      FieldName = 'TOT_SERV'
      currency = True
    end
    object cdsEnviarContratosClientesTOT_FORMPAG: TFloatField
      DisplayLabel = 'Total Form Pag'
      FieldName = 'TOT_FORMPAG'
      currency = True
    end
    object cdsEnviarContratosClientesTOT_BOLETAS: TFloatField
      DisplayLabel = 'Total Boletas'
      FieldName = 'TOT_BOLETAS'
      ReadOnly = True
      currency = True
    end
    object cdsEnviarContratosClientesSTATUS_PED: TStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS_PED'
      Size = 10
    end
    object cdsEnviarContratosClientesTIPO_OS: TStringField
      DisplayLabel = 'Tipo OS'
      FieldName = 'TIPO_OS'
      Size = 40
    end
    object cdsEnviarContratosClientesDESCR_CONTRATO: TStringField
      DisplayLabel = 'Contrato'
      FieldName = 'DESCR_CONTRATO'
      Size = 75
    end
    object cdsEnviarContratosClientesCOD_CLIENTE: TIntegerField
      DisplayLabel = 'Cod Cliente'
      FieldName = 'COD_CLIENTE'
    end
    object cdsEnviarContratosClientesNOME_CLIENTE: TStringField
      DisplayLabel = 'Nome Cliente'
      FieldName = 'NOME_CLIENTE'
      Required = True
      FixedChar = True
      Size = 35
    end
    object cdsEnviarContratosClientesRAZAO: TStringField
      DisplayLabel = 'Razao Cliente'
      FieldName = 'RAZAO'
      Required = True
      Size = 60
    end
    object cdsEnviarContratosClientesCPFCGC: TStringField
      DisplayLabel = 'CPF / CNPJ'
      FieldName = 'CPFCGC'
      Size = 18
    end
    object cdsEnviarContratosClientesFONE_CLIENTE: TStringField
      DisplayLabel = 'Fone'
      FieldName = 'FONE_CLIENTE'
      FixedChar = True
      Size = 13
    end
    object cdsEnviarContratosClientesFONE_CELULAR: TStringField
      DisplayLabel = 'Celular'
      FieldName = 'FONE_CELULAR'
      FixedChar = True
      Size = 13
    end
    object cdsEnviarContratosClientesEMAIL: TStringField
      DisplayLabel = 'Email'
      FieldName = 'EMAIL'
      Size = 256
    end
    object cdsEnviarContratosClientesSIGLA_UF: TStringField
      DisplayLabel = 'UF'
      FieldName = 'SIGLA_UF'
      FixedChar = True
      Size = 2
    end
    object cdsEnviarContratosClientesNOME_CIDADE: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'NOME_CIDADE'
      Size = 30
    end
    object cdsEnviarContratosClientesNOME_BAIRRO: TStringField
      DisplayLabel = 'Bairro'
      FieldName = 'NOME_BAIRRO'
      Size = 30
    end
    object cdsEnviarContratosClientesCEP: TStringField
      DisplayLabel = 'Cep'
      FieldName = 'CEP'
      FixedChar = True
      Size = 9
    end
    object cdsEnviarContratosClientesENDERECO: TStringField
      DisplayLabel = 'Endereco'
      FieldName = 'ENDERECO'
      Size = 50
    end
    object cdsEnviarContratosClientesNUM_END_CLIENTE: TStringField
      DisplayLabel = 'Numero'
      FieldName = 'NUM_END_CLIENTE'
      Size = 60
    end
    object cdsEnviarContratosClientesTOT_PROD_TERC: TFloatField
      DisplayLabel = 'Total Produtos Terc'
      FieldName = 'TOT_PROD_TERC'
      currency = True
    end
    object cdsEnviarContratosClientesTOT_SERV_TERC: TFloatField
      DisplayLabel = 'Total Servicos Terc'
      FieldName = 'TOT_SERV_TERC'
      currency = True
    end
    object cdsEnviarContratosClientesN_SEQ_BOL: TStringField
      DisplayLabel = 'Num Seq Boleto'
      FieldName = 'N_SEQ_BOL'
      Size = 22
    end
    object cdsEnviarContratosClientesNOSSO_NUMERO_BANCO: TStringField
      DisplayLabel = 'Nosso Numero'
      FieldName = 'NOSSO_NUMERO_BANCO'
      Size = 44
    end
    object cdsEnviarContratosClientesDATA_REMESSA: TDateTimeField
      DisplayLabel = 'Data Remessa'
      FieldName = 'DATA_REMESSA'
    end
    object cdsEnviarContratosClientesCOD_COBREBEM: TIntegerField
      DisplayLabel = 'Cod Convenio'
      FieldName = 'COD_COBREBEM'
    end
    object cdsEnviarContratosClientesCOD_CONTROLE_CX: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Controle'
      FieldName = 'COD_CONTROLE_CX'
      Visible = False
    end
    object cdsEnviarContratosClientesTIPO: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Required = True
      FixedChar = True
      Size = 3
    end
    object cdsEnviarContratosClientesCOD_CONTRATO: TIntegerField
      DisplayLabel = 'Cod Contrato'
      FieldName = 'COD_CONTRATO'
    end
    object cdsEnviarContratosClientesCOD_RPS: TStringField
      DisplayLabel = 'Cod RPS'
      FieldName = 'COD_RPS'
      Size = 100
    end
    object cdsEnviarContratosClientesNUM_NFS: TStringField
      DisplayLabel = 'Num NFS'
      FieldName = 'NUM_NFS'
      Size = 100
    end
    object cdsEnviarContratosClientesSERIE_NFS: TStringField
      DisplayLabel = 'Serie NFS'
      FieldName = 'SERIE_NFS'
      Size = 5
    end
    object cdsEnviarContratosClientesDATA_NFS: TDateTimeField
      DisplayLabel = 'Data NFS'
      FieldName = 'DATA_NFS'
    end
    object cdsEnviarContratosClientesSITUACAO_NFS: TStringField
      DisplayLabel = 'Situacao NFS'
      FieldName = 'SITUACAO_NFS'
      Size = 100
    end
    object cdsEnviarContratosClientesDESCRICAOERRO_NFS: TStringField
      DisplayLabel = 'Mensagem NFS'
      FieldName = 'DESCRICAOERRO_NFS'
      Size = 1000
    end
    object cdsEnviarContratosClientesCOD_NF: TIntegerField
      DisplayLabel = 'Cod NF'
      FieldName = 'COD_NF'
    end
    object cdsEnviarContratosClientesNUM_NF: TLargeintField
      DisplayLabel = 'Num NF'
      FieldName = 'NUM_NF'
    end
    object cdsEnviarContratosClientesSERIE_NF: TStringField
      DisplayLabel = 'Serie NF'
      FieldName = 'SERIE_NF'
      Size = 5
    end
    object cdsEnviarContratosClientesDATA_NF: TDateTimeField
      DisplayLabel = 'Data NF'
      FieldName = 'DATA_NF'
    end
    object cdsEnviarContratosClientesSITUACAO_NF: TStringField
      DisplayLabel = 'Situacao NF'
      FieldName = 'SITUACAO_NF'
      Size = 100
    end
    object cdsEnviarContratosClientesDESCRICAOERRO_NF: TStringField
      DisplayLabel = 'Mensagem NF'
      FieldName = 'DESCRICAOERRO_NF'
      Size = 1000
    end
    object cdsEnviarContratosClientesDATA_EMAIL_NFS: TDateTimeField
      DisplayLabel = 'Data Email NFS'
      FieldName = 'DATA_EMAIL_NFS'
    end
    object cdsEnviarContratosClientesDATA_WHATSAPP_NFS: TDateTimeField
      DisplayLabel = 'Data WhatsApp NFS'
      FieldName = 'DATA_WHATSAPP_NFS'
    end
    object cdsEnviarContratosClientesDATA_EMAIL_NF: TDateTimeField
      DisplayLabel = 'Data Email NF'
      FieldName = 'DATA_EMAIL_NF'
    end
    object cdsEnviarContratosClientesDATA_WHATSAPP_NF: TDateTimeField
      DisplayLabel = 'Data WhatsApp NF'
      FieldName = 'DATA_WHATSAPP_NF'
    end
    object cdsEnviarContratosClientesDATA_EMAIL_BOL: TDateTimeField
      DisplayLabel = 'Data Email Bol'
      FieldName = 'DATA_EMAIL_BOL'
    end
    object cdsEnviarContratosClientesDATA_WHATSAPP_BOL: TDateTimeField
      DisplayLabel = 'Data WhatsApp Bol'
      FieldName = 'DATA_WHATSAPP_BOL'
    end
    object cdsEnviarContratosClientesDATA_EMAIL_REC: TDateTimeField
      DisplayLabel = 'Data Email Loc'
      FieldName = 'DATA_EMAIL_REC'
    end
    object cdsEnviarContratosClientesDATA_WHATSAPP_REC: TDateTimeField
      DisplayLabel = 'Data WhatsApp Loc'
      FieldName = 'DATA_WHATSAPP_REC'
    end
    object cdsEnviarContratosClientesLOCACAO: TStringField
      DisplayLabel = 'Servico Locacao'
      FieldName = 'LOCACAO'
      FixedChar = True
      Size = 1
    end
    object cdsEnviarContratosClientesNFS: TStringField
      DisplayLabel = 'Gerar NFS'
      FieldName = 'GERAR_NFS'
      FixedChar = True
      Size = 1
    end
    object cdsEnviarContratosClientesNF: TStringField
      DisplayLabel = 'Gerar NF'
      FieldName = 'GERAR_NF'
      FixedChar = True
      Size = 1
    end
    object cdsEnviarContratosClientesREC_LOC: TStringField
      DisplayLabel = 'Gerar Recibo Locacao'
      FieldName = 'GERAR_REC_LOC'
      FixedChar = True
      Size = 1
    end
    object cdsEnviarContratosClientesBOLETO: TStringField
      DisplayLabel = 'Gerar Boleto'
      FieldName = 'GERAR_BOLETO'
      FixedChar = True
      Size = 1
    end
    object cdsEnviarContratosClientesCOD_GERADOR: TIntegerField
      DisplayLabel = 'Cod Gerador'
      FieldName = 'COD_GERADOR'
    end
    object cdsEnviarContratosClientesCODIGO_UF: TIntegerField
      DisplayLabel = 'Cod UF'
      FieldName = 'CODIGO_UF'
    end
    object cdsEnviarContratosClientesCOD_CIDADE: TSmallintField
      DisplayLabel = 'Cod Cidade'
      FieldName = 'COD_CIDADE'
    end
    object cdsEnviarContratosClientesCOD_BAIRRO: TSmallintField
      DisplayLabel = 'Cod Bairro'
      FieldName = 'COD_BAIRRO'
    end
    object cdsEnviarContratosClientesPEND_NFS: TStringField
      DisplayLabel = 'Pend NFS'
      FieldName = 'PEND_NFS'
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object cdsEnviarContratosClientesPEND_NF: TStringField
      DisplayLabel = 'Pend NF'
      FieldName = 'PEND_NF'
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object cdsEnviarContratosClientesPEND_REC_LOC: TStringField
      DisplayLabel = 'Pend Rec Loc'
      FieldName = 'PEND_REC_LOC'
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object cdsEnviarContratosClientesPEND_BOLETO: TStringField
      DisplayLabel = 'Pend Boleto'
      FieldName = 'PEND_BOLETO'
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object cdsEnviarContratosClientesFATURA_VINDI_ID: TLargeintField
      DisplayLabel = 'Fatura Id'
      FieldName = 'FATURA_VINDI_ID'
    end
  end
  object dsEnviarContratosClientes: TDataSource
    DataSet = cdsEnviarContratosClientes
    Left = 1526
    Top = 186
  end
  object qrContaCorrenteCli: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransClientes
    SQL.Strings = (
      'select * from conta_corrente_prog_fidelidade'
      'where cod_cliente = :cod_cliente and cod_empresa = :cod_empresa')
    Left = 1696
    Top = 279
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cod_cliente'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cod_empresa'
        ParamType = ptUnknown
      end>
  end
  object dspContaCorrenteCli: TDataSetProvider
    DataSet = qrContaCorrenteCli
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1696
    Top = 324
  end
  object cdsContaCorrenteCli: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspContaCorrenteCli'
    BeforeOpen = CdsClientesBeforeOpen
    Left = 1696
    Top = 369
    object cdsContaCorrenteCliCOD_EMP_RESP: TIntegerField
      Tag = 3
      DisplayLabel = 'Empresa'
      FieldName = 'COD_EMP_RESP'
    end
    object cdsContaCorrenteCliCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsContaCorrenteCliCOD_CLIENTE: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Cliente'
      FieldName = 'COD_CLIENTE'
      Required = True
    end
    object cdsContaCorrenteCliTIPO: TStringField
      Tag = 3
      DisplayLabel = 'Natureza'
      FieldName = 'TIPO'
      Required = True
      Size = 10
    end
    object cdsContaCorrenteCliDESCRICAO: TStringField
      Tag = 2
      DisplayLabel = 'Historico'
      FieldName = 'DESCRICAO'
      Size = 100
    end
    object cdsContaCorrenteCliDATA: TDateTimeField
      Tag = 2
      DisplayLabel = 'Data'
      FieldName = 'DATA'
    end
    object cdsContaCorrenteCliPONTOS: TFloatField
      DisplayLabel = 'Pontos'
      FieldName = 'PONTOS'
    end
    object cdsContaCorrenteCliVALOR: TFloatField
      Tag = 3
      DisplayLabel = 'Valor'
      FieldName = 'VALOR'
      currency = True
    end
    object cdsContaCorrenteCliNDOC: TIntegerField
      DisplayLabel = 'Num Doc'
      FieldName = 'NDOC'
    end
    object cdsContaCorrenteCliTIPODOC: TStringField
      DisplayLabel = 'Tipo Doc'
      FieldName = 'TIPODOC'
      FixedChar = True
      Size = 3
    end
    object cdsContaCorrenteCliDATA_VENC_PROG: TDateTimeField
      DisplayLabel = 'Data Vencimento'
      FieldName = 'DATA_VENC_PROG'
    end
    object cdsContaCorrenteCliPERC_PRG_FID: TFloatField
      Tag = 3
      DisplayLabel = 'Perc Conversao'
      FieldName = 'PERC_PROG_FID'
    end
    object cdsContaCorrenteCliVALOR_OP: TFloatField
      Tag = 1
      DisplayLabel = 'Valor Op'
      FieldName = 'VALOR_OP'
      currency = True
    end
    object cdsContaCorrenteCliCOD_TAXA_PROG_FID: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Simulacao'
      FieldName = 'COD_TAXA_PROG_FID'
      Required = True
    end
    object cdsContaCorrenteCliCODIGO: TIntegerField
      Tag = 3
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO'
      Required = True
    end
    object cdsContaCorrenteCliJSONCLASSES: TMemoField
      Tag = 3
      DisplayLabel = 'JSON'
      FieldName = 'JSONCLASSES'
      OnGetText = cdsContaCorrenteCliJSONCLASSESGetText
      BlobType = ftMemo
      Size = 8
    end
    object cdsContaCorrenteCliVALORDOC: TFloatField
      Tag = 1
      DisplayLabel = 'Valor Doc'
      FieldName = 'VALORDOC'
    end
    object cdsContaCorrenteCliVALORDEV: TFloatField
      Tag = 1
      DisplayLabel = 'Valor Dev'
      FieldName = 'VALORDEV'
    end
    object cdsContaCorrenteCliCOD_EMP_DEST: TIntegerField
      Tag = 1
      DisplayLabel = 'Emp Dest'
      FieldName = 'COD_EMP_DEST'
    end
    object cdsContaCorrenteCliCOD_CLIENTE_DEST: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Cliente Dest'
      FieldName = 'COD_CLIENTE_DEST'
    end
    object cdsContaCorrenteCliDATA_LANC: TDateTimeField
      Tag = 3
      DisplayLabel = 'Data Cad'
      FieldName = 'DATA_LANC'
    end
    object cdsContaCorrenteCliPENDENTE: TStringField
      Tag = 1
      DisplayLabel = 'Pedente'
      FieldName = 'PENDENTE'
      FixedChar = True
      Size = 1
    end
    object cdsContaCorrenteCliVALE: TStringField
      Tag = 1
      DisplayLabel = 'Vale'
      FieldName = 'VALE'
      FixedChar = True
      Size = 1
    end
    object cdsContaCorrenteCliCOD_DEV: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Dev'
      FieldName = 'COD_DEV'
      Visible = False
    end
    object cdsContaCorrenteCliTIPO_DEV: TStringField
      Tag = 1
      DisplayLabel = 'Tipo Dev'
      FieldName = 'TIPO_DEV'
      Visible = False
      FixedChar = True
      Size = 3
    end
    object cdsContaCorrenteCliVALORVALE: TFloatField
      Tag = 1
      DisplayLabel = 'Valor Vale'
      FieldName = 'VALORVALE'
      Visible = False
    end
    object cdsContaCorrenteCliNVALECUPOM: TStringField
      DisplayLabel = 'Num Vale'
      FieldName = 'NVALECUPOM'
      Size = 32
    end
    object cdsContaCorrenteCliERP_API: TStringField
      Tag = 1
      DisplayLabel = 'Origem'
      FieldName = 'ERP_API'
      FixedChar = True
      Size = 1
    end
    object cdsContaCorrenteCliENV_API: TStringField
      Tag = 3
      DisplayLabel = 'Env API'
      FieldName = 'ENV_API'
      FixedChar = True
      Size = 1
    end
    object cdsContaCorrenteCliCOD_EMP_TIPODOC: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Emp Doc'
      FieldName = 'COD_EMP_TIPODOC'
    end
  end
  object dsContaCorrenteCli: TDataSource
    DataSet = cdsContaCorrenteCli
    Left = 1694
    Top = 410
  end
  object qrRegrasValeTrocaProgFid: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransClientes
    SQL.Strings = (
      'select * from regras_vale_troca_prog_fid'
      'where cod_empresa = 1')
    Left = 1680
    Top = 55
  end
  object dspRegrasValeTrocaProgFid: TDataSetProvider
    DataSet = qrRegrasValeTrocaProgFid
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1680
    Top = 100
  end
  object cdsRegrasValeTrocaProgFid: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspRegrasValeTrocaProgFid'
    BeforeOpen = CdsClientesBeforeOpen
    Left = 1680
    Top = 145
    object cdsRegrasValeTrocaProgFidSEL: TStringField
      DisplayLabel = 'Sel'
      FieldKind = fkInternalCalc
      FieldName = 'SEL'
      Size = 1
    end
    object cdsRegrasValeTrocaProgFidCODIGO: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO'
      Required = True
    end
    object cdsRegrasValeTrocaProgFidCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsRegrasValeTrocaProgFidTIPO: TStringField
      Tag = 1
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      FixedChar = True
      Size = 10
    end
    object cdsRegrasValeTrocaProgFidPONTOS: TFloatField
      DisplayLabel = 'Pontos'
      FieldName = 'PONTOS'
    end
    object cdsRegrasValeTrocaProgFidVALOR: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VALOR'
    end
    object cdsRegrasValeTrocaProgFidNUM_FAB_PROD: TStringField
      DisplayLabel = 'Num Fabricante'
      FieldName = 'NUM_FAB_PROD'
      FixedChar = True
    end
    object cdsRegrasValeTrocaProgFidCOD_GRADE: TIntegerField
      DisplayLabel = 'Cod Grade'
      FieldName = 'COD_GRADE'
    end
    object cdsRegrasValeTrocaProgFidGRUPO_PROD: TIntegerField
      DisplayLabel = 'Grupo Prod'
      FieldName = 'GRUPO_PROD'
    end
    object cdsRegrasValeTrocaProgFidCOD_PROD: TStringField
      DisplayLabel = 'Cod Prod'
      FieldName = 'COD_PROD'
      FixedChar = True
      Size = 6
    end
    object cdsRegrasValeTrocaProgFidDESCR_PROD: TStringField
      DisplayLabel = 'Descricao'
      FieldName = 'DESCR_PROD'
      Size = 75
    end
    object cdsRegrasValeTrocaProgFidUS_CAD: TIntegerField
      FieldName = 'US_CAD'
    end
    object cdsRegrasValeTrocaProgFidDATA_CAD: TDateTimeField
      FieldName = 'DATA_CAD'
    end
    object cdsRegrasValeTrocaProgFidUS_MOD: TIntegerField
      FieldName = 'US_MOD'
    end
    object cdsRegrasValeTrocaProgFidDATA_MOD: TDateTimeField
      FieldName = 'DATA_MOD'
    end
    object cdsRegrasValeTrocaProgFidATIVO: TIntegerField
      FieldName = 'ATIVO'
    end
  end
  object dsRegrasValeTrocaProgFid: TDataSource
    DataSet = cdsRegrasValeTrocaProgFid
    Left = 1678
    Top = 186
  end
  object qrRegrasValeCompraProgFid: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransClientes
    SQL.Strings = (
      'select * from regras_vale_troca_prog_fid'
      'where cod_empresa = 1')
    Left = 1840
    Top = 55
  end
  object dspRegrasValeCompraProgFid: TDataSetProvider
    DataSet = qrRegrasValeCompraProgFid
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1840
    Top = 100
  end
  object cdsRegrasValeCompraProgFid: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspRegrasValeCompraProgFid'
    BeforeOpen = CdsClientesBeforeOpen
    Left = 1840
    Top = 145
    object IntegerField1: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO'
      Required = True
    end
    object IntegerField2: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object StringField1: TStringField
      Tag = 1
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      FixedChar = True
      Size = 10
    end
    object FloatField1: TFloatField
      DisplayLabel = 'Pontos'
      FieldName = 'PONTOS'
    end
    object FloatField2: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VALOR'
    end
    object StringField2: TStringField
      DisplayLabel = 'Num Fabricante'
      FieldName = 'NUM_FAB_PROD'
      FixedChar = True
    end
    object cdsRegrasValeCompraProgFidCOD_GRADE: TIntegerField
      DisplayLabel = 'Cod Grade'
      FieldName = 'COD_GRADE'
    end
    object IntegerField3: TIntegerField
      DisplayLabel = 'Grupo Prod'
      FieldName = 'GRUPO_PROD'
    end
    object StringField3: TStringField
      DisplayLabel = 'Cod Prod'
      FieldName = 'COD_PROD'
      FixedChar = True
      Size = 6
    end
    object StringField4: TStringField
      DisplayLabel = 'Descricao'
      FieldName = 'DESCR_PROD'
      Size = 75
    end
    object cdsRegrasValeCompraProgFidUS_CAD: TIntegerField
      Tag = 1
      FieldName = 'US_CAD'
    end
    object cdsRegrasValeCompraProgFidDATA_CAD: TDateTimeField
      Tag = 1
      FieldName = 'DATA_CAD'
    end
    object cdsRegrasValeCompraProgFidUS_MOD: TIntegerField
      Tag = 1
      FieldName = 'US_MOD'
    end
    object cdsRegrasValeCompraProgFidDATA_MOD: TDateTimeField
      Tag = 1
      FieldName = 'DATA_MOD'
    end
    object cdsRegrasValeCompraProgFidATIVO: TIntegerField
      Tag = 1
      FieldName = 'ATIVO'
    end
  end
  object dsRegrasValeCompraProgFid: TDataSource
    DataSet = cdsRegrasValeCompraProgFid
    Left = 1838
    Top = 186
  end
  object qrEmpresaContaCorrenteCli: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransClientes
    SQL.Strings = (
      
        'select cod_empresa, nome_emp, identificacao_emp, cgc_emp from EM' +
        'PRESA '
      'where cod_empresa <> 1'
      'order by cod_empresa ')
    Left = 1856
    Top = 279
  end
  object dspEmpresaContaCorrenteCli: TDataSetProvider
    DataSet = qrEmpresaContaCorrenteCli
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1856
    Top = 324
  end
  object cdsEmpresaContaCorrenteCli: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspEmpresaContaCorrenteCli'
    BeforeOpen = CdsClientesBeforeOpen
    Left = 1856
    Top = 369
    object cdsEmpresaContaCorrenteCliCOD_EMPRESA: TIntegerField
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsEmpresaContaCorrenteCliIDENTIFICACAO_EMP: TStringField
      DisplayLabel = 'Empresa'
      FieldName = 'IDENTIFICACAO_EMP'
      Size = 64
    end
    object cdsEmpresaContaCorrenteCliNOME_EMP: TStringField
      DisplayLabel = 'Empresa'
      FieldName = 'NOME_EMP'
      Size = 50
    end
    object cdsEmpresaContaCorrenteCliCGC_EMP: TStringField
      DisplayLabel = 'CNPJ/CPF'
      FieldName = 'CGC_EMP'
      Size = 18
    end
  end
  object dsEmpresaContaCorrenteCli: TDataSource
    DataSet = cdsEmpresaContaCorrenteCli
    Left = 1854
    Top = 410
  end
  object qrTransSaldoContaCorrente: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransClientes
    SQL.Strings = (
      'select cc.* from conta_corrente_prog_fidelidade cc'
      'where cc.cod_emp_dest = 1')
    Left = 2032
    Top = 279
  end
  object dspTransSaldoContaCorrente: TDataSetProvider
    DataSet = qrTransSaldoContaCorrente
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 2032
    Top = 324
  end
  object cdsTransSaldoContaCorrente: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspTransSaldoContaCorrente'
    BeforeOpen = CdsClientesBeforeOpen
    Left = 2032
    Top = 369
    object IntegerField4: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object IntegerField5: TIntegerField
      DisplayLabel = 'Cod Cliente'
      FieldName = 'COD_CLIENTE'
      Required = True
    end
    object StringField5: TStringField
      Tag = 3
      DisplayLabel = 'Natureza'
      FieldName = 'TIPO'
      Required = True
      Size = 10
    end
    object StringField6: TStringField
      DisplayLabel = 'Historico'
      FieldName = 'DESCRICAO'
      Size = 100
    end
    object DateTimeField1: TDateTimeField
      DisplayLabel = 'Data'
      FieldName = 'DATA'
    end
    object FloatField3: TFloatField
      DisplayLabel = 'Pontos'
      FieldName = 'PONTOS'
    end
    object FloatField4: TFloatField
      Tag = 3
      DisplayLabel = 'Valor'
      FieldName = 'VALOR'
      currency = True
    end
    object IntegerField6: TIntegerField
      DisplayLabel = 'Num Doc'
      FieldName = 'NDOC'
    end
    object StringField7: TStringField
      DisplayLabel = 'Tipo Doc'
      FieldName = 'TIPODOC'
      FixedChar = True
      Size = 3
    end
    object DateTimeField2: TDateTimeField
      DisplayLabel = 'Data Vencimento'
      FieldName = 'DATA_VENC_PROG'
    end
    object FloatField5: TFloatField
      Tag = 3
      DisplayLabel = 'Perc Conversao'
      FieldName = 'PERC_PROG_FID'
    end
    object FloatField6: TFloatField
      Tag = 1
      DisplayLabel = 'Valor Op'
      FieldName = 'VALOR_OP'
      currency = True
    end
    object IntegerField7: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Simulacao'
      FieldName = 'COD_TAXA_PROG_FID'
      Required = True
    end
    object IntegerField8: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO'
      Required = True
    end
    object MemoField1: TMemoField
      Tag = 3
      DisplayLabel = 'JSON'
      FieldName = 'JSONCLASSES'
      BlobType = ftMemo
      Size = 8
    end
    object FloatField7: TFloatField
      Tag = 1
      DisplayLabel = 'Valor Doc'
      FieldName = 'VALORDOC'
    end
    object FloatField8: TFloatField
      Tag = 1
      DisplayLabel = 'Valor Dev'
      FieldName = 'VALORDEV'
    end
    object IntegerField9: TIntegerField
      Tag = 1
      DisplayLabel = 'Emp Dest'
      FieldName = 'COD_EMP_DEST'
      Visible = False
    end
    object IntegerField10: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Cliente Dest'
      FieldName = 'COD_CLIENTE_DEST'
    end
    object StringField8: TStringField
      Tag = 1
      DisplayLabel = 'Pedente'
      FieldName = 'PENDENTE'
      FixedChar = True
      Size = 1
    end
  end
  object dsTransSaldoContaCorrente: TDataSource
    DataSet = cdsTransSaldoContaCorrente
    Left = 2030
    Top = 410
  end
  object qrEndDocAdd: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransClientes
    SQL.Strings = (
      'select * from clientes_end_doc_add'
      'where cod_cliente = 0 and cod_empresa = 0 and seqid = 0')
    Left = 1552
    Top = 487
  end
  object dspEndDocAdd: TDataSetProvider
    DataSet = qrEndDocAdd
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1552
    Top = 532
  end
  object cdsEndDocAdd: TClientDataSet
    Aggregates = <>
    DisableStringTrim = True
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspEndDocAdd'
    BeforeOpen = CdsClientesBeforeOpen
    Left = 1552
    Top = 577
    object cdsEndDocAddCOD_CLIENTE: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Cliente'
      FieldName = 'COD_CLIENTE'
      Required = True
    end
    object cdsEndDocAddCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsEndDocAddSEQID: TIntegerField
      DisplayLabel = 'Seq ID'
      FieldName = 'SEQID'
      Required = True
    end
    object cdsEndDocAddTIPO: TStringField
      Tag = 2
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 32
    end
    object cdsEndDocAddINSC_EST: TStringField
      DisplayLabel = 'Insc Estadual'
      FieldName = 'INSC_EST'
      Size = 14
    end
    object cdsEndDocAddINDIEDEST: TSmallintField
      DisplayLabel = 'Ind IE Destinatario'
      FieldName = 'INDIEDEST'
    end
    object cdsEndDocAddIDESTRANGEIRO: TStringField
      DisplayLabel = 'ID Estrangeiro'
      FieldName = 'IDESTRANGEIRO'
    end
    object cdsEndDocAddISUF: TStringField
      DisplayLabel = 'Insc Suframa'
      FieldName = 'ISUF'
      Size = 9
    end
    object cdsEndDocAddIM: TStringField
      DisplayLabel = 'Insc Municipal'
      FieldName = 'IM'
      Size = 15
    end
    object cdsEndDocAddEMAIL: TStringField
      DisplayLabel = 'email'
      FieldName = 'EMAIL'
      Size = 60
    end
    object cdsEndDocAddCEP: TStringField
      FieldName = 'CEP'
      Size = 8
    end
    object cdsEndDocAddXLGR: TStringField
      DisplayLabel = 'Logradouro'
      FieldName = 'XLGR'
      Size = 60
    end
    object cdsEndDocAddNRO: TStringField
      DisplayLabel = 'Numero'
      FieldName = 'NRO'
      Size = 60
    end
    object cdsEndDocAddXCPL: TStringField
      DisplayLabel = 'Complemento'
      FieldName = 'XCPL'
      Size = 60
    end
    object cdsEndDocAddXBAIRRO: TStringField
      DisplayLabel = 'Bairro'
      FieldName = 'XBAIRRO'
      Size = 60
    end
    object cdsEndDocAddCMUN: TIntegerField
      DisplayLabel = 'Cod IBGE Cidade'
      FieldName = 'CMUN'
    end
    object cdsEndDocAddXMUN: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'XMUN'
      Size = 60
    end
    object cdsEndDocAddUF: TStringField
      FieldName = 'UF'
      FixedChar = True
      Size = 2
    end
    object cdsEndDocAddCPAIS: TSmallintField
      DisplayLabel = 'Cod Pa'#237's'
      FieldName = 'CPAIS'
    end
    object cdsEndDocAddXPAIS: TStringField
      DisplayLabel = 'Pa'#237's'
      FieldName = 'XPAIS'
      Size = 60
    end
    object cdsEndDocAddFONE: TStringField
      DisplayLabel = 'Fone'
      FieldName = 'FONE'
      EditMask = '(99) 9999-9999;0;_'
      Size = 14
    end
    object cdsEndDocAddATIVO: TSmallintField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
    object cdsEndDocAddCOD_LOCALIDADE: TIntegerField
      DisplayLabel = 'Cod Localidade'
      FieldName = 'COD_LOCALIDADE'
    end
    object cdsEndDocAddCOD_CIDADE: TIntegerField
      DisplayLabel = 'Cod cidade'
      FieldName = 'COD_CIDADE'
    end
  end
  object dsEndDocAdd: TDataSource
    AutoEdit = False
    DataSet = cdsEndDocAdd
    Left = 1550
    Top = 618
  end
  object qrDocProgFid: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransClientes
    SQL.Strings = (
      
        'select pd.tipo, pd.nped ndoc, pd.data_ped data, pd.data_fech, pd' +
        '.tipv tipo_venda, pd.valor_total,'
      
        'pd.cod_vendedor, col.nome_vendedor, pd.cod_cliente, cl.nome_clie' +
        'nte, 0 formas  from pedvenda pd'
      
        'inner join colaborador col on col.cod_vendedor = pd.cod_vendedor' +
        ' and col.cod_empresa = pd.cod_empresa'
      
        'inner join clientes cl on cl.cod_cliente = pd.cod_cliente and cl' +
        '.cod_empresa = pd.cod_empresa'
      
        'where pd.tipo = '#39'REQ'#39' and pd.data_fech >= :dtini and pd.data_fec' +
        'h <= :dtfim'
      'and pd.cod_empresa = :cod_empresa and pd.status_ped = '#39'FECHADA'#39
      'union'
      
        'select pd.tipo, pd.nped ndoc, pd.data_ped data, pd.data_fech, pd' +
        '.tipo_os tipo_venda,  pd.valor_total,'
      
        'pd.cod_vendedor, col.nome_vendedor, pd.cod_cliente, cl.nome_clie' +
        'nte, 0 formas from pedvenda pd'
      
        'inner join colaborador col on col.cod_vendedor = pd.cod_vendedor' +
        ' and col.cod_empresa = pd.cod_empresa'
      
        'inner join clientes cl on cl.cod_cliente = pd.cod_cliente and cl' +
        '.cod_empresa = pd.cod_empresa'
      
        'where pd.tipo = '#39'OS'#39' and pd.data_fech >= :dtini and pd.data_fech' +
        ' <= :dtfim'
      'and pd.cod_empresa = :cod_empresa and pd.status_ped = '#39'FECHADA'#39
      'union'
      
        'select '#39'MOT'#39' tipo, cf.n_comando ndoc, cf.data_ven data, cf.data_' +
        'fech, cf.tipo_v tipo_venda,cf.valtot_v valor_total,'
      
        'cf.covend_v cod_vendedor, col.nome_vendedor, cf.clientes_v cod_c' +
        'liente, cl.nome_cliente, 0 formas from com_fat cf'
      
        'inner join colaborador col on col.cod_vendedor = cf.covend_v and' +
        ' col.cod_empresa = cf.cod_empresa'
      
        'inner join clientes cl on cl.cod_cliente = cf.clientes_v and cl.' +
        'cod_empresa = cf.cod_empresa'
      
        'where cf.natureza = '#39'S'#39' and cf.data_fech >= :dtini and cf.data_f' +
        'ech <= :dtfim'
      'and cf.cod_empresa = :cod_empresa and cf.status_v = '#39'FECHADO'#39)
    Left = 1448
    Top = 487
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'dtini'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dtfim'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cod_empresa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dtini'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dtfim'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cod_empresa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dtini'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dtfim'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cod_empresa'
        ParamType = ptUnknown
      end>
  end
  object dspDocProgFid: TDataSetProvider
    DataSet = qrDocProgFid
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1448
    Top = 532
  end
  object cdsDocProgFid: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspDocProgFid'
    BeforeOpen = CdsClientesBeforeOpen
    Left = 1448
    Top = 577
    object cdsDocProgFidTIPO: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Required = True
      FixedChar = True
      Size = 3
    end
    object cdsDocProgFidNDOC: TIntegerField
      DisplayLabel = 'Num Doc'
      FieldName = 'NDOC'
      Required = True
    end
    object cdsDocProgFidDATA: TDateTimeField
      DisplayLabel = 'Data'
      FieldName = 'DATA'
    end
    object cdsDocProgFidDATA_FECH: TDateTimeField
      DisplayLabel = 'Data Fech'
      FieldName = 'DATA_FECH'
    end
    object cdsDocProgFidTIPO_VENDA: TStringField
      DisplayLabel = 'Tipo Venda'
      FieldName = 'TIPO_VENDA'
      Size = 10
    end
    object cdsDocProgFidVALOR_TOTAL: TFloatField
      DisplayLabel = 'Valor Total'
      FieldName = 'VALOR_TOTAL'
    end
    object cdsDocProgFidCOD_VENDEDOR: TIntegerField
      DisplayLabel = 'Cod Vendedor'
      FieldName = 'COD_VENDEDOR'
    end
    object cdsDocProgFidNOME_VENDEDOR: TStringField
      DisplayLabel = 'Vendedor'
      FieldName = 'NOME_VENDEDOR'
      Size = 35
    end
    object cdsDocProgFidCOD_CLIENTE: TIntegerField
      DisplayLabel = 'Cod Cliente'
      FieldName = 'COD_CLIENTE'
    end
    object cdsDocProgFidNOME_CLIENTE: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'NOME_CLIENTE'
      Required = True
      FixedChar = True
      Size = 35
    end
    object cdsDocProgFidFORMAS: TIntegerField
      FieldName = 'FORMAS'
    end
  end
  object dsDocProgFid: TDataSource
    DataSet = cdsDocProgFid
    Left = 1446
    Top = 618
  end
  object qrRota: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IbTransRotas
    SQL.Strings = (
      'select * from rotas_entr where cod_rota = 0 and cod_empresa = 0')
    Left = 1640
    Top = 487
  end
  object dspRota: TDataSetProvider
    DataSet = qrRota
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1640
    Top = 532
  end
  object cdsRota: TClientDataSet
    Aggregates = <>
    DisableStringTrim = True
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspRota'
    BeforeOpen = CdsClientesBeforeOpen
    Left = 1640
    Top = 577
    object cdsRotaCOD_ROTA: TIntegerField
      Tag = 2
      DisplayLabel = 'Codigo'
      FieldName = 'COD_ROTA'
      Required = True
    end
    object cdsRotaCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsRotaDESCRICAO: TStringField
      Tag = 2
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      Required = True
      Size = 32
    end
    object cdsRotaROTA: TStringField
      DisplayLabel = 'Rota'
      FieldName = 'ROTA'
      FixedChar = True
      Size = 2
    end
  end
  object dsRota: TDataSource
    AutoEdit = False
    DataSet = cdsRota
    Left = 1638
    Top = 618
  end
  object IbTransRotas: TIBTransaction
    DefaultDatabase = dtmAtivo.bancoHw
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 882
    Top = 2
  end
  object qrValeCupom: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IbTransRotas
    SQL.Strings = (
      'select vl.* from vale_cupons vl'
      'where vl.cod_empresa = :cod_empresa')
    Left = 1736
    Top = 487
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cod_empresa'
        ParamType = ptUnknown
      end>
  end
  object dspValeCupom: TDataSetProvider
    DataSet = qrValeCupom
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1736
    Top = 532
  end
  object cdsValeCupom: TClientDataSet
    Aggregates = <>
    DisableStringTrim = True
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspValeCupom'
    BeforeOpen = CdsClientesBeforeOpen
    Left = 1736
    Top = 577
    object cdsValeCupomSEL: TStringField
      DisplayLabel = 'Sel'
      FieldKind = fkInternalCalc
      FieldName = 'SEL'
      Size = 1
    end
    object cdsValeCupomCODIGO: TStringField
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO'
      Required = True
      Size = 32
    end
    object cdsValeCupomERP_API: TStringField
      DisplayLabel = 'Origem'
      FieldName = 'ERP_API'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsValeCupomCOD_EMPRESA: TIntegerField
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsValeCupomNOME: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'NOME'
      Size = 100
    end
    object cdsValeCupomCPF: TStringField
      DisplayLabel = 'Cpf'
      FieldName = 'CPF'
      Size = 18
    end
    object cdsValeCupomCARTAO: TStringField
      DisplayLabel = 'Cartao'
      FieldName = 'CARTAO'
      Size = 100
    end
    object cdsValeCupomPONTOS: TFloatField
      DisplayLabel = 'Pontos'
      FieldName = 'PONTOS'
    end
    object cdsValeCupomVALOR: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VALOR'
    end
    object cdsValeCupomDESCRICAO: TStringField
      DisplayLabel = 'Historico'
      FieldName = 'DESCRICAO'
      Size = 100
    end
    object cdsValeCupomEMPRESA: TStringField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
      Size = 100
    end
    object cdsValeCupomVALIDADO: TDateTimeField
      DisplayLabel = 'Data Validacao'
      FieldName = 'VALIDADO'
    end
    object cdsValeCupomOPERADOR: TStringField
      DisplayLabel = 'Operador'
      FieldName = 'OPERADOR'
      Size = 100
    end
    object cdsValeCupomDATAHORA: TDateTimeField
      DisplayLabel = 'Data Cad'
      FieldName = 'DATAHORA'
    end
    object cdsValeCupomNDOC: TIntegerField
      DisplayLabel = 'Num Doc'
      FieldName = 'NDOC'
    end
    object cdsValeCupomTIPODOC: TStringField
      DisplayLabel = 'Tipo Doc'
      FieldName = 'TIPODOC'
      FixedChar = True
      Size = 3
    end
    object cdsValeCupomCOD_EMP_TIPODOC: TIntegerField
      FieldName = 'COD_EMP_TIPODOC'
    end
    object cdsValeCupomNUM_DOC: TIntegerField
      Tag = 1
      FieldName = 'NUM_DOC'
    end
    object cdsValeCupomTIPO_DOC: TStringField
      Tag = 1
      FieldName = 'TIPO_DOC'
      FixedChar = True
      Size = 3
    end
    object cdsValeCupomCOD_EMP_DOC: TIntegerField
      Tag = 1
      FieldName = 'COD_EMP_DOC'
    end
  end
  object dsValeCupom: TDataSource
    AutoEdit = False
    DataSet = cdsValeCupom
    Left = 1734
    Top = 618
  end
  object qrSaldosEmp: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IbTransRotas
    SQL.Strings = (
      
        'select (emp.cod_empresa || '#39' - '#39' || trim(coalesce(emp.identifica' +
        'cao_emp, '#39#39'))) identificacao_emp,'
      'coalesce(('
      
        '    select sum(case when (trim(cc.tipo) = '#39'CR'#201'DITO'#39') then cc.pon' +
        'tos else (-1) * cc.pontos end) pontos'
      '    from conta_corrente_prog_fidelidade cc'
      
        '    inner join clientes cl on cl.cod_cliente = cc.cod_cliente an' +
        'd cl.cod_empresa = cc.cod_empresa'
      
        '    where cl.cpfcgc = :cpfcgc and emp.cod_empresa = cc.cod_empre' +
        'sa), 0) saldo from empresa emp'
      'where emp.cod_empresa <> :cod_empresa'
      ''
      '')
    Left = 1832
    Top = 487
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cpfcgc'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cod_empresa'
        ParamType = ptUnknown
      end>
  end
  object dspSaldosEmp: TDataSetProvider
    DataSet = qrSaldosEmp
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1832
    Top = 532
  end
  object cdsSaldosEmp: TClientDataSet
    Aggregates = <>
    DisableStringTrim = True
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspSaldosEmp'
    BeforeOpen = CdsClientesBeforeOpen
    Left = 1832
    Top = 577
    object cdsSaldosEmpIDENTIFICACAO_EMP: TStringField
      FieldName = 'IDENTIFICACAO_EMP'
      Size = 78
    end
    object cdsSaldosEmpSALDO: TFloatField
      FieldName = 'SALDO'
    end
  end
  object dsSaldosEmp: TDataSource
    AutoEdit = False
    DataSet = cdsSaldosEmp
    Left = 1830
    Top = 618
  end
  object qrCupomDescontoEC: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransClientes
    SQL.Strings = (
      
        ' SELECT * FROM CUPOM_DESCONTO_EC WHERE COD_CLIENTE = 5 AND COD_E' +
        'MPRESA = 2')
    Left = 1992
    Top = 55
  end
  object dspCupomDescontoEC: TDataSetProvider
    DataSet = qrCupomDescontoEC
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1992
    Top = 100
  end
  object cdsCupomDescontoEC: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspCupomDescontoEC'
    BeforeOpen = CdsClientesBeforeOpen
    Left = 1992
    Top = 145
    object cdsCupomDescontoECID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
      Required = True
    end
    object cdsCupomDescontoECCOD_EMPRESA: TIntegerField
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsCupomDescontoECCOD_CLIENTE: TIntegerField
      DisplayLabel = 'Cod Cliente'
      FieldName = 'COD_CLIENTE'
    end
    object cdsCupomDescontoECCODIGO_CUPOM: TStringField
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO_CUPOM'
      Required = True
    end
    object cdsCupomDescontoECDESCONTO_EM: TStringField
      DisplayLabel = 'Desconto Em'
      FieldName = 'DESCONTO_EM'
    end
    object cdsCupomDescontoECDESCONTO_VALOR: TFloatField
      DisplayLabel = 'Desconto'
      FieldName = 'DESCONTO_VALOR'
      DisplayFormat = '##0.00'
    end
    object cdsCupomDescontoECUTIL_PER_VAL: TStringField
      DisplayLabel = 'Utilizar data validade'
      FieldName = 'UTIL_PER_VAL'
      FixedChar = True
      Size = 1
    end
    object cdsCupomDescontoECDATA_INI_VL: TDateTimeField
      DisplayLabel = 'Data inicial validade'
      FieldName = 'DATA_INI_VL'
      EditMask = '!99/99/9999;1;_'
    end
    object cdsCupomDescontoECDATA_FIM_VL: TDateTimeField
      DisplayLabel = 'Data final validade'
      FieldName = 'DATA_FIM_VL'
      EditMask = '!99/99/9999;1;_'
    end
    object cdsCupomDescontoECID_COMMERCE: TLargeintField
      DisplayLabel = 'Id Ecommerce'
      FieldName = 'ID_COMMERCE'
    end
  end
  object dsCupomDescontoEC: TDataSource
    DataSet = cdsCupomDescontoEC
    Left = 1990
    Top = 186
  end
  object qrPesquisa3: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransPesquisa
    Left = 209
    Top = 482
  end
  object dsPesquisa3: TDataSource
    DataSet = qrPesquisa3
    Left = 213
    Top = 525
  end
  object qrEmailWhatsApp: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransPesquisa
    SQL.Strings = (
      'SELECT * FROM BAIRROS WHERE ativo=1')
    Left = 657
    Top = 203
  end
  object dspContratoClServ: TDataSetProvider
    DataSet = qrContratoClServ
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1928
    Top = 532
  end
  object qrContratoClServ: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransClientes
    SQL.Strings = (
      'select clientes_com_contrato_serv.*, '
      
        '(clientes_com_contrato_serv.qtde * clientes_com_contrato_serv.va' +
        'lor_un) valor_tot,'
      'tipo_servico.desc_servico from clientes_com_contrato_serv'
      'left join tipo_servico on'
      
        '    tipo_servico.cod_servico = clientes_com_contrato_serv.cod_se' +
        'rvico'
      'where clientes_com_contrato_serv.cod_contrato = 0'
      'and clientes_com_contrato_serv.cod_empresa = 0')
    Left = 1928
    Top = 487
  end
  object cdsContratoClServ: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspContratoClServ'
    BeforeOpen = CdsClientesBeforeOpen
    Left = 1928
    Top = 577
    object cdsContratoClServCOD_CONTRATO_SERV: TIntegerField
      Tag = 1
      DisplayLabel = 'Seq'
      FieldName = 'COD_CONTRATO_SERV'
    end
    object cdsContratoClServCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsContratoClServCOD_CONTRATO: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Contrato'
      FieldName = 'COD_CONTRATO'
    end
    object cdsContratoClServCOD_SERVICO: TIntegerField
      DisplayLabel = 'Cod Servico'
      FieldName = 'COD_SERVICO'
      Required = True
    end
    object cdsContratoClServDESC_SERVICO: TStringField
      DisplayLabel = 'Servico'
      FieldName = 'DESC_SERVICO'
      ProviderFlags = [pfInWhere]
      FixedChar = True
      Size = 60
    end
    object cdsContratoClServQTDE: TFloatField
      DisplayLabel = 'Qtde'
      FieldName = 'QTDE'
      DisplayFormat = '##0.0000'
    end
    object cdsContratoClServVALOR_UN: TFloatField
      DisplayLabel = 'Valor Un'
      FieldName = 'VALOR_UN'
      currency = True
    end
    object cdsContratoClServVALOR_TOT: TFloatField
      DisplayLabel = 'Valor Tot'
      FieldName = 'VALOR_TOT'
      ProviderFlags = [pfInWhere]
      currency = True
    end
  end
  object dsContratoClServ: TDataSource
    DataSet = cdsContratoClServ
    Left = 1926
    Top = 618
  end
  object dspContratoClProd: TDataSetProvider
    DataSet = qrContratoClProd
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 2040
    Top = 532
  end
  object qrContratoClProd: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransClientes
    SQL.Strings = (
      'select clientes_com_contrato_prod.*,'
      
        '(clientes_com_contrato_prod.qtde * clientes_com_contrato_prod.va' +
        'lor_un) valor_tot,'
      
        'produtos.num_fab_prod, produtos.descr_prod from clientes_com_con' +
        'trato_prod'
      'inner join produtos on'
      '    produtos.grupo_prod = clientes_com_contrato_prod.grupo_prod'
      '    and produtos.cod_prod = clientes_com_contrato_prod.cod_prod'
      
        '    and produtos.cod_empresa = clientes_com_contrato_prod.cod_em' +
        'presa'
      'left join grade on'
      '    grade.cod_grade = clientes_com_contrato_prod.cod_grade'
      
        '    and grade.cod_empresa = clientes_com_contrato_prod.cod_empre' +
        'sa'
      'where clientes_com_contrato_prod.cod_contrato = 0'
      'and clientes_com_contrato_prod.cod_empresa = 0')
    Left = 2040
    Top = 487
  end
  object cdsContratoClProd: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspContratoClProd'
    BeforeOpen = CdsClientesBeforeOpen
    Left = 2040
    Top = 577
    object cdsContratoClProdCOD_CONTRATO_PROD: TIntegerField
      Tag = 1
      DisplayLabel = 'Seq'
      FieldName = 'COD_CONTRATO_PROD'
    end
    object cdsContratoClProdCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsContratoClProdCOD_CONTRATO: TIntegerField
      DisplayLabel = 'Cod Contrato'
      FieldName = 'COD_CONTRATO'
    end
    object cdsContratoClProdGRUPO_PROD: TIntegerField
      DisplayLabel = 'Grupo Prod'
      FieldName = 'GRUPO_PROD'
      Required = True
    end
    object cdsContratoClProdCOD_PROD: TStringField
      DisplayLabel = 'Cod Prod'
      FieldName = 'COD_PROD'
      Required = True
      FixedChar = True
      Size = 6
    end
    object cdsContratoClProdCOD_GRADE: TIntegerField
      DisplayLabel = 'Cod Grade'
      FieldName = 'COD_GRADE'
      Required = True
    end
    object cdsContratoClProdNUM_FAB_PROD: TStringField
      DisplayLabel = 'Num Fab Prod'
      FieldName = 'NUM_FAB_PROD'
      ProviderFlags = [pfInWhere]
      FixedChar = True
    end
    object cdsContratoClProdDESCR_PROD: TStringField
      DisplayLabel = 'Descricao'
      FieldName = 'DESCR_PROD'
      ProviderFlags = [pfInWhere]
      FixedChar = True
      Size = 75
    end
    object cdsContratoClProdQTDE: TFloatField
      DisplayLabel = 'Qtde'
      FieldName = 'QTDE'
      DisplayFormat = '##0.0000'
    end
    object cdsContratoClProdVALOR_UN: TFloatField
      DisplayLabel = 'Valor Un'
      FieldName = 'VALOR_UN'
      currency = True
    end
    object cdsContratoClProdVALOR_TOT: TFloatField
      DisplayLabel = 'Valor Tot'
      FieldName = 'VALOR_TOT'
      ProviderFlags = [pfInWhere]
      currency = True
    end
  end
  object dsContratoClProd: TDataSource
    DataSet = cdsContratoClProd
    Left = 2038
    Top = 618
  end
  object qrPedidoCompraCl: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransClientes
    SQL.Strings = (
      'select * from pedidocompracl')
    Left = 2192
    Top = 279
  end
  object dspPedidoCompraCl: TDataSetProvider
    DataSet = qrPedidoCompraCl
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 2192
    Top = 324
  end
  object cdsPedidoCompraCl: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspPedidoCompraCl'
    BeforeOpen = CdsClientesBeforeOpen
    Left = 2192
    Top = 369
    object cdsPedidoCompraClCODIGO: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO'
      Required = True
    end
    object cdsPedidoCompraClCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsPedidoCompraClNUM_PEDIDO: TStringField
      DisplayLabel = 'Num Pedido'
      FieldName = 'NUM_PEDIDO'
      Size = 15
    end
    object cdsPedidoCompraClCOD_CLIENTE: TIntegerField
      DisplayLabel = 'Cod Cliente'
      FieldName = 'COD_CLIENTE'
    end
    object cdsPedidoCompraClDATA_PEDIDO: TDateTimeField
      DisplayLabel = 'Data Pedido'
      FieldName = 'DATA_PEDIDO'
      EditMask = '!99/99/9999;1;_'
    end
    object cdsPedidoCompraClCOD_USUARIO: TIntegerField
      DisplayLabel = 'Cod Usuario'
      FieldName = 'COD_USUARIO'
    end
    object cdsPedidoCompraClATIVO: TIntegerField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
  end
  object dsPedidoCompraCl: TDataSource
    DataSet = cdsPedidoCompraCl
    Left = 2190
    Top = 410
  end
  object qrPedidoCompraClItens: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransClientes
    SQL.Strings = (
      'select * from pedidocompracl_itens i')
    Left = 2320
    Top = 279
  end
  object dspPedidoCompraClItens: TDataSetProvider
    DataSet = qrPedidoCompraClItens
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 2320
    Top = 324
  end
  object cdsPedidoCompraClItens: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspPedidoCompraClItens'
    BeforeOpen = CdsClientesBeforeOpen
    Left = 2320
    Top = 369
    object cdsPedidoCompraClItensCODIGO: TIntegerField
      Tag = 1
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO'
      Required = True
    end
    object cdsPedidoCompraClItensCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsPedidoCompraClItensNITEM: TIntegerField
      Tag = 1
      DisplayLabel = 'N'#186' Item'
      FieldName = 'NITEM'
      Required = True
    end
    object cdsPedidoCompraClItensGRUPO_PROD: TIntegerField
      DisplayLabel = 'Grupo Prod'
      FieldName = 'GRUPO_PROD'
      Required = True
    end
    object cdsPedidoCompraClItensCOD_PROD: TStringField
      DisplayLabel = 'Cod Prod'
      FieldName = 'COD_PROD'
      Required = True
      FixedChar = True
      Size = 6
    end
    object cdsPedidoCompraClItensCOD_GRADE: TIntegerField
      DisplayLabel = 'Cod Grade'
      FieldName = 'COD_GRADE'
      Required = True
    end
    object cdsPedidoCompraClItensNITEM_NFE: TIntegerField
      DisplayLabel = 'N'#186' Item NFe'
      FieldName = 'NITEM_NFE'
    end
    object cdsPedidoCompraClItensQUANT: TFloatField
      DisplayLabel = 'Quant'
      FieldName = 'QUANT'
      DisplayFormat = '##0.0000'
    end
    object cdsPedidoCompraClItensVALOR: TFloatField
      DisplayLabel = 'Valor Un'
      FieldName = 'VALOR'
      currency = True
    end
    object cdsPedidoCompraClItensVALOR_TOT: TFloatField
      DisplayLabel = 'Valor Tot'
      FieldKind = fkInternalCalc
      FieldName = 'VALOR_TOT'
      currency = True
    end
    object cdsPedidoCompraClItensNUM_FAB_PROD: TStringField
      DisplayLabel = 'Num Fab Prod'
      FieldKind = fkInternalCalc
      FieldName = 'NUM_FAB_PROD'
    end
    object cdsPedidoCompraClItensDESCR_PROD: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldKind = fkInternalCalc
      FieldName = 'DESCR_PROD'
      Size = 75
    end
  end
  object dsPedidoCompraClItens: TDataSource
    DataSet = cdsPedidoCompraClItens
    Left = 2318
    Top = 410
  end
  object qrConsClientePed: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransClientes
    SQL.Strings = (
      'select COD_CLIENTE, NOME_CLIENTE, RAZAO'
      ' from CLIENTES where COD_CLIENTE=0')
    Left = 2192
    Top = 479
  end
  object dspConsClientePed: TDataSetProvider
    DataSet = qrConsClientePed
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 2192
    Top = 524
  end
  object cdsConsClientePed: TClientDataSet
    Aggregates = <>
    DisableStringTrim = True
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspConsClientePed'
    BeforeOpen = CdsClientesBeforeOpen
    Left = 2192
    Top = 569
    object IntegerField11: TIntegerField
      FieldName = 'COD_CLIENTE'
      Required = True
    end
    object StringField9: TStringField
      FieldName = 'NOME_CLIENTE'
      Required = True
      Size = 35
    end
    object StringField10: TStringField
      FieldName = 'RAZAO'
      Required = True
      Size = 60
    end
  end
  object dsConsClientePed: TDataSource
    DataSet = cdsConsClientePed
    Left = 2190
    Top = 610
  end
  object qrGeradorOperadorCXL: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransClientes
    SQL.Strings = (
      'select COD_VENDEDOR, NOME_VENDEDOR FROM COLABORADOR '
      'WHERE COD_EMPRESA = 0')
    Left = 1184
    Top = 279
  end
  object dspGeradorOperadorCXL: TDataSetProvider
    DataSet = qrGeradorOperadorCXL
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1184
    Top = 324
  end
  object cdsGeradorOperadorCXL: TClientDataSet
    Aggregates = <>
    DisableStringTrim = True
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspGeradorOperadorCXL'
    BeforeOpen = CdsClientesBeforeOpen
    Left = 1184
    Top = 369
    object IntegerField12: TIntegerField
      FieldName = 'COD_VENDEDOR'
      Required = True
    end
    object StringField11: TStringField
      FieldName = 'NOME_VENDEDOR'
      Size = 35
    end
  end
  object dsGeradorOperadorCXL: TDataSource
    DataSet = cdsGeradorOperadorCXL
    Left = 1182
    Top = 410
  end
  object qrDocValeProgFid: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransClientes
    SQL.Strings = (
      'select'
      'pv.nped,'
      'pv.tipo,'
      'pv.valor_total,'
      'pv.cod_cliente,'
      'c.nome_cliente,'
      'pv.data_ped,'
      'pv.data_fech,'
      'pv.operador,'
      'pv.ncupom,'
      'pv.nserieecf,'
      'pv.data_cupom,'
      'pv.num_nf,'
      'pv.OBS_OS,'
      'pv.OBS_TPVENDA, '
      'pv.cod_cond_pag,'
      'pv.cod_vendedor,'
      'pv.num_nfeext,'
      'pv.cod_carga,'
      'pv.cod_nfce,'
      'pv.dest_seqid,'
      'pv.tot_prod,'
      'pv.nf_ac_calctrib,'
      'pv.nf_ac_seguro,'
      'pv.nf_ac_outras,'
      'pv.nf_ac_frete,'
      'pv.nf_freteconta,'
      'pv.finalidadeid,'
      'pv.cod_cli_fat,'
      
        'nfce.num_nf||'#39'-'#39'||nfce.serie||'#39'-'#39'||nfce.situacao_nfce as dados_n' +
        'fce'
      'from pedvenda pv'
      
        'inner join clientes c on c.cod_cliente = pv.cod_cliente and c.co' +
        'd_empresa = pv.cod_empresa'
      
        'left join nfce on nfce.cod_nfce = pv.cod_nfce and nfce.cod_empre' +
        'sa = pv.cod_empresa'
      
        'where pv.nped =  :pReq  and pv.tipo =  :pTipo and pv.cod_empresa' +
        ' = :pCodempresa')
    Left = 2128
    Top = 55
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pReq'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pTipo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pCodempresa'
        ParamType = ptUnknown
      end>
  end
  object dspDocValeProgFid: TDataSetProvider
    DataSet = qrDocValeProgFid
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 2128
    Top = 100
  end
  object cdsDocValeProgFid: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspDocValeProgFid'
    BeforeOpen = CdsClientesBeforeOpen
    Left = 2128
    Top = 145
    object cdsDocValeProgFidNPED: TIntegerField
      DisplayLabel = 'N'#186' Venda'
      FieldName = 'NPED'
      Required = True
    end
    object cdsDocValeProgFidTIPO: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Required = True
      FixedChar = True
      Size = 3
    end
    object cdsDocValeProgFidVALOR_TOTAL: TFloatField
      DisplayLabel = 'Valor Total'
      FieldName = 'VALOR_TOTAL'
      currency = True
    end
    object cdsDocValeProgFidCOD_CLIENTE: TIntegerField
      DisplayLabel = 'C'#243'd Cliente'
      FieldName = 'COD_CLIENTE'
      Required = True
    end
    object cdsDocValeProgFidNOME_CLIENTE: TStringField
      DisplayLabel = 'Nome do Cliente'
      FieldName = 'NOME_CLIENTE'
      Required = True
      Size = 35
    end
    object cdsDocValeProgFidDATA_PED: TDateTimeField
      DisplayLabel = 'Data Venda'
      FieldName = 'DATA_PED'
    end
    object cdsDocValeProgFidDATA_FECH: TDateTimeField
      DisplayLabel = 'Data Fechamento'
      FieldName = 'DATA_FECH'
    end
    object cdsDocValeProgFidOPERADOR: TIntegerField
      FieldName = 'OPERADOR'
    end
    object cdsDocValeProgFidNCUPOM: TIntegerField
      DisplayLabel = 'N'#186' Cupom'
      FieldName = 'NCUPOM'
    end
    object cdsDocValeProgFidNSERIEECF: TStringField
      DisplayLabel = 'N'#186' S'#233'rie ECF'
      FieldName = 'NSERIEECF'
    end
    object cdsDocValeProgFidNUM_NF: TIntegerField
      DisplayLabel = 'N'#186' NF'
      FieldName = 'NUM_NF'
    end
    object cdsDocValeProgFidNUM_NFEEXT: TLargeintField
      DisplayLabel = 'Num NF Ext'
      FieldName = 'NUM_NFEEXT'
    end
    object cdsDocValeProgFidDADOS_NFCE: TStringField
      DisplayLabel = 'NFC-e'
      FieldName = 'DADOS_NFCE'
      Size = 35
    end
  end
  object dsDocValeProgFid: TDataSource
    DataSet = cdsDocValeProgFid
    Left = 2126
    Top = 186
  end
  object qrItensValeProgFid: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransClientes
    SQL.Strings = (
      
        'select '#39'P'#39' tipo_item, pvp.nped, pvp.tipo, pvp.nitem, pvp.num_fab' +
        '_prod, pvp.descr_prod_ped, pvp.quant_ped_item,'
      
        'pvp.vltot_ped_item, pvp.vltot_ped_nf, (pvp.rateio_acresc) acresc' +
        'imo, (pvp.rateio_desc) desconto, pvp.codigo_nop,'
      
        'pvp.grupo_prod, pvp.cod_prod, pvp.n_nf, pvp.serie, pvp.xped_comp' +
        'ra, pvp.nitemped_compra, pvp.pcust_mc, pvp.vl_desp_nf,'
      
        'pvp.acresc_item, pvp.nf_ac_des_emb, pvp.nf_dc_despnf, pvp.cod_gr' +
        'ade, pf.qvnd, pf.uvnd, pf.uvnd_fator'
      
        'from pedvenda_prod_fator pf inner join pedvenda_prod pvp on (pf.' +
        'nped = pvp.nped) and (pf.tipo = pvp.tipo)'
      
        '  and (pf.grupo_prod = pvp.grupo_prod) and (pf.cod_prod = pvp.co' +
        'd_prod) and (pf.nitem = pvp.nitem)'
      
        '  and (pf.cod_empresa = pvp.cod_empresa) and (pf.cod_grade = pvp' +
        '.cod_grade) and (pf.codigo_nop = pvp.codigo_nop)'
      
        'where pf.nped = :pReq and pf.tipo =  :pTipo and pf.cod_empresa =' +
        '  :codEmpresa'
      'and ((pvp.status is null) or (pvp.status <> '#39'CANCELADO'#39'))'
      'union'
      
        'select '#39'S'#39' ,pvs.nped, pvs.tipo, pvs.nitem, pvs.cod_servico, pvs.' +
        'desc_serv_ped, pvs.quant_serv_ped, pvs.valor_tot_serv,'
      
        'pvs.valor_tot_serv,(pvs.acresc_item + pvs.rateio_acresc) acresci' +
        'mo,(pvs.desc_item + pvs.rateio_desc) desconto, pvs.codigo_nop,'
      
        'null, null, pvs.n_nf, pvs.serie, '#39#39', 0, 0, 0, 0, 0, 0, 0, pvs.qu' +
        'ant_serv_ped qvnd, cast('#39'UND'#39' as varchar(6)) uvnd, 1.0 uvnd_fato' +
        'r'
      'from pedvenda_serv pvs'
      
        'where pvs.nped =  :pReq and pvs.tipo =  :pTipo and pvs.cod_empre' +
        'sa =  :codEmpresa'
      'and ((pvs.status is null) or (pvs.status <> '#39'CANCELADO'#39'))'
      'union'
      
        'select '#39'T'#39',pvt.nped, pvt.tipo, 0, 0, '#39'SERVICO DE TERCEIRO'#39', 1, s' +
        'um(pvt.vl_servt), sum(pvt.vl_servt), sum(0) acrescimo,'
      
        'sum(0) desconto, e.cfop_pad_serv, null, null, null, null, '#39#39', 0,' +
        ' 0, 0, 0, 0, 0, 0, 1 qvnd, cast('#39'UND'#39' as varchar(6)) uvnd, 1.0 u' +
        'vnd_fator'
      
        'from pedvenda_serv_terc pvt inner join empresa e on e.cod_empres' +
        'a = pvt.cod_empresa'
      
        'where pvt.nped =  :pReq and pvt.tipo =  :pTipo and pvt.cod_empre' +
        'sa =  :codEmpresa'
      'group by 1,2,3,4,5,6,7,12,13,14,15,16 '
      'order by 1,4')
    Left = 2256
    Top = 55
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pReq'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pTipo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'codEmpresa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pReq'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pTipo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'codEmpresa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pReq'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pTipo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'codEmpresa'
        ParamType = ptUnknown
      end>
  end
  object dspItensValeProgFid: TDataSetProvider
    DataSet = qrItensValeProgFid
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 2256
    Top = 100
  end
  object cdsItensValeProgFid: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspItensValeProgFid'
    BeforeOpen = CdsClientesBeforeOpen
    Left = 2256
    Top = 145
    object cdsItensValeProgFidTIPO_ITEM: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO_ITEM'
      FixedChar = True
      Size = 1
    end
    object cdsItensValeProgFidNPED: TIntegerField
      FieldName = 'NPED'
      Required = True
    end
    object cdsItensValeProgFidTIPO: TStringField
      FieldName = 'TIPO'
      Required = True
      FixedChar = True
      Size = 3
    end
    object cdsItensValeProgFidNITEM: TIntegerField
      DisplayLabel = 'N'#186' Item'
      FieldName = 'NITEM'
    end
    object cdsItensValeProgFidNUM_FAB_PROD: TStringField
      DisplayLabel = 'C'#243'digo / Chave'
      FieldName = 'NUM_FAB_PROD'
    end
    object cdsItensValeProgFidDESCR_PROD_PED: TStringField
      DisplayLabel = 'Descri'#231#227'o do Item'
      FieldName = 'DESCR_PROD_PED'
      Size = 75
    end
    object cdsItensValeProgFidUVND: TStringField
      DisplayLabel = 'Und'
      FieldName = 'UVND'
      ReadOnly = True
      Size = 6
    end
    object cdsItensValeProgFidQVND: TFloatField
      DisplayLabel = 'Qtde'
      FieldName = 'QVND'
      ReadOnly = True
    end
    object cdsItensValeProgFidQUANT_PED_ITEM: TFloatField
      FieldName = 'QUANT_PED_ITEM'
    end
    object cdsItensValeProgFidVLTOT_PED_ITEM: TFloatField
      DisplayLabel = 'Valor Venda'
      FieldName = 'VLTOT_PED_ITEM'
    end
    object cdsItensValeProgFidVLTOT_PED_NF: TFloatField
      DisplayLabel = 'Valor NF'
      FieldName = 'VLTOT_PED_NF'
    end
    object cdsItensValeProgFidACRESCIMO: TFloatField
      DisplayLabel = 'Acr'#233'scimo'
      FieldName = 'ACRESCIMO'
    end
    object cdsItensValeProgFidDESCONTO: TFloatField
      DisplayLabel = 'Desconto'
      FieldName = 'DESCONTO'
    end
    object cdsItensValeProgFidCODIGO_NOP: TFloatField
      DisplayLabel = 'CFOP'
      FieldName = 'CODIGO_NOP'
    end
    object cdsItensValeProgFidGRUPO_PROD: TIntegerField
      DisplayLabel = 'Grupo'
      FieldName = 'GRUPO_PROD'
    end
    object cdsItensValeProgFidCOD_PROD: TStringField
      DisplayLabel = 'C'#243'd Prod'
      FieldName = 'COD_PROD'
      FixedChar = True
      Size = 6
    end
    object cdsItensValeProgFidN_NF: TLargeintField
      DisplayLabel = 'N'#186' NF'
      FieldName = 'N_NF'
    end
  end
  object dsItensValeProgFid: TDataSource
    DataSet = cdsItensValeProgFid
    Left = 2254
    Top = 186
  end
  object qrControlesCC: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransClientes
    SQL.Strings = (
      'select controles.codigo_ctrl, controles.nome_ctrl from controles'
      'where controles.codigo_emp = 1'
      'and controles.ativo = 1'
      'and controles.docs = '#39'S2'#39)
    Left = 2312
    Top = 479
  end
  object dspControlesCC: TDataSetProvider
    DataSet = qrControlesCC
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 2312
    Top = 524
  end
  object cdsControlesCC: TClientDataSet
    Aggregates = <>
    DisableStringTrim = True
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspControlesCC'
    BeforeOpen = CdsClientesBeforeOpen
    Left = 2312
    Top = 569
    object cdsControlesCCCODIGO_CTRL: TIntegerField
      FieldName = 'CODIGO_CTRL'
      Required = True
    end
    object cdsControlesCCNOME_CTRL: TStringField
      FieldName = 'NOME_CTRL'
      Size = 35
    end
  end
  object dsControlesCC: TDataSource
    DataSet = cdsControlesCC
    Left = 2310
    Top = 610
  end
  object qrControlesCH: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransClientes
    SQL.Strings = (
      'select controles.codigo_ctrl, controles.nome_ctrl from controles'
      'where controles.codigo_emp = 1'
      'and controles.ativo = 1'
      'and controles.docs = '#39'S2'#39)
    Left = 2416
    Top = 479
  end
  object dspControlesCH: TDataSetProvider
    DataSet = qrControlesCH
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 2416
    Top = 524
  end
  object cdsControlesCH: TClientDataSet
    Aggregates = <>
    DisableStringTrim = True
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspControlesCH'
    BeforeOpen = CdsClientesBeforeOpen
    Left = 2416
    Top = 569
    object IntegerField13: TIntegerField
      FieldName = 'CODIGO_CTRL'
      Required = True
    end
    object StringField12: TStringField
      FieldName = 'NOME_CTRL'
      Size = 35
    end
  end
  object dsControlesCH: TDataSource
    DataSet = cdsControlesCH
    Left = 2414
    Top = 610
  end
  object qrAplicativoMens: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransClientes
    SQL.Strings = (
      
        'select msg_aplicativo.id, msg_aplicativo.aplicativo from msg_apl' +
        'icativo')
    Left = 2408
    Top = 55
  end
  object dspAplicativoMens: TDataSetProvider
    DataSet = qrAplicativoMens
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 2408
    Top = 100
  end
  object cdsAplicativoMens: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspAplicativoMens'
    BeforeOpen = CdsClientesBeforeOpen
    Left = 2408
    Top = 145
    object cdsAplicativoMensID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsAplicativoMensAPLICATIVO: TStringField
      FieldName = 'APLICATIVO'
      Size = 50
    end
  end
  object dsAplicativoMens: TDataSource
    DataSet = cdsAplicativoMens
    Left = 2406
    Top = 186
  end
end
