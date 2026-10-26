inherited frmCadPlanoContas: TfrmCadPlanoContas
  Caption = 'Planos de Contas'
  ClientHeight = 590
  Scaled = False
  ExplicitWidth = 806
  ExplicitHeight = 624
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelFundo: TPanel
    Height = 571
    ExplicitHeight = 571
    inherited Splitter2: TSplitter
      Height = 569
      ExplicitHeight = 569
    end
    inherited PanelLeft: TPanel
      Height = 569
      ExplicitHeight = 569
      inherited PageControl1: TPageControl
        Height = 567
        ExplicitHeight = 567
        inherited TabSheet1: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 783
          ExplicitHeight = 536
          inherited ScrollBox1: TScrollBox
            Height = 536
            ExplicitHeight = 536
            inherited PageControl3: TPageControl
              Height = 488
              ExplicitHeight = 488
              inherited TabSheet3: TTabSheet
                Caption = 'Cadastro de Plano de Contas'
                ExplicitLeft = 4
                ExplicitTop = 27
                ExplicitWidth = 775
                ExplicitHeight = 457
                inherited ScrollBox3: TScrollBox
                  Height = 457
                  ExplicitHeight = 457
                  inherited GroupBox1: TGroupBox
                    Width = 754
                    Height = 456
                    Caption = ' Dados do Plano de Contas '
                    ExplicitWidth = 754
                    ExplicitHeight = 456
                    object Label6: TLabel
                      Left = 84
                      Top = 23
                      Width = 48
                      Height = 13
                      Caption = 'N'#186' Conta:'
                    end
                    object Label7: TLabel
                      Left = 47
                      Top = 78
                      Width = 85
                      Height = 13
                      Caption = 'Grupo de Contas:'
                    end
                    object Label8: TLabel
                      Left = 30
                      Top = 50
                      Width = 102
                      Height = 13
                      Caption = 'Descri'#231#227'o de Contas:'
                    end
                    object Label9: TLabel
                      Left = 52
                      Top = 104
                      Width = 80
                      Height = 13
                      Caption = 'C'#243'd. Sub Grupo:'
                    end
                    object Label10: TLabel
                      Left = 10
                      Top = 131
                      Width = 122
                      Height = 13
                      Caption = 'Natureza da Conta (E/S):'
                    end
                    object Label11: TLabel
                      Left = 325
                      Top = 131
                      Width = 73
                      Height = 13
                      Caption = 'Sigla da Conta:'
                    end
                    object Label12: TLabel
                      Left = 21
                      Top = 157
                      Width = 111
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Tipo da Conta a Pagar:'
                    end
                    object Label13: TLabel
                      Left = 45
                      Top = 184
                      Width = 87
                      Height = 13
                      Caption = 'Descri'#231#227'o Padr'#227'o:'
                    end
                    object Label51: TLabel
                      Left = 6
                      Top = 211
                      Width = 126
                      Height = 13
                      Caption = 'Codigo da Conta Contabil:'
                      FocusControl = DBEdit19
                    end
                    object Label52: TLabel
                      Left = 54
                      Top = 236
                      Width = 78
                      Height = 13
                      Caption = 'Ordem Contabil:'
                      FocusControl = DBEdit20
                    end
                    object SpeedButton9: TSpeedButton
                      Left = 714
                      Top = 207
                      Width = 23
                      Height = 22
                      Hint = 'Procurar no cadastro do Plano de Contas Cont'#225'bil'
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
                      OnClick = SpeedButton9Click
                    end
                    object Label61: TLabel
                      Left = 29
                      Top = 261
                      Width = 103
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Conta de Referencia:'
                    end
                    object Label62: TLabel
                      Left = 249
                      Top = 255
                      Width = 489
                      Height = 25
                      AutoSize = False
                      Caption = 
                        '( Hablita no sistema um teste nos cadastros de novos lan'#231'amentos' +
                        '. Quando habilitado se o mes de referencia for igual ou superior' +
                        ' a data do lan'#231'amento o sistema pede um Processo)'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clBlue
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                      WordWrap = True
                    end
                    object Label63: TLabel
                      Left = 31
                      Top = 288
                      Width = 101
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Gerar Contrapartida:'
                    end
                    object lbEstornarVale: TLabel
                      Left = 254
                      Top = 289
                      Width = 144
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Estornar Recibo/Vale Compra:'
                    end
                    object Label65: TLabel
                      Left = 514
                      Top = 289
                      Width = 113
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Rateio entre empresas:'
                    end
                    object DBEdit1: TDBEdit
                      Left = 136
                      Top = 20
                      Width = 105
                      Height = 21
                      DataField = 'N_CONTA_PLC'
                      DataSource = DtmCadBasicosCx.dsPlanoContas
                      TabOrder = 0
                      OnExit = DBEdit1Exit
                    end
                    object DBEdit3: TDBEdit
                      Left = 136
                      Top = 47
                      Width = 601
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'DESC_PLC'
                      DataSource = DtmCadBasicosCx.dsPlanoContas
                      TabOrder = 1
                      OnExit = DBEdit3Exit
                    end
                    object DBLookupComboBox1: TDBLookupComboBox
                      Left = 136
                      Top = 74
                      Width = 601
                      Height = 21
                      DataField = 'GRUP_CT'
                      DataSource = DtmCadBasicosCx.dsPlanoContas
                      KeyField = 'GRUP_CT'
                      ListField = 'DESC_GR;GRUP_CT;DESC_DEP'
                      ListSource = DtmCadBasicosCx.dsGrupoPC
                      TabOrder = 2
                      OnExit = DBLookupComboBox1Exit
                    end
                    object DBLookupComboBox2: TDBLookupComboBox
                      Left = 136
                      Top = 101
                      Width = 601
                      Height = 21
                      DataField = 'COD_SUB_CT'
                      DataSource = DtmCadBasicosCx.dsPlanoContas
                      KeyField = 'COD_SUB_CT'
                      ListField = 'DESC_SUB_CT;COD_SUB_CT'
                      ListSource = DtmCadBasicosCx.dsSubGrupoPC
                      TabOrder = 3
                    end
                    object DBComboBox1: TDBComboBox
                      Left = 136
                      Top = 128
                      Width = 105
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'TIPO_PLC'
                      DataSource = DtmCadBasicosCx.dsPlanoContas
                      ItemHeight = 13
                      Items.Strings = (
                        'E - ENTRADA'
                        'S - SA'#205'DA')
                      TabOrder = 4
                      OnExit = DBComboBox1Exit
                      OnKeyPress = DBComboBox1KeyPress
                    end
                    object DBEdit26: TDBEdit
                      Left = 402
                      Top = 128
                      Width = 105
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'SIGLA_PLC'
                      DataSource = DtmCadBasicosCx.dsPlanoContas
                      TabOrder = 5
                    end
                    object DBComboBox2: TDBComboBox
                      Left = 136
                      Top = 154
                      Width = 601
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'TIPO_CTP'
                      DataSource = DtmCadBasicosCx.dsPlanoContas
                      ItemHeight = 13
                      Items.Strings = (
                        'D - DESPESA'
                        'F - FORNECEDOR'
                        'I - IMPOSTOS'
                        'P - FOLHA DE PAGAMENTO'
                        'O - OUTRAS SAIDAS'
                        'Z - CORRECAO DE SALDO')
                      TabOrder = 6
                      OnExit = DBComboBox2Exit
                      OnKeyPress = DBComboBox2KeyPress
                    end
                    object DBEdit8: TDBEdit
                      Left = 136
                      Top = 181
                      Width = 601
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'DESC_PADR'
                      DataSource = DtmCadBasicosCx.dsPlanoContas
                      TabOrder = 7
                    end
                    object DBEdit19: TDBEdit
                      Left = 136
                      Top = 208
                      Width = 572
                      Height = 21
                      DataField = 'COD_CTA_CONTABIL'
                      DataSource = DtmCadBasicosCx.dsPlanoContas
                      TabOrder = 8
                    end
                    object DBEdit20: TDBEdit
                      Left = 136
                      Top = 233
                      Width = 105
                      Height = 21
                      DataField = 'ORD_CTA_CONTABIL'
                      DataSource = DtmCadBasicosCx.dsPlanoContas
                      TabOrder = 9
                    end
                    object DBComboBox6: TDBComboBox
                      Left = 136
                      Top = 258
                      Width = 105
                      Height = 21
                      Style = csDropDownList
                      CharCase = ecUpperCase
                      DataField = 'CONTA_REFERENCIA'
                      DataSource = DtmCadBasicosCx.dsPlanoContas
                      ItemHeight = 13
                      Items.Strings = (
                        'S'
                        'N')
                      TabOrder = 10
                      OnKeyPress = DBComboBox2KeyPress
                    end
                    object DBComboBox7: TDBComboBox
                      Left = 136
                      Top = 285
                      Width = 105
                      Height = 21
                      Style = csDropDownList
                      CharCase = ecUpperCase
                      DataField = 'GERAR_CONTRAPARTIDA'
                      DataSource = DtmCadBasicosCx.dsPlanoContas
                      ItemHeight = 13
                      Items.Strings = (
                        'S'
                        'N')
                      TabOrder = 11
                      OnExit = DBComboBox7Exit
                      OnKeyPress = DBComboBox2KeyPress
                    end
                    object DBComboBoxEstornarVale: TDBComboBox
                      Left = 402
                      Top = 285
                      Width = 105
                      Height = 21
                      Style = csDropDownList
                      CharCase = ecUpperCase
                      DataField = 'ESTORNAR_VALE'
                      DataSource = DtmCadBasicosCx.dsPlanoContas
                      ItemHeight = 13
                      Items.Strings = (
                        'S'
                        'N')
                      TabOrder = 12
                      OnExit = DBComboBoxEstornarValeExit
                      OnKeyPress = DBComboBox2KeyPress
                    end
                    object DBComboBoxRateioEmpresas: TDBComboBox
                      Left = 632
                      Top = 286
                      Width = 105
                      Height = 21
                      Style = csDropDownList
                      CharCase = ecUpperCase
                      DataField = 'RATEIO_EMPRESA'
                      DataSource = DtmCadBasicosCx.dsPlanoContas
                      ItemHeight = 13
                      Items.Strings = (
                        'S'
                        'N')
                      TabOrder = 13
                      OnExit = DBComboBoxEstornarValeExit
                      OnKeyPress = DBComboBox2KeyPress
                    end
                    object GroupBox21: TGroupBox
                      Left = 2
                      Top = 308
                      Width = 750
                      Height = 146
                      Align = alBottom
                      Caption = 'Clientes / Fornecedores'
                      TabOrder = 14
                      object PageControl9: TPageControl
                        Left = 2
                        Top = 15
                        Width = 746
                        Height = 129
                        ActivePage = TabSheet24
                        Align = alClient
                        TabOrder = 0
                        object TabSheet24: TTabSheet
                          Caption = 'TabSheet24'
                          object Panel22: TPanel
                            Left = 0
                            Top = 0
                            Width = 738
                            Height = 71
                            Align = alClient
                            BevelOuter = bvNone
                            TabOrder = 0
                            object DBGrid10: TDBGrid
                              Left = 0
                              Top = 0
                              Width = 738
                              Height = 71
                              Align = alClient
                              DataSource = DtmCadBasicosCx.dsPlanoContasClientes
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
                                  FieldName = 'N_CONTA_PLC'
                                  Visible = True
                                end
                                item
                                  Expanded = False
                                  FieldName = 'CPFCGC'
                                  Visible = True
                                end
                                item
                                  Expanded = False
                                  FieldName = 'NOME_CLIENTE'
                                  Title.Caption = 'Nome Fantasia'
                                  Visible = True
                                end
                                item
                                  Expanded = False
                                  FieldName = 'RAZAO'
                                  Title.Caption = 'Raz'#227'o Social'
                                  Visible = True
                                end>
                            end
                          end
                          object Panel23: TPanel
                            Left = 0
                            Top = 71
                            Width = 738
                            Height = 30
                            Align = alBottom
                            BevelKind = bkTile
                            BevelOuter = bvNone
                            TabOrder = 1
                            object BitBtn48: TBitBtn
                              Left = 4
                              Top = 3
                              Width = 75
                              Height = 22
                              Hint = 'Incluir Registro - [CXG134]'
                              Caption = '&Incluir'
                              Font.Charset = DEFAULT_CHARSET
                              Font.Color = clWindowText
                              Font.Height = -11
                              Font.Name = 'Tahoma'
                              Font.Style = [fsBold]
                              ParentFont = False
                              TabOrder = 0
                              OnClick = BitBtn48Click
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
                            object BitBtn49: TBitBtn
                              Left = 85
                              Top = 3
                              Width = 75
                              Height = 22
                              Hint = 'Excluir Registro - [CXG136]'
                              Caption = '&Deletar'
                              Font.Charset = DEFAULT_CHARSET
                              Font.Color = clWindowText
                              Font.Height = -11
                              Font.Name = 'Tahoma'
                              Font.Style = [fsBold]
                              ParentFont = False
                              TabOrder = 1
                              OnClick = BitBtn49Click
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
                        object TabSheet25: TTabSheet
                          Caption = 'TabSheet25'
                          ImageIndex = 1
                          object pnCadPcontasClientes: TPanel
                            Left = 0
                            Top = 0
                            Width = 738
                            Height = 101
                            Align = alClient
                            BevelOuter = bvNone
                            TabOrder = 0
                            OnEnter = pnCadPcontasClientesEnter
                            object Panel24: TPanel
                              Left = 0
                              Top = 0
                              Width = 738
                              Height = 41
                              Align = alTop
                              BevelOuter = bvNone
                              TabOrder = 0
                              object Label66: TLabel
                                Left = 9
                                Top = 12
                                Width = 59
                                Height = 13
                                Caption = 'Fornecedor:'
                              end
                              object DBEdit25: TDBEdit
                                Left = 74
                                Top = 9
                                Width = 140
                                Height = 21
                                Hint = 'CPF/CNPJ Fornecedor da Conta'
                                CharCase = ecUpperCase
                                DataField = 'CPFCGC'
                                DataSource = DtmCadBasicosCx.dsPlanoContasClientes
                                TabOrder = 0
                                OnExit = DBEdit25Exit
                                OnKeyDown = DBEdit25KeyDown
                              end
                              object DBLookupComboBox8: TDBLookupComboBox
                                Left = 220
                                Top = 9
                                Width = 501
                                Height = 21
                                DataField = 'CPFCGC'
                                DataSource = DtmCadBasicosCx.dsPlanoContasClientes
                                KeyField = 'CPFCGC'
                                ListField = 'NOME_CLIENTE'
                                ListSource = DtmCadBasicosCx.dsFornecedorConta
                                TabOrder = 1
                                OnExit = DBLookupComboBox1Exit
                              end
                            end
                            object Panel25: TPanel
                              Left = 0
                              Top = 71
                              Width = 738
                              Height = 30
                              Align = alBottom
                              BevelKind = bkTile
                              BevelOuter = bvNone
                              TabOrder = 1
                              object BitBtn50: TBitBtn
                                Left = 298
                                Top = 1
                                Width = 75
                                Height = 25
                                Hint = 'OK - [CXG135]'
                                Caption = '&OK'
                                TabOrder = 0
                                OnClick = BitBtn50Click
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
                              object BitBtn51: TBitBtn
                                Left = 376
                                Top = 1
                                Width = 75
                                Height = 25
                                Hint = 'Cancelar'
                                Caption = '&Cancela'
                                TabOrder = 1
                                OnClick = BitBtn51Click
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
                      end
                    end
                  end
                end
              end
              object TabSheet4: TTabSheet
                Caption = 'Cadastro de Grupos'
                ImageIndex = 1
                object PageControl2: TPageControl
                  Left = 0
                  Top = 0
                  Width = 775
                  Height = 457
                  ActivePage = TabSheet6
                  Align = alClient
                  TabOrder = 0
                  object TabSheet6: TTabSheet
                    Caption = 'Grupos de Contas'
                    object imgInormationGrupo: TImage
                      Left = 743
                      Top = 305
                      Width = 24
                      Height = 124
                      Cursor = crHelp
                      Align = alRight
                      ParentShowHint = False
                      Picture.Data = {
                        055449636F6E0000010001001818000001002000880900001600000028000000
                        1800000030000000010020000000000060090000000000000000000000000000
                        00000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00
                        FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00
                        FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00
                        FFFFFF00FFFFFF00030100000100000000000000000000000000000000000000
                        0000000000000000000000000000000000000000000000000000000000000021
                        0000002700000000000000000000000000000000000000000000000000000000
                        FFFFFF00FFFFFF00030100000100000000000000000000000000000000000000
                        00000000000000000000000000000000000000000000000000000023170B0088
                        27150286060400080E0700000F0800000F0800000F0800000F0800000F080000
                        FFFFFF00FFFFFF00030100000100000000000000000000000000000000000000
                        000000000000000000000000000000000000000604000050492A0CC3BE9263FF
                        B4895BEE5D2F0033492702004122010041220100412201004222010042220100
                        FFFFFF00FFFFFF00030100000100000000000000000000000000000000000000
                        0000000400000022000000450200005F1F0C0097774F26EBE0B98EFFFFECCBFF
                        C29667E0502700210A0600000000000000000000000000000000000000000000
                        FFFFFF00FFFFFF0003010000010000000000000000000000000000000000002A
                        150800844B2B0ACB805931ED9B754DF7BF986DFFEFCEA7FFFFE9CBFFFFE5C2FF
                        996F44E20000003A000000000000000000000000020100000301000003010000
                        FFFFFF00FFFFFF00030100000100000000000000000000040700005A573715CF
                        BC9468FFF5D8B7FFFFE7C8FFFFE8C8FFFFECCEFFFFEED2FFFFECCEFFFFE5C5FF
                        C8A176FF5E3D1BD70E0300730000000F00000000020100000301000003010000
                        FFFFFF00FFFFFF0003010000000000000000000D1A0A007F8A6337EFEFD1AFFF
                        FFF1DAFFFFEAD0FFFFE8CDFFFFE9CFFFF2D2B6FFBF7855FFE0B293FFFFEACEFF
                        FFEDD1FFF7D8B4FFAB8255FA2D17019F0000001B010000000301000003010000
                        FFFFFF00FFFFFF00010000000000000425100086A07446FCFBE2C6FFFFF4DFFF
                        FFEAD3FFFFEAD2FFFFEAD1FFFFEED6FFDDB296FF962300FF9A3109FFDDAF91FF
                        FFEDD2FFFFEBD0FFFFEED0FFCEA67AFF3B2004A5000000110201000003010000
                        FFFFFF00FFFFFF00000000031508004F956636F9ECD3B5FFFFF5E3FFFFEDD9FF
                        FFECD8FFFFECD7FFFFEBD6FFFFEFD9FFE8C7AEFF992B00FFA64C26FFA6502CFF
                        E9C5AAFFFFECD3FFFFEAD1FFFFF2D8FFCBA479FF291302800000000003010000
                        FFFFFF00FFFFFF0017090031623B11BBCEAB84FFF6E5D2FFFFF2E2FFFFEFDEFF
                        FFEFDCFFFFEEDCFFFFEEDBFFFFEFDCFFF7E1CDFF9F370AFFC5805AFFD6AB92FF
                        E6C5ACFFFFEED7FFFFEAD2FFFFEBD4FFFFEED5FFA0784DF00D05003600000000
                        FFFFFF00FFFFFF0046270772936A3FE9D7B998FFFEF1E3FFFFF3E4FFFFF2E3FF
                        FFF1E2FFFFF1E0FFFFF1E0FFFFF1E0FFFDEDDCFFC06F3FFFC97B49FFF9E5D2FF
                        FFF8E5FFFFECD9FFFFEDD7FFFFECD6FFFFF0DBFFF2D7B9FF4E2D0B9C0A00001A
                        FFFFFF00FFFFFF00673C0E98A88157F6D8BD9EFFFFF6EBFFFFF5E9FFFFF4E7FF
                        FFF3E6FFFFF3E5FFFFF2E4FFFFF5E6FFFCF1E5FFD9A079FFD88543FFF4DAC4FF
                        FFF5E6FFFFEFDFFFFFEFDDFFFFEEDCFFFFEEDCFFFFF3DDFF99754EDA321B0454
                        FFFFFF00FFFFFF007946109EB1895EF8D9BD9EFFFCF3E8FFFFF7EEFFFFF6ECFF
                        FFF6ECFFFFF5EAFFFFF8EDFFF6E7D9FFC58C72FFD5A587FFD47B32FFEFD0B5FF
                        FFF6EBFFFFF2E3FFFFF1E2FFFFF1E1FFFFF1E1FFFFF7E6FFC4A98CF1613C148C
                        FFFFFF00FFFFFF007D480E87AE8456EFD6B997FFF4E8DBFFFFFCF6FFFFF8F0FF
                        FFF8EFFFFFF8EFFFFFF9F0FFFAF5ECFFBD7D62FFA84E22FFC15F1EFFDAA889FF
                        FEF5ECFFFFF5E9FFFFF4E7FFFFF4E6FFFFF3E6FFFFFBEFFFDCC5ACFA855422A2
                        FFFFFF00FFFFFF00743E05479A6934D5D5B38EFFEAD8C3FFFFFEFAFFFFFAF5FF
                        FFFAF3FFFFF9F4FFFFF9F2FFFFFCF5FFFAF3ECFFBC7B5EFFA73D08FFC07D5CFF
                        FEF7EEFFFFF7EEFFFFF6ECFFFFF6ECFFFFF5EBFFFFFDF4FFDAC4ACF78554229B
                        FFFFFF00FFFFFF006B34000E82490C89CDA87FFFE2C6A7FFFAF2EAFFFFFEFBFF
                        FFFCF8FFFFFBF7FFFFFBF7FFFFFAF6FFFFFFFAFFFDF9F3FFDAB6A8FFE6CCC1FF
                        FFFAF5FFFFFAF3FFFFF8F0FFFFF8F1FFFFF8F0FFFFFCF5FFC7A98CEA82501B79
                        FFFFFF00FFFFFF007C4203007D410017A26F39E2E3C4A1FFEFDAC0FFFEFCF9FF
                        FFFEFDFFFFFDFAFFFFFDFAFFFFFCF9FFFFFBF8FFFFFFFFFFF1E1DBFFD6AFA0FF
                        FCF6F0FFFFFCF7FFFFFBF5FFFFFAF4FFFFFBF6FFFEF9F3FF9E6F3EC47D430731
                        FFFFFF00FFFFFF0083470500814503008345054AB78A59F6F0D3B1FFF7E5CFFF
                        FEFDFBFFFFFFFFFFFFFEFCFFFFFEFCFFFFFDFCFFFFFFFFFFCA9680FFB44B0AFF
                        E0C0AFFFFFFFFFFFFFFCF9FFFFFDFAFFFFFFFFFFD0B89DFF84480A527E430404
                        FFFFFF00FFFFFF00824605008246050084470700874B0C5DB98C5BF3F4D7B4FF
                        FDE9D0FFFFF9F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9D5CDFFD0936EFF
                        EAD5CAFFFFFFFFFFFFFFFFFFFFFFFFFFDBC9B4FF8D551B8B83480900874D0E00
                        FFFFFF00FFFFFF008246050082460500854909008549090083460543A47139D1
                        E2BE95FFFDE5C7FFFFF3E2FFFFFFFDFFFFFFFFFFFFFFFFFFFFFFFFFFFDFEFFFF
                        FFFFFFFFFFFEFEFFF4EFE9FFBF9F7EF48A51157A85490C04864D0F00864C0E00
                        FFFFFF00FFFFFF00824605008246050085490900864B0B00864A09008042010D
                        894E0F77A9763ECFCFA679EEDFBC96FFE1C4A5FFE1CBB3FFE0CCB7FFDAC6B1F7
                        C7AB8FE5AD855BD08D571C958347082D84490A00894F1400864C0E00864C0E00
                        FFFFFF00FFFFFF00824605008246050085490900864B0B00874B0B0083460600
                        8346060C864A0A3E8E531486996126B7A57139D0A3713BCF99652DBA915A209A
                        8C551971864B0D3E7F42001484480900874D0F00894F1300864C0E00864C0E00
                        FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00
                        FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00
                        FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00
                        FFFFFF00FFFFFF00FFFCFF00FFF87F00FFE07F00FE007F00FC007F00F0001F00
                        E0000F00C0000700800007008000030080000100800001008000010080000100
                        8000010080000100C0000100E0000100F0000700F8000700FC001F00FE003F00
                        FFFFFF00}
                      ShowHint = True
                      ExplicitLeft = 759
                      ExplicitTop = 11
                      ExplicitHeight = 24
                    end
                    object GroupBox5: TGroupBox
                      Left = 0
                      Top = 0
                      Width = 767
                      Height = 305
                      Align = alTop
                      Caption = ' Grupos de Contas '
                      TabOrder = 0
                      object DBGrid2: TDBGrid
                        Left = 2
                        Top = 15
                        Width = 763
                        Height = 255
                        Align = alClient
                        DataSource = DtmCadBasicosCx.dsGrupoPC
                        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
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
                            FieldName = 'GRUP_CT'
                            Visible = True
                          end
                          item
                            Expanded = False
                            FieldName = 'DESC_GR'
                            Visible = True
                          end
                          item
                            Expanded = False
                            FieldName = 'TIPO_GR'
                            Visible = True
                          end
                          item
                            Expanded = False
                            FieldName = 'TIPO_GR2'
                            Visible = True
                          end
                          item
                            Expanded = False
                            FieldName = 'COD_DEP'
                            Visible = True
                          end
                          item
                            Expanded = False
                            FieldName = 'COD_DRE'
                            Visible = True
                          end
                          item
                            Expanded = False
                            FieldName = 'DESC_DEP'
                            Title.Caption = 'Departamento Financeiro'
                            Visible = True
                          end>
                      end
                      object Panel9: TPanel
                        Left = 2
                        Top = 270
                        Width = 763
                        Height = 33
                        Align = alBottom
                        BevelKind = bkTile
                        BevelOuter = bvNone
                        TabOrder = 1
                        object BitBtn9: TBitBtn
                          Left = 221
                          Top = 2
                          Width = 75
                          Height = 25
                          Hint = 'Incluir Registro - [CXG027]'
                          Caption = 'Incluir'
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
                          Left = 302
                          Top = 2
                          Width = 75
                          Height = 25
                          Hint = 'Editar Registro - [CXG028]'
                          Caption = 'Editar'
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
                          Left = 383
                          Top = 2
                          Width = 75
                          Height = 25
                          Hint = 'Excluir Registro - [CXG029]'
                          Caption = 'Excluir'
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
                        object BitBtn13: TBitBtn
                          Left = 464
                          Top = 2
                          Width = 75
                          Height = 25
                          Hint = 'Sair - [CXG030]'
                          Caption = 'Sair'
                          TabOrder = 3
                          OnClick = BitBtn13Click
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
                    end
                  end
                  object TabSheet7: TTabSheet
                    Caption = 'Cadastro de Grupos de Contas'
                    ImageIndex = 1
                    object GroupBox4: TGroupBox
                      Left = 0
                      Top = 0
                      Width = 767
                      Height = 209
                      Align = alTop
                      Caption = ' Dados do Grupo '
                      TabOrder = 0
                      object Label14: TLabel
                        Left = 61
                        Top = 40
                        Width = 91
                        Height = 13
                        Caption = 'N'#250'mero do Grupo :'
                        FocusControl = DBEdit2
                      end
                      object Label15: TLabel
                        Left = 52
                        Top = 67
                        Width = 100
                        Height = 13
                        Caption = 'Descri'#231#227'o do Grupo :'
                        FocusControl = DBEdit4
                      end
                      object Label16: TLabel
                        Left = 54
                        Top = 94
                        Width = 98
                        Height = 13
                        Caption = 'Natureza do Grupo :'
                      end
                      object Label17: TLabel
                        Left = 40
                        Top = 149
                        Width = 112
                        Height = 13
                        Caption = 'C'#243'digo Departamento :'
                      end
                      object Label18: TLabel
                        Left = 89
                        Top = 175
                        Width = 63
                        Height = 13
                        Caption = 'C'#243'digo DRE :'
                      end
                      object Label60: TLabel
                        Left = 45
                        Top = 121
                        Width = 107
                        Height = 13
                        Caption = 'Natureza do Grupo 2 :'
                      end
                      object DBEdit2: TDBEdit
                        Left = 158
                        Top = 37
                        Width = 134
                        Height = 21
                        CharCase = ecUpperCase
                        DataField = 'GRUP_CT'
                        DataSource = DtmCadBasicosCx.dsGrupoPC
                        TabOrder = 0
                        OnExit = DBEdit2Exit
                      end
                      object DBEdit4: TDBEdit
                        Left = 158
                        Top = 64
                        Width = 459
                        Height = 21
                        CharCase = ecUpperCase
                        DataField = 'DESC_GR'
                        DataSource = DtmCadBasicosCx.dsGrupoPC
                        TabOrder = 1
                      end
                      object DBComboBox3: TDBComboBox
                        Left = 158
                        Top = 91
                        Width = 134
                        Height = 21
                        CharCase = ecUpperCase
                        DataField = 'TIPO_GR'
                        DataSource = DtmCadBasicosCx.dsGrupoPC
                        ItemHeight = 13
                        Items.Strings = (
                          'D - DIVERSOS'
                          'E - ENTRADA'
                          'S - SA'#205'DA')
                        TabOrder = 2
                        OnKeyPress = DBComboBox3KeyPress
                      end
                      object DBLookupComboBox3: TDBLookupComboBox
                        Left = 158
                        Top = 145
                        Width = 459
                        Height = 21
                        DataField = 'COD_DEP'
                        DataSource = DtmCadBasicosCx.dsGrupoPC
                        KeyField = 'COD_DEP'
                        ListField = 'DESC_DEP;COD_DEP'
                        ListSource = DtmCadBasicosCx.dsDptoGrupo
                        TabOrder = 3
                      end
                      object DBLookupComboBox4: TDBLookupComboBox
                        Left = 158
                        Top = 172
                        Width = 459
                        Height = 21
                        DataField = 'COD_DRE'
                        DataSource = DtmCadBasicosCx.dsGrupoPC
                        KeyField = 'COD_DRE'
                        ListField = 'NOME_DRE;COD_DRE'
                        ListSource = DtmCadBasicosCx.dsDadosDre
                        TabOrder = 4
                      end
                      object DBComboBox5: TDBComboBox
                        Left = 158
                        Top = 118
                        Width = 134
                        Height = 21
                        CharCase = ecUpperCase
                        DataField = 'TIPO_GR2'
                        DataSource = DtmCadBasicosCx.dsGrupoPC
                        ItemHeight = 13
                        Items.Strings = (
                          'D - DIVERSOS'
                          'E - ENTRADA'
                          'S - SA'#205'DA')
                        TabOrder = 5
                        OnKeyPress = DBComboBox3KeyPress
                      end
                    end
                    object Panel16: TPanel
                      Left = 0
                      Top = 209
                      Width = 767
                      Height = 32
                      Align = alTop
                      BevelKind = bkTile
                      BevelOuter = bvNone
                      TabOrder = 1
                      object BitBtn7: TBitBtn
                        Left = 304
                        Top = 2
                        Width = 75
                        Height = 25
                        Caption = 'Ok'
                        TabOrder = 0
                        OnClick = BitBtn7Click
                        Glyph.Data = {
                          DE010000424DDE01000000000000760000002800000024000000120000000100
                          0400000000006801000000000000000000001000000000000000000000000000
                          80000080000000808000800000008000800080800000C0C0C000808080000000
                          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                          3333333333333333333333330000333333333333333333333333F33333333333
                          00003333344333333333333333388F3333333333000033334224333333333333
                          338338F3333333330000333422224333333333333833338F3333333300003342
                          222224333333333383333338F3333333000034222A22224333333338F338F333
                          8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
                          33333338F83338F338F33333000033A33333A222433333338333338F338F3333
                          0000333333333A222433333333333338F338F33300003333333333A222433333
                          333333338F338F33000033333333333A222433333333333338F338F300003333
                          33333333A222433333333333338F338F00003333333333333A22433333333333
                          3338F38F000033333333333333A223333333333333338F830000333333333333
                          333A333333333333333338330000333333333333333333333333333333333333
                          0000}
                        NumGlyphs = 2
                      end
                      object BitBtn8: TBitBtn
                        Left = 385
                        Top = 2
                        Width = 75
                        Height = 25
                        Caption = 'Cancelar'
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
                  end
                end
              end
              object TabSheet5: TTabSheet
                Caption = 'Cadastro de Sub Grupos'
                ImageIndex = 2
                object PageControl4: TPageControl
                  Left = 0
                  Top = 0
                  Width = 775
                  Height = 457
                  ActivePage = TabSheet9
                  Align = alClient
                  TabOrder = 0
                  object TabSheet9: TTabSheet
                    Caption = 'Sub Grupos'
                    object GroupBox6: TGroupBox
                      Left = 0
                      Top = 0
                      Width = 767
                      Height = 313
                      Align = alTop
                      Caption = ' Sub Grupos '
                      TabOrder = 0
                      object DBGrid3: TDBGrid
                        Left = 2
                        Top = 15
                        Width = 763
                        Height = 264
                        Align = alClient
                        DataSource = DtmCadBasicosCx.dsSubGrupoPC
                        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
                        TabOrder = 0
                        TitleFont.Charset = DEFAULT_CHARSET
                        TitleFont.Color = clWindowText
                        TitleFont.Height = -11
                        TitleFont.Name = 'Tahoma'
                        TitleFont.Style = []
                        OnKeyDown = DBGrid3KeyDown
                        Columns = <
                          item
                            Expanded = False
                            FieldName = 'COD_SUB_CT'
                            Visible = True
                          end
                          item
                            Expanded = False
                            FieldName = 'DESC_SUB_CT'
                            Visible = True
                          end
                          item
                            Expanded = False
                            FieldName = 'ORDEM_SUB_CT'
                            Visible = True
                          end
                          item
                            Expanded = False
                            FieldName = 'DATA_CAD_PC'
                            Visible = True
                          end
                          item
                            Expanded = False
                            FieldName = 'DATA_MOD_PC'
                            Visible = True
                          end>
                      end
                      object Panel10: TPanel
                        Left = 2
                        Top = 279
                        Width = 763
                        Height = 32
                        Align = alBottom
                        BevelKind = bkTile
                        BevelOuter = bvNone
                        TabOrder = 1
                        object BitBtn14: TBitBtn
                          Left = 221
                          Top = 2
                          Width = 75
                          Height = 25
                          Hint = 'Incluir Registro - [CXG033]'
                          Caption = 'Inserir'
                          TabOrder = 0
                          OnClick = BitBtn14Click
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
                        object BitBtn15: TBitBtn
                          Left = 302
                          Top = 2
                          Width = 75
                          Height = 25
                          Hint = 'Alterar Registro - [CXG034]'
                          Caption = 'Editar'
                          TabOrder = 1
                          OnClick = BitBtn15Click
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
                        object BitBtn16: TBitBtn
                          Left = 383
                          Top = 2
                          Width = 75
                          Height = 25
                          Hint = 'Excluir Registro - [CXG035]'
                          Caption = 'Excluir'
                          TabOrder = 2
                          OnClick = BitBtn16Click
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
                        object BitBtn17: TBitBtn
                          Left = 464
                          Top = 2
                          Width = 75
                          Height = 25
                          Hint = 'Sair - [CXG036]'
                          Caption = 'Sair'
                          TabOrder = 3
                          OnClick = BitBtn17Click
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
                    end
                  end
                  object TabSheet10: TTabSheet
                    Caption = 'Cadastro de Sub Grupos'
                    ImageIndex = 1
                    object GroupBox7: TGroupBox
                      Left = 0
                      Top = 0
                      Width = 767
                      Height = 133
                      Align = alTop
                      Caption = ' Dados do Sub Grupo '
                      TabOrder = 0
                      object Label19: TLabel
                        Left = 34
                        Top = 40
                        Width = 112
                        Height = 13
                        Caption = 'N'#250'mero do Sub Grupo :'
                        FocusControl = DBEdit5
                      end
                      object Label20: TLabel
                        Left = 40
                        Top = 67
                        Width = 106
                        Height = 13
                        Caption = 'Descri'#231#227'o Sub Grupo :'
                        FocusControl = DBEdit6
                      end
                      object Label21: TLabel
                        Left = 29
                        Top = 94
                        Width = 117
                        Height = 13
                        Caption = 'Ordem Seq. Sub Grupo :'
                        FocusControl = DBEdit7
                      end
                      object DBEdit5: TDBEdit
                        Left = 152
                        Top = 37
                        Width = 134
                        Height = 21
                        CharCase = ecUpperCase
                        DataField = 'COD_SUB_CT'
                        DataSource = DtmCadBasicosCx.dsSubGrupoPC
                        TabOrder = 0
                        OnExit = DBEdit5Exit
                      end
                      object DBEdit6: TDBEdit
                        Left = 152
                        Top = 64
                        Width = 459
                        Height = 21
                        CharCase = ecUpperCase
                        DataField = 'DESC_SUB_CT'
                        DataSource = DtmCadBasicosCx.dsSubGrupoPC
                        TabOrder = 1
                      end
                      object DBEdit7: TDBEdit
                        Left = 152
                        Top = 91
                        Width = 134
                        Height = 21
                        CharCase = ecUpperCase
                        DataField = 'ORDEM_SUB_CT'
                        DataSource = DtmCadBasicosCx.dsSubGrupoPC
                        TabOrder = 2
                      end
                    end
                    object Panel17: TPanel
                      Left = 0
                      Top = 133
                      Width = 767
                      Height = 36
                      Align = alTop
                      BevelKind = bkTile
                      BevelOuter = bvNone
                      TabOrder = 1
                      object BitBtn18: TBitBtn
                        Left = 304
                        Top = 4
                        Width = 75
                        Height = 25
                        Caption = 'Salvar'
                        TabOrder = 0
                        OnClick = BitBtn18Click
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
                      object BitBtn19: TBitBtn
                        Left = 385
                        Top = 4
                        Width = 75
                        Height = 25
                        Caption = 'Cancelar'
                        TabOrder = 1
                        OnClick = BitBtn19Click
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
              end
              object TabSheet8: TTabSheet
                Caption = 'Dept'#186' de Grupos de Contas'
                ImageIndex = 3
                object PageControl5: TPageControl
                  Left = 0
                  Top = 0
                  Width = 775
                  Height = 457
                  ActivePage = TabSheet11
                  Align = alClient
                  TabOrder = 0
                  object TabSheet11: TTabSheet
                    Caption = 'Departamentos de Grupos '
                    object GroupBox9: TGroupBox
                      Left = 0
                      Top = 0
                      Width = 767
                      Height = 313
                      Align = alTop
                      Caption = ' Departamentos '
                      TabOrder = 0
                      object DBGrid4: TDBGrid
                        Left = 2
                        Top = 15
                        Width = 763
                        Height = 255
                        Align = alClient
                        DataSource = DtmCadBasicosCx.dsDptoGrupo
                        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
                        TabOrder = 0
                        TitleFont.Charset = DEFAULT_CHARSET
                        TitleFont.Color = clWindowText
                        TitleFont.Height = -11
                        TitleFont.Name = 'Tahoma'
                        TitleFont.Style = []
                        OnKeyDown = DBGrid4KeyDown
                        Columns = <
                          item
                            Expanded = False
                            FieldName = 'COD_DEP'
                            Visible = True
                          end
                          item
                            Expanded = False
                            FieldName = 'DESC_DEP'
                            Visible = True
                          end
                          item
                            Expanded = False
                            FieldName = 'PERC_DEP'
                            Visible = True
                          end
                          item
                            Expanded = False
                            FieldName = 'TP_DEP'
                            Visible = True
                          end
                          item
                            Expanded = False
                            FieldName = 'TIPDEVDEP'
                            Visible = True
                          end
                          item
                            Expanded = False
                            FieldName = 'TIPOFAT'
                            Visible = True
                          end>
                      end
                      object Panel11: TPanel
                        Left = 2
                        Top = 270
                        Width = 763
                        Height = 41
                        Align = alBottom
                        BevelKind = bkTile
                        BevelOuter = bvNone
                        TabOrder = 1
                        object BitBtn20: TBitBtn
                          Left = 182
                          Top = 8
                          Width = 75
                          Height = 25
                          Hint = 'Incluir Registro - [CXG039]'
                          Caption = 'Inserir'
                          TabOrder = 0
                          OnClick = BitBtn20Click
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
                        object BitBtn21: TBitBtn
                          Left = 263
                          Top = 8
                          Width = 75
                          Height = 25
                          Hint = 'Editar Registro - [CXG040]'
                          Caption = 'Editar'
                          TabOrder = 1
                          OnClick = BitBtn21Click
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
                        object BitBtn24: TBitBtn
                          Left = 344
                          Top = 8
                          Width = 75
                          Height = 25
                          Hint = 'Excluir Registro - [CXG041]'
                          Caption = 'Excluir'
                          TabOrder = 2
                          OnClick = BitBtn24Click
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
                        object BitBtn25: TBitBtn
                          Left = 425
                          Top = 8
                          Width = 75
                          Height = 25
                          Hint = 'Regras - [CXG042]'
                          Caption = 'Regras'
                          TabOrder = 3
                          OnClick = BitBtn25Click
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
                        end
                        object BitBtn26: TBitBtn
                          Left = 506
                          Top = 8
                          Width = 75
                          Height = 25
                          Hint = 'Sair - [CXG043]'
                          Caption = 'Sair'
                          TabOrder = 4
                          OnClick = BitBtn26Click
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
                    end
                  end
                  object TabSheet12: TTabSheet
                    Caption = 'Cadastro de Departamentos'
                    ImageIndex = 1
                    object GroupBox8: TGroupBox
                      Left = 0
                      Top = 0
                      Width = 767
                      Height = 385
                      Align = alTop
                      Caption = ' Dados Departamento de Grupo '
                      TabOrder = 0
                      object Label22: TLabel
                        Left = 50
                        Top = 40
                        Width = 131
                        Height = 13
                        Caption = 'N'#250'mero do Departamento :'
                      end
                      object Label23: TLabel
                        Left = 41
                        Top = 67
                        Width = 140
                        Height = 13
                        Caption = 'Descri'#231#227'o do Departamento :'
                      end
                      object Label24: TLabel
                        Left = 36
                        Top = 94
                        Width = 145
                        Height = 13
                        Caption = 'Percentual do Departamento :'
                      end
                      object Label25: TLabel
                        Left = 18
                        Top = 121
                        Width = 163
                        Height = 13
                        Caption = 'Natureza do Departamento (T/I) :'
                      end
                      object Label26: TLabel
                        Left = 90
                        Top = 148
                        Width = 91
                        Height = 13
                        Caption = 'Depto'#39's de Venda :'
                      end
                      object Label27: TLabel
                        Left = 86
                        Top = 196
                        Width = 95
                        Height = 13
                        Caption = 'Devolu'#231#245'es Venda :'
                      end
                      object Label28: TLabel
                        Left = 187
                        Top = 172
                        Width = 250
                        Height = 13
                        Caption = 'Ex.: REQ,OSP,OSS,OST,OSPT,VEI,VEIU,CNS,RETB.'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clBlue
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = []
                        ParentFont = False
                      end
                      object Label29: TLabel
                        Left = 187
                        Top = 220
                        Width = 124
                        Height = 13
                        Caption = 'Ex.: DEVVN,DEVVU,DEVP.'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clBlue
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = []
                        ParentFont = False
                      end
                      object DBEdit9: TDBEdit
                        Left = 187
                        Top = 37
                        Width = 134
                        Height = 21
                        CharCase = ecUpperCase
                        DataField = 'COD_DEP'
                        DataSource = DtmCadBasicosCx.dsDptoGrupo
                        TabOrder = 0
                        OnExit = DBEdit9Exit
                      end
                      object DBEdit10: TDBEdit
                        Left = 187
                        Top = 64
                        Width = 459
                        Height = 21
                        CharCase = ecUpperCase
                        DataField = 'DESC_DEP'
                        DataSource = DtmCadBasicosCx.dsDptoGrupo
                        TabOrder = 1
                      end
                      object DBEdit11: TDBEdit
                        Left = 187
                        Top = 91
                        Width = 134
                        Height = 21
                        CharCase = ecUpperCase
                        DataField = 'PERC_DEP'
                        DataSource = DtmCadBasicosCx.dsDptoGrupo
                        TabOrder = 2
                      end
                      object DBComboBox4: TDBComboBox
                        Left = 187
                        Top = 118
                        Width = 134
                        Height = 21
                        CharCase = ecUpperCase
                        DataField = 'TP_DEP'
                        DataSource = DtmCadBasicosCx.dsDptoGrupo
                        ItemHeight = 13
                        Items.Strings = (
                          'I - INDIVIDUAL'
                          'T - TODOS ( DIVIDE POR TODOS )')
                        TabOrder = 3
                        OnKeyPress = DBComboBox4KeyPress
                      end
                      object DBEdit13: TDBEdit
                        Left = 187
                        Top = 145
                        Width = 459
                        Height = 21
                        CharCase = ecUpperCase
                        DataField = 'TIPOFAT'
                        DataSource = DtmCadBasicosCx.dsDptoGrupo
                        TabOrder = 4
                      end
                      object DBEdit14: TDBEdit
                        Left = 187
                        Top = 193
                        Width = 459
                        Height = 21
                        CharCase = ecUpperCase
                        DataField = 'TIPDEVDEP'
                        DataSource = DtmCadBasicosCx.dsDptoGrupo
                        TabOrder = 5
                      end
                      object GroupBox19: TGroupBox
                        Left = 2
                        Top = 238
                        Width = 763
                        Height = 111
                        Align = alBottom
                        Caption = 'Cont'#225'bil'
                        TabOrder = 6
                        object Label50: TLabel
                          Left = 88
                          Top = 18
                          Width = 91
                          Height = 13
                          Caption = 'Depto'#39's de Venda :'
                        end
                        object Label53: TLabel
                          Left = 84
                          Top = 66
                          Width = 95
                          Height = 13
                          Caption = 'Devolu'#231#245'es Venda :'
                        end
                        object Label54: TLabel
                          Left = 185
                          Top = 42
                          Width = 307
                          Height = 13
                          Caption = 'Ex.: NFP,CPP,NFPS,CPPS,NFS,CPS,NFVN,NFVU,NFO,CNS,RETB'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clBlue
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = []
                          ParentFont = False
                        end
                        object Label55: TLabel
                          Left = 185
                          Top = 90
                          Width = 159
                          Height = 13
                          Caption = 'Ex.: DEVNFP,DEVNFVN,DEVNFVU'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clBlue
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = []
                          ParentFont = False
                        end
                        object DBEdit21: TDBEdit
                          Left = 185
                          Top = 15
                          Width = 459
                          Height = 21
                          CharCase = ecUpperCase
                          DataField = 'TIPOFATCNT'
                          DataSource = DtmCadBasicosCx.dsDptoGrupo
                          TabOrder = 0
                        end
                        object DBEdit22: TDBEdit
                          Left = 185
                          Top = 63
                          Width = 459
                          Height = 21
                          CharCase = ecUpperCase
                          DataField = 'TIPDEVDEPCNT'
                          DataSource = DtmCadBasicosCx.dsDptoGrupo
                          TabOrder = 1
                        end
                      end
                      object Panel19: TPanel
                        Left = 2
                        Top = 349
                        Width = 763
                        Height = 34
                        Align = alBottom
                        TabOrder = 7
                        object BitBtn22: TBitBtn
                          Left = 304
                          Top = 4
                          Width = 75
                          Height = 25
                          Caption = 'Ok'
                          TabOrder = 0
                          OnClick = BitBtn22Click
                          Glyph.Data = {
                            DE010000424DDE01000000000000760000002800000024000000120000000100
                            0400000000006801000000000000000000001000000000000000000000000000
                            80000080000000808000800000008000800080800000C0C0C000808080000000
                            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                            3333333333333333333333330000333333333333333333333333F33333333333
                            00003333344333333333333333388F3333333333000033334224333333333333
                            338338F3333333330000333422224333333333333833338F3333333300003342
                            222224333333333383333338F3333333000034222A22224333333338F338F333
                            8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
                            33333338F83338F338F33333000033A33333A222433333338333338F338F3333
                            0000333333333A222433333333333338F338F33300003333333333A222433333
                            333333338F338F33000033333333333A222433333333333338F338F300003333
                            33333333A222433333333333338F338F00003333333333333A22433333333333
                            3338F38F000033333333333333A223333333333333338F830000333333333333
                            333A333333333333333338330000333333333333333333333333333333333333
                            0000}
                          NumGlyphs = 2
                        end
                        object BitBtn23: TBitBtn
                          Left = 385
                          Top = 4
                          Width = 75
                          Height = 25
                          Caption = 'Cancelar'
                          TabOrder = 1
                          OnClick = BitBtn23Click
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
                  object TabSheet13: TTabSheet
                    Caption = 'Formas de Rateio por Departamento'
                    ImageIndex = 2
                    object PageControl6: TPageControl
                      Left = 0
                      Top = 0
                      Width = 767
                      Height = 429
                      ActivePage = TabSheet14
                      Align = alClient
                      TabOrder = 0
                      object TabSheet14: TTabSheet
                        Caption = 'Rateios por Departamento'
                        object GroupBox11: TGroupBox
                          Left = 0
                          Top = 41
                          Width = 759
                          Height = 288
                          Align = alTop
                          Caption = 'Rateios por Departamento'
                          TabOrder = 0
                          object DBGrid5: TDBGrid
                            Left = 2
                            Top = 15
                            Width = 755
                            Height = 239
                            Align = alClient
                            DataSource = DtmCadBasicosCx.dsRateioDpto
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
                                FieldName = 'COD_DEP'
                                Visible = True
                              end
                              item
                                Expanded = False
                                FieldName = 'COD_DEPRAT'
                                Visible = True
                              end
                              item
                                Expanded = False
                                FieldName = 'TPRAT'
                                Visible = True
                              end
                              item
                                Expanded = False
                                FieldName = 'MEDQTDRATFAT'
                                Visible = True
                              end
                              item
                                Expanded = False
                                FieldName = 'RATEM'
                                Visible = True
                              end>
                          end
                          object Panel8: TPanel
                            Left = 2
                            Top = 254
                            Width = 755
                            Height = 32
                            Align = alBottom
                            BevelKind = bkTile
                            BevelOuter = bvNone
                            TabOrder = 1
                            object BitBtn28: TBitBtn
                              Left = 216
                              Top = 2
                              Width = 75
                              Height = 25
                              Hint = 'Incluir Registro - [CXG046]'
                              Caption = 'Incluir'
                              TabOrder = 0
                              OnClick = BitBtn28Click
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
                            object BitBtn29: TBitBtn
                              Left = 297
                              Top = 2
                              Width = 75
                              Height = 25
                              Hint = 'Alterar Registro - [CXG047]'
                              Caption = 'Editar'
                              TabOrder = 1
                              OnClick = BitBtn29Click
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
                            object BitBtn30: TBitBtn
                              Left = 378
                              Top = 2
                              Width = 75
                              Height = 25
                              Hint = 'Excluir Registro - [CXG048]'
                              Caption = 'Excluir'
                              TabOrder = 2
                              OnClick = BitBtn30Click
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
                            object BitBtn31: TBitBtn
                              Left = 459
                              Top = 2
                              Width = 75
                              Height = 25
                              Hint = 'Sair - [CXG049]'
                              Caption = 'Sair'
                              TabOrder = 3
                              OnClick = BitBtn31Click
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
                        end
                        object Panel7: TPanel
                          Left = 0
                          Top = 0
                          Width = 759
                          Height = 41
                          Align = alTop
                          BevelOuter = bvNone
                          TabOrder = 1
                          object Label45: TLabel
                            Left = 36
                            Top = 16
                            Width = 89
                            Height = 13
                            Caption = 'Departamento :'
                            Font.Charset = DEFAULT_CHARSET
                            Font.Color = clWindowText
                            Font.Height = -11
                            Font.Name = 'Tahoma'
                            Font.Style = [fsBold]
                            ParentFont = False
                          end
                          object Label44: TLabel
                            Left = 131
                            Top = 16
                            Width = 135
                            Height = 13
                            Caption = 'Nome do Departamento'
                            Font.Charset = DEFAULT_CHARSET
                            Font.Color = clWindowText
                            Font.Height = -11
                            Font.Name = 'Tahoma'
                            Font.Style = [fsBold]
                            ParentFont = False
                          end
                        end
                      end
                      object TabSheet15: TTabSheet
                        Caption = 'Cadastro de Rateios'
                        ImageIndex = 1
                        object GroupBox10: TGroupBox
                          Left = 0
                          Top = 0
                          Width = 759
                          Height = 338
                          Align = alTop
                          Caption = ' Dados do Rateio por Departamento '
                          TabOrder = 0
                          object Label30: TLabel
                            Left = 120
                            Top = 24
                            Width = 135
                            Height = 13
                            Caption = 'Nome do Departamento'
                            Font.Charset = DEFAULT_CHARSET
                            Font.Color = clWindowText
                            Font.Height = -11
                            Font.Name = 'Tahoma'
                            Font.Style = [fsBold]
                            ParentFont = False
                          end
                          object Label31: TLabel
                            Left = 25
                            Top = 63
                            Width = 174
                            Height = 13
                            Caption = 'Departamento Destino para Rateio :'
                          end
                          object Label32: TLabel
                            Left = 87
                            Top = 89
                            Width = 112
                            Height = 13
                            Caption = 'Origem Tipo de Venda :'
                            FocusControl = DBEdit12
                          end
                          object Label33: TLabel
                            Left = 61
                            Top = 140
                            Width = 138
                            Height = 13
                            Caption = 'Qtde de M'#234'ses para Rateio :'
                            FocusControl = DBEdit15
                          end
                          object Label34: TLabel
                            Left = 31
                            Top = 167
                            Width = 168
                            Height = 13
                            Caption = 'Tipos de Venda Destino do Rateio :'
                            FocusControl = DBEdit16
                          end
                          object Label35: TLabel
                            Left = 205
                            Top = 113
                            Width = 250
                            Height = 13
                            Caption = 'Ex.: REQ,OSP,OSS,OST,OSPT,VEI,VEIU,CNS,RETB.'
                            Font.Charset = DEFAULT_CHARSET
                            Font.Color = clBlue
                            Font.Height = -11
                            Font.Name = 'Tahoma'
                            Font.Style = []
                            ParentFont = False
                          end
                          object Label36: TLabel
                            Left = 205
                            Top = 191
                            Width = 220
                            Height = 13
                            Caption = 'Ex.: REQ,OSP,OSS,OST,VEI,VEIU,CNS,RETB.'
                            Font.Charset = DEFAULT_CHARSET
                            Font.Color = clBlue
                            Font.Height = -11
                            Font.Name = 'Tahoma'
                            Font.Style = []
                            ParentFont = False
                          end
                          object Label46: TLabel
                            Left = 25
                            Top = 24
                            Width = 89
                            Height = 13
                            Caption = 'Departamento :'
                            Font.Charset = DEFAULT_CHARSET
                            Font.Color = clWindowText
                            Font.Height = -11
                            Font.Name = 'Tahoma'
                            Font.Style = [fsBold]
                            ParentFont = False
                          end
                          object DBLookupComboBox5: TDBLookupComboBox
                            Left = 205
                            Top = 59
                            Width = 459
                            Height = 21
                            DataField = 'COD_DEPRAT'
                            DataSource = DtmCadBasicosCx.dsRateioDpto
                            KeyField = 'COD_DEP'
                            ListField = 'DESC_DEP;COD_DEP'
                            ListSource = DtmCadBasicosCx.dsDptoDestino
                            TabOrder = 0
                          end
                          object DBEdit12: TDBEdit
                            Left = 205
                            Top = 86
                            Width = 459
                            Height = 21
                            CharCase = ecUpperCase
                            DataField = 'TPRAT'
                            DataSource = DtmCadBasicosCx.dsRateioDpto
                            TabOrder = 1
                          end
                          object DBEdit15: TDBEdit
                            Left = 205
                            Top = 137
                            Width = 134
                            Height = 21
                            CharCase = ecUpperCase
                            DataField = 'MEDQTDRATFAT'
                            DataSource = DtmCadBasicosCx.dsRateioDpto
                            TabOrder = 2
                          end
                          object DBEdit16: TDBEdit
                            Left = 205
                            Top = 164
                            Width = 459
                            Height = 21
                            CharCase = ecUpperCase
                            DataField = 'RATEM'
                            DataSource = DtmCadBasicosCx.dsRateioDpto
                            TabOrder = 3
                          end
                          object GroupBox20: TGroupBox
                            Left = 2
                            Top = 194
                            Width = 755
                            Height = 111
                            Align = alBottom
                            Caption = 'Cont'#225'bil'
                            TabOrder = 4
                            object Label56: TLabel
                              Left = 85
                              Top = 16
                              Width = 112
                              Height = 13
                              Caption = 'Origem Tipo de Venda :'
                              FocusControl = DBEdit23
                            end
                            object Label57: TLabel
                              Left = 203
                              Top = 40
                              Width = 311
                              Height = 13
                              Caption = 'Ex.: NFP,CPP,NFPS,CPPS,NFS,CPS,NFVN,NFVU,NFO,CNS,RETB.'
                              Font.Charset = DEFAULT_CHARSET
                              Font.Color = clBlue
                              Font.Height = -11
                              Font.Name = 'Tahoma'
                              Font.Style = []
                              ParentFont = False
                            end
                            object Label58: TLabel
                              Left = 29
                              Top = 61
                              Width = 168
                              Height = 13
                              Caption = 'Tipos de Venda Destino do Rateio :'
                              FocusControl = DBEdit24
                            end
                            object Label59: TLabel
                              Left = 203
                              Top = 85
                              Width = 311
                              Height = 13
                              Caption = 'Ex.: NFP,CPP,NFPS,CPPS,NFS,CPS,NFVN,NFVU,NFO,CNS,RETB.'
                              Font.Charset = DEFAULT_CHARSET
                              Font.Color = clBlue
                              Font.Height = -11
                              Font.Name = 'Tahoma'
                              Font.Style = []
                              ParentFont = False
                            end
                            object DBEdit23: TDBEdit
                              Left = 203
                              Top = 13
                              Width = 459
                              Height = 21
                              CharCase = ecUpperCase
                              DataField = 'TPRATCNT'
                              DataSource = DtmCadBasicosCx.dsRateioDpto
                              TabOrder = 0
                            end
                            object DBEdit24: TDBEdit
                              Left = 203
                              Top = 58
                              Width = 459
                              Height = 21
                              CharCase = ecUpperCase
                              DataField = 'RATEMCNT'
                              DataSource = DtmCadBasicosCx.dsRateioDpto
                              TabOrder = 1
                            end
                          end
                          object Panel18: TPanel
                            Left = 2
                            Top = 305
                            Width = 755
                            Height = 31
                            Align = alBottom
                            BevelKind = bkTile
                            BevelOuter = bvNone
                            TabOrder = 5
                            object BitBtn12: TBitBtn
                              Left = 298
                              Top = 1
                              Width = 75
                              Height = 25
                              Caption = 'Salvar'
                              TabOrder = 0
                              OnClick = BitBtn12Click
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
                            object BitBtn27: TBitBtn
                              Left = 379
                              Top = 1
                              Width = 75
                              Height = 25
                              Caption = 'Cancelar'
                              TabOrder = 1
                              OnClick = BitBtn27Click
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
                    end
                  end
                end
              end
              object Tabsheet16: TTabSheet
                Caption = 'Relat'#243'rio'
                ImageIndex = 4
                object QuickRep1: TQuickRep
                  Left = 3
                  Top = 0
                  Width = 794
                  Height = 1123
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  DataSet = DtmCadBasicosCx.cdsPlanoContas
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
                  SnapToGrid = True
                  Units = MM
                  Zoom = 100
                  PrevFormStyle = fsNormal
                  PreviewInitialState = wsMaximized
                  PrevInitialZoom = qrZoom100
                  PreviewDefaultSaveType = stQRP
                  object PageHeaderBand1: TQRBand
                    Left = 38
                    Top = 38
                    Width = 718
                    Height = 126
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
                      333.375000000000000000
                      1899.708333333333000000)
                    PreCaluculateBandHeight = False
                    KeepOnOnePage = False
                    BandType = rbPageHeader
                    object QRLabel15: TQRLabel
                      Left = 2
                      Top = 36
                      Width = 343
                      Height = 24
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        63.500000000000000000
                        5.291666666666670000
                        95.250000000000000000
                        907.520833333333000000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = False
                      AutoStretch = False
                      Caption = 'Relat'#243'rio de Plano de Contas'
                      Color = clWhite
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -19
                      Font.Name = 'Arial'
                      Font.Style = [fsItalic]
                      ParentFont = False
                      Transparent = False
                      WordWrap = True
                      ExportAs = exptText
                      FontSize = 14
                    end
                    object QRLabel16: TQRLabel
                      Left = 2
                      Top = 61
                      Width = 65
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        5.291666666666667000
                        161.395833333333300000
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
                    object QRSysData3: TQRSysData
                      Left = 73
                      Top = 61
                      Width = 69
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        193.145833333333300000
                        161.395833333333300000
                        182.562500000000000000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      Color = clWhite
                      Data = qrsDateTime
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -13
                      Font.Name = 'Arial'
                      Font.Style = [fsItalic]
                      ParentFont = False
                      Transparent = False
                      ExportAs = exptText
                      FontSize = 10
                    end
                    object QRLabel17: TQRLabel
                      Left = 645
                      Top = 60
                      Width = 47
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        1706.562500000000000000
                        158.750000000000000000
                        124.354166666666700000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Caption = 'P'#225'gina:'
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
                    object QRShape5: TQRShape
                      Left = 3
                      Top = 79
                      Width = 734
                      Height = 3
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        7.937500000000000000
                        7.937500000000000000
                        209.020833333333000000
                        1942.041666666670000000)
                      Brush.Color = clBlack
                      Shape = qrsRectangle
                      VertAdjust = 0
                    end
                    object QRLabel18: TQRLabel
                      Left = 7
                      Top = 83
                      Width = 46
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        18.520833333333330000
                        219.604166666666700000
                        121.708333333333300000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Caption = 'CONTA'
                      Color = clWhite
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -13
                      Font.Name = 'Arial'
                      Font.Style = [fsBold]
                      ParentFont = False
                      Transparent = False
                      WordWrap = True
                      ExportAs = exptText
                      FontSize = 10
                    end
                    object QRLabel1: TQRLabel
                      Left = 7
                      Top = 104
                      Width = 121
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666700000
                        18.520833333333300000
                        275.166666666667000000
                        320.145833333333000000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = False
                      AutoStretch = False
                      Caption = 'DEPARTAMENTO'
                      Color = clWhite
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -13
                      Font.Name = 'Arial'
                      Font.Style = [fsBold]
                      ParentFont = False
                      Transparent = False
                      WordWrap = True
                      ExportAs = exptText
                      FontSize = 10
                    end
                    object QRLabel19: TQRLabel
                      Left = 89
                      Top = 83
                      Width = 77
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        235.479166666666700000
                        219.604166666666700000
                        203.729166666666700000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Caption = 'DESCRI'#199#195'O'
                      Color = clWhite
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -13
                      Font.Name = 'Arial'
                      Font.Style = [fsBold]
                      ParentFont = False
                      Transparent = False
                      WordWrap = True
                      ExportAs = exptText
                      FontSize = 10
                    end
                    object QRLabel2: TQRLabel
                      Left = 215
                      Top = 104
                      Width = 202
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666700000
                        568.854166666667000000
                        275.166666666667000000
                        534.458333333333000000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = False
                      AutoStretch = False
                      Caption = 'DESCRI'#199#195'O PADR'#195'O MAPA'
                      Color = clWhite
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -13
                      Font.Name = 'Arial'
                      Font.Style = [fsBold]
                      ParentFont = False
                      Transparent = False
                      WordWrap = True
                      ExportAs = exptText
                      FontSize = 10
                    end
                    object QRLabel20: TQRLabel
                      Left = 456
                      Top = 83
                      Width = 32
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        1206.500000000000000000
                        219.604166666666700000
                        84.666666666666680000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Caption = 'TIPO'
                      Color = clWhite
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -13
                      Font.Name = 'Arial'
                      Font.Style = [fsBold]
                      ParentFont = False
                      Transparent = False
                      WordWrap = True
                      ExportAs = exptText
                      FontSize = 10
                    end
                    object QRLabel22: TQRLabel
                      Left = 528
                      Top = 84
                      Width = 41
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        1397.000000000000000000
                        222.250000000000000000
                        108.479166666666700000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Caption = 'SIGLA'
                      Color = clWhite
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -13
                      Font.Name = 'Arial'
                      Font.Style = [fsBold]
                      ParentFont = False
                      Transparent = False
                      WordWrap = True
                      ExportAs = exptText
                      FontSize = 10
                    end
                    object QRLabel21: TQRLabel
                      Left = 600
                      Top = 83
                      Width = 105
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666700000
                        1587.500000000000000000
                        219.604166666667000000
                        277.812500000000000000)
                      Alignment = taRightJustify
                      AlignToBand = False
                      AutoSize = False
                      AutoStretch = False
                      Caption = 'GRUPO'
                      Color = clWhite
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -13
                      Font.Name = 'Arial'
                      Font.Style = [fsBold]
                      ParentFont = False
                      Transparent = False
                      WordWrap = True
                      ExportAs = exptText
                      FontSize = 10
                    end
                    object QRDBText1: TQRDBText
                      Left = 3
                      Top = 8
                      Width = 122
                      Height = 25
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        66.145833333333340000
                        7.937500000000000000
                        21.166666666666670000
                        322.791666666666700000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Color = clWhite
                      DataSet = DtmCadBasicosCx.cdsEmpresa
                      DataField = 'NOME_EMP'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -21
                      Font.Name = 'Arial'
                      Font.Style = [fsBold, fsItalic]
                      ParentFont = False
                      Transparent = False
                      WordWrap = True
                      ExportAs = exptText
                      FontSize = 16
                    end
                    object QRSysData1: TQRSysData
                      Left = 701
                      Top = 60
                      Width = 36
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        1854.729166666667000000
                        158.750000000000000000
                        95.250000000000000000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = False
                      Color = clWhite
                      Data = qrsPageNumber
                      Transparent = False
                      ExportAs = exptText
                      FontSize = 10
                    end
                    object QRShape6: TQRShape
                      Left = 3
                      Top = 121
                      Width = 734
                      Height = 3
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        7.937500000000000000
                        7.937500000000000000
                        320.145833333333000000
                        1942.041666666670000000)
                      Brush.Color = clBlack
                      Shape = qrsRectangle
                      VertAdjust = 0
                    end
                  end
                  object DetailBand1: TQRBand
                    Left = 38
                    Top = 164
                    Width = 718
                    Height = 42
                    Frame.Color = clBlack
                    Frame.DrawTop = False
                    Frame.DrawBottom = False
                    Frame.DrawLeft = False
                    Frame.DrawRight = False
                    AlignToBottom = False
                    BeforePrint = DetailBand1BeforePrint
                    Color = clWhite
                    TransparentBand = False
                    ForceNewColumn = False
                    ForceNewPage = False
                    Size.Values = (
                      111.125000000000000000
                      1899.708333333333000000)
                    PreCaluculateBandHeight = False
                    KeepOnOnePage = False
                    BandType = rbDetail
                    object QRDBText2: TQRDBText
                      Left = 7
                      Top = 4
                      Width = 81
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        18.520833333333330000
                        10.583333333333330000
                        214.312500000000000000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = False
                      AutoStretch = False
                      Color = clWhite
                      DataSet = DtmCadBasicosCx.cdsPlanoContas
                      DataField = 'N_CONTA_PLC'
                      Transparent = False
                      WordWrap = True
                      ExportAs = exptText
                      FontSize = 10
                    end
                    object QRDBText3: TQRDBText
                      Left = 89
                      Top = 4
                      Width = 363
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        235.479166666666700000
                        10.583333333333330000
                        960.437500000000000000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = False
                      AutoStretch = False
                      Color = clWhite
                      DataSet = DtmCadBasicosCx.cdsPlanoContas
                      DataField = 'DESC_PLC'
                      Transparent = False
                      WordWrap = True
                      ExportAs = exptText
                      FontSize = 10
                    end
                    object QRDBText4: TQRDBText
                      Left = 458
                      Top = 4
                      Width = 62
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        1211.791666666667000000
                        10.583333333333330000
                        164.041666666666700000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Color = clWhite
                      DataSet = DtmCadBasicosCx.cdsPlanoContas
                      DataField = 'TIPO_PLC'
                      Transparent = False
                      WordWrap = True
                      ExportAs = exptText
                      FontSize = 10
                    end
                    object QRDBText5: TQRDBText
                      Left = 526
                      Top = 4
                      Width = 71
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        1391.708333333333000000
                        10.583333333333330000
                        187.854166666666700000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Color = clWhite
                      DataSet = DtmCadBasicosCx.cdsPlanoContas
                      DataField = 'SIGLA_PLC'
                      Transparent = False
                      WordWrap = True
                      ExportAs = exptText
                      FontSize = 10
                    end
                    object QRDBText6: TQRDBText
                      Left = 642
                      Top = 7
                      Width = 95
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        1698.625000000000000000
                        18.520833333333330000
                        251.354166666666700000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = False
                      AutoStretch = False
                      Color = clWhite
                      DataSet = DtmCadBasicosCx.cdsGrupoPC
                      DataField = 'DESC_GR'
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
                    object QRDBText7: TQRDBText
                      Left = 601
                      Top = 4
                      Width = 36
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        1590.145833333333000000
                        10.583333333333330000
                        95.250000000000000000)
                      Alignment = taRightJustify
                      AlignToBand = False
                      AutoSize = False
                      AutoStretch = False
                      Color = clWhite
                      DataSet = DtmCadBasicosCx.cdsPlanoContas
                      DataField = 'GRUP_CT'
                      Transparent = False
                      WordWrap = True
                      ExportAs = exptText
                      FontSize = 10
                    end
                    object QRDBText8: TQRDBText
                      Left = 7
                      Top = 23
                      Width = 71
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        18.520833333333330000
                        60.854166666666680000
                        187.854166666666700000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Color = clWhite
                      DataSet = DtmCadBasicosCx.cdsDptoGrupo
                      DataField = 'DESC_DEP'
                      Transparent = False
                      WordWrap = True
                      ExportAs = exptText
                      FontSize = 10
                    end
                    object QRDBText9: TQRDBText
                      Left = 215
                      Top = 23
                      Width = 80
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        568.854166666666700000
                        60.854166666666680000
                        211.666666666666700000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Color = clWhite
                      DataSet = DtmCadBasicosCx.cdsPlanoContas
                      DataField = 'DESC_PADR'
                      Transparent = False
                      WordWrap = True
                      ExportAs = exptText
                      FontSize = 10
                    end
                  end
                end
              end
              object TabSheet17: TTabSheet
                Caption = 'Vinculos de Contas para Rateio'
                ImageIndex = 5
                object Label47: TLabel
                  Left = 264
                  Top = 8
                  Width = 37
                  Height = 13
                  Caption = 'Label47'
                end
                object PageControl7: TPageControl
                  Left = 0
                  Top = 0
                  Width = 775
                  Height = 457
                  ActivePage = TabSheet19
                  Align = alClient
                  TabOrder = 0
                  object TabSheet19: TTabSheet
                    Caption = 'Contas Vinculadas para Rateio'
                    object GroupBox12: TGroupBox
                      Left = 0
                      Top = 41
                      Width = 767
                      Height = 388
                      Align = alClient
                      Caption = ' Contas Vinculadas para Rateio '
                      TabOrder = 0
                      object DBGrid6: TDBGrid
                        Left = 2
                        Top = 15
                        Width = 763
                        Height = 337
                        Align = alClient
                        DataSource = DtmCadBasicosCx.dsRateioContas
                        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
                        TabOrder = 0
                        TitleFont.Charset = DEFAULT_CHARSET
                        TitleFont.Color = clWindowText
                        TitleFont.Height = -11
                        TitleFont.Name = 'Tahoma'
                        TitleFont.Style = []
                        Columns = <
                          item
                            Expanded = False
                            FieldName = 'N_CONTA_PLC_OR'
                            Width = 140
                            Visible = True
                          end
                          item
                            Expanded = False
                            FieldName = 'N_CONTA_PLC_VAL'
                            Width = 179
                            Visible = True
                          end
                          item
                            Expanded = False
                            FieldName = 'N_CONTA_DEST'
                            Width = 199
                            Visible = True
                          end>
                      end
                      object Panel13: TPanel
                        Left = 2
                        Top = 352
                        Width = 763
                        Height = 34
                        Align = alBottom
                        BevelKind = bkTile
                        BevelOuter = bvLowered
                        TabOrder = 1
                        object BitBtn32: TBitBtn
                          Left = 261
                          Top = 3
                          Width = 75
                          Height = 25
                          Hint = 'Incluir Registro - [CXG055]'
                          Caption = 'Incluir'
                          TabOrder = 0
                          OnClick = BitBtn32Click
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
                        object BitBtn33: TBitBtn
                          Left = 342
                          Top = 3
                          Width = 75
                          Height = 25
                          Hint = 'Excluir Registro - [CXG056]'
                          Caption = 'Excluir'
                          TabOrder = 1
                          OnClick = BitBtn33Click
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
                        object BitBtn34: TBitBtn
                          Left = 423
                          Top = 3
                          Width = 75
                          Height = 25
                          Hint = 'Sair - [CXG057]'
                          Caption = 'Sair'
                          TabOrder = 2
                          OnClick = BitBtn34Click
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
                    end
                    object Panel12: TPanel
                      Left = 0
                      Top = 0
                      Width = 767
                      Height = 41
                      Align = alTop
                      BevelOuter = bvNone
                      TabOrder = 1
                      object Label42: TLabel
                        Left = 53
                        Top = 13
                        Width = 199
                        Height = 13
                        Caption = 'N'#250'mero e Nome do Plano de Contas'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                    end
                  end
                  object TabSheet20: TTabSheet
                    Caption = 'Vincula'#231#227'o de Contas para Rateio'
                    ImageIndex = 1
                    object GroupBox13: TGroupBox
                      Left = 0
                      Top = 0
                      Width = 767
                      Height = 161
                      Align = alTop
                      Caption = ' Dados da Vincula'#231#227'o de Contas para Rateio '
                      TabOrder = 0
                      object Label37: TLabel
                        Left = 32
                        Top = 65
                        Width = 151
                        Height = 13
                        Caption = 'N'#186'. Conta Origem para Rateio :'
                      end
                      object Label38: TLabel
                        Left = 30
                        Top = 92
                        Width = 153
                        Height = 13
                        Caption = 'N'#186'. Conta Destino para Rateio :'
                      end
                      object Label48: TLabel
                        Left = 32
                        Top = 32
                        Width = 199
                        Height = 13
                        Caption = 'N'#250'mero e Nome do Plano de Contas'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object DBLookupComboBox6: TDBLookupComboBox
                        Left = 189
                        Top = 61
                        Width = 459
                        Height = 21
                        DataField = 'N_CONTA_PLC_VAL'
                        DataSource = DtmCadBasicosCx.dsRateioContas
                        KeyField = 'N_CONTA_PLC'
                        ListField = 'DESC_PLC;N_CONTA_PLC'
                        ListSource = DtmCadBasicosCx.dsPlanoContas
                        TabOrder = 0
                      end
                      object DBLookupComboBox7: TDBLookupComboBox
                        Left = 189
                        Top = 88
                        Width = 459
                        Height = 21
                        DataField = 'N_CONTA_DEST'
                        DataSource = DtmCadBasicosCx.dsRateioContas
                        KeyField = 'N_CONTA_PLC'
                        ListField = 'DESC_PLC;N_CONTA_PLC'
                        ListSource = DtmCadBasicosCx.dsPlanoContas
                        TabOrder = 1
                      end
                      object Panel20: TPanel
                        Left = 2
                        Top = 128
                        Width = 763
                        Height = 31
                        Align = alBottom
                        BevelKind = bkTile
                        BevelOuter = bvNone
                        TabOrder = 2
                        object BitBtn35: TBitBtn
                          Left = 303
                          Top = 1
                          Width = 75
                          Height = 25
                          Caption = 'Salvar'
                          TabOrder = 0
                          OnClick = BitBtn35Click
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
                        object BitBtn36: TBitBtn
                          Left = 381
                          Top = 1
                          Width = 75
                          Height = 25
                          Caption = 'Cancelar'
                          TabOrder = 1
                          OnClick = BitBtn36Click
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
                end
              end
              object TabSheet18: TTabSheet
                Caption = 'Hist'#243'rico Plano Contas'
                ImageIndex = 6
                object PageControl8: TPageControl
                  Left = 0
                  Top = 0
                  Width = 775
                  Height = 457
                  ActivePage = TabSheet21
                  Align = alClient
                  TabOrder = 0
                  object TabSheet21: TTabSheet
                    Caption = 'Hist'#243'rico de Plano de Contas'
                    object GroupBox14: TGroupBox
                      Left = 0
                      Top = 41
                      Width = 767
                      Height = 280
                      Align = alTop
                      Caption = ' Hist'#243'ricos de Plano de contas '
                      TabOrder = 0
                      object DBGrid7: TDBGrid
                        Left = 2
                        Top = 15
                        Width = 763
                        Height = 232
                        Align = alClient
                        DataSource = DtmCadBasicosCx.dsHistPContas
                        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
                        TabOrder = 0
                        TitleFont.Charset = DEFAULT_CHARSET
                        TitleFont.Color = clWindowText
                        TitleFont.Height = -11
                        TitleFont.Name = 'Tahoma'
                        TitleFont.Style = []
                        OnKeyDown = DBGrid7KeyDown
                        Columns = <
                          item
                            Expanded = False
                            FieldName = 'NUMERO_CONTA'
                            Width = 96
                            Visible = True
                          end
                          item
                            Expanded = False
                            FieldName = 'HISTORICO'
                            Width = 126
                            Visible = True
                          end>
                      end
                      object Panel15: TPanel
                        Left = 2
                        Top = 247
                        Width = 763
                        Height = 31
                        Align = alBottom
                        BevelKind = bkTile
                        BevelOuter = bvNone
                        TabOrder = 1
                        object BitBtn37: TBitBtn
                          Left = 220
                          Top = 1
                          Width = 75
                          Height = 25
                          Hint = 'Incluir Registro -[CXG061]'
                          Caption = 'Incluir'
                          TabOrder = 0
                          OnClick = BitBtn37Click
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
                        object BitBtn38: TBitBtn
                          Left = 301
                          Top = 1
                          Width = 75
                          Height = 25
                          Hint = 'Alterar Registro - [CXG062]'
                          Caption = 'Editar'
                          TabOrder = 1
                          OnClick = BitBtn38Click
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
                        object BitBtn39: TBitBtn
                          Left = 382
                          Top = 1
                          Width = 75
                          Height = 25
                          Hint = 'Excluir Registro - [CXG063]'
                          Caption = 'Excluir'
                          TabOrder = 2
                          OnClick = BitBtn39Click
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
                        object BitBtn40: TBitBtn
                          Left = 463
                          Top = 1
                          Width = 75
                          Height = 25
                          Hint = 'Sair - [CXG064]'
                          Caption = 'Sair'
                          TabOrder = 3
                          OnClick = BitBtn40Click
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
                    end
                    object Panel14: TPanel
                      Left = 0
                      Top = 0
                      Width = 767
                      Height = 41
                      Align = alTop
                      BevelOuter = bvNone
                      TabOrder = 1
                      object Label43: TLabel
                        Left = 13
                        Top = 12
                        Width = 199
                        Height = 13
                        Caption = 'N'#250'mero e Nome do Plano de Contas'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                    end
                  end
                  object TabSheet22: TTabSheet
                    Caption = 'Cadatro de Hist'#243'rico de Plano de Contas'
                    ImageIndex = 1
                    object GroupBox15: TGroupBox
                      Left = 0
                      Top = 0
                      Width = 767
                      Height = 161
                      Align = alTop
                      Caption = 'Dados do Hist'#243'rico'
                      TabOrder = 0
                      object Label39: TLabel
                        Left = 62
                        Top = 69
                        Width = 91
                        Height = 13
                        Caption = 'N'#250'mero da Conta :'
                        FocusControl = DBEdit17
                      end
                      object Label40: TLabel
                        Left = 21
                        Top = 96
                        Width = 132
                        Height = 13
                        Caption = 'Hist'#243'rico Padr'#227'o da Conta :'
                        FocusControl = DBEdit18
                      end
                      object Label49: TLabel
                        Left = 21
                        Top = 31
                        Width = 199
                        Height = 13
                        Caption = 'N'#250'mero e Nome do Plano de Contas'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object DBEdit17: TDBEdit
                        Left = 159
                        Top = 66
                        Width = 134
                        Height = 21
                        CharCase = ecUpperCase
                        DataField = 'NUMERO_CONTA'
                        DataSource = DtmCadBasicosCx.dsHistPContas
                        Enabled = False
                        TabOrder = 0
                      end
                      object DBEdit18: TDBEdit
                        Left = 159
                        Top = 93
                        Width = 530
                        Height = 21
                        CharCase = ecUpperCase
                        DataField = 'HISTORICO'
                        DataSource = DtmCadBasicosCx.dsHistPContas
                        TabOrder = 1
                      end
                      object Panel21: TPanel
                        Left = 2
                        Top = 128
                        Width = 763
                        Height = 31
                        Align = alBottom
                        BevelKind = bkTile
                        BevelOuter = bvNone
                        TabOrder = 2
                        object BitBtn41: TBitBtn
                          Left = 301
                          Top = 1
                          Width = 75
                          Height = 25
                          Caption = 'Ok'
                          TabOrder = 0
                          OnClick = BitBtn41Click
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
                        object BitBtn42: TBitBtn
                          Left = 382
                          Top = 1
                          Width = 75
                          Height = 25
                          Caption = 'Cancelar'
                          TabOrder = 1
                          OnClick = BitBtn42Click
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
                end
              end
              object TabSheet23: TTabSheet
                Caption = 'Vinculos de Contas com Balan'#231'os'
                ImageIndex = 7
                object GroupBox16: TGroupBox
                  Left = 0
                  Top = 0
                  Width = 775
                  Height = 457
                  Align = alClient
                  Caption = ' Vincula'#231#227'o entre Contas de Sequ'#234'ncia de Balan'#231'o '
                  TabOrder = 0
                  object GroupBox17: TGroupBox
                    Left = 2
                    Top = 56
                    Width = 771
                    Height = 161
                    Align = alTop
                    Caption = ' Dados do Balan'#231'o '
                    TabOrder = 0
                    object DBGrid8: TDBGrid
                      Left = 2
                      Top = 15
                      Width = 767
                      Height = 144
                      Align = alClient
                      DataSource = DtmCadBasicosCx.dsBalanco
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
                          FieldName = 'CODSEQ_BALANCO'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'TIPO_BALANCO'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'CODIGO_INT_BAL'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'DESC_BALANCO'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'SUBTIPO'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'SINAL'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'PRAZOINICIAL'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'PRAZOFINAL'
                          Visible = True
                        end>
                    end
                  end
                  object Panel4: TPanel
                    Left = 2
                    Top = 15
                    Width = 771
                    Height = 41
                    Align = alTop
                    BevelOuter = bvNone
                    TabOrder = 1
                    object Label41: TLabel
                      Left = 33
                      Top = 12
                      Width = 193
                      Height = 13
                      Caption = 'Codigo e Nome do Plano de Contas'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label64: TLabel
                      Left = 477
                      Top = 9
                      Width = 237
                      Height = 16
                      Caption = 'DESATIVADO V'#205'NCULO COM BALAN'#199'O'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clRed
                      Font.Height = -13
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                  end
                  object Panel5: TPanel
                    Left = 2
                    Top = 217
                    Width = 771
                    Height = 32
                    Align = alTop
                    BevelKind = bkTile
                    BevelOuter = bvNone
                    TabOrder = 2
                    object BitBtn43: TBitBtn
                      Left = 162
                      Top = 2
                      Width = 106
                      Height = 25
                      Hint = 'Incluir Registro - [CXG068]'
                      Caption = 'Incluir'
                      TabOrder = 0
                      OnClick = BitBtn43Click
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
                    object BitBtn44: TBitBtn
                      Left = 274
                      Top = 2
                      Width = 107
                      Height = 25
                      Hint = 'Excluir Registro - [CXG069]'
                      Caption = 'Excluir'
                      TabOrder = 1
                      OnClick = BitBtn44Click
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
                    object BitBtn47: TBitBtn
                      Left = 387
                      Top = 2
                      Width = 107
                      Height = 25
                      Hint = 'Ativar v'#237'nculo com o balan'#231'o - [CXG119]'
                      Caption = 'Ativar v'#237'nculo'
                      TabOrder = 2
                      OnClick = BitBtn47Click
                      Glyph.Data = {
                        36030000424D3603000000000000360000002800000010000000100000000100
                        18000000000000030000C40E0000C40E00000000000000000000FF00FFFF00FF
                        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                        FFFF00FF0354CBFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                        00FFFF00FFFF00FFFF00FFFF00FF0251C70C65DC0251C70251C7FF00FFFF00FF
                        0FC0F40FBCF5FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0251C7167A
                        EC1B9EF90251C7FF00FFFF00FFFF00FFFF00FF0FC0F40FBCF5FF00FFFF00FF02
                        51C70251C70251C70251C71475E91B93F70251C7FF00FFFF00FFFF00FFFF00FF
                        FF00FFFF00FFFF00FFFF00FF0354CB0557CF1475E945B0F345B0F31475E90251
                        C7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0D4743085DD51B
                        89F5106EE31B89F51B93F71B89F50251C7FF00FFFF00FFFF00FFFF00FFFF00FF
                        FF00FFFF00FF0569080D71130D47431475E945B0F30C65DC106EE31980F10251
                        C7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF01550109710F21BA4A1CA7440D
                        4743106EE31B89F50557CF0E68DF0251C7FF00FFFF00FFFF00FFFF00FFFF00FF
                        FF00FF025C0320B646176B1C21BA4A066F0B054B380C65DC1B89F50557CF0251
                        C7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF025C0320B6460D711305690805
                        6E09036704064A3C085DD50251C7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                        FF00FF025C031CA7440A7211036704025C03066F0B026004064A3CFF00FFFF00
                        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF09710F056908056E0903670402
                        6004015501015501FF00FF0FC0F40FBCF5FF00FFFF00FFFF00FFFF00FFFF00FF
                        0D71131EB146025C03005000005000005000005000FF00FFFF00FFFF00FF0FC0
                        F40FBCF5FF00FFFF00FFFF00FF04660B20B646056E09005000FF00FFFF00FFFF
                        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF015501015501
                        025C03005000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                        FFFF00FFFF00FFFF00FF09710F005000FF00FFFF00FFFF00FFFF00FFFF00FFFF
                        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                    end
                    object BitBtn46: TBitBtn
                      Left = 500
                      Top = 2
                      Width = 107
                      Height = 25
                      Hint = 'Desativar v'#237'nculo com o balan'#231'o - [CXG117]'
                      Caption = 'Desativar v'#237'nculo'
                      TabOrder = 3
                      OnClick = BitBtn46Click
                      Glyph.Data = {
                        46020000424D4602000000000000460100002800000010000000100000000100
                        08000000000000010000120B0000120B0000440000004400000000000000FFFF
                        FF00FF00FF00007F00000054000000520000004D0000004C0000004900000047
                        000001880200016A010001600100015F0100005B0100015B0200015303000266
                        0400025703000374060003730400035D0500035B0500076A0800035C0600046B
                        0800056E0C0006660C0007701100076F11000B8C1A000E7A1A00138622000C87
                        1F0020C13A001EB235002CD34A0015A533001AB6410032DC640042B2FF003EAB
                        FF002489E900288FF8002D96FF00116ED7001573E6001676E5001777E9002083
                        FE002184FF00268BFF000B64D7000D68E2001F81FF000150C6000252C6000558
                        D0000559D000075CD400116CE900393B3E00004DC400004DC200004BC000014E
                        C4000452CB006F707300020202020202020202020202023E3E02020202020202
                        020202403741382F2B3F020202020202020242393028292E3F02020202020202
                        02023F332D2A2C313F020202020202020202023F29343C363F02020202020202
                        020202023F323B353F02020202020202433D0202023F363A3F02020202170543
                        3D02434302023F3F02020202121D270502433D02020202020202020215262024
                        053D02433D02020202020202182621190A05433D020202020202020216251E11
                        0D03050202020202020202021C1A130B0C040502020202020202021F230F0807
                        070802020202020202021B221409020202020202020202020202100E06020202
                        02020202020202020202}
                    end
                  end
                  object Panel6: TPanel
                    Left = 2
                    Top = 423
                    Width = 771
                    Height = 32
                    Align = alBottom
                    BevelKind = bkTile
                    BevelOuter = bvNone
                    TabOrder = 3
                    object BitBtn45: TBitBtn
                      Left = 330
                      Top = 2
                      Width = 107
                      Height = 25
                      Hint = 'Sair'
                      Caption = 'Sair'
                      TabOrder = 0
                      OnClick = BitBtn45Click
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
                  object GroupBox18: TGroupBox
                    Left = 2
                    Top = 249
                    Width = 771
                    Height = 174
                    Align = alClient
                    Caption = ' Plano de Contas do Balan'#231'o '
                    TabOrder = 4
                    object DBGrid9: TDBGrid
                      Left = 2
                      Top = 15
                      Width = 767
                      Height = 157
                      Align = alClient
                      DataSource = DtmCadBasicosCx.dsPContasBalanco
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
                          FieldName = 'CODSEQ_BALANCO'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'COD_EMPRESA'
                          Title.Caption = 'Cod. Empresa'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'TIPO_BALANCO'
                          Title.Caption = 'Grupo Balan'#231'o'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'CODIGO_INT_BAL'
                          Title.Caption = 'Seq. Interna Balan'#231'o'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'DESC_BALANCO'
                          Title.Caption = 'Descri'#231#227'o Balan'#231'o'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'SUBTIPO'
                          Title.Caption = 'Sub Tipo do Balan'#231'o'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'SINAL'
                          Title.Caption = 'Sinal'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'PRAZOINICIAL'
                          Title.Caption = 'Prazo Inicial'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'PRAZOFINAL'
                          Title.Caption = 'Prazo Final'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'IDENTIFICACAO_EMP'
                          Visible = True
                        end>
                    end
                  end
                end
              end
            end
            inherited Panel3: TPanel
              Top = 488
              ExplicitTop = 488
              inherited BitBtn4: TBitBtn
                Left = 310
                Hint = 'Confirmar Registro - [CXG024]'
                ExplicitLeft = 310
              end
              inherited BitBtn5: TBitBtn
                Left = 388
                Hint = 'Cancelar Registro - [CXG025]'
                ExplicitLeft = 388
              end
            end
          end
        end
        inherited TabSheet2: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 783
          ExplicitHeight = 536
          inherited GroupBox3: TGroupBox
            inherited BitBtn1: TBitBtn
              Hint = 'Clique para pesquisar - [CXG014]'
            end
            inherited BitBtn3: TBitBtn
              Hint = 'Novo cadastro - [CXG052]'
            end
            inherited CheckBox3: TCheckBox
              Enabled = False
              Visible = False
            end
            inherited CheckBox1: TCheckBox
              Enabled = False
              Visible = False
            end
            object CheckBox2: TCheckBox
              Left = 444
              Top = 48
              Width = 149
              Height = 17
              Hint = 'Pesquisa adicional'
              Caption = 'Sem V'#237'nculo com Balan'#231'o'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 11
              OnClick = CheckBox1Click
            end
          end
          inherited Panel1: TPanel
            Height = 463
            ExplicitHeight = 463
            inherited Splitter1: TSplitter
              Height = 402
              ExplicitHeight = 376
            end
            inherited DBGrid1: TDBGrid
              Height = 402
              OnKeyDown = DBGrid1KeyDown
            end
            inherited Panel2: TPanel
              inherited SpeedButton1: TSpeedButton
                Hint = 'Editar Registro - [CXG016]'
              end
              inherited SpeedButton2: TSpeedButton
                Hint = 'Apagar Registro - [CXG017]'
                OnClick = SpeedButton2Click
              end
              inherited SpeedButton3: TSpeedButton
                Hint = 'Imprimir - [CXG018]'
                OnClick = SpeedButton3Click
              end
              inherited SpeedButton5: TSpeedButton
                Hint = 'Recuperar registro - [CXG020]'
                OnClick = SpeedButton5Click
              end
              inherited SpeedButton6: TSpeedButton
                Hint = 'Cadastro de Grupos de Contas - [CXG021]'
                Glyph.Data = {
                  DA040000424DDA040000000000009A0200002800000018000000180000000100
                  08000000000040020000120B0000120B000099000000990000001B1786005044
                  5E00FF00FF00FCEEEF00CC666700D26C6D00FF999A00F89C9D00F9ACAD00BD73
                  7300A76666009A666600B3656300A3666500BC827B00FFF8F70083635D00AB4E
                  2100FFFDFC007E6F6600DFD9D500FFFAF600FFF7F000CC731A00736251007164
                  57006B635B0082797000D3C6B90076706A00FFFCF900FFFDFB00FFFEFD00FCC0
                  8000FED7AB00FED8AD00FEDAB200FEDBB4006A5B4B007F6E5B00FFDDB8006A5C
                  4D00FEDEBA00FFE0BD00FEE0C0006A5E5100FEE3C500FFE4C700FEE5C900AC9B
                  8800FFE7CD00FFE9D100FFEBD500FFECD700FFEDD900FFEFDD00FFF3E600FFF5
                  EA00FFF6EC00FFF7EE00EE973300D3B48E00FED8AC0076655000FED9AF006A5B
                  4900FEDAB000FEDAB1006A5B4A00FEDCB400FEDCB500FEDDB700FEDEB900FFE0
                  BC00FEDFBB006B5E4F00FEE0BE00FEE1C000FEE2C100FFE3C300FEE3C4006B60
                  5300FFE6C900FEE7CB00F3DDC400FEE8CE006A615600FEE8CF00FEE9D100FEEA
                  D300FEEBD500FEECD700FEEEDB00FEEFDD00FFF0DF006B655E00FFF1E100FFF2
                  E300FFF3E500FFF4E700FFF5E900FFF6EB00B6B1AB00FFF9F200FFFAF400766A
                  5B006A625800FEF2E300FEF3E5007C787300FFFDFA00FEFCF900FFFFFE005772
                  54000099000017861600069F0D006DD58A0033CB6700008040000386460033CE
                  97003581730031FFFF0071FFFF0063D8D800EFFFFF0001D9F20082B0B60000DC
                  FF0000D2FF0000CCFF003599B00000B3E600229CBD00339FBC00338CB3006872
                  7B004A79FF005581FE004E6ED400809EFD000033FF00143BDE006A82E8000026
                  E600133BEC004C5FC800090FA70000009A00FFFFFF00E4E4E400000000000202
                  0202020202020202020202020202020202020202020202020202020202020202
                  0202020202020202020202020202020202020202020202020202020202020202
                  0202020202021111111111111111111111111111111111111111111111021162
                  605D36345832302E4E4C4A4725434023222222221102116563615E5C35595553
                  2F502C49482718443F3D2222110211163A646C6037365A3354316919938F9100
                  01413E2211021168673B39636B1C1B130E0C0D108E8E9195952642231102116F
                  1514666D8084868904040A0B8E8E919595294524110211126E71737A83838588
                  04040A0B8E8E9195954B284611021196207272778383858804040A0B8E8E9195
                  952D2B2A11021196967272778383858804040A0B8E8E919595514F4D11021196
                  967274788383858804040A0B8E8E91959556522E110211969675767982817F87
                  04040A0B8E8E9195956A5753110211969696967E7C7B7B7D0405090B8E8E9195
                  951A3458110211969696969696969603080606078E8E9195955F5C5B11021196
                  9696969696969696960F1F1E8E8E9294951D6037110211969696969696969696
                  969670128D8B8A8A9039386B1102119797979797979797979797979797979797
                  979797971102111111111111111111111111111111111111111111111102173C
                  3C3C3C3C3C3C3C3C3C3C3C3C3C3C213C213C8C3C170202171717171717171717
                  1717171717171717171717170202020202020202020202020202020202020202
                  020202020202020202020202020202020202020202020202020202020202}
                OnClick = SpeedButton6Click
              end
              inherited SpeedButton7: TSpeedButton
                Hint = 'Cadastro de Dpto'#39's de Grupos de Contas - [CXG023]'
                Glyph.Data = {
                  46060000424D4606000000000000060400002800000018000000180000000100
                  08000000000040020000120B0000120B0000F4000000F400000000000000FFFF
                  FF00F7F5FB00F8F6FA00F5F2F700FF00FF00DACAD200A3899500DECDD500D3C2
                  C900E7CED800DEB5C400AB8E9900E9D3DA00B1728400CBB6BC00EEE3E600DED2
                  D500F5F1F200AF7D8900AC838C00AF8D9500A57D8500A7828A009A7D8300E5D6
                  D900C3B0B3009B6A7100C3A1A600C0AAAD00E6DEDF00CCB3B400D2BDBE007F55
                  5500EDE7E700F3EFEF00CFB8B700ECE4E300C2ABA600DCCCC90082645C00BFA3
                  9B00CAB3AC00DCCCC700E9E0DD00B47A630096685600CDB4AA00CFB7AD00D6C4
                  BD00BB8D7900D4C0B700DAC9C100B23E0000DCCAC000DBD0CA009E451100AB64
                  3800CFB3A200E6DBD400B9490000BB4C0300AB4C0F00DDBEAA00CAAE9C00A54B
                  0700BD642300BD977B00DECABB00B8520100C1A08400CF630000C25C0000B75D
                  0A00B6631800C46B1C00C2A48A00B35A0600C1650B00BA620D00B88F6700BD9C
                  7A00CFAF8E00DEC5AD00E4760000E2770000E28725007E4E1800DD790500E481
                  0900BB823D00BA8D5A00C79E6D00C8A57B00C4883900BD894700CE975000D09B
                  5400D58B2300A9763000D79D4800CF994A00D8AE6F00DDB67E00D7B68700D28A
                  1C00D6942F00DB9C3600CD933A00E2AD5500D8A75B00DFC49900E4CDA700E7A3
                  2A00EAAB3C00DEA23D00E1A94900E8B35400DAB26C00E2BB7800E3C38900E5C8
                  9300E9BB6200EFC26C00ECC98200EDCC8900F3CC7A00F3E3B500E5DCC300ECE1
                  BF00FEEDB300F9EEBE00F4ECBD0070712E00565E3A0052643A00889B7E00598D
                  46004D77400027631C00316A2800578B5300196A15000066000000650000005F
                  000002670100076D070035823500006C010000680100026A0300036B04000367
                  0400056E0800056C0600066F0900066A080008710B0072A37300007105000A73
                  0F001274160002770B00087910000D7B14000D79130014841F00098417000E88
                  1D00198926001B8C27001190220020952F00229733002C953A004DAB5A001A9C
                  2E0021983300239A350028A03B007DBE880022A2380028A63F0028A23D0029A3
                  3E002FAC460035B44F002AAA48003ABD58003CC05B003BC8600043CC660042C9
                  650045CD69002BB8530033C45A0047D56F004AD4700047C6690066DC88004DE6
                  7A0053E37E0054E37F005CF68E005EF790006CD5FF0068D0FF006BD3FF005DC4
                  FF0057B8EF0061C8FF0063C8FE0049A6E1004CAAE4004FAAE40057BAF5005BC1
                  FF003F97D40046A2E20047A3E00047A2DD0044A1E300348AD2003FA0F100368A
                  CC0048AEFF003092EE00369EFF00379FFF003CA2FF00165EA7001963AD001C68
                  B500247AD100257AD100267CD3003197FF002D8BEA003499FF00359BFF00349A
                  FB00369DFF002278D30005050505050599999B9A9C939B978F90050505050505
                  0505050505059DA7B2B8B9B4B3ADABA7A59E9892050505050505050591AABDC2
                  C1BEBBBAB7B6B1ACA9A8A49A928F0505050505A6AECACBC6C0BFC4C3BCAF948A
                  878CA2A3A0968F05050505A1CACDC9C5C7B08985572E1D1C211B28868B939605
                  050505A6CCC89F88634E3E3D352D081F2116130E218E950505050505A6B50B0A
                  56544D483C2D061F211617132190050505050505A68D0D1962584A4B42321124
                  21171414210505050505050505211910533F24242009060F21070C1521050505
                  05050505052127271A264052435C605E21392E18210505050505050505216F79
                  50767A755A6B7169214741382105050505050505052183825D7D7E7B5F74726A
                  2155494521050505050505050521817F51797C775B6E6D6521594F4821050505
                  050505050521373B313431332A2F3029E8E8E8E8E8E8E8E80505050505215370
                  466867665B61645EE8D6DDD7D2DADAE805050505052184825C7C7E7A5F737162
                  E8D5CED0D4E1E70505050505052180814C6F78775B6E746CE8DCCFD3D9E0E805
                  0505050505211E2322252C3B2B36443AE8DBD8D1E2E6EEE80505050505212323
                  1204030203040202E8DEE8DFE4EDE5E3E8050505052121212121212121212121
                  E8E821E8F3F2EFF1E9E8050505050505050505050505050505050505E8ECF0EA
                  E80505050505050505050505050505050505050505E8EBE80505050505050505
                  0505050505050505050505050505E80505050505050505050505050505050505
                  05050505050505050505}
                OnClick = SpeedButton7Click
              end
              inherited SpeedButton8: TSpeedButton
                Left = 349
                Hint = 'Cadastro de Sub Grupo de Contas - [CXG022]'
                Glyph.Data = {
                  F6060000424DF606000000000000360000002800000018000000180000000100
                  180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBD4C00BD4C00BD4C00BD4C00BD4C
                  00BD4C00BD4C00BD4C00BD4C00BD4C00BD4C00BD4C00BD4C00BD4C00BD4C00BD
                  4C00BD4C00BD4C00BD4C00BD4C00BD4C00BD4C00BD4C00FF00FFBD4C00FFF6ED
                  FFF3E6FFEFDEFFEBD5FEE7CEFEE3C6FEE0BDFEDCB6FFD8AFFFD5A7FED1A1FECF
                  9DFECC98FECB96FECB96FECB96FECB96FECB96FECB96FECB96FECB96BD4C00FF
                  00FFBD4C00FFFBF4FFF7EEFEF4E7FFEFE0FEEBD7FFE9CFFEE5C6FEE0BFFEDCB7
                  FED8B0FED5A9FED1A3FECF9EFECC99FECB96FECB96FECB96FECB96FECB96FECB
                  96FECB96BD4C00FF00FFBD4C00FFFCFAFFFAF4FFF7EF817E7F817E7F817E7FFF
                  E9D0FEE5C9FEE1C0817E7F817E7F817E7FFED1A4FECF9EFECC99817E7F817E7F
                  817E7FFECB96FECB96FECB96BD4C00FF00FFBD4C00FFFFFFFFFEFBFFFBF6FFF7
                  EFFFF4E9FEF0E1FFEDD9FFE9D1FEE5CAFEE1C1FEDDBAFED9B1FED5ABFED1A4FE
                  D09FFECE99FECB97FECB96FECB96FECB96FECB96BD4C00FF00FFBD4C00FFFFFF
                  FFFFFFFFFCFC2D56F82D56F82D56F8FFF2E2FEEEDAFEEAD38B28038B28038B28
                  03FED9B2FED5ABFED3A50182BF0182BF0182BFFECB96FECB96FECB96BD4C00FF
                  00FFBD4C00FFFFFFFFFFFFFFFFFF2D56F82D56F82D56F8FFF6EBFFF2E3FEEFDC
                  8B28038B28038B2803FFDEBCFFDAB5FED7AD0182BF0182BF0182BFFECC97FECB
                  96FECB96BD4C00FF00FFBD4C00FFFFFFFFFFFFFFFFFF2D56F82D56F82D56F8FF
                  F8F2FEF6EDFEF3E58B28038B28038B2803FEE3C4FFE0BDFFDCB50182BF0182BF
                  0182BFFECE9CFECC98FECB96BD4C00FF00FFBD4C00FFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFEFFFCF8FFFAF4FFF7EEFFF3E6FFEFDEFEEBD5FEE7CEFFE3C5FE
                  DEBDFEDAB6FED8AFFED5A9FED1A1FECF9DFECC98BD4C00FF00FFBD4C00FFFFFF
                  FFFFFFFFFFFFA19F9FA19F9FA19F9FFFFFFEFFFCFAFFFAF4A19F9FA19F9FA19F
                  9FFEEBD7FFE7CFFEE5C79A9A9A9A9A9A9A9A9AFFD5AAFED1A3FED09EBD4C00FF
                  00FFBD4C00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFEFA
                  FFFAF6FFF7EFFEF4E7FEF0E0FEEDD9FFE9D0FEE5C7FEE0C0FEDDB8FED8B0FED5
                  A9FED1A3BD4C00FF00FFBD4C00FFFFFFFFFFFFFFFFFFBD8281BD8281BD8281FF
                  FFFFFFFFFFFFFFFFD96401D96401D96401FFF4EAFFF0E1FFEDD9008201008201
                  008201FEDEBAFFD9B2FED5ABBD4C00FF00FFBD4C00FFFFFFFFFFFFFFFFFFBD82
                  81BD8281BD8281FFFFFFFFFFFFFFFFFFD96401D96401D96401FFF7F0FFF4EAFF
                  F0E3008201008201008201FEE2C2FFDDBAFFD9B2BD4C00FF00FFBD4C00FFFFFF
                  FFFFFFFFFFFFBD8281BD8281BD8281FFFFFFFFFFFFFFFFFFD96401D96401D964
                  01FFFCF7FFF8F0FFF6EA008201008201008201FEE6CCFEE2C4FEDEBCBD4C00FF
                  00FFBD4C00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFEFFFBF8FFF8F3FFF6EBFFF2E5FFEFDDFEEBD4FEE7
                  CCFFE2C4BD4C00FF00FFBD4C00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFFFBF8FFFAF3FFF7ED
                  FFF3E6FFEFDEFFEBD7FFE7CEBD4C00FF00FFBD4C00D96401D96401D96401D964
                  01D96401D96401D96401D96401D96401D96401D96401D96401D96401D96401D9
                  6401D96401D96401D96401D96401D96401D96401BD4C00FF00FFBD4C00BD4C00
                  BD4C00BD4C00BD4C00BD4C00BD4C00BD4C00BD4C00BD4C00BD4C00BD4C00BD4C
                  00BD4C00BD4C00BD4C00BD4C00BD4C00BD4C00BD4C00BD4C00BD4C00BD4C00FF
                  00FFFF00FFBD4C00BD4C00BD4C00BD4C00BD4C00BD4C00BD4C00BD4C00BD4C00
                  BD4C00BD4C00BD4C00BD4C00BD4C00BD4C00BD4C00BD4C00BD4C00BD4C00BD4C
                  00BD4C00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                OnClick = SpeedButton8Click
                ExplicitLeft = 349
              end
              inherited SpeedButton11: TSpeedButton
                Hint = 'Acrescentar Vinculo com outras Contas para Rateio - [CXG054]'
                Glyph.Data = {
                  5A050000424D5A050000000000001A0300002800000018000000180000000100
                  08000000000040020000120B0000120B0000B9000000B9000000100D9A001A14
                  960037309800635B6F00492A71005A326200FF00FF005E2D510082566400783D
                  46007A37350082413D00823E3600795C51009D502E009F523100A7572F00B859
                  1300CD7C3F0095613B00B7520000B9560600B9560700BA570800B9570900BB5A
                  0C00BC5B0E00BC5D1100BD611300BE611400C5661500C4651500BE611600BF61
                  1700C1651D00C66C2100C3692200CA712500C76F2600C56D2800CD772F00C771
                  2E00D07E3800C05B0000C9691000C4661400C66A1B00BA661A00CB701E00CB74
                  2500CE752600CC762800D17B2E00D27E3500DA8B4200D5884100D2731300CD75
                  1B00D5791D00CB731E00CE751F00D0762100D6832E00D7843100D7853100DF8D
                  3900E2934300DB8D4300E3964700E59A4D00E8A05600D9955400ECA66000EFAD
                  6900E0A66E00F9C08600D0730F00D1761300D37A1700D4791B00D57D1D00D57D
                  1F00D47E1F00D17C1F00D6802000D07B1F00D9832800DC8A3200DD8D3600F5BA
                  7C00FCC78F00FFCD9900D5801F00D6832200D8872600D7882900D98A2A00DA8D
                  2E00D98D3000DB913900FBF2E700DB903200DD943500DE973900DE993C00DF9A
                  3D00E1A04900E3A75500E5AD6100E7B36E00E9BA7A00EBC08600EDC69200F1D3
                  AA00F3D9B600F9ECDB00EFCD9E00FDF9F30000C9FF001987D9001470BD000085
                  FF00297DD9000073FF000060FF000054F200497DDF004F669500004CFF00002D
                  B000003AFF001039E500002EF6000029EB000028EA000027E7000026E500072E
                  EB003149B600536AD90098A0C5000022DE000022DD000021DC004A569400001D
                  D500001DD300001BD000001ACF000019CD000015C5000015C3000014C2001024
                  C9006C75CA000011BD00000FB900000EB600000EB5000D19B600000CB200000A
                  AE000009AD00000AAD000009AC000008AA00050FB0000006A6001015AB007578
                  BE0000029F0000029E000608A00006089F001114A8002E2EAC003A3A9D006565
                  B20068688500B8B8CB00C1C1CB00BBBBC400D1D1D100CBCBCB00000000000606
                  060606060606060606ACAFAC06060606060606060606060606060606060606AC
                  ACB7B7B1AD06060606060606060606060606060606ACACB4B7B5A9A888AD0606
                  0606060606060606060606ACACB4B6B49A99969DA18EAD060606060606060606
                  06B0ACB7B7B38B87858D93969DA191AD0606060606060606ACB2B68C7E7D8082
                  84868D93969EA395AD06060606060606067F7A77797B7C808284868D93979EA2
                  96AD06060606060681762F11130D03908A8389868D94979EA49BAD0606060606
                  067829443E43322A2329100F0B0905040100A6AD060606060606152067696761
                  5E5C54583F363428262707A3AD060606061445421C696969696C6F6969696561
                  57590AA5A7AA0616164641491D6969696A7473716969695E3A0C9F9EA5AB1548
                  4E4D3824606969696B75736D696966450E8F9598A0AE06195156125F68696969
                  6B73736B696966450886929C060606061938223D1F333B395363656969696950
                  210206060606060606194F60604A4737312E1E303C40524C5B21060606060606
                  0606195167707273646E62552C2B2D2535180606060606060606061951676D73
                  6E6969695D1606060606060606060606060606061A5167696969605C565A1606
                  060606060606060606060606061A5167696542161B1706060606060606060606
                  0606060606061A5167611606060606060606060606060606060606060606061A
                  5156160606060606060606060606060606060606060606061A4B220606060606
                  060606060606060606060606060606060616060606060606060606060606}
                OnClick = SpeedButton11Click
              end
              inherited SpeedButton12: TSpeedButton
                Hint = 'Manuten'#231#227'o de Hist'#243'ricos Padr'#245'es de Plano de Contas - [CXG060]'
                Glyph.Data = {
                  56060000424D5606000000000000160400002800000018000000180000000100
                  08000000000040020000120B0000120B0000F8000000F800000000000000FFFF
                  FF000E0C9A001D1C9E005755B900605EBC006C6BC4006E6DC4006E6DC300221D
                  8F006965BB006C69BD007876C5008A87CA009896D1006560B800A5A2D500ACA9
                  D900B1AED900BCB9DF006D64B4007B73B900332274007D70B0008578B400AFA4
                  CA00725C9B009786B500AA9BC0006A5D6B00D1C4D2004D224E00FF00FF00FEFD
                  FE00825F7D00BDA7B800A27E90005E404E00AF8B9700B18B96006F6063006C4D
                  5200723D3C0069343100ECE0DF007E494400AA7F7A00A97E7900896C6900DCC2
                  BF00946C6700AD837D00AE868100B58A810091787200BB8E8200E6D0CA00A67B
                  6D00B48C7F009D685600AF806F00C0938400FEFBFA00FCF9F800B27D6900C08E
                  7900BE928100C3968500CE9F8900C99C8700C5998500BC846700F4E4DC00FBF5
                  F200FBF9F800D5A68B00D2A38A00D9B09A00DBB7A400DCA88700DEAD8E00DDAC
                  8E00DCAB8E00D9A98D00D6A88C00D5A78C00F6EBE400C1896300CD946F00EABF
                  A300FDFAF800FCF9F700E9AD8100F4D7BF00FAE1CC00F9CA9E00FBD4B000FCDC
                  BF00FBE0C700F8DFC900F9EADC00FDF4EC00FECA9600FCC99900FAC89800F9CE
                  A500FAD8B700FFE9D300FFEBD800F9E6D400FEFBF800FBF9F700FFCE9A00FECF
                  9D00FFDCB500FFE1C200FEE3C700FFE7CD00FFEFDE00FFF2E400E9BF8D00FFD1
                  9B00F4CA9A00FFE0BC00FFE6C900F1B97000EEC48E00FFE6C500F3A63900F3B1
                  5500FFF0DA00FFD89C00FFE7C200FFEBCC00FFEBC700FFEFD000FFF1CA00FEF5
                  DD00FFF4D300FFFAEB00FFFDF700FEFDFA00FFFCE400FFFCDC00FFFFF2007F85
                  840096FFFF008FE5E70087F9FF0084C5CA007D92940075B5BF007CA3A90079AA
                  B50076DCF70076D2ED006DD3FB006EA3B800757E820065C1F10067A8CA006A9E
                  BA00708C9B005CB1E6003FAFFF0060A9DF005E829E0069849A00339EFD003B97
                  EC004998E0005B9DD800398BE5005980AC005277A300387ED700407BC5004578
                  BC006F778200496EAA00546C9700FCFDFF00626D84001F53D4003F71FF004174
                  FF004374FF004271FE00043AFF001A4DFF002255FF00345FFF003B62ED003C62
                  EB006586FF007795FF0085A0FF0091AAFF00A1B5FF00D9E1FE000032FF000A3C
                  FF001140FF001034CE001B45F0001C43EA003A62FF00385DE900456CFF005275
                  FF00718CFD00BECBFF00C1CEFF00DDE3FC00002AFF0046539500CDD5FC000025
                  FF000027FF000029FF000022E7002642D5000020FF001F37D200001AFF000F23
                  BE001324BC00A7AFEC000213C4001522B5001827BC0056597C00EAEBF7001923
                  B400060DA8000B119700DDDEF30000009A004040B3004949B5006B6CC6008687
                  D000A1A1D900B7B8E40066667D00C5C5E900D4D4EF00FAFAFD00203434343434
                  343434343434343434343434342202EAE420202F5D616A606069695F71676868
                  686868702602E2C1DDE4202E637C737B7272693B586683717070797A03E1C1BA
                  BEE4202E5E7574737B603925B630475C70838327E5CFBBBEBCE4202E6D6B7574
                  7F3CA6A7A09C9D9132241AE9CFBABEBCDC20202E6D34343434399798A294929B
                  EBEDE1C0B9CDE4E42020202E64766C6B8A4298959E9292ABEDE6C1BACC091F20
                  2020202E5677766C824DA7A1299695A5E2C0B8BDCBAAB42B2020203356657776
                  825D29B69FA0B22816DFBDDCB7A4A8A8E72020356534343434342DB6A09A9493
                  98D70309AFA8A8A8E7202035498C908B8E89634E3A3691999B9CA3ADE7E7B1B1
                  252020374A0110040F19488E8F7C5946321DAEA9A8ACB3B32B20203D8DF1EFF2
                  F20D0A151C38878A84594132F4B3B0252020204413EED5C3C2C6D8F50E0B141B
                  318684725F402A20202020550D0CC6E0D9D6C9D0C5D5EC11EE1734347B572020
                  2020205412EFC7BFC8D9DBDBDACAD1C6E80423847B5720202020204C3FF008EC
                  D4C4CEBCDBDBDADEC3F318887F5720202020204B6EB5F2040510ECC7C6BFC8DA
                  D213188562572020202020535B0101F7F5F1060C11F6D3E35757575757572020
                  202020523F0101010101B5F6F20C0717577E7D8180202020202020505A010101
                  010101010121E81E577E7D8120202020202020505A0101010101010101010156
                  577E7D202020202020202050493E5A5A3F5B5B5B6F6F3E2C5778202020202020
                  2020204F50505051534B4C444546433757202020202020202020}
                OnClick = SpeedButton12Click
              end
              inherited SpeedButton23: TSpeedButton
                Hint = 'Incluir Informa'#231#245'es para Balan'#231'o Gerencial -[CXG067]'
                Glyph.Data = {
                  76050000424D7605000000000000360300002800000018000000180000000100
                  08000000000040020000120B0000120B0000C0000000C0000000FF00FF000A74
                  00000872000007700500008F0000007E0000005B000007800600046C0700086D
                  0B00138F190015AB250014A82800128824001B9A340027B549000279200027AF
                  4B002CB853002BC85E0002692C000982410021955A00007A4900066B4A001191
                  6B001A99780000937D00006A600000887E00046B65000F8C8600016B6900056C
                  690062E0E000005D5F0071FBFF0077FCFF007CF4F8006EF9FF005EF2FF0065F3
                  FF0064EDF8004AEFFF004FE8F90052EDFF003DE6FF003EE9FF004BEAFF004CDB
                  ED0053D9ED005AD5E70067E0EF0066DDEC0025DBFB0027DFFF002CDFFF0033DE
                  FD003AE1FB0043E4FE0000D4FF0000CBF70000CDF70001CFF90002D2FF0005CF
                  FB0006D6FF000CD4FF000FD4FA0014D7FF0015D9FF0016D2F8001AD9FF0024D5
                  F70029C9EB0030D0F0003DC6E4004ACCE5004FC3DA0050C3DB0057CAE00000D1
                  FF0000CCFC0000CDFB0000C8F70000C3F20008CDF9000ECFFC001DC3E80031C4
                  E50033C4E50037C1E1003ABBD90048C3DE0043B4CE004EC0DD004BB8D20000B8
                  E80000B3E60000B2E50000ADDF0004B2E400036983000ABBEE000AAEDE000CB0
                  DF000EB3E10014B0DD0019BAE50018B6E10018B1DD001BB3DD001CB4DF0027BF
                  E60026B7DE0027B7DD0028B3DA0031BADD0034C0E6003BBBE00000ACE00000AC
                  DF0000A9DD0000AADD0000A3D60000A0D500009BCE0001AADD0009ADDE000AA9
                  D8000F9AC7001BADD800199CC6001D9CC60025A1C700269DC40029A2C9002B9F
                  C3002C9EC20032A8CB0036A4C600008FC4000091C400008FC300008FC2000395
                  C7000390C300038CBE000493C5001390BE001ABCF500148CB9001592BF001993
                  BF001C92BD001E94BC00229AC2002192BA002294BC002996BD002A95BC002C98
                  BE000089C2000088C000008AC0000084B8000083B700007DB1000189C100037E
                  B000037CAF000480B3000C81B1000F86B6001088B800228BB400248DB5000079
                  AE000189C3000578AC0000669A0000659900076EA0000066A000006499000062
                  970000609600005E94000A689B00146A9A000560950000000000000000000000
                  00000000B4B4B4B40000000000000000000000000000000000B4B4B4B3A9A7B1
                  B4B4B400000000000000000000000000B4885A4B4947565455617DB400000000
                  00000000000000B4352428302E38484340513C3DB400000000000000000000B6
                  602625292D3B393746425364B40000000000000000000000B4B44E333274834A
                  5881B4B40000000000000000000000000000B4B4A17E7C95B4B4000000000000
                  000000000000000000000000BD7B62BD00000000000000000000000000B4B4B4
                  B4000000BD7B63BD000000B4B4B4B400000000B4B470697979B4B400BD7F63BD
                  00B4B496671B17B4B400B48B5B726E687A7878B4BD8065BDB477761F14080210
                  1DB4B4342A2C3A36443F3EB4BD6B6ABD5F2216060312110115B400B4A0868482
                  9192AE00BD6F6CBD00180907040C0F0D20B70000B40000000000BD00BD7371BD
                  002319130B050A210000000000BC000000BD0000BD7559BD00001C1A0E001E00
                  000000000000BB00BE000000B95C4CB500000000660000000000000000AF9F9D
                  9E9B9A99AC5D4DAA93A8B2A3A2A4A6000000000000B08C8A89879C85AD4F50AB
                  94908F8D8F8EA500000000000000000000000000BA9798B80000000000000000
                  000000000000000000000000B45752B400000000000000000000000000000000
                  000000B4312F4541B4000000000000000000000000000000000000B45E272B6D
                  B400000000000000000000000000000000000000B4B4B4B40000000000000000
                  0000000000000000000000000000000000000000000000000000}
                OnClick = SpeedButton23Click
              end
              inherited SpeedButton24: TSpeedButton
                Hint = 'Copiar Conta - [CXG121]'
                Glyph.Data = {
                  F6060000424DF606000000000000360000002800000018000000180000000100
                  180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF8E5D598E5D598E5D598E5D598E5D
                  598E5D598E5D598E5D598E5D598E5D598E5D598E5D598E5D598E5D59734241FF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF8E5D59FFDEBD
                  FED9B4FFD4ABFFCFA1FFCB9AFEC993FFC58CFFC287FFBF82FFBF81FFBF81FFBF
                  81FFBF81734241FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FF8E5D59FEE3C9FFE0C0FFDAB6FED7ADFED1A5FECE9DFFCA96FFC58FFFC289
                  FFC083FFBF81FFBF81FFBF81734241FF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FF91605AFEEAD7FEE5CCFFE1C2FFDCBAFED7B0FFD3A7FF
                  CF9FFFCA98FFC790FFC48AFFC186FFBF81FFBF81734241FF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF96655CFEEFE1FEEBD9DD903DDD90
                  3DDD903DDD903DDD903DDD903DDD903DDD903DDD903DFFC287FFC082734241FF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9C695EFFF4ED
                  FFF2E3FFEEDCFFE9D3FEE5C9FFDEC0FEDAB7FFD5ADFED1A5FECC9CFFC995FFC5
                  8FFFC488734241FF00FFFF00FF8E5D598E5D598E5D598E5D598E5D598E5D598E
                  5D59A16E60FEFAF6FEF7EFFEF3E7FEEEE0FEEAD5FEE5CCFEE1C2FFDCBAFED7B1
                  FFD3A7FFCF9FFFCB97FFC791734241FF00FFFF00FF8E5D59FFDEBDFED9B4FFD4
                  ABFFCFA1FFCB9AFEC993A97563FEFEFCFEFAF7DD903DDD903DDD903DDD903DDD
                  903DDD903DDD903DDD903DDD903DFFD0A3FFCC9A734241FF00FFFF00FF8E5D59
                  FEE3C9FFE0C0FFDAB6FED7ADFED1A5FECE9DB07B66FEFEFEFEFEFEFEFBF8FFF8
                  F3FEF4EDFEF0E3FEEDDCFEE9D3FEE5C9FEE0C0FFDCB6FFD5ADFFD1A5734241FF
                  00FFFF00FF91605AFEEAD7FEE5CCFFE1C2FFDCBAFED7B0FFD3A7B88269FEFEFE
                  FEFEFEFEFEFEFEFCFBFEFAF6FEF6EEFEF3E7FEEFDEFFEAD5FEE6CCFEE1C4FEDC
                  BAFED8B0734241FF00FFFF00FF96655CFEEFE1FEEBD9DD903DDD903DDD903DDD
                  903DC1896CFEFEFEFEFEFEDD903DDD903DDD903DDD903DDD903DDD903DDD903D
                  DD903DDD903DFEE3C6FFDEBD734241FF00FFFF00FF9C695EFFF4EDFFF2E3FFEE
                  DCFFE9D3FEE5C9FFDEC0C9906EFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
                  FBF8FEFAF3FEF4EDFEF0E5FEEDDCFEE9D3FFE3C9734241FF00FFFF00FFA16E60
                  FEFAF6FEF7EFFEF3E7FEEEE0FEEAD5FEE5CCD09672FEFEFEFEFEFEFEFEFEFEFE
                  FEFEFEFEFEFEFEFEFEFEFEFCFBF2EEEAD1CFCAC1BFBAA6A5A1969292734241FF
                  00FFFF00FFA97563FEFEFCFEFAF7DD903DDD903DDD903DDD903DD79C74FEFEFE
                  FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFBFAFA9C64599C64599C64
                  599D6559A0675BFF00FFFF00FFB07B66FEFEFEFEFEFEFEFBF8FFF8F3FEF4EDFE
                  F0E3DCA175FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
                  A0675BD9995CE79740DC832AA5686BFF00FFFF00FFB88269FEFEFEFEFEFEFEFE
                  FEFEFCFBFEFAF6FEF6EEE1A577FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
                  FEFEFEFEFEFEFEFEA0675BEEB164EB9E43DC832AFF00FFFF00FFFF00FFC1896C
                  FEFEFEFEFEFEDD903DDD903DDD903DDD903DE3A777FEFEFEFEFEFEFEFEFEFEFE
                  FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEA0675BD99F64EB9E43FF00FFFF00FFFF
                  00FFFF00FFC9906EFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEE1A577D1926D
                  D1926DD1926DD1926DD1926DD1926DD1926DD1926DD1926DA0675BD99F64FF00
                  FFFF00FFFF00FFFF00FFFF00FFD09672FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
                  FEFEFEFEFEFEFCFBF2EEEAD1CFCAC1BFBAA6A5A1969292734241FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD79C74FEFEFEFEFEFEFEFE
                  FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFBFAFA9C64599C64599C64599D6559A0
                  675BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDCA175
                  FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEA0675BD999
                  5CE79740DC832AA5686BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFE1A577FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
                  FEFEFEA0675BEEB164EB9E43DC832AFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFE3A777FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
                  FEFEFEFEFEFEFEFEFEFEFEA0675BD99F64EB9E43FF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE1A577D1926DD1926DD192
                  6DD1926DD1926DD1926DD1926DD1926DD1926DA0675BD99F64FF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                OnClick = SpeedButton24Click
              end
              inherited SpeedButton25: TSpeedButton
                Hint = 'Ver registros da lixeira - [CXG019]'
                OnClick = SpeedButton25Click
              end
              inherited SpeedButton26: TSpeedButton
                Visible = False
              end
            end
            inherited GroupBox2: TGroupBox
              Height = 402
              ExplicitHeight = 402
              inherited ScrollBox2: TScrollBox
                Height = 385
                ExplicitHeight = 385
              end
            end
          end
        end
        inherited tsMemo: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 783
          ExplicitHeight = 536
        end
      end
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 571
    ExplicitTop = 571
  end
  inherited pnStatusProcessamento: TPanel
    inherited lbTextoProcessamento: TLabel
      Width = 477
      Height = 21
    end
  end
  inherited PopupMenu1: TPopupMenu
    Left = 569
    Top = 65530
  end
  inherited PopupMenu2: TPopupMenu
    Left = 542
    Top = 65531
  end
  inherited Timer1: TTimer
    Left = 510
    Top = 65531
  end
  inherited ApplicationEventsPadrao: TApplicationEvents
    Left = 478
    Top = 65531
  end
end
