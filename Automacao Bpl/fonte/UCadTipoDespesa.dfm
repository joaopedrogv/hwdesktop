inherited frmCadTipoDespesa: TfrmCadTipoDespesa
  Caption = 'Tipo de Despesa'
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
                    Height = 129
                    Caption = ''
                    ExplicitHeight = 129
                    object Label_Codigo: TLabel
                      Left = 57
                      Top = 34
                      Width = 36
                      Height = 13
                      Caption = 'C'#243'digo:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                    end
                    object Label9: TLabel
                      Left = 42
                      Top = 67
                      Width = 51
                      Height = 13
                      Caption = 'Descri'#231#227'o:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                    end
                    object Label7: TLabel
                      Left = 48
                      Top = 94
                      Width = 45
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'N. Conta:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                    end
                    object DBEdit_Descricao: TDBEdit
                      Left = 99
                      Top = 61
                      Width = 398
                      Height = 21
                      Hint = 'Descri'#231#227'o do tipo de despesa'
                      CharCase = ecUpperCase
                      DataField = 'DESCRICAO'
                      DataSource = DtmCadBasicos.dsTipoDespesas
                      MaxLength = 49
                      TabOrder = 1
                    end
                    object DBEdit_Codigo: TDBEdit
                      Left = 99
                      Top = 32
                      Width = 54
                      Height = 21
                      Hint = 'C'#243'digo do tipo de despesa'
                      CharCase = ecUpperCase
                      DataField = 'COD_TP_DESPESA'
                      DataSource = DtmCadBasicos.dsTipoDespesas
                      Enabled = False
                      MaxLength = 9
                      TabOrder = 0
                    end
                    object DBEdit_NumPlano: TDBEdit
                      Left = 99
                      Top = 90
                      Width = 54
                      Height = 21
                      Hint = 'N'#250'mero Plano de Contas'
                      CharCase = ecUpperCase
                      DataField = 'N_CONTA_PLC'
                      DataSource = DtmCadBasicos.dsTipoDespesas
                      TabOrder = 2
                      OnKeyDown = DBEdit_NumPlanoKeyDown
                    end
                    object DBLookupComboBox_NumPlano: TDBLookupComboBox
                      Left = 155
                      Top = 90
                      Width = 342
                      Height = 21
                      Hint = 'N'#250'mero Plano de Contas'
                      DataField = 'N_CONTA_PLC'
                      DataSource = DtmCadBasicos.dsTipoDespesas
                      KeyField = 'N_CONTA_PLC'
                      ListField = 'DESC_PLC'
                      ListSource = DtmCadBasicos.dsPContas
                      TabOrder = 3
                    end
                  end
                end
              end
            end
            inherited Panel3: TPanel
              inherited BitBtn4: TBitBtn
                Hint = 'Confirmar Registro - [BAS144]'
              end
              inherited BitBtn5: TBitBtn
                Hint = 'Cancelar Registro - [BAS151]'
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
              Hint = 'Clique para pesquisar - [BAS143]'
            end
            inherited BitBtn3: TBitBtn
              Hint = 'Novo cadastro - [BAS144]'
            end
          end
          inherited Panel1: TPanel
            inherited Splitter1: TSplitter
              ExplicitHeight = 365
            end
            inherited DBGrid1: TDBGrid
              DataSource = DtmCadBasicos.dsTipoDespesas
              OnKeyDown = DBGrid1KeyDown
              Columns = <
                item
                  Expanded = False
                  FieldName = 'COD_TP_DESPESA'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DESCRICAO'
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
                Hint = 'Editar Registro - [BAS145]'
              end
              inherited SpeedButton2: TSpeedButton
                Hint = 'Apagar Registro - [BAS147]'
                OnClick = SpeedButton2Click
              end
              inherited SpeedButton5: TSpeedButton
                Hint = 'Recuperar registro - [BAS148]'
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
                Hint = 'Ver registros da lixeira - [BAS149]'
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
