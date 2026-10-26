inherited FrmCadKits: TFrmCadKits
  Left = 246
  Caption = 'Kits de Produtos'
  ClientWidth = 899
  ExplicitWidth = 907
  ExplicitHeight = 598
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelFundo: TPanel
    Width = 899
    ExplicitWidth = 899
    inherited PanelLeft: TPanel
      Width = 894
      ExplicitWidth = 894
      inherited PageControl1: TPageControl
        Width = 892
        ExplicitWidth = 892
        inherited TabSheet1: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 884
          ExplicitHeight = 510
          inherited ScrollBox1: TScrollBox
            Width = 884
            ExplicitWidth = 884
            inherited PageControl3: TPageControl
              Width = 884
              OnChange = PageControl3Change
              ExplicitWidth = 884
              inherited TabSheet3: TTabSheet
                Caption = 'Dados do Kit'
                ExplicitLeft = 4
                ExplicitTop = 27
                ExplicitWidth = 876
                ExplicitHeight = 431
                inherited ScrollBox3: TScrollBox
                  Width = 876
                  ExplicitWidth = 876
                  inherited GroupBox1: TGroupBox
                    Width = 872
                    Height = 427
                    Align = alClient
                    Caption = 'Dados do Kit'
                    ExplicitWidth = 872
                    ExplicitHeight = 427
                    object Label6: TLabel
                      Left = 31
                      Top = 23
                      Width = 81
                      Height = 13
                      Caption = 'Codigo do Kit:'
                      FocusControl = DBEdit1
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label7: TLabel
                      Left = 13
                      Top = 45
                      Width = 99
                      Height = 13
                      Caption = 'Descri'#231#227'o do Kit:'
                      FocusControl = DBEdit2
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label8: TLabel
                      Left = 6
                      Top = 71
                      Width = 106
                      Height = 13
                      Caption = 'Somente Todo Kit:'
                      FocusControl = DBEdit2
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object DBEdit1: TDBEdit
                      Left = 115
                      Top = 15
                      Width = 64
                      Height = 21
                      Hint = 'C'#243'digo do kit'
                      DataField = 'CODIGO_KIT'
                      DataSource = dtmProdutos.dsKits
                      TabOrder = 0
                    end
                    object DBEdit2: TDBEdit
                      Left = 115
                      Top = 42
                      Width = 422
                      Height = 21
                      Hint = 'Descri'#231#227'o do kit'
                      CharCase = ecUpperCase
                      DataField = 'DESCRICAO_KIT'
                      DataSource = dtmProdutos.dsKits
                      TabOrder = 1
                    end
                    object DBComboBox1: TDBComboBox
                      Left = 115
                      Top = 68
                      Width = 145
                      Height = 21
                      Hint = 'Durante uma venda indica se ser'#225' utilizado o kit inteiro'
                      DataField = 'KIT_TODO'
                      DataSource = dtmProdutos.dsKits
                      ItemHeight = 13
                      Items.Strings = (
                        'SIM'
                        'N'#195'O')
                      TabOrder = 2
                      OnExit = DBComboBox1Exit
                    end
                  end
                end
              end
              object tsECommerce: TTabSheet
                Caption = 'E-Commerce'
                ImageIndex = 1
                ExplicitLeft = 0
                ExplicitTop = 0
                ExplicitWidth = 0
                ExplicitHeight = 0
                object GroupBoxKit: TGroupBox
                  Left = 0
                  Top = 0
                  Width = 876
                  Height = 53
                  Align = alTop
                  Caption = 'Kit'
                  TabOrder = 0
                  object DBTextDescKit: TDBText
                    Left = 9
                    Top = 13
                    Width = 83
                    Height = 13
                    AutoSize = True
                    DataField = 'DESCRICAO_KIT'
                    DataSource = dtmProdutos.dsKits
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object lbCodigo: TLabel
                    Left = 9
                    Top = 35
                    Width = 44
                    Height = 13
                    Caption = 'Codigo: '
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object DBTextCodigoKit: TDBText
                    Left = 55
                    Top = 35
                    Width = 32
                    Height = 17
                    DataField = 'CODIGO_KIT'
                    DataSource = dtmProdutos.dsKits
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlue
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object lbIdECommerce: TLabel
                    Left = 99
                    Top = 35
                    Width = 90
                    Height = 13
                    BiDiMode = bdLeftToRight
                    Caption = 'Id E-Commerce:'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    ParentBiDiMode = False
                    ParentFont = False
                  end
                  object DBTextIdEcommerce: TDBText
                    Left = 195
                    Top = 35
                    Width = 40
                    Height = 17
                    DataField = 'ID_COMMERCE'
                    DataSource = dtmProdutos.dsKitsEC
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlue
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object lbValorKitECommerce: TLabel
                    Left = 413
                    Top = 13
                    Width = 141
                    Height = 13
                    BiDiMode = bdLeftToRight
                    Caption = 'Valor E-Commerce Bruto:'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    ParentBiDiMode = False
                    ParentFont = False
                  end
                  object DBTextValorEcommerce: TDBText
                    Left = 558
                    Top = 13
                    Width = 71
                    Height = 17
                    DataField = 'VALOR_TAB_PROKIT'
                    DataSource = dtmProdutos.dsKits
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlue
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object lbPrecoTabela: TLabel
                    Left = 245
                    Top = 35
                    Width = 76
                    Height = 13
                    BiDiMode = bdLeftToRight
                    Caption = 'Pre'#231'o Tabela:'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    ParentBiDiMode = False
                    ParentFont = False
                    Visible = False
                  end
                  object DBTextPrecoTabela: TDBText
                    Left = 327
                    Top = 35
                    Width = 71
                    Height = 17
                    DataField = 'PREC_TAB_PROD'
                    DataSource = dtmProdutos.dsKits
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlue
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    ParentFont = False
                    Visible = False
                  end
                  object Label26: TLabel
                    Left = 404
                    Top = 35
                    Width = 150
                    Height = 13
                    BiDiMode = bdLeftToRight
                    Caption = 'Valor E-Commerce L'#237'quido:'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    ParentBiDiMode = False
                    ParentFont = False
                  end
                  object DBTextValorEcommerceLiq: TDBText
                    Left = 558
                    Top = 35
                    Width = 71
                    Height = 17
                    DataField = 'VALOR_DESC_TAB_PROKIT'
                    DataSource = dtmProdutos.dsKits
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlue
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object lbDescValorKitECommerce: TLabel
                    Left = 637
                    Top = 13
                    Width = 149
                    Height = 13
                    BiDiMode = bdLeftToRight
                    Caption = 'Desconto E-Commerce R$:'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    ParentBiDiMode = False
                    ParentFont = False
                  end
                  object DBTextDescValorEcommerce: TDBText
                    Left = 790
                    Top = 13
                    Width = 56
                    Height = 17
                    DataField = 'DESCONTO_VALOR'
                    DataSource = dtmProdutos.dsKitsEC
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlue
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object lbDescPercKitECommerce: TLabel
                    Left = 639
                    Top = 35
                    Width = 147
                    Height = 13
                    BiDiMode = bdLeftToRight
                    Caption = 'Desconto E-Commerce %:'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    ParentBiDiMode = False
                    ParentFont = False
                  end
                  object DBTextDescPercEcommerce: TDBText
                    Left = 790
                    Top = 35
                    Width = 56
                    Height = 17
                    DataField = 'DESCONTO_PERC'
                    DataSource = dtmProdutos.dsKitsEC
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlue
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                end
                object GroupBoxDadosEC: TGroupBox
                  Left = 0
                  Top = 53
                  Width = 876
                  Height = 378
                  Align = alClient
                  Caption = 'Dados E-Commerce'
                  Color = clBtnFace
                  Ctl3D = True
                  ParentColor = False
                  ParentCtl3D = False
                  TabOrder = 1
                  object pnDadosEC: TPanel
                    Left = 2
                    Top = 15
                    Width = 872
                    Height = 328
                    Align = alClient
                    BevelOuter = bvNone
                    BorderWidth = 6
                    TabOrder = 0
                    OnEnter = pnDadosECEnter
                    object pnOpcoesDadosEC: TPanel
                      Left = 6
                      Top = 285
                      Width = 860
                      Height = 37
                      Align = alBottom
                      BevelKind = bkTile
                      BevelOuter = bvNone
                      TabOrder = 0
                      object btnOKAlterarDadosEC: TBitBtn
                        Left = 332
                        Top = 4
                        Width = 75
                        Height = 25
                        Hint = 'OK - [PRO412]'
                        Caption = '&OK'
                        TabOrder = 0
                        OnClick = btnOKAlterarDadosECClick
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
                      object btnCancAlterarDadosEC: TBitBtn
                        Left = 413
                        Top = 4
                        Width = 75
                        Height = 25
                        Hint = 'Cancelar'
                        Caption = '&Cancela'
                        TabOrder = 1
                        OnClick = btnCancAlterarDadosECClick
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
                      object Panel114: TPanel
                        Left = 635
                        Top = 0
                        Width = 221
                        Height = 33
                        Align = alRight
                        BevelOuter = bvNone
                        TabOrder = 3
                        object LbPagEC: TLabel
                          Left = 192
                          Top = 0
                          Width = 29
                          Height = 18
                          Align = alRight
                          Alignment = taRightJustify
                          Caption = '1/4'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clBlue
                          Font.Height = -15
                          Font.Name = 'Tahoma'
                          Font.Style = [fsBold]
                          ParentFont = False
                        end
                      end
                      object Panel115: TPanel
                        Left = 569
                        Top = 0
                        Width = 66
                        Height = 33
                        Align = alRight
                        BevelOuter = bvNone
                        TabOrder = 2
                        object sbVoltarEC: TSpeedButton
                          Left = 0
                          Top = 0
                          Width = 33
                          Height = 33
                          Hint = 'Anterior'
                          Align = alLeft
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
                          OnClick = sbVoltarECClick
                          ExplicitLeft = 806
                          ExplicitTop = 2
                        end
                        object sbAvancarEC: TSpeedButton
                          Left = 33
                          Top = 0
                          Width = 33
                          Height = 33
                          Hint = 'Pr'#243'ximo'
                          Align = alRight
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
                          OnClick = sbAvancarECClick
                          ExplicitLeft = 801
                          ExplicitTop = -2
                        end
                      end
                      object btnIncluirItemKit: TBitBtn
                        Left = 2
                        Top = 4
                        Width = 75
                        Height = 25
                        Hint = 'Incluir Item no Kit - [PRO120]'
                        Caption = '&Incluir'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                        TabOrder = 4
                        OnClick = btnIncluirItemKitClick
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
                      object btnAlterarItemKit: TBitBtn
                        Left = 82
                        Top = 4
                        Width = 75
                        Height = 25
                        Hint = 'Alterar Item do Kit - [PRO121]'
                        Caption = '&Alterar'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                        TabOrder = 5
                        OnClick = btnAlterarItemKitClick
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
                      object btnDeltarItemKit: TBitBtn
                        Left = 163
                        Top = 4
                        Width = 75
                        Height = 25
                        Hint = 'Deletar Item do Kit - [PRO122]'
                        Caption = '&Deletar'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                        TabOrder = 6
                        OnClick = btnDeltarItemKitClick
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
                      object btnImprimirItemKit: TBitBtn
                        Left = 244
                        Top = 4
                        Width = 83
                        Height = 25
                        Hint = 'Imprimir Kit - [PRO427]'
                        Caption = 'Imprimir'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                        TabOrder = 7
                        OnClick = btnImprimirItemKitClick
                        Glyph.Data = {
                          36050000424D3605000000000000360400002800000010000000100000000100
                          08000000000000010000F30E0000F30E00000001000000000000000000000000
                          80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
                          A6000020400000206000002080000020A0000020C0000020E000004000000040
                          20000040400000406000004080000040A0000040C0000040E000006000000060
                          20000060400000606000006080000060A0000060C0000060E000008000000080
                          20000080400000806000008080000080A0000080C0000080E00000A0000000A0
                          200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
                          200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
                          200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
                          20004000400040006000400080004000A0004000C0004000E000402000004020
                          20004020400040206000402080004020A0004020C0004020E000404000004040
                          20004040400040406000404080004040A0004040C0004040E000406000004060
                          20004060400040606000406080004060A0004060C0004060E000408000004080
                          20004080400040806000408080004080A0004080C0004080E00040A0000040A0
                          200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
                          200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
                          200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
                          20008000400080006000800080008000A0008000C0008000E000802000008020
                          20008020400080206000802080008020A0008020C0008020E000804000008040
                          20008040400080406000804080008040A0008040C0008040E000806000008060
                          20008060400080606000806080008060A0008060C0008060E000808000008080
                          20008080400080806000808080008080A0008080C0008080E00080A0000080A0
                          200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
                          200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
                          200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
                          2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
                          2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
                          2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
                          2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
                          2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
                          2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
                          2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
                          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FDFDFDFDFDFD
                          FDFDFDFDFDFDFDFDFDFDFDFDFDFDF708F6F6F6F608EDF7FDFDFDFDFDFDFD52F6
                          F6070708FFA452FDFDFDFDFD9B5252F6F6070808FFA452529BFDFD9B525252F6
                          08A4A4F7F6A4525252FDFD9BA49B9B525252525252529B075352FDA4F7ADADF7
                          F7A4A4ADADADA5BCAD52FDF7089C9CE4E4E5E5E4E4E4DCAC0852FD070893E4E4
                          E4E4A4E4E4E4E4E5F69BFD070749529B9B9B9B9B9B5252F707F7FD07074952FF
                          FFFFFFFFFFED52ED07FDFDFDF6F6F6F6F6F6FFFFF608F6F6F6FDFDFDFDFDFD08
                          F6FF07070708FDFDFDFDFDFDFDFDFD07F60807FFFF07FDFDFDFDFDFDFDFDFD07
                          F60707FFF6FDFDFDFDFDFDFDFDFDFDF707070707FDFDFDFDFDFD}
                      end
                    end
                    object PageControlEC: TPageControl
                      Left = 6
                      Top = 6
                      Width = 860
                      Height = 279
                      ActivePage = TabSheetEC1
                      Align = alClient
                      Style = tsFlatButtons
                      TabOrder = 1
                      object TabSheetEC1: TTabSheet
                        Caption = 'TabSheetEC1'
                        ExplicitLeft = 0
                        ExplicitTop = 0
                        ExplicitWidth = 0
                        ExplicitHeight = 0
                        object ScrollBox9: TScrollBox
                          Left = 0
                          Top = 0
                          Width = 852
                          Height = 248
                          Align = alClient
                          BevelInner = bvNone
                          BevelOuter = bvNone
                          BorderStyle = bsNone
                          Ctl3D = True
                          ParentCtl3D = False
                          TabOrder = 0
                          object Panel77: TPanel
                            Left = 798
                            Top = 224
                            Width = 54
                            Height = 24
                            Align = alRight
                            BevelOuter = bvNone
                            TabOrder = 1
                          end
                          object pnDescricaoHTMLEC: TPanel
                            Left = 0
                            Top = 224
                            Width = 798
                            Height = 24
                            Align = alClient
                            BevelOuter = bvNone
                            TabOrder = 2
                            object Panel99: TPanel
                              Left = 0
                              Top = 0
                              Width = 116
                              Height = 24
                              Align = alLeft
                              BevelOuter = bvNone
                              TabOrder = 0
                              object lbDescrCompletaEC: TLabel
                                Left = 73
                                Top = 3
                                Width = 41
                                Height = 13
                                Caption = 'Dados:'
                                Font.Charset = DEFAULT_CHARSET
                                Font.Color = clWindowText
                                Font.Height = -11
                                Font.Name = 'MS Sans Serif'
                                Font.Style = [fsBold]
                                ParentFont = False
                              end
                            end
                            object Panel78: TPanel
                              Left = 116
                              Top = 0
                              Width = 646
                              Height = 24
                              Align = alClient
                              BevelKind = bkTile
                              BevelOuter = bvNone
                              TabOrder = 1
                              object pnOpcoesHtml: TPanel
                                Left = 0
                                Top = 0
                                Width = 34
                                Height = 20
                                Align = alLeft
                                BevelKind = bkTile
                                BevelOuter = bvNone
                                TabOrder = 0
                                object SpeedButtonAlterarHtmlEC: TSpeedButton
                                  Left = 0
                                  Top = 0
                                  Width = 30
                                  Height = 16
                                  Hint = 'Editar Html'
                                  Align = alClient
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
                                  OnClick = SpeedButtonAlterarHtmlECClick
                                  ExplicitLeft = 3
                                  ExplicitTop = 4
                                  ExplicitWidth = 25
                                  ExplicitHeight = 54
                                end
                              end
                              object WebBrowserEC: TWebBrowser
                                Left = 34
                                Top = 0
                                Width = 608
                                Height = 20
                                Align = alClient
                                TabOrder = 1
                                ExplicitWidth = 647
                                ExplicitHeight = 40
                                ControlData = {
                                  4C000000D73E0000110200000000000000000000000000000000000000000000
                                  000000004C000000000000000000000001000000E0D057007335CF11AE690800
                                  2B2E126208000000000000004C0000000114020000000000C000000000000046
                                  8000000000000000000000000000000000000000000000000000000000000000
                                  00000000000000000100000000000000000000000000000000000000}
                              end
                            end
                            object Panel7: TPanel
                              Left = 762
                              Top = 0
                              Width = 36
                              Height = 24
                              Align = alRight
                              BevelOuter = bvNone
                              TabOrder = 2
                            end
                          end
                          object pnDescricaoProdEC: TPanel
                            Left = 0
                            Top = 0
                            Width = 852
                            Height = 224
                            Align = alTop
                            BevelOuter = bvNone
                            TabOrder = 0
                            object lbDescrEC: TLabel
                              Left = 52
                              Top = 11
                              Width = 62
                              Height = 13
                              Caption = 'Descri'#231#227'o:'
                              Font.Charset = DEFAULT_CHARSET
                              Font.Color = clWindowText
                              Font.Height = -11
                              Font.Name = 'MS Sans Serif'
                              Font.Style = [fsBold]
                              ParentFont = False
                            end
                            object lbPromoEC: TLabel
                              Left = 367
                              Top = 37
                              Width = 74
                              Height = 13
                              Alignment = taRightJustify
                              Caption = 'Promocional:'
                              Font.Charset = DEFAULT_CHARSET
                              Font.Color = clWindowText
                              Font.Height = -11
                              Font.Name = 'MS Sans Serif'
                              Font.Style = [fsBold]
                              ParentFont = False
                            end
                            object lbFreteGratisEC: TLabel
                              Left = 538
                              Top = 37
                              Width = 71
                              Height = 13
                              Alignment = taRightJustify
                              Caption = 'Frete Gr'#225'tis:'
                              Font.Charset = DEFAULT_CHARSET
                              Font.Color = clWindowText
                              Font.Height = -11
                              Font.Name = 'MS Sans Serif'
                              Font.Style = [fsBold]
                              ParentFont = False
                            end
                            object lbLancEC: TLabel
                              Left = 696
                              Top = 37
                              Width = 74
                              Height = 13
                              Alignment = taRightJustify
                              Caption = 'Lan'#231'amento:'
                              Font.Charset = DEFAULT_CHARSET
                              Font.Color = clWindowText
                              Font.Height = -11
                              Font.Name = 'MS Sans Serif'
                              Font.Style = [fsBold]
                              ParentFont = False
                            end
                            object lbTermAceiteEC: TLabel
                              Left = 28
                              Top = 64
                              Width = 86
                              Height = 13
                              Alignment = taRightJustify
                              Caption = 'Termos Aceite:'
                              Font.Charset = DEFAULT_CHARSET
                              Font.Color = clWindowText
                              Font.Height = -11
                              Font.Name = 'MS Sans Serif'
                              Font.Style = [fsBold]
                              ParentFont = False
                            end
                            object lbCompreJuntoEC: TLabel
                              Left = 197
                              Top = 64
                              Width = 82
                              Height = 13
                              Alignment = taRightJustify
                              Caption = 'Compre Junto:'
                              Font.Charset = DEFAULT_CHARSET
                              Font.Color = clWindowText
                              Font.Height = -11
                              Font.Name = 'MS Sans Serif'
                              Font.Style = [fsBold]
                              ParentFont = False
                            end
                            object lbVirtualEC: TLabel
                              Left = 400
                              Top = 64
                              Width = 41
                              Height = 13
                              Alignment = taRightJustify
                              Caption = 'Virtual:'
                              Font.Charset = DEFAULT_CHARSET
                              Font.Color = clWindowText
                              Font.Height = -11
                              Font.Name = 'MS Sans Serif'
                              Font.Style = [fsBold]
                              ParentFont = False
                            end
                            object lbSincEC: TLabel
                              Left = 709
                              Top = 11
                              Width = 61
                              Height = 13
                              Alignment = taRightJustify
                              Caption = 'Sicronizar:'
                              Font.Charset = DEFAULT_CHARSET
                              Font.Color = clWindowText
                              Font.Height = -11
                              Font.Name = 'MS Sans Serif'
                              Font.Style = [fsBold]
                              ParentFont = False
                            end
                            object lbCategoria: TLabel
                              Left = 2
                              Top = 92
                              Width = 112
                              Height = 13
                              Alignment = taRightJustify
                              Caption = 'Categoria Principal:'
                              Font.Charset = DEFAULT_CHARSET
                              Font.Color = clWindowText
                              Font.Height = -11
                              Font.Name = 'MS Sans Serif'
                              Font.Style = [fsBold]
                              ParentFont = False
                            end
                            object lbDestaqueEC: TLabel
                              Left = 549
                              Top = 64
                              Width = 59
                              Height = 13
                              Alignment = taRightJustify
                              Caption = 'Destaque:'
                              Font.Charset = DEFAULT_CHARSET
                              Font.Color = clWindowText
                              Font.Height = -11
                              Font.Name = 'MS Sans Serif'
                              Font.Style = [fsBold]
                              ParentFont = False
                            end
                            object lbDispEC: TLabel
                              Left = 47
                              Top = 37
                              Width = 66
                              Height = 13
                              Alignment = taRightJustify
                              Caption = 'Dispon'#237'vel:'
                              Font.Charset = DEFAULT_CHARSET
                              Font.Color = clWindowText
                              Font.Height = -11
                              Font.Name = 'MS Sans Serif'
                              Font.Style = [fsBold]
                              ParentFont = False
                            end
                            object lbCodReferencia: TLabel
                              Left = 3
                              Top = 119
                              Width = 110
                              Height = 13
                              Caption = 'C'#243'digo Refer'#234'ncia:'
                              Font.Charset = DEFAULT_CHARSET
                              Font.Color = clWindowText
                              Font.Height = -11
                              Font.Name = 'MS Sans Serif'
                              Font.Style = [fsBold]
                              ParentFont = False
                            end
                            object lbCodEAN: TLabel
                              Left = 451
                              Top = 119
                              Width = 73
                              Height = 13
                              Caption = 'C'#243'digo EAN:'
                              Font.Charset = DEFAULT_CHARSET
                              Font.Color = clWindowText
                              Font.Height = -11
                              Font.Name = 'MS Sans Serif'
                              Font.Style = [fsBold]
                              ParentFont = False
                            end
                            object lbPeso: TLabel
                              Left = 80
                              Top = 198
                              Width = 33
                              Height = 13
                              Alignment = taRightJustify
                              Caption = 'Peso:'
                              Font.Charset = DEFAULT_CHARSET
                              Font.Color = clWindowText
                              Font.Height = -11
                              Font.Name = 'MS Sans Serif'
                              Font.Style = [fsBold]
                              ParentFont = False
                            end
                            object lbComprimento: TLabel
                              Left = 262
                              Top = 198
                              Width = 77
                              Height = 13
                              Alignment = taRightJustify
                              Caption = 'Comprimento:'
                              Font.Charset = DEFAULT_CHARSET
                              Font.Color = clWindowText
                              Font.Height = -11
                              Font.Name = 'MS Sans Serif'
                              Font.Style = [fsBold]
                              ParentFont = False
                            end
                            object lbAltura: TLabel
                              Left = 488
                              Top = 198
                              Width = 38
                              Height = 13
                              Alignment = taRightJustify
                              Caption = 'Altura:'
                              Font.Charset = DEFAULT_CHARSET
                              Font.Color = clWindowText
                              Font.Height = -11
                              Font.Name = 'MS Sans Serif'
                              Font.Style = [fsBold]
                              ParentFont = False
                            end
                            object lbLargura: TLabel
                              Left = 687
                              Top = 198
                              Width = 48
                              Height = 13
                              Alignment = taRightJustify
                              Caption = 'Largura:'
                              Font.Charset = DEFAULT_CHARSET
                              Font.Color = clWindowText
                              Font.Height = -11
                              Font.Name = 'MS Sans Serif'
                              Font.Style = [fsBold]
                              ParentFont = False
                            end
                            object lbPesoInf: TLabel
                              Left = 207
                              Top = 197
                              Width = 24
                              Height = 13
                              Alignment = taRightJustify
                              Caption = '(Kg)'
                              Font.Charset = DEFAULT_CHARSET
                              Font.Color = clWindowText
                              Font.Height = -11
                              Font.Name = 'MS Sans Serif'
                              Font.Style = [fsBold]
                              ParentFont = False
                            end
                            object lbComprimentoInf: TLabel
                              Left = 430
                              Top = 198
                              Width = 25
                              Height = 13
                              Alignment = taRightJustify
                              Caption = '(cm)'
                              Font.Charset = DEFAULT_CHARSET
                              Font.Color = clWindowText
                              Font.Height = -11
                              Font.Name = 'MS Sans Serif'
                              Font.Style = [fsBold]
                              ParentFont = False
                            end
                            object lbAlturaInf: TLabel
                              Left = 617
                              Top = 198
                              Width = 25
                              Height = 13
                              Alignment = taRightJustify
                              Caption = '(cm)'
                              Font.Charset = DEFAULT_CHARSET
                              Font.Color = clWindowText
                              Font.Height = -11
                              Font.Name = 'MS Sans Serif'
                              Font.Style = [fsBold]
                              ParentFont = False
                            end
                            object lbLarguraInf: TLabel
                              Left = 827
                              Top = 198
                              Width = 25
                              Height = 13
                              Alignment = taRightJustify
                              Caption = '(cm)'
                              Font.Charset = DEFAULT_CHARSET
                              Font.Color = clWindowText
                              Font.Height = -11
                              Font.Name = 'MS Sans Serif'
                              Font.Style = [fsBold]
                              ParentFont = False
                            end
                            object lbRegra: TLabel
                              Left = 12
                              Top = 172
                              Width = 101
                              Height = 13
                              Alignment = taRightJustify
                              Caption = 'Peso e dimens'#227'o:'
                              Font.Charset = DEFAULT_CHARSET
                              Font.Color = clWindowText
                              Font.Height = -11
                              Font.Name = 'MS Sans Serif'
                              Font.Style = [fsBold]
                              ParentFont = False
                            end
                            object lbDescValor: TLabel
                              Left = 26
                              Top = 146
                              Width = 87
                              Height = 13
                              Alignment = taRightJustify
                              Caption = 'Desconto (R$):'
                              Font.Charset = DEFAULT_CHARSET
                              Font.Color = clWindowText
                              Font.Height = -11
                              Font.Name = 'MS Sans Serif'
                              Font.Style = [fsBold]
                              ParentFont = False
                            end
                            object lbDescPerc: TLabel
                              Left = 241
                              Top = 146
                              Width = 80
                              Height = 13
                              Alignment = taRightJustify
                              Caption = 'Desconto (%):'
                              Font.Charset = DEFAULT_CHARSET
                              Font.Color = clWindowText
                              Font.Height = -11
                              Font.Name = 'MS Sans Serif'
                              Font.Style = [fsBold]
                              ParentFont = False
                            end
                            object lbPrecoCombinarEC: TLabel
                              Left = 174
                              Top = 37
                              Width = 105
                              Height = 13
                              Alignment = taRightJustify
                              Caption = 'Pre'#231'o a Combinar:'
                              Font.Charset = DEFAULT_CHARSET
                              Font.Color = clWindowText
                              Font.Height = -11
                              Font.Name = 'MS Sans Serif'
                              Font.Style = [fsBold]
                              ParentFont = False
                            end
                            object DBEditDescrEC: TDBEdit
                              Left = 116
                              Top = 8
                              Width = 550
                              Height = 21
                              DataField = 'DESCR_KIT_RES'
                              DataSource = dtmProdutos.dsKitsEC
                              TabOrder = 0
                            end
                            object DBComboBoxPromoEC: TDBComboBox
                              Left = 445
                              Top = 34
                              Width = 53
                              Height = 21
                              Style = csDropDownList
                              DataField = 'PROMOCIONAL'
                              DataSource = dtmProdutos.dsKitsEC
                              ItemHeight = 13
                              Items.Strings = (
                                'SIM'
                                'N'#195'O')
                              TabOrder = 4
                            end
                            object DBComboBoxFreteGratisEC: TDBComboBox
                              Left = 613
                              Top = 34
                              Width = 53
                              Height = 21
                              Style = csDropDownList
                              DataField = 'FRETE_GRATIS'
                              DataSource = dtmProdutos.dsKitsEC
                              ItemHeight = 13
                              Items.Strings = (
                                'SIM'
                                'N'#195'O')
                              TabOrder = 5
                            end
                            object DBComboBoxLancEC: TDBComboBox
                              Left = 773
                              Top = 34
                              Width = 53
                              Height = 21
                              Style = csDropDownList
                              DataField = 'LANCAMENTO'
                              DataSource = dtmProdutos.dsKitsEC
                              ItemHeight = 13
                              Items.Strings = (
                                'SIM'
                                'N'#195'O')
                              TabOrder = 6
                            end
                            object DBComboBoxTermAceiteEC: TDBComboBox
                              Left = 116
                              Top = 61
                              Width = 53
                              Height = 21
                              Style = csDropDownList
                              DataField = 'TERMOS_ACEITE'
                              DataSource = dtmProdutos.dsKitsEC
                              ItemHeight = 13
                              Items.Strings = (
                                'SIM'
                                'N'#195'O')
                              TabOrder = 7
                            end
                            object DBComboBoxCompreJuntoEC: TDBComboBox
                              Left = 283
                              Top = 61
                              Width = 53
                              Height = 21
                              Style = csDropDownList
                              DataField = 'COMPREJUNTO'
                              DataSource = dtmProdutos.dsKitsEC
                              ItemHeight = 13
                              Items.Strings = (
                                'SIM'
                                'N'#195'O')
                              TabOrder = 8
                            end
                            object DBComboBoxVirtualEC: TDBComboBox
                              Left = 445
                              Top = 61
                              Width = 53
                              Height = 21
                              Style = csDropDownList
                              DataField = 'VIRTUAL'
                              DataSource = dtmProdutos.dsKitsEC
                              ItemHeight = 13
                              Items.Strings = (
                                'SIM'
                                'N'#195'O')
                              TabOrder = 9
                            end
                            object DBComboBoxSincEC: TDBComboBox
                              Left = 773
                              Top = 8
                              Width = 53
                              Height = 21
                              Style = csDropDownList
                              DataField = 'SINC_ECOMMERCE'
                              DataSource = dtmProdutos.dsKitsEC
                              ItemHeight = 13
                              Items.Strings = (
                                'SIM'
                                'N'#195'O')
                              TabOrder = 1
                            end
                            object DBLookupComboBoxCategoria: TDBLookupComboBox
                              Left = 116
                              Top = 89
                              Width = 710
                              Height = 21
                              DataField = 'COD_CATEGORIA'
                              DataSource = dtmProdutos.dsKitsEC
                              KeyField = 'COD_CATEGORIA'
                              ListField = 'DESCRICAO2'
                              ListSource = dtmProdutos.dsConsCategoriaKit
                              TabOrder = 11
                            end
                            object DBComboBoxDestaqueEC: TDBComboBox
                              Left = 613
                              Top = 61
                              Width = 53
                              Height = 21
                              Style = csDropDownList
                              DataField = 'DESTAQUE'
                              DataSource = dtmProdutos.dsKitsEC
                              ItemHeight = 13
                              Items.Strings = (
                                'SIM'
                                'N'#195'O')
                              TabOrder = 10
                            end
                            object DBComboBoxDispEC: TDBComboBox
                              Left = 116
                              Top = 34
                              Width = 53
                              Height = 21
                              Style = csDropDownList
                              DataField = 'DISPONIVEL'
                              DataSource = dtmProdutos.dsKitsEC
                              ItemHeight = 13
                              Items.Strings = (
                                'SIM'
                                'N'#195'O')
                              TabOrder = 2
                            end
                            object DBEditCodReferencia: TDBEdit
                              Left = 116
                              Top = 116
                              Width = 295
                              Height = 21
                              DataField = 'REFERENCIA'
                              DataSource = dtmProdutos.dsKitsEC
                              TabOrder = 12
                            end
                            object DBEditCodEAN: TDBEdit
                              Left = 526
                              Top = 116
                              Width = 300
                              Height = 21
                              DataField = 'COD_EAN'
                              DataSource = dtmProdutos.dsKitsEC
                              TabOrder = 13
                            end
                            object DBEditPeso: TDBEdit
                              Left = 116
                              Top = 195
                              Width = 90
                              Height = 21
                              DataField = 'PESO_BRUT_KIT'
                              DataSource = dtmProdutos.dsKitsEC
                              TabOrder = 17
                            end
                            object DBEditComprimento: TDBEdit
                              Left = 339
                              Top = 195
                              Width = 90
                              Height = 21
                              DataField = 'COMPRIMENTO_KIT'
                              DataSource = dtmProdutos.dsKitsEC
                              TabOrder = 18
                              OnKeyPress = DBEditComprimentoKeyPress
                            end
                            object DBEditAltura: TDBEdit
                              Left = 526
                              Top = 195
                              Width = 90
                              Height = 21
                              DataField = 'ALTURA_KIT'
                              DataSource = dtmProdutos.dsKitsEC
                              TabOrder = 19
                              OnKeyPress = DBEditAlturaKeyPress
                            end
                            object DBEditLargura: TDBEdit
                              Left = 736
                              Top = 195
                              Width = 90
                              Height = 21
                              DataField = 'LARGURA_KIT'
                              DataSource = dtmProdutos.dsKitsEC
                              TabOrder = 20
                              OnKeyPress = DBEditLarguraKeyPress
                            end
                            object DBComboBoxRegra: TDBComboBox
                              Left = 116
                              Top = 169
                              Width = 710
                              Height = 21
                              Style = csDropDownList
                              DataField = 'REGRA_PESO_DIM'
                              DataSource = dtmProdutos.dsKitsEC
                              ItemHeight = 13
                              Items.Strings = (
                                'Usar a soma dos pesos e dimens'#245'es dos produtos'
                                'Cadastrar peso e dimens'#245'es espec'#237'ficas para o kit'
                                
                                  'Usar a soma dos pesos e cadastrar dimens'#245'es espec'#237'ficas para o k' +
                                  'it')
                              TabOrder = 16
                              OnExit = DBComboBoxRegraExit
                            end
                            object DBEditDescValor: TDBEdit
                              Left = 116
                              Top = 143
                              Width = 90
                              Height = 21
                              DataField = 'DESCONTO_VALOR'
                              DataSource = dtmProdutos.dsKitsEC
                              TabOrder = 14
                              OnExit = DBEditDescValorExit
                            end
                            object DBEditDescPerc: TDBEdit
                              Left = 321
                              Top = 143
                              Width = 90
                              Height = 21
                              DataField = 'DESCONTO_PERC'
                              DataSource = dtmProdutos.dsKitsEC
                              TabOrder = 15
                              OnExit = DBEditDescPercExit
                            end
                            object DBComboBoxPrecoCombinarEC: TDBComboBox
                              Left = 283
                              Top = 32
                              Width = 53
                              Height = 21
                              Style = csDropDownList
                              DataField = 'COMPREJUNTO'
                              DataSource = dtmProdutos.dsKitsEC
                              ItemHeight = 13
                              Items.Strings = (
                                'SIM'
                                'N'#195'O')
                              TabOrder = 3
                            end
                          end
                        end
                      end
                      object TabSheetEC2: TTabSheet
                        Caption = 'TabSheetEC2'
                        ImageIndex = 1
                        ExplicitLeft = 0
                        ExplicitTop = 0
                        ExplicitWidth = 0
                        ExplicitHeight = 0
                        object ScrollBox10: TScrollBox
                          Left = 0
                          Top = 0
                          Width = 852
                          Height = 248
                          Align = alClient
                          BevelInner = bvNone
                          BevelOuter = bvNone
                          BorderStyle = bsNone
                          Ctl3D = True
                          ParentCtl3D = False
                          TabOrder = 0
                          object Panel91: TPanel
                            Left = 0
                            Top = 0
                            Width = 852
                            Height = 248
                            Align = alClient
                            BevelOuter = bvNone
                            TabOrder = 0
                            object pnCategoriasEC: TPanel
                              Left = 380
                              Top = 0
                              Width = 472
                              Height = 248
                              Align = alRight
                              BevelOuter = bvNone
                              TabOrder = 1
                              object Splitter9: TSplitter
                                Left = 230
                                Top = 20
                                Height = 228
                                ExplicitLeft = 462
                                ExplicitTop = 1
                                ExplicitHeight = 128
                              end
                              object Panel93: TPanel
                                Left = 0
                                Top = 20
                                Width = 230
                                Height = 228
                                Align = alLeft
                                BevelOuter = bvNone
                                Padding.Bottom = 1
                                TabOrder = 0
                                object TreeViewCat: TTreeView
                                  Left = 0
                                  Top = 40
                                  Width = 230
                                  Height = 187
                                  Align = alClient
                                  BevelInner = bvNone
                                  BevelOuter = bvNone
                                  Indent = 19
                                  TabOrder = 0
                                  OnDblClick = TreeViewCatDblClick
                                end
                                object Panel94: TPanel
                                  Left = 0
                                  Top = 25
                                  Width = 230
                                  Height = 15
                                  Align = alTop
                                  BevelKind = bkTile
                                  BevelOuter = bvNone
                                  Caption = 'Duplo clique para adicionar'
                                  TabOrder = 1
                                end
                                object Panel95: TPanel
                                  Left = 0
                                  Top = 0
                                  Width = 230
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
                              object Panel96: TPanel
                                Left = 233
                                Top = 20
                                Width = 239
                                Height = 228
                                Align = alClient
                                BevelOuter = bvNone
                                Padding.Bottom = 1
                                TabOrder = 1
                                object TreeViewCatDB: TTreeView
                                  Left = 0
                                  Top = 40
                                  Width = 239
                                  Height = 187
                                  Align = alClient
                                  BevelInner = bvNone
                                  BevelOuter = bvNone
                                  Indent = 19
                                  TabOrder = 0
                                  OnDblClick = TreeViewCatDBDblClick
                                end
                                object Panel100: TPanel
                                  Left = 0
                                  Top = 25
                                  Width = 239
                                  Height = 15
                                  Align = alTop
                                  BevelKind = bkTile
                                  BevelOuter = bvNone
                                  Caption = 'Duplo clique para remover'
                                  TabOrder = 1
                                end
                                object Panel117: TPanel
                                  Left = 0
                                  Top = 0
                                  Width = 239
                                  Height = 25
                                  Align = alTop
                                  BevelKind = bkTile
                                  BevelOuter = bvNone
                                  Caption = 'Adicionais'
                                  Font.Charset = DEFAULT_CHARSET
                                  Font.Color = clWindowText
                                  Font.Height = -11
                                  Font.Name = 'Tahoma'
                                  Font.Style = [fsBold]
                                  ParentFont = False
                                  TabOrder = 2
                                end
                              end
                              object Panel103: TPanel
                                Left = 0
                                Top = 0
                                Width = 472
                                Height = 20
                                Align = alTop
                                BevelKind = bkTile
                                BevelOuter = bvNone
                                TabOrder = 2
                                object Label430: TLabel
                                  Left = 6
                                  Top = 1
                                  Width = 61
                                  Height = 13
                                  Alignment = taRightJustify
                                  Caption = 'Categorias'
                                  Font.Charset = DEFAULT_CHARSET
                                  Font.Color = clWindowText
                                  Font.Height = -11
                                  Font.Name = 'MS Sans Serif'
                                  Font.Style = [fsBold]
                                  ParentFont = False
                                end
                              end
                            end
                            object pnImagemEC: TPanel
                              Left = 0
                              Top = 0
                              Width = 380
                              Height = 248
                              Align = alClient
                              BevelOuter = bvNone
                              TabOrder = 0
                              object Panel98: TPanel
                                Left = 0
                                Top = 0
                                Width = 380
                                Height = 20
                                Align = alTop
                                BevelKind = bkTile
                                BevelOuter = bvNone
                                TabOrder = 0
                                object Label426: TLabel
                                  Left = 7
                                  Top = 1
                                  Width = 52
                                  Height = 13
                                  Caption = 'Imagens:'
                                  Font.Charset = DEFAULT_CHARSET
                                  Font.Color = clWindowText
                                  Font.Height = -11
                                  Font.Name = 'MS Sans Serif'
                                  Font.Style = [fsBold]
                                  ParentFont = False
                                end
                                object lbS_qtdeImgProdEC: TLabel
                                  Left = 329
                                  Top = 0
                                  Width = 29
                                  Height = 18
                                  Align = alRight
                                  Alignment = taRightJustify
                                  Caption = '1/1'
                                  Font.Charset = DEFAULT_CHARSET
                                  Font.Color = clBlue
                                  Font.Height = -15
                                  Font.Name = 'Tahoma'
                                  Font.Style = [fsBold]
                                  ParentFont = False
                                end
                                object Panel112: TPanel
                                  Left = 358
                                  Top = 0
                                  Width = 18
                                  Height = 16
                                  Align = alRight
                                  BevelOuter = bvNone
                                  TabOrder = 0
                                end
                              end
                              object pnImagemProdutoEC: TPanel
                                Left = 0
                                Top = 20
                                Width = 380
                                Height = 228
                                Align = alClient
                                BevelKind = bkTile
                                BevelOuter = bvNone
                                BorderWidth = 5
                                TabOrder = 1
                                object Panel57: TPanel
                                  Left = 5
                                  Top = 5
                                  Width = 40
                                  Height = 214
                                  Align = alLeft
                                  BevelOuter = bvNone
                                  TabOrder = 0
                                  object SpeedButton48: TSpeedButton
                                    Left = 6
                                    Top = 23
                                    Width = 23
                                    Height = 22
                                    Hint = 'Adicionar Imagem - [PRO405]'
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
                                    OnClick = SpeedButton48Click
                                  end
                                  object SpeedButton49: TSpeedButton
                                    Left = 6
                                    Top = 92
                                    Width = 23
                                    Height = 22
                                    Hint = 'Pr'#243'xima Imagem - [PRO407]'
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
                                    OnClick = SpeedButton49Click
                                  end
                                  object SpeedButton50: TSpeedButton
                                    Left = 6
                                    Top = 172
                                    Width = 23
                                    Height = 22
                                    Hint = 'Excluir Imagem -  [PRO409]'
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
                                    OnClick = SpeedButton50Click
                                  end
                                  object SpeedButton51: TSpeedButton
                                    Left = 6
                                    Top = 120
                                    Width = 23
                                    Height = 22
                                    Hint = 'Imagem Anterior - [PRO408]'
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
                                    OnClick = SpeedButton51Click
                                  end
                                  object SpeedButton52: TSpeedButton
                                    Left = 6
                                    Top = 56
                                    Width = 23
                                    Height = 22
                                    Hint = 'Visualizar Imagem - [PRO406]'
                                    Glyph.Data = {
                                      46050000424D460500000000000036040000280000000F000000110000000100
                                      08000000000010010000D30E0000D30E00000001000000010000DE7B1000E784
                                      1000BD6B18006331210084522100BD7321007B4A2900C6842900B56B4200B573
                                      4A0094735200635A5A0094735A007363630094736300AD8C63007B736B008473
                                      6B008C736B00947B6B00A5846B00946B73009C6B73009C737300847B73008C7B
                                      7300D6947300A5847B00BD948400BD9C8400E7BD84008C8C8C00948C8C00A58C
                                      8C00B59C9400BDAD9400EFC694009C9C9C00D6BD9C00EFCE9C00F7D69C00A5A5
                                      A500ADADA500D6BDA500D6C6A500E7C6A500DECEA500EFCEA500EFD6A500B5AD
                                      AD00D6BDAD00DEC6AD00DECEAD00DED6AD00E7D6AD00EFDEAD006394B500A5AD
                                      B500B5B5B500BDB5B500F7EFB500BDB5BD00C6B5BD00BDBDBD00CEBDBD00C6C6
                                      BD00D6C6BD00DEDEBD00E7DEBD00E7E7BD00EFE7BD00FFEFBD009CB5C600DECE
                                      C600DEE7C600F7F7C6006B84CE00C6C6CE00DEE7CE00F7F7CE00FFFFCE007384
                                      D6008CBDD600ADC6D600C6C6D600C6CED600CECED600EFF7D6006B8CDE007B94
                                      DE00BDD6DE00C6D6DE00C6DEDE00CEDEDE00DEE7DE00EFF7DE00C6D6E700CED6
                                      E700CEDEE700CEE7E700E7E7E700CEE7EF00FFFFEF00D6EFF700DEF7F700EFF7
                                      F700FF00FF0029B5FF0042B5FF0039BDFF00A5E7FF00CEEFFF00D6EFFF00D6F7
                                      FF00DEF7FF00E7F7FF00DEFFFF00E7FFFF00F7FFFF00FFFFFF00FFFFFF00FFFF
                                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF006A6A6A6A6A6A
                                      6A6A6A6A6A6A6A6A6A003A102A6A6A6A6A6A6A6A6A6A6A6A6A00535916256A6A
                                      6A6A6A6A6A6A6A6A6A006E6C5117296A6A6A6A6A6A6A6A6A6A006A6E6D58153F
                                      6A6A6A6A6A6A6A6A6A005656386B4C0B2011190D1F3F3A3A6A0009090852481C
                                      476677771B031A066A0027757568402F4B4F5F76771871136A001E6F5B552B36
                                      2E4A5E64662339126A001E6F5B55322E2C434A4E5726390E6A001E6F5B5B3245
                                      34354344501D5B0E6A001E705D5D41496944303C2721760C6A001E6F5B5B5B3B
                                      4236302D225B770C6A001E70616262654D313D4D6772770C6A00247165656767
                                      677271706768770C6A0002050505050505050507070714046A00000101010101
                                      010101010101010F6A00}
                                    OnClick = SpeedButton52Click
                                  end
                                end
                                object Panel55: TPanel
                                  Left = 45
                                  Top = 5
                                  Width = 326
                                  Height = 214
                                  Align = alClient
                                  BevelOuter = bvNone
                                  TabOrder = 1
                                  object Panel110: TPanel
                                    Left = 0
                                    Top = 0
                                    Width = 326
                                    Height = 214
                                    Align = alClient
                                    BevelOuter = bvNone
                                    TabOrder = 0
                                    object Image1: TImage
                                      Left = 0
                                      Top = 48
                                      Width = 326
                                      Height = 166
                                      Align = alClient
                                      Center = True
                                      OnDblClick = Image1DblClick
                                      ExplicitLeft = 152
                                      ExplicitWidth = 302
                                      ExplicitHeight = 152
                                    end
                                    object pnEscolherGradeImage: TPanel
                                      Left = 0
                                      Top = 0
                                      Width = 326
                                      Height = 19
                                      Align = alTop
                                      BevelOuter = bvNone
                                      TabOrder = 0
                                      object lbDescrGradeImg: TLabel
                                        Left = 0
                                        Top = 0
                                        Width = 9
                                        Height = 13
                                        Align = alClient
                                        Alignment = taCenter
                                        Caption = '...'
                                        Font.Charset = DEFAULT_CHARSET
                                        Font.Color = clBlack
                                        Font.Height = -11
                                        Font.Name = 'Tahoma'
                                        Font.Style = [fsBold]
                                        ParentFont = False
                                      end
                                    end
                                    object pnDescImagemProduto: TPanel
                                      Left = 0
                                      Top = 19
                                      Width = 326
                                      Height = 29
                                      Align = alTop
                                      BevelKind = bkTile
                                      BevelOuter = bvNone
                                      TabOrder = 1
                                      object pnLabelImagemProduto: TLabel
                                        Left = 6
                                        Top = -2
                                        Width = 282
                                        Height = 28
                                        Caption = 
                                          'Aceito imagens na extens'#227'o JPG e JPEG no tamanho de 350 Kb e 200' +
                                          '0 pixels.'
                                        Font.Charset = DEFAULT_CHARSET
                                        Font.Color = clWindowText
                                        Font.Height = -11
                                        Font.Name = 'Times New Roman'
                                        Font.Style = []
                                        ParentFont = False
                                        WordWrap = True
                                      end
                                    end
                                  end
                                end
                              end
                            end
                          end
                        end
                      end
                      object TabSheetEC3: TTabSheet
                        Caption = 'TabSheetEC3'
                        ImageIndex = 4
                        ExplicitLeft = 0
                        ExplicitTop = 0
                        ExplicitWidth = 0
                        ExplicitHeight = 0
                        object ScrollBox5: TScrollBox
                          Left = 0
                          Top = 0
                          Width = 852
                          Height = 250
                          Align = alTop
                          BevelInner = bvNone
                          BevelOuter = bvNone
                          BorderStyle = bsNone
                          Ctl3D = True
                          ParentCtl3D = False
                          TabOrder = 0
                          object pnTituloPag: TPanel
                            Left = 0
                            Top = 0
                            Width = 852
                            Height = 246
                            Align = alTop
                            BevelOuter = bvNone
                            TabOrder = 0
                            object lbTituloPag: TLabel
                              Left = 13
                              Top = 12
                              Width = 100
                              Height = 13
                              Caption = 'T'#237'tulo da P'#225'gina:'
                              Font.Charset = DEFAULT_CHARSET
                              Font.Color = clWindowText
                              Font.Height = -11
                              Font.Name = 'MS Sans Serif'
                              Font.Style = [fsBold]
                              ParentFont = False
                            end
                            object lbPalavrasChaves: TLabel
                              Left = 13
                              Top = 40
                              Width = 100
                              Height = 13
                              Caption = 'Palavras Chaves:'
                              Font.Charset = DEFAULT_CHARSET
                              Font.Color = clWindowText
                              Font.Height = -11
                              Font.Name = 'MS Sans Serif'
                              Font.Style = [fsBold]
                              ParentFont = False
                            end
                            object lbUrlAcesso: TLabel
                              Left = 20
                              Top = 67
                              Width = 93
                              Height = 13
                              Alignment = taRightJustify
                              Caption = 'URL de Acesso:'
                              Font.Charset = DEFAULT_CHARSET
                              Font.Color = clWindowText
                              Font.Height = -11
                              Font.Name = 'MS Sans Serif'
                              Font.Style = [fsBold]
                              ParentFont = False
                            end
                            object lbPalavrasChavesInf: TLabel
                              Left = 597
                              Top = 39
                              Width = 184
                              Height = 13
                              Caption = '(Separe as palavras por v'#237'rgula)'
                              Font.Charset = DEFAULT_CHARSET
                              Font.Color = clWindowText
                              Font.Height = -11
                              Font.Name = 'MS Sans Serif'
                              Font.Style = [fsBold]
                              ParentFont = False
                            end
                            object DBEditTituloPag: TDBEdit
                              Left = 116
                              Top = 9
                              Width = 658
                              Height = 21
                              DataField = 'TITULO_PAGINA'
                              DataSource = dtmProdutos.dsKitsEC
                              TabOrder = 0
                              OnExit = DBEditTituloPagExit
                            end
                            object DBEditPalavrasChaves: TDBEdit
                              Left = 116
                              Top = 36
                              Width = 478
                              Height = 21
                              DataField = 'PALAVRAS_CHAVES'
                              DataSource = dtmProdutos.dsKitsEC
                              TabOrder = 1
                            end
                            object DBEditURLAcesso: TDBEdit
                              Left = 116
                              Top = 63
                              Width = 658
                              Height = 21
                              DataField = 'URL_ACESSO'
                              DataSource = dtmProdutos.dsKitsEC
                              TabOrder = 2
                              OnExit = DBEditURLAcessoExit
                            end
                          end
                        end
                      end
                      object TabSheetEC4: TTabSheet
                        Caption = 'TabSheetEC4'
                        ImageIndex = 2
                        ExplicitLeft = 0
                        ExplicitTop = 0
                        ExplicitWidth = 0
                        ExplicitHeight = 0
                        object pnGradeVaricaoEC: TPanel
                          Left = 0
                          Top = 0
                          Width = 852
                          Height = 248
                          Align = alClient
                          BevelOuter = bvNone
                          TabOrder = 0
                          object Panel101: TPanel
                            Left = 0
                            Top = 0
                            Width = 852
                            Height = 20
                            Align = alTop
                            BevelKind = bkTile
                            BevelOuter = bvNone
                            TabOrder = 0
                            object Label428: TLabel
                              Left = 7
                              Top = 1
                              Width = 33
                              Height = 13
                              Caption = 'Itens:'
                              Font.Charset = DEFAULT_CHARSET
                              Font.Color = clWindowText
                              Font.Height = -11
                              Font.Name = 'MS Sans Serif'
                              Font.Style = [fsBold]
                              ParentFont = False
                            end
                            object pnSincEcKitItens: TPanel
                              Left = 46
                              Top = 1
                              Width = 203
                              Height = 13
                              BevelOuter = bvNone
                              Caption = 'Itens sincronizados/ a sincronizar'
                              Font.Charset = DEFAULT_CHARSET
                              Font.Color = 16744448
                              Font.Height = -11
                              Font.Name = 'Tahoma'
                              Font.Style = [fsBold]
                              ParentColor = True
                              ParentFont = False
                              TabOrder = 0
                            end
                          end
                          object pnItensEC: TPanel
                            Left = 0
                            Top = 20
                            Width = 852
                            Height = 228
                            Align = alClient
                            BevelOuter = bvNone
                            TabOrder = 1
                            object pnItensLeftEC: TPanel
                              Left = 0
                              Top = 0
                              Width = 36
                              Height = 228
                              Align = alLeft
                              BevelKind = bkTile
                              BevelOuter = bvSpace
                              TabOrder = 0
                              object SpeedButton9: TSpeedButton
                                Left = 5
                                Top = 6
                                Width = 23
                                Height = 22
                                Hint = 'Sincronizar item - [PRO423]'
                                Glyph.Data = {
                                  36050000424D3605000000000000360400002800000010000000100000000100
                                  08000000000000010000120B0000120B0000000100000000000000000000FFFF
                                  FF00FF00FF00A4262600BA414100BB444400BD4A4A00BD4B4B00BF4E4E00C050
                                  5000C0515100C1535300C1545400C55C5C00CB6C6C00CF777700D17D7D00D483
                                  8300004B0000098611000C9C19000A8615000C9518000D931A000F9E1C000F99
                                  1C000E9D1D000F9D1E0011A4220011A02100139224001CB135001CA1340024BC
                                  430029B548002EC6520035CA5E0039D465000000000000000000000000000000
                                  0000000000000000000000000000000000000000000000000000000000000000
                                  0000000000000000000000000000000000000000000000000000000000000000
                                  0000000000000000000000000000000000000000000000000000000000000000
                                  0000000000000000000000000000000000000000000000000000000000000000
                                  0000000000000000000000000000000000000000000000000000000000000000
                                  0000000000000000000000000000000000000000000000000000000000000000
                                  0000000000000000000000000000000000000000000000000000000000000000
                                  0000000000000000000000000000000000000000000000000000000000000000
                                  0000000000000000000000000000000000000000000000000000000000000000
                                  0000000000000000000000000000000000000000000000000000000000000000
                                  0000000000000000000000000000000000000000000000000000000000000000
                                  0000000000000000000000000000000000000000000000000000000000000000
                                  0000000000000000000000000000000000000000000000000000000000000000
                                  0000000000000000000000000000000000000000000000000000000000000000
                                  0000000000000000000000000000000000000000000000000000000000000000
                                  0000000000000000000000000000000000000000000000000000000000000000
                                  0000000000000000000000000000000000000000000000000000000000000000
                                  0000000000000000000000000000000000000000000000000000000000000000
                                  0000000000000000000000000000000000000000000000000000000000000000
                                  0000000000000000000000000000000000000000000000000000000000000000
                                  0000000000000000000000000000000000000000000000000000000000000000
                                  0000000000000000000000000000000000000000000000000000000000000000
                                  0000000000000000000000000000000000000000000000000000000000000000
                                  0000000000000000000000000000000000000000000000000000000000000000
                                  0000000000000000000000000000000000000000000000000000000000000000
                                  0000000000000000000000000000000000000000000000000000000000000000
                                  0000000000000000000000000000000000000000000000000000020202020202
                                  0202020202020202020202020202020202020202020202020202020202020202
                                  0202020202020202020202020202020202020202020202020202020202020212
                                  120202020202020202020202020212181B120202020202020202020202121F1C
                                  141D120202020202020202021223211E12171A12020202020202021224252012
                                  0212151912020202020202021222120202020212161202020202020202120202
                                  0202020212131202020202020202020202020202020212120202020202020202
                                  0202020202020212120202020202020202020202020202020202020202020202
                                  0202020202020202020202020202020202020202020202020202}
                                OnClick = SpeedButton9Click
                              end
                              object SpeedButton13: TSpeedButton
                                Left = 5
                                Top = 34
                                Width = 23
                                Height = 22
                                Hint = 'Remover Sincroniza'#231#227'o do Item - [PRO424]'
                                Glyph.Data = {
                                  36050000424D3605000000000000360400002800000010000000100000000100
                                  08000000000000010000120B0000120B0000000100000000000000000000FFFF
                                  FF00FF00FF00CACACA00C4C4C400BFBFBF00BCBCBC00B8B8B800B5B5B500AEAE
                                  AE00ABABAB00A5A5A500A4A4A4009F9F9F009E9E9E009D9D9D009C9C9C009B9B
                                  9B009A9A9A009999990098989800979797009494940093939300929292008C8C
                                  8C008A8A8A007A7A7A0065656500000000000000000000000000000000000000
                                  0000000000000000000000000000000000000000000000000000000000000000
                                  0000000000000000000000000000000000000000000000000000000000000000
                                  0000000000000000000000000000000000000000000000000000000000000000
                                  0000000000000000000000000000000000000000000000000000000000000000
                                  0000000000000000000000000000000000000000000000000000000000000000
                                  0000000000000000000000000000000000000000000000000000000000000000
                                  0000000000000000000000000000000000000000000000000000000000000000
                                  0000000000000000000000000000000000000000000000000000000000000000
                                  0000000000000000000000000000000000000000000000000000000000000000
                                  0000000000000000000000000000000000000000000000000000000000000000
                                  0000000000000000000000000000000000000000000000000000000000000000
                                  0000000000000000000000000000000000000000000000000000000000000000
                                  0000000000000000000000000000000000000000000000000000000000000000
                                  0000000000000000000000000000000000000000000000000000000000000000
                                  0000000000000000000000000000000000000000000000000000000000000000
                                  0000000000000000000000000000000000000000000000000000000000000000
                                  0000000000000000000000000000000000000000000000000000000000000000
                                  0000000000000000000000000000000000000000000000000000000000000000
                                  0000000000000000000000000000000000000000000000000000000000000000
                                  0000000000000000000000000000000000000000000000000000000000000000
                                  0000000000000000000000000000000000000000000000000000000000000000
                                  0000000000000000000000000000000000000000000000000000000000000000
                                  0000000000000000000000000000000000000000000000000000000000000000
                                  0000000000000000000000000000000000000000000000000000000000000000
                                  0000000000000000000000000000000000000000000000000000000000000000
                                  0000000000000000000000000000000000000000000000000000000000000000
                                  0000000000000000000000000000000000000000000000000000000000000000
                                  0000000000000000000000000000000000000000000000000000020202020202
                                  0202020202020202020202020202020202020202020202020202020202020202
                                  020202020202020202020202020202020202020202020202020202020202021C
                                  1C020202020202020202020202021C03031C02020202020202020202021C0303
                                  03031C0202020202020202021C0503031C03031C020202020202021C0403031C
                                  021C03031C020202020202021C031C020202021C031C020202020202021C0202
                                  020202021C031C0202020202020202020202020202021C1C0202020202020202
                                  020202020202021C1C0202020202020202020202020202020202020202020202
                                  0202020202020202020202020202020202020202020202020202}
                                OnClick = SpeedButton13Click
                              end
                              object SpeedButton14: TSpeedButton
                                Left = 5
                                Top = 102
                                Width = 23
                                Height = 22
                                Hint = 'Sincronizar todos itens - [PRO423]'
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
                                OnClick = SpeedButton14Click
                              end
                              object SpeedButton15: TSpeedButton
                                Left = 5
                                Top = 130
                                Width = 23
                                Height = 22
                                Hint = 'Remover Sincroniza'#231#227'o Item - [PRO424]'
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
                                OnClick = SpeedButton15Click
                              end
                            end
                          end
                        end
                      end
                      object TabSheetEC5: TTabSheet
                        Caption = 'TabSheetEC5'
                        ImageIndex = 3
                        ExplicitLeft = 0
                        ExplicitTop = 0
                        ExplicitWidth = 0
                        ExplicitHeight = 0
                        object pnItensKit: TPanel
                          Left = 0
                          Top = 0
                          Width = 852
                          Height = 248
                          Align = alClient
                          BevelOuter = bvNone
                          TabOrder = 0
                          OnEnter = pnItensKitEnter
                          object GroupBoxItens: TGroupBox
                            Left = 0
                            Top = 206
                            Width = 852
                            Height = 42
                            Align = alBottom
                            ParentBackground = False
                            TabOrder = 0
                            object lbItensKit: TLabel
                              Left = 21
                              Top = 17
                              Width = 148
                              Height = 13
                              Caption = 'Cadastro Sequ'#234'ncial  (F2)'
                              FocusControl = CheckBoxItensKit
                              Font.Charset = ANSI_CHARSET
                              Font.Color = clTeal
                              Font.Height = -11
                              Font.Name = 'MS Sans Serif'
                              Font.Style = [fsBold]
                              ParentFont = False
                              Visible = False
                            end
                            object btnOKItens: TBitBtn
                              Left = 328
                              Top = 11
                              Width = 75
                              Height = 25
                              Hint = 'Salvar Registro - [PRO123]'
                              Caption = '&OK'
                              TabOrder = 0
                              OnClick = btnOKItensClick
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
                            object btnCancItens: TBitBtn
                              Left = 409
                              Top = 11
                              Width = 75
                              Height = 25
                              Hint = 'Cancelar Registro - [PRO124]'
                              Caption = '&Cancela'
                              TabOrder = 1
                              OnClick = btnCancItensClick
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
                            object CheckBoxItensKit: TCheckBox
                              Left = 5
                              Top = 16
                              Width = 15
                              Height = 15
                              BiDiMode = bdLeftToRight
                              Color = clBtnFace
                              Ctl3D = True
                              Font.Charset = DEFAULT_CHARSET
                              Font.Color = clTeal
                              Font.Height = -11
                              Font.Name = 'MS Sans Serif'
                              Font.Style = [fsBold]
                              ParentBiDiMode = False
                              ParentColor = False
                              ParentCtl3D = False
                              ParentFont = False
                              TabOrder = 2
                              Visible = False
                              OnClick = CheckBox2Click
                            end
                          end
                        end
                      end
                    end
                  end
                  object pnButtonAlterDadosEC: TPanel
                    Left = 2
                    Top = 343
                    Width = 872
                    Height = 33
                    Align = alBottom
                    BevelKind = bkTile
                    BevelOuter = bvNone
                    TabOrder = 1
                    object btnAlterarDadosEC: TBitBtn
                      Left = 325
                      Top = 2
                      Width = 183
                      Height = 25
                      Hint = 'Alterar Dados E-Commerce - [PRO411]'
                      Caption = 'Alterar'
                      TabOrder = 0
                      OnClick = btnAlterarDadosECClick
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
                  end
                end
              end
            end
            inherited Panel3: TPanel
              Width = 884
              ExplicitWidth = 884
              inherited BitBtn4: TBitBtn
                Left = 344
                Top = 10
                Hint = 'Salvar Registro - [PRO117]'
                ExplicitLeft = 344
                ExplicitTop = 10
              end
              inherited BitBtn5: TBitBtn
                Left = 425
                Top = 10
                Hint = 'Cancelar Registro - [PRO118]'
                ExplicitLeft = 425
                ExplicitTop = 10
              end
            end
          end
        end
        inherited TabSheet2: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 884
          ExplicitHeight = 510
          inherited GroupBox3: TGroupBox
            Width = 884
            ExplicitWidth = 884
            inherited imgInformation: TImage
              Left = 858
              ExplicitLeft = 822
            end
            object btSelectAll: TSpeedButton [6]
              Left = 604
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
            object btUnSelectAll: TSpeedButton [7]
              Left = 631
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
            inherited BitBtn1: TBitBtn
              Hint = 'Clique para pesquisar - [PRO110]'
            end
            inherited BitBtn3: TBitBtn
              Hint = 'Novo cadastro - [PRO111]'
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
            Width = 884
            ExplicitWidth = 884
            inherited Splitter1: TSplitter
              ExplicitHeight = 376
            end
            inherited DBGrid1: TDBGrid
              Width = 591
              OnCellClick = DBGrid1CellClick
              OnDrawColumnCell = DBGrid1DrawColumnCell
              OnKeyDown = DBGrid1KeyDown
              Columns = <
                item
                  Expanded = False
                  FieldName = 'CODIGO_KIT'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'COD_EMPRESA'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DESCRICAO_KIT'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'KIT_TODO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ATIVO'
                  Visible = True
                end>
            end
            inherited Panel2: TPanel
              Width = 880
              ExplicitWidth = 880
              inherited SpeedButton1: TSpeedButton
                Hint = 'Editar Registro - [PRO112]'
              end
              inherited SpeedButton2: TSpeedButton
                Hint = 'Apagar Registro - [PRO113]'
                OnClick = SpeedButton2Click
              end
              inherited SpeedButton3: TSpeedButton
                Hint = 'Imprimir - [PRO427]'
                OnClick = SpeedButton3Click
              end
              inherited SpeedButton4: TSpeedButton
                OnClick = SpeedButton25Click
              end
              inherited SpeedButton5: TSpeedButton
                Hint = 'Recuperar registro - [PRO115]'
                OnClick = SpeedButton5Click
              end
              inherited SpeedButton6: TSpeedButton
                Hint = 'Incluir Itens no Kit - [PRO119]'
                Glyph.Data = {
                  76060000424D7606000000000000360400002800000018000000180000000100
                  08000000000040020000130B0000130B00000001000000010000CE630000D67B
                  21002184290039B5520063A5630094DE8C00FFD6A500FFDEB500FFEFD600FFF7
                  EF00FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
                  0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A000A0A0A0A0A0A0A0A0A
                  0A0A0A0A0A0A0A0A0A0A0A0A0A0A000A0A0A0A0A00000000000000000A0A0A0A
                  0A0A0A0A0A0A00000000000001090908080706000A0A0A0A0A0A0A0A0A0A000A
                  0A0A0A0A010B0B0B080706000A0A0A0A0A0A0A0A0A0A000A0A0A0A0A01010101
                  010101000A0A0A0A0A0A0A0A0A0A000A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A
                  0A0A0A0A0A0A000A0A0A0A0A00000000000000000A0A0A0A0A0A0A0A0A0A0000
                  0000000001090908080706000A0A0A0A0A0A0A0A0A0A000A0A0A0A0A010B0B0B
                  080706000A0A0A0A0A0A0A0A0A0A000A0A0A0A0A01010101010101000A0A0A0A
                  0A0A0A0A0A0A000A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A000A
                  0A0A0A0A00000000000000000A0A0A0A0A0A0A0A0A0A00000000000001090908
                  080706000A0A0A0A0A0A0A0A0A0A000A0A0A0A0A010B0B0B080706000A0A0A0A
                  0A0A0A0A0A0A000A0A0A0A0A01010101010101000A0A0A0A0A0A0A0A0A0A000A
                  0A0A0A0A0A0A0A0A0A0A0A0202020A0A0A0A0A00000000000000000A0A0A0A0A
                  0A0A0A0204020A0A0A0A0A01090908080706000A0A0A0A0A0A02020203020202
                  0A0A0A010B0B0B080706000A0A0A0A0A0A020503030304020A0A0A0101010101
                  0101000A0A0A0A0A0A020202030202020A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A
                  0A0A0A0205020A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0202020A0A
                  0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A}
                OnClick = SpeedButton6Click
              end
              inherited SpeedButton7: TSpeedButton
                Enabled = False
              end
              inherited SpeedButton8: TSpeedButton
                Left = 748
                Top = 6
                Enabled = False
                Glyph.Data = {
                  06120000424D0612000000000000360000002800000028000000260000000100
                  180000000000D011000000000000000000000000000000000000BFFEFEFEFEFE
                  FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
                  FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
                  FEFEFEFEFEFEFEFEFEFEFEFEFEFEFBFBFB9C9C9C969696EDEDEDFEFEFEFEFEFE
                  FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEBFFEFEFEFEFEFEFEFEFEFEFEFEFE
                  FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
                  FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
                  FEFEFEFEFEFEE9E9E9AAAAAAADADADE4E4E4FEFEFEFEFEFEFEFEFEFEFEFEFEFE
                  FEFEFEFEFEFEFEFEFEFEBFFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
                  FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
                  FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFDFDFDEFEF
                  EF656565C8C8C8FCFCFCFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
                  FEFEBFFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
                  FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
                  FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFDFDFDF2F2F2717171F4F4F4FCFCFCFB
                  FBFBFCFCFCFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEBFFEFEFEFEFE
                  FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFAFAFAF9FAF9FCFCFBFBFDFCFBFDFCFDFD
                  FDFDFDFDFEFEFDFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFDFDFDFA
                  FAFADBDBDBADADAD7A7A7A3A3A3A5E5E5EBEBEBE909090A1A1A1B3B3B3FDFDFD
                  FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEBFFEFEFEFEFEFEFEFEFEFEFEFCFC
                  FCFCFCFCFEFEFEB8B8B817171E2F2E319E9EBCA8A8B67C7C7C959595EDECEFE1
                  E1E1E5E5E5F6F6F6FBFBFBFBFBFBFCFCFCFDFDFDB4B4B42B2B2B0E0E0E2A2A2A
                  3232321C1C1CA4A4A4D3D3D3989898F2F2F2A1A1A1FCFCFCFEFEFEFEFEFEFEFE
                  FEFEFEFEFEFEFEFEFEFEBFFEFEFEFEFEFEFEFEFBFBFBA4A4A49D9D9DE1E1E1F4
                  F6F72121D30808C90807E50B08C10908790808653533DD22237105051C121126
                  9D9CE95656645455556E6D6D5857589E9D9DF7F7F9D6D7D6565555949595FBFB
                  FBFCFCFBDADADAA8A8A8F2F3F4FEFDFDFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
                  FEFEF4D3D3C0C0C0FBFBFBFCFCFCA0A0A0F7F7F7A2A2A2AAACAD0D0DB00302FB
                  0202FC0301FB0301FC0302FB0302FB0402F90606F00A08E80304F30908C40908
                  A50B098B0807701716844242E107062A0203154C4A769596CA474749606060BD
                  BEC4E4E5E8BBBCBCFBFBFBFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE68A1A1D1D1D1
                  AFAFAFFCFCFC9D9D9D959595E9E8E96364630A09910202FB0402FE0302FE0301
                  FE0401FE0402FE0302FE0401FD0301FD0201FC0301FD0301FD0301FE0302FB04
                  02FB0401FC0603F70806EF0505F00605EB0A09AE0A0895100EC71919AD414142
                  FCFCFCFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE6BADAD9B9B9B747474E2E2E2BEBE
                  BEC4C4C4FCFBFB505054090AAB0201FC0301FE0301FE0301FE0301FE0301FE03
                  01FE0301FE0301FE0301FE0301FE0301FE0301FE0301FE0301FE0301FE0301FE
                  0301FD0301FD0202FC0302FC0302FB0202FB090A9F5B5B5BFDFDFDFEFEFEFEFE
                  FEFEFEFEFEFEFEFEFEFE7FFDFDFDFDFDF9F9F97C7C7C3F3F3F909090FAFAFCA9
                  AAE50704F10201FD0401FE0301FE0301FE0301FE0301FE0301FE0301FE0301FE
                  0301FE0301FE0301FE0301FE0301FE0301FE0301FE0301FE0301FE0301FE0401
                  FE0301FE0302FE0201FC0B09D7CBCDD2FDFDFDFEFEFEFEFEFEFEFEFEFEFEFEFE
                  FEFEBFFEFEFEFEFEFDFDFDFAFAFA5353530707075D5E5E3130490707E80302FB
                  0301FE0301FE0301FE0301FE0301FE0301FE0301FE0301FE0301FE0301FE0301
                  FE0301FE0301FE0301FE0301FE0301FE0301FE0301FE0301FE0301FE0301FE02
                  02F81211A0CAC9CBFDFDFDFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEBFFEFEFEFEFE
                  FEFEFEFDFDFD8A8A8A3737378A898A0303100707EE0401FC0301FE0301FE0301
                  FE0301FE0402FC0402FC0302FA0302FB0302FE0301FE0301FE0301FE0301FE03
                  01FE0301FE0301FE0301FE0301FE0301FE0301FE0301FE0202F708094DAAAAA9
                  FDFDFDFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEBFFEFEFEFEFEFEFEFEFEFEFEBBBB
                  BB1D1D1DE4E3E31B1A4B0504F40401FD0301FE0301FE0301FE0302FE0302FB46
                  48E87A7BEA1411F10301FE0301FE0301FE0301FE0301FE0301FE0301FE0301FE
                  0301FE0301FE0301FE0301FE0301FE0202F70A083EC2C2C4FDFEFEFEFEFEFEFE
                  FEFEFEFEFEFEFEFEFEFEBFFEFEFEFEFEFEFEFEFEFEFEEBEBEB060606F2F1F146
                  44E50202F80301FE0301FE0301FE0301FE0301FE0202FB1515EBDFE0F38B8EEC
                  0303F60302FD0302FC0506F34C4BEB7577EC6B6AEC3837EC0404F30301FB0302
                  FE0301FE0301FC0201F85D60DCF7F6F5FDFEFDFEFEFEFEFEFEFEFEFEFEFEFEFE
                  FEFEBFFEFEFEFEFEFEFEFEFEFEFEFDFDFD4646468282830B0B610202F80301FE
                  0301FE0301FE0301FE0301FE0301FD0202F9595AEAF1F4F73535EA0202FA0403
                  F69B9DEBF1F3F8A9A9ECAAA9ECE8EBF6ADAFEE0B0AF10301FD0302FE0301FC08
                  07ED2C2C52F9FAFAFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEBFFEFEFEFEFE
                  FEFEFEFEFEFEFDFDFDD7D7D75D5C5D0909690302F90401FE0301FE0301FE0301
                  FE0301FE0402FE0302FD0403F3B5B7EEC3C4F10607F12122EAF7F7F97A7BE804
                  03F70203F63736E7F7F8F85B5CEC0201FD0301FE0202FD0A09D71B1B1FFCFCFC
                  FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEBFFEFEFEFEFEFEFEFEFEFEFEFEFE
                  FEFDFDFD716F6F0A08890200FC0301FE0301FE0301FE0302FC0301FC0401FC04
                  02FC0302FB2829EAEEEFF76A69EA3A3BEEF7F8F84B4BEA0402FA0202FA100FEB
                  F6F6FA7874ED0201FD0301FE0302FA0B09CA474551F9FCFBFEFEFEFEFEFEFEFE
                  FEFEFEFEFEFEFEFEFEFEBFFEFEFEFEFEFEFEFEFEFEFEFEFEFEFDFDFD67646B09
                  08A80301FE0301FE0301FE0300FD0E0DF07B7CECB4B3ECB2B1EC8285EB2626E9
                  7E7FE9E5E8F42D2DDFE6E8F5A1A4EB0F10EA0704EF6566E7F8F8F84647EC0201
                  FD0301FE0302FC0606F0CAC9EFFCFCFCFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
                  FEFEBFFEFEFEFEFEFEFEFEFEFEFEFEFEFEFDFDFDB7B5EC0505F30301FE0301FE
                  0301FE0303F69EA1EBECECF67172E95D5EECAFB0EDEBEBF63C3EE1D3D3F2A2A2
                  EB3F3FE4CCCAF0EDEFFAE1E4F5F2F5F99898EA0504F40300FD0301FE0302FB0C
                  089778787CFCFCFBFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEBFFEFEFEFEFE
                  FEFEFEFEFEFEFEFEFEFBFBFB3432400909DE0301FE0301FE0302FD0A0BEEF0F2
                  F78687EA0202F80202FA0908ECE4E5F39595EB4545E9F5F6FA4748E70404F21F
                  1EEB3132EC1D1BEC0304F50201FB0301FE0301FE0302FB080974848484FCFBFC
                  FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEBFFEFEFEFEFEFEFEFEFEFEFEFEFE
                  FEFAFAFA0807100B0AE70301FE0301FE0302FE0F0EEEF4F5F97778EA0202FA03
                  01FC0606EEE4E5F4999AEC0204F49EA3EBD3D4F20C0DEE0301FC0502FD0302FD
                  0301FE0301FE0301FE0301FE0301FC0A095A676767E1E1E1FEFEFEFEFEFEFEFE
                  FEFEFEFEFEFEFEFEFEFEBFFEFEFEFEFEFEFEFEFEFEFEFEFEFEEEEFEE25255507
                  06F20301FE0301FE0301FD0303F4A7A9ECDFDFF55558E82E2EEB7E7EE9F6F8F7
                  5455EA0302FB1C1DEAE7E7F47F81E90302F80301FD0402FE0301FE0301FE0401
                  FE0401FD0203F60D0A518181815B5B5BFBFBFBFEFEFEFEFEFEFEFEFEFEFEFEFE
                  FEFEBFFEFEFEFEFEFEFEFEFEFEFEFDFDFDF5F6F64F4EDD0203F80301FE0301FE
                  0302FE0301FC0D0DF07877E9C3C5EFE1E2F7D1D3F37073E80404F30202FB0301
                  FA6968EAEDEFF8292AE90301FD0301FE0301FE0301FE0401FE0401FD0301F95A
                  59E4DFDFDF0C0C0CF8F8F8FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEBFFEFEFEFEFE
                  FEFEFEFEFEFEFEFEFEB0B0B00B08510201FB0301FE0301FE0301FE0401FE0200
                  FD0200FC0503F70403F10304F30202FA0201FC0302FD0202FD0706F2B4B5EEAA
                  ADEF0403F60201FC0301FE0301FE0301FE0301FE0808EF1C1B3EF1F1F10A0A0A
                  D1D1D1FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEBFFEFEFEFEFEFEFEFEFEFEFEFDFD
                  FD9494940907650301FA0301FE0301FE0301FE0301FE0301FE0301FE0301FE03
                  01FE0301FE0301FD0301FE0301FE0302FD0201FC0403F50E0DEB0403F80202FC
                  0301FE0301FE0301FE0301FE0909E004030A9999992626269F9F9FFDFDFDFEFE
                  FEFEFEFEFEFEFEFEFEFEBFFEFEFEFEFEFEFEFEFEFEFEFCFDFDB9B8BD0D0AAD02
                  02F90301FE0301FE0301FE0301FE0301FE0301FE0301FE0301FE0302FE0301FE
                  0301FE0301FE0301FE0302FE0301FE0301FD0301FE0301FE0301FE0301FE0301
                  FE0301FE0A08D93D3D4E535353040404676767FCFCFCFEFEFEFEFEFEFEFEFEFE
                  FEFEBFFEFEFEFEFEFEFEFEFEFEFEFCFDFDBAB9C90908DD0401FA0301FE0301FE
                  0301FE0301FE0301FE0301FE0301FE0301FE0301FE0301FE0301FE0301FE0301
                  FE0301FE0301FE0301FE0301FE0301FE0301FE0301FE0301FE0301FD0706EEBC
                  BDE9FBFBFB797979454545888888FBFBFBFDFDFDFDFDFDFEFEFEBFFEFEFEFEFE
                  FEFEFEFEFEFEFDFDFC4545460708AE0202F90202FD0302FD0202FC0202FC0302
                  FC0302FC0301FE0301FE0301FE0302FD0301FE0301FE0301FE0301FE0301FE03
                  01FE0301FE0301FE0301FE0301FE0301FE0301FD090899666567FDFDFDAFAFAF
                  D4D4D4D6D6D67373739D9D9DB4B4B4FCFCFCBFFEFEFEFEFEFEFEFEFEFEFEFDFD
                  FC2D2D2F1A1ABE0E0CC10A08990B09B00605EB0706EC0807ED0403F60202F902
                  02F80202F80201FB0301FE0301FE0301FE0301FE0301FE0301FE0301FE0301FE
                  0401FE0301FE0301FE0201FD0A097B797979E1E1E18A8A8AAFAFAFFCFCFCA3A3
                  A3DEDEDE9F9F9FFAFAFABFFEFEFEFEFEFEFEFEFEFEFEFDFDFDB4B4B4EDEDF1B4
                  B4B85F5E5F4545469C9CD93F3D66020316100E394340E513127B0A097009088C
                  0908A80908CB0303F80908E80706F20403F70102F80301FB0302FA0301F90301
                  FB0202F91615A5B9B8B9A1A1A1F9F9F99F9F9FFDFDFDFCFCFCBABABAD9D9D9FD
                  FDFDBFFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEEEEEEEA6A6A6E0E0E0FCFCFC
                  FAFBFA80807F686768D9D9DAF5F5F59493925756566F6D6D5353535F5F719494
                  E1090A1A05051D2727832F2DD309096609097E0809C90606E20908CB3435D4F7
                  F7F7D7D7D7A0A0A0AAAAAAFDFDFDFEFEFEFEFEFEFEFEFEFEFEFEBFFEFEFEFEFE
                  FEFEFEFEFEFEFEFEFEFDFDFD9D9D9DF5F5F5969696CFCFCFA1A1A11211113737
                  372828280D0D0D323233C1C1C1FCFCFCFDFDFDFCFCFCFCFCFBF5F5F5E3E3E3E4
                  E4E4E5E6E69494947A7978AEB0C29090AB2C2D3016161CCBCBCAFDFDFDFBFBFB
                  FDFDFDFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEBFFEFEFEFEFEFEFEFEFEFEFEFEFE
                  FEFDFDFDAAAAAAA2A2A2939393BDBDBD4E4E4E4343437F7F7FB0B0B0E0E0E0FC
                  FCFCFDFDFDFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFDFDFDFDFDFDFDFDFD
                  FBFDFDFBFCFCFCFDFBFCFDFBFBFBFBFCFCFCFEFEFEFEFEFEFEFEFEFEFEFEFEFE
                  FEFEFEFEFEFEFEFEFEFEBFFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFCFCFCFA
                  FAFAFCFCFCEFEFEF707070F7F7F7FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
                  FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
                  FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
                  FEFEBFFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFBFBFBBDBDBD6A6A6A
                  F5F5F5FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
                  FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
                  FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEBFFEFEFEFEFE
                  FEFEFEFEFEFEFEFEFEFEFEFEFEFEFED3D3D3BCBCBC9C9C9CF9F9F9FDFDFDFEFE
                  FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
                  FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
                  FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEBFFEFEFEFEFEFEFEFEFEFEFEFEFE
                  FEFEFEFEFEFEFEE1E1E1999999A1A1A1FCFCFCFEFEFEFEFEFEFEFEFEFEFEFEFE
                  FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
                  FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
                  FEFEFEFEFEFEFEFEFEFE}
                ExplicitLeft = 748
                ExplicitTop = 6
              end
              inherited SpeedButton11: TSpeedButton
                Enabled = False
              end
              inherited SpeedButton12: TSpeedButton
                Enabled = False
              end
              inherited SpeedButton23: TSpeedButton
                Enabled = False
              end
              inherited SpeedButton24: TSpeedButton
                Enabled = False
              end
              inherited SpeedButton25: TSpeedButton
                Hint = 'Ver registros da lixeira - [PRO116]'
                OnClick = SpeedButton25Click
              end
              inherited SpeedButton26: TSpeedButton
                Enabled = False
              end
              object SpeedButtonECommerce: TSpeedButton
                Left = 348
                Top = 4
                Width = 51
                Height = 45
                Hint = 'E-Commerce - [PRO411]'
                Flat = True
                Glyph.Data = {
                  F6060000424DF606000000000000360000002800000018000000180000000100
                  180000000000C0060000C40E0000C40E00000000000000000000FFFFFFFFFFFF
                  FFFFFFFFFFFFFDFCFC8E817E6655526655526655526655526655526655526655
                  526655526655526655526655525F4D49847774FDFCFCFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFB8B0AF513D3966524E66524E66524E66524E
                  66524E66524E66524E66524E66524E66524E66524E66514E48342FB7AFAEFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA398964C383456423F56
                  423F56423F56423F56423F56423F56423F56423F56423F56423F56423F56423F
                  4F3C379B918EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA398
                  969D9694C6C5C5C6C5C5C6C5C5C6C5C5C6C5C5C6C5C5C6C5C5C6C5C5C6C5C5C6
                  C5C5C6C5C5C6C5C5928A849C918FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFA39896B7B4B3EBEFF0EBEFF0E2E4E59F9993938B82938B82938B
                  82938B829A948DDADCDBEBEFF0EBEFF0A8A49F9C918FFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFA39896B7B4B3EBEFF0EBEFF079725C78910F
                  83A40A83A40A83A40A83A40A7D9B0D645B42EBEFF0EBEFF0A8A49F9C918FFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA39896B7B4B3EBEFF0EB
                  EFF089847169721E7080177080177080177080176D7A1B6E6750EBEFF0EBEFF0
                  A8A49F9C918FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA398
                  96B7B4B3EBEFF0EBEFF0E9EDEEC5C4C4BAB6B6BAB6B6BAB6B6BAB6B6BEBCBCE6
                  EAEBEBEFF0EBEFF0A8A49F9C918FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFA39896B7B4B3EBEFF0EBEFF0EBEFF0D4D5D5C6C5C5C6C5C5B8B5
                  B45C52385A542C79715EE9EDEEEBEFF0A8A49F9C918FFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFA39896B7B4B3EBEFF0EBEFF0BAB6B5674B34
                  83623C83603B48301D809E0B758C0E728419B1ACAAEBEFF0A8A49F9C918FFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA39896B7B4B3EBEFF0EB
                  EFF0A69F9EA5793CDEA84EDDA54F5F49218AB00A6D7E0E789010A39E98EBEFF0
                  A8A49F9C918FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA398
                  96B7B4B3EBEFF0EBEFF0A69F9EA5793CDEA84EDEA84EA7743E5C5119707A135B
                  5037E0E3E3EBEFF0A8A49F9C918FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFA39896B7B4B3EBEFF0EBEFF0A69F9EA5793CDEA84EDEA84EDEA6
                  4ECC904A855934A69E9CEBEFF0EBEFF0A8A49F9C918FFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFA39896B7B4B3EBEFF0EBEFF0A69F9EA5793C
                  C79647DEA84EDEA84EC79647A4783CA69F9EEBEFF0EBEFF0A8A49F9C918FFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA39896B7B4B3EBEFF0EB
                  EFF0A7A09FA4783C664628DEA84EDEA84E664628A3793BA7A09FEBEFF0EBEFF0
                  A8A49F9C918FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA398
                  96B7B4B3EBEFF0EBEFF0D1D1D1624E42412A23624C3E624C3E412A23624E42D2
                  D2D2EBEFF0EBEFF0A8A49F9C918FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFA39896B7B4B3EBEFF0EBEFF0EBEFF0EBEFF06B5C59E9EDEEE9ED
                  EE6B5C59EBEFF0EBEFF0EBEFF0EBEFF0A8A49F9C918FFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFA39896B7B4B3EBEFF0EBEFF0EBEFF0EBEFF0
                  98908F8D83828C828198908FEBEFF0EBEFF0EBEFF0EBEFF0A8A49F9C918FFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA39896B7B4B3EBEFF0EB
                  EFF0EBEFF0EBEFF0EAEEEFB6B2B1B6B2B1EBEFF0EBEFF0EBEFF0EBEFF0EBEFF0
                  A8A49F9C918FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA398
                  96B7B4B3EBEFF0EBEFF0EBEFF0EBEFF0EBEFF0EBEFF0EBEFF0EBEFF0EBEFF0EB
                  EFF0EBEFF0EBEFF0A8A49F9C918FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFA398967567658F84838F84838F84838F84838F84838F84838F84
                  838F84838F84838F84838F84838F84837165609B908EFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFA398964E383459433F59433F59433F513B37
                  4C36324D363257413D4F393558423F59433F59433F59433F48342F9C918FFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB8B0AF523D3966524E66
                  524E66524E584340513C39513C39634E4A543F3B644F4C66524E66524E66514E
                  48342FB6AEADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFC
                  FC8D807D66555266555266555266555266555266555266555266555266555266
                  5552665552604E4A847673FDFCFCFFFFFFFFFFFFFFFFFFFFFFFF}
                ParentShowHint = False
                ShowHint = True
                OnClick = SpeedButtonECommerceClick
              end
            end
          end
        end
        inherited tsMemo: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 884
          ExplicitHeight = 510
        end
        object TabSheet4: TTabSheet
          Caption = 'TabSheet4'
          ImageIndex = 2
          OnShow = TabSheet4Show
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object PageControl2: TPageControl
            Left = 0
            Top = 75
            Width = 884
            Height = 435
            ActivePage = TabSheet5
            Align = alClient
            TabOrder = 0
            object TabSheet5: TTabSheet
              Caption = 'TabSheet5'
              ExplicitLeft = 0
              ExplicitTop = 0
              ExplicitWidth = 0
              ExplicitHeight = 0
              object GroupBox14: TGroupBox
                Left = 0
                Top = 359
                Width = 876
                Height = 48
                Align = alBottom
                ParentBackground = False
                TabOrder = 0
                object BitBtn10: TBitBtn
                  Left = 4
                  Top = 16
                  Width = 75
                  Height = 25
                  Hint = 'Incluir Item no Kit - [PRO120]'
                  Caption = '&Incluir'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                  TabOrder = 0
                  OnClick = BitBtn10Click
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
                object BitBtn11: TBitBtn
                  Left = 84
                  Top = 16
                  Width = 75
                  Height = 25
                  Hint = 'Alterar Item do Kit - [PRO121]'
                  Caption = '&Alterar'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                  TabOrder = 1
                  OnClick = BitBtn11Click
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
                object BitBtn12: TBitBtn
                  Left = 165
                  Top = 16
                  Width = 75
                  Height = 25
                  Hint = 'Deletar Item do Kit - [PRO122]'
                  Caption = '&Deletar'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                  TabOrder = 2
                  OnClick = BitBtn12Click
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
                  Left = 604
                  Top = 16
                  Width = 75
                  Height = 25
                  Caption = '&Voltar'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                  TabOrder = 3
                  OnClick = BitBtn13Click
                  Glyph.Data = {
                    36030000424D3603000000000000360000002800000010000000100000000100
                    18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
                    FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                    FFFF00FFFF00FFFF00FFFF00FFFF00FF6B2A006828005C2300521F004E1E004E
                    1F004E1F004E1F004E1F004F1F004F1F00401800FF00FFFF00FFFF00FF963A00
                    BC4A00B54600AA4200A13F009A3D00983C00993C00993C00993C00993C009F3F
                    007D3100401800FF00FFFF00FFB74800E25800D35200CA4F00C24C00B84800B0
                    4500AD4400AC4300AD4300AD4300B446009F3F004F1F00FF00FFFF00FFC44D00
                    E75B00D95600D15300C94E00CE7328CF8240CA8041C17332B15510A74100AD43
                    00993C004F1F00FF00FFFF00FFCA4F00F36807E96004DE5A01D45300EAB788FE
                    FEFEFEFEFEFEFEFEFEFEFEC47A3DAD4300993C004E1F00FF00FFFF00FFCA4F00
                    F67A1CF06B0CEB6204E15900D85802D35C09CB5C0BC55B0EDDA674FEFEFEAD43
                    00993C004E1F00FF00FFFF00FFCA4F00F7913CF07516EF6707ED6202F4BB87DC
                    5600D45300CB4F00C55709FEFEFEB647009D3D004F1F00FF00FFFF00FFCA4F00
                    F79F54F07B1FEF6A0AF7BA81FEFEFEE95B00DE5700D45300DE8841FEFEFEC14B
                    00A54100582300FF00FFFF00FFCA4F00F8A760F28128FAD0A9FEFEFEFEFEFEFB
                    E6D1FAD8B7F7D7B7FEFEFEE9AB73CE5000B14500682800FF00FFFF00FFCA4F00
                    F8AD6BF38832FACCA4FEFEFEFEFEFEFAD4B2F7BB84F7BA82EE8E3EDD5600DA55
                    00BF4A00772E00FF00FFFF00FFCA4F00FAB77BF49646F27F24F8BF8AFEFEFEEF
                    6C0DEF6A0AEF6404EE5E00E95B00E55A00CB4F00873500FF00FFFF00FFCA4F00
                    FABA80F7B477F6A45CF49A4EF8C595F2842CF07A1EEF6A0AEE6203EF5E00F25E
                    00D95500963A00FF00FFFF00FFCB4F00FAA65DFABB82FABD87FAB77BF8AC69F7
                    9D4FF6872DF47413F36604F36000FA6200E35900A14000FF00FFFF00FFFF00FF
                    CF5C0AD46C1CD46E1ED46E1ED36A18D16513CF5C0ACC5504CB5101CA5000CB50
                    00BA4800FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                    00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                end
                object BitBtn9: TBitBtn
                  Left = 246
                  Top = 16
                  Width = 83
                  Height = 25
                  Hint = 'Imprimir Kit - [PRO427]'
                  Caption = 'Imprimir'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                  TabOrder = 4
                  OnClick = BitBtn9Click
                  Glyph.Data = {
                    36050000424D3605000000000000360400002800000010000000100000000100
                    08000000000000010000F30E0000F30E00000001000000000000000000000000
                    80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
                    A6000020400000206000002080000020A0000020C0000020E000004000000040
                    20000040400000406000004080000040A0000040C0000040E000006000000060
                    20000060400000606000006080000060A0000060C0000060E000008000000080
                    20000080400000806000008080000080A0000080C0000080E00000A0000000A0
                    200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
                    200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
                    200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
                    20004000400040006000400080004000A0004000C0004000E000402000004020
                    20004020400040206000402080004020A0004020C0004020E000404000004040
                    20004040400040406000404080004040A0004040C0004040E000406000004060
                    20004060400040606000406080004060A0004060C0004060E000408000004080
                    20004080400040806000408080004080A0004080C0004080E00040A0000040A0
                    200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
                    200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
                    200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
                    20008000400080006000800080008000A0008000C0008000E000802000008020
                    20008020400080206000802080008020A0008020C0008020E000804000008040
                    20008040400080406000804080008040A0008040C0008040E000806000008060
                    20008060400080606000806080008060A0008060C0008060E000808000008080
                    20008080400080806000808080008080A0008080C0008080E00080A0000080A0
                    200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
                    200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
                    200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
                    2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
                    2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
                    2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
                    2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
                    2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
                    2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
                    2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
                    FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FDFDFDFDFDFD
                    FDFDFDFDFDFDFDFDFDFDFDFDFDFDF708F6F6F6F608EDF7FDFDFDFDFDFDFD52F6
                    F6070708FFA452FDFDFDFDFD9B5252F6F6070808FFA452529BFDFD9B525252F6
                    08A4A4F7F6A4525252FDFD9BA49B9B525252525252529B075352FDA4F7ADADF7
                    F7A4A4ADADADA5BCAD52FDF7089C9CE4E4E5E5E4E4E4DCAC0852FD070893E4E4
                    E4E4A4E4E4E4E4E5F69BFD070749529B9B9B9B9B9B5252F707F7FD07074952FF
                    FFFFFFFFFFED52ED07FDFDFDF6F6F6F6F6F6FFFFF608F6F6F6FDFDFDFDFDFD08
                    F6FF07070708FDFDFDFDFDFDFDFDFD07F60807FFFF07FDFDFDFDFDFDFDFDFD07
                    F60707FFF6FDFDFDFDFDFDFDFDFDFDF707070707FDFDFDFDFDFD}
                end
              end
              object GroupBox7: TGroupBox
                Left = 0
                Top = 0
                Width = 286
                Height = 359
                Align = alLeft
                Caption = 'Configura'#231#227'o das Colunas'
                TabOrder = 1
                Visible = False
                object ScrollBox4: TScrollBox
                  Left = 2
                  Top = 15
                  Width = 282
                  Height = 342
                  Align = alClient
                  BevelInner = bvNone
                  BevelOuter = bvNone
                  TabOrder = 0
                  OnEnter = ScrollBox4Enter
                end
              end
              object DBGrid2: TDBGrid
                Left = 286
                Top = 0
                Width = 590
                Height = 359
                Align = alClient
                DataSource = dtmProdutos.dsItKit
                ParentShowHint = False
                PopupMenu = PopupMenu3
                ReadOnly = True
                ShowHint = True
                TabOrder = 2
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Tahoma'
                TitleFont.Style = []
                OnColumnMoved = DBGrid2ColumnMoved
                OnDrawColumnCell = DBGrid2DrawColumnCell
                OnKeyDown = DBGrid2KeyDown
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'CODIGO_KIT'
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
                    FieldName = 'COD_EMPRESA'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'NUM_FAB_PROD'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'QUANT_PROD_KIT'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DESCR_PROD_KIT'
                    Width = 246
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'PREC_CUS_PROD'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'PREC_CUSM_PROD'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'PREC_TAB_PROD'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'PREC_PUBLICO'
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
                    FieldName = 'PESO_BRUT_PROD'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'COMPRIMENTO_PROD'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'LARGURA_PROD'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ALTURA_PROD'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'EST_F'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ATIVO'
                    Visible = True
                  end>
              end
            end
            object TabSheet6: TTabSheet
              Caption = 'TabSheet6'
              ImageIndex = 1
              ExplicitLeft = 0
              ExplicitTop = 0
              ExplicitWidth = 0
              ExplicitHeight = 0
              object GroupBox15: TGroupBox
                Left = 0
                Top = 0
                Width = 876
                Height = 359
                Align = alClient
                ParentBackground = False
                TabOrder = 0
                object Label9: TLabel
                  Left = 19
                  Top = 23
                  Width = 101
                  Height = 13
                  Caption = 'Num. Fabrica'#231#227'o:'
                  FocusControl = DBEdit4
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label10: TLabel
                  Left = 19
                  Top = 79
                  Width = 86
                  Height = 13
                  Caption = 'Qtde Produtos:'
                  FocusControl = DBEdit3
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object SpeedButton10: TSpeedButton
                  Left = 146
                  Top = 40
                  Width = 23
                  Height = 22
                  Flat = True
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
                object Label11: TLabel
                  Left = 193
                  Top = 23
                  Width = 35
                  Height = 13
                  Caption = 'Grupo'
                  FocusControl = DBEdit5
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label12: TLabel
                  Left = 293
                  Top = 23
                  Width = 40
                  Height = 13
                  Caption = 'C'#243'digo'
                  FocusControl = DBEdit6
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label13: TLabel
                  Left = 395
                  Top = 23
                  Width = 62
                  Height = 13
                  Caption = 'Descri'#231#227'o:'
                  FocusControl = DBEdit7
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object DBEdit3: TDBEdit
                  Left = 20
                  Top = 98
                  Width = 64
                  Height = 21
                  Hint = 'Quantidade do Item no kit'
                  DataField = 'QUANT_PROD_KIT'
                  DataSource = dtmProdutos.dsItKit
                  TabOrder = 4
                end
                object DBEdit4: TDBEdit
                  Left = 20
                  Top = 41
                  Width = 124
                  Height = 21
                  Hint = 'N'#250'mero de fabrica'#231#227'o do produto [F3 - Pesquisar]'
                  CharCase = ecUpperCase
                  DataField = 'NUM_FAB_PROD'
                  DataSource = dtmProdutos.dsItKit
                  TabOrder = 0
                  OnExit = DBEdit4Exit
                  OnKeyDown = DBEdit4KeyDown
                end
                object DBEdit5: TDBEdit
                  Left = 193
                  Top = 42
                  Width = 81
                  Height = 21
                  Hint = 'Grupo do produto'
                  DataField = 'GRUPO_PROD'
                  DataSource = dtmProdutos.dsItKit
                  Enabled = False
                  TabOrder = 1
                end
                object DBEdit6: TDBEdit
                  Left = 293
                  Top = 42
                  Width = 82
                  Height = 21
                  Hint = 'C'#243'digo do produto'
                  DataField = 'COD_PROD'
                  DataSource = dtmProdutos.dsItKit
                  Enabled = False
                  TabOrder = 2
                end
                object DBEdit7: TDBEdit
                  Left = 395
                  Top = 41
                  Width = 378
                  Height = 21
                  Hint = 'Descri'#231#227'o do produto'
                  DataField = 'DESCR_PROD_KIT'
                  DataSource = dtmProdutos.dsItKit
                  Enabled = False
                  TabOrder = 3
                end
              end
              object GroupBox17: TGroupBox
                Left = 0
                Top = 359
                Width = 876
                Height = 48
                Align = alBottom
                ParentBackground = False
                TabOrder = 1
                object Label14: TLabel
                  Left = 21
                  Top = 22
                  Width = 148
                  Height = 13
                  Caption = 'Cadastro Sequ'#234'ncial  (F2)'
                  FocusControl = CheckBox2
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clTeal
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                  Visible = False
                end
                object BitBtn14: TBitBtn
                  Left = 313
                  Top = 16
                  Width = 75
                  Height = 25
                  Hint = 'Salvar Registro - [PRO123]'
                  Caption = '&OK'
                  TabOrder = 0
                  OnClick = BitBtn14Click
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
                object BitBtn15: TBitBtn
                  Left = 394
                  Top = 16
                  Width = 75
                  Height = 25
                  Hint = 'Cancelar Registro - [PRO124]'
                  Caption = '&Cancela'
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
                object BitBtn16: TBitBtn
                  Left = 604
                  Top = 16
                  Width = 75
                  Height = 25
                  Caption = '&Sair'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                  TabOrder = 2
                  OnClick = BitBtn13Click
                  Glyph.Data = {
                    36050000424D3605000000000000360400002800000010000000100000000100
                    08000000000000010000030F0000030F00000001000000010000B55A0000BD5A
                    0000C65A0000CE630000CE6B0000D66B0000D6730000DE730000DE7B0000E77B
                    0000EF7B0000F77B000000840000F7840000FF840000009C0000DE7B0800F784
                    0800AD5A100094521800E77B1800DE84180008A5180008AD180010AD1800DE73
                    290021AD310018BD310021BD31008C4A390029BD39004242420029C64A0031C6
                    4A008C63630042D66B0084848400FFE7C600FFEFD600FFF7D600FFF7DE00FF00
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00292929292929
                    29292929292929292929292929291F1F1F1F292929292929292929221F1F1D13
                    001F2222222222222929292200001200021F160C0C0C16222929292202020202
                    031F211818180F222929292202030303031F211C1C2023222929292203040404
                    061F0C1A1E2123222929292204041528061F0C0C0C0F0F222929292206061006
                    061F2525252525222929292206060808081F2626262626222929292208090909
                    0A1F272828282822292929220E0D0A0A0A1F272727272722292929220E0E110D
                    0E1F27272727272229292929222219140E1F2424242424242929292929292222
                    221F292929292929292929292929292929292929292929292929}
                end
                object CheckBox2: TCheckBox
                  Left = 5
                  Top = 21
                  Width = 15
                  Height = 15
                  BiDiMode = bdLeftToRight
                  Color = clBtnFace
                  Ctl3D = True
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clTeal
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentBiDiMode = False
                  ParentColor = False
                  ParentCtl3D = False
                  ParentFont = False
                  TabOrder = 3
                  Visible = False
                  OnClick = CheckBox2Click
                end
              end
            end
          end
          object GroupBox4: TGroupBox
            Left = 0
            Top = 0
            Width = 884
            Height = 75
            Align = alTop
            Caption = 'Totais Kit:'
            TabOrder = 1
            object Label201: TLabel
              Left = 7
              Top = 47
              Width = 68
              Height = 13
              Alignment = taRightJustify
              Caption = 'Quantidade:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBText28: TDBText
              Left = 78
              Top = 47
              Width = 100
              Height = 17
              DataField = 'QUANT_PROD_KIT'
              DataSource = dtmProdutos.dsKits
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label202: TLabel
              Left = 162
              Top = 47
              Width = 38
              Height = 13
              Alignment = taRightJustify
              Caption = 'Custo: '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBText29: TDBText
              Left = 200
              Top = 47
              Width = 89
              Height = 17
              DataField = 'PREC_CUS_PROD'
              DataSource = dtmProdutos.dsKits
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label218: TLabel
              Left = 601
              Top = 47
              Width = 85
              Height = 13
              Alignment = taRightJustify
              Caption = 'Pre'#231'o Atacado:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBText33: TDBText
              Left = 688
              Top = 47
              Width = 88
              Height = 17
              Alignment = taRightJustify
              DataField = 'PREC_PUBLICO'
              DataSource = dtmProdutos.dsKits
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label216: TLabel
              Left = 611
              Top = 24
              Width = 75
              Height = 13
              Alignment = taRightJustify
              Caption = 'Pre'#231'o Varejo:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBText32: TDBText
              Left = 692
              Top = 24
              Width = 84
              Height = 17
              Alignment = taRightJustify
              DataField = 'PREC_TAB_PROD'
              DataSource = dtmProdutos.dsKits
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label21: TLabel
              Left = 295
              Top = 47
              Width = 75
              Height = 13
              Alignment = taRightJustify
              Caption = 'Custo M'#233'dio: '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBText3: TDBText
              Left = 370
              Top = 47
              Width = 79
              Height = 17
              DataField = 'PREC_CUSM_PROD'
              DataSource = dtmProdutos.dsKits
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label22: TLabel
              Left = 8
              Top = 23
              Width = 17
              Height = 14
              Caption = 'Kit'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label23: TLabel
              Left = 484
              Top = 47
              Width = 51
              Height = 13
              Alignment = taRightJustify
              Caption = 'Estoque: '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBText1: TDBText
              Left = 535
              Top = 47
              Width = 55
              Height = 17
              DataField = 'EST_F'
              DataSource = dtmProdutos.dsKits
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
          end
        end
        object tsPromocaoKit: TTabSheet
          Caption = 'tsPromocaoKit'
          ImageIndex = 4
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object GroupBox5: TGroupBox
            Left = 0
            Top = 0
            Width = 884
            Height = 510
            Align = alClient
            TabOrder = 0
            object Panel5: TPanel
              Left = 2
              Top = 56
              Width = 880
              Height = 104
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 0
              object Label204: TLabel
                Left = 130
                Top = 17
                Width = 57
                Height = 13
                Caption = 'Data Inicial:'
              end
              object Label208: TLabel
                Left = 130
                Top = 46
                Width = 57
                Height = 13
                Caption = 'Hora Inicial:'
              end
              object Label207: TLabel
                Left = 407
                Top = 17
                Width = 52
                Height = 13
                Caption = 'Data Final:'
              end
              object Label209: TLabel
                Left = 406
                Top = 46
                Width = 52
                Height = 13
                Caption = 'Hora Final:'
              end
              object Label18: TLabel
                Left = 159
                Top = 76
                Width = 28
                Height = 13
                Caption = 'Valor:'
              end
              object Label19: TLabel
                Left = 392
                Top = 76
                Width = 67
                Height = 13
                Caption = 'Porcentagem:'
              end
              object DBEdit11: TDBEdit
                Left = 193
                Top = 14
                Width = 83
                Height = 21
                TabOrder = 0
              end
              object DBEdit12: TDBEdit
                Left = 465
                Top = 14
                Width = 83
                Height = 21
                TabOrder = 1
              end
              object DBEdit13: TDBEdit
                Left = 193
                Top = 43
                Width = 83
                Height = 21
                TabOrder = 2
              end
              object DBEdit14: TDBEdit
                Left = 465
                Top = 43
                Width = 83
                Height = 21
                TabOrder = 3
              end
              object DBEdit15: TDBEdit
                Left = 193
                Top = 73
                Width = 83
                Height = 21
                TabOrder = 4
              end
              object DBEdit16: TDBEdit
                Left = 465
                Top = 73
                Width = 83
                Height = 21
                TabOrder = 5
              end
            end
            object GroupBox8: TGroupBox
              Left = 2
              Top = 160
              Width = 880
              Height = 41
              Align = alTop
              TabOrder = 1
              object Label20: TLabel
                Left = 82
                Top = 13
                Width = 96
                Height = 16
                Caption = 'Tipo de Venda:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object BitBtn7: TBitBtn
                Left = 537
                Top = 10
                Width = 75
                Height = 25
                Hint = 'Incluir Servi'#231'o - [AGO007]'
                Caption = 'Incluir'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 0
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
              object BitBtn17: TBitBtn
                Left = 618
                Top = 10
                Width = 75
                Height = 25
                Hint = 'Confirmar Servi'#231'o - [AGO009] '
                Caption = 'Salva'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 1
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
                Left = 700
                Top = 10
                Width = 75
                Height = 25
                Hint = 'Remover Servi'#231'o - [AGO008]'
                Caption = 'Cancela'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 2
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
              object DBLookupComboBox1: TDBLookupComboBox
                Left = 192
                Top = 12
                Width = 324
                Height = 21
                TabOrder = 3
              end
            end
            object GroupBox6: TGroupBox
              Left = 2
              Top = 201
              Width = 880
              Height = 264
              Align = alTop
              TabOrder = 2
              object DBGrid3: TDBGrid
                Left = 2
                Top = 15
                Width = 876
                Height = 247
                Align = alClient
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Tahoma'
                TitleFont.Style = []
              end
            end
            object Panel4: TPanel
              Left = 2
              Top = 465
              Width = 880
              Height = 43
              Align = alClient
              TabOrder = 3
              object Label15: TLabel
                Left = 15
                Top = 14
                Width = 89
                Height = 16
                Alignment = taRightJustify
                Caption = 'Pre'#231'o Varejo:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label16: TLabel
                Left = 489
                Top = 14
                Width = 110
                Height = 16
                Caption = 'Pre'#231'o Promo'#231#227'o:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label17: TLabel
                Left = 243
                Top = 13
                Width = 101
                Height = 16
                Caption = 'Pre'#231'o Atacado:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object DBEdit8: TDBEdit
                Left = 109
                Top = 12
                Width = 83
                Height = 21
                TabOrder = 0
              end
              object DBEdit9: TDBEdit
                Left = 605
                Top = 12
                Width = 83
                Height = 21
                TabOrder = 1
              end
              object DBEdit10: TDBEdit
                Left = 350
                Top = 11
                Width = 83
                Height = 21
                TabOrder = 2
              end
              object BitBtn8: TBitBtn
                Left = 705
                Top = 10
                Width = 75
                Height = 25
                Hint = 'Voltar a tela anterior'
                Caption = '&Voltar'
                TabOrder = 3
                OnClick = BitBtn8Click
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
            object Panel6: TPanel
              Left = 2
              Top = 15
              Width = 880
              Height = 41
              Align = alTop
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 4
              object DBText27: TDBText
                Left = 16
                Top = 11
                Width = 55
                Height = 13
                AutoSize = True
                DataField = 'DESCRICAO_KIT'
                DataSource = dtmProdutos.dsKits
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
              end
            end
          end
        end
        object tsImagemKit: TTabSheet
          Caption = 'tsImagemKit'
          ImageIndex = 5
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object pnImagemKit: TPanel
            Left = 3
            Top = 3
            Width = 718
            Height = 284
            TabOrder = 0
            OnEnter = pnImagemKitEnter
            object Label555: TLabel
              Left = 71
              Top = 48
              Width = 49
              Height = 13
              Alignment = taRightJustify
              Caption = 'Endere'#231'o:'
            end
            object Label556: TLabel
              Left = 103
              Top = 100
              Width = 17
              Height = 13
              Alignment = taRightJustify
              Caption = 'Url:'
            end
            object Label557: TLabel
              Left = 96
              Top = 178
              Width = 24
              Height = 13
              Alignment = taRightJustify
              Caption = 'Erro:'
            end
            object Label558: TLabel
              Left = 13
              Top = 21
              Width = 107
              Height = 13
              Alignment = taRightJustify
              Caption = 'Data / Hora Cadastro:'
            end
            object Label559: TLabel
              Left = 37
              Top = 151
              Width = 83
              Height = 13
              Alignment = taRightJustify
              Caption = 'Data / Hora Erro:'
            end
            object Panel164: TPanel
              Left = 1
              Top = 242
              Width = 716
              Height = 41
              Align = alBottom
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 3
              object btImagemKitFechar: TBitBtn
                Left = 627
                Top = 6
                Width = 75
                Height = 25
                Hint = 'Fechar'
                Caption = '&Fechar'
                TabOrder = 0
                OnClick = btImagemKitFecharClick
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
            object MemoEndereco: TMemo
              Left = 126
              Top = 45
              Width = 585
              Height = 46
              Color = cl3DLight
              ReadOnly = True
              TabOrder = 0
            end
            object MemoUrl: TMemo
              Left = 126
              Top = 97
              Width = 585
              Height = 46
              Color = cl3DLight
              ReadOnly = True
              TabOrder = 1
            end
            object MemoErro: TMemo
              Left = 126
              Top = 175
              Width = 585
              Height = 46
              Color = cl3DLight
              ReadOnly = True
              TabOrder = 2
            end
            object EditDataCadImg: TEdit
              Left = 126
              Top = 18
              Width = 79
              Height = 21
              Color = cl3DLight
              ReadOnly = True
              TabOrder = 4
              Text = 'EditDataCadImg'
            end
            object EditDataErroImg: TEdit
              Left = 126
              Top = 148
              Width = 79
              Height = 21
              Color = cl3DLight
              ReadOnly = True
              TabOrder = 5
              Text = 'EditDataCadImg'
            end
          end
        end
      end
    end
  end
  inherited StatusBar1: TStatusBar
    Width = 899
    ExplicitWidth = 899
  end
  inherited PopupMenu1: TPopupMenu
    Left = 452
    Top = 9
    inherited Configurarcolunas1: TMenuItem
      Caption = 'Configurar colunas - [PRO197]'
    end
    inherited ResetarConfiguraesdecolunas1: TMenuItem
      Caption = 'Resetar Configura'#231#245'es de colunas - [PRO198]'
    end
    object MarcarTodosKitsProdutosClick: TMenuItem
      Caption = 'Marcar Todos Kits de Produtos'
      OnClick = MarcarTodosKitsProdutosClickClick
    end
    object DesmarcarTodosKitsProdutosClick: TMenuItem
      Caption = 'Desmarcar Todos Kits de Produtos'
      OnClick = DesmarcarTodosKitsProdutosClickClick
    end
  end
  inherited PopupMenu2: TPopupMenu
    Left = 646
    Top = 65531
  end
  inherited Timer1: TTimer
    Left = 606
    Top = 65531
  end
  inherited ApplicationEventsPadrao: TApplicationEvents
    Left = 574
    Top = 65531
  end
  object PopupMenu3: TPopupMenu
    Left = 388
    Top = 9
    object MenuItem1: TMenuItem
      Caption = 'Configurar colunas - [PRO197]'
      OnClick = MenuItem1Click
    end
    object MenuItem2: TMenuItem
      Caption = 'Resetar Configura'#231#245'es de colunas - [PRO198]'
      OnClick = MenuItem2Click
    end
    object MenuItem3: TMenuItem
      Caption = 'Salvar dados no Excel'
      OnClick = MenuItem3Click
    end
    object MenuItem4: TMenuItem
      Caption = 'Reajustar Largura das colunas'
      OnClick = MenuItem4Click
    end
    object MenuItem5: TMenuItem
      Caption = 'Copiar para '#225'rea de transfer'#234'ncia'
      OnClick = MenuItem5Click
    end
  end
  object OpenPictureDialog1: TOpenPictureDialog
    Filter = 
      'All (*.jpg;*.jpeg;*.bmp)|*.jpg;*.jpeg;*.bmp|JPEG Image File (*.j' +
      'pg)|*.jpg|JPEG Image File (*.jpeg)|*.jpeg|Bitmaps (*.bmp)|*.bmp'
    Options = [ofHideReadOnly, ofAllowMultiSelect, ofEnableSizing]
    Left = 600
    Top = 40
  end
end
