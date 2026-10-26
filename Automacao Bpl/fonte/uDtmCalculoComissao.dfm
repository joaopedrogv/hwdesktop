object dtmCalculoComissao: TdtmCalculoComissao
  OldCreateOrder = False
  Height = 498
  Width = 1018
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
  object qrBuscas: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    Left = 200
    Top = 8
  end
  object qrPerfCom: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select * from PERFIL_COMISSAO'
      'where ativo = 1')
    Left = 29
    Top = 64
  end
  object dspPerfCom: TDataSetProvider
    DataSet = qrPerfCom
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 29
    Top = 112
  end
  object cdsPerfCom: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspPerfCom'
    BeforeOpen = cdsPerfComBeforeOpen
    Left = 29
    Top = 160
    object cdsPerfComCODIGO_PERFIL: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO_PERFIL'
      Required = True
    end
    object cdsPerfComNOME_PERFIL: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME_PERFIL'
      FixedChar = True
      Size = 30
    end
    object cdsPerfComTIPO_PERFIL: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO_PERFIL'
      FixedChar = True
    end
    object cdsPerfComABRANG_PERFIL: TStringField
      DisplayLabel = 'Comissao por'
      FieldName = 'ABRANG_PERFIL'
      FixedChar = True
    end
    object cdsPerfComEM_CIMA_PERFIL: TStringField
      DisplayLabel = 'Em Cima de'
      FieldName = 'EM_CIMA_PERFIL'
      FixedChar = True
    end
    object cdsPerfComTIPO_SERV_PROD: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO_SERV_PROD'
      FixedChar = True
    end
    object cdsPerfComFLAG_SERV_PROD: TStringField
      DisplayLabel = 'Sele'#231#227'o'
      FieldName = 'FLAG_SERV_PROD'
      FixedChar = True
    end
    object cdsPerfComCONTEUDO_FLAG: TMemoField
      DisplayLabel = 'Conte'#250'do Sele'#231#227'o'
      FieldName = 'CONTEUDO_FLAG'
      BlobType = ftMemo
      Size = 8
    end
    object cdsPerfComTABELAS_PERFIL: TMemoField
      DisplayLabel = 'Tabelas Para C'#225'lculo'
      FieldName = 'TABELAS_PERFIL'
      BlobType = ftMemo
      Size = 8
    end
    object cdsPerfComDATA_CADASTRO: TDateTimeField
      DisplayLabel = 'Data Cadastro'
      FieldName = 'DATA_CADASTRO'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsPerfComPERC_PESO: TFloatField
      DisplayLabel = 'Percentual Com(%)'
      FieldName = 'PERC_PESO'
      DisplayFormat = '##0.00'
    end
    object cdsPerfComATIVO: TIntegerField
      FieldName = 'ATIVO'
      Visible = False
    end
  end
  object dsPerfCom: TDataSource
    DataSet = cdsPerfCom
    Left = 29
    Top = 208
  end
  object qrMetasCom: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select mv.*, pm.codigo_perfil from metas_vendas mv'
      
        'inner join perfil_metas pm on pm.codigo_meta = mv.codigo_meta an' +
        'd'
      
        'pm.cod_empresa = mv.cod_empresa and mv.ativo = 1 and pm.ativo = ' +
        '1')
    Left = 109
    Top = 64
  end
  object dspMetasCom: TDataSetProvider
    DataSet = qrMetasCom
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 109
    Top = 112
  end
  object cdsMetasCom: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspMetasCom'
    BeforeOpen = cdsPerfComBeforeOpen
    Left = 109
    Top = 160
    object cdsMetasComCODIGO_META: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO_META'
      Required = True
    end
    object cdsMetasComCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
      Visible = False
    end
    object cdsMetasComDESCRICAO_META: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO_META'
      FixedChar = True
      Size = 30
    end
    object cdsMetasComVALOR_META: TFloatField
      DisplayLabel = 'Valor Inicial Meta'
      FieldName = 'VALOR_META'
      DisplayFormat = '#,###0.00'
    end
    object cdsMetasComVALOR_META1: TFloatField
      DisplayLabel = 'Valor Final Meta'
      FieldName = 'VALOR_META1'
      DisplayFormat = '#,###0.00'
    end
    object cdsMetasComCOMISSAO_META: TFloatField
      DisplayLabel = 'Comiss'#227'o(%)'
      FieldName = 'COMISSAO_META'
    end
    object cdsMetasComMES_META: TIntegerField
      DisplayLabel = 'M'#234's da meta'
      FieldName = 'MES_META'
    end
    object cdsMetasComANO_META: TIntegerField
      DisplayLabel = 'Ano da meta'
      FieldName = 'ANO_META'
    end
    object cdsMetasComTIPO_META: TStringField
      DisplayLabel = 'Tipo da meta'
      FieldName = 'TIPO_META'
      FixedChar = True
      Size = 1
    end
    object cdsMetasComDATA_CADASTRO: TDateTimeField
      DisplayLabel = 'Data Cadastro'
      FieldName = 'DATA_CADASTRO'
    end
    object cdsMetasComATIVO: TIntegerField
      FieldName = 'ATIVO'
      Visible = False
    end
    object cdsMetasComCODIGO_PERFIL: TIntegerField
      DisplayLabel = 'C'#243'digo Perfil'
      FieldName = 'CODIGO_PERFIL'
      Required = True
    end
  end
  object dsMetasCom: TDataSource
    DataSet = cdsMetasCom
    Left = 109
    Top = 208
  end
  object qrColabCom: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      
        'select col.cod_vendedor, col.nome_vendedor, col.cod_funcao, col.' +
        'perc_peso, dt.cod_depto'
      'from colaborador col'
      'left join funcoes fu on fu.cod_funcao = col.cod_funcao'
      'left join depto dt on dt.cod_depto = fu.cod_depto')
    Left = 197
    Top = 64
  end
  object dspColabCom: TDataSetProvider
    DataSet = qrColabCom
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 197
    Top = 112
  end
  object cdsColabCom: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspColabCom'
    BeforeOpen = cdsPerfComBeforeOpen
    Left = 197
    Top = 160
    object cdsColabComCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
      Required = True
    end
    object cdsColabComNOME_VENDEDOR: TStringField
      FieldName = 'NOME_VENDEDOR'
      Size = 35
    end
    object cdsColabComCOD_FUNCAO: TIntegerField
      FieldName = 'COD_FUNCAO'
    end
    object cdsColabComPERC_PESO: TFloatField
      FieldName = 'PERC_PESO'
    end
    object cdsColabComCOD_DEPTO: TIntegerField
      FieldName = 'COD_DEPTO'
    end
  end
  object dsColabCom: TDataSource
    DataSet = cdsColabCom
    Left = 197
    Top = 208
  end
  object cdsCalcComissao: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 280
    Top = 8
    object cdsCalcComissaoCODIGO_PERFIL: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO_PERFIL'
      Size = 10
    end
    object cdsCalcComissaoNOME_PERFIL: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 30
      FieldName = 'NOME_PERFIL'
      Size = 30
    end
    object cdsCalcComissaoVALORLIQMO: TFloatField
      DisplayLabel = 'Valor Liq. M.O.'
      FieldName = 'VALORLIQMO'
      DisplayFormat = '#,###0.00'
    end
    object cdsCalcComissaoVALORLIQPC: TFloatField
      DisplayLabel = 'Valor Liq. Pe'#231'as'
      FieldName = 'VALORLIQPC'
      DisplayFormat = '#,###0.00'
    end
    object cdsCalcComissaoVALORLUCROMO: TFloatField
      DisplayLabel = 'Lucro M.O.'
      FieldName = 'VALORLUCROMO'
      DisplayFormat = '#,###0.00'
    end
    object cdsCalcComissaoVALORLUCROPC: TFloatField
      DisplayLabel = 'Lucro Pe'#231'as'
      FieldName = 'VALORLUCROPC'
      DisplayFormat = '#,###0.00'
    end
    object cdsCalcComissaoVALORRECDIN: TFloatField
      DisplayLabel = 'Rec.DN'
      FieldName = 'VALORRECDIN'
      DisplayFormat = '#,###0.00'
    end
    object cdsCalcComissaoVALORRECPRAZO: TFloatField
      DisplayLabel = 'Rec.CHQ/AP'
      FieldName = 'VALORRECPRAZO'
      DisplayFormat = '#,###0.00'
    end
    object cdsCalcComissaoVALORCOMISSPROD: TFloatField
      DisplayLabel = 'Tl. Com. Prod'
      FieldName = 'VALORCOMISSPROD'
      DisplayFormat = '#,###0.00'
    end
    object cdsCalcComissaoABRANG_PERFIL: TStringField
      DisplayLabel = 'Por(Peso/Ind.)'
      FieldName = 'ABRANG_PERFIL'
    end
    object cdsCalcComissaoTIPO_SERV_PROD: TStringField
      DisplayLabel = 'Tipo(Prod/Serv)'
      FieldName = 'TIPO_SERV_PROD'
    end
    object cdsCalcComissaoEM_CIMA_PERFIL: TStringField
      DisplayLabel = 'Em Cima de'
      FieldName = 'EM_CIMA_PERFIL'
    end
    object cdsCalcComissaoPERCENTUALMETA: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'Perc. Meta'
      FieldName = 'PERCENTUALMETA'
      Size = 10
    end
    object cdsCalcComissaoQTDEOSABERTAS: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'Qtde O.S. Abertas'
      FieldName = 'QTDEOSABERTAS'
      Size = 10
    end
    object cdsCalcComissaoVALORCOMISSAO: TFloatField
      DisplayLabel = 'Comiss'#227'o'
      FieldName = 'VALORCOMISSAO'
      DisplayFormat = '#,###0.00'
    end
    object cdsCalcComissaoTIPO_PERFIL: TStringField
      DisplayLabel = 'Tipo Perfil'
      FieldName = 'TIPO_PERFIL'
    end
  end
  object dsCalcComissao: TDataSource
    DataSet = cdsCalcComissao
    Left = 376
    Top = 8
  end
end
