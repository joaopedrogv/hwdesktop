inherited frmCadConfigAPI: TfrmCadConfigAPI
  Caption = 'Configurar API'
  ClientHeight = 581
  ClientWidth = 827
  ExplicitWidth = 843
  ExplicitHeight = 620
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelFundo: TPanel
    Width = 827
    Height = 562
    ExplicitWidth = 827
    ExplicitHeight = 562
    inherited Splitter2: TSplitter
      Height = 560
      ExplicitHeight = 560
    end
    inherited PanelLeft: TPanel
      Width = 822
      Height = 560
      ExplicitWidth = 822
      ExplicitHeight = 560
      inherited PageControl1: TPageControl
        Width = 820
        Height = 558
        ExplicitWidth = 820
        ExplicitHeight = 558
        inherited TabSheet1: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 812
          ExplicitHeight = 527
          inherited ScrollBox1: TScrollBox
            Width = 812
            Height = 527
            ExplicitWidth = 812
            ExplicitHeight = 527
            inherited PageControl3: TPageControl
              Width = 812
              Height = 479
              ActivePage = tsCadastro
              ExplicitWidth = 812
              ExplicitHeight = 479
              inherited TabSheet3: TTabSheet
                ExplicitLeft = 4
                ExplicitTop = 27
                ExplicitWidth = 804
                ExplicitHeight = 448
                inherited ScrollBox3: TScrollBox
                  Width = 804
                  Height = 448
                  ExplicitWidth = 804
                  ExplicitHeight = 448
                  inherited GroupBox1: TGroupBox
                    Width = 800
                    ExplicitWidth = 800
                  end
                end
              end
              object tsCadastro: TTabSheet
                Caption = 'tsCadastro'
                ImageIndex = 1
                object PageControl2: TPageControl
                  Left = 0
                  Top = 0
                  Width = 804
                  Height = 448
                  ActivePage = TabSheetHwCloudIA
                  Align = alClient
                  Style = tsFlatButtons
                  TabOrder = 0
                  object TabSheetTrayEC: TTabSheet
                    Caption = 'API Tray (E-Commerce)'
                    object GroupBox4: TGroupBox
                      Left = 0
                      Top = 0
                      Width = 796
                      Height = 417
                      Align = alClient
                      Caption = 'API Tray (E-Commerce)'
                      TabOrder = 0
                      object Panel4: TPanel
                        Left = 2
                        Top = 15
                        Width = 792
                        Height = 234
                        Align = alTop
                        BevelOuter = bvNone
                        TabOrder = 0
                        object Label6: TLabel
                          Left = 87
                          Top = 17
                          Width = 17
                          Height = 13
                          Alignment = taRightJustify
                          Caption = 'Url:'
                          FocusControl = DBEditUrlTray
                        end
                        object Label7: TLabel
                          Left = 32
                          Top = 45
                          Width = 72
                          Height = 13
                          Caption = 'Consumer key:'
                          FocusControl = DBEditConsumerKeyTray
                        end
                        object Label8: TLabel
                          Left = 19
                          Top = 72
                          Width = 85
                          Height = 13
                          Caption = 'Consumer secret:'
                          FocusControl = DBEditConsumerSecretTray
                        end
                        object Label9: TLabel
                          Left = 15
                          Top = 99
                          Width = 89
                          Height = 13
                          Caption = 'Code autorization:'
                          FocusControl = DBEditCodeAutorizationTray
                        end
                        object Label10: TLabel
                          Left = 31
                          Top = 126
                          Width = 73
                          Height = 13
                          Alignment = taRightJustify
                          Caption = 'Tipo de cliente:'
                        end
                        object Label11: TLabel
                          Left = 10
                          Top = 181
                          Width = 94
                          Height = 13
                          Caption = 'Tipo venda padrao:'
                        end
                        object Label13: TLabel
                          Left = 23
                          Top = 208
                          Width = 81
                          Height = 13
                          Alignment = taRightJustify
                          Caption = 'Tabela de preco:'
                        end
                        object Label14: TLabel
                          Left = 54
                          Top = 154
                          Width = 50
                          Height = 13
                          Alignment = taRightJustify
                          Caption = 'Vendedor:'
                        end
                        object DBEditUrlTray: TDBEdit
                          Left = 110
                          Top = 14
                          Width = 646
                          Height = 21
                          DataField = 'URL_API'
                          DataSource = dtmConfig.dsConfigAPI
                          TabOrder = 0
                        end
                        object DBEditConsumerKeyTray: TDBEdit
                          Left = 110
                          Top = 42
                          Width = 646
                          Height = 21
                          DataField = 'CONSUMER_KEY'
                          DataSource = dtmConfig.dsConfigAPI
                          TabOrder = 1
                        end
                        object DBEditConsumerSecretTray: TDBEdit
                          Left = 110
                          Top = 69
                          Width = 646
                          Height = 21
                          DataField = 'CONSUMER_SECRET'
                          DataSource = dtmConfig.dsConfigAPI
                          TabOrder = 2
                        end
                        object DBEditCodeAutorizationTray: TDBEdit
                          Left = 110
                          Top = 96
                          Width = 646
                          Height = 21
                          DataField = 'CODE_AUTORIZATION'
                          DataSource = dtmConfig.dsConfigAPI
                          TabOrder = 3
                        end
                        object EditHwTabelaPrecoTray: TEditHw
                          Left = 110
                          Top = 205
                          Width = 63
                          Height = 21
                          TabOrder = 9
                          Text = '                 0'
                          OnExit = EditHwTabelaPrecoTrayExit
                          OnKeyDown = EditHwTabelaPrecoTrayKeyDown
                          Formato = fInteger
                          FormatSize = '0.2'
                        end
                        object DBLookupComboBoxTabelaPrecoTray: TDBLookupComboBox
                          Left = 174
                          Top = 205
                          Width = 582
                          Height = 21
                          KeyField = 'COD_PROMOCAO'
                          ListField = 'DESCR_PROMOCAO'
                          ListSource = dtmConfig.dsConfigAPItabela
                          TabOrder = 10
                          OnExit = DBLookupComboBoxTabelaPrecoTrayExit
                        end
                        object EditHwTipoClienteTray: TEditHw
                          Left = 110
                          Top = 123
                          Width = 63
                          Height = 21
                          TabOrder = 4
                          Text = '                 0'
                          OnExit = EditHwTipoClienteTrayExit
                          OnKeyDown = EditHwTipoClienteTrayKeyDown
                          Formato = fInteger
                          FormatSize = '0.2'
                        end
                        object DBLookupComboBoxTipoClienteTray: TDBLookupComboBox
                          Left = 174
                          Top = 123
                          Width = 582
                          Height = 21
                          KeyField = 'CODIGO_TIPO'
                          ListField = 'DESCRICAO_TIPO'
                          ListSource = dtmConfig.dsConfigAPItipocliente
                          TabOrder = 5
                          OnExit = DBLookupComboBoxTipoClienteTrayExit
                        end
                        object EditHwVendedorTray: TEditHw
                          Left = 110
                          Top = 151
                          Width = 63
                          Height = 21
                          TabOrder = 6
                          Text = '                 0'
                          OnExit = EditHwVendedorTrayExit
                          OnKeyDown = EditHwVendedorTrayKeyDown
                          Formato = fInteger
                          FormatSize = '0.2'
                        end
                        object DBLookupComboBoxVendedorTray: TDBLookupComboBox
                          Left = 174
                          Top = 151
                          Width = 582
                          Height = 21
                          KeyField = 'COD_VENDEDOR'
                          ListField = 'NOME_VENDEDOR'
                          ListSource = dtmConfig.dsConfigAPIvendedor
                          TabOrder = 7
                          OnExit = DBLookupComboBoxVendedorTrayExit
                        end
                        object DBComboBoxTipoVendaPadraoREQTray: TDBComboBox
                          Left = 110
                          Top = 178
                          Width = 106
                          Height = 21
                          Style = csDropDownList
                          DataField = 'TIPO_VENDA'
                          DataSource = dtmConfig.dsConfigAPI
                          ItemHeight = 13
                          TabOrder = 8
                          OnExit = DBComboBoxUsarAPICogHwCloudIAExit
                        end
                      end
                      object GroupBox6: TGroupBox
                        Left = 2
                        Top = 249
                        Width = 792
                        Height = 166
                        Align = alClient
                        Caption = 'Tabelas de Pre'#231'o'
                        TabOrder = 1
                        object Panel97: TPanel
                          Left = 113
                          Top = 15
                          Width = 677
                          Height = 149
                          Align = alClient
                          BevelOuter = bvNone
                          TabOrder = 0
                          object Splitter3: TSplitter
                            Left = 324
                            Top = 0
                            Height = 149
                            ExplicitLeft = 320
                            ExplicitTop = 16
                            ExplicitHeight = 100
                          end
                          object Panel102: TPanel
                            Left = 0
                            Top = 0
                            Width = 324
                            Height = 149
                            Align = alLeft
                            BevelOuter = bvNone
                            Padding.Right = 3
                            Padding.Bottom = 6
                            TabOrder = 0
                            object TreeViewPromocaoTray: TTreeView
                              Left = 0
                              Top = 40
                              Width = 321
                              Height = 103
                              Align = alClient
                              Indent = 19
                              TabOrder = 0
                              OnDblClick = TreeViewPromocaoTrayDblClick
                            end
                            object Panel104: TPanel
                              Left = 0
                              Top = 25
                              Width = 321
                              Height = 15
                              Align = alTop
                              BevelKind = bkTile
                              BevelOuter = bvNone
                              Caption = 'Duplo clique para adicionar'
                              TabOrder = 1
                            end
                            object Panel7: TPanel
                              Left = 0
                              Top = 0
                              Width = 321
                              Height = 25
                              Align = alTop
                              BevelKind = bkTile
                              BevelOuter = bvNone
                              Caption = 'Todas'
                              Font.Charset = DEFAULT_CHARSET
                              Font.Color = clWindowText
                              Font.Height = -11
                              Font.Name = 'Tahoma'
                              Font.Style = [fsBold]
                              ParentFont = False
                              TabOrder = 2
                            end
                          end
                          object Panel105: TPanel
                            Left = 327
                            Top = 0
                            Width = 350
                            Height = 149
                            Align = alClient
                            BevelOuter = bvNone
                            Padding.Left = 3
                            Padding.Bottom = 6
                            TabOrder = 1
                            object TreeViewPromocaoTray_DB: TTreeView
                              Left = 3
                              Top = 40
                              Width = 347
                              Height = 103
                              Align = alClient
                              Indent = 19
                              TabOrder = 0
                              OnDblClick = TreeViewPromocaoTray_DBDblClick
                            end
                            object Panel106: TPanel
                              Left = 3
                              Top = 25
                              Width = 347
                              Height = 15
                              Align = alTop
                              BevelKind = bkTile
                              BevelOuter = bvNone
                              Caption = 'Duplo clique para remover'
                              TabOrder = 1
                            end
                            object Panel8: TPanel
                              Left = 3
                              Top = 0
                              Width = 347
                              Height = 25
                              Align = alTop
                              BevelKind = bkTile
                              BevelOuter = bvNone
                              Caption = 'Adicionais (Ordem)'
                              Font.Charset = DEFAULT_CHARSET
                              Font.Color = clWindowText
                              Font.Height = -11
                              Font.Name = 'Tahoma'
                              Font.Style = [fsBold]
                              ParentFont = False
                              TabOrder = 2
                            end
                          end
                        end
                        object Panel6: TPanel
                          Left = 2
                          Top = 15
                          Width = 111
                          Height = 149
                          Align = alLeft
                          BevelOuter = bvNone
                          TabOrder = 1
                        end
                      end
                    end
                  end
                  object TabSheetNuvemshopEC: TTabSheet
                    Caption = 'API Nuvemshop (E-Commerce)'
                    ImageIndex = 5
                    object GroupBox11: TGroupBox
                      Left = 0
                      Top = 0
                      Width = 796
                      Height = 417
                      Align = alClient
                      Caption = 'API Nuvemshop (E-Commerce)'
                      TabOrder = 0
                      object Panel18: TPanel
                        Left = 2
                        Top = 15
                        Width = 792
                        Height = 218
                        Align = alTop
                        BevelOuter = bvNone
                        TabOrder = 0
                        object Label36: TLabel
                          Left = 87
                          Top = 17
                          Width = 17
                          Height = 13
                          Alignment = taRightJustify
                          Caption = 'Url:'
                          FocusControl = DBEditUrlNuvemshop
                        end
                        object Label37: TLabel
                          Left = 67
                          Top = 45
                          Width = 37
                          Height = 13
                          Alignment = taRightJustify
                          Caption = 'Id Loja:'
                          FocusControl = DBEditIdLojaNuvemshop
                        end
                        object Label38: TLabel
                          Left = 42
                          Top = 72
                          Width = 62
                          Height = 13
                          Alignment = taRightJustify
                          Caption = 'Acess token:'
                          FocusControl = DBEditAcessTokenNuvemshop
                        end
                        object Label40: TLabel
                          Left = 31
                          Top = 100
                          Width = 73
                          Height = 13
                          Alignment = taRightJustify
                          Caption = 'Tipo de cliente:'
                        end
                        object Label41: TLabel
                          Left = 10
                          Top = 156
                          Width = 94
                          Height = 13
                          Caption = 'Tipo venda padrao:'
                        end
                        object Label43: TLabel
                          Left = 54
                          Top = 129
                          Width = 50
                          Height = 13
                          Alignment = taRightJustify
                          Caption = 'Vendedor:'
                        end
                        object Label39: TLabel
                          Left = 23
                          Top = 182
                          Width = 81
                          Height = 13
                          Alignment = taRightJustify
                          Caption = 'Tabela de preco:'
                        end
                        object DBEditUrlNuvemshop: TDBEdit
                          Left = 110
                          Top = 14
                          Width = 646
                          Height = 21
                          DataField = 'URL_API'
                          DataSource = dtmConfig.dsConfigAPI
                          TabOrder = 0
                        end
                        object DBEditIdLojaNuvemshop: TDBEdit
                          Left = 110
                          Top = 42
                          Width = 115
                          Height = 21
                          DataField = 'USER_ID'
                          DataSource = dtmConfig.dsConfigAPI
                          TabOrder = 1
                        end
                        object DBEditAcessTokenNuvemshop: TDBEdit
                          Left = 110
                          Top = 69
                          Width = 646
                          Height = 21
                          DataField = 'ACESS_TOKEN'
                          DataSource = dtmConfig.dsConfigAPI
                          TabOrder = 2
                        end
                        object EditHwTipoClienteNuvemshop: TEditHw
                          Left = 110
                          Top = 98
                          Width = 63
                          Height = 21
                          TabOrder = 3
                          Text = '                 0'
                          OnExit = EditHwTipoClienteNuvemshopExit
                          OnKeyDown = EditHwTipoClienteNuvemshopKeyDown
                          Formato = fInteger
                          FormatSize = '0.2'
                        end
                        object DBLookupComboBoxTipoClienteNuvemshop: TDBLookupComboBox
                          Left = 174
                          Top = 98
                          Width = 582
                          Height = 21
                          KeyField = 'CODIGO_TIPO'
                          ListField = 'DESCRICAO_TIPO'
                          ListSource = dtmConfig.dsConfigAPItipocliente
                          TabOrder = 4
                          OnExit = DBLookupComboBoxTipoClienteNuvemshopExit
                        end
                        object EditHwVendedorNuvemshop: TEditHw
                          Left = 110
                          Top = 126
                          Width = 63
                          Height = 21
                          TabOrder = 5
                          Text = '                 0'
                          OnExit = EditHwVendedorNuvemshopExit
                          OnKeyDown = EditHwVendedorNuvemshopKeyDown
                          Formato = fInteger
                          FormatSize = '0.2'
                        end
                        object DBLookupComboBoxVendedorNuvemshop: TDBLookupComboBox
                          Left = 174
                          Top = 126
                          Width = 582
                          Height = 21
                          KeyField = 'COD_VENDEDOR'
                          ListField = 'NOME_VENDEDOR'
                          ListSource = dtmConfig.dsConfigAPIvendedor
                          TabOrder = 6
                          OnExit = DBLookupComboBoxVendedorNuvemshopExit
                        end
                        object EditHwTabelaPrecoNuvemshop: TEditHw
                          Left = 110
                          Top = 179
                          Width = 63
                          Height = 21
                          TabOrder = 8
                          Text = '                 0'
                          OnExit = EditHwTabelaPrecoNuvemshopExit
                          OnKeyDown = EditHwTabelaPrecoNuvemshopKeyDown
                          Formato = fInteger
                          FormatSize = '0.2'
                        end
                        object DBLookupComboBoxTabelaPrecoNuvemshop: TDBLookupComboBox
                          Left = 174
                          Top = 179
                          Width = 582
                          Height = 21
                          KeyField = 'COD_PROMOCAO'
                          ListField = 'DESCR_PROMOCAO'
                          ListSource = dtmConfig.dsConfigAPItabela
                          TabOrder = 9
                          OnExit = DBLookupComboBoxTabelaPrecoNuvemshopExit
                        end
                        object DBComboBoxTipoVendaPadraoREQNuvemshop: TDBComboBox
                          Left = 110
                          Top = 153
                          Width = 106
                          Height = 21
                          Style = csDropDownList
                          DataField = 'TIPO_VENDA'
                          DataSource = dtmConfig.dsConfigAPI
                          ItemHeight = 13
                          TabOrder = 7
                          OnExit = DBComboBoxUsarAPICogHwCloudIAExit
                        end
                      end
                      object GroupBox12: TGroupBox
                        Left = 2
                        Top = 233
                        Width = 792
                        Height = 182
                        Align = alClient
                        Caption = 'Tabelas de Pre'#231'o / Promocionais'
                        TabOrder = 1
                        object Panel19: TPanel
                          Left = 113
                          Top = 15
                          Width = 677
                          Height = 165
                          Align = alClient
                          BevelOuter = bvNone
                          TabOrder = 0
                          object Splitter5: TSplitter
                            Left = 324
                            Top = 0
                            Height = 165
                            ExplicitLeft = 320
                            ExplicitTop = 16
                            ExplicitHeight = 100
                          end
                          object Panel20: TPanel
                            Left = 0
                            Top = 0
                            Width = 324
                            Height = 165
                            Align = alLeft
                            BevelOuter = bvNone
                            Padding.Right = 3
                            Padding.Bottom = 6
                            TabOrder = 0
                            object TreeViewPromocaoNuvemshop: TTreeView
                              Left = 0
                              Top = 40
                              Width = 321
                              Height = 119
                              Align = alClient
                              Indent = 19
                              TabOrder = 0
                              OnDblClick = TreeViewPromocaoNuvemshopDblClick
                            end
                            object Panel21: TPanel
                              Left = 0
                              Top = 25
                              Width = 321
                              Height = 15
                              Align = alTop
                              BevelKind = bkTile
                              BevelOuter = bvNone
                              Caption = 'Duplo clique para adicionar'
                              TabOrder = 1
                            end
                            object Panel22: TPanel
                              Left = 0
                              Top = 0
                              Width = 321
                              Height = 25
                              Align = alTop
                              BevelKind = bkTile
                              BevelOuter = bvNone
                              Caption = 'Todas'
                              Font.Charset = DEFAULT_CHARSET
                              Font.Color = clWindowText
                              Font.Height = -11
                              Font.Name = 'Tahoma'
                              Font.Style = [fsBold]
                              ParentFont = False
                              TabOrder = 2
                            end
                          end
                          object Panel23: TPanel
                            Left = 327
                            Top = 0
                            Width = 350
                            Height = 165
                            Align = alClient
                            BevelOuter = bvNone
                            Padding.Left = 3
                            Padding.Bottom = 6
                            TabOrder = 1
                            object TreeViewPromocaoNuvemshop_DB: TTreeView
                              Left = 3
                              Top = 40
                              Width = 347
                              Height = 119
                              Align = alClient
                              Indent = 19
                              TabOrder = 0
                              OnDblClick = TreeViewPromocaoNuvemshop_DBDblClick
                            end
                            object Panel24: TPanel
                              Left = 3
                              Top = 25
                              Width = 347
                              Height = 15
                              Align = alTop
                              BevelKind = bkTile
                              BevelOuter = bvNone
                              Caption = 'Duplo clique para remover'
                              TabOrder = 1
                            end
                            object Panel25: TPanel
                              Left = 3
                              Top = 0
                              Width = 347
                              Height = 25
                              Align = alTop
                              BevelKind = bkTile
                              BevelOuter = bvNone
                              Caption = 'Adicionais (Ordem)'
                              Font.Charset = DEFAULT_CHARSET
                              Font.Color = clWindowText
                              Font.Height = -11
                              Font.Name = 'Tahoma'
                              Font.Style = [fsBold]
                              ParentFont = False
                              TabOrder = 2
                            end
                          end
                        end
                        object Panel26: TPanel
                          Left = 2
                          Top = 15
                          Width = 111
                          Height = 165
                          Align = alLeft
                          BevelOuter = bvNone
                          TabOrder = 1
                        end
                      end
                    end
                  end
                  object TabSheetCA: TTabSheet
                    Caption = 'API Com'#233'rcio Aberto (Vendas Internet)'
                    ImageIndex = 1
                    object GroupBox7: TGroupBox
                      Left = 0
                      Top = 0
                      Width = 796
                      Height = 417
                      Align = alClient
                      Caption = 'API Com'#233'rcio Aberto (Vendas Internet)'
                      Padding.Left = 6
                      Padding.Right = 6
                      Padding.Bottom = 6
                      TabOrder = 0
                      object GroupBox8: TGroupBox
                        Left = 8
                        Top = 199
                        Width = 780
                        Height = 210
                        Align = alClient
                        Caption = 'Tabelas de Pre'#231'o / Promocionais'
                        Padding.Right = 9
                        TabOrder = 0
                        object Panel9: TPanel
                          Left = 122
                          Top = 15
                          Width = 647
                          Height = 193
                          Align = alClient
                          BevelOuter = bvNone
                          TabOrder = 0
                          object Splitter4: TSplitter
                            Left = 324
                            Top = 0
                            Height = 193
                            ExplicitLeft = 320
                            ExplicitTop = 16
                            ExplicitHeight = 100
                          end
                          object Panel10: TPanel
                            Left = 0
                            Top = 0
                            Width = 324
                            Height = 193
                            Align = alLeft
                            BevelOuter = bvNone
                            Padding.Right = 3
                            Padding.Bottom = 6
                            TabOrder = 0
                            object TreeViewPromocaoCA: TTreeView
                              Left = 0
                              Top = 40
                              Width = 321
                              Height = 147
                              Align = alClient
                              Indent = 19
                              TabOrder = 0
                              OnDblClick = TreeViewPromocaoCADblClick
                            end
                            object Panel11: TPanel
                              Left = 0
                              Top = 25
                              Width = 321
                              Height = 15
                              Align = alTop
                              BevelKind = bkTile
                              BevelOuter = bvNone
                              Caption = 'Duplo clique para adicionar'
                              TabOrder = 1
                            end
                            object Panel12: TPanel
                              Left = 0
                              Top = 0
                              Width = 321
                              Height = 25
                              Align = alTop
                              BevelKind = bkTile
                              BevelOuter = bvNone
                              Caption = 'Todas'
                              Font.Charset = DEFAULT_CHARSET
                              Font.Color = clWindowText
                              Font.Height = -11
                              Font.Name = 'Tahoma'
                              Font.Style = [fsBold]
                              ParentFont = False
                              TabOrder = 2
                            end
                          end
                          object Panel13: TPanel
                            Left = 327
                            Top = 0
                            Width = 320
                            Height = 193
                            Align = alClient
                            BevelOuter = bvNone
                            Padding.Left = 3
                            Padding.Bottom = 6
                            TabOrder = 1
                            object TreeViewPromocaoCA_DB: TTreeView
                              Left = 3
                              Top = 40
                              Width = 317
                              Height = 147
                              Align = alClient
                              Indent = 19
                              TabOrder = 0
                              OnDblClick = TreeViewPromocaoCA_DBDblClick
                            end
                            object Panel14: TPanel
                              Left = 3
                              Top = 25
                              Width = 317
                              Height = 15
                              Align = alTop
                              BevelKind = bkTile
                              BevelOuter = bvNone
                              Caption = 'Duplo clique para remover'
                              TabOrder = 1
                            end
                            object Panel15: TPanel
                              Left = 3
                              Top = 0
                              Width = 317
                              Height = 25
                              Align = alTop
                              BevelKind = bkTile
                              BevelOuter = bvNone
                              Caption = 'Adicionais (Ordem)'
                              Font.Charset = DEFAULT_CHARSET
                              Font.Color = clWindowText
                              Font.Height = -11
                              Font.Name = 'Tahoma'
                              Font.Style = [fsBold]
                              ParentFont = False
                              TabOrder = 2
                            end
                          end
                        end
                        object Panel16: TPanel
                          Left = 2
                          Top = 15
                          Width = 120
                          Height = 193
                          Align = alLeft
                          BevelOuter = bvNone
                          TabOrder = 1
                        end
                      end
                      object Panel17: TPanel
                        Left = 8
                        Top = 15
                        Width = 780
                        Height = 184
                        Align = alTop
                        BevelOuter = bvNone
                        TabOrder = 1
                        object Label17: TLabel
                          Left = 36
                          Top = 74
                          Width = 81
                          Height = 13
                          Alignment = taRightJustify
                          Caption = 'Tabela de preco:'
                        end
                        object Label18: TLabel
                          Left = 7
                          Top = 17
                          Width = 110
                          Height = 13
                          Alignment = taRightJustify
                          Caption = 'Identifica'#231#227'o Empresa:'
                          FocusControl = DBEditIdentificacaoCA
                        end
                        object Label19: TLabel
                          Left = 31
                          Top = 46
                          Width = 88
                          Height = 13
                          Alignment = taRightJustify
                          Caption = 'Telefone Principal:'
                          FocusControl = DBEditTelefoneCA
                        end
                        object Label20: TLabel
                          Left = 266
                          Top = 46
                          Width = 59
                          Height = 13
                          Alignment = taRightJustify
                          Caption = 'WhatssApp:'
                          FocusControl = DBEditWhatsppCA
                        end
                        object Label22: TLabel
                          Left = 31
                          Top = 161
                          Width = 86
                          Height = 13
                          Alignment = taRightJustify
                          Caption = 'Imagem Logotipo:'
                          FocusControl = DBEdit_ImagemLogotipoCA
                        end
                        object SpeedButton14: TSpeedButton
                          Left = 699
                          Top = 157
                          Width = 23
                          Height = 22
                          Hint = 'Selecione a Imagem'
                          Flat = True
                          Glyph.Data = {
                            2E030000424D2E030000000000002E0200002800000010000000100000000100
                            08000000000000010000120B0000120B00007E0000007E00000000000000FFFF
                            FF00FF00FF00922B0100862D0500AD887700C9967500E6AA7A00EABC9800F898
                            2900FFD8AA00726C6200A79365005D624900697B4C0070756B00AAE3C400148B
                            5C000E84570087C4B000079168009CD0C000AFE5D5008BCBBA0087BFB20083BA
                            AF0097DCD00093DCD10097DACF0089C2BA0097E0D8007DC4BD007FCAC50082C6
                            C2003CC4BF0095CFCC0086DEDD007EC6C5007DFEFF0083FEFF0084FEFF0084FF
                            FF0089FFFF008AFFFF0078CFD00096FFFF007FD4D500A1FFFF0076B4B4007AFA
                            FF007EFCFF0076CED00069AFB1009FFCFE0073F7FF007AF8FF007DF8FF0080F8
                            FF0084EBF00090FAFF00A0F8FC0069F3FF006DF4FF0072F3FF0073F3FF0075F6
                            FF0077F4FF0079F4FF0079F3FE007BF4FF007DF6FF0092F2FB009AF4FB009EE5
                            EA0086BFC4005AC9D50077F3FF0078F3FF0079F3FF0077E3EE005DADB50080EA
                            F70082EEFA0083EAF40065EEFF0068EEFF0072EFFF0073EFFF0074EFFF0076EE
                            FF0076F0FF007AEFFF0092E7F400B4EFF70054D8F0006BE7FB006AE2F70070D9
                            EB0083BAC40068E5FF0052919D004DCBEA005BD9F80068DDFA0060CCE60088D8
                            EB0084BFCC0004B4E30044C4E50052C1E10039B7E00057D0F6004099B40075CB
                            E60027A6D50040C1EF0042C4F4004DCAF6004CB6DC001896CA001FA1D40028A4
                            D3000D8EC7001490C9001996CC001E96CB00027D7D7D02020202020202020202
                            02027D5C5E6C6E7D7D7A02020202020202027D5D2927394460657D7D7A020202
                            02027D712D41434D4E4645595F7D020202027A793C36434C5A5857574F637802
                            02027A7D6D28424C5A58403319687D0202027A7D762F3E3F56402C1D1C30617D
                            02027A6F7D6948473B2E201E1A21187D02027A67737D7D7D701F3A241B251713
                            7D027A5B6675740F037D4B49162315107D027A2A32555003070B7D77776A624A
                            7D037A2B31433D3403050D126B77777703027A35263738546403080C14220903
                            02020277535152727A02030A0E110302020202027B777C7A0202020306040202
                            020202020202020202020202030202020202}
                          ParentShowHint = False
                          ShowHint = True
                          OnClick = SpeedButton14Click
                        end
                        object SpeedButton13: TSpeedButton
                          Left = 728
                          Top = 157
                          Width = 23
                          Height = 22
                          Hint = 'Visualizar imagem'
                          Flat = True
                          Glyph.Data = {
                            A2030000424DA203000000000000A20200002800000010000000100000000100
                            08000000000000010000C30E0000C30E00009B0000009B000000001C00000023
                            0000002A0000A12A00000031000098310000AB31000000380000B63800000040
                            000003400000B64000000048000060480000C0480000B6500000D4500000E050
                            0000D4580000F4730000032A0300842A03000038030003380300034003000350
                            0300CA730300065006000B50060003580600E073060006500B00AB500B00C060
                            0B0011730B00D460110098841100B65816001C731600A1981600FF981600AB58
                            1C001C731C0016A11C0023732300D47323002A84230038842300A18F23001C98
                            23008498230098502A001C7B2A00237B2A007B7B2A00D4842A00168F2A007BA1
                            2A00FFA12A006AAB2A00318F3100319831007BA1310073AB3100FFAB31002A84
                            3800FFB638008FAB4000FFAB4000FFB64000FFC0400040AB480048B64800FFC0
                            48005050500031B6500058585800C0845800388F580038A16000F4C0600058CA
                            6000FFCA60006A6A6A00736A6A0048A16A00E0CA6A00F4CA6A00FFCA6A006A6A
                            7300736A73007B6A73007373730060C0730073C07300F4C07300FFCA7300FFE0
                            730073737B007B737B00737B7B007B7B7B00D4AB7B00EAB67B0073C07B00F4C0
                            7B006A738400737B840084848400E0B68400EAB68400EAC0840073CA8400F4CA
                            8400FFCA8400FFEA84008F8F8F0058C08F00EAC08F00F4CA8F007BD48F00FFD4
                            8F008F8F980098989800F4CA98007BD49800F4D4980058E098009898A10098A1
                            A100A1A1A10060CAA1007BD4A1006AE0A100A1A1AB00ABABAB0084CAAB0073D4
                            AB00F4D4AB00FFFFAB00ABABB600ABB6B600B6B6B6007BE0B600F4EAB600FFEA
                            B6007BE0C000FFFFC0007BE0D4007BEAE0007BFFE000FF00FF0084FFFF008FFF
                            FF00FFFFFF00976C4C4A4C4C4C4C4C4C4C4C4C4A4C6565635C5C5C5C5C5C5C5C
                            5C5C5C5C5C4C655E5E5E7078787D848989899288544A6C2C2A2C353535414E55
                            83969694544A6C1704161616161714174F999895544A7404020101010004041C
                            5D857F755A4A741C19040100001F384B513E2730624A7B3C3C18010409263E32
                            241A131E6A4A8047481D070C0A0D0F0E101012216A4A82312B222F2E362D230B
                            030608206B4A873F3B43565673735037252905156B4A87585249424545424961
                            8B8A4D33624A8E5F603A2840443A447990909390534A8E7677695F777C7C7C71
                            6F6F716D594C8E766F76766D6D6D6D6D6D6D676662748D8D8C8786868281807B
                            7A7A746C6C97}
                          ParentShowHint = False
                          ShowHint = True
                          OnClick = SpeedButton13Click
                        end
                        object Label23: TLabel
                          Left = 73
                          Top = 103
                          Width = 44
                          Height = 13
                          Alignment = taRightJustify
                          Caption = 'WebSite:'
                          FocusControl = DBEditWebSiteCA
                        end
                        object Label24: TLabel
                          Left = 49
                          Top = 132
                          Width = 68
                          Height = 13
                          Alignment = taRightJustify
                          Caption = 'Email contato:'
                          FocusControl = DBEditEmailCA
                        end
                        object Label25: TLabel
                          Left = 473
                          Top = 46
                          Width = 34
                          Height = 13
                          Alignment = taRightJustify
                          Caption = 'Senha:'
                          FocusControl = DBEditSenhaCA
                        end
                        object EditHwTabelaPrecoCA: TEditHw
                          Left = 122
                          Top = 71
                          Width = 63
                          Height = 21
                          TabOrder = 4
                          Text = '                 0'
                          OnExit = EditHwTabelaPrecoCAExit
                          OnKeyDown = EditHwTabelaPrecoCAKeyDown
                          Formato = fInteger
                          FormatSize = '0.2'
                        end
                        object DBLookupComboBoxTabelaPrecoCA: TDBLookupComboBox
                          Left = 186
                          Top = 71
                          Width = 567
                          Height = 21
                          KeyField = 'COD_PROMOCAO'
                          ListField = 'DESCR_PROMOCAO'
                          ListSource = dtmConfig.dsConfigAPItabela
                          TabOrder = 5
                          OnExit = DBLookupComboBoxTabelaPrecoCAExit
                        end
                        object DBEditIdentificacaoCA: TDBEdit
                          Left = 122
                          Top = 14
                          Width = 631
                          Height = 21
                          DataField = 'NOMEFANTASIA'
                          DataSource = dtmConfig.dsConfigAPI
                          TabOrder = 0
                        end
                        object DBEditTelefoneCA: TDBEdit
                          Left = 122
                          Top = 43
                          Width = 119
                          Height = 21
                          DataField = 'TELEFONE'
                          DataSource = dtmConfig.dsConfigAPI
                          TabOrder = 1
                          OnKeyPress = DBEditWhatsppCAKeyPress
                        end
                        object DBEditWhatsppCA: TDBEdit
                          Left = 331
                          Top = 43
                          Width = 119
                          Height = 21
                          DataField = 'CELULAR'
                          DataSource = dtmConfig.dsConfigAPI
                          TabOrder = 2
                          OnKeyPress = DBEditWhatsppCAKeyPress
                        end
                        object DBEdit_ImagemLogotipoCA: TDBEdit
                          Left = 122
                          Top = 158
                          Width = 571
                          Height = 21
                          Hint = 
                            'Endere'#231'o da imagem utilizada como logotipo na exibi'#231#227'o do Com'#233'rc' +
                            'io Aberto'
                          DataField = 'ARQUIVOLOGO'
                          DataSource = dtmConfig.dsConfigAPI
                          TabOrder = 8
                        end
                        object DBEditWebSiteCA: TDBEdit
                          Left = 122
                          Top = 100
                          Width = 629
                          Height = 21
                          Hint = 
                            'Endere'#231'o da imagem utilizada como logotipo na exibi'#231#227'o do Com'#233'rc' +
                            'io Aberto'
                          DataField = 'WEBSITE'
                          DataSource = dtmConfig.dsConfigAPI
                          TabOrder = 6
                        end
                        object DBEditEmailCA: TDBEdit
                          Left = 122
                          Top = 129
                          Width = 631
                          Height = 21
                          Hint = 
                            'Endere'#231'o da imagem utilizada como logotipo na exibi'#231#227'o do Com'#233'rc' +
                            'io Aberto'
                          DataField = 'EMAILCONTATO'
                          DataSource = dtmConfig.dsConfigAPI
                          TabOrder = 7
                        end
                        object DBEditSenhaCA: TDBEdit
                          Left = 513
                          Top = 43
                          Width = 239
                          Height = 21
                          DataField = 'TOKEN_API'
                          DataSource = dtmConfig.dsConfigAPI
                          PasswordChar = '*'
                          TabOrder = 3
                        end
                      end
                    end
                  end
                  object TabSheetSmartbis: TTabSheet
                    Caption = 'API Smartbis (Programa de Fidelidade)'
                    ImageIndex = 1
                    object GroupBox5: TGroupBox
                      Left = 0
                      Top = 0
                      Width = 796
                      Height = 417
                      Align = alClient
                      Caption = 'API Smartbis (Programa de Fidelidade)'
                      TabOrder = 0
                      object Label12: TLabel
                        Left = 87
                        Top = 33
                        Width = 17
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Url:'
                        FocusControl = DBEditUrlSmartbis
                      end
                      object Label15: TLabel
                        Left = 71
                        Top = 62
                        Width = 33
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Token:'
                        FocusControl = DBEditTokenSmartbis
                      end
                      object Label16: TLabel
                        Left = 70
                        Top = 90
                        Width = 34
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Senha:'
                        FocusControl = DBEditSenhaSmartbis
                      end
                      object DBEditUrlSmartbis: TDBEdit
                        Left = 109
                        Top = 30
                        Width = 650
                        Height = 21
                        DataField = 'URL_API'
                        DataSource = dtmConfig.dsConfigAPI
                        TabOrder = 0
                      end
                      object DBEditTokenSmartbis: TDBEdit
                        Left = 109
                        Top = 59
                        Width = 650
                        Height = 21
                        DataField = 'TOKEN_API'
                        DataSource = dtmConfig.dsConfigAPI
                        TabOrder = 1
                      end
                      object DBEditSenhaSmartbis: TDBEdit
                        Left = 109
                        Top = 87
                        Width = 156
                        Height = 21
                        DataField = 'SENHA_API'
                        DataSource = dtmConfig.dsConfigAPI
                        PasswordChar = '*'
                        TabOrder = 2
                      end
                    end
                  end
                  object TabSheetNummus: TTabSheet
                    Caption = 'API Nummus (Cashback)'
                    ImageIndex = 7
                    object GroupBox14: TGroupBox
                      Left = 0
                      Top = 0
                      Width = 796
                      Height = 417
                      Align = alClient
                      Caption = 'API Nummus (Cashback)'
                      TabOrder = 0
                      object Label31: TLabel
                        Left = 87
                        Top = 33
                        Width = 17
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Url:'
                      end
                      object Label33: TLabel
                        Left = 62
                        Top = 62
                        Width = 42
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'API Key:'
                      end
                      object Label34: TLabel
                        Left = 60
                        Top = 90
                        Width = 44
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Client Id:'
                      end
                      object EditUrlNummus: TEdit
                        Left = 110
                        Top = 30
                        Width = 640
                        Height = 21
                        TabOrder = 0
                        Text = 'EditUrlNummus'
                      end
                      object EditApiKeyNummus: TEdit
                        Left = 110
                        Top = 59
                        Width = 640
                        Height = 21
                        TabOrder = 1
                        Text = 'EditApiKeyNummus'
                      end
                      object EditClientIdNummus: TEdit
                        Left = 110
                        Top = 86
                        Width = 291
                        Height = 21
                        TabOrder = 2
                        Text = 'EditClientIdNummus'
                      end
                    end
                  end
                  object TabSheetConcCartao: TTabSheet
                    Caption = 'API Confere (Concilia'#231#227'o de Cart'#245'es)'
                    ImageIndex = 3
                    object GroupBox9: TGroupBox
                      Left = 0
                      Top = 0
                      Width = 796
                      Height = 417
                      Align = alClient
                      Caption = 'API Confere (Concilia'#231#227'o de Cart'#245'es)'
                      TabOrder = 0
                      object Label21: TLabel
                        Left = 90
                        Top = 33
                        Width = 17
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Url:'
                        FocusControl = DBEditUrlConfere
                      end
                      object Label26: TLabel
                        Left = 29
                        Top = 62
                        Width = 78
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Cod Integrador:'
                        FocusControl = DBEditCodIntegradorConfere
                      end
                      object Label27: TLabel
                        Left = 19
                        Top = 90
                        Width = 88
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Token Integrador:'
                      end
                      object Label28: TLabel
                        Left = 6
                        Top = 165
                        Width = 101
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Cod Cliente Confere:'
                        FocusControl = DBEditCodClienteConfere
                      end
                      object Label29: TLabel
                        Left = 233
                        Top = 165
                        Width = 146
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Cod Estabelecimento Confere:'
                        FocusControl = DBEditCodClienteConfere
                      end
                      object DBEditUrlConfere: TDBEdit
                        Left = 112
                        Top = 30
                        Width = 646
                        Height = 21
                        DataField = 'URL_API'
                        DataSource = dtmConfig.dsConfigAPI
                        TabOrder = 0
                      end
                      object DBEditCodIntegradorConfere: TDBEdit
                        Left = 112
                        Top = 59
                        Width = 646
                        Height = 21
                        DataField = 'COD_INTEGRADOR'
                        DataSource = dtmConfig.dsConfigAPI
                        TabOrder = 1
                      end
                      object DBMemoTokenIntegradorConfere: TDBMemo
                        Left = 112
                        Top = 87
                        Width = 646
                        Height = 67
                        DataField = 'TOKEN_INTEGRADOR'
                        DataSource = dtmConfig.dsConfigAPI
                        TabOrder = 2
                      end
                      object DBEditCodClienteConfere: TDBEdit
                        Left = 112
                        Top = 162
                        Width = 100
                        Height = 21
                        DataField = 'COD_CLIENTE_CONFERE'
                        DataSource = dtmConfig.dsConfigAPI
                        TabOrder = 3
                      end
                      object DBEditCodEstabConfere: TDBEdit
                        Left = 385
                        Top = 162
                        Width = 100
                        Height = 21
                        DataField = 'COD_ESTABEL_CONFERE'
                        DataSource = dtmConfig.dsConfigAPI
                        TabOrder = 4
                      end
                    end
                  end
                  object TabSheetKentro: TTabSheet
                    Caption = 'API Kentro (Mensagens Via WhatsApp)'
                    ImageIndex = 4
                    object GroupBox10: TGroupBox
                      Left = 0
                      Top = 0
                      Width = 796
                      Height = 417
                      Align = alClient
                      Caption = 'API Kentro (Mensagens Via WhatsApp)'
                      TabOrder = 0
                      object Label32: TLabel
                        Left = 69
                        Top = 51
                        Width = 35
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Chave:'
                      end
                      object Label35: TLabel
                        Left = 49
                        Top = 78
                        Width = 55
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Queued Id:'
                      end
                      object Label30: TLabel
                        Left = 87
                        Top = 24
                        Width = 17
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Url:'
                      end
                      object EditPasswordKentro: TEdit
                        Left = 110
                        Top = 48
                        Width = 384
                        Height = 21
                        PasswordChar = '*'
                        TabOrder = 1
                        Text = 'EditPasswordKentro'
                      end
                      object EditQueuedIdKentro: TEdit
                        Left = 110
                        Top = 75
                        Width = 80
                        Height = 21
                        TabOrder = 2
                        Text = 'EditQueuedIdKentro'
                        OnKeyPress = EditQueuedIdKentroKeyPress
                      end
                      object EditUrlKentro: TEdit
                        Left = 110
                        Top = 21
                        Width = 640
                        Height = 21
                        TabOrder = 0
                        Text = 'EditUrlKentro'
                      end
                    end
                  end
                  object TabSheetPlugBoleto: TTabSheet
                    Caption = 'API Plug Boleto (Emiss'#227'o de Boletos)'
                    ImageIndex = 6
                    object GroupBox13: TGroupBox
                      Left = 0
                      Top = 0
                      Width = 796
                      Height = 417
                      Align = alClient
                      Caption = 'API Plug Boleto (Emiss'#227'o de Boletos)'
                      TabOrder = 0
                      object Panel27: TPanel
                        Left = 2
                        Top = 15
                        Width = 792
                        Height = 400
                        Align = alClient
                        BevelOuter = bvNone
                        TabOrder = 0
                        object Label44: TLabel
                          Left = 71
                          Top = 18
                          Width = 33
                          Height = 13
                          Alignment = taRightJustify
                          Caption = 'Token:'
                          FocusControl = DBEditTokenPlug
                        end
                        object Label45: TLabel
                          Left = 36
                          Top = 46
                          Width = 69
                          Height = 13
                          Alignment = taRightJustify
                          Caption = 'Chave Assign:'
                          FocusControl = DBEditChaveAssignPlug
                        end
                        object Label46: TLabel
                          Left = 55
                          Top = 74
                          Width = 49
                          Height = 13
                          Alignment = taRightJustify
                          Caption = 'Ambiente:'
                          FocusControl = DBEditChaveAssignPlug
                        end
                        object DBEditTokenPlug: TDBEdit
                          Left = 110
                          Top = 15
                          Width = 646
                          Height = 21
                          DataField = 'TOKEN_API'
                          DataSource = dtmConfig.dsConfigAPI
                          PasswordChar = '*'
                          TabOrder = 0
                        end
                        object DBEditChaveAssignPlug: TDBEdit
                          Left = 110
                          Top = 42
                          Width = 646
                          Height = 21
                          DataField = 'CHAVE_ASSIGN'
                          DataSource = dtmConfig.dsConfigAPI
                          TabOrder = 1
                        end
                        object ComboBoxAmbientePlug: TComboBox
                          Left = 110
                          Top = 71
                          Width = 235
                          Height = 21
                          Style = csDropDownList
                          ItemHeight = 13
                          TabOrder = 2
                          OnKeyPress = ComboBoxAmbientePlugKeyPress
                          Items.Strings = (
                            'Produ'#231#227'o'
                            'Homologa'#231#227'o')
                        end
                      end
                    end
                  end
                  object TabSheetSuzuki: TTabSheet
                    Caption = 'API Suzuki (Conex'#227'o Suzuki)'
                    ImageIndex = 9
                    object GroupBoxSuzuki: TGroupBox
                      Left = 0
                      Top = 0
                      Width = 796
                      Height = 417
                      Align = alClient
                      Caption = 'API Suzuki'
                      TabOrder = 0
                      object PanelTopSuzuki: TPanel
                        Left = 2
                        Top = 15
                        Width = 792
                        Height = 400
                        Align = alClient
                        BevelOuter = bvNone
                        TabOrder = 0
                        object LabelUrlSuzuki: TLabel
                          Left = 64
                          Top = 17
                          Width = 40
                          Height = 13
                          Alignment = taRightJustify
                          Caption = 'Usu'#225'rio:'
                          FocusControl = DBEditUsuarioSuzuki
                        end
                        object LabelApiKeySuzuki: TLabel
                          Left = 70
                          Top = 47
                          Width = 34
                          Height = 13
                          Alignment = taRightJustify
                          Caption = 'Senha:'
                          FocusControl = DBEditSenhaSuzuki
                        end
                        object Label42: TLabel
                          Left = 55
                          Top = 74
                          Width = 49
                          Height = 13
                          Alignment = taRightJustify
                          Caption = 'Ambiente:'
                          FocusControl = DBEditChaveAssignPlug
                        end
                        object DBEditUsuarioSuzuki: TDBEdit
                          Left = 110
                          Top = 14
                          Width = 235
                          Height = 21
                          DataField = 'TOKEN_API'
                          DataSource = dtmConfig.dsConfigAPI
                          TabOrder = 0
                        end
                        object DBEditSenhaSuzuki: TDBEdit
                          Left = 110
                          Top = 42
                          Width = 235
                          Height = 21
                          DataField = 'SENHA'
                          DataSource = dtmConfig.dsConfigAPI
                          PasswordChar = '*'
                          TabOrder = 1
                        end
                        object ComboBoxAmbienteSuzuki: TComboBox
                          Left = 110
                          Top = 71
                          Width = 235
                          Height = 21
                          Style = csDropDownList
                          ItemHeight = 13
                          TabOrder = 2
                          OnKeyPress = ComboBoxAmbienteSuzukiKeyPress
                          Items.Strings = (
                            'Produ'#231#227'o'
                            'Homologa'#231#227'o')
                        end
                      end
                    end
                  end
                  object TabSheetHwCloudIA: TTabSheet
                    Caption = 'Hw Cloud IA (Integrador)'
                    ImageIndex = 9
                    object GroupBox15: TGroupBox
                      Left = 0
                      Top = 0
                      Width = 796
                      Height = 417
                      Align = alClient
                      Caption = 'Hw Cloud IA'
                      TabOrder = 0
                      object Panel28: TPanel
                        Left = 2
                        Top = 15
                        Width = 792
                        Height = 226
                        Align = alTop
                        BevelOuter = bvNone
                        TabOrder = 1
                        object Label47: TLabel
                          Left = 109
                          Top = 3
                          Width = 17
                          Height = 13
                          Alignment = taRightJustify
                          Caption = 'Url:'
                          FocusControl = DBEditUrlHwCloudIA
                        end
                        object Label48: TLabel
                          Left = 58
                          Top = 28
                          Width = 68
                          Height = 13
                          Alignment = taRightJustify
                          Caption = 'Authorization:'
                          FocusControl = DBEditAuthorizationHwCloudIA
                        end
                        object Label63: TLabel
                          Left = 60
                          Top = 55
                          Width = 66
                          Height = 13
                          Alignment = taRightJustify
                          Caption = 'Info Contato:'
                          FocusControl = DBEditChaveAssignPlug
                        end
                        object Label65: TLabel
                          Left = 95
                          Top = 200
                          Width = 31
                          Height = 13
                          Alignment = taRightJustify
                          Caption = 'Inicial:'
                          FocusControl = DBEditSemanaIniHwCloudIA
                        end
                        object Label66: TLabel
                          Left = 95
                          Top = 179
                          Width = 120
                          Height = 13
                          Alignment = taCenter
                          Caption = 'Hor'#225'rio Segunda '#224' Sexta'
                          FocusControl = DBEditAuthorizationHwCloudIA
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clBlue
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = []
                          ParentFont = False
                        end
                        object Label67: TLabel
                          Left = 236
                          Top = 200
                          Width = 26
                          Height = 13
                          Alignment = taRightJustify
                          Caption = 'Final:'
                          FocusControl = DBEditSemanaFimHwCloudIA
                        end
                        object Label68: TLabel
                          Left = 448
                          Top = 200
                          Width = 31
                          Height = 13
                          Alignment = taRightJustify
                          Caption = 'Inicial:'
                          FocusControl = DBEditSabadoIniHwCloudIA
                        end
                        object Label69: TLabel
                          Left = 448
                          Top = 179
                          Width = 89
                          Height = 13
                          Alignment = taCenter
                          Caption = 'Hor'#225'rio do S'#225'bado'
                          FocusControl = DBEditAuthorizationHwCloudIA
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clBlue
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = []
                          ParentFont = False
                        end
                        object Label70: TLabel
                          Left = 589
                          Top = 200
                          Width = 26
                          Height = 13
                          Alignment = taRightJustify
                          Caption = 'Final:'
                          FocusControl = DBEditSabadoFimHwCloudIA
                        end
                        object Label71: TLabel
                          Left = 61
                          Top = 133
                          Width = 65
                          Height = 13
                          Alignment = taRightJustify
                          Caption = 'Nome do Bot:'
                          FocusControl = DBEditNomeBotHwCloudIA
                        end
                        object Label72: TLabel
                          Left = 250
                          Top = 109
                          Width = 105
                          Height = 13
                          Alignment = taRightJustify
                          Caption = 'Utilizar Bot (API Cog):'
                          FocusControl = DBComboBoxUsarAPICogHwCloudIA
                        end
                        object Label74: TLabel
                          Left = 569
                          Top = 109
                          Width = 49
                          Height = 13
                          Alignment = taRightJustify
                          Caption = 'Ambiente:'
                          FocusControl = DBComboBoxAmbienteHwCloudIA
                        end
                        object Label90: TLabel
                          Left = 431
                          Top = 109
                          Width = 75
                          Height = 13
                          Alignment = taRightJustify
                          Caption = 'Modelo Padr'#227'o:'
                        end
                        object Label91: TLabel
                          Left = 15
                          Top = 158
                          Width = 111
                          Height = 13
                          Alignment = taRightJustify
                          Caption = 'Dia Faturamento Meta:'
                          FocusControl = DBEditDiaMesFatMetaHwCloudIA
                        end
                        object Label92: TLabel
                          Left = 278
                          Top = 158
                          Width = 111
                          Height = 13
                          Alignment = taRightJustify
                          Caption = 'Limite Gastos Meta ($):'
                        end
                        object Label100: TLabel
                          Left = 59
                          Top = 109
                          Width = 67
                          Height = 13
                          Alignment = taRightJustify
                          Caption = 'Venda Online:'
                          FocusControl = DBComboBoxUsarAPICogHwCloudIA
                        end
                        object DBEditUrlHwCloudIA: TDBEdit
                          Left = 132
                          Top = 0
                          Width = 642
                          Height = 21
                          DataField = 'URL_API'
                          DataSource = dtmConfig.dsConfigAPI
                          TabOrder = 0
                        end
                        object DBEditAuthorizationHwCloudIA: TDBEdit
                          Left = 132
                          Top = 25
                          Width = 642
                          Height = 21
                          DataField = 'TOKEN_API'
                          DataSource = dtmConfig.dsConfigAPI
                          PasswordChar = '*'
                          TabOrder = 1
                        end
                        object DBMemoInfoContatoHwCloudIA: TDBMemo
                          Left = 132
                          Top = 50
                          Width = 642
                          Height = 52
                          DataField = 'INFO_CONTATO'
                          DataSource = dtmConfig.dsConfigAPI
                          TabOrder = 2
                        end
                        object DBEditSemanaIniHwCloudIA: TDBEdit
                          Left = 132
                          Top = 196
                          Width = 71
                          Height = 21
                          DataField = 'HORARIO_SEMANA_INI'
                          DataSource = dtmConfig.dsConfigAPI
                          TabOrder = 10
                          OnEnter = DBEditSemanaIniHwCloudIAEnter
                          OnKeyDown = DBEditSemanaIniHwCloudIAKeyDown
                        end
                        object DBEditSemanaFimHwCloudIA: TDBEdit
                          Left = 268
                          Top = 196
                          Width = 71
                          Height = 21
                          DataField = 'HORARIO_SEMANA_FIM'
                          DataSource = dtmConfig.dsConfigAPI
                          TabOrder = 11
                          OnEnter = DBEditSemanaFimHwCloudIAEnter
                          OnKeyDown = DBEditSemanaFimHwCloudIAKeyDown
                        end
                        object DBEditSabadoIniHwCloudIA: TDBEdit
                          Left = 485
                          Top = 196
                          Width = 71
                          Height = 21
                          DataField = 'HORARIO_SABADO_INI'
                          DataSource = dtmConfig.dsConfigAPI
                          TabOrder = 12
                          OnEnter = DBEditSabadoIniHwCloudIAEnter
                          OnKeyDown = DBEditSabadoIniHwCloudIAKeyDown
                        end
                        object DBEditSabadoFimHwCloudIA: TDBEdit
                          Left = 621
                          Top = 197
                          Width = 71
                          Height = 21
                          DataField = 'HORARIO_SABADO_FIM'
                          DataSource = dtmConfig.dsConfigAPI
                          TabOrder = 13
                          OnEnter = DBEditSabadoFimHwCloudIAEnter
                          OnKeyDown = DBEditSabadoFimHwCloudIAKeyDown
                        end
                        object DBEditNomeBotHwCloudIA: TDBEdit
                          Left = 131
                          Top = 131
                          Width = 154
                          Height = 21
                          DataField = 'NOME_BOT'
                          DataSource = dtmConfig.dsConfigAPI
                          TabOrder = 7
                        end
                        object DBComboBoxUsarAPICogHwCloudIA: TDBComboBox
                          Left = 361
                          Top = 106
                          Width = 63
                          Height = 21
                          Style = csDropDownList
                          DataField = 'USAR_API_COG'
                          DataSource = dtmConfig.dsConfigAPI
                          ItemHeight = 13
                          Items.Strings = (
                            'S - SIM'
                            'N - N'#195'O')
                          TabOrder = 4
                          OnChange = DBComboBoxUsarAPICogHwCloudIAExit
                          OnExit = DBComboBoxUsarAPICogHwCloudIAExit
                        end
                        object DBComboBoxAmbienteHwCloudIA: TDBComboBox
                          Left = 624
                          Top = 106
                          Width = 150
                          Height = 21
                          Style = csDropDownList
                          DataField = 'AMBIENTE_API'
                          DataSource = dtmConfig.dsConfigAPI
                          ItemHeight = 13
                          Items.Strings = (
                            'S - SIM'
                            'N - N'#195'O')
                          TabOrder = 6
                          OnExit = DBComboBoxUsarAPICogHwCloudIAExit
                        end
                        object DBEditModeloPadraoHwCloudIA: TDBEdit
                          Left = 511
                          Top = 106
                          Width = 43
                          Height = 21
                          DataField = 'MODELO_PADRAO'
                          DataSource = dtmConfig.dsConfigAPI
                          TabOrder = 5
                        end
                        object DBEditDiaMesFatMetaHwCloudIA: TDBEdit
                          Left = 132
                          Top = 156
                          Width = 43
                          Height = 21
                          DataField = 'DIA_MES_INI_FAT_META'
                          DataSource = dtmConfig.dsConfigAPI
                          TabOrder = 8
                        end
                        object DBEditLimiteGastosMetaHwCloudIA: TDBEdit
                          Left = 395
                          Top = 156
                          Width = 71
                          Height = 21
                          DataField = 'LIMITE_GASTOS_META'
                          DataSource = dtmConfig.dsConfigAPI
                          TabOrder = 9
                        end
                        object DBComboBoxUsarAPIPedidoHwCloudIA: TDBComboBox
                          Left = 132
                          Top = 106
                          Width = 63
                          Height = 21
                          Style = csDropDownList
                          DataField = 'USAR_API_PEDIDO'
                          DataSource = dtmConfig.dsConfigAPI
                          ItemHeight = 13
                          Items.Strings = (
                            'S - SIM'
                            'N - N'#195'O')
                          TabOrder = 3
                          OnChange = DBComboBoxUsarAPIPedidoHwCloudIAExit
                          OnExit = DBComboBoxUsarAPIPedidoHwCloudIAExit
                        end
                      end
                      object PageControl4: TPageControl
                        Left = 2
                        Top = 241
                        Width = 792
                        Height = 174
                        ActivePage = TabSheet5
                        Align = alClient
                        Style = tsFlatButtons
                        TabOrder = 0
                        object TabSheet5: TTabSheet
                          Caption = 'Mensageria'
                          ImageIndex = 1
                          object GroupBox17: TGroupBox
                            Left = 0
                            Top = 0
                            Width = 784
                            Height = 143
                            Align = alClient
                            Caption = 'Plataformas de Mensagens'
                            TabOrder = 0
                            object DBGrid2: TDBGrid
                              Left = 2
                              Top = 15
                              Width = 780
                              Height = 126
                              Align = alClient
                              DataSource = dtmConfig.dsMsgPlataforma
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
                                  FieldName = 'APLICATIVO'
                                  Width = 120
                                  Visible = True
                                end
                                item
                                  Expanded = False
                                  FieldName = 'PLATAFORMA'
                                  Width = 200
                                  Visible = True
                                end
                                item
                                  Expanded = False
                                  FieldName = 'IDENTIFICADOR_BOT'
                                  Visible = True
                                end>
                            end
                          end
                        end
                        object TabSheet6: TTabSheet
                          Caption = 'Gest'#227'o de Estoque'
                          object GroupBox16: TGroupBox
                            Left = 0
                            Top = 0
                            Width = 784
                            Height = 143
                            Align = alClient
                            Caption = 'Gest'#227'o de Estoque'
                            TabOrder = 0
                            object Bevel1: TBevel
                              Left = 128
                              Top = 50
                              Width = 640
                              Height = 2
                              Shape = bsTopLine
                            end
                            object Label137: TLabel
                              Left = 35
                              Top = 43
                              Width = 80
                              Height = 13
                              Caption = 'Peso empresa'
                              Font.Charset = DEFAULT_CHARSET
                              Font.Color = clWindowText
                              Font.Height = -11
                              Font.Name = 'Tahoma'
                              Font.Style = [fsBold]
                              ParentFont = False
                            end
                            object Label49: TLabel
                              Left = 34
                              Top = 62
                              Width = 88
                              Height = 13
                              Alignment = taRightJustify
                              Caption = 'Popularidade (%):'
                            end
                            object Label50: TLabel
                              Left = 192
                              Top = 62
                              Width = 102
                              Height = 13
                              Alignment = taRightJustify
                              Caption = 'N'#237'vel Giro M'#233'dio (%):'
                            end
                            object Label51: TLabel
                              Left = 367
                              Top = 62
                              Width = 71
                              Height = 13
                              Alignment = taRightJustify
                              Caption = 'Demanda (%):'
                            end
                            object Label53: TLabel
                              Left = 49
                              Top = 78
                              Width = 66
                              Height = 13
                              Caption = 'Giro Padr'#227'o'
                              Font.Charset = DEFAULT_CHARSET
                              Font.Color = clWindowText
                              Font.Height = -11
                              Font.Name = 'Tahoma'
                              Font.Style = [fsBold]
                              ParentFont = False
                            end
                            object Label54: TLabel
                              Left = 92
                              Top = 95
                              Width = 30
                              Height = 13
                              Alignment = taRightJustify
                              Caption = 'Baixo:'
                            end
                            object Label55: TLabel
                              Left = 191
                              Top = 95
                              Width = 4
                              Height = 13
                              Alignment = taRightJustify
                              Caption = '/'
                            end
                            object Label56: TLabel
                              Left = 351
                              Top = 95
                              Width = 32
                              Height = 13
                              Alignment = taRightJustify
                              Caption = 'M'#233'dio:'
                            end
                            object Label57: TLabel
                              Left = 450
                              Top = 95
                              Width = 4
                              Height = 13
                              Alignment = taRightJustify
                              Caption = '/'
                            end
                            object Label52: TLabel
                              Left = 508
                              Top = 62
                              Width = 79
                              Height = 13
                              Alignment = taRightJustify
                              Caption = 'Frequ'#234'ncia (%):'
                            end
                            object Label58: TLabel
                              Left = 661
                              Top = 62
                              Width = 53
                              Height = 13
                              Alignment = taRightJustify
                              Caption = 'Pre'#231'o (%):'
                            end
                            object Label59: TLabel
                              Left = 616
                              Top = 95
                              Width = 23
                              Height = 13
                              Alignment = taRightJustify
                              Caption = 'Alto:'
                            end
                            object Label60: TLabel
                              Left = 706
                              Top = 95
                              Width = 4
                              Height = 13
                              Alignment = taRightJustify
                              Caption = '/'
                            end
                            object Bevel2: TBevel
                              Left = 128
                              Top = 86
                              Width = 640
                              Height = 2
                              Shape = bsTopLine
                            end
                            object Label61: TLabel
                              Left = 10
                              Top = 26
                              Width = 112
                              Height = 13
                              Alignment = taRightJustify
                              Caption = 'Utilizar Recomenda'#231#227'o:'
                              FocusControl = DBEditChaveAssignPlug
                            end
                            object Label62: TLabel
                              Left = 281
                              Top = 26
                              Width = 157
                              Height = 13
                              Alignment = taRightJustify
                              Caption = 'Intervalo Treino Recomenda'#231#227'o:'
                            end
                            object Label64: TLabel
                              Left = 571
                              Top = 26
                              Width = 143
                              Height = 13
                              Alignment = taRightJustify
                              Caption = 'Dias de Venda Recomendado:'
                            end
                            object DBEditPesoPopularidadeHwCloudIA: TDBEdit
                              Left = 128
                              Top = 59
                              Width = 50
                              Height = 21
                              DataField = 'PESO_POPULARIDADE'
                              DataSource = dtmConfig.dsConfigAPI
                              TabOrder = 3
                            end
                            object DBEditPesoNivelGiroMedioHwCloudIA: TDBEdit
                              Left = 300
                              Top = 59
                              Width = 50
                              Height = 21
                              DataField = 'PESO_NIVEL_GIRO_MEDIO'
                              DataSource = dtmConfig.dsConfigAPI
                              TabOrder = 4
                            end
                            object DBEditPesoDemandaHwCloudIA: TDBEdit
                              Left = 444
                              Top = 59
                              Width = 50
                              Height = 21
                              DataField = 'PESO_DEMANDA'
                              DataSource = dtmConfig.dsConfigAPI
                              TabOrder = 5
                            end
                            object DBEditGiroBaixaIniHwCloudIA: TDBEdit
                              Left = 128
                              Top = 92
                              Width = 50
                              Height = 21
                              DataField = 'GIRO_PADRAO_BAIXO_INI'
                              DataSource = dtmConfig.dsConfigAPI
                              TabOrder = 8
                            end
                            object DBEditGiroBaixoFimHwCloudIA: TDBEdit
                              Left = 204
                              Top = 92
                              Width = 50
                              Height = 21
                              DataField = 'GIRO_PADRAO_BAIXO_FIM'
                              DataSource = dtmConfig.dsConfigAPI
                              TabOrder = 9
                            end
                            object DBEditGiroMedioIniHwCloudIA: TDBEdit
                              Left = 389
                              Top = 92
                              Width = 50
                              Height = 21
                              DataField = 'GIRO_PADRAO_MEDIO_INI'
                              DataSource = dtmConfig.dsConfigAPI
                              TabOrder = 10
                            end
                            object DBEditGiroMedioFimHwCloudIA: TDBEdit
                              Left = 465
                              Top = 92
                              Width = 50
                              Height = 21
                              DataField = 'GIRO_PADRAO_MEDIO_FIM'
                              DataSource = dtmConfig.dsConfigAPI
                              TabOrder = 11
                            end
                            object DBEditPesoFrequenciaHwCloudIA: TDBEdit
                              Left = 594
                              Top = 59
                              Width = 50
                              Height = 21
                              DataField = 'PESO_FREQUENCIA'
                              DataSource = dtmConfig.dsConfigAPI
                              TabOrder = 6
                            end
                            object DBEditPesoPrecoHwCloudIA: TDBEdit
                              Left = 720
                              Top = 59
                              Width = 50
                              Height = 21
                              DataField = 'PESO_PRECO'
                              DataSource = dtmConfig.dsConfigAPI
                              TabOrder = 7
                            end
                            object DBEditGiroAltoIniHwCloudIA: TDBEdit
                              Left = 645
                              Top = 92
                              Width = 50
                              Height = 21
                              DataField = 'GIRO_PADRAO_ALTO_INI'
                              DataSource = dtmConfig.dsConfigAPI
                              TabOrder = 12
                            end
                            object DBEditGiroAltoFimHwCloudIA: TDBEdit
                              Left = 720
                              Top = 92
                              Width = 50
                              Height = 21
                              DataField = 'GIRO_PADRAO_ALTO_FIM'
                              DataSource = dtmConfig.dsConfigAPI
                              TabOrder = 13
                            end
                            object DBComboBoxUtilRecomendacaoHwCloudIA: TDBComboBox
                              Left = 128
                              Top = 23
                              Width = 63
                              Height = 21
                              Style = csDropDownList
                              DataField = 'UTIL_RECOMENDACAO'
                              DataSource = dtmConfig.dsConfigAPI
                              ItemHeight = 13
                              Items.Strings = (
                                'S - SIM'
                                'N - N'#195'O')
                              TabOrder = 0
                            end
                            object DBEditIntervTreinoRecomendaHwCloudIA: TDBEdit
                              Left = 444
                              Top = 23
                              Width = 50
                              Height = 21
                              DataField = 'INTERV_TREINO_RECOMENDA'
                              DataSource = dtmConfig.dsConfigAPI
                              TabOrder = 1
                            end
                            object DBEditDiasVndRecomendaHwCloudIA: TDBEdit
                              Left = 720
                              Top = 23
                              Width = 50
                              Height = 21
                              DataField = 'DIAS_VND_RECOMENDA'
                              DataSource = dtmConfig.dsConfigAPI
                              TabOrder = 2
                            end
                          end
                        end
                        object TabSheet8: TTabSheet
                          Caption = 'Pedidos'
                          ImageIndex = 4
                          object GroupBox20: TGroupBox
                            Left = 0
                            Top = 0
                            Width = 784
                            Height = 143
                            Align = alClient
                            Caption = 'Pedidos'
                            TabOrder = 0
                            object Label73: TLabel
                              Left = 74
                              Top = 95
                              Width = 50
                              Height = 13
                              Alignment = taRightJustify
                              Caption = 'Vendedor:'
                            end
                            object Label75: TLabel
                              Left = 35
                              Top = 16
                              Width = 89
                              Height = 13
                              Alignment = taRightJustify
                              Caption = 'Tipo Venda (REQ):'
                            end
                            object Label76: TLabel
                              Left = 358
                              Top = 16
                              Width = 82
                              Height = 13
                              Alignment = taRightJustify
                              Caption = 'Tipo Venda (OS):'
                              FocusControl = DBComboBoxTipoVendaPadraoOSHwCloudIA
                            end
                            object Label93: TLabel
                              Left = 49
                              Top = 69
                              Width = 75
                              Height = 13
                              Alignment = taRightJustify
                              Caption = 'Tipo de Cliente:'
                            end
                            object Label94: TLabel
                              Left = 4
                              Top = 41
                              Width = 120
                              Height = 13
                              Alignment = taRightJustify
                              Caption = 'Condi'#231#227'o de Pagamento:'
                            end
                            object EditHwVendedorHwCloudIA: TEditHw
                              Left = 130
                              Top = 92
                              Width = 63
                              Height = 21
                              TabOrder = 6
                              Text = '                 0'
                              OnExit = EditHwVendedorHwCloudIAExit
                              OnKeyDown = EditHwVendedorHwCloudIAKeyDown
                              Formato = fInteger
                              FormatSize = '0.2'
                            end
                            object DBLookupComboBoxVendedorHwCloudIA: TDBLookupComboBox
                              Left = 199
                              Top = 92
                              Width = 573
                              Height = 21
                              KeyField = 'COD_VENDEDOR'
                              ListField = 'NOME_VENDEDOR'
                              ListSource = dtmConfig.dsConfigAPIvendedor
                              TabOrder = 7
                              OnExit = DBLookupComboBoxVendedorHwCloudIAExit
                            end
                            object DBComboBoxTipoVendaPadraoOSHwCloudIA: TDBComboBox
                              Left = 446
                              Top = 11
                              Width = 159
                              Height = 21
                              Style = csDropDownList
                              DataField = 'TIPO_OS'
                              DataSource = dtmConfig.dsConfigAPI
                              ItemHeight = 13
                              TabOrder = 1
                              OnExit = DBComboBoxUsarAPICogHwCloudIAExit
                            end
                            object DBComboBoxTipoVendaPadraoREQHwCloudIA: TDBComboBox
                              Left = 130
                              Top = 11
                              Width = 159
                              Height = 21
                              Style = csDropDownList
                              DataField = 'TIPO_VENDA'
                              DataSource = dtmConfig.dsConfigAPI
                              ItemHeight = 13
                              TabOrder = 0
                            end
                            object EditHwTipoClienteHwCloudIA: TEditHw
                              Left = 130
                              Top = 66
                              Width = 63
                              Height = 21
                              TabOrder = 4
                              Text = '                 0'
                              OnExit = EditHwTipoClienteHwCloudIAExit
                              OnKeyDown = EditHwTipoClienteHwCloudIAKeyDown
                              Formato = fInteger
                              FormatSize = '0.2'
                            end
                            object DBLookupComboBoxTipoClienteHwCLoudIA: TDBLookupComboBox
                              Left = 199
                              Top = 66
                              Width = 573
                              Height = 21
                              KeyField = 'CODIGO_TIPO'
                              ListField = 'DESCRICAO_TIPO'
                              ListSource = dtmConfig.dsConfigAPItipocliente
                              TabOrder = 5
                              OnExit = DBLookupComboBoxTipoClienteHwCLoudIAExit
                            end
                            object EditHwCondPagHwCloudIA: TEditHw
                              Left = 130
                              Top = 39
                              Width = 63
                              Height = 21
                              TabOrder = 2
                              Text = '                 0'
                              OnExit = EditHwCondPagHwCloudIAExit
                              OnKeyDown = EditHwCondPagHwCloudIAKeyDown
                              Formato = fInteger
                              FormatSize = '0.2'
                            end
                            object DBLookupComboBoxCondPagHwCloudIA: TDBLookupComboBox
                              Left = 199
                              Top = 39
                              Width = 573
                              Height = 21
                              KeyField = 'COD_COND_PAG'
                              ListField = 'DESC_COND_PAG'
                              ListSource = dtmConfig.dsConfigAPIcondpag
                              TabOrder = 3
                              OnExit = DBLookupComboBoxCondPagHwCloudIAExit
                            end
                          end
                        end
                        object TabSheet7: TTabSheet
                          Caption = #205'cones'
                          ImageIndex = 3
                          object GroupBox19: TGroupBox
                            Left = 0
                            Top = 0
                            Width = 784
                            Height = 143
                            Align = alClient
                            Caption = #205'cones'
                            TabOrder = 0
                            object Label88: TLabel
                              Left = 20
                              Top = 33
                              Width = 71
                              Height = 13
                              Alignment = taRightJustify
                              Caption = 'Logo Empresa:'
                            end
                            object Label89: TLabel
                              Left = 6
                              Top = 61
                              Width = 85
                              Height = 13
                              Alignment = taRightJustify
                              Caption = 'Favicon Empresa:'
                            end
                            object btCaminhoLogoEmpresa: TSpeedButton
                              Left = 741
                              Top = 29
                              Width = 23
                              Height = 22
                              Hint = 'Selecione a Imagem'
                              Flat = True
                              Glyph.Data = {
                                2E030000424D2E030000000000002E0200002800000010000000100000000100
                                08000000000000010000120B0000120B00007E0000007E00000000000000FFFF
                                FF00FF00FF00922B0100862D0500AD887700C9967500E6AA7A00EABC9800F898
                                2900FFD8AA00726C6200A79365005D624900697B4C0070756B00AAE3C400148B
                                5C000E84570087C4B000079168009CD0C000AFE5D5008BCBBA0087BFB20083BA
                                AF0097DCD00093DCD10097DACF0089C2BA0097E0D8007DC4BD007FCAC50082C6
                                C2003CC4BF0095CFCC0086DEDD007EC6C5007DFEFF0083FEFF0084FEFF0084FF
                                FF0089FFFF008AFFFF0078CFD00096FFFF007FD4D500A1FFFF0076B4B4007AFA
                                FF007EFCFF0076CED00069AFB1009FFCFE0073F7FF007AF8FF007DF8FF0080F8
                                FF0084EBF00090FAFF00A0F8FC0069F3FF006DF4FF0072F3FF0073F3FF0075F6
                                FF0077F4FF0079F4FF0079F3FE007BF4FF007DF6FF0092F2FB009AF4FB009EE5
                                EA0086BFC4005AC9D50077F3FF0078F3FF0079F3FF0077E3EE005DADB50080EA
                                F70082EEFA0083EAF40065EEFF0068EEFF0072EFFF0073EFFF0074EFFF0076EE
                                FF0076F0FF007AEFFF0092E7F400B4EFF70054D8F0006BE7FB006AE2F70070D9
                                EB0083BAC40068E5FF0052919D004DCBEA005BD9F80068DDFA0060CCE60088D8
                                EB0084BFCC0004B4E30044C4E50052C1E10039B7E00057D0F6004099B40075CB
                                E60027A6D50040C1EF0042C4F4004DCAF6004CB6DC001896CA001FA1D40028A4
                                D3000D8EC7001490C9001996CC001E96CB00027D7D7D02020202020202020202
                                02027D5C5E6C6E7D7D7A02020202020202027D5D2927394460657D7D7A020202
                                02027D712D41434D4E4645595F7D020202027A793C36434C5A5857574F637802
                                02027A7D6D28424C5A58403319687D0202027A7D762F3E3F56402C1D1C30617D
                                02027A6F7D6948473B2E201E1A21187D02027A67737D7D7D701F3A241B251713
                                7D027A5B6675740F037D4B49162315107D027A2A32555003070B7D77776A624A
                                7D037A2B31433D3403050D126B77777703027A35263738546403080C14220903
                                02020277535152727A02030A0E110302020202027B777C7A0202020306040202
                                020202020202020202020202030202020202}
                              ParentShowHint = False
                              ShowHint = True
                              OnClick = btCaminhoLogoEmpresaClick
                            end
                            object btCaminhoFaviconEmpresa: TSpeedButton
                              Left = 741
                              Top = 57
                              Width = 23
                              Height = 22
                              Hint = 'Selecione a Imagem'
                              Flat = True
                              Glyph.Data = {
                                2E030000424D2E030000000000002E0200002800000010000000100000000100
                                08000000000000010000120B0000120B00007E0000007E00000000000000FFFF
                                FF00FF00FF00922B0100862D0500AD887700C9967500E6AA7A00EABC9800F898
                                2900FFD8AA00726C6200A79365005D624900697B4C0070756B00AAE3C400148B
                                5C000E84570087C4B000079168009CD0C000AFE5D5008BCBBA0087BFB20083BA
                                AF0097DCD00093DCD10097DACF0089C2BA0097E0D8007DC4BD007FCAC50082C6
                                C2003CC4BF0095CFCC0086DEDD007EC6C5007DFEFF0083FEFF0084FEFF0084FF
                                FF0089FFFF008AFFFF0078CFD00096FFFF007FD4D500A1FFFF0076B4B4007AFA
                                FF007EFCFF0076CED00069AFB1009FFCFE0073F7FF007AF8FF007DF8FF0080F8
                                FF0084EBF00090FAFF00A0F8FC0069F3FF006DF4FF0072F3FF0073F3FF0075F6
                                FF0077F4FF0079F4FF0079F3FE007BF4FF007DF6FF0092F2FB009AF4FB009EE5
                                EA0086BFC4005AC9D50077F3FF0078F3FF0079F3FF0077E3EE005DADB50080EA
                                F70082EEFA0083EAF40065EEFF0068EEFF0072EFFF0073EFFF0074EFFF0076EE
                                FF0076F0FF007AEFFF0092E7F400B4EFF70054D8F0006BE7FB006AE2F70070D9
                                EB0083BAC40068E5FF0052919D004DCBEA005BD9F80068DDFA0060CCE60088D8
                                EB0084BFCC0004B4E30044C4E50052C1E10039B7E00057D0F6004099B40075CB
                                E60027A6D50040C1EF0042C4F4004DCAF6004CB6DC001896CA001FA1D40028A4
                                D3000D8EC7001490C9001996CC001E96CB00027D7D7D02020202020202020202
                                02027D5C5E6C6E7D7D7A02020202020202027D5D2927394460657D7D7A020202
                                02027D712D41434D4E4645595F7D020202027A793C36434C5A5857574F637802
                                02027A7D6D28424C5A58403319687D0202027A7D762F3E3F56402C1D1C30617D
                                02027A6F7D6948473B2E201E1A21187D02027A67737D7D7D701F3A241B251713
                                7D027A5B6675740F037D4B49162315107D027A2A32555003070B7D77776A624A
                                7D037A2B31433D3403050D126B77777703027A35263738546403080C14220903
                                02020277535152727A02030A0E110302020202027B777C7A0202020306040202
                                020202020202020202020202030202020202}
                              ParentShowHint = False
                              ShowHint = True
                              OnClick = btCaminhoFaviconEmpresaClick
                            end
                            object DBEditLogoEmpHwCloudIA: TDBEdit
                              Left = 97
                              Top = 30
                              Width = 642
                              Height = 21
                              Color = cl3DLight
                              DataField = 'CAMINHO_LOGO_EMP'
                              DataSource = dtmConfig.dsConfigAPI
                              Enabled = False
                              TabOrder = 0
                            end
                            object DBEditFaviconEmpresaHwCloudIA: TDBEdit
                              Left = 97
                              Top = 58
                              Width = 642
                              Height = 21
                              Color = cl3DLight
                              DataField = 'CAMINHO_FAVICON_EMP'
                              DataSource = dtmConfig.dsConfigAPI
                              Enabled = False
                              TabOrder = 1
                            end
                          end
                        end
                        object TabSheet4: TTabSheet
                          Caption = 'White Label'
                          ImageIndex = 2
                          object GroupBox18: TGroupBox
                            Left = 0
                            Top = 0
                            Width = 784
                            Height = 143
                            Align = alClient
                            Caption = 'White Label'
                            TabOrder = 0
                            object Label77: TLabel
                              Left = 72
                              Top = 25
                              Width = 61
                              Height = 13
                              Alignment = taRightJustify
                              Caption = 'cor_primary:'
                            end
                            object Label78: TLabel
                              Left = 21
                              Top = 54
                              Width = 112
                              Height = 13
                              Alignment = taRightJustify
                              Caption = 'cor_primary_container:'
                            end
                            object Label79: TLabel
                              Left = 42
                              Top = 82
                              Width = 91
                              Height = 13
                              Alignment = taRightJustify
                              Caption = 'cor_primary_fixed:'
                            end
                            object Label80: TLabel
                              Left = 54
                              Top = 110
                              Width = 79
                              Height = 13
                              Alignment = taRightJustify
                              Caption = 'cor_on_primary:'
                            end
                            object btCorPrimary: TSpeedButton
                              Left = 203
                              Top = 19
                              Width = 23
                              Height = 25
                              Hint = 'Selecione a cor para o Texto'
                              Flat = True
                              Glyph.Data = {
                                CE040000424DCE04000000000000360000002800000012000000150000000100
                                1800000000009804000000000000000000000000000000000000CED3D6CED3D6
                                CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3
                                D6CED3D6CED3D6CED3D6CED3D6CED3D60000CED3D6CED3D6CED3D6CED3D6CED3
                                D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CE
                                D3D6CED3D6CED3D60000CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CE
                                D3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6000000CED3D6CED3D6CED3D6
                                0000CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6
                                CED3D6CED3D6CED3D6000000000000000000CED3D6CED3D60000CED3D6CED3D6
                                CED3D6CED3D6CED3D6000000000000000000000000000000CED3D6CED3D60000
                                00000000000000000000000000CED3D60000CED3D6CED3D6CED3D6CED3D60000
                                0000FFFFFFFFFF00FFFFFFFFFF00FFFF000000000000CED3D6CED3D6CED3D6CE
                                D3D6CED3D6CED3D60000CED3D6CED3D6CED3D6CED3D6000000CED3D6000000CE
                                D3D600FFFFFFFFFF00FFFFFFFFFF000000CED3D6CED3D6CED3D6CED3D6CED3D6
                                0000CED3D6CED3D6CED3D6CED3D6CED3D6000000FFFF00000000CED3D6000000
                                CED3D600FFFF000000CED3D6CED3D6CED3D6CED3D6CED3D60000CED3D6CED3D6
                                CED3D6CED3D6000000CED3D6000000CED3D60000000000FF000000FFFFFF00FF
                                FF000000CED3D6CED3D6CED3D6CED3D60000CED3D6CED3D60000000000000000
                                0000FFFFFFFFFF00FFFFCED3D6000000CED3D600FFFFFFFFFF000000CED3D6CE
                                D3D6CED3D6CED3D60000CED3D600000000FFFFFFFFFF00FFFFFFFFFF00FFFFFF
                                FFFF00FFFFCED3D6000000CED3D600FFFF000000CED3D6CED3D6CED3D6CED3D6
                                0000CED3D6000000FFFFFFCED3D6000000CED3D6FFFFFF00FFFFFFFFFF000000
                                CED3D6000000FFFFFF000000CED3D6CED3D6CED3D6CED3D60000CED3D6000000
                                00FFFF000000840084000000CED3D6000000CED3D6CED3D6000000CED3D600FF
                                FF000000CED3D6CED3D6CED3D6CED3D60000CED3D6000000FFFFFFCED3D60000
                                00CED3D6000000FFFFFF00000000FFFFFFFFFF00FFFF000000CED3D6CED3D6CE
                                D3D6CED3D6CED3D60000CED3D6CED3D6000000FFFFFF00FFFFFFFFFFCED3D600
                                0000CED3D6FFFFFF00FFFF000000CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6
                                0000CED3D6CED3D6CED3D600000000000000FFFFFFFFFF00FFFFFFFFFF000000
                                000000CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D60000CED3D6CED3D6
                                CED3D6CED3D6CED3D6000000000000000000000000CED3D6CED3D6CED3D6CED3
                                D6CED3D6CED3D6CED3D6CED3D6CED3D60000CED3D6CED3D6CED3D6CED3D6CED3
                                D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CE
                                D3D6CED3D6CED3D60000CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CE
                                D3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6
                                0000CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6
                                CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D60000CED3D6CED3D6
                                CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3
                                D6CED3D6CED3D6CED3D6CED3D6CED3D60000}
                              OnClick = btCorPrimaryClick
                            end
                            object btCorPrimaryContainer: TSpeedButton
                              Left = 203
                              Top = 48
                              Width = 23
                              Height = 25
                              Hint = 'Selecione a cor para o Texto'
                              Flat = True
                              Glyph.Data = {
                                CE040000424DCE04000000000000360000002800000012000000150000000100
                                1800000000009804000000000000000000000000000000000000CED3D6CED3D6
                                CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3
                                D6CED3D6CED3D6CED3D6CED3D6CED3D60000CED3D6CED3D6CED3D6CED3D6CED3
                                D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CE
                                D3D6CED3D6CED3D60000CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CE
                                D3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6000000CED3D6CED3D6CED3D6
                                0000CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6
                                CED3D6CED3D6CED3D6000000000000000000CED3D6CED3D60000CED3D6CED3D6
                                CED3D6CED3D6CED3D6000000000000000000000000000000CED3D6CED3D60000
                                00000000000000000000000000CED3D60000CED3D6CED3D6CED3D6CED3D60000
                                0000FFFFFFFFFF00FFFFFFFFFF00FFFF000000000000CED3D6CED3D6CED3D6CE
                                D3D6CED3D6CED3D60000CED3D6CED3D6CED3D6CED3D6000000CED3D6000000CE
                                D3D600FFFFFFFFFF00FFFFFFFFFF000000CED3D6CED3D6CED3D6CED3D6CED3D6
                                0000CED3D6CED3D6CED3D6CED3D6CED3D6000000FFFF00000000CED3D6000000
                                CED3D600FFFF000000CED3D6CED3D6CED3D6CED3D6CED3D60000CED3D6CED3D6
                                CED3D6CED3D6000000CED3D6000000CED3D60000000000FF000000FFFFFF00FF
                                FF000000CED3D6CED3D6CED3D6CED3D60000CED3D6CED3D60000000000000000
                                0000FFFFFFFFFF00FFFFCED3D6000000CED3D600FFFFFFFFFF000000CED3D6CE
                                D3D6CED3D6CED3D60000CED3D600000000FFFFFFFFFF00FFFFFFFFFF00FFFFFF
                                FFFF00FFFFCED3D6000000CED3D600FFFF000000CED3D6CED3D6CED3D6CED3D6
                                0000CED3D6000000FFFFFFCED3D6000000CED3D6FFFFFF00FFFFFFFFFF000000
                                CED3D6000000FFFFFF000000CED3D6CED3D6CED3D6CED3D60000CED3D6000000
                                00FFFF000000840084000000CED3D6000000CED3D6CED3D6000000CED3D600FF
                                FF000000CED3D6CED3D6CED3D6CED3D60000CED3D6000000FFFFFFCED3D60000
                                00CED3D6000000FFFFFF00000000FFFFFFFFFF00FFFF000000CED3D6CED3D6CE
                                D3D6CED3D6CED3D60000CED3D6CED3D6000000FFFFFF00FFFFFFFFFFCED3D600
                                0000CED3D6FFFFFF00FFFF000000CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6
                                0000CED3D6CED3D6CED3D600000000000000FFFFFFFFFF00FFFFFFFFFF000000
                                000000CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D60000CED3D6CED3D6
                                CED3D6CED3D6CED3D6000000000000000000000000CED3D6CED3D6CED3D6CED3
                                D6CED3D6CED3D6CED3D6CED3D6CED3D60000CED3D6CED3D6CED3D6CED3D6CED3
                                D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CE
                                D3D6CED3D6CED3D60000CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CE
                                D3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6
                                0000CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6
                                CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D60000CED3D6CED3D6
                                CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3
                                D6CED3D6CED3D6CED3D6CED3D6CED3D60000}
                              OnClick = btCorPrimaryContainerClick
                            end
                            object btCorPrimaryFixed: TSpeedButton
                              Left = 203
                              Top = 76
                              Width = 23
                              Height = 25
                              Hint = 'Selecione a cor para o Texto'
                              Flat = True
                              Glyph.Data = {
                                CE040000424DCE04000000000000360000002800000012000000150000000100
                                1800000000009804000000000000000000000000000000000000CED3D6CED3D6
                                CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3
                                D6CED3D6CED3D6CED3D6CED3D6CED3D60000CED3D6CED3D6CED3D6CED3D6CED3
                                D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CE
                                D3D6CED3D6CED3D60000CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CE
                                D3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6000000CED3D6CED3D6CED3D6
                                0000CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6
                                CED3D6CED3D6CED3D6000000000000000000CED3D6CED3D60000CED3D6CED3D6
                                CED3D6CED3D6CED3D6000000000000000000000000000000CED3D6CED3D60000
                                00000000000000000000000000CED3D60000CED3D6CED3D6CED3D6CED3D60000
                                0000FFFFFFFFFF00FFFFFFFFFF00FFFF000000000000CED3D6CED3D6CED3D6CE
                                D3D6CED3D6CED3D60000CED3D6CED3D6CED3D6CED3D6000000CED3D6000000CE
                                D3D600FFFFFFFFFF00FFFFFFFFFF000000CED3D6CED3D6CED3D6CED3D6CED3D6
                                0000CED3D6CED3D6CED3D6CED3D6CED3D6000000FFFF00000000CED3D6000000
                                CED3D600FFFF000000CED3D6CED3D6CED3D6CED3D6CED3D60000CED3D6CED3D6
                                CED3D6CED3D6000000CED3D6000000CED3D60000000000FF000000FFFFFF00FF
                                FF000000CED3D6CED3D6CED3D6CED3D60000CED3D6CED3D60000000000000000
                                0000FFFFFFFFFF00FFFFCED3D6000000CED3D600FFFFFFFFFF000000CED3D6CE
                                D3D6CED3D6CED3D60000CED3D600000000FFFFFFFFFF00FFFFFFFFFF00FFFFFF
                                FFFF00FFFFCED3D6000000CED3D600FFFF000000CED3D6CED3D6CED3D6CED3D6
                                0000CED3D6000000FFFFFFCED3D6000000CED3D6FFFFFF00FFFFFFFFFF000000
                                CED3D6000000FFFFFF000000CED3D6CED3D6CED3D6CED3D60000CED3D6000000
                                00FFFF000000840084000000CED3D6000000CED3D6CED3D6000000CED3D600FF
                                FF000000CED3D6CED3D6CED3D6CED3D60000CED3D6000000FFFFFFCED3D60000
                                00CED3D6000000FFFFFF00000000FFFFFFFFFF00FFFF000000CED3D6CED3D6CE
                                D3D6CED3D6CED3D60000CED3D6CED3D6000000FFFFFF00FFFFFFFFFFCED3D600
                                0000CED3D6FFFFFF00FFFF000000CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6
                                0000CED3D6CED3D6CED3D600000000000000FFFFFFFFFF00FFFFFFFFFF000000
                                000000CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D60000CED3D6CED3D6
                                CED3D6CED3D6CED3D6000000000000000000000000CED3D6CED3D6CED3D6CED3
                                D6CED3D6CED3D6CED3D6CED3D6CED3D60000CED3D6CED3D6CED3D6CED3D6CED3
                                D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CE
                                D3D6CED3D6CED3D60000CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CE
                                D3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6
                                0000CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6
                                CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D60000CED3D6CED3D6
                                CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3
                                D6CED3D6CED3D6CED3D6CED3D6CED3D60000}
                              OnClick = btCorPrimaryFixedClick
                            end
                            object btCorOnPrimary: TSpeedButton
                              Left = 203
                              Top = 105
                              Width = 23
                              Height = 25
                              Hint = 'Selecione a cor para o Texto'
                              Flat = True
                              Glyph.Data = {
                                CE040000424DCE04000000000000360000002800000012000000150000000100
                                1800000000009804000000000000000000000000000000000000CED3D6CED3D6
                                CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3
                                D6CED3D6CED3D6CED3D6CED3D6CED3D60000CED3D6CED3D6CED3D6CED3D6CED3
                                D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CE
                                D3D6CED3D6CED3D60000CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CE
                                D3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6000000CED3D6CED3D6CED3D6
                                0000CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6
                                CED3D6CED3D6CED3D6000000000000000000CED3D6CED3D60000CED3D6CED3D6
                                CED3D6CED3D6CED3D6000000000000000000000000000000CED3D6CED3D60000
                                00000000000000000000000000CED3D60000CED3D6CED3D6CED3D6CED3D60000
                                0000FFFFFFFFFF00FFFFFFFFFF00FFFF000000000000CED3D6CED3D6CED3D6CE
                                D3D6CED3D6CED3D60000CED3D6CED3D6CED3D6CED3D6000000CED3D6000000CE
                                D3D600FFFFFFFFFF00FFFFFFFFFF000000CED3D6CED3D6CED3D6CED3D6CED3D6
                                0000CED3D6CED3D6CED3D6CED3D6CED3D6000000FFFF00000000CED3D6000000
                                CED3D600FFFF000000CED3D6CED3D6CED3D6CED3D6CED3D60000CED3D6CED3D6
                                CED3D6CED3D6000000CED3D6000000CED3D60000000000FF000000FFFFFF00FF
                                FF000000CED3D6CED3D6CED3D6CED3D60000CED3D6CED3D60000000000000000
                                0000FFFFFFFFFF00FFFFCED3D6000000CED3D600FFFFFFFFFF000000CED3D6CE
                                D3D6CED3D6CED3D60000CED3D600000000FFFFFFFFFF00FFFFFFFFFF00FFFFFF
                                FFFF00FFFFCED3D6000000CED3D600FFFF000000CED3D6CED3D6CED3D6CED3D6
                                0000CED3D6000000FFFFFFCED3D6000000CED3D6FFFFFF00FFFFFFFFFF000000
                                CED3D6000000FFFFFF000000CED3D6CED3D6CED3D6CED3D60000CED3D6000000
                                00FFFF000000840084000000CED3D6000000CED3D6CED3D6000000CED3D600FF
                                FF000000CED3D6CED3D6CED3D6CED3D60000CED3D6000000FFFFFFCED3D60000
                                00CED3D6000000FFFFFF00000000FFFFFFFFFF00FFFF000000CED3D6CED3D6CE
                                D3D6CED3D6CED3D60000CED3D6CED3D6000000FFFFFF00FFFFFFFFFFCED3D600
                                0000CED3D6FFFFFF00FFFF000000CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6
                                0000CED3D6CED3D6CED3D600000000000000FFFFFFFFFF00FFFFFFFFFF000000
                                000000CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D60000CED3D6CED3D6
                                CED3D6CED3D6CED3D6000000000000000000000000CED3D6CED3D6CED3D6CED3
                                D6CED3D6CED3D6CED3D6CED3D6CED3D60000CED3D6CED3D6CED3D6CED3D6CED3
                                D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CE
                                D3D6CED3D6CED3D60000CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CE
                                D3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6
                                0000CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6
                                CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D60000CED3D6CED3D6
                                CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3
                                D6CED3D6CED3D6CED3D6CED3D6CED3D60000}
                              OnClick = btCorOnPrimaryClick
                            end
                            object Label81: TLabel
                              Left = 298
                              Top = 25
                              Width = 75
                              Height = 13
                              Alignment = taRightJustify
                              Caption = 'cor_secondary:'
                            end
                            object btCorSecondary: TSpeedButton
                              Left = 443
                              Top = 19
                              Width = 23
                              Height = 25
                              Hint = 'Selecione a cor para o Texto'
                              Flat = True
                              Glyph.Data = {
                                CE040000424DCE04000000000000360000002800000012000000150000000100
                                1800000000009804000000000000000000000000000000000000CED3D6CED3D6
                                CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3
                                D6CED3D6CED3D6CED3D6CED3D6CED3D60000CED3D6CED3D6CED3D6CED3D6CED3
                                D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CE
                                D3D6CED3D6CED3D60000CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CE
                                D3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6000000CED3D6CED3D6CED3D6
                                0000CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6
                                CED3D6CED3D6CED3D6000000000000000000CED3D6CED3D60000CED3D6CED3D6
                                CED3D6CED3D6CED3D6000000000000000000000000000000CED3D6CED3D60000
                                00000000000000000000000000CED3D60000CED3D6CED3D6CED3D6CED3D60000
                                0000FFFFFFFFFF00FFFFFFFFFF00FFFF000000000000CED3D6CED3D6CED3D6CE
                                D3D6CED3D6CED3D60000CED3D6CED3D6CED3D6CED3D6000000CED3D6000000CE
                                D3D600FFFFFFFFFF00FFFFFFFFFF000000CED3D6CED3D6CED3D6CED3D6CED3D6
                                0000CED3D6CED3D6CED3D6CED3D6CED3D6000000FFFF00000000CED3D6000000
                                CED3D600FFFF000000CED3D6CED3D6CED3D6CED3D6CED3D60000CED3D6CED3D6
                                CED3D6CED3D6000000CED3D6000000CED3D60000000000FF000000FFFFFF00FF
                                FF000000CED3D6CED3D6CED3D6CED3D60000CED3D6CED3D60000000000000000
                                0000FFFFFFFFFF00FFFFCED3D6000000CED3D600FFFFFFFFFF000000CED3D6CE
                                D3D6CED3D6CED3D60000CED3D600000000FFFFFFFFFF00FFFFFFFFFF00FFFFFF
                                FFFF00FFFFCED3D6000000CED3D600FFFF000000CED3D6CED3D6CED3D6CED3D6
                                0000CED3D6000000FFFFFFCED3D6000000CED3D6FFFFFF00FFFFFFFFFF000000
                                CED3D6000000FFFFFF000000CED3D6CED3D6CED3D6CED3D60000CED3D6000000
                                00FFFF000000840084000000CED3D6000000CED3D6CED3D6000000CED3D600FF
                                FF000000CED3D6CED3D6CED3D6CED3D60000CED3D6000000FFFFFFCED3D60000
                                00CED3D6000000FFFFFF00000000FFFFFFFFFF00FFFF000000CED3D6CED3D6CE
                                D3D6CED3D6CED3D60000CED3D6CED3D6000000FFFFFF00FFFFFFFFFFCED3D600
                                0000CED3D6FFFFFF00FFFF000000CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6
                                0000CED3D6CED3D6CED3D600000000000000FFFFFFFFFF00FFFFFFFFFF000000
                                000000CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D60000CED3D6CED3D6
                                CED3D6CED3D6CED3D6000000000000000000000000CED3D6CED3D6CED3D6CED3
                                D6CED3D6CED3D6CED3D6CED3D6CED3D60000CED3D6CED3D6CED3D6CED3D6CED3
                                D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CE
                                D3D6CED3D6CED3D60000CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CE
                                D3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6
                                0000CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6
                                CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D60000CED3D6CED3D6
                                CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3
                                D6CED3D6CED3D6CED3D6CED3D6CED3D60000}
                              OnClick = btCorSecondaryClick
                            end
                            object Label82: TLabel
                              Left = 247
                              Top = 54
                              Width = 126
                              Height = 13
                              Alignment = taRightJustify
                              Caption = 'cor_secondary_container:'
                            end
                            object btCorSecondaryContainer: TSpeedButton
                              Left = 443
                              Top = 48
                              Width = 23
                              Height = 25
                              Hint = 'Selecione a cor para o Texto'
                              Flat = True
                              Glyph.Data = {
                                CE040000424DCE04000000000000360000002800000012000000150000000100
                                1800000000009804000000000000000000000000000000000000CED3D6CED3D6
                                CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3
                                D6CED3D6CED3D6CED3D6CED3D6CED3D60000CED3D6CED3D6CED3D6CED3D6CED3
                                D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CE
                                D3D6CED3D6CED3D60000CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CE
                                D3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6000000CED3D6CED3D6CED3D6
                                0000CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6
                                CED3D6CED3D6CED3D6000000000000000000CED3D6CED3D60000CED3D6CED3D6
                                CED3D6CED3D6CED3D6000000000000000000000000000000CED3D6CED3D60000
                                00000000000000000000000000CED3D60000CED3D6CED3D6CED3D6CED3D60000
                                0000FFFFFFFFFF00FFFFFFFFFF00FFFF000000000000CED3D6CED3D6CED3D6CE
                                D3D6CED3D6CED3D60000CED3D6CED3D6CED3D6CED3D6000000CED3D6000000CE
                                D3D600FFFFFFFFFF00FFFFFFFFFF000000CED3D6CED3D6CED3D6CED3D6CED3D6
                                0000CED3D6CED3D6CED3D6CED3D6CED3D6000000FFFF00000000CED3D6000000
                                CED3D600FFFF000000CED3D6CED3D6CED3D6CED3D6CED3D60000CED3D6CED3D6
                                CED3D6CED3D6000000CED3D6000000CED3D60000000000FF000000FFFFFF00FF
                                FF000000CED3D6CED3D6CED3D6CED3D60000CED3D6CED3D60000000000000000
                                0000FFFFFFFFFF00FFFFCED3D6000000CED3D600FFFFFFFFFF000000CED3D6CE
                                D3D6CED3D6CED3D60000CED3D600000000FFFFFFFFFF00FFFFFFFFFF00FFFFFF
                                FFFF00FFFFCED3D6000000CED3D600FFFF000000CED3D6CED3D6CED3D6CED3D6
                                0000CED3D6000000FFFFFFCED3D6000000CED3D6FFFFFF00FFFFFFFFFF000000
                                CED3D6000000FFFFFF000000CED3D6CED3D6CED3D6CED3D60000CED3D6000000
                                00FFFF000000840084000000CED3D6000000CED3D6CED3D6000000CED3D600FF
                                FF000000CED3D6CED3D6CED3D6CED3D60000CED3D6000000FFFFFFCED3D60000
                                00CED3D6000000FFFFFF00000000FFFFFFFFFF00FFFF000000CED3D6CED3D6CE
                                D3D6CED3D6CED3D60000CED3D6CED3D6000000FFFFFF00FFFFFFFFFFCED3D600
                                0000CED3D6FFFFFF00FFFF000000CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6
                                0000CED3D6CED3D6CED3D600000000000000FFFFFFFFFF00FFFFFFFFFF000000
                                000000CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D60000CED3D6CED3D6
                                CED3D6CED3D6CED3D6000000000000000000000000CED3D6CED3D6CED3D6CED3
                                D6CED3D6CED3D6CED3D6CED3D6CED3D60000CED3D6CED3D6CED3D6CED3D6CED3
                                D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CE
                                D3D6CED3D6CED3D60000CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CE
                                D3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6
                                0000CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6
                                CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D60000CED3D6CED3D6
                                CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3
                                D6CED3D6CED3D6CED3D6CED3D6CED3D60000}
                              OnClick = btCorSecondaryContainerClick
                            end
                            object Label83: TLabel
                              Left = 312
                              Top = 82
                              Width = 61
                              Height = 13
                              Alignment = taRightJustify
                              Caption = 'cor_tertiary:'
                            end
                            object btCorTertiary: TSpeedButton
                              Left = 443
                              Top = 76
                              Width = 23
                              Height = 25
                              Hint = 'Selecione a cor para o Texto'
                              Flat = True
                              Glyph.Data = {
                                CE040000424DCE04000000000000360000002800000012000000150000000100
                                1800000000009804000000000000000000000000000000000000CED3D6CED3D6
                                CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3
                                D6CED3D6CED3D6CED3D6CED3D6CED3D60000CED3D6CED3D6CED3D6CED3D6CED3
                                D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CE
                                D3D6CED3D6CED3D60000CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CE
                                D3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6000000CED3D6CED3D6CED3D6
                                0000CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6
                                CED3D6CED3D6CED3D6000000000000000000CED3D6CED3D60000CED3D6CED3D6
                                CED3D6CED3D6CED3D6000000000000000000000000000000CED3D6CED3D60000
                                00000000000000000000000000CED3D60000CED3D6CED3D6CED3D6CED3D60000
                                0000FFFFFFFFFF00FFFFFFFFFF00FFFF000000000000CED3D6CED3D6CED3D6CE
                                D3D6CED3D6CED3D60000CED3D6CED3D6CED3D6CED3D6000000CED3D6000000CE
                                D3D600FFFFFFFFFF00FFFFFFFFFF000000CED3D6CED3D6CED3D6CED3D6CED3D6
                                0000CED3D6CED3D6CED3D6CED3D6CED3D6000000FFFF00000000CED3D6000000
                                CED3D600FFFF000000CED3D6CED3D6CED3D6CED3D6CED3D60000CED3D6CED3D6
                                CED3D6CED3D6000000CED3D6000000CED3D60000000000FF000000FFFFFF00FF
                                FF000000CED3D6CED3D6CED3D6CED3D60000CED3D6CED3D60000000000000000
                                0000FFFFFFFFFF00FFFFCED3D6000000CED3D600FFFFFFFFFF000000CED3D6CE
                                D3D6CED3D6CED3D60000CED3D600000000FFFFFFFFFF00FFFFFFFFFF00FFFFFF
                                FFFF00FFFFCED3D6000000CED3D600FFFF000000CED3D6CED3D6CED3D6CED3D6
                                0000CED3D6000000FFFFFFCED3D6000000CED3D6FFFFFF00FFFFFFFFFF000000
                                CED3D6000000FFFFFF000000CED3D6CED3D6CED3D6CED3D60000CED3D6000000
                                00FFFF000000840084000000CED3D6000000CED3D6CED3D6000000CED3D600FF
                                FF000000CED3D6CED3D6CED3D6CED3D60000CED3D6000000FFFFFFCED3D60000
                                00CED3D6000000FFFFFF00000000FFFFFFFFFF00FFFF000000CED3D6CED3D6CE
                                D3D6CED3D6CED3D60000CED3D6CED3D6000000FFFFFF00FFFFFFFFFFCED3D600
                                0000CED3D6FFFFFF00FFFF000000CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6
                                0000CED3D6CED3D6CED3D600000000000000FFFFFFFFFF00FFFFFFFFFF000000
                                000000CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D60000CED3D6CED3D6
                                CED3D6CED3D6CED3D6000000000000000000000000CED3D6CED3D6CED3D6CED3
                                D6CED3D6CED3D6CED3D6CED3D6CED3D60000CED3D6CED3D6CED3D6CED3D6CED3
                                D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CE
                                D3D6CED3D6CED3D60000CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CE
                                D3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6
                                0000CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6
                                CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D60000CED3D6CED3D6
                                CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3
                                D6CED3D6CED3D6CED3D6CED3D6CED3D60000}
                              OnClick = btCorTertiaryClick
                            end
                            object Label84: TLabel
                              Left = 324
                              Top = 110
                              Width = 49
                              Height = 13
                              Alignment = taRightJustify
                              Caption = 'cor_error:'
                            end
                            object btCorError: TSpeedButton
                              Left = 443
                              Top = 104
                              Width = 23
                              Height = 25
                              Hint = 'Selecione a cor para o Texto'
                              Flat = True
                              Glyph.Data = {
                                CE040000424DCE04000000000000360000002800000012000000150000000100
                                1800000000009804000000000000000000000000000000000000CED3D6CED3D6
                                CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3
                                D6CED3D6CED3D6CED3D6CED3D6CED3D60000CED3D6CED3D6CED3D6CED3D6CED3
                                D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CE
                                D3D6CED3D6CED3D60000CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CE
                                D3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6000000CED3D6CED3D6CED3D6
                                0000CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6
                                CED3D6CED3D6CED3D6000000000000000000CED3D6CED3D60000CED3D6CED3D6
                                CED3D6CED3D6CED3D6000000000000000000000000000000CED3D6CED3D60000
                                00000000000000000000000000CED3D60000CED3D6CED3D6CED3D6CED3D60000
                                0000FFFFFFFFFF00FFFFFFFFFF00FFFF000000000000CED3D6CED3D6CED3D6CE
                                D3D6CED3D6CED3D60000CED3D6CED3D6CED3D6CED3D6000000CED3D6000000CE
                                D3D600FFFFFFFFFF00FFFFFFFFFF000000CED3D6CED3D6CED3D6CED3D6CED3D6
                                0000CED3D6CED3D6CED3D6CED3D6CED3D6000000FFFF00000000CED3D6000000
                                CED3D600FFFF000000CED3D6CED3D6CED3D6CED3D6CED3D60000CED3D6CED3D6
                                CED3D6CED3D6000000CED3D6000000CED3D60000000000FF000000FFFFFF00FF
                                FF000000CED3D6CED3D6CED3D6CED3D60000CED3D6CED3D60000000000000000
                                0000FFFFFFFFFF00FFFFCED3D6000000CED3D600FFFFFFFFFF000000CED3D6CE
                                D3D6CED3D6CED3D60000CED3D600000000FFFFFFFFFF00FFFFFFFFFF00FFFFFF
                                FFFF00FFFFCED3D6000000CED3D600FFFF000000CED3D6CED3D6CED3D6CED3D6
                                0000CED3D6000000FFFFFFCED3D6000000CED3D6FFFFFF00FFFFFFFFFF000000
                                CED3D6000000FFFFFF000000CED3D6CED3D6CED3D6CED3D60000CED3D6000000
                                00FFFF000000840084000000CED3D6000000CED3D6CED3D6000000CED3D600FF
                                FF000000CED3D6CED3D6CED3D6CED3D60000CED3D6000000FFFFFFCED3D60000
                                00CED3D6000000FFFFFF00000000FFFFFFFFFF00FFFF000000CED3D6CED3D6CE
                                D3D6CED3D6CED3D60000CED3D6CED3D6000000FFFFFF00FFFFFFFFFFCED3D600
                                0000CED3D6FFFFFF00FFFF000000CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6
                                0000CED3D6CED3D6CED3D600000000000000FFFFFFFFFF00FFFFFFFFFF000000
                                000000CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D60000CED3D6CED3D6
                                CED3D6CED3D6CED3D6000000000000000000000000CED3D6CED3D6CED3D6CED3
                                D6CED3D6CED3D6CED3D6CED3D6CED3D60000CED3D6CED3D6CED3D6CED3D6CED3
                                D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CE
                                D3D6CED3D6CED3D60000CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CE
                                D3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6
                                0000CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6
                                CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D60000CED3D6CED3D6
                                CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3
                                D6CED3D6CED3D6CED3D6CED3D6CED3D60000}
                              OnClick = btCorErrorClick
                            end
                            object Label85: TLabel
                              Left = 540
                              Top = 25
                              Width = 81
                              Height = 13
                              Alignment = taRightJustify
                              Caption = 'cor_background:'
                            end
                            object btCorBackGround: TSpeedButton
                              Left = 691
                              Top = 19
                              Width = 23
                              Height = 25
                              Hint = 'Selecione a cor para o Texto'
                              Flat = True
                              Glyph.Data = {
                                CE040000424DCE04000000000000360000002800000012000000150000000100
                                1800000000009804000000000000000000000000000000000000CED3D6CED3D6
                                CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3
                                D6CED3D6CED3D6CED3D6CED3D6CED3D60000CED3D6CED3D6CED3D6CED3D6CED3
                                D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CE
                                D3D6CED3D6CED3D60000CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CE
                                D3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6000000CED3D6CED3D6CED3D6
                                0000CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6
                                CED3D6CED3D6CED3D6000000000000000000CED3D6CED3D60000CED3D6CED3D6
                                CED3D6CED3D6CED3D6000000000000000000000000000000CED3D6CED3D60000
                                00000000000000000000000000CED3D60000CED3D6CED3D6CED3D6CED3D60000
                                0000FFFFFFFFFF00FFFFFFFFFF00FFFF000000000000CED3D6CED3D6CED3D6CE
                                D3D6CED3D6CED3D60000CED3D6CED3D6CED3D6CED3D6000000CED3D6000000CE
                                D3D600FFFFFFFFFF00FFFFFFFFFF000000CED3D6CED3D6CED3D6CED3D6CED3D6
                                0000CED3D6CED3D6CED3D6CED3D6CED3D6000000FFFF00000000CED3D6000000
                                CED3D600FFFF000000CED3D6CED3D6CED3D6CED3D6CED3D60000CED3D6CED3D6
                                CED3D6CED3D6000000CED3D6000000CED3D60000000000FF000000FFFFFF00FF
                                FF000000CED3D6CED3D6CED3D6CED3D60000CED3D6CED3D60000000000000000
                                0000FFFFFFFFFF00FFFFCED3D6000000CED3D600FFFFFFFFFF000000CED3D6CE
                                D3D6CED3D6CED3D60000CED3D600000000FFFFFFFFFF00FFFFFFFFFF00FFFFFF
                                FFFF00FFFFCED3D6000000CED3D600FFFF000000CED3D6CED3D6CED3D6CED3D6
                                0000CED3D6000000FFFFFFCED3D6000000CED3D6FFFFFF00FFFFFFFFFF000000
                                CED3D6000000FFFFFF000000CED3D6CED3D6CED3D6CED3D60000CED3D6000000
                                00FFFF000000840084000000CED3D6000000CED3D6CED3D6000000CED3D600FF
                                FF000000CED3D6CED3D6CED3D6CED3D60000CED3D6000000FFFFFFCED3D60000
                                00CED3D6000000FFFFFF00000000FFFFFFFFFF00FFFF000000CED3D6CED3D6CE
                                D3D6CED3D6CED3D60000CED3D6CED3D6000000FFFFFF00FFFFFFFFFFCED3D600
                                0000CED3D6FFFFFF00FFFF000000CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6
                                0000CED3D6CED3D6CED3D600000000000000FFFFFFFFFF00FFFFFFFFFF000000
                                000000CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D60000CED3D6CED3D6
                                CED3D6CED3D6CED3D6000000000000000000000000CED3D6CED3D6CED3D6CED3
                                D6CED3D6CED3D6CED3D6CED3D6CED3D60000CED3D6CED3D6CED3D6CED3D6CED3
                                D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CE
                                D3D6CED3D6CED3D60000CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CE
                                D3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6
                                0000CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6
                                CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D60000CED3D6CED3D6
                                CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3
                                D6CED3D6CED3D6CED3D6CED3D6CED3D60000}
                              OnClick = btCorBackGroundClick
                            end
                            object Label86: TLabel
                              Left = 523
                              Top = 54
                              Width = 98
                              Height = 13
                              Alignment = taRightJustify
                              Caption = 'cor_surface_lowest:'
                            end
                            object btCorSurfaceLowest: TSpeedButton
                              Left = 691
                              Top = 48
                              Width = 23
                              Height = 25
                              Hint = 'Selecione a cor para o Texto'
                              Flat = True
                              Glyph.Data = {
                                CE040000424DCE04000000000000360000002800000012000000150000000100
                                1800000000009804000000000000000000000000000000000000CED3D6CED3D6
                                CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3
                                D6CED3D6CED3D6CED3D6CED3D6CED3D60000CED3D6CED3D6CED3D6CED3D6CED3
                                D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CE
                                D3D6CED3D6CED3D60000CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CE
                                D3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6000000CED3D6CED3D6CED3D6
                                0000CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6
                                CED3D6CED3D6CED3D6000000000000000000CED3D6CED3D60000CED3D6CED3D6
                                CED3D6CED3D6CED3D6000000000000000000000000000000CED3D6CED3D60000
                                00000000000000000000000000CED3D60000CED3D6CED3D6CED3D6CED3D60000
                                0000FFFFFFFFFF00FFFFFFFFFF00FFFF000000000000CED3D6CED3D6CED3D6CE
                                D3D6CED3D6CED3D60000CED3D6CED3D6CED3D6CED3D6000000CED3D6000000CE
                                D3D600FFFFFFFFFF00FFFFFFFFFF000000CED3D6CED3D6CED3D6CED3D6CED3D6
                                0000CED3D6CED3D6CED3D6CED3D6CED3D6000000FFFF00000000CED3D6000000
                                CED3D600FFFF000000CED3D6CED3D6CED3D6CED3D6CED3D60000CED3D6CED3D6
                                CED3D6CED3D6000000CED3D6000000CED3D60000000000FF000000FFFFFF00FF
                                FF000000CED3D6CED3D6CED3D6CED3D60000CED3D6CED3D60000000000000000
                                0000FFFFFFFFFF00FFFFCED3D6000000CED3D600FFFFFFFFFF000000CED3D6CE
                                D3D6CED3D6CED3D60000CED3D600000000FFFFFFFFFF00FFFFFFFFFF00FFFFFF
                                FFFF00FFFFCED3D6000000CED3D600FFFF000000CED3D6CED3D6CED3D6CED3D6
                                0000CED3D6000000FFFFFFCED3D6000000CED3D6FFFFFF00FFFFFFFFFF000000
                                CED3D6000000FFFFFF000000CED3D6CED3D6CED3D6CED3D60000CED3D6000000
                                00FFFF000000840084000000CED3D6000000CED3D6CED3D6000000CED3D600FF
                                FF000000CED3D6CED3D6CED3D6CED3D60000CED3D6000000FFFFFFCED3D60000
                                00CED3D6000000FFFFFF00000000FFFFFFFFFF00FFFF000000CED3D6CED3D6CE
                                D3D6CED3D6CED3D60000CED3D6CED3D6000000FFFFFF00FFFFFFFFFFCED3D600
                                0000CED3D6FFFFFF00FFFF000000CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6
                                0000CED3D6CED3D6CED3D600000000000000FFFFFFFFFF00FFFFFFFFFF000000
                                000000CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D60000CED3D6CED3D6
                                CED3D6CED3D6CED3D6000000000000000000000000CED3D6CED3D6CED3D6CED3
                                D6CED3D6CED3D6CED3D6CED3D6CED3D60000CED3D6CED3D6CED3D6CED3D6CED3
                                D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CE
                                D3D6CED3D6CED3D60000CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CE
                                D3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6
                                0000CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6
                                CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D60000CED3D6CED3D6
                                CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3
                                D6CED3D6CED3D6CED3D6CED3D6CED3D60000}
                              OnClick = btCorSurfaceLowestClick
                            end
                            object Label87: TLabel
                              Left = 538
                              Top = 82
                              Width = 83
                              Height = 13
                              Alignment = taRightJustify
                              Caption = 'cor_surface_low:'
                            end
                            object ctCorSurfaceLow: TSpeedButton
                              Left = 691
                              Top = 76
                              Width = 23
                              Height = 25
                              Hint = 'Selecione a cor para o Texto'
                              Flat = True
                              Glyph.Data = {
                                CE040000424DCE04000000000000360000002800000012000000150000000100
                                1800000000009804000000000000000000000000000000000000CED3D6CED3D6
                                CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3
                                D6CED3D6CED3D6CED3D6CED3D6CED3D60000CED3D6CED3D6CED3D6CED3D6CED3
                                D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CE
                                D3D6CED3D6CED3D60000CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CE
                                D3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6000000CED3D6CED3D6CED3D6
                                0000CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6
                                CED3D6CED3D6CED3D6000000000000000000CED3D6CED3D60000CED3D6CED3D6
                                CED3D6CED3D6CED3D6000000000000000000000000000000CED3D6CED3D60000
                                00000000000000000000000000CED3D60000CED3D6CED3D6CED3D6CED3D60000
                                0000FFFFFFFFFF00FFFFFFFFFF00FFFF000000000000CED3D6CED3D6CED3D6CE
                                D3D6CED3D6CED3D60000CED3D6CED3D6CED3D6CED3D6000000CED3D6000000CE
                                D3D600FFFFFFFFFF00FFFFFFFFFF000000CED3D6CED3D6CED3D6CED3D6CED3D6
                                0000CED3D6CED3D6CED3D6CED3D6CED3D6000000FFFF00000000CED3D6000000
                                CED3D600FFFF000000CED3D6CED3D6CED3D6CED3D6CED3D60000CED3D6CED3D6
                                CED3D6CED3D6000000CED3D6000000CED3D60000000000FF000000FFFFFF00FF
                                FF000000CED3D6CED3D6CED3D6CED3D60000CED3D6CED3D60000000000000000
                                0000FFFFFFFFFF00FFFFCED3D6000000CED3D600FFFFFFFFFF000000CED3D6CE
                                D3D6CED3D6CED3D60000CED3D600000000FFFFFFFFFF00FFFFFFFFFF00FFFFFF
                                FFFF00FFFFCED3D6000000CED3D600FFFF000000CED3D6CED3D6CED3D6CED3D6
                                0000CED3D6000000FFFFFFCED3D6000000CED3D6FFFFFF00FFFFFFFFFF000000
                                CED3D6000000FFFFFF000000CED3D6CED3D6CED3D6CED3D60000CED3D6000000
                                00FFFF000000840084000000CED3D6000000CED3D6CED3D6000000CED3D600FF
                                FF000000CED3D6CED3D6CED3D6CED3D60000CED3D6000000FFFFFFCED3D60000
                                00CED3D6000000FFFFFF00000000FFFFFFFFFF00FFFF000000CED3D6CED3D6CE
                                D3D6CED3D6CED3D60000CED3D6CED3D6000000FFFFFF00FFFFFFFFFFCED3D600
                                0000CED3D6FFFFFF00FFFF000000CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6
                                0000CED3D6CED3D6CED3D600000000000000FFFFFFFFFF00FFFFFFFFFF000000
                                000000CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D60000CED3D6CED3D6
                                CED3D6CED3D6CED3D6000000000000000000000000CED3D6CED3D6CED3D6CED3
                                D6CED3D6CED3D6CED3D6CED3D6CED3D60000CED3D6CED3D6CED3D6CED3D6CED3
                                D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CE
                                D3D6CED3D6CED3D60000CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CE
                                D3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6
                                0000CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6
                                CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D60000CED3D6CED3D6
                                CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3D6CED3
                                D6CED3D6CED3D6CED3D6CED3D6CED3D60000}
                              OnClick = ctCorSurfaceLowClick
                            end
                            object pnCorPrimaryHwCloudIA: TPanel
                              Left = 139
                              Top = 22
                              Width = 62
                              Height = 21
                              Color = cl3DLight
                              Font.Charset = DEFAULT_CHARSET
                              Font.Color = clWindowText
                              Font.Height = -11
                              Font.Name = 'Tahoma'
                              Font.Style = []
                              ParentBackground = False
                              ParentFont = False
                              TabOrder = 0
                            end
                            object pnCorPrimaryContainerHwCloudIA: TPanel
                              Left = 139
                              Top = 51
                              Width = 62
                              Height = 21
                              Color = cl3DLight
                              Font.Charset = DEFAULT_CHARSET
                              Font.Color = clWindowText
                              Font.Height = -11
                              Font.Name = 'Tahoma'
                              Font.Style = []
                              ParentBackground = False
                              ParentFont = False
                              TabOrder = 1
                            end
                            object pnCorPrimaryFixedHwCloudIA: TPanel
                              Left = 139
                              Top = 79
                              Width = 62
                              Height = 21
                              Color = cl3DLight
                              Font.Charset = DEFAULT_CHARSET
                              Font.Color = clWindowText
                              Font.Height = -11
                              Font.Name = 'Tahoma'
                              Font.Style = []
                              ParentBackground = False
                              ParentFont = False
                              TabOrder = 2
                            end
                            object pnCorOnPrimaryHwCloudIA: TPanel
                              Left = 139
                              Top = 107
                              Width = 62
                              Height = 21
                              Color = cl3DLight
                              Font.Charset = DEFAULT_CHARSET
                              Font.Color = clWindowText
                              Font.Height = -11
                              Font.Name = 'Tahoma'
                              Font.Style = []
                              ParentBackground = False
                              ParentFont = False
                              TabOrder = 3
                            end
                            object pnCorSecondaryHwCloudIA: TPanel
                              Left = 379
                              Top = 22
                              Width = 62
                              Height = 21
                              Color = cl3DLight
                              Font.Charset = DEFAULT_CHARSET
                              Font.Color = clWindowText
                              Font.Height = -11
                              Font.Name = 'Tahoma'
                              Font.Style = []
                              ParentBackground = False
                              ParentFont = False
                              TabOrder = 4
                            end
                            object pnCorSecondaryContainerHwCloudIA: TPanel
                              Left = 379
                              Top = 51
                              Width = 62
                              Height = 21
                              Color = cl3DLight
                              Font.Charset = DEFAULT_CHARSET
                              Font.Color = clWindowText
                              Font.Height = -11
                              Font.Name = 'Tahoma'
                              Font.Style = []
                              ParentBackground = False
                              ParentFont = False
                              TabOrder = 5
                            end
                            object pnCorTertiaryHwCloudIA: TPanel
                              Left = 379
                              Top = 79
                              Width = 62
                              Height = 21
                              Color = cl3DLight
                              Font.Charset = DEFAULT_CHARSET
                              Font.Color = clWindowText
                              Font.Height = -11
                              Font.Name = 'Tahoma'
                              Font.Style = []
                              ParentBackground = False
                              ParentFont = False
                              TabOrder = 6
                            end
                            object pnCorErrorHwCloudIA: TPanel
                              Left = 379
                              Top = 107
                              Width = 62
                              Height = 21
                              Color = cl3DLight
                              Font.Charset = DEFAULT_CHARSET
                              Font.Color = clWindowText
                              Font.Height = -11
                              Font.Name = 'Tahoma'
                              Font.Style = []
                              ParentBackground = False
                              ParentFont = False
                              TabOrder = 7
                            end
                            object pnCorBackGroundHwCloudIA: TPanel
                              Left = 627
                              Top = 22
                              Width = 62
                              Height = 21
                              Color = cl3DLight
                              Font.Charset = DEFAULT_CHARSET
                              Font.Color = clWindowText
                              Font.Height = -11
                              Font.Name = 'Tahoma'
                              Font.Style = []
                              ParentBackground = False
                              ParentFont = False
                              TabOrder = 8
                            end
                            object pnCorSurfaceLowestHwCloudIA: TPanel
                              Left = 627
                              Top = 51
                              Width = 62
                              Height = 21
                              Color = cl3DLight
                              Font.Charset = DEFAULT_CHARSET
                              Font.Color = clWindowText
                              Font.Height = -11
                              Font.Name = 'Tahoma'
                              Font.Style = []
                              ParentBackground = False
                              ParentFont = False
                              TabOrder = 9
                            end
                            object pnCorSurfaceLowHwCloudIA: TPanel
                              Left = 627
                              Top = 79
                              Width = 62
                              Height = 21
                              Color = cl3DLight
                              Font.Charset = DEFAULT_CHARSET
                              Font.Color = clWindowText
                              Font.Height = -11
                              Font.Name = 'Tahoma'
                              Font.Style = []
                              ParentBackground = False
                              ParentFont = False
                              TabOrder = 10
                            end
                          end
                        end
                        object TabSheet10: TTabSheet
                          Caption = 'Tabelas de Pre'#231'o'
                          ImageIndex = 6
                          object GroupBox22: TGroupBox
                            Left = 0
                            Top = 0
                            Width = 784
                            Height = 143
                            Align = alClient
                            Caption = 'Tabelas de Pre'#231'o'
                            TabOrder = 0
                            object Panel29: TPanel
                              Left = 113
                              Top = 15
                              Width = 669
                              Height = 126
                              Align = alClient
                              BevelOuter = bvNone
                              TabOrder = 0
                              object Splitter6: TSplitter
                                Left = 324
                                Top = 0
                                Height = 126
                                ExplicitLeft = 320
                                ExplicitTop = 16
                                ExplicitHeight = 100
                              end
                              object Panel30: TPanel
                                Left = 0
                                Top = 0
                                Width = 324
                                Height = 126
                                Align = alLeft
                                BevelOuter = bvNone
                                Padding.Right = 3
                                Padding.Bottom = 6
                                TabOrder = 0
                                object TreeViewPromocaoHwCloudIA: TTreeView
                                  Left = 0
                                  Top = 40
                                  Width = 321
                                  Height = 80
                                  Align = alClient
                                  Indent = 19
                                  TabOrder = 0
                                  OnDblClick = TreeViewPromocaoHwCloudIADblClick
                                end
                                object Panel31: TPanel
                                  Left = 0
                                  Top = 25
                                  Width = 321
                                  Height = 15
                                  Align = alTop
                                  BevelKind = bkTile
                                  BevelOuter = bvNone
                                  Caption = 'Duplo clique para adicionar'
                                  TabOrder = 1
                                end
                                object Panel32: TPanel
                                  Left = 0
                                  Top = 0
                                  Width = 321
                                  Height = 25
                                  Align = alTop
                                  BevelKind = bkTile
                                  BevelOuter = bvNone
                                  Caption = 'Todas'
                                  Font.Charset = DEFAULT_CHARSET
                                  Font.Color = clWindowText
                                  Font.Height = -11
                                  Font.Name = 'Tahoma'
                                  Font.Style = [fsBold]
                                  ParentFont = False
                                  TabOrder = 2
                                end
                              end
                              object Panel33: TPanel
                                Left = 327
                                Top = 0
                                Width = 342
                                Height = 126
                                Align = alClient
                                BevelOuter = bvNone
                                Padding.Left = 3
                                Padding.Bottom = 6
                                TabOrder = 1
                                object TreeViewPromocaoHwCloudIA_DB: TTreeView
                                  Left = 3
                                  Top = 40
                                  Width = 339
                                  Height = 80
                                  Align = alClient
                                  Indent = 19
                                  PopupMenu = PopupMenu3
                                  TabOrder = 0
                                  OnDblClick = TreeViewPromocaoHwCloudIA_DBDblClick
                                end
                                object Panel34: TPanel
                                  Left = 3
                                  Top = 25
                                  Width = 339
                                  Height = 15
                                  Align = alTop
                                  BevelKind = bkTile
                                  BevelOuter = bvNone
                                  Caption = 'Duplo clique para remover'
                                  TabOrder = 1
                                end
                                object Panel35: TPanel
                                  Left = 3
                                  Top = 0
                                  Width = 339
                                  Height = 25
                                  Align = alTop
                                  BevelKind = bkTile
                                  BevelOuter = bvNone
                                  Caption = 'Adicionais (Ordem)'
                                  Font.Charset = DEFAULT_CHARSET
                                  Font.Color = clWindowText
                                  Font.Height = -11
                                  Font.Name = 'Tahoma'
                                  Font.Style = [fsBold]
                                  ParentFont = False
                                  TabOrder = 2
                                end
                              end
                            end
                            object Panel36: TPanel
                              Left = 2
                              Top = 15
                              Width = 111
                              Height = 126
                              Align = alLeft
                              BevelOuter = bvNone
                              TabOrder = 1
                            end
                          end
                        end
                        object TabSheet9: TTabSheet
                          Caption = 'Drive'
                          ImageIndex = 5
                          object GroupBox21: TGroupBox
                            Left = 0
                            Top = 0
                            Width = 784
                            Height = 143
                            Align = alClient
                            Caption = 'Drive'
                            TabOrder = 0
                            object Panel39: TPanel
                              Left = 2
                              Top = 15
                              Width = 291
                              Height = 126
                              Align = alLeft
                              BevelOuter = bvNone
                              TabOrder = 0
                              object Label95: TLabel
                                Left = 78
                                Top = 8
                                Width = 53
                                Height = 13
                                Alignment = taRightJustify
                                Caption = 'drive type:'
                              end
                              object Label96: TLabel
                                Left = 13
                                Top = 35
                                Width = 118
                                Height = 13
                                Alignment = taRightJustify
                                Caption = 'drive check modification:'
                              end
                              object Label97: TLabel
                                Left = 56
                                Top = 62
                                Width = 75
                                Height = 13
                                Alignment = taRightJustify
                                Caption = 'util agentic rag:'
                              end
                              object Label98: TLabel
                                Left = 36
                                Top = 91
                                Width = 95
                                Height = 13
                                Alignment = taRightJustify
                                Caption = 'pasta padrao drive:'
                              end
                              object DBComboBoxDriveTypeHwCloudIA: TDBComboBox
                                Left = 137
                                Top = 5
                                Width = 145
                                Height = 21
                                Style = csDropDownList
                                DataField = 'DRIVE_TYPE'
                                DataSource = dtmConfig.dsConfigAPI
                                ItemHeight = 13
                                Items.Strings = (
                                  'gdrive')
                                TabOrder = 0
                              end
                              object DBComboBoxDriveCheckModif: TDBComboBox
                                Left = 137
                                Top = 32
                                Width = 63
                                Height = 21
                                Style = csDropDownList
                                DataField = 'DRIVE_CHECK_MODIF'
                                DataSource = dtmConfig.dsConfigAPI
                                ItemHeight = 13
                                Items.Strings = (
                                  'S - SIM'
                                  'N - N'#195'O')
                                TabOrder = 1
                              end
                              object DBComboBoxUtlAgenticRagHwCloudIA: TDBComboBox
                                Left = 137
                                Top = 59
                                Width = 63
                                Height = 21
                                Style = csDropDownList
                                DataField = 'UTIL_AGENTIC_RAG'
                                DataSource = dtmConfig.dsConfigAPI
                                ItemHeight = 13
                                Items.Strings = (
                                  'S - SIM'
                                  'N - N'#195'O')
                                TabOrder = 2
                              end
                              object DBEditPastaPadraoDriveHwCloudIA: TDBEdit
                                Left = 137
                                Top = 86
                                Width = 150
                                Height = 21
                                DataField = 'PASTA_PADRAO_DRIVE'
                                DataSource = dtmConfig.dsConfigAPI
                                TabOrder = 3
                              end
                            end
                            object Panel40: TPanel
                              Left = 293
                              Top = 15
                              Width = 94
                              Height = 126
                              Align = alLeft
                              BevelOuter = bvNone
                              TabOrder = 1
                              object Label99: TLabel
                                Left = 3
                                Top = 8
                                Width = 83
                                Height = 13
                                Alignment = taRightJustify
                                Caption = 'drive credentials:'
                              end
                            end
                            object DBMemoDriveCredentials: TDBMemo
                              Left = 387
                              Top = 15
                              Width = 395
                              Height = 126
                              Align = alClient
                              DataField = 'DRIVE_CREDENTIALS'
                              DataSource = dtmConfig.dsConfigAPI
                              ScrollBars = ssBoth
                              TabOrder = 2
                            end
                          end
                        end
                        object TabSheet11: TTabSheet
                          Caption = 'Collections Rag'
                          ImageIndex = 7
                          object GroupBox23: TGroupBox
                            Left = 0
                            Top = 0
                            Width = 784
                            Height = 143
                            Align = alClient
                            Caption = 'Collections Rag'
                            TabOrder = 0
                            object PageControl5: TPageControl
                              Left = 2
                              Top = 15
                              Width = 780
                              Height = 126
                              ActivePage = TabSheet12
                              Align = alClient
                              Style = tsFlatButtons
                              TabOrder = 0
                              object TabSheet12: TTabSheet
                                Caption = 'Consultar Collections Rag'
                                object Panel38: TPanel
                                  Left = 0
                                  Top = 0
                                  Width = 772
                                  Height = 35
                                  Align = alTop
                                  BevelKind = bkTile
                                  BevelOuter = bvNone
                                  TabOrder = 0
                                  object BitBtn_Novo_Collection_Rag: TBitBtn
                                    Left = 306
                                    Top = 3
                                    Width = 75
                                    Height = 25
                                    Hint = 'Novo'
                                    Caption = 'Novo'
                                    TabOrder = 0
                                    OnClick = BitBtn_Novo_Collection_RagClick
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
                                  object BitBtn_Excluir_Collection_Rag: TBitBtn
                                    Left = 387
                                    Top = 3
                                    Width = 75
                                    Height = 25
                                    Hint = 'Excluir'
                                    Caption = 'Excluir'
                                    TabOrder = 1
                                    OnClick = BitBtn_Excluir_Collection_RagClick
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
                                object DBGridCollectionRagHwCloudIA: TDBGrid
                                  Left = 0
                                  Top = 35
                                  Width = 772
                                  Height = 60
                                  Align = alClient
                                  DataSource = dtmConfig.dsCollectionsRag
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
                                      FieldName = 'COLLECTION_RAG'
                                      Visible = True
                                    end>
                                end
                              end
                              object TabSheet13: TTabSheet
                                Caption = 'Cadastrar Collections Rag'
                                ImageIndex = 1
                                object Label101: TLabel
                                  Left = 81
                                  Top = 14
                                  Width = 50
                                  Height = 13
                                  Alignment = taRightJustify
                                  Caption = 'Collection:'
                                end
                                object Panel37: TPanel
                                  Left = 0
                                  Top = 65
                                  Width = 772
                                  Height = 30
                                  Align = alBottom
                                  BevelKind = bkTile
                                  BevelOuter = bvNone
                                  TabOrder = 0
                                  object BitBtn35: TBitBtn
                                    Left = 388
                                    Top = 0
                                    Width = 75
                                    Height = 26
                                    Hint = 'Cancelar'
                                    Caption = '&Cancela'
                                    TabOrder = 1
                                    OnClick = BitBtn35Click
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
                                  object BitBtn19: TBitBtn
                                    Left = 304
                                    Top = 0
                                    Width = 75
                                    Height = 26
                                    Hint = 'OK'
                                    Caption = '&OK'
                                    Default = True
                                    TabOrder = 0
                                    OnClick = BitBtn19Click
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
                                object DBEditCollectionRag: TDBEdit
                                  Left = 137
                                  Top = 11
                                  Width = 398
                                  Height = 21
                                  DataField = 'COLLECTION_RAG'
                                  DataSource = dtmConfig.dsCollectionsRag
                                  TabOrder = 1
                                end
                              end
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
              Top = 479
              Width = 812
              ExplicitTop = 479
              ExplicitWidth = 812
              inherited LabelSeq: TLabel
                Enabled = False
                Visible = False
              end
              inherited BitBtn4: TBitBtn
                Left = 326
                Hint = 'Salvar - [API006]'
                ExplicitLeft = 326
              end
              inherited BitBtn5: TBitBtn
                Left = 407
                ExplicitLeft = 407
              end
              inherited BitBtn6: TBitBtn
                Hint = 'Sair'
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
          ExplicitWidth = 812
          ExplicitHeight = 527
          inherited GroupBox3: TGroupBox
            Width = 812
            ExplicitWidth = 812
            inherited imgInformation: TImage
              Left = 786
              ExplicitLeft = 786
            end
            object spAPItrayCommerce: TSpeedButton [6]
              Left = 656
              Top = 45
              Width = 23
              Height = 22
              Hint = 'Configura'#231#245'es das API'#39's'
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
              OnClick = spAPItrayCommerceClick
            end
            inherited BitBtn1: TBitBtn
              Hint = 'Clique para pesquisar - [API002]'
            end
            inherited BitBtn3: TBitBtn
              Hint = 'Novo cadastro - [API003]'
            end
          end
          inherited Panel1: TPanel
            Width = 812
            Height = 454
            ExplicitWidth = 812
            ExplicitHeight = 454
            inherited Splitter1: TSplitter
              Height = 393
              ExplicitHeight = 393
            end
            inherited DBGrid1: TDBGrid
              Width = 519
              Height = 393
              OnKeyDown = DBGrid1KeyDown
            end
            inherited Panel2: TPanel
              Width = 808
              ExplicitWidth = 808
              inherited SpeedButton1: TSpeedButton
                Hint = 'Editar Registro - [API004]'
              end
              inherited SpeedButton2: TSpeedButton
                Hint = 'Apagar Registro - [API005]'
                OnClick = SpeedButton2Click
              end
              inherited SpeedButton3: TSpeedButton
                Left = 406
                Enabled = False
                Visible = False
                ExplicitLeft = 406
              end
              inherited SpeedButton4: TSpeedButton
                Left = 349
                Enabled = False
                Visible = False
                ExplicitLeft = 349
              end
              inherited SpeedButton5: TSpeedButton
                Left = 292
                Enabled = False
                Visible = False
                ExplicitLeft = 292
              end
              inherited SpeedButton6: TSpeedButton
                Left = 179
                Hint = 'Aplicativo e Plataforma por Origem e Tipo de Contato - [CFG070]'
                Glyph.Data = {
                  F6060000424DF606000000000000360000002800000018000000180000000100
                  180000000000C0060000C40E0000C40E00000000000000000000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE
                  FEFFD1D3FF9EA4FE7C88FD6A7CFD6C7EFD808DFDA8AFFEE0E1FFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFE2E2FF7F82FD5D65FE5B69FE596CFE5870FE5771FE596EFE5B6AFE5E
                  67FD9597FEF3F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFD8D5FF6864FD5F61FE5D65FE5B68FE5A6CFE5870FE5770
                  FE596EFE5B6AFE5D66FE5F62FE7573FDEBEAFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEDFF7167FD625CFE6060FE5E64FE5C67FE
                  5B6AFE596CFE596DFE5A6BFE5C68FE5D65FE5F61FE615EFE7E78FDF9F8FFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA398FE6457FE625BFE61
                  5EFE5F62FE5D65FE5C67FE5B69FE5B69FE5C68FE5D66FE5E63FE6060FE625CFE
                  6359FEB5AEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F7FF6A57
                  FD6556FE6359FE625CFE605FFE5F62FE5E64FE5D65FE5D65FE5E64FE5E63FE60
                  60FE615EFE635AFE6457FE715FFDFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFD5CDFE6851FE6654FE6457FE635AFE625CFE605FFE6060FE5F61FE5F61
                  FE5F61FE605FFE615DFE625BFE6458FE6555FE6752FED9D3FFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFC0B3FE694FFE6752FE6654FE6457FE6359FE625BFE
                  615DFE615DFE615EFE615DFE625CFE635AFE6458FE6555FE6753FE6850FEC2B6
                  FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB8A8FE6A4CFD684FFE6752FE66
                  54FE6556FE6458FE6359FE635AFE635AFE6359FE6458FE6557FE6555FE6753FE
                  6850FE694DFDB9A9FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC5B6FE6B4A
                  FD6A4CFD694FFE6851FE6753FE6654FE6555FE6556FE6556FE6555FE6655FE66
                  53FE6752FE6850FE694DFD6B4BFDC4B6FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFE9E3FF6E48FC6B49FD6A4CFD694DFD684FFE6850FE6751FE6752FE6752
                  FE6752FE6851FE6850FE694EFE6A4CFD6B4AFD6C48FDD5C9FEFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFF9779FE6D46FD6C48FD6B4AFD6C4DFC6A4DFD
                  694EFD694EFE694EFE694EFD694DFD6A4CFD6B4BFD6C49FD6D47FD6F48FCF7F4
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE0D6FF7247FC6E45FD6D
                  47FDD8CFFED3C8FE7F61FC6B4AFD6B4AFD6B4AFD6B49FD6C48FD6C47FD6D46FD
                  6E44FD9473FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFC1ADFE6F42FD815AFCFFFFFFFFFFFFF6F4FF8869FD6D47FD6D46FD6D46FD6E
                  45FD6E44FD6F42FD7040FDD5C6FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFC6B2FE9E7EFEFFFFFFFFFFFFFFFFFFE8E1FF7144
                  FC6F42FD6F42FD7041FD7040FD713FFD956DFDFEFEFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFAFFFFFFFFFFFFFF
                  FFFFFFFFFFFF9B77FE713FFD713EFD723DFD723CFD7B46FCECE5FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFBFA6FE733BFD733AFD733AFD763EFCDBCAFE
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCEB8FE7537FD7537FD7B
                  3FFCD9C7FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCAB0
                  FE7733FD9058FDE8DCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFCEB3FEC2A0FEFBF9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
                OnClick = SpeedButton6Click
                ExplicitLeft = 179
              end
              inherited SpeedButton7: TSpeedButton
                Left = 236
                Hint = 'Origem por Modelo de Cartas - [CFG076]'
                Glyph.Data = {
                  F6060000424DF606000000000000360000002800000018000000180000000100
                  180000000000C0060000C40E0000C40E00000000000000000000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8E5BE
                  E7A625E5A31FE4A21EE4A01DE39E1CE39D1AE29B19E19A18E19817E09616DF95
                  14DF9313DE9112DD9011DD8E10DC8D0EDB8B0DDB890CDA880BDC8D11F6DFB9FF
                  FFFFFFFFFFF3D390E6A621E6A420E5A31FE4A11EE49F1CE39E1BE29C1AE29B19
                  E19918E09716E09615DF9414DE9213DE9112DD8F10DC8E0FDC8C0EDB8B0DDD92
                  12E09615EFCA89FFFFFFFFFFFFF3D391E7A722E6A521E5A420E5A21EE4A01DE3
                  9F1CE39D1BE29C1AE19A18E19817E09716DF9515DF9314DE9212DD9011DD8F10
                  DD9112E09816E19817E09716EFCA8AFFFFFFFFFFFFF3D491E7A823E6A621E6A5
                  20E5A31FE4A11EE4A01DE39E1BE29D1AE29B19E19918E09817E09615DF9414DE
                  9313DE9113E09817E29C1AE29B19E19A18E19917EFCB8BFFFFFFFFFFFFF3D492
                  E7A923E7A722E6A621E5A420E5A21FE4A11DE39F1CE39E1BE29C1AE29A19E199
                  17E09716E09515E09816E39E1BE39E1CE39D1BE29C1AE29B19E19A19F0CC8BFF
                  FFFFFFFFFFF4D592E8AA24E7A823E7A722E6A521E5A31FE5A21EE4A01DE39F1C
                  E39D1BE29B19E19A18E29918E39E1CE5A21EE4A11DE4A01DE39F1CE39E1BE39D
                  1AE29C1AF0CD8CFFFFFFFFFFFFF4D592E8AB25E8A924E7A822E6A621E6A420E5
                  A31FE4A11EE4A01DE09C1BDB9719DC991AE2A11FE6A420E5A31FE5A21FE4A11E
                  E4A01DE49F1CE39E1CE39D1BF0CD8CFFFFFFFFFFFFF4D693E9AC26E8AA24E7A9
                  23E7A722E6A521E5A420E5A21EDE9C1CD3981EE4B935E5BB36D69F23DFA020E6
                  A520E5A420E5A31FE5A21EE4A11DE4A01DE39F1CF1CE8DFFFFFFFFFFFFF4D693
                  E9AD26E8AB25E8AA24E7A823E6A622E5A420DA9B1EDAAB2DFADE4BFFE650FFE6
                  50FADE4CDEAF2EDB9D1FE5A421E6A420E5A31FE5A21FE4A11EE4A01DF1CF8DFF
                  FFFFFFFFFFF4D793EAAE27E9AC26E8AB25E8A924E4A522D9A229EFD565FFE551
                  FFE650FFE650FFE650FFE650FFE650EECB3FD89F23E3A421E6A520E5A420E5A3
                  1FE5A21EF1D08EFFFFFFFFFFFFF4D793EAAF28E9AD27E9AC25E2A623E0B74CFA
                  E25FFFE650FFE650FFE650FFE650FFE650FFE650FFE650FFE650F9DD4BDDAC2B
                  DFA120E6A521E6A420E5A31FF2D08FFFFFFFFFFFFFF4D793EAAF28E9AD27DFAA
                  2DEED66BFFE550FFE650FFE650FFE650FFE650FFE650FFE650FFE650FFE650FF
                  E650FFE650FFE650EBC63CDEA222E5A521E6A520F2D18FFFFFFFFFFFFFF4D793
                  E8AE28E5BB4BFAE361FFE650FFE650FFE650FFE650FFE650FFE650FFE650FFE6
                  50FFE650FFE650FFE650FFE650FFE650FFE650F7DA4ADFAD2BE4A521F2D290FF
                  FFFFFFFFFFF0D393EED367FFE551FFE650FFE650FFE650FFE650FFE650FFE650
                  FFE650FFE650FFE650FFE650FFE650FFE650FFE650FFE650FFE650FFE650FFE4
                  50ECCD51EFCE8DFFFFFFFFFFFFFAEEA5FFE650FFE650FFE650FFE650FFE650FF
                  E650FFE650FFE650FFE650FFE650FFE650FFE650FFE650FFE650FFE650FFE650
                  FFE650FFE650FFE650FFE650FAEEA4FFFFFFFFFFFFFFF8CBFFE755FFE650FFE6
                  50FFE650FFE650FFE650FFE650FFE650FFE650FFE650FFE650FFE650FFE650FF
                  E650FFE650FFE650FFE650FFE650FFE650FFE755FFF8CCFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
                OnClick = SpeedButton7Click
                ExplicitLeft = 236
              end
              inherited SpeedButton8: TSpeedButton
                Left = 121
                Hint = 'Origem por Tipo de Contato - [CFG064]'
                Glyph.Data = {
                  F6060000424DF606000000000000360000002800000018000000180000000100
                  180000000000C0060000C40E0000C40E00000000000000000000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFAFBE3B3C5D996
                  AED996AEECCAD6ECCAD6D996AED996AED996AED996AED996AED996AED996AED9
                  96AEECCAD6ECCAD6D996AED996AEE4B4C5FDFAFBFFFFFFFFFFFFFFFFFFFFFFFF
                  CF7B98B73A67B73A67B73A67EFD4DEEFD3DDB73A67B73A67B73A67B73A67B73A
                  67B73A67B73A67B73A67EFD4DEEFD3DDB73A67B73A67B73A67CF7C9AFFFFFFFF
                  FFFFFFFFFFFFFFFFB93F6BB73A67B73A67B73A67EFD2DCEED1DBB73A67B73A67
                  B73A67B73A67B73A67B73A67B73A67B73A67EFD2DCEED1DBB73A67B73A67B73A
                  67B93E6AFFFFFFFFFFFFFFFFFFFFFFFFB73A67B73A67B73A67B73A67B73A67B7
                  3A67B73A67B73A67B73A67B73A67B73A67B73A67B73A67B73A67B73A67B73A67
                  B73A67B73A67B73A67B73A67FFFFFFFFFFFFFFFFFFFFFFFFB73A67B73A67B73A
                  67B73A67B73A67B73A67B73A67B73A67B73A67B73A67B73A67B73A67B73A67B7
                  3A67B73A67B73A67B73A67B73A67B73A67B73A67FFFFFFFFFFFFFFFFFFFFFFFF
                  B73A67B73A67B73A67B73A67B73A67B73A67B73A67B73A67B73A67B73A67B73A
                  67B73A67B73A67B73A67B73A67B73A67B73A67B73A67B73A67B73A67FFFFFFFF
                  FFFFFFFFFFFFFFFFB73A67B73A67B73A67B73A67B73A67B73A67D07F9CE9C4D1
                  E9C4D1E9C4D1E9C4D1E9C4D1E9C4D1D07F9CB73A67B73A67B73A67B73A67B73A
                  67B73A67FFFFFFFFFFFFFFFFFFFFFFFFB73A67B73A67B73A67B73A67B73A67B7
                  3A67C0537BE7BECCE9C4D1E9C4D1E9C4D1E9C4D1E6BDCBC0537AB73A67B73A67
                  B73A67B73A67B73A67B73A67FFFFFFFFFFFFFFFFFFFFFFFFB73A67B73A67B73A
                  67B73A67B73A67B73A67B73A67BF5178DA9BB2E7BECCE7BECCDB9BB2BF5078B7
                  3A67B73A67B73A67B73A67B73A67B73A67B73A67FFFFFFFFFFFFFFFFFFFFFFFF
                  B73A67B73A67B73A67B73A67B73A67B73A67B73A67B73A67B73A67B73A67B73A
                  67B73A67B73A67B73A67B73A67B73A67B73A67B73A67B73A67B73A67FFFFFFFF
                  FFFFFFFFFFFFFFFFB73A67B73A67B73A67B73A67B73A67B73A67B73A67B73A67
                  C66186E3B4C5E3B5C5C56185B73A67B73A67B73A67B73A67B73A67B73A67B73A
                  67B73A67FFFFFFFFFFFFFFFFFFFFFFFFB73A67B73A67B73A67B73A67B73A67B7
                  3A67B73A67B73A67E3B4C5E9C4D1E9C4D1E3B5C5B73A67B73A67B73A67B73A67
                  B73A67B73A67B73A67B73A67FFFFFFFFFFFFFFFFFFFFFFFFB73A67B73A67B73A
                  67B73A67B73A67B73A67B73A67B73A67E3B4C5E9C4D1E9C4D1E3B5C5B73A67B7
                  3A67B73A67B73A67B73A67B73A67B73A67B73A67FFFFFFFFFFFFFFFFFFFFFFFF
                  B73A67B73A67B73A67B73A67B73A67B73A67B73A67B73A67C66386E3B5C6E3B4
                  C5C66186B73A67B73A67B73A67B73A67B73A67B73A67B73A67B73A67FFFFFFFF
                  FFFFFFFFFFFFFFFFB73A67B73A67B73A67B73A67B73A67B73A67B73A67B73A67
                  B73A67B73A67B73A67B73A67B73A67B73A67B73A67B73A67B73A67B73A67B73A
                  67B73A67FFFFFFFFFFFFFFFFFFFFFFFFB93F6BB73A67B73A67B73A67B73A67B7
                  3A67B73A67B73A67B73A67B73A67B73A67B73A67B73A67B73A67B73A67B73A67
                  B73A67B73A67B73A67B93F6BFFFFFFFFFFFFFFFFFFFFFFFFCE7998B73A67B73A
                  67B73A67B73A67B73A67B73A67B73A67B73A67B73A67B73A67B73A67B73A67B7
                  3A67B73A67B73A67B73A67B73A67B73A67CF7B98FFFFFFFFFFFFFFFFFFFFFFFF
                  FDFAFBE3B3C4DDA3B8DDA3B8DDA3B8DDA3B8DDA3B8DDA3B8DDA3B8DDA3B8DDA3
                  B8DDA3B8DDA3B8DDA3B8DDA3B8DDA3B8DDA3B8DDA3B8E3B3C4FDFAFBFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
                OnClick = SpeedButton8Click
                ExplicitLeft = 121
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
                Left = 291
                Enabled = False
                Visible = False
                ExplicitLeft = 291
              end
              inherited SpeedButton26: TSpeedButton
                Enabled = False
                Visible = False
              end
            end
            inherited GroupBox2: TGroupBox
              Height = 393
              ExplicitHeight = 393
              inherited ScrollBox2: TScrollBox
                Height = 376
                ExplicitHeight = 376
              end
            end
          end
        end
        inherited tsMemo: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 812
          ExplicitHeight = 527
        end
        object tsOpcoes: TTabSheet
          Caption = 'tsOpcoes'
          ImageIndex = 3
          object pnOpcoesAPI: TPanel
            Left = 3
            Top = 3
            Width = 342
            Height = 350
            TabOrder = 0
            object Panel5: TPanel
              Left = 1
              Top = 314
              Width = 340
              Height = 35
              Align = alBottom
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 0
              object BitBtn7: TBitBtn
                Left = 90
                Top = 3
                Width = 75
                Height = 25
                Hint = 'Salvar - [API006]'
                Caption = '&OK'
                TabOrder = 0
                OnClick = BitBtn7Click
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
              object BitBtn8: TBitBtn
                Left = 171
                Top = 3
                Width = 75
                Height = 25
                Hint = 'Cancelar'
                Caption = '&Cancela'
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
            object RadioGroupOpcoes: TRadioGroup
              Left = 1
              Top = 1
              Width = 340
              Height = 313
              Align = alClient
              Caption = 'Op'#231#245'es'
              ItemIndex = 0
              Items.Strings = (
                'Tray (E-Commerce)'
                'Nuvemshop (E-Commerce)'
                'Com'#233'rcio Aberto (Vendas Internet)'
                'Smartbis (Programa de Fidelidade) '
                'Nummus (Cashback)'
                'Confere (Concilia'#231#227'o de Cart'#245'es)'
                'Tecnospeed Plug Boleto (Emiss'#227'o de Boletos)'
                'Hw Cloud IA (Integrador)'
                'Suzuki (Conex'#227'o Suzuki)')
              TabOrder = 1
            end
          end
        end
      end
    end
    inherited PanelFlash: TPanel
      Top = 486
      ExplicitTop = 486
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 562
    Width = 827
    ExplicitTop = 562
    ExplicitWidth = 827
  end
  inherited pnStatusProcessamento: TPanel
    inherited lbTextoProcessamento: TLabel
      Width = 477
      Height = 21
    end
  end
  inherited PopupMenu1: TPopupMenu
    Left = 364
    Top = 1
  end
  inherited PopupMenu2: TPopupMenu
    Left = 638
    Top = 171
  end
  inherited Timer1: TTimer
    Left = 430
    Top = 3
  end
  inherited ApplicationEventsPadrao: TApplicationEvents
    Left = 398
    Top = 3
  end
  object pmConfiguracoes: TPopupMenu
    Left = 392
    Top = 176
    object ConfiguraesAPITrayECommerce1: TMenuItem
      Caption = 'Configura'#231#245'es API Tray (E- Commerce)'
      Hint = 'Configura'#231#245'es API Tray (E- Commerce)'
      OnClick = ConfiguraesAPITrayECommerce1Click
    end
    object ConfiguraesAPINuvemshopECommerce1: TMenuItem
      Caption = 'Configura'#231#245'es API Nuvemshop (E-Commerce)'
      Hint = 'Configura'#231#245'es API Nuvemshop (E-Commerce)'
      OnClick = ConfiguraesAPINuvemshopECommerce1Click
    end
    object ConfiguraesAPIComrcioAberto1: TMenuItem
      Caption = 'Configura'#231#245'es API Com'#233'rcio Aberto'
      Hint = 'Configura'#231#245'es API Com'#233'rcio Aberto'
      OnClick = ConfiguraesAPIComrcioAberto1Click
    end
    object ConfiguraesAPISmartbisFidelizao1: TMenuItem
      Caption = 'Configura'#231#245'es API Smartbis (Fideliza'#231#227'o)'
      Hint = 'Configura'#231#245'es API Smartbis (Fideliza'#231#227'o)'
      OnClick = ConfiguraesAPISmartbisFidelizao1Click
    end
    object ConfiguraesAPINummusCashback1: TMenuItem
      Caption = 'Configura'#231#245'es API Nummus (Cashback)'
      Hint = 'Configura'#231#245'es API Nummus (Cashback)'
      OnClick = ConfiguraesAPINummusCashback1Click
    end
    object ConfiguraesAPIConfereConciliaodeCarto1: TMenuItem
      Caption = 'Configura'#231#245'es API Confere (Concilia'#231#227'o de Cart'#227'o)'
      Hint = 'Configura'#231#245'es API Confere (Concilia'#231#227'o de Cart'#227'o)'
      OnClick = ConfiguraesAPIConfereConciliaodeCarto1Click
    end
    object ConfiguraesAPIPlugBoletosBoletosBancrios1: TMenuItem
      Caption = 'Configura'#231#245'es API Plug Boletos (Boletos Banc'#225'rios)'
      Hint = 'Configura'#231#245'es API Plug Boletos (Boletos Banc'#225'rios)'
      OnClick = ConfiguraesAPIPlugBoletosBoletosBancrios1Click
    end
    object ConfiguraesEnvioNotificaesdoFinanceiro1: TMenuItem
      Caption = 'Configura'#231#245'es Envio Notifica'#231#245'es do Financeiro'
      Hint = 'Configura'#231#245'es Envio Notifica'#231#245'es do Financeiro'
      OnClick = ConfiguraesEnvioNotificaesdoFinanceiro1Click
    end
    object ConfiguraesPagOnline1: TMenuItem
      Caption = 'Configura'#231#245'es Pag Online'
      Hint = 'Configura'#231#245'es Pag Online'
      OnClick = ConfiguraesPagOnline1Click
    end
    object ConfiguraesHwCloudIA1: TMenuItem
      Caption = 'Configura'#231#245'es Hw Cloud IA (Integrador)'
      Hint = 'Configura'#231#245'es Hw Cloud IA'
      OnClick = ConfiguraesHwCloudIA1Click
    end
    object ConfiguraesSuzuki1: TMenuItem
      Caption = 'Configura'#231#245'es Suzuki (Conex'#227'o Suzuki)'
      OnClick = ConfiguraesSuzuki1Click
    end
  end
  object ColorDialog1: TColorDialog
    Left = 408
    Top = 296
  end
  object OpenDialog1: TOpenDialog
    Left = 496
  end
  object OpenPictureDialog1: TOpenPictureDialog
    Left = 464
  end
  object PopupMenu3: TPopupMenu
    Left = 680
    Top = 168
    object tab_ce: TMenuItem
      Caption = 'Tabela - CLIENTE'
      OnClick = tab_ceClick
    end
    object tab_ci: TMenuItem
      Caption = 'Tabela - COLABORADOR'
      OnClick = tab_ciClick
    end
  end
end
