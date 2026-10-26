object FrmResumoCXL: TFrmResumoCXL
  Left = 301
  Top = 14
  Caption = 'Resumo do Caixa Auxiliar'
  ClientHeight = 607
  ClientWidth = 445
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 445
    Height = 607
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Dados do Resumo'
      object Panel2: TPanel
        Left = 0
        Top = 157
        Width = 437
        Height = 13
        Align = alTop
        Caption = 'LANCAMENTOS DO CAIXA'
        TabOrder = 0
      end
      object DBGrid3: TDBGrid
        Left = 0
        Top = 170
        Width = 437
        Height = 68
        Align = alTop
        Color = clScrollBar
        DataSource = DtmBalcao.DtLancCxl
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
      object Panel1: TPanel
        Left = 0
        Top = 354
        Width = 437
        Height = 225
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowFrame
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        object Label1: TLabel
          Left = 259
          Top = 81
          Width = 92
          Height = 13
          Caption = 'Total das Entradas:'
          Visible = False
        end
        object Label2: TLabel
          Left = 259
          Top = 103
          Width = 93
          Height = 13
          Caption = 'Total das Sa'#237'das...:'
          Visible = False
        end
        object Label3: TLabel
          Left = 12
          Top = 170
          Width = 91
          Height = 13
          Caption = 'Total Geral............:'
        end
        object Label4: TLabel
          Left = 8
          Top = 27
          Width = 216
          Height = 13
          Caption = 'Somat'#243'rio dos Documentos Recebidos Caixa:'
        end
        object Label6: TLabel
          Left = 12
          Top = 194
          Width = 91
          Height = 13
          Caption = 'Diferen'#231'a..............:'
        end
        object Label7: TLabel
          Left = 8
          Top = 4
          Width = 216
          Height = 13
          Alignment = taRightJustify
          Caption = 'Somat'#243'rio dos Documentos N'#227'o Recebidos..:'
        end
        object Label5: TLabel
          Left = 12
          Top = 50
          Width = 91
          Height = 13
          Alignment = taRightJustify
          Caption = 'Recibos Antec......:'
        end
        object Label8: TLabel
          Left = 12
          Top = 98
          Width = 91
          Height = 13
          Alignment = taRightJustify
          Caption = 'Lanc. Avulsos.......:'
        end
        object Label9: TLabel
          Left = 12
          Top = 146
          Width = 90
          Height = 13
          Alignment = taRightJustify
          Caption = 'Total L'#237'quido........:'
        end
        object Label10: TLabel
          Left = 12
          Top = 122
          Width = 91
          Height = 13
          Alignment = taRightJustify
          Caption = 'Juros.....................:'
        end
        object Label11: TLabel
          Left = 12
          Top = 74
          Width = 90
          Height = 13
          Alignment = taRightJustify
          Caption = 'Taxa Interm Pag...:'
        end
        object BitBtn1: TBitBtn
          Left = 259
          Top = 179
          Width = 75
          Height = 25
          Hint = 'Fechar - [CXL043]'
          Caption = '&Fechar'
          TabOrder = 0
          OnClick = BitBtn1Click
          Kind = bkOK
        end
        object BitBtn2: TBitBtn
          Left = 341
          Top = 179
          Width = 75
          Height = 25
          Hint = 'Sair'
          Caption = '&Sair'
          TabOrder = 1
          OnClick = BitBtn2Click
          Kind = bkCancel
        end
        object EditMoeda1: TEditMoeda
          Left = 228
          Top = 24
          Width = 121
          Height = 21
          Alignment = taRightJustify
          Enabled = False
          TabOrder = 2
          FormatReal = fNumber
          FormatSize = '10.2'
        end
        object EditMoeda2: TEditMoeda
          Left = 228
          Top = 1
          Width = 121
          Height = 21
          Alignment = taRightJustify
          Enabled = False
          TabOrder = 4
          FormatReal = fNumber
          FormatSize = '10.2'
        end
        object EditMoeda3: TEditMoeda
          Left = 355
          Top = 78
          Width = 95
          Height = 21
          Alignment = taRightJustify
          Enabled = False
          TabOrder = 5
          Visible = False
          FormatReal = fNumber
          FormatSize = '10.2'
        end
        object EditMoeda4: TEditMoeda
          Left = 107
          Top = 47
          Width = 95
          Height = 21
          Alignment = taRightJustify
          Enabled = False
          TabOrder = 6
          FormatReal = fNumber
          FormatSize = '10.2'
        end
        object EditMoeda5: TEditMoeda
          Left = 354
          Top = 100
          Width = 95
          Height = 21
          Alignment = taRightJustify
          Enabled = False
          TabOrder = 7
          Visible = False
          FormatReal = fNumber
          FormatSize = '10.2'
        end
        object EditMoeda6: TEditMoeda
          Left = 107
          Top = 167
          Width = 95
          Height = 21
          Alignment = taRightJustify
          Enabled = False
          TabOrder = 8
          FormatReal = fNumber
          FormatSize = '10.2'
        end
        object EditMoeda7: TEditMoeda
          Left = 107
          Top = 191
          Width = 95
          Height = 21
          Alignment = taRightJustify
          Enabled = False
          TabOrder = 9
          FormatReal = fNumber
          FormatSize = '10.2'
        end
        object EditMoeda8: TEditMoeda
          Left = 107
          Top = 95
          Width = 95
          Height = 21
          Alignment = taRightJustify
          Enabled = False
          TabOrder = 3
          FormatReal = fNumber
          FormatSize = '10.2'
        end
        object EditMoeda9: TEditMoeda
          Left = 107
          Top = 143
          Width = 95
          Height = 21
          Alignment = taRightJustify
          Enabled = False
          TabOrder = 10
          FormatReal = fNumber
          FormatSize = '10.2'
        end
        object EditMoeda10: TEditMoeda
          Left = 107
          Top = 119
          Width = 95
          Height = 21
          Alignment = taRightJustify
          Enabled = False
          TabOrder = 11
          FormatReal = fNumber
          FormatSize = '10.2'
        end
        object EditMoeda11: TEditMoeda
          Left = 107
          Top = 71
          Width = 95
          Height = 21
          Alignment = taRightJustify
          Enabled = False
          TabOrder = 12
          FormatReal = fNumber
          FormatSize = '10.2'
        end
      end
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 437
        Height = 157
        Align = alTop
        TabOrder = 3
        object imgInformation: TImage
          Left = 412
          Top = 1
          Width = 24
          Height = 155
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
          ExplicitLeft = 839
          ExplicitTop = 11
          ExplicitHeight = 168
        end
        object MaskEdit1: TMaskEdit
          Left = 123
          Top = 2
          Width = 41
          Height = 21
          Enabled = False
          TabOrder = 0
        end
        object MaskEdit2: TMaskEdit
          Left = 169
          Top = 2
          Width = 109
          Height = 21
          Enabled = False
          TabOrder = 1
        end
        object MaskEdit3: TMaskEdit
          Left = 284
          Top = 2
          Width = 41
          Height = 21
          Enabled = False
          TabOrder = 2
        end
        object MaskEdit4: TMaskEdit
          Left = 123
          Top = 25
          Width = 41
          Height = 21
          Enabled = False
          TabOrder = 3
        end
        object MaskEdit5: TMaskEdit
          Left = 169
          Top = 25
          Width = 109
          Height = 21
          Enabled = False
          TabOrder = 4
        end
        object MaskEdit6: TMaskEdit
          Left = 284
          Top = 25
          Width = 41
          Height = 21
          Enabled = False
          TabOrder = 5
        end
        object MaskEdit7: TMaskEdit
          Left = 123
          Top = 47
          Width = 41
          Height = 21
          Enabled = False
          TabOrder = 6
        end
        object MaskEdit8: TMaskEdit
          Left = 169
          Top = 47
          Width = 109
          Height = 21
          Enabled = False
          TabOrder = 7
        end
        object MaskEdit9: TMaskEdit
          Left = 284
          Top = 47
          Width = 41
          Height = 21
          Enabled = False
          TabOrder = 8
        end
        object MaskEdit10: TMaskEdit
          Left = 123
          Top = 69
          Width = 41
          Height = 21
          Enabled = False
          TabOrder = 9
        end
        object MaskEdit11: TMaskEdit
          Left = 169
          Top = 69
          Width = 109
          Height = 21
          Enabled = False
          TabOrder = 10
        end
        object MaskEdit12: TMaskEdit
          Left = 284
          Top = 69
          Width = 41
          Height = 21
          Enabled = False
          TabOrder = 11
        end
        object MaskEdit13: TMaskEdit
          Left = 123
          Top = 91
          Width = 41
          Height = 21
          Enabled = False
          TabOrder = 12
        end
        object MaskEdit14: TMaskEdit
          Left = 169
          Top = 91
          Width = 109
          Height = 21
          Enabled = False
          TabOrder = 13
        end
        object MaskEdit15: TMaskEdit
          Left = 284
          Top = 91
          Width = 41
          Height = 21
          Enabled = False
          TabOrder = 14
        end
        object MaskEdit16: TMaskEdit
          Left = 169
          Top = 113
          Width = 109
          Height = 21
          Enabled = False
          TabOrder = 15
        end
        object MaskEdit17: TMaskEdit
          Left = 123
          Top = 113
          Width = 41
          Height = 21
          Enabled = False
          TabOrder = 16
        end
        object MaskEdit18: TMaskEdit
          Left = 284
          Top = 113
          Width = 41
          Height = 21
          Enabled = False
          TabOrder = 17
        end
        object MaskEdit19: TMaskEdit
          Left = 123
          Top = 135
          Width = 41
          Height = 21
          Enabled = False
          TabOrder = 18
        end
        object MaskEdit20: TMaskEdit
          Left = 169
          Top = 135
          Width = 109
          Height = 21
          Enabled = False
          TabOrder = 19
        end
        object MaskEdit21: TMaskEdit
          Left = 284
          Top = 135
          Width = 41
          Height = 21
          Enabled = False
          TabOrder = 20
        end
      end
      object Panel4: TPanel
        Left = 0
        Top = 238
        Width = 437
        Height = 116
        Align = alTop
        TabOrder = 4
        object DBGrid2: TDBGrid
          Left = 1
          Top = 1
          Width = 435
          Height = 99
          Align = alTop
          Color = clScrollBar
          DataSource = DtmBalcao.DtCtrlFormas
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
        end
        object BitBtn3: TBitBtn
          Left = 185
          Top = 99
          Width = 75
          Height = 16
          Caption = 'Detalhes >>'
          TabOrder = 1
          OnClick = BitBtn3Click
        end
      end
    end
  end
end
