inherited frmCadOperacaoFiscal: TfrmCadOperacaoFiscal
  Caption = 'Opera'#231#227'o Fiscal'
  ClientHeight = 588
  ExplicitWidth = 806
  ExplicitHeight = 622
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelFundo: TPanel
    Height = 569
    ExplicitHeight = 569
    inherited Splitter2: TSplitter
      Height = 567
      ExplicitHeight = 567
    end
    inherited PanelLeft: TPanel
      Height = 567
      ExplicitHeight = 567
      inherited PageControl1: TPageControl
        Height = 565
        ExplicitHeight = 565
        inherited TabSheet1: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 783
          ExplicitHeight = 534
          inherited ScrollBox1: TScrollBox
            Height = 534
            ExplicitHeight = 534
            inherited PageControl3: TPageControl
              Height = 486
              ActivePage = tsCadastro
              ExplicitHeight = 486
              inherited TabSheet3: TTabSheet
                ExplicitLeft = 4
                ExplicitTop = 27
                ExplicitWidth = 775
                ExplicitHeight = 455
                inherited ScrollBox3: TScrollBox
                  Height = 455
                  ExplicitHeight = 455
                end
              end
              object tsCadastro: TTabSheet
                Caption = 'tsCadastro'
                ImageIndex = 1
                ExplicitLeft = 0
                ExplicitTop = 0
                ExplicitWidth = 0
                ExplicitHeight = 0
                object pn_cadastro: TPanel
                  Left = 0
                  Top = 0
                  Width = 775
                  Height = 455
                  Align = alClient
                  BevelOuter = bvNone
                  TabOrder = 0
                  OnEnter = pn_cadastroEnter
                  object pageOpfiscal: TPageControl
                    Left = 0
                    Top = 49
                    Width = 775
                    Height = 406
                    ActivePage = TabSheet7
                    Align = alClient
                    Style = tsFlatButtons
                    TabOrder = 0
                    OnChange = pageOpfiscalChange
                    object tsIcms: TTabSheet
                      Caption = 'ICMS'
                      ExplicitLeft = 0
                      ExplicitTop = 0
                      ExplicitWidth = 0
                      ExplicitHeight = 0
                      object bt_icms_cadastro: TSpeedButton
                        Left = 0
                        Top = 0
                        Width = 767
                        Height = 43
                        Cursor = crHandPoint
                        Align = alTop
                        Caption = 
                          'O tributo do ICMS n'#227'o est'#225' ativo para esta opera'#231#227'o fiscal. Dese' +
                          'ja ativar?'
                        Flat = True
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clHighlight
                        Font.Height = -12
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                        OnClick = bt_icms_cadastroClick
                      end
                      object pn_icms_cadastro: TPanel
                        Left = 0
                        Top = 43
                        Width = 767
                        Height = 332
                        Align = alClient
                        BevelOuter = bvNone
                        TabOrder = 0
                        object Panel7: TPanel
                          Left = 0
                          Top = 0
                          Width = 767
                          Height = 59
                          Align = alTop
                          BevelOuter = bvNone
                          Padding.Top = 16
                          Padding.Bottom = 13
                          TabOrder = 0
                          object Label8: TLabel
                            Left = 13
                            Top = 6
                            Width = 51
                            Height = 13
                            Caption = 'Tributa'#231#227'o'
                          end
                          object Label9: TLabel
                            Left = 385
                            Top = 6
                            Width = 106
                            Height = 13
                            Caption = 'Motivo de desnera'#231#227'o'
                          end
                          object bt_icms_config: TSpeedButton
                            Left = 737
                            Top = 16
                            Width = 30
                            Height = 30
                            Align = alRight
                            Flat = True
                            Glyph.Data = {
                              36030000424D3603000000000000360000002800000010000000100000000100
                              18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
                              FFFFFFFFFFFFFFFFFFFFFFFFD4D4D3B4B3B0B4B3B0D5D4D4FFFFFFFFFFFFFFFF
                              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF938D7F90
                              83677C7159888379FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                              F9F9F9FEFEFEFFFFFFEAE9E98E836B7C715A746A54766E5DECECECFFFFFFFEFE
                              FEF9F9F9FFFFFFFFFFFFFFFFFFF6F6F68C85748E897D9C99938C826C82775F84
                              7A65847A65776D58756E5C96948F817C737C7669F8F8F8FFFFFFFFFFFFA3A09A
                              918468918468918468B4AC9BC0B9A9B0A692B0A692ADA38F918772746A54746A
                              54746A54A09F9AFFFFFFFEFEFE948871918468918468B7AF9DD9D5CD9B938278
                              6E58786E588D836DAEA490908671746A54746A547E7663FFFFFFFFFFFFDEDCD8
                              998D7395896EDBD7CE9F97878E8A66D4E299D3E0988C87658E846FADA38F766C
                              56807763DDDCD8FFFFFFFFFFFFFFFFFFA6A299A49A83DEDAD27D745FD3E098EC
                              FFAAECFFAACFDB957B715BB0A692817761A29F98FFFFFFFFFFFFFFFFFFFFFFFF
                              9E9A92A49982DEDAD27E7460D2DE97ECFFAAECFFAACED994827B5EE2F0A68C87
                              669B9891FFFFFFFFFFFFFFFFFFBEBDBA8E836995886DDAD6CDA199898C8765D1
                              DD96D0DB95898563ABAE7BE5F6A583795E8E826AC1C0BEFFFFFFFFFFFF968C73
                              918468918468B5AD9ADAD6CEA39F8580785D80795DA9AC7AE9FBA8B5B7829083
                              67918468988E76FFFFFFFFFFFFC2BEB5918468918468918468B5AD9AE6F5ACEC
                              FFAAECFFAAE7F9A6BABB85918468918468918468C7C2BAFFFFFFFFFFFFFCFCFC
                              AFA591B7B0A1C4BFB6A0957C958A6BA7A278A7A27895896BA1967FC4C0B7B6AF
                              A0B0A794FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F994887091
                              8468918468968A73FBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                              FFFFFFFFFFFFFFFFFFFFFFFF9F9889918468918468A39C8EFFFFFFFFFFFFFFFF
                              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7E6E5D2
                              D0CDD2D0CDE8E8E6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
                            OnClick = bt_icms_configClick
                            ExplicitLeft = 32
                            ExplicitTop = 0
                          end
                          object ed_icms_tributacao: TDBLookupComboBox
                            Left = 13
                            Top = 25
                            Width = 366
                            Height = 21
                            TabOrder = 0
                          end
                          object ed_icms_deson: TDBLookupComboBox
                            Left = 385
                            Top = 23
                            Width = 346
                            Height = 21
                            TabOrder = 1
                          end
                        end
                        object GroupBox4: TGroupBox
                          Left = 0
                          Top = 59
                          Width = 210
                          Height = 273
                          Align = alLeft
                          Caption = 'Opera'#231#227'o Interna'
                          TabOrder = 1
                          object Panel5: TPanel
                            Left = 2
                            Top = 15
                            Width = 206
                            Height = 256
                            Align = alClient
                            BevelOuter = bvNone
                            BorderWidth = 3
                            TabOrder = 0
                            object bt_icms_cadastro_intra: TSpeedButton
                              Left = 3
                              Top = 3
                              Width = 200
                              Height = 30
                              Cursor = crHandPoint
                              Align = alTop
                              Caption = 'Ativar para opera'#231#227'o interna?'
                              Flat = True
                              Font.Charset = DEFAULT_CHARSET
                              Font.Color = clHighlight
                              Font.Height = -11
                              Font.Name = 'Tahoma'
                              Font.Style = [fsBold]
                              ParentFont = False
                              OnClick = bt_icms_cadastro_intraClick
                              ExplicitLeft = 4
                              ExplicitTop = 0
                              ExplicitWidth = 245
                            end
                            object pn_icms_cadastro_intra: TPanel
                              Left = 3
                              Top = 33
                              Width = 200
                              Height = 220
                              Align = alClient
                              BevelOuter = bvNone
                              TabOrder = 0
                              object Panel8: TPanel
                                Left = 0
                                Top = 27
                                Width = 200
                                Height = 27
                                Align = alTop
                                BevelOuter = bvNone
                                Padding.Top = 3
                                Padding.Bottom = 3
                                TabOrder = 1
                                object Label10: TLabel
                                  Left = 0
                                  Top = 3
                                  Width = 115
                                  Height = 21
                                  Align = alLeft
                                  AutoSize = False
                                  BiDiMode = bdRightToLeft
                                  Caption = '% ICMS  '
                                  ParentBiDiMode = False
                                  Layout = tlCenter
                                end
                                object ed_intra_picms: TEditHw
                                  Left = 115
                                  Top = 3
                                  Width = 85
                                  Height = 21
                                  Align = alClient
                                  TabOrder = 0
                                  Text = '                 0,0000'
                                  Formato = fNumber
                                  FormatSize = '0.4'
                                end
                              end
                              object Panel9: TPanel
                                Left = 0
                                Top = 54
                                Width = 200
                                Height = 27
                                Align = alTop
                                BevelOuter = bvNone
                                Padding.Top = 3
                                Padding.Bottom = 3
                                TabOrder = 2
                                object Label11: TLabel
                                  Left = 0
                                  Top = 3
                                  Width = 115
                                  Height = 21
                                  Align = alLeft
                                  AutoSize = False
                                  BiDiMode = bdRightToLeft
                                  Caption = '% FCP  '
                                  ParentBiDiMode = False
                                  Layout = tlCenter
                                end
                                object ed_intra_pfcp: TEditHw
                                  Left = 115
                                  Top = 3
                                  Width = 85
                                  Height = 21
                                  Align = alClient
                                  TabOrder = 0
                                  Text = '                 0,0000'
                                  Formato = fNumber
                                  FormatSize = '0.4'
                                end
                              end
                              object Panel11: TPanel
                                Left = 0
                                Top = 81
                                Width = 200
                                Height = 27
                                Align = alTop
                                BevelOuter = bvNone
                                Padding.Top = 3
                                Padding.Bottom = 3
                                TabOrder = 3
                                object Label12: TLabel
                                  Left = 0
                                  Top = 3
                                  Width = 115
                                  Height = 21
                                  Align = alLeft
                                  AutoSize = False
                                  BiDiMode = bdRightToLeft
                                  Caption = '% Redu'#231#227'o de Base  '
                                  ParentBiDiMode = False
                                  Layout = tlCenter
                                end
                                object ed_intra_predbc: TEditHw
                                  Left = 115
                                  Top = 3
                                  Width = 85
                                  Height = 21
                                  Align = alClient
                                  TabOrder = 0
                                  Text = '                 0,0000'
                                  Formato = fNumber
                                  FormatSize = '0.4'
                                end
                              end
                              object Panel12: TPanel
                                Left = 0
                                Top = 108
                                Width = 200
                                Height = 27
                                Align = alTop
                                BevelOuter = bvNone
                                Padding.Top = 3
                                Padding.Bottom = 3
                                TabOrder = 4
                                object Label14: TLabel
                                  Left = 0
                                  Top = 3
                                  Width = 115
                                  Height = 21
                                  Align = alLeft
                                  AutoSize = False
                                  BiDiMode = bdRightToLeft
                                  Caption = '% ICMS Diferimento  '
                                  ParentBiDiMode = False
                                  Layout = tlCenter
                                end
                                object ed_intra_pdif: TEditHw
                                  Left = 115
                                  Top = 3
                                  Width = 85
                                  Height = 21
                                  Align = alClient
                                  TabOrder = 0
                                  Text = '                 0,0000'
                                  Formato = fNumber
                                  FormatSize = '0.4'
                                end
                              end
                              object Panel13: TPanel
                                Left = 0
                                Top = 135
                                Width = 200
                                Height = 27
                                Align = alTop
                                BevelOuter = bvNone
                                Padding.Top = 3
                                Padding.Bottom = 3
                                TabOrder = 5
                                object Label15: TLabel
                                  Left = 0
                                  Top = 3
                                  Width = 115
                                  Height = 21
                                  Align = alLeft
                                  AutoSize = False
                                  BiDiMode = bdRightToLeft
                                  Caption = '% FCP Diferimento  '
                                  ParentBiDiMode = False
                                  Layout = tlCenter
                                end
                                object ed_intra_pfcpdif: TEditHw
                                  Left = 115
                                  Top = 3
                                  Width = 85
                                  Height = 21
                                  Align = alClient
                                  TabOrder = 0
                                  Text = '                 0,0000'
                                  Formato = fNumber
                                  FormatSize = '0.4'
                                end
                              end
                              object Panel16: TPanel
                                Left = 0
                                Top = 0
                                Width = 200
                                Height = 27
                                Align = alTop
                                BevelOuter = bvNone
                                Padding.Top = 3
                                Padding.Bottom = 3
                                TabOrder = 0
                                object Label16: TLabel
                                  Left = 0
                                  Top = 3
                                  Width = 115
                                  Height = 21
                                  Align = alLeft
                                  AutoSize = False
                                  BiDiMode = bdRightToLeft
                                  Caption = 'CFOP  '
                                  ParentBiDiMode = False
                                  Layout = tlCenter
                                end
                                object ed_intra_cfop: TEditHw
                                  Left = 115
                                  Top = 3
                                  Width = 85
                                  Height = 21
                                  Align = alClient
                                  TabOrder = 0
                                  Text = '                 5102'
                                  Formato = fInteger
                                  FormatSize = '0.0'
                                  DisplayFormat = '0'
                                  AsValue = 5102.000000000000000000
                                end
                              end
                            end
                          end
                        end
                        object GroupBox5: TGroupBox
                          Left = 420
                          Top = 59
                          Width = 210
                          Height = 273
                          Align = alLeft
                          Caption = 'Opera'#231#227'o com Exterior'
                          TabOrder = 2
                          object Panel14: TPanel
                            Left = 2
                            Top = 15
                            Width = 206
                            Height = 256
                            Align = alClient
                            BevelOuter = bvNone
                            BorderWidth = 3
                            TabOrder = 0
                            object bt_icms_cadastro_exterior: TSpeedButton
                              Left = 3
                              Top = 3
                              Width = 200
                              Height = 30
                              Cursor = crHandPoint
                              Align = alTop
                              Caption = 'Ativar para opera'#231#227'o com exterior?'
                              Flat = True
                              Font.Charset = DEFAULT_CHARSET
                              Font.Color = clHighlight
                              Font.Height = -11
                              Font.Name = 'Tahoma'
                              Font.Style = [fsBold]
                              ParentFont = False
                              OnClick = bt_icms_cadastro_exteriorClick
                              ExplicitWidth = 245
                            end
                            object pn_icms_cadastro_exterior: TPanel
                              Left = 3
                              Top = 33
                              Width = 200
                              Height = 220
                              Align = alClient
                              BevelOuter = bvNone
                              TabOrder = 0
                              object Panel25: TPanel
                                Left = 0
                                Top = 27
                                Width = 200
                                Height = 27
                                Align = alTop
                                BevelOuter = bvNone
                                Padding.Top = 3
                                Padding.Bottom = 3
                                TabOrder = 1
                                object Label22: TLabel
                                  Left = 0
                                  Top = 3
                                  Width = 115
                                  Height = 21
                                  Align = alLeft
                                  AutoSize = False
                                  BiDiMode = bdRightToLeft
                                  Caption = '% ICMS  '
                                  ParentBiDiMode = False
                                  Layout = tlCenter
                                end
                                object ed_exterior_picms: TEditHw
                                  Left = 115
                                  Top = 3
                                  Width = 85
                                  Height = 21
                                  Align = alClient
                                  TabOrder = 0
                                  Text = '                 0,0000'
                                  Formato = fNumber
                                  FormatSize = '0.4'
                                end
                              end
                              object Panel26: TPanel
                                Left = 0
                                Top = 54
                                Width = 200
                                Height = 27
                                Align = alTop
                                BevelOuter = bvNone
                                Padding.Top = 3
                                Padding.Bottom = 3
                                TabOrder = 2
                                object Label23: TLabel
                                  Left = 0
                                  Top = 3
                                  Width = 115
                                  Height = 21
                                  Align = alLeft
                                  AutoSize = False
                                  BiDiMode = bdRightToLeft
                                  Caption = '% FCP  '
                                  ParentBiDiMode = False
                                  Layout = tlCenter
                                end
                                object ed_exterior_pfcp: TEditHw
                                  Left = 115
                                  Top = 3
                                  Width = 85
                                  Height = 21
                                  Align = alClient
                                  TabOrder = 0
                                  Text = '                 0,0000'
                                  Formato = fNumber
                                  FormatSize = '0.4'
                                end
                              end
                              object Panel27: TPanel
                                Left = 0
                                Top = 81
                                Width = 200
                                Height = 27
                                Align = alTop
                                BevelOuter = bvNone
                                Padding.Top = 3
                                Padding.Bottom = 3
                                TabOrder = 3
                                object Label24: TLabel
                                  Left = 0
                                  Top = 3
                                  Width = 115
                                  Height = 21
                                  Align = alLeft
                                  AutoSize = False
                                  BiDiMode = bdRightToLeft
                                  Caption = '% Redu'#231#227'o de Base  '
                                  ParentBiDiMode = False
                                  Layout = tlCenter
                                end
                                object ed_exterior_predbc: TEditHw
                                  Left = 115
                                  Top = 3
                                  Width = 85
                                  Height = 21
                                  Align = alClient
                                  TabOrder = 0
                                  Text = '                 0,0000'
                                  Formato = fNumber
                                  FormatSize = '0.4'
                                end
                              end
                              object Panel28: TPanel
                                Left = 0
                                Top = 108
                                Width = 200
                                Height = 27
                                Align = alTop
                                BevelOuter = bvNone
                                Padding.Top = 3
                                Padding.Bottom = 3
                                TabOrder = 4
                                object Label25: TLabel
                                  Left = 0
                                  Top = 3
                                  Width = 115
                                  Height = 21
                                  Align = alLeft
                                  AutoSize = False
                                  BiDiMode = bdRightToLeft
                                  Caption = '% ICMS Diferimento  '
                                  ParentBiDiMode = False
                                  Layout = tlCenter
                                end
                                object ed_exterior_pdif: TEditHw
                                  Left = 115
                                  Top = 3
                                  Width = 85
                                  Height = 21
                                  Align = alClient
                                  TabOrder = 0
                                  Text = '                 0,0000'
                                  Formato = fNumber
                                  FormatSize = '0.4'
                                end
                              end
                              object Panel29: TPanel
                                Left = 0
                                Top = 135
                                Width = 200
                                Height = 27
                                Align = alTop
                                BevelOuter = bvNone
                                Padding.Top = 3
                                Padding.Bottom = 3
                                TabOrder = 5
                                object Label26: TLabel
                                  Left = 0
                                  Top = 3
                                  Width = 115
                                  Height = 21
                                  Align = alLeft
                                  AutoSize = False
                                  BiDiMode = bdRightToLeft
                                  Caption = '% FCP Diferimento  '
                                  ParentBiDiMode = False
                                  Layout = tlCenter
                                end
                                object ed_exterior_pfcpdif: TEditHw
                                  Left = 115
                                  Top = 3
                                  Width = 85
                                  Height = 21
                                  Align = alClient
                                  TabOrder = 0
                                  Text = '                 0,0000'
                                  Formato = fNumber
                                  FormatSize = '0.4'
                                end
                              end
                              object Panel30: TPanel
                                Left = 0
                                Top = 0
                                Width = 200
                                Height = 27
                                Align = alTop
                                BevelOuter = bvNone
                                Padding.Top = 3
                                Padding.Bottom = 3
                                TabOrder = 0
                                object Label27: TLabel
                                  Left = 0
                                  Top = 3
                                  Width = 115
                                  Height = 21
                                  Align = alLeft
                                  AutoSize = False
                                  BiDiMode = bdRightToLeft
                                  Caption = 'CFOP  '
                                  ParentBiDiMode = False
                                  Layout = tlCenter
                                end
                                object ed_exterior_cfop: TEditHw
                                  Left = 115
                                  Top = 3
                                  Width = 85
                                  Height = 21
                                  Align = alClient
                                  TabOrder = 0
                                  Text = '                 7102'
                                  Formato = fInteger
                                  FormatSize = '0.0'
                                  DisplayFormat = '0'
                                  AsValue = 7102.000000000000000000
                                end
                              end
                            end
                          end
                        end
                        object gpIcmsInter: TGroupBox
                          Left = 210
                          Top = 59
                          Width = 210
                          Height = 273
                          Align = alLeft
                          Caption = 'Opera'#231#227'o Interestadual'
                          TabOrder = 3
                          object Panel10: TPanel
                            Left = 2
                            Top = 15
                            Width = 206
                            Height = 256
                            Align = alClient
                            BevelOuter = bvNone
                            BorderWidth = 3
                            TabOrder = 0
                            object bt_icms_cadastro_inter: TSpeedButton
                              Left = 3
                              Top = 3
                              Width = 200
                              Height = 30
                              Cursor = crHandPoint
                              Align = alTop
                              Caption = 'Ativar para opera'#231#227'o interestadual'
                              Flat = True
                              Font.Charset = DEFAULT_CHARSET
                              Font.Color = clHighlight
                              Font.Height = -11
                              Font.Name = 'Tahoma'
                              Font.Style = [fsBold]
                              ParentFont = False
                              OnClick = bt_icms_cadastro_interClick
                              ExplicitWidth = 245
                            end
                            object pn_icms_cadastro_inter: TPanel
                              Left = 3
                              Top = 90
                              Width = 200
                              Height = 163
                              Align = alClient
                              BevelOuter = bvNone
                              TabOrder = 0
                              object Panel17: TPanel
                                Left = 0
                                Top = 15
                                Width = 200
                                Height = 27
                                Align = alTop
                                BevelOuter = bvNone
                                Padding.Top = 3
                                Padding.Bottom = 3
                                TabOrder = 0
                                object Label13: TLabel
                                  Left = 0
                                  Top = 3
                                  Width = 115
                                  Height = 21
                                  Align = alLeft
                                  AutoSize = False
                                  BiDiMode = bdRightToLeft
                                  Caption = '% ICMS  '
                                  ParentBiDiMode = False
                                  Layout = tlCenter
                                end
                                object ed_inter_picms: TEditHw
                                  Left = 115
                                  Top = 3
                                  Width = 85
                                  Height = 21
                                  Align = alClient
                                  TabOrder = 0
                                  Text = '                  0,0000'
                                  Formato = fNumber
                                  FormatSize = '0.4'
                                end
                              end
                              object Panel18: TPanel
                                Left = 0
                                Top = 42
                                Width = 200
                                Height = 27
                                Align = alTop
                                BevelOuter = bvNone
                                Padding.Top = 3
                                Padding.Bottom = 3
                                TabOrder = 1
                                object Label17: TLabel
                                  Left = 0
                                  Top = 3
                                  Width = 115
                                  Height = 21
                                  Align = alLeft
                                  AutoSize = False
                                  BiDiMode = bdRightToLeft
                                  Caption = '% FCP  '
                                  ParentBiDiMode = False
                                  Layout = tlCenter
                                end
                                object ed_inter_pfcp: TEditHw
                                  Left = 115
                                  Top = 3
                                  Width = 85
                                  Height = 21
                                  Align = alClient
                                  TabOrder = 0
                                  Text = '                  0,0000'
                                  Formato = fNumber
                                  FormatSize = '0.4'
                                end
                              end
                              object Panel19: TPanel
                                Left = 0
                                Top = 69
                                Width = 200
                                Height = 27
                                Align = alTop
                                BevelOuter = bvNone
                                Padding.Top = 3
                                Padding.Bottom = 3
                                TabOrder = 2
                                object Label18: TLabel
                                  Left = 0
                                  Top = 3
                                  Width = 115
                                  Height = 21
                                  Align = alLeft
                                  AutoSize = False
                                  BiDiMode = bdRightToLeft
                                  Caption = '% Redu'#231#227'o de Base  '
                                  ParentBiDiMode = False
                                  Layout = tlCenter
                                end
                                object ed_inter_predbc: TEditHw
                                  Left = 115
                                  Top = 3
                                  Width = 85
                                  Height = 21
                                  Align = alClient
                                  TabOrder = 0
                                  Text = '                  0,0000'
                                  Formato = fNumber
                                  FormatSize = '0.4'
                                end
                              end
                              object Panel20: TPanel
                                Left = 0
                                Top = 96
                                Width = 200
                                Height = 27
                                Align = alTop
                                BevelOuter = bvNone
                                Padding.Top = 3
                                Padding.Bottom = 3
                                TabOrder = 3
                                object Label19: TLabel
                                  Left = 0
                                  Top = 3
                                  Width = 115
                                  Height = 21
                                  Align = alLeft
                                  AutoSize = False
                                  BiDiMode = bdRightToLeft
                                  Caption = '% ICMS Diferimento  '
                                  ParentBiDiMode = False
                                  Layout = tlCenter
                                end
                                object ed_inter_pdif: TEditHw
                                  Left = 115
                                  Top = 3
                                  Width = 85
                                  Height = 21
                                  Align = alClient
                                  TabOrder = 0
                                  Text = '                  0,0000'
                                  Formato = fNumber
                                  FormatSize = '0.4'
                                end
                              end
                              object Panel21: TPanel
                                Left = 0
                                Top = 123
                                Width = 200
                                Height = 27
                                Align = alTop
                                BevelOuter = bvNone
                                Padding.Top = 3
                                Padding.Bottom = 3
                                TabOrder = 4
                                object Label20: TLabel
                                  Left = 0
                                  Top = 3
                                  Width = 115
                                  Height = 21
                                  Align = alLeft
                                  AutoSize = False
                                  BiDiMode = bdRightToLeft
                                  Caption = '% FCP Diferimento  '
                                  ParentBiDiMode = False
                                  Layout = tlCenter
                                end
                                object ed_inter_pfcpdif: TEditHw
                                  Left = 115
                                  Top = 3
                                  Width = 85
                                  Height = 21
                                  Align = alClient
                                  TabOrder = 0
                                  Text = '                  0,0000'
                                  Formato = fNumber
                                  FormatSize = '0.4'
                                end
                              end
                              object Panel22: TPanel
                                Left = 0
                                Top = 150
                                Width = 200
                                Height = 13
                                Align = alClient
                                BevelOuter = bvNone
                                Padding.Top = 3
                                TabOrder = 5
                                object ed_inter_ufs: TListBox
                                  Left = 23
                                  Top = 3
                                  Width = 177
                                  Height = 10
                                  Align = alClient
                                  Columns = 10
                                  ItemHeight = 13
                                  Items.Strings = (
                                    'AC'
                                    'AL'
                                    'AM'
                                    'AP'
                                    'BA'
                                    'CE'
                                    'DF'
                                    'ES'
                                    'GO'
                                    'MA'
                                    'MG'
                                    'MS'
                                    'MT'
                                    'PA'
                                    'PB'
                                    'PE'
                                    'PI'
                                    'PR'
                                    'RJ'
                                    'RN'
                                    'RO'
                                    'RR'
                                    'RS'
                                    'SC'
                                    'SE'
                                    'SP'
                                    'TO')
                                  TabOrder = 0
                                end
                                object Panel23: TPanel
                                  Left = 0
                                  Top = 3
                                  Width = 23
                                  Height = 10
                                  Align = alLeft
                                  BevelOuter = bvNone
                                  TabOrder = 1
                                  object SpeedButton14: TSpeedButton
                                    Left = 0
                                    Top = 23
                                    Width = 23
                                    Height = 23
                                    Align = alTop
                                    Flat = True
                                    Glyph.Data = {
                                      36050000424D3605000000000000360400002800000010000000100000000100
                                      08000000000000010000220B0000220B000000010000000100000031DE000031
                                      E7000031EF000031F700FF00FF000031FF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
                                      0404040404040404000004000004040404040404040404000004040000000404
                                      0404040404040000040404000000000404040404040000040404040402000000
                                      0404040400000404040404040404000000040000000404040404040404040400
                                      0101010004040404040404040404040401010204040404040404040404040400
                                      0201020304040404040404040404030201040403030404040404040404050203
                                      0404040405030404040404040303050404040404040303040404040303030404
                                      0404040404040403040403030304040404040404040404040404030304040404
                                      0404040404040404040404040404040404040404040404040404}
                                    OnClick = SpeedButton14Click
                                    ExplicitLeft = 1
                                    ExplicitTop = 1
                                    ExplicitWidth = 39
                                  end
                                  object SpeedButton15: TSpeedButton
                                    Left = 0
                                    Top = 0
                                    Width = 23
                                    Height = 23
                                    Align = alTop
                                    Flat = True
                                    Glyph.Data = {
                                      36050000424D3605000000000000360400002800000010000000100000000100
                                      08000000000000010000130B0000130B000000010000000100002184290039B5
                                      520063A563006BAD840094DE8C00FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
                                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00050505050505
                                      0505050505050505050505050505050503000003050505050505050505050505
                                      0204010005050505050505050505050502040100050505050505050505050505
                                      0204010005050505050505050505050502040100050505050505050300000000
                                      0004010000000000030505020101010101010101010101010005050204040404
                                      0404010404040404000505030202020202040100000000000305050505050505
                                      0204010005050505050505050505050502040100050505050505050505050505
                                      0204010005050505050505050505050502040100050505050505050505050505
                                      0302020305050505050505050505050505050505050505050505}
                                    OnClick = SpeedButton15Click
                                    ExplicitLeft = 1
                                    ExplicitTop = 2
                                    ExplicitWidth = 183
                                  end
                                end
                              end
                              object pn_icms_cadastro_inter_desfazer: TPanel
                                Left = 0
                                Top = 0
                                Width = 200
                                Height = 15
                                Cursor = crHandPoint
                                Align = alTop
                                BevelOuter = bvNone
                                Caption = 'Registro exclu'#237'do. Desfazer exclus'#227'o?'
                                Color = 8421631
                                Font.Charset = DEFAULT_CHARSET
                                Font.Color = clWhite
                                Font.Height = -11
                                Font.Name = 'Tahoma'
                                Font.Style = []
                                ParentBackground = False
                                ParentFont = False
                                TabOrder = 6
                                OnClick = pn_icms_cadastro_inter_desfazerClick
                              end
                            end
                            object pn_icms_cadastro_inter_botoes: TPanel
                              Left = 3
                              Top = 60
                              Width = 200
                              Height = 30
                              Align = alTop
                              BevelOuter = bvNone
                              ParentColor = True
                              TabOrder = 1
                              object bt_icms_cadastro_inter_ante: TSpeedButton
                                Left = 140
                                Top = 0
                                Width = 30
                                Height = 30
                                Align = alRight
                                Flat = True
                                Glyph.Data = {
                                  36030000424D3603000000000000360000002800000010000000100000000100
                                  18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
                                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                                  FFFFFFFFFFFFFFFFFFFFFFC5BDB7B3A385FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F7F69D8976A77B4C8C65
                                  38FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                                  FFFFDDD7D3957454C59369CC9672936A41FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                                  FFFFFFFFFFFFFFFFFFFFFFFFFEFEFEB9A799A1754EC9946ED7A27EDEAA869C71
                                  4CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEBE99B7B62A2
                                  704ABB8560CD9874DFAB87EBB896A37753FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                                  FFFFFFFFFFFFD6C7BC845838895734A26D48B9825DCA9470D9A481E0AD8AA273
                                  50FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBF9D857D5333845D3F9C7455B1
                                  8868C39A78CFA685D7AE8EDAB292A27655FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                                  FFFFFFC49F86956E4D99795CA78567B49171C09B7BCAA483D0AA89D2AC8AA173
                                  51FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE1CBBDAA7C59AF9274B8
                                  9A7CC0A182C8A787CCAB8BCEAC8CA27451FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                                  FFFFFFFFFFFFFFFFFFF3ECE8BF906FBD9E7FC6AB8CCAAE90CDB092CEB192A679
                                  55FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFDFDD5
                                  B39CC19977D3BB9DD4BB9DD4BB9DAD815DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9DAD0C2926EDEC7A8E1CDADB88C
                                  66FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                                  FFFFFFFFFFF8F5F3CA9E80DEBF9DC79D78FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE4CEBFEDE0
                                  D6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
                                OnClick = bt_icms_cadastro_inter_anteClick
                                ExplicitLeft = 185
                              end
                              object bt_icms_cadastro_inter_prox: TSpeedButton
                                Left = 170
                                Top = 0
                                Width = 30
                                Height = 30
                                Align = alRight
                                Flat = True
                                Glyph.Data = {
                                  36030000424D3603000000000000360000002800000010000000100000000100
                                  18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
                                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB4A485C7BEB7FFFFFFFFFFFFFF
                                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                                  FFFFFF9C764AC09568A18D79F8F7F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9D754DE1AD8AD19F76997957DE
                                  D8D3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                                  FFFFFF9C724CDBA783D39E7AC7926DA3774FBAA99AFEFEFEFFFFFFFFFFFFFFFF
                                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9A6D49D29D79CD9873C48E69B9
                                  825CA5724C9E7E65EFECE9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                                  FFFFFF986845C9936EC58F6ABE8863B57E58A6704B94603D8C5F3ED8C8BDFFFF
                                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF986845C4916DC08D69BA8560AE
                                  7853A06B47905D3A7E4C2B754322BC9981FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                                  FFFFFF9E704ECCA583CBA382C7A07FC09B7AB58E6EA47B5C8D6243794522C09A
                                  81FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA17451CDAB8BCCAA8AC9A787C5
                                  A484BF9E7FB8997AB28360E2CCBEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                                  FFFFFFA87B57D1B494D1B394CFB292CCAF90C4A383C19372F3EDE8FFFFFFFFFF
                                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB18662D9C0A1D9BFA0D8BFA0C5
                                  9C7AD5B49DFEFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                                  FFFFFFBC916DE5D0B0E1C9A9C39370E9DAD0FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC89F7DDEBE9CCA9E80F8F5F3FF
                                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                                  FFFFFFEDDFD6E5CFC1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
                                OnClick = bt_icms_cadastro_inter_proxClick
                                ExplicitLeft = 215
                              end
                              object bt_icms_cadastro_inter_excluir: TSpeedButton
                                Left = 0
                                Top = 0
                                Width = 30
                                Height = 30
                                Align = alLeft
                                Flat = True
                                Glyph.Data = {
                                  36050000424D3605000000000000360400002800000010000000100000000100
                                  08000000000000010000220B0000220B000000010000000100000031DE000031
                                  E7000031EF000031F700FF00FF000031FF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
                                  0404040404040404000004000004040404040404040404000004040000000404
                                  0404040404040000040404000000000404040404040000040404040402000000
                                  0404040400000404040404040404000000040000000404040404040404040400
                                  0101010004040404040404040404040401010204040404040404040404040400
                                  0201020304040404040404040404030201040403030404040404040404050203
                                  0404040405030404040404040303050404040404040303040404040303030404
                                  0404040404040403040403030304040404040404040404040404030304040404
                                  0404040404040404040404040404040404040404040404040404}
                                OnClick = bt_icms_cadastro_inter_excluirClick
                              end
                              object bt_icms_cadastro_inter_adiciona: TSpeedButton
                                Left = 90
                                Top = 0
                                Width = 27
                                Height = 30
                                Cursor = crHandPoint
                                Hint = 'Adicionar nova'
                                Align = alLeft
                                Flat = True
                                Font.Charset = DEFAULT_CHARSET
                                Font.Color = clHighlight
                                Font.Height = -11
                                Font.Name = 'Tahoma'
                                Font.Style = [fsBold]
                                Glyph.Data = {
                                  36050000424D3605000000000000360400002800000010000000100000000100
                                  08000000000000010000420B0000420B00000001000000010000B5847300AD73
                                  8400B5848400B58C8400B5948C00D6BDB500C6C6C600EFD6C600CECECE00D6D6
                                  D600DEDEDE00E7E7E700EFEFEF0042B5F7008CD6F700B5DEF700F7F7F700FF00
                                  FF003184FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
                                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00111111111111
                                  1111111111111111111111111101020202020202020202020211111111011313
                                  1313131313131313021111111101131313131313131313130211111111011313
                                  1313131313131313021111111101131313131313131313130211111111011313
                                  1313131313131313021111111101131313131313131313130211111111011313
                                  13131313131313130211111112121210101010101010101002111111120D120C
                                  0C0C0C0C0C0C0C0C02111212120D1212120B0B0B0B0004030211120E0F0F0F0E
                                  120A0A0A0600131302111212120F1212120909090600130211111111120F1208
                                  0808080806000211111111111212120707070707050011111111}
                                ParentFont = False
                                OnClick = bt_icms_cadastro_inter_adicionaClick
                                ExplicitLeft = 134
                                ExplicitTop = -3
                              end
                              object bt_icms_cadastro_inter_cancela: TSpeedButton
                                Left = 60
                                Top = 0
                                Width = 30
                                Height = 30
                                Align = alLeft
                                Flat = True
                                Glyph.Data = {
                                  E6010000424DE60100000000000036000000280000000C0000000C0000000100
                                  180000000000B0010000C40E0000C40E00000000000000000000FFFFFF9E9EDA
                                  9696BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8484BF9B9BC0FFFFFF9C9C
                                  ED0000C50000B69191BAFFFFFFFFFFFFFFFFFFFFFFFF7F7FC500009100008FA2
                                  A2C64848EC0000DD0000D50000BC9292BBFFFFFFFFFFFF7A7AC80000A30000A7
                                  0000938F8FC9FFFFFF3636EF0000E60000DE0000C99999BD6B6BCE0000AD0000
                                  B40000A67D7DCBFFFFFFFFFFFFFFFFFF3838EF0000E60101E40000D40000C401
                                  01BE0000AF7474CDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2626F10000EA0000E9
                                  0000DD0000CE5F5FD8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8D8DE10F0F
                                  ED0C0CEC0303EC0000E28E8EC0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8484DD39
                                  39E86868ED5A5AF04848F03F3FF21212E69E9EC4FFFFFFFFFFFFFFFFFF8787DD
                                  4B4BE16A6AE75959E88C8CE67070ED6868F36D6DF64343E89E9EC6FFFFFF8A8A
                                  DD4D4DDE7373E46868E48E8EE4FFFFFFFFFFFF7B7BEB6C6CF06F6FF73D3DEAA6
                                  A6CE8787E36262DD6767E09191E3FFFFFFFFFFFFFFFFFFFFFFFF8080E96D6DEF
                                  5555F2A4A4E9FFFFFF8F8FE49393E2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                                  FF7D7DE9A4A4EDFFFFFF}
                                OnClick = bt_icms_cadastro_inter_cancelaClick
                                ExplicitLeft = 64
                              end
                              object bt_icms_cadastro_inter_salva: TSpeedButton
                                Left = 101
                                Top = 0
                                Width = 39
                                Height = 30
                                Cursor = crHandPoint
                                Hint = 'Salvar'
                                Align = alRight
                                Flat = True
                                Font.Charset = DEFAULT_CHARSET
                                Font.Color = clHighlight
                                Font.Height = -11
                                Font.Name = 'Tahoma'
                                Font.Style = [fsBold]
                                Glyph.Data = {
                                  36050000424D3605000000000000360400002800000010000000100000000100
                                  08000000000000010000220B0000220B00000001000000010000942929009431
                                  31009C3131009C393900A53939009C4242009C4A4A00A54A4A00B54A4A00AD52
                                  4A00B5524A00A5525200AD525200B5525200B55A5200AD525A00AD5A5A00B55A
                                  5A00BD5A5A00C65A5A00CE5A5A00CE636300CE6B6B00D66B6B00B5737300BD7B
                                  73009C7B7B009C848400AD848400B5848400C6848400AD8C8C00B58C8C00C694
                                  8C00AD949400C6949400A59C9C00B59C9C00D69C9C00BDA5A500D6A5A500D6AD
                                  A500CEADAD00D6ADAD00DEADAD00CEB5B500D6B5B500CEBDBD00DEBDBD00E7BD
                                  BD00E7C6C600C6CEC600CECEC600C6CECE00CECECE00D6CECE00E7CECE00E7D6
                                  CE00D6D6D600DED6D600EFD6D600DEDED600D6DEDE00DEDEDE00E7DEDE00E7E7
                                  E700EFEFEF00F7EFEF00F7F7EF00F7F7F700FFF7F700FFFFF700FF00FF00FFFF
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
                                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF004848100C0722
                                  33343433332505050B4848191516111B27384647452D0002131048191515111A
                                  05184046492E0102121048191515111C03032F42493200011210481915151120
                                  0601243A493200011210481915151221231D1F27322C04041310481915151515
                                  1515151313151515160F48190D111E282B292B2828292B26150C481909384544
                                  4545454545454530130F48190A3C46434343434343434530130F48190A3C423A
                                  3A3A3A3A3A3A4230130F48190A3C423B3F3F3F3F3F3B4230130F48190A3C4440
                                  4040404040404230130F48190A3C423A3A3A3A3A3A3A4230130F48190A394643
                                  4343434343434630130F4848092D3A363636363636363A2A0748}
                                ParentFont = False
                                OnClick = bt_icms_cadastro_inter_salvaClick
                                ExplicitLeft = 96
                                ExplicitTop = 3
                              end
                              object bt_icms_cadastro_inter_editar: TSpeedButton
                                Left = 30
                                Top = 0
                                Width = 30
                                Height = 30
                                Align = alLeft
                                Flat = True
                                Glyph.Data = {
                                  36050000424D3605000000000000360400002800000010000000100000000100
                                  08000000000000010000320B0000320B0000000100000001000000000000CE63
                                  00000010180039082100A56B2900DE8C3900E7396300526B7B0000089C007B9C
                                  A500D6CEAD00F7D6AD00FFD6AD00ADB5BD00B5C6C600BDC6C600C6C6C600FFE7
                                  C600ADC6CE00FFEFD6002163DE00FFEFDE00FFF7E700FFFFF700FF00FF00FFFF
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
                                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00181818181818
                                  1818181818181818181818010101010101010101010101010101180119191716
                                  1311070A0B0C0C0C0C011801190F0F0F0F0F0700120F0F0F0C01180119191919
                                  17160700000C0B0C0C011801190F0F0F0F0F071505000E0F0C01180119191919
                                  1919091505000C0C0C011801190F0F0F0F0F0F071505000D0C01180119191919
                                  191919091505000C0C011801190F0F0F0F0F0F0F071505000C01180119191919
                                  19191919091505020C0118011919191919191919190700140001180101010101
                                  0101010101041414030118180101010101010101010108080618181818181818
                                  1818181818181818181818181818181818181818181818181818}
                                OnClick = bt_icms_cadastro_inter_editarClick
                                ExplicitLeft = 32
                              end
                            end
                            object pn_icms_cadastro_inter_cfop: TPanel
                              Left = 3
                              Top = 33
                              Width = 200
                              Height = 27
                              Align = alTop
                              BevelOuter = bvNone
                              Padding.Top = 3
                              Padding.Bottom = 3
                              TabOrder = 2
                              object Label21: TLabel
                                Left = 0
                                Top = 3
                                Width = 110
                                Height = 21
                                Align = alLeft
                                AutoSize = False
                                BiDiMode = bdRightToLeft
                                Caption = 'CFOP  '
                                ParentBiDiMode = False
                                Layout = tlCenter
                              end
                              object ed_inter_cfop: TEditHw
                                Left = 110
                                Top = 3
                                Width = 90
                                Height = 21
                                Align = alClient
                                TabOrder = 0
                                Text = '                   6102'
                                Formato = fInteger
                                FormatSize = '0.0'
                                DisplayFormat = '0'
                                AsValue = 6102.000000000000000000
                              end
                            end
                          end
                        end
                        object GroupBox8: TGroupBox
                          Left = 630
                          Top = 59
                          Width = 137
                          Height = 273
                          Align = alClient
                          Caption = 'Base de c'#225'lculo'
                          TabOrder = 4
                          object Panel45: TPanel
                            Left = 2
                            Top = 15
                            Width = 133
                            Height = 256
                            Align = alClient
                            BevelOuter = bvNone
                            BorderWidth = 3
                            TabOrder = 0
                            object Label48: TLabel
                              Left = 3
                              Top = 3
                              Width = 127
                              Height = 19
                              Align = alTop
                              AutoSize = False
                              Caption = 'Entrada/Sa'#237'da'
                              Layout = tlCenter
                              ExplicitLeft = 4
                              ExplicitTop = 45
                            end
                            object Label50: TLabel
                              Left = 3
                              Top = 84
                              Width = 127
                              Height = 19
                              Align = alTop
                              AutoSize = False
                              Caption = '-----------------------------'
                              Layout = tlCenter
                              ExplicitLeft = 4
                              ExplicitTop = 116
                              ExplicitWidth = 97
                            end
                            object Label49: TLabel
                              Left = 3
                              Top = 121
                              Width = 127
                              Height = 13
                              Align = alTop
                              Caption = 'Campos dispon'#237'veis'
                              ExplicitWidth = 93
                            end
                            object ck_icms_base: TCheckListBox
                              Left = 3
                              Top = 134
                              Width = 127
                              Height = 119
                              OnClickCheck = ck_icms_baseClickCheck
                              Align = alClient
                              ItemHeight = 13
                              Items.Strings = (
                                'Valor'
                                'Seguro'
                                'Outras'
                                'Desconto'
                                'Frete'
                                'ValorIPI'
                                'ValorICMS'
                                'Custo'
                                'DesoneracaoICMS'
                                'DesoneracaoPIS'
                                'DesoneracaoCOFINS')
                              TabOrder = 2
                            end
                            object ed_icms_ent_sai: TComboBox
                              Left = 3
                              Top = 22
                              Width = 127
                              Height = 21
                              Align = alTop
                              Style = csDropDownList
                              ItemHeight = 0
                              ItemIndex = 0
                              TabOrder = 0
                              Text = 'Saida'
                              OnChange = ed_icms_modeloChange
                              Items.Strings = (
                                'Saida'
                                'Entrada')
                            end
                            object ck_icms_base_hab: TCheckBox
                              Left = 3
                              Top = 103
                              Width = 127
                              Height = 18
                              Align = alTop
                              Caption = 'Habilitar'
                              TabOrder = 3
                              OnClick = ck_icms_base_habClick
                            end
                            object Panel52: TPanel
                              Left = 3
                              Top = 43
                              Width = 127
                              Height = 41
                              Align = alTop
                              BevelOuter = bvNone
                              TabOrder = 1
                              object Panel53: TPanel
                                Left = 0
                                Top = 0
                                Width = 41
                                Height = 41
                                Align = alLeft
                                BevelOuter = bvNone
                                TabOrder = 0
                                object Label47: TLabel
                                  Left = 0
                                  Top = 0
                                  Width = 41
                                  Height = 19
                                  Align = alTop
                                  AutoSize = False
                                  Caption = 'Modelo'
                                  Layout = tlCenter
                                  ExplicitLeft = 3
                                  ExplicitTop = 20
                                  ExplicitWidth = 127
                                end
                                object ed_icms_modelo: TComboBox
                                  Left = 0
                                  Top = 19
                                  Width = 41
                                  Height = 21
                                  Align = alTop
                                  Style = csDropDownList
                                  ItemHeight = 0
                                  ItemIndex = 8
                                  TabOrder = 0
                                  Text = '55'
                                  OnChange = ed_icms_modeloChange
                                  Items.Strings = (
                                    '01'
                                    '1A'
                                    '04'
                                    '06'
                                    '21'
                                    '22'
                                    '28'
                                    '29'
                                    '55'
                                    '66')
                                end
                              end
                              object Panel54: TPanel
                                Left = 41
                                Top = 0
                                Width = 86
                                Height = 41
                                Align = alClient
                                BevelOuter = bvNone
                                Padding.Left = 3
                                TabOrder = 1
                                object Label51: TLabel
                                  Left = 3
                                  Top = 0
                                  Width = 83
                                  Height = 19
                                  Align = alTop
                                  AutoSize = False
                                  Caption = 'Tributo'
                                  Layout = tlCenter
                                  ExplicitLeft = 4
                                  ExplicitTop = 80
                                  ExplicitWidth = 97
                                end
                                object ed_icms_trib: TComboBox
                                  Left = 3
                                  Top = 19
                                  Width = 83
                                  Height = 21
                                  Align = alTop
                                  Style = csDropDownList
                                  ItemHeight = 0
                                  ItemIndex = 0
                                  TabOrder = 0
                                  Text = 'ICMS'
                                  OnChange = ed_icms_modeloChange
                                  Items.Strings = (
                                    'ICMS'
                                    'ICMSST'
                                    'ICMSUFDest')
                                end
                              end
                            end
                          end
                        end
                      end
                    end
                    object TabSheet5: TTabSheet
                      Caption = 'PIS COFINS'
                      ImageIndex = 1
                      ExplicitLeft = 0
                      ExplicitTop = 0
                      ExplicitWidth = 0
                      ExplicitHeight = 0
                      object bt_piscofins_cadastro: TSpeedButton
                        Left = 0
                        Top = 0
                        Width = 767
                        Height = 43
                        Cursor = crHandPoint
                        Align = alTop
                        Caption = 
                          'A contribui'#231#227'o do PIS COFINS n'#227'o est'#225' ativa para esta opera'#231#227'o f' +
                          'iscal. Deseja ativar?'
                        Flat = True
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clHighlight
                        Font.Height = -12
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                        OnClick = bt_piscofins_cadastroClick
                      end
                      object pn_piscofins_cadastro: TPanel
                        Left = 0
                        Top = 43
                        Width = 767
                        Height = 332
                        Align = alClient
                        BevelOuter = bvNone
                        TabOrder = 0
                        object Panel47: TPanel
                          Left = 0
                          Top = 0
                          Width = 767
                          Height = 97
                          Align = alTop
                          BevelOuter = bvNone
                          TabOrder = 0
                          object Label28: TLabel
                            Left = 13
                            Top = 6
                            Width = 51
                            Height = 13
                            Caption = 'Tributa'#231#227'o'
                          end
                          object Label29: TLabel
                            Left = 385
                            Top = 6
                            Width = 106
                            Height = 13
                            Caption = 'Motivo de desnera'#231#227'o'
                          end
                          object Label30: TLabel
                            Left = 13
                            Top = 52
                            Width = 58
                            Height = 13
                            Caption = 'Al'#237'quota PIS'
                          end
                          object Label31: TLabel
                            Left = 140
                            Top = 52
                            Width = 80
                            Height = 13
                            Caption = 'Al'#237'quota COFINS'
                          end
                          object Label32: TLabel
                            Left = 267
                            Top = 52
                            Width = 98
                            Height = 13
                            Caption = 'Natureza da Receita'
                          end
                          object ed_pc_cst: TDBLookupComboBox
                            Left = 13
                            Top = 25
                            Width = 366
                            Height = 21
                            TabOrder = 0
                          end
                          object ed_pc_deson: TDBLookupComboBox
                            Left = 385
                            Top = 23
                            Width = 345
                            Height = 21
                            TabOrder = 1
                          end
                          object ed_pc_ppis: TEditHw
                            Left = 13
                            Top = 71
                            Width = 121
                            Height = 21
                            TabOrder = 2
                            Text = '                          0,0000'
                            Formato = fNumber
                            FormatSize = '0.4'
                          end
                          object ed_pc_pcofins: TEditHw
                            Left = 140
                            Top = 71
                            Width = 121
                            Height = 21
                            TabOrder = 3
                            Text = '                          0,0000'
                            Formato = fNumber
                            FormatSize = '0.4'
                          end
                          object ed_pc_natrec: TMaskEdit
                            Left = 267
                            Top = 71
                            Width = 112
                            Height = 21
                            MaxLength = 3
                            TabOrder = 4
                            Text = 'ed_pc_natrec'
                          end
                          object Panel51: TPanel
                            Left = 737
                            Top = 0
                            Width = 30
                            Height = 97
                            Align = alRight
                            BevelOuter = bvNone
                            Padding.Top = 16
                            TabOrder = 5
                            object bt_pc_config: TSpeedButton
                              Left = 0
                              Top = 16
                              Width = 30
                              Height = 30
                              Align = alTop
                              Flat = True
                              Glyph.Data = {
                                36030000424D3603000000000000360000002800000010000000100000000100
                                18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
                                FFFFFFFFFFFFFFFFFFFFFFFFD4D4D3B4B3B0B4B3B0D5D4D4FFFFFFFFFFFFFFFF
                                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF938D7F90
                                83677C7159888379FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                                F9F9F9FEFEFEFFFFFFEAE9E98E836B7C715A746A54766E5DECECECFFFFFFFEFE
                                FEF9F9F9FFFFFFFFFFFFFFFFFFF6F6F68C85748E897D9C99938C826C82775F84
                                7A65847A65776D58756E5C96948F817C737C7669F8F8F8FFFFFFFFFFFFA3A09A
                                918468918468918468B4AC9BC0B9A9B0A692B0A692ADA38F918772746A54746A
                                54746A54A09F9AFFFFFFFEFEFE948871918468918468B7AF9DD9D5CD9B938278
                                6E58786E588D836DAEA490908671746A54746A547E7663FFFFFFFFFFFFDEDCD8
                                998D7395896EDBD7CE9F97878E8A66D4E299D3E0988C87658E846FADA38F766C
                                56807763DDDCD8FFFFFFFFFFFFFFFFFFA6A299A49A83DEDAD27D745FD3E098EC
                                FFAAECFFAACFDB957B715BB0A692817761A29F98FFFFFFFFFFFFFFFFFFFFFFFF
                                9E9A92A49982DEDAD27E7460D2DE97ECFFAAECFFAACED994827B5EE2F0A68C87
                                669B9891FFFFFFFFFFFFFFFFFFBEBDBA8E836995886DDAD6CDA199898C8765D1
                                DD96D0DB95898563ABAE7BE5F6A583795E8E826AC1C0BEFFFFFFFFFFFF968C73
                                918468918468B5AD9ADAD6CEA39F8580785D80795DA9AC7AE9FBA8B5B7829083
                                67918468988E76FFFFFFFFFFFFC2BEB5918468918468918468B5AD9AE6F5ACEC
                                FFAAECFFAAE7F9A6BABB85918468918468918468C7C2BAFFFFFFFFFFFFFCFCFC
                                AFA591B7B0A1C4BFB6A0957C958A6BA7A278A7A27895896BA1967FC4C0B7B6AF
                                A0B0A794FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F994887091
                                8468918468968A73FBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                                FFFFFFFFFFFFFFFFFFFFFFFF9F9889918468918468A39C8EFFFFFFFFFFFFFFFF
                                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7E6E5D2
                                D0CDD2D0CDE8E8E6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
                              Visible = False
                              OnClick = bt_pc_configClick
                              ExplicitTop = 1
                              ExplicitWidth = 95
                            end
                          end
                        end
                        object Panel48: TPanel
                          Left = 0
                          Top = 97
                          Width = 767
                          Height = 235
                          Align = alClient
                          BevelOuter = bvNone
                          TabOrder = 1
                          object GroupBox10: TGroupBox
                            Left = 13
                            Top = 1
                            Width = 223
                            Height = 193
                            Caption = 
                              'Base de c'#225'lculo(ja que no sped nao vai permanecer a base eu remo' +
                              'vi, ficando apenas na variavel global)'
                            TabOrder = 0
                            Visible = False
                            object Panel49: TPanel
                              Left = 89
                              Top = 15
                              Width = 132
                              Height = 176
                              Align = alClient
                              BevelOuter = bvNone
                              BorderWidth = 3
                              TabOrder = 1
                              object Label54: TLabel
                                Left = 3
                                Top = 3
                                Width = 126
                                Height = 19
                                Align = alTop
                                AutoSize = False
                                Caption = 'Campos dispon'#237'veis'
                                Layout = tlCenter
                                ExplicitLeft = 4
                                ExplicitTop = 45
                                ExplicitWidth = 127
                              end
                              object ck_pc_base: TCheckListBox
                                Left = 3
                                Top = 22
                                Width = 126
                                Height = 151
                                OnClickCheck = ck_pc_baseClickCheck
                                Align = alClient
                                ItemHeight = 13
                                Items.Strings = (
                                  'Valor'
                                  'Seguro'
                                  'Outras'
                                  'Desconto'
                                  'Frete'
                                  'ValorIPI'
                                  'ValorICMS'
                                  'Custo'
                                  'DesoneracaoICMS'
                                  'DesoneracaoPIS'
                                  'DesoneracaoCOFINS')
                                TabOrder = 0
                              end
                            end
                            object Panel50: TPanel
                              Left = 2
                              Top = 15
                              Width = 87
                              Height = 176
                              Align = alLeft
                              BevelOuter = bvNone
                              Padding.Left = 6
                              Padding.Right = 6
                              TabOrder = 0
                              object Label52: TLabel
                                Left = 6
                                Top = 0
                                Width = 75
                                Height = 19
                                Align = alTop
                                AutoSize = False
                                Caption = 'Modelo'
                                Layout = tlCenter
                                ExplicitLeft = 3
                                ExplicitTop = 20
                                ExplicitWidth = 127
                              end
                              object Label53: TLabel
                                Left = 6
                                Top = 40
                                Width = 75
                                Height = 19
                                Align = alTop
                                AutoSize = False
                                Caption = 'Entrada/Sa'#237'da'
                                Layout = tlCenter
                                ExplicitLeft = 4
                                ExplicitTop = 45
                                ExplicitWidth = 127
                              end
                              object ed_pc_modelo: TComboBox
                                Left = 6
                                Top = 19
                                Width = 75
                                Height = 21
                                Align = alTop
                                Style = csDropDownList
                                ItemHeight = 0
                                ItemIndex = 8
                                TabOrder = 0
                                Text = '55'
                                OnChange = ed_pc_modeloChange
                                Items.Strings = (
                                  '01'
                                  '1A'
                                  '04'
                                  '06'
                                  '21'
                                  '22'
                                  '28'
                                  '29'
                                  '55'
                                  '66')
                              end
                              object ed_pc_ent_sai: TComboBox
                                Left = 6
                                Top = 59
                                Width = 75
                                Height = 21
                                Align = alTop
                                Style = csDropDownList
                                ItemHeight = 0
                                ItemIndex = 0
                                TabOrder = 1
                                Text = 'Saida'
                                OnChange = ed_pc_modeloChange
                                Items.Strings = (
                                  'Saida'
                                  'Entrada')
                              end
                              object ck_pc_base_hab: TCheckBox
                                Left = 6
                                Top = 80
                                Width = 75
                                Height = 30
                                Align = alTop
                                Caption = 'Habilitar'
                                TabOrder = 2
                                OnClick = ck_pc_base_habClick
                              end
                            end
                          end
                        end
                      end
                    end
                    object TabSheet7: TTabSheet
                      Caption = 'Reten'#231#227'o Federal'
                      ImageIndex = 2
                      ExplicitLeft = 0
                      ExplicitTop = 0
                      ExplicitWidth = 0
                      ExplicitHeight = 0
                      object bt_rettrib_cadastro: TSpeedButton
                        Left = 0
                        Top = 0
                        Width = 767
                        Height = 43
                        Cursor = crHandPoint
                        Align = alTop
                        Caption = 
                          'A Reten'#231#227'o Federal n'#227'o est'#225' ativa para esta opera'#231#227'o fiscal. Des' +
                          'eja ativar?'
                        Flat = True
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clHighlight
                        Font.Height = -12
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                        OnClick = bt_rettrib_cadastroClick
                        ExplicitLeft = -7
                      end
                      object pn_rettrib_cadastro: TPanel
                        Left = 0
                        Top = 43
                        Width = 767
                        Height = 97
                        Align = alTop
                        BevelOuter = bvNone
                        TabOrder = 0
                        object Label58: TLabel
                          Left = 13
                          Top = 6
                          Width = 53
                          Height = 13
                          Caption = 'Al'#237'quota IR'
                        end
                        object Label59: TLabel
                          Left = 140
                          Top = 6
                          Width = 65
                          Height = 13
                          Caption = 'Al'#237'quota CSLL'
                        end
                        object Label60: TLabel
                          Left = 267
                          Top = 6
                          Width = 58
                          Height = 13
                          Caption = 'Al'#237'quota PIS'
                        end
                        object Label56: TLabel
                          Left = 394
                          Top = 6
                          Width = 80
                          Height = 13
                          Caption = 'Al'#237'quota COFINS'
                        end
                        object ed_ret_pir: TEditHw
                          Left = 13
                          Top = 25
                          Width = 121
                          Height = 21
                          TabOrder = 0
                          Text = '                          0,0000'
                          Formato = fNumber
                          FormatSize = '0.4'
                        end
                        object ed_ret_pcsll: TEditHw
                          Left = 140
                          Top = 25
                          Width = 121
                          Height = 21
                          TabOrder = 1
                          Text = '                          0,0000'
                          Formato = fNumber
                          FormatSize = '0.4'
                        end
                        object Panel57: TPanel
                          Left = 737
                          Top = 0
                          Width = 30
                          Height = 97
                          Align = alRight
                          BevelOuter = bvNone
                          Padding.Top = 16
                          TabOrder = 2
                        end
                        object ed_ret_ppis: TEditHw
                          Left = 267
                          Top = 25
                          Width = 121
                          Height = 21
                          TabOrder = 3
                          Text = '                          0,0000'
                          Formato = fNumber
                          FormatSize = '0.4'
                        end
                        object ed_ret_pcofins: TEditHw
                          Left = 394
                          Top = 25
                          Width = 121
                          Height = 21
                          TabOrder = 4
                          Text = '                          0,0000'
                          Formato = fNumber
                          FormatSize = '0.4'
                        end
                      end
                    end
                    object TabSheet6: TTabSheet
                      Caption = 'Condicionais'
                      ImageIndex = 2
                      ExplicitLeft = 0
                      ExplicitTop = 0
                      ExplicitWidth = 0
                      ExplicitHeight = 0
                      object Splitter3: TSplitter
                        Left = 225
                        Top = 0
                        Height = 375
                        ExplicitLeft = 384
                        ExplicitTop = 136
                        ExplicitHeight = 100
                      end
                      object GroupBox6: TGroupBox
                        Left = 0
                        Top = 0
                        Width = 225
                        Height = 375
                        Align = alLeft
                        Caption = 'Faixas de NCM'
                        TabOrder = 0
                        object Panel6: TPanel
                          Left = 2
                          Top = 15
                          Width = 221
                          Height = 358
                          Align = alClient
                          BevelOuter = bvNone
                          Padding.Left = 3
                          Padding.Top = 3
                          Padding.Right = 3
                          TabOrder = 0
                          object DBGrid2: TDBGrid
                            Left = 3
                            Top = 67
                            Width = 215
                            Height = 291
                            Align = alClient
                            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                            TabOrder = 0
                            TitleFont.Charset = DEFAULT_CHARSET
                            TitleFont.Color = clWindowText
                            TitleFont.Height = -11
                            TitleFont.Name = 'Tahoma'
                            TitleFont.Style = []
                            OnDrawColumnCell = DBGrid3DrawColumnCell
                            Columns = <
                              item
                                Expanded = False
                                FieldName = 'NCM_INI'
                                Title.Caption = 'In'#237'cio'
                                Width = 57
                                Visible = True
                              end
                              item
                                Expanded = False
                                FieldName = 'NCM_FIM'
                                Title.Caption = 'Fim'
                                Width = 67
                                Visible = True
                              end>
                          end
                          object Panel15: TPanel
                            Left = 3
                            Top = 3
                            Width = 215
                            Height = 41
                            Align = alTop
                            BevelOuter = bvNone
                            TabOrder = 1
                            object Panel40: TPanel
                              Left = 0
                              Top = 0
                              Width = 70
                              Height = 41
                              Align = alLeft
                              BevelOuter = bvNone
                              TabOrder = 0
                              object Label41: TLabel
                                Left = 0
                                Top = 0
                                Width = 27
                                Height = 13
                                Align = alTop
                                Caption = 'Inicial'
                              end
                              object ed_ncm_ini: TMaskEdit
                                Left = 0
                                Top = 13
                                Width = 70
                                Height = 21
                                Align = alTop
                                TabOrder = 0
                                Text = 'ed_ncm_ini'
                              end
                            end
                            object Panel41: TPanel
                              Left = 70
                              Top = 0
                              Width = 70
                              Height = 41
                              Align = alLeft
                              BevelOuter = bvNone
                              Padding.Left = 3
                              TabOrder = 1
                              object Label42: TLabel
                                Left = 3
                                Top = 0
                                Width = 22
                                Height = 13
                                Align = alTop
                                Caption = 'Final'
                              end
                              object ed_ncm_fim: TMaskEdit
                                Left = 3
                                Top = 13
                                Width = 67
                                Height = 21
                                Align = alTop
                                TabOrder = 0
                                Text = 'MaskEdit5'
                              end
                            end
                            object Panel42: TPanel
                              Left = 140
                              Top = 0
                              Width = 75
                              Height = 41
                              Align = alClient
                              BevelOuter = bvNone
                              Padding.Left = 6
                              Padding.Top = 6
                              Padding.Bottom = 6
                              TabOrder = 2
                              object bt_ncm_add: TSpeedButton
                                Left = 6
                                Top = 6
                                Width = 30
                                Height = 29
                                Align = alLeft
                                Flat = True
                                Glyph.Data = {
                                  36050000424D3605000000000000360400002800000010000000100000000100
                                  08000000000000010000130B0000130B000000010000000100002184290039B5
                                  520063A563006BAD840094DE8C00FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
                                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00050505050505
                                  0505050505050505050505050505050503000003050505050505050505050505
                                  0204010005050505050505050505050502040100050505050505050505050505
                                  0204010005050505050505050505050502040100050505050505050300000000
                                  0004010000000000030505020101010101010101010101010005050204040404
                                  0404010404040404000505030202020202040100000000000305050505050505
                                  0204010005050505050505050505050502040100050505050505050505050505
                                  0204010005050505050505050505050502040100050505050505050505050505
                                  0302020305050505050505050505050505050505050505050505}
                                OnClick = bt_ncm_addClick
                                ExplicitLeft = 22
                                ExplicitTop = 0
                                ExplicitHeight = 41
                              end
                              object bt_ncm_del: TSpeedButton
                                Left = 45
                                Top = 6
                                Width = 30
                                Height = 29
                                Align = alRight
                                Flat = True
                                Glyph.Data = {
                                  36050000424D3605000000000000360400002800000010000000100000000100
                                  08000000000000010000220B0000220B000000010000000100000031DE000031
                                  E7000031EF000031F700FF00FF000031FF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
                                  0404040404040404000004000004040404040404040404000004040000000404
                                  0404040404040000040404000000000404040404040000040404040402000000
                                  0404040400000404040404040404000000040000000404040404040404040400
                                  0101010004040404040404040404040401010204040404040404040404040400
                                  0201020304040404040404040404030201040403030404040404040404050203
                                  0404040405030404040404040303050404040404040303040404040303030404
                                  0404040404040403040403030304040404040404040404040404030304040404
                                  0404040404040404040404040404040404040404040404040404}
                                OnClick = bt_ncm_delClick
                                ExplicitLeft = 41
                              end
                            end
                          end
                          object usarNCMProdutoPanel: TPanel
                            Left = 3
                            Top = 44
                            Width = 215
                            Height = 23
                            Cursor = crHandPoint
                            Align = alTop
                            BevelOuter = bvNone
                            Caption = 'Usar NCM do produto 99999999'
                            Font.Charset = DEFAULT_CHARSET
                            Font.Color = clBlue
                            Font.Height = -11
                            Font.Name = 'Tahoma'
                            Font.Style = [fsBold]
                            ParentFont = False
                            TabOrder = 2
                            Visible = False
                            OnClick = usarNCMProdutoPanelClick
                          end
                        end
                      end
                      object GroupBox7: TGroupBox
                        Left = 228
                        Top = 0
                        Width = 539
                        Height = 375
                        Align = alClient
                        Caption = 'Outras condi'#231#245'es opcionais'
                        TabOrder = 1
                        object Splitter4: TSplitter
                          Left = 185
                          Top = 41
                          Height = 332
                          ExplicitLeft = 256
                          ExplicitTop = 136
                          ExplicitHeight = 100
                        end
                        object Panel24: TPanel
                          Left = 188
                          Top = 41
                          Width = 349
                          Height = 332
                          Align = alClient
                          BevelOuter = bvNone
                          Padding.Top = 18
                          TabOrder = 0
                          object DBGrid3: TDBGrid
                            Left = 0
                            Top = 18
                            Width = 349
                            Height = 314
                            Align = alClient
                            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                            TabOrder = 0
                            TitleFont.Charset = DEFAULT_CHARSET
                            TitleFont.Color = clWindowText
                            TitleFont.Height = -11
                            TitleFont.Name = 'Tahoma'
                            TitleFont.Style = []
                            OnDrawColumnCell = DBGrid3DrawColumnCell
                            Columns = <
                              item
                                Expanded = False
                                FieldName = 'COND'
                                Width = 113
                                Visible = True
                              end
                              item
                                Expanded = False
                                FieldName = 'NAME'
                                Width = 196
                                Visible = True
                              end>
                          end
                        end
                        object pn_condicionais_opcionais_top: TPanel
                          Left = 2
                          Top = 15
                          Width = 535
                          Height = 26
                          Align = alTop
                          BevelOuter = bvNone
                          Padding.Right = 6
                          TabOrder = 1
                          object bt_cond_del: TSpeedButton
                            Left = 499
                            Top = 0
                            Width = 30
                            Height = 26
                            Align = alRight
                            Flat = True
                            Glyph.Data = {
                              36050000424D3605000000000000360400002800000010000000100000000100
                              08000000000000010000220B0000220B000000010000000100000031DE000031
                              E7000031EF000031F700FF00FF000031FF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
                              0404040404040404000004000004040404040404040404000004040000000404
                              0404040404040000040404000000000404040404040000040404040402000000
                              0404040400000404040404040404000000040000000404040404040404040400
                              0101010004040404040404040404040401010204040404040404040404040400
                              0201020304040404040404040404030201040403030404040404040404050203
                              0404040405030404040404040303050404040404040303040404040303030404
                              0404040404040403040403030304040404040404040404040404030304040404
                              0404040404040404040404040404040404040404040404040404}
                            OnClick = bt_cond_delClick
                            ExplicitLeft = 0
                            ExplicitHeight = 30
                          end
                        end
                        object ScrollBox4: TScrollBox
                          Left = 2
                          Top = 41
                          Width = 183
                          Height = 332
                          VertScrollBar.Position = 135
                          Align = alLeft
                          BevelInner = bvNone
                          BevelOuter = bvNone
                          BorderStyle = bsNone
                          TabOrder = 2
                          object Panel32: TPanel
                            Left = 0
                            Top = -135
                            Width = 166
                            Height = 467
                            Align = alTop
                            BevelOuter = bvNone
                            BorderWidth = 3
                            TabOrder = 0
                            object Panel33: TPanel
                              Left = 3
                              Top = 325
                              Width = 160
                              Height = 46
                              Align = alTop
                              BevelOuter = bvNone
                              Padding.Top = 2
                              Padding.Bottom = 9
                              TabOrder = 7
                              object bt_cond_add_cid: TSpeedButton
                                Left = 137
                                Top = 15
                                Width = 23
                                Height = 22
                                Align = alRight
                                Flat = True
                                Glyph.Data = {
                                  36050000424D3605000000000000360400002800000010000000100000000100
                                  08000000000000010000130B0000130B000000010000000100002184290039B5
                                  520063A563006BAD840094DE8C00FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
                                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00050505050505
                                  0505050505050505050505050505050503000003050505050505050505050505
                                  0204010005050505050505050505050502040100050505050505050505050505
                                  0204010005050505050505050505050502040100050505050505050300000000
                                  0004010000000000030505020101010101010101010101010005050204040404
                                  0404010404040404000505030202020202040100000000000305050505050505
                                  0204010005050505050505050505050502040100050505050505050505050505
                                  0204010005050505050505050505050502040100050505050505050505050505
                                  0302020305050505050505050505050505050505050505050505}
                                OnClick = bt_cond_add_cidClick
                                ExplicitLeft = 1
                                ExplicitTop = 1
                                ExplicitHeight = 177
                              end
                              object Label33: TLabel
                                Left = 0
                                Top = 2
                                Width = 160
                                Height = 13
                                Align = alTop
                                Caption = 'Cidade'
                                ExplicitWidth = 33
                              end
                              object ed_cond_cidade: TDBLookupComboBox
                                Left = 0
                                Top = 15
                                Width = 137
                                Height = 21
                                Align = alClient
                                DropDownWidth = 350
                                TabOrder = 0
                              end
                            end
                            object Panel34: TPanel
                              Left = 3
                              Top = 279
                              Width = 160
                              Height = 46
                              Align = alTop
                              BevelOuter = bvNone
                              Padding.Top = 2
                              Padding.Bottom = 9
                              TabOrder = 6
                              object bt_cond_add_final: TSpeedButton
                                Left = 137
                                Top = 15
                                Width = 23
                                Height = 22
                                Align = alRight
                                Flat = True
                                Glyph.Data = {
                                  36050000424D3605000000000000360400002800000010000000100000000100
                                  08000000000000010000130B0000130B000000010000000100002184290039B5
                                  520063A563006BAD840094DE8C00FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
                                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00050505050505
                                  0505050505050505050505050505050503000003050505050505050505050505
                                  0204010005050505050505050505050502040100050505050505050505050505
                                  0204010005050505050505050505050502040100050505050505050300000000
                                  0004010000000000030505020101010101010101010101010005050204040404
                                  0404010404040404000505030202020202040100000000000305050505050505
                                  0204010005050505050505050505050502040100050505050505050505050505
                                  0204010005050505050505050505050502040100050505050505050505050505
                                  0302020305050505050505050505050505050505050505050505}
                                OnClick = bt_cond_add_finalClick
                                ExplicitLeft = 1
                                ExplicitTop = 1
                                ExplicitHeight = 177
                              end
                              object Label36: TLabel
                                Left = 0
                                Top = 2
                                Width = 160
                                Height = 13
                                Align = alTop
                                Caption = 'Finalidade'
                                ExplicitWidth = 48
                              end
                              object ed_cond_finalidade: TDBLookupComboBox
                                Left = 0
                                Top = 15
                                Width = 137
                                Height = 21
                                Align = alClient
                                DropDownWidth = 350
                                TabOrder = 0
                              end
                            end
                            object Panel35: TPanel
                              Left = 3
                              Top = 95
                              Width = 160
                              Height = 46
                              Align = alTop
                              BevelOuter = bvNone
                              Padding.Top = 2
                              Padding.Bottom = 9
                              TabOrder = 2
                              object bt_cond_add_contrib: TSpeedButton
                                Left = 137
                                Top = 15
                                Width = 23
                                Height = 22
                                Align = alRight
                                Flat = True
                                Glyph.Data = {
                                  36050000424D3605000000000000360400002800000010000000100000000100
                                  08000000000000010000130B0000130B000000010000000100002184290039B5
                                  520063A563006BAD840094DE8C00FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
                                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00050505050505
                                  0505050505050505050505050505050503000003050505050505050505050505
                                  0204010005050505050505050505050502040100050505050505050505050505
                                  0204010005050505050505050505050502040100050505050505050300000000
                                  0004010000000000030505020101010101010101010101010005050204040404
                                  0404010404040404000505030202020202040100000000000305050505050505
                                  0204010005050505050505050505050502040100050505050505050505050505
                                  0204010005050505050505050505050502040100050505050505050505050505
                                  0302020305050505050505050505050505050505050505050505}
                                OnClick = bt_cond_add_contribClick
                                ExplicitLeft = 1
                                ExplicitTop = 1
                                ExplicitHeight = 177
                              end
                              object Label35: TLabel
                                Left = 0
                                Top = 2
                                Width = 160
                                Height = 13
                                Align = alTop
                                Caption = 'Contribuinte'
                                ExplicitWidth = 59
                              end
                              object ed_cond_contrib: TComboBox
                                Left = 0
                                Top = 15
                                Width = 137
                                Height = 21
                                Align = alClient
                                Style = csDropDownList
                                ItemHeight = 0
                                TabOrder = 0
                                Items.Strings = (
                                  '1 - Contribuinte'
                                  '2 - Isento'
                                  '9 - N'#227'o Contribuinte')
                              end
                            end
                            object Panel36: TPanel
                              Left = 3
                              Top = 49
                              Width = 160
                              Height = 46
                              Align = alTop
                              BevelOuter = bvNone
                              Padding.Top = 2
                              Padding.Bottom = 9
                              TabOrder = 1
                              object bt_cond_add_consfinal: TSpeedButton
                                Left = 137
                                Top = 15
                                Width = 23
                                Height = 22
                                Align = alRight
                                Flat = True
                                Glyph.Data = {
                                  36050000424D3605000000000000360400002800000010000000100000000100
                                  08000000000000010000130B0000130B000000010000000100002184290039B5
                                  520063A563006BAD840094DE8C00FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
                                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00050505050505
                                  0505050505050505050505050505050503000003050505050505050505050505
                                  0204010005050505050505050505050502040100050505050505050505050505
                                  0204010005050505050505050505050502040100050505050505050300000000
                                  0004010000000000030505020101010101010101010101010005050204040404
                                  0404010404040404000505030202020202040100000000000305050505050505
                                  0204010005050505050505050505050502040100050505050505050505050505
                                  0204010005050505050505050505050502040100050505050505050505050505
                                  0302020305050505050505050505050505050505050505050505}
                                OnClick = bt_cond_add_consfinalClick
                                ExplicitLeft = 1
                                ExplicitTop = 1
                                ExplicitHeight = 177
                              end
                              object Label34: TLabel
                                Left = 0
                                Top = 2
                                Width = 160
                                Height = 13
                                Align = alTop
                                Caption = 'Consumidor Final'
                                ExplicitWidth = 81
                              end
                              object ed_cond_consfinal: TComboBox
                                Left = 0
                                Top = 15
                                Width = 137
                                Height = 21
                                Align = alClient
                                Style = csDropDownList
                                ItemHeight = 0
                                TabOrder = 0
                                Items.Strings = (
                                  'Sim'
                                  'Nao')
                              end
                            end
                            object Panel37: TPanel
                              Left = 3
                              Top = 141
                              Width = 160
                              Height = 46
                              Align = alTop
                              BevelOuter = bvNone
                              Padding.Top = 2
                              Padding.Bottom = 9
                              TabOrder = 3
                              object bt_cond_add_pessoa: TSpeedButton
                                Left = 137
                                Top = 15
                                Width = 23
                                Height = 22
                                Align = alRight
                                Flat = True
                                Glyph.Data = {
                                  36050000424D3605000000000000360400002800000010000000100000000100
                                  08000000000000010000130B0000130B000000010000000100002184290039B5
                                  520063A563006BAD840094DE8C00FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
                                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00050505050505
                                  0505050505050505050505050505050503000003050505050505050505050505
                                  0204010005050505050505050505050502040100050505050505050505050505
                                  0204010005050505050505050505050502040100050505050505050300000000
                                  0004010000000000030505020101010101010101010101010005050204040404
                                  0404010404040404000505030202020202040100000000000305050505050505
                                  0204010005050505050505050505050502040100050505050505050505050505
                                  0204010005050505050505050505050502040100050505050505050505050505
                                  0302020305050505050505050505050505050505050505050505}
                                OnClick = bt_cond_add_pessoaClick
                                ExplicitLeft = 1
                                ExplicitTop = 1
                                ExplicitHeight = 177
                              end
                              object Label37: TLabel
                                Left = 0
                                Top = 2
                                Width = 160
                                Height = 13
                                Align = alTop
                                Caption = 'Pessoa'
                                ExplicitWidth = 34
                              end
                              object ed_cond_pessoa: TComboBox
                                Left = 0
                                Top = 15
                                Width = 137
                                Height = 21
                                Align = alClient
                                Style = csDropDownList
                                ItemHeight = 0
                                TabOrder = 0
                                Items.Strings = (
                                  'PJ - Pessoa Jur'#237'dica'
                                  'PF - Pessoa F'#237'sica')
                              end
                            end
                            object Panel38: TPanel
                              Left = 3
                              Top = 187
                              Width = 160
                              Height = 46
                              Align = alTop
                              BevelOuter = bvNone
                              Padding.Top = 2
                              Padding.Bottom = 9
                              TabOrder = 4
                              object bt_cond_add_tipoitem: TSpeedButton
                                Left = 137
                                Top = 15
                                Width = 23
                                Height = 22
                                Align = alRight
                                Flat = True
                                Glyph.Data = {
                                  36050000424D3605000000000000360400002800000010000000100000000100
                                  08000000000000010000130B0000130B000000010000000100002184290039B5
                                  520063A563006BAD840094DE8C00FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
                                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00050505050505
                                  0505050505050505050505050505050503000003050505050505050505050505
                                  0204010005050505050505050505050502040100050505050505050505050505
                                  0204010005050505050505050505050502040100050505050505050300000000
                                  0004010000000000030505020101010101010101010101010005050204040404
                                  0404010404040404000505030202020202040100000000000305050505050505
                                  0204010005050505050505050505050502040100050505050505050505050505
                                  0204010005050505050505050505050502040100050505050505050505050505
                                  0302020305050505050505050505050505050505050505050505}
                                OnClick = bt_cond_add_tipoitemClick
                                ExplicitLeft = 1
                                ExplicitTop = 1
                                ExplicitHeight = 177
                              end
                              object Label38: TLabel
                                Left = 0
                                Top = 2
                                Width = 160
                                Height = 13
                                Align = alTop
                                Caption = 'Tipo Item'
                                ExplicitWidth = 45
                              end
                              object ed_cond_tipo_item: TComboBox
                                Left = 0
                                Top = 15
                                Width = 137
                                Height = 21
                                Align = alClient
                                Style = csDropDownList
                                ItemHeight = 0
                                TabOrder = 0
                                Items.Strings = (
                                  '00 - Mercadoria para Revenda;'
                                  '01 - Mat'#233'ria-Prima;'
                                  '02 - Embalagem;'
                                  '03 - Produto em Processo;'
                                  '04 - Produto Acabado;'
                                  '05 - Subproduto;'
                                  '06 - Produto Intermedi'#225'rio;'
                                  '07 - Material de Uso e Consumo;'
                                  '08 - Ativo Imobilizado;'
                                  '09 - Servi'#231'os;'
                                  '10 - Outros insumos;'
                                  '99 - Outras')
                              end
                            end
                            object Panel39: TPanel
                              Left = 3
                              Top = 233
                              Width = 160
                              Height = 46
                              Align = alTop
                              BevelOuter = bvNone
                              Padding.Top = 2
                              Padding.Bottom = 9
                              TabOrder = 5
                              object bt_cond_add_tiponf: TSpeedButton
                                Left = 137
                                Top = 15
                                Width = 23
                                Height = 22
                                Align = alRight
                                Flat = True
                                Glyph.Data = {
                                  36050000424D3605000000000000360400002800000010000000100000000100
                                  08000000000000010000130B0000130B000000010000000100002184290039B5
                                  520063A563006BAD840094DE8C00FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
                                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00050505050505
                                  0505050505050505050505050505050503000003050505050505050505050505
                                  0204010005050505050505050505050502040100050505050505050505050505
                                  0204010005050505050505050505050502040100050505050505050300000000
                                  0004010000000000030505020101010101010101010101010005050204040404
                                  0404010404040404000505030202020202040100000000000305050505050505
                                  0204010005050505050505050505050502040100050505050505050505050505
                                  0204010005050505050505050505050502040100050505050505050505050505
                                  0302020305050505050505050505050505050505050505050505}
                                OnClick = bt_cond_add_tiponfClick
                                ExplicitLeft = 1
                                ExplicitTop = 1
                                ExplicitHeight = 177
                              end
                              object Label39: TLabel
                                Left = 0
                                Top = 2
                                Width = 160
                                Height = 13
                                Align = alTop
                                Caption = 'Tipo Nota Fiscal'
                                ExplicitWidth = 75
                              end
                              object ed_cond_tipo_nf: TComboBox
                                Left = 0
                                Top = 15
                                Width = 137
                                Height = 21
                                Align = alClient
                                Style = csDropDownList
                                ItemHeight = 0
                                TabOrder = 0
                                Items.Strings = (
                                  '0 - Produtos'
                                  '1 - Servi'#231'os'
                                  '2 - Ve'#237'culos Novos'
                                  '3 - Ve'#237'culos Usados'
                                  '4 - Outras'
                                  '5 - Despesas')
                              end
                            end
                            object Panel31: TPanel
                              Left = 3
                              Top = 3
                              Width = 160
                              Height = 46
                              HelpType = htKeyword
                              Align = alTop
                              BevelOuter = bvNone
                              Padding.Top = 2
                              Padding.Bottom = 9
                              TabOrder = 0
                              object bt_cond_add_uf: TSpeedButton
                                Left = 137
                                Top = 15
                                Width = 23
                                Height = 22
                                Align = alRight
                                Flat = True
                                Glyph.Data = {
                                  36050000424D3605000000000000360400002800000010000000100000000100
                                  08000000000000010000130B0000130B000000010000000100002184290039B5
                                  520063A563006BAD840094DE8C00FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
                                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00050505050505
                                  0505050505050505050505050505050503000003050505050505050505050505
                                  0204010005050505050505050505050502040100050505050505050505050505
                                  0204010005050505050505050505050502040100050505050505050300000000
                                  0004010000000000030505020101010101010101010101010005050204040404
                                  0404010404040404000505030202020202040100000000000305050505050505
                                  0204010005050505050505050505050502040100050505050505050505050505
                                  0204010005050505050505050505050502040100050505050505050505050505
                                  0302020305050505050505050505050505050505050505050505}
                                OnClick = bt_cond_add_ufClick
                                ExplicitLeft = 1
                                ExplicitTop = 1
                                ExplicitHeight = 177
                              end
                              object bt_cond_edit_uf: TSpeedButton
                                Left = 114
                                Top = 15
                                Width = 23
                                Height = 22
                                Align = alRight
                                Flat = True
                                Glyph.Data = {
                                  36050000424D3605000000000000360400002800000010000000100000000100
                                  08000000000000010000420B0000420B00000001000000010000000000000084
                                  0000210021005A4A29004A3939005A5242004A4A4A005A524A0073524A005A52
                                  52006300630073737300BD847B00C6947B00CE9C7B00B58484009C948400BD94
                                  9400EFCE9400F7CE9400C6A59C00EFCE9C00F7CE9C00F7D69C00C6ADA500CEAD
                                  A500F7D6A500C6ADAD00CEB5AD00D6B5AD00EFD6AD00F7D6AD00C6B5B500D6BD
                                  B500DEBDB500DEC6B500E7C6B500EFC6B500EFCEB500F7D6B500F7DEB500D6C6
                                  BD00DECEBD00EFCEBD00F7DEBD0000C6C600C6C6C600D6CEC600F7DEC600F7E7
                                  C600E7CECE00E7D6CE00F7E7CE00E7D6D600F7E7D600FFE7D600FFEFD600FFEF
                                  DE00FFEFE700FFF7E70021F7EF00FFF7EF0018F7F700FFF7F700FFFFF700FF00
                                  FF0000FFFF0021FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
                                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0041410F0F0F0F
                                  0F0F0F0F0F0F0F0F0F4141411438312C281E1A15121212170F41414114382E2E
                                  2E2E2E2E2E2E2E150F414141183A3634302C1E15151512150F414141183B3634
                                  31302805151515120F4141411C402E2E2E2E2E06002E2E150F4141411D443D3A
                                  363431070000291E0F41414121443F3D39363407422D00290F41414121442E2E
                                  2E2E2E0B3E2D002911414141224444443F3A393609422D001B41414123444444
                                  443F3A3910432D002041414124442E2E2E2E2E2E3604422D0041414124444444
                                  4444444032083C2D004141412B44444444444444330D030001004141243F3D3D
                                  3D3D3D3D320D0801010241412426262626242426210C410A0A41}
                                OnClick = bt_cond_edit_ufClick
                                ExplicitLeft = 1
                                ExplicitTop = 1
                                ExplicitHeight = 177
                              end
                              object Label40: TLabel
                                Left = 0
                                Top = 2
                                Width = 38
                                Height = 13
                                Align = alTop
                                Caption = 'Estados'
                              end
                              object ed_cond_estados: TMaskEdit
                                Left = 0
                                Top = 15
                                Width = 114
                                Height = 22
                                Align = alClient
                                TabOrder = 0
                                Text = 'ed_cond_estados'
                                ExplicitHeight = 21
                              end
                            end
                            object Panel43: TPanel
                              Left = 3
                              Top = 371
                              Width = 160
                              Height = 46
                              Align = alTop
                              BevelOuter = bvNone
                              Padding.Top = 2
                              Padding.Bottom = 9
                              TabOrder = 8
                              object bt_cond_add_cst_icms: TSpeedButton
                                Left = 137
                                Top = 15
                                Width = 23
                                Height = 22
                                Align = alRight
                                Flat = True
                                Glyph.Data = {
                                  36050000424D3605000000000000360400002800000010000000100000000100
                                  08000000000000010000130B0000130B000000010000000100002184290039B5
                                  520063A563006BAD840094DE8C00FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
                                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00050505050505
                                  0505050505050505050505050505050503000003050505050505050505050505
                                  0204010005050505050505050505050502040100050505050505050505050505
                                  0204010005050505050505050505050502040100050505050505050300000000
                                  0004010000000000030505020101010101010101010101010005050204040404
                                  0404010404040404000505030202020202040100000000000305050505050505
                                  0204010005050505050505050505050502040100050505050505050505050505
                                  0204010005050505050505050505050502040100050505050505050505050505
                                  0302020305050505050505050505050505050505050505050505}
                                OnClick = bt_cond_add_cst_icmsClick
                                ExplicitLeft = 1
                                ExplicitTop = 1
                                ExplicitHeight = 177
                              end
                              object Label43: TLabel
                                Left = 0
                                Top = 2
                                Width = 160
                                Height = 13
                                Align = alTop
                                Caption = 'CST ICMS Cadastro'
                                ExplicitWidth = 94
                              end
                              object ed_cond_cst_icms: TComboBox
                                Left = 0
                                Top = 15
                                Width = 137
                                Height = 21
                                Align = alClient
                                Style = csDropDownList
                                ItemHeight = 0
                                TabOrder = 0
                                Items.Strings = (
                                  '00'
                                  '10'
                                  '20'
                                  '30'
                                  '40'
                                  '41'
                                  '50'
                                  '51'
                                  '60'
                                  '70'
                                  '90')
                              end
                            end
                            object Panel44: TPanel
                              Left = 3
                              Top = 417
                              Width = 160
                              Height = 46
                              Align = alTop
                              BevelOuter = bvNone
                              Padding.Top = 2
                              Padding.Bottom = 9
                              TabOrder = 9
                              object bt_cond_add_cst_pis_sai: TSpeedButton
                                Left = 137
                                Top = 15
                                Width = 23
                                Height = 22
                                Align = alRight
                                Flat = True
                                Glyph.Data = {
                                  36050000424D3605000000000000360400002800000010000000100000000100
                                  08000000000000010000130B0000130B000000010000000100002184290039B5
                                  520063A563006BAD840094DE8C00FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
                                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00050505050505
                                  0505050505050505050505050505050503000003050505050505050505050505
                                  0204010005050505050505050505050502040100050505050505050505050505
                                  0204010005050505050505050505050502040100050505050505050300000000
                                  0004010000000000030505020101010101010101010101010005050204040404
                                  0404010404040404000505030202020202040100000000000305050505050505
                                  0204010005050505050505050505050502040100050505050505050505050505
                                  0204010005050505050505050505050502040100050505050505050505050505
                                  0302020305050505050505050505050505050505050505050505}
                                OnClick = bt_cond_add_cst_pis_saiClick
                                ExplicitLeft = 1
                                ExplicitTop = 1
                                ExplicitHeight = 177
                              end
                              object Label44: TLabel
                                Left = 0
                                Top = 2
                                Width = 160
                                Height = 13
                                Align = alTop
                                Caption = 'CST Sa'#237'da PISCOFINS Cadastro'
                                ExplicitWidth = 152
                              end
                              object ed_cond_cst_pis_sai: TComboBox
                                Left = 0
                                Top = 15
                                Width = 137
                                Height = 21
                                Align = alClient
                                Style = csDropDownList
                                ItemHeight = 0
                                TabOrder = 0
                                Items.Strings = (
                                  '01'
                                  '02'
                                  '03'
                                  '04'
                                  '05'
                                  '06'
                                  '07'
                                  '08'
                                  '09')
                              end
                            end
                          end
                        end
                      end
                    end
                    object tsOutras: TTabSheet
                      Caption = 'Outras configura'#231#245'es'
                      ImageIndex = 3
                      ExplicitLeft = 0
                      ExplicitTop = 0
                      ExplicitWidth = 0
                      ExplicitHeight = 0
                      object GroupBox9: TGroupBox
                        Left = 191
                        Top = 0
                        Width = 185
                        Height = 145
                        Caption = 'Base de c'#225'lculo do PISCOFINS'
                        TabOrder = 0
                        object Panel46: TPanel
                          Left = 2
                          Top = 15
                          Width = 181
                          Height = 128
                          Align = alClient
                          BevelOuter = bvNone
                          BorderWidth = 3
                          TabOrder = 0
                          object CheckListBox2: TCheckListBox
                            Left = 3
                            Top = 20
                            Width = 175
                            Height = 105
                            Align = alClient
                            ItemHeight = 13
                            Items.Strings = (
                              'Valor'
                              'Seguro'
                              'Outras'
                              'Desconto'
                              'Frete'
                              'ValorIPI'
                              'Custo')
                            TabOrder = 0
                          end
                          object CheckBox4: TCheckBox
                            Left = 3
                            Top = 3
                            Width = 175
                            Height = 17
                            Align = alTop
                            Caption = 'Usar padr'#227'o do PISCOFINS'
                            TabOrder = 1
                          end
                        end
                      end
                      object ed_memo: TMemo
                        Left = 3
                        Top = 16
                        Width = 102
                        Height = 65
                        Lines.Strings = (
                          'Memo1')
                        TabOrder = 1
                      end
                    end
                    object TabSheet4: TTabSheet
                      Caption = 'Outras'
                      ImageIndex = 4
                      ExplicitLeft = 0
                      ExplicitTop = 0
                      ExplicitWidth = 0
                      ExplicitHeight = 0
                      object Label55: TLabel
                        Left = 13
                        Top = 6
                        Width = 125
                        Height = 13
                        Caption = 'Informa'#231#227'o complementar'
                      end
                      object ed_cod_inf: TDBLookupComboBox
                        Left = 13
                        Top = 25
                        Width = 366
                        Height = 21
                        DataField = 'COD_INF'
                        TabOrder = 0
                      end
                    end
                    object TabSheet8: TTabSheet
                      Caption = 'Produtos'
                      ImageIndex = 5
                      ExplicitLeft = 0
                      ExplicitTop = 0
                      ExplicitWidth = 0
                      ExplicitHeight = 0
                      object grid_prod: TDBGrid
                        Left = 0
                        Top = 49
                        Width = 767
                        Height = 326
                        Align = alClient
                        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                        TabOrder = 0
                        TitleFont.Charset = DEFAULT_CHARSET
                        TitleFont.Color = clWindowText
                        TitleFont.Height = -11
                        TitleFont.Name = 'Tahoma'
                        TitleFont.Style = []
                      end
                      object Panel55: TPanel
                        Left = 0
                        Top = 0
                        Width = 767
                        Height = 49
                        Align = alTop
                        BevelOuter = bvNone
                        TabOrder = 1
                        object SpeedButton9: TSpeedButton
                          Left = 0
                          Top = 0
                          Width = 767
                          Height = 43
                          Align = alTop
                          Caption = 'Visualizar produtos para a faixa de NCM'
                          Flat = True
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clHighlight
                          Font.Height = -12
                          Font.Name = 'Tahoma'
                          Font.Style = [fsBold]
                          ParentFont = False
                          OnClick = SpeedButton9Click
                        end
                      end
                    end
                  end
                  object Panel4: TPanel
                    Left = 0
                    Top = 0
                    Width = 775
                    Height = 49
                    Align = alTop
                    BevelOuter = bvNone
                    TabOrder = 1
                    object Label6: TLabel
                      Left = 17
                      Top = 0
                      Width = 33
                      Height = 13
                      Caption = 'Codigo'
                      FocusControl = ed_id
                    end
                    object Label7: TLabel
                      Left = 157
                      Top = 0
                      Width = 46
                      Height = 13
                      Caption = 'Descri'#231#227'o'
                      FocusControl = ed_descr
                    end
                    object lb_data_cad: TDBText
                      Left = 487
                      Top = 23
                      Width = 130
                      Height = 17
                      DataField = 'DATA_CADASTRO'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label45: TLabel
                      Left = 487
                      Top = 0
                      Width = 68
                      Height = 13
                      Caption = 'Data cadastro'
                      FocusControl = ed_descr
                    end
                    object lb_data_mod: TDBText
                      Left = 625
                      Top = 23
                      Width = 130
                      Height = 17
                      DataField = 'DATA_MODIFICACAO'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label46: TLabel
                      Left = 625
                      Top = 0
                      Width = 82
                      Height = 13
                      Caption = 'Data modifica'#231#227'o'
                      FocusControl = ed_descr
                    end
                    object ed_id: TDBEdit
                      Left = 17
                      Top = 19
                      Width = 134
                      Height = 21
                      DataField = 'ID'
                      Enabled = False
                      TabOrder = 0
                    end
                    object ed_descr: TDBEdit
                      Left = 157
                      Top = 19
                      Width = 324
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'DESCRICAO'
                      TabOrder = 1
                    end
                  end
                end
              end
            end
            inherited Panel3: TPanel
              Top = 486
              ExplicitTop = 486
              inherited BitBtn4: TBitBtn
                Top = 10
                ExplicitTop = 10
              end
              inherited BitBtn5: TBitBtn
                Top = 10
                ExplicitTop = 10
              end
              inherited BitBtn6: TBitBtn
                Top = 10
                ExplicitTop = 10
              end
            end
          end
        end
        inherited TabSheet2: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 783
          ExplicitHeight = 534
          inherited GroupBox3: TGroupBox
            object ncmProdutoEmEdicaoLabel: TLabel [6]
              Left = 424
              Top = 48
              Width = 175
              Height = 13
              Caption = 'NCM do produto em edi'#231#227'o: 999999 '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              Visible = False
            end
            inherited CheckBox3: TCheckBox
              Left = 587
              Visible = False
              ExplicitLeft = 587
            end
            inherited CheckBox1: TCheckBox
              Left = 683
              Top = 50
              Visible = False
              ExplicitLeft = 683
              ExplicitTop = 50
            end
            object ck_lixeira: TCheckBox
              Left = 257
              Top = 45
              Width = 145
              Height = 17
              Caption = 'Pesquisar na Lixeira'
              TabOrder = 11
            end
          end
          inherited Panel1: TPanel
            Height = 461
            ExplicitHeight = 461
            inherited Splitter1: TSplitter
              Height = 400
              ExplicitHeight = 376
            end
            inherited DBGrid1: TDBGrid
              Height = 400
              OnKeyDown = DBGrid1KeyDown
            end
            inherited Panel2: TPanel
              inherited SpeedButton2: TSpeedButton
                OnClick = SpeedButton2Click
              end
              inherited SpeedButton3: TSpeedButton
                Left = 657
                Visible = False
                ExplicitLeft = 657
              end
              inherited SpeedButton4: TSpeedButton
                Left = 714
                Visible = False
                ExplicitLeft = 714
              end
              inherited SpeedButton5: TSpeedButton
                Left = 121
                OnClick = SpeedButton5Click
                ExplicitLeft = 121
              end
              inherited SpeedButton6: TSpeedButton
                Left = 176
                ExplicitLeft = 176
              end
              inherited SpeedButton7: TSpeedButton
                Visible = False
              end
              inherited SpeedButton8: TSpeedButton
                Left = 691
                Top = 6
                Visible = False
                ExplicitLeft = 691
                ExplicitTop = 6
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
                Left = 675
                Top = 6
                Visible = False
                ExplicitLeft = 675
                ExplicitTop = 6
              end
              inherited SpeedButton26: TSpeedButton
                Left = 634
                Top = 6
                Visible = False
                ExplicitLeft = 634
                ExplicitTop = 6
              end
            end
            inherited GroupBox2: TGroupBox
              Height = 400
              ExplicitHeight = 400
              inherited ScrollBox2: TScrollBox
                Height = 383
                ExplicitHeight = 383
              end
            end
          end
        end
        inherited tsMemo: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 783
          ExplicitHeight = 534
        end
      end
    end
    inherited PanelFlash: TPanel
      Left = 1000
      ExplicitLeft = 1000
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 569
    ExplicitTop = 569
  end
  inherited pnStatusProcessamento: TPanel
    Left = 1200
    ExplicitLeft = 1200
    inherited lbTextoProcessamento: TLabel
      Width = 477
      Height = 21
    end
  end
  inherited PopupMenu1: TPopupMenu
    Left = 652
    Top = 529
  end
  inherited PopupMenu2: TPopupMenu
    Left = 758
    Top = 531
  end
  inherited Timer1: TTimer
    Left = 718
    Top = 531
  end
  inherited ApplicationEventsPadrao: TApplicationEvents
    Left = 686
    Top = 531
  end
end
