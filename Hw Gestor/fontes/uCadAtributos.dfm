inherited frmCadAtributos: TfrmCadAtributos
  Caption = 'Tipos de Atributos'
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
                  Caption = 'Cadastro Tipo de Atributos'
                  TabOrder = 0
                  object Label6: TLabel
                    Left = 89
                    Top = 59
                    Width = 37
                    Height = 13
                    Caption = 'C'#243'digo:'
                    FocusControl = DBEdit1
                  end
                  object Label7: TLabel
                    Left = 76
                    Top = 86
                    Width = 50
                    Height = 13
                    Caption = 'Descri'#231#227'o:'
                    FocusControl = DBEdit2
                  end
                  object Label8: TLabel
                    Left = 348
                    Top = 59
                    Width = 27
                    Height = 13
                    Caption = 'Data:'
                    FocusControl = DBEdit3
                  end
                  object DBEdit1: TDBEdit
                    Left = 132
                    Top = 56
                    Width = 145
                    Height = 21
                    DataField = 'COD_ATRIBUTO'
                    DataSource = DtmGestorHw.dsAtributos
                    Enabled = False
                    TabOrder = 0
                  end
                  object DBEdit2: TDBEdit
                    Left = 132
                    Top = 83
                    Width = 394
                    Height = 21
                    CharCase = ecUpperCase
                    DataField = 'DESCRICAO_ATRIBUTO'
                    DataSource = DtmGestorHw.dsAtributos
                    TabOrder = 2
                  end
                  object DBEdit3: TDBEdit
                    Left = 381
                    Top = 56
                    Width = 145
                    Height = 21
                    DataField = 'DATA'
                    DataSource = DtmGestorHw.dsAtributos
                    Enabled = False
                    TabOrder = 1
                  end
                end
              end
            end
            inherited Panel3: TPanel
              inherited BitBtn4: TBitBtn
                Hint = 'OK - [GES075]'
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
              Hint = 'Clique para pesquisar - [GES069]'
            end
            inherited BitBtn3: TBitBtn
              Hint = 'Novo cadastro - [GES070]'
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
                Hint = 'Editar Registro - [GES071]'
              end
              inherited SpeedButton2: TSpeedButton
                Hint = 'Apagar Registro - [GES072]'
                OnClick = SpeedButton2Click
              end
              inherited SpeedButton3: TSpeedButton
                Enabled = False
                Visible = False
              end
              inherited SpeedButton5: TSpeedButton
                Hint = 'Recuperar registro - [GES074]'
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
                Hint = 'Ver registros da lixeira - [GES076]'
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
end
