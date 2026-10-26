inherited frmNotEnvFinanc: TfrmNotEnvFinanc
  Caption = 'Notifica'#231#245'es Enviadas Financeiro'
  ShowHint = True
  ExplicitWidth = 806
  ExplicitHeight = 595
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
            Height = 203
            ExplicitHeight = 203
            inherited imgInformation: TImage
              Height = 186
              ExplicitHeight = 186
            end
            inherited BitBtn1: TBitBtn
              Hint = 'Clique para pesquisar - [CAR103]'
            end
            inherited BitBtn3: TBitBtn
              Enabled = False
              Visible = False
            end
            inherited CheckBox3: TCheckBox
              Top = 45
              ExplicitTop = 45
            end
            inherited CheckBox1: TCheckBox
              Left = 368
              Top = 45
              ExplicitLeft = 368
              ExplicitTop = 45
            end
            object GroupBox4: TGroupBox
              Left = 3
              Top = 71
              Width = 388
              Height = 128
              Caption = 'Op'#231#245'es Avan'#231'adas'
              TabOrder = 11
              Visible = False
              object GroupBox5: TGroupBox
                Left = 2
                Top = 15
                Width = 133
                Height = 111
                Align = alClient
                Caption = 'Tipo de Notifica'#231#227'o'
                TabOrder = 0
                object ckAvisoVenc: TCheckBox
                  Left = 11
                  Top = 28
                  Width = 119
                  Height = 17
                  Caption = 'Aviso de Vencimento'
                  TabOrder = 0
                end
                object ckCreditosAtraso: TCheckBox
                  Left = 11
                  Top = 48
                  Width = 115
                  Height = 17
                  Caption = 'Cr'#233'ditos em atraso'
                  TabOrder = 1
                end
                object ckAgradecimento: TCheckBox
                  Left = 11
                  Top = 68
                  Width = 97
                  Height = 17
                  Caption = 'Agradecimento'
                  TabOrder = 2
                end
              end
              object GroupBox6: TGroupBox
                Left = 135
                Top = 15
                Width = 145
                Height = 111
                Align = alRight
                Caption = 'Status Envio'
                TabOrder = 1
                object ckStatusNO: TCheckBox
                  Left = 7
                  Top = 20
                  Width = 136
                  Height = 17
                  Caption = 'NO - Cadastrada'
                  TabOrder = 0
                end
                object ckStatusEP: TCheckBox
                  Left = 7
                  Top = 36
                  Width = 136
                  Height = 17
                  Caption = 'EP - Em processamento'
                  TabOrder = 1
                end
                object ckStatusAC: TCheckBox
                  Left = 7
                  Top = 52
                  Width = 130
                  Height = 17
                  Caption = 'AC - Aceita envio'
                  TabOrder = 2
                end
                object ckStatusER: TCheckBox
                  Left = 7
                  Top = 68
                  Width = 97
                  Height = 17
                  Caption = 'ER - Erro'
                  TabOrder = 3
                end
                object ckStatusPP: TCheckBox
                  Left = 7
                  Top = 84
                  Width = 97
                  Height = 17
                  Caption = 'PP - Enviada'
                  TabOrder = 4
                end
              end
              object GroupBox7: TGroupBox
                Left = 280
                Top = 15
                Width = 106
                Height = 111
                Align = alRight
                TabOrder = 2
                object Label8: TLabel
                  Left = 3
                  Top = 7
                  Width = 34
                  Height = 13
                  Alignment = taCenter
                  Caption = 'Origem'
                end
                object Label12: TLabel
                  Left = 3
                  Top = 63
                  Width = 36
                  Height = 13
                  Alignment = taCenter
                  Caption = 'Destino'
                end
                object ckOrigemErp: TCheckBox
                  Left = 3
                  Top = 26
                  Width = 42
                  Height = 17
                  Caption = 'erp'
                  TabOrder = 0
                end
                object ckOrigemBot: TCheckBox
                  Left = 48
                  Top = 26
                  Width = 42
                  Height = 17
                  Caption = 'bot'
                  TabOrder = 1
                end
                object ckDestinoErp: TCheckBox
                  Left = 3
                  Top = 82
                  Width = 42
                  Height = 17
                  Caption = 'erp'
                  TabOrder = 2
                end
                object ckDestinoBot: TCheckBox
                  Left = 48
                  Top = 82
                  Width = 42
                  Height = 17
                  Caption = 'bot'
                  TabOrder = 3
                end
              end
            end
            object groupAdicional: TGroupBox
              Left = 395
              Top = 71
              Width = 356
              Height = 128
              Align = alCustom
              Caption = 'Pesquisa Adicional'
              TabOrder = 12
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
              object Label110: TLabel
                Left = 16
                Top = 27
                Width = 37
                Height = 13
                Caption = 'Campo:'
              end
              object ComboBox11: TComboBox
                Left = 59
                Top = 21
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
            Top = 203
            Height = 307
            ExplicitTop = 203
            ExplicitHeight = 307
            inherited Splitter1: TSplitter
              Height = 246
              ExplicitHeight = 246
            end
            inherited DBGrid1: TDBGrid
              Height = 246
              OnDrawColumnCell = DBGrid1DrawColumnCell
            end
            inherited Panel2: TPanel
              inherited SpeedButton1: TSpeedButton
                Left = 121
                Enabled = False
                Visible = False
                ExplicitLeft = 121
              end
              inherited SpeedButton2: TSpeedButton
                Left = 178
                Enabled = False
                Visible = False
                ExplicitLeft = 178
              end
              inherited SpeedButton3: TSpeedButton
                Left = 178
                Enabled = False
                Visible = False
                ExplicitLeft = 178
              end
              inherited SpeedButton4: TSpeedButton
                Left = 235
                Enabled = False
                Visible = False
                ExplicitLeft = 235
              end
              inherited SpeedButton5: TSpeedButton
                Left = 349
                Enabled = False
                Visible = False
                ExplicitLeft = 349
              end
              inherited SpeedButton6: TSpeedButton
                Left = 7
                Hint = 'Visualizar - [CAR103]'
                Glyph.Data = {
                  F6060000424DF606000000000000360000002800000018000000180000000100
                  180000000000C0060000C30E0000C30E00000000000000000000FF00FFFF00FF
                  6060602D2D2D2626262626262626262626262626262626262626262626262626
                  262626262626262626262626262626262626262D2D2D5B5B5BFF00FFFF00FFFF
                  00FFFF00FFFF00FF2C2C2CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2D2D
                  2DFF00FFFF00FFFF00FFFF00FFFF00FF262626FFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFF262626FF00FFFF00FFFF00FFFF00FFFF00FF262626FFFFFFFFFF
                  FFC99167C99167C99167C99167C99167C99167C99167C99167C99167C99167C9
                  9167C99167C99167FFFFFFFFFFFF262626FF00FFFF00FFFF00FFFF00FFFF00FF
                  262626FFFFFFFFFFFFC99167FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFC99167FFFFFFFFFFFFFFFFFFC99167FFFFFFFFFFFF262626FF00FFFF00FFFF
                  00FFFF00FFFF00FF262626FFFFFFFFFFFFC99167FFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFC99167FFFFFFFFFFFFFFFFFFC99167FFFFFFFFFFFF2626
                  26FF00FFFF00FFFF00FFFF00FFFF00FF262626FFFFFFFFFFFFC99167C99167C9
                  9167C99167C99167C99167C99167C99167C99167C99167C99167C99167C99167
                  FFFFFFFFFFFF262626FF00FFFF00FFFF00FFFF00FFFF00FF262626FFFFFFFFFF
                  FFC99167FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC99167FFFFFFFF
                  FFFFFFFFFFC99167FFFFFFFFFFFF262626FF00FFFF00FFFF00FFFF00FFFF00FF
                  262626FFFFFFFFFFFFC99167FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFC99167FFFFFFFFFFFFFFFFFFC99167FFFFFFFFFFFF262626FF00FFFF00FFFF
                  00FFFF00FFFF00FF262626FFFFFFFFFFFFC99167C99167C99167C99167C99167
                  C99167C99167C99167C99167C99167C99167C99167C99167FFFFFFFFFFFF2626
                  26FF00FFFF00FFFF00FFFF00FFFF00FF262626FFFFFFFFFFFFC99167FFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC99167FFFFFFFFFFFFFFFFFFC99167
                  FFFFFFFFFFFF262626FF00FFFF00FFFF00FFFF00FFFF00FF262626FFFFFFFFFF
                  FFC99167FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC99167FFFFFFFF
                  FFFFFFFFFFC99167FFFFFFFFFFFF262626FF00FFFF00FFFF00FFFF00FFFF00FF
                  262626FFFFFFFFFFFFC99167C99167C99167C99167C99167C99167C99167C991
                  67C99167C99167C99167C99167C99167FFFFFFFFFFFF262626FF00FFFF00FFFF
                  00FFFF00FFFF00FF262626FFFFFFFFFFFFC99167C99167C99167C99167C99167
                  C99167C99167C99167C99167C99167C99167C99167C99167FFFFFFFFFFFF2626
                  26FF00FFFF00FFFF00FFFF00FFFF00FF262626FFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFF262626FF00FFFF00FFFF00FFFF00FFFF00FF262626FFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFF2D2D2DFF00FFFF00FFFF00FFFF00FFFF00FF
                  262626FFFFFFFFFFFFA4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4
                  A4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2D2D2DFF00FFFF00FFFF
                  00FFFF00FFFF00FF262626FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2626262626262626262626262626262D2D
                  2DFF00FFFF00FFFF00FFFF00FFFF00FF262626FFFFFFFFFFFF818181FFFFFF67
                  67674E4E4E8B8B8B9191919F9F9FFFFFFFFFFFFFFFFFFF262626FFFFFFFFFFFF
                  FFFFFFC1C1C1434343FF00FFFF00FFFF00FFFF00FFFF00FF262626FFFFFFFFFF
                  FFD2D2D2D0D0D0D0D0D0808080B0B0B07A7A7A969696FFFFFFFFFFFFFFFFFF26
                  2626FFFFFFFFFFFFC2C2C2434343FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  262626FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFF262626FFFFFFC8C8C8434343FF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FF2D2D2DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2D2D2DC5C5C5434343FF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FF6060602D2D2D26262626262626262626
                  26262626262626262626262626262626262626262626262D2D2D4A4A4AFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                OnClick = SpeedButton6Click
                ExplicitLeft = 7
              end
              inherited SpeedButton7: TSpeedButton
                Enabled = False
                Visible = False
              end
              inherited SpeedButton8: TSpeedButton
                Left = 65
                Hint = 'Dados API Mensageria'
                Glyph.Data = {
                  F6060000424DF606000000000000360000002800000018000000180000000100
                  180000000000C0060000C40E0000C40E00000000000000000000FCFCFCADA9A6
                  7C746F756F69756F69756F69756F69756F69756F69756F69756F69756F69756F
                  69756F69756F69756F69756F69756F69756F69756F69756F697C746FAEAAA6FC
                  FCFCADA8A56E6761C1BDBBC6C3C1C6C3C1C6C3C1C6C3C1C6C3C1C6C3C1C6C3C1
                  C6C3C1C6C3C1C6C3C1C6C3C1C6C3C1C6C3C1C6C3C1C6C3C1C6C3C1C6C3C1C6C3
                  C1C1BDBB6D6761AEAAA67A746FC3BFBDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFC2BFBC7A746F746D67C9C7C4FFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC9C7C4746D67746D67C9C7C4
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC9C7C474
                  6D67746D67C9C7C4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFC9C7C4746D67746D67C9C7C4FFFFFFFFFFFFFFFFFFFFFAF4FFD8A3FF
                  FFFFFFFFFFFFEDD4FFE3BFFFF2E0FFE0B7FFFFFFFFFFFFFFFFFFFFFFFFFFD8A4
                  FFF9F2FFFFFFFFFFFFFFFFFFC9C7C4746D67746D67C9C7C4FFFFFFFFFFFFFFFF
                  FFFFFDF9FFC374FFE7C7FFEBD0FFD296FFE0B6FFE8CAFFD195FFFFFFFFFFFFFF
                  FFFFFFFFFFFFC67AFFF4E4FFFFFFFFFFFFFFFFFFC9C7C4746D67746D67C9C7C4
                  FFFFFFFFFFFFFFFFFFFFFFFFFFD092FFC87FFFCE8DFFC272FFEFD9FFE8CAFFC6
                  7AFFD399FFDFB5FFFCF8FFFFFFFFC67AFFF4E4FFFFFFFFFFFFFFFFFFC9C7C474
                  6D67746D67C9C7C4FFFFFFFFFFFFFFFFFFFFFFFFFFDFB5FFD8A5FFF7ECFFC374
                  FFFDF9FFE8CAFFCB86FFE6C5FFD194FFD49BFFFFFFFFC67AFFF4E4FFFFFFFFFF
                  FFFFFFFFC9C7C4746D67746D67C9C7C4FFFFFFFFFFFFFFFFFFFFFFFFFFEED9FF
                  C981FFE7C7FFD092FFFFFFFFE8CAFFD195FFFFFFFFFAF3FFC272FFFBF7FFC67A
                  FFF4E4FFFFFFFFFFFFFFFFFFC9C7C4746D67746D67C9C7C4FFFFFFFFFFFFFFFF
                  FFFFFFFFFFFDF9FFC374FFCF90FFDFB5FFFFFFFFE8CAFFD195FFFFFFFFEED7FF
                  C578FFFEFDFFC67AFFF4E4FFFFFFFFFFFFFFFFFFC9C7C4746D67746D67C9C7C4
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD398FFC271FFF1DFFFFFFFFFE9CBFFC5
                  78FFCD8BFFC476FFE8CAFFFFFFFFC77CFFF4E6FFFFFFFFFFFFFFFFFFC9C7C474
                  6D67746D67C9C7C4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBF6FFF3E2FFFFFF
                  FFFFFFFFFCF8FFEBD1FFECD3FFF9F0FFFFFFFFFFFFFFF4E4FFFFFEFFFFFFFFFF
                  FFFFFFFFC9C7C4746D67746D67C9C7C4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFC9C7C4746D67746D67C9C7C4FFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC9C7C4746D67B1ADAAE8E6E5
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC9C7C474
                  6D67FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFC9C7C4746D679E9894766F69766F69766F69766F69766F69766F6976
                  6F69766F69766F69766F69766F69766F69766F69766F69766F69766F69766F69
                  766F69766F6977706ADBDAD8C9C7C4746D67746D67A29E9AC6C3C1C6C3C1C6C3
                  C1C6C3C1C6C3C1C6C3C1C6C3C1C6C3C1C6C3C1C6C3C1C6C3C1C6C3C1C6C3C1C6
                  C3C1C6C3C1C6C3C1C6C3C1C6C3C1C8C5C3F8F7F7C9C7C4746D67746D67C9C7C4
                  BBB8B4D9D7D5CDCBC9E4E3E2C3C0BEEFEEEDFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC9C7C474
                  6D677A746FC3BFBDBBB8B4D9D7D5CDCBC9E4E3E2C3C0BEEFEEEDFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFC3BFBD7A746FADA8A56E6862C1BEBCC6C3C1C6C3C1C6C3C1C6C3C1C6
                  C3C1C6C3C1C6C3C1C6C3C1C6C3C1C6C3C1C6C3C1C6C3C1C6C3C1C6C3C1C6C3C1
                  C6C3C1C6C3C1C6C3C1C1BEBC6E6761AEAAA6FCFCFCADA8A57C746F756F69756F
                  69756F69756F69756F69756F69756F69756F69756F69756F69756F69756F6975
                  6F69756F69756F69756F69756F69756F697C746FADA8A5FCFCFC}
                OnClick = SpeedButton8Click
                ExplicitLeft = 65
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
                Left = 293
                Top = 5
                Enabled = False
                Visible = False
                ExplicitLeft = 293
                ExplicitTop = 5
              end
              inherited SpeedButton26: TSpeedButton
                Enabled = False
                Visible = False
              end
            end
            inherited GroupBox2: TGroupBox
              Height = 246
              ExplicitHeight = 246
              inherited ScrollBox2: TScrollBox
                Height = 229
                ExplicitHeight = 229
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
        object TabSheet4: TTabSheet
          Caption = 'TabSheet4'
          ImageIndex = 3
          object pnDadosAPI: TPanel
            Left = 3
            Top = 3
            Width = 777
            Height = 504
            TabOrder = 0
            object Panel10: TPanel
              Left = 1
              Top = 462
              Width = 775
              Height = 41
              Align = alBottom
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 0
              object btnDadosAPI: TBitBtn
                Left = 657
                Top = 6
                Width = 75
                Height = 25
                Hint = 'Sair'
                Caption = '&Sair'
                TabOrder = 0
                OnClick = btnDadosAPIClick
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
            object PageControl4: TPageControl
              Left = 1
              Top = 1
              Width = 775
              Height = 461
              ActivePage = TabSheet_Cad_Mensageria
              Align = alClient
              Style = tsFlatButtons
              TabOrder = 1
              OnChange = PageControl4Change
              object TabSheet_Cad_Mensageria: TTabSheet
                Caption = 'POST - Cad mensageria'
                object SplitterMensageriaPost: TSplitter
                  Left = 120
                  Top = 0
                  Height = 430
                  OnMoved = SplitterMensageriaPostMoved
                  ExplicitLeft = 89
                  ExplicitHeight = 1
                end
                object DBGridMensageriaPost: TDBGrid
                  Left = 0
                  Top = 0
                  Width = 120
                  Height = 430
                  Align = alLeft
                  DataSource = dtmContasAReceber.dsDocEletronicoNot
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
                      FieldName = 'SEQID'
                      Visible = True
                    end>
                end
                object DBMemoMensageriaPost: TDBMemo
                  Left = 123
                  Top = 0
                  Width = 644
                  Height = 430
                  Align = alClient
                  DataField = 'DOC'
                  DataSource = dtmContasAReceber.dsDocEletronicoNot
                  ReadOnly = True
                  ScrollBars = ssBoth
                  TabOrder = 1
                end
              end
              object TabSheet_Ler_Mensageria: TTabSheet
                Caption = 'POST - Ler mensageria'
                ImageIndex = 1
                object SplitterMensageriaGet: TSplitter
                  Left = 120
                  Top = 0
                  Height = 430
                  OnMoved = SplitterMensageriaGetMoved
                  ExplicitLeft = 89
                  ExplicitHeight = 1
                end
                object DBGridMensageriaGet: TDBGrid
                  Left = 0
                  Top = 0
                  Width = 120
                  Height = 430
                  Align = alLeft
                  DataSource = dtmContasAReceber.dsDocEletronicoNot
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
                      FieldName = 'SEQID'
                      Visible = True
                    end>
                end
                object DBMemoMensageriaGet: TDBMemo
                  Left = 123
                  Top = 0
                  Width = 644
                  Height = 430
                  Align = alClient
                  DataField = 'DOC'
                  DataSource = dtmContasAReceber.dsDocEletronicoNot
                  ReadOnly = True
                  ScrollBars = ssBoth
                  TabOrder = 1
                end
              end
              object TabSheet_Update_Mensageria: TTabSheet
                Caption = 'POST -  Update mensageria'
                ImageIndex = 2
                object SplitterMensageriaUpdate: TSplitter
                  Left = 120
                  Top = 0
                  Height = 430
                  OnMoved = SplitterMensageriaUpdateMoved
                  ExplicitLeft = 89
                  ExplicitHeight = 1
                end
                object DBGridMensageriaUpdate: TDBGrid
                  Left = 0
                  Top = 0
                  Width = 120
                  Height = 430
                  Align = alLeft
                  DataSource = dtmContasAReceber.dsDocEletronicoNot
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
                      FieldName = 'SEQID'
                      Visible = True
                    end>
                end
                object DBMemoMensageriaUpdate: TDBMemo
                  Left = 123
                  Top = 0
                  Width = 644
                  Height = 430
                  Align = alClient
                  DataField = 'DOC'
                  DataSource = dtmContasAReceber.dsDocEletronicoNot
                  ReadOnly = True
                  ScrollBars = ssBoth
                  TabOrder = 1
                end
              end
            end
          end
        end
      end
    end
    inherited PanelFlash: TPanel
      Left = 592
      Top = 441
      ExplicitLeft = 592
      ExplicitTop = 441
    end
  end
  inherited pnStatusProcessamento: TPanel
    inherited lbTextoProcessamento: TLabel
      Width = 477
      Height = 21
    end
  end
end
