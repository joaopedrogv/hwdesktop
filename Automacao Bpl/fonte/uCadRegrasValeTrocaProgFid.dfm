inherited frmCadRegrasValeTrocaProgFid: TfrmCadRegrasValeTrocaProgFid
  Caption = 'Regras Vale Regaste/Troca - Programa de fidelidade'
  ClientWidth = 746
  ExplicitWidth = 754
  ExplicitHeight = 598
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelFundo: TPanel
    Width = 746
    ExplicitWidth = 746
    inherited PanelLeft: TPanel
      Width = 741
      ExplicitWidth = 741
      inherited PageControl1: TPageControl
        Width = 739
        ExplicitWidth = 739
        inherited TabSheet1: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 731
          ExplicitHeight = 510
          inherited ScrollBox1: TScrollBox
            Width = 731
            ExplicitWidth = 731
            inherited PageControl3: TPageControl
              Width = 731
              ActivePage = tsCadastro
              ExplicitWidth = 731
              inherited TabSheet3: TTabSheet
                ExplicitLeft = 4
                ExplicitTop = 27
                ExplicitWidth = 723
                ExplicitHeight = 431
                inherited ScrollBox3: TScrollBox
                  Width = 723
                  ExplicitWidth = 723
                  inherited GroupBox1: TGroupBox
                    Width = 719
                    ExplicitWidth = 719
                  end
                end
              end
              object tsCadastro: TTabSheet
                Caption = 'tsCadastro'
                ImageIndex = 1
                object Panel4: TPanel
                  Left = 0
                  Top = 0
                  Width = 723
                  Height = 37
                  Align = alTop
                  BevelOuter = bvNone
                  TabOrder = 0
                  object Label6: TLabel
                    Left = 53
                    Top = 14
                    Width = 47
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Tipo Vale:'
                  end
                  object DBComboBox1: TDBComboBox
                    Left = 106
                    Top = 11
                    Width = 145
                    Height = 21
                    Style = csDropDownList
                    DataField = 'TIPO'
                    DataSource = dtmConfig.dsRegrasValeTrocaProgFid
                    Enabled = False
                    ItemHeight = 13
                    Items.Strings = (
                      'RESGATE'
                      'TROCA')
                    TabOrder = 0
                    OnExit = DBComboBox1Exit
                  end
                end
                object Panel5: TPanel
                  Left = 0
                  Top = 119
                  Width = 723
                  Height = 58
                  Align = alTop
                  BevelOuter = bvNone
                  TabOrder = 2
                  object Label7: TLabel
                    Left = 63
                    Top = 3
                    Width = 37
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Pontos:'
                  end
                  object Label8: TLabel
                    Left = 72
                    Top = 30
                    Width = 28
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Valor:'
                  end
                  object SpeedButton19: TSpeedButton
                    Left = 233
                    Top = 0
                    Width = 23
                    Height = 21
                    Hint = 'Atualizar pontos e pre'#231'o'
                    Glyph.Data = {
                      36050000424D3605000000000000360400002800000010000000100000000100
                      08000000000000010000130B0000130B00000001000000010000000000008484
                      8400FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00020202020202
                      0202020202020202020202020202020202020202020202020202020202020202
                      0202020202020202020202020202020202020202020202020202020202000000
                      0000000000000202020202020201000001020202020002020202020202020100
                      0001020202020202020202020202020100000102020202020202020202020202
                      0100000202020202020202020202020100000102020202020202020202020100
                      0001020202020202020202020201000001020202020002020202020202000000
                      0000000000000202020202020202020202020202020202020202020202020202
                      0202020202020202020202020202020202020202020202020202}
                    OnClick = SpeedButton19Click
                  end
                  object DBEdit1: TDBEdit
                    Left = 106
                    Top = 0
                    Width = 121
                    Height = 21
                    DataField = 'PONTOS'
                    DataSource = dtmConfig.dsRegrasValeTrocaProgFid
                    TabOrder = 0
                    OnExit = DBEdit1Exit
                  end
                  object DBEdit2: TDBEdit
                    Left = 106
                    Top = 27
                    Width = 121
                    Height = 21
                    DataField = 'VALOR'
                    DataSource = dtmConfig.dsRegrasValeTrocaProgFid
                    TabOrder = 1
                  end
                end
                object Panel6: TPanel
                  Left = 0
                  Top = 37
                  Width = 723
                  Height = 82
                  Align = alTop
                  BevelOuter = bvNone
                  TabOrder = 1
                  object Label9: TLabel
                    Left = 5
                    Top = 5
                    Width = 95
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Numero Fabricante:'
                  end
                  object Label10: TLabel
                    Left = 42
                    Top = 32
                    Width = 58
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Grupo Prod:'
                  end
                  object Label11: TLabel
                    Left = 220
                    Top = 32
                    Width = 48
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Cod Prod:'
                  end
                  object Label12: TLabel
                    Left = 50
                    Top = 58
                    Width = 50
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Descri'#231#227'o:'
                  end
                  object Label13: TLabel
                    Left = 428
                    Top = 32
                    Width = 55
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Cod Grade:'
                  end
                  object DBEdit3: TDBEdit
                    Left = 106
                    Top = 1
                    Width = 247
                    Height = 21
                    DataField = 'NUM_FAB_PROD'
                    DataSource = dtmConfig.dsRegrasValeTrocaProgFid
                    TabOrder = 0
                    OnExit = DBEdit3Exit
                    OnKeyDown = DBEdit3KeyDown
                  end
                  object DBEdit4: TDBEdit
                    Left = 106
                    Top = 29
                    Width = 79
                    Height = 21
                    DataField = 'GRUPO_PROD'
                    DataSource = dtmConfig.dsRegrasValeTrocaProgFid
                    Enabled = False
                    TabOrder = 1
                  end
                  object DBEdit5: TDBEdit
                    Left = 274
                    Top = 29
                    Width = 79
                    Height = 21
                    DataField = 'COD_PROD'
                    DataSource = dtmConfig.dsRegrasValeTrocaProgFid
                    Enabled = False
                    TabOrder = 2
                  end
                  object DBEdit6: TDBEdit
                    Left = 106
                    Top = 55
                    Width = 463
                    Height = 21
                    DataField = 'DESCR_PROD'
                    DataSource = dtmConfig.dsRegrasValeTrocaProgFid
                    Enabled = False
                    TabOrder = 4
                    OnExit = DBEdit3Exit
                    OnKeyDown = DBEdit3KeyDown
                  end
                  object DBEdit7: TDBEdit
                    Left = 490
                    Top = 29
                    Width = 79
                    Height = 21
                    DataField = 'COD_GRADE'
                    DataSource = dtmConfig.dsRegrasValeTrocaProgFid
                    Enabled = False
                    TabOrder = 3
                  end
                end
              end
            end
            inherited Panel3: TPanel
              Width = 731
              ExplicitWidth = 731
              inherited LabelSeq: TLabel
                Visible = False
              end
              inherited BitBtn4: TBitBtn
                Hint = 'Salvar Registro - [FID020]'
              end
              inherited BitBtn5: TBitBtn
                Hint = 'Cancelar Registro'
              end
              inherited CheckCadSeq: TCheckBox
                Visible = False
              end
            end
          end
        end
        inherited TabSheet2: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 731
          ExplicitHeight = 510
          inherited GroupBox3: TGroupBox
            Width = 731
            ExplicitWidth = 731
            inherited imgInformation: TImage
              Left = 705
              ExplicitLeft = 705
            end
            inherited BitBtn1: TBitBtn
              Hint = 'Clique para pesquisar - [FID017]'
            end
            inherited BitBtn3: TBitBtn
              Hint = 'Novo cadastro - [FID018]'
            end
            inherited CheckBox3: TCheckBox
              Left = 424
              Top = 50
              Visible = False
              ExplicitLeft = 424
              ExplicitTop = 50
            end
            inherited CheckBox1: TCheckBox
              Left = 519
              Top = 50
              Visible = False
              ExplicitLeft = 519
              ExplicitTop = 50
            end
            object RadioGroup3: TRadioGroup
              Left = 257
              Top = 39
              Width = 422
              Height = 31
              Caption = 'Tipo do vale:'
              Columns = 2
              ItemIndex = 0
              Items.Strings = (
                'Resgate'
                'Troca')
              TabOrder = 11
              OnClick = RadioGroup3Click
            end
          end
          inherited Panel1: TPanel
            Width = 731
            ExplicitWidth = 731
            inherited DBGrid1: TDBGrid
              Width = 438
              OnKeyDown = DBGrid1KeyDown
            end
            inherited Panel2: TPanel
              Width = 727
              ExplicitWidth = 727
              inherited SpeedButton1: TSpeedButton
                Hint = 'Editar Registro - [FID021]'
              end
              inherited SpeedButton2: TSpeedButton
                Hint = 'Apagar Registro - [FID019]'
                OnClick = SpeedButton2Click
              end
              inherited SpeedButton3: TSpeedButton
                Left = 237
                Enabled = False
                Visible = False
                ExplicitLeft = 237
              end
              inherited SpeedButton4: TSpeedButton
                Left = 121
                OnClick = SpeedButton25Click
                ExplicitLeft = 121
              end
              inherited SpeedButton5: TSpeedButton
                Left = 180
                Hint = 'Recuperar registro - [FID024]'
                OnClick = SpeedButton5Click
                ExplicitLeft = 180
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
                Left = 120
                Top = 3
                Hint = 'Ver registros da lixeira - [FID022]'
                OnClick = SpeedButton25Click
                ExplicitLeft = 120
                ExplicitTop = 3
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
          ExplicitWidth = 731
          ExplicitHeight = 510
        end
      end
    end
  end
  inherited StatusBar1: TStatusBar
    Width = 746
    ExplicitWidth = 746
  end
  inherited pnStatusProcessamento: TPanel
    Left = 647
    ExplicitLeft = 647
    inherited lbTextoProcessamento: TLabel
      Width = 477
      Height = 21
    end
  end
end
