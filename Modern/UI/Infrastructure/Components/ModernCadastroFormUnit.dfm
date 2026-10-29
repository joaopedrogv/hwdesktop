inherited ModernCadastroForm: TModernCadastroForm
  Caption = 'ModernCadastroForm'
  ShowHint = True
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
        inherited TabSheet1: TTabSheet
          inherited ScrollBox1: TScrollBox
            Width = 787
            Height = 514
            inherited PageControl3: TPageControl
              Width = 787
              Height = 466
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
            end
            inherited Panel3: TPanel
              Top = 466
              Width = 787
            end
          end
        end
        inherited TabSheet2: TTabSheet
          inherited GroupBox3: TGroupBox
            Width = 787
            inherited Label1: TLabel
              Left = 77
              Top = 19
              Enabled = False
              Visible = False
              ExplicitLeft = 77
              ExplicitTop = 19
            end
            inherited Label2: TLabel
              Left = 63
              Top = 19
              Enabled = False
              Visible = False
              ExplicitLeft = 63
              ExplicitTop = 19
            end
            inherited Label3: TLabel
              Left = 78
              Top = 19
              Enabled = False
              ExplicitLeft = 78
              ExplicitTop = 19
            end
            inherited Label4: TLabel
              Left = 94
              Top = 19
              Enabled = False
              Visible = False
              ExplicitLeft = 94
              ExplicitTop = 19
            end
            inherited Label5: TLabel
              Left = 66
              Top = 19
              Enabled = False
              Visible = False
              ExplicitLeft = 66
              ExplicitTop = 19
            end
            inherited imgInformation: TImage
              Left = 761
            end
            inherited MaskEdit3: TMaskEdit
              Left = 120
              Top = 16
              Width = 75
              Enabled = False
              Visible = False
              ExplicitLeft = 120
              ExplicitTop = 16
              ExplicitWidth = 75
            end
            inherited MaskEdit1: TMaskEdit
              Left = 120
              Top = 16
              Width = 75
              Enabled = False
              Visible = False
              ExplicitLeft = 120
              ExplicitTop = 16
              ExplicitWidth = 75
            end
            inherited MaskEdit2: TMaskEdit
              Left = 120
              Top = 16
              Enabled = False
              Visible = False
              ExplicitLeft = 120
              ExplicitTop = 16
            end
            inherited ComboBox1: TComboBox
              Left = 120
              Width = 75
              Enabled = False
              Visible = False
              ExplicitLeft = 120
              ExplicitWidth = 75
            end
            inherited ComboBox2: TComboBox
              Left = 120
              Width = 75
              Enabled = False
              ExplicitLeft = 120
              ExplicitWidth = 75
            end
            inherited CheckBox3: TCheckBox
              Left = 201
              Top = 18
              Enabled = False
              Visible = False
              ExplicitLeft = 201
              ExplicitTop = 18
            end
            inherited CheckBox1: TCheckBox
              Left = 201
              Top = 18
              Enabled = False
              Visible = False
              ExplicitLeft = 201
              ExplicitTop = 18
            end
            inherited ComboBox3: TComboBox
              Left = 120
              Top = 16
              Width = 75
              Enabled = False
              Visible = False
              ExplicitLeft = 120
              ExplicitTop = 16
              ExplicitWidth = 75
            end
            inline FiltroGrid: TFilterFramePadrao
              Left = 3
              Top = 11
              Width = 407
              Height = 54
              TabOrder = 11
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
            inherited Splitter1: TSplitter
              Height = 380
            end
            inherited DBGrid1: TDBGrid
              Width = 494
              Height = 380
            end
            inherited Panel2: TPanel
              Width = 783
              inherited SpeedButton3: TSpeedButton
                Left = 522
                Visible = False
                ExplicitLeft = 522
              end
              inherited SpeedButton4: TSpeedButton
                Left = 579
                Visible = False
                ExplicitLeft = 579
              end
              inherited SpeedButton5: TSpeedButton
                Left = 636
                Visible = False
                ExplicitLeft = 636
              end
              inherited SpeedButton6: TSpeedButton
                Left = 691
                ExplicitLeft = 691
              end
              inherited SpeedButton7: TSpeedButton
                Left = 691
                ExplicitLeft = 691
              end
              inherited SpeedButton8: TSpeedButton
                Left = 691
                ExplicitLeft = 691
              end
              inherited SpeedButton11: TSpeedButton
                Left = 691
                ExplicitLeft = 691
              end
              inherited SpeedButton12: TSpeedButton
                Left = 691
                ExplicitLeft = 691
              end
              inherited SpeedButton23: TSpeedButton
                Left = 691
                ExplicitLeft = 691
              end
              inherited SpeedButton24: TSpeedButton
                Left = 691
                ExplicitLeft = 691
              end
              inherited SpeedButton25: TSpeedButton
                Left = 579
                Visible = False
                ExplicitLeft = 579
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
