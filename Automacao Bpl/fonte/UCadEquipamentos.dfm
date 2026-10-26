inherited FrmCadEquipamentos: TFrmCadEquipamentos
  Left = 196
  Top = 100
  Caption = 'Equipamentos'
  ClientHeight = 614
  ClientWidth = 799
  ExplicitWidth = 807
  ExplicitHeight = 648
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelFundo: TPanel
    Width = 799
    Height = 595
    ExplicitWidth = 799
    ExplicitHeight = 595
    inherited Splitter2: TSplitter
      Height = 593
      ExplicitHeight = 594
    end
    inherited PanelLeft: TPanel
      Width = 794
      Height = 593
      ExplicitWidth = 794
      ExplicitHeight = 593
      inherited PageControl1: TPageControl
        Width = 792
        Height = 591
        ExplicitWidth = 792
        ExplicitHeight = 591
        inherited TabSheet1: TTabSheet
          ExplicitWidth = 784
          ExplicitHeight = 560
          inherited ScrollBox1: TScrollBox
            Width = 784
            Height = 560
            ExplicitWidth = 784
            ExplicitHeight = 560
            inherited PageControl3: TPageControl
              Width = 784
              Height = 512
              OnChange = PageControl3Change
              ExplicitWidth = 784
              ExplicitHeight = 512
              inherited TabSheet3: TTabSheet
                Caption = 'Dados Equipamentos'
                ExplicitLeft = 4
                ExplicitTop = 27
                ExplicitWidth = 776
                ExplicitHeight = 481
                inherited ScrollBox3: TScrollBox
                  Width = 776
                  Height = 481
                  ExplicitWidth = 776
                  ExplicitHeight = 481
                  inherited GroupBox1: TGroupBox
                    Width = 772
                    Height = 392
                    Caption = 'Dados do equipamento'
                    OnEnter = GroupBox1Enter
                    ExplicitWidth = 772
                    ExplicitHeight = 392
                    object Label6: TLabel
                      Left = 90
                      Top = 24
                      Width = 44
                      Height = 13
                      Caption = 'C'#243'digo:'
                      FocusControl = DBEdit1
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label7: TLabel
                      Left = 104
                      Top = 45
                      Width = 30
                      Height = 13
                      Caption = 'Tipo:'
                      FocusControl = DBEdit1
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label8: TLabel
                      Left = 68
                      Top = 72
                      Width = 66
                      Height = 13
                      Caption = 'Propiet'#225'rio:'
                      FocusControl = DBEdit2
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label9: TLabel
                      Left = 50
                      Top = 92
                      Width = 84
                      Height = 13
                      Caption = 'Departamento:'
                      FocusControl = DBEdit3
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label10: TLabel
                      Left = 56
                      Top = 115
                      Width = 78
                      Height = 13
                      Caption = 'Equipamento:'
                      FocusControl = DBEdit4
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label11: TLabel
                      Left = 67
                      Top = 138
                      Width = 67
                      Height = 13
                      Caption = 'Num. S'#233'rie:'
                      FocusControl = DBEdit5
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label12: TLabel
                      Left = 94
                      Top = 161
                      Width = 40
                      Height = 13
                      Caption = 'Marca:'
                      FocusControl = DBEdit9
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label13: TLabel
                      Left = 88
                      Top = 184
                      Width = 46
                      Height = 13
                      Caption = 'Modelo:'
                      FocusControl = DBEdit9
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label14: TLabel
                      Left = 110
                      Top = 207
                      Width = 24
                      Height = 13
                      Caption = 'Cor:'
                      FocusControl = DBEdit11
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label15: TLabel
                      Left = 100
                      Top = 230
                      Width = 34
                      Height = 13
                      Caption = 'Valor:'
                      FocusControl = DBEdit7
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label16: TLabel
                      Left = 482
                      Top = 230
                      Width = 137
                      Height = 13
                      Caption = #205'ndice Deprecia'#231#227'o (%):'
                      FocusControl = DBEdit8
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label17: TLabel
                      Left = 90
                      Top = 256
                      Width = 44
                      Height = 13
                      Caption = 'Estado:'
                      FocusControl = DBMemo1
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label18: TLabel
                      Left = 510
                      Top = 207
                      Width = 76
                      Height = 13
                      Caption = 'Dt. Cadastro:'
                      FocusControl = DBEdit6
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label19: TLabel
                      Left = 25
                      Top = 289
                      Width = 109
                      Height = 13
                      Caption = 'Balan'#231'o Gerencial:'
                      FocusControl = DBEdit3
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label20: TLabel
                      Left = 51
                      Top = 313
                      Width = 83
                      Height = 13
                      Caption = 'Tipo de Imob.:'
                      FocusControl = DBEdit3
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label35: TLabel
                      Left = 424
                      Top = 335
                      Width = 111
                      Height = 13
                      Caption = 'Tipo OS Vinculada:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label36: TLabel
                      Left = 7
                      Top = 335
                      Width = 127
                      Height = 13
                      Caption = 'Contrato Manuten'#231#227'o:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label37: TLabel
                      Left = 492
                      Top = 313
                      Width = 41
                      Height = 13
                      Caption = 'Status:'
                      FocusControl = DBEdit3
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label38: TLabel
                      Left = 496
                      Top = 45
                      Width = 90
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Data da Venda:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label39: TLabel
                      Left = 3
                      Top = 358
                      Width = 131
                      Height = 13
                      Caption = 'Portaria de aprova'#231#227'o:'
                      FocusControl = DBMemo3
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object DBEdit1: TDBEdit
                      Left = 137
                      Top = 18
                      Width = 73
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'COD_EQUIP'
                      DataSource = DtmEquipamentos.dsEquipamentos
                      Enabled = False
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 0
                    end
                    object DBComboBox1: TDBComboBox
                      Left = 137
                      Top = 42
                      Width = 192
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'TIP_EQUIP'
                      DataSource = DtmEquipamentos.dsEquipamentos
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ItemHeight = 13
                      Items.Strings = (
                        'EXTERNO'
                        'INTERNO')
                      ParentFont = False
                      TabOrder = 1
                      OnExit = DBComboBox1Exit
                    end
                    object DBEdit2: TDBEdit
                      Left = 137
                      Top = 66
                      Width = 73
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'COD_PROP'
                      DataSource = DtmEquipamentos.dsEquipamentos
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 2
                      OnExit = DBEdit2Exit
                      OnKeyDown = DBEdit2KeyDown
                    end
                    object DBLookupComboBox1: TDBLookupComboBox
                      Left = 216
                      Top = 66
                      Width = 470
                      Height = 21
                      DataField = 'COD_PROP'
                      DataSource = DtmEquipamentos.dsEquipamentos
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ListSource = DtmEquipamentos.dsLocProprietario
                      ParentFont = False
                      TabOrder = 3
                    end
                    object DBLookupComboBox2: TDBLookupComboBox
                      Left = 216
                      Top = 89
                      Width = 470
                      Height = 21
                      DataField = 'COD_DEPART'
                      DataSource = DtmEquipamentos.dsEquipamentos
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      KeyField = 'COD_DEPTO'
                      ListField = 'NOME_DEPTO'
                      ListSource = DtmEquipamentos.dsLocDepartamento
                      ParentFont = False
                      TabOrder = 5
                    end
                    object DBEdit3: TDBEdit
                      Left = 137
                      Top = 89
                      Width = 73
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'COD_DEPART'
                      DataSource = DtmEquipamentos.dsEquipamentos
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 4
                      OnKeyDown = DBEdit3KeyDown
                    end
                    object DBEdit4: TDBEdit
                      Left = 137
                      Top = 112
                      Width = 549
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'NOM_EQUIP'
                      DataSource = DtmEquipamentos.dsEquipamentos
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 6
                    end
                    object DBEdit5: TDBEdit
                      Left = 137
                      Top = 135
                      Width = 549
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'N_SERIE'
                      DataSource = DtmEquipamentos.dsEquipamentos
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 7
                    end
                    object DBEdit9: TDBEdit
                      Left = 137
                      Top = 158
                      Width = 73
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'COD_MARCA'
                      DataSource = DtmEquipamentos.dsEquipamentos
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 8
                      OnExit = DBEdit9Exit
                      OnKeyDown = DBEdit9KeyDown
                    end
                    object DBEdit12: TDBEdit
                      Left = 216
                      Top = 158
                      Width = 470
                      Height = 21
                      DataField = 'MARCA'
                      DataSource = DtmEquipamentos.dsEquipamentos
                      Enabled = False
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 9
                    end
                    object DBEdit10: TDBEdit
                      Left = 137
                      Top = 181
                      Width = 549
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'MODELO'
                      DataSource = DtmEquipamentos.dsEquipamentos
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 10
                    end
                    object DBEdit11: TDBEdit
                      Left = 137
                      Top = 204
                      Width = 327
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'COR'
                      DataSource = DtmEquipamentos.dsEquipamentos
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 11
                    end
                    object DBEdit7: TDBEdit
                      Left = 137
                      Top = 227
                      Width = 73
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'VLR_EQUI'
                      DataSource = DtmEquipamentos.dsEquipamentos
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 13
                    end
                    object DBEdit8: TDBEdit
                      Left = 622
                      Top = 227
                      Width = 64
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'IND_DEPREC'
                      DataSource = DtmEquipamentos.dsEquipamentos
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 14
                      OnExit = DBEdit8Exit
                    end
                    object DBMemo1: TDBMemo
                      Left = 137
                      Top = 249
                      Width = 549
                      Height = 37
                      DataField = 'ESTADO_EQUI'
                      DataSource = DtmEquipamentos.dsEquipamentos
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                      ScrollBars = ssVertical
                      TabOrder = 15
                    end
                    object DBEdit6: TDBEdit
                      Left = 589
                      Top = 204
                      Width = 97
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'DAT_CAD_EQUI'
                      DataSource = DtmEquipamentos.dsEquipamentos
                      Enabled = False
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 12
                    end
                    object DBLookupComboBox3: TDBLookupComboBox
                      Left = 137
                      Top = 288
                      Width = 549
                      Height = 21
                      DataField = 'CODSEQ_BALANCO'
                      DataSource = DtmEquipamentos.dsEquipamentos
                      DropDownRows = 10
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      KeyField = 'CODSEQ_BALANCO'
                      ListField = 'DESC_BALANCO;SUBTIPO;SINAL'
                      ListSource = DtmEquipamentos.DtDadosDRE
                      ParentFont = False
                      TabOrder = 16
                    end
                    object DBComboBox2: TDBComboBox
                      Left = 137
                      Top = 311
                      Width = 145
                      Height = 21
                      DataField = 'TIPEQUIP'
                      DataSource = DtmEquipamentos.dsEquipamentos
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ItemHeight = 13
                      Items.Strings = (
                        'Equipamentos'
                        'Veiculos'
                        'M'#243'veis'
                        'Ferramentas'
                        'Im'#243'veis')
                      ParentFont = False
                      TabOrder = 17
                    end
                    object DBComboBox3: TDBComboBox
                      Left = 137
                      Top = 332
                      Width = 73
                      Height = 21
                      DataField = 'COMCONTRATO'
                      DataSource = DtmEquipamentos.dsEquipamentos
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ItemHeight = 13
                      Items.Strings = (
                        'N'#195'O'
                        'SIM')
                      ParentFont = False
                      TabOrder = 19
                      OnExit = DBComboBox3Exit
                      OnKeyPress = DBComboBox3KeyPress
                    end
                    object DBComboBox4: TDBComboBox
                      Left = 541
                      Top = 332
                      Width = 145
                      Height = 21
                      DataField = 'TIPOOSVINC'
                      DataSource = DtmEquipamentos.dsEquipamentos
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ItemHeight = 13
                      Items.Strings = (
                        'Equipamentos'
                        'Veiculos'
                        'M'#243'veis'
                        'Ferramentas'
                        'Im'#243'veis')
                      ParentFont = False
                      TabOrder = 20
                      OnExit = DBComboBox4Exit
                    end
                    object DBComboBox5: TDBComboBox
                      Left = 541
                      Top = 311
                      Width = 145
                      Height = 21
                      DataField = 'STATUS_V'
                      DataSource = DtmEquipamentos.dsEquipamentos
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ItemHeight = 13
                      Items.Strings = (
                        'N - N'#227'o Vendido'
                        'V - Vendido')
                      ParentFont = False
                      TabOrder = 18
                    end
                    object s: TDBEdit
                      Left = 589
                      Top = 42
                      Width = 97
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'DATA_VEN'
                      DataSource = DtmEquipamentos.dsEquipamentos
                      Enabled = False
                      TabOrder = 22
                    end
                    object DBMemo3: TDBMemo
                      Left = 137
                      Top = 355
                      Width = 549
                      Height = 30
                      DataField = 'PORTARIA_MODELO'
                      DataSource = DtmEquipamentos.dsEquipamentos
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                      ScrollBars = ssVertical
                      TabOrder = 21
                    end
                  end
                  object GroupBox6: TGroupBox
                    Left = 0
                    Top = 385
                    Width = 772
                    Height = 92
                    Align = alBottom
                    Caption = 'Dados ECF (Emissor de Cupom Fiscal)'
                    TabOrder = 1
                    Visible = False
                    object Label29: TLabel
                      Left = 55
                      Top = 18
                      Width = 79
                      Height = 13
                      Caption = 'Identifica'#231#227'o:'
                      Font.Charset = ANSI_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label30: TLabel
                      Left = 57
                      Top = 42
                      Width = 77
                      Height = 13
                      Caption = 'N'#186' S'#233'rie Fab:'
                      Font.Charset = ANSI_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label31: TLabel
                      Left = 48
                      Top = 66
                      Width = 86
                      Height = 13
                      Caption = 'N'#186' Mem Fiscal:'
                      Font.Charset = ANSI_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object DBEdit16: TDBEdit
                      Left = 137
                      Top = 15
                      Width = 365
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'IDENTIFICACAO'
                      DataSource = DtmEquipamentos.dsEquipamentos
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 0
                    end
                    object DBEdit17: TDBEdit
                      Left = 137
                      Top = 39
                      Width = 365
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'N_SERIE_FAB'
                      DataSource = DtmEquipamentos.dsEquipamentos
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 1
                    end
                    object DBEdit18: TDBEdit
                      Left = 137
                      Top = 63
                      Width = 365
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'N_MEMORIA_FISCAL'
                      DataSource = DtmEquipamentos.dsEquipamentos
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 2
                    end
                  end
                end
              end
              object TabSheet4: TTabSheet
                Caption = 'Servi'#231'os'
                ImageIndex = 1
                ExplicitLeft = 0
                ExplicitTop = 0
                ExplicitWidth = 0
                ExplicitHeight = 0
                object ScrollBox4: TScrollBox
                  Left = 0
                  Top = 0
                  Width = 776
                  Height = 481
                  Align = alClient
                  TabOrder = 0
                  object GroupBox7: TGroupBox
                    Left = 0
                    Top = 0
                    Width = 772
                    Height = 477
                    Align = alTop
                    Caption = 'Servi'#231'os'
                    TabOrder = 0
                    object pnServicosSugeridos: TPanel
                      Left = 2
                      Top = 15
                      Width = 768
                      Height = 194
                      Align = alTop
                      TabOrder = 0
                      object Panel8: TPanel
                        Left = 1
                        Top = 160
                        Width = 766
                        Height = 33
                        Align = alBottom
                        BevelKind = bkTile
                        BevelOuter = bvNone
                        TabOrder = 0
                        object Label211: TLabel
                          Left = 523
                          Top = 6
                          Width = 93
                          Height = 16
                          Caption = 'F2 - Marca linha'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -13
                          Font.Name = 'Tahoma'
                          Font.Style = []
                          ParentFont = False
                        end
                        object Label212: TLabel
                          Left = 635
                          Top = 6
                          Width = 112
                          Height = 16
                          Caption = 'F3 - Demarca Linha'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -13
                          Font.Name = 'Tahoma'
                          Font.Style = []
                          ParentFont = False
                        end
                      end
                      object DBGrid3: TDBGrid
                        Left = 1
                        Top = 1
                        Width = 766
                        Height = 159
                        Align = alClient
                        DataSource = DtmEquipamentos.dsServicosSugeridos
                        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                        TabOrder = 1
                        TitleFont.Charset = DEFAULT_CHARSET
                        TitleFont.Color = clWindowText
                        TitleFont.Height = -11
                        TitleFont.Name = 'Tahoma'
                        TitleFont.Style = []
                        OnCellClick = DBGrid3CellClick
                        OnDrawColumnCell = DBGrid3DrawColumnCell
                        OnDblClick = DBGrid3DblClick
                        OnKeyDown = DBGrid3KeyDown
                      end
                    end
                  end
                end
              end
            end
            inherited Panel3: TPanel
              Top = 512
              Width = 784
              ExplicitTop = 512
              ExplicitWidth = 784
              inherited BitBtn4: TBitBtn
                Hint = 'Salvar Registro - [EQU006]'
              end
              inherited BitBtn5: TBitBtn
                Hint = 'Salvar Registro - [EQU007]'
              end
            end
          end
        end
        inherited TabSheet2: TTabSheet
          OnShow = TabSheet2Show
          ExplicitWidth = 784
          ExplicitHeight = 560
          inherited GroupBox3: TGroupBox
            Width = 784
            Height = 193
            ExplicitWidth = 784
            ExplicitHeight = 193
            inherited imgInformation: TImage
              Left = 758
              Height = 176
              ExplicitLeft = 758
              ExplicitHeight = 176
            end
            object SpeedButton40: TSpeedButton [6]
              Left = 699
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
            inherited BitBtn3: TBitBtn
              Hint = 'Novo cadastro - [EQU001]'
            end
            inherited CheckBox3: TCheckBox
              Enabled = False
              Visible = False
            end
            object groupAdicional: TGroupBox
              Left = 3
              Top = 70
              Width = 277
              Height = 121
              Caption = 'Pesquisa Adicional'
              TabOrder = 11
              Visible = False
              OnExit = groupAdicionalExit
              object Label43: TLabel
                Left = 7
                Top = 54
                Width = 51
                Height = 13
                Caption = 'Conte'#250'do:'
              end
              object Label44: TLabel
                Left = 21
                Top = 28
                Width = 37
                Height = 13
                Caption = 'Campo:'
              end
              object Label45: TLabel
                Left = 157
                Top = 54
                Width = 16
                Height = 13
                Caption = 'at'#233
              end
              object Label46: TLabel
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
                ItemHeight = 0
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
                Items.Strings = (
                  'Come'#231'a'
                  'Igual'
                  'Diferente'
                  'Maior'
                  'Menor'
                  'Esta contido')
              end
            end
          end
          inherited Panel1: TPanel
            Top = 193
            Width = 784
            Height = 367
            ExplicitTop = 193
            ExplicitWidth = 784
            ExplicitHeight = 367
            inherited Splitter1: TSplitter
              Height = 306
              ExplicitHeight = 430
            end
            inherited DBGrid1: TDBGrid
              Width = 491
              Height = 306
              OnCellClick = DBGrid1CellClick
              OnDrawColumnCell = DBGrid1DrawColumnCell
              OnKeyDown = DBGrid1KeyDown
              Columns = <
                item
                  Expanded = False
                  FieldName = 'COD_EQUIP'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'COD_EMPRESA'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DAT_CAD_EQUI'
                  Visible = True
                end
                item
                  ButtonStyle = cbsEllipsis
                  Expanded = False
                  FieldName = 'ESTADO_EQUI'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'TIP_EQUIP'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'VLR_EQUI'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'IND_DEPREC'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'COD_DEPART'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'COD_PROP'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NOM_EQUIP'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'N_SERIE'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'MARCA'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'MODELO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'COR'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ATIVO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'COD_MARCA'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'IDENTIFICACAO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'N_SERIE_FAB'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'N_MEMORIA_FISCAL'
                  Visible = True
                end>
            end
            inherited Panel2: TPanel
              Width = 780
              ExplicitWidth = 780
              inherited SpeedButton1: TSpeedButton
                Hint = 'Editar Registro - [EQU002]'
              end
              inherited SpeedButton2: TSpeedButton
                Hint = 'Apagar Registro - [EQU003]'
                OnClick = SpeedButton2Click
              end
              inherited SpeedButton3: TSpeedButton
                Enabled = False
              end
              inherited SpeedButton4: TSpeedButton
                OnClick = SpeedButton25Click
              end
              inherited SpeedButton5: TSpeedButton
                Hint = 'Recuperar registro - [EQU005]'
                Visible = False
                OnClick = SpeedButton5Click
              end
              inherited SpeedButton6: TSpeedButton
                Hint = 'Calcular Deprecia'#231#227'o - [EQU017]'
                Glyph.Data = {
                  76060000424D7606000000000000360400002800000018000000180000000100
                  08000000000040020000C30E0000C30E00000001000000010000393131006352
                  3100424239005A4A390063523900845A3900CE7B3900CE8C390042424200AD73
                  4200B5734200C67B4200BD844200C6844200CE844200C68C42008C6B4A00A57B
                  4A00AD7B4A00B5844A00BD844A00C6844A00CE844A00CE8C4A00D68C4A00CE94
                  4A00D6944A00DE944A0052425200525252008C635200946B520094735200A57B
                  5200AD7B5200BD845200C6845200CE845200CE8C5200D68C5200DE8C5200CE94
                  5200DE9452005A5A5A0073635A00CE845A00C68C5A00CE945A00D6945A005A63
                  63006363630073636300DE946300DEA56B0052527300BD9C73007B7B7B00847B
                  7B00E7AD7B005A4A8400847B84007B84840084848400A59C8400E7C684006B84
                  8C0084848C008C848C008C948C0094948C00A5A58C00F7BD8C00524A94007B6B
                  94006B8C9400848C9400948C940063949400949494009C94940094A594008CAD
                  9400BDAD9400634A9C007B6B9C008C8C9C00948C9C00949C9C009C9C9C008CA5
                  9C0094A59C008CAD9C00EFC69C00F7C69C00F7DE9C006B8CA500949CA500A59C
                  A5008CA5A500A5A5A500ADA5A500EFCEA500F7D6A500F7DEA500FFDEA5008C84
                  AD00739CAD00EFDEAD00F7DEAD00FFDEAD00EFE7AD00F7E7AD00FFE7AD00F7EF
                  AD00FFEFAD006B6BB500736BB500F7E7B500FFE7B500EFEFB500FFEFB500FFF7
                  B5005A4ABD00845ABD007B73BD00B5B5BD00BDB5BD00BDBDBD00FFE7BD00F7EF
                  BD00FFEFBD00F7F7BD00FFF7BD008C73C60073ADC6007BB5C60073BDC6007BC6
                  C6007BD6C600FFE7C600524ACE0073BDCE006BC6CE00CECECE006B52D6008C63
                  D600948CD6006B4ADE008C63DE009484DE009C94DE00ADA5DE006BC6DE0073C6
                  DE008C63E700946BE7008C73E7009473E7008C7BE700947BE7009C84E700A58C
                  E700AD94E7006B39EF008C84EF009484EF00948CEF00A58CEF00AD94EF00A59C
                  EF0063CEEF009473F7009C84F7009C8CF700A58CF700AD94F700AD9CF700BDA5
                  F70063D6F700FF00FF00AD9CFF00B59CFF00B5A5FF005ADEFF0063DEFF0063E7
                  FF006BE7FF0073E7FF006BEFFF0073EFFF007BEFFF0084EFFF006BF7FF0073F7
                  FF007BF7FF0084F7FF007BFFFF0084FFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B3B3B3B3B3B3
                  B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3
                  B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3
                  B3B3B3B3B3B3B3B357573232323232325757B3B3B3B3B3B3B3B3B3B3B3B35708
                  0310222F3030191320040043B3B3B3B3B3B3B3B3B32C01212D272A19171A1827
                  26292E051CB3B3B3B3B3B3B3331F24261618171526242616182425113B36B3B3
                  B3B3B3571E23251515150E170E1514170E0F0F117A8C3EB3B3B3B36312150D0B
                  34476581828281785D351609539008B3B3B3B3450C062F676E7781767871786F
                  8B77763748A31DB3B3B3B34F0A40766F6F6D766E6E7076707075524292901DB3
                  B3B3B34E3A6766676C676C6C6D6D6C6B3F5697B1B69E2BB3B3B3B3585C6D6868
                  5E5E67676C654669A2A8B0A9B5AF32B3B3B3B36151505959595A5A59603CA1A6
                  ADA2A7A696A732B3B3B3B37D8AC5C2C4C4C5C4C4C38E85A0A09E9FACA59532B3
                  B3B3B3574DBDC1BDBEC2BDBCC2BD897C9BAB9C9C9D5463B3B3B3B3B34C6ABFBE
                  BBBBBEBBBDBCBA8873919A914938B3B3B3B3B3B3B34E5F99BAB9BABABABBBABB
                  8D747B4944B3B3B3B3B3B3B3B3B3574B4A8698AAB8B7AA9887413D57B3B3B3B3
                  B3B3B3B3B3B3B3B3577D634E3E3955607D57B3B3B3B3B3B3B3B3B3B3B3B3B3B3
                  B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3
                  B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3
                  B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3}
                OnClick = SpeedButton6Click
              end
              inherited SpeedButton7: TSpeedButton
                Hint = 'Informa'#231#245'es Para o Sped Fiscal - [EQU032]'
                Glyph.Data = {
                  B6070000424DB6070000000000003604000028000000200000001C0000000100
                  08000000000080030000C40E0000C40E00000001000000000000000000000000
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
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00EFEFEFEFEFEF
                  EFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEF
                  EFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEF
                  EFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEF
                  EFEFEFEFEFEFF6080808EFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEF
                  EFEFEFEFEF07070707F7070707EFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEF07
                  070707F7F7F7F7F7F7F7F7F707F707EFEFEFEFEFEFEFEFEFEFEFEFEF07F5F7F7
                  ED07F7F7F7F7EE07EEF7F7F7F7F7A4A4F707EFEFEFEFEFEFEFEFEFEFED070707
                  07070707070808080808080808070707F5080707EFEFEFEFEFEFEFEF07070707
                  070707070808080808080808080707070707EFEFEFEFEFEFEFEFEFEFEF070707
                  F7070707070707070707070707070707070708EFEFEFEFEFEFEFEFEFEFEF0707
                  070707070707070707070707F7F7F7F7A4A5F707EFEFEFEFEFEFEFEFEF080707
                  0707070708F6F6F6F6F6F6F6F60808080707F70707EFEFEFEFEFEFEFEF080707
                  080708F6F6F6F6F6FFF6F6F6F608080707070708EFEFEFEFEFEFEFEFEFEF0808
                  080708F6F6F6F6F6F6F6F6080808080808070708EFEFEFEFEFEFEFEFEFEF0707
                  07080707070707F7F7F7F7F7F7F7F7A5A4ADF7F708EFEFEFEFEFEFEFEFEF0807
                  08080808070707F6F6F6F6F60808070707070707070707EFEFEFEFEFEFEFF608
                  0808080707F6F6070807F608F6F607F6F6F6F7F6EFEFEFEFEFEFEFEFEFEFEF07
                  08080807F6B6F608F6F60807F60707F6AEF607F6EFEFEFEFEFEFEFEFEFEFEFEF
                  07070807F7F60707F608F607F6B708F6F60708EFEFEFEFEFEFEFEFEFEFEFEFEF
                  0707070707F7070707070707070707070707EFEFEFEFEFEFEFEFEFEFEFEFEFEF
                  EF07070707070707070707070707070707EFEFEFEFEFEFEFEFEFEFEFEFEFEFEF
                  EFEF07F6F6F608F608F6F6F6F6F60807EFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEF
                  EFEFEFEF08F6FFFFF6F6F6F6F60707EFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEF
                  EFEFEFEFEFEF07070707070708EFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEF
                  EFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEF
                  EFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEF
                  EFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEF
                  EFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEF}
                OnClick = SpeedButton7Click
              end
              inherited SpeedButton8: TSpeedButton
                Hint = 'Manuten'#231#227'o de Equipamentos Internos - [EQU018]'
                Glyph.Data = {
                  76060000424D7606000000000000360400002800000018000000180000000100
                  08000000000040020000C30E0000C30E00000001000000010000CE5A0000CE63
                  0000CE6B0000EF840000F78C0000C66B0800CE6B0800CE6B1000D66B1000CE73
                  1000D6731000CE731800B56B2100A55A2900736B4200D68C4200847363007363
                  6B00947B6B00736373004A317B0063737B00947B7B009C847B005A7B8400A58C
                  8400A5948400527B8C00AD9C8C00B59C8C00FFC68C00AD9C9400B59C9400B5A5
                  9400BDA59400CEAD940039429C00B5A59C00C6AD9C00FFCE9C00FFD69C003942
                  A500846BA5001884A500BDADA500E7C6A500D6CEA500FFCEA500FFD6A500FFDE
                  A5001884AD006394AD00E7C6AD00EFC6AD00FFD6AD00FFDEAD00FFE7AD008473
                  B5000084B50073A5B500C6BDB500D6C6B500E7CEB500FFD6B500EFDEB500FFDE
                  B500FFE7B5006B63BD00319CBD00CEC6BD00D6C6BD00FFDEBD00FFE7BD00FFEF
                  BD000018C6000818C600394AC6004A52C6000894C6001894C600299CC6004AA5
                  C600D6C6C600D6CEC600EFD6C600F7D6C600FFDEC600FFE7C6001831CE008484
                  CE008C8CCE000094CE000894CE0010A5CE004AA5CE00ADA5CE0042ADCE004AAD
                  CE0063ADCE006BB5CE008CBDCE00DEC6CE00DED6CE00FFE7CE00FFEFCE000829
                  D6001029D600009CD60008A5D60010ADD6004AADD600ADADD60063B5D6007BB5
                  D600A5C6D600C6CED600DED6D600F7E7D600FFE7D600FFEFD6001029DE0000A5
                  DE0008A5DE0010ADDE0018ADDE0021B5DE00BDCEDE00FFEFDE00FFF7DE00FFFF
                  DE000029E7000829E7001052E70000ADE70008B5E70042CEE7004AD6E700B5D6
                  E700BDD6E700E7E7E700EFE7E700F7EFE700FFEFE700FFF7E700FFFFE70000BD
                  EF00E7EFEF00FFF7EF00FFFFEF000031F700084AF700085AF70000BDF70000C6
                  F70029D6F70039D6F700EFEFF700EFF7F700F7F7F700FFF7F700FFFFF700FF00
                  FF000021FF000029FF000031FF000852FF00106BFF001073FF0000C6FF0000CE
                  FF0008DEFF00DEEFFF00F7FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A1A1A1A1A1A1
                  A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1
                  A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1
                  A1A1A1A1A1A1A1A13315A13218A1A1A1A14B4A24A1A1A1A1A1A1A1A1A1A1A1A1
                  851BA14E4EA1A1A1A1A4A429A1A1A1A1A1A1A1A10B0B070EA96C2B793A0C0707
                  0D83A3140605050501A1A1A10B7F93735DA9996B3B565647346AA22A312F271E
                  01A1A1A10B9FADAD6491984F757F7777546AA239423F362701A1A1A10B93ADAD
                  8B7B98517F7F7777546AA23948413F2F01A1A1A10B93ADAD9C6D98518E8E7F77
                  6583A2434847412F01A1A1A10B93ADAD9C7B99518E8F8E805F95A44C47474736
                  01A1A1A10B93ADAD9C7CA85E93938F905A97A5585457563601A1A1A10B93ADAD
                  9C7CA8619393939059A7A66A5457674101A1A1A10B93ADAD9C7DA8619FADA094
                  5F84964D67773E2D01A1A1A10B93ADAD927D9962AD66528C4511131680671223
                  01A1A1A10B93AD9E639AAA6C721917191F212117261D102D01A1A1A10B93AD8A
                  879B6D9144203C19455353452517225701A1A1A10B93AD8988607E5B621D1C1C
                  252C2C251F3D8F6701A1A1A10B9FAD9D7050AB71AB9E9CADAC8B8B8B93A09376
                  01A1A1A10B374242412E404848484842484842423737312701A1A1A106030303
                  0303030303030303030303030303030301A1A1A10F0001010101010101010101
                  01010101010101010FA1A1A1A10A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A
                  A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1}
                OnClick = SpeedButton8Click
              end
              inherited SpeedButton11: TSpeedButton
                Hint = 'Vender Equipamento - [EQU032]'
                Glyph.Data = {
                  F6060000424DF606000000000000360000002800000018000000180000000100
                  180000000000C0060000C30E0000C30E00000000000000000000FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFB3C7977EA8407DA83F79A43977A33676A33677A3
                  3677A33677A33676A33677A33677A33676A33677A33679A4397DA83F7EA840B7
                  C99DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7DA83F7BA53D77A338ABC683
                  BED29FBED39FBCD19DBED2A0C2D5A6C4D8A8BED2A0BCD19DBED39FBED29FAFC9
                  8979A4397BA53D7BA53DFF00FFB2773DB3783EB2773DB2773EFF00FF7DA83F77
                  A33A6E9D2AFAFBF8FEFEFEFFFFFFFEFEFEF9FAF8B3CC91B3CC90F8FAF4FEFEFE
                  FFFFFFFEFEFEFEFEFE6F9E2A77A33A7BA53DFF00FFB2773DB3783EB2773DB278
                  3EFF00FF7AA53B9CBD6EE8EFDDFFFFFFFFFFFFFFFFFFF5F9F275A23477A33677
                  A33674A233F4F8F0FFFFFFFFFFFFFFFFFFE9F0DF9FBD717AA53BFF00FFB47A42
                  B3783EB3783EB3793FFF00FF76A336C3D5A6FEFEFEFFFFFFFCFCFCFFFFFFAAC4
                  8076A2377BA53E7DA83F76A237A5C37DFFFFFFFCFCFCFCFCFCFFFFFFC6D9AC75
                  A235FF00FFB47D47B3783EB2773DB2783FFF00FF76A336C0D4A2FEFEFEFFFFFF
                  FCFCFCFFFFFF86AD4F7AA43C7BA53E7DA83F7AA43C83AC4AFFFFFFFCFCFCFCFC
                  FCFFFFFFC3D6A875A235FF00FFB88554B3783EB2773DB2783FFF00FF76A336C0
                  D4A2FFFFFFFFFFFFFFFFFFFFFFFF86AD4E7BA63C7DA83F7DA83F7BA63D84AC4A
                  FFFFFFFFFFFFFFFFFFFFFFFFC3D6A876A336FF00FFBD9064B3783EB3783EB379
                  3FFF00FF76A336C3D6A6FEFEFEFFFFFFFCFCFCFFFFFFAAC48276A2367BA53E7D
                  A83F76A237A6C37DFFFFFFFCFCFCFDFDFDFFFFFFCADBAF75A235FF00FFC19973
                  B3783EB2773DB2783EFF00FF7AA53B9ABB6AE1EAD4FFFFFFFCFCFCFFFFFFF4F8
                  F175A23675A23677A33674A234F3F7EFFFFFFFFDFDFDFEFEFE99BB697AA43B7B
                  A53EFF00FFC5A382B3783EB2773DB2773EFF00FF7DA83F7AA53B6D9D27FAFBF6
                  FFFFFFFFFFFFFFFFFFFBFCFAB6CD93B4CD92FAFBF6FFFFFFFFFFFFFFFFFFC1D6
                  A473A1317CA63E7DA83FFF00FFCAAE92B3783EB3783EB3783EFF00FF7DA83F7B
                  A53D77A338ABC684BED29FBED39DBCD19DBED2A0C2D5A6C3D8A6BED2A0BCD19D
                  BED39DBFD3A293B6627BA53C7BA53D7BA53DFF00FFCEB7A1B3783EB2773DB277
                  3DFF00FFAFC5917DA83F7DA83F79A43977A33676A33677A33677A33677A33676
                  A33677A33677A33676A33677A3367BA53C7DA83F7DA83FB3C696FF00FFD3C2B1
                  B3783EB3783EB2773DBF946AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFB3783EB2773DB3783EB3783EB3783EB3783EB3783EB2773D
                  B3783EB2773DB2773DB2773DB3783EB3783EB3783EB3783EB2773DB2773DD4C5
                  B5FF00FFFF00FFFF00FFFF00FFFF00FFB3783EB2773DB2773DC4A07CFF00FFC4
                  A07CB2773DB2773DB3783EB2773DB2773DB2773DC4A07CFF00FFC4A07CB3783E
                  B2773DB2773DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB3783FB2773DB277
                  3DFF00FFFF00FFFF00FFB2773DB2773DB3783EB2773DB2773DB2773DFF00FFFF
                  00FFFF00FFB3783EB2773DB2773DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  B6804BB3783EB2773DC4A07CFF00FFC4A07CB2773DB3783EB3783EB3783EB378
                  3EB3783EC4A07CFF00FFC4A07CB3783EB3783EB47B43FF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFBB8A5AB2773DB3783EB2773DB3783EB2773DB2773DB2773D
                  B3783EB2773DB2773DB2773DB3783EB2773DB2773DB2773DB2773DB78451FF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFBF946AB2773DB2773DB3783EB2773DB2
                  773DB3783EB2773DB3783EB2773DB2773DB2773DB3783EB2773DB2773DB3783E
                  B2773DBC8E61FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFCAAE93B2773DCBB197FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD1BEAAB2
                  773DC5A381FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFB47B44B6804BFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFBA8856B2783FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCAAE92B3783EBA8958FF00FF
                  FF00FFFF00FFFF00FFBC8E61B3783EC6A381FF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC4
                  A07DB3783EB2773DB7814DB6814DB2773EB2773DC19871FF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFD2BEABBD9166B47B43B37940BC8D60CEB8A1FF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                OnClick = SpeedButton11Click
              end
              inherited SpeedButton12: TSpeedButton
                Hint = 'Replica de equipamentos - [EQU001]'
                Glyph.Data = {
                  F6060000424DF606000000000000360000002800000018000000180000000100
                  180000000000C0060000C40E0000C40E00000000000000000000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDF8F6FAF3EBF7ECDDF2E4CCEE
                  DCBBEAD2A7E0CFB2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  F1EBD7F8F0E5F3EAD9EFE2C9ECDCBCE9D5AEE4CD9CDFC388DDBF80DDC07FDBBD
                  7ADBBB76DBB975DBBA76DCBA73CBB284F8FAFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFE4D6B1DBCB9ADAC897DAC591DEC892DFC991E0C991E2CC95
                  E4CF98E6D19CE8D5A0EAD8A4EDDCA9EFE1AEF3E8B2DCD1AFFAFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1E8D5F1EBD7F5F0DEF7F5E3FBF9E8FF
                  FFEDFFFFECFAF9E1FAF7DBF8F5D7F8F5D2F7F3CDF7F1C7F7F0C3F9F2C2DACFA9
                  D9BA7FD8C6A8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1EBD7F1EBD7F6F0
                  E8EFE4D7E7D7C5DEC8B2E2C4A6FBF0D4F7F3D6F7F1D2F7F1CDF6F1C9F5EFC5F5
                  EEC0F8F1C2D9CCA5D3B16CD2BF9CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FED1A4FFD2A4A25D3B9E5B369F5D389A5835C27C4CFFEECDF8F9DFF7F7D8F7F7
                  D4F6F6D0F6F6CCF6F5C8F8F5C5DBD2ADF1ECBCDED5BBF8F0E6F4F2F2FFFFFFFF
                  FFFFFFFFFFFFFFFFFED1A4FED1A4A25D3B9C5F3FA56846AA6D49F4B57BF9D0A9
                  F4C7A0F4C49BF4C096F4BD92F4B98EF3B68AF6B489DAAF8DF1EFC0D5C59BDAB6
                  68D4C9B8FFFFFFFFFFFFFFFFFFFFFFFFF3BF99F7BF8CA25D3BA25D3B9C5F3FA2
                  5D3BFFC386F4BF93F0B283F1B384F0B384F0B384F0B284F0B384F3B484D9AF8B
                  F1F0C1D7C9A1E7CE8CD8CFC0FFFFFFFFFFFFFFFFFFFFFFFFF0BB93F5B381A25D
                  3BB26B44A25D3BA6613EFFB275F2B788EDAA77EDAB78EDAB78EDAB77EDAB78EE
                  AC7BF1AE7CD8AD88F0E5B8DCCDA9FAF6C2DBD5C8FFFFFFFFFFFFFFFFFFFFFFFF
                  ECB286F5AA79A25D3B9C4E2DA3512DAA552FA25D3BEFAB7BE7A068E8A06AE8A0
                  69E8A06AEAA46FECA974F1AE7CD7A782EDAF85DAB795F8F5BFDAD4C7FFFFFFFF
                  FFFFFFFFFFFFFFFFE9AC7CF39059A25D3BB75D37AA5837AB5A3AA25D3BEDA371
                  E4975CE5975DE5995EE79D63E9A26DECAA76F1B07ED8A984EAAD7ED9B894F9F9
                  C3DAD5C8FFFFFFFFFFFFFFFFFFFFFFFFE5A06BEC8A52F28650F88D54DE7E4FF0
                  8955F98D56EC9C66E28E4EE49152E7975BE99E64ECA670F0AD7AF5B685DBAC88
                  E8A878D9AF8AF8D09FDBCEC2FFFFFFFFFFFFFFFFFFFFFFFFF4D7C2F4D5BDE0A8
                  7AE1A67ADB9F73C9946ECB956ECF976FD69E76D5A27AD8A47CDCAA84DFB18FE3
                  BA99E9C2A3C49D7EEBAA79D7A883F5B282DACABEFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFE49C62F88953A25D3BB6542DA0492BA25D3BFD864BE7A16FDF92
                  57DF9157DE9359DE965EDE9A67E6A574F3B381D7A783F2AF7ADAC9BDFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFDF8B4BEB8C55ED8D58F4945CEB8F59F8965D
                  F4925BE99A60E28E4EE59254E8995DEBA068EFAA74F1B07EF6B98AD8AA86F1AA
                  75DAC9BCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9E9DDF9EADEE6AA77E9
                  9E71D6966EBB8566C08A69C88F6DDFA27AD7A57ED9A47CDBA981DDAE8ADFB493
                  E2BA9BCB9B76F3AD77DAC9BDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFE09152FA6C30A25D3BA25D3BB34A23A25D3BFE7D43E59D64E49051E4
                  9154E69659E89B61EBA36CF0AD7AF2B17EDACABDFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFDF8441E9A776E8A673EDA873EEA872EAA570E9A3
                  72E39358E49458E79A60E99F67ECA772EFAE7CF2B585F7B888D7C5B8FFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFFFFF9FFFFF6FCFF
                  F5F7F9F5F6F6F4F5F5F2F2F2EFEEEDEEEBE8EFEAE7EFEBE7EFEBE8EEEAE7EDE6
                  E0F0F0F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
                OnClick = SpeedButton12Click
              end
              inherited SpeedButton23: TSpeedButton
                Enabled = False
              end
              inherited SpeedButton24: TSpeedButton
                Enabled = False
              end
              inherited SpeedButton25: TSpeedButton
                Hint = 'Ver registros da lixeira - [EQU004]'
                OnClick = SpeedButton25Click
              end
              inherited SpeedButton26: TSpeedButton
                Enabled = False
              end
            end
            inherited GroupBox2: TGroupBox
              Height = 306
              ExplicitHeight = 306
              inherited ScrollBox2: TScrollBox
                Height = 289
                ExplicitHeight = 289
              end
            end
          end
        end
        inherited tsMemo: TTabSheet
          ExplicitWidth = 784
          ExplicitHeight = 560
        end
        object tsDepreciacao: TTabSheet
          Caption = 'Deprecia'#231#227'o de Equipamentos Internos'
          ImageIndex = 2
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object GroupBox5: TGroupBox
            Left = 0
            Top = 0
            Width = 784
            Height = 222
            Align = alTop
            Caption = 'Deprecia'#231#227'o'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            object Label23: TLabel
              Left = 30
              Top = 51
              Width = 129
              Height = 13
              Caption = 'Valor do Equipamento:'
            end
            object DBText2: TDBText
              Left = 162
              Top = 51
              Width = 50
              Height = 13
              AutoSize = True
              DataField = 'VLR_EQUI'
              DataSource = DtmEquipamentos.dsEquipamentos
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label24: TLabel
              Left = 55
              Top = 105
              Width = 104
              Height = 13
              Caption = 'Data do Cadastro:'
            end
            object DBText3: TDBText
              Left = 162
              Top = 105
              Width = 50
              Height = 13
              AutoSize = True
              DataField = 'DAT_CAD_EQUI'
              DataSource = DtmEquipamentos.dsEquipamentos
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label25: TLabel
              Left = 87
              Top = 24
              Width = 71
              Height = 13
              Caption = 'C'#243'd. Equip.:'
            end
            object DBText4: TDBText
              Left = 162
              Top = 24
              Width = 50
              Height = 13
              AutoSize = True
              DataField = 'COD_EQUIP'
              DataSource = DtmEquipamentos.dsEquipamentos
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label26: TLabel
              Left = 23
              Top = 78
              Width = 137
              Height = 13
              Caption = #205'ndice Deprecia'#231#227'o (%):'
            end
            object DBText5: TDBText
              Left = 162
              Top = 78
              Width = 50
              Height = 13
              AutoSize = True
              DataField = 'IND_DEPREC'
              DataSource = DtmEquipamentos.dsEquipamentos
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label27: TLabel
              Left = 56
              Top = 132
              Width = 104
              Height = 13
              Caption = 'Valoriza'#231#227'o Atual:'
            end
            object Label28: TLabel
              Left = 163
              Top = 133
              Width = 8
              Height = 13
              Caption = '0'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label22: TLabel
              Left = 255
              Top = 24
              Width = 78
              Height = 13
              Caption = 'Equipamento:'
            end
            object DBText1: TDBText
              Left = 338
              Top = 24
              Width = 50
              Height = 13
              AutoSize = True
              DataField = 'NOM_EQUIP'
              DataSource = DtmEquipamentos.dsEquipamentos
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBGrid2: TDBGrid
              Left = 255
              Top = 43
              Width = 434
              Height = 102
              DataSource = DtmEquipamentos.dsDepreciacao
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
              ParentFont = False
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = [fsBold]
              Columns = <
                item
                  Expanded = False
                  FieldName = 'MES'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ANO'
                  Width = 76
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'VALOR_DEPRECI'
                  Width = 140
                  Visible = True
                end
                item
                  Alignment = taRightJustify
                  Expanded = False
                  FieldName = 'DATA_DEPRECI'
                  Visible = True
                end>
            end
            object Panel4: TPanel
              Left = 173
              Top = 166
              Width = 443
              Height = 43
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 1
              object BitBtn7: TBitBtn
                Left = 182
                Top = 7
                Width = 75
                Height = 25
                Caption = 'Sair'
                TabOrder = 0
                OnClick = BitBtn7Click
                Glyph.Data = {
                  2E020000424D2E020000000000002E0100002800000010000000100000000100
                  08000000000000010000120B0000120B00003E0000003E00000000000000FFFF
                  FF00FF00FF00BB410000BB420000FFF6EF00E69C5900E69D5900E9A36200FFF4
                  EA00FFF8F200FECA9500FFCE9C00FFD4A900FEEBD800FEF0E200FFF2E500FFF3
                  E700FFFBF700FECE9C00FED3A500FED5AA00FEDAB400FFDCB600FEDDB800FEDD
                  BA00FFE3C500FEE2C400FFE5C900FFE6CA00FEE5CA00FFEBD500FEF3E700FFDA
                  AD00FFEAD100FFFAF400FFD8A700FFD9A900FFDAAB00FFE1B800FFE7C700FEEE
                  D900FFFBF600FFDCAC00FFE1B500FFE7C400FFEFD700FFEAC200FFFAEA00FFFE
                  FB00FFFFFA00FFFFFE00315EFF002A56FF00123BFF00153DFF001841FF001A44
                  FF001D47FF00072BFF00001EFF00000D66000202020202020202020202020202
                  0202020202020202020202020202020202020204040404040404040404040402
                  020202040132302E28272125242F04020202020401050F221B1614130B260402
                  0202020401310A101F1A170D0C2B04020202020401013323110E1C18152C0402
                  02020204010101332A20291D192D040202020204010101010112093D1E2E043D
                  020202040101010101013D363D013D3C3D020204080606060606073D373D3B3D
                  0202020203040404040404043D383D0202020202020202020202023D353D393D
                  020202020202020202023D343D023D3A3D020202020202020202023D0202023D
                  020202020202020202020202020202020202}
              end
            end
          end
        end
        object tsDadosSped: TTabSheet
          Caption = 'Dados Sped'
          ImageIndex = 3
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object pnDadosSped: TPanel
            Left = 3
            Top = 3
            Width = 446
            Height = 462
            BevelKind = bkTile
            BevelOuter = bvNone
            TabOrder = 0
            object DBRadioGroup1: TDBRadioGroup
              Left = 10
              Top = 9
              Width = 422
              Height = 41
              BiDiMode = bdRightToLeftNoAlign
              Caption = 'Entrar na Apura'#231#227'o do Sped Fiscal'
              Columns = 2
              DataField = 'SPED'
              DataSource = DtmEquipamentos.dsEquipamentos
              Items.Strings = (
                'Sim'
                'N'#227'o')
              ParentBackground = True
              ParentBiDiMode = False
              TabOrder = 0
              Values.Strings = (
                'S'
                'N')
            end
            object Panel5: TPanel
              Left = 10
              Top = 56
              Width = 422
              Height = 343
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 1
              object Label32: TLabel
                Left = 265
                Top = 12
                Width = 98
                Height = 13
                Caption = 'C'#243'digo Bem Principal'
                FocusControl = DBEdit14
              end
              object Label33: TLabel
                Left = 19
                Top = 58
                Width = 114
                Height = 13
                Caption = 'Conta Cont'#225'bil do Ativo'
                FocusControl = DBEdit15
              end
              object Label34: TLabel
                Left = 265
                Top = 58
                Width = 98
                Height = 13
                Caption = 'N Parcelas Apropriar'
                FocusControl = DBEdit19
              end
              object DBEdit14: TDBEdit
                Left = 265
                Top = 31
                Width = 134
                Height = 21
                DataField = 'COD_PRNC'
                DataSource = DtmEquipamentos.dsEquipamentos
                TabOrder = 1
              end
              object DBEdit15: TDBEdit
                Left = 19
                Top = 77
                Width = 222
                Height = 21
                DataField = 'COD_CTA_EQ'
                DataSource = DtmEquipamentos.dsEquipamentos
                TabOrder = 2
                OnKeyDown = DBEdit15KeyDown
              end
              object DBEdit19: TDBEdit
                Left = 265
                Top = 77
                Width = 134
                Height = 21
                DataField = 'NR_PARC'
                DataSource = DtmEquipamentos.dsEquipamentos
                TabOrder = 3
              end
              object DBRadioGroup2: TDBRadioGroup
                Left = 19
                Top = 12
                Width = 222
                Height = 40
                BiDiMode = bdLeftToRight
                Caption = 'Identifica'#231#227'o'
                Columns = 2
                DataField = 'IDENT_MERC'
                DataSource = DtmEquipamentos.dsEquipamentos
                Items.Strings = (
                  '1: Bem'
                  '2: Componente')
                ParentBackground = True
                ParentBiDiMode = False
                TabOrder = 0
                Values.Strings = (
                  '1'
                  '2')
              end
              object GroupBox4: TGroupBox
                Left = 19
                Top = 104
                Width = 380
                Height = 225
                Caption = 'Informa'#231#227'o sobre a Utiliza'#231#227'o do Bem'
                TabOrder = 4
                object Label21: TLabel
                  Left = 16
                  Top = 24
                  Width = 69
                  Height = 13
                  Caption = 'Centro Custos'
                  FocusControl = DBEdit13
                end
                object Label57: TLabel
                  Left = 227
                  Top = 24
                  Width = 38
                  Height = 13
                  Caption = 'Vida Util'
                  FocusControl = DBEdit38
                end
                object DBEdit13: TDBEdit
                  Left = 16
                  Top = 43
                  Width = 134
                  Height = 21
                  DataField = 'COD_CCUS'
                  DataSource = DtmEquipamentos.dsEquipamentos
                  TabOrder = 0
                  OnKeyDown = DBEdit13KeyDown
                end
                object DBMemo2: TDBMemo
                  Left = 16
                  Top = 70
                  Width = 345
                  Height = 139
                  DataField = 'FUNC'
                  DataSource = DtmEquipamentos.dsEquipamentos
                  TabOrder = 2
                  WordWrap = False
                end
                object DBEdit38: TDBEdit
                  Left = 227
                  Top = 43
                  Width = 134
                  Height = 21
                  DataField = 'VIDA_UTIL'
                  DataSource = DtmEquipamentos.dsEquipamentos
                  TabOrder = 1
                  OnKeyDown = DBEdit13KeyDown
                end
              end
            end
            object Panel6: TPanel
              Left = 10
              Top = 405
              Width = 422
              Height = 41
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 2
              object BitBtn8: TBitBtn
                Left = 212
                Top = 6
                Width = 75
                Height = 25
                Hint = 'Cancelar Registro'
                Caption = '&Cancela'
                TabOrder = 0
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
              object BitBtn9: TBitBtn
                Left = 131
                Top = 6
                Width = 75
                Height = 25
                Hint = 'Salvar Registro - [EQU006]'
                Caption = '&Salvar'
                TabOrder = 1
                OnClick = BitBtn9Click
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
            end
          end
        end
        object ts_replica: TTabSheet
          Caption = 'ts_replica'
          ImageIndex = 5
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object pn_replica: TPanel
            Left = 16
            Top = 32
            Width = 417
            Height = 244
            BevelKind = bkTile
            BevelOuter = bvNone
            BorderWidth = 6
            TabOrder = 0
            object Panel7: TPanel
              Left = 6
              Top = 6
              Width = 401
              Height = 187
              Align = alClient
              BevelOuter = bvNone
              BorderWidth = 6
              TabOrder = 0
              object GroupBox8: TGroupBox
                Left = 0
                Top = 80
                Width = 401
                Height = 98
                Caption = 'Cria'#231#227'o de replicas'
                TabOrder = 0
                object Label48: TLabel
                  Left = 22
                  Top = 22
                  Width = 154
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Replicar mais quantos registros?'
                end
                object bt_replica_run: TBitBtn
                  Left = 271
                  Top = 38
                  Width = 117
                  Height = 25
                  Caption = '&Replicar'
                  ModalResult = 1
                  TabOrder = 0
                  OnClick = bt_replica_runClick
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
                object ed_replica_quantidade: TSpinEdit
                  Left = 22
                  Top = 41
                  Width = 176
                  Height = 22
                  MaxValue = 128
                  MinValue = 0
                  TabOrder = 1
                  Value = 0
                end
                object ck_replica_parcelas: TCheckBox
                  Left = 22
                  Top = 69
                  Width = 270
                  Height = 17
                  Caption = 'Replicar tamb'#233'm parcelas de movimenta'#231#227'o CIAP'
                  TabOrder = 2
                end
              end
              object GroupBox9: TGroupBox
                Left = 0
                Top = 0
                Width = 401
                Height = 74
                Caption = 'Informa'#231#245'es'
                TabOrder = 1
                object bt_replica_remove: TBitBtn
                  Left = 271
                  Top = 27
                  Width = 117
                  Height = 25
                  Caption = 'Remover replicas'
                  ModalResult = 1
                  TabOrder = 0
                  OnClick = bt_replica_removeClick
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
                object Panel10: TPanel
                  Left = 2
                  Top = 15
                  Width = 263
                  Height = 57
                  Align = alLeft
                  BevelOuter = bvNone
                  BorderWidth = 6
                  Enabled = False
                  TabOrder = 1
                  object memo_replica: TMemo
                    Left = 6
                    Top = 6
                    Width = 251
                    Height = 45
                    Align = alClient
                    BorderStyle = bsNone
                    Color = clBtnFace
                    Ctl3D = False
                    Lines.Strings = (
                      'Memo1')
                    ParentCtl3D = False
                    TabOrder = 0
                  end
                end
              end
            end
            object Panel9: TPanel
              Left = 6
              Top = 193
              Width = 401
              Height = 41
              Align = alBottom
              BevelKind = bkTile
              BevelOuter = bvNone
              BorderWidth = 6
              Padding.Top = 6
              TabOrder = 1
              object BitBtn14: TBitBtn
                Left = 313
                Top = 6
                Width = 75
                Height = 25
                Caption = '&Voltar'
                ModalResult = 2
                TabOrder = 0
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
            end
          end
        end
      end
    end
    inherited PanelFlash: TPanel
      Height = 593
      ExplicitHeight = 593
      inherited bMarketingHW: TBitBtn
        Top = 571
        ExplicitTop = 571
      end
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 595
    Width = 799
    ExplicitTop = 595
    ExplicitWidth = 799
  end
  inherited PopupMenu1: TPopupMenu
    Left = 612
    Top = 1
    object MarcarTodosEquipamentosClick: TMenuItem
      Caption = 'Marcar Todos Equipamentos'
      OnClick = MarcarTodosEquipamentosClickClick
    end
    object DesmarcarTodosEquipamentosClick: TMenuItem
      Caption = 'Desmarcar Todos Equipamentos'
      OnClick = DesmarcarTodosEquipamentosClickClick
    end
  end
  inherited PopupMenu2: TPopupMenu
    Left = 678
    Top = 3
  end
  inherited Timer1: TTimer
    Left = 646
    Top = 3
  end
end
