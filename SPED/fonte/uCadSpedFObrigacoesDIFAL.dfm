inherited frmCadSpedFObrigacoesDIFAL: TfrmCadSpedFObrigacoesDIFAL
  Caption = 
    'Obriga'#231#245'es do ICMS recolhido ou a recolher - DIFAL UF Origem/Des' +
    'tino EC 87/15'
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
                object ScrollBox4: TScrollBox
                  Left = 0
                  Top = 0
                  Width = 775
                  Height = 431
                  Align = alClient
                  BorderStyle = bsNone
                  TabOrder = 0
                  object GroupBox4: TGroupBox
                    Left = 0
                    Top = 0
                    Width = 775
                    Height = 409
                    Align = alTop
                    Caption = 'Cadastro'
                    TabOrder = 0
                    object Label6: TLabel
                      Left = 24
                      Top = 51
                      Width = 210
                      Height = 13
                      Caption = 'C'#243'digo da obriga'#231#227'o recolhida ou a recolher'
                    end
                    object Label7: TLabel
                      Left = 145
                      Top = 78
                      Width = 89
                      Height = 13
                      Caption = 'Valor da obrigacao'
                      FocusControl = DBEdit1
                    end
                    object Label8: TLabel
                      Left = 545
                      Top = 78
                      Width = 81
                      Height = 13
                      Caption = 'Data vencimento'
                      FocusControl = DBEdit2
                    end
                    object Label9: TLabel
                      Left = 150
                      Top = 105
                      Width = 84
                      Height = 13
                      Caption = 'Codigo da receita'
                      FocusControl = DBEdit3
                    end
                    object Label10: TLabel
                      Left = 167
                      Top = 132
                      Width = 67
                      Height = 13
                      Caption = 'Num Processo'
                      FocusControl = DBEdit4
                    end
                    object Label12: TLabel
                      Left = 135
                      Top = 159
                      Width = 99
                      Height = 13
                      Caption = 'Ind Origem Processo'
                    end
                    object Label11: TLabel
                      Left = 81
                      Top = 186
                      Width = 153
                      Height = 13
                      Caption = 'Descricao resumida do processo'
                      FocusControl = DBMemo1
                    end
                    object Label13: TLabel
                      Left = 118
                      Top = 281
                      Width = 116
                      Height = 13
                      Caption = 'Descricao complementar'
                      FocusControl = DBMemo2
                    end
                    object Label14: TLabel
                      Left = 137
                      Top = 376
                      Width = 97
                      Height = 13
                      Caption = 'Ano/Mes Referencia'
                      FocusControl = DBEdit5
                    end
                    object Label15: TLabel
                      Left = 554
                      Top = 376
                      Width = 72
                      Height = 13
                      Caption = 'Data Apuracao'
                      FocusControl = DBEdit7
                    end
                    object Label16: TLabel
                      Left = 201
                      Top = 24
                      Width = 33
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Estado'
                    end
                    object DBEdit1: TDBEdit
                      Left = 240
                      Top = 75
                      Width = 134
                      Height = 21
                      DataField = 'VL_OR'
                      DataSource = dtmSPED.dsICMInterOb
                      TabOrder = 2
                    end
                    object DBEdit2: TDBEdit
                      Left = 632
                      Top = 75
                      Width = 122
                      Height = 21
                      DataField = 'DT_VCTO'
                      DataSource = dtmSPED.dsICMInterOb
                      TabOrder = 3
                    end
                    object DBEdit3: TDBEdit
                      Left = 240
                      Top = 102
                      Width = 514
                      Height = 21
                      DataField = 'COD_REC'
                      DataSource = dtmSPED.dsICMInterOb
                      TabOrder = 4
                    end
                    object DBEdit4: TDBEdit
                      Left = 240
                      Top = 129
                      Width = 199
                      Height = 21
                      DataField = 'NUM_PROC'
                      DataSource = dtmSPED.dsICMInterOb
                      TabOrder = 5
                    end
                    object DBLookupComboBox1: TDBLookupComboBox
                      Left = 240
                      Top = 48
                      Width = 514
                      Height = 21
                      DataField = 'COD_OR'
                      DataSource = dtmSPED.dsICMInterOb
                      TabOrder = 1
                    end
                    object DBLookupComboBox2: TDBLookupComboBox
                      Left = 240
                      Top = 156
                      Width = 514
                      Height = 21
                      DataField = 'IND_PROC'
                      DataSource = dtmSPED.dsICMInterOb
                      TabOrder = 6
                    end
                    object DBMemo1: TDBMemo
                      Left = 240
                      Top = 183
                      Width = 514
                      Height = 89
                      DataField = 'PROC'
                      DataSource = dtmSPED.dsICMInterOb
                      TabOrder = 7
                    end
                    object DBMemo2: TDBMemo
                      Left = 240
                      Top = 278
                      Width = 514
                      Height = 89
                      DataField = 'TXT_COMPL'
                      DataSource = dtmSPED.dsICMInterOb
                      TabOrder = 8
                    end
                    object DBEdit5: TDBEdit
                      Left = 240
                      Top = 373
                      Width = 22
                      Height = 21
                      DataField = 'MES_REF'
                      DataSource = dtmSPED.dsICMInterOb
                      TabOrder = 9
                    end
                    object DBEdit6: TDBEdit
                      Left = 268
                      Top = 373
                      Width = 53
                      Height = 21
                      DataField = 'ANO_REF'
                      DataSource = dtmSPED.dsICMInterOb
                      TabOrder = 10
                    end
                    object DBEdit7: TDBEdit
                      Left = 632
                      Top = 373
                      Width = 122
                      Height = 21
                      DataField = 'DATA_LANC'
                      DataSource = dtmSPED.dsICMInterOb
                      TabOrder = 11
                    end
                    object DBLookupComboBox3: TDBLookupComboBox
                      Left = 240
                      Top = 21
                      Width = 514
                      Height = 21
                      DataField = 'UF'
                      DataSource = dtmSPED.dsICMInterOb
                      TabOrder = 0
                    end
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
              Top = 50
              Visible = False
              ExplicitTop = 50
            end
            inherited CheckBox1: TCheckBox
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
                Visible = False
              end
              inherited SpeedButton4: TSpeedButton
                Visible = False
              end
              inherited SpeedButton5: TSpeedButton
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
                Top = 6
                Visible = False
                ExplicitTop = 6
              end
              inherited SpeedButton25: TSpeedButton
                Visible = False
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
