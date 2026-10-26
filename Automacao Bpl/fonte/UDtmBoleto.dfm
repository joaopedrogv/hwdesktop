object DtmBoletos: TDtmBoletos
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 586
  Width = 1102
  object IBTransBoletos: TIBTransaction
    DefaultDatabase = dtmAtivo.bancoHw
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 48
    Top = 24
  end
  object dsBoletos: TDataSource
    DataSet = cdsBoletos
    Left = 128
    Top = 176
  end
  object cdsBoletos: TClientDataSet
    Aggregates = <>
    AutoCalcFields = False
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspBoletos'
    BeforeOpen = cdsBoletosBeforeOpen
    OnReconcileError = cdsBoletosReconcileError
    Left = 128
    Top = 120
    object cdsBoletosSelecionaBoleto: TStringField
      Tag = 2
      DisplayLabel = 'Sel'
      DisplayWidth = 1
      FieldKind = fkInternalCalc
      FieldName = 'SelecionaBoleto'
      Size = 1
    end
    object cdsBoletosN_SEQ_BOL: TIntegerField
      Tag = 2
      DisplayLabel = 'Num Seq Boleto'
      FieldName = 'N_SEQ_BOL'
      Origin = '"BOLETAS"."N_SEQ_BOL"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsBoletosCOD_CLIENTE: TIntegerField
      Tag = 2
      DisplayLabel = 'Cod Cliente'
      FieldName = 'COD_CLIENTE'
      Origin = '"BOLETAS"."COD_CLIENTE"'
    end
    object cdsBoletosNOME_CLIENTE: TStringField
      DisplayLabel = 'Nome Cliente'
      FieldName = 'NOME_CLIENTE'
      Origin = '"CLIENTES"."NOME_CLIENTE"'
      ProviderFlags = [pfInWhere]
      Size = 35
    end
    object cdsBoletosRAZAO: TStringField
      DisplayLabel = 'Razao Social'
      FieldName = 'RAZAO'
      Origin = '"CLIENTES"."RAZAO"'
      ProviderFlags = [pfInWhere]
      Size = 60
    end
    object cdsBoletosCPFCGC: TStringField
      DisplayLabel = 'CPF / CNPJ'
      FieldName = 'CPFCGC'
      Origin = '"CLIENTES"."CPFCGC"'
      ProviderFlags = [pfInWhere]
      Size = 18
    end
    object cdsBoletosTIPO_API: TStringField
      DisplayLabel = 'Usa API?'
      FieldName = 'TIPO_API'
      Size = 1
    end
    object cdsBoletosNUM_NF_VND: TIntegerField
      Tag = 2
      DisplayLabel = 'Num NF/Doc'
      FieldName = 'NUM_NF_VND'
      Origin = '"BOLETAS"."NUM_NF_VND"'
    end
    object cdsBoletosSEQFORM: TIntegerField
      DisplayLabel = 'Seqform'
      FieldName = 'SEQFORM'
    end
    object cdsBoletosCOD_CRED: TIntegerField
      DisplayLabel = 'Cod Credito'
      FieldName = 'COD_CRED'
      Origin = '"BOLETAS"."COD_CRED"'
    end
    object cdsBoletosDATA_EM_BOL: TDateTimeField
      Tag = 2
      DisplayLabel = 'Data Emissao'
      FieldName = 'DATA_EM_BOL'
      Origin = '"BOLETAS"."DATA_EM_BOL"'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsBoletosN_DOC_BOL: TStringField
      Tag = 2
      DisplayLabel = 'Num Documento'
      FieldName = 'N_DOC_BOL'
      Origin = '"BOLETAS"."N_DOC_BOL"'
      Size = 10
    end
    object cdsBoletosDATA_VEN_BOL: TDateTimeField
      Tag = 2
      DisplayLabel = 'Data Vencimento'
      FieldName = 'DATA_VEN_BOL'
      Origin = '"BOLETAS"."DATA_VEN_BOL"'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsBoletosVL_DOC_BOL: TFloatField
      Tag = 2
      DisplayLabel = 'Valor Liquido'
      FieldName = 'VL_DOC_BOL'
      Origin = '"BOLETAS"."VL_DOC_BOL"'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '###,###,##0.00'
    end
    object cdsBoletosOBS_BOL: TStringField
      DisplayLabel = 'Obs 1'
      FieldName = 'OBS_BOL'
      Origin = '"BOLETAS"."OBS_BOL"'
      Size = 128
    end
    object cdsBoletosOBS_BOL1: TStringField
      DisplayLabel = 'Obs 2'
      FieldName = 'OBS_BOL1'
      Origin = '"BOLETAS"."OBS_BOL1"'
      Size = 128
    end
    object cdsBoletosM_DIA_BOL: TFloatField
      DisplayLabel = 'Mora di'#225'ria (%)'
      FieldName = 'M_DIA_BOL'
      Origin = '"BOLETAS"."M_DIA_BOL"'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '###,###,##0.00'
    end
    object cdsBoletosMULT_ATR_BOL: TFloatField
      DisplayLabel = 'Multa (%)'
      FieldName = 'MULT_ATR_BOL'
      Origin = '"BOLETAS"."MULT_ATR_BOL"'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '###,###,##0.00'
    end
    object cdsBoletosNOME_CTRL: TStringField
      DisplayLabel = 'Controle'
      FieldName = 'NOME_CTRL'
      ProviderFlags = [pfInWhere]
      Size = 35
    end
    object cdsBoletosCOD_CONTROLE_CX: TIntegerField
      DisplayLabel = 'Cod Controle'
      FieldName = 'COD_CONTROLE_CX'
      Origin = '"BOLETAS"."COD_CONTROLE_CX"'
    end
    object cdsBoletosCOD_COBREBEM: TIntegerField
      DisplayLabel = 'Cod Convenio'
      FieldName = 'COD_COBREBEM'
      Origin = '"BOLETAS"."COD_COBREBEM"'
    end
    object cdsBoletosNOSSO_NUMERO_BANCO: TStringField
      DisplayLabel = 'Nosso Numero'
      FieldName = 'NOSSO_NUMERO_BANCO'
      Origin = '"BOLETAS"."NOSSO_NUMERO_BANCO"'
    end
    object cdsBoletosREMESSA_ENVIADA: TStringField
      DisplayLabel = 'Remessa Enviada'
      FieldName = 'REMESSA_ENVIADA'
      Origin = '"BOLETAS"."REMESSA_ENVIADA"'
      FixedChar = True
      Size = 1
    end
    object cdsBoletosCOD_SEQ_REMESSA: TIntegerField
      DisplayLabel = 'Cod Seq Remessa'
      FieldName = 'COD_SEQ_REMESSA'
      Origin = '"BOLETAS"."COD_SEQ_REMESSA"'
    end
    object cdsBoletosDATA_REMESSA: TDateTimeField
      DisplayLabel = 'Data Remessa'
      FieldName = 'DATA_REMESSA'
      Origin = '"BOLETAS"."DATA_REMESSA"'
    end
    object cdsBoletosN_CUPOM: TIntegerField
      DisplayLabel = 'Num Cupom'
      FieldName = 'N_CUPOM'
      Origin = '"BOLETAS"."N_CUPOM"'
    end
    object cdsBoletosN_PDV: TIntegerField
      DisplayLabel = 'Num PDV'
      FieldName = 'N_PDV'
      Origin = '"BOLETAS"."N_PDV"'
    end
    object cdsBoletosSUB_SERIE: TIntegerField
      DisplayLabel = 'Sub Serie NF'
      FieldName = 'SUB_SERIE'
      Origin = '"BOLETAS"."SUB_SERIE"'
    end
    object cdsBoletosCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Origin = '"BOLETAS"."COD_EMPRESA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsBoletosATIVO: TIntegerField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
      Origin = '"BOLETAS"."ATIVO"'
    end
    object cdsBoletosSTATUS: TStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      Origin = '"BOLETAS"."STATUS"'
    end
    object cdsBoletosOCORRENCIABANCARIA: TMemoField
      DisplayLabel = 'Info Bancaria'
      FieldName = 'OCORRENCIABANCARIA'
      Origin = '"BOLETAS"."OCORRENCIABANCARIA"'
      ProviderFlags = [pfInUpdate]
      OnGetText = cdsBoletosOCORRENCIABANCARIAGetText
      BlobType = ftMemo
      Size = 8
    end
    object cdsBoletosTIPO_EMISSAO: TStringField
      DisplayLabel = 'Tipo Emiss'#227'o/Doc'
      FieldName = 'TIPO_EMISSAO'
      Origin = '"BOLETAS"."TIPO_EMISSAO"'
    end
    object cdsBoletosIDCARNE: TIntegerField
      DisplayLabel = 'Numero Carne'
      FieldName = 'IDCARNE'
    end
    object cdsBoletosNPARCELA: TSmallintField
      DisplayLabel = 'Num Parcela'
      FieldName = 'NPARCELA'
    end
    object cdsBoletosTOTALPARCELAS: TSmallintField
      DisplayLabel = 'Total de Parcelas'
      FieldName = 'TOTALPARCELAS'
    end
    object cdsBoletosTIPOIMPRESSAO: TStringField
      DisplayLabel = 'Tipo Impress'#227'o'
      FieldName = 'TIPOIMPRESSAO'
    end
    object cdsBoletosBANCOEMITEBOLETO: TStringField
      DisplayLabel = 'Banco Emite Boleto'
      FieldName = 'BANCOEMITEBOLETO'
      Size = 1
    end
    object cdsBoletosNF_AUT: TStringField
      DisplayLabel = 'NF Aut.'
      FieldName = 'NF_AUT'
      FixedChar = True
      Size = 1
    end
    object cdsBoletosLOCALPAG: TStringField
      DisplayLabel = 'Local Pagamento'
      FieldName = 'LOCALPAG'
      Origin = '"BOLETAS"."LOCALPAG"'
      Size = 128
    end
    object cdsBoletosMENSAGEM_BOL: TStringField
      DisplayLabel = 'Mensagem Boleto'
      DisplayWidth = 128
      FieldName = 'MENSAGEM_BOL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfHidden]
      Size = 128
    end
    object cdsBoletosMENSAGEM_ADC: TStringField
      DisplayLabel = 'Mensagem Adicional'
      FieldName = 'MENSAGEM_ADC'
      Size = 128
    end
    object cdsBoletosPERMITE_DESCONTO: TStringField
      DisplayLabel = 'Permite Desconto'
      FieldName = 'PERMITE_DESCONTO'
      Size = 1
    end
    object cdsBoletosQTD_DIAS_LIM_DESC: TIntegerField
      DisplayLabel = 'Dias Limite de Desconto'
      FieldName = 'QTD_DIAS_LIM_DESC'
    end
    object cdsBoletosMENSAGEM_DESC: TStringField
      DisplayLabel = 'Mensagem Desconto'
      FieldName = 'MENSAGEM_DESC'
      Size = 128
    end
    object cdsBoletosPERMITE_PROTESTO: TStringField
      DisplayLabel = 'Permite Protesto'
      FieldName = 'PERMITE_PROTESTO'
      Size = 1
    end
    object cdsBoletosDIAS_PROTESTO: TSmallintField
      DisplayLabel = 'Dias Protesto'
      FieldName = 'DIAS_PROTESTO'
    end
    object cdsBoletosVL_DESC_BOL: TFloatField
      DisplayLabel = 'Valor Desconto'
      FieldName = 'VL_DESC_BOL'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '###,###,##0.00'
    end
    object cdsBoletosDATA_LIM_DESC: TDateTimeField
      DisplayLabel = 'Data Limite Desconto'
      FieldName = 'DATA_LIM_DESC'
    end
    object cdsBoletosCOD_CARGA: TIntegerField
      DisplayLabel = 'Carga'
      FieldName = 'COD_CARGA'
    end
    object cdsBoletosCOD_NF: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod NF'
      FieldName = 'COD_NF'
    end
    object cdsBoletosCOD_GERADOR: TIntegerField
      DisplayLabel = 'Cod Gerador'
      FieldName = 'COD_GERADOR'
    end
    object cdsBoletosHTMLBOLETO: TMemoField
      DisplayLabel = 'Html Boleto'
      FieldName = 'HTMLBOLETO'
      OnGetText = cdsBoletosHTMLBOLETOGetText
      BlobType = ftMemo
      Size = 8
    end
    object cdsBoletosENV_EMAIL_BOL: TStringField
      Tag = 1
      DisplayLabel = 'Email Enviado'
      FieldName = 'ENV_EMAIL_BOL'
      FixedChar = True
      Size = 1
    end
    object cdsBoletosDATA_EMAIL_BOL: TDateTimeField
      Tag = 1
      DisplayLabel = 'Data Email Bol 2'
      FieldName = 'DATA_EMAIL_BOL'
    end
    object cdsBoletosDATA_ENV_EMAIL: TDateTimeField
      DisplayLabel = 'Data Email Bol'
      FieldName = 'DATA_ENV_EMAIL'
      ProviderFlags = [pfInWhere]
    end
    object cdsBoletosCOD_US_EMAIL_BOL: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Us Email'
      FieldName = 'COD_US_EMAIL_BOL'
    end
    object cdsBoletosENV_WHATSAPP_BOL: TStringField
      Tag = 1
      DisplayLabel = 'WhatsApp Enviado'
      FieldName = 'ENV_WHATSAPP_BOL'
      FixedChar = True
      Size = 1
    end
    object cdsBoletosDATA_WHATSAPP_BOL: TDateTimeField
      Tag = 1
      DisplayLabel = 'Data WhatsApp Bol 2'
      FieldName = 'DATA_WHATSAPP_BOL'
    end
    object cdsBoletosDATA_ENV_WHATSAPP: TDateTimeField
      DisplayLabel = 'Data WhatsApp Bol'
      FieldName = 'DATA_ENV_WHATSAPP'
      ProviderFlags = [pfInWhere]
    end
    object cdsBoletosCOD_US_WHATSAPP_BOL: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Us WhatsApp'
      FieldName = 'COD_US_WHATSAPP_BOL'
    end
    object cdsBoletosENV_MENS_BOL: TStringField
      Tag = 1
      DisplayLabel = 'Mensagem Enviada'
      FieldName = 'ENV_MENS_BOL'
      Size = 1
    end
    object cdsBoletosDATA_MENS_BOL: TDateTimeField
      Tag = 1
      DisplayLabel = 'Data Mens Bol 2'
      FieldName = 'DATA_MENS_BOL'
    end
    object cdsBoletosDATA_ENV_MENS: TDateTimeField
      DisplayLabel = 'Data Mens Bol'
      FieldName = 'DATA_ENV_MENS'
    end
    object cdsBoletosCOD_US_MENS_BOL: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Us Mens'
      FieldName = 'COD_US_MENS_BOL'
    end
    object cdsBoletosEMAIL: TStringField
      DisplayLabel = 'Email Cliente'
      FieldName = 'EMAIL'
      Size = 256
    end
    object cdsBoletosAPI_NOSSONUMERO: TStringField
      DisplayLabel = 'Nosso numero seq'
      FieldName = 'API_NOSSONUMERO'
      Size = 16
    end
    object cdsBoletosAPI_SITUACAO: TStringField
      DisplayLabel = 'Situa'#231#227'o na API'
      FieldName = 'API_SITUACAO'
      Size = 16
    end
    object cdsBoletosLINHADIGITAVEL: TStringField
      DisplayLabel = 'Linha Digitavel'
      FieldName = 'LINHADIGITAVEL'
      Size = 80
    end
    object cdsBoletosCODIGOBARRAS: TStringField
      DisplayLabel = 'Codigo Barras'
      FieldName = 'CODIGOBARRAS'
      Size = 80
    end
    object cdsBoletosAPI_IDINTEGRACAO: TStringField
      DisplayLabel = 'API Id Integracao'
      FieldName = 'API_IDINTEGRACAO'
      Size = 16
    end
    object cdsBoletosAPI_IDREMINTEGRACAO: TStringField
      Tag = 1
      DisplayLabel = 'API Id Integracao Rem'
      FieldName = 'API_IDREMINTEGRACAO'
      Size = 16
    end
    object cdsBoletosAPI_IDRETINTEGRACAO: TStringField
      Tag = 1
      DisplayLabel = 'API Id Integracao Ret'
      FieldName = 'API_IDRETINTEGRACAO'
      Size = 16
    end
    object cdsBoletosVL_DOC_BRUTO: TFloatField
      Tag = 1
      DisplayLabel = 'Valor Bruto'
      FieldKind = fkInternalCalc
      FieldName = 'VL_DOC_BRUTO'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '###,###,##0.00'
    end
    object cdsBoletosTRANSMISSAO_AUTOMATICA: TStringField
      DisplayLabel = 'Transmissao Automatica'
      FieldName = 'TRANSMISSAO_AUTOMATICA'
      FixedChar = True
      Size = 1
    end
    object cdsBoletosAPI_URLBOLETO: TStringField
      DisplayLabel = 'Url Boleto'
      FieldName = 'API_URLBOLETO'
      Size = 256
    end
    object cdsBoletosAPI_URLPIX: TStringField
      DisplayLabel = 'Url Pix'
      FieldName = 'API_URLPIX'
      Size = 256
    end
    object cdsBoletosVIA_WS: TStringField
      DisplayLabel = 'Registro Instantaneo'
      FieldName = 'VIA_WS'
      Size = 1
    end
  end
  object dspBoletos: TDataSetProvider
    DataSet = qrBoletos
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 128
    Top = 72
  end
  object qrBoletos: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransBoletos
    SQL.Strings = (
      
        'SELECT BOLETAS.*, CONTROLES.NOME_CTRL, CLIENTES.NOME_CLIENTE,CLI' +
        'ENTES.RAZAO,CLIENTES.CPFCGC, CLIENTES.EMAIL,'
      
        'RETORNA_DATA_ENV_BOL.DATA_ENV_EMAIL, RETORNA_DATA_ENV_BOL.DATA_E' +
        'NV_WHATSAPP, RETORNA_DATA_ENV_BOL.DATA_ENV_MENS  from BOLETAS'
      'INNER JOIN CLIENTES ON'
      
        'BOLETAS.COD_CLIENTE = CLIENTES.COD_CLIENTE AND BOLETAS.COD_EMPRE' +
        'SA = CLIENTES.COD_EMPRESA'
      'LEFT JOIN CONTROLES ON'
      
        'BOLETAS.COD_CONTROLE_CX = CONTROLES.CODIGO_CTRL AND BOLETAS.COD_' +
        'EMPRESA = CONTROLES.CODIGO_EMP'
      
        'LEFT JOIN RETORNA_DATA_ENV_BOL (BOLETAS.N_SEQ_BOL, BOLETAS.COD_E' +
        'MPRESA) ON 1 = 1')
    Left = 128
    Top = 24
    object qrBoletosNOME_CLIENTE: TIBStringField
      FieldName = 'NOME_CLIENTE'
      Origin = '"CLIENTES"."NOME_CLIENTE"'
      ProviderFlags = [pfInWhere]
      Size = 35
    end
    object qrBoletosRAZAO: TIBStringField
      FieldName = 'RAZAO'
      Origin = '"CLIENTES"."RAZAO"'
      ProviderFlags = [pfInWhere]
      Size = 60
    end
    object qrBoletosCPFCGC: TIBStringField
      FieldName = 'CPFCGC'
      Origin = '"CLIENTES"."CPFCGC"'
      ProviderFlags = [pfInWhere]
      Size = 18
    end
    object qrBoletosN_SEQ_BOL: TIntegerField
      FieldName = 'N_SEQ_BOL'
      Origin = '"BOLETAS"."N_SEQ_BOL"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrBoletosCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Origin = '"BOLETAS"."COD_EMPRESA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrBoletosTIPO_API: TStringField
      FieldName = 'TIPO_API'
      Origin = '"BOLETAS"."TIPO_API"'
      Size = 1
    end
    object qrBoletosNUM_NF_VND: TIntegerField
      FieldName = 'NUM_NF_VND'
      Origin = '"BOLETAS"."NUM_NF_VND"'
    end
    object qrBoletosN_CUPOM: TIntegerField
      FieldName = 'N_CUPOM'
      Origin = '"BOLETAS"."N_CUPOM"'
    end
    object qrBoletosN_PDV: TIntegerField
      FieldName = 'N_PDV'
      Origin = '"BOLETAS"."N_PDV"'
    end
    object qrBoletosCOD_CRED: TIntegerField
      FieldName = 'COD_CRED'
      Origin = '"BOLETAS"."COD_CRED"'
    end
    object qrBoletosDATA_EM_BOL: TDateTimeField
      FieldName = 'DATA_EM_BOL'
      Origin = '"BOLETAS"."DATA_EM_BOL"'
    end
    object qrBoletosDATA_VEN_BOL: TDateTimeField
      FieldName = 'DATA_VEN_BOL'
      Origin = '"BOLETAS"."DATA_VEN_BOL"'
    end
    object qrBoletosN_DOC_BOL: TIBStringField
      FieldName = 'N_DOC_BOL'
      Origin = '"BOLETAS"."N_DOC_BOL"'
      Size = 10
    end
    object qrBoletosVL_DOC_BOL: TFloatField
      FieldName = 'VL_DOC_BOL'
      Origin = '"BOLETAS"."VL_DOC_BOL"'
    end
    object qrBoletosOBS_BOL: TIBStringField
      FieldName = 'OBS_BOL'
      Origin = '"BOLETAS"."OBS_BOL"'
      Size = 128
    end
    object qrBoletosM_DIA_BOL: TFloatField
      FieldName = 'M_DIA_BOL'
      Origin = '"BOLETAS"."M_DIA_BOL"'
    end
    object qrBoletosMULT_ATR_BOL: TFloatField
      FieldName = 'MULT_ATR_BOL'
      Origin = '"BOLETAS"."MULT_ATR_BOL"'
    end
    object qrBoletosCOD_CLIENTE: TIntegerField
      FieldName = 'COD_CLIENTE'
      Origin = '"BOLETAS"."COD_CLIENTE"'
    end
    object qrBoletosOBS_BOL1: TIBStringField
      FieldName = 'OBS_BOL1'
      Origin = '"BOLETAS"."OBS_BOL1"'
      Size = 128
    end
    object qrBoletosATIVO: TIntegerField
      FieldName = 'ATIVO'
      Origin = '"BOLETAS"."ATIVO"'
    end
    object qrBoletosNOSSO_NUMERO_BANCO: TIBStringField
      FieldName = 'NOSSO_NUMERO_BANCO'
      Origin = '"BOLETAS"."NOSSO_NUMERO_BANCO"'
    end
    object qrBoletosNOME_CTRL: TIBStringField
      FieldName = 'NOME_CTRL'
      Origin = '"CONTROLES"."NOME_CTRL"'
      Size = 35
    end
    object qrBoletosCOD_CONTROLE_CX: TIntegerField
      FieldName = 'COD_CONTROLE_CX'
      Origin = '"BOLETAS"."COD_CONTROLE_CX"'
    end
    object qrBoletosREMESSA_ENVIADA: TIBStringField
      FieldName = 'REMESSA_ENVIADA'
      Origin = '"BOLETAS"."REMESSA_ENVIADA"'
      FixedChar = True
      Size = 1
    end
    object qrBoletosSUB_SERIE: TIntegerField
      FieldName = 'SUB_SERIE'
      Origin = '"BOLETAS"."SUB_SERIE"'
    end
    object qrBoletosDATA_REMESSA: TDateTimeField
      FieldName = 'DATA_REMESSA'
      Origin = '"BOLETAS"."DATA_REMESSA"'
    end
    object qrBoletosCOD_COBREBEM: TIntegerField
      FieldName = 'COD_COBREBEM'
      Origin = '"BOLETAS"."COD_COBREBEM"'
    end
    object qrBoletosCOD_SEQ_REMESSA: TIntegerField
      FieldName = 'COD_SEQ_REMESSA'
      Origin = '"BOLETAS"."COD_SEQ_REMESSA"'
    end
    object qrBoletosSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = '"BOLETAS"."STATUS"'
    end
    object qrBoletosOCORRENCIABANCARIA: TMemoField
      FieldName = 'OCORRENCIABANCARIA'
      Origin = '"BOLETAS"."OCORRENCIABANCARIA"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
    object qrBoletosTIPO_EMISSAO: TIBStringField
      FieldName = 'TIPO_EMISSAO'
      Origin = '"BOLETAS"."TIPO_EMISSAO"'
    end
    object qrBoletosIDCARNE: TIntegerField
      FieldName = 'IDCARNE'
    end
    object qrBoletosNPARCELA: TSmallintField
      FieldName = 'NPARCELA'
    end
    object qrBoletosTOTALPARCELAS: TSmallintField
      FieldName = 'TOTALPARCELAS'
    end
    object qrBoletosTIPOIMPRESSAO: TStringField
      FieldName = 'TIPOIMPRESSAO'
    end
    object qrBoletosBANCOEMITEBOLETO: TStringField
      FieldName = 'BANCOEMITEBOLETO'
      Size = 1
    end
    object qrBoletosNF_AUT: TIBStringField
      FieldName = 'NF_AUT'
      Origin = '"BOLETAS"."NF_AUT"'
      FixedChar = True
      Size = 1
    end
    object qrBoletosCOD_CARGA: TIntegerField
      FieldName = 'COD_CARGA'
    end
    object qrBoletosCOD_NF: TIntegerField
      FieldName = 'COD_NF'
      Origin = '"BOLETAS"."COD_NF"'
    end
    object qrBoletosLOCALPAG: TIBStringField
      FieldName = 'LOCALPAG'
      Origin = '"BOLETAS"."LOCALPAG"'
      Size = 128
    end
    object qrBoletosMENSAGEM_BOL: TIBStringField
      DisplayWidth = 128
      FieldName = 'MENSAGEM_BOL'
      Origin = '"BOLETAS"."MENSAGEM_BOL"'
      Size = 128
    end
    object qrBoletosMENSAGEM_ADC: TIBStringField
      FieldName = 'MENSAGEM_ADC'
      Origin = '"BOLETAS"."MENSAGEM_ADC"'
      Size = 128
    end
    object qrBoletosPERMITE_DESCONTO: TStringField
      FieldName = 'PERMITE_DESCONTO'
      Size = 1
    end
    object qrBoletosMENSAGEM_DESC: TStringField
      FieldName = 'MENSAGEM_DESC'
      Size = 128
    end
    object qrBoletosPERMITE_PROTESTO: TStringField
      FieldName = 'PERMITE_PROTESTO'
      Size = 1
    end
    object qrBoletosDIAS_PROTESTO: TSmallintField
      FieldName = 'DIAS_PROTESTO'
      Origin = '"BOLETAS"."DIAS_PROTESTO"'
    end
    object qrBoletosCOD_GERADOR: TIntegerField
      FieldName = 'COD_GERADOR'
      Origin = '"BOLETAS"."COD_GERADOR"'
    end
    object qrBoletosVL_DESC_BOL: TFloatField
      FieldName = 'VL_DESC_BOL'
    end
    object qrBoletosDATA_LIM_DESC: TDateTimeField
      FieldName = 'DATA_LIM_DESC'
    end
    object qrBoletosHTMLBOLETO: TMemoField
      Tag = 1
      FieldName = 'HTMLBOLETO'
      Origin = '"BOLETAS"."HTMLBOLETO"'
      ProviderFlags = [pfInUpdate]
      Visible = False
      BlobType = ftMemo
      Size = 8
    end
    object qrBoletosENV_EMAIL_BOL: TIBStringField
      FieldName = 'ENV_EMAIL_BOL'
      Origin = '"BOLETAS"."ENV_EMAIL_BOL"'
      FixedChar = True
      Size = 1
    end
    object qrBoletosDATA_EMAIL_BOL: TDateTimeField
      FieldName = 'DATA_EMAIL_BOL'
      Origin = '"BOLETAS"."DATA_EMAIL_BOL"'
    end
    object qrBoletosDATA_ENV_EMAIL: TDateTimeField
      FieldName = 'DATA_ENV_EMAIL'
      ProviderFlags = [pfInWhere]
    end
    object qrBoletosENV_WHATSAPP_BOL: TIBStringField
      FieldName = 'ENV_WHATSAPP_BOL'
      Origin = '"BOLETAS"."ENV_WHATSAPP_BOL"'
      FixedChar = True
      Size = 1
    end
    object qrBoletosDATA_WHATSAPP_BOL: TDateTimeField
      FieldName = 'DATA_WHATSAPP_BOL'
      Origin = '"BOLETAS"."DATA_WHATSAPP_BOL"'
    end
    object qrBoletosDATA_ENV_WHATSAPP: TDateTimeField
      FieldName = 'DATA_ENV_WHATSAPP'
      ProviderFlags = [pfInWhere]
    end
    object qrBoletosENV_MENS_BOL: TStringField
      FieldName = 'ENV_MENS_BOL'
      Origin = '"BOLETAS"."ENV_MENS_BOL"'
      Size = 1
    end
    object qrBoletosDATA_MENS_BOL: TDateTimeField
      FieldName = 'DATA_MENS_BOL'
      Origin = '"BOLETAS"."DATA_MENS_BOL"'
    end
    object qrBoletosDATA_ENV_MENS: TDateTimeField
      FieldName = 'DATA_ENV_MENS'
      Origin = '"RETORNA_DATA_ENV_BOL"."DATA_ENV_MENS"'
    end
    object qrBoletosEMAIL: TIBStringField
      FieldName = 'EMAIL'
      Origin = '"CLIENTES"."EMAIL"'
      Size = 256
    end
    object qrBoletosAPI_NOSSONUMERO: TStringField
      FieldName = 'API_NOSSONUMERO'
      Size = 16
    end
    object qrBoletosAPI_SITUACAO: TStringField
      FieldName = 'API_SITUACAO'
      Size = 16
    end
    object qrBoletosLINHADIGITAVEL: TIBStringField
      FieldName = 'LINHADIGITAVEL'
      Origin = '"BOLETAS"."LINHADIGITAVEL"'
      Size = 80
    end
    object qrBoletosCODIGOBARRAS: TIBStringField
      FieldName = 'CODIGOBARRAS'
      Origin = '"BOLETAS"."CODIGOBARRAS"'
      Size = 80
    end
    object qrBoletosAPI_IDINTEGRACAO: TIBStringField
      FieldName = 'API_IDINTEGRACAO'
      Origin = '"BOLETAS"."API_IDINTEGRACAO"'
      Size = 16
    end
    object qrBoletosAPI_IDREMINTEGRACAO: TIBStringField
      FieldName = 'API_IDREMINTEGRACAO'
      Origin = '"BOLETAS"."API_IDREMINTEGRACAO"'
      Size = 16
    end
    object qrBoletosAPI_IDRETINTEGRACAO: TIBStringField
      FieldName = 'API_IDRETINTEGRACAO'
      Origin = '"BOLETAS"."API_IDRETINTEGRACAO"'
      Size = 16
    end
    object qrBoletosQTD_DIAS_LIM_DESC: TIntegerField
      FieldName = 'QTD_DIAS_LIM_DESC'
    end
    object qrBoletosCOD_US_EMAIL_BOL: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Us Email'
      FieldName = 'COD_US_EMAIL_BOL'
    end
    object qrBoletosCOD_US_WHATSAPP_BOL: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Us WhatsApp'
      FieldName = 'COD_US_WHATSAPP_BOL'
    end
    object qrBoletosCOD_US_MENS_BOL: TIntegerField
      Tag = 1
      FieldName = 'COD_US_MENS_BOL'
      Origin = '"BOLETAS"."COD_US_MENS_BOL"'
    end
    object qrBoletosSEQFORM: TIntegerField
      FieldName = 'SEQFORM'
      Origin = '"BOLETAS"."SEQFORM"'
    end
    object qrBoletosTRANSMISSAO_AUTOMATICA: TIBStringField
      FieldName = 'TRANSMISSAO_AUTOMATICA'
      Origin = '"BOLETAS"."TRANSMISSAO_AUTOMATICA"'
      FixedChar = True
      Size = 1
    end
    object qrBoletosAPI_URLBOLETO: TIBStringField
      FieldName = 'API_URLBOLETO'
      Origin = '"BOLETAS"."API_URLBOLETO"'
      Size = 256
    end
    object qrBoletosAPI_URLPIX: TIBStringField
      FieldName = 'API_URLPIX'
      Origin = '"BOLETAS"."API_URLPIX"'
      Size = 256
    end
    object qrBoletosVIA_WS: TStringField
      FieldName = 'VIA_WS'
      Origin = '"BOLETAS"."VIA_WS"'
      Size = 1
    end
  end
  object qrBuscas: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransBoletos
    Left = 47
    Top = 72
  end
  object qrControles: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransBoletos
    SQL.Strings = (
      'select * from CONTROLES')
    Left = 366
    Top = 19
  end
  object dsControles: TDataSource
    DataSet = cdsControles
    Left = 365
    Top = 171
  end
  object cdsControles: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspControles'
    BeforeOpen = cdsBoletosBeforeOpen
    Left = 365
    Top = 115
    object cdsControlesCODIGO_CTRL: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO_CTRL'
      Required = True
    end
    object cdsControlesFLUXO_CTRL: TStringField
      DisplayLabel = 'Fluxo'
      FieldName = 'FLUXO_CTRL'
      FixedChar = True
      Size = 1
    end
    object cdsControlesN_BANCO_CTRL: TStringField
      DisplayLabel = 'N'#250'mero do Banco'
      FieldName = 'N_BANCO_CTRL'
      FixedChar = True
      Size = 10
    end
    object cdsControlesNOME_CTRL: TStringField
      DisplayLabel = 'Nome Controle'
      FieldName = 'NOME_CTRL'
      Size = 35
    end
    object cdsControlesEND_CTRL: TStringField
      DisplayLabel = 'Endere'#231'o '
      FieldName = 'END_CTRL'
      Size = 30
    end
    object cdsControlesBAIRRO_CTRL: TStringField
      DisplayLabel = 'Bairro'
      FieldName = 'BAIRRO_CTRL'
    end
    object cdsControlesCID_CTRL: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'CID_CTRL'
    end
    object cdsControlesUF_CTRL: TStringField
      DisplayLabel = 'UF'
      FieldName = 'UF_CTRL'
      FixedChar = True
      Size = 2
    end
    object cdsControlesCEP_CTRL: TStringField
      DisplayLabel = 'CEP'
      FieldName = 'CEP_CTRL'
      FixedChar = True
      Size = 9
    end
    object cdsControlesCONTATO_CTRL: TStringField
      DisplayLabel = 'Contato'
      FieldName = 'CONTATO_CTRL'
      Size = 15
    end
    object cdsControlesFONE_CTRL: TStringField
      DisplayLabel = 'Telefone'
      FieldName = 'FONE_CTRL'
      FixedChar = True
      Size = 13
    end
    object cdsControlesN_CONTA_CTRL: TStringField
      DisplayLabel = 'N'#250'mero da Conta'
      FieldName = 'N_CONTA_CTRL'
      EditMask = '00000000\-9;1;_'
      FixedChar = True
      Size = 15
    end
    object cdsControlesSALDO_ANT_CTRL: TFloatField
      DisplayLabel = 'Saldo Anterior'
      FieldName = 'SALDO_ANT_CTRL'
    end
    object cdsControlesSALDO_AT_CTRL: TFloatField
      DisplayLabel = 'Saldo Atual'
      FieldName = 'SALDO_AT_CTRL'
    end
    object cdsControlesSOBRA_CTRL: TFloatField
      Tag = 1
      FieldName = 'SOBRA_CTRL'
    end
    object cdsControlesCOMPSALDO: TStringField
      DisplayLabel = 'Composi'#231#227'o de Saldo'
      FieldName = 'COMPSALDO'
      FixedChar = True
      Size = 1
    end
    object cdsControlesDOCS: TStringField
      DisplayLabel = 'Documentos'
      FieldName = 'DOCS'
      FixedChar = True
      Size = 2
    end
    object cdsControlesCXENT: TStringField
      DisplayLabel = 'Condi'#231#227'o de Recebimento'
      FieldName = 'CXENT'
      FixedChar = True
      Size = 1
    end
    object cdsControlesQPERF: TIntegerField
      DisplayLabel = 'Sequ'#234'ncia de Balan'#231'o'
      FieldName = 'QPERF'
    end
    object cdsControlesQSEQPERF: TIntegerField
      DisplayLabel = 'Controle de Relat'#243'rios'
      FieldName = 'QSEQPERF'
    end
    object cdsControlesNAT_LANC: TStringField
      DisplayLabel = 'Natureza de Lan'#231'amentos'
      FieldName = 'NAT_LANC'
      FixedChar = True
      Size = 1
    end
    object cdsControlesCONTR_BANC: TStringField
      DisplayLabel = 'Controle Banc'#225'rio'
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
      DisplayLabel = 'Tipo de Plano'
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
      DisplayLabel = 'Acerto Caixa Cont'#225'bel'
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
      DisplayLabel = 'N'#250'mero da Ag'#234'ncia'
      FieldName = 'N_AGENCIA_CTRL'
      EditMask = '0000\-9;1;_'
      Size = 10
    end
    object cdsControlesCAMINHO_LICENCA_CTRL: TStringField
      DisplayLabel = 'Caminho Licen'#231'a'
      FieldName = 'CAMINHO_LICENCA_CTRL'
      Size = 50
    end
    object cdsControlesCAMINHO_LOGOTIPO_CTRL: TStringField
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
      DisplayLabel = 'Identificador Cedente'
      FieldName = 'IDENTIF_CEDENTE'
      Size = 40
    end
    object cdsControlesCAMINHO_REMESSA: TStringField
      DisplayLabel = 'Caminho Remessa'
      FieldName = 'CAMINHO_REMESSA'
      Size = 50
    end
    object cdsControlesCOD_CEDENTE: TStringField
      DisplayLabel = 'C'#243'digo do Cedente'
      DisplayWidth = 6
      FieldName = 'COD_CEDENTE'
    end
    object cdsControlesINICIO_NOSSO_NUMRERO: TStringField
      DisplayLabel = 'In'#237'cio Nosso N'#250'mero'
      DisplayWidth = 5
      FieldName = 'INICIO_NOSSO_NUMRERO'
    end
    object cdsControlesFIM_NOSSO_NUMERO: TStringField
      DisplayLabel = 'Fim Nosso N'#250'mero'
      DisplayWidth = 5
      FieldName = 'FIM_NOSSO_NUMERO'
    end
    object cdsControlesPROXIMO_NOSSO_NUMERO: TStringField
      DisplayLabel = 'Pr'#242'ximo Nosso N'#250'mero'
      DisplayWidth = 5
      FieldName = 'PROXIMO_NOSSO_NUMERO'
    end
    object cdsControlesCOD_FINALIZADOR: TIntegerField
      DisplayLabel = 'C'#243'digo Finalizador'
      FieldName = 'COD_FINALIZADOR'
    end
    object cdsControlesCODSEQ_BALANCO: TIntegerField
      DisplayLabel = 'Cad. Seq. Balan'#231'o'
      FieldName = 'CODSEQ_BALANCO'
    end
  end
  object dspControles: TDataSetProvider
    DataSet = qrControles
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 365
    Top = 67
  end
  object dsCobreBem: TDataSource
    DataSet = cdsCobreBem
    Left = 192
    Top = 176
  end
  object cdsCobreBem: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCobreBem'
    BeforeOpen = cdsBoletosBeforeOpen
    Left = 192
    Top = 120
    object cdsCobreBemCOD_COBREBEM: TIntegerField
      Tag = 2
      DisplayLabel = 'Cod Convenio'
      FieldName = 'COD_COBREBEM'
      Required = True
    end
    object cdsCobreBemCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsCobreBemCODIGO_CTRL: TIntegerField
      DisplayLabel = 'Cod Controle'
      FieldName = 'CODIGO_CTRL'
    end
    object cdsCobreBemDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object cdsCobreBemBANCO: TStringField
      Tag = 2
      DisplayLabel = 'Banco'
      FieldName = 'BANCO'
      FixedChar = True
      Size = 3
    end
    object cdsCobreBemTIPO_CONTA: TStringField
      DisplayLabel = 'Tipo Conta'
      FieldName = 'TIPO_CONTA'
      Size = 10
    end
    object cdsCobreBemCODIGOAGENCIA: TStringField
      Tag = 2
      DisplayLabel = 'Cod Agencia'
      DisplayWidth = 6
      FieldName = 'CODIGOAGENCIA'
    end
    object cdsCobreBemNUMEROCONTACORRENTE: TStringField
      Tag = 2
      DisplayLabel = 'Conta Corrente'
      DisplayWidth = 10
      FieldName = 'NUMEROCONTACORRENTE'
    end
    object cdsCobreBemCODIGOCEDENTE: TStringField
      Tag = 2
      DisplayLabel = 'Cod Cedente'
      DisplayWidth = 6
      FieldName = 'CODIGOCEDENTE'
    end
    object cdsCobreBemCODIGOCONVENIO: TStringField
      DisplayLabel = 'Numero Convenio'
      FieldName = 'CODIGOCONVENIO'
    end
    object cdsCobreBemTIPO_API: TStringField
      DisplayLabel = 'Usa API?'
      FieldName = 'TIPO_API'
      Size = 1
    end
    object cdsCobreBemINICIONOSSONUMERO: TStringField
      DisplayLabel = 'Inicio Nosso Numero'
      DisplayWidth = 5
      FieldName = 'INICIONOSSONUMERO'
    end
    object cdsCobreBemFIMNOSSONUMERO: TStringField
      DisplayLabel = 'Fim Nosso Numero'
      DisplayWidth = 5
      FieldName = 'FIMNOSSONUMERO'
    end
    object cdsCobreBemPROXIMONOSSONUMERO: TStringField
      DisplayLabel = 'Proximo Nosso Numero'
      DisplayWidth = 20
      FieldName = 'PROXIMONOSSONUMERO'
    end
    object cdsCobreBemTIPODOCUMENTOCOBRANCA: TStringField
      DisplayLabel = 'Tipo Documento'
      FieldName = 'TIPODOCUMENTOCOBRANCA'
      Size = 10
    end
    object cdsCobreBemNOME_CTRL: TStringField
      DisplayLabel = 'Controle Bancario'
      FieldKind = fkLookup
      FieldName = 'NOME_CTRL'
      LookupDataSet = cdsControles
      LookupKeyFields = 'CODIGO_CTRL'
      LookupResultField = 'NOME_CTRL'
      KeyFields = 'CODIGO_CTRL'
      Size = 35
      Lookup = True
    end
    object cdsCobreBemLAYOUTARQUIVOREMESSA: TStringField
      DisplayLabel = 'Layout Arquivo Remessa'
      FieldName = 'LAYOUTARQUIVOREMESSA'
    end
    object cdsCobreBemLAYOUTARQUIVORETORNO: TStringField
      DisplayLabel = 'Layout Arquivo Retorno'
      FieldName = 'LAYOUTARQUIVORETORNO'
    end
    object cdsCobreBemLAYOUTBOLETOIMPRESSO: TStringField
      DisplayLabel = 'Layout Boleto Impresso'
      FieldName = 'LAYOUTBOLETOIMPRESSO'
      Size = 30
    end
    object cdsCobreBemLAYOUTBOLETOSEMAIL: TStringField
      DisplayLabel = 'Layout Boleto Email'
      FieldName = 'LAYOUTBOLETOSEMAIL'
      Size = 30
    end
    object cdsCobreBemHTMLBOLETO: TMemoField
      Tag = 1
      DisplayLabel = 'HTML boleto'
      FieldName = 'HTMLBOLETO'
      OnGetText = cdsCobreBemHTMLBOLETOGetText
      BlobType = ftMemo
      Size = 8
    end
    object cdsCobreBemHTMLBOLETOEMAIL: TMemoField
      Tag = 1
      DisplayLabel = 'HTML boleto Email'
      FieldName = 'HTMLBOLETOEMAIL'
      OnGetText = cdsCobreBemHTMLBOLETOEMAILGetText
      BlobType = ftMemo
      Size = 8
    end
    object cdsCobreBemOUTRODADOCONFIGURACAO1: TStringField
      DisplayLabel = 'Dados Configura'#231'ao 1'
      DisplayWidth = 3
      FieldName = 'OUTRODADOCONFIGURACAO1'
    end
    object cdsCobreBemOUTRODADOCONFIGURACAO2: TStringField
      DisplayLabel = 'Dados Configura'#231'ao 2'
      DisplayWidth = 10
      FieldName = 'OUTRODADOCONFIGURACAO2'
    end
    object cdsCobreBemARQUIVOLICENCA: TStringField
      Tag = 2
      DisplayLabel = 'Arquivo Licen'#231'a'
      FieldName = 'ARQUIVOLICENCA'
      Size = 128
    end
    object cdsCobreBemIMAGENSBOLETO: TStringField
      DisplayLabel = 'Imagens Cod Barras'
      FieldName = 'IMAGENSBOLETO'
      Size = 128
    end
    object cdsCobreBemIMAGENSLOGOTIPO: TStringField
      DisplayLabel = 'Imagem logotipo'
      FieldName = 'IMAGENSLOGOTIPO'
      Size = 128
    end
    object cdsCobreBemIDENTIFICACAOCEDENTE: TStringField
      DisplayLabel = 'Identifica'#231'ao Cedente'
      FieldName = 'IDENTIFICACAOCEDENTE'
      Size = 128
    end
    object cdsCobreBemIDENTIFICACAOCEDENTE1: TStringField
      DisplayLabel = 'Identifa'#231'ao Cedente 2'
      FieldName = 'IDENTIFICACAOCEDENTE1'
      Size = 128
    end
    object cdsCobreBemENDERECOREMESSARETORNO: TStringField
      DisplayLabel = 'End Remessa'
      FieldName = 'ENDERECOREMESSARETORNO'
      Size = 128
    end
    object cdsCobreBemEMAIL_ENDERECOCEDENTE: TStringField
      DisplayLabel = 'Email Cedente'
      FieldName = 'EMAIL_ENDERECOCEDENTE'
      Size = 64
    end
    object cdsCobreBemEMAIL_URLIMAGENSBOLETO: TStringField
      DisplayLabel = 'Email/URL img boleto'
      FieldName = 'EMAIL_URLIMAGENSBOLETO'
      Size = 256
    end
    object cdsCobreBemEMAIL_URLIMAGENSLOGOTIPO: TStringField
      DisplayLabel = 'Email/URL Img Logotipo'
      FieldName = 'EMAIL_URLIMAGENSLOGOTIPO'
      Size = 256
    end
    object cdsCobreBemEMAIL_SMTP_SERVIDOR: TStringField
      DisplayLabel = 'Email/SMTP Servidor'
      FieldName = 'EMAIL_SMTP_SERVIDOR'
      Size = 128
    end
    object cdsCobreBemEMAIL_SMTP_PORTA: TIntegerField
      DisplayLabel = 'Email/SMTP Porta'
      FieldName = 'EMAIL_SMTP_PORTA'
    end
    object cdsCobreBemEMAIL_SMTP_USUARIO: TStringField
      DisplayLabel = 'Email/SMTP Usuario'
      FieldName = 'EMAIL_SMTP_USUARIO'
      Size = 32
    end
    object cdsCobreBemEMAIL_SMTP_SENHA: TStringField
      Tag = 1
      DisplayLabel = 'Email/SMTP Senha'
      FieldName = 'EMAIL_SMTP_SENHA'
      Size = 32
    end
    object cdsCobreBemEMAIL_ASSUNTO: TStringField
      DisplayLabel = 'Email Assunto'
      FieldName = 'EMAIL_ASSUNTO'
      Size = 64
    end
    object cdsCobreBemSEQUENCIA_REMESSA: TIntegerField
      DisplayLabel = 'Sequencia Remessa'
      FieldName = 'SEQUENCIA_REMESSA'
    end
    object cdsCobreBemQTDEDIGNOSSONUMERO: TSmallintField
      DisplayLabel = 'Qtde Dig Nosso Numero'
      FieldName = 'QTDEDIGNOSSONUMERO'
    end
    object cdsCobreBemDIASPROTESTO: TSmallintField
      DisplayLabel = 'Dias Protesto'
      FieldName = 'DIASPROTESTO'
    end
    object cdsCobreBemATIVO: TIntegerField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
    object cdsCobreBemCODIGO_BAIXA: TStringField
      DisplayLabel = 'Cod Baixa'
      FieldName = 'CODIGO_BAIXA'
    end
    object cdsCobreBemCODIGO_RECUSA: TStringField
      DisplayLabel = 'Cod Recusa'
      FieldName = 'CODIGO_RECUSA'
    end
    object cdsCobreBemCODIGO_CTRL_ENT: TIntegerField
      DisplayLabel = 'Codigo Controle Entrada'
      FieldName = 'CODIGO_CTRL_ENT'
    end
    object cdsCobreBemTIPOIMPRESSAO: TStringField
      DisplayLabel = 'Tipo Impress'#227'o Remessa'
      FieldName = 'TIPOIMPRESSAO'
    end
    object cdsCobreBemBANCOEMITEBOLETO: TStringField
      DisplayLabel = 'Banco Emite Boleto'
      FieldName = 'BANCOEMITEBOLETO'
      Size = 1
    end
    object cdsCobreBemMARGEMSUPERIOR: TSmallintField
      DisplayLabel = 'Margem Superior(Ajuste Impress'#227'o)'
      FieldName = 'MARGEMSUPERIOR'
    end
    object cdsCobreBemBANCOGERANOSSONUMERO: TStringField
      DisplayLabel = 'Banco Gera Nosso Numero'
      FieldName = 'BANCOGERANOSSONUMERO'
      Size = 1
    end
    object cdsCobreBemOBS_BOL: TStringField
      DisplayLabel = 'Observacao Boleto'
      FieldName = 'OBS_BOL'
      Size = 128
    end
    object cdsCobreBemLOCAL_PAG: TStringField
      DisplayLabel = 'Local Pagamento'
      FieldName = 'LOCAL_PAG'
      Size = 128
    end
    object cdsCobreBemMENSAGEM_BOL: TStringField
      DisplayLabel = 'Mensagem Boleto'
      FieldName = 'MENSAGEM_BOL'
      Size = 128
    end
    object cdsCobreBemMENSAGEM_ADC: TStringField
      DisplayLabel = 'Mensagem Adicional'
      FieldName = 'MENSAGEM_ADC'
      Size = 128
    end
    object cdsCobreBemMENSAGEM_DESC: TStringField
      DisplayLabel = 'Mensagem Desconto'
      FieldName = 'MENSAGEM_DESC'
      Size = 128
    end
    object cdsCobreBemPERMITE_PROTESTO: TStringField
      DisplayLabel = 'Permite Protesto'
      FieldName = 'PERMITE_PROTESTO'
      FixedChar = True
      Size = 1
    end
    object cdsCobreBemMULTAS: TFloatField
      DisplayLabel = 'Multas (%)'
      FieldName = 'MULTAS'
    end
    object cdsCobreBemTX_JUROS: TFloatField
      DisplayLabel = 'Taxa Juros (%)'
      FieldName = 'TX_JUROS'
    end
    object cdsCobreBemPERMITE_DESCONTO: TStringField
      DisplayLabel = 'Permite Desconto'
      FieldName = 'PERMITE_DESCONTO'
      Size = 1
    end
    object cdsCobreBemPERC_DESC: TFloatField
      DisplayLabel = 'Desconto (%)'
      FieldName = 'PERC_DESC'
    end
    object cdsCobreBemQTD_DIAS_LIM_DESC: TIntegerField
      DisplayLabel = 'Dias Limite de Desconto'
      FieldName = 'QTD_DIAS_LIM_DESC'
    end
    object cdsCobreBemNUMPARC_CODBARRAS: TStringField
      DisplayLabel = 'Num Parc'
      FieldName = 'NUMPARC_CODBARRAS'
      FixedChar = True
      Size = 1
    end
    object cdsCobreBemDESCONS_DIGVERIF: TStringField
      DisplayLabel = 'Desconsiderar Digito Verificador'
      FieldName = 'DESCONS_DIGVERIF'
      FixedChar = True
      Size = 1
    end
    object cdsCobreBemCOD_EMP_MULT: TIntegerField
      DisplayLabel = 'Cod Unificada'
      FieldName = 'COD_EMP_MULT'
    end
    object cdsCobreBemIDENTIFICACAO_EMP: TStringField
      DisplayLabel = 'Unificada'
      FieldName = 'IDENTIFICACAO_EMP'
      Size = 64
    end
    object cdsCobreBemINSTRUCAO_COBRANCA3: TStringField
      DisplayLabel = 'Instrucao Cob 3'
      FieldName = 'INSTRUCAO_COBRANCA3'
      FixedChar = True
      Size = 1
    end
    object cdsCobreBemTIPO_COBRANCA: TIntegerField
      Tag = 1
      DisplayLabel = 'Tipo Cobranca'
      FieldName = 'TIPO_COBRANCA'
      Visible = False
    end
    object cdsCobreBemCORR_REMESSA: TStringField
      DisplayLabel = 'Corrigir remessa'
      FieldName = 'CORR_REMESSA'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object cdsCobreBemGERAR_REGISTRO_MULTA: TStringField
      DisplayLabel = 'Gerar Registro Multa'
      FieldName = 'GERAR_REGISTRO_MULTA'
      FixedChar = True
      Size = 1
    end
    object cdsCobreBemOUTRAS_CONFIG_BOL: TMemoField
      DisplayLabel = 'Outras Config'
      FieldName = 'OUTRAS_CONFIG_BOL'
      OnGetText = cdsCobreBemOUTRAS_CONFIG_BOLGetText
      BlobType = ftMemo
      Size = 8
    end
    object cdsCobreBemLICENCA_GENERICA: TStringField
      DisplayLabel = 'Licenca Generica'
      FieldName = 'LICENCA_GENERICA'
      FixedChar = True
      Size = 1
    end
    object cdsCobreBemNOME_EMP_GENERICO: TStringField
      DisplayLabel = 'Nome Cedente'
      FieldName = 'NOME_EMP_GENERICO'
      Size = 50
    end
    object cdsCobreBemCPF_CNPJ_GENERICO: TStringField
      DisplayLabel = 'CPF/CNPJ'
      FieldName = 'CPF_CNPJ_GENERICO'
      Size = 18
    end
    object cdsCobreBemTAM_NOME_CEDENTE_GENERICO: TIntegerField
      DisplayLabel = 'Tamanho Cedente'
      FieldName = 'TAM_NOME_CEDENTE_GENERICO'
    end
    object cdsCobreBemLICENCA: TMemoField
      Tag = 1
      DisplayLabel = 'Licenca'
      FieldName = 'LICENCA'
      BlobType = ftMemo
      Size = 8
    end
    object cdsCobreBemLOGOTIPO: TBlobField
      Tag = 1
      DisplayLabel = 'Logotipo'
      FieldName = 'LOGOTIPO'
      Size = 8
    end
    object cdsCobreBemLOGOBANCO: TBlobField
      Tag = 1
      DisplayLabel = 'Logobanco'
      FieldName = 'LOGOBANCO'
      Size = 8
    end
    object cdsCobreBemCODBARRAS_A: TMemoField
      Tag = 1
      DisplayLabel = 'CodBarras A'
      FieldName = 'CODBARRAS_A'
      BlobType = ftMemo
      Size = 8
    end
    object cdsCobreBemCODBARRAS_B: TMemoField
      Tag = 1
      DisplayLabel = 'CodBarras B'
      FieldName = 'CODBARRAS_B'
      BlobType = ftMemo
      Size = 8
    end
    object cdsCobreBemCODBARRAS_C: TMemoField
      Tag = 1
      DisplayLabel = 'CodBarras C'
      FieldName = 'CODBARRAS_C'
      BlobType = ftMemo
      Size = 8
    end
    object cdsCobreBemCODBARRAS_D: TMemoField
      Tag = 1
      DisplayLabel = 'CodBarras D'
      FieldName = 'CODBARRAS_D'
      BlobType = ftMemo
      Size = 8
    end
    object cdsCobreBemAMBIENTE: TStringField
      DisplayLabel = 'Ambiente'
      FieldName = 'AMBIENTE'
      Size = 16
    end
    object cdsCobreBemTITULOCODIGOJUROS: TStringField
      DisplayLabel = 'Titulo Codigo Juros'
      FieldName = 'TITULOCODIGOJUROS'
      FixedChar = True
      Size = 1
    end
    object cdsCobreBemTITULOCODIGOMULTA: TStringField
      DisplayLabel = 'Titulo Codigo Multa'
      FieldName = 'TITULOCODIGOMULTA'
      FixedChar = True
      Size = 1
    end
    object cdsCobreBemTITULOCODIGOPROTESTO: TStringField
      DisplayLabel = 'Titulo Codigo Protesto'
      FieldName = 'TITULOCODIGOPROTESTO'
      FixedChar = True
      Size = 1
    end
    object cdsCobreBemTESTAR_HTML: TStringField
      DisplayLabel = 'Testar html'
      FieldName = 'TESTAR_HTML'
      FixedChar = True
      Size = 1
    end
    object cdsCobreBemQRCODE_PIX: TStringField
      DisplayLabel = 'QrCode Pix'
      FieldName = 'QRCODE_PIX'
      FixedChar = True
      Size = 1
    end
    object cdsCobreBemCAMINHO_CERT: TStringField
      Tag = 1
      DisplayLabel = 'Caminho Certificado'
      FieldName = 'CAMINHO_CERT'
      Size = 256
    end
    object cdsCobreBemSENHA_CERT: TStringField
      Tag = 1
      DisplayLabel = 'Senha Certificado'
      FieldName = 'SENHA_CERT'
      Size = 30
    end
    object cdsCobreBemDATA_VENC_CERT: TDateTimeField
      DisplayLabel = 'Vencimento Cerificado'
      FieldName = 'DATA_VENC_CERT'
    end
  end
  object dspCobreBem: TDataSetProvider
    DataSet = qrCobrebem
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 192
    Top = 72
  end
  object qrCobrebem: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransBoletos
    SQL.Strings = (
      'select COB.*, EMP.IDENTIFICACAO_EMP from COBREBEM COB'
      'LEFT JOIN EMPRESA EMP ON EMP.COD_EMPRESA = COB.COD_EMP_MULT'
      '')
    Left = 192
    Top = 24
  end
  object qrClientes: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransBoletos
    SQL.Strings = (
      'select'
      'c.cod_cliente,'
      'c.nome_cliente,'
      'c.razao,'
      'c.cpfcgc,'
      'c.endereco,'
      'c.END_COBRANCA,'
      'c.BAIRRO_COBRANCA,'
      'c.CIDA_COBRANCA,'
      'c.CEP_COBRANCA,'
      'c.EST_CODIGO_UF,'
      'c.bairro,'
      'c.cidade,'
      'c.cep,'
      'c.email,'
      'c.NUM_END_CLIENTE,'
      'c.COMPLEMENTO,'
      'c.INSC_EST,'
      'c.DIASPROTESTO,'
      'es.sigla_uf, '
      'c.COD_BAIRRO_COBRANCA,'
      'c.COD_CIDADE_COBRANCA'
      'from clientes c'
      'inner join estados es on c.codigo_uf = es.codigo_uf')
    Left = 445
    Top = 19
  end
  object dsClientes: TDataSource
    DataSet = cdsClientes
    Left = 445
    Top = 171
  end
  object cdsClientes: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspClientes'
    BeforeOpen = cdsBoletosBeforeOpen
    Left = 445
    Top = 115
    object cdsClientesCOD_CLIENTE: TIntegerField
      DisplayLabel = 'Cod Cliente'
      FieldName = 'COD_CLIENTE'
      Required = True
    end
    object cdsClientesNOME_CLIENTE: TStringField
      DisplayLabel = 'Nome Cliente'
      FieldName = 'NOME_CLIENTE'
      Required = True
      Size = 35
    end
    object cdsClientesCPFCGC: TStringField
      FieldName = 'CPFCGC'
      Size = 18
    end
    object cdsClientesENDERECO: TStringField
      FieldName = 'ENDERECO'
      Required = True
      Size = 50
    end
    object cdsClientesEND_COBRANCA: TStringField
      FieldName = 'END_COBRANCA'
      Size = 50
    end
    object cdsClientesBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Required = True
      Size = 35
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
    object cdsClientesEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 50
    end
    object cdsClientesSIGLA_UF: TStringField
      FieldName = 'SIGLA_UF'
      FixedChar = True
      Size = 2
    end
    object cdsClientesRAZAO: TStringField
      FieldName = 'RAZAO'
      Required = True
      Size = 60
    end
    object cdsClientesBAIRRO_COBRANCA: TStringField
      FieldName = 'BAIRRO_COBRANCA'
      Size = 35
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
    object cdsClientesEST_CODIGO_UF: TIntegerField
      FieldName = 'EST_CODIGO_UF'
      Required = True
    end
    object cdsClientesNUM_END_CLIENTE: TStringField
      FieldName = 'NUM_END_CLIENTE'
      Size = 60
    end
    object cdsClientesCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Size = 60
    end
    object cdsClientesINSC_EST: TStringField
      FieldName = 'INSC_EST'
      Size = 18
    end
    object cdsClientesDIASPROTESTO: TSmallintField
      DisplayLabel = 'Dias Protesto'
      FieldName = 'DIASPROTESTO'
    end
    object cdsClientesCOD_BAIRRO_COBRANCA: TSmallintField
      FieldName = 'COD_BAIRRO_COBRANCA'
    end
    object cdsClientesCOD_CIDADE_COBRANCA: TSmallintField
      FieldName = 'COD_CIDADE_COBRANCA'
    end
  end
  object dspClientes: TDataSetProvider
    DataSet = qrClientes
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 445
    Top = 67
  end
  object SpIncCodigo: TIBStoredProc
    Database = dtmAtivo.bancoHw
    Transaction = IBTransBoletos
    StoredProcName = 'INCREMENTA_CODIGO'
    Left = 45
    Top = 121
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
  object qrConfigBol: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransBoletos
    SQL.Strings = (
      'select * from CONFIG_BOL')
    Left = 525
    Top = 19
  end
  object dspConfigBol: TDataSetProvider
    DataSet = qrConfigBol
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 525
    Top = 67
  end
  object cdsConfigBol: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConfigBol'
    BeforeOpen = cdsBoletosBeforeOpen
    Left = 525
    Top = 115
    object cdsConfigBolCOD_BANCO: TIntegerField
      FieldName = 'COD_BANCO'
      Required = True
    end
    object cdsConfigBolORDEM_BLT: TIntegerField
      FieldName = 'ORDEM_BLT'
      Required = True
    end
    object cdsConfigBolCONT_INT_BLT: TIntegerField
      FieldName = 'CONT_INT_BLT'
    end
    object cdsConfigBolDESC_BLT: TStringField
      FieldName = 'DESC_BLT'
      FixedChar = True
      Size = 30
    end
    object cdsConfigBolLINHA_BLT: TIntegerField
      FieldName = 'LINHA_BLT'
    end
    object cdsConfigBolCOLUNA_BLT: TIntegerField
      FieldName = 'COLUNA_BLT'
    end
    object cdsConfigBolCONDENSADO: TIntegerField
      FieldName = 'CONDENSADO'
    end
    object cdsConfigBolNEGRITO: TIntegerField
      FieldName = 'NEGRITO'
    end
    object cdsConfigBolATIVO: TIntegerField
      FieldName = 'ATIVO'
    end
  end
  object DsConfigBol: TDataSource
    DataSet = cdsConfigBol
    Left = 525
    Top = 171
  end
  object dsCamposBol: TDataSource
    DataSet = cdsCamposBol
    Left = 605
    Top = 171
  end
  object cdsCamposBol: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCamposBol'
    BeforeOpen = cdsBoletosBeforeOpen
    Left = 605
    Top = 115
    object cdsCamposBolDESCRICAO_CAMP: TStringField
      FieldName = 'DESCRICAO_CAMP'
      Size = 50
    end
    object cdsCamposBolTABELA: TStringField
      FieldName = 'TABELA'
      Size = 30
    end
    object cdsCamposBolNORDEM_CAMP: TIntegerField
      FieldName = 'NORDEM_CAMP'
    end
    object cdsCamposBolCAMPOS: TStringField
      FieldName = 'CAMPOS'
      Size = 60
    end
    object cdsCamposBolATIVO: TIntegerField
      FieldName = 'ATIVO'
    end
  end
  object dspCamposBol: TDataSetProvider
    DataSet = qrCamposBol
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 605
    Top = 67
  end
  object qrCamposBol: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransBoletos
    SQL.Strings = (
      'select * from CAMPOSBOL')
    Left = 605
    Top = 19
  end
  object qrImpressao: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransBoletos
    Left = 48
    Top = 176
  end
  object dsBancos: TDataSource
    DataSet = cdsBancos
    Left = 685
    Top = 171
  end
  object cdsBancos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspBancos'
    BeforeOpen = cdsBoletosBeforeOpen
    Left = 685
    Top = 115
    object cdsBancosCOD_BANCO: TIntegerField
      FieldName = 'COD_BANCO'
      Required = True
    end
    object cdsBancosDESC_BANCO: TStringField
      FieldName = 'DESC_BANCO'
      Size = 30
    end
    object cdsBancosQTLNBOL: TIntegerField
      FieldName = 'QTLNBOL'
    end
    object cdsBancosENTRELINHAS: TStringField
      FieldName = 'ENTRELINHAS'
    end
    object cdsBancosPORTA_IMPRESSAO: TStringField
      FieldName = 'PORTA_IMPRESSAO'
      Size = 60
    end
    object cdsBancosATIVO: TIntegerField
      FieldName = 'ATIVO'
    end
    object cdsBancosCOD_CONTROLE_CX: TIntegerField
      FieldName = 'COD_CONTROLE_CX'
    end
  end
  object dspBancos: TDataSetProvider
    DataSet = qrBancos
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 685
    Top = 67
  end
  object qrBancos: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransBoletos
    SQL.Strings = (
      'select * from CODIGO_BANCO')
    Left = 685
    Top = 19
  end
  object SpCobrebem: TIBStoredProc
    Database = dtmAtivo.bancoHw
    Transaction = IBTransBoletos
    StoredProcName = 'GETPROXIMONOSSONUMERO'
    Left = 754
    Top = 20
    ParamData = <
      item
        DataType = ftString
        Name = 'NOSSONUMERO'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = 'VCOD_EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'VCOD_COBREBEM'
        ParamType = ptInput
      end>
  end
  object dsRemessaBoleto: TDataSource
    DataSet = cdsRemessaBoleto
    Left = 48
    Top = 392
  end
  object cdsRemessaBoleto: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspBoletos'
    BeforeOpen = cdsBoletosBeforeOpen
    Left = 48
    Top = 336
    object cdsRemessaBoletoDATA_REMESSA: TDateTimeField
      FieldName = 'DATA_REMESSA'
    end
    object cdsRemessaBoletoCOD_SEQ_REMESSA: TIntegerField
      FieldName = 'COD_SEQ_REMESSA'
    end
  end
  object dspRemessaBoleto: TDataSetProvider
    DataSet = qrRemessaBoleto
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 48
    Top = 288
  end
  object qrRemessaBoleto: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransBoletos
    SQL.Strings = (
      'select * from BOLETAS N_SEQ_BOL = -1')
    Left = 48
    Top = 240
  end
  object dsBoletoNossoNumeroRepetido: TDataSource
    DataSet = cdsBoletoNossoNumeroRepetido
    Left = 184
    Top = 392
  end
  object cdsBoletoNossoNumeroRepetido: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspBoletoNossoNumeroRepetido'
    BeforeOpen = cdsBoletosBeforeOpen
    OnReconcileError = cdsBoletosReconcileError
    Left = 184
    Top = 336
    object IntegerField1: TIntegerField
      Tag = 2
      DisplayLabel = 'Num Seq Boleto'
      FieldName = 'N_SEQ_BOL'
      Required = True
    end
    object IntegerField2: TIntegerField
      Tag = 2
      DisplayLabel = 'Cod Cliente'
      FieldName = 'COD_CLIENTE'
    end
    object StringField1: TStringField
      DisplayLabel = 'Nome Fantasia'
      FieldName = 'NOME_CLIENTE'
      ProviderFlags = [pfInWhere]
      Size = 35
    end
    object StringField2: TStringField
      DisplayLabel = 'Razao Social'
      FieldName = 'RAZAO'
      ProviderFlags = [pfInWhere]
      Size = 60
    end
    object cdsBoletoNossoNumeroRepetidoCPFCGC: TStringField
      DisplayLabel = 'CPF / CNPJ'
      FieldName = 'CPFCGC'
      ProviderFlags = [pfInWhere]
      Size = 18
    end
    object IntegerField3: TIntegerField
      Tag = 2
      DisplayLabel = 'Num NF'
      FieldName = 'NUM_NF_VND'
    end
    object IntegerField4: TIntegerField
      DisplayLabel = 'Cod Cred'
      FieldName = 'COD_CRED'
    end
    object cdsBoletoNossoNumeroRepetidoNOME_CTRL: TStringField
      DisplayLabel = 'Controle'
      FieldName = 'NOME_CTRL'
      ProviderFlags = [pfInWhere]
      Size = 35
    end
    object DateTimeField1: TDateTimeField
      Tag = 2
      DisplayLabel = 'Data Emissao'
      FieldName = 'DATA_EM_BOL'
      EditMask = '!99/99/0000;1;_'
    end
    object DateTimeField2: TDateTimeField
      Tag = 2
      DisplayLabel = 'Data Vencimento'
      FieldName = 'DATA_VEN_BOL'
      EditMask = '!99/99/0000;1;_'
    end
    object StringField3: TStringField
      Tag = 2
      DisplayLabel = 'Num Doc'
      FieldName = 'N_DOC_BOL'
      Size = 10
    end
    object FloatField1: TFloatField
      Tag = 2
      DisplayLabel = 'Valor Liquido'
      FieldName = 'VL_DOC_BOL'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '###,###,##0.00'
    end
    object StringField4: TStringField
      DisplayLabel = 'Obs 1'
      FieldName = 'OBS_BOL'
      Size = 45
    end
    object StringField5: TStringField
      DisplayLabel = 'Obs 2'
      FieldName = 'OBS_BOL1'
      Size = 45
    end
    object FloatField2: TFloatField
      DisplayLabel = 'Mora Diaria'
      FieldName = 'M_DIA_BOL'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '###,###,##0.00'
    end
    object FloatField3: TFloatField
      DisplayLabel = 'Multa '
      FieldName = 'MULT_ATR_BOL'
    end
    object StringField6: TStringField
      DisplayLabel = 'Local Pagamento'
      FieldName = 'LOCALPAG'
      Size = 128
    end
    object IntegerField5: TIntegerField
      DisplayLabel = 'Cod Controle'
      FieldName = 'COD_CONTROLE_CX'
    end
    object IntegerField6: TIntegerField
      DisplayLabel = 'Cod Convenio'
      FieldName = 'COD_COBREBEM'
    end
    object StringField7: TStringField
      DisplayLabel = 'Nosso Numero'
      FieldName = 'NOSSO_NUMERO_BANCO'
    end
    object StringField8: TStringField
      DisplayLabel = 'Remessa Enviada'
      FieldName = 'REMESSA_ENVIADA'
      FixedChar = True
      Size = 1
    end
    object IntegerField7: TIntegerField
      DisplayLabel = 'Cod Seq Remessa'
      FieldName = 'COD_SEQ_REMESSA'
    end
    object DateTimeField3: TDateTimeField
      DisplayLabel = 'Data Remessa'
      FieldName = 'DATA_REMESSA'
    end
    object IntegerField8: TIntegerField
      DisplayLabel = 'Num Cupom'
      FieldName = 'N_CUPOM'
    end
    object IntegerField9: TIntegerField
      DisplayLabel = 'Numero PDV'
      FieldName = 'N_PDV'
    end
    object IntegerField10: TIntegerField
      DisplayLabel = 'Sub Serie NF'
      FieldName = 'SUB_SERIE'
    end
    object IntegerField11: TIntegerField
      Tag = 1
      DisplayLabel = 'C'#243'd. Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object IntegerField12: TIntegerField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
    object StringField9: TStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      FixedChar = True
      Size = 7
    end
    object cdsBoletoNossoNumeroRepetidoEMAIL: TStringField
      DisplayLabel = 'Email'
      FieldName = 'EMAIL'
      ProviderFlags = [pfInWhere]
      Size = 256
    end
    object cdsBoletoNossoNumeroRepetidoDATA_ENV_EMAIL: TDateTimeField
      DisplayLabel = 'Data Email Bol'
      FieldName = 'DATA_ENV_EMAIL'
      ProviderFlags = [pfInWhere]
    end
    object cdsBoletoNossoNumeroRepetidoDATA_ENV_WHATSAPP: TDateTimeField
      DisplayLabel = 'Data WhatsApp Bol'
      FieldName = 'DATA_ENV_WHATSAPP'
      ProviderFlags = [pfInWhere]
    end
    object cdsBoletoNossoNumeroRepetidoDATA_ENV_MENS: TDateTimeField
      DisplayLabel = 'Data Mens Bol'
      FieldName = 'DATA_ENV_MENS'
      ProviderFlags = [pfInWhere]
    end
  end
  object dspBoletoNossoNumeroRepetido: TDataSetProvider
    DataSet = qrBoletoNossoNumeroRepetido
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 184
    Top = 288
  end
  object qrBoletoNossoNumeroRepetido: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransBoletos
    SQL.Strings = (
      
        'select BOLETAS.*, CONTROLES.NOME_CTRL,CLIENTES.NOME_CLIENTE,CLIE' +
        'NTES.RAZAO,CLIENTES.CPFCGC, CLIENTES.EMAIL,'
      
        'RETORNA_DATA_ENV_BOL.DATA_ENV_EMAIL, RETORNA_DATA_ENV_BOL.DATA_E' +
        'NV_WHATSAPP from BOLETAS'
      
        'INNER JOIN CLIENTES ON BOLETAS.COD_CLIENTE = CLIENTES.COD_CLIENT' +
        'E AND BOLETAS.COD_EMPRESA = CLIENTES.COD_EMPRESA'
      
        'LEFT JOIN CONTROLES ON BOLETAS.COD_CONTROLE_CX = CONTROLES.CODIG' +
        'O_CTRL AND BOLETAS.COD_EMPRESA = CONTROLES.CODIGO_EMP'
      
        'LEFT JOIN RETORNA_DATA_ENV_BOL (BOLETAS.N_SEQ_BOL, BOLETAS.COD_E' +
        'MPRESA) ON 1 = 1 ')
    Left = 184
    Top = 240
    object IBStringField1: TIBStringField
      FieldName = 'NOME_CLIENTE'
      Origin = '"CLIENTES"."NOME_CLIENTE"'
      ProviderFlags = [pfInWhere]
      Size = 35
    end
    object IBStringField2: TIBStringField
      FieldName = 'RAZAO'
      Origin = '"CLIENTES"."RAZAO"'
      ProviderFlags = [pfInWhere]
      Size = 60
    end
    object qrBoletoNossoNumeroRepetidoCPFCGC: TIBStringField
      FieldName = 'CPFCGC'
      Origin = '"CLIENTES"."CPFCGC"'
      ProviderFlags = [pfInWhere]
      Size = 18
    end
    object IntegerField13: TIntegerField
      FieldName = 'N_SEQ_BOL'
      Origin = '"BOLETAS"."N_SEQ_BOL"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IntegerField14: TIntegerField
      FieldName = 'COD_EMPRESA'
      Origin = '"BOLETAS"."COD_EMPRESA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IntegerField15: TIntegerField
      FieldName = 'NUM_NF_VND'
      Origin = '"BOLETAS"."NUM_NF_VND"'
    end
    object IntegerField16: TIntegerField
      FieldName = 'N_CUPOM'
      Origin = '"BOLETAS"."N_CUPOM"'
    end
    object IntegerField17: TIntegerField
      FieldName = 'N_PDV'
      Origin = '"BOLETAS"."N_PDV"'
    end
    object qrBoletoNossoNumeroRepetidoNOME_CTRL: TIBStringField
      FieldName = 'NOME_CTRL'
      Origin = '"CONTROLES"."NOME_CTRL"'
      ProviderFlags = [pfInWhere]
      Size = 35
    end
    object IntegerField18: TIntegerField
      FieldName = 'COD_CRED'
      Origin = '"BOLETAS"."COD_CRED"'
    end
    object DateTimeField4: TDateTimeField
      FieldName = 'DATA_EM_BOL'
      Origin = '"BOLETAS"."DATA_EM_BOL"'
    end
    object DateTimeField5: TDateTimeField
      FieldName = 'DATA_VEN_BOL'
      Origin = '"BOLETAS"."DATA_VEN_BOL"'
    end
    object IBStringField3: TIBStringField
      FieldName = 'N_DOC_BOL'
      Origin = '"BOLETAS"."N_DOC_BOL"'
      Size = 10
    end
    object FloatField4: TFloatField
      FieldName = 'VL_DOC_BOL'
      Origin = '"BOLETAS"."VL_DOC_BOL"'
    end
    object IBStringField4: TIBStringField
      FieldName = 'OBS_BOL'
      Origin = '"BOLETAS"."OBS_BOL"'
      Size = 45
    end
    object FloatField5: TFloatField
      FieldName = 'M_DIA_BOL'
      Origin = '"BOLETAS"."M_DIA_BOL"'
    end
    object FloatField6: TFloatField
      FieldName = 'MULT_ATR_BOL'
      Origin = '"BOLETAS"."MULT_ATR_BOL"'
    end
    object IntegerField19: TIntegerField
      FieldName = 'COD_CLIENTE'
      Origin = '"BOLETAS"."COD_CLIENTE"'
    end
    object IBStringField5: TIBStringField
      FieldName = 'LOCALPAG'
      Origin = '"BOLETAS"."LOCALPAG"'
      Size = 128
    end
    object IBStringField6: TIBStringField
      FieldName = 'OBS_BOL1'
      Origin = '"BOLETAS"."OBS_BOL1"'
      Size = 45
    end
    object IntegerField20: TIntegerField
      FieldName = 'ATIVO'
      Origin = '"BOLETAS"."ATIVO"'
    end
    object IBStringField7: TIBStringField
      FieldName = 'NOSSO_NUMERO_BANCO'
      Origin = '"BOLETAS"."NOSSO_NUMERO_BANCO"'
    end
    object IntegerField21: TIntegerField
      FieldName = 'COD_CONTROLE_CX'
      Origin = '"BOLETAS"."COD_CONTROLE_CX"'
    end
    object IBStringField8: TIBStringField
      FieldName = 'REMESSA_ENVIADA'
      Origin = '"BOLETAS"."REMESSA_ENVIADA"'
      FixedChar = True
      Size = 1
    end
    object IntegerField22: TIntegerField
      FieldName = 'SUB_SERIE'
      Origin = '"BOLETAS"."SUB_SERIE"'
    end
    object DateTimeField6: TDateTimeField
      FieldName = 'DATA_REMESSA'
      Origin = '"BOLETAS"."DATA_REMESSA"'
    end
    object IntegerField23: TIntegerField
      FieldName = 'COD_COBREBEM'
      Origin = '"BOLETAS"."COD_COBREBEM"'
    end
    object IntegerField24: TIntegerField
      FieldName = 'COD_SEQ_REMESSA'
      Origin = '"BOLETAS"."COD_SEQ_REMESSA"'
    end
    object IBStringField9: TIBStringField
      FieldName = 'STATUS'
      Origin = '"BOLETAS"."STATUS"'
    end
    object qrBoletoNossoNumeroRepetidoEMAIL: TIBStringField
      FieldName = 'EMAIL'
      Origin = '"CLIENTES"."EMAIL"'
      ProviderFlags = [pfInWhere]
      Size = 256
    end
    object qrBoletoNossoNumeroRepetidoDATA_ENV_EMAIL: TDateTimeField
      FieldName = 'DATA_ENV_EMAIL'
      Origin = '"RETORNA_DATA_ENV_BOL"."DATA_ENV_EMAIL"'
      ProviderFlags = [pfInWhere]
    end
    object qrBoletoNossoNumeroRepetidoDATA_ENV_WHATSAPP: TDateTimeField
      FieldName = 'DATA_ENV_WHATSAPP'
      Origin = '"RETORNA_DATA_ENV_BOL"."DATA_ENV_WHATSAPP"'
      ProviderFlags = [pfInWhere]
    end
    object qrBoletoNossoNumeroRepetidoDATA_ENV_MENS: TDateTimeField
      FieldName = 'DATA_ENV_MENS'
      Origin = '"RETORNA_DATA_ENV_BOL"."DATA_ENV_MENS"'
    end
  end
  object IBTransCobrebem: TIBTransaction
    DefaultDatabase = dtmAtivo.bancoHw
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 848
    Top = 16
  end
  object dsPesqBanco: TDataSource
    DataSet = cdsPesqBanco
    Left = 376
    Top = 384
  end
  object cdsPesqBanco: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPesqBanco'
    BeforeOpen = cdsBoletosBeforeOpen
    Left = 376
    Top = 328
    object IntegerField25: TIntegerField
      FieldName = 'COD_BANCO'
      Required = True
    end
    object StringField10: TStringField
      FieldName = 'DESC_BANCO'
      Size = 30
    end
    object IntegerField26: TIntegerField
      FieldName = 'QTLNBOL'
    end
    object StringField11: TStringField
      FieldName = 'ENTRELINHAS'
    end
    object StringField12: TStringField
      FieldName = 'PORTA_IMPRESSAO'
      Size = 60
    end
    object IntegerField27: TIntegerField
      FieldName = 'ATIVO'
    end
    object IntegerField28: TIntegerField
      FieldName = 'COD_CONTROLE_CX'
    end
  end
  object dspPesqBanco: TDataSetProvider
    DataSet = qrPesqBanco
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 376
    Top = 280
  end
  object qrPesqBanco: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransBoletos
    SQL.Strings = (
      'select * from CODIGO_BANCO where ativo = 1')
    Left = 376
    Top = 232
  end
  object dsNFVenda: TDataSource
    DataSet = cdsNFVenda
    Left = 472
    Top = 392
  end
  object cdsNFVenda: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspNFVenda'
    BeforeOpen = cdsBoletosBeforeOpen
    OnReconcileError = cdsBoletosReconcileError
    Left = 472
    Top = 336
    object cdsNFVendaNUM_NF_VND: TIntegerField
      FieldName = 'NUM_NF_VND'
      Required = True
    end
    object cdsNFVendaCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsNFVendaSUB_SERIE: TIntegerField
      FieldName = 'SUB_SERIE'
    end
    object cdsNFVendaCODIGO_TR: TIntegerField
      FieldName = 'CODIGO_TR'
      Required = True
    end
    object cdsNFVendaCOD_CLIENTE: TIntegerField
      FieldName = 'COD_CLIENTE'
      Required = True
    end
    object cdsNFVendaCOD_COND_PAG: TIntegerField
      FieldName = 'COD_COND_PAG'
      Required = True
    end
    object cdsNFVendaCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
      Required = True
    end
    object cdsNFVendaDATA_EM_VND: TDateTimeField
      FieldName = 'DATA_EM_VND'
    end
    object cdsNFVendaDATA_ETS_VND: TDateTimeField
      FieldName = 'DATA_ETS_VND'
    end
    object cdsNFVendaVL_TOT_VND: TFloatField
      FieldName = 'VL_TOT_VND'
    end
    object cdsNFVendaALIQ_ICM_VND: TFloatField
      FieldName = 'ALIQ_ICM_VND'
    end
    object cdsNFVendaBASE_ICM_VND: TFloatField
      FieldName = 'BASE_ICM_VND'
    end
    object cdsNFVendaDESCONTO_VND: TFloatField
      FieldName = 'DESCONTO_VND'
    end
    object cdsNFVendaSTATUS_VND: TStringField
      FieldName = 'STATUS_VND'
      FixedChar = True
      Size = 10
    end
    object cdsNFVendaOBS_VND: TMemoField
      FieldName = 'OBS_VND'
      BlobType = ftMemo
      Size = 8
    end
    object cdsNFVendaALIQ_ISS: TFloatField
      FieldName = 'ALIQ_ISS'
    end
    object cdsNFVendaB_ICMSUB_VND: TFloatField
      FieldName = 'B_ICMSUB_VND'
    end
    object cdsNFVendaICMSUB_VND: TFloatField
      FieldName = 'ICMSUB_VND'
    end
    object cdsNFVendaFRETE_VND: TFloatField
      FieldName = 'FRETE_VND'
    end
    object cdsNFVendaSEGURO_VND: TFloatField
      FieldName = 'SEGURO_VND'
    end
    object cdsNFVendaO_DESP_VND: TFloatField
      FieldName = 'O_DESP_VND'
    end
    object cdsNFVendaIPI_VND: TFloatField
      FieldName = 'IPI_VND'
    end
    object cdsNFVendaPLACA_V_TR: TStringField
      FieldName = 'PLACA_V_TR'
      FixedChar = True
      Size = 7
    end
    object cdsNFVendaFRC_VND: TStringField
      FieldName = 'FRC_VND'
      FixedChar = True
      Size = 1
    end
    object cdsNFVendaV_QUANT_VND: TStringField
      FieldName = 'V_QUANT_VND'
      FixedChar = True
      Size = 10
    end
    object cdsNFVendaESPECIE_VND: TStringField
      FieldName = 'ESPECIE_VND'
      FixedChar = True
      Size = 15
    end
    object cdsNFVendaMARCA_VND: TStringField
      FieldName = 'MARCA_VND'
      FixedChar = True
      Size = 15
    end
    object cdsNFVendaNUMERO_VND: TStringField
      FieldName = 'NUMERO_VND'
      FixedChar = True
      Size = 15
    end
    object cdsNFVendaPESO_B_VND: TStringField
      FieldName = 'PESO_B_VND'
      FixedChar = True
      Size = 10
    end
    object cdsNFVendaPESO_L_VND: TStringField
      FieldName = 'PESO_L_VND'
      FixedChar = True
      Size = 10
    end
    object cdsNFVendaIRRF_VND: TFloatField
      FieldName = 'IRRF_VND'
    end
    object cdsNFVendaCODIGO_NOP: TFloatField
      FieldName = 'CODIGO_NOP'
    end
    object cdsNFVendaVL_PROD_VND: TFloatField
      FieldName = 'VL_PROD_VND'
    end
    object cdsNFVendaVL_SERV_VND: TFloatField
      FieldName = 'VL_SERV_VND'
    end
    object cdsNFVendaUF_PLACA_TR: TStringField
      FieldName = 'UF_PLACA_TR'
      FixedChar = True
      Size = 2
    end
    object cdsNFVendaVALOR_ICMS: TFloatField
      FieldName = 'VALOR_ICMS'
    end
    object cdsNFVendaBCISS_VND: TFloatField
      FieldName = 'BCISS_VND'
    end
    object cdsNFVendaVLISS_VND: TFloatField
      FieldName = 'VLISS_VND'
    end
    object cdsNFVendaDESC_PROD: TFloatField
      FieldName = 'DESC_PROD'
    end
    object cdsNFVendaDESC_SERV: TFloatField
      FieldName = 'DESC_SERV'
    end
    object cdsNFVendaATIVO: TIntegerField
      FieldName = 'ATIVO'
    end
    object cdsNFVendaRESULTADO_ENVIO: TStringField
      FieldName = 'RESULTADO_ENVIO'
      Size = 30
    end
    object cdsNFVendaDATA_AUTORIZACAO: TDateTimeField
      FieldName = 'DATA_AUTORIZACAO'
    end
    object cdsNFVendaSITUACAO_NFE: TStringField
      FieldName = 'SITUACAO_NFE'
      Size = 40
    end
    object cdsNFVendaDIGEST: TStringField
      FieldName = 'DIGEST'
      Size = 40
    end
    object cdsNFVendaPROTOCOLO: TStringField
      FieldName = 'PROTOCOLO'
      Size = 40
    end
    object cdsNFVendaCODIGOERRO: TStringField
      FieldName = 'CODIGOERRO'
      Size = 10
    end
    object cdsNFVendaDESCRICAOERRO: TStringField
      FieldName = 'DESCRICAOERRO'
      Size = 50
    end
    object cdsNFVendaTEMPORESPOSTA: TSmallintField
      FieldName = 'TEMPORESPOSTA'
    end
    object cdsNFVendaHORA_ENVIO: TStringField
      FieldName = 'HORA_ENVIO'
      Size = 8
    end
    object cdsNFVendaTIPONFE: TStringField
      FieldName = 'TIPONFE'
      Size = 40
    end
    object cdsNFVendaDANFEIMPRESSO: TStringField
      FieldName = 'DANFEIMPRESSO'
      Size = 5
    end
    object cdsNFVendaDATAHORA_ENVIO: TDateTimeField
      FieldName = 'DATAHORA_ENVIO'
    end
    object cdsNFVendaCHAVE_NFE: TStringField
      FieldName = 'CHAVE_NFE'
      Size = 60
    end
    object cdsNFVendaSEL_NFE: TIntegerField
      FieldName = 'SEL_NFE'
    end
    object cdsNFVendaN_FORM_SEGURANCA: TIntegerField
      FieldName = 'N_FORM_SEGURANCA'
    end
    object cdsNFVendaNUM_NF_VNDANT: TIntegerField
      FieldName = 'NUM_NF_VNDANT'
    end
    object cdsNFVendaSUB_SERIEANT: TIntegerField
      FieldName = 'SUB_SERIEANT'
    end
    object cdsNFVendaJUST_CANCELAMENTO: TStringField
      FieldName = 'JUST_CANCELAMENTO'
      Size = 60
    end
    object cdsNFVendaMODELO_NF: TStringField
      FieldName = 'MODELO_NF'
      Size = 3
    end
    object cdsNFVendaCOM_PROD: TStringField
      FieldName = 'COM_PROD'
      Size = 1
    end
    object cdsNFVendaCOM_SERV: TStringField
      FieldName = 'COM_SERV'
      Size = 1
    end
    object cdsNFVendaINUTILNFANT: TStringField
      FieldName = 'INUTILNFANT'
      Size = 1
    end
    object cdsNFVendaDESC_NATOP: TStringField
      FieldName = 'DESC_NATOP'
      Size = 40
    end
    object cdsNFVendaCRT: TStringField
      FieldName = 'CRT'
      FixedChar = True
      Size = 1
    end
  end
  object dspNFVenda: TDataSetProvider
    DataSet = qrNFVenda
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 472
    Top = 288
  end
  object qrNFVenda: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransBoletos
    SQL.Strings = (
      'select * from nf_venda where NUM_NF_VND = 0')
    Left = 472
    Top = 240
  end
  object qrFinanceiro: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransBoletos
    Left = 583
    Top = 232
  end
  object qrControleCreditosBol: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransBoletos
    SQL.Strings = (
      
        'select cc.*, empresa.identificacao_emp from controle_creditos cc' +
        ' '
      'left join empresa on empresa.cod_empresa = cc.cod_emp_mult '
      'where cc.cod_cliente  = 0'
      'and (cc.prcss is null or cc.prcss <> '#39'S'#39')'
      
        'and (ltrim(cc.status_C) <>  '#39'QUITADO'#39' and rtrim(cc.status_C) <> ' +
        ' '#39'QUITADO'#39' or cc.status_C is null ) '
      'and cc.cod_emp_mult = 0 order by cc.data_venda desc')
    Left = 296
    Top = 224
  end
  object dsControleCreditosBol: TDataSource
    DataSet = cdsControleCreditosBol
    Left = 293
    Top = 376
  end
  object dspControleCreditosBol: TDataSetProvider
    DataSet = qrControleCreditosBol
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 293
    Top = 272
  end
  object cdsControleCreditosBol: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspControleCreditosBol'
    BeforeOpen = cdsBoletosBeforeOpen
    Left = 293
    Top = 320
    object cdsControleCreditosBolTIPO_DOC_C: TStringField
      Tag = 2
      DisplayLabel = 'Tipo Documento'
      FieldName = 'TIPO_DOC_C'
      FixedChar = True
      Size = 15
    end
    object cdsControleCreditosBolNOME_C: TStringField
      DisplayLabel = 'Nome Cliente'
      FieldName = 'NOME_C'
      Size = 35
    end
    object cdsControleCreditosBolN_DOC_C: TStringField
      DisplayLabel = 'Num Documento'
      FieldName = 'N_DOC_C'
      FixedChar = True
    end
    object cdsControleCreditosBolDATA_VENC_C: TDateTimeField
      Tag = 2
      DisplayLabel = 'Data Vencimento'
      FieldName = 'DATA_VENC_C'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsControleCreditosBolVALOR_C: TFloatField
      Tag = 2
      DisplayLabel = 'Valor Credito'
      FieldName = 'VALOR_C'
      DisplayFormat = '##0.00'
    end
    object cdsControleCreditosBolVALOR_CORR: TFloatField
      Tag = 2
      DisplayLabel = 'Valor Corrigido'
      FieldName = 'VALOR_CORR'
      DisplayFormat = '##0.00'
    end
    object cdsControleCreditosBolVALOR_DESC: TFloatField
      DisplayLabel = 'Valor Desconto'
      FieldName = 'VALOR_DESC'
      DisplayFormat = '##0.00'
    end
    object cdsControleCreditosBolVALOR_ACRESC: TFloatField
      DisplayLabel = 'Valor Acrescimo'
      FieldName = 'VALOR_ACRESC'
      DisplayFormat = '##0.00'
    end
    object cdsControleCreditosBolVALOR_ORIGINAL: TFloatField
      DisplayLabel = 'Valor Original'
      FieldName = 'VALOR_ORIGINAL'
      DisplayFormat = '##0.00'
    end
    object cdsControleCreditosBolVALOR_LIQUIDO: TFloatField
      DisplayLabel = 'Valor L'#237'quido'
      FieldName = 'VALOR_LIQUIDO'
      DisplayFormat = '##0.00'
    end
    object cdsControleCreditosBolSTATUS_C: TStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS_C'
      FixedChar = True
      Size = 10
    end
    object cdsControleCreditosBolCOD_CRED: TIntegerField
      Tag = 2
      DisplayLabel = 'Codigo'
      FieldName = 'COD_CRED'
      Required = True
    end
    object cdsControleCreditosBolHISTORICO_C: TStringField
      DisplayLabel = 'Historico'
      FieldName = 'HISTORICO_C'
      Size = 100
    end
    object cdsControleCreditosBolN_CONTA_PLC: TFloatField
      DisplayLabel = 'Num da Conta'
      FieldName = 'N_CONTA_PLC'
    end
    object cdsControleCreditosBolCODIGO_CTRL: TIntegerField
      DisplayLabel = 'Codigo Controle'
      FieldName = 'CODIGO_CTRL'
      Required = True
    end
    object cdsControleCreditosBolRAZAO: TStringField
      DisplayLabel = 'Razao Social Cliente'
      FieldName = 'RAZAO'
      Size = 60
    end
    object cdsControleCreditosBolCOD_CLIENTE: TIntegerField
      DisplayLabel = 'Codigo Cliente'
      FieldName = 'COD_CLIENTE'
    end
    object cdsControleCreditosBolDATA_REC_C: TDateTimeField
      DisplayLabel = 'Data Cadastro'
      FieldName = 'DATA_REC_C'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsControleCreditosBolDATQ_C: TDateTimeField
      DisplayLabel = 'Data Quita'#231#227'o'
      FieldName = 'DATQ_C'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsControleCreditosBolNATL_C: TStringField
      DisplayLabel = 'Natureza(C/N)'
      FieldName = 'NATL_C'
      FixedChar = True
      Size = 1
    end
    object cdsControleCreditosBolN_DOC_V: TIntegerField
      DisplayLabel = 'Num Doc Venda'
      FieldName = 'N_DOC_V'
    end
    object cdsControleCreditosBolTP_DOC_V: TStringField
      DisplayLabel = 'Tipo Doc Venda'
      FieldName = 'TP_DOC_V'
      FixedChar = True
      Size = 6
    end
    object cdsControleCreditosBolJUROS_COB: TFloatField
      DisplayLabel = 'Valor Juros Cobrado'
      FieldName = 'JUROS_COB'
      DisplayFormat = '##0.00'
    end
    object cdsControleCreditosBolTAXA_COBRANCA: TFloatField
      DisplayLabel = 'Valor Taxa Cobran'#231'a'
      FieldName = 'TAXA_COBRANCA'
      DisplayFormat = '##0.00'
    end
    object cdsControleCreditosBolNOSSO_NUMERO_BANCO: TStringField
      DisplayLabel = 'Nosso Numero Boleto'
      FieldName = 'NOSSO_NUMERO_BANCO'
    end
    object cdsControleCreditosBolOCORRENCIABANCARIA: TMemoField
      DisplayLabel = 'Informa'#231#227'o Banc'#225'ria'
      FieldName = 'OCORRENCIABANCARIA'
      OnGetText = cdsControleCreditosBolOCORRENCIABANCARIAGetText
      BlobType = ftMemo
      Size = 8
    end
    object cdsControleCreditosBolLOTE: TIntegerField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
    end
    object cdsControleCreditosBolLOTE_QUIT: TIntegerField
      DisplayLabel = 'Lote Baixa'
      FieldName = 'LOTE_QUIT'
    end
    object cdsControleCreditosBolLOTE_ENT: TIntegerField
      DisplayLabel = 'Lote Cadastro'
      FieldName = 'LOTE_ENT'
    end
    object cdsControleCreditosBolLOTE_CXL: TIntegerField
      DisplayLabel = 'Lote CXL'
      FieldName = 'LOTE_CXL'
    end
    object cdsControleCreditosBolTIP_CNT: TStringField
      DisplayLabel = 'Tipo Cadastro(C/N)'
      FieldName = 'TIP_CNT'
      FixedChar = True
      Size = 1
    end
    object cdsControleCreditosBolLOTE_NEG: TIntegerField
      DisplayLabel = 'Lote Negativa'#231#227'o'
      FieldName = 'LOTE_NEG'
    end
    object cdsControleCreditosBolCOD_CLI_TERC: TIntegerField
      DisplayLabel = 'Codigo Cliente Terceiro'
      FieldName = 'COD_CLI_TERC'
    end
    object cdsControleCreditosBolNOME_TERC: TStringField
      DisplayLabel = 'Nome Terceiro'
      FieldName = 'NOME_TERC'
      Size = 35
    end
    object cdsControleCreditosBolDATA_CXL: TDateTimeField
      DisplayLabel = 'Data Caixa Auxiliar'
      FieldName = 'DATA_CXL'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsControleCreditosBolCODIGO_VEND: TIntegerField
      DisplayLabel = 'Codigo Vendedor'
      FieldName = 'CODIGO_VEND'
    end
    object cdsControleCreditosBolN_DUPL_C: TIntegerField
      DisplayLabel = 'Num Duplicata'
      FieldName = 'N_DUPL_C'
    end
    object cdsControleCreditosBolDATA_REM_REC: TDateTimeField
      DisplayLabel = 'Data Remessa'
      FieldName = 'DATA_REM_REC'
    end
    object cdsControleCreditosBolCOD_TERM: TIntegerField
      DisplayLabel = 'Codigo Terminal'
      FieldName = 'COD_TERM'
    end
    object cdsControleCreditosBolDATA_BAIXA: TDateTimeField
      DisplayLabel = 'Data Real da Baixa'
      FieldName = 'DATA_BAIXA'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsControleCreditosBolDATA_VENDA: TDateTimeField
      DisplayLabel = 'Data Venda'
      FieldName = 'DATA_VENDA'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsControleCreditosBolCODIGO_FUNC: TIntegerField
      DisplayLabel = 'Codigo Func'
      FieldName = 'CODIGO_FUNC'
    end
    object cdsControleCreditosBolDIA_CXL: TDateTimeField
      DisplayLabel = 'Dia CXL'
      FieldName = 'DIA_CXL'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsControleCreditosBolSTATUS_CXL_RQ: TStringField
      DisplayLabel = 'Status Recebimento CXL'
      FieldName = 'STATUS_CXL_RQ'
      FixedChar = True
      Size = 1
    end
    object cdsControleCreditosBolVL_RQ_PG_CXL: TFloatField
      DisplayLabel = 'Valor Recebido Cxl'
      FieldName = 'VL_RQ_PG_CXL'
      DisplayFormat = '##0.00'
    end
    object cdsControleCreditosBolOP_CXL: TIntegerField
      DisplayLabel = 'Operador CXL'
      FieldName = 'OP_CXL'
    end
    object cdsControleCreditosBolTP_REC_CXL: TStringField
      DisplayLabel = 'Tipo Recebimento CXL'
      FieldName = 'TP_REC_CXL'
      FixedChar = True
      Size = 1
    end
    object cdsControleCreditosBolCPFCGC: TStringField
      DisplayLabel = 'CPF/CNPJ'
      FieldName = 'CPFCGC'
      FixedChar = True
      Size = 18
    end
    object cdsControleCreditosBolPRCSS: TStringField
      DisplayLabel = 'Processamento'
      FieldName = 'PRCSS'
      FixedChar = True
      Size = 1
    end
    object cdsControleCreditosBolCOD_IT_CARTAS: TIntegerField
      DisplayLabel = 'Codigo Item Carta'
      FieldName = 'COD_IT_CARTAS'
    end
    object cdsControleCreditosBolDT_REG_CARTAS: TDateTimeField
      DisplayLabel = 'Data Envio Carta'
      FieldName = 'DT_REG_CARTAS'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsControleCreditosBolN_SEQ_BOL: TIntegerField
      DisplayLabel = 'Num Seq Bol'
      FieldName = 'N_SEQ_BOL'
    end
    object cdsControleCreditosBolCOD_CARTA: TIntegerField
      DisplayLabel = 'Codigo Carta Cobran'#231'a'
      FieldName = 'COD_CARTA'
    end
    object cdsControleCreditosBolN_AUT_CART: TStringField
      DisplayLabel = 'Num Autoriza'#231#227'o Cart'#227'o'
      FieldName = 'N_AUT_CART'
      FixedChar = True
    end
    object cdsControleCreditosBolCOD_FATURAMENTO: TIntegerField
      DisplayLabel = 'Codigo Faturamento'
      FieldName = 'COD_FATURAMENTO'
    end
    object cdsControleCreditosBolDATA_LOTE_NEG: TDateTimeField
      DisplayLabel = 'Data Lote Negativa'#231#227'o'
      FieldName = 'DATA_LOTE_NEG'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsControleCreditosBolNUM_NOTA: TIntegerField
      DisplayLabel = 'Num Nf'
      FieldName = 'NUM_NOTA'
    end
    object cdsControleCreditosBolNREQ: TIntegerField
      DisplayLabel = 'Num REQ'
      FieldName = 'NREQ'
    end
    object cdsControleCreditosBolN_OS: TIntegerField
      DisplayLabel = 'Num OS'
      FieldName = 'N_OS'
    end
    object cdsControleCreditosBolNCOMANDO: TIntegerField
      DisplayLabel = 'Num Comando'
      FieldName = 'NCOMANDO'
    end
    object cdsControleCreditosBolNGRP: TIntegerField
      DisplayLabel = 'Num GRP'
      FieldName = 'NGRP'
    end
    object cdsControleCreditosBolUS_CANCELOU: TStringField
      DisplayLabel = 'Codigo Usuario Cancelou'
      FieldName = 'US_CANCELOU'
      Size = 10
    end
    object cdsControleCreditosBolDT_US_CANCELOU: TDateTimeField
      DisplayLabel = 'Data Original do Cr'#233'dito'
      FieldName = 'DT_US_CANCELOU'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsControleCreditosBolOBS_C: TStringField
      DisplayLabel = 'Observa'#231#227'o'
      FieldName = 'OBS_C'
      Size = 60
    end
    object cdsControleCreditosBolOBS_PARACREDITO: TStringField
      DisplayLabel = 'Observa'#231#227'o para Cr'#233'dito'
      FieldName = 'OBS_PARACREDITO'
      Size = 50
    end
    object cdsControleCreditosBolDTORIGINAL_C: TDateTimeField
      DisplayLabel = 'Data Original do Cr'#233'dito'
      FieldName = 'DTORIGINAL_C'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsControleCreditosBolDEPENDENTE: TStringField
      DisplayLabel = 'Nome Dependente'
      FieldName = 'DEPENDENTE'
      Size = 35
    end
    object cdsControleCreditosBolCOD_TERMINAL: TIntegerField
      DisplayLabel = 'Codigo Caixa ECF'
      FieldName = 'COD_TERMINAL'
    end
    object cdsControleCreditosBolCOONAOFISCAL: TIntegerField
      DisplayLabel = 'COO N'#227'o Fiscal'
      FieldName = 'COONAOFISCAL'
    end
    object cdsControleCreditosBolNSERIEECF: TStringField
      DisplayLabel = 'Num Serie ECF'
      FieldName = 'NSERIEECF'
    end
    object cdsControleCreditosBolCODIGO_EMP: TIntegerField
      Tag = 1
      DisplayLabel = 'Codigo Empresa'
      FieldName = 'CODIGO_EMP'
      Required = True
    end
    object cdsControleCreditosBolSELEC: TStringField
      Tag = 1
      DisplayLabel = 'S'
      FieldName = 'SELEC'
      FixedChar = True
      Size = 1
    end
    object cdsControleCreditosBolDATA_RETORNO_QUITACAO: TDateTimeField
      DisplayLabel = 'Data de quita'#231#227'o pelo arquivo de retorno'
      FieldName = 'DATA_RETORNO_QUITACAO'
    end
    object cdsControleCreditosBolTIP_BAIXA: TStringField
      DisplayLabel = 'Tipo de baixa'
      FieldName = 'TIP_BAIXA'
      FixedChar = True
      Size = 1
    end
    object cdsControleCreditosBolDATA_PREV_REC: TDateTimeField
      DisplayLabel = 'Data Prev Rec'
      FieldName = 'DATA_PREV_REC'
    end
    object cdsControleCreditosBolCOD_COBREBEM: TIntegerField
      DisplayLabel = 'Cod Cobrebem'
      FieldName = 'COD_COBREBEM'
    end
    object cdsControleCreditosBolCOD_EMP_MULT: TIntegerField
      DisplayLabel = 'Cod Unificada'
      FieldName = 'COD_EMP_MULT'
    end
    object cdsControleCreditosBolIDENTIFICACAO_EMP: TStringField
      DisplayLabel = 'Unificada'
      FieldName = 'IDENTIFICACAO_EMP'
      Size = 64
    end
  end
  object qrContBanc: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = dtmAtivo.IbTransCol
    SQL.Strings = (
      'select * from CONTROLES')
    Left = 669
    Top = 227
  end
  object dspContBanc: TDataSetProvider
    DataSet = qrContBanc
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 669
    Top = 272
  end
  object cdsContBanc: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspContBanc'
    BeforeOpen = cdsBoletosBeforeOpen
    Left = 669
    Top = 320
    object IntegerField40: TIntegerField
      FieldName = 'CODIGO_CTRL'
      Required = True
    end
    object StringField34: TStringField
      FieldName = 'NOME_CTRL'
      Size = 35
    end
    object StringField35: TStringField
      FieldName = 'N_BANCO_CTRL'
      FixedChar = True
      Size = 10
    end
    object IntegerField41: TIntegerField
      FieldName = 'COD_COBREBEM'
    end
  end
  object dsContBanc: TDataSource
    DataSet = cdsContBanc
    Left = 669
    Top = 376
  end
  object dsCobreBemBol: TDataSource
    DataSet = cdsCobreBemBol
    Left = 280
    Top = 176
  end
  object cdsCobreBemBol: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCobreBemBol'
    BeforeOpen = cdsBoletosBeforeOpen
    Left = 280
    Top = 120
    object IntegerField29: TIntegerField
      Tag = 2
      DisplayLabel = 'Cod Convenio'
      FieldName = 'COD_COBREBEM'
      Required = True
    end
    object IntegerField30: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object IntegerField31: TIntegerField
      DisplayLabel = 'Cod controle'
      FieldName = 'CODIGO_CTRL'
    end
    object StringField13: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object StringField14: TStringField
      Tag = 2
      DisplayLabel = 'Banco'
      FieldName = 'BANCO'
      FixedChar = True
      Size = 3
    end
    object cdsCobreBemBolTIPO_CONTA: TStringField
      FieldName = 'TIPO_CONTA'
      Size = 10
    end
    object StringField15: TStringField
      Tag = 2
      DisplayLabel = 'Cod agencia'
      DisplayWidth = 6
      FieldName = 'CODIGOAGENCIA'
    end
    object StringField16: TStringField
      Tag = 2
      DisplayLabel = 'Conta corrente'
      DisplayWidth = 10
      FieldName = 'NUMEROCONTACORRENTE'
    end
    object StringField17: TStringField
      Tag = 2
      DisplayLabel = 'Cod cedente'
      DisplayWidth = 6
      FieldName = 'CODIGOCEDENTE'
    end
    object cdsCobreBemBolCODIGOCONVENIO: TStringField
      DisplayLabel = 'Numero Convenio'
      FieldName = 'CODIGOCONVENIO'
    end
    object StringField18: TStringField
      DisplayLabel = 'Inicio nosso numero'
      DisplayWidth = 5
      FieldName = 'INICIONOSSONUMERO'
    end
    object StringField19: TStringField
      DisplayLabel = 'Fim nosso numero'
      DisplayWidth = 5
      FieldName = 'FIMNOSSONUMERO'
    end
    object StringField20: TStringField
      DisplayLabel = 'Proximo nosso numero'
      DisplayWidth = 20
      FieldName = 'PROXIMONOSSONUMERO'
    end
    object StringField21: TStringField
      DisplayLabel = 'Tipo documento'
      FieldName = 'TIPODOCUMENTOCOBRANCA'
      Size = 10
    end
    object StringField22: TStringField
      DisplayLabel = 'Controle bancario'
      FieldKind = fkLookup
      FieldName = 'NOME_CTRL'
      LookupDataSet = cdsControles
      LookupKeyFields = 'CODIGO_CTRL'
      LookupResultField = 'NOME_CTRL'
      KeyFields = 'CODIGO_CTRL'
      Size = 35
      Lookup = True
    end
    object StringField23: TStringField
      DisplayLabel = 'Layout arquivo remessa'
      FieldName = 'LAYOUTARQUIVOREMESSA'
    end
    object StringField24: TStringField
      DisplayLabel = 'Layout arquivo retorno'
      FieldName = 'LAYOUTARQUIVORETORNO'
    end
    object StringField25: TStringField
      DisplayLabel = 'Layout boleto impresso'
      FieldName = 'LAYOUTBOLETOIMPRESSO'
      Size = 30
    end
    object StringField26: TStringField
      DisplayLabel = 'Layout boleto email'
      FieldName = 'LAYOUTBOLETOSEMAIL'
      Size = 30
    end
    object MemoField1: TMemoField
      Tag = 1
      DisplayLabel = 'HTML boleto'
      FieldName = 'HTMLBOLETO'
      BlobType = ftMemo
      Size = 8
    end
    object MemoField2: TMemoField
      Tag = 1
      DisplayLabel = 'HTML boleto email'
      FieldName = 'HTMLBOLETOEMAIL'
      BlobType = ftMemo
      Size = 8
    end
    object StringField27: TStringField
      DisplayLabel = 'Dados configura'#231'ao 1'
      DisplayWidth = 3
      FieldName = 'OUTRODADOCONFIGURACAO1'
    end
    object StringField28: TStringField
      DisplayLabel = 'Dados configura'#231'ao 2'
      DisplayWidth = 10
      FieldName = 'OUTRODADOCONFIGURACAO2'
    end
    object StringField29: TStringField
      Tag = 2
      DisplayLabel = 'Arquivo licen'#231'a'
      FieldName = 'ARQUIVOLICENCA'
      Size = 128
    end
    object StringField30: TStringField
      DisplayLabel = 'Imagens cod barras'
      FieldName = 'IMAGENSBOLETO'
      Size = 128
    end
    object StringField31: TStringField
      DisplayLabel = 'Imagem logotipo'
      FieldName = 'IMAGENSLOGOTIPO'
      Size = 128
    end
    object StringField32: TStringField
      DisplayLabel = 'Identifica'#231'ao cedente'
      FieldName = 'IDENTIFICACAOCEDENTE'
      Size = 128
    end
    object StringField33: TStringField
      DisplayLabel = 'Identifa'#231'ao cedente 2'
      FieldName = 'IDENTIFICACAOCEDENTE1'
      Size = 128
    end
    object StringField36: TStringField
      DisplayLabel = 'End Remessa'
      FieldName = 'ENDERECOREMESSARETORNO'
      Size = 128
    end
    object StringField37: TStringField
      DisplayLabel = 'Email cedente'
      FieldName = 'EMAIL_ENDERECOCEDENTE'
      Size = 64
    end
    object StringField38: TStringField
      DisplayLabel = 'Email/URL img boleto'
      FieldName = 'EMAIL_URLIMAGENSBOLETO'
      Size = 256
    end
    object StringField39: TStringField
      DisplayLabel = 'Email/URL img logotipo'
      FieldName = 'EMAIL_URLIMAGENSLOGOTIPO'
      Size = 256
    end
    object StringField40: TStringField
      DisplayLabel = 'Email/SMTP servidor'
      FieldName = 'EMAIL_SMTP_SERVIDOR'
      Size = 128
    end
    object IntegerField32: TIntegerField
      DisplayLabel = 'Email/SMTP porta'
      FieldName = 'EMAIL_SMTP_PORTA'
    end
    object StringField41: TStringField
      DisplayLabel = 'Email/SMTP usuario'
      FieldName = 'EMAIL_SMTP_USUARIO'
      Size = 32
    end
    object StringField42: TStringField
      Tag = 1
      DisplayLabel = 'Email/SMTP senha'
      FieldName = 'EMAIL_SMTP_SENHA'
      Size = 32
    end
    object StringField43: TStringField
      DisplayLabel = 'Email assunto'
      FieldName = 'EMAIL_ASSUNTO'
      Size = 64
    end
    object IntegerField33: TIntegerField
      DisplayLabel = 'Sequencia remessa'
      FieldName = 'SEQUENCIA_REMESSA'
    end
    object SmallintField1: TSmallintField
      DisplayLabel = 'Qtde dig nosso numero'
      FieldName = 'QTDEDIGNOSSONUMERO'
    end
    object SmallintField2: TSmallintField
      DisplayLabel = 'Dias protesto'
      FieldName = 'DIASPROTESTO'
    end
    object IntegerField34: TIntegerField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
    object StringField44: TStringField
      DisplayLabel = 'Cod Baixa'
      FieldName = 'CODIGO_BAIXA'
    end
    object StringField45: TStringField
      DisplayLabel = 'Cod Recusa'
      FieldName = 'CODIGO_RECUSA'
    end
    object IntegerField35: TIntegerField
      DisplayLabel = 'Codigo Controle Entrada'
      FieldName = 'CODIGO_CTRL_ENT'
    end
    object StringField46: TStringField
      DisplayLabel = 'Tipo Impress'#227'o Remessa'
      FieldName = 'TIPOIMPRESSAO'
    end
    object StringField47: TStringField
      DisplayLabel = 'Banco Emite Boleto'
      FieldName = 'BANCOEMITEBOLETO'
      Size = 1
    end
    object SmallintField3: TSmallintField
      DisplayLabel = 'Margem Superior(Ajuste Impress'#227'o)'
      FieldName = 'MARGEMSUPERIOR'
    end
    object StringField48: TStringField
      DisplayLabel = 'Banco Gera Nosso Numero'
      FieldName = 'BANCOGERANOSSONUMERO'
      Size = 1
    end
    object StringField50: TStringField
      DisplayLabel = 'Observacao Boleto'
      FieldName = 'OBS_BOL'
      Size = 128
    end
    object StringField49: TStringField
      DisplayLabel = 'Local Pagamento'
      FieldName = 'LOCAL_PAG'
      Size = 128
    end
    object StringField51: TStringField
      DisplayLabel = 'Mensagem Boleto'
      FieldName = 'MENSAGEM_BOL'
      Size = 128
    end
    object cdsCobreBemBolMENSAGEM_ADC: TStringField
      DisplayLabel = 'Mensagem Adicional'
      FieldName = 'MENSAGEM_ADC'
      Size = 128
    end
    object cdsCobreBemBolMENSAGEM_DESC: TStringField
      DisplayLabel = 'Mensagem Desconto'
      FieldName = 'MENSAGEM_DESC'
      Size = 128
    end
    object cdsCobreBemBolPERMITE_PROTESTO: TStringField
      DisplayLabel = 'Permite Protesto'
      FieldName = 'PERMITE_PROTESTO'
      FixedChar = True
      Size = 1
    end
    object FloatField8: TFloatField
      DisplayLabel = 'Multas (%)'
      FieldName = 'MULTAS'
    end
    object FloatField7: TFloatField
      DisplayLabel = 'Taxa Juros (%)'
      FieldName = 'TX_JUROS'
    end
    object cdsCobreBemBolPERMITE_DESCONTO: TStringField
      DisplayLabel = 'Permite Desconto'
      FieldName = 'PERMITE_DESCONTO'
      Size = 1
    end
    object cdsCobreBemBolPERC_DESC: TFloatField
      DisplayLabel = 'Desconto (%)'
      FieldName = 'PERC_DESC'
    end
    object cdsCobreBemBolQTD_DIAS_LIM_DESC: TIntegerField
      DisplayLabel = 'Dias Limite de Desconto'
      FieldName = 'QTD_DIAS_LIM_DESC'
    end
    object cdsCobreBemBolNUMPARC_CODBARRAS: TStringField
      DisplayLabel = 'Num Parc'
      FieldName = 'NUMPARC_CODBARRAS'
      FixedChar = True
      Size = 1
    end
    object cdsCobreBemBolDESCONS_DIGVERIF: TStringField
      DisplayLabel = 'Desconsiderar Digito Verificador'
      FieldName = 'DESCONS_DIGVERIF'
      FixedChar = True
      Size = 1
    end
    object cdsCobreBemBolCOD_EMP_MULT: TIntegerField
      DisplayLabel = 'Cod Unificada'
      FieldName = 'COD_EMP_MULT'
    end
    object cdsCobreBemBolINSTRUCAO_COBRANCA3: TStringField
      DisplayLabel = 'Instrucao Cob 3'
      FieldName = 'INSTRUCAO_COBRANCA3'
      FixedChar = True
      Size = 1
    end
    object cdsCobreBemBolTIPO_COBRANCA: TIntegerField
      Tag = 1
      DisplayLabel = 'Tipo Cobranca'
      FieldName = 'TIPO_COBRANCA'
      Visible = False
    end
    object cdsCobreBemBolCORR_REMESSA: TStringField
      DisplayLabel = 'Corrigir remessa'
      FieldName = 'CORR_REMESSA'
      FixedChar = True
      Size = 1
    end
    object cdsCobreBemBolGERAR_REGISTRO_MULTA: TStringField
      DisplayLabel = 'Gerar Registro Multa'
      FieldName = 'GERAR_REGISTRO_MULTA'
      FixedChar = True
      Size = 1
    end
    object cdsCobreBemBolOUTRAS_CONFIG_BOL: TMemoField
      DisplayLabel = 'Outras Config'
      FieldName = 'OUTRAS_CONFIG_BOL'
      BlobType = ftMemo
      Size = 8
    end
    object cdsCobreBemBolLICENCA_GENERICA: TStringField
      DisplayLabel = 'Licenca Generica'
      FieldName = 'LICENCA_GENERICA'
      FixedChar = True
      Size = 1
    end
    object cdsCobreBemBolNOME_EMP_GENERICO: TStringField
      DisplayLabel = 'Nome Cedente'
      FieldName = 'NOME_EMP_GENERICO'
      Size = 50
    end
    object cdsCobreBemBolCPF_CNPJ_GENERICO: TStringField
      DisplayLabel = 'CPF/CNPJ'
      FieldName = 'CPF_CNPJ_GENERICO'
      Size = 18
    end
    object cdsCobreBemBolTAM_NOME_CEDENTE_GENERICO: TIntegerField
      DisplayLabel = 'Tamanho Cedente'
      FieldName = 'TAM_NOME_CEDENTE_GENERICO'
    end
    object cdsCobreBemBolLICENCA: TMemoField
      Tag = 1
      DisplayLabel = 'Licenca'
      FieldName = 'LICENCA'
      BlobType = ftMemo
      Size = 8
    end
    object cdsCobreBemBolLOGOTIPO: TBlobField
      Tag = 1
      DisplayLabel = 'Logotipo'
      FieldName = 'LOGOTIPO'
      Size = 8
    end
    object cdsCobreBemBolLOGOBANCO: TBlobField
      Tag = 1
      DisplayLabel = 'Logobanco'
      FieldName = 'LOGOBANCO'
      Size = 8
    end
    object cdsCobreBemBolCODBARRAS_A: TMemoField
      Tag = 1
      DisplayLabel = 'CodBarras A'
      FieldName = 'CODBARRAS_A'
      BlobType = ftMemo
      Size = 8
    end
    object cdsCobreBemBolCODBARRAS_B: TMemoField
      Tag = 1
      DisplayLabel = 'CodBarras B'
      FieldName = 'CODBARRAS_B'
      BlobType = ftMemo
      Size = 8
    end
    object cdsCobreBemBolCODBARRAS_C: TMemoField
      Tag = 1
      DisplayLabel = 'CodBarras C'
      FieldName = 'CODBARRAS_C'
      BlobType = ftMemo
      Size = 8
    end
    object cdsCobreBemBolCODBARRAS_D: TMemoField
      Tag = 1
      DisplayLabel = 'CodBarras D'
      FieldName = 'CODBARRAS_D'
      BlobType = ftMemo
      Size = 8
    end
    object cdsCobreBemBolTIPO_API: TStringField
      DisplayLabel = 'Tipo API'
      FieldName = 'TIPO_API'
      FixedChar = True
      Size = 1
    end
    object cdsCobreBemBolAMBIENTE: TStringField
      DisplayLabel = 'Ambiente'
      FieldName = 'AMBIENTE'
      Size = 16
    end
    object cdsCobreBemBolTITULOCODIGOJUROS: TStringField
      FieldName = 'TITULOCODIGOJUROS'
      FixedChar = True
      Size = 1
    end
    object cdsCobreBemBolTITULOCODIGOMULTA: TStringField
      FieldName = 'TITULOCODIGOMULTA'
      FixedChar = True
      Size = 1
    end
    object cdsCobreBemBolTITULOCODIGOPROTESTO: TStringField
      DisplayLabel = 'Titulo Codigo Protesto'
      FieldName = 'TITULOCODIGOPROTESTO'
      FixedChar = True
      Size = 1
    end
    object cdsCobreBemBolTESTAR_HTML: TStringField
      FieldName = 'TESTAR_HTML'
      FixedChar = True
      Size = 1
    end
    object cdsCobreBemBolQRCODE_PIX: TStringField
      FieldName = 'QRCODE_PIX'
      FixedChar = True
      Size = 1
    end
    object cdsCobreBemBolCAMINHO_CERT: TStringField
      FieldName = 'CAMINHO_CERT'
      Size = 256
    end
    object cdsCobreBemBolSENHA_CERT: TStringField
      FieldName = 'SENHA_CERT'
      Size = 30
    end
    object cdsCobreBemBolDATA_VENC_CERT: TDateTimeField
      FieldName = 'DATA_VENC_CERT'
    end
  end
  object dspCobreBemBol: TDataSetProvider
    DataSet = qrCobreBemBol
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 280
    Top = 72
  end
  object qrCobreBemBol: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransBoletos
    SQL.Strings = (
      'select * from COBREBEM')
    Left = 280
    Top = 24
  end
  object qrBoletosProtesto: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransBoletos
    SQL.Strings = (
      
        'select b.cod_cliente, c.nome_cliente, c.razao,c.cpfcgc, b.num_nf' +
        '_vnd, b.data_em_bol, b.n_doc_bol,'
      
        'b.data_ven_bol, b.vl_doc_bol, co.nome_ctrl, b.nosso_numero_banco' +
        ', b.data_remessa, b.cod_carga,'
      
        '(b.data_ven_bol + b.dias_protesto) data_protesto, b.status, b.n_' +
        'seq_bol from boletas b'
      
        'left join clientes c on c.cod_cliente = b.cod_cliente and c.cod_' +
        'empresa = b.cod_empresa'
      
        'left join controles co on co.codigo_ctrl = b.cod_controle_cx and' +
        ' co.codigo_emp = b.cod_empresa'
      'where b.n_seq_bol  = 0 and b.cod_empresa = 0')
    Left = 757
    Top = 227
  end
  object dspBoletosProtesto: TDataSetProvider
    DataSet = qrBoletosProtesto
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 757
    Top = 272
  end
  object cdsBoletosProtesto: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspBoletosProtesto'
    BeforeOpen = cdsBoletosBeforeOpen
    Left = 757
    Top = 320
    object cdsBoletosProtestoDATA_PROTESTO: TDateTimeField
      DisplayLabel = 'Data Protesto'
      FieldName = 'DATA_PROTESTO'
    end
    object cdsBoletosProtestoNOME_CTRL: TStringField
      DisplayLabel = 'Controle'
      FieldName = 'NOME_CTRL'
      Size = 35
    end
    object cdsBoletosProtestoN_DOC_BOL: TStringField
      DisplayLabel = 'Num Documento'
      FieldName = 'N_DOC_BOL'
      Size = 10
    end
    object cdsBoletosProtestoVL_DOC_BOL: TFloatField
      DisplayLabel = 'Valor Liquido'
      FieldName = 'VL_DOC_BOL'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '###,###,##0.00'
    end
    object cdsBoletosProtestoCOD_CLIENTE: TIntegerField
      DisplayLabel = 'Cod Cliente'
      FieldName = 'COD_CLIENTE'
    end
    object cdsBoletosProtestoNOME_CLIENTE: TStringField
      DisplayLabel = 'Nome Fantasia'
      FieldName = 'NOME_CLIENTE'
      FixedChar = True
      Size = 35
    end
    object cdsBoletosProtestoRAZAO: TStringField
      DisplayLabel = 'Razao Social'
      FieldName = 'RAZAO'
      Size = 60
    end
    object cdsBoletosProtestoCPFCGC: TStringField
      DisplayLabel = 'CPF / CNPJ'
      FieldName = 'CPFCGC'
      Size = 18
    end
    object cdsBoletosProtestoNOSSO_NUMERO_BANCO: TStringField
      DisplayLabel = 'Nosso Numero'
      FieldName = 'NOSSO_NUMERO_BANCO'
    end
    object cdsBoletosProtestoDATA_REMESSA: TDateTimeField
      DisplayLabel = 'Data Remessa'
      FieldName = 'DATA_REMESSA'
    end
    object cdsBoletosProtestoDATA_EM_BOL: TDateTimeField
      DisplayLabel = 'Data Emissao'
      FieldName = 'DATA_EM_BOL'
    end
    object cdsBoletosProtestoDATA_VEN_BOL: TDateTimeField
      DisplayLabel = 'Data Vencimento'
      FieldName = 'DATA_VEN_BOL'
    end
    object cdsBoletosProtestoNUM_NF_VND: TIntegerField
      DisplayLabel = 'Num NF'
      FieldName = 'NUM_NF_VND'
    end
    object cdsBoletosProtestoCOD_CARGA: TIntegerField
      DisplayLabel = 'Cod Carga'
      FieldName = 'COD_CARGA'
    end
    object cdsBoletosProtestoSTATUS: TStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      Visible = False
    end
    object cdsBoletosProtestoN_SEQ_BOL: TIntegerField
      DisplayLabel = 'Num Seq Boleto'
      FieldName = 'N_SEQ_BOL'
      Required = True
      Visible = False
    end
  end
  object dsBoletosProtesto: TDataSource
    DataSet = cdsBoletosProtesto
    Left = 757
    Top = 376
  end
  object qrEmpresasUnificadas: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = dtmAtivo.IbTransCol
    SQL.Strings = (
      
        'select emp.cod_empresa, (emp.identificacao_emp ||'#39' - '#39'|| emp.cnp' +
        'j_emp) identificacao_emp from empresa emp'
      'where emp.cod_empresa in (1)')
    Left = 957
    Top = 16
  end
  object dspEmpresasUnificadas: TDataSetProvider
    DataSet = qrEmpresasUnificadas
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 957
    Top = 67
  end
  object cdsEmpresasUnificadas: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspEmpresasUnificadas'
    BeforeOpen = cdsBoletosBeforeOpen
    Left = 957
    Top = 115
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
    Left = 957
    Top = 171
  end
  object qrArquivosBoleto: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransBoletos
    SQL.Strings = (
      
        'SELECT ARQ_BOLETO.*, COBREBEM.BANCO, COBREBEM.CODIGOAGENCIA, COB' +
        'REBEM.NUMEROCONTACORRENTE, COBREBEM.CODIGOCEDENTE, COBREBEM.DESC' +
        'RICAO FROM ARQ_BOLETO'
      
        'LEFT JOIN COBREBEM ON COBREBEM.COD_COBREBEM = ARQ_BOLETO.COD_COB' +
        'REBEM AND COBREBEM.COD_EMPRESA = ARQ_BOLETO.COD_EMPRESA'
      'WHERE ARQ_BOLETO.COD_EMPRESA = 1')
    Left = 861
    Top = 227
  end
  object dspArquivosBoleto: TDataSetProvider
    DataSet = qrArquivosBoleto
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 861
    Top = 272
  end
  object cdsArquivosBoleto: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspArquivosBoleto'
    BeforeOpen = cdsBoletosBeforeOpen
    Left = 861
    Top = 320
    object cdsArquivosBoletoSEQID: TLargeintField
      Tag = 1
      DisplayLabel = 'Seqid'
      FieldName = 'SEQID'
      Required = True
    end
    object cdsArquivosBoletoCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsArquivosBoletoTIPO: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Required = True
      Size = 10
    end
    object cdsArquivosBoletoDESCRICAO_ARQ: TStringField
      DisplayLabel = 'Arquivo'
      FieldName = 'DESCRICAO_ARQ'
      Required = True
      Size = 50
    end
    object cdsArquivosBoletoCOD_COBREBEM: TIntegerField
      DisplayLabel = 'Cod Convenio'
      FieldName = 'COD_COBREBEM'
      Required = True
    end
    object cdsArquivosBoletoDESCRICAO: TStringField
      DisplayLabel = 'Convenio'
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object cdsArquivosBoletoBANCO: TStringField
      DisplayLabel = 'Banco'
      FieldName = 'BANCO'
      FixedChar = True
      Size = 3
    end
    object cdsArquivosBoletoCODIGOAGENCIA: TStringField
      DisplayLabel = 'Cod agencia'
      FieldName = 'CODIGOAGENCIA'
    end
    object cdsArquivosBoletoNUMEROCONTACORRENTE: TStringField
      DisplayLabel = 'Conta corrente'
      FieldName = 'NUMEROCONTACORRENTE'
    end
    object cdsArquivosBoletoCODIGOCEDENTE: TStringField
      DisplayLabel = 'Cod cedente'
      FieldName = 'CODIGOCEDENTE'
    end
    object cdsArquivosBoletoDATA_HORA: TDateTimeField
      DisplayLabel = 'Data/Hora'
      FieldName = 'DATA_HORA'
    end
    object cdsArquivosBoletoDOC: TMemoField
      DisplayLabel = 'Dados'
      FieldName = 'DOC'
      OnGetText = cdsArquivosBoletoDOCGetText
      BlobType = ftMemo
      Size = 8
    end
  end
  object dsArquivosBoleto: TDataSource
    DataSet = cdsArquivosBoleto
    Left = 861
    Top = 376
  end
  object qrBancosHomologados: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = dtmAtivo.IbTransCol
    SQL.Strings = (
      'select * from bancos_homologados where ativo = 1')
    Left = 981
    Top = 224
  end
  object dspBancosHomologados: TDataSetProvider
    DataSet = qrBancosHomologados
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 981
    Top = 275
  end
  object cdsBancosHomologados: TClientDataSet
    Tag = 1
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspBancosHomologados'
    BeforeOpen = cdsBoletosBeforeOpen
    Left = 981
    Top = 323
    object cdsBancosHomologadosSEQID: TLargeintField
      FieldName = 'SEQID'
      Required = True
    end
    object cdsBancosHomologadosCODBANCO: TStringField
      FieldName = 'CODBANCO'
      FixedChar = True
      Size = 3
    end
    object cdsBancosHomologadosDESCRBANCO: TStringField
      FieldName = 'DESCRBANCO'
      Size = 100
    end
    object cdsBancosHomologadosLAYOUT240: TStringField
      FieldName = 'LAYOUT240'
      FixedChar = True
      Size = 1
    end
    object cdsBancosHomologadosLAYOUT400: TStringField
      FieldName = 'LAYOUT400'
      FixedChar = True
      Size = 1
    end
    object cdsBancosHomologadosAUTOMATICA: TStringField
      FieldName = 'AUTOMATICA'
      FixedChar = True
      Size = 1
    end
    object cdsBancosHomologadosREGISTROWS: TStringField
      FieldName = 'REGISTROWS'
      FixedChar = True
      Size = 1
    end
    object cdsBancosHomologadosCONSULTAWS: TStringField
      FieldName = 'CONSULTAWS'
      FixedChar = True
      Size = 1
    end
    object cdsBancosHomologadosVALIDADOR: TStringField
      FieldName = 'VALIDADOR'
      FixedChar = True
      Size = 1
    end
    object cdsBancosHomologadosMENSAGEM: TMemoField
      FieldName = 'MENSAGEM'
      BlobType = ftMemo
      Size = 8
    end
    object cdsBancosHomologadosATIVO: TIntegerField
      FieldName = 'ATIVO'
    end
  end
  object dsBancosHomologados: TDataSource
    DataSet = cdsBancosHomologados
    Left = 981
    Top = 379
  end
  object qrConfEmail: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransBoletos
    Left = 583
    Top = 320
  end
end
