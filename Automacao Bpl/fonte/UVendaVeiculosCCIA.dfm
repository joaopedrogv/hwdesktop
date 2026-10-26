inherited frmVendaVeiculosCCIA: TfrmVendaVeiculosCCIA
  Caption = 'Venda de Ve'#237'culos'
  ClientHeight = 611
  ClientWidth = 800
  ExplicitWidth = 808
  ExplicitHeight = 638
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelFundo: TPanel
    Width = 800
    Height = 591
    ExplicitWidth = 800
    ExplicitHeight = 591
    inherited Splitter2: TSplitter
      Height = 589
      ExplicitHeight = 639
    end
    inherited PanelLeft: TPanel
      Height = 589
      ExplicitHeight = 589
      inherited PageControl1: TPageControl
        Height = 587
        ExplicitHeight = 587
        inherited TabSheet1: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 24
          ExplicitWidth = 789
          ExplicitHeight = 559
          inherited ScrollBox1: TScrollBox
            Height = 559
            ExplicitHeight = 559
            inherited PageControl3: TPageControl
              Height = 511
              ActivePage = TabSheet_Consignado
              ExplicitHeight = 511
              object TabSheet_Venda: TTabSheet [0]
                Caption = 'Venda'
                ImageIndex = 4
                ExplicitLeft = 0
                ExplicitTop = 0
                ExplicitWidth = 0
                ExplicitHeight = 0
                object ScrollBox7: TScrollBox
                  Left = 0
                  Top = 0
                  Width = 781
                  Height = 483
                  Align = alClient
                  BevelInner = bvNone
                  BevelOuter = bvNone
                  TabOrder = 0
                  object GroupBox_Venda: TGroupBox
                    Left = 0
                    Top = 0
                    Width = 777
                    Height = 479
                    Align = alClient
                    Caption = 'Venda de Ve'#237'culo'
                    TabOrder = 0
                    object GroupBox_Troca: TGroupBox
                      Left = 3
                      Top = 270
                      Width = 771
                      Height = 91
                      Caption = 'Utilizado na troca'
                      TabOrder = 0
                      object Label12: TLabel
                        Left = 58
                        Top = 15
                        Width = 34
                        Height = 13
                        Caption = 'Chassi:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clYellow
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        ParentFont = False
                      end
                      object Label13: TLabel
                        Left = 42
                        Top = 41
                        Width = 50
                        Height = 13
                        Caption = 'Opcionais:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        ParentFont = False
                      end
                      object BitBtn17: TBitBtn
                        Left = 374
                        Top = 12
                        Width = 20
                        Height = 20
                        TabOrder = 0
                        OnClick = BitBtn11Click
                        Glyph.Data = {
                          36030000424D3603000000000000360000002800000010000000100000000100
                          18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
                          9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C
                          9C9C9C9C9C9C9CFF00FFFF00FFFF00FF9C9C9CE9E9E9DEDEDED9D9D9D4D4D4CF
                          CFCFCACACAC5C5C5C3C3C3C4C4C4C4C4C4C7C7C79C9C9CFF00FFFF00FFFF00FF
                          9C9C9CEBEBEBE0E0E0DBDBDBD7D7D7D2D2D2CDCDCDC9C9C9C3C3C3C2C2C2C2C2
                          C2C6C6C69C9C9CFF00FFFF00FFFF00FF959595F0F0F0E5E5E5E0E0E0DCDCDCD7
                          D7D7D2D2D2CECECEC9C9C9C4C4C4C2C2C2C6C6C69C9C9CFF00FFFF00FFFF00FF
                          959595F5F5F5E9E9E9E4E4E4E0E0E0DBDBDBD6D6D6D2D2D2CDCDCDC8C8C8C4C4
                          C4C5C5C59C9C9CFF00FFFF00FFFF00FF9F9F9FF9F9F9EFEFEFE9E9E9E5E5E5E0
                          E0E0DBDBDBD7D7D7D1D1D1CDCDCDC8C8C8C7C7C79C9C9CFF00FFFF00FFFF00FF
                          9F9F9FFEFEFEF3F3F3EEEEEEE9E9E9E4E4E4DFDFDFDBDBDBD7D7D7D1D1D1CCCC
                          CCCCCCCC9C9C9CFF00FFFF00FFFF00FFA6A6A6FFFFFFF9F9F9F3F3F3EEEEEEE9
                          E9E9E5E5E5DFDFDFDBDBDBD7D7D7D2D2D2D1D1D19C9C9CFF00FFFF00FFFF00FF
                          A6A6A6FFFFFFFEFEFEF8F8F8F3F3F3EEEEEEE9E9E9E4E4E4E0E0E0DBDBDBD6D6
                          D6D6D6D69C9C9CFF00FFFF00FFFF00FFB1B1B1FFFFFFFFFFFFFEFEFEF9F9F9F3
                          F3F3EEEEEEE9E9E9E4E4E4DFDFDFDCDCDCD3D3D39C9C9CFF00FFFF00FFFF00FF
                          B1B1B1FFFFFFFFFFFFFFFFFFFEFEFEF8F8F8F3F3F3EEEEEEEBEBEBEAEAEAD5D5
                          D5B7B7B79C9C9CFF00FFFF00FFFF00FFB8B8B8FFFFFFFFFFFFFFFFFFFFFFFFFE
                          FEFEF8F8F8F4F4F4E3E3E39999999999999999999C9C9CFF00FFFF00FFFF00FF
                          B8B8B8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFCFCFCD6D6D6999999ACAC
                          AC9B9B9B969696FF00FFFF00FFFF00FFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFF
                          FFFFFFFFFFFFFFFFDBDBDB999999B8B8B8A2A2A2FF00FFFF00FFFF00FFFF00FF
                          BFBFBFF8F8F8F7F7F7F7F7F7F7F7F7F6F6F6F6F6F6F6F6F6D7D7D7999999AAAA
                          AAFF00FFFF00FFFF00FFFF00FFFF00FFBFBFBFB1B1B1B1B1B1B1B1B1B1B1B1B1
                          B1B1B1B1B1B1B1B1B1B1B1999999FF00FFFF00FFFF00FFFF00FF}
                      end
                      object BitBtn22: TBitBtn
                        Left = 348
                        Top = 12
                        Width = 20
                        Height = 20
                        TabOrder = 1
                        OnClick = BitBtn12Click
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
                      end
                      object DBEdit7: TDBEdit
                        Left = 98
                        Top = 11
                        Width = 242
                        Height = 21
                        CharCase = ecUpperCase
                        DataField = 'CHASSI'
                        Enabled = False
                        TabOrder = 2
                      end
                      object Memo9: TMemo
                        Left = 98
                        Top = 38
                        Width = 296
                        Height = 45
                        Lines.Strings = (
                          'Memo3')
                        TabOrder = 3
                      end
                    end
                    object GroupBox_NomesVenda: TGroupBox
                      Left = 3
                      Top = 110
                      Width = 771
                      Height = 69
                      TabOrder = 1
                      object Label15: TLabel
                        Left = 25
                        Top = 18
                        Width = 67
                        Height = 13
                        Caption = 'Intermediador:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        ParentFont = False
                      end
                      object Label16: TLabel
                        Left = 38
                        Top = 45
                        Width = 54
                        Height = 13
                        Caption = 'Comprador:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        ParentFont = False
                      end
                      object DBEdit8: TDBEdit
                        Left = 98
                        Top = 13
                        Width = 42
                        Height = 21
                        DataField = 'COD_CLIENTE'
                        TabOrder = 0
                      end
                      object DBLookupComboBox4: TDBLookupComboBox
                        Left = 143
                        Top = 13
                        Width = 201
                        Height = 21
                        DataField = 'COD_CLIENTE'
                        KeyField = 'COD_CLIENTE'
                        ListField = 'NOME_CLIENTE'
                        TabOrder = 1
                      end
                      object BitBtn23: TBitBtn
                        Left = 348
                        Top = 13
                        Width = 20
                        Height = 20
                        TabOrder = 2
                        OnClick = BitBtn4Click
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
                      end
                      object BitBtn24: TBitBtn
                        Left = 374
                        Top = 13
                        Width = 20
                        Height = 20
                        TabOrder = 3
                        OnClick = BitBtn4Click
                        Glyph.Data = {
                          36030000424D3603000000000000360000002800000010000000100000000100
                          18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
                          9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C
                          9C9C9C9C9C9C9CFF00FFFF00FFFF00FF9C9C9CE9E9E9DEDEDED9D9D9D4D4D4CF
                          CFCFCACACAC5C5C5C3C3C3C4C4C4C4C4C4C7C7C79C9C9CFF00FFFF00FFFF00FF
                          9C9C9CEBEBEBE0E0E0DBDBDBD7D7D7D2D2D2CDCDCDC9C9C9C3C3C3C2C2C2C2C2
                          C2C6C6C69C9C9CFF00FFFF00FFFF00FF959595F0F0F0E5E5E5E0E0E0DCDCDCD7
                          D7D7D2D2D2CECECEC9C9C9C4C4C4C2C2C2C6C6C69C9C9CFF00FFFF00FFFF00FF
                          959595F5F5F5E9E9E9E4E4E4E0E0E0DBDBDBD6D6D6D2D2D2CDCDCDC8C8C8C4C4
                          C4C5C5C59C9C9CFF00FFFF00FFFF00FF9F9F9FF9F9F9EFEFEFE9E9E9E5E5E5E0
                          E0E0DBDBDBD7D7D7D1D1D1CDCDCDC8C8C8C7C7C79C9C9CFF00FFFF00FFFF00FF
                          9F9F9FFEFEFEF3F3F3EEEEEEE9E9E9E4E4E4DFDFDFDBDBDBD7D7D7D1D1D1CCCC
                          CCCCCCCC9C9C9CFF00FFFF00FFFF00FFA6A6A6FFFFFFF9F9F9F3F3F3EEEEEEE9
                          E9E9E5E5E5DFDFDFDBDBDBD7D7D7D2D2D2D1D1D19C9C9CFF00FFFF00FFFF00FF
                          A6A6A6FFFFFFFEFEFEF8F8F8F3F3F3EEEEEEE9E9E9E4E4E4E0E0E0DBDBDBD6D6
                          D6D6D6D69C9C9CFF00FFFF00FFFF00FFB1B1B1FFFFFFFFFFFFFEFEFEF9F9F9F3
                          F3F3EEEEEEE9E9E9E4E4E4DFDFDFDCDCDCD3D3D39C9C9CFF00FFFF00FFFF00FF
                          B1B1B1FFFFFFFFFFFFFFFFFFFEFEFEF8F8F8F3F3F3EEEEEEEBEBEBEAEAEAD5D5
                          D5B7B7B79C9C9CFF00FFFF00FFFF00FFB8B8B8FFFFFFFFFFFFFFFFFFFFFFFFFE
                          FEFEF8F8F8F4F4F4E3E3E39999999999999999999C9C9CFF00FFFF00FFFF00FF
                          B8B8B8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFCFCFCD6D6D6999999ACAC
                          AC9B9B9B969696FF00FFFF00FFFF00FFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFF
                          FFFFFFFFFFFFFFFFDBDBDB999999B8B8B8A2A2A2FF00FFFF00FFFF00FFFF00FF
                          BFBFBFF8F8F8F7F7F7F7F7F7F7F7F7F6F6F6F6F6F6F6F6F6D7D7D7999999AAAA
                          AAFF00FFFF00FFFF00FFFF00FFFF00FFBFBFBFB1B1B1B1B1B1B1B1B1B1B1B1B1
                          B1B1B1B1B1B1B1B1B1B1B1999999FF00FFFF00FFFF00FFFF00FF}
                      end
                      object DBEdit9: TDBEdit
                        Left = 98
                        Top = 40
                        Width = 42
                        Height = 21
                        DataField = 'COD_CLIENTE'
                        TabOrder = 4
                      end
                      object DBLookupComboBox6: TDBLookupComboBox
                        Left = 143
                        Top = 40
                        Width = 201
                        Height = 21
                        DataField = 'COD_CLIENTE'
                        KeyField = 'COD_CLIENTE'
                        ListField = 'NOME_CLIENTE'
                        TabOrder = 5
                      end
                      object BitBtn25: TBitBtn
                        Left = 348
                        Top = 40
                        Width = 20
                        Height = 20
                        TabOrder = 6
                        OnClick = BitBtn4Click
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
                      end
                      object BitBtn26: TBitBtn
                        Left = 374
                        Top = 40
                        Width = 20
                        Height = 20
                        TabOrder = 7
                        OnClick = BitBtn4Click
                        Glyph.Data = {
                          36030000424D3603000000000000360000002800000010000000100000000100
                          18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
                          9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C
                          9C9C9C9C9C9C9CFF00FFFF00FFFF00FF9C9C9CE9E9E9DEDEDED9D9D9D4D4D4CF
                          CFCFCACACAC5C5C5C3C3C3C4C4C4C4C4C4C7C7C79C9C9CFF00FFFF00FFFF00FF
                          9C9C9CEBEBEBE0E0E0DBDBDBD7D7D7D2D2D2CDCDCDC9C9C9C3C3C3C2C2C2C2C2
                          C2C6C6C69C9C9CFF00FFFF00FFFF00FF959595F0F0F0E5E5E5E0E0E0DCDCDCD7
                          D7D7D2D2D2CECECEC9C9C9C4C4C4C2C2C2C6C6C69C9C9CFF00FFFF00FFFF00FF
                          959595F5F5F5E9E9E9E4E4E4E0E0E0DBDBDBD6D6D6D2D2D2CDCDCDC8C8C8C4C4
                          C4C5C5C59C9C9CFF00FFFF00FFFF00FF9F9F9FF9F9F9EFEFEFE9E9E9E5E5E5E0
                          E0E0DBDBDBD7D7D7D1D1D1CDCDCDC8C8C8C7C7C79C9C9CFF00FFFF00FFFF00FF
                          9F9F9FFEFEFEF3F3F3EEEEEEE9E9E9E4E4E4DFDFDFDBDBDBD7D7D7D1D1D1CCCC
                          CCCCCCCC9C9C9CFF00FFFF00FFFF00FFA6A6A6FFFFFFF9F9F9F3F3F3EEEEEEE9
                          E9E9E5E5E5DFDFDFDBDBDBD7D7D7D2D2D2D1D1D19C9C9CFF00FFFF00FFFF00FF
                          A6A6A6FFFFFFFEFEFEF8F8F8F3F3F3EEEEEEE9E9E9E4E4E4E0E0E0DBDBDBD6D6
                          D6D6D6D69C9C9CFF00FFFF00FFFF00FFB1B1B1FFFFFFFFFFFFFEFEFEF9F9F9F3
                          F3F3EEEEEEE9E9E9E4E4E4DFDFDFDCDCDCD3D3D39C9C9CFF00FFFF00FFFF00FF
                          B1B1B1FFFFFFFFFFFFFFFFFFFEFEFEF8F8F8F3F3F3EEEEEEEBEBEBEAEAEAD5D5
                          D5B7B7B79C9C9CFF00FFFF00FFFF00FFB8B8B8FFFFFFFFFFFFFFFFFFFFFFFFFE
                          FEFEF8F8F8F4F4F4E3E3E39999999999999999999C9C9CFF00FFFF00FFFF00FF
                          B8B8B8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFCFCFCD6D6D6999999ACAC
                          AC9B9B9B969696FF00FFFF00FFFF00FFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFF
                          FFFFFFFFFFFFFFFFDBDBDB999999B8B8B8A2A2A2FF00FFFF00FFFF00FFFF00FF
                          BFBFBFF8F8F8F7F7F7F7F7F7F7F7F7F6F6F6F6F6F6F6F6F6D7D7D7999999AAAA
                          AAFF00FFFF00FFFF00FFFF00FFFF00FFBFBFBFB1B1B1B1B1B1B1B1B1B1B1B1B1
                          B1B1B1B1B1B1B1B1B1B1B1999999FF00FFFF00FFFF00FFFF00FF}
                      end
                      object TEdit
                        Left = 160
                        Top = -24
                        Width = 121
                        Height = 21
                        TabOrder = 8
                      end
                    end
                    object GroupBox_Dados: TGroupBox
                      Left = 3
                      Top = 13
                      Width = 771
                      Height = 91
                      TabOrder = 2
                      object Label9: TLabel
                        Left = 68
                        Top = 36
                        Width = 24
                        Height = 13
                        Caption = 'Tipo:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = []
                        ParentFont = False
                      end
                      object Label10: TLabel
                        Left = 57
                        Top = 64
                        Width = 35
                        Height = 13
                        Caption = 'Chassi:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clYellow
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = []
                        ParentFont = False
                        OnClick = Label14Click
                      end
                      object Label11: TLabel
                        Left = 56
                        Top = 13
                        Width = 37
                        Height = 13
                        Caption = 'C'#243'digo:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = []
                        ParentFont = False
                      end
                      object DBLookupComboBox2: TDBLookupComboBox
                        Left = 98
                        Top = 34
                        Width = 173
                        Height = 21
                        DataField = 'COD_CLIENTE'
                        KeyField = 'COD_CLIENTE'
                        ListField = 'NOME_CLIENTE'
                        TabOrder = 0
                      end
                      object DBEdit5: TDBEdit
                        Left = 98
                        Top = 61
                        Width = 242
                        Height = 21
                        CharCase = ecUpperCase
                        DataField = 'CHASSI'
                        TabOrder = 1
                      end
                      object BitBtn16: TBitBtn
                        Left = 346
                        Top = 61
                        Width = 20
                        Height = 20
                        TabOrder = 2
                        OnClick = BitBtn8Click
                        Glyph.Data = {
                          36030000424D3603000000000000360000002800000010000000100000000100
                          18000000000000030000120B0000120B00000000000000000000FF00FF4A667C
                          BE9596FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                          FFFF00FFFF00FFFF00FF6B9CC31E89E84B7AA3C89693FF00FFFF00FFFF00FFFF
                          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4BB4FE51B5FF
                          2089E94B7AA2C69592FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                          FFFF00FFFF00FFFF00FFFF00FF51B7FE51B3FF1D87E64E7AA0CA9792FF00FFFF
                          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                          51B7FE4EB2FF1F89E64E7BA2B99497FF00FFFF00FFFF00FFFF00FFFF00FFFF00
                          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF52B8FE4BB1FF2787D95F6A76FF
                          00FFB0857FC09F94C09F96BC988EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                          FF00FFFF00FF55BDFFB5D6EDBF9D92BB9B8CE7DAC2FFFFE3FFFFE5FDFADAD8C3
                          B3B58D85FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCEA795FD
                          EEBEFFFFD8FFFFDAFFFFDBFFFFE6FFFFFBEADDDCAE837FFF00FFFF00FFFF00FF
                          FF00FFFF00FFFF00FFFF00FFC1A091FBDCA8FEF7D0FFFFDBFFFFE3FFFFF8FFFF
                          FDFFFFFDC6A99CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC1A091FEE3ACF1
                          C491FCF2CAFFFFDDFFFFE4FFFFF7FFFFF7FFFFE9EEE5CBB9948CFF00FFFF00FF
                          FF00FFFF00FFFF00FFC2A191FFE6AEEEB581F7DCAEFEFDD8FFFFDFFFFFE3FFFF
                          E4FFFFE0F3ECD2BB968EFF00FFFF00FFFF00FFFF00FFFF00FFBC978CFBE7B7F4
                          C791F2C994F8E5B9FEFCD8FFFFDDFFFFDCFFFFE0E2D2BAB68E86FF00FFFF00FF
                          FF00FFFF00FFFF00FFFF00FFD9C3A9FFFEE5F7DCB8F2C994F5D4A5FAE8BDFDF4
                          C9FDFBD6B69089FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB58D85E8
                          DEDDFFFEF2F9D8A3F4C48CF9D49FFDEAB8D0B49FB89086FF00FFFF00FFFF00FF
                          FF00FFFF00FFFF00FFFF00FFFF00FFAD827FC9AA9EEFE0B7EFDFB2E7CEACB890
                          86B89086FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                          00FFFF00FFBA968ABB988CB79188FF00FFFF00FFFF00FFFF00FF}
                      end
                      object DBEdit6: TDBEdit
                        Left = 98
                        Top = 10
                        Width = 173
                        Height = 21
                        CharCase = ecUpperCase
                        DataField = 'CHASSI'
                        TabOrder = 3
                      end
                    end
                    object GroupBox5: TGroupBox
                      Left = 3
                      Top = 185
                      Width = 771
                      Height = 79
                      Color = clBtnFace
                      ParentColor = False
                      TabOrder = 3
                      object Label17: TLabel
                        Left = 12
                        Top = 20
                        Width = 80
                        Height = 13
                        Caption = 'Valor a Receber:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -5
                        Font.Name = 'MS Sans Serif'
                        Font.Style = [fsUnderline]
                        ParentFont = False
                      end
                      object Label20: TLabel
                        Left = 40
                        Top = 48
                        Width = 52
                        Height = 13
                        Caption = 'Valor Real:'
                        Font.Charset = ANSI_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = [fsUnderline]
                        ParentFont = False
                      end
                      object DBEdit11: TDBEdit
                        Left = 99
                        Top = 16
                        Width = 120
                        Height = 21
                        CharCase = ecUpperCase
                        DataField = 'CHASSI'
                        TabOrder = 0
                      end
                      object BitBtn31: TBitBtn
                        Left = 225
                        Top = 16
                        Width = 169
                        Height = 48
                        Caption = '&Condi'#231#245'es de Negocia'#231#227'o'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clYellow
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = []
                        ParentFont = False
                        TabOrder = 1
                        OnClick = BitBtn15Click
                        Glyph.Data = {
                          F6010000424DF601000000000000F60000002800000010000000100000000100
                          08000000000000010000120B0000120B0000300000003000000000000000FFFF
                          FF00FF00FF00811E000089230000932B0000912900008E2700008C2700009C31
                          00009A310000992F000099300000982F0000952D00009C3302009A320200A639
                          0000A3360000A3370000A1350000A13600009F3500009E3400009A3201009D35
                          0400AF400000AD3F0000AC3E0000AB3D0000AA3C0000AA3D0000A93B0000A93C
                          0000A73A0000A73B0000B5440000B1410000B0410000AF410000C14E0000C14F
                          0000CE5B0300CE5E0700D1620700D0600700DD6B0600DD6B0700020202020202
                          14121314020202020202020202021E2823030312210C02020202020202192E03
                          02020202022704020202020202182C020215260D0202160202020202020F2D02
                          161E0A1D0B02170202020202020F2B02250202091102170202020202020F2B02
                          1D02021C1302170202020202020F2B021D02021C1302170202020202020F2B02
                          1D02021B1702050202020202020F2B021D02021B1702020202020202020F2B02
                          1B02021B1702020202020202020F2D020802021A1702020202020202020F2C02
                          02020220160202020202020202102F0202020220090202020202020202022A29
                          02021F2202020202020202020202022407060E02020202020202}
                      end
                      object DBEdit14: TDBEdit
                        Left = 98
                        Top = 43
                        Width = 121
                        Height = 21
                        CharCase = ecUpperCase
                        DataField = 'CHASSI'
                        TabOrder = 2
                      end
                    end
                  end
                end
              end
              object TabSheet_DadosdaNota: TTabSheet [1]
                Caption = 'Dados da Nota'
                ImageIndex = 1
                ExplicitLeft = 0
                ExplicitTop = 0
                ExplicitWidth = 0
                ExplicitHeight = 0
                object ScrollBox4: TScrollBox
                  Left = 0
                  Top = 0
                  Width = 781
                  Height = 483
                  Align = alClient
                  BevelInner = bvNone
                  BevelOuter = bvNone
                  TabOrder = 0
                  object GroupBox21: TGroupBox
                    Left = 2
                    Top = 5
                    Width = 390
                    Height = 473
                    Caption = 'Dados da Nota Fiscal'
                    TabOrder = 0
                    object Label40: TLabel
                      Left = 11
                      Top = 20
                      Width = 123
                      Height = 13
                      Caption = 'Condi'#231#227'o de Pagamento: '
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                    end
                    object Label42: TLabel
                      Left = 20
                      Top = 47
                      Width = 114
                      Height = 13
                      Caption = 'Natureza da Opera'#231#227'o: '
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                    end
                    object Label43: TLabel
                      Left = 49
                      Top = 74
                      Width = 85
                      Height = 13
                      Caption = 'Descri'#231#227'o CFOP: '
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                    end
                    object Label44: TLabel
                      Left = 107
                      Top = 128
                      Width = 27
                      Height = 13
                      Caption = 'CST: '
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                    end
                    object Label45: TLabel
                      Left = 94
                      Top = 155
                      Width = 30
                      Height = 13
                      Caption = 'Frete: '
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                    end
                    object Label46: TLabel
                      Left = 47
                      Top = 210
                      Width = 87
                      Height = 13
                      Caption = 'Outras Despesas: '
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                    end
                    object Label47: TLabel
                      Left = 82
                      Top = 238
                      Width = 52
                      Height = 13
                      Caption = 'Desconto: '
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                    end
                    object Label48: TLabel
                      Left = 57
                      Top = 265
                      Width = 77
                      Height = 13
                      Caption = 'Redu'#231#227'o Base: '
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                    end
                    object Label49: TLabel
                      Left = 61
                      Top = 292
                      Width = 73
                      Height = 13
                      Caption = 'Aliquota ICMS: '
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                    end
                    object Label50: TLabel
                      Left = 60
                      Top = 319
                      Width = 74
                      Height = 13
                      Caption = 'Base de ICMS: '
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                    end
                    object Label51: TLabel
                      Left = 60
                      Top = 346
                      Width = 74
                      Height = 13
                      Caption = 'Valor de ICMS: '
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                    end
                    object Label52: TLabel
                      Left = 83
                      Top = 373
                      Width = 51
                      Height = 13
                      Caption = 'Data E/S: '
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                    end
                    object Label53: TLabel
                      Left = 73
                      Top = 400
                      Width = 61
                      Height = 13
                      Caption = 'Tipo Venda: '
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                    end
                    object Label54: TLabel
                      Left = 59
                      Top = 428
                      Width = 75
                      Height = 13
                      Caption = 'Restri'#231#227'o NFE: '
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                    end
                    object Label79: TLabel
                      Left = 53
                      Top = 101
                      Width = 81
                      Height = 13
                      Caption = 'Pre'#231'o de tabela: '
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                    end
                    object Label18: TLabel
                      Left = 94
                      Top = 182
                      Width = 40
                      Height = 13
                      Caption = 'Seguro: '
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                    end
                    object DBEdit24: TDBEdit
                      Left = 144
                      Top = 16
                      Width = 31
                      Height = 21
                      DataField = 'COD_CLIENTE'
                      TabOrder = 0
                    end
                    object DBLookupComboBox7: TDBLookupComboBox
                      Left = 185
                      Top = 17
                      Width = 190
                      Height = 21
                      DataField = 'COD_CLIENTE'
                      KeyField = 'COD_CLIENTE'
                      ListField = 'NOME_CLIENTE'
                      TabOrder = 1
                    end
                    object DBLookupComboBox8: TDBLookupComboBox
                      Left = 185
                      Top = 44
                      Width = 190
                      Height = 21
                      DataField = 'COD_CLIENTE'
                      KeyField = 'COD_CLIENTE'
                      ListField = 'NOME_CLIENTE'
                      TabOrder = 2
                    end
                    object DBEdit26: TDBEdit
                      Left = 144
                      Top = 43
                      Width = 31
                      Height = 21
                      DataField = 'COD_CLIENTE'
                      TabOrder = 3
                    end
                    object DBEdit27: TDBEdit
                      Left = 144
                      Top = 70
                      Width = 235
                      Height = 21
                      DataField = 'COD_CLIENTE'
                      TabOrder = 4
                    end
                    object DBEdit28: TDBEdit
                      Left = 144
                      Top = 97
                      Width = 72
                      Height = 21
                      DataField = 'COD_CLIENTE'
                      TabOrder = 5
                    end
                    object DBEdit29: TDBEdit
                      Left = 144
                      Top = 124
                      Width = 72
                      Height = 21
                      DataField = 'COD_CLIENTE'
                      TabOrder = 6
                    end
                    object DBEdit30: TDBEdit
                      Left = 144
                      Top = 151
                      Width = 72
                      Height = 21
                      DataField = 'COD_CLIENTE'
                      TabOrder = 7
                    end
                    object DBEdit31: TDBEdit
                      Left = 144
                      Top = 206
                      Width = 72
                      Height = 21
                      DataField = 'COD_CLIENTE'
                      TabOrder = 8
                    end
                    object DBEdit32: TDBEdit
                      Left = 144
                      Top = 233
                      Width = 72
                      Height = 21
                      DataField = 'COD_CLIENTE'
                      TabOrder = 9
                    end
                    object DBEdit33: TDBEdit
                      Left = 144
                      Top = 260
                      Width = 72
                      Height = 21
                      DataField = 'COD_CLIENTE'
                      TabOrder = 10
                    end
                    object DBEdit34: TDBEdit
                      Left = 144
                      Top = 287
                      Width = 72
                      Height = 21
                      DataField = 'COD_CLIENTE'
                      TabOrder = 11
                    end
                    object DBEdit35: TDBEdit
                      Left = 144
                      Top = 314
                      Width = 72
                      Height = 21
                      DataField = 'COD_CLIENTE'
                      TabOrder = 12
                    end
                    object DBEdit36: TDBEdit
                      Left = 144
                      Top = 341
                      Width = 72
                      Height = 21
                      DataField = 'COD_CLIENTE'
                      TabOrder = 13
                    end
                    object DBLookupComboBox9: TDBLookupComboBox
                      Left = 144
                      Top = 395
                      Width = 236
                      Height = 21
                      DataField = 'COD_CLIENTE'
                      KeyField = 'COD_CLIENTE'
                      ListField = 'NOME_CLIENTE'
                      TabOrder = 14
                    end
                    object DBLookupComboBox10: TDBLookupComboBox
                      Left = 144
                      Top = 423
                      Width = 235
                      Height = 21
                      DataField = 'COD_CLIENTE'
                      KeyField = 'COD_CLIENTE'
                      ListField = 'NOME_CLIENTE'
                      TabOrder = 15
                    end
                    object DBEdit55: TDBEdit
                      Left = 144
                      Top = 368
                      Width = 72
                      Height = 21
                      DataField = 'COD_CLIENTE'
                      TabOrder = 16
                    end
                    object DBEdit10: TDBEdit
                      Left = 144
                      Top = 179
                      Width = 72
                      Height = 21
                      DataField = 'COD_CLIENTE'
                      TabOrder = 17
                    end
                  end
                  object GroupBox23: TGroupBox
                    Left = 398
                    Top = 5
                    Width = 378
                    Height = 241
                    Caption = 'Dados Corpo NFE e Observa'#231#245'es'
                    TabOrder = 1
                    object Label73: TLabel
                      Left = 9
                      Top = 24
                      Width = 182
                      Height = 13
                      Caption = 'Observa'#231#245'es do corpo da Nota Fiscal:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                    end
                    object Label74: TLabel
                      Left = 11
                      Top = 128
                      Width = 243
                      Height = 13
                      Caption = 'Observa'#231#245'es para dados adicionais da Nota Fiscal:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                    end
                    object Memo1: TMemo
                      Left = 9
                      Top = 43
                      Width = 345
                      Height = 78
                      Lines.Strings = (
                        'Memo1')
                      TabOrder = 0
                    end
                    object Memo2: TMemo
                      Left = 11
                      Top = 147
                      Width = 345
                      Height = 78
                      Lines.Strings = (
                        'Memo1')
                      TabOrder = 1
                    end
                  end
                  object GroupBox22: TGroupBox
                    Left = 398
                    Top = 435
                    Width = 378
                    Height = 43
                    TabOrder = 2
                    object Label58: TLabel
                      Left = 19
                      Top = 18
                      Width = 167
                      Height = 13
                      Caption = 'Valor L'#237'quido da Nota Fiscal:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object DBEdit40: TDBEdit
                      Left = 192
                      Top = 14
                      Width = 161
                      Height = 21
                      DataField = 'COD_CLIENTE'
                      Enabled = False
                      TabOrder = 0
                    end
                  end
                  object GroupBox24: TGroupBox
                    Left = 398
                    Top = 252
                    Width = 378
                    Height = 177
                    Caption = 'Pesquisa'
                    TabOrder = 3
                    object Label75: TLabel
                      Left = 53
                      Top = 21
                      Width = 82
                      Height = 13
                      Caption = 'Primeiro ve'#237'culo: '
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                    end
                    object Label76: TLabel
                      Left = 59
                      Top = 104
                      Width = 76
                      Height = 13
                      Caption = 'Aceita Contato: '
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                    end
                    object Label77: TLabel
                      Left = 60
                      Top = 75
                      Width = 75
                      Height = 13
                      Caption = 'Marca Anterior: '
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                    end
                    object Label78: TLabel
                      Left = 15
                      Top = 49
                      Width = 120
                      Height = 13
                      Caption = 'Modelo Ve'#237'culo Anterior: '
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                    end
                    object DBLookupComboBox11: TDBLookupComboBox
                      Left = 141
                      Top = 17
                      Width = 212
                      Height = 21
                      DataField = 'COD_CLIENTE'
                      KeyField = 'COD_CLIENTE'
                      ListField = 'NOME_CLIENTE'
                      TabOrder = 0
                    end
                    object DBLookupComboBox12: TDBLookupComboBox
                      Left = 141
                      Top = 98
                      Width = 212
                      Height = 21
                      DataField = 'COD_CLIENTE'
                      KeyField = 'COD_CLIENTE'
                      ListField = 'NOME_CLIENTE'
                      TabOrder = 1
                    end
                    object DBLookupComboBox13: TDBLookupComboBox
                      Left = 141
                      Top = 44
                      Width = 157
                      Height = 21
                      DataField = 'COD_CLIENTE'
                      KeyField = 'COD_CLIENTE'
                      ListField = 'NOME_CLIENTE'
                      TabOrder = 2
                    end
                    object DBLookupComboBox14: TDBLookupComboBox
                      Left = 141
                      Top = 71
                      Width = 157
                      Height = 21
                      DataField = 'COD_CLIENTE'
                      KeyField = 'COD_CLIENTE'
                      ListField = 'NOME_CLIENTE'
                      TabOrder = 3
                    end
                    object BitBtn18: TBitBtn
                      Left = 304
                      Top = 46
                      Width = 20
                      Height = 20
                      TabOrder = 4
                      OnClick = BitBtn4Click
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
                    end
                    object BitBtn19: TBitBtn
                      Left = 330
                      Top = 46
                      Width = 20
                      Height = 20
                      TabOrder = 5
                      OnClick = BitBtn4Click
                      Glyph.Data = {
                        36030000424D3603000000000000360000002800000010000000100000000100
                        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
                        9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C
                        9C9C9C9C9C9C9CFF00FFFF00FFFF00FF9C9C9CE9E9E9DEDEDED9D9D9D4D4D4CF
                        CFCFCACACAC5C5C5C3C3C3C4C4C4C4C4C4C7C7C79C9C9CFF00FFFF00FFFF00FF
                        9C9C9CEBEBEBE0E0E0DBDBDBD7D7D7D2D2D2CDCDCDC9C9C9C3C3C3C2C2C2C2C2
                        C2C6C6C69C9C9CFF00FFFF00FFFF00FF959595F0F0F0E5E5E5E0E0E0DCDCDCD7
                        D7D7D2D2D2CECECEC9C9C9C4C4C4C2C2C2C6C6C69C9C9CFF00FFFF00FFFF00FF
                        959595F5F5F5E9E9E9E4E4E4E0E0E0DBDBDBD6D6D6D2D2D2CDCDCDC8C8C8C4C4
                        C4C5C5C59C9C9CFF00FFFF00FFFF00FF9F9F9FF9F9F9EFEFEFE9E9E9E5E5E5E0
                        E0E0DBDBDBD7D7D7D1D1D1CDCDCDC8C8C8C7C7C79C9C9CFF00FFFF00FFFF00FF
                        9F9F9FFEFEFEF3F3F3EEEEEEE9E9E9E4E4E4DFDFDFDBDBDBD7D7D7D1D1D1CCCC
                        CCCCCCCC9C9C9CFF00FFFF00FFFF00FFA6A6A6FFFFFFF9F9F9F3F3F3EEEEEEE9
                        E9E9E5E5E5DFDFDFDBDBDBD7D7D7D2D2D2D1D1D19C9C9CFF00FFFF00FFFF00FF
                        A6A6A6FFFFFFFEFEFEF8F8F8F3F3F3EEEEEEE9E9E9E4E4E4E0E0E0DBDBDBD6D6
                        D6D6D6D69C9C9CFF00FFFF00FFFF00FFB1B1B1FFFFFFFFFFFFFEFEFEF9F9F9F3
                        F3F3EEEEEEE9E9E9E4E4E4DFDFDFDCDCDCD3D3D39C9C9CFF00FFFF00FFFF00FF
                        B1B1B1FFFFFFFFFFFFFFFFFFFEFEFEF8F8F8F3F3F3EEEEEEEBEBEBEAEAEAD5D5
                        D5B7B7B79C9C9CFF00FFFF00FFFF00FFB8B8B8FFFFFFFFFFFFFFFFFFFFFFFFFE
                        FEFEF8F8F8F4F4F4E3E3E39999999999999999999C9C9CFF00FFFF00FFFF00FF
                        B8B8B8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFCFCFCD6D6D6999999ACAC
                        AC9B9B9B969696FF00FFFF00FFFF00FFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFF
                        FFFFFFFFFFFFFFFFDBDBDB999999B8B8B8A2A2A2FF00FFFF00FFFF00FFFF00FF
                        BFBFBFF8F8F8F7F7F7F7F7F7F7F7F7F6F6F6F6F6F6F6F6F6D7D7D7999999AAAA
                        AAFF00FFFF00FFFF00FFFF00FFFF00FFBFBFBFB1B1B1B1B1B1B1B1B1B1B1B1B1
                        B1B1B1B1B1B1B1B1B1B1B1999999FF00FFFF00FFFF00FFFF00FF}
                    end
                    object BitBtn20: TBitBtn
                      Left = 304
                      Top = 72
                      Width = 20
                      Height = 20
                      TabOrder = 6
                      OnClick = BitBtn4Click
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
                    end
                    object BitBtn21: TBitBtn
                      Left = 330
                      Top = 72
                      Width = 20
                      Height = 20
                      TabOrder = 7
                      OnClick = BitBtn4Click
                      Glyph.Data = {
                        36030000424D3603000000000000360000002800000010000000100000000100
                        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
                        9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C
                        9C9C9C9C9C9C9CFF00FFFF00FFFF00FF9C9C9CE9E9E9DEDEDED9D9D9D4D4D4CF
                        CFCFCACACAC5C5C5C3C3C3C4C4C4C4C4C4C7C7C79C9C9CFF00FFFF00FFFF00FF
                        9C9C9CEBEBEBE0E0E0DBDBDBD7D7D7D2D2D2CDCDCDC9C9C9C3C3C3C2C2C2C2C2
                        C2C6C6C69C9C9CFF00FFFF00FFFF00FF959595F0F0F0E5E5E5E0E0E0DCDCDCD7
                        D7D7D2D2D2CECECEC9C9C9C4C4C4C2C2C2C6C6C69C9C9CFF00FFFF00FFFF00FF
                        959595F5F5F5E9E9E9E4E4E4E0E0E0DBDBDBD6D6D6D2D2D2CDCDCDC8C8C8C4C4
                        C4C5C5C59C9C9CFF00FFFF00FFFF00FF9F9F9FF9F9F9EFEFEFE9E9E9E5E5E5E0
                        E0E0DBDBDBD7D7D7D1D1D1CDCDCDC8C8C8C7C7C79C9C9CFF00FFFF00FFFF00FF
                        9F9F9FFEFEFEF3F3F3EEEEEEE9E9E9E4E4E4DFDFDFDBDBDBD7D7D7D1D1D1CCCC
                        CCCCCCCC9C9C9CFF00FFFF00FFFF00FFA6A6A6FFFFFFF9F9F9F3F3F3EEEEEEE9
                        E9E9E5E5E5DFDFDFDBDBDBD7D7D7D2D2D2D1D1D19C9C9CFF00FFFF00FFFF00FF
                        A6A6A6FFFFFFFEFEFEF8F8F8F3F3F3EEEEEEE9E9E9E4E4E4E0E0E0DBDBDBD6D6
                        D6D6D6D69C9C9CFF00FFFF00FFFF00FFB1B1B1FFFFFFFFFFFFFEFEFEF9F9F9F3
                        F3F3EEEEEEE9E9E9E4E4E4DFDFDFDCDCDCD3D3D39C9C9CFF00FFFF00FFFF00FF
                        B1B1B1FFFFFFFFFFFFFFFFFFFEFEFEF8F8F8F3F3F3EEEEEEEBEBEBEAEAEAD5D5
                        D5B7B7B79C9C9CFF00FFFF00FFFF00FFB8B8B8FFFFFFFFFFFFFFFFFFFFFFFFFE
                        FEFEF8F8F8F4F4F4E3E3E39999999999999999999C9C9CFF00FFFF00FFFF00FF
                        B8B8B8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFCFCFCD6D6D6999999ACAC
                        AC9B9B9B969696FF00FFFF00FFFF00FFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFF
                        FFFFFFFFFFFFFFFFDBDBDB999999B8B8B8A2A2A2FF00FFFF00FFFF00FFFF00FF
                        BFBFBFF8F8F8F7F7F7F7F7F7F7F7F7F6F6F6F6F6F6F6F6F6D7D7D7999999AAAA
                        AAFF00FFFF00FFFF00FFFF00FFFF00FFBFBFBFB1B1B1B1B1B1B1B1B1B1B1B1B1
                        B1B1B1B1B1B1B1B1B1B1B1999999FF00FFFF00FFFF00FFFF00FF}
                    end
                  end
                end
              end
              inherited TabSheet3: TTabSheet
                Caption = 'Contrato'
                ExplicitLeft = 4
                ExplicitTop = 24
                ExplicitWidth = 781
                ExplicitHeight = 483
                object Label23: TLabel [0]
                  Left = 66
                  Top = 319
                  Width = 213
                  Height = 13
                  Caption = 'Documento, Manual, Chave Reserva:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label25: TLabel [1]
                  Left = 307
                  Top = 319
                  Width = 42
                  Height = 13
                  Caption = 'Multas:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label26: TLabel [2]
                  Left = 542
                  Top = 319
                  Width = 79
                  Height = 13
                  Caption = 'Observa'#231#245'es:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label27: TLabel [3]
                  Left = 66
                  Top = 367
                  Width = 122
                  Height = 13
                  Caption = 'Promessas de venda:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                inherited ScrollBox3: TScrollBox
                  Height = 483
                  ExplicitHeight = 483
                  inherited GroupBox1: TGroupBox
                    Height = 476
                    Caption = 'Contrato de Venda'
                    ExplicitHeight = 476
                    object GroupBox_Imprimir: TGroupBox
                      Left = 3
                      Top = 394
                      Width = 433
                      Height = 63
                      Caption = 'Imprimir'
                      TabOrder = 0
                      object BitBtn27: TBitBtn
                        Left = 15
                        Top = 19
                        Width = 101
                        Height = 33
                        Caption = '&Declara'#231#227'o'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clBlack
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = []
                        ParentFont = False
                        TabOrder = 0
                        OnClick = BitBtn15Click
                        Glyph.Data = {
                          36030000424D3603000000000000360000002800000010000000100000000100
                          18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
                          FF00FFFF00FF868484868484FF00FFFF00FF868484868484FF00FFFF00FFFF00
                          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF868484BCBABAB5B3B386848486
                          8484868484EBEAEA868484868484868484FF00FFFF00FFFF00FFFF00FFFF00FF
                          868484E3E2E2B5B3B3B5B3B3B5B3B35150504F4F4F868787CDCDCDE8E9E9C7C6
                          C6868484868484868484FF00FF868484DEDDDDD6D6D6A4A3A3A4A3A3A4A3A356
                          5555161516121212181818121212939393CACACA868484FF00FF868484D6D6D6
                          D6D6D6A4A3A3E0DEDED9D7D7CDCBCBC2C0C0B6B4B49F9D9D7976771212121414
                          141313138684848F8C8C868484D6D6D6A4A3A3F3F2F2FFFEFEFCFBFBEAE7E8E6
                          E6E6E6E5E5DAD9D9CCCBCBBFBDBDA2A0A07371719391918E8C8C868484A4A3A3
                          FFFFFFFEFDFDFBFBFBDFDEDFADA7A9B4ADAEC3BDBED1CECFE0E0E0E1E1E1D4D3
                          D3C7C6C6A7A5A5868383FF00FF868484868484F1F0F0C2B9BA93898BA19B9FAB
                          A8AAABA6A7B1ACADAFA9AAB2ADAECAC9C9DCDCDCD0D0D0868484FF00FFFF00FF
                          FF00FF868484CAA097BA9E87A2897E95817B897C7F928C92A5A2A4BBB6B7D7D6
                          D6CFCFCF868484FF00FFFF00FFFF00FFFF00FFFF00FFCC9A99FFEAC4FFDDB3EE
                          C399D5AE8CC9A786CC9A99989596868484868484FF00FFFF00FFFF00FFFF00FF
                          FF00FFFF00FFCC9A99FFE7C8FFDDBAFFDBB1FFD9A6FFD39FCC9A99FF00FFFF00
                          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCE9D9BFFEDDAFFE7CEFFE2C3FF
                          DDB8FFDBAECC9A99FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                          FF00FFCC9A99FEF0E1FFECD8FFE6CCFFE1C2FEDDB7CC9A99FF00FFFF00FFFF00
                          FFFF00FFFF00FFFF00FFFF00FFFF00FFCC9A99FFFFF5FFFFF5FFF0E1FFEBD6FF
                          E8CCF6D4BACC9A99FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                          CC9A99CC9A99CC9A99FCF3E9FCEADAFCE5D0CC9A99FF00FFFF00FFFF00FFFF00
                          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCC9A99CC9A99CC
                          9A99FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                      end
                      object BitBtn28: TBitBtn
                        Left = 123
                        Top = 19
                        Width = 101
                        Height = 33
                        Caption = '&Contrato'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clBlack
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = []
                        ParentFont = False
                        TabOrder = 1
                        OnClick = BitBtn15Click
                        Glyph.Data = {
                          36030000424D3603000000000000360000002800000010000000100000000100
                          18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
                          FF00FFFF00FF868484868484FF00FFFF00FF868484868484FF00FFFF00FFFF00
                          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF868484BCBABAB5B3B386848486
                          8484868484EBEAEA868484868484868484FF00FFFF00FFFF00FFFF00FFFF00FF
                          868484E3E2E2B5B3B3B5B3B3B5B3B35150504F4F4F868787CDCDCDE8E9E9C7C6
                          C6868484868484868484FF00FF868484DEDDDDD6D6D6A4A3A3A4A3A3A4A3A356
                          5555161516121212181818121212939393CACACA868484FF00FF868484D6D6D6
                          D6D6D6A4A3A3E0DEDED9D7D7CDCBCBC2C0C0B6B4B49F9D9D7976771212121414
                          141313138684848F8C8C868484D6D6D6A4A3A3F3F2F2FFFEFEFCFBFBEAE7E8E6
                          E6E6E6E5E5DAD9D9CCCBCBBFBDBDA2A0A07371719391918E8C8C868484A4A3A3
                          FFFFFFFEFDFDFBFBFBDFDEDFADA7A9B4ADAEC3BDBED1CECFE0E0E0E1E1E1D4D3
                          D3C7C6C6A7A5A5868383FF00FF868484868484F1F0F0C2B9BA93898BA19B9FAB
                          A8AAABA6A7B1ACADAFA9AAB2ADAECAC9C9DCDCDCD0D0D0868484FF00FFFF00FF
                          FF00FF868484CAA097BA9E87A2897E95817B897C7F928C92A5A2A4BBB6B7D7D6
                          D6CFCFCF868484FF00FFFF00FFFF00FFFF00FFFF00FFCC9A99FFEAC4FFDDB3EE
                          C399D5AE8CC9A786CC9A99989596868484868484FF00FFFF00FFFF00FFFF00FF
                          FF00FFFF00FFCC9A99FFE7C8FFDDBAFFDBB1FFD9A6FFD39FCC9A99FF00FFFF00
                          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCE9D9BFFEDDAFFE7CEFFE2C3FF
                          DDB8FFDBAECC9A99FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                          FF00FFCC9A99FEF0E1FFECD8FFE6CCFFE1C2FEDDB7CC9A99FF00FFFF00FFFF00
                          FFFF00FFFF00FFFF00FFFF00FFFF00FFCC9A99FFFFF5FFFFF5FFF0E1FFEBD6FF
                          E8CCF6D4BACC9A99FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                          CC9A99CC9A99CC9A99FCF3E9FCEADAFCE5D0CC9A99FF00FFFF00FFFF00FFFF00
                          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCC9A99CC9A99CC
                          9A99FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                      end
                      object BitBtn29: TBitBtn
                        Left = 230
                        Top = 19
                        Width = 194
                        Height = 33
                        Caption = '&Contrato com reserva de dom'#237'nio'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clBlack
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = []
                        ParentFont = False
                        TabOrder = 2
                        OnClick = BitBtn15Click
                        Glyph.Data = {
                          36030000424D3603000000000000360000002800000010000000100000000100
                          18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
                          FF00FFFF00FF868484868484FF00FFFF00FF868484868484FF00FFFF00FFFF00
                          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF868484BCBABAB5B3B386848486
                          8484868484EBEAEA868484868484868484FF00FFFF00FFFF00FFFF00FFFF00FF
                          868484E3E2E2B5B3B3B5B3B3B5B3B35150504F4F4F868787CDCDCDE8E9E9C7C6
                          C6868484868484868484FF00FF868484DEDDDDD6D6D6A4A3A3A4A3A3A4A3A356
                          5555161516121212181818121212939393CACACA868484FF00FF868484D6D6D6
                          D6D6D6A4A3A3E0DEDED9D7D7CDCBCBC2C0C0B6B4B49F9D9D7976771212121414
                          141313138684848F8C8C868484D6D6D6A4A3A3F3F2F2FFFEFEFCFBFBEAE7E8E6
                          E6E6E6E5E5DAD9D9CCCBCBBFBDBDA2A0A07371719391918E8C8C868484A4A3A3
                          FFFFFFFEFDFDFBFBFBDFDEDFADA7A9B4ADAEC3BDBED1CECFE0E0E0E1E1E1D4D3
                          D3C7C6C6A7A5A5868383FF00FF868484868484F1F0F0C2B9BA93898BA19B9FAB
                          A8AAABA6A7B1ACADAFA9AAB2ADAECAC9C9DCDCDCD0D0D0868484FF00FFFF00FF
                          FF00FF868484CAA097BA9E87A2897E95817B897C7F928C92A5A2A4BBB6B7D7D6
                          D6CFCFCF868484FF00FFFF00FFFF00FFFF00FFFF00FFCC9A99FFEAC4FFDDB3EE
                          C399D5AE8CC9A786CC9A99989596868484868484FF00FFFF00FFFF00FFFF00FF
                          FF00FFFF00FFCC9A99FFE7C8FFDDBAFFDBB1FFD9A6FFD39FCC9A99FF00FFFF00
                          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCE9D9BFFEDDAFFE7CEFFE2C3FF
                          DDB8FFDBAECC9A99FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                          FF00FFCC9A99FEF0E1FFECD8FFE6CCFFE1C2FEDDB7CC9A99FF00FFFF00FFFF00
                          FFFF00FFFF00FFFF00FFFF00FFFF00FFCC9A99FFFFF5FFFFF5FFF0E1FFEBD6FF
                          E8CCF6D4BACC9A99FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                          CC9A99CC9A99CC9A99FCF3E9FCEADAFCE5D0CC9A99FF00FFFF00FFFF00FFFF00
                          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCC9A99CC9A99CC
                          9A99FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                      end
                    end
                    object GroupBox17: TGroupBox
                      Left = 3
                      Top = 100
                      Width = 433
                      Height = 121
                      TabOrder = 1
                      object Label_Intermediador: TLabel
                        Left = 25
                        Top = 21
                        Width = 67
                        Height = 13
                        Caption = 'Intermediador:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        ParentFont = False
                      end
                      object Label35: TLabel
                        Left = 38
                        Top = 45
                        Width = 54
                        Height = 13
                        Caption = 'Comprador:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        ParentFont = False
                      end
                      object Label_ClienteVendedor: TLabel
                        Left = 8
                        Top = 69
                        Width = 84
                        Height = 13
                        Caption = 'Cliente Vendedor:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        ParentFont = False
                      end
                      object Label_Concessionaria: TLabel
                        Left = 17
                        Top = 94
                        Width = 75
                        Height = 13
                        Caption = 'Concession'#225'ria:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        ParentFont = False
                      end
                      object DBEdit_Intermediador: TDBEdit
                        Left = 98
                        Top = 13
                        Width = 42
                        Height = 21
                        DataField = 'COD_CLIENTE'
                        TabOrder = 0
                      end
                      object DBLookupComboBox_Intermediador: TDBLookupComboBox
                        Left = 143
                        Top = 13
                        Width = 201
                        Height = 21
                        DataField = 'COD_CLIENTE'
                        KeyField = 'COD_CLIENTE'
                        ListField = 'NOME_CLIENTE'
                        TabOrder = 1
                      end
                      object BitBtn_Intermediador_Editar: TBitBtn
                        Left = 348
                        Top = 13
                        Width = 20
                        Height = 20
                        TabOrder = 2
                        OnClick = BitBtn4Click
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
                      end
                      object BitBtn_Intermediador_Novo: TBitBtn
                        Left = 374
                        Top = 13
                        Width = 20
                        Height = 20
                        TabOrder = 3
                        OnClick = BitBtn4Click
                        Glyph.Data = {
                          36030000424D3603000000000000360000002800000010000000100000000100
                          18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
                          9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C
                          9C9C9C9C9C9C9CFF00FFFF00FFFF00FF9C9C9CE9E9E9DEDEDED9D9D9D4D4D4CF
                          CFCFCACACAC5C5C5C3C3C3C4C4C4C4C4C4C7C7C79C9C9CFF00FFFF00FFFF00FF
                          9C9C9CEBEBEBE0E0E0DBDBDBD7D7D7D2D2D2CDCDCDC9C9C9C3C3C3C2C2C2C2C2
                          C2C6C6C69C9C9CFF00FFFF00FFFF00FF959595F0F0F0E5E5E5E0E0E0DCDCDCD7
                          D7D7D2D2D2CECECEC9C9C9C4C4C4C2C2C2C6C6C69C9C9CFF00FFFF00FFFF00FF
                          959595F5F5F5E9E9E9E4E4E4E0E0E0DBDBDBD6D6D6D2D2D2CDCDCDC8C8C8C4C4
                          C4C5C5C59C9C9CFF00FFFF00FFFF00FF9F9F9FF9F9F9EFEFEFE9E9E9E5E5E5E0
                          E0E0DBDBDBD7D7D7D1D1D1CDCDCDC8C8C8C7C7C79C9C9CFF00FFFF00FFFF00FF
                          9F9F9FFEFEFEF3F3F3EEEEEEE9E9E9E4E4E4DFDFDFDBDBDBD7D7D7D1D1D1CCCC
                          CCCCCCCC9C9C9CFF00FFFF00FFFF00FFA6A6A6FFFFFFF9F9F9F3F3F3EEEEEEE9
                          E9E9E5E5E5DFDFDFDBDBDBD7D7D7D2D2D2D1D1D19C9C9CFF00FFFF00FFFF00FF
                          A6A6A6FFFFFFFEFEFEF8F8F8F3F3F3EEEEEEE9E9E9E4E4E4E0E0E0DBDBDBD6D6
                          D6D6D6D69C9C9CFF00FFFF00FFFF00FFB1B1B1FFFFFFFFFFFFFEFEFEF9F9F9F3
                          F3F3EEEEEEE9E9E9E4E4E4DFDFDFDCDCDCD3D3D39C9C9CFF00FFFF00FFFF00FF
                          B1B1B1FFFFFFFFFFFFFFFFFFFEFEFEF8F8F8F3F3F3EEEEEEEBEBEBEAEAEAD5D5
                          D5B7B7B79C9C9CFF00FFFF00FFFF00FFB8B8B8FFFFFFFFFFFFFFFFFFFFFFFFFE
                          FEFEF8F8F8F4F4F4E3E3E39999999999999999999C9C9CFF00FFFF00FFFF00FF
                          B8B8B8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFCFCFCD6D6D6999999ACAC
                          AC9B9B9B969696FF00FFFF00FFFF00FFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFF
                          FFFFFFFFFFFFFFFFDBDBDB999999B8B8B8A2A2A2FF00FFFF00FFFF00FFFF00FF
                          BFBFBFF8F8F8F7F7F7F7F7F7F7F7F7F6F6F6F6F6F6F6F6F6D7D7D7999999AAAA
                          AAFF00FFFF00FFFF00FFFF00FFFF00FFBFBFBFB1B1B1B1B1B1B1B1B1B1B1B1B1
                          B1B1B1B1B1B1B1B1B1B1B1999999FF00FFFF00FFFF00FFFF00FF}
                      end
                      object DBEdit20: TDBEdit
                        Left = 98
                        Top = 40
                        Width = 42
                        Height = 21
                        DataField = 'COD_CLIENTE'
                        TabOrder = 4
                      end
                      object DBLookupComboBox3: TDBLookupComboBox
                        Left = 143
                        Top = 40
                        Width = 201
                        Height = 21
                        DataField = 'COD_CLIENTE'
                        KeyField = 'COD_CLIENTE'
                        ListField = 'NOME_CLIENTE'
                        TabOrder = 5
                      end
                      object BitBtn10: TBitBtn
                        Left = 348
                        Top = 40
                        Width = 20
                        Height = 20
                        TabOrder = 6
                        OnClick = BitBtn4Click
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
                      end
                      object BitBtn13: TBitBtn
                        Left = 374
                        Top = 40
                        Width = 20
                        Height = 20
                        TabOrder = 7
                        OnClick = BitBtn4Click
                        Glyph.Data = {
                          36030000424D3603000000000000360000002800000010000000100000000100
                          18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
                          9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C
                          9C9C9C9C9C9C9CFF00FFFF00FFFF00FF9C9C9CE9E9E9DEDEDED9D9D9D4D4D4CF
                          CFCFCACACAC5C5C5C3C3C3C4C4C4C4C4C4C7C7C79C9C9CFF00FFFF00FFFF00FF
                          9C9C9CEBEBEBE0E0E0DBDBDBD7D7D7D2D2D2CDCDCDC9C9C9C3C3C3C2C2C2C2C2
                          C2C6C6C69C9C9CFF00FFFF00FFFF00FF959595F0F0F0E5E5E5E0E0E0DCDCDCD7
                          D7D7D2D2D2CECECEC9C9C9C4C4C4C2C2C2C6C6C69C9C9CFF00FFFF00FFFF00FF
                          959595F5F5F5E9E9E9E4E4E4E0E0E0DBDBDBD6D6D6D2D2D2CDCDCDC8C8C8C4C4
                          C4C5C5C59C9C9CFF00FFFF00FFFF00FF9F9F9FF9F9F9EFEFEFE9E9E9E5E5E5E0
                          E0E0DBDBDBD7D7D7D1D1D1CDCDCDC8C8C8C7C7C79C9C9CFF00FFFF00FFFF00FF
                          9F9F9FFEFEFEF3F3F3EEEEEEE9E9E9E4E4E4DFDFDFDBDBDBD7D7D7D1D1D1CCCC
                          CCCCCCCC9C9C9CFF00FFFF00FFFF00FFA6A6A6FFFFFFF9F9F9F3F3F3EEEEEEE9
                          E9E9E5E5E5DFDFDFDBDBDBD7D7D7D2D2D2D1D1D19C9C9CFF00FFFF00FFFF00FF
                          A6A6A6FFFFFFFEFEFEF8F8F8F3F3F3EEEEEEE9E9E9E4E4E4E0E0E0DBDBDBD6D6
                          D6D6D6D69C9C9CFF00FFFF00FFFF00FFB1B1B1FFFFFFFFFFFFFEFEFEF9F9F9F3
                          F3F3EEEEEEE9E9E9E4E4E4DFDFDFDCDCDCD3D3D39C9C9CFF00FFFF00FFFF00FF
                          B1B1B1FFFFFFFFFFFFFFFFFFFEFEFEF8F8F8F3F3F3EEEEEEEBEBEBEAEAEAD5D5
                          D5B7B7B79C9C9CFF00FFFF00FFFF00FFB8B8B8FFFFFFFFFFFFFFFFFFFFFFFFFE
                          FEFEF8F8F8F4F4F4E3E3E39999999999999999999C9C9CFF00FFFF00FFFF00FF
                          B8B8B8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFCFCFCD6D6D6999999ACAC
                          AC9B9B9B969696FF00FFFF00FFFF00FFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFF
                          FFFFFFFFFFFFFFFFDBDBDB999999B8B8B8A2A2A2FF00FFFF00FFFF00FFFF00FF
                          BFBFBFF8F8F8F7F7F7F7F7F7F7F7F7F6F6F6F6F6F6F6F6F6D7D7D7999999AAAA
                          AAFF00FFFF00FFFF00FFFF00FFFF00FFBFBFBFB1B1B1B1B1B1B1B1B1B1B1B1B1
                          B1B1B1B1B1B1B1B1B1B1B1999999FF00FFFF00FFFF00FFFF00FF}
                      end
                      object DBEdit_ClienteVendedor: TDBEdit
                        Left = 98
                        Top = 67
                        Width = 42
                        Height = 21
                        DataField = 'COD_CLIENTE'
                        TabOrder = 8
                      end
                      object DBLookupComboBox_ClienteVendedor: TDBLookupComboBox
                        Left = 143
                        Top = 67
                        Width = 201
                        Height = 21
                        DataField = 'COD_CLIENTE'
                        KeyField = 'COD_CLIENTE'
                        ListField = 'NOME_CLIENTE'
                        TabOrder = 9
                      end
                      object BitBtn_ClienteVendedor_Edit: TBitBtn
                        Left = 348
                        Top = 67
                        Width = 20
                        Height = 20
                        TabOrder = 10
                        OnClick = BitBtn4Click
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
                      end
                      object BitBtn_ClienteVendedor_Novo: TBitBtn
                        Left = 374
                        Top = 67
                        Width = 20
                        Height = 20
                        TabOrder = 11
                        OnClick = BitBtn4Click
                        Glyph.Data = {
                          36030000424D3603000000000000360000002800000010000000100000000100
                          18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
                          9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C
                          9C9C9C9C9C9C9CFF00FFFF00FFFF00FF9C9C9CE9E9E9DEDEDED9D9D9D4D4D4CF
                          CFCFCACACAC5C5C5C3C3C3C4C4C4C4C4C4C7C7C79C9C9CFF00FFFF00FFFF00FF
                          9C9C9CEBEBEBE0E0E0DBDBDBD7D7D7D2D2D2CDCDCDC9C9C9C3C3C3C2C2C2C2C2
                          C2C6C6C69C9C9CFF00FFFF00FFFF00FF959595F0F0F0E5E5E5E0E0E0DCDCDCD7
                          D7D7D2D2D2CECECEC9C9C9C4C4C4C2C2C2C6C6C69C9C9CFF00FFFF00FFFF00FF
                          959595F5F5F5E9E9E9E4E4E4E0E0E0DBDBDBD6D6D6D2D2D2CDCDCDC8C8C8C4C4
                          C4C5C5C59C9C9CFF00FFFF00FFFF00FF9F9F9FF9F9F9EFEFEFE9E9E9E5E5E5E0
                          E0E0DBDBDBD7D7D7D1D1D1CDCDCDC8C8C8C7C7C79C9C9CFF00FFFF00FFFF00FF
                          9F9F9FFEFEFEF3F3F3EEEEEEE9E9E9E4E4E4DFDFDFDBDBDBD7D7D7D1D1D1CCCC
                          CCCCCCCC9C9C9CFF00FFFF00FFFF00FFA6A6A6FFFFFFF9F9F9F3F3F3EEEEEEE9
                          E9E9E5E5E5DFDFDFDBDBDBD7D7D7D2D2D2D1D1D19C9C9CFF00FFFF00FFFF00FF
                          A6A6A6FFFFFFFEFEFEF8F8F8F3F3F3EEEEEEE9E9E9E4E4E4E0E0E0DBDBDBD6D6
                          D6D6D6D69C9C9CFF00FFFF00FFFF00FFB1B1B1FFFFFFFFFFFFFEFEFEF9F9F9F3
                          F3F3EEEEEEE9E9E9E4E4E4DFDFDFDCDCDCD3D3D39C9C9CFF00FFFF00FFFF00FF
                          B1B1B1FFFFFFFFFFFFFFFFFFFEFEFEF8F8F8F3F3F3EEEEEEEBEBEBEAEAEAD5D5
                          D5B7B7B79C9C9CFF00FFFF00FFFF00FFB8B8B8FFFFFFFFFFFFFFFFFFFFFFFFFE
                          FEFEF8F8F8F4F4F4E3E3E39999999999999999999C9C9CFF00FFFF00FFFF00FF
                          B8B8B8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFCFCFCD6D6D6999999ACAC
                          AC9B9B9B969696FF00FFFF00FFFF00FFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFF
                          FFFFFFFFFFFFFFFFDBDBDB999999B8B8B8A2A2A2FF00FFFF00FFFF00FFFF00FF
                          BFBFBFF8F8F8F7F7F7F7F7F7F7F7F7F6F6F6F6F6F6F6F6F6D7D7D7999999AAAA
                          AAFF00FFFF00FFFF00FFFF00FFFF00FFBFBFBFB1B1B1B1B1B1B1B1B1B1B1B1B1
                          B1B1B1B1B1B1B1B1B1B1B1999999FF00FFFF00FFFF00FFFF00FF}
                      end
                      object DBEdit_Concessionaria: TDBEdit
                        Left = 98
                        Top = 92
                        Width = 42
                        Height = 21
                        DataField = 'COD_CLIENTE'
                        TabOrder = 12
                      end
                      object DBLookupComboBox_Concessionaria: TDBLookupComboBox
                        Left = 143
                        Top = 92
                        Width = 201
                        Height = 21
                        DataField = 'COD_CLIENTE'
                        KeyField = 'COD_CLIENTE'
                        ListField = 'NOME_CLIENTE'
                        TabOrder = 13
                      end
                      object BitBtn_Concessionaria_Edit: TBitBtn
                        Left = 348
                        Top = 92
                        Width = 20
                        Height = 20
                        TabOrder = 14
                        OnClick = BitBtn4Click
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
                      end
                      object BitBtn_Concessionaria_Novo: TBitBtn
                        Left = 374
                        Top = 92
                        Width = 20
                        Height = 20
                        TabOrder = 15
                        OnClick = BitBtn4Click
                        Glyph.Data = {
                          36030000424D3603000000000000360000002800000010000000100000000100
                          18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
                          9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C
                          9C9C9C9C9C9C9CFF00FFFF00FFFF00FF9C9C9CE9E9E9DEDEDED9D9D9D4D4D4CF
                          CFCFCACACAC5C5C5C3C3C3C4C4C4C4C4C4C7C7C79C9C9CFF00FFFF00FFFF00FF
                          9C9C9CEBEBEBE0E0E0DBDBDBD7D7D7D2D2D2CDCDCDC9C9C9C3C3C3C2C2C2C2C2
                          C2C6C6C69C9C9CFF00FFFF00FFFF00FF959595F0F0F0E5E5E5E0E0E0DCDCDCD7
                          D7D7D2D2D2CECECEC9C9C9C4C4C4C2C2C2C6C6C69C9C9CFF00FFFF00FFFF00FF
                          959595F5F5F5E9E9E9E4E4E4E0E0E0DBDBDBD6D6D6D2D2D2CDCDCDC8C8C8C4C4
                          C4C5C5C59C9C9CFF00FFFF00FFFF00FF9F9F9FF9F9F9EFEFEFE9E9E9E5E5E5E0
                          E0E0DBDBDBD7D7D7D1D1D1CDCDCDC8C8C8C7C7C79C9C9CFF00FFFF00FFFF00FF
                          9F9F9FFEFEFEF3F3F3EEEEEEE9E9E9E4E4E4DFDFDFDBDBDBD7D7D7D1D1D1CCCC
                          CCCCCCCC9C9C9CFF00FFFF00FFFF00FFA6A6A6FFFFFFF9F9F9F3F3F3EEEEEEE9
                          E9E9E5E5E5DFDFDFDBDBDBD7D7D7D2D2D2D1D1D19C9C9CFF00FFFF00FFFF00FF
                          A6A6A6FFFFFFFEFEFEF8F8F8F3F3F3EEEEEEE9E9E9E4E4E4E0E0E0DBDBDBD6D6
                          D6D6D6D69C9C9CFF00FFFF00FFFF00FFB1B1B1FFFFFFFFFFFFFEFEFEF9F9F9F3
                          F3F3EEEEEEE9E9E9E4E4E4DFDFDFDCDCDCD3D3D39C9C9CFF00FFFF00FFFF00FF
                          B1B1B1FFFFFFFFFFFFFFFFFFFEFEFEF8F8F8F3F3F3EEEEEEEBEBEBEAEAEAD5D5
                          D5B7B7B79C9C9CFF00FFFF00FFFF00FFB8B8B8FFFFFFFFFFFFFFFFFFFFFFFFFE
                          FEFEF8F8F8F4F4F4E3E3E39999999999999999999C9C9CFF00FFFF00FFFF00FF
                          B8B8B8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFCFCFCD6D6D6999999ACAC
                          AC9B9B9B969696FF00FFFF00FFFF00FFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFF
                          FFFFFFFFFFFFFFFFDBDBDB999999B8B8B8A2A2A2FF00FFFF00FFFF00FFFF00FF
                          BFBFBFF8F8F8F7F7F7F7F7F7F7F7F7F6F6F6F6F6F6F6F6F6D7D7D7999999AAAA
                          AAFF00FFFF00FFFF00FFFF00FFFF00FFBFBFBFB1B1B1B1B1B1B1B1B1B1B1B1B1
                          B1B1B1B1B1B1B1B1B1B1B1999999FF00FFFF00FFFF00FFFF00FF}
                      end
                      object TEdit
                        Left = 160
                        Top = -24
                        Width = 121
                        Height = 21
                        TabOrder = 16
                      end
                    end
                    object GroupBox25: TGroupBox
                      Left = 3
                      Top = 320
                      Width = 433
                      Height = 68
                      TabOrder = 2
                      object Label80: TLabel
                        Left = 35
                        Top = 14
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
                      object Label_Gerente: TLabel
                        Left = 41
                        Top = 41
                        Width = 41
                        Height = 13
                        Caption = 'Gerente:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        ParentFont = False
                      end
                      object DBLookupComboBox15: TDBLookupComboBox
                        Left = 90
                        Top = 9
                        Width = 304
                        Height = 21
                        DataField = 'COD_CLIENTE'
                        KeyField = 'COD_CLIENTE'
                        ListField = 'NOME_CLIENTE'
                        TabOrder = 0
                      end
                      object DBLookupComboBox_Gerente: TDBLookupComboBox
                        Left = 90
                        Top = 37
                        Width = 304
                        Height = 21
                        DataField = 'COD_CLIENTE'
                        KeyField = 'COD_CLIENTE'
                        ListField = 'NOME_CLIENTE'
                        TabOrder = 1
                      end
                    end
                    object GroupBox18: TGroupBox
                      Left = 3
                      Top = 12
                      Width = 433
                      Height = 91
                      TabOrder = 3
                      object Label29: TLabel
                        Left = 68
                        Top = 36
                        Width = 24
                        Height = 13
                        Caption = 'Tipo:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = []
                        ParentFont = False
                      end
                      object Label14: TLabel
                        Left = 57
                        Top = 61
                        Width = 35
                        Height = 13
                        Caption = 'Chassi:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clYellow
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = []
                        ParentFont = False
                        OnClick = Label14Click
                      end
                      object Label8: TLabel
                        Left = 56
                        Top = 13
                        Width = 37
                        Height = 13
                        Caption = 'C'#243'digo:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = []
                        ParentFont = False
                      end
                      object DBLookupComboBox5: TDBLookupComboBox
                        Left = 98
                        Top = 34
                        Width = 173
                        Height = 21
                        DataField = 'COD_CLIENTE'
                        KeyField = 'COD_CLIENTE'
                        ListField = 'NOME_CLIENTE'
                        TabOrder = 0
                      end
                      object DBEdit3: TDBEdit
                        Left = 98
                        Top = 61
                        Width = 242
                        Height = 21
                        CharCase = ecUpperCase
                        DataField = 'CHASSI'
                        TabOrder = 1
                      end
                      object BitBtn8: TBitBtn
                        Left = 346
                        Top = 64
                        Width = 20
                        Height = 20
                        TabOrder = 2
                        OnClick = BitBtn8Click
                        Glyph.Data = {
                          36030000424D3603000000000000360000002800000010000000100000000100
                          18000000000000030000120B0000120B00000000000000000000FF00FF4A667C
                          BE9596FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                          FFFF00FFFF00FFFF00FF6B9CC31E89E84B7AA3C89693FF00FFFF00FFFF00FFFF
                          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4BB4FE51B5FF
                          2089E94B7AA2C69592FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                          FFFF00FFFF00FFFF00FFFF00FF51B7FE51B3FF1D87E64E7AA0CA9792FF00FFFF
                          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                          51B7FE4EB2FF1F89E64E7BA2B99497FF00FFFF00FFFF00FFFF00FFFF00FFFF00
                          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF52B8FE4BB1FF2787D95F6A76FF
                          00FFB0857FC09F94C09F96BC988EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                          FF00FFFF00FF55BDFFB5D6EDBF9D92BB9B8CE7DAC2FFFFE3FFFFE5FDFADAD8C3
                          B3B58D85FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCEA795FD
                          EEBEFFFFD8FFFFDAFFFFDBFFFFE6FFFFFBEADDDCAE837FFF00FFFF00FFFF00FF
                          FF00FFFF00FFFF00FFFF00FFC1A091FBDCA8FEF7D0FFFFDBFFFFE3FFFFF8FFFF
                          FDFFFFFDC6A99CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC1A091FEE3ACF1
                          C491FCF2CAFFFFDDFFFFE4FFFFF7FFFFF7FFFFE9EEE5CBB9948CFF00FFFF00FF
                          FF00FFFF00FFFF00FFC2A191FFE6AEEEB581F7DCAEFEFDD8FFFFDFFFFFE3FFFF
                          E4FFFFE0F3ECD2BB968EFF00FFFF00FFFF00FFFF00FFFF00FFBC978CFBE7B7F4
                          C791F2C994F8E5B9FEFCD8FFFFDDFFFFDCFFFFE0E2D2BAB68E86FF00FFFF00FF
                          FF00FFFF00FFFF00FFFF00FFD9C3A9FFFEE5F7DCB8F2C994F5D4A5FAE8BDFDF4
                          C9FDFBD6B69089FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB58D85E8
                          DEDDFFFEF2F9D8A3F4C48CF9D49FFDEAB8D0B49FB89086FF00FFFF00FFFF00FF
                          FF00FFFF00FFFF00FFFF00FFFF00FFAD827FC9AA9EEFE0B7EFDFB2E7CEACB890
                          86B89086FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                          00FFFF00FFBA968ABB988CB79188FF00FFFF00FFFF00FFFF00FF}
                      end
                      object DBEdit4: TDBEdit
                        Left = 98
                        Top = 10
                        Width = 173
                        Height = 21
                        CharCase = ecUpperCase
                        DataField = 'CHASSI'
                        TabOrder = 3
                      end
                    end
                    object GroupBox4: TGroupBox
                      Left = 3
                      Top = 220
                      Width = 433
                      Height = 102
                      Color = clBtnFace
                      ParentColor = False
                      TabOrder = 4
                      object Label7: TLabel
                        Left = 12
                        Top = 20
                        Width = 80
                        Height = 13
                        Caption = 'Valor a Receber:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -5
                        Font.Name = 'MS Sans Serif'
                        Font.Style = [fsUnderline]
                        ParentFont = False
                      end
                      object Label_DataVenda: TLabel
                        Left = 17
                        Top = 75
                        Width = 74
                        Height = 13
                        Caption = 'Data da venda:'
                        Font.Charset = ANSI_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = [fsUnderline]
                        ParentFont = False
                      end
                      object Label6: TLabel
                        Left = 40
                        Top = 48
                        Width = 52
                        Height = 13
                        Caption = 'Valor Real:'
                        Font.Charset = ANSI_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = [fsUnderline]
                        ParentFont = False
                      end
                      object DBEdit2: TDBEdit
                        Left = 99
                        Top = 16
                        Width = 120
                        Height = 21
                        CharCase = ecUpperCase
                        DataField = 'CHASSI'
                        TabOrder = 0
                      end
                      object BitBtn15: TBitBtn
                        Left = 225
                        Top = 16
                        Width = 169
                        Height = 48
                        Caption = '&Condi'#231#245'es de Negocia'#231#227'o'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clYellow
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = []
                        ParentFont = False
                        TabOrder = 1
                        OnClick = BitBtn15Click
                        Glyph.Data = {
                          F6010000424DF601000000000000F60000002800000010000000100000000100
                          08000000000000010000120B0000120B0000300000003000000000000000FFFF
                          FF00FF00FF00811E000089230000932B0000912900008E2700008C2700009C31
                          00009A310000992F000099300000982F0000952D00009C3302009A320200A639
                          0000A3360000A3370000A1350000A13600009F3500009E3400009A3201009D35
                          0400AF400000AD3F0000AC3E0000AB3D0000AA3C0000AA3D0000A93B0000A93C
                          0000A73A0000A73B0000B5440000B1410000B0410000AF410000C14E0000C14F
                          0000CE5B0300CE5E0700D1620700D0600700DD6B0600DD6B0700020202020202
                          14121314020202020202020202021E2823030312210C02020202020202192E03
                          02020202022704020202020202182C020215260D0202160202020202020F2D02
                          161E0A1D0B02170202020202020F2B02250202091102170202020202020F2B02
                          1D02021C1302170202020202020F2B021D02021C1302170202020202020F2B02
                          1D02021B1702050202020202020F2B021D02021B1702020202020202020F2B02
                          1B02021B1702020202020202020F2D020802021A1702020202020202020F2C02
                          02020220160202020202020202102F0202020220090202020202020202022A29
                          02021F2202020202020202020202022407060E02020202020202}
                      end
                      object CheckBox_VeiculoRodando: TCheckBox
                        Left = 227
                        Top = 76
                        Width = 97
                        Height = 17
                        Caption = 'Ve'#237'culo Rodando'
                        TabOrder = 2
                      end
                      object DBEdit_DataVenda: TDBEdit
                        Left = 97
                        Top = 70
                        Width = 121
                        Height = 21
                        CharCase = ecUpperCase
                        DataField = 'CHASSI'
                        TabOrder = 3
                      end
                      object DBEdit1: TDBEdit
                        Left = 98
                        Top = 43
                        Width = 121
                        Height = 21
                        CharCase = ecUpperCase
                        DataField = 'CHASSI'
                        TabOrder = 4
                      end
                    end
                    object GroupBox_Informacoes: TGroupBox
                      Left = 442
                      Top = 100
                      Width = 332
                      Height = 374
                      TabOrder = 6
                      object Label31: TLabel
                        Left = 3
                        Top = 7
                        Width = 179
                        Height = 13
                        Caption = 'Documento, Manual, Chave Reserva:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        ParentFont = False
                      end
                      object Label32: TLabel
                        Left = 5
                        Top = 76
                        Width = 34
                        Height = 13
                        Caption = 'Multas:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        ParentFont = False
                      end
                      object Label33: TLabel
                        Left = 5
                        Top = 143
                        Width = 66
                        Height = 13
                        Caption = 'Observa'#231#245'es:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        ParentFont = False
                      end
                      object Label38: TLabel
                        Left = 5
                        Top = 209
                        Width = 102
                        Height = 13
                        Caption = 'Promessas de venda:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        ParentFont = False
                      end
                      object Label39: TLabel
                        Left = 6
                        Top = 291
                        Width = 78
                        Height = 13
                        Caption = 'Controle Interno:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        ParentFont = False
                      end
                      object Memo4: TMemo
                        Left = 3
                        Top = 90
                        Width = 323
                        Height = 49
                        Lines.Strings = (
                          'Memo3')
                        TabOrder = 0
                      end
                      object Memo5: TMemo
                        Left = 4
                        Top = 157
                        Width = 322
                        Height = 49
                        Lines.Strings = (
                          'Memo3')
                        TabOrder = 1
                      end
                      object Memo6: TMemo
                        Left = 6
                        Top = 306
                        Width = 320
                        Height = 63
                        Lines.Strings = (
                          'Memo3')
                        TabOrder = 2
                      end
                      object Memo7: TMemo
                        Left = 5
                        Top = 224
                        Width = 321
                        Height = 64
                        Lines.Strings = (
                          'Memo3')
                        TabOrder = 3
                      end
                      object Memo3: TMemo
                        Left = 3
                        Top = 23
                        Width = 323
                        Height = 50
                        Lines.Strings = (
                          'Memo3')
                        TabOrder = 4
                      end
                    end
                    object GroupBox20: TGroupBox
                      Left = 442
                      Top = 12
                      Width = 332
                      Height = 91
                      Caption = 'Utilizado na troca'
                      TabOrder = 5
                      object Label28: TLabel
                        Left = 58
                        Top = 15
                        Width = 34
                        Height = 13
                        Caption = 'Chassi:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clYellow
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        ParentFont = False
                      end
                      object Label30: TLabel
                        Left = 42
                        Top = 41
                        Width = 50
                        Height = 13
                        Caption = 'Opcionais:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        ParentFont = False
                      end
                      object BitBtn11: TBitBtn
                        Left = 306
                        Top = 12
                        Width = 20
                        Height = 20
                        TabOrder = 0
                        OnClick = BitBtn11Click
                        Glyph.Data = {
                          36030000424D3603000000000000360000002800000010000000100000000100
                          18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
                          9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C
                          9C9C9C9C9C9C9CFF00FFFF00FFFF00FF9C9C9CE9E9E9DEDEDED9D9D9D4D4D4CF
                          CFCFCACACAC5C5C5C3C3C3C4C4C4C4C4C4C7C7C79C9C9CFF00FFFF00FFFF00FF
                          9C9C9CEBEBEBE0E0E0DBDBDBD7D7D7D2D2D2CDCDCDC9C9C9C3C3C3C2C2C2C2C2
                          C2C6C6C69C9C9CFF00FFFF00FFFF00FF959595F0F0F0E5E5E5E0E0E0DCDCDCD7
                          D7D7D2D2D2CECECEC9C9C9C4C4C4C2C2C2C6C6C69C9C9CFF00FFFF00FFFF00FF
                          959595F5F5F5E9E9E9E4E4E4E0E0E0DBDBDBD6D6D6D2D2D2CDCDCDC8C8C8C4C4
                          C4C5C5C59C9C9CFF00FFFF00FFFF00FF9F9F9FF9F9F9EFEFEFE9E9E9E5E5E5E0
                          E0E0DBDBDBD7D7D7D1D1D1CDCDCDC8C8C8C7C7C79C9C9CFF00FFFF00FFFF00FF
                          9F9F9FFEFEFEF3F3F3EEEEEEE9E9E9E4E4E4DFDFDFDBDBDBD7D7D7D1D1D1CCCC
                          CCCCCCCC9C9C9CFF00FFFF00FFFF00FFA6A6A6FFFFFFF9F9F9F3F3F3EEEEEEE9
                          E9E9E5E5E5DFDFDFDBDBDBD7D7D7D2D2D2D1D1D19C9C9CFF00FFFF00FFFF00FF
                          A6A6A6FFFFFFFEFEFEF8F8F8F3F3F3EEEEEEE9E9E9E4E4E4E0E0E0DBDBDBD6D6
                          D6D6D6D69C9C9CFF00FFFF00FFFF00FFB1B1B1FFFFFFFFFFFFFEFEFEF9F9F9F3
                          F3F3EEEEEEE9E9E9E4E4E4DFDFDFDCDCDCD3D3D39C9C9CFF00FFFF00FFFF00FF
                          B1B1B1FFFFFFFFFFFFFFFFFFFEFEFEF8F8F8F3F3F3EEEEEEEBEBEBEAEAEAD5D5
                          D5B7B7B79C9C9CFF00FFFF00FFFF00FFB8B8B8FFFFFFFFFFFFFFFFFFFFFFFFFE
                          FEFEF8F8F8F4F4F4E3E3E39999999999999999999C9C9CFF00FFFF00FFFF00FF
                          B8B8B8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFCFCFCD6D6D6999999ACAC
                          AC9B9B9B969696FF00FFFF00FFFF00FFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFF
                          FFFFFFFFFFFFFFFFDBDBDB999999B8B8B8A2A2A2FF00FFFF00FFFF00FFFF00FF
                          BFBFBFF8F8F8F7F7F7F7F7F7F7F7F7F6F6F6F6F6F6F6F6F6D7D7D7999999AAAA
                          AAFF00FFFF00FFFF00FFFF00FFFF00FFBFBFBFB1B1B1B1B1B1B1B1B1B1B1B1B1
                          B1B1B1B1B1B1B1B1B1B1B1999999FF00FFFF00FFFF00FFFF00FF}
                      end
                      object BitBtn12: TBitBtn
                        Left = 280
                        Top = 12
                        Width = 20
                        Height = 20
                        TabOrder = 1
                        OnClick = BitBtn12Click
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
                      end
                      object DBEdit13: TDBEdit
                        Left = 98
                        Top = 11
                        Width = 176
                        Height = 21
                        CharCase = ecUpperCase
                        DataField = 'CHASSI'
                        Enabled = False
                        TabOrder = 2
                      end
                      object Memo8: TMemo
                        Left = 98
                        Top = 38
                        Width = 228
                        Height = 45
                        Lines.Strings = (
                          'Memo3')
                        TabOrder = 3
                      end
                    end
                  end
                end
              end
              object TabSheet_Consignado: TTabSheet
                Caption = 'Contrato'
                ImageIndex = 3
                ExplicitLeft = 0
                ExplicitTop = 0
                ExplicitWidth = 0
                ExplicitHeight = 0
                object ScrollBox6: TScrollBox
                  Left = 0
                  Top = 0
                  Width = 781
                  Height = 483
                  Align = alClient
                  BevelInner = bvNone
                  BevelOuter = bvNone
                  TabOrder = 0
                  object GroupBox16: TGroupBox
                    Left = 0
                    Top = 0
                    Width = 776
                    Height = 145
                    Caption = 'Contrato de Consigna'#231#227'o'
                    TabOrder = 0
                    object Label34: TLabel
                      Left = 47
                      Top = 25
                      Width = 62
                      Height = 13
                      Caption = 'Consignante:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                    end
                    object Label36: TLabel
                      Left = 74
                      Top = 51
                      Width = 35
                      Height = 13
                      Caption = 'Chassi:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                    end
                    object Label37: TLabel
                      Left = 57
                      Top = 78
                      Width = 52
                      Height = 13
                      Caption = 'Valor Real:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                    end
                    object Label81: TLabel
                      Left = 60
                      Top = 105
                      Width = 49
                      Height = 13
                      Caption = 'Comiss'#227'o:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                    end
                    object DBEdit15: TDBEdit
                      Left = 115
                      Top = 21
                      Width = 42
                      Height = 21
                      DataField = 'COD_CLIENTE'
                      TabOrder = 0
                    end
                    object DBLookupComboBox1: TDBLookupComboBox
                      Left = 160
                      Top = 21
                      Width = 201
                      Height = 21
                      DataField = 'COD_CLIENTE'
                      KeyField = 'COD_CLIENTE'
                      ListField = 'NOME_CLIENTE'
                      TabOrder = 1
                    end
                    object BitBtn7: TBitBtn
                      Left = 365
                      Top = 21
                      Width = 20
                      Height = 20
                      TabOrder = 2
                      OnClick = BitBtn4Click
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
                    end
                    object BitBtn9: TBitBtn
                      Left = 391
                      Top = 21
                      Width = 20
                      Height = 20
                      TabOrder = 3
                      OnClick = BitBtn4Click
                      Glyph.Data = {
                        36030000424D3603000000000000360000002800000010000000100000000100
                        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
                        9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C
                        9C9C9C9C9C9C9CFF00FFFF00FFFF00FF9C9C9CE9E9E9DEDEDED9D9D9D4D4D4CF
                        CFCFCACACAC5C5C5C3C3C3C4C4C4C4C4C4C7C7C79C9C9CFF00FFFF00FFFF00FF
                        9C9C9CEBEBEBE0E0E0DBDBDBD7D7D7D2D2D2CDCDCDC9C9C9C3C3C3C2C2C2C2C2
                        C2C6C6C69C9C9CFF00FFFF00FFFF00FF959595F0F0F0E5E5E5E0E0E0DCDCDCD7
                        D7D7D2D2D2CECECEC9C9C9C4C4C4C2C2C2C6C6C69C9C9CFF00FFFF00FFFF00FF
                        959595F5F5F5E9E9E9E4E4E4E0E0E0DBDBDBD6D6D6D2D2D2CDCDCDC8C8C8C4C4
                        C4C5C5C59C9C9CFF00FFFF00FFFF00FF9F9F9FF9F9F9EFEFEFE9E9E9E5E5E5E0
                        E0E0DBDBDBD7D7D7D1D1D1CDCDCDC8C8C8C7C7C79C9C9CFF00FFFF00FFFF00FF
                        9F9F9FFEFEFEF3F3F3EEEEEEE9E9E9E4E4E4DFDFDFDBDBDBD7D7D7D1D1D1CCCC
                        CCCCCCCC9C9C9CFF00FFFF00FFFF00FFA6A6A6FFFFFFF9F9F9F3F3F3EEEEEEE9
                        E9E9E5E5E5DFDFDFDBDBDBD7D7D7D2D2D2D1D1D19C9C9CFF00FFFF00FFFF00FF
                        A6A6A6FFFFFFFEFEFEF8F8F8F3F3F3EEEEEEE9E9E9E4E4E4E0E0E0DBDBDBD6D6
                        D6D6D6D69C9C9CFF00FFFF00FFFF00FFB1B1B1FFFFFFFFFFFFFEFEFEF9F9F9F3
                        F3F3EEEEEEE9E9E9E4E4E4DFDFDFDCDCDCD3D3D39C9C9CFF00FFFF00FFFF00FF
                        B1B1B1FFFFFFFFFFFFFFFFFFFEFEFEF8F8F8F3F3F3EEEEEEEBEBEBEAEAEAD5D5
                        D5B7B7B79C9C9CFF00FFFF00FFFF00FFB8B8B8FFFFFFFFFFFFFFFFFFFFFFFFFE
                        FEFEF8F8F8F4F4F4E3E3E39999999999999999999C9C9CFF00FFFF00FFFF00FF
                        B8B8B8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFCFCFCD6D6D6999999ACAC
                        AC9B9B9B969696FF00FFFF00FFFF00FFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFF
                        FFFFFFFFFFFFFFFFDBDBDB999999B8B8B8A2A2A2FF00FFFF00FFFF00FFFF00FF
                        BFBFBFF8F8F8F7F7F7F7F7F7F7F7F7F6F6F6F6F6F6F6F6F6D7D7D7999999AAAA
                        AAFF00FFFF00FFFF00FFFF00FFFF00FFBFBFBFB1B1B1B1B1B1B1B1B1B1B1B1B1
                        B1B1B1B1B1B1B1B1B1B1B1999999FF00FFFF00FFFF00FFFF00FF}
                    end
                    object DBEdit16: TDBEdit
                      Left = 115
                      Top = 48
                      Width = 220
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'CHASSI'
                      TabOrder = 4
                    end
                    object BitBtn14: TBitBtn
                      Left = 341
                      Top = 47
                      Width = 20
                      Height = 20
                      TabOrder = 5
                      OnClick = BitBtn4Click
                      Glyph.Data = {
                        36030000424D3603000000000000360000002800000010000000100000000100
                        18000000000000030000120B0000120B00000000000000000000FF00FF4A667C
                        BE9596FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                        FFFF00FFFF00FFFF00FF6B9CC31E89E84B7AA3C89693FF00FFFF00FFFF00FFFF
                        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4BB4FE51B5FF
                        2089E94B7AA2C69592FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                        FFFF00FFFF00FFFF00FFFF00FF51B7FE51B3FF1D87E64E7AA0CA9792FF00FFFF
                        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                        51B7FE4EB2FF1F89E64E7BA2B99497FF00FFFF00FFFF00FFFF00FFFF00FFFF00
                        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF52B8FE4BB1FF2787D95F6A76FF
                        00FFB0857FC09F94C09F96BC988EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                        FF00FFFF00FF55BDFFB5D6EDBF9D92BB9B8CE7DAC2FFFFE3FFFFE5FDFADAD8C3
                        B3B58D85FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCEA795FD
                        EEBEFFFFD8FFFFDAFFFFDBFFFFE6FFFFFBEADDDCAE837FFF00FFFF00FFFF00FF
                        FF00FFFF00FFFF00FFFF00FFC1A091FBDCA8FEF7D0FFFFDBFFFFE3FFFFF8FFFF
                        FDFFFFFDC6A99CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC1A091FEE3ACF1
                        C491FCF2CAFFFFDDFFFFE4FFFFF7FFFFF7FFFFE9EEE5CBB9948CFF00FFFF00FF
                        FF00FFFF00FFFF00FFC2A191FFE6AEEEB581F7DCAEFEFDD8FFFFDFFFFFE3FFFF
                        E4FFFFE0F3ECD2BB968EFF00FFFF00FFFF00FFFF00FFFF00FFBC978CFBE7B7F4
                        C791F2C994F8E5B9FEFCD8FFFFDDFFFFDCFFFFE0E2D2BAB68E86FF00FFFF00FF
                        FF00FFFF00FFFF00FFFF00FFD9C3A9FFFEE5F7DCB8F2C994F5D4A5FAE8BDFDF4
                        C9FDFBD6B69089FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB58D85E8
                        DEDDFFFEF2F9D8A3F4C48CF9D49FFDEAB8D0B49FB89086FF00FFFF00FFFF00FF
                        FF00FFFF00FFFF00FFFF00FFFF00FFAD827FC9AA9EEFE0B7EFDFB2E7CEACB890
                        86B89086FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                        00FFFF00FFBA968ABB988CB79188FF00FFFF00FFFF00FFFF00FF}
                    end
                    object DBEdit17: TDBEdit
                      Left = 115
                      Top = 75
                      Width = 121
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'CHASSI'
                      TabOrder = 6
                    end
                    object DBEdit18: TDBEdit
                      Left = 115
                      Top = 102
                      Width = 121
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'CHASSI'
                      TabOrder = 7
                    end
                  end
                  object GroupBox19: TGroupBox
                    Left = 0
                    Top = 279
                    Width = 776
                    Height = 74
                    Caption = 'Imprimir'
                    TabOrder = 1
                    object BitBtn30: TBitBtn
                      Left = 341
                      Top = 23
                      Width = 101
                      Height = 33
                      Caption = '&Contrato'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clBlack
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 0
                      OnClick = BitBtn15Click
                      Glyph.Data = {
                        36030000424D3603000000000000360000002800000010000000100000000100
                        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
                        FF00FFFF00FF868484868484FF00FFFF00FF868484868484FF00FFFF00FFFF00
                        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF868484BCBABAB5B3B386848486
                        8484868484EBEAEA868484868484868484FF00FFFF00FFFF00FFFF00FFFF00FF
                        868484E3E2E2B5B3B3B5B3B3B5B3B35150504F4F4F868787CDCDCDE8E9E9C7C6
                        C6868484868484868484FF00FF868484DEDDDDD6D6D6A4A3A3A4A3A3A4A3A356
                        5555161516121212181818121212939393CACACA868484FF00FF868484D6D6D6
                        D6D6D6A4A3A3E0DEDED9D7D7CDCBCBC2C0C0B6B4B49F9D9D7976771212121414
                        141313138684848F8C8C868484D6D6D6A4A3A3F3F2F2FFFEFEFCFBFBEAE7E8E6
                        E6E6E6E5E5DAD9D9CCCBCBBFBDBDA2A0A07371719391918E8C8C868484A4A3A3
                        FFFFFFFEFDFDFBFBFBDFDEDFADA7A9B4ADAEC3BDBED1CECFE0E0E0E1E1E1D4D3
                        D3C7C6C6A7A5A5868383FF00FF868484868484F1F0F0C2B9BA93898BA19B9FAB
                        A8AAABA6A7B1ACADAFA9AAB2ADAECAC9C9DCDCDCD0D0D0868484FF00FFFF00FF
                        FF00FF868484CAA097BA9E87A2897E95817B897C7F928C92A5A2A4BBB6B7D7D6
                        D6CFCFCF868484FF00FFFF00FFFF00FFFF00FFFF00FFCC9A99FFEAC4FFDDB3EE
                        C399D5AE8CC9A786CC9A99989596868484868484FF00FFFF00FFFF00FFFF00FF
                        FF00FFFF00FFCC9A99FFE7C8FFDDBAFFDBB1FFD9A6FFD39FCC9A99FF00FFFF00
                        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCE9D9BFFEDDAFFE7CEFFE2C3FF
                        DDB8FFDBAECC9A99FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                        FF00FFCC9A99FEF0E1FFECD8FFE6CCFFE1C2FEDDB7CC9A99FF00FFFF00FFFF00
                        FFFF00FFFF00FFFF00FFFF00FFFF00FFCC9A99FFFFF5FFFFF5FFF0E1FFEBD6FF
                        E8CCF6D4BACC9A99FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                        CC9A99CC9A99CC9A99FCF3E9FCEADAFCE5D0CC9A99FF00FFFF00FFFF00FFFF00
                        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCC9A99CC9A99CC
                        9A99FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                    end
                  end
                  object GroupBox26: TGroupBox
                    Left = 0
                    Top = 151
                    Width = 776
                    Height = 122
                    Caption = 'Per'#237'odo de Contrato'
                    TabOrder = 2
                    object Label82: TLabel
                      Left = 24
                      Top = 30
                      Width = 85
                      Height = 13
                      Caption = 'Dura'#231#227'o (meses):'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                    end
                    object Label83: TLabel
                      Left = 80
                      Top = 57
                      Width = 29
                      Height = 13
                      Caption = 'In'#237'cio:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                    end
                    object Label84: TLabel
                      Left = 67
                      Top = 84
                      Width = 42
                      Height = 13
                      Caption = 'T'#233'rmino:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                    end
                    object DBEdit19: TDBEdit
                      Left = 115
                      Top = 27
                      Width = 121
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'CHASSI'
                      TabOrder = 0
                    end
                    object DBEdit21: TDBEdit
                      Left = 115
                      Top = 54
                      Width = 121
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'CHASSI'
                      TabOrder = 1
                    end
                    object DBEdit22: TDBEdit
                      Left = 115
                      Top = 81
                      Width = 121
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'CHASSI'
                      TabOrder = 2
                    end
                  end
                end
              end
            end
            inherited Panel3: TPanel
              Top = 511
              ExplicitTop = 511
            end
          end
        end
        inherited TabSheet2: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 24
          ExplicitWidth = 789
          ExplicitHeight = 559
          inherited GroupBox3: TGroupBox
            Height = 193
            ExplicitHeight = 193
            object chw: TGroupBox
              Left = 3
              Top = 74
              Width = 163
              Height = 115
              Caption = 'Tipo de Venda'
              TabOrder = 11
              object CheckBox6: TCheckBox
                Left = 9
                Top = 40
                Width = 112
                Height = 17
                Caption = 'Contrato de Venda'
                TabOrder = 0
              end
              object CheckBox8: TCheckBox
                Left = 9
                Top = 17
                Width = 109
                Height = 17
                Caption = 'Venda de Ve'#237'culo'
                TabOrder = 1
              end
              object CheckBox9: TCheckBox
                Left = 9
                Top = 63
                Width = 127
                Height = 17
                Caption = 'Contrato Consignado'
                TabOrder = 2
              end
              object CheckBox10: TCheckBox
                Left = 9
                Top = 85
                Width = 127
                Height = 17
                Caption = 'Intermedia'#231#227'o'
                TabOrder = 3
              end
            end
            object Edit1: TEdit
              Left = 536
              Top = 87
              Width = 121
              Height = 21
              TabOrder = 12
              Text = 'EDIT PARA FUNCIONAR'
              Visible = False
            end
          end
          inherited Panel1: TPanel
            Top = 193
            Height = 366
            ExplicitTop = 193
            ExplicitHeight = 366
            inherited Splitter1: TSplitter
              Height = 305
              ExplicitHeight = 475
            end
            inherited DBGrid1: TDBGrid
              Height = 305
            end
            inherited Panel2: TPanel
              inherited SpeedButton6: TSpeedButton
                Hint = 'Enviar para Estoque'
                Glyph.Data = {
                  12050000424D1205000000000000D20200002800000018000000180000000100
                  08000000000040020000120B0000120B0000A7000000A700000000000000FFFF
                  FF00FF00FF008E5D590080504B009365600093655E0092635D00956660009365
                  5F00986963009E6E6400A3726600A7756800811E0000AC796900B17E6B00FFFC
                  FB00BB846E00B6816C00C0896F00FAF6F400F6EEE900F8F3F000FEF7F200FBF7
                  F400FEF8F300F2E2D300FAEEE300F4EAE100FBF2EA00EED7C000EFDAC500F0DE
                  CC00F2E6DA00FAEEE200FBF3EB00FEF7F000EFD3B400EED4B800F6DEC400F6E3
                  CE00F7E6D300F8EEE300FBF3EA00EAC18E00F2D4AF00F2D4B000F2D4B100F2D5
                  B100F2D8B800F4DABB00F3DABC00F6E0C600F6E2CB00FAEAD700F8EADA00F7EA
                  DA00F8EBDC00E9BF8700EDC58F00EFC79100EBC59200EDC79500EDC79600EDC9
                  9900EECA9C00EECB9C00EECB9D00EECB9F00EFCEA100F2D1A500EFCEA300EFCF
                  A400EFD0A600F0D1A900F0D1AA00F3D5AD00F0D4B000F6DAB600F3D8B600F3D9
                  B700F2D8B600F2D8B700F2D9B800F3DCBD00F3DCBF00F7E2C700F8E6CF00F8EB
                  DA00FAEEDE00FBF2E600F8EFE300EDC18000EABF7F00EBC08000E9BD7F00E7BB
                  7E00E7BC7E00EBC18200E7BC8000EABF8200EEC58900EBC28800EBC48E00EFCB
                  9700EEC99600F0CE9E00EDCB9C00EFCFA300F6E0C100FCF6ED00FEFBF600B2A1
                  8100B1A08000B1A18100B4A68A00B5AB9600B7B0A000FFFEFB00B7B5AB00BABA
                  B500FFFFFE00BCC0C10000BDFF000562A000004B82003696F0003897F0003C9A
                  F0003F9CF2003E9CF000409DF200288AEE00298BEE002B8CEE002D8EEE002E8F
                  EF003090EF003292EF003493EF003595F0003896F0003998F2003B98F0003D9A
                  F2001277E9001168C9001579EA00167AEA00177BEA00156CCB001B7EEB001C7F
                  EB001E81EB001F82EB002386ED002487EE002788ED000F73E9000D62C6001074
                  EA001175EA00095CC600095CC5000A5DC50007397A0002020202020202020202
                  0202020202020202020202020202020207030303030303030303030303030303
                  030304020202020206264F4D476B693D66635F5F5F5F5F5F5D5E040202020202
                  092733314C6D444074A67160606060605E62040202020202091F6E54304C4975
                  A6A4A671606060605E6204020202020209205756532F76A6A59FA4A672606060
                  5E62040202020202052158355578A6A09894A1A4A67360605E62040202020202
                  081B372979A693869C9995A2A3A672605E620402020202020A225A7BA697808B
                  879D9A9692A5A6725E620402020202020B1D5BA6A6A6A68F8C889E9BA6A6A6A6
                  65610402020202020C166F5C392AA682908D8985A6423F686764040202020202
                  0D1770242B3AA68484817F8AA6486C3F3C3B0402020202020F157A1A1E2BA684
                  8484918EA64C48436A2D04020202020210150177252CA68484848483A62F4B46
                  433E040202020202131501011118A6A6A6A6A6A6A6502E4A4541040202020202
                  121501010177182C1C382A36283452324E4A0402020202021419010101017718
                  1E23592A3628555555510402020202027D7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E
                  7E7E7E02020202027D7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7E0202020202
                  7D7C7C0E0E0E0E0E0E0E0E0E0E0E0E0E7C7C7E02020202027D7C7C7C7C7C7C7C
                  7C7C7C7C7C7C7C7C7C7C7E02020202027D7C7C0E0E0E0E0E0E0E0E0E0E0E0E0E
                  7C7C7E02020202027D7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7E0202020202
                  7D7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E020202}
                OnClick = SpeedButton6Click
              end
              inherited SpeedButton7: TSpeedButton
                Hint = 'Faturar'
                Glyph.Data = {
                  B2030000424DB203000000000000720100002800000018000000180000000100
                  08000000000040020000120B0000120B00004F0000004F00000000000000FFFF
                  FF00FF00FF00811E00008E2E0A0099441E009C491F00B26B4800C1896D00FCF8
                  F60095411100B7775400C18A6C00D1A18700CB9C8300D8AD9600913F0C009341
                  0E00C693750092410D009E521F00AB683900BA7F5700F3E2D700FBF8F6009A4E
                  1600AC6B3A00BD875E00D9AB8A00CB722800CC742C00CE793200AA683400D084
                  4700CEA48100D3AD8E00F6E3D300F0E3D800F2E6DC00FCF7F300D0803B00D182
                  3E00D3874400D4894700D78F5000D9965A00DA985D00DC9D6400DD9F6700BB86
                  5800DEA36D00E0A57200C18F6400DCA47400E2AC7B00E5B48700E5B68A00E3BA
                  9600D8B79A00E0C5AC00E5CFBB00F7E6D700FAF0E700F7F0EA00E7BB9100E7BD
                  9500EAC4A000EDCBAB00EECEAF00EFD0B200EFD3B700F0D5BB00F2D8BF00F2DA
                  C200F3DCC600F3DECA00F4E1CF00EAD9C900F7E9DA0002020202020202020202
                  0202020202020202020202020202020202020202020202020202020202020202
                  0202020202020302020202020202020202020202020202020202020202020203
                  0302020202020202020202020202020202020202020202020303030202020202
                  0202020202020202020202020202020202031003030202020202020202020202
                  0202020202020202020203131303020202020202020202020202020202020202
                  0202020311190A0302020202020202020202020202020202020202020314201A
                  060302020202020202020202020202020202020202031531341B050302020202
                  0202020202020202020202020202031622233A12030202020202020202020202
                  02020202020202030B3B3C4D2508030202020202020202020202020202020202
                  030C263F180917070302020202020202020202020202020202030E273E4E4C49
                  1C03020202020202020202020202020202030D3D4B4845030302020202020202
                  02020202020202030F244A474439040202020202020202020202020202020202
                  034643424138350302020202020202020202020202020202020340373633302E
                  03020202020202020202020202020202020203322F2D2C2B2903020202020202
                  020202020202020202020203212A281F1E1D0302020202020202020202020202
                  0202020203030303030303030202020202020202020202020202020202020202
                  0202020202020202020202020202020202020202020202020202020202020202
                  02020202020202020202020202020202020202020202}
                OnClick = SpeedButton7Click
              end
              inherited SpeedButton8: TSpeedButton
                Hint = 'Dados Reais'
                Glyph.Data = {
                  7E040000424D7E040000000000003E0200002800000018000000180000000100
                  08000000000040020000120B0000120B0000820000008200000000000000FFFF
                  FF00FF00FF00A46769008E595B00FFFEFE009566620092635D00895F56009E6E
                  6400A7756800B17E6B008C381600CC5A2A00BB846E00996D5C00CB917300C58C
                  7000C0896F00F3BB9F00FEFCFB00D4987600CF8E6800D4987500CF967400A19A
                  9500F8F0EA00F7EFE900D1CAC500FEFAF700DDD0C500A0979000FAF4EF00FEBD
                  8200A0989100A0999300F7EEE600F6EDE500E0D9D300F7F0EA009D938900A097
                  8E00F3E6D900F2E5D800DCD0C400F2E6DA00DDD4CB00F7EFE700D1CCC700F8F3
                  EE00FEFAF600FCF8F400FBF7F300FAF6F200FEFBF800FEFCFA00C9B8A6009C8F
                  8100C7B7A500FCEAD7009D938800DACEC100CBC0B400EFE2D400CCC2B700C7B7
                  A4009A8E80009C908200EDDCC700CABBAA00EEDDC900CABCAC00C9BBAB00EEDE
                  CB00CABDAD009C928600EFE0CE00D8CABA00C9BCAD009D938700D9CCBC00F0E2
                  D100EFE1D0009E958A00F0E3D400CBC1B500E7DCCF00DDD3C700CEC5BA00F3E9
                  DD00DDD4C900F4EBE000DED7CF00F8F3ED00E1CFB800EBD9C100EAD8C000EDDC
                  C500C9BAA7009C918200D8C9B600D8CAB700EFE0CC00EFE1CF00DACEBF00CEC4
                  B700F0E5D700E7DDD000F3EADE00CEC6BC00E0D9D000DED7CE00F8F2EA00A4A1
                  9D00A3A09C00EBDAC2009C928400CABFAF00CAC0B1009F978C009E968B009D95
                  8A00F4EDE300FAF6F000D9CEBD00F4EDE200FCFAF600FFFEFC00FFFEFB00FCFB
                  F800020202070303030303030303030303030303030303020202020202076666
                  6666666666665F5F5F5F5F5F5F5F030202020202020766493B3B3B3B3B3B3B3B
                  3B3B3B3B5F5F0302020202020207524C2121212121212121212121215F5F0302
                  0202020202075451674C49464461735F5F5F5F5F5F5F03020202020202076A3F
                  3B3B3B3B3B3B3B3B3B3B3B3B606003020202020202076B562121212121212121
                  212121215E5E03020202020202096D586940553E76754A474562383A41410302
                  0202020202081923221F29777853284F4B7463433942040202020C0C0C0C0C0C
                  0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C02020A266E5C6F2E5A571E2C3D
                  687C504D65640302020C0C02020A301C0D0D0D0D0D0D0D0D0D0D0D0D4E480302
                  020C0C02020F7172131313131313131313131313793C0402020C0C0C0C0C0C0C
                  0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0202020B7F7F7F7F7F2020707025
                  257D7D2A2A2A030202020202020E14813B3B3B3B3B3B3B3B3B3B3B3B2D2B0302
                  02020202021201012121212121212121212121216C5903020202020202110101
                  0101010101010101010101017D5B030202020202021001010101017F3632347B
                  205D1A1B247A030202020202021801013B3B3B3B3B3B3B3B3B3B3B3B272F0302
                  02020202021701012121212121212121212121215D7003020202020202170101
                  010101010101010180367E347B31030202020202021701010101010101010101
                  0105371D33350302020202020215161616161616161616161616161616160602
                  0202}
                OnClick = SpeedButton8Click
              end
            end
            inherited GroupBox2: TGroupBox
              Height = 305
              ExplicitHeight = 305
              inherited ScrollBox2: TScrollBox
                Height = 288
                ExplicitHeight = 288
              end
            end
          end
        end
        object TabSheet_Escolha: TTabSheet
          Caption = 'Escolha'
          ImageIndex = 2
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object pnEscolhaVenda: TPanel
            Left = 0
            Top = 0
            Width = 788
            Height = 201
            BevelOuter = bvNone
            TabOrder = 0
            object ListView_EscolhaVenda: TListView
              Left = 3
              Top = 8
              Width = 783
              Height = 133
              BevelInner = bvLowered
              BevelOuter = bvRaised
              BevelKind = bkTile
              BiDiMode = bdLeftToRight
              BorderWidth = 15
              Columns = <
                item
                  AutoSize = True
                  Caption = 'Venda'
                  MaxWidth = 140
                  MinWidth = 140
                end
                item
                  AutoSize = True
                  Caption = 'Aplica'#231#227'o'
                  MaxWidth = 800
                  MinWidth = 600
                end>
              IconOptions.WrapText = False
              ParentBiDiMode = False
              TabOrder = 0
              ViewStyle = vsReport
            end
            object Panel79: TPanel
              Left = 0
              Top = 153
              Width = 788
              Height = 48
              Align = alBottom
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 1
              object SpeedButton21: TSpeedButton
                Left = 695
                Top = 9
                Width = 75
                Height = 25
                Caption = 'Voltar'
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
                Visible = False
              end
              object BitBtn62: TBitBtn
                Left = 314
                Top = 9
                Width = 75
                Height = 25
                Caption = 'OK'
                TabOrder = 0
                OnClick = BitBtn62Click
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
              object BitBtn66: TBitBtn
                Left = 395
                Top = 9
                Width = 75
                Height = 25
                Caption = 'Cancelar'
                TabOrder = 1
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
    inherited PanelFlash: TPanel
      Width = 0
      Height = 589
      ExplicitWidth = 0
      ExplicitHeight = 589
      inherited bMarketingHW: TBitBtn
        Top = 567
        Width = 0
        ExplicitTop = 567
        ExplicitWidth = 0
      end
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 591
    Width = 800
    Height = 20
    ExplicitTop = 591
    ExplicitWidth = 800
    ExplicitHeight = 20
  end
  inherited PopupMenu1: TPopupMenu
    Left = 236
    Top = 1
  end
  inherited PopupMenu2: TPopupMenu
    Left = 270
    Top = 65531
  end
  inherited Timer1: TTimer
    Left = 190
    Top = 3
  end
  inherited ApplicationEventsPadrao: TApplicationEvents
    Left = 334
    Top = 3
  end
end
