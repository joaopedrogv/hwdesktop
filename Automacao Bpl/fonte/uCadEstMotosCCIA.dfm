inherited frmEstMotosCCIA: TfrmEstMotosCCIA
  Caption = 'Estoque e Movimento Ve'#237'culos'
  ClientHeight = 590
  ClientWidth = 803
  ExplicitWidth = 811
  ExplicitHeight = 624
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelFundo: TPanel
    Width = 803
    Height = 571
    ExplicitWidth = 803
    ExplicitHeight = 571
    inherited Splitter2: TSplitter
      Height = 569
      ExplicitHeight = 569
    end
    inherited PanelLeft: TPanel
      Width = 798
      Height = 569
      ExplicitWidth = 798
      ExplicitHeight = 569
      inherited PageControl1: TPageControl
        Width = 796
        Height = 567
        ExplicitWidth = 796
        ExplicitHeight = 567
        inherited TabSheet1: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 788
          ExplicitHeight = 536
          inherited ScrollBox1: TScrollBox
            Width = 788
            Height = 536
            ExplicitWidth = 788
            ExplicitHeight = 536
            inherited PageControl3: TPageControl
              Width = 788
              Height = 488
              ActivePage = TabSheet_Dados
              OnChange = PageControl3Change
              ExplicitWidth = 788
              ExplicitHeight = 488
              inherited TabSheet3: TTabSheet
                ExplicitLeft = 4
                ExplicitTop = 27
                ExplicitWidth = 780
                ExplicitHeight = 457
                inherited ScrollBox3: TScrollBox
                  Width = 780
                  Height = 457
                  ExplicitWidth = 780
                  ExplicitHeight = 457
                  inherited GroupBox1: TGroupBox
                    Width = 776
                    ExplicitWidth = 776
                  end
                end
              end
              object TabSheet_Dados: TTabSheet
                Caption = 'Dados do Ve'#237'culo'
                ImageIndex = 1
                object ScrollBox4: TScrollBox
                  Left = 0
                  Top = 0
                  Width = 780
                  Height = 457
                  Align = alClient
                  BevelInner = bvNone
                  BevelOuter = bvNone
                  TabOrder = 0
                  object GroupBox4: TGroupBox
                    Left = 0
                    Top = 394
                    Width = 776
                    Height = 0
                    Align = alTop
                    Caption = 'GroupBox1'
                    TabOrder = 0
                    Visible = False
                  end
                  object PageControl2: TPageControl
                    Left = 0
                    Top = 394
                    Width = 776
                    Height = 59
                    ActivePage = TabSheet6
                    Align = alBottom
                    Style = tsFlatButtons
                    TabOrder = 1
                    Visible = False
                    object TabSheet6: TTabSheet
                      Caption = 'Kits'
                      object GroupBox23: TGroupBox
                        Left = 0
                        Top = 0
                        Width = 768
                        Height = 28
                        Align = alClient
                        TabOrder = 0
                        object Label11: TLabel
                          Left = 610
                          Top = 13
                          Width = 84
                          Height = 13
                          Alignment = taRightJustify
                          Caption = 'Data Cadastro:'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = [fsBold]
                          ParentFont = False
                        end
                        object DBText1: TDBText
                          Left = 700
                          Top = 13
                          Width = 65
                          Height = 17
                          DataField = 'DAT_CAD_PROD'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = [fsBold]
                          ParentFont = False
                        end
                        object BitBtn7: TBitBtn
                          Left = 4
                          Top = 9
                          Width = 75
                          Height = 22
                          Hint = 'Incluir Registro - [PRO012]'
                          Caption = '&Incluir'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = [fsBold]
                          ParentFont = False
                          TabOrder = 0
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
                        object BitBtn8: TBitBtn
                          Left = 84
                          Top = 9
                          Width = 75
                          Height = 22
                          Hint = 'Alterar Registro - [PRO014]'
                          Caption = '&Alterar'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = [fsBold]
                          ParentFont = False
                          TabOrder = 1
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
                        object BitBtn12: TBitBtn
                          Left = 164
                          Top = 9
                          Width = 75
                          Height = 22
                          Hint = 'Excluir Registro - [PRO016]'
                          Caption = '&Deletar'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = [fsBold]
                          ParentFont = False
                          TabOrder = 2
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
                      object Panel13: TPanel
                        Left = 0
                        Top = 0
                        Width = 768
                        Height = 28
                        Align = alClient
                        Caption = 'Panel12'
                        TabOrder = 1
                        object DBGrid9: TDBGrid
                          Left = 1
                          Top = 1
                          Width = 766
                          Height = 26
                          Hint = 
                            'Quaisquer altera'#231#245'es em algum c'#243'digo de barras somente ser'#225' efet' +
                            'ivamente confirmada ap'#243's confirma'#231#227'o nas modifica'#231'oes do produto' +
                            '.'
                          Align = alClient
                          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                          ReadOnly = True
                          TabOrder = 0
                          TitleFont.Charset = DEFAULT_CHARSET
                          TitleFont.Color = clWindowText
                          TitleFont.Height = -11
                          TitleFont.Name = 'Tahoma'
                          TitleFont.Style = []
                        end
                      end
                    end
                    object TabSheet7: TTabSheet
                      Caption = 'Opcionais'
                      ImageIndex = 1
                      object GroupBox24: TGroupBox
                        Left = 0
                        Top = 0
                        Width = 768
                        Height = 36
                        Align = alTop
                        TabOrder = 0
                        object Label71: TLabel
                          Left = 610
                          Top = 13
                          Width = 84
                          Height = 13
                          Alignment = taRightJustify
                          Caption = 'Data Cadastro:'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = [fsBold]
                          ParentFont = False
                        end
                        object DBText2: TDBText
                          Left = 700
                          Top = 13
                          Width = 65
                          Height = 17
                          DataField = 'DAT_CAD_PROD'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = [fsBold]
                          ParentFont = False
                        end
                        object BitBtn11: TBitBtn
                          Left = 4
                          Top = 9
                          Width = 75
                          Height = 22
                          Hint = 'Incluir Registro - [PRO012]'
                          Caption = '&Incluir'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = [fsBold]
                          ParentFont = False
                          TabOrder = 0
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
                        object BitBtn14: TBitBtn
                          Left = 84
                          Top = 9
                          Width = 75
                          Height = 22
                          Hint = 'Alterar Registro - [PRO014]'
                          Caption = '&Alterar'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = [fsBold]
                          ParentFont = False
                          TabOrder = 1
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
                        object BitBtn15: TBitBtn
                          Left = 164
                          Top = 9
                          Width = 75
                          Height = 22
                          Hint = 'Excluir Registro - [PRO016]'
                          Caption = '&Deletar'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = [fsBold]
                          ParentFont = False
                          TabOrder = 2
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
                      object Panel12: TPanel
                        Left = 0
                        Top = 36
                        Width = 768
                        Height = 0
                        Align = alClient
                        Caption = 'Panel12'
                        TabOrder = 1
                        object DBGrid7: TDBGrid
                          Left = 1
                          Top = 1
                          Width = 766
                          Height = 6
                          Hint = 
                            'Quaisquer altera'#231#245'es em algum c'#243'digo de barras somente ser'#225' efet' +
                            'ivamente confirmada ap'#243's confirma'#231#227'o nas modifica'#231'oes do produto' +
                            '.'
                          Align = alClient
                          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                          ReadOnly = True
                          TabOrder = 0
                          TitleFont.Charset = DEFAULT_CHARSET
                          TitleFont.Color = clWindowText
                          TitleFont.Height = -11
                          TitleFont.Name = 'Tahoma'
                          TitleFont.Style = []
                        end
                      end
                    end
                  end
                  object GroupBox16: TGroupBox
                    Left = 0
                    Top = 0
                    Width = 776
                    Height = 394
                    Align = alTop
                    Caption = 'Ve'#237'culos com Movimenta'#231#227'o'
                    TabOrder = 2
                    object Label33: TLabel
                      Left = 62
                      Top = 30
                      Width = 44
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Codigo:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label37: TLabel
                      Left = 60
                      Top = 75
                      Width = 46
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Modelo:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label66: TLabel
                      Left = 578
                      Top = 213
                      Width = 37
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Motor:'
                      FocusControl = DBEdit5
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label68: TLabel
                      Left = 538
                      Top = 167
                      Width = 77
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Tp Fins Seg.:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label79: TLabel
                      Left = 66
                      Top = 99
                      Width = 40
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Marca:'
                      FocusControl = DBEdit14
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label80: TLabel
                      Left = 64
                      Top = 53
                      Width = 42
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Chassi:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label81: TLabel
                      Left = 330
                      Top = 53
                      Width = 37
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Placa:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label82: TLabel
                      Left = 82
                      Top = 144
                      Width = 24
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Cor:'
                      FocusControl = DBEdit27
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label83: TLabel
                      Left = 33
                      Top = 122
                      Width = 73
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Combustivel:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label34: TLabel
                      Left = 54
                      Top = 190
                      Width = 52
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Ano.Fab:'
                      FocusControl = DBEdit11
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label75: TLabel
                      Left = 45
                      Top = 213
                      Width = 61
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Cilindrada:'
                      FocusControl = DBEdit28
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label87: TLabel
                      Left = 211
                      Top = 190
                      Width = 55
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Ano Mod:'
                      FocusControl = DBEdit33
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label88: TLabel
                      Left = 244
                      Top = 213
                      Width = 22
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'HP:'
                      FocusControl = DBEdit32
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label89: TLabel
                      Left = 359
                      Top = 190
                      Width = 53
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Cilindros:'
                      FocusControl = DBEdit35
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label92: TLabel
                      Left = 557
                      Top = 190
                      Width = 58
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Renavam:'
                      FocusControl = DBEdit43
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label64: TLabel
                      Left = 521
                      Top = 99
                      Width = 94
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Lota'#231#227'o: (Pass.)'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label65: TLabel
                      Left = 525
                      Top = 144
                      Width = 90
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Mod. Renavam:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label70: TLabel
                      Left = 528
                      Top = 122
                      Width = 87
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Esp. Renavam:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label6: TLabel
                      Left = 560
                      Top = 29
                      Width = 55
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Situa'#231#227'o:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label63: TLabel
                      Left = 62
                      Top = 260
                      Width = 44
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Cliente:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label9: TLabel
                      Left = 35
                      Top = 167
                      Width = 69
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Fornecedor:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label12: TLabel
                      Left = 564
                      Top = 260
                      Width = 51
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Tipo OP:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label25: TLabel
                      Left = 292
                      Top = 310
                      Width = 70
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Vl  Doc Ent:'
                      FocusControl = DBEdit10
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label28: TLabel
                      Left = 49
                      Top = 358
                      Width = 51
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'N'#186' Com.:'
                      FocusControl = DBEdit10
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                      Visible = False
                    end
                    object Label29: TLabel
                      Left = 38
                      Top = 283
                      Width = 66
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Perc. Red.:'
                      FocusControl = DBEdit10
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label30: TLabel
                      Left = 307
                      Top = 283
                      Width = 105
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Red. Sobre Lucro:'
                      FocusControl = DBEdit10
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label8: TLabel
                      Left = 503
                      Top = 75
                      Width = 112
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Origem do Estoque:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label27: TLabel
                      Left = 268
                      Top = 30
                      Width = 50
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Posi'#231#227'o:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label54: TLabel
                      Left = 534
                      Top = 284
                      Width = 81
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Pre'#231'o Tabela:'
                      FocusControl = DBEdit12
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label58: TLabel
                      Left = 34
                      Top = 237
                      Width = 70
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Pre'#231'o Custo'
                      FocusControl = DBEdit17
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label60: TLabel
                      Left = 260
                      Top = 237
                      Width = 102
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Pre'#231'o Reposi'#231#227'o:'
                      FocusControl = DBEdit19
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label67: TLabel
                      Left = 511
                      Top = 237
                      Width = 104
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Pre'#231'o Cust. Desp:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label69: TLabel
                      Left = 531
                      Top = 308
                      Width = 81
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Vl Doc Sa'#237'da:'
                      FocusControl = DBEdit21
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label97: TLabel
                      Left = 22
                      Top = 309
                      Width = 82
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Vl Sug Venda:'
                      FocusControl = DBEdit9
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label98: TLabel
                      Left = 20
                      Top = 333
                      Width = 80
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Num Doc Ent:'
                      FocusControl = DBEdit16
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label99: TLabel
                      Left = 267
                      Top = 333
                      Width = 95
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Num Doc Sa'#237'da:'
                      FocusControl = DBEdit25
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label100: TLabel
                      Left = 532
                      Top = 333
                      Width = 80
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Num Doc Trc:'
                      FocusControl = DBEdit29
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object SpeedButton9: TSpeedButton
                      Left = 482
                      Top = 280
                      Width = 23
                      Height = 22
                      Hint = 'Alterar Percentual de Redu'#231#227'o - [VEI125]'
                      Glyph.Data = {
                        6E030000424D6E030000000000006E0200002800000010000000100000000100
                        08000000000000010000120B0000120B00008E0000008E00000000000000FFFF
                        FF00FF00FF007C7078008D787F0085787C00A3878C00B7818300B47F8100A877
                        79008F676900956D6F007D555600996E6F009D6C6C00A47272009D6D6D009E6E
                        6E00C68E8E00C8929200C48F8F00C38E8E00C18D8D00A1767600AC808000D6A2
                        A200DAA6A600D9A5A500D8A4A400E9B5B500E8B5B500ECB9B900965F5D009E74
                        7300A3797800EEB7B500F3BCBB00E5A6A300B2787300E1D0CE00E4D4D200B481
                        7600B8857A00AA7A71007959530076575100BA8E850073564F0077595200E3CF
                        C90049464500CF9B8600FAF5F300DAC5BC00CB9A8200F9F5F300DCA88700E0CF
                        C500FCF7F400FBF6F300E3B18E00E8D9CE00FEF9F500FDF8F400FCF7F300EDBD
                        9200F0E4D900FBF3EC00FAEFE400FBF3EB00FEF9F400FDF8F300FFFEFD00FAEF
                        E300DCA76A00F8E7D300B0A59800F9EBDA00F2E5D600FBF4EC00BFA889009D8B
                        7300D1BCA000E4CFB400F4E1C900F4EBDF00FDF9F400E4C39300E4C59900D0B4
                        8D00AF997800DAC09A00A794790093836B00CDB79800AE9C8200FEF3E300FFF7
                        EB00FDF6EC00F3D19900EECC9700EDCB9600E9C89600DCBD8D00D9BC8C00C5AC
                        8600BAA3800095856C00FDEFD900EECD950066625B00FFFEFC00FFFCF400FFFE
                        F900FFFFFD00A5B3B1005160610019ADCC000FCAF40010A5CF003392B300469C
                        BA003872860000A4E60004A8E600097CA8001B617D0029799A00373C3E001855
                        6F00077DCD00585C60000936C900204ADD00092CC300021EAA004860F1000318
                        AE000416AA00192DC4003E4BDB00000099000202020202020202020202020202
                        020207070707070707070707070707020202076C5453525E5B58666564630702
                        020229604B3280745F50595765630702020229614D4C7E7D816E5C69676D0702
                        02022E70444E7A7F040B2C516A68080202022E724F49730325130F2D6B5A0902
                        020236013E435505231A15112F5D0D0202023601483F4342221D1B1410300A02
                        02023801014846453D211E1C160E0C0202023801010148564539171F19122083
                        02023C0101010148476235182406787575023C01010101016F71312B2679767B
                        878D4101010101010101282A4A777C848689413A403B3B343737272A33028288
                        858A4138383838383838382A0202028C8B02}
                      OnClick = SpeedButton9Click
                    end
                    object btAlterarChassiPlaca: TSpeedButton
                      Left = 483
                      Top = 48
                      Width = 23
                      Height = 22
                      Hint = 'Alterar chassi / placa '
                      Glyph.Data = {
                        6E030000424D6E030000000000006E0200002800000010000000100000000100
                        08000000000000010000120B0000120B00008E0000008E00000000000000FFFF
                        FF00FF00FF007C7078008D787F0085787C00A3878C00B7818300B47F8100A877
                        79008F676900956D6F007D555600996E6F009D6C6C00A47272009D6D6D009E6E
                        6E00C68E8E00C8929200C48F8F00C38E8E00C18D8D00A1767600AC808000D6A2
                        A200DAA6A600D9A5A500D8A4A400E9B5B500E8B5B500ECB9B900965F5D009E74
                        7300A3797800EEB7B500F3BCBB00E5A6A300B2787300E1D0CE00E4D4D200B481
                        7600B8857A00AA7A71007959530076575100BA8E850073564F0077595200E3CF
                        C90049464500CF9B8600FAF5F300DAC5BC00CB9A8200F9F5F300DCA88700E0CF
                        C500FCF7F400FBF6F300E3B18E00E8D9CE00FEF9F500FDF8F400FCF7F300EDBD
                        9200F0E4D900FBF3EC00FAEFE400FBF3EB00FEF9F400FDF8F300FFFEFD00FAEF
                        E300DCA76A00F8E7D300B0A59800F9EBDA00F2E5D600FBF4EC00BFA889009D8B
                        7300D1BCA000E4CFB400F4E1C900F4EBDF00FDF9F400E4C39300E4C59900D0B4
                        8D00AF997800DAC09A00A794790093836B00CDB79800AE9C8200FEF3E300FFF7
                        EB00FDF6EC00F3D19900EECC9700EDCB9600E9C89600DCBD8D00D9BC8C00C5AC
                        8600BAA3800095856C00FDEFD900EECD950066625B00FFFEFC00FFFCF400FFFE
                        F900FFFFFD00A5B3B1005160610019ADCC000FCAF40010A5CF003392B300469C
                        BA003872860000A4E60004A8E600097CA8001B617D0029799A00373C3E001855
                        6F00077DCD00585C60000936C900204ADD00092CC300021EAA004860F1000318
                        AE000416AA00192DC4003E4BDB00000099000202020202020202020202020202
                        020207070707070707070707070707020202076C5453525E5B58666564630702
                        020229604B3280745F50595765630702020229614D4C7E7D816E5C69676D0702
                        02022E70444E7A7F040B2C516A68080202022E724F49730325130F2D6B5A0902
                        020236013E435505231A15112F5D0D0202023601483F4342221D1B1410300A02
                        02023801014846453D211E1C160E0C0202023801010148564539171F19122083
                        02023C0101010148476235182406787575023C01010101016F71312B2679767B
                        878D4101010101010101282A4A777C848689413A403B3B343737272A33028288
                        858A4138383838383838382A0202028C8B02}
                      OnClick = btAlterarChassiPlacaClick
                    end
                    object DBEdit1: TDBEdit
                      Left = 108
                      Top = 26
                      Width = 65
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'CODIGO'
                      DataSource = DtmVeiculosCCIA.dsEstMotos
                      Enabled = False
                      TabOrder = 0
                    end
                    object DBEdit4: TDBEdit
                      Left = 108
                      Top = 257
                      Width = 39
                      Height = 21
                      Hint = 'Cliente do Ve'#237'culo.'
                      CharCase = ecUpperCase
                      DataField = 'COD_CLIENTE'
                      DataSource = DtmVeiculosCCIA.dsEstMotos
                      Enabled = False
                      TabOrder = 30
                      OnExit = DBEdit4Exit
                      OnKeyDown = DBEdit4KeyDown
                    end
                    object DBLookupComboBox2: TDBLookupComboBox
                      Left = 149
                      Top = 257
                      Width = 330
                      Height = 21
                      Hint = 'Cliente do Ve'#237'culo.'
                      DataField = 'COD_CLIENTE'
                      DataSource = DtmVeiculosCCIA.dsEstMotos
                      Enabled = False
                      KeyField = 'COD_CLIENTE'
                      ListField = 'NOME_CLIENTE'
                      ListSource = DtmVeiculosCCIA.dsClientesEstMotos
                      TabOrder = 31
                    end
                    object DBEdit5: TDBEdit
                      Left = 618
                      Top = 210
                      Width = 110
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'MOTOREST'
                      DataSource = DtmVeiculosCCIA.dsEstMotos
                      TabOrder = 26
                    end
                    object DBEdit14: TDBEdit
                      Left = 108
                      Top = 95
                      Width = 39
                      Height = 21
                      Hint = 'Marca do Ve'#237'culo.'
                      CharCase = ecUpperCase
                      DataField = 'COD_MARCA'
                      DataSource = DtmVeiculosCCIA.dsEstMotos
                      Enabled = False
                      TabOrder = 8
                      OnKeyDown = DBEdit14KeyDown
                    end
                    object DBEdit18: TDBEdit
                      Left = 108
                      Top = 49
                      Width = 161
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'CHASSI_C'
                      DataSource = DtmVeiculosCCIA.dsEstMotos
                      TabOrder = 3
                      OnExit = DBEdit18Exit
                    end
                    object DBEdit26: TDBEdit
                      Left = 369
                      Top = 49
                      Width = 110
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'PLACAEST'
                      DataSource = DtmVeiculosCCIA.dsEstMotos
                      TabOrder = 4
                    end
                    object DBEdit27: TDBEdit
                      Left = 108
                      Top = 141
                      Width = 39
                      Height = 21
                      Hint = 'Cor do Ve'#237'culo.'
                      CharCase = ecUpperCase
                      DataField = 'COD_COR'
                      DataSource = DtmVeiculosCCIA.dsEstMotos
                      TabOrder = 14
                      OnKeyDown = DBEdit27KeyDown
                    end
                    object DBEdit31: TDBEdit
                      Left = 108
                      Top = 72
                      Width = 39
                      Height = 21
                      Hint = 'Modelo.'
                      CharCase = ecUpperCase
                      DataField = 'VERSAOEST'
                      DataSource = DtmVeiculosCCIA.dsEstMotos
                      TabOrder = 5
                      OnExit = DBEdit31Exit
                      OnKeyDown = DBEdit31KeyDown
                    end
                    object DBLookupComboBox3: TDBLookupComboBox
                      Left = 149
                      Top = 72
                      Width = 330
                      Height = 21
                      Hint = 'Marca do Modelo.'
                      DataField = 'VERSAOEST'
                      DataSource = DtmVeiculosCCIA.dsEstMotos
                      KeyField = 'CODIGO'
                      ListField = 'DESCRICAO'
                      ListSource = DtmVeiculosCCIA.dsModVeiculosEstMotos
                      TabOrder = 6
                      OnExit = DBEdit31Exit
                    end
                    object DBLookupComboBox7: TDBLookupComboBox
                      Left = 149
                      Top = 141
                      Width = 330
                      Height = 21
                      Hint = 'Cor do Ve'#237'culo.'
                      DataField = 'COD_COR'
                      DataSource = DtmVeiculosCCIA.dsEstMotos
                      KeyField = 'COD_COR'
                      ListField = 'DESCRICAO_COR'
                      ListSource = DtmVeiculosCCIA.dsCorEstMotos
                      TabOrder = 15
                    end
                    object DBLookupComboBox8: TDBLookupComboBox
                      Left = 149
                      Top = 95
                      Width = 330
                      Height = 21
                      Hint = 'Marca do Ve'#237'culo.'
                      DataField = 'COD_MARCA'
                      DataSource = DtmVeiculosCCIA.dsEstMotos
                      Enabled = False
                      KeyField = 'COD_MARCA'
                      ListField = 'DESCRICAO_MARCA'
                      ListSource = DtmVeiculosCCIA.dsMarcaEstMotos
                      TabOrder = 9
                    end
                    object DBLookupComboBox9: TDBLookupComboBox
                      Left = 149
                      Top = 118
                      Width = 330
                      Height = 21
                      Hint = 'Combust'#237'vel do Modelo.'
                      DataField = 'COD_COMBUSTIVEL'
                      DataSource = DtmVeiculosCCIA.dsEstMotos
                      Enabled = False
                      KeyField = 'CODIGO_TPCOMB'
                      ListField = 'DESCR_COMB'
                      ListSource = DtmVeiculosCCIA.dsCombustivelEstMotos
                      TabOrder = 12
                    end
                    object DBEdit8: TDBEdit
                      Left = 108
                      Top = 118
                      Width = 39
                      Height = 21
                      Hint = 'Combust'#237'vel do Modelo.'
                      CharCase = ecUpperCase
                      DataField = 'COD_COMBUSTIVEL'
                      DataSource = DtmVeiculosCCIA.dsEstMotos
                      Enabled = False
                      TabOrder = 11
                      OnKeyDown = DBEdit8KeyDown
                    end
                    object DBEdit11: TDBEdit
                      Left = 108
                      Top = 187
                      Width = 65
                      Height = 21
                      Hint = 'Ano de Fabrica'#231#227'o.'
                      CharCase = ecUpperCase
                      DataField = 'ANO_FABEST'
                      DataSource = DtmVeiculosCCIA.dsEstMotos
                      TabOrder = 20
                    end
                    object DBEdit28: TDBEdit
                      Left = 108
                      Top = 210
                      Width = 65
                      Height = 21
                      Hint = 'Cilindradas.'
                      CharCase = ecUpperCase
                      DataField = 'CILINDRADAEST'
                      DataSource = DtmVeiculosCCIA.dsEstMotos
                      TabOrder = 24
                    end
                    object DBEdit32: TDBEdit
                      Left = 268
                      Top = 210
                      Width = 65
                      Height = 21
                      Hint = 'HP.'
                      CharCase = ecUpperCase
                      DataField = 'HPEST'
                      DataSource = DtmVeiculosCCIA.dsEstMotos
                      TabOrder = 25
                    end
                    object DBEdit33: TDBEdit
                      Left = 268
                      Top = 187
                      Width = 65
                      Height = 21
                      Hint = 'Ano Modelo.'
                      CharCase = ecUpperCase
                      DataField = 'ANO_MODEST'
                      DataSource = DtmVeiculosCCIA.dsEstMotos
                      TabOrder = 21
                    end
                    object DBEdit35: TDBEdit
                      Left = 414
                      Top = 187
                      Width = 65
                      Height = 21
                      Hint = 'Cilindros.'
                      CharCase = ecUpperCase
                      DataField = 'CILINDROSEST'
                      DataSource = DtmVeiculosCCIA.dsEstMotos
                      TabOrder = 22
                    end
                    object DBEdit43: TDBEdit
                      Left = 618
                      Top = 187
                      Width = 110
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'RENAVAMEST'
                      DataSource = DtmVeiculosCCIA.dsEstMotos
                      TabOrder = 23
                    end
                    object DBComboBox2: TDBComboBox
                      Left = 618
                      Top = 95
                      Width = 110
                      Height = 21
                      Hint = 'Quantidade de pessoas que o ve'#237'culo pode transportar'
                      Style = csDropDownList
                      CharCase = ecUpperCase
                      DataField = 'LOTACAOEST'
                      DataSource = DtmVeiculosCCIA.dsEstMotos
                      ItemHeight = 13
                      Items.Strings = (
                        '01'
                        '02'
                        '03'
                        '04'
                        '05')
                      TabOrder = 10
                    end
                    object DBLookupComboBox5: TDBLookupComboBox
                      Left = 618
                      Top = 164
                      Width = 110
                      Height = 21
                      Hint = 'Esp'#233'cie Ve'#237'culo.'
                      DataField = 'COD_ESPE_SEG'
                      DataSource = DtmVeiculosCCIA.dsEstMotos
                      KeyField = 'CODIGO_ESP'
                      ListField = 'DESCRICAO_ESP'
                      ListSource = DtmVeiculosCCIA.dsEspecieEstMotos
                      TabOrder = 19
                    end
                    object ComboBox4: TComboBox
                      Left = 618
                      Top = 118
                      Width = 110
                      Height = 21
                      CharCase = ecUpperCase
                      Enabled = False
                      ItemHeight = 13
                      TabOrder = 13
                      Items.Strings = (
                        '01 - PASSAGEIRO'
                        '02 - CARGA'
                        '03 - MISTO'
                        '04 - CORRIDA'
                        '05 - TRA'#199#195'O'
                        '06 - ESPECIAL')
                    end
                    object ComboBox5: TComboBox
                      Left = 618
                      Top = 141
                      Width = 110
                      Height = 21
                      CharCase = ecUpperCase
                      Enabled = False
                      ItemHeight = 13
                      TabOrder = 16
                      Items.Strings = (
                        '02 - CICLOMOTO'
                        '03 - MOTONETA'
                        '04 - MOTOCICLO'
                        '05 - TRICICLO'
                        '06 - AUTOM'#211'VEL'
                        '07 - MICRO'#212'NIBUS'
                        '08 - '#212'NIBUS'
                        '10 - REBOQUE'
                        '11 - SEMIRREBOQUE'
                        '13 - CAMINHONETA'
                        '14 - CAMINH'#195'O'
                        '17 - CAMINH'#195'O TRATOR'
                        '18 - TR RODAS'
                        '19 - TR ESTEIRAS'
                        '20 - TR MISTO'
                        '21 - QUADRICICLO'
                        '22 - ESPECIAL / '#212'NIBUS'
                        '23 - MISTO / CAMINHONETE'
                        '25 - UTILIT'#193'RIO'
                        '26 - MOTOR CASA ')
                    end
                    object DBComboBox3: TDBComboBox
                      Left = 618
                      Top = 26
                      Width = 110
                      Height = 21
                      Hint = 'Status Uso'
                      Style = csDropDownList
                      CharCase = ecUpperCase
                      DataField = 'STATUS_USO'
                      DataSource = DtmVeiculosCCIA.dsEstMotos
                      Enabled = False
                      ItemHeight = 13
                      Items.Strings = (
                        'N - NOVO'
                        'U - USADO')
                      TabOrder = 2
                      OnExit = DBComboBox3Exit
                    end
                    object DBLookupComboBox1: TDBLookupComboBox
                      Left = 149
                      Top = 164
                      Width = 330
                      Height = 21
                      Hint = 'Cliente do Ve'#237'culo.'
                      DataField = 'COD_FORNECEDOR'
                      DataSource = DtmVeiculosCCIA.dsEstMotos
                      KeyField = 'COD_CLIENTE'
                      ListField = 'NOME_CLIENTE'
                      ListSource = DtmVeiculosCCIA.dsFornecedorEstMotos
                      TabOrder = 18
                    end
                    object DBEdit2: TDBEdit
                      Left = 108
                      Top = 164
                      Width = 39
                      Height = 21
                      Hint = 'Fornecedor do Ve'#237'culo.'
                      CharCase = ecUpperCase
                      DataField = 'COD_FORNECEDOR'
                      DataSource = DtmVeiculosCCIA.dsEstMotos
                      TabOrder = 17
                      OnExit = DBEdit2Exit
                      OnKeyDown = DBEdit2KeyDown
                    end
                    object DBComboBox1: TDBComboBox
                      Left = 618
                      Top = 257
                      Width = 110
                      Height = 21
                      Hint = 'Tipo de Opera'#231#227'o'
                      Style = csDropDownList
                      CharCase = ecUpperCase
                      DataField = 'TIPV_VEICULO'
                      DataSource = DtmVeiculosCCIA.dsEstMotos
                      Enabled = False
                      ItemHeight = 13
                      Items.Strings = (
                        'V - VENDA'
                        'C - CONSIGNADO'
                        'I - INTERMEDIACAO')
                      TabOrder = 32
                      OnExit = DBComboBox1Exit
                    end
                    object DBEdit10: TDBEdit
                      Left = 369
                      Top = 305
                      Width = 110
                      Height = 21
                      Hint = 'Valor para Compra'
                      CharCase = ecUpperCase
                      DataField = 'VL_COMPRA'
                      DataSource = DtmVeiculosCCIA.dsEstMotos
                      Enabled = False
                      TabOrder = 37
                      OnExit = DBEdit10Exit
                    end
                    object DBEdit13: TDBEdit
                      Left = 108
                      Top = 355
                      Width = 110
                      Height = 21
                      Hint = 'N'#186' Complemento'
                      CharCase = ecUpperCase
                      DataField = 'COM_ENT'
                      DataSource = DtmVeiculosCCIA.dsEstMotos
                      TabOrder = 42
                      Visible = False
                      OnExit = DBEdit10Exit
                    end
                    object DBEdit15: TDBEdit
                      Left = 108
                      Top = 280
                      Width = 110
                      Height = 21
                      Hint = 'Percentual de Redu'#231#227'o'
                      CharCase = ecUpperCase
                      DataField = 'PERC_RED'
                      DataSource = DtmVeiculosCCIA.dsEstMotos
                      TabOrder = 33
                      OnExit = DBEdit10Exit
                    end
                    object DBComboBox5: TDBComboBox
                      Left = 414
                      Top = 280
                      Width = 65
                      Height = 21
                      Hint = 'Red Lucro'
                      CharCase = ecUpperCase
                      DataField = 'RED_LUCRO'
                      DataSource = DtmVeiculosCCIA.dsEstMotos
                      ItemHeight = 13
                      Items.Strings = (
                        'SIM'
                        'N'#195'O')
                      TabOrder = 34
                    end
                    object DBComboBox6: TDBComboBox
                      Left = 618
                      Top = 72
                      Width = 110
                      Height = 21
                      Hint = 'Tipo de Estoque'
                      Style = csDropDownList
                      CharCase = ecUpperCase
                      DataField = 'ESTOQUE'
                      DataSource = DtmVeiculosCCIA.dsEstMotos
                      ItemHeight = 13
                      Items.Strings = (
                        'P - PROPRIO'
                        'T - TERCEIRO'
                        'O - OUTRAS CONCESSIONARIAS')
                      TabOrder = 7
                      OnExit = DBComboBox3Exit
                    end
                    object DBComboBox7: TDBComboBox
                      Left = 320
                      Top = 26
                      Width = 161
                      Height = 21
                      Hint = 'Posi'#231#227'o do Ve'#237'culo'
                      Style = csDropDownList
                      CharCase = ecUpperCase
                      DataField = 'POSICAO'
                      DataSource = DtmVeiculosCCIA.dsEstMotos
                      ItemHeight = 13
                      Items.Strings = (
                        'VIVO'
                        'TRANSITO'
                        'ESTACIONAMENTO')
                      TabOrder = 1
                      OnExit = DBComboBox3Exit
                    end
                    object DBEdit12: TDBEdit
                      Left = 618
                      Top = 281
                      Width = 110
                      Height = 21
                      Hint = 'Pre'#231'o de Tabela'
                      CharCase = ecUpperCase
                      DataField = 'PRECO_TABEST'
                      DataSource = DtmVeiculosCCIA.dsEstMotos
                      Enabled = False
                      TabOrder = 35
                      OnExit = DBEdit10Exit
                    end
                    object DBEdit17: TDBEdit
                      Left = 108
                      Top = 234
                      Width = 110
                      Height = 21
                      Hint = 'Pre'#231'o de Custo'
                      CharCase = ecUpperCase
                      DataField = 'PRECO_CUSTO'
                      DataSource = DtmVeiculosCCIA.dsEstMotos
                      TabOrder = 27
                      OnExit = DBEdit10Exit
                    end
                    object DBEdit19: TDBEdit
                      Left = 369
                      Top = 234
                      Width = 110
                      Height = 21
                      Hint = 'Pre'#231'o de custo obtido pela entrada de nota fiscal '
                      CharCase = ecUpperCase
                      DataField = 'PRECO_CUSTO_REP'
                      DataSource = DtmVeiculosCCIA.dsEstMotos
                      Enabled = False
                      TabOrder = 28
                      OnExit = DBEdit10Exit
                    end
                    object DBEdit20: TDBEdit
                      Left = 618
                      Top = 234
                      Width = 110
                      Height = 21
                      Hint = 'Pre'#231'o de Custo com Despesa'
                      CharCase = ecUpperCase
                      DataField = 'PRECO_CUSTO_DESP'
                      DataSource = DtmVeiculosCCIA.dsEstMotos
                      Enabled = False
                      TabOrder = 29
                      OnExit = DBEdit10Exit
                    end
                    object DBEdit21: TDBEdit
                      Left = 618
                      Top = 305
                      Width = 110
                      Height = 21
                      Hint = 'Valor para Compra'
                      CharCase = ecUpperCase
                      DataField = 'VALOR_VEN'
                      DataSource = DtmVeiculosCCIA.dsEstMotos
                      Enabled = False
                      TabOrder = 38
                      OnExit = DBEdit10Exit
                    end
                    object DBEdit9: TDBEdit
                      Left = 108
                      Top = 305
                      Width = 110
                      Height = 21
                      Hint = 'Valor Sugerido para Venda'
                      CharCase = ecUpperCase
                      DataField = 'PRECO_SUG_VND'
                      DataSource = DtmVeiculosCCIA.dsEstMotos
                      TabOrder = 36
                      OnExit = DBEdit10Exit
                    end
                    object DBEdit16: TDBEdit
                      Left = 108
                      Top = 330
                      Width = 110
                      Height = 21
                      Hint = 'Valor para Compra'
                      CharCase = ecUpperCase
                      DataField = 'N_COMANDO'
                      DataSource = DtmVeiculosCCIA.dsEstMotos
                      Enabled = False
                      TabOrder = 39
                      OnExit = DBEdit10Exit
                    end
                    object DBEdit25: TDBEdit
                      Left = 369
                      Top = 330
                      Width = 110
                      Height = 21
                      Hint = 'Valor para Compra'
                      CharCase = ecUpperCase
                      DataField = 'N_COMANDOV'
                      DataSource = DtmVeiculosCCIA.dsEstMotos
                      Enabled = False
                      TabOrder = 40
                      OnExit = DBEdit10Exit
                    end
                    object DBEdit29: TDBEdit
                      Left = 618
                      Top = 330
                      Width = 110
                      Height = 21
                      Hint = 'Valor para Compra'
                      CharCase = ecUpperCase
                      DataField = 'N_COMANDO_TROCA'
                      DataSource = DtmVeiculosCCIA.dsEstMotos
                      Enabled = False
                      TabOrder = 41
                      OnExit = DBEdit10Exit
                    end
                  end
                end
              end
              object TabSheet_MaisInformacoes: TTabSheet
                Caption = 'Mais Informa'#231#245'es'
                ImageIndex = 8
                object ScrollBox5: TScrollBox
                  Left = 0
                  Top = 0
                  Width = 780
                  Height = 457
                  Align = alClient
                  TabOrder = 0
                  object pnObservacao: TPanel
                    Left = 0
                    Top = 0
                    Width = 776
                    Height = 453
                    Align = alTop
                    TabOrder = 0
                    object GroupBox32: TGroupBox
                      Left = 1
                      Top = 1
                      Width = 774
                      Height = 451
                      Align = alTop
                      Caption = 'Mais Informa'#231#245'es'
                      TabOrder = 0
                      object Label94: TLabel
                        Left = 21
                        Top = 229
                        Width = 63
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Adicionais:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label95: TLabel
                        Left = 5
                        Top = 35
                        Width = 79
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Observa'#231#245'es:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object DBMemo_Observacoes: TDBMemo
                        Left = 90
                        Top = 30
                        Width = 634
                        Height = 190
                        Hint = 'Observa'#231#227'o do Ve'#237'culo'
                        DataField = 'OBS_ITEMEST'
                        DataSource = DtmVeiculosCCIA.dsEstMotos
                        MaxLength = 256
                        TabOrder = 0
                      end
                      object DBMemo_Adicionais: TDBMemo
                        Left = 90
                        Top = 226
                        Width = 634
                        Height = 190
                        Hint = 'Observa'#231#227'o Adicional do Ve'#237'culo'
                        DataField = 'ADICIONAIS'
                        DataSource = DtmVeiculosCCIA.dsEstMotos
                        MaxLength = 256
                        TabOrder = 1
                      end
                      object pnConfirmObs: TPanel
                        Left = 2
                        Top = 419
                        Width = 770
                        Height = 30
                        Align = alBottom
                        BevelKind = bkTile
                        BevelOuter = bvNone
                        TabOrder = 2
                        object BitBtn43: TBitBtn
                          Left = 305
                          Top = 0
                          Width = 75
                          Height = 25
                          Hint = 'OK'
                          Caption = '&OK'
                          Default = True
                          TabOrder = 0
                          OnClick = BitBtn43Click
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
                        object BitBtn44: TBitBtn
                          Left = 386
                          Top = 0
                          Width = 75
                          Height = 25
                          Hint = 'Cancelar'
                          Caption = '&Cancela'
                          TabOrder = 1
                          OnClick = BitBtn44Click
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
                      end
                    end
                  end
                end
              end
              object TabSheet_Despesas: TTabSheet
                Caption = 'Despesas'
                ImageIndex = 4
                object ScrollBox8: TScrollBox
                  Left = 0
                  Top = 0
                  Width = 780
                  Height = 457
                  Align = alClient
                  BevelInner = bvNone
                  BevelOuter = bvNone
                  TabOrder = 0
                  object GroupBox14: TGroupBox
                    Left = 0
                    Top = 0
                    Width = 759
                    Height = 776
                    Align = alTop
                    Caption = 'Despesas do Ve'#237'culo'
                    TabOrder = 0
                    object Panel6: TPanel
                      Left = 2
                      Top = 227
                      Width = 755
                      Height = 197
                      Align = alTop
                      TabOrder = 3
                      object DBGrid4: TDBGrid
                        Left = 1
                        Top = 1
                        Width = 753
                        Height = 195
                        Align = alClient
                        DataSource = DtmVeiculosCCIA.dsDespesas
                        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                        TabOrder = 0
                        TitleFont.Charset = DEFAULT_CHARSET
                        TitleFont.Color = clWindowText
                        TitleFont.Height = -11
                        TitleFont.Name = 'Tahoma'
                        TitleFont.Style = []
                        OnDrawColumnCell = DBGrid4DrawColumnCell
                        OnKeyDown = DBGrid4KeyDown
                        OnTitleClick = DBGrid4TitleClick
                        Columns = <
                          item
                            Expanded = False
                            FieldName = 'COD_DESPESA'
                            Visible = True
                          end
                          item
                            Expanded = False
                            FieldName = 'N_DOC'
                            Visible = True
                          end
                          item
                            Expanded = False
                            FieldName = 'DESCRICAO_DESP'
                            Title.Caption = 'Descricao'
                            Visible = True
                          end
                          item
                            Expanded = False
                            FieldName = 'DATA_DESPESA'
                            Title.Caption = 'Data Entrada'
                            Visible = True
                          end
                          item
                            Expanded = False
                            FieldName = 'VALOR_DESPESA'
                            Visible = True
                          end
                          item
                            Expanded = False
                            FieldName = 'NOME_CLIENTE'
                            Title.Caption = 'Nome Fantasia'
                            Visible = True
                          end
                          item
                            Expanded = False
                            FieldName = 'RAZAO'
                            Title.Caption = 'Razao Social'
                            Visible = True
                          end
                          item
                            Expanded = False
                            FieldName = 'COD_CONTROLE'
                            Visible = True
                          end
                          item
                            Expanded = False
                            FieldName = 'OBS'
                            Visible = True
                          end
                          item
                            Expanded = False
                            FieldName = 'STATUS_DESPESA'
                            Visible = True
                          end
                          item
                            Expanded = False
                            FieldName = 'COD_FUNC'
                            Visible = True
                          end
                          item
                            Expanded = False
                            FieldName = 'COD_CLIENTE'
                            Visible = True
                          end
                          item
                            Expanded = False
                            FieldName = 'COD_TP_DESPESA'
                            Visible = True
                          end>
                      end
                    end
                    object Panel9: TPanel
                      Left = 2
                      Top = 424
                      Width = 755
                      Height = 350
                      Align = alClient
                      TabOrder = 4
                    end
                    object GroupBox18: TGroupBox
                      Left = 2
                      Top = 181
                      Width = 755
                      Height = 46
                      Align = alTop
                      TabOrder = 2
                      object Label62: TLabel
                        Left = 622
                        Top = 20
                        Width = 32
                        Height = 13
                        Caption = 'Total:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label10: TLabel
                        Left = 58
                        Top = 22
                        Width = 94
                        Height = 13
                        Caption = 'Despesa em Aberto'
                      end
                      object BitBtn_Alterar_Despesa: TBitBtn
                        Left = 234
                        Top = 15
                        Width = 75
                        Height = 25
                        Hint = 'Alterar Despesas  - [VEI028]'
                        Caption = 'Alterar'
                        TabOrder = 1
                        OnClick = BitBtn_Alterar_DespesaClick
                        Glyph.Data = {
                          36050000424D3605000000000000360400002800000010000000100000000100
                          08000000000000010000420B0000420B00000001000000010000000000000084
                          0000210021005A4A29004A3939005A5242004A4A4A005A524A0073524A005A52
                          52006300630073737300BD847B00C6947B00CE9C7B00B58484009C948400BD94
                          9400EFCE9400F7CE9400C6A59C00EFCE9C00F7CE9C00F7D69C00C6ADA500CEAD
                          A500F7D6A500C6ADAD00CEB5AD00D6B5AD00EFD6AD00F7D6AD00C6B5B500D6BD
                          B500DEBDB500DEC6B500E7C6B500EFC6B500EFCEB500F7D6B500F7DEB500D6C6
                          BD00DECEBD00EFCEBD00F7DEBD0000C6C600C6C6C600D6CEC600F7DEC600F7E7
                          C600E7CECE00E7D6CE00F7E7CE00E7D6D600F7E7D600FFE7D600FFEFD600FFEF
                          DE00FFEFE700FFF7E70021F7EF00FFF7EF0018F7F700FFF7F700FFFFF700FF00
                          FF0000FFFF0021FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0041410F0F0F0F
                          0F0F0F0F0F0F0F0F0F4141411438312C281E1A15121212170F41414114382E2E
                          2E2E2E2E2E2E2E150F414141183A3634302C1E15151512150F414141183B3634
                          31302805151515120F4141411C402E2E2E2E2E06002E2E150F4141411D443D3A
                          363431070000291E0F41414121443F3D39363407422D00290F41414121442E2E
                          2E2E2E0B3E2D002911414141224444443F3A393609422D001B41414123444444
                          443F3A3910432D002041414124442E2E2E2E2E2E3604422D0041414124444444
                          4444444032083C2D004141412B44444444444444330D030001004141243F3D3D
                          3D3D3D3D320D0801010241412426262626242426210C410A0A41}
                      end
                      object BitBtn_Cancelar_Despesa: TBitBtn
                        Left = 389
                        Top = 15
                        Width = 75
                        Height = 25
                        Hint = 'Cancelar Despesas'
                        Caption = 'Cancelar'
                        TabOrder = 3
                        OnClick = BitBtn_Cancelar_DespesaClick
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
                      object BitBtn_Excluir_Despesa: TBitBtn
                        Left = 467
                        Top = 15
                        Width = 75
                        Height = 25
                        Hint = 'Excluir Despesas - [VEI030]'
                        Caption = 'Excluir'
                        TabOrder = 4
                        OnClick = BitBtn_Excluir_DespesaClick
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
                      object BitBtn_Salvar_Despesa: TBitBtn
                        Left = 311
                        Top = 15
                        Width = 75
                        Height = 25
                        Hint = 'Salvar Despesas - [VEI027]'
                        Caption = 'Salvar'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = []
                        ParentFont = False
                        TabOrder = 2
                        OnClick = BitBtn_Salvar_DespesaClick
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
                      object BitBtn_Novo_Despesa: TBitBtn
                        Left = 155
                        Top = 15
                        Width = 75
                        Height = 25
                        Hint = 'Novo Despesa - [VEI029]'
                        Caption = 'Novo'
                        TabOrder = 0
                        OnClick = BitBtn_Novo_DespesaClick
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
                      object EditMoedaSomaTotalDespesas: TEditMoeda
                        Left = 660
                        Top = 17
                        Width = 77
                        Height = 21
                        Alignment = taRightJustify
                        Enabled = False
                        TabOrder = 5
                        FormatReal = fMoney
                        FormatSize = '10.2'
                      end
                      object Panel8: TPanel
                        Left = 3
                        Top = 22
                        Width = 49
                        Height = 13
                        BevelOuter = bvNone
                        Caption = '0,00'
                        Color = clRed
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clRed
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentBackground = False
                        ParentFont = False
                        TabOrder = 6
                      end
                    end
                    object GroupBox15: TGroupBox
                      Left = 2
                      Top = 75
                      Width = 755
                      Height = 106
                      Align = alTop
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clBlack
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 1
                      object Label59: TLabel
                        Left = 622
                        Top = 14
                        Width = 32
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Valor:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label32: TLabel
                        Left = 58
                        Top = 38
                        Width = 51
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Parcelas:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label57: TLabel
                        Left = 38
                        Top = 15
                        Width = 68
                        Height = 13
                        Caption = 'Funcion'#225'rio:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object DBEdit_Valor_Despesa: TDBEdit
                        Left = 660
                        Top = 11
                        Width = 77
                        Height = 21
                        Hint = 'Valor.'
                        CharCase = ecUpperCase
                        DataField = 'VALOR_DESPESA'
                        DataSource = DtmVeiculosCCIA.dsDespesas
                        TabOrder = 1
                      end
                      object DBMemo_Despesa_Obs: TDBMemo
                        Left = 115
                        Top = 38
                        Width = 622
                        Height = 59
                        Hint = 'Parcelas'
                        DataField = 'OBS'
                        DataSource = DtmVeiculosCCIA.dsDespesas
                        ReadOnly = True
                        ScrollBars = ssVertical
                        TabOrder = 2
                      end
                      object DBLookupComboBox_Funcionario_Despesa: TDBLookupComboBox
                        Left = 115
                        Top = 11
                        Width = 375
                        Height = 21
                        Hint = 'Funcion'#225'rio respons'#225'vel.'
                        DataField = 'COD_FUNC'
                        DataSource = DtmVeiculosCCIA.dsDespesas
                        KeyField = 'COD_VENDEDOR'
                        ListField = 'NOME_VENDEDOR'
                        ListSource = DtmVeiculosCCIA.dsColaboradorEstMotos
                        ReadOnly = True
                        TabOrder = 0
                      end
                    end
                    object GroupBox25: TGroupBox
                      Left = 2
                      Top = 15
                      Width = 755
                      Height = 60
                      Align = alTop
                      TabOrder = 0
                      object Label51: TLabel
                        Left = 42
                        Top = 38
                        Width = 67
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Fornecedor:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label52: TLabel
                        Left = 584
                        Top = 14
                        Width = 70
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Dt. Despesa:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label7: TLabel
                        Left = 14
                        Top = 13
                        Width = 95
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Tipo de Despesa:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object DBEdit_Data_Despesa: TDBEdit
                        Left = 660
                        Top = 11
                        Width = 77
                        Height = 21
                        CharCase = ecUpperCase
                        DataField = 'DATA_DESPESA'
                        DataSource = DtmVeiculosCCIA.dsDespesas
                        Enabled = False
                        TabOrder = 2
                      end
                      object DBLookupComboBox_Fornecedor_Despesa: TDBLookupComboBox
                        Left = 156
                        Top = 34
                        Width = 334
                        Height = 21
                        Hint = 'Fornecedor.'
                        DataField = 'COD_CLIENTE'
                        DataSource = DtmVeiculosCCIA.dsDespesas
                        KeyField = 'COD_CLIENTE'
                        ListField = 'NOME_CLIENTE'
                        ListSource = DtmVeiculosCCIA.dsFornecDespesa
                        ReadOnly = True
                        TabOrder = 4
                      end
                      object DBLookupComboBox_Assunto_Despesa: TDBLookupComboBox
                        Left = 156
                        Top = 11
                        Width = 334
                        Height = 21
                        Hint = 'Tipo de Despesa.'
                        DataField = 'COD_TP_DESPESA'
                        DataSource = DtmVeiculosCCIA.dsDespesas
                        KeyField = 'COD_TP_DESPESA'
                        ListField = 'DESCRICAO'
                        ListSource = DtmVeiculosCCIA.dsAbreTPDespesa
                        ReadOnly = True
                        TabOrder = 1
                      end
                      object DBEdit_Assunto_Despesa: TDBEdit
                        Left = 115
                        Top = 11
                        Width = 39
                        Height = 21
                        Hint = 'Tipo de Despesa.'
                        DataField = 'COD_TP_DESPESA'
                        DataSource = DtmVeiculosCCIA.dsDespesas
                        ReadOnly = True
                        TabOrder = 0
                        OnKeyDown = DBEdit_Assunto_DespesaKeyDown
                      end
                      object DBEdit_Fornecedor_Despesa: TDBEdit
                        Left = 115
                        Top = 34
                        Width = 39
                        Height = 21
                        Hint = 'Fornecedor.'
                        DataField = 'COD_CLIENTE'
                        DataSource = DtmVeiculosCCIA.dsDespesas
                        ReadOnly = True
                        TabOrder = 3
                        OnExit = DBEdit_Fornecedor_DespesaExit
                        OnKeyDown = DBEdit_Fornecedor_DespesaKeyDown
                      end
                    end
                  end
                end
              end
              object TabSheet_Pendencias: TTabSheet
                Caption = 'Pend'#234'ncias'
                ImageIndex = 3
                object ScrollBox7: TScrollBox
                  Left = 0
                  Top = 0
                  Width = 780
                  Height = 457
                  Align = alClient
                  BevelInner = bvNone
                  BevelOuter = bvNone
                  TabOrder = 0
                  object GroupBox12: TGroupBox
                    Left = 0
                    Top = 0
                    Width = 776
                    Height = 429
                    Align = alTop
                    Caption = 'Pend'#234'ncia do Ve'#237'culo'
                    TabOrder = 0
                    object Panel7: TPanel
                      Left = 2
                      Top = 257
                      Width = 772
                      Height = 170
                      Align = alClient
                      Caption = 'Panel7'
                      TabOrder = 3
                      object DBGrid3: TDBGrid
                        Left = 1
                        Top = 1
                        Width = 770
                        Height = 168
                        Align = alClient
                        DataSource = DtmVeiculosCCIA.dsPendencias
                        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                        TabOrder = 0
                        TitleFont.Charset = DEFAULT_CHARSET
                        TitleFont.Color = clWindowText
                        TitleFont.Height = -11
                        TitleFont.Name = 'Tahoma'
                        TitleFont.Style = []
                        OnDrawColumnCell = DBGrid3DrawColumnCell
                        OnKeyDown = DBGrid3KeyDown
                        OnTitleClick = DBGrid3TitleClick
                        Columns = <
                          item
                            Expanded = False
                            FieldName = 'COD_PENDENCIA'
                            Visible = True
                          end
                          item
                            Expanded = False
                            FieldName = 'DESCRICAO'
                            Title.Caption = 'Descricao'
                            Visible = True
                          end
                          item
                            Expanded = False
                            FieldName = 'DATA_PENDENCIA'
                            Visible = True
                          end
                          item
                            Expanded = False
                            FieldName = 'STATUS_PENDENCIA'
                            Visible = True
                          end
                          item
                            Expanded = False
                            FieldName = 'VALOR_PENDENCIA'
                            Visible = True
                          end
                          item
                            Expanded = False
                            FieldName = 'DESCRICAO_TP'
                            Visible = True
                          end
                          item
                            Expanded = False
                            FieldName = 'DATA_PREVISTA'
                            Visible = True
                          end
                          item
                            Expanded = False
                            FieldName = 'OBS'
                            Visible = True
                          end
                          item
                            Expanded = False
                            FieldName = 'COD_FUNC'
                            Visible = True
                          end
                          item
                            Expanded = False
                            FieldName = 'COD_TP_PENDENCIA'
                            Visible = True
                          end>
                      end
                    end
                    object GroupBox17: TGroupBox
                      Left = 2
                      Top = 211
                      Width = 772
                      Height = 46
                      Align = alTop
                      TabOrder = 2
                      object Label61: TLabel
                        Left = 620
                        Top = 23
                        Width = 32
                        Height = 13
                        Caption = 'Total:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label53: TLabel
                        Left = 58
                        Top = 22
                        Width = 116
                        Height = 13
                        Caption = 'Pend'#234'ncia n'#227'o resolvida'
                      end
                      object EditMoedaSomaTotalPend: TEditMoeda
                        Left = 658
                        Top = 19
                        Width = 77
                        Height = 21
                        Alignment = taRightJustify
                        Enabled = False
                        TabOrder = 5
                        FormatReal = fMoney
                        FormatSize = '10.2'
                      end
                      object BitBtn_Novo_Pendencia: TBitBtn
                        Left = 197
                        Top = 15
                        Width = 75
                        Height = 25
                        Hint = 'Novo Pend'#234'ncia - [VEI022]'
                        Caption = 'Novo'
                        TabOrder = 0
                        OnClick = BitBtn_Novo_PendenciaClick
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
                      object BitBtn_Alterar_Pendencia: TBitBtn
                        Left = 274
                        Top = 15
                        Width = 75
                        Height = 25
                        Hint = 'Alterar Pend'#234'ncia - [VEI021]'
                        Caption = 'Alterar'
                        TabOrder = 1
                        OnClick = BitBtn_Alterar_PendenciaClick
                        Glyph.Data = {
                          36050000424D3605000000000000360400002800000010000000100000000100
                          08000000000000010000420B0000420B00000001000000010000000000000084
                          0000210021005A4A29004A3939005A5242004A4A4A005A524A0073524A005A52
                          52006300630073737300BD847B00C6947B00CE9C7B00B58484009C948400BD94
                          9400EFCE9400F7CE9400C6A59C00EFCE9C00F7CE9C00F7D69C00C6ADA500CEAD
                          A500F7D6A500C6ADAD00CEB5AD00D6B5AD00EFD6AD00F7D6AD00C6B5B500D6BD
                          B500DEBDB500DEC6B500E7C6B500EFC6B500EFCEB500F7D6B500F7DEB500D6C6
                          BD00DECEBD00EFCEBD00F7DEBD0000C6C600C6C6C600D6CEC600F7DEC600F7E7
                          C600E7CECE00E7D6CE00F7E7CE00E7D6D600F7E7D600FFE7D600FFEFD600FFEF
                          DE00FFEFE700FFF7E70021F7EF00FFF7EF0018F7F700FFF7F700FFFFF700FF00
                          FF0000FFFF0021FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0041410F0F0F0F
                          0F0F0F0F0F0F0F0F0F4141411438312C281E1A15121212170F41414114382E2E
                          2E2E2E2E2E2E2E150F414141183A3634302C1E15151512150F414141183B3634
                          31302805151515120F4141411C402E2E2E2E2E06002E2E150F4141411D443D3A
                          363431070000291E0F41414121443F3D39363407422D00290F41414121442E2E
                          2E2E2E0B3E2D002911414141224444443F3A393609422D001B41414123444444
                          443F3A3910432D002041414124442E2E2E2E2E2E3604422D0041414124444444
                          4444444032083C2D004141412B44444444444444330D030001004141243F3D3D
                          3D3D3D3D320D0801010241412426262626242426210C410A0A41}
                      end
                      object BitBtn_Salvar_Pendencia: TBitBtn
                        Left = 351
                        Top = 15
                        Width = 75
                        Height = 25
                        Hint = 'Salvar Pend'#234'ncia - [VEI020]'
                        Caption = 'Salvar'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = []
                        ParentFont = False
                        TabOrder = 2
                        OnClick = BitBtn_Salvar_PendenciaClick
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
                      object BitBtn_Cancelar_Pendencia: TBitBtn
                        Left = 428
                        Top = 15
                        Width = 75
                        Height = 25
                        Hint = 'Cancelar Ped'#234'ncia'
                        Caption = 'Cancelar'
                        TabOrder = 3
                        OnClick = BitBtn_Cancelar_PendenciaClick
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
                      object BitBtn_Excluir_Pendencia: TBitBtn
                        Left = 506
                        Top = 15
                        Width = 75
                        Height = 25
                        Hint = 'Excluir Pend'#234'ncia - [VEI023]'
                        Caption = 'Excluir'
                        TabOrder = 4
                        OnClick = BitBtn_Excluir_PendenciaClick
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
                      object Panel26: TPanel
                        Left = 3
                        Top = 22
                        Width = 49
                        Height = 13
                        BevelOuter = bvNone
                        Caption = '0,00'
                        Color = clRed
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clRed
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentBackground = False
                        ParentFont = False
                        TabOrder = 6
                      end
                    end
                    object GroupBox13: TGroupBox
                      Left = 2
                      Top = 76
                      Width = 772
                      Height = 135
                      Align = alTop
                      TabOrder = 1
                      object Label46: TLabel
                        Left = 62
                        Top = 39
                        Width = 52
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Situa'#231#227'o:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label47: TLabel
                        Left = 583
                        Top = 63
                        Width = 69
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Dt. Prevista:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label49: TLabel
                        Left = 46
                        Top = 14
                        Width = 68
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Funcion'#225'rio:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label50: TLabel
                        Left = 82
                        Top = 63
                        Width = 32
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Valor:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label96: TLabel
                        Left = 90
                        Top = 88
                        Width = 24
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Obs:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object DBEdit_DataPrevista_Pendencia: TDBEdit
                        Left = 658
                        Top = 60
                        Width = 77
                        Height = 21
                        Hint = 'Data prevista.'
                        CharCase = ecUpperCase
                        DataField = 'DATA_PREVISTA'
                        DataSource = DtmVeiculosCCIA.dsPendencias
                        TabOrder = 3
                      end
                      object DBLookupComboBox_Funcionario_Pendencia: TDBLookupComboBox
                        Left = 117
                        Top = 10
                        Width = 374
                        Height = 21
                        Hint = 'Funcion'#225'rio respons'#225'vel.'
                        DataField = 'COD_FUNC'
                        DataSource = DtmVeiculosCCIA.dsPendencias
                        KeyField = 'COD_VENDEDOR'
                        ListField = 'NOME_VENDEDOR'
                        ListSource = DtmVeiculosCCIA.dsColaboradorEstMotos
                        TabOrder = 0
                      end
                      object DBEdit_Valor_Pendencia: TDBEdit
                        Left = 117
                        Top = 60
                        Width = 121
                        Height = 21
                        Hint = 'Valor da pend'#234'ncia.'
                        CharCase = ecUpperCase
                        DataField = 'VALOR_PENDENCIA'
                        DataSource = DtmVeiculosCCIA.dsPendencias
                        TabOrder = 2
                      end
                      object DBComboBox_Status_Pendencia: TDBComboBox
                        Left = 117
                        Top = 35
                        Width = 121
                        Height = 21
                        Hint = 'Situa'#231#227'o da pend'#234'ncia.'
                        CharCase = ecUpperCase
                        DataField = 'STATUS_PENDENCIA'
                        DataSource = DtmVeiculosCCIA.dsPendencias
                        ItemHeight = 13
                        Items.Strings = (
                          'PENDENTE'
                          'REGULAR')
                        TabOrder = 1
                      end
                      object DBMemo_Pendencia_Obs: TDBMemo
                        Left = 117
                        Top = 84
                        Width = 618
                        Height = 47
                        DataField = 'OBS'
                        DataSource = DtmVeiculosCCIA.dsPendencias
                        TabOrder = 4
                      end
                    end
                    object GroupBox22: TGroupBox
                      Left = 2
                      Top = 15
                      Width = 772
                      Height = 61
                      Align = alTop
                      TabOrder = 0
                      object Label43: TLabel
                        Left = 9
                        Top = 14
                        Width = 105
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Tipo de Pend'#234'ncia:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label44: TLabel
                        Left = 572
                        Top = 15
                        Width = 80
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Dt. Pend'#234'ncia:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label45: TLabel
                        Left = 56
                        Top = 38
                        Width = 58
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Descri'#231#227'o:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object DBEdit_Data_Pendencia: TDBEdit
                        Left = 658
                        Top = 11
                        Width = 77
                        Height = 21
                        Hint = 'Data da pend'#234'ncia.'
                        CharCase = ecUpperCase
                        DataField = 'DATA_PENDENCIA'
                        DataSource = DtmVeiculosCCIA.dsPendencias
                        Enabled = False
                        TabOrder = 2
                      end
                      object DBLookupComboBox_Assunto_Pendencia: TDBLookupComboBox
                        Left = 158
                        Top = 11
                        Width = 333
                        Height = 21
                        Hint = 'Tipo de Pend'#234'ncia.'
                        DataField = 'COD_TP_PENDENCIA'
                        DataSource = DtmVeiculosCCIA.dsPendencias
                        KeyField = 'COD_TP_PENDENCIA'
                        ListField = 'DESCRICAO'
                        ListSource = DtmVeiculosCCIA.dsAbreTPPendencia
                        TabOrder = 1
                      end
                      object DBEdit_Descricao_Pendencia: TDBEdit
                        Left = 117
                        Top = 35
                        Width = 616
                        Height = 21
                        Hint = 'Descri'#231#227'o da Ped'#234'ncia.'
                        CharCase = ecUpperCase
                        DataField = 'DESCRICAO'
                        DataSource = DtmVeiculosCCIA.dsPendencias
                        TabOrder = 3
                      end
                      object DBEdit_Assunto_Pendencia: TDBEdit
                        Left = 117
                        Top = 11
                        Width = 39
                        Height = 21
                        Hint = 'Tipo de Pend'#234'ncia.'
                        DataField = 'COD_TP_PENDENCIA'
                        DataSource = DtmVeiculosCCIA.dsPendencias
                        TabOrder = 0
                        OnKeyDown = DBEdit_Assunto_PendenciaKeyDown
                      end
                    end
                  end
                end
              end
              object TabSheet_Notas: TTabSheet
                Caption = 'Notas Fiscais'
                ImageIndex = 5
                object ScrollBox9: TScrollBox
                  Left = 0
                  Top = 0
                  Width = 780
                  Height = 457
                  Align = alClient
                  BevelInner = bvNone
                  BevelOuter = bvNone
                  TabOrder = 0
                  object GroupBox7: TGroupBox
                    Left = 0
                    Top = 0
                    Width = 776
                    Height = 453
                    Align = alTop
                    Caption = 'Notas Fiscais'
                    TabOrder = 0
                    object GroupBox8: TGroupBox
                      Left = 2
                      Top = 57
                      Width = 772
                      Height = 185
                      Align = alTop
                      Caption = 'Entrada'
                      TabOrder = 1
                      object Panel11: TPanel
                        Left = 2
                        Top = 157
                        Width = 768
                        Height = 26
                        Align = alBottom
                        BevelOuter = bvNone
                        TabOrder = 0
                        object Label38: TLabel
                          Left = 68
                          Top = 6
                          Width = 88
                          Height = 13
                          Caption = 'Nota Fiscal Aberta'
                        end
                        object Label23: TLabel
                          Left = 298
                          Top = 6
                          Width = 105
                          Height = 13
                          Caption = 'Nota Fiscal Cancelada'
                        end
                        object BitBtn25: TBitBtn
                          Left = 515
                          Top = 0
                          Width = 86
                          Height = 26
                          Hint = 'Visualizar Nota Fiscal- [NF0012]'
                          Align = alRight
                          Caption = '&Visualizar'
                          TabOrder = 1
                          OnClick = BitBtn25Click
                          Glyph.Data = {
                            36030000424D3603000000000000360000002800000010000000100000000100
                            18000000000000030000120B0000120B00000000000000000000FF00FF314B62
                            AC7D7EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                            FFFF00FFFF00FFFF00FF5084B20F6FE1325F8CB87E7AFF00FFFF00FFFF00FFFF
                            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF32A0FE37A1FF
                            106FE2325F8BB67D79FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                            FFFF00FFFF00FFFF00FFFF00FF37A4FE379FFF0E6DDE355F89BB7F79FF00FFFF
                            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                            37A4FE359EFF0F6FDE35608BA67B7FFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF38A5FE329DFF156DCE444F5BFF
                            00FF9C6B65AF887BAF887EAA8075FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                            FF00FFFF00FF3BABFFA1CAE7AD8679A98373E0CFB1FFFFDAFFFFDDFCF8CFCCB2
                            9FA1746BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC0917DFC
                            E9ACFFFFCCFFFFCFFFFFD0FFFFDEFFFFFAE3D3D1996965FF00FFFF00FFFF00FF
                            FF00FFFF00FFFF00FFFF00FFB08978FAD192FEF4C2FFFFD0FFFFDAFFFFF6FFFF
                            FCFFFFFCB69384FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB08978FEDA97ED
                            B478FBEEBBFFFFD3FFFFDCFFFFF4FFFFF4FFFFE2E9DDBCA67B73FF00FFFF00FF
                            FF00FFFF00FFFF00FFB18A78FFDE99E9A167F4D199FEFCCCFFFFD5FFFFDAFFFF
                            DCFFFFD7EFE6C5A97E75FF00FFFF00FFFF00FFFF00FFFF00FFAA7F73FAE0A4F0
                            B778EEBA7BF6DDA6FEFBCCFFFFD3FFFFD1FFFFD7D9C5A7A3756CFF00FFFF00FF
                            FF00FFFF00FFFF00FFFF00FFCEB293FFFEDDF4D1A5EEBA7BF2C78FF8E1ABFCF0
                            BAFCFACAA3776FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA1746BE1
                            D4D3FFFEEEF7CC8CF0B473F7C788FCE3A5C2A088A5776CFF00FFFF00FFFF00FF
                            FF00FFFF00FFFF00FFFF00FFFF00FF986865BA9587EAD7A4EAD59EE0C097A577
                            6CA5776CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                            00FFFF00FFA77E70A98073A4786EFF00FFFF00FFFF00FFFF00FF}
                        end
                        object BitBtn26: TBitBtn
                          Left = 601
                          Top = 0
                          Width = 81
                          Height = 26
                          Hint = 'Imprimir Nota Fiscal - [NF0020/NF0021]'
                          Align = alRight
                          Caption = '&Imprimir'
                          TabOrder = 2
                          OnClick = BitBtn26Click
                          Glyph.Data = {
                            42020000424D4202000000000000420000002800000010000000100000000100
                            10000300000000020000120B0000120B00000000000000000000007C0000E003
                            00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                            1F7C1F7C1F7C1F7C1F7C4B294B296C2D8D31AE35EF3DF03DCF39AD358C316B2D
                            4B291F7C1F7C1F7C1F7C9245DE7BFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
                            92451F7C1F7CB75D3146EF3DD65AFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F1963
                            EF3D3146B75D1042F75E734E6C2D5A6B5A6B5A6B5A6B5A6B5A6B5A6B5A6BF03D
                            734EF75E104210429452AE358610861086108610861086108610861086108610
                            AE35945210423146F75EAE358610861086108610861086108610861086108610
                            AE35F75E3146524ABD7795523246324632463246324632463246324632463246
                            9552BD77524A3146BD77F85ED85AD85AD85AD85AD85AD85AD85AD85AD85AD85A
                            F85EBD7731469A69524AB656D75AD75AD75AD75AD75AD75AD75AD75AD75AD75A
                            B656524A9A691F7C1F7C1F7CAD357B6FDE7BDE7BDE7BDE7BFF7FFF7F7B6FAD35
                            1F7C1F7C1F7C1F7C1F7C1F7CCE397B6FDE7BDE7BDE7BDE7BDE7BFF7F7B6FCE39
                            1F7C1F7C1F7C1F7C1F7C1F7CF03D7B6FDE7BDE7BDE7BDE7BDE7BDE7B7B6FF03D
                            1F7C1F7C1F7C1F7C1F7C1F7C1F7C7B6FDE7BDE7BDE7BDE7BDE7BDE7B7B6F1F7C
                            1F7C1F7C1F7C1F7C1F7C1F7C1F7C186339673967396739673967396718631F7C
                            1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                            1F7C1F7C1F7C}
                        end
                        object Panel21: TPanel
                          Left = 13
                          Top = 6
                          Width = 49
                          Height = 13
                          BevelOuter = bvNone
                          Caption = '0,00'
                          Color = clRed
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clRed
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = [fsBold]
                          ParentBackground = False
                          ParentFont = False
                          TabOrder = 4
                        end
                        object BitBtn32: TBitBtn
                          Left = 682
                          Top = 0
                          Width = 86
                          Height = 26
                          Hint = 'Cancelar Nota Fiscal - [NF0018/NF0026/NF0145]'
                          Align = alRight
                          Caption = '&Cancelar'
                          TabOrder = 3
                          OnClick = BitBtn32Click
                          Glyph.Data = {
                            36050000424D3605000000000000360400002800000010000000100000000100
                            08000000000000010000120B0000120B00000001000000000000000000000000
                            80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
                            A6000020400000206000002080000020A0000020C0000020E000004000000040
                            20000040400000406000004080000040A0000040C0000040E000006000000060
                            20000060400000606000006080000060A0000060C0000060E000008000000080
                            20000080400000806000008080000080A0000080C0000080E00000A0000000A0
                            200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
                            200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
                            200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
                            20004000400040006000400080004000A0004000C0004000E000402000004020
                            20004020400040206000402080004020A0004020C0004020E000404000004040
                            20004040400040406000404080004040A0004040C0004040E000406000004060
                            20004060400040606000406080004060A0004060C0004060E000408000004080
                            20004080400040806000408080004080A0004080C0004080E00040A0000040A0
                            200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
                            200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
                            200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
                            20008000400080006000800080008000A0008000C0008000E000802000008020
                            20008020400080206000802080008020A0008020C0008020E000804000008040
                            20008040400080406000804080008040A0008040C0008040E000806000008060
                            20008060400080606000806080008060A0008060C0008060E000808000008080
                            20008080400080806000808080008080A0008080C0008080E00080A0000080A0
                            200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
                            200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
                            200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
                            2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
                            2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
                            2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
                            2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
                            2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
                            2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
                            2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
                            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FDFDFDFDFDFD
                            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD0101FD
                            FDFDFDFDFD0101FDFDFDFDFD010F0F01FDFDFDFD01F9F901FDFDFDFD010F0F0E
                            01FDFD010FF9F901FDFDFDFDFD010F0F0F0101F9F90E01FDFDFDFDFDFDFD010F
                            0F0FF9F9F901FDFDFDFDFDFDFDFDFD010F0F0F0F01FDFDFDFDFDFDFDFDFDFD01
                            0F0F0F0F01FDFDFDFDFDFDFDFDFD01170F0F0F0F0F01FDFDFDFDFDFDFD010F17
                            1701010F0F0F01FDFDFDFDFD0117170E01FDFD010E0F0F01FDFDFDFD01171701
                            FDFDFDFD010F0F01FDFDFDFDFD0101FDFDFDFDFDFD0101FDFDFDFDFDFDFDFDFD
                            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD}
                        end
                        object Panel33: TPanel
                          Left = 243
                          Top = 6
                          Width = 49
                          Height = 13
                          BevelOuter = bvNone
                          Color = 39901
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clRed
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = [fsBold]
                          ParentBackground = False
                          ParentFont = False
                          TabOrder = 5
                        end
                        object BitBtn36: TBitBtn
                          Left = 429
                          Top = 0
                          Width = 86
                          Height = 26
                          Hint = 'Abrir Modulo de Nota Fiscal'
                          Align = alRight
                          Caption = '&Abrir'
                          TabOrder = 0
                          OnClick = BitBtn36Click
                          Glyph.Data = {
                            36030000424D3603000000000000360000002800000010000000100000000100
                            18000000000000030000C30E0000C30E00000000000000000000FF00FF606060
                            2D2D2D2626262626262626262626262626262626262626262626262626262626
                            265B5B5BFF00FFFF00FFFF00FF262626FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF262626FF00FFFF00FFFF00FF262626
                            FFFFFFC99167C99167C99167C99167C99167C99167C99167C99167C99167FFFF
                            FF262626FF00FFFF00FFFF00FF262626FFFFFFC99167FFFFFFFFFFFFFFFFFFFF
                            FFFFFFFFFFFFFFFFFFFFFFC99167FFFFFF262626FF00FFFF00FFFF00FF262626
                            FFFFFFC99167C99167C99167C99167C99167C99167C99167C99167C99167FFFF
                            FF262626FF00FFFF00FFFF00FF262626FFFFFFC99167FFFFFFFFFFFFFFFFFFFF
                            FFFFFFFFFFFFFFFFFFFFFFC99167FFFFFF262626FF00FFFF00FFFF00FF262626
                            FFFFFFC99167C99167C99167C99167C99167C99167C99167C99167C99167FFFF
                            FF262626FF00FFFF00FFFF00FF262626FFFFFFC99167FFFFFFFFFFFFFFFFFFFF
                            FFFFFFFFFFFFFFFFFFFFFFC99167FFFFFF262626FF00FFFF00FFFF00FF262626
                            FFFFFFC99167C99167C99167C99167C99167C99167C99167C99167C99167FFFF
                            FF262626FF00FFFF00FFFF00FF262626FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF262626FF00FFFF00FFFF00FF262626
                            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                            FF2D2D2DFF00FFFF00FFFF00FF262626FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                            FFFFFFFFFFFFFFFF2626262626262626262D2D2DFF00FFFF00FFFF00FF262626
                            FFFFFF818181FFFFFF4E4E4E8B8B8B9F9F9FFFFFFFFFFFFF262626FFFFFFFFFF
                            FF434343FF00FFFF00FFFF00FF262626FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                            FFFFFFFFFFFFFFFF262626C8C8C8434343FF00FFFF00FFFF00FFFF00FF2D2D2D
                            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2D2D2D434343FF00
                            FFFF00FFFF00FFFF00FFFF00FF6060602D2D2D26262626262626262626262626
                            2626262626262626262626FF00FFFF00FFFF00FFFF00FFFF00FF}
                        end
                      end
                      object DBGridNFE: TDBGrid
                        Left = 288
                        Top = 15
                        Width = 482
                        Height = 142
                        Align = alClient
                        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                        PopupMenu = PopupMenuNFE
                        TabOrder = 1
                        TitleFont.Charset = DEFAULT_CHARSET
                        TitleFont.Color = clWindowText
                        TitleFont.Height = -11
                        TitleFont.Name = 'Tahoma'
                        TitleFont.Style = []
                        OnColumnMoved = DBGridNFEColumnMoved
                        OnDrawColumnCell = DBGridHistNFDrawColumnCell
                        OnKeyDown = DBGridNFEKeyDown
                        OnTitleClick = DBGridNFETitleClick
                      end
                      object GroupBoxNFE: TGroupBox
                        Left = 2
                        Top = 15
                        Width = 286
                        Height = 142
                        Align = alLeft
                        Caption = 'Configura'#231#227'o das Colunas'
                        TabOrder = 2
                        Visible = False
                        object ScrollBoxNFE: TScrollBox
                          Left = 2
                          Top = 15
                          Width = 282
                          Height = 125
                          Align = alClient
                          BevelInner = bvNone
                          BevelOuter = bvNone
                          TabOrder = 0
                          OnEnter = ScrollBoxNFEEnter
                          OnExit = ScrollBoxNFEExit
                        end
                      end
                    end
                    object GroupBox9: TGroupBox
                      Left = 2
                      Top = 242
                      Width = 772
                      Height = 184
                      Align = alTop
                      Caption = 'Sa'#237'da'
                      TabOrder = 2
                      object Panel15: TPanel
                        Left = 2
                        Top = 156
                        Width = 768
                        Height = 26
                        Align = alBottom
                        BevelOuter = bvNone
                        TabOrder = 0
                        object Label39: TLabel
                          Left = 68
                          Top = 6
                          Width = 88
                          Height = 13
                          Caption = 'Nota Fiscal Aberta'
                        end
                        object Label24: TLabel
                          Left = 298
                          Top = 6
                          Width = 105
                          Height = 13
                          Caption = 'Nota Fiscal Cancelada'
                        end
                        object BitBtn29: TBitBtn
                          Left = 515
                          Top = 0
                          Width = 86
                          Height = 26
                          Hint = 'Visualizar Nota Fiscal- [NF0012]'
                          Align = alRight
                          Caption = '&Visualizar'
                          TabOrder = 1
                          OnClick = BitBtn29Click
                          Glyph.Data = {
                            36030000424D3603000000000000360000002800000010000000100000000100
                            18000000000000030000120B0000120B00000000000000000000FF00FF314B62
                            AC7D7EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                            FFFF00FFFF00FFFF00FF5084B20F6FE1325F8CB87E7AFF00FFFF00FFFF00FFFF
                            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF32A0FE37A1FF
                            106FE2325F8BB67D79FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                            FFFF00FFFF00FFFF00FFFF00FF37A4FE379FFF0E6DDE355F89BB7F79FF00FFFF
                            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                            37A4FE359EFF0F6FDE35608BA67B7FFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF38A5FE329DFF156DCE444F5BFF
                            00FF9C6B65AF887BAF887EAA8075FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                            FF00FFFF00FF3BABFFA1CAE7AD8679A98373E0CFB1FFFFDAFFFFDDFCF8CFCCB2
                            9FA1746BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC0917DFC
                            E9ACFFFFCCFFFFCFFFFFD0FFFFDEFFFFFAE3D3D1996965FF00FFFF00FFFF00FF
                            FF00FFFF00FFFF00FFFF00FFB08978FAD192FEF4C2FFFFD0FFFFDAFFFFF6FFFF
                            FCFFFFFCB69384FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB08978FEDA97ED
                            B478FBEEBBFFFFD3FFFFDCFFFFF4FFFFF4FFFFE2E9DDBCA67B73FF00FFFF00FF
                            FF00FFFF00FFFF00FFB18A78FFDE99E9A167F4D199FEFCCCFFFFD5FFFFDAFFFF
                            DCFFFFD7EFE6C5A97E75FF00FFFF00FFFF00FFFF00FFFF00FFAA7F73FAE0A4F0
                            B778EEBA7BF6DDA6FEFBCCFFFFD3FFFFD1FFFFD7D9C5A7A3756CFF00FFFF00FF
                            FF00FFFF00FFFF00FFFF00FFCEB293FFFEDDF4D1A5EEBA7BF2C78FF8E1ABFCF0
                            BAFCFACAA3776FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA1746BE1
                            D4D3FFFEEEF7CC8CF0B473F7C788FCE3A5C2A088A5776CFF00FFFF00FFFF00FF
                            FF00FFFF00FFFF00FFFF00FFFF00FF986865BA9587EAD7A4EAD59EE0C097A577
                            6CA5776CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                            00FFFF00FFA77E70A98073A4786EFF00FFFF00FFFF00FFFF00FF}
                        end
                        object BitBtn20: TBitBtn
                          Left = 601
                          Top = 0
                          Width = 81
                          Height = 26
                          Hint = 'Imprimir Nota Fiscal - [NF0020/NF0021]'
                          Align = alRight
                          Caption = '&Imprimir'
                          TabOrder = 2
                          OnClick = BitBtn20Click
                          Glyph.Data = {
                            42020000424D4202000000000000420000002800000010000000100000000100
                            10000300000000020000120B0000120B00000000000000000000007C0000E003
                            00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                            1F7C1F7C1F7C1F7C1F7C4B294B296C2D8D31AE35EF3DF03DCF39AD358C316B2D
                            4B291F7C1F7C1F7C1F7C9245DE7BFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
                            92451F7C1F7CB75D3146EF3DD65AFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F1963
                            EF3D3146B75D1042F75E734E6C2D5A6B5A6B5A6B5A6B5A6B5A6B5A6B5A6BF03D
                            734EF75E104210429452AE358610861086108610861086108610861086108610
                            AE35945210423146F75EAE358610861086108610861086108610861086108610
                            AE35F75E3146524ABD7795523246324632463246324632463246324632463246
                            9552BD77524A3146BD77F85ED85AD85AD85AD85AD85AD85AD85AD85AD85AD85A
                            F85EBD7731469A69524AB656D75AD75AD75AD75AD75AD75AD75AD75AD75AD75A
                            B656524A9A691F7C1F7C1F7CAD357B6FDE7BDE7BDE7BDE7BFF7FFF7F7B6FAD35
                            1F7C1F7C1F7C1F7C1F7C1F7CCE397B6FDE7BDE7BDE7BDE7BDE7BFF7F7B6FCE39
                            1F7C1F7C1F7C1F7C1F7C1F7CF03D7B6FDE7BDE7BDE7BDE7BDE7BDE7B7B6FF03D
                            1F7C1F7C1F7C1F7C1F7C1F7C1F7C7B6FDE7BDE7BDE7BDE7BDE7BDE7B7B6F1F7C
                            1F7C1F7C1F7C1F7C1F7C1F7C1F7C186339673967396739673967396718631F7C
                            1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                            1F7C1F7C1F7C}
                        end
                        object Panel22: TPanel
                          Left = 13
                          Top = 6
                          Width = 49
                          Height = 13
                          BevelOuter = bvNone
                          Caption = '0,00'
                          Color = clRed
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clRed
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = [fsBold]
                          ParentBackground = False
                          ParentFont = False
                          TabOrder = 4
                        end
                        object BitBtn33: TBitBtn
                          Left = 682
                          Top = 0
                          Width = 86
                          Height = 26
                          Hint = 'Cancelar Nota Fiscal - [NF0018/NF0026/NF0145]'
                          Align = alRight
                          Caption = '&Cancelar'
                          TabOrder = 3
                          OnClick = BitBtn33Click
                          Glyph.Data = {
                            36050000424D3605000000000000360400002800000010000000100000000100
                            08000000000000010000120B0000120B00000001000000000000000000000000
                            80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
                            A6000020400000206000002080000020A0000020C0000020E000004000000040
                            20000040400000406000004080000040A0000040C0000040E000006000000060
                            20000060400000606000006080000060A0000060C0000060E000008000000080
                            20000080400000806000008080000080A0000080C0000080E00000A0000000A0
                            200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
                            200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
                            200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
                            20004000400040006000400080004000A0004000C0004000E000402000004020
                            20004020400040206000402080004020A0004020C0004020E000404000004040
                            20004040400040406000404080004040A0004040C0004040E000406000004060
                            20004060400040606000406080004060A0004060C0004060E000408000004080
                            20004080400040806000408080004080A0004080C0004080E00040A0000040A0
                            200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
                            200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
                            200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
                            20008000400080006000800080008000A0008000C0008000E000802000008020
                            20008020400080206000802080008020A0008020C0008020E000804000008040
                            20008040400080406000804080008040A0008040C0008040E000806000008060
                            20008060400080606000806080008060A0008060C0008060E000808000008080
                            20008080400080806000808080008080A0008080C0008080E00080A0000080A0
                            200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
                            200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
                            200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
                            2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
                            2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
                            2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
                            2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
                            2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
                            2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
                            2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
                            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FDFDFDFDFDFD
                            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD0101FD
                            FDFDFDFDFD0101FDFDFDFDFD010F0F01FDFDFDFD01F9F901FDFDFDFD010F0F0E
                            01FDFD010FF9F901FDFDFDFDFD010F0F0F0101F9F90E01FDFDFDFDFDFDFD010F
                            0F0FF9F9F901FDFDFDFDFDFDFDFDFD010F0F0F0F01FDFDFDFDFDFDFDFDFDFD01
                            0F0F0F0F01FDFDFDFDFDFDFDFDFD01170F0F0F0F0F01FDFDFDFDFDFDFD010F17
                            1701010F0F0F01FDFDFDFDFD0117170E01FDFD010E0F0F01FDFDFDFD01171701
                            FDFDFDFD010F0F01FDFDFDFDFD0101FDFDFDFDFDFD0101FDFDFDFDFDFDFDFDFD
                            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD}
                        end
                        object Panel35: TPanel
                          Left = 243
                          Top = 6
                          Width = 49
                          Height = 13
                          BevelOuter = bvNone
                          Color = 39901
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clRed
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = [fsBold]
                          ParentBackground = False
                          ParentFont = False
                          TabOrder = 5
                        end
                        object BitBtn37: TBitBtn
                          Left = 429
                          Top = 0
                          Width = 86
                          Height = 26
                          Hint = 'Abrir Modulo de Nota Fiscal'
                          Align = alRight
                          Caption = '&Abrir'
                          TabOrder = 0
                          OnClick = BitBtn37Click
                          Glyph.Data = {
                            36030000424D3603000000000000360000002800000010000000100000000100
                            18000000000000030000C30E0000C30E00000000000000000000FF00FF606060
                            2D2D2D2626262626262626262626262626262626262626262626262626262626
                            265B5B5BFF00FFFF00FFFF00FF262626FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF262626FF00FFFF00FFFF00FF262626
                            FFFFFFC99167C99167C99167C99167C99167C99167C99167C99167C99167FFFF
                            FF262626FF00FFFF00FFFF00FF262626FFFFFFC99167FFFFFFFFFFFFFFFFFFFF
                            FFFFFFFFFFFFFFFFFFFFFFC99167FFFFFF262626FF00FFFF00FFFF00FF262626
                            FFFFFFC99167C99167C99167C99167C99167C99167C99167C99167C99167FFFF
                            FF262626FF00FFFF00FFFF00FF262626FFFFFFC99167FFFFFFFFFFFFFFFFFFFF
                            FFFFFFFFFFFFFFFFFFFFFFC99167FFFFFF262626FF00FFFF00FFFF00FF262626
                            FFFFFFC99167C99167C99167C99167C99167C99167C99167C99167C99167FFFF
                            FF262626FF00FFFF00FFFF00FF262626FFFFFFC99167FFFFFFFFFFFFFFFFFFFF
                            FFFFFFFFFFFFFFFFFFFFFFC99167FFFFFF262626FF00FFFF00FFFF00FF262626
                            FFFFFFC99167C99167C99167C99167C99167C99167C99167C99167C99167FFFF
                            FF262626FF00FFFF00FFFF00FF262626FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF262626FF00FFFF00FFFF00FF262626
                            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                            FF2D2D2DFF00FFFF00FFFF00FF262626FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                            FFFFFFFFFFFFFFFF2626262626262626262D2D2DFF00FFFF00FFFF00FF262626
                            FFFFFF818181FFFFFF4E4E4E8B8B8B9F9F9FFFFFFFFFFFFF262626FFFFFFFFFF
                            FF434343FF00FFFF00FFFF00FF262626FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                            FFFFFFFFFFFFFFFF262626C8C8C8434343FF00FFFF00FFFF00FFFF00FF2D2D2D
                            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2D2D2D434343FF00
                            FFFF00FFFF00FFFF00FFFF00FF6060602D2D2D26262626262626262626262626
                            2626262626262626262626FF00FFFF00FFFF00FFFF00FFFF00FF}
                        end
                      end
                      object DBGridNFS: TDBGrid
                        Left = 288
                        Top = 15
                        Width = 482
                        Height = 141
                        Align = alClient
                        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                        PopupMenu = PopupMenuNFS
                        TabOrder = 1
                        TitleFont.Charset = DEFAULT_CHARSET
                        TitleFont.Color = clWindowText
                        TitleFont.Height = -11
                        TitleFont.Name = 'Tahoma'
                        TitleFont.Style = []
                        OnColumnMoved = DBGridNFSColumnMoved
                        OnDrawColumnCell = DBGridHistNFDrawColumnCell
                        OnKeyDown = DBGridNFEKeyDown
                        OnTitleClick = DBGridNFSTitleClick
                      end
                      object GroupBoxNFS: TGroupBox
                        Left = 2
                        Top = 15
                        Width = 286
                        Height = 141
                        Align = alLeft
                        Caption = 'Configura'#231#227'o das Colunas'
                        TabOrder = 2
                        Visible = False
                        object ScrollBoxNFS: TScrollBox
                          Left = 2
                          Top = 15
                          Width = 282
                          Height = 124
                          Align = alClient
                          BevelInner = bvNone
                          BevelOuter = bvNone
                          TabOrder = 0
                          OnEnter = ScrollBoxNFSEnter
                          OnExit = ScrollBoxNFSExit
                        end
                      end
                    end
                    object Panel10: TPanel
                      Left = 2
                      Top = 15
                      Width = 772
                      Height = 42
                      Align = alTop
                      BevelOuter = bvNone
                      TabOrder = 0
                      object GroupBox20: TGroupBox
                        Left = 0
                        Top = 0
                        Width = 772
                        Height = 40
                        Align = alTop
                        Caption = 'Exibir'
                        TabOrder = 0
                        object rbNomeFantasia: TRadioButton
                          Left = 15
                          Top = 17
                          Width = 98
                          Height = 17
                          Caption = 'Nome Fantasia'
                          Checked = True
                          TabOrder = 0
                          TabStop = True
                          OnClick = rbNomeFantasiaClick
                        end
                        object rbRazaoSocial: TRadioButton
                          Left = 137
                          Top = 17
                          Width = 89
                          Height = 17
                          Caption = 'Raz'#227'o Social'
                          TabOrder = 1
                          OnClick = rbNomeFantasiaClick
                        end
                        object BitBtn120: TBitBtn
                          Left = 253
                          Top = 10
                          Width = 75
                          Height = 25
                          Caption = 'Excel'
                          TabOrder = 2
                          OnClick = BitBtn120Click
                          Glyph.Data = {
                            8E020000424D8E020000000000008E0100002800000010000000100000000100
                            08000000000000010000120B0000120B0000560000005600000000000000FFFF
                            FF00FF00FF00B8838400AA7F7A00AD827B00B1857C00B6897E00BA8D8000BF91
                            8300CA978400C4968500FFFCFB00C99B8700CD9E8A00CA8A6A00D1A38B00DDAC
                            9100D9AA8F00D6A78D00F7F0EC00D0987700DBA68500DFAF9200FDF7F200FBF1
                            E800FEF7F100FAF1E800FDF7F100FFFDFB00F8E8D600F9ECDE00FBF1E600EBB8
                            7A00F5DFC500F8E8D500F7E8D600FAEDDE00F9EDDF00FBF2E700F3AE5200E9B6
                            7600F4DBBB00F7DFBF00F4DCBC00F5E0C400F5E0C500F7E5CE00F6E4CD00FAEE
                            DF00F3D6AB00F4DAB300F2D7B200FDEDD500EADDCA00FDF0DD00FBF3E700FDF8
                            F000FCEBCE00FEF2DE00C7BFB000FFF7E800FEFDFB00FFFCF200FFFFFC00FFFF
                            FD00008400000385030004860400178F17001C911C00309B30003AA03A0061B3
                            610065B5650069B7690068B668007ABF7A007BBF7B0084C4840091CA9100C4E3
                            C400CAE5CA00F2F9F200FBFDFB00FAFAFE000202020202424242424242424242
                            424204030303034201010101010101010142053A2B3332420101010101010101
                            01420635222A344201504247544F424C0142073B2F2E2C420101514446424F01
                            0142083D1E302D420101014B424554010142093F2624304201014D424A444853
                            01420B401B1F23420149424E0152434801420D01181931420101010101010101
                            01420E010C1A2742010101010101010101421001011D1C424242424242424242
                            4242130101011D1C202537363C030202020212010101013E3938030303030202
                            020211010101010141140329280F020202021701010101010155032115020202
                            02021616161616161616030A020202020202}
                        end
                      end
                    end
                  end
                end
              end
              object TabSheet_Contratos: TTabSheet
                Caption = 'Contratos/Comando'
                ImageIndex = 7
                object ScrollBox6: TScrollBox
                  Left = 0
                  Top = 0
                  Width = 780
                  Height = 457
                  Align = alClient
                  BevelInner = bvNone
                  BevelOuter = bvNone
                  TabOrder = 0
                  object GroupBox5: TGroupBox
                    Left = 0
                    Top = 0
                    Width = 776
                    Height = 453
                    Align = alTop
                    Caption = 'Contratos'
                    TabOrder = 0
                    object BitBtn13: TBitBtn
                      Left = 572
                      Top = 391
                      Width = 86
                      Height = 25
                      Caption = 'V&isualizar'
                      TabOrder = 1
                      OnClick = BitBtn4Click
                      Glyph.Data = {
                        16030000424D1603000000000000160200002800000010000000100000000100
                        08000000000000010000120B0000120B0000780000007800000000000000FFFF
                        FF00807AA100FF00FF00B6919300A4908C00F4F0EF00E7CABC00D4805100D991
                        6800E0A58400D9834F00E1966600DA926800DA976D00DEAB8B00C5B4AA00E39F
                        7300E6A47800EAAC8100E9BC9F00EFD0BC00F7E0D000F0995B00E69D6900F2C0
                        9800F3CCAD00EFC9AB00FEE5D000FFF3E900FFFAF600FBF6F200FCC08B00E9D4
                        C200FAE5D300FFD1A300F8D5B400FEF4EA00E1D8CF00DAD5D000FEFCFA00AB75
                        3D00FCE2C500FCE6CF00FFEAD400FAD3A300FFFAF400FFD7A500FEE6C700CAB7
                        9E00F3EDE500FEFBF700FEF3E300D3CBC000B5B0A900FFFAF300FFDDA700FFDD
                        A100FFEAC600FFF6E600D5CEC000EAE9E700FFFAEB00FFFEFB00B4B4B100FEFE
                        FC00EDEDEB00FFFFFE00BABBB800C2C4C1006EB4590062D18800186F7500CEE2
                        F8001A6AC7009DCAFF00A7CFFF00ADD3FF00C0D5EE00D8EAFF003289FF002A68
                        B8004D99FF00569EFF00589FFF005BA0FE005C96E5005F98E30080B7FF00A1C7
                        F700A6C5EF001673FF001676FF00287FFF00398AFF005D8CD1001873FF001974
                        FF001B75FF001C76FF002378FA002D75E9002A69D100317BEB0099B6E3000F59
                        E100135DE0001864E3001E60D8003767BF005F8BD7009EA7B7001A57CA002358
                        C2001344B400D5D7DC00093BC200415B9F001F42EF00E0E0E000030303030303
                        0303030303030303030303030303030303030303030303030303030303030303
                        69706D7572030303030303030303675F6F100F1705710303030303035C572D2F
                        3823120B20216E6C0303030351313A302A1B0D18242C3E5A6503036329392534
                        221408132B1D1E01686A034A463B2E37160A0C1A362741430466034847013F33
                        1509111C32444506026403744E010128070E19261F013D5964036B76014F4C58
                        50567335407701535B03625E525403030303614B423C495D0303030303030303
                        03030303614D5560030303030303030303030303030361030303030303030303
                        0303030303030303030303030303030303030303030303030303}
                    end
                    object BitBtn16: TBitBtn
                      Left = 662
                      Top = 391
                      Width = 81
                      Height = 25
                      Caption = 'I&mprimir'
                      TabOrder = 2
                      OnClick = BitBtn4Click
                      Glyph.Data = {
                        42020000424D4202000000000000420000002800000010000000100000000100
                        10000300000000020000120B0000120B00000000000000000000007C0000E003
                        00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                        1F7C1F7C1F7C1F7C1F7C4B294B296C2D8D31AE35EF3DF03DCF39AD358C316B2D
                        4B291F7C1F7C1F7C1F7C9245DE7BFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
                        92451F7C1F7CB75D3146EF3DD65AFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F1963
                        EF3D3146B75D1042F75E734E6C2D5A6B5A6B5A6B5A6B5A6B5A6B5A6B5A6BF03D
                        734EF75E104210429452AE358610861086108610861086108610861086108610
                        AE35945210423146F75EAE358610861086108610861086108610861086108610
                        AE35F75E3146524ABD7795523246324632463246324632463246324632463246
                        9552BD77524A3146BD77F85ED85AD85AD85AD85AD85AD85AD85AD85AD85AD85A
                        F85EBD7731469A69524AB656D75AD75AD75AD75AD75AD75AD75AD75AD75AD75A
                        B656524A9A691F7C1F7C1F7CAD357B6FDE7BDE7BDE7BDE7BFF7FFF7F7B6FAD35
                        1F7C1F7C1F7C1F7C1F7C1F7CCE397B6FDE7BDE7BDE7BDE7BDE7BFF7F7B6FCE39
                        1F7C1F7C1F7C1F7C1F7C1F7CF03D7B6FDE7BDE7BDE7BDE7BDE7BDE7B7B6FF03D
                        1F7C1F7C1F7C1F7C1F7C1F7C1F7C7B6FDE7BDE7BDE7BDE7BDE7BDE7B7B6F1F7C
                        1F7C1F7C1F7C1F7C1F7C1F7C1F7C186339673967396739673967396718631F7C
                        1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                        1F7C1F7C1F7C}
                    end
                    object GroupBox10: TGroupBox
                      Left = 2
                      Top = 57
                      Width = 772
                      Height = 195
                      Align = alTop
                      Caption = 'Entrada'
                      TabOrder = 3
                      object Panel5: TPanel
                        Left = 2
                        Top = 167
                        Width = 768
                        Height = 26
                        Align = alBottom
                        BevelOuter = bvNone
                        TabOrder = 0
                        object Label41: TLabel
                          Left = 48
                          Top = 6
                          Width = 107
                          Height = 13
                          Caption = 'Documento em Aberto'
                        end
                        object Label35: TLabel
                          Left = 217
                          Top = 6
                          Width = 107
                          Height = 13
                          Caption = 'Documento Cancelado'
                        end
                        object Label48: TLabel
                          Left = 387
                          Top = 6
                          Width = 119
                          Height = 13
                          Caption = 'Pend'#234'ncia de Nota Fiscal'
                        end
                        object BitBtn21: TBitBtn
                          Left = 601
                          Top = 0
                          Width = 86
                          Height = 26
                          Hint = 'Visualizar - [VEI042/VEI043/VEI044/VEI045/VEI046/VEI047/VEI048]'
                          Align = alRight
                          Caption = '&Visualizar'
                          TabOrder = 1
                          OnClick = BitBtn21Click
                          Glyph.Data = {
                            36030000424D3603000000000000360000002800000010000000100000000100
                            18000000000000030000120B0000120B00000000000000000000FF00FF314B62
                            AC7D7EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                            FFFF00FFFF00FFFF00FF5084B20F6FE1325F8CB87E7AFF00FFFF00FFFF00FFFF
                            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF32A0FE37A1FF
                            106FE2325F8BB67D79FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                            FFFF00FFFF00FFFF00FFFF00FF37A4FE379FFF0E6DDE355F89BB7F79FF00FFFF
                            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                            37A4FE359EFF0F6FDE35608BA67B7FFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF38A5FE329DFF156DCE444F5BFF
                            00FF9C6B65AF887BAF887EAA8075FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                            FF00FFFF00FF3BABFFA1CAE7AD8679A98373E0CFB1FFFFDAFFFFDDFCF8CFCCB2
                            9FA1746BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC0917DFC
                            E9ACFFFFCCFFFFCFFFFFD0FFFFDEFFFFFAE3D3D1996965FF00FFFF00FFFF00FF
                            FF00FFFF00FFFF00FFFF00FFB08978FAD192FEF4C2FFFFD0FFFFDAFFFFF6FFFF
                            FCFFFFFCB69384FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB08978FEDA97ED
                            B478FBEEBBFFFFD3FFFFDCFFFFF4FFFFF4FFFFE2E9DDBCA67B73FF00FFFF00FF
                            FF00FFFF00FFFF00FFB18A78FFDE99E9A167F4D199FEFCCCFFFFD5FFFFDAFFFF
                            DCFFFFD7EFE6C5A97E75FF00FFFF00FFFF00FFFF00FFFF00FFAA7F73FAE0A4F0
                            B778EEBA7BF6DDA6FEFBCCFFFFD3FFFFD1FFFFD7D9C5A7A3756CFF00FFFF00FF
                            FF00FFFF00FFFF00FFFF00FFCEB293FFFEDDF4D1A5EEBA7BF2C78FF8E1ABFCF0
                            BAFCFACAA3776FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA1746BE1
                            D4D3FFFEEEF7CC8CF0B473F7C788FCE3A5C2A088A5776CFF00FFFF00FFFF00FF
                            FF00FFFF00FFFF00FFFF00FFFF00FF986865BA9587EAD7A4EAD59EE0C097A577
                            6CA5776CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                            00FFFF00FFA77E70A98073A4786EFF00FFFF00FFFF00FFFF00FF}
                        end
                        object BitBtn22: TBitBtn
                          Left = 687
                          Top = 0
                          Width = 81
                          Height = 26
                          Hint = 'Imprimir - [VEI072/VEI073/VEI074/VEI075/VEI076/VEI077/VEI078]'
                          Align = alRight
                          Caption = '&Imprimir'
                          TabOrder = 2
                          OnClick = BitBtn22Click
                          Glyph.Data = {
                            42020000424D4202000000000000420000002800000010000000100000000100
                            10000300000000020000120B0000120B00000000000000000000007C0000E003
                            00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                            1F7C1F7C1F7C1F7C1F7C4B294B296C2D8D31AE35EF3DF03DCF39AD358C316B2D
                            4B291F7C1F7C1F7C1F7C9245DE7BFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
                            92451F7C1F7CB75D3146EF3DD65AFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F1963
                            EF3D3146B75D1042F75E734E6C2D5A6B5A6B5A6B5A6B5A6B5A6B5A6B5A6BF03D
                            734EF75E104210429452AE358610861086108610861086108610861086108610
                            AE35945210423146F75EAE358610861086108610861086108610861086108610
                            AE35F75E3146524ABD7795523246324632463246324632463246324632463246
                            9552BD77524A3146BD77F85ED85AD85AD85AD85AD85AD85AD85AD85AD85AD85A
                            F85EBD7731469A69524AB656D75AD75AD75AD75AD75AD75AD75AD75AD75AD75A
                            B656524A9A691F7C1F7C1F7CAD357B6FDE7BDE7BDE7BDE7BFF7FFF7F7B6FAD35
                            1F7C1F7C1F7C1F7C1F7C1F7CCE397B6FDE7BDE7BDE7BDE7BDE7BFF7F7B6FCE39
                            1F7C1F7C1F7C1F7C1F7C1F7CF03D7B6FDE7BDE7BDE7BDE7BDE7BDE7B7B6FF03D
                            1F7C1F7C1F7C1F7C1F7C1F7C1F7C7B6FDE7BDE7BDE7BDE7BDE7BDE7B7B6F1F7C
                            1F7C1F7C1F7C1F7C1F7C1F7C1F7C186339673967396739673967396718631F7C
                            1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                            1F7C1F7C1F7C}
                        end
                        object Panel24: TPanel
                          Left = 2
                          Top = 6
                          Width = 40
                          Height = 13
                          BevelOuter = bvNone
                          Color = clMenuHighlight
                          Font.Charset = CHINESEBIG5_CHARSET
                          Font.Color = clRed
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = [fsBold]
                          ParentBackground = False
                          ParentFont = False
                          TabOrder = 3
                        end
                        object Panel19: TPanel
                          Left = 172
                          Top = 6
                          Width = 40
                          Height = 13
                          BevelOuter = bvNone
                          Color = 39901
                          Font.Charset = CHINESEBIG5_CHARSET
                          Font.Color = clRed
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = [fsBold]
                          ParentBackground = False
                          ParentFont = False
                          TabOrder = 4
                        end
                        object Panel38: TPanel
                          Left = 340
                          Top = 6
                          Width = 40
                          Height = 13
                          BevelOuter = bvNone
                          Caption = '0,00'
                          Color = clRed
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clRed
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = [fsBold]
                          ParentBackground = False
                          ParentFont = False
                          TabOrder = 5
                        end
                        object BitBtn38: TBitBtn
                          Left = 515
                          Top = 0
                          Width = 86
                          Height = 26
                          Hint = 'Abrir Modulo de Contratos'
                          Align = alRight
                          Caption = '&Abrir'
                          TabOrder = 0
                          OnClick = BitBtn38Click
                          Glyph.Data = {
                            36030000424D3603000000000000360000002800000010000000100000000100
                            18000000000000030000C30E0000C30E00000000000000000000FF00FFFF00FF
                            FF00FFFF00FFFF00FFFF00FFB9D3E383BFE567B5E759B0E757B0E75FB3E775BA
                            E69EC9E4FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA9D1E99BD0F1C5
                            E3F7C1E1F6C0E0F6BEDEF4BBDFF4B8DCF4B3DAF469B7E9FF00FFFF00FFFF00FF
                            FF00FFFF00FFFF00FFCDE4F27BC1ED53AEE756AFE85BB1E76FB8E674BAE66BB7
                            E657AFE79DD1F0FF00FFFF00FFFF00FFC39567B2773DD3BFAAFF00FF79BBE6B5
                            D1E3FF00FFFF00FFAECFE3AACDE3B5D1E3FF00FFFF00FFFF00FFFF00FFFF00FF
                            B2773DB2773DB37A42FF00FFFF00FF69B5E670BBEA97CCEFABD6F2ADD9F3A4D4
                            F189C6EE5BB1E7A4CBE4B3783EFFFFFFC39568B2773DC39568FF00FFB7D9EEC8
                            E5F7A9D6F280C3ED6BB9EA65B5E96EB9EA86C6EEB0D9F4A0D2F0B3783EC39568
                            FFFFFFFFFFFFFFFFFFD7CABCCDE0EC50ADE757B0E85BB1E85CB2E85DB2E85CB2
                            E85BB1E856B0E86EB9E8B3783EB3783EB3783EB3783EB3783ECFB9A2FF00FFFF
                            00FF91C6E773BBE865B5E862B4E86AB7E881BFE8A8CEE6FF00FFB3783EB3783E
                            B3783EB3783EB3783EC9AB8EB98654CDB39AFF00FFFF00FFFF00FFFF00FFFF00
                            FFFF00FFD3C2B2FF00FFB3783EB3783EB3783EB3783EB3783EC9AB8EB3783EB3
                            783EB3783EB47B43B88451B98655B6804BB3783EB3783EFF00FFB3783EFFFFFF
                            FFFFFFFFFFFFB3793FC9AB8EB3783EB3783EB3783EB3783EB3783EB3783EB378
                            3EB3783EB3783EFF00FFB3783EC4966AFFFFFFFFFFFFB3793FC9AB8EB3783EB3
                            783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EFF00FFFF00FFB2773D
                            FFFFFFFFFFFFB3793FC9AC8FB3783EB3783EB3783EB3783EB3783EB3783EB378
                            3EB3783EB3783EFF00FFFF00FFC5A27FB3783EB3783EB3783EFF00FFB3783EB3
                            783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EFF00FFFF00FFFF00FF
                            FF00FFFF00FFFF00FFFF00FFB3783EB3783EB3783EB3783EB3783EB3783EB378
                            3EB3783EB3783EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC5A27FB3
                            783EB3783EB3783EB3783EB3783EB3783EB3783EC5A27FFF00FF}
                        end
                      end
                      object DBGridCTRE: TDBGrid
                        Left = 288
                        Top = 15
                        Width = 482
                        Height = 152
                        Align = alClient
                        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                        PopupMenu = PopupMenuCTRE
                        TabOrder = 1
                        TitleFont.Charset = DEFAULT_CHARSET
                        TitleFont.Color = clWindowText
                        TitleFont.Height = -11
                        TitleFont.Name = 'Tahoma'
                        TitleFont.Style = []
                        OnColumnMoved = DBGridCTREColumnMoved
                        OnDrawColumnCell = DBGridHistCTRDrawColumnCell
                        OnKeyDown = DBGridNFEKeyDown
                        OnTitleClick = DBGridCTRETitleClick
                      end
                      object GroupBoxCTRE: TGroupBox
                        Left = 2
                        Top = 15
                        Width = 286
                        Height = 152
                        Align = alLeft
                        Caption = 'Configura'#231#227'o das Colunas'
                        TabOrder = 2
                        Visible = False
                        object ScrollBoxCTRE: TScrollBox
                          Left = 2
                          Top = 15
                          Width = 282
                          Height = 135
                          Align = alClient
                          BevelInner = bvNone
                          BevelOuter = bvNone
                          TabOrder = 0
                          OnEnter = ScrollBoxCTREEnter
                          OnExit = ScrollBoxCTREExit
                        end
                      end
                    end
                    object GroupBox11: TGroupBox
                      Left = 2
                      Top = 252
                      Width = 772
                      Height = 199
                      Align = alClient
                      Caption = 'Sa'#237'da'
                      TabOrder = 4
                      object DBGridCTRS: TDBGrid
                        Left = 288
                        Top = 15
                        Width = 482
                        Height = 156
                        Align = alClient
                        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                        PopupMenu = PopupMenuCTRS
                        TabOrder = 0
                        TitleFont.Charset = DEFAULT_CHARSET
                        TitleFont.Color = clWindowText
                        TitleFont.Height = -11
                        TitleFont.Name = 'Tahoma'
                        TitleFont.Style = []
                        OnColumnMoved = DBGridCTRSColumnMoved
                        OnDrawColumnCell = DBGridHistCTRDrawColumnCell
                        OnKeyDown = DBGridNFEKeyDown
                        OnTitleClick = DBGridCTRSTitleClick
                      end
                      object Panel14: TPanel
                        Left = 2
                        Top = 171
                        Width = 768
                        Height = 26
                        Align = alBottom
                        BevelOuter = bvNone
                        TabOrder = 1
                        object Label36: TLabel
                          Left = 48
                          Top = 6
                          Width = 107
                          Height = 13
                          Caption = 'Documento em Aberto'
                        end
                        object Label42: TLabel
                          Left = 217
                          Top = 6
                          Width = 107
                          Height = 13
                          Caption = 'Documento Cancelado'
                        end
                        object Label56: TLabel
                          Left = 387
                          Top = 6
                          Width = 119
                          Height = 13
                          Caption = 'Pend'#234'ncia de Nota Fiscal'
                        end
                        object BitBtn23: TBitBtn
                          Left = 601
                          Top = 0
                          Width = 86
                          Height = 26
                          Hint = 'Visualizar - [VEI042/VEI043/VEI044/VEI045/VEI046/VEI047/VEI048]'
                          Align = alRight
                          Caption = '&Visualizar'
                          TabOrder = 1
                          OnClick = BitBtn23Click
                          Glyph.Data = {
                            36030000424D3603000000000000360000002800000010000000100000000100
                            18000000000000030000120B0000120B00000000000000000000FF00FF314B62
                            AC7D7EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                            FFFF00FFFF00FFFF00FF5084B20F6FE1325F8CB87E7AFF00FFFF00FFFF00FFFF
                            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF32A0FE37A1FF
                            106FE2325F8BB67D79FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                            FFFF00FFFF00FFFF00FFFF00FF37A4FE379FFF0E6DDE355F89BB7F79FF00FFFF
                            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                            37A4FE359EFF0F6FDE35608BA67B7FFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF38A5FE329DFF156DCE444F5BFF
                            00FF9C6B65AF887BAF887EAA8075FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                            FF00FFFF00FF3BABFFA1CAE7AD8679A98373E0CFB1FFFFDAFFFFDDFCF8CFCCB2
                            9FA1746BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC0917DFC
                            E9ACFFFFCCFFFFCFFFFFD0FFFFDEFFFFFAE3D3D1996965FF00FFFF00FFFF00FF
                            FF00FFFF00FFFF00FFFF00FFB08978FAD192FEF4C2FFFFD0FFFFDAFFFFF6FFFF
                            FCFFFFFCB69384FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB08978FEDA97ED
                            B478FBEEBBFFFFD3FFFFDCFFFFF4FFFFF4FFFFE2E9DDBCA67B73FF00FFFF00FF
                            FF00FFFF00FFFF00FFB18A78FFDE99E9A167F4D199FEFCCCFFFFD5FFFFDAFFFF
                            DCFFFFD7EFE6C5A97E75FF00FFFF00FFFF00FFFF00FFFF00FFAA7F73FAE0A4F0
                            B778EEBA7BF6DDA6FEFBCCFFFFD3FFFFD1FFFFD7D9C5A7A3756CFF00FFFF00FF
                            FF00FFFF00FFFF00FFFF00FFCEB293FFFEDDF4D1A5EEBA7BF2C78FF8E1ABFCF0
                            BAFCFACAA3776FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA1746BE1
                            D4D3FFFEEEF7CC8CF0B473F7C788FCE3A5C2A088A5776CFF00FFFF00FFFF00FF
                            FF00FFFF00FFFF00FFFF00FFFF00FF986865BA9587EAD7A4EAD59EE0C097A577
                            6CA5776CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                            00FFFF00FFA77E70A98073A4786EFF00FFFF00FFFF00FFFF00FF}
                        end
                        object BitBtn24: TBitBtn
                          Left = 687
                          Top = 0
                          Width = 81
                          Height = 26
                          Hint = 'Imprimir - [VEI072/VEI073/VEI074/VEI075/VEI076/VEI077/VEI078]'
                          Align = alRight
                          Caption = '&Imprimir'
                          TabOrder = 2
                          OnClick = BitBtn24Click
                          Glyph.Data = {
                            42020000424D4202000000000000420000002800000010000000100000000100
                            10000300000000020000120B0000120B00000000000000000000007C0000E003
                            00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                            1F7C1F7C1F7C1F7C1F7C4B294B296C2D8D31AE35EF3DF03DCF39AD358C316B2D
                            4B291F7C1F7C1F7C1F7C9245DE7BFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
                            92451F7C1F7CB75D3146EF3DD65AFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F1963
                            EF3D3146B75D1042F75E734E6C2D5A6B5A6B5A6B5A6B5A6B5A6B5A6B5A6BF03D
                            734EF75E104210429452AE358610861086108610861086108610861086108610
                            AE35945210423146F75EAE358610861086108610861086108610861086108610
                            AE35F75E3146524ABD7795523246324632463246324632463246324632463246
                            9552BD77524A3146BD77F85ED85AD85AD85AD85AD85AD85AD85AD85AD85AD85A
                            F85EBD7731469A69524AB656D75AD75AD75AD75AD75AD75AD75AD75AD75AD75A
                            B656524A9A691F7C1F7C1F7CAD357B6FDE7BDE7BDE7BDE7BFF7FFF7F7B6FAD35
                            1F7C1F7C1F7C1F7C1F7C1F7CCE397B6FDE7BDE7BDE7BDE7BDE7BFF7F7B6FCE39
                            1F7C1F7C1F7C1F7C1F7C1F7CF03D7B6FDE7BDE7BDE7BDE7BDE7BDE7B7B6FF03D
                            1F7C1F7C1F7C1F7C1F7C1F7C1F7C7B6FDE7BDE7BDE7BDE7BDE7BDE7B7B6F1F7C
                            1F7C1F7C1F7C1F7C1F7C1F7C1F7C186339673967396739673967396718631F7C
                            1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                            1F7C1F7C1F7C}
                        end
                        object Panel20: TPanel
                          Left = 2
                          Top = 6
                          Width = 40
                          Height = 13
                          BevelOuter = bvNone
                          Color = clMenuHighlight
                          Font.Charset = CHINESEBIG5_CHARSET
                          Font.Color = clRed
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = [fsBold]
                          ParentBackground = False
                          ParentFont = False
                          TabOrder = 3
                        end
                        object Panel25: TPanel
                          Left = 172
                          Top = 6
                          Width = 40
                          Height = 13
                          BevelOuter = bvNone
                          Color = 39901
                          Font.Charset = CHINESEBIG5_CHARSET
                          Font.Color = clRed
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = [fsBold]
                          ParentBackground = False
                          ParentFont = False
                          TabOrder = 4
                        end
                        object Panel39: TPanel
                          Left = 340
                          Top = 6
                          Width = 40
                          Height = 13
                          BevelOuter = bvNone
                          Caption = '0,00'
                          Color = clRed
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clRed
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = [fsBold]
                          ParentBackground = False
                          ParentFont = False
                          TabOrder = 5
                        end
                        object BitBtn39: TBitBtn
                          Left = 515
                          Top = 0
                          Width = 86
                          Height = 26
                          Hint = 'Abrir Modulo de Contrato/Comando'
                          Align = alRight
                          Caption = '&Abrir'
                          TabOrder = 0
                          OnClick = BitBtn39Click
                          Glyph.Data = {
                            36030000424D3603000000000000360000002800000010000000100000000100
                            18000000000000030000C30E0000C30E00000000000000000000FF00FFFF00FF
                            FF00FFFF00FFFF00FFFF00FFB9D3E383BFE567B5E759B0E757B0E75FB3E775BA
                            E69EC9E4FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA9D1E99BD0F1C5
                            E3F7C1E1F6C0E0F6BEDEF4BBDFF4B8DCF4B3DAF469B7E9FF00FFFF00FFFF00FF
                            FF00FFFF00FFFF00FFCDE4F27BC1ED53AEE756AFE85BB1E76FB8E674BAE66BB7
                            E657AFE79DD1F0FF00FFFF00FFFF00FFC39567B2773DD3BFAAFF00FF79BBE6B5
                            D1E3FF00FFFF00FFAECFE3AACDE3B5D1E3FF00FFFF00FFFF00FFFF00FFFF00FF
                            B2773DB2773DB37A42FF00FFFF00FF69B5E670BBEA97CCEFABD6F2ADD9F3A4D4
                            F189C6EE5BB1E7A4CBE4B3783EFFFFFFC39568B2773DC39568FF00FFB7D9EEC8
                            E5F7A9D6F280C3ED6BB9EA65B5E96EB9EA86C6EEB0D9F4A0D2F0B3783EC39568
                            FFFFFFFFFFFFFFFFFFD7CABCCDE0EC50ADE757B0E85BB1E85CB2E85DB2E85CB2
                            E85BB1E856B0E86EB9E8B3783EB3783EB3783EB3783EB3783ECFB9A2FF00FFFF
                            00FF91C6E773BBE865B5E862B4E86AB7E881BFE8A8CEE6FF00FFB3783EB3783E
                            B3783EB3783EB3783EC9AB8EB98654CDB39AFF00FFFF00FFFF00FFFF00FFFF00
                            FFFF00FFD3C2B2FF00FFB3783EB3783EB3783EB3783EB3783EC9AB8EB3783EB3
                            783EB3783EB47B43B88451B98655B6804BB3783EB3783EFF00FFB3783EFFFFFF
                            FFFFFFFFFFFFB3793FC9AB8EB3783EB3783EB3783EB3783EB3783EB3783EB378
                            3EB3783EB3783EFF00FFB3783EC4966AFFFFFFFFFFFFB3793FC9AB8EB3783EB3
                            783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EFF00FFFF00FFB2773D
                            FFFFFFFFFFFFB3793FC9AC8FB3783EB3783EB3783EB3783EB3783EB3783EB378
                            3EB3783EB3783EFF00FFFF00FFC5A27FB3783EB3783EB3783EFF00FFB3783EB3
                            783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EFF00FFFF00FFFF00FF
                            FF00FFFF00FFFF00FFFF00FFB3783EB3783EB3783EB3783EB3783EB3783EB378
                            3EB3783EB3783EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC5A27FB3
                            783EB3783EB3783EB3783EB3783EB3783EB3783EC5A27FFF00FF}
                        end
                      end
                      object GroupBoxCTRS: TGroupBox
                        Left = 2
                        Top = 15
                        Width = 286
                        Height = 156
                        Align = alLeft
                        Caption = 'Configura'#231#227'o das Colunas'
                        TabOrder = 2
                        Visible = False
                        object ScrollBoxCTRS: TScrollBox
                          Left = 2
                          Top = 15
                          Width = 282
                          Height = 139
                          Align = alClient
                          BevelInner = bvNone
                          BevelOuter = bvNone
                          TabOrder = 0
                          OnEnter = ScrollBoxCTRSEnter
                          OnExit = ScrollBoxCTRSExit
                        end
                      end
                    end
                    object Panel17: TPanel
                      Left = 2
                      Top = 15
                      Width = 772
                      Height = 42
                      Align = alTop
                      BevelOuter = bvNone
                      TabOrder = 0
                    end
                  end
                end
              end
              object TabSheet_Oficina: TTabSheet
                Caption = 'Or'#231'amento/Oficina'
                ImageIndex = 6
                object ScrollBox10: TScrollBox
                  Left = 0
                  Top = 0
                  Width = 780
                  Height = 457
                  Align = alClient
                  BevelInner = bvNone
                  BevelOuter = bvNone
                  TabOrder = 0
                  object GroupBox6: TGroupBox
                    Left = 0
                    Top = 0
                    Width = 776
                    Height = 453
                    Align = alTop
                    Caption = 'Or'#231'amento/Oficina'
                    TabOrder = 0
                    object Panel18: TPanel
                      Left = 2
                      Top = 15
                      Width = 772
                      Height = 42
                      Align = alTop
                      BevelOuter = bvNone
                      TabOrder = 0
                    end
                    object GroupBox27: TGroupBox
                      Left = 2
                      Top = 57
                      Width = 772
                      Height = 195
                      Align = alTop
                      Caption = 'Or'#231'amento'
                      TabOrder = 1
                      object DBGridOrcamento: TDBGrid
                        Left = 288
                        Top = 15
                        Width = 482
                        Height = 152
                        Align = alClient
                        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                        PopupMenu = PopupMenuORC
                        TabOrder = 0
                        TitleFont.Charset = DEFAULT_CHARSET
                        TitleFont.Color = clWindowText
                        TitleFont.Height = -11
                        TitleFont.Name = 'Tahoma'
                        TitleFont.Style = []
                        OnColumnMoved = DBGridOrcamentoColumnMoved
                        OnDrawColumnCell = DBGridOrcamentoDrawColumnCell
                        OnKeyDown = DBGridNFEKeyDown
                        OnTitleClick = DBGridOficinaTitleClick
                      end
                      object Panel32: TPanel
                        Left = 2
                        Top = 167
                        Width = 768
                        Height = 26
                        Align = alBottom
                        BevelOuter = bvNone
                        TabOrder = 1
                        object Label31: TLabel
                          Left = 332
                          Top = 6
                          Width = 106
                          Height = 13
                          Caption = 'Or'#231'amento Cancelada'
                        end
                        object BitBtn17: TBitBtn
                          Left = 601
                          Top = 0
                          Width = 86
                          Height = 26
                          Hint = 'Visualizar - [VND008]'
                          Align = alRight
                          Caption = '&Visualizar'
                          TabOrder = 1
                          OnClick = BitBtn17Click
                          Glyph.Data = {
                            36030000424D3603000000000000360000002800000010000000100000000100
                            18000000000000030000120B0000120B00000000000000000000FF00FF314B62
                            AC7D7EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                            FFFF00FFFF00FFFF00FF5084B20F6FE1325F8CB87E7AFF00FFFF00FFFF00FFFF
                            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF32A0FE37A1FF
                            106FE2325F8BB67D79FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                            FFFF00FFFF00FFFF00FFFF00FF37A4FE379FFF0E6DDE355F89BB7F79FF00FFFF
                            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                            37A4FE359EFF0F6FDE35608BA67B7FFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF38A5FE329DFF156DCE444F5BFF
                            00FF9C6B65AF887BAF887EAA8075FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                            FF00FFFF00FF3BABFFA1CAE7AD8679A98373E0CFB1FFFFDAFFFFDDFCF8CFCCB2
                            9FA1746BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC0917DFC
                            E9ACFFFFCCFFFFCFFFFFD0FFFFDEFFFFFAE3D3D1996965FF00FFFF00FFFF00FF
                            FF00FFFF00FFFF00FFFF00FFB08978FAD192FEF4C2FFFFD0FFFFDAFFFFF6FFFF
                            FCFFFFFCB69384FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB08978FEDA97ED
                            B478FBEEBBFFFFD3FFFFDCFFFFF4FFFFF4FFFFE2E9DDBCA67B73FF00FFFF00FF
                            FF00FFFF00FFFF00FFB18A78FFDE99E9A167F4D199FEFCCCFFFFD5FFFFDAFFFF
                            DCFFFFD7EFE6C5A97E75FF00FFFF00FFFF00FFFF00FFFF00FFAA7F73FAE0A4F0
                            B778EEBA7BF6DDA6FEFBCCFFFFD3FFFFD1FFFFD7D9C5A7A3756CFF00FFFF00FF
                            FF00FFFF00FFFF00FFFF00FFCEB293FFFEDDF4D1A5EEBA7BF2C78FF8E1ABFCF0
                            BAFCFACAA3776FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA1746BE1
                            D4D3FFFEEEF7CC8CF0B473F7C788FCE3A5C2A088A5776CFF00FFFF00FFFF00FF
                            FF00FFFF00FFFF00FFFF00FFFF00FF986865BA9587EAD7A4EAD59EE0C097A577
                            6CA5776CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                            00FFFF00FFA77E70A98073A4786EFF00FFFF00FFFF00FFFF00FF}
                        end
                        object BitBtn18: TBitBtn
                          Left = 687
                          Top = 0
                          Width = 81
                          Height = 26
                          Hint = 'Imprimir - [VND056]'
                          Align = alRight
                          Caption = '&Imprimir'
                          TabOrder = 2
                          OnClick = BitBtn18Click
                          Glyph.Data = {
                            42020000424D4202000000000000420000002800000010000000100000000100
                            10000300000000020000120B0000120B00000000000000000000007C0000E003
                            00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                            1F7C1F7C1F7C1F7C1F7C4B294B296C2D8D31AE35EF3DF03DCF39AD358C316B2D
                            4B291F7C1F7C1F7C1F7C9245DE7BFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
                            92451F7C1F7CB75D3146EF3DD65AFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F1963
                            EF3D3146B75D1042F75E734E6C2D5A6B5A6B5A6B5A6B5A6B5A6B5A6B5A6BF03D
                            734EF75E104210429452AE358610861086108610861086108610861086108610
                            AE35945210423146F75EAE358610861086108610861086108610861086108610
                            AE35F75E3146524ABD7795523246324632463246324632463246324632463246
                            9552BD77524A3146BD77F85ED85AD85AD85AD85AD85AD85AD85AD85AD85AD85A
                            F85EBD7731469A69524AB656D75AD75AD75AD75AD75AD75AD75AD75AD75AD75A
                            B656524A9A691F7C1F7C1F7CAD357B6FDE7BDE7BDE7BDE7BFF7FFF7F7B6FAD35
                            1F7C1F7C1F7C1F7C1F7C1F7CCE397B6FDE7BDE7BDE7BDE7BDE7BFF7F7B6FCE39
                            1F7C1F7C1F7C1F7C1F7C1F7CF03D7B6FDE7BDE7BDE7BDE7BDE7BDE7B7B6FF03D
                            1F7C1F7C1F7C1F7C1F7C1F7C1F7C7B6FDE7BDE7BDE7BDE7BDE7BDE7B7B6F1F7C
                            1F7C1F7C1F7C1F7C1F7C1F7C1F7C186339673967396739673967396718631F7C
                            1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                            1F7C1F7C1F7C}
                        end
                        object Panel37: TPanel
                          Left = 277
                          Top = 6
                          Width = 49
                          Height = 13
                          BevelOuter = bvNone
                          Color = 39901
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clRed
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = [fsBold]
                          ParentBackground = False
                          ParentFont = False
                          TabOrder = 3
                        end
                        object BitBtn40: TBitBtn
                          Left = 515
                          Top = 0
                          Width = 86
                          Height = 26
                          Hint = 'Abrir Modulo de Or'#231'amento'
                          Align = alRight
                          Caption = '&Abrir'
                          TabOrder = 0
                          OnClick = BitBtn40Click
                          Glyph.Data = {
                            36030000424D3603000000000000360000002800000010000000100000000100
                            18000000000000030000C30E0000C30E00000000000000000000FF00FFFF00FF
                            FF00FFFF00FFFF00FFFF00FFB9D3E383BFE567B5E759B0E757B0E75FB3E775BA
                            E69EC9E4FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA9D1E99BD0F1C5
                            E3F7C1E1F6C0E0F6BEDEF4BBDFF4B8DCF4B3DAF469B7E9FF00FFFF00FFFF00FF
                            FF00FFFF00FFFF00FFCDE4F27BC1ED53AEE756AFE85BB1E76FB8E674BAE66BB7
                            E657AFE79DD1F0FF00FFFF00FFFF00FFC0966CAD6D2FD2BFADFF00FF79BBE6B5
                            D1E3FF00FFFF00FFAECFE3AACDE3B5D1E3FF00FFFF00FFFF00FFFF00FFFF00FF
                            AD6D2FAD6D2FAE7034FF00FFFF00FF69B5E670BBEA97CCEFABD6F2ADD9F3A4D4
                            F189C6EE5BB1E7A4CBE4FF00FFFF00FFBF956BAD6D2FBF946AFF00FFB7D9EEC8
                            E5F7A9D6F280C3ED6BB9EA65B5E96EB9EA86C6EEB0D9F4A0D2F0FF00FFB98857
                            AD6D2FAD6D2FAD6D2FD1BDABCDE0EC50ADE757B0E85BB1E85CB2E85DB2E85CB2
                            E85BB1E856B0E86EB9E8FF00FFAD6D2FC19B76D0BCA8FF00FFFF00FFFF00FFFF
                            00FF91C6E773BBE865B5E862B4E86AB7E881BFE8A8CEE6FF00FFFF00FFC19B76
                            AD6D2FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                            FFFF00FFFF00FFFF00FFFF00FFFF00FFAD6D2FAD6D2FAD6D2FAD6D2FAD6D2FAD
                            6D2FAD6D2FAE7135B37B44CCB299FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                            C29B74B07236B2773DB2773DB2773DB2773DB2773DB2773DB2773DB2773DFF00
                            FFFF00FFFF00FFFF00FFFF00FFFF00FFB07337B2773DE3CDB7F1E6DBF1E6DBF1
                            E6DBF1E6DBE3CDB7B2773DB2773DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                            AD6D2FB2773DB2773DB2773DB2773DB2773DB2773DB2773DB2773DB2773DCBB1
                            97FF00FFFF00FFFF00FFFF00FFBB8C5EB2773DE3CDB7F1E6DBF1E6DBF1E6DBF1
                            E6DBF1E6DBF1E6DBE3CDB7B2773DB2773DFF00FFFF00FFFF00FFB17237B17237
                            AD6D2FAD6D2FAD6D2FAD6D2FAD6D2FAD6D2FAD6D2FAD6D2FAD6D2FAD6D2FAD6D
                            2FFF00FFFF00FFFF00FFB3773DB3773DFF00FFFF00FFFF00FFFF00FFFF00FFFF
                            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                        end
                      end
                      object GroupBoxORC: TGroupBox
                        Left = 2
                        Top = 15
                        Width = 286
                        Height = 152
                        Align = alLeft
                        Caption = 'Configura'#231#227'o das Colunas'
                        TabOrder = 2
                        Visible = False
                        object ScrollBoxORC: TScrollBox
                          Left = 2
                          Top = 15
                          Width = 282
                          Height = 135
                          Align = alClient
                          BevelInner = bvNone
                          BevelOuter = bvNone
                          TabOrder = 0
                          OnEnter = ScrollBoxORCEnter
                          OnExit = ScrollBoxORCExit
                        end
                      end
                    end
                    object GroupBox29: TGroupBox
                      Left = 2
                      Top = 252
                      Width = 772
                      Height = 199
                      Align = alClient
                      Caption = 'Oficina'
                      TabOrder = 2
                      object Panel4: TPanel
                        Left = 2
                        Top = 171
                        Width = 768
                        Height = 26
                        Align = alBottom
                        BevelOuter = bvNone
                        TabOrder = 0
                        object Label40: TLabel
                          Left = 68
                          Top = 6
                          Width = 121
                          Height = 13
                          Caption = 'Ordem de Servi'#231'o Aberta'
                        end
                        object Label26: TLabel
                          Left = 332
                          Top = 6
                          Width = 138
                          Height = 13
                          Caption = 'Ordem de Servi'#231'o Cancelada'
                        end
                        object BitBtn9: TBitBtn
                          Left = 601
                          Top = 0
                          Width = 86
                          Height = 26
                          Hint = 'Visualizar - [VND009]'
                          Align = alRight
                          Caption = '&Visualizar'
                          TabOrder = 1
                          OnClick = BitBtn9Click
                          Glyph.Data = {
                            36030000424D3603000000000000360000002800000010000000100000000100
                            18000000000000030000120B0000120B00000000000000000000FF00FF314B62
                            AC7D7EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                            FFFF00FFFF00FFFF00FF5084B20F6FE1325F8CB87E7AFF00FFFF00FFFF00FFFF
                            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF32A0FE37A1FF
                            106FE2325F8BB67D79FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                            FFFF00FFFF00FFFF00FFFF00FF37A4FE379FFF0E6DDE355F89BB7F79FF00FFFF
                            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                            37A4FE359EFF0F6FDE35608BA67B7FFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF38A5FE329DFF156DCE444F5BFF
                            00FF9C6B65AF887BAF887EAA8075FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                            FF00FFFF00FF3BABFFA1CAE7AD8679A98373E0CFB1FFFFDAFFFFDDFCF8CFCCB2
                            9FA1746BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC0917DFC
                            E9ACFFFFCCFFFFCFFFFFD0FFFFDEFFFFFAE3D3D1996965FF00FFFF00FFFF00FF
                            FF00FFFF00FFFF00FFFF00FFB08978FAD192FEF4C2FFFFD0FFFFDAFFFFF6FFFF
                            FCFFFFFCB69384FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB08978FEDA97ED
                            B478FBEEBBFFFFD3FFFFDCFFFFF4FFFFF4FFFFE2E9DDBCA67B73FF00FFFF00FF
                            FF00FFFF00FFFF00FFB18A78FFDE99E9A167F4D199FEFCCCFFFFD5FFFFDAFFFF
                            DCFFFFD7EFE6C5A97E75FF00FFFF00FFFF00FFFF00FFFF00FFAA7F73FAE0A4F0
                            B778EEBA7BF6DDA6FEFBCCFFFFD3FFFFD1FFFFD7D9C5A7A3756CFF00FFFF00FF
                            FF00FFFF00FFFF00FFFF00FFCEB293FFFEDDF4D1A5EEBA7BF2C78FF8E1ABFCF0
                            BAFCFACAA3776FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA1746BE1
                            D4D3FFFEEEF7CC8CF0B473F7C788FCE3A5C2A088A5776CFF00FFFF00FFFF00FF
                            FF00FFFF00FFFF00FFFF00FFFF00FF986865BA9587EAD7A4EAD59EE0C097A577
                            6CA5776CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                            00FFFF00FFA77E70A98073A4786EFF00FFFF00FFFF00FFFF00FF}
                        end
                        object BitBtn10: TBitBtn
                          Left = 687
                          Top = 0
                          Width = 81
                          Height = 26
                          Hint = 'Imprimir - [VND055]'
                          Align = alRight
                          Caption = '&Imprimir'
                          TabOrder = 2
                          OnClick = BitBtn10Click
                          Glyph.Data = {
                            42020000424D4202000000000000420000002800000010000000100000000100
                            10000300000000020000120B0000120B00000000000000000000007C0000E003
                            00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                            1F7C1F7C1F7C1F7C1F7C4B294B296C2D8D31AE35EF3DF03DCF39AD358C316B2D
                            4B291F7C1F7C1F7C1F7C9245DE7BFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
                            92451F7C1F7CB75D3146EF3DD65AFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F1963
                            EF3D3146B75D1042F75E734E6C2D5A6B5A6B5A6B5A6B5A6B5A6B5A6B5A6BF03D
                            734EF75E104210429452AE358610861086108610861086108610861086108610
                            AE35945210423146F75EAE358610861086108610861086108610861086108610
                            AE35F75E3146524ABD7795523246324632463246324632463246324632463246
                            9552BD77524A3146BD77F85ED85AD85AD85AD85AD85AD85AD85AD85AD85AD85A
                            F85EBD7731469A69524AB656D75AD75AD75AD75AD75AD75AD75AD75AD75AD75A
                            B656524A9A691F7C1F7C1F7CAD357B6FDE7BDE7BDE7BDE7BFF7FFF7F7B6FAD35
                            1F7C1F7C1F7C1F7C1F7C1F7CCE397B6FDE7BDE7BDE7BDE7BDE7BFF7F7B6FCE39
                            1F7C1F7C1F7C1F7C1F7C1F7CF03D7B6FDE7BDE7BDE7BDE7BDE7BDE7B7B6FF03D
                            1F7C1F7C1F7C1F7C1F7C1F7C1F7C7B6FDE7BDE7BDE7BDE7BDE7BDE7B7B6F1F7C
                            1F7C1F7C1F7C1F7C1F7C1F7C1F7C186339673967396739673967396718631F7C
                            1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                            1F7C1F7C1F7C}
                        end
                        object Panel23: TPanel
                          Left = 13
                          Top = 6
                          Width = 49
                          Height = 13
                          BevelOuter = bvNone
                          Caption = '0,00'
                          Color = clRed
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clRed
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = [fsBold]
                          ParentBackground = False
                          ParentFont = False
                          TabOrder = 3
                        end
                        object Panel36: TPanel
                          Left = 277
                          Top = 6
                          Width = 49
                          Height = 13
                          BevelOuter = bvNone
                          Color = 39901
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clRed
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = [fsBold]
                          ParentBackground = False
                          ParentFont = False
                          TabOrder = 4
                        end
                        object BitBtn41: TBitBtn
                          Left = 515
                          Top = 0
                          Width = 86
                          Height = 26
                          Hint = 'Abrir Modulo de Ordem de Servi'#231'o'
                          Align = alRight
                          Caption = '&Abrir'
                          TabOrder = 0
                          OnClick = BitBtn41Click
                          Glyph.Data = {
                            36030000424D3603000000000000360000002800000010000000100000000100
                            18000000000000030000C30E0000C30E00000000000000000000FF00FFFF00FF
                            FF00FFFF00FFFF00FFFF00FFB9D3E383BFE567B5E759B0E757B0E75FB3E775BA
                            E69EC9E4FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA9D1E99BD0F1C5
                            E3F7C1E1F6C0E0F6BEDEF4BBDFF4B8DCF4B3DAF469B7E9FF00FFFF00FFFF00FF
                            FF00FFFF00FFFF00FFCDE4F27BC1ED53AEE756AFE85BB1E76FB8E674BAE66BB7
                            E657AFE79DD1F0FF00FFFF00FFFF00FFC0966CAD6D2FD2BFADFF00FF79BBE6B5
                            D1E3FF00FFFF00FFAECFE3AACDE3B5D1E3FF00FFFF00FFFF00FFFF00FFFF00FF
                            AD6D2FAD6D2FAE7034FF00FFFF00FF69B5E670BBEA97CCEFABD6F2ADD9F3A4D4
                            F189C6EE5BB1E7A4CBE4FF00FFFF00FFBF956BAD6D2FBF946AFF00FFB7D9EEC8
                            E5F7A9D6F280C3ED6BB9EA65B5E96EB9EA86C6EEB0D9F4A0D2F0FF00FFB98857
                            AD6D2FAD6D2FAD6D2FD1BDABCDE0EC50ADE757B0E85BB1E85CB2E85DB2E85CB2
                            E85BB1E856B0E86EB9E8FF00FFAD6D2FC19B76D0BCA8FF00FFFF00FFFF00FFFF
                            00FF91C6E773BBE865B5E862B4E86AB7E881BFE8A8CEE6FF00FFFF00FFC19B76
                            AD6D2FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                            FFFF00FFFF00FFFF00FFFF00FFFF00FFAD6D2FAD6D2FAD6D2FAD6D2FAD6D2FAD
                            6D2FAD6D2FAE7135B37B44CCB299FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                            C29B74B07236B2773DB2773DB2773DB2773DB2773DB2773DB2773DB2773DFF00
                            FFFF00FFFF00FFFF00FFFF00FFFF00FFB07337B2773DE3CDB7F1E6DBF1E6DBF1
                            E6DBF1E6DBE3CDB7B2773DB2773DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                            AD6D2FB2773DB2773DB2773DB2773DB2773DB2773DB2773DB2773DB2773DCBB1
                            97FF00FFFF00FFFF00FFFF00FFBB8C5EB2773DE3CDB7F1E6DBF1E6DBF1E6DBF1
                            E6DBF1E6DBF1E6DBE3CDB7B2773DB2773DFF00FFFF00FFFF00FFB17237B17237
                            AD6D2FAD6D2FAD6D2FAD6D2FAD6D2FAD6D2FAD6D2FAD6D2FAD6D2FAD6D2FAD6D
                            2FFF00FFFF00FFFF00FFB3773DB3773DFF00FFFF00FFFF00FFFF00FFFF00FFFF
                            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                        end
                      end
                      object DBGridOficina: TDBGrid
                        Left = 288
                        Top = 15
                        Width = 482
                        Height = 156
                        Align = alClient
                        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                        PopupMenu = PopupMenuOS
                        TabOrder = 1
                        TitleFont.Charset = DEFAULT_CHARSET
                        TitleFont.Color = clWindowText
                        TitleFont.Height = -11
                        TitleFont.Name = 'Tahoma'
                        TitleFont.Style = []
                        OnColumnMoved = DBGridOficinaColumnMoved
                        OnDrawColumnCell = DBGridHistOficinaDrawColumnCell
                        OnKeyDown = DBGridNFEKeyDown
                        OnTitleClick = DBGridOficinaTitleClick
                      end
                      object GroupBoxOS: TGroupBox
                        Left = 2
                        Top = 15
                        Width = 286
                        Height = 156
                        Align = alLeft
                        Caption = 'Configura'#231#227'o das Colunas'
                        TabOrder = 2
                        Visible = False
                        object ScrollBoxOS: TScrollBox
                          Left = 2
                          Top = 15
                          Width = 282
                          Height = 139
                          Align = alClient
                          BevelInner = bvNone
                          BevelOuter = bvNone
                          TabOrder = 0
                          OnEnter = ScrollBoxOSEnter
                          OnExit = ScrollBoxOSExit
                        end
                      end
                    end
                  end
                end
              end
              object TabSheet_NotasTransito: TTabSheet
                Caption = 'Notas Fiscais em Tr'#226'nsito'
                ImageIndex = 7
                object GroupBox30: TGroupBox
                  Left = 0
                  Top = 0
                  Width = 780
                  Height = 457
                  Align = alTop
                  Caption = 'Notas Fiscais'
                  TabOrder = 0
                  object Panel40: TPanel
                    Left = 2
                    Top = 15
                    Width = 776
                    Height = 42
                    Align = alTop
                    BevelOuter = bvNone
                    TabOrder = 0
                  end
                  object GroupBox31: TGroupBox
                    Left = 2
                    Top = 57
                    Width = 776
                    Height = 398
                    Align = alClient
                    Caption = 'Transito'
                    TabOrder = 1
                    object DBGridNFT: TDBGrid
                      Left = 288
                      Top = 15
                      Width = 486
                      Height = 355
                      Align = alClient
                      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                      PopupMenu = PopupMenuNFT
                      TabOrder = 0
                      TitleFont.Charset = DEFAULT_CHARSET
                      TitleFont.Color = clWindowText
                      TitleFont.Height = -11
                      TitleFont.Name = 'Tahoma'
                      TitleFont.Style = []
                      OnColumnMoved = DBGridNFTColumnMoved
                      OnDrawColumnCell = DBGridNFTDrawColumnCell
                      OnKeyDown = DBGridNFEKeyDown
                      OnTitleClick = DBGridNFTTitleClick
                    end
                    object Panel44: TPanel
                      Left = 2
                      Top = 370
                      Width = 772
                      Height = 26
                      Align = alBottom
                      BevelOuter = bvNone
                      TabOrder = 1
                      object Label86: TLabel
                        Left = 326
                        Top = 6
                        Width = 105
                        Height = 13
                        Caption = 'Nota Fiscal Cancelada'
                      end
                      object Label90: TLabel
                        Left = 48
                        Top = 6
                        Width = 117
                        Height = 13
                        Caption = 'Nota Fiscal n'#227'o recebida'
                      end
                      object BitBtn42: TBitBtn
                        Left = 686
                        Top = 0
                        Width = 86
                        Height = 26
                        Hint = 'Visualizar - [VEI110]'
                        Align = alRight
                        Caption = '&Visualizar'
                        TabOrder = 0
                        OnClick = BitBtn42Click
                        Glyph.Data = {
                          36030000424D3603000000000000360000002800000010000000100000000100
                          18000000000000030000120B0000120B00000000000000000000FF00FF314B62
                          AC7D7EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                          FFFF00FFFF00FFFF00FF5084B20F6FE1325F8CB87E7AFF00FFFF00FFFF00FFFF
                          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF32A0FE37A1FF
                          106FE2325F8BB67D79FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                          FFFF00FFFF00FFFF00FFFF00FF37A4FE379FFF0E6DDE355F89BB7F79FF00FFFF
                          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                          37A4FE359EFF0F6FDE35608BA67B7FFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF38A5FE329DFF156DCE444F5BFF
                          00FF9C6B65AF887BAF887EAA8075FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                          FF00FFFF00FF3BABFFA1CAE7AD8679A98373E0CFB1FFFFDAFFFFDDFCF8CFCCB2
                          9FA1746BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC0917DFC
                          E9ACFFFFCCFFFFCFFFFFD0FFFFDEFFFFFAE3D3D1996965FF00FFFF00FFFF00FF
                          FF00FFFF00FFFF00FFFF00FFB08978FAD192FEF4C2FFFFD0FFFFDAFFFFF6FFFF
                          FCFFFFFCB69384FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB08978FEDA97ED
                          B478FBEEBBFFFFD3FFFFDCFFFFF4FFFFF4FFFFE2E9DDBCA67B73FF00FFFF00FF
                          FF00FFFF00FFFF00FFB18A78FFDE99E9A167F4D199FEFCCCFFFFD5FFFFDAFFFF
                          DCFFFFD7EFE6C5A97E75FF00FFFF00FFFF00FFFF00FFFF00FFAA7F73FAE0A4F0
                          B778EEBA7BF6DDA6FEFBCCFFFFD3FFFFD1FFFFD7D9C5A7A3756CFF00FFFF00FF
                          FF00FFFF00FFFF00FFFF00FFCEB293FFFEDDF4D1A5EEBA7BF2C78FF8E1ABFCF0
                          BAFCFACAA3776FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA1746BE1
                          D4D3FFFEEEF7CC8CF0B473F7C788FCE3A5C2A088A5776CFF00FFFF00FFFF00FF
                          FF00FFFF00FFFF00FFFF00FFFF00FF986865BA9587EAD7A4EAD59EE0C097A577
                          6CA5776CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                          00FFFF00FFA77E70A98073A4786EFF00FFFF00FFFF00FFFF00FF}
                      end
                      object Panel46: TPanel
                        Left = 277
                        Top = 6
                        Width = 40
                        Height = 13
                        BevelOuter = bvNone
                        Color = 39901
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clRed
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentBackground = False
                        ParentFont = False
                        TabOrder = 1
                      end
                      object Panel48: TPanel
                        Left = 2
                        Top = 6
                        Width = 40
                        Height = 13
                        BevelOuter = bvNone
                        Color = clMenuHighlight
                        Font.Charset = CHINESEBIG5_CHARSET
                        Font.Color = clRed
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentBackground = False
                        ParentFont = False
                        TabOrder = 2
                      end
                    end
                    object GroupBoxNFT: TGroupBox
                      Left = 2
                      Top = 15
                      Width = 286
                      Height = 355
                      Align = alLeft
                      Caption = 'Configura'#231#227'o das Colunas'
                      TabOrder = 2
                      Visible = False
                      object ScrollBoxNFT: TScrollBox
                        Left = 2
                        Top = 15
                        Width = 282
                        Height = 338
                        Align = alClient
                        BevelInner = bvNone
                        BevelOuter = bvNone
                        TabOrder = 0
                        OnEnter = ScrollBoxNFTEnter
                        OnExit = ScrollBoxNFTExit
                      end
                    end
                  end
                end
              end
            end
            inherited Panel3: TPanel
              Top = 488
              Width = 788
              ExplicitTop = 488
              ExplicitWidth = 788
              inherited LabelSeq: TLabel
                Enabled = False
                Visible = False
              end
              inherited BitBtn4: TBitBtn
                Hint = 'Salvar Registro -  [VEI067]'
              end
              inherited BitBtn5: TBitBtn
                Hint = 'Cancelar Registro'
              end
              inherited BitBtn6: TBitBtn
                Hint = 'Sair'
              end
              object BitBtn30: TBitBtn
                Left = 28
                Top = 13
                Width = 99
                Height = 25
                Hint = 'Alterar Status'
                Caption = 'Alterar Status'
                TabOrder = 4
                OnClick = BitBtn30Click
                Glyph.Data = {
                  36030000424D3603000000000000360000002800000010000000100000000100
                  18000000000000030000C30E0000C30E00000000000000000000FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC06000FFFFFFFFFFFFF0CAA6F0CA
                  A6F0CAA6F0CAA6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFC06000FFFFFFFFFFFFF0FBFFF0FBFFF0CAA6F0CAA6FF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC06000A4A0A0A4A0A0A4A0A000A0
                  E0406060A4A0A0FF00FFFF00FFCFB49BB7804BFF00FFFF00FFFF00FFFF00FFFF
                  00FFC06000FFFFFFFFFFFFFFFFFFFFFFFF4080E0F0FBFFFF00FFFF00FFAB6B2B
                  AB6B2BCBAF93FF00FFFF00FFFF00FFFF00FFC06000FFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFF40A0E0FF00FFAF7134AB6B2BAB6B2BDBC0A6E8D7C7B3783EB3783EFF
                  00FFC06000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4080E0B2773CDFC6AF
                  B8814BFFFFFFB57C44B3783EB3783EFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFB3783EB3783EB3783EB3783EB3783EB3783EB3783EFF
                  00FFB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EAC6D2E
                  AC6D2EAC6D2EAC6D2EB3783EB3783EB3783EB2773DB2773DB3783EB2773DB378
                  3EB2773DB3783EB2773DFF00FFFFFFFFFFFFFFFFFFFFFFFFFFB3783EB3783EB3
                  783EB2773DB2773DB3783EB2773DB3783EB2773DB3783EB2773DFF00FFFFFFFF
                  FFFFFFFFFFFFFFFFFFB3783EB3783EB3783EB2773DB2773DB3783EB2773DB378
                  3EB2773DB3783EB2773DFF00FFFF00FFFF00FFFF00FFFF00FFB3783EB3783EB3
                  783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EFF00FFFF00FF
                  FF00FFFF00FFFF00FFB3783EB3783EB3783EB2773DB2773DB3783EB2773DB378
                  3EB2773DB3783EB2773DFF00FFFF00FFFF00FFFF00FFFF00FFB3783EB3783EB3
                  783EB2773DB2773DB3783EB2773DB3783EB2773DB3783EB2773DFF00FFFF00FF
                  FF00FFFF00FFFF00FFC5A27FB3783EB3783EB2773DB2773DB3783EB2773DB378
                  3EB2773DB3783EBE946AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
              end
            end
          end
        end
        inherited TabSheet2: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 788
          ExplicitHeight = 536
          inherited GroupBox3: TGroupBox
            Width = 788
            Height = 264
            ParentBiDiMode = False
            ExplicitWidth = 788
            ExplicitHeight = 264
            inherited imgInformation: TImage
              Left = 762
              Height = 247
              ExplicitLeft = 762
              ExplicitHeight = 234
            end
            object imgInformationTipoOP: TImage [6]
              Left = 738
              Top = 15
              Width = 24
              Height = 247
              Cursor = crHelp
              Align = alRight
              Picture.Data = {
                07544269746D6170F6060000424DF60600000000000036000000280000001800
                0000180000000100180000000000C0060000C30E0000C30E0000000000000000
                0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF314ACCFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF314ACC31
                4ACC314ACCFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FF314ACC314ACC314ACC314ACC314ACCFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FF314ACC314ACC314ACC314ACC314ACC314ACC314ACCFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FF314ACC314ACC314ACC314ACC314ACC314ACC314ACC
                314ACC314ACCFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FF314ACC314ACC314ACC314ACC314ACC31
                4ACC314ACC314ACC314ACC314ACC314ACCFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF314ACC314ACC314ACC314A
                CCFF00FF314ACC314ACC314ACCFF00FF314ACC314ACC314ACC314ACCFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF314ACC
                314ACC314ACCFF00FFFF00FF314ACC314ACC314ACCFF00FFFF00FF314ACC314A
                CC314ACCFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FF314ACC314ACCFF00FFFF00FFFF00FF314ACC314ACC314ACCFF00FF
                FF00FFFF00FF314ACC314ACCFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF314ACC31
                4ACC314ACCFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FF314ACC314ACC314ACCFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FF314ACC314ACC314ACCFF00FFFF00FFFF00FFFF00
                FFFF00FF7CA93F7CA93F7CA93FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF314ACC314ACC314ACCFF00FF
                FF00FFFF00FFFF00FFFF00FF7CA93F7CA93F7CA93FFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF314ACC31
                4ACC314ACCFF00FFFF00FFFF00FFFF00FFFF00FF7CA93F7CA93F7CA93FFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7CA93F7C
                A93F7CA93FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7CA93F7CA93FFF00FFFF00FFFF00
                FFFF00FF7CA93F7CA93F7CA93FFF00FFFF00FFFF00FFFF00FF7CA93F7CA93FFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7CA93F7CA93F
                7CA93FFF00FFFF00FFFF00FF7CA93F7CA93F7CA93FFF00FFFF00FFFF00FF7CA9
                3F7CA93F7CA93FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FF7CA93F7CA93F7CA93F7CA93FFF00FFFF00FF7CA93F7CA93F7CA93FFF00FF
                FF00FF7CA93F7CA93F7CA93F7CA93FFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FF7CA93F7CA93F7CA93F7CA93FFF00FF7CA93F7C
                A93F7CA93FFF00FF7CA93F7CA93F7CA93F7CA93FFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7CA93F7CA93F7CA9
                3F7CA93F7CA93F7CA93F7CA93F7CA93F7CA93F7CA93F7CA93FFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FF7CA93F7CA93F7CA93F7CA93F7CA93F7CA93F7CA93F7CA93F7CA93FFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FF7CA93F7CA93F7CA93F7CA93F7CA93F7CA93F
                7CA93FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7CA93F7CA93F7C
                A93F7CA93F7CA93FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FF7CA93F7CA93F7CA93FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FF}
              Transparent = True
              ExplicitLeft = 737
              ExplicitHeight = 234
            end
            object SpeedButton40: TSpeedButton [7]
              Left = 700
              Top = 15
              Width = 23
              Height = 22
              Flat = True
              Glyph.Data = {
                36050000424D3605000000000000360400002800000010000000100000000100
                08000000000000010000D30E0000D30E00000001000000010000007B00000084
                0000008C00000094000008940800009C0800089C080008A50800008C1000088C
                100008A5100010A5100018731800318C180021941800109C180010A5180018A5
                180010AD1800317B21005A8421001894210018B52100217B2900399429005294
                2900299C29004AA5290052A5290018AD290018B5290021B52900428C3100399C
                310031A5310021B5310031B5310021BD3100218C390018A5390039A5390029C6
                39006B844200188C4200319C4200399C420042B5420029C642005A944A00429C
                4A007B9C4A0073AD4A008CB54A0052BD4A0031CE4A00525252006B63520039CE
                520031D6520039D652005A5A5A007B735A0018A55A0063A55A008CA55A0021AD
                5A004ACE5A0039D65A0063636300736B6300847363008C73630063C6630073C6
                630042D66300214A6B006B6B6B006B736B0063D66B0042DE6B004ADE6B0042E7
                6B004AE76B00295A73004AE77300294A7B00316B7B00426B7B0073737B00B59C
                7B0084BD7B00B5C67B007BCE7B005AE77B0063E77B0052EF7B00104284002952
                84005263840018848400CEAD840073B5840073D6840052EF84005AEF84000042
                8C00295A8C00426B8C008C8C8C00B5A58C00214A940000529400215294002163
                94006BF7940029639C004A849C0073849C009C9C9C009CA59C0031AD9C00C6B5
                9C000063A5000863A500006BA5001873A5004A94A500A5A5A50094E7A500006B
                AD00086BAD001873AD002173AD009CEFAD008CF7AD001073B500007BB500217B
                B500297BB500218CB5003194B50039A5B500C6BDB500ADEFB500007BBD001884
                BD002184BD00188CBD0063ADBD0073ADBD00A5C6BD00008CC600108CC600298C
                C6001094C60042A5C6009CC6C6000894CE001094CE002994CE00009CCE00089C
                CE00109CCE00189CCE00CECECE00CED6CE00089CD60010A5D60018A5D60029A5
                D60021ADD60039ADD6005AADD60063C6D6009CCED600D6D6D600DEDED60018A5
                DE0021A5DE0029A5DE0042A5DE0031ADDE004AADDE0042B5DE0042BDDE00BDD6
                DE00DEDEDE00E7EFDE0029ADE70039ADE70042ADE70031B5E70039B5E70042B5
                E70052B5E70063BDE7006BC6E70039B5EF004AB5EF0042BDEF004ABDEF0052C6
                EF005AC6EF006BC6EF004ABDF7004AC6F70052C6F700FF00FF005AC6FF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CFCFCFCFCFCF
                CFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCF7569CFCFCFCFCFCFCFCFCFCFCF
                8483618AA96A6F7BCFCFCFCFCFCFCFCFB6C17B9FB5829A9ECFCFCFCFCFCFCF70
                99C8C7C1B5B3A89A6962CFCFCFCFCF6EBECEC8C3747D9E9A7C71CFCFCFCFCFC4
                C9C8CBBA4C539A9DA294CFCFCFCFCF268DC8CBBA4C56A8A3A3CFCF3F09001839
                78B7ADAF4457A9A9CFCFCF1A50231D39273E2E7937479BA3CFCFCF0D50544339
                2F25110E2ACFCFCFCFCF2823545466651510100619CFCFCFCFCF80725F50AF7F
                17040A1049CFCFCFCFCFCF4A5050AF7F2D25111BCFCFCFCFCFCFCFCF5D50A46C
                303548CFCFCFCFCFCFCFCFCFCF4A6D45341FCFCFCFCFCFCFCFCF}
              OnClick = SpeedButton40Click
            end
            inherited BitBtn1: TBitBtn
              Hint = 'Clique para pesquisar - [VEI058]'
            end
            inherited BitBtn3: TBitBtn
              Hint = 'Novo cadastro - [VEI059]'
            end
            inherited CheckBox3: TCheckBox
              Top = 44
              ExplicitTop = 44
            end
            inherited CheckBox1: TCheckBox
              Left = 353
              Top = 44
              ExplicitLeft = 353
              ExplicitTop = 44
            end
            object groupAvancadas: TGroupBox
              Left = 2
              Top = 88
              Width = 487
              Height = 176
              Caption = 'Op'#231#245'es Avan'#231'adas'
              TabOrder = 11
              Visible = False
              object GroupBox28: TGroupBox
                Left = 116
                Top = 13
                Width = 159
                Height = 161
                Caption = 'Status'
                TabOrder = 1
                object Label16: TLabel
                  Left = 44
                  Top = 53
                  Width = 40
                  Height = 13
                  Caption = 'Reserva'
                end
                object Label17: TLabel
                  Left = 15
                  Top = 76
                  Width = 69
                  Height = 13
                  Caption = 'Demonstra'#231#227'o'
                end
                object Label18: TLabel
                  Left = 9
                  Top = 99
                  Width = 75
                  Height = 13
                  Caption = 'Usado na Troca'
                end
                object Label20: TLabel
                  Left = 34
                  Top = 120
                  Width = 50
                  Height = 13
                  Caption = 'Cancelado'
                end
                object btStatus: TSpeedButton
                  Left = 2
                  Top = 15
                  Width = 155
                  Height = 28
                  Hint = 'Condi'#231#227'o da Pesquisa'
                  Align = alTop
                  Caption = 'E'
                  Flat = True
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                  OnClick = btStatusClick
                  ExplicitLeft = 3
                end
                object cbReserva: TComboBox
                  Left = 97
                  Top = 50
                  Width = 40
                  Height = 21
                  Style = csDropDownList
                  ItemHeight = 13
                  ItemIndex = 0
                  TabOrder = 0
                  Items.Strings = (
                    ''
                    'N'
                    'S')
                end
                object cbDemonstracao: TComboBox
                  Left = 97
                  Top = 73
                  Width = 40
                  Height = 21
                  Style = csDropDownList
                  ItemHeight = 13
                  ItemIndex = 0
                  TabOrder = 1
                  Items.Strings = (
                    ''
                    'N'
                    'S')
                end
                object cbCancelado: TComboBox
                  Left = 97
                  Top = 118
                  Width = 40
                  Height = 21
                  Style = csDropDownList
                  ItemHeight = 13
                  ItemIndex = 0
                  TabOrder = 3
                  Items.Strings = (
                    ''
                    'N'
                    'S')
                end
                object cbUsadoTroca: TComboBox
                  Left = 97
                  Top = 96
                  Width = 40
                  Height = 21
                  Style = csDropDownList
                  ItemHeight = 13
                  ItemIndex = 0
                  TabOrder = 2
                  Items.Strings = (
                    ''
                    'N'
                    'S')
                end
              end
              object GroupBox19: TGroupBox
                Left = 3
                Top = 13
                Width = 112
                Height = 161
                Caption = 'Posi'#231#227'o'
                TabOrder = 0
                object btPosicao: TSpeedButton
                  Left = 2
                  Top = 15
                  Width = 108
                  Height = 28
                  Hint = 'Condi'#231#227'o da Pesquisa'
                  Align = alTop
                  Caption = 'E'
                  Flat = True
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                  Visible = False
                  OnClick = btPosicaoClick
                end
                object ckTransito: TCheckBox
                  Left = 7
                  Top = 67
                  Width = 65
                  Height = 17
                  Caption = 'Transito'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 1
                  OnClick = ckVivoClick
                end
                object ckVivo: TCheckBox
                  Left = 7
                  Top = 49
                  Width = 71
                  Height = 17
                  Caption = 'Vivo'
                  TabOrder = 0
                  OnClick = ckVivoClick
                end
                object ckMorto: TCheckBox
                  Left = 7
                  Top = 103
                  Width = 67
                  Height = 17
                  Caption = 'Morto'
                  TabOrder = 3
                  OnClick = ckVivoClick
                end
                object ckEstacionamento: TCheckBox
                  Left = 7
                  Top = 85
                  Width = 94
                  Height = 17
                  Caption = 'Estacionamento'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 2
                  OnClick = ckVivoClick
                end
              end
              object GroupBox21: TGroupBox
                Left = 276
                Top = 13
                Width = 208
                Height = 161
                Caption = 'Situa'#231#227'o'
                TabOrder = 2
                object Panel41: TPanel
                  Left = 2
                  Top = 86
                  Width = 204
                  Height = 73
                  Align = alClient
                  BevelOuter = bvNone
                  TabOrder = 1
                  object btSituacaoTpOP: TSpeedButton
                    Left = 0
                    Top = 0
                    Width = 204
                    Height = 28
                    Hint = 'Condi'#231#227'o da Pesquisa'
                    Align = alTop
                    Caption = 'E'
                    Flat = True
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -13
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    ParentFont = False
                    OnClick = btSituacaoTpOPClick
                    ExplicitTop = 1
                  end
                  object ckEstReal: TCheckBox
                    Left = 11
                    Top = 37
                    Width = 94
                    Height = 15
                    Caption = 'Estoque'
                    TabOrder = 0
                  end
                  object ckCons: TCheckBox
                    Left = 108
                    Top = 37
                    Width = 79
                    Height = 15
                    Caption = 'Consignado'
                    TabOrder = 1
                  end
                  object ckInter: TCheckBox
                    Left = 11
                    Top = 54
                    Width = 95
                    Height = 15
                    Caption = 'Intermedia'#231#227'o'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = []
                    ParentFont = False
                    TabOrder = 2
                  end
                end
                object Panel43: TPanel
                  Left = 2
                  Top = 15
                  Width = 204
                  Height = 71
                  Align = alTop
                  BevelOuter = bvNone
                  TabOrder = 0
                  object btSituacaoEst: TSpeedButton
                    Left = 0
                    Top = 0
                    Width = 204
                    Height = 28
                    Hint = 'Condi'#231#227'o da Pesquisa'
                    Align = alTop
                    Caption = 'E'
                    Flat = True
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -13
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    ParentFont = False
                    OnClick = btSituacaoEstClick
                  end
                  object Bevel2: TBevel
                    Left = -2
                    Top = 66
                    Width = 206
                    Height = 2
                  end
                  object ckComEstoque: TCheckBox
                    Left = 11
                    Top = 37
                    Width = 84
                    Height = 15
                    Caption = 'Com Estoque'
                    TabOrder = 0
                  end
                  object ckSemEstoque: TCheckBox
                    Left = 108
                    Top = 37
                    Width = 82
                    Height = 15
                    Caption = 'Sem Estoque'
                    TabOrder = 1
                  end
                end
              end
            end
            object groupAdicional: TGroupBox
              Left = 490
              Top = 88
              Width = 270
              Height = 174
              Caption = 'Pesquisa Adicional'
              TabOrder = 12
              Visible = False
              OnExit = groupAdicionalExit
              object Label13: TLabel
                Left = 4
                Top = 66
                Width = 51
                Height = 13
                Caption = 'Conte'#250'do:'
              end
              object Label14: TLabel
                Left = 18
                Top = 40
                Width = 37
                Height = 13
                Caption = 'Campo:'
              end
              object Label19: TLabel
                Left = 154
                Top = 66
                Width = 16
                Height = 13
                Caption = 'at'#233
              end
              object Label21: TLabel
                Left = 7
                Top = 90
                Width = 48
                Height = 13
                Caption = 'Condi'#231#227'o:'
              end
              object ComboBox11: TComboBox
                Left = 61
                Top = 31
                Width = 145
                Height = 21
                Hint = 'Campo filtro da pesquisa adicional. Informe o campo desejado'
                ItemHeight = 13
                TabOrder = 0
                Text = 'ComboBox11'
                OnEnter = ComboBox1Enter
                OnExit = ComboBox11Exit
              end
              object MaskEdit7: TMaskEdit
                Left = 61
                Top = 58
                Width = 203
                Height = 21
                CharCase = ecUpperCase
                TabOrder = 1
              end
              object MaskEdit8: TMaskEdit
                Left = 190
                Top = 58
                Width = 74
                Height = 21
                EditMask = '!99/99/0000;1;_'
                MaxLength = 10
                TabOrder = 3
                Text = '  /  /    '
                Visible = False
              end
              object MaskEdit9: TMaskEdit
                Left = 61
                Top = 58
                Width = 72
                Height = 21
                EditMask = '!99/99/0000;1;_'
                MaxLength = 10
                TabOrder = 2
                Text = '  /  /    '
                Visible = False
              end
              object ComboBox12: TComboBox
                Left = 61
                Top = 84
                Width = 72
                Height = 21
                ItemHeight = 13
                TabOrder = 4
                Text = 'Come'#231'a'
                OnEnter = ComboBox12Enter
                OnExit = ComboBox12Exit
                Items.Strings = (
                  'Come'#231'a'
                  'Igual'
                  'Diferente'
                  'Maior'
                  'Menor'
                  'Esta contido')
              end
            end
            object Panel31: TPanel
              Left = 672
              Top = 41
              Width = 86
              Height = 13
              BevelOuter = bvNone
              Caption = 'Dep'#243'sito'
              Color = 45613
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clCream
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentBackground = False
              ParentFont = False
              TabOrder = 13
            end
            object Panel28: TPanel
              Left = 580
              Top = 41
              Width = 86
              Height = 13
              BevelOuter = bvNone
              Caption = 'Demonstra'#231#227'o'
              Color = 9214618
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clCream
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentBackground = False
              ParentFont = False
              TabOrder = 14
            end
            object Panel29: TPanel
              Left = 580
              Top = 57
              Width = 86
              Height = 13
              BevelOuter = bvNone
              Caption = 'Reserva'
              Color = 9403451
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clCream
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentBackground = False
              ParentFont = False
              TabOrder = 15
            end
            object Panel30: TPanel
              Left = 672
              Top = 57
              Width = 86
              Height = 13
              BevelOuter = bvNone
              Caption = 'Transito'
              Color = 10724723
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clCream
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentBackground = False
              ParentFont = False
              TabOrder = 16
            end
            object ckNovo: TCheckBox
              Left = 465
              Top = 42
              Width = 81
              Height = 15
              Caption = 'Novo [F11]'
              TabOrder = 17
            end
            object ckUsado: TCheckBox
              Left = 465
              Top = 59
              Width = 81
              Height = 14
              Caption = 'Usado[F12]'
              TabOrder = 18
            end
            object ckDeposito: TCheckBox
              Left = 465
              Top = 74
              Width = 106
              Height = 15
              Caption = 'Deposito [F7]'
              TabOrder = 19
            end
          end
          inherited Panel1: TPanel
            Top = 264
            Width = 788
            Height = 272
            ExplicitTop = 264
            ExplicitWidth = 788
            ExplicitHeight = 272
            inherited Splitter1: TSplitter
              Height = 211
              ExplicitHeight = 229
            end
            inherited DBGrid1: TDBGrid
              Width = 495
              Height = 211
              OnDrawColumnCell = DBGrid1DrawColumnCell
              OnKeyDown = DBGrid1KeyDown
            end
            inherited Panel2: TPanel
              Width = 784
              ExplicitWidth = 784
              inherited SpeedButton1: TSpeedButton
                Hint = 'Editar Registro - [VEI060]'
              end
              inherited SpeedButton2: TSpeedButton
                Hint = 'Apagar/Cancelar Registro - [VEI085]'
                OnClick = SpeedButton2Click
              end
              inherited SpeedButton3: TSpeedButton
                Visible = False
              end
              inherited SpeedButton4: TSpeedButton
                Left = 711
                Visible = False
                ExplicitLeft = 711
              end
              inherited SpeedButton5: TSpeedButton
                Left = 691
                Visible = False
                ExplicitLeft = 691
              end
              inherited SpeedButton7: TSpeedButton [5]
                Left = 407
                Hint = 'Dados Reais - [VEI060]'
                Glyph.Data = {
                  F6060000424DF606000000000000360000002800000018000000180000000100
                  180000000000C0060000C30E0000C30E00000000000000000000FF00FF71BAE9
                  66B7EA66B7EA66B7EA66B7EA66B7EA66B7EA66B7EA66B7EA66B7EA66B7EA66B7
                  EA66B7EA66B7EA66B7EA66B7EA66B7EA66B7EA66B7EA66B7EA66B7EA70BAE9FF
                  00FFFF00FF65B6E966B7EA65B6E965B6E965B6E966B7EA65B6E965B6E966B7EA
                  65B6E966B7EA65B6E965B6E965B6E966B7EA65B6E965B6E966B7EA66B7EA65B6
                  E965B6E966B7EAFF00FFFF00FF65B6E966B7EA65B6E965B6E965B6E966B7EA65
                  B6E965B6E966B7EA65B6E966B7EA65B6E965B6E965B6E966B7EA65B6E965B6E9
                  66B7EA66B7EA65B6E965B6E966B7EAFF00FFFF00FF66B7EA66B7EA66B7EAFDFE
                  FEFEFEFEFFFFFFFEFEFEFEFEFEFFFFFFFEFEFEFFFFFFFEFEFEFEFEFEFEFEFEFF
                  FFFFFEFEFEFEFEFEFFFFFFFFFFFF66B7EA66B7EA66B7EAFF00FFFF00FF65B6E9
                  66B7EA66B7EAFFFFFFFFFFFFFFFFFFFEFEFEFEFEFEFFFFFFFEFEFEFFFFFFFEFE
                  FEFEFEFEFEFEFEFFFFFFFEFEFEFEFEFEFFFFFFFFFFFF66B7EA65B6E966B7EAFF
                  00FFFF00FF66B7EA66B7EA66B7EAFFFFFFFFFFFFFFFFFFFEFEFEFEFEFEFFFFFF
                  FEFEFEFFFFFFFEFEFEFEFEFEFEFEFEFFFFFFFEFEFEFEFEFEFFFFFFFFFFFF66B7
                  EA66B7EA66B7EAFF00FFFF00FF65B6E966B7EA66B7EAFDFEFEFEFEFEB8B8B8B8
                  B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8
                  FFFFFFFFFFFF66B7EA65B6E966B7EAFF00FFFF00FF65B6E866B7EA66B7EAFDFE
                  FEFDFDFDFFFFFFFEFEFEFEFEFEFFFFFFFEFEFEFFFFFFFEFEFEFEFEFEFEFEFEFF
                  FFFFFEFEFEFEFEFEFFFFFFFFFFFF66B7EA65B6E966B7EAFF00FFFF00FF65B6E8
                  66B7EA66B7EAFDFEFEFDFDFDB8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8
                  B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8FFFFFFFFFFFF66B7EA65B6E966B7EAFF
                  00FFFF00FF66B7EA66B7EA66B7EAFFFFFFFFFFFFFFFFFFFEFEFEFEFEFEFFFFFF
                  FEFEFEFFFFFFFEFEFEFEFEFEFEFEFEFFFFFFFEFEFEFEFEFEFFFFFFFFFFFF66B7
                  EA66B7EA66B7EAFF00FFFF00FF65B6E866B7EA66B7EAFDFEFEFDFDFDB8B8B8B8
                  B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8
                  FFFFFFFFFFFF66B7EA65B6E966B7EAFF00FFFF00FF66B7EA66B7EA66B7EAFFFF
                  FFFFFFFFFFFFFFFEFEFEFEFEFEFFFFFFFEFEFEFFFFFFFEFEFEFEFEFEFEFEFEFF
                  FFFFFEFEFEFEFEFEFFFFFFFFFFFF66B7EA66B7EA66B7EAFF00FFFF00FF65B6E8
                  66B7EA66B7EAFDFEFEFDFDFDB8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8
                  B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8FFFFFFFFFFFF66B7EA65B6E966B7EAFF
                  00FFFF00FF65B6E866B7EA66B7EAFDFEFEFDFDFDFFFFFFFEFEFEFEFEFEFFFFFF
                  FEFEFEFFFFFFFEFEFEFEFEFEFEFEFEFFFFFFFEFEFEFEFEFEFFFFFFFFFFFF66B7
                  EA65B6E966B7EAFF00FFFF00FF65B6E866B7EA66B7EAFDFEFEFDFDFDB8B8B8B8
                  B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8
                  FFFFFFFFFFFF66B7EA65B6E966B7EAFF00FFFF00FF66B7EA66B7EA66B7EAFFFF
                  FFFFFFFFFFFFFFFEFEFEFEFEFEFFFFFFFEFEFEFFFFFFFEFEFEFEFEFEFEFEFEFF
                  FFFFFEFEFEFEFEFEFFFFFFFFFFFF66B7EA66B7EA66B7EAFF00FFFF00FF65B6E8
                  66B7EA66B7EAFDFEFEFDFDFDB8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8
                  B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8FFFFFFFFFFFF66B7EA65B6E966B7EAFF
                  00FFFF00FF65B6E866B7EA66B7EAFDFEFEFDFDFDFFFFFFFEFEFEFEFEFEFFFFFF
                  FEFEFEFFFFFFFEFEFEFEFEFEFEFEFEFFFFFFFEFEFEFEFEFEFFFFFFFFFFFF66B7
                  EA65B6E966B7EAFF00FFFF00FF66B7EA66B7EA66B7EAFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFF66B7EA66B7EA66B7EAFF00FFFF00FF65B6E866B7EA66B7EAFDFE
                  FEFDFDFDC4C4C4ACACACACACACACACACACACACACACACACACACACACACACACACAC
                  ACACACACACC1C1C1FFFFFFFFFFFF66B7EA65B6E966B7EAFF00FFFF00FF65B6E8
                  66B7EA66B7EAFDFEFEFDFDFDA3A3A37777777777777878787777777878787777
                  777777777777777878787777779D9D9DFFFFFFFFFFFF66B7EA65B6E966B7EAFF
                  00FFFF00FF66B7E966B7EA66B7EA67B7E96FB9E8B0CBDCB4BDC3909394797979
                  7878787878787878787878787878788F9191B5BCC1B9CCD971BAE867B7E966B7
                  EA66B7EA66B7EAFF00FFFF00FFADCFE466B7EA66B7EA66B7EA66B7EA6AB8E8A7
                  CAE0FF00FFADAEAF777777FF00FFFF00FF777777A9AAAAFF00FFAECBDE6BB8E8
                  66B7EA66B7EA66B7EA66B7EAAECFE4FF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFC5C7C9777777787878777777777777C2C4C5FF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                Layout = blGlyphTop
                OnClick = SpeedButton7Click
                ExplicitLeft = 407
              end
              inherited SpeedButton8: TSpeedButton [6]
                Left = 293
                Hint = 'Reserva - [VEI062]'
                Glyph.Data = {
                  F6060000424DF606000000000000360000002800000018000000180000000100
                  180000000000C0060000C30E0000C30E00000000000000000000FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFB4C69BB4C69BC9D2BCFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FF83A94E83A94E83A94E83A94E83A94E83A9
                  4EFF00FFFF00FFFF00FF8A8A8A67676767676767676767676767676767676767
                  67676767676767676767676767679E9E9EFF00FF83A94E83A94E6E9A306E9A2F
                  83A94E83A94E83A94E83A94EFF00FFFF00FF676767FFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFF00FF83A94E83A94E74
                  9D3FFFFFFFFFFFFF749C3E83A94E83A94E83A94E83A94EFF00FF676767FFFFFF
                  FFFFFFB6B6B6A9A9A9A9A9A9A9A9A9A9A9A9B6B6B6A9A9A9A9A9A9B9B9B9FF00
                  FF83A94E749D3FFFFFFFFCFEFDF8FAF5FFFFFF749C3E83A94E83A94E83A94EFF
                  00FF676767FFFFFFFFFFFFA9A9A9FFFFFFFFFFFFFFFFFFFFFFFFA9A9A9FFFFFF
                  FFFFFFF1F1F1AABF8C6E9A30FFFFFFFCFDFCFFFFFFFFFFFFF6F8F2FFFFFF749C
                  3E83A94E83A94EB8C8A1676767FFFFFFFFFFFFA9A9A9FFFFFFFFFFFFFFFFFFFF
                  FFFFA9A9A9FFFFFFFFFFFFF1F1F1ABC08E83A94E749C3FFFFFFF749C3E749C3E
                  FFFFFFF5F8F0FFFFFF749C3E83A94EB8C8A1676767FFFFFFFFFFFFA9A9A9FFFF
                  FFFFFFFFFFFFFFFFFFFFA9A9A9FFFFFFFFFFFFF6F6F6FF00FF83A94E83A94E6E
                  9A2F83A94E83A94E749C3EFFFFFFF5F8F0FFFFFF6E9A2FFF00FF676767FFFFFF
                  FFFFFFB6B6B6A9A9A9A9A9A9A9A9A9A9A9A9AD8966A9835CA9835CAA855FFF00
                  FF83A94E83A94E83A94E83A94E83A94E83A94E749C3EFFFFFF749C3E83A94DFF
                  00FF676767FFFFFFFFFFFFA9A9A9FFFFFFFFFFFFFFFFFFFFFFFFA9835CFEECCD
                  FEECCDFEECCDF2E7D5FF00FF83A94E83A94E83A94E83A94E83A94E83A94E6E9A
                  2F83A94EFF00FFFF00FF676767FFFFFFFFFFFFA9A9A9FFFFFFFFFFFFFFFFFFFF
                  FFFFA9835CFEECCDFEECCDFEECCDFDEBCDCBBCADFF00FF83A94E83A94E83A94E
                  83A94E83A94E83A94EFF00FFFF00FFFF00FF686868FFFFFFFFFFFFA9A9A9FFFF
                  FFFFFFFFFFFFFFFFFFFFA9835CFEECCDFEECCDFEECCDFEECCDA9835CF2F2F2FF
                  00FFFF00FFACC08FABC08EFF00FFFF00FF9C9C9CFF00FFFF00FF686868FFFFFF
                  FFFFFFB6B6B6A9A9A9A9A9A9A9A9A9A9A9A9AD8966A9835CA9835CA9835CA983
                  5CAD8966A9A9A9AAAAAAB7B7B7C1C1C1C9C9C9F6F6F6FEFEFE676767FF00FFFF
                  00FF686868FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA9A9A9FFFFFF
                  FFFFFFFFFFFFFFFFFFA9A9A9FFFFFFFFFFFFFFFFFFFFFFFFA9A9A9FFFFFFFFFF
                  FF676767FF00FFFF00FF686868FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFA9A9A9FFFFFFFFFFFFFFFFFFFFFFFFA9A9A9FFFFFFFFFFFFFFFFFFFFFFFF
                  A9A9A9FFFFFFFFFFFF676767FF00FFFF00FF686868FFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFA9A9A9FFFFFFFFFFFFFFFFFFFFFFFFA9A9A9FFFFFFFF
                  FFFFFFFFFFFFFFFFA9A9A9FFFFFFFFFFFF676767FF00FFFF00FF686868FFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB6B6B6A9A9A9A9A9A9A9A9A9A9A9
                  A9B6B6B6A9A9A9A9A9A9A9A9A9A9A9A9B6B6B6FFFFFFFFFFFF676767FF00FFFF
                  00FF686868FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FF676767FF00FFFF00FFB2783EB3783EB3783EB3783EB3783EB3783EB3783EB3
                  783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783E
                  B3783EB3783EB3783EB3783EFF00FFFF00FFB2783EB3783EB3783EB3783EB378
                  3EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3
                  783EB3783EB3783EB3783EB3783EB3783EB3783EFF00FFFF00FFB3783EB3783E
                  B3783EB3783EFF00FFFF00FFFF00FFFF00FFB3783EB3783EB3783EB3783EB378
                  3EB3783EFF00FFFF00FFFF00FFFF00FFB3783EB3783EB3783EB3783EFF00FFFF
                  00FFB3783EB3783EB3783EB3783EFF00FF696969696969FF00FFB3783EB3783E
                  B3783EB3783EB3783EB3783EFF00FF696969696969FF00FFB3783EB3783EB378
                  3EB3783EFF00FFFF00FFB57D46B3783EB3783EB3783EFF00FF696969696969FF
                  00FFB3783EB3783EB3783EB3783EB3783EB3783EFF00FF696969696969FF00FF
                  B3783EB3783EB3783EB3783EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FF696969696969FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF69
                  6969696969FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                Layout = blGlyphTop
                OnClick = SpeedButton8Click
                ExplicitLeft = 293
              end
              inherited SpeedButton12: TSpeedButton [7]
                Left = 522
                Hint = 'Movimento Ve'#237'culos - [VEI033]'
                Glyph.Data = {
                  360C0000424D360C000000000000360000002800000020000000200000000100
                  180000000000000C0000C30E0000C30E00000000000000000000FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF95B6677DA83F7DA83F76A3
                  3671A02F71A02F71A02F71A02F71A02F71A02F71A02F71A02F71A02F71A02F71
                  A02F71A02F71A02F71A02F71A02F76A3367DA83F7DA83F9EBB75FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7DA83F7DA83F76A335BFD4
                  A2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFC3D6A976A3357DA83F7DA83FFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7DA83F75A234709F2CF0F5
                  EAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD5E2C08AB0526E9D298BB054D6E4C3FF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFF2F5EB709F2C75A2347EA942FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF76A335CDDDB4F5F8F1FFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFC2D6A865981C89AF50FFFFFF83AC4C66991FC5
                  D9ACFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5F8F1CBDBB378A438FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF71A030FFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFF8FBF66E9E2AF9FAF6D3E1C0FFFFFFD9E5C8D8E5C66A
                  9B23FBFCFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF74A132FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF71A030FFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFC5D9AA7FAA43BBD19C629417FFFFFF64961BFFFFFF72
                  A030C9DAB0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF74A132FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF71A030FFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFB6CE9374A23281AA46CCDDB5FFFFFFF6F9F3A8C48073
                  A030B9D099FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF74A132FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF71A030FFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFC6D9AB72A031FFFFFF90B35CFFFFFF64951A75A23375
                  A234C9DAAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF74A132FF00FFFF00FF
                  FF00FFCFB49BB7804BB77F4ACDB196FF00FFFF00FF71A030FFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFF9FBF56A9B24FAFCF9BCD19CFFFFFFCDDDB5ECF0E26A
                  9B22FBFCFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF74A132FF00FFFF00FF
                  CFB49BAB6B2BAB6B2BAB6B2BAB6B2BCBAF93FF00FF76A335C8DAAEF3F6EFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFC1D5A4699A2199BB6AFEFEFE96B96766991FC4
                  D6AAFFFFFFFFFFFFFFFFFFFFFFFFFDFDFC9CBD6E74A2347DA741FF00FFFF00FF
                  B6804BAB6B2BFFFFFFFFFFFFAB6B2BB2783FFF00FF7DA83F76A335709E2CF0F5
                  EAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3E1BF86AE4E6D9D2788AE4FD5E2C2FF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFF9ABB6B76A2357CA63E7EA942AE6E30FFFFFF
                  BB8653AB6B2BFFFFFFFFFFFFAB6B2BB67E47FEFEFE7DA83F7DA83F76A335C1D4
                  A2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFF73A0317CA63E7DA83F7DA83FAF7134E4CFBB
                  DFC8B1AB6B2BAB6B2BAB6B2BAC6B2CDBC0A6E8D7C78FB25C7DA83F7DA83F76A3
                  3671A02F71A02F71A02F71A02F71A02F71A02F71A02F71A02F71A02F71A02F71
                  A02F71A02F71A02F71A02F71A02F7CA63E7DA83F7DA83F98B76BB2773CB3773E
                  FFFFFFDFC6AFB8814BB7804ADCC2A8FFFFFFB57C44B3783EFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB3783EB1753A
                  B2783FE6D4C2FFFFFFFFFFFFE9D8C8B57C44B1753AB3783EFF00FFB3783EB378
                  3EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB2763CAE7033AD
                  6D2FAD6D2FAE7033B2763CB3783EB3783EFF00FFFF00FFFF00FFB3783EB3783E
                  B2763CAF7134AD6E2FAD6D2FAF7033B2763CB3783EB3783EFF00FFB3783EB378
                  3EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3
                  783EB3783EB3783EB3783EB3783EB3783EFF00FFFF00FFFF00FFB3783EB3783E
                  B3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EFF00FFB3783EB378
                  3EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3
                  783EB3783EB3783EB3783EB3783EB3783EFF00FFFF00FFFF00FFB3783EAD6E30
                  AC6D2EAC6D2EAC6D2EAC6D2EAC6D2EAC6D2EAC6D2EAC6D2EFF00FFB3783EB378
                  3EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3
                  783EB3783EB3783EB3783EB3783EB3783EFF00FFFF00FFFF00FFAD6E30FDFCFB
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAC6C2EFF00FFB3783EB378
                  3EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3
                  783EB3783EB3783EB3783EB3783EB3783EFF00FFFF00FFFF00FFB98A5BD8BA9E
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAC6C2EFF00FFB3783EB378
                  3EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3
                  783EB3783EB3783EB3783EB3783EB3783EFF00FFFF00FFFF00FFFF00FFB07338
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAC6C2EFF00FFB3783EB378
                  3EB2773DB2773DB2773DB2773DB3783EB3783EB2773DB2773DB3783EB3783EB2
                  773DB2773DB3783EB3783EB2773DB2773DFF00FFFF00FFFF00FFFF00FFB57F4A
                  DBC1A6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAC6C2EFF00FFB3783EB378
                  3EB2773DB2773DB2773DB2773DB3783EB3783EB2773DB2773DB3783EB3783EB2
                  773DB2773DB3783EB3783EB2773DB2773DFF00FFFF00FFFF00FFFF00FFD4C1AF
                  B1773CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAC6C2EFF00FFB3783EB378
                  3EB2773DB2773DB2773DB2773DB3783EB3783EB2773DB2773DB3783EB3783EB2
                  773DB2773DB3783EB3783EB2773DB2773DFF00FFFF00FFFF00FFFF00FFFF00FF
                  B6814CAC6D2EAC6C2DAC6C2DAC6C2DAC6C2DAC6C2EB3783EFF00FFB3783EB378
                  3EB2773DB2773DB2773DB2773DB3783EB3783EB2773DB2773DB3783EB3783EB2
                  773DB2773DB3783EB3783EB2773DB2773DFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB3783EB378
                  3EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3
                  783EB3783EB3783EB3783EB3783EB3783EFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB3783EB378
                  3EB2773DB2773DB2773DB2773DB3783EB3783EB2773DB2773DB3783EB3783EB2
                  773DB2773DB3783EB3783EB2773DB2773DFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB3783EB378
                  3EB2773DB2773DB2773DB2773DB3783EB3783EB2773DB2773DB3783EB3783EB2
                  773DB2773DB3783EB3783EB2773DB2773DFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB3783EB378
                  3EB2773DB2773DB2773DB2773DB3783EB3783EB2773DB2773DB3783EB3783EB2
                  773DB2773DB3783EB3783EB2773DB2773DFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB3783EB378
                  3EB2773DB2773DB2773DB2773DB3783EB3783EB2773DB2773DB3783EB3783EB2
                  773DB2773DB3783EB3783EB2773DB2773DFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC5A27FB378
                  3EB2773DB2773DB2773DB2773DB3783EB3783EB2773DB2773DB3783EB3783EB2
                  773DB2773DB3783EB3783EB2773DBE946AFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBE946AB378
                  3EB2773DB2773DB2773DB2773DB3783EB3783EB2773DB2773DB3783EB3783EB2
                  773DB2773DB3783EB3783EB2773DBE946AFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                OnClick = SpeedButton12Click
                ExplicitLeft = 522
              end
              inherited SpeedButton23: TSpeedButton [8]
                Left = 579
                Hint = 'Alterar Estoque - [VEI101]'
                Glyph.Data = {
                  76060000424D7606000000000000360400002800000018000000180000000100
                  08000000000040020000530B0000530B00000001000000010000183952000031
                  630000428400004A8C0000528C0000529C0010529C00005A9C0000639C00005A
                  A5000063A5000063AD000073BD000084BD00008CBD000073C600008CC6000063
                  CE00009CCE00FF00FF0031CEFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00130000000000
                  0000000000000000000000000013131313130012121212121212121212121212
                  1212121208001313131300121212121212121212121212121212121208080013
                  1313001212121212121212121212121212121212080808001313001212121212
                  1212121212121212121212120808080800130012121212121212121212121212
                  1212121208080808080000121212121212121212121212121212121208080808
                  0800001212121212121212121212121212121212080808080800001212121212
                  1212121212121212121212120808080808000012121212121212121212121212
                  1212121208080808080000121212121212121212121212121212121208080808
                  0800001414141414141414141414141414141414080808080800130008080808
                  080D0E121212121212121212140808080800131300080808080D0E1212121212
                  12121212121408080800131313000808080D0E12121212121212121212121408
                  0800131313130008080D10121212121212121212121212140800131313131300
                  080D0D121212121212121212121212121400131313131313000B0B0F0F0C0F0F
                  0C0C0C0C0C0C0C1111001313131313130103050909090A0A0907070A0A070608
                  0013131313131313010302030303030303030304020706001313131300000000
                  0000010101010101010101010208001313131300121212121212121212121212
                  1212121202001313131313001212121212121212121212121212121200131313
                  1313130001010101010101010101010101010101131313131313}
                OnClick = SpeedButton23Click
                ExplicitLeft = 579
              end
              inherited SpeedButton24: TSpeedButton [9]
                Left = 350
                Hint = 'Editar Status Ve'#237'culo - [VEI060]'
                Glyph.Data = {
                  360C0000424D360C000000000000360000002800000020000000200000000100
                  180000000000000C0000C30E0000C30E00000000000000000000FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFC06000C06000C06000C06000C06000C06000C06000C0
                  6000C06000C06000C06000C06000C06000C06000C06000FF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFC06000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0
                  CAA6F0CAA6F0CAA6F0CAA6F0CAA6F0CAA6F0CAA6C06000FF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFC06000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0
                  FBFFF0FBFFF0CAA6F0CAA6F0CAA6F0CAA6F0CAA6C06000FF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFC06000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF40
                  2020406080F0FBFFF0FBFFF0FBFFF0CAA6F0CAA6C06000FF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFC06000C0DCC0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A080
                  C0C080E0E0406060A4A0A0A4A0A0A4A0A0F0FBFFC06000FF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFC06000C0DCC0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4
                  A0A000A0E04080E04080E0406060A4A0A0F0FBFFC06000FF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFC06000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFF40E0E04080E04080E0F0FBFFF0FBFFC06000FF00FFFF00FFFF00FF
                  FF00FFCFB49BB7804BB77F4ACDB196FF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFC06000C0DCC0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4
                  A0A0A4A0A000A0E040E0E04080E0406060F0FBFFC06000FF00FFFF00FFFF00FF
                  CFB49BAB6B2BAB6B2BAB6B2BAB6B2BCBAF93FF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFC06000F0FBFFC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
                  C0C0C0C0C0C0C0A0C0A0A000A0E04080E04040C0404040FF00FFFF00FFFF00FF
                  B6804BAB6B2BFFFFFFFFFFFFAB6B2BB2783FFF00FFAE6D2DFF00FFB4793EB479
                  3EB4793EB4793EFF00FFC06000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFF40A0E0808080808080FF00FFAE6E30FFFFFF
                  BB8653AB6B2BFFFFFFFFFFFFAB6B2BB67E47FEFEFEAF7133FF00FFB3783EB378
                  3EB3783EB3783EFF00FFC06000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA4A0A0F0CAA64080E0AF7134E4CFBB
                  DFC8B1AB6B2BAB6B2BAB6B2BAC6B2CDBC0A6E8D7C7B2763CFF00FFB3783EB378
                  3EB3783EB3783EFF00FFC08000C08000C08000C08000C08000C08000C08000C0
                  8000C08000C08000C08000C08000C08000C080004060A04080E0B2773CB3773E
                  FFFFFFDFC6AFB8814BB7804ADCC2A8FFFFFFB57C44B3783EFF00FFB3783EB378
                  3EB3783EB3783EFF00FFFF00FFC08020C08020C08020C08020C08020C08020C0
                  8020C08020C08020C08020C08020C08000C08020FF00FFFF00FFB3783EB1753A
                  B2783FE6D4C2FFFFFFFFFFFFE9D8C8B57C44B1753AB3783EFF00FFB3783EB378
                  3EB3783EB3783EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB3783EB3783E
                  B2763CAF7134AD6E2FAD6D2FAF7033B2763CB3783EB3783EFF00FFB3783EB378
                  3EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3
                  783EB3783EB3783EB3783EB3783EB3783EFF00FFFF00FFFF00FFB3783EB3783E
                  B3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EFF00FFB3783EB378
                  3EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3
                  783EB3783EB3783EB3783EB3783EB3783EFF00FFFF00FFFF00FFB3783EAD6E30
                  AC6D2EAC6D2EAC6D2EAC6D2EAC6D2EAC6D2EAC6D2EAC6D2EFF00FFB3783EB378
                  3EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3
                  783EB3783EB3783EB3783EB3783EB3783EFF00FFFF00FFFF00FFAD6E30FDFCFB
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAC6C2EFF00FFB3783EB378
                  3EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3
                  783EB3783EB3783EB3783EB3783EB3783EFF00FFFF00FFFF00FFB98A5BD8BA9E
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAC6C2EFF00FFB3783EB378
                  3EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3
                  783EB3783EB3783EB3783EB3783EB3783EFF00FFFF00FFFF00FFFF00FFB07338
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAC6C2EFF00FFB3783EB378
                  3EB2773DB2773DB2773DB2773DB3783EB3783EB2773DB2773DB3783EB3783EB2
                  773DB2773DB3783EB3783EB2773DB2773DFF00FFFF00FFFF00FFFF00FFB57F4A
                  DBC1A6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAC6C2EFF00FFB3783EB378
                  3EB2773DB2773DB2773DB2773DB3783EB3783EB2773DB2773DB3783EB3783EB2
                  773DB2773DB3783EB3783EB2773DB2773DFF00FFFF00FFFF00FFFF00FFD4C1AF
                  B1773CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAC6C2EFF00FFB3783EB378
                  3EB2773DB2773DB2773DB2773DB3783EB3783EB2773DB2773DB3783EB3783EB2
                  773DB2773DB3783EB3783EB2773DB2773DFF00FFFF00FFFF00FFFF00FFFF00FF
                  B6814CAC6D2EAC6C2DAC6C2DAC6C2DAC6C2DAC6C2EB3783EFF00FFB3783EB378
                  3EB2773DB2773DB2773DB2773DB3783EB3783EB2773DB2773DB3783EB3783EB2
                  773DB2773DB3783EB3783EB2773DB2773DFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB3783EB378
                  3EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3
                  783EB3783EB3783EB3783EB3783EB3783EFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB3783EB378
                  3EB2773DB2773DB2773DB2773DB3783EB3783EB2773DB2773DB3783EB3783EB2
                  773DB2773DB3783EB3783EB2773DB2773DFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB3783EB378
                  3EB2773DB2773DB2773DB2773DB3783EB3783EB2773DB2773DB3783EB3783EB2
                  773DB2773DB3783EB3783EB2773DB2773DFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB3783EB378
                  3EB2773DB2773DB2773DB2773DB3783EB3783EB2773DB2773DB3783EB3783EB2
                  773DB2773DB3783EB3783EB2773DB2773DFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB3783EB378
                  3EB2773DB2773DB2773DB2773DB3783EB3783EB2773DB2773DB3783EB3783EB2
                  773DB2773DB3783EB3783EB2773DB2773DFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC5A27FB378
                  3EB2773DB2773DB2773DB2773DB3783EB3783EB2773DB2773DB3783EB3783EB2
                  773DB2773DB3783EB3783EB2773DBE946AFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBE946AB378
                  3EB2773DB2773DB2773DB2773DB3783EB3783EB2773DB2773DB3783EB3783EB2
                  773DB2773DB3783EB3783EB2773DBE946AFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                OnClick = SpeedButton24Click
                ExplicitLeft = 350
              end
              inherited SpeedButton25: TSpeedButton [10]
                Left = 691
                Visible = False
                ExplicitLeft = 691
              end
              inherited SpeedButton26: TSpeedButton [11]
                Left = 636
                Hint = 'Editar Observa'#231#227'o  - [VEI123]'
                Glyph.Data = {
                  F6060000424DF606000000000000360000002800000018000000180000000100
                  180000000000C0060000C30E0000C30E00000000000000000000FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB27941C09B76FF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  BE946BAC6E2FAD7134B68656FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFAC6E2FAD6E2FFF00FFD0BCA9FF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FF6A6A6AA6A6A6FF00FFFF00FFFF00FFFF00FFB68656FF00FFD0BCA9AD6E2FAD
                  6E2FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FF666666878787939393FF00FFFF00FFFF00FFFF00FFD0BC
                  A9AD6E2FAD6E2FAD6E2FAD6E2FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FF666666FFFFFFA2A2A27A7A7AFF00FF
                  FF00FFFF00FFFF00FFAD6E2FAD6E2FAD6E2FAD6E2FAD6E2FFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF666666FFFFFFFF
                  FFFFE3E3E37A7A7A989898FF00FFFF00FFFF00FFAD6E2FAD6E2FAD6E2FAD6E2F
                  AD6E2FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FF666666FFFFFFFFFFFFFFFFFFFFFFFF939393838383FF00FFFF00FFFF00FFAD
                  6E2FAD6E2FAD6E2FAD6E2FAD6E2FFF00FFFF00FFFF00FFFF00FFFF00FF6C6C6C
                  666666666666666666676767FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA9A9A96B6B
                  6B7D7D7DFF00FFFF00FFAD6E2FAD6E2FAD6E2FAD6E2FAD6E2FFF00FFFF00FFFF
                  00FF6C6C6CE3E3E3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FCFCFCFFFFFFFFFFFFFFFFFFF9F9F9FF00FFFF00FFAD6E2FAD6E2FAD6E2FAD6E
                  2FAD6E2FFF00FFFF00FF666666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F9FF00FFFF00FF
                  AD6E2FAD6E2FAD6E2FAD6E2FFF00FFFF00FF666666FFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFF9F9F9FF00FFFF00FFAD6E2FAD6E2FFF00FFFF00FFAD6E2F666666FFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F9FF00FFFF00FFFF00FFFF00FFAD6E2FAD
                  6E2F666666FFFFFFFFFFFFFFFFFFB87F47B3783EB3783EB3783EB3783EB3783E
                  B3783EB3783EC49669FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F9FF00FFFF00
                  FFAD6E2FAD6E2FFF00FF666666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFF9F9F9FF00FFFF00FFFF00FFFF00FF666666FFFFFFFFFFFFFFFFFFB87F
                  47B3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3
                  783EB87F47FFFFFFFFFFFFFFFFFF6E6E6EFF00FFFF00FFFF00FF666666FFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF666666FF00FFFF00FFFF
                  00FF666666FFFFFFFFFFFFFFFFFFB87F47B3783EB3783EB3783EB3783EB3783E
                  B3783EB3783EB3783EB3783EB3783EB3783EB87F47FFFFFFFFFFFFFFFFFF6666
                  66FF00FFFF00FFFF00FF666666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFF666666FF00FFFF00FFFF00FF666666FFFFFFFFFFFFFFFFFFB87F
                  47B3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3
                  783EB87F47FFFFFFFFFFFFFFFFFF666666FF00FFFF00FFFF00FF666666FFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF666666FF00FFFF00FFFF
                  00FF666666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6666
                  66FF00FFFF00FFFF00FF6A6A6AE0E0E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFE0E0E06A6A6AFF00FFFF00FFFF00FFFF00FF6A6A6A6666666666666666
                  6666666666666666666666666666666666666666666666666666666666666666
                  66666666666666666666666A6A6AFF00FFFF00FFFF00FFFF00FF}
                OnClick = SpeedButton26Click
                ExplicitLeft = 636
              end
              inherited SpeedButton6: TSpeedButton [12]
                Left = 237
                Hint = 'Sa'#237'da'
                Glyph.Data = {
                  F6060000424DF606000000000000360000002800000018000000180000000100
                  180000000000C0060000C30E0000C30E00000000000000000000FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FF7F7F7F5B5B5B565656565656565656565656565656565656565656565656
                  5656565656565656565656565656565656565656565B5B5B7B7B7BFF00FFFF00
                  FFFF00FFFF00FFFF00FF5A5A5AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  5B5B5BFF00FFFF00FFFF00FFFF00FFFF00FF565656FFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFF565656FF00FFFF00FFFF00FFFF00FFFF00FF565656FFFFFF
                  FFFFFF8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D
                  8D8D8D8D8D8D8D8D8D8DFFFFFFFFFFFF565656FF00FFFF00FFFF00FFFF00FFFF
                  00FF565656FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF565656FF00FFFF00
                  FFFF00FFFF00FFFF00FF565656FFFFFFFFFFFF8D8D8D8D8D8D8D8D8D8D8D8D8D
                  8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D9D9D9DEBEBEBEAEAEA
                  B6B6B6FF00FFFF00FFFF00FFFF00FFFF00FF565656FFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEA
                  EAEAFF00FFAB528DAB528DAB528DFF00FFFF00FFFF00FFFF00FF565656FFFFFF
                  FFFFFF8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D
                  8D8D8D8D8D8D8DA7A7A7FF00FFFF00FFAB528DAB528DAB528DFF00FFFF00FFFF
                  00FF565656FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFEFEFEEEEEEEE8E8E8E8E8E8E8E8E8FF00FFFF00FFFF00FFAC558EAB52
                  8DAB528DFF00FFFF00FF565656FFFFFFFFFFFF8D8D8D8D8D8D8D8D8D8D8D8D8D
                  8D8D8D8D8D8D8D8D8D8D8D9E9E9EFF00FFAB528DAB528DAB528DAB528DAB528D
                  AB528DAB528DAB528DAB528DAB528DFF00FF565656FFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7FF00FFAB528DAB528DAB
                  528DAB528DAB528DAB528DAB528DAB528DAB528DAB528DB06095565656FFFFFF
                  FFFFFF8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8DA2A2A2FF00
                  FFAB528DAB528DAB528DAB528DAB528DAB528DAB528DAB528DAB528DAB528DFF
                  00FF565656FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFBFBFBFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFAC558EAB52
                  8DAB528DFF00FFFF00FF565656FFFFFFFFFFFF8D8D8D8D8D8D8D8D8D8D8D8D8D
                  8D8D8D8D8D8D8D8D8D8D8D8D8D8D979797A3A3A3A3A3A3A5A5A5FF00FFFF00FF
                  AB528DAB528DAB528DFF00FFFF00FFFF00FF565656FFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFEFEFEF0
                  F0F0FF00FFAB528DAB528DAB528DFF00FFFF00FFFF00FFFF00FF565656FFFFFF
                  FFFFFF8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8DFFFFFFFFFF
                  FFFEFEFEFEFEFEF2F2F2FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FF565656FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFF5656565656565656566B6B6B7373737A7A7AFF00FFFF00
                  FFFF00FFFF00FFFF00FF565656FFFFFFFFFFFF8D8D8D8D8D8D8D8D8D8D8D8D8D
                  8D8D8D8D8D8D8D8D8D8D8DFFFFFFFFFFFF565656FDFDFDFFFFFFFFFFFFBEBEBE
                  696969FF00FFFF00FFFF00FFFF00FFFF00FF565656FFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF565656FDFDFDFF
                  FFFFBFBFBF696969FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF565656FFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FF565656FDFDFDC2C2C2696969FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FF5A5A5AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFF5B5B5BC1C1C1696969FF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FF7F7F7F5B5B5B56565656565656565656565656565656
                  56565656565656565656565656565656565B5B5B6E6E6EFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                Layout = blGlyphTop
                OnClick = SpeedButton6Click
                ExplicitLeft = 237
              end
              inherited SpeedButton11: TSpeedButton [13]
                Left = 178
                Hint = 'Entrada'
                Glyph.Data = {
                  F6060000424DF606000000000000360000002800000018000000180000000100
                  180000000000C0060000C30E0000C30E00000000000000000000FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FF7F7F7F5B5B5B565656565656565656565656565656565656565656565656
                  5656565656565656565656565656565656565656565B5B5B565656FF00FFFF00
                  FFFF00FFFF00FFFF00FF5A5A5AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  565656FF00FFFF00FFFF00FFFF00FFFF00FF565656FFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFF565656FF00FFFF00FFFF00FFFF00FFFF00FF5B5B5BFFFFFF
                  FFFFFF8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D
                  8D8D8D8D8D8D8D8D8D8DFFFFFFFFFFFF565656FF00FFFF00FFFF00FFFF00FFFF
                  00FF565656FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF565656FF00FFFF00
                  FFFF00FFFF00FFFF00FF565656FFFFFFFFFFFF8D8D8D8D8D8D8D8D8D8D8D8D8D
                  8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8DFFFFFFFFFFFF
                  565656FF00FFFF00FFFF00FFFF00FFFF00FF565656FFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFF85AD4B85AD4B85AD4BFF00FFFF00FFFF00FF565656FFFFFF
                  FFFFFF8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D
                  8D8D8D8D8D8D8D8D8D8DFFFFFF85AD4B85AD4B85AD4BFF00FFFF00FFFF00FFFF
                  00FF565656FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF85AD4B85AD4B85AD4BFF00FFFF00
                  FFFF00FFFF00FFFF00FF565656FFFFFFFFFFFF8D8D8D8D8D8D8D8D8D8D8D8D8D
                  8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D85AD4B85AD4B85AD4B
                  85AD4B85AD4B85AD4B85AD4B85AD4B85AD4B565656FFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF85AD4B85
                  AD4B85AD4B85AD4B85AD4B85AD4B85AD4B85AD4B85AD4B85AD4B565656FFFFFF
                  FFFFFF8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D
                  8D8D8D8D8D8D8D85AD4B85AD4B85AD4B85AD4B85AD4B85AD4B85AD4B85AD4B85
                  AD4B565656FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF85AD4B85AD4B85AD4BFF00FFFF00
                  FFFF00FFFF00FFFF00FF565656FFFFFFFFFFFF8D8D8D8D8D8D8D8D8D8D8D8D8D
                  8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8DFFFFFF85AD4B
                  85AD4B85AD4BFF00FFFF00FFFF00FFFF00FF565656FFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFF85AD4B85AD4B85AD4BFF00FFFF00FFFF00FF565656FFFFFF
                  FFFFFF8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8DFFFFFFFFFF
                  FFFEFEFEFEFEFEFEFEFEFEFEFEFCFCFC565656FF00FFFF00FFFF00FFFF00FFFF
                  00FF5B5B5BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFF5656565656565656565656565656565B5B5BFF00FFFF00
                  FFFF00FFFF00FFFF00FF565656FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF565656FDFDFDFFFFFFFFFFFFBEBEBE
                  696969FF00FFFF00FFFF00FFFF00FFFF00FF565656FFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF565656FDFDFDFF
                  FFFFBFBFBF696969FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF565656FFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FF565656FDFDFDC2C2C2696969FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FF5A5A5AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFF5B5B5BC1C1C1696969FF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FF7F7F7F5B5B5B56565656565656565656565656565656
                  56565656565656565656565656565656565B5B5B6E6E6EFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                Layout = blGlyphTop
                ParentFont = False
                OnClick = SpeedButton11Click
                ExplicitLeft = 178
              end
              object SpeedButton10: TSpeedButton
                Left = 464
                Top = 4
                Width = 51
                Height = 45
                Hint = 'Avaria - [VEI145]'
                Flat = True
                Glyph.Data = {
                  360C0000424D360C000000000000360000002800000020000000200000000100
                  180000000000000C0000C30E0000C30E00000000000000000000FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB3783EB3783EB3783EA9
                  6624A86624B3783EB3783EB3783EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB3783EB3783EB3783EB3783EA9
                  6624A86624B3783EB3783EB3783EB3783EFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFB3783EB3783EB3783EA96624A96624FF
                  FFFFFFFFFFA86624A86624B3783EB3783EB3783EFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFB3783EB3783EB3783EB3783EA76421A76421FF
                  FFFFFFFFFFA76321A76321B3783EB3783EB3783EB3783EFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFB3783EB3783EB3783EB3783EA76421A76421FF
                  FFFFFFFFFFA76321A76321B3783EB3783EB3783EB3783EFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFB3783EB3783EB3783EB3783EA76421A76421FF
                  FFFFFFFFFFA76321A76321B3783EB3783EB3783EB3783EFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFB3783EB3783EB3783EB3783EA76421A76421FF
                  FFFFFFFFFFA76321A76321B3783EB3783EB3783EB3783EFF00FFFF00FFFF00FF
                  FF00FFCFB49BB7804BB77F4ACDB196FF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFB3783EB3783EB3783EB3783EA76421A76421FF
                  FFFFFFFFFFA76321A76321B3783EB3783EB3783EB3783EFF00FFFF00FFFF00FF
                  CFB49BAB6B2BAB6B2BAB6B2BAB6B2BCBAF93FF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFB3783EB3783EB3783EB3783EB3783EB3783E9F
                  550C9F550CB3783EB3783EB3783EB3783EB3783EB3783EFF00FFFF00FFFF00FF
                  B6804BAB6B2BFFFFFFFFFFFFAB6B2BB2783FFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFB3783EB3783EB3783EB3783EB3783EB3783E9F
                  550C9F550CB3783EB3783EB3783EB3783EB3783EB3783EFF00FFAE6E30FFFFFF
                  BB8653AB6B2BFFFFFFFFFFFFAB6B2BB67E47FEFEFEAE6D2DFF00FFB4793EB479
                  3EB2783EB2783EB37A42FF00FFB3783EB3783EB3783EB3783EAA6929AA6929F2
                  E9E1F4EBE2AA6928AA6928B3783EB3783EB3783EB3783EFF00FFAF7134E4CFBB
                  DFC8B1AB6B2BAB6B2BAB6B2BAC6B2CDBC0A6E8D7C7AF7133FF00FFB3783EB378
                  3EB3783EB3783EB3783EC5A280FF00FFB3783EB3783EB3783EA96624A96624FF
                  FFFFFFFFFFA86624A86624B3783EB3783EB3783EFF00FFFF00FFB2773CB3773E
                  FFFFFFDFC6AFB8814BB7804ADCC2A8FFFFFFB57C44B2763CFF00FFB3783EB378
                  3EB2783EB2783EB2783EB2783EFF00FFFF00FFB3783EB3783EB3783EB3783EA9
                  6624A86624B3783EB3783EB3783EB3783EFF00FFFF00FFFF00FFB3783EB1753A
                  B2783FE6D4C2FFFFFFFFFFFFE9D8C8B57C44B1753AB3783EFF00FFB3783EB378
                  3EB2783EB2783EB2783EB2783EB3783EFF00FFFF00FFB3783EB3783EB3783EA9
                  6624A86624B3783EB3783EB3783EFF00FFFF00FFFF00FFFF00FFB3783EB3783E
                  B2763CAF7134AD6E2FAD6D2FAF7033B2763CB3783EB3783EFF00FFB3783EB378
                  3EB2783EB2783EB2783EB2783EB2783EB2783EFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFC6A585FF00FFFF00FFFF00FFB3783EB3783E
                  B3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EFF00FFB3783EB378
                  3EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB47A42BF9469BF9469C7
                  A686C7A686BF956BBF956BB47B43B3783EFF00FFFF00FFFF00FFB3783EAD6E30
                  AC6D2EAC6D2EAC6D2EAC6D2EAC6D2EAC6D2EAC6D2EB3783EFF00FFB3783EB378
                  3EB2773DB2773DB2773DB2773DB3783EB3783EB2773DB2773DB3783EB3783EB2
                  773DB2773DB3783EB3783EB2773DB2773DFF00FFFF00FFFF00FFAD6E30FDFCFB
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAC6D2EFF00FFB3783EB378
                  3EB2773DB2773DB2773DB2773DB3783EB3783EB2773DB2773DB3783EB3783EB2
                  773DB2773DB3783EB3783EB2773DB2773DFF00FFFF00FFFF00FFB98A5BD8BA9E
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAC6C2EFF00FFB3783EB378
                  3EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3
                  783EB3783EB3783EB3783EB3783EB3783EFF00FFFF00FFFF00FFFF00FFB07338
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAC6C2EFF00FFB3783EB378
                  3EB2773DB2773DB2773DB2773DB3783EB3783EB2773DB2773DB3783EB3783EB2
                  773DB2773DB3783EB3783EB2773DB2773DFF00FFFF00FFFF00FFFF00FFB57F4A
                  DBC1A6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAC6C2EFF00FFB3783EB378
                  3EB2773DB2773DB2773DB2773DB3783EB3783EB2773DB2773DB3783EB3783EB2
                  773DB2773DB3783EB3783EB2773DB2773DFF00FFFF00FFFF00FFFF00FFD4C1AF
                  B1773CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAC6C2EFF00FFB3783EB378
                  3EB2773DB2773DB2773DB2773DB3783EB3783EB2773DB2773DB3783EB3783EB2
                  773DB2773DB3783EB3783EB2773DB2773DFF00FFFF00FFFF00FFFF00FFFF00FF
                  B6814CAC6D2EAC6C2DAC6C2DAC6C2DAC6C2DAC6C2EB3783EFF00FFB3783EB378
                  3EB2773DB2773DB2773DB2773DB3783EB3783EB2773DB2773DB3783EB3783EB2
                  773DB2773DB3783EB3783EB2773DB2773DFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB3783EB378
                  3EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3
                  783EB3783EB3783EB3783EB3783EB3783EFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB3783EB378
                  3EB2773DB2773DB2773DB2773DB3783EB3783EB2773DB2773DB3783EB3783EB2
                  773DB2773DB3783EB3783EB2773DB2773DFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB3783EB378
                  3EB2773DB2773DB2773DB2773DB3783EB3783EB2773DB2773DB3783EB3783EB2
                  773DB2773DB3783EB3783EB2773DB2773DFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB3783EB378
                  3EB2773DB2773DB2773DB2773DB3783EB3783EB2773DB2773DB3783EB3783EB2
                  773DB2773DB3783EB3783EB2773DB2773DFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB3783EB378
                  3EB2773DB2773DB2773DB2773DB3783EB3783EB2773DB2773DB3783EB3783EB2
                  773DB2773DB3783EB3783EB2773DB2773DFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC5A27FB378
                  3EB2773DB2773DB2773DB2773DB3783EB3783EB2773DB2773DB3783EB3783EB2
                  773DB2773DB3783EB3783EB2773DBE946AFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBE946AB378
                  3EB2773DB2773DB2773DB2773DB3783EB3783EB2773DB2773DB3783EB3783EB2
                  773DB2773DB3783EB3783EB2773DBE946AFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                ParentShowHint = False
                ShowHint = True
                OnClick = SpeedButton10Click
              end
            end
            inherited GroupBox2: TGroupBox
              Height = 211
              ExplicitHeight = 211
              inherited ScrollBox2: TScrollBox
                Height = 194
                ExplicitHeight = 194
              end
            end
          end
        end
        inherited tsMemo: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 788
          ExplicitHeight = 536
        end
        object tsStatusVeiculo: TTabSheet
          Caption = 'tsStatusVeiculo'
          ImageIndex = 4
          object pnStatusVeiculo: TPanel
            Left = 0
            Top = 0
            Width = 273
            Height = 165
            BorderWidth = 6
            TabOrder = 0
            object Panel16: TPanel
              Left = 7
              Top = 128
              Width = 259
              Height = 30
              Align = alBottom
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 2
              object BitBtn27: TBitBtn
                Left = 49
                Top = 0
                Width = 75
                Height = 25
                Caption = '&OK'
                Default = True
                TabOrder = 0
                OnClick = BitBtn27Click
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
              object BitBtn28: TBitBtn
                Left = 130
                Top = 0
                Width = 75
                Height = 25
                Caption = '&Cancela'
                TabOrder = 1
                OnClick = BitBtn28Click
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
            end
            object Panel27: TPanel
              Left = 7
              Top = 106
              Width = 259
              Height = 22
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 1
              object checkConc: TCheckBox
                Left = 154
                Top = 0
                Width = 105
                Height = 22
                Align = alRight
                Caption = 'Concession'#225'ria'
                TabOrder = 1
                OnClick = checkConcClick
              end
              object checkEstoqueReal: TCheckBox
                Left = 0
                Top = 0
                Width = 154
                Height = 22
                Align = alClient
                Caption = 'Estoque Real (Pr'#243'prio)'
                TabOrder = 0
                OnClick = checkEstoqueRealClick
              end
            end
            object RadioGroup1: TRadioGroup
              Left = 7
              Top = 7
              Width = 259
              Height = 99
              Align = alTop
              ItemIndex = 0
              Items.Strings = (
                'Estoque'
                'Consignado'
                'Intermedia'#231#227'o')
              TabOrder = 0
            end
          end
        end
        object tsFaturaDesp: TTabSheet
          Caption = 'tsFaturaDesp'
          ImageIndex = 5
          object pnFaturaDesp: TPanel
            Left = 3
            Top = 3
            Width = 606
            Height = 358
            BevelKind = bkTile
            BevelOuter = bvNone
            TabOrder = 0
            object Panel42: TPanel
              Left = 0
              Top = 0
              Width = 602
              Height = 41
              Align = alTop
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 0
              object Label300: TLabel
                Left = 158
                Top = 10
                Width = 139
                Height = 13
                Caption = 'Condi'#231#227'o de Pagamento:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object DBText30: TDBText
                Left = 303
                Top = 10
                Width = 162
                Height = 17
                DataField = 'DESC_COND_PAG'
                DataSource = DtmVeiculosCCIA.dsCondPagDesp
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clNavy
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
              end
            end
            object Panel45: TPanel
              Left = 0
              Top = 307
              Width = 602
              Height = 47
              Align = alBottom
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 5
              object BitBtn31: TBitBtn
                Left = 212
                Top = 9
                Width = 75
                Height = 25
                Hint = 'Confirmar'
                Caption = 'Confirmar'
                TabOrder = 0
                OnClick = BitBtn31Click
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
              object BitBtn34: TBitBtn
                Left = 293
                Top = 9
                Width = 75
                Height = 25
                Hint = 'Cancelar'
                Caption = 'Cancelar'
                TabOrder = 1
                OnClick = BitBtn34Click
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
            end
            object GroupBox39: TGroupBox
              Left = 408
              Top = 212
              Width = 185
              Height = 95
              Caption = 'Valor do Frete'
              TabOrder = 4
              Visible = False
              object Label301: TLabel
                Left = 34
                Top = 75
                Width = 48
                Height = 13
                Caption = 'para o dia'
              end
              object edFreteCondPag: TEditHw
                Left = 32
                Top = 40
                Width = 121
                Height = 21
                TabOrder = 0
                Text = '                              0,00'
                Formato = fNumber
                FormatSize = '0.2'
              end
              object edDataFrete: TMaskEdit
                Left = 88
                Top = 67
                Width = 65
                Height = 21
                EditMask = '!99/99/0000;1;_'
                MaxLength = 10
                TabOrder = 1
                Text = '  /  /    '
              end
              object ckLancarFrete: TCheckBox
                Left = 32
                Top = 17
                Width = 137
                Height = 17
                Caption = 'Lan'#231'ar Frete a pagar'
                TabOrder = 2
              end
            end
            object GroupBox40: TGroupBox
              Left = 8
              Top = 137
              Width = 394
              Height = 170
              Caption = 'Parcelas'
              TabOrder = 2
              object Panel47: TPanel
                Left = 262
                Top = 41
                Width = 129
                Height = 123
                BevelOuter = bvNone
                TabOrder = 2
                Visible = False
                object btSalvarFaturaEntrada: TBitBtn
                  Left = 1
                  Top = 88
                  Width = 120
                  Height = 25
                  Caption = 'Salvar Parcela'
                  TabOrder = 0
                  OnClick = btSalvarFaturaEntradaClick
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
                object edDocFaturaEntrada: TEdit
                  Left = 1
                  Top = 7
                  Width = 120
                  Height = 21
                  TabOrder = 1
                  Text = 'edDocFaturaEntrada'
                end
                object edValorFaturaEntrada: TEditHw
                  Left = 1
                  Top = 34
                  Width = 120
                  Height = 21
                  TabOrder = 2
                  Text = '                              0,00'
                  Formato = fNumber
                  FormatSize = '0.2'
                end
                object edVencimentoFaturaEntrada: TMaskEdit
                  Left = 1
                  Top = 61
                  Width = 65
                  Height = 21
                  EditMask = '!99/99/0000;1;_'
                  MaxLength = 10
                  TabOrder = 3
                  Text = '  /  /    '
                end
              end
              object ListBox3: TListBox
                Left = 2
                Top = 15
                Width = 254
                Height = 153
                Align = alLeft
                ItemHeight = 13
                TabOrder = 0
              end
              object btAlterarFaturaEntrada: TBitBtn
                Left = 263
                Top = 16
                Width = 121
                Height = 25
                Hint = 'Alterar Parcela - [NF0063]'
                Caption = 'Alterar Parcela'
                TabOrder = 1
                OnClick = btAlterarFaturaEntradaClick
                Glyph.Data = {
                  36050000424D3605000000000000360400002800000010000000100000000100
                  08000000000000010000320B0000320B0000000100000001000000000000CE63
                  00000010180039082100A56B2900DE8C3900E7396300526B7B0000089C007B9C
                  A500D6CEAD00F7D6AD00FFD6AD00ADB5BD00B5C6C600BDC6C600C6C6C600FFE7
                  C600ADC6CE00FFEFD6002163DE00FFEFDE00FFF7E700FFFFF700FF00FF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00181818181818
                  1818181818181818181818010101010101010101010101010101180119191716
                  1311070A0B0C0C0C0C011801190F0F0F0F0F0700120F0F0F0C01180119191919
                  17160700000C0B0C0C011801190F0F0F0F0F071505000E0F0C01180119191919
                  1919091505000C0C0C011801190F0F0F0F0F0F071505000D0C01180119191919
                  191919091505000C0C011801190F0F0F0F0F0F0F071505000C01180119191919
                  19191919091505020C0118011919191919191919190700140001180101010101
                  0101010101041414030118180101010101010101010108080618181818181818
                  1818181818181818181818181818181818181818181818181818}
              end
              object btDetalheDespesa: TBitBtn
                Left = 263
                Top = 47
                Width = 121
                Height = 25
                Hint = 'Detalhar Despesas - [NF0101]'
                Caption = 'Detalhar Despesa'
                TabOrder = 3
                OnClick = btDetalheDespesaClick
                Glyph.Data = {
                  BE020000424DBE02000000000000BE0100002800000010000000100000000100
                  08000000000000010000120B0000120B00006200000062000000FF00FF008B76
                  75008F6B64009A7E7800923C1800A0390700BB591E00994C1F00BF672F00B25F
                  2D00A776580072594A00B1927F00CA774100CC7E4800D1895A00FFFCFA00D487
                  5000DE925B00D9976500EDBA9300EEA96F00F0C9AA00FBBB7F00EBAD7700FEBD
                  8200F7B77F00F8BA8200FFC28900E0AD8000D5A98000F6C49800F8D5B600FFE2
                  C700FFE7D100FFF7F000FFF8F200FFC08300FFC18400FFC28400F8BC8100FFC5
                  8A00EBB78400E1AF8000FECFA100D1AB8700E1BA9500FED4AB00FED9B400FED9
                  B500FFDDBC00FFDDBD00FFDEBD00FFE2C500FFE2C600FFE3C700FEE6CF00FFEA
                  D500FFEDDC00FFEEDD00FFF2E500FFF3E700FFF7EF00D5822800FFC58600FFC5
                  8800FFC98F00FFCA9100FEC99100FFCF9A00FFD8AD00FFDDB700FFE3C600FFED
                  DA00EDDCCA00FFF3E600FFD9AD00FFDEB700FFE3C100FFEEDA00FFF8F000FFE6
                  C500F8E0C200FFEACF00FFEFD700FFF6E900FFF0D800FFF4DE00FFF2D700FFF6
                  E200FFF2D300FFF8E700FFFBEE00FFFEFB00FFFFF700FFFFFB00FFFFFF000000
                  000000020202020204050402020202020000025220140F1F041204151B1A1A28
                  020002584804040E11060417262525400200025738041308090718423F3F3F27
                  0200025B4F16040D0A010B2B291919270200023F3B3F3F350B03030B1D293F3F
                  0200025F3D3B39370B032E0C0B2A1C2702000260243D3B540B0347462D1E4441
                  020002603F3F3F3F0B03513F3F3F3F4302000260605D50554A035333312F2C45
                  0200023F3F603F3F3D3F223F3F303F3F020002606060605D234B3A222134304C
                  0200026060606060103F3C492236324D020002603F3F3F3F603F3E3F3F3F3F4E
                  02000260606060606060605E5C59565A02000002020202020202020202020202
                  0000}
              end
            end
            object GroupBox41: TGroupBox
              Left = 408
              Top = 137
              Width = 185
              Height = 72
              Caption = 'Modificar Condi'#231#227'o'
              TabOrder = 3
              object DBLookupComboBox6: TDBLookupComboBox
                Left = 3
                Top = 16
                Width = 179
                Height = 21
                KeyField = 'COD_COND_PAG'
                ListField = 'DESC_COND_PAG'
                ListSource = DtmVeiculosCCIA.dsCondPagDesp
                TabOrder = 0
              end
              object btGerarFaturaEntrada: TBitBtn
                Left = 32
                Top = 39
                Width = 120
                Height = 25
                Hint = 'Gerar novamente - [NF0064]'
                Caption = 'Gerar Novamente'
                TabOrder = 1
                OnClick = btGerarClick
                Glyph.Data = {
                  AE030000424DAE03000000000000AE0200002800000010000000100000000100
                  08000000000000010000120B0000120B00009E0000009E000000FF00FF00009D
                  0300029D0A00014F0400014D0400014C0400039D0B00039C0B0002740700013D
                  030003960A0003960B0003900A00038F0A0002540500035606000462090002A3
                  0B0003AC0D0003A50C0003A40C0003910B0003900B00049E0F0005920F00035F
                  0900056B0C0018B023003EBB470004A5130005A7120005931100079615000676
                  0F0008841400098E160044BD4E00A4EAAB0006A7180008A1190009A91C000782
                  160086D79000099A1D0009991B000AAB23000BA623000DAC27000C9C23000C9A
                  23000D9E250072D1810075D18400A4EBB000D4FBDA000FAF2D000D9825000FA9
                  2D0051C5670005A4270010A12F0010A02D0011A12F0011A1300012A4310013A4
                  310021B2400023B241002CB647009EE9AD00B8E9C20011AC350013B53A0012AF
                  350012A1320016AD39001AA6390021AA400022A940002AAF490033B2500037B5
                  540037B5550039B55600B6E9C20015AD3B00EFFFF30015A93D0017B1420018AD
                  43001CB1460045C2690096DEAA0019B048001CB449001FB24C0044CB6E0045C1
                  6B0077D49300CCF8D9001CB54F0023B654001DB2510020B5550023B5550025B7
                  580028B85B002DBA5F002FBB5F0038BD67003ABF690046C472004CCE7A0048C4
                  73004AC57600A9EFC200E0FFEB001FB8580024B7590035BF68003EC2700042C2
                  700045C4730052C97E0054C97F005ACB83005DCC860066CF8C006CD1910070D3
                  95007DD79F007ED89F008AE5AB0086DAA60090DDAD00A1EDBD00C5F8D800D9FE
                  E7004FC97E005CCC88006DD3950070D4970079D79F0083DAA50093DEB10099E1
                  B50099E1B6009DE2B800B0F0C900B7F3CF00BDEBCF00CBF8DD00E3FCED00FAFF
                  FC00FBFFFE00FBFFFF00FFFFFF00000000000000000000000000000000000000
                  0000000010190F03050505050505050900000029302B2018160D0D0C0C0D0B08
                  0900003848372D261D9C1B011114120A0500003D5E4B42453536251C0207140C
                  0400003E6A5F5B994446339A2406130C0500003E786B6F623B543A9C2A17140C
                  0500003E8B6D69656163569C34271E150400003E8D796C739C9C9B5C432E281F
                  0E00003E82727B9C8998715A47392F2C1900003E857C7D9C83966E9460554932
                  1A00003E907F798788979574705D583C2100003F9186807E819C847A68666457
                  2200003E8E9293908F8C8A7776677559230000004E525351504F4D4C414A4031
                  000000000000000000000000000000000000}
              end
            end
            object GroupBox26: TGroupBox
              Left = 0
              Top = 41
              Width = 602
              Height = 96
              Align = alTop
              Caption = 'Despesa'
              TabOrder = 1
              object Label74: TLabel
                Left = 499
                Top = 20
                Width = 44
                Height = 13
                Caption = 'Parcelas:'
              end
              object Label77: TLabel
                Left = 10
                Top = 46
                Width = 101
                Height = 13
                Alignment = taRightJustify
                Caption = 'Tipo de Despesa:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label78: TLabel
                Left = 42
                Top = 70
                Width = 69
                Height = 13
                Alignment = taRightJustify
                Caption = 'Fornecedor:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label72: TLabel
                Left = 65
                Top = 19
                Width = 46
                Height = 13
                Alignment = taRightJustify
                Caption = 'N'#186' Doc:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label73: TLabel
                Left = 332
                Top = 19
                Width = 34
                Height = 13
                Alignment = taRightJustify
                Caption = 'Valor:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Edit3: TEdit
                Left = 117
                Top = 16
                Width = 121
                Height = 21
                TabOrder = 0
                Text = 'Edit3'
              end
              object EditHw1: TEditHw
                Left = 370
                Top = 16
                Width = 120
                Height = 21
                TabOrder = 1
                Text = '                              0,00'
                Formato = fNumber
                FormatSize = '0.2'
              end
              object edcreditoQtdeParcelas: TSpinEdit
                Left = 549
                Top = 14
                Width = 41
                Height = 22
                MaxValue = 99
                MinValue = 0
                TabOrder = 2
                Value = 0
              end
              object btGerar: TBitBtn
                Left = 498
                Top = 40
                Width = 92
                Height = 25
                Hint = 'Gerar'
                Caption = '(F6) Gerar'
                TabOrder = 7
                OnClick = btGerarClick
                Glyph.Data = {
                  36050000424D3605000000000000360400002800000010000000100000000100
                  08000000000000010000430B0000430B000000010000000100008C5A5A009C6B
                  6B00A57B73000000840084848400B58C8C0039529C00395AAD004A6BBD005A73
                  C600C6C6C6006384CE00F7E7CE00F7EFDE00FFF7E700FFFFEF00FF00FF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00101010070606
                  0606060606060607101010100805000000000000000000000710101008050D0D
                  0D0D0D0D0D0D0D000610101008050D040404040404040D000610101008050D0C
                  0C0C0C0C0C0C0D000610101008050D040404040404040D000610101008050D0D
                  0D0D0D0D0D0D0D010610101008050E0E030D0A03030A0E010610101009050F0F
                  030F030F0F030F010610101009050F0F030F0F0F0F030F020610101009050F0F
                  030F0303030A0F02061010100B0511030311031111111105061010100B051111
                  0311030303031105061010100B0511111111111111111105061010100B050505
                  050505050505050507101010100B090808080808080808081010}
              end
              object DBLookupComboBox14: TDBLookupComboBox
                Left = 189
                Top = 43
                Width = 303
                Height = 21
                Hint = 'Tipo de Despesa.'
                DataField = 'COD_TP_DESPESA'
                DataSource = DtmVeiculosCCIA.dsDespesas
                KeyField = 'COD_TP_DESPESA'
                ListField = 'DESCRICAO'
                ListSource = DtmVeiculosCCIA.dsAbreTPDespesa
                TabOrder = 4
                OnExit = DBLookupComboBox14Exit
              end
              object DBLookupComboBox15: TDBLookupComboBox
                Left = 189
                Top = 65
                Width = 303
                Height = 21
                Hint = 'Fornecedor.'
                DataField = 'COD_CLIENTE'
                DataSource = DtmVeiculosCCIA.dsDespesas
                KeyField = 'COD_CLIENTE'
                ListField = 'NOME_CLIENTE'
                ListSource = DtmVeiculosCCIA.dsFornecDespesa
                TabOrder = 6
                OnExit = DBLookupComboBox15Exit
              end
              object EditHw2: TEditHw
                Left = 117
                Top = 43
                Width = 66
                Height = 21
                TabOrder = 3
                Text = '                 0'
                OnExit = EditHw2Exit
                OnKeyDown = EditHw2KeyDown
                Formato = fInteger
                FormatSize = '0.2'
              end
              object EditHw3: TEditHw
                Left = 117
                Top = 65
                Width = 66
                Height = 21
                TabOrder = 5
                Text = '                 0'
                OnExit = EditHw3Exit
                OnKeyDown = EditHw3KeyDown
                Formato = fInteger
                FormatSize = '0.2'
              end
              object btApagarDesp: TBitBtn
                Left = 498
                Top = 68
                Width = 92
                Height = 25
                Hint = 'Apagar'
                Caption = '(F7) Apagar'
                TabOrder = 8
                OnClick = btApagarDespClick
                Glyph.Data = {
                  36050000424D3605000000000000360400002800000010000000100000000100
                  08000000000000010000430B0000430B00000001000000000000000000000000
                  80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
                  A6000020400000206000002080000020A0000020C0000020E000004000000040
                  20000040400000406000004080000040A0000040C0000040E000006000000060
                  20000060400000606000006080000060A0000060C0000060E000008000000080
                  20000080400000806000008080000080A0000080C0000080E00000A0000000A0
                  200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
                  200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
                  200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
                  20004000400040006000400080004000A0004000C0004000E000402000004020
                  20004020400040206000402080004020A0004020C0004020E000404000004040
                  20004040400040406000404080004040A0004040C0004040E000406000004060
                  20004060400040606000406080004060A0004060C0004060E000408000004080
                  20004080400040806000408080004080A0004080C0004080E00040A0000040A0
                  200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
                  200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
                  200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
                  20008000400080006000800080008000A0008000C0008000E000802000008020
                  20008020400080206000802080008020A0008020C0008020E000804000008040
                  20008040400080406000804080008040A0008040C0008040E000806000008060
                  20008060400080606000806080008060A0008060C0008060E000808000008080
                  20008080400080806000808080008080A0008080C0008080E00080A0000080A0
                  200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
                  200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
                  200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
                  2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
                  2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
                  2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
                  2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
                  2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
                  2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
                  2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FDFDFD5D5D5D
                  5D5D5D5D5D5D5D5DFDFDFDFD5EE49B9B9B9B9B9B9B9B9B9B5DFDFDFD5EE4B767
                  67AFF6F6B76767665DFDFDFD5EE467676767A466676767675DFDFDFD5EE40867
                  676767676767679D5DFDFDFD5EE4F666676767676767EF9B5DFDFDFD5EE4F6F6
                  EF67676767EFF69B5DFDFDFD5EE4FFFF1667676767AFFF9B5DFDFDFD66E4FFB7
                  676767676767FF9B5DFDFDFD66E4B767676767676767B7E45DFDFDFD66A66767
                  67671667676767E45DFDFDFDA667676767B701F6676767675DFDFDFDA6A56767
                  16FF01010D1FB7A65DFDFDFDA6E4FFFFFFFFFFFFFFFFFFE45DFDFDFDA6E4E4E4
                  E4E4E4E4E4E4E4E45DFDFDFDFDA6665E5E5E5E5E5E5E5E5EFDFD}
              end
            end
          end
        end
        object tsDetalheDespesa: TTabSheet
          Caption = 'tsDetalheDespesa'
          ImageIndex = 6
          object pnDetFatEnt: TPanel
            Left = 3
            Top = 0
            Width = 638
            Height = 465
            BevelKind = bkTile
            BevelOuter = bvNone
            TabOrder = 0
            object Panel83: TPanel
              Left = 8
              Top = 8
              Width = 617
              Height = 41
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 2
              object Label401: TLabel
                Left = 17
                Top = 12
                Width = 67
                Height = 13
                Caption = 'Valor Original:'
              end
              object Label402: TLabel
                Left = 90
                Top = 12
                Width = 56
                Height = 13
                Caption = 'R$ 100,00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlue
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label403: TLabel
                Left = 209
                Top = 12
                Width = 102
                Height = 13
                Caption = 'N'#186' Duplicata Original:'
              end
              object Label404: TLabel
                Left = 317
                Top = 12
                Width = 54
                Height = 13
                Caption = '012345-1'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlue
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label405: TLabel
                Left = 423
                Top = 12
                Width = 77
                Height = 13
                Alignment = taRightJustify
                Caption = 'Valor Pendente:'
              end
              object Label414: TLabel
                Left = 506
                Top = 12
                Width = 56
                Height = 13
                Caption = 'R$ 100,00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlue
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
              end
            end
            object Panel84: TPanel
              Left = 8
              Top = 55
              Width = 617
              Height = 154
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 3
              object DBGrid28: TDBGrid
                Left = 8
                Top = 8
                Width = 597
                Height = 105
                DataSource = dsDesp
                ReadOnly = True
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Tahoma'
                TitleFont.Style = []
                OnTitleClick = DBGrid28TitleClick
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'NumConta'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'Controles'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'Valor'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'NumDoc'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'Departamento'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'Historico'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'NomeControle'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DataReferencia'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'NChq'
                    Title.Caption = 'N'#186' Cheque'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'NominalChq'
                    Title.Caption = 'Nominal a'
                    Visible = True
                  end>
              end
              object BitBtn98: TBitBtn
                Left = 269
                Top = 119
                Width = 75
                Height = 25
                Hint = 'Alterar'
                Caption = 'Alterar'
                TabOrder = 2
                OnClick = BitBtn98Click
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
              object BitBtn99: TBitBtn
                Left = 188
                Top = 119
                Width = 75
                Height = 25
                Hint = 'Incluir'
                Caption = 'Incluir'
                TabOrder = 1
                OnClick = BitBtn99Click
                Glyph.Data = {
                  36050000424D3605000000000000360400002800000010000000100000000100
                  08000000000000010000420B0000420B00000001000000010000CE630000FFD6
                  AD00FFE7C600FFEFDE00FFEFE700FFF7EF0042B5F7008CD6F700B5DEF700FF00
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
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00090909090909
                  090909090909090909090900000000000000000000000000000009000B0B0505
                  0303030402020101010009000B0B0B050505030303020202010009000B0B0B0B
                  0505050303040201010009000B0B0B0B0B0B050503030302010009000B0B0B0B
                  0B0B0B0505030402010009000B0B0B0B0B0B0B0B050A0A0A010009000B0B0B0B
                  0B0B0B0B0B0A060A010009000B0B0B0B0B0B0B0A0A0A060A0A0A09000B0B0B0B
                  0B0B0B0A07080808070A09000B0B0B0B0B0B0B0A0A0A080A0A0A090000000000
                  00000000000A080A000009090000000000000000000A0A0A0009090909090909
                  0909090909090909090909090909090909090909090909090909}
              end
              object BitBtn100: TBitBtn
                Left = 350
                Top = 119
                Width = 75
                Height = 25
                Hint = 'Remover'
                Caption = 'Remover'
                TabOrder = 3
                OnClick = BitBtn100Click
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
            object Panel87: TPanel
              Left = 0
              Top = 215
              Width = 617
              Height = 197
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 0
              object Label418: TLabel
                Left = 291
                Top = 70
                Width = 53
                Height = 13
                Caption = 'Data Venc:'
              end
              object Label419: TLabel
                Left = 432
                Top = 32
                Width = 39
                Height = 13
                Caption = 'Grupo:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlue
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label420: TLabel
                Left = 428
                Top = 61
                Width = 43
                Height = 13
                Caption = 'Depart:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlue
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label421: TLabel
                Left = 41
                Top = 43
                Width = 48
                Height = 13
                Alignment = taRightJustify
                Caption = 'N'#186' Conta:'
              end
              object Label422: TLabel
                Left = 44
                Top = 97
                Width = 45
                Height = 13
                Caption = 'Hist'#243'rico:'
                FocusControl = DBEdit226
              end
              object Label415: TLabel
                Left = 61
                Top = 124
                Width = 28
                Height = 13
                Alignment = taRightJustify
                Caption = 'Valor:'
                FocusControl = DBEdit226
              end
              object DBText45: TDBText
                Left = 477
                Top = 32
                Width = 161
                Height = 17
                DataField = 'DESC_GR'
                DataSource = DtmVeiculosCCIA.dsPContasDesp
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlue
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object DBText46: TDBText
                Left = 477
                Top = 60
                Width = 161
                Height = 17
                DataField = 'DESC_DEP'
                DataSource = DtmVeiculosCCIA.dsPContasDesp
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlue
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label416: TLabel
                Left = 46
                Top = 70
                Width = 43
                Height = 13
                Caption = 'NumDoc:'
                FocusControl = DBEdit227
              end
              object Label417: TLabel
                Left = 44
                Top = 151
                Width = 45
                Height = 13
                Alignment = taRightJustify
                Caption = 'Controle:'
                FocusControl = DBEdit228
              end
              object Label76: TLabel
                Left = 6
                Top = 12
                Width = 83
                Height = 13
                Alignment = taRightJustify
                Caption = 'Tipo de Despesa:'
              end
              object Label84: TLabel
                Left = 33
                Top = 175
                Width = 56
                Height = 13
                Caption = 'N'#186' Cheque:'
                FocusControl = DBEdit23
              end
              object Label55: TLabel
                Left = 191
                Top = 175
                Width = 50
                Height = 13
                Caption = 'Nominal a:'
                FocusControl = DBEdit23
              end
              object DBEdit225: TDBEdit
                Left = 95
                Top = 35
                Width = 40
                Height = 21
                CharCase = ecUpperCase
                DataField = 'NumConta'
                DataSource = dsDesp
                Enabled = False
                TabOrder = 2
              end
              object DBLookupComboBox12: TDBLookupComboBox
                Left = 141
                Top = 35
                Width = 279
                Height = 21
                DataField = 'NumConta'
                DataSource = dsDesp
                Enabled = False
                KeyField = 'N_CONTA_PLC'
                ListField = 'DESC_PLC'
                ListSource = DtmVeiculosCCIA.dsPContasDesp
                TabOrder = 3
              end
              object DBEdit226: TDBEdit
                Left = 95
                Top = 89
                Width = 325
                Height = 21
                CharCase = ecUpperCase
                DataField = 'Historico'
                DataSource = dsDesp
                TabOrder = 6
              end
              object BitBtn96: TBitBtn
                Left = 428
                Top = 112
                Width = 75
                Height = 25
                Hint = 'Salvar'
                Caption = 'Salvar'
                TabOrder = 12
                OnClick = BitBtn96Click
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
              object BitBtn97: TBitBtn
                Left = 509
                Top = 112
                Width = 75
                Height = 25
                Hint = 'Cancelar'
                Caption = 'Cancelar'
                TabOrder = 13
                OnClick = BitBtn97Click
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
              object DBEdit223: TDBEdit
                Left = 95
                Top = 116
                Width = 119
                Height = 21
                CharCase = ecUpperCase
                DataField = 'Valor'
                DataSource = dsDesp
                TabOrder = 7
              end
              object DBEdit224: TDBEdit
                Left = 350
                Top = 62
                Width = 70
                Height = 21
                CharCase = ecUpperCase
                DataField = 'DataVenc'
                DataSource = dsDesp
                TabOrder = 5
              end
              object DBEdit227: TDBEdit
                Left = 95
                Top = 62
                Width = 119
                Height = 21
                CharCase = ecUpperCase
                DataField = 'NumDoc'
                DataSource = dsDesp
                TabOrder = 4
              end
              object DBEdit228: TDBEdit
                Left = 95
                Top = 143
                Width = 40
                Height = 21
                CharCase = ecUpperCase
                DataField = 'Controles'
                DataSource = dsDesp
                TabOrder = 8
                OnExit = DBEdit228Exit
              end
              object DBLookupComboBox11: TDBLookupComboBox
                Left = 143
                Top = 143
                Width = 277
                Height = 21
                DataField = 'Controles'
                DataSource = dsDesp
                KeyField = 'CODIGO_CTRL'
                ListField = 'NOME_CTRL'
                ListSource = DtmVeiculosCCIA.dsControlesDesp
                TabOrder = 9
                OnExit = DBEdit228Exit
              end
              object DBLookupComboBox13: TDBLookupComboBox
                Left = 141
                Top = 9
                Width = 279
                Height = 21
                Hint = 'Tipo de Despesa.'
                DataField = 'TipoDespesa'
                DataSource = dsDesp
                Enabled = False
                KeyField = 'COD_TP_DESPESA'
                ListField = 'DESCRICAO'
                ListSource = DtmVeiculosCCIA.dsAbreTPDespesa
                TabOrder = 1
              end
              object DBEdit22: TDBEdit
                Left = 95
                Top = 9
                Width = 40
                Height = 21
                CharCase = ecUpperCase
                DataField = 'TipoDespesa'
                DataSource = dsDesp
                Enabled = False
                TabOrder = 0
              end
              object DBEdit23: TDBEdit
                Left = 95
                Top = 170
                Width = 84
                Height = 21
                Hint = 'N'#250'mero do cheque'
                CharCase = ecUpperCase
                DataField = 'NChq'
                DataSource = dsDesp
                TabOrder = 10
              end
              object DBEdit24: TDBEdit
                Left = 247
                Top = 170
                Width = 173
                Height = 21
                Hint = 'Cheque Nominal a...'
                CharCase = ecUpperCase
                DataField = 'NominalChq'
                DataSource = dsDesp
                TabOrder = 11
              end
            end
            object Panel88: TPanel
              Left = 8
              Top = 416
              Width = 617
              Height = 41
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 1
              object BitBtn94: TBitBtn
                Left = 228
                Top = 7
                Width = 75
                Height = 25
                Hint = 'Confirmar'
                Caption = 'Confirmar'
                TabOrder = 0
                OnClick = BitBtn94Click
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
              object BitBtn95: TBitBtn
                Left = 309
                Top = 7
                Width = 75
                Height = 25
                Hint = 'Cancelar'
                Caption = 'Cancelar'
                TabOrder = 1
                OnClick = BitBtn95Click
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
            end
          end
        end
        object tsEstoque: TTabSheet
          Caption = 'tsEstoque'
          ImageIndex = 6
          object PnEstoque: TPanel
            Left = 0
            Top = 0
            Width = 546
            Height = 129
            BorderWidth = 6
            TabOrder = 0
            object Panel34: TPanel
              Left = 7
              Top = 92
              Width = 532
              Height = 30
              Align = alBottom
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 1
              object BitBtn35: TBitBtn
                Left = 268
                Top = 0
                Width = 75
                Height = 26
                Hint = 'Cancelar'
                Caption = '&Cancela'
                TabOrder = 1
                OnClick = BitBtn35Click
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
              object BitBtn19: TBitBtn
                Left = 184
                Top = 0
                Width = 75
                Height = 26
                Hint = 'OK'
                Caption = '&OK'
                Default = True
                TabOrder = 0
                OnClick = BitBtn19Click
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
            object Panel49: TPanel
              Left = 7
              Top = 7
              Width = 532
              Height = 85
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 0
              object Label22: TLabel
                Left = 21
                Top = 31
                Width = 43
                Height = 13
                Caption = 'Estoque:'
              end
              object Label85: TLabel
                Left = 23
                Top = 58
                Width = 41
                Height = 13
                Alignment = taRightJustify
                Caption = 'Tipo OP:'
              end
              object Label15: TLabel
                Left = 7
                Top = 6
                Width = 60
                Height = 13
                Alignment = taRightJustify
                Caption = 'Num NF Ent:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
              end
              object Label91: TLabel
                Left = 177
                Top = 6
                Width = 63
                Height = 13
                Alignment = taRightJustify
                Caption = 'Serie NF Ent:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
              end
              object Label93: TLabel
                Left = 356
                Top = 6
                Width = 73
                Height = 13
                Alignment = taRightJustify
                Caption = 'Modelo NF Ent:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
              end
              object lbPosicaoVeic: TLabel
                Left = 200
                Top = 31
                Width = 40
                Height = 13
                Caption = 'Posi'#231#227'o:'
              end
              object ComboBox6: TComboBox
                Left = 70
                Top = 28
                Width = 96
                Height = 21
                Style = csDropDownList
                ItemHeight = 13
                ItemIndex = 0
                TabOrder = 3
                Text = 'N - NAO'
                Items.Strings = (
                  'N - NAO'
                  'S - SIM')
              end
              object DBComboBox13: TDBComboBox
                Left = 70
                Top = 53
                Width = 459
                Height = 21
                CharCase = ecUpperCase
                DataField = 'TIPV_VEICULO'
                DataSource = DtmVeiculosCCIA.dsEstMotos
                ItemHeight = 13
                TabOrder = 5
              end
              object DBEdit3: TDBEdit
                Left = 70
                Top = 2
                Width = 96
                Height = 21
                CharCase = ecUpperCase
                DataField = 'NUM_NOTA'
                DataSource = DtmVeiculosCCIA.dsEstMotos
                Enabled = False
                TabOrder = 0
              end
              object DBEdit6: TDBEdit
                Left = 245
                Top = 2
                Width = 96
                Height = 21
                CharCase = ecUpperCase
                DataField = 'SERIE'
                DataSource = DtmVeiculosCCIA.dsEstMotos
                Enabled = False
                TabOrder = 1
              end
              object DBEdit7: TDBEdit
                Left = 433
                Top = 2
                Width = 96
                Height = 21
                CharCase = ecUpperCase
                DataField = 'MODELO_NF'
                DataSource = DtmVeiculosCCIA.dsEstMotos
                Enabled = False
                TabOrder = 2
              end
              object cbPosicaoVeic: TComboBox
                Left = 245
                Top = 28
                Width = 284
                Height = 21
                Style = csDropDownList
                ItemHeight = 13
                TabOrder = 4
                Items.Strings = (
                  'VIVO'
                  'MORTO'
                  'TRANSITO'
                  'ESTACIONAMENTO')
              end
            end
          end
        end
      end
    end
    inherited PanelFlash: TPanel
      Left = 492
      Top = 540
      Height = 569
      ExplicitLeft = 492
      ExplicitTop = 540
      ExplicitHeight = 569
      inherited bMarketingHW: TBitBtn
        Top = 547
        ExplicitTop = 547
      end
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 571
    Width = 803
    ExplicitTop = 571
    ExplicitWidth = 803
  end
  inherited pnStatusProcessamento: TPanel
    Top = 514
    ExplicitTop = 514
    inherited lbStatusProcessamento: TLabel
      ExplicitLeft = -86
      ExplicitTop = 35
    end
    inherited lbTextoProcessamento: TLabel
      Width = 477
      Height = 21
    end
  end
  inherited PopupMenu1: TPopupMenu
    Left = 564
    Top = 1
  end
  inherited PopupMenu2: TPopupMenu
    Left = 446
    Top = 65523
  end
  inherited Timer1: TTimer
    Left = 406
    Top = 65523
  end
  inherited ApplicationEventsPadrao: TApplicationEvents
    Left = 374
    Top = 65523
  end
  object dsDesp: TDataSource
    DataSet = cdsDesp
    Left = 744
  end
  object cdsDesp: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 712
    Data = {
      820100009619E0BD01000000180000000E0000000000030000008201084E756D
      436F6E746108000400000000000C446570617274616D656E746F010049000000
      01000557494454480200020020000556616C6F72080004000000010007535542
      545950450200490006004D6F6E6579000E446174615265666572656E63696104
      0006000000000009486973746F7269636F010049000000010005574944544802
      0002003C00064E756D446F630100490000000100055749445448020002001400
      09436F6E74726F6C657304000100000000000C4E6F6D65436F6E74726F6C6501
      004900000001000557494454480200020023000B5469706F4465737065736104
      000100000000000D436F64466F726E656365646F720400010000000000084461
      746156656E630400060000000000044E43687101004900000001000557494454
      48020002000A0009436F6E747242616E63010049000000010005574944544802
      00020001000A4E6F6D696E616C43687101004900000001000557494454480200
      020023000000}
    object cdsDespNumConta: TFloatField
      FieldName = 'NumConta'
    end
    object cdsDespDepartamento: TStringField
      FieldName = 'Departamento'
      Size = 32
    end
    object cdsDespValor: TCurrencyField
      FieldName = 'Valor'
      DisplayFormat = '##0.00'
    end
    object cdsDespDataReferencia: TDateField
      FieldName = 'DataReferencia'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsDespHistorico: TStringField
      FieldName = 'Historico'
      Size = 60
    end
    object cdsDespNumDoc: TStringField
      FieldName = 'NumDoc'
    end
    object cdsDespControles: TIntegerField
      DisplayLabel = 'Controle'
      FieldName = 'Controles'
    end
    object cdsDespNomeControle: TStringField
      FieldName = 'NomeControle'
      Size = 35
    end
    object cdsDespTipoDespesa: TIntegerField
      FieldName = 'TipoDespesa'
    end
    object cdsDespCodFornecedor: TIntegerField
      FieldName = 'CodFornecedor'
    end
    object cdsDespDataVenc: TDateField
      FieldName = 'DataVenc'
    end
    object cdsDespNChq: TStringField
      FieldName = 'NChq'
      Size = 10
    end
    object cdsDespContrBanc: TStringField
      FieldName = 'ContrBanc'
      Size = 1
    end
    object cdsDespNominalChq: TStringField
      FieldName = 'NominalChq'
      Size = 35
    end
  end
  object PopupMenuNFE: TPopupMenu
    Left = 523
    Top = 233
    object MenuItem1: TMenuItem
      Caption = ' Configurar colunas'
      OnClick = MenuItem1Click
    end
    object MenuItem2: TMenuItem
      Caption = 'Resetar Configura'#231#245'es de colunas'
      OnClick = MenuItem2Click
    end
    object MenuItem3: TMenuItem
      Caption = 'Salvar dados no Excel'
      OnClick = MenuItem3Click
    end
    object MenuItem4: TMenuItem
      Caption = 'Reajustar Largura das colunas'
      OnClick = MenuItem4Click
    end
    object MenuItem5: TMenuItem
      Caption = 'Copiar para '#225'rea de transfer'#234'ncia'
      OnClick = MenuItem5Click
    end
  end
  object PopupMenuNFS: TPopupMenu
    Left = 555
    Top = 233
    object MenuItem6: TMenuItem
      Caption = ' Configurar colunas'
      OnClick = MenuItem6Click
    end
    object MenuItem7: TMenuItem
      Caption = 'Resetar Configura'#231#245'es de colunas'
      OnClick = MenuItem7Click
    end
    object MenuItem8: TMenuItem
      Caption = 'Salvar dados no Excel'
      OnClick = MenuItem8Click
    end
    object MenuItem9: TMenuItem
      Caption = 'Reajustar Largura das colunas'
      OnClick = MenuItem9Click
    end
    object MenuItem10: TMenuItem
      Caption = 'Copiar para '#225'rea de transfer'#234'ncia'
      OnClick = MenuItem10Click
    end
  end
  object PopupMenuCTRE: TPopupMenu
    Left = 620
    Top = 233
    object MenuItem11: TMenuItem
      Caption = ' Configurar colunas'
      OnClick = MenuItem11Click
    end
    object MenuItem12: TMenuItem
      Caption = 'Resetar Configura'#231#245'es de colunas'
      OnClick = MenuItem12Click
    end
    object MenuItem13: TMenuItem
      Caption = 'Salvar dados no Excel'
      OnClick = MenuItem13Click
    end
    object MenuItem14: TMenuItem
      Caption = 'Reajustar Largura das colunas'
      OnClick = MenuItem14Click
    end
    object MenuItem15: TMenuItem
      Caption = 'Copiar para '#225'rea de transfer'#234'ncia'
      OnClick = MenuItem15Click
    end
  end
  object PopupMenuCTRS: TPopupMenu
    Left = 652
    Top = 233
    object MenuItem16: TMenuItem
      Caption = ' Configurar colunas'
      OnClick = MenuItem16Click
    end
    object MenuItem17: TMenuItem
      Caption = 'Resetar Configura'#231#245'es de colunas'
      OnClick = MenuItem17Click
    end
    object MenuItem18: TMenuItem
      Caption = 'Salvar dados no Excel'
      OnClick = MenuItem18Click
    end
    object MenuItem19: TMenuItem
      Caption = 'Reajustar Largura das colunas'
      OnClick = MenuItem19Click
    end
    object MenuItem20: TMenuItem
      Caption = 'Copiar para '#225'rea de transfer'#234'ncia'
      OnClick = MenuItem20Click
    end
  end
  object PopupMenuORC: TPopupMenu
    Left = 684
    Top = 233
    object MenuItem21: TMenuItem
      Caption = ' Configurar colunas'
      OnClick = MenuItem21Click
    end
    object MenuItem22: TMenuItem
      Caption = 'Resetar Configura'#231#245'es de colunas'
      OnClick = MenuItem22Click
    end
    object MenuItem23: TMenuItem
      Caption = 'Salvar dados no Excel'
      OnClick = MenuItem23Click
    end
    object MenuItem24: TMenuItem
      Caption = 'Reajustar Largura das colunas'
      OnClick = MenuItem24Click
    end
    object MenuItem25: TMenuItem
      Caption = 'Copiar para '#225'rea de transfer'#234'ncia'
      OnClick = MenuItem25Click
    end
  end
  object PopupMenuOS: TPopupMenu
    Left = 716
    Top = 233
    object MenuItem26: TMenuItem
      Caption = ' Configurar colunas'
      OnClick = MenuItem26Click
    end
    object MenuItem27: TMenuItem
      Caption = 'Resetar Configura'#231#245'es de colunas'
      OnClick = MenuItem27Click
    end
    object MenuItem28: TMenuItem
      Caption = 'Salvar dados no Excel'
      OnClick = MenuItem28Click
    end
    object MenuItem29: TMenuItem
      Caption = 'Reajustar Largura das colunas'
      OnClick = MenuItem29Click
    end
    object MenuItem30: TMenuItem
      Caption = 'Copiar para '#225'rea de transfer'#234'ncia'
      OnClick = MenuItem30Click
    end
  end
  object PopupMenuNFT: TPopupMenu
    Left = 588
    Top = 233
    object MenuItem31: TMenuItem
      Caption = ' Configurar colunas'
      OnClick = MenuItem31Click
    end
    object MenuItem32: TMenuItem
      Caption = 'Resetar Configura'#231#245'es de colunas'
      OnClick = MenuItem32Click
    end
    object MenuItem33: TMenuItem
      Caption = 'Salvar dados no Excel'
      OnClick = MenuItem33Click
    end
    object MenuItem34: TMenuItem
      Caption = 'Reajustar Largura das colunas'
      OnClick = MenuItem34Click
    end
    object MenuItem35: TMenuItem
      Caption = 'Copiar para '#225'rea de transfer'#234'ncia'
      OnClick = MenuItem35Click
    end
  end
end
