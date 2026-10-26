inherited FrmCadDSGS: TFrmCadDSGS
  Caption = 'Departamantaliza'#231#227'o de Itens'
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
                Caption = 'Cadastro DSGS'
                ExplicitLeft = 4
                ExplicitTop = 27
                ExplicitWidth = 775
                ExplicitHeight = 431
                inherited ScrollBox3: TScrollBox
                  inherited GroupBox1: TGroupBox
                    Height = 177
                    Caption = ''
                    ExplicitHeight = 177
                    object Label6: TLabel
                      Left = 61
                      Top = 21
                      Width = 56
                      Height = 13
                      Caption = 'Cod. DSGS:'
                      FocusControl = DBEdit1
                    end
                    object Label8: TLabel
                      Left = 44
                      Top = 46
                      Width = 73
                      Height = 13
                      Caption = 'Departamento:'
                      FocusControl = DBEdit3
                    end
                    object Label9: TLabel
                      Left = 84
                      Top = 72
                      Width = 33
                      Height = 13
                      Caption = 'Se'#231#227'o:'
                      FocusControl = DBEdit4
                    end
                    object Label10: TLabel
                      Left = 84
                      Top = 98
                      Width = 33
                      Height = 13
                      Caption = 'Grupo:'
                      FocusControl = DBEdit5
                    end
                    object Label11: TLabel
                      Left = 66
                      Top = 124
                      Width = 51
                      Height = 13
                      Caption = 'SubGrupo:'
                      FocusControl = DBEdit6
                    end
                    object Label12: TLabel
                      Left = 6
                      Top = 150
                      Width = 111
                      Height = 13
                      Caption = 'Percentual de Margem:'
                      FocusControl = DBEdit7
                    end
                    object DBEdit1: TDBEdit
                      Left = 120
                      Top = 18
                      Width = 82
                      Height = 21
                      Hint = 'C'#243'digo do Dsgs'
                      CharCase = ecUpperCase
                      DataField = 'COD_DSGS'
                      DataSource = dtmProdutos.dsDSGS
                      TabOrder = 0
                    end
                    object DBEdit3: TDBEdit
                      Left = 120
                      Top = 43
                      Width = 199
                      Height = 21
                      Hint = 'Nome do departamento'
                      CharCase = ecUpperCase
                      DataField = 'N_DEPAR'
                      DataSource = dtmProdutos.dsDSGS
                      TabOrder = 1
                    end
                    object DBEdit4: TDBEdit
                      Left = 120
                      Top = 69
                      Width = 264
                      Height = 21
                      Hint = 'Nome da Se'#231#227'o do produto'
                      CharCase = ecUpperCase
                      DataField = 'N_SECAO'
                      DataSource = dtmProdutos.dsDSGS
                      TabOrder = 2
                    end
                    object DBEdit5: TDBEdit
                      Left = 120
                      Top = 95
                      Width = 264
                      Height = 21
                      Hint = 'Nome do grupo do produto'
                      CharCase = ecUpperCase
                      DataField = 'N_GRUPO'
                      DataSource = dtmProdutos.dsDSGS
                      TabOrder = 3
                    end
                    object DBEdit6: TDBEdit
                      Left = 120
                      Top = 121
                      Width = 264
                      Height = 21
                      Hint = 'Nome do subgrupo do produto'
                      CharCase = ecUpperCase
                      DataField = 'S_GRUPO'
                      DataSource = dtmProdutos.dsDSGS
                      TabOrder = 4
                    end
                    object DBEdit7: TDBEdit
                      Left = 120
                      Top = 147
                      Width = 264
                      Height = 21
                      Hint = 'Percentual de Margem para este DSGS'
                      CharCase = ecUpperCase
                      DataField = 'P_MARGEM'
                      DataSource = dtmProdutos.dsDSGS
                      TabOrder = 5
                    end
                  end
                end
              end
            end
            inherited Panel3: TPanel
              inherited BitBtn4: TBitBtn
                Hint = 'Salvar Registro - [PRO039]'
              end
              inherited BitBtn5: TBitBtn
                Hint = 'Cancelar Registro - [PRO040]'
              end
              inherited BitBtn6: TBitBtn
                OnExit = BitBtn6Exit
              end
            end
          end
        end
        inherited TabSheet2: TTabSheet
          OnShow = TabSheet2Show
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 783
          ExplicitHeight = 510
          inherited GroupBox3: TGroupBox
            inherited BitBtn1: TBitBtn
              Hint = 'Clique para pesquisar - [PRO032]'
            end
            inherited BitBtn3: TBitBtn
              Hint = 'Novo cadastro - [PRO033]'
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
              DataSource = dtmProdutos.dsDSGS
              OnKeyDown = DBGrid1KeyDown
              Columns = <
                item
                  Expanded = False
                  FieldName = 'COD_DSGS'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'COD_EMPRESA'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'N_DEPAR'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'N_SECAO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'N_GRUPO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'S_GRUPO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'P_MARGEM'
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
                Hint = 'Editar Registro - [PRO034]'
              end
              inherited SpeedButton2: TSpeedButton
                Hint = 'Apagar Registro - [PRO036]'
                OnClick = SpeedButton2Click
              end
              inherited SpeedButton4: TSpeedButton
                OnClick = SpeedButton25Click
              end
              inherited SpeedButton5: TSpeedButton
                Hint = 'Recuperar registro - [PRO037]'
                OnClick = SpeedButton5Click
              end
              inherited SpeedButton25: TSpeedButton
                Hint = 'Ver registros da lixeira - [PRO038]'
                OnClick = SpeedButton25Click
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
