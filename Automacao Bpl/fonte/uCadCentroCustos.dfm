inherited frmCadCentroCustos: TfrmCadCentroCustos
  Caption = 'Centro de Custos'
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
                ExplicitLeft = 4
                ExplicitTop = 27
                ExplicitWidth = 775
                ExplicitHeight = 431
                inherited ScrollBox3: TScrollBox
                  inherited GroupBox1: TGroupBox
                    Height = 427
                    Align = alClient
                    Caption = 'Centro de Custos'
                    ExplicitHeight = 427
                    object Label6: TLabel
                      Left = 147
                      Top = 32
                      Width = 33
                      Height = 13
                      Caption = 'C'#243'digo'
                      FocusControl = DBEdit1
                    end
                    object Label7: TLabel
                      Left = 134
                      Top = 59
                      Width = 46
                      Height = 13
                      Caption = 'Descri'#231#227'o'
                      FocusControl = DBEdit2
                    end
                    object DBEdit1: TDBEdit
                      Left = 186
                      Top = 29
                      Width = 134
                      Height = 21
                      DataField = 'COD_CCUS'
                      DataSource = dtmCIAP.dsCCusto
                      TabOrder = 0
                    end
                    object DBEdit2: TDBEdit
                      Left = 186
                      Top = 56
                      Width = 457
                      Height = 21
                      DataField = 'CCUS'
                      DataSource = dtmCIAP.dsCCusto
                      TabOrder = 1
                    end
                  end
                end
              end
            end
            inherited Panel3: TPanel
              inherited BitBtn4: TBitBtn
                Hint = 'Salvar Registro - [SPED060]'
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
              Hint = 'Clique para pesquisar - [SPED054]'
            end
            inherited BitBtn3: TBitBtn
              Hint = 'Novo cadastro - [SPED055]'
            end
            inherited CheckBox3: TCheckBox
              Visible = False
            end
            inherited CheckBox1: TCheckBox
              Visible = False
            end
          end
          inherited Panel1: TPanel
            inherited DBGrid1: TDBGrid
              OnKeyDown = DBGrid1KeyDown
              Columns = <
                item
                  Expanded = False
                  FieldName = 'COD_CCUS'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'COD_EMPRESA'
                  Visible = False
                end
                item
                  Expanded = False
                  FieldName = 'CCUS'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DT_ALT'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ATIVO'
                  Visible = False
                end>
            end
            inherited Panel2: TPanel
              inherited SpeedButton1: TSpeedButton
                Hint = 'Editar Registro - [SPED056]'
              end
              inherited SpeedButton2: TSpeedButton
                Hint = 'Apagar Registro - [SPED057]'
                OnClick = SpeedButton2Click
              end
              inherited SpeedButton5: TSpeedButton
                Hint = 'Recuperar registro - [SPED059]'
                OnClick = SpeedButton5Click
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
                Visible = False
              end
              inherited SpeedButton25: TSpeedButton
                Hint = 'Ver registros da lixeira - [SPED053]'
                OnClick = SpeedButton25Click
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
