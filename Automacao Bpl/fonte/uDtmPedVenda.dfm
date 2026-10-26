object DtmPedVenda: TDtmPedVenda
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 852
  Width = 1731
  object IBTransPedVenda: TIBTransaction
    DefaultDatabase = dtmAtivo.bancoHw
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 32
    Top = 1
  end
  object dsPedVenda: TDataSource
    AutoEdit = False
    DataSet = cdsPedVenda
    Left = 20
    Top = 172
  end
  object dspPedVenda: TDataSetProvider
    DataSet = qrPedVenda
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 20
    Top = 88
  end
  object cdsPedVenda: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspPedVenda'
    BeforeOpen = cdsPedVendaBeforeOpen
    Left = 20
    Top = 130
    object cdsPedVendaNPED: TIntegerField
      Tag = 2
      DisplayLabel = 'Num do Pedido'
      FieldName = 'NPED'
      Origin = '"PEDVENDA"."NPED"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsPedVendaNPREVENDA: TIntegerField
      Tag = 2
      DisplayLabel = 'Num DAV'
      FieldName = 'NPREVENDA'
      Origin = '"PEDVENDA"."NPREVENDA"'
    end
    object cdsPedVendaTIPO: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Origin = '"PEDVENDA"."TIPO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 3
    end
    object cdsPedVendaDATA_PED: TDateTimeField
      DisplayLabel = 'Data pedido'
      FieldName = 'DATA_PED'
      Origin = '"PEDVENDA"."DATA_PED"'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsPedVendaDATA_FECH: TDateTimeField
      DisplayLabel = 'Data fechamento'
      FieldName = 'DATA_FECH'
      Origin = '"PEDVENDA"."DATA_FECH"'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsPedVendaVALOR_TOTAL: TFloatField
      DisplayLabel = 'Valor Total'
      FieldName = 'VALOR_TOTAL'
      Origin = '"PEDVENDA"."VALOR_TOTAL"'
      currency = True
    end
    object cdsPedVendaSTATUS_PED: TStringField
      Tag = 2
      DisplayLabel = 'Status Pedido'
      FieldName = 'STATUS_PED'
      Origin = '"PEDVENDA"."STATUS_PED"'
      Size = 10
    end
    object cdsPedVendaDESC_P_PROD: TFloatField
      DisplayLabel = '% Desc nos Produtos'
      FieldName = 'DESC_P_PROD'
      Origin = '"PEDVENDA"."DESC_P_PROD"'
      EditFormat = '0.00'
    end
    object cdsPedVendaDESC_P_SERV: TFloatField
      DisplayLabel = '% Desc nos Servi'#231'os'
      FieldName = 'DESC_P_SERV'
      Origin = '"PEDVENDA"."DESC_P_SERV"'
    end
    object cdsPedVendaACRESC_P_PROD: TFloatField
      DisplayLabel = '% Acresc nos Produtos'
      FieldName = 'ACRESC_P_PROD'
      Origin = '"PEDVENDA"."ACRESC_P_PROD"'
    end
    object cdsPedVendaACRESC_P_SERV: TFloatField
      DisplayLabel = '% Acresc nos Servi'#231'os'
      FieldName = 'ACRESC_P_SERV'
      Origin = '"PEDVENDA"."ACRESC_P_SERV"'
    end
    object cdsPedVendaTOT_PROD: TFloatField
      DisplayLabel = 'Total Produtos OS'
      FieldName = 'TOT_PROD'
      Origin = '"PEDVENDA"."TOT_PROD"'
      currency = True
    end
    object cdsPedVendaTOT_SERV: TFloatField
      DisplayLabel = 'Total Servi'#231'os OS'
      FieldName = 'TOT_SERV'
      Origin = '"PEDVENDA"."TOT_SERV"'
      currency = True
    end
    object cdsPedVendaTOT_PROD_TERC: TFloatField
      DisplayLabel = 'Total Produtos Terc'
      FieldName = 'TOT_PROD_TERC'
      currency = True
    end
    object cdsPedVendaTOT_SERV_TERC: TFloatField
      DisplayLabel = 'Total Servi'#231'os Terc'
      FieldName = 'TOT_SERV_TERC'
      currency = True
    end
    object cdsPedVendaCCF_CUPOM: TIntegerField
      DisplayLabel = 'CCF Cupom'
      FieldName = 'CCF_CUPOM'
    end
    object cdsPedVendaNCUPOM: TIntegerField
      DisplayLabel = 'COO Cupom'
      FieldName = 'NCUPOM'
      Origin = '"PEDVENDA"."NCUPOM"'
    end
    object cdsPedVendaNSERIEECF: TStringField
      DisplayLabel = 'Num Serie ECF'
      FieldName = 'NSERIEECF'
      Origin = '"PEDVENDA"."NSERIEECF"'
    end
    object cdsPedVendaOPERADOR: TIntegerField
      DisplayLabel = 'PDV'
      FieldName = 'OPERADOR'
      Origin = '"PEDVENDA"."OPERADOR"'
    end
    object cdsPedVendaDESCONTO: TFloatField
      DisplayLabel = 'Valor Desconto'
      FieldName = 'DESCONTO'
      Origin = '"PEDVENDA"."DESCONTO"'
      currency = True
    end
    object cdsPedVendaPLACA: TStringField
      DisplayLabel = 'Placa'
      FieldName = 'PLACA'
      Origin = '"PEDVENDA"."PLACA"'
      Size = 10
    end
    object cdsPedVendaCHASSI: TStringField
      DisplayLabel = 'Chassi'
      FieldName = 'CHASSI'
      Origin = '"PEDVENDA"."CHASSI"'
      Size = 17
    end
    object cdsPedVendaTIPV: TStringField
      DisplayLabel = 'Tipo de Venda'
      FieldName = 'TIPV'
      Origin = '"PEDVENDA"."TIPV"'
      FixedChar = True
      Size = 1
    end
    object cdsPedVendaTIPO_OS: TStringField
      DisplayLabel = 'Tipo da OS'
      FieldName = 'TIPO_OS'
      Origin = '"PEDVENDA"."TIPO_OS"'
      Size = 40
    end
    object cdsPedVendaCOD_EQUIP: TIntegerField
      DisplayLabel = 'Cod Equipamento'
      FieldName = 'COD_EQUIP'
      Origin = '"PEDVENDA"."COD_EQUIP"'
    end
    object cdsPedVendaCOD_VEICULO: TIntegerField
      DisplayLabel = 'Cod Veiculo'
      FieldName = 'COD_VEICULO'
    end
    object cdsPedVendaAPARELHO_PED: TStringField
      DisplayLabel = 'Descri'#231#227'o do Aparelho'
      FieldName = 'APARELHO_PED'
      Origin = '"PEDVENDA"."APARELHO_PED"'
      Size = 128
    end
    object cdsPedVendaN_MOV_CXL: TIntegerField
      DisplayLabel = 'Num Movimento CXL'
      FieldName = 'N_MOV_CXL'
      Origin = '"PEDVENDA"."N_MOV_CXL"'
    end
    object cdsPedVendaDIA_CXL: TDateTimeField
      DisplayLabel = 'Dia Movimento CXL'
      FieldName = 'DIA_CXL'
      Origin = '"PEDVENDA"."DIA_CXL"'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsPedVendaDATVENC: TDateTimeField
      DisplayLabel = '1'#186' Vencimento da Venda'
      FieldName = 'DATVENC'
      Origin = '"PEDVENDA"."DATVENC"'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsPedVendaOBS_PED: TStringField
      DisplayLabel = 'Obs Pedido'
      FieldName = 'OBS_PED'
      Origin = '"PEDVENDA"."OBS_PED"'
      Size = 130
    end
    object cdsPedVendaOBS_CXL_RQ: TStringField
      DisplayLabel = 'Obs do Vendedor'
      FieldName = 'OBS_CXL_RQ'
      Origin = '"PEDVENDA"."OBS_CXL_RQ"'
      Size = 50
    end
    object cdsPedVendaSTATUS_CXL_RQ: TStringField
      DisplayLabel = 'Recebida pelo CXL'
      FieldName = 'STATUS_CXL_RQ'
      Origin = '"PEDVENDA"."STATUS_CXL_RQ"'
      FixedChar = True
      Size = 1
    end
    object cdsPedVendaVL_PAGO_CXL: TFloatField
      DisplayLabel = 'Valor Rec no CXL'
      FieldName = 'VL_PAGO_CXL'
      Origin = '"PEDVENDA"."VL_PAGO_CXL"'
      currency = True
    end
    object cdsPedVendaSELEC: TStringField
      DisplayLabel = 'Sele'#231#227'o'
      FieldName = 'SELEC'
      Origin = '"PEDVENDA"."SELEC"'
      FixedChar = True
      Size = 1
    end
    object cdsPedVendaTIPOR: TStringField
      DisplayLabel = 'Origem'
      FieldName = 'TIPOR'
      Origin = '"PEDVENDA"."TIPOR"'
      FixedChar = True
      Size = 1
    end
    object cdsPedVendaHORAABERTURA: TIntegerField
      DisplayLabel = 'Hs Abertura Pedido'
      FieldName = 'HORAABERTURA'
      Origin = '"PEDVENDA"."HORAABERTURA"'
    end
    object cdsPedVendaMINABERTURA: TIntegerField
      DisplayLabel = 'Min Abertura Pedido'
      FieldName = 'MINABERTURA'
      Origin = '"PEDVENDA"."MINABERTURA"'
    end
    object cdsPedVendaHORAFECHAMENTO: TIntegerField
      DisplayLabel = 'Hs Fechamento Pedido'
      FieldName = 'HORAFECHAMENTO'
      Origin = '"PEDVENDA"."HORAFECHAMENTO"'
    end
    object cdsPedVendaMINFECHAMENTO: TIntegerField
      DisplayLabel = 'Min Fechamento Pedido'
      FieldName = 'MINFECHAMENTO'
      Origin = '"PEDVENDA"."MINFECHAMENTO"'
    end
    object cdsPedVendaHORASUBTOTAL: TIntegerField
      DisplayLabel = 'Hora Subtotal'
      FieldName = 'HORASUBTOTAL'
      Origin = '"PEDVENDA"."HORASUBTOTAL"'
    end
    object cdsPedVendaMINSUBTOTAL: TIntegerField
      DisplayLabel = 'Min Subtotal'
      FieldName = 'MINSUBTOTAL'
      Origin = '"PEDVENDA"."MINSUBTOTAL"'
    end
    object cdsPedVendaDA: TStringField
      FieldName = 'DA'
      Origin = '"PEDVENDA"."DA"'
      FixedChar = True
      Size = 1
    end
    object cdsPedVendaNOME_RECEB: TStringField
      DisplayLabel = 'Recebedor'
      FieldName = 'NOME_RECEB'
      Origin = '"PEDVENDA"."NOME_RECEB"'
      Size = 40
    end
    object cdsPedVendaEND_RECEB: TStringField
      DisplayLabel = 'End Recebedor'
      FieldName = 'END_RECEB'
      Origin = '"PEDVENDA"."END_RECEB"'
      Size = 35
    end
    object cdsPedVendaBAIRRO_RECEB: TStringField
      DisplayLabel = 'Bairro Recebedor'
      FieldName = 'BAIRRO_RECEB'
      Origin = '"PEDVENDA"."BAIRRO_RECEB"'
    end
    object cdsPedVendaCIDA_RECEB: TStringField
      DisplayLabel = 'Cidade Recebedor'
      FieldName = 'CIDA_RECEB'
      Origin = '"PEDVENDA"."CIDA_RECEB"'
      Size = 15
    end
    object cdsPedVendaCEP_RECEB: TStringField
      DisplayLabel = 'CEP Recebedor'
      FieldName = 'CEP_RECEB'
      Origin = '"PEDVENDA"."CEP_RECEB"'
      EditMask = '00000\-999;0;'
      FixedChar = True
      Size = 8
    end
    object cdsPedVendaFONE_RECEB: TStringField
      DisplayLabel = 'Fone Recebedor'
      FieldName = 'FONE_RECEB'
      Origin = '"PEDVENDA"."FONE_RECEB"'
      EditMask = '(99) 9999-9999;0;_'
      Size = 14
    end
    object cdsPedVendaOBS_MINUTA: TMemoField
      DisplayLabel = 'Obs Minuta'
      FieldName = 'OBS_MINUTA'
      Origin = '"PEDVENDA"."OBS_MINUTA"'
      ProviderFlags = [pfInUpdate]
      OnGetText = cdsPedVendaOBS_MINUTAGetText
      BlobType = ftMemo
      Size = 8
    end
    object cdsPedVendaGRUPO_PROD: TIntegerField
      DisplayLabel = 'Grupo do Produto'
      FieldName = 'GRUPO_PROD'
      Origin = '"PEDVENDA"."GRUPO_PROD"'
    end
    object cdsPedVendaCOD_PROD: TStringField
      DisplayLabel = 'C'#243'digo Produto'
      FieldName = 'COD_PROD'
      Origin = '"PEDVENDA"."COD_PROD"'
      FixedChar = True
      Size = 6
    end
    object cdsPedVendaOP_CXL: TIntegerField
      DisplayLabel = 'Operador CXL'
      FieldName = 'OP_CXL'
      Origin = '"PEDVENDA"."OP_CXL"'
    end
    object cdsPedVendaCPFCGC: TStringField
      DisplayLabel = 'CPF ou CNPJ'
      FieldName = 'CPFCGC'
      FixedChar = True
      Size = 18
    end
    object cdsPedVendaCOD_CIDADE_RECEB: TSmallintField
      DisplayLabel = 'Cod Cidade Recebedor'
      FieldName = 'COD_CIDADE_RECEB'
      Origin = '"PEDVENDA"."COD_CIDADE_RECEB"'
    end
    object cdsPedVendaCOD_BAIRRO_RECEB: TSmallintField
      DisplayLabel = 'Cod Bairro Recebedor'
      FieldName = 'COD_BAIRRO_RECEB'
      Origin = '"PEDVENDA"."COD_BAIRRO_RECEB"'
    end
    object cdsPedVendaVL_ENTRADA: TFloatField
      DisplayLabel = 'Valor da Entrada'
      FieldName = 'VL_ENTRADA'
      Origin = '"PEDVENDA"."VL_ENTRADA"'
      currency = True
    end
    object cdsPedVendaCODIGO_CTRL: TIntegerField
      DisplayLabel = 'Cod Controle'
      FieldName = 'CODIGO_CTRL'
      Origin = '"PEDVENDA"."CODIGO_CTRL"'
    end
    object cdsPedVendaSTAT_REQ: TStringField
      DisplayLabel = 'Status Almox '
      FieldName = 'STAT_REQ'
      Origin = '"PEDVENDA"."STAT_REQ"'
      FixedChar = True
      Size = 1
    end
    object cdsPedVendaACRESCIMO: TFloatField
      DisplayLabel = 'Valor do Acr'#233'scimo'
      FieldName = 'ACRESCIMO'
      Origin = '"PEDVENDA"."ACRESCIMO"'
      currency = True
    end
    object cdsPedVendaKM_V: TIntegerField
      DisplayLabel = 'Quilometragem'
      FieldName = 'KM_V'
      Origin = '"PEDVENDA"."KM_V"'
    end
    object cdsPedVendaORC_PROD: TIntegerField
      Tag = 1
      FieldName = 'ORC_PROD'
      Origin = '"PEDVENDA"."ORC_PROD"'
    end
    object cdsPedVendaDT_PROMETIDA: TDateTimeField
      DisplayLabel = 'Data Prometida'
      FieldName = 'DT_PROMETIDA'
      Origin = '"PEDVENDA"."DT_PROMETIDA"'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsPedVendaOBS_OS: TMemoField
      DisplayLabel = 'Obs da OS'
      FieldName = 'OBS_OS'
      Origin = '"PEDVENDA"."OBS_OS"'
      ProviderFlags = [pfInUpdate]
      OnGetText = cdsPedVendaOBS_OSGetText
      BlobType = ftMemo
      Size = 8
    end
    object cdsPedVendaGUARDA_VOL: TStringField
      DisplayLabel = 'Guarda Volume'
      FieldName = 'GUARDA_VOL'
      Origin = '"PEDVENDA"."GUARDA_VOL"'
      Size = 10
    end
    object cdsPedVendaCOMBUST_VEIC: TStringField
      DisplayLabel = 'Qtd Combust'#237'vel'
      FieldName = 'COMBUST_VEIC'
      Origin = '"PEDVENDA"."COMBUST_VEIC"'
      FixedChar = True
      Size = 3
    end
    object cdsPedVendaDEFEITO: TMemoField
      DisplayLabel = 'Defeito'
      FieldName = 'DEFEITO'
      Origin = '"PEDVENDA"."DEFEITO"'
      ProviderFlags = [pfInUpdate]
      OnGetText = cdsPedVendaDEFEITOGetText
      BlobType = ftMemo
      Size = 8
    end
    object cdsPedVendaESTADO_VEIC: TMemoField
      DisplayLabel = 'Estado do Ve'#237'culo'
      FieldName = 'ESTADO_VEIC'
      Origin = '"PEDVENDA"."ESTADO_VEIC"'
      ProviderFlags = [pfInUpdate]
      OnGetText = cdsPedVendaESTADO_VEICGetText
      BlobType = ftMemo
      Size = 8
    end
    object cdsPedVendaACESSORIOS: TMemoField
      DisplayLabel = 'Acess'#243'rios'
      FieldName = 'ACESSORIOS'
      Origin = '"PEDVENDA"."ACESSORIOS"'
      ProviderFlags = [pfInUpdate]
      OnGetText = cdsPedVendaACESSORIOSGetText
      BlobType = ftMemo
      Size = 8
    end
    object cdsPedVendaH_ENT: TDateTimeField
      DisplayLabel = 'Hs da Entrada'
      FieldName = 'H_ENT'
      Origin = '"PEDVENDA"."H_ENT"'
      EditMask = '!99/99/0000 00:00:00;1;_'
    end
    object cdsPedVendaH_PROMETIDA: TDateTimeField
      DisplayLabel = 'Hs Prometida'
      FieldName = 'H_PROMETIDA'
      Origin = '"PEDVENDA"."H_PROMETIDA"'
      EditMask = '!99/99/0000 00:00:00;1;_'
    end
    object cdsPedVendaDATA_NF: TDateTimeField
      DisplayLabel = 'Data da NF'
      FieldName = 'DATA_NF'
      Origin = '"PEDVENDA"."DATA_NF"'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsPedVendaDT_NFGARANTIA: TDateTimeField
      DisplayLabel = 'Fim da Garantia'
      FieldName = 'DT_NFGARANTIA'
      Origin = '"PEDVENDA"."DT_NFGARANTIA"'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsPedVendaTP_ABORD: TStringField
      DisplayLabel = 'Abordagem ao Cliente'
      FieldName = 'TP_ABORD'
      Origin = '"PEDVENDA"."TP_ABORD"'
      FixedChar = True
      Size = 3
    end
    object cdsPedVendaFR_PAGBOSCH: TStringField
      DisplayLabel = 'Pag Linha Bosch'
      FieldName = 'FR_PAGBOSCH'
      Origin = '"PEDVENDA"."FR_PAGBOSCH"'
      FixedChar = True
      Size = 3
    end
    object cdsPedVendaSEQ_FECH: TIntegerField
      DisplayLabel = 'Sequ'#234'ncia de Fechamento'
      FieldName = 'SEQ_FECH'
      Origin = '"PEDVENDA"."SEQ_FECH"'
    end
    object cdsPedVendaEM_NF: TStringField
      DisplayLabel = 'Marca OS Livro'
      FieldName = 'EM_NF'
      Origin = '"PEDVENDA"."EM_NF"'
      FixedChar = True
      Size = 1
    end
    object cdsPedVendaN_SERIE: TStringField
      DisplayLabel = 'Num S'#233'rie'
      FieldName = 'N_SERIE'
      Origin = '"PEDVENDA"."N_SERIE"'
      Size = 32
    end
    object cdsPedVendaNUM_NF: TIntegerField
      DisplayLabel = 'N'#186' da NF para OS'
      FieldName = 'NUM_NF'
      Origin = '"PEDVENDA"."NUM_NF"'
    end
    object cdsPedVendaOBS_LIVRO_REG: TStringField
      DisplayLabel = 'Obs Livro de Registro'
      FieldName = 'OBS_LIVRO_REG'
      Origin = '"PEDVENDA"."OBS_LIVRO_REG"'
      Size = 32
    end
    object cdsPedVendaVALOR_NF: TFloatField
      DisplayLabel = 'Valor da NF'
      FieldName = 'VALOR_NF'
      Origin = '"PEDVENDA"."VALOR_NF"'
      currency = True
    end
    object cdsPedVendaNF_PGARANTIA: TIntegerField
      DisplayLabel = 'NF Para Garantia'
      FieldName = 'NF_PGARANTIA'
      Origin = '"PEDVENDA"."NF_PGARANTIA"'
    end
    object cdsPedVendaNOME_NF_GARANTIA: TStringField
      DisplayLabel = 'Nome do Cliente na NF'
      FieldName = 'NOME_NF_GARANTIA'
      Origin = '"PEDVENDA"."NOME_NF_GARANTIA"'
      Size = 60
    end
    object cdsPedVendaHORA_FECH: TStringField
      DisplayLabel = 'Hora Fechamento'
      FieldName = 'HORA_FECH'
      Origin = '"PEDVENDA"."HORA_FECH"'
      FixedChar = True
      Size = 8
    end
    object cdsPedVendaST_TERM_SERV: TStringField
      DisplayLabel = 'Status TMO'
      FieldName = 'ST_TERM_SERV'
      Origin = '"PEDVENDA"."ST_TERM_SERV"'
      FixedChar = True
      Size = 40
    end
    object cdsPedVendaREGISTRO_DE_ENTREGA: TStringField
      DisplayLabel = 'Registro de Entrega'
      FieldName = 'REGISTRO_DE_ENTREGA'
      Origin = '"PEDVENDA"."REGISTRO_DE_ENTREGA"'
      Size = 100
    end
    object cdsPedVendaATIVO: TIntegerField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
      Origin = '"PEDVENDA"."ATIVO"'
    end
    object cdsPedVendaTIPO_ORC: TStringField
      DisplayLabel = 'Tipo de Or'#231'amento'
      FieldName = 'TIPO_ORC'
      Origin = '"PEDVENDA"."TIPO_ORC"'
      FixedChar = True
      Size = 1
    end
    object cdsPedVendaSTATUS_CUPOM: TStringField
      DisplayLabel = 'Status Cupom'
      FieldName = 'STATUS_CUPOM'
      FixedChar = True
      Size = 1
    end
    object cdsPedVendaNOME_CLI_ORC: TStringField
      DisplayLabel = 'Cliente Or'#231'amento'
      FieldName = 'NOME_CLI_ORC'
      Size = 35
    end
    object cdsPedVendaCOD_ORCAMENTO: TIntegerField
      DisplayLabel = 'N'#186' Or'#231'amento Origem'
      FieldName = 'COD_ORCAMENTO'
    end
    object cdsPedVendaOBS_RED_OS: TStringField
      DisplayLabel = 'Obs Red OS'
      FieldName = 'OBS_RED_OS'
      Size = 50
    end
    object cdsPedVendaCODTERM_STATUS: TIntegerField
      DisplayLabel = 'Cod Terminal ECF'
      FieldName = 'CODTERM_STATUS'
    end
    object cdsPedVendaDATA_NFEXT: TDateTimeField
      DisplayLabel = 'Data NF Externa'
      FieldName = 'DATA_NFEXT'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsPedVendaVALOR_NFEXT: TFloatField
      DisplayLabel = 'Valor NF Externa'
      FieldName = 'VALOR_NFEXT'
      currency = True
    end
    object cdsPedVendaDATA_CUPOM: TDateTimeField
      DisplayLabel = 'Data Cupom'
      FieldName = 'DATA_CUPOM'
    end
    object cdsPedVendaSERIE_NF: TStringField
      DisplayLabel = 'S'#233'rie da NF'
      FieldName = 'SERIE_NF'
      Size = 5
    end
    object cdsPedVendaLIBTRAVA: TStringField
      DisplayLabel = 'Liberar Trava Venda'
      FieldName = 'LIBTRAVA'
      FixedChar = True
      Size = 1
    end
    object cdsPedVendaDATA_LIBTRAVA: TDateTimeField
      DisplayLabel = 'Data Libera'#231#227'o Trava'
      FieldName = 'DATA_LIBTRAVA'
    end
    object cdsPedVendaQTDE_LIBTRAVA: TIntegerField
      DisplayLabel = 'Qtde Libera'#231#227'o Trava'
      FieldName = 'QTDE_LIBTRAVA'
    end
    object cdsPedVendaDAV_IMPRESSO: TStringField
      DisplayLabel = 'DAV j'#225' impresso'
      FieldName = 'DAV_IMPRESSO'
    end
    object cdsPedVendaCOD_COND_PAG: TIntegerField
      DisplayLabel = 'Cod Cond Pag'
      FieldName = 'COD_COND_PAG'
      Origin = '"PEDVENDA"."COD_COND_PAG"'
    end
    object cdsPedVendaCOD_VENDEDOR: TIntegerField
      DisplayLabel = 'Cod Vendedor'
      FieldName = 'COD_VENDEDOR'
      Origin = '"PEDVENDA"."COD_VENDEDOR"'
      Required = True
    end
    object cdsPedVendaCOD_CLIENTE: TIntegerField
      DisplayLabel = 'Cod Cliente'
      FieldName = 'COD_CLIENTE'
      Origin = '"PEDVENDA"."COD_CLIENTE"'
      Required = True
    end
    object cdsPedVendaCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Origin = '"PEDVENDA"."COD_EMPRESA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsPedVendaCOD_CARGA: TIntegerField
      DisplayLabel = 'Cod Carga'
      FieldName = 'COD_CARGA'
    end
    object cdsPedVendaAPROVADA_GERENTE: TStringField
      DisplayLabel = 'Gerente Aprovou?'
      FieldName = 'APROVADA_GERENTE'
      Size = 1
    end
    object cdsPedVendaNPEDMOB: TIntegerField
      DisplayLabel = 'Num Pedido Mobile'
      FieldName = 'NPEDMOB'
    end
    object cdsPedVendaIDMOBILE: TIntegerField
      DisplayLabel = 'Id Mobile'
      FieldName = 'IDMOBILE'
    end
    object cdsPedVendaRAZAO: TStringField
      DisplayLabel = 'Nome Cliente (Razao Social)'
      FieldName = 'RAZAO'
      Origin = '"CLIENTES"."RAZAO"'
      ProviderFlags = [pfInWhere, pfHidden]
      ReadOnly = True
      Required = True
      Size = 60
    end
    object cdsPedVendaNOME_CLIENTE: TStringField
      DisplayLabel = 'Nome Cliente (Nome Fantasia)'
      FieldName = 'NOME_CLIENTE'
      Origin = '"CLIENTES"."NOME_CLIENTE"'
      ProviderFlags = [pfInWhere, pfHidden]
      ReadOnly = True
      Required = True
      Size = 35
    end
    object cdsPedVendaCEP: TStringField
      DisplayLabel = 'Cep Cliente'
      FieldName = 'CEP'
      FixedChar = True
      Size = 9
    end
    object cdsPedVendaENDERECO: TStringField
      DisplayLabel = 'Endereco Cliente'
      FieldName = 'ENDERECO'
      Origin = '"CLIENTES"."ENDERECO"'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
      Required = True
      Size = 50
    end
    object cdsPedVendaNUM_END_CLIENTE: TStringField
      DisplayLabel = 'Num Endereco Cliente'
      FieldName = 'NUM_END_CLIENTE'
      Size = 60
    end
    object cdsPedVendaSIGLA_UF: TStringField
      DisplayLabel = 'Estado'
      FieldName = 'SIGLA_UF'
      FixedChar = True
      Size = 2
    end
    object cdsPedVendaNOME_CIDADE: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'NOME_CIDADE'
      Size = 30
    end
    object cdsPedVendaNOME_BAIRRO: TStringField
      DisplayLabel = 'Bairro'
      FieldName = 'NOME_BAIRRO'
      Size = 30
    end
    object cdsPedVendaCOD_LOCALIDADE: TIntegerField
      DisplayLabel = 'Cod Localidade'
      FieldName = 'COD_LOCALIDADE'
    end
    object cdsPedVendaLOCALIDADE: TStringField
      DisplayLabel = 'Localidade'
      FieldName = 'LOCALIDADE'
      Size = 64
    end
    object cdsPedVendaCOD_SETOR: TIntegerField
      DisplayLabel = 'Cod Setor'
      FieldName = 'COD_SETOR'
    end
    object cdsPedVendaSETOR: TStringField
      DisplayLabel = 'Setor'
      FieldName = 'SETOR'
      Size = 64
    end
    object cdsPedVendaEMAIL1: TStringField
      DisplayLabel = 'Email Cliente'
      FieldName = 'EMAIL1'
      Size = 256
    end
    object cdsPedVendaFONE_CLIENTE: TStringField
      DisplayLabel = 'Telefone Cliente'
      FieldName = 'FONE_CLIENTE'
      Origin = '"CLIENTES"."FONE_CLIENTE"'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
      Required = True
      Size = 13
    end
    object cdsPedVendaFONE_CELULAR: TStringField
      DisplayLabel = 'Celular Cliente'
      FieldName = 'FONE_CELULAR'
      FixedChar = True
      Size = 13
    end
    object cdsPedVendaCOD_AGENDAMENTO: TIntegerField
      DisplayLabel = 'Agendamento'
      FieldName = 'COD_AGENDAMENTO'
    end
    object cdsPedVendaCOO_IMPRESSAO: TIntegerField
      DisplayLabel = 'COO Impressao DAV ECF'
      FieldName = 'COO_IMPRESSAO'
    end
    object cdsPedVendaNSERIECF_IMPRESSAO: TStringField
      DisplayLabel = 'Num Serie Impressao DAV ECF'
      FieldName = 'NSERIECF_IMPRESSAO'
    end
    object cdsPedVendaOPERADOR_IMPRESSAO: TIntegerField
      DisplayLabel = 'Caixa Impressao DAV ECF'
      FieldName = 'OPERADOR_IMPRESSAO'
    end
    object cdsPedVendaPAF_NUM_PREVENDA: TIntegerField
      DisplayLabel = 'Num Pre-Venda'
      FieldName = 'PAF_NUM_PREVENDA'
    end
    object cdsPedVendaPAF_STATUS_PREVENDA: TStringField
      DisplayLabel = 'Status Pre-Venda'
      FieldName = 'PAF_STATUS_PREVENDA'
      Size = 10
    end
    object cdsPedVendaNPED_ORIGINADO: TIntegerField
      DisplayLabel = 'Num Vnd Originada'
      FieldName = 'NPED_ORIGINADO'
    end
    object cdsPedVendaTIPO_ORIGINADO: TStringField
      DisplayLabel = 'Tipo Vnd Originada'
      FieldName = 'TIPO_ORIGINADO'
      Size = 3
    end
    object cdsPedVendaCOD_AGENDA: TIntegerField
      Tag = 2
      DisplayLabel = 'Cod Agenda'
      FieldName = 'COD_AGENDA'
    end
    object cdsPedVendaSTATUS_CONTA_CLIENTE: TStringField
      DisplayLabel = 'Status Conta Cliente'
      FieldName = 'STATUS_CONTA_CLIENTE'
      Size = 32
    end
    object cdsPedVendaCOO_CONTA_CLIENTE: TIntegerField
      DisplayLabel = 'COO Conta Cliente'
      FieldName = 'COO_CONTA_CLIENTE'
    end
    object cdsPedVendaCER_CONTA_CLIENTE: TIntegerField
      DisplayLabel = 'CER Conta Cliente'
      FieldName = 'CER_CONTA_CLIENTE'
    end
    object cdsPedVendaSTATUS_CONTRATO: TStringField
      DisplayLabel = 'Status Contrato'
      FieldName = 'STATUS_CONTRATO'
      FixedChar = True
      Size = 1
    end
    object cdsPedVendaORCPARAVND: TStringField
      DisplayLabel = 'OrcVDN'
      FieldName = 'ORCPARAVND'
      FixedChar = True
      Size = 1
    end
    object cdsPedVendaCOD_CONTROLE: TIntegerField
      DisplayLabel = 'Cod Controle'
      FieldName = 'COD_CONTROLE'
    end
    object cdsPedVendaSEL: TStringField
      Tag = 1
      FieldKind = fkInternalCalc
      FieldName = 'SEL'
      Size = 1
    end
    object cdsPedVendaMETODO_ENTREGA: TStringField
      DisplayLabel = 'Metodo de Entrega'
      DisplayWidth = 100
      FieldName = 'METODO_ENTREGA'
      Size = 100
    end
    object cdsPedVendaAUTORIZADO_FINANCEIRO: TStringField
      DisplayLabel = 'Financeiro Autorizou?'
      FieldName = 'AUTORIZADO_FINANCEIRO'
      Size = 1
    end
    object cdsPedVendaN_COMANDO: TIntegerField
      DisplayLabel = 'Num Comando'
      FieldName = 'N_COMANDO'
    end
    object cdsPedVendaENV_MOBILE: TStringField
      DisplayLabel = 'Envio Mobile Concluido'
      FieldName = 'ENV_MOBILE'
      Size = 1
    end
    object cdsPedVendaREABERTO: TStringField
      DisplayLabel = 'Ja houve reabertura'
      FieldName = 'REABERTO'
      Size = 1
    end
    object cdsPedVendaREGRAS_DESCONTOS: TStringField
      DisplayLabel = 'Regras de Descontos'
      FieldName = 'REGRAS_DESCONTOS'
      Size = 128
    end
    object cdsPedVendaNUM_NFEEXT: TLargeintField
      DisplayLabel = 'Num. NF Externa'
      FieldName = 'NUM_NFEEXT'
    end
    object cdsPedVendaSTATUS_SEP_CONF: TStringField
      DisplayLabel = 'Separacao/Conferencia'
      FieldName = 'STATUS_SEP_CONF'
      Size = 24
    end
    object cdsPedVendaMD5: TStringField
      Tag = 1
      FieldName = 'MD5'
      Size = 256
    end
    object cdsPedVendaSAVEAUTO: TStringField
      Tag = 1
      DisplayLabel = 'Save Auto'
      FieldName = 'SAVEAUTO'
      Size = 1
    end
    object cdsPedVendaCALC: TStringField
      Tag = 1
      FieldName = 'CALC'
      Size = 1
    end
    object cdsPedVendaQTDE_IMPRESSAO: TSmallintField
      DisplayLabel = 'Qtde Impress'#227'o'
      FieldName = 'QTDE_IMPRESSAO'
    end
    object cdsPedVendaEND_AVL: TStringField
      Tag = 1
      DisplayLabel = 'End Cliente Avulso'
      FieldName = 'END_AVL'
      Visible = False
      Size = 25
    end
    object cdsPedVendaBAIRRO_AVL: TStringField
      Tag = 1
      DisplayLabel = 'Bairro Cliente Avulso'
      FieldName = 'BAIRRO_AVL'
      Visible = False
      Size = 17
    end
    object cdsPedVendaCIDA_AVL: TStringField
      Tag = 1
      DisplayLabel = 'Cidade Cliente Avulso'
      FieldName = 'CIDA_AVL'
      Visible = False
      Size = 25
    end
    object cdsPedVendaESTA_AVL: TStringField
      Tag = 1
      DisplayLabel = 'Estado Cliente Avulso'
      FieldName = 'ESTA_AVL'
      Visible = False
      Size = 12
    end
    object cdsPedVendaCEP_AVL: TStringField
      Tag = 1
      DisplayLabel = 'Cep Cliente Avulso'
      FieldName = 'CEP_AVL'
      Visible = False
      EditMask = '00000\-999;0;'
      Size = 8
    end
    object cdsPedVendaNOME_CLIENTEDAV: TStringField
      Tag = 1
      DisplayLabel = 'Nome Cliente DAV'
      FieldName = 'NOME_CLIENTEDAV'
      Visible = False
      Size = 35
    end
    object cdsPedVendaCOD_VENDEDOR1: TIntegerField
      DisplayLabel = 'Vendedor 2'
      FieldName = 'COD_VENDEDOR1'
    end
    object cdsPedVendaSELOS_COL: TBlobField
      DisplayLabel = 'Selos Colocados'
      FieldName = 'SELOS_COL'
      OnGetText = cdsPedVendaSELOS_COLGetText
      Size = 8
    end
    object cdsPedVendaSELOS_REM: TBlobField
      DisplayLabel = 'Selos Removidos'
      FieldName = 'SELOS_REM'
      OnGetText = cdsPedVendaSELOS_REMGetText
      Size = 8
    end
    object cdsPedVendaLACRES_COL: TBlobField
      DisplayLabel = 'Lacres Colocados'
      FieldName = 'LACRES_COL'
      OnGetText = cdsPedVendaLACRES_COLGetText
      Size = 8
    end
    object cdsPedVendaLACRES_REM: TBlobField
      DisplayLabel = 'Lacres Removidos'
      FieldName = 'LACRES_REM'
      OnGetText = cdsPedVendaLACRES_REMGetText
      Size = 8
    end
    object cdsPedVendaN_NFD: TIntegerField
      DisplayLabel = 'Num NFD'
      FieldName = 'N_NFD'
    end
    object cdsPedVendaSERIE_NFD: TStringField
      DisplayLabel = 'Serie NFD'
      FieldName = 'SERIE_NFD'
      Size = 5
    end
    object cdsPedVendaCOD_GERADOR: TIntegerField
      DisplayLabel = 'Cod Gerador'
      FieldName = 'COD_GERADOR'
    end
    object cdsPedVendaENV_EMAIL_NFS: TStringField
      Tag = 1
      DisplayLabel = 'Email NFS Env'
      FieldName = 'ENV_EMAIL_NFS'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object cdsPedVendaDATA_EMAIL_NFS: TDateTimeField
      DisplayLabel = 'Data Email NFS'
      FieldName = 'DATA_EMAIL_NFS'
    end
    object cdsPedVendaENV_WHATSAPP_NFS: TStringField
      DisplayLabel = 'WhatsApp NFS Env'
      FieldName = 'ENV_WHATSAPP_NFS'
      FixedChar = True
      Size = 1
    end
    object cdsPedVendaDATA_WHATSAPP_NFS: TDateTimeField
      DisplayLabel = 'Data WhatsApp NFS'
      FieldName = 'DATA_WHATSAPP_NFS'
    end
    object cdsPedVendaVALE_TROCA: TStringField
      DisplayLabel = 'Vale Troca'
      FieldName = 'VALE_TROCA'
      FixedChar = True
      Size = 1
    end
    object cdsPedVendaVALOR_VALE_PRG: TFloatField
      Tag = 1
      DisplayLabel = 'Valor Vale'
      FieldName = 'VALOR_VALE_PRG'
      Visible = False
    end
    object cdsPedVendaCOD_FATURA: TIntegerField
      DisplayLabel = 'Cod Fatura'
      FieldName = 'COD_FATURA'
    end
    object cdsPedVendaNF_AC_CALCTRIB: TStringField
      DisplayLabel = 'Calc trib(NF)'
      FieldName = 'NF_AC_CALCTRIB'
      FixedChar = True
      Size = 1
    end
    object cdsPedVendaNF_AC_SEGURO: TFloatField
      DisplayLabel = 'Seguro(NF)'
      FieldName = 'NF_AC_SEGURO'
      currency = True
    end
    object cdsPedVendaNF_AC_OUTRAS: TFloatField
      DisplayLabel = 'Outras(NF)'
      FieldName = 'NF_AC_OUTRAS'
      currency = True
    end
    object cdsPedVendaNF_AC_FRETE: TFloatField
      DisplayLabel = 'Frete(NF)'
      FieldName = 'NF_AC_FRETE'
      currency = True
    end
    object cdsPedVendaNF_AC_IPI: TFloatField
      DisplayLabel = 'IPI(NF)'
      FieldName = 'NF_AC_IPI'
      currency = True
    end
    object cdsPedVendaNF_AC_ICMSST: TFloatField
      DisplayLabel = 'ICMS ST(NF)'
      FieldName = 'NF_AC_ICMSST'
      currency = True
    end
    object cdsPedVendaNF_AC_FCPST: TFloatField
      DisplayLabel = 'FCP ST(NF)'
      FieldName = 'NF_AC_FCPST'
      currency = True
    end
    object cdsPedVendaNF_AC_IMPOSTO_II: TFloatField
      DisplayLabel = 'Imposto Importacao(NF)'
      FieldName = 'NF_AC_IMPOSTO_II'
      currency = True
    end
    object cdsPedVendaNF_FRETECONTA: TStringField
      DisplayLabel = 'Frete por conta(NF)'
      FieldName = 'NF_FRETECONTA'
      FixedChar = True
      Size = 1
    end
    object cdsPedVendaDEST_SEQID: TIntegerField
      DisplayLabel = 'ID Enderec'
      FieldName = 'DEST_SEQID'
    end
    object cdsPedVendaDEST_SEQID_ENTRG: TIntegerField
      DisplayLabel = 'ID Enderec Entrega'
      FieldName = 'DEST_SEQID_ENTRG'
    end
    object cdsPedVendaVL_COMISSAO_VEND: TFloatField
      Tag = 1
      FieldName = 'VL_COMISSAO_VEND'
      Visible = False
    end
    object cdsPedVendaPERC_COMISSAO_VEND: TFloatField
      Tag = 1
      FieldName = 'PERC_COMISSAO_VEND'
      Visible = False
    end
    object cdsPedVendaVL_COMISSAO_VEND1: TFloatField
      Tag = 1
      FieldName = 'VL_COMISSAO_VEND1'
      Visible = False
    end
    object cdsPedVendaPERC_COMISSAO_VEND1: TFloatField
      Tag = 1
      FieldName = 'PERC_COMISSAO_VEND1'
      Visible = False
    end
    object cdsPedVendaCOD_FORMA_RAST: TIntegerField
      DisplayLabel = 'Cod Metodo Entrega'
      FieldName = 'COD_FORMA_RAST'
    end
    object cdsPedVendaDATA_ENVIO_RAST: TDateTimeField
      DisplayLabel = 'Data Envio Rast'
      FieldName = 'DATA_ENVIO_RAST'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsPedVendaCOD_RASTREAMENTO: TStringField
      DisplayLabel = 'Cod Rastreamento'
      FieldName = 'COD_RASTREAMENTO'
      Size = 30
    end
    object cdsPedVendaID_COMMERCE: TLargeintField
      DisplayLabel = 'Id Ecommerce'
      FieldName = 'ID_COMMERCE'
    end
    object cdsPedVendaLOCAL_VENDA: TStringField
      DisplayLabel = 'Local Venda EC'
      FieldName = 'LOCAL_VENDA'
      Size = 80
    end
    object cdsPedVendaIDSITPED_EC: TIntegerField
      DisplayLabel = 'Id SitPed EC'
      FieldName = 'IDSITPED_EC'
      Visible = False
    end
    object cdsPedVendaSTATUS_EC: TStringField
      DisplayLabel = 'Status Ecommerce'
      FieldName = 'STATUS_EC'
      Size = 100
    end
    object cdsPedVendaNF_DC_DESCONTO: TFloatField
      Tag = 1
      FieldName = 'NF_DC_DESCONTO'
      DisplayFormat = '#0.00'
    end
    object cdsPedVendaNF_DC_VICMDESON: TFloatField
      DisplayLabel = 'ICMS Desonerado (NF)'
      FieldName = 'NF_DC_VICMDESON'
    end
    object cdsPedVendaNF_CF_DESON_EMB: TStringField
      Tag = 1
      DisplayLabel = 'Ind ICMS Deson Embutido'
      FieldName = 'NF_CF_DESON_EMB'
      Size = 1
    end
    object cdsPedVendaNF_AC_VICMDESON: TFloatField
      Tag = 1
      FieldName = 'NF_AC_VICMDESON'
    end
    object cdsPedVendaCOD_NF: TIntegerField
      DisplayLabel = 'Codigo NF Origem'
      FieldName = 'COD_NF'
    end
    object cdsPedVendaNF_GEROU: TStringField
      DisplayLabel = 'Origem NF?'
      FieldName = 'NF_GEROU'
      Size = 1
    end
    object cdsPedVendaCOD_NFCE: TIntegerField
      DisplayLabel = 'Codigo NFCe Ref'
      FieldName = 'COD_NFCE'
    end
    object cdsPedVendaNUM_NFCE: TIntegerField
      DisplayLabel = 'Num NFCe'
      FieldName = 'NUM_NFCE'
    end
    object cdsPedVendaMODELO_VEICULO: TStringField
      DisplayLabel = 'Modelo Veiculo'
      FieldName = 'MODELO_VEICULO'
      Size = 60
    end
    object cdsPedVendaESPECIE_VEICULO: TStringField
      DisplayLabel = 'Especie Veiculo'
      FieldName = 'ESPECIE_VEICULO'
      Size = 30
    end
    object cdsPedVendaMARCA_VEICULO: TStringField
      DisplayLabel = 'Marca Veiculo'
      FieldName = 'MARCA_VEICULO'
      Size = 32
    end
    object cdsPedVendaCOR_VEICULO: TStringField
      DisplayLabel = 'Cor Veiculo'
      FieldName = 'COR_VEICULO'
      Size = 30
    end
    object cdsPedVendaCOMBUSTIVEL_VEICULO: TStringField
      DisplayLabel = 'Combustivel Veiculo'
      FieldName = 'COMBUSTIVEL_VEICULO'
      Size = 50
    end
    object cdsPedVendaANO_FAB_VEICULO: TIntegerField
      DisplayLabel = 'Ano Fabricacao Veiculo'
      FieldName = 'ANO_FAB_VEICULO'
    end
    object cdsPedVendaANO_MOD_VEICULO: TIntegerField
      DisplayLabel = 'Ano Modelo Veiculo'
      FieldName = 'ANO_MOD_VEICULO'
    end
    object cdsPedVendaCILINDROS_VEICULO: TIntegerField
      DisplayLabel = 'Cilindros Veiculo'
      FieldName = 'CILINDROS_VEICULO'
    end
    object cdsPedVendaCILINDRADA_VEICULO: TFloatField
      DisplayLabel = 'Cilindrada Veiculo'
      FieldName = 'CILINDRADA_VEICULO'
    end
    object cdsPedVendaHP_VEICULO: TFloatField
      DisplayLabel = 'Hp Veiculo'
      FieldName = 'HP_VEICULO'
    end
    object cdsPedVendaLOTACAO_VEICULO: TStringField
      DisplayLabel = 'Lotacao Veiculo'
      FieldName = 'LOTACAO_VEICULO'
      FixedChar = True
      Size = 10
    end
    object cdsPedVendaMOTOR_VEICULO: TStringField
      DisplayLabel = 'Motor Veiculo'
      FieldName = 'MOTOR_VEICULO'
      Size = 21
    end
    object cdsPedVendaRENAVAM_VEICULO: TStringField
      DisplayLabel = 'Renavam Veiculo'
      FieldName = 'RENAVAM_VEICULO'
      FixedChar = True
      Size = 17
    end
    object cdsPedVendaNOM_EQUIP: TStringField
      DisplayLabel = 'Nome Equipamento'
      FieldName = 'NOM_EQUIP'
      Size = 32
    end
    object cdsPedVendaMODELO_EQUIPAMENTO: TStringField
      DisplayLabel = 'Modelo Equipamento'
      FieldName = 'MODELO_EQUIPAMENTO'
      Size = 32
    end
    object cdsPedVendaMARCA_EQUIPAMENTO: TStringField
      DisplayLabel = 'Marca Equipamento'
      FieldName = 'MARCA_EQUIPAMENTO'
      Size = 32
    end
    object cdsPedVendaCOR_EQUIPAMENTO: TStringField
      DisplayLabel = 'Cor Equipamento'
      FieldName = 'COR_EQUIPAMENTO'
      Size = 16
    end
    object cdsPedVendaN_SERIE_EQUIPAMENTO: TStringField
      DisplayLabel = 'Num Serie Equipamento'
      FieldName = 'N_SERIE_EQUIPAMENTO'
      Size = 32
    end
    object cdsPedVendaFINALIDADEID: TIntegerField
      DisplayLabel = 'Finalidade(NF)'
      FieldName = 'FINALIDADEID'
    end
    object cdsPedVendaDEV: TStringField
      DisplayLabel = 'Devolucao'
      FieldName = 'DEV'
      Size = 1
    end
    object cdsPedVendaCOND_PAG: TStringField
      DisplayLabel = 'Cond Pag'
      FieldName = 'COND_PAG'
      Size = 30
    end
    object cdsPedVendaNOME_VENDEDOR: TStringField
      DisplayLabel = 'Nome Vendedor'
      FieldName = 'NOME_VENDEDOR'
      Size = 35
    end
    object cdsPedVendaCOD_US_FECH: TIntegerField
      DisplayLabel = 'Cod Usuario Fech'
      FieldName = 'COD_US_FECH'
    end
    object cdsPedVendaNOME_US_FECH: TStringField
      DisplayLabel = 'Nome Usuario Fech'
      FieldName = 'NOME_US_FECH'
      Size = 35
    end
    object cdsPedVendaOBS_TPVENDA: TMemoField
      DisplayLabel = 'Obs Adicional'
      FieldName = 'OBS_TPVENDA'
      OnGetText = cdsPedVendaOBS_TPVENDAGetText
      BlobType = ftMemo
      Size = 8
    end
    object cdsPedVendaCOD_CLIENTE_FAT: TIntegerField
      DisplayLabel = 'Cod Cliente Faturamento'
      FieldName = 'COD_CLI_FAT'
    end
    object cdsPedVendaVALOR_TOTAL_DEV: TFloatField
      DisplayLabel = 'Valor Total Devolvido'
      FieldName = 'VALOR_TOTAL_DEV'
      currency = True
    end
    object cdsPedVendaVALOR_TOTAL_APOS_DEV: TFloatField
      DisplayLabel = 'Valor Total Apos Devolucao'
      FieldName = 'VALOR_TOTAL_APOS_DEV'
      currency = True
    end
    object cdsPedVendaPERC_COMISSAO_VEND3: TFloatField
      Tag = 1
      FieldName = 'PERC_COMISSAO_VEND3'
      Visible = False
    end
    object cdsPedVendaFATURA_VINDI_ID: TLargeintField
      DisplayLabel = 'Fatura Id'
      FieldName = 'FATURA_VINDI_ID'
    end
  end
  object qrPedProd: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransPedVenda
    SQL.Strings = (
      'select * from PEDVENDA_PROD')
    Left = 86
    Top = 43
  end
  object cdsItemProd: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspItemProd'
    BeforeOpen = cdsItemProdBeforeOpen
    Left = 86
    Top = 130
    object cdsItemProdSEL: TStringField
      Tag = 1
      DisplayLabel = 'Sel'
      FieldName = 'SEL'
      Origin = '"PEDVENDA_PROD"."SEL"'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object cdsItemProdNITEM: TIntegerField
      Tag = 2
      DisplayLabel = 'Item'
      FieldName = 'NITEM'
      Required = True
    end
    object cdsItemProdGRUPO_PROD: TIntegerField
      Tag = 2
      DisplayLabel = 'Grupo'
      FieldName = 'GRUPO_PROD'
      Origin = '"PEDVENDA_PROD"."GRUPO_PROD"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsItemProdCOD_PROD: TStringField
      Tag = 2
      DisplayLabel = 'Cod Prod'
      FieldName = 'COD_PROD'
      Origin = '"PEDVENDA_PROD"."COD_PROD"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 6
    end
    object cdsItemProdUNIDADE_CONV: TStringField
      Tag = 2
      DisplayLabel = 'Unidade'
      FieldName = 'UNIDADE_CONV'
      Size = 6
    end
    object cdsItemProdQUANT_PED_ITEM_CONV: TFloatField
      Tag = 2
      DisplayLabel = 'Qtde'
      FieldKind = fkInternalCalc
      FieldName = 'QUANT_PED_ITEM_CONV'
    end
    object cdsItemProdVLUN_PED_ITEM_CONV: TFloatField
      Tag = 2
      DisplayLabel = 'Val. Unit'#225'rio Bruto'
      FieldKind = fkInternalCalc
      FieldName = 'VLUN_PED_ITEM_CONV'
      currency = True
    end
    object cdsItemProdVLUN_PED_ITEM_CONV_LIQ: TFloatField
      DisplayLabel = 'Val. Unit'#225'rio Liq'
      FieldKind = fkInternalCalc
      FieldName = 'VLUN_PED_ITEM_CONV_LIQ'
      currency = True
    end
    object cdsItemProdVLTOT_PED_ITEM: TFloatField
      Tag = 2
      DisplayLabel = 'Total Bruto'
      FieldName = 'VLTOT_PED_ITEM'
      Origin = '"PEDVENDA_PROD"."VLTOT_PED_ITEM"'
      currency = True
    end
    object cdsItemProdVLTOT_PED_ITEM_LIQ: TFloatField
      Tag = 2
      DisplayLabel = 'Total Liq'
      FieldKind = fkInternalCalc
      FieldName = 'VLTOT_PED_ITEM_LIQ'
      currency = True
    end
    object cdsItemProdDESCR_PROD_PED: TStringField
      Tag = 2
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCR_PROD_PED'
      Origin = '"PEDVENDA_PROD"."DESCR_PROD_PED"'
      Size = 75
    end
    object cdsItemProdCOD_GRADE: TIntegerField
      Tag = 2
      DisplayLabel = 'Grade'
      FieldName = 'COD_GRADE'
      Origin = '"PEDVENDA_PROD"."COD_GRADE"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
    end
    object cdsItemProdCODIGO_NOP: TFloatField
      Tag = 2
      DisplayLabel = 'Nat. Opera'#231#227'o'
      FieldName = 'CODIGO_NOP'
      Origin = '"PEDVENDA_PROD"."CODIGO_NOP"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsItemProdNUM_FAB_PROD: TStringField
      Tag = 2
      DisplayLabel = 'Num. Fabrica'#231#227'o'
      FieldName = 'NUM_FAB_PROD'
      Origin = '"PEDVENDA_PROD"."NUM_FAB_PROD"'
      FixedChar = True
    end
    object cdsItemProdSTATUS: TStringField
      Tag = 2
      DisplayLabel = 'Status Item'
      FieldName = 'STATUS'
      Size = 10
    end
    object cdsItemProdN_NF: TIntegerField
      DisplayLabel = 'N'#186' NF'
      FieldName = 'N_NF'
      Origin = '"PEDVENDA_PROD"."N_NF"'
    end
    object cdsItemProdCOL_COD_VENDEDOR: TIntegerField
      Tag = 1
      DisplayLabel = 'Tecnico/Mecanico'
      FieldName = 'COL_COD_VENDEDOR'
      Origin = '"PEDVENDA_PROD"."COL_COD_VENDEDOR"'
      Visible = False
    end
    object cdsItemProdNOME_VEND: TStringField
      DisplayLabel = 'Nome Vendedor'
      FieldName = 'NOME_VEND'
      Origin = '"PEDVENDA_PROD"."NOME_VEND"'
      Visible = False
      Size = 35
    end
    object cdsItemProdCOD_VENDEDOR: TIntegerField
      Tag = 1
      DisplayLabel = 'Vendedor'
      FieldName = 'COD_VENDEDOR'
      Origin = '"PEDVENDA_PROD"."COD_VENDEDOR"'
      Visible = False
    end
    object cdsItemProdNOME_VEND1: TStringField
      DisplayLabel = 'Nome Vendedor 2'
      FieldName = 'NOME_VEND1'
      Origin = '"PEDVENDA_PROD"."NOME_VEND1"'
      Visible = False
      Size = 35
    end
    object cdsItemProdALIQUOTA_CP: TStringField
      DisplayLabel = 'Aliquota Cupom'
      FieldName = 'ALIQUOTA_CP'
      Origin = '"PEDVENDA_PROD"."ALIQUOTA_CP"'
      FixedChar = True
      Size = 4
    end
    object cdsItemProdN_SERIE_PROD: TStringField
      DisplayLabel = 'N'#186' S'#233'rie Prod.'
      FieldName = 'N_SERIE_PROD'
      Origin = '"PEDVENDA_PROD"."N_SERIE_PROD"'
      Size = 15
    end
    object cdsItemProdANO_FAB_PROD: TIntegerField
      DisplayLabel = 'Ano/Fab Produto'
      FieldName = 'ANO_FAB_PROD'
      Origin = '"PEDVENDA_PROD"."ANO_FAB_PROD"'
    end
    object cdsItemProdMODELO: TStringField
      DisplayLabel = 'Modelo'
      FieldName = 'MODELO'
      Origin = '"PEDVENDA_PROD"."MODELO"'
      Size = 15
    end
    object cdsItemProdCOR: TStringField
      DisplayLabel = 'Cor'
      FieldName = 'COR'
      Origin = '"PEDVENDA_PROD"."COR"'
      Size = 10
    end
    object cdsItemProdTP_NF_PED: TStringField
      DisplayLabel = 'Tipo Custo'
      FieldName = 'TP_NF_PED'
      Origin = '"PEDVENDA_PROD"."TP_NF_PED"'
      FixedChar = True
      Size = 1
    end
    object cdsItemProdCOD_SEG_SERV: TIntegerField
      DisplayLabel = 'Segmenta'#231#227'o'
      FieldName = 'COD_SEG_SERV'
      Origin = '"PEDVENDA_PROD"."COD_SEG_SERV"'
    end
    object cdsItemProdRATEIO_DESC: TFloatField
      DisplayLabel = 'Rateio do Desconto'
      FieldName = 'RATEIO_DESC'
      Origin = '"PEDVENDA_PROD"."RATEIO_DESC"'
      currency = True
    end
    object cdsItemProdRATEIO_ACRESC: TFloatField
      DisplayLabel = 'Rateio do Acr'#233'scimo'
      FieldName = 'RATEIO_ACRESC'
      Origin = '"PEDVENDA_PROD"."RATEIO_ACRESC"'
      currency = True
    end
    object cdsItemProdDESC_ITEM: TFloatField
      DisplayLabel = 'Desconto no Item'
      FieldName = 'DESC_ITEM'
      Origin = '"PEDVENDA_PROD"."DESC_ITEM"'
      currency = True
    end
    object cdsItemProdACRESC_ITEM: TFloatField
      DisplayLabel = 'Acrescimo no Item'
      FieldName = 'ACRESC_ITEM'
      Origin = '"PEDVENDA_PROD"."ACRESC_ITEM"'
      currency = True
    end
    object cdsItemProdDAV_ORIGEM: TIntegerField
      DisplayLabel = 'DAV Origem'
      FieldName = 'DAV_ORIGEM'
    end
    object cdsItemProdDATA_INCLUSAO: TDateTimeField
      DisplayLabel = 'Data Inclus'#227'o Item'
      FieldName = 'DATA_INCLUSAO'
    end
    object cdsItemProdCODIGO_KIT: TIntegerField
      DisplayLabel = 'C'#243'digo do Kit'
      FieldName = 'CODIGO_KIT'
      Origin = '"PEDVENDA_PROD"."CODIGO_KIT"'
      Visible = False
    end
    object cdsItemProdCOD_NSERIE: TIntegerField
      DisplayLabel = 'C'#243'digo Num Serie Fabrica'#231#227'o'
      FieldName = 'COD_NSERIE'
    end
    object cdsItemProdTABPRATICADA: TStringField
      DisplayLabel = 'Pre'#231'o P/T/Q/N'
      FieldName = 'TABPRATICADA'
      FixedChar = True
      Size = 1
    end
    object cdsItemProdMAX_DESC_TAB: TFloatField
      Tag = 1
      DisplayLabel = 'Max Desc (%)'
      FieldName = 'MAX_DESC_TAB'
      DisplayFormat = '#0.000'
    end
    object cdsItemProdMAX_DESC_TAB_TEMP: TFloatField
      DisplayLabel = 'Max Desc (%)'
      FieldKind = fkInternalCalc
      FieldName = 'MAX_DESC_TAB_TEMP'
      DisplayFormat = '#0.000'
    end
    object cdsItemProdNPED_CONF: TIntegerField
      DisplayLabel = 'N'#186' Venda Orig'
      FieldName = 'NPED_CONF'
    end
    object cdsItemProdNITEM_CONF: TIntegerField
      DisplayLabel = 'N'#186' Item Orig'
      FieldName = 'NITEM_CONF'
    end
    object cdsItemProdTIPO_CONF: TStringField
      DisplayLabel = 'Tipo Orig'
      FieldName = 'TIPO_CONF'
      FixedChar = True
      Size = 3
    end
    object cdsItemProdUNIDADE: TStringField
      DisplayLabel = 'Unidade (Un Princ)'
      DisplayWidth = 6
      FieldName = 'UNIDADE'
      Size = 6
    end
    object cdsItemProdQUANT_PED_ITEM: TFloatField
      DisplayLabel = 'Qtde (Un Princ)'
      FieldName = 'QUANT_PED_ITEM'
      Origin = '"PEDVENDA_PROD"."QUANT_PED_ITEM"'
    end
    object cdsItemProdVLUN_PED_ITEM: TFloatField
      DisplayLabel = 'Val. Unit'#225'rio Bruto (Un Princ)'
      FieldName = 'VLUN_PED_ITEM'
      Origin = '"PEDVENDA_PROD"."VLUN_PED_ITEM"'
      currency = True
    end
    object cdsItemProdVLUN_PED_ITEM_LIQ: TFloatField
      DisplayLabel = 'Val. Unit'#225'rio Liq (Un Princ)'
      FieldKind = fkInternalCalc
      FieldName = 'VLUN_PED_ITEM_LIQ'
      currency = True
    end
    object cdsItemProdFATOR_CONV_TEMP: TStringField
      DisplayLabel = 'Fator'
      FieldKind = fkInternalCalc
      FieldName = 'FATOR_CONV_TEMP'
      Size = 50
    end
    object cdsItemProdNPED: TIntegerField
      Tag = 1
      DisplayLabel = 'N'#186' Venda'
      FieldName = 'NPED'
      Origin = '"PEDVENDA_PROD"."NPED"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsItemProdTIPO: TStringField
      Tag = 1
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Origin = '"PEDVENDA_PROD"."TIPO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
      Size = 3
    end
    object cdsItemProdCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod. Empresa'
      FieldName = 'COD_EMPRESA'
      Origin = '"PEDVENDA_PROD"."COD_EMPRESA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
    end
    object cdsItemProdVLUN_ORIG: TFloatField
      DisplayLabel = 'Val. Unit'#225'rio Original'
      FieldName = 'VLUN_ORIG'
      Origin = '"PEDVENDA_PROD"."VLUN_ORIG"'
      currency = True
    end
    object cdsItemProdVLUN_PED_NF: TFloatField
      Tag = 1
      DisplayLabel = 'Val. Unit'#225'rio na NF'
      FieldName = 'VLUN_PED_NF'
      Origin = '"PEDVENDA_PROD"."VLUN_PED_NF"'
      Visible = False
      currency = True
    end
    object cdsItemProdVLTOT_PED_NF: TFloatField
      Tag = 1
      DisplayLabel = 'Val. total Item na NF'
      FieldName = 'VLTOT_PED_NF'
      Origin = '"PEDVENDA_PROD"."VLTOT_PED_NF"'
      Visible = False
      currency = True
    end
    object cdsItemProdRATDSAS: TFloatField
      Tag = 1
      DisplayLabel = 'Rateio da Venda'
      FieldName = 'RATDSAS'
      Origin = '"PEDVENDA_PROD"."RATDSAS"'
      Visible = False
    end
    object cdsItemProdCOMISS_PROD: TFloatField
      Tag = 1
      DisplayLabel = 'Comiss'#227'o Prod.'
      FieldName = 'COMISS_PROD'
      Origin = '"PEDVENDA_PROD"."COMISS_PROD"'
      Visible = False
    end
    object cdsItemProdCOMISS_PROD_GER: TFloatField
      Tag = 1
      DisplayLabel = 'Comiss'#227'o Prod. Gerente'
      FieldName = 'COMISS_PROD_GER'
      Origin = '"PEDVENDA_PROD"."COMISS_PROD_GER"'
      Visible = False
    end
    object cdsItemProdPCUST_C: TFloatField
      Tag = 1
      DisplayLabel = 'Val. custo apurado'
      FieldName = 'PCUST_C'
      Origin = '"PEDVENDA_PROD"."PCUST_C"'
      Visible = False
    end
    object cdsItemProdPCUST_R: TFloatField
      Tag = 1
      DisplayLabel = 'Val. custo real'
      FieldName = 'PCUST_R'
      Origin = '"PEDVENDA_PROD"."PCUST_R"'
      Visible = False
    end
    object cdsItemProdPCUST_MC: TFloatField
      Tag = 1
      DisplayLabel = 'Val. custo m'#233'dio'
      FieldName = 'PCUST_MC'
      Origin = '"PEDVENDA_PROD"."PCUST_MC"'
      Visible = False
    end
    object cdsItemProdPCUST_MR: TFloatField
      Tag = 1
      DisplayLabel = 'Val. custo m'#233'dio real'
      FieldName = 'PCUST_MR'
      Origin = '"PEDVENDA_PROD"."PCUST_MR"'
      Visible = False
    end
    object cdsItemProdSIT_ATD: TStringField
      Tag = 1
      DisplayLabel = 'Situa'#231#227'o de atendimento'
      FieldName = 'SIT_ATD'
      Origin = '"PEDVENDA_PROD"."SIT_ATD"'
      Visible = False
      FixedChar = True
      Size = 2
    end
    object cdsItemProdDATA_ATD: TDateTimeField
      Tag = 1
      DisplayLabel = 'Data do Atendimento'
      FieldName = 'DATA_ATD'
      Origin = '"PEDVENDA_PROD"."DATA_ATD"'
      Visible = False
    end
    object cdsItemProdHORA_ATD: TStringField
      Tag = 1
      DisplayLabel = 'Hs do Atendimento'
      FieldName = 'HORA_ATD'
      Origin = '"PEDVENDA_PROD"."HORA_ATD"'
      Visible = False
      FixedChar = True
      Size = 8
    end
    object cdsItemProdICMANT_SUB: TFloatField
      Tag = 1
      DisplayLabel = 'Icms Antecipa'#231#227'o trib.'
      FieldName = 'ICMANT_SUB'
      Origin = '"PEDVENDA_PROD"."ICMANT_SUB"'
      Visible = False
    end
    object cdsItemProdDATA_TRANSF: TDateTimeField
      Tag = 1
      DisplayLabel = 'Data Transferencia'
      FieldName = 'DATA_TRANSF'
      Origin = '"PEDVENDA_PROD"."DATA_TRANSF"'
      Visible = False
    end
    object cdsItemProdDATA_DEV: TDateTimeField
      Tag = 1
      DisplayLabel = 'Data Devolu'#231#227'o'
      FieldName = 'DATA_DEV'
      Origin = '"PEDVENDA_PROD"."DATA_DEV"'
      Visible = False
    end
    object cdsItemProdQT_DEV: TFloatField
      Tag = 1
      DisplayLabel = 'Qtde Devolvida'
      FieldName = 'QT_DEV'
      Origin = '"PEDVENDA_PROD"."QT_DEV"'
      Visible = False
    end
    object cdsItemProdVLO_UNITARIO: TFloatField
      Tag = 1
      DisplayLabel = 'Val. Orig. Unit'#225'rio'
      FieldName = 'VLO_UNITARIO'
      currency = True
    end
    object cdsItemProdATIVO: TIntegerField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
    object cdsItemProdSERIE: TStringField
      Tag = 1
      DisplayLabel = 'Sub-S'#233'rie NF'
      FieldName = 'SERIE'
      Size = 5
    end
    object cdsItemProdTP_DESCACRES: TStringField
      Tag = 1
      DisplayLabel = 'Acr'#233'scimo ou Desconto'
      FieldName = 'TP_DESCACRES'
      Size = 10
    end
    object cdsItemProdNAT_DESCACRES: TStringField
      Tag = 1
      DisplayLabel = 'Percentual ou Valor Desc.'
      FieldName = 'NAT_DESCACRES'
      Size = 10
    end
    object cdsItemProdVALOR_DESCACRES: TFloatField
      Tag = 1
      DisplayLabel = 'Valor Desconto ou Acr'#233'scimo'
      FieldName = 'VALOR_DESCACRES'
    end
    object cdsItemProdQUANT_ITEM_DEV: TFloatField
      Tag = 1
      DisplayLabel = 'Qtde Dev Conv'
      FieldName = 'QUANT_ITEM_DEV'
    end
    object cdsItemProdTIPV: TStringField
      Tag = 1
      FieldName = 'TIPV'
      FixedChar = True
      Size = 1
    end
    object cdsItemProdCOD_PEDIDO: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Pedido'
      FieldName = 'COD_PEDIDO'
    end
    object cdsItemProdCOD_ALMOXARIFADO: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Almoxarifado'
      FieldName = 'COD_ALMOXARIFADO'
    end
    object cdsItemProdTIPOORIGINADO: TStringField
      Tag = 1
      FieldName = 'TIPOORIGINADO'
      FixedChar = True
      Size = 3
    end
    object cdsItemProdNPEDORIGINADO: TIntegerField
      Tag = 1
      FieldName = 'NPEDORIGINADO'
    end
    object cdsItemProdNITEM_PEDIDO: TIntegerField
      Tag = 1
      FieldName = 'NITEM_PEDIDO'
    end
    object cdsItemProdNPED_ORIGEM: TIntegerField
      Tag = 1
      FieldName = 'NPED_ORIGEM'
    end
    object cdsItemProdTIPO_ORIGEM: TStringField
      Tag = 1
      FieldName = 'TIPO_ORIGEM'
      FixedChar = True
      Size = 3
    end
    object cdsItemProdXPED_COMPRA: TStringField
      Tag = 1
      DisplayLabel = 'Num Pedido Compra Cliente'
      FieldName = 'XPED_COMPRA'
      Size = 15
    end
    object cdsItemProdNITEMPED_COMPRA: TIntegerField
      Tag = 1
      DisplayLabel = 'Num Item Pedido Compra Cliente'
      FieldName = 'NITEMPED_COMPRA'
    end
    object cdsItemProdSIT_TRIB: TStringField
      Tag = 1
      FieldName = 'SIT_TRIB'
      Size = 1
    end
    object cdsItemProdICM_PROD: TFloatField
      Tag = 1
      FieldName = 'ICM_PROD'
    end
    object cdsItemProdCSDECQTDE: TStringField
      Tag = 1
      FieldName = 'CSDECQTDE'
      Size = 1
    end
    object cdsItemProdMD5: TStringField
      Tag = 1
      FieldName = 'MD5'
      Size = 256
    end
    object cdsItemProdCSDECVLUNT: TStringField
      Tag = 1
      FieldName = 'CSDECVLUNT'
      Size = 1
    end
    object cdsItemProdNITEM_SERV: TIntegerField
      Tag = 1
      FieldName = 'NITEM_SERV'
    end
    object cdsItemProdCOD_VENDEDOR1: TIntegerField
      Tag = 1
      DisplayLabel = 'Vendedor 2'
      FieldName = 'COD_VENDEDOR1'
    end
    object cdsItemProdPRECOPORQTDE: TStringField
      Tag = 1
      DisplayLabel = 'Preco Por Qtde'
      FieldName = 'PRECOPORQTDE'
      FixedChar = True
      Size = 1
    end
    object cdsItemProdVL_DESP_NF: TFloatField
      Tag = 1
      FieldName = 'VL_DESP_NF'
    end
    object cdsItemProdN_NFD: TIntegerField
      Tag = 1
      DisplayLabel = 'Num NFD'
      FieldName = 'N_NFD'
    end
    object cdsItemProdSERIED: TStringField
      Tag = 1
      DisplayLabel = 'Serie NFD'
      FieldName = 'SERIED'
      Size = 5
    end
    object cdsItemProdVL_COMISSAO_VEND: TFloatField
      Tag = 1
      FieldName = 'VL_COMISSAO_VEND'
      Visible = False
    end
    object cdsItemProdPERC_COMISSAO_VEND: TFloatField
      Tag = 1
      FieldName = 'PERC_COMISSAO_VEND'
      Visible = False
    end
    object cdsItemProdVL_COMISSAO_VEND1: TFloatField
      Tag = 1
      FieldName = 'VL_COMISSAO_VEND1'
      Visible = False
    end
    object cdsItemProdPERC_COMISSAO_VEND1: TFloatField
      Tag = 1
      FieldName = 'PERC_COMISSAO_VEND1'
      Visible = False
    end
    object cdsItemProdNF_DC_DESPNF: TFloatField
      Tag = 1
      FieldName = 'NF_DC_DESPNF'
    end
    object cdsItemProdNF_AC_DES_EMB: TFloatField
      Tag = 1
      FieldName = 'NF_AC_DES_EMB'
    end
    object cdsItemProdID_KIT: TIntegerField
      Tag = 1
      FieldName = 'ID_KIT'
    end
    object cdsItemProdDESCRICAO_KIT_ID_KIT: TStringField
      Tag = 1
      FieldName = 'DESCRICAO_KIT_ID_KIT'
      Size = 80
    end
    object cdsItemProdOPERACAO_CONV: TStringField
      Tag = 1
      DisplayLabel = 'Operacao Conv'
      FieldName = 'OPERACAO_CONV'
      FixedChar = True
      Size = 1
    end
    object cdsItemProdFATOR_CONV: TFloatField
      Tag = 1
      DisplayLabel = 'Fator Conv'
      FieldName = 'FATOR_CONV'
    end
    object cdsItemProdQUANT_ITEM_DEV_CONV: TFloatField
      Tag = 1
      DisplayLabel = 'Qtde Dev'
      FieldKind = fkInternalCalc
      FieldName = 'QUANT_ITEM_DEV_CONV'
    end
    object cdsItemProdVLUN_PED_NF_CONV: TFloatField
      Tag = 1
      FieldKind = fkInternalCalc
      FieldName = 'VLUN_PED_NF_CONV'
    end
    object cdsItemProdRATEIO_DESC_TEMP: TFloatField
      Tag = 1
      DisplayLabel = 'Rateio do Desconto 2'
      FieldKind = fkInternalCalc
      FieldName = 'RATEIO_DESC_TEMP'
    end
    object cdsItemProdRATEIO_ACRESC_TEMP: TFloatField
      Tag = 1
      DisplayLabel = 'Rateio do Acr'#233'scimo 2'
      FieldKind = fkInternalCalc
      FieldName = 'RATEIO_ACRESC_TEMP'
    end
    object cdsItemProdPESO_LIQ_PROD: TFloatField
      DisplayLabel = 'Peso Un Liq'
      FieldName = 'PESO_LIQ_PROD'
    end
    object cdsItemProdPESO_BRUT_PROD: TFloatField
      DisplayLabel = 'Peso Un Bruto'
      FieldName = 'PESO_BRUT_PROD'
    end
    object cdsItemProdPESO_LIQ_PROD_TEMP: TFloatField
      DisplayLabel = 'Peso Tot Liq'
      FieldKind = fkInternalCalc
      FieldName = 'PESO_LIQ_PROD_TEMP'
    end
    object cdsItemProdPESO_BRUT_PROD_TEMP: TFloatField
      DisplayLabel = 'Peso Tot Bruto'
      FieldKind = fkInternalCalc
      FieldName = 'PESO_BRUT_PROD_TEMP'
    end
    object cdsItemProdQUANT_DEV_ITEM_TEMP_CONV: TFloatField
      DisplayLabel = 'Qtde Dev'
      FieldKind = fkInternalCalc
      FieldName = 'QUANT_DEV_ITEM_TEMP_CONV'
    end
    object cdsItemProdQUANT_DEV_ITEM_TEMP: TFloatField
      DisplayLabel = 'Qtde Dev  (Un Princ)'
      FieldKind = fkInternalCalc
      FieldName = 'QUANT_DEV_ITEM_TEMP'
    end
    object cdsItemProdCALC_COMISSAO_CONDPAG_VEND: TStringField
      Tag = 1
      DisplayLabel = 'Calc Comissao CondPag Vend'
      FieldName = 'CALC_COMISSAO_CONDPAG_VEND'
      FixedChar = True
      Size = 1
    end
    object cdsItemProdPERC_COMISSAO_CONDPAG: TFloatField
      DisplayLabel = 'Perc Comissao CondPag'
      FieldName = 'PERC_COMISSAO_CONDPAG'
    end
    object cdsItemProdPERC_COMISSAO_VEND3: TFloatField
      DisplayLabel = 'Perc Comissao Vendedor'
      FieldName = 'PERC_COMISSAO_VEND3'
    end
    object cdsItemProdPERMITIR_DESCONTO: TStringField
      Tag = 1
      DisplayLabel = 'Perm Desconto'
      FieldName = 'PERMITIR_DESCONTO'
      FixedChar = True
      Size = 1
    end
    object cdsItemProdUSAR_DEBCRED: TStringField
      DisplayLabel = 'Debito e Credito'
      FieldName = 'USAR_DEBCRED'
      Size = 1
    end
  end
  object dspItemProd: TDataSetProvider
    DataSet = qrPedProd
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 86
    Top = 88
  end
  object qrPedServ: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransPedVenda
    SQL.Strings = (
      'select * from PEDVENDA_SERV')
    Left = 153
    Top = 43
  end
  object cdsItemServ: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspItemServ'
    BeforeOpen = cdsItemServBeforeOpen
    Left = 153
    Top = 130
    object cdsItemServSEL: TStringField
      DisplayLabel = 'Sel'
      FieldKind = fkInternalCalc
      FieldName = 'SEL'
      Size = 1
    end
    object cdsItemServNPED: TIntegerField
      Tag = 1
      DisplayLabel = 'N'#186' Venda'
      FieldName = 'NPED'
      Required = True
    end
    object cdsItemServNITEM: TIntegerField
      Tag = 2
      DisplayLabel = 'N'#186' Item'
      FieldName = 'NITEM'
      Required = True
    end
    object cdsItemServCOD_SERVICO: TIntegerField
      Tag = 2
      DisplayLabel = 'Cod Servi'#231'o'
      FieldName = 'COD_SERVICO'
      Required = True
    end
    object cdsItemServCODIGO_NOP: TFloatField
      Tag = 2
      DisplayLabel = 'CFOP'
      FieldName = 'CODIGO_NOP'
    end
    object cdsItemServDESC_SERV_PED: TStringField
      Tag = 2
      DisplayLabel = 'Descri'#231#227'o Servi'#231'o'
      FieldName = 'DESC_SERV_PED'
      Size = 60
    end
    object cdsItemServNOME_VEND: TStringField
      Tag = 2
      DisplayLabel = 'Nome Mec'#226'nico'
      FieldName = 'NOME_VEND'
      Size = 35
    end
    object cdsItemServQUANT_SERV_PED: TFloatField
      Tag = 2
      DisplayLabel = 'Qtde'
      FieldName = 'QUANT_SERV_PED'
    end
    object cdsItemServVALOR_UN_SERV: TFloatField
      Tag = 2
      DisplayLabel = 'Val. Unit'#225'rio Bruto'
      FieldName = 'VALOR_UN_SERV'
      currency = True
    end
    object cdsItemServVALOR_UN_SERV_LIQ: TFloatField
      DisplayLabel = 'Val. Unit'#225'rio Liq'
      FieldKind = fkInternalCalc
      FieldName = 'VALOR_UN_SERV_LIQ'
      currency = True
    end
    object cdsItemServVALOR_TOT_SERV: TFloatField
      Tag = 2
      DisplayLabel = 'Total Bruto'
      FieldName = 'VALOR_TOT_SERV'
      currency = True
    end
    object cdsItemServVALOR_TOT_SERV_LIQ: TFloatField
      Tag = 2
      DisplayLabel = 'Total Liq'
      FieldKind = fkInternalCalc
      FieldName = 'VALOR_TOT_SERV_LIQ'
    end
    object cdsItemServSTATUS: TStringField
      Tag = 2
      DisplayLabel = 'Status Item'
      FieldName = 'STATUS'
      Size = 10
    end
    object cdsItemServN_NF: TLargeintField
      DisplayLabel = 'N'#186' NF'
      FieldName = 'N_NF'
    end
    object cdsItemServPRC_INT_SERV: TFloatField
      DisplayLabel = 'Vl Interno Serv'
      FieldName = 'PRC_INT_SERV'
      currency = True
    end
    object cdsItemServRATEIO_DESC: TFloatField
      DisplayLabel = 'Rateio do Desconto'
      FieldName = 'RATEIO_DESC'
      currency = True
    end
    object cdsItemServRATEIO_ACRESC: TFloatField
      DisplayLabel = 'Rateio do Acr'#233'scimo'
      FieldName = 'RATEIO_ACRESC'
      currency = True
    end
    object cdsItemServDESC_ITEM: TFloatField
      DisplayLabel = 'Desconto no Item'
      FieldName = 'DESC_ITEM'
      currency = True
    end
    object cdsItemServACRESC_ITEM: TFloatField
      DisplayLabel = 'Acrescimo no Item'
      FieldName = 'ACRESC_ITEM'
      currency = True
    end
    object cdsItemServCOD_VENDEDOR: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Mec'#226'nico 1'
      FieldName = 'COD_VENDEDOR'
      Required = True
      Visible = False
    end
    object cdsItemServCOD_VENDEDOR1: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Mec'#226'nico 2'
      FieldName = 'COD_VENDEDOR1'
      Visible = False
    end
    object cdsItemServNOME_VEND1: TStringField
      DisplayLabel = 'Nome Mec'#226'nico 1'
      FieldName = 'NOME_VEND1'
      Size = 35
    end
    object cdsItemServSUBGSERVICO: TIntegerField
      DisplayLabel = 'Sub Grupo'
      FieldName = 'SUBGSERVICO'
    end
    object cdsItemServDATA_INCLUSAO: TDateTimeField
      DisplayLabel = 'Data Inclus'#227'o Item'
      FieldName = 'DATA_INCLUSAO'
    end
    object cdsItemServDAV_ORIGEM: TIntegerField
      DisplayLabel = 'DAV Origem'
      FieldName = 'DAV_ORIGEM'
    end
    object cdsItemServTMO_SERV: TFloatField
      Tag = 1
      FieldName = 'TMO_SERV'
      Visible = False
    end
    object cdsItemServTIPO: TStringField
      Tag = 1
      FieldName = 'TIPO'
      Required = True
      Visible = False
      FixedChar = True
      Size = 3
    end
    object cdsItemServATIVO: TIntegerField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
      Visible = False
    end
    object cdsItemServVLUN_ORIG: TFloatField
      Tag = 1
      DisplayLabel = 'Valor Original'
      FieldName = 'VLUN_ORIG'
      Visible = False
    end
    object cdsItemServCOD_EMPRESA: TIntegerField
      Tag = 1
      FieldName = 'COD_EMPRESA'
      Required = True
      Visible = False
    end
    object cdsItemServSERIE: TStringField
      Tag = 1
      FieldName = 'SERIE'
      Size = 5
    end
    object cdsItemServCOD_RPS: TIntegerField
      Tag = 1
      FieldName = 'COD_RPS'
    end
    object cdsItemServISS_RETIDO: TIntegerField
      Tag = 1
      FieldName = 'ISS_RETIDO'
    end
    object cdsItemServNFS_SERVICO: TStringField
      Tag = 1
      FieldName = 'NFS_SERVICO'
      FixedChar = True
      Size = 5
    end
    object cdsItemServCNAE_SERV: TIntegerField
      Tag = 1
      FieldName = 'CNAE_SERV'
    end
    object cdsItemServALIQ_ISS: TFloatField
      Tag = 1
      FieldName = 'ALIQ_ISS'
    end
    object cdsItemServEMISSAO_RPS: TDateTimeField
      Tag = 1
      FieldName = 'EMISSAO_RPS'
    end
    object cdsItemServEMISSAO_NFSE: TDateTimeField
      Tag = 1
      FieldName = 'EMISSAO_NFSE'
    end
    object cdsItemServNPROTNFSE: TStringField
      Tag = 1
      FieldName = 'NPROTNFSE'
      Size = 50
    end
    object cdsItemServSTATUS_NFSE: TStringField
      Tag = 1
      FieldName = 'STATUS_NFSE'
    end
    object cdsItemServLOTE_NFSE: TIntegerField
      Tag = 1
      FieldName = 'LOTE_NFSE'
    end
    object cdsItemServRESP_WS_NFSE: TStringField
      Tag = 1
      FieldName = 'RESP_WS_NFSE'
      Size = 1000
    end
    object cdsItemServCODIGO_VERWSNFSE: TStringField
      Tag = 1
      FieldName = 'CODIGO_VERWSNFSE'
      Size = 10
    end
    object cdsItemServOUTRAS_INFNFSE: TStringField
      Tag = 1
      FieldName = 'OUTRAS_INFNFSE'
      Size = 400
    end
    object cdsItemServDESC_SERVICO_RPS: TStringField
      Tag = 1
      FieldName = 'DESC_SERVICO_RPS'
      Size = 600
    end
    object cdsItemServMODELO_NFSE: TStringField
      Tag = 1
      FieldName = 'MODELO_NFSE'
      Size = 3
    end
    object cdsItemServCNAE_RESPNFSE: TStringField
      Tag = 1
      FieldName = 'CNAE_RESPNFSE'
      Size = 12
    end
    object cdsItemServVALOR_NFSE: TFloatField
      Tag = 1
      FieldName = 'VALOR_NFSE'
    end
    object cdsItemServCOD_AGENDA: TIntegerField
      Tag = 1
      FieldName = 'COD_AGENDA'
    end
    object cdsItemServNPEDORIGINADO: TIntegerField
      Tag = 1
      FieldName = 'NPEDORIGINADO'
    end
    object cdsItemServTIPOORIGINADO: TStringField
      Tag = 1
      FieldName = 'TIPOORIGINADO'
      FixedChar = True
      Size = 3
    end
    object cdsItemServNPED_ORIGEM: TIntegerField
      Tag = 1
      FieldName = 'NPED_ORIGEM'
    end
    object cdsItemServTIPO_ORIGEM: TStringField
      Tag = 1
      FieldName = 'TIPO_ORIGEM'
      FixedChar = True
      Size = 3
    end
    object cdsItemServCTISS: TStringField
      Tag = 1
      FieldName = 'CTISS'
      Size = 9
    end
    object cdsItemServCSDECVLUNT: TStringField
      Tag = 1
      FieldName = 'CSDECVLUNT'
      Size = 1
    end
    object cdsItemServSIT_TRIB: TStringField
      Tag = 1
      FieldName = 'SIT_TRIB'
      Size = 1
    end
    object cdsItemServMD5: TStringField
      Tag = 1
      FieldName = 'MD5'
      Size = 256
    end
    object cdsItemServNITEM_SERV: TIntegerField
      Tag = 1
      FieldName = 'NITEM_SERV'
    end
    object cdsItemServRATEIO_DESC_TEMP: TFloatField
      Tag = 1
      DisplayLabel = 'Rateio do Desconto 2'
      FieldKind = fkInternalCalc
      FieldName = 'RATEIO_DESC_TEMP'
    end
    object cdsItemServRATEIO_ACRESC_TEMP: TFloatField
      Tag = 1
      DisplayLabel = 'Rateio do Acr'#233'scimo 2'
      FieldKind = fkInternalCalc
      FieldName = 'RATEIO_ACRESC_TEMP'
    end
  end
  object dspItemServ: TDataSetProvider
    DataSet = qrPedServ
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 153
    Top = 88
  end
  object qrPedVenda: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransPedVenda
    SQL.Strings = (
      'select pedvenda.*,'
      'iif(retv.icodigo > 0, veiculos.descmodelo, null) modelo_veiculo,'
      'iif(retv.icodigo > 0, veiculos.especie, null) especie_veiculo,'
      'iif(retv.icodigo > 0, veiculos.marca_v, null) marca_veiculo,'
      'iif(retv.icodigo > 0, veiculos.cor, null) cor_veiculo,'
      
        'iif(retv.icodigo > 0, veiculos.combustivel, null) combustivel_ve' +
        'iculo,'
      'iif(retv.icodigo > 0, veiculos.anofab, null) ano_fab_veiculo,'
      'iif(retv.icodigo > 0, veiculos.anomod, null) ano_mod_veiculo,'
      
        'iif(retv.icodigo > 0, veiculos.cilindros, null) cilindros_veicul' +
        'o,'
      
        'iif(retv.icodigo > 0, veiculos.cilindrada, null) cilindrada_veic' +
        'ulo,'
      'iif(retv.icodigo > 0, veiculos.hp, null) hp_veiculo,'
      'iif(retv.icodigo > 0, veiculos.lotacao, null) lotacao_veiculo,'
      'iif(retv.icodigo > 0, veiculos.motor, null) motor_veiculo,'
      'iif(retv.icodigo > 0, veiculos.renavam, null) renavam_veiculo,'
      'equipamento.nom_equip,'
      'equipamento.modelo modelo_equipamento,'
      'equipamento.marca marca_equipamento,'
      'equipamento.cor cor_equipamento,'
      'equipamento.n_serie n_serie_equipamento, '
      
        'clientes.nome_cliente, clientes.razao, clientes.cep, clientes.en' +
        'dereco, clientes.num_end_cliente,'
      'clientes.fone_cliente, clientes.fone_celular, clientes.email,'
      
        'estados.sigla_uf, cidades.nome_cidade, bairros.nome_bairro, loca' +
        'lidade.localidade, setor.setor, '
      
        'colaborador.nome_vendedor, usfech.nome_vendedor as nome_us_fech,' +
        ' cond_pag.desc_cond_pag as cond_pag,'
      'dev_vnd.valor_total_dev, dev_vnd.valor_total_apos_dev '
      ' from pedvenda'
      
        'left join retorna_qtde_dev_vnd(pedvenda.nped, pedvenda.tipo, ped' +
        'venda.cod_empresa, pedvenda.valor_total) dev_vnd on 1 = 1'
      
        'left join clientes on pedvenda.cod_cliente = clientes.cod_client' +
        'e and pedvenda.cod_empresa = clientes.cod_empresa'
      'left join estados on estados.codigo_uf = clientes.codigo_uf'
      'left join cidades on cidades.cod_cidade = clientes.cod_cidade'
      'left join bairros on bairros.cod_bairro = clientes.cod_bairro'
      
        'left join localidade on localidade.cod_localidade = clientes.cod' +
        '_localidade and localidade.cod_empresa = clientes.cod_empresa'
      
        'left join setor on setor.cod_setor = localidade.cod_setor and se' +
        'tor.cod_empresa = localidade.cod_empresa'
      
        'left join retorna_veiculo(pedvenda.chassi, pedvenda.placa, pedve' +
        'nda.cod_veiculo, pedvenda.cod_empresa) retv on 1 = 1 '
      
        'left join veiculos on veiculos.placa = retv.iplaca and veiculos.' +
        'chassi = retv.ichassi and veiculos.codigo = retv.icodigo and vei' +
        'culos.cod_empresa = retv.icod_empresa '
      
        'left join equipamento on equipamento.cod_equip = pedvenda.cod_eq' +
        'uip and equipamento.cod_empresa = pedvenda.cod_empresa '
      
        'left join colaborador on colaborador.cod_vendedor = pedvenda.cod' +
        '_vendedor and colaborador.cod_empresa = pedvenda.cod_empresa '
      
        'left join colaborador usfech on usfech.cod_vendedor = pedvenda.c' +
        'od_us_fech and usfech.cod_empresa = pedvenda.cod_empresa '
      
        'left join cond_pag on cond_pag.cod_cond_pag = pedvenda.cod_cond_' +
        'pag'
      'where 1=0')
    Left = 20
    Top = 43
    object qrPedVendaNPED: TIntegerField
      FieldName = 'NPED'
      Origin = '"PEDVENDA"."NPED"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrPedVendaTIPO: TIBStringField
      FieldName = 'TIPO'
      Origin = '"PEDVENDA"."TIPO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 3
    end
    object qrPedVendaCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Origin = '"PEDVENDA"."COD_EMPRESA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrPedVendaCOD_CLIENTE: TIntegerField
      FieldName = 'COD_CLIENTE'
      Origin = '"PEDVENDA"."COD_CLIENTE"'
      Required = True
    end
    object qrPedVendaCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
      Origin = '"PEDVENDA"."COD_VENDEDOR"'
      Required = True
    end
    object qrPedVendaCOD_COND_PAG: TIntegerField
      FieldName = 'COD_COND_PAG'
      Origin = '"PEDVENDA"."COD_COND_PAG"'
    end
    object qrPedVendaN_MOV_CXL: TIntegerField
      FieldName = 'N_MOV_CXL'
      Origin = '"PEDVENDA"."N_MOV_CXL"'
    end
    object qrPedVendaDIA_CXL: TDateTimeField
      FieldName = 'DIA_CXL'
      Origin = '"PEDVENDA"."DIA_CXL"'
    end
    object qrPedVendaDATA_PED: TDateTimeField
      FieldName = 'DATA_PED'
      Origin = '"PEDVENDA"."DATA_PED"'
    end
    object qrPedVendaDATA_FECH: TDateTimeField
      FieldName = 'DATA_FECH'
      Origin = '"PEDVENDA"."DATA_FECH"'
    end
    object qrPedVendaDATVENC: TDateTimeField
      FieldName = 'DATVENC'
      Origin = '"PEDVENDA"."DATVENC"'
    end
    object qrPedVendaVALOR_TOTAL: TFloatField
      FieldName = 'VALOR_TOTAL'
      Origin = '"PEDVENDA"."VALOR_TOTAL"'
    end
    object qrPedVendaDESC_P_PROD: TFloatField
      FieldName = 'DESC_P_PROD'
      Origin = '"PEDVENDA"."DESC_P_PROD"'
    end
    object qrPedVendaDESC_P_SERV: TFloatField
      FieldName = 'DESC_P_SERV'
      Origin = '"PEDVENDA"."DESC_P_SERV"'
    end
    object qrPedVendaDESCONTO: TFloatField
      FieldName = 'DESCONTO'
      Origin = '"PEDVENDA"."DESCONTO"'
    end
    object qrPedVendaOBS_PED: TIBStringField
      FieldName = 'OBS_PED'
      Origin = '"PEDVENDA"."OBS_PED"'
      Size = 130
    end
    object qrPedVendaSTATUS_PED: TIBStringField
      FieldName = 'STATUS_PED'
      Origin = '"PEDVENDA"."STATUS_PED"'
      Size = 10
    end
    object qrPedVendaTIPV: TIBStringField
      FieldName = 'TIPV'
      Origin = '"PEDVENDA"."TIPV"'
      FixedChar = True
      Size = 1
    end
    object qrPedVendaOBS_CXL_RQ: TIBStringField
      FieldName = 'OBS_CXL_RQ'
      Origin = '"PEDVENDA"."OBS_CXL_RQ"'
      Size = 50
    end
    object qrPedVendaSTATUS_CXL_RQ: TIBStringField
      FieldName = 'STATUS_CXL_RQ'
      Origin = '"PEDVENDA"."STATUS_CXL_RQ"'
      FixedChar = True
      Size = 1
    end
    object qrPedVendaVL_PAGO_CXL: TFloatField
      FieldName = 'VL_PAGO_CXL'
      Origin = '"PEDVENDA"."VL_PAGO_CXL"'
    end
    object qrPedVendaSELEC: TIBStringField
      FieldName = 'SELEC'
      Origin = '"PEDVENDA"."SELEC"'
      FixedChar = True
      Size = 1
    end
    object qrPedVendaTIPOR: TIBStringField
      FieldName = 'TIPOR'
      Origin = '"PEDVENDA"."TIPOR"'
      FixedChar = True
      Size = 1
    end
    object qrPedVendaHORAABERTURA: TIntegerField
      FieldName = 'HORAABERTURA'
      Origin = '"PEDVENDA"."HORAABERTURA"'
    end
    object qrPedVendaMINABERTURA: TIntegerField
      FieldName = 'MINABERTURA'
      Origin = '"PEDVENDA"."MINABERTURA"'
    end
    object qrPedVendaHORAFECHAMENTO: TIntegerField
      FieldName = 'HORAFECHAMENTO'
      Origin = '"PEDVENDA"."HORAFECHAMENTO"'
    end
    object qrPedVendaMINFECHAMENTO: TIntegerField
      FieldName = 'MINFECHAMENTO'
      Origin = '"PEDVENDA"."MINFECHAMENTO"'
    end
    object qrPedVendaHORASUBTOTAL: TIntegerField
      FieldName = 'HORASUBTOTAL'
      Origin = '"PEDVENDA"."HORASUBTOTAL"'
    end
    object qrPedVendaMINSUBTOTAL: TIntegerField
      FieldName = 'MINSUBTOTAL'
      Origin = '"PEDVENDA"."MINSUBTOTAL"'
    end
    object qrPedVendaNCUPOM: TIntegerField
      FieldName = 'NCUPOM'
      Origin = '"PEDVENDA"."NCUPOM"'
    end
    object qrPedVendaOPERADOR: TIntegerField
      FieldName = 'OPERADOR'
      Origin = '"PEDVENDA"."OPERADOR"'
    end
    object qrPedVendaDA: TIBStringField
      FieldName = 'DA'
      Origin = '"PEDVENDA"."DA"'
      FixedChar = True
      Size = 1
    end
    object qrPedVendaNSERIEECF: TIBStringField
      FieldName = 'NSERIEECF'
      Origin = '"PEDVENDA"."NSERIEECF"'
    end
    object qrPedVendaNOME_RECEB: TIBStringField
      FieldName = 'NOME_RECEB'
      Origin = '"PEDVENDA"."NOME_RECEB"'
      Size = 40
    end
    object qrPedVendaEND_RECEB: TIBStringField
      FieldName = 'END_RECEB'
      Origin = '"PEDVENDA"."END_RECEB"'
      Size = 35
    end
    object qrPedVendaBAIRRO_RECEB: TIBStringField
      FieldName = 'BAIRRO_RECEB'
      Origin = '"PEDVENDA"."BAIRRO_RECEB"'
    end
    object qrPedVendaCIDA_RECEB: TIBStringField
      FieldName = 'CIDA_RECEB'
      Origin = '"PEDVENDA"."CIDA_RECEB"'
      Size = 15
    end
    object qrPedVendaCEP_RECEB: TIBStringField
      FieldName = 'CEP_RECEB'
      Origin = '"PEDVENDA"."CEP_RECEB"'
      FixedChar = True
      Size = 8
    end
    object qrPedVendaFONE_RECEB: TIBStringField
      FieldName = 'FONE_RECEB'
      Origin = '"PEDVENDA"."FONE_RECEB"'
      Size = 14
    end
    object qrPedVendaOBS_MINUTA: TMemoField
      FieldName = 'OBS_MINUTA'
      Origin = '"PEDVENDA"."OBS_MINUTA"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
    object qrPedVendaGRUPO_PROD: TIntegerField
      FieldName = 'GRUPO_PROD'
      Origin = '"PEDVENDA"."GRUPO_PROD"'
    end
    object qrPedVendaCOD_PROD: TIBStringField
      FieldName = 'COD_PROD'
      Origin = '"PEDVENDA"."COD_PROD"'
      FixedChar = True
      Size = 6
    end
    object qrPedVendaOP_CXL: TIntegerField
      FieldName = 'OP_CXL'
      Origin = '"PEDVENDA"."OP_CXL"'
    end
    object qrPedVendaCOD_CIDADE_RECEB: TSmallintField
      FieldName = 'COD_CIDADE_RECEB'
      Origin = '"PEDVENDA"."COD_CIDADE_RECEB"'
    end
    object qrPedVendaCOD_BAIRRO_RECEB: TSmallintField
      FieldName = 'COD_BAIRRO_RECEB'
      Origin = '"PEDVENDA"."COD_BAIRRO_RECEB"'
    end
    object qrPedVendaVL_ENTRADA: TFloatField
      FieldName = 'VL_ENTRADA'
      Origin = '"PEDVENDA"."VL_ENTRADA"'
    end
    object qrPedVendaCODIGO_CTRL: TIntegerField
      FieldName = 'CODIGO_CTRL'
      Origin = '"PEDVENDA"."CODIGO_CTRL"'
    end
    object qrPedVendaNPREVENDA: TIntegerField
      FieldName = 'NPREVENDA'
      Origin = '"PEDVENDA"."NPREVENDA"'
    end
    object qrPedVendaSTAT_REQ: TIBStringField
      FieldName = 'STAT_REQ'
      Origin = '"PEDVENDA"."STAT_REQ"'
      FixedChar = True
      Size = 1
    end
    object qrPedVendaACRESC_P_PROD: TFloatField
      FieldName = 'ACRESC_P_PROD'
      Origin = '"PEDVENDA"."ACRESC_P_PROD"'
    end
    object qrPedVendaACRESC_P_SERV: TFloatField
      FieldName = 'ACRESC_P_SERV'
      Origin = '"PEDVENDA"."ACRESC_P_SERV"'
    end
    object qrPedVendaACRESCIMO: TFloatField
      FieldName = 'ACRESCIMO'
      Origin = '"PEDVENDA"."ACRESCIMO"'
    end
    object qrPedVendaPLACA: TIBStringField
      FieldName = 'PLACA'
      Origin = '"PEDVENDA"."PLACA"'
      Size = 10
    end
    object qrPedVendaCHASSI: TIBStringField
      FieldName = 'CHASSI'
      Origin = '"PEDVENDA"."CHASSI"'
      Size = 17
    end
    object qrPedVendaKM_V: TIntegerField
      FieldName = 'KM_V'
      Origin = '"PEDVENDA"."KM_V"'
    end
    object qrPedVendaORC_PROD: TIntegerField
      FieldName = 'ORC_PROD'
      Origin = '"PEDVENDA"."ORC_PROD"'
    end
    object qrPedVendaDT_PROMETIDA: TDateTimeField
      FieldName = 'DT_PROMETIDA'
      Origin = '"PEDVENDA"."DT_PROMETIDA"'
    end
    object qrPedVendaOBS_OS: TMemoField
      FieldName = 'OBS_OS'
      Origin = '"PEDVENDA"."OBS_OS"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
    object qrPedVendaAPARELHO_PED: TIBStringField
      FieldName = 'APARELHO_PED'
      Origin = '"PEDVENDA"."APARELHO_PED"'
      Size = 128
    end
    object qrPedVendaGUARDA_VOL: TIBStringField
      FieldName = 'GUARDA_VOL'
      Origin = '"PEDVENDA"."GUARDA_VOL"'
      Size = 10
    end
    object qrPedVendaCOMBUST_VEIC: TIBStringField
      FieldName = 'COMBUST_VEIC'
      Origin = '"PEDVENDA"."COMBUST_VEIC"'
      FixedChar = True
      Size = 3
    end
    object qrPedVendaDEFEITO: TMemoField
      FieldName = 'DEFEITO'
      Origin = '"PEDVENDA"."DEFEITO"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
    object qrPedVendaESTADO_VEIC: TMemoField
      FieldName = 'ESTADO_VEIC'
      Origin = '"PEDVENDA"."ESTADO_VEIC"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
    object qrPedVendaACESSORIOS: TMemoField
      FieldName = 'ACESSORIOS'
      Origin = '"PEDVENDA"."ACESSORIOS"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
    object qrPedVendaTIPO_OS: TIBStringField
      FieldName = 'TIPO_OS'
      Origin = '"PEDVENDA"."TIPO_OS"'
      Size = 10
    end
    object qrPedVendaH_ENT: TDateTimeField
      FieldName = 'H_ENT'
      Origin = '"PEDVENDA"."H_ENT"'
    end
    object qrPedVendaH_PROMETIDA: TDateTimeField
      FieldName = 'H_PROMETIDA'
      Origin = '"PEDVENDA"."H_PROMETIDA"'
    end
    object qrPedVendaDATA_NF: TDateTimeField
      FieldName = 'DATA_NF'
      Origin = '"PEDVENDA"."DATA_NF"'
    end
    object qrPedVendaDT_NFGARANTIA: TDateTimeField
      FieldName = 'DT_NFGARANTIA'
      Origin = '"PEDVENDA"."DT_NFGARANTIA"'
    end
    object qrPedVendaTOT_PROD: TFloatField
      FieldName = 'TOT_PROD'
      Origin = '"PEDVENDA"."TOT_PROD"'
    end
    object qrPedVendaTOT_SERV: TFloatField
      FieldName = 'TOT_SERV'
      Origin = '"PEDVENDA"."TOT_SERV"'
    end
    object qrPedVendaTP_ABORD: TIBStringField
      FieldName = 'TP_ABORD'
      Origin = '"PEDVENDA"."TP_ABORD"'
      FixedChar = True
      Size = 3
    end
    object qrPedVendaFR_PAGBOSCH: TIBStringField
      FieldName = 'FR_PAGBOSCH'
      Origin = '"PEDVENDA"."FR_PAGBOSCH"'
      FixedChar = True
      Size = 3
    end
    object qrPedVendaSEQ_FECH: TIntegerField
      FieldName = 'SEQ_FECH'
      Origin = '"PEDVENDA"."SEQ_FECH"'
    end
    object qrPedVendaEM_NF: TIBStringField
      FieldName = 'EM_NF'
      Origin = '"PEDVENDA"."EM_NF"'
      FixedChar = True
      Size = 1
    end
    object qrPedVendaCOD_EQUIP: TIntegerField
      FieldName = 'COD_EQUIP'
      Origin = '"PEDVENDA"."COD_EQUIP"'
    end
    object qrPedVendaN_SERIE: TIBStringField
      FieldName = 'N_SERIE'
      Origin = '"PEDVENDA"."N_SERIE"'
      Size = 32
    end
    object qrPedVendaNUM_NF: TIntegerField
      FieldName = 'NUM_NF'
      Origin = '"PEDVENDA"."NUM_NF"'
    end
    object qrPedVendaOBS_LIVRO_REG: TIBStringField
      FieldName = 'OBS_LIVRO_REG'
      Origin = '"PEDVENDA"."OBS_LIVRO_REG"'
      Size = 32
    end
    object qrPedVendaVALOR_NF: TFloatField
      FieldName = 'VALOR_NF'
      Origin = '"PEDVENDA"."VALOR_NF"'
    end
    object qrPedVendaNF_PGARANTIA: TIntegerField
      FieldName = 'NF_PGARANTIA'
      Origin = '"PEDVENDA"."NF_PGARANTIA"'
    end
    object qrPedVendaNOME_NF_GARANTIA: TIBStringField
      FieldName = 'NOME_NF_GARANTIA'
      Origin = '"PEDVENDA"."NOME_NF_GARANTIA"'
      Size = 60
    end
    object qrPedVendaHORA_FECH: TIBStringField
      FieldName = 'HORA_FECH'
      Origin = '"PEDVENDA"."HORA_FECH"'
      FixedChar = True
      Size = 8
    end
    object qrPedVendaST_TERM_SERV: TIBStringField
      FieldName = 'ST_TERM_SERV'
      Origin = '"PEDVENDA"."ST_TERM_SERV"'
      FixedChar = True
      Size = 40
    end
    object qrPedVendaREGISTRO_DE_ENTREGA: TIBStringField
      FieldName = 'REGISTRO_DE_ENTREGA'
      Origin = '"PEDVENDA"."REGISTRO_DE_ENTREGA"'
      Size = 100
    end
    object qrPedVendaATIVO: TIntegerField
      FieldName = 'ATIVO'
      Origin = '"PEDVENDA"."ATIVO"'
    end
    object qrPedVendaTIPO_ORC: TIBStringField
      FieldName = 'TIPO_ORC'
      Origin = '"PEDVENDA"."TIPO_ORC"'
      FixedChar = True
      Size = 1
    end
    object qrPedVendaSTATUS_CUPOM: TIBStringField
      FieldName = 'STATUS_CUPOM'
      Origin = '"PEDVENDA"."STATUS_CUPOM"'
      FixedChar = True
      Size = 1
    end
    object qrPedVendaCODTERM_STATUS: TIntegerField
      FieldName = 'CODTERM_STATUS'
      Origin = '"PEDVENDA"."CODTERM_STATUS"'
    end
    object qrPedVendaCPFCGC: TIBStringField
      FieldName = 'CPFCGC'
      Origin = '"PEDVENDA"."CPFCGC"'
      FixedChar = True
      Size = 18
    end
    object qrPedVendaNOME_CLI_ORC: TIBStringField
      FieldName = 'NOME_CLI_ORC'
      Origin = '"PEDVENDA"."NOME_CLI_ORC"'
      Size = 35
    end
    object qrPedVendaCOD_ORCAMENTO: TIntegerField
      FieldName = 'COD_ORCAMENTO'
      Origin = '"PEDVENDA"."COD_ORCAMENTO"'
    end
    object qrPedVendaOBS_RED_OS: TIBStringField
      FieldName = 'OBS_RED_OS'
      Origin = '"PEDVENDA"."OBS_RED_OS"'
      Size = 50
    end
    object qrPedVendaCOD_VEICULO: TIntegerField
      FieldName = 'COD_VEICULO'
      Origin = '"PEDVENDA"."COD_VEICULO"'
    end
    object qrPedVendaDATA_NFEXT: TDateTimeField
      FieldName = 'DATA_NFEXT'
      Origin = '"PEDVENDA"."DATA_NFEXT"'
    end
    object qrPedVendaVALOR_NFEXT: TFloatField
      FieldName = 'VALOR_NFEXT'
      Origin = '"PEDVENDA"."VALOR_NFEXT"'
    end
    object qrPedVendaDATA_CUPOM: TDateTimeField
      FieldName = 'DATA_CUPOM'
      Origin = '"PEDVENDA"."DATA_CUPOM"'
    end
    object qrPedVendaSERIE_NF: TIBStringField
      FieldName = 'SERIE_NF'
      Origin = '"PEDVENDA"."SERIE_NF"'
      Size = 5
    end
    object qrPedVendaLIBTRAVA: TIBStringField
      FieldName = 'LIBTRAVA'
      Origin = '"PEDVENDA"."LIBTRAVA"'
      FixedChar = True
      Size = 1
    end
    object qrPedVendaDAV_IMPRESSO: TIBStringField
      FieldName = 'DAV_IMPRESSO'
      Origin = '"PEDVENDA"."DAV_IMPRESSO"'
      FixedChar = True
      Size = 1
    end
    object qrPedVendaCCF_CUPOM: TIntegerField
      FieldName = 'CCF_CUPOM'
      Origin = '"PEDVENDA"."CCF_CUPOM"'
    end
    object qrPedVendaCOD_CARGA: TIntegerField
      FieldName = 'COD_CARGA'
    end
    object qrPedVendaAPROVADA_GERENTE: TStringField
      FieldName = 'APROVADA_GERENTE'
      Size = 1
    end
    object qrPedVendaIDMOBILE: TIntegerField
      FieldName = 'IDMOBILE'
      Origin = '"PEDVENDA"."IDMOBILE"'
    end
    object qrPedVendaDATA_LIBTRAVA: TDateTimeField
      FieldName = 'DATA_LIBTRAVA'
      Origin = '"PEDVENDA"."DATA_LIBTRAVA"'
    end
    object qrPedVendaNPEDMOB: TIntegerField
      FieldName = 'NPEDMOB'
      Origin = '"PEDVENDA"."NPEDMOB"'
    end
    object qrPedVendaNOME_CLIENTE: TIBStringField
      FieldName = 'NOME_CLIENTE'
      Origin = '"CLIENTES"."NOME_CLIENTE"'
      FixedChar = True
      Size = 35
    end
    object qrPedVendaRAZAO: TIBStringField
      FieldName = 'RAZAO'
      Origin = '"CLIENTES"."RAZAO"'
      Size = 60
    end
    object qrPedVendaCEP: TIBStringField
      FieldName = 'CEP'
      Origin = '"CLIENTES"."CEP"'
      FixedChar = True
      Size = 9
    end
    object qrPedVendaENDERECO: TIBStringField
      FieldName = 'ENDERECO'
      Origin = '"CLIENTES"."ENDERECO"'
      Size = 50
    end
    object qrPedVendaNUM_END_CLIENTE: TIBStringField
      FieldName = 'NUM_END_CLIENTE'
      Origin = '"CLIENTES"."NUM_END_CLIENTE"'
      Size = 60
    end
    object qrPedVendaFONE_CLIENTE: TIBStringField
      FieldName = 'FONE_CLIENTE'
      Origin = '"CLIENTES"."FONE_CLIENTE"'
      FixedChar = True
      Size = 13
    end
    object qrPedVendaFONE_CELULAR: TIBStringField
      FieldName = 'FONE_CELULAR'
      Origin = '"CLIENTES"."FONE_CELULAR"'
      FixedChar = True
      Size = 13
    end
    object qrPedVendaEMAIL1: TIBStringField
      DisplayLabel = 'Email Cliente'
      FieldName = 'EMAIL1'
      Origin = '"CLIENTES"."EMAIL"'
      Size = 256
    end
    object qrPedVendaCOD_AGENDAMENTO: TIntegerField
      FieldName = 'COD_AGENDAMENTO'
    end
    object qrPedVendaCOO_IMPRESSAO: TIntegerField
      FieldName = 'COO_IMPRESSAO'
    end
    object qrPedVendaNSERIECF_IMPRESSAO: TStringField
      FieldName = 'NSERIECF_IMPRESSAO'
    end
    object qrPedVendaOPERADOR_IMPRESSAO: TIntegerField
      FieldName = 'OPERADOR_IMPRESSAO'
    end
    object qrPedVendaPAF_NUM_PREVENDA: TIntegerField
      FieldName = 'PAF_NUM_PREVENDA'
    end
    object qrPedVendaPAF_STATUS_PREVENDA: TStringField
      FieldName = 'PAF_STATUS_PREVENDA'
      Size = 10
    end
    object qrPedVendaNPED_ORIGINADO: TIntegerField
      FieldName = 'NPED_ORIGINADO'
    end
    object qrPedVendaTIPO_ORIGINADO: TStringField
      FieldName = 'TIPO_ORIGINADO'
      Size = 3
    end
    object qrPedVendaCOD_AGENDA: TIntegerField
      FieldName = 'COD_AGENDA'
    end
    object qrPedVendaSTATUS_CONTA_CLIENTE: TIBStringField
      FieldName = 'STATUS_CONTA_CLIENTE'
      Origin = '"PEDVENDA"."STATUS_CONTA_CLIENTE"'
      Size = 32
    end
    object qrPedVendaCOO_CONTA_CLIENTE: TIntegerField
      FieldName = 'COO_CONTA_CLIENTE'
      Origin = '"PEDVENDA"."COO_CONTA_CLIENTE"'
    end
    object qrPedVendaCER_CONTA_CLIENTE: TIntegerField
      FieldName = 'CER_CONTA_CLIENTE'
      Origin = '"PEDVENDA"."CER_CONTA_CLIENTE"'
    end
    object qrPedVendaSTATUS_CONTRATO: TIBStringField
      FieldName = 'STATUS_CONTRATO'
      Origin = '"PEDVENDA"."STATUS_CONTRATO"'
      FixedChar = True
      Size = 1
    end
    object qrPedVendaORCPARAVND: TIBStringField
      FieldName = 'ORCPARAVND'
      Origin = '"PEDVENDA"."ORCPARAVND"'
      FixedChar = True
      Size = 1
    end
    object qrPedVendaCOD_CONTROLE: TIntegerField
      FieldName = 'COD_CONTROLE'
    end
    object qrPedVendaMETODO_ENTREGA: TStringField
      DisplayWidth = 100
      FieldName = 'METODO_ENTREGA'
      Size = 100
    end
    object qrPedVendaAUTORIZADO_FINANCEIRO: TStringField
      FieldName = 'AUTORIZADO_FINANCEIRO'
      Size = 1
    end
    object qrPedVendaSIGLA_UF: TIBStringField
      FieldName = 'SIGLA_UF'
      Origin = '"ESTADOS"."SIGLA_UF"'
      FixedChar = True
      Size = 2
    end
    object qrPedVendaNOME_CIDADE: TStringField
      FieldName = 'NOME_CIDADE'
      Size = 30
    end
    object qrPedVendaNOME_BAIRRO: TIBStringField
      FieldName = 'NOME_BAIRRO'
      Origin = '"BAIRROS"."NOME_BAIRRO"'
      Size = 30
    end
    object qrPedVendaCOD_LOCALIDADE: TIntegerField
      FieldName = 'COD_LOCALIDADE'
    end
    object qrPedVendaLOCALIDADE: TStringField
      FieldName = 'LOCALIDADE'
      Size = 64
    end
    object qrPedVendaCOD_SETOR: TIntegerField
      FieldName = 'COD_SETOR'
    end
    object qrPedVendaSETOR: TStringField
      FieldName = 'SETOR'
      Size = 64
    end
    object qrPedVendaN_COMANDO: TIntegerField
      FieldName = 'N_COMANDO'
      Origin = '"PEDVENDA"."N_COMANDO"'
    end
    object qrPedVendaENV_MOBILE: TStringField
      FieldName = 'ENV_MOBILE'
      Size = 1
    end
    object qrPedVendaREABERTO: TStringField
      FieldName = 'REABERTO'
      Size = 1
    end
    object qrPedVendaREGRAS_DESCONTOS: TIBStringField
      FieldName = 'REGRAS_DESCONTOS'
      Origin = '"PEDVENDA"."REGRAS_DESCONTOS"'
      Size = 128
    end
    object qrPedVendaNUM_NFEEXT: TLargeintField
      FieldName = 'NUM_NFEEXT'
      Origin = '"PEDVENDA"."NUM_NFEEXT"'
    end
    object qrPedVendaSTATUS_SEP_CONF: TStringField
      FieldName = 'STATUS_SEP_CONF'
      Size = 24
    end
    object qrPedVendaMD5: TStringField
      FieldName = 'MD5'
      Size = 256
    end
    object qrPedVendaSAVEAUTO: TStringField
      FieldName = 'SAVEAUTO'
      Size = 1
    end
    object qrPedVendaCALC: TStringField
      FieldName = 'CALC'
      Size = 1
    end
    object qrPedVendaQTDE_LIBTRAVA: TIntegerField
      FieldName = 'QTDE_LIBTRAVA'
      Origin = '"PEDVENDA"."QTDE_LIBTRAVA"'
    end
    object qrPedVendaQTDE_IMPRESSAO: TSmallintField
      FieldName = 'QTDE_IMPRESSAO'
      Origin = '"PEDVENDA"."QTDE_IMPRESSAO"'
    end
    object qrPedVendaEND_AVL: TStringField
      FieldName = 'END_AVL'
      Size = 25
    end
    object qrPedVendaBAIRRO_AVL: TStringField
      FieldName = 'BAIRRO_AVL'
      Size = 17
    end
    object qrPedVendaCIDA_AVL: TStringField
      FieldName = 'CIDA_AVL'
      Size = 25
    end
    object qrPedVendaESTA_AVL: TStringField
      FieldName = 'ESTA_AVL'
      Size = 12
    end
    object qrPedVendaCEP_AVL: TStringField
      FieldName = 'CEP_AVL'
      Size = 8
    end
    object qrPedVendaNOME_CLIENTEDAV: TStringField
      FieldName = 'NOME_CLIENTEDAV'
      Size = 35
    end
    object qrPedVendaCOD_VENDEDOR1: TIntegerField
      FieldName = 'COD_VENDEDOR1'
      Origin = '"PEDVENDA"."COD_VENDEDOR1"'
    end
    object qrPedVendaSELOS_COL: TBlobField
      FieldName = 'SELOS_COL'
      Origin = '"PEDVENDA"."SELOS_COL"'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
    object qrPedVendaSELOS_REM: TBlobField
      FieldName = 'SELOS_REM'
      Origin = '"PEDVENDA"."SELOS_REM"'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
    object qrPedVendaLACRES_COL: TBlobField
      FieldName = 'LACRES_COL'
      Origin = '"PEDVENDA"."LACRES_COL"'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
    object qrPedVendaLACRES_REM: TBlobField
      FieldName = 'LACRES_REM'
      Origin = '"PEDVENDA"."LACRES_REM"'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
    object qrPedVendaN_NFD: TIntegerField
      DisplayLabel = 'Num NFD'
      FieldName = 'N_NFD'
      Origin = '"PEDVENDA"."N_NFD"'
    end
    object qrPedVendaSERIE_NFD: TIBStringField
      DisplayLabel = 'Serie NFD'
      FieldName = 'SERIE_NFD'
      Origin = '"PEDVENDA"."SERIE_NFD"'
      Size = 5
    end
    object qrPedVendaCOD_GERADOR: TIntegerField
      DisplayLabel = 'Cod Gerador'
      FieldName = 'COD_GERADOR'
      Origin = '"PEDVENDA"."COD_GERADOR"'
    end
    object qrPedVendaENV_EMAIL_NFS: TIBStringField
      DisplayLabel = 'Email NFS Env'
      FieldName = 'ENV_EMAIL_NFS'
      Origin = '"PEDVENDA"."ENV_EMAIL_NFS"'
      FixedChar = True
      Size = 1
    end
    object qrPedVendaDATA_EMAIL_NFS: TDateTimeField
      DisplayLabel = 'Data Email NFS'
      FieldName = 'DATA_EMAIL_NFS'
      Origin = '"PEDVENDA"."DATA_EMAIL_NFS"'
    end
    object qrPedVendaENV_WHATSAPP_NFS: TIBStringField
      DisplayLabel = 'WhatsAppi NFS Env'
      FieldName = 'ENV_WHATSAPP_NFS'
      Origin = '"PEDVENDA"."ENV_WHATSAPP_NFS"'
      FixedChar = True
      Size = 1
    end
    object qrPedVendaDATA_WHATSAPP_NFS: TDateTimeField
      DisplayLabel = 'Data WhatsApp NFS'
      FieldName = 'DATA_WHATSAPP_NFS'
      Origin = '"PEDVENDA"."DATA_WHATSAPP_NFS"'
    end
    object qrPedVendaTOT_PROD_TERC: TFloatField
      FieldName = 'TOT_PROD_TERC'
      Origin = '"PEDVENDA"."TOT_PROD_TERC"'
    end
    object qrPedVendaTOT_SERV_TERC: TFloatField
      FieldName = 'TOT_SERV_TERC'
      Origin = '"PEDVENDA"."TOT_SERV_TERC"'
    end
    object qrPedVendaVALE_TROCA: TIBStringField
      FieldName = 'VALE_TROCA'
      Origin = '"PEDVENDA"."VALE_TROCA"'
      FixedChar = True
      Size = 1
    end
    object qrPedVendaVALOR_VALE_PRG: TFloatField
      FieldName = 'VALOR_VALE_PRG'
      Origin = '"PEDVENDA"."VALOR_VALE_PRG"'
    end
    object qrPedVendaCOD_FATURA: TIntegerField
      FieldName = 'COD_FATURA'
      Origin = '"PEDVENDA"."COD_FATURA"'
    end
    object qrPedVendaNF_AC_CALCTRIB: TIBStringField
      FieldName = 'NF_AC_CALCTRIB'
      Origin = '"PEDVENDA"."NF_AC_CALCTRIB"'
      FixedChar = True
      Size = 1
    end
    object qrPedVendaNF_AC_SEGURO: TFloatField
      FieldName = 'NF_AC_SEGURO'
      Origin = '"PEDVENDA"."NF_AC_SEGURO"'
    end
    object qrPedVendaNF_AC_OUTRAS: TFloatField
      DisplayWidth = 10
      FieldName = 'NF_AC_OUTRAS'
      Origin = '"PEDVENDA"."NF_AC_OUTRAS"'
    end
    object qrPedVendaNF_AC_FRETE: TFloatField
      FieldName = 'NF_AC_FRETE'
      Origin = '"PEDVENDA"."NF_AC_FRETE"'
    end
    object qrPedVendaNF_AC_IPI: TFloatField
      FieldName = 'NF_AC_IPI'
      Origin = '"PEDVENDA"."NF_AC_IPI"'
    end
    object qrPedVendaNF_AC_ICMSST: TFloatField
      FieldName = 'NF_AC_ICMSST'
      Origin = '"PEDVENDA"."NF_AC_ICMSST"'
    end
    object qrPedVendaNF_AC_FCPST: TFloatField
      FieldName = 'NF_AC_FCPST'
      Origin = '"PEDVENDA"."NF_AC_FCPST"'
    end
    object qrPedVendaNF_AC_IMPOSTO_II: TFloatField
      FieldName = 'NF_AC_IMPOSTO_II'
      Origin = '"PEDVENDA"."NF_AC_IMPOSTO_II"'
    end
    object qrPedVendaNF_FRETECONTA: TIBStringField
      FieldName = 'NF_FRETECONTA'
      Origin = '"PEDVENDA"."NF_FRETECONTA"'
      FixedChar = True
      Size = 1
    end
    object qrPedVendaDEST_SEQID: TIntegerField
      FieldName = 'DEST_SEQID'
    end
    object qrPedVendaDEST_SEQID_ENTRG: TIntegerField
      FieldName = 'DEST_SEQID_ENTRG'
    end
    object qrPedVendaVL_COMISSAO_VEND: TFloatField
      FieldName = 'VL_COMISSAO_VEND'
      Origin = '"PEDVENDA"."VL_COMISSAO_VEND"'
    end
    object qrPedVendaPERC_COMISSAO_VEND: TFloatField
      FieldName = 'PERC_COMISSAO_VEND'
      Origin = '"PEDVENDA"."PERC_COMISSAO_VEND"'
    end
    object qrPedVendaVL_COMISSAO_VEND1: TFloatField
      FieldName = 'VL_COMISSAO_VEND1'
      Origin = '"PEDVENDA"."VL_COMISSAO_VEND1"'
    end
    object qrPedVendaPERC_COMISSAO_VEND1: TFloatField
      FieldName = 'PERC_COMISSAO_VEND1'
      Origin = '"PEDVENDA"."PERC_COMISSAO_VEND1"'
    end
    object qrPedVendaCOD_FORMA_RAST: TIntegerField
      FieldName = 'COD_FORMA_RAST'
      Origin = '"PEDVENDA"."COD_FORMA_RAST"'
    end
    object qrPedVendaDATA_ENVIO_RAST: TDateTimeField
      FieldName = 'DATA_ENVIO_RAST'
      Origin = '"PEDVENDA"."DATA_ENVIO_RAST"'
    end
    object qrPedVendaCOD_RASTREAMENTO: TIBStringField
      FieldName = 'COD_RASTREAMENTO'
      Origin = '"PEDVENDA"."COD_RASTREAMENTO"'
      Size = 30
    end
    object qrPedVendaLOCAL_VENDA: TIBStringField
      FieldName = 'LOCAL_VENDA'
      Origin = '"PEDVENDA"."LOCAL_VENDA"'
      Size = 80
    end
    object qrPedVendaID_COMMERCE: TLargeintField
      FieldName = 'ID_COMMERCE'
      Origin = '"PEDVENDA"."ID_COMMERCE"'
    end
    object qrPedVendaIDSITPED_EC: TIntegerField
      FieldName = 'IDSITPED_EC'
    end
    object qrPedVendaSTATUS_EC: TIBStringField
      FieldName = 'STATUS_EC'
      Origin = '"PEDVENDA"."STATUS_EC"'
      Size = 100
    end
    object qrPedVendaNF_DC_DESCONTO: TFloatField
      FieldName = 'NF_DC_DESCONTO'
    end
    object qrPedVendaNF_DC_VICMDESON: TFloatField
      FieldName = 'NF_DC_VICMDESON'
    end
    object qrPedVendaNF_CF_DESON_EMB: TStringField
      FieldName = 'NF_CF_DESON_EMB'
      Size = 1
    end
    object qrPedVendaNF_AC_VICMDESON: TFloatField
      FieldName = 'NF_AC_VICMDESON'
    end
    object qrPedVendaCOD_NF: TIntegerField
      FieldName = 'COD_NF'
    end
    object qrPedVendaNF_GEROU: TStringField
      FieldName = 'NF_GEROU'
      Size = 1
    end
    object qrPedVendaCOD_NFCE: TIntegerField
      FieldName = 'COD_NFCE'
    end
    object qrPedVendaNUM_NFCE: TIntegerField
      FieldName = 'NUM_NFCE'
    end
    object qrPedVendaNOM_EQUIP: TIBStringField
      FieldName = 'NOM_EQUIP'
      Origin = '"EQUIPAMENTO"."NOM_EQUIP"'
      Size = 32
    end
    object qrPedVendaMODELO_EQUIPAMENTO: TIBStringField
      FieldName = 'MODELO_EQUIPAMENTO'
      Origin = '"EQUIPAMENTO"."MODELO"'
      Size = 32
    end
    object qrPedVendaMARCA_EQUIPAMENTO: TIBStringField
      FieldName = 'MARCA_EQUIPAMENTO'
      Origin = '"EQUIPAMENTO"."MARCA"'
      Size = 32
    end
    object qrPedVendaCOR_EQUIPAMENTO: TIBStringField
      FieldName = 'COR_EQUIPAMENTO'
      Origin = '"EQUIPAMENTO"."COR"'
      Size = 16
    end
    object qrPedVendaN_SERIE_EQUIPAMENTO: TIBStringField
      FieldName = 'N_SERIE_EQUIPAMENTO'
      Origin = '"EQUIPAMENTO"."N_SERIE_FAB"'
      Size = 32
    end
    object qrPedVendaDEPENDENTE: TIntegerField
      FieldName = 'DEPENDENTE'
      Origin = '"PEDVENDA"."DEPENDENTE"'
    end
    object qrPedVendaSUBTIPO_OS: TIBStringField
      FieldName = 'SUBTIPO_OS'
      Origin = '"PEDVENDA"."SUBTIPO_OS"'
      Size = 10
    end
    object qrPedVendaMD52: TIBStringField
      FieldName = 'MD52'
      Origin = '"PEDVENDA"."MD52"'
      Size = 256
    end
    object qrPedVendaCODPESQUISA: TIntegerField
      FieldName = 'CODPESQUISA'
      Origin = '"PEDVENDA"."CODPESQUISA"'
    end
    object qrPedVendaGERENTE_APROVOU: TIBStringField
      FieldName = 'GERENTE_APROVOU'
      Origin = '"PEDVENDA"."GERENTE_APROVOU"'
    end
    object qrPedVendaVALOR_DESC_AVISTA: TFloatField
      FieldName = 'VALOR_DESC_AVISTA'
      Origin = '"PEDVENDA"."VALOR_DESC_AVISTA"'
    end
    object qrPedVendaNSERIEECF_CONTA_CLIENTE: TIBStringField
      FieldName = 'NSERIEECF_CONTA_CLIENTE'
      Origin = '"PEDVENDA"."NSERIEECF_CONTA_CLIENTE"'
    end
    object qrPedVendaUS_EDIT: TIntegerField
      FieldName = 'US_EDIT'
      Origin = '"PEDVENDA"."US_EDIT"'
    end
    object qrPedVendaDATA_ESTOQUE: TDateTimeField
      FieldName = 'DATA_ESTOQUE'
      Origin = '"PEDVENDA"."DATA_ESTOQUE"'
    end
    object qrPedVendaCOD_CLIENTE_NFSERV: TIntegerField
      FieldName = 'COD_CLIENTE_NFSERV'
      Origin = '"PEDVENDA"."COD_CLIENTE_NFSERV"'
    end
    object qrPedVendaNFD_GEROU: TIBStringField
      FieldName = 'NFD_GEROU'
      Origin = '"PEDVENDA"."NFD_GEROU"'
      FixedChar = True
      Size = 1
    end
    object qrPedVendaDATA_NFD: TDateTimeField
      FieldName = 'DATA_NFD'
      Origin = '"PEDVENDA"."DATA_NFD"'
    end
    object qrPedVendaVALOR_NFD: TFloatField
      FieldName = 'VALOR_NFD'
      Origin = '"PEDVENDA"."VALOR_NFD"'
    end
    object qrPedVendaTP_VENDA: TIBStringField
      FieldName = 'TP_VENDA'
      Origin = '"PEDVENDA"."TP_VENDA"'
      FixedChar = True
      Size = 1
    end
    object qrPedVendaCL_CLULTIMACOMPRA: TIBStringField
      FieldName = 'CL_CLULTIMACOMPRA'
      Origin = '"PEDVENDA"."CL_CLULTIMACOMPRA"'
      FixedChar = True
      Size = 2
    end
    object qrPedVendaCL_STATUS_F: TIBStringField
      FieldName = 'CL_STATUS_F'
      Origin = '"PEDVENDA"."CL_STATUS_F"'
      FixedChar = True
      Size = 10
    end
    object qrPedVendaTP_GERAR_PONTOS: TIBStringField
      FieldName = 'TP_GERAR_PONTOS'
      Origin = '"PEDVENDA"."TP_GERAR_PONTOS"'
      FixedChar = True
      Size = 1
    end
    object qrPedVendaCONT_ALT: TSmallintField
      FieldName = 'CONT_ALT'
      Origin = '"PEDVENDA"."CONT_ALT"'
    end
    object qrPedVendaLOCAL_INCIDENCIA: TIntegerField
      FieldName = 'LOCAL_INCIDENCIA'
      Origin = '"PEDVENDA"."LOCAL_INCIDENCIA"'
    end
    object qrPedVendaSEQID_EC: TLargeintField
      FieldName = 'SEQID_EC'
      Origin = '"PEDVENDA"."SEQID_EC"'
    end
    object qrPedVendaCL_GERAR_PONTOS: TIBStringField
      FieldName = 'CL_GERAR_PONTOS'
      Origin = '"PEDVENDA"."CL_GERAR_PONTOS"'
      FixedChar = True
      Size = 1
    end
    object qrPedVendaEMAIL: TIBStringField
      FieldName = 'EMAIL'
      Origin = '"PEDVENDA"."EMAIL"'
      Size = 60
    end
    object qrPedVendaCXL: TIBStringField
      FieldName = 'CXL'
      Origin = '"PEDVENDA"."CXL"'
      FixedChar = True
      Size = 1
    end
    object qrPedVendaMODELO_VEICULO: TIBStringField
      FieldName = 'MODELO_VEICULO'
      ProviderFlags = []
      Size = 60
    end
    object qrPedVendaESPECIE_VEICULO: TIBStringField
      FieldName = 'ESPECIE_VEICULO'
      ProviderFlags = []
      Size = 30
    end
    object qrPedVendaMARCA_VEICULO: TIBStringField
      FieldName = 'MARCA_VEICULO'
      ProviderFlags = []
      Size = 32
    end
    object qrPedVendaCOR_VEICULO: TIBStringField
      FieldName = 'COR_VEICULO'
      ProviderFlags = []
      Size = 30
    end
    object qrPedVendaCOMBUSTIVEL_VEICULO: TIBStringField
      FieldName = 'COMBUSTIVEL_VEICULO'
      ProviderFlags = []
      Size = 50
    end
    object qrPedVendaANO_FAB_VEICULO: TIntegerField
      FieldName = 'ANO_FAB_VEICULO'
      ProviderFlags = []
    end
    object qrPedVendaANO_MOD_VEICULO: TIntegerField
      FieldName = 'ANO_MOD_VEICULO'
      ProviderFlags = []
    end
    object qrPedVendaCILINDROS_VEICULO: TIntegerField
      FieldName = 'CILINDROS_VEICULO'
      ProviderFlags = []
    end
    object qrPedVendaCILINDRADA_VEICULO: TFloatField
      FieldName = 'CILINDRADA_VEICULO'
      ProviderFlags = []
    end
    object qrPedVendaHP_VEICULO: TFloatField
      FieldName = 'HP_VEICULO'
      ProviderFlags = []
    end
    object qrPedVendaLOTACAO_VEICULO: TIBStringField
      FieldName = 'LOTACAO_VEICULO'
      ProviderFlags = []
      FixedChar = True
      Size = 10
    end
    object qrPedVendaMOTOR_VEICULO: TIBStringField
      FieldName = 'MOTOR_VEICULO'
      ProviderFlags = []
      Size = 21
    end
    object qrPedVendaRENAVAM_VEICULO: TIBStringField
      FieldName = 'RENAVAM_VEICULO'
      ProviderFlags = []
      FixedChar = True
      Size = 17
    end
    object qrPedVendaFINALIDADEID: TIntegerField
      FieldName = 'FINALIDADEID'
    end
    object qrPedVendaDEV: TStringField
      FieldName = 'DEV'
      Size = 1
    end
    object qrPedVendaCOD_US_FECH: TIntegerField
      FieldName = 'COD_US_FECH'
    end
    object qrPedVendanome_usuario_fech: TStringField
      FieldName = 'NOME_US_FECH'
      ProviderFlags = []
      Size = 35
    end
    object qrPedVendaCOND_PAG: TStringField
      FieldName = 'COND_PAG'
      ProviderFlags = []
      Size = 30
    end
    object qrPedVendaNOME_VENDEDOR: TStringField
      FieldName = 'NOME_VENDEDOR'
      ProviderFlags = []
      Size = 35
    end
    object qrPedVendaOBS_TPVENDA: TMemoField
      FieldName = 'OBS_TPVENDA'
      Origin = '"PEDVENDA"."OBS_TPVENDA"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
    object qrPedVendaCOD_CLIENTE_FAT: TIntegerField
      FieldName = 'COD_CLI_FAT'
      Origin = '"PEDVENDA"."COD_CLIENTE_FAT"'
    end
    object qrPedVendaVALOR_TOTAL_DEV: TFloatField
      FieldName = 'VALOR_TOTAL_DEV'
      Origin = '"RETORNA_QTDE_DEV_VND"."VALOR_TOTAL_DEV"'
      ProviderFlags = []
    end
    object qrPedVendaVALOR_TOTAL_APOS_DEV: TFloatField
      FieldName = 'VALOR_TOTAL_APOS_DEV'
      Origin = '"RETORNA_QTDE_DEV_VND"."VALOR_TOTAL_APOS_DEV"'
      ProviderFlags = []
    end
    object qrPedVendaPERC_COMISSAO_VEND3: TFloatField
      FieldName = 'PERC_COMISSAO_VEND3'
      Origin = '"PEDVENDA"."PERC_COMISSAO_VEND3"'
    end
    object qrPedVendaFATURA_VINDI_ID: TLargeintField
      FieldName = 'FATURA_VINDI_ID'
      Origin = '"PEDVENDA"."FATURA_VINDI_ID"'
    end
  end
  object dsItemProd: TDataSource
    AutoEdit = False
    DataSet = cdsItemProd
    Left = 82
    Top = 173
  end
  object dsItemServ: TDataSource
    DataSet = cdsItemServ
    Left = 151
    Top = 172
  end
  object qrClientes: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransPedVenda
    SQL.Strings = (
      'SELECT *'
      'FROM CLIENTES '
      'WHERE  ativo=1')
    Left = 300
    Top = 43
  end
  object dspClientes: TDataSetProvider
    DataSet = qrClientes
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 300
    Top = 88
  end
  object cdsClientes: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspClientes'
    BeforeOpen = cdsPedVendaBeforeOpen
    Left = 300
    Top = 130
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
    object cdsClientesPERC_DESC: TFloatField
      FieldName = 'PERC_DESC'
    end
    object cdsClientesNUM_END_CLIENTE: TStringField
      FieldName = 'NUM_END_CLIENTE'
      Size = 60
    end
    object cdsClientesCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Size = 60
    end
    object cdsClientesFONE_TRAB: TStringField
      FieldName = 'FONE_TRAB'
      FixedChar = True
      Size = 14
    end
    object cdsClientesEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 50
    end
    object cdsClientesCOD_LOCALIDADE: TIntegerField
      FieldName = 'COD_LOCALIDADE'
    end
    object cdsClientesCOD_CIDADE: TSmallintField
      FieldName = 'COD_CIDADE'
    end
    object cdsClientesCONTROLES_FP: TStringField
      FieldName = 'CONTROLES_FP'
      Size = 128
    end
    object cdsClientesCOD_COND_PAG: TIntegerField
      FieldName = 'COD_COND_PAG'
    end
    object cdsClientesCOD_TAB_PRECO: TIntegerField
      FieldName = 'COD_TAB_PRECO'
    end
    object cdsClientesCOND_PAG_VND: TStringField
      FieldName = 'COND_PAG_VND'
      Size = 128
    end
    object cdsClientesFONE_CELULAR: TStringField
      FieldName = 'FONE_CELULAR'
      FixedChar = True
      Size = 13
    end
    object cdsClientesUSAR_LIM_LIBVND_FINAN: TStringField
      DisplayLabel = 'Permitir venda acima do limite de cr'#233'dito'
      FieldName = 'USAR_LIM_LIBVND_FINAN'
      Size = 1
    end
    object cdsClientesCOD_CLI_FAT: TIntegerField
      FieldName = 'COD_CLI_FAT'
    end
  end
  object dsClientes: TDataSource
    DataSet = cdsClientes
    Left = 299
    Top = 173
  end
  object qrColaborador: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransPedVenda
    SQL.Strings = (
      'SELECT C.*,F.desc_funcao, F.tpdocs_vnd FROM COLABORADOR C'
      'INNER JOIN funcoes F ON F.cod_funcao  = C.cod_funcao'
      'WHERE C.cod_empresa = 1 AND C.ativo = 1')
    Left = 370
    Top = 43
  end
  object dspColaborador: TDataSetProvider
    DataSet = qrColaborador
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 370
    Top = 88
  end
  object cdsColaborador: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspColaborador'
    BeforeOpen = cdsPedVendaBeforeOpen
    Left = 370
    Top = 130
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
    Left = 373
    Top = 173
  end
  object qrLocServSeg: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransPedVenda
    SQL.Strings = (
      'select * from tipo_servico where stipo = '#39'S'#39)
    Left = 449
    Top = 43
  end
  object dspLocServSeg: TDataSetProvider
    DataSet = qrLocServSeg
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 449
    Top = 88
  end
  object cdsLocServSeg: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspLocServSeg'
    BeforeOpen = cdsPedVendaBeforeOpen
    Left = 449
    Top = 130
    object cdsLocServSegCOD_SERVICO: TIntegerField
      FieldName = 'COD_SERVICO'
      Required = True
    end
    object cdsLocServSegDESC_SERVICO: TStringField
      FieldName = 'DESC_SERVICO'
      FixedChar = True
      Size = 60
    end
    object cdsLocServSegVALOR_SERVICO: TFloatField
      FieldName = 'VALOR_SERVICO'
    end
    object cdsLocServSegSHONDA: TStringField
      FieldName = 'SHONDA'
      FixedChar = True
      Size = 1
    end
    object cdsLocServSegALTCOD: TStringField
      FieldName = 'ALTCOD'
      FixedChar = True
      Size = 1
    end
    object cdsLocServSegDATA_CAD_TIPO: TDateTimeField
      FieldName = 'DATA_CAD_TIPO'
    end
    object cdsLocServSegDATA_MOD_TIPO: TDateTimeField
      FieldName = 'DATA_MOD_TIPO'
    end
    object cdsLocServSegSTIPO: TStringField
      FieldName = 'STIPO'
      FixedChar = True
      Size = 1
    end
    object cdsLocServSegTMO: TFloatField
      FieldName = 'TMO'
    end
    object cdsLocServSegALIQ_ISS: TFloatField
      FieldName = 'ALIQ_ISS'
    end
    object cdsLocServSegATIVO: TIntegerField
      FieldName = 'ATIVO'
    end
    object cdsLocServSegCOD_ESPE_SEG: TIntegerField
      FieldName = 'COD_ESPE_SEG'
    end
    object cdsLocServSegCODIGO_NOP: TFloatField
      FieldName = 'CODIGO_NOP'
    end
  end
  object dsLocServSeg: TDataSource
    DataSet = cdsLocServSeg
    Left = 439
    Top = 173
  end
  object qrBuscas: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransPedVenda
    Left = 353
    Top = 1
  end
  object qrServTerceiro: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransPedVenda
    SQL.Strings = (
      'SELECT * FROM PEDVENDA_SERV_TERC WHERE ativo=1')
    Left = 678
    Top = 43
  end
  object dspServTerceiro: TDataSetProvider
    DataSet = qrServTerceiro
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 678
    Top = 88
  end
  object cdsServTerceiro: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspServTerceiro'
    BeforeOpen = cdsPedVendaBeforeOpen
    Left = 678
    Top = 130
    object cdsServTerceiroSEL: TStringField
      DisplayLabel = 'Sel'
      FieldKind = fkInternalCalc
      FieldName = 'SEL'
      Size = 1
    end
    object cdsServTerceiroNPED: TIntegerField
      Tag = 1
      DisplayLabel = 'N'#186' Venda'
      FieldName = 'NPED'
      Required = True
    end
    object cdsServTerceiroDESCR_SERVT: TStringField
      Tag = 2
      DisplayLabel = 'Descri'#231#227'o do servi'#231'o'
      FieldName = 'DESCR_SERVT'
      Required = True
      Size = 60
    end
    object cdsServTerceiroVL_SERVT: TFloatField
      Tag = 2
      DisplayLabel = 'Val.  Servi'#231'o'
      FieldName = 'VL_SERVT'
    end
    object cdsServTerceiroVLCUSTO: TFloatField
      Tag = 2
      DisplayLabel = 'Custo Total'
      FieldName = 'VLCUSTO'
    end
    object cdsServTerceiroNOME_FORNECEDOR: TStringField
      Tag = 2
      DisplayLabel = 'Fornecedor'
      FieldName = 'NOME_FORNECEDOR'
      Size = 35
    end
    object cdsServTerceiroVLUN_ORIG: TFloatField
      Tag = 2
      DisplayLabel = 'Valor original'
      FieldName = 'VLUN_ORIG'
    end
    object cdsServTerceiroCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsServTerceiroATIVO: TIntegerField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
    object cdsServTerceiroTIPO: TStringField
      Tag = 1
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Required = True
      FixedChar = True
      Size = 3
    end
    object cdsServTerceiroCOD_FORNECEDOR: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Fornecedor'
      FieldName = 'COD_FORNECEDOR'
    end
    object cdsServTerceiroSEQID: TIntegerField
      Tag = 1
      DisplayLabel = 'SeqId'
      FieldName = 'SEQID'
    end
    object cdsServTerceiroNPEDORIGINADO: TIntegerField
      Tag = 1
      FieldName = 'NPEDORIGINADO'
    end
    object cdsServTerceiroTIPOORIGINADO: TStringField
      Tag = 1
      FieldName = 'TIPOORIGINADO'
      FixedChar = True
      Size = 3
    end
    object cdsServTerceiroNPED_ORIGEM: TIntegerField
      Tag = 1
      FieldName = 'NPED_ORIGEM'
    end
    object cdsServTerceiroTIPO_ORIGEM: TStringField
      Tag = 1
      FieldName = 'TIPO_ORIGEM'
      FixedChar = True
      Size = 3
    end
  end
  object dsServTerceiro: TDataSource
    DataSet = cdsServTerceiro
    Left = 678
    Top = 170
  end
  object dsProdTerceiro: TDataSource
    AutoEdit = False
    DataSet = cdsProdTerceiro
    Left = 762
    Top = 169
  end
  object qrOcorreciaPed: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransPedVenda
    SQL.Strings = (
      'SELECT * FROM OCORRENCIAS_OS WHERE ativo=1')
    Left = 227
    Top = 43
  end
  object dspOcorreciaPed: TDataSetProvider
    DataSet = qrOcorreciaPed
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 227
    Top = 88
  end
  object cdsOcorreciaPed: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspOcorreciaPed'
    BeforeOpen = cdsPedVendaBeforeOpen
    Left = 227
    Top = 130
    object cdsOcorreciaPedCOD_OCORRENCIA: TIntegerField
      DisplayLabel = 'N'#186' da Ocorr'#234'ncia'
      FieldName = 'COD_OCORRENCIA'
      Required = True
    end
    object cdsOcorreciaPedNPED: TIntegerField
      DisplayLabel = 'N'#186'  da OS'
      FieldName = 'NPED'
      Required = True
    end
    object cdsOcorreciaPedCOD_EMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsOcorreciaPedHISTORICO_OC: TStringField
      DisplayLabel = 'Hist'#243'rico'
      FieldName = 'HISTORICO_OC'
      Required = True
      Size = 150
    end
    object cdsOcorreciaPedDATA_E_HORA: TDateTimeField
      DisplayLabel = 'Data e Hora'
      FieldName = 'DATA_E_HORA'
      Required = True
    end
    object cdsOcorreciaPedATIVO: TIntegerField
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
    object cdsOcorreciaPedTIPO: TStringField
      FieldName = 'TIPO'
      Required = True
      FixedChar = True
      Size = 3
    end
    object cdsOcorreciaPedN_OS: TIntegerField
      FieldName = 'N_OS'
    end
  end
  object dsOcorreciaPed: TDataSource
    AutoEdit = False
    DataSet = cdsOcorreciaPed
    Left = 225
    Top = 173
  end
  object qrTipoServico: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransPedVenda
    SQL.Strings = (
      'SELECT 0 NITEM, TP.* FROM TIPO_SERVICO TP where TP.ativo=1')
    Left = 529
    Top = 43
  end
  object dspTipoServico: TDataSetProvider
    DataSet = qrTipoServico
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 529
    Top = 88
  end
  object cdsTipoServico: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTipoServico'
    BeforeOpen = cdsPedVendaBeforeOpen
    Left = 529
    Top = 130
    object cdsTipoServicoNITEM: TIntegerField
      FieldName = 'NITEM'
    end
    object IntegerField4: TIntegerField
      Tag = 2
      FieldName = 'COD_SERVICO'
      Required = True
    end
    object StringField1: TStringField
      FieldName = 'DESC_SERVICO'
      FixedChar = True
      Size = 60
    end
    object FloatField5: TFloatField
      FieldName = 'VALOR_SERVICO'
    end
    object StringField2: TStringField
      FieldName = 'SHONDA'
      FixedChar = True
      Size = 1
    end
    object StringField3: TStringField
      FieldName = 'ALTCOD'
      FixedChar = True
      Size = 1
    end
    object DateTimeField3: TDateTimeField
      FieldName = 'DATA_CAD_TIPO'
    end
    object DateTimeField4: TDateTimeField
      FieldName = 'DATA_MOD_TIPO'
    end
    object StringField4: TStringField
      FieldName = 'STIPO'
      FixedChar = True
      Size = 1
    end
    object FloatField6: TFloatField
      FieldName = 'TMO'
    end
    object FloatField7: TFloatField
      FieldName = 'ALIQ_ISS'
    end
    object IntegerField5: TIntegerField
      FieldName = 'ATIVO'
    end
    object IntegerField6: TIntegerField
      FieldName = 'COD_ESPE_SEG'
    end
    object FloatField8: TFloatField
      FieldName = 'CODIGO_NOP'
    end
    object cdsTipoServicoCTISS: TStringField
      FieldName = 'CTISS'
      Size = 9
    end
    object cdsTipoServicoCSDECVLUNT: TStringField
      FieldName = 'CSDECVLUNT'
      Size = 1
    end
    object cdsTipoServicoISENTO_SERV: TStringField
      FieldName = 'ISENTO_SERV'
      FixedChar = True
      Size = 1
    end
    object cdsTipoServicoN_INCIDENCIA_SERV: TStringField
      FieldName = 'N_INCIDENCIA_SERV'
      FixedChar = True
      Size = 1
    end
  end
  object dsTipoServico: TDataSource
    DataSet = cdsTipoServico
    Left = 530
    Top = 170
  end
  object qrCondPag: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransPedVenda
    SQL.Strings = (
      'SELECT * FROM COND_PAG where ativo=1')
    Left = 605
    Top = 43
  end
  object dspCondPag: TDataSetProvider
    DataSet = qrCondPag
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 605
    Top = 88
  end
  object cdsCondPag: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCondPag'
    BeforeOpen = cdsPedVendaBeforeOpen
    Left = 605
    Top = 130
    object cdsCondPagCOD_COND_PAG: TIntegerField
      DisplayLabel = 'C'#243'digo Condi'#231#227'o'
      FieldName = 'COD_COND_PAG'
      Required = True
    end
    object cdsCondPagDESC_COND_PAG: TStringField
      DisplayLabel = 'Condi'#231#227'o de Pagamento'
      FieldName = 'DESC_COND_PAG'
      Size = 30
    end
    object cdsCondPagSEQPRECO: TStringField
      DisplayLabel = 'Sequ'#234'ncia de Pre'#231'o'
      FieldName = 'SEQPRECO'
      FixedChar = True
      Size = 1
    end
    object cdsCondPagMAX_DESC: TFloatField
      DisplayLabel = 'M'#225'ximo de Desconto'
      FieldName = 'MAX_DESC'
    end
    object cdsCondPagATIVO: TIntegerField
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
    object cdsCondPagFINALIZADOR_CUPOM: TIntegerField
      DisplayLabel = 'Finalizador Cupom'
      FieldName = 'FINALIZADOR_CUPOM'
    end
  end
  object dsCondPag: TDataSource
    DataSet = cdsCondPag
    Left = 604
    Top = 171
  end
  object dspEmpresa: TDataSetProvider
    DataSet = qrEmpresa
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 349
    Top = 281
  end
  object qrEmpresa: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransPedVenda
    SQL.Strings = (
      'SELECT * FROM EMPRESA'
      'where ativo=1')
    Left = 349
    Top = 237
  end
  object cdsEmpresa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEmpresa'
    BeforeOpen = cdsPedVendaBeforeOpen
    Left = 349
    Top = 324
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
    object cdsEmpresaUS_EDICAOCLIENTE_VENDA: TStringField
      FieldName = 'US_EDICAOCLIENTE_VENDA'
      FixedChar = True
      Size = 1
    end
    object cdsEmpresaMIN_M_LQ_A: TFloatField
      FieldName = 'MIN_M_LQ_A'
    end
    object cdsEmpresaMIN_M_LQ_V: TFloatField
      FieldName = 'MIN_M_LQ_V'
    end
    object cdsEmpresaTOTDESC_EMP: TFloatField
      FieldName = 'TOTDESC_EMP'
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
    object cdsEmpresaENDRECO_EMP: TStringField
      FieldName = 'ENDRECO_EMP'
      Size = 50
    end
    object cdsEmpresaNUM_CREDENC_INTERVENTOR: TStringField
      FieldName = 'NUM_CREDENC_INTERVENTOR'
    end
  end
  object SpIncCodigo: TIBStoredProc
    Database = dtmAtivo.bancoHw
    Transaction = IBTransPedVenda
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
  object dspBarra: TDataSetProvider
    DataSet = qrBarra
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 280
    Top = 281
  end
  object qrBarra: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransPedVenda
    SQL.Strings = (
      'select * from COD_BARRA')
    Left = 280
    Top = 237
  end
  object cdsBarra: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspBarra'
    BeforeOpen = cdsPedVendaBeforeOpen
    Left = 280
    Top = 324
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
    Left = 215
    Top = 281
  end
  object qrProd: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransPedVenda
    SQL.Strings = (
      'select p.*,'
      'coalesce(est.estoque, 0) estoque_disponivel,'
      'coalesce(est.est_prima, 0) estoque_produzir from PRODUTOS p'
      
        'left join getestoquedisponivel(p.grupo_prod, p.cod_prod, 0, p.co' +
        'd_empresa, 0, '#39#39', 0, 0) est on 1 = 1')
    Left = 215
    Top = 237
  end
  object cdsProd: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProd'
    BeforeOpen = cdsPedVendaBeforeOpen
    Left = 215
    Top = 324
    object cdsProdNUM_FAB_PROD: TStringField
      DisplayLabel = 'Num Fab Prod'
      FieldName = 'NUM_FAB_PROD'
      FixedChar = True
    end
    object cdsProdDESCR_PROD: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCR_PROD'
      FixedChar = True
      Size = 75
    end
    object cdsProdPREC_TAB_PROD: TFloatField
      DisplayLabel = 'Pre'#231'o Tabela'
      FieldName = 'PREC_TAB_PROD'
      currency = True
    end
    object cdsProdPREC_PUBLICO: TFloatField
      DisplayLabel = 'Pre'#231'o Atacado'
      FieldName = 'PREC_PUBLICO'
      currency = True
    end
    object cdsProdNBM: TStringField
      DisplayLabel = 'NCM'
      FieldName = 'NBM'
      FixedChar = True
      Size = 8
    end
    object cdsProdCST_PROD: TStringField
      DisplayLabel = 'CST'
      FieldName = 'CST_PROD'
      FixedChar = True
      Size = 3
    end
    object cdsProdICM_PROD: TFloatField
      DisplayLabel = 'ICMS'
      FieldName = 'ICM_PROD'
    end
    object cdsProdCODIGO_NOP: TFloatField
      DisplayLabel = 'CFOP'
      FieldName = 'CODIGO_NOP'
    end
    object cdsProdMARCA_P: TStringField
      DisplayLabel = 'Marca'
      FieldName = 'MARCA_P'
      FixedChar = True
      Size = 10
    end
    object cdsProdUNIDADE: TStringField
      DisplayLabel = 'Referencia'
      FieldName = 'UNIDADE'
      Size = 6
    end
    object cdsProdEM_PROMOCAO: TStringField
      DisplayLabel = 'Promo'#231#227'o'
      FieldName = 'EM_PROMOCAO'
      FixedChar = True
      Size = 1
    end
    object cdsProdPREC_30_PROD: TFloatField
      DisplayLabel = 'Pre'#231'o 30 dias'
      FieldName = 'PREC_30_PROD'
      currency = True
    end
    object cdsProdPREC_60_PROD: TFloatField
      DisplayLabel = 'Pre'#231'o 60 dias'
      FieldName = 'PREC_60_PROD'
      currency = True
    end
    object cdsProdPREC_90_PROD: TFloatField
      DisplayLabel = 'Pre'#231'o 90 dias'
      FieldName = 'PREC_90_PROD'
      currency = True
    end
    object cdsProdGRUPO_PROD: TIntegerField
      Tag = 2
      DisplayLabel = 'Grupo Prod'
      FieldName = 'GRUPO_PROD'
      Required = True
    end
    object cdsProdCOD_PROD: TStringField
      Tag = 2
      DisplayLabel = 'Cod Prod'
      FieldName = 'COD_PROD'
      Required = True
      FixedChar = True
      Size = 6
    end
    object cdsProdESTOQUE_DISPONIVEL: TFloatField
      DisplayLabel = 'Estoque Dispon'#237'vel'
      FieldName = 'ESTOQUE_DISPONIVEL'
      DisplayFormat = '##0.000'
    end
    object cdsProdESTOQUE_PRODUZIR: TFloatField
      DisplayLabel = 'Qtde Produzir'
      FieldName = 'ESTOQUE_PRODUZIR'
      DisplayFormat = '##0.000'
    end
    object cdsProdPERC_TB_ATAC: TFloatField
      Tag = 1
      DisplayLabel = 'Percentual Tabela Atacado'
      FieldName = 'PERC_TB_ATAC'
      DisplayFormat = '##0.000'
    end
    object cdsProdPERC_TB_VARE: TFloatField
      Tag = 1
      DisplayLabel = 'Percentual Tabela Varejo'
      FieldName = 'PERC_TB_VARE'
      DisplayFormat = '##0.000'
    end
    object cdsProdPREC_CUS_PROD: TFloatField
      Tag = 1
      DisplayLabel = 'Pre'#231'o Custo'
      FieldName = 'PREC_CUS_PROD'
      currency = True
    end
    object cdsProdPERMITIR_DESCONTO: TStringField
      Tag = 1
      DisplayLabel = 'Permitir Desconto'
      FieldName = 'PERMITIR_DESCONTO'
      FixedChar = True
      Size = 1
    end
    object cdsProdPRECO_PROMOCAO: TFloatField
      Tag = 1
      DisplayLabel = 'Pre'#231'o Promo'#231#227'o'
      FieldName = 'PRECO_PROMOCAO'
      currency = True
    end
    object cdsProdPREC_CUSR_PROD: TFloatField
      Tag = 1
      DisplayLabel = 'Pre'#231'o Custo Real'
      FieldName = 'PREC_CUSR_PROD'
      currency = True
    end
    object cdsProdPREC_CUS_MNF: TFloatField
      Tag = 1
      DisplayLabel = 'Pre'#231'o Custo da MNF'
      FieldName = 'PREC_CUS_MNF'
      currency = True
    end
    object cdsProdPREC_CUSM_PROD: TFloatField
      Tag = 1
      DisplayLabel = 'Pre'#231'o Custo M'#233'dio'
      FieldName = 'PREC_CUSM_PROD'
      currency = True
    end
    object cdsProdPREC_CUSMR_PROD: TFloatField
      Tag = 1
      DisplayLabel = 'Pre'#231'o Custo M'#233'dio Real'
      FieldName = 'PREC_CUSMR_PROD'
      currency = True
    end
    object cdsProdICMANT_SUB: TFloatField
      Tag = 1
      DisplayLabel = 'ICMS Substitui'#231#227'o Tribut'#225'ria'
      FieldName = 'ICMANT_SUB'
    end
    object cdsProdPREC_CUSR_MNF: TFloatField
      Tag = 1
      DisplayLabel = 'Pre'#231'o Custo M'#233'dio Real'
      FieldName = 'PREC_CUSR_MNF'
      currency = True
    end
    object cdsProdEST_F: TFloatField
      Tag = 1
      DisplayLabel = 'Estoque Dep'#243'sito'
      FieldName = 'EST_F'
      DisplayFormat = '##0.000'
    end
    object cdsProdDESCR_PROD_RED: TStringField
      Tag = 1
      DisplayLabel = 'Descri'#231#227'o Pedvenda'
      FieldName = 'DESCR_PROD_RED'
      Size = 35
    end
    object cdsProdCSDECQTDE: TStringField
      Tag = 1
      DisplayLabel = 'N'#186' de Casas Decimais para Quantidade'
      FieldName = 'CSDECQTDE'
      Size = 1
    end
    object cdsProdCSDECVLUNT: TStringField
      Tag = 1
      DisplayLabel = 'N'#186' de Casas Decimais para Valor Unit'#225'rio'
      FieldName = 'CSDECVLUNT'
      Size = 1
    end
    object cdsProdCONSUMO: TStringField
      Tag = 1
      DisplayLabel = 'Consumo'
      FieldName = 'CONSUMO'
      FixedChar = True
      Size = 1
    end
    object cdsProdPESO_BRUT_PROD: TFloatField
      Tag = 1
      DisplayLabel = 'Peso Bruto'
      FieldName = 'PESO_BRUT_PROD'
    end
    object cdsProdPESO_LIQ_PROD: TFloatField
      FieldName = 'PESO_LIQ_PROD'
    end
    object cdsProdALT_COD_CUPOM: TStringField
      Tag = 1
      DisplayLabel = 'Alterar Valor Cupom'
      FieldName = 'ALT_COD_CUPOM'
      FixedChar = True
      Size = 1
    end
    object cdsProdALT_DESC_CUPOM: TStringField
      Tag = 1
      DisplayLabel = 'Altera Descri'#231#227'o Cupom'
      FieldName = 'ALT_DESC_CUPOM'
      FixedChar = True
      Size = 1
    end
    object cdsProdCOMISSAO_PROD: TFloatField
      Tag = 1
      DisplayLabel = 'Comiss'#227'o'
      FieldName = 'COMISSAO_PROD'
    end
    object cdsProdCOMISSAO_PROD_GER: TFloatField
      Tag = 1
      DisplayLabel = 'Comiss'#227'o Gerente'
      FieldName = 'COMISSAO_PROD_GER'
    end
    object cdsProdEST_R: TFloatField
      Tag = 1
      DisplayLabel = 'Estoque Dep'#243'sito'
      FieldName = 'EST_R'
      DisplayFormat = '##0.0000'
    end
    object cdsProdPERC_TB_PROD: TFloatField
      Tag = 1
      DisplayLabel = 'Percentual Tabela'
      FieldName = 'PERC_TB_PROD'
      DisplayFormat = '##0.000'
    end
    object cdsProdPERC_TB_PRODA: TFloatField
      Tag = 1
      DisplayLabel = 'Percentual Atacado'
      FieldName = 'PERC_TB_PRODA'
      DisplayFormat = '##0.000'
    end
    object cdsProdMAX_DESC_ITEM: TFloatField
      Tag = 1
      DisplayLabel = 'Percentual Max Desconto'
      FieldName = 'MAX_DESC_ITEM'
    end
    object cdsProdECF: TStringField
      Tag = 1
      FieldName = 'ECF'
      Size = 1
    end
    object cdsProdISENTO_PROD: TStringField
      Tag = 1
      DisplayLabel = 'Produto Isento'
      FieldName = 'ISENTO_PROD'
      Size = 1
    end
    object cdsProdN_INCIDENCIA_PROD: TStringField
      Tag = 1
      DisplayLabel = 'N'#227'o Incid'#234'ncia Produto'
      FieldName = 'N_INCIDENCIA_PROD'
      Size = 1
    end
    object cdsProdLISTA_IMAGENS: TMemoField
      Tag = 1
      DisplayLabel = 'Lista Imagens'
      FieldName = 'LISTA_IMAGENS'
      BlobType = ftMemo
      Size = 8
    end
    object cdsProdNUM_BANCA: TIntegerField
      Tag = 1
      DisplayLabel = 'Num Banca'
      FieldName = 'NUM_BANCA'
    end
    object cdsProdUSAR_DEBCRED: TStringField
      DisplayLabel = 'Debito e Credito'
      FieldName = 'USAR_DEBCRED'
      Size = 1
    end
  end
  object SpBxEst: TIBStoredProc
    Database = dtmAtivo.bancoHw
    Transaction = IBTransPedVenda
    StoredProcName = 'BAIXA_ESTOQUE'
    Left = 180
    Top = 1
  end
  object SpVoltaEst: TIBStoredProc
    Database = dtmAtivo.bancoHw
    Transaction = IBTransPedVenda
    StoredProcName = 'AUMENTA_ESTOQUE'
    Left = 236
    Top = 1
    ParamData = <
      item
        DataType = ftInteger
        Name = 'VGRUPO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'VCOD_PROD'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'QUANT'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VESTS'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VESTM'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VESTC'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'VDATA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'COD_EMPRESA'
        ParamType = ptInput
      end>
  end
  object SpSaiEstoque: TIBStoredProc
    Database = dtmAtivo.bancoHw
    Transaction = IBTransPedVenda
    StoredProcName = 'DIMINUI_ESTOQUE'
    Left = 300
    Top = 1
    ParamData = <
      item
        DataType = ftInteger
        Name = 'VGRUPO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'VCOD_PROD'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'QUANT'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VESTS'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VESTM'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VESTC'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'VDATA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'COD_EMPRESA'
        ParamType = ptInput
      end>
  end
  object dspEst: TDataSetProvider
    DataSet = qrEst
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 137
    Top = 281
  end
  object qrEst: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransPedVenda
    SQL.Strings = (
      'select * from ESTADOS')
    Left = 137
    Top = 237
  end
  object cdsEstados: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEst'
    BeforeOpen = cdsPedVendaBeforeOpen
    Left = 137
    Top = 324
    object cdsEstadosCODIGO_UF: TIntegerField
      FieldName = 'CODIGO_UF'
      Required = True
    end
    object cdsEstadosNOME_UF: TStringField
      FieldName = 'NOME_UF'
      Size = 30
    end
    object cdsEstadosSIGLA_UF: TStringField
      FieldName = 'SIGLA_UF'
      FixedChar = True
      Size = 2
    end
  end
  object qrVeic: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransPedVenda
    SQL.Strings = (
      'select * from VEICULOS')
    Left = 77
    Top = 237
  end
  object dspVeic: TDataSetProvider
    DataSet = qrVeic
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 77
    Top = 281
  end
  object cdsveic: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspVeic'
    BeforeOpen = cdsPedVendaBeforeOpen
    Left = 77
    Top = 324
    object cdsveicPLACA: TStringField
      FieldName = 'PLACA'
      Required = True
      FixedChar = True
      Size = 10
    end
    object cdsveicCHASSI: TStringField
      FieldName = 'CHASSI'
      Required = True
      FixedChar = True
      Size = 17
    end
    object cdsveicCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object cdsveicESPECIE: TStringField
      FieldName = 'ESPECIE'
      FixedChar = True
      Size = 15
    end
    object cdsveicMARCA_V: TStringField
      FieldName = 'MARCA_V'
      FixedChar = True
      Size = 15
    end
    object cdsveicMODELO: TIntegerField
      FieldName = 'MODELO'
    end
    object cdsveicANOFAB: TIntegerField
      FieldName = 'ANOFAB'
    end
    object cdsveicANOMOD: TIntegerField
      FieldName = 'ANOMOD'
    end
    object cdsveicDESCMODELO: TStringField
      FieldName = 'DESCMODELO'
      FixedChar = True
      Size = 30
    end
    object cdsveicCOR: TStringField
      FieldName = 'COR'
      FixedChar = True
      Size = 10
    end
    object cdsveicOBS: TStringField
      FieldName = 'OBS'
      FixedChar = True
      Size = 45
    end
    object cdsveicCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsveicCOD_CLIENTE: TIntegerField
      FieldName = 'COD_CLIENTE'
      Required = True
    end
    object cdsveicRENAVAM: TStringField
      FieldName = 'RENAVAM'
      FixedChar = True
      Size = 9
    end
  end
  object qrApar: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransPedVenda
    SQL.Strings = (
      'select * from EQUIPAMENTO')
    Left = 18
    Top = 237
  end
  object dspApar: TDataSetProvider
    DataSet = qrApar
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 18
    Top = 281
  end
  object cdsApar: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspApar'
    BeforeOpen = cdsPedVendaBeforeOpen
    Left = 18
    Top = 324
    object cdsAparCOD_EQUIP: TIntegerField
      FieldName = 'COD_EQUIP'
      Required = True
    end
    object cdsAparCOD_PROP: TIntegerField
      FieldName = 'COD_PROP'
    end
    object cdsAparNOM_EQUIP: TStringField
      FieldName = 'NOM_EQUIP'
      Size = 32
    end
    object cdsAparN_SERIE: TStringField
      FieldName = 'N_SERIE'
      Size = 32
    end
    object cdsAparMARCA: TStringField
      FieldName = 'MARCA'
      Size = 32
    end
    object cdsAparMODELO: TStringField
      FieldName = 'MODELO'
      Size = 32
    end
    object cdsAparCOR: TStringField
      FieldName = 'COR'
      Size = 16
    end
    object cdsAparTIP_EQUIP: TStringField
      FieldName = 'TIP_EQUIP'
      FixedChar = True
      Size = 1
    end
    object cdsAparTIPOOSVINC: TStringField
      FieldName = 'TIPOOSVINC'
      Size = 10
    end
    object cdsAparCOMCONTRATO: TStringField
      FieldName = 'COMCONTRATO'
      FixedChar = True
      Size = 1
    end
    object cdsAparPORTARIA_MODELO: TStringField
      FieldName = 'PORTARIA_MODELO'
      Size = 64
    end
  end
  object qrFichaV: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransPedVenda
    SQL.Strings = (
      
        'SELECT ORD.nped as N_OS, ord.tipo,ORD.PLACA,ORD.CHASSI,ORD.data_' +
        'ped, ORD.STATUS_PED, ORD.COD_EMPRESA,'
      'ORD.valor_total,ORD.TIPO_OS,VEI.DESCMODELO,VEI.ANOFAB,'
      'VEI.ANOMOD,CL.NOME_CLIENTE,CL.RAZAO '
      'FROM PEDVENDA ORD,VEICULOS VEI,CLIENTES CL'
      'WHERE ORD.CHASSI = :VCHASSI '
      'AND ORD.COD_CLIENTE = CL.COD_CLIENTE AND ORD.CHASSI = VEI.CHASSI'
      'AND ORD.tipo = :TIPO'
      
        'and ord.cod_empresa = vei.cod_empresa and ord.cod_empresa = cl.c' +
        'od_empresa and ord.cod_empresa = :cod_empresa and ORD.ativo=1')
    Left = 574
    Top = 427
    ParamData = <
      item
        DataType = ftString
        Name = 'VCHASSI'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'TIPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'cod_empresa'
        ParamType = ptUnknown
      end>
    object qrFichaVN_OS: TIntegerField
      DisplayLabel = 'Num Doc'
      FieldName = 'N_OS'
      Origin = '"PEDVENDA"."NPED"'
      Required = True
    end
    object qrFichaVTIPO: TIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Origin = '"PEDVENDA"."TIPO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 3
    end
    object qrFichaVPLACA: TIBStringField
      DisplayLabel = 'Placa'
      FieldName = 'PLACA'
      Origin = '"PEDVENDA"."PLACA"'
      Size = 10
    end
    object qrFichaVCHASSI: TIBStringField
      DisplayLabel = 'Chassi'
      FieldName = 'CHASSI'
      Origin = '"PEDVENDA"."CHASSI"'
      Size = 17
    end
    object qrFichaVDATA_PED: TDateTimeField
      DisplayLabel = 'Data OS'
      FieldName = 'DATA_PED'
      Origin = '"PEDVENDA"."DATA_PED"'
    end
    object qrFichaVSTATUS_PED: TStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS_PED'
      Size = 10
    end
    object qrFichaVCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Origin = '"PEDVENDA"."COD_EMPRESA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
    end
    object qrFichaVVALOR_TOTAL: TFloatField
      DisplayLabel = 'Valor Total'
      FieldName = 'VALOR_TOTAL'
      Origin = '"PEDVENDA"."VALOR_TOTAL"'
      currency = True
    end
    object qrFichaVTIPO_OS: TIBStringField
      DisplayLabel = 'Tipo Os/Orc'
      FieldName = 'TIPO_OS'
      Origin = '"PEDVENDA"."TIPO_OS"'
      Size = 10
    end
    object qrFichaVDESCMODELO: TIBStringField
      DisplayLabel = 'Modelo'
      FieldName = 'DESCMODELO'
      Origin = '"VEICULOS"."DESCMODELO"'
      FixedChar = True
      Size = 30
    end
    object qrFichaVANOFAB: TIntegerField
      DisplayLabel = 'Ano Fabric'
      FieldName = 'ANOFAB'
      Origin = '"VEICULOS"."ANOFAB"'
    end
    object qrFichaVANOMOD: TIntegerField
      DisplayLabel = 'Ano Modelo'
      FieldName = 'ANOMOD'
      Origin = '"VEICULOS"."ANOMOD"'
    end
    object qrFichaVNOME_CLIENTE: TIBStringField
      DisplayLabel = 'Nome Fantasia Cliente'
      FieldName = 'NOME_CLIENTE'
      Origin = '"CLIENTES"."NOME_CLIENTE"'
      Required = True
      Size = 35
    end
    object qrFichaVRAZAO: TIBStringField
      DisplayLabel = 'Razao Social Cliente'
      FieldName = 'RAZAO'
      Origin = '"CLIENTES"."RAZAO"'
      Required = True
      Size = 60
    end
  end
  object qrFichaAp: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransPedVenda
    SQL.Strings = (
      
        'SELECT ORD.nped as N_OS,ord.tipo,ORD.COD_EQUIP,ORD.data_ped, ORD' +
        '.STATUS_PED, ORD.COD_EMPRESA,'
      
        'ORD.valor_total,ORD.TIPO_OS,VEI.NOM_EQUIP,CL.NOME_CLIENTE,CL.RAZ' +
        'AO'
      'FROM pedvenda ORD,EQUIPAMENTO VEI,CLIENTES CL'
      'WHERE ORD.COD_EQUIP = :N_OS   /*CODEQUIP*/ '
      
        'AND ORD.COD_CLIENTE = CL.COD_CLIENTE AND ORD.COD_EQUIP = VEI.COD' +
        '_EQUIP'
      'and ord.tipo = :tipo'
      
        'and ord.cod_empresa = vei.cod_empresa and ord.cod_empresa = cl.c' +
        'od_empresa '
      'and ord.cod_empresa = :cod_empresa and ord.ativo=1')
    Left = 908
    Top = 334
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'N_OS'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'tipo'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'cod_empresa'
        ParamType = ptUnknown
      end>
    object qrFichaApN_OS: TIntegerField
      DisplayLabel = 'Num Doc'
      FieldName = 'N_OS'
      Origin = '"PEDVENDA"."NPED"'
      Required = True
    end
    object qrFichaApTIPO: TIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Origin = '"PEDVENDA"."TIPO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 3
    end
    object qrFichaApCOD_EQUIP: TIntegerField
      DisplayLabel = 'Cod Objeto'
      FieldName = 'COD_EQUIP'
      Origin = '"PEDVENDA"."COD_EQUIP"'
    end
    object qrFichaApDATA_PED: TDateTimeField
      DisplayLabel = 'Data OS'
      FieldName = 'DATA_PED'
      Origin = '"PEDVENDA"."DATA_PED"'
    end
    object qrFichaApSTATUS_PED: TStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS_PED'
      Size = 10
    end
    object qrFichaApCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Origin = '"PEDVENDA"."COD_EMPRESA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
    end
    object qrFichaApVALOR_TOTAL: TFloatField
      DisplayLabel = 'Valor Total'
      FieldName = 'VALOR_TOTAL'
      Origin = '"PEDVENDA"."VALOR_TOTAL"'
      currency = True
    end
    object qrFichaApTIPO_OS: TIBStringField
      DisplayLabel = 'Tipo Os/Orc'
      FieldName = 'TIPO_OS'
      Origin = '"PEDVENDA"."TIPO_OS"'
      Size = 10
    end
    object qrFichaApNOM_EQUIP: TIBStringField
      DisplayLabel = 'Equipamento'
      FieldName = 'NOM_EQUIP'
      Origin = '"EQUIPAMENTO"."NOM_EQUIP"'
      Size = 32
    end
    object qrFichaApNOME_CLIENTE: TIBStringField
      DisplayLabel = 'Nome Fantasia Cliente'
      FieldName = 'NOME_CLIENTE'
      Origin = '"CLIENTES"."NOME_CLIENTE"'
      Required = True
      Size = 35
    end
    object qrFichaApRAZAO: TIBStringField
      DisplayLabel = 'Razao Social Cliente'
      FieldName = 'RAZAO'
      Origin = '"CLIENTES"."RAZAO"'
      Required = True
      Size = 60
    end
  end
  object qritFicha: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransPedVenda
    DataSource = dsFichaVeicApar
    SQL.Strings = (
      
        'SELECT OS.NPED AS N_OS, 2 ORDEM, '#39'SERVICOS'#39' TP, OS.COD_SERVICO, ' +
        #39'      '#39' COD_PROD, OS.QUANT_SERV_PED, OS.DESC_SERV_PED,'
      
        'OS.VALOR_UN_SERV, OS.VALOR_TOT_SERV, OS.PRC_INT_SERV, COR.NOME_V' +
        'ENDEDOR FROM PEDVENDA_SERV OS'
      
        'INNER JOIN COLABORADOR COR ON OS.COD_VENDEDOR = COR.COD_VENDEDOR' +
        ' AND OS.COD_EMPRESA = COR.COD_EMPRESA '
      'WHERE OS.NPED = :N_OS'
      'AND OS.TIPO = :TIPO'
      'AND OS.COD_EMPRESA = :COD_EMPRESA'
      'AND OS.ATIVO = 1'
      'AND ((OS.STATUS <> '#39'CANCELADO'#39') OR (OS.STATUS is null))'
      'union'
      
        'SELECT PR.NPED AS N_OS, 1 ORDEM, '#39'PRODUTOS'#39' TP, PR.GRUPO_PROD, P' +
        'R.COD_PROD, PR.QUANT_PED_ITEM,'
      
        'PR.DESCR_PROD_PED, PR.VLUN_PED_ITEM, PR.VLTOT_PED_ITEM, CAST('#39'0.' +
        '00'#39' AS DOUBLE PRECISION),'
      'COR.NOME_VENDEDOR '
      'FROM PEDVENDA_PROD PR'
      
        'INNER JOIN COLABORADOR COR ON PR.COD_VENDEDOR = COR.COD_VENDEDOR' +
        ' AND PR.COD_EMPRESA = COR.COD_EMPRESA '
      'WHERE PR.NPED = :N_OS'
      'AND PR.TIPO = :TIPO'
      'AND PR.COD_EMPRESA = :COD_EMPRESA'
      'AND PR.ATIVO = 1'
      'and ((PR.STATUS <> '#39'CANCELADO'#39') OR (PR.STATUS IS NULL))'
      'union'
      
        'SELECT PVST.NPED AS N_OS, 4 ORDEM, '#39'SRVTERC '#39' TP, CAST(0 AS INTE' +
        'GER), '#39'      '#39' COD_PROD, CAST('#39'0.00'#39' AS DOUBLE PRECISION),'
      
        'PVST.DESCR_SERVT, PVST.VL_SERVT, PVST.VL_SERVT, CAST('#39'0.00'#39' AS D' +
        'OUBLE PRECISION), CAST('#39#39' AS CHAR(35))'
      'FROM PEDVENDA_SERV_TERC PVST'
      'WHERE PVST.NPED = :N_OS'
      'AND PVST.TIPO = :TIPO'
      'AND PVST.COD_EMPRESA = :COD_EMPRESA'
      'AND PVST.ATIVO = 1'
      'union'
      
        'SELECT PVPT.NPED AS N_OS, 3 ORDEM, '#39'PRDTERC '#39' TP, CAST(0 AS INTE' +
        'GER), '#39'      '#39' COD_PROD, CAST('#39'0.00'#39' AS DOUBLE PRECISION),'
      
        'PVPT.DESCRICAO, PVPT.VL_UNIT, PVPT.VL_TOTAL, CAST('#39'0.00'#39' AS DOUB' +
        'LE PRECISION), CAST('#39#39' AS CHAR(35))'
      'FROM PEDVENDA_PROD_TERC PVPT'
      'WHERE PVPT.NPED = :N_OS'
      'AND PVPT.TIPO = :TIPO'
      'AND PVPT.COD_EMPRESA = :COD_EMPRESA'
      'AND PVPT.ATIVO = 1'
      'ORDER BY 1, 2')
    Left = 906
    Top = 243
    ParamData = <
      item
        DataType = ftInteger
        Name = 'N_OS'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'tipo'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'cod_empresa'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'N_OS'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'TIPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'COD_EMPRESA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'N_OS'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'TIPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'COD_EMPRESA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'N_OS'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'TIPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'COD_EMPRESA'
        ParamType = ptUnknown
      end>
    object qritFichaTP: TIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TP'
      ProviderFlags = []
      FixedChar = True
      Size = 8
    end
    object qritFichaCOD_SERVICO: TIntegerField
      DisplayLabel = 'Serv/Grupo'
      FieldName = 'COD_SERVICO'
      Origin = '"PEDVENDA_SERV"."COD_SERVICO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qritFichaCOD_PROD: TIBStringField
      DisplayLabel = 'Cod Prod'
      FieldName = 'COD_PROD'
      ProviderFlags = []
      FixedChar = True
      Size = 6
    end
    object qritFichaQUANT_SERV_PED: TFloatField
      DisplayLabel = 'Quantidade'
      FieldName = 'QUANT_SERV_PED'
      Origin = '"PEDVENDA_SERV"."QUANT_SERV_PED"'
      DisplayFormat = '##0.000'
    end
    object qritFichaDESC_SERV_PED: TIBStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESC_SERV_PED'
      ProviderFlags = []
      Size = 75
    end
    object qritFichaVALOR_UN_SERV: TFloatField
      DisplayLabel = 'Valor Unit'
      FieldName = 'VALOR_UN_SERV'
      Origin = '"PEDVENDA_SERV"."VALOR_UN_SERV"'
      currency = True
    end
    object qritFichaVALOR_TOT_SERV: TFloatField
      DisplayLabel = 'Valor Total'
      FieldName = 'VALOR_TOT_SERV'
      Origin = '"PEDVENDA_SERV"."VALOR_TOT_SERV"'
      currency = True
    end
    object qritFichaPRC_INT_SERV: TFloatField
      DisplayLabel = 'Pre'#231'o Int Serv'
      FieldName = 'PRC_INT_SERV'
      Origin = '"PEDVENDA_SERV"."PRC_INT_SERV"'
      currency = True
    end
    object qritFichaNOME_VENDEDOR: TIBStringField
      DisplayLabel = 'Vendedor'
      FieldName = 'NOME_VENDEDOR'
      Origin = '"COLABORADOR"."NOME_VENDEDOR"'
      Size = 35
    end
  end
  object dsFichaVeicApar: TDataSource
    DataSet = qrFichaV
    Left = 573
    Top = 474
  end
  object dsItFicha: TDataSource
    DataSet = qritFicha
    Left = 907
    Top = 286
  end
  object dspSubG: TDataSetProvider
    DataSet = qrSubG
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 407
    Top = 281
  end
  object qrSubG: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransPedVenda
    SQL.Strings = (
      'select * from SUB_GRUPO')
    Left = 407
    Top = 237
  end
  object cdsSubG: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSubG'
    BeforeOpen = cdsPedVendaBeforeOpen
    Left = 407
    Top = 324
    object cdsSubGCODIGO_SUBGR: TIntegerField
      FieldName = 'CODIGO_SUBGR'
      Required = True
    end
    object cdsSubGDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 80
    end
    object cdsSubGCOD_GRUPO: TIntegerField
      FieldName = 'COD_GRUPO'
    end
    object cdsSubGATIVO: TIntegerField
      FieldName = 'ATIVO'
    end
    object cdsSubGSUBSERVICO: TStringField
      FieldName = 'SUBSERVICO'
      FixedChar = True
      Size = 1
    end
  end
  object dsSubG: TDataSource
    DataSet = cdsSubG
    Left = 403
    Top = 366
  end
  object rdPedido: TRDprint
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
    OpcoesPreview.CaptionPreview = 'Impress'#227'o Vendas'
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
    PortaComunicacao = 'LPT1'
    MostrarProgresso = True
    TamanhoQteLinhas = 33
    TamanhoQteColunas = 133
    TamanhoQteLPP = Seis
    NumerodeCopias = 1
    FonteTamanhoPadrao = S17cpp
    FonteEstiloPadrao = []
    Orientacao = poPortrait
    Left = 433
    Top = 65535
  end
  object dspSinc: TDataSetProvider
    DataSet = qrSinc
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 827
    Top = 88
  end
  object cdsSinc: TClientDataSet
    Aggregates = <>
    PacketRecords = 10
    Params = <>
    ProviderName = 'dspSinc'
    BeforeOpen = cdsPedVendaBeforeOpen
    Left = 827
    Top = 130
  end
  object qrSinc: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransPedVenda
    SQL.Strings = (
      'select * from PEDVENDA'
      
        '/*select pedvenda.*,clientes.nome_cliente from pedvenda inner jo' +
        'in clientes on pedvenda.cod_cliente=clientes.cod_cliente and ped' +
        'venda.cod_empresa=clientes.cod_empresa where 1=0*/')
    Left = 827
    Top = 43
  end
  object dspMecOs: TDataSetProvider
    DataSet = qrMecOs
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 461
    Top = 282
  end
  object qrMecOs: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransPedVenda
    SQL.Strings = (
      
        'select mo.*, col.nome_vendedor from mecanico_os mo inner join co' +
        'laborador col'
      
        'on col.cod_vendedor = mo.cod_vendedor and col.cod_empresa = mo.c' +
        'od_empresa')
    Left = 461
    Top = 238
    object qrMecOsCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
      Origin = '"MECANICO_OS"."COD_VENDEDOR"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrMecOsNPED: TIntegerField
      FieldName = 'NPED'
      Origin = '"MECANICO_OS"."NPED"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrMecOsTIPO: TIBStringField
      FieldName = 'TIPO'
      Origin = '"MECANICO_OS"."TIPO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 3
    end
    object qrMecOsCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Origin = '"MECANICO_OS"."COD_EMPRESA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrMecOsCOD_SERVICO: TIntegerField
      FieldName = 'COD_SERVICO'
      Origin = '"MECANICO_OS"."COD_SERVICO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrMecOsCODIGO_NOP: TFloatField
      FieldName = 'CODIGO_NOP'
      Origin = '"MECANICO_OS"."CODIGO_NOP"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qrMecOsPER_COMISSAO: TFloatField
      FieldName = 'PER_COMISSAO'
      Origin = '"MECANICO_OS"."PER_COMISSAO"'
    end
    object qrMecOsN_OS: TIntegerField
      FieldName = 'N_OS'
      Origin = '"MECANICO_OS"."N_OS"'
    end
    object qrMecOsNOME_VENDEDOR: TIBStringField
      FieldName = 'NOME_VENDEDOR'
      Origin = '"COLABORADOR"."NOME_VENDEDOR"'
      ProviderFlags = []
      ReadOnly = True
      Size = 35
    end
  end
  object cdsMecOs: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspMecOs'
    BeforeOpen = cdsPedVendaBeforeOpen
    Left = 461
    Top = 325
    object cdsMecOsCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
      Required = True
    end
    object cdsMecOsNPED: TIntegerField
      FieldName = 'NPED'
      Required = True
    end
    object cdsMecOsTIPO: TStringField
      FieldName = 'TIPO'
      Required = True
      FixedChar = True
      Size = 3
    end
    object cdsMecOsCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsMecOsCOD_SERVICO: TIntegerField
      FieldName = 'COD_SERVICO'
      Required = True
    end
    object cdsMecOsCODIGO_NOP: TFloatField
      FieldName = 'CODIGO_NOP'
    end
    object cdsMecOsPER_COMISSAO: TFloatField
      FieldName = 'PER_COMISSAO'
    end
    object cdsMecOsN_OS: TIntegerField
      FieldName = 'N_OS'
    end
    object cdsMecOsNOME_VENDEDOR: TStringField
      FieldName = 'NOME_VENDEDOR'
      ProviderFlags = [pfInWhere]
      Size = 35
    end
  end
  object dsMecOs: TDataSource
    DataSet = cdsMecOs
    Left = 463
    Top = 367
  end
  object cdsMecOsTemp: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 584
    Data = {
      910000009619E0BD01000000180000000600000000000300000091000C434F44
      5F56454E4445444F5204000100000000000B434F445F5345525649434F040001
      00000000000A434F4449474F5F4E4F500800040000000000044E504544040001
      00000000000C5045525F434F4D495353414F0800040000000000045449504F01
      004900000001000557494454480200020003000000}
    object cdsMecOsTempCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
    end
    object cdsMecOsTempCOD_SERVICO: TIntegerField
      FieldName = 'COD_SERVICO'
    end
    object cdsMecOsTempCODIGO_NOP: TFloatField
      FieldName = 'CODIGO_NOP'
    end
    object cdsMecOsTempNPED: TIntegerField
      FieldName = 'NPED'
    end
    object cdsMecOsTempPER_COMISSAO: TFloatField
      FieldName = 'PER_COMISSAO'
    end
    object cdsMecOsTempTIPO: TStringField
      FieldName = 'TIPO'
      Size = 3
    end
  end
  object dspGrade: TDataSetProvider
    DataSet = qrGrade
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 515
    Top = 284
  end
  object qrGrade: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransPedVenda
    SQL.Strings = (
      'select * from GRADE')
    Left = 515
    Top = 240
  end
  object cdsGrade: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspGrade'
    BeforeOpen = cdsPedVendaBeforeOpen
    Left = 515
    Top = 327
    object cdsGradeCOD_GRADE: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_GRADE'
      Required = True
    end
    object cdsGradeDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o 1'
      FieldName = 'DESCRICAO'
      FixedChar = True
      Size = 32
    end
    object cdsGradeDESCRICAO1: TStringField
      DisplayLabel = 'Descri'#231#227'o 2'
      FieldName = 'DESCRICAO1'
      FixedChar = True
      Size = 32
    end
    object cdsGradeQUANTIDADE: TFloatField
      FieldKind = fkCalculated
      FieldName = 'QUANTIDADE'
      DisplayFormat = '##0.00'
      Calculated = True
    end
  end
  object dsGrade: TDataSource
    AutoEdit = False
    DataSet = cdsGrade
    Left = 517
    Top = 369
  end
  object SpBxGradeEst: TIBStoredProc
    Database = dtmAtivo.bancoHw
    Transaction = IBTransPedVenda
    StoredProcName = 'BAIXA_ESTOQUE_GRADE'
    Left = 496
  end
  object dspGradeEst: TDataSetProvider
    DataSet = qrGradeEst
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 575
    Top = 284
  end
  object qrGradeEst: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransPedVenda
    SQL.Strings = (
      'select g.descricao, g.descricao1, cgp.* from cod_grade_prod cgp'
      
        'inner join grade g on g.cod_grade = cgp.cod_grade and g.cod_empr' +
        'esa = cgp.cod_empresa')
    Left = 575
    Top = 240
  end
  object cdsGradeEst: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspGradeEst'
    BeforeOpen = cdsPedVendaBeforeOpen
    Left = 575
    Top = 327
    object IntegerField1: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_GRADE'
      Required = True
    end
    object StringField5: TStringField
      DisplayLabel = 'Descri'#231#227'o 1'
      FieldName = 'DESCRICAO'
      FixedChar = True
      Size = 32
    end
    object StringField6: TStringField
      DisplayLabel = 'Descri'#231#227'o 2'
      FieldName = 'DESCRICAO1'
      FixedChar = True
      Size = 32
    end
    object cdsGradeEstGRUPO_PROD: TIntegerField
      DisplayLabel = 'Grupo'
      FieldName = 'GRUPO_PROD'
      Required = True
    end
    object cdsGradeEstCOD_PROD: TStringField
      DisplayLabel = 'C'#243'd. Prod.'
      FieldName = 'COD_PROD'
      Required = True
      FixedChar = True
      Size = 6
    end
    object cdsGradeEstCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Visible = False
    end
    object cdsGradeEstQTDE: TFloatField
      DisplayLabel = 'Quantidade'
      FieldName = 'QTDE'
    end
    object cdsGradeEstATIVO: TIntegerField
      FieldName = 'ATIVO'
      Visible = False
    end
    object cdsGradeEstQtdeItem: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'QtdeItem'
    end
  end
  object dsGradeEst: TDataSource
    AutoEdit = False
    DataSet = cdsGradeEst
    Left = 573
    Top = 369
  end
  object dspGradeVnd: TDataSetProvider
    DataSet = qrGradeVnd
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 644
    Top = 284
  end
  object qrGradeVnd: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransPedVenda
    SQL.Strings = (
      'select * from COD_GRADE_PROD_VENDA')
    Left = 644
    Top = 240
  end
  object dsGradeVnd: TDataSource
    AutoEdit = False
    DataSet = cdsGradeVnd
    Left = 642
    Top = 369
  end
  object cdsGradeVnd: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspGradeVnd'
    BeforeOpen = cdsPedVendaBeforeOpen
    Left = 644
    Top = 326
    object cdsGradeVndNREQ: TIntegerField
      FieldName = 'NREQ'
      Required = True
    end
    object cdsGradeVndGRUPO_PROD: TIntegerField
      FieldName = 'GRUPO_PROD'
      Required = True
    end
    object cdsGradeVndCOD_PROD: TStringField
      FieldName = 'COD_PROD'
      Required = True
      FixedChar = True
      Size = 6
    end
    object cdsGradeVndCOD_GRADE: TIntegerField
      FieldName = 'COD_GRADE'
      Required = True
    end
    object cdsGradeVndCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsGradeVndQTDE: TFloatField
      FieldName = 'QTDE'
    end
    object cdsGradeVndTIPO: TStringField
      FieldName = 'TIPO'
      Required = True
      FixedChar = True
      Size = 3
    end
  end
  object cdsGradeVndTemp: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    BeforeOpen = cdsPedVendaBeforeOpen
    Left = 667
    Top = 2
    Data = {
      A30000009619E0BD010000001800000007000000000003000000A300044E5245
      5104000100040000000A475255504F5F50524F44040001000400000008434F44
      5F50524F44010049000400010005574944544802000200060009434F445F4752
      41444504000100040000000B434F445F454D5052455341040001000400000004
      515444450800040000000000045449504F010049000400010005574944544802
      00020003000000}
    object IntegerField2: TIntegerField
      FieldName = 'NREQ'
      Required = True
    end
    object IntegerField3: TIntegerField
      FieldName = 'GRUPO_PROD'
      Required = True
    end
    object StringField7: TStringField
      FieldName = 'COD_PROD'
      Required = True
      FixedChar = True
      Size = 6
    end
    object IntegerField7: TIntegerField
      FieldName = 'COD_GRADE'
      Required = True
    end
    object IntegerField8: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object FloatField1: TFloatField
      FieldName = 'QTDE'
    end
    object StringField8: TStringField
      FieldName = 'TIPO'
      Required = True
      FixedChar = True
      Size = 3
    end
  end
  object qrDetalhes: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransPedVenda
    SQL.Strings = (
      
        'SELECT fp.data_mov,fp.tpdocs,fp.nrequisicao,fp.ndoc,ctr.nome_ctr' +
        'l,fp.cliente,'
      'fp.historico,fp.valordoc,fp.data_venc,fp.terceiros  '
      'FROM FORMPAGAMENTO fp,'
      'Controles ctr   WHERE  (fp.NREQUISICAO = :REQ) AND'
      
        'fp.TPDOCS = :VTPDOCS and fp.ativo=1 and fp.cod_controle = ctr.co' +
        'digo_ctrl '
      'and fp.cod_empresa = ctr.codigo_emp')
    Left = 503
    Top = 426
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'REQ'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'VTPDOCS'
        ParamType = ptUnknown
      end>
    object qrDetalhesDATA_MOV: TDateTimeField
      DisplayLabel = 'Data Movimento'
      FieldName = 'DATA_MOV'
      Origin = '"FORMPAGAMENTO"."DATA_MOV"'
    end
    object qrDetalhesTPDOCS: TIBStringField
      DisplayLabel = 'DOC'
      FieldName = 'TPDOCS'
      Origin = '"FORMPAGAMENTO"."TPDOCS"'
      Size = 6
    end
    object qrDetalhesNREQUISICAO: TIntegerField
      DisplayLabel = 'Numero'
      FieldName = 'NREQUISICAO'
      Origin = '"FORMPAGAMENTO"."NREQUISICAO"'
    end
    object qrDetalhesNDOC: TIBStringField
      DisplayLabel = 'Num DOC'
      FieldName = 'NDOC'
      Origin = '"FORMPAGAMENTO"."NDOC"'
    end
    object qrDetalhesNOME_CTRL: TIBStringField
      DisplayLabel = 'Controle'
      FieldName = 'NOME_CTRL'
      Origin = '"CONTROLES"."NOME_CTRL"'
      Size = 35
    end
    object qrDetalhesCLIENTE: TIBStringField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
      Origin = '"FORMPAGAMENTO"."CLIENTE"'
      Size = 60
    end
    object qrDetalhesHISTORICO: TIBStringField
      DisplayLabel = 'Hist'#243'rico'
      FieldName = 'HISTORICO'
      Origin = '"FORMPAGAMENTO"."HISTORICO"'
      Size = 80
    end
    object qrDetalhesVALORDOC: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VALORDOC'
      Origin = '"FORMPAGAMENTO"."VALORDOC"'
      currency = True
    end
    object qrDetalhesDATA_VENC: TDateTimeField
      DisplayLabel = 'Vencimento'
      FieldName = 'DATA_VENC'
      Origin = '"FORMPAGAMENTO"."DATA_VENC"'
    end
    object qrDetalhesTERCEIROS: TIBStringField
      DisplayLabel = 'Terceiros'
      FieldName = 'TERCEIROS'
      Origin = '"FORMPAGAMENTO"."TERCEIROS"'
      Size = 80
    end
  end
  object dsDetalhes: TDataSource
    AutoEdit = False
    DataSet = qrDetalhes
    Left = 503
    Top = 474
  end
  object cdsProdSim: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProdSim'
    BeforeOpen = cdsPedVendaBeforeOpen
    Left = 929
    Top = 130
    object cdsProdSimGRUPO_PROD: TIntegerField
      DisplayLabel = 'Grupo Prod'
      FieldName = 'GRUPO_PROD'
      Required = True
    end
    object cdsProdSimCOD_PROD: TStringField
      DisplayLabel = 'Cod Prod'
      FieldName = 'COD_PROD'
      Required = True
      FixedChar = True
      Size = 6
    end
    object cdsProdSimGRUPO_PS: TIntegerField
      DisplayLabel = 'Grupo Prod Sim'
      FieldName = 'GRUPO_PS'
      Required = True
    end
    object cdsProdSimCOD_PS: TStringField
      DisplayLabel = 'Cod Prod Sim'
      FieldName = 'COD_PS'
      Required = True
      FixedChar = True
      Size = 6
    end
    object cdsProdSimCOD_EMPRESA: TIntegerField
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsProdSimDESCPSIM: TStringField
      DisplayLabel = 'Descr Prod Sim'
      FieldName = 'DESCPSIM'
      FixedChar = True
    end
    object cdsProdSimESTOQUE: TFloatField
      DisplayLabel = 'Estoque Real'
      FieldName = 'ESTOQUE'
      DisplayFormat = '##0.000'
    end
  end
  object dspProdSim: TDataSetProvider
    DataSet = qrProdSim
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 928
    Top = 88
  end
  object qrProdSim: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransPedVenda
    SQL.Strings = (
      'select ps.*,'
      
        '(select estoque from getestoquedisponivel(ps.grupo_ps, ps.cod_ps' +
        ', 0, ps.cod_empresa, 0, '#39#39', 0, 0)) estoque from PROD_SIMILARES p' +
        's')
    Left = 928
    Top = 43
  end
  object qrProdTerceiro: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransPedVenda
    SQL.Strings = (
      'select * from PEDVENDA_PROD_TERC')
    Left = 758
    Top = 43
  end
  object dspProdTerceiro: TDataSetProvider
    DataSet = qrProdTerceiro
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 758
    Top = 87
  end
  object cdsProdTerceiro: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProdTerceiro'
    BeforeOpen = cdsItemProdBeforeOpen
    Left = 763
    Top = 130
    object cdsProdTerceiroSEL: TStringField
      DisplayLabel = 'Sel'
      FieldKind = fkInternalCalc
      FieldName = 'SEL'
      Size = 1
    end
    object IntegerField9: TIntegerField
      Tag = 1
      DisplayLabel = 'N'#186' Venda'
      FieldName = 'NPED'
      Origin = '"PEDVENDA_PROD_TERC"."NPED"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object StringField9: TStringField
      Tag = 2
      DisplayLabel = 'Descri'#231#227'o do Produto'
      FieldName = 'DESCRICAO'
      Origin = '"PEDVENDA_PROD_TERC"."DESCRICAO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 50
    end
    object FloatField2: TFloatField
      Tag = 2
      DisplayLabel = 'Qtde'
      FieldName = 'QTDE'
      Origin = '"PEDVENDA_PROD_TERC"."QTDE"'
    end
    object FloatField3: TFloatField
      Tag = 2
      DisplayLabel = 'Val. Unit'#225'rio'
      FieldName = 'VL_UNIT'
      Origin = '"PEDVENDA_PROD_TERC"."VL_UNIT"'
    end
    object FloatField4: TFloatField
      Tag = 2
      DisplayLabel = 'Val. Total'
      FieldName = 'VL_TOTAL'
      Origin = '"PEDVENDA_PROD_TERC"."VL_TOTAL"'
    end
    object StringField10: TStringField
      Tag = 2
      DisplayLabel = 'Unidade'
      FieldName = 'UNIDADE'
      Origin = '"PEDVENDA_PROD_TERC"."UNIDADE"'
      FixedChar = True
      Size = 2
    end
    object cdsProdTerceiroVLCUSTO_TOT: TFloatField
      Tag = 2
      DisplayLabel = 'Custo Total'
      FieldName = 'VLCUSTO_TOT'
    end
    object cdsProdTerceiroNOME_FORNECEDOR: TStringField
      Tag = 2
      DisplayLabel = 'Fornecedor'
      FieldName = 'NOME_FORNECEDOR'
      Size = 35
    end
    object IntegerField11: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod. Vendedor'
      FieldName = 'COD_VENDEDOR'
      Origin = '"PEDVENDA_PROD_TERC"."COD_VENDEDOR"'
    end
    object IntegerField10: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Origin = '"PEDVENDA_PROD_TERC"."COD_EMPRESA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsProdTerceiroVLCUSTO: TFloatField
      Tag = 1
      DisplayLabel = 'Custo Unit'#225'rio'
      FieldName = 'VLCUSTO'
    end
    object cdsProdTerceiroATIVO: TIntegerField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
    object StringField11: TStringField
      Tag = 1
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Origin = '"PEDVENDA_PROD_TERC"."TIPO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 3
    end
    object cdsProdTerceiroCOD_FORNECEDOR: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Fornecedor'
      FieldName = 'COD_FORNECEDOR'
    end
    object cdsProdTerceiroSEQID: TIntegerField
      Tag = 1
      DisplayLabel = 'SeqId'
      FieldName = 'SEQID'
    end
    object cdsProdTerceiroNPEDORIGINADO: TIntegerField
      Tag = 1
      FieldName = 'NPEDORIGINADO'
    end
    object cdsProdTerceiroTIPOORIGINADO: TStringField
      Tag = 1
      FieldName = 'TIPOORIGINADO'
      FixedChar = True
      Size = 3
    end
    object cdsProdTerceiroNPED_ORIGEM: TIntegerField
      Tag = 1
      FieldName = 'NPED_ORIGEM'
    end
    object cdsProdTerceiroTIPO_ORIGEM: TStringField
      Tag = 1
      FieldName = 'TIPO_ORIGEM'
      FixedChar = True
      Size = 3
    end
  end
  object cdsKitPed: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspKitPed'
    BeforeOpen = cdsPedVendaBeforeOpen
    Left = 706
    Top = 326
    object cdsKitPedCODIGO_KIT: TIntegerField
      DisplayLabel = 'C'#243'digo Kit'
      FieldName = 'CODIGO_KIT'
      Required = True
    end
    object cdsKitPedDESCRICAO_KIT: TStringField
      DisplayLabel = 'Descri'#231#227'o do Kit'
      FieldName = 'DESCRICAO_KIT'
      FixedChar = True
      Size = 40
    end
    object cdsKitPedKIT_TODO: TStringField
      DisplayLabel = 'Usar o Kit Todo'
      FieldName = 'KIT_TODO'
      FixedChar = True
      Size = 1
    end
  end
  object dspKitPed: TDataSetProvider
    DataSet = qrKitPed
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 705
    Top = 283
  end
  object qrKitPed: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransPedVenda
    SQL.Strings = (
      'select * from KITS_PROD')
    Left = 705
    Top = 239
  end
  object cdsPKit: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPKit'
    BeforeOpen = cdsPedVendaBeforeOpen
    Left = 757
    Top = 325
    object cdsPKitGRUPO_PROD: TIntegerField
      DisplayLabel = 'Grupo'
      FieldName = 'GRUPO_PROD'
      Required = True
    end
    object cdsPKitCOD_PROD: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_PROD'
      Required = True
      FixedChar = True
      Size = 6
    end
    object cdsPKitQUANT_PROD_KIT: TFloatField
      DisplayLabel = 'Quantidade'
      FieldName = 'QUANT_PROD_KIT'
    end
    object cdsPKitNUM_FAB_PROD: TStringField
      DisplayLabel = 'Num Fab Produto'
      FieldName = 'NUM_FAB_PROD'
      FixedChar = True
    end
    object cdsPKitDESCR_PROD: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCR_PROD'
      FixedChar = True
      Size = 75
    end
    object cdsPKitCODIGO_KIT: TIntegerField
      FieldName = 'CODIGO_KIT'
      Required = True
    end
  end
  object dspPKit: TDataSetProvider
    DataSet = qrPKit
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 756
    Top = 283
  end
  object qrPKit: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransPedVenda
    SQL.Strings = (
      'select kp.grupo_prod, kp.cod_prod, kp.quant_prod_kit,'
      
        'p.num_fab_prod, p.descr_prod,kp.codigo_kit from kits_prod_kits k' +
        'p'
      
        'inner join produtos p on p.grupo_prod = kp.grupo_prod and p.cod_' +
        'prod = kp.cod_prod and'
      'p.cod_empresa = kp.cod_empresa')
    Left = 756
    Top = 239
  end
  object dsKitPed: TDataSource
    AutoEdit = False
    DataSet = cdsKitPed
    Left = 706
    Top = 368
  end
  object dsPKit: TDataSource
    AutoEdit = False
    DataSet = cdsPKit
    Left = 757
    Top = 368
  end
  object SpVoltaGradeEst: TIBStoredProc
    Database = dtmAtivo.bancoHw
    Transaction = IBTransPedVenda
    StoredProcName = 'VOLTA_ESTOQUE_GRADE'
    Left = 952
  end
  object cdsItemProdTemp: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 32
    Top = 384
    object cdsItemProdTempNPED: TIntegerField
      DisplayLabel = 'N'#186' Venda'
      FieldName = 'NPED'
    end
    object cdsItemProdTempNITEM: TIntegerField
      DisplayLabel = 'N'#186' Item'
      FieldName = 'NITEM'
    end
    object cdsItemProdTempGRUPO_PROD: TIntegerField
      DisplayLabel = 'Grupo'
      FieldName = 'GRUPO_PROD'
    end
    object cdsItemProdTempCOD_PROD: TStringField
      DisplayLabel = 'Cod Prod'
      FieldName = 'COD_PROD'
      Size = 6
    end
    object cdsItemProdTempQUANT_PED_ITEM: TFloatField
      DisplayLabel = 'Qtde (Un Princ)'
      FieldName = 'QUANT_PED_ITEM'
    end
    object cdsItemProdTempVLUN_PED_ITEM: TFloatField
      DisplayLabel = 'Val. Unit'#225'rio Bruto (Un Princ)'
      FieldName = 'VLUN_PED_ITEM'
    end
    object cdsItemProdTempVLUN_PED_ITEM_LIQ: TFloatField
      DisplayLabel = 'Val. Unit'#225'rio Liq (Un Princ)'
      FieldKind = fkInternalCalc
      FieldName = 'VLUN_PED_ITEM_LIQ'
    end
    object cdsItemProdTempVLTOT_PED_ITEM: TFloatField
      DisplayLabel = 'Total Bruto'
      FieldName = 'VLTOT_PED_ITEM'
    end
    object cdsItemProdTempNUM_FAB_PROD: TStringField
      DisplayLabel = 'Num. Fabrica'#231#227'o'
      FieldName = 'NUM_FAB_PROD'
    end
    object cdsItemProdTempDESCR_PROD_PED: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCR_PROD_PED'
      Size = 75
    end
    object cdsItemProdTempCOD_GRADE: TIntegerField
      DisplayLabel = 'Cod Grade'
      FieldName = 'COD_GRADE'
    end
    object cdsItemProdTempSTATUS: TStringField
      DisplayLabel = 'Status Item'
      FieldName = 'STATUS'
      Size = 10
    end
    object cdsItemProdTempTIPO: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object cdsItemProdTempRATEIO_ACRESC: TFloatField
      DisplayLabel = 'Rateio do Acr'#233'scimo'
      FieldName = 'RATEIO_ACRESC'
    end
    object cdsItemProdTempCODIGO_NOP: TFloatField
      DisplayLabel = 'Nat. Opera'#231#227'o'
      FieldName = 'CODIGO_NOP'
    end
    object cdsItemProdTempCOD_EMPRESA: TIntegerField
      DisplayLabel = 'Cod. Empresa'
      FieldName = 'COD_EMPRESA'
    end
    object cdsItemProdTempACRESC_ITEM: TFloatField
      DisplayLabel = 'Acrescimo no Item'
      FieldName = 'ACRESC_ITEM'
    end
    object cdsItemProdTempRATEIO_DESC: TFloatField
      DisplayLabel = 'Rateio do Desconto'
      FieldName = 'RATEIO_DESC'
    end
    object cdsItemProdTempDESC_ITEM: TFloatField
      DisplayLabel = 'Desconto no Item'
      FieldName = 'DESC_ITEM'
    end
    object cdsItemProdTempTABPRATICADA: TStringField
      DisplayLabel = 'Pre'#231'o P/T/Q/N'
      FieldName = 'TABPRATICADA'
      FixedChar = True
      Size = 1
    end
    object cdsItemProdTempQUANT_ITEM_DEV: TFloatField
      DisplayLabel = 'Qtde Dev.'
      FieldName = 'QUANT_ITEM_DEV'
    end
    object cdsItemProdTempMAX_DESC_TAB: TFloatField
      FieldName = 'MAX_DESC_TAB'
    end
    object cdsItemProdTempCOD_PEDIDO: TIntegerField
      FieldName = 'COD_PEDIDO'
    end
    object cdsItemProdTempNITEM_PEDIDO: TIntegerField
      FieldName = 'NITEM_PEDIDO'
    end
    object cdsItemProdTempCOD_NSERIE: TIntegerField
      FieldName = 'COD_NSERIE'
    end
    object cdsItemProdTempVALOR_DESCACRES: TFloatField
      FieldName = 'VALOR_DESCACRES'
    end
    object cdsItemProdTempPRECOPORQTDE: TStringField
      FieldName = 'PRECOPORQTDE'
      Size = 1
    end
    object cdsItemProdTempNF_DC_DESPNF: TFloatField
      FieldName = 'NF_DC_DESPNF'
    end
    object cdsItemProdTempID_KIT: TIntegerField
      FieldName = 'ID_KIT'
    end
    object cdsItemProdTempDESCRICAO_KIT_ID_KIT: TStringField
      FieldName = 'DESCRICAO_KIT_ID_KIT'
      Size = 80
    end
    object cdsItemProdTempUNIDADE_CONV: TStringField
      FieldName = 'UNIDADE_CONV'
      Size = 6
    end
    object cdsItemProdTempOPERACAO_CONV: TStringField
      FieldName = 'OPERACAO_CONV'
      Size = 1
    end
    object cdsItemProdTempFATOR_CONV: TFloatField
      FieldName = 'FATOR_CONV'
    end
    object cdsItemProdTempUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 6
    end
    object cdsItemProdTempMAX_DESC_TAB_TEMP: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'MAX_DESC_TAB_TEMP'
    end
    object cdsItemProdTempFATOR_CONV_TEMP: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'FATOR_CONV_TEMP'
      Size = 50
    end
    object cdsItemProdTempVLTOT_PED_ITEM_LIQ: TFloatField
      DisplayLabel = 'Total Liq'
      FieldKind = fkInternalCalc
      FieldName = 'VLTOT_PED_ITEM_LIQ'
    end
    object cdsItemProdTempCALC_COMISSAO_CONDPAG_VEND: TStringField
      FieldName = 'CALC_COMISSAO_CONDPAG_VEND'
      Size = 1
    end
    object cdsItemProdTempPERC_COMISSAO_CONDPAG: TFloatField
      FieldName = 'PERC_COMISSAO_CONDPAG'
    end
    object cdsItemProdTempPERC_COMISSAO_VEND3: TFloatField
      FieldName = 'PERC_COMISSAO_VEND3'
    end
    object cdsItemProdTempVLUN_ORIG: TFloatField
      FieldName = 'VLUN_ORIG'
    end
    object cdsItemProdTempPERMITIR_DESCONTO: TStringField
      FieldName = 'PERMITIR_DESCONTO'
      Size = 1
    end
    object cdsItemProdTempUSAR_DEBCRED: TStringField
      FieldName = 'USAR_DEBCRED'
      Size = 1
    end
    object cdsItemProdTempVLUN_PED_ITEM_CONV_LIQ: TFloatField
      DisplayLabel = 'Val. Unit'#225'rio Liq'
      FieldKind = fkInternalCalc
      FieldName = 'VLUN_PED_ITEM_CONV_LIQ'
    end
    object cdsItemProdTempVLUN_PED_ITEM_CONV: TFloatField
      DisplayLabel = 'Val. Unit'#225'rio Bruto'
      FieldKind = fkInternalCalc
      FieldName = 'VLUN_PED_ITEM_CONV'
    end
    object cdsItemProdTempQUANT_PED_ITEM_CONV: TFloatField
      DisplayLabel = 'Qtde'
      FieldKind = fkInternalCalc
      FieldName = 'QUANT_PED_ITEM_CONV'
    end
  end
  object dspSincIt: TDataSetProvider
    DataSet = qrSincIt
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 872
    Top = 88
  end
  object cdsSincIt: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSincIt'
    BeforeOpen = cdsPedVendaBeforeOpen
    Left = 872
    Top = 130
  end
  object qrSincIt: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransPedVenda
    SQL.Strings = (
      '/*select * from PEDVENDA*/'
      
        'select pedvenda.*,clientes.nome_cliente from pedvenda inner join' +
        ' clientes on pedvenda.cod_cliente=clientes.cod_cliente and pedve' +
        'nda.cod_empresa=clientes.cod_empresa where 1=0')
    Left = 872
    Top = 43
  end
  object cdsItensVndTemp: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 854
    Top = 65530
  end
  object cdsItemServTemp: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 432
    Top = 449
    object cdsItemServTempNPED: TIntegerField
      FieldName = 'NPED'
    end
    object cdsItemServTempTIPO: TStringField
      FieldName = 'TIPO'
      Size = 3
    end
    object cdsItemServTempCOD_SERVICO: TIntegerField
      FieldName = 'COD_SERVICO'
    end
    object cdsItemServTempNITEM: TIntegerField
      FieldName = 'NITEM'
    end
    object cdsItemServTempCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
    end
    object cdsItemServTempCODIGO_NOP: TFloatField
      FieldName = 'CODIGO_NOP'
    end
    object cdsItemServTempQUANT_SERV_PED: TFloatField
      FieldName = 'QUANT_SERV_PED'
    end
    object cdsItemServTempVALOR_UN_SERV: TFloatField
      FieldName = 'VALOR_UN_SERV'
    end
    object cdsItemServTempVALOR_TOT_SERV: TFloatField
      FieldName = 'VALOR_TOT_SERV'
    end
    object cdsItemServTempSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 10
    end
    object cdsItemServTempRATEIO_ACRESC: TFloatField
      FieldName = 'RATEIO_ACRESC'
    end
    object cdsItemServTempACRESC_ITEM: TFloatField
      FieldName = 'ACRESC_ITEM'
    end
    object cdsItemServTempRATEIO_DESC: TFloatField
      FieldName = 'RATEIO_DESC'
    end
    object cdsItemServTempDESC_ITEM: TFloatField
      FieldName = 'DESC_ITEM'
    end
    object cdsItemServTempCOD_AGENDA: TIntegerField
      FieldName = 'COD_AGENDA'
    end
    object cdsItemServTempVALOR_UN_SERV_LIQ: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'VALOR_UN_SERV_LIQ'
    end
    object cdsItemServTempVALOR_TOT_SERV_LIQ: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'VALOR_TOT_SERV_LIQ'
    end
  end
  object dsItemProdTemp: TDataSource
    AutoEdit = False
    DataSet = cdsItemProdTemp
    Left = 31
    Top = 432
  end
  object cdsItemProdTemp3: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 328
    Top = 387
    object cdsItemProdTemp3SELEC: TStringField
      FieldName = 'SELEC'
      Size = 1
    end
    object cdsItemProdTemp3NPED: TIntegerField
      DisplayLabel = 'N'#186' Venda'
      FieldName = 'NPED'
    end
    object cdsItemProdTemp3NITEM: TIntegerField
      DisplayLabel = 'N'#186' Item'
      FieldName = 'NITEM'
    end
    object cdsItemProdTemp3GRUPO_PROD: TIntegerField
      DisplayLabel = 'Grupo'
      FieldName = 'GRUPO_PROD'
    end
    object cdsItemProdTemp3COD_PROD: TStringField
      DisplayLabel = 'Cod. Produto'
      FieldName = 'COD_PROD'
      Size = 6
    end
    object cdsItemProdTemp3COD_GRADE: TIntegerField
      DisplayLabel = 'Cod. Grade'
      FieldName = 'COD_GRADE'
    end
    object cdsItemProdTemp3NUM_FAB_PROD: TStringField
      DisplayLabel = 'Num. Fabrica'#231#227'o'
      FieldName = 'NUM_FAB_PROD'
    end
    object cdsItemProdTemp3DESCR_PROD_PED: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCR_PROD_PED'
      Size = 75
    end
    object cdsItemProdTemp3QUANT_PED_ITEM: TFloatField
      DisplayLabel = 'Qtde'
      FieldName = 'QUANT_PED_ITEM'
    end
    object cdsItemProdTemp3VLUN_PED_ITEM: TFloatField
      DisplayLabel = 'Val. Unit'#225'rio'
      FieldName = 'VLUN_PED_ITEM'
    end
    object cdsItemProdTemp3VLTOT_PED_ITEM: TFloatField
      DisplayLabel = 'Total Bruto'
      FieldName = 'VLTOT_PED_ITEM'
    end
    object cdsItemProdTemp3STATUS: TStringField
      DisplayLabel = 'Status Item'
      FieldName = 'STATUS'
      Size = 10
    end
    object cdsItemProdTemp3TIPO: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object cdsItemProdTemp3RATEIO_ACRESC: TFloatField
      DisplayLabel = 'Rateio do Acr'#233'scimo'
      FieldName = 'RATEIO_ACRESC'
    end
    object cdsItemProdTemp3CODIGO_NOP: TFloatField
      DisplayLabel = 'Nat. Opera'#231#227'o'
      FieldName = 'CODIGO_NOP'
    end
    object cdsItemProdTemp3COD_EMPRESA: TIntegerField
      DisplayLabel = 'Cod. Empresa'
      FieldName = 'COD_EMPRESA'
    end
    object cdsItemProdTemp3ACRESC_ITEM: TFloatField
      DisplayLabel = 'Acrescimo no Item'
      FieldName = 'ACRESC_ITEM'
    end
    object cdsItemProdTemp3RATEIO_DESC: TFloatField
      DisplayLabel = 'Rateio do Desconto'
      FieldName = 'RATEIO_DESC'
    end
    object cdsItemProdTemp3DESC_ITEM: TFloatField
      DisplayLabel = 'Desconto no Item'
      FieldName = 'DESC_ITEM'
    end
    object cdsItemProdTemp3ID_KIT: TIntegerField
      FieldName = 'ID_KIT'
    end
    object cdsItemProdTemp3DESCRICAO_KIT_ID_KIT: TStringField
      FieldName = 'DESCRICAO_KIT_ID_KIT'
      Size = 80
    end
  end
  object dsItemProdTemp2: TDataSource
    DataSet = cdsItemProdTemp2
    Left = 129
    Top = 430
  end
  object cdsItemServTemp3: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 332
    Top = 430
    object cdsItemServTemp3SELEC: TStringField
      FieldName = 'SELEC'
      Size = 1
    end
    object cdsItemServTemp3NPED: TIntegerField
      DisplayLabel = 'N'#186' Venda'
      FieldName = 'NPED'
      Required = True
    end
    object cdsItemServTemp3NITEM: TIntegerField
      DisplayLabel = 'N'#186' Item'
      FieldName = 'NITEM'
    end
    object cdsItemServTemp3COD_SERVICO: TIntegerField
      DisplayLabel = 'Cod. Servi'#231'o'
      FieldName = 'COD_SERVICO'
    end
    object cdsItemServTemp3CODIGO_NOP: TFloatField
      DisplayLabel = 'CFOP'
      FieldName = 'CODIGO_NOP'
    end
    object cdsItemServTemp3DESC_SERV_PED: TStringField
      DisplayLabel = 'Descri'#231#227'o Servi'#231'o'
      FieldName = 'DESC_SERV_PED'
      Size = 60
    end
    object cdsItemServTemp3NOME_VEND: TStringField
      DisplayLabel = 'Nome Mec'#226'nico'
      FieldName = 'NOME_VEND'
      Size = 35
    end
    object cdsItemServTemp3VALOR_UN_SERV: TFloatField
      DisplayLabel = 'Valor Unit'#225'rio'
      FieldName = 'VALOR_UN_SERV'
      currency = True
    end
    object cdsItemServTemp3QUANT_SERV_PED: TFloatField
      DisplayLabel = 'Qtde Servi'#231'o'
      FieldName = 'QUANT_SERV_PED'
    end
    object cdsItemServTemp3VALOR_TOT_SERV: TFloatField
      DisplayLabel = 'Valor Total'
      FieldName = 'VALOR_TOT_SERV'
      currency = True
    end
    object cdsItemServTemp3N_NF: TIntegerField
      DisplayLabel = 'N'#186' NF'
      FieldName = 'N_NF'
    end
    object cdsItemServTemp3PRC_INT_SERV: TFloatField
      DisplayLabel = 'Vl Interno Serv'
      FieldName = 'PRC_INT_SERV'
      currency = True
    end
    object cdsItemServTemp3RATEIO_DESC: TFloatField
      DisplayLabel = 'Rateio Desc'
      FieldName = 'RATEIO_DESC'
      currency = True
    end
    object cdsItemServTemp3RATEIO_ACRESC: TFloatField
      DisplayLabel = 'Rateio Acresc'
      FieldName = 'RATEIO_ACRESC'
      currency = True
    end
    object cdsItemServTemp3DESC_ITEM: TFloatField
      DisplayLabel = 'Desconto'
      FieldName = 'DESC_ITEM'
      currency = True
    end
    object cdsItemServTemp3ACRESC_ITEM: TFloatField
      DisplayLabel = 'Acr'#233'scimo'
      FieldName = 'ACRESC_ITEM'
      currency = True
    end
    object cdsItemServTemp3SUBGSERVICO: TIntegerField
      DisplayLabel = 'Sub Grupo'
      FieldName = 'SUBGSERVICO'
    end
    object cdsItemServTemp3NOME_VEND1: TStringField
      DisplayLabel = 'Nome Mec'#226'nico 1'
      FieldName = 'NOME_VEND1'
      Size = 35
    end
    object cdsItemServTemp3TMO_SERV: TFloatField
      FieldName = 'TMO_SERV'
      Visible = False
    end
    object cdsItemServTemp3TIPO: TStringField
      Tag = 2
      FieldName = 'TIPO'
      Visible = False
      FixedChar = True
      Size = 3
    end
    object cdsItemServTemp3ATIVO: TIntegerField
      Tag = 2
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
      Visible = False
    end
    object cdsItemServTemp3COD_VENDEDOR1: TIntegerField
      DisplayLabel = 'Cod Mec'#226'nico 2'
      FieldName = 'COD_VENDEDOR1'
      Visible = False
    end
    object cdsItemServTemp3VLUN_ORIG: TFloatField
      Tag = 2
      DisplayLabel = 'Valor Original'
      FieldName = 'VLUN_ORIG'
      Visible = False
    end
    object cdsItemServTemp3COD_VENDEDOR: TIntegerField
      DisplayLabel = 'Cod Mec'#226'nico 1'
      FieldName = 'COD_VENDEDOR'
      Visible = False
    end
    object cdsItemServTemp3COD_EMPRESA: TIntegerField
      Tag = 2
      FieldName = 'COD_EMPRESA'
      Visible = False
    end
    object cdsItemServTemp3STATUS: TStringField
      DisplayLabel = 'Status Item'
      FieldName = 'STATUS'
      Size = 10
    end
    object cdsItemServTemp3DAV_ORIGEM: TIntegerField
      DisplayLabel = 'DAV Origem'
      FieldName = 'DAV_ORIGEM'
    end
    object cdsItemServTemp3DATA_INCLUSAO: TDateTimeField
      DisplayLabel = 'Data Inclus'#227'o Item'
      FieldName = 'DATA_INCLUSAO'
    end
  end
  object dsItemServTemp2: TDataSource
    AutoEdit = False
    DataSet = cdsItemServTemp2
    Left = 230
    Top = 430
  end
  object cdsItemProdTemp2: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 134
    Top = 382
  end
  object cdsItemServTemp2: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 228
    Top = 384
  end
  object qritFicha2: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransPedVenda
    DataSource = dsFichaVeicApar
    SQL.Strings = (
      
        'SELECT '#39'SERVICOS'#39' tp,OS.cod_servico,'#39'      '#39' cod_prod,OS.quant_s' +
        'erv_ped,OS.desc_serv_ped,'
      'OS.VALOR_UN_SERV,OS.VALOR_TOT_SERV,OS.PRC_INT_SERV, '
      'COR.NOME_VENDEDOR'
      'FROM '
      'pedvenda_serv OS,COLABORADOR COR'
      'WHERE '
      
        'OS.nped = :N_OS AND OS.COD_VENDEDOR = COR.COD_VENDEDOR and os.ti' +
        'po = :tipo and'
      
        'os.cod_empresa = cor.cod_empresa and os.cod_empresa = :cod_empre' +
        'sa and os.ativo=1'
      'union'
      
        'SELECT '#39'PRODUTOS'#39' tp,PR.GRUPO_PROD,PR.COD_PROD,PR.quant_ped_item' +
        ','
      
        'PR.descr_prod_ped,PR.vlun_ped_item,PR.vltot_ped_item,CAST('#39'0.00'#39 +
        ' AS DOUBLE PRECISION),'
      'COR.NOME_VENDEDOR '
      'FROM pedvenda_prod PR,COLABORADOR COR'
      'WHERE '
      
        'PR.nped = :N_OS AND PR.COD_VENDEDOR = COR.COD_VENDEDOR and pr.ti' +
        'po = :tipo and'
      
        'pr.cod_empresa = cor.cod_empresa and pr.cod_empresa = :cod_empre' +
        'sa and pr.ativo=1'
      'union'
      
        'SELECT '#39'SRVTERC '#39' tp,CAST(0 AS INTEGER),'#39'      '#39' cod_prod,CAST('#39 +
        '0.00'#39' AS DOUBLE PRECISION),'
      'DESCR_SERVT,VL_SERVT,VL_SERVT,CAST('#39'0.00'#39' AS DOUBLE PRECISION),'
      'CAST('#39#39' AS CHAR(35)) '
      'FROM pedvenda_serv_terc pvst WHERE'
      
        'pvst.nped = :N_OS and pvst.tipo = :tipo and cod_empresa = :cod_e' +
        'mpresa and ativo=1')
    Left = 954
    Top = 243
    ParamData = <
      item
        DataType = ftInteger
        Name = 'N_OS'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'tipo'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'cod_empresa'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'N_OS'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'tipo'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'cod_empresa'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'N_OS'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'tipo'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'cod_empresa'
        ParamType = ptUnknown
      end>
  end
  object QrControlesEnt: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransPedVenda
    Left = 648
    Top = 434
  end
  object qrEstEcf: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransPedVenda
    SQL.Strings = (
      'select * from ecf')
    Left = 985
    Top = 45
  end
  object dspEstEcf: TDataSetProvider
    DataSet = qrEstEcf
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 985
    Top = 89
  end
  object cdsEstEcf: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEstEcf'
    BeforeOpen = cdsItemProdBeforeOpen
    Left = 985
    Top = 128
    object cdsEstEcfN_SERIE_FAB: TStringField
      DisplayLabel = 'N'#186' S'#233'rie'
      FieldName = 'N_SERIE_FAB'
      Required = True
    end
    object cdsEstEcfCOD_NSERIE: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_NSERIE'
    end
    object cdsEstEcfCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsEstEcfIDENTIFICACAO: TStringField
      DisplayLabel = 'CNIEE'
      FieldName = 'IDENTIFICACAO'
      FixedChar = True
      Size = 6
    end
    object cdsEstEcfTIPO_ECF: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO_ECF'
    end
    object cdsEstEcfMARCA_ECF: TStringField
      DisplayLabel = 'Marca'
      FieldName = 'MARCA_ECF'
    end
    object cdsEstEcfMODELO_ECF: TStringField
      DisplayLabel = 'Modelo'
      FieldName = 'MODELO_ECF'
      Size = 35
    end
    object cdsEstEcfVERSAOSB: TStringField
      DisplayLabel = 'Vers'#227'o do SB'
      FieldName = 'VERSAOSB'
    end
    object cdsEstEcfN_MEMORIA_FISCAL: TStringField
      DisplayLabel = 'N'#186' Memoria Fiscal'
      FieldName = 'N_MEMORIA_FISCAL'
    end
    object cdsEstEcfLACRE_EXTERNO1: TStringField
      DisplayLabel = 'Lacres Externo 1'
      FieldName = 'LACRE_EXTERNO1'
      Size = 12
    end
    object cdsEstEcfLACRE_EXTERNO2: TStringField
      DisplayLabel = 'Lacre Externo 2'
      FieldName = 'LACRE_EXTERNO2'
      Size = 12
    end
    object cdsEstEcfLACRE_EXTERNO3: TStringField
      DisplayLabel = 'Lacre Externo 3'
      FieldName = 'LACRE_EXTERNO3'
      Size = 12
    end
    object cdsEstEcfLACRE_EXTERNO4: TStringField
      DisplayLabel = 'Lacre Externo 4'
      FieldName = 'LACRE_EXTERNO4'
      Size = 12
    end
    object cdsEstEcfSTATUS: TStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      Size = 12
    end
    object cdsEstEcfNREQ: TIntegerField
      FieldName = 'NREQ'
    end
    object cdsEstEcfNNF: TIntegerField
      FieldName = 'NNF'
    end
    object cdsEstEcfSERIE: TStringField
      DisplayLabel = 'S'#233'rie'
      FieldName = 'SERIE'
      Size = 5
    end
    object cdsEstEcfNNF_ENTRADA: TIntegerField
      DisplayLabel = 'Nf Entrada'
      FieldName = 'NNF_ENTRADA'
    end
    object cdsEstEcfSERIE_ENTRADA: TStringField
      DisplayLabel = 'S'#233'rie Entrada'
      FieldName = 'SERIE_ENTRADA'
      Size = 5
    end
    object cdsEstEcfCOD_FORNECEDOR: TIntegerField
      FieldName = 'COD_FORNECEDOR'
    end
    object cdsEstEcfCOD_PROD: TStringField
      FieldName = 'COD_PROD'
      FixedChar = True
      Size = 6
    end
    object cdsEstEcfGRUPO_PROD: TIntegerField
      FieldName = 'GRUPO_PROD'
    end
    object cdsEstEcfATIVO: TIntegerField
      FieldName = 'ATIVO'
    end
    object cdsEstEcfNPED: TIntegerField
      DisplayLabel = 'Num Venda'
      FieldName = 'NPED'
    end
    object cdsEstEcfTIPO_PED: TStringField
      DisplayLabel = 'Tipo Venda'
      FieldName = 'TIPO_PED'
      Size = 3
    end
    object cdsEstEcfNITEM_PED: TIntegerField
      FieldName = 'NITEM_PED'
    end
  end
  object dsEstEcf: TDataSource
    AutoEdit = False
    DataSet = cdsEstEcf
    Left = 985
    Top = 175
  end
  object IbBuscaAdc: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = dtmAtivo.IbTransCol
    Left = 720
    Top = 434
  end
  object dsVnd: TDataSource
    AutoEdit = False
    DataSet = cdsVnd
    Left = 810
    Top = 368
  end
  object dspVnd: TDataSetProvider
    DataSet = qrVnd
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 810
    Top = 281
  end
  object cdsVnd: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspVnd'
    BeforeOpen = cdsPedVendaBeforeOpen
    Left = 810
    Top = 325
  end
  object qrIVnd: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = ibTransPedVnd
    SQL.Strings = (
      'select * from PEDVENDA_PROD')
    Left = 855
    Top = 240
  end
  object cdsIVnd: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspIVnd'
    BeforeOpen = cdsItemProdBeforeOpen
    Left = 855
    Top = 325
    object cdsIVndNPED: TIntegerField
      FieldName = 'NPED'
      Required = True
    end
    object cdsIVndTIPO: TStringField
      FieldName = 'TIPO'
      Required = True
      FixedChar = True
      Size = 3
    end
    object cdsIVndGRUPO_PROD: TIntegerField
      FieldName = 'GRUPO_PROD'
      Required = True
    end
    object cdsIVndCOD_PROD: TStringField
      FieldName = 'COD_PROD'
      Required = True
      FixedChar = True
      Size = 6
    end
    object cdsIVndNITEM: TIntegerField
      FieldName = 'NITEM'
    end
    object cdsIVndCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsIVndCOD_GRADE: TIntegerField
      FieldName = 'COD_GRADE'
    end
    object cdsIVndCODIGO_NOP: TFloatField
      FieldName = 'CODIGO_NOP'
    end
    object cdsIVndNUM_FAB_PROD: TStringField
      FieldName = 'NUM_FAB_PROD'
      FixedChar = True
    end
    object cdsIVndDESCR_PROD_PED: TStringField
      FieldName = 'DESCR_PROD_PED'
      Size = 75
    end
    object cdsIVndQUANT_PED_ITEM: TFloatField
      FieldName = 'QUANT_PED_ITEM'
    end
    object cdsIVndVLUN_PED_ITEM: TFloatField
      FieldName = 'VLUN_PED_ITEM'
    end
    object cdsIVndVLTOT_PED_ITEM: TFloatField
      FieldName = 'VLTOT_PED_ITEM'
    end
    object cdsIVndVLUN_ORIG: TFloatField
      FieldName = 'VLUN_ORIG'
    end
    object cdsIVndVLUN_PED_NF: TFloatField
      FieldName = 'VLUN_PED_NF'
    end
    object cdsIVndVLTOT_PED_NF: TFloatField
      FieldName = 'VLTOT_PED_NF'
    end
    object cdsIVndRATEIO_DESC: TFloatField
      FieldName = 'RATEIO_DESC'
    end
    object cdsIVndRATEIO_ACRESC: TFloatField
      FieldName = 'RATEIO_ACRESC'
    end
    object cdsIVndN_NF: TIntegerField
      FieldName = 'N_NF'
    end
    object cdsIVndALIQUOTA_CP: TStringField
      FieldName = 'ALIQUOTA_CP'
      FixedChar = True
      Size = 4
    end
    object cdsIVndRATDSAS: TFloatField
      FieldName = 'RATDSAS'
    end
    object cdsIVndCOMISS_PROD: TFloatField
      FieldName = 'COMISS_PROD'
    end
    object cdsIVndCOMISS_PROD_GER: TFloatField
      FieldName = 'COMISS_PROD_GER'
    end
    object cdsIVndANO_FAB_PROD: TIntegerField
      FieldName = 'ANO_FAB_PROD'
    end
    object cdsIVndN_SERIE_PROD: TStringField
      FieldName = 'N_SERIE_PROD'
      Size = 15
    end
    object cdsIVndMODELO: TStringField
      FieldName = 'MODELO'
      Size = 15
    end
    object cdsIVndCOR: TStringField
      FieldName = 'COR'
      Size = 10
    end
    object cdsIVndPCUST_C: TFloatField
      FieldName = 'PCUST_C'
    end
    object cdsIVndPCUST_R: TFloatField
      FieldName = 'PCUST_R'
    end
    object cdsIVndPCUST_MC: TFloatField
      FieldName = 'PCUST_MC'
    end
    object cdsIVndPCUST_MR: TFloatField
      FieldName = 'PCUST_MR'
    end
    object cdsIVndTP_NF_PED: TStringField
      FieldName = 'TP_NF_PED'
      FixedChar = True
      Size = 1
    end
    object cdsIVndSIT_ATD: TStringField
      FieldName = 'SIT_ATD'
      FixedChar = True
      Size = 2
    end
    object cdsIVndSEL: TStringField
      FieldName = 'SEL'
      FixedChar = True
      Size = 1
    end
    object cdsIVndDATA_ATD: TDateTimeField
      FieldName = 'DATA_ATD'
    end
    object cdsIVndHORA_ATD: TStringField
      FieldName = 'HORA_ATD'
      FixedChar = True
      Size = 8
    end
    object cdsIVndCODIGO_KIT: TIntegerField
      FieldName = 'CODIGO_KIT'
    end
    object cdsIVndICMANT_SUB: TFloatField
      FieldName = 'ICMANT_SUB'
    end
    object cdsIVndCOD_SEG_SERV: TIntegerField
      FieldName = 'COD_SEG_SERV'
    end
    object cdsIVndATIVO: TIntegerField
      FieldName = 'ATIVO'
    end
    object cdsIVndCOL_COD_VENDEDOR: TIntegerField
      FieldName = 'COL_COD_VENDEDOR'
    end
    object cdsIVndDESC_ITEM: TFloatField
      FieldName = 'DESC_ITEM'
    end
    object cdsIVndACRESC_ITEM: TFloatField
      FieldName = 'ACRESC_ITEM'
    end
    object cdsIVndCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
    end
    object cdsIVndDATA_TRANSF: TDateTimeField
      FieldName = 'DATA_TRANSF'
    end
    object cdsIVndDATA_DEV: TDateTimeField
      FieldName = 'DATA_DEV'
    end
    object cdsIVndNOME_VEND: TStringField
      FieldName = 'NOME_VEND'
      Size = 35
    end
    object cdsIVndNOME_VEND1: TStringField
      FieldName = 'NOME_VEND1'
      Size = 35
    end
    object cdsIVndQT_DEV: TFloatField
      FieldName = 'QT_DEV'
    end
    object cdsIVndSERIE: TStringField
      FieldName = 'SERIE'
      Size = 5
    end
    object cdsIVndVLO_UNITARIO: TFloatField
      FieldName = 'VLO_UNITARIO'
    end
    object cdsIVndDATA_INCLUSAO: TDateTimeField
      FieldName = 'DATA_INCLUSAO'
    end
    object cdsIVndSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 10
    end
    object cdsIVndDAV_ORIGEM: TIntegerField
      FieldName = 'DAV_ORIGEM'
    end
    object cdsIVndTP_DESCACRES: TStringField
      FieldName = 'TP_DESCACRES'
      Size = 10
    end
    object cdsIVndNAT_DESCACRES: TStringField
      FieldName = 'NAT_DESCACRES'
      Size = 10
    end
    object cdsIVndVALOR_DESCACRES: TFloatField
      FieldName = 'VALOR_DESCACRES'
    end
    object cdsIVndCOD_NSERIE: TIntegerField
      FieldName = 'COD_NSERIE'
    end
    object cdsIVndCOD_NF: TIntegerField
      FieldName = 'COD_NF'
    end
    object cdsIVndNITEM_NF: TIntegerField
      FieldName = 'NITEM_NF'
    end
    object cdsIVndTABPRATICADA: TStringField
      FieldName = 'TABPRATICADA'
      FixedChar = True
      Size = 1
    end
    object cdsIVndQUANT_ITEM_DEV: TFloatField
      FieldName = 'QUANT_ITEM_DEV'
    end
    object cdsIVndTIPV: TStringField
      FieldName = 'TIPV'
      FixedChar = True
      Size = 1
    end
    object cdsIVndMD5: TStringField
      FieldName = 'MD5'
      Size = 256
    end
    object cdsIVndCOD_PEDIDO: TIntegerField
      FieldName = 'COD_PEDIDO'
    end
    object cdsIVndCOD_ALMOXARIFADO: TIntegerField
      FieldName = 'COD_ALMOXARIFADO'
    end
    object cdsIVndNPEDORIGINADO: TIntegerField
      FieldName = 'NPEDORIGINADO'
    end
    object cdsIVndTIPOORIGINADO: TStringField
      FieldName = 'TIPOORIGINADO'
      FixedChar = True
      Size = 3
    end
    object cdsIVndMAX_DESC_TAB: TFloatField
      FieldName = 'MAX_DESC_TAB'
    end
    object cdsIVndNITEM_PEDIDO: TIntegerField
      FieldName = 'NITEM_PEDIDO'
    end
    object cdsIVndRAT_DESC_AVISTA: TFloatField
      FieldName = 'RAT_DESC_AVISTA'
    end
    object cdsIVndREFAZER_COMISS: TStringField
      FieldName = 'REFAZER_COMISS'
      FixedChar = True
      Size = 1
    end
    object cdsIVndNPED_ORIGEM: TIntegerField
      FieldName = 'NPED_ORIGEM'
    end
    object cdsIVndTIPO_ORIGEM: TStringField
      FieldName = 'TIPO_ORIGEM'
      FixedChar = True
      Size = 3
    end
    object cdsIVndXPED_COMPRA: TStringField
      FieldName = 'XPED_COMPRA'
      Size = 15
    end
    object cdsIVndNITEMPED_COMPRA: TIntegerField
      FieldName = 'NITEMPED_COMPRA'
    end
    object cdsIVndNPED_CONF: TIntegerField
      FieldName = 'NPED_CONF'
    end
    object cdsIVndNITEM_CONF: TIntegerField
      FieldName = 'NITEM_CONF'
    end
    object cdsIVndTIPO_CONF: TStringField
      FieldName = 'TIPO_CONF'
      FixedChar = True
      Size = 3
    end
    object cdsIVndVL_DEBCRED: TFloatField
      FieldName = 'VL_DEBCRED'
    end
    object cdsIVndUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 6
    end
    object cdsIVndSIT_TRIB: TStringField
      FieldName = 'SIT_TRIB'
      FixedChar = True
      Size = 1
    end
    object cdsIVndICM_PROD: TFloatField
      FieldName = 'ICM_PROD'
    end
    object cdsIVndCSDECQTDE: TStringField
      FieldName = 'CSDECQTDE'
      Size = 1
    end
    object cdsIVndCSDECVLUNT: TStringField
      FieldName = 'CSDECVLUNT'
      Size = 1
    end
    object cdsIVndNPREVENDA: TIntegerField
      FieldName = 'NPREVENDA'
    end
    object cdsIVndVL_DESP_NF: TFloatField
      FieldName = 'VL_DESP_NF'
    end
    object cdsIVndNITEM_SERV: TIntegerField
      FieldName = 'NITEM_SERV'
    end
    object cdsIVndCOD_VENDEDOR1: TIntegerField
      FieldName = 'COD_VENDEDOR1'
    end
    object cdsIVndPRECOPORQTDE: TStringField
      FieldName = 'PRECOPORQTDE'
      FixedChar = True
      Size = 1
    end
    object cdsIVndN_NFD: TIntegerField
      FieldName = 'N_NFD'
    end
    object cdsIVndSERIED: TStringField
      FieldName = 'SERIED'
      Size = 5
    end
    object cdsIVndVL_COMISSAO_VEND: TFloatField
      FieldName = 'VL_COMISSAO_VEND'
    end
    object cdsIVndPERC_COMISSAO_VEND: TFloatField
      FieldName = 'PERC_COMISSAO_VEND'
    end
    object cdsIVndVL_COMISSAO_VEND1: TFloatField
      FieldName = 'VL_COMISSAO_VEND1'
    end
    object cdsIVndPERC_COMISSAO_VEND1: TFloatField
      FieldName = 'PERC_COMISSAO_VEND1'
    end
    object cdsIVndNF_DC_DESPNF: TFloatField
      FieldName = 'NF_DC_DESPNF'
    end
    object cdsIVndNF_AC_DES_EMB: TFloatField
      FieldName = 'NF_AC_DES_EMB'
    end
    object cdsIVndID_KIT: TIntegerField
      FieldName = 'ID_KIT'
    end
    object cdsIVndCOD_SUGESTAO: TIntegerField
      FieldName = 'COD_SUGESTAO'
    end
    object cdsIVndCOD_EMP_SUGESTAO: TIntegerField
      FieldName = 'COD_EMP_SUGESTAO'
    end
    object cdsIVndDESCRICAO_KIT_ID_KIT: TStringField
      FieldName = 'DESCRICAO_KIT_ID_KIT'
      Size = 80
    end
    object cdsIVndACRESC_PLANO: TFloatField
      FieldName = 'ACRESC_PLANO'
    end
    object cdsIVndUNIDADE_CONV: TStringField
      FieldName = 'UNIDADE_CONV'
      Size = 6
    end
    object cdsIVndOPERACAO_CONV: TStringField
      FieldName = 'OPERACAO_CONV'
      FixedChar = True
      Size = 1
    end
    object cdsIVndFATOR_CONV: TFloatField
      FieldName = 'FATOR_CONV'
    end
    object cdsIVndMAX_DESC_TAB_TEMP: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'MAX_DESC_TAB_TEMP'
    end
    object cdsIVndQUANT_PED_ITEM_CONV: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'QUANT_PED_ITEM_CONV'
    end
    object cdsIVndVLUN_PED_ITEM_LIQ: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'VLUN_PED_ITEM_LIQ'
    end
    object cdsIVndVLUN_PED_ITEM_CONV: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'VLUN_PED_ITEM_CONV'
    end
    object cdsIVndVLUN_PED_ITEM_CONV_LIQ: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'VLUN_PED_ITEM_CONV_LIQ'
    end
    object cdsIVndQUANT_ITEM_DEV_CONV: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'QUANT_ITEM_DEV_CONV'
    end
    object cdsIVndVLUN_PED_NF_CONV: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'VLUN_PED_NF_CONV'
    end
    object cdsIVndFATOR_CONV_TEMP: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'FATOR_CONV_TEMP'
      Size = 50
    end
    object cdsIVndVLTOT_PED_ITEM_LIQ: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'VLTOT_PED_ITEM_LIQ'
    end
    object cdsIVndRATEIO_DESC_TEMP: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'RATEIO_DESC_TEMP'
    end
    object cdsIVndRATEIO_ACRESC_TEMP: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'RATEIO_ACRESC_TEMP'
    end
    object cdsIVndPESO_LIQ_PROD: TFloatField
      FieldName = 'PESO_LIQ_PROD'
    end
    object cdsIVndPESO_BRUT_PROD: TFloatField
      FieldName = 'PESO_BRUT_PROD'
    end
    object cdsIVndPESO_LIQ_PROD_TEMP: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'PESO_LIQ_PROD_TEMP'
    end
    object cdsIVndPESO_BRUT_PROD_TEMP: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'PESO_BRUT_PROD_TEMP'
    end
    object cdsIVndQUANT_DEV_ITEM_TEMP: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'QUANT_DEV_ITEM_TEMP'
    end
    object cdsIVndQUANT_DEV_ITEM_TEMP_CONV: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'QUANT_DEV_ITEM_TEMP_CONV'
    end
    object cdsIVndPERMITIR_DESCONTO: TStringField
      FieldName = 'PERMITIR_DESCONTO'
    end
    object cdsIVndUSAR_DEBCRED: TStringField
      FieldName = 'USAR_DEBCRED'
      Size = 1
    end
  end
  object dspIVnd: TDataSetProvider
    DataSet = qrIVnd
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 855
    Top = 281
  end
  object qrVnd: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = ibTransPedVnd
    SQL.Strings = (
      
        'select pedvenda.*,clientes.nome_cliente, clientes.razao, cliente' +
        's.endereco, clientes.fone_cliente from pedvenda inner join clien' +
        'tes on pedvenda.cod_cliente=clientes.cod_cliente and pedvenda.co' +
        'd_empresa=clientes.cod_empresa where 1=0')
    Left = 810
    Top = 240
  end
  object dsIVnd: TDataSource
    AutoEdit = False
    DataSet = cdsIVnd
    Left = 855
    Top = 368
  end
  object ibTransPedVnd: TIBTransaction
    DefaultDatabase = dtmAtivo.bancoHw
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 808
    Top = 427
  end
  object qrBuscasVnd: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = ibTransPedVnd
    Left = 889
    Top = 427
  end
  object cdsTemp: TClientDataSet
    Aggregates = <>
    AutoCalcFields = False
    PacketRecords = 1000
    Params = <>
    Left = 1079
    Top = 413
    object cdsTempCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
    end
    object cdsTempNOME_VENDEDOR: TStringField
      FieldName = 'NOME_VENDEDOR'
    end
    object cdsTempDESC_FUNCAO: TStringField
      FieldName = 'DESC_FUNCAO'
    end
    object cdsTempDATA: TDateField
      FieldName = 'DATA'
    end
    object cdsTempTIPO: TStringField
      FieldName = 'TIPO'
    end
  end
  object qrAgendaCons: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransPedVenda
    SQL.Strings = (
      'select * from agenda')
    Left = 32
    Top = 492
  end
  object dspAgendaCons: TDataSetProvider
    DataSet = qrAgendaCons
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 32
    Top = 535
  end
  object cdsAgendaCons: TClientDataSet
    Aggregates = <>
    AutoCalcFields = False
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspAgendaCons'
    BeforeOpen = cdsAgendaConsBeforeOpen
    Left = 32
    Top = 578
    object cdsAgendaConsCOD_AGENDA: TIntegerField
      Tag = 2
      DisplayLabel = 'Codigo'
      FieldName = 'COD_AGENDA'
      Required = True
    end
    object cdsAgendaConsCOD_CLIENTE: TIntegerField
      Tag = 2
      DisplayLabel = 'Cod Cliente'
      FieldName = 'COD_CLIENTE'
      Required = True
    end
    object cdsAgendaConsNOME_CLIENTE: TStringField
      Tag = 2
      DisplayLabel = 'Nome Cliente'
      FieldName = 'NOME_CLIENTE'
      Size = 35
    end
    object cdsAgendaConsFONE_CLIENTE: TStringField
      Tag = 2
      DisplayLabel = 'Fone Cliente'
      FieldName = 'FONE_CLIENTE'
      EditMask = '(99) 9999-9999;0;_'
      FixedChar = True
      Size = 13
    end
    object cdsAgendaConsDATA_AGENDA: TDateTimeField
      Tag = 2
      DisplayLabel = 'Data'
      FieldName = 'DATA_AGENDA'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsAgendaConsHORA_AGENDA: TStringField
      Tag = 2
      DisplayLabel = 'Hora'
      FieldName = 'HORA_AGENDA'
      EditMask = '!90;1;_'
      Size = 2
    end
    object cdsAgendaConsMINUTO_AGENDA: TStringField
      DisplayLabel = 'Minuto'
      FieldName = 'MINUTO_AGENDA'
      Size = 2
    end
    object cdsAgendaConsDESCR_AGENDA: TStringField
      Tag = 1
      FieldName = 'DESCR_AGENDA'
      Visible = False
      Size = 30
    end
    object cdsAgendaConsOBSERVACAO: TMemoField
      Tag = 1
      FieldName = 'OBSERVACAO'
      BlobType = ftMemo
      Size = 8
    end
    object cdsAgendaConsSTATUS_AGENDA: TStringField
      Tag = 2
      DisplayLabel = 'Status'
      FieldName = 'STATUS_AGENDA'
      Size = 10
    end
    object cdsAgendaConsTMO_SERVICO: TFloatField
      Tag = 2
      DisplayLabel = 'Tmo Servi'#231'o'
      FieldName = 'TMO_SERVICO'
    end
    object cdsAgendaConsCOD_EMPRESA: TIntegerField
      Tag = 1
      FieldName = 'COD_EMPRESA'
      Required = True
      Visible = False
    end
    object cdsAgendaConsNPED: TIntegerField
      Tag = 2
      DisplayLabel = 'N OS'
      FieldName = 'NPED'
    end
    object cdsAgendaConsCOD_EQUIP: TIntegerField
      Tag = 2
      DisplayLabel = 'Cod Equipamento'
      FieldName = 'COD_EQUIP'
    end
    object cdsAgendaConsCOD_VEICULO: TIntegerField
      Tag = 2
      DisplayLabel = 'Cod Ve'#237'culo'
      FieldName = 'COD_VEICULO'
    end
    object cdsAgendaConsPLACA: TStringField
      Tag = 2
      DisplayLabel = 'Placa'
      FieldName = 'PLACA'
      Size = 10
    end
    object cdsAgendaConsCHASSI: TStringField
      Tag = 2
      DisplayLabel = 'Chassi'
      FieldName = 'CHASSI'
      Size = 17
    end
    object cdsAgendaConsCOD_USUARIO: TIntegerField
      DisplayLabel = 'Cod Usuario'
      FieldName = 'COD_USUARIO'
    end
  end
  object dsAgendaCons: TDataSource
    DataSet = cdsAgendaCons
    Left = 32
    Top = 624
  end
  object qrAgendaItensCons: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransPedVenda
    SQL.Strings = (
      'select ai.*, c.nome_vendedor, b.descr_box from agenda a'
      
        'inner join agenda_itens ai on ai.cod_agenda = a.cod_agenda and a' +
        'i.cod_empresa = a.cod_empresa'
      
        'left join colaborador c on c.cod_vendedor = ai.cod_vendedor and ' +
        'c.cod_empresa = ai.cod_empresa'
      
        'left join box b on b.cod_box = ai.cod_box and b.cod_empresa = ai' +
        '.cod_empresa'
      'where ai.cod_agenda = 0 and ai.cod_empresa = 0')
    Left = 128
    Top = 492
  end
  object dspAgendaItensCons: TDataSetProvider
    DataSet = qrAgendaItensCons
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 128
    Top = 535
  end
  object cdsAgendaItensCons: TClientDataSet
    Aggregates = <>
    AutoCalcFields = False
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspAgendaItensCons'
    BeforeOpen = cdsAgendaItensConsBeforeOpen
    Left = 128
    Top = 578
    object cdsAgendaItensConsSEL: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'SEL'
      ProviderFlags = [pfInWhere]
      Size = 1
    end
    object cdsAgendaItensConsCOD_AGENDA: TIntegerField
      Tag = 2
      DisplayLabel = 'Codigo Agenda'
      FieldName = 'COD_AGENDA'
      Required = True
    end
    object cdsAgendaItensConsCOD_EMPRESA: TIntegerField
      Tag = 1
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsAgendaItensConsNITEM: TIntegerField
      Tag = 2
      DisplayLabel = 'Item'
      FieldName = 'NITEM'
      Required = True
    end
    object cdsAgendaItensConsCOD_SERVICO: TIntegerField
      DisplayLabel = 'Cod Servi'#231'o'
      FieldName = 'COD_SERVICO'
      Required = True
    end
    object cdsAgendaItensConsDESC_SERVICO: TStringField
      DisplayLabel = 'Servi'#231'o'
      FieldName = 'DESC_SERVICO'
      FixedChar = True
      Size = 60
    end
    object cdsAgendaItensConsTMO_SERVICO: TFloatField
      DisplayLabel = 'Tmo'
      FieldName = 'TMO_SERVICO'
    end
    object cdsAgendaItensConsCODIGO_NOP: TFloatField
      DisplayLabel = 'CFOP'
      FieldName = 'CODIGO_NOP'
    end
    object cdsAgendaItensConsVALOR_SERVICO: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VALOR_SERVICO'
    end
    object cdsAgendaItensConsCOD_BOX: TIntegerField
      DisplayLabel = 'Cod Box'
      FieldName = 'COD_BOX'
    end
    object cdsAgendaItensConsCOD_VENDEDOR: TIntegerField
      DisplayLabel = 'Cod Vendedor'
      FieldName = 'COD_VENDEDOR'
    end
    object cdsAgendaItensConsNPED: TIntegerField
      DisplayLabel = 'OS'
      FieldName = 'NPED'
    end
    object cdsAgendaItensConsNOME_VENDEDOR: TStringField
      DisplayLabel = 'Nome Vendedor'
      FieldName = 'NOME_VENDEDOR'
      ProviderFlags = [pfInWhere, pfHidden]
      Size = 35
    end
    object cdsAgendaItensConsDESCR_BOX: TStringField
      FieldName = 'DESCR_BOX'
      ProviderFlags = [pfInWhere, pfHidden]
      Size = 30
    end
    object cdsAgendaItensConsCODBOX: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'CODBOX'
      ProviderFlags = [pfInWhere, pfHidden]
    end
    object cdsAgendaItensConsCODNOMEVENDEDOR: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'CODNOMEVENDEDOR'
      ProviderFlags = [pfInWhere, pfHidden]
      Size = 40
    end
    object cdsAgendaItensConsCOD_USUARIO: TIntegerField
      DisplayLabel = 'Cod Usuario'
      FieldName = 'COD_USUARIO'
    end
  end
  object dsAgendaItensCons: TDataSource
    DataSet = cdsAgendaItensCons
    Left = 128
    Top = 624
  end
  object cdsMecanicoCons: TClientDataSet
    Aggregates = <>
    AutoCalcFields = False
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspMecanicoCons'
    BeforeOpen = cdsMecanicoConsBeforeOpen
    Left = 231
    Top = 578
    object cdsMecanicoConsCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
      Required = True
    end
    object cdsMecanicoConsNOME_VENDEDOR: TStringField
      FieldName = 'NOME_VENDEDOR'
      Size = 35
    end
    object cdsMecanicoConsDESC_FUNCAO: TStringField
      FieldName = 'DESC_FUNCAO'
      FixedChar = True
      Size = 30
    end
  end
  object qrMecanicoCons: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransPedVenda
    SQL.Strings = (
      ' select distinct c.cod_vendedor, c.nome_vendedor, f.desc_funcao'
      
        ' from colaborador c  inner join funcoes f on f.cod_funcao = c.co' +
        'd_funcao'
      ' left join tmo_serv_os t on t.cod_vendedor = c.cod_vendedor'
      ' where  c.cod_empresa = 1 and c.ativo = 1 and'
      
        ' ((f.desc_funcao like '#39'%MECANICO%'#39') or (f.desc_funcao like '#39'%MEC' +
        #194'NICO%'#39'))'
      
        ' and (t.tipo_op ='#39'S'#39' or t.tipo_op ='#39'P'#39' or t.tipo_op is null)  or' +
        'der by t.dia asc, t.hora_inicio asc'
      '   '
      ' ')
    Left = 231
    Top = 492
  end
  object dsMecanicoCons: TDataSource
    DataSet = cdsMecanicoCons
    Left = 231
    Top = 624
  end
  object dspMecanicoCons: TDataSetProvider
    DataSet = qrMecanicoCons
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 231
    Top = 535
  end
  object cdsBoxCons: TClientDataSet
    Aggregates = <>
    AutoCalcFields = False
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspBoxCons'
    BeforeOpen = cdsBoxConsBeforeOpen
    Left = 311
    Top = 576
    object cdsBoxConsCOD_BOX: TIntegerField
      FieldName = 'COD_BOX'
      Required = True
    end
    object cdsBoxConsDESCR_BOX: TStringField
      FieldName = 'DESCR_BOX'
      Size = 30
    end
    object cdsBoxConsCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
  end
  object qrBoxCons: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransPedVenda
    SQL.Strings = (
      'select cod_box, descr_box, cod_empresa from box'
      'where cod_empresa= 1 and ativo = 1')
    Left = 311
    Top = 492
  end
  object dsBoxCons: TDataSource
    DataSet = cdsBoxCons
    Left = 311
    Top = 622
  end
  object dspBoxCons: TDataSetProvider
    DataSet = qrBoxCons
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 311
    Top = 534
  end
  object qrListaColab: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransPedVenda
    SQL.Strings = (
      'SELECT C.*,F.desc_funcao, F.tpdocs_vnd FROM COLABORADOR C'
      'INNER JOIN funcoes F ON F.cod_funcao  = C.cod_funcao'
      'WHERE C.cod_empresa = 1 AND C.ativo = 1')
    Left = 377
    Top = 492
  end
  object dspListaColab: TDataSetProvider
    DataSet = qrListaColab
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 377
    Top = 534
  end
  object cdsListaColab: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspListaColab'
    BeforeOpen = cdsPedVendaBeforeOpen
    Left = 377
    Top = 576
    object IntegerField12: TIntegerField
      FieldName = 'COD_VENDEDOR'
      Required = True
    end
    object IntegerField13: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object IntegerField14: TIntegerField
      FieldName = 'CODIGO_UF'
      Required = True
    end
    object IntegerField15: TIntegerField
      FieldName = 'COD_FUNCAO'
      Required = True
    end
    object StringField12: TStringField
      FieldName = 'NOME_VENDEDOR'
      Size = 35
    end
    object StringField13: TStringField
      FieldName = 'END_VENDEDOR'
      Size = 35
    end
    object StringField14: TStringField
      FieldName = 'BAIRRO_VENDEDOR'
      Size = 35
    end
    object StringField15: TStringField
      FieldName = 'CIDADE_VENDEDOR'
      Size = 35
    end
    object StringField16: TStringField
      FieldName = 'CEP_VENDEDOR'
      FixedChar = True
      Size = 9
    end
    object StringField17: TStringField
      FieldName = 'FONE_VENDEDOR'
      FixedChar = True
      Size = 14
    end
    object StringField18: TStringField
      FieldName = 'CPF_VENDEDOR'
      FixedChar = True
      Size = 11
    end
    object FloatField9: TFloatField
      FieldName = 'PC_VEND_SERV'
    end
    object FloatField10: TFloatField
      FieldName = 'PC_VEND_PROD'
    end
    object MemoField1: TMemoField
      FieldName = 'OBS_VENDEDOR'
      BlobType = ftMemo
      Size = 8
    end
    object DateTimeField1: TDateTimeField
      FieldName = 'DATA_MOD_COL'
    end
    object DateTimeField2: TDateTimeField
      FieldName = 'DATA_CAD_COL'
    end
    object DateTimeField5: TDateTimeField
      FieldName = 'DAT_NASC_COL'
    end
    object StringField19: TStringField
      FieldName = 'NOME_ULT_EMP'
      Size = 30
    end
    object StringField20: TStringField
      FieldName = 'ENDERECO_ULT_EMP'
      Size = 30
    end
    object StringField21: TStringField
      FieldName = 'FONE_ULT_EMP'
      FixedChar = True
      Size = 14
    end
    object StringField22: TStringField
      FieldName = 'CONT_ULT_EMP'
    end
    object FloatField11: TFloatField
      FieldName = 'ULT_SAL_EMP'
    end
    object DateTimeField6: TDateTimeField
      FieldName = 'DTENT_ULT_EMP'
    end
    object DateTimeField7: TDateTimeField
      FieldName = 'DTSAI_ULT_EMP'
    end
    object StringField23: TStringField
      FieldName = 'NOME_PLT_EMP'
      Size = 30
    end
    object StringField24: TStringField
      FieldName = 'ENDERECO_PLT_EMP'
      Size = 30
    end
    object StringField25: TStringField
      FieldName = 'FONE_PLT_EMP'
      FixedChar = True
      Size = 14
    end
    object StringField26: TStringField
      FieldName = 'CONT_PLT_EMP'
    end
    object FloatField12: TFloatField
      FieldName = 'PLT_SAL_EMP'
    end
    object DateTimeField8: TDateTimeField
      FieldName = 'DTENT_PLT_EMP'
    end
    object DateTimeField9: TDateTimeField
      FieldName = 'DTSAI_PLT_EMP'
    end
    object DateTimeField10: TDateTimeField
      FieldName = 'DT_ULT_FERIAS'
    end
    object IntegerField16: TIntegerField
      FieldName = 'TMP_ULT_FERIAS'
    end
    object FloatField13: TFloatField
      FieldName = 'VL_ULT_FERIAS'
    end
    object DateTimeField11: TDateTimeField
      FieldName = 'DTVND_ULT_FERIAS'
    end
    object DateTimeField12: TDateTimeField
      FieldName = 'DT_13_SAL'
    end
    object FloatField14: TFloatField
      FieldName = 'VL_13_SAL'
    end
    object FloatField15: TFloatField
      FieldName = 'VL_SAL'
    end
    object SmallintField1: TSmallintField
      FieldName = 'COD_CIDADE'
    end
    object SmallintField2: TSmallintField
      FieldName = 'COD_BAIRRO'
    end
    object FloatField16: TFloatField
      FieldName = 'SALARIO_REGISTRO'
    end
    object FloatField17: TFloatField
      FieldName = 'VALOR_SALARIO'
    end
    object FloatField18: TFloatField
      FieldName = 'QUANT_SAL_FAMILIA'
    end
    object FloatField19: TFloatField
      FieldName = 'VALOR_SALARIO_FAMILIA'
    end
    object FloatField20: TFloatField
      FieldName = 'PERC_PESO'
    end
    object IntegerField17: TIntegerField
      FieldName = 'ATIVO'
    end
    object StringField27: TStringField
      FieldName = 'EMAIL'
      Size = 50
    end
    object StringField28: TStringField
      FieldName = 'SITE'
      FixedChar = True
      Size = 1
    end
    object StringField29: TStringField
      FieldName = 'FONE_CONTATO'
      FixedChar = True
      Size = 40
    end
    object StringField30: TStringField
      FieldName = 'DESC_FUNCAO'
      FixedChar = True
      Size = 30
    end
    object MemoField2: TMemoField
      FieldName = 'TPDOCS_VND'
      BlobType = ftMemo
      Size = 8
    end
  end
  object dsListaColab: TDataSource
    DataSet = cdsListaColab
    Left = 380
    Top = 622
  end
  object qrBuscas2: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransPedVenda
    Left = 401
    Top = 1
  end
  object qrCtrl: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransPedVenda
    SQL.Strings = (
      'select codigo_ctrl, nome_ctrl, qseqperf from controles'
      'WHERE CXENT = '#39'S'#39' AND ATIVO = 1 and codigo_emp = 0')
    Left = 937
    Top = 484
  end
  object dspCtrl: TDataSetProvider
    DataSet = qrCtrl
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 937
    Top = 526
  end
  object cdsCtrl: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCtrl'
    BeforeOpen = cdsPedVendaBeforeOpen
    Left = 937
    Top = 568
    object cdsCtrlCODIGO_CTRL: TIntegerField
      FieldName = 'CODIGO_CTRL'
      Required = True
    end
    object cdsCtrlNOME_CTRL: TStringField
      FieldName = 'NOME_CTRL'
      Size = 35
    end
    object cdsCtrlQSEQPERF: TIntegerField
      FieldName = 'QSEQPERF'
    end
  end
  object dsCtrl: TDataSource
    DataSet = cdsCtrl
    Left = 940
    Top = 614
  end
  object qrAprovaFin: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransPedVenda
    SQL.Strings = (
      'select pv.nped, pv.data_ped, pv.cod_cliente, '
      'coalesce(c.limite_credito, 0) limite_credito,'
      'c.usar_lim_libvnd_finan,'
      'coalesce(getcrediario.valor_debito, 0) valor_debito,'
      'coalesce(getcrediario.qtde_debito, 0) qtde_debito,'
      'coalesce(getcrediario.media_debito, 0) media_debito,'
      
        'coalesce(getcrediario.valor_debito_atraso_car, 0) valor_debito_a' +
        'traso_car,'
      
        'coalesce(getcrediario.qtde_debito_atraso_car, 0) qtde_debito_atr' +
        'aso_car,'
      
        'coalesce(getcrediario.media_debito_atraso_car, 0) media_debito_a' +
        'traso_car,'
      
        'coalesce(getcrediario.valor_debito_atraso, 0) valor_debito_atras' +
        'o,'
      'coalesce(getcrediario.qtde_debito_atraso, 0) qtde_debito_atraso,'
      
        'coalesce(getcrediario.media_debito_atraso, 0) media_debito_atras' +
        'o,'
      'coalesce(pv.valor_total, 0) valor_total,'
      
        'case when (coalesce(pv.valor_total, 0) + coalesce(getcrediario.v' +
        'alor_debito, 0) > coalesce(c.limite_credito, 0)) then'
      '      '#39'S'#39
      '    else'
      '      '#39'N'#39
      'end limite_estourado,'
      'pv.obs_cxl_rq, pv.tipv,'
      'c.nome_cliente, c.razao, c.cidade, c.barrado,'
      'cp.desc_cond_pag,'
      'cl.nome_ctrl'
      'from pedvenda pv'
      
        'inner join clientes c on c.cod_cliente = pv.cod_cliente and c.co' +
        'd_empresa = pv.cod_empresa'
      
        'inner join tipo_vendas tv on tv.sigla = pv.tipv and tv.tipo = pv' +
        '.tipo'
      'inner join cond_pag cp on cp.cod_cond_pag = pv.cod_cond_pag'
      
        'left join controles cl on cl.codigo_ctrl = pv.cod_controle and c' +
        'l.codigo_emp = pv.cod_empresa'
      
        'left join getcrediario (c.cpfcgc, pv.cod_cliente, pv.cod_empresa' +
        ', '#39'N'#39', 0) on 1 = 1'
      'where pv.autorizado_financeiro is null'
      
        'and ( (tv.usar_liberacao_financeiro = '#39'S'#39') or (c.usar_liberacao_' +
        'financeiro = '#39'S'#39') )'
      'and pv.tipo = '#39'REQ'#39' and pv.nped = 0'
      'union'
      'select pv.nped, pv.data_ped, pv.cod_cliente, '
      'coalesce(c.limite_credito, 0) limite_credito,'
      'c.usar_lim_libvnd_finan,'
      'coalesce(getcrediario.valor_debito, 0) valor_debito,'
      'coalesce(getcrediario.qtde_debito, 0) qtde_debito,'
      'coalesce(getcrediario.media_debito, 0) media_debito,'
      
        'coalesce(getcrediario.valor_debito_atraso_car, 0) valor_debito_a' +
        'traso_car,'
      
        'coalesce(getcrediario.qtde_debito_atraso_car, 0) qtde_debito_atr' +
        'aso_car,'
      
        'coalesce(getcrediario.media_debito_atraso_car, 0) media_debito_a' +
        'traso_car,'
      
        'coalesce(getcrediario.valor_debito_atraso, 0) valor_debito_atras' +
        'o,'
      'coalesce(getcrediario.qtde_debito_atraso, 0) qtde_debito_atraso,'
      
        'coalesce(getcrediario.media_debito_atraso, 0) media_debito_atras' +
        'o,'
      'coalesce(pv.valor_total, 0) valor_total,'
      
        'case when (coalesce(pv.valor_total, 0) + coalesce(getcrediario.v' +
        'alor_debito, 0) > coalesce(c.limite_credito, 0)) then'
      '      '#39'S'#39
      '    else'
      '      '#39'N'#39
      'end limite_estourado,'
      'pv.obs_cxl_rq, pv.tipv,'
      'c.nome_cliente, c.razao, c.cidade, c.barrado,'
      'cp.desc_cond_pag,'
      'cl.nome_ctrl'
      'from pedvenda pv'
      
        'inner join clientes c on c.cod_cliente = pv.cod_cliente and c.co' +
        'd_empresa = pv.cod_empresa'
      
        'inner join tipo_vendas tv on tv.sigla = pv.tipv and tv.tipo = pv' +
        '.tipo'
      'inner join cond_pag cp on cp.cod_cond_pag = pv.cod_cond_pag'
      
        'left join controles cl on cl.codigo_ctrl = pv.cod_controle and c' +
        'l.codigo_emp = pv.cod_empresa'
      
        'left join getcrediario (c.cpfcgc, pv.cod_cliente, pv.cod_empresa' +
        ', '#39'N'#39', 0) on 1 = 1'
      'where pv.autorizado_financeiro <> '#39'S'#39
      
        'and ( (tv.usar_liberacao_financeiro = '#39'S'#39') or (c.usar_liberacao_' +
        'financeiro = '#39'S'#39') )'
      'and pv.tipo = '#39'REQ'#39' and pv.nped = 0'
      'order by 2')
    Left = 457
    Top = 492
  end
  object dspAprovaFin: TDataSetProvider
    DataSet = qrAprovaFin
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 457
    Top = 534
  end
  object cdsAprovaFin: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAprovaFin'
    BeforeOpen = cdsPedVendaBeforeOpen
    Left = 457
    Top = 576
    object cdsAprovaFinSEL: TStringField
      DisplayLabel = '...'
      FieldKind = fkInternalCalc
      FieldName = 'SEL'
      Size = 1
    end
    object cdsAprovaFinNPED: TIntegerField
      DisplayLabel = 'Num Ped'
      FieldName = 'NPED'
      Required = True
    end
    object cdsAprovaFinDATA_PED: TDateTimeField
      DisplayLabel = 'Data Ped'
      FieldName = 'DATA_PED'
    end
    object cdsAprovaFinCOD_CLIENTE: TIntegerField
      DisplayLabel = 'Cod Cliente'
      FieldName = 'COD_CLIENTE'
      Required = True
    end
    object cdsAprovaFinLIMITE_CREDITO: TFloatField
      DisplayLabel = 'Limite de Cr'#233'dito'
      FieldName = 'LIMITE_CREDITO'
      DisplayFormat = '#,##0.00'
    end
    object cdsAprovaFinVALOR_DEBITO: TFloatField
      DisplayLabel = 'Valor do D'#233'bito'
      FieldName = 'VALOR_DEBITO'
      DisplayFormat = '#,##0.00'
    end
    object cdsAprovaFinVALOR_TOTAL: TFloatField
      DisplayLabel = 'Valor da Compra'
      FieldName = 'VALOR_TOTAL'
      DisplayFormat = '#,##0.00'
    end
    object cdsAprovaFinVALOR_DEBITO_ATRASO_CAR: TFloatField
      DisplayLabel = 'Valor do D'#233'bito Atraso (Car'#234'ncia)'
      FieldName = 'VALOR_DEBITO_ATRASO_CAR'
      DisplayFormat = '#,##0.00'
    end
    object cdsAprovaFinOBS_CXL_RQ: TStringField
      DisplayLabel = 'Obs'
      FieldName = 'OBS_CXL_RQ'
      Size = 50
    end
    object cdsAprovaFinTIPV: TStringField
      DisplayLabel = 'Tip V.'
      FieldName = 'TIPV'
      FixedChar = True
      Size = 1
    end
    object cdsAprovaFinNOME_CLIENTE: TStringField
      DisplayLabel = 'Nome Fantasia Cliente'
      FieldName = 'NOME_CLIENTE'
      Required = True
      Size = 35
    end
    object cdsAprovaFinRAZAO: TStringField
      DisplayLabel = 'Raz'#227'o Social Cliente'
      FieldName = 'RAZAO'
      Required = True
      Size = 60
    end
    object cdsAprovaFinCPFCGC: TStringField
      DisplayLabel = 'CNPJ/CPF Cliente'
      FieldName = 'CPFCGC'
      Size = 18
    end
    object cdsAprovaFinCIDADE: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'CIDADE'
      Required = True
      Size = 30
    end
    object cdsAprovaFinBARRADO: TStringField
      DisplayLabel = 'Barrado'
      DisplayWidth = 3
      FieldName = 'BARRADO'
      FixedChar = True
      Size = 3
    end
    object cdsAprovaFinNOME_CTRL: TStringField
      DisplayLabel = 'Forma Pagamento'
      FieldName = 'NOME_CTRL'
      Size = 35
    end
    object cdsAprovaFinDESC_COND_PAG: TStringField
      DisplayLabel = 'Prazo'
      FieldName = 'DESC_COND_PAG'
      Size = 30
    end
    object cdsAprovaFinAUTORIZADO_FINANCEIRO: TStringField
      DisplayLabel = 'Autorizado'
      FieldName = 'AUTORIZADO_FINANCEIRO'
      Size = 1
    end
    object cdsAprovaFinIDMOBILE: TIntegerField
      DisplayLabel = 'ID Mobile'
      FieldName = 'IDMOBILE'
    end
    object cdsAprovaFinNOME_VENDEDOR: TStringField
      DisplayLabel = 'Vendedor'
      FieldName = 'NOME_VENDEDOR'
      Size = 35
    end
    object cdsAprovaFinNPEDMOB: TIntegerField
      DisplayLabel = 'Num Pedido Mobile'
      FieldName = 'NPEDMOB'
    end
    object cdsAprovaFinQTDE_DEBITO: TIntegerField
      DisplayLabel = 'Qtd D'#233'bito'
      FieldName = 'QTDE_DEBITO'
    end
    object cdsAprovaFinMEDIA_DEBITO: TFloatField
      DisplayLabel = 'M'#233'dia Dias em Atraso D'#233'bito'
      FieldName = 'MEDIA_DEBITO'
    end
    object cdsAprovaFinQTDE_DEBITO_ATRASO_CAR: TIntegerField
      DisplayLabel = 'Qtd D'#233'bito Atraso (Car'#234'ncia)'
      FieldName = 'QTDE_DEBITO_ATRASO_CAR'
    end
    object cdsAprovaFinMEDIA_DEBITO_ATRASO_CAR: TFloatField
      DisplayLabel = 'M'#233'dia Dias em Atraso (Car'#234'ncia)'
      FieldName = 'MEDIA_DEBITO_ATRASO_CAR'
    end
    object cdsAprovaFinVALOR_DEBITO_ATRASO: TFloatField
      DisplayLabel = 'Valor do D'#233'bito em Atraso (Sem Car'#234'ncia)'
      FieldName = 'VALOR_DEBITO_ATRASO'
      DisplayFormat = '#,##0.00'
    end
    object cdsAprovaFinQTDE_DEBITO_ATRASO: TIntegerField
      DisplayLabel = 'Qtd D'#233'bito em Atraso (Sem Car'#234'ncia)'
      FieldName = 'QTDE_DEBITO_ATRASO'
    end
    object cdsAprovaFinMEDIA_DEBITO_ATRASO: TFloatField
      DisplayLabel = 'M'#233'dia Dias em Atraso (Sem Car'#234'ncia)'
      FieldName = 'MEDIA_DEBITO_ATRASO'
    end
    object cdsAprovaFinAPROVADA_GERENTE: TStringField
      DisplayLabel = 'Gerente Aprovou'
      FieldName = 'APROVADA_GERENTE'
      Size = 1
    end
    object cdsAprovaFinLIMITE_ESTOURADO: TStringField
      DisplayLabel = 'Limite Estourado'
      FieldName = 'LIMITE_ESTOURADO'
      FixedChar = True
      Size = 1
    end
    object cdsAprovaFinUSAR_LIM_LIBVND_FINAN: TStringField
      DisplayLabel = 'Vender acima limite de cr'#233'dito (Cliente)'
      FieldName = 'USAR_LIM_LIBVND_FINAN'
      FixedChar = True
      Size = 1
    end
  end
  object dsAprovaFin: TDataSource
    DataSet = cdsAprovaFin
    Left = 460
    Top = 622
  end
  object dspSitPed: TDataSetProvider
    DataSet = qrSitPed
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 657
    Top = 526
  end
  object cdsSitPed: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSitPed'
    BeforeOpen = cdsPedVendaBeforeOpen
    Left = 657
    Top = 568
    object cdsSitPedPedido: TStringField
      FieldName = 'Pedido'
      Size = 16
    end
    object cdsSitPedFinanceiro: TStringField
      FieldName = 'Financeiro'
      Size = 16
    end
    object cdsSitPedSeparacao: TStringField
      FieldName = 'Separacao'
      Size = 16
    end
    object cdsSitPedFaturamento: TStringField
      FieldName = 'Faturamento'
      Size = 16
    end
    object cdsSitPedExpedicao: TStringField
      FieldName = 'Expedicao'
      Size = 16
    end
    object cdsSitPedSaida: TStringField
      FieldName = 'Saida'
      Size = 16
    end
    object cdsSitPedAcerto: TStringField
      FieldName = 'Acerto'
      Size = 16
    end
    object cdsSitPedCOD_CARGA: TIntegerField
      DisplayLabel = 'Carga'
      FieldName = 'COD_CARGA'
    end
    object cdsSitPedNPED: TIntegerField
      DisplayLabel = 'Pedido'
      FieldName = 'NPED'
      Required = True
    end
    object cdsSitPedDATA_PED: TDateTimeField
      DisplayLabel = 'Data'
      FieldName = 'DATA_PED'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsSitPedNOME_CLIENTE: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'NOME_CLIENTE'
      Required = True
      Size = 35
    end
    object cdsSitPedRAZAO: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'RAZAO'
      Required = True
      Size = 60
    end
    object cdsSitPedVALOR_TOTAL: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VALOR_TOTAL'
      EditFormat = '##0.00'
    end
    object cdsSitPedLIB_FIN_CL: TStringField
      DisplayLabel = 'Lib Fin Cl'
      FieldName = 'LIB_FIN_CL'
      FixedChar = True
      Size = 1
    end
    object cdsSitPedLIB_FIN_TV: TStringField
      DisplayLabel = 'Lib Fin TV'
      FieldName = 'LIB_FIN_TV'
      FixedChar = True
      Size = 1
    end
    object cdsSitPedPED_INI: TDateTimeField
      FieldName = 'PED_INI'
    end
    object cdsSitPedPED_FIN: TDateTimeField
      FieldName = 'PED_FIN'
    end
    object cdsSitPedPED_NAO: TDateTimeField
      FieldName = 'PED_NAO'
    end
    object cdsSitPedFIN_FIN: TDateTimeField
      FieldName = 'FIN_FIN'
    end
    object cdsSitPedFIN_NAO: TDateTimeField
      FieldName = 'FIN_NAO'
    end
    object cdsSitPedSEP_INI: TDateTimeField
      FieldName = 'SEP_INI'
    end
    object cdsSitPedSEP_FIN: TDateTimeField
      FieldName = 'SEP_FIN'
    end
    object cdsSitPedFAT_INI: TDateTimeField
      FieldName = 'FAT_INI'
    end
    object cdsSitPedFAT_FIN: TDateTimeField
      FieldName = 'FAT_FIN'
    end
    object cdsSitPedEXP_INI: TDateTimeField
      FieldName = 'EXP_INI'
    end
    object cdsSitPedEXP_FIN: TDateTimeField
      FieldName = 'EXP_FIN'
    end
    object cdsSitPedSAI_FIN: TDateTimeField
      FieldName = 'SAI_FIN'
    end
    object cdsSitPedACE_FIN: TDateTimeField
      FieldName = 'ACE_FIN'
    end
  end
  object dsSitPed: TDataSource
    AutoEdit = False
    DataSet = cdsSitPed
    Left = 660
    Top = 614
  end
  object qrSitPed: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransPedVenda
    SQL.Strings = (
      'select'
      
        '(select first 1 status_situacao from ocorrencias_os where nped =' +
        ' p.nped and tipo = p.tipo and cod_empresa = p.cod_empresa and si' +
        'tuacao = '#39'PEDIDO'#39' order by data_e_hora desc) as "Pedido",'
      
        '(select first 1 status_situacao from ocorrencias_os where nped =' +
        ' p.nped and tipo = p.tipo and cod_empresa = p.cod_empresa and si' +
        'tuacao = '#39'FINANCEIRO'#39' order by data_e_hora desc) as "Financeiro"' +
        ','
      
        '(select first 1 status_situacao from ocorrencias_os where nped =' +
        ' p.nped and tipo = p.tipo and cod_empresa = p.cod_empresa and si' +
        'tuacao = '#39'SEPARACAO'#39' order by data_e_hora desc) as "Separacao",'
      
        '(select first 1 status_situacao from ocorrencias_os where nped =' +
        ' p.nped and tipo = p.tipo and cod_empresa = p.cod_empresa and si' +
        'tuacao = '#39'FATURAMENTO'#39' order by data_e_hora desc) as "Faturament' +
        'o",'
      
        '(select first 1 status_situacao from ocorrencias_os where nped =' +
        ' p.nped and tipo = p.tipo and cod_empresa = p.cod_empresa and si' +
        'tuacao = '#39'EXPEDICAO'#39' order by data_e_hora desc) as "Expedicao",'
      
        '(select first 1 status_situacao from ocorrencias_os where nped =' +
        ' p.nped and tipo = p.tipo and cod_empresa = p.cod_empresa and si' +
        'tuacao = '#39'SAIDA'#39' order by data_e_hora desc) as "Saida",'
      
        '(select first 1 status_situacao from ocorrencias_os where nped =' +
        ' p.nped and tipo = p.tipo and cod_empresa = p.cod_empresa and si' +
        'tuacao = '#39'ACERTO'#39' order by data_e_hora desc) as "Acerto",'
      
        'p.cod_carga, p.nped, p.data_ped, c.nome_cliente, c.razao, p.valo' +
        'r_total,'
      
        'c.usar_liberacao_financeiro lib_fin_cl, tv.usar_liberacao_financ' +
        'eiro lib_fin_tv,'
      
        '(select first 1 ocorrencias_os.data_e_hora from ocorrencias_os w' +
        'here nped = p.nped and tipo = p.tipo and cod_empresa = p.cod_emp' +
        'resa and situacao = '#39'PEDIDO'#39' and status_situacao = '#39'Iniciado'#39' or' +
        'der by data_e_hora) as PED_INI,'
      
        '(select first 1 ocorrencias_os.data_e_hora from ocorrencias_os w' +
        'here nped = p.nped and tipo = p.tipo and cod_empresa = p.cod_emp' +
        'resa and situacao = '#39'PEDIDO'#39' and status_situacao = '#39'Finalizado'#39' ' +
        'order by data_e_hora) as PED_FIN,'
      
        '(select first 1 ocorrencias_os.data_e_hora from ocorrencias_os w' +
        'here nped = p.nped and tipo = p.tipo and cod_empresa = p.cod_emp' +
        'resa and situacao = '#39'PEDIDO'#39' and status_situacao = '#39'Nao Autoriza' +
        'do'#39' order by data_e_hora) as PED_NAO,'
      
        '(select first 1 ocorrencias_os.data_e_hora from ocorrencias_os w' +
        'here nped = p.nped and tipo = p.tipo and cod_empresa = p.cod_emp' +
        'resa and situacao = '#39'FINANCEIRO'#39' and status_situacao = '#39'Finaliza' +
        'do'#39' order by data_e_hora) as FIN_FIN,'
      
        '(select first 1 ocorrencias_os.data_e_hora from ocorrencias_os w' +
        'here nped = p.nped and tipo = p.tipo and cod_empresa = p.cod_emp' +
        'resa and situacao = '#39'FINANCEIRO'#39' and status_situacao = '#39'Nao Auto' +
        'rizado'#39' order by data_e_hora) as FIN_NAO,'
      
        '(select first 1 ocorrencias_os.data_e_hora from ocorrencias_os w' +
        'here nped = p.nped and tipo = p.tipo and cod_empresa = p.cod_emp' +
        'resa and situacao = '#39'SEPARACAO'#39' and status_situacao = '#39'Iniciado'#39 +
        ' order by data_e_hora) as SEP_INI,'
      
        '(select first 1 ocorrencias_os.data_e_hora from ocorrencias_os w' +
        'here nped = p.nped and tipo = p.tipo and cod_empresa = p.cod_emp' +
        'resa and situacao = '#39'SEPARACAO'#39' and status_situacao = '#39'Finalizad' +
        'o'#39' order by data_e_hora) as SEP_FIN,'
      
        '(select first 1 ocorrencias_os.data_e_hora from ocorrencias_os w' +
        'here nped = p.nped and tipo = p.tipo and cod_empresa = p.cod_emp' +
        'resa and situacao = '#39'FATURAMENTO'#39' and status_situacao = '#39'Iniciad' +
        'o'#39' order by data_e_hora) as FAT_INI,'
      
        '(select first 1 ocorrencias_os.data_e_hora from ocorrencias_os w' +
        'here nped = p.nped and tipo = p.tipo and cod_empresa = p.cod_emp' +
        'resa and situacao = '#39'FATURAMENTO'#39' and status_situacao = '#39'Finaliz' +
        'ado'#39' order by data_e_hora) as FAT_FIN,'
      
        '(select first 1 ocorrencias_os.data_e_hora from ocorrencias_os w' +
        'here nped = p.nped and tipo = p.tipo and cod_empresa = p.cod_emp' +
        'resa and situacao = '#39'EXPEDICAO'#39' and status_situacao = '#39'Iniciado'#39 +
        ' order by data_e_hora) as EXP_INI,'
      
        '(select first 1 ocorrencias_os.data_e_hora from ocorrencias_os w' +
        'here nped = p.nped and tipo = p.tipo and cod_empresa = p.cod_emp' +
        'resa and situacao = '#39'EXPEDICAO'#39' and status_situacao = '#39'Finalizad' +
        'o'#39' order by data_e_hora) as EXP_FIN,'
      
        '(select first 1 ocorrencias_os.data_e_hora from ocorrencias_os w' +
        'here nped = p.nped and tipo = p.tipo and cod_empresa = p.cod_emp' +
        'resa and situacao = '#39'SAIDA'#39' and status_situacao = '#39'Finalizado'#39' o' +
        'rder by data_e_hora) as SAI_FIN,'
      
        '(select first 1 ocorrencias_os.data_e_hora from ocorrencias_os w' +
        'here nped = p.nped and tipo = p.tipo and cod_empresa = p.cod_emp' +
        'resa and situacao = '#39'ACERTO'#39' and status_situacao = '#39'Finalizado'#39' ' +
        'order by data_e_hora) as ACE_FIN'
      'from pedvenda p'
      
        'inner join clientes c on c.cod_cliente = p.cod_cliente and c.cod' +
        '_empresa = p.cod_empresa'
      
        'left join tipo_vendas tv on tv.tipo = p.tipo and tv.sigla = p.ti' +
        'pv'
      'where p.nped = 0  and p.cod_empresa = 0')
    Left = 657
    Top = 484
  end
  object SpMovEst: TIBStoredProc
    Database = dtmAtivo.bancoHw
    Transaction = IBTransPedVenda
    StoredProcName = 'MOVIMENTA_ESTOQUE'
    Left = 748
    Top = 1
  end
  object qrOpPag: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransPedVenda
    SQL.Strings = (
      'select c.codigo_ctrl,'
      'c.docs,'
      'cp.desc_cond_pag,'
      'cp.cod_cond_pag,'
      'rv.tipovnd_os,'
      'rv.valormindoc,'
      'rv.valormaxdoc,'
      'rv.parcelamin,'
      'rv.parcelamax,'
      'rv.maxparcelas,'
      'rv.max_desc,'
      'rv.max_descprod,'
      'rv.max_descserv,'
      'rv.prazomax,'
      'rv.cod_regravnd,'
      
        '(select qtde_parc from retorna_qtde_cond_pag(cp.desc_cond_pag)) ' +
        'qtde_parc,'
      
        'coalesce((select dias_prazo from retorna_qtde_cond_pag(cp.desc_c' +
        'ond_pag)), 0) dias_prazo,'
      'case when ((rv.max_desc >= :pMax_desc)'
      '            and (rv.permitedesc = '#39'S'#39')'
      '            and (rv.max_descprod >= :pMax_descprod)'
      '            and (rv.max_descserv>= :pMax_descserv)'
      
        '            and (rv.vlvnd_mindesc <= :pvlvnd_mindesc)) then '#39'Lib' +
        'erado'#39
      '     when (coalesce(rv.permitedesc, '#39#39') = '#39'N'#39') then '#39'Barrado'#39
      '     else '#39'Barrado'#39' end as Status,'
      'rv.sobrepor_promocao,'
      'rv.sobrepor_tabpreco,'
      'rv.sobrepor_maxdescprod,'
      'rv.vlvnd_mindesc,'
      'c.nome_ctrl  from regras_vendas rv'
      
        'inner join REGRAVND_CONDPAG rc on rv.cod_regravnd=rc.cod_regravn' +
        'd and rv.cod_empresa=rc.cod_empresa'
      
        'inner join cond_pag cp  on rc.cod_cond_pag=cp.cod_cond_pag  inne' +
        'r join controles c'
      'on c.codigo_ctrl=rv.codigo_ctrl and c.codigo_emp=rc.cod_empresa'
      
        'where ((rv.pessoafisica = :pPessoafisica) or (rv.pessoafisica ='#39 +
        'A'#39'))'
      
        'and rv.tipovnd_os = :pTipovnd_os and rv.tipo= :pTipo  and rv.cod' +
        '_empresa=1 order by Status desc,1,2')
    Left = 865
    Top = 484
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pMax_desc'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pMax_descprod'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pMax_descserv'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pvlvnd_mindesc'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pPessoafisica'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pTipovnd_os'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pTipo'
        ParamType = ptUnknown
      end>
  end
  object dspOpPag: TDataSetProvider
    DataSet = qrOpPag
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 865
    Top = 526
  end
  object cdsOpPag: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspOpPag'
    BeforeOpen = cdsPedVendaBeforeOpen
    Left = 865
    Top = 568
    object cdsOpPagCOD_REGRAVND: TIntegerField
      DisplayLabel = 'Cod. Regra'
      FieldName = 'COD_REGRAVND'
      Required = True
    end
    object cdsOpPagCODIGO_CTRL: TIntegerField
      DisplayLabel = 'Controle'
      FieldName = 'CODIGO_CTRL'
      Required = True
    end
    object cdsOpPagDOCS: TStringField
      FieldName = 'DOCS'
      FixedChar = True
      Size = 2
    end
    object cdsOpPagDESC_COND_PAG: TStringField
      DisplayLabel = 'Condi'#231#227'o de Pagamento'
      FieldName = 'DESC_COND_PAG'
      Size = 30
    end
    object cdsOpPagMAX_DESCPROD: TFloatField
      DisplayLabel = 'Max Desc Prod (%)'
      FieldName = 'MAX_DESCPROD'
      DisplayFormat = '##0.000 %'
    end
    object cdsOpPagMAX_DESCSERV: TFloatField
      DisplayLabel = 'Max Desc Serv (%)'
      FieldName = 'MAX_DESCSERV'
      DisplayFormat = '##0.000 %'
    end
    object cdsOpPagMAX_DESC: TFloatField
      DisplayLabel = 'Max Desc Doc (%)'
      FieldName = 'MAX_DESC'
      DisplayFormat = '##0.000 %'
    end
    object cdsOpPagVALORMINDOC: TFloatField
      DisplayLabel = 'Valor Min Doc'
      FieldName = 'VALORMINDOC'
      currency = True
    end
    object cdsOpPagVALORMAXDOC: TFloatField
      DisplayLabel = 'Valor Max Doc'
      FieldName = 'VALORMAXDOC'
      currency = True
    end
    object cdsOpPagPARCELAMIN: TFloatField
      DisplayLabel = 'Valor Min Parcela'
      FieldName = 'PARCELAMIN'
      currency = True
    end
    object cdsOpPagPARCELAMAX: TFloatField
      DisplayLabel = 'Valor Max Parcela'
      FieldName = 'PARCELAMAX'
      currency = True
    end
    object cdsOpPagVLVND_MINDESC: TFloatField
      DisplayLabel = 'Min. para desconto'
      FieldName = 'VLVND_MINDESC'
      currency = True
    end
    object cdsOpPagQTDE_PARC: TIntegerField
      DisplayLabel = 'Qtde Parc'
      FieldName = 'QTDE_PARC'
    end
    object cdsOpPagMAXPARCELAS: TIntegerField
      DisplayLabel = 'Max Parc'
      FieldName = 'MAXPARCELAS'
    end
    object cdsOpPagDIAS_PRAZO: TIntegerField
      DisplayLabel = 'Dias Prazo'
      FieldName = 'DIAS_PRAZO'
    end
    object cdsOpPagPRAZOMAX: TIntegerField
      DisplayLabel = 'Max Prazo'
      FieldName = 'PRAZOMAX'
    end
    object cdsOpPagNOME_CTRL: TStringField
      DisplayLabel = 'Nome Controle'
      FieldName = 'NOME_CTRL'
      Size = 35
    end
    object cdsOpPagSOBREPOR_PROMOCAO: TStringField
      DisplayLabel = 'Desc. Sobre Promo'#231#227'o'
      FieldName = 'SOBREPOR_PROMOCAO'
      FixedChar = True
      Size = 1
    end
    object cdsOpPagSOBREPOR_TABPRECO: TStringField
      DisplayLabel = 'Desc. Sobre Tab. Pre'#231'o'
      FieldName = 'SOBREPOR_TABPRECO'
      FixedChar = True
      Size = 1
    end
    object cdsOpPagSOBREPOR_MAXDESCPROD: TStringField
      DisplayLabel = 'Desc. Alem do Perm.'
      FieldName = 'SOBREPOR_MAXDESCPROD'
      FixedChar = True
      Size = 1
    end
    object cdsOpPagCOD_COND_PAG: TIntegerField
      DisplayLabel = 'Cod. Cond.Pagamento'
      FieldName = 'COD_COND_PAG'
      Required = True
    end
    object cdsOpPagTIPOVND_OS: TStringField
      DisplayLabel = 'Tipo Venda/OS'
      FieldName = 'TIPOVND_OS'
      Required = True
      Size = 10
    end
    object cdsOpPagSTATUS: TStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      FixedChar = True
      Size = 8
    end
  end
  object dsOpPag: TDataSource
    DataSet = cdsOpPag
    Left = 868
    Top = 614
  end
  object qrBuscas3: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransPedVenda
    Left = 401
    Top = 49
  end
  object dsNFSE_CANCELADAS: TDataSource
    DataSet = cdsNFSE_CANCELADAS
    Left = 540
    Top = 654
  end
  object cdsNFSE_CANCELADAS: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspNFSE_CANCELADAS'
    BeforeOpen = cdsPedVendaBeforeOpen
    Left = 537
    Top = 608
    object cdsNFSE_CANCELADASNUM_NFSE: TLargeintField
      DisplayLabel = 'Num NFS-e'
      FieldName = 'NUM_NFSE'
      Required = True
    end
    object cdsNFSE_CANCELADASCOD_RPS: TIntegerField
      FieldName = 'COD_RPS'
      Required = True
    end
    object cdsNFSE_CANCELADASCOD_CLIENTE: TIntegerField
      DisplayLabel = 'Cod Cliente'
      FieldName = 'COD_CLIENTE'
    end
    object cdsNFSE_CANCELADASCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsNFSE_CANCELADASNOME_CLIENTE: TStringField
      DisplayLabel = 'Nome Cliente'
      FieldName = 'NOME_CLIENTE'
      Size = 60
    end
    object cdsNFSE_CANCELADASVALOR_NFSE: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VALOR_NFSE'
    end
    object cdsNFSE_CANCELADASEMISSAO_NFSE: TDateTimeField
      DisplayLabel = 'Data Emiss'#227'o NFSEEXT'
      FieldName = 'EMISSAO_NFSE'
    end
    object cdsNFSE_CANCELADASDATA_CANC: TDateTimeField
      DisplayLabel = 'Data Cancelamento'
      FieldName = 'DATA_CANC'
    end
    object cdsNFSE_CANCELADASMOTIVO_CANCELAMENTO: TStringField
      DisplayLabel = 'Motivo Cancelamento'
      FieldName = 'MOTIVO_CANCELAMENTO'
      Size = 60
    end
    object cdsNFSE_CANCELADASSERIE: TIntegerField
      FieldName = 'SERIE'
    end
    object cdsNFSE_CANCELADASSUB_SERIE: TIntegerField
      FieldName = 'SUB_SERIE'
    end
    object cdsNFSE_CANCELADASATIVO: TIntegerField
      FieldName = 'ATIVO'
    end
  end
  object dspNFSE_CANCELADAS: TDataSetProvider
    DataSet = qrNFSE_CANCELADAS
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 537
    Top = 566
  end
  object qrNFSE_CANCELADAS: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransPedVenda
    SQL.Strings = (
      
        'select * from nfse_canceladas n where n.num_nfse = 0 and n.cod_r' +
        'ps = 0 and n.n_os = 0 and n.cod_empresa = 0 and n.seqid = 0')
    Left = 537
    Top = 524
  end
  object qrRVnd: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransPedVenda
    SQL.Strings = (
      'select  rv.cod_regravnd, '
      'rv.descricao, '
      #39#39' pessoafisica, '
      #39#39' tipo,'
      '0 codigo_ctrl, '
      '0 cod_cond_pag, '
      #39#39' BARRADO, '
      'rv.SOBREPOR_PROMOCAO,'
      'rv.SOBREPOR_TABPRECO,'
      'rv.SOBREPOR_MAXDESCPROD  from regras_vendas rv'
      'where rv.cod_empresa=1 and rv.ativo=1')
    Left = 809
    Top = 484
  end
  object dspRVnd: TDataSetProvider
    DataSet = qrRVnd
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 809
    Top = 526
  end
  object cdsRVnd: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRVnd'
    BeforeOpen = cdsPedVendaBeforeOpen
    Left = 809
    Top = 568
    object cdsRVndSEL: TStringField
      DisplayLabel = 'Sel'
      FieldKind = fkInternalCalc
      FieldName = 'SEL'
      Size = 1
    end
    object IntegerField20: TIntegerField
      DisplayLabel = 'Regra'
      DisplayWidth = 6
      FieldName = 'COD_REGRAVND'
      Required = True
    end
    object StringField32: TStringField
      DisplayLabel = 'Regra Venda'
      FieldName = 'DESCRICAO'
      Size = 70
    end
    object cdsRVndNOME_CTRL: TStringField
      DisplayLabel = 'Controle'
      FieldName = 'NOME_CTRL'
      Size = 35
    end
    object cdsRVndQSEQPERF: TIntegerField
      FieldName = 'QSEQPERF'
    end
    object cdsRVndTIPO: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Required = True
      Visible = False
      FixedChar = True
      Size = 3
    end
    object cdsRVndSOBREPOR_PROMOCAO: TStringField
      FieldName = 'SOBREPOR_PROMOCAO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object cdsRVndSOBREPOR_TABPRECO: TStringField
      FieldName = 'SOBREPOR_TABPRECO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object cdsRVndSOBREPOR_MAXDESCPROD: TStringField
      FieldName = 'SOBREPOR_MAXDESCPROD'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object cdsRVndCODIGO_CTRL: TIntegerField
      FieldName = 'CODIGO_CTRL'
    end
    object cdsRVndSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 8
    end
    object cdsRVndCOD_COND_PAG: TIntegerField
      FieldName = 'COD_COND_PAG'
    end
    object cdsRVndPESSOAFISICA: TStringField
      FieldName = 'PESSOAFISICA'
      Size = 1
    end
    object cdsRVndTIPOVND_OS: TStringField
      FieldName = 'TIPOVND_OS'
      Size = 40
    end
  end
  object dsRVnd: TDataSource
    DataSet = cdsRVnd
    Left = 812
    Top = 614
  end
  object qrRegrasVSel: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransPedVenda
    SQL.Strings = (
      'select  *  from regras_vendas rv'
      'where rv.cod_empresa=1 and rv.ativo=1')
    Left = 745
    Top = 484
  end
  object dspRegrasVSel: TDataSetProvider
    DataSet = qrRegrasVSel
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 745
    Top = 526
  end
  object cdsRegrasVSel: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRegrasVSel'
    BeforeOpen = cdsPedVendaBeforeOpen
    Left = 745
    Top = 568
    object IntegerField18: TIntegerField
      DisplayLabel = 'Cod.'
      DisplayWidth = 6
      FieldName = 'COD_REGRAVND'
      Required = True
    end
    object StringField34: TStringField
      DisplayLabel = 'Regra Venda'
      FieldName = 'DESCRICAO'
      Size = 32
    end
    object StringField35: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Required = True
      FixedChar = True
      Size = 3
    end
    object StringField36: TStringField
      DisplayLabel = 'Sobrepor Promo'#231#227'o'
      FieldName = 'SOBREPOR_PROMOCAO'
      FixedChar = True
      Size = 1
    end
    object StringField37: TStringField
      DisplayLabel = 'Sobrepor Tab. Pre'#231'o'
      FieldName = 'SOBREPOR_TABPRECO'
      FixedChar = True
      Size = 1
    end
    object StringField38: TStringField
      DisplayLabel = 'Sobrepor Max. Desc. Prod.'
      FieldName = 'SOBREPOR_MAXDESCPROD'
      FixedChar = True
      Size = 1
    end
    object cdsRegrasVSelCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
      Visible = False
    end
    object cdsRegrasVSelPESSOAFISICA: TStringField
      DisplayLabel = 'Pessoa F'#237'sica'
      FieldName = 'PESSOAFISICA'
      FixedChar = True
      Size = 1
    end
    object cdsRegrasVSelTIPOVND_OS: TStringField
      DisplayLabel = 'Tipo Venda/OS'
      FieldName = 'TIPOVND_OS'
      Required = True
      Size = 10
    end
    object cdsRegrasVSelCODIGO_CTRL: TIntegerField
      DisplayLabel = 'Controle'
      FieldName = 'CODIGO_CTRL'
      Required = True
    end
    object cdsRegrasVSelVALORMINDOC: TFloatField
      DisplayLabel = 'Valor Min. Doc'
      FieldName = 'VALORMINDOC'
    end
    object cdsRegrasVSelPARCELAMIN: TFloatField
      DisplayLabel = 'Parcela M'#237'nima'
      FieldName = 'PARCELAMIN'
    end
    object cdsRegrasVSelMAXPARCELAS: TIntegerField
      DisplayLabel = 'M'#225'ximo de Parcelas'
      FieldName = 'MAXPARCELAS'
    end
    object cdsRegrasVSelPRAZOMAX: TIntegerField
      DisplayLabel = 'Prazo Max. em Dias'
      FieldName = 'PRAZOMAX'
    end
    object cdsRegrasVSelVLVND_MINDESC: TFloatField
      DisplayLabel = 'Min. para desconto'
      FieldName = 'VLVND_MINDESC'
    end
    object cdsRegrasVSelMAX_DESC: TFloatField
      DisplayLabel = 'M'#225'ximo de desconto(%)'
      FieldName = 'MAX_DESC'
    end
    object cdsRegrasVSelMAX_DESCPROD: TFloatField
      DisplayLabel = 'Max. Desconto Prod.'
      FieldName = 'MAX_DESCPROD'
    end
    object cdsRegrasVSelMAX_DESCSERV: TFloatField
      DisplayLabel = 'Max. Desconto Serv.'
      FieldName = 'MAX_DESCSERV'
    end
    object cdsRegrasVSelNUMPARCELAS: TLargeintField
      DisplayLabel = 'Num. de Parcelas'
      FieldName = 'NUMPARCELAS'
      ReadOnly = True
    end
    object cdsRegrasVSelPERMITEDESC: TStringField
      DisplayLabel = 'Desconto'
      FieldName = 'PERMITEDESC'
      FixedChar = True
      Size = 1
    end
    object cdsRegrasVSelATIVO: TSmallintField
      FieldName = 'ATIVO'
      Visible = False
    end
  end
  object dsRegrasVSel: TDataSource
    DataSet = cdsRegrasVSel
    Left = 748
    Top = 614
  end
  object qrTipoServicoP: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransPedVenda
    SQL.Strings = (
      'SELECT 0 NITEM, TP.* FROM TIPO_SERVICO TP where TP.ativo=1')
    Left = 1073
    Top = 235
  end
  object dspTipoServicoP: TDataSetProvider
    DataSet = qrTipoServicoP
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1073
    Top = 280
  end
  object cdsTipoServicoP: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTipoServicoP'
    BeforeOpen = cdsPedVendaBeforeOpen
    Left = 1073
    Top = 322
    object IntegerField19: TIntegerField
      DisplayLabel = 'N'#186' Item'
      FieldName = 'NITEM'
    end
    object IntegerField21: TIntegerField
      DisplayLabel = 'Cod Servico'
      FieldName = 'COD_SERVICO'
      Required = True
    end
    object StringField31: TStringField
      DisplayLabel = 'Servico'
      FieldName = 'DESC_SERVICO'
      FixedChar = True
      Size = 60
    end
    object FloatField21: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VALOR_SERVICO'
    end
    object StringField33: TStringField
      Tag = 1
      FieldName = 'SHONDA'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object StringField39: TStringField
      Tag = 1
      FieldName = 'ALTCOD'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object DateTimeField13: TDateTimeField
      Tag = 1
      FieldName = 'DATA_CAD_TIPO'
      Visible = False
    end
    object DateTimeField14: TDateTimeField
      Tag = 1
      FieldName = 'DATA_MOD_TIPO'
      Visible = False
    end
    object StringField40: TStringField
      Tag = 1
      FieldName = 'STIPO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object FloatField22: TFloatField
      FieldName = 'TMO'
    end
    object FloatField23: TFloatField
      Tag = 1
      FieldName = 'ALIQ_ISS'
      Visible = False
    end
    object IntegerField22: TIntegerField
      Tag = 1
      FieldName = 'ATIVO'
      Visible = False
    end
    object IntegerField23: TIntegerField
      Tag = 1
      FieldName = 'COD_ESPE_SEG'
      Visible = False
    end
    object FloatField24: TFloatField
      DisplayLabel = 'CFOP'
      FieldName = 'CODIGO_NOP'
    end
    object StringField41: TStringField
      Tag = 1
      FieldName = 'CTISS'
      Visible = False
      Size = 9
    end
    object StringField42: TStringField
      Tag = 1
      FieldName = 'CSDECVLUNT'
      Visible = False
      Size = 1
    end
  end
  object dsTipoServicoP: TDataSource
    DataSet = cdsTipoServicoP
    Left = 1074
    Top = 362
  end
  object IBTransAgenda: TIBTransaction
    DefaultDatabase = dtmAtivo.bancoHw
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 872
    Top = 177
  end
  object qrServicosSug: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransPedVenda
    SQL.Strings = (
      'select sug_os.*, regras_sug.descricao from sug_os'
      
        'inner join regras_sug_itens on regras_sug_itens.codigo = sug_os.' +
        'cod_serv_sug and regras_sug_itens.cod_empresa = sug_os.cod_empre' +
        'sa'
      
        'inner join regras_sug on regras_sug.codigo = regras_sug_itens.co' +
        'digo and regras_sug.codigo = regras_sug_itens.cod_empresa'
      'where sug_os.cod_empresa = 1')
    Left = 1033
    Top = 476
  end
  object dspServicosSug: TDataSetProvider
    DataSet = qrServicosSug
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1033
    Top = 518
  end
  object cdsServicosSug: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspServicosSug'
    BeforeOpen = cdsPedVendaBeforeOpen
    Left = 1033
    Top = 560
    object cdsServicosSugSEL: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'SEL'
      Size = 1
    end
    object cdsServicosSugCOD_SUG_OS: TIntegerField
      FieldName = 'COD_SUG_OS'
      Required = True
    end
    object cdsServicosSugCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsServicosSugCOD_EQUIP: TIntegerField
      FieldName = 'COD_EQUIP'
    end
    object cdsServicosSugCOD_VEIC: TIntegerField
      FieldName = 'COD_VEIC'
    end
    object cdsServicosSugCHASSI: TStringField
      FieldName = 'CHASSI'
      Size = 17
    end
    object cdsServicosSugPLACA: TStringField
      FieldName = 'PLACA'
      Size = 17
    end
    object cdsServicosSugUS_CAD: TIntegerField
      FieldName = 'US_CAD'
    end
    object cdsServicosSugDATA_CAD: TDateTimeField
      FieldName = 'DATA_CAD'
    end
    object cdsServicosSugHORA_CAD: TStringField
      FieldName = 'HORA_CAD'
      FixedChar = True
      Size = 8
    end
    object cdsServicosSugKM: TIntegerField
      FieldName = 'KM'
    end
    object cdsServicosSugNDOC: TIntegerField
      FieldName = 'NDOC'
    end
    object cdsServicosSugTPDOC: TStringField
      FieldName = 'TPDOC'
      FixedChar = True
      Size = 3
    end
    object cdsServicosSugCOD_SERV_SUG: TIntegerField
      FieldName = 'COD_SERV_SUG'
      Required = True
    end
    object cdsServicosSugCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
      Required = True
    end
    object cdsServicosSugATIVO: TIntegerField
      FieldName = 'ATIVO'
    end
    object cdsServicosSugDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 50
    end
  end
  object dsServicosSug: TDataSource
    DataSet = cdsServicosSug
    Left = 1036
    Top = 606
  end
  object qrParticipante: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransPedVenda
    SQL.Strings = (
      
        'SELECT COD_PARTICIPANTE, NOME_PARTICIPANTE, PC_VEND_PROD FROM PA' +
        'RTICIPANTE')
    Left = 1178
    Top = 27
  end
  object dspParticipante: TDataSetProvider
    DataSet = qrParticipante
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1178
    Top = 75
  end
  object cdsParticipante: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspParticipante'
    BeforeOpen = cdsPedVendaBeforeOpen
    Left = 1178
    Top = 120
    object cdsParticipanteCOD_PARTICIPANTE: TIntegerField
      FieldName = 'COD_PARTICIPANTE'
      Required = True
    end
    object cdsParticipanteNOME_PARTICIPANTE: TStringField
      FieldName = 'NOME_PARTICIPANTE'
      Size = 35
    end
    object cdsParticipantePC_VEND_PROD: TFloatField
      FieldName = 'PC_VEND_PROD'
    end
  end
  object dsParticipante: TDataSource
    DataSet = cdsParticipante
    Left = 1181
    Top = 165
  end
  object qrProdutosPorQtde: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransPedVenda
    SQL.Strings = (
      'select pq.*,'
      'tipo_preco.usar_debcred as usar_debcred_tab, '
      
        'pr.descr_prod, pr.num_fab_prod, pr.prec_tab_prod, pr.prec_public' +
        'o from preco_produtos_qtde pq'
      
        'left join tipo_preco on tipo_preco.cod_tppreco = 6 and tipo_prec' +
        'o.cod_empresa = pq.cod_empresa'
      
        'inner join produtos pr on pr.grupo_prod = pq.grupo_prod and pr.c' +
        'od_prod = pq.cod_prod and pr.cod_empresa = pq.cod_empresa'
      'where pq.grupo_prod = :grupo_prod and pq.cod_prod = :cod_prod'
      
        'and pq.cod_empresa = :cod_empresa and ((pq.sigla = '#39'0'#39') or (pq.s' +
        'igla = :sigla))'
      'and pq.quant > 0'
      '')
    Left = 1074
    Top = 27
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
        Name = 'COD_EMPRESA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SIGLA'
        ParamType = ptUnknown
      end>
  end
  object dspProdutosPorQtde: TDataSetProvider
    DataSet = qrProdutosPorQtde
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1074
    Top = 75
  end
  object cdsProdutosPorQtde: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProdutosPorQtde'
    BeforeOpen = cdsPedVendaBeforeOpen
    Left = 1074
    Top = 120
    object cdsProdutosPorQtdeTEMP: TStringField
      DisplayLabel = 'Condicao'
      FieldKind = fkInternalCalc
      FieldName = 'TEMP'
    end
    object cdsProdutosPorQtdeQUANT: TFloatField
      DisplayLabel = 'Quantidade'
      FieldName = 'QUANT'
    end
    object cdsProdutosPorQtdePRECO_VENDA: TFloatField
      DisplayLabel = 'Preco Venda'
      FieldName = 'PRECO_VENDA'
      DisplayFormat = '##0.00'
    end
    object cdsProdutosPorQtdePORCENTAGEM: TFloatField
      DisplayLabel = 'Perc'
      FieldName = 'PORCENTAGEM'
      DisplayFormat = '##0.00'
    end
    object cdsProdutosPorQtdeMAX_DESC: TFloatField
      DisplayLabel = 'Desc Max (%)'
      FieldName = 'MAX_DESC'
      DisplayFormat = '##0.00'
    end
    object cdsProdutosPorQtdeDESCR_PROD: TStringField
      Tag = 1
      DisplayLabel = 'Descricao'
      FieldName = 'DESCR_PROD'
      FixedChar = True
      Size = 75
    end
    object cdsProdutosPorQtdeNUM_FAB_PROD: TStringField
      Tag = 1
      DisplayLabel = 'Num Fab Prod'
      FieldName = 'NUM_FAB_PROD'
      FixedChar = True
    end
    object cdsProdutosPorQtdeGRUPO_PROD: TIntegerField
      Tag = 1
      DisplayLabel = 'Grupo'
      FieldName = 'GRUPO_PROD'
      Required = True
    end
    object cdsProdutosPorQtdeCOD_PROD: TStringField
      Tag = 1
      DisplayLabel = 'Codigo'
      FieldName = 'COD_PROD'
      Required = True
      FixedChar = True
      Size = 6
    end
    object cdsProdutosPorQtdeCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsProdutosPorQtdePREC_TAB_PROD: TFloatField
      DisplayLabel = 'Preco Varejo'
      FieldName = 'PREC_TAB_PROD'
    end
    object cdsProdutosPorQtdePREC_PUBLICO: TFloatField
      DisplayLabel = 'Preco Atacado'
      FieldName = 'PREC_PUBLICO'
    end
    object cdsProdutosPorQtdeUSAR_DEBCRED: TStringField
      FieldName = 'USAR_DEBCRED'
      FixedChar = True
      Size = 1
    end
    object cdsProdutosPorQtdeUSAR_DEBCRED_TAB: TStringField
      FieldName = 'USAR_DEBCRED_TAB'
      FixedChar = True
      Size = 1
    end
  end
  object dsProdutosPorQtde: TDataSource
    DataSet = cdsProdutosPorQtde
    Left = 1077
    Top = 165
  end
  object qrCTPPed: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransPedVenda
    SQL.Strings = (
      
        'select ctp.cod_contrp, ctp.n_conta_plc, ctp.codigo_ctrl, ctp.nom' +
        'e_for_ctp, ctp.n_doc_ctp,'
      
        'ctp.valor_ctp, ctp.valor_pago, ctp.status_ctp, ctp.datq_ctp, ctp' +
        '.HISTORICO_CTP, p.desc_plc, ctr.nome_ctrl from contas_a_pagar ct' +
        'p'
      'inner join p_contas p on p.n_conta_plc = ctp.n_conta_plc'
      
        'inner join controles ctr on ctr.codigo_ctrl = ctp.codigo_ctrl an' +
        'd ctr.codigo_emp = ctp.codigo_emp'
      
        'where ctp.nped = :nped and ctp.tipo_nped = :tipo_nped and ctp.co' +
        'digo_emp = :codigo_emp')
    Left = 1282
    Top = 27
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'nped'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'tipo_nped'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'codigo_emp'
        ParamType = ptUnknown
      end>
  end
  object dspCTPPed: TDataSetProvider
    DataSet = qrCTPPed
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1282
    Top = 75
  end
  object cdsCTPPed: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCTPPed'
    BeforeOpen = cdsPedVendaBeforeOpen
    Left = 1282
    Top = 120
    object cdsCTPPedCOD_CONTRP: TIntegerField
      DisplayLabel = 'Codigo Seq. Pagar'
      FieldName = 'COD_CONTRP'
      Required = True
    end
    object cdsCTPPedN_CONTA_PLC: TFloatField
      DisplayLabel = 'Num Conta Plano'
      FieldName = 'N_CONTA_PLC'
    end
    object cdsCTPPedNOME_FOR_CTP: TStringField
      DisplayLabel = 'Nome Fornecedor'
      FieldName = 'NOME_FOR_CTP'
      Size = 35
    end
    object cdsCTPPedCODIGO_CTRL: TIntegerField
      DisplayLabel = 'Cod Controle'
      FieldName = 'CODIGO_CTRL'
      Required = True
    end
    object cdsCTPPedN_DOC_CTP: TStringField
      DisplayLabel = 'Num Documento'
      FieldName = 'N_DOC_CTP'
    end
    object cdsCTPPedVALOR_CTP: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VALOR_CTP'
      currency = True
    end
    object cdsCTPPedVALOR_PAGO: TFloatField
      DisplayLabel = 'Valor Pago'
      FieldName = 'VALOR_PAGO'
      currency = True
    end
    object cdsCTPPedHISTORICO_CTP: TStringField
      DisplayLabel = 'Historico'
      FieldName = 'HISTORICO_CTP'
      Size = 100
    end
    object cdsCTPPedSTATUS_CTP: TStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS_CTP'
      FixedChar = True
      Size = 10
    end
    object cdsCTPPedDATQ_CTP: TDateTimeField
      DisplayLabel = 'Data Quita'#231#227'o'
      FieldName = 'DATQ_CTP'
    end
    object cdsCTPPedDESC_PLC: TStringField
      DisplayLabel = 'Plano de conta'
      FieldName = 'DESC_PLC'
      Required = True
      FixedChar = True
      Size = 30
    end
    object cdsCTPPedNOME_CTRL: TStringField
      DisplayLabel = 'Controle'
      FieldName = 'NOME_CTRL'
      Size = 35
    end
  end
  object dsCTPPed: TDataSource
    DataSet = cdsCTPPed
    Left = 1277
    Top = 173
  end
  object qrComissaoPorVenda: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransPedVenda
    SQL.Strings = (
      
        'select pv.nped, pv.tipo, pv.data_ped, pv.data_fech, pv.cod_empre' +
        'sa,'
      
        'pv.valor_total, pv.vl_comissao_vend, pv.perc_comissao_vend, pv.v' +
        'l_comissao_vend1, pv.perc_comissao_vend1'
      'from pedvenda pv'
      'where pv.nped = 0 and pv.tipo = '#39'REQ'#39' and pv.cod_empresa = 1')
    Left = 1330
    Top = 219
  end
  object dspComissaoPorVenda: TDataSetProvider
    DataSet = qrComissaoPorVenda
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1330
    Top = 267
  end
  object cdsComissaoPorVenda: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspComissaoPorVenda'
    BeforeOpen = cdsPedVendaBeforeOpen
    Left = 1330
    Top = 312
    object cdsComissaoPorVendaNPED: TIntegerField
      FieldName = 'NPED'
      Required = True
    end
    object cdsComissaoPorVendaDATA_PED: TDateTimeField
      DisplayLabel = 'Data'
      FieldName = 'DATA_PED'
    end
    object cdsComissaoPorVendaDATA_FECH: TDateTimeField
      DisplayLabel = 'Data Fech'
      FieldName = 'DATA_FECH'
    end
    object cdsComissaoPorVendaTIPO: TStringField
      FieldName = 'TIPO'
      Required = True
      FixedChar = True
      Size = 3
    end
    object cdsComissaoPorVendaCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsComissaoPorVendaVL_COMISSAO_VEND: TFloatField
      FieldName = 'VL_COMISSAO_VEND'
    end
    object cdsComissaoPorVendaPERC_COMISSAO_VEND: TFloatField
      FieldName = 'PERC_COMISSAO_VEND'
    end
    object cdsComissaoPorVendaVL_COMISSAO_VEND1: TFloatField
      FieldName = 'VL_COMISSAO_VEND1'
    end
    object cdsComissaoPorVendaPERC_COMISSAO_VEND1: TFloatField
      FieldName = 'PERC_COMISSAO_VEND1'
    end
    object cdsComissaoPorVendaVALOR_TOTAL: TFloatField
      FieldName = 'VALOR_TOTAL'
    end
  end
  object dsComissaoPorVenda: TDataSource
    DataSet = cdsComissaoPorVenda
    Left = 1333
    Top = 357
  end
  object qrFormasPorVenda: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransPedVenda
    SQL.Strings = (
      
        'select cast(:pcod_empresa as Integer) as cod_empresa,fp.* from f' +
        'ormas_det(:pndoc, :ptipodoc, :pcod_empresa) fp'
      ''
      ''
      '')
    Left = 1603
    Top = 217
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pcod_empresa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pndoc'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ptipodoc'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pcod_empresa'
        ParamType = ptUnknown
      end>
  end
  object dspFormasPorVenda: TDataSetProvider
    DataSet = qrFormasPorVenda
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1603
    Top = 265
  end
  object cdsFormasPorVenda: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFormasPorVenda'
    BeforeOpen = cdsPedVendaBeforeOpen
    Left = 1603
    Top = 310
    object cdsFormasPorVendaSEQFORM: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'SEQFORM'
    end
    object cdsFormasPorVendaCOD_EMPRESA: TIntegerField
      DisplayLabel = 'C'#243'digo Empresa'
      FieldName = 'COD_EMPRESA'
    end
    object cdsFormasPorVendaNDOC: TStringField
      DisplayLabel = 'N'#186' Doc'
      FieldName = 'NDOC'
    end
    object cdsFormasPorVendaDATA_MOV: TDateTimeField
      DisplayLabel = 'Data Movimento'
      FieldName = 'DATA_MOV'
    end
    object cdsFormasPorVendaDATA_VENC: TDateTimeField
      DisplayLabel = 'Data Vencimento'
      FieldName = 'DATA_VENC'
    end
    object cdsFormasPorVendaVALORDOC: TFloatField
      DisplayLabel = 'Valor Doc'
      FieldName = 'VALORDOC'
      currency = True
    end
    object cdsFormasPorVendaCOD_CONTROLE: TIntegerField
      DisplayLabel = 'Cod Controle'
      FieldName = 'COD_CONTROLE'
    end
    object cdsFormasPorVendaNOME_CTRL: TStringField
      DisplayLabel = 'Controle'
      FieldName = 'NOME_CTRL'
      Size = 35
    end
    object cdsFormasPorVendaNPARCELA: TIntegerField
      DisplayLabel = 'N'#186' Parcela'
      FieldName = 'NPARCELA'
    end
    object cdsFormasPorVendaRECIBO: TStringField
      DisplayLabel = 'Recibo'
      FieldName = 'RECIBO'
      FixedChar = True
      Size = 1
    end
    object cdsFormasPorVendaHISTORICO: TStringField
      DisplayLabel = 'Hist'#243'rico'
      FieldName = 'HISTORICO'
      Size = 100
    end
    object cdsFormasPorVendaDOCS: TStringField
      Tag = 1
      DisplayLabel = 'Docs'
      FieldName = 'DOCS'
      Visible = False
      FixedChar = True
      Size = 2
    end
    object cdsFormasPorVendaREC_NUMVEND: TIntegerField
      Tag = 1
      FieldName = 'REC_NUMVEND'
      Visible = False
    end
    object cdsFormasPorVendaREC_TIPVEND: TStringField
      Tag = 1
      FieldName = 'REC_TIPVEND'
      Visible = False
      FixedChar = True
      Size = 3
    end
    object cdsFormasPorVendaPRG_FID: TStringField
      Tag = 1
      FieldName = 'PRG_FID'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object dsFormasPorVenda: TDataSource
    DataSet = cdsFormasPorVenda
    Left = 1606
    Top = 355
  end
  object qrItProdComissaoPorVenda: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransPedVenda
    SQL.Strings = (
      
        'select pp.nped, pp.tipo, pp.grupo_prod, pp.cod_prod, pp.nitem, p' +
        'p.cod_empresa, pp.cod_grade, pp.codigo_nop,'
      'pp.vltot_ped_item, pp.rateio_desc, pp.rateio_acresc, pp.status, '
      'pp.cod_vendedor,'
      'pp.vl_comissao_vend, '
      'pp.perc_comissao_vend,  '
      'pp.cod_vendedor1,'
      'pp.vl_comissao_vend1,'
      'pp.perc_comissao_vend1 from pedvenda_prod pp'
      
        'where pp.nped = :nped and pp.tipo = :tipo and pp.cod_empresa = :' +
        'cod_empresa'
      'and coalesce(pp.status, '#39#39') <> '#39'CANCELADO'#39
      'order by pp.nped, pp.tipo, pp.nitem')
    Left = 1466
    Top = 219
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'nped'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'tipo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cod_empresa'
        ParamType = ptUnknown
      end>
  end
  object dspItProdComissaoPorVenda: TDataSetProvider
    DataSet = qrItProdComissaoPorVenda
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1466
    Top = 267
  end
  object cdsItProdComissaoPorVenda: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspItProdComissaoPorVenda'
    BeforeOpen = cdsPedVendaBeforeOpen
    Left = 1466
    Top = 312
    object cdsItProdComissaoPorVendaNPED: TIntegerField
      FieldName = 'NPED'
      Required = True
    end
    object cdsItProdComissaoPorVendaTIPO: TStringField
      FieldName = 'TIPO'
      Required = True
      FixedChar = True
      Size = 3
    end
    object cdsItProdComissaoPorVendaGRUPO_PROD: TIntegerField
      FieldName = 'GRUPO_PROD'
      Required = True
    end
    object cdsItProdComissaoPorVendaCOD_PROD: TStringField
      FieldName = 'COD_PROD'
      Required = True
      FixedChar = True
      Size = 6
    end
    object cdsItProdComissaoPorVendaNITEM: TIntegerField
      FieldName = 'NITEM'
    end
    object cdsItProdComissaoPorVendaCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsItProdComissaoPorVendaCOD_GRADE: TIntegerField
      FieldName = 'COD_GRADE'
    end
    object cdsItProdComissaoPorVendaCODIGO_NOP: TFloatField
      FieldName = 'CODIGO_NOP'
    end
    object cdsItProdComissaoPorVendaVL_COMISSAO_VEND: TFloatField
      FieldName = 'VL_COMISSAO_VEND'
    end
    object cdsItProdComissaoPorVendaPERC_COMISSAO_VEND: TFloatField
      FieldName = 'PERC_COMISSAO_VEND'
    end
    object cdsItProdComissaoPorVendaVL_COMISSAO_VEND1: TFloatField
      FieldName = 'VL_COMISSAO_VEND1'
    end
    object cdsItProdComissaoPorVendaPERC_COMISSAO_VEND1: TFloatField
      FieldName = 'PERC_COMISSAO_VEND1'
    end
    object cdsItProdComissaoPorVendaSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 10
    end
    object cdsItProdComissaoPorVendaVLTOT_PED_ITEM: TFloatField
      FieldName = 'VLTOT_PED_ITEM'
    end
    object cdsItProdComissaoPorVendaCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
    end
    object cdsItProdComissaoPorVendaCOD_VENDEDOR1: TIntegerField
      FieldName = 'COD_VENDEDOR1'
    end
    object cdsItProdComissaoPorVendaRATEIO_DESC: TFloatField
      FieldName = 'RATEIO_DESC'
    end
    object cdsItProdComissaoPorVendaRATEIO_ACRESC: TFloatField
      FieldName = 'RATEIO_ACRESC'
    end
  end
  object dsItProdComissaoPorVenda: TDataSource
    DataSet = cdsItProdComissaoPorVenda
    Left = 1469
    Top = 357
  end
  object qrComissaoPorVendaCons: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransPedVenda
    SQL.Strings = (
      
        'select pv.nped, pv.tipo, pv.data_ped, pv.data_fech, pv.cod_empre' +
        'sa, pv.cod_cliente, pv.status_ped, pv.tot_prod, pv.valor_total, ' +
        'pv.obs_cxl_rq, pv.tipv, pv.autorizado_financeiro,'
      'pv.idmobile, pv.npedmob, pv.aprovada_gerente,'
      
        'c.nome_cliente, c.razao, c.cidade, c.limite_credito, case when r' +
        'trim(tf.status_f) = '#39'BARRADO'#39' then '#39'Sim'#39' else '#39'N'#227'o'#39' end barrado,' +
        ' c.cpfcgc,'
      'cp.desc_cond_pag,'
      'pv.cod_vendedor, col.nome_vendedor,'
      'pv.cod_vendedor1, part.nome_participante,'
      
        'cl.nome_ctrl, pv.vl_comissao_vend, pv.perc_comissao_vend, pv.vl_' +
        'comissao_vend1, pv.perc_comissao_vend1,'
      
        'coalesce((select sum(coalesce(pp.pcust_c, 0)) from pedvenda_prod' +
        ' pp'
      
        ' where pp.nped = pv.nped and pp.tipo = pv.tipo and pp.cod_empres' +
        'a = pv.cod_empresa), 0) custo_total,'
      
        '(pv.valor_total - coalesce((select sum(coalesce(pp.pcust_c, 0)) ' +
        'from pedvenda_prod pp'
      
        ' where pp.nped = pv.nped and pp.tipo = pv.tipo and pp.cod_empres' +
        'a = pv.cod_empresa'
      ' and (coalesce(pp.status,'#39#39') <> '#39'CANCELADO'#39')), 0)) lucro'
      ''
      'from pedvenda pv'
      
        'inner join clientes c on c.cod_cliente = pv.cod_cliente and c.co' +
        'd_empresa = pv.cod_empresa'
      
        'inner join tipo_vendas tv on tv.sigla = pv.tipv and tv.tipo = pv' +
        '.tipo'
      'inner join cond_pag cp on cp.cod_cond_pag = pv.cod_cond_pag'
      
        'left join controles cl on cl.codigo_ctrl = pv.cod_controle and c' +
        'l.codigo_emp = pv.cod_empresa'
      
        'left join colaborador col on col.cod_vendedor = pv.cod_vendedor ' +
        'and col.cod_empresa = pv.cod_empresa'
      
        'left join participante part on part.cod_participante = pv.cod_ve' +
        'ndedor1 and part.cod_empresa = pv.cod_empresa'
      
        'left join tipo_faturamento tf on tf.codigo_faturamento = c.codig' +
        'o_faturamento'
      'where pv.nped = 0 and pv.tipo = '#39'REQ'#39' and pv.cod_empresa = 1')
    Left = 1194
    Top = 227
  end
  object dspComissaoPorVendaCons: TDataSetProvider
    DataSet = qrComissaoPorVendaCons
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1194
    Top = 275
  end
  object cdsComissaoPorVendaCons: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspComissaoPorVendaCons'
    BeforeOpen = cdsPedVendaBeforeOpen
    Left = 1194
    Top = 320
    object IntegerField24: TIntegerField
      DisplayLabel = 'Num Ped'
      FieldName = 'NPED'
      Required = True
    end
    object StringField57: TStringField
      Tag = 1
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Required = True
      Visible = False
      FixedChar = True
      Size = 3
    end
    object cdsComissaoPorVendaConsDATA_PED: TDateTimeField
      DisplayLabel = 'Data Ped'
      FieldName = 'DATA_PED'
    end
    object cdsComissaoPorVendaConsDATA_FECH: TDateTimeField
      DisplayLabel = 'Data Fech'
      FieldName = 'DATA_FECH'
    end
    object IntegerField25: TIntegerField
      DisplayLabel = 'Cod Cliente'
      FieldName = 'COD_CLIENTE'
      Required = True
    end
    object FloatField25: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VALOR_TOTAL'
      DisplayFormat = '###,###,##0.00'
      currency = True
    end
    object StringField43: TStringField
      DisplayLabel = 'Obs'
      FieldName = 'OBS_CXL_RQ'
      Size = 50
    end
    object StringField44: TStringField
      DisplayLabel = 'Tip V.'
      FieldName = 'TIPV'
      FixedChar = True
      Size = 1
    end
    object StringField45: TStringField
      DisplayLabel = 'Autorizado'
      FieldName = 'AUTORIZADO_FINANCEIRO'
      FixedChar = True
      Size = 1
    end
    object IntegerField26: TIntegerField
      DisplayLabel = 'ID Mobile'
      FieldName = 'IDMOBILE'
    end
    object IntegerField27: TIntegerField
      DisplayLabel = 'Num Pedido Mobile'
      FieldName = 'NPEDMOB'
    end
    object StringField46: TStringField
      DisplayLabel = 'Gerente Aprovou'
      FieldName = 'APROVADA_GERENTE'
      FixedChar = True
      Size = 1
    end
    object StringField47: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'NOME_CLIENTE'
      Required = True
      FixedChar = True
      Size = 35
    end
    object StringField48: TStringField
      Tag = 1
      DisplayLabel = 'Cliente'
      FieldName = 'RAZAO'
      Required = True
      Visible = False
      Size = 60
    end
    object StringField49: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'CIDADE'
      Required = True
      Size = 30
    end
    object FloatField26: TFloatField
      DisplayLabel = 'Limite Cr'#233'dito'
      FieldName = 'LIMITE_CREDITO'
    end
    object StringField50: TStringField
      DisplayLabel = 'Barrado'
      FieldName = 'BARRADO'
      FixedChar = True
      Size = 3
    end
    object StringField51: TStringField
      DisplayLabel = 'CNPJ/CPF'
      FieldName = 'CPFCGC'
      Size = 18
    end
    object StringField52: TStringField
      DisplayLabel = 'Prazo'
      FieldName = 'DESC_COND_PAG'
      Size = 30
    end
    object StringField53: TStringField
      DisplayLabel = 'Vendedor'
      FieldName = 'NOME_VENDEDOR'
      Size = 35
    end
    object StringField54: TStringField
      DisplayLabel = 'Participante'
      FieldName = 'NOME_PARTICIPANTE'
      Size = 35
    end
    object StringField55: TStringField
      DisplayLabel = 'Forma Pagamento'
      FieldName = 'NOME_CTRL'
      Size = 35
    end
    object FloatField27: TFloatField
      DisplayLabel = 'Comissao Vend'
      FieldName = 'VL_COMISSAO_VEND'
      currency = True
    end
    object FloatField28: TFloatField
      DisplayLabel = 'Perc Comissao Vend'
      FieldName = 'PERC_COMISSAO_VEND'
    end
    object FloatField29: TFloatField
      DisplayLabel = 'Comissao Vend1'
      FieldName = 'VL_COMISSAO_VEND1'
      currency = True
    end
    object FloatField30: TFloatField
      DisplayLabel = 'Perc Comissao Vend1'
      FieldName = 'PERC_COMISSAO_VEND1'
    end
    object FloatField31: TFloatField
      Tag = 1
      FieldName = 'TOT_PROD'
      Visible = False
      DisplayFormat = '###,###,##0.00'
      currency = True
    end
    object FloatField32: TFloatField
      Tag = 1
      FieldName = 'CUSTO_TOTAL'
      Visible = False
      DisplayFormat = '###,###,##0.00'
      currency = True
    end
    object FloatField33: TFloatField
      FieldName = 'LUCRO'
      DisplayFormat = '###,###,##0.00'
      currency = True
    end
    object StringField56: TStringField
      Tag = 1
      FieldName = 'STATUS_PED'
      Visible = False
      Size = 10
    end
    object IntegerField28: TIntegerField
      Tag = 1
      FieldName = 'COD_EMPRESA'
      Required = True
      Visible = False
    end
    object IntegerField29: TIntegerField
      Tag = 1
      FieldName = 'COD_VENDEDOR'
      Required = True
      Visible = False
    end
    object IntegerField30: TIntegerField
      Tag = 1
      FieldName = 'COD_VENDEDOR1'
      Visible = False
    end
  end
  object dsComissaoPorVendaCons: TDataSource
    DataSet = cdsComissaoPorVendaCons
    Left = 1197
    Top = 365
  end
  object qrComissaoPart: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransPedVenda
    SQL.Strings = (
      'select pp.cod_vendedor1, part.nome_participante,'
      'part.pc_vend_prod,'
      'max(coalesce(pp.perc_comissao_vend1, 0)) perc_comissao_vend1,'
      'sum(coalesce(pp.vl_comissao_vend1, 0)) vl_comissao_vend1,'
      
        'sum(coalesce(pp.vltot_ped_item, 0)) valor_total from pedvenda_pr' +
        'od pp'
      
        'inner join participante part on part.cod_participante = pp.cod_v' +
        'endedor1 and part.cod_empresa = pp.cod_empresa'
      
        'where pp.nped = :nped and pp.tipo = :tipo and pp.cod_empresa = :' +
        'cod_empresa'
      'and (coalesce(pp.status,'#39#39') <> '#39'CANCELADO'#39')'
      'group by 1, 2, 3')
    Left = 1331
    Top = 449
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'nped'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'tipo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cod_empresa'
        ParamType = ptUnknown
      end>
  end
  object dspComissaoPart: TDataSetProvider
    DataSet = qrComissaoPart
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1331
    Top = 497
  end
  object cdsComissaoPart: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspComissaoPart'
    BeforeOpen = cdsPedVendaBeforeOpen
    Left = 1331
    Top = 542
    object cdsComissaoPartCOD_VENDEDOR1: TIntegerField
      FieldName = 'COD_VENDEDOR1'
    end
    object cdsComissaoPartNOME_PARTICIPANTE: TStringField
      FieldName = 'NOME_PARTICIPANTE'
      Size = 35
    end
    object cdsComissaoPartVALOR_TOTAL: TFloatField
      FieldName = 'VALOR_TOTAL'
    end
    object cdsComissaoPartPC_VEND_PROD: TFloatField
      FieldName = 'PC_VEND_PROD'
    end
    object cdsComissaoPartPERC_COMISSAO_VEND1: TFloatField
      FieldName = 'PERC_COMISSAO_VEND1'
    end
    object cdsComissaoPartVL_COMISSAO_VEND1: TFloatField
      FieldName = 'VL_COMISSAO_VEND1'
    end
  end
  object dsComissaoPart: TDataSource
    DataSet = cdsComissaoPart
    Left = 1334
    Top = 587
  end
  object qrComissaoVend: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransPedVenda
    SQL.Strings = (
      'select pp.cod_vendedor, col.nome_vendedor,'
      'col.pc_vend_prod,'
      'max(coalesce(pp.perc_comissao_vend, 0)) perc_comissao_vend,'
      'sum(coalesce(pp.vl_comissao_vend, 0)) vl_comissao_vend,'
      
        'sum(coalesce(pp.vltot_ped_item, 0)) valor_total from pedvenda_pr' +
        'od pp'
      
        'inner join colaborador col on col.cod_vendedor = pp.cod_vendedor' +
        ' and col.cod_empresa = pp.cod_empresa'
      
        'where pp.nped = :nped and pp.tipo = :tipo and pp.cod_empresa = :' +
        'cod_empresa'
      'and (coalesce(pp.status,'#39#39') <> '#39'CANCELADO'#39')'
      'group by 1, 2, 3')
    Left = 1194
    Top = 451
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'nped'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'tipo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cod_empresa'
        ParamType = ptUnknown
      end>
  end
  object dspComissaoVend: TDataSetProvider
    DataSet = qrComissaoVend
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1194
    Top = 499
  end
  object cdsComissaoVend: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspComissaoVend'
    BeforeOpen = cdsPedVendaBeforeOpen
    Left = 1194
    Top = 544
    object cdsComissaoVendCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
    end
    object cdsComissaoVendNOME_VENDEDOR: TStringField
      FieldName = 'NOME_VENDEDOR'
      Size = 35
    end
    object cdsComissaoVendVALOR_TOTAL: TFloatField
      FieldName = 'VALOR_TOTAL'
    end
    object cdsComissaoVendPC_VEND_PROD: TFloatField
      FieldName = 'PC_VEND_PROD'
    end
    object cdsComissaoVendPERC_COMISSAO_VEND: TFloatField
      FieldName = 'PERC_COMISSAO_VEND'
    end
    object cdsComissaoVendVL_COMISSAO_VEND: TFloatField
      FieldName = 'VL_COMISSAO_VEND'
    end
  end
  object dsComissaoVend: TDataSource
    DataSet = cdsComissaoVend
    Left = 1197
    Top = 589
  end
  object qrFormasEnvioEC: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = IBTransPedVenda
    SQL.Strings = (
      'select * from formas_envio_ec')
    Left = 1370
    Top = 19
  end
  object dspFormasEnvioEC: TDataSetProvider
    DataSet = qrFormasEnvioEC
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1370
    Top = 67
  end
  object cdsFormasEnvioEC: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFormasEnvioEC'
    BeforeOpen = cdsPedVendaBeforeOpen
    Left = 1370
    Top = 112
    object cdsFormasEnvioECCOD_FORMA: TIntegerField
      FieldName = 'COD_FORMA'
      Required = True
    end
    object cdsFormasEnvioECCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsFormasEnvioECDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 100
    end
    object cdsFormasEnvioECSTATUS: TIntegerField
      FieldName = 'STATUS'
    end
    object cdsFormasEnvioECDISPLAY: TStringField
      FieldName = 'DISPLAY'
      Size = 100
    end
  end
  object dsFormasEnvioEC: TDataSource
    DataSet = cdsFormasEnvioEC
    Left = 1365
    Top = 165
  end
  object SpVoltaEstEC: TIBStoredProc
    Database = dtmAtivo.bancoHw
    Transaction = IBTransPedVenda
    StoredProcName = 'MOVIMENTA_ESTOQUE_EC'
    Left = 1476
    Top = 25
  end
  object dsProdSim: TDataSource
    AutoEdit = False
    DataSet = cdsProdSim
    Left = 929
    Top = 175
  end
  object dsProd: TDataSource
    DataSet = cdsProd
    Left = 219
    Top = 374
  end
  object cdsItemProdTercTemp2: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 182
    Top = 694
  end
  object dsItemProdTercTemp2: TDataSource
    DataSet = cdsItemProdTercTemp2
    Left = 185
    Top = 742
  end
  object cdsItemServTercTemp2: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 446
    Top = 694
  end
  object dsItemServTercTemp2: TDataSource
    DataSet = cdsItemServTercTemp2
    Left = 449
    Top = 742
  end
  object cdsItemProdTercTemp: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 46
    Top = 694
    object cdsItemProdTercTempNPED: TIntegerField
      DisplayLabel = 'N'#186' Venda'
      FieldName = 'NPED'
    end
    object cdsItemProdTercTempTIPO: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object cdsItemProdTercTempCOD_EMPRESA: TIntegerField
      DisplayLabel = 'Cod. Empresa'
      FieldName = 'COD_EMPRESA'
    end
    object cdsItemProdTercTempDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object cdsItemProdTercTempQTDE: TFloatField
      DisplayLabel = 'Quantidade'
      FieldName = 'QTDE'
    end
    object cdsItemProdTercTempVL_UNIT: TFloatField
      DisplayLabel = 'Val. Unit'#225'rio'
      FieldName = 'VL_UNIT'
    end
    object cdsItemProdTercTempVL_TOTAL: TFloatField
      DisplayLabel = 'Val. total Item'
      FieldName = 'VL_TOTAL'
    end
    object cdsItemProdTercTempUNIDADE: TStringField
      DisplayLabel = 'Unidade'
      FieldName = 'UNIDADE'
      Size = 2
    end
    object cdsItemProdTercTempCOD_VENDEDOR: TIntegerField
      DisplayLabel = 'Cod Vendedor'
      FieldName = 'COD_VENDEDOR'
    end
    object cdsItemProdTercTempATIVO: TIntegerField
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
    object cdsItemProdTercTempNPEDORIGINADO: TIntegerField
      DisplayLabel = 'N'#186' Venda Originado'
      FieldName = 'NPEDORIGINADO'
    end
    object cdsItemProdTercTempTIPOORIGINADO: TStringField
      DisplayLabel = 'Tipo Originado'
      FieldName = 'TIPOORIGINADO'
      Size = 3
    end
    object cdsItemProdTercTempCOD_FORNECEDOR: TIntegerField
      DisplayLabel = 'Cod Fornecedor'
      FieldName = 'COD_FORNECEDOR'
    end
    object cdsItemProdTercTempNOME_FORNECEDOR: TStringField
      DisplayLabel = 'Fornecedor'
      FieldName = 'NOME_FORNECEDOR'
      Size = 35
    end
    object cdsItemProdTercTempVLCUSTO: TFloatField
      DisplayLabel = 'Custo Unit'#225'rio'
      FieldName = 'VLCUSTO'
    end
    object cdsItemProdTercTempVLCUSTO_TOT: TFloatField
      DisplayLabel = 'Custo Total'
      FieldName = 'VLCUSTO_TOT'
    end
    object cdsItemProdTercTempNPED_ORIGEM: TIntegerField
      DisplayLabel = 'N'#186' Venda Origem'
      FieldName = 'NPED_ORIGEM'
    end
    object cdsItemProdTercTempTIPO_ORIGEM: TStringField
      DisplayLabel = 'Tipo Origem'
      FieldName = 'TIPO_ORIGEM'
      Size = 3
    end
  end
  object dsItemProdTercTemp: TDataSource
    DataSet = cdsItemProdTercTemp
    Left = 49
    Top = 742
  end
  object cdsItemServTercTemp: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 318
    Top = 694
    object cdsItemServTercTempNPED: TIntegerField
      DisplayLabel = 'N'#186' Venda'
      FieldName = 'NPED'
    end
    object cdsItemServTercTempTIPO: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object cdsItemServTercTempCOD_EMPRESA: TIntegerField
      DisplayLabel = 'Cod. Empresa'
      FieldName = 'COD_EMPRESA'
    end
    object cdsItemServTercTempDESCR_SERVT: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCR_SERVT'
      Size = 35
    end
    object cdsItemServTercTempVL_SERVT: TFloatField
      DisplayLabel = 'Val. total Item'
      FieldName = 'VL_SERVT'
    end
    object cdsItemServTercTempATIVO: TIntegerField
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
    object cdsItemServTercTempVLUN_ORIG: TFloatField
      DisplayLabel = 'Val. Unit'#225'rio Orig'
      FieldName = 'VLUN_ORIG'
    end
    object cdsItemServTercTempNPEDORIGINADO: TIntegerField
      DisplayLabel = 'N'#186' Venda Originado'
      FieldName = 'NPEDORIGINADO'
    end
    object cdsItemServTercTempTIPOORIGINADO: TStringField
      DisplayLabel = 'Tipo Originado'
      FieldName = 'TIPOORIGINADO'
    end
    object cdsItemServTercTempCOD_FORNECEDOR: TIntegerField
      DisplayLabel = 'Cod Fornecedor'
      FieldName = 'COD_FORNECEDOR'
    end
    object cdsItemServTercTempNOME_FORNECEDOR: TStringField
      DisplayLabel = 'Fornecedor'
      FieldName = 'NOME_FORNECEDOR'
      Size = 35
    end
    object cdsItemServTercTempVLCUSTO: TFloatField
      DisplayLabel = 'Custo Total'
      FieldName = 'VLCUSTO'
    end
    object cdsItemServTercTempNPED_ORIGEM: TIntegerField
      DisplayLabel = 'N'#186' Venda Origem'
      FieldName = 'NPED_ORIGEM'
    end
    object cdsItemServTercTempTIPO_ORIGEM: TStringField
      DisplayLabel = 'Tipo Origem'
      FieldName = 'TIPO_ORIGEM'
      Size = 3
    end
  end
  object dsItemServTercTemp: TDataSource
    DataSet = cdsItemServTercTemp
    Left = 321
    Top = 742
  end
end
