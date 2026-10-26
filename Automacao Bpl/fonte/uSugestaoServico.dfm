inherited frmSugestaoServico: TfrmSugestaoServico
  Caption = 'Sugest'#227'o Servi'#231'o'
  ClientWidth = 852
  ExplicitWidth = 860
  ExplicitHeight = 598
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelFundo: TPanel
    Width = 852
    ExplicitWidth = 852
    inherited PanelLeft: TPanel
      Width = 847
      ExplicitWidth = 847
      inherited PageControl1: TPageControl
        Width = 845
        ExplicitWidth = 845
        inherited TabSheet1: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 837
          ExplicitHeight = 510
          inherited ScrollBox1: TScrollBox
            Width = 837
            ExplicitWidth = 837
            inherited PageControl3: TPageControl
              Width = 837
              ActivePage = TabSheet4
              ExplicitWidth = 837
              inherited TabSheet3: TTabSheet
                ExplicitLeft = 4
                ExplicitTop = 27
                ExplicitWidth = 829
                ExplicitHeight = 431
                inherited ScrollBox3: TScrollBox
                  Width = 829
                  ExplicitWidth = 829
                  inherited GroupBox1: TGroupBox
                    Width = 825
                    ExplicitWidth = 825
                  end
                end
              end
              object TabSheet4: TTabSheet
                Caption = 'TabSheet4'
                ImageIndex = 1
                ExplicitLeft = 0
                ExplicitTop = 0
                ExplicitWidth = 0
                ExplicitHeight = 0
                object ScrollBox5: TScrollBox
                  Left = 0
                  Top = 0
                  Width = 829
                  Height = 431
                  Align = alClient
                  TabOrder = 0
                  object GroupBox5: TGroupBox
                    Left = 0
                    Top = 0
                    Width = 825
                    Height = 427
                    Align = alTop
                    Caption = 'Sugest'#245'es de Servi'#231'o'
                    TabOrder = 0
                    object pnSugestaoServ: TPanel
                      Left = 2
                      Top = 15
                      Width = 767
                      Height = 409
                      TabOrder = 0
                      object GroupBox6: TGroupBox
                        Left = 1
                        Top = 109
                        Width = 765
                        Height = 137
                        Align = alTop
                        Caption = 'Servi'#231'os'
                        TabOrder = 0
                        object DBGrid2: TDBGrid
                          Left = 2
                          Top = 15
                          Width = 761
                          Height = 120
                          Align = alClient
                          DataSource = DtmCadBasicos.dsSugestaoServItens
                          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                          TabOrder = 0
                          TitleFont.Charset = DEFAULT_CHARSET
                          TitleFont.Color = clWindowText
                          TitleFont.Height = -11
                          TitleFont.Name = 'Tahoma'
                          TitleFont.Style = []
                          OnCellClick = DBGrid2CellClick
                          OnDrawColumnCell = DBGrid2DrawColumnCell
                          OnDblClick = DBGrid2DblClick
                          OnKeyDown = DBGrid2KeyDown
                          OnTitleClick = DBGrid2TitleClick
                        end
                      end
                      object Panel7: TPanel
                        Left = 1
                        Top = 1
                        Width = 765
                        Height = 108
                        Align = alTop
                        BevelOuter = bvNone
                        TabOrder = 1
                        object Label6: TLabel
                          Left = 34
                          Top = 12
                          Width = 66
                          Height = 13
                          Caption = 'Cod Cliente:'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = [fsBold]
                          ParentFont = False
                        end
                        object lbTipo: TLabel
                          Left = 359
                          Top = 38
                          Width = 43
                          Height = 13
                          Alignment = taRightJustify
                          Caption = 'Ve'#237'culo:'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = [fsBold]
                          ParentFont = False
                        end
                        object Label8: TLabel
                          Left = 14
                          Top = 38
                          Width = 86
                          Height = 13
                          Caption = 'Nome Fantasia:'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = [fsBold]
                          ParentFont = False
                        end
                        object Label9: TLabel
                          Left = 26
                          Top = 64
                          Width = 74
                          Height = 13
                          Caption = 'Raz'#227'o Social:'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = [fsBold]
                          ParentFont = False
                        end
                        object lbChassi: TLabel
                          Left = 363
                          Top = 64
                          Width = 39
                          Height = 13
                          Caption = 'Chassi:'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = [fsBold]
                          ParentFont = False
                        end
                        object lbPlaca: TLabel
                          Left = 578
                          Top = 64
                          Width = 33
                          Height = 13
                          Caption = 'Placa:'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = [fsBold]
                          ParentFont = False
                        end
                        object lbCodigo: TLabel
                          Left = 335
                          Top = 12
                          Width = 67
                          Height = 13
                          Alignment = taRightJustify
                          Caption = 'Cod Ve'#237'culo:'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = [fsBold]
                          ParentFont = False
                        end
                        object Label13: TLabel
                          Left = 206
                          Top = 12
                          Width = 30
                          Height = 13
                          Caption = 'Data:'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = [fsBold]
                          ParentFont = False
                        end
                        object Label211: TLabel
                          Left = 538
                          Top = 87
                          Width = 89
                          Height = 13
                          Caption = 'F2 - Marca linha'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clRed
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = [fsBold]
                          ParentFont = False
                        end
                        object Label212: TLabel
                          Left = 650
                          Top = 87
                          Width = 108
                          Height = 13
                          Caption = 'F3 - Demarca Linha'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clRed
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = [fsBold]
                          ParentFont = False
                        end
                        object DBText1: TDBText
                          Left = 101
                          Top = 12
                          Width = 65
                          Height = 17
                          DataField = 'COD_CLIENTE'
                          DataSource = DtmCadBasicos.dsSugestaoServ
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clBlue
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = [fsBold]
                          ParentFont = False
                        end
                        object DBText2: TDBText
                          Left = 101
                          Top = 38
                          Width = 246
                          Height = 17
                          DataField = 'NOME_CLIENTE'
                          DataSource = DtmCadBasicos.dsSugestaoServ
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clBlue
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = [fsBold]
                          ParentFont = False
                        end
                        object DBText3: TDBText
                          Left = 101
                          Top = 64
                          Width = 250
                          Height = 17
                          DataField = 'RAZAO'
                          DataSource = DtmCadBasicos.dsSugestaoServ
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clBlue
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = [fsBold]
                          ParentFont = False
                        end
                        object DBText4: TDBText
                          Left = 237
                          Top = 12
                          Width = 85
                          Height = 17
                          DataField = 'DATA'
                          DataSource = DtmCadBasicos.dsSugestaoServ
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clBlue
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = [fsBold]
                          ParentFont = False
                        end
                        object DBTextCodigo: TDBText
                          Left = 403
                          Top = 12
                          Width = 65
                          Height = 17
                          DataField = 'COD_VEIC'
                          DataSource = DtmCadBasicos.dsSugestaoServ
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clBlue
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = [fsBold]
                          ParentFont = False
                        end
                        object DBText6: TDBText
                          Left = 403
                          Top = 38
                          Width = 334
                          Height = 17
                          DataField = 'DESCRICAO_TP'
                          DataSource = DtmCadBasicos.dsSugestaoServ
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clBlue
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = [fsBold]
                          ParentFont = False
                        end
                        object DBTextChassi: TDBText
                          Left = 403
                          Top = 64
                          Width = 148
                          Height = 17
                          DataField = 'CHASSI'
                          DataSource = DtmCadBasicos.dsSugestaoServ
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clBlue
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = [fsBold]
                          ParentFont = False
                        end
                        object DBTextPlaca: TDBText
                          Left = 613
                          Top = 64
                          Width = 65
                          Height = 17
                          DataField = 'PLACA'
                          DataSource = DtmCadBasicos.dsSugestaoServ
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clBlue
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = [fsBold]
                          ParentFont = False
                        end
                        object Label10: TLabel
                          Left = 631
                          Top = 12
                          Width = 40
                          Height = 13
                          Alignment = taRightJustify
                          Caption = 'Status:'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = [fsBold]
                          ParentFont = False
                        end
                        object DBText7: TDBText
                          Left = 680
                          Top = 12
                          Width = 116
                          Height = 17
                          DataField = 'STATUS'
                          DataSource = DtmCadBasicos.dsSugestaoServ
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clBlue
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = [fsBold]
                          ParentFont = False
                        end
                        object Label16: TLabel
                          Left = 35
                          Top = 91
                          Width = 65
                          Height = 13
                          Alignment = taRightJustify
                          Caption = 'Num Ult OS:'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = [fsBold]
                          ParentFont = False
                        end
                        object DBText8: TDBText
                          Left = 101
                          Top = 91
                          Width = 82
                          Height = 17
                          DataField = 'NDOC_ANT'
                          DataSource = DtmCadBasicos.dsSugestaoServ
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clBlue
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = [fsBold]
                          ParentFont = False
                        end
                        object Label21: TLabel
                          Left = 344
                          Top = 91
                          Width = 58
                          Height = 13
                          Alignment = taRightJustify
                          Caption = 'Km Ult OS:'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = [fsBold]
                          ParentFont = False
                        end
                        object DBText15: TDBText
                          Left = 403
                          Top = 91
                          Width = 82
                          Height = 17
                          DataField = 'KM_ULT_SERV'
                          DataSource = DtmCadBasicos.dsSugestaoServ
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clBlue
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = [fsBold]
                          ParentFont = False
                        end
                        object DBText13: TDBText
                          Left = 237
                          Top = 90
                          Width = 82
                          Height = 17
                          DataField = 'DATA_ULT_SERV'
                          DataSource = DtmCadBasicos.dsSugestaoServ
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clBlue
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = [fsBold]
                          ParentFont = False
                        end
                        object Label19: TLabel
                          Left = 169
                          Top = 90
                          Width = 67
                          Height = 13
                          Alignment = taRightJustify
                          Caption = 'Data Ult OS:'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = [fsBold]
                          ParentFont = False
                        end
                        object Label20: TLabel
                          Left = 500
                          Top = 12
                          Width = 54
                          Height = 13
                          Alignment = taRightJustify
                          Caption = 'Data Cad:'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = [fsBold]
                          ParentFont = False
                        end
                        object DBText14: TDBText
                          Left = 556
                          Top = 12
                          Width = 70
                          Height = 17
                          DataField = 'DATA_CAD_TIPO'
                          DataSource = DtmCadBasicos.dsSugestaoServ
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clBlue
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = [fsBold]
                          ParentFont = False
                        end
                      end
                      object Panel13: TPanel
                        Left = 1
                        Top = 246
                        Width = 765
                        Height = 30
                        Align = alTop
                        TabOrder = 2
                        object BitBtn8: TBitBtn
                          Left = 279
                          Top = 3
                          Width = 100
                          Height = 25
                          Caption = '&OK'
                          TabOrder = 0
                          OnClick = BitBtn8Click
                          Glyph.Data = {
                            36050000424D3605000000000000360400002800000010000000100000000100
                            08000000000000010000D30E0000D30E00000001000000010000008C00000094
                            0000009C000000A5000000940800009C100000AD100000AD180000AD210000B5
                            210000BD210018B5290000C62900319C310000CE310029AD390031B5420018C6
                            420000D6420052A54A0029AD4A0029CE5A006BB5630000FF63008CBD7B00A5C6
                            94005AE7A500FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF001B1B1B1B1B13
                            04161B1B1B1B1B1B1B1B1B1B1B1B1B0B0A01181B1B1B1B1B1B1B1B1B1B1B160A
                            0C030D1B1B1B1B1B1B1B1B1B1B1B050E0C0601191B1B1B1B1B1B1B1B1B130E0C
                            170E02001B1B1B1B1B1B1B1B1B0B1517170A0C01181B1B1B1B1B1B1B1B111717
                            13130C030D1B1B1B1B1B1B1B1B1B08081B1B070C01191B1B1B1B1B1B1B1B1B1B
                            1B1B100C02001B1B1B1B1B1B1B1B1B1B1B1B1B090C01181B1B1B1B1B1B1B1B1B
                            1B1B1B130C0F101B1B1B1B1B1B1B1B1B1B1B1B1B141A0F181B1B1B1B1B1B1B1B
                            1B1B1B1B1012181B1B1B1B1B1B1B1B1B1B1B1B1B1B191B1B1B1B1B1B1B1B1B1B
                            1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B}
                        end
                        object BitBtn9: TBitBtn
                          Left = 386
                          Top = 3
                          Width = 100
                          Height = 25
                          Caption = '&Cancela (ESC)'
                          TabOrder = 1
                          OnClick = BitBtn9Click
                          Glyph.Data = {
                            12020000424D1202000000000000120100002800000010000000100000000100
                            08000000000000010000120B0000120B0000370000003700000000000000FFFF
                            FF00FF00FF001442E4001645EB001C4BE7000430EB000C35E4000E3CEB001037
                            DB000027EB00002AEB000027E400012CEB00052BDC00062DE300092ED9000022
                            EB000021E7000020E200001FDC000022DC000020D900001EEB00001FEB000020
                            EB00001DE800001BE300001EE200001FE200001BDF00001CDF00001AEB00001A
                            E2000017DF000019DF00001ADF000011EB000016EB000012E6000010DC000013
                            DC000010D9000009EB00000BEB000008EA000008E700000ADF000004E2000005
                            E2000004DF000005DF000003DB000004DA0000006E0002020202020202020202
                            0202020202020202020202020202020202020202020202020236360202020202
                            0236360202020202361A28360202020236302E36020202023621182A36020236
                            332B34360202020202362419293636312C353602020202020202361E11272D2B
                            3236020202020202020202361B26252F36020202020202020202023612172022
                            36020202020202020202360F06131C0A2336020202020202023607080E363614
                            0B1F3602020202023603041036020236160D1D36020202023605093602020202
                            36150C3602020202023636020202020202363602020202020202020202020202
                            02020202020202020202020202020202020202020202}
                        end
                      end
                      object GroupBox10: TGroupBox
                        Left = 1
                        Top = 276
                        Width = 765
                        Height = 132
                        Align = alClient
                        Caption = 'Ordem de Servi'#231'o'
                        TabOrder = 3
                        object Panel14: TPanel
                          Left = 2
                          Top = 100
                          Width = 761
                          Height = 30
                          Align = alBottom
                          TabOrder = 0
                          object BitBtn10: TBitBtn
                            Left = 343
                            Top = 3
                            Width = 75
                            Height = 25
                            Hint = 'Sair desta tela'
                            Caption = 'Sair (Esc)'
                            ParentShowHint = False
                            ShowHint = True
                            TabOrder = 0
                            OnClick = BitBtn9Click
                            Glyph.Data = {
                              2E020000424D2E020000000000002E0100002800000010000000100000000100
                              08000000000000010000120B0000120B00003E0000003E00000000000000FFFF
                              FF00FF00FF00BB410000BB420000FFF6EF00E69C5900E69D5900E9A36200FFF4
                              EA00FFF8F200FECA9500FFCE9C00FFD4A900FEEBD800FEF0E200FFF2E500FFF3
                              E700FFFBF700FECE9C00FED3A500FED5AA00FEDAB400FFDCB600FEDDB800FEDD
                              BA00FFE3C500FEE2C400FFE5C900FFE6CA00FEE5CA00FFEBD500FEF3E700FFDA
                              AD00FFEAD100FFFAF400FFD8A700FFD9A900FFDAAB00FFE1B800FFE7C700FEEE
                              D900FFFBF600FFDCAC00FFE1B500FFE7C400FFEFD700FFEAC200FFFAEA00FFFE
                              FB00FFFFFA00FFFFFE00315EFF002A56FF00123BFF00153DFF001841FF001A44
                              FF001D47FF00072BFF00001EFF00000D66000202020202020202020202020202
                              0202020202020202020202020202020202020204040404040404040404040402
                              020202040132302E28272125242F04020202020401050F221B1614130B260402
                              0202020401310A101F1A170D0C2B04020202020401013323110E1C18152C0402
                              02020204010101332A20291D192D040202020204010101010112093D1E2E043D
                              020202040101010101013D363D013D3C3D020204080606060606073D373D3B3D
                              0202020203040404040404043D383D0202020202020202020202023D353D393D
                              020202020202020202023D343D023D3A3D020202020202020202023D0202023D
                              020202020202020202020202020202020202}
                          end
                          object BitBtn20: TBitBtn
                            Left = 1
                            Top = 1
                            Width = 120
                            Height = 28
                            Align = alLeft
                            Caption = 'Visualizar'
                            ParentShowHint = False
                            ShowHint = True
                            TabOrder = 1
                            OnClick = BitBtn20Click
                            Glyph.Data = {
                              36050000424D3605000000000000360400002800000010000000100000000100
                              08000000000000010000320B0000320B000000010000000100005A6B7300AD7B
                              73004A637B00EFBD8400B58C8C00A5948C00C6948C00B59C8C00BD9C8C00F7BD
                              8C00BD949400C6949400CE949400C69C9400CEAD9400F7CE9400C6A59C00CEA5
                              9C00D6A59C00C6AD9C00CEAD9C00D6AD9C00F7CE9C00F7D69C004A7BA500CEAD
                              A500D6B5A500DEBDA500F7D6A500DEBDAD00DEC6AD00E7C6AD00FFDEAD00FFE7
                              AD00CEB5B500F7DEB500F7E7B500FFE7B500FFEFB500D6BDBD00DED6BD00E7DE
                              BD00FFE7BD006B9CC600EFDEC600FFEFC600FFF7C600F7E7CE00FFF7CE00F7EF
                              D600F7F7D600FFF7D600FFFFD6002184DE00F7F7DE00FFFFDE001884E700188C
                              E700FFFFE700188CEF00218CEF00B5D6EF00F7F7EF00FFF7EF00FFFFEF00FFFF
                              F700FF00FF004AB5FF0052B5FF0052BDFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0042020A424242
                              424242424242424242422B39180B42424242424242424242424243443C180B42
                              4242424242424242424242444438180B42424242424242424242424244433918
                              0A424242424242424242424242444335004201101A114242424242424242453D
                              05072F343434291942424242424242221A2D34343437403E0442424242424206
                              231C303437404146284242424242421B210F30373A414140310D42424242421F
                              20032434373A3A37321342424242421D25030F2D37373737311042424242420D
                              2D2D1C162430333429424242424242421E463F0F0316252E0842424242424242
                              4227312D21252314424242424242424242420E141B1B42424242}
                          end
                        end
                        object DBGrid4: TDBGrid
                          Left = 2
                          Top = 15
                          Width = 761
                          Height = 85
                          Align = alClient
                          DataSource = DtmCadBasicos.dsOrdemServico
                          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                          TabOrder = 1
                          TitleFont.Charset = DEFAULT_CHARSET
                          TitleFont.Color = clWindowText
                          TitleFont.Height = -11
                          TitleFont.Name = 'Tahoma'
                          TitleFont.Style = []
                        end
                      end
                    end
                  end
                end
              end
              object TabSheet5: TTabSheet
                Caption = 'TabSheet5'
                ImageIndex = 2
                ExplicitLeft = 0
                ExplicitTop = 0
                ExplicitWidth = 0
                ExplicitHeight = 0
                object ScrollBox6: TScrollBox
                  Left = 0
                  Top = 0
                  Width = 829
                  Height = 431
                  Align = alClient
                  TabOrder = 0
                  object GroupBox8: TGroupBox
                    Left = 0
                    Top = 0
                    Width = 825
                    Height = 427
                    Align = alClient
                    Caption = 'Ocorr'#234'ncias'
                    TabOrder = 0
                    object pnOcorrencias: TPanel
                      Left = 2
                      Top = 15
                      Width = 821
                      Height = 362
                      Align = alTop
                      TabOrder = 0
                      object Panel10: TPanel
                        Left = 1
                        Top = 1
                        Width = 819
                        Height = 106
                        Align = alTop
                        BevelOuter = bvNone
                        TabOrder = 0
                        object Label15: TLabel
                          Left = 44
                          Top = 12
                          Width = 66
                          Height = 13
                          Caption = 'Cod Cliente:'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = [fsBold]
                          ParentFont = False
                        end
                        object lbTipo2: TLabel
                          Left = 367
                          Top = 38
                          Width = 43
                          Height = 13
                          Alignment = taRightJustify
                          Caption = 'Ve'#237'culo:'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = [fsBold]
                          ParentFont = False
                        end
                        object Label17: TLabel
                          Left = 24
                          Top = 38
                          Width = 86
                          Height = 13
                          Caption = 'Nome Fantasia:'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = [fsBold]
                          ParentFont = False
                        end
                        object Label18: TLabel
                          Left = 36
                          Top = 64
                          Width = 74
                          Height = 13
                          Caption = 'Raz'#227'o Social:'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = [fsBold]
                          ParentFont = False
                        end
                        object lbChassi2: TLabel
                          Left = 371
                          Top = 64
                          Width = 39
                          Height = 13
                          Caption = 'Chassi:'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = [fsBold]
                          ParentFont = False
                        end
                        object lbPlaca2: TLabel
                          Left = 588
                          Top = 64
                          Width = 33
                          Height = 13
                          Caption = 'Placa:'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = [fsBold]
                          ParentFont = False
                        end
                        object lbCodigo2: TLabel
                          Left = 343
                          Top = 12
                          Width = 67
                          Height = 13
                          Alignment = taRightJustify
                          Caption = 'Cod Ve'#237'culo:'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = [fsBold]
                          ParentFont = False
                        end
                        object Label22: TLabel
                          Left = 222
                          Top = 12
                          Width = 30
                          Height = 13
                          Caption = 'Data:'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = [fsBold]
                          ParentFont = False
                        end
                        object DBText9: TDBText
                          Left = 112
                          Top = 12
                          Width = 65
                          Height = 17
                          DataField = 'COD_CLIENTE'
                          DataSource = DtmCadBasicos.dsSugestaoServ
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clBlue
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = [fsBold]
                          ParentFont = False
                        end
                        object DBText10: TDBText
                          Left = 112
                          Top = 38
                          Width = 243
                          Height = 17
                          DataField = 'NOME_CLIENTE'
                          DataSource = DtmCadBasicos.dsSugestaoServ
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clBlue
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = [fsBold]
                          ParentFont = False
                        end
                        object DBText11: TDBText
                          Left = 112
                          Top = 64
                          Width = 244
                          Height = 17
                          DataField = 'RAZAO'
                          DataSource = DtmCadBasicos.dsSugestaoServ
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clBlue
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = [fsBold]
                          ParentFont = False
                        end
                        object DBText12: TDBText
                          Left = 254
                          Top = 12
                          Width = 83
                          Height = 17
                          DataField = 'DATA'
                          DataSource = DtmCadBasicos.dsSugestaoServ
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clBlue
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = [fsBold]
                          ParentFont = False
                        end
                        object DBTextCodigo2: TDBText
                          Left = 412
                          Top = 12
                          Width = 65
                          Height = 17
                          DataField = 'COD_VEIC'
                          DataSource = DtmCadBasicos.dsSugestaoServ
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clBlue
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = [fsBold]
                          ParentFont = False
                        end
                        object DBTextTipo2: TDBText
                          Left = 412
                          Top = 38
                          Width = 326
                          Height = 17
                          DataField = 'DESCRICAO_TP'
                          DataSource = DtmCadBasicos.dsSugestaoServ
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clBlue
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = [fsBold]
                          ParentFont = False
                        end
                        object DBTextChassi2: TDBText
                          Left = 412
                          Top = 64
                          Width = 148
                          Height = 17
                          DataField = 'CHASSI'
                          DataSource = DtmCadBasicos.dsSugestaoServ
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clBlue
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = [fsBold]
                          ParentFont = False
                        end
                        object DBTextPlaca2: TDBText
                          Left = 622
                          Top = 64
                          Width = 65
                          Height = 17
                          DataField = 'PLACA'
                          DataSource = DtmCadBasicos.dsSugestaoServ
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clBlue
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = [fsBold]
                          ParentFont = False
                        end
                        object Label7: TLabel
                          Left = 649
                          Top = 12
                          Width = 40
                          Height = 13
                          Alignment = taRightJustify
                          Caption = 'Status:'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = [fsBold]
                          ParentFont = False
                        end
                        object DBText5: TDBText
                          Left = 690
                          Top = 12
                          Width = 140
                          Height = 17
                          DataField = 'STATUS'
                          DataSource = DtmCadBasicos.dsSugestaoServ
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clBlue
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = [fsBold]
                          ParentFont = False
                        end
                        object DBText16: TDBText
                          Left = 112
                          Top = 90
                          Width = 82
                          Height = 17
                          DataField = 'NDOC_ANT'
                          DataSource = DtmCadBasicos.dsSugestaoServ
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clBlue
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = [fsBold]
                          ParentFont = False
                        end
                        object Label23: TLabel
                          Left = 45
                          Top = 90
                          Width = 65
                          Height = 13
                          Alignment = taRightJustify
                          Caption = 'Num Ult OS:'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = [fsBold]
                          ParentFont = False
                        end
                        object Label25: TLabel
                          Left = 352
                          Top = 90
                          Width = 58
                          Height = 13
                          Alignment = taRightJustify
                          Caption = 'Km Ult OS:'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = [fsBold]
                          ParentFont = False
                        end
                        object DBText18: TDBText
                          Left = 412
                          Top = 90
                          Width = 82
                          Height = 17
                          DataField = 'KM_ULT_SERV'
                          DataSource = DtmCadBasicos.dsSugestaoServ
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clBlue
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = [fsBold]
                          ParentFont = False
                        end
                        object Label24: TLabel
                          Left = 185
                          Top = 90
                          Width = 67
                          Height = 13
                          Alignment = taRightJustify
                          Caption = 'Data Ult OS:'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = [fsBold]
                          ParentFont = False
                        end
                        object DBText17: TDBText
                          Left = 254
                          Top = 90
                          Width = 82
                          Height = 17
                          DataField = 'DATA_ULT_SERV'
                          DataSource = DtmCadBasicos.dsSugestaoServ
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clBlue
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = [fsBold]
                          ParentFont = False
                        end
                        object Label26: TLabel
                          Left = 493
                          Top = 12
                          Width = 54
                          Height = 13
                          Alignment = taRightJustify
                          Caption = 'Data Cad:'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = [fsBold]
                          ParentFont = False
                        end
                        object DBText19: TDBText
                          Left = 549
                          Top = 12
                          Width = 77
                          Height = 17
                          DataField = 'DATA_CAD_TIPO'
                          DataSource = DtmCadBasicos.dsSugestaoServ
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clBlue
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = [fsBold]
                          ParentFont = False
                        end
                      end
                      object GroupBox17: TGroupBox
                        Left = 1
                        Top = 107
                        Width = 819
                        Height = 46
                        Align = alTop
                        TabOrder = 1
                        object BitBtn_Novo_Ocorrencia: TBitBtn
                          Left = 191
                          Top = 11
                          Width = 75
                          Height = 25
                          Hint = 'Novo - [BAS380]'
                          Caption = '&Novo'
                          TabOrder = 0
                          OnClick = BitBtn_Novo_OcorrenciaClick
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
                        end
                        object BitBtn_Alterar_Ocorrencia: TBitBtn
                          Left = 268
                          Top = 11
                          Width = 75
                          Height = 25
                          Hint = 'Alterar - [BAS381]'
                          Caption = '&Alterar'
                          TabOrder = 1
                          OnClick = BitBtn_Alterar_OcorrenciaClick
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
                        end
                        object BitBtn_Salvar_Ocorrencia: TBitBtn
                          Left = 345
                          Top = 11
                          Width = 75
                          Height = 25
                          Hint = 'Salvar - [BAS383]'
                          Caption = '&Salvar'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = []
                          ParentFont = False
                          TabOrder = 2
                          OnClick = BitBtn_Salvar_OcorrenciaClick
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
                        end
                        object BitBtn_Cancelar_Ocorrencia: TBitBtn
                          Left = 422
                          Top = 11
                          Width = 75
                          Height = 25
                          Hint = 'Cancelar'
                          Caption = '&Cancelar'
                          TabOrder = 3
                          OnClick = BitBtn_Cancelar_OcorrenciaClick
                          Glyph.Data = {
                            12020000424D1202000000000000120100002800000010000000100000000100
                            08000000000000010000120B0000120B0000370000003700000000000000FFFF
                            FF00FF00FF001442E4001645EB001C4BE7000430EB000C35E4000E3CEB001037
                            DB000027EB00002AEB000027E400012CEB00052BDC00062DE300092ED9000022
                            EB000021E7000020E200001FDC000022DC000020D900001EEB00001FEB000020
                            EB00001DE800001BE300001EE200001FE200001BDF00001CDF00001AEB00001A
                            E2000017DF000019DF00001ADF000011EB000016EB000012E6000010DC000013
                            DC000010D9000009EB00000BEB000008EA000008E700000ADF000004E2000005
                            E2000004DF000005DF000003DB000004DA0000006E0002020202020202020202
                            0202020202020202020202020202020202020202020202020236360202020202
                            0236360202020202361A28360202020236302E36020202023621182A36020236
                            332B34360202020202362419293636312C353602020202020202361E11272D2B
                            3236020202020202020202361B26252F36020202020202020202023612172022
                            36020202020202020202360F06131C0A2336020202020202023607080E363614
                            0B1F3602020202023603041036020236160D1D36020202023605093602020202
                            36150C3602020202023636020202020202363602020202020202020202020202
                            02020202020202020202020202020202020202020202}
                        end
                        object BitBtn_Excluir_Ocorrencia: TBitBtn
                          Left = 500
                          Top = 11
                          Width = 75
                          Height = 25
                          Hint = 'Excluir - [BAS382]'
                          Caption = 'Excluir'
                          TabOrder = 4
                          OnClick = BitBtn_Excluir_OcorrenciaClick
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
                        end
                      end
                      object Panel12: TPanel
                        Left = 1
                        Top = 320
                        Width = 819
                        Height = 41
                        Align = alBottom
                        TabOrder = 2
                        object BitBtn12: TBitBtn
                          Left = 345
                          Top = 11
                          Width = 75
                          Height = 25
                          Hint = 'Sair desta tela'
                          Caption = 'Sair (Esc)'
                          ParentShowHint = False
                          ShowHint = True
                          TabOrder = 0
                          OnClick = BitBtn12Click
                          Glyph.Data = {
                            2E020000424D2E020000000000002E0100002800000010000000100000000100
                            08000000000000010000120B0000120B00003E0000003E00000000000000FFFF
                            FF00FF00FF00BB410000BB420000FFF6EF00E69C5900E69D5900E9A36200FFF4
                            EA00FFF8F200FECA9500FFCE9C00FFD4A900FEEBD800FEF0E200FFF2E500FFF3
                            E700FFFBF700FECE9C00FED3A500FED5AA00FEDAB400FFDCB600FEDDB800FEDD
                            BA00FFE3C500FEE2C400FFE5C900FFE6CA00FEE5CA00FFEBD500FEF3E700FFDA
                            AD00FFEAD100FFFAF400FFD8A700FFD9A900FFDAAB00FFE1B800FFE7C700FEEE
                            D900FFFBF600FFDCAC00FFE1B500FFE7C400FFEFD700FFEAC200FFFAEA00FFFE
                            FB00FFFFFA00FFFFFE00315EFF002A56FF00123BFF00153DFF001841FF001A44
                            FF001D47FF00072BFF00001EFF00000D66000202020202020202020202020202
                            0202020202020202020202020202020202020204040404040404040404040402
                            020202040132302E28272125242F04020202020401050F221B1614130B260402
                            0202020401310A101F1A170D0C2B04020202020401013323110E1C18152C0402
                            02020204010101332A20291D192D040202020204010101010112093D1E2E043D
                            020202040101010101013D363D013D3C3D020204080606060606073D373D3B3D
                            0202020203040404040404043D383D0202020202020202020202023D353D393D
                            020202020202020202023D343D023D3A3D020202020202020202023D0202023D
                            020202020202020202020202020202020202}
                        end
                      end
                      object GroupBox7: TGroupBox
                        Left = 1
                        Top = 153
                        Width = 819
                        Height = 123
                        Align = alTop
                        Caption = 'Ocorr'#234'ncias'
                        TabOrder = 3
                        object Panel9: TPanel
                          Left = 2
                          Top = 15
                          Width = 815
                          Height = 106
                          Align = alClient
                          Caption = 'Panel7'
                          TabOrder = 0
                          object DBGrid3: TDBGrid
                            Left = 1
                            Top = 1
                            Width = 813
                            Height = 104
                            Align = alClient
                            DataSource = DtmCadBasicos.dsOcorrenciasSug
                            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                            TabOrder = 0
                            TitleFont.Charset = DEFAULT_CHARSET
                            TitleFont.Color = clWindowText
                            TitleFont.Height = -11
                            TitleFont.Name = 'Tahoma'
                            TitleFont.Style = []
                            Columns = <
                              item
                                Expanded = False
                                FieldName = 'OBSERVACAO'
                                Width = 450
                                Visible = True
                              end
                              item
                                Expanded = False
                                FieldName = 'US_CAD'
                                Visible = True
                              end
                              item
                                Expanded = False
                                FieldName = 'DATA_CAD'
                                Visible = True
                              end
                              item
                                Expanded = False
                                FieldName = 'HORA_CAD'
                                Visible = True
                              end>
                          end
                        end
                      end
                      object GroupBox9: TGroupBox
                        Left = 1
                        Top = 276
                        Width = 819
                        Height = 52
                        Align = alTop
                        Caption = 'Dados'
                        TabOrder = 4
                        object Label11: TLabel
                          Left = 79
                          Top = 13
                          Width = 24
                          Height = 13
                          Alignment = taRightJustify
                          Caption = 'Obs:'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = [fsBold]
                          ParentFont = False
                        end
                        object Label12: TLabel
                          Left = 584
                          Top = 13
                          Width = 30
                          Height = 13
                          Alignment = taRightJustify
                          Caption = 'Data:'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = [fsBold]
                          ParentFont = False
                        end
                        object DBMemo1: TDBMemo
                          Left = 111
                          Top = 10
                          Width = 464
                          Height = 33
                          DataField = 'OBSERVACAO'
                          DataSource = DtmCadBasicos.dsOcorrenciasSug
                          Enabled = False
                          TabOrder = 0
                        end
                        object DBEdit1: TDBEdit
                          Left = 621
                          Top = 10
                          Width = 92
                          Height = 21
                          DataField = 'DATA_CAD'
                          DataSource = DtmCadBasicos.dsOcorrenciasSug
                          Enabled = False
                          TabOrder = 1
                        end
                      end
                    end
                  end
                end
              end
            end
            inherited Panel3: TPanel
              Width = 837
              ExplicitWidth = 837
              inherited LabelSeq: TLabel
                Enabled = False
                Visible = False
              end
              object SpeedButton13: TSpeedButton [1]
                Left = 604
                Top = 13
                Width = 75
                Height = 25
                Caption = '&Sair'
                Flat = True
                Glyph.Data = {
                  56040000424D5604000000000000160200002800000018000000180000000100
                  08000000000040020000120B0000120B0000780000007800000000000000FFFF
                  FF00FF00FF00FFFEFE00C4480000C2480000BF4B0000BC4B0000FFFBF800FFF3
                  E900FFEFE000FFF0E300FFF7F000FECB9700FFD1A300FED4A900FFD5AB00FED4
                  AA00FFD9B200FFD9B400FFDAB400FEDAB500FFDEBC00FEDEBD00FFF2E500FFF3
                  E700FFF4E900FFF6ED00FFF7EF00FFFBF700EEAA5E00FECB9600FECC9700FECE
                  9900FECE9A00FECE9C00FFD19F00FED0A000FED1A100FED4A700FED5AA00FED7
                  AB00FED9B100FEDEBA00FEDEBB00FFE0BD00FEDEBC00FEE0C000FFE3C600FEE3
                  C500FEE5C900FEE5CA00FEE6CB00FFEAD400FEEAD400FEEDDA00FFEEDC00FFEF
                  DE00FEEEDD00FFF3E600FEF3E700FFF7EE00EFAC5F00EEAB5F00FFD3A100FFD4
                  A300FFD7A600FFD8A900FFD9AC00FFDCB100FFDDB400FEDCB500FFE0BA00FFE1
                  BC00FEE1C000FFE5C700FFE6C700FEE5C600FFE6C900FFE9CF00FFE9D000FEE9
                  D000FEE9D100FEEBD400FEEDD900FFF3E500FFF8F000FEF7EF00FFD7A500FFDD
                  AF00FFE5C400FFEACF00FEEAD100FFEFDA00FEEEDA00FFF4E500FEF4E700FFFB
                  F600FFFCF800FFEDD300FEEFDA00FEF7ED00FFFBF400FFFAF000FFFEFC00FFFF
                  FB00FFFFFE003557FF00395CFF005474FF00163AFE001E41FE001F41FE001F41
                  FC002649FE0000139C00000D66000524FC000A2AFC00021FFC00020202020202
                  0202020202020202020202020202020202020202020202020202020202020202
                  0202020202020202020202070707070707070707070707070707070707020202
                  0202020701675F5D5B5A48454341242424242459070202020202020701650B54
                  4F312B2A2725221F1F1F1F58070202020202020701661B183750312C2A0F2521
                  1F1F1F5807020202020202070168663D185E51302E2A0F26220D1F5807020202
                  02020207010168611C5564503016132826222058070202020202020701010103
                  615760385C4D2D12114023420702020202020207010101016A1D563B38524B17
                  14290E440702020202020207010101010103620C3C3A364E2D15104607020202
                  020202070101010101016A0856193935322F4749070202020202020701010101
                  0101016A620C090A53334A4C070202020202020701010101010101010362561A
                  7474346307027474020202070101010101010101010101746D73746907747373
                  740202073E3F3F3F3F3F3F3F3F3F1E746D6F7374747577737402020604050505
                  0505050505050505746D70737376737402020202070707070707070707070707
                  07746D706E7374020202020202020202020202020202020202746D7270737402
                  02020202020202020202020202020202746D6B6D6D6F73740202020202020202
                  02020202020202746D6C6C74746D717374020202020202020202020202020274
                  6D6D740202746D6F740202020202020202020202020202027474020202027474
                  0202020202020202020202020202020202020202020202020202}
                OnClick = SpeedButton1Click
              end
              inherited BitBtn6: TBitBtn [3]
              end
              inherited BitBtn5: TBitBtn [4]
              end
              inherited CheckCadSeq: TCheckBox
                Enabled = False
                Visible = False
              end
            end
          end
        end
        inherited TabSheet2: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 837
          ExplicitHeight = 510
          inherited GroupBox3: TGroupBox
            Width = 837
            Height = 161
            ExplicitWidth = 837
            ExplicitHeight = 161
            inherited imgInformation: TImage
              Left = 811
              Height = 144
              ExplicitLeft = 811
              ExplicitHeight = 144
            end
            object Label83: TLabel [6]
              Left = 679
              Top = 56
              Width = 50
              Height = 13
              Caption = 'Cancelada'
            end
            object Label14: TLabel [7]
              Left = 679
              Top = 40
              Width = 47
              Height = 13
              Caption = 'Finalizada'
            end
            object Label27: TLabel [8]
              Left = 679
              Top = 23
              Width = 54
              Height = 13
              Caption = 'Agendados'
            end
            object SpeedButton9: TSpeedButton [9]
              Left = 770
              Top = 51
              Width = 23
              Height = 22
              Flat = True
              Glyph.Data = {
                36050000424D3605000000000000360400002800000010000000100000000100
                08000000000000010000D30E0000D30E00000001000000010000007B00000084
                0000008C00000094000008940800009C0800089C080008A50800008C1000088C
                100008A5100010A5100018731800318C180021941800109C180010A5180018A5
                180010AD1800317B21005A8421001894210018B52100217B2900399429005294
                2900299C29004AA5290052A5290018AD290018B5290021B52900428C3100399C
                310031A5310021B5310031B5310021BD3100218C390018A5390039A5390029C6
                39006B844200188C4200319C4200399C420042B5420029C642005A944A00429C
                4A007B9C4A0073AD4A008CB54A0052BD4A0031CE4A00525252006B63520039CE
                520031D6520039D652005A5A5A007B735A0018A55A0063A55A008CA55A0021AD
                5A004ACE5A0039D65A0063636300736B6300847363008C73630063C6630073C6
                630042D66300214A6B006B6B6B006B736B0063D66B0042DE6B004ADE6B0042E7
                6B004AE76B00295A73004AE77300294A7B00316B7B00426B7B0073737B00B59C
                7B0084BD7B00B5C67B007BCE7B005AE77B0063E77B0052EF7B00104284002952
                84005263840018848400CEAD840073B5840073D6840052EF84005AEF84000042
                8C00295A8C00426B8C008C8C8C00B5A58C00214A940000529400215294002163
                94006BF7940029639C004A849C0073849C009C9C9C009CA59C0031AD9C00C6B5
                9C000063A5000863A500006BA5001873A5004A94A500A5A5A50094E7A500006B
                AD00086BAD001873AD002173AD009CEFAD008CF7AD001073B500007BB500217B
                B500297BB500218CB5003194B50039A5B500C6BDB500ADEFB500007BBD001884
                BD002184BD00188CBD0063ADBD0073ADBD00A5C6BD00008CC600108CC600298C
                C6001094C60042A5C6009CC6C6000894CE001094CE002994CE00009CCE00089C
                CE00109CCE00189CCE00CECECE00CED6CE00089CD60010A5D60018A5D60029A5
                D60021ADD60039ADD6005AADD60063C6D6009CCED600D6D6D600DEDED60018A5
                DE0021A5DE0029A5DE0042A5DE0031ADDE004AADDE0042B5DE0042BDDE00BDD6
                DE00DEDEDE00E7EFDE0029ADE70039ADE70042ADE70031B5E70039B5E70042B5
                E70052B5E70063BDE7006BC6E70039B5EF004AB5EF0042BDEF004ABDEF0052C6
                EF005AC6EF006BC6EF004ABDF7004AC6F70052C6F700FF00FF005AC6FF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CFCFCFCFCFCF
                CFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCF7569CFCFCFCFCFCFCFCFCFCFCF
                8483618AA96A6F7BCFCFCFCFCFCFCFCFB6C17B9FB5829A9ECFCFCFCFCFCFCF70
                99C8C7C1B5B3A89A6962CFCFCFCFCF6EBECEC8C3747D9E9A7C71CFCFCFCFCFC4
                C9C8CBBA4C539A9DA294CFCFCFCFCF268DC8CBBA4C56A8A3A3CFCF3F09001839
                78B7ADAF4457A9A9CFCFCF1A50231D39273E2E7937479BA3CFCFCF0D50544339
                2F25110E2ACFCFCFCFCF2823545466651510100619CFCFCFCFCF80725F50AF7F
                17040A1049CFCFCFCFCFCF4A5050AF7F2D25111BCFCFCFCFCFCFCFCF5D50A46C
                303548CFCFCFCFCFCFCFCFCFCF4A6D45341FCFCFCFCFCFCFCFCF}
              OnClick = SpeedButton55Click
            end
            inherited BitBtn1: TBitBtn
              Top = 9
              Hint = 'Clique para pesquisar - [BAS377]'
              ExplicitTop = 9
            end
            inherited BitBtn2: TBitBtn
              Left = 739
              Top = 10
              ExplicitLeft = 739
              ExplicitTop = 10
            end
            inherited BitBtn3: TBitBtn
              Top = 9
              Enabled = False
              Visible = False
              ExplicitTop = 9
            end
            inherited CheckBox3: TCheckBox
              Left = 674
              Top = -13
              Visible = False
              ExplicitLeft = 674
              ExplicitTop = -13
            end
            inherited CheckBox1: TCheckBox
              Left = 270
              Top = 57
              ExplicitLeft = 270
              ExplicitTop = 57
            end
            object CheckBox4: TCheckBox
              Left = 270
              Top = 40
              Width = 196
              Height = 17
              Caption = 'Visualizar sugest'#245'es pendentes'
              TabOrder = 11
              OnClick = CheckBox4Click
            end
            object Panel11: TPanel
              Left = 624
              Top = 56
              Width = 49
              Height = 13
              BevelOuter = bvNone
              Caption = '0,00'
              Color = 8224255
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 8224255
              Font.Height = -11
              Font.Name = '$007D7DFF'
              Font.Style = [fsBold]
              ParentBackground = False
              ParentFont = False
              TabOrder = 12
            end
            object Panel8: TPanel
              Left = 624
              Top = 40
              Width = 49
              Height = 13
              BevelOuter = bvNone
              Caption = '0,00'
              Color = 16745604
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 16745604
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentBackground = False
              ParentFont = False
              TabOrder = 13
            end
            object ckPendentes: TCheckBox
              Left = 498
              Top = 16
              Width = 124
              Height = 15
              Caption = 'Pendentes [F10]'
              TabOrder = 14
            end
            object ckFinalizadas: TCheckBox
              Left = 498
              Top = 36
              Width = 115
              Height = 14
              Caption = 'Finalizadas [F11]'
              TabOrder = 15
            end
            object ckCanceladas: TCheckBox
              Left = 498
              Top = 54
              Width = 107
              Height = 15
              Caption = 'Canceladas [F12]'
              TabOrder = 16
            end
            object Panel15: TPanel
              Left = 624
              Top = 23
              Width = 49
              Height = 13
              BevelOuter = bvNone
              Color = 10223541
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 16745604
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentBackground = False
              ParentFont = False
              TabOrder = 17
            end
            object groupAdicional: TGroupBox
              Left = 4
              Top = 76
              Width = 829
              Height = 85
              Align = alCustom
              Caption = 'Pesquisa Adicional'
              TabOrder = 18
              Visible = False
              OnExit = groupAdicionalExit
              object Label109: TLabel
                Left = 6
                Top = 54
                Width = 47
                Height = 13
                Alignment = taRightJustify
                Caption = 'Conte'#250'do'
              end
              object Label110: TLabel
                Left = 16
                Top = 28
                Width = 37
                Height = 13
                Caption = 'Campo:'
              end
              object Label111: TLabel
                Left = 143
                Top = 54
                Width = 20
                Height = 13
                Caption = 'at'#233':'
              end
              object Label112: TLabel
                Left = 210
                Top = 27
                Width = 48
                Height = 13
                Caption = 'Condi'#231#227'o:'
              end
              object ComboBox11: TComboBox
                Left = 59
                Top = 20
                Width = 145
                Height = 21
                Hint = 'Campo filtro da pesquisa adicional. Informe o campo desejado'
                ItemHeight = 13
                TabOrder = 0
                Text = 'ComboBox11'
                OnEnter = ComboBox1Enter
                OnExit = ComboBox11Exit
              end
              object MaskEdit7: TMaskEdit
                Left = 59
                Top = 46
                Width = 187
                Height = 21
                CharCase = ecUpperCase
                TabOrder = 1
              end
              object MaskEdit8: TMaskEdit
                Left = 173
                Top = 46
                Width = 75
                Height = 21
                EditMask = '!99/99/0000;1;_'
                MaxLength = 10
                TabOrder = 3
                Text = '  /  /    '
                Visible = False
              end
              object MaskEdit9: TMaskEdit
                Left = 59
                Top = 46
                Width = 69
                Height = 21
                EditMask = '!99/99/0000;1;_'
                MaxLength = 10
                TabOrder = 2
                Text = '  /  /    '
                Visible = False
              end
              object ComboBox12: TComboBox
                Left = 264
                Top = 21
                Width = 133
                Height = 21
                ItemHeight = 13
                TabOrder = 4
                Text = 'Come'#231'a'
                OnEnter = ComboBox1Enter
                Items.Strings = (
                  'Come'#231'a'
                  'Igual'
                  'Diferente'
                  'Maior'
                  'Menor'
                  'Esta contido')
              end
            end
          end
          inherited Panel1: TPanel
            Top = 161
            Width = 837
            Height = 349
            ExplicitTop = 161
            ExplicitWidth = 837
            ExplicitHeight = 349
            inherited Splitter1: TSplitter
              Height = 288
              ExplicitHeight = 288
            end
            inherited DBGrid1: TDBGrid
              Width = 544
              Height = 288
              OnDrawColumnCell = DBGrid1DrawColumnCell
              OnKeyDown = DBGrid1KeyDown
            end
            inherited Panel2: TPanel
              Width = 833
              ExplicitWidth = 833
              inherited SpeedButton1: TSpeedButton
                Left = 64
                Hint = 'Visualizar ocorr'#234'ncias - [BAS379]'
                ExplicitLeft = 64
              end
              inherited SpeedButton2: TSpeedButton
                Left = 121
                Hint = 'Enviar email - [BAS384]'
                Glyph.Data = {
                  F6060000424DF606000000000000360000002800000018000000180000000100
                  180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FF8E5D598E5D598E5D598E5D598E5D598E
                  5D598E5D598E5D598E5D598E5D598E5D598E5D598E5D598E5D598E5D598E5D59
                  8E5D598E5D598E5D598E5D598E5D59FF00FFFF00FF8E5D59AC7967EBB283FFC4
                  8BFFC48AFEC48AFFC48BFFC48BFFC48AFFC48AFFC48BFFC48AFFC48AFFC48AFF
                  C48AFFC48BFFC48BFFC48BFFC48BFFC58BEBB282AC79678E5D59FF00FF8E5D59
                  D9A784A67567F7C596FFCB98FECB98FFCB99FFCB98FFCB99FECB98FFCA98FECB
                  99FECB99FFCB98FFCB99FFCB98FECB98FFCB99FFCB98F8C596A67567D9A6848E
                  5D59FF00FF8E5D59FED4AAC2937EBA8A78FFD4A9FFD4AAFFD4AAFFD4AAFED4AA
                  FED4AAFFD4A9FFD4AAFED4AAFFD4AAFED4AAFED4AAFFD4AAFFD4AAFFD4AAB88A
                  78C2937EFED4AA8E5D59FF00FF8E5D59FEDEBDFBDABBAC8075D1AA95FEDEBCFF
                  DDBCFFDEBCFEDEBCFEDDBDFFDDBDFFDDBDFFDEBCFEDDBDFEDEBDFEDEBCFFDDBC
                  FFDDBDD1AA95AC8074FCDABAFFDEBC8E5D59FF00FF8E5D59FEE7D0FFE7D0F0D5
                  C2A1756DE9CBB7FFE7D0FFE7D0FEE7D0FFE7D0FEE7D0FFE7D0FEE7D0FEE7D0FE
                  E7D0FEE7D0FEE7D0E7CBB8A1756DEFD5C1FEE7D0FEE7D08E5D59FF00FF8E5D59
                  FEF0E2FEF0E3FEF0E2DDC5BBA37873F6E6DAFFF0E3FEF0E3FEF0E3FEF0E2FEF0
                  E3FEF0E2FEF0E3FEF0E2FEF0E2F7E6DAA37873DEC5BAFEF0E2FEF0E3FEF0E28E
                  5D59FF00FF8E5D59FEF8F2FEF8F3FEF8F2FFF7F3C5A7A3B5918CFEF8F3FEF8F3
                  FEF8F2FEF7F2FEF8F3FEF8F2FEF8F3FEF8F2FFF8F3B5918CC5A9A4FEF7F3FEF8
                  F3FEF8F2FEF8F28E5D59FF00FF8E5D59FEFEFEFEFEFEFEFEFEFEFEFEFCFBFBAD
                  8987CCB5B4FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFECAB2B0AF8B88
                  FCFBFBFEFEFEFEFEFEFEFEFEFEFEFE8E5D59FF00FF8E5D59FEFEFEFEFEFEFEFE
                  FEFCFBFBC7ADACAC8884986B68986B68986B68986B68986B68986B68986B6898
                  6B68986B68C2A6A4FCFBFBFEFEFEFEFEFEFEFEFEFEFEFE8E5D59FF00FF8E5D59
                  FEFEFEFEFEFEF0EBEAAD8986B4918FF4F0F0FEFEFEFEFEFEFEFEFEFEFEFEFEFE
                  FEFEFEFEFEFEFEFEFEFEF4F0F0B4918FAD8986F0EBEAFEFEFEFEFEFEFEFEFE8E
                  5D59FF00FF8E5D59FEFEFEDCCCCAA07673CEB6B5FEFEFEFEFEFEFEFEFEFEFEFE
                  FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFECEB6B5A07673DCCC
                  CAFEFEFEFEFEFE8E5D59FF00FF8E5D59C6ACAAA57E7AACACACFEFEFEFEFEFEFE
                  FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
                  FEFEFEE9DEDDA57E7AC6ACAAFEFEFE8E5D59FF00FF8E5D59A18687A5E6E6ACAC
                  ACFFFFFFFBFFFFFAFFFFF6FFFFF6FFFFEFFFFFEFFFFFEFFFFFF2FFFFF2FFFFF4
                  FFFFF6FFFFF4FFFFEFFFFFE7F6F6D1E1E1B5B7B7B29D9D8E5D59FF00FF8E5D59
                  A69598A7FEFFACACACFEFFFFFBFFFFFBFFFFFBFFFFFFFFFFFFFFFFFFFFFFFBFF
                  FFEEF7F7D5DEE0C1CCCEB6BDBFADB4B5ACADADAAADAFA1AFB49AACB2A390928E
                  5D59FF00FFFF00FF8E5D59B89696ACACACFFFFFFFFFFFFFFFFFFE9EBEBCED5D7
                  BDC5C6B1BABAAAAFB0AAACADA3ADB097AFB589AFBA7EAFC073B1CC67BAE079AA
                  C7A683898E5D59FF00FFFF00FFFF00FFFF00FF8E5D59C69695ADB4B5ABBABAAC
                  ACACA5B6B89ABABC8FBFC581C9CF76D1DA6DD8E76ED8EB70D4EB72D1ED6FD7F7
                  6DD7FC91ADC28E5D598E5D59FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF8E5D
                  5997747299B6BB72F0FB6BF6FF70EAFA72EBFB72EEFC74EFFF74F0FF75EDFE76
                  E7FC6FEBFF77DAF49AA9B68E5D59FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FF8E5D59B0959686D1D96BFFFF72F6FF74EFFF74EF
                  FF74EFFF70F4FF6DF8FF87CAD9B092968E5D59FF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF8E5D598E5D5998BABF
                  77EBF66DFBFF6DFBFF6EF8FF75EEFB98BABF8E5D598E5D59FF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FF8E5D598E5D599DAFB295BBC19EADB08E5D598E5D59FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF8E5D598E5D598E5D59FF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                OnClick = SpeedButton2Click
                ExplicitLeft = 121
              end
              inherited SpeedButton3: TSpeedButton
                Left = 178
                Hint = 'Incluir agendamento - [BAS385]'
                Glyph.Data = {
                  22050000424D2205000000000000E20200002800000018000000180000000100
                  08000000000040020000120B0000120B0000AB000000AB00000000000000FFFF
                  FF004E4D50005C5B5D00FF00FF003F3D3E00403E3F004C4B4B00FEFCFC00C9C7
                  C700FEFCFB00BC4B0000BB4B0000BA4A0000B5480000A64200009A3E0000827E
                  7B00D9640100FEEFE100FEF0E300FEF3E900FEF4EB00F6CCA100FEDAB500FCDA
                  B700FEDEBD00FEE7D100FEE9D400FEEAD700FEEBD800FEEFE000FEF0E200FEF2
                  E600FEF4EA00FEF7F000FEF8F200FEFAF600FEFBF800FEFCFA00CE7D2500D581
                  2700CF7D2600D4802700D3802700A9886500C09C7500FED0A000F4CA9E00FCD4
                  A700F6CFA600FED7AC00FED8AD00FED8B000FED9B100FBD7B000FEDCB600FEDC
                  B700FEDDB800FEDEBB00FEE0BF00FEE1C100FEE1C200FEE2C400FEE3C500FEE3
                  C600FEE3C700FEE5C900FEE5CA00FEE6CB00FEE6CC00FEE7CF00FEE9D300FEEA
                  D400FEEAD500FEEDDA00FEEEDD00FEF0E100FEF2E500FEF3E700FEF6ED00FCD9
                  B100FEDCB500FEE0BD00FEE1C000FEE7CC00FEE9CF00FEE9D000FEE9D100FEEB
                  D500FEEDD900FEEFDE00FEF7EF00FEEEDA00FEF2E300FEF3E500FEF7EE00FEFB
                  F700FEFAF400C6C4C100FEFAF300FEFBF6006DA9600084B07E00639D5F0075A9
                  72008BBA8800007F0000006F000000590000035A05002BAA2E0090E691000690
                  0E00089511000A9814006CD574000A9A17000C9D19000A8B19000DA01C000EA1
                  1D0010A5200011A522000EA0230011A6240013AB270014AC290017B02E0018B2
                  30001BB735001CBA38001FBF3E0020C1400022C4430023C5450025C74700112D
                  170016B03A0027CB4B0028CC4D0020B8460029CF52002CD355002DD458001CB8
                  460030D95E0034DE65001A7335001C5E3B0047866A0054809E001E7FF700162F
                  4E001C67C50016294100162335001664DD0015376C00112753000F44B8001129
                  5C000C297A000A2D960013151C001313150028282A0041414200EDEDEE008888
                  8900FEFEFE0004040404040404040404040404040404046E6E6E6E0404040404
                  0404040404040404040404040404046E72716E04040404040404040404040404
                  040404040404046E76736E0404040B0B0B0B0B0B0B0B0B0B0B0B0C0E6E6E6E6E
                  7D796E6E6E6E0B4F204C1D1B443F53390B3431306E888583817F7B78756E0B60
                  224E5B5A485541540B5235326E8F8C878482807E7A6E0B2524504F4D5D595643
                  0B5339376E6E6E6E8B866E6E6E6E0B0A676D6D6D6D6D66580B41292B2929296E
                  908E6E2D10040BAA686C7C8D6F6B6D4B0B47433E1A38366E93926E2E0F040BAA
                  69779174708A6D140B1E5845403C3A6E6E6E6E2F0B040BAAAA89959796946A16
                  0B1F292929292B2C2A2828170D040BAAA9A4A2A3A2A411240B4F204C4A57443F
                  531951330B040BAAA7A1A0A0A09F05260B5C224E5B5A1C55423D3B180B040BAA
                  A69E9D9D9D9E06080B652929292929292929291A0B040BAAA69C9A98989B07AA
                  0B0A616460155E5B1E4846410B040BAA03A5A59B99A563AA0BAA0A2662231621
                  135D49470B040BAAA802A5A50209AAAA0BAA2929292929292929291E0B040BAA
                  AAAAAAAAAAAAAAAA0BAAAAAAAA0826645C165F1F0B040BAAAAAAAAAAAAAAAAAA
                  0BAAAAAAAAAA08276124504F0B040B1212121212121212121212121212121212
                  121212120B040B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B04040B
                  0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B040404040404040404040404
                  0404040404040404040404040404040404040404040404040404040404040404
                  040404040404}
                OnClick = SpeedButton3Click
                ExplicitLeft = 178
              end
              inherited SpeedButton4: TSpeedButton
                Left = 754
                Top = 6
                Enabled = False
                Visible = False
                ExplicitLeft = 754
                ExplicitTop = 6
              end
              inherited SpeedButton5: TSpeedButton
                Left = 697
                Hint = 'Visualizar servi'#231'o'
                Enabled = False
                Glyph.Data = {
                  F6060000424DF606000000000000360000002800000018000000180000000100
                  180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FF969190736E6EAF7D7EFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FF9792916C6C70174B82326089AF7B7BFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF8386863A79B11A81FF0D62
                  BC3B5F7FB07D7DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF2698FF
                  3DB0FF349DFF1C7EF80C62BA395E7FB07B7DFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FF2996FF42ADFE349AFF1C7EF80C60B8405F7FB17D7BFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF2A96FE41AFFE349AFF1C7EF80C
                  5FB83E5F7EB07B7BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF2A97
                  FE41AFFE349AFF1A7BF80B5FB744627FA97A7EFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FF2C98FE41ADFE349CFF197BF60C5EB62B587FFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF2D99FE41ADFE339CFF287FE7
                  3D607BFF00FFFF00FFFF00FF996964996964996964996964996964FF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF2D
                  9AFE4BB5FF8CBDEDAC9F966C565593665F996964DDCCABFFFFD9FFFFD9FFFFD7
                  E9D5B6996964996964FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFD1ADA5B68775CCAB8CFFFFD3FFFFD3FF
                  FFD0FFFFCFFFFFD0FFFFD3FFFFE2D4BAA4996964FF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF996B65D4AF8FFFEF
                  B0FBEDB8FFFFCFFFFFCEFFFFCFFFFFD7FFFFDCFFFFEAFFFFFFD3BBB8996964FF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  996964FFEAA6F2C78FFAEBB6FFFFD0FFFFCFFFFFD3FFFFE5FFFFF2FFFFFAFFFF
                  FCFFFFFE996964FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FF996964E6C9A0F6CA8BEEBA7FFBE7B4FFFFD0FFFFCFFFFFD7FFFFEB
                  FFFFFEFFFFFCFFFFF2FFFFE5D8C6A5996964FF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FF996964FFEFADF0BC7DEBB075F7DDA7FEFCCBFF
                  FFD1FFFFD5FFFFE6FFFFF6FFFFF6FFFFE6FFFFD7FFFFDA996964FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF996964FFF0AFEFBA7BE9A5
                  6AF2C98FFCEFBCFFFFD1FFFFD3FFFFD9FFFFE1FFFFE2FFFFD9FFFFD3FFFFDA99
                  6964FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF996964
                  FFF2B2F3C484E99E63EDB57AF4D79FFCF4C2FFFFD1FFFFD3FFFFD3FFFFD3FFFF
                  D0FFFFCFFFFFD8996964FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FF996964E6C9A0FCDE9EEFBA7EEEB779EFC284F6DAA1FBF2BFFFFFCF
                  FFFFD1FFFFD0FFFFD0FFFFD1D9C6A5996964FF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FF996964FFFEC2FBEBCAF6D7ACF0C186EF
                  BF82F3CC95FAE3ADFCF0BCFBF4C1FEF6C4FFFFD4996964FF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF996964D7BB9EFFFF
                  FFFEF7EEF6D8ACEDB474E9A76BEDB478F0C48AF6D49CFFF4B6D3B799996964FF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FF996964CEB6AFFFFFFFFFF4CBF6CF90F0BC7DF2BF81F7CE90FFEDA9D4B1
                  93996964FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FF996964996964E1C9A0FFF7B5FFF2AFFFF2B1
                  E9CCA4996964996964FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF99696499
                  6964996964996964996964FF00FFFF00FFFF00FFFF00FFFF00FF}
                Visible = False
                ExplicitLeft = 697
              end
              inherited SpeedButton6: TSpeedButton
                Hint = 'Desmarcar agendamento - [BAS387]'
                Glyph.Data = {
                  36050000424D3605000000000000F60200002800000018000000180000000100
                  08000000000040020000120B0000120B0000B0000000B000000000000000FFFF
                  FF004E4D50005C5B5D00FF00FF003F3D3E00403E3F004C4B4B00FEFCFC00C9C7
                  C700FEFCFB00BC4B0000827E7B00D9640100FEEFE100FEF0E300FEF3E900FEF4
                  EB00FED1A400FED5AB00FEDAB500FEDEBD00FEE7D100FEE9D400FEEAD700FEEB
                  D800FEEFE000FEF0E200FEF2E600FEF4EA00FEF7F000FEF8F200FEFAF600FEFB
                  F800FEFCFA00D5812700FECB9600FED3A500FED5A900FED7AC00FED7AD00FED8
                  AD00FED8B000FED9B200FEDAB200FEDCB700FEDCB800FEDEBB00FEE1C100FEE2
                  C400FEE3C600FEE3C700FEE5C900FEE5CA00FEE6CC00FEE7CF00FEE9D300FEEA
                  D400FEEDDA00FEEEDD00FEF0E100FEF2E500FEF3E700FEF6ED00FEDCB500FEE0
                  BD00FEE1C000FEE7CC00FEE9CF00FEE9D000FEE9D100FEEBD500FEEDD900FEEF
                  DE00FEF7EF00FEEEDA00FEF2E300FEF3E500FEF7EE00FEFBF700FEFAF400C6C4
                  C100FEFAF300FEFBF6006DA9600084B07E00639D5F0075A972008BBA8800007F
                  0000006F0000005900002BAA2E0090E691006CD574000A8B19000EA02300112D
                  170016B03A0020B846001CB846001A7335001C5E3B0047866A0054809E001E7F
                  F700162F4E001C67C50016294100162335001664DD0015376C00112753000F44
                  B80011295C000C297A000A2D96002856F8002A59FF00305FFB0013151C001844
                  FF002049F8002250FF00244BEF000E36FF00123BFF00133EFF00143BF8001540
                  FF001A41F700193FF0001D42ED000A31FC000A2BF3000B2EFF000C33FF000C2F
                  F7000C2EF6000D34FF000D2EF3000E32FF000E2FF3000E30F3001032F6001033
                  F6001135FB001134F6001133F0001134ED001336F000001FFF000425FF000626
                  FA000624F0000724ED00082AFF000927F0000D2DF300001DFF00001CFB000018
                  F6000019F6000018F3000019F3000017EF00011CFE000118EE00021EF3000000
                  82001313150028282A0041414200EDEDEE0088888900FEFEFE00040404040404
                  04040404040404A9A9040404040404A9A904040404040404040404040404A985
                  9AA904040404A9A1A0A9040404040404040404040404A98A889BA90404A9A49F
                  A5A90B0B0B0B0B0B0B0B0B0B0B0B0BA98C8B9DA9A9A297A7A9040B3E1B3B1816
                  3531412D0B292612A98E7D99A69FA3A90B040B4E1D3D4948384332420B402A13
                  25A9899C98A8A9240B040B201F3F3E3C4B4744340B412D2B27A9928D8786A924
                  0B040B0A555B5B5B5B5B54460B322323A9827993907E9EA90B040BAF565A6063
                  5C595B3A0B3734A97A7B83A9A9947F8FA9040BAF575F645E5D625B0F0B19A975
                  7684A92B28A9958191A90BAFAF616668676558110B1AA9777CA923232323A996
                  80A90BAFAE78737473780C1F0B3E1BA9A9453531412E2CA9A9040BAFAC727171
                  717005210B4A1D3D4948174333302F140B040BAFAB6F6E6E6E6F06080B532323
                  23232323232323150B040BAFAB6D6B69696C07AF0B0A4F524E104C4919383632
                  0B040BAF03AAAA6C6AAA51AF0BAF0A21501E111C0E4B39370B040BAFAD02AAAA
                  0209AFAF0BAF232323232323232323190B040BAFAFAFAFAFAFAFAFAF0BAFAFAF
                  AF0821524A114D1A0B040BAFAFAFAFAFAFAFAFAF0BAFAFAFAFAF08224F1F3F3E
                  0B040B0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0B040B0B0B0B0B0B
                  0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B04040B0B0B0B0B0B0B0B0B0B0B0B0B
                  0B0B0B0B0B0B0B0B040404040404040404040404040404040404040404040404
                  0404040404040404040404040404040404040404040404040404}
                OnClick = SpeedButton6Click
              end
              inherited SpeedButton7: TSpeedButton
                Left = 236
                Hint = 'Editar agendamento - [BAS386]'
                Glyph.Data = {
                  2A060000424D2A06000000000000EA0300002800000018000000180000000100
                  08000000000040020000120B0000120B0000ED000000ED00000000000000FFFF
                  FF004E4D50005C5B5D00534E5700FF00FF003F3D3E00403E3F003F2F30005B35
                  3500643B3B008B555500804E4E0091595900965D5D008B565600734747008C57
                  570095606000AA6E6E00A96D6D00A76C6C00A66B6B007A4F4F008C5B5B009160
                  6000B77A7A00B6797900B87B7B00BB7E7E00BA7D7D009C696900CB8C8C00CA8B
                  8B00C7898900C98B8B00C78A8A00CC8E8E00DA9A9A00D9999900C2898900D99A
                  9A00DC9D9D00E1A1A100DA9C9C00E2A3A300EBAAAA00E2A4A400E1A3A3004C4B
                  4B00FEFCFC00C9C7C700FCFBFB005A3432005D383600764D4B00B6A19F005C35
                  2F00B7A19C00B7A39E00B7A09A00DDCBC200FEFCFB00BC4B0000BB4B0000B849
                  0000B6490000B5480000A7430000A1410000903900008C380000722D0000702D
                  00005A2400005B27030091400C0089512B0076604F00827E7B00D9640100D763
                  01009F5E2800755E4B00755E4C00D5680600653C1600FAE3CE00FAF0E700F3C2
                  9000E0B58900C1A07F00FEEAD700FEF0E200FEF4EA00FEF8F200FEFAF600FEFB
                  F800FAF7F400D5812700D17F2600CF7D2600BF732300A0621D007F4D1700683F
                  1300824F1800FECB9600FBC99500FCCA9600F3C49100F4C59200E0B58700F6C7
                  9600BD9A7500E5BB8F00E3BB9000C2A07B00967B5F00C2A17E009A8166009C83
                  6800998268007D6A5500F4E0CB00FCEBD800FEEEDD00FEF0E100FEF2E500FEF3
                  E700FEF6ED00BD9C7600967D60007A6A5700FAEAD700FEEFDE00FAF3EB00FEF7
                  EE00FCF7F000FAF6F000F3EFE900C6C4C100FCFAF700FAF6EF00F4F2EE00FCFA
                  F400FBFAF70084B07E00639D5F0075A972008AB8870005500300007E0000006F
                  000000590000005600002BAA2E0090E691006CD574000A8B19000EA02300112D
                  170016B03A0020B846001CB846001A7335001C5E3B0047866A00758686001734
                  3C004D6C750000BDFF0000B1F20000AAEA0000A6E600009FDE000093D100097B
                  AB000087C4000084C100028AC4000A405900113B4E00008CD100036A9D000468
                  9A000459830005679800064F7500073953000F2C3A00182A33001B506E003150
                  650054809E00354756001E7FF700162F4E002A3440001C67C500162941001623
                  35001664DD0015376C0011275300414855000F44B80011295C000C297A00012B
                  A7000A2D960013151C00001C9D002D4FF6005270FC00021DB100031EB1000420
                  B8000725DC000F2ECC001839E3000C21BF00010D9D001322BD001624BF000109
                  9700010A9700050DA50000058F0000008200131315001F1F210028282A004141
                  4200EDEDEE0088888900FEFEFE000505050505E7E70505050505050505050505
                  0505050505050505050505E7E7BFBE0505050505050505050505050505050505
                  05050505B6B9BCBD05050505050505050505050505053F3F3F3F4042A9B8BBC0
                  C6084B49474443403F3F3F3F3F053F815D7E5C57A8BAC112130E0A5376727059
                  6C6B6B6B3F053F895E80877D7CB518251D130E0A537672706E6C6B6B3F053F60
                  5F82817F86AA1F2A201E140D095484835A6F6C6B3F053F3E939A9A9A9A9B372F
                  2A201E14113556686766656D3F053FEC9499A0A39C9897172D2A211C150F094E
                  7875737140053FEC959FA49E9DA29A3D10302C231C150F367B79777442053FEC
                  ECA1A6C2A7A596584C102B26231A160B39696A5B44053FECEBD3D0D2D0D34F8A
                  403C102B29241A160B09857A46053FECE9CFCECECECC066140883A192E27221B
                  0CCDC38548053FECE8CBCACACACB07323F916452192E2704B4ADAEB24A053FEC
                  E8C9C7C4C4C831EC3F3E8E8F3B1928B1ABABAED4E5053FEC03E6E6C8C5E68DEC
                  3FEC3E8E8B3810AFABB7D4DEE2E53FECEA02E6E60233ECEC3FEC636363644DB0
                  ACD1DAD9D7E23FECECECECECECECECEC3FECECECEC34628CB3DDD5DBD8E43FEC
                  ECECECECECECECEC3FECECECECEC349290E0D6DCE1053F505050505050505050
                  50505050505050505155DFE345053F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F
                  3F4041434305053F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F404005050505
                  0505050505050505050505050505050505050505050505050505050505050505
                  0505050505050505050505050505}
                OnClick = SpeedButton7Click
                ExplicitLeft = 236
              end
              inherited SpeedButton8: TSpeedButton
                Left = 349
                Hint = 'Adiar sugest'#227'o - [BAS388]'
                Glyph.Data = {
                  56050000424D5605000000000000160300002800000018000000180000000100
                  08000000000040020000120B0000120B0000B8000000B800000000000000FFFF
                  FF00FF00FF00792A0D00963511005B585700FEFBFA005D210A0055230F009844
                  1000FEF8F400BD580C00FEF7F200FEFAF700FEF8F300E97F1E00FEF4EB00FEF6
                  EF00FED0A100FED1A400FEDAB600FBD9B600FEDDBB00FEDEBD00FEE6CE00FEEF
                  E000FEF0E200FEF4EA00FEF6EE00FEF7F000FEFAF600FEFBF800FEFCFA00FECB
                  9600FECC9800FECE9900FECF9D00FECF9E00FED09E00FED4A600A0866900FED5
                  A900FED7AB00FED8AD00FED9B000FED9B100FEDAB400FEDCB800FEDEBC00FEE0
                  BF00FEE0C000FEE1C100FEE2C400FEE3C600FEE5C900FEE5CA00FEE6CB00FEE7
                  CF00FEEAD400FEEAD500FEEBD700FEEEDC00FEEEDD00FEF0E100FEF2E500FEF4
                  E900FEF6ED00FEE5C700FEE9D000B1A39300FEEBD500FEEDD900D9CBBB00FEEF
                  DD00FEEFDE00FEF3E600FEF7EF00907D6500FEF2E200FEF2E300FEF4E7009081
                  6C009F988E00FEF6EB00FEFAF4002F2E2C00D4D1BD00C0BFB000FEFEFB00FEFE
                  FC0045514200374F3500446D430000650000005D0000005B0000005800000051
                  0000004B0000004A000000470000003A00002F8F3300004108001EBC3400199E
                  2B004D76540037E160004DA56200506A56004BFE820044E6760047F27D00005B
                  23002C2E2D00065336006B77740002494300A0B2B2001B6A780052E5FC0053E5
                  FC0039C7E6003DCFED0041D5F20013ADD00005BFFC000FACE00017C1F60013A5
                  D3001BC9FE001EC6FA002BCAFA002DB5E00035B8E30003BCFB0003BBFA0003BA
                  F80004BDFC0005A7E30014B5EB001BADE10022AFE10028B0E0002BB1E00034B7
                  E30037B8E30039B8E30000A9E900009EDD000093D00001ADEE0001A0DC000491
                  CB000B90C600188FBD00008BC900008AC7000087C400007EB8000387C100007B
                  B7000078B4000070AB000068A3000069A30000659F000268A1000269A1000365
                  9C0000639D0000609900005E9800005F9800005C9600005B950002588B000057
                  900000477E0000437900003C7000FEFEFE00DCDCDC00FFFFFF00020202020202
                  02020202020202020202020202B4B4B402020202020202020202020202020202
                  02020202B2819FABB4020202020202020202020202020202020202AE857F98A1
                  ADB402020202020202020202020202020202AC91A7809496A2B4040404040404
                  040404040404030708AC86A87889959EA3B304534B19475D383417142C60284D
                  AC92A87888A48C9AB102040E1C501A5D3A183531156151AC93A87987A67C90AC
                  0402041F541D415D3E463936335F74ACA8798AAA7B8FAC210402045D5D5D5D5D
                  5D5D5D5D5E6467A9847EA57A8EAC5D5D040204B5B5580D5D424B3F484573AC9B
                  7D9DA08DAC242221040204B5B5B5595D0E114152ACAC8297B0AFACAC27122523
                  040204B5B5B5B55D06541D76AC83979CAC56575D2B2913260402045D5D5D5D62
                  62626365778B99AC715D5D5D5D5D5D5D040204B5B5B5B5626E6B695C7275ACAC
                  3D3A185D322F2D2A040204B5B5B5B5626E6F6A5566624C1B4F493C5D4333162E
                  040204B5B5B5B562706D056C68621E0C1040195D443734300402045D5D5D5D62
                  635A5B6262625D5D5D5D5D5D5D5D5D5D040204B5B5B5B55DB5B5B5B5B55DB559
                  1F0A4C5D4E3D3B18040204B5B5B5B55DB5B5B5B5B55DB5B5B5201E5D104F4A3C
                  040204B6B6B6B65DB6B6B6B6B65DB6B6B6B6B65DB6B6B6B60402040909090909
                  0909090909090909090909090909090904020B0F0F0F0F0F0F0F0F0F0F0F0F0F
                  0F0F0F0F0F0F0F0F0B02020B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B
                  0202020202020202020202020202020202020202020202020202}
                OnClick = SpeedButton8Click
                ExplicitLeft = 349
              end
              inherited SpeedButton11: TSpeedButton
                Left = 522
                Hint = 'Cancelar sugest'#227'o - [BAS390]'
                Glyph.Data = {
                  76060000424D7606000000000000360400002800000018000000180000000100
                  08000000000040020000220B0000220B000000010000000100000031DE00FF00
                  FF000031FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00010101010101
                  0101010101010101010101010101010101010101010101010101010101010101
                  0101010101010100000101010101010101010101010101010101010101010000
                  0001010100000001010101010101010101010101010000000101010100000000
                  0101010101010101010101000000000101010101000000000001010101010101
                  0101000000000101010101010100000000000101010101010100000000010101
                  0101010101010200000000010101010100000000010101010101010101010101
                  0000000001010000000000010101010101010101010101010100000000000000
                  0000010101010101010101010101010101010000020002000001010101010101
                  0101010101010101010101000000020001010101010101010101010101010101
                  0101000002000002020101010101010101010101010101010100000200020202
                  0002010101010101010101010101010102020200020101020202020101010101
                  0101010101010102020002020101010102020202010101010101010101010202
                  0202020101010101010102020201010101010101010202020202010101010101
                  0101010202020101010101010202020202010101010101010101010101020101
                  0101010202020202010101010101010101010101010101010101010202020201
                  0101010101010101010101010101010101010102020201010101010101010101
                  0101010101010101010101010101010101010101010101010101010101010101
                  0101010101010101010101010101010101010101010101010101}
                OnClick = SpeedButton11Click
                ExplicitLeft = 522
              end
              inherited SpeedButton12: TSpeedButton
                Left = 464
                Hint = 'Reabrir sugest'#227'o - [BAS391]'
                Glyph.Data = {
                  76060000424D7606000000000000360400002800000018000000180000000100
                  08000000000040020000230B0000230B00000001000000010000009C00000073
                  0800B5848400EFCE9400C6A59C00EFCE9C00C6ADA500BDD6A500F7D6A500F7D6
                  AD00F7D6B500F7DEB500F7DEBD00F7DEC600F7E7C600F7E7CE00F7E7D600FFEF
                  DE00FFF7E700FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00131313130412
                  12121210100F0F0F0D0D0D0B09090505021313131313041212121210100F0F0F
                  0D0D0D0B0909050502131313131304121010100F0F0F0D0D0D0B0B0905050505
                  02131313131306121110100F0F0D0C0C0A090905050503030213131313130610
                  1110100F0D0D0C0A0909050505030303021313131313061011100F0D0D0C0A09
                  0905050505030303021313131313040F10100D0C0C0A09090505050503030303
                  021313131313040F0F0D0D0C0A0909050505050303030303021313130113040D
                  0E0D0C0A090905050505030303030303021313130001020D0E0C0B0A09080505
                  0503030303030303021301010000010202020202020202020202020202020202
                  0213000000000001131313131313131313131313131313131313000000000007
                  1313131313131313131313131313131313131313000007131313131313131313
                  1313131313131313131313130007020202020202020202020202020202020202
                  021313131313040D0E0C0B0A090805050503030303030303021313131313040D
                  0E0D0C0A090905050505030303030303021313131313040F0F0D0D0C0A090905
                  0505050303030303021313131313060F10100D0C0C0A09090505050503030303
                  021313131313061011100F0D0D0C0A0909050505050303030213131313130610
                  1110100F0D0D0C0A090905050503030302131313131304121110100F0F0D0C0C
                  0A0909050505030302131313131304121212100F0F0F0D0D0D0B0B0905050505
                  021313131313041212121210100F0F0F0D0D0D0B090905050213}
                OnClick = SpeedButton12Click
                ExplicitLeft = 464
              end
              inherited SpeedButton23: TSpeedButton
                Left = 406
                Hint = 'Finalizar sugest'#227'o - [BAS389]'
                Glyph.Data = {
                  4A030000424D4A030000000000000A0100002800000018000000180000000100
                  08000000000040020000120B0000120B0000350000003500000000000000FFFF
                  FF00FF00FF00004B0000035E0600046408000793100008961100089612000997
                  130009971400099612000996130007740E000A9915000B991600097411000C9A
                  18000D9E1B000FA01D000FA11F000C77170010951F000E7D1A00119620000F81
                  1C00118C1F00139823001197220014A727001399250013902400159A2700138F
                  2300169D2900169C2800159127001AAF31001BB033001B9F310021B83D001C9C
                  340020AA3B0023AD410028C1490028C048002FC954002EC1520035CF5E0036D0
                  60003BD768003FD96F0041DC7000020202020202020202020202020202020202
                  0202020202020202020202020202020202020202020202020202020202020202
                  0202020202020202020202020202020202020202020202020202020202020202
                  0202020202020202020202020202020202020202020203020202020202020202
                  02020202020202020202020202031A0302020202020202020202020202020202
                  0202020203210623030202020202020202020202020202020202020324130F07
                  2003020202020202020202020202020202020319251D1411081E030202020202
                  02020202020202020203172D28261F0322091B03020202020202020202020202
                  0315302E2C27030203120A1C030202020202020202020202033332312A030202
                  0203100E1803020202020202020202020329342B03020202020202030F160302
                  020202020202020202032F03020202020202020203110B030202020202020202
                  0202030202020202020202020203050C03020202020202020202020202020202
                  02020202020202030D0302020202020202020202020202020202020202020202
                  0304030202020202020202020202020202020202020202020202030302020202
                  0202020202020202020202020202020202020202030202020202020202020202
                  0202020202020202020202020202020202020202020202020202020202020202
                  0202020202020202020202020202020202020202020202020202020202020202
                  0202020202020202020202020202020202020202020202020202020202020202
                  0202020202020202020202020202}
                OnClick = SpeedButton23Click
                ExplicitLeft = 406
              end
              inherited SpeedButton24: TSpeedButton
                Left = 580
                Hint = 'Atualizar (F5)'
                Glyph.Data = {
                  F6060000424DF606000000000000360000002800000018000000180000000100
                  180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FF92635D8E5D598E5D598E5D598E5D598E5D598E5D598E5D59
                  8E5D598E5D598E5D598E5D598E5D598E5D598E5D598E5D598E5D598E5D598050
                  4BFF00FFFF00FFFF00FFFF00FFFF00FF93655EEFD3B4F6DAB6F3D5ADF2D1A5F0
                  CE9EEFCB97EFC791EEC589EBC182EBC080EBC080EBC080EBC080EBC080EBC080
                  EDC180EABF7F80504BFF00FFFF00FFFF00FFFF00FFFF00FF93655FEED4B8F4DA
                  BBF2D5B1F0D1AAEFCFA3EECB9DEDC796EDC58FEBC188EABF82E9BD7FE9BD7FE9
                  BD7FE9BD7FE9BD7FEABF7FE7BC7E80504BFF00FFFF00FFFF00FFFF00FFFF00FF
                  93655FEED7C0F6E0C1F2D9B8F2D4B1F0D1AAEFCFA4EECB9DEDC796EDC58FEBC1
                  89EABF82E9BD7FE9BD7FE9BD7FE9BD7FEABF7FE7BC7E80504BFF00FFFF00FFFF
                  00FFFF00FFFF00FF93655FEFDAC5F7E2C7F3DCBFF2D8B7007000F0D1AAEFCEA3
                  B1B874007000007000007000ADAD60E9BD7FE9BD7FE9BD7FEABF7FE7BC7E8050
                  4BFF00FFFF00FFFF00FFFF00FFFF00FF936560F0DECCF8E6CFF6E0C6F3DCBD00
                  7000047503B2BD7F007000B1B874EDC796B0B46B007000ADAF62E9BD7FE9BD7F
                  EABF7FE7BC7E80504BFF00FFFF00FFFF00FFFF00FFFF00FF956660F2E2D3FAEA
                  D7F6E3CEF4DEC5007000007000007000B2BD7FEFCEA3EECB9DEDC797B0B46B00
                  7000E9BD81E9BD7FEABF7FE7BC7E80504BFF00FFFF00FFFF00FFFF00FFFF00FF
                  986963F2E6DAFAEEDEF7E7D4F6E2CB007000007000007000007000F0D1A9EFCE
                  A3EECB9DEDC796007000EBC189E9BD81EABF7FE7BC7E80504BFF00FFFF00FFFF
                  00FFFF00FFFF00FF9E6E64F4EAE1FBF2E6F8EADCF7E6D3007000007000007000
                  007000007000F0D1AAEFCEA4EDCB9CEDC796EBC58FEBC188EABF82E7BB7E8050
                  4BFF00FFFF00FFFF00FFFF00FFFF00FFA37266F6EEE9FCF6EDF8EFE3F7EADAF7
                  E6D3F6E2CCF4DEC5F3DCBDF2D8B6F0D5B0F0D1AAEFCEA3EECA9CEDC795EBC48E
                  EBC288E7BC8080504BFF00FFFF00FFFF00FFFF00FFFF00FFA77568F8F3F0FEFB
                  F6FBF3EBF8EEE3F8EBDCF7E7D3F6E2CCF4E0C500700000700000700000700000
                  7000EDCB9CEDC795EDC58FE9BF8780504BFF00FFFF00FFFF00FFFF00FFFF00FF
                  AC7969FAF6F4FFFFFEFEF8F3FBF2EA007000F8EBDAF7E6D3F7E2CCF6E0C50070
                  00007000007000007000EFCEA3EECB9CEEC996EAC18E80504BFF00FFFF00FFFF
                  00FFFF00FFFF00FFB17E6BFAF6F4FFFFFFFFFEFBFEF7F0007000BAD4AAF8EADA
                  F7E7D3F6E2CBB7C792007000007000007000F0D1A9EFCEA1EECB9CEBC5928050
                  4BFF00FFFF00FFFF00FFFF00FFFF00FFB6816CFAF6F4FFFFFFFFFFFFFFFCFBBC
                  DAB4007000B8D3AAF8EBDCB7CC9D007000B7C792047503007000F2D4AFF0D1A9
                  F0CFA3EDC99980504BFF00FFFF00FFFF00FFFF00FFFF00FFBB846EFAF6F4FFFF
                  FFFFFFFFFFFFFFFFFEFBBCDAB4007000007000007000B7CC9DF6E2CBF6DEC400
                  7000F2D8B6F0D4AFEFD0A7CEB49180504BFF00FFFF00FFFF00FFFF00FFFF00FF
                  C0896FFBF7F4FFFFFFFFFFFFFFFFFFFFFFFFFFFEFBFEF7F2FBF2EAFAEEE2F8EB
                  DAF7E6D3F6E2CBF6DEC4F3DCBDE5CEAFC4B096A1927F80504BFF00FFFF00FFFF
                  00FFFF00FFFF00FFC58C70FBF7F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFB
                  FCF8F2FBF3EAF8EEE2F8EAD9F8E7D4FAE9D0E0D0BAB8AB9AA79C8BA497868050
                  4BFF00FFFF00FFFF00FFFF00FFFF00FFCB9173FBF7F4FFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFEFBFCF7F0FBF2E9FBF2E5E9D3C4A0675BA0675BA0675B
                  A0675BA0675BA0675BFF00FFFF00FFFF00FFFF00FFFF00FFCF9674FBF7F6FFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFAFCF7F0FFFAEFDAC0B6A0
                  675BDAA16BDD984FE2903AEA8923A5686BFF00FFFF00FFFF00FFFF00FFFF00FF
                  D49875FCF8F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC
                  FBFFFEF7DDC4BCA0675BEAB474EFA952F6A036A5686BFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFD49875FCF8F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFDDC7C2A0675BEAB273EFA751A5686BFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFD49875FFFEFEFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2D0CEA0675BEDB572A5686B
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCF8E68CF8E68CF8E
                  68CF8E68CF8E68CF8E68CF8E68CF8E68CF8E68CF8E68CF8E68CF8E68CF8E68A0
                  675BA5686BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                OnClick = SpeedButton24Click
                ExplicitLeft = 580
              end
              inherited SpeedButton25: TSpeedButton
                Left = 640
                Enabled = False
                Glyph.Data = {
                  36050000424D3605000000000000F60200002800000018000000180000000100
                  08000000000040020000120B0000120B0000B0000000B000000000000000FFFF
                  FF004E4D50005C5B5D00FF00FF003F3D3E00403E3F004C4B4B00FEFCFC00C9C7
                  C700FEFCFB00BC4B0000827E7B00D9640100FEEFE100FEF0E300FEF3E900FEF4
                  EB00FED1A400FED5AB00FEDAB500FEDEBD00FEE7D100FEE9D400FEEAD700FEEB
                  D800FEEFE000FEF0E200FEF2E600FEF4EA00FEF7F000FEF8F200FEFAF600FEFB
                  F800FEFCFA00D5812700FECB9600FED3A500FED5A900FED7AC00FED7AD00FED8
                  AD00FED8B000FED9B200FEDAB200FEDCB700FEDCB800FEDEBB00FEE1C100FEE2
                  C400FEE3C600FEE3C700FEE5C900FEE5CA00FEE6CC00FEE7CF00FEE9D300FEEA
                  D400FEEDDA00FEEEDD00FEF0E100FEF2E500FEF3E700FEF6ED00FEDCB500FEE0
                  BD00FEE1C000FEE7CC00FEE9CF00FEE9D000FEE9D100FEEBD500FEEDD900FEEF
                  DE00FEF7EF00FEEEDA00FEF2E300FEF3E500FEF7EE00FEFBF700FEFAF400C6C4
                  C100FEFAF300FEFBF6006DA9600084B07E00639D5F0075A972008BBA8800007F
                  0000006F0000005900002BAA2E0090E691006CD574000A8B19000EA02300112D
                  170016B03A0020B846001CB846001A7335001C5E3B0047866A0054809E001E7F
                  F700162F4E001C67C50016294100162335001664DD0015376C00112753000F44
                  B80011295C000C297A000A2D96002856F8002A59FF00305FFB0013151C001844
                  FF002049F8002250FF00244BEF000E36FF00123BFF00133EFF00143BF8001540
                  FF001A41F700193FF0001D42ED000A31FC000A2BF3000B2EFF000C33FF000C2F
                  F7000C2EF6000D34FF000D2EF3000E32FF000E2FF3000E30F3001032F6001033
                  F6001135FB001134F6001133F0001134ED001336F000001FFF000425FF000626
                  FA000624F0000724ED00082AFF000927F0000D2DF300001DFF00001CFB000018
                  F6000019F6000018F3000019F3000017EF00011CFE000118EE00021EF3000000
                  82001313150028282A0041414200EDEDEE0088888900FEFEFE00040404040404
                  04040404040404A9A9040404040404A9A904040404040404040404040404A985
                  9AA904040404A9A1A0A9040404040404040404040404A98A889BA90404A9A49F
                  A5A90B0B0B0B0B0B0B0B0B0B0B0B0BA98C8B9DA9A9A297A7A9040B3E1B3B1816
                  3531412D0B292612A98E7D99A69FA3A90B040B4E1D3D4948384332420B402A13
                  25A9899C98A8A9240B040B201F3F3E3C4B4744340B412D2B27A9928D8786A924
                  0B040B0A555B5B5B5B5B54460B322323A9827993907E9EA90B040BAF565A6063
                  5C595B3A0B3734A97A7B83A9A9947F8FA9040BAF575F645E5D625B0F0B19A975
                  7684A92B28A9958191A90BAFAF616668676558110B1AA9777CA923232323A996
                  80A90BAFAE78737473780C1F0B3E1BA9A9453531412E2CA9A9040BAFAC727171
                  717005210B4A1D3D4948174333302F140B040BAFAB6F6E6E6E6F06080B532323
                  23232323232323150B040BAFAB6D6B69696C07AF0B0A4F524E104C4919383632
                  0B040BAF03AAAA6C6AAA51AF0BAF0A21501E111C0E4B39370B040BAFAD02AAAA
                  0209AFAF0BAF232323232323232323190B040BAFAFAFAFAFAFAFAFAF0BAFAFAF
                  AF0821524A114D1A0B040BAFAFAFAFAFAFAFAFAF0BAFAFAFAFAF08224F1F3F3E
                  0B040B0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0B040B0B0B0B0B0B
                  0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B04040B0B0B0B0B0B0B0B0B0B0B0B0B
                  0B0B0B0B0B0B0B0B040404040404040404040404040404040404040404040404
                  0404040404040404040404040404040404040404040404040404}
                ExplicitLeft = 640
              end
              inherited SpeedButton26: TSpeedButton
                Left = 7
                Hint = 'Visualizar servi'#231'o - [BAS378]'
                Glyph.Data = {
                  F6060000424DF606000000000000360000002800000018000000180000000100
                  180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FF969190736E6EAF7D7EFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FF9792916C6C70174B82326089AF7B7BFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF8386863A79B11A81FF0D62
                  BC3B5F7FB07D7DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF2698FF
                  3DB0FF349DFF1C7EF80C62BA395E7FB07B7DFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FF2996FF42ADFE349AFF1C7EF80C60B8405F7FB17D7BFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF2A96FE41AFFE349AFF1C7EF80C
                  5FB83E5F7EB07B7BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF2A97
                  FE41AFFE349AFF1A7BF80B5FB744627FA97A7EFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FF2C98FE41ADFE349CFF197BF60C5EB62B587FFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF2D99FE41ADFE339CFF287FE7
                  3D607BFF00FFFF00FFFF00FF996964996964996964996964996964FF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF2D
                  9AFE4BB5FF8CBDEDAC9F966C565593665F996964DDCCABFFFFD9FFFFD9FFFFD7
                  E9D5B6996964996964FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFD1ADA5B68775CCAB8CFFFFD3FFFFD3FF
                  FFD0FFFFCFFFFFD0FFFFD3FFFFE2D4BAA4996964FF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF996B65D4AF8FFFEF
                  B0FBEDB8FFFFCFFFFFCEFFFFCFFFFFD7FFFFDCFFFFEAFFFFFFD3BBB8996964FF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  996964FFEAA6F2C78FFAEBB6FFFFD0FFFFCFFFFFD3FFFFE5FFFFF2FFFFFAFFFF
                  FCFFFFFE996964FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FF996964E6C9A0F6CA8BEEBA7FFBE7B4FFFFD0FFFFCFFFFFD7FFFFEB
                  FFFFFEFFFFFCFFFFF2FFFFE5D8C6A5996964FF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FF996964FFEFADF0BC7DEBB075F7DDA7FEFCCBFF
                  FFD1FFFFD5FFFFE6FFFFF6FFFFF6FFFFE6FFFFD7FFFFDA996964FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF996964FFF0AFEFBA7BE9A5
                  6AF2C98FFCEFBCFFFFD1FFFFD3FFFFD9FFFFE1FFFFE2FFFFD9FFFFD3FFFFDA99
                  6964FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF996964
                  FFF2B2F3C484E99E63EDB57AF4D79FFCF4C2FFFFD1FFFFD3FFFFD3FFFFD3FFFF
                  D0FFFFCFFFFFD8996964FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FF996964E6C9A0FCDE9EEFBA7EEEB779EFC284F6DAA1FBF2BFFFFFCF
                  FFFFD1FFFFD0FFFFD0FFFFD1D9C6A5996964FF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FF996964FFFEC2FBEBCAF6D7ACF0C186EF
                  BF82F3CC95FAE3ADFCF0BCFBF4C1FEF6C4FFFFD4996964FF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF996964D7BB9EFFFF
                  FFFEF7EEF6D8ACEDB474E9A76BEDB478F0C48AF6D49CFFF4B6D3B799996964FF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FF996964CEB6AFFFFFFFFFF4CBF6CF90F0BC7DF2BF81F7CE90FFEDA9D4B1
                  93996964FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FF996964996964E1C9A0FFF7B5FFF2AFFFF2B1
                  E9CCA4996964996964FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF99696499
                  6964996964996964996964FF00FFFF00FFFF00FFFF00FFFF00FF}
                OnClick = SpeedButton26Click
                ExplicitLeft = 7
              end
            end
            inherited GroupBox2: TGroupBox
              Height = 288
              ExplicitHeight = 288
              inherited ScrollBox2: TScrollBox
                Height = 271
                ExplicitHeight = 271
              end
            end
          end
        end
        inherited tsMemo: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 837
          ExplicitHeight = 510
        end
        object tsSugestaoServico: TTabSheet
          Caption = 'tsSugestaoServico'
          ImageIndex = 3
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object ScrollBox4: TScrollBox
            Left = 0
            Top = 0
            Width = 837
            Height = 510
            Align = alClient
            TabOrder = 0
            object GroupBox4: TGroupBox
              Left = 0
              Top = 0
              Width = 833
              Height = 506
              Align = alClient
              Caption = 'Sugest'#227'o servi'#231'o pendente'
              TabOrder = 0
              object Panel4: TPanel
                Left = 2
                Top = 15
                Width = 829
                Height = 40
                Align = alTop
                BevelKind = bkTile
                BevelOuter = bvNone
                TabOrder = 2
                object Label28: TLabel
                  Left = 615
                  Top = 13
                  Width = 54
                  Height = 13
                  Caption = 'Agendados'
                end
                object SpeedButton55: TSpeedButton
                  Left = 793
                  Top = 9
                  Width = 23
                  Height = 22
                  Flat = True
                  Glyph.Data = {
                    36050000424D3605000000000000360400002800000010000000100000000100
                    08000000000000010000D30E0000D30E00000001000000010000007B00000084
                    0000008C00000094000008940800009C0800089C080008A50800008C1000088C
                    100008A5100010A5100018731800318C180021941800109C180010A5180018A5
                    180010AD1800317B21005A8421001894210018B52100217B2900399429005294
                    2900299C29004AA5290052A5290018AD290018B5290021B52900428C3100399C
                    310031A5310021B5310031B5310021BD3100218C390018A5390039A5390029C6
                    39006B844200188C4200319C4200399C420042B5420029C642005A944A00429C
                    4A007B9C4A0073AD4A008CB54A0052BD4A0031CE4A00525252006B63520039CE
                    520031D6520039D652005A5A5A007B735A0018A55A0063A55A008CA55A0021AD
                    5A004ACE5A0039D65A0063636300736B6300847363008C73630063C6630073C6
                    630042D66300214A6B006B6B6B006B736B0063D66B0042DE6B004ADE6B0042E7
                    6B004AE76B00295A73004AE77300294A7B00316B7B00426B7B0073737B00B59C
                    7B0084BD7B00B5C67B007BCE7B005AE77B0063E77B0052EF7B00104284002952
                    84005263840018848400CEAD840073B5840073D6840052EF84005AEF84000042
                    8C00295A8C00426B8C008C8C8C00B5A58C00214A940000529400215294002163
                    94006BF7940029639C004A849C0073849C009C9C9C009CA59C0031AD9C00C6B5
                    9C000063A5000863A500006BA5001873A5004A94A500A5A5A50094E7A500006B
                    AD00086BAD001873AD002173AD009CEFAD008CF7AD001073B500007BB500217B
                    B500297BB500218CB5003194B50039A5B500C6BDB500ADEFB500007BBD001884
                    BD002184BD00188CBD0063ADBD0073ADBD00A5C6BD00008CC600108CC600298C
                    C6001094C60042A5C6009CC6C6000894CE001094CE002994CE00009CCE00089C
                    CE00109CCE00189CCE00CECECE00CED6CE00089CD60010A5D60018A5D60029A5
                    D60021ADD60039ADD6005AADD60063C6D6009CCED600D6D6D600DEDED60018A5
                    DE0021A5DE0029A5DE0042A5DE0031ADDE004AADDE0042B5DE0042BDDE00BDD6
                    DE00DEDEDE00E7EFDE0029ADE70039ADE70042ADE70031B5E70039B5E70042B5
                    E70052B5E70063BDE7006BC6E70039B5EF004AB5EF0042BDEF004ABDEF0052C6
                    EF005AC6EF006BC6EF004ABDF7004AC6F70052C6F700FF00FF005AC6FF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CFCFCFCFCFCF
                    CFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCF7569CFCFCFCFCFCFCFCFCFCFCF
                    8483618AA96A6F7BCFCFCFCFCFCFCFCFB6C17B9FB5829A9ECFCFCFCFCFCFCF70
                    99C8C7C1B5B3A89A6962CFCFCFCFCF6EBECEC8C3747D9E9A7C71CFCFCFCFCFC4
                    C9C8CBBA4C539A9DA294CFCFCFCFCF268DC8CBBA4C56A8A3A3CFCF3F09001839
                    78B7ADAF4457A9A9CFCFCF1A50231D39273E2E7937479BA3CFCFCF0D50544339
                    2F25110E2ACFCFCFCFCF2823545466651510100619CFCFCFCFCF80725F50AF7F
                    17040A1049CFCFCFCFCFCF4A5050AF7F2D25111BCFCFCFCFCFCFCFCF5D50A46C
                    303548CFCFCFCFCFCFCFCFCFCF4A6D45341FCFCFCFCFCFCFCFCF}
                  OnClick = SpeedButton55Click
                end
                object CheckBox2: TCheckBox
                  Left = 17
                  Top = 14
                  Width = 196
                  Height = 17
                  Caption = 'Visualizar sugest'#245'es finalizadas'
                  TabOrder = 0
                  OnClick = CheckBox2Click
                end
                object BitBtn7: TBitBtn
                  Left = 676
                  Top = 9
                  Width = 75
                  Height = 25
                  Hint = 'Sair desta tela'
                  Caption = '&Sair'
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 1
                  OnClick = BitBtn2Click
                  Glyph.Data = {
                    2E020000424D2E020000000000002E0100002800000010000000100000000100
                    08000000000000010000120B0000120B00003E0000003E00000000000000FFFF
                    FF00FF00FF00BB410000BB420000FFF6EF00E69C5900E69D5900E9A36200FFF4
                    EA00FFF8F200FECA9500FFCE9C00FFD4A900FEEBD800FEF0E200FFF2E500FFF3
                    E700FFFBF700FECE9C00FED3A500FED5AA00FEDAB400FFDCB600FEDDB800FEDD
                    BA00FFE3C500FEE2C400FFE5C900FFE6CA00FEE5CA00FFEBD500FEF3E700FFDA
                    AD00FFEAD100FFFAF400FFD8A700FFD9A900FFDAAB00FFE1B800FFE7C700FEEE
                    D900FFFBF600FFDCAC00FFE1B500FFE7C400FFEFD700FFEAC200FFFAEA00FFFE
                    FB00FFFFFA00FFFFFE00315EFF002A56FF00123BFF00153DFF001841FF001A44
                    FF001D47FF00072BFF00001EFF00000D66000202020202020202020202020202
                    0202020202020202020202020202020202020204040404040404040404040402
                    020202040132302E28272125242F04020202020401050F221B1614130B260402
                    0202020401310A101F1A170D0C2B04020202020401013323110E1C18152C0402
                    02020204010101332A20291D192D040202020204010101010112093D1E2E043D
                    020202040101010101013D363D013D3C3D020204080606060606073D373D3B3D
                    0202020203040404040404043D383D0202020202020202020202023D353D393D
                    020202020202020202023D343D023D3A3D020202020202020202023D0202023D
                    020202020202020202020202020202020202}
                end
                object Panel16: TPanel
                  Left = 560
                  Top = 15
                  Width = 49
                  Height = 13
                  BevelOuter = bvNone
                  Color = 10223541
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = 16745604
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentBackground = False
                  ParentFont = False
                  TabOrder = 2
                end
              end
              object Panel5: TPanel
                Left = 2
                Top = 55
                Width = 829
                Height = 57
                Align = alTop
                TabOrder = 1
              end
              object Panel6: TPanel
                Left = 2
                Top = 112
                Width = 829
                Height = 392
                Align = alClient
                BevelOuter = bvNone
                TabOrder = 0
              end
            end
          end
        end
      end
    end
    inherited PanelFlash: TPanel
      Left = 736
      Top = 304
      ExplicitLeft = 736
      ExplicitTop = 304
    end
  end
  inherited StatusBar1: TStatusBar
    Width = 852
    ExplicitWidth = 852
  end
  inherited pnStatusProcessamento: TPanel
    Left = 759
    Top = 528
    ExplicitLeft = 759
    ExplicitTop = 528
    inherited lbStatusProcessamento: TLabel
      ExplicitLeft = -30
      ExplicitTop = 29
    end
    inherited lbTextoProcessamento: TLabel
      Width = 477
      Height = 21
    end
  end
  inherited PopupMenu1: TPopupMenu
    Left = 620
    Top = 65529
  end
  inherited PopupMenu2: TPopupMenu
    Left = 734
    Top = 3
  end
  inherited Timer1: TTimer
    Left = 654
    Top = 3
  end
  inherited ApplicationEventsPadrao: TApplicationEvents
    Left = 558
    Top = 11
  end
end
