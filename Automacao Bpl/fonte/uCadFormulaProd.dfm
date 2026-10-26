inherited frmCadFormulaProd: TfrmCadFormulaProd
  Caption = 'Formula'#231#227'o ou Receita de Produ'#231#227'o'
  Scaled = False
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
              ActivePage = tscadastro
              inherited TabSheet3: TTabSheet
                ExplicitLeft = 4
                ExplicitTop = 27
                ExplicitWidth = 775
                ExplicitHeight = 431
              end
              object tscadastro: TTabSheet
                Caption = 'tscadastro'
                ImageIndex = 1
                ExplicitLeft = 0
                ExplicitTop = 0
                ExplicitWidth = 0
                ExplicitHeight = 0
                object GroupBox4: TGroupBox
                  Left = 0
                  Top = 0
                  Width = 775
                  Height = 431
                  Align = alClient
                  Caption = 'Dados da F'#243'rmula'#231#227'o para 1 unidade de produ'#231#227'o'
                  TabOrder = 0
                  OnEnter = GroupBox4Enter
                  object Splitter3: TSplitter
                    Left = 2
                    Top = 249
                    Width = 771
                    Height = 3
                    Cursor = crVSplit
                    Align = alTop
                    ExplicitTop = 220
                    ExplicitWidth = 209
                  end
                  object Panel8: TPanel
                    Left = 2
                    Top = 15
                    Width = 771
                    Height = 234
                    Align = alTop
                    BevelOuter = bvNone
                    TabOrder = 0
                    object Label18: TLabel
                      Left = 53
                      Top = 22
                      Width = 38
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Produto'
                    end
                    object Label6: TLabel
                      Left = 48
                      Top = 47
                      Width = 43
                      Height = 13
                      Caption = 'Processo'
                      FocusControl = DBMemo1
                    end
                    object Label7: TLabel
                      Left = 49
                      Top = 208
                      Width = 42
                      Height = 13
                      Caption = 'Solvente'
                      FocusControl = DBEdit1
                    end
                    object SpeedButton10: TSpeedButton
                      Left = 536
                      Top = 44
                      Width = 23
                      Height = 22
                      Hint = 'Pesquisar Processo de Produ'#231#227'o'
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
                      OnClick = SpeedButton10Click
                    end
                    object SpeedButton13: TSpeedButton
                      Left = 536
                      Top = 204
                      Width = 23
                      Height = 22
                      Hint = 'Limpar dados do Solventen'
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
                      OnClick = SpeedButton13Click
                    end
                    object Label8: TLabel
                      Left = 53
                      Top = 186
                      Width = 607
                      Height = 13
                      Caption = 
                        'Aten'#231#227'o! F'#243'rmulas com Tipo Convers'#227'o "Peso" e  que usam solvente' +
                        's devem ser distribuidas em %. N'#227'o ultrapassar os 100 %'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clRed
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                    end
                    object Label9: TLabel
                      Left = 536
                      Top = 20
                      Width = 91
                      Height = 13
                      Caption = 'Unidade de medida'
                      FocusControl = DBEdit3
                    end
                    object Label10: TLabel
                      Left = 16
                      Top = 162
                      Width = 75
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Tipo Convers'#227'o'
                    end
                    object SpeedButton9: TSpeedButton
                      Left = 536
                      Top = 158
                      Width = 23
                      Height = 22
                      Glyph.Data = {
                        36050000424D3605000000000000360400002800000010000000100000000100
                        08000000000000010000130B0000130B00000001000000010000A54A1000AD63
                        3100F7E7DE00FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00030303030303
                        0303030303030303030303030303030303000003030303030303030303030303
                        0004040003030303030303030303030004010104000303030303030303030004
                        0101010104000303030303030300040101040404010400030303030300040101
                        0101040101010400030303000401010101010401010101040003030004010101
                        0101040101010104000303030004010101040401010104000303030303000401
                        0101010101040003030303030303000401020401040003030303030303030300
                        0401010400030303030303030303030300040400030303030303030303030303
                        0300000303030303030303030303030303030303030303030303}
                      OnClick = SpeedButton9Click
                    end
                    object Label11: TLabel
                      Left = 53
                      Top = 140
                      Width = 629
                      Height = 13
                      Caption = 
                        'Aten'#231#227'o! Quando  Tipo Convers'#227'o igual a "Unidade" a composi'#231#227'o t' +
                        'otal corresponde a 1 unidade de medida no Pedido de Produ'#231#227'o'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clRed
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                    end
                    object DBEdit4: TDBEdit
                      Left = 97
                      Top = 17
                      Width = 433
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'PRODUTO'
                      DataSource = dtmProducao.dsFormula
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                      ParentShowHint = False
                      ShowHint = True
                      TabOrder = 0
                    end
                    object DBMemo1: TDBMemo
                      Left = 97
                      Top = 44
                      Width = 433
                      Height = 90
                      DataField = 'PROCESSO'
                      DataSource = dtmProducao.dsFormula
                      TabOrder = 2
                    end
                    object DBCheckBox1: TDBCheckBox
                      Left = 588
                      Top = 164
                      Width = 169
                      Height = 17
                      Caption = 'Usar Solvente na Formula'#231#227'o'
                      DataField = 'USAR_SOLVENTE'
                      DataSource = dtmProducao.dsFormula
                      TabOrder = 3
                      ValueChecked = 'S'
                      ValueUnchecked = 'N'
                      Visible = False
                      OnExit = DBCheckBox1Exit
                      OnMouseUp = DBCheckBox1MouseUp
                    end
                    object DBEdit1: TDBEdit
                      Left = 215
                      Top = 205
                      Width = 315
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'PROD_SOLVENTE_C'
                      DataSource = dtmProducao.dsFormula
                      Enabled = False
                      TabOrder = 5
                    end
                    object DBEdit2: TDBEdit
                      Left = 97
                      Top = 205
                      Width = 112
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'NUM_FAB_PROD_S'
                      DataSource = dtmProducao.dsFormula
                      TabOrder = 4
                      OnExit = DBEdit2Exit
                      OnKeyDown = DBEdit2KeyDown
                    end
                    object DBEdit3: TDBEdit
                      Left = 633
                      Top = 17
                      Width = 43
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'UNIDADE'
                      DataSource = dtmProducao.dsFormula
                      TabOrder = 1
                    end
                    object DBLookupComboBox1: TDBLookupComboBox
                      Left = 97
                      Top = 159
                      Width = 433
                      Height = 21
                      DataField = 'TIPO_CONVERSAO'
                      DataSource = dtmProducao.dsFormula
                      TabOrder = 6
                    end
                  end
                  object Panel9: TPanel
                    Left = 2
                    Top = 252
                    Width = 771
                    Height = 177
                    Align = alClient
                    BevelOuter = bvNone
                    BorderWidth = 6
                    TabOrder = 1
                    object GroupBox6: TGroupBox
                      Left = 6
                      Top = 6
                      Width = 759
                      Height = 165
                      Align = alClient
                      Caption = 'Composi'#231#227'o da Formula'#231#227'o'
                      TabOrder = 0
                      object pnConsultaItensFormula: TPanel
                        Left = 2
                        Top = 15
                        Width = 755
                        Height = 148
                        Align = alClient
                        BevelOuter = bvNone
                        BorderWidth = 6
                        TabOrder = 1
                        object DBGrid3: TDBGrid
                          Left = 6
                          Top = 6
                          Width = 743
                          Height = 95
                          Align = alClient
                          DataSource = dtmProducao.dsFrmlProd
                          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
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
                              FieldName = 'NUM_FAB_PROD'
                              Visible = True
                            end
                            item
                              Expanded = False
                              FieldName = 'DESCR_PROD'
                              Width = 64
                              Visible = True
                            end
                            item
                              Expanded = False
                              FieldName = 'UNIDADE'
                              Width = 64
                              Visible = True
                            end
                            item
                              Expanded = False
                              FieldName = 'QUANTIDADE'
                              Visible = True
                            end>
                        end
                        object Panel5: TPanel
                          Left = 6
                          Top = 101
                          Width = 743
                          Height = 41
                          Align = alBottom
                          BevelKind = bkTile
                          BevelOuter = bvNone
                          TabOrder = 1
                          object BitBtn9: TBitBtn
                            Left = 119
                            Top = 6
                            Width = 205
                            Height = 25
                            Hint = 
                              'Cadastrar nova receita (PROCESSO - Produto acabado: PPR007 | Mat' +
                              ' Prim: PPR010)'
                            Caption = 'Adicionar Item a Composi'#231#227'o'
                            TabOrder = 0
                            OnClick = BitBtn9Click
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
                          object BitBtn10: TBitBtn
                            Left = 330
                            Top = 6
                            Width = 145
                            Height = 25
                            Hint = 
                              'Editar a Receita selecionada (PROCESSO - Produto acabado: PPR008' +
                              ' | Mat Prim: PPR011)'
                            Caption = 'Alterar Quantidade'
                            TabOrder = 1
                            OnClick = BitBtn10Click
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
                          object BitBtn11: TBitBtn
                            Left = 481
                            Top = 6
                            Width = 145
                            Height = 25
                            Hint = 
                              'Excluir a Receita selecionada (PROCESSO: - Produto acabado: PPR0' +
                              '12 | Mat Prim:PPR009)'
                            Caption = 'Remover Item'
                            TabOrder = 2
                            OnClick = BitBtn11Click
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
                      object pnCadastroItensFormula: TPanel
                        Left = 173
                        Top = -29
                        Width = 781
                        Height = 168
                        BevelOuter = bvNone
                        BorderWidth = 6
                        TabOrder = 0
                        Visible = False
                        object Label19: TLabel
                          Left = 544
                          Top = 35
                          Width = 72
                          Height = 13
                          Caption = 'C'#243'digo Interno'
                          FocusControl = DBEdit5
                        end
                        object Label20: TLabel
                          Left = 405
                          Top = 35
                          Width = 29
                          Height = 13
                          Caption = 'Grupo'
                          FocusControl = DBEdit6
                        end
                        object Label21: TLabel
                          Left = 78
                          Top = 35
                          Width = 74
                          Height = 13
                          Caption = 'C'#243'digo Produto'
                          FocusControl = DBEdit7
                        end
                        object Label22: TLabel
                          Left = 66
                          Top = 62
                          Width = 87
                          Height = 13
                          Caption = 'Descri'#231#227'o Produto'
                          FocusControl = DBEdit8
                        end
                        object Label23: TLabel
                          Left = 88
                          Top = 89
                          Width = 65
                          Height = 13
                          Caption = 'Quantidade'
                          FocusControl = DBEdit9
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clBlue
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = [fsBold]
                          ParentFont = False
                        end
                        object Panel60: TPanel
                          Left = 6
                          Top = 121
                          Width = 769
                          Height = 41
                          Align = alBottom
                          BevelKind = bkTile
                          BevelOuter = bvNone
                          TabOrder = 5
                          object BitBtn16: TBitBtn
                            Left = 306
                            Top = 6
                            Width = 75
                            Height = 25
                            Hint = 'Clique neste bot'#227'o para salvar o item - [PPR027]'
                            Caption = 'Salvar'
                            TabOrder = 0
                            OnClick = BitBtn16Click
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
                          object BitBtn17: TBitBtn
                            Left = 387
                            Top = 6
                            Width = 75
                            Height = 25
                            Hint = 'Clique neste bot'#227'o para cancelar os dados digitados'
                            Caption = 'Cancelar'
                            TabOrder = 1
                            OnClick = BitBtn17Click
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
                        object DBEdit5: TDBEdit
                          Left = 622
                          Top = 32
                          Width = 82
                          Height = 21
                          DataField = 'COD_PROD'
                          DataSource = dtmProducao.dsFrmlProd
                          Enabled = False
                          TabOrder = 2
                        end
                        object DBEdit6: TDBEdit
                          Left = 440
                          Top = 32
                          Width = 92
                          Height = 21
                          DataField = 'GRUPO_PROD'
                          DataSource = dtmProducao.dsFrmlProd
                          Enabled = False
                          TabOrder = 1
                        end
                        object DBEdit7: TDBEdit
                          Left = 158
                          Top = 32
                          Width = 227
                          Height = 21
                          Hint = '[F3: Pesquisar]  - C'#243'digo de Barras ou N'#186' de fabrica'#231#227'o'
                          CharCase = ecUpperCase
                          DataField = 'NUM_FAB_PROD'
                          DataSource = dtmProducao.dsFrmlProd
                          TabOrder = 0
                          OnExit = DBEdit7Exit
                          OnKeyDown = DBEdit7KeyDown
                        end
                        object DBEdit8: TDBEdit
                          Left = 159
                          Top = 59
                          Width = 545
                          Height = 21
                          DataField = 'DESCR_PROD'
                          DataSource = dtmProducao.dsFrmlProd
                          Enabled = False
                          TabOrder = 3
                        end
                        object DBEdit9: TDBEdit
                          Left = 159
                          Top = 86
                          Width = 227
                          Height = 21
                          DataField = 'QUANTIDADE'
                          DataSource = dtmProducao.dsFrmlProd
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clBlue
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = []
                          ParentFont = False
                          TabOrder = 4
                        end
                      end
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
            inherited BitBtn1: TBitBtn
              Hint = 'Clique para pesquisar - [PPR017]'
            end
            inherited BitBtn3: TBitBtn
              Hint = 'Novo cadastro - [PPR018]'
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
                Hint = 'Editar Registro - [PPR019]'
              end
              inherited SpeedButton2: TSpeedButton
                Hint = 'Apagar Registro - [PPR020]'
                OnClick = SpeedButton2Click
              end
              inherited SpeedButton3: TSpeedButton
                OnClick = SpeedButton3Click
              end
              inherited SpeedButton5: TSpeedButton
                Hint = 'Recuperar registro - [PPR022]'
                OnClick = SpeedButton5Click
              end
              inherited SpeedButton6: TSpeedButton
                Hint = 'Texto Adiciona Ficha de Produ'#231#227'o - [PPR019]'
                Glyph.Data = {
                  76060000424D7606000000000000360400002800000018000000180000000100
                  08000000000040020000130F0000130F00000001000000010000392918003131
                  310021214A007B5A4A007363520018425A00846B5A000842630021526B005263
                  6B0029637B00847B7B0084847B008C847B009C948C004A6B9C009C9C9C00B5B5
                  B500E7CEB5003139BD008CB5C60010A5D60029ADD600D6D6D60042A5DE00DEDE
                  DE000010E700F7EFE700299CEF002973F70073DEF70042E7F700FF00FF008CEF
                  FF008CF7FF009CFFFF00ADFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00202020202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  2020202020202020202020161616161616161616161616161616161616161616
                  20202016222222221E1E1E1E1E1E1E1E1E16161E1E1E1E162020201622222221
                  211E1E1E1E1E1E1E1E1624161E1E1E1620202016222222222221211E1E1E1E1E
                  1E162424161E1E162020201622222222222121211E1E1E1E1E16242422161E16
                  202020162323222222222121211E1E1E1E162222222216162020201623231910
                  10100B010311211E1E16161616161616202020162323232222222203000A091E
                  1E1E1E1E1E1E1E1620202016232323232322221714221D081E1E1E1E1E1E1E16
                  20202016232323232323222215221D1D0721211E1E1E1E162020201623231910
                  10100B0B0B151F1D1D080B0B0B0B1E162020201623232323232323232222151F
                  1D1D0521211E1E16202020162323232323232323232222151F1D1D0821211E16
                  20202016232323232323232323222222151F1D1D072121162020201616161616
                  161616161616161616151F1D1301161620202020202020202020202020202020
                  202015180D0C01202020202020202020202020202020202020202006251B0402
                  20202020202020202020202020202020202020200E120A1D1320202020202020
                  202020202020202020202020200F1C1D13202020202020202020202020202020
                  2020202020201A1A202020202020202020202020202020202020202020202020
                  2020202020202020202020202020202020202020202020202020}
                OnClick = SpeedButton6Click
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
                Hint = 'Ver registros da lixeira - [PPR031]'
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
        object tsEscolhaReceita: TTabSheet
          Caption = 'tsEscolhaReceita'
          ImageIndex = 3
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object pnEscolhaReceita: TPanel
            Left = 64
            Top = 19
            Width = 649
            Height = 414
            BevelKind = bkTile
            BevelOuter = bvNone
            BorderWidth = 6
            TabOrder = 0
            object GroupBox7: TGroupBox
              Left = 6
              Top = 6
              Width = 633
              Height = 242
              Align = alClient
              Caption = 'Processo de Produ'#231#227'o'
              TabOrder = 0
              object DBGrid5: TDBGrid
                Left = 2
                Top = 15
                Width = 629
                Height = 225
                Align = alClient
                DataSource = dtmProducao.dsRec
                Options = [dgTitles, dgIndicator, dgColumnResize, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Tahoma'
                TitleFont.Style = []
                OnKeyDown = DBGrid5KeyDown
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'COD_RECEITA'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'TITULO'
                    Visible = True
                  end>
              end
            end
            object Panel4: TPanel
              Left = 6
              Top = 363
              Width = 633
              Height = 41
              Align = alBottom
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 1
              object BitBtn7: TBitBtn
                Left = 237
                Top = 6
                Width = 75
                Height = 25
                Hint = 'Assume Registro'
                Caption = '&Assume'
                TabOrder = 0
                OnClick = BitBtn7Click
                Glyph.Data = {
                  36030000424D3603000000000000360000002800000010000000100000000100
                  18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFB78183A47874A47874A47874A47874A47874A4
                  7874A47874A47874A47874A47874A47874986B66FF00FFFF00FFFF00FFB78183
                  FDEFD9F6E3CBF5DFC2F4DBBAF2D7B2F1D4A9F1D0A2EECC99EECC97EECC97F3D1
                  99986B66FF00FFFF00FFFF00FFB48176FEF3E399330099330099330099330099
                  3300993300993300993300EECC97F3D199986B66FF00FFFF00FFFF00FFB48176
                  FFF7EB993300FEFEFEFEFEFEFEFEFE8EA4FDB8C6FDFEFEFE993300EFCD99F3D1
                  98986B66FF00FFFF00FFFF00FFBA8E85FFFCF4993300FEFEFEFAFBFE7E98FC03
                  35FB597AFCFEFEFE993300F0D0A1F3D29B986B66FF00FFFF00FFFF00FFBA8E85
                  FFFFFD993300D6DEFE4368FC0335FB4066FC0436FBD9E0FE993300F0D4A9F5D5
                  A3986B66FF00FFFF00FFFF00FFCB9A82FFFFFF9933005274FC1442FBBCC9FDEF
                  F2FE1A47FB4F72FC973304F2D8B2F6D9AC986B66FF00FFFF00FFFF00FFCB9A82
                  FFFFFF993300E4EAFED9E0FEFEFEFEFEFEFE98ACFD0335FB643459F4DBB9F8DD
                  B4986B66FF00FFFF00FFFF00FFDCA887FFFFFF993300FEFEFEFEFEFEFEFEFEFE
                  FEFEFEFEFE5677FC0335FBF7E1C2F0DAB7986B66FF00FFFF00FFFF00FFDCA887
                  FFFFFF9933009933009933009933009933009933008F33112235C80335FBC6BC
                  A9986B66FF00FFFF00FFFF00FFE3B18EFFFFFFFFFFFFFFFFFFFFFFFFFFFEFDFD
                  F8F3FDF6ECF1E1D5B481760335FB0335FB0335FBFF00FFFF00FFFF00FFE3B18E
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFCFFFEF9E3CFC9B48176E8B270ECA5
                  4A0335FBFF00FFFF00FFFF00FFEDBD92FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFE4D4D2B48176FAC577CD9377FF00FFFF00FFFF00FFFF00FFEDBD92
                  FCF7F4FCF7F3FBF6F3FBF6F3FAF5F3F9F5F3F9F5F3E1D0CEB48176CF9B86FF00
                  FFFF00FFFF00FFFF00FFFF00FFEDBD92DAA482DAA482DAA482DAA482DAA482DA
                  A482DAA482DAA482B48176FF00FFFF00FFFF00FFFF00FFFF00FF}
              end
              object BitBtn8: TBitBtn
                Left = 318
                Top = 6
                Width = 75
                Height = 25
                Hint = 'Cancelar Registro'
                Caption = '&Cancelar'
                TabOrder = 1
                OnClick = BitBtn8Click
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
            object Panel6: TPanel
              Left = 6
              Top = 248
              Width = 633
              Height = 115
              Align = alBottom
              BevelKind = bkTile
              BevelOuter = bvNone
              BorderWidth = 1
              TabOrder = 2
              object DBMemo2: TDBMemo
                Left = 1
                Top = 1
                Width = 627
                Height = 109
                Align = alClient
                BevelInner = bvNone
                BevelOuter = bvNone
                Ctl3D = False
                DataField = 'PROCESSO_PRODUCAO'
                DataSource = dtmProducao.dsRec
                ParentCtl3D = False
                ReadOnly = True
                TabOrder = 0
                OnKeyDown = DBGrid5KeyDown
              end
            end
          end
        end
        object tsEscolhaProdutos: TTabSheet
          Caption = 'tsEscolhaProdutos'
          ImageIndex = 4
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object pnEscolhaProdutos: TPanel
            Left = 48
            Top = 19
            Width = 821
            Height = 318
            BevelKind = bkTile
            BevelOuter = bvNone
            TabOrder = 0
            object GroupBox5: TGroupBox
              Left = 5
              Top = 4
              Width = 806
              Height = 257
              Caption = 'Produtos'
              TabOrder = 0
              object DBGrid2: TDBGrid
                Left = 2
                Top = 15
                Width = 802
                Height = 240
                Align = alClient
                Options = [dgTitles, dgIndicator, dgColumnResize, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Tahoma'
                TitleFont.Style = []
                OnKeyDown = DBGrid2KeyDown
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'NUM_FAB_PROD'
                    Title.Caption = 'C'#243'digo do Produto'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DESCR_PROD'
                    Title.Caption = 'Descri'#231#227'o'
                    Visible = True
                  end
                  item
                    Alignment = taCenter
                    Expanded = False
                    FieldName = 'UNIDADE'
                    Title.Caption = 'Unidade'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'MARCA_P'
                    Title.Caption = 'Marca'
                    Visible = True
                  end
                  item
                    Alignment = taCenter
                    Expanded = False
                    FieldName = 'NBM'
                    Title.Alignment = taCenter
                    Title.Caption = 'NCM'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'COD_PROD'
                    Title.Caption = 'Cod Prod'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'GRUPO_PROD'
                    Title.Caption = 'Grupo'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DESCR_PROD_RED'
                    Title.Caption = 'Descri'#231#227'o Reduzida'
                    Visible = True
                  end>
              end
            end
            object Panel7: TPanel
              Left = 5
              Top = 267
              Width = 806
              Height = 41
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 1
              object BitBtn12: TBitBtn
                Left = 323
                Top = 6
                Width = 75
                Height = 25
                Hint = 'Assume Registro'
                Caption = '&Assume'
                TabOrder = 0
                OnClick = BitBtn12Click
                Glyph.Data = {
                  36030000424D3603000000000000360000002800000010000000100000000100
                  18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFB78183A47874A47874A47874A47874A47874A4
                  7874A47874A47874A47874A47874A47874986B66FF00FFFF00FFFF00FFB78183
                  FDEFD9F6E3CBF5DFC2F4DBBAF2D7B2F1D4A9F1D0A2EECC99EECC97EECC97F3D1
                  99986B66FF00FFFF00FFFF00FFB48176FEF3E399330099330099330099330099
                  3300993300993300993300EECC97F3D199986B66FF00FFFF00FFFF00FFB48176
                  FFF7EB993300FEFEFEFEFEFEFEFEFE8EA4FDB8C6FDFEFEFE993300EFCD99F3D1
                  98986B66FF00FFFF00FFFF00FFBA8E85FFFCF4993300FEFEFEFAFBFE7E98FC03
                  35FB597AFCFEFEFE993300F0D0A1F3D29B986B66FF00FFFF00FFFF00FFBA8E85
                  FFFFFD993300D6DEFE4368FC0335FB4066FC0436FBD9E0FE993300F0D4A9F5D5
                  A3986B66FF00FFFF00FFFF00FFCB9A82FFFFFF9933005274FC1442FBBCC9FDEF
                  F2FE1A47FB4F72FC973304F2D8B2F6D9AC986B66FF00FFFF00FFFF00FFCB9A82
                  FFFFFF993300E4EAFED9E0FEFEFEFEFEFEFE98ACFD0335FB643459F4DBB9F8DD
                  B4986B66FF00FFFF00FFFF00FFDCA887FFFFFF993300FEFEFEFEFEFEFEFEFEFE
                  FEFEFEFEFE5677FC0335FBF7E1C2F0DAB7986B66FF00FFFF00FFFF00FFDCA887
                  FFFFFF9933009933009933009933009933009933008F33112235C80335FBC6BC
                  A9986B66FF00FFFF00FFFF00FFE3B18EFFFFFFFFFFFFFFFFFFFFFFFFFFFEFDFD
                  F8F3FDF6ECF1E1D5B481760335FB0335FB0335FBFF00FFFF00FFFF00FFE3B18E
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFCFFFEF9E3CFC9B48176E8B270ECA5
                  4A0335FBFF00FFFF00FFFF00FFEDBD92FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFE4D4D2B48176FAC577CD9377FF00FFFF00FFFF00FFFF00FFEDBD92
                  FCF7F4FCF7F3FBF6F3FBF6F3FAF5F3F9F5F3F9F5F3E1D0CEB48176CF9B86FF00
                  FFFF00FFFF00FFFF00FFFF00FFEDBD92DAA482DAA482DAA482DAA482DAA482DA
                  A482DAA482DAA482B48176FF00FFFF00FFFF00FFFF00FFFF00FF}
              end
              object BitBtn13: TBitBtn
                Left = 404
                Top = 6
                Width = 75
                Height = 25
                Hint = 'Cancelar Registro'
                Caption = '&Cancelar'
                TabOrder = 1
                OnClick = BitBtn13Click
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
          end
        end
        object tsRelatorios: TTabSheet
          Caption = 'tsRelatorios'
          ImageIndex = 5
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object QuickRep1: TQuickRep
            Left = 3
            Top = 3
            Width = 794
            Height = 1123
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            BeforePrint = QuickRep1BeforePrint
            DataSet = dtmProducao.cdsFormula
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
            Functions.Strings = (
              'PAGENUMBER'
              'COLUMNNUMBER'
              'REPORTTITLE')
            Functions.DATA = (
              '0'
              '0'
              #39#39)
            OnPreview = QuickRep1Preview
            Options = [FirstPageHeader, LastPageFooter]
            Page.Columns = 1
            Page.Orientation = poPortrait
            Page.PaperSize = A4
            Page.Values = (
              100.000000000000000000
              2970.000000000000000000
              100.000000000000000000
              2100.000000000000000000
              100.000000000000000000
              100.000000000000000000
              0.000000000000000000)
            PrinterSettings.Copies = 1
            PrinterSettings.OutputBin = Auto
            PrinterSettings.Duplex = False
            PrinterSettings.FirstPage = 0
            PrinterSettings.LastPage = 0
            PrinterSettings.UseStandardprinter = False
            PrinterSettings.UseCustomBinCode = False
            PrinterSettings.CustomBinCode = 0
            PrinterSettings.ExtendedDuplex = 0
            PrinterSettings.UseCustomPaperCode = False
            PrinterSettings.CustomPaperCode = 0
            PrinterSettings.PrintMetaFile = False
            PrinterSettings.PrintQuality = 0
            PrinterSettings.Collate = 0
            PrinterSettings.ColorOption = 0
            PrintIfEmpty = True
            ReportTitle = 'F'#243'rmulas de Produ'#231#227'o'
            SnapToGrid = True
            Units = MM
            Zoom = 100
            PrevFormStyle = fsNormal
            PreviewInitialState = wsMaximized
            PrevInitialZoom = qrZoomToFit
            PreviewDefaultSaveType = stQRP
            object PageHeaderBand1: TQRBand
              Left = 38
              Top = 38
              Width = 718
              Height = 84
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              AlignToBottom = False
              BeforePrint = PageHeaderBand1BeforePrint
              Color = clWhite
              TransparentBand = False
              ForceNewColumn = False
              ForceNewPage = False
              Size.Values = (
                222.250000000000000000
                1899.708333333333000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              BandType = rbColumnHeader
              object QRSysData4: TQRSysData
                Left = 74
                Top = 42
                Width = 68
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  195.791666666666700000
                  111.125000000000000000
                  179.916666666666700000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                Color = clWhite
                Data = qrsDateTime
                Transparent = False
                ExportAs = exptText
                FontSize = 10
              end
              object QRLabel17: TQRLabel
                Left = 3
                Top = 42
                Width = 65
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  7.937500000000000000
                  111.125000000000000000
                  171.979166666666700000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Data/Hora:'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Arial'
                Font.Style = [fsBold, fsItalic]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
              object QRLabel18: TQRLabel
                Left = 589
                Top = 42
                Width = 47
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1558.395833333333000000
                  111.125000000000000000
                  124.354166666666700000)
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Pagina:'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Arial'
                Font.Style = [fsBold, fsItalic]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
              object QRSysData5: TQRSysData
                Left = 642
                Top = 42
                Width = 46
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1698.625000000000000000
                  111.125000000000000000
                  121.708333333333300000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                Color = clWhite
                Data = qrsPageNumber
                Transparent = False
                ExportAs = exptText
                FontSize = 10
              end
              object QRShape4: TQRShape
                Left = 3
                Top = 63
                Width = 734
                Height = 2
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  5.291666666666667000
                  7.937500000000000000
                  166.687500000000000000
                  1942.041666666667000000)
                Brush.Color = clBlack
                Shape = qrsRectangle
                VertAdjust = 0
              end
              object QRLabel19: TQRLabel
                Left = 16
                Top = 67
                Width = 66
                Height = 15
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  39.687500000000000000
                  42.333333333333340000
                  177.270833333333300000
                  174.625000000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Grupo / Cod'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRLabel21: TQRLabel
                Left = 207
                Top = 67
                Width = 45
                Height = 15
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  39.687500000000000000
                  547.687500000000000000
                  177.270833333333300000
                  119.062500000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Produto'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRLabel26: TQRLabel
                Left = 578
                Top = 67
                Width = 63
                Height = 15
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  39.687500000000000000
                  1529.291666666667000000
                  177.270833333333300000
                  166.687500000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Quantidade'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRLabel27: TQRLabel
                Left = 666
                Top = 67
                Width = 45
                Height = 15
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  39.687500000000000000
                  1762.125000000000000000
                  177.270833333333300000
                  119.062500000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Unidade'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRLabel31: TQRLabel
                Left = 103
                Top = 67
                Width = 87
                Height = 15
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  39.687500000000000000
                  272.520833333333400000
                  177.270833333333300000
                  230.187500000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'C'#243'digo Produto'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRSysData3: TQRSysData
                Left = 3
                Top = 19
                Width = 97
                Height = 20
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  52.916666666666670000
                  7.937500000000000000
                  50.270833333333330000
                  256.645833333333400000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                Color = clWhite
                Data = qrsReportTitle
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -17
                Font.Name = 'Arial'
                Font.Style = [fsBold, fsItalic]
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                FontSize = 13
              end
              object QRLabel16: TQRLabel
                Left = 3
                Top = 2
                Width = 78
                Height = 18
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  47.625000000000000000
                  7.937500000000000000
                  5.291666666666667000
                  206.375000000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'QRLabel16'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -15
                Font.Name = 'Arial'
                Font.Style = [fsBold, fsItalic]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 11
              end
              object QRShape5: TQRShape
                Left = 3
                Top = 81
                Width = 734
                Height = 2
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  5.291666666666667000
                  7.937500000000000000
                  214.312500000000000000
                  1942.041666666667000000)
                Brush.Color = clBlack
                Shape = qrsRectangle
                VertAdjust = 0
              end
            end
            object DetailBand3: TQRBand
              Left = 38
              Top = 122
              Width = 718
              Height = 19
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              AlignToBottom = False
              BeforePrint = DetailBand3BeforePrint
              Color = clWhite
              TransparentBand = False
              ForceNewColumn = False
              ForceNewPage = False
              Size.Values = (
                50.270833333333330000
                1899.708333333333000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              BandType = rbDetail
              object QRDBText14: TQRDBText
                Left = 62
                Top = 2
                Width = 58
                Height = 14
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  37.041666666666670000
                  164.041666666666700000
                  5.291666666666667000
                  153.458333333333300000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Color = clWhite
                DataSet = dtmProducao.cdsFormula
                DataField = 'PRODUTO'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold, fsItalic]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRLabel1: TQRLabel
                Left = 8
                Top = 2
                Width = 48
                Height = 15
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  39.687500000000000000
                  21.166666666666670000
                  5.291666666666667000
                  127.000000000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Produto:'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
            end
            object SummaryBand1: TQRBand
              Left = 38
              Top = 223
              Width = 718
              Height = 22
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              AlignToBottom = False
              Color = clWhite
              TransparentBand = False
              ForceNewColumn = False
              ForceNewPage = False
              Size.Values = (
                58.208333333333340000
                1899.708333333333000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              BandType = rbPageFooter
              object QRShape6: TQRShape
                Left = 3
                Top = 4
                Width = 734
                Height = 2
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  5.291666666666667000
                  7.937500000000000000
                  10.583333333333330000
                  1942.041666666667000000)
                Brush.Color = clBlack
                Shape = qrsRectangle
                VertAdjust = 0
              end
              object QRLabel20: TQRLabel
                Left = 4
                Top = 8
                Width = 102
                Height = 12
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  31.750000000000000000
                  10.583333333333330000
                  21.166666666666670000
                  269.875000000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Hw Sistemas e Computadores'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -8
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 6
              end
            end
            object QRSubDetail1: TQRSubDetail
              Left = 38
              Top = 141
              Width = 718
              Height = 13
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              AlignToBottom = False
              BeforePrint = QRSubDetail1BeforePrint
              Color = clWhite
              TransparentBand = False
              ForceNewColumn = False
              ForceNewPage = False
              Size.Values = (
                34.395833333333340000
                1899.708333333333000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              Master = QuickRep1
              DataSet = dtmProducao.cdsFrmlProd
              FooterBand = QRBand2
              PrintBefore = False
              PrintIfEmpty = True
              object QRDBText1: TQRDBText
                Left = -10
                Top = 2
                Width = 57
                Height = 12
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  31.750000000000000000
                  -26.458333333333330000
                  5.291666666666667000
                  150.812500000000000000)
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Color = clWhite
                DataSet = dtmProducao.cdsFrmlProd
                DataField = 'GRUPO_PROD'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -8
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 6
              end
              object QRDBText8: TQRDBText
                Left = 103
                Top = 2
                Width = 87
                Height = 12
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  31.750000000000000000
                  272.520833333333300000
                  5.291666666666667000
                  230.187500000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Color = clWhite
                DataSet = dtmProducao.cdsFrmlProd
                DataField = 'NUM_FAB_PROD'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -8
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 6
              end
              object QRDBText9: TQRDBText
                Left = 207
                Top = 2
                Width = 348
                Height = 12
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  31.750000000000000000
                  547.687500000000000000
                  5.291666666666667000
                  920.750000000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Color = clWhite
                DataSet = dtmProducao.cdsFrmlProd
                DataField = 'DESCR_PROD'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -8
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 6
              end
              object QRDBText12: TQRDBText
                Left = 588
                Top = 2
                Width = 53
                Height = 12
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  31.750000000000000000
                  1555.750000000000000000
                  5.291666666666667000
                  140.229166666666700000)
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Color = clWhite
                DataSet = dtmProducao.cdsFrmlProd
                DataField = 'QUANTIDADE'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -8
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 6
              end
              object QRDBText13: TQRDBText
                Left = 666
                Top = 2
                Width = 45
                Height = 12
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  31.750000000000000000
                  1762.125000000000000000
                  5.291666666666667000
                  119.062500000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Color = clWhite
                DataSet = dtmProducao.cdsFrmlProd
                DataField = 'UNIDADE'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -8
                Font.Name = 'Arial'
                Font.Style = []
                Mask = '#0.00'
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 6
              end
              object QRDBText18: TQRDBText
                Left = 53
                Top = 2
                Width = 46
                Height = 12
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  31.750000000000000000
                  140.229166666666700000
                  5.291666666666667000
                  121.708333333333300000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Color = clWhite
                DataSet = dtmProducao.cdsFrmlProd
                DataField = 'COD_PROD'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -8
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 6
              end
            end
            object QRBand2: TQRBand
              Left = 38
              Top = 154
              Width = 718
              Height = 43
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = True
              Frame.DrawLeft = False
              Frame.DrawRight = False
              Frame.Width = 2
              AlignToBottom = False
              Color = clWhite
              TransparentBand = False
              ForceNewColumn = False
              ForceNewPage = False
              Size.Values = (
                113.770833333333300000
                1899.708333333333000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              BandType = rbGroupFooter
              object QRExpr1: TQRExpr
                Left = 219
                Top = 6
                Width = 40
                Height = 15
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  39.687500000000000000
                  579.437500000000000000
                  15.875000000000000000
                  105.833333333333300000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsItalic]
                Color = clWhite
                Master = QRSubDetail1
                ParentFont = False
                ResetAfterPrint = True
                Transparent = False
                WordWrap = True
                Expression = 'COUNT'
                ExportAs = exptText
                FontSize = 8
              end
              object QRLabel25: TQRLabel
                Left = 104
                Top = 6
                Width = 111
                Height = 15
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  39.687500000000000000
                  275.166666666666700000
                  15.875000000000000000
                  293.687500000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Quantidade de Itens'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRLabel28: TQRLabel
                Left = 441
                Top = 6
                Width = 130
                Height = 15
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  39.687500000000000000
                  1166.812500000000000000
                  15.875000000000000000
                  343.958333333333400000)
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Soma das Quantidades:'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRLabel4: TQRLabel
                Left = 8
                Top = 22
                Width = 129
                Height = 15
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  39.687500000000000000
                  21.166666666666670000
                  58.208333333333340000
                  341.312500000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Processo de Produ'#231#227'o:'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRLabel2: TQRLabel
                Left = 143
                Top = 22
                Width = 568
                Height = 15
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  39.687500000000000000
                  378.354166666666700000
                  58.208333333333320000
                  1502.833333333333000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = True
                Caption = 'QRLabel2'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = []
                OnPrint = QRLabel2Print
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRLabel3: TQRLabel
                Left = 577
                Top = 6
                Width = 52
                Height = 15
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  39.687500000000000000
                  1526.645833333333000000
                  15.875000000000000000
                  137.583333333333300000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'QRLabel3'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsItalic]
                OnPrint = QRLabel3Print
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
            end
            object QRBand4: TQRBand
              Left = 38
              Top = 197
              Width = 718
              Height = 26
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              AlignToBottom = False
              Color = clWhite
              TransparentBand = False
              ForceNewColumn = False
              ForceNewPage = False
              Size.Values = (
                68.791666666666680000
                1899.708333333333000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              BandType = rbSummary
              object QRLabel29: TQRLabel
                Left = 441
                Top = 7
                Width = 40
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1166.812500000000000000
                  18.520833333333330000
                  105.833333333333300000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = '123,33'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Arial'
                Font.Style = [fsBold, fsItalic]
                OnPrint = QRLabel29Print
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
              object QRLabel32: TQRLabel
                Left = 318
                Top = 7
                Width = 117
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  841.375000000000000000
                  18.520833333333330000
                  309.562500000000000000)
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Total de F'#243'rmulas:'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Arial'
                Font.Style = [fsBold, fsItalic]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
            end
          end
        end
        object tsTextAdicional: TTabSheet
          Caption = 'tsTextAdicional'
          ImageIndex = 6
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object pnTextAdicional: TPanel
            Left = 64
            Top = 19
            Width = 649
            Height = 414
            BevelKind = bkTile
            BevelOuter = bvNone
            BorderWidth = 6
            TabOrder = 0
            object Panel11: TPanel
              Left = 6
              Top = 363
              Width = 633
              Height = 41
              Align = alBottom
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 0
              object BitBtn14: TBitBtn
                Left = 237
                Top = 6
                Width = 75
                Height = 25
                Hint = 'Salvar Registro'
                Caption = '&Salvar'
                TabOrder = 0
                OnClick = BitBtn14Click
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
              object BitBtn15: TBitBtn
                Left = 318
                Top = 6
                Width = 75
                Height = 25
                Hint = 'Cancelar Registro'
                Caption = '&Cancelar'
                TabOrder = 1
                OnClick = BitBtn15Click
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
            object GroupBox8: TGroupBox
              Left = 6
              Top = 185
              Width = 633
              Height = 178
              Align = alClient
              Caption = 'Texto Adicional 2'
              TabOrder = 1
              object DBMemo4: TDBMemo
                Left = 2
                Top = 15
                Width = 629
                Height = 161
                Align = alClient
                BevelInner = bvNone
                BevelOuter = bvNone
                Ctl3D = False
                DataField = 'TEXTO_IMPRESSAO2'
                DataSource = dtmProducao.dsFormula
                ParentCtl3D = False
                TabOrder = 0
                OnKeyDown = DBGrid5KeyDown
              end
            end
            object GroupBox9: TGroupBox
              Left = 6
              Top = 6
              Width = 633
              Height = 179
              Align = alTop
              Caption = 'Texto Adicional 1'
              TabOrder = 2
              object DBMemo3: TDBMemo
                Left = 2
                Top = 15
                Width = 629
                Height = 162
                Align = alClient
                BevelInner = bvNone
                BevelOuter = bvNone
                Ctl3D = False
                DataField = 'TEXTO_IMPRESSAO1'
                DataSource = dtmProducao.dsFormula
                ParentCtl3D = False
                TabOrder = 0
                OnKeyDown = DBGrid5KeyDown
              end
            end
          end
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
    Left = 540
    Top = 1
  end
  inherited PopupMenu2: TPopupMenu
    Left = 502
    Top = 3
  end
  inherited Timer1: TTimer
    Left = 462
    Top = 3
  end
  inherited ApplicationEventsPadrao: TApplicationEvents
    Left = 430
    Top = 3
  end
end
