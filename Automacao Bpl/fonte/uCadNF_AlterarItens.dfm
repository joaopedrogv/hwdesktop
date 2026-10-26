inherited fmrCadNF_AlterarItens: TfmrCadNF_AlterarItens
  Caption = 'Altera'#231#227'o de itens em lote'
  ClientHeight = 525
  ClientWidth = 741
  Position = poScreenCenter
  OnClose = FormClose
  ExplicitWidth = 749
  ExplicitHeight = 559
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 741
    Height = 525
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 6
    TabOrder = 0
    object Panel2: TPanel
      Left = 6
      Top = 57
      Width = 729
      Height = 227
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object DBGrid13: TDBGrid
        Left = 0
        Top = 0
        Width = 729
        Height = 227
        Hint = 
          '[F3: Seleciona Item]  [F4: Seleciona todos] - Itens da nota fisc' +
          'al.'
        Align = alClient
        DataSource = dtmNF.dsINf
        DragCursor = crDefault
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDrawColumnCell = DBGrid13DrawColumnCell
        OnKeyDown = DBGrid13KeyDown
        Columns = <
          item
            Expanded = False
            FieldName = 'NITEM'
            Width = 39
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRICAO_ITEM'
            Width = 243
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QUANTIDADE'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALOR_UNITARIO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALOR_TOTAL'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NUM_FAB_PROD'
            Title.Caption = 'C'#243'digo'
            Width = 83
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CODIGO_NOP'
            Width = 41
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CST'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CSOSN'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CEST'
            Width = 77
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NCM'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'REFERENCIA'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NPED'
            Width = 51
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TIPO_PED'
            Title.Caption = 'Tipo Vnd'
            Width = 43
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PERC_DESCONTO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RATEIO_DESCONTO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ALIQ_ICM'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BASE_ICM'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALOR_ICM'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VICMDESON'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PERC_RED_PROD'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MVA'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ALIQ_ICMSUB'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BASE_ICMSUB'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALOR_ICMSUB'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ALIQ_IPI'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BASE_IPI'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALOR_IPI'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PERC_RED_IPI'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ALIQ_ICM_SIMPLES'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BASE_ICM_SIMPLES'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALOR_ICM_SIMPLES'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BASE_ICMANT_SUB'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALOR_ICMANT_SUB'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RATEIO_SEGURO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RATEIO_OUTDESP'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RATEIO_FRETE'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VLISENTO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VLOUTRAS'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VLN_TRIB'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ALIQ_ISS'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BASE_ISS'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALOR_ISS'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TIPO_ITEM'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ANTEC_TRIB'
            Title.Caption = 'Ant Trib'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BASE_ICMSUB_ANT'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALOR_ICMSUB_ANT'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IMPORT_XML'
            Title.Caption = 'N Calc ST'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CST_PIS'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ALIQ_PIS'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BASE_PIS'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALOR_PIS'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VPISDESON'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QUANT_BC_PIS'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ALIQ_PIS_QUANT'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CST_COFINS'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ALIQ_COFINS'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BASE_COFINS'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALOR_COFINS'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VCOFINSDESON'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QUANT_BC_COFINS'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ALIQ_COFINS_QUANT'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ALTERA_ESTOQUE_CFOP'
            Title.Caption = 'Alt Est'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VTOTTRIB'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'XPED_COMPRA'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NITEMPED_COMPRA'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'INDTOT'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PERMITIR_DESCONTO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TIPO_CALC'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TIPO_CALC_PC'
            Visible = True
          end>
      end
    end
    object Panel3: TPanel
      Left = 6
      Top = 284
      Width = 729
      Height = 194
      Align = alBottom
      BevelOuter = bvNone
      Padding.Bottom = 6
      TabOrder = 2
      object GroupBox1: TGroupBox
        Left = 0
        Top = 0
        Width = 729
        Height = 188
        Align = alClient
        Caption = 'Alterar'
        TabOrder = 0
        object bt_campos_clear: TSpeedButton
          Left = 689
          Top = 18
          Width = 23
          Height = 22
          Flat = True
          Glyph.Data = {
            36050000424D3605000000000000360400002800000010000000100000000100
            08000000000000010000EE0E0000EE0E000000010000000100006B6B6B008484
            8400C6C6C600DEDEDE00FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00040404040404
            0404040404040404040404040404040404040404040404040404040404040404
            0404040404040404040404010000000000000104040404040404040002020202
            0202000004040404040404000202020202020001000404040404040100020202
            0202000101000404040404040003030303030300010100040404040404000303
            0303030300010100040404040404000303030303030001010004040404040400
            0303030303030001000404040404040400030303030303000004040404040404
            0400030303030303000404040404040404040100000000010104040404040404
            0404040404040404040404040404040404040404040404040404}
          OnClick = bt_campos_clearClick
        end
        object btSelectAll: TSpeedButton
          Left = 505
          Top = 121
          Width = 23
          Height = 21
          Hint = 'Selecionar todos'
          Flat = True
          Glyph.Data = {
            CE010000424DCE01000000000000CE0000002800000010000000100000000100
            08000000000000010000120B0000120B0000260000002600000000000000FFFF
            FF00FF00FF00A4262600BA414100BB444400BD4A4A00BD4B4B00BF4E4E00C050
            5000C0515100C1535300C1545400C55C5C00CB6C6C00CF777700D17D7D00D483
            8300004B0000098611000C9C19000A8615000C9518000D931A000F9E1C000F99
            1C000E9D1D000F9D1E0011A4220011A02100139224001CB135001CA1340024BC
            430029B548002EC6520035CA5E0039D465000202020202020202020202020202
            0202020202020202020202020202020202020202020202021212020202020202
            0202020202020212181B120202020202020202020202121F1C141D1202020202
            02020202021223211E12171A1202020202020202122425201202121519120202
            02020202021222120A03020212161202020202020203120C080B030202121312
            02020202030F0E0803070903020202121202020310110D030203050803020202
            12120202030E0302020202030603020202020202020302020202020203040302
            0202020202020202020202020202030302020202020202020202020202020203
            030202020202020202020202020202020202}
          ParentShowHint = False
          ShowHint = True
          OnClick = btSelectAllClick
        end
        object btUnSelectAll: TSpeedButton
          Left = 532
          Top = 121
          Width = 23
          Height = 21
          Hint = 'Desfazer sele'#231#227'o'
          Flat = True
          Glyph.Data = {
            AA010000424DAA01000000000000AA0000002800000010000000100000000100
            08000000000000010000120B0000120B00001D0000001D00000000000000FFFF
            FF00FF00FF00CACACA00C4C4C400BFBFBF00BCBCBC00B8B8B800B5B5B500AEAE
            AE00ABABAB00A5A5A500A4A4A4009F9F9F009E9E9E009D9D9D009C9C9C009B9B
            9B009A9A9A009999990098989800979797009494940093939300929292008C8C
            8C008A8A8A007A7A7A0065656500020202020202020202020202020202020202
            02020202020202020202020202020202020202021C1C02020202020202020202
            0202021C12121C02020202020202020202021C0A0E15101C0202020202020202
            021C0508141C16131C020202020202021C04030B1C021C19141C020202020202
            021C081C0F1B02021C171C0202020202021B1C0D110E1B02021C1A1C02020202
            1B0809111B13101B0202021C1C02021B07060C1B021B16111B0202021C1C0202
            1B091B020202021B141B020202020202021B0202020202021B181B0202020202
            020202020202020202021B1B0202020202020202020202020202021B1B020202
            0202020202020202020202020202}
          ParentShowHint = False
          ShowHint = True
          OnClick = btUnSelectAllClick
        end
        object ckcfop: TCheckBox
          Left = 72
          Top = 22
          Width = 49
          Height = 17
          BiDiMode = bdRightToLeft
          Caption = 'CFOP'
          ParentBiDiMode = False
          TabOrder = 0
          OnClick = ckcfopClick
        end
        object edpicms: TEditHw
          Left = 262
          Top = 45
          Width = 67
          Height = 21
          TabOrder = 8
          Text = '            0,00'
          OnChange = edcfopChange
          Formato = fNumber
          FormatSize = '0.2'
        end
        object edpredbc: TEditHw
          Left = 262
          Top = 72
          Width = 67
          Height = 21
          TabOrder = 10
          Text = '            0,00'
          OnChange = edcfopChange
          Formato = fNumber
          FormatSize = '0.2'
        end
        object ckpst: TCheckBox
          Left = 344
          Top = 22
          Width = 78
          Height = 17
          BiDiMode = bdRightToLeft
          Caption = '% ICMS ST'
          ParentBiDiMode = False
          TabOrder = 11
          OnClick = ckcfopClick
        end
        object edpst: TEditHw
          Left = 428
          Top = 20
          Width = 58
          Height = 21
          TabOrder = 12
          Text = '         0,00'
          OnChange = edcfopChange
          Formato = fNumber
          FormatSize = '0.2'
        end
        object edpredbcst: TEditHw
          Left = 428
          Top = 47
          Width = 58
          Height = 21
          TabOrder = 14
          Text = '         0,00'
          OnChange = edcfopChange
          Formato = fNumber
          FormatSize = '0.2'
        end
        object ckpredbcst: TCheckBox
          Left = 328
          Top = 49
          Width = 94
          Height = 17
          BiDiMode = bdRightToLeft
          Caption = '% Red BC ST'
          ParentBiDiMode = False
          TabOrder = 13
          OnClick = ckcfopClick
        end
        object ckmva: TCheckBox
          Left = 344
          Top = 76
          Width = 78
          Height = 17
          BiDiMode = bdRightToLeft
          Caption = 'MVA'
          ParentBiDiMode = False
          TabOrder = 15
          OnClick = ckcfopClick
        end
        object edmva: TEditHw
          Left = 428
          Top = 74
          Width = 58
          Height = 21
          TabOrder = 16
          Text = '         0,00'
          OnChange = edcfopChange
          Formato = fNumber
          FormatSize = '0.2'
        end
        object ckpdif: TCheckBox
          Left = 492
          Top = 22
          Width = 91
          Height = 17
          BiDiMode = bdRightToLeft
          Caption = '% Diferimento'
          ParentBiDiMode = False
          TabOrder = 17
          OnClick = ckcfopClick
        end
        object edpdif: TEditHw
          Left = 589
          Top = 20
          Width = 58
          Height = 21
          TabOrder = 18
          Text = '         0,00'
          OnChange = edcfopChange
          Formato = fNumber
          FormatSize = '0.2'
        end
        object ckpfcp: TCheckBox
          Left = 505
          Top = 49
          Width = 78
          Height = 17
          BiDiMode = bdRightToLeft
          Caption = '% FCP'
          ParentBiDiMode = False
          TabOrder = 19
          OnClick = ckcfopClick
        end
        object edpfcp: TEditHw
          Left = 589
          Top = 47
          Width = 58
          Height = 21
          TabOrder = 20
          Text = '         0,00'
          OnChange = edcfopChange
          Formato = fNumber
          FormatSize = '0.2'
        end
        object ckpfcpst: TCheckBox
          Left = 505
          Top = 76
          Width = 78
          Height = 17
          BiDiMode = bdRightToLeft
          Caption = '% FCP ST'
          ParentBiDiMode = False
          TabOrder = 21
          OnClick = ckcfopClick
        end
        object edpfcpst: TEditHw
          Left = 589
          Top = 74
          Width = 58
          Height = 21
          TabOrder = 22
          Text = '         0,00'
          OnChange = edcfopChange
          Formato = fNumber
          FormatSize = '0.2'
        end
        object ckcst: TCheckBox
          Left = 55
          Top = 49
          Width = 66
          Height = 17
          BiDiMode = bdRightToLeft
          Caption = 'CST ICMS'
          ParentBiDiMode = False
          TabOrder = 1
          OnClick = ckcfopClick
        end
        object ckcsosn: TCheckBox
          Left = 55
          Top = 76
          Width = 66
          Height = 17
          BiDiMode = bdRightToLeft
          Caption = 'CSOSN'
          ParentBiDiMode = False
          TabOrder = 3
          OnClick = ckcfopClick
        end
        object ckpicms: TCheckBox
          Left = 178
          Top = 47
          Width = 78
          Height = 17
          BiDiMode = bdRightToLeft
          Caption = '% ICMS'
          ParentBiDiMode = False
          TabOrder = 7
          OnClick = ckcfopClick
        end
        object ckpredbc: TCheckBox
          Left = 178
          Top = 74
          Width = 78
          Height = 17
          BiDiMode = bdRightToLeft
          Caption = '% Red BC'
          ParentBiDiMode = False
          TabOrder = 9
          OnClick = ckcfopClick
        end
        object ckdeson: TCheckBox
          Left = 27
          Top = 103
          Width = 94
          Height = 17
          BiDiMode = bdRightToLeft
          Caption = 'Desonera'#231#227'o'
          ParentBiDiMode = False
          TabOrder = 5
          OnClick = ckcfopClick
        end
        object ckcalc: TCheckBox
          Left = 192
          Top = 22
          Width = 64
          Height = 17
          BiDiMode = bdRightToLeft
          Caption = 'C'#225'lculo'
          ParentBiDiMode = False
          TabOrder = 23
          OnClick = ckcfopClick
        end
        object edcalc: TComboBox
          Left = 262
          Top = 18
          Width = 69
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          ItemIndex = 0
          TabOrder = 24
          Text = 'Completo'
          OnChange = edcfopChange
          Items.Strings = (
            'Completo'
            'Parcial'
            'Nenhum')
        end
        object eddeson: TComboBox
          Left = 127
          Top = 101
          Width = 359
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          ItemIndex = 0
          TabOrder = 6
          Text = '0 - Sem desonera'#231#227'o'
          OnChange = edcfopChange
          Items.Strings = (
            '0 - Sem desonera'#231#227'o'
            '1 - Taxi'
            '3 - Produtor Agropecu'#225'rio'
            '4 - Frotista/Locadora'
            '5 - Diplom'#225'tico/Consular'
            
              '6 - Utilit'#225'rios e Motocicletas da Amaz'#244'nia Ocidental e '#193'reas de ' +
              'Livre Com'#233'rcio (Resolu'#231#227'o 714/88 e 790/94 '#8211' CONTRAN e suas alter' +
              'a'#231#245'es)'
            '7 - SUFRAMA'
            '8 - Venda a '#211'rg'#227'o P'#250'blico'
            '9 - Outros. (NT 2011/004)'
            '10 - Deficiente Condutor (Conv'#234'nio ICMS 38/12)'
            '11 - Deficiente N'#227'o Condutor (Conv'#234'nio ICMS 38/12)'
            '90 - Solicitado pelo Fisco (NT2016.002)')
        end
        object ckBC: TCheckBox
          Left = 283
          Top = 152
          Width = 147
          Height = 17
          Caption = 'Refazer base de c'#225'lculo'
          TabOrder = 25
        end
        object bt_aplicar: TBitBtn
          Left = 560
          Top = 119
          Width = 87
          Height = 25
          Caption = 'Aplicar'
          TabOrder = 26
          OnClick = bt_aplicarClick
          Glyph.Data = {
            36050000424D3605000000000000360400002800000010000000100000000100
            08000000000000010000D30E0000D30E00000001000000010000008C00000094
            0000009C000000A5000000940800009C100000AD100000AD180000AD210000B5
            210000BD210018B5290000C62900319C310000CE310029AD390031B5420018C6
            420000D6420052A54A0029AD4A0029CE5A006BB5630000FF63008CBD7B00A5C6
            94005AE7A500FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF001B1B1B1B1B13
            04161B1B1B1B1B1B1B1B1B1B1B1B1B0B0A01181B1B1B1B1B1B1B1B1B1B1B160A
            0C030D1B1B1B1B1B1B1B1B1B1B1B050E0C0601191B1B1B1B1B1B1B1B1B130E0C
            170E02001B1B1B1B1B1B1B1B1B0B1517170A0C01181B1B1B1B1B1B1B1B111717
            13130C030D1B1B1B1B1B1B1B1B1B08081B1B070C01191B1B1B1B1B1B1B1B1B1B
            1B1B100C02001B1B1B1B1B1B1B1B1B1B1B1B1B090C01181B1B1B1B1B1B1B1B1B
            1B1B1B130C0F101B1B1B1B1B1B1B1B1B1B1B1B1B141A0F181B1B1B1B1B1B1B1B
            1B1B1B1B1012181B1B1B1B1B1B1B1B1B1B1B1B1B1B191B1B1B1B1B1B1B1B1B1B
            1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B}
        end
        object edcst: TComboBox
          Left = 127
          Top = 47
          Width = 47
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          ItemIndex = 0
          TabOrder = 2
          Text = '00'
          OnChange = edcfopChange
          Items.Strings = (
            '00'
            '10'
            '20'
            '30'
            '40'
            '41'
            '50'
            '51'
            '60'
            '70'
            '90')
        end
        object edcsosn: TComboBox
          Left = 127
          Top = 74
          Width = 47
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          ItemIndex = 0
          TabOrder = 4
          Text = '101'
          OnChange = edcfopChange
          Items.Strings = (
            '101'
            '102'
            '103'
            '201'
            '202'
            '203'
            '300'
            '400'
            '500'
            '900')
        end
        object edcfop: TEditHw
          Left = 127
          Top = 20
          Width = 45
          Height = 21
          TabOrder = 27
          Text = '          0'
          OnChange = edcfopChange
          Formato = fInteger
          FormatSize = '0.2'
        end
        object BitBtn1: TBitBtn
          Left = 505
          Top = 150
          Width = 142
          Height = 25
          Caption = 'Excluir selecionados'
          TabOrder = 28
          OnClick = BitBtn1Click
          Glyph.Data = {
            36050000424D3605000000000000360400002800000010000000100000000100
            08000000000000010000220B0000220B000000010000000100000031DE000031
            E7000031EF000031F700FF00FF000031FF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00040404040404
            0404040404040404000004000004040404040404040404000004040000000404
            0404040404040000040404000000000404040404040000040404040402000000
            0404040400000404040404040404000000040000000404040404040404040400
            0101010004040404040404040404040401010204040404040404040404040400
            0201020304040404040404040404030201040403030404040404040404050203
            0404040405030404040404040303050404040404040303040404040303030404
            0404040404040403040403030304040404040404040404040404030304040404
            0404040404040404040404040404040404040404040404040404}
        end
      end
    end
    object Panel4: TPanel
      Left = 6
      Top = 478
      Width = 729
      Height = 41
      Align = alBottom
      BevelKind = bkTile
      BevelOuter = bvNone
      TabOrder = 3
      object bt_voltar: TBitBtn
        Left = 8
        Top = 6
        Width = 75
        Height = 25
        Caption = 'Voltar'
        ModalResult = 2
        TabOrder = 0
        Glyph.Data = {
          36050000424D3605000000000000360400002800000010000000100000000100
          08000000000000010000D30E0000D30E00000001000000010000AD4A0000B54A
          0000B5520000BD520000BD5A0000C65A0000C6630000CE630000CE6B0000D673
          0000DE730000DE7B0000E77B0000E7840000F7940000CE6B0800FF9C0800A542
          1000AD4A1000B5521000C6631000B55A2100CE732100B55A3100BD633100FFAD
          3100CE7B3900BD6B4200C6734200CE844200CE844A00BD735200BD7B5200C67B
          5200C6845A00C6846300FFBD6300C68C7300CE947B00CE9C8400FF00FF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00282828282828
          2828281F05002828282828282828282828282817050713282828282828282828
          2828282817060715282828282828282828282828281507062328280004040404
          040404232828000701282802090807070707061B28282706062328040B090711
          2727272828282800071328060D070A07232828282828281C070128070E13020B
          082028282828281C0701280F101D28020D0818282828280107132816191E2828
          140D0C03212513060623281A2421282828150C0D0B0908061228282622282828
          282827140808041B282828282828282828282828282828282828282828282828
          2828282828282828282828282828282828282828282828282828}
      end
    end
    object Panel5: TPanel
      Left = 6
      Top = 6
      Width = 729
      Height = 51
      Align = alTop
      BevelOuter = bvNone
      Padding.Bottom = 3
      TabOrder = 0
      object GroupBox2: TGroupBox
        Left = 0
        Top = 0
        Width = 729
        Height = 48
        Align = alClient
        Caption = 'Filtro'
        TabOrder = 0
        object Label1: TLabel
          Left = 15
          Top = 22
          Width = 46
          Height = 13
          Caption = 'Descri'#231#227'o'
        end
        object Label2: TLabel
          Left = 214
          Top = 22
          Width = 27
          Height = 13
          Caption = 'CFOP'
        end
        object Label3: TLabel
          Left = 290
          Top = 22
          Width = 47
          Height = 13
          Caption = 'CST ICMS'
        end
        object Label4: TLabel
          Left = 489
          Top = 22
          Width = 22
          Height = 13
          Caption = 'NCM'
        end
        object Label5: TLabel
          Left = 581
          Top = 22
          Width = 25
          Height = 13
          Caption = 'CEST'
        end
        object Label6: TLabel
          Left = 396
          Top = 22
          Width = 34
          Height = 13
          Caption = 'CSOSN'
        end
        object bt_filter_clear: TSpeedButton
          Left = 689
          Top = 18
          Width = 23
          Height = 22
          Flat = True
          Glyph.Data = {
            36050000424D3605000000000000360400002800000010000000100000000100
            08000000000000010000EE0E0000EE0E000000010000000100006B6B6B008484
            8400C6C6C600DEDEDE00FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00040404040404
            0404040404040404040404040404040404040404040404040404040404040404
            0404040404040404040404010000000000000104040404040404040002020202
            0202000004040404040404000202020202020001000404040404040100020202
            0202000101000404040404040003030303030300010100040404040404000303
            0303030300010100040404040404000303030303030001010004040404040400
            0303030303030001000404040404040400030303030303000004040404040404
            0400030303030303000404040404040404040100000000010104040404040404
            0404040404040404040404040404040404040404040404040404}
          OnClick = bt_filter_clearClick
        end
        object filter_descr: TMaskEdit
          Left = 69
          Top = 19
          Width = 139
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 0
          Text = 'FILTER_DESCR'
          OnChange = filter_descrChange
        end
        object filter_cfop: TMaskEdit
          Left = 247
          Top = 19
          Width = 35
          Height = 21
          MaxLength = 4
          TabOrder = 1
          OnChange = filter_descrChange
        end
        object filter_cst: TMaskEdit
          Left = 343
          Top = 19
          Width = 45
          Height = 21
          MaxLength = 3
          TabOrder = 2
          OnChange = filter_descrChange
        end
        object filter_csosn: TMaskEdit
          Left = 436
          Top = 19
          Width = 47
          Height = 21
          MaxLength = 3
          TabOrder = 3
          Text = 'filter_descr'
          OnChange = filter_descrChange
        end
        object filter_ncm: TMaskEdit
          Left = 517
          Top = 19
          Width = 58
          Height = 21
          MaxLength = 8
          TabOrder = 4
          Text = 'filter_descr'
          OnChange = filter_descrChange
        end
        object filter_cest: TMaskEdit
          Left = 612
          Top = 19
          Width = 53
          Height = 21
          MaxLength = 7
          TabOrder = 5
          Text = 'filter_descr'
          OnChange = filter_descrChange
        end
      end
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 704
    Top = 16
    object Limparfiltros1: TMenuItem
      Caption = 'Limpar filtros'
    end
    object Selecionartodos1: TMenuItem
      Caption = 'Selecionar todos'
    end
  end
end
