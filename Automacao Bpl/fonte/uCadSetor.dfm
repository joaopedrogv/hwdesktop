inherited frmCadSetor: TfrmCadSetor
  Caption = 'Cadastro Setor'
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
                  Caption = 'Cadastro de Setor'
                  TabOrder = 0
                  object Label6: TLabel
                    Left = 114
                    Top = 37
                    Width = 33
                    Height = 13
                    Caption = 'C'#243'digo'
                    FocusControl = DBEdit1
                  end
                  object Label7: TLabel
                    Left = 121
                    Top = 64
                    Width = 26
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Setor'
                    FocusControl = DBEdit2
                  end
                  object Label8: TLabel
                    Left = 101
                    Top = 91
                    Width = 46
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Vendedor'
                    FocusControl = DBEdit3
                  end
                  object DBEdit1: TDBEdit
                    Left = 153
                    Top = 34
                    Width = 64
                    Height = 21
                    DataField = 'COD_SETOR'
                    DataSource = dtmOrdemCarregamento.dsSetor
                    Enabled = False
                    TabOrder = 0
                  end
                  object DBEdit2: TDBEdit
                    Left = 153
                    Top = 61
                    Width = 336
                    Height = 21
                    CharCase = ecUpperCase
                    DataField = 'SETOR'
                    DataSource = dtmOrdemCarregamento.dsSetor
                    TabOrder = 1
                  end
                  object DBEdit3: TDBEdit
                    Left = 153
                    Top = 88
                    Width = 64
                    Height = 21
                    DataField = 'COD_VENDEDOR'
                    DataSource = dtmOrdemCarregamento.dsSetor
                    TabOrder = 2
                  end
                  object DBLookupComboBox1: TDBLookupComboBox
                    Left = 223
                    Top = 88
                    Width = 266
                    Height = 21
                    DataField = 'COD_VENDEDOR'
                    DataSource = dtmOrdemCarregamento.dsSetor
                    KeyField = 'COD_VENDEDOR'
                    ListField = 'NOME_VENDEDOR'
                    ListSource = dtmOrdemCarregamento.dsColab
                    TabOrder = 3
                  end
                end
              end
            end
            inherited Panel3: TPanel
              inherited BitBtn4: TBitBtn
                Hint = 'Salvar dados -  [OCR008]'
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
              Hint = 'Clique para pesquisar - [OCR002]'
            end
            inherited BitBtn3: TBitBtn
              Hint = 'Novo cadastro - [OCR003]'
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
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
              OnKeyDown = DBGrid1KeyDown
            end
            inherited Panel2: TPanel
              inherited SpeedButton1: TSpeedButton
                Hint = 'Editar Registro - [OCR004]'
              end
              inherited SpeedButton2: TSpeedButton
                Hint = 'Enviar para Lixeira -  [OCR005]'
                OnClick = SpeedButton2Click
              end
              inherited SpeedButton3: TSpeedButton
                Enabled = False
                Visible = False
              end
              inherited SpeedButton5: TSpeedButton
                Hint = 'Recuperar registro - [OCR007]'
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
                Hint = 'Ver registros da lixeira - [OCR009]'
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
    Left = 766
    Top = 5
  end
  inherited Timer1: TTimer
    Left = 726
    Top = 5
  end
  inherited ApplicationEventsPadrao: TApplicationEvents
    Left = 694
    Top = 5
  end
end
