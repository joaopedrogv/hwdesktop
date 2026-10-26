inherited frmMargemProduto: TfrmMargemProduto
  Left = 226
  Top = 53
  Caption = 'Defini'#231#227'o de Margem de Produtos/Servi'#231'os'
  ClientHeight = 647
  ClientWidth = 876
  Position = poMainFormCenter
  OnDestroy = FormDestroy
  ExplicitWidth = 884
  ExplicitHeight = 681
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 876
    Height = 647
    ActivePage = TabSheet1
    Align = alClient
    Style = tsFlatButtons
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Margem Prod/Servi'#231'os'
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 868
        Height = 157
        Align = alTop
        BevelKind = bkTile
        BevelOuter = bvNone
        TabOrder = 0
        object Label25: TLabel
          Left = 240
          Top = 56
          Width = 107
          Height = 13
          Caption = 'Pre'#231'o Venda Atacado:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label26: TLabel
          Left = 240
          Top = 33
          Width = 113
          Height = 13
          Caption = 'Pre'#231'o de Venda Varejo:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label27: TLabel
          Left = 16
          Top = 56
          Width = 135
          Height = 13
          Caption = 'Data '#218'ltima Venda Atacado:'
        end
        object Label28: TLabel
          Left = 16
          Top = 33
          Width = 126
          Height = 13
          Caption = 'Data '#218'ltima Venda Varejo:'
        end
        object Label29: TLabel
          Left = 446
          Top = 5
          Width = 50
          Height = 13
          Caption = 'Descri'#231#227'o:'
        end
        object Label30: TLabel
          Left = 232
          Top = 8
          Width = 42
          Height = 13
          Caption = 'Produto:'
        end
        object Label1: TLabel
          Left = 16
          Top = 79
          Width = 79
          Height = 13
          Caption = 'Pre'#231'o de Venda:'
        end
        object Label2: TLabel
          Left = 16
          Top = 102
          Width = 91
          Height = 13
          Caption = 'Pre'#231'o c/ Desconto:'
        end
        object Label3: TLabel
          Left = 240
          Top = 79
          Width = 103
          Height = 13
          Caption = 'Percentual Desconto:'
        end
        object Label4: TLabel
          Left = 240
          Top = 102
          Width = 81
          Height = 13
          Caption = 'Dias de Estoque:'
        end
        object Label40: TLabel
          Left = 365
          Top = 33
          Width = 56
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = '0,00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label41: TLabel
          Left = 34
          Top = 8
          Width = 24
          Height = 13
          Caption = 'Tipo:'
        end
        object Label43: TLabel
          Left = 365
          Top = 56
          Width = 56
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = '0,00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label44: TLabel
          Left = 502
          Top = 4
          Width = 356
          Height = 13
          AutoSize = False
          Caption = '[descri'#231#227'o]'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object GroupBox1: TGroupBox
          Left = 430
          Top = 23
          Width = 436
          Height = 128
          Caption = 'Classifica'#231#245'es:'
          TabOrder = 2
          object Label31: TLabel
            Left = 16
            Top = 15
            Width = 49
            Height = 13
            Caption = 'Demanda:'
          end
          object Label32: TLabel
            Left = 172
            Top = 15
            Width = 67
            Height = 13
            Caption = 'Investimento:'
          end
          object Label33: TLabel
            Left = 16
            Top = 38
            Width = 31
            Height = 13
            Caption = 'Pre'#231'o:'
          end
          object Label34: TLabel
            Left = 172
            Top = 38
            Width = 66
            Height = 13
            Caption = 'Popularidade:'
          end
          object Label35: TLabel
            Left = 16
            Top = 61
            Width = 101
            Height = 13
            Caption = 'Quantidade Vendida:'
          end
          object Label36: TLabel
            Left = 16
            Top = 84
            Width = 110
            Height = 13
            Caption = 'Frequ'#234'ncia de Vendas:'
          end
          object Label37: TLabel
            Left = 16
            Top = 109
            Width = 55
            Height = 13
            Caption = 'Atualidade:'
          end
          object Label46: TLabel
            Left = 72
            Top = 15
            Width = 64
            Height = 13
            Caption = '[Demanda]'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label47: TLabel
            Left = 247
            Top = 15
            Width = 85
            Height = 13
            Caption = '[investimento]'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label48: TLabel
            Left = 54
            Top = 38
            Width = 42
            Height = 13
            Caption = '[pre'#231'o]'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label49: TLabel
            Left = 247
            Top = 38
            Width = 31
            Height = 13
            Caption = '[Pop]'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label50: TLabel
            Left = 140
            Top = 61
            Width = 78
            Height = 13
            Caption = '[Qtd Vendida]'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label52: TLabel
            Left = 140
            Top = 84
            Width = 35
            Height = 13
            Caption = '[Freq]'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label53: TLabel
            Left = 140
            Top = 109
            Width = 70
            Height = 13
            Caption = '[atualidade]'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
        end
        object edNumFabProd: TMaskEdit
          Left = 280
          Top = 0
          Width = 161
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 1
          OnExit = edNumFabProdExit
          OnKeyUp = edNumFabProdKeyUp
        end
        object edPrecoVenda: TEditMoeda
          Left = 113
          Top = 75
          Width = 112
          Height = 21
          Alignment = taRightJustify
          TabOrder = 3
          FormatReal = fNumber
          FormatSize = '10.2'
        end
        object edPrecoVendaComDesconto: TEditMoeda
          Left = 113
          Top = 96
          Width = 112
          Height = 21
          Alignment = taRightJustify
          TabOrder = 5
          FormatReal = fNumber
          FormatSize = '10.2'
        end
        object edPercentualDesconto: TEditMoeda
          Left = 353
          Top = 75
          Width = 68
          Height = 21
          Alignment = taRightJustify
          TabOrder = 4
          FormatReal = fNumber
          FormatSize = '10.2'
          OnExit = edPercentualDescontoExit
        end
        object edDiasDeEstoque: TEditMoeda
          Left = 353
          Top = 96
          Width = 68
          Height = 21
          Alignment = taRightJustify
          Enabled = False
          TabOrder = 6
          FormatReal = fInteger
          FormatSize = '10.2'
          OnExit = edRecolhimentoICMSPercExit
        end
        object BitBtn1: TBitBtn
          Left = 299
          Top = 123
          Width = 122
          Height = 25
          Hint = 'Obter'
          Caption = '<< Obter >>'
          TabOrder = 7
          OnClick = BitBtn1Click
        end
        object rbVendaVarejo: TRadioButton
          Left = 16
          Top = 129
          Width = 113
          Height = 17
          Caption = 'Venda Varejo'
          Checked = True
          TabOrder = 8
          TabStop = True
          OnClick = rbVendaVarejoClick
        end
        object rbVendaAtacado: TRadioButton
          Left = 135
          Top = 129
          Width = 113
          Height = 17
          Caption = 'Venda Atacado'
          TabOrder = 9
          OnClick = rbVendaAtacadoClick
        end
        object ComboBox1: TComboBox
          Left = 64
          Top = 0
          Width = 161
          Height = 21
          ItemHeight = 13
          TabOrder = 0
          Text = 'PRODUTOS'
          OnExit = ComboBox1Exit
          Items.Strings = (
            'PRODUTOS'
            'PRODUTOS - Grupos'
            'PRODUTOS - SubGrupos'
            'SERVI'#199'OS'
            'VEICULOS'
            'VEICULOS SEMI-NOVOS')
        end
      end
      object GroupBox2: TGroupBox
        Left = 0
        Top = 157
        Width = 868
        Height = 460
        Align = alTop
        Caption = 'Margem'
        TabOrder = 1
        object Panel2: TPanel
          Left = 2
          Top = 15
          Width = 865
          Height = 443
          Align = alLeft
          BevelKind = bkTile
          BevelOuter = bvNone
          TabOrder = 0
          object Label45: TLabel
            Left = 538
            Top = 60
            Width = 86
            Height = 13
            Caption = #218'ltima Compra:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label5: TLabel
            Left = 501
            Top = 85
            Width = 123
            Height = 13
            Caption = 'Custo Merc. Vendida:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label10: TLabel
            Left = 822
            Top = 85
            Width = 11
            Height = 13
            Caption = '%'
          end
          object Label6: TLabel
            Left = 23
            Top = 134
            Width = 161
            Height = 13
            Hint = 
              'Quando qtde Menor que Zero indica que (CMV+OCV+MARGEM) > 100%(Va' +
              'lor de venda)'
            Caption = 'Qtde Ideal Venda Condi'#231#227'o:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
          end
          object Label7: TLabel
            Left = 26
            Top = 61
            Width = 160
            Height = 13
            Caption = 'Margem de Lucro Esperada:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label8: TLabel
            Left = 263
            Top = 65
            Width = 11
            Height = 13
            Caption = '%'
          end
          object Label58: TLabel
            Left = 548
            Top = 111
            Width = 76
            Height = 13
            Caption = 'Custos Fixos:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label42: TLabel
            Left = 822
            Top = 111
            Width = 11
            Height = 13
            Caption = '%'
          end
          object Label9: TLabel
            Left = 525
            Top = 134
            Width = 99
            Height = 13
            Caption = 'Custos Vari'#225'veis:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label11: TLabel
            Left = 822
            Top = 134
            Width = 11
            Height = 13
            Caption = '%'
          end
          object Label64: TLabel
            Left = 468
            Top = 189
            Width = 156
            Height = 13
            Caption = 'Lucro L'#237'q. S/ Faturamento:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label51: TLabel
            Left = 822
            Top = 189
            Width = 11
            Height = 13
            Caption = '%'
          end
          object Label12: TLabel
            Left = 71
            Top = 109
            Width = 114
            Height = 13
            Caption = 'Ponto de Equil'#237'brio:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label16: TLabel
            Left = 542
            Top = 161
            Width = 82
            Height = 13
            Caption = 'Custos Totais:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label17: TLabel
            Left = 822
            Top = 161
            Width = 11
            Height = 13
            Caption = '%'
          end
          object Label18: TLabel
            Left = 635
            Top = 72
            Width = 196
            Height = 13
            Caption = '-------------------------------------------------'
          end
          object Label19: TLabel
            Left = 635
            Top = 175
            Width = 196
            Height = 13
            Caption = '-------------------------------------------------'
          end
          object Label20: TLabel
            Left = 635
            Top = 147
            Width = 196
            Height = 13
            Caption = '-------------------------------------------------'
          end
          object Label21: TLabel
            Left = 24
            Top = 157
            Width = 160
            Height = 13
            Caption = 'Qtde Vendida M'#234's Apurado:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label22: TLabel
            Left = 6
            Top = 179
            Width = 178
            Height = 13
            Caption = 'Valor CF produto M'#234's Apurado:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label23: TLabel
            Left = 27
            Top = 225
            Width = 157
            Height = 13
            Caption = 'Markup com esta Estrutura:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label24: TLabel
            Left = 5
            Top = 201
            Width = 180
            Height = 13
            Caption = 'Markup Prat.no M'#234's Ap. Grupo:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label54: TLabel
            Left = 34
            Top = 84
            Width = 152
            Height = 13
            Caption = 'Valor Venda Conf Margem:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label57: TLabel
            Left = 590
            Top = 213
            Width = 34
            Height = 13
            Alignment = taRightJustify
            Caption = 'IRRF:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label59: TLabel
            Left = 822
            Top = 213
            Width = 11
            Height = 13
            Caption = '%'
          end
          object Label60: TLabel
            Left = 534
            Top = 236
            Width = 90
            Height = 13
            Alignment = taRightJustify
            Caption = 'Adicional IRRF:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label61: TLabel
            Left = 822
            Top = 236
            Width = 11
            Height = 13
            Caption = '%'
          end
          object Label62: TLabel
            Left = 635
            Top = 273
            Width = 196
            Height = 13
            Caption = '-------------------------------------------------'
          end
          object Label63: TLabel
            Left = 500
            Top = 288
            Width = 125
            Height = 13
            Alignment = taRightJustify
            Caption = 'Lucro L'#237'quido Retido:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label65: TLabel
            Left = 822
            Top = 289
            Width = 11
            Height = 13
            Caption = '%'
          end
          object imgInformation: TImage
            Left = 836
            Top = 232
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
          object Label66: TLabel
            Left = 589
            Top = 259
            Width = 35
            Height = 13
            Alignment = taRightJustify
            Caption = 'CSLL:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label67: TLabel
            Left = 822
            Top = 259
            Width = 11
            Height = 13
            Caption = '%'
          end
          object edValorUltimaCompra: TEditMoeda
            Left = 634
            Top = 57
            Width = 121
            Height = 21
            Alignment = taRightJustify
            TabOrder = 8
            FormatReal = fNumber
            FormatSize = '10.2'
          end
          object edCustoAquisicao: TEditMoeda
            Left = 634
            Top = 82
            Width = 121
            Height = 21
            Alignment = taRightJustify
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 9
            FormatReal = fNumber
            FormatSize = '10.2'
            OnExit = edCustoAquisicaoExit
          end
          object edCustoAquisicaoPerc: TEditMoeda
            Left = 755
            Top = 82
            Width = 62
            Height = 21
            Alignment = taRightJustify
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            FormatReal = fNumber
            FormatSize = '10.2'
          end
          object edtQtdeVenda: TEditMoeda
            Left = 194
            Top = 131
            Width = 121
            Height = 21
            Hint = 
              'Quando qtde Menor que Zero indica que (CMV+OCV+MARGEM) > 100%(Va' +
              'lor de venda)'
            Alignment = taRightJustify
            Enabled = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            FormatReal = fNumber
            FormatSize = '10.2'
          end
          object EdtMargemEsp: TEditMoeda
            Left = 194
            Top = 57
            Width = 62
            Height = 21
            Alignment = taRightJustify
            Color = clInactiveCaption
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 4
            FormatReal = fNumber
            FormatSize = '10.2'
            OnExit = EdtMargemEspExit
          end
          object edValorDespesasFixas: TEditMoeda
            Left = 634
            Top = 108
            Width = 121
            Height = 21
            Alignment = taRightJustify
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 10
            FormatReal = fNumber
            FormatSize = '10.2'
            OnExit = edValorDespesasFixasExit
          end
          object edDespesasFixas: TEditMoeda
            Left = 755
            Top = 108
            Width = 62
            Height = 21
            Alignment = taRightJustify
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 11
            FormatReal = fNumber
            FormatSize = '10.2'
            OnExit = edRecolhimentoICMSPercExit
          end
          object EdtCustosVariaveis: TEditMoeda
            Left = 634
            Top = 131
            Width = 121
            Height = 21
            Alignment = taRightJustify
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 12
            FormatReal = fNumber
            FormatSize = '10.2'
            OnExit = EdtCustosVariaveisExit
          end
          object EdPercVariavel: TEditMoeda
            Left = 755
            Top = 131
            Width = 62
            Height = 21
            Alignment = taRightJustify
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 13
            FormatReal = fNumber
            FormatSize = '10.2'
            OnExit = edRecolhimentoICMSPercExit
          end
          object edLucroLiquidoSobreFaturamento: TEditMoeda
            Left = 634
            Top = 186
            Width = 121
            Height = 21
            Alignment = taRightJustify
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clHighlight
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 16
            FormatReal = fNumber
            FormatSize = '10.2'
          end
          object edLucroLiquidoSobreFaturamentoPerc: TEditMoeda
            Left = 755
            Top = 186
            Width = 62
            Height = 21
            Alignment = taRightJustify
            ReadOnly = True
            TabOrder = 17
            FormatReal = fNumber
            FormatSize = '10.2'
          end
          object Panel3: TPanel
            Left = 0
            Top = 0
            Width = 861
            Height = 54
            Align = alTop
            TabOrder = 18
            object Label13: TLabel
              Left = 3
              Top = 10
              Width = 26
              Height = 13
              Caption = 'DNA:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label14: TLabel
              Left = 350
              Top = 10
              Width = 93
              Height = 13
              Caption = 'DEPARTAMENTO:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label15: TLabel
              Left = 568
              Top = 10
              Width = 120
              Height = 13
              Caption = 'MES/ANO APURA'#199#195'O:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label38: TLabel
              Left = 3
              Top = 33
              Width = 262
              Height = 13
              Caption = 'Margem M'#237'nima (Custo Mercadoria'#247'Margem):'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label39: TLabel
              Left = 346
              Top = 33
              Width = 142
              Height = 13
              Caption = 'MarkUp M'#237'nimo Apurado:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Edit1: TEdit
              Left = 35
              Top = 3
              Width = 305
              Height = 20
              BorderStyle = bsNone
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
            object Edit2: TEdit
              Left = 449
              Top = 3
              Width = 112
              Height = 20
              BorderStyle = bsNone
              Enabled = False
              TabOrder = 1
            end
            object Edit3: TEdit
              Left = 694
              Top = 3
              Width = 72
              Height = 20
              BorderStyle = bsNone
              Enabled = False
              TabOrder = 2
            end
            object Edit4: TEdit
              Left = 268
              Top = 26
              Width = 72
              Height = 20
              BorderStyle = bsNone
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 3
            end
            object Edit5: TEdit
              Left = 494
              Top = 26
              Width = 67
              Height = 20
              BorderStyle = bsNone
              Enabled = False
              TabOrder = 4
            end
            object BitBtn6: TBitBtn
              Left = 781
              Top = 1
              Width = 75
              Height = 22
              Hint = 'DNA - [BAS083]'
              Caption = 'DNA >>'
              TabOrder = 5
              OnClick = BitBtn6Click
            end
          end
          object EdtPeProduto: TEditMoeda
            Left = 194
            Top = 106
            Width = 121
            Height = 21
            Alignment = taRightJustify
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 7
            FormatReal = fNumber
            FormatSize = '10.2'
          end
          object EdtCustosTotais: TEditMoeda
            Left = 634
            Top = 158
            Width = 121
            Height = 21
            Alignment = taRightJustify
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 14
            FormatReal = fNumber
            FormatSize = '10.2'
            OnExit = EdtCustosVariaveisExit
          end
          object EdtPercCustosTotais: TEditMoeda
            Left = 755
            Top = 158
            Width = 62
            Height = 21
            Alignment = taRightJustify
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 15
            FormatReal = fNumber
            FormatSize = '10.2'
            OnExit = edRecolhimentoICMSPercExit
          end
          object EdtQtdeVendida: TEditMoeda
            Left = 194
            Top = 154
            Width = 121
            Height = 21
            Alignment = taRightJustify
            Enabled = False
            ParentShowHint = False
            ShowHint = False
            TabOrder = 1
            FormatReal = fNumber
            FormatSize = '10.2'
          end
          object EdtValorCFProduto: TEditMoeda
            Left = 194
            Top = 176
            Width = 121
            Height = 21
            Alignment = taRightJustify
            Enabled = False
            TabOrder = 2
            FormatReal = fNumber
            FormatSize = '10.2'
          end
          object edtMarkup: TEditMoeda
            Left = 194
            Top = 222
            Width = 121
            Height = 21
            Alignment = taRightJustify
            Color = clInactiveCaption
            Enabled = False
            TabOrder = 19
            FormatReal = fNumber
            FormatSize = '10.4'
          end
          object edtmarkupGrupo: TEditMoeda
            Left = 194
            Top = 198
            Width = 121
            Height = 21
            Alignment = taRightJustify
            Enabled = False
            TabOrder = 20
            FormatReal = fNumber
            FormatSize = '10.4'
          end
          object BitBtn2: TBitBtn
            Left = 317
            Top = 220
            Width = 168
            Height = 23
            Caption = 'Setar Markup p/ Prod/Gru/SubGr'
            TabOrder = 21
            OnClick = BitBtn2Click
          end
          object EdValorVendaSug: TEditMoeda
            Left = 194
            Top = 81
            Width = 121
            Height = 21
            Alignment = taRightJustify
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 6
            FormatReal = fNumber
            FormatSize = '10.2'
          end
          object DBGrid1: TDBGrid
            Left = 14
            Top = 318
            Width = 842
            Height = 115
            DataSource = dtmMargemProd.DtGrupos
            TabOrder = 22
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
          end
          object BitBtn3: TBitBtn
            Left = 6
            Top = 287
            Width = 190
            Height = 25
            Caption = 'Obter Venda p/ Grupo/Sub Grupo >>'
            TabOrder = 23
            OnClick = BitBtn3Click
          end
          object BitBtn4: TBitBtn
            Left = 213
            Top = 287
            Width = 167
            Height = 25
            Hint = 
              'Setar markup e Margem para todos os grupos selecionados de acord' +
              'o com a Margem de Lucro esperada'
            Caption = 'Setar Markup para todos Abaixo'
            Enabled = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 24
          end
          object BitBtn5: TBitBtn
            Left = 276
            Top = 56
            Width = 39
            Height = 22
            Hint = 'Aplicar a pre'#231'o de Venda'
            Caption = 'App>>'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 5
            OnClick = BitBtn5Click
          end
          object edIRRF: TEditMoeda
            Left = 634
            Top = 210
            Width = 121
            Height = 21
            Alignment = taRightJustify
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 25
            FormatReal = fNumber
            FormatSize = '10.2'
            OnExit = edValorDespesasFixasExit
          end
          object edIRRFPerc: TEditMoeda
            Left = 755
            Top = 209
            Width = 62
            Height = 21
            Alignment = taRightJustify
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 26
            FormatReal = fNumber
            FormatSize = '10.2'
            OnExit = edRecolhimentoICMSPercExit
          end
          object edADIRRF: TEditMoeda
            Left = 634
            Top = 233
            Width = 121
            Height = 21
            Alignment = taRightJustify
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 27
            FormatReal = fNumber
            FormatSize = '10.2'
            OnExit = EdtCustosVariaveisExit
          end
          object edADIRRFPerc: TEditMoeda
            Left = 755
            Top = 233
            Width = 62
            Height = 21
            Alignment = taRightJustify
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 28
            FormatReal = fNumber
            FormatSize = '10.2'
            OnExit = edRecolhimentoICMSPercExit
          end
          object edLucroLiqRetidoEmpresa: TEditMoeda
            Left = 634
            Top = 285
            Width = 121
            Height = 21
            Alignment = taRightJustify
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clHighlight
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 29
            FormatReal = fNumber
            FormatSize = '10.2'
          end
          object edLucroLiqRetidoEmpresaPerc: TEditMoeda
            Left = 755
            Top = 285
            Width = 62
            Height = 21
            Alignment = taRightJustify
            ReadOnly = True
            TabOrder = 30
            FormatReal = fNumber
            FormatSize = '10.2'
          end
          object edCSLL: TEditMoeda
            Left = 634
            Top = 256
            Width = 121
            Height = 21
            Alignment = taRightJustify
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 31
            FormatReal = fNumber
            FormatSize = '10.2'
            OnExit = EdtCustosVariaveisExit
          end
          object edCSLLPerc: TEditMoeda
            Left = 755
            Top = 256
            Width = 62
            Height = 21
            Alignment = taRightJustify
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 32
            FormatReal = fNumber
            FormatSize = '10.2'
            OnExit = edRecolhimentoICMSPercExit
          end
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Vendas Meses'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 868
        Height = 36
        Align = alTop
        TabOrder = 0
        object Label55: TLabel
          Left = 4
          Top = 14
          Width = 37
          Height = 13
          Caption = 'Ultimos '
        end
        object Label56: TLabel
          Left = 124
          Top = 14
          Width = 30
          Height = 13
          Caption = 'Meses'
        end
        object ComboBox2: TComboBox
          Left = 47
          Top = 6
          Width = 73
          Height = 21
          ItemHeight = 0
          TabOrder = 0
          Text = '1'
          Items.Strings = (
            '1'
            '2'
            '3'
            '4'
            '5'
            '6'
            '7'
            '8'
            '9'
            '10'
            '11'
            '12')
        end
        object Button1: TButton
          Left = 161
          Top = 2
          Width = 75
          Height = 25
          Caption = 'Obter >>'
          TabOrder = 1
          OnClick = Button1Click
        end
      end
      object HierCubeGrid1: THierCubeGrid
        Left = 0
        Top = 36
        Width = 868
        Height = 580
        Align = alClient
        UseDockManager = False
        ParentColor = False
        TabOrder = 1
        HierCube = dtmMargemProd.HieranalVenda
        VisualSettings.CaptionFont.Charset = DEFAULT_CHARSET
        VisualSettings.CaptionFont.Color = clWindowText
        VisualSettings.CaptionFont.Height = -11
        VisualSettings.CaptionFont.Name = 'Tahoma'
        VisualSettings.CaptionFont.Style = [fsBold]
        VisualSettings.DimPanelFont.Charset = DEFAULT_CHARSET
        VisualSettings.DimPanelFont.Color = clWindowText
        VisualSettings.DimPanelFont.Height = -11
        VisualSettings.DimPanelFont.Name = 'Tahoma'
        VisualSettings.DimPanelFont.Style = []
        VisualSettings.LabelFont.Charset = DEFAULT_CHARSET
        VisualSettings.LabelFont.Color = clWindowText
        VisualSettings.LabelFont.Height = -11
        VisualSettings.LabelFont.Name = 'Tahoma'
        VisualSettings.LabelFont.Style = []
        VisualSettings.DataFont.Charset = DEFAULT_CHARSET
        VisualSettings.DataFont.Color = clWindowText
        VisualSettings.DataFont.Height = -11
        VisualSettings.DataFont.Name = 'Tahoma'
        VisualSettings.DataFont.Style = []
        VisualSettings.ShowMoreIconsButton = True
        SummarySettings = <>
        FunctionDefs = <
          item
            DisplayName = 'Sum'
            UserAllowed = True
          end
          item
            DisplayName = 'Count'
            UserAllowed = True
          end
          item
            DisplayName = 'Average'
            UserAllowed = True
          end
          item
            DisplayName = 'Min'
            UserAllowed = True
          end
          item
            DisplayName = 'Max'
            UserAllowed = True
          end
          item
            DisplayName = 'Variance'
            UserAllowed = True
          end
          item
            DisplayName = 'Standard deviation'
            UserAllowed = True
          end
          item
            DisplayName = 'Average deviation'
            UserAllowed = True
          end
          item
            DisplayName = 'Skewness'
            UserAllowed = True
          end
          item
            DisplayName = 'Kurtosis'
            UserAllowed = True
          end
          item
            DisplayName = 'Median'
            UserAllowed = True
          end>
        SubFunctionDefs = <
          item
            DisplayName = 'Agg. value'
            UserAllowed = True
          end
          item
            DisplayName = 'Row rank'
            UserAllowed = True
          end
          item
            DisplayName = 'Col rank'
            UserAllowed = True
          end
          item
            DisplayName = '% ROW'
            UserAllowed = True
          end
          item
            DisplayName = '% COL'
            UserAllowed = True
          end
          item
            DisplayName = 'Prev. row compare'
            UserAllowed = True
          end
          item
            DisplayName = 'Prev. col compare'
            UserAllowed = True
          end
          item
            DisplayName = 'Row cumul. Sum'
            UserAllowed = True
          end
          item
            DisplayName = 'Col cumul. Sum'
            UserAllowed = True
          end>
        DimensionEditorFilterOn = False
      end
    end
  end
end
