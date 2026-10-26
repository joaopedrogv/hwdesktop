inherited FrmCadBairros: TFrmCadBairros
  Left = 246
  Caption = 'Bairros'
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
                Caption = 'Cadastro de Bairros'
                ExplicitLeft = 4
                ExplicitTop = 27
                ExplicitWidth = 775
                ExplicitHeight = 431
                inherited ScrollBox3: TScrollBox
                  inherited GroupBox1: TGroupBox
                    Caption = ''
                    object Label6: TLabel
                      Left = 26
                      Top = 26
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
                      Top = 53
                      Width = 38
                      Height = 13
                      Caption = 'Bairro:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object DBEdit2: TDBEdit
                      Left = 75
                      Top = 50
                      Width = 339
                      Height = 21
                      Hint = 'Nome do Bairro'
                      CharCase = ecUpperCase
                      DataField = 'NOME_BAIRRO'
                      DataSource = DtmCadBasicos.dsBairros
                      TabOrder = 1
                    end
                    object DBEdit1: TDBEdit
                      Left = 75
                      Top = 23
                      Width = 54
                      Height = 21
                      Hint = 'C'#243'digo do bairro'
                      DataField = 'COD_BAIRRO'
                      DataSource = DtmCadBasicos.dsBairros
                      Enabled = False
                      TabOrder = 0
                    end
                  end
                end
              end
            end
            inherited Panel3: TPanel
              inherited BitBtn4: TBitBtn
                Hint = 'Salvar Registro - [BAS051]'
              end
              inherited BitBtn5: TBitBtn
                Hint = 'Cancelar Registro - [BAS052]'
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
              Hint = 'Clique para pesquisar - [BAS045]'
            end
            inherited BitBtn3: TBitBtn
              Hint = 'Novo cadastro - [BAS046]'
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
              Columns = <
                item
                  Expanded = False
                  FieldName = 'COD_BAIRRO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NOME_BAIRRO'
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
                end>
            end
            inherited Panel2: TPanel
              inherited SpeedButton1: TSpeedButton
                Hint = 'Editar Registro - [BAS047]'
              end
              inherited SpeedButton2: TSpeedButton
                Hint = 'Apagar Registro - [BAS048]'
                OnClick = SpeedButton2Click
              end
              inherited SpeedButton3: TSpeedButton
                Enabled = False
                Visible = False
              end
              inherited SpeedButton5: TSpeedButton [3]
                Left = 234
                Hint = 'Recuperar registro - [BAS048]'
                OnClick = SpeedButton5Click
                ExplicitLeft = 234
              end
              inherited SpeedButton6: TSpeedButton [4]
                Enabled = False
                Visible = False
              end
              inherited SpeedButton7: TSpeedButton [5]
                Enabled = False
                Visible = False
              end
              inherited SpeedButton8: TSpeedButton [6]
                Enabled = False
                Visible = False
              end
              inherited SpeedButton4: TSpeedButton [7]
                Left = 177
                OnClick = SpeedButton25Click
                ExplicitLeft = 177
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
                Hint = 'Ver registros da lixeira - [BAS050]'
                OnClick = SpeedButton25Click
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
    inherited lbTextoProcessamento: TLabel
      Width = 477
      Height = 21
    end
  end
end
