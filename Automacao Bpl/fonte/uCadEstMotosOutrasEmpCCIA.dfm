inherited frmEstMotosOutrasEmpCCIA: TfrmEstMotosOutrasEmpCCIA
  Caption = 'Estoque e Movimento Ve'#237'culos (Outras Empresas)'
  ExplicitWidth = 806
  ExplicitHeight = 598
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelFundo: TPanel
    inherited PanelLeft: TPanel
      inherited PageControl1: TPageControl
        inherited TabSheet1: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 783
          ExplicitHeight = 510
          inherited ScrollBox1: TScrollBox
            inherited PageControl3: TPageControl
              ActivePage = TabSheet_Dados
              inherited TabSheet3: TTabSheet
                ExplicitLeft = 4
                ExplicitTop = 27
                ExplicitWidth = 775
                ExplicitHeight = 431
              end
              object TabSheet_Dados: TTabSheet
                Caption = 'Dados do Ve'#237'culo'
                ImageIndex = 1
                ExplicitLeft = 0
                ExplicitTop = 0
                ExplicitWidth = 0
                ExplicitHeight = 0
                object ScrollBox4: TScrollBox
                  Left = 0
                  Top = 0
                  Width = 775
                  Height = 431
                  Align = alClient
                  BevelInner = bvNone
                  BevelOuter = bvNone
                  TabOrder = 0
                  object GroupBox4: TGroupBox
                    Left = 0
                    Top = 0
                    Width = 771
                    Height = 0
                    Align = alTop
                    Caption = 'GroupBox1'
                    TabOrder = 0
                    Visible = False
                  end
                  object PageControl2: TPageControl
                    Left = 0
                    Top = 320
                    Width = 771
                    Height = 107
                    ActivePage = TabSheet6
                    Align = alBottom
                    Style = tsFlatButtons
                    TabOrder = 1
                    Visible = False
                    object TabSheet6: TTabSheet
                      Caption = 'Kits'
                      ExplicitLeft = 0
                      ExplicitTop = 0
                      ExplicitWidth = 0
                      ExplicitHeight = 0
                      object GroupBox23: TGroupBox
                        Left = 0
                        Top = 0
                        Width = 763
                        Height = 36
                        Align = alTop
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
                          DataSource = dtmProdutos.dsProdutos
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
                        Top = 36
                        Width = 763
                        Height = 40
                        Align = alClient
                        Caption = 'Panel12'
                        TabOrder = 1
                        object DBGrid9: TDBGrid
                          Left = 1
                          Top = 1
                          Width = 761
                          Height = 38
                          Hint = 
                            'Quaisquer altera'#231#245'es em algum c'#243'digo de barras somente ser'#225' efet' +
                            'ivamente confirmada ap'#243's confirma'#231#227'o nas modifica'#231'oes do produto' +
                            '.'
                          Align = alClient
                          DataSource = dtmProdutos.dsCodBarra
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
                      ExplicitLeft = 0
                      ExplicitTop = 0
                      ExplicitWidth = 0
                      ExplicitHeight = 0
                      object GroupBox24: TGroupBox
                        Left = 0
                        Top = 0
                        Width = 763
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
                          DataSource = dtmProdutos.dsProdutos
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
                        Width = 763
                        Height = 40
                        Align = alClient
                        Caption = 'Panel12'
                        TabOrder = 1
                        object DBGrid7: TDBGrid
                          Left = 1
                          Top = 1
                          Width = 761
                          Height = 38
                          Hint = 
                            'Quaisquer altera'#231#245'es em algum c'#243'digo de barras somente ser'#225' efet' +
                            'ivamente confirmada ap'#243's confirma'#231#227'o nas modifica'#231'oes do produto' +
                            '.'
                          Align = alClient
                          DataSource = dtmProdutos.dsCodBarra
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
                    Width = 771
                    Height = 320
                    Align = alClient
                    Caption = 'Ve'#237'culos com Movimenta'#231#227'o'
                    TabOrder = 2
                    object Label33: TLabel
                      Left = 38
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
                      Left = 36
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
                      Left = 528
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
                      Left = 488
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
                      Left = 42
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
                      Left = 40
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
                      Left = 328
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
                      Left = 58
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
                      Left = 9
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
                      Left = 30
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
                      Left = 21
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
                      Left = 187
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
                      Left = 220
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
                      Left = 335
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
                      Left = 507
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
                      Left = 471
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
                      Left = 475
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
                      Left = 478
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
                      Left = 510
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
                      Left = 38
                      Top = 167
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
                      Left = 11
                      Top = 238
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
                      Left = 495
                      Top = 238
                      Width = 70
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Tipo Venda:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label25: TLabel
                      Left = 8
                      Top = 261
                      Width = 74
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Pre'#231'o Custo:'
                      FocusControl = DBEdit10
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label28: TLabel
                      Left = 29
                      Top = 285
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
                    end
                    object Label29: TLabel
                      Left = 499
                      Top = 261
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
                      Left = 283
                      Top = 261
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
                      Left = 514
                      Top = 75
                      Width = 51
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Estoque:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label27: TLabel
                      Left = 244
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
                    object DBEdit1: TDBEdit
                      Left = 84
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
                      Left = 84
                      Top = 164
                      Width = 39
                      Height = 21
                      Hint = 'Cliente do Ve'#237'culo.'
                      CharCase = ecUpperCase
                      DataField = 'COD_CLIENTE'
                      DataSource = DtmVeiculosCCIA.dsEstMotos
                      Enabled = False
                      TabOrder = 17
                    end
                    object DBLookupComboBox2: TDBLookupComboBox
                      Left = 125
                      Top = 164
                      Width = 330
                      Height = 21
                      Hint = 'Cliente do Ve'#237'culo.'
                      DataField = 'COD_CLIENTE'
                      DataSource = DtmVeiculosCCIA.dsEstMotos
                      Enabled = False
                      KeyField = 'COD_CLIENTE'
                      ListField = 'NOME_CLIENTE'
                      ListSource = DtmVeiculosCCIA.dsClientesEstMotos
                      TabOrder = 18
                    end
                    object DBEdit5: TDBEdit
                      Left = 571
                      Top = 210
                      Width = 161
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'MOTOREST'
                      DataSource = DtmVeiculosCCIA.dsEstMotos
                      TabOrder = 26
                    end
                    object DBEdit14: TDBEdit
                      Left = 84
                      Top = 95
                      Width = 39
                      Height = 21
                      Hint = 'Marca do Ve'#237'culo.'
                      CharCase = ecUpperCase
                      DataField = 'COD_MARCA'
                      DataSource = DtmVeiculosCCIA.dsEstMotos
                      Enabled = False
                      TabOrder = 8
                    end
                    object DBEdit18: TDBEdit
                      Left = 84
                      Top = 49
                      Width = 161
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'CHASSI_C'
                      DataSource = DtmVeiculosCCIA.dsEstMotos
                      TabOrder = 3
                    end
                    object DBEdit26: TDBEdit
                      Left = 368
                      Top = 49
                      Width = 87
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'PLACAEST'
                      DataSource = DtmVeiculosCCIA.dsEstMotos
                      TabOrder = 4
                    end
                    object DBEdit27: TDBEdit
                      Left = 84
                      Top = 141
                      Width = 39
                      Height = 21
                      Hint = 'Cor do Ve'#237'culo.'
                      CharCase = ecUpperCase
                      DataField = 'COD_COR'
                      DataSource = DtmVeiculosCCIA.dsEstMotos
                      TabOrder = 14
                    end
                    object DBEdit31: TDBEdit
                      Left = 84
                      Top = 72
                      Width = 39
                      Height = 21
                      Hint = 'Marca do Modelo.'
                      CharCase = ecUpperCase
                      DataField = 'VERSAOEST'
                      DataSource = DtmVeiculosCCIA.dsEstMotos
                      TabOrder = 5
                    end
                    object DBLookupComboBox3: TDBLookupComboBox
                      Left = 125
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
                    end
                    object DBLookupComboBox7: TDBLookupComboBox
                      Left = 125
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
                      Left = 125
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
                      Left = 125
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
                      Left = 84
                      Top = 118
                      Width = 39
                      Height = 21
                      Hint = 'Combust'#237'vel do Modelo.'
                      CharCase = ecUpperCase
                      DataField = 'COD_COMBUSTIVEL'
                      DataSource = DtmVeiculosCCIA.dsEstMotos
                      Enabled = False
                      TabOrder = 11
                    end
                    object DBEdit11: TDBEdit
                      Left = 84
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
                      Left = 84
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
                      Left = 244
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
                      Left = 244
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
                      Left = 390
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
                      Left = 571
                      Top = 188
                      Width = 161
                      Height = 21
                      DataField = 'RENAVAMEST'
                      DataSource = DtmVeiculosCCIA.dsEstMotos
                      TabOrder = 23
                    end
                    object DBComboBox2: TDBComboBox
                      Left = 571
                      Top = 95
                      Width = 161
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
                      Left = 571
                      Top = 164
                      Width = 161
                      Height = 21
                      Hint = 'Esp'#233'cie V'#233'iculo.'
                      DataField = 'COD_ESPE_SEG'
                      DataSource = DtmVeiculosCCIA.dsEstMotos
                      KeyField = 'CODIGO_ESP'
                      ListField = 'DESCRICAO_ESP'
                      ListSource = DtmVeiculosCCIA.dsEspecieEstMotos
                      TabOrder = 19
                    end
                    object ComboBox4: TComboBox
                      Left = 571
                      Top = 118
                      Width = 161
                      Height = 21
                      Enabled = False
                      ItemHeight = 13
                      TabOrder = 13
                      Text = 'ComboBox4'
                      Items.Strings = (
                        '01 - PASSAGEIRO'
                        '02 - CARGA'
                        '03 - MISTO'
                        '04 - CORRIDA'
                        '05 - TRA'#199#195'O'
                        '06 - ESPECIAL')
                    end
                    object ComboBox5: TComboBox
                      Left = 571
                      Top = 141
                      Width = 161
                      Height = 21
                      Enabled = False
                      ItemHeight = 13
                      TabOrder = 16
                      Text = 'ComboBox5'
                      Items.Strings = (
                        '04 - MOTOCICLO'
                        '03 - MOTONETA'
                        '05 - TRICICLO'
                        '02 - CICLOMOTO'
                        '')
                    end
                    object DBComboBox3: TDBComboBox
                      Left = 571
                      Top = 26
                      Width = 161
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
                    end
                    object DBLookupComboBox1: TDBLookupComboBox
                      Left = 128
                      Top = 234
                      Width = 327
                      Height = 21
                      Hint = 'Cliente do Ve'#237'culo.'
                      DataField = 'COD_FORNECEDOR'
                      DataSource = DtmVeiculosCCIA.dsEstMotos
                      KeyField = 'COD_CLIENTE'
                      ListField = 'NOME_CLIENTE'
                      ListSource = DtmVeiculosCCIA.dsFornecedorEstMotos
                      TabOrder = 28
                    end
                    object DBEdit2: TDBEdit
                      Left = 84
                      Top = 234
                      Width = 39
                      Height = 21
                      Hint = 'Fornecedor do Ve'#237'culo.'
                      CharCase = ecUpperCase
                      DataField = 'COD_FORNECEDOR'
                      DataSource = DtmVeiculosCCIA.dsEstMotos
                      TabOrder = 27
                    end
                    object DBComboBox1: TDBComboBox
                      Left = 571
                      Top = 234
                      Width = 161
                      Height = 21
                      Hint = 'Tipo de Contrato'
                      Style = csDropDownList
                      DataField = 'TIPV_VEICULO'
                      DataSource = DtmVeiculosCCIA.dsEstMotos
                      ItemHeight = 13
                      Items.Strings = (
                        'V - VENDA'
                        'C - CONSIGNADO'
                        'I - INTERMEDIACAO')
                      TabOrder = 29
                    end
                    object DBEdit10: TDBEdit
                      Left = 84
                      Top = 258
                      Width = 110
                      Height = 21
                      Hint = 'HP.'
                      CharCase = ecUpperCase
                      DataField = 'PRECO_CUSTO'
                      DataSource = DtmVeiculosCCIA.dsEstMotos
                      TabOrder = 30
                    end
                    object DBEdit13: TDBEdit
                      Left = 84
                      Top = 282
                      Width = 161
                      Height = 21
                      Hint = 'HP.'
                      CharCase = ecUpperCase
                      DataField = 'COM_ENT'
                      DataSource = DtmVeiculosCCIA.dsEstMotos
                      TabOrder = 33
                    end
                    object DBEdit15: TDBEdit
                      Left = 571
                      Top = 258
                      Width = 161
                      Height = 21
                      Hint = 'HP.'
                      CharCase = ecUpperCase
                      DataField = 'PERC_RED'
                      DataSource = DtmVeiculosCCIA.dsEstMotos
                      TabOrder = 32
                    end
                    object DBComboBox5: TDBComboBox
                      Left = 390
                      Top = 257
                      Width = 65
                      Height = 21
                      Hint = 'Tipo de Contrato'
                      DataField = 'RED_LUCRO'
                      DataSource = DtmVeiculosCCIA.dsEstMotos
                      ItemHeight = 13
                      Items.Strings = (
                        'SIM'
                        'N'#195'O')
                      TabOrder = 31
                    end
                    object DBComboBox6: TDBComboBox
                      Left = 571
                      Top = 72
                      Width = 161
                      Height = 21
                      Hint = 'Estoque'
                      CharCase = ecUpperCase
                      DataField = 'ESTOQUE'
                      DataSource = DtmVeiculosCCIA.dsEstMotos
                      ItemHeight = 13
                      Items.Strings = (
                        'SIM'
                        'TERCEIRO'
                        'OUTRAS CONCESSIONARIAS')
                      TabOrder = 7
                    end
                    object DBComboBox7: TDBComboBox
                      Left = 294
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
                    end
                  end
                end
              end
            end
            inherited Panel3: TPanel
              inherited BitBtn4: TBitBtn
                Hint = 'Salvar Registro -  [VEI067]'
              end
              inherited BitBtn5: TBitBtn
                Hint = 'Cancelar Registro'
              end
              inherited BitBtn6: TBitBtn
                Hint = 'Sair'
              end
            end
          end
        end
        inherited TabSheet2: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 783
          ExplicitHeight = 510
          inherited GroupBox3: TGroupBox
            Height = 264
            ExplicitHeight = 264
            inherited imgInformation: TImage
              Height = 247
              ExplicitHeight = 192
            end
            object imgInformationTipoOP: TImage [6]
              Left = 733
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
            inherited BitBtn1: TBitBtn
              Hint = 'Clique para pesquisar - [VEI064]'
            end
            inherited BitBtn3: TBitBtn
              Hint = 'Reserva - [VEI068]'
              Caption = '&Reservar'
              Visible = False
              Glyph.Data = {
                36030000424D3603000000000000360000002800000010000000100000000100
                18000000000000030000C30E0000C30E00000000000000000000FF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB4C69BB4C6
                9BFF00FFFF00FFFF00FF8A8A8A67676767676767676767676767676767676767
                67679E9E9E83A94E83A94E6E9A2F83A94E83A94E83A94EFF00FF676767FFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFF00FF83A94E749D3FFFFFFF749C
                3E83A94E83A94EFF00FF676767FFFFFFA9A9A9FFFFFFFFFFFFA9A9A9FFFFFFF1
                F1F1AABF8CFFFFFFFCFDFCFFFFFFF6F8F2749C3E83A94EB8C8A1676767FFFFFF
                A9A9A9FFFFFFFFFFFFA9A9A9FFFFFFF1F1F1ABC08E749C3FFFFFFF749C3EFFFF
                FFFFFFFF749C3EB8C8A1676767FFFFFFB6B6B6A9A9A9A9A9A9AD8966A9835CAA
                855FFF00FF83A94E83A94E83A94E83A94EFFFFFF749C3EFF00FF676767FFFFFF
                A9A9A9FFFFFFFFFFFFA9835CFEECCDFEECCDF2E7D583A94E83A94E83A94E83A9
                4E6E9A2F83A94EFF00FF686868FFFFFFA9A9A9FFFFFFFFFFFFA9835CFEECCDFE
                ECCDFEECCDF2F2F2FF00FFACC08FABC08EFF00FF9C9C9CFF00FF686868FFFFFF
                B6B6B6A9A9A9A9A9A9AD8966A9835CA9835CA9835CA9A9A9AAAAAAC1C1C1C9C9
                C9FEFEFE676767FF00FF686868FFFFFFFFFFFFFFFFFFFFFFFFA9A9A9FFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFA9A9A9FFFFFF676767FF00FF686868FFFFFF
                FFFFFFFFFFFFFFFFFFA9A9A9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA9A9
                A9FFFFFF676767FF00FF686868FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF676767FF00FFB2783EB3783E
                B3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB378
                3EB3783EB3783EFF00FFB3783EB3783EB3783EFF00FFFF00FFB3783EB3783EB3
                783EB3783EFF00FFFF00FFFF00FFB3783EB3783EB3783EFF00FFB3783EB3783E
                B3783E696969696969B3783EB3783EB3783EB3783EFF00FF696969FF00FFB378
                3EB3783EB3783EFF00FFFF00FFFF00FFFF00FF696969696969FF00FFFF00FFFF
                00FFFF00FFFF00FF696969FF00FFFF00FFFF00FFFF00FFFF00FF}
            end
            inherited CheckBox1: TCheckBox
              Left = 353
              ExplicitLeft = 353
            end
            object groupAvancadas: TGroupBox
              Left = 2
              Top = 88
              Width = 487
              Height = 176
              Caption = 'Op'#231#245'es Avan'#231'adas'
              TabOrder = 11
              Visible = False
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
                  ExplicitLeft = 1
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
                  Top = 104
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
              object GroupBox28: TGroupBox
                Left = 116
                Top = 13
                Width = 159
                Height = 161
                Caption = 'Status'
                TabOrder = 1
                object Label16: TLabel
                  Left = 44
                  Top = 54
                  Width = 40
                  Height = 13
                  Caption = 'Reserva'
                end
                object Label17: TLabel
                  Left = 15
                  Top = 77
                  Width = 69
                  Height = 13
                  Caption = 'Demonstra'#231#227'o'
                end
                object Label18: TLabel
                  Left = 9
                  Top = 100
                  Width = 75
                  Height = 13
                  Caption = 'Usado na Troca'
                end
                object Label20: TLabel
                  Left = 34
                  Top = 121
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
                  ExplicitWidth = 108
                end
                object cbReserva: TComboBox
                  Left = 97
                  Top = 51
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
                  Top = 74
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
                  Top = 119
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
                  Top = 97
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
              Left = 491
              Top = 88
              Width = 270
              Height = 115
              Caption = 'Pesquisa Adicional'
              TabOrder = 12
              Visible = False
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
                ItemHeight = 0
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
            object ckNovo: TCheckBox
              Left = 465
              Top = 41
              Width = 81
              Height = 15
              Caption = 'Novo [F11]'
              TabOrder = 13
            end
            object ckUsado: TCheckBox
              Left = 465
              Top = 58
              Width = 81
              Height = 14
              Caption = 'Usado[F12]'
              TabOrder = 14
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
              TabOrder = 15
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
              TabOrder = 16
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
              TabOrder = 17
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
              TabOrder = 18
            end
            object ckDeposito: TCheckBox
              Left = 465
              Top = 73
              Width = 88
              Height = 15
              Caption = 'Deposito [F7]'
              TabOrder = 19
            end
          end
          inherited Panel1: TPanel
            Top = 264
            Height = 246
            ExplicitTop = 264
            ExplicitHeight = 246
            inherited Splitter1: TSplitter
              Height = 185
              ExplicitHeight = 229
            end
            inherited DBGrid1: TDBGrid
              Height = 185
              OnDrawColumnCell = DBGrid1DrawColumnCell
              OnKeyDown = DBGrid1KeyDown
            end
            inherited Panel2: TPanel
              Visible = False
              inherited SpeedButton1: TSpeedButton
                Hint = 'Editar Registro - [VEI060]'
              end
              inherited SpeedButton2: TSpeedButton
                Hint = 'Apagar Registro - [VEI085]'
              end
              inherited SpeedButton3: TSpeedButton
                Visible = False
              end
              inherited SpeedButton4: TSpeedButton
                Left = 634
                Top = 3
                Visible = False
                ExplicitLeft = 634
                ExplicitTop = 3
              end
              inherited SpeedButton5: TSpeedButton
                Left = 691
                Visible = False
                ExplicitLeft = 691
              end
              inherited SpeedButton7: TSpeedButton [5]
                Left = 352
                Top = 3
                Hint = 'Dados Reais - [VEI066]'
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
                ExplicitLeft = 352
                ExplicitTop = 3
              end
              inherited SpeedButton8: TSpeedButton [6]
                Left = 295
                Hint = 'Reserva - [VEI068]'
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
                ExplicitLeft = 295
              end
              inherited SpeedButton12: TSpeedButton [7]
                Left = 406
                Hint = 'Movimento Ve'#237'culos - [VEI033]'
                Glyph.Data = {
                  F6060000424DF606000000000000360000002800000018000000180000000100
                  180000000000C0060000C30E0000C30E00000000000000000000FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFB3C7977EA8407DA83F79A43977A33676A33677A3
                  3677A33677A33676A33677A33677A33676A33677A33679A4397DA83F7EA840B7
                  C99DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7DA83F7BA53D77A338ABC683
                  BED29FBED39FBCD19DBED2A0C2D5A6C4D8A8BED2A0BCD19DBED39FBED29FAFC9
                  8979A4397BA53D7BA53DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7DA83F77
                  A33A6E9D2AFAFBF8FEFEFEFFFFFFFEFEFEF9FAF8B3CC91B3CC90F8FAF4FEFEFE
                  FFFFFFFEFEFEFEFEFE6F9E2A77A33A7BA53DFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FF7AA53B9CBD6EE8EFDDFFFFFFFFFFFFFFFFFFF5F9F275A23477A33677
                  A33674A233F4F8F0FFFFFFFFFFFFFFFFFFE9F0DF9FBD717AA53BFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FF76A336C3D5A6FEFEFEFFFFFFFCFCFCFFFFFFAAC4
                  8076A2377BA53E7DA83F76A237A5C37DFFFFFFFCFCFCFCFCFCFFFFFFC6D9AC75
                  A235FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF76A336C0D4A2FEFEFEFFFFFF
                  FCFCFCFFFFFF86AD4F7AA43C7BA53E7DA83F7AA43C83AC4AFFFFFFFCFCFCFCFC
                  FCFFFFFFC3D6A875A235FF00FFFF00FFFF00FFFF00FFB98E62FF00FF76A336C0
                  D4A2FFFFFFFFFFFFFFFFFFFFFFFF86AD4E7BA63C7DA83F7DA83F7BA63D84AC4A
                  FFFFFFFFFFFFFFFFFFFFFFFFC3D6A876A336FF00FFFF00FFFF00FFB88D60AD76
                  3DFF00FF76A336C3D6A6FEFEFEFFFFFFFCFCFCFFFFFFAAC48276A2367BA53E7D
                  A83F76A237A6C37DFFFFFFFCFCFCFDFDFDFFFFFFCADBAF75A235B57D47B67F48
                  FFFFFFAD753CAD753DFF00FF7AA53B9ABB6AE1EAD4FFFFFFFCFCFCFFFFFFF4F8
                  F175A23675A23677A33674A234F3F7EFFFFFFFFDFDFDFEFEFE99BB697AA43B7B
                  A53EB3793FB47A40F4EBE3BF9468AD753CFF00FF7DA83F7AA53B6D9D27FAFBF6
                  FFFFFFFFFFFFFFFFFFFBFCFAB6CD93B4CD92FAFBF6FFFFFFFFFFFFFFFFFFC1D6
                  A473A1317CA63E7DA83FB3793FB47A40D8BA9CF6F0EABF9468FF00FF7DA83F7B
                  A53D77A338ABC684BED29FBED39DBCD19DBED2A0C2D5A6C3D8A6BED2A0BCD19D
                  BED39DBFD3A293B6627BA53C7BA53D7BA53DB3793FB47A40B2783ED8BA9CF4EB
                  E3FF00FFAFC5917DA83F7DA83F79A43977A33676A33677A33677A33677A33676
                  A33677A33677A33676A33677A3367BA53C7DA83F7DA83FB3C696B3793FB3783E
                  B3783EB3783EB3783EBF946AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFB47C43DBBFA4FFFFFFFEFEFEFEFEFEFEFEFEB3783FC8A98BB3783EB3783E
                  B2773DB2773DB2773DB3783EB2773DB2773DB3783EB2773DB2773DB3783EB277
                  3DB2773DFF00FFFF00FFBF946AEFE3D7FFFFFFFFFFFFFEFEFEFEFEFEB37940C9
                  AA8BB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783E
                  B3783EB3783EB3783EB3783EFF00FFFF00FFD5C6B7D0AC89FDFDFDFFFFFFFDFD
                  FDFDFDFDB37940C8A98BB3783EB3783EB2773DB2773DB2773DB3783EB2773DB2
                  773DB3783EB2773DB2773DB3783EB2773DB2773DFF00FFFF00FFFF00FFBE9164
                  F2E9E1FFFFFFFEFEFEFEFEFEB3793FC8A98BB3783EB3783EB2773DB2773DB277
                  3DB3783EB2773DB2773DB3783EB2773DB2773DB3783EB2773DB2773DFF00FFFF
                  00FFFF00FFD1BDA8B3793FB37940B37940B37940B3783ECDB49BB3783EB3783E
                  B2773DB2773DB2773DB3783EB2773DB2773DB3783EB2773DB2773DB3783EB277
                  3DB2773DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783E
                  B3783EB3783EB3783EB3783EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFB3783EB3783EB2773DB2773DB2773DB3783EB2773DB2
                  773DB3783EB2773DB2773DB3783EB2773DB2773DFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB3783EB3783EB2773DB2773DB277
                  3DB3783EB2773DB2773DB3783EB2773DB2773DB3783EB2773DB2773DFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB3783EB3783E
                  B2773DB2773DB2773DB3783EB2773DB2773DB3783EB2773DB2773DB3783EB277
                  3DB2773DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFC5A280B37940B2773DB2773DB2773DB3783EB2773DB2773DB3783EB2773D
                  B2773DB3783EB2773DBE946AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                ExplicitLeft = 406
              end
              inherited SpeedButton23: TSpeedButton [8]
                Left = 463
                Visible = False
                ExplicitLeft = 463
              end
              inherited SpeedButton24: TSpeedButton [9]
                Left = 520
                Visible = False
                ExplicitLeft = 520
              end
              inherited SpeedButton25: TSpeedButton [10]
                Left = 634
                Visible = False
                ExplicitLeft = 634
              end
              inherited SpeedButton26: TSpeedButton [11]
                Left = 577
                Visible = False
                ExplicitLeft = 577
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
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FF7F7F7F5B5B5B565656565656565656
                  5656565656565656565656565656565656565656565656565656565656565656
                  565656565B5B5B7B7B7BFF00FFFF00FFFF00FFFF00FFFF00FF5A5A5AFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5B5B5BFF00FFFF00FFFF00FFFF00FFFF00
                  FF565656FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF565656FF00FFFF00FF
                  FF00FFFF00FFFF00FF565656FFFFFFFFFFFF8D8D8D8D8D8D8D8D8D8D8D8D8D8D
                  8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8DFFFFFFFFFFFF56
                  5656FF00FFFF00FFFF00FFFF00FFFF00FF565656FFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFF565656FF00FFFF00FFFF00FFFF00FFFF00FFB6B6B6EDEDEDFC
                  FCFC8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D
                  8D8D8D8D8D8D8D8D8DFFFFFFFFFFFF565656FF00FFFF00FFFF00FF85AD4B85AD
                  4B85AD4BFF00FFFF00FFFCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF565656FF00FFFF00FF
                  FF00FFFF00FF85AD4B85AD4B85AD4BFF00FFFF00FF9292928D8D8D8D8D8D8D8D
                  8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8DFFFFFFFEFEFE56
                  5656FF00FFFF00FFFF00FFFF00FFFF00FF85AD4B85AD4B85AD4BFF00FFFF00FF
                  FCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFDFDFD56565685AD4B85AD4B85AD4B85AD4B85AD4B85AD4B85AD4B85
                  AD4B85AD4BFF00FFFF00FF9292928D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D
                  8D8D8D8D8D8D8D8D8DFFFFFFFDFDFD56565685AD4B85AD4B85AD4B85AD4B85AD
                  4B85AD4B85AD4B85AD4B85AD4B85AD4BFF00FFEFEFEFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFD56565685AD4B85AD4B
                  85AD4B85AD4B85AD4B85AD4B85AD4B85AD4B85AD4BFF00FFFF00FFA9A9A98D8D
                  8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8DFFFFFFFDFDFD56
                  5656FF00FFFF00FFFF00FFFF00FFFF00FF85AD4B85AD4B85AD4BFF00FFFF00FF
                  F2F2F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFDFDFD565656FF00FFFF00FFFF00FFFF00FF85AD4B85AD4B85AD4BFF
                  00FFFF00FFAEAEAE8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D
                  8D8D8D8D8D8D8D8D8DFFFFFFFDFDFD565656FF00FFFF00FFFF00FF85AD4B85AD
                  4B85AD4BFF00FFFF00FFF2F2F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFEFEFEFEFEFEFEFEFEFEFEFEFCFCFC5B5B5BFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFF2F2F28D8D8D8D8D8D8D8D8D8D8D8D8D8D
                  8D8D8D8D8D8D8D8D8D8DFFFFFFFFFFFFFEFEFEFEFEFEFEFEFEFEFEFEFCFCFC5B
                  5B5BFF00FFFF00FFFF00FFFF00FFFF00FF777777FBFBFBFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5656565656565656
                  565656565656565B5B5BFF00FFFF00FFFF00FFFF00FFFF00FF565656FFFFFFFF
                  FFFF8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8DFFFFFFFFFFFF
                  565656FDFDFDFFFFFFFFFFFFBEBEBE696969FF00FFFF00FFFF00FFFF00FFFF00
                  FF565656FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFF565656FDFDFDFFFFFFBFBFBF696969FF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FF565656FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF565656FDFDFDC2C2C2696969FF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FF5A5A5AFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5B5B5BC1C1C16969
                  69FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7F7F7F5B5B5B56
                  5656565656565656565656565656565656565656565656565656565656565656
                  5B5B5B6E6E6EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                Layout = blGlyphTop
                ParentFont = False
                ExplicitLeft = 178
              end
            end
            inherited GroupBox2: TGroupBox
              Height = 185
              ExplicitHeight = 185
              inherited ScrollBox2: TScrollBox
                Height = 168
                ExplicitHeight = 168
              end
            end
          end
        end
        inherited tsMemo: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 783
          ExplicitHeight = 510
        end
      end
    end
  end
  inherited PopupMenu1: TPopupMenu
    Left = 308
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
end
