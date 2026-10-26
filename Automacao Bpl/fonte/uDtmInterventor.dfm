object dtmInterventor: TdtmInterventor
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 304
  Top = 140
  Height = 403
  Width = 673
  object dspAtestado: TDataSetProvider
    DataSet = qrAtestado
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 28
    Top = 113
  end
  object cdsAtestado: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAtestado'
    BeforeOpen = cdsAtestadoBeforeOpen
    Left = 28
    Top = 170
    object cdsAtestadoN_OS: TIntegerField
      FieldName = 'N_OS'
      Required = True
    end
    object cdsAtestadoTIPO: TStringField
      FieldName = 'TIPO'
      Required = True
      FixedChar = True
      Size = 3
    end
    object cdsAtestadoCOD_EQUIP: TIntegerField
      FieldName = 'COD_EQUIP'
      Required = True
    end
    object cdsAtestadoCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsAtestadoLACRE_MFD: TStringField
      FieldName = 'LACRE_MFD'
    end
    object cdsAtestadoACUMULADOS_ANTES: TMemoField
      FieldName = 'ACUMULADOS_ANTES'
      BlobType = ftMemo
      Size = 8
    end
    object cdsAtestadoACUMULADOS_DEPOIS: TMemoField
      FieldName = 'ACUMULADOS_DEPOIS'
      BlobType = ftMemo
      Size = 8
    end
    object cdsAtestadoLACRERETIRADO: TMemoField
      FieldName = 'LACRERETIRADO'
      BlobType = ftMemo
      Size = 8
    end
    object cdsAtestadoCORRETIRADO: TMemoField
      FieldName = 'CORRETIRADO'
      BlobType = ftMemo
      Size = 8
    end
    object cdsAtestadoLACREAPLICADO: TMemoField
      FieldName = 'LACREAPLICADO'
      BlobType = ftMemo
      Size = 8
    end
    object cdsAtestadoCORAPLICADO: TMemoField
      FieldName = 'CORAPLICADO'
      BlobType = ftMemo
      Size = 8
    end
    object cdsAtestadoLACREUTIL: TMemoField
      FieldName = 'LACREUTIL'
      BlobType = ftMemo
      Size = 8
    end
    object cdsAtestadoCORUTIL: TMemoField
      FieldName = 'CORUTIL'
      BlobType = ftMemo
      Size = 8
    end
    object cdsAtestadoLOCALINTERVENCAO: TStringField
      FieldName = 'LOCALINTERVENCAO'
      FixedChar = True
      Size = 1
    end
    object cdsAtestadoDATAINICIO: TDateTimeField
      FieldName = 'DATAINICIO'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsAtestadoDATAFINAL: TDateTimeField
      FieldName = 'DATAFINAL'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsAtestadoPERDADADOS_MT: TStringField
      FieldName = 'PERDADADOS_MT'
      FixedChar = True
      Size = 1
    end
    object cdsAtestadoEMPRESA_INTER_ANT: TStringField
      FieldName = 'EMPRESA_INTER_ANT'
      Size = 64
    end
    object cdsAtestadoNUM_ATEST_INTER_ANT: TStringField
      FieldName = 'NUM_ATEST_INTER_ANT'
      Size = 32
    end
    object cdsAtestadoMOTIVO_INTERVENCAO: TStringField
      FieldName = 'MOTIVO_INTERVENCAO'
      FixedChar = True
      Size = 1
    end
    object cdsAtestadoSUBSTITUICAO_SB: TStringField
      FieldName = 'SUBSTITUICAO_SB'
      FixedChar = True
      Size = 1
    end
    object cdsAtestadoVERSAO_SB_ANT: TStringField
      FieldName = 'VERSAO_SB_ANT'
    end
    object cdsAtestadoVERSAO_SB_ATUAL: TStringField
      FieldName = 'VERSAO_SB_ATUAL'
    end
    object cdsAtestadoNUM_DISP_SB_ANT: TStringField
      FieldName = 'NUM_DISP_SB_ANT'
    end
    object cdsAtestadoNUM_DISP_SB_ATUAL: TStringField
      FieldName = 'NUM_DISP_SB_ATUAL'
    end
    object cdsAtestadoNUM_LACRE_SB_RET: TStringField
      FieldName = 'NUM_LACRE_SB_RET'
    end
    object cdsAtestadoNUM_LACRE_SB_COLOCADO: TStringField
      FieldName = 'NUM_LACRE_SB_COLOCADO'
    end
    object cdsAtestadoSERVICOS: TMemoField
      FieldName = 'SERVICOS'
      BlobType = ftMemo
      Size = 8
    end
    object cdsAtestadoN_NF_PROD: TIntegerField
      FieldName = 'N_NF_PROD'
    end
    object cdsAtestadoN_NF_SERV: TIntegerField
      FieldName = 'N_NF_SERV'
    end
    object cdsAtestadoTIPO_DISPOSITIVO: TStringField
      FieldName = 'TIPO_DISPOSITIVO'
      FixedChar = True
      Size = 1
    end
    object cdsAtestadoATIVO: TIntegerField
      FieldName = 'ATIVO'
    end
    object cdsAtestadoTOTALIZADORES: TMemoField
      FieldName = 'TOTALIZADORES'
      BlobType = ftMemo
      Size = 8
    end
  end
  object qrAtestado: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select * from ATESTADO_ECF')
    Left = 28
    Top = 54
  end
  object transacao: TIBTransaction
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
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    Left = 185
    Top = 1
  end
  object SpIncCodigo: TIBStoredProc
    Database = dtmAtivo.bancoHw
    Transaction = transacao
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
  object dsAtestado: TDataSource
    AutoEdit = False
    DataSet = cdsAtestado
    Left = 24
    Top = 224
  end
  object dspImpCNIEE: TDataSetProvider
    DataSet = qrImpCNIEE
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 108
    Top = 121
  end
  object cdsImpCNIEE: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspImpCNIEE'
    BeforeOpen = cdsAtestadoBeforeOpen
    Left = 108
    Top = 178
    object cdsImpCNIEEIDENTIFICACAO: TStringField
      FieldName = 'IDENTIFICACAO'
      Required = True
      FixedChar = True
      Size = 6
    end
    object cdsImpCNIEETIPO_ECF: TStringField
      FieldName = 'TIPO_ECF'
    end
    object cdsImpCNIEEMARCA_ECF: TStringField
      FieldName = 'MARCA_ECF'
    end
    object cdsImpCNIEEMODELO_ECF: TStringField
      FieldName = 'MODELO_ECF'
      Size = 35
    end
    object cdsImpCNIEEVERSAOSB: TStringField
      FieldName = 'VERSAOSB'
    end
    object cdsImpCNIEEQTDELACRESEXTSL: TIntegerField
      FieldName = 'QTDELACRESEXTSL'
    end
    object cdsImpCNIEEQTDELACRESEXTFAB: TIntegerField
      FieldName = 'QTDELACRESEXTFAB'
    end
    object cdsImpCNIEETEMFD: TStringField
      FieldName = 'TEMFD'
      FixedChar = True
      Size = 1
    end
    object cdsImpCNIEELACREMFD: TStringField
      FieldName = 'LACREMFD'
      FixedChar = True
      Size = 1
    end
    object cdsImpCNIEEATO_APROVACAO: TStringField
      FieldName = 'ATO_APROVACAO'
      Size = 30
    end
    object cdsImpCNIEEATIVO: TIntegerField
      FieldName = 'ATIVO'
    end
  end
  object qrImpCNIEE: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select * from IMPRESSORAS_CNIEE')
    Left = 108
    Top = 54
  end
  object dsImpCNIEE: TDataSource
    AutoEdit = False
    DataSet = cdsImpCNIEE
    Left = 104
    Top = 232
  end
end
