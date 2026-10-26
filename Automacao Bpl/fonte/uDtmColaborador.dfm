object dtmColaborador: TdtmColaborador
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 607
  Width = 1270
  object SpIncCodigo: TIBStoredProc
    Database = dtmAtivo.bancoHw
    Transaction = transacaoColab
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
  object qrColab: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacaoColab
    SQL.Strings = (
      'select * from COLABORADOR')
    Left = 13
    Top = 64
  end
  object dspColab: TDataSetProvider
    DataSet = qrColab
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 13
    Top = 112
  end
  object cdsColab: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspColab'
    BeforeOpen = cdsColabBeforeOpen
    Left = 13
    Top = 160
    object cdsColabSEL: TStringField
      DisplayLabel = 'Sel'
      FieldKind = fkInternalCalc
      FieldName = 'SEL'
      Size = 1
    end
    object cdsColabCOD_VENDEDOR: TIntegerField
      DisplayLabel = 'Cod Colaborador'
      FieldName = 'COD_VENDEDOR'
      Required = True
    end
    object cdsColabCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsColabCODIGO_UF: TIntegerField
      DisplayLabel = 'Cod UF'
      FieldName = 'CODIGO_UF'
      Required = True
    end
    object cdsColabCOD_FUNCAO: TIntegerField
      DisplayLabel = 'Cod Fun'#231#227'o'
      FieldName = 'COD_FUNCAO'
    end
    object cdsColabNOME_VENDEDOR: TStringField
      Tag = 2
      DisplayLabel = 'Nome Funcion'#225'rio'
      FieldName = 'NOME_VENDEDOR'
      Size = 35
    end
    object cdsColabEND_VENDEDOR: TStringField
      DisplayLabel = 'Endere'#231'o'
      FieldName = 'END_VENDEDOR'
      Size = 35
    end
    object cdsColabBAIRRO_VENDEDOR: TStringField
      DisplayLabel = 'Bairro'
      FieldName = 'BAIRRO_VENDEDOR'
      Size = 35
    end
    object cdsColabCIDADE_VENDEDOR: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'CIDADE_VENDEDOR'
      Size = 35
    end
    object cdsColabCEP_VENDEDOR: TStringField
      DisplayLabel = 'CEP'
      FieldName = 'CEP_VENDEDOR'
      EditMask = '00000\-999;0;'
      FixedChar = True
      Size = 9
    end
    object cdsColabFONE_VENDEDOR: TStringField
      DisplayLabel = 'Fone'
      FieldName = 'FONE_VENDEDOR'
      EditMask = '(99) 9999-9999;0;_'
      FixedChar = True
      Size = 14
    end
    object cdsColabRG_VENDEDOR: TStringField
      DisplayLabel = 'RG'
      FieldName = 'RG_VENDEDOR'
      Size = 11
    end
    object cdsColabCPF_VENDEDOR: TStringField
      DisplayLabel = 'CPF'
      FieldName = 'CPF_VENDEDOR'
      FixedChar = True
      Size = 11
    end
    object cdsColabPC_VEND_SERV: TFloatField
      DisplayLabel = 'Porc. venda Serv'#231'o'
      FieldName = 'PC_VEND_SERV'
    end
    object cdsColabPC_VEND_PROD: TFloatField
      DisplayLabel = 'Porc. Venda Produto'
      FieldName = 'PC_VEND_PROD'
    end
    object cdsColabOBS_VENDEDOR: TMemoField
      DisplayLabel = 'Observa'#231#227'o'
      FieldName = 'OBS_VENDEDOR'
      BlobType = ftMemo
      Size = 8
    end
    object cdsColabDATA_MOD_COL: TDateTimeField
      DisplayLabel = 'Data Modifica'#231#227'o'
      FieldName = 'DATA_MOD_COL'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsColabDATA_CAD_COL: TDateTimeField
      DisplayLabel = 'Data Cadastro'
      FieldName = 'DATA_CAD_COL'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsColabDAT_NASC_COL: TDateTimeField
      DisplayLabel = 'Data Nasc'
      FieldName = 'DAT_NASC_COL'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsColabNOME_ULT_EMP: TStringField
      DisplayLabel = 'Nome Ult Emprego'
      FieldName = 'NOME_ULT_EMP'
      Size = 30
    end
    object cdsColabENDERECO_ULT_EMP: TStringField
      DisplayLabel = 'Endere'#231'o Ult Emprego'
      FieldName = 'ENDERECO_ULT_EMP'
      Size = 30
    end
    object cdsColabFONE_ULT_EMP: TStringField
      DisplayLabel = 'Fone Ult Emprego'
      FieldName = 'FONE_ULT_EMP'
      EditMask = '(99) 9999-9999;0;_'
      FixedChar = True
      Size = 14
    end
    object cdsColabCONT_ULT_EMP: TStringField
      DisplayLabel = 'Contato Ult Emprego'
      FieldName = 'CONT_ULT_EMP'
    end
    object cdsColabULT_SAL_EMP: TFloatField
      DisplayLabel = 'Sal'#225'rio Ult Emprego'
      FieldName = 'ULT_SAL_EMP'
      currency = True
    end
    object cdsColabDTENT_ULT_EMP: TDateTimeField
      DisplayLabel = 'Data entrada Ult. Emprego'
      FieldName = 'DTENT_ULT_EMP'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsColabDTSAI_ULT_EMP: TDateTimeField
      DisplayLabel = 'Data Sa'#237'da Ult Emprego'
      FieldName = 'DTSAI_ULT_EMP'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsColabNOME_PLT_EMP: TStringField
      DisplayLabel = 'Nome plt. Emprego'
      FieldName = 'NOME_PLT_EMP'
      Size = 30
    end
    object cdsColabENDERECO_PLT_EMP: TStringField
      DisplayLabel = 'Endere'#231'o plt Emprego'
      FieldName = 'ENDERECO_PLT_EMP'
      Size = 30
    end
    object cdsColabFONE_PLT_EMP: TStringField
      DisplayLabel = 'Fone plt. Emprego'
      FieldName = 'FONE_PLT_EMP'
      EditMask = '(99) 9999-9999;0;_'
      FixedChar = True
      Size = 14
    end
    object cdsColabCONT_PLT_EMP: TStringField
      DisplayLabel = 'Contato plt. Emprego'
      FieldName = 'CONT_PLT_EMP'
    end
    object cdsColabPLT_SAL_EMP: TFloatField
      DisplayLabel = 'Sal'#225'rio plt. Emprego'
      FieldName = 'PLT_SAL_EMP'
      currency = True
    end
    object cdsColabDTENT_PLT_EMP: TDateTimeField
      DisplayLabel = 'Data entradao plt. Emprego'
      FieldName = 'DTENT_PLT_EMP'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsColabDTSAI_PLT_EMP: TDateTimeField
      DisplayLabel = 'Data sa'#237'da plt. Emprego'
      FieldName = 'DTSAI_PLT_EMP'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsColabDT_ULT_FERIAS: TDateTimeField
      DisplayLabel = 'Data ult. F'#233'rias'
      FieldName = 'DT_ULT_FERIAS'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsColabTMP_ULT_FERIAS: TIntegerField
      DisplayLabel = 'Tempo ult. f'#233'rias'
      FieldName = 'TMP_ULT_FERIAS'
    end
    object cdsColabVL_ULT_FERIAS: TFloatField
      DisplayLabel = 'Valor ult. F'#233'rias'
      FieldName = 'VL_ULT_FERIAS'
      currency = True
    end
    object cdsColabDTVND_ULT_FERIAS: TDateTimeField
      DisplayLabel = 'Data venda ult. F'#233'rias'
      FieldName = 'DTVND_ULT_FERIAS'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsColabDT_13_SAL: TDateTimeField
      DisplayLabel = 'Data 13'#186' Sal'#225'rio'
      FieldName = 'DT_13_SAL'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsColabVL_13_SAL: TFloatField
      DisplayLabel = 'Valor 13'#186' Sal'#225'rio'
      FieldName = 'VL_13_SAL'
      currency = True
    end
    object cdsColabVL_SAL: TFloatField
      DisplayLabel = 'Valor Sal'#225'rio'
      FieldName = 'VL_SAL'
      currency = True
    end
    object cdsColabCOD_CIDADE: TSmallintField
      Tag = 1
      DisplayLabel = 'Cod Cidade'
      FieldName = 'COD_CIDADE'
    end
    object cdsColabCOD_BAIRRO: TSmallintField
      Tag = 1
      DisplayLabel = 'Cod Bairro'
      FieldName = 'COD_BAIRRO'
    end
    object cdsColabSALARIO_REGISTRO: TFloatField
      DisplayLabel = 'Sal'#225'rio Reg.'
      FieldName = 'SALARIO_REGISTRO'
      currency = True
    end
    object cdsColabVALOR_SALARIO: TFloatField
      DisplayLabel = 'Valor Sal'#225'rio'
      FieldName = 'VALOR_SALARIO'
      currency = True
    end
    object cdsColabQUANT_SAL_FAMILIA: TFloatField
      DisplayLabel = 'Qtd. Sal. Fam'#237'lia'
      FieldName = 'QUANT_SAL_FAMILIA'
    end
    object cdsColabVALOR_SALARIO_FAMILIA: TFloatField
      DisplayLabel = 'Valor sal'#225'rio Fam'#237'lia'
      FieldName = 'VALOR_SALARIO_FAMILIA'
      currency = True
    end
    object cdsColabPERC_PESO: TFloatField
      DisplayLabel = 'Perc. Peso'
      FieldName = 'PERC_PESO'
    end
    object cdsColabATIVO: TIntegerField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
    object cdsColabEMAIL: TStringField
      DisplayLabel = 'E-mail'
      FieldName = 'EMAIL'
      Size = 128
    end
    object cdsColabSITE: TStringField
      DisplayLabel = 'Site'
      FieldName = 'SITE'
      FixedChar = True
      Size = 1
    end
    object cdsColabFONE_CONTATO: TStringField
      DisplayLabel = 'Fone Contato'
      FieldName = 'FONE_CONTATO'
      FixedChar = True
      Size = 40
    end
    object cdsColabSiglaUF: TStringField
      FieldKind = fkLookup
      FieldName = 'SiglaUF'
      LookupDataSet = grUF
      LookupKeyFields = 'CODIGO_UF'
      LookupResultField = 'SIGLA_UF'
      KeyFields = 'CODIGO_UF'
      Size = 2
      Lookup = True
    end
    object cdsColabCOD_GERENTE: TIntegerField
      DisplayLabel = 'Codigo Gerente'
      FieldName = 'COD_GERENTE'
    end
    object cdsColabDATA_INI_AUSENCIA: TDateTimeField
      Tag = 2
      DisplayLabel = 'Data Inicial Aus'#234'ncia'
      FieldName = 'DATA_INI_AUSENCIA'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsColabDATA_FIM_AUSENCIA: TDateTimeField
      Tag = 2
      DisplayLabel = 'Data Final Aus'#234'ncia'
      FieldName = 'DATA_FIM_AUSENCIA'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsColabVENDEDOR_TLV: TStringField
      DisplayLabel = 'Vendedor do Televendas'
      FieldName = 'VENDEDOR_TLV'
      Size = 1
    end
    object cdsColabCOD_JORNADA_TRABALHO: TIntegerField
      DisplayLabel = 'Cod Jornada Trabalho'
      FieldName = 'COD_JORNADA_TRABALHO'
    end
    object cdsColabCOD_ESCALA_SEMANAL: TIntegerField
      DisplayLabel = 'Cod Escala Semanal'
      FieldName = 'COD_ESCALA_SEMANAL'
    end
  end
  object dsCola: TDataSource
    DataSet = cdsColab
    Left = 13
    Top = 208
  end
  object transacaoColab: TIBTransaction
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
    Transaction = transacaoColab
    Left = 16
    Top = 272
  end
  object qrFuncao: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacaoFuncoes
    SQL.Strings = (
      'select * from funcoes where 1=0')
    Left = 72
    Top = 64
  end
  object dspFuncao: TDataSetProvider
    DataSet = qrFuncao
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 72
    Top = 112
  end
  object cdsFuncao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFuncao'
    BeforeOpen = cdsColabBeforeOpen
    Left = 72
    Top = 160
    object cdsFuncaoSEL: TStringField
      DisplayLabel = 'Sel'
      FieldKind = fkInternalCalc
      FieldName = 'SEL'
      Size = 1
    end
    object cdsFuncaoCOD_FUNCAO: TIntegerField
      Tag = 2
      DisplayLabel = 'Cod Funcao'
      FieldName = 'COD_FUNCAO'
      Required = True
    end
    object cdsFuncaoCOD_DEPTO: TIntegerField
      DisplayLabel = 'Cod Departamento'
      FieldName = 'COD_DEPTO'
      Required = True
    end
    object cdsFuncaoDESC_FUNCAO: TStringField
      Tag = 2
      DisplayLabel = 'Descr Fun'#231#227'o'
      FieldName = 'DESC_FUNCAO'
      FixedChar = True
      Size = 30
    end
    object cdsFuncaoTPDOCS_VND: TMemoField
      Tag = 1
      DisplayLabel = 'Tipo DOC'
      FieldName = 'TPDOCS_VND'
      OnGetText = cdsFuncaoTPDOCS_VNDGetText
      BlobType = ftMemo
      Size = 8
    end
    object cdsFuncaoATIVO: TIntegerField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
    object cdsFuncaoDPTO: TStringField
      DisplayLabel = 'Departamento'
      FieldKind = fkLookup
      FieldName = 'DPTO'
      LookupDataSet = qrDpto
      LookupKeyFields = 'COD_DEPTO'
      LookupResultField = 'NOME_DEPTO'
      KeyFields = 'COD_DEPTO'
      ReadOnly = True
      Size = 15
      Lookup = True
    end
  end
  object dsFuncao: TDataSource
    DataSet = cdsFuncao
    Left = 72
    Top = 208
  end
  object qrDpto: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacaoFuncoes
    SQL.Strings = (
      'select * from DEPTO')
    Left = 128
    Top = 168
  end
  object dsDepto: TDataSource
    DataSet = qrDpto
    Left = 128
    Top = 216
  end
  object qrPerfilcomissao: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacaoColab
    SQL.Strings = (
      'select * from PERFIL_COMISSAO ')
    Left = 320
    Top = 72
    object IntegerField1: TIntegerField
      FieldName = 'CODIGO_PERFIL'
      Origin = '"PERFIL_COMISSAO"."CODIGO_PERFIL"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IBStringField1: TIBStringField
      FieldName = 'NOME_PERFIL'
      Origin = '"PERFIL_COMISSAO"."NOME_PERFIL"'
      FixedChar = True
      Size = 30
    end
    object IBStringField2: TIBStringField
      FieldName = 'TIPO_PERFIL'
      Origin = '"PERFIL_COMISSAO"."TIPO_PERFIL"'
      FixedChar = True
    end
    object IBStringField3: TIBStringField
      FieldName = 'ABRANG_PERFIL'
      Origin = '"PERFIL_COMISSAO"."ABRANG_PERFIL"'
      FixedChar = True
    end
    object IBStringField4: TIBStringField
      FieldName = 'EM_CIMA_PERFIL'
      Origin = '"PERFIL_COMISSAO"."EM_CIMA_PERFIL"'
      FixedChar = True
    end
    object IBStringField5: TIBStringField
      FieldName = 'TIPO_SERV_PROD'
      Origin = '"PERFIL_COMISSAO"."TIPO_SERV_PROD"'
      FixedChar = True
    end
    object IBStringField6: TIBStringField
      FieldName = 'FLAG_SERV_PROD'
      Origin = '"PERFIL_COMISSAO"."FLAG_SERV_PROD"'
      FixedChar = True
    end
    object MemoField1: TMemoField
      FieldName = 'CONTEUDO_FLAG'
      Origin = '"PERFIL_COMISSAO"."CONTEUDO_FLAG"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
    object MemoField2: TMemoField
      FieldName = 'TABELAS_PERFIL'
      Origin = '"PERFIL_COMISSAO"."TABELAS_PERFIL"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
    object DateTimeField1: TDateTimeField
      FieldName = 'DATA_CADASTRO'
      Origin = '"PERFIL_COMISSAO"."DATA_CADASTRO"'
    end
    object FloatField1: TFloatField
      FieldName = 'PERC_PESO'
      Origin = '"PERFIL_COMISSAO"."PERC_PESO"'
    end
    object IntegerField2: TIntegerField
      FieldName = 'ATIVO'
      Origin = '"PERFIL_COMISSAO"."ATIVO"'
    end
  end
  object dspPerfilComissao: TDataSetProvider
    DataSet = qrPerfilcomissao
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 320
    Top = 120
  end
  object cdsPerfilComissao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPerfilComissao'
    BeforeOpen = cdsColabBeforeOpen
    Left = 320
    Top = 168
    object cdsPerfilComissaoCODIGO_PERFIL: TIntegerField
      DisplayLabel = 'C'#243'd. Perfil'
      FieldName = 'CODIGO_PERFIL'
      Origin = '"PERFIL_COMISSAO"."CODIGO_PERFIL"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsPerfilComissaoNOME_PERFIL: TStringField
      DisplayLabel = 'Nome Perfil'
      FieldName = 'NOME_PERFIL'
      Origin = '"PERFIL_COMISSAO"."NOME_PERFIL"'
      FixedChar = True
      Size = 30
    end
    object cdsPerfilComissaoTIPO_PERFIL: TStringField
      DisplayLabel = 'Tipo Perfil'
      FieldName = 'TIPO_PERFIL'
      Origin = '"PERFIL_COMISSAO"."TIPO_PERFIL"'
      FixedChar = True
    end
    object cdsPerfilComissaoABRANG_PERFIL: TStringField
      DisplayLabel = 'Abrang. Perfil'
      FieldName = 'ABRANG_PERFIL'
      Origin = '"PERFIL_COMISSAO"."ABRANG_PERFIL"'
      FixedChar = True
    end
    object cdsPerfilComissaoEM_CIMA_PERFIL: TStringField
      DisplayLabel = 'Em cima de'
      FieldName = 'EM_CIMA_PERFIL'
      Origin = '"PERFIL_COMISSAO"."EM_CIMA_PERFIL"'
      FixedChar = True
    end
    object cdsPerfilComissaoTIPO_SERV_PROD: TStringField
      DisplayLabel = 'Tipo ser. Produto'
      FieldName = 'TIPO_SERV_PROD'
      Origin = '"PERFIL_COMISSAO"."TIPO_SERV_PROD"'
      FixedChar = True
    end
    object cdsPerfilComissaoFLAG_SERV_PROD: TStringField
      DisplayLabel = 'Flag. serv. Prod.'
      FieldName = 'FLAG_SERV_PROD'
      Origin = '"PERFIL_COMISSAO"."FLAG_SERV_PROD"'
      FixedChar = True
    end
    object cdsPerfilComissaoCONTEUDO_FLAG: TMemoField
      DisplayLabel = 'Conteudo Flag'
      FieldName = 'CONTEUDO_FLAG'
      Origin = '"PERFIL_COMISSAO"."CONTEUDO_FLAG"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
    object cdsPerfilComissaoTABELAS_PERFIL: TMemoField
      DisplayLabel = 'Tabela Perfil'
      FieldName = 'TABELAS_PERFIL'
      Origin = '"PERFIL_COMISSAO"."TABELAS_PERFIL"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
    object cdsPerfilComissaoDATA_CADASTRO: TDateTimeField
      DisplayLabel = 'Data Cadastro'
      FieldName = 'DATA_CADASTRO'
      Origin = '"PERFIL_COMISSAO"."DATA_CADASTRO"'
    end
    object cdsPerfilComissaoPERC_PESO: TFloatField
      DisplayLabel = 'Perc. Pesp'
      FieldName = 'PERC_PESO'
      Origin = '"PERFIL_COMISSAO"."PERC_PESO"'
    end
    object cdsPerfilComissaoATIVO: TIntegerField
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
      Origin = '"PERFIL_COMISSAO"."ATIVO"'
    end
  end
  object dsPerfilComissao: TDataSource
    DataSet = cdsPerfilComissao
    Left = 320
    Top = 216
  end
  object qrIncidencia: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacaoColab
    SQL.Strings = (
      'select *  from INCIDENCIA')
    Left = 404
    Top = 72
  end
  object dtpIncidencia: TDataSetProvider
    DataSet = qrIncidencia
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 404
    Top = 120
  end
  object cdsIncidencia: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dtpIncidencia'
    BeforeOpen = cdsColabBeforeOpen
    Left = 404
    Top = 168
    object cdsIncidenciaCODIGO: TIntegerField
      DisplayLabel = 'C'#243'd. Inci'#234'ncia'
      FieldName = 'CODIGO'
      Required = True
    end
    object cdsIncidenciaCOD_EMPRESA: TIntegerField
      DisplayLabel = 'C'#243'd. Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsIncidenciaDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      FixedChar = True
      Size = 50
    end
    object cdsIncidenciaTIPO: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      FixedChar = True
      Size = 10
    end
    object cdsIncidenciaVALOR: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VALOR'
    end
    object cdsIncidenciaCODFUNC: TIntegerField
      DisplayLabel = 'Cod Func.'
      FieldName = 'CODFUNC'
    end
    object cdsIncidenciaNATUREZA: TStringField
      DisplayLabel = 'Natureza'
      FieldName = 'NATUREZA'
      FixedChar = True
      Size = 1
    end
    object cdsIncidenciaCOD_FUNCAO: TIntegerField
      DisplayLabel = 'C'#243'd. Fun'#231#227'o'
      FieldName = 'COD_FUNCAO'
    end
    object cdsIncidenciaATIVO: TIntegerField
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
  end
  object dsIncidencia: TDataSource
    DataSet = cdsIncidencia
    Left = 404
    Top = 216
  end
  object qrIncidenciaColab: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacaoColab
    SQL.Strings = (
      'select * from LANC_PAG')
    Left = 492
    Top = 80
  end
  object dspIncidenciaColab: TDataSetProvider
    DataSet = qrIncidenciaColab
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 492
    Top = 128
  end
  object cdsIncidenciaColab: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspIncidenciaColab'
    BeforeOpen = cdsColabBeforeOpen
    Left = 492
    Top = 176
    object cdsIncidenciaColabCOD_INCIDENCIA: TIntegerField
      DisplayLabel = 'C'#243'd. Incid'#234'ncia'
      FieldName = 'COD_INCIDENCIA'
      Origin = '"LANC_PAG"."COD_INCIDENCIA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsIncidenciaColabCOD_COLABORADOR: TIntegerField
      DisplayLabel = 'C'#243'd. Colaborador'
      FieldName = 'COD_COLABORADOR'
      Origin = '"LANC_PAG"."COD_COLABORADOR"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsIncidenciaColabCOD_EMPRESA: TIntegerField
      DisplayLabel = 'C'#243'd. Empresa'
      FieldName = 'COD_EMPRESA'
      Origin = '"LANC_PAG"."COD_EMPRESA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsIncidenciaColabATIVO: TIntegerField
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
      Origin = '"LANC_PAG"."ATIVO"'
    end
  end
  object dsIncidenciaColab: TDataSource
    DataSet = cdsIncidenciaColab
    Left = 492
    Top = 224
  end
  object CdsPColab: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPcolab'
    BeforeOpen = CdsPColabBeforeOpen
    Left = 244
    Top = 168
    object CdsPColabCOD_VENDEDOR: TIntegerField
      DisplayLabel = 'C'#243'd. Vendedor'
      FieldName = 'COD_VENDEDOR'
      Origin = '"PERFIL_VENDEDOR"."COD_VENDEDOR"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CdsPColabCODIGO_PERFIL: TIntegerField
      DisplayLabel = 'C'#243'd. Perfil'
      FieldName = 'CODIGO_PERFIL'
      Origin = '"PERFIL_VENDEDOR"."CODIGO_PERFIL"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CdsPColabCOD_EMPRESA: TIntegerField
      DisplayLabel = 'C'#243'd. Empresa'
      FieldName = 'COD_EMPRESA'
      Origin = '"PERFIL_VENDEDOR"."COD_EMPRESA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CdsPColabATIVO: TIntegerField
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
      Origin = '"PERFIL_VENDEDOR"."ATIVO"'
    end
    object CdsPColabNOME_PERFIL: TStringField
      DisplayLabel = 'Nome do Perfil'
      FieldName = 'NOME_PERFIL'
      ProviderFlags = []
      FixedChar = True
      Size = 30
    end
  end
  object dspPcolab: TDataSetProvider
    DataSet = qrPColab
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 244
    Top = 120
  end
  object qrPColab: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacaoColab
    SQL.Strings = (
      
        'select pv.*,pc.nome_perfil from PERFIL_VENDEDOR pv inner join pe' +
        'rfil_comissao pc '
      'on pv.codigo_perfil = pc.codigo_perfil  where 1=0')
    Left = 244
    Top = 72
    object qrPColabCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
      Origin = '"PERFIL_VENDEDOR"."COD_VENDEDOR"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrPColabCODIGO_PERFIL: TIntegerField
      FieldName = 'CODIGO_PERFIL'
      Origin = '"PERFIL_VENDEDOR"."CODIGO_PERFIL"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrPColabCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Origin = '"PERFIL_VENDEDOR"."COD_EMPRESA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrPColabATIVO: TIntegerField
      FieldName = 'ATIVO'
      Origin = '"PERFIL_VENDEDOR"."ATIVO"'
    end
    object qrPColabNOME_PERFIL: TIBStringField
      FieldName = 'NOME_PERFIL'
      Origin = '"PERFIL_COMISSAO"."NOME_PERFIL"'
      ProviderFlags = []
      FixedChar = True
      Size = 30
    end
  end
  object dsPercolab: TDataSource
    DataSet = CdsPColab
    Left = 244
    Top = 224
  end
  object dsCidades: TDataSource
    DataSet = qrCidades
    Left = 320
    Top = 323
  end
  object qrCidades: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacaoColab
    SQL.Strings = (
      'select * from CIDADES')
    Left = 320
    Top = 275
  end
  object dsUF: TDataSource
    DataSet = grUF
    Left = 412
    Top = 323
  end
  object grUF: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacaoColab
    SQL.Strings = (
      'select * from ESTADOS')
    Left = 412
    Top = 275
  end
  object dsBairro: TDataSource
    DataSet = qrBairro
    Left = 492
    Top = 323
  end
  object qrBairro: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacaoColab
    SQL.Strings = (
      'select * from BAIRROS')
    Left = 492
    Top = 275
  end
  object qrF: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacaoColab
    SQL.Strings = (
      'select * from FUNCOES where 1=0')
    Left = 565
    Top = 80
  end
  object dspF: TDataSetProvider
    DataSet = qrF
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 565
    Top = 128
  end
  object cdsF: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspF'
    BeforeOpen = cdsColabBeforeOpen
    Left = 565
    Top = 176
    object cdsFCOD_FUNCAO: TIntegerField
      FieldName = 'COD_FUNCAO'
      Required = True
    end
    object cdsFCOD_DEPTO: TIntegerField
      FieldName = 'COD_DEPTO'
      Required = True
    end
    object cdsFDESC_FUNCAO: TStringField
      FieldName = 'DESC_FUNCAO'
      FixedChar = True
      Size = 30
    end
    object cdsFTPDOCS_VND: TMemoField
      FieldName = 'TPDOCS_VND'
      BlobType = ftMemo
      Size = 8
    end
    object cdsFATIVO: TIntegerField
      FieldName = 'ATIVO'
    end
    object cdsFDPTO: TStringField
      FieldKind = fkLookup
      FieldName = 'DPTO'
      LookupDataSet = qrDpto
      LookupKeyFields = 'COD_DEPTO'
      LookupResultField = 'NOME_DEPTO'
      KeyFields = 'COD_DEPTO'
      Size = 15
      Lookup = True
    end
  end
  object dsF: TDataSource
    DataSet = cdsF
    Left = 565
    Top = 224
  end
  object qrBuscasPColab: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacaoColab
    SQL.Strings = (
      
        'select pv.*,pc.nome_perfil from PERFIL_VENDEDOR pv inner join pe' +
        'rfil_comissao pc '
      'on pv.codigo_perfil = pc.codigo_perfil  where 1=0')
    Left = 244
    Top = 280
  end
  object transacaoFuncoes: TIBTransaction
    DefaultDatabase = dtmAtivo.bancoHw
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 200
    Top = 8
  end
  object qrBuscasFunc: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacaoFuncoes
    Left = 72
    Top = 272
  end
  object qrGerente: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacaoFuncoes
    SQL.Strings = (
      
        'select cod_vendedor, cod_empresa, nome_vendedor from colaborador' +
        ' where cod_vendedor = :cod_vendedor and cod_empresa = :cod_empre' +
        'sa')
    Left = 184
    Top = 80
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cod_vendedor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cod_empresa'
        ParamType = ptUnknown
      end>
  end
  object dspGerente: TDataSetProvider
    DataSet = qrGerente
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 184
    Top = 128
  end
  object cdsGerente: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspGerente'
    BeforeOpen = cdsColabBeforeOpen
    Left = 184
    Top = 176
    object cdsGerenteCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
      Required = True
    end
    object cdsGerenteNOME_VENDEDOR: TStringField
      FieldName = 'NOME_VENDEDOR'
      Size = 35
    end
    object cdsGerenteCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
  end
  object dsGerente: TDataSource
    DataSet = cdsGerente
    Left = 184
    Top = 224
  end
  object qrLancDebCred: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacaoLanDebCred
    SQL.Strings = (
      'select * from LANC_DEBCRED')
    Left = 640
    Top = 80
  end
  object dspLancDebCred: TDataSetProvider
    DataSet = qrLancDebCred
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 640
    Top = 128
  end
  object cdsLancDebCred: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspLancDebCred'
    BeforeOpen = cdsColabBeforeOpen
    Left = 640
    Top = 176
    object cdsLancDebCredCOD_LANC: TIntegerField
      Tag = 2
      DisplayLabel = 'Codigo'
      FieldName = 'COD_LANC'
      Required = True
    end
    object cdsLancDebCredCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsLancDebCredCOD_VENDEDOR: TIntegerField
      Tag = 2
      DisplayLabel = 'Cod Vendedor'
      FieldName = 'COD_VENDEDOR'
    end
    object cdsLancDebCredDATA_LANC: TDateTimeField
      Tag = 2
      DisplayLabel = 'Data Lan'#231'amento'
      FieldName = 'DATA_LANC'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsLancDebCredHORA_LANC: TTimeField
      DisplayLabel = 'Hora Lan'#231'amento'
      FieldName = 'HORA_LANC'
    end
    object cdsLancDebCredVL_LANCDEBCRED: TFloatField
      Tag = 2
      DisplayLabel = 'Valor do Lan'#231'amento'
      FieldName = 'VL_LANCDEBCRED'
      currency = True
    end
    object cdsLancDebCredDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      Size = 48
    end
    object cdsLancDebCredORIGEM_LANC: TStringField
      DisplayLabel = 'Origem do Lan'#231'amento'
      FieldName = 'ORIGEM_LANC'
      Size = 16
    end
    object cdsLancDebCredNPEDORIGEM: TIntegerField
      DisplayLabel = 'Num. Pedido Origem'
      FieldName = 'NPEDORIGEM'
    end
  end
  object dsLancDebCred: TDataSource
    DataSet = cdsLancDebCred
    Left = 640
    Top = 224
  end
  object transacaoLanDebCred: TIBTransaction
    DefaultDatabase = dtmAtivo.bancoHw
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 320
    Top = 16
  end
  object qrTipoLancdc: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacaoLanDebCred
    SQL.Strings = (
      'select * from tipo_lancdebcred where cod_tipolancdc=-1')
    Left = 736
    Top = 80
  end
  object dspTipoLancdc: TDataSetProvider
    DataSet = qrTipoLancdc
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 736
    Top = 128
  end
  object cdsTipoLancdc: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTipoLancdc'
    BeforeOpen = cdsColabBeforeOpen
    Left = 736
    Top = 176
    object cdsTipoLancdcCOD_TIPOLANCDC: TIntegerField
      Tag = 2
      DisplayLabel = 'Cod Tipo Lanc DC'
      FieldName = 'COD_TIPOLANCDC'
      Required = True
    end
    object cdsTipoLancdcCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
      Visible = False
    end
    object cdsTipoLancdcNATUREZA_LAN: TStringField
      Tag = 2
      DisplayLabel = 'Natureza Lanc'
      FieldName = 'NATUREZA_LAN'
      FixedChar = True
      Size = 1
    end
    object cdsTipoLancdcTIPO_LANC: TStringField
      Tag = 2
      DisplayLabel = 'Tipo de Lan'#231'amento'
      FieldName = 'TIPO_LANC'
      Size = 16
    end
    object cdsTipoLancdcDESCRICAOLANC: TStringField
      Tag = 2
      DisplayLabel = 'Descri'#231#227'o do Lan'#231'amento'
      FieldName = 'DESCRICAOLANC'
      Size = 48
    end
  end
  object dsTipoLancdc: TDataSource
    DataSet = cdsTipoLancdc
    Left = 736
    Top = 224
  end
  object qrLcolab: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacaoLanDebCred
    SQL.Strings = (
      'select * from COLABORADOR where cod_vendedor=-1')
    Left = 800
    Top = 88
  end
  object dspLcolab: TDataSetProvider
    DataSet = qrLcolab
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 800
    Top = 136
  end
  object cdsLcolab: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspLcolab'
    BeforeOpen = cdsColabBeforeOpen
    Left = 800
    Top = 184
    object cdsLcolabCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
      Required = True
    end
    object cdsLcolabNOME_VENDEDOR: TStringField
      FieldName = 'NOME_VENDEDOR'
      Size = 35
    end
  end
  object dsLcolab: TDataSource
    DataSet = cdsLcolab
    Left = 800
    Top = 232
  end
  object qrParticipante: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacaoColab
    SQL.Strings = (
      'select * from PARTICIPANTE')
    Left = 885
    Top = 80
  end
  object dspParticipante: TDataSetProvider
    DataSet = qrParticipante
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 885
    Top = 128
  end
  object cdsParticipante: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspParticipante'
    BeforeOpen = cdsColabBeforeOpen
    Left = 885
    Top = 176
    object cdsParticipanteSEL: TStringField
      DisplayLabel = 'Sel'
      FieldKind = fkInternalCalc
      FieldName = 'SEL'
      Size = 1
    end
    object cdsParticipanteCOD_PARTICIPANTE: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'COD_PARTICIPANTE'
      Required = True
    end
    object cdsParticipanteCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsParticipanteCODIGO_UF: TSmallintField
      DisplayLabel = 'Cod Uf'
      FieldName = 'CODIGO_UF'
    end
    object cdsParticipanteNOME_PARTICIPANTE: TStringField
      DisplayLabel = 'Participante'
      FieldName = 'NOME_PARTICIPANTE'
      Size = 35
    end
    object cdsParticipanteEND_PARTICIPANTE: TStringField
      DisplayLabel = 'Endereco'
      FieldName = 'END_PARTICIPANTE'
      Size = 35
    end
    object cdsParticipanteBAIRRO_PARTICIPANTE: TStringField
      DisplayLabel = 'Bairro'
      FieldName = 'BAIRRO_PARTICIPANTE'
      Size = 35
    end
    object cdsParticipanteCIDADE_PARTICIPANTE: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'CIDADE_PARTICIPANTE'
      Size = 35
    end
    object cdsParticipanteSIGLA_UF: TStringField
      DisplayLabel = 'Sigla'
      FieldName = 'SIGLA_UF'
      FixedChar = True
      Size = 2
    end
    object cdsParticipanteCEP_PARTICIPANTE: TStringField
      DisplayLabel = 'CEP'
      FieldName = 'CEP_PARTICIPANTE'
      EditMask = '00000\-999;0;'
      FixedChar = True
      Size = 9
    end
    object cdsParticipanteFONE_PARTICIPANTE: TStringField
      DisplayLabel = 'Fone'
      FieldName = 'FONE_PARTICIPANTE'
      EditMask = '(99) 9999-9999;0;_'
      FixedChar = True
      Size = 14
    end
    object cdsParticipanteCPF_PARTICIPANTE: TStringField
      DisplayLabel = '(99) 9999-9999;0;_'
      FieldName = 'CPF_PARTICIPANTE'
      FixedChar = True
      Size = 11
    end
    object cdsParticipanteOBS_PARTICIPANTE: TMemoField
      DisplayLabel = 'Observacao'
      FieldName = 'OBS_PARTICIPANTE'
      BlobType = ftMemo
      Size = 8
    end
    object cdsParticipanteDATA_MOD_PART: TDateTimeField
      DisplayLabel = 'Data Modificacao'
      FieldName = 'DATA_MOD_PART'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsParticipanteDATA_CAD_PART: TDateTimeField
      DisplayLabel = 'Data Cadastro'
      FieldName = 'DATA_CAD_PART'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsParticipanteDAT_NASC_PART: TDateTimeField
      DisplayLabel = 'Data Nasc'
      FieldName = 'DAT_NASC_PART'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsParticipanteEMAIL: TStringField
      DisplayLabel = 'Email'
      FieldName = 'EMAIL'
      Size = 128
    end
    object cdsParticipanteFONE_CONTATO: TStringField
      DisplayLabel = 'Fone Contato'
      FieldName = 'FONE_CONTATO'
      FixedChar = True
      Size = 40
    end
    object cdsParticipanteCOD_CIDADE: TSmallintField
      DisplayLabel = 'Cod Cidade'
      FieldName = 'COD_CIDADE'
    end
    object cdsParticipanteCOD_BAIRRO: TSmallintField
      DisplayLabel = 'Cod Bairro'
      FieldName = 'COD_BAIRRO'
    end
    object cdsParticipanteATIVO: TIntegerField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
    object cdsParticipantePC_VEND_PROD: TFloatField
      DisplayLabel = 'Porc. Venda Produto'
      FieldName = 'PC_VEND_PROD'
    end
  end
  object dsParticipante: TDataSource
    DataSet = cdsParticipante
    Left = 885
    Top = 224
  end
  object qrCalendColaboradorExc: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacaoColab
    SQL.Strings = (
      
        'select calend_colab_exc.*, colaborador.nome_vendedor from calend' +
        '_colab_exc'
      'inner join colaborador on'
      '  colaborador.cod_vendedor = calend_colab_exc.cod_colaborador'
      '  and colaborador.cod_empresa = calend_colab_exc.cod_empresa'
      'where calend_colab_exc.cod_empresa = 1')
    Left = 637
    Top = 296
  end
  object dspCalendColaboradorExc: TDataSetProvider
    DataSet = qrCalendColaboradorExc
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 637
    Top = 344
  end
  object cdsCalendColaboradorExc: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCalendColaboradorExc'
    BeforeOpen = cdsColabBeforeOpen
    Left = 637
    Top = 392
    object cdsCalendColaboradorExcCODIGO: TIntegerField
      Tag = 1
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO'
      Required = True
    end
    object cdsCalendColaboradorExcCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsCalendColaboradorExcCOD_COLABORADOR: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Colaborador'
      FieldName = 'COD_COLABORADOR'
      Required = True
    end
    object cdsCalendColaboradorExcDATA: TDateTimeField
      DisplayLabel = 'Data'
      FieldName = 'DATA'
      Required = True
      EditMask = '!99/99/0000;1;_'
    end
    object cdsCalendColaboradorExcTRABALHAR: TStringField
      DisplayLabel = 'Trabalhar'
      FieldName = 'TRABALHAR'
      Size = 1
    end
    object cdsCalendColaboradorExcMOTIVO: TStringField
      DisplayLabel = 'Motivo'
      FieldName = 'MOTIVO'
      Size = 60
    end
    object cdsCalendColaboradorExcHORA_INI: TStringField
      DisplayLabel = 'Hora Ini'
      FieldName = 'HORA_INI'
      EditMask = '!90:00:00;1;_'
      Size = 8
    end
    object cdsCalendColaboradorExcHORA_FIM: TStringField
      DisplayLabel = 'Hora Fim'
      FieldName = 'HORA_FIM'
      EditMask = '!90:00:00;1;_'
      Size = 8
    end
    object cdsCalendColaboradorExcNOME_VENDEDOR: TStringField
      DisplayLabel = 'Nome Colaborador'
      FieldName = 'NOME_VENDEDOR'
      Size = 35
    end
  end
  object dsCalendColaboradorExc: TDataSource
    DataSet = cdsCalendColaboradorExc
    Left = 637
    Top = 440
  end
  object qrColaboradorCalendColaboradorExc: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacaoColab
    SQL.Strings = (
      'select cod_vendedor, nome_vendedor from colaborador'
      'where ativo <> 99'
      'and cod_empresa = 1')
    Left = 805
    Top = 296
  end
  object dspColaboradorCalendColaboradorExc: TDataSetProvider
    DataSet = qrColaboradorCalendColaboradorExc
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 805
    Top = 344
  end
  object cdsColaboradorCalendColaboradorExc: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspColaboradorCalendColaboradorExc'
    BeforeOpen = cdsColabBeforeOpen
    Left = 805
    Top = 392
    object cdsColaboradorCalendColaboradorExcCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
      Required = True
    end
    object cdsColaboradorCalendColaboradorExcNOME_VENDEDOR: TStringField
      FieldName = 'NOME_VENDEDOR'
      Size = 35
    end
  end
  object dsColaboradorCalendColaboradorExc: TDataSource
    DataSet = cdsColaboradorCalendColaboradorExc
    Left = 805
    Top = 440
  end
  object qrCalendEscalaSemanal: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacaoColab
    SQL.Strings = (
      'select * from calend_escala_semanal'
      'where cod_empresa = 1')
    Left = 997
    Top = 296
  end
  object dspCalendEscalaSemanal: TDataSetProvider
    DataSet = qrCalendEscalaSemanal
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 997
    Top = 344
  end
  object cdsCalendEscalaSemanal: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCalendEscalaSemanal'
    BeforeOpen = cdsColabBeforeOpen
    Left = 997
    Top = 392
    object cdsCalendEscalaSemanalCODIGO: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO'
      Required = True
    end
    object cdsCalendEscalaSemanalCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsCalendEscalaSemanalDESCRICAO: TStringField
      DisplayLabel = 'Descricao'
      FieldName = 'DESCRICAO'
      Size = 60
    end
  end
  object dsCalendEscalaSemanal: TDataSource
    DataSet = cdsCalendEscalaSemanal
    Left = 997
    Top = 440
  end
  object qrCalendEscalaSemanalDia: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacaoColab
    SQL.Strings = (
      'select * from calend_escala_semanal_itens'
      'where cod_empresa = 1')
    Left = 1157
    Top = 296
  end
  object dspCalendEscalaSemanalDia: TDataSetProvider
    DataSet = qrCalendEscalaSemanalDia
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1157
    Top = 344
  end
  object cdsCalendEscalaSemanalDia: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCalendEscalaSemanalDia'
    BeforeOpen = cdsColabBeforeOpen
    Left = 1157
    Top = 392
    object cdsCalendEscalaSemanalDiaCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object cdsCalendEscalaSemanalDiaCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsCalendEscalaSemanalDiaDIA: TIntegerField
      FieldName = 'DIA_SEMANA'
      Required = True
    end
    object cdsCalendEscalaSemanalDiaHORA_INI: TStringField
      FieldName = 'HORA_INI'
      Size = 8
    end
    object cdsCalendEscalaSemanalDiaHORA_FIM: TStringField
      FieldName = 'HORA_FIM'
      Size = 8
    end
  end
  object dsCalendEscalaSemanalDia: TDataSource
    DataSet = cdsCalendEscalaSemanalDia
    Left = 1157
    Top = 440
  end
  object qrJornadaTrabalho: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacaoColab
    SQL.Strings = (
      'select * from jornada_trabalho'
      'where cod_empresa = 1')
    Left = 1045
    Top = 80
  end
  object dspJornadaTrabalho: TDataSetProvider
    DataSet = qrJornadaTrabalho
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1045
    Top = 128
  end
  object cdsJornadaTrabalho: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspJornadaTrabalho'
    BeforeOpen = cdsColabBeforeOpen
    Left = 1045
    Top = 176
    object cdsJornadaTrabalhoCODIGO: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO'
      Required = True
    end
    object cdsJornadaTrabalhoCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsJornadaTrabalhoDESCRICAO: TStringField
      DisplayLabel = 'Descricao'
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object cdsJornadaTrabalhoHORARIO_INI_PADRAO: TStringField
      DisplayLabel = 'Hora Ini'
      FieldName = 'HORARIO_INI_PADRAO'
      EditMask = '!90:00;1;_'
      Size = 5
    end
    object cdsJornadaTrabalhoHORARIO_FIM_PADRAO: TStringField
      DisplayLabel = 'Hora Fim'
      FieldName = 'HORARIO_FIM_PADRAO'
      EditMask = '!90:00;1;_'
      Size = 5
    end
    object cdsJornadaTrabalhoDIAS_FOLGA_SEMANAIS: TStringField
      DisplayLabel = 'Dias Folga Semana'
      FieldName = 'DIAS_FOLGA_SEMANAIS'
    end
  end
  object dsJornadaTrabalho: TDataSource
    DataSet = cdsJornadaTrabalho
    Left = 1045
    Top = 224
  end
  object qrEscalaSemanalCol: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacaoColab
    SQL.Strings = (
      
        'select calend_escala_semanal.codigo, calend_escala_semanal.descr' +
        'icao from calend_escala_semanal'
      'where calend_escala_semanal.cod_empresa = 1')
    Left = 45
    Top = 400
  end
  object dspEscalaSemanalCol: TDataSetProvider
    DataSet = qrEscalaSemanalCol
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 45
    Top = 448
  end
  object cdsEscalaSemanalCol: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEscalaSemanalCol'
    BeforeOpen = cdsColabBeforeOpen
    Left = 45
    Top = 496
    object cdsEscalaSemanalColCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object cdsEscalaSemanalColDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
  end
  object dsEscalaSemanalCol: TDataSource
    DataSet = cdsEscalaSemanalCol
    Left = 45
    Top = 544
  end
  object qrJornadaTrabalhoCol: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacaoColab
    SQL.Strings = (
      
        'select jornada_trabalho.codigo, jornada_trabalho.cod_empresa fro' +
        'm jornada_trabalho'
      'where jornada_trabalho.cod_empresa = 1')
    Left = 181
    Top = 400
  end
  object dspJornadaTrabalhoCol: TDataSetProvider
    DataSet = qrJornadaTrabalhoCol
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 181
    Top = 448
  end
  object cdsJornadaTrabalhoCol: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEscalaSemanalCol'
    BeforeOpen = cdsColabBeforeOpen
    Left = 181
    Top = 496
    object IntegerField3: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object StringField1: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
  end
  object dsJornadaTrabalhoCol: TDataSource
    DataSet = cdsJornadaTrabalhoCol
    Left = 181
    Top = 544
  end
end
