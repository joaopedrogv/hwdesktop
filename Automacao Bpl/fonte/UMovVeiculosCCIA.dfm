inherited frmMovVeiculosCCIA: TfrmMovVeiculosCCIA
  Caption = 'Entrada/Saida de Ve'#237'culos'
  ClientHeight = 612
  ClientWidth = 799
  ExplicitWidth = 807
  ExplicitHeight = 646
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelFundo: TPanel
    Width = 799
    Height = 592
    ExplicitWidth = 799
    ExplicitHeight = 592
    inherited Splitter2: TSplitter
      Height = 590
      ExplicitHeight = 639
    end
    inherited PanelLeft: TPanel
      Width = 794
      Height = 590
      ExplicitWidth = 794
      ExplicitHeight = 590
      inherited PageControl1: TPageControl
        Width = 792
        Height = 588
        ExplicitWidth = 792
        ExplicitHeight = 588
        inherited TabSheet1: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 784
          ExplicitHeight = 557
          inherited ScrollBox1: TScrollBox
            Width = 784
            Height = 557
            ExplicitWidth = 784
            ExplicitHeight = 557
            inherited PageControl3: TPageControl
              Width = 784
              Height = 509
              ActivePage = TabSheet_ContratoCompra
              OnChange = PageControl3Change
              OnEnter = nil
              OnExit = PageControl3Exit
              ExplicitWidth = 784
              ExplicitHeight = 509
              inherited TabSheet3: TTabSheet
                ExplicitLeft = 4
                ExplicitTop = 27
                ExplicitWidth = 776
                ExplicitHeight = 478
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
                  Width = 776
                  Height = 478
                  ExplicitWidth = 776
                  ExplicitHeight = 478
                  inherited GroupBox1: TGroupBox
                    Width = 772
                    ExplicitWidth = 772
                  end
                end
              end
              object TabSheet_ContratoCompra: TTabSheet
                Caption = 'E - Contrato de Compra'
                ImageIndex = 6
                ExplicitLeft = 0
                ExplicitTop = 0
                ExplicitWidth = 0
                ExplicitHeight = 0
                object ScrollBox5: TScrollBox
                  Left = 0
                  Top = 0
                  Width = 776
                  Height = 478
                  Align = alClient
                  TabOrder = 0
                  object GroupBox_Compra: TGroupBox
                    Left = 0
                    Top = 0
                    Width = 755
                    Height = 544
                    Align = alTop
                    Caption = 'Contrato de Compra'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = []
                    ParentFont = False
                    TabOrder = 0
                    object GroupBox20: TGroupBox
                      Left = 2
                      Top = 122
                      Width = 751
                      Height = 60
                      Align = alTop
                      TabOrder = 1
                      object Label65: TLabel
                        Left = 49
                        Top = 12
                        Width = 66
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Comprador:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label66: TLabel
                        Left = 16
                        Top = 35
                        Width = 99
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Cliente Vendedor:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object DBEdit14: TDBEdit
                        Left = 118
                        Top = 9
                        Width = 72
                        Height = 21
                        CharCase = ecUpperCase
                        DataField = 'CLIENTES_V'
                        DataSource = DtmVeiculosCCIA.dsComFat
                        TabOrder = 0
                      end
                      object DBLookupComboBox4: TDBLookupComboBox
                        Left = 191
                        Top = 9
                        Width = 327
                        Height = 21
                        DataField = 'CLIENTES_V'
                        DataSource = DtmVeiculosCCIA.dsComFat
                        KeyField = 'COD_CLIENTE'
                        ListField = 'NOME_CLIENTE'
                        ListSource = DtmVeiculosCCIA.dsClienteComFat
                        TabOrder = 1
                      end
                      object DBLookupComboBox6: TDBLookupComboBox
                        Left = 191
                        Top = 32
                        Width = 327
                        Height = 21
                        DataField = 'COD_CLI_VENDE'
                        DataSource = DtmVeiculosCCIA.dsComFat
                        KeyField = 'COD_CLIENTE'
                        ListField = 'NOME_CLIENTE'
                        ListSource = DtmVeiculosCCIA.dsFornecedorComFat
                        TabOrder = 3
                      end
                      object DBEdit39: TDBEdit
                        Left = 118
                        Top = 32
                        Width = 72
                        Height = 21
                        CharCase = ecUpperCase
                        DataField = 'COD_CLI_VENDE'
                        DataSource = DtmVeiculosCCIA.dsComFat
                        TabOrder = 2
                      end
                    end
                    object GroupBox25: TGroupBox
                      Left = 2
                      Top = 182
                      Width = 751
                      Height = 234
                      Align = alTop
                      TabOrder = 2
                      object Label69: TLabel
                        Left = 8
                        Top = 65
                        Width = 206
                        Height = 13
                        Caption = 'Documento, Manual, Chave Reserva:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label70: TLabel
                        Left = 250
                        Top = 65
                        Width = 41
                        Height = 13
                        Caption = 'Multas:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label71: TLabel
                        Left = 497
                        Top = 65
                        Width = 76
                        Height = 13
                        Caption = 'Observa'#231#245'es:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label72: TLabel
                        Left = 250
                        Top = 122
                        Width = 120
                        Height = 13
                        Caption = 'Promessas de venda:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label80: TLabel
                        Left = 8
                        Top = 122
                        Width = 157
                        Height = 13
                        Caption = 'Opcionais do carro da troca:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label119: TLabel
                        Left = 8
                        Top = 178
                        Width = 97
                        Height = 13
                        Caption = 'Controle Interno:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label123: TLabel
                        Left = 8
                        Top = 6
                        Width = 124
                        Height = 13
                        Caption = 'Condi'#231#245'es de Neg'#243'cio:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object DBMemo10: TDBMemo
                        Left = 3
                        Top = 82
                        Width = 240
                        Height = 36
                        DataField = 'DOC_CHAVE_MAN'
                        DataSource = DtmVeiculosCCIA.dsComFat
                        ScrollBars = ssVertical
                        TabOrder = 1
                      end
                      object DBMemo11: TDBMemo
                        Left = 246
                        Top = 82
                        Width = 240
                        Height = 36
                        DataField = 'MULTAS'
                        DataSource = DtmVeiculosCCIA.dsComFat
                        ScrollBars = ssVertical
                        TabOrder = 2
                      end
                      object DBMemo12: TDBMemo
                        Left = 246
                        Top = 141
                        Width = 240
                        Height = 36
                        DataField = 'PROMESSAS'
                        DataSource = DtmVeiculosCCIA.dsComFat
                        ScrollBars = ssVertical
                        TabOrder = 4
                      end
                      object DBMemo13: TDBMemo
                        Left = 3
                        Top = 141
                        Width = 240
                        Height = 36
                        DataField = 'OPCIONAIS'
                        DataSource = DtmVeiculosCCIA.dsComFat
                        ScrollBars = ssVertical
                        TabOrder = 3
                      end
                      object DBMemo14: TDBMemo
                        Left = 488
                        Top = 82
                        Width = 240
                        Height = 97
                        DataField = 'OBS'
                        DataSource = DtmVeiculosCCIA.dsComFat
                        ScrollBars = ssVertical
                        TabOrder = 5
                      end
                      object DBMemo1: TDBMemo
                        Left = 3
                        Top = 195
                        Width = 725
                        Height = 36
                        DataField = 'COND_REAIS'
                        DataSource = DtmVeiculosCCIA.dsComFat
                        ScrollBars = ssVertical
                        TabOrder = 6
                      end
                      object DBMemo3: TDBMemo
                        Left = 3
                        Top = 25
                        Width = 725
                        Height = 36
                        DataField = 'COND_NEGOCIACAO'
                        DataSource = DtmVeiculosCCIA.dsComFat
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = []
                        ParentFont = False
                        ScrollBars = ssVertical
                        TabOrder = 0
                      end
                      object BitBtn33: TBitBtn
                        Left = 729
                        Top = 15
                        Width = 20
                        Height = 217
                        Hint = 'Editar OBS/DOC/MULTA/OPC/PROMESSA - [VEI124]'
                        Align = alRight
                        TabOrder = 7
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
                    end
                    object GroupBox37: TGroupBox
                      Left = 2
                      Top = 416
                      Width = 751
                      Height = 83
                      Align = alTop
                      Color = clBtnFace
                      ParentColor = False
                      TabOrder = 3
                      object Label85: TLabel
                        Left = 19
                        Top = 59
                        Width = 96
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Valor de Compra:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label96: TLabel
                        Left = 315
                        Top = 59
                        Width = 93
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Data da compra:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label68: TLabel
                        Left = 66
                        Top = 37
                        Width = 49
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Gerente:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label126: TLabel
                        Left = 61
                        Top = 13
                        Width = 54
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Vendedor'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object DBEdit41: TDBEdit
                        Left = 118
                        Top = 56
                        Width = 127
                        Height = 21
                        CharCase = ecUpperCase
                        DataField = 'VALOR_REAL'
                        DataSource = DtmVeiculosCCIA.dsComFat
                        TabOrder = 4
                      end
                      object DBEdit42: TDBEdit
                        Left = 411
                        Top = 56
                        Width = 107
                        Height = 21
                        CharCase = ecUpperCase
                        DataField = 'DATA_VEN'
                        DataSource = DtmVeiculosCCIA.dsComFat
                        Enabled = False
                        TabOrder = 5
                      end
                      object DBEdit8: TDBEdit
                        Left = 118
                        Top = 32
                        Width = 72
                        Height = 21
                        CharCase = ecUpperCase
                        DataField = 'COD_GERENTE'
                        DataSource = DtmVeiculosCCIA.dsComFat
                        TabOrder = 2
                      end
                      object DBLookupComboBox21: TDBLookupComboBox
                        Left = 191
                        Top = 32
                        Width = 327
                        Height = 21
                        DataField = 'COD_GERENTE'
                        DataSource = DtmVeiculosCCIA.dsComFat
                        KeyField = 'COD_VENDEDOR'
                        ListField = 'NOME_VENDEDOR'
                        ListSource = DtmVeiculosCCIA.dsGerenteComFat
                        TabOrder = 3
                      end
                      object DBEdit62: TDBEdit
                        Left = 118
                        Top = 8
                        Width = 72
                        Height = 21
                        CharCase = ecUpperCase
                        DataField = 'COVEND_V'
                        DataSource = DtmVeiculosCCIA.dsComFat
                        TabOrder = 0
                      end
                      object DBLookupComboBox3: TDBLookupComboBox
                        Left = 191
                        Top = 8
                        Width = 327
                        Height = 21
                        DataField = 'COVEND_V'
                        DataSource = DtmVeiculosCCIA.dsComFat
                        KeyField = 'COD_VENDEDOR'
                        ListField = 'NOME_VENDEDOR'
                        ListSource = DtmVeiculosCCIA.dsColaboradorComFat
                        TabOrder = 1
                      end
                    end
                    object GroupBox35: TGroupBox
                      Left = 2
                      Top = 499
                      Width = 751
                      Height = 44
                      Align = alTop
                      Caption = 'Imprimir'
                      TabOrder = 4
                      object BitBtn24: TBitBtn
                        Left = 258
                        Top = 6
                        Width = 120
                        Height = 33
                        Hint = 'Imprimir - [VEI072/VEI073]'
                        Caption = '&Contrato'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clBlack
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = []
                        ParentFont = False
                        TabOrder = 0
                        OnClick = BitBtn46Click
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
                      object BitBtn8: TBitBtn
                        Left = 379
                        Top = 6
                        Width = 120
                        Height = 33
                        Hint = 'Imprimir - [NF0020/NF0021]'
                        Caption = 'NF'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clBlack
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = []
                        ParentFont = False
                        TabOrder = 1
                        OnClick = BitBtn8Click
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
                    end
                    object GroupBox27: TGroupBox
                      Left = 2
                      Top = 15
                      Width = 751
                      Height = 107
                      Align = alTop
                      TabOrder = 0
                      object Label97: TLabel
                        Left = 88
                        Top = 35
                        Width = 27
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Tipo:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label98: TLabel
                        Left = 76
                        Top = 59
                        Width = 39
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Chassi:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label99: TLabel
                        Left = 74
                        Top = 12
                        Width = 41
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'C'#243'digo:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label15: TLabel
                        Left = 277
                        Top = 12
                        Width = 63
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Nota Fiscal:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label86: TLabel
                        Left = 82
                        Top = 85
                        Width = 33
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Placa:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object BitBtn25: TBitBtn
                        Left = 466
                        Top = 58
                        Width = 20
                        Height = 20
                        TabOrder = 0
                        OnClick = BitBtn25Click
                        OnKeyDown = DBEdit2KeyDown
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
                      object CheckBox13: TCheckBox
                        Left = 576
                        Top = 10
                        Width = 119
                        Height = 17
                        Caption = 'Imprimir Contrato'
                        Checked = True
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = []
                        ParentFont = False
                        State = cbChecked
                        TabOrder = 1
                      end
                      object DBEdit47: TDBEdit
                        Left = 118
                        Top = 8
                        Width = 121
                        Height = 21
                        CharCase = ecUpperCase
                        DataField = 'N_COMANDO'
                        DataSource = DtmVeiculosCCIA.dsComFat
                        Enabled = False
                        TabOrder = 5
                      end
                      object DBEdit48: TDBEdit
                        Tag = 2
                        Left = 191
                        Top = 57
                        Width = 269
                        Height = 21
                        CharCase = ecUpperCase
                        DataField = 'CHASSIV'
                        DataSource = DtmVeiculosCCIA.dsComFat
                        TabOrder = 8
                      end
                      object DBComboBox4: TDBComboBox
                        Left = 118
                        Top = 32
                        Width = 342
                        Height = 21
                        CharCase = ecUpperCase
                        DataField = 'TIPO_VENDA_V'
                        DataSource = DtmVeiculosCCIA.dsComFat
                        ItemHeight = 0
                        Items.Strings = (
                          'N - NOVO'
                          'U - USADO')
                        ReadOnly = True
                        TabOrder = 6
                      end
                      object DBEdit61: TDBEdit
                        Left = 118
                        Top = 57
                        Width = 72
                        Height = 21
                        CharCase = ecUpperCase
                        DataField = 'COD_ESTMOTO'
                        DataSource = DtmVeiculosCCIA.dsComFat
                        Enabled = False
                        TabOrder = 7
                      end
                      object DBCheckBox3: TDBCheckBox
                        Left = 576
                        Top = 27
                        Width = 150
                        Height = 17
                        Caption = 'Ve'#237'culo usado na troca'
                        DataField = 'VEICULO_TROCA'
                        DataSource = DtmVeiculosCCIA.dsComFat
                        TabOrder = 2
                        ValueChecked = 'S'
                        ValueUnchecked = 'N'
                      end
                      object DBCheckBox4: TDBCheckBox
                        Left = 576
                        Top = 44
                        Width = 150
                        Height = 17
                        Caption = 'Ve'#237'culo Rodando'
                        DataField = 'VEICULO_RODANDO'
                        DataSource = DtmVeiculosCCIA.dsComFat
                        TabOrder = 3
                        ValueChecked = 'S'
                        ValueUnchecked = 'N'
                      end
                      object DBEdit87: TDBEdit
                        Left = 342
                        Top = 8
                        Width = 118
                        Height = 21
                        CharCase = ecUpperCase
                        DataField = 'NUM_NOTA_V'
                        DataSource = DtmVeiculosCCIA.dsComFat
                        Enabled = False
                        TabOrder = 10
                      end
                      object DBCheckBox6: TDBCheckBox
                        Left = 576
                        Top = 61
                        Width = 150
                        Height = 17
                        Caption = 'Imprimir Declara'#231#227'o'
                        DataField = 'IMP_DECLARACAO'
                        DataSource = DtmVeiculosCCIA.dsComFat
                        TabOrder = 4
                        ValueChecked = 'S'
                        ValueUnchecked = 'N'
                      end
                      object DBEdit65: TDBEdit
                        Tag = 1
                        Left = 118
                        Top = 83
                        Width = 121
                        Height = 21
                        CharCase = ecUpperCase
                        DataField = 'PLACAV'
                        DataSource = DtmVeiculosCCIA.dsComFat
                        TabOrder = 9
                      end
                    end
                  end
                end
              end
              object TabSheet_ContratoVndResDomInterm: TTabSheet
                Caption = 'S - Contrato Venda, Reserva Dom'#237'nio, Intermedia'#231#227'o'
                ImageIndex = 7
                ExplicitLeft = 0
                ExplicitTop = 0
                ExplicitWidth = 0
                ExplicitHeight = 0
                object ScrollBox9: TScrollBox
                  Left = 0
                  Top = 0
                  Width = 776
                  Height = 478
                  Align = alClient
                  BevelInner = bvNone
                  BevelOuter = bvNone
                  TabOrder = 0
                  object GroupBox_Venda: TGroupBox
                    Left = 0
                    Top = 0
                    Width = 755
                    Height = 595
                    Align = alTop
                    Caption = 'Contrato de Venda, Reserva Dom'#237'nio e Intermedia'#231#227'o'
                    TabOrder = 0
                    object GroupBox34: TGroupBox
                      Left = 2
                      Top = 15
                      Width = 751
                      Height = 107
                      Align = alTop
                      TabOrder = 0
                      object Label107: TLabel
                        Left = 86
                        Top = 35
                        Width = 27
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Tipo:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label108: TLabel
                        Left = 74
                        Top = 59
                        Width = 39
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Chassi:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label109: TLabel
                        Left = 73
                        Top = 11
                        Width = 41
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'C'#243'digo:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label122: TLabel
                        Left = 297
                        Top = 11
                        Width = 85
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Data da Venda:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label63: TLabel
                        Left = 81
                        Top = 83
                        Width = 33
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Placa:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object BitBtn28: TBitBtn
                        Left = 523
                        Top = 55
                        Width = 20
                        Height = 20
                        TabOrder = 0
                        OnClick = BitBtn25Click
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
                      object CheckBox17: TCheckBox
                        Left = 595
                        Top = 10
                        Width = 126
                        Height = 17
                        Caption = 'Imprimir Contrato'
                        Checked = True
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = []
                        ParentFont = False
                        State = cbChecked
                        TabOrder = 1
                      end
                      object DBEdit54: TDBEdit
                        Left = 118
                        Top = 8
                        Width = 115
                        Height = 21
                        CharCase = ecUpperCase
                        DataField = 'N_COMANDO'
                        DataSource = DtmVeiculosCCIA.dsComFat
                        Enabled = False
                        TabOrder = 5
                      end
                      object DBEdit56: TDBEdit
                        Tag = 2
                        Left = 192
                        Top = 56
                        Width = 325
                        Height = 21
                        CharCase = ecUpperCase
                        DataField = 'CHASSIV'
                        DataSource = DtmVeiculosCCIA.dsComFat
                        TabOrder = 8
                      end
                      object DBComboBox5: TDBComboBox
                        Left = 118
                        Top = 32
                        Width = 399
                        Height = 21
                        CharCase = ecUpperCase
                        DataField = 'TIPO_VENDA_V'
                        DataSource = DtmVeiculosCCIA.dsComFat
                        ItemHeight = 0
                        Items.Strings = (
                          'N - NOVO'
                          'U - USADO')
                        ReadOnly = True
                        TabOrder = 6
                      end
                      object DBEdit63: TDBEdit
                        Left = 118
                        Top = 56
                        Width = 72
                        Height = 21
                        CharCase = ecUpperCase
                        DataField = 'COD_ESTMOTO'
                        DataSource = DtmVeiculosCCIA.dsComFat
                        Enabled = False
                        TabOrder = 7
                      end
                      object DBEdit23: TDBEdit
                        Left = 385
                        Top = 8
                        Width = 132
                        Height = 21
                        CharCase = ecUpperCase
                        DataField = 'DATA_VEN'
                        DataSource = DtmVeiculosCCIA.dsComFat
                        Enabled = False
                        TabOrder = 10
                      end
                      object DBCheckBox1: TDBCheckBox
                        Left = 595
                        Top = 27
                        Width = 150
                        Height = 17
                        Caption = 'Ve'#237'culo usado na troca'
                        DataField = 'VEICULO_TROCA'
                        DataSource = DtmVeiculosCCIA.dsComFat
                        TabOrder = 2
                        ValueChecked = 'S'
                        ValueUnchecked = 'N'
                      end
                      object DBCheckBox2: TDBCheckBox
                        Left = 595
                        Top = 44
                        Width = 150
                        Height = 17
                        Caption = 'Ve'#237'culo Rodando'
                        DataField = 'VEICULO_RODANDO'
                        DataSource = DtmVeiculosCCIA.dsComFat
                        TabOrder = 3
                        ValueChecked = 'S'
                        ValueUnchecked = 'N'
                      end
                      object DBCheckBox5: TDBCheckBox
                        Left = 595
                        Top = 60
                        Width = 150
                        Height = 17
                        Caption = 'Imprimir Declara'#231#227'o'
                        DataField = 'IMP_DECLARACAO'
                        DataSource = DtmVeiculosCCIA.dsComFat
                        TabOrder = 4
                        ValueChecked = 'S'
                        ValueUnchecked = 'N'
                      end
                      object DBEdit13: TDBEdit
                        Tag = 1
                        Left = 118
                        Top = 80
                        Width = 115
                        Height = 21
                        CharCase = ecUpperCase
                        DataField = 'PLACAV'
                        DataSource = DtmVeiculosCCIA.dsComFat
                        TabOrder = 9
                      end
                    end
                    object GroupBox36: TGroupBox
                      Left = 2
                      Top = 122
                      Width = 751
                      Height = 111
                      Align = alTop
                      TabOrder = 1
                      object Label110: TLabel
                        Left = 30
                        Top = 12
                        Width = 86
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Intermediador:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label111: TLabel
                        Left = 50
                        Top = 39
                        Width = 66
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Comprador:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label112: TLabel
                        Left = 16
                        Top = 64
                        Width = 99
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Cliente Vendedor:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label113: TLabel
                        Left = 28
                        Top = 89
                        Width = 88
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Concession'#225'ria:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object DBEdit57: TDBEdit
                        Left = 118
                        Top = 9
                        Width = 72
                        Height = 21
                        DataField = 'COD_INTERMED'
                        DataSource = DtmVeiculosCCIA.dsComFat
                        TabOrder = 6
                      end
                      object DBLookupComboBox26: TDBLookupComboBox
                        Left = 192
                        Top = 9
                        Width = 325
                        Height = 21
                        DataField = 'COD_INTERMED'
                        DataSource = DtmVeiculosCCIA.dsComFat
                        KeyField = 'COD_CLIENTE'
                        ListField = 'NOME_CLIENTE'
                        ListSource = DtmVeiculosCCIA.dsIntermediadorComFat
                        TabOrder = 7
                      end
                      object BitBtn29: TBitBtn
                        Left = 523
                        Top = 10
                        Width = 20
                        Height = 20
                        TabOrder = 0
                        Visible = False
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
                      object BitBtn31: TBitBtn
                        Left = 549
                        Top = 10
                        Width = 20
                        Height = 20
                        TabOrder = 1
                        Visible = False
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
                      object DBEdit58: TDBEdit
                        Left = 118
                        Top = 36
                        Width = 72
                        Height = 21
                        DataField = 'CLIENTES_V'
                        DataSource = DtmVeiculosCCIA.dsComFat
                        TabOrder = 8
                      end
                      object DBLookupComboBox27: TDBLookupComboBox
                        Left = 192
                        Top = 36
                        Width = 325
                        Height = 21
                        DataField = 'CLIENTES_V'
                        DataSource = DtmVeiculosCCIA.dsComFat
                        KeyField = 'COD_CLIENTE'
                        ListField = 'NOME_CLIENTE'
                        ListSource = DtmVeiculosCCIA.dsClienteComFat
                        TabOrder = 9
                      end
                      object BitBtn40: TBitBtn
                        Left = 523
                        Top = 35
                        Width = 20
                        Height = 20
                        TabOrder = 2
                        Visible = False
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
                      object BitBtn41: TBitBtn
                        Left = 549
                        Top = 35
                        Width = 20
                        Height = 20
                        TabOrder = 3
                        Visible = False
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
                      object DBEdit59: TDBEdit
                        Left = 118
                        Top = 61
                        Width = 72
                        Height = 21
                        DataField = 'COD_CLI_VENDE'
                        DataSource = DtmVeiculosCCIA.dsComFat
                        TabOrder = 10
                      end
                      object DBLookupComboBox28: TDBLookupComboBox
                        Left = 192
                        Top = 61
                        Width = 325
                        Height = 21
                        DataField = 'COD_CLI_VENDE'
                        DataSource = DtmVeiculosCCIA.dsComFat
                        KeyField = 'COD_CLIENTE'
                        ListField = 'NOME_CLIENTE'
                        ListSource = DtmVeiculosCCIA.dsFornecedorComFat
                        TabOrder = 11
                      end
                      object BitBtn42: TBitBtn
                        Left = 523
                        Top = 60
                        Width = 20
                        Height = 20
                        TabOrder = 4
                        Visible = False
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
                      object BitBtn43: TBitBtn
                        Left = 549
                        Top = 60
                        Width = 20
                        Height = 20
                        TabOrder = 5
                        Visible = False
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
                      object DBEdit60: TDBEdit
                        Left = 118
                        Top = 86
                        Width = 72
                        Height = 21
                        DataField = 'COD_CONCESS'
                        DataSource = DtmVeiculosCCIA.dsComFat
                        TabOrder = 12
                      end
                      object DBLookupComboBox29: TDBLookupComboBox
                        Left = 192
                        Top = 86
                        Width = 325
                        Height = 21
                        DataField = 'COD_CONCESS'
                        DataSource = DtmVeiculosCCIA.dsComFat
                        KeyField = 'COD_CLIENTE'
                        ListField = 'NOME_CLIENTE'
                        ListSource = DtmVeiculosCCIA.dsConcessionariaComFat
                        TabOrder = 13
                      end
                      object BitBtn44: TBitBtn
                        Left = 523
                        Top = 85
                        Width = 20
                        Height = 20
                        TabOrder = 14
                        Visible = False
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
                      object BitBtn45: TBitBtn
                        Left = 549
                        Top = 85
                        Width = 20
                        Height = 20
                        TabOrder = 15
                        Visible = False
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
                    object GroupBox38: TGroupBox
                      Left = 2
                      Top = 233
                      Width = 751
                      Height = 245
                      Align = alTop
                      TabOrder = 2
                      object Label114: TLabel
                        Left = 13
                        Top = 65
                        Width = 206
                        Height = 13
                        Caption = 'Documento, Manual, Chave Reserva:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label115: TLabel
                        Left = 255
                        Top = 65
                        Width = 41
                        Height = 13
                        Caption = 'Multas:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label116: TLabel
                        Left = 502
                        Top = 65
                        Width = 76
                        Height = 13
                        Caption = 'Observa'#231#245'es:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label117: TLabel
                        Left = 255
                        Top = 122
                        Width = 120
                        Height = 13
                        Caption = 'Promessas de venda:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label118: TLabel
                        Left = 13
                        Top = 122
                        Width = 157
                        Height = 13
                        Caption = 'Opcionais do carro da troca:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label120: TLabel
                        Left = 13
                        Top = 178
                        Width = 97
                        Height = 13
                        Caption = 'Controle Interno:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label124: TLabel
                        Left = 8
                        Top = 8
                        Width = 124
                        Height = 13
                        Caption = 'Condi'#231#245'es de Neg'#243'cio:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object DBMemo2: TDBMemo
                        Left = 8
                        Top = 82
                        Width = 240
                        Height = 36
                        DataField = 'DOC_CHAVE_MAN'
                        DataSource = DtmVeiculosCCIA.dsComFat
                        ScrollBars = ssVertical
                        TabOrder = 2
                      end
                      object DBMemo4: TDBMemo
                        Left = 251
                        Top = 82
                        Width = 240
                        Height = 36
                        DataField = 'MULTAS'
                        DataSource = DtmVeiculosCCIA.dsComFat
                        ScrollBars = ssVertical
                        TabOrder = 3
                      end
                      object DBMemo5: TDBMemo
                        Left = 251
                        Top = 141
                        Width = 240
                        Height = 36
                        DataField = 'PROMESSAS'
                        DataSource = DtmVeiculosCCIA.dsComFat
                        ScrollBars = ssVertical
                        TabOrder = 5
                      end
                      object DBMemo9: TDBMemo
                        Left = 8
                        Top = 141
                        Width = 240
                        Height = 36
                        DataField = 'OPCIONAIS'
                        DataSource = DtmVeiculosCCIA.dsComFat
                        ScrollBars = ssVertical
                        TabOrder = 4
                      end
                      object DBMemo15: TDBMemo
                        Left = 497
                        Top = 82
                        Width = 231
                        Height = 97
                        DataField = 'OBS'
                        DataSource = DtmVeiculosCCIA.dsComFat
                        ScrollBars = ssVertical
                        TabOrder = 6
                      end
                      object DBMemo16: TDBMemo
                        Left = 9
                        Top = 195
                        Width = 719
                        Height = 36
                        DataField = 'COND_REAIS'
                        DataSource = DtmVeiculosCCIA.dsComFat
                        ScrollBars = ssVertical
                        TabOrder = 7
                      end
                      object DBMemo17: TDBMemo
                        Left = 130
                        Top = 22
                        Width = 598
                        Height = 37
                        DataField = 'COND_NEGOCIACAO'
                        DataSource = DtmVeiculosCCIA.dsComFat
                        ScrollBars = ssVertical
                        TabOrder = 1
                        OnKeyPress = DBMemo17KeyPress
                      end
                      object BitBtn51: TBitBtn
                        Left = 4
                        Top = 22
                        Width = 120
                        Height = 33
                        Caption = '&Montar Cond >>'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clBlack
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = []
                        ParentFont = False
                        TabOrder = 0
                        OnClick = BitBtn20Click
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
                      object BitBtn32: TBitBtn
                        Left = 729
                        Top = 15
                        Width = 20
                        Height = 228
                        Hint = 'Editar OBS/DOC/MULTA/OPC/PROMESSA - [VEI124]'
                        Align = alRight
                        TabOrder = 8
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
                    end
                    object GroupBox32: TGroupBox
                      Left = 2
                      Top = 478
                      Width = 751
                      Height = 77
                      Align = alTop
                      TabOrder = 3
                      object Label105: TLabel
                        Left = 59
                        Top = 11
                        Width = 57
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Vendedor:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label106: TLabel
                        Left = 67
                        Top = 36
                        Width = 49
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Gerente:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label121: TLabel
                        Left = 36
                        Top = 59
                        Width = 80
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Valor a Venda:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label140: TLabel
                        Left = 293
                        Top = 59
                        Width = 92
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Valor a Receber:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object DBLookupComboBox9: TDBLookupComboBox
                        Left = 192
                        Top = 8
                        Width = 325
                        Height = 21
                        DataField = 'COVEND_V'
                        DataSource = DtmVeiculosCCIA.dsComFat
                        KeyField = 'COD_VENDEDOR'
                        ListField = 'NOME_VENDEDOR'
                        ListSource = DtmVeiculosCCIA.dsColaboradorComFat
                        TabOrder = 1
                      end
                      object DBLookupComboBox10: TDBLookupComboBox
                        Left = 192
                        Top = 33
                        Width = 325
                        Height = 21
                        DataField = 'COD_GERENTE'
                        DataSource = DtmVeiculosCCIA.dsComFat
                        KeyField = 'COD_VENDEDOR'
                        ListField = 'NOME_VENDEDOR'
                        ListSource = DtmVeiculosCCIA.dsGerenteComFat
                        TabOrder = 3
                      end
                      object DBEdit12: TDBEdit
                        Left = 118
                        Top = 56
                        Width = 127
                        Height = 21
                        CharCase = ecUpperCase
                        DataField = 'VALOR_REAL'
                        DataSource = DtmVeiculosCCIA.dsComFat
                        TabOrder = 4
                      end
                      object DBEdit25: TDBEdit
                        Left = 118
                        Top = 8
                        Width = 72
                        Height = 21
                        DataField = 'COVEND_V'
                        DataSource = DtmVeiculosCCIA.dsComFat
                        TabOrder = 0
                      end
                      object DBEdit37: TDBEdit
                        Left = 118
                        Top = 33
                        Width = 72
                        Height = 21
                        DataField = 'COD_GERENTE'
                        DataSource = DtmVeiculosCCIA.dsComFat
                        TabOrder = 2
                      end
                      object DBEdit80: TDBEdit
                        Left = 390
                        Top = 56
                        Width = 127
                        Height = 21
                        CharCase = ecUpperCase
                        DataField = 'VALOR_A_REC'
                        DataSource = DtmVeiculosCCIA.dsComFat
                        TabOrder = 5
                      end
                    end
                    object GroupBox33: TGroupBox
                      Left = 2
                      Top = 555
                      Width = 751
                      Height = 47
                      Align = alTop
                      Caption = 'Imprimir'
                      TabOrder = 4
                      object BitBtn27: TBitBtn
                        Left = 132
                        Top = 7
                        Width = 120
                        Height = 33
                        Hint = 'Imprimir - [VEI081]'
                        Caption = '&Declara'#231#227'o'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clBlack
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = []
                        ParentFont = False
                        TabOrder = 0
                        Visible = False
                        OnClick = BitBtn27Click
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
                      object BitBtn26: TBitBtn
                        Left = 254
                        Top = 7
                        Width = 120
                        Height = 33
                        Hint = 'Imprimir - [VEI075/VEI077/VEI078]'
                        Caption = '&Contrato'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clBlack
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = []
                        ParentFont = False
                        TabOrder = 1
                        OnClick = BitBtn46Click
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
                      object BitBtn53: TBitBtn
                        Left = 504
                        Top = 7
                        Width = 120
                        Height = 33
                        BiDiMode = bdRightToLeft
                        Caption = 'Comando'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clBlack
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = []
                        ParentBiDiMode = False
                        ParentFont = False
                        TabOrder = 3
                        OnClick = BitBtn52Click
                        Glyph.Data = {
                          36030000424D3603000000000000360000002800000010000000100000000100
                          18000000000000030000C30E0000C30E00000000000000000000FF00FFFF00FF
                          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                          FFFF00FFFF00FFFF00FFFF00FFFF00FFC39567B2773DC39567FF00FFFF00FFFF
                          00FFFF00FFFF00FFFF00FFC39567B2773DC39567FF00FFFF00FFFF00FFFF00FF
                          B2773DB2773DB2773DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB2773DB277
                          3DB2773DFF00FFFF00FFB3783EFFFFFFC39568B2773DC39568FFFFFFB2773DB2
                          773DB2773DB2773DFFFFFFC39568B2773DC39568FFFFFFB2773DB3783EC39568
                          FFFFFFFFFFFFFFFFFFC39568B3783EB3783EB3783EB3783EC39568FFFFFFFFFF
                          FFFFFFFFC39568B3783EB3783EB3783EB3783EB3783EB3783EC9AB8EB3783EB3
                          783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783E
                          B3783EB3783EB3783EC9AB8EB3783EB3783EB3783EB3783EB3783EB3783EB378
                          3EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EC9AB8EB3783EB3
                          783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EFFFFFF
                          FFFFFFFFFFFFB3793FC9AB8EB3783EB3783EB3783EB3783EB3783EB3783EB378
                          3EB3783EB3783EB3783EB3783EC4966AFFFFFFFFFFFFB3793FC9AB8EB3783EB3
                          783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EFF00FFB2773D
                          FFFFFFFFFFFFB3793FC9AC8FB3783EB3783EB3783EB3783EB3783EB3783EB378
                          3EB3783EB3783EB3783EFF00FFC5A27FB3783EB3783EB3783EFF00FFB3783EB3
                          783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EFF00FFFF00FF
                          FF00FFFF00FFFF00FFFF00FFB3783EB3783EB3783EB3783EB3783EB3783EB378
                          3EB3783EB3783EB3783EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC5A27FB3
                          783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EC5A27FFF00FFFF00FF
                          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                      end
                      object BitBtn12: TBitBtn
                        Left = 379
                        Top = 7
                        Width = 120
                        Height = 33
                        Hint = 'Imprimir - [NF0020/NF0021]'
                        Caption = 'NF'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clBlack
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = []
                        ParentFont = False
                        TabOrder = 2
                        OnClick = BitBtn8Click
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
                    end
                  end
                end
              end
              object TabSheet_ContratoVndConsignado: TTabSheet
                Caption = 'S - Contrato Venda Consignado'
                ImageIndex = 3
                ExplicitLeft = 0
                ExplicitTop = 0
                ExplicitWidth = 0
                ExplicitHeight = 0
                object ScrollBox6: TScrollBox
                  Left = 0
                  Top = 0
                  Width = 776
                  Height = 478
                  Align = alClient
                  BevelInner = bvNone
                  BevelOuter = bvNone
                  TabOrder = 0
                  object GroupBox_VndCons: TGroupBox
                    Left = 0
                    Top = 0
                    Width = 772
                    Height = 474
                    Align = alTop
                    Caption = 'Contrato Venda Consigna'#231#227'o'
                    TabOrder = 0
                    object GroupBox26: TGroupBox
                      Left = 2
                      Top = 141
                      Width = 768
                      Height = 98
                      Align = alTop
                      Caption = 'Per'#237'odo de Contrato'
                      TabOrder = 1
                      object Label82: TLabel
                        Left = 9
                        Top = 23
                        Width = 100
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Dura'#231#227'o (meses):'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label83: TLabel
                        Left = 75
                        Top = 48
                        Width = 34
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'In'#237'cio:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label84: TLabel
                        Left = 59
                        Top = 73
                        Width = 50
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'T'#233'rmino:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object DBEdit19: TDBEdit
                        Left = 115
                        Top = 20
                        Width = 121
                        Height = 21
                        CharCase = ecUpperCase
                        DataField = 'MESES_CONTRATO'
                        DataSource = DtmVeiculosCCIA.dsComFat
                        TabOrder = 0
                        OnExit = DBEdit19Exit
                      end
                      object DBEdit21: TDBEdit
                        Left = 115
                        Top = 45
                        Width = 121
                        Height = 21
                        CharCase = ecUpperCase
                        DataField = 'DATA_INICIO'
                        DataSource = DtmVeiculosCCIA.dsComFat
                        TabOrder = 1
                        OnExit = DBEdit21Exit
                      end
                      object DBEdit22: TDBEdit
                        Left = 115
                        Top = 70
                        Width = 121
                        Height = 21
                        CharCase = ecUpperCase
                        DataField = 'DATA_TERMINO'
                        DataSource = DtmVeiculosCCIA.dsComFat
                        TabOrder = 2
                      end
                    end
                    object GroupBox7: TGroupBox
                      Left = 2
                      Top = 239
                      Width = 768
                      Height = 82
                      Align = alTop
                      TabOrder = 2
                      object Label144: TLabel
                        Left = 52
                        Top = 11
                        Width = 57
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Vendedor:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label145: TLabel
                        Left = 60
                        Top = 36
                        Width = 49
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Gerente:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label146: TLabel
                        Left = 49
                        Top = 59
                        Width = 60
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Valor Real:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label147: TLabel
                        Left = 303
                        Top = 59
                        Width = 83
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Comiss'#227'o (%):'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object DBLookupComboBox2: TDBLookupComboBox
                        Left = 191
                        Top = 8
                        Width = 322
                        Height = 21
                        DataField = 'COVEND_V'
                        DataSource = DtmVeiculosCCIA.dsComFat
                        KeyField = 'COD_VENDEDOR'
                        ListField = 'NOME_VENDEDOR'
                        ListSource = DtmVeiculosCCIA.dsColaboradorComFat
                        TabOrder = 1
                      end
                      object DBLookupComboBox5: TDBLookupComboBox
                        Left = 191
                        Top = 33
                        Width = 322
                        Height = 21
                        DataField = 'COD_GERENTE'
                        DataSource = DtmVeiculosCCIA.dsComFat
                        KeyField = 'COD_VENDEDOR'
                        ListField = 'NOME_VENDEDOR'
                        ListSource = DtmVeiculosCCIA.dsGerenteComFat
                        TabOrder = 3
                      end
                      object DBEdit81: TDBEdit
                        Left = 115
                        Top = 56
                        Width = 121
                        Height = 21
                        CharCase = ecUpperCase
                        DataField = 'VALOR_REAL'
                        DataSource = DtmVeiculosCCIA.dsComFat
                        TabOrder = 4
                      end
                      object DBEdit82: TDBEdit
                        Left = 115
                        Top = 8
                        Width = 72
                        Height = 21
                        DataField = 'COVEND_V'
                        DataSource = DtmVeiculosCCIA.dsComFat
                        TabOrder = 0
                      end
                      object DBEdit83: TDBEdit
                        Left = 115
                        Top = 33
                        Width = 72
                        Height = 21
                        DataField = 'COD_GERENTE'
                        DataSource = DtmVeiculosCCIA.dsComFat
                        TabOrder = 2
                      end
                      object DBEdit84: TDBEdit
                        Left = 392
                        Top = 56
                        Width = 121
                        Height = 21
                        CharCase = ecUpperCase
                        DataField = 'COMISSAO'
                        DataSource = DtmVeiculosCCIA.dsComFat
                        TabOrder = 5
                      end
                    end
                    object GroupBox19: TGroupBox
                      Left = 2
                      Top = 431
                      Width = 768
                      Height = 45
                      Align = alTop
                      Caption = 'Imprimir'
                      TabOrder = 3
                      object BitBtn30: TBitBtn
                        Left = 339
                        Top = 9
                        Width = 120
                        Height = 33
                        Hint = 'Imprimir - [VEI076]'
                        Align = alCustom
                        Caption = '&Contrato'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clBlack
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = []
                        ParentFont = False
                        TabOrder = 0
                        OnClick = BitBtn46Click
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
                    end
                    object Panel23: TPanel
                      Left = 2
                      Top = 15
                      Width = 768
                      Height = 126
                      Align = alTop
                      BevelOuter = bvNone
                      TabOrder = 0
                      object Label34: TLabel
                        Left = 36
                        Top = 104
                        Width = 73
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Consignante:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label36: TLabel
                        Left = 71
                        Top = 54
                        Width = 39
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Chassi:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label16: TLabel
                        Left = 69
                        Top = 7
                        Width = 41
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'C'#243'digo:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label38: TLabel
                        Left = 293
                        Top = 7
                        Width = 85
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Data da Venda:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label39: TLabel
                        Left = 82
                        Top = 30
                        Width = 27
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Tipo:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label87: TLabel
                        Left = 77
                        Top = 79
                        Width = 33
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Placa:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object DBEdit15: TDBEdit
                        Left = 114
                        Top = 101
                        Width = 72
                        Height = 21
                        CharCase = ecUpperCase
                        DataField = 'CLIENTES_V'
                        DataSource = DtmVeiculosCCIA.dsComFat
                        TabOrder = 6
                      end
                      object DBLookupComboBox1: TDBLookupComboBox
                        Left = 190
                        Top = 101
                        Width = 323
                        Height = 21
                        DataField = 'CLIENTES_V'
                        DataSource = DtmVeiculosCCIA.dsComFat
                        KeyField = 'COD_CLIENTE'
                        ListField = 'NOME_CLIENTE'
                        ListSource = DtmVeiculosCCIA.dsClienteComFat
                        TabOrder = 7
                      end
                      object BitBtn7: TBitBtn
                        Left = 518
                        Top = 78
                        Width = 20
                        Height = 20
                        TabOrder = 8
                        Visible = False
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
                        Left = 544
                        Top = 78
                        Width = 20
                        Height = 20
                        TabOrder = 9
                        Visible = False
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
                        Tag = 2
                        Left = 190
                        Top = 51
                        Width = 323
                        Height = 21
                        CharCase = ecUpperCase
                        DataField = 'CHASSIV'
                        DataSource = DtmVeiculosCCIA.dsComFat
                        TabOrder = 4
                        OnKeyDown = DBEdit2KeyDown
                      end
                      object BitBtn14: TBitBtn
                        Left = 518
                        Top = 52
                        Width = 20
                        Height = 20
                        TabOrder = 10
                        Visible = False
                        OnClick = BitBtn25Click
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
                      object DBEdit64: TDBEdit
                        Left = 114
                        Top = 51
                        Width = 72
                        Height = 21
                        CharCase = ecUpperCase
                        DataField = 'COD_ESTMOTO'
                        DataSource = DtmVeiculosCCIA.dsComFat
                        Enabled = False
                        TabOrder = 3
                      end
                      object DBEdit88: TDBEdit
                        Left = 115
                        Top = 3
                        Width = 115
                        Height = 21
                        CharCase = ecUpperCase
                        DataField = 'N_COMANDO'
                        DataSource = DtmVeiculosCCIA.dsComFat
                        Enabled = False
                        TabOrder = 0
                      end
                      object DBEdit95: TDBEdit
                        Left = 381
                        Top = 2
                        Width = 132
                        Height = 21
                        CharCase = ecUpperCase
                        DataField = 'DATA_VEN'
                        DataSource = DtmVeiculosCCIA.dsComFat
                        Enabled = False
                        TabOrder = 1
                      end
                      object DBComboBox8: TDBComboBox
                        Left = 114
                        Top = 27
                        Width = 399
                        Height = 21
                        CharCase = ecUpperCase
                        DataField = 'TIPO_VENDA_V'
                        DataSource = DtmVeiculosCCIA.dsComFat
                        ItemHeight = 0
                        Items.Strings = (
                          'N - NOVO'
                          'U - USADO')
                        ReadOnly = True
                        TabOrder = 2
                      end
                      object DBEdit66: TDBEdit
                        Tag = 1
                        Left = 115
                        Top = 77
                        Width = 115
                        Height = 21
                        CharCase = ecUpperCase
                        DataField = 'PLACAV'
                        DataSource = DtmVeiculosCCIA.dsComFat
                        TabOrder = 5
                      end
                    end
                    object GroupBox6: TGroupBox
                      Left = 2
                      Top = 321
                      Width = 768
                      Height = 110
                      Align = alTop
                      Caption = 'Opera'#231#227'o'
                      TabOrder = 4
                      object Panel9: TPanel
                        Left = 2
                        Top = 15
                        Width = 764
                        Height = 52
                        Align = alClient
                        BevelOuter = bvNone
                        TabOrder = 0
                        object SpeedButton13: TSpeedButton
                          Left = 0
                          Top = 0
                          Width = 150
                          Height = 52
                          Hint = 'Devolu'#231#227'o Simb'#243'lica ao Consignante'
                          Align = alLeft
                          Caption = 'Devolu'#231#227'o Simb'#243'lica'
                          Flat = True
                          Glyph.Data = {
                            F6060000424DF606000000000000360000002800000018000000180000000100
                            180000000000C0060000C30E0000C30E00000000000000000000FF00FFFF00FF
                            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBED4E393C5E575BA
                            E663B3E759B0E755AFE75BB1E769B6E77FBEE5A1CAE4FF00FFFF00FFFF00FFFF
                            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF58B0E7
                            50ADE561B4E882C3EE9BD0F0A6D5F0ADD8F3A5D4F094CCEF79BFEC59AFE651AC
                            E57ABCE6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                            00FF63B4E4A4D4F1EFF5FBE4F3FBC1E1F4A6D4F099CEEF91CBEF98CEEFA4D3F0
                            BFE0F5DCEDF9D9ECF87ABFECACCEE4FF00FFFF00FFFF00FFFF00FFFF00FFFF00
                            FFFF00FFFF00FFFF00FFD5E9F6A2D2F154AFE651ADE654AEE855AFE856B0E856
                            B0E856B0E855AFE854AEE851ADE656AFE8BBDEF5BED7E7FF00FFFF00FFFF00FF
                            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9FCCE952AEE85AB0E65CB2E97CBC
                            E4A2CAE3BED4E2FF00FFFF00FFFF00FFFF00FFBFD5E2A3CAE46EB8E5C3D7E4FF
                            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9CC8E5
                            A1C9E3FF00FFFF00FFB2D0E298C6E387C1E67FBEE482BEE48AC2E69DC8E3BBD3
                            E2FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB88D60AD753CB88D60FF
                            00FFFF00FFFF00FFFF00FF64B4E753AEE850ADE65AB1E666B6EA6FBBEB6EBBEA
                            64B5EA57B0E651ADE653AEE877BBE6FF00FFFF00FFFF00FFFF00FFB88D60AD75
                            3CAD753CAD753CBC946CFF00FFFF00FF50ACE690CAEFD4EAF8F0F5FCE9F4FADA
                            EDFAD0E8F7CEE7F8D6ECF8DFEFF9E2F1F9C8E4F67BC0EC5AB0E5B57D47B67F48
                            FFFFFFAD753CAD753CAD753CAD753CB48352FF00FFFF00FFEBF5FCB5DCF46FBC
                            EA54ADE550ACE452AEE852ADE452ADE452AEE851ACE452ADE56AB8EAB6DDF2B8
                            DDF4B3793FB47A40F4EBE3BF9468AD753CAD753CAD753CC29C74FF00FFFF00FF
                            69B8EA52AEE65AB1E85BB2E95CB2E95CB2E95CB2E95CB2E95CB2E95CB2E95CB2
                            E95AB1E853AEE86CBAE9B3793FB47A40D8BA9CF6F0EABF9468AD753CBF9468F5
                            EFE9FF00FFFF00FFAACCE35BB1E95AB0E65AB0E65AB0E65CB2E95AB0E65AB0E6
                            5CB2E95AB0E65AB0E65CB2E962B2E5FF00FFB3793FB47A40B2783ED8BA9CF4EB
                            E3FFFFFFF4EBE3D8BA9CBB8D5EFF00FFFF00FFFF00FFBAD3E396C6E57DBDE66E
                            B8E768B6E869B6E871B9E783BFE69DC9E5FF00FFFF00FFFF00FFB3793FB3783E
                            B3783EB3783EB3783EB3783EB3783EC9AA8BB3783EB6814CCDB39AFF00FFFF00
                            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                            00FFB47C43DBBFA4FFFFFFFEFEFEFEFEFEFEFEFEB3783FC8A98BB3783EB3783E
                            B2773DB37940BB8D5FC6A482CDB49CD1BEAAD4C3B3D3C3B2D0BCA7CCB196C39E
                            7AB98756FF00FFFF00FFBF946AEFE3D7FFFFFFFFFFFFFEFEFEFEFEFEB37940C9
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
                          ParentShowHint = False
                          ShowHint = True
                          OnClick = SpeedButton13Click
                          ExplicitLeft = 2
                          ExplicitTop = 15
                          ExplicitHeight = 45
                        end
                        object SpeedButton14: TSpeedButton
                          Left = 584
                          Top = 0
                          Width = 180
                          Height = 52
                          Hint = 'Devolu'#231#227'o de Mercadoria Recebida em Consigna'#231#227'o'
                          Align = alRight
                          Caption = 'Devolu'#231#227'o em Consigna'#231#227'o'
                          Flat = True
                          Glyph.Data = {
                            F6060000424DF606000000000000360000002800000018000000180000000100
                            180000000000C0060000C30E0000C30E00000000000000000000FF00FFFF00FF
                            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                            FFFF00FFFF00FFAF7134AF7134AF7134AF7134FF00FFFF00FFFF00FFFF00FFFF
                            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFAF7134AF7134AF7134AF7134FF00
                            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFAF7134
                            AF7134AF7134AF7134FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                            00FFFF00FFFF00FFAF7134AF7134AF7134AF7134FF00FFFF00FFFF00FFFF00FF
                            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFAF71
                            34AF7134AF7134AF7134AF7134AF7134AF7134AF7134AF7134AF7134B07338FF
                            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                            FF00FFFF00FFAF7134AF7134AF7134AF7134AF7134AF7134AF7134AF7134AF71
                            34AF7134AF7134AF7134FF00FFFF00FFFF00FFFF00FFB88D60AD753CB88D60FF
                            00FFFF00FFFF00FFFF00FFFF00FFAF7134AF7134AF7134AF7134AF7134AF7134
                            AF7134AF7134AF7134AF7134AF7134FF00FFFF00FFFF00FFFF00FFB88D60AD75
                            3CAD753CAD753CB88D60FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                            00FFFF00FFFF00FFAF7134AF7134AF7134AF7134FF00FFFF00FFB57D47B67F48
                            FFFFFFAD753CAD753CAD753CAD753CAD753CFFFFFFB2783EB2783EB2783EB278
                            3EFFFFFFAD753CB78B5EFF00FFAF7134AF7134AF7134AF7134FF00FFFF00FFFF
                            00FFB3793FB47A40F4EBE3BF9468AD753CAD753CAD753CBF9468F5EDE5B3783E
                            B3783EB3783EB3783EF4EBE3C6A481FF00FFAF7134AF7134AF7134AF7134FF00
                            FFBC8D5FFF00FFFF00FFB3793FB47A40D8BA9CF6F0EABF9468AD753CBF9468F6
                            F0EAD8BA9CB2783EB2783EB2783EB2783ED9C2AAFF00FFAF7134AF7134AF7134
                            AF7134FF00FFBB8D5FB2773DFF00FFFF00FFB3793FB47A40B2783ED8BA9CF4EB
                            E3FFFFFFF4EBE3D8BA9CB2783EB2783EB2783EB2783EB2783EFF00FFFF00FFFF
                            00FFFF00FFFF00FFFF00FFBB8D5FB2773DB2773DFF00FFFF00FFB3793FB3783E
                            B3783EB3783EB3783EB3783EB3783EC9AA8BB3783EB3783EB3783EB3783EB378
                            3EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EFF00FFFF
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
                          ParentShowHint = False
                          ShowHint = True
                          OnClick = SpeedButton14Click
                          ExplicitLeft = 621
                          ExplicitTop = 15
                          ExplicitHeight = 45
                        end
                      end
                      object Panel11: TPanel
                        Left = 2
                        Top = 67
                        Width = 764
                        Height = 41
                        Align = alBottom
                        BevelOuter = bvNone
                        TabOrder = 1
                        object Label204: TLabel
                          Left = 0
                          Top = 0
                          Width = 297
                          Height = 41
                          Align = alLeft
                          AutoSize = False
                          Caption = 
                            'Devolu'#231#227'o simb'#243'lica ao consignante, caso realize a venda do ve'#237'c' +
                            'ulo dentro do prazo pactuado.'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clRed
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = []
                          ParentFont = False
                          WordWrap = True
                        end
                        object Label43: TLabel
                          Left = 467
                          Top = 0
                          Width = 297
                          Height = 41
                          Align = alRight
                          AutoSize = False
                          Caption = 
                            'Devolu'#231#227'o efetiva de mercadoria remetida em Consigna'#231#227'o Mercanti' +
                            'l, caso n'#227'o seja efetuada a venda do ve'#237'culo dentro do prazo pac' +
                            'tuado.'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clRed
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = []
                          ParentFont = False
                          WordWrap = True
                          ExplicitLeft = 472
                        end
                      end
                    end
                  end
                end
              end
              object TabSheet_Venda: TTabSheet
                Caption = 'S - Comando Faturamento'
                ImageIndex = 4
                ExplicitLeft = 0
                ExplicitTop = 0
                ExplicitWidth = 0
                ExplicitHeight = 0
                object ScrollBox7: TScrollBox
                  Left = 0
                  Top = 0
                  Width = 776
                  Height = 478
                  Align = alClient
                  BevelInner = bvNone
                  BevelOuter = bvNone
                  TabOrder = 0
                  object GroupBox_Comando: TGroupBox
                    Left = 0
                    Top = 0
                    Width = 772
                    Height = 474
                    Align = alTop
                    Caption = 'Venda de Ve'#237'culo'
                    TabOrder = 0
                    object GroupBox_Dados: TGroupBox
                      Left = 2
                      Top = 15
                      Width = 768
                      Height = 235
                      Align = alTop
                      TabOrder = 0
                      object Label9: TLabel
                        Left = 272
                        Top = 12
                        Width = 82
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Tipo de Venda:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label10: TLabel
                        Left = 68
                        Top = 63
                        Width = 39
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Chassi:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label11: TLabel
                        Left = 18
                        Top = 13
                        Width = 89
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'N'#186' do Comando:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label6: TLabel
                        Left = 41
                        Top = 159
                        Width = 66
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Nome Resp:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label7: TLabel
                        Left = 46
                        Top = 184
                        Width = 61
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Fone Resp:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label64: TLabel
                        Left = 603
                        Top = 13
                        Width = 95
                        Height = 13
                        Caption = 'Dados do Ve'#237'culo'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label100: TLabel
                        Left = 44
                        Top = 37
                        Width = 63
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Nota Fiscal:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label22: TLabel
                        Left = 74
                        Top = 88
                        Width = 33
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Placa:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label101: TLabel
                        Left = 65
                        Top = 111
                        Width = 42
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Cliente:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label102: TLabel
                        Left = 50
                        Top = 135
                        Width = 57
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Vendedor:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                        Visible = False
                      end
                      object Label88: TLabel
                        Left = 36
                        Top = 209
                        Width = 71
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Propriet'#225'rio:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                        WordWrap = True
                      end
                      object DBEdit1: TDBEdit
                        Left = 109
                        Top = 9
                        Width = 118
                        Height = 21
                        CharCase = ecUpperCase
                        DataField = 'N_COMANDO'
                        DataSource = DtmVeiculosCCIA.dsComFat
                        Enabled = False
                        TabOrder = 1
                      end
                      object DBEdit2: TDBEdit
                        Tag = 2
                        Left = 176
                        Top = 59
                        Width = 334
                        Height = 21
                        CharCase = ecUpperCase
                        DataField = 'CHASSIV'
                        DataSource = DtmVeiculosCCIA.dsComFat
                        TabOrder = 5
                      end
                      object DBEdit3: TDBEdit
                        Left = 109
                        Top = 156
                        Width = 423
                        Height = 21
                        CharCase = ecUpperCase
                        DataField = 'NOME_RECEB'
                        DataSource = DtmVeiculosCCIA.dsComFat
                        TabOrder = 11
                      end
                      object DBEdit4: TDBEdit
                        Left = 109
                        Top = 180
                        Width = 118
                        Height = 21
                        CharCase = ecUpperCase
                        DataField = 'FONE_RECEB'
                        DataSource = DtmVeiculosCCIA.dsComFat
                        TabOrder = 12
                      end
                      object DBEdit50: TDBEdit
                        Left = 109
                        Top = 34
                        Width = 118
                        Height = 21
                        CharCase = ecUpperCase
                        DataField = 'NUM_NOTA_V'
                        DataSource = DtmVeiculosCCIA.dsComFat
                        Enabled = False
                        TabOrder = 3
                      end
                      object Memo1: TMemo
                        Left = 560
                        Top = 32
                        Width = 207
                        Height = 113
                        Enabled = False
                        Lines.Strings = (
                          '')
                        TabOrder = 15
                      end
                      object DBComboBox3: TDBComboBox
                        Left = 357
                        Top = 9
                        Width = 175
                        Height = 21
                        CharCase = ecUpperCase
                        DataField = 'TIPO_VENDA_V'
                        DataSource = DtmVeiculosCCIA.dsComFat
                        ItemHeight = 0
                        Items.Strings = (
                          'N - NOVO'
                          'U - USADO')
                        ReadOnly = True
                        TabOrder = 2
                      end
                      object DBEdit7: TDBEdit
                        Tag = 1
                        Left = 109
                        Top = 84
                        Width = 118
                        Height = 21
                        CharCase = ecUpperCase
                        DataField = 'PLACAV'
                        DataSource = DtmVeiculosCCIA.dsComFat
                        TabOrder = 6
                      end
                      object BitBtn38: TBitBtn
                        Left = 512
                        Top = 59
                        Width = 20
                        Height = 21
                        TabOrder = 0
                        OnClick = BitBtn25Click
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
                      object DBEdit74: TDBEdit
                        Left = 109
                        Top = 59
                        Width = 65
                        Height = 21
                        CharCase = ecUpperCase
                        DataField = 'COD_ESTMOTO'
                        DataSource = DtmVeiculosCCIA.dsComFat
                        Enabled = False
                        TabOrder = 4
                      end
                      object DBEdit51: TDBEdit
                        Left = 109
                        Top = 108
                        Width = 65
                        Height = 21
                        CharCase = ecUpperCase
                        DataField = 'CLIENTES_V'
                        DataSource = DtmVeiculosCCIA.dsComFat
                        TabOrder = 7
                      end
                      object DBLookupComboBox14: TDBLookupComboBox
                        Left = 176
                        Top = 108
                        Width = 356
                        Height = 21
                        DataField = 'CLIENTES_V'
                        DataSource = DtmVeiculosCCIA.dsComFat
                        KeyField = 'COD_CLIENTE'
                        ListField = 'NOME_CLIENTE'
                        ListSource = DtmVeiculosCCIA.dsClienteComFat
                        TabOrder = 8
                      end
                      object DBEdit52: TDBEdit
                        Left = 109
                        Top = 132
                        Width = 65
                        Height = 21
                        CharCase = ecUpperCase
                        DataField = 'COVEND_V'
                        DataSource = DtmVeiculosCCIA.dsComFat
                        TabOrder = 9
                      end
                      object DBLookupComboBox23: TDBLookupComboBox
                        Left = 176
                        Top = 132
                        Width = 356
                        Height = 21
                        DataField = 'COVEND_V'
                        DataSource = DtmVeiculosCCIA.dsComFat
                        KeyField = 'COD_VENDEDOR'
                        ListField = 'NOME_VENDEDOR'
                        ListSource = DtmVeiculosCCIA.dsColaboradorComFat
                        TabOrder = 10
                      end
                      object DBEdit67: TDBEdit
                        Left = 109
                        Top = 206
                        Width = 66
                        Height = 21
                        DataField = 'COD_CLI_VENDE'
                        DataSource = DtmVeiculosCCIA.dsComFat
                        TabOrder = 13
                      end
                      object DBLookupComboBox15: TDBLookupComboBox
                        Left = 176
                        Top = 206
                        Width = 356
                        Height = 21
                        DataField = 'COD_CLI_VENDE'
                        DataSource = DtmVeiculosCCIA.dsComFat
                        KeyField = 'COD_CLIENTE'
                        ListField = 'NOME_CLIENTE'
                        ListSource = DtmVeiculosCCIA.dsFornecedorComFat
                        TabOrder = 14
                      end
                    end
                    object GroupBox5: TGroupBox
                      Left = 2
                      Top = 250
                      Width = 768
                      Height = 241
                      Align = alTop
                      Color = clBtnFace
                      ParentColor = False
                      TabOrder = 1
                      object Panel4: TPanel
                        Left = 2
                        Top = 15
                        Width = 764
                        Height = 55
                        Align = alTop
                        BevelOuter = bvNone
                        TabOrder = 0
                        object Label20: TLabel
                          Left = 45
                          Top = 4
                          Width = 60
                          Height = 13
                          Alignment = taRightJustify
                          Caption = 'Valor Real:'
                          Font.Charset = ANSI_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = [fsBold, fsUnderline]
                          ParentFont = False
                        end
                        object Label17: TLabel
                          Left = 13
                          Top = 31
                          Width = 92
                          Height = 13
                          Alignment = taRightJustify
                          Caption = 'Valor a Receber:'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = [fsBold, fsUnderline]
                          ParentFont = False
                        end
                        object DBEdit5: TDBEdit
                          Left = 107
                          Top = 1
                          Width = 121
                          Height = 21
                          CharCase = ecUpperCase
                          DataField = 'VALOR_REAL'
                          DataSource = DtmVeiculosCCIA.dsComFat
                          Enabled = False
                          TabOrder = 0
                        end
                        object DBEdit6: TDBEdit
                          Left = 107
                          Top = 28
                          Width = 121
                          Height = 21
                          CharCase = ecUpperCase
                          DataField = 'VALOR_A_REC'
                          DataSource = DtmVeiculosCCIA.dsComFat
                          Enabled = False
                          TabOrder = 1
                        end
                        object BitBtn20: TBitBtn
                          Left = 253
                          Top = 16
                          Width = 120
                          Height = 33
                          Caption = '&Montar Cond >>'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clBlack
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = []
                          ParentFont = False
                          TabOrder = 2
                          OnClick = BitBtn20Click
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
                      end
                      object Panel5: TPanel
                        Left = 2
                        Top = 206
                        Width = 764
                        Height = 33
                        Align = alClient
                        BevelOuter = bvNone
                        Caption = 'Panel5'
                        TabOrder = 2
                        object DBGrid2: TDBGrid
                          Left = 0
                          Top = 0
                          Width = 764
                          Height = 33
                          Align = alClient
                          DataSource = DtmVeiculosCCIA.dsPlanoTempComFat
                          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                          TabOrder = 0
                          TitleFont.Charset = DEFAULT_CHARSET
                          TitleFont.Color = clWindowText
                          TitleFont.Height = -11
                          TitleFont.Name = 'Tahoma'
                          TitleFont.Style = []
                          OnKeyDown = DBGrid2KeyDown
                        end
                      end
                      object Panel16: TPanel
                        Left = 2
                        Top = 70
                        Width = 764
                        Height = 136
                        Align = alTop
                        BevelOuter = bvNone
                        TabOrder = 1
                        object Label37: TLabel
                          Left = 25
                          Top = 9
                          Width = 80
                          Height = 13
                          Alignment = taRightJustify
                          Caption = 'Observa'#231#227'o 1:'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = [fsBold]
                          ParentFont = False
                        end
                        object Label81: TLabel
                          Left = 597
                          Top = 9
                          Width = 42
                          Height = 13
                          Alignment = taRightJustify
                          Caption = 'Valor 1:'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = [fsBold]
                          ParentFont = False
                        end
                        object Label148: TLabel
                          Left = 25
                          Top = 35
                          Width = 80
                          Height = 13
                          Alignment = taRightJustify
                          Caption = 'Observa'#231#227'o 2:'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = [fsBold]
                          ParentFont = False
                        end
                        object Label149: TLabel
                          Left = 597
                          Top = 35
                          Width = 42
                          Height = 13
                          Alignment = taRightJustify
                          Caption = 'Valor 2:'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = [fsBold]
                          ParentFont = False
                        end
                        object Label154: TLabel
                          Left = 25
                          Top = 60
                          Width = 80
                          Height = 13
                          Alignment = taRightJustify
                          Caption = 'Observa'#231#227'o 3:'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = [fsBold]
                          ParentFont = False
                        end
                        object Label155: TLabel
                          Left = 597
                          Top = 61
                          Width = 42
                          Height = 13
                          Alignment = taRightJustify
                          Caption = 'Valor 3:'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = [fsBold]
                          ParentFont = False
                        end
                        object Label156: TLabel
                          Left = 25
                          Top = 85
                          Width = 80
                          Height = 13
                          Alignment = taRightJustify
                          Caption = 'Observa'#231#227'o 4:'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = [fsBold]
                          ParentFont = False
                        end
                        object Label157: TLabel
                          Left = 597
                          Top = 86
                          Width = 42
                          Height = 13
                          Alignment = taRightJustify
                          Caption = 'Valor 4:'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = [fsBold]
                          ParentFont = False
                        end
                        object Label158: TLabel
                          Left = 25
                          Top = 110
                          Width = 80
                          Height = 13
                          Alignment = taRightJustify
                          Caption = 'Observa'#231#227'o 5:'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = [fsBold]
                          ParentFont = False
                        end
                        object Label159: TLabel
                          Left = 597
                          Top = 111
                          Width = 42
                          Height = 13
                          Alignment = taRightJustify
                          Caption = 'Valor 5:'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = [fsBold]
                          ParentFont = False
                        end
                        object DBEdit17: TDBEdit
                          Left = 107
                          Top = 6
                          Width = 421
                          Height = 21
                          CharCase = ecUpperCase
                          DataField = 'OBS1'
                          DataSource = DtmVeiculosCCIA.dsComFat
                          TabOrder = 0
                        end
                        object DBEdit18: TDBEdit
                          Left = 642
                          Top = 6
                          Width = 121
                          Height = 21
                          CharCase = ecUpperCase
                          DataField = 'VALOBS1'
                          DataSource = DtmVeiculosCCIA.dsComFat
                          TabOrder = 1
                          OnExit = DBEdit18Exit
                        end
                        object DBEdit85: TDBEdit
                          Left = 107
                          Top = 32
                          Width = 421
                          Height = 21
                          CharCase = ecUpperCase
                          DataField = 'OBS2'
                          DataSource = DtmVeiculosCCIA.dsComFat
                          TabOrder = 2
                        end
                        object DBEdit86: TDBEdit
                          Left = 642
                          Top = 31
                          Width = 121
                          Height = 21
                          CharCase = ecUpperCase
                          DataField = 'VALOBS2'
                          DataSource = DtmVeiculosCCIA.dsComFat
                          TabOrder = 3
                          OnExit = DBEdit18Exit
                        end
                        object DBEdit89: TDBEdit
                          Left = 107
                          Top = 57
                          Width = 421
                          Height = 21
                          CharCase = ecUpperCase
                          DataField = 'OBS3'
                          DataSource = DtmVeiculosCCIA.dsComFat
                          TabOrder = 4
                        end
                        object DBEdit90: TDBEdit
                          Left = 642
                          Top = 57
                          Width = 121
                          Height = 21
                          CharCase = ecUpperCase
                          DataField = 'VALOBS3'
                          DataSource = DtmVeiculosCCIA.dsComFat
                          TabOrder = 5
                          OnExit = DBEdit18Exit
                        end
                        object DBEdit91: TDBEdit
                          Left = 107
                          Top = 82
                          Width = 421
                          Height = 21
                          CharCase = ecUpperCase
                          DataField = 'OBS4'
                          DataSource = DtmVeiculosCCIA.dsComFat
                          TabOrder = 6
                        end
                        object DBEdit92: TDBEdit
                          Left = 642
                          Top = 82
                          Width = 121
                          Height = 21
                          CharCase = ecUpperCase
                          DataField = 'VALOBS4'
                          DataSource = DtmVeiculosCCIA.dsComFat
                          TabOrder = 7
                          OnExit = DBEdit18Exit
                        end
                        object DBEdit93: TDBEdit
                          Left = 107
                          Top = 107
                          Width = 421
                          Height = 21
                          CharCase = ecUpperCase
                          DataField = 'OBS5'
                          DataSource = DtmVeiculosCCIA.dsComFat
                          TabOrder = 8
                        end
                        object DBEdit94: TDBEdit
                          Left = 642
                          Top = 109
                          Width = 121
                          Height = 21
                          CharCase = ecUpperCase
                          DataField = 'VALOBS5'
                          DataSource = DtmVeiculosCCIA.dsComFat
                          TabOrder = 9
                          OnExit = DBEdit94Exit
                        end
                      end
                    end
                    object GroupBox9: TGroupBox
                      Left = 2
                      Top = 491
                      Width = 768
                      Height = 48
                      Align = alTop
                      Caption = 'Imprimir'
                      TabOrder = 2
                      object BitBtn52: TBitBtn
                        Left = 447
                        Top = 8
                        Width = 120
                        Height = 33
                        BiDiMode = bdRightToLeft
                        Caption = 'Contrato'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clBlack
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = []
                        ParentBiDiMode = False
                        ParentFont = False
                        TabOrder = 3
                        OnClick = BitBtn52Click
                        Glyph.Data = {
                          36030000424D3603000000000000360000002800000010000000100000000100
                          18000000000000030000C30E0000C30E00000000000000000000FF00FF898989
                          5454545454545454545454545454545454545454545454545454545454545454
                          54878787FF00FFFF00FFFF00FF545454FCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFE
                          FEFFD8D8FFDBDBFFFFFFFFFFFFFFFFFFFF545454FF00FFFF00FFFF00FF545454
                          FBFBFBBFBFBFFEFEFEFFFFFFF8F8FEA4A4FBDBDBFEDBDBFFA4A4FBFEFEFFFFFF
                          FF545454FF00FFFF00FFFF00FF545454FCFCFCF5F5F5909090A5A5A664649464
                          64946E6EC5B9B9FEE6E6FFA4A4FBFFFFFF545454FF00FFFF00FFFF00FF545454
                          FCFCFCFFFFFFFCFCFCA6A6A8C2C2EEC9C9ED646494A2A2FBE9E9FFA4A4FBFFFF
                          FF545454FF00FFFF00FFFF00FF545454FCFCFCE7E7E7A1A1A1A2A2A58585AF6E
                          6EB0BFBFF3CFCFFEA4A4FBE6E6FFFEFEFE545454FF00FFFF00FFFF00FF545454
                          FCFCFCFFFFFFFFFFFFFFFFFFFFFFFFC8C8F3A4A4FBA4A4FBD8D8FFFFFFFFFEFE
                          FE545454FF00FFFF00FFFF00FF545454FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFF
                          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFE545454FF00FFFF00FFFF00FF545454
                          FDFDFD919191919191919191919191919191919191919191919191919191FEFE
                          FE545454FF00FFFF00FFFF00FF545454FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFF
                          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFE545454FF00FFFF00FFFF00FF545454
                          FDFDFD919191919191919191919191919191FFFFFFFFFFFFFEFEFEFEFEFEFDFD
                          FD545454FF00FFFF00FFFF00FF545454FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFF
                          FFFFFFFFFF919191545454545454545454545454FF00FFFF00FFFF00FF545454
                          FDFDFD9797978A8A8A8A8A8A8A8A8A8B8B8BFFFFFF545454D4D4D4FFFFFFB8B8
                          B87B7B7BFF00FFFF00FFFF00FF545454FDFDFDA4A4A48A8A8A8A8A8A8A8A8A9F
                          9F9FFFFFFF545454EDEDEDB9B9B9787878FF00FFFF00FFFF00FFFF00FF545454
                          FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF545454B9B9B9777777FF00
                          FFFF00FFFF00FFFF00FFFF00FF89898954545454545454545454545454545454
                          54545454545454547A7A7AFF00FFFF00FFFF00FFFF00FFFF00FF}
                      end
                      object BitBtn10: TBitBtn
                        Left = 205
                        Top = 8
                        Width = 120
                        Height = 33
                        Hint = 'Imprimir -  [VEI074]'
                        Caption = ' Comando'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clBlack
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = []
                        ParentFont = False
                        TabOrder = 0
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
                      object BitBtn13: TBitBtn
                        Left = 326
                        Top = 8
                        Width = 120
                        Height = 33
                        Hint = 'Imprimir - [NF0020/NF0021]'
                        Caption = 'NF'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clBlack
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = []
                        ParentFont = False
                        TabOrder = 1
                        OnClick = BitBtn8Click
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
                      object BitBtn46: TBitBtn
                        Left = 633
                        Top = 8
                        Width = 120
                        Height = 33
                        Hint = 'Imprimir - [VEI075/VEI077/VEI078]'
                        Caption = 'Contrato'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clBlack
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = []
                        ParentFont = False
                        TabOrder = 2
                        Visible = False
                        OnClick = BitBtn46Click
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
                    end
                  end
                end
              end
              object TabSheet_DadosdaNota: TTabSheet
                Caption = 'S - Dados da Nota'
                ImageIndex = 1
                ExplicitLeft = 0
                ExplicitTop = 0
                ExplicitWidth = 0
                ExplicitHeight = 0
                object ScrollBox4: TScrollBox
                  Left = 0
                  Top = 0
                  Width = 776
                  Height = 478
                  Align = alClient
                  BevelInner = bvNone
                  BevelOuter = bvNone
                  TabOrder = 0
                  object GroupBox_Nota: TGroupBox
                    Left = 0
                    Top = 0
                    Width = 772
                    Height = 452
                    Align = alTop
                    Caption = 'Dados da Nota Fiscal'
                    TabOrder = 0
                    object GroupBox23: TGroupBox
                      Left = 2
                      Top = 169
                      Width = 768
                      Height = 227
                      Align = alTop
                      Caption = 'Dados Corpo NFE e Observa'#231#245'es'
                      TabOrder = 1
                      object Label73: TLabel
                        Left = 13
                        Top = 16
                        Width = 208
                        Height = 13
                        Caption = 'Observa'#231#245'es do corpo da Nota Fiscal:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label74: TLabel
                        Left = 13
                        Top = 122
                        Width = 281
                        Height = 13
                        Caption = 'Observa'#231#245'es para dados adicionais da Nota Fiscal:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object DBMemo6: TDBMemo
                        Left = 6
                        Top = 28
                        Width = 762
                        Height = 88
                        DataField = 'INF_CORPO_V'
                        DataSource = DtmVeiculosCCIA.dsComFat
                        ScrollBars = ssVertical
                        TabOrder = 0
                      end
                      object DBMemo7: TDBMemo
                        Left = 6
                        Top = 135
                        Width = 762
                        Height = 88
                        DataField = 'OBS_V'
                        DataSource = DtmVeiculosCCIA.dsComFat
                        ScrollBars = ssVertical
                        TabOrder = 1
                      end
                    end
                    object GroupBox22: TGroupBox
                      Left = 2
                      Top = 415
                      Width = 768
                      Height = 38
                      Align = alTop
                      Caption = 'Totais'
                      TabOrder = 3
                      object Label58: TLabel
                        Left = 19
                        Top = 17
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
                        DataField = 'VALTOT_V'
                        DataSource = DtmVeiculosCCIA.dsComFat
                        Enabled = False
                        TabOrder = 0
                      end
                    end
                    object Panel30: TPanel
                      Left = 2
                      Top = 15
                      Width = 768
                      Height = 154
                      Align = alTop
                      BevelOuter = bvNone
                      TabOrder = 0
                      object Label40: TLabel
                        Left = 44
                        Top = 16
                        Width = 58
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Cond. Pag:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label42: TLabel
                        Left = 394
                        Top = 16
                        Width = 82
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Nat. Opera'#231#227'o:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label44: TLabel
                        Left = 258
                        Top = 64
                        Width = 27
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'CST: '
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label45: TLabel
                        Left = 440
                        Top = 64
                        Width = 36
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Frete: '
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label46: TLabel
                        Left = 401
                        Top = 40
                        Width = 75
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Outras Desp: '
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label47: TLabel
                        Left = 598
                        Top = 40
                        Width = 59
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Desconto: '
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label48: TLabel
                        Left = 200
                        Top = 88
                        Width = 85
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Redu'#231#227'o Base: '
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label49: TLabel
                        Left = 20
                        Top = 88
                        Width = 85
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Aliquota ICMS: '
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label50: TLabel
                        Left = 394
                        Top = 88
                        Width = 82
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Base de ICMS: '
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label51: TLabel
                        Left = 573
                        Top = 88
                        Width = 84
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Valor de ICMS: '
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label53: TLabel
                        Left = 37
                        Top = 110
                        Width = 68
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Tipo Venda: '
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label54: TLabel
                        Left = 394
                        Top = 110
                        Width = 82
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Restri'#231#227'o NFE: '
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label79: TLabel
                        Left = 11
                        Top = 64
                        Width = 94
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Pre'#231'o de tabela: '
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label18: TLabel
                        Left = 611
                        Top = 64
                        Width = 46
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Seguro: '
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label52: TLabel
                        Left = 229
                        Top = 110
                        Width = 55
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Data E/S: '
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label104: TLabel
                        Left = 13
                        Top = 40
                        Width = 89
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Descri'#231#227'o CFOP:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label137: TLabel
                        Left = 214
                        Top = 134
                        Width = 70
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'N'#186' do Grupo:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                        Visible = False
                      end
                      object Label138: TLabel
                        Left = 23
                        Top = 134
                        Width = 81
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Qtde Parcelas:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                        Visible = False
                      end
                      object Label139: TLabel
                        Left = 440
                        Top = 134
                        Width = 36
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Pedra:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                        Visible = False
                      end
                      object DBEdit24: TDBEdit
                        Left = 107
                        Top = 13
                        Width = 40
                        Height = 21
                        CharCase = ecUpperCase
                        DataField = 'CONDPAG_V'
                        DataSource = DtmVeiculosCCIA.dsComFat
                        TabOrder = 0
                        OnKeyDown = DBEdit24KeyDown
                      end
                      object DBLookupComboBox7: TDBLookupComboBox
                        Left = 148
                        Top = 13
                        Width = 220
                        Height = 21
                        DataField = 'CONDPAG_V'
                        DataSource = DtmVeiculosCCIA.dsComFat
                        KeyField = 'COD_COND_PAG'
                        ListField = 'DESC_COND_PAG'
                        ListSource = DtmVeiculosCCIA.dsCondPagComFat
                        TabOrder = 1
                      end
                      object DBLookupComboBox8: TDBLookupComboBox
                        Left = 519
                        Top = 13
                        Width = 220
                        Height = 21
                        DataField = 'NATOP_V'
                        DataSource = DtmVeiculosCCIA.dsComFat
                        KeyField = 'CODIGO_NOP'
                        ListField = 'DESCRICAO_NOP'
                        ListSource = DtmVeiculosCCIA.dsCFOPComFat
                        TabOrder = 3
                      end
                      object DBEdit26: TDBEdit
                        Left = 478
                        Top = 13
                        Width = 40
                        Height = 21
                        CharCase = ecUpperCase
                        DataField = 'NATOP_V'
                        DataSource = DtmVeiculosCCIA.dsComFat
                        TabOrder = 2
                      end
                      object DBEdit28: TDBEdit
                        Left = 107
                        Top = 61
                        Width = 80
                        Height = 21
                        CharCase = ecUpperCase
                        DataField = 'PRVEN_V'
                        DataSource = DtmVeiculosCCIA.dsComFat
                        Enabled = False
                        TabOrder = 7
                      end
                      object DBEdit29: TDBEdit
                        Left = 288
                        Top = 61
                        Width = 80
                        Height = 21
                        CharCase = ecUpperCase
                        DataField = 'CST_V'
                        DataSource = DtmVeiculosCCIA.dsComFat
                        TabOrder = 8
                      end
                      object DBEdit30: TDBEdit
                        Left = 478
                        Top = 61
                        Width = 80
                        Height = 21
                        CharCase = ecUpperCase
                        DataField = 'FRETE_V'
                        DataSource = DtmVeiculosCCIA.dsComFat
                        Enabled = False
                        TabOrder = 9
                      end
                      object DBEdit31: TDBEdit
                        Left = 478
                        Top = 37
                        Width = 80
                        Height = 21
                        CharCase = ecUpperCase
                        DataField = 'OUTDESP_V'
                        DataSource = DtmVeiculosCCIA.dsComFat
                        TabOrder = 5
                      end
                      object DBEdit32: TDBEdit
                        Left = 659
                        Top = 37
                        Width = 80
                        Height = 21
                        CharCase = ecUpperCase
                        DataField = 'DESCONTO_V'
                        DataSource = DtmVeiculosCCIA.dsComFat
                        TabOrder = 6
                      end
                      object DBEdit33: TDBEdit
                        Left = 288
                        Top = 84
                        Width = 80
                        Height = 21
                        CharCase = ecUpperCase
                        DataField = 'PERC_RED_V'
                        DataSource = DtmVeiculosCCIA.dsComFat
                        TabOrder = 12
                        OnExit = DBEdit33Exit
                      end
                      object DBEdit34: TDBEdit
                        Left = 107
                        Top = 84
                        Width = 80
                        Height = 21
                        CharCase = ecUpperCase
                        DataField = 'ALICM_V'
                        DataSource = DtmVeiculosCCIA.dsComFat
                        TabOrder = 11
                        OnExit = DBEdit34Exit
                      end
                      object DBEdit35: TDBEdit
                        Left = 478
                        Top = 83
                        Width = 80
                        Height = 21
                        CharCase = ecUpperCase
                        DataField = 'BASE_ICM_V'
                        DataSource = DtmVeiculosCCIA.dsComFat
                        Enabled = False
                        TabOrder = 13
                        OnExit = DBEdit34Exit
                      end
                      object DBEdit36: TDBEdit
                        Left = 659
                        Top = 84
                        Width = 80
                        Height = 21
                        CharCase = ecUpperCase
                        DataField = 'ICMS_V'
                        DataSource = DtmVeiculosCCIA.dsComFat
                        Enabled = False
                        TabOrder = 14
                        OnExit = DBEdit34Exit
                      end
                      object DBEdit10: TDBEdit
                        Left = 659
                        Top = 61
                        Width = 80
                        Height = 21
                        CharCase = ecUpperCase
                        DataField = 'SEGURO_V'
                        DataSource = DtmVeiculosCCIA.dsComFat
                        TabOrder = 10
                      end
                      object DBEdit55: TDBEdit
                        Left = 288
                        Top = 107
                        Width = 80
                        Height = 21
                        CharCase = ecUpperCase
                        DataField = 'DT_ENT_SAID'
                        DataSource = DtmVeiculosCCIA.dsComFat
                        Enabled = False
                        TabOrder = 16
                      end
                      object DBEdit53: TDBEdit
                        Left = 107
                        Top = 37
                        Width = 261
                        Height = 21
                        CharCase = ecUpperCase
                        DataField = 'DESC_NATOP'
                        DataSource = DtmVeiculosCCIA.dsComFat
                        TabOrder = 4
                        OnKeyDown = DBEdit53KeyDown
                      end
                      object DBComboBox1: TDBComboBox
                        Left = 107
                        Top = 107
                        Width = 80
                        Height = 21
                        CharCase = ecUpperCase
                        DataField = 'TIPO_V'
                        DataSource = DtmVeiculosCCIA.dsComFat
                        ItemHeight = 0
                        Items.Strings = (
                          '')
                        TabOrder = 15
                        OnExit = DBComboBox1Exit
                      end
                      object DBComboBox2: TDBComboBox
                        Left = 478
                        Top = 107
                        Width = 261
                        Height = 21
                        CharCase = ecUpperCase
                        DataField = 'TPREST'
                        DataSource = DtmVeiculosCCIA.dsComFat
                        ItemHeight = 0
                        Items.Strings = (
                          '0 - N'#195'O H'#193
                          '1 - ALIENA'#199#195'O FIDUCI'#193'RIA'
                          '2 - ARRENDAMENTO MERCANTIL'
                          '3 - RESERVA DE DOM'#205'NIO'
                          '4 - PENHOR DE VE'#205'CULOS'
                          '9 - OUTRAS')
                        TabOrder = 17
                      end
                      object DBEdit77: TDBEdit
                        Left = 288
                        Top = 130
                        Width = 80
                        Height = 21
                        CharCase = ecUpperCase
                        DataField = 'GRUPO_C_V'
                        DataSource = DtmVeiculosCCIA.dsComFat
                        TabOrder = 19
                        Visible = False
                      end
                      object DBEdit78: TDBEdit
                        Left = 107
                        Top = 129
                        Width = 80
                        Height = 21
                        CharCase = ecUpperCase
                        DataField = 'QTDE_PARC'
                        DataSource = DtmVeiculosCCIA.dsComFat
                        TabOrder = 18
                        Visible = False
                      end
                      object DBEdit79: TDBEdit
                        Left = 478
                        Top = 130
                        Width = 80
                        Height = 21
                        CharCase = ecUpperCase
                        DataField = 'PEDRA_C_V'
                        DataSource = DtmVeiculosCCIA.dsComFat
                        TabOrder = 20
                        Visible = False
                      end
                    end
                    object GroupBox10: TGroupBox
                      Left = 2
                      Top = 396
                      Width = 768
                      Height = 19
                      Align = alTop
                      Caption = 'Dados do Transporte'
                      TabOrder = 2
                      Visible = False
                      object Label12: TLabel
                        Left = 9
                        Top = 25
                        Width = 62
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Placa Veic: '
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label13: TLabel
                        Left = 233
                        Top = 26
                        Width = 54
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'US Placa: '
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label28: TLabel
                        Left = 430
                        Top = 25
                        Width = 88
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Frete P/ Conta: '
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label30: TLabel
                        Left = 609
                        Top = 22
                        Width = 71
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Quantidade: '
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label33: TLabel
                        Left = 23
                        Top = 52
                        Width = 45
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Especie:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label59: TLabel
                        Left = 248
                        Top = 52
                        Width = 38
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Marca:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label60: TLabel
                        Left = 490
                        Top = 52
                        Width = 28
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Num:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label61: TLabel
                        Left = 4
                        Top = 79
                        Width = 64
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Peso Bruto:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label62: TLabel
                        Left = 214
                        Top = 77
                        Width = 73
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Peso L'#237'quido:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object DBEdit9: TDBEdit
                        Left = 71
                        Top = 22
                        Width = 140
                        Height = 21
                        CharCase = ecUpperCase
                        DataField = 'PLACA_V_TR'
                        DataSource = DtmVeiculosCCIA.dsComFat
                        TabOrder = 0
                      end
                      object DBEdit11: TDBEdit
                        Left = 288
                        Top = 22
                        Width = 140
                        Height = 21
                        CharCase = ecUpperCase
                        DataField = 'UF_PLACA_TR'
                        DataSource = DtmVeiculosCCIA.dsComFat
                        TabOrder = 1
                      end
                      object DBEdit20: TDBEdit
                        Left = 519
                        Top = 22
                        Width = 72
                        Height = 21
                        CharCase = ecUpperCase
                        DataField = 'FRC_VND'
                        DataSource = DtmVeiculosCCIA.dsComFat
                        TabOrder = 2
                      end
                      object DBEdit27: TDBEdit
                        Left = 682
                        Top = 19
                        Width = 72
                        Height = 21
                        CharCase = ecUpperCase
                        DataField = 'V_QUANT_VND'
                        DataSource = DtmVeiculosCCIA.dsComFat
                        TabOrder = 3
                      end
                      object DBEdit38: TDBEdit
                        Left = 71
                        Top = 49
                        Width = 140
                        Height = 21
                        CharCase = ecUpperCase
                        DataField = 'ESPECIE_VND'
                        DataSource = DtmVeiculosCCIA.dsComFat
                        TabOrder = 4
                      end
                      object DBEdit43: TDBEdit
                        Left = 288
                        Top = 49
                        Width = 140
                        Height = 21
                        CharCase = ecUpperCase
                        DataField = 'MARCA_VND'
                        DataSource = DtmVeiculosCCIA.dsComFat
                        TabOrder = 5
                      end
                      object DBEdit44: TDBEdit
                        Left = 519
                        Top = 49
                        Width = 72
                        Height = 21
                        CharCase = ecUpperCase
                        DataField = 'NUMERO_VND'
                        DataSource = DtmVeiculosCCIA.dsComFat
                        TabOrder = 6
                      end
                      object DBEdit45: TDBEdit
                        Left = 71
                        Top = 76
                        Width = 72
                        Height = 21
                        CharCase = ecUpperCase
                        DataField = 'PESO_B_VND'
                        DataSource = DtmVeiculosCCIA.dsComFat
                        TabOrder = 7
                      end
                      object DBEdit46: TDBEdit
                        Left = 288
                        Top = 76
                        Width = 72
                        Height = 21
                        CharCase = ecUpperCase
                        DataField = 'PESO_L_VND'
                        DataSource = DtmVeiculosCCIA.dsComFat
                        TabOrder = 8
                      end
                    end
                  end
                end
              end
              object TabSheet_Pesquisa: TTabSheet
                Caption = 'Pesquisa'
                ImageIndex = 4
                ExplicitLeft = 0
                ExplicitTop = 0
                ExplicitWidth = 0
                ExplicitHeight = 0
                object GroupBox24: TGroupBox
                  Left = 3
                  Top = -2
                  Width = 489
                  Height = 171
                  Caption = 'Pesquisa'
                  TabOrder = 0
                  object BitBtn21: TBitBtn
                    Left = 201
                    Top = 141
                    Width = 75
                    Height = 25
                    Caption = '&OK'
                    TabOrder = 0
                    OnClick = BitBtn4Click
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
                object GroupBox30: TGroupBox
                  Left = 6
                  Top = 10
                  Width = 483
                  Height = 127
                  TabOrder = 1
                  object Label75: TLabel
                    Left = 34
                    Top = 19
                    Width = 97
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Primeiro ve'#237'culo: '
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object Label76: TLabel
                    Left = 41
                    Top = 100
                    Width = 90
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Aceita Contato: '
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object Label77: TLabel
                    Left = 15
                    Top = 46
                    Width = 117
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Marca Veic Anterior: '
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object Label78: TLabel
                    Left = 8
                    Top = 73
                    Width = 123
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Modelo Veic Anterior: '
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object DBLookupComboBox11: TDBLookupComboBox
                    Left = 134
                    Top = 17
                    Width = 320
                    Height = 21
                    DataField = 'COD_CLIENTE'
                    KeyField = 'COD_CLIENTE'
                    ListField = 'NOME_CLIENTE'
                    TabOrder = 0
                  end
                  object DBLookupComboBox12: TDBLookupComboBox
                    Left = 134
                    Top = 98
                    Width = 321
                    Height = 21
                    DataField = 'COD_CLIENTE'
                    KeyField = 'COD_CLIENTE'
                    ListField = 'NOME_CLIENTE'
                    TabOrder = 1
                  end
                  object DBLookupComboBox13: TDBLookupComboBox
                    Left = 134
                    Top = 44
                    Width = 268
                    Height = 21
                    DataField = 'COD_CLIENTE'
                    KeyField = 'COD_CLIENTE'
                    ListField = 'NOME_CLIENTE'
                    TabOrder = 2
                  end
                  object BitBtn18: TBitBtn
                    Left = 408
                    Top = 44
                    Width = 20
                    Height = 20
                    TabOrder = 3
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
                    Left = 434
                    Top = 44
                    Width = 20
                    Height = 20
                    TabOrder = 4
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
                  object DBEdit49: TDBEdit
                    Left = 134
                    Top = 71
                    Width = 320
                    Height = 21
                    CharCase = ecUpperCase
                    TabOrder = 5
                  end
                end
              end
            end
            inherited Panel3: TPanel
              Top = 509
              Width = 784
              ExplicitTop = 509
              ExplicitWidth = 784
              inherited LabelSeq: TLabel
                Left = 29
                Top = 20
                Visible = False
                ExplicitLeft = 29
                ExplicitTop = 20
              end
              inherited BitBtn4: TBitBtn
                Hint = 'OK - [VEI056]'
                TabOrder = 2
              end
              inherited BitBtn5: TBitBtn
                TabOrder = 3
              end
              inherited BitBtn6: TBitBtn
                Left = 697
                Hint = 'Sair'
                TabOrder = 4
                ExplicitLeft = 697
              end
              inherited CheckCadSeq: TCheckBox
                Left = 6
                Top = 19
                TabOrder = 5
                Visible = False
                ExplicitLeft = 6
                ExplicitTop = 19
              end
              object btStatusNFe: TBitBtn
                Left = 4
                Top = 13
                Width = 99
                Height = 25
                Hint = 'Visualizar NF-e'
                Caption = 'Visualizar NF-e'
                ParentShowHint = False
                ShowHint = True
                TabOrder = 0
                Visible = False
                OnClick = btStatusNFeClick
                Glyph.Data = {
                  36050000424D3605000000000000360400002800000010000000100000000100
                  08000000000000010000320B0000320B00000001000000010000EFA54A00C684
                  6B00BD8C7300CE947300EFB57300FFC67300BD847B00C6947B00CE9C7B008484
                  8400B5848400B58C8400CE9C840084FF8400B5948C00C6A59400F7CE9400C6A5
                  9C00F7CE9C00F7D69C00C6ADA500CEADA500F7D6A500C6BDAD00F7D6AD00DEBD
                  B500DEC6B500E7C6B500EFC6B500EFCEB500F7DEB500FFDEB500EFCEBD00F7DE
                  BD00F7E7C600E7CECE00E7D6CE00E7D6D600F7E7D600FFEFD600FFEFDE00FFF7
                  E700FFF7EF00FFF7F700FFFFF700FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF002D2D0A0A0A0A
                  0A0A0A0A0A0A0A0A0A2D2D2D112722211E181612101010130A2D2D2D11270909
                  09090909090909120A2D2D2D14290D0D0D0D0D0D0D0D0D120A2D2D2D14290D0D
                  0D0D0D0D0D0D0D100A2D2D2D142C090909090909090909120A2D2D2D1A2E0D0D
                  0D0D0D0D0D0D0D0D0A2D2D2D1A2E0D0D0D0D0D0D0D0D0D0D0A2D2D2D1A2E0909
                  090909090909091E0A2D2D2D192E0D0D0D0D0D0D0D0D0D1E0A2D2D2D1A2E0D0D
                  0D0D0D0D0D0D0D170A2D2D2D1B2E09090909092A260F0E0B0A2D2D2D1B2E0D0D
                  0D0D0D0D23020400012D2D2D202E0D0D0D0D0D0D240705032D2D2D2D1B2B2A2A
                  2A2A2A2A23070C2D2D2D2D2D1B1D1D1D1D1B1B1D19062D2D2D2D}
              end
              object btAlterarChassi: TBitBtn
                Left = 106
                Top = 13
                Width = 99
                Height = 25
                Hint = 'Alterar Chassi - [VEI111]'
                Caption = 'Alterar Chassi'
                TabOrder = 1
                OnClick = btAlterarChassiClick
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
          ExplicitWidth = 784
          ExplicitHeight = 557
          inherited GroupBox3: TGroupBox
            Width = 784
            Height = 289
            ExplicitWidth = 784
            ExplicitHeight = 289
            inherited imgInformation: TImage
              Left = 758
              Height = 272
              ExplicitLeft = 758
              ExplicitHeight = 176
            end
            object imgInformationTipoOP: TImage [6]
              Left = 734
              Top = 15
              Width = 24
              Height = 272
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
              Left = 509
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
              Left = 416
              Hint = 'Clique para pesquisar - [VEI034]'
              ExplicitLeft = 416
            end
            inherited BitBtn2: TBitBtn
              Left = 665
              TabOrder = 10
              ExplicitLeft = 665
            end
            inherited BitBtn3: TBitBtn
              Left = 543
              Width = 55
              Height = 49
              Hint = 'Entrada'
              Caption = 'Ent&rada'
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
              Layout = blGlyphTop
              ExplicitLeft = 543
              ExplicitWidth = 55
              ExplicitHeight = 49
            end
            inherited CheckBox3: TCheckBox
              Left = 256
              ExplicitLeft = 256
            end
            inherited CheckBox1: TCheckBox
              TabOrder = 11
            end
            object groupAvancadas: TGroupBox
              Left = 4
              Top = 71
              Width = 495
              Height = 215
              Caption = 'Op'#231#245'es Avan'#231'adas'
              TabOrder = 12
              Visible = False
              object RadioGroup2: TRadioGroup
                Left = 2
                Top = 13
                Width = 92
                Height = 200
                Caption = 'Status'
                ItemIndex = 0
                Items.Strings = (
                  'Todos'
                  'Abertos'
                  'Fechados'
                  'Cancelados')
                TabOrder = 0
              end
              object GroupBox4: TGroupBox
                Left = 95
                Top = 12
                Width = 198
                Height = 200
                Caption = 'Entrada'
                TabOrder = 1
                object ckCtrCompra: TCheckBox
                  Left = 9
                  Top = 15
                  Width = 145
                  Height = 17
                  Caption = 'Contrato Compra'
                  TabOrder = 0
                end
                object ckCtrEntCons: TCheckBox
                  Left = 9
                  Top = 34
                  Width = 185
                  Height = 19
                  Caption = 'Contrato Entrada em Consigna'#231#227'o'
                  TabOrder = 1
                end
              end
              object GroupBox28: TGroupBox
                Left = 294
                Top = 12
                Width = 199
                Height = 200
                Caption = 'Sa'#237'da'
                TabOrder = 2
                object ckCFTVnd: TCheckBox
                  Left = 8
                  Top = 17
                  Width = 188
                  Height = 17
                  Caption = 'Comando de Faturamento (Venda)'
                  TabOrder = 0
                end
                object ckCtrVnd: TCheckBox
                  Left = 8
                  Top = 35
                  Width = 113
                  Height = 17
                  Caption = 'Contrato de Venda'
                  TabOrder = 1
                end
                object ckCtrResDom: TCheckBox
                  Left = 8
                  Top = 71
                  Width = 169
                  Height = 17
                  Caption = 'Contrato Reserva de Dom'#237'nio'
                  TabOrder = 2
                end
                object ckCtrVndCons: TCheckBox
                  Left = 8
                  Top = 53
                  Width = 169
                  Height = 17
                  Caption = 'Contrato Venda Consignado'
                  TabOrder = 3
                end
                object ckCtrInterm: TCheckBox
                  Left = 8
                  Top = 90
                  Width = 169
                  Height = 17
                  Caption = 'Contrato Intermedia'#231#227'o'
                  TabOrder = 4
                end
                object ckCFTTransf: TCheckBox
                  Left = 8
                  Top = 107
                  Width = 188
                  Height = 17
                  Caption = 'Transfer'#234'ncia'
                  TabOrder = 5
                end
                object ckCFTDemonst: TCheckBox
                  Left = 8
                  Top = 124
                  Width = 188
                  Height = 17
                  Caption = 'Demonstra'#231#227'o'
                  TabOrder = 6
                end
                object ckCFTDevolucao: TCheckBox
                  Left = 8
                  Top = 160
                  Width = 188
                  Height = 17
                  Caption = 'Devolu'#231#227'o'
                  TabOrder = 7
                end
                object ckCFTOutrasSaidas: TCheckBox
                  Left = 8
                  Top = 179
                  Width = 188
                  Height = 17
                  Caption = 'Outras Sa'#237'das'
                  TabOrder = 8
                end
                object ckCFTAtivo: TCheckBox
                  Left = 8
                  Top = 142
                  Width = 188
                  Height = 17
                  Caption = 'Ativo Imobilizado'
                  TabOrder = 9
                end
              end
            end
            object groupAdicional: TGroupBox
              Left = 499
              Top = 71
              Width = 277
              Height = 121
              Caption = 'Pesquisa Adicional'
              TabOrder = 13
              Visible = False
              OnExit = groupAdicionalExit
              object Label8: TLabel
                Left = 7
                Top = 54
                Width = 51
                Height = 13
                Caption = 'Conte'#250'do:'
              end
              object Label14: TLabel
                Left = 21
                Top = 28
                Width = 37
                Height = 13
                Caption = 'Campo:'
              end
              object Label19: TLabel
                Left = 157
                Top = 54
                Width = 16
                Height = 13
                Caption = 'at'#233
              end
              object Label21: TLabel
                Left = 10
                Top = 78
                Width = 48
                Height = 13
                Caption = 'Condi'#231#227'o:'
              end
              object ComboBox11: TComboBox
                Left = 64
                Top = 20
                Width = 203
                Height = 21
                Hint = 'Campo filtro da pesquisa adicional. Informe o campo desejado'
                ItemHeight = 13
                TabOrder = 0
                Text = 'ComboBox11'
                OnEnter = ComboBox1Enter
                OnExit = ComboBox11Exit
              end
              object MaskEdit7: TMaskEdit
                Left = 64
                Top = 46
                Width = 203
                Height = 21
                CharCase = ecUpperCase
                TabOrder = 1
              end
              object MaskEdit8: TMaskEdit
                Left = 193
                Top = 46
                Width = 74
                Height = 21
                EditMask = '!99/99/0000;1;_'
                MaxLength = 10
                TabOrder = 3
                Text = '  /  /    '
                Visible = False
              end
              object MaskEdit9: TMaskEdit
                Left = 64
                Top = 46
                Width = 72
                Height = 21
                EditMask = '!99/99/0000;1;_'
                MaxLength = 10
                TabOrder = 2
                Text = '  /  /    '
                Visible = False
              end
              object ComboBox12: TComboBox
                Left = 64
                Top = 72
                Width = 133
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
            object BitBtn11: TBitBtn
              Left = 604
              Top = 13
              Width = 55
              Height = 49
              Hint = 'Sa'#237'da'
              Caption = 'S&a'#237'da'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 9
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
              Layout = blGlyphTop
            end
            object ckEntrada: TCheckBox
              Left = 448
              Top = 41
              Width = 89
              Height = 15
              Caption = 'Entrada [F11]'
              TabOrder = 14
            end
            object ckSaida: TCheckBox
              Left = 448
              Top = 58
              Width = 89
              Height = 14
              Caption = 'Sa'#237'da [F12]'
              TabOrder = 15
            end
            object Panel28: TPanel
              Left = 668
              Top = 42
              Width = 68
              Height = 13
              BevelOuter = bvNone
              Caption = 'Aberto'
              Color = clMenuHighlight
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clCream
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentBackground = False
              ParentFont = False
              TabOrder = 16
            end
            object Panel12: TPanel
              Left = 668
              Top = 58
              Width = 68
              Height = 13
              BevelOuter = bvNone
              Caption = 'Cancelado'
              Color = 42218
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clCream
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentBackground = False
              ParentFont = False
              TabOrder = 17
            end
          end
          inherited Panel1: TPanel
            Top = 289
            Width = 784
            Height = 268
            ExplicitTop = 289
            ExplicitWidth = 784
            ExplicitHeight = 268
            inherited Splitter1: TSplitter
              Height = 207
              ExplicitHeight = 475
            end
            inherited DBGrid1: TDBGrid
              Width = 491
              Height = 207
              OnDrawColumnCell = DBGrid1DrawColumnCell
              OnKeyDown = DBGrid1KeyDown
            end
            inherited Panel2: TPanel
              Width = 780
              ExplicitWidth = 780
              inherited SpeedButton25: TSpeedButton [0]
                Left = 635
                Top = 21
                Visible = False
                ExplicitLeft = 635
                ExplicitTop = 21
              end
              inherited SpeedButton1: TSpeedButton [1]
                Top = 3
                Hint = 
                  'Editar Registro - [VEI042/VEI043/VEI044/VEI045/VEI046/VEI047/VEI' +
                  '048]'
                ExplicitTop = 3
              end
              inherited SpeedButton2: TSpeedButton [2]
                Top = 3
                Hint = 
                  'Cancelar Documento - [VEI049/VEI050/VEI051/VEI052/VEI053/VEI054/' +
                  'VEI055/VEI071]'
                Glyph.Data = {
                  06040000424D0604000000000000C60100002800000018000000180000000100
                  08000000000040020000120B0000120B0000640000006400000000000000FFFF
                  FF00FF00FF001543EB001846EB001947EB001947E8000A36EB000C37EB000E38
                  EB000E3AEB000E36E000113EEB00133EEB001340EB00143FE6001842E2000028
                  EB000128EB000129EB00012AEB00022BEB00022CEB00032AE700042CEB000428
                  DC000831EB000A32EB00092FE0000023EB000024EB000025EB000026EB000020
                  D9000121D7000220CC00031FC8000623C9000A28C900001CEB00001DEB00001E
                  EB00001FEB000020EB000021EB000020E700001BDB00001AD900001AD6000017
                  EB000018EB000019EB00001AEB00001BEB000019DE000019DB000019D9000016
                  D7000016D6000018CD000015CC000015C9000014C8000011EB000012EB000013
                  EB000016EB000014D9000011D7000014D7000013D6000014D600000FEB00000E
                  DF00000ED6000006EB000007EB000008EB000009EB00000AEB00000BEB000006
                  E8000008E8000008D7000009CC000008CA000007C9000008C8000004E3000004
                  E2000004E0000002DA000001D9000001D7000002D7000002D6000000CC000000
                  C9000000C80000006E0002020202020202020202020202020202020202020202
                  0202020202020202020202020202020202020202020202020202020202020202
                  0202020202020202020202020202020202020202020202636302020202020202
                  0202026363020202020202020202633255630202020202020202635B58630202
                  0202020202632933325663020202020202635D4D4D5163020202020202634329
                  3333576302020202635F4D4B4D60630202020202020263452A34335463020263
                  5A4E4D4D626302020202020202020263472B35354A6363594C4B4E6163020202
                  020202020202020263392C282749524D4B4D5C63020202020202020202020202
                  02633A2C334048504F5E6302020202020202020202020202020263363442413F
                  536302020202020202020202020202020202632D2A3532314463020202020202
                  0202020202020202026317121D2C2B2A2C466302020202020202020202020202
                  63191A18162F38202C2C45630202020202020202020202631C081B0722636330
                  111D1D4763020202020202020202630B0C090A23630202633C131E1E39630202
                  0202020202630F030D0E246302020202633E151E1F3763020202020202630605
                  042563020202020202633D16142E630202020202020263102663020202020202
                  0202633B21630202020202020202026363020202020202020202026363020202
                  0202020202020202020202020202020202020202020202020202020202020202
                  0202020202020202020202020202020202020202020202020202020202020202
                  02020202020202020202}
                OnClick = SpeedButton2Click
                ExplicitTop = 3
              end
              inherited SpeedButton3: TSpeedButton [3]
                Top = 3
                Hint = 
                  'Imprimir Documento - [VEI072/VEI073/VEI074/VEI075/VEI076/VEI077/' +
                  'VEI078]'
                OnClick = SpeedButton3Click
                ExplicitTop = 3
              end
              inherited SpeedButton4: TSpeedButton [4]
                Left = 635
                Top = 35
                Visible = False
                ExplicitLeft = 635
                ExplicitTop = 35
              end
              inherited SpeedButton5: TSpeedButton [5]
                Left = 521
                Visible = False
                ExplicitLeft = 521
              end
              inherited SpeedButton6: TSpeedButton [6]
                Left = 578
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
                Visible = False
                OnClick = SpeedButton6Click
                ExplicitLeft = 578
              end
              inherited SpeedButton7: TSpeedButton [7]
                Left = 692
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
                Visible = False
                OnClick = SpeedButton7Click
                ExplicitLeft = 692
              end
              inherited SpeedButton8: TSpeedButton [8]
                Left = 634
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
                Visible = False
                ExplicitLeft = 634
              end
              inherited SpeedButton11: TSpeedButton [9]
                Left = 350
                Top = 3
                Hint = 'Detalhes da Forma de Pagamento - [VEI079]'
                Glyph.Data = {
                  02050000424D0205000000000000C20200002800000018000000180000000100
                  08000000000040020000120B0000120B0000A3000000A3000000BCBADC00BDB2
                  D000BCACC200FF00FF00BBA6B500B0909900FFFEFE008B5B58008E5D5900905E
                  590093655E00AA807A009E6C630095665E00B5918B009A6A600098685F009F67
                  5A00A06F6400A5726500AB796B00C9A19600F6EFED00AC786700A9766600B17B
                  6900E5D0C900FAF2EF00BA7E6500BA826C00B5806A00BD866D00CA9F8C00D5B1
                  A100EDE0DA00F0E5E000CC917300CA8F7200C58C6F00C1896E00E2C5B600CF8B
                  6400C9876400CE8E6900D1906B00D1967400CF957400DCA78A00CF8E6800D093
                  6F00D4987500E0B69C00EFD4C400F3E2D800F8F0EB00E3BFA700E9CEBB00FFFC
                  FA00FFFBF800FEEEE100FFF3E900FCD0A700FED9B800FEDDC000FFE3C900FEE2
                  C900FEE5CE00FEE6D100FEEAD800FFF4EA00FFF6EE00FFC28400FFC58A00FFC6
                  8C00FFC78E00FFCA9500FFCC9800FFD1A300FFD5AA00FFDDBA00FFDEBC00FCDC
                  BD00FBDCBD00FFEBD700F8E5D300FEEBD900FEF0E200FFF2E500FEF4EA00FEF8
                  F200FFFBF700FFC58600FFC48700FFC58900FFC68B00FFC98C00FFC99100FFCA
                  9100FFCB9300FFCC9700FFCF9C00FFCF9D00FFD09E00FFD09F00FFD1A000FFD3
                  A300FFD4A600FFD4A700FFD7AA00FFD8AD00FFD8AF00FFD9B000FFDAB200FFDC
                  B700FFE0BF00FFE1C000FFE2C400FFE3C400FFE3C500FCE1C500FFE5C900FFE7
                  CC00FFE7CE00FFEBD500FFEDDA00FFEFDD00FFEFDE00FA962100FFCF9800FFD1
                  9C00FFD8AA00FFEAD000FFEED900FFF2E200FFF8F000FEF7EF00FFFAF400FAC6
                  8000F8CB9000FFE2BB00FFF2E100FFE0B500FFE7C400FFF6E900FFEFD500FFFA
                  F200FFF3DE00FFFEFC00FFF7E000FFF7D800FFFEED00FFFFDE00FFFFE300FFFF
                  F000FFFFF400FFFFF700FFFFFA00FFFFFB00FFFFFE0000008200BDBDE500FFFF
                  FF00000000000303030303030311110303030303030303030303030303030303
                  03030303111182111111030303030303030303030303030303030303118E118E
                  8E821109030303030303030303030303030303070A1111111111111111111111
                  1111111111030303030303080A8E8B8D82688061484747474747474711030303
                  030303070D8E52053D3D6881805F5B5B5B5B5B5B110303030303100B1095519F
                  3E8D11111111111111111147110303030303100E0F9477043F8B6967644C4B60
                  4A5E5D5C11030303030310200C94429F418E1111111111111111114911030303
                  03141A2012994402439071706E6C6B4D666463621103030303141A20139D3B9F
                  5590111111111111111111651103030303141522189E3C0156927A7875735071
                  706D4E6A110303031C9E201617A1879F58961111111111111111116F11030303
                  1C9E209E19A15A00599A857E7C5383794074724F110303031C2320A11EA1939F
                  3A9C111111111111111111761103032A352821A11DA1A1A006A188864645578C
                  7D847B971103032B362F38A11FA1A19FA1A11111111111111111119711032B33
                  A12F35A127A1A1A0A1A1A1A1A1A19B969A99989711032B34A12F1BA126A1A1A1
                  A1A1A1A139918F8F9797979711032C29342FA1A125A1A1A1A1A1A1A1A139919B
                  11111111110303033137A1A124A1A1A1A1A1A1A1A1A19DA1118989897F030303
                  293038542EA1A1A1A1A1A1A1A1A1A1A111898A7F03030303030330542DA1A1A1
                  A1A1A1A1A1A1A1A111897F030303030303030329323030303030303030303030
                  117F03030303}
                OnClick = SpeedButton11Click
                ExplicitLeft = 350
                ExplicitTop = 3
              end
              inherited SpeedButton12: TSpeedButton [10]
                Left = 749
                Hint = 'Reabrir Documento'
                Glyph.Data = {
                  F6060000424DF606000000000000360000002800000018000000180000000100
                  180000000000C0060000C40E0000C40E00000000000000000000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFADAAAA5A55555A55555D585864
                  5F5F6B6666736E6E7A7575817C7C837E7E7E79797772726F6A6A686363615C5C
                  5B56565A5555838080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB7B5B55A55
                  555A55555C5757625D5D6863636F6A6A7570707974747A7575787373726D6D6C
                  67676560605F5A5A5A55555A5555ADAAAAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFF5F5F5ADAAAAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB7B4B4F5F5F5FFFFFFFFFFFFFF
                  FFFFAFAFAF8989899999999C9C9C838080F4F4F4F6F6F6EEEEEEEEEEEEEEEEEE
                  EEEEEEEEEEEEF0F0F0F3F3F3F6F6F6F9F9F9FBFBFBFCFCFCF4F4F48380809C9C
                  9C999999898989AFAFAF8C8C8CB7B7B7C2C2C2C4C4C4A7A6A6A8A5A5FDFDFDFA
                  FAFAFAFAFAFAFAFAFAFAFAFAFAFAFBFBFBFCFCFCFCFCFCFDFDFDFEFEFEFEFEFE
                  B3B0B0A7A6A6C4C4C4C2C2C2B7B7B78C8C8C7E7E7EB2B2B2B5B5B5B5B5B58380
                  805048489F9B9B9F9B9B9F9B9B9F9B9B9F9B9BA09B9BA09B9BA09B9B9F9B9B9F
                  9B9B9F9B9B9F9B9B5B5454838080B5B5B5B5B5B5B2B2B27E7E7E727272A3A3A3
                  A4A4A4A4A4A4645D5D3226263226263226263226263226263226263226263226
                  26322626322626322626322626322626322626645D5DA4A4A4A4A4A4A3A3A373
                  7373747474ACACACACACACACACAC4133331D0B0B1D0B0B1D0B0B1D0B0B1D0B0B
                  1D0B0B1D0B0B1D0B0B1D0B0B1D0B0B1D0B0B1D0B0B1D0B0B1D0B0B413333ACAC
                  ACACACACACACAC747474818181CCCCCCCDCDCDCDCDCD8A8080867C7C867C7C86
                  7C7C867C7C867C7C867C7C867C7C867C7C867C7C867C7C867C7C867C7C867C7C
                  867C7C8A8080CDCDCDCDCDCDCCCCCC818181888888ECECECEEEEEEE8E7E7968C
                  8C968C8C968C8C968C8C968C8C968C8C968C8C968C8C968C8C968C8C968C8C96
                  8C8C968C8C968C8C968C8C968C8CE8E7E7EEEEEEECECEC8888887B7B7BEEEEEE
                  F4F4F4E4E2E2B6ACACB6ACACB6ACACB6ACACB6ACACB6ACACB6ACACB6ACACB6AC
                  ACB6ACACB6ACACB6ACACB6ACACB6ACACB6ACACB6ACACE4E2E2F4F4F4EFEFEF7B
                  7B7B939393CFCFCFE6E6E6DDD9D9CEC4C4CEC4C4CEC4C4CEC4C4CEC4C4CEC4C4
                  CEC4C4CEC4C4CEC4C4CEC4C4CEC4C4CEC4C4CEC4C4CEC4C4CEC4C4CEC4C4DDD9
                  D9E5E5E5CFCFCF939393D6D6D67C7C7C9F9F9FA09C9CB9AFAFB9AFAFB9AFAFB9
                  AFAFB9AFAFB9AFAFB9AFAFB9AFAFB9AFAFB9AFAFB9AFAFB9AFAFB9AFAFB9AFAF
                  B9AFAFB9AFAFA09C9C9F9F9F7C7C7CD7D7D7FFFFFFFFFFFFFFFFFFFFFFFF5B56
                  56CCCCCCFBFBFBF2F2F2F4F4F4F5F5F5F6F6F6F8F8F8F9F9F9FAFAFAFBFBFBFB
                  FBFBFBFBFBFEFEFECCCCCC5B5656FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFF635E5ECCCCCCFBFBFBF2F2F2F4F4F4F5F5F5F6F6F6F8F8F8F9F9
                  F9FAFAFAFBFBFBFBFBFBFBFBFBFEFEFECCCCCC635E5EFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFF6C6767CCCCCCFBFBFBF2F2F2F3F3F3F5F5F5
                  F6F6F6F7F7F7F8F8F8F9F9F9FAFAFAFBFBFBFBFBFBFEFEFECCCCCC6C6767FFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF746F6FCCCCCCFBFBFBF2
                  F2F2F3F3F3F4F4F4F5F5F5F6F6F6F8F8F8F9F9F9F9F9F9FAFAFAFAFAFAFEFEFE
                  CCCCCC746F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7C77
                  77CCCCCCFBFBFBF1F1F1F2F2F2F3F3F3F5F5F5F6F6F6F7F7F7F8F8F8F8F8F8F9
                  F9F9F9F9F9FDFDFDCCCCCC7C7777FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFF847F7FCCCCCCFBFBFBF0F0F0F2F2F2F3F3F3F4F4F4F5F5F5F6F6
                  F6F7F7F7F7F7F7F8F8F8F8F8F8FDFDFDCCCCCC847F7FFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCCCCCCFEFEFEFBFBFBFBFBFBFBFBFB
                  FCFCFCFCFCFCFCFCFCFCFCFCFDFDFDFDFDFDFDFDFDFEFEFECCCCCCFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBFCCCCCCCC
                  CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
                  BFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
                Visible = False
                ExplicitLeft = 749
              end
              inherited SpeedButton23: TSpeedButton [11]
                Left = 407
                Top = 3
                Hint = 'Editar dados de Ve'#237'culos Anteriores - [VEI082]'
                Glyph.Data = {
                  360C0000424D360C000000000000360000002800000020000000200000000100
                  180000000000000C0000C30E0000C30E00000000000000000000FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCBA6
                  82D3C4B4FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFAD6E2FAF7338FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFB98A5AAD6E2FAD6E2FAD6E2FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFAD6E2FAD6E2FCCB39BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFAD6E2FCBB197FF00FFAD6E2FAD6E2FFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFAD6E2FAD6E2FAD6E2FAD6E2FFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFAD6E2FAD6E2FAD6E2FAD6E2FAD6E2FFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFCFB49BB7804BB77F4ACDB196FF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFAD6E2FAD6E2FAD6E2FAD6E2FAD6E2FFF00FFFF
                  00FFBA8755CDB298FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  CFB49BAB6B2BAB6B2BAB6B2BAB6B2BCBAF93FF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFAD6E2FAD6E2FAD6E2FAD6E2FAD6E2FFF
                  00FFFF00FFAE7337CCB196FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  B6804BAB6B2BFFFFFFFFFFFFAB6B2BB2783FFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFAD6E2FAD6E2FAD6E2FAD6E2FAD
                  6E2FFF00FFFF00FFB78450FF00FFFF00FFFF00FFFF00FFFF00FFAE6E30FFFFFF
                  BB8653AB6B2BFFFFFFFFFFFFAB6B2BB67E47FEFEFEAE6D2DFF00FFB4793EB479
                  3EB4793EB4793EB4793EB4793EB57B41D3C1AFFF00FFAD6E2FAD6E2FAD6E2FAD
                  6E2FAD6E2FFF00FFFF00FFFCFCFCAD6C2CB4793EFF00FFFF00FFAF7134E4CFBB
                  DFC8B1AB6B2BAB6B2BAB6B2BAC6B2CDBC0A6E8D7C7AF7133FF00FFB3783EB378
                  3EB3783EB3783EB3783EB3783EB3783EB47A41D1BEABFF00FFAD6E2FAD6E2FAD
                  6E2FAD6E2FAD6E2FFF00FFFF00FFB2773FB3783EFF00FFFF00FFB2773CB3773E
                  FFFFFFDFC6AFB8814BB7804ADCC2A8FFFFFFB57C44B2763CFF00FFB3783EB378
                  3EB3783EB3783EB3783EB3783EB3783EB3783EB3783FD3C2B1FF00FFAD6E2FAD
                  6E2FAD6E2FAD6E2FAD6E2FFF00FFFF00FFB67F49FF00FFFF00FFB3783EB1753A
                  B2783FE6D4C2FFFFFFFFFFFFE9D8C8B57C44B1753AB3783EFF00FFB3783EB378
                  3EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB2773DD3C2B0FF00FFAD
                  6E2FAD6E2FAD6E2FAD6E2FAD6E2FFF00FFFF00FFFF00FFFF00FFB3783EB3783E
                  B2763CAF7134AD6E2FAD6D2FAF7033B2763CB3783EB3783EFF00FFB3783EB378
                  3EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783FD1BEABFF
                  00FFAD6E2FAD6E2FAD6E2FAD6E2FAD6E2FFF00FFFF00FFFF00FFB3783EB3783E
                  B3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EFF00FFB3783EB378
                  3EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB47A41D2
                  C0AFFF00FFAD6E2FAD6E2FAD6E2FAD6E2FB5804AFF00FFFF00FFB3783EAD6E30
                  AC6D2EAC6D2EAC6D2EAC6D2EAC6D2EAC6D2EAC6D2EB3783EFF00FFB3783EB378
                  3EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB4
                  7A41D2C0AFFF00FFAD6E2FAD6E2FB78553FF00FFAD6E2FFF00FFAD6E30FDFCFB
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAC6D2EFF00FFB3783EB378
                  3EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3
                  783EB47A41D2C0AFFF00FFB98958FF00FFAD6E2FAD6E2FAD6F31B98A5BD8BA9E
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAC6C2EFF00FFB3783EB378
                  3EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3
                  783EB3783EB47A41D1BDAAFF00FFAD6E2FAD6E2FAD6E2FAD6E2FFF00FFB07338
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAC6C2EFF00FFB3783EB378
                  3EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3
                  783EB3783EB3783EB3783ED2C0ADFF00FFB27539AD6E2FFF00FFFF00FFB57F4A
                  DBC1A6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAC6C2EFF00FFB3783EB378
                  3EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3
                  783EB3783EB3783EB3783EB47A41CFB8A2FF00FFFF00FFFF00FFFF00FFD4C1AF
                  B1773CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAC6C2EFF00FFB3783EB378
                  3EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3
                  783EB3783EB3783EB3783EB3783EB3783EB37940FF00FFFF00FFFF00FFFF00FF
                  B6814CAC6D2EAC6C2DAC6C2DAC6C2DAC6C2DAC6C2EB3783EFF00FFB3783EB378
                  3EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3
                  783EB3783EB3783EB3783EB3783EB3783EB3783EFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB3783EB378
                  3EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3
                  783EB3783EB3783EB3783EB3783EB3783EB3783EFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB3783EB378
                  3EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3
                  783EB3783EB3783EB3783EB3783EB3783EB3783EFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB3783EB378
                  3EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3
                  783EB3783EB3783EB3783EB3783EB3783EB3783EFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB3783EB378
                  3EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3
                  783EB3783EB3783EB3783EB3783EB3783EB3783EFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB3783EB378
                  3EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3
                  783EB3783EB3783EB3783EB3783EB3783EB3783EFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC5A27FB378
                  3EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3
                  783EB3783EB3783EB3783EB3783EB3783EC8A98AFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                OnClick = SpeedButton23Click
                ExplicitLeft = 407
                ExplicitTop = 3
              end
              inherited SpeedButton24: TSpeedButton [12]
                Left = 292
                Top = 3
                Hint = 'Ver Dados Nota Fiscal de Ve'#237'culo'
                Glyph.Data = {
                  F6060000424DF606000000000000360000002800000018000000180000000100
                  180000000000C0060000C30E0000C30E00000000000000000000FF00FFFF00FF
                  6060602D2D2D2626262626262626262626262626262626262626262626262626
                  262626262626262626262626262626262626262D2D2D5B5B5BFF00FFFF00FFFF
                  00FFFF00FFFF00FF2C2C2CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2D2D
                  2DFF00FFFF00FFFF00FFFF00FFFF00FF262626FFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFF262626FF00FFFF00FFFF00FFFF00FFFF00FF262626FFFFFFFFFF
                  FFC99167C99167C99167C99167C99167C99167C99167C99167C99167C99167C9
                  9167C99167C99167FFFFFFFFFFFF262626FF00FFFF00FFFF00FFFF00FFFF00FF
                  262626FFFFFFFFFFFFC99167FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFC99167FFFFFFFFFFFFFFFFFFC99167FFFFFFFFFFFF262626FF00FFFF00FFFF
                  00FFFF00FFFF00FF262626FFFFFFFFFFFFC99167FFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFC99167FFFFFFFFFFFFFFFFFFC99167FFFFFFFFFFFF2626
                  26FF00FFFF00FFFF00FFFF00FFFF00FF262626FFFFFFFFFFFFC99167C99167C9
                  9167C99167C99167C99167C99167C99167C99167C99167C99167C99167C99167
                  FFFFFFFFFFFF262626FF00FFFF00FFFF00FFFF00FFFF00FF262626FFFFFFFFFF
                  FFC99167FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC99167FFFFFFFF
                  FFFFFFFFFFC99167FFFFFFFFFFFF262626FF00FFFF00FFFF00FFFF00FFFF00FF
                  262626FFFFFFFFFFFFC99167FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFC99167FFFFFFFFFFFFFFFFFFC99167FFFFFFFFFFFF262626FF00FFFF00FFFF
                  00FFFF00FFFF00FF262626FFFFFFFFFFFFC99167C99167C99167C99167C99167
                  C99167C99167C99167C99167C99167C99167C99167C99167FFFFFFFFFFFF2626
                  26FF00FFFF00FFFF00FFFF00FFFF00FF262626FFFFFFFFFFFFC99167FFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC99167FFFFFFFFFFFFFFFFFFC99167
                  FFFFFFFFFFFF262626FF00FFFF00FFFF00FFFF00FFFF00FF262626FFFFFFFFFF
                  FFC99167FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC99167FFFFFFFF
                  FFFFFFFFFFC99167FFFFFFFFFFFF262626FF00FFFF00FFFF00FFFF00FFFF00FF
                  262626FFFFFFFFFFFFC99167C99167C99167C99167C99167C99167C99167C991
                  67C99167C99167C99167C99167C99167FFFFFFFFFFFF262626FF00FFFF00FFFF
                  00FFFF00FFFF00FF262626FFFFFFFFFFFFC99167C99167C99167C99167C99167
                  C99167C99167C99167C99167C99167C99167C99167C99167FFFFFFFFFFFF2626
                  26FF00FFFF00FFFF00FFFF00FFFF00FF262626FFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFF262626FF00FFFF00FFFF00FFFF00FFFF00FF262626FFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFF2D2D2DFF00FFFF00FFFF00FFFF00FFFF00FF
                  262626FFFFFFFFFFFFA4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4
                  A4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2D2D2DFF00FFFF00FFFF
                  00FFFF00FFFF00FF262626FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2626262626262626262626262626262D2D
                  2DFF00FFFF00FFFF00FFFF00FFFF00FF262626FFFFFFFFFFFF818181FFFFFF67
                  67674E4E4E8B8B8B9191919F9F9FFFFFFFFFFFFFFFFFFF262626FFFFFFFFFFFF
                  FFFFFFC1C1C1434343FF00FFFF00FFFF00FFFF00FFFF00FF262626FFFFFFFFFF
                  FFD2D2D2D0D0D0D0D0D0808080B0B0B07A7A7A969696FFFFFFFFFFFFFFFFFF26
                  2626FFFFFFFFFFFFC2C2C2434343FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  262626FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFF262626FFFFFFC8C8C8434343FF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FF2D2D2DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2D2D2DC5C5C5434343FF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FF6060602D2D2D26262626262626262626
                  26262626262626262626262626262626262626262626262D2D2D4A4A4AFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                OnClick = SpeedButton24Click
                ExplicitLeft = 292
                ExplicitTop = 3
              end
              inherited SpeedButton26: TSpeedButton
                Left = 464
                Top = 3
                Hint = 'Confirmar Retorno Ve'#237'culo em Demonstra'#231#227'o - [VEI095]'
                Glyph.Data = {
                  360C0000424D360C000000000000360000002800000020000000200000000100
                  180000000000000C0000C30E0000C30E00000000000000000000FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFB3783EB3783EB3783EB3783EB3783EFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFB3783EB3783EB3783EB3783EB3783EFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFB3783EB3783EB3783EB3783EB3783EFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFB3783EB3783EB3783EB3783EB3783EFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  B3783EB3783EB3783EB3783EB3783EFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB3783E
                  B3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB378
                  3EB3783EB3783EB3783EB3783EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB3783EB3783E
                  B3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB378
                  3EB3783EB3783EB3783EB3783EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFCEB298B7804AB7804ACDB298FF00FFFF00FFFF00FFFF00FFB3783EB3783E
                  B3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB378
                  3EB3783EB3783EB3783EB3783EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCD
                  B297AB6B2BAB6B2BAB6B2BAB6B2BCCB196FF00FFFF00FFFF00FFFF00FFB3783E
                  B3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB378
                  3EB3783EB3783EB3783EB3783EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB4
                  7C45AB6B2BFFFFFFFFFFFFAB6B2BB47C45FF00FFFF00FFFF00FFFF00FFFF00FF
                  B3783EB3783EB3783EB3783EB3783EFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFB4793EB4793EB4793EAE6D2DFFFFFFB8
                  824DAB6B2BFFFFFFFFFFFFAB6B2BB8824DFFFFFFAD6C2CB4793EFF00FFFF00FF
                  FF00FFB3783EB3783EB3783EB3783EB3783EFF00FFDCC6B2E8D7C7AF7133FF00
                  FFB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EAF7033E9D9C7DD
                  C3AAAB6B2BAB6B2BAB6B2BAB6B2BDDC3AAE9D9C9AF7033B3783EFF00FFFF00FF
                  BB8D5EFF00FFB3783EB3783EB3783EB3783EB3783EFF00FFBE9064B2763CFF00
                  FFB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB2763CB57C45FF
                  FFFFDDC3AAB7814BB7814BDDC4ABFFFFFFB57D45B2763CB3783EFF00FFFF00FF
                  B3783EBA8B5CFF00FFB3783EB3783EB3783EB3783EB3783EFF00FFBC8D5FFF00
                  FFB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB1753AB5
                  7D44EADBCCFFFFFFFFFFFFEADBCCB57D44B1753AB3783EB3783EFF00FFFF00FF
                  B3783EB3783EBB8C5EFF00FFB3783EB3783EB3783EB3783EB3783EFF00FFFF00
                  FFB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB2
                  763CAE7033AD6D2FAD6D2FAE7033B2763CB3783EB3783EB3783EFF00FFFF00FF
                  B3783EB3783EB3783EBC8D5FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3
                  783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EFF00FFFF00FF
                  B3783EAD6E30AC6D2EAC6D2EAC6D2EAC6D2EAC6D2EAC6D2EAC6D2EB3783EFF00
                  FFB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3
                  783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EFF00FFFF00FF
                  AD6E30FDFCFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAC6D2EFF00
                  FFB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3
                  783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EFF00FFFF00FF
                  B98A5BD8BA9EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAC6C2EFF00
                  FFB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3
                  783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EFF00FFFF00FF
                  FF00FFB07338FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAC6C2EFF00
                  FFB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3
                  783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EFF00FFFF00FF
                  FF00FFB57F4ADBC1A6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAC6C2EFF00
                  FFB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3
                  783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EFF00FFFF00FF
                  FF00FFD4C1AFB1773CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAC6C2EFF00
                  FFB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3
                  783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EFF00FFFF00FF
                  FF00FFFF00FFB6814CAC6D2EAC6C2DAC6C2DAC6C2DAC6C2DAC6C2EB3783EFF00
                  FFB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3
                  783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3
                  783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3
                  783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3
                  783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3
                  783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3
                  783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFC5A27FB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3
                  783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EC8A98AFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                OnClick = SpeedButton26Click
                ExplicitLeft = 464
                ExplicitTop = 3
              end
              object SpeedButton9: TSpeedButton
                Left = 234
                Top = 3
                Width = 51
                Height = 45
                Hint = 'Reabrir Documento - [VEI104/VEI112]'
                Flat = True
                Glyph.Data = {
                  F6060000424DF606000000000000360000002800000018000000180000000100
                  180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
                  FF00FFFF00FF4D4D4DFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
                  FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE4D4D4DFF
                  00FFFF00FFFF00FFFF00FFFF00FF4D4D4DFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
                  FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
                  FEFEFEFE4D4D4DFF00FFFF00FFFF00FFFF00FFFF00FF4D4D4DFEFEFEFEFEFEFE
                  FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
                  FEFEFEFEFEFEFEFEFEFEFEFE4D4D4DFF00FFFF00FFFF00FFFF00FFFF00FF4D4D
                  4DFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
                  FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE4D4D4DFF00FFFF00FFFF00FF
                  FF00FFFF00FF4D4D4DFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
                  FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE4D4D4DFF
                  00FFFF00FFFF00FFFF00FFFF00FF4D4D4DFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
                  FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
                  FEFEFEFE4D4D4DFF00FFFF00FFFF00FFFF00FFFF00FF4D4D4DFEFEFEFEFEFEFE
                  FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
                  FEFEFEFEFEFEFEFEFEFEFEFE4D4D4DFF00FFFF00FFFF00FFFF00FFFF00FF4D4D
                  4DFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
                  FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE4D4D4DFF00FFFF00FFFF00FF
                  FF00FFFF00FF4D4D4DFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
                  FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE4D4D4DFF
                  00FFFF00FFFF00FF88AC55FF00FF4D4D4DFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
                  FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
                  FEFEFEFE4D4D4DFF00FFFF00FFFF00FF88AC5588AC55FF00FF4D4D4D4D4D4D4D
                  4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D
                  4D4D4D4D4D4D4D4D4D4D4D4DB8B8B8FF00FF88AC5588AC5588AC5588AC5588AC
                  55FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF88AC5588AC55
                  88AC5588AC5588AC5588AC55FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FF88AC5588AC5588AC5588AC5588AC55FF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FF88AC5588AC55FF00FF4D4D4D4D4D4D4D
                  4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D
                  4D4D4D4D4D4D4D4D4D4D4D4DB8B8B8FF00FFFF00FFFF00FF88AC55FF00FF4D4D
                  4DFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
                  FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE4D4D4DFF00FFFF00FFFF00FF
                  FF00FFFF00FF4D4D4DFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
                  FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE4D4D4DFF
                  00FFFF00FFFF00FFFF00FFFF00FF4D4D4DFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
                  FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
                  FEFEFEFE4D4D4DFF00FFFF00FFFF00FFFF00FFFF00FF4D4D4DFEFEFEFEFEFEFE
                  FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
                  FEFEFEFEFEFEFEFEFEFEFEFE4D4D4DFF00FFFF00FFFF00FFFF00FFFF00FF4D4D
                  4DFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
                  FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE4D4D4DFF00FFFF00FFFF00FF
                  FF00FFFF00FF4D4D4DFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
                  FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE4D4D4DFF
                  00FFFF00FFFF00FFFF00FFFF00FF4D4D4DFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
                  FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
                  FEFEFEFE4D4D4DFF00FFFF00FFFF00FFFF00FFFF00FF4D4D4DFEFEFEFEFEFEFE
                  FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
                  FEFEFEFEFEFEFEFEFEFEFEFE4D4D4DFF00FFFF00FFFF00FFFF00FFFF00FF4D4D
                  4DFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
                  FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE4D4D4DFF00FF}
                ParentShowHint = False
                ShowHint = True
                OnClick = SpeedButton9Click
              end
              object SpeedButton10: TSpeedButton
                Left = 178
                Top = 3
                Width = 51
                Height = 45
                Hint = 'Confirmar Documento - [VEI056]'
                Flat = True
                Glyph.Data = {
                  76060000424D7606000000000000360400002800000018000000180000000100
                  08000000000040020000320B0000320B00000001000000010000EFA53900EFA5
                  5200FFB55200E7AD6B00F7BD6B00AD7B7300AD847300B5847300AD7B7B00AD73
                  84009C7B8400A57B8400AD7B8400B57B8400B5848400BD848400E7B58400BD84
                  8C00C68C8C00CE948C00DEA58C00EFC68C00D69C9400DEA59400B5AD9400EFCE
                  9400B5AD9C00EFCE9C00CEADA500BDB5A500DEC6A500EFCEA500F7D6A500CEBD
                  AD00F7D6AD00F7D6B500F7DEB500DEC6BD00E7CEBD00EFD6BD00F7D6BD00F7DE
                  BD00E7CEC600EFCEC600EFDEC600F7DEC600F7E7C600C6BDCE00DEC6CE00E7D6
                  CE00E7DECE00F7DECE00F7E7CE00ADADD600CEC6D600DECED600E7D6D600EFDE
                  D600F7DED600F7E7D600949CDE009CA5DE00ADA5DE00BDB5DE00C6C6DE00CEC6
                  DE00CECEDE00D6CEDE00F7E7DE00F7EFDE007384E7008C94E7009CA5E700D6CE
                  E700F7EFE700FFF7E700526BEF006B7BEF007B8CEF008C9CEF00F7EFEF00FFF7
                  EF00425AF7005273F700637BF700FFF7F700FFFFF700FF00FF002942FF00294A
                  FF002952FF00315AFF00395AFF004263FF00426BFF004A6BFF006B84FF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00575757080E0E
                  0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E5757575757092C2E29242322201B1B19
                  191919191919190E5757575757092C2E2D292322221F1B1B191919191919190E
                  57575757570933342D2D292322221F1B1B1919191919190E575757575709343B
                  342D29293747301F1B1B19191919190E5757575757093B453B342D354C593C22
                  1F1B1B191919190E57575757570C44453B41605A595A5C30221F1B1B1919190E
                  57575757570D4A4A2F52585C3D4D5A4622221F1B1B19190E57575757570E4A51
                  425F544134435C5B3F22221F1B1B190E57575757570F50514A4A453B3434475A
                  532722221F1B190E5757575757115556514A4A453B34345D5A3D2322221F1B0E
                  575757575712556155514A4A453B343E5A5F302322221F0E5757575757125561
                  6155514A4A453B345459462923221F0E5757575757125561616155514A4A453B
                  40524E392923220E575757575713556161616155514A4A453B36342D29291E0B
                  57575757571355616161616155514A4A453B34342721180A5757575757165561
                  616161616155514A45454532211D1A0A57575757571655616161616161615551
                  4B3907060505050557575757571755616161616161615655512A07100301000E
                  57575757571755616161616161616161562A071504020E575757575757175561
                  616161616161616161310715040E575757575757571761616161616161616161
                  613807150E5757575757575757142627272B262626262525251C070E57575757
                  5757575757575757575757575757575757575757575757575757}
                ParentShowHint = False
                ShowHint = True
                OnClick = SpeedButton10Click
              end
            end
            inherited GroupBox2: TGroupBox
              Height = 207
              ExplicitHeight = 207
              inherited ScrollBox2: TScrollBox
                Height = 190
                ExplicitHeight = 190
              end
            end
          end
        end
        inherited tsMemo: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 784
          ExplicitHeight = 557
        end
        object tsCondicoes: TTabSheet
          Caption = 'tsCondicoes'
          ImageIndex = 4
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object pnCondPag: TPanel
            Left = 0
            Top = 0
            Width = 784
            Height = 270
            Align = alTop
            BevelKind = bkTile
            BevelOuter = bvNone
            TabOrder = 0
            object Panel8: TPanel
              Left = 0
              Top = 0
              Width = 780
              Height = 266
              Align = alClient
              TabOrder = 0
              object Panel6: TPanel
                Left = 1
                Top = 34
                Width = 778
                Height = 231
                Align = alClient
                TabOrder = 1
                object Panel19: TPanel
                  Left = 1
                  Top = 1
                  Width = 296
                  Height = 175
                  Align = alLeft
                  TabOrder = 0
                  object Label35: TLabel
                    Left = 9
                    Top = 8
                    Width = 45
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Controle:'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = []
                    ParentFont = False
                  end
                  object Label41: TLabel
                    Left = 9
                    Top = 32
                    Width = 45
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Hist'#243'rico:'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = []
                    ParentFont = False
                  end
                  object Label55: TLabel
                    Left = 26
                    Top = 80
                    Width = 28
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Valor:'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = []
                    ParentFont = False
                  end
                  object Label56: TLabel
                    Left = 9
                    Top = 130
                    Width = 70
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Valor Atingido:'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = []
                    ParentFont = False
                  end
                  object Label57: TLabel
                    Left = 245
                    Top = 127
                    Width = 40
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Restam:'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = []
                    ParentFont = False
                  end
                  object Label143: TLabel
                    Left = 19
                    Top = 56
                    Width = 35
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Chassi:'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = []
                    ParentFont = False
                  end
                  object ComboBox4: TComboBox
                    Left = 60
                    Top = 5
                    Width = 227
                    Height = 21
                    Style = csDropDownList
                    CharCase = ecUpperCase
                    ItemHeight = 0
                    TabOrder = 0
                    OnExit = ComboBox4Exit
                  end
                  object BitBtn16: TBitBtn
                    Left = 60
                    Top = 102
                    Width = 147
                    Height = 27
                    Caption = '&Adcionar'
                    TabOrder = 4
                    OnClick = BitBtn16Click
                    Glyph.Data = {
                      36030000424D3603000000000000360000002800000010000000100000000100
                      18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
                      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                      FFFF00FFFF00FFFF00FFFF00FFFF00FF046209035F09035606014F04014C0401
                      4C04014C04014C04014C04014C04014C04013D03FF00FFFF00FFFF00FF078216
                      0C9C23099A1D07961505920F03900B038F0A038F0A03900A03900A038F0A0396
                      0B027407013D03FF00FFFF00FF0D982513B53A0FAF2D0CAC2309AB1C06A71504
                      A50E03A50C03A50C03A50C03A40C03AC0D03960A014C04FF00FFFF00FF10A02D
                      1CB44916AD3911A92F0DA7260AA41E07A016059F10039E0C039D0B039C0B03A4
                      0C03900A014D04FF00FFFF00FF11A12F28B85B1FB24CFEFEFE12AA350EA72A0B
                      A522FEFEFE05A013039F0D039D0B03A50C03900A014C04FF00FFFF00FF11A12F
                      3EC2702DBA5FFEFEFEFEFEFE13AB360FA92DFEFEFEFEFEFE06A016049E0F03A4
                      0C03900A014C04FF00FFFF00FF11A12F5CCC8838BD6724B757FEFEFEFEFEFE14
                      AC3A11AB31FEFEFEFEFEFE08A11905A71203910B014D04FF00FFFF00FF11A12F
                      70D49742C2702AB85B21B553FEFEFEFEFEFE15AD3E11AB35FEFEFEFEFEFE09A9
                      1C059311025405FF00FFFF00FF11A12F7DD79F4AC5762FBB5FFEFEFEFEFEFE1C
                      B24E1AB14AFEFEFEFEFEFE0FA92D0DAC2709991B035F09FF00FFFF00FF11A12F
                      86DAA654C97FFEFEFEFEFEFE28B85923B555FEFEFEFEFEFE18B04515AD3B12AF
                      350D9E25056B0CFF00FFFF00FF11A12F93DEB166CF8CFEFEFE3FC16D34BD642C
                      BA5DFEFEFE23B5551DB25019B04817B14210A12F06760FFF00FFFF00FF11A130
                      99E1B590DDAD78D59A6CD0915DCB864CC6783FC16D2CBA5D20B5531DB2511CB5
                      4F15A93D088414FF00FFFF00FF11A12F79D79F99E1B69DE2B893DEB183DAA56D
                      D3954FC97E35BF6824B75920B5551FB85818AD43098E16FF00FFFF00FFFF00FF
                      22A94037B55539B55637B55433B2502AAF4921AA401AA63913A43112A13212A4
                      310C9A23FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                  end
                  object EditHw5: TEditHw
                    Left = 60
                    Top = 77
                    Width = 129
                    Height = 21
                    CharCase = ecUpperCase
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                    TabOrder = 3
                    Text = '      0,00'
                    Formato = fNumber
                    FormatSize = '10.2'
                  end
                  object EditHw6: TEditHw
                    Left = 9
                    Top = 146
                    Width = 129
                    Height = 21
                    CharCase = ecUpperCase
                    Enabled = False
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                    TabOrder = 5
                    Text = '      0,00'
                    Formato = fNumber
                    FormatSize = '10.2'
                  end
                  object EditHw7: TEditHw
                    Left = 157
                    Top = 146
                    Width = 129
                    Height = 21
                    CharCase = ecUpperCase
                    Enabled = False
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                    TabOrder = 6
                    Text = '      0,00'
                    Formato = fNumber
                    FormatSize = '10.2'
                  end
                  object Edit2: TEdit
                    Left = 60
                    Top = 29
                    Width = 227
                    Height = 21
                    CharCase = ecUpperCase
                    MaxLength = 50
                    TabOrder = 1
                    Text = 'EDIT2'
                  end
                  object Edit3: TEdit
                    Left = 60
                    Top = 53
                    Width = 227
                    Height = 21
                    CharCase = ecUpperCase
                    TabOrder = 2
                    Text = 'EDIT3'
                    OnKeyDown = Edit3KeyDown
                  end
                end
                object Panel20: TPanel
                  Left = 297
                  Top = 1
                  Width = 480
                  Height = 175
                  Align = alClient
                  TabOrder = 1
                  object Panel21: TPanel
                    Left = 1
                    Top = 1
                    Width = 478
                    Height = 131
                    Align = alTop
                    TabOrder = 0
                    object DBGrid3: TDBGrid
                      Left = 1
                      Top = 1
                      Width = 476
                      Height = 129
                      Align = alClient
                      DataSource = DtmVeiculosCCIA.dsPlanoTempComFat
                      Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                      ReadOnly = True
                      TabOrder = 0
                      TitleFont.Charset = DEFAULT_CHARSET
                      TitleFont.Color = clWindowText
                      TitleFont.Height = -11
                      TitleFont.Name = 'Tahoma'
                      TitleFont.Style = []
                      OnKeyDown = DBGrid3KeyDown
                    end
                  end
                  object Panel22: TPanel
                    Left = 1
                    Top = 137
                    Width = 478
                    Height = 37
                    Align = alBottom
                    BevelOuter = bvNone
                    TabOrder = 1
                    object BitBtn17: TBitBtn
                      Left = 316
                      Top = 7
                      Width = 147
                      Height = 25
                      Caption = '&Apagar'
                      TabOrder = 0
                      OnClick = BitBtn17Click
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
                object Panel7: TPanel
                  Left = 1
                  Top = 176
                  Width = 776
                  Height = 54
                  Align = alBottom
                  TabOrder = 2
                  object Label31: TLabel
                    Left = 26
                    Top = 30
                    Width = 92
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Valor a Receber:'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object Label32: TLabel
                    Left = 348
                    Top = 30
                    Width = 112
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Valor da Nota Fiscal:'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object Label67: TLabel
                    Left = 543
                    Top = 8
                    Width = 168
                    Height = 13
                    Caption = 'Valor da NF entre 1000 e 2000'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clRed
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object BitBtn15: TBitBtn
                    Left = 613
                    Top = 24
                    Width = 147
                    Height = 27
                    Caption = '&Confirmar'
                    TabOrder = 2
                    OnClick = BitBtn15Click
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
                  object EditHw3: TEditHw
                    Left = 124
                    Top = 27
                    Width = 129
                    Height = 21
                    CharCase = ecUpperCase
                    Enabled = False
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                    TabOrder = 0
                    Text = '      0,00'
                    Formato = fNumber
                    FormatSize = '10.2'
                  end
                  object EditHw4: TEditHw
                    Left = 466
                    Top = 27
                    Width = 129
                    Height = 21
                    CharCase = ecUpperCase
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                    TabOrder = 1
                    Text = '      0,00'
                    OnExit = EditHw4Exit
                    Formato = fNumber
                    FormatSize = '10.2'
                  end
                end
              end
              object Panel10: TPanel
                Left = 1
                Top = 1
                Width = 778
                Height = 33
                Align = alTop
                TabOrder = 0
                object Label24: TLabel
                  Left = 56
                  Top = 8
                  Width = 106
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Valor da Opera'#231#227'o:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label29: TLabel
                  Left = 435
                  Top = 8
                  Width = 125
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Valor Real do Produto:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object EditHw1: TEditHw
                  Left = 180
                  Top = 6
                  Width = 129
                  Height = 21
                  CharCase = ecUpperCase
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 0
                  Text = '      0,00'
                  Formato = fNumber
                  FormatSize = '10.2'
                end
                object EditHw2: TEditHw
                  Left = 572
                  Top = 5
                  Width = 129
                  Height = 21
                  CharCase = ecUpperCase
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 1
                  Text = '      0,00'
                  Formato = fNumber
                  FormatSize = '10.2'
                end
              end
            end
          end
        end
        object tsPesquisaVeic: TTabSheet
          Caption = 'tsPesquisaVeic'
          ImageIndex = 5
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object pnPesquisaVeic: TPanel
            Left = 0
            Top = 0
            Width = 784
            Height = 361
            Align = alTop
            TabOrder = 0
            object Panel14: TPanel
              Left = 1
              Top = 1
              Width = 782
              Height = 128
              Align = alTop
              TabOrder = 0
              object Label589: TLabel
                Left = 352
                Top = 32
                Width = 37
                Height = 13
                Caption = 'Num NF'
              end
              object Label590: TLabel
                Left = 414
                Top = 32
                Width = 136
                Height = 13
                Caption = 'Data Ent/Saida Inicial e Final'
              end
              object Label127: TLabel
                Left = 9
                Top = 32
                Width = 31
                Height = 13
                Caption = 'Chassi'
              end
              object Label128: TLabel
                Left = 188
                Top = 32
                Width = 36
                Height = 13
                Caption = 'Esp'#233'cie'
              end
              object Label129: TLabel
                Left = 9
                Top = 77
                Width = 29
                Height = 13
                Caption = 'Marca'
              end
              object Label131: TLabel
                Left = 187
                Top = 77
                Width = 34
                Height = 13
                Caption = 'Modelo'
              end
              object Label132: TLabel
                Left = 353
                Top = 76
                Width = 17
                Height = 13
                Caption = 'Cor'
              end
              object Label103: TLabel
                Left = 135
                Top = 32
                Width = 25
                Height = 13
                Caption = 'Placa'
              end
              object BitBtn22: TBitBtn
                Left = 625
                Top = 59
                Width = 75
                Height = 25
                Hint = 'Assume'
                Caption = '&Assume'
                TabOrder = 11
                OnClick = BitBtn22Click
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
              object BitBtn23: TBitBtn
                Left = 625
                Top = 28
                Width = 75
                Height = 25
                Hint = 'Clique para pesquisar - [VEI034]'
                Caption = '&Procurar'
                ParentShowHint = False
                ShowHint = True
                TabOrder = 9
                OnClick = BitBtn23Click
                Glyph.Data = {
                  36050000424D3605000000000000360400002800000010000000100000000100
                  08000000000000010000320B0000320B000000010000000100005A6B7300AD7B
                  73004A637B00EFBD8400B58C8C00A5948C00C6948C00B59C8C00BD9C8C00F7BD
                  8C00BD949400C6949400CE949400C69C9400CEAD9400F7CE9400C6A59C00CEA5
                  9C00D6A59C00C6AD9C00CEAD9C00D6AD9C00F7CE9C00F7D69C004A7BA500CEAD
                  A500D6B5A500DEBDA500F7D6A500DEBDAD00DEC6AD00E7C6AD00FFDEAD00FFE7
                  AD00CEB5B500F7DEB500F7E7B500FFE7B500FFEFB500D6BDBD00DED6BD00E7DE
                  BD00FFE7BD006B9CC600EFDEC600FFEFC600FFF7C600F7E7CE00FFF7CE00F7EF
                  D600F7F7D600FFF7D600FFFFD6002184DE00F7F7DE00FFFFDE001884E700188C
                  E700FFFFE700188CEF00218CEF00B5D6EF00F7F7EF00FFF7EF00FFFFEF00FFFF
                  F700FF00FF004AB5FF0052B5FF0052BDFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0042020A424242
                  424242424242424242422B39180B42424242424242424242424243443C180B42
                  4242424242424242424242444438180B42424242424242424242424244433918
                  0A424242424242424242424242444335004201101A114242424242424242453D
                  05072F343434291942424242424242221A2D34343437403E0442424242424206
                  231C303437404146284242424242421B210F30373A414140310D42424242421F
                  20032434373A3A37321342424242421D25030F2D37373737311042424242420D
                  2D2D1C162430333429424242424242421E463F0F0316252E0842424242424242
                  4227312D21252314424242424242424242420E141B1B42424242}
              end
              object BitBtn34: TBitBtn
                Left = 706
                Top = 28
                Width = 75
                Height = 25
                Hint = 'Cancelar'
                Caption = '&Cancela'
                TabOrder = 10
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
              object BitBtn35: TBitBtn
                Left = 706
                Top = 59
                Width = 75
                Height = 25
                Hint = 'Demonstra'#231#227'o'
                Caption = '&Demonst.'
                TabOrder = 12
                OnClick = BitBtn35Click
                Glyph.Data = {
                  36030000424D3603000000000000360000002800000010000000100000000100
                  18000000000000030000C30E0000C30E00000000000000000000FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFD3C1B0B7814CB37941DABC9EC9C5C3C9C5C3DABC
                  9EB37941B7814CD3C1B0FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB3783EB3
                  783EB07438E0C2A59FACBA9FACBAE0C2A5B07438B3783EB3783EFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFB57D46B3783EAF7236E3C7AB919BA6919BA6E3C7
                  ABAF7236B3783EB57D46FF00FFFF00FFC39567B2773DC39567FF00FFC7A686B3
                  783EAE6F33E8D0B78F99A18F99A1E8D0B7AE6F33B3783EC7A686FF00FFFF00FF
                  B2773DB2773DB2773DFF00FFFF00FFCBB095A96827F0E1D2C6D5E2C6D5E2F0E1
                  D2A96827CBB095FF00FFB3783EFFFFFFC39568B2773DC39568FFFFFFB78451D2
                  BFADFF00FFFF00FFD3C0AED3C0AEFF00FFFF00FFFF00FFFF00FFB3783EC39568
                  FFFFFFFFFFFFFFFFFFC39568B3783EC29C76FF00FFAC6C2DAF7236AF7236AC6C
                  2DFF00FFD1BCA8FF00FFB3783EB3783EB3783EB3783EB3783EC9AB8EB3783ED1
                  BCA8B98550B3783EB3783EB3783EB3783EB98550FF00FFFF00FFB3783EB3783E
                  B3783EB3783EB3783EC9AB8EB3783ED4C4B4B5793EB2773EB3783EB3783EB277
                  3EB5793EFF00FFFF00FFB3783EB3783EB3783EB3783EB3783EC9AB8EB3783ECA
                  AD91CBAD8FB2773EB3783EB3783EB2773ECBAD8FFF00FFFF00FFB3783EFFFFFF
                  FFFFFFFFFFFFB3793FC9AB8EB3783EB7814DFF00FFC5A585B1773DB1773DC5A5
                  85FF00FFC19A73FF00FFB3783EC4966AFFFFFFFFFFFFB3793FC9AB8EB3783EB3
                  783EBA8A5AFF00FFFF00FFFF00FFFF00FFC29B75B3783EFF00FFFF00FFB2773D
                  FFFFFFFFFFFFB3793FC9AC8FB3783EB3783EB3783EB3783EB88350BA8856B378
                  3FB3783EB3783EFF00FFFF00FFC5A27FB3783EB3783EB3783EFF00FFB3783EB3
                  783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFB3783EB3783EB3783EB3783EB3783EB3783EB378
                  3EB3783EB3783EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC5A27FB3
                  783EB3783EB3783EB3783EB3783EB3783EB3783EC5A27FFF00FF}
              end
              object BitBtn36: TBitBtn
                Left = 625
                Top = 90
                Width = 75
                Height = 25
                Hint = 'Reserva'
                Caption = '&Reserva'
                TabOrder = 13
                OnClick = BitBtn36Click
                Glyph.Data = {
                  36030000424D3603000000000000360000002800000010000000100000000100
                  18000000000000030000C30E0000C30E00000000000000000000FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6D6D6D5353535151516666
                  66BABABAFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF8B
                  8B8B4E4E4EA5A5A5E2E2E2E6E6E6B1B1B1525252787878FF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FF4D4D4DE1E1E1FFFFFFFFFFFFFFFFFFFFFF
                  FFF5F5F5525252B9B9B9FF00FFFF00FFC39567B2773DC39567FF00FF7171719A
                  9A9AFFFFFFFFFFFFFDFDFDFCFBF8FFFFFFFFFFFFB8B9BA656565FF00FFFF00FF
                  B2773DB2773DB6814DFF00FF5B5B5BD0D0D0FFFFFFFFFFFF9D520B9D520B9D52
                  0BD1BEABD1BEAB505154B3783EFFFFFFC39568B2773DC59B72FF00FF5E5E5ECE
                  CECEFFFFFFFFFFFF9D520BE7D6C5F2E9E0F2E9E0E9EAEB505050B3783EC39568
                  FFFFFFFFFFFFFFFFFFFF00FF747474909090FFFFFFFFFFFF9D520BF2E9E0FFFF
                  FFFFFFFFADADAD696969B3783EB3783EB3783EB3783EB3783EFF00FFFF00FF4D
                  4D4DD2D2D2FFFFFFD1BEABF2E9E0FFFFFFE9E9E94F4F4FFF00FFB3783EB3783E
                  B3783EB3783EB3783ECBB095FF00FF9696964D4D4D909091D4D4D4D4D4D49D9D
                  9D4F4F4F868686FF00FFB3783EB3783EB3783EB3783EB3783EC9AB8EBC8C5DFF
                  00FFFF00FF7373735959595656566E6E6EFF00FFFF00FFFF00FFB3783EFFFFFF
                  FFFFFFFFFFFFB3793FC9AB8EB3783EB6814CCCB39AFF00FFFF00FFFF00FFFF00
                  FFD0BAA4B98653FF00FFB3783EC4966AFFFFFFFFFFFFB3793FC9AB8EB3783EB3
                  783EB3783EB3783EB7834FB88451B3783FB3783EB3783EFF00FFFF00FFB2773D
                  FFFFFFFFFFFFB3793FC9AC8FB3783EB3783EB3783EB3783EB3783EB3783EB378
                  3EB3783EB3783EFF00FFFF00FFC5A27FB3783EB3783EB3783EFF00FFB3783EB3
                  783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFB3783EB3783EB3783EB3783EB3783EB3783EB378
                  3EB3783EB3783EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC5A27FB3
                  783EB3783EB3783EB3783EB3783EB3783EB3783EC5A27FFF00FF}
              end
              object BitBtn37: TBitBtn
                Left = 706
                Top = 90
                Width = 75
                Height = 25
                Hint = 'Deposito'
                Caption = '&Deposito'
                TabOrder = 14
                OnClick = BitBtn37Click
                Glyph.Data = {
                  36030000424D3603000000000000360000002800000010000000100000000100
                  18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
                  BFBFBF404040333333404040CCCCCCFFFFFFFFFFFFFFFFFFBFBFBF4040403333
                  33404040CCCCCCFFFFFFFFFFFFFFFFFF404040A8A8A8C8C8C8ABABAB404040FF
                  FFFFFFFFFFFFFFFF404040A8A8A8C8C8C8ABABAB404040FFFFFF9090904D4D4D
                  333333E6E6E6000000E9E9E9333333E5E5E5FFFFFFFFFFFF333333E6E6E60000
                  00E9E9E9333333E5E5E5999999999999353535CECECEF2F2F2CECECE31313133
                  3333333333333333333333CECECEF2F2F2CECECE353535A6A6A64D4D4D4D4D4D
                  454545353535333333303C400D385ECCCCCCCCCCCCCCCCCC9C9C9C3535353333
                  333535353333333333330073D966D6FD30CAFD02AEF302AEF300C2FF00396C18
                  1851181851181851181851181851181851181851181851181851967F5F967F5F
                  967F5F967F5F967F5F00C2FF00396C21217A6F7CCF1024AF1024AF1024AF1024
                  AF1024AF1024AF21217ABCAC8BBCAC8BBCAC8BBCAC8B967F5F00C2FF00396C21
                  217A727DD21427B41427B41427B41427B41427B41427B421217A938B7D92897A
                  C2B39ACBBBA0967F5F00C2FF00396C21217A757FD6192ABA192ABA192ABA192A
                  BA192ABA192ABA21217A5F5F5F4D4D4D6D6862DAC9B5967F5F00C2FF00396C21
                  217A7781D91D2DC01D2DC01D2DC01D2DC01D2DC01D2DC021217A2085DE0073D9
                  0073D90073D90073D90073D900396C21217A7A83DD222FC6222FC6222FC6222F
                  C6222FC6222FC621217AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF21
                  217A7D84E02632CC2632CC2632CC2632CC2632CC2632CC21217AFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF21217A7F86E47F86E47F86E47F86E47F86
                  E47F86E47F86E421217AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF21
                  217A21217A21217A21217A21217A21217A21217A21217A21217AFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
              end
              object EditHwNF: TEditHw
                Left = 349
                Top = 47
                Width = 55
                Height = 21
                CharCase = ecUpperCase
                TabOrder = 3
                Text = '                                   0'
                Formato = fInteger
                FormatSize = '0.2'
              end
              object MaskEditDataEntIni: TMaskEdit
                Left = 409
                Top = 47
                Width = 66
                Height = 21
                Hint = 'Data Inicial e Final para pesquisa'
                CharCase = ecUpperCase
                EditMask = '99/99/0000;1;_'
                MaxLength = 10
                TabOrder = 4
                Text = '  /  /    '
                OnEnter = MaskEditDataEntIniEnter
                OnKeyDown = MaskEditDataEntKeyDown
              end
              object EditChassi: TEdit
                Left = 5
                Top = 47
                Width = 114
                Height = 21
                CharCase = ecUpperCase
                TabOrder = 0
              end
              object EditEspecie: TEdit
                Left = 184
                Top = 47
                Width = 161
                Height = 21
                CharCase = ecUpperCase
                TabOrder = 2
              end
              object EditMarca: TEdit
                Left = 5
                Top = 91
                Width = 176
                Height = 21
                CharCase = ecUpperCase
                TabOrder = 6
              end
              object EditModelo: TEdit
                Left = 184
                Top = 91
                Width = 161
                Height = 21
                CharCase = ecUpperCase
                TabOrder = 7
              end
              object EditCor: TEdit
                Left = 349
                Top = 90
                Width = 161
                Height = 21
                CharCase = ecUpperCase
                TabOrder = 8
              end
              object Panel145: TPanel
                Left = 1
                Top = 1
                Width = 780
                Height = 25
                Align = alTop
                BevelKind = bkTile
                BevelOuter = bvNone
                Caption = 'Consultar Ve'#237'culos'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 15
              end
              object Panel24: TPanel
                Left = 525
                Top = 81
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
                TabOrder = 16
              end
              object Panel15: TPanel
                Left = 525
                Top = 100
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
                TabOrder = 17
              end
              object MaskEditDataEntFim: TMaskEdit
                Left = 481
                Top = 47
                Width = 66
                Height = 21
                Hint = 'Data Inicial e Final para pesquisa'
                EditMask = '99/99/0000;1;_'
                MaxLength = 10
                TabOrder = 5
                Text = '  /  /    '
                OnEnter = MaskEditDataEntFimEnter
                OnKeyDown = MaskEditDataEntKeyDown
              end
              object cbxNovo: TCheckBox
                Left = 569
                Top = 36
                Width = 44
                Height = 17
                Caption = 'Novo'
                TabOrder = 18
              end
              object cbxUsado: TCheckBox
                Left = 569
                Top = 54
                Width = 53
                Height = 17
                Caption = 'Usado'
                TabOrder = 19
              end
              object EditPlaca: TEdit
                Left = 122
                Top = 47
                Width = 59
                Height = 21
                CharCase = ecUpperCase
                TabOrder = 1
              end
            end
            object Panel13: TPanel
              Left = 1
              Top = 129
              Width = 782
              Height = 231
              Align = alClient
              TabOrder = 1
              object DBGrid4: TDBGrid
                Left = 1
                Top = 1
                Width = 780
                Height = 229
                Align = alClient
                DataSource = DtmVeiculosCCIA.dsEstMotosComFat
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                PopupMenu = PopupMenu3
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
                    FieldName = 'STATUS_USO'
                    Title.Caption = 'N / U'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'CHASSI_C'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'PLACAEST'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'NUM_NOTA'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'SERIE'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'CODIGO'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'MARCAEST'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'VERSAOEST'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DESCRICAO_VERSAOEST'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ANO_FABEST'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ANO_MODEST'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'COREST'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'CILINDROSEST'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'COMBUSTIVELEST'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'CILINDRADAEST'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'HPEST'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'LOTACAOEST'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'TIPOEST'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'RENAVAMEST'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'PRECO_CUSTO'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'PRECO_TABEST'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FRETE_AQUISICAOEST'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FRETE_VENDAEST'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'VALOR_ICM_SUBEST'
                    Title.Caption = 'Valor ICM Sub'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'BASE_CALC_ICM_SUBEST'
                    Title.Caption = 'Base Calc ICM Sub'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'MOTOREST'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'COD_CLIENTE'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'COD_FORNECEDOR'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DATA_CH_NOTA'
                    Title.Caption = 'Data Ent/Saida'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DATA_VEN'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'NSERIE'
                    Title.Caption = 'N'#186' Serie'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'COD_COR'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'TIP_PINTURA'
                    Visible = True
                  end>
              end
            end
          end
        end
        object tsPerguntasVeic: TTabSheet
          Caption = 'tsPerguntasVeic'
          ImageIndex = 6
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object pnPerguntasVeic: TPanel
            Left = 0
            Top = 1
            Width = 505
            Height = 168
            TabOrder = 0
            object Panel17: TPanel
              Left = 1
              Top = 1
              Width = 503
              Height = 134
              Align = alTop
              TabOrder = 0
              object Label133: TLabel
                Left = 37
                Top = 12
                Width = 94
                Height = 13
                Alignment = taRightJustify
                Caption = 'Primeiro Ve'#237'culo:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label134: TLabel
                Left = 14
                Top = 39
                Width = 117
                Height = 13
                Alignment = taRightJustify
                Caption = 'Marca Veic. Anterior:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label135: TLabel
                Left = 8
                Top = 66
                Width = 123
                Height = 13
                Alignment = taRightJustify
                Caption = 'Modelo Veic. Anterior:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label136: TLabel
                Left = 41
                Top = 93
                Width = 90
                Height = 13
                Alignment = taRightJustify
                Caption = 'Aceita Contato?'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object DBComboBox6: TDBComboBox
                Left = 137
                Top = 9
                Width = 128
                Height = 21
                Style = csDropDownList
                CharCase = ecUpperCase
                DataField = 'PRIMEIROVEICULO'
                DataSource = DtmVeiculosCCIA.dsComFat
                ItemHeight = 0
                Items.Strings = (
                  'SIM'
                  'N'#195'O')
                TabOrder = 0
                OnExit = DBComboBox6Exit
              end
              object DBEdit75: TDBEdit
                Left = 137
                Top = 36
                Width = 344
                Height = 21
                CharCase = ecUpperCase
                DataField = 'MARCAVEICULOANT'
                DataSource = DtmVeiculosCCIA.dsComFat
                TabOrder = 1
              end
              object DBEdit76: TDBEdit
                Left = 137
                Top = 63
                Width = 344
                Height = 21
                CharCase = ecUpperCase
                DataField = 'MODELOVEICULOANT'
                DataSource = DtmVeiculosCCIA.dsComFat
                TabOrder = 2
              end
              object DBComboBox7: TDBComboBox
                Left = 137
                Top = 90
                Width = 128
                Height = 21
                Style = csDropDownList
                CharCase = ecUpperCase
                DataField = 'ACEITA_CONTATO'
                DataSource = DtmVeiculosCCIA.dsComFat
                ItemHeight = 0
                Items.Strings = (
                  'SIM'
                  'N'#195'O')
                TabOrder = 3
              end
            end
            object Panel18: TPanel
              Left = 1
              Top = 135
              Width = 503
              Height = 32
              Align = alBottom
              TabOrder = 1
              object BitBtn39: TBitBtn
                Left = 216
                Top = 3
                Width = 75
                Height = 25
                Caption = '&OK'
                TabOrder = 0
                OnClick = BitBtn39Click
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
      end
    end
    inherited PanelFlash: TPanel
      Width = 0
      Height = 590
      ExplicitWidth = 0
      ExplicitHeight = 590
      inherited bMarketingHW: TBitBtn
        Top = 568
        Width = 1
        ExplicitTop = 568
        ExplicitWidth = 1
      end
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 592
    Width = 799
    Height = 20
    ExplicitTop = 592
    ExplicitWidth = 799
    ExplicitHeight = 20
  end
  inherited pnStatusProcessamento: TPanel
    inherited lbTextoProcessamento: TLabel
      Width = 477
      Height = 21
    end
  end
  inherited PopupMenu1: TPopupMenu
    Left = 546
    Top = 65533
  end
  inherited PopupMenu2: TPopupMenu
    Left = 607
    Top = 65532
  end
  inherited Timer1: TTimer
    Left = 577
    Top = 65533
  end
  inherited ApplicationEventsPadrao: TApplicationEvents
    Left = 638
    Top = 65532
  end
  object PopupMenu3: TPopupMenu
    Left = 516
    Top = 65533
    object MenuItem5: TMenuItem
      Caption = 'Copiar para '#225'rea de transfer'#234'ncia'
      OnClick = Copiarparareadetransferncia1Click
    end
  end
  object DtVeiculosXML: TDataSource
    Left = 712
    Top = 352
  end
end
