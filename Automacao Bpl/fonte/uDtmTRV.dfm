object dtmTRV: TdtmTRV
  OldCreateOrder = False
  Height = 514
  Width = 1213
  object dataSetProvider: TDataSetProvider
    DataSet = query
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 20
    Top = 129
  end
  object clientDataSet: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAlmox'
    BeforeOpen = clientDataSetBeforeOpen
    Left = 20
    Top = 186
  end
  object query: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    SQL.Strings = (
      
        'select ped.nped, ped.tipo, pedprod.num_fab_prod, pedprod.descr_p' +
        'rod_ped, prod.locacao_prod,'
      
        'prod.locacao_prod_1, pedprod.sit_atd, pedprod.data_atd, pedprod.' +
        'hora_atd,'
      
        'pedprod.quant_ped_item, prod.grupo_prod, prod.cod_prod, ped.stat' +
        'us_ped,prod.est_f, ped.stat_req'
      'from pedvenda ped'
      
        'inner join pedvenda_prod pedprod on pedprod.nped = ped.nped and ' +
        'pedprod.tipo = ped.tipo'
      'and pedprod.cod_empresa = ped.cod_empresa'
      'inner join produtos prod on prod.grupo_prod = pedprod.grupo_prod'
      
        'and prod.cod_prod = pedprod.cod_prod and prod.cod_empresa = pedp' +
        'rod.cod_empresa'
      'where ped.tipv <> '#39'C'#39' and ped.tipv <> '#39'E'#39' and ped.tipv <> '#39'O'#39)
    Left = 20
    Top = 70
  end
  object transacao: TIBTransaction
    DefaultDatabase = dtmAtivo.bancoHw
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 24
    Top = 17
  end
  object SpIncCodOrig: TIBStoredProc
    Database = bancoOrigem
    Transaction = transacaoOrigem
    StoredProcName = 'INCREMENTA_CODIGO'
    Left = 508
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
  object dataSource: TDataSource
    AutoEdit = False
    DataSet = clientDataSet
    Left = 24
    Top = 240
  end
  object qrBuscas: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = transacao
    Left = 177
    Top = 17
  end
  object dsPedVenda: TDataSource
    AutoEdit = False
    DataSet = cdsPedVenda
    Left = 148
    Top = 255
  end
  object dspPedVenda: TDataSetProvider
    DataSet = qrPedVenda
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 148
    Top = 137
  end
  object cdsPedVenda: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPedVenda'
    BeforeOpen = clientDataSetBeforeOpen
    Left = 148
    Top = 194
    object cdsPedVendaNPED: TIntegerField
      Tag = 2
      DisplayLabel = 'N'#186' do Pedido'
      FieldName = 'NPED'
      Origin = '"PEDVENDA"."NPED"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsPedVendaNPREVENDA: TIntegerField
      Tag = 2
      DisplayLabel = 'N'#186' do DAV'
      FieldName = 'NPREVENDA'
      Origin = '"PEDVENDA"."NPREVENDA"'
    end
    object cdsPedVendaCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod. Empresa'
      FieldName = 'COD_EMPRESA'
      Origin = '"PEDVENDA"."COD_EMPRESA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsPedVendaCOD_CLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'COD_CLIENTE'
      Origin = '"PEDVENDA"."COD_CLIENTE"'
      Required = True
    end
    object cdsPedVendaCOD_VENDEDOR: TIntegerField
      DisplayLabel = 'Vendedor'
      FieldName = 'COD_VENDEDOR'
      Origin = '"PEDVENDA"."COD_VENDEDOR"'
      Required = True
    end
    object cdsPedVendaCOD_COND_PAG: TIntegerField
      DisplayLabel = 'Cond. Pagamento'
      FieldName = 'COD_COND_PAG'
      Origin = '"PEDVENDA"."COD_COND_PAG"'
    end
    object cdsPedVendaTIPO: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Origin = '"PEDVENDA"."TIPO"'
      FixedChar = True
      Size = 3
    end
    object cdsPedVendaN_MOV_CXL: TIntegerField
      DisplayLabel = 'Num. Movimento CXL'
      FieldName = 'N_MOV_CXL'
      Origin = '"PEDVENDA"."N_MOV_CXL"'
    end
    object cdsPedVendaDIA_CXL: TDateTimeField
      DisplayLabel = 'Dia Movimento CXL'
      FieldName = 'DIA_CXL'
      Origin = '"PEDVENDA"."DIA_CXL"'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsPedVendaDATA_PED: TDateTimeField
      DisplayLabel = 'Data do pedido'
      FieldName = 'DATA_PED'
      Origin = '"PEDVENDA"."DATA_PED"'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsPedVendaDATA_FECH: TDateTimeField
      DisplayLabel = 'Data do fechamento'
      FieldName = 'DATA_FECH'
      Origin = '"PEDVENDA"."DATA_FECH"'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsPedVendaDATVENC: TDateTimeField
      DisplayLabel = '1'#186' Vencimento da Venda'
      FieldName = 'DATVENC'
      Origin = '"PEDVENDA"."DATVENC"'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsPedVendaVALOR_TOTAL: TFloatField
      DisplayLabel = 'Valor Total'
      FieldName = 'VALOR_TOTAL'
      Origin = '"PEDVENDA"."VALOR_TOTAL"'
      currency = True
    end
    object cdsPedVendaDESC_P_PROD: TFloatField
      DisplayLabel = '% Desc. nos Produtos'
      FieldName = 'DESC_P_PROD'
      Origin = '"PEDVENDA"."DESC_P_PROD"'
      EditFormat = '0.00'
    end
    object cdsPedVendaDESC_P_SERV: TFloatField
      DisplayLabel = '% Desc. nos Servi'#231'os'
      FieldName = 'DESC_P_SERV'
      Origin = '"PEDVENDA"."DESC_P_SERV"'
    end
    object cdsPedVendaDESCONTO: TFloatField
      DisplayLabel = 'Valor Desconto'
      FieldName = 'DESCONTO'
      Origin = '"PEDVENDA"."DESCONTO"'
      currency = True
    end
    object cdsPedVendaOBS_PED: TStringField
      DisplayLabel = 'Obs. Pedido'
      FieldName = 'OBS_PED'
      Origin = '"PEDVENDA"."OBS_PED"'
      Size = 50
    end
    object cdsPedVendaSTATUS_PED: TStringField
      DisplayLabel = 'Status Pedido'
      FieldName = 'STATUS_PED'
      Origin = '"PEDVENDA"."STATUS_PED"'
      Size = 10
    end
    object cdsPedVendaTIPV: TStringField
      DisplayLabel = 'Tipo de Venda'
      FieldName = 'TIPV'
      Origin = '"PEDVENDA"."TIPV"'
      FixedChar = True
      Size = 1
    end
    object cdsPedVendaOBS_CXL_RQ: TStringField
      DisplayLabel = 'Obs. do Vendedor'
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
      DisplayLabel = 'Valor Rec. no CXL'
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
    object cdsPedVendaNCUPOM: TIntegerField
      DisplayLabel = 'N'#186' Cupom'
      FieldName = 'NCUPOM'
      Origin = '"PEDVENDA"."NCUPOM"'
    end
    object cdsPedVendaOPERADOR: TIntegerField
      DisplayLabel = 'Operardor'
      FieldName = 'OPERADOR'
      Origin = '"PEDVENDA"."OPERADOR"'
    end
    object cdsPedVendaDA: TStringField
      FieldName = 'DA'
      Origin = '"PEDVENDA"."DA"'
      FixedChar = True
      Size = 1
    end
    object cdsPedVendaNSERIEECF: TStringField
      DisplayLabel = 'N'#186' S'#233'rie ECF'
      FieldName = 'NSERIEECF'
      Origin = '"PEDVENDA"."NSERIEECF"'
    end
    object cdsPedVendaNOME_RECEB: TStringField
      DisplayLabel = 'Recebedor'
      FieldName = 'NOME_RECEB'
      Origin = '"PEDVENDA"."NOME_RECEB"'
      Size = 40
    end
    object cdsPedVendaEND_RECEB: TStringField
      DisplayLabel = 'End. Recebedor'
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
      FixedChar = True
      Size = 8
    end
    object cdsPedVendaFONE_RECEB: TStringField
      DisplayLabel = 'Fone Recebedor'
      FieldName = 'FONE_RECEB'
      Origin = '"PEDVENDA"."FONE_RECEB"'
      Size = 14
    end
    object cdsPedVendaOBS_MINUTA: TMemoField
      DisplayLabel = 'Obs. Minuta'
      FieldName = 'OBS_MINUTA'
      Origin = '"PEDVENDA"."OBS_MINUTA"'
      ProviderFlags = [pfInUpdate]
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
      DisplayLabel = 'Cod. Cidade Recebedor'
      FieldName = 'COD_CIDADE_RECEB'
      Origin = '"PEDVENDA"."COD_CIDADE_RECEB"'
    end
    object cdsPedVendaCOD_BAIRRO_RECEB: TSmallintField
      DisplayLabel = 'Cod. Bairro Recebedor'
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
      DisplayLabel = 'Cod. Controle'
      FieldName = 'CODIGO_CTRL'
      Origin = '"PEDVENDA"."CODIGO_CTRL"'
    end
    object cdsPedVendaSTAT_REQ: TStringField
      DisplayLabel = 'Status'
      FieldName = 'STAT_REQ'
      Origin = '"PEDVENDA"."STAT_REQ"'
      FixedChar = True
      Size = 1
    end
    object cdsPedVendaACRESC_P_PROD: TFloatField
      DisplayLabel = '% Acresc. nos Produtos'
      FieldName = 'ACRESC_P_PROD'
      Origin = '"PEDVENDA"."ACRESC_P_PROD"'
    end
    object cdsPedVendaACRESC_P_SERV: TFloatField
      DisplayLabel = '% Acresc. nos Servi'#231'os'
      FieldName = 'ACRESC_P_SERV'
      Origin = '"PEDVENDA"."ACRESC_P_SERV"'
    end
    object cdsPedVendaACRESCIMO: TFloatField
      DisplayLabel = 'Valor do Acr'#233'scimo'
      FieldName = 'ACRESCIMO'
      Origin = '"PEDVENDA"."ACRESCIMO"'
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
    object cdsPedVendaKM_V: TIntegerField
      DisplayLabel = 'Quilometragem'
      FieldName = 'KM_V'
      Origin = '"PEDVENDA"."KM_V"'
    end
    object cdsPedVendaORC_PROD: TIntegerField
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
      DisplayLabel = 'Obs. da OS'
      FieldName = 'OBS_OS'
      Origin = '"PEDVENDA"."OBS_OS"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
    object cdsPedVendaAPARELHO_PED: TStringField
      DisplayLabel = 'Descri'#231#227'o do Aparelho'
      FieldName = 'APARELHO_PED'
      Origin = '"PEDVENDA"."APARELHO_PED"'
      Size = 50
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
      BlobType = ftMemo
      Size = 8
    end
    object cdsPedVendaESTADO_VEIC: TMemoField
      DisplayLabel = 'Estado do Ve'#237'culo'
      FieldName = 'ESTADO_VEIC'
      Origin = '"PEDVENDA"."ESTADO_VEIC"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
    object cdsPedVendaACESSORIOS: TMemoField
      DisplayLabel = 'Acess'#243'rios'
      FieldName = 'ACESSORIOS'
      Origin = '"PEDVENDA"."ACESSORIOS"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
    object cdsPedVendaTIPO_OS: TStringField
      DisplayLabel = 'Tipo da OS'
      FieldName = 'TIPO_OS'
      Origin = '"PEDVENDA"."TIPO_OS"'
      Size = 10
    end
    object cdsPedVendaH_ENT: TDateTimeField
      DisplayLabel = 'Hs da Entrada'
      FieldName = 'H_ENT'
      Origin = '"PEDVENDA"."H_ENT"'
      EditMask = '!90:00;1;_'
    end
    object cdsPedVendaH_PROMETIDA: TDateTimeField
      DisplayLabel = 'Hs Prometida'
      FieldName = 'H_PROMETIDA'
      Origin = '"PEDVENDA"."H_PROMETIDA"'
      EditMask = '!90:00;1;_'
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
    object cdsPedVendaTP_ABORD: TStringField
      DisplayLabel = 'Abordagem ao Cliente'
      FieldName = 'TP_ABORD'
      Origin = '"PEDVENDA"."TP_ABORD"'
      FixedChar = True
      Size = 3
    end
    object cdsPedVendaFR_PAGBOSCH: TStringField
      DisplayLabel = 'Pag. Linha Bosch'
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
    object cdsPedVendaCOD_EQUIP: TIntegerField
      DisplayLabel = 'C'#243'digo do Equipamento'
      FieldName = 'COD_EQUIP'
      Origin = '"PEDVENDA"."COD_EQUIP"'
    end
    object cdsPedVendaN_SERIE: TStringField
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
      DisplayLabel = 'Obs. Livro de Registro'
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
      Size = 10
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
      DisplayLabel = 'N'#186' Or'#231'amento'
      FieldName = 'COD_ORCAMENTO'
    end
    object cdsPedVendaOBS_RED_OS: TStringField
      DisplayLabel = 'Obs Red OS'
      FieldName = 'OBS_RED_OS'
      Size = 50
    end
    object cdsPedVendaCOD_VEICULO: TIntegerField
      DisplayLabel = 'Cod Ve'#237'culo'
      FieldName = 'COD_VEICULO'
    end
    object cdsPedVendaPROCESSADA_SL: TIntegerField
      FieldName = 'PROCESSADA_SL'
    end
    object cdsPedVendaDATA_NFEXT: TDateTimeField
      FieldName = 'DATA_NFEXT'
    end
    object cdsPedVendaVALOR_NFEXT: TFloatField
      FieldName = 'VALOR_NFEXT'
    end
    object cdsPedVendaCODTERM_STATUS: TIntegerField
      FieldName = 'CODTERM_STATUS'
    end
    object cdsPedVendaNUM_NFEEXT: TLargeintField
      FieldName = 'NUM_NFEEXT'
    end
  end
  object qrPedProd: TIBQuery
    Database = bancoOrigem
    Transaction = transacaoOrigem
    SQL.Strings = (
      'select * from PEDVENDA_PROD')
    Left = 227
    Top = 78
  end
  object cdsItemProd: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspItemProd'
    BeforeOpen = clientDataSetBeforeOpen
    Left = 227
    Top = 194
    object cdsItemProdNPED: TIntegerField
      DisplayLabel = 'N'#186' Venda'
      FieldName = 'NPED'
      Origin = '"PEDVENDA_PROD"."NPED"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsItemProdNITEM: TIntegerField
      DisplayLabel = 'N'#186' Item'
      FieldName = 'NITEM'
      Required = True
    end
    object cdsItemProdGRUPO_PROD: TIntegerField
      DisplayLabel = 'Grupo'
      FieldName = 'GRUPO_PROD'
      Origin = '"PEDVENDA_PROD"."GRUPO_PROD"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsItemProdCOD_PROD: TStringField
      DisplayLabel = 'C'#243'd. Produto'
      FieldName = 'COD_PROD'
      Origin = '"PEDVENDA_PROD"."COD_PROD"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 6
    end
    object cdsItemProdDESCR_PROD_PED: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCR_PROD_PED'
      Origin = '"PEDVENDA_PROD"."DESCR_PROD_PED"'
      Size = 60
    end
    object cdsItemProdVLUN_PED_ITEM: TFloatField
      DisplayLabel = 'Val. Unit'#225'rio'
      FieldName = 'VLUN_PED_ITEM'
      Origin = '"PEDVENDA_PROD"."VLUN_PED_ITEM"'
      currency = True
    end
    object cdsItemProdQUANT_PED_ITEM: TFloatField
      DisplayLabel = 'Quantidade'
      FieldName = 'QUANT_PED_ITEM'
      Origin = '"PEDVENDA_PROD"."QUANT_PED_ITEM"'
    end
    object cdsItemProdVLTOT_PED_ITEM: TFloatField
      DisplayLabel = 'Val. total Item '
      FieldName = 'VLTOT_PED_ITEM'
      Origin = '"PEDVENDA_PROD"."VLTOT_PED_ITEM"'
      currency = True
    end
    object cdsItemProdCODIGO_NOP: TFloatField
      DisplayLabel = 'Nat. Opeta'#231#227'o'
      FieldName = 'CODIGO_NOP'
      Origin = '"PEDVENDA_PROD"."CODIGO_NOP"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsItemProdNUM_FAB_PROD: TStringField
      DisplayLabel = 'Num. Fabrica'#231#227'o'
      FieldName = 'NUM_FAB_PROD'
      Origin = '"PEDVENDA_PROD"."NUM_FAB_PROD"'
      FixedChar = True
    end
    object cdsItemProdN_NF: TIntegerField
      DisplayLabel = 'N'#186' NF'
      FieldName = 'N_NF'
      Origin = '"PEDVENDA_PROD"."N_NF"'
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
      DisplayLabel = 'Aano/Fab Produto'
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
    object cdsItemProdTIPO: TStringField
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
      DisplayLabel = 'Cod. Empresa'
      FieldName = 'COD_EMPRESA'
      Origin = '"PEDVENDA_PROD"."COD_EMPRESA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
    end
    object cdsItemProdCOD_GRADE: TIntegerField
      DisplayLabel = 'Cod. Grade'
      FieldName = 'COD_GRADE'
      Origin = '"PEDVENDA_PROD"."COD_GRADE"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object cdsItemProdVLUN_ORIG: TFloatField
      DisplayLabel = 'Val. Unit'#225'rio Original'
      FieldName = 'VLUN_ORIG'
      Origin = '"PEDVENDA_PROD"."VLUN_ORIG"'
      Visible = False
    end
    object cdsItemProdVLUN_PED_NF: TFloatField
      DisplayLabel = 'Val. Unit'#225'rio na NF'
      FieldName = 'VLUN_PED_NF'
      Origin = '"PEDVENDA_PROD"."VLUN_PED_NF"'
      Visible = False
      currency = True
    end
    object cdsItemProdVLTOT_PED_NF: TFloatField
      DisplayLabel = 'Val. total Item na NF'
      FieldName = 'VLTOT_PED_NF'
      Origin = '"PEDVENDA_PROD"."VLTOT_PED_NF"'
      Visible = False
    end
    object cdsItemProdRATDSAS: TFloatField
      DisplayLabel = 'Rateio da Venda'
      FieldName = 'RATDSAS'
      Origin = '"PEDVENDA_PROD"."RATDSAS"'
      Visible = False
    end
    object cdsItemProdCOMISS_PROD: TFloatField
      DisplayLabel = 'Comiss'#227'o Prod.'
      FieldName = 'COMISS_PROD'
      Origin = '"PEDVENDA_PROD"."COMISS_PROD"'
      Visible = False
    end
    object cdsItemProdCOMISS_PROD_GER: TFloatField
      DisplayLabel = 'Comiss'#227'o Prod. Gerente'
      FieldName = 'COMISS_PROD_GER'
      Origin = '"PEDVENDA_PROD"."COMISS_PROD_GER"'
      Visible = False
    end
    object cdsItemProdPCUST_C: TFloatField
      DisplayLabel = 'Val. custo apurado'
      FieldName = 'PCUST_C'
      Origin = '"PEDVENDA_PROD"."PCUST_C"'
      Visible = False
    end
    object cdsItemProdPCUST_R: TFloatField
      DisplayLabel = 'Val. custo real'
      FieldName = 'PCUST_R'
      Origin = '"PEDVENDA_PROD"."PCUST_R"'
      Visible = False
    end
    object cdsItemProdPCUST_MC: TFloatField
      DisplayLabel = 'Val. custo m'#233'dio'
      FieldName = 'PCUST_MC'
      Origin = '"PEDVENDA_PROD"."PCUST_MC"'
      Visible = False
    end
    object cdsItemProdPCUST_MR: TFloatField
      DisplayLabel = 'Val. custo m'#233'dio real'
      FieldName = 'PCUST_MR'
      Origin = '"PEDVENDA_PROD"."PCUST_MR"'
      Visible = False
    end
    object cdsItemProdSIT_ATD: TStringField
      DisplayLabel = 'Situa'#231#227'o de atendimento'
      FieldName = 'SIT_ATD'
      Origin = '"PEDVENDA_PROD"."SIT_ATD"'
      Visible = False
      FixedChar = True
      Size = 2
    end
    object cdsItemProdSEL: TStringField
      DisplayLabel = 'Selec'
      FieldName = 'SEL'
      Origin = '"PEDVENDA_PROD"."SEL"'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object cdsItemProdDATA_ATD: TDateTimeField
      DisplayLabel = 'Data do Atendimento'
      FieldName = 'DATA_ATD'
      Origin = '"PEDVENDA_PROD"."DATA_ATD"'
      Visible = False
    end
    object cdsItemProdHORA_ATD: TStringField
      DisplayLabel = 'Hs do Atendimento'
      FieldName = 'HORA_ATD'
      Origin = '"PEDVENDA_PROD"."HORA_ATD"'
      Visible = False
      FixedChar = True
      Size = 8
    end
    object cdsItemProdCODIGO_KIT: TIntegerField
      DisplayLabel = 'C'#243'digo do Kit'
      FieldName = 'CODIGO_KIT'
      Origin = '"PEDVENDA_PROD"."CODIGO_KIT"'
      Visible = False
    end
    object cdsItemProdICMANT_SUB: TFloatField
      DisplayLabel = 'Icms Antecipa'#231#227'o trib.'
      FieldName = 'ICMANT_SUB'
      Origin = '"PEDVENDA_PROD"."ICMANT_SUB"'
      Visible = False
    end
    object cdsItemProdCOL_COD_VENDEDOR: TIntegerField
      DisplayLabel = 'Tecnico/Mecanico'
      FieldName = 'COL_COD_VENDEDOR'
      Origin = '"PEDVENDA_PROD"."COL_COD_VENDEDOR"'
      Visible = False
    end
    object cdsItemProdCOD_VENDEDOR: TIntegerField
      DisplayLabel = 'Vendedor'
      FieldName = 'COD_VENDEDOR'
      Origin = '"PEDVENDA_PROD"."COD_VENDEDOR"'
      Visible = False
    end
    object cdsItemProdDATA_TRANSF: TDateTimeField
      DisplayLabel = 'Data Transferencia'
      FieldName = 'DATA_TRANSF'
      Origin = '"PEDVENDA_PROD"."DATA_TRANSF"'
      Visible = False
    end
    object cdsItemProdDATA_DEV: TDateTimeField
      DisplayLabel = 'Data Devolu'#231#227'o'
      FieldName = 'DATA_DEV'
      Origin = '"PEDVENDA_PROD"."DATA_DEV"'
      Visible = False
    end
    object cdsItemProdNOME_VEND: TStringField
      DisplayLabel = 'Nome Vendedor'
      FieldName = 'NOME_VEND'
      Origin = '"PEDVENDA_PROD"."NOME_VEND"'
      Visible = False
      Size = 35
    end
    object cdsItemProdNOME_VEND1: TStringField
      DisplayLabel = 'Nome Vendedor 2'
      FieldName = 'NOME_VEND1'
      Origin = '"PEDVENDA_PROD"."NOME_VEND1"'
      Visible = False
      Size = 35
    end
    object cdsItemProdQT_DEV: TFloatField
      DisplayLabel = 'Qtde Devolvida'
      FieldName = 'QT_DEV'
      Origin = '"PEDVENDA_PROD"."QT_DEV"'
      Visible = False
    end
    object cdsItemProdATIVO: TIntegerField
      FieldName = 'ATIVO'
    end
    object cdsItemProdDISPONIVEL: TFloatField
      DisplayLabel = 'Disponivel'
      FieldKind = fkInternalCalc
      FieldName = 'DISPONIVEL'
    end
    object cdsItemProdUTILIZAR: TFloatField
      DisplayLabel = 'Utilizar'
      FieldKind = fkInternalCalc
      FieldName = 'UTILIZAR'
    end
  end
  object dspItemProd: TDataSetProvider
    DataSet = qrPedProd
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 227
    Top = 137
  end
  object qrPedServ: TIBQuery
    Database = bancoOrigem
    Transaction = transacaoOrigem
    SQL.Strings = (
      'select * from PEDVENDA_SERV')
    Left = 306
    Top = 78
  end
  object cdsItemServ: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspItemServ'
    BeforeOpen = clientDataSetBeforeOpen
    Left = 306
    Top = 194
    object cdsItemServNPED: TIntegerField
      DisplayLabel = 'N'#186' Venda'
      FieldName = 'NPED'
      Required = True
    end
    object cdsItemServNITEM: TIntegerField
      DisplayLabel = 'N'#186' Item'
      FieldName = 'NITEM'
      Required = True
    end
    object cdsItemServCOD_SERVICO: TIntegerField
      DisplayLabel = 'Cod. Servi'#231'o'
      FieldName = 'COD_SERVICO'
      Required = True
    end
    object cdsItemServCODIGO_NOP: TFloatField
      DisplayLabel = 'CFOP'
      FieldName = 'CODIGO_NOP'
    end
    object cdsItemServDESC_SERV_PED: TStringField
      DisplayLabel = 'Descri'#231#227'o Servi'#231'o'
      FieldName = 'DESC_SERV_PED'
      Size = 60
    end
    object cdsItemServNOME_VEND: TStringField
      DisplayLabel = 'Nome Mec'#226'nico'
      FieldName = 'NOME_VEND'
      Size = 35
    end
    object cdsItemServVALOR_UN_SERV: TFloatField
      DisplayLabel = 'Valor Unit'#225'rio'
      FieldName = 'VALOR_UN_SERV'
      currency = True
    end
    object cdsItemServQUANT_SERV_PED: TFloatField
      DisplayLabel = 'Qtde Servi'#231'o'
      FieldName = 'QUANT_SERV_PED'
    end
    object cdsItemServVALOR_TOT_SERV: TFloatField
      DisplayLabel = 'Valor Total'
      FieldName = 'VALOR_TOT_SERV'
      currency = True
    end
    object cdsItemServPRC_INT_SERV: TFloatField
      DisplayLabel = 'Vl Interno Serv'
      FieldName = 'PRC_INT_SERV'
      currency = True
    end
    object cdsItemServRATEIO_DESC: TFloatField
      DisplayLabel = 'Rateio Desc'
      FieldName = 'RATEIO_DESC'
      currency = True
    end
    object cdsItemServRATEIO_ACRESC: TFloatField
      DisplayLabel = 'Rateio Acresc'
      FieldName = 'RATEIO_ACRESC'
      currency = True
    end
    object cdsItemServDESC_ITEM: TFloatField
      DisplayLabel = 'Desconto'
      FieldName = 'DESC_ITEM'
      currency = True
    end
    object cdsItemServACRESC_ITEM: TFloatField
      DisplayLabel = 'Acr'#233'scimo'
      FieldName = 'ACRESC_ITEM'
      currency = True
    end
    object cdsItemServSUBGSERVICO: TIntegerField
      DisplayLabel = 'Sub Grupo'
      FieldName = 'SUBGSERVICO'
    end
    object cdsItemServNOME_VEND1: TStringField
      DisplayLabel = 'Nome Mec'#226'nico 1'
      FieldName = 'NOME_VEND1'
      Size = 35
    end
    object cdsItemServTMO_SERV: TFloatField
      FieldName = 'TMO_SERV'
      Visible = False
    end
    object cdsItemServTIPO: TStringField
      Tag = 2
      FieldName = 'TIPO'
      Required = True
      Visible = False
      FixedChar = True
      Size = 3
    end
    object cdsItemServATIVO: TIntegerField
      Tag = 2
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
      Visible = False
    end
    object cdsItemServCOD_VENDEDOR1: TIntegerField
      DisplayLabel = 'Cod Mec'#226'nico 2'
      FieldName = 'COD_VENDEDOR1'
      Visible = False
    end
    object cdsItemServVLUN_ORIG: TFloatField
      Tag = 2
      DisplayLabel = 'Valor Original'
      FieldName = 'VLUN_ORIG'
      Visible = False
    end
    object cdsItemServCOD_VENDEDOR: TIntegerField
      DisplayLabel = 'Cod Mec'#226'nico 1'
      FieldName = 'COD_VENDEDOR'
      Required = True
      Visible = False
    end
    object cdsItemServCOD_EMPRESA: TIntegerField
      Tag = 2
      FieldName = 'COD_EMPRESA'
      Required = True
      Visible = False
    end
    object cdsItemServN_NF: TLargeintField
      FieldName = 'N_NF'
    end
  end
  object dspItemServ: TDataSetProvider
    DataSet = qrPedServ
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 306
    Top = 137
  end
  object qrPedVenda: TIBQuery
    Database = bancoOrigem
    Transaction = transacaoOrigem
    SQL.Strings = (
      'select * from PEDVENDA')
    Left = 148
    Top = 78
  end
  object dsItemProd: TDataSource
    AutoEdit = False
    DataSet = cdsItemProd
    Left = 227
    Top = 255
  end
  object dsItemServ: TDataSource
    DataSet = cdsItemServ
    Left = 306
    Top = 255
  end
  object qrServTerceiro: TIBQuery
    Database = bancoOrigem
    Transaction = transacaoOrigem
    SQL.Strings = (
      'SELECT * FROM PEDVENDA_SERV_TERC WHERE ativo=1')
    Left = 381
    Top = 78
  end
  object dspServTerceiro: TDataSetProvider
    DataSet = qrServTerceiro
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 381
    Top = 137
  end
  object cdsServTerceiro: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspServTerceiro'
    BeforeOpen = clientDataSetBeforeOpen
    Left = 381
    Top = 194
    object cdsServTerceiroNPED: TIntegerField
      DisplayLabel = 'N'#186' da OS'
      FieldName = 'NPED'
      Required = True
    end
    object cdsServTerceiroDESCR_SERVT: TStringField
      DisplayLabel = 'Descri'#231#227'o do servi'#231'o'
      FieldName = 'DESCR_SERVT'
      Required = True
      Size = 60
    end
    object cdsServTerceiroCOD_EMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsServTerceiroVL_SERVT: TFloatField
      DisplayLabel = 'Valor do Servi'#231'o'
      FieldName = 'VL_SERVT'
    end
    object cdsServTerceiroATIVO: TIntegerField
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
    object cdsServTerceiroVLUN_ORIG: TFloatField
      DisplayLabel = 'Valor original'
      FieldName = 'VLUN_ORIG'
    end
    object cdsServTerceiroTIPO: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Required = True
      FixedChar = True
      Size = 3
    end
  end
  object dsServTerceiro: TDataSource
    DataSet = cdsServTerceiro
    Left = 381
    Top = 255
  end
  object dsProdTerceiro: TDataSource
    DataSet = cdsProdTerceiro
    Left = 461
    Top = 255
  end
  object cdsProdTerceiro: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProdTerceiro'
    BeforeOpen = clientDataSetBeforeOpen
    Left = 461
    Top = 194
    object cdsProdTerceiroNPED: TIntegerField
      DisplayLabel = 'N'#186' da OS'
      FieldName = 'NPED'
      Required = True
    end
    object cdsProdTerceiroCOD_EMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsProdTerceiroDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o do Produto'
      FieldName = 'DESCRICAO'
      Required = True
      Size = 50
    end
    object cdsProdTerceiroQTDE: TFloatField
      DisplayLabel = 'Quantidade'
      FieldName = 'QTDE'
    end
    object cdsProdTerceiroVL_UNIT: TFloatField
      DisplayLabel = 'Valor Unit'#225'rio'
      FieldName = 'VL_UNIT'
    end
    object cdsProdTerceiroVL_TOTAL: TFloatField
      DisplayLabel = 'Valor Total'
      FieldName = 'VL_TOTAL'
    end
    object cdsProdTerceiroUNIDADE: TStringField
      DisplayLabel = 'Unidade'
      FieldName = 'UNIDADE'
      FixedChar = True
      Size = 2
    end
    object cdsProdTerceiroCOD_VENDEDOR: TIntegerField
      DisplayLabel = 'Cod. Vendedor'
      FieldName = 'COD_VENDEDOR'
    end
    object cdsProdTerceiroTIPO: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Required = True
      FixedChar = True
      Size = 3
    end
  end
  object dspProdTerceiro: TDataSetProvider
    DataSet = qrProdTerceiro
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 461
    Top = 137
  end
  object qrProdTerceiro: TIBQuery
    Database = bancoOrigem
    Transaction = transacaoOrigem
    SQL.Strings = (
      'SELECT * FROM PEDVENDA_PROD_TERC')
    Left = 461
    Top = 78
  end
  object dsPV: TDataSource
    AutoEdit = False
    Left = 596
    Top = 271
  end
  object dspPV: TDataSetProvider
    DataSet = qrPV
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 596
    Top = 153
  end
  object qrItemPV: TIBQuery
    Database = bancoDestino
    Transaction = transacaoDestino
    SQL.Strings = (
      'select * from PEDVENDA_PROD')
    Left = 675
    Top = 94
  end
  object dspItemPV: TDataSetProvider
    DataSet = qrItemPV
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 675
    Top = 153
  end
  object qrServPV: TIBQuery
    Database = bancoDestino
    Transaction = transacaoDestino
    SQL.Strings = (
      'select * from PEDVENDA_SERV')
    Left = 754
    Top = 94
  end
  object dspServPV: TDataSetProvider
    DataSet = qrServPV
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 754
    Top = 153
  end
  object qrPV: TIBQuery
    Database = bancoDestino
    Transaction = transacaoDestino
    AfterCancel = clientDataSetBeforeOpen
    SQL.Strings = (
      'select * from PEDVENDA')
    Left = 596
    Top = 94
  end
  object dsItemPV: TDataSource
    AutoEdit = False
    Left = 675
    Top = 271
  end
  object dsServPV: TDataSource
    Left = 754
    Top = 271
  end
  object qrTercPV: TIBQuery
    Database = bancoDestino
    Transaction = transacaoDestino
    SQL.Strings = (
      'SELECT * FROM PEDVENDA_SERV_TERC WHERE ativo=1')
    Left = 829
    Top = 94
  end
  object dspTercPV: TDataSetProvider
    DataSet = qrTercPV
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 829
    Top = 153
  end
  object dsTercPV: TDataSource
    Left = 829
    Top = 271
  end
  object bancoOrigem: TIBDatabase
    Connected = True
    DatabaseName = '192.168.254.10:C:\Basesauto\Luz GV\Hw.fdb'
    Params.Strings = (
      'user_name=sysdba'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = transacaoOrigem
    Left = 272
    Top = 16
  end
  object bancoDestino: TIBDatabase
    Connected = True
    DatabaseName = '192.168.254.10:C:\Basesauto\Luz GV\Hw.fdb'
    Params.Strings = (
      'user_name=sysdba'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = transacaoDestino
    Left = 592
    Top = 16
  end
  object transacaoOrigem: TIBTransaction
    Active = True
    DefaultDatabase = bancoOrigem
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 352
    Top = 16
  end
  object transacaoDestino: TIBTransaction
    Active = True
    DefaultDatabase = bancoDestino
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 672
    Top = 16
  end
  object buscasDestino: TIBQuery
    Database = bancoDestino
    Transaction = transacaoDestino
    Left = 752
    Top = 16
  end
  object buscasOrigem: TIBQuery
    Database = bancoOrigem
    Transaction = transacaoOrigem
    Left = 448
    Top = 16
  end
  object cdsPV: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPV'
    BeforeOpen = clientDataSetBeforeOpen
    Left = 596
    Top = 210
    object cdsPVNPED: TIntegerField
      Tag = 2
      DisplayLabel = 'N'#186' do Pedido'
      FieldName = 'NPED'
      Origin = '"PEDVENDA"."NPED"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsPVNPREVENDA: TIntegerField
      Tag = 2
      DisplayLabel = 'N'#186' do DAV'
      FieldName = 'NPREVENDA'
      Origin = '"PEDVENDA"."NPREVENDA"'
    end
    object cdsPVCOD_EMPRESA: TIntegerField
      Tag = 1
      DisplayLabel = 'Cod. Empresa'
      FieldName = 'COD_EMPRESA'
      Origin = '"PEDVENDA"."COD_EMPRESA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsPVCOD_CLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'COD_CLIENTE'
      Origin = '"PEDVENDA"."COD_CLIENTE"'
      Required = True
    end
    object cdsPVCOD_VENDEDOR: TIntegerField
      DisplayLabel = 'Vendedor'
      FieldName = 'COD_VENDEDOR'
      Origin = '"PEDVENDA"."COD_VENDEDOR"'
      Required = True
    end
    object cdsPVCOD_COND_PAG: TIntegerField
      DisplayLabel = 'Cond. Pagamento'
      FieldName = 'COD_COND_PAG'
      Origin = '"PEDVENDA"."COD_COND_PAG"'
    end
    object cdsPVTIPO: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Origin = '"PEDVENDA"."TIPO"'
      FixedChar = True
      Size = 3
    end
    object cdsPVN_MOV_CXL: TIntegerField
      DisplayLabel = 'Num. Movimento CXL'
      FieldName = 'N_MOV_CXL'
      Origin = '"PEDVENDA"."N_MOV_CXL"'
    end
    object cdsPVDIA_CXL: TDateTimeField
      DisplayLabel = 'Dia Movimento CXL'
      FieldName = 'DIA_CXL'
      Origin = '"PEDVENDA"."DIA_CXL"'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsPVDATA_PED: TDateTimeField
      DisplayLabel = 'Data do pedido'
      FieldName = 'DATA_PED'
      Origin = '"PEDVENDA"."DATA_PED"'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsPVDATA_FECH: TDateTimeField
      DisplayLabel = 'Data do fechamento'
      FieldName = 'DATA_FECH'
      Origin = '"PEDVENDA"."DATA_FECH"'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsPVDATVENC: TDateTimeField
      DisplayLabel = '1'#186' Vencimento da Venda'
      FieldName = 'DATVENC'
      Origin = '"PEDVENDA"."DATVENC"'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsPVVALOR_TOTAL: TFloatField
      DisplayLabel = 'Valor Total'
      FieldName = 'VALOR_TOTAL'
      Origin = '"PEDVENDA"."VALOR_TOTAL"'
      currency = True
    end
    object cdsPVDESC_P_PROD: TFloatField
      DisplayLabel = '% Desc. nos Produtos'
      FieldName = 'DESC_P_PROD'
      Origin = '"PEDVENDA"."DESC_P_PROD"'
      EditFormat = '0.00'
    end
    object cdsPVDESC_P_SERV: TFloatField
      DisplayLabel = '% Desc. nos Servi'#231'os'
      FieldName = 'DESC_P_SERV'
      Origin = '"PEDVENDA"."DESC_P_SERV"'
    end
    object cdsPVDESCONTO: TFloatField
      DisplayLabel = 'Valor Desconto'
      FieldName = 'DESCONTO'
      Origin = '"PEDVENDA"."DESCONTO"'
      currency = True
    end
    object cdsPVOBS_PED: TStringField
      DisplayLabel = 'Obs. Pedido'
      FieldName = 'OBS_PED'
      Origin = '"PEDVENDA"."OBS_PED"'
      Size = 50
    end
    object cdsPVSTATUS_PED: TStringField
      DisplayLabel = 'Status Pedido'
      FieldName = 'STATUS_PED'
      Origin = '"PEDVENDA"."STATUS_PED"'
      Size = 10
    end
    object cdsPVTIPV: TStringField
      DisplayLabel = 'Tipo de Venda'
      FieldName = 'TIPV'
      Origin = '"PEDVENDA"."TIPV"'
      FixedChar = True
      Size = 1
    end
    object cdsPVOBS_CXL_RQ: TStringField
      DisplayLabel = 'Obs. do Vendedor'
      FieldName = 'OBS_CXL_RQ'
      Origin = '"PEDVENDA"."OBS_CXL_RQ"'
      Size = 50
    end
    object cdsPVSTATUS_CXL_RQ: TStringField
      DisplayLabel = 'Recebida pelo CXL'
      FieldName = 'STATUS_CXL_RQ'
      Origin = '"PEDVENDA"."STATUS_CXL_RQ"'
      FixedChar = True
      Size = 1
    end
    object cdsPVVL_PAGO_CXL: TFloatField
      DisplayLabel = 'Valor Rec. no CXL'
      FieldName = 'VL_PAGO_CXL'
      Origin = '"PEDVENDA"."VL_PAGO_CXL"'
      currency = True
    end
    object cdsPVSELEC: TStringField
      DisplayLabel = 'Sele'#231#227'o'
      FieldName = 'SELEC'
      Origin = '"PEDVENDA"."SELEC"'
      FixedChar = True
      Size = 1
    end
    object cdsPVTIPOR: TStringField
      DisplayLabel = 'Origem'
      FieldName = 'TIPOR'
      Origin = '"PEDVENDA"."TIPOR"'
      FixedChar = True
      Size = 1
    end
    object cdsPVHORAABERTURA: TIntegerField
      DisplayLabel = 'Hs Abertura Pedido'
      FieldName = 'HORAABERTURA'
      Origin = '"PEDVENDA"."HORAABERTURA"'
    end
    object cdsPVMINABERTURA: TIntegerField
      DisplayLabel = 'Min Abertura Pedido'
      FieldName = 'MINABERTURA'
      Origin = '"PEDVENDA"."MINABERTURA"'
    end
    object cdsPVHORAFECHAMENTO: TIntegerField
      DisplayLabel = 'Hs Fechamento Pedido'
      FieldName = 'HORAFECHAMENTO'
      Origin = '"PEDVENDA"."HORAFECHAMENTO"'
    end
    object cdsPVMINFECHAMENTO: TIntegerField
      DisplayLabel = 'Min Fechamento Pedido'
      FieldName = 'MINFECHAMENTO'
      Origin = '"PEDVENDA"."MINFECHAMENTO"'
    end
    object cdsPVHORASUBTOTAL: TIntegerField
      DisplayLabel = 'Hora Subtotal'
      FieldName = 'HORASUBTOTAL'
      Origin = '"PEDVENDA"."HORASUBTOTAL"'
    end
    object cdsPVMINSUBTOTAL: TIntegerField
      DisplayLabel = 'Min Subtotal'
      FieldName = 'MINSUBTOTAL'
      Origin = '"PEDVENDA"."MINSUBTOTAL"'
    end
    object cdsPVNCUPOM: TIntegerField
      DisplayLabel = 'N'#186' Cupom'
      FieldName = 'NCUPOM'
      Origin = '"PEDVENDA"."NCUPOM"'
    end
    object cdsPVOPERADOR: TIntegerField
      DisplayLabel = 'Operardor'
      FieldName = 'OPERADOR'
      Origin = '"PEDVENDA"."OPERADOR"'
    end
    object cdsPVDA: TStringField
      FieldName = 'DA'
      Origin = '"PEDVENDA"."DA"'
      FixedChar = True
      Size = 1
    end
    object cdsPVNSERIEECF: TStringField
      DisplayLabel = 'N'#186' S'#233'rie ECF'
      FieldName = 'NSERIEECF'
      Origin = '"PEDVENDA"."NSERIEECF"'
    end
    object cdsPVNOME_RECEB: TStringField
      DisplayLabel = 'Recebedor'
      FieldName = 'NOME_RECEB'
      Origin = '"PEDVENDA"."NOME_RECEB"'
      Size = 40
    end
    object cdsPVEND_RECEB: TStringField
      DisplayLabel = 'End. Recebedor'
      FieldName = 'END_RECEB'
      Origin = '"PEDVENDA"."END_RECEB"'
      Size = 35
    end
    object cdsPVBAIRRO_RECEB: TStringField
      DisplayLabel = 'Bairro Recebedor'
      FieldName = 'BAIRRO_RECEB'
      Origin = '"PEDVENDA"."BAIRRO_RECEB"'
    end
    object cdsPVCIDA_RECEB: TStringField
      DisplayLabel = 'Cidade Recebedor'
      FieldName = 'CIDA_RECEB'
      Origin = '"PEDVENDA"."CIDA_RECEB"'
      Size = 15
    end
    object cdsPVCEP_RECEB: TStringField
      DisplayLabel = 'CEP Recebedor'
      FieldName = 'CEP_RECEB'
      Origin = '"PEDVENDA"."CEP_RECEB"'
      FixedChar = True
      Size = 8
    end
    object cdsPVFONE_RECEB: TStringField
      DisplayLabel = 'Fone Recebedor'
      FieldName = 'FONE_RECEB'
      Origin = '"PEDVENDA"."FONE_RECEB"'
      Size = 14
    end
    object cdsPVOBS_MINUTA: TMemoField
      DisplayLabel = 'Obs. Minuta'
      FieldName = 'OBS_MINUTA'
      Origin = '"PEDVENDA"."OBS_MINUTA"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
    object cdsPVGRUPO_PROD: TIntegerField
      DisplayLabel = 'Grupo do Produto'
      FieldName = 'GRUPO_PROD'
      Origin = '"PEDVENDA"."GRUPO_PROD"'
    end
    object cdsPVCOD_PROD: TStringField
      DisplayLabel = 'C'#243'digo Produto'
      FieldName = 'COD_PROD'
      Origin = '"PEDVENDA"."COD_PROD"'
      FixedChar = True
      Size = 6
    end
    object cdsPVOP_CXL: TIntegerField
      DisplayLabel = 'Operador CXL'
      FieldName = 'OP_CXL'
      Origin = '"PEDVENDA"."OP_CXL"'
    end
    object cdsPVCPFCGC: TStringField
      DisplayLabel = 'CPF ou CNPJ'
      FieldName = 'CPFCGC'
      FixedChar = True
      Size = 18
    end
    object cdsPVCOD_CIDADE_RECEB: TSmallintField
      DisplayLabel = 'Cod. Cidade Recebedor'
      FieldName = 'COD_CIDADE_RECEB'
      Origin = '"PEDVENDA"."COD_CIDADE_RECEB"'
    end
    object cdsPVCOD_BAIRRO_RECEB: TSmallintField
      DisplayLabel = 'Cod. Bairro Recebedor'
      FieldName = 'COD_BAIRRO_RECEB'
      Origin = '"PEDVENDA"."COD_BAIRRO_RECEB"'
    end
    object cdsPVVL_ENTRADA: TFloatField
      DisplayLabel = 'Valor da Entrada'
      FieldName = 'VL_ENTRADA'
      Origin = '"PEDVENDA"."VL_ENTRADA"'
      currency = True
    end
    object cdsPVCODIGO_CTRL: TIntegerField
      DisplayLabel = 'Cod. Controle'
      FieldName = 'CODIGO_CTRL'
      Origin = '"PEDVENDA"."CODIGO_CTRL"'
    end
    object cdsPVSTAT_REQ: TStringField
      DisplayLabel = 'Status'
      FieldName = 'STAT_REQ'
      Origin = '"PEDVENDA"."STAT_REQ"'
      FixedChar = True
      Size = 1
    end
    object cdsPVACRESC_P_PROD: TFloatField
      DisplayLabel = '% Acresc. nos Produtos'
      FieldName = 'ACRESC_P_PROD'
      Origin = '"PEDVENDA"."ACRESC_P_PROD"'
    end
    object cdsPVACRESC_P_SERV: TFloatField
      DisplayLabel = '% Acresc. nos Servi'#231'os'
      FieldName = 'ACRESC_P_SERV'
      Origin = '"PEDVENDA"."ACRESC_P_SERV"'
    end
    object cdsPVACRESCIMO: TFloatField
      DisplayLabel = 'Valor do Acr'#233'scimo'
      FieldName = 'ACRESCIMO'
      Origin = '"PEDVENDA"."ACRESCIMO"'
      currency = True
    end
    object cdsPVPLACA: TStringField
      DisplayLabel = 'Placa'
      FieldName = 'PLACA'
      Origin = '"PEDVENDA"."PLACA"'
      Size = 10
    end
    object cdsPVCHASSI: TStringField
      DisplayLabel = 'Chassi'
      FieldName = 'CHASSI'
      Origin = '"PEDVENDA"."CHASSI"'
      Size = 17
    end
    object cdsPVKM_V: TIntegerField
      DisplayLabel = 'Quilometragem'
      FieldName = 'KM_V'
      Origin = '"PEDVENDA"."KM_V"'
    end
    object cdsPVORC_PROD: TIntegerField
      FieldName = 'ORC_PROD'
      Origin = '"PEDVENDA"."ORC_PROD"'
    end
    object cdsPVDT_PROMETIDA: TDateTimeField
      DisplayLabel = 'Data Prometida'
      FieldName = 'DT_PROMETIDA'
      Origin = '"PEDVENDA"."DT_PROMETIDA"'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsPVOBS_OS: TMemoField
      DisplayLabel = 'Obs. da OS'
      FieldName = 'OBS_OS'
      Origin = '"PEDVENDA"."OBS_OS"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
    object cdsPVAPARELHO_PED: TStringField
      DisplayLabel = 'Descri'#231#227'o do Aparelho'
      FieldName = 'APARELHO_PED'
      Origin = '"PEDVENDA"."APARELHO_PED"'
      Size = 50
    end
    object cdsPVGUARDA_VOL: TStringField
      DisplayLabel = 'Guarda Volume'
      FieldName = 'GUARDA_VOL'
      Origin = '"PEDVENDA"."GUARDA_VOL"'
      Size = 10
    end
    object cdsPVCOMBUST_VEIC: TStringField
      DisplayLabel = 'Qtd Combust'#237'vel'
      FieldName = 'COMBUST_VEIC'
      Origin = '"PEDVENDA"."COMBUST_VEIC"'
      FixedChar = True
      Size = 3
    end
    object cdsPVDEFEITO: TMemoField
      DisplayLabel = 'Defeito'
      FieldName = 'DEFEITO'
      Origin = '"PEDVENDA"."DEFEITO"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
    object cdsPVESTADO_VEIC: TMemoField
      DisplayLabel = 'Estado do Ve'#237'culo'
      FieldName = 'ESTADO_VEIC'
      Origin = '"PEDVENDA"."ESTADO_VEIC"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
    object cdsPVACESSORIOS: TMemoField
      DisplayLabel = 'Acess'#243'rios'
      FieldName = 'ACESSORIOS'
      Origin = '"PEDVENDA"."ACESSORIOS"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
    object cdsPVTIPO_OS: TStringField
      DisplayLabel = 'Tipo da OS'
      FieldName = 'TIPO_OS'
      Origin = '"PEDVENDA"."TIPO_OS"'
      Size = 10
    end
    object cdsPVH_ENT: TDateTimeField
      DisplayLabel = 'Hs da Entrada'
      FieldName = 'H_ENT'
      Origin = '"PEDVENDA"."H_ENT"'
      EditMask = '!90:00;1;_'
    end
    object cdsPVH_PROMETIDA: TDateTimeField
      DisplayLabel = 'Hs Prometida'
      FieldName = 'H_PROMETIDA'
      Origin = '"PEDVENDA"."H_PROMETIDA"'
      EditMask = '!90:00;1;_'
    end
    object cdsPVDATA_NF: TDateTimeField
      DisplayLabel = 'Data da NF'
      FieldName = 'DATA_NF'
      Origin = '"PEDVENDA"."DATA_NF"'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsPVDT_NFGARANTIA: TDateTimeField
      DisplayLabel = 'Fim da Garantia'
      FieldName = 'DT_NFGARANTIA'
      Origin = '"PEDVENDA"."DT_NFGARANTIA"'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsPVTOT_PROD: TFloatField
      DisplayLabel = 'Total Produtos OS'
      FieldName = 'TOT_PROD'
      Origin = '"PEDVENDA"."TOT_PROD"'
      currency = True
    end
    object cdsPVTOT_SERV: TFloatField
      DisplayLabel = 'Total Servi'#231'os OS'
      FieldName = 'TOT_SERV'
      Origin = '"PEDVENDA"."TOT_SERV"'
      currency = True
    end
    object cdsPVTP_ABORD: TStringField
      DisplayLabel = 'Abordagem ao Cliente'
      FieldName = 'TP_ABORD'
      Origin = '"PEDVENDA"."TP_ABORD"'
      FixedChar = True
      Size = 3
    end
    object cdsPVFR_PAGBOSCH: TStringField
      DisplayLabel = 'Pag. Linha Bosch'
      FieldName = 'FR_PAGBOSCH'
      Origin = '"PEDVENDA"."FR_PAGBOSCH"'
      FixedChar = True
      Size = 3
    end
    object cdsPVSEQ_FECH: TIntegerField
      DisplayLabel = 'Sequ'#234'ncia de Fechamento'
      FieldName = 'SEQ_FECH'
      Origin = '"PEDVENDA"."SEQ_FECH"'
    end
    object cdsPVEM_NF: TStringField
      DisplayLabel = 'Marca OS Livro'
      FieldName = 'EM_NF'
      Origin = '"PEDVENDA"."EM_NF"'
      FixedChar = True
      Size = 1
    end
    object cdsPVCOD_EQUIP: TIntegerField
      DisplayLabel = 'C'#243'digo do Equipamento'
      FieldName = 'COD_EQUIP'
      Origin = '"PEDVENDA"."COD_EQUIP"'
    end
    object cdsPVN_SERIE: TStringField
      FieldName = 'N_SERIE'
      Origin = '"PEDVENDA"."N_SERIE"'
      Size = 32
    end
    object cdsPVNUM_NF: TIntegerField
      DisplayLabel = 'N'#186' da NF para OS'
      FieldName = 'NUM_NF'
      Origin = '"PEDVENDA"."NUM_NF"'
    end
    object cdsPVOBS_LIVRO_REG: TStringField
      DisplayLabel = 'Obs. Livro de Registro'
      FieldName = 'OBS_LIVRO_REG'
      Origin = '"PEDVENDA"."OBS_LIVRO_REG"'
      Size = 32
    end
    object cdsPVVALOR_NF: TFloatField
      DisplayLabel = 'Valor da NF'
      FieldName = 'VALOR_NF'
      Origin = '"PEDVENDA"."VALOR_NF"'
      currency = True
    end
    object cdsPVNF_PGARANTIA: TIntegerField
      DisplayLabel = 'NF Para Garantia'
      FieldName = 'NF_PGARANTIA'
      Origin = '"PEDVENDA"."NF_PGARANTIA"'
    end
    object cdsPVNOME_NF_GARANTIA: TStringField
      DisplayLabel = 'Nome do Cliente na NF'
      FieldName = 'NOME_NF_GARANTIA'
      Origin = '"PEDVENDA"."NOME_NF_GARANTIA"'
      Size = 60
    end
    object cdsPVHORA_FECH: TStringField
      DisplayLabel = 'Hora Fechamento'
      FieldName = 'HORA_FECH'
      Origin = '"PEDVENDA"."HORA_FECH"'
      FixedChar = True
      Size = 8
    end
    object cdsPVST_TERM_SERV: TStringField
      DisplayLabel = 'Status TMO'
      FieldName = 'ST_TERM_SERV'
      Origin = '"PEDVENDA"."ST_TERM_SERV"'
      FixedChar = True
      Size = 10
    end
    object cdsPVREGISTRO_DE_ENTREGA: TStringField
      DisplayLabel = 'Registro de Entrega'
      FieldName = 'REGISTRO_DE_ENTREGA'
      Origin = '"PEDVENDA"."REGISTRO_DE_ENTREGA"'
      Size = 100
    end
    object cdsPVATIVO: TIntegerField
      Tag = 1
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
      Origin = '"PEDVENDA"."ATIVO"'
    end
    object cdsPVTIPO_ORC: TStringField
      DisplayLabel = 'Tipo de Or'#231'amento'
      FieldName = 'TIPO_ORC'
      Origin = '"PEDVENDA"."TIPO_ORC"'
      FixedChar = True
      Size = 1
    end
    object cdsPVSTATUS_CUPOM: TStringField
      DisplayLabel = 'Status Cupom'
      FieldName = 'STATUS_CUPOM'
      FixedChar = True
      Size = 1
    end
    object cdsPVNOME_CLI_ORC: TStringField
      DisplayLabel = 'Cliente Or'#231'amento'
      FieldName = 'NOME_CLI_ORC'
      Size = 35
    end
    object cdsPVCOD_ORCAMENTO: TIntegerField
      DisplayLabel = 'N'#186' Or'#231'amento'
      FieldName = 'COD_ORCAMENTO'
    end
    object cdsPVOBS_RED_OS: TStringField
      DisplayLabel = 'Obs Red OS'
      FieldName = 'OBS_RED_OS'
      Size = 50
    end
    object cdsPVCOD_VEICULO: TIntegerField
      DisplayLabel = 'Cod Ve'#237'culo'
      FieldName = 'COD_VEICULO'
    end
    object cdsPVPROCESSADA_SL: TIntegerField
      FieldName = 'PROCESSADA_SL'
    end
    object cdsPVDATA_NFEXT: TDateTimeField
      FieldName = 'DATA_NFEXT'
    end
    object cdsPVVALOR_NFEXT: TFloatField
      FieldName = 'VALOR_NFEXT'
    end
    object cdsPVCODTERM_STATUS: TIntegerField
      FieldName = 'CODTERM_STATUS'
    end
    object cdsPVNUM_NFEEXT: TLargeintField
      FieldName = 'NUM_NFEEXT'
    end
  end
  object cdsItemPV: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspItemPV'
    BeforeOpen = clientDataSetBeforeOpen
    Left = 675
    Top = 210
    object cdsItemPVNPED: TIntegerField
      DisplayLabel = 'N'#186' Venda'
      FieldName = 'NPED'
      Origin = '"PEDVENDA_PROD"."NPED"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsItemPVNITEM: TIntegerField
      DisplayLabel = 'N'#186' Item'
      FieldName = 'NITEM'
      Required = True
    end
    object cdsItemPVGRUPO_PROD: TIntegerField
      DisplayLabel = 'Grupo'
      FieldName = 'GRUPO_PROD'
      Origin = '"PEDVENDA_PROD"."GRUPO_PROD"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsItemPVCOD_PROD: TStringField
      DisplayLabel = 'C'#243'd. Produto'
      FieldName = 'COD_PROD'
      Origin = '"PEDVENDA_PROD"."COD_PROD"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 6
    end
    object cdsItemPVDESCR_PROD_PED: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCR_PROD_PED'
      Origin = '"PEDVENDA_PROD"."DESCR_PROD_PED"'
      Size = 60
    end
    object cdsItemPVVLUN_PED_ITEM: TFloatField
      DisplayLabel = 'Val. Unit'#225'rio'
      FieldName = 'VLUN_PED_ITEM'
      Origin = '"PEDVENDA_PROD"."VLUN_PED_ITEM"'
      currency = True
    end
    object cdsItemPVQUANT_PED_ITEM: TFloatField
      DisplayLabel = 'Quantidade'
      FieldName = 'QUANT_PED_ITEM'
      Origin = '"PEDVENDA_PROD"."QUANT_PED_ITEM"'
    end
    object cdsItemPVVLTOT_PED_ITEM: TFloatField
      DisplayLabel = 'Val. total Item '
      FieldName = 'VLTOT_PED_ITEM'
      Origin = '"PEDVENDA_PROD"."VLTOT_PED_ITEM"'
      currency = True
    end
    object cdsItemPVCODIGO_NOP: TFloatField
      DisplayLabel = 'Nat. Opeta'#231#227'o'
      FieldName = 'CODIGO_NOP'
      Origin = '"PEDVENDA_PROD"."CODIGO_NOP"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsItemPVNUM_FAB_PROD: TStringField
      DisplayLabel = 'Num. Fabrica'#231#227'o'
      FieldName = 'NUM_FAB_PROD'
      Origin = '"PEDVENDA_PROD"."NUM_FAB_PROD"'
      FixedChar = True
    end
    object cdsItemPVN_NF: TIntegerField
      DisplayLabel = 'N'#186' NF'
      FieldName = 'N_NF'
      Origin = '"PEDVENDA_PROD"."N_NF"'
    end
    object cdsItemPVALIQUOTA_CP: TStringField
      DisplayLabel = 'Aliquota Cupom'
      FieldName = 'ALIQUOTA_CP'
      Origin = '"PEDVENDA_PROD"."ALIQUOTA_CP"'
      FixedChar = True
      Size = 4
    end
    object cdsItemPVN_SERIE_PROD: TStringField
      DisplayLabel = 'N'#186' S'#233'rie Prod.'
      FieldName = 'N_SERIE_PROD'
      Origin = '"PEDVENDA_PROD"."N_SERIE_PROD"'
      Size = 15
    end
    object cdsItemPVANO_FAB_PROD: TIntegerField
      DisplayLabel = 'Aano/Fab Produto'
      FieldName = 'ANO_FAB_PROD'
      Origin = '"PEDVENDA_PROD"."ANO_FAB_PROD"'
    end
    object cdsItemPVMODELO: TStringField
      DisplayLabel = 'Modelo'
      FieldName = 'MODELO'
      Origin = '"PEDVENDA_PROD"."MODELO"'
      Size = 15
    end
    object cdsItemPVCOR: TStringField
      DisplayLabel = 'Cor'
      FieldName = 'COR'
      Origin = '"PEDVENDA_PROD"."COR"'
      Size = 10
    end
    object cdsItemPVTP_NF_PED: TStringField
      DisplayLabel = 'Tipo Custo'
      FieldName = 'TP_NF_PED'
      Origin = '"PEDVENDA_PROD"."TP_NF_PED"'
      FixedChar = True
      Size = 1
    end
    object cdsItemPVCOD_SEG_SERV: TIntegerField
      DisplayLabel = 'Segmenta'#231#227'o'
      FieldName = 'COD_SEG_SERV'
      Origin = '"PEDVENDA_PROD"."COD_SEG_SERV"'
    end
    object cdsItemPVRATEIO_DESC: TFloatField
      DisplayLabel = 'Rateio do Desconto'
      FieldName = 'RATEIO_DESC'
      Origin = '"PEDVENDA_PROD"."RATEIO_DESC"'
      currency = True
    end
    object cdsItemPVRATEIO_ACRESC: TFloatField
      DisplayLabel = 'Rateio do Acr'#233'scimo'
      FieldName = 'RATEIO_ACRESC'
      Origin = '"PEDVENDA_PROD"."RATEIO_ACRESC"'
      currency = True
    end
    object cdsItemPVDESC_ITEM: TFloatField
      DisplayLabel = 'Desconto no Item'
      FieldName = 'DESC_ITEM'
      Origin = '"PEDVENDA_PROD"."DESC_ITEM"'
      currency = True
    end
    object cdsItemPVACRESC_ITEM: TFloatField
      DisplayLabel = 'Acrescimo no Item'
      FieldName = 'ACRESC_ITEM'
      Origin = '"PEDVENDA_PROD"."ACRESC_ITEM"'
      currency = True
    end
    object cdsItemPVTIPO: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Origin = '"PEDVENDA_PROD"."TIPO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      FixedChar = True
      Size = 3
    end
    object cdsItemPVCOD_EMPRESA: TIntegerField
      DisplayLabel = 'Cod. Empresa'
      FieldName = 'COD_EMPRESA'
      Origin = '"PEDVENDA_PROD"."COD_EMPRESA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
    end
    object cdsItemPVCOD_GRADE: TIntegerField
      DisplayLabel = 'Cod. Grade'
      FieldName = 'COD_GRADE'
      Origin = '"PEDVENDA_PROD"."COD_GRADE"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object cdsItemPVVLUN_ORIG: TFloatField
      DisplayLabel = 'Val. Unit'#225'rio Original'
      FieldName = 'VLUN_ORIG'
      Origin = '"PEDVENDA_PROD"."VLUN_ORIG"'
      Visible = False
    end
    object cdsItemPVVLUN_PED_NF: TFloatField
      DisplayLabel = 'Val. Unit'#225'rio na NF'
      FieldName = 'VLUN_PED_NF'
      Origin = '"PEDVENDA_PROD"."VLUN_PED_NF"'
      Visible = False
      currency = True
    end
    object cdsItemPVVLTOT_PED_NF: TFloatField
      DisplayLabel = 'Val. total Item na NF'
      FieldName = 'VLTOT_PED_NF'
      Origin = '"PEDVENDA_PROD"."VLTOT_PED_NF"'
      Visible = False
    end
    object cdsItemPVRATDSAS: TFloatField
      DisplayLabel = 'Rateio da Venda'
      FieldName = 'RATDSAS'
      Origin = '"PEDVENDA_PROD"."RATDSAS"'
      Visible = False
    end
    object cdsItemPVCOMISS_PROD: TFloatField
      DisplayLabel = 'Comiss'#227'o Prod.'
      FieldName = 'COMISS_PROD'
      Origin = '"PEDVENDA_PROD"."COMISS_PROD"'
      Visible = False
    end
    object cdsItemPVCOMISS_PROD_GER: TFloatField
      DisplayLabel = 'Comiss'#227'o Prod. Gerente'
      FieldName = 'COMISS_PROD_GER'
      Origin = '"PEDVENDA_PROD"."COMISS_PROD_GER"'
      Visible = False
    end
    object cdsItemPVPCUST_C: TFloatField
      DisplayLabel = 'Val. custo apurado'
      FieldName = 'PCUST_C'
      Origin = '"PEDVENDA_PROD"."PCUST_C"'
      Visible = False
    end
    object cdsItemPVPCUST_R: TFloatField
      DisplayLabel = 'Val. custo real'
      FieldName = 'PCUST_R'
      Origin = '"PEDVENDA_PROD"."PCUST_R"'
      Visible = False
    end
    object cdsItemPVPCUST_MC: TFloatField
      DisplayLabel = 'Val. custo m'#233'dio'
      FieldName = 'PCUST_MC'
      Origin = '"PEDVENDA_PROD"."PCUST_MC"'
      Visible = False
    end
    object cdsItemPVPCUST_MR: TFloatField
      DisplayLabel = 'Val. custo m'#233'dio real'
      FieldName = 'PCUST_MR'
      Origin = '"PEDVENDA_PROD"."PCUST_MR"'
      Visible = False
    end
    object cdsItemPVSIT_ATD: TStringField
      DisplayLabel = 'Situa'#231#227'o de atendimento'
      FieldName = 'SIT_ATD'
      Origin = '"PEDVENDA_PROD"."SIT_ATD"'
      Visible = False
      FixedChar = True
      Size = 2
    end
    object cdsItemPVSEL: TStringField
      DisplayLabel = 'Selec'
      FieldName = 'SEL'
      Origin = '"PEDVENDA_PROD"."SEL"'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object cdsItemPVDATA_ATD: TDateTimeField
      DisplayLabel = 'Data do Atendimento'
      FieldName = 'DATA_ATD'
      Origin = '"PEDVENDA_PROD"."DATA_ATD"'
      Visible = False
    end
    object cdsItemPVHORA_ATD: TStringField
      DisplayLabel = 'Hs do Atendimento'
      FieldName = 'HORA_ATD'
      Origin = '"PEDVENDA_PROD"."HORA_ATD"'
      Visible = False
      FixedChar = True
      Size = 8
    end
    object cdsItemPVCODIGO_KIT: TIntegerField
      DisplayLabel = 'C'#243'digo do Kit'
      FieldName = 'CODIGO_KIT'
      Origin = '"PEDVENDA_PROD"."CODIGO_KIT"'
      Visible = False
    end
    object cdsItemPVICMANT_SUB: TFloatField
      DisplayLabel = 'Icms Antecipa'#231#227'o trib.'
      FieldName = 'ICMANT_SUB'
      Origin = '"PEDVENDA_PROD"."ICMANT_SUB"'
      Visible = False
    end
    object cdsItemPVCOL_COD_VENDEDOR: TIntegerField
      DisplayLabel = 'Tecnico/Mecanico'
      FieldName = 'COL_COD_VENDEDOR'
      Origin = '"PEDVENDA_PROD"."COL_COD_VENDEDOR"'
      Visible = False
    end
    object cdsItemPVCOD_VENDEDOR: TIntegerField
      DisplayLabel = 'Vendedor'
      FieldName = 'COD_VENDEDOR'
      Origin = '"PEDVENDA_PROD"."COD_VENDEDOR"'
      Visible = False
    end
    object cdsItemPVDATA_TRANSF: TDateTimeField
      DisplayLabel = 'Data Transferencia'
      FieldName = 'DATA_TRANSF'
      Origin = '"PEDVENDA_PROD"."DATA_TRANSF"'
      Visible = False
    end
    object cdsItemPVDATA_DEV: TDateTimeField
      DisplayLabel = 'Data Devolu'#231#227'o'
      FieldName = 'DATA_DEV'
      Origin = '"PEDVENDA_PROD"."DATA_DEV"'
      Visible = False
    end
    object cdsItemPVNOME_VEND: TStringField
      DisplayLabel = 'Nome Vendedor'
      FieldName = 'NOME_VEND'
      Origin = '"PEDVENDA_PROD"."NOME_VEND"'
      Visible = False
      Size = 35
    end
    object cdsItemPVNOME_VEND1: TStringField
      DisplayLabel = 'Nome Vendedor 2'
      FieldName = 'NOME_VEND1'
      Origin = '"PEDVENDA_PROD"."NOME_VEND1"'
      Visible = False
      Size = 35
    end
    object cdsItemPVQT_DEV: TFloatField
      DisplayLabel = 'Qtde Devolvida'
      FieldName = 'QT_DEV'
      Origin = '"PEDVENDA_PROD"."QT_DEV"'
      Visible = False
    end
    object cdsItemPVATIVO: TIntegerField
      FieldName = 'ATIVO'
    end
  end
  object cdsServPV: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspServPV'
    BeforeOpen = clientDataSetBeforeOpen
    Left = 754
    Top = 210
    object cdsServPVNPED: TIntegerField
      DisplayLabel = 'N'#186' Venda'
      FieldName = 'NPED'
      Required = True
    end
    object cdsServPVNITEM: TIntegerField
      DisplayLabel = 'N'#186' Item'
      FieldName = 'NITEM'
      Required = True
    end
    object cdsServPVCOD_SERVICO: TIntegerField
      DisplayLabel = 'Cod. Servi'#231'o'
      FieldName = 'COD_SERVICO'
      Required = True
    end
    object cdsServPVCODIGO_NOP: TFloatField
      DisplayLabel = 'CFOP'
      FieldName = 'CODIGO_NOP'
    end
    object cdsServPVDESC_SERV_PED: TStringField
      DisplayLabel = 'Descri'#231#227'o Servi'#231'o'
      FieldName = 'DESC_SERV_PED'
      Size = 60
    end
    object cdsServPVNOME_VEND: TStringField
      DisplayLabel = 'Nome Mec'#226'nico'
      FieldName = 'NOME_VEND'
      Size = 35
    end
    object cdsServPVVALOR_UN_SERV: TFloatField
      DisplayLabel = 'Valor Unit'#225'rio'
      FieldName = 'VALOR_UN_SERV'
      currency = True
    end
    object cdsServPVQUANT_SERV_PED: TFloatField
      DisplayLabel = 'Qtde Servi'#231'o'
      FieldName = 'QUANT_SERV_PED'
    end
    object cdsServPVVALOR_TOT_SERV: TFloatField
      DisplayLabel = 'Valor Total'
      FieldName = 'VALOR_TOT_SERV'
      currency = True
    end
    object cdsServPVPRC_INT_SERV: TFloatField
      DisplayLabel = 'Vl Interno Serv'
      FieldName = 'PRC_INT_SERV'
      currency = True
    end
    object cdsServPVRATEIO_DESC: TFloatField
      DisplayLabel = 'Rateio Desc'
      FieldName = 'RATEIO_DESC'
      currency = True
    end
    object cdsServPVRATEIO_ACRESC: TFloatField
      DisplayLabel = 'Rateio Acresc'
      FieldName = 'RATEIO_ACRESC'
      currency = True
    end
    object cdsServPVDESC_ITEM: TFloatField
      DisplayLabel = 'Desconto'
      FieldName = 'DESC_ITEM'
      currency = True
    end
    object cdsServPVACRESC_ITEM: TFloatField
      DisplayLabel = 'Acr'#233'scimo'
      FieldName = 'ACRESC_ITEM'
      currency = True
    end
    object cdsServPVSUBGSERVICO: TIntegerField
      DisplayLabel = 'Sub Grupo'
      FieldName = 'SUBGSERVICO'
    end
    object cdsServPVNOME_VEND1: TStringField
      DisplayLabel = 'Nome Mec'#226'nico 1'
      FieldName = 'NOME_VEND1'
      Size = 35
    end
    object cdsServPVTMO_SERV: TFloatField
      FieldName = 'TMO_SERV'
      Visible = False
    end
    object cdsServPVTIPO: TStringField
      Tag = 2
      FieldName = 'TIPO'
      Required = True
      Visible = False
      FixedChar = True
      Size = 3
    end
    object cdsServPVATIVO: TIntegerField
      Tag = 2
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
      Visible = False
    end
    object cdsServPVCOD_VENDEDOR1: TIntegerField
      DisplayLabel = 'Cod Mec'#226'nico 2'
      FieldName = 'COD_VENDEDOR1'
      Visible = False
    end
    object cdsServPVVLUN_ORIG: TFloatField
      Tag = 2
      DisplayLabel = 'Valor Original'
      FieldName = 'VLUN_ORIG'
      Visible = False
    end
    object cdsServPVCOD_VENDEDOR: TIntegerField
      DisplayLabel = 'Cod Mec'#226'nico 1'
      FieldName = 'COD_VENDEDOR'
      Required = True
      Visible = False
    end
    object cdsServPVCOD_EMPRESA: TIntegerField
      Tag = 2
      FieldName = 'COD_EMPRESA'
      Required = True
      Visible = False
    end
    object cdsServPVN_NF: TLargeintField
      FieldName = 'N_NF'
    end
  end
  object cdsTercPV: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTercPV'
    BeforeOpen = clientDataSetBeforeOpen
    Left = 829
    Top = 210
    object cdsTercPVNPED: TIntegerField
      DisplayLabel = 'N'#186' da OS'
      FieldName = 'NPED'
      Required = True
    end
    object cdsTercPVDESCR_SERVT: TStringField
      DisplayLabel = 'Descri'#231#227'o do servi'#231'o'
      FieldName = 'DESCR_SERVT'
      Required = True
      Size = 60
    end
    object cdsTercPVCOD_EMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsTercPVVL_SERVT: TFloatField
      DisplayLabel = 'Valor do Servi'#231'o'
      FieldName = 'VL_SERVT'
    end
    object cdsTercPVATIVO: TIntegerField
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
    end
    object cdsTercPVVLUN_ORIG: TFloatField
      DisplayLabel = 'Valor original'
      FieldName = 'VLUN_ORIG'
    end
    object cdsTercPVTIPO: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Required = True
      FixedChar = True
      Size = 3
    end
  end
  object qrEquip: TIBQuery
    Database = bancoDestino
    Transaction = transacaoDestino
    SQL.Strings = (
      'select * from EQUIPAMENTO')
    Left = 901
    Top = 94
  end
  object dspEquip: TDataSetProvider
    DataSet = qrEquip
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 901
    Top = 153
  end
  object cdsEquip: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEquip'
    BeforeOpen = clientDataSetBeforeOpen
    Left = 901
    Top = 210
    object cdsEquipCOD_EQUIP: TIntegerField
      FieldName = 'COD_EQUIP'
      Required = True
    end
    object cdsEquipCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsEquipDAT_CAD_EQUI: TDateTimeField
      FieldName = 'DAT_CAD_EQUI'
    end
    object cdsEquipESTADO_EQUI: TMemoField
      FieldName = 'ESTADO_EQUI'
      BlobType = ftMemo
      Size = 8
    end
    object cdsEquipTIP_EQUIP: TStringField
      FieldName = 'TIP_EQUIP'
      FixedChar = True
      Size = 1
    end
    object cdsEquipVLR_EQUI: TFloatField
      FieldName = 'VLR_EQUI'
    end
    object cdsEquipIND_DEPREC: TFloatField
      FieldName = 'IND_DEPREC'
    end
    object cdsEquipCOD_DEPART: TIntegerField
      FieldName = 'COD_DEPART'
    end
    object cdsEquipCOD_PROP: TIntegerField
      FieldName = 'COD_PROP'
    end
    object cdsEquipNOM_EQUIP: TStringField
      FieldName = 'NOM_EQUIP'
      Size = 32
    end
    object cdsEquipN_SERIE: TStringField
      FieldName = 'N_SERIE'
      Size = 32
    end
    object cdsEquipMARCA: TStringField
      FieldName = 'MARCA'
      Size = 32
    end
    object cdsEquipMODELO: TStringField
      FieldName = 'MODELO'
      Size = 32
    end
    object cdsEquipCOR: TStringField
      FieldName = 'COR'
      Size = 16
    end
    object cdsEquipATIVO: TIntegerField
      FieldName = 'ATIVO'
    end
    object cdsEquipCOD_MARCA: TIntegerField
      FieldName = 'COD_MARCA'
      Required = True
    end
    object cdsEquipIDENTIFICACAO: TStringField
      FieldName = 'IDENTIFICACAO'
      FixedChar = True
      Size = 6
    end
    object cdsEquipN_SERIE_FAB: TStringField
      FieldName = 'N_SERIE_FAB'
    end
    object cdsEquipN_MEMORIA_FISCAL: TStringField
      FieldName = 'N_MEMORIA_FISCAL'
    end
    object cdsEquipCODSEQ_BALANCO: TIntegerField
      FieldName = 'CODSEQ_BALANCO'
    end
    object cdsEquipTIPEQUIP: TStringField
      FieldName = 'TIPEQUIP'
      Size = 1
    end
  end
  object SpIncCodDest: TIBStoredProc
    Database = bancoDestino
    Transaction = transacaoDestino
    StoredProcName = 'INCREMENTA_CODIGO'
    Left = 812
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
  object qrMec: TIBQuery
    Database = bancoDestino
    Transaction = transacaoDestino
    SQL.Strings = (
      'select * from MECANICO_OS')
    Left = 989
    Top = 94
  end
  object dspMec: TDataSetProvider
    DataSet = qrMec
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 989
    Top = 153
  end
  object cdsMec: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspMec'
    BeforeOpen = clientDataSetBeforeOpen
    Left = 989
    Top = 210
    object cdsMecCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
      Required = True
    end
    object cdsMecNPED: TIntegerField
      FieldName = 'NPED'
      Required = True
    end
    object cdsMecTIPO: TStringField
      FieldName = 'TIPO'
      Required = True
      FixedChar = True
      Size = 3
    end
    object cdsMecCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsMecCOD_SERVICO: TIntegerField
      FieldName = 'COD_SERVICO'
      Required = True
    end
    object cdsMecCODIGO_NOP: TFloatField
      FieldName = 'CODIGO_NOP'
    end
    object cdsMecPER_COMISSAO: TFloatField
      FieldName = 'PER_COMISSAO'
    end
    object cdsMecN_OS: TIntegerField
      FieldName = 'N_OS'
    end
  end
  object qrOcorr: TIBQuery
    Database = bancoDestino
    Transaction = transacaoDestino
    SQL.Strings = (
      'select * from OCORRENCIAS_OS')
    Left = 1077
    Top = 94
  end
  object dspOcorr: TDataSetProvider
    DataSet = qrOcorr
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 1077
    Top = 153
  end
  object cdsOcorr: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspOcorr'
    BeforeOpen = clientDataSetBeforeOpen
    Left = 1077
    Top = 210
    object cdsOcorrCOD_OCORRENCIA: TIntegerField
      FieldName = 'COD_OCORRENCIA'
      Required = True
    end
    object cdsOcorrNPED: TIntegerField
      FieldName = 'NPED'
      Required = True
    end
    object cdsOcorrTIPO: TStringField
      FieldName = 'TIPO'
      Required = True
      FixedChar = True
      Size = 3
    end
    object cdsOcorrCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsOcorrHISTORICO_OC: TStringField
      FieldName = 'HISTORICO_OC'
      Required = True
      Size = 150
    end
    object cdsOcorrDATA_E_HORA: TDateTimeField
      FieldName = 'DATA_E_HORA'
      Required = True
    end
    object cdsOcorrATIVO: TIntegerField
      FieldName = 'ATIVO'
    end
    object cdsOcorrN_OS: TIntegerField
      FieldName = 'N_OS'
    end
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProdTerceiro'
    Left = 509
    Top = 306
    object IntegerField1: TIntegerField
      DisplayLabel = 'N'#186' da OS'
      FieldName = 'NPED'
      Origin = '"PEDVENDA_PROD_TERC"."NPED"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IntegerField2: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'COD_EMPRESA'
      Origin = '"PEDVENDA_PROD_TERC"."COD_EMPRESA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object StringField1: TStringField
      DisplayLabel = 'Descri'#231#227'o do Produto'
      FieldName = 'DESCRICAO'
      Origin = '"PEDVENDA_PROD_TERC"."DESCRICAO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 50
    end
    object FloatField1: TFloatField
      DisplayLabel = 'Quantidade'
      FieldName = 'QTDE'
      Origin = '"PEDVENDA_PROD_TERC"."QTDE"'
    end
    object FloatField2: TFloatField
      DisplayLabel = 'Valor Unit'#225'rio'
      FieldName = 'VL_UNIT'
      Origin = '"PEDVENDA_PROD_TERC"."VL_UNIT"'
    end
    object FloatField3: TFloatField
      DisplayLabel = 'Valor Total'
      FieldName = 'VL_TOTAL'
      Origin = '"PEDVENDA_PROD_TERC"."VL_TOTAL"'
    end
    object StringField2: TStringField
      DisplayLabel = 'Unidade'
      FieldName = 'UNIDADE'
      Origin = '"PEDVENDA_PROD_TERC"."UNIDADE"'
      FixedChar = True
      Size = 2
    end
    object IntegerField3: TIntegerField
      DisplayLabel = 'Cod. Vendedor'
      FieldName = 'COD_VENDEDOR'
      Origin = '"PEDVENDA_PROD_TERC"."COD_VENDEDOR"'
    end
    object StringField3: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Origin = '"PEDVENDA_PROD_TERC"."TIPO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 3
    end
  end
  object IBQuery1: TIBQuery
    Database = dtmAtivo.bancoHw
    Transaction = dtmAtivo.IbTransCol
    SQL.Strings = (
      'SELECT * FROM PEDVENDA_PROD_TERC')
    Left = 949
    Top = 270
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = IBQuery1
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 949
    Top = 329
  end
  object cdsProdTerceiro123: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 952
    Top = 384
    object cdsProdTerceiro123NPED: TIntegerField
      FieldName = 'NPED'
      Required = True
    end
    object cdsProdTerceiro123TIPO: TStringField
      FieldName = 'TIPO'
      Required = True
      FixedChar = True
      Size = 3
    end
    object cdsProdTerceiro123COD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object cdsProdTerceiro123DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 50
    end
    object cdsProdTerceiro123QTDE: TFloatField
      FieldName = 'QTDE'
    end
    object cdsProdTerceiro123VL_UNIT: TFloatField
      FieldName = 'VL_UNIT'
    end
    object cdsProdTerceiro123VL_TOTAL: TFloatField
      FieldName = 'VL_TOTAL'
    end
    object cdsProdTerceiro123UNIDADE: TStringField
      FieldName = 'UNIDADE'
      FixedChar = True
      Size = 2
    end
    object cdsProdTerceiro123COD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
    end
    object cdsProdTerceiro123ATIVO: TIntegerField
      FieldName = 'ATIVO'
    end
  end
end
