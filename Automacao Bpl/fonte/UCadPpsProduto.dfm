inherited FrmCadPpsProduto: TFrmCadPpsProduto
  Caption = 'C'#243'digos PPS de Produtos'
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
                    object Label6: TLabel
                      Left = 10
                      Top = 24
                      Width = 72
                      Height = 13
                      Caption = 'C'#243'digo PPS:'
                      FocusControl = DBEdit1
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label7: TLabel
                      Left = 34
                      Top = 45
                      Width = 48
                      Height = 13
                      Caption = 'Fornec.:'
                      FocusControl = DBEdit2
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label8: TLabel
                      Left = 29
                      Top = 67
                      Width = 53
                      Height = 13
                      Caption = 'Mark Up:'
                      FocusControl = DBEdit3
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object DBEdit1: TDBEdit
                      Left = 85
                      Top = 16
                      Width = 29
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'COD_PPS'
                      DataSource = DtmCadBasicos.dsPPSProdutos
                      TabOrder = 0
                    end
                    object DBEdit2: TDBEdit
                      Left = 85
                      Top = 40
                      Width = 64
                      Height = 21
                      DataField = 'CODIGO_F'
                      DataSource = DtmCadBasicos.dsPPSProdutos
                      TabOrder = 1
                    end
                    object DBLookupComboBox1: TDBLookupComboBox
                      Left = 152
                      Top = 40
                      Width = 287
                      Height = 21
                      DataField = 'CODIGO_F'
                      DataSource = DtmCadBasicos.dsPPSProdutos
                      KeyField = 'CODIGO_F'
                      ListField = 'NOME'
                      ListSource = DtmCadBasicos.dsFornecedor
                      TabOrder = 2
                    end
                    object DBEdit3: TDBEdit
                      Left = 85
                      Top = 62
                      Width = 64
                      Height = 21
                      DataField = 'MARKUP_PPS'
                      DataSource = DtmCadBasicos.dsPPSProdutos
                      TabOrder = 3
                    end
                  end
                end
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
          end
          inherited Panel1: TPanel
            inherited DBGrid1: TDBGrid
              OnKeyDown = DBGrid1KeyDown
            end
            inherited Panel2: TPanel
              inherited SpeedButton1: TSpeedButton
                Hint = 'Editar Registro - [BAS023]'
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
