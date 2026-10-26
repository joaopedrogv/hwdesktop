inherited frmCadOperacoesInternas: TfrmCadOperacoesInternas
  Caption = 'Cadastro de Opercoes Internas'
  ExplicitWidth = 806
  ExplicitHeight = 598
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelFundo: TPanel
    BevelOuter = bvNone
    inherited Splitter2: TSplitter
      Left = 0
      Top = 0
      Height = 545
    end
    inherited PanelLeft: TPanel
      Left = 3
      Top = 0
      Width = 795
      Height = 545
      BevelOuter = bvNone
      inherited PageControl1: TPageControl
        Left = 0
        Top = 0
        Width = 795
        Height = 545
        ExplicitLeft = 6
        ExplicitTop = -3
        inherited TabSheet1: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 783
          ExplicitHeight = 510
          inherited ScrollBox1: TScrollBox
            Width = 787
            Height = 514
            inherited PageControl3: TPageControl
              Width = 787
              Height = 466
              ActivePage = tabCadastro
              inherited TabSheet3: TTabSheet
                ExplicitLeft = 4
                ExplicitTop = 27
                ExplicitWidth = 775
                ExplicitHeight = 431
                inherited ScrollBox3: TScrollBox
                  Width = 779
                  Height = 435
                  inherited GroupBox1: TGroupBox
                    Width = 775
                  end
                end
              end
              object tabCadastro: TTabSheet
                Caption = 'Cadastro'
                ImageIndex = 1
                ExplicitWidth = 775
                ExplicitHeight = 431
                object Label6: TLabel
                  Left = 55
                  Top = 16
                  Width = 33
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Codigo'
                end
                object Label7: TLabel
                  Left = 42
                  Top = 43
                  Width = 46
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Descri'#231#227'o'
                end
                object Label8: TLabel
                  Left = 16
                  Top = 70
                  Width = 72
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Tipo de Tributo'
                end
                object Label9: TLabel
                  Left = 42
                  Top = 94
                  Width = 46
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Empresas'
                end
                object edSeqId: TEdit
                  Left = 94
                  Top = 13
                  Width = 121
                  Height = 21
                  Enabled = False
                  TabOrder = 0
                  Text = 'edSeqId'
                end
                object edDescricao: TEdit
                  Left = 94
                  Top = 40
                  Width = 395
                  Height = 21
                  CharCase = ecUpperCase
                  TabOrder = 1
                  Text = 'EDDESCRICAO'
                end
                object edTipoTributo: TComboBox
                  Left = 94
                  Top = 67
                  Width = 121
                  Height = 21
                  Style = csDropDownList
                  ItemHeight = 13
                  TabOrder = 2
                end
                inline CheckListBoxEmpresasFrame1: TCheckListBoxEmpresasFrame
                  Left = 94
                  Top = 94
                  Width = 395
                  Height = 59
                  TabOrder = 3
                  TabStop = True
                  ExplicitLeft = 94
                  ExplicitTop = 94
                  ExplicitWidth = 395
                  ExplicitHeight = 59
                  inherited CheckListBoxEmpresas1: TCheckListBox
                    Width = 395
                    Height = 59
                    ExplicitWidth = 395
                    ExplicitHeight = 59
                  end
                end
              end
            end
            inherited Panel3: TPanel
              Top = 466
              Width = 787
              inherited LabelSeq: TLabel
                Visible = False
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
          ExplicitWidth = 783
          ExplicitHeight = 510
          inherited GroupBox3: TGroupBox
            Width = 787
            ExplicitLeft = 1
            ExplicitTop = -2
            inherited imgInformation: TImage
              Left = 761
            end
            inherited CheckBox3: TCheckBox
              Left = 409
              Visible = False
              ExplicitLeft = 409
            end
            inherited CheckBox1: TCheckBox
              Left = 504
              Visible = False
              ExplicitLeft = 504
            end
            object ckLixeira: TCheckBox
              Left = 257
              Top = 50
              Width = 112
              Height = 17
              Caption = 'Pesquisar na lixeira'
              TabOrder = 11
            end
          end
          inherited Panel1: TPanel
            Width = 787
            Height = 441
            inherited Splitter1: TSplitter
              Height = 380
            end
            inherited DBGrid1: TDBGrid
              Width = 494
              Height = 380
              OnKeyDown = DBGrid1KeyDown
            end
            inherited Panel2: TPanel
              Width = 783
              inherited SpeedButton2: TSpeedButton
                OnClick = SpeedButton2Click
              end
              inherited SpeedButton3: TSpeedButton
                Left = 691
                Visible = False
                ExplicitLeft = 691
              end
              inherited SpeedButton4: TSpeedButton
                Left = 691
                Visible = False
                ExplicitLeft = 691
              end
              inherited SpeedButton5: TSpeedButton
                Left = 691
                Visible = False
                ExplicitLeft = 691
              end
              inherited SpeedButton6: TSpeedButton
                Left = 691
                Visible = False
                ExplicitLeft = 691
              end
              inherited SpeedButton7: TSpeedButton
                Left = 691
                Visible = False
                ExplicitLeft = 691
              end
              inherited SpeedButton8: TSpeedButton
                Left = 691
                Visible = False
                ExplicitLeft = 691
              end
              inherited SpeedButton11: TSpeedButton
                Left = 691
                Visible = False
                ExplicitLeft = 691
              end
              inherited SpeedButton12: TSpeedButton
                Left = 691
                Visible = False
                ExplicitLeft = 691
              end
              inherited SpeedButton23: TSpeedButton
                Left = 691
                Visible = False
                ExplicitLeft = 691
              end
              inherited SpeedButton24: TSpeedButton
                Left = 691
                Visible = False
                ExplicitLeft = 691
              end
              inherited SpeedButton25: TSpeedButton
                Left = 691
                Visible = False
                ExplicitLeft = 691
              end
              inherited SpeedButton26: TSpeedButton
                Visible = False
              end
            end
            inherited GroupBox2: TGroupBox
              Height = 380
              inherited ScrollBox2: TScrollBox
                Height = 363
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
