inherited frmCadPedidoCompraClienteNfe: TfrmCadPedidoCompraClienteNfe
  Caption = 'Pedido de Compra Cliente (NFe)'
  ClientHeight = 533
  ClientWidth = 861
  ExplicitWidth = 869
  ExplicitHeight = 567
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelFundo: TPanel
    Width = 861
    Height = 514
    ExplicitWidth = 861
    inherited Splitter2: TSplitter
      Height = 512
    end
    inherited PanelLeft: TPanel
      Width = 856
      Height = 512
      ExplicitWidth = 856
      inherited PageControl1: TPageControl
        Width = 854
        Height = 510
        ActivePage = TabSheet1
        ExplicitWidth = 854
        inherited TabSheet1: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 846
          ExplicitHeight = 510
          inherited ScrollBox1: TScrollBox
            Width = 846
            Height = 479
            ExplicitWidth = 846
            inherited PageControl3: TPageControl
              Width = 846
              Height = 431
              ActivePage = tsCadastro
              ExplicitWidth = 846
              inherited TabSheet3: TTabSheet
                ExplicitLeft = 4
                ExplicitTop = 27
                ExplicitWidth = 838
                ExplicitHeight = 431
                inherited ScrollBox3: TScrollBox
                  Width = 838
                  Height = 400
                  ExplicitWidth = 838
                  inherited GroupBox1: TGroupBox
                    Width = 834
                    ExplicitWidth = 834
                  end
                end
              end
              object tsCadastro: TTabSheet
                Caption = 'tsCadastro'
                ImageIndex = 1
                ExplicitHeight = 431
                object ScrollBox4: TScrollBox
                  Left = 0
                  Top = 0
                  Width = 838
                  Height = 398
                  Align = alTop
                  BevelInner = bvNone
                  BevelOuter = bvNone
                  BorderStyle = bsNone
                  Ctl3D = True
                  ParentCtl3D = False
                  TabOrder = 0
                  object GroupBox4: TGroupBox
                    AlignWithMargins = True
                    Left = 0
                    Top = 0
                    Width = 838
                    Height = 169
                    Margins.Left = 0
                    Margins.Top = 0
                    Margins.Right = 0
                    Align = alTop
                    Caption = 'Pedido Compra Cliente (NFe)'
                    TabOrder = 0
                    ExplicitLeft = -3
                    ExplicitTop = -6
                    object Label6: TLabel
                      Left = 74
                      Top = 43
                      Width = 37
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'C'#243'digo:'
                    end
                    object Label7: TLabel
                      Left = 20
                      Top = 75
                      Width = 91
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'N'#186' Pedido Compra:'
                    end
                    object Label8: TLabel
                      Left = 9
                      Top = 107
                      Width = 102
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Data Pedido Compra:'
                    end
                    object Label9: TLabel
                      Left = 52
                      Top = 139
                      Width = 59
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Cod Cliente:'
                    end
                    object DBEdit1: TDBEdit
                      Left = 117
                      Top = 40
                      Width = 92
                      Height = 21
                      DataField = 'CODIGO'
                      DataSource = DtmClientes.dsPedidoCompraCl
                      Enabled = False
                      TabOrder = 0
                    end
                    object DBEdit2: TDBEdit
                      Left = 117
                      Top = 72
                      Width = 92
                      Height = 21
                      DataField = 'NUM_PEDIDO'
                      DataSource = DtmClientes.dsPedidoCompraCl
                      TabOrder = 1
                    end
                    object DBEdit3: TDBEdit
                      Left = 117
                      Top = 104
                      Width = 92
                      Height = 21
                      DataField = 'DATA_PEDIDO'
                      DataSource = DtmClientes.dsPedidoCompraCl
                      TabOrder = 2
                    end
                    object DBEdit4: TDBEdit
                      Left = 117
                      Top = 136
                      Width = 60
                      Height = 21
                      DataField = 'COD_CLIENTE'
                      DataSource = DtmClientes.dsPedidoCompraCl
                      TabOrder = 3
                      OnExit = DBEdit4Exit
                      OnKeyDown = DBEdit4KeyDown
                    end
                    object DBLookupComboBox1: TDBLookupComboBox
                      Left = 183
                      Top = 136
                      Width = 370
                      Height = 21
                      DataField = 'COD_CLIENTE'
                      DataSource = DtmClientes.dsPedidoCompraCl
                      KeyField = 'COD_CLIENTE'
                      ListField = 'NOME_CLIENTE'
                      ListSource = DtmClientes.dsConsClientePed
                      TabOrder = 4
                    end
                  end
                  object GroupBox6: TGroupBox
                    AlignWithMargins = True
                    Left = 0
                    Top = 175
                    Width = 838
                    Height = 220
                    Margins.Left = 0
                    Margins.Right = 0
                    Margins.Bottom = 0
                    Align = alTop
                    TabOrder = 1
                    ExplicitLeft = -3
                    ExplicitTop = 172
                    object PageControl2: TPageControl
                      Left = 2
                      Top = 15
                      Width = 834
                      Height = 203
                      ActivePage = tsProdutosCtrCad
                      Align = alClient
                      Style = tsFlatButtons
                      TabOrder = 0
                      ExplicitLeft = 1
                      ExplicitTop = 14
                      ExplicitWidth = 836
                      ExplicitHeight = 193
                      object tsProdutosCtrCons: TTabSheet
                        Caption = 'Produtos'
                        ImageIndex = 3
                        ExplicitHeight = 160
                        object DBGridProdCtr: TDBGrid
                          Left = 0
                          Top = 0
                          Width = 826
                          Height = 126
                          Align = alClient
                          DataSource = DtmClientes.dsPedidoCompraClItens
                          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                          TabOrder = 0
                          TitleFont.Charset = DEFAULT_CHARSET
                          TitleFont.Color = clWindowText
                          TitleFont.Height = -11
                          TitleFont.Name = 'Tahoma'
                          TitleFont.Style = []
                          OnKeyDown = DBGridProdCtrKeyDown
                          Columns = <
                            item
                              Expanded = False
                              FieldName = 'GRUPO_PROD'
                              Width = 60
                              Visible = True
                            end
                            item
                              Expanded = False
                              FieldName = 'COD_PROD'
                              Visible = True
                            end
                            item
                              Expanded = False
                              FieldName = 'COD_GRADE'
                              Width = 55
                              Visible = True
                            end
                            item
                              Expanded = False
                              FieldName = 'NUM_FAB_PROD'
                              Visible = True
                            end
                            item
                              Expanded = False
                              FieldName = 'DESCR_PROD'
                              Width = 369
                              Visible = True
                            end
                            item
                              Expanded = False
                              FieldName = 'QUANT'
                              Title.Caption = 'Qtde'
                              Visible = True
                            end
                            item
                              Expanded = False
                              FieldName = 'VALOR'
                              Visible = True
                            end
                            item
                              Expanded = False
                              FieldName = 'VALOR_TOT'
                              Visible = True
                            end>
                        end
                        object Panel11: TPanel
                          Left = 0
                          Top = 126
                          Width = 826
                          Height = 46
                          Align = alBottom
                          BevelKind = bkTile
                          BevelOuter = bvNone
                          TabOrder = 1
                          ExplicitLeft = -9
                          ExplicitTop = 123
                          object BitBtnProdIncluir: TBitBtn
                            Left = 292
                            Top = 8
                            Width = 75
                            Height = 25
                            Hint = 'Incluir - [BAS547]'
                            Caption = 'Incluir'
                            Font.Charset = ANSI_CHARSET
                            Font.Color = clWindowText
                            Font.Height = -11
                            Font.Name = 'MS Sans Serif'
                            Font.Style = [fsBold]
                            ParentFont = False
                            TabOrder = 0
                            OnClick = BitBtnProdIncluirClick
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
                          object BitBtnProdAlterar: TBitBtn
                            Left = 373
                            Top = 8
                            Width = 75
                            Height = 25
                            Hint = 'Alterar - [BAS548]'
                            Caption = 'Alterar'
                            Font.Charset = ANSI_CHARSET
                            Font.Color = clWindowText
                            Font.Height = -11
                            Font.Name = 'MS Sans Serif'
                            Font.Style = [fsBold]
                            ParentFont = False
                            TabOrder = 1
                            OnClick = BitBtnProdAlterarClick
                            Glyph.Data = {
                              6E030000424D6E030000000000006E0200002800000010000000100000000100
                              08000000000000010000120B0000120B00008E0000008E00000000000000FFFF
                              FF00FF00FF0062555D00745D65006B5D62008C6D7300A4676900A0656700925C
                              5E00764C4E007D525400633B3C0081535400865151008E575700865252008753
                              5300B6757500B4767600B8797900B2757500B07474008A5B5B0097666600CA8B
                              8B00CE8F8F00CF909000CC8E8E00EFAAA900E2A1A100E1A1A100E6A6A600302D
                              2D007E444200875958008C5E5D00DD908C00E9A4A1009E5D5800D8C2C000DCC7
                              C500955F5600A0675B00A56B5F005B3D37005E3F3900A7756B00583C35005C3F
                              3800DAC1BA00C1836C00BC826800CFB5AA00F8F2EF00D7C1B500FBF4F000FAF3
                              EF00D1926D00F7F2EF00DA9D7500E1CEC000FEF7F200FBF4EF00E7AB7900FAEF
                              E600EBDCCE00FAEFE500D1914F00F8EADC00FAF0E600FEF7F000FCF6F000EEDD
                              CA00DCC1A000F6E0C6009C8F8000F7E5CF00F8EADA00FCF6EF00DCB27A00DCB5
                              8100C2A07400AD926F00917B5E0086725800BFA4800099846800C4AA8900F0D8
                              BA00FFF4E500E9BD7F00E7BC7E00E2B87E00D1AB7400B5976C009A815D00A78C
                              6600CFAF82007D6B51007A695000FEEFDA004B474100F0E5D500FCF3E600FCF7
                              F000E9BF7D00EFC48100CEAA7300FCEACE00FFFEFC00FFFBF000FFFEFB00FFFE
                              F700FFFFFC008F9F9D003745460006BBF0000C98BD00068FC1001E799F002D84
                              A70022576C000393DE00036292000D4663000B3B5400165E820021252700008E
                              DE000263BF003E4145001031D3000320BA000318B200000F95002F45ED000C19
                              B400010B9900010A95002732D000000081000202020202020202020202020202
                              020207070707070707070707070707020202076D594A585662515D5C5B6B0702
                              02022B654B218074575352505C6B070202022B5A4D4C7D7C7E66545F5E6A0702
                              02022F6F45497A7F040B2E55616C080202022F72464E730325140F2D63600902
                              020234013E416705261B151130640D02020234016E484142241E1A1310310A02
                              02023A01016E47433D231F1C160E0C0202023A0101016E694337172019122283
                              02023C010101016E4F6835181D06787676023C01010101017071322A27797581
                              878D4001010101010101292C44777B85868A40383F3939363B3B282C33028288
                              848B403A3A3A3A3A3A3A3A2C0202028C8902}
                          end
                          object BitBtnProdExcluir: TBitBtn
                            Left = 454
                            Top = 8
                            Width = 75
                            Height = 25
                            Hint = 'Apagar - [BAS549]'
                            Caption = 'Apagar'
                            Font.Charset = ANSI_CHARSET
                            Font.Color = clWindowText
                            Font.Height = -11
                            Font.Name = 'MS Sans Serif'
                            Font.Style = [fsBold]
                            ParentFont = False
                            TabOrder = 2
                            OnClick = BitBtnProdExcluirClick
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
                      object tsProdutosCtrCad: TTabSheet
                        Caption = 'Produtos Cad'
                        ImageIndex = 1
                        ExplicitWidth = 828
                        ExplicitHeight = 162
                        object pnCadProdutosCtr: TPanel
                          Left = 0
                          Top = 0
                          Width = 826
                          Height = 172
                          Align = alClient
                          BevelOuter = bvNone
                          TabOrder = 0
                          OnEnter = pnCadProdutosCtrEnter
                          ExplicitWidth = 828
                          ExplicitHeight = 162
                          object Panel4: TPanel
                            Left = 0
                            Top = 0
                            Width = 826
                            Height = 126
                            Align = alClient
                            BevelOuter = bvNone
                            TabOrder = 0
                            object Label18: TLabel
                              Left = 34
                              Top = 14
                              Width = 71
                              Height = 13
                              Alignment = taRightJustify
                              Caption = 'Num Fab Prod:'
                            end
                            object Label19: TLabel
                              Left = 240
                              Top = 14
                              Width = 55
                              Height = 13
                              Alignment = taRightJustify
                              Caption = 'Cod Grade:'
                            end
                            object Label20: TLabel
                              Left = 60
                              Top = 42
                              Width = 45
                              Height = 13
                              Alignment = taRightJustify
                              Caption = 'Decri'#231#227'o:'
                            end
                            object Label21: TLabel
                              Left = 45
                              Top = 68
                              Width = 60
                              Height = 13
                              Alignment = taRightJustify
                              Caption = 'Quantidade:'
                            end
                            object Label22: TLabel
                              Left = 227
                              Top = 68
                              Width = 68
                              Height = 13
                              Alignment = taRightJustify
                              Caption = 'Valor Unit'#225'rio:'
                            end
                            object Label23: TLabel
                              Left = 395
                              Top = 14
                              Width = 33
                              Height = 13
                              Alignment = taRightJustify
                              Caption = 'Grupo:'
                            end
                            object Label24: TLabel
                              Left = 487
                              Top = 14
                              Width = 48
                              Height = 13
                              Alignment = taRightJustify
                              Caption = 'Cod Prod:'
                            end
                            object Label25: TLabel
                              Left = 480
                              Top = 68
                              Width = 55
                              Height = 13
                              Alignment = taRightJustify
                              Caption = 'Valor Total:'
                            end
                            object Label10: TLabel
                              Left = 8
                              Top = 89
                              Width = 97
                              Height = 26
                              Alignment = taRightJustify
                              Caption = 'N'#250'mero Item Pedido de Compra (NFe):'
                              WordWrap = True
                            end
                            object lbNotasPedido: TLabel
                              Left = 625
                              Top = 19
                              Width = 60
                              Height = 13
                              Caption = 'Notas fiscais'
                            end
                            object DBEdit5: TDBEdit
                              Left = 301
                              Top = 11
                              Width = 74
                              Height = 21
                              Color = cl3DLight
                              DataField = 'COD_GRADE'
                              DataSource = DtmClientes.dsPedidoCompraClItens
                              Enabled = False
                              TabOrder = 1
                            end
                            object DBEdit6: TDBEdit
                              Left = 434
                              Top = 11
                              Width = 47
                              Height = 21
                              Color = cl3DLight
                              DataField = 'GRUPO_PROD'
                              DataSource = DtmClientes.dsPedidoCompraClItens
                              Enabled = False
                              TabOrder = 2
                            end
                            object DBEdit7: TDBEdit
                              Left = 541
                              Top = 11
                              Width = 78
                              Height = 21
                              Color = cl3DLight
                              DataField = 'COD_PROD'
                              DataSource = DtmClientes.dsPedidoCompraClItens
                              Enabled = False
                              TabOrder = 3
                            end
                            object DBEdit8: TDBEdit
                              Left = 114
                              Top = 66
                              Width = 78
                              Height = 21
                              DataField = 'QUANT'
                              DataSource = DtmClientes.dsPedidoCompraClItens
                              TabOrder = 5
                              OnExit = DBEdit8Exit
                            end
                            object DBEdit9: TDBEdit
                              Left = 301
                              Top = 66
                              Width = 78
                              Height = 21
                              DataField = 'VALOR'
                              DataSource = DtmClientes.dsPedidoCompraClItens
                              TabOrder = 6
                              OnExit = DBEdit9Exit
                            end
                            object DBEdit10: TDBEdit
                              Left = 111
                              Top = 12
                              Width = 111
                              Height = 21
                              DataField = 'NUM_FAB_PROD'
                              DataSource = DtmClientes.dsPedidoCompraClItens
                              TabOrder = 0
                              OnExit = DBEdit10Exit
                              OnKeyDown = DBEdit10KeyDown
                            end
                            object DBEdit11: TDBEdit
                              Left = 541
                              Top = 66
                              Width = 78
                              Height = 21
                              Color = cl3DLight
                              DataField = 'VALOR_TOT'
                              DataSource = DtmClientes.dsPedidoCompraClItens
                              Enabled = False
                              TabOrder = 7
                            end
                            object DBEdit12: TDBEdit
                              Left = 114
                              Top = 39
                              Width = 505
                              Height = 21
                              Color = cl3DLight
                              DataField = 'DESCR_PROD'
                              DataSource = DtmClientes.dsPedidoCompraClItens
                              Enabled = False
                              TabOrder = 4
                            end
                            object DBEdit13: TDBEdit
                              Left = 114
                              Top = 93
                              Width = 78
                              Height = 21
                              DataField = 'NITEM_NFE'
                              DataSource = DtmClientes.dsPedidoCompraClItens
                              TabOrder = 8
                              OnExit = DBEdit8Exit
                            end
                            object lbxNotasPedido: TListBox
                              Left = 625
                              Top = 38
                              Width = 195
                              Height = 77
                              Style = lbOwnerDrawFixed
                              Color = clBtnFace
                              Ctl3D = False
                              ItemHeight = 16
                              ParentCtl3D = False
                              TabOrder = 9
                            end
                          end
                          object Panel18: TPanel
                            Left = 0
                            Top = 126
                            Width = 826
                            Height = 46
                            Align = alBottom
                            BevelKind = bkTile
                            BevelOuter = bvNone
                            TabOrder = 1
                            ExplicitTop = 114
                            object BitBtnProdOK: TBitBtn
                              Left = 333
                              Top = 8
                              Width = 75
                              Height = 25
                              Hint = 'OK - [BAS550]'
                              Caption = 'OK'
                              TabOrder = 0
                              OnClick = BitBtnProdOKClick
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
                            object BitBtnProdCancel: TBitBtn
                              Left = 414
                              Top = 8
                              Width = 75
                              Height = 25
                              Hint = 'Cancelar'
                              Caption = 'Cancela'
                              TabOrder = 1
                              OnClick = BitBtnProdCancelClick
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
            inherited Panel3: TPanel
              Top = 431
              Width = 846
              ExplicitWidth = 846
              inherited BitBtn4: TBitBtn
                Left = 343
                Top = 10
                Hint = 'OK - [BAS546]'
                ExplicitLeft = 343
                ExplicitTop = 10
              end
              inherited BitBtn5: TBitBtn
                Left = 424
                Top = 10
                ExplicitLeft = 424
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
          ExplicitWidth = 846
          ExplicitHeight = 510
          inherited GroupBox3: TGroupBox
            Width = 846
            ExplicitWidth = 846
            inherited imgInformation: TImage
              Left = 820
              ExplicitLeft = 820
            end
            inherited BitBtn1: TBitBtn
              Hint = 'Clique para pesquisar - [BAS542]'
            end
            inherited BitBtn3: TBitBtn
              Hint = 'Novo cadastro - [BAS543]'
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
            Width = 846
            Height = 406
            ExplicitWidth = 846
            inherited Splitter1: TSplitter
              Height = 345
            end
            inherited DBGrid1: TDBGrid
              Width = 553
              Height = 345
              OnKeyDown = DBGrid1KeyDown
            end
            inherited Panel2: TPanel
              Width = 842
              ExplicitWidth = 842
              inherited SpeedButton1: TSpeedButton
                Hint = 'Editar Registro - [BAS544]'
              end
              inherited SpeedButton2: TSpeedButton
                Hint = 'Apagar Registro - [BAS545]'
                OnClick = SpeedButton2Click
              end
              inherited SpeedButton3: TSpeedButton
                Enabled = False
                Visible = False
              end
              inherited SpeedButton4: TSpeedButton
                Enabled = False
                Visible = False
              end
              inherited SpeedButton5: TSpeedButton
                Enabled = False
                Visible = False
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
                Enabled = False
                Visible = False
              end
              inherited SpeedButton26: TSpeedButton
                Flat = False
                Visible = False
              end
            end
            inherited GroupBox2: TGroupBox
              Height = 345
              inherited ScrollBox2: TScrollBox
                Height = 328
              end
            end
          end
        end
        inherited tsMemo: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 846
          ExplicitHeight = 510
        end
        object tsSelecionaGradeProd: TTabSheet
          Caption = 'tsSelecionaGradeProd'
          ImageIndex = 3
          ExplicitHeight = 510
          object ScrollBox5: TScrollBox
            Left = 0
            Top = 0
            Width = 846
            Height = 479
            Align = alClient
            TabOrder = 0
            ExplicitHeight = 510
            object pnSelecionaGradeProd: TPanel
              Left = 1
              Top = 0
              Width = 782
              Height = 366
              TabOrder = 0
              object GroupBox7: TGroupBox
                Left = 1
                Top = 1
                Width = 780
                Height = 321
                Align = alTop
                TabOrder = 0
                object Panel19: TPanel
                  Left = 2
                  Top = 15
                  Width = 776
                  Height = 41
                  Align = alTop
                  BevelOuter = bvNone
                  TabOrder = 0
                  object Label201: TLabel
                    Left = 8
                    Top = 24
                    Width = 40
                    Height = 13
                    Caption = 'Grupo: '
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object Label202: TLabel
                    Left = 135
                    Top = 24
                    Width = 44
                    Height = 13
                    Caption = 'C'#243'digo: '
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object Label38: TLabel
                    Left = 40
                    Top = 1
                    Width = 44
                    Height = 13
                    Caption = 'Label38'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlue
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object Label39: TLabel
                    Left = 54
                    Top = 24
                    Width = 44
                    Height = 13
                    Caption = 'Label39'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlue
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object Label40: TLabel
                    Left = 187
                    Top = 23
                    Width = 44
                    Height = 13
                    Caption = 'Label40'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlue
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                end
                object Panel20: TPanel
                  Left = 2
                  Top = 56
                  Width = 776
                  Height = 263
                  Align = alClient
                  Caption = 'Panel6'
                  TabOrder = 1
                  object DBGrid3: TDBGrid
                    Left = 1
                    Top = 1
                    Width = 774
                    Height = 261
                    Align = alClient
                    DataSource = dsSelecionaGradeProd
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                    TabOrder = 0
                    TitleFont.Charset = DEFAULT_CHARSET
                    TitleFont.Color = clWindowText
                    TitleFont.Height = -11
                    TitleFont.Name = 'MS Sans Serif'
                    TitleFont.Style = [fsBold]
                    OnDblClick = DBGrid3DblClick
                    OnKeyDown = DBGrid3KeyDown
                  end
                end
              end
              object BitBtn11: TBitBtn
                Left = 348
                Top = 334
                Width = 88
                Height = 25
                Caption = '&Assume'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 1
                OnClick = BitBtn11Click
                Glyph.Data = {
                  D2020000424DD202000000000000D20100002800000010000000100000000100
                  08000000000000010000120B0000120B0000670000006700000000000000FFFF
                  FF00FF00FF00A4676900A6696B00A6696A007B16000079140000A7756B007D18
                  00007F1A0000AC6C5A00A46A5A00FBF4F200821F0000811E0000811F00008929
                  07008A2A080099411E00BC826800C9937900E7D0C400FEFCFB00AB5B3000BB76
                  5000BF7D5900D1926D00C67F4E00DA9D7500D1864900E7AB7900D8A57B00D8A3
                  7300E6BD9900F6E9DD00D1965A00D59D6600FEFBF800DCA16200E9C49D00D4BC
                  A000F7EEE300EAB66C00EBBB7600EDC18000EFC68A00F0CC9600F0CB9700F3D3
                  A400F6DDBA00F8E7CE00F8E7CF00FAEEDC00EEC48400F3D7AB00F6E1C000FBF2
                  E200FCF7EE00FEFAF300FCDD9F00FAEDD400FBF4E700FFEAB5002D6718002A70
                  270001550300005D0300017707000266060002600500036E0700036C07000363
                  070004780A0003600700015A0600058C0D0005840C0005700B00099613000875
                  11000C881600067F140015A52800149A26001A922F0022B63E001C96310027BB
                  45002CC5580030BD570041E07500FCFFFF000F30F8000F30F7007486E700001E
                  FF000F2EF3000F2FF300727FD700707BCE006E75BF0002020202020202020204
                  0404040404040202020202020202020431302E2D2C0402020202020202020208
                  32656266360402020202020202020214335F61632F040202020202020202021B
                  39605E6437040202020202020202021D3B3E353438040202020202020202021F
                  01263A05050B0303030303030303021F010117051C020328202125242B03021F
                  1B1B410502020319090E100F27030202024C5A5802020823120A06183C030202
                  435B5C5751021401150711223F0302405356595552491B010D131A3D29030202
                  0242544F02021D0101162A03030C0202024B504802021F0101015D031E020202
                  474A4D4602021F1B1B1B1B0302024545444E45020202}
              end
            end
          end
        end
      end
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 514
    Width = 861
    ExplicitWidth = 861
  end
  inherited pnStatusProcessamento: TPanel
    inherited lbTextoProcessamento: TLabel
      Width = 477
      Height = 21
    end
  end
  inherited PopupMenu2: TPopupMenu
    Top = 75
  end
  inherited Timer1: TTimer
    Top = 75
  end
  inherited ApplicationEventsPadrao: TApplicationEvents
    Top = 75
  end
  object dsSelecionaGradeProd: TDataSource
    Left = 632
    Top = 80
  end
end
