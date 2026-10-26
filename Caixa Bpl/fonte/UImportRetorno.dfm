inherited frmImportRetorno: TfrmImportRetorno
  Left = 165
  Top = 267
  Caption = 'Processar arquivo de retorno'
  ClientHeight = 573
  ClientWidth = 842
  Position = poScreenCenter
  Scaled = False
  OnClose = FormClose
  ExplicitWidth = 850
  ExplicitHeight = 607
  PixelsPerInch = 96
  TextHeight = 13
  object Panel_Principal: TPanel
    Left = 0
    Top = 0
    Width = 842
    Height = 573
    Align = alClient
    TabOrder = 0
    object GroupBox_Dados: TGroupBox
      Left = 1
      Top = 1
      Width = 840
      Height = 240
      Align = alTop
      Caption = 'Dados banc'#225'rios e arquivo de retorno do banco'
      TabOrder = 0
      OnEnter = GroupBox_DadosEnter
      object pnEmpresaUnificada: TPanel
        Left = 2
        Top = 15
        Width = 836
        Height = 41
        Align = alTop
        BevelKind = bkTile
        BevelOuter = bvNone
        TabOrder = 0
        object Label6: TLabel
          Left = 0
          Top = 0
          Width = 832
          Height = 13
          Align = alTop
          Caption = 'Unificada:'
          ExplicitWidth = 48
        end
        object DBLookupComboBox_EmpresaUnificada: TDBLookupComboBox
          Left = 0
          Top = 15
          Width = 536
          Height = 21
          Hint = 'Selecione a empresa'
          KeyField = 'COD_EMPRESA'
          ListField = 'IDENTIFICACAO_EMP'
          ListSource = dtmImportPDVFinan.dsEmpresasUnificadas2
          TabOrder = 0
          OnExit = DBLookupComboBox_EmpresaUnificadaExit
        end
      end
      object pnOutrosDados: TPanel
        Left = 2
        Top = 56
        Width = 836
        Height = 169
        Align = alTop
        TabOrder = 1
        object imgInformation: TImage
          Left = 811
          Top = 1
          Width = 24
          Height = 167
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
          ExplicitLeft = 756
          ExplicitTop = 11
          ExplicitHeight = 168
        end
        object GroupBox3: TGroupBox
          Left = 1
          Top = 1
          Width = 370
          Height = 167
          Align = alLeft
          TabOrder = 0
          object Label19: TLabel
            Left = 2
            Top = 85
            Width = 366
            Height = 13
            Align = alTop
            Caption = 'Arquivo de retorno:'
            ExplicitWidth = 95
          end
          object Label7: TLabel
            Left = 2
            Top = 51
            Width = 366
            Height = 13
            Align = alTop
            Caption = 'Conv'#234'nio (Informe a configura'#231#227'o do arquivo de retorno)'
            ExplicitWidth = 276
          end
          object BitBtn_ProcessarArquivo: TBitBtn
            Left = 2
            Top = 120
            Width = 366
            Height = 25
            Hint = 'Processar arquivo de retorno  - [IFI002]'
            Align = alTop
            Caption = 'Processar Arquivo'
            TabOrder = 3
            OnClick = BitBtn_ProcessarArquivoClick
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FF6D3327853C1395440D96450D873D12703425FF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF70372A70372ACD7727E8AD70F3
              CCA1F4CDA3E9B176D07C2C6F35296F3529FF00FFFF00FFFF00FFFF00FFFF00FF
              86411DC0620BF0C292FFFEFAFDFAF6F5E3D1F5E2D0FDF8F4FFFFFDF2C99EC669
              117B3A21FF00FFFF00FFFF00FF8C451CC16107F7DBBDFFFEFEE0A46BCE6D13C7
              5C00C96100CE6E12DE9D5FFDFAF7FAE5CCC6680D6F3528FF00FFFF00FF8C451C
              ECBD8BFFFFFFDA8F43C65600FFFFFFDC9751C75B00CA6200C75B00D58333FDFA
              F8F3CB9F6F3528FF00FFA04D10CE7721FFFDFBE8B684D06B04D06B07FFFFFFFF
              FFFFE1A870C95E00CA6300C75B00DFA061FFFFFFCF7B28703525AF5507E5AA6F
              FFFFFFDD8F3FDA8128D87B1EFFFFFFFFFFFFFFFFFFEAC198CC6708C95F00CE6E
              0DFDFAF6E9B175703525BB5F0AF0CAA1FCF4EDE19343E29242DF8A34FFFFFFFF
              FFFFFFFFFFFFFFFFF3DEC6CF7017C95F00F5E3D0F3CEA4703525C1650FF2CDA6
              FDF7F0E9A158E9A056E6994AFFFFFFFFFFFFFFFFFFFFFFFFEBC39BCD6A0DC961
              00F6E6D4F3CCA1703525C1640DEEBC88FFFFFFF1B87CF0AE69EEA75FFFFFFFFF
              FFFFFFFFFFE7B17ACE6902C96100CF7111FEFCFAE7AC6D703525BF6006E5A059
              FFFDFAFBE0C4F8BA7BF4B471FFFFFFFFFFFFE8AB6DD87B1DD27414C85C00E2AA
              71FFFFFECC7520703525FF00FFC36204FAD9B8FFFFFFFEDCB8F7B877FFFFFFEB
              AD6DE08D37DA8228D06B05DB924AFFFFFFEFC08C6B342CFF00FFFF00FFC36204
              E79E55FEEBD7FFFFFFFBDFC3F1B578E89F55E29445DE9142E8B786FFFFFFF6D8
              B7BE5F066B342CFF00FFFF00FFFF00FFC6670CE69E55FAD9B6FFFBF6FFFFFFFE
              F8F2FDF6EFFFFFFFFEF9F2ECB884BE5F09753826FF00FFFF00FFFF00FFFF00FF
              FF00FFC06005C06005E49F5AEEBA86F2CAA0F0C599E4A768CC741E783A27783A
              27FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB65C0AB86012B9
              6113B25A0FA24F0E8E451AFF00FFFF00FFFF00FFFF00FFFF00FF}
          end
          object DBLookupComboBox_ControleBancario: TDBLookupComboBox
            Left = 2
            Top = 30
            Width = 366
            Height = 21
            Hint = 'Selecione o controle banc'#225'rio'
            Align = alTop
            KeyField = 'CODIGO_CTRL'
            ListField = 'NOME_CTRL'
            ListSource = dtmImportPDVFinan.dsControleBanco
            TabOrder = 0
            OnExit = DBLookupComboBox_ControleBancarioExit
          end
          object DBLookupComboBox_Cobrebem: TDBLookupComboBox
            Left = 2
            Top = 64
            Width = 366
            Height = 21
            Hint = 'Selecione o controle banc'#225'rio'
            Align = alTop
            KeyField = 'COD_COBREBEM'
            ListField = 'DESCRICAO'
            ListSource = dtmImportPDVFinan.dsCobrebem
            TabOrder = 1
            OnDropDown = DBLookupComboBox_CobrebemDropDown
            OnExit = DBLookupComboBox_CobrebemExit
          end
          object Panel5: TPanel
            Left = 2
            Top = 98
            Width = 366
            Height = 22
            Align = alTop
            BevelOuter = bvNone
            Caption = 'Panel5'
            TabOrder = 2
            object Edit_NomeArquivoRetorno: TEdit
              Left = 0
              Top = 0
              Width = 340
              Height = 22
              Hint = 'Nome do arquivo de retorno'
              Align = alClient
              Enabled = False
              TabOrder = 0
              ExplicitHeight = 21
            end
            object BitBtn_AbrirArquivo: TBitBtn
              Left = 340
              Top = 0
              Width = 26
              Height = 22
              Hint = 'Selecionar arquivo de retorno'
              Align = alRight
              TabOrder = 1
              OnClick = BitBtn_AbrirArquivoClick
              Glyph.Data = {
                36030000424D3603000000000000360000002800000010000000100000000100
                18000000000000030000120B0000120B00000000000000000000FF00FF078DBE
                078DBE078DBE078DBE078DBE078DBE078DBE078DBE078DBE078DBE078DBE078D
                BE078DBEFF00FFFF00FF078DBE25A1D172C7E785D7FA66CDF965CDF965CDF965
                CDF965CDF865CDF965CDF866CEF939ADD8078DBEFF00FFFF00FF078DBE4CBCE7
                39A8D1A0E2FB6FD4FA6FD4F96ED4FA6FD4F96FD4FA6FD4FA6FD4FA6ED4F93EB1
                D984D7EB078DBEFF00FF078DBE72D6FA078DBEAEEAFC79DCFB79DCFB79DCFB79
                DCFB79DCFB7ADCFB79DCFA79DCFA44B5D9AEF1F9078DBEFF00FF078DBE79DDFB
                1899C79ADFF392E7FB84E4FB83E4FC83E4FC84E4FC83E4FC83E4FB84E5FC48B9
                DAB3F4F9078DBEFF00FF078DBE82E3FC43B7DC65C3E0ACF0FD8DEBFC8DEBFC8D
                EBFD8DEBFD8DEBFC8DEBFD0C85184CBBDAB6F7F96DCAE0078DBE078DBE8AEAFC
                77DCF3229CC6FDFFFFC8F7FEC9F7FEC9F7FEC9F7FEC8F7FE0C85183CBC5D0C85
                18DEF9FBD6F6F9078DBE078DBE93F0FE93F0FD1697C5078DBE078DBE078DBE07
                8DBE078DBE0C851852D97F62ED9741C4650C8518078DBE078DBE078DBE9BF5FE
                9AF6FE9AF6FE9BF5FD9BF6FE9AF6FE9BF5FE0C851846CE6C59E48858E18861EB
                9440C1650C8518FF00FF078DBEFEFEFEA0FBFFA0FBFEA0FBFEA1FAFEA1FBFE0C
                85180C85180C85180C851856E18447CD6E0C85180C85180C8518FF00FF078DBE
                FEFEFEA5FEFFA5FEFFA5FEFF078CB643B7DC43B7DC43B7DC0C85184EDD7936BA
                540C8518FF00FFFF00FFFF00FFFF00FF078DBE078DBE078DBE078DBEFF00FFFF
                00FFFF00FFFF00FF0C851840D0650C8518FF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0C85182AB7432DBA490C85
                18FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FF0C851821B5380C8518FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FF0C85180C85180C85180C8518FF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0C85180C85180C
                85180C8518FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
            end
          end
          object Panel6: TPanel
            Left = 2
            Top = 15
            Width = 366
            Height = 15
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 4
            object Label8: TLabel
              Left = 0
              Top = 0
              Width = 143
              Height = 15
              Align = alLeft
              Caption = 'Controle banc'#225'rio p/ entrada:'
              ExplicitHeight = 13
            end
            object CheckBoxControlesConf: TCheckBox
              Left = 168
              Top = 0
              Width = 198
              Height = 15
              Align = alRight
              Caption = 'Exibir apenas controles configurados'
              TabOrder = 0
              OnClick = CheckBoxControlesConfClick
            end
          end
        end
        object GroupBox4: TGroupBox
          Left = 371
          Top = 1
          Width = 168
          Height = 167
          Align = alLeft
          Caption = 'Ocorr'#234'ncias c/ c'#243'digo de baixa:'
          TabOrder = 1
          object Label33: TLabel
            Left = 2
            Top = 15
            Width = 164
            Height = 13
            Align = alTop
            Caption = 'Total do arquivo de retorno:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ExplicitWidth = 160
          end
          object Label3: TLabel
            Left = 2
            Top = 52
            Width = 164
            Height = 13
            Align = alTop
            Caption = 'Cr'#233'dito(s) para quitar:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ExplicitWidth = 124
          end
          object Label4: TLabel
            Left = 2
            Top = 89
            Width = 164
            Height = 13
            Align = alTop
            Caption = 'Cr'#233'dito(s) quitados:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ExplicitWidth = 111
          end
          object btUnSelectAll: TSpeedButton
            Left = 87
            Top = 166
            Width = 23
            Height = 21
            Hint = ' Desfazer sele'#231#227'o'
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
          object btSelectAll: TSpeedButton
            Left = 58
            Top = 166
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
          object Edit_TotalOcorrenciaParaQuitar: TEdit
            Left = 2
            Top = 65
            Width = 164
            Height = 24
            Hint = 'Quantidade de boletos informadas no arquivo'
            Align = alTop
            BiDiMode = bdRightToLeft
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentBiDiMode = False
            ParentFont = False
            TabOrder = 0
            Text = '0'
          end
          object Edit_TotalOcorrenciaQuitadas: TEdit
            Left = 2
            Top = 102
            Width = 164
            Height = 24
            Hint = 'Quantidade de boletos informadas no arquivo'
            Align = alTop
            BiDiMode = bdRightToLeft
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentBiDiMode = False
            ParentFont = False
            TabOrder = 1
            Text = '0'
          end
          object Edit_TotalBaixa: TEdit
            Left = 2
            Top = 28
            Width = 164
            Height = 24
            Hint = 'Quantidade de boletos informadas no arquivo'
            Align = alTop
            BiDiMode = bdRightToLeft
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentBiDiMode = False
            ParentFont = False
            TabOrder = 2
            Text = '0'
          end
        end
        object GroupBox2: TGroupBox
          Left = 539
          Top = 1
          Width = 272
          Height = 167
          Align = alClient
          Caption = 'Lan'#231'amentos'
          TabOrder = 2
          object BitBtn_Imprimir: TBitBtn
            Left = 2
            Top = 141
            Width = 268
            Height = 24
            Hint = 'Imprimir - [IFI003]'
            Align = alBottom
            Caption = 'Imprimir'
            TabOrder = 4
            WordWrap = True
            OnClick = BitBtn_ImprimirClick
            Glyph.Data = {
              F6060000424DF606000000000000360000002800000018000000180000000100
              180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6C6A6A6C
              6A6A6C6A6AFF00FFFF00FFFF00FFFF00FF6C6A6A6C6A6AFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FF6C6A6AB0ADAD9692938E8A8B6C6A6A6C6A6A817E7F6C6A6ADDDCDCD0CFCF6C
              6A6A6C6A6A6C6A6AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FF6C6A6AD5D4D4C6C4C4A19F9FA19F9FA19F9F8381825C5B5BBCBC
              BCCECECECFCFCFD1D1D1D3D3D3CAC9C96C6A6A6C6A6A6C6A6AFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FF6C6A6AD8D7D7E0DEDEC0BFBFA19F9FA19F9FA19F9F
              6260600000000000001616165D5D5DA9A9A9CACACACACACACACACACACACAC1C0
              C06C6A6A6C6A6A6C6A6AFF00FFFF00FF6C6A6AD3D3D3D4D3D3CFCFCF8C8A8A81
              7F7F817F7F817F7F6C6A6A1414140808080000000000000000001616165D5D5D
              A9A9A9CACACACACACAB7B6B6B7B6B66C6A6AFF00FF6C6A6ACACACACACACAC6C6
              C68E8C8CB8B5B5B6B4B4A19F9FA19F9F9F9D9D9997979390918280805250502B
              2A2A080808000000000000161616646464817E7F6C6A6AFF00FFFF00FF6C6A6A
              CACACAC5C5C58E8C8CD7D4D4F7F6F6F6F4F4F2F0F0E0DEDECAC7C7B6B5B5A5A3
              A3A19F9FA19F9F9E9A9C9390916865662322230303031919199997976C6A6AFF
              00FFFF00FF6C6A6AC5C5C58E8C8CE7E6E6F7F6F6F7F6F6F6F4F4F2F0F0EEEDED
              EAEAEAE7E6E6E3E2E2D4D3D3C2C1C1AFADADA19F9FA19F9F9997978280806C6A
              6A9F9D9D6C6A6AFF00FFFF00FF6C6A6A8E8C8CEFEEEEF7F6F6F7F6F6F7F6F6F6
              F4F4D5D3D4867B7E958B8EC1BFBFDDDCDCE0E0E0DCDCDCD8D8D8D1D1D1C2C1C1
              B2B0B0A19F9F9C99996C6A6A6C6A6AFF00FFFF00FF6C6A6ACECBCCF7F6F6F7F6
              F6F7F6F6F7F6F6CFCBCCAFACADADABAB9E989883797B75696B898081ABA5A6C7
              C6C6D5D5D5D1D1D1CECECEC9C7C7BBBABAA6A4A46C6A6AFF00FFFF00FFFF00FF
              6C6A6A6C6A6ACECBCCEDEBEBAFA4A56B5D5F766A6C83787A9C9697ACAAAAB2B0
              B0ABA7A9989192817778847A7D938C8EBFBFBFCBCBCBCACACAC0C0C06C6A6AFF
              00FFFF00FFFF00FFFF00FFFF00FF6C6A6A6C6A6ABD8281AF8A737D5E51665456
              6554576D5E626D5E62898081A09A9CAFACADB2B0B0A49FA0CAC9CACBCBCBB7B6
              B66C6A6AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBD8281FF
              D4ABFFD0A1FFCB98D5A57BA1785C7B665F6050536656596F62658E8687CECCCC
              CFCFCFA5A4A46C6A6AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFBD8281FFD9B2FFD4A9FFCFA0FFCA97FFC68EFFC186FFBF81FFC084BD
              82816C6A6A6C6A6A6C6A6A6C6A6AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFBD8281FFDDBAFFD8B1FFD3A7FFCE9EFFCA96FFC5
              8CFFC084FFC084BD8281FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFBD8281FFE5CBFFE1C2FFDCB8FFD7AF
              FFD3A6FFCE9DFFC995FFC48BBD8281FF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBD8281FFEAD4FF
              E5CAFFE0C0FFDAB7FFD7ADFFD1A5FFCC9CFFC792BD8281FF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFBD8281FFEEDCFFE9D1FFE3C9FFE0BFFFDAB6FFD5ACFFD0A3F7C297BD8281FF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFBD8281FFF7EEFFF2E3FFEDDAFFE7D0FFE3C7FFDEBDFFD9B4FFD4
              ABBD8281FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFBD8281FFFAF3FFFAF3FFF6EDFFF0E2FFEBD9FFE7CF
              FFE2C5FFDDBCF2C7A9BD8281FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBD8281BD8281BD8281BD8281FF
              F4EBFFF0E1FFEBD7FFE6CEFBDCC0BD8281FF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFBD8281BD8281BD8281BD8281BD8281FF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
          end
          object GroupBox5: TGroupBox
            Left = 2
            Top = 76
            Width = 268
            Height = 65
            Align = alBottom
            TabOrder = 3
            object Label5: TLabel
              Left = 2
              Top = 15
              Width = 264
              Height = 13
              Align = alTop
              Alignment = taCenter
              Caption = 'Total de ocorr'#234'ncias no arquivo:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              ExplicitWidth = 186
            end
            object Edit_TotalOcorrencias: TEdit
              Left = 2
              Top = 28
              Width = 264
              Height = 28
              Hint = 'Quantidade de boletos informadas no arquivo'
              Align = alTop
              BiDiMode = bdRightToLeft
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentBiDiMode = False
              ParentFont = False
              TabOrder = 0
              Text = '0'
            end
          end
          object Panel8: TPanel
            Left = 2
            Top = 15
            Width = 268
            Height = 25
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 0
            object CheckBox_LancarTaxa: TCheckBox
              Left = 2
              Top = 10
              Width = 131
              Height = 13
              Hint = 
                'Lan'#231'ar tarifa banc'#225'ria referente aos boletos no caixa durante o ' +
                'processamento do arquivo'
              Caption = 'Lan'#231'ar tarifa banc'#225'ria'
              Color = clBtnFace
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              TabOrder = 0
              WordWrap = True
              OnClick = CheckBox_LancarTaxaClick
            end
            object Edit_TarifaBancaria: TEdit
              Left = 165
              Top = 6
              Width = 100
              Height = 21
              Hint = 'Total da tarifa banc'#225'ria'
              BiDiMode = bdRightToLeft
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentBiDiMode = False
              ParentFont = False
              TabOrder = 1
              Text = '0,00'
            end
          end
          object Panel9: TPanel
            Left = 2
            Top = 40
            Width = 268
            Height = 25
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 1
            object CheckBox_LancarJuros: TCheckBox
              Left = 2
              Top = 8
              Width = 157
              Height = 13
              Hint = 
                'Lan'#231'ar juros referente aos boletos no caixa durante o processame' +
                'nto do arquivo'
              Caption = 'Lan'#231'ar juros dos boletos'
              Color = clBtnFace
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              TabOrder = 0
              WordWrap = True
              OnClick = CheckBox_LancarJurosClick
            end
            object Edit_JurosBol: TEdit
              Left = 165
              Top = 4
              Width = 100
              Height = 21
              Hint = 'Total do juros cobrados'
              BiDiMode = bdRightToLeft
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentBiDiMode = False
              ParentFont = False
              TabOrder = 1
              Text = '0,00'
            end
          end
          object Panel10: TPanel
            Left = 2
            Top = 65
            Width = 268
            Height = 25
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 2
            object CheckBox_LancarDesconto: TCheckBox
              Left = 2
              Top = 6
              Width = 163
              Height = 13
              Hint = 
                'Lan'#231'ar descontos referente aos boletos no caixa durante o proces' +
                'samento do arquivo'
              Caption = 'Lan'#231'ar desconto dos boletos'
              Color = clBtnFace
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              TabOrder = 0
              WordWrap = True
              OnClick = CheckBox_LancarDescontoClick
            end
            object Edit_DescontoBol: TEdit
              Left = 165
              Top = 2
              Width = 100
              Height = 21
              Hint = 'Total do desconto'
              BiDiMode = bdRightToLeft
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentBiDiMode = False
              ParentFont = False
              TabOrder = 1
              Text = '0,00'
            end
          end
        end
      end
    end
    object Panel1: TPanel
      Left = 1
      Top = 540
      Width = 840
      Height = 32
      Align = alBottom
      TabOrder = 1
      object Gauge_HistoricoRetorno: TGauge
        Left = 1
        Top = 1
        Width = 838
        Height = 30
        Align = alBottom
        Progress = 0
        Visible = False
        ExplicitLeft = 3
        ExplicitTop = -9
      end
      object QRLabel22: TQRLabel
        Left = 845
        Top = 84
        Width = 8
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666660000
          2235.729166666667000000
          222.250000000000000000
          21.166666666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '|'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        FontSize = 8
      end
    end
    object PageControl_Retorno: TPageControl
      Left = 1
      Top = 241
      Width = 840
      Height = 299
      ActivePage = tsCreditos
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      object tsCreditos: TTabSheet
        Caption = 'Cr'#233'ditos - Processamento'
        ImageIndex = 1
        object DBGrid_Retorno: TDBGrid
          Left = 0
          Top = 0
          Width = 832
          Height = 206
          Align = alClient
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
          PopupMenu = PopupMenu_Retorno
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnCellClick = DBGrid_RetornoCellClick
          OnDrawColumnCell = DBGrid_RetornoDrawColumnCell
          OnDblClick = DBGrid_RetornoDblClick
          OnKeyDown = DBGrid_RetornoKeyDown
          Columns = <
            item
              Expanded = False
              FieldName = 'SEL'
              Title.Caption = 'Sel'
              Width = 20
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'N_DOC_C'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOME_C'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RAZAO'
              Title.Caption = 'Raz'#227'o Social'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VALOR_C'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DATA_VENC_C'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VALOR_PAGO'
              Width = 84
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DATA_PAGAMENTO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIPO_DOC_C'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'HISTORICO_C'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VALOR_JUROS'
              Width = 121
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VALOR_DESCONTO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TAXA_COBRANCA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOSSO_NUMERO_BANCO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COD_CRED'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'OCORRENCIABANCARIA'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COD_EMP_MULT'
              Title.Caption = 'Cod Unificada'
              Visible = True
            end>
        end
        object Panel3: TPanel
          Left = 0
          Top = 206
          Width = 832
          Height = 65
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 1
          object GroupBox1: TGroupBox
            Left = 245
            Top = 0
            Width = 587
            Height = 65
            Align = alClient
            Caption = 'Soma do valor pago pelo cliente'
            TabOrder = 0
            object Label1: TLabel
              Left = 84
              Top = 14
              Width = 190
              Height = 13
              Alignment = taRightJustify
              Caption = 'Total subtra'#237'do o juros cobrados:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label2: TLabel
              Left = 240
              Top = 38
              Width = 34
              Height = 13
              Alignment = taRightJustify
              Caption = 'Total:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object btSelectAllCred: TSpeedButton
              Left = 6
              Top = 26
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
              OnClick = btSelectAllCredClick
            end
            object btUnSelectAllCred: TSpeedButton
              Left = 35
              Top = 26
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
              OnClick = btUnSelectAllCredClick
            end
            object Edit_Soma: TEdit
              Left = 280
              Top = 33
              Width = 89
              Height = 21
              Hint = 'Soma total'
              BiDiMode = bdRightToLeft
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentBiDiMode = False
              ParentFont = False
              TabOrder = 0
              Text = '0,00'
            end
            object Edit_SomaMenosJuros: TEdit
              Left = 280
              Top = 9
              Width = 89
              Height = 21
              Hint = 'Soma total menos Juros'
              BiDiMode = bdRightToLeft
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentBiDiMode = False
              ParentFont = False
              TabOrder = 1
              Text = '0,00'
            end
            object BitBtn_SomarSelecionados: TBitBtn
              Left = 414
              Top = 15
              Width = 171
              Height = 48
              Hint = 'Somar os cr'#233'ditos selecionados'
              Align = alRight
              Caption = 'Somar Selecionados'
              TabOrder = 2
              OnClick = BitBtn_SomarSelecionadosClick
              Glyph.Data = {
                36050000424D3605000000000000360400002800000010000000100000000100
                08000000000000010000E30E0000E30E0000000100000001000031319C003131
                A5003131AD003131B5003131BD003131C6003131CE003131D6003131DE003131
                E7003131EF003131F700FF00FF003131FF003139FF003939FF003942FF00424A
                FF004A4AFF005252FF006363FF006B6BFF006B73FF007B84FF00848CFF009C9C
                FF00C6CEFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000C1B1B1B1B1B
                1B1B1B1B1B1B1B1B1B0C1B16030404040505040403030201141B1B05080A0B0B
                0A0B0A0A0A090805001B1B070A0E0E0E0E0E0E0E0E0E0906021B1B090E0E0E0E
                0E1B180E0E0E0B08031B1B0A0E0E0E0E0E1B180E0E0E0E09041B1B0E0E0E0E0E
                0E1B180E0E0E0E0A051B1B0E0E181818181B181818180B0A061B1B0E0E1B1B1B
                1B1B1B1B1B1B0A0A061B1B0E10100E0E0E1B180E0E0B0A0A061B1B0E1313100E
                0E1B180E0E0B0A0A061B1B1015141110101B180E0E0E0B0B061B1B1318151312
                111B180E0E0E0E0B061B1B1419181514131211100E0E0E0B041B1B1A1412100E
                0E0E0E0E0E0E0B08171B0C1B1B1B1B1B1B1B1B1B1B1B1B1B1B0C}
            end
          end
          object Panel4: TPanel
            Left = 0
            Top = 0
            Width = 245
            Height = 65
            Align = alLeft
            BevelKind = bkTile
            BevelOuter = bvNone
            Caption = 'Panel4'
            TabOrder = 1
            object BitBtn_QuitarCreditos: TBitBtn
              Left = 0
              Top = 0
              Width = 241
              Height = 61
              Cursor = crHandPoint
              Hint = 'Baixar os cr'#233'ditos selecionados  - [IFI001]'
              Align = alClient
              Caption = 'Quitar Cr'#233'ditos Selecionados'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 0
              OnClick = BitBtn_QuitarCreditosClick
              Glyph.Data = {
                3A060000424D3A06000000000000FA0300002800000018000000180000000100
                08000000000040020000120B0000120B0000F1000000F10000007A6EA600230F
                530066537900FF00FF009E999C009A909500F0EAED009C939700F3EEF0009C91
                95009D9799009C8E9200EFE7E900EBE3E500FAF6F700F6F2F300937078006F36
                4200926D750091697000926D74008B696F008E5C640090656C0091696F00E2D5
                D7006A3A41008C585F0090626800866A6E00E5D9DA00E7DCDD00EAE0E1006736
                3900A17D7F00A7878900B4979900B1959700B59A9C00CAB0B200AA8B8C00B295
                9600C2A6A700BAA0A100C6ABAC00D0BCBD0058292A00906A6B0095727300A481
                8200A3808100A5838400A68687006D414100A4828200B69D9D00B89F9F00FBFA
                FA005E201C00825350007F443900AA8B8400B2968F007A3721007D3C24008B57
                4200997567009C310000972D000083422500966C5A00C4ACA1008E3205008434
                0D00A73A00009D3903009C3C0500983905008E441B00A0542800A9410200A442
                05009E3E0500923E0A00974E2000BFA59500B54A0200A7460500986B4C00996F
                5200CA550000C6520000965A2C009668450097694800B8998200D9620000BD57
                0500975823009E6A3F00A1704900E76D00009C653500AB5C0D00AF733800B177
                4000AB7E5100BA8E6200C19E7A00C7AD9300AD621400AF671B00B0681C00B26E
                2500B4732A00B4742C00BA885100BD956900C2A38100B67A3500B77B3700BA81
                4000BA834200D17D1100D4821800D4841B00D88C2400D88E2600DA963000DC96
                3100DE9F3E00E2AA4D00E5B25900E6B45C00E9BB6700E9BB6800EABF6E00EDC6
                7800EEC97E00EBC57600EFCF8700F2D49000F3D99700F4DEA000F6E2A600FAEB
                B600524F38003C3D2200414228002C351500243D130025401500345629002557
                1F0017561400004B0000004D010007650C0008670E00096A10000C7015000E75
                180013741C000D7518000F781B00117F1F0014832300178A2800168928001C93
                3000188F2D001E993500209E3900219F3A0023A43F0024A44400177A3C001873
                4C000F315D00DDE5FF007E9AFF0087A1FF008CA5FF0099B0FF00B0C1FF00B5C5
                FF00BCCBFF00D5DEFF003E64FF00496CFC005173FF005477FF005B7BFF006584
                FF006B8AFF007690FF00889FFF00ADBDFF00C1CEFF00C5D0FF00EAEEFF00143B
                FF00183EFF002249FF00274DFF002A51FF003658FF00375BFF00EDF0FF00072B
                FF00072CFF00082BFF00092EFF000B30FF000D32FF000F35FF001037FF00163C
                FF00001EFF00001FFF000121FF000324FF000325FF000528FF000628FF000019
                EE000016E6000720DE000F22C9001C2CBC001E30C400010FA1000310B400000C
                BF00020FBC00282DA400000397000D0D7F001D1F9300FFFFFF00000000000303
                030303ECECEC03030303030303030303030303030303030303E8E8DADADAECEC
                9C9C9C9C9C9B03030303030303030303E8DADADAC5DADADAE9B0A4A4A4A19C9C
                9C9C0303030303E8DBDACEBBEFC5E0DADAE7AFAEAEADABA9A7A09C9C030303E8
                DDD3C8C4C6C5C4DADAE2B1ACADABA9AAA8A6A59F9C03E8D5D1D6C0E0C5C3C5DA
                DADAB29892352E9499A2A3A09E9CE8CCD8D4D7B6EFEFCEDADADAED312A22111C
                3B21939A9D9CE8BFCDD7B9BBC7D9DCDBDADA01332C3211171C161B979D9C03EC
                C2D9EFBDB9BECADEDCE13A342C361113171C16969D0303ECB7C1BAD0D0EFCFD2
                DFEA4B232733111213171C9503030303ECB8B6B5B3BECBC9E31A4F2927341110
                121817110303030303ECB4B7B5C2BCE4002D2D28282F11151014181103030303
                0303EEE5E6EB026A775C627D7B671150493F3C11030303030303118E8C5D8784
                8378737F7D6E115B4C48441103030303030311908E588986847977807F701160
                574D4A11030303030303119190598C8B86747982817111655651561103030303
                03031147473D3E2B2B3726242530111D3B414111030303030303115F6C46756B
                74646469685C115445403F11030303030303118F8D5E88858378727E7C6E115A
                5248431103030303030311918F598A88857A77807E6F1160574C4A1103030303
                030311556D42766C756366777262116153534E11030303030303110E0F08060C
                0D201F1E1938110A07090B1103030303030311390E0F08060C0D201F1E2B1104
                0A0705110303030303031111111111111111111111111111111111110303}
            end
          end
        end
      end
      object tsHistorico: TTabSheet
        Caption = 'Hist'#243'rico - Log Arquivo'
        object Memo_Retorno: TMemo
          Left = 0
          Top = 41
          Width = 832
          Height = 230
          Align = alClient
          ReadOnly = True
          ScrollBars = ssVertical
          TabOrder = 0
        end
        object Panel2: TPanel
          Left = 0
          Top = 0
          Width = 832
          Height = 41
          Align = alTop
          Caption = 'Hist'#243'rico do Processamento'
          Color = clGradientInactiveCaption
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
        end
      end
      object tsTitulosNaoConciliados: TTabSheet
        Caption = 'T'#237'tulos N'#227'o Encontrados (A Quitar)'
        ImageIndex = 4
        object DBGrid_TitulosNaoConciliados: TDBGrid
          Left = 0
          Top = 0
          Width = 832
          Height = 206
          Align = alClient
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
          PopupMenu = PopupMenu_TitulosNaoConciliados
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnCellClick = DBGrid_TitulosNaoConciliadosCellClick
          OnDrawColumnCell = DBGrid_TitulosNaoConciliadosDrawColumnCell
          OnDblClick = DBGrid_TitulosNaoConciliadosDblClick
          OnKeyDown = DBGrid_TitulosNaoConciliadosKeyDown
        end
        object Panel7: TPanel
          Left = 0
          Top = 206
          Width = 832
          Height = 65
          Align = alBottom
          BevelKind = bkTile
          BevelOuter = bvNone
          BiDiMode = bdLeftToRight
          ParentBiDiMode = False
          TabOrder = 1
          object BitBtnVincTitNaoEnc: TBitBtn
            Left = 0
            Top = 0
            Width = 241
            Height = 61
            Cursor = crHandPoint
            Hint = 'Vincular t'#237'tulo n'#227'o encontrado ao cr'#233'dito - [BOL040]'
            Align = alLeft
            Caption = 'Vincular T'#236'tulo N'#227'o Encontrado'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            OnClick = BitBtnVincTitNaoEncClick
            Glyph.Data = {
              52060000424D5206000000000000120400002800000018000000180000000100
              08000000000040020000120B0000120B0000F7000000F700000000000000FFFF
              FF00FF00FF00BDBBBB00BBBABA008E5D5900694542006A4541006E443B006D41
              3600821F0000811E00008B2500008A240000872200008421000087230100FAF4
              F200FBF8F70082300E009C310000962F0100A6380000A6390000A4380000A336
              0000A3370000A1350000A1360000A0350000B46B4700AC3F0000A73A00009F39
              03009D43120096502800915F4400B6450000B5440000B1420000B0410000B646
              01009A451200A9704D00B8480000A64D1100AF623000AA500F00B4672C00B8A9
              9E00D7600000BA5F1700B8641F00CF824500CE814500CC824500CB824500CA82
              4500BD7B4500D3925D00D1915D00CF915D00FEF3EA00C7814500C6814500CC91
              5D00CA905D00FFF4EA00FEF3E900C6905D00C5915D00BB916900FFD0A300FFD1
              A300FED0A300FED1A400FFD7B000FFD8B000FED7B000FFDEBD00FFDEBF00FEDE
              BF00FEE5CC00FFEDDC00FEEDDC00B6AA9E00FEF4EA00D5812700FFE0BD00FFE6
              CC00FEE6CC00FFEEDC00FEEEDC00AFA79E00FEF4E900B2A99E00FEFAF400A5A1
              9500ABA99F00A3A193009EA19300878B810099A09300959F9300445C4A00C6D3
              CB008EA39C00B6BABA00A4BBBD00DAFBFF00F4FEFF009AF2FF009CF2FF00B7F6
              FF0090C0C7009AC9D000C4EDF300A7CACF00CEF6FC00D3FAFF00D1F3F800D8FA
              FF00DEFAFE00E6FCFF00A9B8BA00EEF6F700F7FEFF0081EDFF0083EDFF0083EE
              FF0084EDFF0086EEFF0087EEFF0088EDFF0088EEFF0089EEFF008AEEFF008BEF
              FF008CEEFF008CEFFF008FEEFF0090EEFF0091EFFF0092EFFF0093EFFF0095EF
              FF0095F0FF0096EFFF0096F0FF0097EFFF0097F0FF0098EFFF0098F0FF0099F0
              FF009AF0FF009CF0FF009DF0FF009EF0FF009EF2FF009FF2FF00A1F2FF00A3F2
              FF00A4F2FF00A5F2FF00A6F2FF00A7F3FF00A9F2FF00AAF2FF00AAF3FF00ABF3
              FF009FE2EE00ACF3FF00ADF3FF00A9EAF600B0F3FF00B0F4FF00B1F3FF00B1F4
              FF00B2F4FF0086B7BF00B4F4FF008CBFC700B5F4FF00B6F4FF00ADE9F300B7F4
              FF00B8F4FF00B8F4FE00BAF4FE00BCF6FF00B5EAF300BFF6FF00C0F6FF00C1F6
              FF00C2F6FF00BCEEF700C4F6FF00C4F7FF00BCEBF300C7F7FF00C0EEF600C9F7
              FF00AAD0D700CBF7FF00CFF8FF00CFF7FE00CBEDF300D7F8FE00DEFAFF00E1FB
              FF00DCF3F700E2F4F700EBFCFF00ACB8BA00F8FEFF00A0F0FF00A1F0FF008ABF
              C900BBF4FF00BCF4FF00C5EFF700B1D1D700D7F2F700E5FAFE00EBFBFE00EEFC
              FF00E9FBFF00E7F4F700F0FBFE00F2FCFF0000BDFF000A597600B2B8BA00F6FC
              FE000081BD000080BC00007EB800007DB700007DB600017FB800017EB600FCFE
              FF00FBFCFE00FEFEFF00FEFEFE00F8F8F800F4F4F40002020202020202EAEAEA
              EAEAEAEAEAEAEAEAEAEAEAEAEA0202020202020202EAA19E6F95908E8B888582
              807F7F7FEA0202020202020202EAA8A4A09D99948F8C89878482817FEA020202
              0202020202EAB0ABA6A29F7098928E8C88868381EA0202020202020202EABBB6
              AEA9A4A19D9B95908D8A8884EA0205050505050505EAC0BDB9B4ACA7A4A09D99
              938F8C89EA0205494B4A484948EAC9C4BFBCB7B1ABA6A2D79C97918EEA02054C
              4C4C4C4D4EEACCCBC7C27372B5D9AAA5A19D9A96EA02054F4F584F5150EA7977
              76232D2F2A65B3ADA8A4D89EEA020559525A575757EAD06D2B28172127156AB8
              B1ABA5A3EA02055C53545C5B5CEA7BD13A1F2469221667BEBAB6AFA9EA020544
              5E43563E43EAD4E2401B6CCF471866C6C1DB71B2EA0205606060575757EAE5E1
              3F1D7C7A461C6474C9C5C0DAEA0205F4F4F4F4F4F4EA7E6E391DD5DF451C63CE
              CDDCC8C3EB0205F4F4F4F4F4F4EAF1D6381DE8E0421A61DE78DD75CAEC0205F4
              F4F4F4F4F4EA01F3371D6BE4411A62D2EBEDEEEDEB0205F4F4F4F4F4F4EA0101
              351D04E93D1A5DD3EAE6E6E6EA0205F4F4F4F4F4F4EA0101361C03F23C1A5FE3
              EAE6E6EA020205F4F4F4F4F4F4EA01011E1012013B1A557DEAE6EA02020205F4
              F4F4F4F4F4EAEAEAEFF0EAEA681AE7EDEAEA0502020205F4F4F4F4F4F4F4F4F4
              F4F5F4112E2031F6F4F405020202050505050505050505060806071326140905
              0505050202020202020202020202293233303425190B02020202020202020202
              020202020202022C0F0E0D0C0A020202020202020202}
          end
          object GroupBox6: TGroupBox
            Left = 241
            Top = 0
            Width = 587
            Height = 61
            Align = alClient
            Caption = 'Soma dos t'#237'tulos n'#227'o encontrados'
            TabOrder = 1
            object Label9: TLabel
              Left = 84
              Top = 14
              Width = 190
              Height = 13
              Alignment = taRightJustify
              Caption = 'Total subtra'#237'do o juros cobrados:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label10: TLabel
              Left = 240
              Top = 38
              Width = 34
              Height = 13
              Alignment = taRightJustify
              Caption = 'Total:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object btSelectAllTitNaoEnc: TSpeedButton
              Left = 6
              Top = 26
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
              OnClick = btSelectAllTitNaoEncClick
            end
            object btUnSelectAllTitNaoEnc: TSpeedButton
              Left = 35
              Top = 26
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
              OnClick = btUnSelectAllTitNaoEncClick
            end
            object Edit_SomaTitNaoEnc: TEdit
              Left = 280
              Top = 33
              Width = 89
              Height = 21
              Hint = 'Soma total'
              BiDiMode = bdRightToLeft
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentBiDiMode = False
              ParentFont = False
              TabOrder = 0
              Text = '0,00'
            end
            object Edit_SomaMenosJurosTitNaoEnc: TEdit
              Left = 280
              Top = 9
              Width = 89
              Height = 21
              Hint = 'Soma total menos Juros'
              BiDiMode = bdRightToLeft
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentBiDiMode = False
              ParentFont = False
              TabOrder = 1
              Text = '0,00'
            end
            object BitBtn_SomarSelecionadosTitNaoEnc: TBitBtn
              Left = 414
              Top = 15
              Width = 171
              Height = 44
              Hint = 'Somar os t'#237'tulos n'#227'o encontrados selecionados'
              Align = alRight
              Caption = 'Somar Selecionados'
              TabOrder = 2
              OnClick = BitBtn_SomarSelecionadosTitNaoEncClick
              Glyph.Data = {
                36050000424D3605000000000000360400002800000010000000100000000100
                08000000000000010000E30E0000E30E0000000100000001000031319C003131
                A5003131AD003131B5003131BD003131C6003131CE003131D6003131DE003131
                E7003131EF003131F700FF00FF003131FF003139FF003939FF003942FF00424A
                FF004A4AFF005252FF006363FF006B6BFF006B73FF007B84FF00848CFF009C9C
                FF00C6CEFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000C1B1B1B1B1B
                1B1B1B1B1B1B1B1B1B0C1B16030404040505040403030201141B1B05080A0B0B
                0A0B0A0A0A090805001B1B070A0E0E0E0E0E0E0E0E0E0906021B1B090E0E0E0E
                0E1B180E0E0E0B08031B1B0A0E0E0E0E0E1B180E0E0E0E09041B1B0E0E0E0E0E
                0E1B180E0E0E0E0A051B1B0E0E181818181B181818180B0A061B1B0E0E1B1B1B
                1B1B1B1B1B1B0A0A061B1B0E10100E0E0E1B180E0E0B0A0A061B1B0E1313100E
                0E1B180E0E0B0A0A061B1B1015141110101B180E0E0E0B0B061B1B1318151312
                111B180E0E0E0E0B061B1B1419181514131211100E0E0E0B041B1B1A1412100E
                0E0E0E0E0E0E0B08171B0C1B1B1B1B1B1B1B1B1B1B1B1B1B1B0C}
            end
          end
        end
      end
      object TabSheet_Relatorio: TTabSheet
        Caption = 'Relat'#243'rio'
        ImageIndex = 2
        object ScrollBox_Relatorio: TScrollBox
          Left = 0
          Top = 0
          Width = 832
          Height = 271
          VertScrollBar.Position = 104
          Align = alClient
          TabOrder = 0
          object QuickRep_Retorno: TQuickRep
            Left = 0
            Top = -97
            Width = 1123
            Height = 794
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            DataSet = dtmImportPDVFinan.cdsQuitarCreditos
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
            OnPreview = QuickRep_RetornoPreview
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
            SnapToGrid = True
            Units = MM
            Zoom = 100
            PrevFormStyle = fsNormal
            PreviewInitialState = wsMaximized
            PrevInitialZoom = qrZoomToFit
            PreviewDefaultSaveType = stQRP
            object DetailBand1: TQRBand
              Left = 38
              Top = 148
              Width = 1047
              Height = 37
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              AlignToBottom = False
              BeforePrint = DetailBand1BeforePrint
              Color = clWhite
              TransparentBand = False
              ForceNewColumn = False
              ForceNewPage = False
              Size.Values = (
                97.895833333333340000
                2770.187500000000000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              BandType = rbDetail
              object QRDBText3: TQRDBText
                Left = -9
                Top = 6
                Width = 57
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  -23.812500000000000000
                  15.875000000000000000
                  150.812500000000000000)
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Color = clWhite
                DataSet = dtmImportPDVFinan.cdsQuitarCreditos
                DataField = 'COD_CRED'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Courier New'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRDBText7: TQRDBText
                Left = 1692
                Top = 6
                Width = 100
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  4476.750000000000000000
                  15.875000000000000000
                  264.583333333333400000)
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Color = clWhite
                DataSet = DtmBoletos.cdsBoletos
                DataField = 'NOME_CLIENTE'
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
              object QRDBText8: TQRDBText
                Left = 732
                Top = 6
                Width = 50
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1936.750000000000000000
                  15.875000000000000000
                  132.291666666666700000)
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Color = clWhite
                DataSet = dtmImportPDVFinan.cdsQuitarCreditos
                DataField = 'VALOR_C'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Courier New'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRDBText9: TQRDBText
                Left = 828
                Top = 6
                Width = 71
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  2190.750000000000000000
                  15.875000000000000000
                  187.854166666666700000)
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Color = clWhite
                DataSet = dtmImportPDVFinan.cdsQuitarCreditos
                DataField = 'VALOR_CORR'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Courier New'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRDBText4: TQRDBText
                Left = 269
                Top = 3
                Width = 43
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  711.729166666666800000
                  7.937500000000000000
                  113.770833333333300000)
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Color = clWhite
                DataSet = dtmImportPDVFinan.cdsQuitarCreditos
                DataField = 'NOME_C'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Courier New'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRDBText5: TQRDBText
                Left = 276
                Top = 18
                Width = 36
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  730.250000000000000000
                  47.625000000000000000
                  95.250000000000000000)
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Color = clWhite
                DataSet = dtmImportPDVFinan.cdsQuitarCreditos
                DataField = 'RAZAO'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Courier New'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRDBText2: TQRDBText
                Left = 995
                Top = 21
                Width = 43
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  2632.604166666667000000
                  55.562500000000000000
                  113.770833333333300000)
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Color = clWhite
                DataSet = dtmImportPDVFinan.cdsQuitarCreditos
                DataField = 'DATQ_C'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Courier New'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRDBText11: TQRDBText
                Left = 313
                Top = 6
                Width = 148
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  828.145833333333200000
                  15.875000000000000000
                  391.583333333333400000)
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Color = clWhite
                DataSet = dtmImportPDVFinan.cdsQuitarCreditos
                DataField = 'DATA_RETORNO_QUITACAO'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Courier New'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRDBText12: TQRDBText
                Left = 961
                Top = 6
                Width = 78
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  2542.645833333333000000
                  15.875000000000000000
                  206.375000000000000000)
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Color = clWhite
                DataSet = dtmImportPDVFinan.cdsQuitarCreditos
                DataField = 'DATA_VENC_C'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Courier New'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRDBText1: TQRDBText
                Left = 584
                Top = 6
                Width = 127
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1545.166666666667000000
                  15.875000000000000000
                  336.020833333333400000)
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                BiDiMode = bdLeftToRight
                ParentBiDiMode = False
                Color = clWhite
                DataSet = dtmImportPDVFinan.cdsQuitarCreditos
                DataField = 'NOSSO_NUMERO_BANCO'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Courier New'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRLabel_n_doc_c: TQRLabel
                Left = 487
                Top = 6
                Width = 78
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1288.520833333333000000
                  15.875000000000000000
                  206.375000000000000000)
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Caption = '0'
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
            object PageHeaderBand1: TQRBand
              Left = 38
              Top = 38
              Width = 1047
              Height = 110
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
                291.041666666666700000
                2770.187500000000000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              BandType = rbPageHeader
              object QRPLabel1: TQRPLabel
                Left = 5
                Top = 33
                Width = 169
                Height = 18
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  47.625000000000000000
                  13.229166666666670000
                  87.312500000000000000
                  447.145833333333400000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Relat'#243'rio de quita'#231#227'o'
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Courier New'
                Font.Style = [fsItalic]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                Degree = 0
                FixBottomPosition = False
                StretchHeightWithBand = False
                FontSize = 10
              end
              object QRSysData1: TQRSysData
                Left = 78
                Top = 52
                Width = 78
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  206.375000000000000000
                  137.583333333333300000
                  206.375000000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                Color = clWhite
                Data = qrsDateTime
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Courier New'
                Font.Style = []
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                FontSize = 8
              end
              object QRLabel1: TQRLabel
                Left = 933
                Top = 52
                Width = 57
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  2468.562500000000000000
                  137.583333333333300000
                  150.812500000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'P'#225'gina :'
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Courier New'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRLabel4: TQRLabel
                Left = 919
                Top = 87
                Width = 120
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  2431.520833333333000000
                  230.187500000000000000
                  317.500000000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Data mov. financ.'
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Courier New'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRSysData2: TQRSysData
                Left = 996
                Top = 52
                Width = 50
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  2635.250000000000000000
                  137.583333333333300000
                  132.291666666666700000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                Color = clWhite
                Data = qrsPageNumber
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Courier New'
                Font.Style = []
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                FontSize = 8
              end
              object QRLabel2: TQRLabel
                Left = 4
                Top = 52
                Width = 71
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  10.583333333333330000
                  137.583333333333300000
                  187.854166666666700000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Data/Hora:'
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Courier New'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRHRule1: TQRHRule
                Left = 0
                Top = 65
                Width = 1045
                Height = 13
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  34.395833333333340000
                  0.000000000000000000
                  171.979166666666700000
                  2764.895833333333000000)
                VertAdjust = 0
                Pen.Width = 2
              end
              object QRHRule2: TQRHRule
                Left = 0
                Top = 98
                Width = 1045
                Height = 18
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  47.625000000000000000
                  0.000000000000000000
                  259.291666666666700000
                  2764.895833333333000000)
                VertAdjust = 0
                Pen.Width = 2
              end
              object lbEmpresa: TQRLabel
                Left = 4
                Top = 1
                Width = 57
                Height = 32
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  84.666666666666680000
                  10.583333333333330000
                  2.645833333333333000
                  150.812500000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Nome'
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -24
                Font.Name = 'Courier New'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 18
              end
              object QRLabel5: TQRLabel
                Left = 3
                Top = 85
                Width = 43
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  7.937500000000000000
                  224.895833333333300000
                  113.770833333333300000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'C'#243'digo'
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Courier New'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRLabel7: TQRLabel
                Left = 231
                Top = 89
                Width = 85
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  611.187500000000000000
                  235.479166666666700000
                  224.895833333333300000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Raz'#227'o social'
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Courier New'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRLabel8: TQRLabel
                Left = 632
                Top = 84
                Width = 78
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1672.166666666667000000
                  222.250000000000000000
                  206.375000000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'NossoNumero'
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Courier New'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRLabel9: TQRLabel
                Left = 1692
                Top = 87
                Width = 107
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  4476.750000000000000000
                  230.187500000000000000
                  283.104166666666700000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Data da remessa'
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
                Left = 746
                Top = 84
                Width = 36
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1973.791666666667000000
                  222.250000000000000000
                  95.250000000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Valor'
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Courier New'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRLabel11: TQRLabel
                Left = 800
                Top = 84
                Width = 99
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  2116.666666666667000000
                  222.250000000000000000
                  261.937500000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Valor c/ Juros'
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Courier New'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRLabel12: TQRLabel
                Left = 487
                Top = 84
                Width = 78
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1288.520833333333000000
                  222.250000000000000000
                  206.375000000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'N'#250'mero doc.'
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Courier New'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRLabel6: TQRLabel
                Left = 209
                Top = 74
                Width = 106
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  552.979166666666700000
                  195.791666666666700000
                  280.458333333333400000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Nome do cliente'
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Courier New'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRLabel13: TQRLabel
                Left = 397
                Top = 84
                Width = 64
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1050.395833333333000000
                  222.250000000000000000
                  169.333333333333300000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Data/Hora'
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Courier New'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRLabel14: TQRLabel
                Left = 919
                Top = 75
                Width = 71
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  2431.520833333333000000
                  198.437500000000000000
                  187.854166666666700000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Data venc.'
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Courier New'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRLabel15: TQRLabel
                Left = 47
                Top = 84
                Width = 8
                Height = 20
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  52.916666666666670000
                  124.354166666666700000
                  222.250000000000000000
                  21.166666666666670000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = '|'
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Courier New'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRLabel17: TQRLabel
                Left = 468
                Top = 84
                Width = 8
                Height = 20
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  52.916666666666670000
                  1238.250000000000000000
                  222.250000000000000000
                  21.166666666666670000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = '|'
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Courier New'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRLabel18: TQRLabel
                Left = 570
                Top = 84
                Width = 8
                Height = 20
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  52.916666666666670000
                  1508.125000000000000000
                  222.250000000000000000
                  21.166666666666670000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = '|'
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Courier New'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRLabel20: TQRLabel
                Left = 719
                Top = 84
                Width = 8
                Height = 20
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  52.916666666666670000
                  1902.354166666667000000
                  222.250000000000000000
                  21.166666666666670000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = '|'
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Courier New'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRLabel21: TQRLabel
                Left = 785
                Top = 84
                Width = 8
                Height = 20
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  52.916666666666670000
                  2076.979166666667000000
                  222.250000000000000000
                  21.166666666666670000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = '|'
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Courier New'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRLabel23: TQRLabel
                Left = 901
                Top = 74
                Width = 17
                Height = 31
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  82.020833333333340000
                  2383.895833333333000000
                  195.791666666666700000
                  44.979166666666670000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = '|'
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -27
                Font.Name = 'Courier New'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 20
              end
              object QRLabel3: TQRLabel
                Left = 314
                Top = 73
                Width = 17
                Height = 31
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  82.020833333333340000
                  830.791666666666800000
                  193.145833333333300000
                  44.979166666666670000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = '|'
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -27
                Font.Name = 'Courier New'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 20
              end
            end
            object PageFooterBand1: TQRBand
              Left = 38
              Top = 185
              Width = 1047
              Height = 40
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              AlignToBottom = False
              BeforePrint = PageFooterBand1BeforePrint
              Color = clWhite
              TransparentBand = False
              ForceNewColumn = False
              ForceNewPage = False
              Size.Values = (
                105.833333333333300000
                2770.187500000000000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              BandType = rbSummary
              object QRLabel31: TQRLabel
                Left = 7
                Top = 10
                Width = 61
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  18.520833333333330000
                  26.458333333333330000
                  161.395833333333300000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'TOTAL....:'
                Color = clWhite
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
              object QRLabel_Valor: TQRLabel
                Left = 671
                Top = 11
                Width = 108
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1775.354166666667000000
                  29.104166666666670000
                  285.750000000000000000)
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Caption = '0'
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
              object QRLabel_ValorJuros: TQRLabel
                Left = 785
                Top = 11
                Width = 113
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  2076.979166666667000000
                  29.104166666666670000
                  298.979166666666700000)
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Caption = '0'
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
              object QRShape6: TQRShape
                Left = 5
                Top = 4
                Width = 1040
                Height = 1
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  2.645833333333333000
                  13.229166666666670000
                  10.583333333333330000
                  2751.666666666667000000)
                Brush.Color = clBlack
                Shape = qrsRectangle
                VertAdjust = 0
              end
            end
          end
        end
      end
      object TabSheet_Relatorio1: TTabSheet
        Caption = 'Relat'#243'rio'
        ImageIndex = 3
        object ScrollBox1: TScrollBox
          Left = 0
          Top = 0
          Width = 832
          Height = 271
          VertScrollBar.Position = 312
          Align = alClient
          TabOrder = 0
          object QuickRep_Retorno1: TQuickRep
            Left = -189
            Top = -167
            Width = 1123
            Height = 794
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            DataSet = dtmImportPDVFinan.cdsRelQuitarCreditos
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
            OnPreview = QuickRep_RelRetornoPreview
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
            SnapToGrid = True
            Units = MM
            Zoom = 100
            PrevFormStyle = fsNormal
            PreviewInitialState = wsMaximized
            PrevInitialZoom = qrZoomToFit
            PreviewDefaultSaveType = stQRP
            object QRBand1: TQRBand
              Left = 38
              Top = 258
              Width = 1047
              Height = 37
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              AlignToBottom = False
              BeforePrint = DetailBand1BeforePrint
              Color = clWhite
              TransparentBand = False
              ForceNewColumn = False
              ForceNewPage = False
              Size.Values = (
                97.895833333333340000
                2770.187500000000000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              BandType = rbDetail
              object QRDBText6: TQRDBText
                Left = -9
                Top = 6
                Width = 57
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  -23.812500000000000000
                  15.875000000000000000
                  150.812500000000000000)
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Color = clWhite
                DataSet = dtmImportPDVFinan.cdsRelQuitarCreditos
                DataField = 'COD_CRED'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Courier New'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRDBText10: TQRDBText
                Left = 1692
                Top = 6
                Width = 100
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  4476.750000000000000000
                  15.875000000000000000
                  264.583333333333400000)
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Color = clWhite
                DataSet = DtmBoletos.cdsBoletos
                DataField = 'NOME_CLIENTE'
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
              object QRDBText13: TQRDBText
                Left = 732
                Top = 6
                Width = 50
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1936.750000000000000000
                  15.875000000000000000
                  132.291666666666700000)
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Color = clWhite
                DataSet = dtmImportPDVFinan.cdsRelQuitarCreditos
                DataField = 'VALOR_C'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Courier New'
                Font.Style = []
                Mask = '0.00'
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptFormula
                FontSize = 8
              end
              object QRDBText14: TQRDBText
                Left = 828
                Top = 6
                Width = 71
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  2190.750000000000000000
                  15.875000000000000000
                  187.854166666666700000)
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Color = clWhite
                DataSet = dtmImportPDVFinan.cdsRelQuitarCreditos
                DataField = 'VALOR_CORR'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Courier New'
                Font.Style = []
                Mask = '0.00'
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptFormula
                FontSize = 8
              end
              object QRDBText15: TQRDBText
                Left = 269
                Top = 3
                Width = 43
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  711.729166666666800000
                  7.937500000000000000
                  113.770833333333300000)
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Color = clWhite
                DataSet = dtmImportPDVFinan.cdsRelQuitarCreditos
                DataField = 'NOME_C'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Courier New'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRDBText16: TQRDBText
                Left = 276
                Top = 18
                Width = 36
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  730.250000000000000000
                  47.625000000000000000
                  95.250000000000000000)
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Color = clWhite
                DataSet = dtmImportPDVFinan.cdsRelQuitarCreditos
                DataField = 'RAZAO'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Courier New'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRDBText17: TQRDBText
                Left = 995
                Top = 21
                Width = 43
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  2632.604166666667000000
                  55.562500000000000000
                  113.770833333333300000)
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Color = clWhite
                DataSet = dtmImportPDVFinan.cdsRelQuitarCreditos
                DataField = 'DATQ_C'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Courier New'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRDBText18: TQRDBText
                Left = 313
                Top = 6
                Width = 148
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  828.145833333333200000
                  15.875000000000000000
                  391.583333333333400000)
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Color = clWhite
                DataSet = dtmImportPDVFinan.cdsRelQuitarCreditos
                DataField = 'DATA_RETORNO_QUITACAO'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Courier New'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRDBText19: TQRDBText
                Left = 961
                Top = 6
                Width = 78
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  2542.645833333333000000
                  15.875000000000000000
                  206.375000000000000000)
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Color = clWhite
                DataSet = dtmImportPDVFinan.cdsRelQuitarCreditos
                DataField = 'DATA_VENC_C'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Courier New'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRDBText20: TQRDBText
                Left = 584
                Top = 6
                Width = 127
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1545.166666666667000000
                  15.875000000000000000
                  336.020833333333400000)
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                BiDiMode = bdLeftToRight
                ParentBiDiMode = False
                Color = clWhite
                DataSet = dtmImportPDVFinan.cdsRelQuitarCreditos
                DataField = 'NOSSO_NUMERO_BANCO'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Courier New'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRLabel_n_doc: TQRLabel
                Left = 487
                Top = 6
                Width = 78
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1288.520833333333000000
                  15.875000000000000000
                  206.375000000000000000)
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Caption = '0'
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
            object QRBand2: TQRBand
              Left = 38
              Top = 38
              Width = 1047
              Height = 134
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
                354.541666666666700000
                2770.187500000000000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              BandType = rbPageHeader
              object QRPLabel2: TQRPLabel
                Left = 5
                Top = 33
                Width = 169
                Height = 18
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  47.625000000000000000
                  13.229166666666670000
                  87.312500000000000000
                  447.145833333333400000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Relat'#243'rio de quita'#231#227'o'
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Courier New'
                Font.Style = [fsItalic]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                Degree = 0
                FixBottomPosition = False
                StretchHeightWithBand = False
                FontSize = 10
              end
              object QRSysData3: TQRSysData
                Left = 78
                Top = 52
                Width = 78
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  206.375000000000000000
                  137.583333333333300000
                  206.375000000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                Color = clWhite
                Data = qrsDateTime
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Courier New'
                Font.Style = []
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                FontSize = 8
              end
              object QRLabel19: TQRLabel
                Left = 933
                Top = 52
                Width = 57
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  2468.562500000000000000
                  137.583333333333300000
                  150.812500000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'P'#225'gina :'
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Courier New'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRSysData4: TQRSysData
                Left = 996
                Top = 52
                Width = 50
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  2635.250000000000000000
                  137.583333333333300000
                  132.291666666666700000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                Color = clWhite
                Data = qrsPageNumber
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Courier New'
                Font.Style = []
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                FontSize = 8
              end
              object QRLabel25: TQRLabel
                Left = 4
                Top = 52
                Width = 71
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  10.583333333333330000
                  137.583333333333300000
                  187.854166666666700000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Data/Hora:'
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Courier New'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object lbEmpresa1: TQRLabel
                Left = 4
                Top = 1
                Width = 57
                Height = 32
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  84.666666666666680000
                  10.583333333333330000
                  2.645833333333333000
                  150.812500000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Nome'
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -24
                Font.Name = 'Courier New'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 18
              end
              object QRLabel30: TQRLabel
                Left = 1692
                Top = 87
                Width = 107
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  4476.750000000000000000
                  230.187500000000000000
                  283.104166666666700000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Data da remessa'
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
              object QRLabel16: TQRLabel
                Left = 2
                Top = 94
                Width = 43
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  5.291666666666667000
                  248.708333333333300000
                  113.770833333333300000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'C'#243'digo'
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Courier New'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRLabel24: TQRLabel
                Left = 46
                Top = 93
                Width = 8
                Height = 20
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  52.916666666666670000
                  121.708333333333300000
                  246.062500000000000000
                  21.166666666666670000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = '|'
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Courier New'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRLabel27: TQRLabel
                Left = 200
                Top = 83
                Width = 106
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  529.166666666666700000
                  219.604166666666700000
                  280.458333333333400000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Nome do cliente'
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Courier New'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRLabel28: TQRLabel
                Left = 222
                Top = 98
                Width = 85
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  587.375000000000000000
                  259.291666666666700000
                  224.895833333333300000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Raz'#227'o social'
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Courier New'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRLabel29: TQRLabel
                Left = 305
                Top = 82
                Width = 17
                Height = 31
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  82.020833333333340000
                  806.979166666666800000
                  216.958333333333400000
                  44.979166666666670000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = '|'
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -27
                Font.Name = 'Courier New'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 20
              end
              object QRLabel32: TQRLabel
                Left = 388
                Top = 93
                Width = 64
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1026.583333333333000000
                  246.062500000000000000
                  169.333333333333300000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Data/Hora'
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Courier New'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRLabel33: TQRLabel
                Left = 478
                Top = 93
                Width = 78
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1264.708333333333000000
                  246.062500000000000000
                  206.375000000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'N'#250'mero doc.'
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Courier New'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRLabel34: TQRLabel
                Left = 459
                Top = 93
                Width = 8
                Height = 20
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  52.916666666666670000
                  1214.437500000000000000
                  246.062500000000000000
                  21.166666666666670000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = '|'
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Courier New'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRLabel35: TQRLabel
                Left = 561
                Top = 93
                Width = 8
                Height = 20
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  52.916666666666670000
                  1484.312500000000000000
                  246.062500000000000000
                  21.166666666666670000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = '|'
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Courier New'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRLabel36: TQRLabel
                Left = 623
                Top = 93
                Width = 78
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1648.354166666667000000
                  246.062500000000000000
                  206.375000000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'NossoNumero'
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Courier New'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRLabel37: TQRLabel
                Left = 710
                Top = 93
                Width = 8
                Height = 20
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  52.916666666666670000
                  1878.541666666667000000
                  246.062500000000000000
                  21.166666666666670000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = '|'
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Courier New'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRHRule3: TQRHRule
                Left = -3
                Top = 74
                Width = 1045
                Height = 13
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  34.395833333333330000
                  -7.937500000000000000
                  195.791666666666700000
                  2764.895833333333000000)
                VertAdjust = 0
                Pen.Width = 2
              end
              object QRHRule4: TQRHRule
                Left = -1
                Top = 111
                Width = 1045
                Height = 18
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  47.625000000000000000
                  -2.645833333333333000
                  293.687500000000000000
                  2764.895833333333000000)
                VertAdjust = 0
                Pen.Width = 2
              end
              object QRLabel38: TQRLabel
                Left = 732
                Top = 93
                Width = 36
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1936.750000000000000000
                  246.062500000000000000
                  95.250000000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Valor'
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Courier New'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRLabel39: TQRLabel
                Left = 777
                Top = 93
                Width = 8
                Height = 20
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  52.916666666666670000
                  2055.812500000000000000
                  246.062500000000000000
                  21.166666666666670000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = '|'
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Courier New'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRLabel40: TQRLabel
                Left = 791
                Top = 93
                Width = 99
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  2092.854166666667000000
                  246.062500000000000000
                  261.937500000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Valor c/ Juros'
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Courier New'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRLabel41: TQRLabel
                Left = 892
                Top = 83
                Width = 17
                Height = 31
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  82.020833333333340000
                  2360.083333333333000000
                  219.604166666666700000
                  44.979166666666670000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = '|'
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -27
                Font.Name = 'Courier New'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 20
              end
              object QRLabel43: TQRLabel
                Left = 910
                Top = 84
                Width = 71
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  2407.708333333333000000
                  222.250000000000000000
                  187.854166666666700000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Data venc.'
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Courier New'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRLabel44: TQRLabel
                Left = 910
                Top = 96
                Width = 120
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  2407.708333333333000000
                  254.000000000000000000
                  317.500000000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Data mov. financ.'
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Courier New'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
            end
            object QRGroup1: TQRGroup
              Left = 38
              Top = 172
              Width = 1047
              Height = 86
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              AlignToBottom = False
              BeforePrint = QRGroup1BeforePrint
              Color = clWhite
              TransparentBand = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ForceNewColumn = False
              ForceNewPage = False
              ParentFont = False
              Size.Values = (
                227.541666666666700000
                2770.187500000000000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              Expression = 'cdsRelQuitarCreditos.COD_COBREBEM'
              FooterBand = QRBand4
              Master = QuickRep_Retorno1
              ReprintOnNewPage = False
              object QRDBText23: TQRDBText
                Left = 226
                Top = 55
                Width = 49
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  597.958333333333200000
                  145.520833333333300000
                  129.645833333333300000)
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Color = clWhite
                DataSet = dtmImportPDVFinan.cdsRelQuitarCreditos
                DataField = 'CODIGOAGENCIA'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Courier New'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
              object QRDBText24: TQRDBText
                Left = 382
                Top = 55
                Width = 155
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1010.708333333333000000
                  145.520833333333300000
                  410.104166666666700000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                BiDiMode = bdLeftToRight
                ParentBiDiMode = False
                Color = clWhite
                DataSet = dtmImportPDVFinan.cdsRelQuitarCreditos
                DataField = 'CODIGOCEDENTE'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Courier New'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
              object QRDBText25: TQRDBText
                Left = 673
                Top = 55
                Width = 153
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1780.645833333333000000
                  145.520833333333300000
                  404.812500000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                BiDiMode = bdLeftToRight
                ParentBiDiMode = False
                Color = clWhite
                DataSet = dtmImportPDVFinan.cdsRelQuitarCreditos
                DataField = 'NUMEROCONTACORRENTE'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Courier New'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
              object QRDBText21: TQRDBText
                Left = 98
                Top = 55
                Width = 41
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  259.291666666666700000
                  145.520833333333300000
                  108.479166666666700000)
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Color = clWhite
                DataSet = dtmImportPDVFinan.cdsRelQuitarCreditos
                DataField = 'BANCO'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Courier New'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
              object QRLabel26: TQRLabel
                Left = 52
                Top = 55
                Width = 43
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  137.583333333333300000
                  145.520833333333300000
                  113.770833333333300000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Banco:'
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Courier New'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRLabel46: TQRLabel
                Left = 163
                Top = 55
                Width = 57
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  431.270833333333400000
                  145.520833333333300000
                  150.812500000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Ag'#234'ncia:'
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Courier New'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRLabel47: TQRLabel
                Left = 145
                Top = 54
                Width = 8
                Height = 20
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  52.916666666666670000
                  383.645833333333400000
                  142.875000000000000000
                  21.166666666666670000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = '|'
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Courier New'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRLabel48: TQRLabel
                Left = 282
                Top = 54
                Width = 8
                Height = 20
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  52.916666666666670000
                  746.125000000000000000
                  142.875000000000000000
                  21.166666666666670000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = '|'
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Courier New'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRLabel49: TQRLabel
                Left = 296
                Top = 55
                Width = 85
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  783.166666666666800000
                  145.520833333333300000
                  224.895833333333300000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Cod Cedente:'
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Courier New'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRLabel50: TQRLabel
                Left = 543
                Top = 54
                Width = 8
                Height = 20
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  52.916666666666670000
                  1436.687500000000000000
                  142.875000000000000000
                  21.166666666666670000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = '|'
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Courier New'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRLabel51: TQRLabel
                Left = 557
                Top = 55
                Width = 106
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1473.729166666667000000
                  145.520833333333300000
                  280.458333333333400000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Conta Corrente:'
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Courier New'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRLabel52: TQRLabel
                Left = 3
                Top = 31
                Width = 92
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  7.937500000000000000
                  82.020833333333340000
                  243.416666666666700000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Cod Cobrebem:'
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Courier New'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRDBText26: TQRDBText
                Left = 101
                Top = 31
                Width = 39
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  267.229166666666700000
                  82.020833333333320000
                  103.187500000000000000)
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Color = clWhite
                DataSet = dtmImportPDVFinan.cdsRelQuitarCreditos
                DataField = 'COD_COBREBEM'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Courier New'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
              object QRLabel53: TQRLabel
                Left = 159
                Top = 32
                Width = 134
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  420.687500000000000000
                  84.666666666666680000
                  354.541666666666700000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Descri'#231#227'o Cobrebem:'
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Courier New'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRDBText27: TQRDBText
                Left = 299
                Top = 31
                Width = 372
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  791.104166666666800000
                  82.020833333333320000
                  984.250000000000000000)
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                BiDiMode = bdRightToLeft
                ParentBiDiMode = False
                Color = clWhite
                DataSet = dtmImportPDVFinan.cdsRelQuitarCreditos
                DataField = 'DESCRICAO'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Courier New'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
              object QRLabel54: TQRLabel
                Left = 145
                Top = 30
                Width = 8
                Height = 20
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  52.916666666666670000
                  383.645833333333400000
                  79.375000000000000000
                  21.166666666666670000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = '|'
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Courier New'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRLabel42: TQRLabel
                Left = 677
                Top = 31
                Width = 71
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1791.229166666667000000
                  82.020833333333340000
                  187.854166666666700000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Unificada:'
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Courier New'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRDBText22: TQRDBText
                Left = 754
                Top = 32
                Width = 65
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1994.958333333333000000
                  84.666666666666680000
                  171.979166666666700000)
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Color = clWhite
                DataSet = dtmImportPDVFinan.cdsRelQuitarCreditos
                DataField = 'COD_EMP_MULT'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Courier New'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
            end
            object QRBand3: TQRBand
              Left = 38
              Top = 326
              Width = 1047
              Height = 57
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              AlignToBottom = False
              BeforePrint = PageFooterBand1BeforePrint
              Color = clWhite
              TransparentBand = False
              ForceNewColumn = False
              ForceNewPage = False
              Size.Values = (
                150.812500000000000000
                2770.187500000000000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              BandType = rbSummary
              object QRLabel45: TQRLabel
                Left = 5
                Top = 30
                Width = 61
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  13.229166666666670000
                  79.375000000000000000
                  161.395833333333300000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'TOTAL....:'
                Color = clWhite
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
              object QRLabel_vl: TQRLabel
                Left = 671
                Top = 30
                Width = 108
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1775.354166666667000000
                  79.375000000000000000
                  285.750000000000000000)
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Caption = '0'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptFormula
                FontSize = 10
              end
              object QRLabel_vlcorr: TQRLabel
                Left = 785
                Top = 30
                Width = 113
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  2076.979166666667000000
                  79.375000000000000000
                  298.979166666666700000)
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Caption = '0'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptFormula
                FontSize = 10
              end
              object QRShape1: TQRShape
                Left = 4
                Top = 23
                Width = 1040
                Height = 1
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  2.645833333333333000
                  10.583333333333330000
                  60.854166666666680000
                  2751.666666666667000000)
                Brush.Color = clBlack
                Shape = qrsRectangle
                VertAdjust = 0
              end
            end
            object QRBand4: TQRBand
              Left = 38
              Top = 295
              Width = 1047
              Height = 31
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
              LinkBand = QRGroup1
              Size.Values = (
                82.020833333333340000
                2770.187500000000000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              BandType = rbGroupFooter
              object QRExpr1: TQRExpr
                Left = 700
                Top = 12
                Width = 85
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1852.083333333333000000
                  31.750000000000000000
                  224.895833333333300000)
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                Color = clWhite
                ParentFont = False
                ResetAfterPrint = True
                Transparent = False
                WordWrap = True
                Expression = 'SUM(VALOR_C)'
                Mask = '0.00'
                ExportAs = exptFormula
                FontSize = 8
              end
              object QRExpr2: TQRExpr
                Left = 792
                Top = 12
                Width = 107
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  2095.500000000000000000
                  31.750000000000000000
                  283.104166666666700000)
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                Color = clWhite
                ParentFont = False
                ResetAfterPrint = True
                Transparent = False
                WordWrap = True
                Expression = 'SUM(VALOR_CORR)'
                Mask = '0.00'
                ExportAs = exptFormula
                FontSize = 8
              end
              object QRLabel55: TQRLabel
                Left = 5
                Top = 13
                Width = 88
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  13.229166666666670000
                  34.395833333333340000
                  232.833333333333400000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Total Agrupado:'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
            end
          end
        end
      end
      object TabSheet_CreditosVinc: TTabSheet
        Caption = 'Cr'#233'ditos Vincular'
        ImageIndex = 5
        object pnCreditosVinc: TPanel
          Left = 0
          Top = 0
          Width = 832
          Height = 271
          Align = alClient
          TabOrder = 0
          object DBGridCreditosVinc: TDBGrid
            Left = 1
            Top = 1
            Width = 830
            Height = 234
            Align = alClient
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnDrawColumnCell = DBGridCreditosVincDrawColumnCell
          end
          object Panel12: TPanel
            Left = 1
            Top = 235
            Width = 830
            Height = 35
            Align = alBottom
            BevelKind = bkTile
            BevelOuter = bvNone
            TabOrder = 1
            object btCreditosVincOK: TBitBtn
              Left = 312
              Top = 3
              Width = 75
              Height = 25
              Hint = 'Vincular Registro - [BOL040]'
              Caption = '&OK'
              TabOrder = 0
              OnClick = btCreditosVincOKClick
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
            object btCreditosVincCanc: TBitBtn
              Left = 393
              Top = 3
              Width = 75
              Height = 25
              Hint = 'Cancelar'
              Caption = '&Cancela'
              TabOrder = 1
              OnClick = btCreditosVincCancClick
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
            object pnQuitado: TPanel
              Left = 656
              Top = 10
              Width = 99
              Height = 13
              BevelOuter = bvNone
              Caption = 'Quitado'
              Color = 16769217
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentBackground = False
              ParentFont = False
              TabOrder = 2
            end
          end
        end
      end
    end
  end
  object OpenDialog_Retorno: TOpenDialog
    Left = 688
    Top = 8
  end
  object PopupMenu_Retorno: TPopupMenu
    Left = 576
    Top = 24
    object Copiarparareadetransferncia1: TMenuItem
      Caption = 'Copiar para '#225'rea de transfer'#234'ncia'
      OnClick = Copiarparareadetransferncia1Click
    end
  end
  object PopupMenu_TitulosNaoConciliados: TPopupMenu
    Left = 608
    Top = 24
    object Copiarparareadetransferncia2: TMenuItem
      Caption = 'Copiar para '#225'rea de transfer'#234'ncia'
      OnClick = Copiarparareadetransferncia2Click
    end
  end
end
