inherited frmCadSpedLancamentosFiscais: TfrmCadSpedLancamentosFiscais
  Caption = 'Lan'#231'amentos Fiscais para Ajustes de Notas Fiscais'
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
                  Caption = 'Cadastro de Observa'#231#245'es para Lan'#231'amentos Fiscais'
                  TabOrder = 0
                  object Label6: TLabel
                    Left = 108
                    Top = 35
                    Width = 33
                    Height = 13
                    Caption = 'Codigo'
                    FocusControl = DBEdit1
                  end
                  object Label7: TLabel
                    Left = 83
                    Top = 62
                    Width = 58
                    Height = 13
                    Caption = 'Observa'#231#227'o'
                    FocusControl = DBEdit2
                  end
                  object Label8: TLabel
                    Left = 17
                    Top = 89
                    Width = 124
                    Height = 13
                    Caption = 'C'#243'digo Padr'#227'o de Ajustes'
                    FocusControl = DBEdit3
                  end
                  object DBEdit1: TDBEdit
                    Left = 147
                    Top = 32
                    Width = 81
                    Height = 21
                    DataField = 'COD_OBS'
                    DataSource = dtmSPED.dsLancF
                    Enabled = False
                    TabOrder = 0
                  end
                  object DBEdit2: TDBEdit
                    Left = 147
                    Top = 59
                    Width = 614
                    Height = 21
                    DataField = 'TXT'
                    DataSource = dtmSPED.dsLancF
                    TabOrder = 1
                  end
                  object DBEdit3: TDBEdit
                    Left = 147
                    Top = 86
                    Width = 134
                    Height = 21
                    DataField = 'COD_PADRAO_AJUSTE'
                    DataSource = dtmSPED.dsLancF
                    TabOrder = 2
                  end
                end
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
              ExplicitHeight = 365
            end
            inherited DBGrid1: TDBGrid
              OnKeyDown = DBGrid1KeyDown
            end
            inherited Panel2: TPanel
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
