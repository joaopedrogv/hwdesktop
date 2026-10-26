inherited frmCadNFCe: TfrmCadNFCe
  Caption = 'NFCe'
  ClientHeight = 628
  ExplicitWidth = 806
  ExplicitHeight = 659
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelFundo: TPanel
    Height = 590
    BevelOuter = bvNone
    ExplicitHeight = 590
    inherited Splitter2: TSplitter
      Left = 0
      Top = 0
      Height = 590
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitHeight = 570
    end
    inherited PanelLeft: TPanel
      Left = 3
      Top = 0
      Width = 795
      Height = 590
      BevelOuter = bvNone
      ExplicitLeft = 3
      ExplicitTop = 0
      ExplicitWidth = 795
      ExplicitHeight = 590
      inherited PageControl1: TPageControl
        Left = 0
        Top = 0
        Width = 795
        Height = 590
        ActivePage = TabSheet1
        OnChange = PageControl1Change
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 795
        ExplicitHeight = 590
        inherited TabSheet1: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 787
          ExplicitHeight = 559
          inherited ScrollBox1: TScrollBox
            Width = 787
            Height = 559
            ExplicitWidth = 787
            ExplicitHeight = 559
            inherited PageControl3: TPageControl
              Width = 787
              Height = 511
              ActivePage = tsCadastro
              ExplicitWidth = 787
              ExplicitHeight = 511
              inherited TabSheet3: TTabSheet
                ExplicitLeft = 4
                ExplicitTop = 27
                ExplicitWidth = 779
                ExplicitHeight = 480
                inherited ScrollBox3: TScrollBox
                  Width = 779
                  Height = 480
                  ExplicitWidth = 779
                  ExplicitHeight = 480
                  inherited GroupBox1: TGroupBox
                    Width = 775
                    ExplicitWidth = 775
                  end
                end
              end
              object tsCadastro: TTabSheet
                Caption = 'tsCadastro'
                ImageIndex = 1
                object scrollCadastro: TScrollBox
                  Left = 0
                  Top = 0
                  Width = 779
                  Height = 480
                  Align = alClient
                  BevelInner = bvNone
                  BevelOuter = bvNone
                  BorderStyle = bsNone
                  TabOrder = 0
                  object pageDadosNFCe: TPageControl
                    Left = 0
                    Top = 89
                    Width = 762
                    Height = 457
                    ActivePage = ts_rejeicoes_mensagens
                    Align = alTop
                    OwnerDraw = True
                    Style = tsFlatButtons
                    TabOrder = 0
                    OnChange = pageDadosNFCeChange
                    OnDrawTab = pageDadosNFCeDrawTab
                    object tsItens: TTabSheet
                      Caption = 'NFC-e Itens'
                      ImageIndex = 1
                      object pnNFCeItens: TPanel
                        Left = 0
                        Top = 0
                        Width = 754
                        Height = 426
                        Align = alClient
                        BevelKind = bkTile
                        BevelOuter = bvNone
                        BorderWidth = 6
                        TabOrder = 0
                        object Label77: TLabel
                          Left = 6
                          Top = 61
                          Width = 738
                          Height = 13
                          Align = alTop
                          ExplicitWidth = 3
                        end
                        object Label78: TLabel
                          Left = 6
                          Top = 348
                          Width = 738
                          Height = 5
                          Align = alBottom
                          AutoSize = False
                          ExplicitTop = 340
                          ExplicitWidth = 755
                        end
                        object Label79: TLabel
                          Left = 6
                          Top = 122
                          Width = 738
                          Height = 5
                          Align = alTop
                          AutoSize = False
                          ExplicitWidth = 755
                        end
                        object pn03GridItens: TPanel
                          Left = 6
                          Top = 127
                          Width = 738
                          Height = 221
                          Align = alClient
                          BevelKind = bkTile
                          BevelOuter = bvNone
                          BorderWidth = 6
                          TabOrder = 2
                          object Panel21: TPanel
                            Left = 6
                            Top = 6
                            Width = 722
                            Height = 27
                            Align = alTop
                            BevelKind = bkTile
                            BevelOuter = bvNone
                            Caption = 'Lista de Mercadorias'
                            Font.Charset = DEFAULT_CHARSET
                            Font.Color = clWindowText
                            Font.Height = -13
                            Font.Name = 'Tahoma'
                            Font.Style = []
                            ParentFont = False
                            TabOrder = 0
                          end
                          object gridItens: TDBGrid
                            Left = 6
                            Top = 33
                            Width = 722
                            Height = 178
                            Align = alClient
                            DataSource = dtmNFConsumidor.dsNFCe_It
                            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                            PopupMenu = popItensNFCe
                            TabOrder = 1
                            TitleFont.Charset = DEFAULT_CHARSET
                            TitleFont.Color = clWindowText
                            TitleFont.Height = -11
                            TitleFont.Name = 'Tahoma'
                            TitleFont.Style = []
                            OnDblClick = gridItensDblClick
                            OnKeyDown = gridItensKeyDown
                            Columns = <
                              item
                                Expanded = False
                                FieldName = 'NITEM'
                                Width = 30
                                Visible = True
                              end
                              item
                                Expanded = False
                                FieldName = 'TIPO_ITEM'
                                Title.Caption = 'TP'
                                Width = 15
                                Visible = True
                              end
                              item
                                Expanded = False
                                FieldName = 'NUM_FAB_PROD'
                                Width = 85
                                Visible = True
                              end
                              item
                                Expanded = False
                                FieldName = 'XPROD'
                                Width = 232
                                Visible = True
                              end
                              item
                                Expanded = False
                                FieldName = 'UVND'
                                Visible = True
                              end
                              item
                                Expanded = False
                                FieldName = 'QVND'
                                Visible = True
                              end
                              item
                                Expanded = False
                                FieldName = 'VVND'
                                Visible = True
                              end
                              item
                                Expanded = False
                                FieldName = 'VPROD'
                                Title.Caption = 'Vr Tot'
                                Width = 65
                                Visible = True
                              end
                              item
                                Expanded = False
                                FieldName = 'VDESC'
                                Title.Caption = 'Desconto'
                                Width = 58
                                Visible = True
                              end
                              item
                                Expanded = False
                                FieldName = 'CFOP'
                                Visible = True
                              end
                              item
                                Expanded = False
                                FieldName = 'ICM_CST'
                                Width = 64
                                Visible = True
                              end
                              item
                                Expanded = False
                                FieldName = 'CEAN'
                                Width = 64
                                Visible = True
                              end
                              item
                                Expanded = False
                                FieldName = 'NCM'
                                Width = 64
                                Visible = True
                              end
                              item
                                Expanded = False
                                FieldName = 'CEST'
                                Width = 64
                                Visible = True
                              end
                              item
                                Expanded = False
                                FieldName = 'VFRETE'
                                Visible = True
                              end
                              item
                                Expanded = False
                                FieldName = 'VSEG'
                                Visible = True
                              end
                              item
                                Expanded = False
                                FieldName = 'VOUTRO'
                                Visible = True
                              end
                              item
                                Expanded = False
                                FieldName = 'VTOTTRIB'
                                Width = 64
                                Visible = True
                              end
                              item
                                Expanded = False
                                FieldName = 'NFCI'
                                Width = 64
                                Visible = True
                              end
                              item
                                Expanded = False
                                FieldName = 'ICM_ORIG'
                                Width = 64
                                Visible = True
                              end
                              item
                                Expanded = False
                                FieldName = 'ICM_MODBC'
                                Width = 64
                                Visible = True
                              end
                              item
                                Expanded = False
                                FieldName = 'ICM_PREDBC'
                                Width = 64
                                Visible = True
                              end
                              item
                                Expanded = False
                                FieldName = 'ICM_VBC'
                                Width = 64
                                Visible = True
                              end
                              item
                                Expanded = False
                                FieldName = 'ICM_PICMS'
                                Width = 64
                                Visible = True
                              end
                              item
                                Expanded = False
                                FieldName = 'ICM_VICMS'
                                Visible = True
                              end
                              item
                                Expanded = False
                                FieldName = 'ICM_VBCSTRET'
                                Visible = True
                              end
                              item
                                Expanded = False
                                FieldName = 'ICM_VICMSSTRET'
                                Visible = True
                              end
                              item
                                Expanded = False
                                FieldName = 'ICM_PCREDSN'
                                Width = 64
                                Visible = True
                              end
                              item
                                Expanded = False
                                FieldName = 'ICM_VCREDICMSSN'
                                Width = 64
                                Visible = True
                              end
                              item
                                Expanded = False
                                FieldName = 'ICM_CSOSN'
                                Width = 64
                                Visible = True
                              end
                              item
                                Expanded = False
                                FieldName = 'QBCMONORET'
                                Width = 64
                                Visible = True
                              end
                              item
                                Expanded = False
                                FieldName = 'ADREMICMSRET'
                                Width = 64
                                Visible = True
                              end
                              item
                                Expanded = False
                                FieldName = 'VICMSMONORET'
                                Width = 64
                                Visible = True
                              end
                              item
                                Expanded = False
                                FieldName = 'PIS_CST'
                                Width = 64
                                Visible = True
                              end
                              item
                                Expanded = False
                                FieldName = 'PIS_VBC'
                                Width = 64
                                Visible = True
                              end
                              item
                                Expanded = False
                                FieldName = 'PIS_PPIS'
                                Visible = True
                              end
                              item
                                Expanded = False
                                FieldName = 'PIS_VPIS'
                                Visible = True
                              end
                              item
                                Expanded = False
                                FieldName = 'PIS_QBCPROD'
                                Width = 64
                                Visible = True
                              end
                              item
                                Expanded = False
                                FieldName = 'PIS_VALIQPROD'
                                Width = 64
                                Visible = True
                              end
                              item
                                Expanded = False
                                FieldName = 'COFINS_CST'
                                Visible = True
                              end
                              item
                                Expanded = False
                                FieldName = 'COFINS_VBC'
                                Width = 64
                                Visible = True
                              end
                              item
                                Expanded = False
                                FieldName = 'COFINS_PCOFINS'
                                Width = 64
                                Visible = True
                              end
                              item
                                Expanded = False
                                FieldName = 'COFINS_VCOFINS'
                                Width = 64
                                Visible = True
                              end
                              item
                                Expanded = False
                                FieldName = 'COFINS_QBCPROD'
                                Width = 64
                                Visible = True
                              end
                              item
                                Expanded = False
                                FieldName = 'COFINS_VALIQPROD'
                                Width = 64
                                Visible = True
                              end
                              item
                                Expanded = False
                                FieldName = 'ISS_VBC'
                                Width = 64
                                Visible = True
                              end
                              item
                                Expanded = False
                                FieldName = 'ISS_VALIQ'
                                Visible = True
                              end
                              item
                                Expanded = False
                                FieldName = 'ISS_VISSQN'
                                Visible = True
                              end
                              item
                                Expanded = False
                                FieldName = 'ISS_CMUNFG'
                                Width = 64
                                Visible = True
                              end
                              item
                                Expanded = False
                                FieldName = 'ISS_CLISTSERV'
                                Width = 64
                                Visible = True
                              end
                              item
                                Expanded = False
                                FieldName = 'ISS_VDEDUCAO'
                                Width = 64
                                Visible = True
                              end
                              item
                                Expanded = False
                                FieldName = 'ISS_VOUTRO'
                                Width = 64
                                Visible = True
                              end
                              item
                                Expanded = False
                                FieldName = 'ISS_VDESCINCOND'
                                Width = 64
                                Visible = True
                              end
                              item
                                Expanded = False
                                FieldName = 'ISS_VDESCCOND'
                                Width = 64
                                Visible = True
                              end
                              item
                                Expanded = False
                                FieldName = 'ISS_VISSRET'
                                Width = 64
                                Visible = True
                              end
                              item
                                Expanded = False
                                FieldName = 'ISS_INDISS'
                                Width = 64
                                Visible = True
                              end
                              item
                                Expanded = False
                                FieldName = 'FRETE_NA_BASE'
                                Width = 64
                                Visible = True
                              end
                              item
                                Expanded = False
                                FieldName = 'SEQID'
                                Visible = True
                              end
                              item
                                Expanded = False
                                FieldName = 'COD_SERVICO'
                                Width = 64
                                Visible = True
                              end
                              item
                                Expanded = False
                                FieldName = 'GRUPO_PROD'
                                Visible = True
                              end
                              item
                                Expanded = False
                                FieldName = 'COD_PROD'
                                Width = 64
                                Visible = True
                              end
                              item
                                Expanded = False
                                FieldName = 'COD_NFCE'
                                Width = 64
                                Visible = True
                              end
                              item
                                Expanded = False
                                FieldName = 'COD_EMPRESA'
                                Visible = False
                              end
                              item
                                Expanded = False
                                FieldName = 'QCOM'
                                Width = 58
                                Visible = True
                              end
                              item
                                Expanded = False
                                FieldName = 'UCOM'
                                Width = 32
                                Visible = True
                              end
                              item
                                Expanded = False
                                FieldName = 'VUNCOM'
                                Title.Caption = 'Vr Unit'
                                Width = 65
                                Visible = True
                              end
                              item
                                Alignment = taLeftJustify
                                Expanded = False
                                FieldName = 'UVND_FATOR'
                                Width = 120
                                Visible = True
                              end>
                          end
                        end
                        object pn01CodDescricao: TPanel
                          Left = 6
                          Top = 6
                          Width = 738
                          Height = 55
                          Align = alTop
                          BevelOuter = bvNone
                          TabOrder = 0
                          OnExit = pn01CodDescricaoExit
                          object Panel22: TPanel
                            Left = 0
                            Top = 0
                            Width = 200
                            Height = 55
                            Align = alLeft
                            BevelOuter = bvNone
                            TabOrder = 0
                            object pnCaptionProdServ: TPanel
                              Left = 0
                              Top = 0
                              Width = 200
                              Height = 27
                              Hint = 
                                'F2 - Alternar entre Produtos e Servi'#231'os / F3 - Localizar Produto' +
                                's / F4 - Localizar Servi'#231'os'
                              Align = alTop
                              Alignment = taLeftJustify
                              BevelOuter = bvNone
                              Caption = 'C'#243'digo Produto'
                              Font.Charset = DEFAULT_CHARSET
                              Font.Color = clWindowText
                              Font.Height = -16
                              Font.Name = 'Tahoma'
                              Font.Style = []
                              ParentFont = False
                              TabOrder = 0
                            end
                            object edCodigo: TEditFiscal
                              Left = 0
                              Top = 27
                              Width = 200
                              Height = 27
                              Hint = 
                                'F2 - Alternar entre Produtos e Servi'#231'os / F3 - Localizar Produto' +
                                's / F4 - Localizar Servi'#231'os'
                              Align = alTop
                              CharCase = ecUpperCase
                              Font.Charset = DEFAULT_CHARSET
                              Font.Color = clWindowText
                              Font.Height = -16
                              Font.Name = 'Tahoma'
                              Font.Style = []
                              ParentFont = False
                              TabOrder = 1
                              Text = 'EDCODIGO'
                              OnEnter = edCodigoEnter
                              OnExit = edCodigoExit
                              OnKeyDown = edCodigoKeyDown
                            end
                          end
                          object Panel77: TPanel
                            Left = 205
                            Top = 0
                            Width = 533
                            Height = 55
                            Align = alClient
                            BevelOuter = bvNone
                            Ctl3D = True
                            ParentCtl3D = False
                            TabOrder = 1
                            object Panel24: TPanel
                              Left = 0
                              Top = 0
                              Width = 533
                              Height = 27
                              Align = alTop
                              Alignment = taLeftJustify
                              BevelOuter = bvNone
                              Caption = 'Descri'#231#227'o'
                              Font.Charset = DEFAULT_CHARSET
                              Font.Color = clWindowText
                              Font.Height = -16
                              Font.Name = 'Tahoma'
                              Font.Style = []
                              ParentFont = False
                              TabOrder = 0
                            end
                            object Panel14: TPanel
                              Left = 0
                              Top = 27
                              Width = 533
                              Height = 28
                              Align = alClient
                              BevelOuter = bvNone
                              Enabled = False
                              TabOrder = 1
                              object edDescrProd: TEdit
                                Left = 0
                                Top = 0
                                Width = 533
                                Height = 27
                                Align = alTop
                                Font.Charset = DEFAULT_CHARSET
                                Font.Color = clWindowText
                                Font.Height = -16
                                Font.Name = 'Tahoma'
                                Font.Style = []
                                ParentFont = False
                                TabOrder = 0
                                Text = 'edCodigo'
                              end
                            end
                          end
                          object Panel26: TPanel
                            Left = 200
                            Top = 0
                            Width = 5
                            Height = 55
                            Align = alLeft
                            BevelOuter = bvNone
                            TabOrder = 2
                          end
                        end
                        object pn04BotoeETotalLiq: TPanel
                          Left = 6
                          Top = 353
                          Width = 738
                          Height = 63
                          Align = alBottom
                          BevelKind = bkTile
                          BevelOuter = bvNone
                          TabOrder = 3
                          object Panel31: TPanel
                            Left = 599
                            Top = 0
                            Width = 135
                            Height = 59
                            Align = alRight
                            BevelOuter = bvNone
                            BorderWidth = 3
                            Enabled = False
                            TabOrder = 0
                            object Panel32: TPanel
                              Left = 3
                              Top = 3
                              Width = 129
                              Height = 23
                              Align = alTop
                              Alignment = taLeftJustify
                              BevelOuter = bvNone
                              Caption = 'Total'
                              Font.Charset = DEFAULT_CHARSET
                              Font.Color = clWindowText
                              Font.Height = -13
                              Font.Name = 'Tahoma'
                              Font.Style = []
                              ParentFont = False
                              TabOrder = 0
                            end
                            object DBEdit26: TDBEdit
                              Left = 3
                              Top = 26
                              Width = 129
                              Height = 24
                              Align = alTop
                              DataField = 'VNF'
                              DataSource = dtmNFConsumidor.dsNFCe
                              Font.Charset = DEFAULT_CHARSET
                              Font.Color = clWindowText
                              Font.Height = -13
                              Font.Name = 'Tahoma'
                              Font.Style = []
                              ParentFont = False
                              TabOrder = 1
                            end
                          end
                          object btExcluirItem: TBitBtn
                            Left = 240
                            Top = 17
                            Width = 122
                            Height = 25
                            Hint = 'Excluir Item: Produtos - [NFC019];   Servi'#231'os - [NFC022]'
                            Caption = 'Excluir Item'
                            TabOrder = 1
                            OnClick = btExcluirItemClick
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
                          object btAlterarItem: TBitBtn
                            Left = 368
                            Top = 17
                            Width = 122
                            Height = 25
                            Hint = 'Alterar Item: Produtos - [NFC018];   Servi'#231'os - [NFC021]'
                            Caption = 'Alterar Item'
                            TabOrder = 2
                            OnClick = btAlterarItemClick
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
                          object pnSeqPreco: TPanel
                            Left = 0
                            Top = 0
                            Width = 153
                            Height = 59
                            Align = alLeft
                            BevelOuter = bvNone
                            BorderWidth = 3
                            TabOrder = 3
                            object Panel10: TPanel
                              Left = 3
                              Top = 3
                              Width = 147
                              Height = 23
                              Hint = 'Alterar Sequencia de Pre'#231'o - [NFC023]'
                              Align = alTop
                              BevelOuter = bvNone
                              Caption = 'Seq Pre'#231'o - F12'
                              Font.Charset = DEFAULT_CHARSET
                              Font.Color = clWindowText
                              Font.Height = -13
                              Font.Name = 'Tahoma'
                              Font.Style = []
                              ParentFont = False
                              TabOrder = 0
                            end
                            object DBLookupComboBox4: TDBLookupComboBox
                              Left = 3
                              Top = 26
                              Width = 147
                              Height = 24
                              Hint = 'Alterar Sequencia de Pre'#231'o - [NFC023]'
                              Align = alTop
                              DataField = 'SEQPRECO'
                              DataSource = dtmNFConsumidor.dsNFCe
                              Font.Charset = DEFAULT_CHARSET
                              Font.Color = clWindowText
                              Font.Height = -13
                              Font.Name = 'Tahoma'
                              Font.Style = []
                              ParentFont = False
                              TabOrder = 1
                            end
                          end
                        end
                        object pn02ValoresItens: TPanel
                          Left = 6
                          Top = 74
                          Width = 738
                          Height = 48
                          Align = alTop
                          BevelOuter = bvNone
                          TabOrder = 1
                          OnExit = pn01CodDescricaoExit
                          object pnIT01Qtde: TPanel
                            Left = 0
                            Top = 0
                            Width = 80
                            Height = 48
                            Align = alLeft
                            BevelOuter = bvNone
                            TabOrder = 0
                            object Panel16: TPanel
                              Left = 0
                              Top = 0
                              Width = 80
                              Height = 23
                              Align = alTop
                              Alignment = taLeftJustify
                              BevelOuter = bvNone
                              Caption = 'Quantidade'
                              Font.Charset = DEFAULT_CHARSET
                              Font.Color = clWindowText
                              Font.Height = -13
                              Font.Name = 'Tahoma'
                              Font.Style = []
                              ParentFont = False
                              TabOrder = 0
                            end
                            object edQtde: TEditHw
                              Left = 0
                              Top = 23
                              Width = 80
                              Height = 24
                              Align = alTop
                              Font.Charset = DEFAULT_CHARSET
                              Font.Color = clWindowText
                              Font.Height = -13
                              Font.Name = 'Tahoma'
                              Font.Style = []
                              ParentFont = False
                              TabOrder = 1
                              Text = '0,000'
                              OnExit = edQtdeExit
                              OnKeyDown = edQtdeKeyDown
                              Formato = fNumber
                              FormatSize = '0.3'
                            end
                          end
                          object pnIT03VlUn: TPanel
                            Left = 150
                            Top = 0
                            Width = 85
                            Height = 48
                            Align = alLeft
                            BevelOuter = bvNone
                            Padding.Left = 5
                            TabOrder = 2
                            object Panel37: TPanel
                              Left = 5
                              Top = 0
                              Width = 80
                              Height = 23
                              Align = alTop
                              Alignment = taLeftJustify
                              BevelOuter = bvNone
                              Caption = 'Valor Unit'#225'rio'
                              Font.Charset = DEFAULT_CHARSET
                              Font.Color = clWindowText
                              Font.Height = -13
                              Font.Name = 'Tahoma'
                              Font.Style = []
                              ParentFont = False
                              TabOrder = 0
                            end
                            object edVlUn: TEditHw
                              Left = 5
                              Top = 23
                              Width = 80
                              Height = 24
                              Align = alTop
                              Font.Charset = DEFAULT_CHARSET
                              Font.Color = clWindowText
                              Font.Height = -13
                              Font.Name = 'Tahoma'
                              Font.Style = []
                              ParentFont = False
                              TabOrder = 1
                              Text = '0,00'
                              OnExit = edVlUnExit
                              OnKeyDown = edQtdeKeyDown
                              Formato = fNumber
                              FormatSize = '0.2'
                            end
                          end
                          object pnIT05VlTot: TPanel
                            Left = 235
                            Top = 0
                            Width = 105
                            Height = 48
                            Align = alLeft
                            BevelOuter = bvNone
                            Padding.Left = 5
                            TabOrder = 3
                            object Panel23: TPanel
                              Left = 5
                              Top = 0
                              Width = 100
                              Height = 23
                              Align = alTop
                              Alignment = taLeftJustify
                              BevelOuter = bvNone
                              Caption = 'Valor Total'
                              Font.Charset = DEFAULT_CHARSET
                              Font.Color = clWindowText
                              Font.Height = -13
                              Font.Name = 'Tahoma'
                              Font.Style = []
                              ParentFont = False
                              TabOrder = 0
                            end
                            object edVlTot: TEditHw
                              Left = 5
                              Top = 23
                              Width = 100
                              Height = 24
                              Align = alTop
                              Font.Charset = DEFAULT_CHARSET
                              Font.Color = clWindowText
                              Font.Height = -13
                              Font.Name = 'Tahoma'
                              Font.Style = []
                              ParentFont = False
                              TabOrder = 1
                              Text = '0,000'
                              OnExit = edVlTotExit
                              OnKeyDown = edQtdeKeyDown
                              Formato = fNumber
                              FormatSize = '0.3'
                            end
                          end
                          object pnIT07DescP: TPanel
                            Left = 340
                            Top = 0
                            Width = 80
                            Height = 48
                            Align = alLeft
                            BevelOuter = bvNone
                            Padding.Left = 5
                            TabOrder = 4
                            object Panel27: TPanel
                              Left = 5
                              Top = 0
                              Width = 75
                              Height = 23
                              Align = alTop
                              Alignment = taLeftJustify
                              BevelOuter = bvNone
                              Caption = 'Desconto %'
                              Font.Charset = DEFAULT_CHARSET
                              Font.Color = clWindowText
                              Font.Height = -13
                              Font.Name = 'Tahoma'
                              Font.Style = []
                              ParentFont = False
                              TabOrder = 0
                            end
                            object edDescP: TEditHw
                              Left = 5
                              Top = 23
                              Width = 75
                              Height = 24
                              Align = alTop
                              Font.Charset = DEFAULT_CHARSET
                              Font.Color = clWindowText
                              Font.Height = -13
                              Font.Name = 'Tahoma'
                              Font.Style = []
                              ParentFont = False
                              TabOrder = 1
                              Text = '0,000'
                              OnEnter = edDescPEnter
                              OnExit = edDescPExit
                              OnKeyDown = edQtdeKeyDown
                              Formato = fNumber
                              FormatSize = '0.3'
                            end
                          end
                          object pnIT09DescR: TPanel
                            Left = 420
                            Top = 0
                            Width = 80
                            Height = 48
                            Align = alLeft
                            BevelOuter = bvNone
                            Padding.Left = 5
                            TabOrder = 5
                            object Panel30: TPanel
                              Left = 5
                              Top = 0
                              Width = 75
                              Height = 23
                              Align = alTop
                              Alignment = taLeftJustify
                              BevelOuter = bvNone
                              Caption = 'Desconto R$'
                              Font.Charset = DEFAULT_CHARSET
                              Font.Color = clWindowText
                              Font.Height = -13
                              Font.Name = 'Tahoma'
                              Font.Style = []
                              ParentFont = False
                              TabOrder = 0
                            end
                            object edDescR: TEditHw
                              Left = 5
                              Top = 23
                              Width = 75
                              Height = 24
                              Align = alTop
                              Font.Charset = DEFAULT_CHARSET
                              Font.Color = clWindowText
                              Font.Height = -13
                              Font.Name = 'Tahoma'
                              Font.Style = []
                              ParentFont = False
                              TabOrder = 1
                              Text = '0,000'
                              OnExit = edDescRExit
                              OnKeyDown = edQtdeKeyDown
                              Formato = fNumber
                              FormatSize = '0.3'
                            end
                          end
                          object pnIT12: TPanel
                            Left = 620
                            Top = 0
                            Width = 5
                            Height = 48
                            Align = alLeft
                            BevelOuter = bvNone
                            TabOrder = 6
                          end
                          object pnIT11TotLiq: TPanel
                            Left = 500
                            Top = 0
                            Width = 120
                            Height = 48
                            Align = alLeft
                            BevelOuter = bvNone
                            Padding.Left = 5
                            TabOrder = 7
                            object Panel39: TPanel
                              Left = 5
                              Top = 0
                              Width = 115
                              Height = 23
                              Align = alTop
                              Alignment = taLeftJustify
                              BevelOuter = bvNone
                              Caption = 'Valor Total L'#237'quido'
                              Font.Charset = DEFAULT_CHARSET
                              Font.Color = clWindowText
                              Font.Height = -13
                              Font.Name = 'Tahoma'
                              Font.Style = []
                              ParentFont = False
                              TabOrder = 0
                            end
                            object edVlLiq: TEditHw
                              Left = 5
                              Top = 23
                              Width = 115
                              Height = 24
                              Align = alTop
                              Font.Charset = DEFAULT_CHARSET
                              Font.Color = clWindowText
                              Font.Height = -13
                              Font.Name = 'Tahoma'
                              Font.Style = []
                              ParentFont = False
                              TabOrder = 1
                              Text = '0,000'
                              OnExit = edVlLiqExit
                              OnKeyDown = edQtdeKeyDown
                              Formato = fNumber
                              FormatSize = '0.3'
                            end
                          end
                          object Panel44: TPanel
                            Left = 625
                            Top = 0
                            Width = 113
                            Height = 48
                            Align = alClient
                            BevelOuter = bvNone
                            TabOrder = 8
                            object btSalvarItem: TBitBtn
                              Left = 0
                              Top = 0
                              Width = 113
                              Height = 23
                              Align = alClient
                              Caption = 'Salvar'
                              Font.Charset = DEFAULT_CHARSET
                              Font.Color = clWindowText
                              Font.Height = -16
                              Font.Name = 'Tahoma'
                              Font.Style = []
                              ParentFont = False
                              TabOrder = 0
                              OnClick = btSalvarItemClick
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
                            object btCancelarItem: TBitBtn
                              Left = 0
                              Top = 23
                              Width = 113
                              Height = 25
                              Align = alBottom
                              Caption = 'Cancela'
                              TabOrder = 1
                              Visible = False
                              OnClick = btCancelarItemClick
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
                            end
                          end
                          object pnIT02Unid: TPanel
                            Left = 80
                            Top = 0
                            Width = 70
                            Height = 48
                            Align = alLeft
                            BevelOuter = bvNone
                            Padding.Left = 5
                            TabOrder = 1
                            object Panel124: TPanel
                              Left = 5
                              Top = 0
                              Width = 65
                              Height = 23
                              Align = alTop
                              Alignment = taLeftJustify
                              BevelOuter = bvNone
                              Caption = 'Unidade'
                              Font.Charset = DEFAULT_CHARSET
                              Font.Color = clWindowText
                              Font.Height = -13
                              Font.Name = 'Tahoma'
                              Font.Style = []
                              ParentFont = False
                              TabOrder = 0
                            end
                            object edUndVnd: TComboBox
                              Left = 5
                              Top = 23
                              Width = 65
                              Height = 24
                              Align = alTop
                              Style = csDropDownList
                              Font.Charset = DEFAULT_CHARSET
                              Font.Color = clWindowText
                              Font.Height = -13
                              Font.Name = 'Tahoma'
                              Font.Style = []
                              ItemHeight = 16
                              ParentFont = False
                              TabOrder = 1
                              OnChange = edUndVndChange
                              OnEnter = edUndVndEnter
                              OnKeyDown = edQtdeKeyDown
                            end
                          end
                        end
                      end
                    end
                    object tsCabecalho: TTabSheet
                      Caption = 'Cabe'#231'alho NFC-e'
                      object ScrollBox16: TScrollBox
                        Left = 0
                        Top = 0
                        Width = 754
                        Height = 426
                        Align = alClient
                        BevelInner = bvNone
                        BevelOuter = bvNone
                        BorderStyle = bsNone
                        TabOrder = 0
                        object Panel4: TPanel
                          Left = 0
                          Top = 0
                          Width = 754
                          Height = 414
                          Align = alTop
                          BevelKind = bkTile
                          BevelOuter = bvNone
                          BorderWidth = 6
                          TabOrder = 0
                          OnExit = Panel4Exit
                          object pn01Cabecalho: TPanel
                            Left = 6
                            Top = 6
                            Width = 738
                            Height = 47
                            Align = alTop
                            BevelOuter = bvNone
                            TabOrder = 0
                            object Label8: TLabel
                              Left = 0
                              Top = 0
                              Width = 31
                              Height = 13
                              Caption = 'Status'
                              FocusControl = DBEdit1
                            end
                            object Label9: TLabel
                              Left = 105
                              Top = 0
                              Width = 33
                              Height = 13
                              Caption = 'Codigo'
                              FocusControl = DBEdit2
                            end
                            object Label10: TLabel
                              Left = 170
                              Top = 0
                              Width = 37
                              Height = 13
                              Caption = 'Num NF'
                              FocusControl = DBEdit3
                            end
                            object Label11: TLabel
                              Left = 236
                              Top = 0
                              Width = 24
                              Height = 13
                              Caption = 'Serie'
                              FocusControl = DBEdit4
                            end
                            object Label12: TLabel
                              Left = 272
                              Top = 0
                              Width = 64
                              Height = 13
                              Caption = 'Chave NFC-e'
                              FocusControl = DBEdit5
                            end
                            object Label13: TLabel
                              Left = 560
                              Top = 0
                              Width = 34
                              Height = 13
                              Caption = 'Origem'
                              FocusControl = DBEdit6
                            end
                            object Label14: TLabel
                              Left = 644
                              Top = 0
                              Width = 35
                              Height = 13
                              Caption = 'Gerada'
                              FocusControl = DBEdit7
                            end
                            object DBEdit1: TDBEdit
                              Left = 0
                              Top = 19
                              Width = 89
                              Height = 21
                              DataField = 'STATUS'
                              DataSource = dtmNFConsumidor.dsNFCe
                              Enabled = False
                              TabOrder = 0
                            end
                            object DBEdit2: TDBEdit
                              Left = 104
                              Top = 19
                              Width = 60
                              Height = 21
                              DataField = 'COD_NFCE'
                              DataSource = dtmNFConsumidor.dsNFCe
                              Enabled = False
                              TabOrder = 1
                            end
                            object DBEdit3: TDBEdit
                              Left = 170
                              Top = 19
                              Width = 60
                              Height = 21
                              DataField = 'NUM_NF'
                              DataSource = dtmNFConsumidor.dsNFCe
                              Enabled = False
                              TabOrder = 2
                            end
                            object DBEdit4: TDBEdit
                              Left = 236
                              Top = 19
                              Width = 30
                              Height = 21
                              DataField = 'SERIE'
                              DataSource = dtmNFConsumidor.dsNFCe
                              Enabled = False
                              TabOrder = 3
                            end
                            object DBEdit5: TDBEdit
                              Left = 272
                              Top = 20
                              Width = 281
                              Height = 21
                              DataField = 'CHAVE_NFCE'
                              DataSource = dtmNFConsumidor.dsNFCe
                              Enabled = False
                              TabOrder = 4
                            end
                            object DBEdit6: TDBEdit
                              Left = 559
                              Top = 19
                              Width = 30
                              Height = 21
                              DataField = 'PED_ORIGEM_TIP'
                              DataSource = dtmNFConsumidor.dsNFCe
                              Enabled = False
                              TabOrder = 5
                            end
                            object DBEdit7: TDBEdit
                              Left = 595
                              Top = 19
                              Width = 43
                              Height = 21
                              DataField = 'PED_ORIGEM_NUM'
                              DataSource = dtmNFConsumidor.dsNFCe
                              Enabled = False
                              TabOrder = 6
                            end
                            object DBEdit27: TDBEdit
                              Left = 680
                              Top = 19
                              Width = 43
                              Height = 21
                              DataField = 'PED_DESTINO_NUM'
                              DataSource = dtmNFConsumidor.dsNFCe
                              Enabled = False
                              TabOrder = 7
                            end
                            object DBEdit28: TDBEdit
                              Left = 644
                              Top = 19
                              Width = 30
                              Height = 21
                              DataField = 'PED_DESTINO_TIP'
                              DataSource = dtmNFConsumidor.dsNFCe
                              Enabled = False
                              TabOrder = 8
                            end
                          end
                          object pn02Cabecalho: TPanel
                            Left = 6
                            Top = 53
                            Width = 738
                            Height = 43
                            Align = alTop
                            BevelOuter = bvNone
                            TabOrder = 1
                            object Label16: TLabel
                              Left = 0
                              Top = -2
                              Width = 33
                              Height = 13
                              Caption = 'Cliente'
                              FocusControl = DBEdit8
                            end
                            object Label17: TLabel
                              Left = 360
                              Top = -2
                              Width = 48
                              Height = 13
                              Caption = 'CPF/CNPJ'
                              FocusControl = DBEdit9
                            end
                            object Label18: TLabel
                              Left = 467
                              Top = -2
                              Width = 24
                              Height = 13
                              Caption = 'email'
                              FocusControl = DBEdit10
                            end
                            object SpeedButton10: TSpeedButton
                              Left = 679
                              Top = 16
                              Width = 23
                              Height = 22
                              Hint = 'Mais dados'
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
                              OnClick = SpeedButton10Click
                            end
                            object DBEdit8: TDBEdit
                              Left = 69
                              Top = 17
                              Width = 285
                              Height = 21
                              CharCase = ecUpperCase
                              DataField = 'XNOME'
                              DataSource = dtmNFConsumidor.dsNFCe_Dest
                              TabOrder = 1
                            end
                            object DBEdit9: TDBEdit
                              Left = 360
                              Top = 17
                              Width = 101
                              Height = 21
                              CharCase = ecUpperCase
                              DataField = 'CNPJCPF'
                              DataSource = dtmNFConsumidor.dsNFCe_Dest
                              TabOrder = 2
                            end
                            object DBEdit10: TDBEdit
                              Left = 467
                              Top = 17
                              Width = 206
                              Height = 21
                              CharCase = ecLowerCase
                              DataField = 'EMAIL'
                              DataSource = dtmNFConsumidor.dsNFCe_Dest
                              TabOrder = 3
                            end
                            object DBEdit11: TDBEdit
                              Left = 0
                              Top = 17
                              Width = 63
                              Height = 21
                              DataField = 'COD_CLIENTE'
                              DataSource = dtmNFConsumidor.dsNFCe
                              TabOrder = 0
                              OnExit = DBEdit11Exit
                              OnKeyDown = DBEdit11KeyDown
                            end
                          end
                          object pn03Cabecalho: TPanel
                            Left = 6
                            Top = 96
                            Width = 738
                            Height = 200
                            Align = alTop
                            BevelOuter = bvNone
                            TabOrder = 2
                            object Label19: TLabel
                              Left = 0
                              Top = 0
                              Width = 738
                              Height = 13
                              Align = alTop
                              Caption = 'Dados NFC-e'
                              Font.Charset = DEFAULT_CHARSET
                              Font.Color = clBlue
                              Font.Height = -11
                              Font.Name = 'Tahoma'
                              Font.Style = []
                              ParentFont = False
                              ExplicitWidth = 63
                            end
                            object Label20: TLabel
                              Left = 0
                              Top = 19
                              Width = 74
                              Height = 13
                              Caption = 'Situa'#231#227'o NFC-e'
                              FocusControl = DBEdit12
                            end
                            object Label21: TLabel
                              Left = 95
                              Top = 19
                              Width = 90
                              Height = 13
                              Caption = 'Data Hora Emissao'
                            end
                            object Label24: TLabel
                              Left = 0
                              Top = 65
                              Width = 63
                              Height = 13
                              Caption = 'Ind Presen'#231'a'
                            end
                            object lbOperacao: TLabel
                              Left = 236
                              Top = 19
                              Width = 109
                              Height = 13
                              Caption = 'Natureza de Opera'#231#227'o'
                              FocusControl = edNaturezaOperacao
                            end
                            object Label28: TLabel
                              Left = 554
                              Top = 19
                              Width = 73
                              Height = 13
                              Caption = 'Tipo Impress'#227'o'
                            end
                            object Label23: TLabel
                              Left = 2
                              Top = 157
                              Width = 69
                              Height = 13
                              Caption = 'Num Protocolo'
                            end
                            object DBText1: TDBText
                              Left = 2
                              Top = 176
                              Width = 118
                              Height = 17
                              DataField = 'NPROT'
                              DataSource = dtmNFConsumidor.dsNFCe
                            end
                            object DBText2: TDBText
                              Left = 125
                              Top = 176
                              Width = 119
                              Height = 17
                              DataField = 'TPEMIS'
                              DataSource = dtmNFConsumidor.dsNFCe
                            end
                            object Label29: TLabel
                              Left = 125
                              Top = 157
                              Width = 61
                              Height = 13
                              Caption = 'Tipo Emiss'#227'o'
                            end
                            object DBText3: TDBText
                              Left = 250
                              Top = 176
                              Width = 119
                              Height = 17
                              DataField = 'TPAMB'
                              DataSource = dtmNFConsumidor.dsNFCe
                            end
                            object Label30: TLabel
                              Left = 250
                              Top = 157
                              Width = 45
                              Height = 13
                              Caption = 'Ambiente'
                            end
                            object Label31: TLabel
                              Left = 375
                              Top = 157
                              Width = 56
                              Height = 13
                              Caption = 'DigestValue'
                            end
                            object DBText4: TDBText
                              Left = 375
                              Top = 176
                              Width = 173
                              Height = 17
                              DataField = 'DIGVAL'
                              DataSource = dtmNFConsumidor.dsNFCe
                            end
                            object DBText5: TDBText
                              Left = 554
                              Top = 176
                              Width = 173
                              Height = 17
                              DataField = 'DHRECBTO'
                              DataSource = dtmNFConsumidor.dsNFCe
                            end
                            object Label32: TLabel
                              Left = 554
                              Top = 157
                              Width = 83
                              Height = 13
                              Caption = 'Data Autoriza'#231#227'o'
                            end
                            object Label159: TLabel
                              Left = 2
                              Top = 111
                              Width = 130
                              Height = 13
                              Caption = 'Intermediador/Marketplace'
                            end
                            object Label160: TLabel
                              Left = 250
                              Top = 111
                              Width = 327
                              Height = 13
                              Caption = 
                                'CNPJ do intermediador e identifica'#231#227'o da empresa  no intermediad' +
                                'or'
                              FocusControl = DBEdit41
                            end
                            object Label178: TLabel
                              Left = 125
                              Top = 65
                              Width = 88
                              Height = 13
                              Caption = 'Mun'#237'cipio consumo'
                            end
                            object DBEdit12: TDBEdit
                              Left = 0
                              Top = 38
                              Width = 89
                              Height = 21
                              DataField = 'SITUACAO_NFCE'
                              DataSource = dtmNFConsumidor.dsNFCe
                              Enabled = False
                              TabOrder = 0
                            end
                            object DBLookupComboBox1: TDBLookupComboBox
                              Left = 0
                              Top = 84
                              Width = 119
                              Height = 21
                              DataField = 'INDPRES'
                              DataSource = dtmNFConsumidor.dsNFCe
                              DropDownWidth = 200
                              TabOrder = 5
                            end
                            object edNaturezaOperacao: TDBEdit
                              Left = 236
                              Top = 38
                              Width = 312
                              Height = 21
                              CharCase = ecUpperCase
                              DataField = 'NATOP'
                              DataSource = dtmNFConsumidor.dsNFCe
                              TabOrder = 3
                              OnKeyDown = edNaturezaOperacaoKeyDown
                            end
                            object DBLookupComboBox3: TDBLookupComboBox
                              Left = 554
                              Top = 38
                              Width = 119
                              Height = 21
                              DataField = 'TPIMP'
                              DataSource = dtmNFConsumidor.dsNFCe
                              DropDownWidth = 200
                              TabOrder = 4
                            end
                            object MaskEdit5: TMaskEdit
                              Left = 95
                              Top = 38
                              Width = 69
                              Height = 21
                              TabOrder = 1
                              Text = '08/08/2016'
                              OnExit = MaskEdit5Exit
                            end
                            object MaskEdit6: TMaskEdit
                              Left = 170
                              Top = 38
                              Width = 60
                              Height = 21
                              TabOrder = 2
                              Text = '08:08:00'
                              OnExit = MaskEdit5Exit
                            end
                            object DBLookupComboBox5: TDBLookupComboBox
                              Left = 2
                              Top = 130
                              Width = 242
                              Height = 21
                              DataField = 'INDINTERMED'
                              DataSource = dtmNFConsumidor.dsNFCe
                              TabOrder = 6
                            end
                            object DBEdit41: TDBEdit
                              Left = 250
                              Top = 130
                              Width = 100
                              Height = 21
                              DataField = 'INFINTERMED_CNPJ'
                              DataSource = dtmNFConsumidor.dsNFCe
                              TabOrder = 7
                            end
                            object DBEdit42: TDBEdit
                              Left = 356
                              Top = 130
                              Width = 285
                              Height = 21
                              CharCase = ecUpperCase
                              DataField = 'INFINTERMED_IDCADINTTRAN'
                              DataSource = dtmNFConsumidor.dsNFCe
                              TabOrder = 8
                            end
                            inline ComboBoxMunicipiosFrame2: TComboBoxMunicipiosFrame
                              Left = 125
                              Top = 84
                              Width = 320
                              Height = 21
                              TabOrder = 9
                              TabStop = True
                              ExplicitLeft = 125
                              ExplicitTop = 84
                              ExplicitHeight = 21
                              inherited pnInfo: TPanel
                                Top = 5
                                ExplicitTop = 5
                              end
                            end
                            inline ComboBoxOpInternasFrame1: TComboBoxOpInternasFrame
                              Left = 240
                              Top = 56
                              Width = 312
                              Height = 37
                              TabOrder = 10
                              TabStop = True
                              ExplicitLeft = 240
                              ExplicitTop = 56
                              ExplicitWidth = 312
                              inherited pnInfo: TPanel
                                Width = 312
                                ExplicitWidth = 312
                              end
                              inherited edOpInternas: TComboBox
                                Width = 312
                                ExplicitWidth = 312
                              end
                            end
                          end
                          object pn04Cabecalho: TPanel
                            Left = 6
                            Top = 296
                            Width = 738
                            Height = 110
                            Align = alTop
                            BevelOuter = bvNone
                            TabOrder = 3
                            object Label6: TLabel
                              Left = 0
                              Top = 0
                              Width = 738
                              Height = 13
                              Align = alTop
                              Caption = 'Outros Dados'
                              Font.Charset = DEFAULT_CHARSET
                              Font.Color = clBlue
                              Font.Height = -11
                              Font.Name = 'Tahoma'
                              Font.Style = []
                              ParentFont = False
                              ExplicitWidth = 66
                            end
                            object Label22: TLabel
                              Left = 2
                              Top = 20
                              Width = 84
                              Height = 13
                              Caption = 'Data Lancamento'
                            end
                            object Label34: TLabel
                              Left = 125
                              Top = 20
                              Width = 70
                              Height = 13
                              Caption = 'Data Cadastro'
                            end
                            object DBText6: TDBText
                              Left = 125
                              Top = 39
                              Width = 123
                              Height = 17
                              DataField = 'DATA_CAD'
                              DataSource = dtmNFConsumidor.dsNFCe
                            end
                            object DBText7: TDBText
                              Left = 250
                              Top = 39
                              Width = 112
                              Height = 17
                              DataField = 'DATA_MOD'
                              DataSource = dtmNFConsumidor.dsNFCe
                            end
                            object Label33: TLabel
                              Left = 250
                              Top = 20
                              Width = 82
                              Height = 13
                              Caption = 'Data Modifica'#231#227'o'
                            end
                            object DBText8: TDBText
                              Left = 375
                              Top = 39
                              Width = 123
                              Height = 17
                              DataField = 'US_MOD'
                              DataSource = dtmNFConsumidor.dsNFCe
                            end
                            object Label35: TLabel
                              Left = 375
                              Top = 20
                              Width = 73
                              Height = 13
                              Caption = 'Usuario alterou'
                            end
                            object Vendedor: TLabel
                              Left = 2
                              Top = 66
                              Width = 46
                              Height = 13
                              Caption = 'Vendedor'
                            end
                            object btAlterarVendedor: TSpeedButton
                              Left = 454
                              Top = 83
                              Width = 23
                              Height = 22
                              Hint = 
                                'Alternar entre tipo de desconto por item ou no cabe'#231'alho - [NFC0' +
                                '24]'
                              Glyph.Data = {
                                5E010000424D5E010000000000005E0000002800000010000000100000000100
                                08000000000000010000210B0000210B00000A0000000A000000000000006A6A
                                6A002A98AB00067BC0002AC0EA00FF00FF0040D4FF0084E0FF0098F4FF00FFFF
                                FF00050505050505030303030305050505050505050502020406060604030305
                                0505050505020407070700060606040305050505020407070707000707060604
                                0305050502080707070700070707060603050505020808070700000007070706
                                0305050502080808070100010707070603050505020408080808070707070704
                                0305050505020202020202020202020205050505050505050505050502070305
                                0505050505050303030505050207030505050505050502070305050502070305
                                0505050505050207030505050207030505050505050502040403030304040305
                                0505050505050502040707070403050505050505050505050202020203050505
                                0505}
                              OnClick = btAlterarVendedorClick
                            end
                            object DBEdit13: TDBEdit
                              Left = 2
                              Top = 39
                              Width = 88
                              Height = 21
                              DataField = 'DATA_LANC'
                              DataSource = dtmNFConsumidor.dsNFCe
                              TabOrder = 0
                            end
                            object Panel13: TPanel
                              Left = 554
                              Top = 19
                              Width = 119
                              Height = 41
                              BevelOuter = bvNone
                              Enabled = False
                              TabOrder = 1
                              object Label41: TLabel
                                Left = 0
                                Top = 1
                                Width = 40
                                Height = 13
                                Caption = 'Total NF'
                              end
                              object DBEdit15: TDBEdit
                                Left = 0
                                Top = 20
                                Width = 119
                                Height = 21
                                DataField = 'VNF'
                                DataSource = dtmNFConsumidor.dsNFCe
                                TabOrder = 0
                              end
                            end
                            object lookupVendedor: TDBLookupComboBox
                              Left = 96
                              Top = 85
                              Width = 352
                              Height = 21
                              DataField = 'COD_VENDEDOR'
                              DataSource = dtmNFConsumidor.dsNFCe
                              Enabled = False
                              TabOrder = 2
                              OnExit = DBEdit29Exit
                            end
                            object DBEdit29: TDBEdit
                              Left = 2
                              Top = 85
                              Width = 88
                              Height = 21
                              DataField = 'COD_VENDEDOR'
                              DataSource = dtmNFConsumidor.dsNFCe
                              Enabled = False
                              TabOrder = 3
                              OnExit = DBEdit29Exit
                            end
                          end
                        end
                      end
                    end
                    object tsTotais: TTabSheet
                      Caption = 'Valores'
                      ImageIndex = 2
                      object Panel15: TPanel
                        Left = 0
                        Top = 0
                        Width = 754
                        Height = 426
                        Align = alClient
                        BevelKind = bkTile
                        BevelOuter = bvNone
                        TabOrder = 0
                        OnEnter = Panel15Enter
                        OnExit = Panel4Exit
                        object Panel17: TPanel
                          Left = 0
                          Top = 27
                          Width = 750
                          Height = 344
                          Align = alTop
                          BevelOuter = bvNone
                          Enabled = False
                          TabOrder = 1
                          object Label80: TLabel
                            Left = 292
                            Top = 9
                            Width = 70
                            Height = 13
                            Caption = 'Valor Produtos'
                            FocusControl = DBEdit50
                          end
                          object Label81: TLabel
                            Left = 100
                            Top = 9
                            Width = 26
                            Height = 13
                            Caption = 'Frete'
                            FocusControl = DBEdit51
                          end
                          object Label85: TLabel
                            Left = 522
                            Top = 9
                            Width = 76
                            Height = 13
                            Caption = 'Valor Liquido NF'
                            FocusControl = DBEdit55
                          end
                          object Label86: TLabel
                            Left = 75
                            Top = 36
                            Width = 51
                            Height = 13
                            Caption = 'Base ICMS'
                            FocusControl = DBEdit56
                          end
                          object Label87: TLabel
                            Left = 310
                            Top = 36
                            Width = 52
                            Height = 13
                            Caption = 'Valor ICMS'
                            FocusControl = DBEdit57
                          end
                          object Label88: TLabel
                            Left = 555
                            Top = 36
                            Width = 43
                            Height = 13
                            Caption = 'Valor PIS'
                            FocusControl = DBEdit58
                          end
                          object Label89: TLabel
                            Left = 61
                            Top = 63
                            Width = 65
                            Height = 13
                            Caption = 'Valor COFINS'
                            FocusControl = DBEdit59
                          end
                          object Label90: TLabel
                            Left = 249
                            Top = 63
                            Width = 113
                            Height = 13
                            Caption = 'Valor Total dos Tributos'
                            FocusControl = DBEdit60
                          end
                          object Label91: TLabel
                            Left = 474
                            Top = 63
                            Width = 62
                            Height = 13
                            Caption = '* Fonte IBPT'
                            Font.Charset = DEFAULT_CHARSET
                            Font.Color = clBlue
                            Font.Height = -11
                            Font.Name = 'Tahoma'
                            Font.Style = []
                            ParentFont = False
                          end
                          object Label7: TLabel
                            Left = 65
                            Top = 90
                            Width = 61
                            Height = 13
                            Caption = 'Base IBSCBS'
                            FocusControl = DBEdit43
                          end
                          object Label15: TLabel
                            Left = 246
                            Top = 90
                            Width = 116
                            Height = 13
                            Caption = 'Valor diferimento IBS UF'
                            FocusControl = DBEdit44
                          end
                          object Label161: TLabel
                            Left = 489
                            Top = 90
                            Width = 109
                            Height = 13
                            Alignment = taRightJustify
                            Caption = 'Vr dev  tributos IBS UF'
                            FocusControl = DBEdit45
                          end
                          object Label162: TLabel
                            Left = 67
                            Top = 117
                            Width = 59
                            Height = 13
                            Caption = 'Valor IBS UF'
                            FocusControl = DBEdit46
                          end
                          object Label163: TLabel
                            Left = 240
                            Top = 117
                            Width = 122
                            Height = 13
                            Alignment = taRightJustify
                            Caption = 'Vlr difriment IBS Municipio'
                            FocusControl = DBEdit47
                          end
                          object Label164: TLabel
                            Left = 481
                            Top = 117
                            Width = 117
                            Height = 13
                            Alignment = taRightJustify
                            Caption = 'Vlr dev trib IBS Municipio'
                            FocusControl = DBEdit48
                          end
                          object Label165: TLabel
                            Left = 37
                            Top = 144
                            Width = 89
                            Height = 13
                            Caption = 'Valor IBS Municipio'
                            FocusControl = DBEdit49
                          end
                          object Label166: TLabel
                            Left = 294
                            Top = 144
                            Width = 68
                            Height = 13
                            Caption = 'Valor IBS total'
                            FocusControl = DBEdit54
                          end
                          object Label167: TLabel
                            Left = 495
                            Top = 144
                            Width = 103
                            Height = 13
                            Caption = 'Valor diferimento CBS'
                            FocusControl = DBEdit62
                          end
                          object Label168: TLabel
                            Left = 28
                            Top = 171
                            Width = 98
                            Height = 13
                            Alignment = taRightJustify
                            Caption = 'Vlr dev  tributos CBS'
                            FocusControl = DBEdit67
                          end
                          object Label169: TLabel
                            Left = 316
                            Top = 171
                            Width = 46
                            Height = 13
                            Caption = 'Valor CBS'
                            FocusControl = DBEdit68
                          end
                          object Label170: TLabel
                            Left = 498
                            Top = 171
                            Width = 100
                            Height = 13
                            Caption = 'Valor IBS monofasico'
                            FocusControl = DBEdit69
                          end
                          object Label171: TLabel
                            Left = 23
                            Top = 198
                            Width = 103
                            Height = 13
                            Caption = 'Valor CBS Monofasica'
                            FocusControl = DBEdit70
                          end
                          object Label172: TLabel
                            Left = 243
                            Top = 198
                            Width = 119
                            Height = 13
                            Alignment = taRightJustify
                            Caption = 'Vr IBS mono sjt retencao'
                            FocusControl = DBEdit71
                          end
                          object Label173: TLabel
                            Left = 478
                            Top = 198
                            Width = 120
                            Height = 13
                            Alignment = taRightJustify
                            Caption = 'Vl CBS mono sjt retencao'
                            FocusControl = DBEdit72
                          end
                          object Label174: TLabel
                            Left = 7
                            Top = 225
                            Width = 119
                            Height = 13
                            Alignment = taRightJustify
                            Caption = 'Vr IBS retid anteriorment'
                            FocusControl = DBEdit73
                          end
                          object Label175: TLabel
                            Left = 240
                            Top = 225
                            Width = 122
                            Height = 13
                            Alignment = taRightJustify
                            Caption = 'Vr CBS retid anteriorment'
                            FocusControl = DBEdit74
                          end
                          object Label176: TLabel
                            Left = 491
                            Top = 225
                            Width = 107
                            Height = 13
                            Caption = 'Valor Imposto Seletivo'
                            FocusControl = DBEdit75
                          end
                          object Label177: TLabel
                            Left = 457
                            Top = 252
                            Width = 141
                            Height = 13
                            Caption = 'Valor total NF com IBS CBS IS'
                            FocusControl = DBEdit76
                          end
                          object DBEdit50: TDBEdit
                            Left = 368
                            Top = 6
                            Width = 100
                            Height = 21
                            DataField = 'VPROD'
                            DataSource = dtmNFConsumidor.dsNFCe
                            TabOrder = 0
                          end
                          object DBEdit55: TDBEdit
                            Left = 604
                            Top = 6
                            Width = 100
                            Height = 21
                            DataField = 'VNF'
                            DataSource = dtmNFConsumidor.dsNFCe
                            Font.Charset = DEFAULT_CHARSET
                            Font.Color = clWindowText
                            Font.Height = -11
                            Font.Name = 'Tahoma'
                            Font.Style = [fsBold]
                            ParentFont = False
                            TabOrder = 1
                          end
                          object DBEdit56: TDBEdit
                            Left = 132
                            Top = 33
                            Width = 100
                            Height = 21
                            DataField = 'VBC'
                            DataSource = dtmNFConsumidor.dsNFCe
                            TabOrder = 2
                          end
                          object DBEdit57: TDBEdit
                            Left = 368
                            Top = 33
                            Width = 100
                            Height = 21
                            DataField = 'VICMS'
                            DataSource = dtmNFConsumidor.dsNFCe
                            TabOrder = 3
                          end
                          object DBEdit58: TDBEdit
                            Left = 604
                            Top = 33
                            Width = 100
                            Height = 21
                            DataField = 'VPIS'
                            DataSource = dtmNFConsumidor.dsNFCe
                            TabOrder = 4
                          end
                          object DBEdit59: TDBEdit
                            Left = 132
                            Top = 60
                            Width = 100
                            Height = 21
                            DataField = 'VCOFINS'
                            DataSource = dtmNFConsumidor.dsNFCe
                            TabOrder = 5
                          end
                          object DBEdit60: TDBEdit
                            Left = 368
                            Top = 60
                            Width = 100
                            Height = 21
                            DataField = 'VTOTTRIB'
                            DataSource = dtmNFConsumidor.dsNFCe
                            TabOrder = 6
                          end
                          object DBEdit43: TDBEdit
                            Left = 132
                            Top = 87
                            Width = 100
                            Height = 21
                            DataField = 'VBCIBSCBS'
                            DataSource = dtmNFConsumidor.dsNFCe
                            TabOrder = 7
                          end
                          object DBEdit44: TDBEdit
                            Left = 368
                            Top = 87
                            Width = 100
                            Height = 21
                            DataField = 'IBSUF_VDIF'
                            DataSource = dtmNFConsumidor.dsNFCe
                            TabOrder = 8
                          end
                          object DBEdit45: TDBEdit
                            Left = 604
                            Top = 87
                            Width = 100
                            Height = 21
                            DataField = 'IBSUF_VDEVTRIB'
                            DataSource = dtmNFConsumidor.dsNFCe
                            TabOrder = 9
                          end
                          object DBEdit46: TDBEdit
                            Left = 132
                            Top = 114
                            Width = 100
                            Height = 21
                            DataField = 'VIBSUF'
                            DataSource = dtmNFConsumidor.dsNFCe
                            TabOrder = 10
                          end
                          object DBEdit47: TDBEdit
                            Left = 368
                            Top = 114
                            Width = 100
                            Height = 21
                            DataField = 'IBSMUN_VDIF'
                            DataSource = dtmNFConsumidor.dsNFCe
                            TabOrder = 11
                          end
                          object DBEdit48: TDBEdit
                            Left = 604
                            Top = 114
                            Width = 100
                            Height = 21
                            DataField = 'IBSMUN_VDEVTRIB'
                            DataSource = dtmNFConsumidor.dsNFCe
                            TabOrder = 12
                          end
                          object DBEdit49: TDBEdit
                            Left = 132
                            Top = 141
                            Width = 100
                            Height = 21
                            DataField = 'VIBSMUN'
                            DataSource = dtmNFConsumidor.dsNFCe
                            TabOrder = 13
                          end
                          object DBEdit54: TDBEdit
                            Left = 368
                            Top = 141
                            Width = 100
                            Height = 21
                            DataField = 'VIBS'
                            DataSource = dtmNFConsumidor.dsNFCe
                            TabOrder = 14
                          end
                          object DBEdit62: TDBEdit
                            Left = 604
                            Top = 141
                            Width = 100
                            Height = 21
                            DataField = 'CBS_VDIF'
                            DataSource = dtmNFConsumidor.dsNFCe
                            TabOrder = 15
                          end
                          object DBEdit67: TDBEdit
                            Left = 132
                            Top = 168
                            Width = 100
                            Height = 21
                            DataField = 'CBS_VDEVTRIB'
                            DataSource = dtmNFConsumidor.dsNFCe
                            TabOrder = 16
                          end
                          object DBEdit68: TDBEdit
                            Left = 368
                            Top = 168
                            Width = 100
                            Height = 21
                            DataField = 'VCBS'
                            DataSource = dtmNFConsumidor.dsNFCe
                            TabOrder = 17
                          end
                          object DBEdit69: TDBEdit
                            Left = 604
                            Top = 168
                            Width = 100
                            Height = 21
                            DataField = 'VIBSMONO'
                            DataSource = dtmNFConsumidor.dsNFCe
                            TabOrder = 18
                          end
                          object DBEdit70: TDBEdit
                            Left = 132
                            Top = 195
                            Width = 100
                            Height = 21
                            DataField = 'VCBSMONO'
                            DataSource = dtmNFConsumidor.dsNFCe
                            TabOrder = 19
                          end
                          object DBEdit71: TDBEdit
                            Left = 368
                            Top = 195
                            Width = 100
                            Height = 21
                            DataField = 'VIBSMONORETEN'
                            DataSource = dtmNFConsumidor.dsNFCe
                            TabOrder = 20
                          end
                          object DBEdit72: TDBEdit
                            Left = 604
                            Top = 195
                            Width = 100
                            Height = 21
                            DataField = 'VCBSMONORETEN'
                            DataSource = dtmNFConsumidor.dsNFCe
                            TabOrder = 21
                          end
                          object DBEdit73: TDBEdit
                            Left = 132
                            Top = 222
                            Width = 100
                            Height = 21
                            DataField = 'VIBSMONORET'
                            DataSource = dtmNFConsumidor.dsNFCe
                            TabOrder = 22
                          end
                          object DBEdit74: TDBEdit
                            Left = 368
                            Top = 222
                            Width = 100
                            Height = 21
                            DataField = 'VCBSMONORET'
                            DataSource = dtmNFConsumidor.dsNFCe
                            TabOrder = 23
                          end
                          object DBEdit75: TDBEdit
                            Left = 604
                            Top = 222
                            Width = 100
                            Height = 21
                            DataField = 'VIS'
                            DataSource = dtmNFConsumidor.dsNFCe
                            TabOrder = 24
                          end
                          object DBEdit76: TDBEdit
                            Left = 604
                            Top = 249
                            Width = 100
                            Height = 21
                            DataField = 'VNFTOT'
                            DataSource = dtmNFConsumidor.dsNFCe
                            Font.Charset = DEFAULT_CHARSET
                            Font.Color = clWindowText
                            Font.Height = -11
                            Font.Name = 'Tahoma'
                            Font.Style = [fsBold]
                            ParentFont = False
                            TabOrder = 25
                          end
                        end
                        object DBEdit51: TDBEdit
                          Left = 132
                          Top = 33
                          Width = 100
                          Height = 21
                          DataField = 'VFRETE'
                          DataSource = dtmNFConsumidor.dsNFCe
                          TabOrder = 0
                          OnExit = DBEdit51Exit
                        end
                        object Panel8: TPanel
                          Left = 0
                          Top = 0
                          Width = 750
                          Height = 27
                          Align = alTop
                          BevelOuter = bvNone
                          TabOrder = 2
                          object Label82: TLabel
                            Left = 2
                            Top = 9
                            Width = 124
                            Height = 13
                            Alignment = taRightJustify
                            AutoSize = False
                            Caption = 'Seguro'
                          end
                          object Label83: TLabel
                            Left = 238
                            Top = 9
                            Width = 124
                            Height = 13
                            Alignment = taRightJustify
                            AutoSize = False
                            Caption = 'Outros Valores'
                          end
                          object Label84: TLabel
                            Left = 474
                            Top = 9
                            Width = 124
                            Height = 13
                            Alignment = taRightJustify
                            AutoSize = False
                            Caption = 'Desconto'
                          end
                          object btDescontoCabecalhoDesabilitar: TSpeedButton
                            Left = 710
                            Top = 5
                            Width = 23
                            Height = 22
                            Hint = 
                              'Alternar entre tipo de desconto por item ou no cabe'#231'alho - [NFC0' +
                              '24]'
                            Glyph.Data = {
                              5E010000424D5E010000000000005E0000002800000010000000100000000100
                              08000000000000010000120B0000120B00000A0000000A000000000000006A6A
                              6A002A98AB00067BC0002AC0EA00FF00FF0040D4FF0084E0FF0098F4FF00FFFF
                              FF00050505050505030303030305050505050505050502020406060604030305
                              0505050505020407070700060606040305050505020407070707000707060604
                              0305050502080707070700070707060603050505020808070700000007070706
                              0305050502080808070100010707070603050505020408080808070707070704
                              0305050505020202020202020202020205050505050502070305050502070305
                              0505050505050207030505050207030505050505050502040403030304040305
                              0505050505050502040707070403050505050505050505050202020203050505
                              0505050505050505050505050505050505050505050505050505050505050505
                              0505}
                            OnClick = btDescontoCabecalhoDesabilitarClick
                          end
                          object btDescontoCabecalhoHabilitar: TSpeedButton
                            Left = 724
                            Top = 5
                            Width = 23
                            Height = 22
                            Hint = 
                              'Alternar entre tipo de desconto por item ou no cabe'#231'alho - [NFC0' +
                              '24]'
                            Glyph.Data = {
                              5E010000424D5E010000000000005E0000002800000010000000100000000100
                              08000000000000010000210B0000210B00000A0000000A000000000000006A6A
                              6A002A98AB00067BC0002AC0EA00FF00FF0040D4FF0084E0FF0098F4FF00FFFF
                              FF00050505050505030303030305050505050505050502020406060604030305
                              0505050505020407070700060606040305050505020407070707000707060604
                              0305050502080707070700070707060603050505020808070700000007070706
                              0305050502080808070100010707070603050505020408080808070707070704
                              0305050505020202020202020202020205050505050505050505050502070305
                              0505050505050303030505050207030505050505050502070305050502070305
                              0505050505050207030505050207030505050505050502040403030304040305
                              0505050505050502040707070403050505050505050505050202020203050505
                              0505}
                            OnClick = btDescontoCabecalhoHabilitarClick
                          end
                          object DBEdit52: TDBEdit
                            Left = 132
                            Top = 6
                            Width = 100
                            Height = 21
                            DataField = 'VSEG'
                            DataSource = dtmNFConsumidor.dsNFCe
                            TabOrder = 0
                            OnExit = DBEdit51Exit
                          end
                          object DBEdit53: TDBEdit
                            Left = 368
                            Top = 6
                            Width = 100
                            Height = 21
                            DataField = 'VOUTRO'
                            DataSource = dtmNFConsumidor.dsNFCe
                            TabOrder = 1
                            OnExit = DBEdit51Exit
                          end
                          object edDescontoTotal: TDBEdit
                            Left = 604
                            Top = 6
                            Width = 100
                            Height = 21
                            DataField = 'VDESC'
                            DataSource = dtmNFConsumidor.dsNFCe
                            TabOrder = 2
                            OnExit = DBEdit51Exit
                          end
                        end
                        object Panel53: TPanel
                          Left = 26
                          Top = 35
                          Width = 68
                          Height = 19
                          BevelOuter = bvNone
                          TabOrder = 3
                          object DBCheckBox1: TDBCheckBox
                            Left = 0
                            Top = 0
                            Width = 65
                            Height = 17
                            Hint = 'Frete entra na Base do ICMS'
                            Caption = 'BC ICMS'
                            DataField = 'FRETE_NA_BASE'
                            DataSource = dtmNFConsumidor.dsNFCe
                            TabOrder = 0
                            ValueChecked = 'S'
                            ValueUnchecked = 'N'
                          end
                        end
                        object ckIgnorarTributosRTC: TDBCheckBox
                          Left = 7
                          Top = 280
                          Width = 119
                          Height = 17
                          Hint = 
                            'Indica se o sistema deve ignorar os Tributos novos da Reforma Tr' +
                            'ibut'#225'ria, o sistema vai desabilitar os campos e qualquer gera'#231#227'o' +
                            ' de dados relacionada a RTC'
                          Caption = 'Ignorar Tributos RTC'
                          DataField = 'DFE_TRIB_IGNORAR'
                          DataSource = dtmNFConsumidor.dsNFCe
                          TabOrder = 4
                          ValueChecked = '1'
                          ValueUnchecked = '0'
                        end
                      end
                    end
                    object tsFechamento: TTabSheet
                      Caption = 'Fechamento'
                      ImageIndex = 4
                      object Panel18: TPanel
                        Left = 0
                        Top = 0
                        Width = 754
                        Height = 426
                        Align = alClient
                        BevelKind = bkTile
                        BevelOuter = bvNone
                        BorderWidth = 6
                        TabOrder = 0
                        OnExit = Panel18Exit
                        object pn01Fechamento: TPanel
                          Left = 6
                          Top = 6
                          Width = 738
                          Height = 44
                          Align = alTop
                          BevelOuter = bvNone
                          TabOrder = 0
                          object Label94: TLabel
                            Left = 0
                            Top = -1
                            Width = 33
                            Height = 13
                            Caption = 'Cliente'
                            FocusControl = DBEdit63
                          end
                          object Label95: TLabel
                            Left = 360
                            Top = -1
                            Width = 48
                            Height = 13
                            Caption = 'CPF/CNPJ'
                            FocusControl = DBEdit64
                          end
                          object Label96: TLabel
                            Left = 467
                            Top = -1
                            Width = 24
                            Height = 13
                            Caption = 'email'
                            FocusControl = DBEdit65
                          end
                          object SpeedButton13: TSpeedButton
                            Left = 679
                            Top = 16
                            Width = 23
                            Height = 22
                            Hint = 'Mais dados'
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
                            OnClick = SpeedButton10Click
                          end
                          object DBEdit63: TDBEdit
                            Left = 69
                            Top = 18
                            Width = 285
                            Height = 21
                            CharCase = ecUpperCase
                            DataField = 'XNOME'
                            DataSource = dtmNFConsumidor.dsNFCe_Dest
                            TabOrder = 1
                          end
                          object DBEdit64: TDBEdit
                            Left = 360
                            Top = 18
                            Width = 101
                            Height = 21
                            CharCase = ecUpperCase
                            DataField = 'CNPJCPF'
                            DataSource = dtmNFConsumidor.dsNFCe_Dest
                            TabOrder = 2
                          end
                          object DBEdit65: TDBEdit
                            Left = 467
                            Top = 18
                            Width = 206
                            Height = 21
                            CharCase = ecLowerCase
                            DataField = 'EMAIL'
                            DataSource = dtmNFConsumidor.dsNFCe_Dest
                            TabOrder = 3
                          end
                          object DBEdit66: TDBEdit
                            Left = 0
                            Top = 18
                            Width = 63
                            Height = 21
                            DataField = 'COD_CLIENTE'
                            DataSource = dtmNFConsumidor.dsNFCe
                            TabOrder = 0
                            OnExit = DBEdit66Exit
                            OnKeyDown = DBEdit66KeyDown
                          end
                        end
                        object pn02Fechamento: TPanel
                          Left = 6
                          Top = 50
                          Width = 738
                          Height = 366
                          Align = alClient
                          BevelOuter = bvNone
                          TabOrder = 1
                          object Label99: TLabel
                            Left = 0
                            Top = 103
                            Width = 738
                            Height = 5
                            Align = alTop
                            AutoSize = False
                            ExplicitTop = 65
                            ExplicitWidth = 734
                          end
                          object Label100: TLabel
                            Left = 0
                            Top = 320
                            Width = 738
                            Height = 5
                            Align = alBottom
                            AutoSize = False
                            ExplicitTop = 223
                            ExplicitWidth = 734
                          end
                          object Panel29: TPanel
                            Left = 0
                            Top = 108
                            Width = 738
                            Height = 212
                            Align = alClient
                            BevelKind = bkTile
                            BevelOuter = bvNone
                            BorderWidth = 6
                            TabOrder = 0
                            object Panel34: TPanel
                              Left = 6
                              Top = 6
                              Width = 722
                              Height = 27
                              Align = alTop
                              BevelKind = bkTile
                              BevelOuter = bvNone
                              Caption = 'Formas de Pagamento'
                              Font.Charset = DEFAULT_CHARSET
                              Font.Color = clWindowText
                              Font.Height = -13
                              Font.Name = 'Tahoma'
                              Font.Style = []
                              ParentFont = False
                              TabOrder = 0
                            end
                            object gridPagamentos: TDBGrid
                              Left = 6
                              Top = 33
                              Width = 582
                              Height = 169
                              Align = alClient
                              DataSource = dtmNFConsumidor.dsNFCe_Pag
                              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                              TabOrder = 1
                              TitleFont.Charset = DEFAULT_CHARSET
                              TitleFont.Color = clWindowText
                              TitleFont.Height = -11
                              TitleFont.Name = 'Tahoma'
                              TitleFont.Style = []
                              OnDblClick = gridPagamentosDblClick
                              OnKeyDown = gridPagamentosKeyDown
                              Columns = <
                                item
                                  Expanded = False
                                  FieldName = 'NOME_CTRL'
                                  Width = 284
                                  Visible = True
                                end
                                item
                                  Expanded = False
                                  FieldName = 'VPAG'
                                  Visible = True
                                end
                                item
                                  Alignment = taLeftJustify
                                  Expanded = False
                                  FieldName = 'TBAND'
                                  Width = 111
                                  Visible = True
                                end
                                item
                                  Expanded = False
                                  FieldName = 'CAUT'
                                  Width = 125
                                  Visible = True
                                end>
                            end
                            object Panel33: TPanel
                              Left = 588
                              Top = 33
                              Width = 140
                              Height = 169
                              Align = alRight
                              BevelKind = bkTile
                              BevelOuter = bvNone
                              BorderWidth = 6
                              Enabled = False
                              TabOrder = 2
                              object Panel35: TPanel
                                Left = 6
                                Top = 6
                                Width = 124
                                Height = 23
                                Align = alTop
                                Alignment = taRightJustify
                                BevelOuter = bvNone
                                Caption = 'Total da NF'
                                Font.Charset = DEFAULT_CHARSET
                                Font.Color = clWindowText
                                Font.Height = -13
                                Font.Name = 'Tahoma'
                                Font.Style = []
                                ParentFont = False
                                TabOrder = 0
                              end
                              object DBEdit14: TDBEdit
                                Left = 6
                                Top = 29
                                Width = 124
                                Height = 24
                                Align = alTop
                                DataField = 'VNF'
                                DataSource = dtmNFConsumidor.dsNFCe
                                Font.Charset = DEFAULT_CHARSET
                                Font.Color = clWindowText
                                Font.Height = -13
                                Font.Name = 'Tahoma'
                                Font.Style = []
                                ParentFont = False
                                TabOrder = 1
                              end
                              object Panel36: TPanel
                                Left = 6
                                Top = 53
                                Width = 124
                                Height = 23
                                Align = alTop
                                Alignment = taRightJustify
                                BevelOuter = bvNone
                                Caption = 'Total de Pagamento'
                                Font.Charset = DEFAULT_CHARSET
                                Font.Color = clWindowText
                                Font.Height = -13
                                Font.Name = 'Tahoma'
                                Font.Style = []
                                ParentFont = False
                                TabOrder = 2
                              end
                              object edPagamentValorTotal: TEditHw
                                Left = 6
                                Top = 76
                                Width = 124
                                Height = 24
                                Align = alTop
                                Font.Charset = DEFAULT_CHARSET
                                Font.Color = clWindowText
                                Font.Height = -13
                                Font.Name = 'Tahoma'
                                Font.Style = []
                                ParentFont = False
                                TabOrder = 3
                                Text = '0,00'
                                Formato = fNumber
                                FormatSize = '0.2'
                              end
                              object edValorQueFaltaPagamento: TEditHw
                                Left = 6
                                Top = 123
                                Width = 124
                                Height = 24
                                Align = alTop
                                Font.Charset = DEFAULT_CHARSET
                                Font.Color = clWindowText
                                Font.Height = -13
                                Font.Name = 'Tahoma'
                                Font.Style = []
                                ParentFont = False
                                TabOrder = 4
                                Text = '0,00'
                                Formato = fNumber
                                FormatSize = '0.2'
                              end
                              object Panel38: TPanel
                                Left = 6
                                Top = 100
                                Width = 124
                                Height = 23
                                Align = alTop
                                Alignment = taRightJustify
                                BevelOuter = bvNone
                                Caption = 'Falta'
                                Font.Charset = DEFAULT_CHARSET
                                Font.Color = clWindowText
                                Font.Height = -13
                                Font.Name = 'Tahoma'
                                Font.Style = []
                                ParentFont = False
                                TabOrder = 5
                              end
                            end
                          end
                          object pnDadosPagamento: TPanel
                            Left = 0
                            Top = 0
                            Width = 738
                            Height = 103
                            Align = alTop
                            BevelKind = bkTile
                            BevelOuter = bvNone
                            TabOrder = 1
                            OnExit = pnDadosPagamentoExit
                            object Label97: TLabel
                              Left = 6
                              Top = 6
                              Width = 102
                              Height = 13
                              Caption = 'Forma de Pagamento'
                            end
                            object Label98: TLabel
                              Left = 360
                              Top = 6
                              Width = 24
                              Height = 13
                              Caption = 'Valor'
                            end
                            object Label38: TLabel
                              Left = 360
                              Top = 52
                              Width = 117
                              Height = 13
                              Caption = 'Num Autoriza'#231#227'o Cart'#227'o'
                            end
                            object Label39: TLabel
                              Left = 183
                              Top = 52
                              Width = 91
                              Height = 13
                              Caption = 'Bandeira do cart'#227'o'
                            end
                            object lbFormaPagamento: TLabel
                              Left = 6
                              Top = 52
                              Width = 102
                              Height = 13
                              Caption = 'Forma de Pagamento'
                            end
                            object Label62: TLabel
                              Left = 496
                              Top = 52
                              Width = 47
                              Height = 13
                              Caption = 'Ind Pagto'
                            end
                            object lkCtrlFormPagamento: TDBLookupComboBox
                              Left = 6
                              Top = 25
                              Width = 348
                              Height = 21
                              KeyField = 'ID'
                              ListField = 'NOME_CTRL'
                              ListSource = dtmNFConsumidor.dsCtrlFormPag
                              TabOrder = 0
                              OnEnter = lkCtrlFormPagamentoEnter
                              OnExit = lkCtrlFormPagamentoExit
                              OnKeyDown = lkCtrlFormPagamentoKeyDown
                            end
                            object edValorPagamento: TEditHw
                              Left = 360
                              Top = 25
                              Width = 130
                              Height = 21
                              TabOrder = 1
                              Text = '0,00'
                              OnKeyDown = lkCtrlFormPagamentoKeyDown
                              Formato = fNumber
                              FormatSize = '0.2'
                            end
                            object btSalvarPagamento: TBitBtn
                              Left = 630
                              Top = 20
                              Width = 95
                              Height = 27
                              Hint = 'Novo pagamento - [NFC025];    Alterar pagamento - [NFC026]'
                              Caption = 'Salvar'
                              Font.Charset = DEFAULT_CHARSET
                              Font.Color = clWindowText
                              Font.Height = -13
                              Font.Name = 'Tahoma'
                              Font.Style = []
                              ParentFont = False
                              TabOrder = 5
                              OnClick = btSalvarPagamentoClick
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
                            object btCancelaPagamento: TBitBtn
                              Left = 630
                              Top = 53
                              Width = 95
                              Height = 27
                              Caption = 'Cancela'
                              Font.Charset = DEFAULT_CHARSET
                              Font.Color = clWindowText
                              Font.Height = -13
                              Font.Name = 'Tahoma'
                              Font.Style = []
                              ParentFont = False
                              TabOrder = 6
                              OnClick = btCancelaPagamentoClick
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
                            end
                            object edNumAutorizacao: TEdit
                              Left = 360
                              Top = 71
                              Width = 130
                              Height = 21
                              TabOrder = 4
                              Text = 'edNumAutorizacao'
                              OnKeyDown = lkCtrlFormPagamentoKeyDown
                            end
                            object lkBandeira: TDBLookupComboBox
                              Left = 183
                              Top = 71
                              Width = 171
                              Height = 21
                              TabOrder = 3
                              OnKeyDown = lkCtrlFormPagamentoKeyDown
                            end
                            object lkFormaPagamento: TDBLookupComboBox
                              Left = 6
                              Top = 71
                              Width = 171
                              Height = 21
                              TabOrder = 2
                              OnKeyDown = lkCtrlFormPagamentoKeyDown
                            end
                            object lkindpag: TDBLookupComboBox
                              Left = 496
                              Top = 71
                              Width = 92
                              Height = 21
                              TabOrder = 7
                            end
                          end
                          object pnBotoesDadosPagamento: TPanel
                            Left = 0
                            Top = 325
                            Width = 738
                            Height = 41
                            Align = alBottom
                            BevelKind = bkTile
                            BevelOuter = bvNone
                            TabOrder = 2
                            object btAlterarPagamento: TBitBtn
                              Left = 370
                              Top = 6
                              Width = 122
                              Height = 25
                              Hint = 'Alterar pagamento - [NFC026]'
                              Caption = 'Alterar Pagamento'
                              TabOrder = 0
                              OnClick = btAlterarPagamentoClick
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
                            object btExcluirPagamento: TBitBtn
                              Left = 242
                              Top = 6
                              Width = 122
                              Height = 25
                              Hint = 'Excluir pagamento - [NFC027]'
                              Caption = 'Excluir Pagamento'
                              TabOrder = 1
                              OnClick = btExcluirPagamentoClick
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
                      end
                    end
                    object tsInfCompl: TTabSheet
                      Caption = 'Informa'#231#245'es Complementares'
                      ImageIndex = 3
                      object Panel20: TPanel
                        Left = 0
                        Top = 0
                        Width = 754
                        Height = 426
                        Align = alClient
                        BevelKind = bkTile
                        BevelOuter = bvNone
                        BorderWidth = 6
                        TabOrder = 0
                        object Label40: TLabel
                          Left = 6
                          Top = 208
                          Width = 738
                          Height = 5
                          Align = alTop
                          AutoSize = False
                          ExplicitTop = 201
                          ExplicitWidth = 734
                        end
                        object Panel25: TPanel
                          Left = 6
                          Top = 6
                          Width = 738
                          Height = 27
                          Align = alTop
                          BevelKind = bkTile
                          BevelOuter = bvNone
                          Caption = 'Informa'#231#245'es adicionais de interesse di fisco'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -13
                          Font.Name = 'Tahoma'
                          Font.Style = []
                          ParentFont = False
                          TabOrder = 0
                        end
                        object Panel28: TPanel
                          Left = 6
                          Top = 213
                          Width = 738
                          Height = 27
                          Align = alTop
                          BevelKind = bkTile
                          BevelOuter = bvNone
                          Caption = 'Informa'#231#245'es complementares de interesse do contriuinte'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -13
                          Font.Name = 'Tahoma'
                          Font.Style = []
                          ParentFont = False
                          TabOrder = 1
                        end
                        object DBMemo2: TDBMemo
                          Left = 6
                          Top = 240
                          Width = 738
                          Height = 175
                          Align = alTop
                          DataField = 'INFCPL'
                          DataSource = dtmNFConsumidor.dsNFCe
                          TabOrder = 2
                        end
                        object DBMemo1: TDBMemo
                          Left = 6
                          Top = 33
                          Width = 738
                          Height = 175
                          Align = alTop
                          Color = clBtnFace
                          DataField = 'INFADFISCO'
                          DataSource = dtmNFConsumidor.dsNFCe
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = []
                          ParentFont = False
                          ReadOnly = True
                          TabOrder = 3
                        end
                      end
                    end
                    object ts_rejeicoes_mensagens: TTabSheet
                      Caption = '  Rejei'#231#245'es / Mensagens SEFAZ  '
                      ImageIndex = 6
                      object Panel54: TPanel
                        Left = 0
                        Top = 0
                        Width = 754
                        Height = 426
                        Align = alClient
                        BevelKind = bkTile
                        BevelOuter = bvNone
                        BorderWidth = 6
                        TabOrder = 0
                        object Label27: TLabel
                          AlignWithMargins = True
                          Left = 9
                          Top = 9
                          Width = 732
                          Height = 13
                          Align = alTop
                          Caption = 'Rejei'#231#245'es'
                          ExplicitWidth = 46
                        end
                        object Label179: TLabel
                          AlignWithMargins = True
                          Left = 9
                          Top = 271
                          Width = 732
                          Height = 13
                          Align = alTop
                          Caption = 'Mensagens da SEFAZ contidas na NFCe'
                          ExplicitTop = 234
                          ExplicitWidth = 190
                        end
                        object ed_rejeicoes: TMemo
                          AlignWithMargins = True
                          Left = 9
                          Top = 28
                          Width = 732
                          Height = 237
                          Align = alTop
                          ScrollBars = ssBoth
                          TabOrder = 0
                          OnChange = ed_rejeicoesChange
                        end
                        object edMemoAlertasSefaz: TMemo
                          AlignWithMargins = True
                          Left = 9
                          Top = 290
                          Width = 732
                          Height = 123
                          Align = alClient
                          Lines.Strings = (
                            'edMemoAlertasSefaz')
                          ReadOnly = True
                          ScrollBars = ssBoth
                          TabOrder = 1
                          ExplicitLeft = -3
                          ExplicitTop = -3
                          ExplicitWidth = 912
                          ExplicitHeight = 413
                        end
                      end
                    end
                    object tsOutrosFormsModal: TTabSheet
                      Caption = 'tsOutrosFormsModal'
                      ImageIndex = 5
                      object pageOutrosFormsModal: TPageControl
                        Left = 0
                        Top = 0
                        Width = 754
                        Height = 426
                        ActivePage = tsOF_Frete
                        Align = alClient
                        TabOrder = 0
                        object tsOFM_SelecionaProdutos: TTabSheet
                          Caption = 'tsOFM_SelecionaProdutos'
                          object pnSelecionaProduto: TPanel
                            Left = 3
                            Top = 0
                            Width = 736
                            Height = 318
                            BevelKind = bkTile
                            BevelOuter = bvNone
                            BorderWidth = 6
                            TabOrder = 0
                            object Label36: TLabel
                              Left = 6
                              Top = 239
                              Width = 720
                              Height = 5
                              Align = alBottom
                              AutoSize = False
                              ExplicitTop = 254
                            end
                            object GroupBox4: TGroupBox
                              Left = 6
                              Top = 6
                              Width = 720
                              Height = 233
                              Align = alClient
                              Caption = 'Selecione o Produto e pressione Enter'
                              TabOrder = 0
                              object gridSelecionaProdutos: TDBGrid
                                Left = 2
                                Top = 15
                                Width = 716
                                Height = 216
                                Align = alClient
                                DataSource = dtmNFConsumidor.dsProd
                                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                                TabOrder = 0
                                TitleFont.Charset = DEFAULT_CHARSET
                                TitleFont.Color = clWindowText
                                TitleFont.Height = -11
                                TitleFont.Name = 'Tahoma'
                                TitleFont.Style = []
                                OnDblClick = gridSelecionaProdutosDblClick
                                OnKeyDown = gridSelecionaProdutosKeyDown
                                Columns = <
                                  item
                                    Expanded = False
                                    FieldName = 'NUM_FAB_PROD'
                                    Width = 104
                                    Visible = True
                                  end
                                  item
                                    Expanded = False
                                    FieldName = 'UNIDADE'
                                    Visible = True
                                  end
                                  item
                                    Expanded = False
                                    FieldName = 'DESCR_PROD'
                                    Width = 303
                                    Visible = True
                                  end
                                  item
                                    Expanded = False
                                    FieldName = 'MARCA_P'
                                    Width = 101
                                    Visible = True
                                  end
                                  item
                                    Expanded = False
                                    FieldName = 'PREC_TAB_PROD'
                                    Width = 64
                                    Visible = True
                                  end
                                  item
                                    Expanded = False
                                    FieldName = 'PREC_30_PROD'
                                    Width = 64
                                    Visible = True
                                  end
                                  item
                                    Expanded = False
                                    FieldName = 'PREC_60_PROD'
                                    Width = 64
                                    Visible = True
                                  end
                                  item
                                    Expanded = False
                                    FieldName = 'PREC_90_PROD'
                                    Width = 64
                                    Visible = True
                                  end
                                  item
                                    Expanded = False
                                    FieldName = 'EM_PROMOCAO'
                                    Width = 64
                                    Visible = True
                                  end
                                  item
                                    Expanded = False
                                    FieldName = 'PRECO_PROMOCAO'
                                    Width = 64
                                    Visible = True
                                  end
                                  item
                                    Expanded = False
                                    FieldName = 'NBM'
                                    Width = 64
                                    Visible = True
                                  end
                                  item
                                    Expanded = False
                                    FieldName = 'CODIGO_NOP'
                                    Visible = True
                                  end
                                  item
                                    Expanded = False
                                    FieldName = 'CST_PROD'
                                    Width = 64
                                    Visible = True
                                  end
                                  item
                                    Expanded = False
                                    FieldName = 'CST_PIS'
                                    Width = 64
                                    Visible = True
                                  end
                                  item
                                    Expanded = False
                                    FieldName = 'CST_COFINS'
                                    Visible = True
                                  end
                                  item
                                    Expanded = False
                                    FieldName = 'CEST'
                                    Width = 64
                                    Visible = True
                                  end
                                  item
                                    Expanded = False
                                    FieldName = 'NFCI'
                                    Width = 64
                                    Visible = True
                                  end
                                  item
                                    Expanded = False
                                    FieldName = 'ALIQ_PIS_DIFERENCIADA'
                                    Width = 64
                                    Visible = True
                                  end
                                  item
                                    Expanded = False
                                    FieldName = 'ALIQ_COFINS_DIFERENCIADA'
                                    Width = 64
                                    Visible = True
                                  end
                                  item
                                    Expanded = False
                                    FieldName = 'PERC_RED_PROD'
                                    Width = 64
                                    Visible = True
                                  end
                                  item
                                    Expanded = False
                                    FieldName = 'ICM_PROD'
                                    Width = 64
                                    Visible = True
                                  end
                                  item
                                    Expanded = False
                                    FieldName = 'PERMITIR_DESCONTO'
                                    Width = 64
                                    Visible = True
                                  end
                                  item
                                    Expanded = False
                                    FieldName = 'GRUPO_PROD'
                                    Visible = True
                                  end
                                  item
                                    Expanded = False
                                    FieldName = 'COD_PROD'
                                    Width = 64
                                    Visible = True
                                  end
                                  item
                                    Expanded = False
                                    FieldName = 'COD_BARRA'
                                    Width = 64
                                    Visible = True
                                  end
                                  item
                                    Expanded = False
                                    FieldName = 'DESCR_PROD_RED'
                                    Width = 64
                                    Visible = True
                                  end>
                              end
                            end
                            object Panel5: TPanel
                              Left = 6
                              Top = 244
                              Width = 720
                              Height = 64
                              Align = alBottom
                              BevelKind = bkTile
                              BevelOuter = bvNone
                              TabOrder = 1
                              object GridPanel6: TGridPanel
                                Left = 0
                                Top = 0
                                Width = 716
                                Height = 60
                                Align = alClient
                                BevelOuter = bvNone
                                ColumnCollection = <
                                  item
                                    Value = 18.000000000000000000
                                  end
                                  item
                                    Value = 32.000000000000000000
                                  end
                                  item
                                    Value = 32.000000000000000000
                                  end
                                  item
                                    Value = 18.000000000000000000
                                  end>
                                ControlCollection = <
                                  item
                                    Column = 0
                                    Control = Panel6
                                    Row = 0
                                  end
                                  item
                                    Column = 1
                                    Control = pnGrade
                                    Row = 0
                                  end
                                  item
                                    Column = 2
                                    Control = pnGrade1
                                    Row = 0
                                  end
                                  item
                                    Column = 3
                                    Control = btAssumeSelecionaProduto
                                    Row = 0
                                  end>
                                RowCollection = <
                                  item
                                    Value = 100.000000000000000000
                                  end>
                                TabOrder = 0
                                DesignSize = (
                                  716
                                  60)
                                object Panel6: TPanel
                                  Left = 0
                                  Top = 0
                                  Width = 128
                                  Height = 60
                                  Align = alClient
                                  BevelOuter = bvNone
                                  BorderWidth = 3
                                  Enabled = False
                                  TabOrder = 0
                                  object Panel7: TPanel
                                    Left = 3
                                    Top = 3
                                    Width = 122
                                    Height = 26
                                    Align = alTop
                                    Alignment = taLeftJustify
                                    BevelOuter = bvNone
                                    Caption = 'Estoque Disponivel'
                                    Font.Charset = DEFAULT_CHARSET
                                    Font.Color = clWindowText
                                    Font.Height = -13
                                    Font.Name = 'Tahoma'
                                    Font.Style = []
                                    ParentFont = False
                                    TabOrder = 0
                                  end
                                  object edEstoqueDisp: TEditHw
                                    Left = 3
                                    Top = 29
                                    Width = 122
                                    Height = 24
                                    Align = alTop
                                    Font.Charset = DEFAULT_CHARSET
                                    Font.Color = clWindowText
                                    Font.Height = -13
                                    Font.Name = 'Tahoma'
                                    Font.Style = []
                                    ParentFont = False
                                    TabOrder = 1
                                    Text = '0,0000'
                                    Formato = fNumber
                                    FormatSize = '0.4'
                                  end
                                end
                                object pnGrade: TPanel
                                  Left = 128
                                  Top = 0
                                  Width = 229
                                  Height = 60
                                  Align = alClient
                                  BevelOuter = bvNone
                                  BorderWidth = 3
                                  Enabled = False
                                  TabOrder = 1
                                  object Panel9: TPanel
                                    Left = 3
                                    Top = 3
                                    Width = 223
                                    Height = 26
                                    Align = alTop
                                    Alignment = taLeftJustify
                                    BevelOuter = bvNone
                                    Caption = 'Grade'
                                    Font.Charset = DEFAULT_CHARSET
                                    Font.Color = clWindowText
                                    Font.Height = -13
                                    Font.Name = 'Tahoma'
                                    Font.Style = []
                                    ParentFont = False
                                    TabOrder = 0
                                  end
                                  object edGrade: TPanel
                                    Left = 3
                                    Top = 29
                                    Width = 223
                                    Height = 26
                                    Align = alTop
                                    Alignment = taLeftJustify
                                    BevelKind = bkTile
                                    BevelOuter = bvNone
                                    Caption = 'Descricao Gra'
                                    Color = clWhite
                                    Font.Charset = DEFAULT_CHARSET
                                    Font.Color = clWindowText
                                    Font.Height = -13
                                    Font.Name = 'Tahoma'
                                    Font.Style = []
                                    ParentBackground = False
                                    ParentFont = False
                                    TabOrder = 1
                                  end
                                end
                                object pnGrade1: TPanel
                                  Left = 357
                                  Top = 0
                                  Width = 229
                                  Height = 60
                                  Align = alClient
                                  BevelOuter = bvNone
                                  BorderWidth = 3
                                  Enabled = False
                                  TabOrder = 2
                                  object Panel11: TPanel
                                    Left = 3
                                    Top = 3
                                    Width = 223
                                    Height = 26
                                    Align = alTop
                                    Alignment = taLeftJustify
                                    BevelOuter = bvNone
                                    Caption = 'Grade 1'
                                    Font.Charset = DEFAULT_CHARSET
                                    Font.Color = clWindowText
                                    Font.Height = -13
                                    Font.Name = 'Tahoma'
                                    Font.Style = []
                                    ParentFont = False
                                    TabOrder = 0
                                  end
                                  object edGrade1: TPanel
                                    Left = 3
                                    Top = 29
                                    Width = 223
                                    Height = 26
                                    Align = alTop
                                    Alignment = taLeftJustify
                                    BevelKind = bkTile
                                    BevelOuter = bvNone
                                    Caption = 'Descricao Gra'
                                    Color = clWhite
                                    Font.Charset = DEFAULT_CHARSET
                                    Font.Color = clWindowText
                                    Font.Height = -13
                                    Font.Name = 'Tahoma'
                                    Font.Style = []
                                    ParentBackground = False
                                    ParentFont = False
                                    TabOrder = 1
                                  end
                                end
                                object btAssumeSelecionaProduto: TBitBtn
                                  Left = 613
                                  Top = 17
                                  Width = 75
                                  Height = 25
                                  Anchors = []
                                  Caption = 'Assume'
                                  ModalResult = 1
                                  TabOrder = 3
                                  Glyph.Data = {
                                    36030000424D3603000000000000360000002800000010000000100000000100
                                    18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
                                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00A211149525FF
                                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                                    FFFFFFFFFFFF21B93620B3350FB224449E50FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF42C95637D04F37CB4D31C34518
                                    B52FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                                    54CD6548E46247E06040D05640D75837D44F56A561FFFFFFFFFFFFFFFFFFFFFF
                                    FFFFFFFFFFFFFFFFFFFFFFFFFF4BD46055F16F52EE6D50D965FFF4FF4ADF6149
                                    DD6033DE4DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF70D6804BED66
                                    4EF06A59D96DFFF3FFFFFFFFFFFFFF44EB6051E86A3EBC51FFFFFFFFFFFFFFFF
                                    FFFFFFFFFFFFFFFFFFFFFFFFFF5BD36D89D193FFFCFFFFFFFFFFFFFFFFFFFF6A
                                    E47C55EC6F51F86C79A37FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF41E75D5BEF7443E45D449E50FFFF
                                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                                    FFFF43E35E43E35E56F0714AB85BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF51CE643ED45644EA6077A0
                                    7BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                                    FFFFFFFFFFFFFFFF37C14B40C95628CD4228CD42FFFFFFFFFFFFFFFFFFFFFFFF
                                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF37C14B36BC4A4FC8
                                    6138B44A449E50FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                                    FFFFFFFFFFFFFFFFFFFFFF72C57C36B44844C257449E50FFFFFFFFFFFFFFFFFF
                                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF40B2
                                    4E29A83C1AAE2EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF449E50FFFFFFFFFFFF}
                                end
                              end
                            end
                          end
                        end
                        object tsOFM_SelecionaServicos: TTabSheet
                          Caption = 'tsOFM_SelecionaServicos'
                          ImageIndex = 1
                          object pnSelecionaServico: TPanel
                            Left = 3
                            Top = 0
                            Width = 736
                            Height = 318
                            BevelKind = bkTile
                            BevelOuter = bvNone
                            BorderWidth = 6
                            TabOrder = 0
                            object Label37: TLabel
                              Left = 6
                              Top = 239
                              Width = 720
                              Height = 5
                              Align = alBottom
                              AutoSize = False
                              ExplicitTop = 254
                            end
                            object GroupBox5: TGroupBox
                              Left = 6
                              Top = 6
                              Width = 720
                              Height = 233
                              Align = alClient
                              Caption = 'Selecione o Servi'#231'o e pressione Enter'
                              TabOrder = 0
                              object DBGrid2: TDBGrid
                                Left = 2
                                Top = 15
                                Width = 716
                                Height = 216
                                Align = alClient
                                DataSource = dtmNFConsumidor.dsServ
                                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                                TabOrder = 0
                                TitleFont.Charset = DEFAULT_CHARSET
                                TitleFont.Color = clWindowText
                                TitleFont.Height = -11
                                TitleFont.Name = 'Tahoma'
                                TitleFont.Style = []
                                OnDblClick = DBGrid2DblClick
                                OnKeyDown = DBGrid2KeyDown
                                Columns = <
                                  item
                                    Expanded = False
                                    FieldName = 'COD_SERVICO'
                                    Visible = True
                                  end
                                  item
                                    Expanded = False
                                    FieldName = 'DESC_SERVICO'
                                    Width = 300
                                    Visible = True
                                  end
                                  item
                                    Expanded = False
                                    FieldName = 'VALOR_SERVICO'
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
                                    FieldName = 'COD_TPSERVICO'
                                    Width = 64
                                    Visible = True
                                  end
                                  item
                                    Expanded = False
                                    FieldName = 'DESC_TPSERVICO'
                                    Width = 300
                                    Visible = True
                                  end
                                  item
                                    Expanded = False
                                    FieldName = 'ALIQ_ISS'
                                    Visible = True
                                  end
                                  item
                                    Expanded = False
                                    FieldName = 'CST_PIS'
                                    Width = 64
                                    Visible = True
                                  end
                                  item
                                    Expanded = False
                                    FieldName = 'CST_COFINS'
                                    Visible = True
                                  end
                                  item
                                    Expanded = False
                                    FieldName = 'CODIGO_NOP'
                                    Visible = True
                                  end
                                  item
                                    Expanded = False
                                    FieldName = 'ISENTO_SERV'
                                    Width = 64
                                    Visible = True
                                  end
                                  item
                                    Expanded = False
                                    FieldName = 'N_INCIDENCIA_SERV'
                                    Width = 64
                                    Visible = True
                                  end
                                  item
                                    Expanded = False
                                    FieldName = 'ISS_RETIDO'
                                    Visible = True
                                  end>
                              end
                            end
                            object Panel12: TPanel
                              Left = 6
                              Top = 244
                              Width = 720
                              Height = 64
                              Align = alBottom
                              BevelKind = bkTile
                              BevelOuter = bvNone
                              TabOrder = 1
                              object btAssumeSelecionaServico: TBitBtn
                                Left = 619
                                Top = 17
                                Width = 88
                                Height = 25
                                Caption = 'Assume'
                                ModalResult = 1
                                TabOrder = 0
                                Glyph.Data = {
                                  36030000424D3603000000000000360000002800000010000000100000000100
                                  18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
                                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00A211149525FF
                                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                                  FFFFFFFFFFFF21B93620B3350FB224449E50FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF42C95637D04F37CB4D31C34518
                                  B52FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                                  54CD6548E46247E06040D05640D75837D44F56A561FFFFFFFFFFFFFFFFFFFFFF
                                  FFFFFFFFFFFFFFFFFFFFFFFFFF4BD46055F16F52EE6D50D965FFF4FF4ADF6149
                                  DD6033DE4DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF70D6804BED66
                                  4EF06A59D96DFFF3FFFFFFFFFFFFFF44EB6051E86A3EBC51FFFFFFFFFFFFFFFF
                                  FFFFFFFFFFFFFFFFFFFFFFFFFF5BD36D89D193FFFCFFFFFFFFFFFFFFFFFFFF6A
                                  E47C55EC6F51F86C79A37FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF41E75D5BEF7443E45D449E50FFFF
                                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                                  FFFF43E35E43E35E56F0714AB85BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF51CE643ED45644EA6077A0
                                  7BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                                  FFFFFFFFFFFFFFFF37C14B40C95628CD4228CD42FFFFFFFFFFFFFFFFFFFFFFFF
                                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF37C14B36BC4A4FC8
                                  6138B44A449E50FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                                  FFFFFFFFFFFFFFFFFFFFFF72C57C36B44844C257449E50FFFFFFFFFFFFFFFFFF
                                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF40B2
                                  4E29A83C1AAE2EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF449E50FFFFFFFFFFFF}
                              end
                            end
                          end
                        end
                        object tsOFM_Destinatario: TTabSheet
                          Caption = 'tsOFM_Destinatario'
                          ImageIndex = 2
                          object pnDadosDest: TPanel
                            Left = 3
                            Top = 3
                            Width = 678
                            Height = 262
                            BevelKind = bkTile
                            BevelOuter = bvNone
                            BorderWidth = 6
                            TabOrder = 0
                            object Label50: TLabel
                              Left = 23
                              Top = 16
                              Width = 48
                              Height = 13
                              Caption = 'CPF/CNPJ'
                              FocusControl = DBEdit30
                            end
                            object Label51: TLabel
                              Left = 146
                              Top = 16
                              Width = 27
                              Height = 13
                              Caption = 'Nome'
                              FocusControl = DBEdit31
                            end
                            object Label53: TLabel
                              Left = 402
                              Top = 16
                              Width = 24
                              Height = 13
                              Caption = 'email'
                              FocusControl = DBEdit32
                            end
                            object Label54: TLabel
                              Left = 23
                              Top = 62
                              Width = 55
                              Height = 13
                              Caption = 'Logradouro'
                              FocusControl = DBEdit33
                            end
                            object Label55: TLabel
                              Left = 310
                              Top = 62
                              Width = 37
                              Height = 13
                              Caption = 'Numero'
                              FocusControl = DBEdit34
                            end
                            object Label56: TLabel
                              Left = 402
                              Top = 62
                              Width = 65
                              Height = 13
                              Caption = 'Complemento'
                              FocusControl = DBEdit35
                            end
                            object Label57: TLabel
                              Left = 23
                              Top = 108
                              Width = 28
                              Height = 13
                              Caption = 'Bairro'
                              FocusControl = DBEdit36
                            end
                            object Label58: TLabel
                              Left = 310
                              Top = 108
                              Width = 33
                              Height = 13
                              Caption = 'Cidade'
                              FocusControl = DBEdit37
                            end
                            object Label59: TLabel
                              Left = 622
                              Top = 108
                              Width = 13
                              Height = 13
                              Caption = 'UF'
                              FocusControl = DBEdit38
                            end
                            object Label60: TLabel
                              Left = 23
                              Top = 154
                              Width = 19
                              Height = 13
                              Caption = 'CEP'
                              FocusControl = DBEdit39
                            end
                            object Label61: TLabel
                              Left = 310
                              Top = 154
                              Width = 24
                              Height = 13
                              Caption = 'Fone'
                              FocusControl = DBEdit40
                            end
                            object DBEdit30: TDBEdit
                              Left = 23
                              Top = 35
                              Width = 117
                              Height = 21
                              CharCase = ecUpperCase
                              DataField = 'CNPJCPF'
                              DataSource = dtmNFConsumidor.dsNFCe_Dest
                              TabOrder = 0
                              OnExit = DBEdit30Exit
                            end
                            object DBEdit31: TDBEdit
                              Left = 146
                              Top = 35
                              Width = 250
                              Height = 21
                              CharCase = ecUpperCase
                              DataField = 'XNOME'
                              DataSource = dtmNFConsumidor.dsNFCe_Dest
                              TabOrder = 1
                            end
                            object DBEdit32: TDBEdit
                              Left = 402
                              Top = 35
                              Width = 250
                              Height = 21
                              CharCase = ecLowerCase
                              DataField = 'EMAIL'
                              DataSource = dtmNFConsumidor.dsNFCe_Dest
                              TabOrder = 2
                            end
                            object DBEdit33: TDBEdit
                              Left = 23
                              Top = 81
                              Width = 281
                              Height = 21
                              CharCase = ecUpperCase
                              DataField = 'XLGR'
                              DataSource = dtmNFConsumidor.dsNFCe_Dest
                              TabOrder = 3
                            end
                            object DBEdit34: TDBEdit
                              Left = 310
                              Top = 81
                              Width = 86
                              Height = 21
                              CharCase = ecUpperCase
                              DataField = 'NRO'
                              DataSource = dtmNFConsumidor.dsNFCe_Dest
                              TabOrder = 4
                            end
                            object DBEdit35: TDBEdit
                              Left = 402
                              Top = 81
                              Width = 250
                              Height = 21
                              CharCase = ecUpperCase
                              DataField = 'XCPL'
                              DataSource = dtmNFConsumidor.dsNFCe_Dest
                              TabOrder = 5
                            end
                            object DBEdit36: TDBEdit
                              Left = 23
                              Top = 127
                              Width = 281
                              Height = 21
                              CharCase = ecUpperCase
                              DataField = 'XBAIRRO'
                              DataSource = dtmNFConsumidor.dsNFCe_Dest
                              TabOrder = 6
                            end
                            object DBEdit37: TDBEdit
                              Left = 310
                              Top = 127
                              Width = 306
                              Height = 21
                              CharCase = ecUpperCase
                              DataField = 'XMUN'
                              DataSource = dtmNFConsumidor.dsNFCe_Dest
                              TabOrder = 7
                            end
                            object DBEdit38: TDBEdit
                              Left = 622
                              Top = 127
                              Width = 30
                              Height = 21
                              CharCase = ecUpperCase
                              DataField = 'UF'
                              DataSource = dtmNFConsumidor.dsNFCe_Dest
                              TabOrder = 8
                            end
                            object DBEdit39: TDBEdit
                              Left = 23
                              Top = 173
                              Width = 108
                              Height = 21
                              CharCase = ecUpperCase
                              DataField = 'CEP'
                              DataSource = dtmNFConsumidor.dsNFCe_Dest
                              TabOrder = 9
                            end
                            object DBEdit40: TDBEdit
                              Left = 310
                              Top = 173
                              Width = 86
                              Height = 21
                              CharCase = ecUpperCase
                              DataField = 'FONE'
                              DataSource = dtmNFConsumidor.dsNFCe_Dest
                              TabOrder = 10
                            end
                            object Panel55: TPanel
                              Left = 6
                              Top = 211
                              Width = 662
                              Height = 41
                              Align = alBottom
                              BevelKind = bkTile
                              BevelOuter = bvNone
                              TabOrder = 11
                              object BitBtn8: TBitBtn
                                Left = 571
                                Top = 6
                                Width = 75
                                Height = 25
                                Caption = 'Voltar '
                                ModalResult = 2
                                TabOrder = 0
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
                              object btExcluirDest: TBitBtn
                                Left = 259
                                Top = 6
                                Width = 137
                                Height = 25
                                Hint = 'Excluir Destinat'#225'rio'
                                Caption = 'Excluir Destinat'#225'rio'
                                ModalResult = 2
                                TabOrder = 1
                                OnClick = btExcluirDestClick
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
                        end
                        object tsOFM_dbgridLookUp: TTabSheet
                          Caption = 'tsOFM_dbgridLookUp'
                          ImageIndex = 3
                          object dbgridLookUp: TDBGrid
                            Left = 8
                            Top = 27
                            Width = 121
                            Height = 43
                            Options = [dgIndicator, dgColumnResize, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                            TabOrder = 0
                            TitleFont.Charset = DEFAULT_CHARSET
                            TitleFont.Color = clWindowText
                            TitleFont.Height = -11
                            TitleFont.Name = 'Tahoma'
                            TitleFont.Style = []
                            Visible = False
                          end
                        end
                        object tsOF_Frete: TTabSheet
                          Caption = 'tsOF_Frete'
                          ImageIndex = 4
                          object pnFrete: TPanel
                            Left = 4
                            Top = 0
                            Width = 678
                            Height = 150
                            BevelKind = bkTile
                            BevelOuter = bvNone
                            BorderWidth = 6
                            TabOrder = 0
                            object Panel132: TPanel
                              Left = 6
                              Top = 99
                              Width = 662
                              Height = 41
                              Align = alBottom
                              BevelKind = bkTile
                              BevelOuter = bvNone
                              TabOrder = 0
                              object BitBtn17: TBitBtn
                                Left = 571
                                Top = 6
                                Width = 75
                                Height = 25
                                Caption = 'Voltar '
                                ModalResult = 2
                                TabOrder = 0
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
                            object pnFreteCampos: TPanel
                              Left = 6
                              Top = 6
                              Width = 662
                              Height = 87
                              Align = alTop
                              BevelOuter = bvNone
                              TabOrder = 1
                              object Label25: TLabel
                                Left = 56
                                Top = 17
                                Width = 83
                                Height = 13
                                Caption = 'Modalidade Frete'
                              end
                              object Label26: TLabel
                                Left = 181
                                Top = 17
                                Width = 69
                                Height = 13
                                Caption = 'Transportador'
                                FocusControl = DBEdit16
                              end
                              object Label92: TLabel
                                Left = 541
                                Top = 17
                                Width = 26
                                Height = 13
                                Caption = 'Frete'
                                FocusControl = DBEdit51
                              end
                              object DBEdit16: TDBEdit
                                Left = 181
                                Top = 36
                                Width = 63
                                Height = 21
                                DataField = 'TR_CODIGO'
                                DataSource = dtmNFConsumidor.dsNFCe
                                TabOrder = 0
                                OnExit = DBEdit16Exit
                                OnKeyDown = DBEdit16KeyDown
                              end
                              object DBEdit17: TDBEdit
                                Left = 250
                                Top = 36
                                Width = 285
                                Height = 21
                                DataField = 'RAZAO'
                                DataSource = dtmNFConsumidor.dsTransporta
                                Enabled = False
                                TabOrder = 1
                              end
                              object DBEdit61: TDBEdit
                                Left = 541
                                Top = 36
                                Width = 63
                                Height = 21
                                DataField = 'VFRETE'
                                DataSource = dtmNFConsumidor.dsNFCe
                                TabOrder = 2
                              end
                              object DBLookupComboBox2: TDBLookupComboBox
                                Left = 56
                                Top = 36
                                Width = 119
                                Height = 21
                                DataField = 'MODFRETE'
                                DataSource = dtmNFConsumidor.dsNFCe
                                DropDownWidth = 200
                                TabOrder = 3
                                OnEnter = DBLookupComboBox2Enter
                                OnExit = DBLookupComboBox2Exit
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                  object pnTopCadastro: TPanel
                    Left = 0
                    Top = 27
                    Width = 762
                    Height = 62
                    Align = alTop
                    BevelOuter = bvNone
                    BorderWidth = 4
                    TabOrder = 1
                    object Panel40: TPanel
                      Left = 4
                      Top = 4
                      Width = 754
                      Height = 54
                      Align = alClient
                      BevelKind = bkTile
                      BevelOuter = bvNone
                      TabOrder = 0
                      object Panel41: TPanel
                        Left = 0
                        Top = 0
                        Width = 495
                        Height = 50
                        Align = alLeft
                        BevelOuter = bvNone
                        Enabled = False
                        TabOrder = 0
                        object Label42: TLabel
                          Left = 8
                          Top = 3
                          Width = 33
                          Height = 13
                          Caption = 'C'#243'digo'
                          FocusControl = DBEdit19
                        end
                        object Label43: TLabel
                          Left = 87
                          Top = 3
                          Width = 68
                          Height = 13
                          Caption = 'Data cadastro'
                          FocusControl = DBEdit20
                        end
                        object Label44: TLabel
                          Left = 182
                          Top = 3
                          Width = 31
                          Height = 13
                          Caption = 'Status'
                          FocusControl = DBEdit21
                        end
                        object Label45: TLabel
                          Left = 277
                          Top = 3
                          Width = 74
                          Height = 13
                          Caption = 'Situa'#231#227'o NFC-e'
                          FocusControl = DBEdit22
                        end
                        object Label46: TLabel
                          Left = 372
                          Top = 3
                          Width = 37
                          Height = 13
                          Caption = 'Numero'
                          FocusControl = DBEdit23
                        end
                        object Label47: TLabel
                          Left = 447
                          Top = 3
                          Width = 24
                          Height = 13
                          Caption = 'S'#233'rie'
                          FocusControl = DBEdit24
                        end
                        object DBEdit19: TDBEdit
                          Left = 8
                          Top = 22
                          Width = 73
                          Height = 21
                          DataField = 'COD_NFCE'
                          DataSource = dtmNFConsumidor.dsNFCe
                          TabOrder = 0
                        end
                        object DBEdit20: TDBEdit
                          Left = 87
                          Top = 22
                          Width = 89
                          Height = 21
                          DataField = 'DATA_CAD'
                          DataSource = dtmNFConsumidor.dsNFCe
                          TabOrder = 1
                        end
                        object DBEdit21: TDBEdit
                          Left = 182
                          Top = 22
                          Width = 89
                          Height = 21
                          DataField = 'STATUS'
                          DataSource = dtmNFConsumidor.dsNFCe
                          TabOrder = 2
                        end
                        object DBEdit22: TDBEdit
                          Left = 277
                          Top = 22
                          Width = 89
                          Height = 21
                          DataField = 'SITUACAO_NFCE'
                          DataSource = dtmNFConsumidor.dsNFCe
                          TabOrder = 3
                        end
                        object DBEdit23: TDBEdit
                          Left = 372
                          Top = 22
                          Width = 69
                          Height = 21
                          DataField = 'NUM_NF'
                          DataSource = dtmNFConsumidor.dsNFCe
                          TabOrder = 4
                        end
                        object DBEdit24: TDBEdit
                          Left = 447
                          Top = 22
                          Width = 48
                          Height = 21
                          DataField = 'SERIE'
                          DataSource = dtmNFConsumidor.dsNFCe
                          TabOrder = 5
                        end
                      end
                      object Panel42: TPanel
                        Left = 495
                        Top = 0
                        Width = 255
                        Height = 50
                        Align = alClient
                        BevelOuter = bvNone
                        BorderWidth = 3
                        TabOrder = 1
                        object Label48: TLabel
                          Left = 3
                          Top = 3
                          Width = 249
                          Height = 13
                          Align = alTop
                          Caption = 'Retorno NFC-e'
                          ExplicitWidth = 72
                        end
                        object Panel43: TPanel
                          Left = 3
                          Top = 22
                          Width = 249
                          Height = 25
                          Align = alBottom
                          BevelOuter = bvNone
                          TabOrder = 0
                          object Panel45: TPanel
                            Left = 0
                            Top = 0
                            Width = 249
                            Height = 21
                            Align = alTop
                            BevelOuter = bvNone
                            TabOrder = 0
                            object SpeedButton9: TSpeedButton
                              Left = 226
                              Top = 0
                              Width = 23
                              Height = 21
                              Align = alRight
                              Caption = '...'
                              OnClick = SpeedButton9Click
                              ExplicitLeft = 80
                              ExplicitTop = 8
                              ExplicitHeight = 22
                            end
                            object Panel46: TPanel
                              Left = 0
                              Top = 0
                              Width = 226
                              Height = 21
                              Align = alClient
                              BevelOuter = bvNone
                              Enabled = False
                              TabOrder = 0
                              object DBEdit25: TDBEdit
                                Left = 0
                                Top = 0
                                Width = 226
                                Height = 21
                                Align = alClient
                                DataField = 'MSGRETORNO'
                                DataSource = dtmNFConsumidor.dsNFCe
                                TabOrder = 0
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                  object pn_inf_nfce_local: TPanel
                    Left = 0
                    Top = 0
                    Width = 762
                    Height = 27
                    Align = alTop
                    BevelOuter = bvNone
                    Caption = 'NFCe LOCAL'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clRed
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    ParentFont = False
                    TabOrder = 2
                  end
                end
              end
            end
            inherited Panel3: TPanel
              Top = 511
              Width = 787
              ExplicitTop = 511
              ExplicitWidth = 787
              inherited LabelSeq: TLabel
                Left = 406
                Top = -2
                Enabled = False
                Visible = False
                ExplicitLeft = 406
                ExplicitTop = -2
              end
              inherited BitBtn4: TBitBtn
                Left = 573
                Top = -12
                Enabled = False
                Visible = False
                ExplicitLeft = 573
                ExplicitTop = -12
              end
              inherited BitBtn5: TBitBtn
                Left = 687
                Top = 9
                ExplicitLeft = 687
                ExplicitTop = 9
              end
              inherited BitBtn6: TBitBtn
                Left = 492
                Top = -12
                Enabled = False
                Visible = False
                ExplicitLeft = 492
                ExplicitTop = -12
              end
              inherited CheckCadSeq: TCheckBox
                Left = 399
                Top = -2
                Enabled = False
                Visible = False
                ExplicitLeft = 399
                ExplicitTop = -2
              end
              object btAtalhoItens: TBitBtn
                Left = 20
                Top = 9
                Width = 94
                Height = 25
                Caption = 'Itens - F5'
                TabOrder = 4
                OnClick = btAtalhoItensClick
                Glyph.Data = {
                  36050000424D3605000000000000360400002800000010000000100000000100
                  08000000000000010000230B0000230B0000000100000001000000000000CECE
                  CE00D6D6D600E7E7E700FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
                  0404040404040404040404040303030303030301010101010404040305050500
                  0303000300010101010404030505050005000503000301010104040305000505
                  0505050505030300010404030500050505050505050503000104040305000500
                  0005000005000300010404030500050000050000050005000304040305000500
                  0005000005000500030404030500050000050000050005000304040403030303
                  0303030303030303040404040404040404040404040404040404040404040404
                  0404040404040404040404040404040404040404040404040404}
              end
              object btAtalhoCabecalho: TBitBtn
                Left = 120
                Top = 9
                Width = 94
                Height = 25
                Caption = '+ Dados - F6'
                TabOrder = 5
                OnClick = btAtalhoCabecalhoClick
                Glyph.Data = {
                  36050000424D3605000000000000360400002800000010000000100000000100
                  08000000000000010000420B0000420B00000001000000010000CE630000CE63
                  6300FF9C9C00FFD6A500FFD6AD00FFDEB500FFE7C600FFEFD600FFF7E700FFFF
                  F700FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000A0A0A0A0A0A
                  0A0A0A0A0A0A0A0A0A0A0A0000000000000000000000000000000A000B0B0908
                  070605040404040404000A000B010109010106010104010104000A000B0B0B0B
                  090807060504040404000A000B01010B020208020205020204000A000B0B0B0B
                  0B0B09080706050404000A000B01010B02020B020208020204000A000B0B0B0B
                  0B0B0B0B0908070305000A000B01010B02020B02020B020206000A000B0B0B0B
                  0B0B0B0B0B0B090807000A000B0B0B0B0B0B0B0B0B0B0B0908000A0000000000
                  000000000000000000000A0A000000000000000000000000000A0A0A0A0A0A0A
                  0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A}
              end
              object btAtalhoValores: TBitBtn
                Left = 220
                Top = 9
                Width = 94
                Height = 25
                Caption = 'Totais - F7'
                TabOrder = 6
                OnClick = btAtalhoValoresClick
                Glyph.Data = {
                  36050000424D3605000000000000360400002800000010000000100000000100
                  08000000000000010000130B0000130B00000001000000010000000000008484
                  8400FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00020202020202
                  0202020202020202020202020202020202020202020202020202020202020202
                  0202020202020202020202020202020202020202020202020202020202000000
                  0000000000000202020202020201000001020202020002020202020202020100
                  0001020202020202020202020202020100000102020202020202020202020202
                  0100000202020202020202020202020100000102020202020202020202020100
                  0001020202020202020202020201000001020202020002020202020202000000
                  0000000000000202020202020202020202020202020202020202020202020202
                  0202020202020202020202020202020202020202020202020202}
              end
              object btAtalhoFechamento: TBitBtn
                Left = 320
                Top = 9
                Width = 121
                Height = 25
                Caption = 'Pagamentos - F8'
                TabOrder = 7
                OnClick = btAtalhoFechamentoClick
                Glyph.Data = {
                  DA020000424DDA02000000000000DA0100002800000010000000100000000100
                  08000000000000010000120B0000120B0000690000006900000000000000FFFF
                  FF00FF00FF006B4E6A0075505B009E4B1100984C0F00974B0F00994D1000B172
                  4100B5651A00B5661C00B6671D00B5671E00FFB77400B2641900B4651A00CB77
                  2200CC782300CB772300CE7A2700D3802E00CE7F2F00D8883800EE9A4500C581
                  4100F4A65A00F3A96300834C1000E78A2100E28A2800DA872A00CC7D2A00DE8B
                  2E00DD892E00E18E3200E08E3400E2913A00E7973F00EE9F4700DE9E5800ED90
                  2300E3933800DE913800F4A95000B48B5300485A13003067190030691A00478A
                  31002A6919002B882D0028892D0028882C0028872C00298A2D002A8B2E00066B
                  0F00086F12000D8621001F97310006821D00179D3100229F390023A33C0026A5
                  3F0028A943002AAC45002BB84C002CB84C002FB74F002DB14A0020B746001FBC
                  4C001FBB4C0021BD4E0024C452001CC14F001CC04E001EC450001FC5520023CA
                  570021C04F0022C0500026C555002BD55F002CCE5B0035DC66001FD05A001FC5
                  530026D45D0026CF5B0028D15D0029DD660034F87A0041FE810047FF8E003782
                  C100417EAF00168BFF001781EF000B4BE2001045CB000013FF000013EE000202
                  0202020202020202020202020202020707070707070707070707020202020729
                  2929292929292929292907020202072C262A2321290367656361070202020727
                  2524221F1D04686664620602020207272524221F1D1E09192D28080202020716
                  0D0C0B100F0A1517181B05020202072B20141211131415171A0E1C3232020207
                  07070707070707070707312E5E320202022E4647434241403F3C3D5D5E320202
                  0232555B51504F4D4E59393A483202020230455B51504F4D4E585A3B3E320202
                  0230443338373435365456575F320202022F5C4C534B4A495254565760320202
                  020232323232323232323232320202020202020202020202020202020202}
              end
              object btAtalhoEmitir: TBitBtn
                Left = 447
                Top = 9
                Width = 107
                Height = 25
                Hint = 'Emitir NFC-e - [NFC011]'
                Caption = 'Emitir - F9'
                TabOrder = 8
                OnClick = btAtalhoEmitirClick
                Glyph.Data = {
                  36030000424D3603000000000000360000002800000010000000100000000100
                  18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FF9F9D9EFF00FFFF00FFFF00FF8281818281818E8A
                  8BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9F9D9E9F9D9ED4D1D196
                  93933B393A545253999797C5C2C4D7D5D5828181FF00FFFF00FFFF00FFFF00FF
                  9F9D9E9F9D9EFAFAFAFFFFFFD7D4D59E9C9C4443451C1C1E1C1C1F3534356766
                  678281818E8A8BFF00FF918E8F9F9D9EF0EEEFFFFFFFEEEBEBCAC9C99F9D9E8E
                  8A8A9793958786866463633C3B3D1F2022201F21747273FF00FF9C9899E9E7E7
                  E5E5E5BDBBBBA6A4A4B4B1B1C2C1C1A4A1A19692939290909793959A98988E8A
                  8B6B6A6A828181FF00FF959192ADABACA4A1A1B0AFAFC9C9C9D1D3D3EDEDEBF0
                  EEF0DCDADAC5C4C4ADABAB9A98999390909793958E8A8BFF00FF918E8FAFADAF
                  C9C7C7CECECEC9C9C9E2E2E2D1CFCFA1ABA1BDBCBCCBCECFD5D5D5D3D3D3C6C5
                  C5B6B6B6989797FF00FFFF00FF9C999AD0D1D1CFCFCFDCDCDCC9C6C6B5B0B4A5
                  D1A7BAC4BCC5A7A1ADA4A3A9A6A7B4B1B2C2C1C1A9A6A7FF00FFFF00FFFF00FF
                  9C999AC1BFBFAFADADB1B0B0E3E3E3F6F3F3EEEDEEEDE1DEDCD8D8CCCCCCB4B4
                  B4939091FF00FFFF00FFFF00FFFF00FFFF00FF9C999AD8DADACACACB9D9FA0BB
                  BFC1D3D5D7D4D9D9D5D5D5C6C5C6AFADADFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFBE5E1F8E0D4E9C9BDE3C7BDE2CCC7DED3CED0CECC959295FF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCE9F9DFFDECEFFCFBDFF
                  C4AFFFBAA3FFB199FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFCE9F9DFFDDCEFFCCBCFEC2B0FFBBA4F7A992FF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCE9F9DFFDDCEFFCCBCFE
                  C2B0FEB8A3FAB099FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFCE9F9DFAE0D5FFDACCFFCEBDFFC6B1FCB8A3F8AD99FF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCE9F9DCE9F9DCE9F9DCE9F9DF3
                  AD9DF3AD9DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
              end
              object pnMenu: TPanel
                Left = 582
                Top = 9
                Width = 84
                Height = 25
                BevelKind = bkTile
                BevelOuter = bvNone
                Caption = 'Menu - F11'
                TabOrder = 9
                OnClick = pnMenuClick
              end
            end
          end
        end
        inherited TabSheet2: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 787
          ExplicitHeight = 559
          inherited GroupBox3: TGroupBox
            Width = 787
            Height = 201
            ExplicitWidth = 787
            ExplicitHeight = 201
            inherited imgInformation: TImage
              Left = 761
              Height = 184
              ExplicitLeft = 761
              ExplicitHeight = 184
            end
            object SpeedButton59: TSpeedButton [6]
              Left = 634
              Top = 44
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
              OnClick = SpeedButton59Click
            end
            object bt_outras_nf: TSpeedButton [7]
              Left = 719
              Top = 44
              Width = 23
              Height = 22
              Flat = True
              Glyph.Data = {
                36030000424D3603000000000000360000002800000010000000100000000100
                1800000000000003000000000000000000000000000000000000FF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FF000000000000FF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
                0000000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
                0000000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FF000000000000FF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FF000000000000FF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
                0000000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
              OnClick = bt_outras_nfClick
            end
            object btSelectAll: TSpeedButton [8]
              Left = 663
              Top = 44
              Width = 23
              Height = 21
              Hint = 'Selecionar todos'
              Flat = True
              Glyph.Data = {
                CE010000424DCE01000000000000CE0000002800000010000000100000000100
                08000000000000010000120B0000120B0000260000002600000000000000FFFF
                FF00FF00FF00A4262600BA414100BB444400BD4A4A00BD4B4B00BF4E4E00C050
                5000C0515100C1535300C1545400C55C5C00CB6C6C00CF777700D17D7D00D483
                8300004B0000098611000C9C19000A8615000C9518000D931A000F9E1C000F99
                1C000E9D1D000F9D1E0011A4220011A02100139224001CB135001CA1340024BC
                430029B548002EC6520035CA5E0039D465000202020202020202020202020202
                0202020202020202020202020202020202020202020202021212020202020202
                0202020202020212181B120202020202020202020202121F1C141D1202020202
                02020202021223211E12171A1202020202020202122425201202121519120202
                02020202021222120A03020212161202020202020203120C080B030202121312
                02020202030F0E0803070903020202121202020310110D030203050803020202
                12120202030E0302020202030603020202020202020302020202020203040302
                0202020202020202020202020202030302020202020202020202020202020203
                030202020202020202020202020202020202}
              ParentShowHint = False
              ShowHint = True
              OnClick = btSelectAllClick
            end
            object btUnSelectAll: TSpeedButton [9]
              Left = 690
              Top = 44
              Width = 23
              Height = 21
              Hint = 'Desfazer sele'#231#227'o'
              Flat = True
              Glyph.Data = {
                AA010000424DAA01000000000000AA0000002800000010000000100000000100
                08000000000000010000120B0000120B00001D0000001D00000000000000FFFF
                FF00FF00FF00CACACA00C4C4C400BFBFBF00BCBCBC00B8B8B800B5B5B500AEAE
                AE00ABABAB00A5A5A500A4A4A4009F9F9F009E9E9E009D9D9D009C9C9C009B9B
                9B009A9A9A009999990098989800979797009494940093939300929292008C8C
                8C008A8A8A007A7A7A0065656500020202020202020202020202020202020202
                02020202020202020202020202020202020202021C1C02020202020202020202
                0202021C12121C02020202020202020202021C0A0E15101C0202020202020202
                021C0508141C16131C020202020202021C04030B1C021C19141C020202020202
                021C081C0F1B02021C171C0202020202021B1C0D110E1B02021C1A1C02020202
                1B0809111B13101B0202021C1C02021B07060C1B021B16111B0202021C1C0202
                1B091B020202021B141B020202020202021B0202020202021B181B0202020202
                020202020202020202021B1B0202020202020202020202020202021B1B020202
                0202020202020202020202020202}
              ParentShowHint = False
              ShowHint = True
              OnClick = btUnSelectAllClick
            end
            object lb_nfcelocal: TLabel [10]
              Left = 583
              Top = 18
              Width = 75
              Height = 16
              Caption = 'NFCe LOCAL'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            inherited BitBtn1: TBitBtn
              Hint = 'Consultar NFC-e - [NFC008]'
            end
            inherited BitBtn2: TBitBtn
              Left = 667
              ExplicitLeft = 667
            end
            inherited BitBtn3: TBitBtn
              Hint = 'Nova NFC-e - [NFC009] - [NFC]'
            end
            object ckContingenciaPendentes: TCheckBox
              Left = 440
              Top = 47
              Width = 188
              Height = 17
              Caption = 'Conting'#234'ncias Pendentes de envio'
              TabOrder = 11
            end
            object gr_status: TGroupBox
              Left = 7
              Top = 73
              Width = 98
              Height = 104
              Caption = 'Status'
              TabOrder = 12
              Visible = False
              object Panel116: TPanel
                Left = 2
                Top = 15
                Width = 94
                Height = 87
                Align = alClient
                BevelOuter = bvNone
                Padding.Left = 3
                Padding.Right = 3
                Padding.Bottom = 3
                TabOrder = 0
                object gb_status: TCheckListBox
                  Left = 3
                  Top = 0
                  Width = 88
                  Height = 84
                  Align = alClient
                  Ctl3D = False
                  ItemHeight = 13
                  Items.Strings = (
                    'Aberta'
                    'Fechada'
                    'Fechando'
                    'Cancelada'
                    'A Cancelar')
                  ParentCtl3D = False
                  TabOrder = 0
                end
              end
            end
            object gr_situacao: TGroupBox
              Left = 111
              Top = 73
              Width = 238
              Height = 104
              Caption = 'Situa'#231#227'o NFCe'
              TabOrder = 13
              Visible = False
              object Panel119: TPanel
                Left = 2
                Top = 15
                Width = 234
                Height = 87
                Align = alClient
                BevelOuter = bvNone
                Padding.Left = 3
                Padding.Right = 3
                Padding.Bottom = 3
                TabOrder = 0
                object gb_situacao: TCheckListBox
                  Left = 3
                  Top = 0
                  Width = 228
                  Height = 84
                  Align = alClient
                  Columns = 2
                  Ctl3D = False
                  ItemHeight = 13
                  Items.Strings = (
                    'Autorizada'
                    'Cancelada'
                    'Inutilizada'
                    'Denegada'
                    'Enviando'
                    'Em Processamento'
                    'Rejeitada'
                    '[Sem Situa'#231#227'o]')
                  ParentCtl3D = False
                  TabOrder = 0
                end
              end
            end
            object gr_adicional: TGroupBox
              Left = 355
              Top = 73
              Width = 343
              Height = 104
              Caption = 'Pesquisa Adicional'
              TabOrder = 14
              Visible = False
              OnExit = gr_adicionalExit
              object Label144: TLabel
                Left = 10
                Top = 54
                Width = 47
                Height = 13
                Alignment = taRightJustify
                Caption = 'Conte'#250'do'
              end
              object Label150: TLabel
                Left = 20
                Top = 28
                Width = 37
                Height = 13
                Caption = 'Campo:'
              end
              object Label151: TLabel
                Left = 147
                Top = 54
                Width = 20
                Height = 13
                Caption = 'at'#233':'
              end
              object Label153: TLabel
                Left = 9
                Top = 76
                Width = 48
                Height = 13
                Caption = 'Condi'#231#227'o:'
              end
              object ed_ad_campo: TComboBox
                Left = 63
                Top = 20
                Width = 187
                Height = 21
                Hint = 'Campo filtro da pesquisa adicional. Informe o campo desejado'
                ItemHeight = 13
                TabOrder = 0
                Text = 'ed_ad_campo'
                OnEnter = ComboBox1Enter
                OnExit = ed_ad_campoExit
              end
              object ed_ad_valor: TMaskEdit
                Left = 63
                Top = 46
                Width = 187
                Height = 21
                CharCase = ecUpperCase
                TabOrder = 1
              end
              object ed_ad_datafim: TMaskEdit
                Left = 177
                Top = 46
                Width = 75
                Height = 21
                EditMask = '!99/99/0000;1;_'
                MaxLength = 10
                TabOrder = 3
                Text = '  /  /    '
                Visible = False
              end
              object ed_ad_dataini: TMaskEdit
                Left = 63
                Top = 46
                Width = 69
                Height = 21
                EditMask = '!99/99/0000;1;_'
                MaxLength = 10
                TabOrder = 2
                Text = '  /  /    '
                Visible = False
              end
              object ed_ad_condicao: TComboBox
                Left = 63
                Top = 73
                Width = 187
                Height = 21
                ItemHeight = 13
                TabOrder = 4
                Text = 'Come'#231'a'
                OnEnter = ComboBox1Enter
                OnExit = ed_ad_condicaoExit
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
            Top = 201
            Width = 787
            Height = 358
            Caption = 'Sem Registros para apresentar'
            ExplicitTop = 201
            ExplicitWidth = 787
            ExplicitHeight = 358
            inherited Splitter1: TSplitter
              Height = 297
              ExplicitHeight = 376
            end
            inherited DBGrid1: TDBGrid
              Width = 494
              Height = 297
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
              OnDrawColumnCell = DBGrid1DrawColumnCell
              OnKeyDown = DBGrid1KeyDown
            end
            inherited Panel2: TPanel
              Width = 783
              ExplicitWidth = 783
              inherited SpeedButton1: TSpeedButton
                Top = 2
                Hint = 'Alterar NFC-e - [NFC010]'
                ExplicitTop = 2
              end
              inherited SpeedButton2: TSpeedButton
                Top = 2
                Hint = 'Excluir NFC-e sem n'#250'mero - [NFC012]'
                OnClick = SpeedButton2Click
                ExplicitTop = 2
              end
              inherited SpeedButton3: TSpeedButton
                Top = 2
                Hint = 'Imprimir NFC-e - [NFC013]'
                OnClick = SpeedButton3Click
                ExplicitTop = 2
              end
              inherited SpeedButton4: TSpeedButton
                Left = 730
                Enabled = False
                Visible = False
                ExplicitLeft = 730
              end
              inherited SpeedButton5: TSpeedButton
                Left = 730
                Enabled = False
                Visible = False
                ExplicitLeft = 730
              end
              inherited SpeedButton6: TSpeedButton
                Left = 235
                Top = 2
                Hint = 'Enviar email NFC-e - [NFC014]'
                Glyph.Data = {
                  F6060000424DF606000000000000360000002800000018000000180000000100
                  180000000000C0060000130B0000130B00000000000000000000FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF801C00FF00FFFF00FFFF00FFFF
                  00FFFF00FFB69C8C4E2E1C4E2E1C4E2E1C4E2E1C4E2E1C4E2E1C4E2E1C4E2E1C
                  4E2E1C4E2E1C4E2E1C4E2E1C4E2E1C4E2E1C4E2E1C4E2E1C4E2E1C801C00801C
                  00FF00FFFF00FFFF00FFFF00FFC1A696F8F6F4A48B7AA48B7AA48B7AA48B7AA4
                  8B7AA48B7AA48B7AA48B7AA48B7AA48B7AA48B7AA48B7AA48B7ACB4C1E801C00
                  801C00801C00B05323801C00FF00FFFF00FFFF00FFC1A696FCFAFAF8F6F4F6F0
                  EFF3EDEAEFE9E5EDE3E0EAE0DAE7DCD5E5D7D0E1D3CBDECEC6DCCAC1D8C6BCD5
                  C1B7CB4C1EFAB48AD58445CF7733CF7733B05323801C00FF00FFFF00FFC1A696
                  FFFFFFFCFAFAF8F6F4F6F0EFF3EDEAEFE9E5EDE3E0EAE0DAE7DCD5E5D7D0E1D3
                  CBDECEC6DCCAC1D8C6BCCB4C1EFAB48AE1935CD58445CF7733CF7733B0532380
                  1C00FF00FFC1A696FFFFFFFFFFFFFCFAFAF8F6F4EF963FEF963FEF963FEF963F
                  EF963FEF963FEF963FEF963FDECEC6DCCAC1CB4C1EFAB48AFAB48AFAB48AFAB4
                  8AB05323801C00FF00FFFF00FFC1A696FFFFFFFFFFFFFFFFFFFCFAFAF8F6F4F6
                  F0EFF3EDEAEFE9E5EDE3E0EAE0DAE7DCD5E5D7D0E1D3CBDECEC6CB4C1ECB4C1E
                  CB4C1ECB4C1EE1935C801C00FF00FFFF00FFFF00FFC1A696FFFFFFFFFFFFFFFF
                  FFFFFFFFFCFAFAF8F6F4F6F0EFF3EDEAEFE9E5EDE3E0EAE0DAE7DCD5E5D7D0E1
                  D3CBDECEC6DCCAC1D8C6BCCB4C1E801C00FF00FFFF00FFFF00FFFF00FFC1A696
                  FFFFFFFFFFFFFFFFFFFFFFFFEF963FEF963FEF963FEF963FEF963FEF963FEF96
                  3FEF963FE7DCD5E5D7D0E1D3CBDECEC6DCCAC1801C004E2E1CFF00FFFF00FFFF
                  00FFFF00FFC1A696FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFCFCFBF8F7
                  F7F3F2F4EFEDF2EAE7EEE6E2EBE2DDE9DDD8E6D9D3E3D5CEE0D0C9A48B7A4E2E
                  1C4E2E1C4E2E1CFF00FFFF00FFC1A696FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFEFCFCFBF8F7F7F3F2F4EFEDF2EAE7EEE6E21C4FD11C4FD11C4FD1
                  E3D5CEA48B7A4E2E1CA48B7A4E2E1CFF00FFFF00FFC1A696FFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFCFCFBF8F7F7F3F2F4EFEDF2EAE71C
                  3166458BF81C4FD1E6D9D3A48B7A4E2E1CA48B7A4E2E1CFF00FFFF00FFC1A696
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFCFCFBF8
                  F7F7F3F2F4EFED2353DA458BF81C4FD1E9DDD8A48B7A4E2E1CA48B7A4E2E1CFF
                  00FFFF00FFC1A696FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFEFCFCFBF8F7F7F3F2F4EFEDF2EAE7EEE6E2EBE2DDE9DDD84E2E
                  1CA48B7A4E2E1CFF00FFFF00FFC1A696C1A696C1A696C1A696C1A696C1A696C1
                  A696C1A696C1A696C1A696C1A696C1A696C1A696C1A696C1A696C1A696C1A696
                  C1A696C1A696C1A696A48B7A4E2E1CFF00FFFF00FFFF00FFFF00FFC1A696FFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F0EFF3EDEAEFE9E5EDE3E0EAE0DAE7
                  DCD5E5D7D0E1D3CBDECEC6DCCAC1D8C6BCA48B7A4E2E1CFF00FFFF00FFFF00FF
                  FF00FFC1A696FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEF963FEF963FEF963FEF96
                  3FEF963FEF963FEF963FE7DCD5E5D7D0E1D3CBDECEC6DCCAC1A48B7A4E2E1CFF
                  00FFFF00FFFF00FFFF00FFC1A696FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FEFCFCFBF8F7F7F3F2F4EFEDF2EAE7EEE6E2EBE2DDE9DDD8E6D9D3E3D5CEE0D0
                  C9A48B7A4E2E1CFF00FFFF00FFFF00FFFF00FFC1A696FFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFEFCFCFBF8F7F7F3F2F4EFEDF2EAE7EEE6E21C4FD1
                  1C4FD11C4FD1E3D5CEA48B7A4E2E1CFF00FFFF00FFFF00FFFF00FFC1A696FFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFCFCFBF8F7F7F3F2F4
                  EFEDF2EAE71C3166458BF81C4FD1E6D9D3A48B7A4E2E1CFF00FFFF00FFFF00FF
                  FF00FFC1A696FFFFFF2F5DF62F5DF62F5DF6FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFEFCFCFBF8F7F7F3F2F4EFED2353DA458BF81C4FD1E9DDD8A48B7A4E2E1CFF
                  00FFFF00FFFF00FFFF00FFC1A696FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFEFCFCFBF8F7F7F3F2F4EFEDF2EAE7EEE6E2EBE2
                  DDE9DDD84E2E1CFF00FFFF00FFFF00FFFF00FFC1A696C1A696C1A696C1A696C1
                  A696C1A696C1A696C1A696C1A696C1A696C1A696C1A696C1A696C1A696C1A696
                  C1A696C1A696C1A696C1A696C1A696FF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                OnClick = SpeedButton6Click
                ExplicitLeft = 235
                ExplicitTop = 2
              end
              inherited SpeedButton7: TSpeedButton
                Left = 349
                Top = 2
                Hint = 'Inutilizar NFC-e - [NFC016]'
                Glyph.Data = {
                  F6060000424DF606000000000000360000002800000018000000180000000100
                  180000000000C0060000E30F0000E30F00000000000000000000FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FF000098FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
                  0098FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FF1B48FB000098FF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FF0000981B48FBFF00FFFF00FF6C8C9C29364329364329364329364329
                  36432936432936432936432936432936432936431B48FB002EE4293643293643
                  2936432936432936430000981B48FB1B48FBFF00FF6C8C9C335D71335D71335D
                  71335D71335D71335D71335D71335D71335D71335D71335D71335D71335D711B
                  48FB0000985CCAE177DEEB85E9F00000981B48FB1B48FBFF00FFFF00FF6C8C9C
                  8DEFF353A3B753A3B753A3B753A3B753A3B753A3B753A3B753A3B753A3B753A3
                  B753A3B753A3B753A3B71B48FB0000985CCAE10000981B48FB1B48FBFF00FFFF
                  00FFFF00FF6C8C9C92F4F68DEFF387EBF182E7EF7CE2ED77DEEB71DAE96CD6E7
                  66D2E561CDE25BC9E056C5DE50C0DC53A3B73056FC1B48FB1B48FB1B48FB1B48
                  FB293643FF00FFFF00FFFF00FF6C8C9C98F8F892F4F68DEFF387EBF182E7EF7C
                  E2ED77DEEB71DAE96CD6E766D2E561CDE25BC9E056C5DE53A3B785E9F01B48FB
                  1B48FB1B48FB5CCAE1293643FF00FFFF00FFFF00FF6C8C9C98F8F898F8F892F4
                  F68DEFF387EBF182E7EF7CE2ED77DEEB71DAE96CD6E766D2E561CDE25BC9E053
                  A3B70000981B48FB1B48FB1B48FB000098293643FF00FFFF00FFFF00FF6C8C9C
                  98F8F898F8F898F8F892F4F68DEFF387EBF182E7EF7CE2ED77DEEB71DAE96CD6
                  E766D2E561CDE20000987F97FD1B48FB3056FC7F97FD1B48FB000098FF00FFFF
                  00FFFF00FF6C8C9C98F8F898F8F898F8F898F8F892F4F68DEFF387EBF182E7EF
                  7CE2ED77DEEB71DAE96CD6E70000987F97FD002EE456C5DE50C0DC3056FC7F97
                  FD1B48FB000098FF00FFFF00FF6C8C9C98F8F898F8F898F8F898F8F898F8F892
                  F4F68DEFF387EBF182E7EF7CE2ED77DEEB0000987F97FD002EE461CDE25BC9E0
                  56C5DE53A3B73056FC7F97FD1B48FB000098FF00FF6C8C9C98F8F898F8F898F8
                  F898F8F898F8F898F8F895F6F790F2F58AEDF284E9F07FE5EE002EE4002EE46E
                  D8E869D4E664D0E45ECBE153A3B7335D713056FC1B48FB1B48FBFF00FF6C8C9C
                  98F8F898F8F898F8F898F8F898F8F898F8F898F8F895F6F790F2F58AEDF284E9
                  F07FE5EE79E0EC74DCEA6ED8E869D4E664D0E453A3B7335D71293643FF00FFFF
                  00FFFF00FF6C8C9C98F8F898F8F898F8F898F8F898F8F898F8F898F8F898F8F8
                  95F6F790F2F58AEDF284E9F07FE5EE79E0EC74DCEA6ED8E869D4E653A3B7335D
                  71293643FF00FFFF00FFFF00FF6C8C9C98F8F898F8F898F8F898F8F898F8F898
                  F8F898F8F898F8F898F8F895F6F790F2F58AEDF284E9F07FE5EE79E0EC74DCEA
                  6ED8E853A3B7335D71293643FF00FFFF00FFFF00FF6C8C9C98F8F898F8F898F8
                  F898F8F898F8F898F8F898F8F898F8F898F8F898F8F895F6F790F2F58AEDF284
                  E9F07FE5EE79E0EC74DCEA6ED8E8335D716C8C9CFF00FFFF00FFFF00FF6C8C9C
                  6C8C9C6C8C9C6C8C9C6C8C9C6C8C9C6C8C9C6C8C9C6C8C9C6C8C9C6C8C9C6C8C
                  9C6C8C9C6C8C9C6C8C9C6C8C9C6C8C9C6C8C9C6C8C9C6C8C9CFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                OnClick = SpeedButton7Click
                ExplicitLeft = 349
                ExplicitTop = 2
              end
              inherited SpeedButton8: TSpeedButton
                Left = 292
                Top = 2
                Hint = 'Cancelar NFC-e - [NFC015]'
                Glyph.Data = {
                  F6060000424DF606000000000000360000002800000018000000180000000100
                  180000000000C0060000130B0000130B00000000000000000000FF00FFFF00FF
                  FF00FFB44C00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFB44C00AB4401A64813FF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFB44C00AE4600AE4600AC4400B44C00FF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFD0701FFF00FFB44C00C05A0EB04800AF4700AE46
                  00A84102C2621AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFD0701F9F42149A3401D0701FB44C00D57420
                  BC560AB04800AF4700AE4600A74B15FF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC2621A9D36019E36009F4214D0
                  701FB44C00D67724D37524B34C03B04800AF4700AD4500B44C00FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD0701FA24415A13900A038
                  00A04111D0701FFF00FFD0701FC2621AD87E2CC96B1DB14900B04800AF4700AA
                  4301B44C00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC2621AA23A02
                  A33B00A23A00A14312D0701FFF00FFFF00FFFF00FFD0701FCC7025D88333BD5C
                  10B14900B04800AF4700A84406B44C00FF00FFFF00FFFF00FFFF00FFD0701FA4
                  4613A63E00A53D00A43C00A34310D0701FFF00FFFF00FFFF00FFFF00FFFF00FF
                  D0701FD37D31D58235B54F04B14900B04800AF4700A8470EB44C00FF00FFFF00
                  FFC2621AA63E02A84000A73F00A63E00A44410D0701FFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFD0701FD6853ACC762AB24A00B14900B04800AF4700
                  A84B15B44C00A64813AB4300AA4200A94100A84000A64510D0701FFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD0701FD38339BF6116B2
                  4A00B14900B04800AF4700AB4300AD4500AC4400AB4300AA4200A7450DD0701F
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFD0701FC7712AB65105B24A00B14900B04800AF4700AE4600AE4600AD4500A8
                  460DD0701FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFD0701FB34F07B34B00B24A00B14900B04800AF47
                  00AF4700A9450AD0701FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB44C00B44D01B44C00B34B00
                  B24A00B14900B04800AF4700D0701FFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB44C00B64F01B6
                  4E00B54D00B44C00B34B00B24A00B14900B04800AB4402D0701FFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB44C
                  00B75001B85000B74F00B64E00B54D00B54E01B75206B24A00B14900B04800AA
                  4405D0701FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFB44C00B85101BA5200B95100B85000B74F00BB5607CF7629B66025BE59
                  11B64F03B14900B04800AB4506D0701FFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFB44C00BA5301BC5400BB5300BA5200B95200C46312D47F32
                  B44C00FF00FFBD601EBD601EB95307B24A00B14900AB4505D0701FFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFB44C00BB5401BE5600BD5500BC5400BD5602CD
                  7120D78336B44C00FF00FFFF00FFFF00FFD0701FC2621ABE5C0FB24A00B14900
                  AB4302D0701FFF00FFFF00FFFF00FFFF00FFB44C00BB5401C05800BF5700BE56
                  00C35E0AD47D2CD78336B44C00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC2
                  621AC06219B54F04B14900AD4601D0701FFF00FFFF00FFFF00FFB44C00B65004
                  C15900C15900CA6A16D88333D78336B44C00FF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFD0701FC2621ABB5B10B14900AE4701D0701FFF00FFFF
                  00FFFF00FFB44C00BB5502D17522D98535D68235B44C00FF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD0701FBA5E1BB551
                  07AF4801D0701FFF00FFFF00FFFF00FFB44C00B46C3EBB5D18B44C00FF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFD0701FC2621AB85B14A7450BD0701FFF00FFFF00FFFF00FFB44C00B44C
                  00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFC2621AFF00FFFF00FF}
                OnClick = SpeedButton8Click
                ExplicitLeft = 292
                ExplicitTop = 2
              end
              inherited SpeedButton11: TSpeedButton
                Left = 520
                Top = 2
                Hint = 'Detalhes Forma de Pagamento do Pedido vinculado'
                Glyph.Data = {
                  02050000424D0205000000000000C20200002800000018000000180000000100
                  08000000000040020000120B0000120B0000A3000000A3000000BCBADC00BDB2
                  D000BCACC200FF00FF00BBA6B500B0909900FFFEFE008B5B58008E5D5900905E
                  590093655E00AA807A009E6C630095665E00B5918B009A6A600098685F009F67
                  5A00A06F6400A5726500AB796B00C9A19600F6EFED00AC786700A9766600B17B
                  6900E5D0C900FAF2EF00BA7E6500BA826C00B5806A00BD866D00CA9F8C00D5B1
                  A100EDE0DA00F0E5E000CC917300CA8F7200C58C6F00C1896E00E2C5B600CF8B
                  6400C9876400CE8E6900D1906B00D1967400CF957400DCA78A00CF8E6800D093
                  6F00D4987500E0B69C00EFD4C400F3E2D800F8F0EB00E3BFA700E9CEBB00FFFC
                  FA00FFFBF800FEEEE100FFF3E900FCD0A700FED9B800FEDDC000FFE3C900FEE2
                  C900FEE5CE00FEE6D100FEEAD800FFF4EA00FFF6EE00FFC28400FFC58A00FFC6
                  8C00FFC78E00FFCA9500FFCC9800FFD1A300FFD5AA00FFDDBA00FFDEBC00FCDC
                  BD00FBDCBD00FFEBD700F8E5D300FEEBD900FEF0E200FFF2E500FEF4EA00FEF8
                  F200FFFBF700FFC58600FFC48700FFC58900FFC68B00FFC98C00FFC99100FFCA
                  9100FFCB9300FFCC9700FFCF9C00FFCF9D00FFD09E00FFD09F00FFD1A000FFD3
                  A300FFD4A600FFD4A700FFD7AA00FFD8AD00FFD8AF00FFD9B000FFDAB200FFDC
                  B700FFE0BF00FFE1C000FFE2C400FFE3C400FFE3C500FCE1C500FFE5C900FFE7
                  CC00FFE7CE00FFEBD500FFEDDA00FFEFDD00FFEFDE00FA962100FFCF9800FFD1
                  9C00FFD8AA00FFEAD000FFEED900FFF2E200FFF8F000FEF7EF00FFFAF400FAC6
                  8000F8CB9000FFE2BB00FFF2E100FFE0B500FFE7C400FFF6E900FFEFD500FFFA
                  F200FFF3DE00FFFEFC00FFF7E000FFF7D800FFFEED00FFFFDE00FFFFE300FFFF
                  F000FFFFF400FFFFF700FFFFFA00FFFFFB00FFFFFE0000008200BDBDE500FFFF
                  FF00000000000303030303030311110303030303030303030303030303030303
                  03030303111182111111030303030303030303030303030303030303118E118E
                  8E821109030303030303030303030303030303070A1111111111111111111111
                  1111111111030303030303080A8E8B8D82688061484747474747474711030303
                  030303070D8E52053D3D6881805F5B5B5B5B5B5B110303030303100B1095519F
                  3E8D11111111111111111147110303030303100E0F9477043F8B6967644C4B60
                  4A5E5D5C11030303030310200C94429F418E1111111111111111114911030303
                  03141A2012994402439071706E6C6B4D666463621103030303141A20139D3B9F
                  5590111111111111111111651103030303141522189E3C0156927A7875735071
                  706D4E6A110303031C9E201617A1879F58961111111111111111116F11030303
                  1C9E209E19A15A00599A857E7C5383794074724F110303031C2320A11EA1939F
                  3A9C111111111111111111761103032A352821A11DA1A1A006A188864645578C
                  7D847B971103032B362F38A11FA1A19FA1A11111111111111111119711032B33
                  A12F35A127A1A1A0A1A1A1A1A1A19B969A99989711032B34A12F1BA126A1A1A1
                  A1A1A1A139918F8F9797979711032C29342FA1A125A1A1A1A1A1A1A1A139919B
                  11111111110303033137A1A124A1A1A1A1A1A1A1A1A19DA1118989897F030303
                  293038542EA1A1A1A1A1A1A1A1A1A1A111898A7F03030303030330542DA1A1A1
                  A1A1A1A1A1A1A1A111897F030303030303030329323030303030303030303030
                  117F03030303}
                OnClick = SpeedButton11Click
                ExplicitLeft = 520
                ExplicitTop = 2
              end
              inherited SpeedButton12: TSpeedButton
                Left = 463
                Top = 2
                Hint = 'Verificar notas em conting'#234'ncia - [NFC030]'
                Glyph.Data = {
                  C2020000424DC202000000000000820000002800000018000000180000000100
                  08000000000040020000340B0000340B00001300000013000000000000006A50
                  50008F585800E0848400FF848400FF989800FFA1A100FFABAB00FFB6B600FFC0
                  C000EACACA00FFCACA00FFD4D400EAE0E000FFE0E000FFEAEA00FFF4F400FF00
                  FF00FFFFFF001111111111111111111111111111111111111111111111111111
                  1111111111110201010101010101021111111111111111111111111101010101
                  0102000202010101021111111111111111111101010202040407000907040404
                  0102111111111111111101010202040709090009090706040201021111111111
                  11010102070909090909090909090806040201021111111101010207090C0909
                  09090909090909080603020102111111010202090C0B09090909090909090909
                  08060401011111020102090C0E0B090909090909090909090909040401021101
                  01020A0E0C0B09090909090909090909090009040101110102090C0E0B090909
                  0909090909090900000909040201110102090F0F0C0909090909090909000009
                  09090904020111010000000F0E0B090909090000000909090900000001011101
                  02090F0D0E0C0B090909000909090909090909040201110102090F100F0E0C09
                  0909000909090909090909040201110102090F12100F0F0B0909000909090909
                  09090704010111010102090F10100F0B09090009090909090907050401021111
                  0102090F0F12100E0B090009090909080707040201111111010102090F0F100E
                  0B09000909090807050402010211111111010102090F0F0E0C09090909090705
                  04020102111111111111010102090F090B090009090705040201021111111111
                  1111110101020207090900090704040201021111111111111111111101010102
                  0202000202020101021111111111111111111111111101010101010101010211
                  111111111111}
                OnClick = SpeedButton12Click
                ExplicitLeft = 463
                ExplicitTop = 2
              end
              inherited SpeedButton23: TSpeedButton
                Left = 178
                Top = 2
                Hint = 
                  'Enviar NFCes ("", "Enviando", "Em Processamento", "Rejeitadas") ' +
                  '- [NFC011]'
                Glyph.Data = {
                  76060000424D7606000000000000360400002800000018000000180000000100
                  08000000000040020000520B0000520B00000001000000010000EF8C2100EF8C
                  3900FFA53900DE9C5200F7AD52009C635A009C6B5A00A56B5A009C6363006B6B
                  6300736B63009C5A6B009C636B00A5636B00A56B6B00AD6B6B00DEA56B00AD6B
                  7300B5737300847B7300BD7B7300D68C7300EFB57300CE847B00D68C7B00EFBD
                  7B0084848400EFBD8400BD9C8C00EFBD8C00F7CE8C00BDAD9C00F7CE9C00DEBD
                  A500F7CEA500F7D6A500D6B5AD00DEBDAD00EFCEAD00F7D6AD001052B5003963
                  B500DEBDB500EFBDB500EFD6B500F7D6B500DECEBD00DED6BD00F7D6BD00F7DE
                  BD00DECECE00EFD6CE00F7DECE00D6D6D600F7DED600F7EFD6002163DE00F7EF
                  DE001863EF00F7EFEF00FFF7EF00005AF700FFF7F700FFFFF700FF00FF000063
                  FF000073FF00007BFF000084FF00008CFF00218CFF00398CFF00009CFF00109C
                  FF0000A5FF0000ADFF0000B5FF0008BDFF0000CEFF0018CEFF0000D6FF0029D6
                  FF0021DEFF0000EFFF0021EFFF0031EFFF0000F7FF0018F7FF0029F7FF0000FF
                  FF0008FFFF0010FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00404040080E0E
                  0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E40404040400B2C29272322201E1B1B19
                  191919191919190E40404040400B2C3A29282220201D1B1B191919191919190E
                  40404040400B3038413D292220201D1B1B1919191919190E40404040400B3134
                  444242292220201D1B1B19191919190E40404040400B34351A4A424329291A1A
                  1A1A1A1A1A1A190E40404040400C363734314A4C4444292D201D1B1B1919190E
                  40404040400D39393734314A4B4844292D2D1D1B1B19190E40404040400E3935
                  2929294C59574B4829291A1A1A1A190E40404040400F3B3C494C53565659554D
                  45292D201D1B190E4040404040113E3F464C535653505959544C292D201D1B0E
                  4040404040123E351A4C5255585A5959595B291A1A1A1D0E4040404040123E5C
                  5C3E3C4F5659564E4A292D2D2D20200E4040404040123E5C5C5C3E3C394F5653
                  4845292D2D2D200E4040404040143E351A1A1A1A1A1A1A4F514E47291A0A090E
                  4040404040143E5C5C5C5C5C3E3C3939374F47292D20200E4040404040173E5C
                  5C5C5C5C5C3E3C393737372F1F13210E4040404040173E351A1A1A1A1A1A1A1A
                  1A330706050E0E0E4040404040183E5C5C5C5C5C5C5C3F3E3C2A07100301000E
                  4040404040183E5C5C5C5C5C5C5C5C5C3F2A071604020E404040404040183E5C
                  5C5C5C5C5C5C5C5C5C2E0716040E40404040404040185C5C5C5C5C5C5C5C5C5C
                  5C3207160E4040404040404040152526262B252525252424241C070E40404040
                  4040404040404040404040404040404040404040404040404040}
                OnClick = SpeedButton23Click
                ExplicitLeft = 178
                ExplicitTop = 2
              end
              inherited SpeedButton24: TSpeedButton
                Left = 577
                Top = 2
                Hint = 'Movimento Operador'
                Glyph.Data = {
                  76060000424D7606000000000000360400002800000018000000180000000100
                  08000000000040020000130B0000130B00000001000000010000A54A0000CE63
                  0000DE7B0000006363003163630063636300E7A5630063009C0063319C00639C
                  9C009C9C9C009CCECE00B5DEDE00FF00FF00FFCEFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000D0D0D0D0D0D
                  0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D
                  0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D
                  0D0D0D0D0D000000000000000000000000000000000000000D0D0D0D0D090909
                  090909090909090909090909090909000D0D0D0D040404040404040404040404
                  04040404040409000D0D0D0D0303030303030303030303030303030303030400
                  0D0D0D0D090B0B0B0B0B0B0B0B0B0B0B0B0B0B09090A04000D0D0D0D0D090B0B
                  0B0B0B0B0B0B0B0B0B0B0B0B0B0B04000D0D0D0D0D090F0F0F0C0F0F0F0C0F0F
                  0F0C0F0F0F0B05000D0D0D0D0D090F0F0F0C0F0F0F0C0F0F0F0C0F0F0F0B0500
                  0D0D0D0D0D090C0C0C07080808080C0C0C0C0C0C0C0B05000D0D0D0D0D090F0F
                  0F080E0E0E080F0F0F0C0F0F0F0B05000D0D0D0D0D090F0F0F080E0E0E080F0F
                  0F0C0F0F0F0B05000D0D0D0D0D090C0C0C08080808080C0C0C0C0C0C0C0B0500
                  0D0D0D0D0D090F0F0F0C0F0F0F0C0F0F0F0C0F0F0F0B05000D0D0D0D0D090F0F
                  0F0C0F0F0F0C0F0F0F0C0F0F0F0B05000D0D0D0D0D090B0B0B0B0B0B0B0B0B0B
                  0B0B0B0B0B0B04000D0D0D0D0D04040404040404040404040404040404040401
                  0D0D0D0D0D010101010101010101010101010101010101010D0D0D0D0D020202
                  020202020202020202020202020201010D0D0D0D0D0D06060606060606060606
                  06060606060606010D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D
                  0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D}
                OnClick = SpeedButton24Click
                ExplicitLeft = 577
                ExplicitTop = 2
              end
              inherited SpeedButton25: TSpeedButton
                Left = 771
                Enabled = False
                Visible = False
                ExplicitLeft = 771
              end
              inherited SpeedButton26: TSpeedButton
                Left = 406
                Top = 2
                Hint = 
                  'Cancelar/Inutilizar em Lote as NFCe'#39's selecionadas - [NFC015 e N' +
                  'FC016]'
                Glyph.Data = {
                  F6060000424DF606000000000000360000002800000018000000180000000100
                  180000000000C0060000C40E0000C40E00000000000000000000FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FF211F848685B1FF00FFD0D0D06565655151515A5A5A616162
                  2726651B19626565696A6A6A6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C
                  6C7A7A7AFF00FFFF00FFFF00FF1F1CA82E2AB525219B8887B0D6D6D6747472CB
                  CCC3C0C0C143418A24219828259E2C297FC5C7C7D4D4D1D7D7D5D8D8D7D9D9D8
                  DADAD8DADAD9DADBD9656565FF00FFFF00FF5452C12722BE534FD24541C9231F
                  9573729B737372D9DADE2D2B86252296514DD14340C11C19927878ABE2E2DDE9
                  EAE7EEEFEDF1F2F0F2F3F1F4F4F2E8E8E6646464FF00FFFF00FFB3B3DF1E1BB3
                  2621BA544FC94844BF2420923D3C6B4B49912622915450C94440B924209D1E1B
                  86A8A8B9D2D3D5DBDCDDE2E2E4E4E6E6E6E7E6F0F0EEE7E7E6666666FF00FFFF
                  00FFFF00FFFF00FF211EB92621B8514DC24B45BD29259B3632A6514DC34440B6
                  24209C1F1D89565694BEBFC4CDCED4D8D8DDDDDDE1E0E0E2E1E3E3EFEFEEE7E7
                  E7686868FF00FFFF00FFFF00FFFF00FF7A78E31C18AB2823B95651C7524EC744
                  3FC0534FC526229C1A1777515093ACACB5BEBEC9CFCFD8DADAE1E0E0E6E4E4E7
                  E6E6E8EDEDEDE7E7E76C6C6CFF00FFFF00FFFF00FFFF00FFFF00FF5857900D09
                  A9554FCB3A34C3504ACB4541BD0806653D3D6F8A8B959C9CA6AEAEB8BEBFC8CB
                  CCD3D3D4D9D8D8DCDADBDCEAEAEAE6E7E66D6D6DFF00FFFF00FFFF00FFFF00FF
                  FF00FF5B58CA312CBF6B67D56F6BD76560D4736DD7332EAA322F8880818F9A9A
                  A2ADAEB6C1C2CAD1D1D9D9DAE0E0E0E4E2E3E5EAEAEAE7E7E76F6F6FFF00FFFF
                  00FFFF00FFFF00FF5F5CCC332FC17470DA6763D53934C2524DCC807BDD706CD6
                  3733A9353288898997A7A8B0BCBCC4CDCDD4D8D8DEDEDEE1DFE0E2E8E8E8E6E6
                  E6727272FF00FFFF00FFFF00FF5F5CCC3631C37B75DE726DD93B36C312107521
                  1DB63F3BC4908AE27C77D93C38AB36348AA2A3A9B3B3BBC0C0C8CCCDD1D1D2D4
                  D3D3D5E3E3E3E5E5E5747474FF00FFFF00FF7D7AD53731C4817BE1736EDB3F3A
                  C51714854242677371D82522C04640C79C97E6857FDD302CA96C6BA4BEBFC7CC
                  CCD1D3D4D7D6D7DAD8D9DADFDFDFE3E3E3767676FF00FFFF00FFABABDD130EB2
                  4C46CC423CC71C1A963F3F6F868687E4E4EE6766E22824C84A45C8504ACA1310
                  A39898B3BFBFC5C5C7CCCCCCCFCECFD1CCCDCDD7D7D7E2E2E1797979FF00FFFF
                  00FFFF00FF8281E2110CB11E1B9A46457E6B6B6C89898AF0F0F3BABACE6E6CF0
                  312DCC1512AB6D6CA5C1C1C9C8C8CECBCBCFCECFD2CBCCCEC9C9C9CFCFCEDFDF
                  DF7C7C7CFF00FFFF00FFFF00FFFF00FFFF00FF62619A6E6E6F6D6D6D8B8B8CF1
                  F1F4C7C7D3B8B8CD7D7BE76E6DA5C2C2CBC4C5CCC8C8CDC9C9CDC7C7C9C4C5C5
                  BEBEBEC7C8C7DEDEDD7D7D7DFF00FFFF00FFFF00FFFF00FFFF00FF9393937272
                  727979798E8E8EF2F2F4C5C5CFC2C2CAC2C2C9C1C2C9C0C1C5C0C0C5C2C2C5BE
                  BFC0B9BABBB5B5B5B1B1B0BDBEBBDCDCDC808080FF00FFFF00FFFF00FFFF00FF
                  FF00FF777777747474858584909090F2F2F3CACAD1C8C9D0C7C8CEC7C7CDC7C7
                  CBC3C4C9C1C2C3BBBCBDB5B5B5B0B0AFAAAAA8B4B5B4D9DAD9838383FF00FFFF
                  00FFFF00FFFF00FFD7D7D776767688888890908F919192F2F2F3C7C7CDC5C5CB
                  C4C4CAC3C3C7C0C1C5BEBFC1BABBBCBCBDBCC4C4C3C0C1BDBCBDBBEDEDEBD0D0
                  CE8C8C8CFF00FFFF00FFFF00FFFF00FFB8B8B8797979969695999999939393F2
                  F2F3C8C8CCC5C5C9C3C4C8C1C2C4BCBCBEB8B9B9B3B3B3DADAD7FAFBF4FAFBF4
                  F8F9F2E5E5DFBABBB6C6C6C5FF00FFFF00FFFF00FFFF00FF9595957B7B7B7A7A
                  7AA2A2A1959595F2F2F3C9CACCC9C9CBC7C8C9C1C2C2B9B9B9B3B3B3AAAAAAD6
                  D6D2FAFBF4F8F9F2E6E6E2B9BAB7CCCCCBFF00FFFF00FFFF00FFFF00FFFF00FF
                  DDDDDDBDBDBD888888A2A2A0979797F3F3F3C5C5C5BFBFBFBCBCBCB4B4B4ABAC
                  AAA8A9A7A5A5A3D3D4D0F8F9F2EAEBE7BDBEBBD2D2D1FF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FF9D9D9D9C9C9C999999F3F3F3CBCCCAC7C8C5
                  BEBFBDB6B7B5ADAEADA5A5A3A1A29FF3F4F0ECECE9C1C1BED5D5D4FF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD5D5D5B9B9B9999999F3
                  F3F2F2F3F2F1F1F0EFEFEEECECECEAEAE9E8E8E7E5E5E4E0E0DEC2C3C0DADAD9
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFE1E1E1808080808080808080808080808080808080808080808080808080B1
                  B1B0DFDFDFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                OnClick = SpeedButton26Click
                ExplicitLeft = 406
                ExplicitTop = 2
              end
              object SpeedButton14: TSpeedButton
                Left = 634
                Top = 2
                Width = 51
                Height = 45
                Hint = 'Encontrar venda para emitir'
                Flat = True
                Glyph.Data = {
                  76060000424D7606000000000000360400002800000018000000180000000100
                  08000000000040020000320B0000320B00000001000000010000009C00000073
                  0800EFA5390052525200EFA55200FFB5520063636300E7AD6B00F7BD6B007373
                  7300AD7B7300AD847300B5847300AD7B7B00AD7384009C7B8400A57B8400AD7B
                  8400B57B840084848400B5848400E7B584008C8C8C00CE948C00DEA58C00EFC6
                  8C0094949400D69C9400DEA59400B5AD9400EFCE9400B5AD9C00EFCE9C00CEAD
                  A500BDB5A500DEC6A500EFCEA500BDD6A500F7D6A5000052AD00CEBDAD00F7D6
                  AD00F7D6B500F7DEB500DEC6BD00E7CEBD00EFD6BD00F7DEBD00E7CEC600EFCE
                  C600EFDEC600F7DEC600F7E7C6000063CE00E7D6CE00E7DECE00F7DECE00F7E7
                  CE00E7D6D600EFDED600F7E7D600F7E7DE00F7EFDE00F7EFE700FFF7EF00FFF7
                  F700FFFFF700FF00FF0010F7FF0084FFFF00C6FFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF004343430D1414
                  1414141414141414141414141414141443434343430E32342F2B2A292620201E
                  1E1E1E1E1E1E1E1443434343430E3234332F2A29292420201E1E1E1E1E1E1E14
                  43434343430E383933332F2A29292420201E1E1E1E1E1E1443434343430E393C
                  0303060913161616161A1A1A1E1E1E1443434343430E3C3E3C3933332F2A2929
                  2420201E1E1E1E144343434343113D3E3C393933332F2A29292420201E1E1E14
                  4343434301123F3F3E3C3939332F2F2A29292420201E1E144343434300013F40
                  27272735353535353535353520201E1443430101000001404444444444454545
                  4646464624201E14434300000000000144444444444444454545464629242014
                  4343000000000025444444444444444445454546292924144343434300002547
                  2727273535353535353535352A2924144343434300254147474741403F3F3E3C
                  3939332F2F2A2914434343434317414747474741403F3F3E3C3939332F2F2310
                  43434343431741474747474741403F3F3E3C39392E281D0F43434343431B4147
                  474747474741403F3E3E3E3728221F0F43434343431B4147030306091316161A
                  1A3B0C0B0A0A0A0A43434343431C4147474747474747424140300C1507040214
                  43434343431C4147474747474747474742300C190805144343434343431C4147
                  474747474747474747360C190814434343434343431C47474747474747474747
                  473A0C19144343434343434343182D2E2E312D2D2D2D2C2C2C210C1443434343
                  4343434343434343434343434343434343434343434343434343}
                ParentShowHint = False
                ShowHint = True
                OnClick = SpeedButton14Click
              end
              object bt_tef: TSpeedButton
                Left = 691
                Top = 2
                Width = 51
                Height = 45
                Hint = 'Efetuar transa'#231#227'o avulsa TEF'
                Caption = 'TEF'
                Flat = True
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                ParentShowHint = False
                ShowHint = True
                OnClick = bt_tefClick
              end
            end
            inherited GroupBox2: TGroupBox
              Height = 297
              ExplicitHeight = 297
              inherited ScrollBox2: TScrollBox
                Height = 280
                ParentColor = False
                ExplicitHeight = 280
              end
            end
          end
        end
        inherited tsMemo: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 787
          ExplicitHeight = 559
        end
        object tsOutros: TTabSheet
          Caption = 'tsOutros'
          ImageIndex = 3
          object pageOutros: TPageControl
            Left = 0
            Top = 0
            Width = 787
            Height = 559
            ActivePage = tsImpressao
            Align = alClient
            Style = tsFlatButtons
            TabOrder = 0
            object tsImpressao: TTabSheet
              Caption = 'tsImpressao'
              object pnEmissao: TPanel
                Left = -2
                Top = 45
                Width = 443
                Height = 252
                BevelOuter = bvNone
                BorderWidth = 6
                TabOrder = 0
                object Label49: TLabel
                  Left = 6
                  Top = 200
                  Width = 431
                  Height = 5
                  Align = alBottom
                  AutoSize = False
                  ExplicitLeft = 7
                  ExplicitTop = 182
                  ExplicitWidth = 651
                end
                object Panel48: TPanel
                  Left = 6
                  Top = 6
                  Width = 431
                  Height = 194
                  Align = alClient
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  BorderWidth = 6
                  TabOrder = 0
                  object Label52: TLabel
                    Left = 6
                    Top = 80
                    Width = 415
                    Height = 13
                    Align = alTop
                    Caption = 'Impress'#227'o'
                    ExplicitWidth = 50
                  end
                  object Panel51: TPanel
                    Left = 6
                    Top = 6
                    Width = 415
                    Height = 25
                    Align = alTop
                    Alignment = taLeftJustify
                    BevelOuter = bvNone
                    Caption = 'Informar emails separados por ;'
                    TabOrder = 0
                  end
                  object edEmissaoEmails: TEdit
                    Left = 6
                    Top = 31
                    Width = 415
                    Height = 21
                    Align = alTop
                    TabOrder = 1
                    Text = 'edEmissaoEmails'
                  end
                  object Panel47: TPanel
                    Left = 6
                    Top = 52
                    Width = 415
                    Height = 28
                    Align = alTop
                    BevelOuter = bvNone
                    TabOrder = 2
                    object ckEmissaoEnviarEmail: TCheckBox
                      Left = 0
                      Top = 0
                      Width = 113
                      Height = 28
                      Align = alLeft
                      Caption = 'Enviar email - [F7]'
                      TabOrder = 0
                    end
                  end
                  object BitBtn7: TBitBtn
                    Left = 6
                    Top = 149
                    Width = 415
                    Height = 28
                    Align = alTop
                    Caption = 'Emitir NFC-e - F9'
                    TabOrder = 3
                    OnClick = BitBtn7Click
                    Glyph.Data = {
                      FE020000424DFE02000000000000FE0100002800000010000000100000000100
                      08000000000000010000120B0000120B0000720000007200000000000000FFFF
                      FF00FF00FF00B7818300A4787400986B6600B4817600BA8E8500CB9A8200FEFC
                      FB00DAA48200DCA88700E3B18E00EDBD9200E8BC8F00E8BD9100E9BF9400EAC0
                      9500E9BF9500EAC19700EAC29900FFFDFB00FFFEFD00E7B98800E8BB8B00E8BC
                      8E00EABF9200E9BE9100EAC29800BDA68D00EBBF8400EFCB9C00FDF9F400FEFB
                      F700E9BB7900E9BC7C00EABE7F00EABE8100EABF8200EBC18500ECC28800ECC4
                      8B00ECC58E00EDC79200EECA9800EDCA9800EECB9A00F2D6AC00F2D6AD00F5DF
                      BE00F4DEBD00F8E8D100F8EAD500FAF1E400FCF5EB00FDF9F300EECD9A00EFCF
                      9D00EFD09E00F0D1A000F0D2A300F0D2A400F1D4A800F0D4A700F1D5A900F2D8
                      AF00F2D9B100F2D9B200F3DBB400F3DCB600F3DCB800F5E1C200F6E3C600F5E3
                      C600F6E4C800F7E6CC00F6E6CC00F7E7CE00F7E8D000F8E9D200F9EDDA00F9EE
                      DD00FAF0E000FCF5EA00FCF7EF00BFAB8900C1B19400F8ECD700FAF0DE00FBF3
                      E500FCF7EE00FDF9F200FAF3E600FBF6EC00FFFEFC00C6C0AF00C7C2B400C6C2
                      B200FDFCF800C7C4B700FEFEFD0098D19000CBCECD002D91E10040A1F20050AB
                      F4004FABF3005AB1F500157CDB00197FDC00218DEF001F84DD002F97F0001153
                      93000202050A0A0A0A0A0A0A0A0A0A0A0D020202053654202115160101010101
                      0D0202020535180E1B101113141414010D02020205511718190F1A12131C1401
                      0C0202020534505259535A37210964010C020202054D2D2E717171717110115E
                      0B02020205494B33716B6B6B71651A620B02020205317171716A6B6B7171715B
                      08020202054560716D70686967711D5D0802020205414461716C6E6F7166525C
                      070202020540251E55716C71562C1F5807020202053C3F2F425F7163484C4F57
                      06020202053A222324262728292A2B4E060202020538393B3D3E30434632474A
                      0302020205040404040404040404040403020202020202020202020202020202
                      0202}
                  end
                  object Panel50: TPanel
                    Left = 6
                    Top = 93
                    Width = 415
                    Height = 28
                    Align = alTop
                    BevelOuter = bvNone
                    TabOrder = 4
                    object CheckBox4: TCheckBox
                      Left = 0
                      Top = 0
                      Width = 81
                      Height = 28
                      Align = alLeft
                      Caption = 'Resumida'
                      TabOrder = 0
                    end
                    object CheckBox5: TCheckBox
                      Left = 81
                      Top = 0
                      Width = 141
                      Height = 28
                      Align = alLeft
                      Caption = 'Impressora N'#227'o Fiscal'
                      TabOrder = 1
                    end
                    object CheckBox2: TCheckBox
                      Left = 222
                      Top = 0
                      Width = 183
                      Height = 28
                      Align = alLeft
                      Caption = 'Impressora Laser ou jato de tinta'
                      TabOrder = 2
                    end
                  end
                  object Panel52: TPanel
                    Left = 6
                    Top = 121
                    Width = 415
                    Height = 28
                    Align = alTop
                    BevelOuter = bvNone
                    TabOrder = 5
                    object CheckBox6: TCheckBox
                      Left = 0
                      Top = 0
                      Width = 385
                      Height = 28
                      Align = alLeft
                      Caption = 'Consumidor solicita que n'#227'o seja impressa a NFC-e - [F8]'
                      TabOrder = 0
                    end
                  end
                end
                object Panel49: TPanel
                  Left = 6
                  Top = 205
                  Width = 431
                  Height = 41
                  Align = alBottom
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  TabOrder = 1
                  object btEmissaoVoltar: TBitBtn
                    Left = 344
                    Top = 6
                    Width = 75
                    Height = 25
                    Caption = 'Voltar '
                    ModalResult = 2
                    TabOrder = 0
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
            object TabSheet4: TTabSheet
              Caption = 'TabSheet4'
              ImageIndex = 1
              object pn_vnd_sem_emit: TPanel
                Left = 16
                Top = 28
                Width = 705
                Height = 425
                BevelKind = bkTile
                BevelOuter = bvNone
                BorderWidth = 6
                TabOrder = 0
                object Label155: TLabel
                  Left = 6
                  Top = 6
                  Width = 689
                  Height = 20
                  Align = alTop
                  AutoSize = False
                  Caption = 'Vendas - F4'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                  Layout = tlCenter
                  ExplicitLeft = 7
                  ExplicitTop = 7
                  ExplicitWidth = 691
                end
                object Label156: TLabel
                  Left = 6
                  Top = 149
                  Width = 689
                  Height = 20
                  Align = alTop
                  AutoSize = False
                  Caption = 'Itens da Venda'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                  Layout = tlCenter
                  ExplicitLeft = 7
                  ExplicitTop = 202
                  ExplicitWidth = 691
                end
                object Splitter3: TSplitter
                  Left = 6
                  Top = 146
                  Width = 689
                  Height = 3
                  Cursor = crVSplit
                  Align = alTop
                  ExplicitLeft = 7
                  ExplicitTop = 138
                  ExplicitWidth = 691
                end
                object grid_vnd_sem_emit: TDBGrid
                  Left = 6
                  Top = 26
                  Width = 689
                  Height = 120
                  Align = alTop
                  Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
                  TabOrder = 0
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -11
                  TitleFont.Name = 'Tahoma'
                  TitleFont.Style = []
                  OnDrawColumnCell = grid_vnd_sem_emitDrawColumnCell
                  OnKeyDown = grid_vnd_sem_emitKeyDown
                end
                object grid_vnd_sem_emit_itens: TDBGrid
                  Left = 6
                  Top = 169
                  Width = 689
                  Height = 183
                  Align = alClient
                  Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                  TabOrder = 1
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -11
                  TitleFont.Name = 'Tahoma'
                  TitleFont.Style = []
                  OnKeyDown = grid_vnd_sem_emitKeyDown
                end
                object Panel122: TPanel
                  Left = 6
                  Top = 352
                  Width = 689
                  Height = 63
                  Align = alBottom
                  BevelOuter = bvNone
                  TabOrder = 2
                  object Label157: TLabel
                    Left = 1
                    Top = 9
                    Width = 85
                    Height = 13
                    Caption = 'Buscar Venda(F5)'
                  end
                  object sp_vnd_sem_emit_diatual: TSpeedButton
                    Left = 408
                    Top = 6
                    Width = 100
                    Height = 25
                    Hint = 'Dia Atual'
                    Caption = 'F8 - Dia Atual'
                    Flat = True
                    Glyph.Data = {
                      36050000424D3605000000000000360400002800000010000000100000000100
                      08000000000000010000430B0000430B000000010000000100008C5A5A009C6B
                      6B00A57B73000000840084848400B58C8C0039529C00395AAD004A6BBD005A73
                      C600C6C6C6006384CE00F7E7CE00F7EFDE00FFF7E700FFFFEF00FF00FF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00101010070606
                      0606060606060607101010100805000000000000000000000710101008050D0D
                      0D0D0D0D0D0D0D000610101008050D040404040404040D000610101008050D0C
                      0C0C0C0C0C0C0D000610101008050D040404040404040D000610101008050D0D
                      0D0D0D0D0D0D0D010610101008050E0E030D0A03030A0E010610101009050F0F
                      030F030F0F030F010610101009050F0F030F0F0F0F030F020610101009050F0F
                      030F0303030A0F02061010100B0511030311031111111105061010100B051111
                      0311030303031105061010100B0511111111111111111105061010100B050505
                      050505050505050507101010100B090808080808080808081010}
                    OnClick = sp_vnd_sem_emit_diatualClick
                  end
                  object sp_vnd_sem_emit_novodia: TSpeedButton
                    Left = 514
                    Top = 6
                    Width = 100
                    Height = 25
                    Hint = 'Dia Atual'
                    Caption = 'F9 - Novo Dia'
                    Flat = True
                    Glyph.Data = {
                      36050000424D3605000000000000360400002800000010000000100000000100
                      08000000000000010000430B0000430B000000010000000100008C5A5A009C6B
                      6B00A57B73000000840084848400B58C8C0039529C00395AAD004A6BBD005A73
                      C600C6C6C6006384CE00F7E7CE00F7EFDE00FFF7E700FFFFEF00FF00FF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00101010070606
                      0606060606060607101010100805000000000000000000000710101008050D0D
                      0D0D0D0D0D0D0D000610101008050D040404040404040D000610101008050D0C
                      0C0C0C0C0C0C0D000610101008050D040404040404040D000610101008050D0D
                      0D0D0D0D0D0D0D010610101008050E0E030D0A03030A0E010610101009050F0F
                      030F030F0F030F010610101009050F0F030F0F0F0F030F020610101009050F0F
                      030F0303030A0F02061010100B0511030311031111111105061010100B051111
                      0311030303031105061010100B0511111111111111111105061010100B050505
                      050505050505050507101010100B090808080808080808081010}
                    OnClick = sp_vnd_sem_emit_novodiaClick
                  end
                  object sp_vnd_sem_emit_isentos: TSpeedButton
                    Left = 168
                    Top = 6
                    Width = 114
                    Height = 25
                    Hint = 
                      'Selecionar apenas vendas de clientes com inscri'#231#227'o estadual ISEN' +
                      'TO'
                    Caption = 'F6 - Isentos'
                    Flat = True
                    Glyph.Data = {
                      8A030000424D8A030000000000008A0200002800000010000000100000000100
                      08000000000000010000120B0000120B000095000000950000002826A500FF00
                      FF0086777700924E4100B5321500EE533000E2552D00FF6E4600ED6A47006E2D
                      130095685200BCFBAD0045923500C9FBBF00C7F2C40060CA5B00008700000080
                      0000007D0000007900000078000000590000028604000F931300017605000691
                      1100099518000A991A0006370B0015B135000948160013B63B00139135001ABC
                      49001DCC500023C558003570810057838F005A8799000B6E9A005298BC001669
                      97002377A60007507E0013699C00156392000E2B3D0002426D0002375C00003C
                      6A00033E6800064F83001D78BD0039ACFF0035A6FF0037A7FF002990EA00288E
                      E6002D98FA00309DFB00319DFB0034A0FF00000102002890FB002993FF002991
                      FA002A95FE002C96FB000464CC00072649001D7FEE002087FA001C7BDE002389
                      F600268EFA001E6CBF00095FC2000F6DDC001B72DC001F82F7002184FA000457
                      C100020912001D7EFC0005162C001E7BF7002081FB0004101F0000378A001A74
                      F800186BE6001A70EB001C73F000020811001D375C00166BEF00186AE9001869
                      E5001457BD000B53D1004058820001050D001151CE00114EC600104BBD00114C
                      C400010204000D3DAA000A2D7B000335B0000E41BB000D3CAA00D0DCFF000120
                      92000322900005228E00163EC7003462FF003764FF002B469F007290FE00D5DE
                      FF004D72FF005172FF005374FF005376FF005577FF00E6EBFF00284FFC002F54
                      FF004162FF004667FF00748EFF0093A6FF001539FF002346FF00274AFF002A4B
                      FF004866FF004C69FF005470FF00001EFF001233FF00253390000420FF000103
                      13004A4C8B006868680000000000010101010101010101018D8D8D8D01010101
                      151515151515588D827C89888D010115131216191110588B8A70858E87010115
                      141B21170F1874817B798490760901151A231F170D208D8C787F838680090101
                      1522170E0B1D058D7D7E7A75000901011E1C5E77240C64078D8D8D8D06090194
                      94917372718F08030226250A040194943E6C6E6F6B6D924D444C512701019494
                      65686667676963535656555F270194946A62595A61605C4042414A505B279494
                      94454846474E4B38393B3A3F4F27019493945257545D333030363C4349270101
                      94939394942E282F3435373D270101010194949401012C282D32323127010101
                      010101010101012A292B31010101}
                    OnClick = sp_vnd_sem_emit_isentosClick
                  end
                  object sp_vnd_sem_emit_conrib: TSpeedButton
                    Left = 288
                    Top = 6
                    Width = 114
                    Height = 25
                    Hint = 'Selecionar apenas vendas de clientes com inscri'#231#227'o estadual'
                    Caption = 'F7 - Contribuintes'
                    Flat = True
                    Glyph.Data = {
                      8E030000424D8E030000000000008E0200002800000010000000100000000100
                      08000000000000010000120B0000120B00009600000096000000403DB800FF00
                      FF009D909000A8695C00F26E4900C54B2700FF886100F1846200E97045008845
                      2400AA826D0060A84E00CBFCBF00D5FCCD00D4F5D1007BD67600009E00000095
                      000000920000009100000074000000980200069D0B001EA92500038F0E000FA7
                      22000F51180015AA2C0017AE2E0027C24E001463290024C6550024A74E002ECB
                      640032D86B0039D273004E8A9900729BA5001888AF00759EAE002983AC006DAD
                      CB00065D870007517700116B96002583B000277DA8003990B900005684000A58
                      8200106A9B001D4357003291CC0053BEFF004FB9FF0051BAFF0041A6EF0040A4
                      EC0046ADFB0049B1FC004AB1FC004DB4FF000C7ED800147AD0003194E60039A0
                      F8003DA4FB003FA6FC0041A9FF0042AAFE0041A7FB0044ABFC000C72CF001E87
                      E400123D64003297F200369EFB003386CD000151A100010407003296FD002F8B
                      E4000E2944000B2035003699FC00359AF900379CFB00061423002E8AF000308C
                      F4003394F9002985F300061322002B84EE002B85EC002B83EB002E8DFA002672
                      CC0032517700186EDC0003070C00226CD9002169D3002066CC00094FC1002167
                      D100050E1C005A739A001D5BCA001C56BC001C57BC00174594000436A8000938
                      A6000D38A4002958D4004D7CFF00517EFF004361B3008BA6FE00DBE4FF00406A
                      FD00486FFF00688BFF006E8DFF006E8FFF007090FF00DFE6FF000033FF002753
                      FF003961FF003E65FF004266FF005C7CFF006181FF006C8BFF008DA4FF00ECF0
                      FF000B36FF00234CFF006380FF006783FF006F8AFF00A9B9FF003C4CA6000509
                      24006567A2008282820001010100000000000101010101010101010180808080
                      010101011414141414144E80857C8483800101141211161915104E8D8C788F8B
                      82010114131C21170F18737A877F888A750901141B231F170D20808E77898681
                      790901011422170E0C1D04807D7E7B74000901011E1A6276240B6B0680808080
                      0809019595917271709007030227250A050195954F6F6C6D6E6892493E3F4826
                      010195956A6765666669635054545A5B260195956461605E5F5D594445464256
                      58269595954A404B4C514D38393B3A435526019593955753525C322B2B363C47
                      41260101959393959433292A3435373D260101010195959501012D292E313130
                      26010101010101010101012F282C30010101}
                    OnClick = sp_vnd_sem_emit_conribClick
                  end
                  object sp_vnd_sem_emit_selecionar: TSpeedButton
                    Left = 288
                    Top = 37
                    Width = 114
                    Height = 25
                    Hint = 'Dia Atual'
                    Caption = 'F11 - Selecionar'
                    Flat = True
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
                    OnClick = sp_vnd_sem_emit_selecionarClick
                  end
                  object sp_vnd_sem_emit_voltar: TSpeedButton
                    Left = 514
                    Top = 37
                    Width = 100
                    Height = 25
                    Caption = 'ESC - Voltar'
                    Flat = True
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
                    OnClick = sp_vnd_sem_emit_voltarClick
                  end
                  object lb_vnd_sem_emit_data: TLabel
                    Left = 92
                    Top = 48
                    Width = 135
                    Height = 13
                    Caption = 'lb_vnd_sem_emit_data'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object SpeedButton15: TSpeedButton
                    Left = 637
                    Top = 6
                    Width = 23
                    Height = 25
                    Hint = 'Dia anterior'
                    Flat = True
                    Glyph.Data = {
                      36050000424D3605000000000000360400002800000010000000100000000100
                      08000000000000010000E30E0000E30E0000000100000001000010630000006B
                      0000086B00000073000008730000007B0000107B000000840000088400001084
                      0000008C0000088C00000094000008940000009C0000089C000000A5000008A5
                      000000AD000000B5000000BD000000C6000008C6000000CE000000D6000008D6
                      000008630800087B0800107B080010840800008C0800088C0800009408001094
                      0800009C080000A5080000AD080000B5080010BD080010C60800087B1000107B
                      1000187B10001084100018841000088C1000188C1000109410001894100010D6
                      100018D61000107B1800187B18001884180029841800108C1800188C1800218C
                      18001094180018941800189C1800219C180010C6180018C6180018D61800187B
                      210018842100189421002194210029A521001873290029AD290031DE290029E7
                      290029843100298C3100398C310029D6310031D6310039AD390042A5420039DE
                      420042DE42004AAD520052AD520052E752005AE75A0063AD630063E763006BEF
                      63006B946B0073B56B006BDE6B0063E76B006BE76B0063EF6B007BB5730073B5
                      7B007BDE7B007BB5840084BD84008CC69400A5E7A500CEEFBD00BDEFC600C6EF
                      C600C6EFCE00CEEFCE00D6F7CE00D6E7D600DEE7D600D6EFD600DEEFD600CEE7
                      DE00D6EFDE00DEEFDE00DEEFE700EFF7EF00F7F7F700FF00FF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00777777777777
                      774F2F777777777777777777777777774F39127777777777777777777777774F
                      353D0E77777777777777777777774F2D080B0E777777777777777777774F2957
                      440A1F13253F52555C1277774F345739071E0A10131416405822774F34574105
                      071E0E121314151758214F41574B0507071E0C12131416175D104F46574C0305
                      071E2012131416175E0F774F4157361B070C0C1013141617580E77774F335737
                      070A0D241314164059207777774F2957430C0C12253F52566212777777774F2D
                      080A0E7777777777777777777777774F383B2177777777777777777777777777
                      4F3B0E77777777777777777777777777774F4477777777777777}
                    OnClick = SpeedButton15Click
                  end
                  object SpeedButton16: TSpeedButton
                    Left = 666
                    Top = 6
                    Width = 23
                    Height = 25
                    Hint = 'Pr'#243'ximo Dia'
                    Flat = True
                    Glyph.Data = {
                      36050000424D3605000000000000360400002800000010000000100000000100
                      08000000000000010000E30E0000E30E0000000100000001000010630000006B
                      0000086B00000073000008730000007B0000107B000000840000088400001084
                      0000008C0000088C00000094000008940000009C0000089C000000A5000008A5
                      000000AD000000B5000000BD000000C6000008C6000000CE000000D6000008D6
                      000008630800087B0800107B080010840800008C0800088C0800009408001094
                      0800009C080000A5080000AD080000B5080010BD080010C60800087B1000107B
                      1000187B10001084100018841000088C1000188C1000109410001894100010D6
                      100018D61000107B1800187B18001884180029841800108C1800188C1800218C
                      18001094180018941800189C1800219C180010C6180018C6180018D61800187B
                      210018842100189421002194210029A521001873290029AD290031DE290029E7
                      290029843100298C3100398C310029D6310031D6310039AD390042A5420039DE
                      420042DE42004AAD520052AD520052E752005AE75A0063AD630063E763006BEF
                      63006B946B0073B56B006BDE6B0063E76B006BE76B0063EF6B007BB5730073B5
                      7B007BDE7B007BB5840084BD84008CC69400A5E7A500CEEFBD00BDEFC600C6EF
                      C600C6EFCE00CEEFCE00D6F7CE00D6E7D600DEE7D600D6EFD600DEEFD600CEE7
                      DE00D6EFDE00DEEFDE00DEEFE700EFF7EF00F7F7F700FF00FF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00777777777777
                      772F4F777777777777777777777777777712394F777777777777777777777777
                      770E3D354F7777777777777777777777770E0B082D4F77777777125C55523F25
                      131F0A4457294F777777225840161413100A1E073957344F7777215817151413
                      120E1E07054157344F77105D17161413120C1E0707054B57414F0F5E17161413
                      12201E0705034C57464F0E5817161413100C0C071B3657414F77205940161413
                      240D0A073757334F7777126256523F25120C0C4357294F777777777777777777
                      770E0A082D4F7777777777777777777777213B384F7777777777777777777777
                      770E3B4F77777777777777777777777777444F77777777777777}
                    OnClick = SpeedButton16Click
                  end
                  object ed_vnd_loc: TEdit
                    Left = 92
                    Top = 6
                    Width = 70
                    Height = 21
                    TabOrder = 0
                    Text = 'ed_vnd_loc'
                    OnChange = ed_vnd_locChange
                    OnKeyDown = grid_vnd_sem_emitKeyDown
                    OnKeyPress = ed_vnd_locKeyPress
                  end
                end
              end
            end
          end
        end
        object ts_nfce_v2: TTabSheet
          Caption = 'NFCe V2'
          ImageIndex = 4
          object pn_v2: TPanel
            Left = 0
            Top = 0
            Width = 787
            Height = 559
            Align = alClient
            BevelOuter = bvNone
            BorderWidth = 6
            Color = clWhite
            ParentBackground = False
            TabOrder = 0
            OnEnter = pn_v2Enter
            object GridPanel2: TGridPanel
              Left = 6
              Top = 6
              Width = 775
              Height = 547
              Align = alClient
              BevelOuter = bvNone
              ColumnCollection = <
                item
                  Value = 20.000000000000000000
                end
                item
                  Value = 20.000000000000000000
                end
                item
                  Value = 20.000000000000000000
                end
                item
                  Value = 20.000000000000000000
                end
                item
                  Value = 20.000000000000000000
                end>
              ControlCollection = <
                item
                  Column = -1
                  Row = 0
                end
                item
                  Column = -1
                  Row = -1
                end
                item
                  Column = 0
                  ColumnSpan = 5
                  Control = pn_descr_v2
                  Row = 0
                end
                item
                  Column = 0
                  ColumnSpan = 2
                  Control = Panel56
                  Row = 1
                end
                item
                  Column = 2
                  Control = Panel57
                  Row = 1
                end
                item
                  Column = 4
                  Control = Panel59
                  Row = 1
                end
                item
                  Column = 3
                  Control = GridPanel4
                  Row = 1
                end
                item
                  Column = 2
                  ColumnSpan = 3
                  Control = pn_print_container
                  Row = 2
                  RowSpan = 8
                end
                item
                  Column = 0
                  ColumnSpan = 2
                  Control = Panel97
                  Row = 9
                end
                item
                  Column = 0
                  ColumnSpan = 2
                  Control = pn_img_prod
                  Row = 3
                  RowSpan = 5
                end>
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = []
              ParentColor = True
              ParentFont = False
              RowCollection = <
                item
                  SizeStyle = ssAbsolute
                  Value = 40.000000000000000000
                end
                item
                  SizeStyle = ssAbsolute
                  Value = 50.000000000000000000
                end
                item
                  Value = 12.500000000000000000
                end
                item
                  Value = 12.500000000000000000
                end
                item
                  Value = 12.500000000000000000
                end
                item
                  Value = 12.500000000000000000
                end
                item
                  Value = 12.500000000000000000
                end
                item
                  Value = 12.500000000000000000
                end
                item
                  Value = 12.500000000000000000
                end
                item
                  Value = 12.500000000000000000
                end>
              TabOrder = 0
              object pn_descr_v2: TPanel
                Left = 0
                Top = 0
                Width = 775
                Height = 34
                Align = alTop
                BevelOuter = bvNone
                BorderStyle = bsSingle
                Color = clWhite
                Ctl3D = False
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -21
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentBackground = False
                ParentCtl3D = False
                ParentFont = False
                TabOrder = 0
                object lb_descr_v2: TLabel
                  Left = 0
                  Top = 0
                  Width = 773
                  Height = 32
                  Align = alClient
                  Alignment = taCenter
                  Caption = 'lb_descr_v2'
                  Layout = tlCenter
                  WordWrap = True
                  ExplicitWidth = 110
                  ExplicitHeight = 25
                end
              end
              object Panel56: TPanel
                Left = 0
                Top = 40
                Width = 310
                Height = 50
                Align = alClient
                BevelOuter = bvNone
                Padding.Right = 6
                ParentColor = True
                TabOrder = 1
                object lb_prod_serv_v2: TLabel
                  Left = 0
                  Top = 0
                  Width = 304
                  Height = 16
                  Align = alTop
                  Caption = 'C'#243'digo Produto'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Verdana'
                  Font.Style = []
                  ParentFont = False
                  ExplicitWidth = 100
                end
                object ed_codigo_v2: TEdit
                  Left = 0
                  Top = 16
                  Width = 304
                  Height = 31
                  Align = alTop
                  CharCase = ecUpperCase
                  Ctl3D = False
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -21
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentCtl3D = False
                  ParentFont = False
                  TabOrder = 0
                  Text = '7897887887'
                  OnKeyDown = ed_codigo_v2KeyDown
                end
              end
              object Panel57: TPanel
                Left = 310
                Top = 40
                Width = 155
                Height = 50
                Align = alClient
                BevelOuter = bvNone
                Padding.Right = 6
                ParentColor = True
                TabOrder = 2
                object GridPanel3: TGridPanel
                  Left = 0
                  Top = 0
                  Width = 149
                  Height = 50
                  Align = alClient
                  BevelOuter = bvNone
                  ColumnCollection = <
                    item
                      Value = 90.000000000000000000
                    end
                    item
                      Value = 10.000000000000000000
                    end>
                  ControlCollection = <
                    item
                      Column = 0
                      Control = Panel60
                      Row = 0
                    end
                    item
                      Column = 1
                      Control = Panel61
                      Row = 0
                    end>
                  Enabled = False
                  ParentColor = True
                  RowCollection = <
                    item
                      Value = 100.000000000000000000
                    end>
                  TabOrder = 0
                  object Panel60: TPanel
                    Left = 0
                    Top = 0
                    Width = 134
                    Height = 50
                    Align = alClient
                    BevelOuter = bvNone
                    Padding.Right = 6
                    ParentColor = True
                    TabOrder = 0
                    object Label64: TLabel
                      Left = 0
                      Top = 0
                      Width = 128
                      Height = 16
                      Align = alTop
                      Caption = 'Quantidade'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -13
                      Font.Name = 'Verdana'
                      Font.Style = []
                      ParentFont = False
                      ExplicitWidth = 75
                    end
                    object ed_qtde_v2: TPanel
                      Left = 0
                      Top = 16
                      Width = 128
                      Height = 31
                      Align = alTop
                      Alignment = taRightJustify
                      BevelOuter = bvNone
                      BorderWidth = 3
                      BorderStyle = bsSingle
                      Caption = '2,000'
                      Color = clWhite
                      Ctl3D = False
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -21
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentBackground = False
                      ParentCtl3D = False
                      ParentFont = False
                      TabOrder = 0
                    end
                  end
                  object Panel61: TPanel
                    Left = 134
                    Top = 0
                    Width = 15
                    Height = 50
                    Align = alClient
                    BevelOuter = bvNone
                    Caption = 'X'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -12
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    ParentColor = True
                    ParentFont = False
                    TabOrder = 1
                  end
                end
              end
              object Panel59: TPanel
                Left = 620
                Top = 40
                Width = 155
                Height = 50
                Align = alClient
                BevelOuter = bvNone
                Enabled = False
                ParentColor = True
                TabOrder = 3
                object Label66: TLabel
                  Left = 0
                  Top = 0
                  Width = 155
                  Height = 16
                  Align = alTop
                  Caption = 'Valor Total'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Verdana'
                  Font.Style = []
                  ParentFont = False
                  ExplicitWidth = 70
                end
                object ed_vltot_v2: TPanel
                  Left = 0
                  Top = 16
                  Width = 155
                  Height = 31
                  Align = alTop
                  Alignment = taRightJustify
                  BevelOuter = bvNone
                  BorderWidth = 3
                  BorderStyle = bsSingle
                  Caption = '7,33'
                  Color = clWhite
                  Ctl3D = False
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -21
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentBackground = False
                  ParentCtl3D = False
                  ParentFont = False
                  TabOrder = 0
                end
              end
              object GridPanel4: TGridPanel
                Left = 465
                Top = 40
                Width = 155
                Height = 50
                Align = alClient
                BevelOuter = bvNone
                ColumnCollection = <
                  item
                    Value = 90.000000000000000000
                  end
                  item
                    Value = 10.000000000000000000
                  end>
                ControlCollection = <
                  item
                    Column = 0
                    Control = Panel58
                    Row = 0
                  end
                  item
                    Column = 1
                    Control = Panel62
                    Row = 0
                  end>
                Enabled = False
                ParentColor = True
                RowCollection = <
                  item
                    Value = 100.000000000000000000
                  end>
                TabOrder = 4
                object Panel58: TPanel
                  Left = 0
                  Top = 0
                  Width = 139
                  Height = 50
                  Align = alClient
                  BevelOuter = bvNone
                  Padding.Right = 6
                  ParentColor = True
                  TabOrder = 0
                  object Label65: TLabel
                    Left = 0
                    Top = 0
                    Width = 133
                    Height = 16
                    Align = alTop
                    Caption = 'Valor Unit'#225'rio'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -13
                    Font.Name = 'Verdana'
                    Font.Style = []
                    ParentFont = False
                    ExplicitWidth = 87
                  end
                  object ed_vlun_v2: TPanel
                    Left = 0
                    Top = 16
                    Width = 133
                    Height = 31
                    Align = alTop
                    Alignment = taRightJustify
                    BevelOuter = bvNone
                    BorderWidth = 3
                    BorderStyle = bsSingle
                    Caption = '3,666'
                    Color = clWhite
                    Ctl3D = False
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -21
                    Font.Name = 'Tahoma'
                    Font.Style = []
                    ParentBackground = False
                    ParentCtl3D = False
                    ParentFont = False
                    TabOrder = 0
                  end
                end
                object Panel62: TPanel
                  Left = 139
                  Top = 0
                  Width = 16
                  Height = 50
                  Align = alClient
                  BevelOuter = bvNone
                  Caption = '='
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -16
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentColor = True
                  ParentFont = False
                  TabOrder = 1
                end
              end
              object pn_print_container: TPanel
                Left = 310
                Top = 90
                Width = 465
                Height = 457
                Align = alClient
                BevelOuter = bvNone
                Ctl3D = False
                ParentColor = True
                ParentCtl3D = False
                TabOrder = 5
              end
              object Panel97: TPanel
                Left = 0
                Top = 489
                Width = 310
                Height = 58
                Align = alClient
                BevelOuter = bvNone
                Caption = 'F2: Menu de Opera'#231#227'o'
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clNavy
                Font.Height = -13
                Font.Name = 'Verdana'
                Font.Style = []
                ParentColor = True
                ParentFont = False
                TabOrder = 6
                VerticalAlignment = taAlignBottom
                object pn_inf_nfce_local_v2: TPanel
                  Left = 0
                  Top = 0
                  Width = 310
                  Height = 27
                  Align = alTop
                  BevelOuter = bvNone
                  Caption = 'NFCe LOCAL'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clRed
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                  TabOrder = 0
                end
              end
              object pn_img_prod: TPanel
                Left = 0
                Top = 147
                Width = 310
                Height = 285
                Align = alClient
                BevelOuter = bvNone
                Padding.Left = 3
                Padding.Right = 3
                ParentColor = True
                TabOrder = 7
                object img_prod: TImage
                  Left = 3
                  Top = 0
                  Width = 304
                  Height = 285
                  Align = alClient
                  Center = True
                  Proportional = True
                  Transparent = True
                  ExplicitLeft = -4
                  ExplicitWidth = 310
                end
              end
            end
          end
        end
        object ts_nfce_v2_container: TTabSheet
          Caption = 'ts_nfce_v2_container'
          ImageIndex = 5
          object PageControl2: TPageControl
            Left = 0
            Top = 0
            Width = 787
            Height = 559
            ActivePage = ts_v2_selecionar_item
            Align = alClient
            MultiLine = True
            TabOrder = 0
            object ts_v2_menus: TTabSheet
              Caption = 'ts_v2_menus'
              object pn_v2_menus: TPanel
                Left = 0
                Top = 0
                Width = 779
                Height = 495
                Align = alClient
                BevelKind = bkTile
                BevelOuter = bvNone
                Color = clWhite
                Ctl3D = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = []
                Padding.Left = 6
                Padding.Right = 6
                Padding.Bottom = 6
                ParentBackground = False
                ParentCtl3D = False
                ParentFont = False
                TabOrder = 0
                object ScrollBox4: TScrollBox
                  Left = 6
                  Top = 0
                  Width = 763
                  Height = 485
                  Align = alClient
                  BevelInner = bvNone
                  BevelOuter = bvNone
                  BorderStyle = bsNone
                  Padding.Right = 10
                  TabOrder = 0
                  object pn_v2_menus_pag_1: TGridPanel
                    Left = 0
                    Top = 0
                    Width = 736
                    Height = 485
                    Align = alTop
                    BevelOuter = bvNone
                    ColumnCollection = <
                      item
                        SizeStyle = ssAbsolute
                        Value = 25.000000000000000000
                      end
                      item
                        Value = 100.000000000000000000
                      end>
                    ControlCollection = <
                      item
                        Column = 0
                        Control = Label121
                        Row = 1
                      end
                      item
                        Column = 0
                        Control = Label128
                        Row = 2
                      end
                      item
                        Column = 0
                        Control = Label130
                        Row = 3
                      end
                      item
                        Column = 0
                        Control = Label132
                        Row = 4
                      end
                      item
                        Column = 0
                        Control = Label134
                        Row = 5
                      end
                      item
                        Column = 0
                        Control = Label136
                        Row = 6
                      end
                      item
                        Column = 0
                        Control = Label138
                        Row = 9
                      end
                      item
                        Column = 0
                        Control = Label140
                        Row = 10
                      end
                      item
                        Column = 0
                        Control = Label142
                        Row = 11
                      end
                      item
                        Column = 1
                        Control = bt_v2_menu_novo
                        Row = 1
                      end
                      item
                        Column = 1
                        Control = bt_v2_menu_consulta_nfce
                        Row = 9
                      end
                      item
                        Column = 1
                        Control = bt_v2_menu_excluir
                        Row = 2
                      end
                      item
                        Column = 1
                        Control = bt_v2_menu_alterar
                        Row = 3
                      end
                      item
                        Column = 1
                        Control = bt_v2_menu_desconto_item
                        Row = 4
                      end
                      item
                        Column = 1
                        Control = bt_v2_menu_consulta_cliente
                        Row = 12
                      end
                      item
                        Column = 1
                        Control = bt_v2_menu_valores_nf
                        Row = 5
                      end
                      item
                        Column = 1
                        Control = bt_v2_menu_pagamento
                        Row = 11
                      end
                      item
                        Column = 1
                        Control = bt_v2_menu_modo_completo
                        Row = 10
                      end
                      item
                        Column = 0
                        Control = Label127
                        Row = 12
                      end
                      item
                        Column = 0
                        Control = Label129
                        Row = 13
                      end
                      item
                        Column = 1
                        Control = bt_v2_menu_voltar_page_1
                        Row = 13
                      end
                      item
                        Column = 1
                        Control = Panel81
                        Row = 0
                      end
                      item
                        Column = 0
                        Control = Label68
                        Row = 7
                      end
                      item
                        Column = 0
                        Control = Label69
                        Row = 8
                      end
                      item
                        Column = 0
                        Control = Label70
                        Row = 14
                      end
                      item
                        Column = 1
                        Control = bt_v2_menu_usar_orcamento
                        Row = 6
                      end
                      item
                        Column = 0
                        Control = Panel108
                        Row = 0
                      end
                      item
                        Column = 1
                        Control = bt_v2_menu_movimento_operador
                        Row = 7
                      end
                      item
                        Column = 1
                        Control = bt_v2_menu_sangsup
                        Row = 8
                      end
                      item
                        Column = 1
                        Control = bt_v2_menu_goto_page_2
                        Row = 14
                      end>
                    ParentColor = True
                    RowCollection = <
                      item
                        SizeStyle = ssAbsolute
                        Value = 32.000000000000000000
                      end
                      item
                        SizeStyle = ssAbsolute
                        Value = 32.000000000000000000
                      end
                      item
                        SizeStyle = ssAbsolute
                        Value = 32.000000000000000000
                      end
                      item
                        SizeStyle = ssAbsolute
                        Value = 32.000000000000000000
                      end
                      item
                        SizeStyle = ssAbsolute
                        Value = 32.000000000000000000
                      end
                      item
                        SizeStyle = ssAbsolute
                        Value = 32.000000000000000000
                      end
                      item
                        SizeStyle = ssAbsolute
                        Value = 32.000000000000000000
                      end
                      item
                        SizeStyle = ssAbsolute
                        Value = 32.000000000000000000
                      end
                      item
                        SizeStyle = ssAbsolute
                        Value = 32.000000000000000000
                      end
                      item
                        SizeStyle = ssAbsolute
                        Value = 32.000000000000000000
                      end
                      item
                        SizeStyle = ssAbsolute
                        Value = 32.000000000000000000
                      end
                      item
                        SizeStyle = ssAbsolute
                        Value = 32.000000000000000000
                      end
                      item
                        SizeStyle = ssAbsolute
                        Value = 32.000000000000000000
                      end
                      item
                        SizeStyle = ssAbsolute
                        Value = 32.000000000000000000
                      end
                      item
                        SizeStyle = ssAbsolute
                        Value = 32.000000000000000000
                      end>
                    TabOrder = 0
                    DesignSize = (
                      736
                      485)
                    object Label121: TLabel
                      Left = 0
                      Top = 32
                      Width = 25
                      Height = 32
                      Align = alClient
                      Alignment = taCenter
                      Caption = '1'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -13
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                      Layout = tlCenter
                      ExplicitWidth = 8
                      ExplicitHeight = 16
                    end
                    object Label128: TLabel
                      Left = 0
                      Top = 64
                      Width = 25
                      Height = 32
                      Align = alClient
                      Alignment = taCenter
                      Caption = '2'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -13
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                      Layout = tlCenter
                      ExplicitWidth = 8
                      ExplicitHeight = 16
                    end
                    object Label130: TLabel
                      Left = 0
                      Top = 96
                      Width = 25
                      Height = 32
                      Align = alClient
                      Alignment = taCenter
                      Caption = '3'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -13
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                      Layout = tlCenter
                      ExplicitWidth = 8
                      ExplicitHeight = 16
                    end
                    object Label132: TLabel
                      Left = 0
                      Top = 128
                      Width = 25
                      Height = 32
                      Align = alClient
                      Alignment = taCenter
                      Caption = '4'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -13
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                      Layout = tlCenter
                      ExplicitWidth = 8
                      ExplicitHeight = 16
                    end
                    object Label134: TLabel
                      Left = 0
                      Top = 160
                      Width = 25
                      Height = 32
                      Align = alClient
                      Alignment = taCenter
                      Caption = '5'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -13
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                      Layout = tlCenter
                      ExplicitWidth = 8
                      ExplicitHeight = 16
                    end
                    object Label136: TLabel
                      Left = 0
                      Top = 192
                      Width = 25
                      Height = 32
                      Align = alClient
                      Alignment = taCenter
                      Caption = '6'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -13
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                      Layout = tlCenter
                      ExplicitWidth = 8
                      ExplicitHeight = 16
                    end
                    object Label138: TLabel
                      Left = 0
                      Top = 288
                      Width = 25
                      Height = 32
                      Align = alClient
                      Alignment = taCenter
                      Caption = 'F9'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -13
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                      Layout = tlCenter
                      ExplicitWidth = 14
                      ExplicitHeight = 16
                    end
                    object Label140: TLabel
                      Left = 0
                      Top = 320
                      Width = 25
                      Height = 32
                      Align = alClient
                      Alignment = taCenter
                      Caption = 'F10'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -13
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                      Layout = tlCenter
                      ExplicitWidth = 22
                      ExplicitHeight = 16
                    end
                    object Label142: TLabel
                      Left = 0
                      Top = 352
                      Width = 25
                      Height = 32
                      Align = alClient
                      Alignment = taCenter
                      Caption = 'F11'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -13
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                      Layout = tlCenter
                      ExplicitWidth = 22
                      ExplicitHeight = 16
                    end
                    object bt_v2_menu_novo: TBitBtn
                      Left = 25
                      Top = 32
                      Width = 711
                      Height = 32
                      Align = alClient
                      Caption = 'NOVO'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -13
                      Font.Name = 'Verdana'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 1
                      OnClick = bt_v2_menu_novoClick
                    end
                    object bt_v2_menu_consulta_nfce: TBitBtn
                      Left = 25
                      Top = 288
                      Width = 711
                      Height = 32
                      Align = alClient
                      Caption = 'CONSULTA NFCE'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -13
                      Font.Name = 'Verdana'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 9
                      OnClick = bt_v2_menu_consulta_nfceClick
                    end
                    object bt_v2_menu_excluir: TBitBtn
                      Left = 25
                      Top = 64
                      Width = 711
                      Height = 32
                      Align = alClient
                      Caption = 'EXCLUIR ITEM'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -13
                      Font.Name = 'Verdana'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 2
                      OnClick = bt_v2_menu_excluirClick
                    end
                    object bt_v2_menu_alterar: TBitBtn
                      Left = 25
                      Top = 96
                      Width = 711
                      Height = 32
                      Align = alClient
                      Caption = 'ALTERAR ITEM'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -13
                      Font.Name = 'Verdana'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 3
                      OnClick = bt_v2_menu_alterarClick
                    end
                    object bt_v2_menu_desconto_item: TBitBtn
                      Left = 25
                      Top = 128
                      Width = 711
                      Height = 32
                      Align = alClient
                      Caption = 'CONCEDER DESCONTO NO ITEM'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -13
                      Font.Name = 'Verdana'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 4
                      OnClick = bt_v2_menu_desconto_itemClick
                    end
                    object bt_v2_menu_consulta_cliente: TBitBtn
                      Left = 25
                      Top = 384
                      Width = 711
                      Height = 32
                      Align = alClient
                      Caption = 'CONSULTA CLIENTE'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -13
                      Font.Name = 'Verdana'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 12
                      OnClick = bt_v2_menu_consulta_clienteClick
                    end
                    object bt_v2_menu_valores_nf: TBitBtn
                      Left = 25
                      Top = 160
                      Width = 711
                      Height = 32
                      Align = alClient
                      Caption = 'DESCONTO E OUTROS VALORES'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -13
                      Font.Name = 'Verdana'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 5
                      OnClick = bt_v2_menu_valores_nfClick
                    end
                    object bt_v2_menu_pagamento: TBitBtn
                      Left = 25
                      Top = 352
                      Width = 711
                      Height = 32
                      Align = alClient
                      Caption = 'PAGAMENTO'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -13
                      Font.Name = 'Verdana'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 11
                      OnClick = bt_v2_menu_pagamentoClick
                    end
                    object bt_v2_menu_modo_completo: TBitBtn
                      Left = 25
                      Top = 320
                      Width = 711
                      Height = 32
                      Align = alClient
                      Caption = 'MODO COMPLETO'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -13
                      Font.Name = 'Verdana'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 10
                      OnClick = bt_v2_menu_modo_completoClick
                    end
                    object Label127: TLabel
                      Left = 0
                      Top = 384
                      Width = 25
                      Height = 32
                      Align = alClient
                      Alignment = taCenter
                      Caption = 'F12'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -13
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                      Layout = tlCenter
                      ExplicitWidth = 22
                      ExplicitHeight = 16
                    end
                    object Label129: TLabel
                      Left = 0
                      Top = 416
                      Width = 25
                      Height = 32
                      Align = alClient
                      Alignment = taCenter
                      Caption = 'ESC'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                      Layout = tlCenter
                      ExplicitWidth = 20
                      ExplicitHeight = 13
                    end
                    object bt_v2_menu_voltar_page_1: TBitBtn
                      Left = 25
                      Top = 416
                      Width = 711
                      Height = 32
                      Align = alBottom
                      Caption = 'VOLTAR'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -13
                      Font.Name = 'Verdana'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 13
                      OnClick = bt_v2_menu_voltar_page_1Click
                    end
                    object Panel81: TPanel
                      Left = 25
                      Top = 0
                      Width = 711
                      Height = 32
                      Align = alTop
                      BevelOuter = bvNone
                      Caption = 'Menu de Opera'#231#227'o'
                      Enabled = False
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -13
                      Font.Name = 'Verdana'
                      Font.Style = [fsBold]
                      ParentColor = True
                      ParentFont = False
                      TabOrder = 0
                    end
                    object Label68: TLabel
                      Left = 0
                      Top = 224
                      Width = 25
                      Height = 32
                      Align = alClient
                      Alignment = taCenter
                      Caption = '7'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                      Layout = tlCenter
                      ExplicitWidth = 7
                      ExplicitHeight = 13
                    end
                    object Label69: TLabel
                      Left = 0
                      Top = 256
                      Width = 25
                      Height = 32
                      Align = alClient
                      Alignment = taCenter
                      Caption = '8'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                      Layout = tlCenter
                      ExplicitWidth = 7
                      ExplicitHeight = 13
                    end
                    object Label70: TLabel
                      Left = 0
                      Top = 448
                      Width = 25
                      Height = 32
                      Align = alClient
                      Alignment = taCenter
                      Caption = '9'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                      Layout = tlCenter
                      ExplicitWidth = 7
                      ExplicitHeight = 13
                    end
                    object bt_v2_menu_usar_orcamento: TBitBtn
                      Left = 25
                      Top = 192
                      Width = 711
                      Height = 32
                      Align = alClient
                      Caption = 'USAR ORCAMENTO'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -13
                      Font.Name = 'Verdana'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 6
                      OnClick = bt_v2_menu_usar_orcamentoClick
                    end
                    object Panel108: TPanel
                      Left = 0
                      Top = 0
                      Width = 25
                      Height = 32
                      Anchors = []
                      Caption = 'Panel108'
                      Enabled = False
                      TabOrder = 15
                      Visible = False
                    end
                    object bt_v2_menu_movimento_operador: TBitBtn
                      Left = 25
                      Top = 224
                      Width = 711
                      Height = 32
                      Align = alClient
                      Caption = 'MOVIMENTO OPERADOR'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -13
                      Font.Name = 'Verdana'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 7
                      OnClick = bt_v2_menu_movimento_operadorClick
                    end
                    object bt_v2_menu_sangsup: TBitBtn
                      Left = 25
                      Top = 256
                      Width = 711
                      Height = 32
                      Align = alClient
                      Caption = 'SANGRIA/SUPRIMENTO'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -13
                      Font.Name = 'Verdana'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 8
                      OnClick = bt_v2_menu_sangsupClick
                    end
                    object bt_v2_menu_goto_page_2: TBitBtn
                      Left = 25
                      Top = 448
                      Width = 711
                      Height = 32
                      Align = alClient
                      Caption = 'PROXIMA PAGINA'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -13
                      Font.Name = 'Verdana'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 14
                      OnClick = bt_v2_menu_goto_page_2Click
                    end
                  end
                  object pn_v2_menus_pag_2: TGridPanel
                    Left = 0
                    Top = 485
                    Width = 736
                    Height = 485
                    Align = alBottom
                    BevelOuter = bvNone
                    ColumnCollection = <
                      item
                        SizeStyle = ssAbsolute
                        Value = 25.000000000000000000
                      end
                      item
                        Value = 100.000000000000000000
                      end>
                    ControlCollection = <
                      item
                        Column = 0
                        Control = Label73
                        Row = 1
                      end
                      item
                        Column = 0
                        Control = Label74
                        Row = 2
                      end
                      item
                        Column = 0
                        Control = Label75
                        Row = 3
                      end
                      item
                        Column = 0
                        Control = Label76
                        Row = 4
                      end
                      item
                        Column = 0
                        Control = Label101
                        Row = 5
                      end
                      item
                        Column = 0
                        Control = Label102
                        Row = 6
                      end
                      item
                        Column = 0
                        Control = Label103
                        Row = 10
                      end
                      item
                        Column = 0
                        Control = Label131
                        Row = 11
                      end
                      item
                        Column = 0
                        Control = Label133
                        Row = 12
                      end
                      item
                        Column = 1
                        Control = bt_v2_menu_goto_page_1
                        Row = 1
                      end
                      item
                        Column = 0
                        Control = Label135
                        Row = 13
                      end
                      item
                        Column = 0
                        Control = Label137
                        Row = 14
                      end
                      item
                        Column = 1
                        Control = bt_v2_menu_voltar_page_2
                        Row = 14
                      end
                      item
                        Column = 1
                        Control = Panel85
                        Row = 0
                      end
                      item
                        Column = 0
                        Control = Label139
                        Row = 7
                      end
                      item
                        Column = 0
                        Control = Label141
                        Row = 8
                      end
                      item
                        Column = 0
                        Control = Label143
                        Row = 9
                      end
                      item
                        Column = 0
                        Control = Panel106
                        Row = 0
                      end
                      item
                        Column = 1
                        Control = bt_v2_menu_modo_reimprimir
                        Row = 2
                      end
                      item
                        Column = 1
                        Control = bt_v2_menu_log_rejeicoes
                        Row = 3
                      end
                      item
                        Column = 1
                        Control = bt_v2_menu_log_messages
                        Row = 4
                      end
                      item
                        Column = 1
                        Control = BitBtn9
                        Row = 5
                      end
                      item
                        Column = 1
                        Control = BitBtn10
                        Row = 6
                      end
                      item
                        Column = 1
                        Control = BitBtn11
                        Row = 7
                      end
                      item
                        Column = 1
                        Control = BitBtn12
                        Row = 8
                      end
                      item
                        Column = 1
                        Control = BitBtn13
                        Row = 9
                      end
                      item
                        Column = 1
                        Control = BitBtn14
                        Row = 10
                      end
                      item
                        Column = 1
                        Control = BitBtn15
                        Row = 11
                      end
                      item
                        Column = 1
                        Control = BitBtn16
                        Row = 12
                      end
                      item
                        Column = 1
                        Control = bt_v2_menu_vendedor
                        Row = 13
                      end>
                    ParentColor = True
                    RowCollection = <
                      item
                        SizeStyle = ssAbsolute
                        Value = 32.000000000000000000
                      end
                      item
                        SizeStyle = ssAbsolute
                        Value = 32.000000000000000000
                      end
                      item
                        SizeStyle = ssAbsolute
                        Value = 32.000000000000000000
                      end
                      item
                        SizeStyle = ssAbsolute
                        Value = 32.000000000000000000
                      end
                      item
                        SizeStyle = ssAbsolute
                        Value = 32.000000000000000000
                      end
                      item
                        SizeStyle = ssAbsolute
                        Value = 32.000000000000000000
                      end
                      item
                        SizeStyle = ssAbsolute
                        Value = 32.000000000000000000
                      end
                      item
                        SizeStyle = ssAbsolute
                        Value = 32.000000000000000000
                      end
                      item
                        SizeStyle = ssAbsolute
                        Value = 32.000000000000000000
                      end
                      item
                        SizeStyle = ssAbsolute
                        Value = 32.000000000000000000
                      end
                      item
                        SizeStyle = ssAbsolute
                        Value = 32.000000000000000000
                      end
                      item
                        SizeStyle = ssAbsolute
                        Value = 32.000000000000000000
                      end
                      item
                        SizeStyle = ssAbsolute
                        Value = 32.000000000000000000
                      end
                      item
                        SizeStyle = ssAbsolute
                        Value = 32.000000000000000000
                      end
                      item
                        SizeStyle = ssAbsolute
                        Value = 32.000000000000000000
                      end>
                    TabOrder = 1
                    DesignSize = (
                      736
                      485)
                    object Label73: TLabel
                      Left = 0
                      Top = 32
                      Width = 25
                      Height = 32
                      Align = alClient
                      Alignment = taCenter
                      Caption = '0'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -13
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                      Layout = tlCenter
                      ExplicitWidth = 8
                      ExplicitHeight = 16
                    end
                    object Label74: TLabel
                      Left = 0
                      Top = 64
                      Width = 25
                      Height = 32
                      Align = alClient
                      Alignment = taCenter
                      Caption = '1'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -13
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                      Layout = tlCenter
                      ExplicitWidth = 8
                      ExplicitHeight = 16
                    end
                    object Label75: TLabel
                      Left = 0
                      Top = 96
                      Width = 25
                      Height = 32
                      Align = alClient
                      Alignment = taCenter
                      Caption = '2'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -13
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                      Layout = tlCenter
                      ExplicitWidth = 8
                      ExplicitHeight = 16
                    end
                    object Label76: TLabel
                      Left = 0
                      Top = 128
                      Width = 25
                      Height = 32
                      Align = alClient
                      Alignment = taCenter
                      Caption = '3'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -13
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                      Layout = tlCenter
                      ExplicitWidth = 8
                      ExplicitHeight = 16
                    end
                    object Label101: TLabel
                      Left = 0
                      Top = 160
                      Width = 25
                      Height = 32
                      Align = alClient
                      Alignment = taCenter
                      Caption = '4'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -13
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                      Layout = tlCenter
                      Visible = False
                      ExplicitWidth = 8
                      ExplicitHeight = 16
                    end
                    object Label102: TLabel
                      Left = 0
                      Top = 192
                      Width = 25
                      Height = 32
                      Align = alClient
                      Alignment = taCenter
                      Caption = '5'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -13
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                      Layout = tlCenter
                      Visible = False
                      ExplicitWidth = 8
                      ExplicitHeight = 16
                    end
                    object Label103: TLabel
                      Left = 0
                      Top = 320
                      Width = 25
                      Height = 32
                      Align = alClient
                      Alignment = taCenter
                      Caption = 'F??'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -13
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                      Layout = tlCenter
                      Visible = False
                      ExplicitWidth = 20
                      ExplicitHeight = 16
                    end
                    object Label131: TLabel
                      Left = 0
                      Top = 352
                      Width = 25
                      Height = 32
                      Align = alClient
                      Alignment = taCenter
                      Caption = 'F??'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -13
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                      Layout = tlCenter
                      Visible = False
                      ExplicitWidth = 20
                      ExplicitHeight = 16
                    end
                    object Label133: TLabel
                      Left = 0
                      Top = 384
                      Width = 25
                      Height = 32
                      Align = alClient
                      Alignment = taCenter
                      Caption = 'F??'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -13
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                      Layout = tlCenter
                      Visible = False
                      ExplicitWidth = 20
                      ExplicitHeight = 16
                    end
                    object bt_v2_menu_goto_page_1: TBitBtn
                      Left = 25
                      Top = 32
                      Width = 711
                      Height = 32
                      Align = alClient
                      Caption = 'PAGINA ANTERIOR'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -13
                      Font.Name = 'Verdana'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 1
                      OnClick = bt_v2_menu_goto_page_1Click
                    end
                    object Label135: TLabel
                      Left = 0
                      Top = 416
                      Width = 25
                      Height = 32
                      Align = alClient
                      Alignment = taCenter
                      Caption = 'F8'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -13
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                      Layout = tlCenter
                      ExplicitWidth = 14
                      ExplicitHeight = 16
                    end
                    object Label137: TLabel
                      Left = 0
                      Top = 448
                      Width = 25
                      Height = 32
                      Align = alClient
                      Alignment = taCenter
                      Caption = 'ESC'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                      Layout = tlCenter
                      ExplicitWidth = 20
                      ExplicitHeight = 13
                    end
                    object bt_v2_menu_voltar_page_2: TBitBtn
                      Left = 25
                      Top = 448
                      Width = 711
                      Height = 32
                      Align = alBottom
                      Caption = 'VOLTAR'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -13
                      Font.Name = 'Verdana'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 5
                      OnClick = bt_v2_menu_voltar_page_1Click
                    end
                    object Panel85: TPanel
                      Left = 25
                      Top = 0
                      Width = 711
                      Height = 32
                      Align = alTop
                      BevelOuter = bvNone
                      Caption = 'Menu de Opera'#231#227'o'
                      Enabled = False
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -13
                      Font.Name = 'Verdana'
                      Font.Style = [fsBold]
                      ParentColor = True
                      ParentFont = False
                      TabOrder = 6
                    end
                    object Label139: TLabel
                      Left = 0
                      Top = 224
                      Width = 25
                      Height = 32
                      Align = alClient
                      Alignment = taCenter
                      Caption = '6'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                      Layout = tlCenter
                      Visible = False
                      ExplicitWidth = 7
                      ExplicitHeight = 13
                    end
                    object Label141: TLabel
                      Left = 0
                      Top = 256
                      Width = 25
                      Height = 32
                      Align = alClient
                      Alignment = taCenter
                      Caption = '8'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                      Layout = tlCenter
                      Visible = False
                      ExplicitWidth = 7
                      ExplicitHeight = 13
                    end
                    object Label143: TLabel
                      Left = 0
                      Top = 288
                      Width = 25
                      Height = 32
                      Align = alClient
                      Alignment = taCenter
                      Caption = '9'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                      Layout = tlCenter
                      Visible = False
                      ExplicitWidth = 7
                      ExplicitHeight = 13
                    end
                    object Panel106: TPanel
                      Left = 0
                      Top = 0
                      Width = 25
                      Height = 32
                      Anchors = []
                      Caption = 'Panel106'
                      Enabled = False
                      TabOrder = 0
                      Visible = False
                    end
                    object bt_v2_menu_modo_reimprimir: TBitBtn
                      Left = 25
                      Top = 64
                      Width = 711
                      Height = 32
                      Align = alClient
                      Caption = 'REIMPRIMIR'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -13
                      Font.Name = 'Verdana'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 2
                      OnClick = bt_v2_menu_modo_reimprimirClick
                    end
                    object bt_v2_menu_log_rejeicoes: TBitBtn
                      Left = 25
                      Top = 96
                      Width = 711
                      Height = 32
                      Align = alClient
                      Caption = 'LOG DE REJEICOES'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -13
                      Font.Name = 'Verdana'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 3
                      OnClick = bt_v2_menu_log_rejeicoesClick
                    end
                    object bt_v2_menu_log_messages: TBitBtn
                      Left = 25
                      Top = 128
                      Width = 711
                      Height = 32
                      Align = alClient
                      Caption = 'LOG DE MENSAGENS'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -13
                      Font.Name = 'Verdana'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 4
                      OnClick = bt_v2_menu_log_messagesClick
                    end
                    object BitBtn9: TBitBtn
                      Left = 25
                      Top = 160
                      Width = 711
                      Height = 32
                      Align = alClient
                      Caption = 'DESABILITADOS'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -13
                      Font.Name = 'Verdana'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 7
                      Visible = False
                      OnClick = bt_v2_menu_log_messagesClick
                    end
                    object BitBtn10: TBitBtn
                      Left = 25
                      Top = 192
                      Width = 711
                      Height = 32
                      Align = alClient
                      Caption = 'DESABILITADOS'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -13
                      Font.Name = 'Verdana'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 8
                      Visible = False
                      OnClick = bt_v2_menu_log_messagesClick
                    end
                    object BitBtn11: TBitBtn
                      Left = 25
                      Top = 224
                      Width = 711
                      Height = 32
                      Align = alClient
                      Caption = 'DESABILITADOS'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -13
                      Font.Name = 'Verdana'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 9
                      Visible = False
                      OnClick = bt_v2_menu_log_messagesClick
                    end
                    object BitBtn12: TBitBtn
                      Left = 25
                      Top = 256
                      Width = 711
                      Height = 32
                      Align = alClient
                      Caption = 'DESABILITADOS'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -13
                      Font.Name = 'Verdana'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 10
                      Visible = False
                      OnClick = bt_v2_menu_log_messagesClick
                    end
                    object BitBtn13: TBitBtn
                      Left = 25
                      Top = 288
                      Width = 711
                      Height = 32
                      Align = alClient
                      Caption = 'DESABILITADOS'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -13
                      Font.Name = 'Verdana'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 11
                      Visible = False
                      OnClick = bt_v2_menu_log_messagesClick
                    end
                    object BitBtn14: TBitBtn
                      Left = 25
                      Top = 320
                      Width = 711
                      Height = 32
                      Align = alClient
                      Caption = 'DESABILITADOS'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -13
                      Font.Name = 'Verdana'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 12
                      Visible = False
                      OnClick = bt_v2_menu_log_messagesClick
                    end
                    object BitBtn15: TBitBtn
                      Left = 25
                      Top = 352
                      Width = 711
                      Height = 32
                      Align = alClient
                      Caption = 'DESABILITADOS'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -13
                      Font.Name = 'Verdana'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 13
                      Visible = False
                      OnClick = bt_v2_menu_log_messagesClick
                    end
                    object BitBtn16: TBitBtn
                      Left = 25
                      Top = 384
                      Width = 711
                      Height = 32
                      Align = alClient
                      Caption = 'DESABILITADOS'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -13
                      Font.Name = 'Verdana'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 14
                      Visible = False
                      OnClick = bt_v2_menu_log_messagesClick
                    end
                    object bt_v2_menu_vendedor: TBitBtn
                      Left = 25
                      Top = 416
                      Width = 711
                      Height = 32
                      Align = alClient
                      Caption = 'VENDEDOR'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -13
                      Font.Name = 'Verdana'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 15
                      OnClick = bt_v2_menu_vendedorClick
                    end
                  end
                end
              end
            end
            object ts_v2_cupom: TTabSheet
              Caption = 'ts_v2_cupom'
              object pn_v2_cupom: TPanel
                Left = 0
                Top = 0
                Width = 779
                Height = 495
                Align = alClient
                BevelOuter = bvNone
                Ctl3D = False
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Lucida Console'
                Font.Style = []
                Padding.Top = 10
                ParentCtl3D = False
                ParentFont = False
                TabOrder = 0
                object re_print_rdp: TRichEdit
                  Left = 0
                  Top = 465
                  Width = 779
                  Height = 30
                  Align = alBottom
                  BevelInner = bvNone
                  BevelOuter = bvNone
                  BorderStyle = bsNone
                  Color = 12382968
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Lucida Console'
                  Font.Style = []
                  Lines.Strings = (
                    '                             ____________'
                    '                              TOTAL 27,16')
                  ParentFont = False
                  TabOrder = 0
                  WordWrap = False
                end
                object re_print: TRichEdit
                  Left = 0
                  Top = 69
                  Width = 779
                  Height = 390
                  Align = alClient
                  BevelInner = bvNone
                  BorderStyle = bsNone
                  Color = 12382968
                  Lines.Strings = (
                    ' 001 7622300515751 OVO CONFETI LACTA 220G'
                    '          1,000 UND           27,158 F              27,16 ')
                  TabOrder = 1
                  WordWrap = False
                end
                object re_print_cab: TRichEdit
                  Left = 0
                  Top = 16
                  Width = 779
                  Height = 47
                  Align = alTop
                  BevelInner = bvNone
                  BevelOuter = bvNone
                  BorderStyle = bsNone
                  Color = 12382968
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Lucida Console'
                  Font.Style = []
                  Lines.Strings = (
                    ' CLIENTE N'#195'O IDENTIFICADO                             CX: '
                    ' 21/09/2019       NOTA FISCAL CONSUMIDOR        ID: 547   '
                    ' Item       Qtde UN       Valor UN Sit        Valor Total ')
                  ParentFont = False
                  TabOrder = 2
                  WordWrap = False
                end
                object re_print_cab_padding: TPanel
                  Left = 0
                  Top = 10
                  Width = 779
                  Height = 6
                  Align = alTop
                  BevelOuter = bvNone
                  Color = 12382968
                  ParentBackground = False
                  TabOrder = 3
                end
                object re_print_rdp_padding: TPanel
                  Left = 0
                  Top = 459
                  Width = 779
                  Height = 6
                  Align = alBottom
                  BevelOuter = bvNone
                  Color = 12382968
                  ParentBackground = False
                  TabOrder = 4
                end
                object re_print_padding: TPanel
                  Left = 0
                  Top = 63
                  Width = 779
                  Height = 6
                  Align = alTop
                  BevelOuter = bvNone
                  Color = 12382968
                  ParentBackground = False
                  TabOrder = 5
                end
              end
            end
            object ts_v2_cons_prod: TTabSheet
              Caption = 'ts_v2_cons_prod'
              ImageIndex = 1
              object pn_v2_cons_prod: TPanel
                Left = 0
                Top = 0
                Width = 779
                Height = 495
                Align = alClient
                BevelKind = bkTile
                BevelOuter = bvNone
                BorderWidth = 5
                Color = clWhite
                Ctl3D = False
                ParentBackground = False
                ParentCtl3D = False
                TabOrder = 0
                object Panel78: TPanel
                  Left = 5
                  Top = 5
                  Width = 765
                  Height = 21
                  Align = alTop
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  Caption = '[Enter: Selecionar] [ESC: Cancelar]'
                  ParentColor = True
                  TabOrder = 0
                end
                object Panel86: TPanel
                  Left = 5
                  Top = 430
                  Width = 765
                  Height = 56
                  Align = alBottom
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  Enabled = False
                  ParentColor = True
                  TabOrder = 1
                  object Panel87: TPanel
                    Left = 0
                    Top = 0
                    Width = 113
                    Height = 52
                    Align = alLeft
                    BevelOuter = bvNone
                    BorderWidth = 3
                    Padding.Bottom = 2
                    ParentColor = True
                    TabOrder = 0
                    object ed_v2_cons_prod_estoqeu: TPanel
                      Left = 3
                      Top = 22
                      Width = 107
                      Height = 25
                      Align = alClient
                      Alignment = taRightJustify
                      BevelOuter = bvNone
                      BorderWidth = 3
                      BorderStyle = bsSingle
                      Caption = '2,000'
                      Color = clWhite
                      Ctl3D = False
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -13
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentBackground = False
                      ParentCtl3D = False
                      ParentFont = False
                      TabOrder = 0
                    end
                    object Panel89: TPanel
                      Left = 3
                      Top = 3
                      Width = 107
                      Height = 19
                      Align = alTop
                      Alignment = taLeftJustify
                      BevelOuter = bvNone
                      Caption = 'Estoque Disponivel'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -12
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentColor = True
                      ParentFont = False
                      TabOrder = 1
                    end
                  end
                  object pn_v2_cons_prod_grade: TPanel
                    Left = 113
                    Top = 0
                    Width = 648
                    Height = 52
                    Align = alClient
                    BevelOuter = bvNone
                    BorderWidth = 3
                    Padding.Bottom = 2
                    ParentColor = True
                    TabOrder = 1
                    object pn_v2_cons_prod_grade_2: TPanel
                      Left = 3
                      Top = 27
                      Width = 642
                      Height = 20
                      Align = alBottom
                      BevelOuter = bvNone
                      BorderWidth = 3
                      BorderStyle = bsSingle
                      Caption = 'TAMANHO 32'
                      Color = clWhite
                      Ctl3D = False
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -12
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentBackground = False
                      ParentCtl3D = False
                      ParentFont = False
                      TabOrder = 0
                    end
                    object pn_v2_cons_prod_grade_1: TPanel
                      Left = 3
                      Top = 3
                      Width = 642
                      Height = 20
                      Align = alTop
                      BevelOuter = bvNone
                      BorderWidth = 3
                      BorderStyle = bsSingle
                      Caption = 'TAMANHO 32'
                      Color = clWhite
                      Ctl3D = False
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -12
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentBackground = False
                      ParentCtl3D = False
                      ParentFont = False
                      TabOrder = 1
                    end
                  end
                end
                object Panel79: TPanel
                  Left = 5
                  Top = 26
                  Width = 765
                  Height = 404
                  Align = alClient
                  Padding.Top = 5
                  Padding.Bottom = 3
                  ParentColor = True
                  TabOrder = 2
                  object grid_v2_cons_prod: TDBGrid
                    Left = 1
                    Top = 6
                    Width = 763
                    Height = 394
                    Align = alClient
                    FixedColor = clWhite
                    Options = [dgTitles, dgIndicator, dgColumnResize, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
                    TabOrder = 0
                    TitleFont.Charset = DEFAULT_CHARSET
                    TitleFont.Color = clWindowText
                    TitleFont.Height = -11
                    TitleFont.Name = 'Tahoma'
                    TitleFont.Style = []
                    OnDblClick = grid_v2_cons_prodDblClick
                    OnKeyDown = grid_v2_cons_prodKeyDown
                    Columns = <
                      item
                        Expanded = False
                        FieldName = 'NUM_FAB_PROD'
                        Width = 104
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'UNIDADE'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'DESCR_PROD'
                        Width = 303
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'MARCA_P'
                        Width = 101
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'PREC_TAB_PROD'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'PREC_30_PROD'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'PREC_60_PROD'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'PREC_90_PROD'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'EM_PROMOCAO'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'PRECO_PROMOCAO'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'NBM'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'CODIGO_NOP'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'CST_PROD'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'CST_PIS'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'CST_COFINS'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'CEST'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'NFCI'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'ALIQ_PIS_DIFERENCIADA'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'ALIQ_COFINS_DIFERENCIADA'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'PERC_RED_PROD'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'ICM_PROD'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'PERMITIR_DESCONTO'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'GRUPO_PROD'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'COD_PROD'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'COD_BARRA'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'DESCR_PROD_RED'
                        Visible = True
                      end>
                  end
                end
              end
            end
            object ts_v2_selecionar_item: TTabSheet
              Caption = 'ts_v2_selecionar_item'
              ImageIndex = 2
              object pn_v2_selecao_item: TPanel
                Left = 0
                Top = 0
                Width = 779
                Height = 495
                Align = alClient
                BevelKind = bkTile
                BevelOuter = bvNone
                BorderWidth = 5
                Color = clWhite
                Ctl3D = False
                ParentBackground = False
                ParentCtl3D = False
                TabOrder = 0
                object Panel67: TPanel
                  Left = 5
                  Top = 5
                  Width = 765
                  Height = 21
                  Align = alTop
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  Caption = '[Enter: Selecionar] [ESC: Cancelar]'
                  ParentColor = True
                  TabOrder = 0
                end
                object Panel75: TPanel
                  Left = 5
                  Top = 26
                  Width = 765
                  Height = 460
                  Align = alClient
                  BevelOuter = bvNone
                  Padding.Top = 5
                  Padding.Bottom = 3
                  ParentColor = True
                  TabOrder = 1
                  object grid_v2_selecao_item: TDBGrid
                    Left = 0
                    Top = 5
                    Width = 765
                    Height = 452
                    Align = alClient
                    Color = clWhite
                    DataSource = dtmNFConsumidor.dsNFCe_It
                    FixedColor = clWhite
                    Options = [dgTitles, dgIndicator, dgColumnResize, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                    TabOrder = 0
                    TitleFont.Charset = DEFAULT_CHARSET
                    TitleFont.Color = clWindowText
                    TitleFont.Height = -11
                    TitleFont.Name = 'Tahoma'
                    TitleFont.Style = []
                    Columns = <
                      item
                        Expanded = False
                        FieldName = 'NITEM'
                        Width = 30
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'TIPO_ITEM'
                        Title.Caption = 'TP'
                        Width = 15
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'NUM_FAB_PROD'
                        Width = 85
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'XPROD'
                        Width = 232
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'QVND'
                        Width = 52
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'UVND'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'VVND'
                        Width = 65
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'VPROD'
                        Title.Caption = 'Vr Tot'
                        Width = 65
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'VDESC'
                        Title.Caption = 'Desconto'
                        Width = 58
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'CFOP'
                        Width = 48
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'ICM_CST'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'ICM_CSOSN'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'CEAN'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'NCM'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'CEST'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'VFRETE'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'VSEG'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'VOUTRO'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'VTOTTRIB'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'NFCI'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'ICM_ORIG'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'ICM_MODBC'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'ICM_PREDBC'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'ICM_VBC'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'ICM_PICMS'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'ICM_VICMS'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'ICM_VBCSTRET'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'ICM_VICMSSTRET'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'ICM_PCREDSN'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'ICM_VCREDICMSSN'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'PIS_CST'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'PIS_VBC'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'PIS_PPIS'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'PIS_VPIS'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'PIS_QBCPROD'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'PIS_VALIQPROD'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'COFINS_CST'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'COFINS_VBC'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'COFINS_PCOFINS'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'COFINS_VCOFINS'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'COFINS_QBCPROD'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'COFINS_VALIQPROD'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'ISS_VBC'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'ISS_VALIQ'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'ISS_VISSQN'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'ISS_CMUNFG'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'ISS_CLISTSERV'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'ISS_VDEDUCAO'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'ISS_VOUTRO'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'ISS_VDESCINCOND'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'ISS_VDESCCOND'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'ISS_VISSRET'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'ISS_INDISS'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'FRETE_NA_BASE'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'SEQID'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'COD_SERVICO'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'GRUPO_PROD'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'COD_PROD'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'COD_NFCE'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'COD_EMPRESA'
                        Visible = False
                      end
                      item
                        Expanded = False
                        FieldName = 'UCOM'
                        Width = 32
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'QCOM'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'VUNCOM'
                        Width = 64
                        Visible = True
                      end
                      item
                        Alignment = taLeftJustify
                        Expanded = False
                        FieldName = 'UVND_FATOR'
                        Width = 100
                        Visible = True
                      end>
                  end
                end
              end
            end
            object ts_v2_exclusao_item: TTabSheet
              Caption = 'ts_v2_exclusao_item'
              ImageIndex = 4
              object pn_v2_exclusao_item: TPanel
                Left = 0
                Top = 0
                Width = 779
                Height = 495
                Align = alClient
                BevelKind = bkTile
                BevelOuter = bvNone
                BorderWidth = 6
                Color = clWhite
                Ctl3D = False
                ParentBackground = False
                ParentCtl3D = False
                TabOrder = 0
                object ScrollBox5: TScrollBox
                  Left = 6
                  Top = 6
                  Width = 763
                  Height = 479
                  Align = alClient
                  BevelInner = bvNone
                  BevelOuter = bvNone
                  BorderStyle = bsNone
                  TabOrder = 0
                  object Panel66: TPanel
                    Left = 0
                    Top = 0
                    Width = 763
                    Height = 42
                    Align = alTop
                    BevelOuter = bvNone
                    Padding.Left = 6
                    ParentColor = True
                    TabOrder = 0
                    object DBText14: TDBText
                      Left = 6
                      Top = 21
                      Width = 757
                      Height = 21
                      Align = alClient
                      DataField = 'NITEM'
                      DataSource = dtmNFConsumidor.dsNFCe_It
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -12
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                      ExplicitLeft = 240
                      ExplicitTop = 16
                      ExplicitWidth = 65
                      ExplicitHeight = 17
                    end
                    object Panel68: TPanel
                      Left = 6
                      Top = 0
                      Width = 757
                      Height = 21
                      Align = alTop
                      Alignment = taLeftJustify
                      BevelOuter = bvNone
                      Caption = 'Item'
                      ParentColor = True
                      TabOrder = 0
                    end
                  end
                  object Panel69: TPanel
                    Left = 0
                    Top = 84
                    Width = 763
                    Height = 42
                    Align = alTop
                    BevelOuter = bvNone
                    Padding.Left = 6
                    ParentColor = True
                    TabOrder = 1
                    object DBText15: TDBText
                      Left = 6
                      Top = 21
                      Width = 757
                      Height = 21
                      Align = alClient
                      DataField = 'XPROD'
                      DataSource = dtmNFConsumidor.dsNFCe_It
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -12
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                      ExplicitLeft = 240
                      ExplicitTop = 16
                      ExplicitWidth = 65
                      ExplicitHeight = 17
                    end
                    object Panel70: TPanel
                      Left = 6
                      Top = 0
                      Width = 757
                      Height = 21
                      Align = alTop
                      Alignment = taLeftJustify
                      BevelOuter = bvNone
                      Caption = 'Descri'#231#227'o'
                      ParentColor = True
                      TabOrder = 0
                    end
                  end
                  object GridPanel8: TGridPanel
                    Left = 0
                    Top = 42
                    Width = 763
                    Height = 42
                    Align = alTop
                    BevelOuter = bvNone
                    ColumnCollection = <
                      item
                        Value = 33.333333333333340000
                      end
                      item
                        Value = 33.333333333333340000
                      end
                      item
                        Value = 33.333333333333340000
                      end>
                    ControlCollection = <
                      item
                        Column = 0
                        Control = Panel71
                        Row = 0
                      end
                      item
                        Column = 1
                        Control = Panel73
                        Row = 0
                      end
                      item
                        Column = 2
                        Control = Panel76
                        Row = 0
                      end>
                    ParentColor = True
                    RowCollection = <
                      item
                        Value = 100.000000000000000000
                      end>
                    TabOrder = 2
                    object Panel71: TPanel
                      Left = 0
                      Top = 0
                      Width = 254
                      Height = 42
                      Align = alClient
                      BevelOuter = bvNone
                      Padding.Left = 6
                      ParentColor = True
                      TabOrder = 0
                      object Panel72: TPanel
                        Left = 6
                        Top = 0
                        Width = 248
                        Height = 42
                        Align = alClient
                        BevelOuter = bvNone
                        ParentBackground = False
                        ParentColor = True
                        TabOrder = 0
                        object Panel123: TPanel
                          Left = 0
                          Top = 0
                          Width = 57
                          Height = 42
                          Align = alLeft
                          BevelOuter = bvNone
                          ParentColor = True
                          TabOrder = 0
                          object DBText9: TDBText
                            Left = 0
                            Top = 21
                            Width = 57
                            Height = 21
                            Align = alClient
                            DataField = 'UVND'
                            DataSource = dtmNFConsumidor.dsNFCe_It
                            Font.Charset = DEFAULT_CHARSET
                            Font.Color = clWindowText
                            Font.Height = -12
                            Font.Name = 'Tahoma'
                            Font.Style = [fsBold]
                            ParentFont = False
                            ExplicitLeft = -6
                            ExplicitTop = 27
                            ExplicitWidth = 89
                          end
                          object Panel129: TPanel
                            Left = 0
                            Top = 0
                            Width = 57
                            Height = 21
                            Align = alTop
                            Alignment = taLeftJustify
                            BevelOuter = bvNone
                            Caption = 'Unidade'
                            ParentColor = True
                            TabOrder = 0
                          end
                        end
                        object Panel127: TPanel
                          Left = 57
                          Top = 0
                          Width = 191
                          Height = 42
                          Align = alClient
                          BevelOuter = bvNone
                          ParentColor = True
                          TabOrder = 1
                          object DBText16: TDBText
                            Left = 0
                            Top = 21
                            Width = 191
                            Height = 21
                            Align = alClient
                            DataField = 'QVND'
                            DataSource = dtmNFConsumidor.dsNFCe_It
                            Font.Charset = DEFAULT_CHARSET
                            Font.Color = clWindowText
                            Font.Height = -12
                            Font.Name = 'Tahoma'
                            Font.Style = [fsBold]
                            ParentFont = False
                            ExplicitLeft = -6
                            ExplicitTop = 27
                            ExplicitWidth = 89
                          end
                          object Panel128: TPanel
                            Left = 0
                            Top = 0
                            Width = 191
                            Height = 21
                            Align = alTop
                            Alignment = taLeftJustify
                            BevelOuter = bvNone
                            Caption = 'Quantidade'
                            ParentColor = True
                            TabOrder = 0
                          end
                        end
                      end
                    end
                    object Panel73: TPanel
                      Left = 254
                      Top = 0
                      Width = 254
                      Height = 42
                      Align = alClient
                      BevelOuter = bvNone
                      ParentColor = True
                      TabOrder = 1
                      object DBText17: TDBText
                        Left = 0
                        Top = 21
                        Width = 254
                        Height = 21
                        Align = alClient
                        DataField = 'VVND'
                        DataSource = dtmNFConsumidor.dsNFCe_It
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -12
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                        ExplicitLeft = -6
                        ExplicitTop = 15
                      end
                      object Panel74: TPanel
                        Left = 0
                        Top = 0
                        Width = 254
                        Height = 21
                        Align = alTop
                        Alignment = taLeftJustify
                        BevelOuter = bvNone
                        Caption = 'Valor Unit'#225'rio'
                        ParentColor = True
                        TabOrder = 0
                      end
                    end
                    object Panel76: TPanel
                      Left = 508
                      Top = 0
                      Width = 255
                      Height = 42
                      Align = alClient
                      BevelOuter = bvNone
                      ParentColor = True
                      TabOrder = 2
                      object DBText18: TDBText
                        Left = 0
                        Top = 21
                        Width = 255
                        Height = 21
                        Align = alClient
                        DataField = 'VPROD'
                        DataSource = dtmNFConsumidor.dsNFCe_It
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -12
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                        ExplicitLeft = 240
                        ExplicitTop = 16
                        ExplicitWidth = 65
                        ExplicitHeight = 17
                      end
                      object Panel80: TPanel
                        Left = 0
                        Top = 0
                        Width = 255
                        Height = 21
                        Align = alTop
                        Alignment = taLeftJustify
                        BevelOuter = bvNone
                        Caption = 'Valor Total'
                        ParentColor = True
                        TabOrder = 0
                      end
                    end
                  end
                  object Panel83: TPanel
                    Left = 0
                    Top = 126
                    Width = 763
                    Height = 43
                    Align = alTop
                    BevelKind = bkTile
                    BevelOuter = bvNone
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -13
                    Font.Name = 'Tahoma'
                    Font.Style = []
                    ParentColor = True
                    ParentFont = False
                    TabOrder = 3
                    object Panel84: TPanel
                      Left = 0
                      Top = 0
                      Width = 137
                      Height = 39
                      Align = alLeft
                      BevelOuter = bvNone
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -13
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentColor = True
                      ParentFont = False
                      TabOrder = 0
                      object Label71: TLabel
                        Left = 0
                        Top = 0
                        Width = 137
                        Height = 39
                        Align = alClient
                        Alignment = taCenter
                        Caption = 'Confirmar exclus'#227'o'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clBlue
                        Font.Height = -13
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                        Layout = tlCenter
                        ExplicitWidth = 123
                        ExplicitHeight = 16
                      end
                    end
                    object Panel104: TPanel
                      Left = 137
                      Top = 0
                      Width = 144
                      Height = 39
                      Align = alLeft
                      BevelOuter = bvNone
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -12
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      Padding.Top = 9
                      Padding.Bottom = 9
                      ParentColor = True
                      ParentFont = False
                      TabOrder = 1
                      object ed_v2_exclusao_item_opcao: TEditFiscal
                        Left = 0
                        Top = 9
                        Width = 144
                        Height = 21
                        Align = alClient
                        TabOrder = 0
                        Text = '      1: Sim - 2: N'#227'o      '
                        OnKeyPress = ed_v2_exclusao_item_opcaoKeyPress
                        ExplicitHeight = 20
                      end
                    end
                  end
                end
              end
            end
            object ts_v2_alteracao_item: TTabSheet
              Caption = 'ts_v2_alteracao_item'
              ImageIndex = 5
              object pn_v2_alteracao_item: TPanel
                Left = 0
                Top = 0
                Width = 779
                Height = 495
                Align = alClient
                BevelKind = bkTile
                BevelOuter = bvNone
                BorderWidth = 6
                Color = clWhite
                Ctl3D = False
                ParentBackground = False
                ParentCtl3D = False
                TabOrder = 0
                object ScrollBox6: TScrollBox
                  Left = 6
                  Top = 6
                  Width = 763
                  Height = 479
                  Align = alClient
                  BevelInner = bvNone
                  BevelOuter = bvNone
                  BorderStyle = bsNone
                  TabOrder = 0
                  object GridPanel11: TGridPanel
                    Left = 0
                    Top = 0
                    Width = 763
                    Height = 185
                    Align = alTop
                    BevelOuter = bvNone
                    BorderWidth = 1
                    BorderStyle = bsSingle
                    ColumnCollection = <
                      item
                        Value = 33.333333333333340000
                      end
                      item
                        SizeStyle = ssAbsolute
                        Value = 12.000000000000000000
                      end
                      item
                        Value = 33.333333333333340000
                      end
                      item
                        SizeStyle = ssAbsolute
                        Value = 12.000000000000000000
                      end
                      item
                        Value = 33.333333333333340000
                      end>
                    ControlCollection = <
                      item
                        Column = 0
                        Control = Panel100
                        Row = 0
                      end
                      item
                        Column = 2
                        ColumnSpan = 3
                        Control = Panel90
                        Row = 0
                      end
                      item
                        Column = 0
                        Control = ed_v2_alt_item_codigo
                        Row = 1
                      end
                      item
                        Column = 2
                        ColumnSpan = 3
                        Control = ed_v2_alt_item_descricao
                        Row = 1
                      end
                      item
                        Column = 2
                        Control = Panel96
                        Row = 2
                      end
                      item
                        Column = 4
                        Control = Panel98
                        Row = 2
                      end
                      item
                        Column = 2
                        Control = ed_v2_alt_item_vl_un
                        Row = 3
                      end
                      item
                        Column = 4
                        Control = ed_v2_alt_item_vl_tot
                        Row = 3
                      end
                      item
                        Column = 0
                        Control = Panel103
                        Row = 4
                      end
                      item
                        Column = 2
                        Control = Panel105
                        Row = 4
                      end
                      item
                        Column = 4
                        Control = Panel107
                        Row = 4
                      end
                      item
                        Column = 0
                        Control = ed_v2_alt_item_desc_perc
                        Row = 5
                      end
                      item
                        Column = 2
                        Control = ed_v2_alt_item_desc_val
                        Row = 5
                      end
                      item
                        Column = 4
                        Control = ed_v2_alt_item_tot_liq
                        Row = 5
                      end
                      item
                        Column = 0
                        Control = bt_v2_alteracao_item_salvar
                        Row = 7
                      end
                      item
                        Column = 2
                        Control = bt_v2_alteracao_item_cancela
                        Row = 7
                      end
                      item
                        Column = 0
                        Control = GridPanel16
                        Row = 2
                        RowSpan = 2
                      end>
                    ParentColor = True
                    RowCollection = <
                      item
                        SizeStyle = ssAbsolute
                        Value = 23.000000000000000000
                      end
                      item
                        SizeStyle = ssAbsolute
                        Value = 23.000000000000000000
                      end
                      item
                        SizeStyle = ssAbsolute
                        Value = 23.000000000000000000
                      end
                      item
                        SizeStyle = ssAbsolute
                        Value = 25.000000000000000000
                      end
                      item
                        SizeStyle = ssAbsolute
                        Value = 23.000000000000000000
                      end
                      item
                        SizeStyle = ssAbsolute
                        Value = 23.000000000000000000
                      end
                      item
                        SizeStyle = ssAbsolute
                        Value = 6.000000000000000000
                      end
                      item
                        SizeStyle = ssAbsolute
                        Value = 28.000000000000000000
                      end>
                    TabOrder = 0
                    object Panel100: TPanel
                      AlignWithMargins = True
                      Left = 4
                      Top = 4
                      Width = 239
                      Height = 21
                      Align = alTop
                      Alignment = taLeftJustify
                      BevelOuter = bvNone
                      Caption = 'C'#243'digo'
                      Enabled = False
                      ParentColor = True
                      TabOrder = 0
                    end
                    object Panel90: TPanel
                      AlignWithMargins = True
                      Left = 261
                      Top = 4
                      Width = 496
                      Height = 21
                      Align = alTop
                      Alignment = taLeftJustify
                      BevelOuter = bvNone
                      Caption = 'Descri'#231#227'o'
                      Enabled = False
                      ParentColor = True
                      TabOrder = 1
                    end
                    object ed_v2_alt_item_codigo: TMaskEdit
                      AlignWithMargins = True
                      Left = 4
                      Top = 27
                      Width = 239
                      Height = 19
                      Align = alTop
                      Enabled = False
                      TabOrder = 2
                      Text = 'MaskEdit4'
                    end
                    object ed_v2_alt_item_descricao: TMaskEdit
                      AlignWithMargins = True
                      Left = 261
                      Top = 27
                      Width = 496
                      Height = 19
                      Align = alTop
                      CharCase = ecUpperCase
                      TabOrder = 3
                      Text = 'ED_V2_ALT_ITEM_DESCRICAO'
                      OnExit = ed_v2_alt_item_descricaoExit
                    end
                    object Panel96: TPanel
                      AlignWithMargins = True
                      Left = 261
                      Top = 50
                      Width = 239
                      Height = 21
                      Align = alTop
                      Alignment = taLeftJustify
                      BevelOuter = bvNone
                      Caption = 'Valor Unit'#225'rio'
                      Enabled = False
                      ParentColor = True
                      TabOrder = 5
                    end
                    object Panel98: TPanel
                      AlignWithMargins = True
                      Left = 518
                      Top = 50
                      Width = 239
                      Height = 21
                      Align = alTop
                      Alignment = taLeftJustify
                      BevelOuter = bvNone
                      Caption = 'Valor Total'
                      Enabled = False
                      ParentColor = True
                      TabOrder = 6
                    end
                    object ed_v2_alt_item_vl_un: TEditHw
                      AlignWithMargins = True
                      Left = 261
                      Top = 73
                      Width = 239
                      Height = 19
                      Align = alTop
                      TabOrder = 7
                      Text = '0,00'
                      OnExit = ed_v2_alt_item_vl_unExit
                      Formato = fNumber
                      FormatSize = '0.2'
                    end
                    object ed_v2_alt_item_vl_tot: TEditHw
                      AlignWithMargins = True
                      Left = 518
                      Top = 73
                      Width = 239
                      Height = 19
                      Align = alTop
                      TabOrder = 8
                      Text = '0,00'
                      OnExit = ed_v2_alt_item_vl_totExit
                      Formato = fNumber
                      FormatSize = '0.2'
                    end
                    object Panel103: TPanel
                      AlignWithMargins = True
                      Left = 4
                      Top = 98
                      Width = 239
                      Height = 21
                      Align = alTop
                      Alignment = taLeftJustify
                      BevelOuter = bvNone
                      Caption = 'Desconto %'
                      Enabled = False
                      ParentColor = True
                      TabOrder = 9
                    end
                    object Panel105: TPanel
                      AlignWithMargins = True
                      Left = 261
                      Top = 98
                      Width = 239
                      Height = 21
                      Align = alTop
                      Alignment = taLeftJustify
                      BevelOuter = bvNone
                      Caption = 'Desconto R$'
                      Enabled = False
                      ParentColor = True
                      TabOrder = 10
                    end
                    object Panel107: TPanel
                      AlignWithMargins = True
                      Left = 518
                      Top = 98
                      Width = 239
                      Height = 21
                      Align = alTop
                      Alignment = taLeftJustify
                      BevelOuter = bvNone
                      Caption = 'Valor L'#237'quido'
                      Enabled = False
                      ParentColor = True
                      TabOrder = 11
                    end
                    object ed_v2_alt_item_desc_perc: TEditHw
                      AlignWithMargins = True
                      Left = 4
                      Top = 121
                      Width = 239
                      Height = 19
                      Align = alTop
                      TabOrder = 12
                      Text = '0,00'
                      OnExit = ed_v2_alt_item_desc_percExit
                      Formato = fNumber
                      FormatSize = '0.2'
                    end
                    object ed_v2_alt_item_desc_val: TEditHw
                      AlignWithMargins = True
                      Left = 261
                      Top = 121
                      Width = 239
                      Height = 19
                      Align = alTop
                      TabOrder = 13
                      Text = '0,00'
                      OnExit = ed_v2_alt_item_desc_valExit
                      Formato = fNumber
                      FormatSize = '0.2'
                    end
                    object ed_v2_alt_item_tot_liq: TEditHw
                      AlignWithMargins = True
                      Left = 518
                      Top = 121
                      Width = 239
                      Height = 19
                      Align = alTop
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                      TabOrder = 14
                      Text = '0,00'
                      OnExit = ed_v2_alt_item_tot_liqExit
                      Formato = fNumber
                      FormatSize = '0.2'
                    end
                    object bt_v2_alteracao_item_salvar: TBitBtn
                      Left = 146
                      Top = 147
                      Width = 100
                      Height = 28
                      Align = alRight
                      Caption = 'Salvar'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -13
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 15
                      OnClick = bt_v2_alteracao_item_salvarClick
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
                    object bt_v2_alteracao_item_cancela: TBitBtn
                      Left = 258
                      Top = 147
                      Width = 100
                      Height = 28
                      Align = alLeft
                      Caption = 'Cancela'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -13
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 16
                      OnClick = bt_v2_alteracao_item_cancelaClick
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
                    end
                    object GridPanel16: TGridPanel
                      Left = 1
                      Top = 47
                      Width = 245
                      Height = 48
                      Align = alClient
                      BevelOuter = bvNone
                      ColumnCollection = <
                        item
                          Value = 50.000000000000000000
                        end
                        item
                          Value = 50.000000000000000000
                        end>
                      ControlCollection = <
                        item
                          Column = 0
                          Control = Panel94
                          Row = 0
                        end
                        item
                          Column = 0
                          Control = ed_v2_alt_item_qtde
                          Row = 1
                        end
                        item
                          Column = 1
                          Control = Panel130
                          Row = 0
                        end
                        item
                          Column = 1
                          Control = ed_v2_alt_item_und
                          Row = 1
                        end>
                      ParentColor = True
                      RowCollection = <
                        item
                          Value = 50.000000000000000000
                        end
                        item
                          Value = 50.000000000000000000
                        end>
                      TabOrder = 4
                      DesignSize = (
                        245
                        48)
                      object Panel94: TPanel
                        AlignWithMargins = True
                        Left = 3
                        Top = 3
                        Width = 116
                        Height = 20
                        Align = alTop
                        Alignment = taLeftJustify
                        BevelOuter = bvNone
                        Caption = 'Quantidade'
                        Enabled = False
                        ParentColor = True
                        TabOrder = 0
                      end
                      object ed_v2_alt_item_qtde: TEditHw
                        AlignWithMargins = True
                        Left = 3
                        Top = 27
                        Width = 116
                        Height = 19
                        Align = alTop
                        TabOrder = 1
                        Text = '0,00'
                        OnExit = ed_v2_alt_item_qtdeExit
                        Formato = fNumber
                        FormatSize = '0.2'
                      end
                      object Panel130: TPanel
                        AlignWithMargins = True
                        Left = 125
                        Top = 3
                        Width = 117
                        Height = 20
                        Align = alTop
                        Alignment = taLeftJustify
                        BevelOuter = bvNone
                        Caption = 'Unidade'
                        Enabled = False
                        ParentColor = True
                        TabOrder = 2
                      end
                      object ed_v2_alt_item_und: TComboBox
                        AlignWithMargins = True
                        Left = 125
                        Top = 27
                        Width = 116
                        Height = 21
                        Style = csDropDownList
                        Anchors = []
                        ItemHeight = 13
                        TabOrder = 3
                        OnChange = ed_v2_alt_item_undChange
                        OnEnter = ed_v2_alt_item_undEnter
                      end
                    end
                  end
                end
              end
            end
            object ts_v2_desconto_item: TTabSheet
              Caption = 'ts_v2_desconto_item'
              ImageIndex = 6
              object pn_v2_desconto_item: TPanel
                Left = 0
                Top = 0
                Width = 779
                Height = 495
                Align = alClient
                BevelKind = bkTile
                BevelOuter = bvNone
                BorderWidth = 6
                Color = clWhite
                Ctl3D = False
                ParentCtl3D = False
                TabOrder = 0
                object ScrollBox7: TScrollBox
                  Left = 6
                  Top = 6
                  Width = 763
                  Height = 479
                  Align = alClient
                  BevelInner = bvNone
                  BevelOuter = bvNone
                  BorderStyle = bsNone
                  TabOrder = 0
                  object GridPanel7: TGridPanel
                    Left = 0
                    Top = 0
                    Width = 763
                    Height = 148
                    Align = alTop
                    BevelKind = bkTile
                    BevelOuter = bvNone
                    BorderWidth = 6
                    ColumnCollection = <
                      item
                        Value = 50.000000000000000000
                      end
                      item
                        SizeStyle = ssAbsolute
                        Value = 10.000000000000000000
                      end
                      item
                        Value = 50.000000000000000000
                      end>
                    ControlCollection = <
                      item
                        Column = 0
                        Control = Panel111
                        Row = 0
                      end
                      item
                        Column = 0
                        Control = bt_v2_desconto_item_salvar
                        Row = 5
                      end
                      item
                        Column = 2
                        Control = bt_v2_desconto_item_cancela
                        Row = 5
                      end
                      item
                        Column = 0
                        Control = Label104
                        Row = 1
                      end
                      item
                        Column = 2
                        Control = Panel82
                        Row = 0
                      end
                      item
                        Column = 2
                        Control = ed_v2_desconto_item_modal
                        Row = 1
                      end
                      item
                        Column = 0
                        Control = Panel118
                        Row = 2
                      end
                      item
                        Column = 2
                        Control = Panel120
                        Row = 2
                      end
                      item
                        Column = 0
                        Control = ed_v2_desconto_item_perc
                        Row = 3
                      end
                      item
                        Column = 2
                        Control = ed_v2_desconto_item_val
                        Row = 3
                      end>
                    ParentColor = True
                    RowCollection = <
                      item
                        SizeStyle = ssAbsolute
                        Value = 21.000000000000000000
                      end
                      item
                        SizeStyle = ssAbsolute
                        Value = 27.000000000000000000
                      end
                      item
                        SizeStyle = ssAbsolute
                        Value = 21.000000000000000000
                      end
                      item
                        SizeStyle = ssAbsolute
                        Value = 21.000000000000000000
                      end
                      item
                        SizeStyle = ssAbsolute
                        Value = 12.000000000000000000
                      end
                      item
                        SizeStyle = ssAbsolute
                        Value = 28.000000000000000000
                      end>
                    TabOrder = 0
                    object Panel111: TPanel
                      Left = 6
                      Top = 6
                      Width = 368
                      Height = 21
                      Align = alTop
                      Alignment = taLeftJustify
                      BevelOuter = bvNone
                      Caption = 'Aplicar desconto'
                      Enabled = False
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -12
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentColor = True
                      ParentFont = False
                      TabOrder = 5
                    end
                    object bt_v2_desconto_item_salvar: TBitBtn
                      Left = 274
                      Top = 108
                      Width = 100
                      Height = 28
                      Align = alRight
                      Caption = 'Salvar'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -13
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 3
                      OnClick = bt_v2_desconto_item_salvarClick
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
                    object bt_v2_desconto_item_cancela: TBitBtn
                      Left = 384
                      Top = 108
                      Width = 100
                      Height = 28
                      Align = alLeft
                      Caption = 'Cancela'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -13
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 4
                      OnClick = bt_v2_desconto_item_cancelaClick
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
                    end
                    object Label104: TLabel
                      Left = 6
                      Top = 27
                      Width = 368
                      Height = 27
                      Align = alClient
                      Alignment = taRightJustify
                      Caption = '1 - Pr'#243'ximo item; 2: NFC-e atual; 3 - Todas NFC-e'#39's seguintes'
                      WordWrap = True
                      ExplicitLeft = 79
                      ExplicitWidth = 295
                      ExplicitHeight = 13
                    end
                    object Panel82: TPanel
                      Left = 384
                      Top = 6
                      Width = 369
                      Height = 21
                      Align = alTop
                      Alignment = taLeftJustify
                      BevelOuter = bvNone
                      Caption = 'Op'#231#227'o'
                      Enabled = False
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -12
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentColor = True
                      ParentFont = False
                      TabOrder = 6
                    end
                    object ed_v2_desconto_item_modal: TEdit
                      Left = 384
                      Top = 27
                      Width = 369
                      Height = 19
                      Align = alTop
                      TabOrder = 0
                      Text = 'ed_v2_desconto_item_modal'
                      OnKeyPress = ed_v2_desconto_item_modalKeyPress
                    end
                    object Panel118: TPanel
                      Left = 6
                      Top = 54
                      Width = 368
                      Height = 21
                      Align = alTop
                      Alignment = taLeftJustify
                      BevelOuter = bvNone
                      Caption = 'Desconto %'
                      Enabled = False
                      ParentColor = True
                      TabOrder = 7
                    end
                    object Panel120: TPanel
                      Left = 384
                      Top = 54
                      Width = 369
                      Height = 21
                      Align = alTop
                      Alignment = taLeftJustify
                      BevelOuter = bvNone
                      Caption = 'Desconto R$'
                      Enabled = False
                      ParentColor = True
                      TabOrder = 8
                    end
                    object ed_v2_desconto_item_perc: TEditHw
                      Left = 6
                      Top = 75
                      Width = 368
                      Height = 19
                      Align = alTop
                      TabOrder = 1
                      Text = '0,000000'
                      OnExit = ed_v2_desconto_item_percExit
                      Formato = fNumber
                      FormatSize = '0.6'
                    end
                    object ed_v2_desconto_item_val: TEditHw
                      Left = 384
                      Top = 75
                      Width = 369
                      Height = 19
                      Align = alTop
                      TabOrder = 2
                      Text = '0,00'
                      OnExit = ed_v2_desconto_item_valExit
                      Formato = fNumber
                      FormatSize = '0.2'
                    end
                  end
                end
              end
            end
            object ts_v2_cons_cliente: TTabSheet
              Caption = 'ts_v2_cons_cliente'
              ImageIndex = 7
              object pn_v2_cons_cliente: TPanel
                Left = 0
                Top = 0
                Width = 779
                Height = 495
                Align = alClient
                BevelKind = bkTile
                BevelOuter = bvNone
                BorderWidth = 6
                Color = clWhite
                Ctl3D = False
                ParentBackground = False
                ParentCtl3D = False
                TabOrder = 0
                object ScrollBox8: TScrollBox
                  Left = 6
                  Top = 6
                  Width = 763
                  Height = 479
                  Align = alClient
                  BevelInner = bvNone
                  BevelOuter = bvNone
                  BorderStyle = bsNone
                  TabOrder = 0
                  object GridPanel9: TGridPanel
                    Left = 0
                    Top = 0
                    Width = 763
                    Height = 135
                    Align = alTop
                    BevelKind = bkTile
                    BevelOuter = bvNone
                    BorderWidth = 6
                    ColumnCollection = <
                      item
                        Value = 50.000000000000000000
                      end
                      item
                        SizeStyle = ssAbsolute
                        Value = 10.000000000000000000
                      end
                      item
                        Value = 50.000000000000000000
                      end>
                    ControlCollection = <
                      item
                        Column = 0
                        Control = bt_v2_cons_cliente_consultar
                        Row = 4
                      end
                      item
                        Column = 2
                        Control = bt_v2_cons_cliente_cancela
                        Row = 4
                      end
                      item
                        Column = 0
                        Control = Label105
                        Row = 0
                      end
                      item
                        Column = 2
                        Control = ed_v2_cons_cliente_opcao
                        Row = 0
                      end
                      item
                        Column = 0
                        Control = Panel88
                        Row = 1
                      end
                      item
                        Column = 0
                        ColumnSpan = 3
                        Control = ed_v2_cons_cliente_texto_consulta
                        Row = 2
                      end
                      item
                        Column = 2
                        Control = Panel95
                        Row = 1
                      end>
                    ParentColor = True
                    RowCollection = <
                      item
                        SizeStyle = ssAbsolute
                        Value = 27.000000000000000000
                      end
                      item
                        SizeStyle = ssAbsolute
                        Value = 35.000000000000000000
                      end
                      item
                        SizeStyle = ssAbsolute
                        Value = 21.000000000000000000
                      end
                      item
                        SizeStyle = ssAbsolute
                        Value = 6.000000000000000000
                      end
                      item
                        SizeStyle = ssAbsolute
                        Value = 28.000000000000000000
                      end>
                    TabOrder = 0
                    object bt_v2_cons_cliente_consultar: TBitBtn
                      Left = 254
                      Top = 95
                      Width = 120
                      Height = 28
                      Align = alRight
                      Caption = 'Consultar'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -13
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 2
                      OnClick = bt_v2_cons_cliente_consultarClick
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
                    object bt_v2_cons_cliente_cancela: TBitBtn
                      Left = 384
                      Top = 95
                      Width = 120
                      Height = 28
                      Align = alLeft
                      Caption = 'Cancela'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -13
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 3
                      OnClick = bt_v2_cons_cliente_cancelaClick
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
                    end
                    object Label105: TLabel
                      Left = 6
                      Top = 6
                      Width = 368
                      Height = 27
                      Align = alClient
                      Alignment = taRightJustify
                      Caption = 'Consulta (1 - Nome; 2 - Raz'#227'o Social; 3 - CPF/CNPJ; 4 - Avulso)'
                      WordWrap = True
                      ExplicitLeft = 69
                      ExplicitWidth = 305
                      ExplicitHeight = 13
                    end
                    object ed_v2_cons_cliente_opcao: TEdit
                      Left = 384
                      Top = 14
                      Width = 369
                      Height = 19
                      Align = alBottom
                      TabOrder = 0
                      Text = '1 - Nome'
                      OnKeyPress = ed_v2_cons_cliente_opcaoKeyPress
                    end
                    object Panel88: TPanel
                      Left = 6
                      Top = 33
                      Width = 368
                      Height = 27
                      Align = alTop
                      Alignment = taLeftJustify
                      BevelOuter = bvNone
                      Caption = 'Digite o valor para consultar'
                      Enabled = False
                      ParentColor = True
                      TabOrder = 4
                      VerticalAlignment = taAlignBottom
                    end
                    object ed_v2_cons_cliente_texto_consulta: TMaskEdit
                      Left = 6
                      Top = 70
                      Width = 747
                      Height = 19
                      Align = alBottom
                      CharCase = ecUpperCase
                      TabOrder = 1
                    end
                    object Panel95: TPanel
                      Left = 384
                      Top = 33
                      Width = 369
                      Height = 35
                      Align = alClient
                      BevelOuter = bvNone
                      Enabled = False
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clRed
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentColor = True
                      ParentFont = False
                      TabOrder = 5
                      object lb_v2_cons_cliente_nao_encontrado: TLabel
                        Left = 0
                        Top = 0
                        Width = 369
                        Height = 35
                        Align = alClient
                        Alignment = taCenter
                        Caption = 'NENHUM CLIENTE ENCONTRADO'
                        Layout = tlCenter
                        Visible = False
                        WordWrap = True
                        ExplicitWidth = 170
                        ExplicitHeight = 13
                      end
                    end
                  end
                end
              end
            end
            object ts_v2_cons_cliente_selecionar: TTabSheet
              Caption = 'ts_v2_cons_cliente_selecionar'
              ImageIndex = 8
              object pn_v2_cons_cliente_selecionar: TPanel
                Left = 0
                Top = 0
                Width = 779
                Height = 495
                Align = alClient
                BevelKind = bkTile
                BevelOuter = bvNone
                BorderWidth = 5
                Color = clWhite
                Ctl3D = False
                ParentCtl3D = False
                TabOrder = 0
                object Panel92: TPanel
                  Left = 5
                  Top = 5
                  Width = 765
                  Height = 21
                  Align = alTop
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  Caption = '[Enter: Selecionar] [ESC: Cancelar]'
                  ParentColor = True
                  TabOrder = 0
                end
                object Panel93: TPanel
                  Left = 5
                  Top = 26
                  Width = 765
                  Height = 460
                  Align = alClient
                  BevelOuter = bvNone
                  Padding.Top = 5
                  Padding.Bottom = 3
                  ParentColor = True
                  TabOrder = 1
                  object grid_v2_cons_cliente_selecionar: TDBGrid
                    Left = 0
                    Top = 5
                    Width = 765
                    Height = 452
                    Align = alClient
                    Color = clWhite
                    FixedColor = clWhite
                    Options = [dgTitles, dgIndicator, dgColumnResize, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                    TabOrder = 0
                    TitleFont.Charset = DEFAULT_CHARSET
                    TitleFont.Color = clWindowText
                    TitleFont.Height = -11
                    TitleFont.Name = 'Tahoma'
                    TitleFont.Style = []
                    OnDblClick = grid_v2_cons_cliente_selecionarDblClick
                    OnKeyDown = grid_v2_cons_cliente_selecionarKeyDown
                  end
                end
              end
            end
            object ts_v2_cliente_avulso: TTabSheet
              Caption = 'ts_v2_cliente_avulso'
              ImageIndex = 9
              object pn_v2_cliente_avulso: TPanel
                Left = 0
                Top = 0
                Width = 779
                Height = 495
                Align = alClient
                BevelKind = bkTile
                BevelOuter = bvNone
                BorderWidth = 6
                Color = clWhite
                Ctl3D = False
                ParentCtl3D = False
                TabOrder = 0
                object ScrollBox9: TScrollBox
                  Left = 6
                  Top = 6
                  Width = 763
                  Height = 479
                  Align = alClient
                  BevelInner = bvNone
                  BevelOuter = bvNone
                  BorderStyle = bsNone
                  TabOrder = 0
                  object GridPanel10: TGridPanel
                    Left = 0
                    Top = 0
                    Width = 763
                    Height = 265
                    Align = alTop
                    BevelOuter = bvNone
                    BorderWidth = 6
                    BorderStyle = bsSingle
                    ColumnCollection = <
                      item
                        Value = 25.000000000000000000
                      end
                      item
                        SizeStyle = ssAbsolute
                        Value = 12.000000000000000000
                      end
                      item
                        Value = 25.000000000000000000
                      end
                      item
                        SizeStyle = ssAbsolute
                        Value = 12.000000000000000000
                      end
                      item
                        Value = 25.000000000000000000
                      end
                      item
                        SizeStyle = ssAbsolute
                        Value = 12.000000000000000000
                      end
                      item
                        Value = 25.000000000000000000
                      end>
                    ControlCollection = <
                      item
                        Column = 0
                        Control = Label106
                        Row = 0
                      end
                      item
                        Column = 0
                        Control = ed_v2_cliente_avulso_cpf
                        Row = 1
                      end
                      item
                        Column = 2
                        ColumnSpan = 5
                        Control = Label107
                        Row = 0
                      end
                      item
                        Column = 2
                        ColumnSpan = 5
                        Control = ed_v2_cliente_avulso_nome
                        Row = 1
                      end
                      item
                        Column = 4
                        ColumnSpan = 3
                        Control = Label108
                        Row = 8
                      end
                      item
                        Column = 4
                        ColumnSpan = 3
                        Control = ed_v2_cliente_avulso_email
                        Row = 9
                      end
                      item
                        Column = 2
                        Control = Label109
                        Row = 2
                      end
                      item
                        Column = 0
                        Control = Label110
                        Row = 4
                      end
                      item
                        Column = 2
                        Control = Label111
                        Row = 4
                      end
                      item
                        Column = 2
                        ColumnSpan = 5
                        Control = ed_v2_cliente_avulso_logr
                        Row = 3
                      end
                      item
                        Column = 0
                        Control = ed_v2_cliente_avulso_num
                        Row = 5
                      end
                      item
                        Column = 4
                        Control = Label112
                        Row = 4
                      end
                      item
                        Column = 0
                        ColumnSpan = 7
                        Control = Label113
                        Row = 6
                      end
                      item
                        Column = 4
                        ColumnSpan = 3
                        Control = ed_v2_cliente_avulso_bairro
                        Row = 5
                      end
                      item
                        Column = 0
                        Control = Label114
                        Row = 8
                      end
                      item
                        Column = 0
                        Control = Label115
                        Row = 2
                      end
                      item
                        Column = 2
                        Control = Label116
                        Row = 8
                      end
                      item
                        Column = 0
                        Control = ed_v2_cliente_avulso_uf
                        Row = 9
                      end
                      item
                        Column = 2
                        Control = ed_v2_cliente_avulso_fone
                        Row = 9
                      end
                      item
                        Column = 0
                        Control = ed_v2_cliente_avulso_cep
                        Row = 3
                      end
                      item
                        Column = 2
                        Control = ed_v2_cliente_avulso_complemento
                        Row = 5
                      end
                      item
                        Column = 2
                        Control = bt_v2_cliente_avulso_salvar
                        Row = 11
                      end
                      item
                        Column = 4
                        Control = bt_v2_cliente_avulso_cancela
                        Row = 11
                      end
                      item
                        Column = 0
                        ColumnSpan = 7
                        Control = ed_v2_cliente_avulso_cidade
                        Row = 7
                      end>
                    ParentColor = True
                    RowCollection = <
                      item
                        SizeStyle = ssAbsolute
                        Value = 21.000000000000000000
                      end
                      item
                        SizeStyle = ssAbsolute
                        Value = 21.000000000000000000
                      end
                      item
                        SizeStyle = ssAbsolute
                        Value = 21.000000000000000000
                      end
                      item
                        SizeStyle = ssAbsolute
                        Value = 21.000000000000000000
                      end
                      item
                        SizeStyle = ssAbsolute
                        Value = 21.000000000000000000
                      end
                      item
                        SizeStyle = ssAbsolute
                        Value = 21.000000000000000000
                      end
                      item
                        SizeStyle = ssAbsolute
                        Value = 21.000000000000000000
                      end
                      item
                        SizeStyle = ssAbsolute
                        Value = 21.000000000000000000
                      end
                      item
                        SizeStyle = ssAbsolute
                        Value = 21.000000000000000000
                      end
                      item
                        SizeStyle = ssAbsolute
                        Value = 21.000000000000000000
                      end
                      item
                        SizeStyle = ssAbsolute
                        Value = 6.000000000000000000
                      end
                      item
                        SizeStyle = ssAbsolute
                        Value = 28.000000000000000000
                      end>
                    TabOrder = 0
                    object Label106: TLabel
                      Left = 6
                      Top = 6
                      Width = 178
                      Height = 21
                      Align = alClient
                      Caption = 'CPF/CNPJ'
                      Layout = tlCenter
                      ExplicitWidth = 48
                      ExplicitHeight = 13
                    end
                    object ed_v2_cliente_avulso_cpf: TMaskEdit
                      Left = 6
                      Top = 27
                      Width = 178
                      Height = 19
                      Align = alTop
                      CharCase = ecUpperCase
                      MaxLength = 14
                      TabOrder = 0
                    end
                    object Label107: TLabel
                      Left = 196
                      Top = 6
                      Width = 559
                      Height = 21
                      Align = alClient
                      Caption = 'Nome'
                      Layout = tlCenter
                      ExplicitWidth = 27
                      ExplicitHeight = 13
                    end
                    object ed_v2_cliente_avulso_nome: TMaskEdit
                      Left = 196
                      Top = 27
                      Width = 559
                      Height = 19
                      Align = alTop
                      CharCase = ecUpperCase
                      MaxLength = 60
                      TabOrder = 1
                    end
                    object Label108: TLabel
                      Left = 386
                      Top = 174
                      Width = 369
                      Height = 21
                      Align = alClient
                      Caption = 'email'
                      Layout = tlCenter
                      ExplicitWidth = 24
                      ExplicitHeight = 13
                    end
                    object ed_v2_cliente_avulso_email: TMaskEdit
                      Left = 386
                      Top = 195
                      Width = 369
                      Height = 19
                      Align = alTop
                      CharCase = ecUpperCase
                      MaxLength = 256
                      TabOrder = 10
                    end
                    object Label109: TLabel
                      Left = 196
                      Top = 48
                      Width = 178
                      Height = 21
                      Align = alClient
                      Caption = 'Logradouro'
                      Layout = tlCenter
                      ExplicitWidth = 55
                      ExplicitHeight = 13
                    end
                    object Label110: TLabel
                      Left = 6
                      Top = 90
                      Width = 178
                      Height = 21
                      Align = alClient
                      Caption = 'Numero'
                      Layout = tlCenter
                      ExplicitWidth = 37
                      ExplicitHeight = 13
                    end
                    object Label111: TLabel
                      Left = 196
                      Top = 90
                      Width = 178
                      Height = 21
                      Align = alClient
                      Caption = 'Complemento'
                      Layout = tlCenter
                      ExplicitWidth = 65
                      ExplicitHeight = 13
                    end
                    object ed_v2_cliente_avulso_logr: TMaskEdit
                      Left = 196
                      Top = 69
                      Width = 559
                      Height = 19
                      Align = alTop
                      CharCase = ecUpperCase
                      MaxLength = 60
                      TabOrder = 3
                    end
                    object ed_v2_cliente_avulso_num: TMaskEdit
                      Left = 6
                      Top = 111
                      Width = 178
                      Height = 19
                      Align = alTop
                      CharCase = ecUpperCase
                      MaxLength = 60
                      TabOrder = 4
                    end
                    object Label112: TLabel
                      Left = 386
                      Top = 90
                      Width = 178
                      Height = 21
                      Align = alClient
                      Caption = 'Bairro'
                      Layout = tlCenter
                      ExplicitWidth = 28
                      ExplicitHeight = 13
                    end
                    object Label113: TLabel
                      Left = 6
                      Top = 132
                      Width = 749
                      Height = 21
                      Align = alClient
                      Caption = 'Cidade'
                      Layout = tlCenter
                      ExplicitWidth = 33
                      ExplicitHeight = 13
                    end
                    object ed_v2_cliente_avulso_bairro: TMaskEdit
                      Left = 386
                      Top = 111
                      Width = 369
                      Height = 19
                      Align = alTop
                      CharCase = ecUpperCase
                      MaxLength = 60
                      TabOrder = 6
                    end
                    object Label114: TLabel
                      Left = 6
                      Top = 174
                      Width = 178
                      Height = 21
                      Align = alClient
                      Caption = 'UF'
                      Layout = tlCenter
                      ExplicitWidth = 13
                      ExplicitHeight = 13
                    end
                    object Label115: TLabel
                      Left = 6
                      Top = 48
                      Width = 178
                      Height = 21
                      Align = alClient
                      Caption = 'CEP'
                      Layout = tlCenter
                      ExplicitWidth = 19
                      ExplicitHeight = 13
                    end
                    object Label116: TLabel
                      Left = 196
                      Top = 174
                      Width = 178
                      Height = 21
                      Align = alClient
                      Caption = 'Fone'
                      Layout = tlCenter
                      ExplicitWidth = 24
                      ExplicitHeight = 13
                    end
                    object ed_v2_cliente_avulso_uf: TMaskEdit
                      Left = 6
                      Top = 195
                      Width = 178
                      Height = 19
                      Align = alTop
                      CharCase = ecUpperCase
                      MaxLength = 2
                      TabOrder = 8
                    end
                    object ed_v2_cliente_avulso_fone: TMaskEdit
                      Left = 196
                      Top = 195
                      Width = 178
                      Height = 19
                      Align = alTop
                      CharCase = ecUpperCase
                      MaxLength = 14
                      TabOrder = 9
                    end
                    object ed_v2_cliente_avulso_cep: TMaskEdit
                      Left = 6
                      Top = 69
                      Width = 178
                      Height = 19
                      Align = alTop
                      CharCase = ecUpperCase
                      EditMask = '99999\-999;0;_'
                      MaxLength = 9
                      TabOrder = 2
                      OnEnter = ed_v2_cliente_avulso_cepEnter
                      OnExit = ed_v2_cliente_avulso_cepExit
                    end
                    object ed_v2_cliente_avulso_complemento: TMaskEdit
                      Left = 196
                      Top = 111
                      Width = 178
                      Height = 19
                      Align = alTop
                      CharCase = ecUpperCase
                      MaxLength = 60
                      TabOrder = 5
                    end
                    object bt_v2_cliente_avulso_salvar: TBitBtn
                      Left = 274
                      Top = 222
                      Width = 100
                      Height = 28
                      Align = alRight
                      Caption = 'Salvar'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -13
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 11
                      OnClick = bt_v2_cliente_avulso_salvarClick
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
                    object bt_v2_cliente_avulso_cancela: TBitBtn
                      Left = 386
                      Top = 222
                      Width = 100
                      Height = 28
                      Align = alLeft
                      Caption = 'Cancela'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -13
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 12
                      OnClick = bt_v2_cliente_avulso_cancelaClick
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
                    end
                    object ed_v2_cliente_avulso_cidade: TDBLookupComboBox
                      Left = 6
                      Top = 153
                      Width = 749
                      Height = 19
                      Align = alTop
                      DropDownAlign = daRight
                      DropDownWidth = 400
                      TabOrder = 7
                      OnExit = ed_v2_cliente_avulso_cidadeExit
                    end
                  end
                end
              end
            end
            object ts_v2_valores: TTabSheet
              Caption = 'ts_v2_valores'
              ImageIndex = 10
              object pn_v2_valores: TPanel
                Left = 0
                Top = 0
                Width = 779
                Height = 495
                Align = alClient
                BevelKind = bkTile
                BevelOuter = bvNone
                BorderWidth = 6
                Color = clWhite
                Ctl3D = False
                ParentBackground = False
                ParentCtl3D = False
                TabOrder = 0
                object ScrollBox10: TScrollBox
                  Left = 6
                  Top = 6
                  Width = 763
                  Height = 479
                  Align = alClient
                  BevelInner = bvNone
                  BevelOuter = bvNone
                  BorderStyle = bsNone
                  TabOrder = 0
                  object GridPanel12: TGridPanel
                    Left = 0
                    Top = 0
                    Width = 763
                    Height = 174
                    Align = alTop
                    BevelOuter = bvNone
                    BorderWidth = 6
                    BorderStyle = bsSingle
                    ColumnCollection = <
                      item
                        Value = 50.000000000000000000
                      end
                      item
                        SizeStyle = ssAbsolute
                        Value = 12.000000000000000000
                      end
                      item
                        Value = 50.000000000000000000
                      end>
                    ControlCollection = <
                      item
                        Column = 0
                        Control = Label117
                        Row = 0
                      end
                      item
                        Column = 2
                        Control = ed_v2_valores_vprod
                        Row = 0
                      end
                      item
                        Column = 0
                        Control = Label119
                        Row = 2
                      end
                      item
                        Column = 2
                        Control = ed_v2_valores_vdesc
                        Row = 2
                      end
                      item
                        Column = 0
                        Control = Label122
                        Row = 3
                      end
                      item
                        Column = 2
                        Control = ed_v2_valores_vseg
                        Row = 3
                      end
                      item
                        Column = 0
                        Control = Label123
                        Row = 4
                      end
                      item
                        Column = 2
                        Control = ed_v2_valores_voutro
                        Row = 4
                      end
                      item
                        Column = 0
                        Control = Label124
                        Row = 5
                      end
                      item
                        Column = 0
                        Control = bt_v2_valores_salvar
                        Row = 7
                      end
                      item
                        Column = 2
                        Control = bt_v2_valores_cancela
                        Row = 7
                      end
                      item
                        Column = 0
                        Control = Label120
                        Row = 1
                      end
                      item
                        Column = 2
                        Control = ed_v2_valores_tipodesc
                        Row = 1
                      end
                      item
                        Column = 2
                        Control = Panel91
                        Row = 5
                      end>
                    ParentColor = True
                    RowCollection = <
                      item
                        SizeStyle = ssAbsolute
                        Value = 21.000000000000000000
                      end
                      item
                        SizeStyle = ssAbsolute
                        Value = 21.000000000000000000
                      end
                      item
                        SizeStyle = ssAbsolute
                        Value = 21.000000000000000000
                      end
                      item
                        SizeStyle = ssAbsolute
                        Value = 21.000000000000000000
                      end
                      item
                        SizeStyle = ssAbsolute
                        Value = 21.000000000000000000
                      end
                      item
                        SizeStyle = ssAbsolute
                        Value = 21.000000000000000000
                      end
                      item
                        SizeStyle = ssAbsolute
                        Value = 6.000000000000000000
                      end
                      item
                        SizeStyle = ssAbsolute
                        Value = 28.000000000000000000
                      end>
                    TabOrder = 0
                    object Label117: TLabel
                      Left = 6
                      Top = 6
                      Width = 368
                      Height = 21
                      Align = alClient
                      Alignment = taRightJustify
                      Caption = 'Valor dos Produtos'
                      Layout = tlCenter
                      ExplicitLeft = 284
                      ExplicitWidth = 90
                      ExplicitHeight = 13
                    end
                    object ed_v2_valores_vprod: TEditHw
                      Left = 386
                      Top = 6
                      Width = 369
                      Height = 19
                      Align = alTop
                      Enabled = False
                      TabOrder = 0
                      Text = '0,00'
                      OnExit = ed_v2_alt_item_vl_unExit
                      Formato = fNumber
                      FormatSize = '0.2'
                    end
                    object Label119: TLabel
                      Left = 6
                      Top = 48
                      Width = 368
                      Height = 21
                      Align = alClient
                      Alignment = taRightJustify
                      Caption = 'Desconto'
                      Layout = tlCenter
                      ExplicitLeft = 329
                      ExplicitWidth = 45
                      ExplicitHeight = 13
                    end
                    object ed_v2_valores_vdesc: TEditHw
                      Left = 386
                      Top = 48
                      Width = 369
                      Height = 19
                      Align = alTop
                      TabOrder = 2
                      Text = '0,00'
                      OnExit = ed_v2_valores_vdescExit
                      Formato = fNumber
                      FormatSize = '0.2'
                    end
                    object Label122: TLabel
                      Left = 6
                      Top = 69
                      Width = 368
                      Height = 21
                      Align = alClient
                      Alignment = taRightJustify
                      Caption = 'Seguro'
                      Layout = tlCenter
                      ExplicitLeft = 340
                      ExplicitWidth = 34
                      ExplicitHeight = 13
                    end
                    object ed_v2_valores_vseg: TEditHw
                      Left = 386
                      Top = 69
                      Width = 369
                      Height = 19
                      Align = alTop
                      TabOrder = 3
                      Text = '0,00'
                      OnExit = ed_v2_valores_vsegExit
                      Formato = fNumber
                      FormatSize = '0.2'
                    end
                    object Label123: TLabel
                      Left = 6
                      Top = 90
                      Width = 368
                      Height = 21
                      Align = alClient
                      Alignment = taRightJustify
                      Caption = 'Outros'
                      Layout = tlCenter
                      ExplicitLeft = 341
                      ExplicitWidth = 33
                      ExplicitHeight = 13
                    end
                    object ed_v2_valores_voutro: TEditHw
                      Left = 386
                      Top = 90
                      Width = 369
                      Height = 19
                      Align = alTop
                      TabOrder = 4
                      Text = '0,00'
                      OnExit = ed_v2_valores_voutroExit
                      Formato = fNumber
                      FormatSize = '0.2'
                    end
                    object Label124: TLabel
                      Left = 6
                      Top = 111
                      Width = 368
                      Height = 21
                      Align = alClient
                      Alignment = taRightJustify
                      Caption = 'Valor Total NF'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                      Layout = tlCenter
                      ExplicitLeft = 297
                      ExplicitWidth = 77
                      ExplicitHeight = 13
                    end
                    object bt_v2_valores_salvar: TBitBtn
                      Left = 274
                      Top = 138
                      Width = 100
                      Height = 28
                      Align = alRight
                      Caption = 'Salvar'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -13
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 5
                      OnClick = bt_v2_valores_salvarClick
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
                    object bt_v2_valores_cancela: TBitBtn
                      Left = 386
                      Top = 138
                      Width = 100
                      Height = 28
                      Align = alLeft
                      Caption = 'Cancela'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -13
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 6
                      OnClick = bt_v2_valores_cancelaClick
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
                    end
                    object Label120: TLabel
                      Left = 6
                      Top = 27
                      Width = 368
                      Height = 21
                      Align = alClient
                      Alignment = taRightJustify
                      Caption = 'Tipo de desconto (1 - Por item; 2: No Total)'
                      Layout = tlCenter
                      ExplicitLeft = 166
                      ExplicitWidth = 208
                      ExplicitHeight = 13
                    end
                    object ed_v2_valores_tipodesc: TMaskEdit
                      Left = 386
                      Top = 27
                      Width = 369
                      Height = 19
                      Align = alTop
                      TabOrder = 1
                      Text = 'ed_v2_valores_tipodesc'
                      OnKeyPress = ed_v2_valores_tipodescKeyPress
                    end
                    object Panel91: TPanel
                      Left = 386
                      Top = 111
                      Width = 369
                      Height = 21
                      Align = alClient
                      BevelOuter = bvNone
                      Enabled = False
                      ParentColor = True
                      TabOrder = 7
                      object ed_v2_valores_vnf: TEditHw
                        Left = 0
                        Top = 0
                        Width = 369
                        Height = 20
                        Align = alTop
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clBlue
                        Font.Height = -12
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                        TabOrder = 0
                        Text = '0,00'
                        OnExit = ed_v2_alt_item_vl_unExit
                        Formato = fNumber
                        FormatSize = '0.2'
                      end
                    end
                  end
                end
              end
            end
            object ts_v2_pag: TTabSheet
              Caption = 'ts_v2_pag'
              ImageIndex = 11
              object pn_v2_pag: TPanel
                Left = 0
                Top = 0
                Width = 779
                Height = 495
                Align = alClient
                BevelKind = bkTile
                BevelOuter = bvNone
                BorderWidth = 5
                Color = clWhite
                Ctl3D = False
                ParentBackground = False
                ParentCtl3D = False
                TabOrder = 0
                object pn_v2_pag_title: TPanel
                  Left = 5
                  Top = 5
                  Width = 765
                  Height = 21
                  Align = alTop
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  Caption = '  [Enter: Selecionar] [ESC: Cancelar]'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -12
                  Font.Name = 'Verdana'
                  Font.Style = []
                  ParentColor = True
                  ParentFont = False
                  TabOrder = 0
                end
                object GridPanel13: TGridPanel
                  Left = 5
                  Top = 463
                  Width = 765
                  Height = 23
                  Align = alBottom
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  ColumnCollection = <
                    item
                      Value = 16.666666666666660000
                    end
                    item
                      Value = 16.666666666666660000
                    end
                    item
                      Value = 16.666666666666660000
                    end
                    item
                      Value = 16.666666666666660000
                    end
                    item
                      Value = 16.666666666666680000
                    end
                    item
                      Value = 16.666666666666680000
                    end>
                  ControlCollection = <
                    item
                      Column = 0
                      Control = Label126
                      Row = 0
                    end
                    item
                      Column = 1
                      Control = lb_v2_pag_vnf
                      Row = 0
                    end
                    item
                      Column = 2
                      Control = Label125
                      Row = 0
                    end
                    item
                      Column = 3
                      Control = lb_v2_pag_pgto
                      Row = 0
                    end
                    item
                      Column = 4
                      Control = lb_v2_pag_trocofalta
                      Row = 0
                    end
                    item
                      Column = 5
                      Control = lb_v2_pag_falta
                      Row = 0
                    end>
                  ParentColor = True
                  RowCollection = <
                    item
                      Value = 100.000000000000000000
                    end>
                  TabOrder = 1
                  object Label126: TLabel
                    Left = 0
                    Top = 0
                    Width = 126
                    Height = 19
                    Align = alClient
                    Alignment = taRightJustify
                    Caption = 'Total  '
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -15
                    Font.Name = 'Verdana'
                    Font.Style = []
                    ParentFont = False
                    Layout = tlCenter
                    ExplicitLeft = 81
                    ExplicitWidth = 45
                    ExplicitHeight = 18
                  end
                  object lb_v2_pag_vnf: TLabel
                    Left = 126
                    Top = 0
                    Width = 126
                    Height = 19
                    Align = alClient
                    Caption = 'lb_v2_pag_vnf'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -16
                    Font.Name = 'Verdana'
                    Font.Style = [fsBold]
                    ParentFont = False
                    Layout = tlCenter
                    ExplicitWidth = 130
                    ExplicitHeight = 18
                  end
                  object Label125: TLabel
                    Left = 252
                    Top = 0
                    Width = 126
                    Height = 19
                    Align = alClient
                    Alignment = taRightJustify
                    Caption = 'Pagamento  '
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Verdana'
                    Font.Style = []
                    ParentFont = False
                    Layout = tlCenter
                    ExplicitLeft = 306
                    ExplicitWidth = 72
                    ExplicitHeight = 13
                  end
                  object lb_v2_pag_pgto: TLabel
                    Left = 378
                    Top = 0
                    Width = 126
                    Height = 19
                    Align = alClient
                    Caption = 'lb_v2_pag_pgto'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlue
                    Font.Height = -13
                    Font.Name = 'Verdana'
                    Font.Style = [fsBold]
                    ParentFont = False
                    Layout = tlCenter
                    ExplicitWidth = 118
                    ExplicitHeight = 16
                  end
                  object lb_v2_pag_trocofalta: TLabel
                    Left = 504
                    Top = 0
                    Width = 126
                    Height = 19
                    Align = alClient
                    Alignment = taRightJustify
                    Caption = 'Falta  '
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -15
                    Font.Name = 'Verdana'
                    Font.Style = []
                    ParentFont = False
                    Layout = tlCenter
                    ExplicitLeft = 585
                    ExplicitWidth = 45
                    ExplicitHeight = 18
                  end
                  object lb_v2_pag_falta: TLabel
                    Left = 630
                    Top = 0
                    Width = 131
                    Height = 19
                    Align = alClient
                    Caption = 'Label126'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clMaroon
                    Font.Height = -16
                    Font.Name = 'Verdana'
                    Font.Style = [fsBold]
                    ParentFont = False
                    Layout = tlCenter
                    ExplicitWidth = 80
                    ExplicitHeight = 18
                  end
                end
                object Panel101: TPanel
                  Left = 5
                  Top = 26
                  Width = 765
                  Height = 437
                  Align = alClient
                  BevelOuter = bvNone
                  Padding.Top = 4
                  Padding.Bottom = 4
                  ParentColor = True
                  TabOrder = 2
                  object grid_v2_pag_ctrl: TDBGrid
                    Left = 0
                    Top = 29
                    Width = 765
                    Height = 53
                    Align = alTop
                    Color = clWhite
                    DataSource = dtmNFConsumidor.dsCtrlFormPag
                    FixedColor = clWhite
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -13
                    Font.Name = 'Tahoma'
                    Font.Style = []
                    Options = [dgColumnResize, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                    ParentFont = False
                    TabOrder = 0
                    TitleFont.Charset = DEFAULT_CHARSET
                    TitleFont.Color = clWindowText
                    TitleFont.Height = -11
                    TitleFont.Name = 'Tahoma'
                    TitleFont.Style = []
                    OnEnter = grid_v2_pag_ctrlEnter
                    OnKeyDown = grid_v2_pag_ctrlKeyDown
                    OnKeyPress = grid_v2_pag_ctrlKeyPress
                    Columns = <
                      item
                        Expanded = False
                        FieldName = 'DISPLAYV2'
                        Visible = True
                      end>
                  end
                  object pn_v2_pag_valores: TGridPanel
                    Left = 0
                    Top = 82
                    Width = 765
                    Height = 175
                    Align = alTop
                    BevelKind = bkTile
                    BevelOuter = bvNone
                    BorderWidth = 6
                    ColumnCollection = <
                      item
                        Value = 50.000000000000000000
                      end
                      item
                        SizeStyle = ssAbsolute
                        Value = 10.000000000000000000
                      end
                      item
                        Value = 50.000000000000000000
                      end>
                    ControlCollection = <
                      item
                        Column = 0
                        Control = Label118
                        Row = 1
                      end
                      item
                        Column = 0
                        Control = lb_v2_pag_valores_indpag
                        Row = 0
                      end
                      item
                        Column = 0
                        Control = lb_v2_pag_valores_num_aut
                        Row = 2
                      end
                      item
                        Column = 0
                        Control = lb_v2_pag_valores_band
                        Row = 3
                      end
                      item
                        Column = 2
                        Control = ed_v2_pag_valores_valor
                        Row = 1
                      end
                      item
                        Column = 2
                        Control = ed_v2_pag_valores_indpag
                        Row = 0
                      end
                      item
                        Column = 2
                        Control = ed_v2_pag_valores_num_aut
                        Row = 2
                      end
                      item
                        Column = 2
                        Control = ed_v2_pag_valores_band
                        Row = 3
                      end>
                    ParentColor = True
                    RowCollection = <
                      item
                        SizeStyle = ssAbsolute
                        Value = 30.000000000000000000
                      end
                      item
                        SizeStyle = ssAbsolute
                        Value = 30.000000000000000000
                      end
                      item
                        SizeStyle = ssAbsolute
                        Value = 30.000000000000000000
                      end
                      item
                        SizeStyle = ssAbsolute
                        Value = 40.000000000000000000
                      end>
                    TabOrder = 1
                    object Label118: TLabel
                      Left = 6
                      Top = 36
                      Width = 369
                      Height = 30
                      Align = alClient
                      Alignment = taRightJustify
                      Caption = 'Valor'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -16
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                      Layout = tlCenter
                      ExplicitLeft = 332
                      ExplicitWidth = 43
                      ExplicitHeight = 19
                    end
                    object lb_v2_pag_valores_indpag: TLabel
                      Left = 6
                      Top = 6
                      Width = 369
                      Height = 30
                      Align = alClient
                      Alignment = taRightJustify
                      Caption = '1 - A vista, 2 - A prazo'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -16
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                      Layout = tlCenter
                      WordWrap = True
                      ExplicitLeft = 212
                      ExplicitWidth = 163
                      ExplicitHeight = 19
                    end
                    object lb_v2_pag_valores_num_aut: TLabel
                      Left = 6
                      Top = 66
                      Width = 369
                      Height = 30
                      Align = alClient
                      Alignment = taRightJustify
                      Caption = 'N'#250'mero Autoriza'#231#227'o'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -16
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                      Layout = tlCenter
                      WordWrap = True
                      ExplicitLeft = 230
                      ExplicitWidth = 145
                      ExplicitHeight = 19
                    end
                    object lb_v2_pag_valores_band: TLabel
                      Left = 6
                      Top = 96
                      Width = 369
                      Height = 40
                      Align = alClient
                      Alignment = taRightJustify
                      Caption = 
                        '1 - Visa, 2  - Master , 3 - American , 4 - Sorocred, 5 - Diners ' +
                        'Club, 6 - Elo, 7 - Hipercard, 8 - Aura,  9 - Outros'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                      WordWrap = True
                      ExplicitLeft = 8
                      ExplicitWidth = 367
                      ExplicitHeight = 26
                    end
                    object ed_v2_pag_valores_valor: TEditHw
                      Left = 385
                      Top = 36
                      Width = 370
                      Height = 25
                      Align = alTop
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -16
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                      TabOrder = 1
                      Text = '1,00'
                      OnKeyDown = ed_v2_pag_valores_valorKeyDown
                      Formato = fNumber
                      FormatSize = '0.2'
                      AsValue = 1.000000000000000000
                    end
                    object ed_v2_pag_valores_indpag: TMaskEdit
                      Left = 385
                      Top = 6
                      Width = 370
                      Height = 25
                      Align = alTop
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -16
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 0
                      Text = 'ed_v2_valores_tipodesc'
                      OnKeyDown = ed_v2_pag_valores_indpagKeyDown
                      OnKeyPress = ed_v2_pag_valores_indpagKeyPress
                    end
                    object ed_v2_pag_valores_num_aut: TMaskEdit
                      Left = 385
                      Top = 66
                      Width = 370
                      Height = 25
                      Align = alTop
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -16
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 2
                      Text = 'ed_v2_pag_valores_num_aut'
                      OnKeyDown = ed_v2_pag_valores_indpagKeyDown
                    end
                    object ed_v2_pag_valores_band: TMaskEdit
                      Left = 385
                      Top = 96
                      Width = 370
                      Height = 25
                      Align = alTop
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -16
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 3
                      Text = 'ed_v2_valores_tipodesc'
                      OnKeyDown = ed_v2_pag_valores_indpagKeyDown
                      OnKeyPress = ed_v2_pag_valores_bandKeyPress
                    end
                  end
                  object grid_v2_pag_pgtos: TDBGrid
                    Left = 0
                    Top = 257
                    Width = 765
                    Height = 96
                    Align = alTop
                    Color = clWhite
                    DataSource = dtmNFConsumidor.dsNFCe_Pag
                    FixedColor = clWhite
                    Options = [dgColumnResize, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
                    TabOrder = 2
                    TitleFont.Charset = DEFAULT_CHARSET
                    TitleFont.Color = clWindowText
                    TitleFont.Height = -11
                    TitleFont.Name = 'Tahoma'
                    TitleFont.Style = []
                    OnKeyDown = grid_v2_pag_pgtosKeyDown
                    Columns = <
                      item
                        Expanded = False
                        FieldName = 'NOME_CTRL'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'VPAG'
                        Visible = True
                      end>
                  end
                  object pn_v2_pag_concluido: TPanel
                    Left = 0
                    Top = 4
                    Width = 765
                    Height = 25
                    Align = alTop
                    BevelOuter = bvNone
                    Caption = '[F11: Finalizar]'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clMaroon
                    Font.Height = -13
                    Font.Name = 'Verdana'
                    Font.Style = []
                    ParentColor = True
                    ParentFont = False
                    TabOrder = 3
                  end
                end
              end
            end
            object ts_v2_contingencia: TTabSheet
              Caption = 'ts_v2_contingencia'
              ImageIndex = 12
              object pn_v2_contingencia: TPanel
                Left = 0
                Top = 0
                Width = 779
                Height = 495
                Align = alClient
                BevelKind = bkTile
                BevelOuter = bvNone
                BorderWidth = 6
                Color = clWhite
                Ctl3D = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentBackground = False
                ParentCtl3D = False
                ParentFont = False
                TabOrder = 0
                object ScrollBox11: TScrollBox
                  Left = 6
                  Top = 6
                  Width = 763
                  Height = 479
                  Align = alClient
                  BevelInner = bvNone
                  BevelOuter = bvNone
                  BorderStyle = bsNone
                  TabOrder = 0
                  object pn_v2_contingencia_: TPanel
                    Left = 0
                    Top = 0
                    Width = 763
                    Height = 185
                    Align = alTop
                    BevelKind = bkTile
                    BevelOuter = bvNone
                    ParentColor = True
                    TabOrder = 0
                    object gpn_v2_contingencia: TGridPanel
                      Left = 0
                      Top = 129
                      Width = 759
                      Height = 41
                      Align = alTop
                      BevelOuter = bvNone
                      BorderWidth = 6
                      ColumnCollection = <
                        item
                          Value = 50.000000000000000000
                        end
                        item
                          SizeStyle = ssAbsolute
                          Value = 10.000000000000000000
                        end
                        item
                          Value = 50.000000000000000000
                        end>
                      ControlCollection = <
                        item
                          Column = 0
                          Control = Label67
                          Row = 0
                        end
                        item
                          Column = 2
                          Control = ed_v2_contingencia
                          Row = 0
                        end>
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -13
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentColor = True
                      ParentFont = False
                      RowCollection = <
                        item
                          SizeStyle = ssAbsolute
                          Value = 30.000000000000000000
                        end>
                      TabOrder = 0
                      object Label67: TLabel
                        Left = 6
                        Top = 6
                        Width = 368
                        Height = 30
                        Align = alClient
                        Alignment = taRightJustify
                        Caption = '1: Sim  -  2:  N'#227'o -  Esc: Cancela'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clBlue
                        Font.Height = -13
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                        Layout = tlCenter
                        WordWrap = True
                        ExplicitLeft = 170
                        ExplicitWidth = 204
                        ExplicitHeight = 16
                      end
                      object ed_v2_contingencia: TMaskEdit
                        Left = 384
                        Top = 6
                        Width = 369
                        Height = 30
                        Align = alClient
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -16
                        Font.Name = 'Tahoma'
                        Font.Style = []
                        ParentFont = False
                        TabOrder = 0
                        Text = 'ed_v2_contingencia'
                        OnKeyPress = ed_v2_contingenciaKeyPress
                        ExplicitHeight = 25
                      end
                    end
                    object pn_v2_contingencia_msg: TPanel
                      Left = 0
                      Top = 0
                      Width = 759
                      Height = 129
                      Align = alTop
                      BevelOuter = bvNone
                      Enabled = False
                      ParentColor = True
                      TabOrder = 1
                      object ed_v2_contingencia_msg: TMemo
                        Left = 0
                        Top = 0
                        Width = 759
                        Height = 129
                        Align = alClient
                        BorderStyle = bsNone
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -19
                        Font.Name = 'Tahoma'
                        Font.Style = []
                        ParentFont = False
                        TabOrder = 0
                      end
                    end
                  end
                end
              end
            end
            object ts_v2_log_messages: TTabSheet
              Caption = 'ts_v2_log_messages'
              ImageIndex = 13
              object pn_v2_log_messages: TPanel
                Left = 0
                Top = 0
                Width = 779
                Height = 495
                Align = alClient
                BevelKind = bkTile
                BevelOuter = bvNone
                BorderWidth = 6
                Color = clWhite
                Ctl3D = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentBackground = False
                ParentCtl3D = False
                ParentFont = False
                TabOrder = 0
                object ed_v2_log_messages: TMemo
                  Left = 6
                  Top = 33
                  Width = 763
                  Height = 452
                  Align = alClient
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clNavy
                  Font.Height = -11
                  Font.Name = 'Courier New'
                  Font.Style = []
                  Lines.Strings = (
                    '')
                  ParentFont = False
                  ReadOnly = True
                  ScrollBars = ssVertical
                  TabOrder = 0
                end
                object Panel63: TPanel
                  Left = 6
                  Top = 6
                  Width = 763
                  Height = 27
                  Align = alTop
                  BevelOuter = bvNone
                  Caption = '[Esc: Cancela]'
                  Enabled = False
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentColor = True
                  ParentFont = False
                  TabOrder = 1
                end
              end
            end
            object ts_v2_log_rejeicoes: TTabSheet
              Caption = 'ts_v2_log_rejeicoes'
              ImageIndex = 14
              object pn_v2_log_rejeicoes: TPanel
                Left = 0
                Top = 0
                Width = 779
                Height = 495
                Align = alClient
                BevelKind = bkTile
                BevelOuter = bvNone
                BorderWidth = 6
                Color = clWhite
                Ctl3D = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentBackground = False
                ParentCtl3D = False
                ParentFont = False
                TabOrder = 0
                object ed_v2_log_rejeicoes: TMemo
                  Left = 6
                  Top = 33
                  Width = 763
                  Height = 452
                  Align = alClient
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clNavy
                  Font.Height = -11
                  Font.Name = 'Courier New'
                  Font.Style = []
                  Lines.Strings = (
                    '')
                  ParentFont = False
                  ReadOnly = True
                  ScrollBars = ssVertical
                  TabOrder = 0
                  OnChange = ed_v2_log_rejeicoesChange
                end
                object Panel65: TPanel
                  Left = 6
                  Top = 6
                  Width = 763
                  Height = 27
                  Align = alTop
                  BevelOuter = bvNone
                  Caption = '[Esc: Cancela]'
                  Enabled = False
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentColor = True
                  ParentFont = False
                  TabOrder = 1
                end
              end
            end
            object ts_v2_selecionar_orcamento: TTabSheet
              Caption = 'ts_v2_selecionar_orcamento'
              ImageIndex = 15
              object pn_v2_selecionar_orcamento: TPanel
                Left = 0
                Top = 0
                Width = 779
                Height = 495
                Align = alClient
                BevelKind = bkTile
                BevelOuter = bvNone
                BorderWidth = 6
                Color = clWhite
                Ctl3D = False
                ParentBackground = False
                ParentCtl3D = False
                TabOrder = 0
                object ScrollBox12: TScrollBox
                  Left = 6
                  Top = 6
                  Width = 763
                  Height = 479
                  Align = alClient
                  BevelInner = bvNone
                  BevelOuter = bvNone
                  BorderStyle = bsNone
                  TabOrder = 0
                  object GridPanel1: TGridPanel
                    Left = 0
                    Top = 24
                    Width = 763
                    Height = 71
                    Align = alTop
                    BevelKind = bkTile
                    BevelOuter = bvNone
                    BorderWidth = 6
                    ColumnCollection = <
                      item
                        Value = 50.000000000000000000
                      end
                      item
                        SizeStyle = ssAbsolute
                        Value = 10.000000000000000000
                      end
                      item
                        Value = 50.000000000000000000
                      end>
                    ControlCollection = <
                      item
                        Column = 0
                        Control = Label63
                        Row = 0
                      end
                      item
                        Column = 0
                        ColumnSpan = 3
                        Control = Panel99
                        Row = 1
                      end
                      item
                        Column = 0
                        Control = Panel102
                        Row = 2
                      end
                      item
                        Column = 2
                        Control = ed_v2_selecionar_orcamento_numero
                        Row = 0
                      end>
                    ParentColor = True
                    RowCollection = <
                      item
                        SizeStyle = ssAbsolute
                        Value = 27.000000000000000000
                      end
                      item
                        SizeStyle = ssAbsolute
                        Value = 35.000000000000000000
                      end
                      item
                        SizeStyle = ssAbsolute
                        Value = 21.000000000000000000
                      end>
                    TabOrder = 0
                    object Label63: TLabel
                      Left = 6
                      Top = 6
                      Width = 368
                      Height = 27
                      Align = alClient
                      Alignment = taRightJustify
                      Caption = 'Informe o n'#250'mero do or'#231'amento'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -12
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                      WordWrap = True
                      ExplicitLeft = 193
                      ExplicitWidth = 181
                      ExplicitHeight = 14
                    end
                    object Panel99: TPanel
                      Left = 6
                      Top = 33
                      Width = 747
                      Height = 27
                      Align = alTop
                      BevelOuter = bvNone
                      Caption = 'Para remover a sele'#231#227'o do or'#231'amento informe "0" e "Enter"'
                      Enabled = False
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clNavy
                      Font.Height = -12
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentColor = True
                      ParentFont = False
                      TabOrder = 0
                    end
                    object Panel102: TPanel
                      Left = 6
                      Top = 68
                      Width = 368
                      Height = 21
                      Align = alClient
                      BevelOuter = bvNone
                      Enabled = False
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clRed
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentColor = True
                      ParentFont = False
                      TabOrder = 1
                    end
                    object ed_v2_selecionar_orcamento_numero: TEditFiscal
                      Left = 384
                      Top = 6
                      Width = 369
                      Height = 19
                      Align = alTop
                      TabOrder = 2
                      Text = '0'
                      OnKeyDown = ed_v2_selecionar_orcamento_numeroKeyDown
                      OnKeyPress = ed_v2_selecionar_orcamento_numeroKeyPress
                    end
                  end
                  object Panel64: TPanel
                    Left = 0
                    Top = 0
                    Width = 763
                    Height = 24
                    Align = alTop
                    BevelOuter = bvNone
                    Caption = '  [Enter: Selecionar] [ESC: Voltar]'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -12
                    Font.Name = 'Verdana'
                    Font.Style = []
                    ParentColor = True
                    ParentFont = False
                    TabOrder = 1
                  end
                end
              end
            end
            object ts_v2_sangsup: TTabSheet
              Caption = 'ts_v2_sangsup'
              ImageIndex = 16
              object pn_v2_sangsup: TPanel
                Left = 0
                Top = 0
                Width = 779
                Height = 495
                Align = alClient
                BevelKind = bkTile
                BevelOuter = bvNone
                BorderWidth = 6
                Color = clWhite
                Ctl3D = False
                ParentBackground = False
                ParentCtl3D = False
                TabOrder = 0
                object ScrollBox13: TScrollBox
                  Left = 6
                  Top = 6
                  Width = 763
                  Height = 479
                  Align = alClient
                  BevelInner = bvNone
                  BevelOuter = bvNone
                  BorderStyle = bsNone
                  TabOrder = 0
                  object GridPanel5: TGridPanel
                    Left = 0
                    Top = 0
                    Width = 763
                    Height = 97
                    Align = alTop
                    BevelOuter = bvNone
                    BorderWidth = 6
                    BorderStyle = bsSingle
                    ColumnCollection = <
                      item
                        Value = 50.000000000000000000
                      end
                      item
                        SizeStyle = ssAbsolute
                        Value = 12.000000000000000000
                      end
                      item
                        Value = 50.000000000000000000
                      end>
                    ControlCollection = <
                      item
                        Column = 0
                        Control = Label72
                        Row = 1
                      end
                      item
                        Column = 2
                        Control = ed_v2_sangsup_valor
                        Row = 1
                      end
                      item
                        Column = 0
                        Control = bt_v2_sangsup_salvar
                        Row = 3
                      end
                      item
                        Column = 2
                        Control = bt_v2_sangsup_cancela
                        Row = 3
                      end
                      item
                        Column = 0
                        Control = Label93
                        Row = 0
                      end
                      item
                        Column = 2
                        Control = ed_v2_sangsup_opcao
                        Row = 0
                      end>
                    ParentColor = True
                    RowCollection = <
                      item
                        SizeStyle = ssAbsolute
                        Value = 21.000000000000000000
                      end
                      item
                        SizeStyle = ssAbsolute
                        Value = 21.000000000000000000
                      end
                      item
                        SizeStyle = ssAbsolute
                        Value = 6.000000000000000000
                      end
                      item
                        SizeStyle = ssAbsolute
                        Value = 28.000000000000000000
                      end>
                    TabOrder = 0
                    object Label72: TLabel
                      Left = 6
                      Top = 27
                      Width = 368
                      Height = 21
                      Align = alClient
                      Alignment = taRightJustify
                      Caption = 'Valor'
                      Layout = tlCenter
                      ExplicitLeft = 350
                      ExplicitWidth = 24
                      ExplicitHeight = 13
                    end
                    object ed_v2_sangsup_valor: TEditHw
                      Left = 386
                      Top = 27
                      Width = 369
                      Height = 19
                      Align = alTop
                      TabOrder = 1
                      Text = '0,00'
                      OnExit = ed_v2_sangsup_valorExit
                      Formato = fNumber
                      FormatSize = '0.2'
                    end
                    object bt_v2_sangsup_salvar: TBitBtn
                      Left = 274
                      Top = 54
                      Width = 100
                      Height = 28
                      Align = alRight
                      Caption = 'Salvar'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -13
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 2
                      OnClick = bt_v2_sangsup_salvarClick
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
                    object bt_v2_sangsup_cancela: TBitBtn
                      Left = 386
                      Top = 54
                      Width = 100
                      Height = 28
                      Align = alLeft
                      Caption = 'Cancela'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -13
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 3
                      OnClick = bt_v2_sangsup_cancelaClick
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
                    end
                    object Label93: TLabel
                      Left = 6
                      Top = 6
                      Width = 368
                      Height = 21
                      Align = alClient
                      Alignment = taRightJustify
                      Caption = 'Op'#231#227'o (1 - Sangria, 2- Suprimento)'
                      Layout = tlCenter
                      ExplicitLeft = 206
                      ExplicitWidth = 168
                      ExplicitHeight = 13
                    end
                    object ed_v2_sangsup_opcao: TMaskEdit
                      Left = 386
                      Top = 6
                      Width = 369
                      Height = 19
                      Align = alTop
                      TabOrder = 0
                      Text = 'ed_v2_valores_tipodesc'
                      OnKeyPress = ed_v2_sangsup_opcaoKeyPress
                    end
                  end
                end
              end
            end
            object ts_v2_movimento_operador: TTabSheet
              Caption = 'ts_v2_movimento_operador'
              ImageIndex = 17
              object pn_v2_movimento_operador: TPanel
                Left = 0
                Top = 0
                Width = 779
                Height = 495
                Align = alClient
                BevelKind = bkTile
                BevelOuter = bvNone
                BorderWidth = 6
                Color = clWhite
                Ctl3D = False
                ParentBackground = False
                ParentCtl3D = False
                TabOrder = 0
                object ScrollBox14: TScrollBox
                  Left = 6
                  Top = 6
                  Width = 763
                  Height = 479
                  Align = alClient
                  BevelInner = bvNone
                  BevelOuter = bvNone
                  BorderStyle = bsNone
                  TabOrder = 0
                  object GridPanel14: TGridPanel
                    Left = 0
                    Top = 0
                    Width = 763
                    Height = 345
                    Align = alTop
                    BevelOuter = bvNone
                    BorderWidth = 6
                    BorderStyle = bsSingle
                    ColumnCollection = <
                      item
                        Value = 50.000000000000000000
                      end
                      item
                        SizeStyle = ssAbsolute
                        Value = 12.000000000000000000
                      end
                      item
                        Value = 50.000000000000000000
                      end>
                    ControlCollection = <
                      item
                        Column = 0
                        ColumnSpan = 3
                        Control = lb_pn_v2_movimento_operador_title
                        Row = 0
                      end
                      item
                        Column = 0
                        Control = Label145
                        Row = 5
                      end
                      item
                        Column = 0
                        Control = Label146
                        Row = 4
                      end
                      item
                        Column = 0
                        Control = Label147
                        Row = 3
                      end
                      item
                        Column = 0
                        Control = Label148
                        Row = 2
                      end
                      item
                        Column = 0
                        Control = Label149
                        Row = 1
                      end
                      item
                        Column = 1
                        Control = Panel112
                        Row = 1
                        RowSpan = 8
                      end
                      item
                        Column = 0
                        Control = Label152
                        Row = 7
                      end
                      item
                        Column = 0
                        Control = Label154
                        Row = 8
                      end
                      item
                        Column = 2
                        Control = Panel110
                        Row = 5
                      end
                      item
                        Column = 2
                        Control = Panel113
                        Row = 4
                      end
                      item
                        Column = 2
                        Control = Panel114
                        Row = 3
                      end
                      item
                        Column = 2
                        Control = Panel115
                        Row = 2
                      end
                      item
                        Column = 2
                        Control = Panel121
                        Row = 1
                      end
                      item
                        Column = 2
                        Control = Panel109
                        Row = 8
                      end
                      item
                        Column = 2
                        Control = Panel117
                        Row = 7
                      end
                      item
                        Column = 0
                        ColumnSpan = 3
                        Control = bt_v2_movimento_operador_relatorio
                        Row = 10
                      end
                      item
                        Column = 0
                        ColumnSpan = 3
                        Control = bt_v2_movimento_operador_abrirDia
                        Row = 11
                      end
                      item
                        Column = 0
                        ColumnSpan = 3
                        Control = bt_v2_movimento_operador_voltar
                        Row = 12
                      end>
                    ParentColor = True
                    RowCollection = <
                      item
                        SizeStyle = ssAbsolute
                        Value = 32.000000000000000000
                      end
                      item
                        SizeStyle = ssAbsolute
                        Value = 25.000000000000000000
                      end
                      item
                        SizeStyle = ssAbsolute
                        Value = 25.000000000000000000
                      end
                      item
                        SizeStyle = ssAbsolute
                        Value = 25.000000000000000000
                      end
                      item
                        SizeStyle = ssAbsolute
                        Value = 25.000000000000000000
                      end
                      item
                        SizeStyle = ssAbsolute
                        Value = 25.000000000000000000
                      end
                      item
                        SizeStyle = ssAbsolute
                        Value = 10.000000000000000000
                      end
                      item
                        SizeStyle = ssAbsolute
                        Value = 25.000000000000000000
                      end
                      item
                        SizeStyle = ssAbsolute
                        Value = 25.000000000000000000
                      end
                      item
                        SizeStyle = ssAbsolute
                        Value = 10.000000000000000000
                      end
                      item
                        SizeStyle = ssAbsolute
                        Value = 32.000000000000000000
                      end
                      item
                        SizeStyle = ssAbsolute
                        Value = 32.000000000000000000
                      end
                      item
                        SizeStyle = ssAbsolute
                        Value = 32.000000000000000000
                      end
                      item
                        SizeStyle = ssAbsolute
                        Value = 32.000000000000000000
                      end>
                    TabOrder = 0
                    object lb_pn_v2_movimento_operador_title: TLabel
                      Left = 6
                      Top = 6
                      Width = 749
                      Height = 32
                      Align = alClient
                      Alignment = taCenter
                      Caption = '[Movimento do Operador - Dia Aberto]'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clNavy
                      Font.Height = -15
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                      Layout = tlCenter
                      ExplicitWidth = 254
                      ExplicitHeight = 18
                    end
                    object Label145: TLabel
                      Left = 6
                      Top = 138
                      Width = 368
                      Height = 25
                      Align = alClient
                      Alignment = taRightJustify
                      Caption = 'Total Sangria'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clMaroon
                      Font.Height = -13
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                      Layout = tlCenter
                      ExplicitLeft = 289
                      ExplicitWidth = 85
                      ExplicitHeight = 16
                    end
                    object Label146: TLabel
                      Left = 6
                      Top = 113
                      Width = 368
                      Height = 25
                      Align = alClient
                      Alignment = taRightJustify
                      Caption = 'Total Suprimento'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -13
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                      Layout = tlCenter
                      ExplicitLeft = 264
                      ExplicitWidth = 110
                      ExplicitHeight = 16
                    end
                    object Label147: TLabel
                      Left = 6
                      Top = 88
                      Width = 368
                      Height = 25
                      Align = alClient
                      Alignment = taRightJustify
                      Caption = 'NFC-e em Dinheiro'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -13
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                      Layout = tlCenter
                      ExplicitLeft = 258
                      ExplicitWidth = 116
                      ExplicitHeight = 16
                    end
                    object Label148: TLabel
                      Left = 6
                      Top = 63
                      Width = 368
                      Height = 25
                      Align = alClient
                      Alignment = taRightJustify
                      Caption = 'NFC-e Outros'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -13
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                      Layout = tlCenter
                      ExplicitLeft = 297
                      ExplicitWidth = 77
                      ExplicitHeight = 16
                    end
                    object Label149: TLabel
                      Left = 6
                      Top = 38
                      Width = 368
                      Height = 25
                      Align = alClient
                      Alignment = taRightJustify
                      Caption = 'Dia'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -13
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                      Layout = tlCenter
                      ExplicitLeft = 354
                      ExplicitWidth = 20
                      ExplicitHeight = 16
                    end
                    object Panel112: TPanel
                      Left = 374
                      Top = 38
                      Width = 12
                      Height = 185
                      Align = alClient
                      Caption = 'Panel112'
                      Enabled = False
                      TabOrder = 0
                      Visible = False
                    end
                    object Label152: TLabel
                      Left = 6
                      Top = 173
                      Width = 368
                      Height = 25
                      Align = alClient
                      Alignment = taRightJustify
                      Caption = 'Total Liquido em Dinheiro'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clBlue
                      Font.Height = -13
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                      Layout = tlCenter
                      ExplicitLeft = 213
                      ExplicitWidth = 161
                      ExplicitHeight = 16
                    end
                    object Label154: TLabel
                      Left = 6
                      Top = 198
                      Width = 368
                      Height = 25
                      Align = alClient
                      Alignment = taRightJustify
                      Caption = 'Total Liquido Geral'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -13
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                      Layout = tlCenter
                      ExplicitLeft = 256
                      ExplicitWidth = 118
                      ExplicitHeight = 16
                    end
                    object Panel110: TPanel
                      Left = 386
                      Top = 138
                      Width = 369
                      Height = 25
                      Align = alClient
                      BevelOuter = bvNone
                      Enabled = False
                      ParentColor = True
                      TabOrder = 1
                      object ed_v2_movimento_operador_sang: TEditHw
                        Left = 0
                        Top = 0
                        Width = 369
                        Height = 22
                        Align = alTop
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clMaroon
                        Font.Height = -13
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                        TabOrder = 0
                        Text = '0,00'
                        OnExit = ed_v2_alt_item_vl_unExit
                        Formato = fNumber
                        FormatSize = '0.2'
                      end
                    end
                    object Panel113: TPanel
                      Left = 386
                      Top = 113
                      Width = 369
                      Height = 25
                      Align = alClient
                      BevelOuter = bvNone
                      Enabled = False
                      ParentColor = True
                      TabOrder = 2
                      object ed_v2_movimento_operador_sup: TEditHw
                        Left = 0
                        Top = 0
                        Width = 369
                        Height = 22
                        Align = alTop
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -13
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                        TabOrder = 0
                        Text = '0,00'
                        OnExit = ed_v2_alt_item_vl_unExit
                        Formato = fNumber
                        FormatSize = '0.2'
                      end
                    end
                    object Panel114: TPanel
                      Left = 386
                      Top = 88
                      Width = 369
                      Height = 25
                      Align = alClient
                      BevelOuter = bvNone
                      Enabled = False
                      ParentColor = True
                      TabOrder = 3
                      object ed_v2_movimento_operador_nfce_din: TEditHw
                        Left = 0
                        Top = 0
                        Width = 369
                        Height = 22
                        Align = alTop
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -13
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                        TabOrder = 0
                        Text = '0,00'
                        OnExit = ed_v2_alt_item_vl_unExit
                        Formato = fNumber
                        FormatSize = '0.2'
                      end
                    end
                    object Panel115: TPanel
                      Left = 386
                      Top = 63
                      Width = 369
                      Height = 25
                      Align = alClient
                      BevelOuter = bvNone
                      Enabled = False
                      ParentColor = True
                      TabOrder = 4
                      object ed_v2_movimento_operador_nfce_out: TEditHw
                        Left = 0
                        Top = 0
                        Width = 369
                        Height = 22
                        Align = alTop
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -13
                        Font.Name = 'Tahoma'
                        Font.Style = []
                        ParentFont = False
                        TabOrder = 0
                        Text = '0,00'
                        OnExit = ed_v2_alt_item_vl_unExit
                        Formato = fNumber
                        FormatSize = '0.2'
                      end
                    end
                    object Panel121: TPanel
                      Left = 386
                      Top = 38
                      Width = 369
                      Height = 25
                      Align = alClient
                      BevelOuter = bvNone
                      Enabled = False
                      ParentColor = True
                      TabOrder = 5
                      object ed_v2_movimento_operador_dia: TMaskEdit
                        Left = 0
                        Top = 0
                        Width = 369
                        Height = 22
                        Align = alTop
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -13
                        Font.Name = 'Tahoma'
                        Font.Style = []
                        ParentFont = False
                        TabOrder = 0
                        Text = 'ed_v2_valores_tipodesc'
                        OnKeyPress = ed_v2_valores_tipodescKeyPress
                      end
                    end
                    object Panel109: TPanel
                      Left = 386
                      Top = 198
                      Width = 369
                      Height = 25
                      Align = alClient
                      BevelOuter = bvNone
                      Enabled = False
                      ParentColor = True
                      TabOrder = 6
                      object ed_v2_movimento_operador_liq_geral: TEditHw
                        Left = 0
                        Top = 0
                        Width = 369
                        Height = 22
                        Align = alTop
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -13
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                        TabOrder = 0
                        Text = '0,00'
                        OnExit = ed_v2_alt_item_vl_unExit
                        Formato = fNumber
                        FormatSize = '0.2'
                      end
                    end
                    object Panel117: TPanel
                      Left = 386
                      Top = 173
                      Width = 369
                      Height = 25
                      Align = alClient
                      BevelOuter = bvNone
                      Enabled = False
                      ParentColor = True
                      TabOrder = 7
                      object ed_v2_movimento_operador_liq_din: TEditHw
                        Left = 0
                        Top = 0
                        Width = 369
                        Height = 22
                        Align = alTop
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clBlue
                        Font.Height = -13
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                        TabOrder = 0
                        Text = '0,00'
                        OnExit = ed_v2_alt_item_vl_unExit
                        Formato = fNumber
                        FormatSize = '0.2'
                      end
                    end
                    object bt_v2_movimento_operador_relatorio: TBitBtn
                      Left = 6
                      Top = 233
                      Width = 749
                      Height = 32
                      Align = alClient
                      Caption = 'Relatorio de movimento do Dia'
                      TabOrder = 8
                      OnClick = bt_v2_movimento_operador_relatorioClick
                    end
                    object bt_v2_movimento_operador_abrirDia: TBitBtn
                      Left = 6
                      Top = 265
                      Width = 749
                      Height = 32
                      Align = alClient
                      Caption = 'Abrir dia de Movimento'
                      TabOrder = 9
                      OnClick = bt_v2_movimento_operador_abrirDiaClick
                    end
                    object bt_v2_movimento_operador_voltar: TBitBtn
                      Left = 6
                      Top = 297
                      Width = 749
                      Height = 32
                      Align = alClient
                      Caption = 'Voltar'
                      TabOrder = 10
                      OnClick = bt_v2_movimento_operador_voltarClick
                    end
                  end
                end
              end
            end
            object ts_v2_vendedor: TTabSheet
              Caption = 'ts_v2_vendedor'
              ImageIndex = 18
              object pn_v2_vendedor: TPanel
                Left = 0
                Top = 0
                Width = 779
                Height = 495
                Align = alClient
                BevelKind = bkTile
                BevelOuter = bvNone
                BorderWidth = 6
                Color = clWhite
                Ctl3D = False
                ParentBackground = False
                ParentCtl3D = False
                TabOrder = 0
                object ScrollBox15: TScrollBox
                  Left = 6
                  Top = 6
                  Width = 763
                  Height = 479
                  Align = alClient
                  BevelInner = bvNone
                  BevelOuter = bvNone
                  BorderStyle = bsNone
                  TabOrder = 0
                  object GridPanel15: TGridPanel
                    Left = 0
                    Top = 24
                    Width = 763
                    Height = 71
                    Align = alTop
                    BevelKind = bkTile
                    BevelOuter = bvNone
                    BorderWidth = 6
                    ColumnCollection = <
                      item
                        Value = 50.000000000000000000
                      end
                      item
                        SizeStyle = ssAbsolute
                        Value = 10.000000000000000000
                      end
                      item
                        Value = 50.000000000000000000
                      end>
                    ControlCollection = <
                      item
                        Column = 0
                        Control = Label158
                        Row = 0
                      end
                      item
                        Column = 0
                        ColumnSpan = 3
                        Control = pn_v2_nomevendedor
                        Row = 1
                      end
                      item
                        Column = 0
                        Control = Panel125
                        Row = 2
                      end
                      item
                        Column = 2
                        Control = ed_v2_codvendedor
                        Row = 0
                      end>
                    ParentColor = True
                    RowCollection = <
                      item
                        SizeStyle = ssAbsolute
                        Value = 27.000000000000000000
                      end
                      item
                        SizeStyle = ssAbsolute
                        Value = 35.000000000000000000
                      end
                      item
                        SizeStyle = ssAbsolute
                        Value = 21.000000000000000000
                      end>
                    TabOrder = 0
                    object Label158: TLabel
                      Left = 6
                      Top = 6
                      Width = 368
                      Height = 27
                      Align = alClient
                      Alignment = taRightJustify
                      Caption = 'Informe o c'#243'digo do vendedor'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -12
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                      WordWrap = True
                      ExplicitLeft = 206
                      ExplicitWidth = 168
                      ExplicitHeight = 14
                    end
                    object pn_v2_nomevendedor: TPanel
                      Left = 6
                      Top = 33
                      Width = 747
                      Height = 27
                      Align = alTop
                      BevelOuter = bvNone
                      Caption = 'Colaborador selecionado'
                      Enabled = False
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clNavy
                      Font.Height = -13
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentColor = True
                      ParentFont = False
                      TabOrder = 0
                    end
                    object Panel125: TPanel
                      Left = 6
                      Top = 68
                      Width = 368
                      Height = 21
                      Align = alClient
                      BevelOuter = bvNone
                      Enabled = False
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clRed
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentColor = True
                      ParentFont = False
                      TabOrder = 1
                    end
                    object ed_v2_codvendedor: TEditFiscal
                      Left = 384
                      Top = 6
                      Width = 369
                      Height = 19
                      Align = alTop
                      TabOrder = 2
                      Text = '0'
                      OnChange = ed_v2_codvendedorChange
                      OnKeyDown = ed_v2_codvendedorKeyDown
                      OnKeyPress = ed_v2_selecionar_orcamento_numeroKeyPress
                    end
                  end
                  object Panel126: TPanel
                    Left = 0
                    Top = 0
                    Width = 763
                    Height = 24
                    Align = alTop
                    BevelOuter = bvNone
                    Caption = '  [Enter: Selecionar] [ESC: Voltar]'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -12
                    Font.Name = 'Verdana'
                    Font.Style = []
                    ParentColor = True
                    ParentFont = False
                    TabOrder = 1
                  end
                end
              end
            end
          end
        end
      end
    end
    inherited PanelFlash: TPanel
      Left = 2000
      Top = 524
      ExplicitLeft = 2000
      ExplicitTop = 524
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 609
    ExplicitTop = 609
  end
  inherited pnStatusProcessamento: TPanel
    Left = 2000
    Top = 504
    ExplicitLeft = 2000
    ExplicitTop = 504
    inherited lbTextoProcessamento: TLabel
      Width = 477
      Height = 21
    end
  end
  object stsbar_nfce: TStatusBar [3]
    Left = 0
    Top = 590
    Width = 798
    Height = 19
    Panels = <>
  end
  inherited PopupMenu1: TPopupMenu
    Left = 692
    Top = 1
    object XML1: TMenuItem
      Caption = 'XML'
      object NFCeAutorizacao1: TMenuItem
        Caption = 'NFC-e Autoriza'#231#227'o'
        object NFCeAutorizacao1Visualizar1: TMenuItem
          Caption = 'Visualizar'
          OnClick = NFCeAutorizacao1Visualizar1Click
        end
        object NFCeAutorizacao1Salvar1: TMenuItem
          Caption = 'Salvar'
          OnClick = NFCeAutorizacao1Salvar1Click
        end
      end
      object NFCeCancelamento1: TMenuItem
        Caption = 'NFC-e Cancelamento'
        object NFCeCancelamento1Visualizar1: TMenuItem
          Caption = 'Visualizar'
          OnClick = NFCeCancelamento1Visualizar1Click
        end
        object NFCeCancelamento1Salvar1: TMenuItem
          Caption = 'Salvar'
          OnClick = NFCeCancelamento1Salvar1Click
        end
      end
      object NFCeInutilizacao1: TMenuItem
        Caption = 'NFC-e Inutiliza'#231#227'o'
        object NFCeInutilizacao1Visualizar1: TMenuItem
          Caption = 'Visualizar'
          OnClick = NFCeInutilizacao1Visualizar1Click
        end
        object NFCeInutilizacao1Salvar1: TMenuItem
          Caption = 'Salvar'
          OnClick = NFCeInutilizacao1Salvar1Click
        end
      end
    end
  end
  inherited PopupMenu2: TPopupMenu
    Left = 662
    Top = 65531
  end
  inherited Timer1: TTimer
    Left = 630
    Top = 65531
  end
  inherited ApplicationEventsPadrao: TApplicationEvents
    Left = 598
    Top = 65531
  end
  object PopupMenu3: TPopupMenu
    Left = 728
    object AtualizarDadosFiscaisdosItens1: TMenuItem
      Caption = 'Atualizar Dados Fiscais dos Itens'
      OnClick = AtualizarDadosFiscaisdosItens1Click
    end
    object ReabirNFCparaCorrees1: TMenuItem
      Caption = 'Reabir NFC para Corre'#231#245'es'
      OnClick = ReabirNFCparaCorrees1Click
    end
    object ModoSimplificado1: TMenuItem
      Caption = 'Modo Simplificado'
      OnClick = ModoSimplificado1Click
    end
    object UsarOramento1: TMenuItem
      Caption = 'Usar Or'#231'amento'
      OnClick = UsarOramento1Click
    end
    object N5: TMenuItem
      Caption = '-'
    end
    object Frete1: TMenuItem
      Caption = 'Frete'
      OnClick = Frete1Click
    end
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'xml'
    Filter = 'Arquivos xml (*.xml)|*.xml'
    Title = 'Salvar arquivo XML'
    Left = 760
  end
  object pmOutros: TPopupMenu
    Left = 568
    object Menudeoperaesrpidas1: TMenuItem
      Caption = 'Menu de opera'#231#245'es r'#225'pidas'
      OnClick = Menudeoperaesrpidas1Click
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object CadastrodeEmissor1: TMenuItem
      Caption = 'Cadastro de Emissor'
      OnClick = CadastrodeEmissor1Click
    end
    object ConfiguraesWebService1: TMenuItem
      Caption = 'Configura'#231#245'es WebService'
      OnClick = ConfiguraesWebService1Click
    end
    object MonitorStatusServico1: TMenuItem
      Caption = 'Monitor Status Servico'
      OnClick = MonitorStatusServico1Click
    end
    object ServioWindows1: TMenuItem
      Caption = 'Servi'#231'o Windows'
      OnClick = ServioWindows1Click
    end
    object LogSincronizaoNFCeoffline1: TMenuItem
      Caption = 'Log Sincroniza'#231#227'o NFCe offline'
      OnClick = LogSincronizaoNFCeoffline1Click
    end
    object Dadoscertificado1: TMenuItem
      Caption = 'Dados certificado'
      OnClick = Dadoscertificado1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object POSVirtual1: TMenuItem
      Caption = 'POS Virtual'
      OnClick = POSVirtual1Click
    end
    object CriaratalhoNFCenareadeTrabalho1: TMenuItem
      Caption = 'Criar atalho NFCe na '#193'rea de Trabalho'
      OnClick = CriaratalhoNFCenareadeTrabalho1Click
    end
    object SelecionarImpressoraPadrao1: TMenuItem
      Caption = 'Selecionar Impressora Padrao'
      OnClick = SelecionarImpressoraPadrao1Click
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object AbrirGaveta1: TMenuItem
      Caption = 'Abrir Gaveta'
      OnClick = AbrirGaveta1Click
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object CriarNFCecomplementar1: TMenuItem
      Caption = 'Criar NFC-e complementar'
      OnClick = CriarNFCecomplementar1Click
    end
  end
  object timerAutorizarAuto: TTimer
    Enabled = False
    Interval = 300
    OnTimer = timerAutorizarAutoTimer
    Left = 704
    Top = 64
  end
  object popItensNFCe: TPopupMenu
    Left = 496
    Top = 16
    object Copiar1: TMenuItem
      Caption = 'Copiar'
      OnClick = Copiar1Click
    end
  end
end
