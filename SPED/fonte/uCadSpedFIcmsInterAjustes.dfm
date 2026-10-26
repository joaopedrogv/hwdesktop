inherited frmSpedFIcmsInterAjustes: TfrmSpedFIcmsInterAjustes
  Caption = 'Ajuste / Benef'#237'cio / Incentivo da apura'#231#227'o do icms Interestadual'
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
                object pnCadastro: TPanel
                  Left = 0
                  Top = 0
                  Width = 775
                  Height = 431
                  Align = alClient
                  BevelOuter = bvNone
                  BorderWidth = 6
                  TabOrder = 0
                  object ScrollBox4: TScrollBox
                    Left = 6
                    Top = 6
                    Width = 763
                    Height = 419
                    Align = alClient
                    BorderStyle = bsNone
                    TabOrder = 0
                    object GroupBox4: TGroupBox
                      Left = 0
                      Top = 0
                      Width = 763
                      Height = 129
                      Align = alTop
                      Caption = 'Dados'
                      TabOrder = 0
                      object Label6: TLabel
                        Left = 143
                        Top = 18
                        Width = 67
                        Height = 13
                        Caption = 'Codigo Ajuste'
                        FocusControl = DBEdit1
                      end
                      object Label7: TLabel
                        Left = 46
                        Top = 45
                        Width = 164
                        Height = 13
                        Caption = 'Descricao complementar do ajuste'
                      end
                      object Label8: TLabel
                        Left = 138
                        Top = 103
                        Width = 72
                        Height = 13
                        Caption = 'Valor do ajuste'
                        FocusControl = DBEdit3
                      end
                      object Label15: TLabel
                        Left = 417
                        Top = 18
                        Width = 33
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Estado'
                      end
                      object Label30: TLabel
                        Left = 427
                        Top = 105
                        Width = 23
                        Height = 13
                        Caption = 'Data'
                        FocusControl = DBEdit18
                      end
                      object DBEdit1: TDBEdit
                        Left = 216
                        Top = 15
                        Width = 134
                        Height = 21
                        CharCase = ecUpperCase
                        DataField = 'COD_AJ_APUR'
                        DataSource = dtmSPED.dsICMInterAJ
                        TabOrder = 0
                      end
                      object DBEdit3: TDBEdit
                        Left = 216
                        Top = 100
                        Width = 134
                        Height = 21
                        DataField = 'VL_AJ_APUR'
                        DataSource = dtmSPED.dsICMInterAJ
                        TabOrder = 3
                      end
                      object DBMemo1: TDBMemo
                        Left = 216
                        Top = 42
                        Width = 529
                        Height = 52
                        DataField = 'DESCR_COMPL_AJ'
                        DataSource = dtmSPED.dsICMInterAJ
                        MaxLength = 256
                        TabOrder = 2
                      end
                      object DBLookupComboBox2: TDBLookupComboBox
                        Left = 456
                        Top = 15
                        Width = 289
                        Height = 21
                        DataField = 'UF'
                        DataSource = dtmSPED.dsICMInterAJ
                        TabOrder = 1
                      end
                      object DBEdit18: TDBEdit
                        Left = 456
                        Top = 102
                        Width = 289
                        Height = 21
                        DataField = 'DATA_LANC'
                        DataSource = dtmSPED.dsICMInterAJ
                        TabOrder = 4
                      end
                    end
                    object Panel5: TPanel
                      Left = 0
                      Top = 129
                      Width = 763
                      Height = 6
                      Align = alTop
                      BevelOuter = bvNone
                      TabOrder = 1
                    end
                    object Panel4: TPanel
                      Left = 0
                      Top = 135
                      Width = 763
                      Height = 271
                      Align = alTop
                      BevelKind = bkTile
                      BevelOuter = bvNone
                      BorderWidth = 6
                      TabOrder = 2
                      object PageControl2: TPageControl
                        Left = 6
                        Top = 6
                        Width = 747
                        Height = 255
                        ActivePage = tsInfDoc
                        Align = alClient
                        Style = tsFlatButtons
                        TabOrder = 0
                        object tsInfAdicionais: TTabSheet
                          Caption = 'Informa'#231#227'oes Adicionais'
                          ExplicitLeft = 0
                          ExplicitTop = 0
                          ExplicitWidth = 0
                          ExplicitHeight = 0
                          object DBGrid2: TDBGrid
                            Left = 0
                            Top = 0
                            Width = 739
                            Height = 183
                            Align = alClient
                            DataSource = dtmSPED.dsICMInterAJ_Inf
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
                                FieldName = 'NUM_DA'
                                Width = 120
                                Visible = True
                              end
                              item
                                Expanded = False
                                FieldName = 'NUM_PROC'
                                Width = 100
                                Visible = True
                              end
                              item
                                Expanded = False
                                FieldName = 'IND_PROC'
                                Width = 105
                                Visible = True
                              end
                              item
                                Expanded = False
                                FieldName = 'PROC'
                                Width = 150
                                Visible = True
                              end
                              item
                                Expanded = False
                                FieldName = 'TXT_COMPL'
                                Width = 150
                                Visible = True
                              end>
                          end
                          object Panel6: TPanel
                            Left = 0
                            Top = 183
                            Width = 739
                            Height = 41
                            Align = alBottom
                            BevelKind = bkTile
                            BevelOuter = bvNone
                            TabOrder = 1
                            object BitBtn16: TBitBtn
                              Left = 249
                              Top = 6
                              Width = 75
                              Height = 25
                              Caption = '&Novo'
                              TabOrder = 0
                              OnClick = BitBtn16Click
                              Glyph.Data = {
                                36050000424D3605000000000000360400002800000010000000100000000100
                                08000000000000010000420B0000420B00000001000000010000CE630000FFD6
                                AD00FFE7C600FFEFDE00FFEFE700FFF7EF0042B5F7008CD6F700B5DEF700FF00
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
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00090909090909
                                090909090909090909090900000000000000000000000000000009000B0B0505
                                0303030402020101010009000B0B0B050505030303020202010009000B0B0B0B
                                0505050303040201010009000B0B0B0B0B0B050503030302010009000B0B0B0B
                                0B0B0B0505030402010009000B0B0B0B0B0B0B0B050A0A0A010009000B0B0B0B
                                0B0B0B0B0B0A060A010009000B0B0B0B0B0B0B0A0A0A060A0A0A09000B0B0B0B
                                0B0B0B0A07080808070A09000B0B0B0B0B0B0B0A0A0A080A0A0A090000000000
                                00000000000A080A000009090000000000000000000A0A0A0009090909090909
                                0909090909090909090909090909090909090909090909090909}
                            end
                            object BitBtn17: TBitBtn
                              Left = 330
                              Top = 6
                              Width = 75
                              Height = 25
                              Caption = '&Alterar'
                              TabOrder = 1
                              OnClick = BitBtn17Click
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
                            end
                            object BitBtn18: TBitBtn
                              Left = 411
                              Top = 6
                              Width = 75
                              Height = 25
                              Caption = '&Excluir'
                              TabOrder = 2
                              OnClick = BitBtn18Click
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
                        end
                        object tsInfDoc: TTabSheet
                          Caption = 'Informa'#231#227'o de Documentos Fiscais'
                          ImageIndex = 1
                          ExplicitLeft = 0
                          ExplicitTop = 0
                          ExplicitWidth = 0
                          ExplicitHeight = 0
                          object Panel7: TPanel
                            Left = 0
                            Top = 183
                            Width = 739
                            Height = 41
                            Align = alBottom
                            BevelKind = bkTile
                            BevelOuter = bvNone
                            TabOrder = 0
                            object BitBtn13: TBitBtn
                              Left = 249
                              Top = 6
                              Width = 75
                              Height = 25
                              Caption = '&Novo'
                              TabOrder = 0
                              OnClick = BitBtn13Click
                              Glyph.Data = {
                                36050000424D3605000000000000360400002800000010000000100000000100
                                08000000000000010000420B0000420B00000001000000010000CE630000FFD6
                                AD00FFE7C600FFEFDE00FFEFE700FFF7EF0042B5F7008CD6F700B5DEF700FF00
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
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00090909090909
                                090909090909090909090900000000000000000000000000000009000B0B0505
                                0303030402020101010009000B0B0B050505030303020202010009000B0B0B0B
                                0505050303040201010009000B0B0B0B0B0B050503030302010009000B0B0B0B
                                0B0B0B0505030402010009000B0B0B0B0B0B0B0B050A0A0A010009000B0B0B0B
                                0B0B0B0B0B0A060A010009000B0B0B0B0B0B0B0A0A0A060A0A0A09000B0B0B0B
                                0B0B0B0A07080808070A09000B0B0B0B0B0B0B0A0A0A080A0A0A090000000000
                                00000000000A080A000009090000000000000000000A0A0A0009090909090909
                                0909090909090909090909090909090909090909090909090909}
                            end
                            object BitBtn14: TBitBtn
                              Left = 330
                              Top = 6
                              Width = 75
                              Height = 25
                              Caption = '&Alterar'
                              TabOrder = 1
                              OnClick = BitBtn14Click
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
                            end
                            object BitBtn15: TBitBtn
                              Left = 411
                              Top = 6
                              Width = 75
                              Height = 25
                              Caption = '&Excluir'
                              TabOrder = 2
                              OnClick = BitBtn15Click
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
                          object DBGrid3: TDBGrid
                            Left = 0
                            Top = 0
                            Width = 739
                            Height = 183
                            Align = alClient
                            DataSource = dtmSPED.dsICMInterAJ_DocV
                            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                            TabOrder = 1
                            TitleFont.Charset = DEFAULT_CHARSET
                            TitleFont.Color = clWindowText
                            TitleFont.Height = -11
                            TitleFont.Name = 'Tahoma'
                            TitleFont.Style = []
                            Columns = <
                              item
                                Expanded = False
                                FieldName = 'NUM_NF'
                                Visible = True
                              end
                              item
                                Expanded = False
                                FieldName = 'VL_AJ_ITEM'
                                Visible = True
                              end
                              item
                                Expanded = False
                                FieldName = 'DATA_LANC'
                                Visible = True
                              end
                              item
                                Expanded = False
                                FieldName = 'NOME_CLIENTE'
                                Visible = True
                              end
                              item
                                Expanded = False
                                FieldName = 'RAZAO'
                                Visible = True
                              end
                              item
                                Expanded = False
                                FieldName = 'MODELO_NF'
                                Visible = True
                              end
                              item
                                Expanded = False
                                FieldName = 'SERIE'
                                Visible = True
                              end
                              item
                                Expanded = False
                                FieldName = 'SUBSERIE'
                                Visible = True
                              end
                              item
                                Expanded = False
                                FieldName = 'CHAVE_NFE'
                                Visible = True
                              end
                              item
                                Expanded = False
                                FieldName = 'TIPO_ITEM'
                                Visible = True
                              end
                              item
                                Expanded = False
                                FieldName = 'NUM_FAB_PROD'
                                Visible = True
                              end
                              item
                                Expanded = False
                                FieldName = 'DESCRICAO_ITEM'
                                Visible = True
                              end
                              item
                                Expanded = False
                                FieldName = 'COD_CLIENTE'
                                Visible = True
                              end>
                          end
                        end
                      end
                    end
                  end
                end
              end
              object tsCadInfAd: TTabSheet
                Caption = 'tsCadInfAd'
                ImageIndex = 2
                ExplicitLeft = 0
                ExplicitTop = 0
                ExplicitWidth = 0
                ExplicitHeight = 0
                object pnCadInfAd: TPanel
                  Left = 17
                  Top = 0
                  Width = 665
                  Height = 385
                  BevelOuter = bvNone
                  BorderWidth = 6
                  TabOrder = 0
                  object Panel8: TPanel
                    Left = 6
                    Top = 6
                    Width = 653
                    Height = 332
                    Align = alClient
                    BevelKind = bkTile
                    BevelOuter = bvNone
                    TabOrder = 0
                    object Label9: TLabel
                      Left = 57
                      Top = 24
                      Width = 112
                      Height = 13
                      Caption = 'Num Doc Arreacadacao'
                      FocusControl = DBEdit2
                    end
                    object Label10: TLabel
                      Left = 102
                      Top = 51
                      Width = 67
                      Height = 13
                      Caption = 'Num Processo'
                      FocusControl = DBEdit4
                    end
                    object Label11: TLabel
                      Left = 70
                      Top = 78
                      Width = 99
                      Height = 13
                      Caption = 'Ind Origem Processo'
                    end
                    object Label12: TLabel
                      Left = 16
                      Top = 105
                      Width = 153
                      Height = 13
                      Caption = 'Descricao resumida do processo'
                      FocusControl = DBMemo2
                    end
                    object Label13: TLabel
                      Left = 53
                      Top = 200
                      Width = 116
                      Height = 13
                      Caption = 'Descricao complementar'
                      FocusControl = DBMemo3
                    end
                    object DBEdit2: TDBEdit
                      Left = 175
                      Top = 21
                      Width = 442
                      Height = 21
                      DataField = 'NUM_DA'
                      DataSource = dtmSPED.dsICMInterAJ_Inf
                      TabOrder = 0
                    end
                    object DBEdit4: TDBEdit
                      Left = 175
                      Top = 48
                      Width = 185
                      Height = 21
                      DataField = 'NUM_PROC'
                      DataSource = dtmSPED.dsICMInterAJ_Inf
                      TabOrder = 1
                    end
                    object DBMemo2: TDBMemo
                      Left = 175
                      Top = 102
                      Width = 442
                      Height = 89
                      DataField = 'PROC'
                      DataSource = dtmSPED.dsICMInterAJ_Inf
                      TabOrder = 3
                    end
                    object DBMemo3: TDBMemo
                      Left = 175
                      Top = 197
                      Width = 442
                      Height = 89
                      DataField = 'TXT_COMPL'
                      DataSource = dtmSPED.dsICMInterAJ_Inf
                      TabOrder = 4
                    end
                    object DBLookupComboBox1: TDBLookupComboBox
                      Left = 175
                      Top = 75
                      Width = 442
                      Height = 21
                      DataField = 'IND_PROC'
                      DataSource = dtmSPED.dsICMInterAJ_Inf
                      TabOrder = 2
                    end
                  end
                  object Panel9: TPanel
                    Left = 6
                    Top = 338
                    Width = 653
                    Height = 41
                    Align = alBottom
                    BevelKind = bkTile
                    BevelOuter = bvNone
                    TabOrder = 1
                    object BitBtn7: TBitBtn
                      Left = 328
                      Top = 6
                      Width = 75
                      Height = 25
                      Caption = '&Cancela'
                      ModalResult = 2
                      TabOrder = 1
                      OnClick = BitBtn7Click
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
                    object BitBtn8: TBitBtn
                      Left = 247
                      Top = 6
                      Width = 75
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
                  end
                end
              end
              object tsCadDoc: TTabSheet
                Caption = 'tsCadDoc'
                ImageIndex = 3
                ExplicitLeft = 0
                ExplicitTop = 0
                ExplicitWidth = 0
                ExplicitHeight = 0
                object pnInfAdDoc: TPanel
                  Left = 17
                  Top = 0
                  Width = 665
                  Height = 385
                  BevelOuter = bvNone
                  BorderWidth = 6
                  TabOrder = 0
                  object Panel11: TPanel
                    Left = 6
                    Top = 6
                    Width = 653
                    Height = 332
                    Align = alClient
                    BevelKind = bkTile
                    BevelOuter = bvNone
                    TabOrder = 0
                    object Label14: TLabel
                      Left = 329
                      Top = 292
                      Width = 58
                      Height = 13
                      Caption = 'Valor Ajuste'
                      FocusControl = DBEdit5
                    end
                    object GroupBox5: TGroupBox
                      Left = 14
                      Top = 16
                      Width = 539
                      Height = 156
                      Caption = 'Nota Fiscal'
                      Enabled = False
                      TabOrder = 0
                      object Label16: TLabel
                        Left = 45
                        Top = 19
                        Width = 37
                        Height = 13
                        Caption = 'Num NF'
                        FocusControl = DBEdit6
                      end
                      object Label17: TLabel
                        Left = 228
                        Top = 19
                        Width = 44
                        Height = 13
                        Caption = 'Data Doc'
                        FocusControl = DBEdit7
                      end
                      object Label18: TLabel
                        Left = 19
                        Top = 48
                        Width = 63
                        Height = 13
                        Caption = 'Nome Cliente'
                        FocusControl = DBEdit8
                      end
                      object Label19: TLabel
                        Left = 48
                        Top = 100
                        Width = 34
                        Height = 13
                        Caption = 'Modelo'
                        FocusControl = DBEdit10
                      end
                      object Label20: TLabel
                        Left = 137
                        Top = 100
                        Width = 24
                        Height = 13
                        Caption = 'Serie'
                        FocusControl = DBEdit11
                      end
                      object Label21: TLabel
                        Left = 242
                        Top = 100
                        Width = 41
                        Height = 13
                        Caption = 'Subserie'
                        FocusControl = DBEdit12
                      end
                      object Label22: TLabel
                        Left = 51
                        Top = 127
                        Width = 31
                        Height = 13
                        Caption = 'Chave'
                        FocusControl = DBEdit13
                      end
                      object DBEdit6: TDBEdit
                        Left = 88
                        Top = 16
                        Width = 134
                        Height = 21
                        DataField = 'NUM_NF'
                        DataSource = dtmSPED.dsICMInterAJ_DocV
                        TabOrder = 0
                      end
                      object DBEdit7: TDBEdit
                        Left = 278
                        Top = 16
                        Width = 111
                        Height = 21
                        DataField = 'DATA_LANC'
                        DataSource = dtmSPED.dsICMInterAJ_DocV
                        TabOrder = 1
                      end
                      object DBEdit8: TDBEdit
                        Left = 88
                        Top = 43
                        Width = 425
                        Height = 21
                        DataField = 'NOME_CLIENTE'
                        DataSource = dtmSPED.dsICMInterAJ_DocV
                        TabOrder = 2
                      end
                      object DBEdit9: TDBEdit
                        Left = 88
                        Top = 70
                        Width = 425
                        Height = 21
                        DataField = 'RAZAO'
                        DataSource = dtmSPED.dsICMInterAJ_DocV
                        TabOrder = 3
                      end
                      object DBEdit10: TDBEdit
                        Left = 88
                        Top = 97
                        Width = 43
                        Height = 21
                        DataField = 'MODELO_NF'
                        DataSource = dtmSPED.dsICMInterAJ_DocV
                        TabOrder = 4
                      end
                      object DBEdit11: TDBEdit
                        Left = 167
                        Top = 97
                        Width = 69
                        Height = 21
                        DataField = 'SERIE'
                        DataSource = dtmSPED.dsICMInterAJ_DocV
                        TabOrder = 5
                      end
                      object DBEdit12: TDBEdit
                        Left = 289
                        Top = 97
                        Width = 69
                        Height = 21
                        DataField = 'SUBSERIE'
                        DataSource = dtmSPED.dsICMInterAJ_DocV
                        TabOrder = 6
                      end
                      object DBEdit13: TDBEdit
                        Left = 88
                        Top = 124
                        Width = 425
                        Height = 21
                        DataField = 'CHAVE_NFE'
                        DataSource = dtmSPED.dsICMInterAJ_DocV
                        TabOrder = 7
                      end
                    end
                    object BitBtn11: TBitBtn
                      Left = 559
                      Top = 84
                      Width = 82
                      Height = 25
                      Caption = 'Selecionar'
                      TabOrder = 1
                      OnClick = BitBtn11Click
                      Glyph.Data = {
                        36030000424D3603000000000000360000002800000010000000100000000100
                        18000000000000030000120B0000120B00000000000000000000FFFFFFFFFFFF
                        FFFFFFFFFFFFFFFFFFB4DCCB4AA77D87C3A6FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA4D9C50D935D0B9F6C0E
                        8951A6D2BDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                        FFFFFFD2EEE41AA27109AC7C06C89D0BA26F2C9766FFFFFFFFFFFFFFFFFFFFFF
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD2F0E619AB7C09AD7C06C89D07B98A07
                        C0940D8C55A5D3BEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD2F1E9
                        18B48609AF7F06C59A09AF7E0C9A6607BF920AA4722C9A69F1F8F5FFFFFFFFFF
                        FFFFFFFFFFFFFFFFFFFFA3E6D617BC9108B78806C69B08B4850AA4712AAA7E0A
                        A67406C4980C935D87C6AAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF06C19506C094
                        06C89D07BA8C09AD7DA4DFCCC3E8DB0B9E6A07BA8C09B0800D8F58E2F1EAFFFF
                        FFFFFFFFFFFFFFFFFFFF06C59A06C49807BF9208B688A3E2D0FFFFFFFFFFFF67
                        C4A50BA06D06C5990B9C684AAB82FFFFFFFFFFFFFFFFFFFFFFFFA2EADA16C99F
                        45D0AED1F2EAFFFFFFFFFFFFFFFFFFF1FAF71AA77709B08007BE910D925C96CE
                        B6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                        FFFFB3E2D30BA06D07BD9009AB7A1C9865E2F1EBFFFFFFFFFFFFFFFFFFFFFFFF
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF57C19E0AA57306C5990B9E
                        6B3BA67AF1F8F5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                        FFFFFFFFFFF1FAF719AA7A09AF7F07BE920C986368BA98FFFFFFFFFFFFFFFFFF
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB3E3D40AA37107B9
                        8B07B88A0C945E77C1A2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                        FFFFFFFFFFFFFFFFFFFFFF76CDB10AA57306C09408B2830C935DFFFFFFFFFFFF
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF47BC
                        970AA4720AA5730C9762FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFF1FAF785D2B948B892B4E0D0}
                    end
                    object GroupBox6: TGroupBox
                      Left = 14
                      Top = 178
                      Width = 539
                      Height = 87
                      Caption = 'Item da Nota Fiscal'
                      Enabled = False
                      TabOrder = 2
                      object Label23: TLabel
                        Left = 50
                        Top = 27
                        Width = 32
                        Height = 13
                        Caption = 'N Item'
                        FocusControl = DBEdit14
                      end
                      object Label24: TLabel
                        Left = 252
                        Top = 27
                        Width = 23
                        Height = 13
                        Caption = 'Tp It'
                        FocusControl = DBEdit15
                      end
                      object Label25: TLabel
                        Left = 349
                        Top = 27
                        Width = 58
                        Height = 13
                        Caption = 'Codigo Item'
                        FocusControl = DBEdit16
                      end
                      object Label26: TLabel
                        Left = 11
                        Top = 54
                        Width = 71
                        Height = 13
                        Caption = 'Descricao Item'
                        FocusControl = DBEdit17
                      end
                      object DBEdit14: TDBEdit
                        Left = 88
                        Top = 24
                        Width = 134
                        Height = 21
                        DataField = 'NITEM_NF'
                        DataSource = dtmSPED.dsICMInterAJ_DocV
                        TabOrder = 0
                      end
                      object DBEdit15: TDBEdit
                        Left = 281
                        Top = 24
                        Width = 17
                        Height = 21
                        DataField = 'TIPO_ITEM'
                        DataSource = dtmSPED.dsICMInterAJ_DocV
                        TabOrder = 1
                      end
                      object DBEdit16: TDBEdit
                        Left = 413
                        Top = 24
                        Width = 100
                        Height = 21
                        DataField = 'NUM_FAB_PROD'
                        DataSource = dtmSPED.dsICMInterAJ_DocV
                        TabOrder = 2
                      end
                      object DBEdit17: TDBEdit
                        Left = 88
                        Top = 51
                        Width = 425
                        Height = 21
                        DataField = 'DESCRICAO_ITEM'
                        DataSource = dtmSPED.dsICMInterAJ_DocV
                        TabOrder = 3
                      end
                    end
                    object BitBtn12: TBitBtn
                      Left = 559
                      Top = 193
                      Width = 82
                      Height = 25
                      Caption = 'Selecionar'
                      TabOrder = 3
                      OnClick = BitBtn12Click
                      Glyph.Data = {
                        36030000424D3603000000000000360000002800000010000000100000000100
                        18000000000000030000120B0000120B00000000000000000000FFFFFFFFFFFF
                        FFFFFFFFFFFFFFFFFFB4DCCB4AA77D87C3A6FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA4D9C50D935D0B9F6C0E
                        8951A6D2BDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                        FFFFFFD2EEE41AA27109AC7C06C89D0BA26F2C9766FFFFFFFFFFFFFFFFFFFFFF
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD2F0E619AB7C09AD7C06C89D07B98A07
                        C0940D8C55A5D3BEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD2F1E9
                        18B48609AF7F06C59A09AF7E0C9A6607BF920AA4722C9A69F1F8F5FFFFFFFFFF
                        FFFFFFFFFFFFFFFFFFFFA3E6D617BC9108B78806C69B08B4850AA4712AAA7E0A
                        A67406C4980C935D87C6AAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF06C19506C094
                        06C89D07BA8C09AD7DA4DFCCC3E8DB0B9E6A07BA8C09B0800D8F58E2F1EAFFFF
                        FFFFFFFFFFFFFFFFFFFF06C59A06C49807BF9208B688A3E2D0FFFFFFFFFFFF67
                        C4A50BA06D06C5990B9C684AAB82FFFFFFFFFFFFFFFFFFFFFFFFA2EADA16C99F
                        45D0AED1F2EAFFFFFFFFFFFFFFFFFFF1FAF71AA77709B08007BE910D925C96CE
                        B6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                        FFFFB3E2D30BA06D07BD9009AB7A1C9865E2F1EBFFFFFFFFFFFFFFFFFFFFFFFF
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF57C19E0AA57306C5990B9E
                        6B3BA67AF1F8F5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                        FFFFFFFFFFF1FAF719AA7A09AF7F07BE920C986368BA98FFFFFFFFFFFFFFFFFF
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB3E3D40AA37107B9
                        8B07B88A0C945E77C1A2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                        FFFFFFFFFFFFFFFFFFFFFF76CDB10AA57306C09408B2830C935DFFFFFFFFFFFF
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF47BC
                        970AA4720AA5730C9762FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFF1FAF785D2B948B892B4E0D0}
                    end
                    object DBEdit5: TDBEdit
                      Left = 393
                      Top = 289
                      Width = 134
                      Height = 21
                      DataField = 'VL_AJ_ITEM'
                      DataSource = dtmSPED.dsICMInterAJ_DocV
                      TabOrder = 4
                    end
                    object BitBtn19: TBitBtn
                      Left = 559
                      Top = 224
                      Width = 82
                      Height = 25
                      Caption = 'Limpar'
                      TabOrder = 5
                      OnClick = BitBtn19Click
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
                    end
                  end
                  object Panel12: TPanel
                    Left = 6
                    Top = 338
                    Width = 653
                    Height = 41
                    Align = alBottom
                    BevelKind = bkTile
                    BevelOuter = bvNone
                    TabOrder = 1
                    object BitBtn9: TBitBtn
                      Left = 328
                      Top = 6
                      Width = 75
                      Height = 25
                      Caption = '&Cancela'
                      ModalResult = 2
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
                    object BitBtn10: TBitBtn
                      Left = 247
                      Top = 6
                      Width = 75
                      Height = 25
                      Caption = '&OK'
                      TabOrder = 0
                      OnClick = BitBtn10Click
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
                  end
                end
              end
              object tsPesqNF: TTabSheet
                Caption = 'tsPesqNF'
                ImageIndex = 4
                ExplicitLeft = 0
                ExplicitTop = 0
                ExplicitWidth = 0
                ExplicitHeight = 0
                object pnPesqNF: TPanel
                  Left = 3
                  Top = 0
                  Width = 769
                  Height = 390
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  BorderWidth = 6
                  TabOrder = 0
                  object Panel10: TPanel
                    Left = 6
                    Top = 6
                    Width = 753
                    Height = 41
                    Align = alTop
                    BevelKind = bkTile
                    BevelOuter = bvNone
                    Caption = 'Notas Fiscais'
                    Color = clWhite
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -13
                    Font.Name = 'Tahoma'
                    Font.Style = []
                    ParentFont = False
                    TabOrder = 0
                  end
                  object DBGrid4: TDBGrid
                    Left = 6
                    Top = 47
                    Width = 753
                    Height = 251
                    Align = alClient
                    TabOrder = 1
                    TitleFont.Charset = DEFAULT_CHARSET
                    TitleFont.Color = clWindowText
                    TitleFont.Height = -11
                    TitleFont.Name = 'Tahoma'
                    TitleFont.Style = []
                  end
                  object Panel13: TPanel
                    Left = 6
                    Top = 298
                    Width = 753
                    Height = 41
                    Align = alBottom
                    BevelKind = bkTile
                    BevelOuter = bvNone
                    TabOrder = 2
                    object Label27: TLabel
                      Left = 29
                      Top = 11
                      Width = 53
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Data Inicial'
                    end
                    object Label28: TLabel
                      Left = 229
                      Top = 11
                      Width = 48
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Data Final'
                    end
                    object Label29: TLabel
                      Left = 469
                      Top = 11
                      Width = 37
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Num NF'
                    end
                    object MaskEdit4: TMaskEdit
                      Left = 88
                      Top = 8
                      Width = 68
                      Height = 21
                      EditMask = '!99/99/0000;1;_'
                      MaxLength = 10
                      TabOrder = 0
                      Text = '  /  /    '
                    end
                    object MaskEdit5: TMaskEdit
                      Left = 283
                      Top = 8
                      Width = 73
                      Height = 21
                      EditMask = '!99/99/0000;1;_'
                      MaxLength = 10
                      TabOrder = 1
                      Text = '  /  /    '
                    end
                    object EditHw1: TEditHw
                      Left = 512
                      Top = 8
                      Width = 121
                      Height = 21
                      TabOrder = 2
                      Text = '                                   0'
                      Formato = fInteger
                      FormatSize = '0.0'
                    end
                    object BitBtn22: TBitBtn
                      Left = 664
                      Top = 6
                      Width = 75
                      Height = 25
                      Caption = '&Pesquisar'
                      TabOrder = 3
                      OnClick = BitBtn22Click
                      Glyph.Data = {
                        36050000424D3605000000000000360400002800000010000000100000000100
                        08000000000000010000D30E0000D30E00000001000000010000181810001818
                        18002929290031313100313931004A39310039393900423939004A423900524A
                        3900424242004A4A42004A4A4A00524A4A0052524A00735A4A00525252005A5A
                        5A007B6B5A00846B5A00636363006B6363006B6B6B0094846B00737373009484
                        73009C8C7300737B7B007B7B7B0094947B00A5947B00848484009C948400A594
                        8400AD94840084848C008C8C8C0094948C00A59C8C00AD9C8C00ADA58C00EFBD
                        8C0094949400A59C9400B5A59400BDB59400C6B59400DEBD9400EFBD9400F7BD
                        9400EFC6940094949C009C9C9C00A5A59C00B5AD9C00EFBD9C00E7C69C00EFC6
                        9C00E7CE9C009CA5A500A5A5A500A5ADA500B5ADA500B5B5A500C6BDA500CEBD
                        A500D6BDA500E7C6A500F7CEA500EFD6A500FFD6A500ADADAD00B5ADAD00B5B5
                        AD00DEC6AD00EFC6AD00DECEAD00EFCEAD00F7CEAD00F7D6AD00FFD6AD00F7DE
                        AD00B5B5B500CEC6B500E7CEB500F7D6B500FFD6B500FFDEB500BDBDBD00EFD6
                        BD00F7D6BD00FFD6BD00F7DEBD00FFDEBD00FFE7BD00BDBDC600BDC6C600C6C6
                        C600F7D6C600F7DEC600FFDEC600FFF7C600C6C6CE00CECECE00D6D6CE00EFDE
                        CE00FFDECE00F7E7CE00FFE7CE00FFEFCE00D6D6D600DEDED600FFDED600FFE7
                        D600FFEFD600DEDEDE00FFF7DE00FFFFDE00E7E7E700EFE7E700FFEFE700FFF7
                        E700FFFFE700EFEFEF00FFF7EF00FFFFEF00F7F7F700FFFFF700FF00FF00F7FF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00808080808080
                        8080808080808080808080808080808080808080808052068080808080808080
                        8080808080470C2A1C80808080808080808080803C0A2A6E2480808080808080
                        808080471134612A80808080808080808080581634522A808080808080343434
                        34801601161F808080808080580C0D0C103C06165880808080808033176B7974
                        7121166F808080808080580779744A4A6C7F15618080808080803C2E714B3030
                        386B1A18808080808080344271634444646C271F808080808080494056647474
                        5A561E2380808080808067265071817F70561D3C80808080808080672D4F7A74
                        4541588080808080808080803C3F453A53358080808080808080}
                    end
                  end
                  object Panel14: TPanel
                    Left = 6
                    Top = 339
                    Width = 753
                    Height = 41
                    Align = alBottom
                    BevelKind = bkTile
                    BevelOuter = bvNone
                    TabOrder = 3
                    object BitBtn20: TBitBtn
                      Left = 337
                      Top = 6
                      Width = 75
                      Height = 25
                      Caption = '&Selecionar'
                      TabOrder = 0
                      OnClick = BitBtn20Click
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
                    object BitBtn21: TBitBtn
                      Left = 664
                      Top = 6
                      Width = 75
                      Height = 25
                      Caption = '&Voltar'
                      ModalResult = 2
                      TabOrder = 1
                      OnClick = BitBtn4Click
                      Glyph.Data = {
                        36050000424D3605000000000000360400002800000010000000100000000100
                        08000000000000010000D30E0000D30E00000001000000010000AD4A0000B54A
                        0000B5520000BD520000BD5A0000C65A0000C6630000CE630000CE6B0000D673
                        0000DE730000DE7B0000E77B0000E7840000F7940000CE6B0800FF9C0800A542
                        1000AD4A1000B5521000C6631000B55A2100CE732100B55A3100BD633100FFAD
                        3100CE7B3900BD6B4200C6734200CE844200CE844A00BD735200BD7B5200C67B
                        5200C6845A00C6846300FFBD6300C68C7300CE947B00CE9C8400FF00FF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00282828282828
                        2828281F05002828282828282828282828282817050713282828282828282828
                        2828282817060715282828282828282828282828281507062328280004040404
                        040404232828000701282802090807070707061B28282706062328040B090711
                        2727272828282800071328060D070A07232828282828281C070128070E13020B
                        082028282828281C0701280F101D28020D0818282828280107132816191E2828
                        140D0C03212513060623281A2421282828150C0D0B0908061228282622282828
                        282827140808041B282828282828282828282828282828282828282828282828
                        2828282828282828282828282828282828282828282828282828}
                    end
                  end
                end
              end
              object tsPesqNFIt: TTabSheet
                Caption = 'tsPesqNFIt'
                ImageIndex = 5
                ExplicitLeft = 0
                ExplicitTop = 0
                ExplicitWidth = 0
                ExplicitHeight = 0
                object pnPesqNFIt: TPanel
                  Left = 3
                  Top = 0
                  Width = 769
                  Height = 390
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  BorderWidth = 6
                  TabOrder = 0
                  object Panel16: TPanel
                    Left = 6
                    Top = 6
                    Width = 753
                    Height = 41
                    Align = alTop
                    BevelKind = bkTile
                    BevelOuter = bvNone
                    Caption = 'Itens da Nota Fiscal'
                    Color = clWhite
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -13
                    Font.Name = 'Tahoma'
                    Font.Style = []
                    ParentFont = False
                    TabOrder = 0
                  end
                  object DBGrid5: TDBGrid
                    Left = 6
                    Top = 47
                    Width = 753
                    Height = 292
                    Align = alClient
                    TabOrder = 1
                    TitleFont.Charset = DEFAULT_CHARSET
                    TitleFont.Color = clWindowText
                    TitleFont.Height = -11
                    TitleFont.Name = 'Tahoma'
                    TitleFont.Style = []
                  end
                  object Panel18: TPanel
                    Left = 6
                    Top = 339
                    Width = 753
                    Height = 41
                    Align = alBottom
                    BevelKind = bkTile
                    BevelOuter = bvNone
                    TabOrder = 2
                    object BitBtn24: TBitBtn
                      Left = 337
                      Top = 6
                      Width = 75
                      Height = 25
                      Caption = '&Selecionar'
                      TabOrder = 0
                      OnClick = BitBtn24Click
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
                    object BitBtn25: TBitBtn
                      Left = 664
                      Top = 6
                      Width = 75
                      Height = 25
                      Caption = '&Voltar'
                      ModalResult = 2
                      TabOrder = 1
                      OnClick = BitBtn4Click
                      Glyph.Data = {
                        36050000424D3605000000000000360400002800000010000000100000000100
                        08000000000000010000D30E0000D30E00000001000000010000AD4A0000B54A
                        0000B5520000BD520000BD5A0000C65A0000C6630000CE630000CE6B0000D673
                        0000DE730000DE7B0000E77B0000E7840000F7940000CE6B0800FF9C0800A542
                        1000AD4A1000B5521000C6631000B55A2100CE732100B55A3100BD633100FFAD
                        3100CE7B3900BD6B4200C6734200CE844200CE844A00BD735200BD7B5200C67B
                        5200C6845A00C6846300FFBD6300C68C7300CE947B00CE9C8400FF00FF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00282828282828
                        2828281F05002828282828282828282828282817050713282828282828282828
                        2828282817060715282828282828282828282828281507062328280004040404
                        040404232828000701282802090807070707061B28282706062328040B090711
                        2727272828282800071328060D070A07232828282828281C070128070E13020B
                        082028282828281C0701280F101D28020D0818282828280107132816191E2828
                        140D0C03212513060623281A2421282828150C0D0B0908061228282622282828
                        282827140808041B282828282828282828282828282828282828282828282828
                        2828282828282828282828282828282828282828282828282828}
                    end
                  end
                end
              end
            end
            inherited Panel3: TPanel
              inherited BitBtn4: TBitBtn
                Hint = 'Salvar - [SPED098]'
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
              Hint = 'Clique para pesquisar - [SPED095]'
            end
            inherited BitBtn3: TBitBtn
              Hint = 'Novo cadastro - [SPED096]'
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
              ExplicitHeight = 376
            end
            inherited DBGrid1: TDBGrid
              OnKeyDown = DBGrid1KeyDown
            end
            inherited Panel2: TPanel
              inherited SpeedButton1: TSpeedButton
                Hint = 'Editar Registro - [SPED097]'
              end
              inherited SpeedButton2: TSpeedButton
                Hint = 'Apagar Registro - [SPED099]'
                OnClick = SpeedButton2Click
              end
              inherited SpeedButton3: TSpeedButton
                Left = 625
                Top = 6
                Enabled = False
                Visible = False
                ExplicitLeft = 625
                ExplicitTop = 6
              end
              inherited SpeedButton4: TSpeedButton
                Left = 682
                Top = 6
                Enabled = False
                Visible = False
                ExplicitLeft = 682
                ExplicitTop = 6
              end
              inherited SpeedButton5: TSpeedButton
                Left = 739
                Top = 6
                Enabled = False
                Visible = False
                ExplicitLeft = 739
                ExplicitTop = 6
              end
              inherited SpeedButton6: TSpeedButton
                Visible = False
              end
              inherited SpeedButton7: TSpeedButton
                Visible = False
              end
              inherited SpeedButton8: TSpeedButton
                Visible = False
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
                Left = 690
                Top = 8
                Enabled = False
                Visible = False
                ExplicitLeft = 690
                ExplicitTop = 8
              end
              inherited SpeedButton26: TSpeedButton
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
    inherited PanelFlash: TPanel
      Left = -1000
      Top = -1000
      ExplicitLeft = -1000
      ExplicitTop = -1000
    end
  end
  inherited pnStatusProcessamento: TPanel
    Left = 792
    ExplicitLeft = 792
    inherited lbTextoProcessamento: TLabel
      Width = 477
      Height = 21
    end
  end
  inherited PopupMenu2: TPopupMenu
    Left = 750
    Top = 43
  end
  inherited Timer1: TTimer
    Left = 750
    Top = 75
  end
  inherited ApplicationEventsPadrao: TApplicationEvents
    Left = 750
    Top = 115
  end
end
