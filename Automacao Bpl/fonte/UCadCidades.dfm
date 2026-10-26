inherited FrmCadCidades: TFrmCadCidades
  Left = 275
  Top = 32
  Caption = 'Cidades'
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
              inherited TabSheet3: TTabSheet
                Caption = 'Casdastro de Cidade'
                ExplicitLeft = 4
                ExplicitTop = 27
                ExplicitWidth = 775
                ExplicitHeight = 431
                inherited ScrollBox3: TScrollBox
                  inherited GroupBox1: TGroupBox
                    Height = 145
                    Caption = ''
                    ExplicitHeight = 145
                    object Label6: TLabel
                      Left = 32
                      Top = 35
                      Width = 44
                      Height = 13
                      Caption = 'Codigo:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label7: TLabel
                      Left = 32
                      Top = 61
                      Width = 44
                      Height = 13
                      Caption = 'Cidade:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label8: TLabel
                      Left = 6
                      Top = 83
                      Width = 70
                      Height = 13
                      Caption = 'Nome IBGE:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label9: TLabel
                      Left = 16
                      Top = 107
                      Width = 60
                      Height = 13
                      Caption = 'C'#243'd.IBGE:'
                      Font.Charset = ANSI_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                      Visible = False
                    end
                    object Label10: TLabel
                      Left = 247
                      Top = 107
                      Width = 44
                      Height = 13
                      Caption = 'Estado:'
                      Font.Charset = ANSI_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                      Visible = False
                    end
                    object DBEdit1: TDBEdit
                      Left = 77
                      Top = 31
                      Width = 54
                      Height = 21
                      Hint = 'C'#243'digo da cidade'
                      DataField = 'COD_CIDADE'
                      DataSource = DtmCadBasicos.dsCidades
                      Enabled = False
                      TabOrder = 0
                    end
                    object DBEdit2: TDBEdit
                      Left = 77
                      Top = 56
                      Width = 336
                      Height = 21
                      Hint = 'Nome da Cidade'
                      CharCase = ecUpperCase
                      DataField = 'NOME_CIDADE'
                      DataSource = DtmCadBasicos.dsCidades
                      TabOrder = 1
                    end
                    object DBLookupComboBox1: TDBLookupComboBox
                      Left = 77
                      Top = 80
                      Width = 572
                      Height = 21
                      Hint = 'Nome da Cidade cadastrado no IBGE'
                      DataField = 'IBGE_COD_CIDADE'
                      DataSource = DtmCadBasicos.dsCidades
                      KeyField = 'CODIGO_MUN_IBGE'
                      ListField = 'NOME_MUNICIPIO;CODIGO_MUN_IBGE;NOME_UF'
                      ListSource = DtmCadBasicos.dsAbreCidadeIBGE
                      TabOrder = 2
                      OnExit = DBLookupComboBox1Exit
                      OnKeyDown = DBLookupComboBox1KeyDown
                    end
                    object DBEdit3: TDBEdit
                      Left = 77
                      Top = 104
                      Width = 121
                      Height = 21
                      Hint = 'C'#243'digo da cidade no IBGE'
                      DataField = 'CODIGO_MUN_IBGE'
                      DataSource = DtmCadBasicos.dsAbreCidadeIBGE
                      Enabled = False
                      TabOrder = 3
                      Visible = False
                    end
                    object DBEdit4: TDBEdit
                      Left = 292
                      Top = 104
                      Width = 121
                      Height = 21
                      Hint = 'UF da Cidade'
                      DataField = 'NOME_UF'
                      DataSource = DtmCadBasicos.dsAbreCidadeIBGE
                      Enabled = False
                      TabOrder = 4
                      Visible = False
                    end
                  end
                end
              end
            end
            inherited Panel3: TPanel
              inherited BitBtn4: TBitBtn
                Hint = 'Salvar Registro - [BAS060]'
              end
              inherited BitBtn5: TBitBtn
                Hint = 'Cancelar Registro - [BAS061]'
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
              Hint = 'Clique para pesquisar - [BAS053]'
            end
            inherited BitBtn3: TBitBtn
              Hint = 'Novo cadastro - [BAS054]'
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
              DataSource = DtmCadBasicos.dsCidades
              OnKeyDown = DBGrid1KeyDown
              Columns = <
                item
                  Expanded = False
                  FieldName = 'COD_CIDADE'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NOME_CIDADE'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'COD_USUARIO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'COD_USUARIO_ALT'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ATIVO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'IBGE_COD_CIDADE'
                  Visible = True
                end>
            end
            inherited Panel2: TPanel
              inherited SpeedButton1: TSpeedButton
                Hint = 'Editar Registro - [BAS055]'
              end
              inherited SpeedButton2: TSpeedButton
                Hint = 'Apagar Registro - [BAS057]'
                OnClick = SpeedButton2Click
              end
              inherited SpeedButton3: TSpeedButton
                Enabled = False
                Visible = False
              end
              inherited SpeedButton4: TSpeedButton
                OnClick = SpeedButton25Click
              end
              inherited SpeedButton5: TSpeedButton
                Hint = 'Recuperar registro - [BAS058]'
                OnClick = SpeedButton5Click
              end
              inherited SpeedButton6: TSpeedButton
                Caption = 'ZFM'
                Font.Color = clHighlight
                Font.Style = [fsBold]
                ParentFont = False
                OnClick = SpeedButton6Click
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
                Hint = 'Ver registros da lixeira - [BAS059]'
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
