inherited FrmCSTMudGeral: TFrmCSTMudGeral
  Left = 245
  Top = -1
  Caption = 'Cadastro de CST Interestaduais'
  ExplicitWidth = 806
  ExplicitHeight = 598
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelFundo: TPanel
    inherited PanelLeft: TPanel
      inherited PageControl1: TPageControl
        ActivePage = TabSheet1
        inherited TabSheet1: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 783
          ExplicitHeight = 510
          inherited ScrollBox1: TScrollBox
            inherited PageControl3: TPageControl
              inherited TabSheet3: TTabSheet
                Caption = 'Cadastro de CST Interestaduais'
                ExplicitLeft = 4
                ExplicitTop = 27
                ExplicitWidth = 775
                ExplicitHeight = 431
                inherited ScrollBox3: TScrollBox
                  inherited GroupBox1: TGroupBox
                    Height = 193
                    Caption = ''
                    ExplicitHeight = 193
                    object Label6: TLabel
                      Left = 61
                      Top = 35
                      Width = 38
                      Height = 13
                      Caption = 'Origem:'
                    end
                    object Label7: TLabel
                      Left = 16
                      Top = 103
                      Width = 79
                      Height = 13
                      Caption = 'CST do produto:'
                      FocusControl = DBEdit3
                    end
                    object Label8: TLabel
                      Left = 195
                      Top = 102
                      Width = 66
                      Height = 13
                      Caption = 'CST a utilizar:'
                      FocusControl = DBEdit4
                    end
                    object Label9: TLabel
                      Left = 197
                      Top = 129
                      Width = 64
                      Height = 13
                      Caption = 'Aliq a utilizar:'
                      FocusControl = DBEdit6
                    end
                    object Label10: TLabel
                      Left = 18
                      Top = 129
                      Width = 77
                      Height = 13
                      Caption = 'Aliq do produto:'
                      FocusControl = DBEdit5
                    end
                    object Label11: TLabel
                      Left = 59
                      Top = 64
                      Width = 40
                      Height = 13
                      Caption = 'Destino:'
                    end
                    object Label12: TLabel
                      Left = 8
                      Top = 156
                      Width = 87
                      Height = 13
                      Caption = 'CFOP do produto:'
                      FocusControl = DBEdit7
                    end
                    object Label13: TLabel
                      Left = 187
                      Top = 156
                      Width = 74
                      Height = 13
                      Caption = 'CFOP a utilizar:'
                      FocusControl = DBEdit8
                    end
                    object Label14: TLabel
                      Left = 101
                      Top = 12
                      Width = 241
                      Height = 13
                      Caption = 'Selecione os estados de Origem e Destino'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object DBLookupComboBox1: TDBLookupComboBox
                      Left = 101
                      Top = 31
                      Width = 224
                      Height = 21
                      Hint = 'Estado de Origem'
                      DataField = 'UF_ORIGEM'
                      DataSource = DtmCadBasicos.dsCstMudGeral
                      KeyField = 'CODIGO_UF'
                      ListField = 'NOME_UF'
                      ListSource = DtmCadBasicos.dsCfopUFOrigem
                      TabOrder = 0
                      OnExit = DBLookupComboBox1Exit
                    end
                    object DBEdit3: TDBEdit
                      Left = 100
                      Top = 100
                      Width = 64
                      Height = 21
                      Hint = 'CST Interno'
                      DataField = 'CST_INTERNO'
                      DataSource = DtmCadBasicos.dsCstMudGeral
                      TabOrder = 2
                      OnExit = DBEdit3Exit
                    end
                    object DBEdit4: TDBEdit
                      Left = 261
                      Top = 99
                      Width = 64
                      Height = 21
                      Hint = 'CST Externo'
                      DataField = 'CST_EXTERNO'
                      DataSource = DtmCadBasicos.dsCstMudGeral
                      TabOrder = 3
                      OnExit = DBEdit4Exit
                    end
                    object DBEdit6: TDBEdit
                      Left = 261
                      Top = 126
                      Width = 64
                      Height = 21
                      Hint = 'Al'#237'quota Externa de ICMS'
                      DataField = 'ALIQ_EXTERNA'
                      DataSource = DtmCadBasicos.dsCstMudGeral
                      TabOrder = 5
                    end
                    object DBEdit5: TDBEdit
                      Left = 100
                      Top = 126
                      Width = 64
                      Height = 21
                      Hint = 'Al'#237'quota Interna de ICMS'
                      DataField = 'ALIQ_INTERNA'
                      DataSource = DtmCadBasicos.dsCstMudGeral
                      TabOrder = 4
                    end
                    object DBLookupComboBox2: TDBLookupComboBox
                      Left = 101
                      Top = 60
                      Width = 224
                      Height = 21
                      Hint = 'Estado de Destino'
                      DataField = 'UF_DESTINO'
                      DataSource = DtmCadBasicos.dsCstMudGeral
                      KeyField = 'CODIGO_UF'
                      ListField = 'NOME_UF'
                      ListSource = DtmCadBasicos.dsCfopUFDestino
                      TabOrder = 1
                      OnExit = DBLookupComboBox2Exit
                    end
                    object DBEdit8: TDBEdit
                      Left = 261
                      Top = 153
                      Width = 64
                      Height = 21
                      Hint = '[F3: Consultar]  - CFOP Externo'
                      DataField = 'CFOP_EXTERNO'
                      DataSource = DtmCadBasicos.dsCstMudGeral
                      TabOrder = 7
                      OnKeyDown = DBEdit8KeyDown
                    end
                    object DBEdit7: TDBEdit
                      Left = 100
                      Top = 153
                      Width = 64
                      Height = 21
                      Hint = '[F3: Consultar]  - CFOP Interno'
                      DataField = 'CFOP_INTERNO'
                      DataSource = DtmCadBasicos.dsCstMudGeral
                      TabOrder = 6
                      OnKeyDown = DBEdit7KeyDown
                    end
                  end
                end
              end
            end
            inherited Panel3: TPanel
              inherited BitBtn4: TBitBtn
                Hint = 'Confirmar Registro - [BAS025]'
              end
              inherited BitBtn5: TBitBtn
                Hint = 'Cancelar Registro - [BAS026]'
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
            inherited BitBtn3: TBitBtn
              Hint = 'Novo cadastro - [BAS022]'
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
              ExplicitHeight = 402
            end
            inherited DBGrid1: TDBGrid
              DataSource = DtmCadBasicos.dsCstMudGeral
              OnKeyDown = DBGrid1KeyDown
              Columns = <
                item
                  Expanded = False
                  FieldName = 'UF_ORIGEM'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'UF_DESTINO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CST_INTERNO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CST_EXTERNO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ALIQ_INTERNA'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ALIQ_EXTERNA'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CFOP_INTERNO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CFOP_EXTERNO'
                  Visible = True
                end>
            end
            inherited Panel2: TPanel
              inherited SpeedButton1: TSpeedButton
                Hint = 'Editar Registro - [BAS023]'
              end
              inherited SpeedButton2: TSpeedButton
                Hint = 'Apagar Registro - [BAS024]'
                OnClick = SpeedButton2Click
              end
              inherited SpeedButton3: TSpeedButton
                Visible = False
              end
              inherited SpeedButton4: TSpeedButton
                Enabled = False
                Visible = False
                OnClick = SpeedButton25Click
              end
              inherited SpeedButton5: TSpeedButton
                Visible = False
              end
              inherited SpeedButton6: TSpeedButton
                Top = 6
                Enabled = False
                Visible = False
                ExplicitTop = 6
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
