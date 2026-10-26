inherited FrmCompraContratoVeiculosCCIA: TFrmCompraContratoVeiculosCCIA
  Caption = 'Compra de Ve'#237'culos'
  ClientHeight = 629
  ClientWidth = 800
  OnResize = nil
  ExplicitWidth = 808
  ExplicitHeight = 663
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelFundo: TPanel
    Width = 800
    Height = 610
    ExplicitWidth = 800
    ExplicitHeight = 610
    inherited Splitter2: TSplitter
      Height = 608
      ExplicitHeight = 608
    end
    inherited PanelLeft: TPanel
      Width = 795
      Height = 608
      ExplicitWidth = 795
      ExplicitHeight = 608
      inherited PageControl1: TPageControl
        Width = 793
        Height = 606
        ExplicitWidth = 793
        ExplicitHeight = 606
        inherited TabSheet1: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 785
          ExplicitHeight = 575
          inherited ScrollBox1: TScrollBox
            Width = 785
            Height = 575
            ExplicitWidth = 785
            ExplicitHeight = 575
            inherited PageControl3: TPageControl
              Width = 785
              Height = 527
              ExplicitWidth = 785
              ExplicitHeight = 527
              inherited TabSheet3: TTabSheet
                Caption = 'Contrato de Compra, Entrada em Consigna'#231#227'o'
                ExplicitLeft = 4
                ExplicitTop = 27
                ExplicitWidth = 777
                ExplicitHeight = 496
                inherited ScrollBox3: TScrollBox
                  Width = 777
                  Height = 496
                  ExplicitWidth = 777
                  ExplicitHeight = 496
                  inherited GroupBox1: TGroupBox
                    Width = 756
                    Height = 497
                    Caption = 'Contrato de Compra'
                    ExplicitWidth = 756
                    ExplicitHeight = 497
                    object GroupBox5: TGroupBox
                      Left = 2
                      Top = 105
                      Width = 752
                      Height = 123
                      Align = alTop
                      TabOrder = 0
                      object Label25: TLabel
                        Left = 48
                        Top = 17
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
                      object Label26: TLabel
                        Left = 19
                        Top = 44
                        Width = 83
                        Height = 13
                        Caption = 'Cliente vendedor:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        ParentFont = False
                      end
                      object Label51: TLabel
                        Left = 52
                        Top = 72
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
                      object Label52: TLabel
                        Left = 60
                        Top = 99
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
                      object DBEdit16: TDBEdit
                        Left = 118
                        Top = 13
                        Width = 72
                        Height = 21
                        DataField = 'COD_CLIENTE'
                        TabOrder = 0
                      end
                      object DBLookupComboBox3: TDBLookupComboBox
                        Left = 196
                        Top = 14
                        Width = 327
                        Height = 21
                        DataField = 'COD_CLIENTE'
                        KeyField = 'COD_CLIENTE'
                        ListField = 'NOME_CLIENTE'
                        TabOrder = 1
                      end
                      object BitBtn14: TBitBtn
                        Left = 531
                        Top = 14
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
                      object BitBtn15: TBitBtn
                        Left = 557
                        Top = 14
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
                      object DBLookupComboBox4: TDBLookupComboBox
                        Left = 196
                        Top = 40
                        Width = 326
                        Height = 21
                        DataField = 'COD_CLIENTE'
                        KeyField = 'COD_CLIENTE'
                        ListField = 'NOME_CLIENTE'
                        TabOrder = 4
                      end
                      object DBEdit17: TDBEdit
                        Left = 118
                        Top = 40
                        Width = 72
                        Height = 21
                        DataField = 'COD_CLIENTE'
                        TabOrder = 5
                      end
                      object BitBtn16: TBitBtn
                        Left = 531
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
                      object BitBtn17: TBitBtn
                        Left = 557
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
                      object DBLookupComboBox6: TDBLookupComboBox
                        Left = 118
                        Top = 68
                        Width = 404
                        Height = 21
                        DataField = 'COD_CLIENTE'
                        KeyField = 'COD_CLIENTE'
                        ListField = 'NOME_CLIENTE'
                        TabOrder = 8
                      end
                      object DBLookupComboBox7: TDBLookupComboBox
                        Left = 118
                        Top = 95
                        Width = 404
                        Height = 21
                        DataField = 'COD_CLIENTE'
                        KeyField = 'COD_CLIENTE'
                        ListField = 'NOME_CLIENTE'
                        TabOrder = 9
                      end
                    end
                    object GroupBox6: TGroupBox
                      Left = 2
                      Top = 228
                      Width = 752
                      Height = 149
                      Align = alTop
                      TabOrder = 1
                      object Label55: TLabel
                        Left = 3
                        Top = 9
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
                      object Label56: TLabel
                        Left = 264
                        Top = 9
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
                      object Label57: TLabel
                        Left = 497
                        Top = 9
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
                      object Label58: TLabel
                        Left = 264
                        Top = 74
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
                      object Label59: TLabel
                        Left = 3
                        Top = 74
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
                      object DBMemo1: TDBMemo
                        Left = 3
                        Top = 24
                        Width = 250
                        Height = 46
                        TabOrder = 0
                      end
                      object DBMemo2: TDBMemo
                        Left = 259
                        Top = 24
                        Width = 224
                        Height = 46
                        TabOrder = 1
                      end
                      object DBMemo4: TDBMemo
                        Left = 259
                        Top = 93
                        Width = 224
                        Height = 46
                        TabOrder = 2
                      end
                      object DBMemo3: TDBMemo
                        Left = 3
                        Top = 93
                        Width = 250
                        Height = 46
                        TabOrder = 3
                      end
                      object DBMemo5: TDBMemo
                        Left = 489
                        Top = 24
                        Width = 258
                        Height = 115
                        TabOrder = 4
                      end
                    end
                    object GroupBox37: TGroupBox
                      Left = 2
                      Top = 377
                      Width = 752
                      Height = 43
                      Align = alTop
                      Color = clBtnFace
                      ParentColor = False
                      TabOrder = 2
                      object Label53: TLabel
                        Left = 269
                        Top = 17
                        Width = 80
                        Height = 13
                        Caption = 'Valor a Receber:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        ParentFont = False
                      end
                      object Label54: TLabel
                        Left = 23
                        Top = 17
                        Width = 80
                        Height = 13
                        Caption = 'Data da compra:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = []
                        ParentFont = False
                      end
                      object DBEdit29: TDBEdit
                        Left = 372
                        Top = 14
                        Width = 127
                        Height = 21
                        CharCase = ecUpperCase
                        DataField = 'CHASSI'
                        TabOrder = 0
                      end
                      object DBEdit30: TDBEdit
                        Left = 118
                        Top = 14
                        Width = 111
                        Height = 21
                        CharCase = ecUpperCase
                        DataField = 'CHASSI'
                        TabOrder = 1
                      end
                    end
                    object GroupBox35: TGroupBox
                      Left = 2
                      Top = 420
                      Width = 752
                      Height = 42
                      Align = alTop
                      Caption = 'Imprimir'
                      TabOrder = 3
                      object BitBtn11: TBitBtn
                        Left = 297
                        Top = 6
                        Width = 120
                        Height = 33
                        Caption = '&Contrato'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clBlack
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = []
                        ParentFont = False
                        TabOrder = 0
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
                    object GroupBox18: TGroupBox
                      Left = 2
                      Top = 15
                      Width = 752
                      Height = 90
                      Align = alTop
                      TabOrder = 4
                      object Label29: TLabel
                        Left = 78
                        Top = 37
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
                        Left = 67
                        Top = 65
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
                      object Label8: TLabel
                        Left = 66
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
                        Left = 118
                        Top = 35
                        Width = 206
                        Height = 21
                        DataField = 'COD_CLIENTE'
                        KeyField = 'COD_CLIENTE'
                        ListField = 'NOME_CLIENTE'
                        TabOrder = 0
                      end
                      object BitBtn8: TBitBtn
                        Left = 400
                        Top = 63
                        Width = 20
                        Height = 20
                        TabOrder = 1
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
                      object CheckBox4: TCheckBox
                        Left = 568
                        Top = 25
                        Width = 119
                        Height = 17
                        Caption = 'Imprimir Contrato'
                        Checked = True
                        State = cbChecked
                        TabOrder = 2
                      end
                      object DBEdit7: TDBEdit
                        Left = 118
                        Top = 8
                        Width = 121
                        Height = 21
                        CharCase = ecUpperCase
                        DataField = 'CHASSI'
                        TabOrder = 3
                      end
                      object DBEdit8: TDBEdit
                        Left = 118
                        Top = 62
                        Width = 276
                        Height = 21
                        CharCase = ecUpperCase
                        DataField = 'CHASSI'
                        TabOrder = 4
                      end
                      object CheckBox2: TCheckBox
                        Left = 568
                        Top = 44
                        Width = 143
                        Height = 17
                        Caption = 'Ve'#237'culo usado na troca'
                        TabOrder = 5
                      end
                      object CheckBox5: TCheckBox
                        Left = 568
                        Top = 63
                        Width = 106
                        Height = 17
                        Caption = 'Ve'#237'culo Rodando'
                        TabOrder = 6
                      end
                    end
                  end
                end
              end
            end
            inherited Panel3: TPanel
              Top = 527
              Width = 785
              ExplicitTop = 527
              ExplicitWidth = 785
            end
          end
        end
        inherited TabSheet2: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 785
          ExplicitHeight = 575
          inherited GroupBox3: TGroupBox
            Width = 785
            ExplicitWidth = 785
            inherited imgInformation: TImage
              Left = 759
            end
          end
          inherited Panel1: TPanel
            Width = 785
            Height = 502
            ExplicitWidth = 785
            ExplicitHeight = 502
            inherited Splitter1: TSplitter
              Height = 441
              ExplicitHeight = 444
            end
            inherited DBGrid1: TDBGrid
              Width = 492
              Height = 441
            end
            inherited Panel2: TPanel
              Width = 781
              ExplicitWidth = 781
              inherited SpeedButton6: TSpeedButton
                Hint = 'Emitir Nota Fiscal'
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
              end
            end
            inherited GroupBox2: TGroupBox
              Height = 441
              ExplicitHeight = 441
              inherited ScrollBox2: TScrollBox
                Height = 424
                ExplicitHeight = 424
              end
            end
          end
          object Edit1: TEdit
            Left = 634
            Top = 46
            Width = 121
            Height = 21
            TabOrder = 2
            Text = 'EDIT PARA FUNCIONAR'
            Visible = False
          end
        end
        inherited tsMemo: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 785
          ExplicitHeight = 575
        end
      end
    end
    inherited PanelFlash: TPanel
      Height = 608
      ExplicitHeight = 608
      inherited bMarketingHW: TBitBtn
        Top = 586
        ExplicitTop = 586
      end
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 610
    Width = 800
    ExplicitTop = 610
    ExplicitWidth = 800
  end
  inherited pnStatusProcessamento: TPanel
    inherited lbTextoProcessamento: TLabel
      Width = 477
      Height = 21
    end
  end
  inherited PopupMenu1: TPopupMenu
    Left = 132
    Top = 9
  end
  inherited PopupMenu2: TPopupMenu
    Left = 198
    Top = 11
  end
  inherited Timer1: TTimer
    Left = 166
    Top = 11
  end
end
