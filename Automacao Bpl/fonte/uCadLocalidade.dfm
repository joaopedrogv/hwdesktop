inherited frmCadLocalidade: TfrmCadLocalidade
  Caption = 'Cadastro de Localidades'
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
                  Caption = 'Cadastro de Localidades'
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
                    Left = 88
                    Top = 64
                    Width = 50
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Localidade'
                    FocusControl = DBEdit2
                  end
                  object Label8: TLabel
                    Left = 112
                    Top = 91
                    Width = 26
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Setor'
                    FocusControl = DBEdit3
                  end
                  object Label9: TLabel
                    Left = 105
                    Top = 118
                    Width = 33
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Cidade'
                    FocusControl = DBEdit4
                  end
                  object Label10: TLabel
                    Left = 105
                    Top = 145
                    Width = 33
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Estado'
                  end
                  object DBEdit1: TDBEdit
                    Left = 144
                    Top = 34
                    Width = 75
                    Height = 21
                    DataField = 'COD_LOCALIDADE'
                    DataSource = dtmOrdemCarregamento.dsLocalidade
                    Enabled = False
                    TabOrder = 0
                  end
                  object DBEdit2: TDBEdit
                    Left = 144
                    Top = 61
                    Width = 449
                    Height = 21
                    CharCase = ecUpperCase
                    DataField = 'LOCALIDADE'
                    DataSource = dtmOrdemCarregamento.dsLocalidade
                    TabOrder = 1
                  end
                  object DBEdit3: TDBEdit
                    Left = 144
                    Top = 88
                    Width = 75
                    Height = 21
                    DataField = 'COD_SETOR'
                    DataSource = dtmOrdemCarregamento.dsLocalidade
                    TabOrder = 2
                  end
                  object DBEdit4: TDBEdit
                    Left = 144
                    Top = 115
                    Width = 75
                    Height = 21
                    DataField = 'COD_CIDADE'
                    DataSource = dtmOrdemCarregamento.dsLocalidade
                    TabOrder = 4
                  end
                  object DBLookupComboBox1: TDBLookupComboBox
                    Left = 225
                    Top = 88
                    Width = 368
                    Height = 21
                    DataField = 'COD_SETOR'
                    DataSource = dtmOrdemCarregamento.dsLocalidade
                    KeyField = 'COD_SETOR'
                    ListField = 'SETOR'
                    ListSource = dtmOrdemCarregamento.dsSetorCons
                    TabOrder = 3
                  end
                  object DBLookupComboBox2: TDBLookupComboBox
                    Left = 225
                    Top = 115
                    Width = 368
                    Height = 21
                    DataField = 'COD_CIDADE'
                    DataSource = dtmOrdemCarregamento.dsLocalidade
                    KeyField = 'COD_CIDADE'
                    ListField = 'NOME_CIDADE'
                    ListSource = dtmOrdemCarregamento.dsCid
                    TabOrder = 5
                  end
                  object DBLookupComboBox3: TDBLookupComboBox
                    Left = 144
                    Top = 142
                    Width = 75
                    Height = 21
                    DataField = 'COD_ESTADO'
                    DataSource = dtmOrdemCarregamento.dsLocalidade
                    KeyField = 'CODIGO_UF'
                    ListField = 'SIGLA_UF'
                    ListSource = dtmOrdemCarregamento.dsEst
                    TabOrder = 6
                  end
                end
              end
            end
            inherited Panel3: TPanel
              inherited BitBtn4: TBitBtn
                Hint = 'Salvar dados - [OCR017]'
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
              Hint = 'Clique para pesquisar - [OCR011]'
            end
            inherited BitBtn3: TBitBtn
              Hint = 'Novo cadastro - [OCR012]'
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
                Hint = 'Editar Registro - [OCR013]'
              end
              inherited SpeedButton2: TSpeedButton
                Hint = 'Enviar para Lixeira -  [OCR014]'
                OnClick = SpeedButton2Click
              end
              inherited SpeedButton3: TSpeedButton
                Enabled = False
                Visible = False
              end
              inherited SpeedButton5: TSpeedButton
                Hint = 'Recuperar registro - [OCR016]'
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
                Hint = 'Ver registros da lixeira - [OCR018]'
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
