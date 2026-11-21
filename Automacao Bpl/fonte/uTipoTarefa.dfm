inherited frmTipoTarefa: TfrmTipoTarefa
  Caption = 'Tipo de Tarefa'
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
                object ScrollBox4: TScrollBox
                  Left = 0
                  Top = 0
                  Width = 775
                  Height = 431
                  Align = alClient
                  TabOrder = 0
                  object GroupBox4: TGroupBox
                    Left = 0
                    Top = 0
                    Width = 771
                    Height = 427
                    Align = alClient
                    Caption = 'Tipo de Tarefa'
                    TabOrder = 0
                    object Label7: TLabel
                      Left = 141
                      Top = 36
                      Width = 24
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Tipo:'
                    end
                    object Label6: TLabel
                      Left = 68
                      Top = 64
                      Width = 97
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Descri'#231#227'o Reduzida:'
                    end
                    object Label8: TLabel
                      Left = 67
                      Top = 88
                      Width = 98
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Descri'#231#227'o Completa:'
                    end
                    object Label9: TLabel
                      Left = 53
                      Top = 143
                      Width = 112
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'SLA Segundos Tarefas:'
                    end
                    object Label10: TLabel
                      Left = 75
                      Top = 169
                      Width = 90
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Tempo Adiamento:'
                    end
                    object Label11: TLabel
                      Left = 44
                      Top = 195
                      Width = 121
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Qtde M'#225'xima Adiamento:'
                    end
                    object Label12: TLabel
                      Left = 58
                      Top = 222
                      Width = 107
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Execu'#231#227'o Autom'#225'tica:'
                    end
                    object Label13: TLabel
                      Left = 58
                      Top = 249
                      Width = 107
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Percentual Toler'#226'ncia:'
                    end
                    object Label14: TLabel
                      Left = 94
                      Top = 276
                      Width = 71
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Nod Resposta:'
                    end
                    object DBEdit1: TDBEdit
                      Left = 171
                      Top = 33
                      Width = 504
                      Height = 21
                      DataField = 'TIPO'
                      DataSource = dtmConfig.dsMsgTipoTarefa
                      TabOrder = 0
                    end
                    object DBEdit2: TDBEdit
                      Left = 171
                      Top = 61
                      Width = 504
                      Height = 21
                      DataField = 'DESCRICAO_REDUZIDA'
                      DataSource = dtmConfig.dsMsgTipoTarefa
                      TabOrder = 1
                    end
                    object DBMemo1: TDBMemo
                      Left = 171
                      Top = 88
                      Width = 504
                      Height = 45
                      DataField = 'DESCRICAO_COMPLETA'
                      DataSource = dtmConfig.dsMsgTipoTarefa
                      TabOrder = 2
                    end
                    object DBEdit3: TDBEdit
                      Left = 171
                      Top = 140
                      Width = 118
                      Height = 21
                      DataField = 'SLA_SEG_TAREFA'
                      DataSource = dtmConfig.dsMsgTipoTarefa
                      TabOrder = 3
                    end
                    object DBEdit4: TDBEdit
                      Left = 171
                      Top = 166
                      Width = 118
                      Height = 21
                      DataField = 'TEMPO_ADIAMENTO'
                      DataSource = dtmConfig.dsMsgTipoTarefa
                      TabOrder = 4
                    end
                    object DBEdit5: TDBEdit
                      Left = 171
                      Top = 192
                      Width = 118
                      Height = 21
                      DataField = 'QTDE_MAX_ADIAMENTO'
                      DataSource = dtmConfig.dsMsgTipoTarefa
                      TabOrder = 5
                    end
                    object DBComboBox1: TDBComboBox
                      Left = 171
                      Top = 219
                      Width = 118
                      Height = 21
                      DataField = 'EXEC_AUTO'
                      DataSource = dtmConfig.dsMsgTipoTarefa
                      ItemHeight = 13
                      Items.Strings = (
                        'N'#195'O'
                        'SIM')
                      TabOrder = 6
                    end
                    object DBEdit6: TDBEdit
                      Left = 171
                      Top = 246
                      Width = 118
                      Height = 21
                      DataField = 'PERC_TOLERANCIA'
                      DataSource = dtmConfig.dsMsgTipoTarefa
                      TabOrder = 7
                    end
                    object DBEdit7: TDBEdit
                      Left = 171
                      Top = 273
                      Width = 504
                      Height = 21
                      CharCase = ecLowerCase
                      DataField = 'NOD_RESPOSTA'
                      DataSource = dtmConfig.dsMsgTipoTarefa
                      TabOrder = 8
                    end
                  end
                end
              end
            end
            inherited Panel3: TPanel
              inherited BitBtn4: TBitBtn
                Hint = 'OK - [CFG093]'
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
              Hint = 'Clique para pesquisar - [CFG088]'
            end
            inherited BitBtn3: TBitBtn
              Hint = 'Novo cadastro - [CFG090]'
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
                Hint = 'Editar Registro - [CFG091]'
              end
              inherited SpeedButton2: TSpeedButton
                Hint = 'Apagar Registro - [CFG092]'
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
                Enabled = False
                Visible = False
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
end
