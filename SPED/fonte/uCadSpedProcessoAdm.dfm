inherited frmCadSpedProcessoAdm: TfrmCadSpedProcessoAdm
  Caption = 'Processo Administrativo para o SPED'
  ExplicitWidth = 806
  ExplicitHeight = 598
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelFundo: TPanel
    inherited PanelLeft: TPanel
      inherited PageControl1: TPageControl
        MultiLine = True
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
                  Caption = 'Cadastro de A'#231#227'o Judicial'
                  TabOrder = 0
                  object Label6: TLabel
                    Left = 176
                    Top = 32
                    Width = 33
                    Height = 13
                    BiDiMode = bdRightToLeft
                    Caption = 'C'#243'digo'
                    FocusControl = DBEdit1
                    ParentBiDiMode = False
                  end
                  object Label7: TLabel
                    Left = 126
                    Top = 59
                    Width = 83
                    Height = 13
                    BiDiMode = bdRightToLeft
                    Caption = 'Numero Processo'
                    FocusControl = DBEdit2
                    ParentBiDiMode = False
                  end
                  object Label10: TLabel
                    Left = 33
                    Top = 86
                    Width = 176
                    Height = 13
                    BiDiMode = bdRightToLeft
                    Caption = 'Natureza da Processo Administrativo'
                    ParentBiDiMode = False
                  end
                  object Label12: TLabel
                    Left = 9
                    Top = 113
                    Width = 200
                    Height = 13
                    BiDiMode = bdRightToLeft
                    Caption = 'Data do Despacho/Decis'#227'o Administrativa'
                    FocusControl = DBEdit7
                    ParentBiDiMode = False
                  end
                  object Label13: TLabel
                    Left = 533
                    Top = 113
                    Width = 84
                    Height = 13
                    Caption = 'Data Lan'#231'amento'
                    FocusControl = DBEdit8
                  end
                  object DBEdit1: TDBEdit
                    Left = 215
                    Top = 29
                    Width = 114
                    Height = 21
                    DataField = 'COD_ADM'
                    DataSource = dtmSPED.dsProcAdm
                    Enabled = False
                    TabOrder = 0
                  end
                  object DBEdit2: TDBEdit
                    Left = 215
                    Top = 56
                    Width = 264
                    Height = 21
                    CharCase = ecUpperCase
                    DataField = 'NUM_PROC'
                    DataSource = dtmSPED.dsProcAdm
                    TabOrder = 1
                  end
                  object DBEdit7: TDBEdit
                    Left = 215
                    Top = 110
                    Width = 114
                    Height = 21
                    DataField = 'DT_DEC_ADM'
                    DataSource = dtmSPED.dsProcAdm
                    TabOrder = 3
                  end
                  object DBEdit8: TDBEdit
                    Left = 623
                    Top = 110
                    Width = 114
                    Height = 21
                    DataField = 'DATA_LANC'
                    DataSource = dtmSPED.dsProcAdm
                    Enabled = False
                    TabOrder = 4
                  end
                  object DBComboBox1: TDBComboBox
                    Left = 215
                    Top = 83
                    Width = 522
                    Height = 21
                    DataField = 'IND_NAT_ACAO'
                    DataSource = dtmSPED.dsProcAdm
                    ItemHeight = 0
                    Items.Strings = (
                      '01 '#8211' Processo Administrativo de Consulta'
                      '02 '#8211' Despacho Decis'#243'rio'
                      '03 '#8211' Ato Declarat'#243'rio Executivo'
                      '04 '#8211' Ato Declarat'#243'rio Interpretativo'
                      '05 '#8211' Decis'#227'o Administrativa de DRJ ou do CARF'
                      '06 '#8211' Auto de Infra'#231#227'o'
                      '99 '#8211' Outros')
                    TabOrder = 2
                    OnExit = DBComboBox1Exit
                  end
                end
              end
            end
            inherited Panel3: TPanel
              inherited BitBtn4: TBitBtn
                Hint = 'Confirmar Registro - [SPED021]'
              end
              inherited BitBtn5: TBitBtn
                Top = 6
                Hint = 'Cancelar Registro'
                ExplicitTop = 6
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
              Hint = 'Clique para pesquisar - [SPED017]'
            end
            inherited BitBtn3: TBitBtn
              Hint = 'Novo cadastro - [SPED018]'
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
                Hint = 'Editar Registro - [SPED019]'
              end
              inherited SpeedButton2: TSpeedButton
                Top = 6
                Hint = 'Apagar Registro - [SPED020]'
                OnClick = SpeedButton2Click
                ExplicitTop = 6
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
