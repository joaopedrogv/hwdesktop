inherited frmCadVeicTransp: TfrmCadVeicTransp
  Caption = 'Cadastro de Ve'#237'culos de Transporte'
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
              ActivePage = tsCadastro
              inherited TabSheet3: TTabSheet
                ExplicitLeft = 4
                ExplicitTop = 27
                ExplicitWidth = 775
                ExplicitHeight = 431
              end
              object tsCadastro: TTabSheet
                Caption = 'tsCadastro'
                ImageIndex = 1
                ExplicitLeft = 0
                ExplicitTop = 0
                ExplicitWidth = 0
                ExplicitHeight = 0
                object GroupBox4: TGroupBox
                  Left = 0
                  Top = 0
                  Width = 775
                  Height = 431
                  Align = alClient
                  Caption = 'Cadastro de Ve'#237'culos de Transporte'
                  TabOrder = 0
                  OnEnter = GroupBox4Enter
                  object Label6: TLabel
                    Left = 89
                    Top = 40
                    Width = 33
                    Height = 13
                    Caption = 'Codigo'
                    FocusControl = DBEdit1
                  end
                  object Label7: TLabel
                    Left = 97
                    Top = 67
                    Width = 25
                    Height = 13
                    Caption = 'Placa'
                    FocusControl = DBEdit2
                  end
                  object Label8: TLabel
                    Left = 88
                    Top = 94
                    Width = 34
                    Height = 13
                    Caption = 'Modelo'
                    FocusControl = DBEdit3
                  end
                  object Label9: TLabel
                    Left = 307
                    Top = 67
                    Width = 95
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Peso M'#225'ximo em KG'
                    FocusControl = DBEdit4
                  end
                  object Label10: TLabel
                    Left = 100
                    Top = 121
                    Width = 22
                    Height = 13
                    Caption = 'Tara'
                    FocusControl = DBEdit5
                  end
                  object Label11: TLabel
                    Left = 230
                    Top = 121
                    Width = 172
                    Height = 13
                    Caption = 'Capacidade M'#225'x em Metros C'#250'bicos'
                    FocusControl = DBEdit6
                  end
                  object Label12: TLabel
                    Left = 28
                    Top = 148
                    Width = 94
                    Height = 13
                    Caption = 'Ve'#237'culo de Reboque'
                  end
                  object Label13: TLabel
                    Left = 242
                    Top = 148
                    Width = 160
                    Height = 13
                    Caption = 'UF em que veiculo esta licenciado'
                  end
                  object Label16: TLabel
                    Left = 27
                    Top = 287
                    Width = 95
                    Height = 13
                    Caption = 'Veiculo de Terceiro?'
                  end
                  object DBEdit1: TDBEdit
                    Left = 128
                    Top = 37
                    Width = 75
                    Height = 21
                    DataField = 'COD_VEIC'
                    DataSource = dtmOrdemCarregamento.dsVeicTr
                    TabOrder = 0
                  end
                  object DBEdit2: TDBEdit
                    Left = 128
                    Top = 64
                    Width = 75
                    Height = 21
                    CharCase = ecUpperCase
                    DataField = 'PLACA'
                    DataSource = dtmOrdemCarregamento.dsVeicTr
                    TabOrder = 1
                  end
                  object DBEdit3: TDBEdit
                    Left = 128
                    Top = 91
                    Width = 401
                    Height = 21
                    CharCase = ecUpperCase
                    DataField = 'MODELO'
                    DataSource = dtmOrdemCarregamento.dsVeicTr
                    TabOrder = 3
                  end
                  object DBEdit4: TDBEdit
                    Left = 408
                    Top = 64
                    Width = 121
                    Height = 21
                    DataField = 'PESO_MAXIMO'
                    DataSource = dtmOrdemCarregamento.dsVeicTr
                    TabOrder = 2
                  end
                  object DBEdit5: TDBEdit
                    Left = 128
                    Top = 118
                    Width = 75
                    Height = 21
                    DataField = 'TARA'
                    DataSource = dtmOrdemCarregamento.dsVeicTr
                    TabOrder = 4
                  end
                  object DBEdit6: TDBEdit
                    Left = 408
                    Top = 118
                    Width = 121
                    Height = 21
                    DataField = 'CAPM3'
                    DataSource = dtmOrdemCarregamento.dsVeicTr
                    TabOrder = 5
                  end
                  object GroupBox5: TGroupBox
                    Left = 26
                    Top = 311
                    Width = 727
                    Height = 106
                    Caption = 'Dados do Propriet'#225'rio Terceiro'
                    TabOrder = 11
                    object Label17: TLabel
                      Left = 57
                      Top = 23
                      Width = 39
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Terceiro'
                      FocusControl = DBEdit12
                    end
                    object Label19: TLabel
                      Left = 5
                      Top = 50
                      Width = 91
                      Height = 13
                      Caption = 'RNTRC do Terceiro'
                      FocusControl = DBEdit14
                    end
                    object DBEdit12: TDBEdit
                      Left = 102
                      Top = 20
                      Width = 75
                      Height = 21
                      DataField = 'COD_PROP_TERCEIRO'
                      DataSource = dtmOrdemCarregamento.dsVeicTr
                      TabOrder = 0
                      OnExit = DBEdit12Exit
                      OnKeyDown = DBEdit12KeyDown
                    end
                    object DBLookupComboBox1: TDBLookupComboBox
                      Left = 183
                      Top = 20
                      Width = 320
                      Height = 21
                      DataField = 'COD_PROP_TERCEIRO'
                      DataSource = dtmOrdemCarregamento.dsVeicTr
                      DropDownWidth = 522
                      KeyField = 'COD_CLIENTE'
                      ListField = 'NOME_CLIENTE;CPFCGC'
                      ListSource = dtmOrdemCarregamento.dsTerc
                      TabOrder = 1
                    end
                    object DBEdit14: TDBEdit
                      Left = 102
                      Top = 47
                      Width = 75
                      Height = 21
                      DataField = 'RNTRC_TERCEIRO'
                      DataSource = dtmOrdemCarregamento.dsVeicTr
                      TabOrder = 2
                    end
                    object DBRadioGroup3: TDBRadioGroup
                      Left = 183
                      Top = 43
                      Width = 320
                      Height = 46
                      Caption = 'Tipo Propriet'#225'rio'
                      Columns = 2
                      DataField = 'TPPROP_TERCEIRO'
                      DataSource = dtmOrdemCarregamento.dsVeicTr
                      Items.Strings = (
                        '0 - TAC - Agregado'
                        '1 - TAC - Independente'
                        '2 - Outros')
                      ParentBackground = True
                      TabOrder = 3
                      Values.Strings = (
                        '0'
                        '1'
                        '2')
                    end
                    object CheckBox2: TCheckBox
                      Left = 509
                      Top = 20
                      Width = 92
                      Height = 17
                      Caption = 'Razao Social'
                      TabOrder = 4
                      OnClick = CheckBox2Click
                    end
                  end
                  object DBComboBox1: TDBComboBox
                    Left = 128
                    Top = 145
                    Width = 75
                    Height = 21
                    Style = csDropDownList
                    DataField = 'REBOQUE'
                    DataSource = dtmOrdemCarregamento.dsVeicTr
                    ItemHeight = 0
                    Items.Strings = (
                      'S'
                      'N')
                    TabOrder = 6
                  end
                  object DBComboBox2: TDBComboBox
                    Left = 408
                    Top = 145
                    Width = 121
                    Height = 21
                    Style = csDropDownList
                    DataField = 'UF_LICENCIADO'
                    DataSource = dtmOrdemCarregamento.dsVeicTr
                    ItemHeight = 0
                    TabOrder = 7
                  end
                  object DBRadioGroup1: TDBRadioGroup
                    Left = 128
                    Top = 172
                    Width = 401
                    Height = 50
                    Caption = 'Tipo de Rodado'
                    Columns = 3
                    DataField = 'TPROD'
                    DataSource = dtmOrdemCarregamento.dsVeicTr
                    Items.Strings = (
                      '01 - Truck'
                      '02 - Toco'
                      '03 - Cavalo Mec'#226'nico'
                      '04 - VAN'
                      '05 - Utilit'#225'rio'
                      '06 - Outros')
                    ParentBackground = True
                    TabOrder = 8
                    Values.Strings = (
                      '1'
                      '2'
                      '3'
                      '4'
                      '5'
                      '6')
                  end
                  object DBRadioGroup2: TDBRadioGroup
                    Left = 128
                    Top = 228
                    Width = 401
                    Height = 50
                    Caption = 'Tipo de Carroceria'
                    Columns = 3
                    DataField = 'TPCAR'
                    DataSource = dtmOrdemCarregamento.dsVeicTr
                    Items.Strings = (
                      '00 - N'#227'o aplic'#225'vel'
                      '01 - Aberta'
                      '02 - Fechada/Ba'#250
                      '03 - Granelera'
                      '04 - Porta Container'
                      '05 - Sider')
                    ParentBackground = True
                    TabOrder = 9
                    Values.Strings = (
                      '0'
                      '1'
                      '2'
                      '3'
                      '4'
                      '5')
                  end
                  object DBComboBox3: TDBComboBox
                    Left = 128
                    Top = 284
                    Width = 75
                    Height = 21
                    Style = csDropDownList
                    DataField = 'TERCEIRO'
                    DataSource = dtmOrdemCarregamento.dsVeicTr
                    ItemHeight = 0
                    Items.Strings = (
                      'S'
                      'N')
                    TabOrder = 10
                    OnExit = DBComboBox3Exit
                  end
                end
              end
            end
            inherited Panel3: TPanel
              inherited BitBtn4: TBitBtn
                Hint = 'Salvar dados - [OCR026]'
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
            inherited BitBtn1: TBitBtn
              Hint = 'Clique para pesquisar - [OCR020]'
            end
            inherited BitBtn3: TBitBtn
              Hint = 'Novo cadastro - [OCR021]'
            end
            inherited CheckBox3: TCheckBox
              Enabled = False
              Visible = False
            end
            inherited CheckBox1: TCheckBox
              Enabled = False
              Visible = False
            end
          end
          inherited Panel1: TPanel
            inherited Splitter1: TSplitter
              ExplicitHeight = 376
            end
            inherited DBGrid1: TDBGrid
              OnKeyDown = DBGrid1KeyDown
            end
            inherited Panel2: TPanel
              inherited SpeedButton1: TSpeedButton
                Hint = 'Editar Registro - [OCR022]'
              end
              inherited SpeedButton2: TSpeedButton
                Hint = 'Enviar para Lixeira -  [OCR023]'
                OnClick = SpeedButton2Click
              end
              inherited SpeedButton3: TSpeedButton
                Enabled = False
                Visible = False
              end
              inherited SpeedButton5: TSpeedButton
                OnClick = SpeedButton5Click
              end
              inherited SpeedButton6: TSpeedButton
                Enabled = False
                Visible = False
              end
              inherited SpeedButton7: TSpeedButton
                Enabled = False
                Visible = False
              end
              inherited SpeedButton8: TSpeedButton
                Enabled = False
                Visible = False
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
                Hint = 'Ver registros da lixeira - [OCR027]'
                OnClick = SpeedButton25Click
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
    Left = 758
    Top = 3
  end
  inherited Timer1: TTimer
    Left = 718
    Top = 3
  end
  inherited ApplicationEventsPadrao: TApplicationEvents
    Left = 686
    Top = 3
  end
end
