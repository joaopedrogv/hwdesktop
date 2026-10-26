inherited frmCadPerfilHorasTrabalho: TfrmCadPerfilHorasTrabalho
  Caption = 'Perfil Hor'#225'rio de Trabalho'
  ExplicitWidth = 814
  ExplicitHeight = 603
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
              ActivePage = tsCadastro
              inherited TabSheet3: TTabSheet
                ExplicitLeft = 4
                ExplicitTop = 27
                ExplicitWidth = 775
                ExplicitHeight = 431
              end
              object tsCadastro: TTabSheet
                Caption = 'tsCadastro'
                ImageIndex = 1
                object ScrollBox4: TScrollBox
                  Left = 0
                  Top = 0
                  Width = 775
                  Height = 431
                  Align = alClient
                  TabOrder = 0
                  object GroupBox4: TGroupBox
                    Left = 0
                    Top = 0
                    Width = 771
                    Height = 427
                    Align = alTop
                    Caption = 'Cadastro Perfil Hor'#225'rio de Trabalho'
                    TabOrder = 0
                    object Panel4: TPanel
                      Left = 2
                      Top = 15
                      Width = 767
                      Height = 74
                      Align = alTop
                      BevelOuter = bvNone
                      TabOrder = 0
                      object Label6: TLabel
                        Left = 66
                        Top = 13
                        Width = 37
                        Height = 13
                        Caption = 'C'#243'digo:'
                        FocusControl = DBEdit1
                      end
                      object Label7: TLabel
                        Left = 53
                        Top = 44
                        Width = 50
                        Height = 13
                        Caption = 'Descri'#231#227'o:'
                        FocusControl = DBEdit2
                      end
                      object DBEdit1: TDBEdit
                        Left = 111
                        Top = 10
                        Width = 67
                        Height = 21
                        DataField = 'CODIGO'
                        DataSource = DtmCadBasicos.dsPerfilHorasTrabalho
                        Enabled = False
                        TabOrder = 0
                      end
                      object DBEdit2: TDBEdit
                        Left = 111
                        Top = 41
                        Width = 394
                        Height = 21
                        CharCase = ecUpperCase
                        DataField = 'DESCRICAO'
                        DataSource = DtmCadBasicos.dsPerfilHorasTrabalho
                        TabOrder = 1
                      end
                    end
                    object GroupBox5: TGroupBox
                      Left = 2
                      Top = 89
                      Width = 767
                      Height = 337
                      Align = alTop
                      Caption = 'Horas de Trabalho'
                      TabOrder = 1
                      object pnSegunda: TPanel
                        Left = 2
                        Top = 15
                        Width = 763
                        Height = 31
                        Align = alTop
                        TabOrder = 0
                        object Label8: TLabel
                          Left = 240
                          Top = 9
                          Width = 16
                          Height = 13
                          Caption = 'at'#233
                        end
                        object spSegunda: TSpeedButton
                          Left = 309
                          Top = 4
                          Width = 23
                          Height = 21
                          Glyph.Data = {
                            36050000424D3605000000000000360400002800000010000000100000000100
                            08000000000000010000EE0E0000EE0E000000010000000100006B6B6B008484
                            8400C6C6C600DEDEDE00FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00040404040404
                            0404040404040404040404040404040404040404040404040404040404040404
                            0404040404040404040404010000000000000104040404040404040002020202
                            0202000004040404040404000202020202020001000404040404040100020202
                            0202000101000404040404040003030303030300010100040404040404000303
                            0303030300010100040404040404000303030303030001010004040404040400
                            0303030303030001000404040404040400030303030303000004040404040404
                            0400030303030303000404040404040404040100000000010104040404040404
                            0404040404040404040404040404040404040404040404040404}
                          OnClick = spSegundaClick
                        end
                        object ckSegunda: TCheckBox
                          Left = 22
                          Top = 6
                          Width = 91
                          Height = 17
                          Caption = 'Segunda-Feira'
                          TabOrder = 0
                          OnClick = ckSegundaClick
                        end
                        object mkSegundaHoraIni: TMaskEdit
                          Left = 193
                          Top = 4
                          Width = 41
                          Height = 21
                          EditMask = '!90:00;1;_'
                          MaxLength = 5
                          TabOrder = 1
                          Text = '  :  '
                          OnEnter = mkSegundaHoraIniEnter
                          OnKeyDown = mkSegundaHoraIniKeyDown
                        end
                        object mkSegundaHoraFim: TMaskEdit
                          Left = 262
                          Top = 4
                          Width = 41
                          Height = 21
                          EditMask = '!90:00;1;_'
                          MaxLength = 5
                          TabOrder = 2
                          Text = '  :  '
                          OnEnter = mkSegundaHoraIniEnter
                          OnKeyDown = mkSegundaHoraIniKeyDown
                        end
                      end
                      object pnTerca: TPanel
                        Left = 2
                        Top = 46
                        Width = 763
                        Height = 31
                        Align = alTop
                        TabOrder = 1
                        object Label9: TLabel
                          Left = 240
                          Top = 9
                          Width = 16
                          Height = 13
                          Caption = 'at'#233
                        end
                        object spTerca: TSpeedButton
                          Left = 309
                          Top = 4
                          Width = 23
                          Height = 21
                          Glyph.Data = {
                            36050000424D3605000000000000360400002800000010000000100000000100
                            08000000000000010000EE0E0000EE0E000000010000000100006B6B6B008484
                            8400C6C6C600DEDEDE00FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00040404040404
                            0404040404040404040404040404040404040404040404040404040404040404
                            0404040404040404040404010000000000000104040404040404040002020202
                            0202000004040404040404000202020202020001000404040404040100020202
                            0202000101000404040404040003030303030300010100040404040404000303
                            0303030300010100040404040404000303030303030001010004040404040400
                            0303030303030001000404040404040400030303030303000004040404040404
                            0400030303030303000404040404040404040100000000010104040404040404
                            0404040404040404040404040404040404040404040404040404}
                          OnClick = spTercaClick
                        end
                        object ckTerca: TCheckBox
                          Left = 22
                          Top = 6
                          Width = 91
                          Height = 17
                          Caption = 'Ter'#231'a-Feira'
                          TabOrder = 0
                          OnClick = ckTercaClick
                        end
                        object mkTercaHoraIni: TMaskEdit
                          Left = 193
                          Top = 4
                          Width = 41
                          Height = 21
                          EditMask = '!90:00;1;_'
                          MaxLength = 5
                          TabOrder = 1
                          Text = '  :  '
                          OnEnter = mkSegundaHoraIniEnter
                          OnKeyDown = mkSegundaHoraIniKeyDown
                        end
                        object mkTercaHoraFim: TMaskEdit
                          Left = 262
                          Top = 4
                          Width = 41
                          Height = 21
                          EditMask = '!90:00;1;_'
                          MaxLength = 5
                          TabOrder = 2
                          Text = '  :  '
                          OnEnter = mkSegundaHoraIniEnter
                          OnKeyDown = mkSegundaHoraIniKeyDown
                        end
                      end
                      object pnQuarta: TPanel
                        Left = 2
                        Top = 77
                        Width = 763
                        Height = 31
                        Align = alTop
                        TabOrder = 2
                        object Label10: TLabel
                          Left = 240
                          Top = 9
                          Width = 16
                          Height = 13
                          Caption = 'at'#233
                        end
                        object spQuarta: TSpeedButton
                          Left = 309
                          Top = 4
                          Width = 23
                          Height = 21
                          Glyph.Data = {
                            36050000424D3605000000000000360400002800000010000000100000000100
                            08000000000000010000EE0E0000EE0E000000010000000100006B6B6B008484
                            8400C6C6C600DEDEDE00FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00040404040404
                            0404040404040404040404040404040404040404040404040404040404040404
                            0404040404040404040404010000000000000104040404040404040002020202
                            0202000004040404040404000202020202020001000404040404040100020202
                            0202000101000404040404040003030303030300010100040404040404000303
                            0303030300010100040404040404000303030303030001010004040404040400
                            0303030303030001000404040404040400030303030303000004040404040404
                            0400030303030303000404040404040404040100000000010104040404040404
                            0404040404040404040404040404040404040404040404040404}
                          OnClick = spQuartaClick
                        end
                        object ckQuarta: TCheckBox
                          Left = 22
                          Top = 6
                          Width = 91
                          Height = 17
                          Caption = 'Quarta-Feira'
                          TabOrder = 0
                          OnClick = ckQuartaClick
                        end
                        object mkQuartaHoraIni: TMaskEdit
                          Left = 193
                          Top = 4
                          Width = 41
                          Height = 21
                          EditMask = '!90:00;1;_'
                          MaxLength = 5
                          TabOrder = 1
                          Text = '  :  '
                          OnEnter = mkSegundaHoraIniEnter
                          OnKeyDown = mkSegundaHoraIniKeyDown
                        end
                        object mkQuartaHoraFim: TMaskEdit
                          Left = 262
                          Top = 4
                          Width = 41
                          Height = 21
                          EditMask = '!90:00;1;_'
                          MaxLength = 5
                          TabOrder = 2
                          Text = '  :  '
                          OnEnter = mkSegundaHoraIniEnter
                          OnKeyDown = mkSegundaHoraIniKeyDown
                        end
                      end
                      object pnQuinta: TPanel
                        Left = 2
                        Top = 108
                        Width = 763
                        Height = 31
                        Align = alTop
                        TabOrder = 3
                        object Label11: TLabel
                          Left = 240
                          Top = 9
                          Width = 16
                          Height = 13
                          Caption = 'at'#233
                        end
                        object spQuinta: TSpeedButton
                          Left = 309
                          Top = 4
                          Width = 23
                          Height = 21
                          Glyph.Data = {
                            36050000424D3605000000000000360400002800000010000000100000000100
                            08000000000000010000EE0E0000EE0E000000010000000100006B6B6B008484
                            8400C6C6C600DEDEDE00FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00040404040404
                            0404040404040404040404040404040404040404040404040404040404040404
                            0404040404040404040404010000000000000104040404040404040002020202
                            0202000004040404040404000202020202020001000404040404040100020202
                            0202000101000404040404040003030303030300010100040404040404000303
                            0303030300010100040404040404000303030303030001010004040404040400
                            0303030303030001000404040404040400030303030303000004040404040404
                            0400030303030303000404040404040404040100000000010104040404040404
                            0404040404040404040404040404040404040404040404040404}
                          OnClick = spQuintaClick
                        end
                        object ckQuinta: TCheckBox
                          Left = 22
                          Top = 6
                          Width = 91
                          Height = 17
                          Caption = 'Quinta-Feira'
                          TabOrder = 0
                          OnClick = ckQuintaClick
                        end
                        object mkQuintaHoraIni: TMaskEdit
                          Left = 193
                          Top = 4
                          Width = 41
                          Height = 21
                          EditMask = '!90:00;1;_'
                          MaxLength = 5
                          TabOrder = 1
                          Text = '  :  '
                          OnEnter = mkSegundaHoraIniEnter
                          OnKeyDown = mkSegundaHoraIniKeyDown
                        end
                        object mkQuintaHoraFim: TMaskEdit
                          Left = 262
                          Top = 4
                          Width = 41
                          Height = 21
                          EditMask = '!90:00;1;_'
                          MaxLength = 5
                          TabOrder = 2
                          Text = '  :  '
                          OnEnter = mkSegundaHoraIniEnter
                          OnKeyDown = mkSegundaHoraIniKeyDown
                        end
                      end
                      object pnSexta: TPanel
                        Left = 2
                        Top = 139
                        Width = 763
                        Height = 31
                        Align = alTop
                        TabOrder = 4
                        object Label12: TLabel
                          Left = 240
                          Top = 9
                          Width = 16
                          Height = 13
                          Caption = 'at'#233
                        end
                        object spSexta: TSpeedButton
                          Left = 309
                          Top = 4
                          Width = 23
                          Height = 21
                          Glyph.Data = {
                            36050000424D3605000000000000360400002800000010000000100000000100
                            08000000000000010000EE0E0000EE0E000000010000000100006B6B6B008484
                            8400C6C6C600DEDEDE00FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00040404040404
                            0404040404040404040404040404040404040404040404040404040404040404
                            0404040404040404040404010000000000000104040404040404040002020202
                            0202000004040404040404000202020202020001000404040404040100020202
                            0202000101000404040404040003030303030300010100040404040404000303
                            0303030300010100040404040404000303030303030001010004040404040400
                            0303030303030001000404040404040400030303030303000004040404040404
                            0400030303030303000404040404040404040100000000010104040404040404
                            0404040404040404040404040404040404040404040404040404}
                          OnClick = spSextaClick
                        end
                        object ckSexta: TCheckBox
                          Left = 22
                          Top = 6
                          Width = 91
                          Height = 17
                          Caption = 'Sexta-Feira'
                          TabOrder = 0
                          OnClick = ckSextaClick
                        end
                        object mkSextaHoraIni: TMaskEdit
                          Left = 193
                          Top = 4
                          Width = 41
                          Height = 21
                          EditMask = '!90:00;1;_'
                          MaxLength = 5
                          TabOrder = 1
                          Text = '  :  '
                          OnEnter = mkSegundaHoraIniEnter
                          OnKeyDown = mkSegundaHoraIniKeyDown
                        end
                        object mkSextaHoraFim: TMaskEdit
                          Left = 262
                          Top = 4
                          Width = 41
                          Height = 21
                          EditMask = '!90:00;1;_'
                          MaxLength = 5
                          TabOrder = 2
                          Text = '  :  '
                          OnEnter = mkSegundaHoraIniEnter
                          OnKeyDown = mkSegundaHoraIniKeyDown
                        end
                      end
                      object pnSabado: TPanel
                        Left = 2
                        Top = 170
                        Width = 763
                        Height = 31
                        Align = alTop
                        TabOrder = 5
                        object Label13: TLabel
                          Left = 240
                          Top = 9
                          Width = 16
                          Height = 13
                          Caption = 'at'#233
                        end
                        object spSabado: TSpeedButton
                          Left = 309
                          Top = 4
                          Width = 23
                          Height = 21
                          Glyph.Data = {
                            36050000424D3605000000000000360400002800000010000000100000000100
                            08000000000000010000EE0E0000EE0E000000010000000100006B6B6B008484
                            8400C6C6C600DEDEDE00FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00040404040404
                            0404040404040404040404040404040404040404040404040404040404040404
                            0404040404040404040404010000000000000104040404040404040002020202
                            0202000004040404040404000202020202020001000404040404040100020202
                            0202000101000404040404040003030303030300010100040404040404000303
                            0303030300010100040404040404000303030303030001010004040404040400
                            0303030303030001000404040404040400030303030303000004040404040404
                            0400030303030303000404040404040404040100000000010104040404040404
                            0404040404040404040404040404040404040404040404040404}
                          OnClick = spSabadoClick
                        end
                        object ckSabado: TCheckBox
                          Left = 22
                          Top = 6
                          Width = 91
                          Height = 17
                          Caption = 'Sabado'
                          TabOrder = 0
                          OnClick = ckSabadoClick
                        end
                        object mkSabadoHoraIni: TMaskEdit
                          Left = 193
                          Top = 4
                          Width = 41
                          Height = 21
                          EditMask = '!90:00;1;_'
                          MaxLength = 5
                          TabOrder = 1
                          Text = '  :  '
                          OnEnter = mkSegundaHoraIniEnter
                          OnKeyDown = mkSegundaHoraIniKeyDown
                        end
                        object mkSabadoHoraFim: TMaskEdit
                          Left = 262
                          Top = 4
                          Width = 41
                          Height = 21
                          EditMask = '!90:00;1;_'
                          MaxLength = 5
                          TabOrder = 2
                          Text = '  :  '
                          OnEnter = mkSegundaHoraIniEnter
                          OnKeyDown = mkSegundaHoraIniKeyDown
                        end
                      end
                      object pnDomingo: TPanel
                        Left = 2
                        Top = 201
                        Width = 763
                        Height = 31
                        Align = alTop
                        TabOrder = 6
                        object Label14: TLabel
                          Left = 240
                          Top = 9
                          Width = 16
                          Height = 13
                          Caption = 'at'#233
                        end
                        object spDomingo: TSpeedButton
                          Left = 309
                          Top = 4
                          Width = 23
                          Height = 21
                          Glyph.Data = {
                            36050000424D3605000000000000360400002800000010000000100000000100
                            08000000000000010000EE0E0000EE0E000000010000000100006B6B6B008484
                            8400C6C6C600DEDEDE00FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00040404040404
                            0404040404040404040404040404040404040404040404040404040404040404
                            0404040404040404040404010000000000000104040404040404040002020202
                            0202000004040404040404000202020202020001000404040404040100020202
                            0202000101000404040404040003030303030300010100040404040404000303
                            0303030300010100040404040404000303030303030001010004040404040400
                            0303030303030001000404040404040400030303030303000004040404040404
                            0400030303030303000404040404040404040100000000010104040404040404
                            0404040404040404040404040404040404040404040404040404}
                          OnClick = spDomingoClick
                        end
                        object ckDomingo: TCheckBox
                          Left = 22
                          Top = 6
                          Width = 91
                          Height = 17
                          Caption = 'Domingo'
                          TabOrder = 0
                          OnClick = ckDomingoClick
                        end
                        object mkDomingoHoraIni: TMaskEdit
                          Left = 193
                          Top = 4
                          Width = 41
                          Height = 21
                          EditMask = '!90:00;1;_'
                          MaxLength = 5
                          TabOrder = 1
                          Text = '  :  '
                          OnEnter = mkSegundaHoraIniEnter
                          OnKeyDown = mkSegundaHoraIniKeyDown
                        end
                        object mkDomingoHoraFim: TMaskEdit
                          Left = 262
                          Top = 4
                          Width = 41
                          Height = 21
                          EditMask = '!90:00;1;_'
                          MaxLength = 5
                          TabOrder = 2
                          Text = '  :  '
                          OnEnter = mkSegundaHoraIniEnter
                          OnKeyDown = mkSegundaHoraIniKeyDown
                        end
                      end
                    end
                  end
                end
              end
            end
            inherited Panel3: TPanel
              inherited BitBtn4: TBitBtn
                Hint = 'OK - [BAS539]'
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
              Hint = 'Clique para pesquisar - [BAS533]'
            end
            inherited BitBtn3: TBitBtn
              Hint = 'Novo cadastro - [BAS534]'
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
            end
            inherited Panel2: TPanel
              inherited SpeedButton1: TSpeedButton
                Hint = 'Editar Registro - [BAS535]'
              end
              inherited SpeedButton2: TSpeedButton
                OnClick = SpeedButton2Click
              end
              inherited SpeedButton3: TSpeedButton
                Enabled = False
                Flat = False
                Visible = False
              end
              inherited SpeedButton5: TSpeedButton
                Hint = 'Recuperar registro - [BAS538]'
                OnClick = SpeedButton5Click
              end
              inherited SpeedButton6: TSpeedButton
                Flat = False
                Visible = False
              end
              inherited SpeedButton7: TSpeedButton
                Flat = False
                Visible = False
              end
              inherited SpeedButton8: TSpeedButton
                Flat = False
                Visible = False
              end
              inherited SpeedButton11: TSpeedButton
                Flat = False
                Visible = False
              end
              inherited SpeedButton12: TSpeedButton
                Flat = False
                Visible = False
              end
              inherited SpeedButton23: TSpeedButton
                Flat = False
                Visible = False
              end
              inherited SpeedButton24: TSpeedButton
                Flat = False
                Visible = False
              end
              inherited SpeedButton25: TSpeedButton
                Hint = 'Ver registros da lixeira - [BAS540]'
                OnClick = SpeedButton25Click
              end
              inherited SpeedButton26: TSpeedButton
                Flat = False
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
