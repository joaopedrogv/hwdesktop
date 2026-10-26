inherited frmCadModeloCartas: TfrmCadModeloCartas
  Left = 301
  Top = 103
  Caption = 'Modelos de Cartas'
  ExplicitWidth = 806
  ExplicitHeight = 595
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
              ActivePage = TabSheet6
              inherited TabSheet3: TTabSheet
                ExplicitLeft = 4
                ExplicitTop = 27
                ExplicitWidth = 775
                ExplicitHeight = 431
                inherited ScrollBox3: TScrollBox
                  inherited GroupBox1: TGroupBox
                    Width = 754
                    Height = 432
                    Caption = ''
                    ParentBackground = False
                    ExplicitWidth = 754
                    ExplicitHeight = 432
                    object Label6: TLabel
                      Left = 85
                      Top = 16
                      Width = 37
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Codigo:'
                      FocusControl = DBEdit1
                    end
                    object Label7: TLabel
                      Left = 72
                      Top = 44
                      Width = 50
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Descri'#231#227'o:'
                      FocusControl = DBEdit2
                    end
                    object Label8: TLabel
                      Left = 88
                      Top = 132
                      Width = 34
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Dados:'
                    end
                    object Label14: TLabel
                      Left = 63
                      Top = 72
                      Width = 59
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Formul'#225'rios:'
                      FocusControl = DBEdit2
                    end
                    object Label15: TLabel
                      Left = 98
                      Top = 101
                      Width = 24
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Tipo:'
                      FocusControl = DBEdit2
                    end
                    object DBEdit1: TDBEdit
                      Left = 128
                      Top = 13
                      Width = 134
                      Height = 21
                      DataField = 'COD_CARTA'
                      DataSource = DtmCadBasicos.dsModCartas
                      Enabled = False
                      TabOrder = 0
                    end
                    object DBEdit2: TDBEdit
                      Left = 128
                      Top = 41
                      Width = 399
                      Height = 21
                      DataField = 'DESCRICAO'
                      DataSource = DtmCadBasicos.dsModCartas
                      TabOrder = 1
                    end
                    object BitBtn7: TBitBtn
                      Left = 20
                      Top = 153
                      Width = 104
                      Height = 33
                      Hint = 'Abrir Editor de Modelos de Cartas - [BAS295]'
                      Caption = 'Abrir &Editor'
                      TabOrder = 4
                      OnClick = BitBtn7Click
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
                    object vRichEditDadosCarta: TRichEdit
                      Left = 128
                      Top = 131
                      Width = 611
                      Height = 295
                      ReadOnly = True
                      ScrollBars = ssVertical
                      TabOrder = 5
                    end
                    object DBComboBox1: TDBComboBox
                      Left = 128
                      Top = 69
                      Width = 399
                      Height = 21
                      Style = csDropDownList
                      DataField = 'FORMULARIOS'
                      DataSource = DtmCadBasicos.dsModCartas
                      ItemHeight = 13
                      Items.Strings = (
                        ''
                        'CONTRATO DE COMPRA DE VEICULOS'
                        'CONTRATO DE CONSIGNACAO'
                        'CONTRATO VENDA DE NOVOS'
                        'CONTRATO VENDA DE USADOS'
                        'INTERMEDIACAO VENDA DE USADOS'
                        'INTERMEDIACAO VENDA DE ZERO KM')
                      TabOrder = 2
                      OnKeyPress = DBComboBox1KeyPress
                    end
                    object DBComboBox2: TDBComboBox
                      Left = 128
                      Top = 97
                      Width = 399
                      Height = 21
                      Style = csDropDownList
                      DataField = 'TIPO_CONTRATO'
                      DataSource = DtmCadBasicos.dsModCartas
                      ItemHeight = 13
                      Items.Strings = (
                        ''
                        'RESERVA DE DOM'#205'NIO'
                        'VE'#205'CULO USADO NA TROCA'
                        'VE'#205'CULO RODANDO'
                        'VE'#205'CULO USADO NA TROCA E RODANDO'
                        'TERMO DE COMPROMISSO'
                        'CONTROLE INTERNO')
                      TabOrder = 3
                      OnKeyPress = DBComboBox2KeyPress
                    end
                  end
                end
              end
              object TabSheet5: TTabSheet
                Caption = 'TabSheet5'
                ImageIndex = 1
                object GroupBox4: TGroupBox
                  Left = 0
                  Top = 0
                  Width = 775
                  Height = 431
                  Align = alClient
                  TabOrder = 0
                  object Panel4: TPanel
                    Left = 2
                    Top = 15
                    Width = 771
                    Height = 103
                    Align = alTop
                    BevelOuter = bvNone
                    TabOrder = 0
                    object Label16: TLabel
                      Left = 102
                      Top = 16
                      Width = 37
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Codigo:'
                      FocusControl = DBEdit3
                    end
                    object Label18: TLabel
                      Left = 115
                      Top = 78
                      Width = 24
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Tipo:'
                    end
                    object Label17: TLabel
                      Left = 89
                      Top = 46
                      Width = 50
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Descri'#231#227'o:'
                      FocusControl = DBEdit6
                    end
                    object SpeedButton15: TSpeedButton
                      Left = 550
                      Top = 42
                      Width = 83
                      Height = 22
                      Hint = 'Inserir Tag'
                      Caption = 'Tag'
                      Glyph.Data = {
                        36050000424D3605000000000000360400002800000010000000100000000100
                        08000000000000010000130B0000130B000000010000000100002184290039B5
                        520063A563006BAD840094DE8C00FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00050505050505
                        0505050505050505050505050505050503000003050505050505050505050505
                        0204010005050505050505050505050502040100050505050505050505050505
                        0204010005050505050505050505050502040100050505050505050300000000
                        0004010000000000030505020101010101010101010101010005050204040404
                        0404010404040404000505030202020202040100000000000305050505050505
                        0204010005050505050505050505050502040100050505050505050505050505
                        0204010005050505050505050505050502040100050505050505050505050505
                        0302020305050505050505050505050505050505050505050505}
                      OnClick = SpeedButton15Click
                    end
                    object SpeedButton16: TSpeedButton
                      Left = 639
                      Top = 42
                      Width = 83
                      Height = 22
                      Hint = 'Inserir Campo'
                      Caption = 'Campo'
                      Glyph.Data = {
                        36050000424D3605000000000000360400002800000010000000100000000100
                        08000000000000010000130B0000130B000000010000000100002184290039B5
                        520063A563006BAD840094DE8C00FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00050505050505
                        0505050505050505050505050505050503000003050505050505050505050505
                        0204010005050505050505050505050502040100050505050505050505050505
                        0204010005050505050505050505050502040100050505050505050300000000
                        0004010000000000030505020101010101010101010101010005050204040404
                        0404010404040404000505030202020202040100000000000305050505050505
                        0204010005050505050505050505050502040100050505050505050505050505
                        0204010005050505050505050505050502040100050505050505050505050505
                        0302020305050505050505050505050505050505050505050505}
                      OnClick = SpeedButton16Click
                    end
                    object DBEdit3: TDBEdit
                      Left = 145
                      Top = 13
                      Width = 134
                      Height = 21
                      DataField = 'COD_CARTA'
                      DataSource = DtmCadBasicos.dsModCartas
                      Enabled = False
                      TabOrder = 0
                    end
                    object DBComboBox3: TDBComboBox
                      Left = 145
                      Top = 75
                      Width = 399
                      Height = 21
                      Style = csDropDownList
                      DataField = 'TIPO_CONTRATO'
                      DataSource = DtmCadBasicos.dsModCartas
                      ItemHeight = 13
                      Items.Strings = (
                        ''
                        'AVISO DE VENCIMENTO'
                        'CREDITOS EM ATRASO'
                        'AGRADECIMENTO')
                      TabOrder = 2
                      OnKeyPress = DBComboBox3KeyPress
                    end
                    object DBEdit6: TDBEdit
                      Left = 145
                      Top = 43
                      Width = 399
                      Height = 21
                      DataField = 'DESCRICAO'
                      DataSource = DtmCadBasicos.dsModCartas
                      TabOrder = 1
                    end
                    object DBCheckBox1: TDBCheckBox
                      Left = 597
                      Top = 15
                      Width = 97
                      Height = 17
                      Caption = 'Usar no servi'#231'o'
                      DataField = 'USAR_SERVICO'
                      DataSource = DtmCadBasicos.dsModCartas
                      TabOrder = 3
                      ValueChecked = 'S'
                      ValueUnchecked = 'N'
                    end
                  end
                  object Panel5: TPanel
                    Left = 2
                    Top = 118
                    Width = 771
                    Height = 32
                    Align = alTop
                    BevelOuter = bvNone
                    TabOrder = 1
                    object Label19: TLabel
                      Left = 89
                      Top = 7
                      Width = 50
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Aplicativo:'
                    end
                    object DBLookupComboBox1: TDBLookupComboBox
                      Left = 145
                      Top = 5
                      Width = 399
                      Height = 21
                      DataField = 'ID_MSG_APLICATIVO'
                      DataSource = DtmCadBasicos.dsModCartas
                      Enabled = False
                      KeyField = 'ID'
                      ListField = 'APLICATIVO'
                      ListSource = DtmCadBasicos.dsAplicativo
                      TabOrder = 0
                    end
                  end
                  object Panel8: TPanel
                    Left = 2
                    Top = 182
                    Width = 771
                    Height = 32
                    Align = alTop
                    BevelOuter = bvNone
                    TabOrder = 3
                    object Label20: TLabel
                      Left = 91
                      Top = 7
                      Width = 48
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Template:'
                    end
                    object DBComboBox7: TDBComboBox
                      Left = 145
                      Top = 4
                      Width = 399
                      Height = 21
                      Style = csDropDownList
                      DataField = 'TEMPLATE'
                      DataSource = DtmCadBasicos.dsModCartas
                      ItemHeight = 13
                      TabOrder = 0
                      OnExit = DBComboBox7Exit
                    end
                  end
                  object PageControl2: TPageControl
                    Left = 2
                    Top = 214
                    Width = 771
                    Height = 215
                    ActivePage = tsMarkdown
                    Align = alClient
                    Style = tsFlatButtons
                    TabOrder = 4
                    object tsHtml: TTabSheet
                      Caption = 'tsHtml'
                      object Panel6: TPanel
                        Left = 0
                        Top = 0
                        Width = 763
                        Height = 184
                        Align = alClient
                        BevelOuter = bvNone
                        TabOrder = 0
                        object Panel78: TPanel
                          Left = 139
                          Top = 20
                          Width = 624
                          Height = 164
                          Align = alClient
                          BevelKind = bkTile
                          BevelOuter = bvNone
                          TabOrder = 0
                          object WebBrowser1: TWebBrowser
                            Left = 0
                            Top = 0
                            Width = 620
                            Height = 160
                            Align = alClient
                            TabOrder = 0
                            ExplicitTop = 5
                            ExplicitWidth = 643
                            ExplicitHeight = 206
                            ControlData = {
                              4C00000014400000891000000000000000000000000000000000000000000000
                              000000004C000000000000000000000001000000E0D057007335CF11AE690800
                              2B2E126208000000000000004C0000000114020000000000C000000000000046
                              8000000000000000000000000000000000000000000000000000000000000000
                              00000000000000000100000000000000000000000000000000000000}
                          end
                        end
                        object Panel99: TPanel
                          Left = 0
                          Top = 20
                          Width = 139
                          Height = 164
                          Align = alLeft
                          BevelOuter = bvNone
                          TabOrder = 1
                          object Label423: TLabel
                            Left = 101
                            Top = 3
                            Width = 34
                            Height = 13
                            Caption = 'Dados:'
                            Font.Charset = DEFAULT_CHARSET
                            Font.Color = clWindowText
                            Font.Height = -11
                            Font.Name = 'MS Sans Serif'
                            Font.Style = []
                            ParentFont = False
                          end
                          object BitBtn10: TBitBtn
                            Left = 2
                            Top = 26
                            Width = 131
                            Height = 33
                            Hint = 'Abrir Html'
                            Caption = 'Abrir Html'
                            TabOrder = 0
                            OnClick = BitBtn10Click
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
                        end
                        object Panel11: TPanel
                          Left = 0
                          Top = 0
                          Width = 763
                          Height = 20
                          Align = alTop
                          BevelOuter = bvNone
                          Caption = 'Inserir texto em formato html, e incluir as tags do ERP'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clRed
                          Font.Height = -13
                          Font.Name = 'Tahoma'
                          Font.Style = []
                          ParentFont = False
                          TabOrder = 2
                        end
                      end
                    end
                    object tsMarkdown: TTabSheet
                      Caption = 'tsMarkdown'
                      ImageIndex = 1
                      object Panel9: TPanel
                        Left = 0
                        Top = 20
                        Width = 139
                        Height = 164
                        Align = alLeft
                        BevelOuter = bvNone
                        TabOrder = 0
                        object Label21: TLabel
                          Left = 101
                          Top = 3
                          Width = 34
                          Height = 13
                          Caption = 'Dados:'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -11
                          Font.Name = 'MS Sans Serif'
                          Font.Style = []
                          ParentFont = False
                        end
                        object BitBtn13: TBitBtn
                          Left = 2
                          Top = 26
                          Width = 129
                          Height = 33
                          Hint = 'Inserir Tag'
                          Caption = 'Tag'
                          TabOrder = 0
                          OnClick = BitBtn13Click
                          Glyph.Data = {
                            36050000424D3605000000000000360400002800000010000000100000000100
                            08000000000000010000130B0000130B000000010000000100002184290039B5
                            520063A563006BAD840094DE8C00FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00050505050505
                            0505050505050505050505050505050503000003050505050505050505050505
                            0204010005050505050505050505050502040100050505050505050505050505
                            0204010005050505050505050505050502040100050505050505050300000000
                            0004010000000000030505020101010101010101010101010005050204040404
                            0404010404040404000505030202020202040100000000000305050505050505
                            0204010005050505050505050505050502040100050505050505050505050505
                            0204010005050505050505050505050502040100050505050505050505050505
                            0302020305050505050505050505050505050505050505050505}
                        end
                        object BitBtn14: TBitBtn
                          Left = 2
                          Top = 65
                          Width = 129
                          Height = 33
                          Hint = 'Inserir Campo'
                          Caption = 'Campo'
                          TabOrder = 1
                          OnClick = BitBtn14Click
                          Glyph.Data = {
                            36050000424D3605000000000000360400002800000010000000100000000100
                            08000000000000010000130B0000130B000000010000000100002184290039B5
                            520063A563006BAD840094DE8C00FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00050505050505
                            0505050505050505050505050505050503000003050505050505050505050505
                            0204010005050505050505050505050502040100050505050505050505050505
                            0204010005050505050505050505050502040100050505050505050300000000
                            0004010000000000030505020101010101010101010101010005050204040404
                            0404010404040404000505030202020202040100000000000305050505050505
                            0204010005050505050505050505050502040100050505050505050505050505
                            0204010005050505050505050505050502040100050505050505050505050505
                            0302020305050505050505050505050505050505050505050505}
                        end
                      end
                      object Panel10: TPanel
                        Left = 139
                        Top = 20
                        Width = 624
                        Height = 164
                        Align = alClient
                        BevelKind = bkTile
                        BevelOuter = bvNone
                        TabOrder = 1
                        object DBMemo1: TDBMemo
                          Left = 0
                          Top = 0
                          Width = 620
                          Height = 160
                          Align = alClient
                          DataField = 'DADOS_CARTA'
                          DataSource = DtmCadBasicos.dsModCartas
                          TabOrder = 0
                        end
                      end
                      object Panel12: TPanel
                        Left = 0
                        Top = 0
                        Width = 763
                        Height = 20
                        Align = alTop
                        BevelOuter = bvNone
                        Caption = 'Inserir texto em formato markdown, e inserir as tags do ERP'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clRed
                        Font.Height = -13
                        Font.Name = 'Tahoma'
                        Font.Style = []
                        ParentFont = False
                        TabOrder = 2
                      end
                    end
                  end
                  object Panel13: TPanel
                    Left = 2
                    Top = 150
                    Width = 771
                    Height = 32
                    Align = alTop
                    BevelOuter = bvNone
                    TabOrder = 2
                    object Label22: TLabel
                      Left = 76
                      Top = 7
                      Width = 63
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Consulta Sql:'
                    end
                    object DBComboBox5: TDBComboBox
                      Left = 145
                      Top = 4
                      Width = 399
                      Height = 21
                      Style = csDropDownList
                      DataField = 'ID_CONSULTAS_SQL'
                      DataSource = DtmCadBasicos.dsModCartas
                      ItemHeight = 13
                      TabOrder = 0
                      OnExit = DBComboBox5Exit
                    end
                  end
                end
              end
              object TabSheet6: TTabSheet
                Caption = 'TabSheet6'
                ImageIndex = 2
                object GroupBox5: TGroupBox
                  Left = 0
                  Top = 0
                  Width = 775
                  Height = 431
                  Align = alClient
                  TabOrder = 0
                  object Panel14: TPanel
                    Left = 2
                    Top = 15
                    Width = 771
                    Height = 70
                    Align = alTop
                    BevelOuter = bvNone
                    TabOrder = 0
                    object Label23: TLabel
                      Left = 102
                      Top = 16
                      Width = 37
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Codigo:'
                      FocusControl = DBEdit8
                    end
                    object Label26: TLabel
                      Left = 89
                      Top = 46
                      Width = 50
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Descri'#231#227'o:'
                      FocusControl = DBEdit9
                    end
                    object SpeedButton18: TSpeedButton
                      Left = 550
                      Top = 42
                      Width = 83
                      Height = 22
                      Hint = 'Inserir Campo'
                      Caption = 'Campo'
                      Glyph.Data = {
                        36050000424D3605000000000000360400002800000010000000100000000100
                        08000000000000010000130B0000130B000000010000000100002184290039B5
                        520063A563006BAD840094DE8C00FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00050505050505
                        0505050505050505050505050505050503000003050505050505050505050505
                        0204010005050505050505050505050502040100050505050505050505050505
                        0204010005050505050505050505050502040100050505050505050300000000
                        0004010000000000030505020101010101010101010101010005050204040404
                        0404010404040404000505030202020202040100000000000305050505050505
                        0204010005050505050505050505050502040100050505050505050505050505
                        0204010005050505050505050505050502040100050505050505050505050505
                        0302020305050505050505050505050505050505050505050505}
                      OnClick = SpeedButton18Click
                    end
                    object DBEdit8: TDBEdit
                      Left = 145
                      Top = 13
                      Width = 134
                      Height = 21
                      DataField = 'COD_CARTA'
                      DataSource = DtmCadBasicos.dsModCartas
                      Enabled = False
                      TabOrder = 0
                    end
                    object DBEdit9: TDBEdit
                      Left = 145
                      Top = 43
                      Width = 399
                      Height = 21
                      DataField = 'DESCRICAO'
                      DataSource = DtmCadBasicos.dsModCartas
                      TabOrder = 1
                    end
                  end
                  object Panel16: TPanel
                    Left = 2
                    Top = 85
                    Width = 771
                    Height = 32
                    Align = alTop
                    BevelOuter = bvNone
                    TabOrder = 1
                    object Label27: TLabel
                      Left = 89
                      Top = 7
                      Width = 50
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Aplicativo:'
                    end
                    object DBLookupComboBox2: TDBLookupComboBox
                      Left = 145
                      Top = 5
                      Width = 399
                      Height = 21
                      DataField = 'ID_MSG_APLICATIVO'
                      DataSource = DtmCadBasicos.dsModCartas
                      Enabled = False
                      KeyField = 'ID'
                      ListField = 'APLICATIVO'
                      ListSource = DtmCadBasicos.dsAplicativo
                      TabOrder = 0
                    end
                  end
                  object Panel17: TPanel
                    Left = 2
                    Top = 181
                    Width = 771
                    Height = 32
                    Align = alTop
                    BevelOuter = bvNone
                    TabOrder = 4
                    object Label28: TLabel
                      Left = 91
                      Top = 7
                      Width = 48
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Template:'
                    end
                    object DBComboBox9: TDBComboBox
                      Left = 145
                      Top = 4
                      Width = 399
                      Height = 21
                      Style = csDropDownList
                      DataField = 'TEMPLATE'
                      DataSource = DtmCadBasicos.dsModCartas
                      ItemHeight = 13
                      TabOrder = 0
                      OnExit = DBComboBox9Exit
                    end
                  end
                  object PageControl4: TPageControl
                    Left = 2
                    Top = 213
                    Width = 771
                    Height = 216
                    ActivePage = tsMarkdown2
                    Align = alClient
                    Style = tsFlatButtons
                    TabOrder = 5
                    object tsHtml2: TTabSheet
                      Caption = 'tsHtml'
                      object Panel18: TPanel
                        Left = 0
                        Top = 0
                        Width = 763
                        Height = 185
                        Align = alClient
                        BevelOuter = bvNone
                        TabOrder = 0
                        object Panel19: TPanel
                          Left = 139
                          Top = 20
                          Width = 624
                          Height = 165
                          Align = alClient
                          BevelKind = bkTile
                          BevelOuter = bvNone
                          TabOrder = 0
                          object WebBrowser2: TWebBrowser
                            Left = 0
                            Top = 0
                            Width = 620
                            Height = 161
                            Align = alClient
                            TabOrder = 0
                            ExplicitTop = 5
                            ExplicitWidth = 643
                            ExplicitHeight = 206
                            ControlData = {
                              4C00000014400000A41000000000000000000000000000000000000000000000
                              000000004C000000000000000000000001000000E0D057007335CF11AE690800
                              2B2E126208000000000000004C0000000114020000000000C000000000000046
                              8000000000000000000000000000000000000000000000000000000000000000
                              00000000000000000100000000000000000000000000000000000000}
                          end
                        end
                        object Panel20: TPanel
                          Left = 0
                          Top = 20
                          Width = 139
                          Height = 165
                          Align = alLeft
                          BevelOuter = bvNone
                          TabOrder = 1
                          object Label29: TLabel
                            Left = 101
                            Top = 3
                            Width = 34
                            Height = 13
                            Caption = 'Dados:'
                            Font.Charset = DEFAULT_CHARSET
                            Font.Color = clWindowText
                            Font.Height = -11
                            Font.Name = 'MS Sans Serif'
                            Font.Style = []
                            ParentFont = False
                          end
                          object BitBtn15: TBitBtn
                            Left = 2
                            Top = 26
                            Width = 131
                            Height = 33
                            Hint = 'Abrir Html'
                            Caption = 'Abrir Html'
                            TabOrder = 0
                            OnClick = BitBtn15Click
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
                        end
                        object Panel21: TPanel
                          Left = 0
                          Top = 0
                          Width = 763
                          Height = 20
                          Align = alTop
                          BevelOuter = bvNone
                          Caption = 'Inserir texto em formato html, e incluir as tags do ERP'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clRed
                          Font.Height = -13
                          Font.Name = 'Tahoma'
                          Font.Style = []
                          ParentFont = False
                          TabOrder = 2
                        end
                      end
                    end
                    object tsMarkdown2: TTabSheet
                      Caption = 'tsMarkdown'
                      ImageIndex = 1
                      object Panel22: TPanel
                        Left = 0
                        Top = 20
                        Width = 139
                        Height = 165
                        Align = alLeft
                        BevelOuter = bvNone
                        TabOrder = 0
                        object Label30: TLabel
                          Left = 101
                          Top = 3
                          Width = 34
                          Height = 13
                          Caption = 'Dados:'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -11
                          Font.Name = 'MS Sans Serif'
                          Font.Style = []
                          ParentFont = False
                        end
                        object BitBtn17: TBitBtn
                          Left = 2
                          Top = 26
                          Width = 129
                          Height = 33
                          Hint = 'Inserir Campo'
                          Caption = 'Campo'
                          TabOrder = 0
                          OnClick = BitBtn17Click
                          Glyph.Data = {
                            36050000424D3605000000000000360400002800000010000000100000000100
                            08000000000000010000130B0000130B000000010000000100002184290039B5
                            520063A563006BAD840094DE8C00FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00050505050505
                            0505050505050505050505050505050503000003050505050505050505050505
                            0204010005050505050505050505050502040100050505050505050505050505
                            0204010005050505050505050505050502040100050505050505050300000000
                            0004010000000000030505020101010101010101010101010005050204040404
                            0404010404040404000505030202020202040100000000000305050505050505
                            0204010005050505050505050505050502040100050505050505050505050505
                            0204010005050505050505050505050502040100050505050505050505050505
                            0302020305050505050505050505050505050505050505050505}
                        end
                      end
                      object Panel23: TPanel
                        Left = 139
                        Top = 20
                        Width = 624
                        Height = 165
                        Align = alClient
                        BevelKind = bkTile
                        BevelOuter = bvNone
                        TabOrder = 1
                        object DBMemo2: TDBMemo
                          Left = 0
                          Top = 0
                          Width = 620
                          Height = 161
                          Align = alClient
                          DataField = 'DADOS_CARTA'
                          DataSource = DtmCadBasicos.dsModCartas
                          TabOrder = 0
                        end
                      end
                      object Panel24: TPanel
                        Left = 0
                        Top = 0
                        Width = 763
                        Height = 20
                        Align = alTop
                        BevelOuter = bvNone
                        Caption = 'Inserir texto em formato markdown, e inserir as tags do ERP'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clRed
                        Font.Height = -13
                        Font.Name = 'Tahoma'
                        Font.Style = []
                        ParentFont = False
                        TabOrder = 2
                      end
                    end
                  end
                  object Panel25: TPanel
                    Left = 2
                    Top = 149
                    Width = 771
                    Height = 32
                    Align = alTop
                    BevelOuter = bvNone
                    TabOrder = 3
                    object Label31: TLabel
                      Left = 104
                      Top = 7
                      Width = 35
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Op'#231#227'o:'
                    end
                    object DBComboBox6: TDBComboBox
                      Left = 145
                      Top = 4
                      Width = 399
                      Height = 21
                      Style = csDropDownList
                      DataField = 'DOC'
                      DataSource = DtmCadBasicos.dsModCartas
                      ItemHeight = 13
                      Items.Strings = (
                        ''
                        'U - Enviar '#250'nico documento por mensagem - ERP'
                        'D- Enviar dois ou mais documentos por mensagem - ERP'
                        'Q - Enviar qualquer quantidade de documentos - ERP'
                        'B - Bot responde tarefas e envia documentos')
                      TabOrder = 0
                    end
                  end
                  object Panel26: TPanel
                    Left = 2
                    Top = 117
                    Width = 771
                    Height = 32
                    Align = alTop
                    BevelOuter = bvNone
                    TabOrder = 2
                    object Label32: TLabel
                      Left = 76
                      Top = 7
                      Width = 63
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Consulta Sql:'
                    end
                    object DBComboBox8: TDBComboBox
                      Left = 145
                      Top = 4
                      Width = 399
                      Height = 21
                      Style = csDropDownList
                      DataField = 'ID_CONSULTAS_SQL'
                      DataSource = DtmCadBasicos.dsModCartas
                      ItemHeight = 13
                      TabOrder = 0
                    end
                  end
                end
              end
            end
            inherited Panel3: TPanel
              inherited BitBtn4: TBitBtn
                Hint = 'Confirmar Registro - [BAS292]'
              end
              inherited BitBtn5: TBitBtn
                Hint = 'Cancelar Registro'
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
            inherited imgInformation: TImage
              ExplicitHeight = 168
            end
            object SpeedButton59: TSpeedButton [6]
              Left = 700
              Top = 14
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
              OnClick = SpeedButton59Click
            end
            object bt_outros_prod: TSpeedButton [7]
              Left = 729
              Top = 14
              Width = 23
              Height = 22
              Flat = True
              Glyph.Data = {
                36030000424D3603000000000000360000002800000010000000100000000100
                1800000000000003000000000000000000000000000000000000FF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FF000000000000FF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
                0000000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
                0000000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FF000000000000FF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FF000000000000FF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
                0000000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
              OnClick = bt_outros_prodClick
            end
            inherited BitBtn1: TBitBtn
              Hint = 'Clique para pesquisar - [BAS285]'
            end
            inherited BitBtn3: TBitBtn
              Hint = 'Novo cadastro - [BAS286]'
            end
            inherited CheckBox3: TCheckBox
              Visible = False
            end
            inherited CheckBox1: TCheckBox
              Enabled = False
              Visible = False
            end
          end
          inherited Panel1: TPanel
            inherited Splitter1: TSplitter
              ExplicitHeight = 253
            end
            inherited DBGrid1: TDBGrid
              OnKeyDown = DBGrid1KeyDown
            end
            inherited Panel2: TPanel
              inherited SpeedButton1: TSpeedButton
                Hint = 'Editar Registro - [BAS287]'
              end
              inherited SpeedButton2: TSpeedButton
                Hint = 'Apagar Registro - [BAS288]'
                OnClick = SpeedButton2Click
              end
              inherited SpeedButton3: TSpeedButton
                Enabled = False
                Visible = False
              end
              inherited SpeedButton4: TSpeedButton
                OnClick = SpeedButton25Click
              end
              inherited SpeedButton5: TSpeedButton
                Hint = 'Recuperar registro - [BAS291]'
                OnClick = SpeedButton5Click
              end
              inherited SpeedButton6: TSpeedButton
                Hint = 'Configura'#231#227'o de regras para cartas de cobran'#231'a - [BAS323]'
                Glyph.Data = {
                  F6060000424DF606000000000000360000002800000018000000180000000100
                  180000000000C0060000C40E0000C40E00000000000000000000FFFFFFFFFFFF
                  FFFFFFF4F4F4EFEFEFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F3BDCBD1C6CBCEFB
                  F8F7FFFFFFFFFFFFFFFFFF9C9C9C949494979797F3F3F3FFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE3DEDB67A3
                  C00099DE0C8CC0BAC5CAFDFDFDF4F4F4FFFFFFB5B5B5E3E3E3A9A9A97E7E7EF2
                  F2F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  D2CBCA2E92C300ADF959E5FF2FD3FF92BBCCBBBBBB7C7C7CE3E3E3F9F9F9C5C5
                  C5FFFFFFB0B0B0ADADADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFDB3BEC5008ED807C7FF5BE5FFD0FFFF67C8E6E3EEF5CECECEB4B4B4
                  848484CFCFCFC1C1C1FBFBFBE8E8E8ABABABFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFD9DBDD119BDC11C5FF9DF5FFCFFFFF6FD8F3B4D7E8FF
                  FFFFCCCCCCECECECADADADA4A4A4E8E8E8FFFFFFE5E5E5AAAAAAFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDF577AFCB00ABF94DDEFFC1FFFF8EF0
                  FF8AC4E0FFFFFDFFFFFFD8D8D8DCDCDCF5F5F5FBFBFBFAFAFAFEFEFEF3F3F386
                  8686BFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F2478CB0009BE972E7FF
                  ACF4FF14C0FB67BDE4FFFFFFFFFFFFFFFFFFF7F7F7CCCCCCD0D0D0D1D1D1F0F0
                  F0FFFFFFFFFFFFD6D6D6717171D1D1D1FFFFFFFFFFFFFFFFFFFFFAF574AAC700
                  B2FF6AE4FF73E3FE74CAEEAFDBF4FFFEFDFFFFFFFFFFFFFFFFFFFFFFFFF8F8F8
                  EFEFEFF0F0F0E0E0E0E0E0E0FFFFFFFFFFFFE2E2E2686868CBCBCBFFFFFFFFFF
                  FFAEC5D600A1EE9CF5FFA8FAFF26B0EAFFF9F7FFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7E7E7DFDFDFFEFEFEFFFFFFE2E2E2
                  767675C2BDBC86A6B4109FDD90F4FF99EDFE4FC1F3EFF4F8FFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE3E3E3E2
                  E2E2FDFDFDFFFFFFDFDBD869859700B1ED3DCEFA6DDCFD88D3F5F4F7FBFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFE5E5E5E0E0E0FFFFFFFFFFFFA5C6DD47D5FDE6FEFF9FCEE7FF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7E7E7DEDEDED4D4D4ACA49FA7BE
                  CF74A6C5BBBEC2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA9A9A9
                  AEAEAEBCBCBCEDEAE8DFDAD78B8A89C1C1C1FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD
                  FDFDB4B4B4A7A7A7B6B6B6E2E2E2D9D9D9DBDBDBE5E5E5878787C1C1C1FFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFF4F4F4B0B0B0ACACACCECECEFFFFFFE8E8E8DFDFDFC9C9C9C9C9C9E4
                  E4E4949494B1B1B1F6F6F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFDFDFDADADADAFAFAFCFCFCFFFFFFFFFFFFFFFFFFFE8E8
                  E8DBDBDBBDBDBDC0C0C0DBDBDBA5A5A59D9D9DAFAFAFC0C0C0F9F9F9FFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F9A8A8A8B8B8B8D2D2D2FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFE7E7E7DBDBDBC2C2C2E2E2E2E3E3E3D7D7D7CCCCCCB1B1
                  B1A0A0A0FBFBFBFFFFFFFFFFFFFFFFFFFFFFFFDBDBDB999999BDBDBDDDDDDDFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDEDEDEE4E4E4E3E3E3E8E8E8
                  F3F3F3FCFCFCFFFFFFBFBFBFCBCBCBFFFFFFFFFFFFFFFFFFE4E4E4AFAFAFC9C9
                  C9DADADAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE3E3E3E1
                  E1E1E5E5E5EBEBEBE5E5E5EFEFEFFFFFFFE7E7E7C4C4C4FFFFFFFFFFFFF3F3F3
                  CFCFCFF8F8F8ECECECFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFE4E4E4E4E4E4E9E9E9C9C9C9F0F0F0F9F9F9F2F2F2F2F2F2D0D0D0FF
                  FFFFFFFFFFD2D2D2A7A7A7E6E6E6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFCFCFCD7D7D7ECECECCBCBCBB0B0B0FFFFFFFBFB
                  FBEBEBEBEBEBEBFFFFFFFFFFFFE8E8E8DFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9E9E9E2E2E2F3F3F3
                  B5B5B5CECECEFFFFFFF9F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFF8F8F8EEEEEEE5E5E5DFDFDFFFFFFFFFFFFFFFFFFFFFFFFF}
                OnClick = SpeedButton6Click
              end
              inherited SpeedButton7: TSpeedButton
                Enabled = False
                Glyph.Data = {
                  76060000424D7606000000000000360400002800000018000000180000000100
                  08000000000040020000130F0000130F00000001000000000000392918003131
                  310021214A007B5A4A007363520018425A00846B5A000842630021526B005263
                  6B0029637B00847B7B0084847B008C847B009C948C004A6B9C009C9C9C00B5B5
                  B500E7CEB5003139BD008CB5C60010A5D60029ADD600D6D6D60042A5DE00DEDE
                  DE000010E700F7EFE700299CEF002973F70073DEF70042E7F700FF00FF008CEF
                  FF008CF7FF009CFFFF00ADFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00202020202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  2020202020202020202020161616161616161616161616161616161616161616
                  20202016222222221E1E1E1E1E1E1E1E1E16161E1E1E1E162020201622222221
                  211E1E1E1E1E1E1E1E1624161E1E1E1620202016222222222221211E1E1E1E1E
                  1E162424161E1E162020201622222222222121211E1E1E1E1E16242422161E16
                  202020162323222222222121211E1E1E1E162222222216162020201623231910
                  10100B0B0B060E222216161616161616202020162323232222222223230E0306
                  0622222222222216202020162323232323222223232303030303222222222216
                  2020201623232323232323232323060303030322222222162020201623231910
                  1010101010101003030303031010221620202016232323232323232323232310
                  0303030303222216202020162323232323232323232323232303030303032216
                  2020201623232323232323232323232323230303030303162020201616161616
                  1616161616161616161616030303030320202020202020202020202020202020
                  2020202003030303032020202020202020202020202020202020202020030303
                  0320202020202020202020202020202020202020202003032020202020202020
                  2020202020202020202020202020202020032020202020202020202020202020
                  2020202020202020030320202020202020202020202020202020202020202020
                  2020202020202020202020202020202020202020202020202020}
                Visible = False
              end
              inherited SpeedButton8: TSpeedButton
                Hint = 'Controles Notificados (Servi'#231'o) - [BAS427]'
                Glyph.Data = {
                  76060000424D7606000000000000360400002800000018000000180000000100
                  08000000000040020000130F0000130F00000001000000000000392918003131
                  310021214A007B5A4A007363520018425A00846B5A000842630021526B005263
                  6B0029637B00847B7B0084847B008C847B009C948C004A6B9C009C9C9C00B5B5
                  B500E7CEB5003139BD008CB5C60010A5D60029ADD600D6D6D60042A5DE00DEDE
                  DE000010E700F7EFE700299CEF002973F70073DEF70042E7F700FF00FF008CEF
                  FF008CF7FF009CFFFF00ADFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00202020202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  2020202020202020202020161616161616161616161616161616161616161616
                  20202016222222221E1E1E1E1E1E1E1E1E16161E1E1E1E162020201622222221
                  211E1E1E1E1E1E1E1E1624161E1E1E1620202016222222222221211E1E1E1E1E
                  1E162424161E1E162020201622222222222121211E1E1E1E1E16242422161E16
                  202020162323222222222121211E1E1E1E162222222216162020201623231910
                  10100B0B0B060E222216161616161616202020162323232222222223230E0306
                  0622222222222216202020162323232323222223232303030303222222222216
                  2020201623232323232323232323060303030322222222162020201623231910
                  1010101010101003030303031010221620202016232323232323232323232310
                  0303030303222216202020162323232323232323232323232303030303032216
                  2020201623232323232323232323232323230303030303162020201616161616
                  1616161616161616161616030303030320202020202020202020202020202020
                  2020202003030303032020202020202020202020202020202020202020030303
                  0320202020202020202020202020202020202020202003032020202020202020
                  2020202020202020202020202020202020032020202020202020202020202020
                  2020202020202020030320202020202020202020202020202020202020202020
                  2020202020202020202020202020202020202020202020202020}
                Visible = False
                OnClick = SpeedButton8Click
              end
              inherited SpeedButton11: TSpeedButton
                Enabled = False
                Visible = False
              end
              inherited SpeedButton12: TSpeedButton
                Enabled = False
                Visible = False
              end
              inherited SpeedButton23: TSpeedButton
                Enabled = False
                Visible = False
              end
              inherited SpeedButton24: TSpeedButton
                Enabled = False
                Visible = False
              end
              inherited SpeedButton25: TSpeedButton
                Left = 177
                Top = 5
                Hint = 'Ver registros da lixeira - [BAS290]'
                OnClick = SpeedButton25Click
                ExplicitLeft = 177
                ExplicitTop = 5
              end
              inherited SpeedButton26: TSpeedButton
                Enabled = False
                Visible = False
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
        object TabSheet4: TTabSheet
          Caption = 'TabSheet4'
          ImageIndex = 3
          object Label9: TLabel
            Left = 74
            Top = 24
            Width = 108
            Height = 13
            Caption = 'Regaras para a Carta:'
          end
          object Label10: TLabel
            Left = 40
            Top = 56
            Width = 142
            Height = 13
            Caption = 'Processar carta ap'#243's a carta:'
          end
          object Label11: TLabel
            Left = 27
            Top = 248
            Width = 155
            Height = 13
            Caption = 'Reprocessar carta ap'#243's a carta:'
          end
          object SpeedButton9: TSpeedButton
            Left = 408
            Top = 112
            Width = 57
            Height = 22
            Glyph.Data = {
              36050000424D3605000000000000360400002800000010000000100000000100
              08000000000000010000E30E0000E30E0000000100000001000010630000006B
              0000086B00000073000008730000007B0000107B000000840000088400001084
              0000008C0000088C00000094000008940000009C0000089C000000A5000008A5
              000000AD000000B5000000BD000000C6000008C6000000CE000000D6000008D6
              000008630800087B0800107B080010840800008C0800088C0800009408001094
              0800009C080000A5080000AD080000B5080010BD080010C60800087B1000107B
              1000187B10001084100018841000088C1000188C1000109410001894100010D6
              100018D61000107B1800187B18001884180029841800108C1800188C1800218C
              18001094180018941800189C1800219C180010C6180018C6180018D61800187B
              210018842100189421002194210029A521001873290029AD290031DE290029E7
              290029843100298C3100398C310029D6310031D6310039AD390042A5420039DE
              420042DE42004AAD520052AD520052E752005AE75A0063AD630063E763006BEF
              63006B946B0073B56B006BDE6B0063E76B006BE76B0063EF6B007BB5730073B5
              7B007BDE7B007BB5840084BD84008CC69400A5E7A500CEEFBD00BDEFC600C6EF
              C600C6EFCE00CEEFCE00D6F7CE00D6E7D600DEE7D600D6EFD600DEEFD600CEE7
              DE00D6EFDE00DEEFDE00DEEFE700EFF7EF00F7F7F700FF00FF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00777777777777
              772F4F777777777777777777777777777712394F777777777777777777777777
              770E3D354F7777777777777777777777770E0B082D4F77777777125C55523F25
              131F0A4457294F777777225840161413100A1E073957344F7777215817151413
              120E1E07054157344F77105D17161413120C1E0707054B57414F0F5E17161413
              12201E0705034C57464F0E5817161413100C0C071B3657414F77205940161413
              240D0A073757334F7777126256523F25120C0C4357294F777777777777777777
              770E0A082D4F7777777777777777777777213B384F7777777777777777777777
              770E3B4F77777777777777777777777777444F77777777777777}
            OnClick = SpeedButton9Click
          end
          object SpeedButton10: TSpeedButton
            Left = 408
            Top = 140
            Width = 57
            Height = 22
            Glyph.Data = {
              36050000424D3605000000000000360400002800000010000000100000000100
              08000000000000010000E30E0000E30E0000000100000001000010630000006B
              0000086B00000073000008730000007B0000107B000000840000088400001084
              0000008C0000088C00000094000008940000009C0000089C000000A5000008A5
              000000AD000000B5000000BD000000C6000008C6000000CE000000D6000008D6
              000008630800087B0800107B080010840800008C0800088C0800009408001094
              0800009C080000A5080000AD080000B5080010BD080010C60800087B1000107B
              1000187B10001084100018841000088C1000188C1000109410001894100010D6
              100018D61000107B1800187B18001884180029841800108C1800188C1800218C
              18001094180018941800189C1800219C180010C6180018C6180018D61800187B
              210018842100189421002194210029A521001873290029AD290031DE290029E7
              290029843100298C3100398C310029D6310031D6310039AD390042A5420039DE
              420042DE42004AAD520052AD520052E752005AE75A0063AD630063E763006BEF
              63006B946B0073B56B006BDE6B0063E76B006BE76B0063EF6B007BB5730073B5
              7B007BDE7B007BB5840084BD84008CC69400A5E7A500CEEFBD00BDEFC600C6EF
              C600C6EFCE00CEEFCE00D6F7CE00D6E7D600DEE7D600D6EFD600DEEFD600CEE7
              DE00D6EFDE00DEEFDE00DEEFE700EFF7EF00F7F7F700FF00FF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00777777777777
              774F2F777777777777777777777777774F39127777777777777777777777774F
              353D0E77777777777777777777774F2D080B0E777777777777777777774F2957
              440A1F13253F52555C1277774F345739071E0A10131416405822774F34574105
              071E0E121314151758214F41574B0507071E0C12131416175D104F46574C0305
              071E2012131416175E0F774F4157361B070C0C1013141617580E77774F335737
              070A0D241314164059207777774F2957430C0C12253F52566212777777774F2D
              080A0E7777777777777777777777774F383B2177777777777777777777777777
              4F3B0E77777777777777777777777777774F4477777777777777}
            OnClick = SpeedButton10Click
          end
          object SpeedButton13: TSpeedButton
            Left = 408
            Top = 312
            Width = 57
            Height = 22
            Glyph.Data = {
              36050000424D3605000000000000360400002800000010000000100000000100
              08000000000000010000E30E0000E30E0000000100000001000010630000006B
              0000086B00000073000008730000007B0000107B000000840000088400001084
              0000008C0000088C00000094000008940000009C0000089C000000A5000008A5
              000000AD000000B5000000BD000000C6000008C6000000CE000000D6000008D6
              000008630800087B0800107B080010840800008C0800088C0800009408001094
              0800009C080000A5080000AD080000B5080010BD080010C60800087B1000107B
              1000187B10001084100018841000088C1000188C1000109410001894100010D6
              100018D61000107B1800187B18001884180029841800108C1800188C1800218C
              18001094180018941800189C1800219C180010C6180018C6180018D61800187B
              210018842100189421002194210029A521001873290029AD290031DE290029E7
              290029843100298C3100398C310029D6310031D6310039AD390042A5420039DE
              420042DE42004AAD520052AD520052E752005AE75A0063AD630063E763006BEF
              63006B946B0073B56B006BDE6B0063E76B006BE76B0063EF6B007BB5730073B5
              7B007BDE7B007BB5840084BD84008CC69400A5E7A500CEEFBD00BDEFC600C6EF
              C600C6EFCE00CEEFCE00D6F7CE00D6E7D600DEE7D600D6EFD600DEEFD600CEE7
              DE00D6EFDE00DEEFDE00DEEFE700EFF7EF00F7F7F700FF00FF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00777777777777
              772F4F777777777777777777777777777712394F777777777777777777777777
              770E3D354F7777777777777777777777770E0B082D4F77777777125C55523F25
              131F0A4457294F777777225840161413100A1E073957344F7777215817151413
              120E1E07054157344F77105D17161413120C1E0707054B57414F0F5E17161413
              12201E0705034C57464F0E5817161413100C0C071B3657414F77205940161413
              240D0A073757334F7777126256523F25120C0C4357294F777777777777777777
              770E0A082D4F7777777777777777777777213B384F7777777777777777777777
              770E3B4F77777777777777777777777777444F77777777777777}
            OnClick = SpeedButton13Click
          end
          object SpeedButton14: TSpeedButton
            Left = 408
            Top = 340
            Width = 57
            Height = 22
            Glyph.Data = {
              36050000424D3605000000000000360400002800000010000000100000000100
              08000000000000010000E30E0000E30E0000000100000001000010630000006B
              0000086B00000073000008730000007B0000107B000000840000088400001084
              0000008C0000088C00000094000008940000009C0000089C000000A5000008A5
              000000AD000000B5000000BD000000C6000008C6000000CE000000D6000008D6
              000008630800087B0800107B080010840800008C0800088C0800009408001094
              0800009C080000A5080000AD080000B5080010BD080010C60800087B1000107B
              1000187B10001084100018841000088C1000188C1000109410001894100010D6
              100018D61000107B1800187B18001884180029841800108C1800188C1800218C
              18001094180018941800189C1800219C180010C6180018C6180018D61800187B
              210018842100189421002194210029A521001873290029AD290031DE290029E7
              290029843100298C3100398C310029D6310031D6310039AD390042A5420039DE
              420042DE42004AAD520052AD520052E752005AE75A0063AD630063E763006BEF
              63006B946B0073B56B006BDE6B0063E76B006BE76B0063EF6B007BB5730073B5
              7B007BDE7B007BB5840084BD84008CC69400A5E7A500CEEFBD00BDEFC600C6EF
              C600C6EFCE00CEEFCE00D6F7CE00D6E7D600DEE7D600D6EFD600DEEFD600CEE7
              DE00D6EFDE00DEEFDE00DEEFE700EFF7EF00F7F7F700FF00FF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00777777777777
              774F2F777777777777777777777777774F39127777777777777777777777774F
              353D0E77777777777777777777774F2D080B0E777777777777777777774F2957
              440A1F13253F52555C1277774F345739071E0A10131416405822774F34574105
              071E0E121314151758214F41574B0507071E0C12131416175D104F46574C0305
              071E2012131416175E0F774F4157361B070C0C1013141617580E77774F335737
              070A0D241314164059207777774F2957430C0C12253F52566212777777774F2D
              080A0E7777777777777777777777774F383B2177777777777777777777777777
              4F3B0E77777777777777777777777777774F4477777777777777}
            OnClick = SpeedButton14Click
          end
          object DBText1: TDBText
            Left = 188
            Top = 24
            Width = 32
            Height = 17
            DataField = 'COD_CARTA'
            DataSource = DtmCadBasicos.dsModCartas
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBText2: TDBText
            Left = 220
            Top = 24
            Width = 48
            Height = 13
            AutoSize = True
            DataField = 'DESCRICAO'
            DataSource = DtmCadBasicos.dsModCartas
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label12: TLabel
            Left = 487
            Top = 108
            Width = 139
            Height = 13
            Caption = 'C'#243'digo da carta selecionada:'
          end
          object Label13: TLabel
            Left = 487
            Top = 309
            Width = 139
            Height = 13
            Caption = 'C'#243'digo da carta selecionada:'
          end
          object BitBtn8: TBitBtn
            Left = 316
            Top = 467
            Width = 75
            Height = 25
            Hint = 'Confirmar Registro - [BAS292]'
            Caption = '&OK'
            TabOrder = 0
            OnClick = BitBtn8Click
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
          object BitBtn9: TBitBtn
            Left = 397
            Top = 467
            Width = 75
            Height = 25
            Hint = 'Cancelar Registro - [BAS293]'
            Caption = '&Cancela'
            TabOrder = 1
            OnClick = BitBtn9Click
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
          object DBLookupListBox2: TDBLookupListBox
            Left = 188
            Top = 248
            Width = 197
            Height = 173
            TabOrder = 2
          end
          object DBLookupListBox1: TDBLookupListBox
            Left = 188
            Top = 50
            Width = 197
            Height = 173
            TabOrder = 3
          end
          object DBEdit4: TDBEdit
            Left = 487
            Top = 127
            Width = 70
            Height = 21
            DataField = 'CODANT_PROCESSAMENTO'
            DataSource = DtmCadBasicos.dsRegrasCartas
            Enabled = False
            TabOrder = 4
          end
          object DBEdit5: TDBEdit
            Left = 487
            Top = 327
            Width = 70
            Height = 21
            DataField = 'CODANT_REPROCESSAMENTO'
            DataSource = DtmCadBasicos.dsRegrasCartas
            Enabled = False
            TabOrder = 5
          end
        end
        object tsControles: TTabSheet
          Caption = 'tsControles'
          ImageIndex = 4
          object pnControles: TPanel
            Left = 16
            Top = 16
            Width = 697
            Height = 313
            TabOrder = 0
            object Panel48: TPanel
              Left = 1
              Top = 279
              Width = 695
              Height = 33
              Align = alBottom
              BevelKind = bkTile
              BevelOuter = bvNone
              Ctl3D = True
              ParentCtl3D = False
              TabOrder = 0
              object btSelectAll: TSpeedButton
                Left = 23
                Top = 6
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
                Left = 52
                Top = 6
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
              object btEnviarNot: TBitBtn
                Left = 147
                Top = 2
                Width = 195
                Height = 25
                Hint = 'Notificar controles selecionados - [BAS428]'
                Caption = 'Notificar controles'
                ModalResult = 1
                TabOrder = 0
                OnClick = btEnviarNotClick
                Glyph.Data = {
                  36030000424D3603000000000000360000002800000010000000100000000100
                  18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00A211149525FF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFF21B93620B3350FB224449E50FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF42C95637D04F37CB4D31C34518
                  B52FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  54CD6548E46247E06040D05640D75837D44F56A561FFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFF4BD46055F16F52EE6D50D965FFF4FF4ADF6149
                  DD6033DE4DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF70D6804BED66
                  4EF06A59D96DFFF3FFFFFFFFFFFFFF44EB6051E86A3EBC51FFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFF5BD36D89D193FFFCFFFFFFFFFFFFFFFFFFFF6A
                  E47C55EC6F51F86C79A37FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF41E75D5BEF7443E45D449E50FFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFF43E35E43E35E56F0714AB85BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF51CE643ED45644EA6077A0
                  7BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFF37C14B40C95628CD4228CD42FFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF37C14B36BC4A4FC8
                  6138B44A449E50FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFF72C57C36B44844C257449E50FFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF40B2
                  4E29A83C1AAE2EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF449E50FFFFFFFFFFFF}
              end
              object btControlesNotCanc: TBitBtn
                Left = 613
                Top = 2
                Width = 75
                Height = 25
                Hint = 'Sair'
                Caption = 'Sair'
                ModalResult = 2
                TabOrder = 1
                OnClick = btControlesNotCancClick
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
              object btNaoEnviarNot: TBitBtn
                Left = 348
                Top = 2
                Width = 195
                Height = 25
                Hint = 'Remover notifica'#231#227'o dos controles selecionados - [BAS429]'
                Caption = 'Remover notifica'#231#227'o dos controles'
                ModalResult = 1
                TabOrder = 2
                OnClick = btNaoEnviarNotClick
                Glyph.Data = {
                  36030000424D3603000000000000360000002800000010000000100000000100
                  18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00A211149525FF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFF21B93620B3350FB224449E50FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF42C95637D04F37CB4D31C34518
                  B52FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  54CD6548E46247E06040D05640D75837D44F56A561FFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFF4BD46055F16F52EE6D50D965FFF4FF4ADF6149
                  DD6033DE4DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF70D6804BED66
                  4EF06A59D96DFFF3FFFFFFFFFFFFFF44EB6051E86A3EBC51FFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFF5BD36D89D193FFFCFFFFFFFFFFFFFFFFFFFF6A
                  E47C55EC6F51F86C79A37FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF41E75D5BEF7443E45D449E50FFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFF43E35E43E35E56F0714AB85BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF51CE643ED45644EA6077A0
                  7BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFF37C14B40C95628CD4228CD42FFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF37C14B36BC4A4FC8
                  6138B44A449E50FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFF72C57C36B44844C257449E50FFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF40B2
                  4E29A83C1AAE2EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF449E50FFFFFFFFFFFF}
              end
            end
            object DBGridControlesNot: TDBGrid
              Left = 1
              Top = 1
              Width = 695
              Height = 278
              Align = alClient
              DataSource = DtmCadBasicos.dsControlesNot
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
              TabOrder = 1
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
              OnCellClick = DBGridControlesNotCellClick
              OnDrawColumnCell = DBGridControlesNotDrawColumnCell
              OnKeyDown = DBGridControlesNotKeyDown
              Columns = <
                item
                  Expanded = False
                  FieldName = 'SEL'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CODIGO_CTRL'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NOME_CTRL'
                  Width = 64
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ENV_NOTIFICACAO'
                  Title.Caption = 'Enviar Notificacao'
                  Width = 64
                  Visible = True
                end>
            end
          end
        end
        object tsPlataforma: TTabSheet
          Caption = 'tsPlataforma'
          ImageIndex = 5
          object pnPlataforma: TPanel
            Left = 16
            Top = 16
            Width = 337
            Height = 153
            TabOrder = 0
            object Panel7: TPanel
              Left = 1
              Top = 119
              Width = 335
              Height = 33
              Align = alBottom
              BevelKind = bkTile
              BevelOuter = bvNone
              Ctl3D = True
              ParentCtl3D = False
              TabOrder = 1
              object BitBtn11: TBitBtn
                Left = 87
                Top = 2
                Width = 75
                Height = 25
                Hint = 'Confirmar Registro - [BAS292]'
                Caption = '&OK'
                TabOrder = 0
                OnClick = BitBtn11Click
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
              object BitBtn12: TBitBtn
                Left = 168
                Top = 2
                Width = 75
                Height = 25
                Hint = 'Cancelar Registro - [BAS293]'
                Caption = '&Cancela'
                TabOrder = 1
                OnClick = BitBtn12Click
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
            object DBGrid2: TDBGrid
              Left = 1
              Top = 1
              Width = 335
              Height = 118
              Align = alClient
              DataSource = DtmCadBasicos.dsAplicativo
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
              OnDblClick = DBGrid2DblClick
              OnKeyDown = DBGrid2KeyDown
              Columns = <
                item
                  Expanded = False
                  FieldName = 'APLICATIVO'
                  Title.Caption = 'Aplicativo'
                  Width = 280
                  Visible = True
                end>
            end
          end
        end
      end
    end
    inherited PanelFlash: TPanel
      Left = 619
      Top = 444
      ExplicitLeft = 619
      ExplicitTop = 444
    end
  end
  inherited pnStatusProcessamento: TPanel
    inherited lbTextoProcessamento: TLabel
      Width = 477
      Height = 21
    end
  end
  inherited PopupMenu1: TPopupMenu
    Top = 73
  end
  object cdColor: TColorDialog
    Left = 32
    Top = 568
  end
  object pmOutros: TPopupMenu
    Left = 632
    Top = 192
    object MenuCartasCobranca: TMenuItem
      Caption = 'Cartas de Cobran'#231'a'
      OnClick = MenuCartasCobrancaClick
    end
    object MenuCartasClientes: TMenuItem
      Caption = 'Cartas Clientes'
      OnClick = MenuCartasClientesClick
    end
    object MenuCartasVeiculos: TMenuItem
      Caption = 'Contratos Ve'#237'culos'
      OnClick = MenuCartasVeiculosClick
    end
    object MenuNotFinanceiros: TMenuItem
      Caption = 'Notifica'#231#245'es Financeiros'
      OnClick = MenuNotFinanceirosClick
    end
    object MenuTiposDocumento: TMenuItem
      Caption = 'Mensagem por Tipo Documento'
      OnClick = MenuTiposDocumentoClick
    end
  end
end
