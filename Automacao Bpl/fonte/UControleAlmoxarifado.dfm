inherited frmControleAlmoxarifado: TfrmControleAlmoxarifado
  Caption = 'Controle Vendedor/ Controle Almoxarifado'
  ClientHeight = 422
  ClientWidth = 895
  FormStyle = fsMDIChild
  Position = poScreenCenter
  Scaled = False
  Visible = True
  OnClose = FormClose
  ExplicitWidth = 903
  ExplicitHeight = 456
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 895
    Height = 422
    ActivePage = tsControleVendedor
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Style = tsFlatButtons
    TabOrder = 0
    object tsControleVendedor: TTabSheet
      Caption = 'tsControleVendedor'
      object pnControleVendedor: TPanel
        Left = 0
        Top = 0
        Width = 887
        Height = 391
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object GroupBox8: TGroupBox
          Left = 1
          Top = 1
          Width = 885
          Height = 103
          Align = alTop
          Caption = 'Pedidos Vendedor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          object Label200: TLabel
            Left = 113
            Top = 78
            Width = 25
            Height = 13
            Alignment = taRightJustify
            Caption = 'Filtro:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label7: TLabel
            Left = 65
            Top = 52
            Width = 73
            Height = 13
            Caption = 'Tipo de Venda:'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label13: TLabel
            Left = 301
            Top = 52
            Width = 56
            Height = 13
            Caption = 'Cond. Pag.:'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label12: TLabel
            Left = 89
            Top = 25
            Width = 49
            Height = 13
            Caption = 'Vendedor:'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label14: TLabel
            Left = 671
            Top = 78
            Width = 149
            Height = 13
            Caption = 'F6 - Habilitar e Desabilitar'
          end
          object imgInformation: TImage
            Left = 859
            Top = 15
            Width = 24
            Height = 86
            Cursor = crHelp
            Align = alRight
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
            ExplicitLeft = 848
          end
          object DBLookupComboBox15: TDBLookupComboBox
            Left = 419
            Top = 49
            Width = 372
            Height = 21
            Hint = 'Condi'#231#227'o de Pagamento Selecionado'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            KeyField = 'COD_COND_PAG'
            ListField = 'DESC_COND_PAG'
            ListSource = dtmEstoqueFechado.dsCondPagamento
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 4
            OnExit = DBLookupComboBox15Exit
          end
          object DBLookupComboBox16: TDBLookupComboBox
            Left = 222
            Top = 22
            Width = 569
            Height = 21
            Hint = 'Vendedor selecionado'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            KeyField = 'COD_VENDEDOR'
            ListField = 'NOME_VENDEDOR'
            ListSource = dtmEstoqueFechado.dsUsuario
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
            OnExit = DBLookupComboBox16Exit
          end
          object Edit1: TEdit
            Left = 222
            Top = 74
            Width = 443
            Height = 21
            CharCase = ecUpperCase
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 6
            OnChange = Edit1Change
          end
          object DBLookupComboBox2: TDBLookupComboBox
            Left = 144
            Top = 49
            Width = 119
            Height = 21
            Hint = 'Tipo Venda Selecionado'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            KeyField = 'COD_TIPO'
            ListField = 'DESCRICAO'
            ListSource = dtmEstoqueFechado.dsTipoVenda
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 2
            OnExit = DBLookupComboBox2Exit
          end
          object EditMoeda2: TEditMoeda
            Left = 144
            Top = 22
            Width = 72
            Height = 21
            Alignment = taRightJustify
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            FormatReal = fInteger
            FormatSize = '10.2'
            OnExit = EditMoeda2Exit
          end
          object EditMoeda1: TEditMoeda
            Left = 364
            Top = 49
            Width = 50
            Height = 21
            Alignment = taRightJustify
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            FormatReal = fInteger
            FormatSize = '10.2'
            OnExit = EditMoeda1Exit
          end
          object Edit3: TEdit
            Left = 144
            Top = 74
            Width = 72
            Height = 21
            BiDiMode = bdRightToLeft
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentBiDiMode = False
            ParentFont = False
            TabOrder = 5
            Text = 'Edit3'
            OnExit = Edit3Exit
            OnKeyDown = Edit3KeyDown
            OnKeyPress = Edit3KeyPress
          end
        end
        object GroupBox65: TGroupBox
          Left = 1
          Top = 131
          Width = 885
          Height = 259
          Align = alClient
          Caption = 'Itens Pedidos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          object Panel44: TPanel
            Left = 2
            Top = 15
            Width = 881
            Height = 50
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 0
            object Panel1: TPanel
              Left = 0
              Top = 0
              Width = 881
              Height = 50
              Align = alClient
              BevelOuter = bvNone
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 0
              object Label194: TLabel
                Left = 3
                Top = 5
                Width = 81
                Height = 13
                Caption = 'Num Fabrica'#231#227'o:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label21: TLabel
                Left = 99
                Top = 30
                Width = 81
                Height = 13
                Caption = 'Produto atendido'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -5
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object btSelectAll: TSpeedButton
                Left = 378
                Top = 29
                Width = 23
                Height = 21
                Hint = '[ F2 ] - Selecionar todos'
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
                Left = 405
                Top = 29
                Width = 23
                Height = 21
                Hint = '[ F4 ] - Desfazer sele'#231#227'o'
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
              object SpeedButton13: TSpeedButton
                Left = 380
                Top = 2
                Width = 23
                Height = 21
                Hint = 'Localizar produto'
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                Glyph.Data = {
                  36050000424D3605000000000000360400002800000010000000100000000100
                  08000000000000010000D30E0000D30E00000001000000010000181810001818
                  18002929290031313100313931004A39310039393900423939004A423900524A
                  3900424242004A4A42004A4A4A00524A4A0052524A00735A4A00525252005A5A
                  5A007B6B5A00846B5A00636363006B6363006B6B6B0094846B00737373009484
                  73009C8C7300737B7B007B7B7B0094947B00A5947B00848484009C948400A594
                  8400AD94840084848C008C8C8C0094948C00A59C8C00AD9C8C00ADA58C00EFBD
                  8C0094949400A59C9400B5A59400BDB59400C6B59400DEBD9400EFBD9400F7BD
                  9400EFC6940094949C009C9C9C00A5A59C00B5AD9C00EFBD9C00E7C69C00EFC6
                  9C00E7CE9C009CA5A500A5A5A500A5ADA500B5ADA500B5B5A500C6BDA500CEBD
                  A500D6BDA500E7C6A500F7CEA500EFD6A500FFD6A500ADADAD00B5ADAD00B5B5
                  AD00DEC6AD00EFC6AD00DECEAD00EFCEAD00F7CEAD00F7D6AD00FFD6AD00F7DE
                  AD00B5B5B500CEC6B500E7CEB500F7D6B500FFD6B500FFDEB500BDBDBD00EFD6
                  BD00F7D6BD00FFD6BD00F7DEBD00FFDEBD00FFE7BD00BDBDC600BDC6C600C6C6
                  C600F7D6C600F7DEC600FFDEC600FFF7C600C6C6CE00CECECE00D6D6CE00EFDE
                  CE00FFDECE00F7E7CE00FFE7CE00FFEFCE00D6D6D600DEDED600FFDED600FFE7
                  D600FFEFD600DEDEDE00FFF7DE00FFFFDE00E7E7E700EFE7E700FFEFE700FFF7
                  E700FFFFE700EFEFEF00FFF7EF00FFFFEF00F7F7F700FFFFF700FF00FF00F7FF
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
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00808080808080
                  8080808080808080808080808080808080808080808052068080808080808080
                  8080808080470C2A1C80808080808080808080803C0A2A6E2480808080808080
                  808080471134612A80808080808080808080581634522A808080808080343434
                  34801601161F808080808080580C0D0C103C06165880808080808033176B7974
                  7121166F808080808080580779744A4A6C7F15618080808080803C2E714B3030
                  386B1A18808080808080344271634444646C271F808080808080494056647474
                  5A561E2380808080808067265071817F70561D3C80808080808080672D4F7A74
                  4541588080808080808080803C3F453A53358080808080808080}
                ParentFont = False
                ParentShowHint = False
                ShowHint = True
                OnClick = SpeedButton13Click
              end
              object Label211: TLabel
                Left = 568
                Top = 30
                Width = 166
                Height = 13
                Caption = 'F2 - Marca e desmarcar linha'
              end
              object Label195: TLabel
                Left = 415
                Top = 5
                Width = 27
                Height = 13
                Caption = 'Valor:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label6: TLabel
                Left = 281
                Top = 30
                Width = 86
                Height = 13
                Caption = 'Produto devolvido'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -5
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label15: TLabel
                Left = 685
                Top = 5
                Width = 40
                Height = 13
                Caption = 'N'#250'mero:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label16: TLabel
                Left = 590
                Top = 5
                Width = 24
                Height = 13
                Caption = 'Tipo:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Panel22: TPanel
                Left = 9
                Top = 30
                Width = 79
                Height = 13
                BevelOuter = bvNone
                Color = 16757683
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clRed
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentBackground = False
                ParentFont = False
                TabOrder = 0
              end
              object Edit2: TEdit
                Left = 84
                Top = 2
                Width = 290
                Height = 21
                CharCase = ecUpperCase
                Enabled = False
                TabOrder = 1
                OnExit = Edit2Exit
                OnKeyDown = Edit2KeyDown
              end
              object EditHw1: TEditHw
                Left = 444
                Top = 3
                Width = 129
                Height = 21
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 2
                Text = '               0'
                OnEnter = EditHw1Enter
                OnExit = EditHw1Exit
                Formato = fMoney
                FormatSize = '10.2'
              end
              object Panel5: TPanel
                Left = 191
                Top = 30
                Width = 79
                Height = 13
                BevelOuter = bvNone
                Color = 9685503
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clRed
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentBackground = False
                ParentFont = False
                TabOrder = 4
              end
              object ComboBox3: TComboBox
                Left = 618
                Top = 3
                Width = 49
                Height = 21
                Style = csDropDownList
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ItemHeight = 13
                ItemIndex = 0
                ParentFont = False
                TabOrder = 3
                Text = 'OS'
                Items.Strings = (
                  'OS'
                  'REQ')
              end
              object EditHw2: TEditHw
                Left = 731
                Top = 3
                Width = 129
                Height = 21
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 5
                Text = '                 0'
                OnExit = EditHw2Exit
                OnKeyDown = EditHw2KeyDown
                Formato = fInteger
                FormatSize = '0.2'
              end
            end
          end
          object Panel3: TPanel
            Left = 2
            Top = 65
            Width = 881
            Height = 141
            Align = alClient
            BevelOuter = bvNone
            Caption = 'Panel3'
            TabOrder = 1
            object DBGrid1: TDBGrid
              Left = 286
              Top = 0
              Width = 595
              Height = 141
              Align = alClient
              DataSource = dtmEstoqueFechado.dsEstoqueFechado
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
              ParentFont = False
              PopupMenu = PopupMenu1
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = [fsBold]
              OnCellClick = DBGrid1CellClick
              OnColEnter = DBGrid1ColEnter
              OnColumnMoved = DBGrid1ColumnMoved
              OnDrawColumnCell = DBGrid1DrawColumnCell
              OnKeyDown = DBGrid1KeyDown
              OnTitleClick = DBGrid1TitleClick
            end
            object GroupBox3: TGroupBox
              Left = 0
              Top = 0
              Width = 286
              Height = 141
              Align = alLeft
              Caption = 'Configura'#231#227'o das Colunas'
              TabOrder = 1
              Visible = False
              object ScrollBox2: TScrollBox
                Left = 2
                Top = 15
                Width = 282
                Height = 124
                Align = alClient
                BevelInner = bvNone
                BevelOuter = bvNone
                TabOrder = 0
                OnEnter = ScrollBox2Enter
                OnExit = ScrollBox2Exit
              end
            end
          end
          object Panel4: TPanel
            Left = 2
            Top = 206
            Width = 881
            Height = 51
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 2
            object Panel20: TPanel
              Left = 0
              Top = 0
              Width = 881
              Height = 17
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 0
              object Panel53: TPanel
                Left = 226
                Top = 0
                Width = 105
                Height = 17
                Caption = 'Normal'
                Color = clBtnHighlight
                ParentBackground = False
                TabOrder = 0
              end
              object Panel54: TPanel
                Left = 331
                Top = 0
                Width = 105
                Height = 17
                Caption = 'Promo'#231#227'o'
                Color = clGreen
                ParentBackground = False
                TabOrder = 1
              end
              object Panel55: TPanel
                Left = 436
                Top = 0
                Width = 105
                Height = 17
                Caption = 'Tabela de Pre'#231'os'
                Color = clGradientActiveCaption
                ParentBackground = False
                TabOrder = 2
              end
              object Panel62: TPanel
                Left = 542
                Top = 0
                Width = 105
                Height = 17
                Caption = 'Pre'#231'o por qtde'
                Color = 16777170
                ParentBackground = False
                TabOrder = 3
              end
            end
            object BitBtn2: TBitBtn
              Left = 9
              Top = 17
              Width = 92
              Height = 34
              Hint = 'Remover Item - [VND144]'
              Align = alRight
              Caption = '&Remover Item'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              OnClick = BitBtn2Click
              Glyph.Data = {
                12020000424D1202000000000000120100002800000010000000100000000100
                08000000000000010000120B0000120B0000370000003700000000000000FFFF
                FF00FF00FF001442E4001645EB001C4BE7000430EB000C35E4000E3CEB001037
                DB000027EB00002AEB000027E400012CEB00052BDC00062DE300092ED9000022
                EB000021E7000020E200001FDC000022DC000020D900001EEB00001FEB000020
                EB00001DE800001BE300001EE200001FE200001BDF00001CDF00001AEB00001A
                E2000017DF000019DF00001ADF000011EB000016EB000012E6000010DC000013
                DC000010D9000009EB00000BEB000008EA000008E700000ADF000004E2000005
                E2000004DF000005DF000003DB000004DA0000006E0002020202020202020202
                0202020202020202020202020202020202020202020202020236360202020202
                0236360202020202361A28360202020236302E36020202023621182A36020236
                332B34360202020202362419293636312C353602020202020202361E11272D2B
                3236020202020202020202361B26252F36020202020202020202023612172022
                36020202020202020202360F06131C0A2336020202020202023607080E363614
                0B1F3602020202023603041036020236160D1D36020202023605093602020202
                36150C3602020202023636020202020202363602020202020202020202020202
                02020202020202020202020202020202020202020202}
            end
            object BitBtn3: TBitBtn
              Left = 101
              Top = 17
              Width = 85
              Height = 34
              Hint = 'Devolver - [VND145]'
              Align = alRight
              Caption = '&Devolver'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
              OnClick = BitBtn3Click
              Glyph.Data = {
                0A030000424D0A030000000000000A0200002800000010000000100000000100
                08000000000000010000120B0000120B0000750000007500000000000000FFFF
                FF008584B1009190B100BAB7CF00FF00FF007A767A00494546005C575800443C
                3C00433E3E00483F3D002C2822002B2B2A00CBFFFF00CFFFFF00D3FFFF00F6FB
                FB00C2FCFF00B8EFFD00C3F2FF001C1F20001F2223005CCDFF0066D1FF0059C3
                FF00A0CFEA0063B4E80072BCEC005DA7E300D2DCE40055A0E4001E2022002325
                270026282A00252729003A3D4000282A2C0027292B003B89DC006B95CA00296F
                D4003367B40031548C0038588C003C5C90003E5D8F002059BC003B588C003D5C
                90003B588B003F5D9000265CC20023242600909CB900A6AAB4000235F0000334
                E6000333E3000332DD000433DE000432DB000534D8000533D600042FC900042E
                BE000634D0000634CF000630C4000832CE0009289B006785F3006785F200637F
                E6006884EA00B4B9CA000033FF000034FF000034FE000033FD000135FF000130
                EF000133EF000236FF00032ED8000437FF00052ECA000F41FF00204EFF00335D
                FF003F62F9004466F9006283FF006685FF006785FB006785FA006885F2009BAE
                FD009A9CA400002EF8000525B800849AFB007883B3005863AD005861AA00000F
                B600010FB2000613A500757AB3000109A4000109A1008F91B200797BAE007F7F
                A800B8B8D300EEEEEE00FFFFFF00050505050505050505050505050505052525
                250505050505332E312D050505052608350D0C2A30322F3429272C0505052206
                20010B17191F1D1B281C182F2B0523621501090F120E10133671661A142B2337
                16070A04111E4B706846646B026F262421050572036C6745404143446A050505
                050505056A5273493B3D01426A0505050505056A634E5F0160014A3F566E0505
                0505056A574D4F5F01483A3C3E6D05050505056A5A4D5D015F014739546D0505
                050505056A58015D4C5E01386A050505050505056A6159534D5055516A050505
                05050505056A6A655C5B6A6905050505050505050505056A6A6A050505050505
                0505050505050505050505050505}
            end
            object BitBtn4: TBitBtn
              Left = 186
              Top = 17
              Width = 85
              Height = 34
              Hint = 'Somar'
              Align = alRight
              Caption = 'So&mar '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 3
              OnClick = BitBtn4Click
              Glyph.Data = {
                36050000424D3605000000000000360400002800000010000000100000000100
                08000000000000010000130B0000130B00000001000000010000000000008484
                8400FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00020202020202
                0202020202020202020202020202020202020202020202020202020202020202
                0202020202020202020202020202020202020202020202020202020202000000
                0000000000000202020202020201000001020202020002020202020202020100
                0001020202020202020202020202020100000102020202020202020202020202
                0100000202020202020202020202020100000102020202020202020202020100
                0001020202020202020202020201000001020202020002020202020202000000
                0000000000000202020202020202020202020202020202020202020202020202
                0202020202020202020202020202020202020202020202020202}
            end
            object BitBtn106: TBitBtn
              Left = 271
              Top = 17
              Width = 75
              Height = 34
              Hint = 'Fotos'
              Align = alRight
              Caption = 'Fotos'
              TabOrder = 4
              OnClick = BitBtn106Click
              Glyph.Data = {
                EA020000424DEA02000000000000EA0100002800000010000000100000000100
                08000000000000010000120B0000120B00006D0000006D00000000000000FFFF
                FF008E8CA900FF00FF00A6869C0072535F007E596300C0737C00B15A5B00D961
                5D00D65F5C00E8880000FF9A0000FF9B0000F79A0800BD7B1000927F350086A1
                7200759E79002FBF5A002A9653003CAA7E0041C99A0049C9B7004CC8B6003768
                620039928B005AA5A30000FFFF0002FAFB000AB2BF0008A8B90019DCF70016CE
                EF0002B8DE00158FA9002A9CB2004BA3B8001EA6CD0026C3EC00197C980042AA
                C70005789E0016B5E400058AB8000090C800057AA8000C7BA90063CCF6000075
                A800158FC3001E9ED50023A4DD00259CD2002AABE6002DAEE60034B0E90047A1
                C8000081C000007DB90000669A00086EA3000A73A8000D81B90027A9EB002291
                C600288CBD002982AE003EB3ED0040B5EF003588B100157BB1001D82B9001F84
                BB002086BD00258AC200298DC6002F93CC00369ED6003CAEEA003BABE60043B4
                F00047BCFA00317FA80049B8F4004DC0FF003F9CCE0054B9F1004EABDE0056B9
                F00058B7E90046A9E30049B0EC0055C0FF005CBEF90072B9EC005B92BD00769C
                BC004796E40050AAFF004096FA004296FF001F59BC002154B3002A6AF7008695
                B7000E3CE0000235FF000023FB00030303030303030303030303030303030303
                03030303030303030303030303030303030303033E4B4B3E0303030303030303
                033D43413433322F2E3C0303030303033D0208064636231E1F2C2D3C0303033D
                5F07090A05261D1C1C22282A3C03475A58610469602720212B120B0F19314D68
                6A66565552514F40250E0C0D103B4B646B6C675E5D54453837291B1124310349
                6365621A395C5044353F3C3A3C03034957301513145303420303030303030303
                3E4C171618595B4E3E0303030303030303033E484D4D4A3E0303030303030303
                0303030303030303030303030303030303030303030303030303030303030303
                0303030303030303030303030303}
            end
            object BitBtn5: TBitBtn
              Left = 346
              Top = 17
              Width = 85
              Height = 34
              Hint = 'Abrir Venda - [VND146]'
              Align = alRight
              Caption = 'Abrir &Venda'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 5
              OnClick = BitBtn5Click
              Glyph.Data = {
                42020000424D4202000000000000420000002800000010000000100000000100
                10000300000000020000120B0000120B00000000000000000000007C0000E003
                00001F0000001F7C1F7CC469A265A265A265A265A265A265A265A265A265A265
                C4691F7C1F7C1F7C1F7CA2656D7B217201724D7B0172E1714D7BE171E1712C7B
                A2651F7C1F7C1F7C1F7CC269400C607A607A400C407A207A400C207A207A400C
                A2691F7C1F7C1F7C1F7CE2696176407620762076007600760076007600760076
                C2691F7C1F7C1F7CA96D026E6D7B207200724D7BE071E0714D7BC071C0714D7B
                A16DA96D1F7C1F7CA265016E400CE06DC06D200CA06DA06D200CA06DA06D200C
                A16DA2651F7C8E6DA2654040203C203C203C203C203C203C203C203C203C203C
                2040A2658E6DA265E67EE77EE87E097F097F097F097F097F097F097F097F097F
                E77EA57EA265A265C17E407E407E407E407E407E8D3186106541407E407E407E
                407E607EA265A2654A7F2A7F2A7F2A7F2A7F2A7F86108D310921C9412A7F2A7F
                2A7F2A7FA265A6694D340000EE6584180000200CCD3909218D31092128416675
                6675A265A6691F7C1F7C0410EE6584180000A234576FCE3D09218D31E81C073D
                66751F7C1F7C1F7C1F7C955400000410EB2C035D576F576F0735E81C8D31C718
                EA441F7C1F7C1F7C1F7C1F7CE948CE501F7C035D035D035D035DCE4C903C8D31
                6F381F7C1F7C1F7C1F7C1F7CE948CE501F7C1F7C1F7C1F7C1F7C1F7C1F7C6F38
                144D1F7C1F7C1F7C1F7C1F7C04100B2C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                1F7C1F7C1F7C}
            end
            object BitBtn6: TBitBtn
              Left = 431
              Top = 17
              Width = 100
              Height = 34
              Hint = 'Transferir Pe'#231'as- [VND147]'
              Align = alRight
              Caption = '&Transferir Pe'#231'as'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 6
              OnClick = BitBtn6Click
              Glyph.Data = {
                36030000424D3603000000000000360000002800000010000000100000000100
                18000000000000030000120B0000120B00000000000000000000FF00FF0274AC
                0274AC0274AC0274AC0274AC0274AC0274AC0274AC0274AC046B0B0274AC0274
                AC0274ACFF00FFFF00FF0274AC138AC457B7E06BCBF84BBFF74ABFF74ABFF74A
                BFF74ABFF64ABFF7046B0B046B0B2398CC0274ACFF00FFFF00FF0274AC33AAE0
                2392C489D9FA54C7F854C7F753C7F854C7F754C7F854C7F8046B0B15A128046B
                0B6ACBE50274ACFF00FF0274AC57CAF80274AC99E3FB5ED1FA046B0B046B0B04
                6B0B046B0B046B0B046B0B1AAA3115A128046B0B0274ACFF00FF0274AC5ED3FA
                0F709F93A9B2979595046B0B46E57D41DE743AD56832CA5A29BF4B22B53E1AAA
                3214A128046B0BFF00FF0274AC68DAFB3A698265B0C4E3E9D1046B0B46E57D46
                E57D41DE743AD56832CB5929C04B21B53E1AAA3114A028046B0B0274AC70E3FB
                7966681483B6FFFFFE046B0B46E57D46E57D46E57D41DE753AD56832CB5A29C0
                4B21B43D046B0B0274AC0274AC7AEBFE9D6A60107EAF0274AC046B0B046B0B04
                6B0B046B0B046B0B046B0B3AD56732CA59046B0B0274AC0274AC0274AC83F2FE
                A77463F4E6D7FFF0DDFEE7CFFEE2C6FEDEBCFFDCB6FAD0A7046B0B41DE74046B
                0BFF00FFFF00FFFF00FF0274ACFEFEFEB27E67F7EEE5FFF8EDFEEFDEFFEAD7FE
                E5CEFFE5C7FED9B8046B0B046B0B036FA7FF00FFFF00FFFF00FFFF00FF0274AC
                BF886CF8F3EEFFFCF8FFF6EDFEF2E6FFF3E3FFF2E1F3E1CF046B0B0274ACFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFC99272FAF3EFFFFFFFFEFAF8FEFBF7E5
                CCC1D1B4AABAA59D734241FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                D49C75FCF6F2FFFFFFFFFFFFFFFFFFA0675BA0675BA0675BA0675BFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFDDA578FBF3EDFEFBFBFEFBFAFFFFFFA0
                675BE1A45FED9C3BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                E3AA7AD1926DD1926DD1926DD1926DA0675BD59A65FF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
            end
            object BitBtn21: TBitBtn
              Left = 531
              Top = 17
              Width = 95
              Height = 34
              Hint = 'Liberar Trava - [VND198/VND218]'
              Align = alRight
              Caption = 'Liberar Trava'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 7
              OnClick = BitBtn21Click
              Glyph.Data = {
                8E050000424D8E050000000000004E0300002800000018000000180000000100
                08000000000040020000120B0000120B0000C6000000C600000000000000FFFF
                FF00FF00FF0087FEFE00F3FFFF0074F4FB0079F3F80068EAF4006BEDF7006AEA
                F40075EDF800BCF6FB0060EAF80065D1DC00D5FAFE0053DEF20053DCEE0055C5
                D4006CE6F60055B4C100A7F0FB00A6EEF800A7EEF700C2F3FA00F4FBFC003ECB
                E5004CD1E9004BBBCE0055CCE00095E5F30099EAF800ACEAF400C9EFF6003AC9
                E50049BDD3008BDEEF008BDDEE0093E6F70023B5D9002DB6D70038BDDC0038B7
                D50066DEFC0093E5F7001EA4CB0022ADD40029B2D70027A0C2002DB0D30059D1
                F2007DD1E70087DDF3008BDEF60091E5FC000C9FCE00159ECB0019A3CF001BA9
                D8002198BB002093B6002593B5002898BC002A99BB0045C7F2006ACCEA0073C7
                E10088DCF70081CEE70083CEE60095E2FA000696CA00078ABB000F9FD1001298
                C700128FBB001599CA001B9ECC0020A0CE0027B2E10028A5D30028A3D1002592
                BA0034BBE90033B5E50032AAD70040C1F00040B2D8004190AC0074D0EF0073C5
                E1007DD3F30088DAF7008ADCF8000082B800018AC200018BC1000188BF00027E
                B100038FC4000388BF000386BC000383B7000384B7000382B6000383B6000383
                B500037EB1000489C000047BAD00068BC000078EC400098CC0000A8CC1000A88
                BB000B92C6000B8FC2000E92C6000F96CA000F93C5000F88BB001196C9001399
                CC000F76A000189DD0001A98CB001780AC0022A0D00028A0D00039A6D4004C9D
                BD0080D4F70083D8FB0088D9FA000283BC00036B9C000487BF000478AB000479
                AB000587BF000586BD000478AA000470A1000686BF000787BF000876A700096D
                99001491C700117AA900115575001F9ACE0015658900219ACE00269ED100289F
                D30029A0D300278EBA002689B5002DA3D50023769C00216D8F003AA6D50041AF
                E000307E9F004AB0DD004DB1DE0050B7E60058BAE60066C4EF0066C1EB007ACF
                F7007BD1F7007DD1F70082D4F80007689700096C9C00145A7B0050A5CE006CC6
                F2006BC5F00072C9F40075CBF60076CBF70076CBF60077CCF70077CBF60077CC
                F60078CCF70078CEF70078CBF6007BCFFA007ACEF8007BCEF8007ACEF7007BCE
                F7007DCFF8007ECFF80081D0FB0081D1FB000202020202020202020202020202
                020202020202020202020202020202028B999D9A97928F020202020202020202
                020202020202026074A9C4C3C0B4B1A5998E0202020202020202020202026B46
                785AABB5BCB6A4A8C5A79802020202020202020202026E484B335BAAB9B780A3
                BDC1C2A10202020202020202020272394C1D2B4283B09CA0B2BAB8BF73020202
                020202020202754E7E1F15253581969BA6BEB6B6730202020202020202027952
                4F2017161E349F9EB3B7B6B6730202020202020202027B3F5418040E0B1457A2
                82BBB6B6730202020202020202027B537C444359413223244584A9B573020202
                0202020202027328293B3A272D37494D56405CAC730202020202020202026F08
                1394AF110C1926365F63505873020202020202020202028A301B0D030510212C
                47695D7073020202020202020202020202712E1A09070F2F61892C5E73020202
                0202020202020202020202028776384A676C6485020202020202020202020202
                0202020202020202688C02020202020202020202020202020286860202020202
                658C0202020202020202020202020202026D6A0202020202658C020202020202
                0202020202020202027F950202020202658C0202020202020202020202020202
                02512A93020202026688020202020202020202020202020202021C0A3DAEAD90
                628D020202020202020202020202020202029122061231557702020202020202
                0202020202020202020202027A3C3E7D02020202020202020202020202020202
                020202020202020202020202020202020202}
            end
            object BitBtn14: TBitBtn
              Left = 626
              Top = 17
              Width = 90
              Height = 34
              Hint = 'Imprimir Solicita'#231#227'o - [VND153]'
              Align = alRight
              Caption = '&Imprimir Solic'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 8
              OnClick = BitBtn14Click
              Glyph.Data = {
                CA020000424DCA02000000000000CA0100002800000010000000100000000100
                08000000000000010000120B0000120B00006500000065000000D1D0E900FF00
                FF00E7DCDE0072414100734241006D3F3E00673C3B00845351008E5D59009866
                5D0092625A00A0675B009E665A009D6559009F675A009E6659009A645700A06C
                5F00A66F5B00C1836C00AA746200A7726000A7746300FEFBFA00BB836900B17D
                6700FEFCFB00CB865E00CE8A6300C48B6C00EDD1C100F6E6DD00C5876300D192
                6D00CC937000E5C5B100D59C7400FEF8F400E1A57700DCA17500F7EFE900FEFA
                F700E1A67700FEF8F300FFCC9D00FEF0E300FFC48B00FFC79000FFC79200FEC9
                9300FECA9700FFCE9D00FECE9F00FECFA000FFD1A500FFD4AA00FFD5AC00FED4
                AB00FED8B200FFD9B400FED9B500FFDCB800F6D5B400FEDDBC00FEE1C500FEE3
                C900FEE7D000FEE7D100FEE9D400FEEBD900FEEDDC00FEEFE000FEF2E600FFF7
                EF00FEF6EE00FEFAF600FBF7F300FEFBF800FFE0C000FEE0C000FEE1C200E2C9
                AD00C7B19900FEE2C500FEE5CB00BBA99600FEE9D300FEEAD500FEF3E700FEF6
                ED00FEEDD900FEF3E600FEF7EE00FEFAF400FFDD9A00FFF7D100FEFEFC000000
                8200FFFFFF00FEFEFE0000000000010101010808010101010101010101010101
                0101082E07070101010101010101010101010808080808080808080808040101
                010A0A4F3F3C372C302E2E2E2E040101010A0A403F3B383633322F2E2E040101
                010A0954614E0E0E0E0E0E0E2E040101125F114356565656533A353131040101
                1202164561570E0E0E0E0E0E34040101120019475B5B5B5B5A413D3938040120
                2362185861490E0E0C0F100E3E0301201F621D5C29294D2B2D42505051050126
                17632225604D2B594846445552060126626224176363175D4A4B0B0B0B0D2A26
                1E28276363636363634B155E5E1301011B1C27636363631A4B4C145E13010101
                0101262121212121212114130101}
            end
            object BitBtn7: TBitBtn
              Left = 716
              Top = 17
              Width = 90
              Height = 34
              Hint = 'F5 - Atualizar'
              Align = alRight
              Caption = 'F5 - Atualizar'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 9
              OnClick = BitBtn7Click
              Glyph.Data = {
                36050000424D3605000000000000360400002800000010000000100000000100
                08000000000000010000220B0000220B0000000100000001000000840000088C
                0800108C080018941000219410001894180029941800219C2100299C210029A5
                2900E78C31005AA53900B56B4A006BAD4A0073AD4A008C6B5200946B5200E79C
                5200A5635A00A56B5A00BD7B5A0084B55A00FFB55A0063BD6300A5636B00A573
                6B00BD846B00C6846B00D6946B00A5B56B0073BD6B00DE9C7300CEB5730094BD
                73009CBD7300ADBD730073C673007BC6730084C6730094C673009CC67300E7AD
                7B00DEBD7B00EFBD7B009CC67B00EFC67B00EFBD84009CC68400EFC68400F7C6
                840084CE8400EFC68C00F7CE8C00B5AD9400ADB59400EFC69400A5CE9400C6CE
                9400D6CE9400E7CE9400F7CE9400BDCE9C00EFCE9C00BDD69C00EFCEA500ADD6
                A500BDD6A500F7D6A500A5DEA500EFD6AD00F7D6AD00B5DEAD00DECEB500F7D6
                B500F7DEB500F7DEBD00DEC6C600FFEFC600FFEFCE00E7E7D600F7EFD600FFEF
                DE00DEF7DE00E7F7DE00FFEFE700E7F7E700FFF7E700F7F7EF00FFF7EF00FFF7
                F700F7FFF700FFFFF700FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF005C5C18181818
                1818181818181818185C5C5C184D393A3E3B302E2B2E2E30185C5C5C184E2208
                0D04040B202B2B30185C5C5C12513D0200000000062A2B30185C5C5C12563D03
                0003230E000E2E30185C5C5C19584201000015401D0D3330185C5C5C195D4F38
                2F212245402C3733185C5C5C1A5D4454502F212122403E3C185C5C5C1A5D2441
                5426000001454043185C5C5C1C5D32002541050002494640185C5C5C1C5D5709
                00000000024E4835185C5C5C1F5D5D521707071E08101313185C5C5C1F5D5D5D
                5D52525B360F110A0C5C5C5C295D5D5D5D5D5D5D4C1316145C5C5C5C29575757
                575757574C131A5C5C5C5C5C291C1C1C1C1C1C1C1C135C5C5C5C}
            end
            object BitBtn13: TBitBtn
              Left = 806
              Top = 17
              Width = 75
              Height = 34
              Hint = 'Sair desta tela'
              Align = alRight
              Caption = '&Sair'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 10
              OnClick = BitBtn13Click
              Glyph.Data = {
                2E020000424D2E020000000000002E0100002800000010000000100000000100
                08000000000000010000120B0000120B00003E0000003E00000000000000FFFF
                FF00FF00FF00BB410000BB420000FFF6EF00E69C5900E69D5900E9A36200FFF4
                EA00FFF8F200FECA9500FFCE9C00FFD4A900FEEBD800FEF0E200FFF2E500FFF3
                E700FFFBF700FECE9C00FED3A500FED5AA00FEDAB400FFDCB600FEDDB800FEDD
                BA00FFE3C500FEE2C400FFE5C900FFE6CA00FEE5CA00FFEBD500FEF3E700FFDA
                AD00FFEAD100FFFAF400FFD8A700FFD9A900FFDAAB00FFE1B800FFE7C700FEEE
                D900FFFBF600FFDCAC00FFE1B500FFE7C400FFEFD700FFEAC200FFFAEA00FFFE
                FB00FFFFFA00FFFFFE00315EFF002A56FF00123BFF00153DFF001841FF001A44
                FF001D47FF00072BFF00001EFF00000D66000202020202020202020202020202
                0202020202020202020202020202020202020204040404040404040404040402
                020202040132302E28272125242F04020202020401050F221B1614130B260402
                0202020401310A101F1A170D0C2B04020202020401013323110E1C18152C0402
                02020204010101332A20291D192D040202020204010101010112093D1E2E043D
                020202040101010101013D363D013D3C3D020204080606060606073D373D3B3D
                0202020203040404040404043D383D0202020202020202020202023D353D393D
                020202020202020202023D343D023D3A3D020202020202020202023D0202023D
                020202020202020202020202020202020202}
            end
          end
        end
        object Panel27: TPanel
          Left = 1
          Top = 104
          Width = 885
          Height = 27
          Align = alTop
          BevelOuter = bvLowered
          TabOrder = 1
          object BitBtn16: TBitBtn
            Left = 282
            Top = 3
            Width = 75
            Height = 25
            Hint = 'Incluir Pe'#231'a - [VND143]'
            Caption = 'I&ncluir'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            OnClick = BitBtn16Click
            Glyph.Data = {
              36050000424D3605000000000000360400002800000010000000100000000100
              08000000000000010000420B0000420B00000001000000010000B5847300AD73
              8400B5848400B58C8400B5948C00D6BDB500C6C6C600EFD6C600CECECE00D6D6
              D600DEDEDE00E7E7E700EFEFEF0042B5F7008CD6F700B5DEF700F7F7F700FF00
              FF003184FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00111111111111
              1111111111111111111111111101020202020202020202020211111111011313
              1313131313131313021111111101131313131313131313130211111111011313
              1313131313131313021111111101131313131313131313130211111111011313
              1313131313131313021111111101131313131313131313130211111111011313
              13131313131313130211111112121210101010101010101002111111120D120C
              0C0C0C0C0C0C0C0C02111212120D1212120B0B0B0B0004030211120E0F0F0F0E
              120A0A0A0600131302111212120F1212120909090600130211111111120F1208
              0808080806000211111111111212120707070707050011111111}
          end
          object BitBtn19: TBitBtn
            Left = 438
            Top = 3
            Width = 75
            Height = 25
            Hint = 'Cancelar'
            Caption = 'Cancela'
            Enabled = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 2
            OnClick = BitBtn19Click
            Glyph.Data = {
              12020000424D1202000000000000120100002800000010000000100000000100
              08000000000000010000120B0000120B0000370000003700000000000000FFFF
              FF00FF00FF001442E4001645EB001C4BE7000430EB000C35E4000E3CEB001037
              DB000027EB00002AEB000027E400012CEB00052BDC00062DE300092ED9000022
              EB000021E7000020E200001FDC000022DC000020D900001EEB00001FEB000020
              EB00001DE800001BE300001EE200001FE200001BDF00001CDF00001AEB00001A
              E2000017DF000019DF00001ADF000011EB000016EB000012E6000010DC000013
              DC000010D9000009EB00000BEB000008EA000008E700000ADF000004E2000005
              E2000004DF000005DF000003DB000004DA0000006E0002020202020202020202
              0202020202020202020202020202020202020202020202020236360202020202
              0236360202020202361A28360202020236302E36020202023621182A36020236
              332B34360202020202362419293636312C353602020202020202361E11272D2B
              3236020202020202020202361B26252F36020202020202020202023612172022
              36020202020202020202360F06131C0A2336020202020202023607080E363614
              0B1F3602020202023603041036020236160D1D36020202023605093602020202
              36150C3602020202023636020202020202363602020202020202020202020202
              02020202020202020202020202020202020202020202}
          end
          object BitBtn17: TBitBtn
            Left = 360
            Top = 3
            Width = 75
            Height = 25
            Hint = 'Salvar'
            Caption = 'Salvar'
            Enabled = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            OnClick = BitBtn17Click
            Glyph.Data = {
              36050000424D3605000000000000360400002800000010000000100000000100
              08000000000000010000220B0000220B00000001000000010000942929009431
              31009C3131009C393900A53939009C4242009C4A4A00A54A4A00B54A4A00AD52
              4A00B5524A00A5525200AD525200B5525200B55A5200AD525A00AD5A5A00B55A
              5A00BD5A5A00C65A5A00CE5A5A00CE636300CE6B6B00D66B6B00B5737300BD7B
              73009C7B7B009C848400AD848400B5848400C6848400AD8C8C00B58C8C00C694
              8C00AD949400C6949400A59C9C00B59C9C00D69C9C00BDA5A500D6A5A500D6AD
              A500CEADAD00D6ADAD00DEADAD00CEB5B500D6B5B500CEBDBD00DEBDBD00E7BD
              BD00E7C6C600C6CEC600CECEC600C6CECE00CECECE00D6CECE00E7CECE00E7D6
              CE00D6D6D600DED6D600EFD6D600DEDED600D6DEDE00DEDEDE00E7DEDE00E7E7
              E700EFEFEF00F7EFEF00F7F7EF00F7F7F700FFF7F700FFFFF700FF00FF00FFFF
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
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF004848100C0722
              33343433332505050B4848191516111B27384647452D0002131048191515111A
              05184046492E0102121048191515111C03032F42493200011210481915151120
              0601243A493200011210481915151221231D1F27322C04041310481915151515
              1515151313151515160F48190D111E282B292B2828292B26150C481909384544
              4545454545454530130F48190A3C46434343434343434530130F48190A3C423A
              3A3A3A3A3A3A4230130F48190A3C423B3F3F3F3F3F3B4230130F48190A3C4440
              4040404040404230130F48190A3C423A3A3A3A3A3A3A4230130F48190A394643
              4343434343434630130F4848092D3A363636363636363A2A0748}
          end
          object BitBtn22: TBitBtn
            Left = 516
            Top = 3
            Width = 78
            Height = 25
            Hint = 'Visualizar reservas - [VND204]'
            Caption = 'R&eservas'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 3
            OnClick = BitBtn22Click
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
              FFFFFFFFFFFFD1AD8AAB6928A6611EA5601CA5601CA96626AB6A2BA5601CA560
              1CA6611EAB6928D1AD8AFFFFFFFFFFFFFFFFFFFFFFFFAC6A29D0AE8AF0E4D9F4
              ECE4F8F4F1BA8854BA8854FBF8F5F4ECE4F0E4D9D0AE8AAC6A29FFFFFFFFFFFF
              FFFFFFFFFFFFBD8752DBC0A6FFFFFFFFFFFFFFFFFFC79D74C79D74FFFFFFFFFF
              FFFFFFFFDBC0A6BD8752FFFFFFFFFFFFFFFFFFFFFFFFDBBD9FAA6726D9BCA0EF
              E4D9FFFFFFB3783FB3783FFFFFFFEFE4D9D9BCA0AA6726DBBD9F9E9E9E696969
              696969969696FEFEFEDEC4AAAF7338A1580FEBDDD1E1CCB6E1CCB6FFFFFFA158
              0FAF7338DEC4AAFFFFFF696969FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA
              F7F3D1AC89B9844FCEA984B3773FF1E5DBFFFFFFFFFFFFFFFFFF696969FEFEFE
              9D9D9D999999999999999999D2D2D2FAF5F1B37841FFFFFFFFFFFFD4B696DEC4
              ABFFFFFFFFFFFFFFFFFF696969FEFEFE999999FFFFFFFFFFFF999999FFFFFFD0
              A983E1CDB7FFFFFFFFFFFFFFFFFFAE6E32FFFFFFFFFFFFFFFFFF696969FEFEFE
              9D9D9D9999999999999B9B9BFDFDFDBA8148FAF7F4FFFFFFFFFFFFFFFFFFB67D
              46FFFFFFFFFFFFFFFFFF696969FEFEFEFFFFFFFFFFFFFFFFFF9E9E9EFFFFFFB9
              8047B2773DC08F5FD9BB9FE3CDB8A76624FDFAF8FFFFFFFFFFFF696969FEFEFE
              FFFFFFFFFFFFFFFFFF9D9D9DF5F5F5C99D71AB6928AA6726A76522A76421AB6A
              2BFFFFFFFFFFFFFFFFFF696969FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD
              FBF9BE8B5AAC6B2CAC6B2CB2763CEDDFD1FFFFFFFFFFFFFFFFFFB2783EB3783E
              B3783EB3783EB3783EB3783EB57C43DFC7AFFDFBFAFFFFFFFFFFFFFFFEFEEDDF
              D2FFFFFFFFFFFFFFFFFFB2783EB3783EB3783EB3783EB3783EB3783EB3783EB3
              783EB67E46C39466C4976ABA8550B3783EFFFFFFFFFFFFFFFFFFB3783EB3783E
              FFFFFF696969FFFFFFB3783EB3783EB3783EFFFFFF696969FFFFFFB3783EB378
              3EFFFFFFFFFFFFFFFFFFB77F48B3783EFFFFFF696969FFFFFFB3783EB3783EB3
              783EFFFFFF696969FFFFFFB3783EB67E46FFFFFFFFFFFFFFFFFF}
          end
        end
      end
    end
    object tsControleAlmoxarifado: TTabSheet
      Caption = 'tsControleAlmoxarifado'
      ImageIndex = 1
      object pnControleAlmoxarifado: TPanel
        Left = 0
        Top = 0
        Width = 887
        Height = 350
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object GroupBox66: TGroupBox
          Left = 1
          Top = 1
          Width = 885
          Height = 74
          Align = alTop
          Caption = 'Controle de Almoxarifado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          object Label198: TLabel
            Left = 621
            Top = 33
            Width = 45
            Height = 13
            Caption = 'Situa'#231#227'o:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label196: TLabel
            Left = 17
            Top = 33
            Width = 49
            Height = 13
            Caption = 'Vendedor:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label9: TLabel
            Left = 747
            Top = 33
            Width = 96
            Height = 13
            Caption = 'F2 - Mudar Situa'#231#227'o'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -5
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label11: TLabel
            Left = 531
            Top = 34
            Width = 51
            Height = 13
            Caption = 'F3 -  Focar'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object imgInformation2: TImage
            Left = 859
            Top = 15
            Width = 24
            Height = 57
            Cursor = crHelp
            Align = alRight
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
            ExplicitLeft = 814
            ExplicitTop = 11
            ExplicitHeight = 192
          end
          object DBLookupComboBox1: TDBLookupComboBox
            Left = 137
            Top = 31
            Width = 388
            Height = 21
            Hint = 'Vendedor selecionado'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            KeyField = 'COD_VENDEDOR'
            ListField = 'NOME_VENDEDOR'
            ListSource = dtmEstoqueFechado.dsUsuario
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
            OnExit = DBLookupComboBox1Exit
          end
          object ComboBox1: TComboBox
            Left = 672
            Top = 30
            Width = 65
            Height = 21
            CharCase = ecUpperCase
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ItemHeight = 13
            ParentFont = False
            TabOrder = 2
            Text = 'NT'
            OnExit = ComboBox1Exit
            Items.Strings = (
              'NT'
              'AT')
          end
          object EditMoeda3: TEditMoeda
            Left = 72
            Top = 31
            Width = 59
            Height = 21
            Alignment = taRightJustify
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            FormatReal = fInteger
            FormatSize = '10.2'
            OnExit = EditMoeda3Exit
          end
        end
        object GroupBox67: TGroupBox
          Left = 1
          Top = 75
          Width = 885
          Height = 274
          Align = alClient
          Caption = 'Produtos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          object Panel47: TPanel
            Left = 2
            Top = 15
            Width = 881
            Height = 30
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 0
            object Label199: TLabel
              Left = 40
              Top = 6
              Width = 49
              Height = 13
              Caption = 'Num Fabr:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label2: TLabel
              Left = 600
              Top = 7
              Width = 102
              Height = 13
              Caption = 'Produto n'#227'o atendido'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -5
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label8: TLabel
              Left = 777
              Top = 7
              Width = 86
              Height = 13
              Caption = 'Produto devolvido'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -5
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label10: TLabel
              Left = 428
              Top = 6
              Width = 51
              Height = 13
              Caption = 'F4  - Focar'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Panel2: TPanel
              Left = 554
              Top = 7
              Width = 40
              Height = 13
              BevelOuter = bvNone
              Color = clGradientActiveCaption
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentBackground = False
              ParentFont = False
              TabOrder = 0
            end
            object Panel6: TPanel
              Left = 731
              Top = 7
              Width = 40
              Height = 13
              BevelOuter = bvNone
              Color = 9685503
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentBackground = False
              ParentFont = False
              TabOrder = 1
            end
            object Edit4: TEditFiscal
              Left = 95
              Top = 2
              Width = 327
              Height = 21
              CharCase = ecUpperCase
              TabOrder = 2
              OnChange = Edit4Change
              OnKeyDown = Edit4KeyDown
            end
          end
          object Panel48: TPanel
            Left = 2
            Top = 45
            Width = 881
            Height = 227
            Align = alClient
            Caption = 'Panel48'
            TabOrder = 1
            object DBGrid2: TDBGrid
              Left = 287
              Top = 1
              Width = 593
              Height = 225
              Align = alClient
              DataSource = dtmEstoqueFechado.dsEstoqueFechado
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
              ParentFont = False
              PopupMenu = PopupMenu1
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = [fsBold]
              OnColumnMoved = DBGrid2ColumnMoved
              OnDrawColumnCell = DBGrid2DrawColumnCell
              OnKeyDown = Edit4KeyDown
              OnTitleClick = DBGrid2TitleClick
            end
            object GroupBox4: TGroupBox
              Left = 1
              Top = 1
              Width = 286
              Height = 225
              Align = alLeft
              Caption = 'Configura'#231#227'o das Colunas'
              TabOrder = 1
              Visible = False
              object ScrollBox1: TScrollBox
                Left = 2
                Top = 15
                Width = 282
                Height = 208
                Align = alClient
                BevelInner = bvNone
                BevelOuter = bvNone
                TabOrder = 0
                OnEnter = ScrollBox1Enter
                OnExit = ScrollBox1Exit
              end
            end
          end
        end
      end
      object Panel7: TPanel
        Left = 0
        Top = 350
        Width = 887
        Height = 41
        Align = alBottom
        BevelInner = bvRaised
        BevelOuter = bvNone
        Caption = 'Panel7'
        TabOrder = 1
        object BitBtn8: TBitBtn
          Left = 1
          Top = 1
          Width = 120
          Height = 39
          Hint = 'Confirmar Atendimento - [VND150]'
          Align = alLeft
          Caption = 'Conf. &Atendimento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnClick = BitBtn8Click
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000000000000000000000000000000000001555CC86A88C
            83A78983A78982A68883A68982A68882A68882A68882A58881A58781A68781A6
            8881A68783A489D24DCDE4939B66C16E66C16E67C26E69C4706BC6726CC7736D
            C8746DCA756DCB766DCC776DCC776ECD786FCC796ECC77918F98E4939B66C26D
            67C26F69C4716BC6736DC87477CD7F70CD7A6ECD786FCE796FCE7A70CF7A70CF
            7A70CF7A70CF7B91919925949C67C26E69C4716BC6736FC97799D39887B2619C
            D59970CF7A71D07B72D17C72D17C73D27C73D37D73D27C92929965959D69C470
            6BC67390D3938FBB7355911E51921D7AAD568AD99274D37D74D47E74D57F74D6
            7F74D67F74D67F93929AA5979E6BC6726EC9769BC384578E2284B2659CC88D64
            A447A1CF987DD5887CD4877BD58679D88377D98277D88294939B2698A06DC774
            6DCA768FD696A3CC9D8CD0948CD89594C58A76B669A7DBAB80D78A82D78C7ADA
            8579DC8479DB8495949C669AA16DC9756DCC776FCE7977D08177D38074D67FA2
            E1A775BE6E8BC4808DE1977BDD867CDE877CDE877CDE8796969E279CA479D183
            80D68A86DA908BDE9690E09B94E39F99E6A3AFDEAE64AE51A8D69F9BEAA699EA
            A395E9A092E79C9C98A428A1AC8EDD9A92E09C94E29F97E4A299E4A49CE7A79E
            E9A8AEEDB786BD7263A23FBAEABAA5F0AFA5F0AFA5F0AFA39BAA68A2AD8FDE9A
            93E19D95E3A198E4A39AE6A69DE8A79FEAAAA2ECACB9E8B95A982A81AD5AB3F3
            BBA8F2B1A7F1B1A49CABA8A3AE91DF9B94E29E96E2A198E5A49BE7A69EE9A8A1
            EBABA3EDADA7F0B0A0C987468402ABD298ABF2B3AAF2B2A59DAB29A4B091DF9C
            94E19F97E3A299E6A59CE7A79FEAA9A1ECABA4EEAEA6F1B0B8F3BD9EC180BDEE
            BEACF3B5ACF4B4A59EAC29A5B091DF9B94E29E97E4A299E5A59DE8A79FEAA9A2
            ECACA4EFAEA6F1B0AAF2B2AEF3B7ADF4B6ADF4B6ACF3B5A69EAD69A7B191DF9B
            94E29F97E4A299E5A59DE8A79FEAA9A2ECACA4EFAEA6F1B0AAF2B2ABF3B4ADF4
            B6ADF4B6ACF2B4A39AA91249E0ABA6B3AAA6B3AAA6B3ABA5B4ABA5B4ABA5B4AB
            A5B3ABA5B4ABA5B4ACA4B3ACA4B3ABA3B2ABA3B2A69CACE035DF}
        end
        object BitBtn9: TBitBtn
          Left = 121
          Top = 1
          Width = 120
          Height = 39
          Hint = 'Confirmar Devolu'#231#227'o - [VND151]'
          Align = alLeft
          Caption = 'Conf. &Devolu'#231#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnClick = BitBtn9Click
          Glyph.Data = {
            0A030000424D0A030000000000000A0200002800000010000000100000000100
            08000000000000010000120B0000120B0000750000007500000000000000FFFF
            FF008584B1009190B100BAB7CF00FF00FF007A767A00494546005C575800443C
            3C00433E3E00483F3D002C2822002B2B2A00CBFFFF00CFFFFF00D3FFFF00F6FB
            FB00C2FCFF00B8EFFD00C3F2FF001C1F20001F2223005CCDFF0066D1FF0059C3
            FF00A0CFEA0063B4E80072BCEC005DA7E300D2DCE40055A0E4001E2022002325
            270026282A00252729003A3D4000282A2C0027292B003B89DC006B95CA00296F
            D4003367B40031548C0038588C003C5C90003E5D8F002059BC003B588C003D5C
            90003B588B003F5D9000265CC20023242600909CB900A6AAB4000235F0000334
            E6000333E3000332DD000433DE000432DB000534D8000533D600042FC900042E
            BE000634D0000634CF000630C4000832CE0009289B006785F3006785F200637F
            E6006884EA00B4B9CA000033FF000034FF000034FE000033FD000135FF000130
            EF000133EF000236FF00032ED8000437FF00052ECA000F41FF00204EFF00335D
            FF003F62F9004466F9006283FF006685FF006785FB006785FA006885F2009BAE
            FD009A9CA400002EF8000525B800849AFB007883B3005863AD005861AA00000F
            B600010FB2000613A500757AB3000109A4000109A1008F91B200797BAE007F7F
            A800B8B8D300EEEEEE00FFFFFF00050505050505050505050505050505052525
            250505050505332E312D050505052608350D0C2A30322F3429272C0505052206
            20010B17191F1D1B281C182F2B0523621501090F120E10133671661A142B2337
            16070A04111E4B706846646B026F262421050572036C6745404143446A050505
            050505056A5273493B3D01426A0505050505056A634E5F0160014A3F566E0505
            0505056A574D4F5F01483A3C3E6D05050505056A5A4D5D015F014739546D0505
            050505056A58015D4C5E01386A050505050505056A6159534D5055516A050505
            05050505056A6A655C5B6A6905050505050505050505056A6A6A050505050505
            0505050505050505050505050505}
        end
        object BitBtn11: TBitBtn
          Left = 241
          Top = 1
          Width = 120
          Height = 39
          Hint = 'Imprimir Solicita'#231#227'o - [VND153]'
          Align = alLeft
          Caption = '&Imprimir Solic.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnClick = BitBtn11Click
          Glyph.Data = {
            CA020000424DCA02000000000000CA0100002800000010000000100000000100
            08000000000000010000120B0000120B00006500000065000000D1D0E900FF00
            FF00E7DCDE0072414100734241006D3F3E00673C3B00845351008E5D59009866
            5D0092625A00A0675B009E665A009D6559009F675A009E6659009A645700A06C
            5F00A66F5B00C1836C00AA746200A7726000A7746300FEFBFA00BB836900B17D
            6700FEFCFB00CB865E00CE8A6300C48B6C00EDD1C100F6E6DD00C5876300D192
            6D00CC937000E5C5B100D59C7400FEF8F400E1A57700DCA17500F7EFE900FEFA
            F700E1A67700FEF8F300FFCC9D00FEF0E300FFC48B00FFC79000FFC79200FEC9
            9300FECA9700FFCE9D00FECE9F00FECFA000FFD1A500FFD4AA00FFD5AC00FED4
            AB00FED8B200FFD9B400FED9B500FFDCB800F6D5B400FEDDBC00FEE1C500FEE3
            C900FEE7D000FEE7D100FEE9D400FEEBD900FEEDDC00FEEFE000FEF2E600FFF7
            EF00FEF6EE00FEFAF600FBF7F300FEFBF800FFE0C000FEE0C000FEE1C200E2C9
            AD00C7B19900FEE2C500FEE5CB00BBA99600FEE9D300FEEAD500FEF3E700FEF6
            ED00FEEDD900FEF3E600FEF7EE00FEFAF400FFDD9A00FFF7D100FEFEFC000000
            8200FFFFFF00FEFEFE0000000000010101010808010101010101010101010101
            0101082E07070101010101010101010101010808080808080808080808040101
            010A0A4F3F3C372C302E2E2E2E040101010A0A403F3B383633322F2E2E040101
            010A0954614E0E0E0E0E0E0E2E040101125F114356565656533A353131040101
            1202164561570E0E0E0E0E0E34040101120019475B5B5B5B5A413D3938040120
            2362185861490E0E0C0F100E3E0301201F621D5C29294D2B2D42505051050126
            17632225604D2B594846445552060126626224176363175D4A4B0B0B0B0D2A26
            1E28276363636363634B155E5E1301011B1C27636363631A4B4C145E13010101
            0101262121212121212114130101}
        end
        object BitBtn10: TBitBtn
          Left = 361
          Top = 1
          Width = 120
          Height = 39
          Hint = 'Relat'#243'rio - [VND152]'
          Align = alLeft
          Caption = 'Relat'#243'rios'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          OnClick = BitBtn10Click
          Glyph.Data = {
            CA020000424DCA02000000000000CA0100002800000010000000100000000100
            08000000000000010000120B0000120B00006500000065000000D1D0E900FF00
            FF00E7DCDE0072414100734241006D3F3E00673C3B00845351008E5D59009866
            5D0092625A00A0675B009E665A009D6559009F675A009E6659009A645700A06C
            5F00A66F5B00C1836C00AA746200A7726000A7746300FEFBFA00BB836900B17D
            6700FEFCFB00CB865E00CE8A6300C48B6C00EDD1C100F6E6DD00C5876300D192
            6D00CC937000E5C5B100D59C7400FEF8F400E1A57700DCA17500F7EFE900FEFA
            F700E1A67700FEF8F300FFCC9D00FEF0E300FFC48B00FFC79000FFC79200FEC9
            9300FECA9700FFCE9D00FECE9F00FECFA000FFD1A500FFD4AA00FFD5AC00FED4
            AB00FED8B200FFD9B400FED9B500FFDCB800F6D5B400FEDDBC00FEE1C500FEE3
            C900FEE7D000FEE7D100FEE9D400FEEBD900FEEDDC00FEEFE000FEF2E600FFF7
            EF00FEF6EE00FEFAF600FBF7F300FEFBF800FFE0C000FEE0C000FEE1C200E2C9
            AD00C7B19900FEE2C500FEE5CB00BBA99600FEE9D300FEEAD500FEF3E700FEF6
            ED00FEEDD900FEF3E600FEF7EE00FEFAF400FFDD9A00FFF7D100FEFEFC000000
            8200FFFFFF00FEFEFE0000000000010101010808010101010101010101010101
            0101082E07070101010101010101010101010808080808080808080808040101
            010A0A4F3F3C372C302E2E2E2E040101010A0A403F3B383633322F2E2E040101
            010A0954614E0E0E0E0E0E0E2E040101125F114356565656533A353131040101
            1202164561570E0E0E0E0E0E34040101120019475B5B5B5B5A413D3938040120
            2362185861490E0E0C0F100E3E0301201F621D5C29294D2B2D42505051050126
            17632225604D2B594846445552060126626224176363175D4A4B0B0B0B0D2A26
            1E28276363636363634B155E5E1301011B1C27636363631A4B4C145E13010101
            0101262121212121212114130101}
        end
        object BitBtn44: TBitBtn
          Left = 481
          Top = 1
          Width = 120
          Height = 39
          Hint = 'Fotos'
          Align = alLeft
          Caption = 'Fotos'
          TabOrder = 4
          OnClick = BitBtn106Click
          Glyph.Data = {
            EA020000424DEA02000000000000EA0100002800000010000000100000000100
            08000000000000010000120B0000120B00006D0000006D00000000000000FFFF
            FF008E8CA900FF00FF00A6869C0072535F007E596300C0737C00B15A5B00D961
            5D00D65F5C00E8880000FF9A0000FF9B0000F79A0800BD7B1000927F350086A1
            7200759E79002FBF5A002A9653003CAA7E0041C99A0049C9B7004CC8B6003768
            620039928B005AA5A30000FFFF0002FAFB000AB2BF0008A8B90019DCF70016CE
            EF0002B8DE00158FA9002A9CB2004BA3B8001EA6CD0026C3EC00197C980042AA
            C70005789E0016B5E400058AB8000090C800057AA8000C7BA90063CCF6000075
            A800158FC3001E9ED50023A4DD00259CD2002AABE6002DAEE60034B0E90047A1
            C8000081C000007DB90000669A00086EA3000A73A8000D81B90027A9EB002291
            C600288CBD002982AE003EB3ED0040B5EF003588B100157BB1001D82B9001F84
            BB002086BD00258AC200298DC6002F93CC00369ED6003CAEEA003BABE60043B4
            F00047BCFA00317FA80049B8F4004DC0FF003F9CCE0054B9F1004EABDE0056B9
            F00058B7E90046A9E30049B0EC0055C0FF005CBEF90072B9EC005B92BD00769C
            BC004796E40050AAFF004096FA004296FF001F59BC002154B3002A6AF7008695
            B7000E3CE0000235FF000023FB00030303030303030303030303030303030303
            03030303030303030303030303030303030303033E4B4B3E0303030303030303
            033D43413433322F2E3C0303030303033D0208064636231E1F2C2D3C0303033D
            5F07090A05261D1C1C22282A3C03475A58610469602720212B120B0F19314D68
            6A66565552514F40250E0C0D103B4B646B6C675E5D54453837291B1124310349
            6365621A395C5044353F3C3A3C03034957301513145303420303030303030303
            3E4C171618595B4E3E0303030303030303033E484D4D4A3E0303030303030303
            0303030303030303030303030303030303030303030303030303030303030303
            0303030303030303030303030303}
        end
        object BitBtn12: TBitBtn
          Left = 601
          Top = 1
          Width = 120
          Height = 39
          Hint = 'F5 - Atualizar'
          Align = alLeft
          Caption = 'F5 - Atualizar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          OnClick = BitBtn12Click
          Glyph.Data = {
            36050000424D3605000000000000360400002800000010000000100000000100
            08000000000000010000220B0000220B0000000100000001000000840000088C
            0800108C080018941000219410001894180029941800219C2100299C210029A5
            2900E78C31005AA53900B56B4A006BAD4A0073AD4A008C6B5200946B5200E79C
            5200A5635A00A56B5A00BD7B5A0084B55A00FFB55A0063BD6300A5636B00A573
            6B00BD846B00C6846B00D6946B00A5B56B0073BD6B00DE9C7300CEB5730094BD
            73009CBD7300ADBD730073C673007BC6730084C6730094C673009CC67300E7AD
            7B00DEBD7B00EFBD7B009CC67B00EFC67B00EFBD84009CC68400EFC68400F7C6
            840084CE8400EFC68C00F7CE8C00B5AD9400ADB59400EFC69400A5CE9400C6CE
            9400D6CE9400E7CE9400F7CE9400BDCE9C00EFCE9C00BDD69C00EFCEA500ADD6
            A500BDD6A500F7D6A500A5DEA500EFD6AD00F7D6AD00B5DEAD00DECEB500F7D6
            B500F7DEB500F7DEBD00DEC6C600FFEFC600FFEFCE00E7E7D600F7EFD600FFEF
            DE00DEF7DE00E7F7DE00FFEFE700E7F7E700FFF7E700F7F7EF00FFF7EF00FFF7
            F700F7FFF700FFFFF700FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF005C5C18181818
            1818181818181818185C5C5C184D393A3E3B302E2B2E2E30185C5C5C184E2208
            0D04040B202B2B30185C5C5C12513D0200000000062A2B30185C5C5C12563D03
            0003230E000E2E30185C5C5C19584201000015401D0D3330185C5C5C195D4F38
            2F212245402C3733185C5C5C1A5D4454502F212122403E3C185C5C5C1A5D2441
            5426000001454043185C5C5C1C5D32002541050002494640185C5C5C1C5D5709
            00000000024E4835185C5C5C1F5D5D521707071E08101313185C5C5C1F5D5D5D
            5D52525B360F110A0C5C5C5C295D5D5D5D5D5D5D4C1316145C5C5C5C29575757
            575757574C131A5C5C5C5C5C291C1C1C1C1C1C1C1C135C5C5C5C}
        end
        object BitBtn1: TBitBtn
          Left = 766
          Top = 1
          Width = 120
          Height = 39
          Hint = 'Sair desta tela'
          Align = alRight
          Caption = '&Sair'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 6
          OnClick = BitBtn1Click
          Glyph.Data = {
            2E020000424D2E020000000000002E0100002800000010000000100000000100
            08000000000000010000120B0000120B00003E0000003E00000000000000FFFF
            FF00FF00FF00BB410000BB420000FFF6EF00E69C5900E69D5900E9A36200FFF4
            EA00FFF8F200FECA9500FFCE9C00FFD4A900FEEBD800FEF0E200FFF2E500FFF3
            E700FFFBF700FECE9C00FED3A500FED5AA00FEDAB400FFDCB600FEDDB800FEDD
            BA00FFE3C500FEE2C400FFE5C900FFE6CA00FEE5CA00FFEBD500FEF3E700FFDA
            AD00FFEAD100FFFAF400FFD8A700FFD9A900FFDAAB00FFE1B800FFE7C700FEEE
            D900FFFBF600FFDCAC00FFE1B500FFE7C400FFEFD700FFEAC200FFFAEA00FFFE
            FB00FFFFFA00FFFFFE00315EFF002A56FF00123BFF00153DFF001841FF001A44
            FF001D47FF00072BFF00001EFF00000D66000202020202020202020202020202
            0202020202020202020202020202020202020204040404040404040404040402
            020202040132302E28272125242F04020202020401050F221B1614130B260402
            0202020401310A101F1A170D0C2B04020202020401013323110E1C18152C0402
            02020204010101332A20291D192D040202020204010101010112093D1E2E043D
            020202040101010101013D363D013D3C3D020204080606060606073D373D3B3D
            0202020203040404040404043D383D0202020202020202020202023D353D393D
            020202020202020202023D343D023D3A3D020202020202020202023D0202023D
            020202020202020202020202020202020202}
        end
      end
    end
    object tsOpcoesRel: TTabSheet
      Caption = 'tsOpcoesRel'
      ImageIndex = 2
      object Label4: TLabel
        Left = 407
        Top = 338
        Width = 64
        Height = 14
        Caption = 'Aguarde...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object GroupBox1: TGroupBox
        Left = 186
        Top = 14
        Width = 510
        Height = 326
        Caption = 'Relat'#243'rio de Almoxarifado'
        TabOrder = 0
        object Label1: TLabel
          Left = 102
          Top = 32
          Width = 56
          Height = 13
          Caption = 'Data Inicial:'
        end
        object Label3: TLabel
          Left = 275
          Top = 32
          Width = 51
          Height = 13
          Caption = 'Data Final:'
        end
        object Label5: TLabel
          Left = 114
          Top = 54
          Width = 45
          Height = 13
          Caption = 'Situa'#231#227'o:'
        end
        object Label17: TLabel
          Left = 292
          Top = 54
          Width = 34
          Height = 13
          Caption = 'Ordem:'
        end
        object RadioButton1: TRadioButton
          Left = 113
          Top = 78
          Width = 224
          Height = 17
          Caption = 'Relat'#243'rio de Movimenta'#231#227'o de Produtos'
          TabOrder = 0
        end
        object RadioButton2: TRadioButton
          Left = 113
          Top = 98
          Width = 218
          Height = 17
          Caption = 'Relat'#243'rio de Rela'#231#227'o de Atendimentos'
          Checked = True
          TabOrder = 1
          TabStop = True
        end
        object MaskEdit1: TMaskEdit
          Left = 165
          Top = 24
          Width = 75
          Height = 21
          EditMask = '!99/99/0000;1;_'
          MaxLength = 10
          TabOrder = 2
          Text = '  /  /    '
        end
        object MaskEdit2: TMaskEdit
          Left = 333
          Top = 24
          Width = 75
          Height = 21
          EditMask = '!99/99/0000;1;_'
          MaxLength = 10
          TabOrder = 3
          Text = '  /  /    '
        end
        object ComboBox2: TComboBox
          Left = 165
          Top = 51
          Width = 75
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 4
          Items.Strings = (
            'AT'
            'NT')
        end
        object BitBtn57: TBitBtn
          Left = 177
          Top = 296
          Width = 75
          Height = 25
          Caption = '&OK'
          TabOrder = 5
          OnClick = BitBtn57Click
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
        object BitBtn58: TBitBtn
          Left = 258
          Top = 296
          Width = 75
          Height = 25
          Caption = '&Cancela'
          TabOrder = 6
          OnClick = BitBtn58Click
          Glyph.Data = {
            12020000424D1202000000000000120100002800000010000000100000000100
            08000000000000010000120B0000120B0000370000003700000000000000FFFF
            FF00FF00FF001442E4001645EB001C4BE7000430EB000C35E4000E3CEB001037
            DB000027EB00002AEB000027E400012CEB00052BDC00062DE300092ED9000022
            EB000021E7000020E200001FDC000022DC000020D900001EEB00001FEB000020
            EB00001DE800001BE300001EE200001FE200001BDF00001CDF00001AEB00001A
            E2000017DF000019DF00001ADF000011EB000016EB000012E6000010DC000013
            DC000010D9000009EB00000BEB000008EA000008E700000ADF000004E2000005
            E2000004DF000005DF000003DB000004DA0000006E0002020202020202020202
            0202020202020202020202020202020202020202020202020236360202020202
            0236360202020202361A28360202020236302E36020202023621182A36020236
            332B34360202020202362419293636312C353602020202020202361E11272D2B
            3236020202020202020202361B26252F36020202020202020202023612172022
            36020202020202020202360F06131C0A2336020202020202023607080E363614
            0B1F3602020202023603041036020236160D1D36020202023605093602020202
            36150C3602020202023636020202020202363602020202020202020202020202
            02020202020202020202020202020202020202020202}
        end
        object GroupBox2: TGroupBox
          Left = 16
          Top = 114
          Width = 481
          Height = 181
          Caption = 'Vendedores'
          TabOrder = 7
          object DBGrid3: TDBGrid
            Left = 2
            Top = 15
            Width = 477
            Height = 139
            Align = alTop
            DataSource = dtmEstoqueFechado.dsUsuario
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ReadOnly = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'COD_VENDEDOR'
                Title.Caption = 'C'#243'digo'
                Width = 40
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NOME_VENDEDOR'
                Title.Caption = 'Nome Colaborador'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DESC_FUNCAO'
                Title.Caption = 'Fun'#231#227'o'
                Visible = True
              end>
          end
          object CheckBox1: TCheckBox
            Left = 111
            Top = 160
            Width = 136
            Height = 17
            Caption = 'Todos Colaboradores'
            TabOrder = 1
          end
        end
        object ComboBox4: TComboBox
          Left = 333
          Top = 51
          Width = 145
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          ItemIndex = 0
          TabOrder = 8
          Text = 'CODIGO'
          Items.Strings = (
            'CODIGO'
            'DESCRICAO'
            'LOCACAO1'
            'LOCACAO2')
        end
      end
    end
    object tsRelMovProd: TTabSheet
      Caption = 'tsRelMovProd'
      ImageIndex = 3
      object qkRMovProd: TQuickRep
        Left = 76
        Top = -11
        Width = 1123
        Height = 794
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        DataSet = dtmEstoqueFechado.qrRelMovProd
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Functions.Strings = (
          'PAGENUMBER'
          'COLUMNNUMBER'
          'REPORTTITLE')
        Functions.DATA = (
          '0'
          '0'
          #39#39)
        Options = [FirstPageHeader, LastPageFooter]
        Page.Columns = 1
        Page.Orientation = poLandscape
        Page.PaperSize = A4
        Page.Values = (
          100.000000000000000000
          2100.000000000000000000
          100.000000000000000000
          2970.000000000000000000
          100.000000000000000000
          100.000000000000000000
          0.000000000000000000)
        PrinterSettings.Copies = 1
        PrinterSettings.OutputBin = Auto
        PrinterSettings.Duplex = False
        PrinterSettings.FirstPage = 0
        PrinterSettings.LastPage = 0
        PrinterSettings.UseStandardprinter = False
        PrinterSettings.UseCustomBinCode = False
        PrinterSettings.CustomBinCode = 0
        PrinterSettings.ExtendedDuplex = 0
        PrinterSettings.UseCustomPaperCode = False
        PrinterSettings.CustomPaperCode = 0
        PrinterSettings.PrintMetaFile = False
        PrinterSettings.PrintQuality = 0
        PrinterSettings.Collate = 0
        PrinterSettings.ColorOption = 0
        PrintIfEmpty = True
        ReportTitle = 'Relat'#243'rio de Movimenta'#231#227'o por Produto'
        SnapToGrid = True
        Units = MM
        Zoom = 100
        PrevFormStyle = fsStayOnTop
        PreviewInitialState = wsNormal
        PrevInitialZoom = qrZoomToFit
        PreviewDefaultSaveType = stQRP
        object TitleBand1: TQRBand
          Left = 38
          Top = 38
          Width = 1047
          Height = 116
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          AlignToBottom = False
          Color = clWhite
          TransparentBand = False
          ForceNewColumn = False
          ForceNewPage = False
          Size.Values = (
            306.916666666666700000
            2770.187500000000000000)
          PreCaluculateBandHeight = False
          KeepOnOnePage = False
          BandType = rbTitle
          object QRSysData1: TQRSysData
            Left = 4
            Top = 68
            Width = 1037
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.979166666666670000
              10.583333333333330000
              179.916666666666700000
              2743.729166666667000000)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            Color = clWhite
            Data = qrsReportTitle
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            FontSize = 10
          end
          object QRLabel1: TQRLabel
            Left = 12
            Top = 46
            Width = 27
            Height = 16
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              42.333333333333340000
              31.750000000000000000
              121.708333333333300000
              71.437500000000000000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'CEP:'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
            WordWrap = True
            ExportAs = exptText
            FontSize = 9
          end
          object QRLabel2: TQRLabel
            Left = 356
            Top = 46
            Width = 31
            Height = 16
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              42.333333333333340000
              941.916666666666800000
              121.708333333333300000
              82.020833333333340000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Fone:'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
            WordWrap = True
            ExportAs = exptText
            FontSize = 9
          end
          object qrLperiodoMov: TQRLabel
            Left = 413
            Top = 91
            Width = 217
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.979166666666670000
              1092.729166666667000000
              240.770833333333300000
              574.145833333333400000)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Per'#237'odo De: 00/00/0000 at'#233' 99/99/9999'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
            WordWrap = True
            ExportAs = exptText
            FontSize = 9
          end
          object QRHRule1: TQRHRule
            Left = 4
            Top = 104
            Width = 1037
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              26.458333333333330000
              10.583333333333330000
              275.166666666666700000
              2743.729166666667000000)
            VertAdjust = 0
          end
          object lbEmpresa: TQRLabel
            Left = 12
            Top = 8
            Width = 62
            Height = 16
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              42.333333333333340000
              31.750000000000000000
              21.166666666666670000
              164.041666666666700000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'lbEmpresa'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            OnPrint = lbEmpresaPrint
            ParentFont = False
            Transparent = False
            WordWrap = True
            ExportAs = exptText
            FontSize = 9
          end
          object lbendereco: TQRLabel
            Left = 12
            Top = 27
            Width = 65
            Height = 16
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              42.333333333333340000
              31.750000000000000000
              71.437500000000000000
              171.979166666666700000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'lbEndereco'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            OnPrint = lbenderecoPrint
            ParentFont = False
            Transparent = False
            WordWrap = True
            ExportAs = exptText
            FontSize = 9
          end
          object lbCep: TQRLabel
            Left = 47
            Top = 46
            Width = 33
            Height = 16
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              42.333333333333340000
              124.354166666666700000
              121.708333333333300000
              87.312500000000000000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'lbCep'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            OnPrint = lbCepPrint
            ParentFont = False
            Transparent = False
            WordWrap = True
            ExportAs = exptText
            FontSize = 9
          end
          object lbCNPJ: TQRLabel
            Left = 548
            Top = 46
            Width = 42
            Height = 16
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              42.333333333333340000
              1449.916666666667000000
              121.708333333333300000
              111.125000000000000000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'lbCNPJ'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            OnPrint = lbCNPJPrint
            ParentFont = False
            Transparent = False
            WordWrap = True
            ExportAs = exptText
            FontSize = 9
          end
          object lbCidade: TQRLabel
            Left = 548
            Top = 27
            Width = 50
            Height = 16
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              42.333333333333340000
              1449.916666666667000000
              71.437500000000000000
              132.291666666666700000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'lbCidade'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            OnPrint = lbCidadePrint
            ParentFont = False
            Transparent = False
            WordWrap = True
            ExportAs = exptText
            FontSize = 9
          end
          object lbFone: TQRLabel
            Left = 394
            Top = 46
            Width = 38
            Height = 16
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              42.333333333333340000
              1042.458333333333000000
              121.708333333333300000
              100.541666666666700000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'lbFone'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            OnPrint = lbFonePrint
            ParentFont = False
            Transparent = False
            WordWrap = True
            ExportAs = exptText
            FontSize = 9
          end
          object lbBairro: TQRLabel
            Left = 394
            Top = 27
            Width = 46
            Height = 16
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              42.333333333333340000
              1042.458333333333000000
              71.437500000000000000
              121.708333333333300000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'lbBairro'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            OnPrint = lbBairroPrint
            ParentFont = False
            Transparent = False
            WordWrap = True
            ExportAs = exptText
            FontSize = 9
          end
        end
        object ColumnHeaderBand1: TQRBand
          Left = 38
          Top = 154
          Width = 1047
          Height = 40
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          AlignToBottom = False
          Color = clWhite
          TransparentBand = False
          ForceNewColumn = False
          ForceNewPage = False
          Size.Values = (
            105.833333333333300000
            2770.187500000000000000)
          PreCaluculateBandHeight = False
          KeepOnOnePage = False
          BandType = rbColumnHeader
          object QRSysData2: TQRSysData
            Left = 992
            Top = 0
            Width = 45
            Height = 16
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              42.333333333333340000
              2624.666666666667000000
              0.000000000000000000
              119.062500000000000000)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = True
            Color = clWhite
            Data = qrsPageNumber
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            FontSize = 9
          end
          object QRLabel4: TQRLabel
            Left = 4
            Top = 23
            Width = 46
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.979166666666670000
              10.583333333333330000
              60.854166666666680000
              121.708333333333300000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'C'#243'digo'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
            WordWrap = True
            ExportAs = exptText
            FontSize = 10
          end
          object QRLabel5: TQRLabel
            Left = 88
            Top = 24
            Width = 115
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.979166666666670000
              232.833333333333400000
              63.500000000000000000
              304.270833333333400000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Descri'#231#227'o do Item'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
            WordWrap = True
            ExportAs = exptText
            FontSize = 10
          end
          object QRLabel6: TQRLabel
            Left = 440
            Top = 24
            Width = 48
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.979166666666670000
              1164.166666666667000000
              63.500000000000000000
              127.000000000000000000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Qtde At'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
            WordWrap = True
            ExportAs = exptText
            FontSize = 10
          end
          object QRLabel7: TQRLabel
            Left = 520
            Top = 24
            Width = 52
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.979166666666670000
              1375.833333333333000000
              63.500000000000000000
              137.583333333333300000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Qtde NT'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
            WordWrap = True
            ExportAs = exptText
            FontSize = 10
          end
          object QRLabel8: TQRLabel
            Left = 613
            Top = 24
            Width = 60
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.979166666666670000
              1621.895833333333000000
              63.500000000000000000
              158.750000000000000000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Qtde Entr'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
            WordWrap = True
            ExportAs = exptText
            FontSize = 10
          end
          object QRLabel9: TQRLabel
            Left = 696
            Top = 24
            Width = 72
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.979166666666670000
              1841.500000000000000000
              63.500000000000000000
              190.500000000000000000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Estoque AT'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
            WordWrap = True
            ExportAs = exptText
            FontSize = 10
          end
          object QRLabel10: TQRLabel
            Left = 788
            Top = 24
            Width = 54
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.979166666666670000
              2084.916666666667000000
              63.500000000000000000
              142.875000000000000000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Contado'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
            WordWrap = True
            ExportAs = exptText
            FontSize = 10
          end
          object QRLabel11: TQRLabel
            Left = 876
            Top = 24
            Width = 66
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.979166666666670000
              2317.750000000000000000
              63.500000000000000000
              174.625000000000000000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Loca'#231#227'o 1'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
            WordWrap = True
            ExportAs = exptText
            FontSize = 10
          end
          object QRLabel12: TQRLabel
            Left = 971
            Top = 24
            Width = 66
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.979166666666670000
              2569.104166666667000000
              63.500000000000000000
              174.625000000000000000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Loca'#231#227'o 2'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
            WordWrap = True
            ExportAs = exptText
            FontSize = 10
          end
          object QRLabel27: TQRLabel
            Left = 943
            Top = 1
            Width = 43
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.979166666666670000
              2495.020833333333000000
              2.645833333333333000
              113.770833333333300000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'P'#225'gina:'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
            WordWrap = True
            ExportAs = exptText
            FontSize = 9
          end
        end
        object DetailBand1: TQRBand
          Left = 38
          Top = 194
          Width = 1047
          Height = 19
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          AlignToBottom = False
          Color = clWhite
          TransparentBand = False
          ForceNewColumn = False
          ForceNewPage = False
          Size.Values = (
            50.270833333333330000
            2770.187500000000000000)
          PreCaluculateBandHeight = False
          KeepOnOnePage = False
          BandType = rbDetail
          object QRDBText8: TQRDBText
            Left = 4
            Top = 4
            Width = 71
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.687500000000000000
              10.583333333333330000
              10.583333333333330000
              187.854166666666700000)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            DataSet = dtmEstoqueFechado.qrRelMovProd
            DataField = 'NUM_FAB_PROD'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            WordWrap = True
            ExportAs = exptText
            FontSize = 8
          end
          object QRDBText9: TQRDBText
            Left = 88
            Top = 4
            Width = 94
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.687500000000000000
              232.833333333333400000
              10.583333333333330000
              248.708333333333300000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Color = clWhite
            DataSet = dtmEstoqueFechado.qrRelMovProd
            DataField = 'DESCR_PROD_PED'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            WordWrap = True
            ExportAs = exptText
            FontSize = 8
          end
          object QRDBText10: TQRDBText
            Left = 451
            Top = 4
            Width = 35
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.687500000000000000
              1193.270833333333000000
              10.583333333333330000
              92.604166666666680000)
            Alignment = taRightJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Color = clWhite
            DataSet = dtmEstoqueFechado.qrRelMovProd
            DataField = 'ATEND'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            WordWrap = True
            ExportAs = exptText
            FontSize = 8
          end
          object QRDBText11: TQRDBText
            Left = 514
            Top = 4
            Width = 58
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.687500000000000000
              1359.958333333333000000
              10.583333333333330000
              153.458333333333300000)
            Alignment = taRightJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Color = clWhite
            DataSet = dtmEstoqueFechado.qrRelMovProd
            DataField = 'NAOATEND'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            WordWrap = True
            ExportAs = exptText
            FontSize = 8
          end
          object QRDBText12: TQRDBText
            Left = 938
            Top = 4
            Width = 99
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.687500000000000000
              2481.791666666667000000
              10.583333333333330000
              261.937500000000000000)
            Alignment = taRightJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Color = clWhite
            DataSet = dtmEstoqueFechado.qrRelMovProd
            DataField = 'LOCACAO_PROD_1'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            WordWrap = True
            ExportAs = exptText
            FontSize = 8
          end
          object QRDBText13: TQRDBText
            Left = 621
            Top = 4
            Width = 52
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.687500000000000000
              1643.062500000000000000
              10.583333333333330000
              137.583333333333300000)
            Alignment = taRightJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Color = clWhite
            DataSet = dtmEstoqueFechado.qrRelMovProd
            DataField = 'COMPRAS'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            WordWrap = True
            ExportAs = exptText
            FontSize = 8
          end
          object QRDBText14: TQRDBText
            Left = 855
            Top = 4
            Width = 87
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.687500000000000000
              2262.187500000000000000
              10.583333333333330000
              230.187500000000000000)
            Alignment = taRightJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Color = clWhite
            DataSet = dtmEstoqueFechado.qrRelMovProd
            DataField = 'LOCACAO_PROD'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            WordWrap = True
            ExportAs = exptText
            FontSize = 8
          end
          object qrLEstAt: TQRLabel
            Left = 722
            Top = 4
            Width = 43
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.687500000000000000
              1910.291666666667000000
              10.583333333333330000
              113.770833333333300000)
            Alignment = taRightJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'qrLEstAt'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            WordWrap = True
            ExportAs = exptText
            FontSize = 8
          end
          object QRLabel14: TQRLabel
            Left = 792
            Top = 4
            Width = 49
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.687500000000000000
              2095.500000000000000000
              10.583333333333330000
              129.645833333333300000)
            Alignment = taRightJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = '________'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            WordWrap = True
            ExportAs = exptText
            FontSize = 8
          end
        end
        object PageFooterBand1: TQRBand
          Left = 38
          Top = 213
          Width = 1047
          Height = 11
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          AlignToBottom = False
          Color = clWhite
          TransparentBand = False
          ForceNewColumn = False
          ForceNewPage = False
          Size.Values = (
            29.104166666666670000
            2770.187500000000000000)
          PreCaluculateBandHeight = False
          KeepOnOnePage = False
          BandType = rbPageFooter
        end
      end
    end
    object tsRelRelacAtend: TTabSheet
      Caption = 'tsRelRelacAtend'
      ImageIndex = 4
      object qkRRelacAtend: TQuickRep
        Left = 3
        Top = -11
        Width = 1123
        Height = 794
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        DataSet = dtmEstoqueFechado.qrRelRelaAten
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Functions.Strings = (
          'PAGENUMBER'
          'COLUMNNUMBER'
          'REPORTTITLE')
        Functions.DATA = (
          '0'
          '0'
          #39#39)
        Options = [FirstPageHeader, LastPageFooter]
        Page.Columns = 1
        Page.Orientation = poLandscape
        Page.PaperSize = A4
        Page.Values = (
          100.000000000000000000
          2100.000000000000000000
          100.000000000000000000
          2970.000000000000000000
          100.000000000000000000
          100.000000000000000000
          0.000000000000000000)
        PrinterSettings.Copies = 1
        PrinterSettings.OutputBin = Auto
        PrinterSettings.Duplex = False
        PrinterSettings.FirstPage = 0
        PrinterSettings.LastPage = 0
        PrinterSettings.UseStandardprinter = False
        PrinterSettings.UseCustomBinCode = False
        PrinterSettings.CustomBinCode = 0
        PrinterSettings.ExtendedDuplex = 0
        PrinterSettings.UseCustomPaperCode = False
        PrinterSettings.CustomPaperCode = 0
        PrinterSettings.PrintMetaFile = False
        PrinterSettings.PrintQuality = 0
        PrinterSettings.Collate = 0
        PrinterSettings.ColorOption = 0
        PrintIfEmpty = True
        ReportTitle = 'Relat'#243'rio de Rela'#231#227'o de Atendimentos'
        SnapToGrid = True
        Units = MM
        Zoom = 100
        PrevFormStyle = fsStayOnTop
        PreviewInitialState = wsNormal
        PrevInitialZoom = qrZoomToFit
        PreviewDefaultSaveType = stQRP
        object TitleBand2: TQRBand
          Left = 38
          Top = 38
          Width = 1047
          Height = 115
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          AlignToBottom = False
          Color = clWhite
          TransparentBand = False
          ForceNewColumn = False
          ForceNewPage = False
          Size.Values = (
            304.270833333333400000
            2770.187500000000000000)
          PreCaluculateBandHeight = False
          KeepOnOnePage = False
          BandType = rbTitle
          object QRSysData3: TQRSysData
            Left = 4
            Top = 68
            Width = 1037
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.979166666666670000
              10.583333333333330000
              179.916666666666700000
              2743.729166666667000000)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            Color = clWhite
            Data = qrsReportTitle
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            FontSize = 10
          end
          object qrLPeriodoAtend: TQRLabel
            Left = 413
            Top = 91
            Width = 217
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.979166666666670000
              1092.729166666667000000
              240.770833333333300000
              574.145833333333400000)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Per'#237'odo De: 00/00/0000 at'#233' 99/99/9999'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
            WordWrap = True
            ExportAs = exptText
            FontSize = 9
          end
          object QRHRule2: TQRHRule
            Left = 4
            Top = 104
            Width = 1037
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              26.458333333333330000
              10.583333333333330000
              275.166666666666700000
              2743.729166666667000000)
            VertAdjust = 0
          end
          object QRLabel3: TQRLabel
            Left = 12
            Top = 46
            Width = 27
            Height = 16
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              42.333333333333340000
              31.750000000000000000
              121.708333333333300000
              71.437500000000000000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'CEP:'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
            WordWrap = True
            ExportAs = exptText
            FontSize = 9
          end
          object QRLabel15: TQRLabel
            Left = 356
            Top = 46
            Width = 31
            Height = 16
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              42.333333333333340000
              941.916666666666800000
              121.708333333333300000
              82.020833333333340000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Fone:'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
            WordWrap = True
            ExportAs = exptText
            FontSize = 9
          end
          object QRLabel16: TQRLabel
            Left = 12
            Top = 8
            Width = 62
            Height = 16
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              42.333333333333340000
              31.750000000000000000
              21.166666666666670000
              164.041666666666700000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'lbEmpresa'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            OnPrint = lbEmpresaPrint
            ParentFont = False
            Transparent = False
            WordWrap = True
            ExportAs = exptText
            FontSize = 9
          end
          object QRLabel17: TQRLabel
            Left = 12
            Top = 27
            Width = 65
            Height = 16
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              42.333333333333340000
              31.750000000000000000
              71.437500000000000000
              171.979166666666700000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'lbEndereco'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            OnPrint = lbenderecoPrint
            ParentFont = False
            Transparent = False
            WordWrap = True
            ExportAs = exptText
            FontSize = 9
          end
          object QRLabel30: TQRLabel
            Left = 47
            Top = 46
            Width = 33
            Height = 16
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              42.333333333333340000
              124.354166666666700000
              121.708333333333300000
              87.312500000000000000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'lbCep'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            OnPrint = lbCepPrint
            ParentFont = False
            Transparent = False
            WordWrap = True
            ExportAs = exptText
            FontSize = 9
          end
          object QRLabel31: TQRLabel
            Left = 548
            Top = 46
            Width = 42
            Height = 16
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              42.333333333333340000
              1449.916666666667000000
              121.708333333333300000
              111.125000000000000000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'lbCNPJ'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            OnPrint = lbCNPJPrint
            ParentFont = False
            Transparent = False
            WordWrap = True
            ExportAs = exptText
            FontSize = 9
          end
          object QRLabel32: TQRLabel
            Left = 548
            Top = 27
            Width = 50
            Height = 16
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              42.333333333333340000
              1449.916666666667000000
              71.437500000000000000
              132.291666666666700000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'lbCidade'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            OnPrint = lbCidadePrint
            ParentFont = False
            Transparent = False
            WordWrap = True
            ExportAs = exptText
            FontSize = 9
          end
          object QRLabel33: TQRLabel
            Left = 394
            Top = 46
            Width = 38
            Height = 16
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              42.333333333333340000
              1042.458333333333000000
              121.708333333333300000
              100.541666666666700000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'lbFone'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            OnPrint = lbFonePrint
            ParentFont = False
            Transparent = False
            WordWrap = True
            ExportAs = exptText
            FontSize = 9
          end
          object QRLabel34: TQRLabel
            Left = 394
            Top = 27
            Width = 46
            Height = 16
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              42.333333333333340000
              1042.458333333333000000
              71.437500000000000000
              121.708333333333300000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'lbBairro'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            OnPrint = lbBairroPrint
            ParentFont = False
            Transparent = False
            WordWrap = True
            ExportAs = exptText
            FontSize = 9
          end
        end
        object ColumnHeaderBand2: TQRBand
          Left = 38
          Top = 153
          Width = 1047
          Height = 48
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          AlignToBottom = False
          Color = clWhite
          TransparentBand = False
          ForceNewColumn = False
          ForceNewPage = False
          Size.Values = (
            127.000000000000000000
            2770.187500000000000000)
          PreCaluculateBandHeight = False
          KeepOnOnePage = False
          BandType = rbColumnHeader
          object QRSysData4: TQRSysData
            Left = 992
            Top = 0
            Width = 45
            Height = 16
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              42.333333333333340000
              2624.666666666667000000
              0.000000000000000000
              119.062500000000000000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            Color = clWhite
            Data = qrsPageNumber
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
            ExportAs = exptText
            FontSize = 9
          end
          object QRLabel18: TQRLabel
            Left = 4
            Top = 23
            Width = 46
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.979166666666670000
              10.583333333333330000
              60.854166666666680000
              121.708333333333300000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'C'#243'digo'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
            WordWrap = True
            ExportAs = exptText
            FontSize = 10
          end
          object QRLabel19: TQRLabel
            Left = 88
            Top = 24
            Width = 115
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.979166666666670000
              232.833333333333400000
              63.500000000000000000
              304.270833333333400000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Descri'#231#227'o do Item'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
            WordWrap = True
            ExportAs = exptText
            FontSize = 10
          end
          object QRLabel20: TQRLabel
            Left = 416
            Top = 24
            Width = 31
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.979166666666670000
              1100.666666666667000000
              63.500000000000000000
              82.020833333333340000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Qtde'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
            WordWrap = True
            ExportAs = exptText
            FontSize = 10
          end
          object QRLabel21: TQRLabel
            Left = 455
            Top = 24
            Width = 51
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.979166666666670000
              1203.854166666667000000
              63.500000000000000000
              134.937500000000000000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'REQ/OS'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
            WordWrap = True
            ExportAs = exptText
            FontSize = 10
          end
          object QRLabel22: TQRLabel
            Left = 571
            Top = 24
            Width = 71
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.979166666666670000
              1510.770833333333000000
              63.500000000000000000
              187.854166666666700000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Data Atend'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
            WordWrap = True
            ExportAs = exptText
            FontSize = 10
          end
          object QRLabel23: TQRLabel
            Left = 645
            Top = 24
            Width = 72
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.979166666666670000
              1706.562500000000000000
              63.500000000000000000
              190.500000000000000000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Hora Atend'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
            WordWrap = True
            ExportAs = exptText
            FontSize = 10
          end
          object QRLabel24: TQRLabel
            Left = 724
            Top = 24
            Width = 63
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.979166666666670000
              1915.583333333333000000
              63.500000000000000000
              166.687500000000000000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Vendedor'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
            WordWrap = True
            ExportAs = exptText
            FontSize = 10
          end
          object QRLabel25: TQRLabel
            Left = 876
            Top = 24
            Width = 66
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.979166666666670000
              2317.750000000000000000
              63.500000000000000000
              174.625000000000000000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Loca'#231#227'o 1'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
            WordWrap = True
            ExportAs = exptText
            FontSize = 10
          end
          object QRLabel26: TQRLabel
            Left = 971
            Top = 24
            Width = 66
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.979166666666670000
              2569.104166666667000000
              63.500000000000000000
              174.625000000000000000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Loca'#231#227'o 2'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
            WordWrap = True
            ExportAs = exptText
            FontSize = 10
          end
          object QRLabel13: TQRLabel
            Left = 943
            Top = 1
            Width = 43
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.979166666666670000
              2495.020833333333000000
              2.645833333333333000
              113.770833333333300000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'P'#225'gina:'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
            WordWrap = True
            ExportAs = exptText
            FontSize = 9
          end
          object QRLabel28: TQRLabel
            Left = 513
            Top = 25
            Width = 51
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.979166666666670000
              1357.312500000000000000
              66.145833333333340000
              134.937500000000000000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'N'#250'mero'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
            WordWrap = True
            ExportAs = exptText
            FontSize = 10
          end
          object QRLabel29: TQRLabel
            Left = 340
            Top = 25
            Width = 47
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.979166666666670000
              899.583333333333400000
              66.145833333333340000
              124.354166666666700000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Sit. Atd'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
            WordWrap = True
            ExportAs = exptText
            FontSize = 10
          end
        end
        object DetailBand2: TQRBand
          Left = 38
          Top = 201
          Width = 1047
          Height = 19
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          AlignToBottom = False
          Color = clWhite
          TransparentBand = False
          ForceNewColumn = False
          ForceNewPage = False
          Size.Values = (
            50.270833333333330000
            2770.187500000000000000)
          PreCaluculateBandHeight = False
          KeepOnOnePage = False
          BandType = rbDetail
          object QRDBText22: TQRDBText
            Left = 394
            Top = 2
            Width = 53
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.687500000000000000
              1042.458333333333000000
              5.291666666666667000
              140.229166666666700000)
            Alignment = taRightJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            DataSet = dtmEstoqueFechado.qrRelRelaAten
            DataField = 'QUANT_PED_ITEM'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            WordWrap = True
            ExportAs = exptText
            FontSize = 8
          end
          object QRDBText23: TQRDBText
            Left = 457
            Top = 2
            Width = 52
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.687500000000000000
              1209.145833333333000000
              5.291666666666667000
              137.583333333333300000)
            Alignment = taRightJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            DataSet = dtmEstoqueFechado.qrRelRelaAten
            DataField = 'TIPO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            WordWrap = True
            ExportAs = exptText
            FontSize = 8
          end
          object QRDBText24: TQRDBText
            Left = 587
            Top = 2
            Width = 57
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.687500000000000000
              1553.104166666667000000
              5.291666666666667000
              150.812500000000000000)
            Alignment = taRightJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Color = clWhite
            DataSet = dtmEstoqueFechado.qrRelRelaAten
            DataField = 'DATA_ATD'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            WordWrap = True
            ExportAs = exptText
            FontSize = 8
          end
          object QRDBText25: TQRDBText
            Left = 661
            Top = 2
            Width = 58
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.687500000000000000
              1748.895833333334000000
              5.291666666666667000
              153.458333333333300000)
            Alignment = taRightJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Color = clWhite
            DataSet = dtmEstoqueFechado.qrRelRelaAten
            DataField = 'HORA_ATD'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            WordWrap = True
            ExportAs = exptText
            FontSize = 8
          end
          object QRDBText26: TQRDBText
            Left = 726
            Top = 2
            Width = 92
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.687500000000000000
              1920.875000000000000000
              5.291666666666667000
              243.416666666666700000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Color = clWhite
            DataSet = dtmEstoqueFechado.qrRelRelaAten
            DataField = 'NOME_VENDEDOR'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            WordWrap = True
            ExportAs = exptText
            FontSize = 8
          end
          object QRDBText27: TQRDBText
            Left = 855
            Top = 2
            Width = 87
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.687500000000000000
              2262.187500000000000000
              5.291666666666667000
              230.187500000000000000)
            Alignment = taRightJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Color = clWhite
            DataSet = dtmEstoqueFechado.qrRelRelaAten
            DataField = 'LOCACAO_PROD'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            WordWrap = True
            ExportAs = exptText
            FontSize = 8
          end
          object QRDBText28: TQRDBText
            Left = 938
            Top = 2
            Width = 99
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.687500000000000000
              2481.791666666667000000
              5.291666666666667000
              261.937500000000000000)
            Alignment = taRightJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Color = clWhite
            DataSet = dtmEstoqueFechado.qrRelRelaAten
            DataField = 'LOCACAO_PROD_1'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            WordWrap = True
            ExportAs = exptText
            FontSize = 8
          end
          object QRDBText21: TQRDBText
            Left = 4
            Top = 2
            Width = 71
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.687500000000000000
              10.583333333333330000
              5.291666666666667000
              187.854166666666700000)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            DataSet = dtmEstoqueFechado.qrRelRelaAten
            DataField = 'NUM_FAB_PROD'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            WordWrap = True
            ExportAs = exptText
            FontSize = 8
          end
          object QRDBText29: TQRDBText
            Left = 88
            Top = 2
            Width = 247
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.687500000000000000
              232.833333333333300000
              5.291666666666667000
              653.520833333333200000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            DataSet = dtmEstoqueFechado.qrRelRelaAten
            DataField = 'DESCR_PROD_PED'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            WordWrap = True
            ExportAs = exptText
            FontSize = 8
          end
          object QRDBText30: TQRDBText
            Left = 515
            Top = 2
            Width = 52
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.687500000000000000
              1362.604166666667000000
              5.291666666666667000
              137.583333333333300000)
            Alignment = taRightJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            DataSet = dtmEstoqueFechado.qrRelRelaAten
            DataField = 'NPED'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            WordWrap = True
            ExportAs = exptText
            FontSize = 8
          end
          object QRDBText31: TQRDBText
            Left = 341
            Top = 0
            Width = 47
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.687500000000000000
              902.229166666666800000
              0.000000000000000000
              124.354166666666700000)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            DataSet = dtmEstoqueFechado.qrRelRelaAten
            DataField = 'SIT_ATD'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            WordWrap = True
            ExportAs = exptText
            FontSize = 8
          end
        end
        object PageFooterBand2: TQRBand
          Left = 38
          Top = 220
          Width = 1047
          Height = 40
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          AlignToBottom = False
          Color = clWhite
          TransparentBand = False
          ForceNewColumn = False
          ForceNewPage = False
          Size.Values = (
            105.833333333333300000
            2770.187500000000000000)
          PreCaluculateBandHeight = False
          KeepOnOnePage = False
          BandType = rbPageFooter
        end
      end
    end
    object tsOrdenarRel: TTabSheet
      Caption = 'tsOrdenarRel'
      ImageIndex = 6
      object pnAlmoxarifadoOrdenarRel: TPanel
        Left = 0
        Top = 0
        Width = 321
        Height = 252
        BevelKind = bkTile
        BevelOuter = bvNone
        TabOrder = 0
        object BitBtn25: TBitBtn
          Left = 16
          Top = 36
          Width = 282
          Height = 28
          Hint = 'Ordenar relat'#243'rio por situa'#231#227'o.'
          Caption = '&Situa'#231#227'o'
          TabOrder = 1
          OnClick = BitBtn25Click
          Glyph.Data = {
            36050000424D3605000000000000360400002800000010000000100000000100
            08000000000000010000320B0000320B00000001000000010000EFA54A00C684
            6B00BD8C7300CE947300EFB57300FFC67300BD847B00C6947B00B5848400B58C
            8400CE9C8400B5948C00C6A59400EFCE9400C6A59C00EFCE9C00F7D69C00C6AD
            A500F7D6A500CEB5AD00D6B5AD00C6BDAD00F7D6AD00D6BDB500DEBDB500DEC6
            B500E7C6B500EFCEB500F7D6B500F7DEB500EFCEBD00F7DEBD00E7DEC600F7DE
            C600F7E7C600E7CECE00E7D6CE00F7E7CE00F7E7D600FFEFD600FFEFDE00FFEF
            E700FFF7E700FFF7EF00FFF7F700FFFFF700FF00FF00FFFFFF00FFFFFF00FFFF
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
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF002E2E08080808
            0808080808080808082E2E2E0E27221F1D16120F0D0D0D10082E2E2E0E270E0E
            0E0E0E0E0E0E0E0F082E2E2E11292625211F1C160F0F0D0F082E2E2E112A2625
            22211D1C160F0F0D082E2E2E132D0E0E0E0E0E0E0E0E0E0F082E2E2E142F2B29
            262522211F161212082E2E2E172F2C2B28262522211F1C16082E2E2E172F0E0E
            0E0E0E0E0E0E0E1D082E2E2E182F2F2F2C2928262521211C082E2E2E192F2F2F
            2F2C292828272015082E2E2E1A2F0E0E0E0E0E2B260C0B09082E2E2E1A2F2F2F
            2F2F2F2D23020400012E2E2E1E2F2F2F2F2F2F2F240705032E2E2E2E1A2C2B2B
            2B2B2B2B23070A2E2E2E2E2E1A1B1B1B1B1A1A1B17062E2E2E2E}
        end
        object BitBtn26: TBitBtn
          Left = 16
          Top = 215
          Width = 282
          Height = 28
          Hint = 'Voltar'
          Caption = '&Voltar (Esc)'
          ModalResult = 2
          TabOrder = 6
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
        object BitBtn27: TBitBtn
          Left = 16
          Top = 70
          Width = 282
          Height = 28
          Hint = 'Ordenar relat'#243'rio por  descri'#231#227'o produto.'
          Caption = '&Descr. Prod'
          TabOrder = 2
          OnClick = BitBtn27Click
          Glyph.Data = {
            36050000424D3605000000000000360400002800000010000000100000000100
            08000000000000010000320B0000320B00000001000000010000EFA54A00C684
            6B00BD8C7300CE947300EFB57300FFC67300BD847B00C6947B00B5848400B58C
            8400CE9C8400B5948C00C6A59400EFCE9400C6A59C00EFCE9C00F7D69C00C6AD
            A500F7D6A500CEB5AD00D6B5AD00C6BDAD00F7D6AD00D6BDB500DEBDB500DEC6
            B500E7C6B500EFCEB500F7D6B500F7DEB500EFCEBD00F7DEBD00E7DEC600F7DE
            C600F7E7C600E7CECE00E7D6CE00F7E7CE00F7E7D600FFEFD600FFEFDE00FFEF
            E700FFF7E700FFF7EF00FFF7F700FFFFF700FF00FF00FFFFFF00FFFFFF00FFFF
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
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF002E2E08080808
            0808080808080808082E2E2E0E27221F1D16120F0D0D0D10082E2E2E0E270E0E
            0E0E0E0E0E0E0E0F082E2E2E11292625211F1C160F0F0D0F082E2E2E112A2625
            22211D1C160F0F0D082E2E2E132D0E0E0E0E0E0E0E0E0E0F082E2E2E142F2B29
            262522211F161212082E2E2E172F2C2B28262522211F1C16082E2E2E172F0E0E
            0E0E0E0E0E0E0E1D082E2E2E182F2F2F2C2928262521211C082E2E2E192F2F2F
            2F2C292828272015082E2E2E1A2F0E0E0E0E0E2B260C0B09082E2E2E1A2F2F2F
            2F2F2F2D23020400012E2E2E1E2F2F2F2F2F2F2F240705032E2E2E2E1A2C2B2B
            2B2B2B2B23070A2E2E2E2E2E1A1B1B1B1B1A1A1B17062E2E2E2E}
        end
        object BitBtn28: TBitBtn
          Left = 16
          Top = 104
          Width = 282
          Height = 28
          Hint = 'Ordenar relat'#243'rio por loca'#231#227'o 1.'
          Caption = '&Loca'#231#227'o 1'
          TabOrder = 3
          OnClick = BitBtn28Click
          Glyph.Data = {
            36050000424D3605000000000000360400002800000010000000100000000100
            08000000000000010000320B0000320B00000001000000010000EFA54A00C684
            6B00BD8C7300CE947300EFB57300FFC67300BD847B00C6947B00B5848400B58C
            8400CE9C8400B5948C00C6A59400EFCE9400C6A59C00EFCE9C00F7D69C00C6AD
            A500F7D6A500CEB5AD00D6B5AD00C6BDAD00F7D6AD00D6BDB500DEBDB500DEC6
            B500E7C6B500EFCEB500F7D6B500F7DEB500EFCEBD00F7DEBD00E7DEC600F7DE
            C600F7E7C600E7CECE00E7D6CE00F7E7CE00F7E7D600FFEFD600FFEFDE00FFEF
            E700FFF7E700FFF7EF00FFF7F700FFFFF700FF00FF00FFFFFF00FFFFFF00FFFF
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
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF002E2E08080808
            0808080808080808082E2E2E0E27221F1D16120F0D0D0D10082E2E2E0E270E0E
            0E0E0E0E0E0E0E0F082E2E2E11292625211F1C160F0F0D0F082E2E2E112A2625
            22211D1C160F0F0D082E2E2E132D0E0E0E0E0E0E0E0E0E0F082E2E2E142F2B29
            262522211F161212082E2E2E172F2C2B28262522211F1C16082E2E2E172F0E0E
            0E0E0E0E0E0E0E1D082E2E2E182F2F2F2C2928262521211C082E2E2E192F2F2F
            2F2C292828272015082E2E2E1A2F0E0E0E0E0E2B260C0B09082E2E2E1A2F2F2F
            2F2F2F2D23020400012E2E2E1E2F2F2F2F2F2F2F240705032E2E2E2E1A2C2B2B
            2B2B2B2B23070A2E2E2E2E2E1A1B1B1B1B1A1A1B17062E2E2E2E}
        end
        object BitBtn29: TBitBtn
          Left = 16
          Top = 138
          Width = 282
          Height = 28
          Hint = 'Ordenar relat'#243'rio por loca'#231#227'o 2.'
          Caption = 'L&oca'#231#227'o 2'
          TabOrder = 4
          OnClick = BitBtn29Click
          Glyph.Data = {
            36050000424D3605000000000000360400002800000010000000100000000100
            08000000000000010000320B0000320B00000001000000010000EFA54A00C684
            6B00BD8C7300CE947300EFB57300FFC67300BD847B00C6947B00B5848400B58C
            8400CE9C8400B5948C00C6A59400EFCE9400C6A59C00EFCE9C00F7D69C00C6AD
            A500F7D6A500CEB5AD00D6B5AD00C6BDAD00F7D6AD00D6BDB500DEBDB500DEC6
            B500E7C6B500EFCEB500F7D6B500F7DEB500EFCEBD00F7DEBD00E7DEC600F7DE
            C600F7E7C600E7CECE00E7D6CE00F7E7CE00F7E7D600FFEFD600FFEFDE00FFEF
            E700FFF7E700FFF7EF00FFF7F700FFFFF700FF00FF00FFFFFF00FFFFFF00FFFF
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
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF002E2E08080808
            0808080808080808082E2E2E0E27221F1D16120F0D0D0D10082E2E2E0E270E0E
            0E0E0E0E0E0E0E0F082E2E2E11292625211F1C160F0F0D0F082E2E2E112A2625
            22211D1C160F0F0D082E2E2E132D0E0E0E0E0E0E0E0E0E0F082E2E2E142F2B29
            262522211F161212082E2E2E172F2C2B28262522211F1C16082E2E2E172F0E0E
            0E0E0E0E0E0E0E1D082E2E2E182F2F2F2C2928262521211C082E2E2E192F2F2F
            2F2C292828272015082E2E2E1A2F0E0E0E0E0E2B260C0B09082E2E2E1A2F2F2F
            2F2F2F2D23020400012E2E2E1E2F2F2F2F2F2F2F240705032E2E2E2E1A2C2B2B
            2B2B2B2B23070A2E2E2E2E2E1A1B1B1B1B1A1A1B17062E2E2E2E}
        end
        object BitBtn31: TBitBtn
          Left = 16
          Top = 2
          Width = 282
          Height = 28
          Hint = 'Manter ordem exibida.'
          Caption = '&Manter Ordem'
          TabOrder = 0
          OnClick = BitBtn31Click
          Glyph.Data = {
            36050000424D3605000000000000360400002800000010000000100000000100
            08000000000000010000320B0000320B00000001000000010000EFA54A00C684
            6B00BD8C7300CE947300EFB57300FFC67300BD847B00C6947B00B5848400B58C
            8400CE9C8400B5948C00C6A59400EFCE9400C6A59C00EFCE9C00F7D69C00C6AD
            A500F7D6A500CEB5AD00D6B5AD00C6BDAD00F7D6AD00D6BDB500DEBDB500DEC6
            B500E7C6B500EFCEB500F7D6B500F7DEB500EFCEBD00F7DEBD00E7DEC600F7DE
            C600F7E7C600E7CECE00E7D6CE00F7E7CE00F7E7D600FFEFD600FFEFDE00FFEF
            E700FFF7E700FFF7EF00FFF7F700FFFFF700FF00FF00FFFFFF00FFFFFF00FFFF
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
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF002E2E08080808
            0808080808080808082E2E2E0E27221F1D16120F0D0D0D10082E2E2E0E270E0E
            0E0E0E0E0E0E0E0F082E2E2E11292625211F1C160F0F0D0F082E2E2E112A2625
            22211D1C160F0F0D082E2E2E132D0E0E0E0E0E0E0E0E0E0F082E2E2E142F2B29
            262522211F161212082E2E2E172F2C2B28262522211F1C16082E2E2E172F0E0E
            0E0E0E0E0E0E0E1D082E2E2E182F2F2F2C2928262521211C082E2E2E192F2F2F
            2F2C292828272015082E2E2E1A2F0E0E0E0E0E2B260C0B09082E2E2E1A2F2F2F
            2F2F2F2D23020400012E2E2E1E2F2F2F2F2F2F2F240705032E2E2E2E1A2C2B2B
            2B2B2B2B23070A2E2E2E2E2E1A1B1B1B1B1A1A1B17062E2E2E2E}
        end
        object BitBtn20: TBitBtn
          Left = 16
          Top = 171
          Width = 282
          Height = 28
          Hint = 'Ordenar relat'#243'rio por Cliente.'
          Caption = 'C&liente'
          TabOrder = 5
          OnClick = BitBtn20Click
          Glyph.Data = {
            36050000424D3605000000000000360400002800000010000000100000000100
            08000000000000010000320B0000320B00000001000000010000EFA54A00C684
            6B00BD8C7300CE947300EFB57300FFC67300BD847B00C6947B00B5848400B58C
            8400CE9C8400B5948C00C6A59400EFCE9400C6A59C00EFCE9C00F7D69C00C6AD
            A500F7D6A500CEB5AD00D6B5AD00C6BDAD00F7D6AD00D6BDB500DEBDB500DEC6
            B500E7C6B500EFCEB500F7D6B500F7DEB500EFCEBD00F7DEBD00E7DEC600F7DE
            C600F7E7C600E7CECE00E7D6CE00F7E7CE00F7E7D600FFEFD600FFEFDE00FFEF
            E700FFF7E700FFF7EF00FFF7F700FFFFF700FF00FF00FFFFFF00FFFFFF00FFFF
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
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF002E2E08080808
            0808080808080808082E2E2E0E27221F1D16120F0D0D0D10082E2E2E0E270E0E
            0E0E0E0E0E0E0E0F082E2E2E11292625211F1C160F0F0D0F082E2E2E112A2625
            22211D1C160F0F0D082E2E2E132D0E0E0E0E0E0E0E0E0E0F082E2E2E142F2B29
            262522211F161212082E2E2E172F2C2B28262522211F1C16082E2E2E172F0E0E
            0E0E0E0E0E0E0E1D082E2E2E182F2F2F2C2928262521211C082E2E2E192F2F2F
            2F2C292828272015082E2E2E1A2F0E0E0E0E0E2B260C0B09082E2E2E1A2F2F2F
            2F2F2F2D23020400012E2E2E1E2F2F2F2F2F2F2F240705032E2E2E2E1A2C2B2B
            2B2B2B2B23070A2E2E2E2E2E1A1B1B1B1B1A1A1B17062E2E2E2E}
        end
      end
    end
    object tsReserva: TTabSheet
      Caption = 'tsReserva'
      ImageIndex = 7
      object pnReserva: TPanel
        Left = 0
        Top = 0
        Width = 857
        Height = 345
        Caption = 'pnReserva'
        TabOrder = 0
        object Panel9: TPanel
          Left = 1
          Top = 1
          Width = 855
          Height = 104
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object GroupBox6: TGroupBox
            Left = 0
            Top = 0
            Width = 855
            Height = 104
            Align = alClient
            Caption = 'Reservas'
            TabOrder = 0
            object DBGrid5: TDBGrid
              Left = 2
              Top = 15
              Width = 851
              Height = 87
              Align = alClient
              DataSource = dtmEstoqueFechado.dsReserva
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              OnKeyDown = DBGrid5KeyDown
            end
          end
        end
        object Panel8: TPanel
          Left = 1
          Top = 135
          Width = 855
          Height = 209
          Align = alClient
          BevelOuter = bvNone
          Caption = 'Panel8'
          TabOrder = 2
          object Splitter1: TSplitter
            Left = 509
            Top = 0
            Height = 180
            Align = alRight
            ExplicitLeft = 604
            ExplicitTop = 6
            ExplicitHeight = 185
          end
          object Panel10: TPanel
            Left = 0
            Top = 180
            Width = 855
            Height = 29
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 0
            object BitBtn23: TBitBtn
              Left = 747
              Top = 0
              Width = 108
              Height = 29
              Hint = 'Voltar'
              Align = alRight
              Caption = '&Voltar (Esc)'
              ModalResult = 2
              TabOrder = 4
              OnClick = BitBtn23Click
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
            object BitBtn35: TBitBtn
              Left = 652
              Top = 0
              Width = 95
              Height = 29
              Hint = 'F5 - Atualizar'
              Align = alRight
              Caption = 'F5 - Atualizar'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 3
              OnClick = BitBtn35Click
              Glyph.Data = {
                36050000424D3605000000000000360400002800000010000000100000000100
                08000000000000010000220B0000220B0000000100000001000000840000088C
                0800108C080018941000219410001894180029941800219C2100299C210029A5
                2900E78C31005AA53900B56B4A006BAD4A0073AD4A008C6B5200946B5200E79C
                5200A5635A00A56B5A00BD7B5A0084B55A00FFB55A0063BD6300A5636B00A573
                6B00BD846B00C6846B00D6946B00A5B56B0073BD6B00DE9C7300CEB5730094BD
                73009CBD7300ADBD730073C673007BC6730084C6730094C673009CC67300E7AD
                7B00DEBD7B00EFBD7B009CC67B00EFC67B00EFBD84009CC68400EFC68400F7C6
                840084CE8400EFC68C00F7CE8C00B5AD9400ADB59400EFC69400A5CE9400C6CE
                9400D6CE9400E7CE9400F7CE9400BDCE9C00EFCE9C00BDD69C00EFCEA500ADD6
                A500BDD6A500F7D6A500A5DEA500EFD6AD00F7D6AD00B5DEAD00DECEB500F7D6
                B500F7DEB500F7DEBD00DEC6C600FFEFC600FFEFCE00E7E7D600F7EFD600FFEF
                DE00DEF7DE00E7F7DE00FFEFE700E7F7E700FFF7E700F7F7EF00FFF7EF00FFF7
                F700F7FFF700FFFFF700FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF005C5C18181818
                1818181818181818185C5C5C184D393A3E3B302E2B2E2E30185C5C5C184E2208
                0D04040B202B2B30185C5C5C12513D0200000000062A2B30185C5C5C12563D03
                0003230E000E2E30185C5C5C19584201000015401D0D3330185C5C5C195D4F38
                2F212245402C3733185C5C5C1A5D4454502F212122403E3C185C5C5C1A5D2441
                5426000001454043185C5C5C1C5D32002541050002494640185C5C5C1C5D5709
                00000000024E4835185C5C5C1F5D5D521707071E08101313185C5C5C1F5D5D5D
                5D52525B360F110A0C5C5C5C295D5D5D5D5D5D5D4C1316145C5C5C5C29575757
                575757574C131A5C5C5C5C5C291C1C1C1C1C1C1C1C135C5C5C5C}
            end
            object BitBtn41: TBitBtn
              Left = 0
              Top = 0
              Width = 170
              Height = 29
              Hint = 'Buscar Produto - [VND210]'
              Align = alLeft
              Caption = 'Localizar produto'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              OnClick = BitBtn41Click
              Glyph.Data = {
                36030000424D3603000000000000360000002800000010000000100000000100
                18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
                C5A27FAE7E4CFFFFFF575757575757575757575757575757FFFFFF5757575757
                57575757575757575757FFFFFFFFFFFFAF7F4EFCF2E8FFFFFF57575757575757
                5757FFFFFF575757FFFFFF575757575757575757FFFFFF575757FFFFFFFFFFFF
                AF7F4EFCF2E8FFFFFF575757575757575757FFFFFF575757FFFFFF5757575757
                57575757FFFFFF575757FFFFFFFFFFFFAF7F4EFCF2E8FFFFFF57575757575757
                5757575757575757575757575757575757575757575757575757FFFFFFFFFFFF
                AE7D4BFCF2E8FFFFFFFFFFFF575757575757FFFFFF5757575757575757575757
                57FFFFFF575757FFFFFFFFFFFFFFFFFFAE7D4BFCF2E8FFFFFFFFFFFF57575757
                5757575757575757575757575757575757575757575757FFFFFFFFFFFFFFFFFF
                AE7D4BFCF2E8FCF2E8FCF2E8FCF2E8575757FFFFFF575757FFFFFF575757FFFF
                FF575757FFFFFFFFFFFFFFFFFFFFFFFFAE7D4BFCF2E8FCF2E8FCF2E8FCF2E857
                5757575757575757FFFFFF575757575757575757FFFFFFFFFFFFFFFFFFFFFFFF
                AE7D4BFCF2E8FCF2E8FCF2E8FCF2E8FCF2E8FCF2E8FCF2E8FCF2E8FCF2E8FCF2
                E8AE7D4BFFFFFFFFFFFFFFFFFFFFFFFFAE7D4BFCF2E8FCF2E8FCF2E8FCF2E8FC
                F2E8FCF2E8FCF2E8FCF2E8FCF2E8FCF2E8AE7D4BFFFFFFFFFFFFFFFFFFFFFFFF
                AE7D4BFCF2E8FCF2E8FCF2E8FCF2E8FCF2E8FCF2E8FDF5EEFDF6F0FDF6F0FDF6
                F0AE7D4BFFFFFFFFFFFFFFFFFFFFFFFFAE7D4BFCF2E8FCF2E8FCF2E8FCF2E8FC
                F2E8FDF5EEC9A989AE7D4BAE7D4BAE7D4BAE7D4BFFFFFFFFFFFFFFFFFFFFFFFF
                AE7D4BFCF2E8FCF2E8FCF2E8FCF2E8FCF2E8FDF6F0AE7D4BFEFAF5FDF6F0E5D1
                BEBA9066FFFFFFFFFFFFFFFFFFFFFFFFAE7D4BFCF2E8FCF2E8FCF2E8FCF2E8FC
                F2E8FDF6F0AE7D4BFDF6F0E4D0BBB88D62F6F1EBFFFFFFFFFFFFFFFFFFFFFFFF
                AE7E4CFDF4EBFCF2E8FCF2E8FCF2E8FCF2E8FDF6F0AF7E4CE4D3C1B88D61F6F1
                EBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC5A27FAE7E4CAE7D4BAE7D4BAE7D4BAE
                7D4BAE7D4BAE7E4CBB9268F6F0EBFFFFFFFFFFFFFFFFFFFFFFFF}
            end
            object BitBtn42: TBitBtn
              Left = 170
              Top = 0
              Width = 170
              Height = 29
              Hint = 'Alterar Item - [VND211]'
              Align = alLeft
              Caption = 'Alterar item para outra reserva'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              OnClick = BitBtn42Click
              Glyph.Data = {
                6E030000424D6E030000000000006E0200002800000010000000100000000100
                08000000000000010000120B0000120B00008E0000008E00000000000000FFFF
                FF00FF00FF0062555D00745D65006B5D62008C6D7300A4676900A0656700925C
                5E00764C4E007D525400633B3C0081535400865151008E575700865252008753
                5300B6757500B4767600B8797900B2757500B07474008A5B5B0097666600CA8B
                8B00CE8F8F00CF909000CC8E8E00EFAAA900E2A1A100E1A1A100E6A6A600302D
                2D007E444200875958008C5E5D00DD908C00E9A4A1009E5D5800D8C2C000DCC7
                C500955F5600A0675B00A56B5F005B3D37005E3F3900A7756B00583C35005C3F
                3800DAC1BA00C1836C00BC826800CFB5AA00F8F2EF00D7C1B500FBF4F000FAF3
                EF00D1926D00F7F2EF00DA9D7500E1CEC000FEF7F200FBF4EF00E7AB7900FAEF
                E600EBDCCE00FAEFE500D1914F00F8EADC00FAF0E600FEF7F000FCF6F000EEDD
                CA00DCC1A000F6E0C6009C8F8000F7E5CF00F8EADA00FCF6EF00DCB27A00DCB5
                8100C2A07400AD926F00917B5E0086725800BFA4800099846800C4AA8900F0D8
                BA00FFF4E500E9BD7F00E7BC7E00E2B87E00D1AB7400B5976C009A815D00A78C
                6600CFAF82007D6B51007A695000FEEFDA004B474100F0E5D500FCF3E600FCF7
                F000E9BF7D00EFC48100CEAA7300FCEACE00FFFEFC00FFFBF000FFFEFB00FFFE
                F700FFFFFC008F9F9D003745460006BBF0000C98BD00068FC1001E799F002D84
                A70022576C000393DE00036292000D4663000B3B5400165E820021252700008E
                DE000263BF003E4145001031D3000320BA000318B200000F95002F45ED000C19
                B400010B9900010A95002732D000000081000202020202020202020202020202
                020207070707070707070707070707020202076D594A585662515D5C5B6B0702
                02022B654B218074575352505C6B070202022B5A4D4C7D7C7E66545F5E6A0702
                02022F6F45497A7F040B2E55616C080202022F72464E730325140F2D63600902
                020234013E416705261B151130640D02020234016E484142241E1A1310310A02
                02023A01016E47433D231F1C160E0C0202023A0101016E694337172019122283
                02023C010101016E4F6835181D06787676023C01010101017071322A27797581
                878D4001010101010101292C44777B85868A40383F3939363B3B282C33028288
                848B403A3A3A3A3A3A3A3A2C0202028C8902}
            end
            object BitBtn43: TBitBtn
              Left = 340
              Top = 0
              Width = 170
              Height = 29
              Hint = 'Liberar Trava - [VND198]'
              Align = alLeft
              Caption = 'Liberar Trava'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
              OnClick = BitBtn43Click
              Glyph.Data = {
                8E050000424D8E050000000000004E0300002800000018000000180000000100
                08000000000040020000120B0000120B0000C6000000C600000000000000FFFF
                FF00FF00FF0087FEFE00F3FFFF0074F4FB0079F3F80068EAF4006BEDF7006AEA
                F40075EDF800BCF6FB0060EAF80065D1DC00D5FAFE0053DEF20053DCEE0055C5
                D4006CE6F60055B4C100A7F0FB00A6EEF800A7EEF700C2F3FA00F4FBFC003ECB
                E5004CD1E9004BBBCE0055CCE00095E5F30099EAF800ACEAF400C9EFF6003AC9
                E50049BDD3008BDEEF008BDDEE0093E6F70023B5D9002DB6D70038BDDC0038B7
                D50066DEFC0093E5F7001EA4CB0022ADD40029B2D70027A0C2002DB0D30059D1
                F2007DD1E70087DDF3008BDEF60091E5FC000C9FCE00159ECB0019A3CF001BA9
                D8002198BB002093B6002593B5002898BC002A99BB0045C7F2006ACCEA0073C7
                E10088DCF70081CEE70083CEE60095E2FA000696CA00078ABB000F9FD1001298
                C700128FBB001599CA001B9ECC0020A0CE0027B2E10028A5D30028A3D1002592
                BA0034BBE90033B5E50032AAD70040C1F00040B2D8004190AC0074D0EF0073C5
                E1007DD3F30088DAF7008ADCF8000082B800018AC200018BC1000188BF00027E
                B100038FC4000388BF000386BC000383B7000384B7000382B6000383B6000383
                B500037EB1000489C000047BAD00068BC000078EC400098CC0000A8CC1000A88
                BB000B92C6000B8FC2000E92C6000F96CA000F93C5000F88BB001196C9001399
                CC000F76A000189DD0001A98CB001780AC0022A0D00028A0D00039A6D4004C9D
                BD0080D4F70083D8FB0088D9FA000283BC00036B9C000487BF000478AB000479
                AB000587BF000586BD000478AA000470A1000686BF000787BF000876A700096D
                99001491C700117AA900115575001F9ACE0015658900219ACE00269ED100289F
                D30029A0D300278EBA002689B5002DA3D50023769C00216D8F003AA6D50041AF
                E000307E9F004AB0DD004DB1DE0050B7E60058BAE60066C4EF0066C1EB007ACF
                F7007BD1F7007DD1F70082D4F80007689700096C9C00145A7B0050A5CE006CC6
                F2006BC5F00072C9F40075CBF60076CBF70076CBF60077CCF70077CBF60077CC
                F60078CCF70078CEF70078CBF6007BCFFA007ACEF8007BCEF8007ACEF7007BCE
                F7007DCFF8007ECFF80081D0FB0081D1FB000202020202020202020202020202
                020202020202020202020202020202028B999D9A97928F020202020202020202
                020202020202026074A9C4C3C0B4B1A5998E0202020202020202020202026B46
                785AABB5BCB6A4A8C5A79802020202020202020202026E484B335BAAB9B780A3
                BDC1C2A10202020202020202020272394C1D2B4283B09CA0B2BAB8BF73020202
                020202020202754E7E1F15253581969BA6BEB6B6730202020202020202027952
                4F2017161E349F9EB3B7B6B6730202020202020202027B3F5418040E0B1457A2
                82BBB6B6730202020202020202027B537C444359413223244584A9B573020202
                0202020202027328293B3A272D37494D56405CAC730202020202020202026F08
                1394AF110C1926365F63505873020202020202020202028A301B0D030510212C
                47695D7073020202020202020202020202712E1A09070F2F61892C5E73020202
                0202020202020202020202028776384A676C6485020202020202020202020202
                0202020202020202688C02020202020202020202020202020286860202020202
                658C0202020202020202020202020202026D6A0202020202658C020202020202
                0202020202020202027F950202020202658C0202020202020202020202020202
                02512A93020202026688020202020202020202020202020202021C0A3DAEAD90
                628D020202020202020202020202020202029122061231557702020202020202
                0202020202020202020202027A3C3E7D02020202020202020202020202020202
                020202020202020202020202020202020202}
            end
          end
          object Panel12: TPanel
            Left = 0
            Top = 0
            Width = 509
            Height = 180
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
            object Panel15: TPanel
              Left = 455
              Top = 0
              Width = 54
              Height = 180
              Align = alRight
              BevelOuter = bvNone
              TabOrder = 0
              object BitBtn33: TBitBtn
                Left = 0
                Top = 0
                Width = 54
                Height = 88
                Hint = 'Adiconar - [VND208]'
                Align = alClient
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -37
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                OnClick = BitBtn33Click
                Glyph.Data = {
                  F6060000424DF606000000000000360000002800000018000000180000000100
                  180000000000C0060000C40E0000C40E00000000000000000000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCDA8
                  83D1AE8BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFC29264B3783EB3783EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFEFEBA844FB3783EB3783EB3783EFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFF8F3EDB57C44B3783EB3783EB3783EB3783EFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2E9E0B1763CB3783EB3783EB3783EB378
                  3EB3783EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9D8C7B3783EB3783EB3783E
                  B3783EB3783EB3783EB3783EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFC7AFB3783EB1
                  773DB3783EB3783EB3783EB3783EB3783EB3783EFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD5B5
                  95B3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3
                  783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EFFFFFFFFFFFF
                  FFFFFFC9A077B3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB378
                  3EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3
                  783EFFFFFFFFFFFFC19264B3783EB2773EB3783EB3783EB3783EB3783EB3783E
                  B3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB378
                  3EB3783EB3783EB3783EFFFFFFB98551B1763CB3783EB2773EB3783EB3783EB3
                  783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783E
                  B3783EB3783EB3783EB3783EB3783EB3783EB8804AB1763CB2773EB3783EB277
                  3EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3
                  783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB67E46B3783E
                  B3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB378
                  3EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3
                  783EFDFBF9B7814CB1763CB3783EB2773EB3783EB3783EB3783EB3783EB3783E
                  B3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB378
                  3EB3783EB3783EB3783EFFFFFFFFFFFFBD8957B3783EB3783EB3783EB3783EB3
                  783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783E
                  B3783EB3783EB3783EB3783EB3783EB3783EFFFFFFFFFFFFFFFFFFC69A6FB176
                  3CB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3
                  783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EFFFFFFFFFFFF
                  FFFFFFFFFFFFCDA681B3783EB3783EB3783EB3783EB3783EB3783EB3783EB378
                  3EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3
                  783EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD7B99AB3783EB3783EB3783EB3783E
                  B3783EB3783EB3783EB3783EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE1CBB4B1
                  763CB3783EB3783EB3783EB3783EB3783EB3783EFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFE8D7C6B1763CB3783EB3783EB3783EB3783EB3783EFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3EAE1B3783EB3783EB3783EB378
                  3EB3783EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F2EC
                  B37A41B3783EB3783EB3783EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFEFDFDB8824CB3783EB3783EFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC39568C5996DFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
              end
              object BitBtn34: TBitBtn
                Left = 0
                Top = 88
                Width = 54
                Height = 92
                Hint = 'Remover - [VND209]'
                Align = alBottom
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -37
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 1
                OnClick = BitBtn34Click
                Glyph.Data = {
                  F6060000424DF606000000000000360000002800000018000000180000000100
                  180000000000C0060000C40E0000C40E00000000000000000000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC5996DC39568FFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  B3783EB3783EB8824CFEFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFB3783EB3783EB3783EB37A41F8F2ECFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB3783EB3783EB3783EB3783EB3783EF3
                  EAE1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB3783EB3783EB378
                  3EB3783EB3783EB1763CE8D7C6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  B3783EB3783EB3783EB3783EB3783EB3783EB1763CE1CBB4FFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783E
                  D7B99AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB3783EB3783EB3783EB3783EB378
                  3EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3
                  783EB3783EB3783EB3783ECDA681FFFFFFFFFFFFFFFFFFFFFFFFB3783EB3783E
                  B3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB378
                  3EB3783EB3783EB3783EB3783EB3783EB3783EB1763CC69A6FFFFFFFFFFFFFFF
                  FFFFB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783E
                  B3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB378
                  3EBD8957FFFFFFFFFFFFB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3
                  783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783E
                  B3783EB2773EB3783EB1763CB7814CFDFBF9B3783EB3783EB3783EB3783EB378
                  3EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3
                  783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB67E46B3783EB3783E
                  B3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB378
                  3EB3783EB3783EB3783EB3783EB3783EB3783EB2773EB3783EB2773EB1763CB8
                  804AB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783E
                  B3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB2773EB378
                  3EB1763CB98551FFFFFFB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3
                  783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783E
                  B3783EB2773EB3783EC19264FFFFFFFFFFFFB3783EB3783EB3783EB3783EB378
                  3EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3
                  783EB3783EB3783EB3783EB3783EC9A077FFFFFFFFFFFFFFFFFFB3783EB3783E
                  B3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB378
                  3EB3783EB3783EB3783EB3783EB3783EB3783ED5B595FFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  B3783EB3783EB3783EB3783EB3783EB3783EB1773DB3783EDFC7AFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFB3783EB3783EB3783EB3783EB3783EB3783EB3783EE9D8C7
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB3783EB3783EB3783EB3783EB3783EB1
                  763CF2E9E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB3783EB3783EB378
                  3EB3783EB57C44F8F3EDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  B3783EB3783EB3783EBA844FFFFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFB3783EB3783EC29264FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD1AE8BCDA883FFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
              end
            end
            object GroupBox5: TGroupBox
              Left = 0
              Top = 0
              Width = 455
              Height = 180
              Align = alClient
              Caption = 'Itens da reserva'
              TabOrder = 1
              object DBGrid6: TDBGrid
                Left = 2
                Top = 15
                Width = 451
                Height = 163
                Align = alClient
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = []
                OnCellClick = DBGrid6CellClick
                OnDrawColumnCell = DBGrid6DrawColumnCell
                OnKeyDown = DBGrid6KeyDown
              end
            end
          end
          object Panel13: TPanel
            Left = 512
            Top = 0
            Width = 343
            Height = 180
            Align = alRight
            TabOrder = 2
            object GroupBox9: TGroupBox
              Left = 1
              Top = 1
              Width = 341
              Height = 178
              Align = alClient
              Caption = 'Pedidos do vendedor'
              TabOrder = 0
              object DBGrid7: TDBGrid
                Left = 2
                Top = 15
                Width = 337
                Height = 161
                Align = alClient
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = []
                OnCellClick = DBGrid7CellClick
                OnDrawColumnCell = DBGrid7DrawColumnCell
                OnKeyDown = DBGrid7KeyDown
              end
            end
          end
        end
        object Panel11: TPanel
          Left = 1
          Top = 105
          Width = 855
          Height = 30
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
          object Label18: TLabel
            Left = 245
            Top = 0
            Width = 85
            Height = 13
            Caption = 'Produto pendente'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -5
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object btSelectAlmoxAll: TSpeedButton
            Left = 629
            Top = 1
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
            OnClick = btSelectAlmoxAllClick
          end
          object btUnSelectAlmoxAll: TSpeedButton
            Left = 655
            Top = 1
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
            OnClick = btUnSelectAlmoxAllClick
          end
          object btSelectResAll: TSpeedButton
            Left = 152
            Top = 1
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
            OnClick = btSelectResAllClick
          end
          object btUnSelectResAll: TSpeedButton
            Left = 175
            Top = 1
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
            OnClick = btUnSelectResAllClick
          end
          object Label19: TLabel
            Left = 683
            Top = 6
            Width = 137
            Height = 13
            Caption = 'F3 - Marca e desmarcar linha'
          end
          object Label20: TLabel
            Left = 7
            Top = 6
            Width = 137
            Height = 13
            Caption = 'F2 - Marca e desmarcar linha'
          end
          object Label22: TLabel
            Left = 245
            Top = 15
            Width = 89
            Height = 13
            Caption = 'Produto dispon'#237'vel'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -5
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object BitBtn24: TBitBtn
            Left = 491
            Top = -1
            Width = 75
            Height = 25
            Hint = 'Excluir - [VND207]'
            Caption = '&Excluir'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 2
            OnClick = BitBtn24Click
            Glyph.Data = {
              12020000424D1202000000000000120100002800000010000000100000000100
              08000000000000010000120B0000120B0000370000003700000000000000FFFF
              FF00FF00FF001442E4001645EB001C4BE7000430EB000C35E4000E3CEB001037
              DB000027EB00002AEB000027E400012CEB00052BDC00062DE300092ED9000022
              EB000021E7000020E200001FDC000022DC000020D900001EEB00001FEB000020
              EB00001DE800001BE300001EE200001FE200001BDF00001CDF00001AEB00001A
              E2000017DF000019DF00001ADF000011EB000016EB000012E6000010DC000013
              DC000010D9000009EB00000BEB000008EA000008E700000ADF000004E2000005
              E2000004DF000005DF000003DB000004DA0000006E0002020202020202020202
              0202020202020202020202020202020202020202020202020236360202020202
              0236360202020202361A28360202020236302E36020202023621182A36020236
              332B34360202020202362419293636312C353602020202020202361E11272D2B
              3236020202020202020202361B26252F36020202020202020202023612172022
              36020202020202020202360F06131C0A2336020202020202023607080E363614
              0B1F3602020202023603041036020236160D1D36020202023605093602020202
              36150C3602020202023636020202020202363602020202020202020202020202
              02020202020202020202020202020202020202020202}
          end
          object BitBtn30: TBitBtn
            Left = 417
            Top = -1
            Width = 75
            Height = 25
            Hint = 'Alterar - [VND206/VND214]'
            Caption = '&Alterar'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            OnClick = BitBtn30Click
            Glyph.Data = {
              6E030000424D6E030000000000006E0200002800000010000000100000000100
              08000000000000010000120B0000120B00008E0000008E00000000000000FFFF
              FF00FF00FF0062555D00745D65006B5D62008C6D7300A4676900A0656700925C
              5E00764C4E007D525400633B3C0081535400865151008E575700865252008753
              5300B6757500B4767600B8797900B2757500B07474008A5B5B0097666600CA8B
              8B00CE8F8F00CF909000CC8E8E00EFAAA900E2A1A100E1A1A100E6A6A600302D
              2D007E444200875958008C5E5D00DD908C00E9A4A1009E5D5800D8C2C000DCC7
              C500955F5600A0675B00A56B5F005B3D37005E3F3900A7756B00583C35005C3F
              3800DAC1BA00C1836C00BC826800CFB5AA00F8F2EF00D7C1B500FBF4F000FAF3
              EF00D1926D00F7F2EF00DA9D7500E1CEC000FEF7F200FBF4EF00E7AB7900FAEF
              E600EBDCCE00FAEFE500D1914F00F8EADC00FAF0E600FEF7F000FCF6F000EEDD
              CA00DCC1A000F6E0C6009C8F8000F7E5CF00F8EADA00FCF6EF00DCB27A00DCB5
              8100C2A07400AD926F00917B5E0086725800BFA4800099846800C4AA8900F0D8
              BA00FFF4E500E9BD7F00E7BC7E00E2B87E00D1AB7400B5976C009A815D00A78C
              6600CFAF82007D6B51007A695000FEEFDA004B474100F0E5D500FCF3E600FCF7
              F000E9BF7D00EFC48100CEAA7300FCEACE00FFFEFC00FFFBF000FFFEFB00FFFE
              F700FFFFFC008F9F9D003745460006BBF0000C98BD00068FC1001E799F002D84
              A70022576C000393DE00036292000D4663000B3B5400165E820021252700008E
              DE000263BF003E4145001031D3000320BA000318B200000F95002F45ED000C19
              B400010B9900010A95002732D000000081000202020202020202020202020202
              020207070707070707070707070707020202076D594A585662515D5C5B6B0702
              02022B654B218074575352505C6B070202022B5A4D4C7D7C7E66545F5E6A0702
              02022F6F45497A7F040B2E55616C080202022F72464E730325140F2D63600902
              020234013E416705261B151130640D02020234016E484142241E1A1310310A02
              02023A01016E47433D231F1C160E0C0202023A0101016E694337172019122283
              02023C010101016E4F6835181D06787676023C01010101017071322A27797581
              878D4001010101010101292C44777B85868A40383F3939363B3B282C33028288
              848B403A3A3A3A3A3A3A3A2C0202028C8902}
          end
          object BitBtn32: TBitBtn
            Left = 343
            Top = -1
            Width = 75
            Height = 25
            Hint = 'Incluir - [VND205/VND214]'
            Caption = 'I&ncluir'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            OnClick = BitBtn32Click
            Glyph.Data = {
              36050000424D3605000000000000360400002800000010000000100000000100
              08000000000000010000420B0000420B00000001000000010000B5847300AD73
              8400B5848400B58C8400B5948C00D6BDB500C6C6C600EFD6C600CECECE00D6D6
              D600DEDEDE00E7E7E700EFEFEF0042B5F7008CD6F700B5DEF700F7F7F700FF00
              FF003184FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00111111111111
              1111111111111111111111111101020202020202020202020211111111011313
              1313131313131313021111111101131313131313131313130211111111011313
              1313131313131313021111111101131313131313131313130211111111011313
              1313131313131313021111111101131313131313131313130211111111011313
              13131313131313130211111112121210101010101010101002111111120D120C
              0C0C0C0C0C0C0C0C02111212120D1212120B0B0B0B0004030211120E0F0F0F0E
              120A0A0A0600131302111212120F1212120909090600130211111111120F1208
              0808080806000211111111111212120707070707050011111111}
          end
          object Panel14: TPanel
            Left = 211
            Top = 0
            Width = 28
            Height = 13
            BevelOuter = bvNone
            Color = 5329407
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentBackground = False
            ParentFont = False
            TabOrder = 3
          end
          object Panel17: TPanel
            Left = 211
            Top = 15
            Width = 28
            Height = 13
            BevelOuter = bvNone
            Color = clGradientActiveCaption
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentBackground = False
            ParentFont = False
            TabOrder = 4
          end
        end
      end
    end
    object tsEscolha: TTabSheet
      Caption = 'tsEscolha'
      ImageIndex = 8
      object pnEscolhaReserva: TPanel
        Left = 0
        Top = 0
        Width = 529
        Height = 201
        Caption = 'pnEscolhaReserva'
        TabOrder = 0
        object Panel16: TPanel
          Left = 1
          Top = 64
          Width = 527
          Height = 136
          Align = alBottom
          TabOrder = 1
          object pnReservasExistentes: TPanel
            Left = 1
            Top = 1
            Width = 525
            Height = 134
            Align = alClient
            BevelOuter = bvNone
            Caption = 'pnReservasExistentes'
            TabOrder = 0
            object DBGrid8: TDBGrid
              Left = 0
              Top = 0
              Width = 525
              Height = 111
              Align = alClient
              DataSource = dtmEstoqueFechado.dsReserva
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              OnKeyDown = DBGrid8KeyDown
            end
            object Panel19: TPanel
              Left = 0
              Top = 111
              Width = 525
              Height = 23
              Align = alBottom
              BevelOuter = bvNone
              TabOrder = 1
              object BitBtn39: TBitBtn
                Left = 424
                Top = 0
                Width = 101
                Height = 23
                Align = alRight
                Caption = '&Voltar (Esc)'
                TabOrder = 0
                OnClick = BitBtn39Click
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
              object BitBtn40: TBitBtn
                Left = 323
                Top = 0
                Width = 101
                Height = 23
                Hint = 'OK - [VND212/VND215]'
                Align = alRight
                Caption = '&OK'
                TabOrder = 1
                OnClick = BitBtn40Click
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
            end
          end
        end
        object pnEscolha: TPanel
          Left = 1
          Top = 1
          Width = 527
          Height = 63
          Align = alClient
          TabOrder = 0
          object BitBtn37: TBitBtn
            Left = 1
            Top = 26
            Width = 177
            Height = 36
            Align = alLeft
            Caption = 'Reserva &existente'
            TabOrder = 0
            OnClick = BitBtn37Click
            Glyph.Data = {
              6E030000424D6E030000000000006E0200002800000010000000100000000100
              08000000000000010000120B0000120B00008E0000008E00000000000000FFFF
              FF00FF00FF0062555D00745D65006B5D62008C6D7300A4676900A0656700925C
              5E00764C4E007D525400633B3C0081535400865151008E575700865252008753
              5300B6757500B4767600B8797900B2757500B07474008A5B5B0097666600CA8B
              8B00CE8F8F00CF909000CC8E8E00EFAAA900E2A1A100E1A1A100E6A6A600302D
              2D007E444200875958008C5E5D00DD908C00E9A4A1009E5D5800D8C2C000DCC7
              C500955F5600A0675B00A56B5F005B3D37005E3F3900A7756B00583C35005C3F
              3800DAC1BA00C1836C00BC826800CFB5AA00F8F2EF00D7C1B500FBF4F000FAF3
              EF00D1926D00F7F2EF00DA9D7500E1CEC000FEF7F200FBF4EF00E7AB7900FAEF
              E600EBDCCE00FAEFE500D1914F00F8EADC00FAF0E600FEF7F000FCF6F000EEDD
              CA00DCC1A000F6E0C6009C8F8000F7E5CF00F8EADA00FCF6EF00DCB27A00DCB5
              8100C2A07400AD926F00917B5E0086725800BFA4800099846800C4AA8900F0D8
              BA00FFF4E500E9BD7F00E7BC7E00E2B87E00D1AB7400B5976C009A815D00A78C
              6600CFAF82007D6B51007A695000FEEFDA004B474100F0E5D500FCF3E600FCF7
              F000E9BF7D00EFC48100CEAA7300FCEACE00FFFEFC00FFFBF000FFFEFB00FFFE
              F700FFFFFC008F9F9D003745460006BBF0000C98BD00068FC1001E799F002D84
              A70022576C000393DE00036292000D4663000B3B5400165E820021252700008E
              DE000263BF003E4145001031D3000320BA000318B200000F95002F45ED000C19
              B400010B9900010A95002732D000000081000202020202020202020202020202
              020207070707070707070707070707020202076D594A585662515D5C5B6B0702
              02022B654B218074575352505C6B070202022B5A4D4C7D7C7E66545F5E6A0702
              02022F6F45497A7F040B2E55616C080202022F72464E730325140F2D63600902
              020234013E416705261B151130640D02020234016E484142241E1A1310310A02
              02023A01016E47433D231F1C160E0C0202023A0101016E694337172019122283
              02023C010101016E4F6835181D06787676023C01010101017071322A27797581
              878D4001010101010101292C44777B85868A40383F3939363B3B282C33028288
              848B403A3A3A3A3A3A3A3A2C0202028C8902}
          end
          object BitBtn36: TBitBtn
            Left = 178
            Top = 26
            Width = 173
            Height = 36
            Hint = 'Nova Reserva - [VND205/VND212/VND214/VND215]'
            Align = alClient
            Caption = '&Nova Reserva'
            TabOrder = 1
            OnClick = BitBtn36Click
            Glyph.Data = {
              36050000424D3605000000000000360400002800000010000000100000000100
              08000000000000010000420B0000420B00000001000000010000B5847300AD73
              8400B5848400B58C8400B5948C00D6BDB500C6C6C600EFD6C600CECECE00D6D6
              D600DEDEDE00E7E7E700EFEFEF0042B5F7008CD6F700B5DEF700F7F7F700FF00
              FF003184FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00111111111111
              1111111111111111111111111101020202020202020202020211111111011313
              1313131313131313021111111101131313131313131313130211111111011313
              1313131313131313021111111101131313131313131313130211111111011313
              1313131313131313021111111101131313131313131313130211111111011313
              13131313131313130211111112121210101010101010101002111111120D120C
              0C0C0C0C0C0C0C0C02111212120D1212120B0B0B0B0004030211120E0F0F0F0E
              120A0A0A0600131302111212120F1212120909090600130211111111120F1208
              0808080806000211111111111212120707070707050011111111}
          end
          object BitBtn38: TBitBtn
            Left = 351
            Top = 26
            Width = 175
            Height = 36
            Align = alRight
            Caption = '&Cancelar (Esc)'
            TabOrder = 2
            OnClick = BitBtn38Click
            Glyph.Data = {
              12020000424D1202000000000000120100002800000010000000100000000100
              08000000000000010000120B0000120B0000370000003700000000000000FFFF
              FF00FF00FF001442E4001645EB001C4BE7000430EB000C35E4000E3CEB001037
              DB000027EB00002AEB000027E400012CEB00052BDC00062DE300092ED9000022
              EB000021E7000020E200001FDC000022DC000020D900001EEB00001FEB000020
              EB00001DE800001BE300001EE200001FE200001BDF00001CDF00001AEB00001A
              E2000017DF000019DF00001ADF000011EB000016EB000012E6000010DC000013
              DC000010D9000009EB00000BEB000008EA000008E700000ADF000004E2000005
              E2000004DF000005DF000003DB000004DA0000006E0002020202020202020202
              0202020202020202020202020202020202020202020202020236360202020202
              0236360202020202361A28360202020236302E36020202023621182A36020236
              332B34360202020202362419293636312C353602020202020202361E11272D2B
              3236020202020202020202361B26252F36020202020202020202023612172022
              36020202020202020202360F06131C0A2336020202020202023607080E363614
              0B1F3602020202023603041036020236160D1D36020202023605093602020202
              36150C3602020202023636020202020202363602020202020202020202020202
              02020202020202020202020202020202020202020202}
          end
          object Panel18: TPanel
            Left = 1
            Top = 1
            Width = 525
            Height = 25
            Align = alTop
            BevelOuter = bvNone
            Caption = 'Panel18'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 3
          end
        end
      end
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 4
    Top = 105
    object Configurarcolunas1: TMenuItem
      Caption = ' Configurar colunas'
      OnClick = Configurarcolunas1Click
    end
    object ResetarConfiguraesdecolunas1: TMenuItem
      Caption = 'Resetar Configura'#231#245'es de colunas'
      OnClick = ResetarConfiguraesdecolunas1Click
    end
    object SalvardadosnoExcel1: TMenuItem
      Caption = 'Salvar dados no Excel'
      OnClick = SalvardadosnoExcel1Click
    end
    object ReajustarLarguradascolunas1: TMenuItem
      Caption = 'Reajustar Largura das colunas'
      OnClick = ReajustarLarguradascolunas1Click
    end
    object Copiarparareadetransferncia1: TMenuItem
      Caption = 'Copiar para '#225'rea de transfer'#234'ncia'
      OnClick = Copiarparareadetransferncia1Click
    end
  end
end
