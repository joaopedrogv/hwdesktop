inherited frmCadCalendColaboradoExc: TfrmCadCalendColaboradoExc
  Caption = 'Exce'#231#245'es Calend'#225'rio'
  ExplicitWidth = 814
  ExplicitHeight = 603
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
                object GroupBox4: TGroupBox
                  Left = 0
                  Top = 0
                  Width = 775
                  Height = 431
                  Align = alClient
                  Caption = 'Exce'#231#245'es Calend'#225'rio'
                  TabOrder = 0
                  object Label6: TLabel
                    Left = 61
                    Top = 40
                    Width = 27
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Data:'
                  end
                  object Label7: TLabel
                    Left = 52
                    Top = 72
                    Width = 36
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Motivo:'
                  end
                  object Label8: TLabel
                    Left = 46
                    Top = 105
                    Width = 42
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Hora Ini:'
                  end
                  object Label9: TLabel
                    Left = 242
                    Top = 105
                    Width = 46
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Hora Fim:'
                  end
                  object Label10: TLabel
                    Left = 25
                    Top = 138
                    Width = 63
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Colaborador:'
                  end
                  object bt_limpar_datas: TSpeedButton
                    Left = 388
                    Top = 102
                    Width = 23
                    Height = 21
                    Hint = 'Limpar datas'
                    Glyph.Data = {
                      36050000424D3605000000000000360400002800000010000000100000000100
                      08000000000000010000EE0E0000EE0E000000010000000100006B6B6B008484
                      8400C6C6C600DEDEDE00FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
                      0404040404040404040404040404040404040404040404040404040404040404
                      0404040404040404040404010000000000000104040404040404040002020202
                      0202000004040404040404000202020202020001000404040404040100020202
                      0202000101000404040404040003030303030300010100040404040404000303
                      0303030300010100040404040404000303030303030001010004040404040400
                      0303030303030001000404040404040400030303030303000004040404040404
                      0400030303030303000404040404040404040100000000010104040404040404
                      0404040404040404040404040404040404040404040404040404}
                    ParentShowHint = False
                    ShowHint = True
                    OnClick = bt_limpar_datasClick
                  end
                  object DBEdit1: TDBEdit
                    Left = 94
                    Top = 37
                    Width = 88
                    Height = 21
                    DataField = 'DATA'
                    DataSource = dtmColaborador.dsCalendColaboradorExc
                    TabOrder = 0
                  end
                  object DBEdit2: TDBEdit
                    Left = 94
                    Top = 69
                    Width = 576
                    Height = 21
                    CharCase = ecUpperCase
                    DataField = 'MOTIVO'
                    DataSource = dtmColaborador.dsCalendColaboradorExc
                    TabOrder = 1
                  end
                  object DBEdit3: TDBEdit
                    Left = 94
                    Top = 102
                    Width = 88
                    Height = 21
                    DataField = 'HORA_INI'
                    DataSource = dtmColaborador.dsCalendColaboradorExc
                    TabOrder = 3
                  end
                  object DBEdit4: TDBEdit
                    Left = 294
                    Top = 102
                    Width = 88
                    Height = 21
                    DataField = 'HORA_FIM'
                    DataSource = dtmColaborador.dsCalendColaboradorExc
                    TabOrder = 4
                  end
                  object DBCheckBox1: TDBCheckBox
                    Left = 370
                    Top = 39
                    Width = 97
                    Height = 17
                    Caption = 'Trabalhar'
                    DataField = 'TRABALHAR'
                    DataSource = dtmColaborador.dsCalendColaboradorExc
                    TabOrder = 2
                    ValueChecked = 'S'
                    ValueUnchecked = 'N'
                    OnClick = DBCheckBox1Click
                  end
                  object DBEdit5: TDBEdit
                    Left = 94
                    Top = 135
                    Width = 88
                    Height = 21
                    DataField = 'COD_COLABORADOR'
                    DataSource = dtmColaborador.dsCalendColaboradorExc
                    TabOrder = 5
                    OnExit = DBEdit5Exit
                    OnKeyDown = DBEdit5KeyDown
                  end
                  object DBLookupComboBox1: TDBLookupComboBox
                    Left = 188
                    Top = 135
                    Width = 482
                    Height = 21
                    DataField = 'COD_COLABORADOR'
                    DataSource = dtmColaborador.dsCalendColaboradorExc
                    KeyField = 'COD_VENDEDOR'
                    ListField = 'NOME_VENDEDOR'
                    ListSource = dtmColaborador.dsColaboradorCalendColaboradorExc
                    TabOrder = 6
                  end
                end
              end
            end
            inherited Panel3: TPanel
              inherited BitBtn4: TBitBtn
                Hint = 'OK - [COL050]'
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
              Hint = 'Clique para pesquisar - [COL046]'
            end
            inherited BitBtn3: TBitBtn
              Hint = 'Novo cadastro - [COL047]'
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
            inherited DBGrid1: TDBGrid
              OnKeyDown = DBGrid1KeyDown
            end
            inherited Panel2: TPanel
              inherited SpeedButton1: TSpeedButton
                Hint = 'Editar Registro - [COL048]'
              end
              inherited SpeedButton2: TSpeedButton
                OnClick = SpeedButton2Click
              end
              inherited SpeedButton3: TSpeedButton
                Enabled = False
                Visible = False
              end
              inherited SpeedButton4: TSpeedButton
                Enabled = False
                Visible = False
              end
              inherited SpeedButton5: TSpeedButton
                Enabled = False
                Visible = False
              end
              inherited SpeedButton25: TSpeedButton
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
end
