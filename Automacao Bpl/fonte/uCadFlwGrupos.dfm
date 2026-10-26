inherited frmCadFlwGrupos: TfrmCadFlwGrupos
  Caption = 'Grupos de Perguntas'
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
                object GroupBox4: TGroupBox
                  Left = 0
                  Top = 0
                  Width = 775
                  Height = 431
                  Align = alClient
                  Caption = 'Cadastro de Grupos de Perguntas'
                  TabOrder = 0
                  object Label6: TLabel
                    Left = 105
                    Top = 37
                    Width = 33
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Codigo'
                    FocusControl = DBEdit1
                  end
                  object Label7: TLabel
                    Left = 46
                    Top = 64
                    Width = 92
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Descri'#231#227'o do grupo'
                    FocusControl = DBEdit2
                  end
                  object Label8: TLabel
                    Left = 91
                    Top = 91
                    Width = 47
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Categoria'
                    FocusControl = DBEdit3
                  end
                  object DBEdit1: TDBEdit
                    Left = 144
                    Top = 34
                    Width = 75
                    Height = 21
                    DataField = 'CODGRUPO'
                    DataSource = dtmFollowUpPosAtendimento.dsFlwGrupo
                    Enabled = False
                    TabOrder = 0
                  end
                  object DBEdit2: TDBEdit
                    Left = 144
                    Top = 61
                    Width = 449
                    Height = 21
                    CharCase = ecUpperCase
                    DataField = 'DESCRICAO'
                    DataSource = dtmFollowUpPosAtendimento.dsFlwGrupo
                    TabOrder = 1
                  end
                  object DBEdit3: TDBEdit
                    Left = 144
                    Top = 88
                    Width = 449
                    Height = 21
                    CharCase = ecUpperCase
                    DataField = 'CATEGORIA'
                    DataSource = dtmFollowUpPosAtendimento.dsFlwGrupo
                    TabOrder = 2
                  end
                end
              end
            end
            inherited Panel3: TPanel
              inherited BitBtn4: TBitBtn
                Hint = 'Salvar dados - [CRM030]'
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
              Hint = 'Consultar registros - [CRM027]'
            end
            inherited BitBtn3: TBitBtn
              Hint = 'Novo registro - [CRM028]'
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
                Hint = 'Editar Registro - [CRM029]'
              end
              inherited SpeedButton2: TSpeedButton
                OnClick = SpeedButton2Click
              end
              inherited SpeedButton3: TSpeedButton
                Enabled = False
                Visible = False
              end
              inherited SpeedButton5: TSpeedButton
                Hint = 'Recuperar registro - [CRM034]'
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
                Hint = 'Ver registros da lixeira - [CRM033]'
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
end
