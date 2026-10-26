inherited frmCadTipoVendaPerdida: TfrmCadTipoVendaPerdida
  Caption = 'Venda Perdida'
  ExplicitWidth = 806
  ExplicitHeight = 598
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelFundo: TPanel
    inherited PanelLeft: TPanel
      inherited PageControl1: TPageControl
        inherited TabSheet1: TTabSheet
          inherited ScrollBox1: TScrollBox
            inherited PageControl3: TPageControl
              inherited TabSheet3: TTabSheet
                ExplicitLeft = 4
                ExplicitTop = 27
                ExplicitWidth = 775
                ExplicitHeight = 431
                inherited ScrollBox3: TScrollBox
                  inherited GroupBox1: TGroupBox
                    Height = 113
                    Caption = 'Tipo de Venda Perdida'
                    ExplicitHeight = 113
                    object Label6: TLabel
                      Left = 100
                      Top = 29
                      Width = 37
                      Height = 13
                      Caption = 'C'#243'digo:'
                      FocusControl = DBEdit1
                    end
                    object Label7: TLabel
                      Left = 87
                      Top = 56
                      Width = 50
                      Height = 13
                      Caption = 'Descri'#231#227'o:'
                      FocusControl = DBEdit2
                    end
                    object Label8: TLabel
                      Left = 84
                      Top = 83
                      Width = 53
                      Height = 13
                      Caption = 'Entr. Sug.:'
                    end
                    object Label9: TLabel
                      Left = 294
                      Top = 83
                      Width = 93
                      Height = 13
                      Caption = 'Baixa Entrada NFE:'
                    end
                    object DBEdit1: TDBEdit
                      Left = 143
                      Top = 21
                      Width = 134
                      Height = 21
                      DataField = 'CODIGO_VP'
                      DataSource = dtmVendaPerdida.dsTipVP
                      Enabled = False
                      TabOrder = 0
                    end
                    object DBEdit2: TDBEdit
                      Left = 143
                      Top = 48
                      Width = 329
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'DESCRICAO_VP'
                      DataSource = dtmVendaPerdida.dsTipVP
                      TabOrder = 1
                    end
                    object DBComboBox1: TDBComboBox
                      Left = 143
                      Top = 75
                      Width = 82
                      Height = 21
                      DataField = 'ENT_SUG_VP'
                      DataSource = dtmVendaPerdida.dsTipVP
                      ItemHeight = 0
                      Items.Strings = (
                        'SIM'
                        'N'#195'O')
                      TabOrder = 2
                    end
                    object DBComboBox2: TDBComboBox
                      Left = 393
                      Top = 75
                      Width = 79
                      Height = 21
                      DataField = 'BX_ENTR_NFE'
                      DataSource = dtmVendaPerdida.dsTipVP
                      ItemHeight = 0
                      Items.Strings = (
                        'SIM'
                        'N'#195'O')
                      TabOrder = 3
                    end
                  end
                end
              end
            end
            inherited Panel3: TPanel
              inherited BitBtn4: TBitBtn
                Hint = 'Confirmar Registro - [VND111]'
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
              Hint = 'Clique para pesquisar - [VND109]'
            end
            inherited BitBtn3: TBitBtn
              Hint = 'Novo cadastro - [VND110]'
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
                  FieldName = 'CODIGO_VP'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'COD_EMPRESA'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DESCRICAO_VP'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ENT_SUG_VP'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'BX_ENTR_NFE'
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
                Hint = 'Editar Registro - [VND112]'
              end
              inherited SpeedButton2: TSpeedButton
                Hint = 'Apagar Registro - [VND113]'
                OnClick = SpeedButton2Click
              end
              inherited SpeedButton3: TSpeedButton
                Enabled = False
              end
              inherited SpeedButton4: TSpeedButton
                Hint = 'Lixeira vazia - [VND114]'
                OnClick = SpeedButton4Click
              end
              inherited SpeedButton5: TSpeedButton
                Hint = 'Recuperar registro - [VND115]'
                OnClick = SpeedButton5Click
              end
              inherited SpeedButton6: TSpeedButton
                Enabled = False
              end
              inherited SpeedButton7: TSpeedButton
                Enabled = False
              end
              inherited SpeedButton8: TSpeedButton
                Enabled = False
              end
              inherited SpeedButton11: TSpeedButton
                Enabled = False
              end
              inherited SpeedButton12: TSpeedButton
                Enabled = False
              end
              inherited SpeedButton23: TSpeedButton
                Enabled = False
              end
              inherited SpeedButton24: TSpeedButton
                Enabled = False
              end
              inherited SpeedButton25: TSpeedButton
                Hint = 'Ver registros da lixeira - [VND114]'
                Visible = False
                OnClick = SpeedButton25Click
              end
              inherited SpeedButton26: TSpeedButton
                Enabled = False
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
