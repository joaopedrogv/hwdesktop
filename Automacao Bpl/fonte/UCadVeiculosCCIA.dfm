inherited FrmCadVeiculosCCIA: TFrmCadVeiculosCCIA
  Left = 228
  Top = 52
  Caption = 'Ve'#237'culos'
  ClientHeight = 590
  ClientWidth = 803
  Font.Color = clBlack
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
      ExplicitHeight = 551
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
              HelpType = htKeyword
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
                    Top = 105
                    Width = 776
                    Height = 0
                    Visible = False
                    ExplicitTop = 105
                    ExplicitWidth = 776
                    ExplicitHeight = 0
                  end
                  object GroupBox4: TGroupBox
                    Left = 0
                    Top = 0
                    Width = 776
                    Height = 105
                    Align = alTop
                    Caption = 'GroupBox1'
                    TabOrder = 1
                  end
                end
              end
              object TabSheet_Dados: TTabSheet
                Caption = 'Dados do Ve'#237'culo'
                ImageIndex = 7
                object ScrollBox4: TScrollBox
                  Left = 0
                  Top = 0
                  Width = 780
                  Height = 457
                  Align = alClient
                  TabOrder = 0
                  object GroupBox5: TGroupBox
                    Left = 0
                    Top = 0
                    Width = 776
                    Height = 453
                    Align = alTop
                    Caption = 'Cadastro de V'#233'iculos'
                    TabOrder = 0
                    object Label33: TLabel
                      Left = 39
                      Top = 34
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
                      Left = 37
                      Top = 56
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
                    object Label63: TLabel
                      Left = 39
                      Top = 148
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
                    object Label66: TLabel
                      Left = 46
                      Top = 217
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
                      Left = 446
                      Top = 148
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
                    object Label69: TLabel
                      Left = 35
                      Top = 239
                      Width = 48
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Usuario:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label79: TLabel
                      Left = 43
                      Top = 80
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
                      Left = 295
                      Top = 33
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
                      Left = 486
                      Top = 33
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
                      Left = 59
                      Top = 125
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
                      Left = 10
                      Top = 103
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
                    object Label85: TLabel
                      Left = 437
                      Top = 217
                      Width = 86
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Data Cadastro:'
                      FocusControl = DBEdit30
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label86: TLabel
                      Left = 386
                      Top = 239
                      Width = 137
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Tipo de O.S. Vinculada:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label34: TLabel
                      Left = 31
                      Top = 171
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
                      Left = 22
                      Top = 194
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
                      Left = 161
                      Top = 171
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
                      Left = 194
                      Top = 194
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
                      Left = 304
                      Top = 171
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
                      Left = 465
                      Top = 194
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
                      Left = 429
                      Top = 80
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
                      Left = 433
                      Top = 125
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
                      Left = 436
                      Top = 103
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
                    object Label14: TLabel
                      Left = 61
                      Top = 264
                      Width = 22
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Km:'
                      FocusControl = DBEdit7
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object btAlterarChassiPlaca: TSpeedButton
                      Left = 692
                      Top = 29
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
                      Left = 85
                      Top = 30
                      Width = 65
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'CODIGO'
                      DataSource = DtmVeiculosCCIA.dsVeiculos
                      Enabled = False
                      TabOrder = 0
                    end
                    object DBEdit4: TDBEdit
                      Left = 85
                      Top = 145
                      Width = 39
                      Height = 21
                      Hint = 'Cliente do Ve'#237'culo.'
                      CharCase = ecUpperCase
                      DataField = 'COD_CLIENTE'
                      DataSource = DtmVeiculosCCIA.dsVeiculos
                      TabOrder = 14
                      OnExit = DBEdit4Exit
                      OnKeyDown = DBEdit4KeyDown
                    end
                    object DBLookupComboBox2: TDBLookupComboBox
                      Left = 126
                      Top = 145
                      Width = 297
                      Height = 21
                      Hint = 'Cliente do Ve'#237'culo.'
                      DataField = 'COD_CLIENTE'
                      DataSource = DtmVeiculosCCIA.dsVeiculos
                      KeyField = 'COD_CLIENTE'
                      ListField = 'NOME_CLIENTE'
                      ListSource = DtmVeiculosCCIA.dsLocClientes
                      TabOrder = 15
                    end
                    object DBEdit5: TDBEdit
                      Left = 85
                      Top = 214
                      Width = 125
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'MOTOR'
                      DataSource = DtmVeiculosCCIA.dsVeiculos
                      TabOrder = 23
                    end
                    object DBLookupComboBox6: TDBLookupComboBox
                      Left = 85
                      Top = 236
                      Width = 294
                      Height = 21
                      DataField = 'US_CAD'
                      DataSource = DtmVeiculosCCIA.dsVeiculos
                      Enabled = False
                      KeyField = 'COD_VENDEDOR'
                      ListField = 'NOME_VENDEDOR'
                      ListSource = DtmVeiculosCCIA.dsLocColaborador
                      TabOrder = 25
                    end
                    object DBEdit14: TDBEdit
                      Left = 85
                      Top = 76
                      Width = 39
                      Height = 21
                      Hint = 'Marca do Ve'#237'culo.'
                      CharCase = ecUpperCase
                      DataField = 'COD_MARCA'
                      DataSource = DtmVeiculosCCIA.dsVeiculos
                      TabOrder = 5
                      OnExit = DBEdit14Exit
                      OnKeyDown = DBEdit14KeyDown
                    end
                    object DBEdit18: TDBEdit
                      Left = 343
                      Top = 30
                      Width = 125
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'CHASSI'
                      DataSource = DtmVeiculosCCIA.dsVeiculos
                      TabOrder = 1
                      OnExit = DBEdit18Exit
                    end
                    object DBEdit26: TDBEdit
                      Left = 529
                      Top = 30
                      Width = 157
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'PLACA'
                      DataSource = DtmVeiculosCCIA.dsVeiculos
                      TabOrder = 2
                      OnExit = DBEdit26Exit
                    end
                    object DBEdit27: TDBEdit
                      Left = 85
                      Top = 122
                      Width = 39
                      Height = 21
                      Hint = 'Cor do Ve'#237'culo.'
                      CharCase = ecUpperCase
                      DataField = 'COD_COR'
                      DataSource = DtmVeiculosCCIA.dsVeiculos
                      TabOrder = 11
                      OnExit = DBEdit27Exit
                      OnKeyDown = DBEdit27KeyDown
                    end
                    object DBEdit30: TDBEdit
                      Left = 525
                      Top = 214
                      Width = 161
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'DATA_CAD'
                      DataSource = DtmVeiculosCCIA.dsVeiculos
                      Enabled = False
                      TabOrder = 24
                    end
                    object DBComboBox1: TDBComboBox
                      Left = 525
                      Top = 236
                      Width = 161
                      Height = 21
                      DataField = 'TIPO_OS'
                      DataSource = DtmVeiculosCCIA.dsVeiculos
                      ItemHeight = 13
                      TabOrder = 26
                      OnExit = DBComboBox1Exit
                    end
                    object DBEdit31: TDBEdit
                      Left = 85
                      Top = 53
                      Width = 39
                      Height = 21
                      Hint = 'Marca do Modelo.'
                      CharCase = ecUpperCase
                      DataField = 'MODELO'
                      DataSource = DtmVeiculosCCIA.dsVeiculos
                      TabOrder = 3
                      OnExit = DBEdit31Exit
                      OnKeyDown = DBEdit31KeyDown
                    end
                    object DBEdit8: TDBEdit
                      Left = 85
                      Top = 99
                      Width = 39
                      Height = 21
                      Hint = 'Combust'#237'vel do Modelo.'
                      CharCase = ecUpperCase
                      DataField = 'COD_COMBUSTIVEL'
                      DataSource = DtmVeiculosCCIA.dsVeiculos
                      TabOrder = 8
                      OnExit = DBEdit8Exit
                      OnKeyDown = DBEdit8KeyDown
                    end
                    object DBEdit11: TDBEdit
                      Left = 85
                      Top = 168
                      Width = 64
                      Height = 21
                      Hint = 'Ano de Fabrica'#231#227'o.'
                      CharCase = ecUpperCase
                      DataField = 'ANOFAB'
                      DataSource = DtmVeiculosCCIA.dsVeiculos
                      TabOrder = 17
                    end
                    object DBEdit28: TDBEdit
                      Left = 85
                      Top = 190
                      Width = 64
                      Height = 21
                      Hint = 'Cilindradas.'
                      CharCase = ecUpperCase
                      DataField = 'CILINDRADA'
                      DataSource = DtmVeiculosCCIA.dsVeiculos
                      TabOrder = 20
                    end
                    object DBEdit32: TDBEdit
                      Left = 218
                      Top = 191
                      Width = 64
                      Height = 21
                      Hint = 'HP.'
                      CharCase = ecUpperCase
                      DataField = 'HP'
                      DataSource = DtmVeiculosCCIA.dsVeiculos
                      TabOrder = 21
                    end
                    object DBEdit33: TDBEdit
                      Left = 218
                      Top = 168
                      Width = 64
                      Height = 21
                      Hint = 'Ano Modelo.'
                      CharCase = ecUpperCase
                      DataField = 'ANOMOD'
                      DataSource = DtmVeiculosCCIA.dsVeiculos
                      TabOrder = 18
                    end
                    object DBEdit35: TDBEdit
                      Left = 359
                      Top = 168
                      Width = 64
                      Height = 21
                      Hint = 'Cilindros.'
                      CharCase = ecUpperCase
                      DataField = 'CILINDROS'
                      DataSource = DtmVeiculosCCIA.dsVeiculos
                      TabOrder = 19
                    end
                    object DBEdit43: TDBEdit
                      Left = 525
                      Top = 190
                      Width = 161
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'RENAVAM'
                      DataSource = DtmVeiculosCCIA.dsVeiculos
                      TabOrder = 22
                    end
                    object DBComboBox2: TDBComboBox
                      Left = 525
                      Top = 76
                      Width = 161
                      Height = 21
                      Hint = 'Quantidade de pessoas que o ve'#237'culo pode transportar'
                      DataField = 'LOTACAO'
                      DataSource = DtmVeiculosCCIA.dsVeiculos
                      ItemHeight = 13
                      Items.Strings = (
                        '01'
                        '02'
                        '03'
                        '04'
                        '05')
                      TabOrder = 7
                    end
                    object DBLookupComboBox5: TDBLookupComboBox
                      Left = 525
                      Top = 145
                      Width = 161
                      Height = 21
                      Hint = 'Esp'#233'cie V'#233'iculo.'
                      DataField = 'COD_ESPE_SEG'
                      DataSource = DtmVeiculosCCIA.dsVeiculos
                      KeyField = 'CODIGO_ESP'
                      ListField = 'DESCRICAO_ESP'
                      ListSource = DtmVeiculosCCIA.dsAbreEspecie
                      TabOrder = 16
                    end
                    object ComboBox4: TComboBox
                      Left = 525
                      Top = 99
                      Width = 161
                      Height = 21
                      Enabled = False
                      ItemHeight = 13
                      TabOrder = 10
                      Text = 'ComboBox4'
                      Items.Strings = (
                        '01 - PASSAGEIRO'
                        '02 - CARGA'
                        '03 - MISTO'
                        '')
                    end
                    object ComboBox5: TComboBox
                      Left = 525
                      Top = 122
                      Width = 161
                      Height = 21
                      Enabled = False
                      ItemHeight = 13
                      TabOrder = 13
                      Text = 'ComboBox5'
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
                    object DBEdit12: TDBEdit
                      Left = 126
                      Top = 53
                      Width = 297
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'DESCMODELO'
                      DataSource = DtmVeiculosCCIA.dsVeiculos
                      TabOrder = 4
                    end
                    object DBEdit2: TDBEdit
                      Left = 126
                      Top = 76
                      Width = 297
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'MARCA_V'
                      DataSource = DtmVeiculosCCIA.dsVeiculos
                      TabOrder = 6
                    end
                    object DBEdit3: TDBEdit
                      Left = 126
                      Top = 99
                      Width = 297
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'COMBUSTIVEL'
                      DataSource = DtmVeiculosCCIA.dsVeiculos
                      TabOrder = 9
                    end
                    object DBEdit6: TDBEdit
                      Left = 126
                      Top = 122
                      Width = 297
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'COR'
                      DataSource = DtmVeiculosCCIA.dsVeiculos
                      TabOrder = 12
                    end
                    object DBEdit7: TDBEdit
                      Left = 85
                      Top = 260
                      Width = 64
                      Height = 21
                      Hint = 'Cilindradas.'
                      CharCase = ecUpperCase
                      DataField = 'KM_V'
                      DataSource = DtmVeiculosCCIA.dsVeiculos
                      TabOrder = 27
                    end
                  end
                end
              end
              object TabSheet_MaisInformacoes: TTabSheet
                Caption = 'Mais Informa'#231#245'es'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ImageIndex = 8
                ParentFont = False
                object ScrollBox5: TScrollBox
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
                    Width = 776
                    Height = 453
                    Align = alTop
                    Caption = 'Mais Informa'#231#245'es'
                    TabOrder = 0
                    object Label77: TLabel
                      Left = 36
                      Top = 241
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
                    object Label76: TLabel
                      Left = 20
                      Top = 27
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
                      Left = 105
                      Top = 24
                      Width = 634
                      Height = 200
                      Hint = 'Observa'#231#227'o do Ve'#237'culo.'
                      DataField = 'OBS'
                      DataSource = DtmVeiculosCCIA.dsVeiculos
                      MaxLength = 799
                      TabOrder = 0
                      OnKeyPress = DBMemo_ObservacoesKeyPress
                    end
                    object DBMemo_Adicionais: TDBMemo
                      Left = 105
                      Top = 235
                      Width = 634
                      Height = 200
                      Hint = 'Observa'#231#227'o Adicional do Ve'#237'culo.'
                      DataField = 'ADICIONAIS'
                      DataSource = DtmVeiculosCCIA.dsVeiculos
                      MaxLength = 799
                      TabOrder = 1
                      OnKeyPress = DBMemo_AdicionaisKeyPress
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
                          Hint = 'Visualizar - [NF0012]'
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
                          Hint = 'Imprimir - [NF0020/NF0021]'
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
                        TitleFont.Color = clBlack
                        TitleFont.Height = -11
                        TitleFont.Name = 'Tahoma'
                        TitleFont.Style = []
                        OnColumnMoved = DBGridNFEColumnMoved
                        OnDrawColumnCell = DBGridNFDrawColumnCell
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
                        object Label6: TLabel
                          Left = 68
                          Top = 6
                          Width = 88
                          Height = 13
                          Caption = 'Nota Fiscal Aberta'
                        end
                        object Label13: TLabel
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
                          Hint = 'Visualizar - [NF0012]'
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
                          Hint = 'Imprimir - [NF0020/NF0021]'
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
                        object Panel7: TPanel
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
                        object Panel22: TPanel
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
                        object BitBtn12: TBitBtn
                          Left = 429
                          Top = 0
                          Width = 86
                          Height = 26
                          Hint = 'Abrir Modulo de Nota Fiscal'
                          Align = alRight
                          Caption = '&Abrir'
                          TabOrder = 0
                          OnClick = BitBtn12Click
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
                        TitleFont.Color = clBlack
                        TitleFont.Height = -11
                        TitleFont.Name = 'Tahoma'
                        TitleFont.Style = []
                        OnColumnMoved = DBGridNFSColumnMoved
                        OnDrawColumnCell = DBGridNFDrawColumnCell
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
                      object GroupBox10: TGroupBox
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
                ImageIndex = 2
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
                    Caption = 'Contratos'
                    TabOrder = 0
                    object BitBtn7: TBitBtn
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
                    object GroupBox12: TGroupBox
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
                          TabOrder = 0
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
                          TabOrder = 1
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
                          TabOrder = 2
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
                          TabOrder = 3
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
                          TabOrder = 4
                        end
                        object BitBtn38: TBitBtn
                          Left = 515
                          Top = 0
                          Width = 86
                          Height = 26
                          Hint = 'Abrir Modulo de Contratos'
                          Align = alRight
                          Caption = '&Abrir'
                          TabOrder = 5
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
                        TitleFont.Color = clBlack
                        TitleFont.Height = -11
                        TitleFont.Name = 'Tahoma'
                        TitleFont.Style = []
                        OnColumnMoved = DBGridCTREColumnMoved
                        OnDrawColumnCell = DBGridCTRDrawColumnCell
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
                    object GroupBox13: TGroupBox
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
                        TitleFont.Color = clBlack
                        TitleFont.Height = -11
                        TitleFont.Name = 'Tahoma'
                        TitleFont.Style = []
                        OnColumnMoved = DBGridCTRSColumnMoved
                        OnDrawColumnCell = DBGridCTRDrawColumnCell
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
                        object Label9: TLabel
                          Left = 48
                          Top = 6
                          Width = 107
                          Height = 13
                          Caption = 'Documento em Aberto'
                        end
                        object Label10: TLabel
                          Left = 217
                          Top = 6
                          Width = 107
                          Height = 13
                          Caption = 'Documento Cancelado'
                        end
                        object Label11: TLabel
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
                          TabOrder = 0
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
                          TabOrder = 1
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
                        object Panel12: TPanel
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
                        object Panel13: TPanel
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
                          TabOrder = 3
                        end
                        object Panel16: TPanel
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
                          TabOrder = 4
                        end
                        object BitBtn13: TBitBtn
                          Left = 515
                          Top = 0
                          Width = 86
                          Height = 26
                          Hint = 'Abrir Modulo de Contratos'
                          Align = alRight
                          Caption = '&Abrir'
                          TabOrder = 5
                          OnClick = BitBtn13Click
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
                ImageIndex = 7
                object ScrollBox11: TScrollBox
                  Left = 0
                  Top = 0
                  Width = 780
                  Height = 457
                  Align = alClient
                  BevelInner = bvNone
                  BevelOuter = bvNone
                  TabOrder = 0
                  object GroupBox11: TGroupBox
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
                    object GroupBox15: TGroupBox
                      Left = 2
                      Top = 57
                      Width = 772
                      Height = 195
                      Align = alTop
                      Caption = 'Or'#231'amento'
                      TabOrder = 1
                      object Panel6: TPanel
                        Left = 2
                        Top = 167
                        Width = 768
                        Height = 26
                        Align = alBottom
                        BevelOuter = bvNone
                        TabOrder = 0
                        object Label7: TLabel
                          Left = 332
                          Top = 6
                          Width = 106
                          Height = 13
                          Caption = 'Or'#231'amento Cancelada'
                        end
                        object BitBtn8: TBitBtn
                          Left = 601
                          Top = 0
                          Width = 86
                          Height = 26
                          Hint = 'Visualizar - [VND008]'
                          Align = alRight
                          Caption = '&Visualizar'
                          TabOrder = 0
                          OnClick = BitBtn8Click
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
                        object BitBtn11: TBitBtn
                          Left = 687
                          Top = 0
                          Width = 81
                          Height = 26
                          Hint = 'Imprimir - [VND056]'
                          Align = alRight
                          Caption = '&Imprimir'
                          TabOrder = 1
                          OnClick = BitBtn11Click
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
                        object Panel8: TPanel
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
                          TabOrder = 2
                        end
                        object BitBtn40: TBitBtn
                          Left = 515
                          Top = 0
                          Width = 86
                          Height = 26
                          Hint = 'Abrir Modulo de Or'#231'amento'
                          Align = alRight
                          Caption = '&Abrir'
                          TabOrder = 3
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
                      object DBGridOrcamento: TDBGrid
                        Left = 288
                        Top = 15
                        Width = 482
                        Height = 152
                        Align = alClient
                        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                        PopupMenu = PopupMenuORC
                        TabOrder = 1
                        TitleFont.Charset = DEFAULT_CHARSET
                        TitleFont.Color = clBlack
                        TitleFont.Height = -11
                        TitleFont.Name = 'Tahoma'
                        TitleFont.Style = []
                        OnColumnMoved = DBGridOrcamentoColumnMoved
                        OnDrawColumnCell = DBGridOrcamentoDrawColumnCell
                        OnKeyDown = DBGridNFEKeyDown
                        OnTitleClick = DBGridCTRETitleClick
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
                    object GroupBox16: TGroupBox
                      Left = 2
                      Top = 252
                      Width = 772
                      Height = 199
                      Align = alClient
                      Caption = 'Oficina'
                      TabOrder = 2
                      object DBGridOficina: TDBGrid
                        Left = 288
                        Top = 15
                        Width = 482
                        Height = 156
                        Align = alClient
                        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                        PopupMenu = PopupMenuOS
                        TabOrder = 0
                        TitleFont.Charset = DEFAULT_CHARSET
                        TitleFont.Color = clBlack
                        TitleFont.Height = -11
                        TitleFont.Name = 'Tahoma'
                        TitleFont.Style = []
                        OnColumnMoved = DBGridOficinaColumnMoved
                        OnDrawColumnCell = DBGridOficinaDrawColumnCell
                        OnKeyDown = DBGridNFEKeyDown
                        OnTitleClick = DBGridOficinaTitleClick
                      end
                      object Panel4: TPanel
                        Left = 2
                        Top = 171
                        Width = 768
                        Height = 26
                        Align = alBottom
                        BevelOuter = bvNone
                        TabOrder = 1
                        object Label40: TLabel
                          Left = 68
                          Top = 6
                          Width = 121
                          Height = 13
                          Caption = 'Ordem de Servi'#231'o Aberta'
                        end
                        object Label8: TLabel
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
                          TabOrder = 0
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
                          TabOrder = 1
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
                          TabOrder = 2
                        end
                        object Panel9: TPanel
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
                        object BitBtn14: TBitBtn
                          Left = 515
                          Top = 0
                          Width = 86
                          Height = 26
                          Hint = 'Abrir Modulo de Or'#231'amento'
                          Align = alRight
                          Caption = '&Abrir'
                          TabOrder = 4
                          OnClick = BitBtn14Click
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
                ImageIndex = 6
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
                      TitleFont.Color = clBlack
                      TitleFont.Height = -11
                      TitleFont.Name = 'Tahoma'
                      TitleFont.Style = []
                      OnColumnMoved = DBGridNFTColumnMoved
                      OnDrawColumnCell = DBGridNFTDrawColumnCell
                      OnKeyDown = DBGridNFEKeyDown
                    end
                    object Panel44: TPanel
                      Left = 2
                      Top = 370
                      Width = 772
                      Height = 26
                      Align = alBottom
                      BevelOuter = bvNone
                      TabOrder = 1
                      object Label12: TLabel
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
              inherited BitBtn4: TBitBtn
                Hint = 'Salvar Registro -  [VEI011]'
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
          OnShow = TabSheet2Show
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 788
          ExplicitHeight = 536
          inherited GroupBox3: TGroupBox
            Width = 788
            Height = 209
            ExplicitWidth = 788
            ExplicitHeight = 209
            inherited imgInformation: TImage
              Left = 762
              Height = 192
              ExplicitLeft = 762
              ExplicitHeight = 152
            end
            object SpeedButton40: TSpeedButton [6]
              Left = 699
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
              OnClick = SpeedButton40Click
            end
            object btSelectAll: TSpeedButton [7]
              Left = 604
              Top = 44
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
            object btUnSelectAll: TSpeedButton [8]
              Left = 631
              Top = 44
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
              OnClick = btUnSelectAllClick
            end
            inherited BitBtn1: TBitBtn
              Hint = 'Clique para pesquisar - [VEI025]'
            end
            inherited BitBtn3: TBitBtn
              Hint = 'Novo cadastro - [VEI006]'
              Font.Color = clBlack
              ParentFont = False
            end
            object BitBtn_Reserva: TBitBtn
              Left = 586
              Top = 69
              Width = 55
              Height = 49
              Hint = 'Novo cadastro'
              Caption = '&Reserva'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 11
              OnClick = BitBtn_ReservaClick
              Glyph.Data = {
                C6050000424DC605000000000000860300002800000018000000180000000100
                08000000000040020000120B0000120B0000D4000000D400000000000000FFFF
                FF000B0A8F001312950012118A001E1B90004B4997003631890057528E006A66
                96006F6B9800706D8F00514A8800514987005D54870060578300685E88005D54
                79008C88990075727D0086828B00635A6E00FF00FF007A6F7A0074696C003534
                340087838200675E5B002D2C2B0057514900534E420047433800444138005E5C
                560049463B0078756A003D3B33004240360047453C0035342E00403F38004645
                3C00363633002D2D2C002324240022232300262727002425250087AAFE0097B5
                FE007B9DFE0083A4FE008BABFE004974FE004A75FE004C78FE00507AFE005781
                FE005782FE005882FE005A82FE005F87FE006E93FE002856FF002F5CFF003763
                FE005F84FE001D48FF00204BFF002853FF002A55FE002D57FF002D57FE002D59
                FE00345AFE00385FFE003D64FE004068FE004268FF000A34FF000C36FF000D37
                FF000D39FF000F38FF00113AFF00123CFF00123DFF00133EFF001641FF001741
                FF001842FF001B43FE000328FF000329FF00052CFF00052DFF00062EFF00062C
                FE00072EFF00072FFF000930FF000A31FF00001EFF00001FFF000020FF000022
                FF000023FF000122FF000123FF000124FF000223FC000322FF000728FF00092A
                FF000019FF00001BFF00001CFF000018FE00001BFE000018FC00001AFC00001C
                FA00011CFB00011BFA00011CFA000421FE000017FB000017F8000016F7000016
                F6000016F4000015F3000016F3000015F0000016F0000014EF000013EE000013
                EB000012EA000013EA000012E9000011E6000011E5000011E3000010E2000011
                E200000FDC00000EDA00000FDA00000DD500000DD300000CCF00000CCE00000A
                C700000AC6000009C9000009C5000009C4000009C2000009C1000008C0000009
                C0000008BD000008BC000007BB000007B8000006B6000005B5000005B4000005
                B2000005B0000005AF000004AF000004AD000003A9000003A6000003A5000003
                A4000002A3000001A0000002A00000029F0000009E0000019D0000029C000001
                9A0000009600000196000000950000019500000092000000910000008F000000
                8E0000008C0000008B0000008A00000089000000880001018C0003038F000505
                8C000707900026289C0028289200373737002727270026262600252525002424
                2400232323002222220016161616161616161616161616161616161616161616
                161616161616161616CECECECECECECECECECECE1616161616161616161616CE
                CECECECECECECECECECECECECECE1616161616161616CECECECECECECECE2ECE
                CECECECECECECE16161616161616CECFD1D2D2D3D32DD1D22DD2D22CD0CFCE16
                161616161616D2D12B2A282926221E1F202524271C2FD216161616161616CD21
                23130B0A09080C0D0E0F11151B1D19161616161616161A1206CC03CAC8C2C2C2
                C7C902050710181616161616161614CBC4C5C5C4C4C3C3C3C3C3C3C3C2041716
                16161616161616A5B4B8BBC0C5C6C6C5C5C3C1C0C0BD1616161616161616169B
                9E9A999DA0A3A6AAAFB7BCBEBFB616161616161616161695928F8B898C909397
                A1A9B2BABFB51616161616161616168E837E727275808791969DA8B3BEB41616
                1616161616161685676C6C69686673818D969FACB9B11616161616161616167C
                6554534F625C69747F8F97A4B0AE1616161616161616166F53595A5857515E6B
                7382929CABAD16161616161616161670474649484458505D67778D98A6A91616
                16161616161616713C3E3537414355606A768896A4A716161616161616161616
                42313B3A364557646D748595A216161616161616161616164B33303938405663
                6C7487969E1616161616161616161616164D32343D3F525F6A788A9616161616
                161616161616161616164A4C4E5B616E79849416161616161616161616161616
                161616167D7B7A868F1616161616161616161616161616161616161616161616
                16161616161616161616}
              Layout = blGlyphTop
            end
            object BitBtn_Venda: TBitBtn
              Left = 516
              Top = 69
              Width = 55
              Height = 49
              Hint = 'Novo cadastro'
              Caption = '&Venda'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 12
              OnClick = BitBtn_VendaClick
              Glyph.Data = {
                4E030000424D4E030000000000000E0100002800000018000000180000000100
                08000000000040020000120B0000120B0000360000003600000000000000FFFF
                FF00FF00FF008E2425006826270064262700A6424300C14D4E005F262700732F
                3000C1515200AF4A4B00AC494A0060292A005B272800D35C5D007A353600BB52
                5300B24E4F006D303100A04748007E383900652D2E00AB4D4E0073343500DD65
                66009E484900803A3B00E1686900A34C4D00E76D6E0093454600A64F5000F276
                7700803E3F00F3777800BC5C5D00DD6E6F00FF818200FC7F8000FE818200A057
                58009C58590060363700FE929300690F0F00681A1A0060393900CB7A7A00C678
                780064424200F8A4A4006F6D6B00434241000202353502020202020202020202
                0202020202020202020202023535020202020202020202020202020202020202
                0202020235350202020202020202020202020202020202020202020235350202
                0202020202020202020202020202020202020202353502020202020202020202
                0202020202020202020202023535020202020202020202020202020202020202
                0202020235350202020202020202020202020202020202020202020235350202
                0202020202020202020202020202020202020202353502020202020202020202
                0202020202020202020202023535020202020202020202020202020202020202
                020202023535020202020202020202160E0E0E0E0E0E0E020202020235352F0E
                0202020202020531332C28211E19110E0E02020235352B252420151009042E30
                332C28211E190F0B0E02020235352B262627231C07032D30332C28211E190F0B
                0E02020235352B262627231C07032D30332C28211E190F0B0E02020235352B26
                2627231C07032D30332C28211E190F0B0E02020235352B262627231C07032D30
                332C28211E190F0B0E02020235352B262627231C07032D30332C28211E190F0B
                0E02020235352B262627231C07032D30332C28211E190F0C0E02020235352B26
                2627231C07032D30332C28211E190F0C0E02020235352B262627231C07032D30
                332C28211E190F0A0E02020235352B262627231C07032D292A221F1D1A14120A
                0E0202023535320E131B1D1706032D180E02020202020E0E0E02020235353402
                020202020E0E080D02020202020202020202}
              Layout = blGlyphTop
            end
            object GroupBox20: TGroupBox
              Left = 5
              Top = 72
              Width = 320
              Height = 134
              Caption = 'Op'#231#245'es Avan'#231'adas'
              TabOrder = 13
              object GroupBox_Posicao: TGroupBox
                Left = 3
                Top = 13
                Width = 157
                Height = 118
                Caption = 'Posi'#231#227'o'
                TabOrder = 0
                object CheckBox_Transito: TCheckBox
                  Left = 11
                  Top = 77
                  Width = 66
                  Height = 17
                  Caption = 'Tr'#226'nsito'
                  TabOrder = 0
                end
                object CheckBox_Reserva: TCheckBox
                  Left = 11
                  Top = 61
                  Width = 66
                  Height = 17
                  Caption = 'Reserva'
                  TabOrder = 1
                end
                object CheckBox_TransfDep: TCheckBox
                  Left = 11
                  Top = 34
                  Width = 135
                  Height = 11
                  Caption = 'Transfer'#234'ncia Dep'#244'sito'
                  TabOrder = 2
                end
                object CheckBox_Demonstracao: TCheckBox
                  Left = 11
                  Top = 48
                  Width = 135
                  Height = 14
                  Caption = 'Demonstra'#231#227'o'
                  TabOrder = 3
                end
              end
              object GroupBox21: TGroupBox
                Left = 161
                Top = 13
                Width = 156
                Height = 118
                Caption = 'Situa'#231#227'o'
                TabOrder = 1
                object CheckBox_Novo: TCheckBox
                  Left = 10
                  Top = 15
                  Width = 71
                  Height = 17
                  Caption = 'Novo'
                  TabOrder = 0
                end
                object CheckBox_Estoque: TCheckBox
                  Left = 10
                  Top = 77
                  Width = 84
                  Height = 17
                  Caption = 'Com Estoque'
                  TabOrder = 1
                end
                object CheckBox_SemEstoque: TCheckBox
                  Left = 10
                  Top = 95
                  Width = 82
                  Height = 11
                  Caption = 'Sem Estoque'
                  TabOrder = 2
                end
                object CheckBox_Usado: TCheckBox
                  Left = 86
                  Top = 15
                  Width = 67
                  Height = 17
                  Caption = 'Usado'
                  TabOrder = 3
                end
                object CheckBox_EstReal: TCheckBox
                  Left = 10
                  Top = 31
                  Width = 94
                  Height = 17
                  Caption = 'Estoque Real'
                  TabOrder = 4
                end
                object CheckBox_Cons: TCheckBox
                  Left = 10
                  Top = 46
                  Width = 79
                  Height = 17
                  Caption = 'Consignado'
                  TabOrder = 5
                end
                object CheckBox_Inter: TCheckBox
                  Left = 10
                  Top = 61
                  Width = 94
                  Height = 17
                  Caption = 'Intermedia'#231#227'o'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 6
                end
              end
            end
          end
          inherited Panel1: TPanel
            Top = 209
            Width = 788
            Height = 327
            ExplicitTop = 209
            ExplicitWidth = 788
            ExplicitHeight = 327
            inherited Splitter1: TSplitter
              Height = 266
              ExplicitHeight = 251
            end
            inherited DBGrid1: TDBGrid
              Width = 495
              Height = 266
              Font.Color = clBlack
              TitleFont.Color = clBlack
              OnCellClick = DBGrid1CellClick
              OnDrawColumnCell = DBGrid1DrawColumnCell
              OnKeyDown = DBGrid1KeyDown
            end
            inherited Panel2: TPanel
              Width = 784
              ExplicitWidth = 784
              inherited SpeedButton1: TSpeedButton
                Top = 3
                Hint = 'Editar Registro - [VEI007]'
                ExplicitTop = 3
              end
              inherited SpeedButton2: TSpeedButton
                Hint = 'Apagar Registro - [VEI008]'
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
                Hint = 'Recuperar registro - [VEI010]'
                OnClick = SpeedButton5Click
              end
              inherited SpeedButton6: TSpeedButton
                Hint = 'Cadastrar/Visualizar Modelos de Ve'#237'culos - [VEI005]'
                Glyph.Data = {
                  F6060000424DF606000000000000360000002800000018000000180000000100
                  180000000000C0060000120B0000120B00000000000000000000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD0C0B4B08D7A9B705E9E6C5CA77365A071
                  63A68577D3C6B6FAF5EBFFFEFEFFFFFFFFFFFFFFFFFFFFFFFFFEFEFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFECE5E08F776DAE958BD7C2BAF4E6DF
                  57813A598330E0DEC6DAC7BCA894888C756DCCB8B7FFFEFDFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7E1DE9B867BE4DACFFC
                  F6EEDDDBDAF0F2EA496A2C568034D6DACBFEFDF5FCFAF1E8DBD5A48986A8948E
                  FFFEFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB1A298A998
                  8BF7F1E5FDFBF2FCFBF65A87355B87345C89355681334D733B619134FEFEF9FE
                  FBF6F8EAE5AF9E95A59689FFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  C0B4AAA48F82FCF5E8FEFBF1FCFCF7F8FDFB4B6D375A8632598632629332557E
                  32629333FDFEFDFDFCF7FDF5EDFAF5E9A99687BCA99BFFFEFAFFFFFFFFFFFFFF
                  FFFFFFFFFFEBDED7917568F3E2D3F6EEE1FBF5EEF8F8F7F7FEFEFAFDFEFAFDFE
                  5D8A33629235BCBFBCFDFDFEFEFDFEFCFCF9FAF8EDF5F1E2F4E6D4987767E8D8
                  CFFFFFFFFFFFFFFFFFFFFDF7EFAC8D84D7C0B3AB7C6C926154DBC3B9FDFDFAFA
                  FCFCFDFEFDFEFDFE6191354F7534DFE7D5FEFCFEFEFCFEFEFDF8DED8C78C705A
                  A07763DCC3B5AA887EFDFBF9FFFFFFFFFFFFFF9999947566F9F1E2905E4B9945
                  2ED4A185F3E0CAF2D6C9E5DACAE5D8CDEDD9D2EED9D5EDD9D5EDDAD4ECDED5F3
                  DCCEDAB29594552E92533BF4E8DE9A7B70F2E5D2FDFFFEFFFFFFFF9999B6AC9C
                  F9F5E6995F4CAB4C34964A2C84462D914630944E24954E25934923974D28984C
                  28994D27984E25934B2A8B482B99522995583DF4EBE2C7B0A4CAB39DFFFFFAFF
                  FFFFA1877AE7DDD0FAF3E69B5B488F482A86502B784D2D89573EA6543BA7543E
                  A35541A65A48A55744A9543FA64B359F4632974D33924A258B533AF1EAE1F0E0
                  D4A88F79FFFCF7FFFEFFDD7467EAF2E4FAF5E8D39D8BD89F7EDBA47ED4A382C3
                  9C83CFAD9DF3E6D8F3EBDFF2EBDFF2E7DACEB1A2BD9482D19483DB927CDE9772
                  C9967EF6F3E9FEF5E99C806BFBF6F0FFFDFFFF9999FAF9EDFBF3E8B46C5FA25D
                  409E5635A5553CB78877EBDAD3FDFCF7FCFDF8FAFDFAFBFBF7EBE4DCA992878F
                  5E5397513E9F5C3B956650F3EFE7FEF9ED947964F9F2EBFFFFFFFF9999FAFBEE
                  F6F3E88D60518F684CB69D7DE6D0B9F9F1E3FCF7F3F6F6F3F4F6F5F1F6F4F2F2
                  EEFBF4ECFBF5EAECD1C7CD9C89A46F4E8F624EF0ECE6FEFAEE8E745EF9F4ECFF
                  FFFF9B6E62FAEEE3F8F3E9CFA89CE5AA98CBA490BB988BB48982AB8874A3816D
                  A27E6CA27B69AC816BB4856ABA8E6FC39D85C7A794E2B99AD7B29FF8F3EEFCF2
                  E799806AFAF8EFFFFFFFFF9999E4D1C7F9F2E9B190869F5C50CBA696C9B4ACDE
                  C0C1E3CDBFE5CFC2E7CFC3DBBAAFA06D5DDFBCA6E0BEA3936953AA8A77996D4E
                  AC7F6EFBF4F1E7D4CAAD957FFAFAEFFFFFFFFF9999C3AEA4F2F8ECEEE6DA926A
                  5EF4EBDEFAFBF3FEF9F8FEFDFAFEFCFAFEFCFBFEFAF9D5C9C68F817B867A71BF
                  B5AAF5ECDE986B58EBD2C3FEFCF2BDB0A4C4B2A6FEFCFAFFFFFFFF9999856D64
                  FEF9ECFEFBECBCAA9EAF9B91FEFBF5FEFBF6FEFEF7FEFEF6FEFEF6FDFDF4FCFD
                  F4FEFEF6FEFEF6FDFBF2B5A097B19188FDF8EBFEF9EC8C786FF1E4E2FFFDFEFF
                  FFFFFFFFFFAF8E89DCBFB7FEF9EBF2EFE0877469D5C4BEF7EBE4FEF6EAFEF7EB
                  FEF8EDFEF8EDFDF4E9FEF4EAFCF0E5E1C7BE97716AF0EADEFDFAEEDDCAC1AC8E
                  88FCF7F4FEFEFFFFFFFFFFFFFFF1E1DC9C736CF7E9E0FDFAEED7D2C797898291
                  787298766D9A786F9C7A719D7C729D7A719E7C729F7C72B18A81E7CDC6FDFBF0
                  F9ECE395736DEADCD6FEFFFEFFFFFFFFFFFFFFFFFFF5F9F4C2B2AAB38C86FCEF
                  E6FCFBF0F7F5ECF2EBE5EEEAE2EFEBE3EEEAE1EEE9E1EFE9E1F0EBE4F2EEE5FC
                  F7EEFEFBF0FBF2EBB1908CBFAFAAFCFEFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  F6F7F1B39B93B59089F7ECE4FCF7EEFBFBF4FAFCF8F7FBF7F7FBF6FAFCF9F8FC
                  F7F9FDF9F9FDF9FCFDF5F6EEE3B79792AD928FFEFFFEFDFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFF3F5ECBCA69DA57872E2D3CCF1F4EBFDFCF6FEFAF5
                  FEF8F3FDF9F4FEFDF7FEFBF5F9F7F2DCD2CA9F877CB09891FDFDFCFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCF9EFDFC7BE967A739E
                  8C82CCBDAFEEE1D4F7EFE2F7EEE0F0E3D5CEBFB0A292848F7C6FD2C3B7FFFEFC
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFF8FEF3FDF8F0E5C9C3BE9281AC7362A56C5AA46A59AF7665BD9281E1C8B7FE
                  F5E4FEFDF1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
                OnClick = SpeedButton6Click
              end
              inherited SpeedButton7: TSpeedButton
                Enabled = False
              end
              inherited SpeedButton8: TSpeedButton
                Enabled = False
              end
              inherited SpeedButton11: TSpeedButton
                Enabled = False
              end
              inherited SpeedButton12: TSpeedButton
                Enabled = False
              end
              inherited SpeedButton23: TSpeedButton
                Enabled = False
              end
              inherited SpeedButton24: TSpeedButton
                Enabled = False
              end
              inherited SpeedButton25: TSpeedButton
                Hint = 'Ver registros da lixeira  - [VEI009]'
                OnClick = SpeedButton25Click
              end
              inherited SpeedButton26: TSpeedButton
                Enabled = False
              end
            end
            inherited GroupBox2: TGroupBox
              Height = 266
              ExplicitHeight = 266
              inherited ScrollBox2: TScrollBox
                Height = 249
                ExplicitHeight = 249
              end
            end
          end
        end
        inherited tsMemo: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 788
          ExplicitHeight = 536
          inherited pn_modal: TPanel
            inherited pn_modal_grid: TPanel
              inherited grid_modal: TDBGrid
                TitleFont.Color = clBlack
              end
            end
          end
        end
      end
    end
    inherited PanelFlash: TPanel
      Width = 43
      Height = 569
      ExplicitWidth = 43
      ExplicitHeight = 569
      inherited bMarketingHW: TBitBtn
        Top = 547
        Width = 41
        ExplicitTop = 547
        ExplicitWidth = 41
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
    inherited lbTextoProcessamento: TLabel
      Width = 477
      Height = 21
    end
  end
  inherited PopupMenu1: TPopupMenu
    Left = 332
    Top = 3
    object MarcarTodosVeiculosClick: TMenuItem
      Caption = 'Marcar Todos Ve'#237'culos'
      OnClick = MarcarTodosVeiculosClickClick
    end
    object DesmarcarTodosVeiculosClick: TMenuItem
      Caption = 'Desmarcar Todos Ve'#237'culos'
      OnClick = DesmarcarTodosVeiculosClickClick
    end
  end
  inherited PopupMenu2: TPopupMenu
    Left = 362
    Top = 3
  end
  inherited Timer1: TTimer
    Left = 302
    Top = 3
  end
  inherited ApplicationEventsPadrao: TApplicationEvents
    Left = 390
    Top = 3
  end
  object PopupMenuNFE: TPopupMenu
    Left = 424
    Top = 1
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
    Left = 526
    Top = 1
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
    Left = 492
    Top = 1
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
    Left = 556
    Top = 1
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
    Left = 588
    Top = 1
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
    Left = 620
    Top = 1
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
    Left = 461
    Top = 1
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
