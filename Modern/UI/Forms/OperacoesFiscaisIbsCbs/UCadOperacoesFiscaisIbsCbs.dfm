inherited frmCadOperacoesFiscaisIbsCbs: TfrmCadOperacoesFiscaisIbsCbs
  Caption = 'Cadastro de Opera'#231#245'es Fiscais do IBS e CBS'
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
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitHeight = 545
    end
    inherited PanelLeft: TPanel
      Left = 3
      Top = 0
      Width = 795
      Height = 545
      BevelOuter = bvNone
      ExplicitLeft = 3
      ExplicitTop = 0
      ExplicitWidth = 795
      ExplicitHeight = 545
      inherited PageControl1: TPageControl
        Left = 0
        Top = 0
        Width = 795
        Height = 545
        ActivePage = TabSheet1
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 795
        ExplicitHeight = 545
        inherited TabSheet1: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 787
          ExplicitHeight = 514
          inherited ScrollBox1: TScrollBox
            Width = 787
            Height = 514
            ExplicitWidth = 787
            ExplicitHeight = 514
            inherited PageControl3: TPageControl
              Width = 787
              Height = 466
              ActivePage = tabCadastro
              ExplicitWidth = 787
              ExplicitHeight = 466
              inherited TabSheet3: TTabSheet
                ExplicitLeft = 4
                ExplicitTop = 27
                ExplicitWidth = 779
                ExplicitHeight = 435
                inherited ScrollBox3: TScrollBox
                  Width = 779
                  Height = 435
                  ExplicitWidth = 779
                  ExplicitHeight = 435
                  inherited GroupBox1: TGroupBox
                    Width = 775
                    ExplicitWidth = 775
                  end
                end
              end
              object tabCadastro: TTabSheet
                Caption = 'Cadastro'
                ImageIndex = 1
                object Label6: TLabel
                  Left = 26
                  Top = 16
                  Width = 86
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Opera'#231#227'o Interna'
                end
                object Label7: TLabel
                  Left = 54
                  Top = 43
                  Width = 58
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Grupo Fiscal'
                end
                object Label9: TLabel
                  Left = 66
                  Top = 143
                  Width = 46
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Empresas'
                end
                object Label8: TLabel
                  Left = 54
                  Top = 70
                  Width = 58
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Regra Fiscal'
                end
                object Label15: TLabel
                  Left = 30
                  Top = 116
                  Width = 82
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'In'#237'cio da vig'#234'ncia'
                end
                object Label16: TLabel
                  Left = 199
                  Top = 116
                  Width = 73
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Fim da vig'#234'ncia'
                end
                inline CheckListBoxEmpresasFrame1: TCheckListBoxEmpresasFrame
                  Left = 118
                  Top = 140
                  Width = 395
                  Height = 59
                  TabOrder = 5
                  TabStop = True
                  ExplicitLeft = 118
                  ExplicitTop = 140
                  ExplicitWidth = 395
                  ExplicitHeight = 59
                  inherited CheckListBoxEmpresas1: TCheckListBox
                    Width = 395
                    Height = 59
                    ExplicitWidth = 395
                    ExplicitHeight = 59
                  end
                end
                object edInicioVigencia: TMaskEdit
                  Left = 118
                  Top = 113
                  Width = 67
                  Height = 21
                  EditMask = '!99/99/0000;1;_'
                  MaxLength = 10
                  TabOrder = 3
                  Text = '  /  /    '
                end
                inline edFinalVigencia: TMaskEditNullableFrame
                  Left = 278
                  Top = 113
                  Width = 88
                  Height = 21
                  TabOrder = 4
                  TabStop = True
                  ExplicitLeft = 278
                  ExplicitTop = 113
                  ExplicitWidth = 88
                  inherited ckNotNull: TCheckBox
                    Left = 70
                    ExplicitLeft = 70
                  end
                  inherited edMask: TMaskEdit
                    Width = 67
                    ExplicitLeft = 0
                    ExplicitWidth = 67
                  end
                end
                inline edPickerOpInterna: TComboboxEntityPickerFrame
                  Left = 118
                  Top = 13
                  Width = 395
                  Height = 21
                  TabOrder = 0
                  ExplicitLeft = 118
                  ExplicitTop = 13
                  ExplicitWidth = 395
                  ExplicitHeight = 21
                  inherited edEntity: TComboBox
                    Width = 395
                    ExplicitWidth = 395
                  end
                  inherited pnVigencia: TPanel
                    Width = 395
                    ExplicitWidth = 395
                  end
                end
                inline edPickerGrupoFiscal: TComboboxEntityPickerFrame
                  Left = 118
                  Top = 40
                  Width = 395
                  Height = 21
                  TabOrder = 1
                  ExplicitLeft = 118
                  ExplicitTop = 40
                  ExplicitWidth = 395
                  ExplicitHeight = 21
                  inherited edEntity: TComboBox
                    Width = 395
                    ExplicitWidth = 395
                  end
                  inherited pnVigencia: TPanel
                    Width = 395
                    ExplicitWidth = 395
                  end
                end
                inline ComboBoxRegrasFiscaisFrame1: TComboBoxRegrasFiscaisFrame
                  Left = 118
                  Top = 67
                  Width = 395
                  Height = 37
                  TabOrder = 2
                  TabStop = True
                  ExplicitLeft = 118
                  ExplicitTop = 67
                  ExplicitWidth = 395
                  inherited btDetalhes: TSpeedButton
                    Left = 373
                  end
                  inherited edRegrasFiscais: TComboBox
                    Width = 370
                    OnExit = nil
                    ExplicitLeft = 0
                    ExplicitWidth = 295
                  end
                  inherited pnVigencia: TPanel
                    Width = 395
                    ExplicitWidth = 320
                  end
                end
              end
            end
            inherited Panel3: TPanel
              Top = 466
              Width = 787
              ExplicitTop = 466
              ExplicitWidth = 787
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
          ExplicitWidth = 787
          ExplicitHeight = 514
          inherited GroupBox3: TGroupBox
            Width = 787
            ExplicitWidth = 787
            inherited Label1: TLabel
              Enabled = False
              Visible = False
            end
            inherited Label2: TLabel
              Enabled = False
              Visible = False
            end
            inherited Label3: TLabel
              Enabled = False
            end
            inherited Label4: TLabel
              Enabled = False
              Visible = False
            end
            inherited Label5: TLabel
              Enabled = False
              Visible = False
            end
            inherited imgInformation: TImage
              Left = 761
              ExplicitLeft = 761
            end
            inherited MaskEdit3: TMaskEdit
              Enabled = False
              Visible = False
            end
            inherited MaskEdit1: TMaskEdit
              Enabled = False
              Visible = False
            end
            inherited MaskEdit2: TMaskEdit
              Enabled = False
              Visible = False
            end
            inherited ComboBox1: TComboBox
              Enabled = False
              TabOrder = 12
              Visible = False
            end
            inherited ComboBox2: TComboBox
              Enabled = False
            end
            inherited CheckBox3: TCheckBox
              Left = 579
              Top = 34
              Visible = False
              ExplicitLeft = 579
              ExplicitTop = 34
            end
            inherited CheckBox1: TCheckBox
              Left = 674
              Top = 34
              Visible = False
              ExplicitLeft = 674
              ExplicitTop = 34
            end
            inherited ComboBox3: TComboBox
              Enabled = False
              Visible = False
            end
            object ckLixeira: TCheckBox
              Left = 416
              Top = 44
              Width = 112
              Height = 17
              Caption = 'Pesquisar na lixeira'
              TabOrder = 11
            end
            inline FilterFramePadrao1: TFilterFramePadrao
              Left = 3
              Top = 11
              Width = 407
              Height = 54
              TabOrder = 0
              TabStop = True
              ExplicitLeft = 3
              ExplicitTop = 11
              inherited pnCondicao: TPanel
                inherited edCondicao: TComboBox
                  ExplicitLeft = 64
                  ExplicitWidth = 127
                end
              end
              inherited pnConteudos: TPanel
                inherited pnConteudo1: TPanel
                  inherited edConteudo1: TMaskEdit
                    ExplicitLeft = 64
                    ExplicitWidth = 140
                  end
                end
                inherited pnConteudo2: TPanel
                  inherited edConteudo2: TMaskEdit
                    ExplicitLeft = 64
                    ExplicitWidth = 72
                  end
                end
                inherited pnBtns: TPanel
                  inherited lbCountFiltros: TLabel
                    Width = 27
                    Height = 21
                  end
                end
              end
            end
          end
          inherited Panel1: TPanel
            Width = 787
            Height = 441
            ExplicitWidth = 787
            ExplicitHeight = 441
            inherited Splitter1: TSplitter
              Height = 380
              ExplicitHeight = 380
            end
            inherited DBGrid1: TDBGrid
              Width = 494
              Height = 380
              OnKeyDown = DBGrid1KeyDown
            end
            inherited Panel2: TPanel
              Width = 783
              ExplicitWidth = 783
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
              ExplicitHeight = 380
              inherited ScrollBox2: TScrollBox
                Height = 363
                ExplicitHeight = 363
              end
            end
          end
        end
        inherited tsMemo: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 787
          ExplicitHeight = 514
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
