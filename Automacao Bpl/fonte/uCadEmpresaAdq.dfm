inherited frmCadEmpresaAdq: TfrmCadEmpresaAdq
  Caption = 'Estabelecimentos por Adquirente (Concilia'#231#227'o Cart'#227'o)'
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
                  Caption = 'Cadastro Empresa por Adquirente'
                  TabOrder = 0
                  object Label6: TLabel
                    Left = 50
                    Top = 38
                    Width = 57
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Adquirente:'
                    FocusControl = DBEdit1
                  end
                  object Label7: TLabel
                    Left = 25
                    Top = 69
                    Width = 82
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Estabelecimento:'
                    FocusControl = DBEdit2
                  end
                  object Label8: TLabel
                    Left = 72
                    Top = 100
                    Width = 37
                    Height = 13
                    Caption = 'C'#243'digo:'
                  end
                  object DBEdit1: TDBEdit
                    Left = 111
                    Top = 35
                    Width = 54
                    Height = 21
                    DataField = 'ID_ADQUIRENTE'
                    DataSource = DtmCadBasicos.dsConciliacaoEmpAdq
                    TabOrder = 0
                  end
                  object DBEdit2: TDBEdit
                    Left = 111
                    Top = 66
                    Width = 54
                    Height = 21
                    CharCase = ecUpperCase
                    DataField = 'COD_ESTAB'
                    DataSource = DtmCadBasicos.dsConciliacaoEmpAdq
                    TabOrder = 2
                  end
                  object DBEdit3: TDBEdit
                    Left = 111
                    Top = 97
                    Width = 145
                    Height = 21
                    DataField = 'CODIGO'
                    DataSource = DtmCadBasicos.dsConciliacaoEmpAdq
                    TabOrder = 4
                  end
                  object DBLookupComboBox1: TDBLookupComboBox
                    Left = 171
                    Top = 35
                    Width = 523
                    Height = 21
                    DataField = 'ID_ADQUIRENTE'
                    DataSource = DtmCadBasicos.dsConciliacaoEmpAdq
                    KeyField = 'ID'
                    ListField = 'NOME'
                    ListSource = DtmCadBasicos.dsConciliacaoAdq
                    TabOrder = 1
                  end
                  object DBLookupComboBox2: TDBLookupComboBox
                    Left = 171
                    Top = 66
                    Width = 523
                    Height = 21
                    DataField = 'COD_ESTAB'
                    DataSource = DtmCadBasicos.dsConciliacaoEmpAdq
                    KeyField = 'COD_EMPRESA'
                    ListField = 'IDENTIFICACAO_EMP'
                    ListSource = DtmCadBasicos.dsConciliacaoEmp
                    TabOrder = 3
                  end
                end
              end
            end
            inherited Panel3: TPanel
              inherited BitBtn4: TBitBtn
                Hint = 'OK - [BAS523]'
              end
              inherited BitBtn6: TBitBtn
                Hint = 'Sair'
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
              Hint = 'Clique para pesquisar - [BAS519]'
            end
            inherited BitBtn3: TBitBtn
              Hint = 'Novo cadastro - [BAS520]'
            end
          end
          inherited Panel1: TPanel
            inherited DBGrid1: TDBGrid
              OnKeyDown = DBGrid1KeyDown
            end
            inherited Panel2: TPanel
              inherited SpeedButton1: TSpeedButton
                Hint = 'Editar Registro - [BAS521]'
              end
              inherited SpeedButton2: TSpeedButton
                Hint = 'Apagar Registro - [BAS522]'
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
                Left = 177
                Enabled = False
                Visible = False
                ExplicitLeft = 177
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
    Top = 484
    ExplicitTop = 484
    inherited lbTextoProcessamento: TLabel
      Width = 477
      Height = 21
    end
  end
end
