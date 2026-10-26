inherited frmCadPromocao: TfrmCadPromocao
  Caption = 'Promo'#231#227'o'
  ClientWidth = 903
  Scaled = False
  ExplicitWidth = 911
  ExplicitHeight = 598
  PixelsPerInch = 96
  TextHeight = 13
  object Label60: TLabel [0]
    Left = 155
    Top = 46
    Width = 98
    Height = 13
    Caption = 'Num. Fabricante:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  inherited PanelFundo: TPanel
    Width = 903
    ExplicitWidth = 903
    inherited PanelLeft: TPanel
      Width = 898
      ExplicitWidth = 898
      inherited PageControl1: TPageControl
        Width = 896
        ExplicitWidth = 896
        inherited TabSheet1: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 888
          ExplicitHeight = 510
          inherited ScrollBox1: TScrollBox
            Width = 888
            ExplicitWidth = 888
            inherited PageControl3: TPageControl
              Width = 888
              ActivePage = tsCadastro
              ExplicitWidth = 888
              inherited TabSheet3: TTabSheet
                ExplicitLeft = 4
                ExplicitTop = 27
                ExplicitWidth = 880
                ExplicitHeight = 431
                inherited ScrollBox3: TScrollBox
                  Width = 880
                  ExplicitWidth = 880
                  inherited GroupBox1: TGroupBox
                    Width = 876
                    ExplicitWidth = 876
                  end
                end
              end
              object tsCadastro: TTabSheet
                Caption = 'tsCadastro'
                ImageIndex = 1
                object GroupBox4: TGroupBox
                  Left = 0
                  Top = 0
                  Width = 880
                  Height = 431
                  Align = alClient
                  Caption = 'Cadastro de Promo'#231#227'o'
                  TabOrder = 0
                  object Label22: TLabel
                    Left = 2
                    Top = 267
                    Width = 876
                    Height = 13
                    Align = alTop
                    Caption = 
                      '                      Datas de vencimento da Tabela de Pre'#231'o ser' +
                      #225' utilizado apenas no E-Commerce'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clRed
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = []
                    ParentFont = False
                    ExplicitWidth = 444
                  end
                  object Panel10: TPanel
                    Left = 2
                    Top = 15
                    Width = 876
                    Height = 172
                    Align = alTop
                    BevelOuter = bvNone
                    TabOrder = 0
                    object Label6: TLabel
                      Left = 95
                      Top = 24
                      Width = 37
                      Height = 13
                      Align = alCustom
                      Caption = 'Codigo:'
                      FocusControl = DBEdit1
                    end
                    object Label7: TLabel
                      Left = 82
                      Top = 80
                      Width = 50
                      Height = 13
                      Align = alCustom
                      Caption = 'Descricao:'
                      FocusControl = DBEdit2
                    end
                    object Label8: TLabel
                      Left = 78
                      Top = 51
                      Width = 54
                      Height = 13
                      Align = alCustom
                      Caption = 'Tipo Pre'#231'o:'
                    end
                    object Label19: TLabel
                      Left = 49
                      Top = 134
                      Width = 83
                      Height = 13
                      Align = alCustom
                      Caption = 'Recalcular pre'#231'o:'
                      FocusControl = DBEdit2
                    end
                    object Label24: TLabel
                      Left = 293
                      Top = 145
                      Width = 412
                      Height = 13
                      Align = alCustom
                      Caption = 
                        'Ao utilizar o markup / margem o pre'#231'o '#233' atualizado sem depender ' +
                        'desta configura'#231#227'o.'
                      FocusControl = DBEdit2
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clRed
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                      WordWrap = True
                    end
                    object Label25: TLabel
                      Left = 293
                      Top = 128
                      Width = 455
                      Height = 13
                      Align = alCustom
                      Caption = 
                        'Configura'#231#227'o utilizada exclusivamente ao informar no campo de va' +
                        'lor ou acr'#233'scimo / desconto.'
                      FocusControl = DBEdit2
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clRed
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                    end
                    object Label31: TLabel
                      Left = 9
                      Top = 106
                      Width = 123
                      Height = 13
                      Caption = 'Lan'#231'ar D'#233'bito ou Cr'#233'dito:'
                    end
                    object DBEdit1: TDBEdit
                      Left = 138
                      Top = 21
                      Width = 65
                      Height = 21
                      Align = alCustom
                      DataField = 'COD_PROMOCAO'
                      DataSource = dtmProdutos.dsPromocaoP
                      Enabled = False
                      TabOrder = 0
                    end
                    object DBEdit2: TDBEdit
                      Left = 138
                      Top = 75
                      Width = 625
                      Height = 21
                      Align = alCustom
                      CharCase = ecUpperCase
                      DataField = 'DESCR_PROMOCAO'
                      DataSource = dtmProdutos.dsPromocaoP
                      TabOrder = 3
                    end
                    object DBLookupComboBox2: TDBLookupComboBox
                      Left = 209
                      Top = 48
                      Width = 353
                      Height = 21
                      Align = alCustom
                      DataField = 'COD_TPPRECO'
                      DataSource = dtmProdutos.dsPromocaoP
                      Enabled = False
                      KeyField = 'COD_TPPRECO'
                      ListField = 'DESCR_TIPO'
                      ListSource = dtmProdutos.dsTipoPrecoP
                      TabOrder = 2
                    end
                    object DBEdit3: TDBEdit
                      Left = 138
                      Top = 48
                      Width = 65
                      Height = 21
                      Align = alCustom
                      DataField = 'COD_TPPRECO'
                      DataSource = dtmProdutos.dsPromocaoP
                      Enabled = False
                      TabOrder = 1
                    end
                    object DBComboBox1: TDBComboBox
                      Left = 138
                      Top = 131
                      Width = 145
                      Height = 21
                      Style = csDropDownList
                      CharCase = ecUpperCase
                      DataField = 'RECALC_PRECO'
                      DataSource = dtmProdutos.dsPromocaoP
                      ItemHeight = 13
                      Items.Strings = (
                        'N - N'#195'O'
                        'S - SIM')
                      TabOrder = 5
                    end
                    object DBComboBox5: TDBComboBox
                      Left = 138
                      Top = 103
                      Width = 145
                      Height = 21
                      Hint = 
                        'Lan'#231'ar d'#233'bitos e cr'#233'ditos na conta do colaborador quando configu' +
                        'rado na empresa'
                      Style = csDropDownList
                      CharCase = ecUpperCase
                      DataField = 'USAR_DEBCRED'
                      DataSource = dtmProdutos.dsPromocaoP
                      ItemHeight = 13
                      Items.Strings = (
                        'N - N'#195'O'
                        'S - SIM')
                      TabOrder = 4
                    end
                  end
                  object GroupBoxVenc: TGroupBox
                    Left = 2
                    Top = 187
                    Width = 876
                    Height = 80
                    Align = alTop
                    Caption = 'Vencimento'
                    TabOrder = 1
                    object Label9: TLabel
                      Left = 75
                      Top = 22
                      Width = 57
                      Height = 13
                      Caption = 'Data Inicial:'
                      FocusControl = DBEdit4
                    end
                    object Label10: TLabel
                      Left = 308
                      Top = 22
                      Width = 52
                      Height = 13
                      Caption = 'Data Final:'
                      FocusControl = DBEdit5
                    end
                    object Label11: TLabel
                      Left = 75
                      Top = 49
                      Width = 57
                      Height = 13
                      Caption = 'Hora Inicial:'
                      FocusControl = DBEdit6
                    end
                    object Label12: TLabel
                      Left = 308
                      Top = 49
                      Width = 52
                      Height = 13
                      Caption = 'Hora Final:'
                      FocusControl = DBEdit7
                    end
                    object SpeedButton59: TSpeedButton
                      Left = 448
                      Top = 19
                      Width = 22
                      Height = 48
                      Hint = 'Limpar dados de vencimento'
                      Glyph.Data = {
                        36050000424D3605000000000000360400002800000010000000100000000100
                        08000000000000010000420B0000420B00000001000000000000000000000084
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
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00414141414141
                        4141414141414141414141414141414141414141414141414141414100000000
                        0000004141414141414141002E2E2E2E2E2E000041414141414141002E2E2E2E
                        2E2E002D00414141414141002E2E2E2E2E2E002D2D0041414141414100444244
                        424442002D2D0041414141414100444244424442002D2D004141414141410044
                        4244424442002D2D0041414141414100444244424442002D0041414141414141
                        0044424442444200004141414141414141004442444244420041414141414141
                        4141000000000000414141414141414141414141414141414141414141414141
                        4141414141414141414141414141414141414141414141414141}
                      OnClick = SpeedButton59Click
                    end
                    object DBEdit4: TDBEdit
                      Left = 138
                      Top = 19
                      Width = 65
                      Height = 21
                      DataField = 'DATA_INI'
                      DataSource = DataSource1
                      TabOrder = 0
                      OnExit = DBEdit4Exit
                    end
                    object DBEdit5: TDBEdit
                      Left = 363
                      Top = 19
                      Width = 65
                      Height = 21
                      DataField = 'DATA_FIM'
                      DataSource = DataSource1
                      TabOrder = 1
                      OnExit = DBEdit5Exit
                    end
                    object DBEdit6: TDBEdit
                      Left = 138
                      Top = 46
                      Width = 65
                      Height = 21
                      DataField = 'HORA_INI'
                      DataSource = DataSource1
                      TabOrder = 2
                      OnExit = DBEdit6Exit
                    end
                    object DBEdit7: TDBEdit
                      Left = 363
                      Top = 46
                      Width = 65
                      Height = 21
                      DataField = 'HORA_FIM'
                      DataSource = DataSource1
                      TabOrder = 3
                      OnExit = DBEdit7Exit
                    end
                    object BitBtn9: TBitBtn
                      Left = 488
                      Top = 19
                      Width = 113
                      Height = 25
                      Hint = 'Atualizar Informa'#231#227'o dos Produtos'
                      Caption = 'Atualizar'
                      TabOrder = 4
                      OnClick = BitBtn9Click
                      Glyph.Data = {
                        36030000424D3603000000000000360000002800000010000000100000000100
                        18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFCFA7
                        A7A7A4A4A4CFCFCFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                        EFEFEFFFFFFFB1B1B1262626181818474747494949181818252525AFAFAFFFFF
                        FFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F9292929757575191919AAAAAAFCFCFCFF
                        FFFFFFFFFFFEFEFEADADAD191919818181FFFFFFFFFFFFFFFFFFFFFFFFD3D3D3
                        000000000000C2C2C2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE0E0E01919
                        19AFAFAFFFFFFFFFFFFFFFFFFFBABABA474747747474BCBCBCFFFFFFFFFFFFFF
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFABABAB272727FEFEFEFFFFFFFFFFFFFFFFFF
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFD
                        FD171717D0D0D0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF838383D0D0D0FFFFFFFFFFFFCDCDCD
                        888888FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                        FFFFFFFFFFFFFFFFFFFFFFFFFFCECECE1A1A1AFDFDFDFFFFFFFFFFFFFFFFFFFF
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFD
                        252525AFAFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEF8787875C5C
                        5C5F5F5FFFFFFFFFFFFFFFFFFFFFFFFFABABAB1C1C1CE2E2E2FFFFFFFFFFFFFF
                        FFFFFFFFFFFFFFFFFFFFFF7070700000005C5C5CFFFFFFFFFFFFFFFFFFFFFFFF
                        FFFFFF7C7C7C1B1B1BB1B1B1FEFEFEFFFFFFFFFFFFFDFDFDADADAD1919194040
                        40878787FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAAAAAA2222221A1A1A4A
                        4A4A4A4A4A181818252525AEAEAEFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFF
                        FFFFFFFFFFFFFFFFFFFDFDFDCCCCCCA4A4A4A5A5A5CFCFCFFEFEFEFFFFFFFFFF
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
                    end
                  end
                end
              end
              object tsCadastro2: TTabSheet
                Caption = 'tsCadastro2'
                ImageIndex = 2
                object GroupBox8: TGroupBox
                  Left = 0
                  Top = 0
                  Width = 880
                  Height = 431
                  Align = alClient
                  Caption = 'Cadastro Tabela'
                  TabOrder = 0
                  object Label27: TLabel
                    Left = 78
                    Top = 51
                    Width = 54
                    Height = 13
                    Align = alCustom
                    Caption = 'Tipo Pre'#231'o:'
                  end
                  object Label26: TLabel
                    Left = 82
                    Top = 80
                    Width = 50
                    Height = 13
                    Align = alCustom
                    Caption = 'Descricao:'
                    FocusControl = DBEdit11
                  end
                  object Label28: TLabel
                    Left = 49
                    Top = 133
                    Width = 83
                    Height = 13
                    Align = alCustom
                    Caption = 'Recalcular pre'#231'o:'
                    FocusControl = DBEdit11
                  end
                  object Label29: TLabel
                    Left = 293
                    Top = 127
                    Width = 455
                    Height = 13
                    Align = alCustom
                    Caption = 
                      'Configura'#231#227'o utilizada exclusivamente ao informar no campo de va' +
                      'lor ou acr'#233'scimo / desconto.'
                    FocusControl = DBEdit11
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clRed
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = []
                    ParentFont = False
                  end
                  object Label30: TLabel
                    Left = 293
                    Top = 144
                    Width = 412
                    Height = 13
                    Align = alCustom
                    Caption = 
                      'Ao utilizar o markup / margem o pre'#231'o '#233' atualizado sem depender ' +
                      'desta configura'#231#227'o.'
                    FocusControl = DBEdit11
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clRed
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = []
                    ParentFont = False
                    WordWrap = True
                  end
                  object Label32: TLabel
                    Left = 9
                    Top = 106
                    Width = 123
                    Height = 13
                    Caption = 'Lan'#231'ar D'#233'bito ou Cr'#233'dito:'
                  end
                  object DBEdit12: TDBEdit
                    Left = 138
                    Top = 48
                    Width = 65
                    Height = 21
                    Align = alCustom
                    DataField = 'COD_TPPRECO'
                    DataSource = dtmProdutos.dsTipoPpro
                    Enabled = False
                    TabOrder = 0
                  end
                  object DBComboBox2: TDBComboBox
                    Left = 209
                    Top = 48
                    Width = 145
                    Height = 21
                    Style = csDropDownList
                    DataField = 'DESCR_TIPO'
                    DataSource = dtmProdutos.dsTipoPpro
                    Enabled = False
                    ItemHeight = 13
                    Items.Strings = (
                      'LOCALIDADE'
                      'SETOR'
                      'CIDADE'
                      'QUANTIDADE')
                    TabOrder = 1
                  end
                  object DBEdit11: TDBEdit
                    Left = 138
                    Top = 75
                    Width = 625
                    Height = 21
                    Align = alCustom
                    CharCase = ecUpperCase
                    DataField = 'DESCR_TIPO'
                    DataSource = dtmProdutos.dsTipoPpro
                    Enabled = False
                    TabOrder = 2
                  end
                  object DBComboBox3: TDBComboBox
                    Left = 138
                    Top = 130
                    Width = 145
                    Height = 21
                    Style = csDropDownList
                    CharCase = ecUpperCase
                    DataField = 'RECALC_PRECO'
                    DataSource = dtmProdutos.dsTipoPpro
                    ItemHeight = 13
                    Items.Strings = (
                      'N - N'#195'O'
                      'S - SIM')
                    TabOrder = 4
                  end
                  object DBComboBox4: TDBComboBox
                    Left = 138
                    Top = 103
                    Width = 145
                    Height = 21
                    Hint = 
                      'Lan'#231'ar d'#233'bitos e cr'#233'ditos na conta do colaborador quando configu' +
                      'rado na empresa'
                    Style = csDropDownList
                    CharCase = ecUpperCase
                    DataField = 'USAR_DEBCRED'
                    DataSource = dtmProdutos.dsTipoPpro
                    ItemHeight = 13
                    Items.Strings = (
                      'N - N'#195'O'
                      'S - SIM')
                    TabOrder = 3
                  end
                end
              end
            end
            inherited Panel3: TPanel
              Width = 888
              ExplicitWidth = 888
              inherited BitBtn4: TBitBtn
                Left = 364
                Top = 10
                Hint = 'Salvar Registro - [PRO229]'
                ExplicitLeft = 364
                ExplicitTop = 10
              end
              inherited BitBtn5: TBitBtn
                Left = 445
                Top = 10
                Hint = 'Cancelar Registro'
                ExplicitLeft = 445
                ExplicitTop = 10
              end
              inherited BitBtn6: TBitBtn
                Left = 756
                Top = 10
                ExplicitLeft = 756
                ExplicitTop = 10
              end
            end
          end
        end
        inherited TabSheet2: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 888
          ExplicitHeight = 510
          inherited GroupBox3: TGroupBox
            Width = 888
            ExplicitWidth = 888
            inherited imgInformation: TImage
              Left = 862
              ExplicitLeft = 862
              ExplicitHeight = 88
            end
            object btSelectAll: TSpeedButton [6]
              Left = 708
              Top = 15
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
            object btUnSelectAll: TSpeedButton [7]
              Left = 735
              Top = 15
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
            inherited MaskEdit3: TMaskEdit
              Top = 46
              ExplicitTop = 46
            end
            inherited BitBtn1: TBitBtn
              Hint = 'Clique para pesquisar - [PRO223]'
            end
            inherited BitBtn3: TBitBtn
              Hint = 'Novo cadastro - [PRO224]'
            end
            inherited CheckBox3: TCheckBox
              Visible = False
            end
            inherited CheckBox1: TCheckBox
              Visible = False
            end
            object RadioGroup3: TRadioGroup
              Left = 257
              Top = 38
              Width = 599
              Height = 31
              Caption = 'Tipo de tabela:'
              Columns = 4
              ItemIndex = 0
              Items.Strings = (
                'Promo'#231#227'o'
                'Tabela de Pre'#231'o'
                'Loc / Setor / Cidade'
                'Quantidade')
              TabOrder = 11
              OnClick = RadioGroup3Click
            end
            object pnCorPromocao: TPanel
              Left = 775
              Top = 18
              Width = 66
              Height = 13
              BevelOuter = bvNone
              Caption = 'Vencida'
              Color = 11184895
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentBackground = False
              ParentFont = False
              TabOrder = 12
            end
          end
          inherited Panel1: TPanel
            Width = 888
            ExplicitWidth = 888
            inherited Splitter1: TSplitter
              ExplicitHeight = 376
            end
            object DBGrid4: TDBGrid [1]
              Left = 289
              Top = 57
              Width = 595
              Height = 376
              Align = alClient
              DataSource = dtmProdutos.dsTipoPpro
              TabOrder = 3
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
              OnKeyDown = DBGrid4KeyDown
              Columns = <
                item
                  Expanded = False
                  FieldName = 'COD_TPPRECO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'TIPO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DESCR_TIPO'
                  Width = 64
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'USAR_DEBCRED'
                  Width = 64
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'RECALC_PRECO'
                  Width = 64
                  Visible = True
                end>
            end
            inherited DBGrid1: TDBGrid
              Width = 595
              OnCellClick = DBGrid1CellClick
              OnDrawColumnCell = DBGrid1DrawColumnCell
              OnKeyDown = DBGrid1KeyDown
            end
            inherited Panel2: TPanel
              Width = 884
              ExplicitWidth = 884
              inherited SpeedButton1: TSpeedButton
                Hint = 'Editar Registro - [PRO225]'
              end
              inherited SpeedButton2: TSpeedButton
                Hint = 'Apagar Registro - [PRO226]'
                OnClick = SpeedButton2Click
              end
              inherited SpeedButton3: TSpeedButton
                Hint = 'Imprimir - [PRO231]'
                OnClick = SpeedButton3Click
              end
              inherited SpeedButton4: TSpeedButton
                Top = 5
                OnClick = SpeedButton25Click
                ExplicitTop = 5
              end
              inherited SpeedButton5: TSpeedButton
                Hint = 'Recuperar registro - [PRO228]'
                OnClick = SpeedButton5Click
              end
              inherited SpeedButton6: TSpeedButton
                Hint = 'Ordem das Promo'#231#245'es - [PRO245]'
                Glyph.Data = {
                  7A030000424D7A030000000000003A0100002800000018000000180000000100
                  08000000000040020000120B0000120B0000410000004100000000000000FFFF
                  FF00FF00FF00004B00000C9818000C97180011A0210011A02200119F220017A7
                  2C0018A72C0018A72D001EB037001FB1380025BA420025BB440025BA43002CC2
                  4F002DC24F002DC2500033CA5A0034CB5C0038D0640039D3660039D165003ED7
                  6D003DD56C004BBDFF0046B7FF0049BBFF0049BCFF004ABCFF0042B1FF0043B4
                  FF0044B4FF0045B6FF003AA9FF003CABFF003DABFF003FACFF0041AFFF0041B0
                  FF0035A3FF0036A3FF0037A3FF0038A6FF00308FD9003AA6FF00319CFF00329E
                  FF00339EFF0035A1FF002C95FF002681D9002E97FF002F99FF003099FF00268C
                  FF00288FFF002991FF002A92FF002C93FF001C74D9001D75D9000C4898000202
                  0202020202020202020202020202020202020202020202020202400202020202
                  0202020202020202020202020202020202403E40020202020202020202020202
                  0202020202020202403F393E4002020202030303030303030303030303020240
                  35373B393E400202020319191A161411100C0A070302402E292F31343A3E4002
                  020303030303030303030303030240404022262A404040020202020202020202
                  0202020202020202401B1C294002020202020202020202020202020202020202
                  401B1B1E40020202020303030303030303030303030302024040404040020202
                  020319191A161411100C0A070403020202020202020202020203030303030303
                  0303030303030202020202020202020202020202020202020202020202020202
                  0202020202020202020202020202020202020202020202020202020202020202
                  02030303030303030303030202020202404040404002020202031A1814120E0C
                  0908030202020202402C383C4002020202030303030303030303030202020202
                  4025333640020202020202020202020202020202020240404020243240404002
                  0202020202020202020202020202401B1B1C282D303D40020203030303030303
                  03030303030302401B1F23272B40020202031919191715130F0D0B0605030202
                  401B1D21400202020203030303030303030303030303020202401B4002020202
                  0202020202020202020202020202020202024002020202020202020202020202
                  020202020202020202020202020202020202020202020202020202020202}
                OnClick = SpeedButton6Click
              end
              inherited SpeedButton7: TSpeedButton
                Left = 405
                Visible = False
                ExplicitLeft = 405
              end
              inherited SpeedButton8: TSpeedButton
                Hint = 'Visualizar Produtos Promo'#231#227'o/Pre'#231'o Tabela'
                Glyph.Data = {
                  F6060000424DF606000000000000360000002800000018000000180000000100
                  180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
                  FF00FFA87D78B78183B78183B78183B78183B78183B78183B78183B78183B781
                  83B78183B78183B78183B78183B78183B78183B78183B78183B78183FF00FFFF
                  00FFFF00FFFF00FF7E7D7F4A667CBE9596F8E3C6F6DFBFF5DCB8F4D9B2F3D7AC
                  F3D4A7F2D2A0F0CF9AF0CE98F0CE98F0CE98F0CE98F0CE98F0CE98F1CF98EFCD
                  97B3897BFF00FFFF00FFFF00FFFF00FF6B9CC31E89E84B7AA3C89693F5DFC2F4
                  DCBCF3DAB6F2D7B1F1D4ABF1D2A5F0CF9FEFCD9AEECC97EECC97EECC97EECC97
                  EECC97EFCD97EDCB96B3897BFF00FFFF00FFFF00FFFF00FF4BB4FE51B5FF2089
                  E94B7AA2C69592F5DEC2F4DCBCF3DAB7F2D7B1F1D4ABF1D2A5F0CFA0EFCD9AEE
                  CC97EECC97EECC97EECC97EFCD97EDCB96B3897BFF00FFFF00FFFF00FFFF00FF
                  FF00FF51B7FE51B3FF1D87E64E7AA0CA9792F5DEC1F4DCBCF3D9B6F2D7B0F1D4
                  AAF1D2A5F0CFA0EECC99EECC97EECC97EECC97EFCD97EDCB96B3897BFF00FFFF
                  00FFFF00FFFF00FFFF00FFA97F7B51B7FE4EB2FF1F89E64E7BA2B99497F5DFC2
                  F4DCBCF3D9B6F2D7B0F1D4ABF1D2A6F0CFA0EECD9AEECC97EECC97EFCD97EDCB
                  96B3897BFF00FFFF00FFFF00FFFF00FFFF00FFAA807BF5E9DD52B8FE4BB1FF27
                  87D95F6A76E3C8B4A87875AD807BA97976AF807DC8A18DE0BD9AF0CFA0EECC99
                  EECC97EFCD97EDCB96B3897BFF00FFFF00FFFF00FFFF00FFFF00FFAD837DF5EC
                  E3FBF2E655BDFFB5D6EDA58785AB807AD0B6A3EEE4C7FCFAD7EDE4C6CDAFA0B1
                  8580D7B294F0CFA0EECC99EFCD97EDCB96B3897BFF00FFFF00FFFF00FFFF00FF
                  FF00FFB2887EF7EFE8FCF5ECFAEFE4C4A8A7B48780F1DEB7FFFDD6FFFFDAFFFF
                  DAFFFFDFFFFFEFEADDD8AB7D7ADFBD9AF0CF9FEFCD9AEDCA96B3897BFF00FFFF
                  00FFFF00FFFF00FFFF00FFB68B80F8F2EEFDF8F1FAF3EAB58681D4B399F8DBAA
                  FDF7D0FFFFDAFFFFE1FFFFF2FFFFFBFFFFFFC7A99EC8A18CF0D1A4F0D09FEDCB
                  98B3897BFF00FFFF00FFFF00FFFF00FFFF00FFBA8E82FAF6F4FEFCF8FCF6F0B1
                  847EEDD0A4F2C897FCF4CCFFFFDBFFFFE4FFFFF9FFFFFBFFFFECE4D9BFAE7F7B
                  F1D4AAF1D2A5EECD9EB3897CFF00FFFF00FFFF00FFFF00FFFF00FFBE9283FBF8
                  F7FFFFFEFEFAF6A97A76F9DEAAEFBA86F9E3B6FFFFD9FFFFDEFFFFE8FFFFEAFF
                  FFE0F8F5D5A97976F2D7B0F2D5ABEFCFA4B48A7DFF00FFFF00FFFF00FFFF00FF
                  FF00FFC29685FBF8F7FFFFFFFFFEFCB2857FEED4A9EFBB84F3CC98FBEEC4FFFF
                  DBFFFFDDFFFFDCFFFFDCE8DCC1AE807BF3D9B5F2D7B0F0D2A8B48B7EFF00FFFF
                  00FFFF00FFFF00FFFF00FFC69986FBF8F7FFFFFFFFFFFFB78A85D7BBA0FAE9C5
                  F4D3A6F4D09DF9E4B8FEF6CFFEFAD3FFFFDACAAE9CCAA596F4DCBBF4DAB6F1D5
                  AEB18A7FFF00FFFF00FFFF00FFFF00FFFF00FFCA9C88FBF8F7FFFFFFFFFFFFEB
                  DFDFB48A82F1EAE9FFF7E9F3CC98F0BD89F4CE9DFCE6B6F0E2BBAD817BE3C8B3
                  F4DEC0F3DBBAD9C4A7A0847DFF00FFFF00FFFF00FFFF00FFFF00FFCEA089FCF9
                  F7FFFFFFFFFFFFFFFFFFE0CECDB28985D3BBAEEFDCB2FBE3B0EED4A9D2B19AB1
                  847EDBBEB0F6E4CCEBD9C0D1C1ABB5A89798817CFF00FFFF00FFFF00FFFF00FF
                  FF00FFD2A38AFCF9F7FFFFFFFFFFFFFFFFFFFFFFFFEBDFDFB78F84AF827CA97A
                  76B2847ECCADA5E7D1C5FBEEDBE7DBC9C8BDAFBAB0A2B7AC9D9C837EFF00FFFF
                  00FFFF00FFFF00FFFF00FFD7A78CFCF9F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFEFCFDF9F4FCF5EEFCF5EBEEDDD1B28176AD8076AA7F76AB7F76AB7F
                  76AD8274FF00FFFF00FFFF00FFFF00FFFF00FFDAAB8DFCF9F8FFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFBFDF9F4FFFBF3E3CEC6B38176E3B585
                  E5AD6AE9A654EFA039B88285FF00FFFF00FFFF00FFFF00FFFF00FFDEAD8EFDFA
                  F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFCFFFEF9E5
                  D1CBB38176EFC48DF3BB6DF8B450B88285FF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFDEAD8EFDFAF8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFE5D4D0B38176EFC38CF3BA6CB88285FF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFDEAD8EFFFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9DBD9B38176F1C58BB88285FF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDAA482DAA482DAA482DAA482DA
                  A482DAA482DAA482DAA482DAA482DAA482DAA482DAA482DAA482B38176B88285
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
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
              inherited SpeedButton25: TSpeedButton
                Left = 179
                Hint = 'Ver registros da lixeira - [PRO230]'
                OnClick = SpeedButton25Click
                ExplicitLeft = 179
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
          ExplicitWidth = 888
          ExplicitHeight = 510
        end
        object TabSheet4: TTabSheet
          Caption = 'TabSheet4'
          ImageIndex = 3
          object qrpPromocao: TQuickRep
            Left = -2
            Top = 0
            Width = 794
            Height = 1123
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            DataSet = dtmProdutos.cdsPromocaoP
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
            OnPreview = qrpPromocaoPreview
            Options = [FirstPageHeader, LastPageFooter]
            Page.Columns = 1
            Page.Orientation = poPortrait
            Page.PaperSize = A4
            Page.Values = (
              100.000000000000000000
              2970.000000000000000000
              100.000000000000000000
              2100.000000000000000000
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
            PrevFormStyle = fsStayOnTop
            PreviewInitialState = wsMaximized
            PrevInitialZoom = qrZoomToWidth
            PreviewDefaultSaveType = stQRP
            object TitleBand1: TQRBand
              Left = 38
              Top = 38
              Width = 718
              Height = 83
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
                219.604166666666700000
                1899.708333333333000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              BandType = rbTitle
              object QRLabel1: TQRLabel
                Left = 3
                Top = 31
                Width = 202
                Height = 24
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  63.500000000000000000
                  7.937500000000000000
                  82.020833333333340000
                  534.458333333333400000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Cadastro de Promo'#231#227'o'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -19
                Font.Name = 'Arial'
                Font.Style = [fsItalic]
                OnPrint = QRLabel1Print
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 14
              end
              object QRLabel2: TQRLabel
                Left = 2
                Top = 61
                Width = 65
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  5.291666666666667000
                  161.395833333333300000
                  171.979166666666700000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Data/Hora:'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Arial'
                Font.Style = [fsBold, fsItalic]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
              object QRSysData1: TQRSysData
                Left = 73
                Top = 61
                Width = 69
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  193.145833333333300000
                  161.395833333333300000
                  182.562500000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                Color = clWhite
                Data = qrsDateTime
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Arial'
                Font.Style = [fsItalic]
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                FontSize = 10
              end
              object QRLabel3: TQRLabel
                Left = 607
                Top = 61
                Width = 47
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1606.020833333333000000
                  161.395833333333300000
                  124.354166666666700000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'P'#225'gina:'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Arial'
                Font.Style = [fsBold, fsItalic]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
              object QRSysData2: TQRSysData
                Left = 658
                Top = 61
                Width = 46
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1740.958333333333000000
                  161.395833333333300000
                  121.708333333333300000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                Color = clWhite
                Data = qrsPageNumber
                Transparent = False
                ExportAs = exptText
                FontSize = 10
              end
              object lbEmpresa: TQRLabel
                Left = 2
                Top = 10
                Width = 103
                Height = 24
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  63.500000000000000000
                  5.291666666666667000
                  26.458333333333330000
                  272.520833333333400000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'lbEmpresa'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -19
                Font.Name = 'Arial'
                Font.Style = [fsBold, fsItalic]
                OnPrint = lbEmpresaPrint
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 14
              end
            end
            object ColumnHeaderBand1: TQRBand
              Left = 38
              Top = 121
              Width = 718
              Height = 33
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
                87.312500000000000000
                1899.708333333333000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              BandType = rbColumnHeader
              object QRShape1: TQRShape
                Left = 3
                Top = 1
                Width = 734
                Height = 3
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  7.937500000000000000
                  7.937500000000000000
                  2.645833333333333000
                  1942.041666666667000000)
                Brush.Color = clBlack
                Shape = qrsRectangle
                VertAdjust = 0
              end
              object QRShape2: TQRShape
                Left = 3
                Top = 27
                Width = 734
                Height = 3
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  7.937500000000000000
                  7.937500000000000000
                  71.437500000000000000
                  1942.041666666667000000)
                Brush.Color = clBlack
                Shape = qrsRectangle
                VertAdjust = 0
              end
              object QRLabel4: TQRLabel
                Left = 4
                Top = 7
                Width = 57
                Height = 20
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  52.916666666666670000
                  10.583333333333330000
                  18.520833333333330000
                  150.812500000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'C'#243'digo'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -16
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 12
              end
              object QRLabel5: TQRLabel
                Left = 67
                Top = 7
                Width = 78
                Height = 20
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  52.916666666666670000
                  177.270833333333300000
                  18.520833333333330000
                  206.375000000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Descri'#231#227'o'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -16
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 12
              end
            end
            object DetailBand1: TQRBand
              Left = 38
              Top = 154
              Width = 718
              Height = 19
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
                50.270833333333330000
                1899.708333333333000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              BandType = rbDetail
              object QRDBText2: TQRDBText
                Left = -43
                Top = 0
                Width = 104
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  -113.770833333333300000
                  0.000000000000000000
                  275.166666666666700000)
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Color = clWhite
                DataSet = dtmProdutos.cdsPromocaoP
                DataField = 'COD_PROMOCAO'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 9
              end
              object QRDBText3: TQRDBText
                Left = 67
                Top = 0
                Width = 120
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  177.270833333333300000
                  0.000000000000000000
                  317.500000000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Color = clWhite
                DataSet = dtmProdutos.cdsPromocaoP
                DataField = 'DESCR_PROMOCAO'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 9
              end
            end
            object PageFooterBand1: TQRBand
              Left = 38
              Top = 173
              Width = 718
              Height = 36
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
                95.250000000000000000
                1899.708333333333000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              BandType = rbPageFooter
              object QRLabel15: TQRLabel
                Left = 8
                Top = 10
                Width = 210
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  21.166666666666670000
                  26.458333333333330000
                  555.625000000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'HW Sistemas e Computadores Ltda'
                Color = clWhite
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
              object QRShape3: TQRShape
                Left = 3
                Top = 4
                Width = 734
                Height = 3
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  7.937500000000000000
                  7.937500000000000000
                  10.583333333333330000
                  1942.041666666667000000)
                Brush.Color = clBlack
                Shape = qrsRectangle
                VertAdjust = 0
              end
            end
          end
        end
        object TabSheet5: TTabSheet
          Caption = 'TabSheet5'
          ImageIndex = 4
          object GroupBox5: TGroupBox
            Left = 0
            Top = 0
            Width = 888
            Height = 510
            Align = alClient
            Caption = 'Ordem das Promo'#231#245'es'
            TabOrder = 0
            object Panel4: TPanel
              Left = 2
              Top = 15
              Width = 884
              Height = 82
              Align = alTop
              TabOrder = 0
              object SpeedButton9: TSpeedButton
                Left = 388
                Top = 19
                Width = 51
                Height = 45
                Hint = 'Ordenar para cima -[PRO243]'
                Flat = True
                Glyph.Data = {
                  16060000424D1606000000000000D60300002800000018000000180000000100
                  08000000000040020000120B0000120B0000E8000000E800000000000000FFFF
                  FF00FF00FF00012F0100EDF8ED00FEFFFE000144030001430300013802000136
                  020001350200025604000132020002550400024E040002460400034D0500019C
                  0800019C070001590500029D0A00014B04000149040001460400039E0B00039A
                  0B000275070002700700026C0700026A0600014003000387090003810900025E
                  050002560600037F0900037B0900037509000366070002440500035D0600023D
                  0400046D0800034F07000341060003A70C0003A40C0003A10C00039E0C00039D
                  0D00049F0D00049F0F0006A0120007A1130008A11100055F0C0013A71D001EAD
                  29001FAF2A001FAD2A002DB53700049F110005A5120005A0140004750D0006A4
                  150006A1140004540B0006700F000F921C001C9E280023B1310028B2330028A1
                  320038BA43008EDA9500D4F2D70007A9180007A3170007A1170008A3190009B0
                  1C00055F0F0009A419000BA51C000E8B1C00149C24001597240022B13200AAE3
                  B000B0E6B600D5F2D800D7F2DA00DAF3DD0009A61D000AA41F000BA521000769
                  1400076713000FA724000CAD27000BA523000CA726000CA724000A761C0019A0
                  2F001BA03100F6FCF7000DA928000DA729000FB02D000EA72A000FA92B000FA6
                  2C000D80230014912B0019A331001A963000CFF0D5000DA92C0010A92F0011AA
                  310028B5440036BB530012AD340013AC370013AB360016AC3A0013902F001691
                  32001D9A390023A1400026A9430028A946002FBA4F00D5F2DC0014B83C0016B2
                  3D0016AD3E001CB141007FD79600C1EDCC00E7F7EB0013AC3E0015A63C0018B1
                  41001EB4490023B54C0039BF5F0043C16500E0F6E60014AF410017B0460019B0
                  450020B74C001FAF490049C16C004FC473007FD79A0014AF460015B0480016AF
                  49001CB850001BB24C001FB5510020B5510022B6530022B5530023B5540025B7
                  560029B859002EBA5A004DC573006BD18B00EFFBF300F6FCF80016AF4A001CB2
                  4F0021BA560021B5530026B6570028B7590030BC620035BC640037BF670039BF
                  68003CC06A003EC06C0040C16D0050C6790076D5980088DCA6002ABF60003BC4
                  6D0043C5730058CC84005ACE860059CB82005ECC86005DCB86006FD3930073D4
                  98008CDCAA0095DEB00099E1B4009DE1B700A5E5BC00A4E3BC00A6E5BD00AAE5
                  C000ACE6C200B1E9C600C5EFD500D0F2DD00F0FBF4005CD089006CD495006DD5
                  970076D89D0081D9A4008ADEAC0093DEB000A0E2BA00A7E6C000B5E9C900BDED
                  D00095E2B500B2E9C9009AE3BA00F2FBF600B5EACE00F7FCFA00020202020202
                  02020C0C0A1E1E0A0C0C0202020202020202020202020202030C061D231F1F20
                  1B150A0C02020202020202020202020F071A192D2E2F2F2E2D30230E0A020202
                  0202020202022B22312D2F303030303030302D2F26090202020202020243374D
                  3E323018111218303030302F2D1C0902020202022952645E4F343014385B0559
                  32303030302D1D0A020202022C716E655E4E30303A6B015B36303030302F2E16
                  020202106888786C5F3D3330396B014C3630303030302D240A02021090917D6F
                  3F323232396B014C363030303030302F06020D62A2988A6D353030303B6B014C
                  363030303030302D21080B72B2A3978B63335354476B014C363030303030182D
                  1A082880C0A4A6A59E8C939294E7015B36304A4B3C30182D23092682C2B4B3B3
                  D601CEA7BAE7015C304804015D30302E20172A82D7B9B3B3AE0101CBBCAF0176
                  587601015A35332D23082575D9C4A5B3D1010105E0D601968D0101877A6D422D
                  1B080255D8BFC1B0B5D2010101010101010196867760342D130202459CDFBEAA
                  A0A9D00101010101018E7B66605041331E0202026AE4D3C7A89FA8DE01010101
                  AE957870675F514002020202499CE6D3C5AAA1A7CC0101AFAC8F7E7970645F27
                  020202020256ADD4E1C9BBA4B1DDE5C6A399917F7C6E520202020202020257D8
                  D4D5CFC8BDB9B6B7B8B8AB9A8962020202020202020202469DE4E1D4E3CDCADB
                  C9C3C19B6102020202020202020202024674BDDBE2E2DCDAC4B7813702020202
                  0202020202020202020246698484858373440202020202020202}
                ParentShowHint = False
                ShowHint = True
                OnClick = SpeedButton9Click
              end
              object SpeedButton10: TSpeedButton
                Left = 445
                Top = 19
                Width = 51
                Height = 45
                Hint = 'Ordenar para baixo - [PRO244]'
                Flat = True
                Glyph.Data = {
                  2E060000424D2E06000000000000EE0300002800000018000000180000000100
                  08000000000040020000120B0000120B0000EE000000EE00000000000000FFFF
                  FF00FF00FF00012F0100EDF8ED00F4FBF400FEFFFE0001440300014303000138
                  02000136020001350200025604000132020002550400024E040002460400034D
                  0500019C090001590500014B04000149040001460400039E0B00039A0B000275
                  070002700700026C0700026A0600014003000387090003810900025E05000256
                  0600037F0900037B0900037509000366070002440500035D0600023D0400046D
                  0800034F07000341060003A70C0003A40C0003A10C00039E0C00039D0D00049F
                  1000049F0F00049E0D0008A11100055F0C001CAC26001EAD290021AF2C002DB5
                  370032B73C0075D07B009CDEA100E5F7E600EDFAEE0005A5120005A012000475
                  0D0006A4150006A1130006A1140004540B0006700F0009A316000F921C001C9E
                  280023B1310028B2330029B4340028A1320038BA43003BBB450046BF500084D7
                  8C008EDA95008ED9950096DC9C00A5E2AB00AFE5B400BCEAC000CCEFCF00CEEF
                  D100EEFAEF0007A9180007A3170007A1170008A3190009B01C00055F0F000BA5
                  1B000E8B1C00149C2400159724009ADEA100D5F2D800D7F2DA00DAF3DD0009A6
                  1D000AA41F000BA521000769140007671300D1F0D500DDF4E000F3FBF4000CAD
                  27000BA523000CA726000CA724000A761C0019A02F001BA0310084D891000DA9
                  28000DA729000FB02D000EA72A000FA92B000FA62C000D80230014912B0019A3
                  31001A9630000DA92C000EA92D000FAA30000FAA2F000FA92E0010A92F0011AA
                  310015AD350016AD3600D7F3DD0012AD340013AC370013AB360016AD380016AC
                  3A0013902F00169132001D9A390023A1400026A9430028A9460014B83C0016B2
                  3D0016AD3E001AB03F001CB1410013AC3E0015AD400015A63C0018B141001EB4
                  490036BD5D0014AF410017B0460019B0450020B74C001FAF490049C16C004FC4
                  7300D9F3E10014AF460015B0480016AF49001AB14C001CB850001BB24C001CB2
                  4E001FB4510020B5510022B6530022B5530023B5540029B859002EBA5A006BD1
                  8B00A3E2B700EFFBF30016AF4A0021BA560021B5530026B6570028B85A0030BC
                  620033BC630035BC640037BF670039BF68003FC16C0040C16E0040C16D0050C6
                  790076D5980082D9A10088DCA60088DAA500BAEBCB00DAF4E3002ABF60003BC4
                  6D0043C5730058CC84005ACE860059CB82005DCB86006FD3930073D498008CDC
                  AA009DE1B700A4E3BC00B1E9C600C5EFD500D0F2DD005CD089006CD495006DD5
                  970076D89D0081D9A4008ADEAC00A7E6C000BDEDD000DDF4E60095E2B500B2E9
                  C9009AE3BA00B5EACE00F8FCFA00F7FCFA0002020202020202020D0D0B1D1D0B
                  0D0D0202020202020202020202020202030D071C221E1E1F1A140B0D02020202
                  02020202020202100819182C2D2E2E2D2C2F220F0B0202020202020202022A21
                  302C2E2F2F2F2F2F2F2F2C2E250A0202020202020245355B3F332F17123B5A50
                  2F2F2F2E2C1B0A0202020202286071695D402F2F510101704F2F2F2F2F2C1C0B
                  020202022B7E7B72695C3253010101013E3A2F2F2F2E2D150202021175988579
                  6A47540101010101013D4C2F2F2F2C230B0202119FA08E7C613C010101010101
                  01016F382F2F2F2E07020E6DAFA49A7A65010106555A016F5701016E362F2F2C
                  20090C7FBDB0A39C5A0101784A05015837590101562F172C19092792D0B2B4B3
                  BB01BAA1A2ED01662F4B0401682F172C220A2594D2BFBEBECBCDB7B5C6ED0167
                  342F4E52392F2F2D1F162994DFC5BEBEBEBEBEBEC8EC018C614444313243322C
                  22092482E1D4B2BEBEBEBEB5C6ED01AA8A87847A7A7A442C1A090262E0CCD1BC
                  B5BEBEBEC7ED01AA8B858686836B402C13020248A8E5CAB7ACB2BEBEC8EC01CF
                  90857D736B5E42321D02020277EADCD6B6ABB2BEC7EC01E79B8F887D746A5F41
                  020202024DA8EBDCD5B7ADB2C2E706CE9E9D8F897D716A26020202020263B9DD
                  E6D8C6B2B1C0BEAEB0A5A0918D7B600202020202020264E0DDDEDBD7C9C5C1C3
                  C4C4B8A6996D02020202020202020249A9EAE6DDE9DAD9E3D8D3D1A76C020202
                  02020202020202024981C9E3E8E8E4E2D4C39335020202020202020202020202
                  020249769696979580460202020202020202}
                ParentShowHint = False
                ShowHint = True
                OnClick = SpeedButton10Click
              end
              object SpeedButton13: TSpeedButton
                Left = 718
                Top = 19
                Width = 51
                Height = 45
                Hint = 'Voltar'
                Flat = True
                Glyph.Data = {
                  F6060000424DF606000000000000360000002800000018000000180000000100
                  180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FF8A27038A27038A2703FF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FF8A2703A63A01AF41018C2802892603
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF8A2603AC4001C7
                  5400AF41018B27028A2703FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FF8A27038B2803B14301C65200AB3F018A27038A2703FF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FF8825038F2A02B74700C55200A53A018825038925
                  02FF00FFFF00FFFF00FF8A270386230287230288240388250388250388250388
                  25038825038825038825038825038A2703FF00FFFF00FF882503952E02BD4C00
                  C250009A3201872403892603FF00FFFF00FF8E2903A53E08A43D059E36039D33
                  019D34019D34019D34019D34019D34019E34019C33018F29038A2703FF00FFFF
                  00FF882503993201C04F00BA4900902A02892603FF00FFFF00FF932F05E57D1E
                  E27916CF6209C45202C04D00C45000C45100C45100C45100C55100C653009E35
                  01882503FF00FFFF00FFFF00FF8825039F3601C45100AB3E01892603892502FF
                  00FF932F05ED8B2AF08C26E17817D3660BBA4B03A03501A43901A43901A43901
                  A53A01A33901902B028A2703FF00FFFF00FFFF00FFFF00FF892603AF4101C14F
                  00962E02882603FF00FF932E05EF922FFC9D33E27D20E57D1ACF640D922D0383
                  22028825038825038825038825038A2703FF00FFFF00FFFF00FFFF00FFFF00FF
                  8825039A3302C45100AA3D01872503882603932E05EF912EFFA437B44E11D56F
                  1CEF871FC65B0C8B2802882402FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FF902B02BD4C00B444008B2803882603932E05EF912E
                  FFA738A6410C973206EE8B28F08920C1570D8A2602882402FF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF8C2802B74700B849008E290288
                  2603932E05EF912EFFA738AD470E7D1B00AA450DF7962DF38C23C1580E8A2702
                  882402FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF8E2902BA49
                  00BA49008E2902882603932E05EF912EFFA638AC470E842101832001B24D11FB
                  9C31F69025C65D108F2A03862302FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  882503962F02C14F00B545008B2802882603932E05EF912EFFA638AC470E8421
                  01FF00FF832001B04B10F89930F89628D16913973104842301FF00FFFF00FFFF
                  00FFFF00FF8A2703892603AD4001C55200A93D01882503FF00FF932E05EF912E
                  FFA638AC470E842101FF00FFFF00FF831F00A7430DF0912DFE9C2DDD7418A33B
                  06882401862302872503872503892603A53A01C25000BF4D00952D02892603FF
                  00FF932E05EF912EFFA638AC470E842101FF00FFFF00FFFF00FF832001993507
                  DA7823FC9A2DED841FC55A0DA63E059C33029C3301AF4101C45100C04E009F35
                  01882503FF00FFFF00FF932F05F49832FFB03CAD490F842101FF00FFFF00FFFF
                  00FFFF00FF862301892502B44E11E07D22EE8820E57915D36509C75602C04D00
                  B14201972F02882503FF00FFFF00FFFF00FF8B2803C7661BD978239733068825
                  02FF00FFFF00FFFF00FFFF00FFFF00FF8925028321018E2A03A43F0AB14B0DAF
                  4709A13904932D028A2703892603FF00FFFF00FFFF00FFFF00FFFF00FF872302
                  882401892502FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF8826
                  03862301862301862302882503892603FF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                ParentShowHint = False
                ShowHint = True
                OnClick = SpeedButton13Click
              end
            end
            object Panel5: TPanel
              Left = 2
              Top = 97
              Width = 884
              Height = 352
              Align = alTop
              Caption = 'Panel5'
              TabOrder = 1
              object DBGrid2: TDBGrid
                Left = 1
                Top = 1
                Width = 882
                Height = 350
                Align = alClient
                DataSource = dtmProdutos.dsPromocaoP
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
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
        object TabSheet6: TTabSheet
          Caption = 'TabSheet6'
          ImageIndex = 5
          object Panel9: TPanel
            Left = 0
            Top = 462
            Width = 888
            Height = 48
            Align = alBottom
            BevelKind = bkTile
            BevelOuter = bvNone
            TabOrder = 1
            object Label18: TLabel
              Left = 55
              Top = 15
              Width = 148
              Height = 13
              Caption = 'Cadastro Sequ'#234'ncial  (F2)'
              FocusControl = CheckBox2
              Font.Charset = ANSI_CHARSET
              Font.Color = clTeal
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              OnClick = LabelSeqClick
            end
            object CheckBox2: TCheckBox
              Left = 23
              Top = 13
              Width = 17
              Height = 15
              BiDiMode = bdLeftToRight
              Color = clBtnFace
              Ctl3D = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clTeal
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentBiDiMode = False
              ParentColor = False
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 2
              OnClick = CheckCadSeqClick
            end
            object BitBtn7: TBitBtn
              Left = 364
              Top = 10
              Width = 75
              Height = 25
              Hint = 'Salvar Registro - [PRO229]'
              Caption = '&OK'
              TabOrder = 0
              OnClick = BitBtn7Click
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
            object BitBtn8: TBitBtn
              Left = 445
              Top = 10
              Width = 75
              Height = 25
              Hint = 'Cancelar Registro'
              Caption = '&Cancela'
              TabOrder = 1
              OnClick = BitBtn8Click
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
          object GroupBox68: TGroupBox
            Left = 0
            Top = 0
            Width = 888
            Height = 73
            Cursor = crMultiDrag
            Align = alTop
            BiDiMode = bdLeftToRight
            Caption = 'Promo'#231#227'o'
            Ctl3D = True
            ParentBiDiMode = False
            ParentCtl3D = False
            TabOrder = 0
            object DBText27: TDBText
              Left = 88
              Top = 24
              Width = 55
              Height = 13
              Alignment = taCenter
              AutoSize = True
              BiDiMode = bdLeftToRight
              DataField = 'DESCR_PROMOCAO'
              DataSource = dtmProdutos.dsPromocaoP
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentBiDiMode = False
              ParentFont = False
              Transparent = False
            end
            object DBText28: TDBText
              Left = 54
              Top = 47
              Width = 100
              Height = 17
              DataField = 'COD_PROMOCAO'
              DataSource = dtmProdutos.dsPromocaoP
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBText29: TDBText
              Left = 235
              Top = 47
              Width = 70
              Height = 17
              DataField = 'DATA_INI'
              DataSource = dtmProdutos.dsPromocaoP
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label201: TLabel
              Left = 8
              Top = 47
              Width = 44
              Height = 13
              Caption = 'Codigo: '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label202: TLabel
              Left = 160
              Top = 47
              Width = 70
              Height = 13
              Caption = 'Data Inicial: '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBText30: TDBText
              Left = 389
              Top = 47
              Width = 68
              Height = 17
              DataField = 'DATA_FIM'
              DataSource = dtmProdutos.dsPromocaoP
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label203: TLabel
              Left = 321
              Top = 47
              Width = 59
              Height = 13
              BiDiMode = bdLeftToRight
              Caption = 'Data Final:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentBiDiMode = False
              ParentFont = False
            end
            object Label216: TLabel
              Left = 480
              Top = 47
              Width = 67
              Height = 13
              Caption = 'Hora Inicial:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBText32: TDBText
              Left = 553
              Top = 48
              Width = 88
              Height = 17
              DataField = 'HORA_INI'
              DataSource = dtmProdutos.dsPromocaoP
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBText33: TDBText
              Left = 709
              Top = 47
              Width = 106
              Height = 17
              DataField = 'HORA_FIM'
              DataSource = dtmProdutos.dsPromocaoP
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label218: TLabel
              Left = 644
              Top = 47
              Width = 59
              Height = 13
              Caption = 'Hora Final:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
          end
          object PageControl2: TPageControl
            Left = 0
            Top = 73
            Width = 888
            Height = 389
            ActivePage = TabSheet7
            Align = alClient
            Style = tsFlatButtons
            TabOrder = 2
            object TabSheet7: TTabSheet
              Caption = 'TabSheet7'
              object GroupBox6: TGroupBox
                Left = 0
                Top = 0
                Width = 880
                Height = 358
                Align = alClient
                TabOrder = 0
                object Panel7: TPanel
                  Left = 2
                  Top = 15
                  Width = 876
                  Height = 66
                  Align = alTop
                  BevelOuter = bvNone
                  TabOrder = 0
                  object SpeedButton14: TSpeedButton
                    Left = 814
                    Top = 7
                    Width = 51
                    Height = 45
                    Hint = 'Voltar'
                    Flat = True
                    Glyph.Data = {
                      F6060000424DF606000000000000360000002800000018000000180000000100
                      180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
                      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                      FF00FFFF00FFFF00FFFF00FF8A27038A27038A2703FF00FFFF00FFFF00FFFF00
                      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                      00FFFF00FFFF00FFFF00FFFF00FFFF00FF8A2703A63A01AF41018C2802892603
                      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF8A2603AC4001C7
                      5400AF41018B27028A2703FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                      FF8A27038B2803B14301C65200AB3F018A27038A2703FF00FFFF00FFFF00FFFF
                      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                      FF00FFFF00FFFF00FFFF00FF8825038F2A02B74700C55200A53A018825038925
                      02FF00FFFF00FFFF00FF8A270386230287230288240388250388250388250388
                      25038825038825038825038825038A2703FF00FFFF00FF882503952E02BD4C00
                      C250009A3201872403892603FF00FFFF00FF8E2903A53E08A43D059E36039D33
                      019D34019D34019D34019D34019D34019E34019C33018F29038A2703FF00FFFF
                      00FF882503993201C04F00BA4900902A02892603FF00FFFF00FF932F05E57D1E
                      E27916CF6209C45202C04D00C45000C45100C45100C45100C55100C653009E35
                      01882503FF00FFFF00FFFF00FF8825039F3601C45100AB3E01892603892502FF
                      00FF932F05ED8B2AF08C26E17817D3660BBA4B03A03501A43901A43901A43901
                      A53A01A33901902B028A2703FF00FFFF00FFFF00FFFF00FF892603AF4101C14F
                      00962E02882603FF00FF932E05EF922FFC9D33E27D20E57D1ACF640D922D0383
                      22028825038825038825038825038A2703FF00FFFF00FFFF00FFFF00FFFF00FF
                      8825039A3302C45100AA3D01872503882603932E05EF912EFFA437B44E11D56F
                      1CEF871FC65B0C8B2802882402FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                      00FFFF00FFFF00FFFF00FF902B02BD4C00B444008B2803882603932E05EF912E
                      FFA738A6410C973206EE8B28F08920C1570D8A2602882402FF00FFFF00FFFF00
                      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF8C2802B74700B849008E290288
                      2603932E05EF912EFFA738AD470E7D1B00AA450DF7962DF38C23C1580E8A2702
                      882402FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF8E2902BA49
                      00BA49008E2902882603932E05EF912EFFA638AC470E842101832001B24D11FB
                      9C31F69025C65D108F2A03862302FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                      882503962F02C14F00B545008B2802882603932E05EF912EFFA638AC470E8421
                      01FF00FF832001B04B10F89930F89628D16913973104842301FF00FFFF00FFFF
                      00FFFF00FF8A2703892603AD4001C55200A93D01882503FF00FF932E05EF912E
                      FFA638AC470E842101FF00FFFF00FF831F00A7430DF0912DFE9C2DDD7418A33B
                      06882401862302872503872503892603A53A01C25000BF4D00952D02892603FF
                      00FF932E05EF912EFFA638AC470E842101FF00FFFF00FFFF00FF832001993507
                      DA7823FC9A2DED841FC55A0DA63E059C33029C3301AF4101C45100C04E009F35
                      01882503FF00FFFF00FF932F05F49832FFB03CAD490F842101FF00FFFF00FFFF
                      00FFFF00FF862301892502B44E11E07D22EE8820E57915D36509C75602C04D00
                      B14201972F02882503FF00FFFF00FFFF00FF8B2803C7661BD978239733068825
                      02FF00FFFF00FFFF00FFFF00FFFF00FF8925028321018E2A03A43F0AB14B0DAF
                      4709A13904932D028A2703892603FF00FFFF00FFFF00FFFF00FFFF00FF872302
                      882401892502FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF8826
                      03862301862301862302882503892603FF00FFFF00FFFF00FFFF00FFFF00FFFF
                      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                    ParentShowHint = False
                    ShowHint = True
                    OnClick = SpeedButton13Click
                  end
                  object SpeedButton15: TSpeedButton
                    Left = 405
                    Top = 3
                    Width = 51
                    Height = 45
                    Hint = 'Alterar Produto - [PRO239]'
                    Flat = True
                    Glyph.Data = {
                      76060000424D7606000000000000360400002800000018000000180000000100
                      08000000000040020000120B0000120B0000000100000000000000000000FFFF
                      FF0022212300534E5700FF00FF0041353800A4676900A5686B007A494A005A35
                      35008B555500804E4E0091595900965D5D008B565600734747008C5757009560
                      6000AA6E6E00A96D6D00A76C6C00A66B6B008C5B5B0091606000B77A7A00B679
                      7900B87B7B00BB7E7E00BA7D7D009C696900CB8C8C00CA8B8B00C98B8B00C78A
                      8A00CC8E8E00DA9A9A00D9999900C2898900D99A9A00DC9D9D00E1A1A100DA9C
                      9C00E2A3A300EBAAAA00E2A4A400E1A3A300643B3A00734847007B504F005D38
                      360093656000E2D0CE009566600093655F009869630084544C009F675B009E6E
                      6400A3726600DDC7C200FBF7F6009D6D5F00865D51007350460062443C00A775
                      68009F6F6000AC796900583F3700533C3500DDC4BC0096695A00B17E6B00FFFC
                      FB00BB846E00B6816C00BCA19600DAC0B600BBA19600CB917300C58C7000C089
                      6F00FCF8F600FAF6F400CF8E6800D4987500CF967400F6EEE900F8F3F000AA78
                      56003C383500FEF7F200ECD5C200E1CCBB003E3935006A554200F2E2D300FAEE
                      E300F4EAE100B77D460066523F0064513E0065524000EFDAC500F2E6DA00FBF2
                      E900FEF7F000FDF8F300EAB2730062503D00604F3D00EED4B800F0DAC200F6E3
                      CE00F0DECB00F7E6D300F4E3D000F8EEE300FBF3EA00EFA75100EDB57200EAB4
                      7400F2D5B100E9CCAB00F4DEC500F4E1CA00F3E0CA00F7E7D400FAEAD700F8EA
                      D900F7EADA00F8EBDC008E745100E5BC8400A4865F00B29268009E835F00E1BB
                      88006C594100897253006A5841008E775900DEBB8C00AA8F6B00C6A67E007764
                      4C00E1C09300C1A57F00836F5600E6C79D00C9AD89008C796000EDCEA700D9BD
                      9900E6CEAF00F2DABC00EAD4B600F4DEC000AC9D8A00F6E1C600F7E5CE00F6E6
                      D100F8EBDA00FAEEDE00FBF2E600E1B77900EABF7F00CCA66E00E9BD7F00E7BC
                      7E00E5BB7D00DEB57900DAB17700D9B17600E3BA7D00D1AB7300C09C6900A989
                      5D009A7E5500E7BC8100E1B77D00C7A36F00BC996900B2916300D1AB7500826C
                      4B00987D5800DAB47F00C7A474007B664800B89A6F007E694C00766347006F5D
                      4300D1AF7F009D876700F0D8B700EBD8BD00FCF6ED00FCF7F000E3BA7B00FEFB
                      F600FFFAEF00FFFEFB00FFFEF700FFFFFE003A494800748686003443440000BD
                      FF0000B1F2004E6C760000AAEA0000A6E600009FDE000093D100097BAB001A3E
                      4D000087C4000084C100028AC4000B4159000C3C5200113B4E00008CD100036A
                      9D0004689A000459830005679800064F7500182A33001B506E00315065003547
                      56002A34400041485500012BA700001C9D002D4FF6005270FC00021DB100031E
                      B1000420B8000725DC000F2ECC001839E3000C21BF00010D9D001322BD001624
                      BF0001099700010A9700050DA50000058F00000082001F1F2100040404040404
                      0404040404040404040404040404040404043506060606060606060606060606
                      06060606060404040404356F9B7A9895928E8985B3A9A8A8A8A8A6A942040404
                      0404355C9DC47B99969390C2BBB4AEA9A8A8A6A942040404040435679F9B9A02
                      5E97C38FBEBCB8ABAAA9A6A94204040404043272A07C9C5AFFE6D0948D8887B5
                      ADAEA9A942040404040434608071709EDFE2E5DECE918B86B6AFA5C842040404
                      04043668A37F7DC5D9E1E4E7EA055FBFBAB7A7AC3D04040404043962A483737E
                      CFE3E811120D2E66C084B1B04704040404043A57C675827372DD16221B120D2E
                      65C1B9B23E04040404044158C9767583A1D31D271E1C130C096D8CBD3F040404
                      04044353CD6B6975A274302C271E1C1310096E8A400404040404485301CB6A76
                      61815D302A271F1A140E09644404040404044B530101495B7675835D2F2D2920
                      1A140E314504040404044A53010101CB5B7661814E2F28232018150A09040404
                      0404515301010101CB5B6961A24E2F28262118150A0904040404505301010101
                      01496B7675814C172B2421190BEBE90404044F53010101010101CBC769A45C37
                      172B2403DCD4D5DA0404563C0101010101010149C7CA4D38591725D8D1D1D5ED
                      FE045552010101010101010149CC463879630FD6D1E0EDF7FBFE555201010101
                      0101010101013B386C7708D7D2ECF3F2F0FB55CD010101010101010101013338
                      78070404DBF6EEF4F1FD54545454545454545454545454380704040404F9EFF5
                      FA040404040404040404040404040404040404040404F8FC0404}
                    ParentShowHint = False
                    ShowHint = True
                    OnClick = SpeedButton15Click
                  end
                  object SpeedButton16: TSpeedButton
                    Left = 462
                    Top = 3
                    Width = 51
                    Height = 45
                    Hint = 'Excluir Produto - [PRO241]'
                    Flat = True
                    Glyph.Data = {
                      76060000424D7606000000000000360400002800000018000000180000000100
                      08000000000040020000130B0000130B000000010000000100008C5A5A00FFBD
                      5A00E7A56B00A57B7300AD7B7300B5847300AD847B00B5847B00B58C7B00BD8C
                      7B00C6948400CE9C8400D69C8400CEA58400D6A58400DEAD8400E7AD8400E79C
                      8C00D6A58C00DEAD8C00E7B58C00E79C9400E7B59400EFBD9400E7A59C00FFA5
                      A500FFD6A500FFADAD00E7C6AD00FFD6AD00E7B5B500EFB5B500EFBDB500FFBD
                      B500FFDEB500E7BDBD00F7BDBD00FFBDBD00FFDEBD00FFC6C600FFCEC600FFD6
                      C600FFE7C600CEC6CE00FFCECE00DED6CE00FFD6CE00FFE7CE00DED6D600DEDE
                      D600EFDED600FFE7D600FFEFD6009C9CDE009CA5DE00E7DEDE00E7E7DE00FFEF
                      DE006373E7008C9CE700ADB5E700DEDEE700E7E7E700EFEFE700FFEFE700FFF7
                      E7006373EF00637BEF009CA5EF009CADEF00BDC6EF00CECEEF00EFEFEF00F7EF
                      EF00FFF7EF003152F700637BF7009CADF700F7F7F700FFFFF700FF00FF000031
                      FF001042FF00637BFF009CB5FF00CED6FF00DEE7FF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00505050030303
                      03030303030303030303030303030300505050505003232020202020201F1F1E
                      1E1E1E1E1E1E16005050505050032D332F2F2A2A26262622221D1D1A1A1A2800
                      5050505050032D34332F2F2A2A26262622221D1D1A1A28005050505050063039
                      34332F2F2A2A26262622221D1D1A280050505050500630393934332F2F2A2A26
                      262622221D1D280050505050500731393939343C322F2A2A2B262622221D2800
                      5050505050073740393944514B322F36513A2626222228005050505050083841
                      403D5151514B3B5151513526262228005050505050093E4A4140445151515151
                      513A2A262626280050505050500A3E4A4A41404652515151432F2A2A26262800
                      50505050500A3E4F4A4A4145515151514B322F2A2A26280050505050500A484F
                      4F4A4D5151515151514B322F2A2A280050505050500B48574F565151514C4752
                      51513B2F2F2F280050505050500B4857574F4D514C414047524334332F2F2700
                      50505050500E485757574F554A4A41403D393934332F21005050505050124E57
                      5757574F4F4A4A4140393933251B19005050505050134E57575757574F4F4A4A
                      4140401C181511005050505050134E5757575757574F4F4A4A41410505050500
                      5050505050134E575757575757574F4F4A4A4A0501020B505050505050145757
                      575757575757574F4F4A4A05100B50505050505050145757574E4E4E4E4E4848
                      483F3F050E5050505050505050140F0F0F0F0F0F0F0F0F0F0F0F0F0550505050
                      5050505050505050505050505050505050505050505050505050}
                    ParentShowHint = False
                    ShowHint = True
                    OnClick = SpeedButton16Click
                  end
                  object SpeedButton17: TSpeedButton
                    Left = 348
                    Top = 3
                    Width = 51
                    Height = 45
                    Hint = 'Incluir Produto - [PRO238]'
                    Flat = True
                    Glyph.Data = {
                      76060000424D7606000000000000360400002800000018000000180000000100
                      08000000000040020000D30E0000D30E00000001000000010000B5847300AD73
                      8400A57B8400B5848400BD84840031398C00085A9400396B9400CEADA5000873
                      B500298CBD00DEC6BD00E7CEBD007B8CC600C6C6C600CECECE00D6D6D600DEDE
                      DE005AB5E700E7E7E700EFEFEF00216BF70042B5F7008CD6F700B5DEF700F7F7
                      F700FF00FF003184FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF001A1A1A1A1A1A
                      1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A
                      1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A0103030303030303030303030303031A
                      1A1A1A1A1A1A1A1A011C1C1C1C1C1C1C1C1C1C1C1C1C031A1A1A1A1A1A1A1A1A
                      011C1C1C1C1C1C1C1C1C1C1C1C1C031A1A1A1A1A1A1A1A1A011C1C1C1C1C1C1C
                      1C1C1C1C1C1C031A1A1A1A1A1A1A1A1A011C1C1C1C1C1C1C1C1C1C1C1C1C031A
                      1A1A1A1A1A1A1A1A011C1C1C1C1C1C1C1C1C1C1C1C1C031A1A1A1A1A1A1A1A1A
                      011C1C1C1C1C1C1C1C1C1C1C1C1C031A1A1A1A1A1A1A1A1A011C1C1C1C1C1C1C
                      1C1C1C1C1C1C031A1A1A1A1A1A1A1A1A011C1C1C1C1C1C1C1C1C1C1C1C1C031A
                      1A1A1A1A1A1A1A1A011C1C1C1C1C1C1C1C1C1C1C1C1C031A1A1A1A1A1A1A0D05
                      05071C1C1C1C1C1C1C1C1C1C1C1C021A1A1A1A1A1A1A061B1B06191919191919
                      191919191919021A1A1A1A1A1A1A06161606141414141414141414141414021A
                      1A1A1A0A09090616160909060D131313131313131313021A1A1A1A0917161616
                      1616161709131313131300030303001A1A1A1A15181818171718181815111111
                      1110000F1114001A1A1A1A121B1B1B17171B1B1B12101010100E001C1C13031A
                      1A1A1A1A1A1A1B17171B0F0F0F0F0F0F0F0E001C14031A1A1A1A1A1A1A1A1B18
                      181B0B0B0B0B0B0B0B080003031A1A1A1A1A1A1A1A1A121B1B121A1A1A1A1A1A
                      1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A
                      1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A}
                    ParentShowHint = False
                    ShowHint = True
                    OnClick = SpeedButton17Click
                  end
                  object Label17: TLabel
                    Left = 16
                    Top = 15
                    Width = 46
                    Height = 13
                    Caption = 'Consulta:'
                  end
                  object SpeedButton18: TSpeedButton
                    Left = 519
                    Top = 3
                    Width = 51
                    Height = 45
                    Hint = 'Imprimir - [PRO246]'
                    Flat = True
                    Glyph.Data = {
                      76060000424D7606000000000000360400002800000018000000180000000100
                      08000000000040020000F30E0000F30E00000001000000010000421821004221
                      21004A2121004A29290031313100523131005A31310039393100313939003939
                      390042D642004A4A4A007B4A5200844A52004A525200525252005A525200524A
                      5A008C4A5A0052525A0063636300736363007B6363006B6B6300736B63007B6B
                      63006B5A6B00845A6B007B636B0084636B006B6B6B00846B6B008C6B6B008C63
                      7300846B73008C6B73009C6B7300737373007B737300847373007B947300A56B
                      7B00A5737B00737B7B007B7B7B00847B7B009C7B7B00A57B7B00AD7B7B007B84
                      7B00A5847B0084CE7B008CFF7B00847B84008C7B8400947B8400BD7B84007384
                      840084848400A5848400AD848400B58484009C848C00848C8C008C8C8C00948C
                      8C009C8C8C00BD8C8C00C68C8C0084948C00BD8C9400C68C9400849494008C94
                      9400949494009C9494008C9C940094DE9400AD7B9C008C849C008C949C009494
                      9C00AD949C008C9C9C00949C9C009C9C9C00A59C9C00B5A59C009CEF9C00A57B
                      A500A5A5A500ADA5A500B5A5A500AD9CAD009CA5AD00BDA5AD00A5ADAD00ADAD
                      AD00B5ADAD00ADB5B500B5B5B500B5B5BD00BDB5BD00B5BDBD00BDBDBD00BDD6
                      BD00C6C6C600CEC6C600C6C6CE00C6CECE00CECECE00D6CECE00CED6CE00D6CE
                      D600CED6D600D6D6D600DED6D600D6DEDE00DEDEDE00DEE7DE00E7D6E700DEE7
                      E700E7E7E700EFE7E700E7EFE700E7EFEF00EFEFEF00F7EFEF00EFF7F700F7F7
                      F700FF00FF00F7FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00828282828282
                      82828282828282828282828282828282828282828282828282825A5555555555
                      55555A828282828282828282828282825564737A7D7E7E7E7C76686256828282
                      82828282828282820B2B7E816D676A6470846A260B658282828282828282820F
                      0B1E7E81736B6F6A73846C170B0F648282828282821E140B0B3A81807671746F
                      768472310B0B0B1E828282821E0B0B0B0B3F7972543F40645E7E6D3A0B0B0B0B
                      1782822C0B102D0F0B1E556163636464605A51170B13390E0B1E820F142D3A14
                      140B0B0B0B0B0B0B0B0B0B0B14116411110B820F355448534C49544A54403145
                      4C4954504F6434531A09820F55686661412D221F1F1D1B1C1920213759536464
                      5D0B821461755B23243B2F434447464643442A3C29162869640B82256472360D
                      383C2F2F30302E2E302F323C3D124E7861148240646E370C0D060B0B0B0B0B0B
                      0B0B0B060D0C3E6C613A8268646E52000B03151616151516161618050902566E
                      64618282646F5F010B578484848484848484845C0B025C6E648282826863644B
                      2741848484848484848483411C42676368828282827D7A7E7B737A8383838484
                      848075737A7F7B7C82828282828282828277768184846E646464647282828282
                      8282828282828282826F7683847E64646B6A6E73828282828282828282828282
                      826A6E818176646484847E6E828282828282828282828282826A6E81816E6476
                      847A6E82828282828282828282828282826864737364647E7A6E828282828282
                      8282828282828282826A61646464686E6E828282828282828282}
                    ParentShowHint = False
                    ShowHint = True
                    OnClick = SpeedButton18Click
                  end
                  object SpeedButton19: TSpeedButton
                    Left = 576
                    Top = 3
                    Width = 51
                    Height = 45
                    Hint = 'Atualizar'
                    Flat = True
                    Glyph.Data = {
                      F6060000424DF606000000000000360000002800000018000000180000000100
                      180000000000C0060000C40E0000C40E00000000000000000000FFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFEFE
                      FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE8E8E8959595484848
                      1C1C1C0505050505051C1C1C484848969696E9E9E9FFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4F4F47D7D7D0B
                      0B0B0000000000000000001212121212120000000000000000000B0B0B7E7E7E
                      F4F4F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDEDE
                      DE2D2D2D000000060606656565BABABAF6F6F6FFFFFFFFFFFFF6F6F6BABABA64
                      64640606060000002E2E2EDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFDEDEDE161616000000414141DDDDDDFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFDCDCDC3F3F3F000000161616DFDFDFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFF3F3F32C2C2C0000005F5F5FFAFAFAFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFAFA5D5D5D0000002E2E
                      2EF4F4F4FFFFFFFFFFFFFFFFFFFFFFFF7C7C7C000000424242FAFAFAFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FAFAFA3F3F3F0000007E7E7EFFFFFFFFFFFFFFFFFFE8E8E80B0B0B070707DEDE
                      DEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFDCDCDC0606060B0B0BE9E9E9FFFFFFFFFFFF949494
                      000000676767FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF656565000000969696FF
                      FFFFFFFFFF464646000000BCBCBCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBABA
                      BA000000484848FFFFFFFFFFFF1C1C1C010101F7F7F7FFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFF6F6F60000001D1D1DFFFFFFFDFDFD050505121212FFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF111111050505FDFDFDFDFDFD050505
                      131313FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF121212040404FD
                      FDFDFFFFFF1F1F1F000000F6F6F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F6
                      F60000001D1D1DFFFFFFFFFFFF454545000000BCBCBCFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFBABABA000000474747FFFFFFFFFFFF969696000000666666FFFF
                      FFFFFFFFE8E8E8FBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFF656565000000959595FFFFFFFFFFFFE9E9E9
                      090909070707DCDCDCDBDBDB050505707070FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDDDDDD0606060B0B0BE8E8E8FF
                      FFFFFFFFFFFFFFFF7D7D7D000000424242BDBDBD000000525252FFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFAFA4141410000
                      007D7D7DFFFFFFFFFFFFFFFFFFFFFFFFF5F5F52727270000002F2F2F00000052
                      5252FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFB
                      5F5F5F0000002C2C2CF3F3F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDF1A1A
                      1A000000000000525252FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFDEDEDE424242000000161616DEDEDEFFFFFFFFFFFFFFFFFFFFFFFFB9B9B9
                      2A2A2A222222111111000000000000525252FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFF7F7F7BBBBBB6767670606060000002C2C2CDEDEDEFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFF979797000000000000000000000000000000525252FFFFFFFFFFFF
                      FFFFFF5F5F5F1313130000000000000000000B0B0B7C7C7CF3F3F3FFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2F2F2EEEEEEEEEEEEEEEEEEEEEEEEF3
                      F3F3FFFFFFFFFFFFFFFFFF3838380505051B1B1B464646959595E8E8E8FFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
                    ParentShowHint = False
                    ShowHint = True
                    OnClick = SpeedButton19Click
                  end
                  object Edit2: TEdit
                    Left = 76
                    Top = 27
                    Width = 253
                    Height = 21
                    Hint = 'Informe a descri'#231#227'o do produto para realizar a pesquisa'
                    TabOrder = 1
                    OnChange = Edit2Change
                  end
                  object ComboBox4: TComboBox
                    Left = 76
                    Top = 0
                    Width = 253
                    Height = 21
                    ItemHeight = 13
                    ItemIndex = 0
                    TabOrder = 0
                    Text = 'Descri'#231#227'o Produto'
                    Items.Strings = (
                      'Descri'#231#227'o Produto'
                      'Num. Fabricante')
                  end
                  object pnCorPromocao2: TPanel
                    Left = 718
                    Top = 21
                    Width = 49
                    Height = 13
                    BevelOuter = bvNone
                    Caption = 'Vencida'
                    Color = 11184895
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    ParentBackground = False
                    ParentFont = False
                    TabOrder = 2
                  end
                end
                object Panel6: TPanel
                  Left = 2
                  Top = 81
                  Width = 876
                  Height = 275
                  Align = alClient
                  TabOrder = 1
                  object DBGrid3: TDBGrid
                    Left = 1
                    Top = 1
                    Width = 874
                    Height = 273
                    Align = alClient
                    DataSource = dtmProdutos.dsPromocaoProduto1
                    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                    PopupMenu = PopupMenu3
                    TabOrder = 0
                    TitleFont.Charset = DEFAULT_CHARSET
                    TitleFont.Color = clWindowText
                    TitleFont.Height = -11
                    TitleFont.Name = 'Tahoma'
                    TitleFont.Style = []
                    OnCellClick = DBGrid3CellClick
                    OnDrawColumnCell = DBGrid3DrawColumnCell
                    OnKeyDown = DBGrid3KeyDown
                    OnTitleClick = DBGrid3TitleClick
                    Columns = <
                      item
                        Expanded = False
                        FieldName = 'SEL'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'GRUPO_PROD'
                        Title.Caption = 'Grupo Prod'
                        Width = 59
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'COD_PROD'
                        Title.Caption = 'Cod Prod'
                        Width = 50
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'NUM_FAB_PROD'
                        Title.Caption = 'Num. Fabricante'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'DESCR_PROD'
                        Title.Caption = 'Descri'#231#227'o Produto'
                        Width = 191
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'SIGLA'
                        Title.Caption = 'Tipo Venda'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'VALOR_PROMOCAO_TEMP'
                        Width = 60
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'PORCENTAGEM_TEMP'
                        Title.Caption = 'Acresc/Desc (%)'
                        Width = 87
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'MAX_DESC'
                        Title.Caption = 'Desc Max(%)'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'MARKUP'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'MARGEM'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'DATA_INI'
                        Width = 75
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'DATA_FIM'
                        Width = 75
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'HORA_INI'
                        Title.Caption = 'Hora Ini'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'HORA_FIM'
                        Title.Caption = 'Hora Fim'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'PREC_TAB_PROD'
                        Title.Caption = 'Pre'#231'o Varejo'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'PREC_PUBLICO'
                        Title.Caption = 'Pre'#231'o P'#250'blico'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'USAR_DEBCRED'
                        Width = 64
                        Visible = True
                      end>
                  end
                end
              end
            end
            object TabSheet8: TTabSheet
              Caption = 'TabSheet8'
              ImageIndex = 1
              object GroupBox7: TGroupBox
                Left = 0
                Top = 0
                Width = 880
                Height = 358
                Align = alClient
                Caption = 'GroupBox7'
                TabOrder = 0
                object Panel8: TPanel
                  Left = 2
                  Top = 15
                  Width = 876
                  Height = 341
                  Align = alClient
                  BevelOuter = bvNone
                  TabOrder = 0
                  object Label199: TLabel
                    Left = 47
                    Top = 92
                    Width = 52
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Valor (R$):'
                  end
                  object Label200: TLabel
                    Left = 215
                    Top = 92
                    Width = 91
                    Height = 13
                    Alignment = taRightJustify
                    BiDiMode = bdLeftToRight
                    Caption = 'Acresc / Desc (%):'
                    ParentBiDiMode = False
                  end
                  object Label214: TLabel
                    Left = 431
                    Top = 45
                    Width = 65
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Pre'#231'o Varejo:'
                  end
                  object Label217: TLabel
                    Left = 604
                    Top = 45
                    Width = 74
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Pre'#231'o Atacado:'
                  end
                  object Label204: TLabel
                    Left = 42
                    Top = 145
                    Width = 57
                    Height = 13
                    Caption = 'Data Inicial:'
                  end
                  object Label208: TLabel
                    Left = 42
                    Top = 171
                    Width = 57
                    Height = 13
                    Caption = 'Hora Inicial:'
                  end
                  object Label207: TLabel
                    Left = 254
                    Top = 145
                    Width = 52
                    Height = 13
                    Caption = 'Data Final:'
                  end
                  object Label209: TLabel
                    Left = 254
                    Top = 171
                    Width = 52
                    Height = 13
                    Caption = 'Hora Final:'
                  end
                  object Label13: TLabel
                    Left = 16
                    Top = 21
                    Width = 83
                    Height = 13
                    Caption = 'Num. Fabricante:'
                  end
                  object Label14: TLabel
                    Left = 236
                    Top = 49
                    Width = 70
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Grupo/C'#243'digo:'
                  end
                  object Label16: TLabel
                    Left = 256
                    Top = 21
                    Width = 50
                    Height = 13
                    Caption = 'Descri'#231#227'o:'
                  end
                  object Label220: TLabel
                    Left = 42
                    Top = 49
                    Width = 57
                    Height = 13
                    Caption = 'Tipo Venda:'
                  end
                  object Label20: TLabel
                    Left = 30
                    Top = 120
                    Width = 69
                    Height = 13
                    Caption = 'Desc Max(%):'
                  end
                  object Label21: TLabel
                    Left = 210
                    Top = 114
                    Width = 194
                    Height = 25
                    AutoSize = False
                    Caption = 
                      'Informe percentual positivo (+) para aumentar o pre'#231'o ou negativ' +
                      'o (-) para diminuir o pre'#231'o.'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clRed
                    Font.Height = -9
                    Font.Name = 'Tahoma'
                    Font.Style = []
                    ParentFont = False
                    WordWrap = True
                  end
                  object DBText1: TDBText
                    Left = 502
                    Top = 45
                    Width = 89
                    Height = 15
                    DataField = 'PREC_TAB_PROD'
                    DataSource = dtmProdutos.dsPromocaoProduto1
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlue
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object DBText2: TDBText
                    Left = 684
                    Top = 45
                    Width = 89
                    Height = 15
                    DataField = 'PREC_PUBLICO'
                    DataSource = dtmProdutos.dsPromocaoProduto1
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlue
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object lbMakupMargem: TLabel
                    Left = 456
                    Top = 92
                    Width = 39
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Markup:'
                    FocusControl = edMarukpMargem
                  end
                  object Label23: TLabel
                    Left = 312
                    Top = 70
                    Width = 132
                    Height = 13
                    Caption = '---                 ---               ---'
                  end
                  object btHabPercent: TSpeedButton
                    Left = 410
                    Top = 89
                    Width = 23
                    Height = 22
                    Hint = 'Habilitar campo'
                    Glyph.Data = {
                      36030000424D3603000000000000360000002800000010000000100000000100
                      18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFD5D5D58D8D8D8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C
                      8C8C8C8C8C8C8C8CC5C5C5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2640531387D8
                      1289D91289D91289D91289D91289D91289D91289D91289D90F3C5EF3F3F3FFFF
                      FFFFFFFFFFFFFFFFFFFF1648670CABFB0BACFB0BACFB0BACFB0DAAFB0BACFB0B
                      ACFB0BACFB0BACFB095684E8E8E8FFFFFFFFFFFFFFFFFFFFFFFF134D6807B2FC
                      07B3FD07B3FD07B3FD0F599208B1FC07B3FD07B3FD07B3FD055C85E8E8E8FFFF
                      FFFFFFFFFFFFFFFFFFFF10516902BAFE02BAFE02BAFE05B3F7041D2E06A2E202
                      BAFE02BAFE02BAFE016387E8E8E8FFFFFFFFFFFFFFFFFFFFFFFF10536900BEFF
                      00BEFF00BEFF01BFFD007C9601B9F300BEFF00BEFF00BEFF006587E8E8E8FFFF
                      FFFFFFFFFFFFFFFFFFFF10556900C5FF00C4FF00C4FF00C4FF00C4FF00C4FF00
                      C4FF00C4FF00C4FF006A87E8E8E8FFFFFFFFFFFFFFFFFFFFFFFF1C515900D7F8
                      00D9FA00D9FA00D9FA00D9FA00D9FA00DAFB02DCFD00D9FA045E6CF0F0F0FFFF
                      FF7A7A7A3D3A37333130C3C3C37171717070707070707070707070707070703B
                      3531B2AAA4353535AEAEAEFFFFFFFFFFFF6D6D6DB4ABA2454240FFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF423E3AB4ABA36F6F6FFFFFFFFFFFFFFFFF
                      FF656565BAB0A8454140FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF48
                      4746C6BEB7484644C5C5C5F3F3F3BFBFBF4E4A48C5BDB64E4D4CFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA5A5A57A7471CFCAC67874725D5A587D79
                      76D2CDC9706B69B1B1B1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFF8989895D5958B4B0AFC8C5C4B1AEAD575554939393FFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE3E3E39C9C9C8C8C8C9E9E
                      9EE6E6E6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
                    OnClick = btHabPercentClick
                  end
                  object btHabMarkup: TSpeedButton
                    Left = 583
                    Top = 89
                    Width = 23
                    Height = 22
                    Hint = 'Habilitar campo'
                    Glyph.Data = {
                      36030000424D3603000000000000360000002800000010000000100000000100
                      18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFD5D5D58D8D8D8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C
                      8C8C8C8C8C8C8C8CC5C5C5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2640531387D8
                      1289D91289D91289D91289D91289D91289D91289D91289D90F3C5EF3F3F3FFFF
                      FFFFFFFFFFFFFFFFFFFF1648670CABFB0BACFB0BACFB0BACFB0DAAFB0BACFB0B
                      ACFB0BACFB0BACFB095684E8E8E8FFFFFFFFFFFFFFFFFFFFFFFF134D6807B2FC
                      07B3FD07B3FD07B3FD0F599208B1FC07B3FD07B3FD07B3FD055C85E8E8E8FFFF
                      FFFFFFFFFFFFFFFFFFFF10516902BAFE02BAFE02BAFE05B3F7041D2E06A2E202
                      BAFE02BAFE02BAFE016387E8E8E8FFFFFFFFFFFFFFFFFFFFFFFF10536900BEFF
                      00BEFF00BEFF01BFFD007C9601B9F300BEFF00BEFF00BEFF006587E8E8E8FFFF
                      FFFFFFFFFFFFFFFFFFFF10556900C5FF00C4FF00C4FF00C4FF00C4FF00C4FF00
                      C4FF00C4FF00C4FF006A87E8E8E8FFFFFFFFFFFFFFFFFFFFFFFF1C515900D7F8
                      00D9FA00D9FA00D9FA00D9FA00D9FA00DAFB02DCFD00D9FA045E6CF0F0F0FFFF
                      FF7A7A7A3D3A37333130C3C3C37171717070707070707070707070707070703B
                      3531B2AAA4353535AEAEAEFFFFFFFFFFFF6D6D6DB4ABA2454240FFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF423E3AB4ABA36F6F6FFFFFFFFFFFFFFFFF
                      FF656565BAB0A8454140FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF48
                      4746C6BEB7484644C5C5C5F3F3F3BFBFBF4E4A48C5BDB64E4D4CFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA5A5A57A7471CFCAC67874725D5A587D79
                      76D2CDC9706B69B1B1B1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFF8989895D5958B4B0AFC8C5C4B1AEAD575554939393FFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE3E3E39C9C9C8C8C8C9E9E
                      9EE6E6E6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
                    OnClick = btHabMarkupClick
                  end
                  object Label15: TLabel
                    Left = 501
                    Top = 117
                    Width = 249
                    Height = 41
                    AutoSize = False
                    Caption = 
                      'Markup ou Margem, quando preenchido o pre'#231'o sempre ser'#225' mantido ' +
                      'atualizado em altera'#231#245'es de custo.'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clRed
                    Font.Height = -9
                    Font.Name = 'Tahoma'
                    Font.Style = []
                    ParentFont = False
                    WordWrap = True
                  end
                  object Label33: TLabel
                    Left = 623
                    Top = 92
                    Width = 123
                    Height = 13
                    Caption = 'Lan'#231'ar D'#233'bito ou Cr'#233'dito:'
                  end
                  object btHabDebCred: TSpeedButton
                    Left = 842
                    Top = 89
                    Width = 23
                    Height = 22
                    Hint = 'Habilitar campo'
                    Glyph.Data = {
                      36030000424D3603000000000000360000002800000010000000100000000100
                      18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFD5D5D58D8D8D8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C
                      8C8C8C8C8C8C8C8CC5C5C5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2640531387D8
                      1289D91289D91289D91289D91289D91289D91289D91289D90F3C5EF3F3F3FFFF
                      FFFFFFFFFFFFFFFFFFFF1648670CABFB0BACFB0BACFB0BACFB0DAAFB0BACFB0B
                      ACFB0BACFB0BACFB095684E8E8E8FFFFFFFFFFFFFFFFFFFFFFFF134D6807B2FC
                      07B3FD07B3FD07B3FD0F599208B1FC07B3FD07B3FD07B3FD055C85E8E8E8FFFF
                      FFFFFFFFFFFFFFFFFFFF10516902BAFE02BAFE02BAFE05B3F7041D2E06A2E202
                      BAFE02BAFE02BAFE016387E8E8E8FFFFFFFFFFFFFFFFFFFFFFFF10536900BEFF
                      00BEFF00BEFF01BFFD007C9601B9F300BEFF00BEFF00BEFF006587E8E8E8FFFF
                      FFFFFFFFFFFFFFFFFFFF10556900C5FF00C4FF00C4FF00C4FF00C4FF00C4FF00
                      C4FF00C4FF00C4FF006A87E8E8E8FFFFFFFFFFFFFFFFFFFFFFFF1C515900D7F8
                      00D9FA00D9FA00D9FA00D9FA00D9FA00DAFB02DCFD00D9FA045E6CF0F0F0FFFF
                      FF7A7A7A3D3A37333130C3C3C37171717070707070707070707070707070703B
                      3531B2AAA4353535AEAEAEFFFFFFFFFFFF6D6D6DB4ABA2454240FFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF423E3AB4ABA36F6F6FFFFFFFFFFFFFFFFF
                      FF656565BAB0A8454140FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF48
                      4746C6BEB7484644C5C5C5F3F3F3BFBFBF4E4A48C5BDB64E4D4CFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA5A5A57A7471CFCAC67874725D5A587D79
                      76D2CDC9706B69B1B1B1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFF8989895D5958B4B0AFC8C5C4B1AEAD575554939393FFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE3E3E39C9C9C8C8C8C9E9E
                      9EE6E6E6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
                    OnClick = btHabDebCredClick
                  end
                  object EditHw2: TEditHw
                    Left = 105
                    Top = 89
                    Width = 92
                    Height = 21
                    CharCase = ecUpperCase
                    TabOrder = 5
                    Text = '                                   0'
                    OnExit = EditHw2Exit
                    Formato = fNumber
                    FormatSize = '0.2'
                  end
                  object EditHw3: TEditHw
                    Left = 312
                    Top = 89
                    Width = 92
                    Height = 21
                    CharCase = ecUpperCase
                    TabOrder = 6
                    Text = '                                   0'
                    OnExit = EditHw3Exit
                    Formato = fNumber
                    FormatSize = '0.2'
                  end
                  object DBEdit99: TDBEdit
                    Left = 431
                    Top = 231
                    Width = 92
                    Height = 21
                    Hint = 'Valor de venda do produto a vista.'
                    CharCase = ecUpperCase
                    DataField = 'PREC_TAB_PROD'
                    DataSource = dtmProdutos.dsPromocaoProduto1
                    Enabled = False
                    TabOrder = 14
                    Visible = False
                  end
                  object DBEdit104: TDBEdit
                    Left = 431
                    Top = 261
                    Width = 92
                    Height = 21
                    Hint = 
                      'Pre'#231'o de venda Sugerido da Montadora no sistema '#233' o pre'#231'o de ata' +
                      'cado.'
                    CharCase = ecUpperCase
                    DataField = 'PREC_PUBLICO'
                    DataSource = dtmProdutos.dsPromocaoProduto1
                    Enabled = False
                    TabOrder = 15
                    Visible = False
                  end
                  object CheckBox19: TCheckBox
                    Left = 105
                    Top = 119
                    Width = 97
                    Height = 17
                    Caption = 'Add Exce'#231#227'o'
                    TabOrder = 16
                    OnClick = CheckBox19Click
                  end
                  object DBEdit8: TDBEdit
                    Left = 312
                    Top = 18
                    Width = 525
                    Height = 21
                    CharCase = ecUpperCase
                    DataField = 'DESCR_PROD'
                    DataSource = dtmProdutos.dsPromocaoProduto1
                    Enabled = False
                    TabOrder = 1
                  end
                  object DBEdit9: TDBEdit
                    Left = 312
                    Top = 46
                    Width = 33
                    Height = 21
                    Hint = 'Valor de venda do produto a vista.'
                    CharCase = ecUpperCase
                    DataField = 'GRUPO_PROD'
                    DataSource = dtmProdutos.dsPromocaoProduto1
                    Enabled = False
                    TabOrder = 3
                  end
                  object DBEdit10: TDBEdit
                    Left = 351
                    Top = 46
                    Width = 53
                    Height = 21
                    Hint = 'Valor de venda do produto a vista.'
                    CharCase = ecUpperCase
                    DataField = 'COD_PROD'
                    DataSource = dtmProdutos.dsPromocaoProduto1
                    Enabled = False
                    TabOrder = 4
                  end
                  object DBLookupComboBox1: TDBLookupComboBox
                    Left = 105
                    Top = 46
                    Width = 92
                    Height = 21
                    DataField = 'SIGLA'
                    DataSource = dtmProdutos.dsPromocaoProduto1
                    DropDownWidth = 300
                    KeyField = 'SIGLA'
                    ListField = 'DESCRICAO'
                    ListSource = dtmProdutos.dsTipoVenda
                    TabOrder = 2
                    OnExit = DBLookupComboBox1Exit
                  end
                  object Edit1: TEdit
                    Left = 105
                    Top = 18
                    Width = 92
                    Height = 21
                    CharCase = ecUpperCase
                    TabOrder = 0
                    OnExit = Edit1Exit
                    OnKeyDown = Edit1KeyDown
                  end
                  object EditHw1: TEditHw
                    Left = 105
                    Top = 116
                    Width = 92
                    Height = 21
                    CharCase = ecUpperCase
                    TabOrder = 9
                    Text = '                                   0'
                    OnExit = EditHw1Exit
                    Formato = fNumber
                    FormatSize = '0.2'
                  end
                  object MaskEdit4: TMaskEdit
                    Left = 105
                    Top = 142
                    Width = 92
                    Height = 21
                    CharCase = ecUpperCase
                    Enabled = False
                    EditMask = '!99/99/0000;1;_'
                    MaxLength = 10
                    TabOrder = 10
                    Text = '  /  /    '
                  end
                  object MaskEdit5: TMaskEdit
                    Left = 105
                    Top = 169
                    Width = 92
                    Height = 21
                    CharCase = ecUpperCase
                    Enabled = False
                    EditMask = '!90:00:00;1;_'
                    MaxLength = 8
                    TabOrder = 12
                    Text = '  :  :  '
                  end
                  object MaskEdit6: TMaskEdit
                    Left = 312
                    Top = 142
                    Width = 92
                    Height = 21
                    CharCase = ecUpperCase
                    Enabled = False
                    EditMask = '!99/99/0000;1;_'
                    MaxLength = 10
                    TabOrder = 11
                    Text = '  /  /    '
                  end
                  object MaskEdit7: TMaskEdit
                    Left = 312
                    Top = 169
                    Width = 92
                    Height = 21
                    CharCase = ecUpperCase
                    Enabled = False
                    EditMask = '!90:00:00;1;_'
                    MaxLength = 8
                    TabOrder = 13
                    Text = '  :  :  '
                    OnExit = MaskEdit7Exit
                  end
                  object edMarukpMargem: TDBEdit
                    Left = 501
                    Top = 89
                    Width = 76
                    Height = 21
                    DataField = 'MARKUP'
                    DataSource = dtmProdutos.dsPromocaoProduto1
                    TabOrder = 7
                    OnExit = edMarukpMargemExit
                  end
                  object DBComboBox6: TDBComboBox
                    Left = 752
                    Top = 89
                    Width = 85
                    Height = 21
                    Hint = 
                      'Lan'#231'ar d'#233'bitos e cr'#233'ditos na conta do colaborador quando configu' +
                      'rado na empresa'
                    Style = csDropDownList
                    CharCase = ecUpperCase
                    DataField = 'USAR_DEBCRED'
                    DataSource = dtmProdutos.dsPromocaoProduto1
                    ItemHeight = 13
                    Items.Strings = (
                      ''
                      'N - N'#195'O'
                      'S - SIM')
                    TabOrder = 8
                  end
                end
              end
            end
          end
        end
        object TabSheet9: TTabSheet
          Caption = 'TabSheet9'
          ImageIndex = 6
          object qrpPromocaoProduto: TQuickRep
            Left = -14
            Top = -13
            Width = 794
            Height = 1123
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            DataSet = dtmProdutos.cdsPromocaoProduto1
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
            OnPreview = qrpPromocaoProdutoPreview
            Options = [FirstPageHeader, LastPageFooter]
            Page.Columns = 1
            Page.Orientation = poPortrait
            Page.PaperSize = A4
            Page.Values = (
              100.000000000000000000
              2970.000000000000000000
              100.000000000000000000
              2100.000000000000000000
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
            PrevFormStyle = fsStayOnTop
            PreviewInitialState = wsMaximized
            PrevInitialZoom = qrZoomToWidth
            PreviewDefaultSaveType = stQRP
            object QRBand1: TQRBand
              Left = 38
              Top = 38
              Width = 718
              Height = 104
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
                275.166666666666700000
                1899.708333333333000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              BandType = rbTitle
              object QRLabel6: TQRLabel
                Left = 3
                Top = 58
                Width = 116
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  7.937500000000000000
                  153.458333333333300000
                  306.916666666666700000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'TABELA  DE  PRE'#199'O:'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 9
              end
              object QRLabel7: TQRLabel
                Left = 2
                Top = 81
                Width = 63
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  5.291666666666667000
                  214.312500000000000000
                  166.687500000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Data/Hora:'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Arial'
                Font.Style = [fsBold, fsItalic]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 9
              end
              object QRSysData3: TQRSysData
                Left = 73
                Top = 81
                Width = 66
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  193.145833333333300000
                  214.312500000000000000
                  174.625000000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                Color = clWhite
                Data = qrsDateTime
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Arial'
                Font.Style = [fsItalic]
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                FontSize = 9
              end
              object QRLabel8: TQRLabel
                Left = 607
                Top = 81
                Width = 44
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1606.020833333333000000
                  214.312500000000000000
                  116.416666666666700000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'P'#225'gina:'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Arial'
                Font.Style = [fsBold, fsItalic]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 9
              end
              object QRSysData4: TQRSysData
                Left = 658
                Top = 81
                Width = 45
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1740.958333333333000000
                  214.312500000000000000
                  119.062500000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                Color = clWhite
                Data = qrsPageNumber
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                FontSize = 9
              end
              object QRLabel9: TQRLabel
                Left = 2
                Top = 5
                Width = 103
                Height = 24
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  63.500000000000000000
                  5.291666666666667000
                  13.229166666666670000
                  272.520833333333400000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'lbEmpresa'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -19
                Font.Name = 'Arial'
                Font.Style = [fsBold, fsItalic]
                OnPrint = lbEmpresaPrint
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 14
              end
              object QRDBText7: TQRDBText
                Left = 122
                Top = 58
                Width = 594
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  322.791666666666700000
                  153.458333333333300000
                  1571.625000000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Color = clWhite
                DataSet = dtmProdutos.cdsPromocaoP
                DataField = 'DESCR_PROMOCAO'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 9
              end
              object QRLabel17: TQRLabel
                Left = 3
                Top = 35
                Width = 272
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  7.937500000000000000
                  92.604166666666680000
                  719.666666666666800000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'RELAT'#211'RIO  PROMO'#199#195'O  /  TABELA  DE  PRE'#199'O:'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = False
                ExportAs = exptText
                FontSize = 9
              end
            end
            object QRBand2: TQRBand
              Left = 38
              Top = 142
              Width = 718
              Height = 33
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
                87.312500000000000000
                1899.708333333333000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              BandType = rbColumnHeader
              object QRShape4: TQRShape
                Left = 3
                Top = 1
                Width = 734
                Height = 3
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  7.937500000000000000
                  7.937500000000000000
                  2.645833333333333000
                  1942.041666666667000000)
                Brush.Color = clBlack
                Shape = qrsRectangle
                VertAdjust = 0
              end
              object QRShape5: TQRShape
                Left = 3
                Top = 27
                Width = 734
                Height = 3
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  7.937500000000000000
                  7.937500000000000000
                  71.437500000000000000
                  1942.041666666667000000)
                Brush.Color = clBlack
                Shape = qrsRectangle
                VertAdjust = 0
              end
              object QRLabel10: TQRLabel
                Left = 13
                Top = 6
                Width = 126
                Height = 20
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  52.916666666666670000
                  34.395833333333340000
                  15.875000000000000000
                  333.375000000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Num. Fabricante'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -16
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 12
              end
              object QRLabel11: TQRLabel
                Left = 160
                Top = 7
                Width = 144
                Height = 20
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  52.916666666666670000
                  423.333333333333300000
                  18.520833333333330000
                  381.000000000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Descri'#231#227'o Produto'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -16
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 12
              end
              object QRLabel13: TQRLabel
                Left = 548
                Top = 7
                Width = 80
                Height = 20
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  52.916666666666670000
                  1449.916666666667000000
                  18.520833333333330000
                  211.666666666666700000)
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Caption = 'Valor'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -16
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 12
              end
              object QRLabel14: TQRLabel
                Left = 640
                Top = 6
                Width = 66
                Height = 20
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  52.916666666666670000
                  1693.333333333333000000
                  15.875000000000000000
                  174.625000000000000000)
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Caption = 'Desc(%)'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -16
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 12
              end
              object QRLabel16: TQRLabel
                Left = 431
                Top = 7
                Width = 90
                Height = 20
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  52.916666666666670000
                  1140.354166666667000000
                  18.520833333333330000
                  238.125000000000000000)
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Caption = 'Tipo Venda'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -16
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 12
              end
            end
            object QRBand3: TQRBand
              Left = 38
              Top = 175
              Width = 718
              Height = 19
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
                50.270833333333330000
                1899.708333333333000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              BandType = rbDetail
              object QRDBText1: TQRDBText
                Left = 13
                Top = -1
                Width = 126
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  34.395833333333330000
                  -2.645833333333333000
                  333.375000000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Color = clWhite
                DataSet = dtmProdutos.cdsPromocaoProduto1
                DataField = 'NUM_FAB_PROD'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 9
              end
              object QRDBText4: TQRDBText
                Left = 160
                Top = 0
                Width = 265
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  423.333333333333300000
                  0.000000000000000000
                  701.145833333333200000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Color = clWhite
                DataSet = dtmProdutos.cdsPromocaoProduto1
                DataField = 'DESCR_PROD'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 9
              end
              object QRDBText5: TQRDBText
                Left = 548
                Top = 0
                Width = 80
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1449.916666666667000000
                  0.000000000000000000
                  211.666666666666700000)
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Color = clWhite
                DataSet = dtmProdutos.cdsPromocaoProduto1
                DataField = 'VALOR_PROMOCAO_TEMP'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 9
              end
              object QRDBText6: TQRDBText
                Left = 634
                Top = 0
                Width = 71
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1677.458333333333000000
                  0.000000000000000000
                  187.854166666666700000)
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Color = clWhite
                DataSet = dtmProdutos.cdsPromocaoProduto1
                DataField = 'PORCENTAGEM_TEMP'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 9
              end
              object QRDBText8: TQRDBText
                Left = 431
                Top = 0
                Width = 90
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1140.354166666667000000
                  0.000000000000000000
                  238.125000000000000000)
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Color = clWhite
                DataSet = dtmProdutos.cdsPromocaoProduto1
                DataField = 'SIGLA'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 9
              end
            end
            object QRBand4: TQRBand
              Left = 38
              Top = 194
              Width = 718
              Height = 36
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
                95.250000000000000000
                1899.708333333333000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              BandType = rbPageFooter
              object QRLabel12: TQRLabel
                Left = 8
                Top = 10
                Width = 210
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  21.166666666666670000
                  26.458333333333330000
                  555.625000000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'HW Sistemas e Computadores Ltda'
                Color = clWhite
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
              object QRShape6: TQRShape
                Left = 3
                Top = 4
                Width = 734
                Height = 3
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  7.937500000000000000
                  7.937500000000000000
                  10.583333333333330000
                  1942.041666666667000000)
                Brush.Color = clBlack
                Shape = qrsRectangle
                VertAdjust = 0
              end
            end
          end
        end
        object TabSheet10: TTabSheet
          Caption = 'TabSheet10'
          ImageIndex = 7
          object qrpTabela: TQuickRep
            Left = 3
            Top = 0
            Width = 794
            Height = 1123
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            DataSet = dtmProdutos.cdsTipoPpro
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
            OnPreview = qrpPromocaoPreview
            Options = [FirstPageHeader, LastPageFooter]
            Page.Columns = 1
            Page.Orientation = poPortrait
            Page.PaperSize = A4
            Page.Values = (
              100.000000000000000000
              2970.000000000000000000
              100.000000000000000000
              2100.000000000000000000
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
            PrevFormStyle = fsStayOnTop
            PreviewInitialState = wsMaximized
            PrevInitialZoom = qrZoomToWidth
            PreviewDefaultSaveType = stQRP
            object QRBand5: TQRBand
              Left = 38
              Top = 38
              Width = 718
              Height = 83
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
                219.604166666666700000
                1899.708333333333000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              BandType = rbTitle
              object QRLabel18: TQRLabel
                Left = 3
                Top = 31
                Width = 173
                Height = 24
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  63.500000000000000000
                  7.937500000000000000
                  82.020833333333340000
                  457.729166666666600000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Cadastro de Tabela'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -19
                Font.Name = 'Arial'
                Font.Style = [fsItalic]
                OnPrint = QRLabel1Print
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 14
              end
              object QRLabel19: TQRLabel
                Left = 2
                Top = 61
                Width = 65
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  5.291666666666667000
                  161.395833333333300000
                  171.979166666666700000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Data/Hora:'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Arial'
                Font.Style = [fsBold, fsItalic]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
              object QRSysData5: TQRSysData
                Left = 73
                Top = 61
                Width = 69
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  193.145833333333300000
                  161.395833333333300000
                  182.562500000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                Color = clWhite
                Data = qrsDateTime
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Arial'
                Font.Style = [fsItalic]
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                FontSize = 10
              end
              object QRLabel20: TQRLabel
                Left = 607
                Top = 61
                Width = 47
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1606.020833333333000000
                  161.395833333333300000
                  124.354166666666700000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'P'#225'gina:'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Arial'
                Font.Style = [fsBold, fsItalic]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
              object QRSysData6: TQRSysData
                Left = 658
                Top = 61
                Width = 46
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1740.958333333333000000
                  161.395833333333300000
                  121.708333333333300000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                Color = clWhite
                Data = qrsPageNumber
                Transparent = False
                ExportAs = exptText
                FontSize = 10
              end
              object lbEmpresa2: TQRLabel
                Left = 2
                Top = 10
                Width = 103
                Height = 24
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  63.500000000000000000
                  5.291666666666667000
                  26.458333333333330000
                  272.520833333333400000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'lbEmpresa'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -19
                Font.Name = 'Arial'
                Font.Style = [fsBold, fsItalic]
                OnPrint = lbEmpresaPrint
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 14
              end
            end
            object QRBand6: TQRBand
              Left = 38
              Top = 121
              Width = 718
              Height = 33
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
                87.312500000000000000
                1899.708333333333000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              BandType = rbColumnHeader
              object QRShape7: TQRShape
                Left = 3
                Top = 1
                Width = 734
                Height = 3
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  7.937500000000000000
                  7.937500000000000000
                  2.645833333333333000
                  1942.041666666667000000)
                Brush.Color = clBlack
                Shape = qrsRectangle
                VertAdjust = 0
              end
              object QRShape8: TQRShape
                Left = 3
                Top = 27
                Width = 734
                Height = 3
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  7.937500000000000000
                  7.937500000000000000
                  71.437500000000000000
                  1942.041666666667000000)
                Brush.Color = clBlack
                Shape = qrsRectangle
                VertAdjust = 0
              end
              object QRLabel22: TQRLabel
                Left = 4
                Top = 7
                Width = 57
                Height = 20
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  52.916666666666670000
                  10.583333333333330000
                  18.520833333333330000
                  150.812500000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'C'#243'digo'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -16
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 12
              end
              object QRLabel23: TQRLabel
                Left = 67
                Top = 7
                Width = 78
                Height = 20
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  52.916666666666670000
                  177.270833333333300000
                  18.520833333333330000
                  206.375000000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Descri'#231#227'o'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -16
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 12
              end
            end
            object QRBand7: TQRBand
              Left = 38
              Top = 154
              Width = 718
              Height = 19
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
                50.270833333333330000
                1899.708333333333000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              BandType = rbDetail
              object QRDBText9: TQRDBText
                Left = -32
                Top = 0
                Width = 93
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  -84.666666666666680000
                  0.000000000000000000
                  246.062500000000000000)
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Color = clWhite
                DataSet = dtmProdutos.cdsTipoPpro
                DataField = 'COD_TPPRECO'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 9
              end
              object QRDBText10: TQRDBText
                Left = 67
                Top = 0
                Width = 78
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  177.270833333333300000
                  0.000000000000000000
                  206.375000000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Color = clWhite
                DataSet = dtmProdutos.cdsTipoPpro
                DataField = 'DESCR_TIPO'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 9
              end
            end
            object QRBand8: TQRBand
              Left = 38
              Top = 173
              Width = 718
              Height = 36
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
                95.250000000000000000
                1899.708333333333000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              BandType = rbPageFooter
              object QRLabel24: TQRLabel
                Left = 8
                Top = 10
                Width = 210
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  21.166666666666670000
                  26.458333333333330000
                  555.625000000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'HW Sistemas e Computadores Ltda'
                Color = clWhite
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
              object QRShape9: TQRShape
                Left = 3
                Top = 4
                Width = 734
                Height = 3
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  7.937500000000000000
                  7.937500000000000000
                  10.583333333333330000
                  1942.041666666667000000)
                Brush.Color = clBlack
                Shape = qrsRectangle
                VertAdjust = 0
              end
            end
          end
        end
      end
    end
    inherited PanelFlash: TPanel
      Left = 672
      Top = 382
      ExplicitLeft = 672
      ExplicitTop = 382
    end
  end
  inherited StatusBar1: TStatusBar
    Width = 903
    ExplicitWidth = 903
  end
  inherited pnStatusProcessamento: TPanel
    Left = 828
    ExplicitLeft = 828
    inherited lbStatusProcessamento: TLabel
      ExplicitLeft = 174
      ExplicitTop = 3
    end
    inherited lbTextoProcessamento: TLabel
      Width = 477
      Height = 21
    end
  end
  inherited PopupMenu1: TPopupMenu
    Left = 748
    Top = 65529
    object MarcarTodasPromocaoTabelaClick: TMenuItem
      Caption = 'Marcar Todos'
      OnClick = MarcarTodasPromocaoTabelaClickClick
    end
    object DesmarcarTodasPromocaoTabelaClick: TMenuItem
      Caption = 'DesmarcarTodos'
      OnClick = DesmarcarTodasPromocaoTabelaClickClick
    end
  end
  inherited PopupMenu2: TPopupMenu
    Left = 614
    Top = 65531
  end
  inherited Timer1: TTimer
    Left = 566
    Top = 65531
  end
  inherited ApplicationEventsPadrao: TApplicationEvents
    Left = 718
    Top = 3
  end
  object DataSource1: TDataSource
    DataSet = dtmProdutos.cdsPromocaoP
    Left = 680
    Top = 8
  end
  object PopupMenu3: TPopupMenu
    Left = 648
    Top = 65530
    object MarcarTodasPromocaoProdutoTabelaClick: TMenuItem
      Caption = 'Marcar Todos'
      OnClick = MarcarTodasPromocaoProdutoTabelaClickClick
    end
    object DesmarcarTodasPromocaoProdutoTabelaClick: TMenuItem
      Caption = 'Desmarcar Todos'
      OnClick = DesmarcarTodasPromocaoProdutoTabelaClickClick
    end
    object ApagarTodosProdutosdestapromoo1: TMenuItem
      Caption = 'Apagar todos produtos desta promo'#231#227'o / tabela - [PRO258]'
      OnClick = ApagarTodosProdutosdestapromoo1Click
    end
  end
end
