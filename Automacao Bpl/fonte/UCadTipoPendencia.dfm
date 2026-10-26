inherited frmCadTipoPendencia: TfrmCadTipoPendencia
  Caption = 'Tipo de Pend'#234'ncia'
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
                    Height = 113
                    Caption = ''
                    ExplicitHeight = 113
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
                    object DBEdit_Descricao: TDBEdit
                      Left = 99
                      Top = 61
                      Width = 326
                      Height = 21
                      Hint = 'Descri'#231#227'o do tipo de p'#234'ndencia'
                      CharCase = ecUpperCase
                      DataField = 'DESCRICAO'
                      DataSource = DtmCadBasicos.dsTipoPendencias
                      MaxLength = 29
                      TabOrder = 1
                    end
                    object DBEdit_Codigo: TDBEdit
                      Left = 99
                      Top = 31
                      Width = 54
                      Height = 21
                      Hint = 'C'#243'digo do tipo de p'#234'ndencia'
                      DataField = 'COD_TP_PENDENCIA'
                      DataSource = DtmCadBasicos.dsTipoPendencias
                      Enabled = False
                      MaxLength = 9
                      TabOrder = 0
                    end
                  end
                end
              end
            end
            inherited Panel3: TPanel
              inherited BitBtn4: TBitBtn
                Hint = 'Confirmar Registro - [BAS126]'
              end
              inherited BitBtn5: TBitBtn
                Hint = 'Cancelar Registro - [BAS133]'
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
              Hint = 'Clique para pesquisar - [BAS125]'
            end
            inherited BitBtn3: TBitBtn
              Hint = 'Novo cadastro - [BAS126]'
            end
          end
          inherited Panel1: TPanel
            inherited Splitter1: TSplitter
              ExplicitHeight = 365
            end
            inherited DBGrid1: TDBGrid
              DataSource = DtmCadBasicos.dsTipoPendencias
              OnKeyDown = DBGrid1KeyDown
              Columns = <
                item
                  Expanded = False
                  FieldName = 'COD_TP_PENDENCIA'
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
                Hint = 'Editar Registro - [BAS127]'
              end
              inherited SpeedButton2: TSpeedButton
                Hint = 'Apagar Registro - [BAS129]'
                OnClick = SpeedButton2Click
              end
              inherited SpeedButton5: TSpeedButton
                Hint = 'Recuperar registro - [BAS130]'
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
                Hint = 'Ver registros da lixeira - [BAS131]'
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
  inherited PopupMenu1: TPopupMenu
    Left = 172
    Top = 9
  end
  inherited PopupMenu2: TPopupMenu
    Left = 270
    Top = 11
  end
  inherited Timer1: TTimer
    Left = 238
    Top = 11
  end
  inherited ApplicationEventsPadrao: TApplicationEvents
    Left = 206
    Top = 11
  end
end
