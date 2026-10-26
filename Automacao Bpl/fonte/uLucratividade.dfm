inherited frmLucratividade: TfrmLucratividade
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Lucratividade'
  ClientHeight = 597
  ClientWidth = 849
  Position = poMainFormCenter
  OnClose = FormClose
  OnDestroy = FormDestroy
  ExplicitWidth = 855
  ExplicitHeight = 629
  PixelsPerInch = 96
  TextHeight = 13
  object pnFundo: TPanel
    Left = 0
    Top = 0
    Width = 849
    Height = 597
    Align = alClient
    BevelKind = bkTile
    BevelOuter = bvNone
    TabOrder = 0
    object gbItensDaVenda: TGroupBox
      Left = 0
      Top = 0
      Width = 845
      Height = 107
      Align = alTop
      Caption = 'Itens da Venda'
      TabOrder = 0
      object DBGrid1: TDBGrid
        Left = 2
        Top = 15
        Width = 841
        Height = 90
        Align = alTop
        DataSource = dtmMargemProd.dsItensVenda
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        PopupMenu = PopupMenu1
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDrawColumnCell = DBGrid1DrawColumnCell
        OnKeyDown = DBGrid1KeyDown
        OnTitleClick = DBGrid1TitleClick
        Columns = <
          item
            Expanded = False
            FieldName = 'NITEM'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'GRUPO_PROD'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'COD_PROD'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'COD_GRADE'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NUM_FAB_PROD'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCR_PROD_PED'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QUANT_PED_ITEM_CONV'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VLUN_PED_ITEM_CONV'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VLTOT_PED_ITEM'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'UNIDADE_CONV'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RATEIO_DESC'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RATEIO_ACRESC'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PCUST_MC'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'STATUS'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'TIPV'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'CMV'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CF'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CV'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CT'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LUCROLIQ'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MARKUP'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PE'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'UNIDADE'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QUANT_PED_ITEM'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VLUN_PED_ITEM'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FATOR_CONV_TEMP'
            Width = 64
            Visible = True
          end>
      end
    end
    object pnDNA: TPanel
      Left = 0
      Top = 107
      Width = 845
      Height = 54
      Align = alTop
      BevelKind = bkTile
      BevelOuter = bvNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      object sbDNA: TSpeedButton
        Left = 752
        Top = 0
        Width = 50
        Height = 50
        Align = alRight
        Caption = 'DNA'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = sbDNAClick
        ExplicitLeft = 628
        ExplicitTop = 4
      end
      object Label25: TLabel
        Left = 4
        Top = 5
        Width = 35
        Height = 13
        Caption = 'DNA: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label26: TLabel
        Left = 4
        Top = 31
        Width = 107
        Height = 13
        Caption = 'DEPARTAMENTO:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label29: TLabel
        Left = 235
        Top = 30
        Width = 134
        Height = 13
        Caption = 'MES/ANO APURA'#199#195'O:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object SpeedButton1: TSpeedButton
        Left = 802
        Top = 0
        Width = 39
        Height = 50
        Align = alRight
        Caption = 'Sair'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = SpeedButton1Click
        ExplicitLeft = 738
      end
      object edDepartamento: TEdit
        Left = 117
        Top = 30
        Width = 112
        Height = 13
        BorderStyle = bsNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        Text = 'PRODUTOS'
      end
      object edAnoMesApuracao: TEdit
        Left = 375
        Top = 30
        Width = 51
        Height = 13
        BorderStyle = bsNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        Text = '99/9999'
      end
      object edDNA: TEdit
        Left = 45
        Top = 5
        Width = 324
        Height = 13
        BorderStyle = bsNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
        Text = 'DNA'
      end
      object rgTipoLucratividade: TRadioGroup
        Left = 599
        Top = 0
        Width = 153
        Height = 50
        Align = alRight
        Caption = 'Tipo de Lucratividade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemIndex = 0
        Items.Strings = (
          'Total por Item'
          'Unit'#225'ria por Item')
        ParentFont = False
        TabOrder = 3
        OnClick = rgTipoLucratividadeClick
      end
    end
    object gbLucratividadeVenda: TGroupBox
      Left = 0
      Top = 161
      Width = 418
      Height = 432
      Align = alLeft
      Caption = 'Lucratividade da Venda'
      TabOrder = 3
      object Label1: TLabel
        Left = 59
        Top = 20
        Width = 84
        Height = 13
        Caption = 'N'#186' do Pedido: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 95
        Top = 43
        Width = 48
        Height = 13
        Caption = 'Cliente: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 80
        Top = 67
        Width = 63
        Height = 13
        Caption = 'Vendedor: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 71
        Top = 135
        Width = 72
        Height = 13
        Caption = 'Valor Bruto: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 56
        Top = 159
        Width = 87
        Height = 13
        Caption = 'Valor Liquido:  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label12: TLabel
        Left = 92
        Top = 112
        Width = 51
        Height = 13
        Caption = 'Markup: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label13: TLabel
        Left = 27
        Top = 89
        Width = 116
        Height = 13
        Caption = 'Ponto de Equilibrio: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 266
        Top = 20
        Width = 92
        Height = 13
        Caption = 'Tipo de Venda: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object gbLucratividadeVendaDescAcresc: TGroupBox
        Left = 261
        Top = 83
        Width = 153
        Height = 110
        Align = alCustom
        Anchors = [akRight, akBottom]
        TabOrder = 0
        object Label27: TLabel
          Left = 9
          Top = 15
          Width = 63
          Height = 13
          Caption = 'Desconto: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label28: TLabel
          Left = 3
          Top = 42
          Width = 67
          Height = 13
          Caption = 'Acrescimo: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object ehAcrescimo: TEditHw
          Left = 76
          Top = 39
          Width = 73
          Height = 21
          TabOrder = 1
          Text = '                                   0'
          Formato = fMoney
          FormatSize = '10.2'
        end
        object btSimular: TBitBtn
          Left = 17
          Top = 66
          Width = 121
          Height = 33
          Caption = 'Simular'
          Default = True
          Enabled = False
          TabOrder = 2
          OnClick = btSimularClick
          Glyph.Data = {
            F6060000424DF606000000000000360000002800000018000000180000000100
            180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FF92635D8E5D598E5D598E5D598E5D598E5D598E5D598E5D59
            8E5D598E5D598E5D598E5D598E5D598E5D598E5D598E5D598E5D598E5D598050
            4BFF00FFFF00FFFF00FFFF00FFFF00FF93655EEFD3B4F6DAB6F3D5ADF2D1A5F0
            CE9EEFCB97EFC791EEC589EBC182EBC080EBC080EBC080EBC080EBC080EBC080
            EDC180EABF7F80504BFF00FFFF00FFFF00FFFF00FFFF00FF93655FEED4B8F4DA
            BBF2D5B1F0D1AAEFCFA3EECB9DEDC796EDC58FEBC188EABF82E9BD7FE9BD7FE9
            BD7FE9BD7FE9BD7FEABF7FE7BC7E80504BFF00FFFF00FFFF00FFFF00FFFF00FF
            93655FEED7C0F6E0C1F2D9B8F2D4B1F0D1AAEFCFA4EECB9DEDC796EDC58FEBC1
            89EABF82E9BD7FE9BD7FE9BD7FE9BD7FEABF7FE7BC7E80504BFF00FFFF00FFFF
            00FFFF00FFFF00FF93655FEFDAC5F7E2C7F3DCBFF2D8B7007000F0D1AAEFCEA3
            B1B874007000007000007000ADAD60E9BD7FE9BD7FE9BD7FEABF7FE7BC7E8050
            4BFF00FFFF00FFFF00FFFF00FFFF00FF936560F0DECCF8E6CFF6E0C6F3DCBD00
            7000047503B2BD7F007000B1B874EDC796B0B46B007000ADAF62E9BD7FE9BD7F
            EABF7FE7BC7E80504BFF00FFFF00FFFF00FFFF00FFFF00FF956660F2E2D3FAEA
            D7F6E3CEF4DEC5007000007000007000B2BD7FEFCEA3EECB9DEDC797B0B46B00
            7000E9BD81E9BD7FEABF7FE7BC7E80504BFF00FFFF00FFFF00FFFF00FFFF00FF
            986963F2E6DAFAEEDEF7E7D4F6E2CB007000007000007000007000F0D1A9EFCE
            A3EECB9DEDC796007000EBC189E9BD81EABF7FE7BC7E80504BFF00FFFF00FFFF
            00FFFF00FFFF00FF9E6E64F4EAE1FBF2E6F8EADCF7E6D3007000007000007000
            007000007000F0D1AAEFCEA4EDCB9CEDC796EBC58FEBC188EABF82E7BB7E8050
            4BFF00FFFF00FFFF00FFFF00FFFF00FFA37266F6EEE9FCF6EDF8EFE3F7EADAF7
            E6D3F6E2CCF4DEC5F3DCBDF2D8B6F0D5B0F0D1AAEFCEA3EECA9CEDC795EBC48E
            EBC288E7BC8080504BFF00FFFF00FFFF00FFFF00FFFF00FFA77568F8F3F0FEFB
            F6FBF3EBF8EEE3F8EBDCF7E7D3F6E2CCF4E0C500700000700000700000700000
            7000EDCB9CEDC795EDC58FE9BF8780504BFF00FFFF00FFFF00FFFF00FFFF00FF
            AC7969FAF6F4FFFFFEFEF8F3FBF2EA007000F8EBDAF7E6D3F7E2CCF6E0C50070
            00007000007000007000EFCEA3EECB9CEEC996EAC18E80504BFF00FFFF00FFFF
            00FFFF00FFFF00FFB17E6BFAF6F4FFFFFFFFFEFBFEF7F0007000BAD4AAF8EADA
            F7E7D3F6E2CBB7C792007000007000007000F0D1A9EFCEA1EECB9CEBC5928050
            4BFF00FFFF00FFFF00FFFF00FFFF00FFB6816CFAF6F4FFFFFFFFFFFFFFFCFBBC
            DAB4007000B8D3AAF8EBDCB7CC9D007000B7C792047503007000F2D4AFF0D1A9
            F0CFA3EDC99980504BFF00FFFF00FFFF00FFFF00FFFF00FFBB846EFAF6F4FFFF
            FFFFFFFFFFFFFFFFFEFBBCDAB4007000007000007000B7CC9DF6E2CBF6DEC400
            7000F2D8B6F0D4AFEFD0A7CEB49180504BFF00FFFF00FFFF00FFFF00FFFF00FF
            C0896FFBF7F4FFFFFFFFFFFFFFFFFFFFFFFFFFFEFBFEF7F2FBF2EAFAEEE2F8EB
            DAF7E6D3F6E2CBF6DEC4F3DCBDE5CEAFC4B096A1927F80504BFF00FFFF00FFFF
            00FFFF00FFFF00FFC58C70FBF7F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFB
            FCF8F2FBF3EAF8EEE2F8EAD9F8E7D4FAE9D0E0D0BAB8AB9AA79C8BA497868050
            4BFF00FFFF00FFFF00FFFF00FFFF00FFCB9173FBF7F4FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFEFBFCF7F0FBF2E9FBF2E5E9D3C4A0675BA0675BA0675B
            A0675BA0675BA0675BFF00FFFF00FFFF00FFFF00FFFF00FFCF9674FBF7F6FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFAFCF7F0FFFAEFDAC0B6A0
            675BDAA16BDD984FE2903AEA8923A5686BFF00FFFF00FFFF00FFFF00FFFF00FF
            D49875FCF8F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC
            FBFFFEF7DDC4BCA0675BEAB474EFA952F6A036A5686BFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFD49875FCF8F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFDDC7C2A0675BEAB273EFA751A5686BFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFD49875FFFEFEFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2D0CEA0675BEDB572A5686B
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCF8E68CF8E68CF8E
            68CF8E68CF8E68CF8E68CF8E68CF8E68CF8E68CF8E68CF8E68CF8E68CF8E68A0
            675BA5686BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        end
        object ehDesconto: TEditHw
          Left = 77
          Top = 12
          Width = 73
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          Text = '                                   0'
          Formato = fMoney
          FormatSize = '10.2'
        end
      end
      object DBEdit20: TDBEdit
        Left = 150
        Top = 17
        Width = 46
        Height = 21
        DataField = 'NPED'
        DataSource = dtmMargemProd.dsVenda
        ReadOnly = True
        TabOrder = 1
      end
      object DBEdit21: TDBEdit
        Left = 364
        Top = 17
        Width = 46
        Height = 21
        DataField = 'TIPV'
        DataSource = dtmMargemProd.dsVenda
        ReadOnly = True
        TabOrder = 2
      end
      object DBEdit22: TDBEdit
        Left = 149
        Top = 40
        Width = 261
        Height = 21
        DataField = 'NOME_CLIENTE'
        DataSource = dtmMargemProd.dsVenda
        ReadOnly = True
        TabOrder = 3
      end
      object DBEdit23: TDBEdit
        Left = 149
        Top = 62
        Width = 262
        Height = 21
        DataField = 'NOME_VENDEDOR'
        DataSource = dtmMargemProd.dsVenda
        ReadOnly = True
        TabOrder = 4
      end
      object DBEdit24: TDBEdit
        Left = 149
        Top = 86
        Width = 100
        Height = 21
        DataField = 'PE'
        DataSource = dtmMargemProd.dsVenda
        ReadOnly = True
        TabOrder = 5
      end
      object DBEdit25: TDBEdit
        Left = 149
        Top = 109
        Width = 100
        Height = 21
        DataField = 'MARKUP'
        DataSource = dtmMargemProd.dsVenda
        ReadOnly = True
        TabOrder = 6
      end
      object DBEdit26: TDBEdit
        Left = 149
        Top = 132
        Width = 100
        Height = 21
        DataField = 'TOT_PROD'
        DataSource = dtmMargemProd.dsVenda
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 7
      end
      object DBEdit27: TDBEdit
        Left = 149
        Top = 156
        Width = 100
        Height = 21
        DataField = 'VALOR_TOTAL'
        DataSource = dtmMargemProd.dsVenda
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 8
      end
      object gbLucratividadeVendaCustos: TGroupBox
        Left = 4
        Top = 196
        Width = 410
        Height = 105
        TabOrder = 9
        object Label7: TLabel
          Left = 12
          Top = 13
          Width = 127
          Height = 13
          Caption = 'Custo Merc. Vendida: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label8: TLabel
          Left = 59
          Top = 36
          Width = 80
          Height = 13
          Caption = 'Custos Fixos: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label9: TLabel
          Left = 36
          Top = 59
          Width = 103
          Height = 13
          Caption = 'Custos Vari'#225'veis: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label10: TLabel
          Left = 53
          Top = 82
          Width = 86
          Height = 13
          Caption = 'Custos Totais: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label11: TLabel
          Left = 311
          Top = 13
          Width = 10
          Height = 13
          Caption = '%'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label20: TLabel
          Left = 311
          Top = 36
          Width = 10
          Height = 13
          Caption = '%'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label21: TLabel
          Left = 311
          Top = 59
          Width = 10
          Height = 13
          Caption = '%'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label22: TLabel
          Left = 311
          Top = 82
          Width = 10
          Height = 13
          Caption = '%'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBEdit28: TDBEdit
          Left = 145
          Top = 10
          Width = 100
          Height = 21
          DataField = 'CMV'
          DataSource = dtmMargemProd.dsVenda
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
        object DBEdit29: TDBEdit
          Left = 145
          Top = 33
          Width = 100
          Height = 21
          DataField = 'CF'
          DataSource = dtmMargemProd.dsVenda
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
        end
        object DBEdit30: TDBEdit
          Left = 145
          Top = 79
          Width = 100
          Height = 21
          DataField = 'CT'
          DataSource = dtmMargemProd.dsVenda
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 6
        end
        object DBEdit31: TDBEdit
          Left = 145
          Top = 56
          Width = 100
          Height = 21
          DataField = 'CV'
          DataSource = dtmMargemProd.dsVenda
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 4
        end
        object DBEdit32: TDBEdit
          Left = 252
          Top = 10
          Width = 53
          Height = 21
          DataField = 'CMVPERC'
          DataSource = dtmMargemProd.dsVenda
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
        object DBEdit33: TDBEdit
          Left = 252
          Top = 33
          Width = 53
          Height = 21
          DataField = 'CFPERC'
          DataSource = dtmMargemProd.dsVenda
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
        end
        object DBEdit34: TDBEdit
          Left = 252
          Top = 56
          Width = 53
          Height = 21
          DataField = 'CVPERC'
          DataSource = dtmMargemProd.dsVenda
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 5
        end
        object DBEdit35: TDBEdit
          Left = 252
          Top = 79
          Width = 53
          Height = 21
          DataField = 'CTPERC'
          DataSource = dtmMargemProd.dsVenda
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 7
        end
      end
      object gbLucratividadeVendaLucro: TGroupBox
        Left = 4
        Top = 300
        Width = 410
        Height = 129
        TabOrder = 10
        object Label23: TLabel
          Left = 53
          Top = 14
          Width = 86
          Height = 13
          Caption = 'Lucro Liquido: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label24: TLabel
          Left = 311
          Top = 14
          Width = 10
          Height = 13
          Caption = '%'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label61: TLabel
          Left = 101
          Top = 37
          Width = 38
          Height = 13
          Alignment = taRightJustify
          Caption = 'IRRF: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label62: TLabel
          Left = 45
          Top = 60
          Width = 94
          Height = 13
          Alignment = taRightJustify
          Caption = 'Adicional IRRF: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label63: TLabel
          Left = 311
          Top = 37
          Width = 10
          Height = 13
          Caption = '%'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label64: TLabel
          Left = 311
          Top = 60
          Width = 10
          Height = 13
          Caption = '%'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label65: TLabel
          Left = 1
          Top = 107
          Width = 138
          Height = 13
          Alignment = taRightJustify
          Caption = 'Lucro Liq Depois IRRF: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label66: TLabel
          Left = 311
          Top = 107
          Width = 10
          Height = 13
          Caption = '%'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object imgInformation: TImage
          Left = 327
          Top = 56
          Width = 24
          Height = 27
          Cursor = crHelp
          Hint = 
            'O valor do Adicional do Imposto de Renda pago em Rela'#231#227'o ao valo' +
            'r do Imposto de Renda'
          ParentShowHint = False
          Picture.Data = {
            055449636F6E0000010001001818000001002000880900001600000028000000
            1800000030000000010020000000000060090000000000000000000000000000
            00000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00
            FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00
            FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00
            FFFFFF00FFFFFF00030100000100000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000021
            0000002700000000000000000000000000000000000000000000000000000000
            FFFFFF00FFFFFF00030100000100000000000000000000000000000000000000
            00000000000000000000000000000000000000000000000000000023170B0088
            27150286060400080E0700000F0800000F0800000F0800000F0800000F080000
            FFFFFF00FFFFFF00030100000100000000000000000000000000000000000000
            000000000000000000000000000000000000000604000050492A0CC3BE9263FF
            B4895BEE5D2F0033492702004122010041220100412201004222010042220100
            FFFFFF00FFFFFF00030100000100000000000000000000000000000000000000
            0000000400000022000000450200005F1F0C0097774F26EBE0B98EFFFFECCBFF
            C29667E0502700210A0600000000000000000000000000000000000000000000
            FFFFFF00FFFFFF0003010000010000000000000000000000000000000000002A
            150800844B2B0ACB805931ED9B754DF7BF986DFFEFCEA7FFFFE9CBFFFFE5C2FF
            996F44E20000003A000000000000000000000000020100000301000003010000
            FFFFFF00FFFFFF00030100000100000000000000000000040700005A573715CF
            BC9468FFF5D8B7FFFFE7C8FFFFE8C8FFFFECCEFFFFEED2FFFFECCEFFFFE5C5FF
            C8A176FF5E3D1BD70E0300730000000F00000000020100000301000003010000
            FFFFFF00FFFFFF0003010000000000000000000D1A0A007F8A6337EFEFD1AFFF
            FFF1DAFFFFEAD0FFFFE8CDFFFFE9CFFFF2D2B6FFBF7855FFE0B293FFFFEACEFF
            FFEDD1FFF7D8B4FFAB8255FA2D17019F0000001B010000000301000003010000
            FFFFFF00FFFFFF00010000000000000425100086A07446FCFBE2C6FFFFF4DFFF
            FFEAD3FFFFEAD2FFFFEAD1FFFFEED6FFDDB296FF962300FF9A3109FFDDAF91FF
            FFEDD2FFFFEBD0FFFFEED0FFCEA67AFF3B2004A5000000110201000003010000
            FFFFFF00FFFFFF00000000031508004F956636F9ECD3B5FFFFF5E3FFFFEDD9FF
            FFECD8FFFFECD7FFFFEBD6FFFFEFD9FFE8C7AEFF992B00FFA64C26FFA6502CFF
            E9C5AAFFFFECD3FFFFEAD1FFFFF2D8FFCBA479FF291302800000000003010000
            FFFFFF00FFFFFF0017090031623B11BBCEAB84FFF6E5D2FFFFF2E2FFFFEFDEFF
            FFEFDCFFFFEEDCFFFFEEDBFFFFEFDCFFF7E1CDFF9F370AFFC5805AFFD6AB92FF
            E6C5ACFFFFEED7FFFFEAD2FFFFEBD4FFFFEED5FFA0784DF00D05003600000000
            FFFFFF00FFFFFF0046270772936A3FE9D7B998FFFEF1E3FFFFF3E4FFFFF2E3FF
            FFF1E2FFFFF1E0FFFFF1E0FFFFF1E0FFFDEDDCFFC06F3FFFC97B49FFF9E5D2FF
            FFF8E5FFFFECD9FFFFEDD7FFFFECD6FFFFF0DBFFF2D7B9FF4E2D0B9C0A00001A
            FFFFFF00FFFFFF00673C0E98A88157F6D8BD9EFFFFF6EBFFFFF5E9FFFFF4E7FF
            FFF3E6FFFFF3E5FFFFF2E4FFFFF5E6FFFCF1E5FFD9A079FFD88543FFF4DAC4FF
            FFF5E6FFFFEFDFFFFFEFDDFFFFEEDCFFFFEEDCFFFFF3DDFF99754EDA321B0454
            FFFFFF00FFFFFF007946109EB1895EF8D9BD9EFFFCF3E8FFFFF7EEFFFFF6ECFF
            FFF6ECFFFFF5EAFFFFF8EDFFF6E7D9FFC58C72FFD5A587FFD47B32FFEFD0B5FF
            FFF6EBFFFFF2E3FFFFF1E2FFFFF1E1FFFFF1E1FFFFF7E6FFC4A98CF1613C148C
            FFFFFF00FFFFFF007D480E87AE8456EFD6B997FFF4E8DBFFFFFCF6FFFFF8F0FF
            FFF8EFFFFFF8EFFFFFF9F0FFFAF5ECFFBD7D62FFA84E22FFC15F1EFFDAA889FF
            FEF5ECFFFFF5E9FFFFF4E7FFFFF4E6FFFFF3E6FFFFFBEFFFDCC5ACFA855422A2
            FFFFFF00FFFFFF00743E05479A6934D5D5B38EFFEAD8C3FFFFFEFAFFFFFAF5FF
            FFFAF3FFFFF9F4FFFFF9F2FFFFFCF5FFFAF3ECFFBC7B5EFFA73D08FFC07D5CFF
            FEF7EEFFFFF7EEFFFFF6ECFFFFF6ECFFFFF5EBFFFFFDF4FFDAC4ACF78554229B
            FFFFFF00FFFFFF006B34000E82490C89CDA87FFFE2C6A7FFFAF2EAFFFFFEFBFF
            FFFCF8FFFFFBF7FFFFFBF7FFFFFAF6FFFFFFFAFFFDF9F3FFDAB6A8FFE6CCC1FF
            FFFAF5FFFFFAF3FFFFF8F0FFFFF8F1FFFFF8F0FFFFFCF5FFC7A98CEA82501B79
            FFFFFF00FFFFFF007C4203007D410017A26F39E2E3C4A1FFEFDAC0FFFEFCF9FF
            FFFEFDFFFFFDFAFFFFFDFAFFFFFCF9FFFFFBF8FFFFFFFFFFF1E1DBFFD6AFA0FF
            FCF6F0FFFFFCF7FFFFFBF5FFFFFAF4FFFFFBF6FFFEF9F3FF9E6F3EC47D430731
            FFFFFF00FFFFFF0083470500814503008345054AB78A59F6F0D3B1FFF7E5CFFF
            FEFDFBFFFFFFFFFFFFFEFCFFFFFEFCFFFFFDFCFFFFFFFFFFCA9680FFB44B0AFF
            E0C0AFFFFFFFFFFFFFFCF9FFFFFDFAFFFFFFFFFFD0B89DFF84480A527E430404
            FFFFFF00FFFFFF00824605008246050084470700874B0C5DB98C5BF3F4D7B4FF
            FDE9D0FFFFF9F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9D5CDFFD0936EFF
            EAD5CAFFFFFFFFFFFFFFFFFFFFFFFFFFDBC9B4FF8D551B8B83480900874D0E00
            FFFFFF00FFFFFF008246050082460500854909008549090083460543A47139D1
            E2BE95FFFDE5C7FFFFF3E2FFFFFFFDFFFFFFFFFFFFFFFFFFFFFFFFFFFDFEFFFF
            FFFFFFFFFFFEFEFFF4EFE9FFBF9F7EF48A51157A85490C04864D0F00864C0E00
            FFFFFF00FFFFFF00824605008246050085490900864B0B00864A09008042010D
            894E0F77A9763ECFCFA679EEDFBC96FFE1C4A5FFE1CBB3FFE0CCB7FFDAC6B1F7
            C7AB8FE5AD855BD08D571C958347082D84490A00894F1400864C0E00864C0E00
            FFFFFF00FFFFFF00824605008246050085490900864B0B00874B0B0083460600
            8346060C864A0A3E8E531486996126B7A57139D0A3713BCF99652DBA915A209A
            8C551971864B0D3E7F42001484480900874D0F00894F1300864C0E00864C0E00
            FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00
            FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00
            FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00
            FFFFFF00FFFFFF00FFFCFF00FFF87F00FFE07F00FE007F00FC007F00F0001F00
            E0000F00C0000700800007008000030080000100800001008000010080000100
            8000010080000100C0000100E0000100F0000700F8000700FC001F00FE003F00
            FFFFFF00}
          ShowHint = True
          OnClick = imgInformationClick
        end
        object Label67: TLabel
          Left = 100
          Top = 83
          Width = 39
          Height = 13
          Alignment = taRightJustify
          Caption = 'CSLL: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label68: TLabel
          Left = 311
          Top = 83
          Width = 10
          Height = 13
          Caption = '%'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBEdit36: TDBEdit
          Left = 145
          Top = 11
          Width = 100
          Height = 21
          DataField = 'LUCROLIQ'
          DataSource = dtmMargemProd.dsVenda
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 16744448
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
        object DBEdit37: TDBEdit
          Left = 252
          Top = 11
          Width = 53
          Height = 21
          DataField = 'LUCROLIQPERC'
          DataSource = dtmMargemProd.dsVenda
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 16744448
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
        object DBEdit69: TDBEdit
          Left = 145
          Top = 34
          Width = 100
          Height = 21
          DataField = 'IRRF'
          DataSource = dtmMargemProd.dsVenda
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
        end
        object DBEdit70: TDBEdit
          Left = 145
          Top = 57
          Width = 100
          Height = 21
          DataField = 'ADIRRF'
          DataSource = dtmMargemProd.dsVenda
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
        end
        object DBEdit71: TDBEdit
          Left = 252
          Top = 34
          Width = 53
          Height = 21
          DataField = 'IRRF_PERC'
          DataSource = dtmMargemProd.dsVenda
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 4
        end
        object DBEdit72: TDBEdit
          Left = 252
          Top = 54
          Width = 53
          Height = 21
          DataField = 'ADIRRF_PERC'
          DataSource = dtmMargemProd.dsVenda
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 5
        end
        object DBEdit73: TDBEdit
          Left = 145
          Top = 104
          Width = 100
          Height = 21
          DataField = 'LUCRORETIDO'
          DataSource = dtmMargemProd.dsVenda
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 16744448
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 6
        end
        object DBEdit74: TDBEdit
          Left = 252
          Top = 102
          Width = 53
          Height = 21
          DataField = 'LUCRORETIDO_PERC'
          DataSource = dtmMargemProd.dsVenda
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 16744448
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 7
        end
        object DBEdit75: TDBEdit
          Left = 145
          Top = 80
          Width = 100
          Height = 21
          DataField = 'CSLL'
          DataSource = dtmMargemProd.dsVenda
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 8
        end
        object DBEdit76: TDBEdit
          Left = 252
          Top = 80
          Width = 53
          Height = 21
          DataField = 'CSLL_PERC'
          DataSource = dtmMargemProd.dsVenda
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 9
        end
      end
    end
    object gbLucratividadeTotal: TGroupBox
      Left = 424
      Top = 161
      Width = 418
      Height = 435
      Align = alCustom
      Caption = 'Lucratividade do Item(Total por Item)'
      TabOrder = 4
      object Label30: TLabel
        Left = 92
        Top = 20
        Width = 51
        Height = 13
        Caption = 'N'#186' Item: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label31: TLabel
        Left = 204
        Top = 20
        Width = 67
        Height = 13
        Caption = 'Num. Fab.: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label32: TLabel
        Left = 77
        Top = 43
        Width = 66
        Height = 13
        Caption = 'Descri'#231#227'o: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label33: TLabel
        Left = 71
        Top = 112
        Width = 72
        Height = 13
        Caption = 'Valor Bruto: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label34: TLabel
        Left = 80
        Top = 135
        Width = 63
        Height = 13
        Caption = 'Desconto: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label35: TLabel
        Left = 76
        Top = 157
        Width = 67
        Height = 13
        Caption = 'Acrescimo: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label36: TLabel
        Left = 92
        Top = 89
        Width = 51
        Height = 13
        Caption = 'Markup: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label37: TLabel
        Left = 27
        Top = 66
        Width = 116
        Height = 13
        Caption = 'Ponto de Equilibrio: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label38: TLabel
        Left = 58
        Top = 180
        Width = 85
        Height = 13
        Caption = 'Valor Liqu'#237'do: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBEdit38: TDBEdit
        Left = 149
        Top = 17
        Width = 46
        Height = 21
        DataField = 'NITEM'
        DataSource = dtmMargemProd.dsItensVenda
        ReadOnly = True
        TabOrder = 0
      end
      object DBEdit39: TDBEdit
        Left = 277
        Top = 17
        Width = 133
        Height = 21
        DataField = 'NUM_FAB_PROD'
        DataSource = dtmMargemProd.dsItensVenda
        ReadOnly = True
        TabOrder = 1
      end
      object DBEdit40: TDBEdit
        Left = 149
        Top = 40
        Width = 261
        Height = 21
        DataField = 'DESCR_PROD_PED'
        DataSource = dtmMargemProd.dsItensVenda
        ReadOnly = True
        TabOrder = 2
      end
      object gbLucratividadeTotalCustos: TGroupBox
        Left = 4
        Top = 196
        Width = 410
        Height = 105
        TabOrder = 9
        object Label39: TLabel
          Left = 12
          Top = 13
          Width = 127
          Height = 13
          Caption = 'Custo Merc. Vendida: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label40: TLabel
          Left = 59
          Top = 36
          Width = 80
          Height = 13
          Caption = 'Custos Fixos: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label41: TLabel
          Left = 36
          Top = 59
          Width = 103
          Height = 13
          Caption = 'Custos Vari'#225'veis: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label42: TLabel
          Left = 53
          Top = 82
          Width = 86
          Height = 13
          Caption = 'Custos Totais: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label43: TLabel
          Left = 311
          Top = 13
          Width = 10
          Height = 13
          Caption = '%'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label44: TLabel
          Left = 311
          Top = 36
          Width = 10
          Height = 13
          Caption = '%'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label45: TLabel
          Left = 311
          Top = 59
          Width = 10
          Height = 13
          Caption = '%'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label46: TLabel
          Left = 311
          Top = 82
          Width = 10
          Height = 13
          Caption = '%'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBEdit45: TDBEdit
          Left = 252
          Top = 56
          Width = 53
          Height = 21
          DataField = 'CVPERC'
          DataSource = dtmMargemProd.dsItensVenda
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 5
        end
        object DBEdit48: TDBEdit
          Left = 145
          Top = 10
          Width = 100
          Height = 21
          DataField = 'CMV_TOTAL'
          DataSource = dtmMargemProd.dsItensVenda
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
        object DBEdit49: TDBEdit
          Left = 252
          Top = 10
          Width = 53
          Height = 21
          DataField = 'CMVPERC_TOTAL'
          DataSource = dtmMargemProd.dsItensVenda
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
        object DBEdit50: TDBEdit
          Left = 145
          Top = 33
          Width = 100
          Height = 21
          DataField = 'CF_TOTAL'
          DataSource = dtmMargemProd.dsItensVenda
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
        end
        object DBEdit51: TDBEdit
          Left = 252
          Top = 33
          Width = 53
          Height = 21
          DataField = 'CFPERC_TOTAL'
          DataSource = dtmMargemProd.dsItensVenda
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
        end
        object DBEdit52: TDBEdit
          Left = 145
          Top = 56
          Width = 100
          Height = 21
          DataField = 'CV_TOTAL'
          DataSource = dtmMargemProd.dsItensVenda
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 4
        end
        object DBEdit53: TDBEdit
          Left = 145
          Top = 79
          Width = 100
          Height = 21
          DataField = 'CT_TOTAL'
          DataSource = dtmMargemProd.dsItensVenda
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 6
        end
        object DBEdit54: TDBEdit
          Left = 252
          Top = 79
          Width = 53
          Height = 21
          DataField = 'CTPERC_TOTAL'
          DataSource = dtmMargemProd.dsItensVenda
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 7
        end
      end
      object gbLucratividadeTotalLucro: TGroupBox
        Left = 4
        Top = 300
        Width = 410
        Height = 129
        TabOrder = 10
        object Label47: TLabel
          Left = 53
          Top = 14
          Width = 86
          Height = 13
          Caption = 'Lucro Liquido: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label48: TLabel
          Left = 311
          Top = 14
          Width = 10
          Height = 13
          Caption = '%'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label55: TLabel
          Left = 101
          Top = 37
          Width = 38
          Height = 13
          Alignment = taRightJustify
          Caption = 'IRRF: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label56: TLabel
          Left = 45
          Top = 60
          Width = 94
          Height = 13
          Alignment = taRightJustify
          Caption = 'Adicional IRRF: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label57: TLabel
          Left = 311
          Top = 37
          Width = 10
          Height = 13
          Caption = '%'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label58: TLabel
          Left = 311
          Top = 60
          Width = 10
          Height = 13
          Caption = '%'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label59: TLabel
          Left = 1
          Top = 107
          Width = 138
          Height = 13
          Alignment = taRightJustify
          Caption = 'Lucro Liq Depois IRRF: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label60: TLabel
          Left = 311
          Top = 107
          Width = 10
          Height = 13
          Caption = '%'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label71: TLabel
          Left = 100
          Top = 83
          Width = 39
          Height = 13
          Alignment = taRightJustify
          Caption = 'CSLL: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label72: TLabel
          Left = 311
          Top = 83
          Width = 10
          Height = 13
          Caption = '%'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBEdit55: TDBEdit
          Left = 145
          Top = 11
          Width = 100
          Height = 21
          DataField = 'LUCROLIQ_TOTAL'
          DataSource = dtmMargemProd.dsItensVenda
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 16744448
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
        object DBEdit56: TDBEdit
          Left = 252
          Top = 11
          Width = 53
          Height = 21
          DataField = 'LUCROLIQPERC_TOTAL'
          DataSource = dtmMargemProd.dsItensVenda
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 16744448
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
        object DBEdit63: TDBEdit
          Left = 145
          Top = 34
          Width = 100
          Height = 21
          DataField = 'IRRF_TOTAL'
          DataSource = dtmMargemProd.dsItensVenda
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
        end
        object DBEdit64: TDBEdit
          Left = 145
          Top = 57
          Width = 100
          Height = 21
          DataField = 'ADIRRF_TOTAL'
          DataSource = dtmMargemProd.dsItensVenda
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
        end
        object DBEdit65: TDBEdit
          Left = 252
          Top = 34
          Width = 53
          Height = 21
          DataField = 'IRRF_PERC'
          DataSource = dtmMargemProd.dsItensVenda
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 4
        end
        object DBEdit66: TDBEdit
          Left = 252
          Top = 57
          Width = 53
          Height = 21
          DataField = 'ADIRRF_PERC'
          DataSource = dtmMargemProd.dsItensVenda
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 5
        end
        object DBEdit67: TDBEdit
          Left = 145
          Top = 104
          Width = 100
          Height = 21
          DataField = 'LUCRORETIDO_TOTAL'
          DataSource = dtmMargemProd.dsItensVenda
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 16744448
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 6
        end
        object DBEdit68: TDBEdit
          Left = 252
          Top = 104
          Width = 53
          Height = 21
          DataField = 'LUCRORETIDO_PERC'
          DataSource = dtmMargemProd.dsItensVenda
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 16744448
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 7
        end
        object DBEdit79: TDBEdit
          Left = 145
          Top = 80
          Width = 100
          Height = 21
          DataField = 'CSLL_TOTAL'
          DataSource = dtmMargemProd.dsItensVenda
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 8
        end
        object DBEdit80: TDBEdit
          Left = 252
          Top = 80
          Width = 53
          Height = 21
          DataField = 'CSLL_PERC'
          DataSource = dtmMargemProd.dsItensVenda
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 9
        end
      end
      object DBEdit41: TDBEdit
        Left = 149
        Top = 86
        Width = 100
        Height = 21
        DataField = 'MARKUP'
        DataSource = dtmMargemProd.dsItensVenda
        ReadOnly = True
        TabOrder = 4
      end
      object DBEdit42: TDBEdit
        Left = 149
        Top = 132
        Width = 100
        Height = 21
        DataField = 'RATEIO_DESC'
        DataSource = dtmMargemProd.dsItensVenda
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 6
      end
      object DBEdit43: TDBEdit
        Left = 149
        Top = 154
        Width = 100
        Height = 21
        DataField = 'RATEIO_ACRESC'
        DataSource = dtmMargemProd.dsItensVenda
        ReadOnly = True
        TabOrder = 7
      end
      object DBEdit44: TDBEdit
        Left = 149
        Top = 63
        Width = 100
        Height = 21
        DataField = 'PE_TOTAL'
        DataSource = dtmMargemProd.dsItensVenda
        ReadOnly = True
        TabOrder = 3
      end
      object DBEdit46: TDBEdit
        Left = 149
        Top = 109
        Width = 100
        Height = 21
        DataField = 'VLUN_PED_ITEM_TOTAL'
        DataSource = dtmMargemProd.dsItensVenda
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 5
      end
      object DBEdit47: TDBEdit
        Left = 149
        Top = 177
        Width = 100
        Height = 21
        DataField = 'VLUN_LIQUIDO_TOTAL'
        DataSource = dtmMargemProd.dsItensVenda
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 8
      end
    end
    object gbLucratividadeUnitaria: TGroupBox
      Left = 424
      Top = 161
      Width = 418
      Height = 435
      Caption = 'Lucratividade do Item(Unit'#225'ria por Item)'
      TabOrder = 2
      Visible = False
      object lbNitem: TLabel
        Left = 92
        Top = 20
        Width = 51
        Height = 13
        Caption = 'N'#186' Item: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbNumFab: TLabel
        Left = 204
        Top = 20
        Width = 67
        Height = 13
        Caption = 'Num. Fab.: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbDescricao: TLabel
        Left = 77
        Top = 42
        Width = 66
        Height = 13
        Caption = 'Descri'#231#227'o: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbValunit: TLabel
        Left = 37
        Top = 112
        Width = 106
        Height = 13
        Caption = 'Vl. Unit'#225'rio Bruto: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbRateioDesconto: TLabel
        Left = 32
        Top = 135
        Width = 111
        Height = 13
        Caption = 'Desconto Unit'#225'rio: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbRateioAcrescimo: TLabel
        Left = 28
        Top = 158
        Width = 115
        Height = 13
        Caption = 'Acrescimo Unit'#225'rio: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbMarkup: TLabel
        Left = 92
        Top = 89
        Width = 51
        Height = 13
        Caption = 'Markup: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbPE: TLabel
        Left = 27
        Top = 66
        Width = 116
        Height = 13
        Caption = 'Ponto de Equilibrio: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label14: TLabel
        Left = 24
        Top = 181
        Width = 119
        Height = 13
        Caption = 'Vl. Unit'#225'rio Liqu'#237'do: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBEdit1: TDBEdit
        Left = 149
        Top = 17
        Width = 46
        Height = 21
        DataField = 'NITEM'
        DataSource = dtmMargemProd.dsItensVenda
        ReadOnly = True
        TabOrder = 0
      end
      object DBEdit2: TDBEdit
        Left = 277
        Top = 17
        Width = 133
        Height = 21
        DataField = 'NUM_FAB_PROD'
        DataSource = dtmMargemProd.dsItensVenda
        ReadOnly = True
        TabOrder = 1
      end
      object DBEdit3: TDBEdit
        Left = 149
        Top = 39
        Width = 261
        Height = 21
        DataField = 'DESCR_PROD_PED'
        DataSource = dtmMargemProd.dsItensVenda
        ReadOnly = True
        TabOrder = 2
      end
      object DBEdit4: TDBEdit
        Left = 149
        Top = 109
        Width = 100
        Height = 21
        DataField = 'VLUN_PED_ITEM'
        DataSource = dtmMargemProd.dsItensVenda
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 5
      end
      object DBEdit5: TDBEdit
        Left = 149
        Top = 132
        Width = 100
        Height = 21
        DataField = 'RATEIO_DESC_UNITARIO'
        DataSource = dtmMargemProd.dsItensVenda
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 6
      end
      object DBEdit6: TDBEdit
        Left = 149
        Top = 155
        Width = 100
        Height = 21
        DataField = 'RATEIO_ACRESC_UNITARIO'
        DataSource = dtmMargemProd.dsItensVenda
        ReadOnly = True
        TabOrder = 7
      end
      object DBEdit12: TDBEdit
        Left = 149
        Top = 86
        Width = 100
        Height = 21
        DataField = 'MARKUP'
        DataSource = dtmMargemProd.dsItensVenda
        ReadOnly = True
        TabOrder = 4
      end
      object DBEdit13: TDBEdit
        Left = 149
        Top = 63
        Width = 100
        Height = 21
        DataField = 'PE'
        DataSource = dtmMargemProd.dsItensVenda
        ReadOnly = True
        TabOrder = 3
      end
      object gbLucratividadeUnitariaCustos: TGroupBox
        Left = 4
        Top = 196
        Width = 410
        Height = 105
        TabOrder = 9
        object lbCMV: TLabel
          Left = 12
          Top = 13
          Width = 127
          Height = 13
          Caption = 'Custo Merc. Vendida: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbCF: TLabel
          Left = 59
          Top = 36
          Width = 80
          Height = 13
          Caption = 'Custos Fixos: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbCV: TLabel
          Left = 36
          Top = 59
          Width = 103
          Height = 13
          Caption = 'Custos Vari'#225'veis: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lvCT: TLabel
          Left = 53
          Top = 79
          Width = 86
          Height = 13
          Caption = 'Custos Totais: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label15: TLabel
          Left = 313
          Top = 13
          Width = 10
          Height = 13
          Caption = '%'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label16: TLabel
          Left = 313
          Top = 36
          Width = 10
          Height = 13
          Caption = '%'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label17: TLabel
          Left = 313
          Top = 59
          Width = 10
          Height = 13
          Caption = '%'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label18: TLabel
          Left = 313
          Top = 82
          Width = 10
          Height = 13
          Caption = '%'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBEdit7: TDBEdit
          Left = 145
          Top = 10
          Width = 100
          Height = 21
          DataField = 'CMV'
          DataSource = dtmMargemProd.dsItensVenda
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
        object DBEdit8: TDBEdit
          Left = 145
          Top = 33
          Width = 100
          Height = 21
          DataField = 'CF'
          DataSource = dtmMargemProd.dsItensVenda
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
        end
        object DBEdit9: TDBEdit
          Left = 145
          Top = 79
          Width = 100
          Height = 21
          DataField = 'CT'
          DataSource = dtmMargemProd.dsItensVenda
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 6
        end
        object DBEdit10: TDBEdit
          Left = 145
          Top = 56
          Width = 100
          Height = 21
          DataField = 'CV'
          DataSource = dtmMargemProd.dsItensVenda
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 4
        end
        object DBEdit15: TDBEdit
          Left = 254
          Top = 10
          Width = 53
          Height = 21
          DataField = 'CMVPERC'
          DataSource = dtmMargemProd.dsItensVenda
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
        object DBEdit16: TDBEdit
          Left = 254
          Top = 33
          Width = 53
          Height = 21
          DataField = 'CFPERC'
          DataSource = dtmMargemProd.dsItensVenda
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
        end
        object DBEdit17: TDBEdit
          Left = 254
          Top = 56
          Width = 53
          Height = 21
          DataField = 'CVPERC'
          DataSource = dtmMargemProd.dsItensVenda
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 5
        end
        object DBEdit18: TDBEdit
          Left = 254
          Top = 79
          Width = 53
          Height = 21
          DataField = 'CTPERC'
          DataSource = dtmMargemProd.dsItensVenda
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 7
        end
      end
      object gbLucratividadeUnitariaLucro: TGroupBox
        Left = 4
        Top = 300
        Width = 410
        Height = 129
        TabOrder = 10
        object lbLucroLiq: TLabel
          Left = 53
          Top = 14
          Width = 86
          Height = 13
          Caption = 'Lucro Liquido: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label19: TLabel
          Left = 313
          Top = 14
          Width = 10
          Height = 13
          Caption = '%'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label49: TLabel
          Left = 101
          Top = 37
          Width = 38
          Height = 13
          Alignment = taRightJustify
          Caption = 'IRRF: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label50: TLabel
          Left = 45
          Top = 60
          Width = 94
          Height = 13
          Alignment = taRightJustify
          Caption = 'Adicional IRRF: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label51: TLabel
          Left = 313
          Top = 37
          Width = 10
          Height = 13
          Caption = '%'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label52: TLabel
          Left = 313
          Top = 60
          Width = 10
          Height = 13
          Caption = '%'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label53: TLabel
          Left = 1
          Top = 107
          Width = 138
          Height = 13
          Alignment = taRightJustify
          Caption = 'Lucro Liq Depois IRRF: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label54: TLabel
          Left = 313
          Top = 107
          Width = 10
          Height = 13
          Caption = '%'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label69: TLabel
          Left = 100
          Top = 83
          Width = 39
          Height = 13
          Alignment = taRightJustify
          Caption = 'CSLL: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label70: TLabel
          Left = 313
          Top = 83
          Width = 10
          Height = 13
          Caption = '%'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBEdit11: TDBEdit
          Left = 145
          Top = 11
          Width = 100
          Height = 21
          DataField = 'LUCROLIQ'
          DataSource = dtmMargemProd.dsItensVenda
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 16744448
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
        object DBEdit19: TDBEdit
          Left = 254
          Top = 11
          Width = 53
          Height = 21
          DataField = 'LUCROLIQPERC'
          DataSource = dtmMargemProd.dsItensVenda
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 16744448
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
        object DBEdit57: TDBEdit
          Left = 145
          Top = 34
          Width = 100
          Height = 21
          DataField = 'IRRF_ITEM'
          DataSource = dtmMargemProd.dsItensVenda
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
        end
        object DBEdit58: TDBEdit
          Left = 145
          Top = 57
          Width = 100
          Height = 21
          DataField = 'ADIRRF_ITEM'
          DataSource = dtmMargemProd.dsItensVenda
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
        end
        object DBEdit59: TDBEdit
          Left = 254
          Top = 34
          Width = 53
          Height = 21
          DataField = 'IRRF_PERC'
          DataSource = dtmMargemProd.dsItensVenda
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 4
        end
        object DBEdit60: TDBEdit
          Left = 254
          Top = 57
          Width = 53
          Height = 21
          DataField = 'ADIRRF_PERC'
          DataSource = dtmMargemProd.dsItensVenda
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 5
        end
        object DBEdit61: TDBEdit
          Left = 145
          Top = 105
          Width = 100
          Height = 21
          DataField = 'LUCRORETIDO_ITEM'
          DataSource = dtmMargemProd.dsItensVenda
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 16744448
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 6
        end
        object DBEdit62: TDBEdit
          Left = 254
          Top = 104
          Width = 53
          Height = 21
          DataField = 'LUCRORETIDO_PERC'
          DataSource = dtmMargemProd.dsItensVenda
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 16744448
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 7
        end
        object DBEdit77: TDBEdit
          Left = 145
          Top = 80
          Width = 100
          Height = 21
          DataField = 'CSLL_ITEM'
          DataSource = dtmMargemProd.dsItensVenda
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 8
        end
        object DBEdit78: TDBEdit
          Left = 254
          Top = 80
          Width = 53
          Height = 21
          DataField = 'CSLL_PERC'
          DataSource = dtmMargemProd.dsItensVenda
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 9
        end
      end
      object DBEdit14: TDBEdit
        Left = 149
        Top = 178
        Width = 100
        Height = 21
        DataField = 'VLUN_LIQUIDO'
        DataSource = dtmMargemProd.dsItensVenda
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 8
      end
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 488
    Top = 64
    object SalvardadosnoExcel: TMenuItem
      Caption = 'Salvar dados no Excel'
      OnClick = SalvardadosnoExcelClick
    end
  end
end
