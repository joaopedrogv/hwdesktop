inherited frmCadCEST: TfrmCadCEST
  Caption = 'CEST - C'#243'digo Especificador da Substitui'#231#227'o Tribut'#225'ria'
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
                  Caption = 'Cadastro'
                  TabOrder = 0
                  object Label6: TLabel
                    Left = 88
                    Top = 32
                    Width = 25
                    Height = 13
                    Caption = 'CEST'
                    FocusControl = DBEdit1
                  end
                  object Label7: TLabel
                    Left = 91
                    Top = 59
                    Width = 22
                    Height = 13
                    Caption = 'NCM'
                    FocusControl = DBEdit2
                  end
                  object Label8: TLabel
                    Left = 67
                    Top = 86
                    Width = 46
                    Height = 13
                    Caption = 'Descri'#231#227'o'
                  end
                  object DBEdit1: TDBEdit
                    Left = 119
                    Top = 29
                    Width = 95
                    Height = 21
                    DataField = 'CEST'
                    DataSource = dtmProdutos.dsCEST
                    TabOrder = 0
                  end
                  object DBEdit2: TDBEdit
                    Left = 119
                    Top = 56
                    Width = 95
                    Height = 21
                    DataField = 'NCM'
                    DataSource = dtmProdutos.dsCEST
                    TabOrder = 1
                  end
                  object DBMemo1: TDBMemo
                    Left = 119
                    Top = 83
                    Width = 602
                    Height = 89
                    DataField = 'DESCRICAO'
                    DataSource = dtmProdutos.dsCEST
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
            inherited MaskEdit3: TMaskEdit
              CharCase = ecNormal
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
                Visible = False
              end
              inherited SpeedButton7: TSpeedButton
                Visible = False
              end
              inherited SpeedButton8: TSpeedButton
                Visible = False
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
                Left = 314
                Top = -2
                Enabled = False
                Visible = False
                ExplicitLeft = 314
                ExplicitTop = -2
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
