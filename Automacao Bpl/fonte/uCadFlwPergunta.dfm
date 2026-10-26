inherited frmCadFlwPergunta: TfrmCadFlwPergunta
  Caption = 'Perguntas'
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
                  Caption = 'Cadastro de Grupos de Perguntas'
                  TabOrder = 0
                  object Label6: TLabel
                    Left = 69
                    Top = 39
                    Width = 37
                    Height = 13
                    Caption = 'C'#243'digo:'
                    FocusControl = DBEdit1
                  end
                  object Label7: TLabel
                    Left = 73
                    Top = 66
                    Width = 33
                    Height = 13
                    Caption = 'Grupo:'
                    FocusControl = DBEdit2
                  end
                  object Label8: TLabel
                    Left = 58
                    Top = 93
                    Width = 48
                    Height = 13
                    Caption = 'Pergunta:'
                    FocusControl = DBEdit3
                  end
                  object Label9: TLabel
                    Left = 19
                    Top = 119
                    Width = 87
                    Height = 13
                    Caption = 'Tipo de Resposta:'
                  end
                  object DBEdit1: TDBEdit
                    Left = 112
                    Top = 31
                    Width = 89
                    Height = 21
                    DataField = 'CODPERGUNTA'
                    DataSource = dtmFollowUpPosAtendimento.dsPergunta
                    Enabled = False
                    TabOrder = 0
                  end
                  object DBEdit2: TDBEdit
                    Left = 112
                    Top = 58
                    Width = 89
                    Height = 21
                    DataField = 'CODGRUPO'
                    DataSource = dtmFollowUpPosAtendimento.dsPergunta
                    TabOrder = 1
                    OnExit = DBEdit2Exit
                    OnKeyDown = DBEdit2KeyDown
                  end
                  object DBEdit3: TDBEdit
                    Left = 112
                    Top = 85
                    Width = 615
                    Height = 21
                    CharCase = ecUpperCase
                    DataField = 'PERGUNTA'
                    DataSource = dtmFollowUpPosAtendimento.dsPergunta
                    TabOrder = 3
                  end
                  object GroupBox5: TGroupBox
                    Left = 11
                    Top = 139
                    Width = 758
                    Height = 286
                    Caption = 'Complemento da Pergunta'
                    TabOrder = 5
                    object Label10: TLabel
                      Left = 33
                      Top = 55
                      Width = 62
                      Height = 13
                      Caption = 'Alternativas:'
                    end
                    object Label11: TLabel
                      Left = 26
                      Top = 28
                      Width = 69
                      Height = 13
                      Caption = 'Complemento:'
                    end
                    object SpeedButton14: TSpeedButton
                      Left = 722
                      Top = 47
                      Width = 23
                      Height = 22
                      Hint = 'Adicionar nova alternativa'
                      Flat = True
                      Glyph.Data = {
                        36050000424D3605000000000000360400002800000010000000100000000100
                        08000000000000010000F30E0000F30E00000001000000010000181884001818
                        8C0018189C001818A5001818AD001818B5001818BD001818CE001818D6001818
                        DE001818EF001818F700FF00FF001821FF002129FF002931FF003131FF003939
                        FF004A4AFF005252FF00525AFF00636BFF006B73FF008484FF00B5BDFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000C1919191919
                        1919191919191919190C191403040404050504040303020112191905080A0B0B
                        0A0B0A0A0A090805001919070A0D0D0D0D0D0D0D0D0D0906021919090D0D0D0D
                        0D19160D0D0D0B080319190A0D0D0D0D0D19160D0D0D0D090419190D0D0D0D0D
                        0D19160D0D0D0D0A0519190D0D1616161619161616160B0A0619190D0D191919
                        1919191919190A0A0619190D0E0E0D0D0D19160D0D0B0A0A0619190D11110E0D
                        0D19160D0D0B0A0A0619190E13120F0E0E19160D0D0D0B0B0619191116131110
                        0F19160D0D0D0D0B061919121716131211100F0E0D0D0D0B0419191812100E0D
                        0D0D0D0D0D0D0B0815190C19191919191919191919191919190C}
                      ParentShowHint = False
                      ShowHint = True
                      OnClick = SpeedButton14Click
                    end
                    object SpeedButton15: TSpeedButton
                      Left = 722
                      Top = 75
                      Width = 23
                      Height = 22
                      Hint = 'Apagar alternativa'
                      Flat = True
                      Glyph.Data = {
                        36050000424D3605000000000000360400002800000010000000100000000100
                        08000000000000010000F30E0000F30E00000001000000010000181884001818
                        8C0018189C001818A5001818AD001818B5001818BD001818CE001818D6001818
                        DE001818EF001818F700FF00FF001821FF002129FF002931FF003131FF003939
                        FF004A4AFF005252FF00525AFF00636BFF006B73FF008484FF00B5BDFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000C1919191919
                        1919191919191919190C191403040404050504040303020112191905080A0B0B
                        0A0B0A0A0A090805001919070A0D0D0D0D0D0D0D0D0D0906021919090D0D0D0D
                        0D0D0D0D0D0D0B080319190A0D0D0D0D0D0D0D0D0D0D0D090419190D0D0D0D0D
                        0D0D0D0D0D0D0D0A0519190D0D1616161616161616160B0A0619190D0D191919
                        1919191919190A0A0619190D0E0E0D0D0D0D0D0D0D0B0A0A0619190D11110E0D
                        0D0D0D0D0D0B0A0A0619190E13120F0E0E0D0D0D0D0D0B0B0619191116131110
                        0F0F0D0D0D0D0D0B061919121716131211100F0E0D0D0D0B0419191812100E0D
                        0D0D0D0D0D0D0B0815190C19191919191919191919191919190C}
                      ParentShowHint = False
                      ShowHint = True
                      OnClick = SpeedButton15Click
                    end
                    object SpeedButton16: TSpeedButton
                      Left = 722
                      Top = 103
                      Width = 23
                      Height = 22
                      Hint = 'Alterar alternativa'
                      Flat = True
                      Glyph.Data = {
                        36050000424D3605000000000000360400002800000010000000100000000100
                        08000000000000010000F30E0000F30E00000001000000010000181884001818
                        8C0018189C001818A5001818AD001818B5001818BD001818CE001818D6001818
                        DE001818EF001818F700FF00FF001821FF002129FF002931FF003131FF003939
                        FF004A4AFF005252FF00525AFF00636BFF006B73FF008484FF00B5BDFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000C1919191919
                        1919191919191919190C191403040404050504040303020112191905080A0B0B
                        0A0B0A0A0A090805001919070A0D0D0D0D0D0D0D0D0D0906021919090D0D0D0D
                        0D0D0D0D0D0D0B080319190A0D16161616161616161616090419190D0D161919
                        191919191919160A0519190D0D0D16191919191919160B0A0619190D0D0D0D16
                        19191919160B0A0A0619190D0E0E0D0D161919160D0B0A0A0619190D11110E0D
                        0D16160D0D0B0A0A0619190E13120F0E0E0D0D0D0D0D0B0B0619191116131110
                        0F0F0D0D0D0D0D0B061919121716131211100F0E0D0D0D0B0419191812100E0D
                        0D0D0D0D0D0D0B0815190C19191919191919191919191919190C}
                      ParentShowHint = False
                      ShowHint = True
                      OnClick = SpeedButton16Click
                    end
                    object DBEdit5: TDBEdit
                      Left = 101
                      Top = 20
                      Width = 644
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'COMPLEMENTO'
                      DataSource = dtmFollowUpPosAtendimento.dsPergunta
                      TabOrder = 0
                    end
                    object DBGrid2: TDBGrid
                      Left = 101
                      Top = 74
                      Width = 615
                      Height = 199
                      DataSource = dtmFollowUpPosAtendimento.dsPergCompl
                      Options = [dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                      TabOrder = 2
                      TitleFont.Charset = DEFAULT_CHARSET
                      TitleFont.Color = clWindowText
                      TitleFont.Height = -11
                      TitleFont.Name = 'Tahoma'
                      TitleFont.Style = []
                      Columns = <
                        item
                          Expanded = False
                          FieldName = 'ALTERNATIVA'
                          Visible = True
                        end>
                    end
                    object Edit1: TEdit
                      Left = 101
                      Top = 47
                      Width = 615
                      Height = 21
                      CharCase = ecUpperCase
                      TabOrder = 1
                    end
                  end
                  object DBLookupComboBox1: TDBLookupComboBox
                    Left = 207
                    Top = 58
                    Width = 520
                    Height = 21
                    DataField = 'CODGRUPO'
                    DataSource = dtmFollowUpPosAtendimento.dsPergunta
                    DropDownRows = 8
                    KeyField = 'CODGRUPO'
                    ListField = 'DESCRICAO;CATEGORIA'
                    ListSource = dtmFollowUpPosAtendimento.dsFlwGrCons
                    TabOrder = 2
                  end
                  object DBComboBox1: TDBComboBox
                    Left = 112
                    Top = 112
                    Width = 176
                    Height = 21
                    Style = csDropDownList
                    DataField = 'SIMNAONIVEL'
                    DataSource = dtmFollowUpPosAtendimento.dsPergunta
                    ItemHeight = 0
                    Items.Strings = (
                      'Sim ou N'#227'o'
                      'Nivel de 1 a 5'
                      'Pessimo a Excelente')
                    TabOrder = 4
                  end
                end
              end
            end
            inherited Panel3: TPanel
              inherited BitBtn4: TBitBtn
                Hint = 'Salvar registro - [CRM039]'
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
              Hint = 'Consultar registros - [CRM036]'
            end
            inherited BitBtn3: TBitBtn
              Hint = 'Novo registro - [CRM037]'
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
              OnKeyDown = DBGrid1KeyDown
            end
            inherited Panel2: TPanel
              inherited SpeedButton1: TSpeedButton
                Hint = 'Editar Registro - [CRM038]'
              end
              inherited SpeedButton2: TSpeedButton
                Hint = 'Apagar Registro - [CRM040]'
                OnClick = SpeedButton2Click
              end
              inherited SpeedButton3: TSpeedButton
                Enabled = False
                Visible = False
              end
              inherited SpeedButton5: TSpeedButton
                Hint = 'Recuperar registro - [CRM043]'
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
                Hint = 'Ver registros da lixeira - [CRM042]'
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
end
