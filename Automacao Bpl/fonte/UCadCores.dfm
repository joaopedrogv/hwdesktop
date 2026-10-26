inherited frmCadCores: TfrmCadCores
  Caption = 'Cores'
  ClientWidth = 795
  ExplicitWidth = 803
  ExplicitHeight = 598
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelFundo: TPanel
    Width = 795
    ExplicitWidth = 795
    inherited PanelLeft: TPanel
      Width = 790
      ExplicitWidth = 790
      inherited PageControl1: TPageControl
        Width = 788
        ExplicitWidth = 788
        inherited TabSheet1: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 780
          ExplicitHeight = 510
          inherited ScrollBox1: TScrollBox
            Width = 780
            ExplicitWidth = 780
            inherited PageControl3: TPageControl
              Width = 780
              ExplicitWidth = 780
              inherited TabSheet3: TTabSheet
                ExplicitLeft = 4
                ExplicitTop = 27
                ExplicitWidth = 772
                ExplicitHeight = 431
                inherited ScrollBox3: TScrollBox
                  Width = 772
                  ExplicitWidth = 772
                  inherited GroupBox1: TGroupBox
                    Width = 768
                    Height = 161
                    Caption = ''
                    ExplicitLeft = 5
                    ExplicitWidth = 768
                    ExplicitHeight = 161
                    object Label_Codigo: TLabel
                      Left = 97
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
                    object Label8: TLabel
                      Left = 58
                      Top = 115
                      Width = 75
                      Height = 13
                      Caption = 'Tipo de Pintura:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                    end
                    object Label7: TLabel
                      Left = 33
                      Top = 61
                      Width = 100
                      Height = 13
                      Caption = 'C'#243'digo DENATRAM:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                    end
                    object Label9: TLabel
                      Left = 82
                      Top = 88
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
                    object DBEdit_Codigo: TDBEdit
                      Left = 139
                      Top = 31
                      Width = 54
                      Height = 21
                      Hint = 'C'#243'digo da cor'
                      CharCase = ecUpperCase
                      DataField = 'COD_COR'
                      DataSource = DtmCadBasicos.dsCores
                      TabOrder = 0
                    end
                    object DBEdit_CodigoDENATRAM: TDBEdit
                      Left = 139
                      Top = 58
                      Width = 54
                      Height = 21
                      Hint = 'C'#243'digo do DENATRAM'
                      CharCase = ecUpperCase
                      DataField = 'CODCORDENATRAM'
                      DataSource = DtmCadBasicos.dsCores
                      TabOrder = 1
                    end
                    object DBComboBox_TipoPintura: TDBComboBox
                      Left = 139
                      Top = 112
                      Width = 124
                      Height = 19
                      Hint = 'Tipo de Pintura'
                      Style = csOwnerDrawFixed
                      CharCase = ecUpperCase
                      DataField = 'TIPO_PINTURA'
                      DataSource = DtmCadBasicos.dsCores
                      ItemHeight = 13
                      Items.Strings = (
                        'M'#201'TALICA'
                        'S'#211'LIDA'
                        'PEROL'
                        'FOSCA')
                      TabOrder = 3
                      OnDropDown = DBComboBox_TipoPinturaDropDown
                    end
                    object DBEdit_Descricao: TDBEdit
                      Left = 139
                      Top = 85
                      Width = 244
                      Height = 21
                      Hint = 'Descri'#231#227'o da cor'
                      CharCase = ecUpperCase
                      DataField = 'DESCRICAO_COR'
                      DataSource = DtmCadBasicos.dsCores
                      TabOrder = 2
                    end
                  end
                end
              end
            end
            inherited Panel3: TPanel
              Width = 780
              ExplicitWidth = 780
              inherited BitBtn4: TBitBtn
                Hint = 'Salvar Registro - [BAS114]'
              end
              inherited BitBtn5: TBitBtn
                Hint = 'Cancelar Registro - [BAS115]'
              end
            end
          end
        end
        inherited TabSheet2: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 780
          ExplicitHeight = 510
          inherited GroupBox3: TGroupBox
            Width = 780
            ExplicitWidth = 780
            inherited imgInformation: TImage
              Left = 754
              ExplicitLeft = 754
            end
            inherited BitBtn1: TBitBtn
              Hint = 'Clique para pesquisar - [BAS107]'
            end
            inherited BitBtn3: TBitBtn
              Hint = 'Novo cadastro - [BAS108]'
            end
          end
          inherited Panel1: TPanel
            Width = 780
            ExplicitWidth = 780
            inherited Splitter1: TSplitter
              ExplicitHeight = 365
            end
            inherited DBGrid1: TDBGrid
              Width = 487
              OnKeyDown = DBGrid1KeyDown
              Columns = <
                item
                  Expanded = False
                  FieldName = 'COD_COR'
                  Title.Caption = 'C'#243'digo'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DESCRICAO_COR'
                  Title.Caption = 'Descri'#231#227'o'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'TIPO_PINTURA'
                  Title.Caption = 'Tipo de Pintura'
                  Width = 76
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ATIVO'
                  Title.Caption = 'Ativo'
                  Visible = False
                end
                item
                  Expanded = False
                  FieldName = 'CODCORDENATRAM'
                  Title.Caption = 'C'#243'digo do DENATRAM'
                  Width = 156
                  Visible = True
                end>
            end
            inherited Panel2: TPanel
              Width = 776
              ExplicitWidth = 776
              inherited SpeedButton1: TSpeedButton
                Hint = 'Editar Registro - [BAS109]'
              end
              inherited SpeedButton2: TSpeedButton
                Hint = 'Apagar Registro - [BAS111]'
                OnClick = SpeedButton2Click
              end
              inherited SpeedButton5: TSpeedButton
                Hint = 'Recuperar registro - [BAS112]'
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
                Hint = 'Ver registros da lixeira - [BAS113]'
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
          ExplicitWidth = 780
          ExplicitHeight = 510
        end
      end
    end
    inherited PanelFlash: TPanel
      Width = 47
      ExplicitWidth = 47
      inherited bMarketingHW: TBitBtn
        Width = 45
        ExplicitWidth = 45
      end
    end
  end
  inherited StatusBar1: TStatusBar
    Width = 795
    ExplicitWidth = 795
  end
  inherited pnStatusProcessamento: TPanel
    inherited lbTextoProcessamento: TLabel
      Width = 477
      Height = 21
    end
  end
  inherited PopupMenu1: TPopupMenu
    Left = 652
    Top = 193
  end
end
