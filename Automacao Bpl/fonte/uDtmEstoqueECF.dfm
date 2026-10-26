object dtmEstoqueECF: TdtmEstoqueECF
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 479
  Width = 796
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
  object qrEstECF: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select * from ECF')
    Left = 29
    Top = 64
  end
  object dspEstEcf: TDataSetProvider
    DataSet = qrEstECF
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 29
    Top = 112
  end
  object cdsEstECF: TClientDataSet
    Tag = 1
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEstEcf'
    BeforeOpen = cdsEstECFBeforeOpen
    Left = 29
    Top = 160
    object cdsEstECFCOD_NSERIE: TIntegerField
      Tag = 2
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_NSERIE'
    end
    object cdsEstECFTIPO: TStringField
      Tag = 2
      DisplayLabel = 'E/O'
      FieldName = 'TIPO'
      Size = 1
    end
    object cdsEstECFN_SERIE_FAB: TStringField
      DisplayLabel = 'Num Serie Fabrica'#231#227'o'
      FieldName = 'N_SERIE_FAB'
      Required = True
    end
    object cdsEstECFCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsEstECFIDENTIFICACAO: TStringField
      DisplayLabel = 'CNIEE'
      FieldName = 'IDENTIFICACAO'
      FixedChar = True
      Size = 6
    end
    object cdsEstECFTIPO_ECF: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO_ECF'
    end
    object cdsEstECFMARCA_ECF: TStringField
      DisplayLabel = 'Marca'
      FieldName = 'MARCA_ECF'
    end
    object cdsEstECFMODELO_ECF: TStringField
      DisplayLabel = 'Modelo'
      FieldName = 'MODELO_ECF'
      Size = 35
    end
    object cdsEstECFVERSAOSB: TStringField
      DisplayLabel = 'Vers'#227'o SB'
      FieldName = 'VERSAOSB'
    end
    object cdsEstECFN_MEMORIA_FISCAL: TStringField
      DisplayLabel = 'Num Memoria Fiscal'
      FieldName = 'N_MEMORIA_FISCAL'
    end
    object cdsEstECFLACRE_EXTERNO1: TStringField
      DisplayLabel = 'Lacre Externo 1'
      FieldName = 'LACRE_EXTERNO1'
      Size = 12
    end
    object cdsEstECFLACRE_EXTERNO2: TStringField
      DisplayLabel = 'Lacre Externo 2'
      FieldName = 'LACRE_EXTERNO2'
      Size = 12
    end
    object cdsEstECFLACRE_EXTERNO3: TStringField
      DisplayLabel = 'Lacre Externo 3'
      FieldName = 'LACRE_EXTERNO3'
      Size = 12
    end
    object cdsEstECFLACRE_EXTERNO4: TStringField
      DisplayLabel = 'Lacre Externo 4'
      FieldName = 'LACRE_EXTERNO4'
      Size = 12
    end
    object cdsEstECFSTATUS: TStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      Size = 12
    end
    object cdsEstECFNREQ: TIntegerField
      Tag = 1
      FieldName = 'NREQ'
    end
    object cdsEstECFNNF: TIntegerField
      DisplayLabel = 'Num Nf Venda'
      FieldName = 'NNF'
    end
    object cdsEstECFSERIE: TStringField
      DisplayLabel = 'Serie Nf Venda'
      FieldName = 'SERIE'
      Size = 5
    end
    object cdsEstECFNNF_ENTRADA: TIntegerField
      DisplayLabel = 'Num NF Entrada'
      FieldName = 'NNF_ENTRADA'
    end
    object cdsEstECFSERIE_ENTRADA: TStringField
      DisplayLabel = 'Serie Nf Entrada'
      FieldName = 'SERIE_ENTRADA'
      Size = 5
    end
    object cdsEstECFCOD_FORNECEDOR: TIntegerField
      Tag = 1
      FieldName = 'COD_FORNECEDOR'
    end
    object cdsEstECFCOD_PROD: TStringField
      DisplayLabel = 'Codigo Prod'
      FieldName = 'COD_PROD'
      FixedChar = True
      Size = 6
    end
    object cdsEstECFGRUPO_PROD: TIntegerField
      DisplayLabel = 'Grupo'
      FieldName = 'GRUPO_PROD'
    end
    object cdsEstECFATIVO: TIntegerField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
    object cdsEstECFHOUVE_INTERVENCAO: TStringField
      DisplayLabel = 'Houve Interven'#231#227'o'
      FieldName = 'HOUVE_INTERVENCAO'
      FixedChar = True
      Size = 1
    end
    object cdsEstECFUSO_PROPRIO: TStringField
      DisplayLabel = 'Uso Proprio'
      FieldName = 'USO_PROPRIO'
      FixedChar = True
      Size = 1
    end
    object cdsEstECFTIPO_DISPOSITIVO: TStringField
      DisplayLabel = 'Lacre/Etiqueta'
      FieldName = 'TIPO_DISPOSITIVO'
      FixedChar = True
      Size = 1
    end
    object cdsEstECFNUM_DISP_PROT_SB: TStringField
      DisplayLabel = 'Num Disp Protecao SB'
      FieldName = 'NUM_DISP_PROT_SB'
      Size = 7
    end
    object cdsEstECFLACRE_MFD: TStringField
      DisplayLabel = 'Num Lacre'
      FieldName = 'LACRE_MFD'
      Size = 7
    end
    object cdsEstECFCOD_CLIENTE_INICIALIZACAO: TIntegerField
      DisplayLabel = 'Cliente Inicializa'#231#227'o'
      FieldName = 'COD_CLIENTE_INICIALIZACAO'
    end
    object cdsEstECFDATA_INICIALIZACAO: TDateTimeField
      DisplayLabel = 'Data Inicializa'#231#227'o'
      FieldName = 'DATA_INICIALIZACAO'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsEstECFCHAVE_PUBLICA: TStringField
      DisplayLabel = 'Chave Publica'
      FieldName = 'CHAVE_PUBLICA'
      Size = 256
    end
    object cdsEstECFCHAVE_PRIVADA: TStringField
      DisplayLabel = 'Chave Privada'
      FieldName = 'CHAVE_PRIVADA'
      Size = 256
    end
    object cdsEstECFNCUPOM: TIntegerField
      DisplayLabel = 'Num Cupom Venda'
      FieldName = 'NCUPOM'
    end
    object cdsEstECFCOD_TERMINAL: TIntegerField
      DisplayLabel = 'Num Caixa Venda'
      FieldName = 'COD_TERMINAL'
    end
    object cdsEstECFNSERIETERMINAL: TStringField
      DisplayLabel = 'Num Serie ECF Venda'
      FieldName = 'NSERIETERMINAL'
    end
    object cdsEstECFNPED: TIntegerField
      DisplayLabel = 'Num Venda'
      FieldName = 'NPED'
    end
    object cdsEstECFTIPO_PED: TStringField
      DisplayLabel = 'Tipo Venda'
      FieldName = 'TIPO_PED'
      Size = 3
    end
  end
  object dsEstECF: TDataSource
    DataSet = cdsEstECF
    Left = 29
    Top = 208
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
  object dsCNIEE: TDataSource
    DataSet = cdsCNIEE
    Left = 96
    Top = 208
  end
  object cdsCNIEE: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCNIEE'
    Left = 96
    Top = 159
    object cdsCNIEEIDENTIFICACAO: TStringField
      Tag = 2
      DisplayLabel = 'Identifica'#231#227'o'
      FieldName = 'IDENTIFICACAO'
      Required = True
      FixedChar = True
      Size = 6
    end
    object cdsCNIEETIPO_ECF: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO_ECF'
    end
    object cdsCNIEEMARCA_ECF: TStringField
      DisplayLabel = 'Marca'
      FieldName = 'MARCA_ECF'
    end
    object cdsCNIEEMODELO_ECF: TStringField
      DisplayLabel = 'Modelo'
      FieldName = 'MODELO_ECF'
      Size = 35
    end
    object cdsCNIEEVERSAOSB: TStringField
      DisplayLabel = 'Vers'#227'o'
      FieldName = 'VERSAOSB'
    end
    object cdsCNIEEQTDELACRESEXTSL: TIntegerField
      DisplayLabel = 'Qtde Lacres Ext. SL'
      FieldName = 'QTDELACRESEXTSL'
    end
    object cdsCNIEEQTDELACRESEXTFAB: TIntegerField
      DisplayLabel = 'Qtde Lacres Ext. Fab'
      FieldName = 'QTDELACRESEXTFAB'
    end
    object cdsCNIEETEMFD: TStringField
      DisplayLabel = 'Tem MFD ?'
      FieldName = 'TEMFD'
      FixedChar = True
      Size = 1
    end
    object cdsCNIEELACREMFD: TStringField
      DisplayLabel = 'Lacre MFD ?'
      FieldName = 'LACREMFD'
      FixedChar = True
      Size = 1
    end
    object cdsCNIEEATO_APROVACAO: TStringField
      DisplayLabel = 'Ato Homologat'#243'rio'
      FieldName = 'ATO_APROVACAO'
      Size = 30
    end
    object cdsCNIEEATIVO: TIntegerField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
  end
  object dspCNIEE: TDataSetProvider
    DataSet = qrCNIEE
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 96
    Top = 110
  end
  object qrCNIEE: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      'select * from IMPRESSORAS_CNIEE')
    Left = 96
    Top = 63
  end
end
