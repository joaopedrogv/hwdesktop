inherited frmCadKitsOpcionais: TfrmCadKitsOpcionais
  Caption = 'Kit'#39's de Opcionais'
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
                    Height = 337
                    Caption = ''
                    ExplicitHeight = 337
                    object Label_Codigo: TLabel
                      Left = 27
                      Top = 32
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
                      Left = 9
                      Top = 56
                      Width = 62
                      Height = 13
                      Caption = 'Descri'#231#227'o:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object DBEdit_Codigo: TDBEdit
                      Left = 77
                      Top = 29
                      Width = 54
                      Height = 21
                      Hint = 'C'#243'digo da cidade'
                      DataField = 'COD_CIDADE'
                      DataSource = DtmCadBasicos.dsCidades
                      Enabled = False
                      TabOrder = 0
                    end
                    object DBEdit_Descricao: TDBEdit
                      Left = 77
                      Top = 54
                      Width = 336
                      Height = 21
                      Hint = 'Nome da Cidade'
                      CharCase = ecUpperCase
                      DataField = 'NOME_CIDADE'
                      DataSource = DtmCadBasicos.dsCidades
                      TabOrder = 1
                    end
                    object BitBtn_Adicionar: TBitBtn
                      Left = 77
                      Top = 79
                      Width = 124
                      Height = 25
                      Hint = 'Novo cadastro'
                      Caption = '&Adicionar opcional'
                      ParentShowHint = False
                      ShowHint = True
                      TabOrder = 2
                      OnClick = BitBtn_AdicionarClick
                      Glyph.Data = {
                        9E010000424D9E010000000000009E0000002800000010000000100000000100
                        08000000000000010000120B0000120B00001A0000001A00000000000000FFFF
                        FF00FF00FF00035D050005950E0005930D0005920D00058C0D00058B0D000695
                        0F0006920E000A9A15000C9C18000D9E1C00119F210017A62B0018A92F0021B8
                        3C0025BC42002AC64D0030CF570030CE57003BD968003BDA690048EB7F005BF7
                        9100020202020202020202020202020202020202020202020203030202020202
                        0202020202020202031907030202020202020202020202020319040302020202
                        0202020202020202031906030202020202020202020202020319090302020202
                        020202020303030303190C03030303030202020319171413110F0E0D0B0A0508
                        0302020319191919191910191919191903020202030303030319120303030303
                        0202020202020202031915030202020202020202020202020319160302020202
                        0202020202020202031918030202020202020202020202020319190302020202
                        0202020202020202020303020202020202020202020202020202020202020202
                        0202}
                    end
                    object DBMemo_Opcionais: TDBMemo
                      Left = 77
                      Top = 110
                      Width = 336
                      Height = 203
                      Hint = 'Opcionais do ve'#237'culo'
                      DataField = 'OPCIONAIS'
                      DataSource = DtmVeiculosCCIA.dsVeiculos
                      TabOrder = 3
                    end
                  end
                end
              end
            end
            inherited Panel3: TPanel
              inherited BitBtn4: TBitBtn
                Hint = 'Salvar Registro'
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
              Hint = 'Clique para pesquisar - [BAS194]'
            end
            inherited BitBtn3: TBitBtn
              Hint = 'Novo cadastro - [BAS195]'
            end
          end
          inherited Panel1: TPanel
            inherited DBGrid1: TDBGrid
              OnKeyDown = DBGrid1KeyDown
            end
            inherited Panel2: TPanel
              inherited SpeedButton1: TSpeedButton
                Hint = 'Editar Registro - [BAS196]'
              end
              inherited SpeedButton2: TSpeedButton
                Hint = 'Apagar Registro - [BAS197]'
                OnClick = SpeedButton2Click
              end
              inherited SpeedButton5: TSpeedButton
                Hint = 'Recuperar registro - [BAS199]'
                OnClick = SpeedButton5Click
              end
              inherited SpeedButton25: TSpeedButton
                Hint = 'Ver registros da lixeira - [BAS198]'
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
  inherited PopupMenu1: TPopupMenu
    Left = 12
    Top = 57
  end
  inherited PopupMenu2: TPopupMenu
    Left = 710
    Top = 14
  end
  inherited Timer1: TTimer
    Left = 670
    Top = 14
  end
  inherited ApplicationEventsPadrao: TApplicationEvents
    Left = 638
    Top = 14
  end
end
