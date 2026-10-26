inherited frmCadDebitoCredito: TfrmCadDebitoCredito
  Caption = 'D'#233'bitos e Cr'#233'ditos do Colaborador'
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
              inherited TabSheet3: TTabSheet
                OnShow = TabSheet3Show
                ExplicitLeft = 4
                ExplicitTop = 27
                ExplicitWidth = 775
                ExplicitHeight = 431
                inherited ScrollBox3: TScrollBox
                  inherited GroupBox1: TGroupBox
                    Width = 754
                    Height = 432
                    Caption = ''
                    ExplicitWidth = 754
                    ExplicitHeight = 432
                    object Label8: TLabel
                      Left = 49
                      Top = 24
                      Width = 68
                      Height = 13
                      Caption = 'Cod Vendedor'
                    end
                    object Label9: TLabel
                      Left = 33
                      Top = 97
                      Width = 84
                      Height = 13
                      Caption = 'Data Lan'#231'amento'
                      FocusControl = DBEdit4
                    end
                    object Label11: TLabel
                      Left = 17
                      Top = 73
                      Width = 100
                      Height = 13
                      Caption = 'Valor do Lan'#231'amento'
                      FocusControl = DBEdit6
                    end
                    object Label12: TLabel
                      Left = 71
                      Top = 121
                      Width = 46
                      Height = 13
                      Caption = 'Descri'#231#227'o'
                      FocusControl = DBEdit7
                    end
                    object Label13: TLabel
                      Left = 7
                      Top = 49
                      Width = 110
                      Height = 13
                      Caption = 'Origem do Lan'#231'amento'
                    end
                    object Label6: TLabel
                      Left = 398
                      Top = 49
                      Width = 31
                      Height = 13
                      Caption = 'Label6'
                    end
                    object DBEdit4: TDBEdit
                      Left = 123
                      Top = 94
                      Width = 134
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'DATA_LANC'
                      DataSource = dtmColaborador.dsLancDebCred
                      Enabled = False
                      TabOrder = 3
                    end
                    object DBEdit6: TDBEdit
                      Left = 123
                      Top = 70
                      Width = 134
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'VL_LANCDEBCRED'
                      DataSource = dtmColaborador.dsLancDebCred
                      TabOrder = 2
                    end
                    object DBEdit7: TDBEdit
                      Left = 123
                      Top = 118
                      Width = 406
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'DESCRICAO'
                      DataSource = dtmColaborador.dsLancDebCred
                      TabOrder = 4
                    end
                    object DBLookupComboBox1: TDBLookupComboBox
                      Left = 123
                      Top = 46
                      Width = 270
                      Height = 21
                      DataField = 'ORIGEM_LANC'
                      DataSource = dtmColaborador.dsLancDebCred
                      KeyField = 'TIPO_LANC'
                      ListField = 'TIPO_LANC'
                      ListSource = dtmColaborador.dsTipoLancdc
                      TabOrder = 1
                      OnExit = DBLookupComboBox1Exit
                    end
                    object DBLookupComboBox2: TDBLookupComboBox
                      Left = 123
                      Top = 22
                      Width = 270
                      Height = 21
                      DataField = 'COD_VENDEDOR'
                      DataSource = dtmColaborador.dsLancDebCred
                      DropDownWidth = 280
                      KeyField = 'COD_VENDEDOR'
                      ListField = 'NOME_VENDEDOR;COD_VENDEDOR'
                      ListSource = dtmColaborador.dsLcolab
                      TabOrder = 0
                      OnExit = DBLookupComboBox1Exit
                    end
                  end
                end
              end
              object TabSheet4: TTabSheet
                Caption = 'TabSheet4'
                ImageIndex = 1
                ExplicitLeft = 0
                ExplicitTop = 0
                ExplicitWidth = 0
                ExplicitHeight = 0
                object Panel4: TPanel
                  Left = 0
                  Top = 0
                  Width = 775
                  Height = 431
                  Align = alClient
                  TabOrder = 0
                  object GroupBox4: TGroupBox
                    Left = 1
                    Top = 1
                    Width = 773
                    Height = 161
                    Align = alTop
                    TabOrder = 0
                    object DBGrid2: TDBGrid
                      Left = 2
                      Top = 15
                      Width = 769
                      Height = 109
                      Align = alTop
                      DataSource = dtmColaborador.dsTipoLancdc
                      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                      TabOrder = 0
                      TitleFont.Charset = DEFAULT_CHARSET
                      TitleFont.Color = clWindowText
                      TitleFont.Height = -11
                      TitleFont.Name = 'Tahoma'
                      TitleFont.Style = []
                    end
                    object GroupBox10: TGroupBox
                      Left = 2
                      Top = 124
                      Width = 769
                      Height = 36
                      Align = alTop
                      TabOrder = 1
                      object BitBtn8: TBitBtn
                        Left = 269
                        Top = 9
                        Width = 75
                        Height = 22
                        Hint = 'Incluir Registro - [COL035]'
                        Caption = '&Incluir'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                        TabOrder = 0
                        OnClick = BitBtn8Click
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
                      object BitBtn9: TBitBtn
                        Left = 349
                        Top = 9
                        Width = 75
                        Height = 22
                        Hint = 'Alterar Registro - [COL036]'
                        Caption = '&Alterar'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                        TabOrder = 1
                        OnClick = BitBtn9Click
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
                        Left = 429
                        Top = 9
                        Width = 75
                        Height = 22
                        Hint = 'Excluir Registro - [COL037]'
                        Caption = '&Deletar'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                        TabOrder = 2
                        OnClick = BitBtn12Click
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
                      object BitBtn61: TBitBtn
                        Left = 679
                        Top = 7
                        Width = 75
                        Height = 25
                        Hint = 'Voltar a tela anterior'
                        Caption = '&Voltar'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                        TabOrder = 3
                        OnClick = BitBtn61Click
                        Glyph.Data = {
                          36030000424D3603000000000000360000002800000010000000100000000100
                          18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
                          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                          FFFF00FFFF00FFFF00FFFF00FFFF00FF6B2A006828005C2300521F004E1E004E
                          1F004E1F004E1F004E1F004F1F004F1F00401800FF00FFFF00FFFF00FF963A00
                          BC4A00B54600AA4200A13F009A3D00983C00993C00993C00993C00993C009F3F
                          007D3100401800FF00FFFF00FFB74800E25800D35200CA4F00C24C00B84800B0
                          4500AD4400AC4300AD4300AD4300B446009F3F004F1F00FF00FFFF00FFC44D00
                          E75B00D95600D15300C94E00CE7328CF8240CA8041C17332B15510A74100AD43
                          00993C004F1F00FF00FFFF00FFCA4F00F36807E96004DE5A01D45300EAB788FE
                          FEFEFEFEFEFEFEFEFEFEFEC47A3DAD4300993C004E1F00FF00FFFF00FFCA4F00
                          F67A1CF06B0CEB6204E15900D85802D35C09CB5C0BC55B0EDDA674FEFEFEAD43
                          00993C004E1F00FF00FFFF00FFCA4F00F7913CF07516EF6707ED6202F4BB87DC
                          5600D45300CB4F00C55709FEFEFEB647009D3D004F1F00FF00FFFF00FFCA4F00
                          F79F54F07B1FEF6A0AF7BA81FEFEFEE95B00DE5700D45300DE8841FEFEFEC14B
                          00A54100582300FF00FFFF00FFCA4F00F8A760F28128FAD0A9FEFEFEFEFEFEFB
                          E6D1FAD8B7F7D7B7FEFEFEE9AB73CE5000B14500682800FF00FFFF00FFCA4F00
                          F8AD6BF38832FACCA4FEFEFEFEFEFEFAD4B2F7BB84F7BA82EE8E3EDD5600DA55
                          00BF4A00772E00FF00FFFF00FFCA4F00FAB77BF49646F27F24F8BF8AFEFEFEEF
                          6C0DEF6A0AEF6404EE5E00E95B00E55A00CB4F00873500FF00FFFF00FFCA4F00
                          FABA80F7B477F6A45CF49A4EF8C595F2842CF07A1EEF6A0AEE6203EF5E00F25E
                          00D95500963A00FF00FFFF00FFCB4F00FAA65DFABB82FABD87FAB77BF8AC69F7
                          9D4FF6872DF47413F36604F36000FA6200E35900A14000FF00FFFF00FFFF00FF
                          CF5C0AD46C1CD46E1ED46E1ED36A18D16513CF5C0ACC5504CB5101CA5000CB50
                          00BA4800FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                      end
                    end
                  end
                  object GroupBox5: TGroupBox
                    Left = 1
                    Top = 162
                    Width = 773
                    Height = 111
                    Align = alTop
                    TabOrder = 1
                    object Label16: TLabel
                      Left = 144
                      Top = 39
                      Width = 85
                      Height = 13
                      Caption = 'Tipo Lan'#231'amento:'
                      FocusControl = DBEdit2
                    end
                    object Label17: TLabel
                      Left = 14
                      Top = 63
                      Width = 215
                      Height = 13
                      Caption = 'Descri'#231#227'o padr'#227'o para o tipo de lan'#231'amento:'
                      FocusControl = DBEdit3
                    end
                    object Label18: TLabel
                      Left = 105
                      Top = 14
                      Width = 124
                      Height = 13
                      Caption = 'Natureza do Lan'#231'amento:'
                    end
                    object DBEdit2: TDBEdit
                      Left = 232
                      Top = 36
                      Width = 160
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'TIPO_LANC'
                      DataSource = dtmColaborador.dsTipoLancdc
                      TabOrder = 1
                    end
                    object DBEdit3: TDBEdit
                      Left = 232
                      Top = 60
                      Width = 406
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'DESCRICAOLANC'
                      DataSource = dtmColaborador.dsTipoLancdc
                      TabOrder = 2
                    end
                    object DBComboBox1: TDBComboBox
                      Left = 232
                      Top = 11
                      Width = 145
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'NATUREZA_LAN'
                      DataSource = dtmColaborador.dsTipoLancdc
                      ItemHeight = 0
                      Items.Strings = (
                        'C - CR'#201'DITO'
                        'D - D'#201'BITO')
                      TabOrder = 0
                      OnKeyPress = DBComboBox1KeyPress
                    end
                    object BitBtn13: TBitBtn
                      Left = 309
                      Top = 83
                      Width = 75
                      Height = 25
                      Caption = '&OK'
                      TabOrder = 3
                      OnClick = BitBtn13Click
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
                    object BitBtn10: TBitBtn
                      Left = 389
                      Top = 83
                      Width = 75
                      Height = 25
                      Caption = '&Cancela'
                      TabOrder = 4
                      OnClick = BitBtn10Click
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
            inherited Panel3: TPanel
              inherited BitBtn4: TBitBtn
                Hint = 'Salvar [COL029]'
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
            inherited BitBtn3: TBitBtn
              Hint = 'Novo cadastro [COL029]'
            end
            inherited CheckBox3: TCheckBox
              Visible = False
            end
            inherited CheckBox1: TCheckBox
              Visible = False
            end
          end
          inherited Panel1: TPanel
            inherited DBGrid1: TDBGrid
              OnKeyDown = DBGrid1KeyDown
            end
            inherited Panel2: TPanel
              inherited SpeedButton1: TSpeedButton
                Enabled = False
                Visible = False
              end
              inherited SpeedButton2: TSpeedButton
                Hint = 'Apagar Registro [COL031]'
                OnClick = SpeedButton2Click
              end
              inherited SpeedButton3: TSpeedButton
                Visible = False
              end
              inherited SpeedButton6: TSpeedButton
                Hint = 'Lan'#231'ar Cr'#233'dito por cumprimento de meta de  vendas [COL032]'
                Glyph.Data = {
                  72060000424D7206000000000000320400002800000018000000180000000100
                  08000000000040020000120B0000120B0000FF000000FF00000000000000FFFF
                  FF00FF00FF009796D5006F6DBC005C5B7F008883C200DCD9EE0070639800EAE7
                  F300F0EEF4008974A100A698B600977E9900CFBFCC00CFC0CC008C777F008B76
                  7E00B79497009E6769009966660091605E009263600091636000936563009162
                  5E009869650093655E009D6E6700C2827800CEACA600A5756B00CCABA400CEAF
                  A900A9746700FBF7F600A4695800AB7A6C00B6837300C6978800B0766200B17E
                  6B00C48C7700BB8B7900BA8E7E00C6988800CB9F8F00B2796300C1887200B984
                  6F00BB8C7900BC877000BC887000C28C7400BB887000BC897200BB8A7500C990
                  7500FEFAF800FCF8F600FAF6F400D3936F00D5997700CE957600D0AA9600D59A
                  7700D3997700E0A47F00AF816500D5A68A00FAF2ED00E7AC8500CA906600E6AC
                  7F00CB8A5400E5CEBC00D0823900F8DCC400F8E3D100F4C79C00FEDAB500F7D9
                  BC00F7E0CA00FEFAF600DAA56E00FFD19E00FFD5A700FFD5A900FFD9AF00FFE0
                  BE00FFE5C900FBEAD800EF9C3900EFA95300F7D9B700FFE5C700EEB67000EDBF
                  8200FFE1B900FFD39100FFF3E200FFDDA700FFD48B00FFE4B400FFEAC100FFEA
                  C200FFF2D4009E8E5A00FFF7D700FFFEF800FFFFEE00FFFFF300FFFFFB007A86
                  4B0043602F000162040003640600015D040002600500025F050003630600046E
                  09000467080005750B00036C0A00036A090004700A0006740E00088E11000879
                  0F000A931400097213000D971A000D8418000F801A00097414000973140015A9
                  27002EBD3D00B3CFB6001AAA2D00189729001AA02D001B962D00178928001FB0
                  35001F9D340028BB420027B541002DC04A0030BB4D0021A53F0023A6400032C6
                  550030BF500037CC5D0029B750002EBC550039CC62003BCE63003FD769003FD1
                  660041D36A0031C25B003FD46C0045D7700046D8740048DC770047DA770049DD
                  790048D976004BE07D004DE27F004DE581002659A400527BB800CCD8FF00F3F6
                  FF0091AAFF00A1B5FF00A3B7FF00BDCBFF00D4DEFF00113EFF001A47FF00234F
                  FF002854FF005576FF005778FF006382FF007B96FF007D96FF009EB2FF00D9E1
                  FF00E6EBFF00062FFF000C37FF000C34FF000E37FF000E35F3000F39FF001139
                  FF001035EE00133FFF00133CFF001640FF001843FF002348FF003C5EFF005372
                  FF006781FF000026FF000024FF000026EE000128FF00032BFF00042AFF00042B
                  F6000C31F0000C2DE3003656FF00C2CBFF000021FF00001FFF000023FF000020
                  FB000020E900001BDD00001AD4000019D300011FDD00011CDC000320DD000B25
                  D4001028CF002338D0002439D000667BFF00BDC6FF00001AFF00001CF7000019
                  EB000115CE000A20CA00F6F7FF000111C7002430B1003541C0003642C0005F67
                  CC001F27A700494DB5006C70CB008487D10035359D0002020202020202020202
                  0202020283020202020202020202020202020202020202020202028383020202
                  0202020202021B2C2C2B3238383634372A31839D83441D130202020202021A5E
                  6258565555636666618397AD888787870202020202021A51595058654F120B11
                  839CABA7A6A398907C75020202021A4D5F59670DFAE3E5839AACA7AAA5A19B99
                  9486750202021A525F680BF5F0EFAE83A4ABA8A5A29F99959391857502021A4E
                  6C0CF2DED4D1C28B839EA9A296928F8D8E8C898102021A5B5BF8E1DFD0F4B6EE
                  8B8396A083716B72737F848278021C640EF3C3E0D0D2BFEDDDAF838A83104714
                  02027A8079021F6E04E7C8C5D7D8C0C1B1DCE683830543140202027E7B021F6F
                  04E8CDC6CCB501F4BCE0E0D583054318020202747D02256D03E9B8C6BBC2B0BD
                  DFD7D6D3F1084917020202027602295323EBCECBBDB6B3C0B4CFD7D7E4124916
                  020202027702313C01FDDBB9B9B50101B4C9C4E2FE564517020202020202333C
                  010AF7CAB8BAB2BECEB7D9F61E674519020202020202353C010109F9ECCAC7DA
                  DAEAFB4B69624019020202020202393C010101010703FCFC060F6A6A5A694015
                  0202020202023923010101010101706F6E4B2E272D2D261B0202020202024223
                  010101010101016D702024484A4C4C02020202020202413B0101010101010101
                  01202F605D5C0202020202020202413B0101010101010101012128605D020202
                  0202020202023E463A3B3B23233C3C3C01202F54020202020202020202023D3E
                  4141423F393530332622290202020202020202020202}
                OnClick = SpeedButton6Click
              end
              inherited SpeedButton7: TSpeedButton
                Visible = False
              end
              inherited SpeedButton8: TSpeedButton
                Hint = 'Inserir/Editar tipos de lan'#231'amento de d'#233'bito ou cr'#233'dito [COL033]'
                Glyph.Data = {
                  76060000424D7606000000000000360400002800000018000000180000000100
                  08000000000040020000230F0000230F00000001000000010000CE630000D673
                  0000DE7B0000D6730800D6731000D67B2100E7A5630031398C00085A9400396B
                  9400FFD6A500FFD6AD000873B500FFDEB500298CBD00FFDEBD007B8CC600FFE7
                  C600FFE7CE00FFEFD600FFEFDE005AB5E700FFEFE700FFF7E700FFF7EF00216B
                  F70042B5F7008CD6F700B5DEF700FFFFF700FF00FF003184FF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF001E1E1E1E1E1E
                  1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E
                  1E1E1E1E1E1E1E1E1E1E1E1E0000000000000000000000000000000000000000
                  1E1E1E1E00201D1817161413131211110F0D0D0B0B0A0A001E1E1E1E00202020
                  1D1D1D1818131211110F0D0D0B0B0A001E1E1E1E0020202020201D1D18181313
                  11110F0D0D0B0B001E1E1E1E002020202020202020181816131111110D0D0B00
                  1E1E1E1E0020202020202020201D181813131313130D0D001E1E1E1E00202020
                  202020202020201818161313111113001E1E1E1E002020202020202020202020
                  18181313131313001E1E1E1E0020202020202020202020201810070709111300
                  1E1E1E1E002020202020202020201D1D20081F1F081313001E1E1E1E00202020
                  202020202020202020081A1A081313001E1E1E1E002020202020202020200E0C
                  0C081A1A0C0C08101E1E1E1E002020202020202020200C1B1A1A1A1A1A1A1B0C
                  1E1E1E1E00202020202020202020191C1C1C1B1B1C1C1C191E1E1E1E00202020
                  202020202020151F1F1F1B1B1F1F1F151E1E1E1E002020202020202020202020
                  201F1B1B1F1717001E1E1E1E010202020202020202020202021F1C1C1F020200
                  1E1E1E1E06000000000000000000000000151F1F150000061E1E1E1E1E040404
                  0404040404040404040404040403051E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E
                  1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E
                  1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E}
                OnClick = SpeedButton8Click
              end
              inherited SpeedButton11: TSpeedButton
                Visible = False
              end
              inherited SpeedButton12: TSpeedButton
                Visible = False
              end
              inherited SpeedButton23: TSpeedButton
                Visible = False
              end
              inherited SpeedButton24: TSpeedButton
                Visible = False
              end
              inherited SpeedButton26: TSpeedButton
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
        object tsOutros: TTabSheet
          Caption = 'tsOutros'
          ImageIndex = 3
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object pnMesAno: TPanel
            Left = 3
            Top = 0
            Width = 492
            Height = 194
            BevelKind = bkTile
            BevelOuter = bvNone
            BorderWidth = 6
            TabOrder = 0
            object pnOKCancelar: TPanel
              Left = 6
              Top = 143
              Width = 476
              Height = 41
              Align = alBottom
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 1
              object btnOKCancelar: TBitBtn
                Left = 163
                Top = 7
                Width = 75
                Height = 25
                Caption = '&OK'
                TabOrder = 0
                OnClick = btnOKCancelarClick
                Glyph.Data = {
                  36030000424D3603000000000000360000002800000010000000100000000100
                  18000000000000030000C30E0000C30E00000000000000000000FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FF71AA22FF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF71AA2271AA2271
                  AA22FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FF71AA2271AA2271AA2271AA2271AA22FF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF71AA2271AA2271AA2271AA2271
                  AA2271AA2271AA22FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  71AA2271AA2271AA2271AA2271AA2271AA2271AA2271AA2271AA22FF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FF71AA2271AA2271AA2271AA2271AA22FF00FF71
                  AA2271AA2271AA2271AA2271AA22FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  71AA2271AA2271AA22FF00FFFF00FFFF00FF71AA2271AA2271AA2271AA2271AA
                  22FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF71AA22FF00FFFF00FFFF00FFFF
                  00FFFF00FF71AA2271AA2271AA2271AA2271AA22FF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF71AA2271AA2271AA
                  2271AA2271AA22FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FF71AA2271AA2271AA22FF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF71AA
                  22FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
              end
              object BitBtn7: TBitBtn
                Left = 244
                Top = 7
                Width = 75
                Height = 25
                Caption = 'Cancelar'
                TabOrder = 1
                Kind = bkCancel
              end
            end
            object gbMesAno: TGroupBox
              Left = 6
              Top = -1
              Width = 475
              Height = 141
              Caption = 'Informe o m'#234's e o ano de refer'#234'ncia'
              TabOrder = 0
              object Label203: TLabel
                Left = 110
                Top = 31
                Width = 23
                Height = 13
                Caption = 'M'#234's:'
              end
              object Label51: TLabel
                Left = 110
                Top = 58
                Width = 23
                Height = 13
                Caption = 'Ano:'
              end
              object Label7: TLabel
                Left = 19
                Top = 86
                Width = 114
                Height = 13
                Caption = 'Origem do Lan'#231'amento:'
              end
              object Label10: TLabel
                Left = 7
                Top = 113
                Width = 126
                Height = 13
                Caption = 'Descri'#231#227'o do Lan'#231'amento:'
              end
              object MaskEdit4: TMaskEdit
                Left = 134
                Top = 28
                Width = 20
                Height = 21
                Hint = 'M'#234's refer'#234'ncia para lan'#231'amento do cr'#233'dito'
                EditMask = '!09;1;_'
                MaxLength = 2
                TabOrder = 0
                Text = '  '
              end
              object MaskEdit5: TMaskEdit
                Left = 134
                Top = 55
                Width = 37
                Height = 21
                Hint = 'Ano refer'#234'ncia para lan'#231'amento do cr'#233'dito'
                EditMask = '!0000;1;_'
                MaxLength = 4
                TabOrder = 1
                Text = '    '
              end
              object DBLookupComboBox3: TDBLookupComboBox
                Left = 379
                Top = 23
                Width = 270
                Height = 21
                Hint = 'Selecione o tipo de lan'#231'amento'
                Enabled = False
                KeyField = 'TIPO_LANC'
                ListField = 'TIPO_LANC'
                ListSource = dtmColaborador.dsTipoLancdc
                TabOrder = 2
                Visible = False
                OnExit = DBLookupComboBox3Exit
              end
              object Edit1: TEdit
                Left = 134
                Top = 83
                Width = 121
                Height = 21
                CharCase = ecUpperCase
                Enabled = False
                TabOrder = 3
                Text = 'BONUS POR META'
              end
              object Edit2: TEdit
                Left = 134
                Top = 110
                Width = 325
                Height = 21
                CharCase = ecUpperCase
                MaxLength = 48
                TabOrder = 4
                Text = 'CR'#201'DITO RELATIVO A CUMPRIMENTO DE META'
              end
            end
          end
        end
      end
    end
  end
  inherited pnStatusProcessamento: TPanel
    inherited lbTextoProcessamento: TLabel
      Width = 477
      Height = 21
    end
  end
  inherited PopupMenu2: TPopupMenu
    Left = 734
    Top = 75
  end
  inherited Timer1: TTimer
    Left = 694
    Top = 75
  end
  inherited ApplicationEventsPadrao: TApplicationEvents
    Left = 662
    Top = 75
  end
end
