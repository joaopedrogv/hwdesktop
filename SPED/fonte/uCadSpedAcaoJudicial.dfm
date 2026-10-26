inherited frmCadSpedAcaoJudicial: TfrmCadSpedAcaoJudicial
  Caption = 'A'#231#227'o Judicial para o SPED'
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
                  Caption = 'Cadastro de A'#231#227'o Judicial'
                  TabOrder = 0
                  object Label6: TLabel
                    Left = 168
                    Top = 32
                    Width = 33
                    Height = 13
                    Caption = 'C'#243'digo'
                    FocusControl = DBEdit1
                  end
                  object Label7: TLabel
                    Left = 115
                    Top = 59
                    Width = 83
                    Height = 13
                    Caption = 'Numero Processo'
                    FocusControl = DBEdit2
                  end
                  object Label8: TLabel
                    Left = 125
                    Top = 86
                    Width = 76
                    Height = 13
                    Caption = 'Se'#231#227'o Judici'#225'ria'
                    FocusControl = DBEdit3
                  end
                  object Label9: TLabel
                    Left = 99
                    Top = 113
                    Width = 102
                    Height = 13
                    Caption = 'Identifica'#231#227'o da Vara'
                    FocusControl = DBEdit4
                  end
                  object Label10: TLabel
                    Left = 78
                    Top = 140
                    Width = 123
                    Height = 13
                    Caption = 'Natureza da A'#231#227'o Judicial'
                  end
                  object Label12: TLabel
                    Left = 37
                    Top = 226
                    Width = 164
                    Height = 13
                    Caption = 'Data da Senten'#231'a/Decis'#227'o Judicial'
                    FocusControl = DBEdit7
                  end
                  object Label13: TLabel
                    Left = 525
                    Top = 226
                    Width = 84
                    Height = 13
                    Caption = 'Data Lan'#231'amento'
                    FocusControl = DBEdit8
                  end
                  object DBEdit1: TDBEdit
                    Left = 207
                    Top = 29
                    Width = 114
                    Height = 21
                    DataField = 'COD_ACAO_JUDICIAL'
                    DataSource = dtmSPED.dsAcaoJud
                    Enabled = False
                    TabOrder = 0
                  end
                  object DBEdit2: TDBEdit
                    Left = 207
                    Top = 56
                    Width = 264
                    Height = 21
                    CharCase = ecUpperCase
                    DataField = 'NUM_PROC'
                    DataSource = dtmSPED.dsAcaoJud
                    TabOrder = 1
                  end
                  object DBEdit3: TDBEdit
                    Left = 207
                    Top = 83
                    Width = 522
                    Height = 21
                    CharCase = ecUpperCase
                    DataField = 'ID_SEC_JUD'
                    DataSource = dtmSPED.dsAcaoJud
                    TabOrder = 2
                  end
                  object DBEdit4: TDBEdit
                    Left = 207
                    Top = 110
                    Width = 30
                    Height = 21
                    CharCase = ecUpperCase
                    DataField = 'ID_VARA'
                    DataSource = dtmSPED.dsAcaoJud
                    TabOrder = 3
                  end
                  object DBEdit7: TDBEdit
                    Left = 207
                    Top = 223
                    Width = 114
                    Height = 21
                    DataField = 'DT_SENT_JUD'
                    DataSource = dtmSPED.dsAcaoJud
                    TabOrder = 6
                  end
                  object DBEdit8: TDBEdit
                    Left = 615
                    Top = 223
                    Width = 114
                    Height = 21
                    DataField = 'DATA_LANC'
                    DataSource = dtmSPED.dsAcaoJud
                    Enabled = False
                    TabOrder = 7
                  end
                  object DBComboBox1: TDBComboBox
                    Left = 207
                    Top = 137
                    Width = 522
                    Height = 21
                    DataField = 'IND_NAT_ACAO'
                    DataSource = dtmSPED.dsAcaoJud
                    ItemHeight = 0
                    Items.Strings = (
                      
                        '01 '#8211' Decis'#227'o Judicial Transitada em Julgado, a favor da Pessoa J' +
                        'ur'#237'dica'
                      
                        '02 '#8211' Decis'#227'o Judicial N'#227'o Transitada em Julgado, a favor da Pess' +
                        'oa Jur'#237'dica'
                      '03 '#8211' Decis'#227'o Judicial oriunda de Liminar em Mandado de Seguran'#231'a'
                      '04 '#8211' Decis'#227'o Judicial oriunda de Liminar em Medida Cautelar'
                      '05 '#8211' Decis'#227'o Judicial oriunda de Antecipa'#231#227'o de Tutela'
                      
                        '06 - Decis'#227'o Judicial Vinculada a Dep'#243'sito Administrativo ou Jud' +
                        'icial em Montante Integral'
                      '07 '#8211' Medida Judicial em que a Pessoa Jur'#237'dica n'#227'o '#233' o autor'
                      '08 '#8211' S'#250'mula Vinculante aprovada pelo STF'
                      
                        '09 '#8211' Decis'#227'o judicial oriunda de liminar em mandado de seguran'#231'a' +
                        ' coletivo.'
                      
                        '12 '#8211' Decis'#227'o judicial n'#227'o transitada em julgado, a favor da pess' +
                        'oa jur'#237'dica - Exigibilidade suspensa de contribui'#231#227'o.'
                      
                        '13 '#8211' Decis'#227'o judicial oriunda de liminar em mandado de seguran'#231'a' +
                        ' - Exigibilidade suspensa de contribui'#231#227'o.'
                      
                        '14 '#8211' Decis'#227'o judicial oriunda de liminar em medida cautelar - Ex' +
                        'igibilidade suspensa de contribui'#231#227'o.'
                      
                        '15 '#8211' Decis'#227'o judicial oriunda de antecipa'#231#227'o de tutela - Exigibi' +
                        'lidade suspensa de contribui'#231#227'o.'
                      
                        '16 - Decis'#227'o judicial vinculada a dep'#243'sito administrativo ou jud' +
                        'icial em montante integral - Exigibilidade suspensa de contribui' +
                        #231#227'o.'
                      
                        '17 '#8211' Medida judicial em que a pessoa jur'#237'dica n'#227'o '#233' o autor - Ex' +
                        'igibilidade suspensa de contribui'#231#227'o.'
                      
                        '19 '#8211' Decis'#227'o judicial oriunda de liminar em mandado de seguran'#231'a' +
                        ' coletivo - Exigibilidade suspensa de contribui'#231#227'o'
                      '99 - Outros')
                    TabOrder = 4
                    OnExit = DBComboBox1Exit
                  end
                  object GroupBox5: TGroupBox
                    Left = 37
                    Top = 164
                    Width = 724
                    Height = 53
                    Caption = 
                      'Descri'#231#227'o Resumida dos Efeitos Tribut'#225'rios abrangidos pela Decis' +
                      #227'o Judicial proferida'
                    TabOrder = 5
                    object DBEdit6: TDBEdit
                      Left = 170
                      Top = 22
                      Width = 522
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'DESC_DEC_JUD'
                      DataSource = dtmSPED.dsAcaoJud
                      TabOrder = 0
                    end
                  end
                end
              end
            end
            inherited Panel3: TPanel
              inherited BitBtn4: TBitBtn
                Hint = 'Confirmar Registro - [SPED015]'
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
              Hint = 'Clique para pesquisar - [SPED011]'
            end
            inherited BitBtn3: TBitBtn
              Hint = 'Novo cadastro - [SPED012]'
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
                Hint = 'Editar Registro - [SPED013]'
              end
              inherited SpeedButton2: TSpeedButton
                Hint = 'Apagar Registro - [SPED014]'
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
