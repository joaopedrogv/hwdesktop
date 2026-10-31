inherited FrmCadKits: TFrmCadKits
  Left = 246
  Caption = 'Kits de Produtos'
  ClientHeight = 641
  ClientWidth = 910
  ExplicitWidth = 926
  ExplicitHeight = 680
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelFundo: TPanel
    Width = 910
    Height = 622
    ExplicitWidth = 910
    ExplicitHeight = 622
    inherited Splitter2: TSplitter
      Height = 620
      ExplicitHeight = 620
    end
    inherited PanelLeft: TPanel
      Width = 905
      Height = 620
      ExplicitWidth = 905
      ExplicitHeight = 620
      inherited PageControl1: TPageControl
        Width = 903
        Height = 618
        ExplicitWidth = 903
        ExplicitHeight = 618
        inherited TabSheet1: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 895
          ExplicitHeight = 587
          inherited ScrollBox1: TScrollBox
            Width = 895
            Height = 587
            ExplicitWidth = 895
            ExplicitHeight = 587
            inherited PageControl3: TPageControl
              Width = 895
              Height = 539
              OnChange = PageControl3Change
              ExplicitWidth = 895
              ExplicitHeight = 539
              inherited TabSheet3: TTabSheet
                Caption = 'Dados do Kit'
                ExplicitLeft = 4
                ExplicitTop = 27
                ExplicitWidth = 887
                ExplicitHeight = 508
                inherited ScrollBox3: TScrollBox
                  Width = 887
                  Height = 508
                  ExplicitWidth = 887
                  ExplicitHeight = 508
                  inherited GroupBox1: TGroupBox
                    Width = 883
                    Height = 504
                    Align = alClient
                    Caption = 'Dados do Kit'
                    ExplicitWidth = 883
                    ExplicitHeight = 504
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
                    object Label158: TLabel
                      Left = 31
                      Top = 97
                      Width = 81
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Venda Online:'
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
                    object DBComboBox22: TDBComboBox
                      Left = 115
                      Top = 94
                      Width = 90
                      Height = 21
                      Hint = 'Sincronizar venda online'
                      CharCase = ecUpperCase
                      DataField = 'SINC_HW_CLOUD'
                      DataSource = dtmProdutos.dsKits
                      ItemHeight = 13
                      Items.Strings = (
                        'SIM'
                        'N'#195'O')
                      TabOrder = 3
                    end
                  end
                end
              end
              object tsECommerce: TTabSheet
                Caption = 'E-Commerce'
                ImageIndex = 1
                object GroupBoxKit: TGroupBox
                  Left = 0
                  Top = 0
                  Width = 887
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
                  Width = 887
                  Height = 455
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
                    Width = 883
                    Height = 405
                    Align = alClient
                    BevelOuter = bvNone
                    BorderWidth = 6
                    TabOrder = 0
                    OnEnter = pnDadosECEnter
                    object pnOpcoesDadosEC: TPanel
                      Left = 6
                      Top = 362
                      Width = 871
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
                        Left = 646
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
                          Height = 33
                          Align = alRight
                          Alignment = taRightJustify
                          Caption = '1/4'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clBlue
                          Font.Height = -15
                          Font.Name = 'Tahoma'
                          Font.Style = [fsBold]
                          ParentFont = False
                          ExplicitHeight = 18
                        end
                      end
                      object Panel115: TPanel
                        Left = 580
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
                      Width = 871
                      Height = 356
                      ActivePage = TabSheetEC1
                      Align = alClient
                      Style = tsFlatButtons
                      TabOrder = 1
                      object TabSheetEC1: TTabSheet
                        Caption = 'TabSheetEC1'
                        object ScrollBox9: TScrollBox
                          Left = 0
                          Top = 0
                          Width = 863
                          Height = 325
                          Align = alClient
                          BevelInner = bvNone
                          BevelOuter = bvNone
                          BorderStyle = bsNone
                          Ctl3D = True
                          ParentCtl3D = False
                          TabOrder = 0
                          object Panel77: TPanel
                            Left = 809
                            Top = 224
                            Width = 54
                            Height = 101
                            Align = alRight
                            BevelOuter = bvNone
                            TabOrder = 1
                          end
                          object pnDescricaoHTMLEC: TPanel
                            Left = 0
                            Top = 224
                            Width = 809
                            Height = 101
                            Align = alClient
                            BevelOuter = bvNone
                            TabOrder = 2
                            object Panel99: TPanel
                              Left = 0
                              Top = 0
                              Width = 116
                              Height = 101
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
                              Width = 657
                              Height = 101
                              Align = alClient
                              BevelKind = bkTile
                              BevelOuter = bvNone
                              TabOrder = 1
                              object pnOpcoesHtml: TPanel
                                Left = 0
                                Top = 0
                                Width = 34
                                Height = 97
                                Align = alLeft
                                BevelKind = bkTile
                                BevelOuter = bvNone
                                TabOrder = 0
                                object SpeedButtonAlterarHtmlEC: TSpeedButton
                                  Left = 0
                                  Top = 0
                                  Width = 30
                                  Height = 93
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
                                Width = 619
                                Height = 97
                                Align = alClient
                                TabOrder = 1
                                ExplicitHeight = 20
                                ControlData = {
                                  4C000000FA3F0000060A00000000000000000000000000000000000000000000
                                  000000004C000000000000000000000001000000E0D057007335CF11AE690800
                                  2B2E126208000000000000004C0000000114020000000000C000000000000046
                                  8000000000000000000000000000000000000000000000000000000000000000
                                  00000000000000000100000000000000000000000000000000000000}
                              end
                            end
                            object Panel7: TPanel
                              Left = 773
                              Top = 0
                              Width = 36
                              Height = 101
                              Align = alRight
                              BevelOuter = bvNone
                              TabOrder = 2
                            end
                          end
                          object pnDescricaoProdEC: TPanel
                            Left = 0
                            Top = 0
                            Width = 863
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
                        object ScrollBox10: TScrollBox
                          Left = 0
                          Top = 0
                          Width = 863
                          Height = 325
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
                            Width = 863
                            Height = 325
                            Align = alClient
                            BevelOuter = bvNone
                            TabOrder = 0
                            object pnCategoriasEC: TPanel
                              Left = 391
                              Top = 0
                              Width = 472
                              Height = 325
                              Align = alRight
                              BevelOuter = bvNone
                              TabOrder = 1
                              object Splitter9: TSplitter
                                Left = 230
                                Top = 20
                                Height = 305
                                ExplicitLeft = 462
                                ExplicitTop = 1
                                ExplicitHeight = 128
                              end
                              object Panel93: TPanel
                                Left = 0
                                Top = 20
                                Width = 230
                                Height = 305
                                Align = alLeft
                                BevelOuter = bvNone
                                Padding.Bottom = 1
                                TabOrder = 0
                                object TreeViewCat: TTreeView
                                  Left = 0
                                  Top = 40
                                  Width = 230
                                  Height = 264
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
                                Height = 305
                                Align = alClient
                                BevelOuter = bvNone
                                Padding.Bottom = 1
                                TabOrder = 1
                                object TreeViewCatDB: TTreeView
                                  Left = 0
                                  Top = 40
                                  Width = 239
                                  Height = 264
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
                              Width = 391
                              Height = 325
                              Align = alClient
                              BevelOuter = bvNone
                              TabOrder = 0
                              object Panel98: TPanel
                                Left = 0
                                Top = 0
                                Width = 391
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
                                  Left = 340
                                  Top = 0
                                  Width = 29
                                  Height = 16
                                  Align = alRight
                                  Alignment = taRightJustify
                                  Caption = '1/1'
                                  Font.Charset = DEFAULT_CHARSET
                                  Font.Color = clBlue
                                  Font.Height = -15
                                  Font.Name = 'Tahoma'
                                  Font.Style = [fsBold]
                                  ParentFont = False
                                  ExplicitHeight = 18
                                end
                                object Panel112: TPanel
                                  Left = 369
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
                                Width = 391
                                Height = 305
                                Align = alClient
                                BevelKind = bkTile
                                BevelOuter = bvNone
                                BorderWidth = 5
                                TabOrder = 1
                                object Panel57: TPanel
                                  Left = 5
                                  Top = 5
                                  Width = 40
                                  Height = 291
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
                                  Width = 337
                                  Height = 291
                                  Align = alClient
                                  BevelOuter = bvNone
                                  TabOrder = 1
                                  object Panel110: TPanel
                                    Left = 0
                                    Top = 0
                                    Width = 337
                                    Height = 291
                                    Align = alClient
                                    BevelOuter = bvNone
                                    TabOrder = 0
                                    object Image1: TImage
                                      Left = 0
                                      Top = 48
                                      Width = 337
                                      Height = 243
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
                                      Width = 337
                                      Height = 19
                                      Align = alTop
                                      BevelOuter = bvNone
                                      TabOrder = 0
                                      object lbDescrGradeImg: TLabel
                                        Left = 0
                                        Top = 0
                                        Width = 337
                                        Height = 19
                                        Align = alClient
                                        Alignment = taCenter
                                        Caption = '...'
                                        Font.Charset = DEFAULT_CHARSET
                                        Font.Color = clBlack
                                        Font.Height = -11
                                        Font.Name = 'Tahoma'
                                        Font.Style = [fsBold]
                                        ParentFont = False
                                        ExplicitWidth = 9
                                        ExplicitHeight = 13
                                      end
                                    end
                                    object pnDescImagemProduto: TPanel
                                      Left = 0
                                      Top = 19
                                      Width = 337
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
                        object ScrollBox5: TScrollBox
                          Left = 0
                          Top = 0
                          Width = 863
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
                            Width = 863
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
                        object pnGradeVaricaoEC: TPanel
                          Left = 0
                          Top = 0
                          Width = 863
                          Height = 325
                          Align = alClient
                          BevelOuter = bvNone
                          TabOrder = 0
                          object Panel101: TPanel
                            Left = 0
                            Top = 0
                            Width = 863
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
                            Width = 863
                            Height = 305
                            Align = alClient
                            BevelOuter = bvNone
                            TabOrder = 1
                            object pnItensLeftEC: TPanel
                              Left = 0
                              Top = 0
                              Width = 36
                              Height = 305
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
                        object pnItensKit: TPanel
                          Left = 0
                          Top = 0
                          Width = 863
                          Height = 325
                          Align = alClient
                          BevelOuter = bvNone
                          TabOrder = 0
                          OnEnter = pnItensKitEnter
                          object GroupBoxItens: TGroupBox
                            Left = 0
                            Top = 283
                            Width = 863
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
                    Top = 420
                    Width = 883
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
              Top = 539
              Width = 895
              ExplicitTop = 539
              ExplicitWidth = 895
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
          ExplicitWidth = 895
          ExplicitHeight = 587
          inherited GroupBox3: TGroupBox
            Width = 895
            ExplicitWidth = 895
            inherited imgInformation: TImage
              Left = 869
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
            object SpeedButton59: TSpeedButton [8]
              Left = 840
              Top = 13
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
            object ckLixeira: TCheckBox
              Left = 692
              Top = 9
              Width = 76
              Height = 17
              Hint = 'Lixeira'
              Caption = 'Lixeira (F6)'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 11
              OnClick = ckLixeiraClick
            end
          end
          inherited Panel1: TPanel
            Width = 895
            Height = 514
            ExplicitWidth = 895
            ExplicitHeight = 514
            inherited Splitter1: TSplitter
              Height = 453
              ExplicitHeight = 376
            end
            inherited DBGrid1: TDBGrid
              Width = 602
              Height = 453
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
              Width = 891
              ExplicitWidth = 891
              inherited SpeedButton1: TSpeedButton
                Hint = 'Editar Registro - [PRO112]'
              end
              inherited SpeedButton2: TSpeedButton
                Hint = 'Apagar Registro - [PRO114]'
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
                Hint = 'Atualizar informa'#231#245'es dos kits'
                Glyph.Data = {
                  76060000424D7606000000000000360400002800000018000000180000000100
                  08000000000040020000320B0000320B00000001000000000000392918003131
                  3100EFA5390021214A007B5A4A0073635200EFA55200FFB5520018425A00846B
                  5A000842630021526B0052636B00E7AD6B00F7BD6B00AD7B7300AD847300B584
                  730029637B00AD7B7B0084847B008C847B00AD738400AD7B8400B57B8400B584
                  8400BD848400E7B58400BD848C00C68C8C009C948C00CE948C00DEA58C00EFC6
                  8C00D69C9400DEA59400EFCE94004A6B9C009C9C9C00EFCE9C00CEADA500EFCE
                  A500F7D6A500CEBDAD00F7D6AD00E7CEB500F7D6B500F7DEB5003139BD00DEC6
                  BD00E7CEBD00EFD6BD00F7DEBD008CB5C600E7CEC600EFCEC600EFDEC600F7DE
                  C600F7E7C600E7D6CE00E7DECE00F7DECE00F7E7CE0010A5D600D6D6D600E7D6
                  D600EFDED600F7E7D60042A5DE00DEDEDE00F7E7DE00F7EFDE000010E700F7EF
                  E700299CEF00F7EFEF00FFF7EF002973F70042E7F700FFF7F700FFFFF700FF00
                  FF006BC6FF008CF7FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00515151131919
                  191919191919191919191919191919195151515151093838382F2E2C2A272724
                  24242424242424195151515151093838434343434343434343434343423E4219
                  5151515151094238212121212121212121212121424242195151515151094242
                  4239343434343434343434344242421951515151510942424343434343434343
                  4343434342424219515151515109423C2121212121010C26262621213E424219
                  51515151510F313E3E3E3E3E400400120C2C3E3E3E423419515151515109261E
                  1E262626264035534D0B26262626241951510404040404040404040404265253
                  4D4D0B040404040404040451510F413B3B494947433E3E3F4E4D4D082C292719
                  51040451510F313102020202020202263F4E4D4D0B2629195104045151092626
                  2727272727272727273F4E4D4D0A291951040404040404040404040404040404
                  04043F4E4D30010404045151510F545454545454545454545454263F44151401
                  5151515151115054545454545454545454543E3E095449050351515151115454
                  21212121212121212121213C2B1E2D124D305151511154545454545454545454
                  54545454540F254A4D305151511F5454545454545454504F5454545454540F48
                  48515151511F545443434343434343434343434349490F5151515151511F5454
                  2121212121212121212121214B490F5151515151511F54545454545454545454
                  504F4F4C4C4B0F5151515151511F545454545454545454545454504F4F4C0F51
                  51515151511F1111111111111111111111111111111109515151}
                OnClick = SpeedButton7Click
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
            inherited GroupBox2: TGroupBox
              Height = 453
              ExplicitHeight = 453
              inherited ScrollBox2: TScrollBox
                Height = 436
                ExplicitHeight = 436
              end
            end
          end
        end
        inherited tsMemo: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 895
          ExplicitHeight = 587
        end
        object TabSheet4: TTabSheet
          Caption = 'TabSheet4'
          ImageIndex = 2
          OnShow = TabSheet4Show
          object PageControl2: TPageControl
            Left = 0
            Top = 75
            Width = 895
            Height = 512
            ActivePage = TabSheet5
            Align = alClient
            TabOrder = 0
            object TabSheet5: TTabSheet
              Caption = 'TabSheet5'
              object GroupBox14: TGroupBox
                Left = 0
                Top = 436
                Width = 887
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
                Height = 436
                Align = alLeft
                Caption = 'Configura'#231#227'o das Colunas'
                TabOrder = 1
                Visible = False
                object ScrollBox4: TScrollBox
                  Left = 2
                  Top = 15
                  Width = 282
                  Height = 419
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
                Width = 601
                Height = 436
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
              object GroupBox15: TGroupBox
                Left = 0
                Top = 0
                Width = 887
                Height = 436
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
                Top = 436
                Width = 887
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
            Width = 895
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
          object GroupBox5: TGroupBox
            Left = 0
            Top = 0
            Width = 895
            Height = 587
            Align = alClient
            TabOrder = 0
            object Panel5: TPanel
              Left = 2
              Top = 56
              Width = 891
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
              Width = 891
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
              Width = 891
              Height = 264
              Align = alTop
              TabOrder = 2
              object DBGrid3: TDBGrid
                Left = 2
                Top = 15
                Width = 887
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
              Width = 891
              Height = 120
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
              Width = 891
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
        object tsAlterDadosKit: TTabSheet
          Caption = 'tsAlterDadosKit'
          ImageIndex = 6
          object Panel52: TPanel
            Left = 0
            Top = 0
            Width = 895
            Height = 110
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 0
            object btVoltarDadosKit: TBitBtn
              Left = 604
              Top = 13
              Width = 75
              Height = 25
              Hint = 'Voltar a tela anterior'
              Caption = '&Voltar'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              OnClick = btVoltarDadosKitClick
              Glyph.Data = {
                36030000424D3603000000000000360000002800000010000000100000000100
                18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFA13701AF4101892603FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF922D02BF4E00AC40018926
                03FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FF952E02C45000A53A01872303FF00FFFF00FF912D049D3604
                972F02972E019931029831029831029930028E2803FF00FFFF00FF9D3401C250
                00972F02872403FF00FFAD470DEE871FD1640ABF4D01BA4800BC4B00BC4B00BD
                4C00962E02FF00FFFF00FFFF00FFA63B01B848008B2703882502AF4A0FFE9F34
                E67F1ED0650D8F2A018B28028F2A028F29028B2803FF00FFFF00FFFF00FF8B28
                03BC4B009E3502842403AF490FFFA537B65012E98220C2590E862202FF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFB04101AB3F01862403AF490FFFAA39
                9A3507A9440DFC982BC1580F862201FF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFAD4001AF4101872503AF490FFFA939A13D0A7D1900892603FF9D2DC95F118A
                2702FF00FFFF00FFFF00FFFF00FF8A2703BA4A00A93C01862503AF490FFFA939
                A13D0AFF00FFFF00FF892603FB9C2EDA7319952D03832001842302872403A73C
                01C45000952E02882502B14B10FFB03DA33F0BFF00FFFF00FFFF00FF892603E3
                8024EB841FC2580CAC4103B44400C14E009F3501952E02FF00FFA33F0BE28829
                993507FF00FFFF00FFFF00FFFF00FF892603AC480DC45D11BB5007A63A01912C
                02872403FF00FFFF00FFA33F0B902B038A2602FF00FFFF00FFFF00FFFF00FFFF
                00FF8825028825028A2703882503882502FF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
            end
          end
          object GroupBox79: TGroupBox
            Left = 0
            Top = 110
            Width = 895
            Height = 57
            Align = alTop
            Caption = 'Kit'
            TabOrder = 1
            object DBText7: TDBText
              Left = 32
              Top = 24
              Width = 48
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
            object btVoltarDadosKit2: TBitBtn
              Left = 726
              Top = 19
              Width = 75
              Height = 25
              Hint = 'Voltar a tela anterior'
              Caption = '&Voltar'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              OnClick = btVoltarDadosKit2Click
              Glyph.Data = {
                36030000424D3603000000000000360000002800000010000000100000000100
                18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFA13701AF4101892603FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF922D02BF4E00AC40018926
                03FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FF952E02C45000A53A01872303FF00FFFF00FF912D049D3604
                972F02972E019931029831029831029930028E2803FF00FFFF00FF9D3401C250
                00972F02872403FF00FFAD470DEE871FD1640ABF4D01BA4800BC4B00BC4B00BD
                4C00962E02FF00FFFF00FFFF00FFA63B01B848008B2703882502AF4A0FFE9F34
                E67F1ED0650D8F2A018B28028F2A028F29028B2803FF00FFFF00FFFF00FF8B28
                03BC4B009E3502842403AF490FFFA537B65012E98220C2590E862202FF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFB04101AB3F01862403AF490FFFAA39
                9A3507A9440DFC982BC1580F862201FF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFAD4001AF4101872503AF490FFFA939A13D0A7D1900892603FF9D2DC95F118A
                2702FF00FFFF00FFFF00FFFF00FF8A2703BA4A00A93C01862503AF490FFFA939
                A13D0AFF00FFFF00FF892603FB9C2EDA7319952D03832001842302872403A73C
                01C45000952E02882502B14B10FFB03DA33F0BFF00FFFF00FFFF00FF892603E3
                8024EB841FC2580CAC4103B44400C14E009F3501952E02FF00FFA33F0BE28829
                993507FF00FFFF00FFFF00FFFF00FF892603AC480DC45D11BB5007A63A01912C
                02872403FF00FFFF00FFA33F0B902B038A2602FF00FFFF00FFFF00FFFF00FFFF
                00FF8825028825028A2703882503882502FF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
            end
          end
          object Panel128: TPanel
            Left = 0
            Top = 167
            Width = 895
            Height = 420
            Align = alClient
            BevelKind = bkTile
            BevelOuter = bvNone
            TabOrder = 2
            object pnCenterAlterDadosProd: TPanel
              Left = 0
              Top = 0
              Width = 891
              Height = 72
              Align = alTop
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 0
              object SpeedButtonAlterarKit: TSpeedButton
                Left = 55
                Top = 2
                Width = 51
                Height = 45
                Hint = 'Editar Registro - [PRO112]'
                Flat = True
                Glyph.Data = {
                  76060000424D7606000000000000360400002800000018000000180000000100
                  08000000000040020000230F0000230F00000001000000010000CE630000D673
                  0000DE7B0000D6730800D673100039291800D67B21003131310021214A007B5A
                  4A007363520018425A00846B5A0008426300E7A5630021526B0052636B002963
                  7B0084847B008C847B009C948C004A6B9C009C9C9C00FFD6A500B5ADAD00B5B5
                  AD00FFD6AD00B5B5B500E7CEB500FFDEB5003139BD00FFDEBD008CB5C600FFE7
                  C600FFE7CE0010A5D600D6D6D600FFEFD60042A5DE00DEDEDE00FFEFDE000010
                  E700E7E7E700F7EFE700FFEFE700FFF7E700299CEF00FFF7EF002973F70042E7
                  F700FFFFF700FF00FF006BC6FF008CF7FF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00333333333333
                  3333333333333333333333333333333333333333333333333333333333333333
                  3333333333333333333333330000000000000000000000000000000000000000
                  333333330036322F2D2C2825252221211F1D1D1A1A1717003333333300363636
                  3232322F2F252221211F1D1D1A1A17003333333300363636363632322F2F2525
                  21211F1D1D1A1A00333333330036271616161616160710161616161616161A00
                  3333333300363636363636363609051110252525251D1D003333333300362716
                  1616161616242035300F16161616250033333333003636363636363636363435
                  30300D2525252500333333330036271616161616161616233130300F16162500
                  33333333003636363636363636363232233130300B2525003333333300362716
                  161616161616161616233130300F250033333333003636363636363636363232
                  2F2F233130300D003333333300362A1B1B1B1B1B1B1B1B1B1919182331301E07
                  333333330036363636363636363636363632322F232613120733333300363636
                  36363636363636363632322F2F0C362B0A083333003636363636363636363636
                  3632322F2D2D141C113033330102020202020202020202020202020202020215
                  2E3033330E0000000000000000000000000000000000000E2929333333040404
                  0404040404040404040404040403063333333333333333333333333333333333
                  3333333333333333333333333333333333333333333333333333333333333333
                  3333333333333333333333333333333333333333333333333333}
                ParentShowHint = False
                ShowHint = True
                OnClick = SpeedButtonAlterarKitClick
              end
              object SpeedBSelTodos: TSpeedButton
                Left = 834
                Top = 8
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
                OnClick = SpeedBSelTodosClick
              end
              object SpeedBDesmarcarTodos: TSpeedButton
                Left = 860
                Top = 8
                Width = 23
                Height = 21
                Hint = '[ F4 ] - Desfazer sele'#231#227'o'
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
                OnClick = SpeedBDesmarcarTodosClick
              end
              object SpeedButtonAlterarKit2: TSpeedButton
                Left = 2
                Top = 2
                Width = 51
                Height = 45
                Hint = 'Editar Registro Selecionados  - [PRO460]'
                Flat = True
                Glyph.Data = {
                  76060000424D7606000000000000360400002800000018000000180000000100
                  08000000000040020000230F0000230F00000001000000000000CE630000D673
                  0000DE7B0000D6730800D673100039291800D67B21003131310021214A007B5A
                  4A007363520018425A00846B5A0008426300E7A5630021526B0052636B002963
                  7B0084847B008C847B009C948C004A6B9C009C9C9C00FFD6A500B5ADAD00B5B5
                  AD00FFD6AD00B5B5B500E7CEB500FFDEB5003139BD00FFDEBD008CB5C600FFE7
                  C600FFE7CE0010A5D600D6D6D600FFEFD60042A5DE00DEDEDE00FFEFDE000010
                  E700E7E7E700F7EFE700FFEFE700FFF7E700299CEF00FFF7EF002973F70042E7
                  F700FFFFF700FF00FF006BC6FF008CF7FF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00333333333333
                  3333333333333333333333333333333333333333333333333333333333333333
                  3333333333333333333333330D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D
                  333333330D3636363636363636363636363636363636360D333333330D363636
                  3636363636363636363636363636360D333333330D3636363636363636363636
                  363636363636360D333333330D3636363636363636071036363636363636360D
                  333333330D3636363636363636090511103636363636360D333333330D363636
                  3636363636242035300F36363636360D333333330D3636363636363636363435
                  30300D363636360D333333330D36363636363636363636233130300F3636360D
                  333333330D3636363636363636363632233130300B36360D333333330D363636
                  363636363636363636233130300F360D333333330D3636363636363636363632
                  2F2F233130300D0D333333330D36363636363636363636363636362331301E07
                  333333330D36363636363636363636363632322F23261312073333330D363636
                  36363636363636363632322F2F0C362B0A0833330D3636363636363636363636
                  3632322F2D2D141C113033331111111111111111111111111111111111111115
                  2E303333110D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D112929333333111111
                  1111111111111111111111111111063333333333333333333333333333333333
                  3333333333333333333333333333333333333333333333333333333333333333
                  3333333333333333333333333333333333333333333333333333}
                ParentShowHint = False
                ShowHint = True
                OnClick = SpeedButtonAlterarKit2Click
              end
              object lbCorLote: TLabel
                Left = 687
                Top = 4
                Width = 96
                Height = 13
                Caption = 'Produtos sem grupo'
              end
              object btExcluirRegistro: TSpeedButton
                Left = 108
                Top = 2
                Width = 51
                Height = 45
                Hint = 'Enviar para Lixeira -  [PRO114]'
                Flat = True
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
                ParentShowHint = False
                ShowHint = True
                OnClick = SpeedButton2Click
              end
              object btLixeiraVazia: TSpeedButton
                Left = 161
                Top = 2
                Width = 51
                Height = 45
                Hint = 'Lixeira vazia'
                Flat = True
                Glyph.Data = {
                  76060000424D7606000000000000360400002800000018000000180000000100
                  08000000000040020000C30E0000C30E00000001000000010000009C0000089C
                  080010A5100018A5180021A5210029AD290031AD310039B5390042B542004AB5
                  4A0052BD52005ABD5A0063C65A006BC6630073C66300EFB56B007BC66B007373
                  7300EFB57300F7B57300F7BD73007BC6730073CE73007B7B7B00F7BD7B008CCE
                  7B00F7BD8400F7C68400FFC6840094CE84008CD684008C8C8C00EFBD8C00F7C6
                  8C00FFC68C0094D68C00949494009C9C9400A5A59400B5AD9400F7C69400FFC6
                  9400F7CE9400FFCE940094D694009CD69400BDD694009CDE9400B5DE94009C9C
                  9C00A5A59C00ADAD9C00C6B59C00D6BD9C00DEBD9C00FFCE9C00CED69C00FFD6
                  9C00B5DE9C00C6DE9C00CEDE9C00A5A5A500ADADA500BDBDA500C6BDA500D6C6
                  A500EFD6A500FFD6A500ADDEA500D6DEA500F7DEA500ADADAD00B5B5AD00C6C6
                  AD00D6C6AD00DEC6AD00FFD6AD00FFDEAD00D6E7AD00B5B5B500C6BDB500D6C6
                  B500DEC6B500D6CEB500E7CEB500E7DEB500FFDEB500C6E7B500DEE7B500E7E7
                  B500EFE7B500FFE7B500D6CEBD00DECEBD00FFE7BD00CEEFBD00DEEFBD00F7EF
                  BD00FFEFBD00CEEFC600D6EFC600DEEFC600F7EFC600FFEFC600F7EFCE00FFF7
                  CE00FFF7D600FFFFD600E7F7DE00FFF7DE00FFFFDE00F7FFE700FFFFE700FFFF
                  EF00FFFFF700FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00737373737373
                  73495353534033482573737373737373737373737373735E5E5E5E5B5656565E
                  673F2647737373737373737373735E5E675E564D4D5656565E67676724737373
                  7373737373735E675E5E564C43594E676A6D6D696748737373737373735C5E69
                  5E5B4D433758061907082C6F6A673E737373737373210F5E69694D4343380000
                  0000000A6D6E674F7373737373211212185E69695E2E0000010C09011E5E4224
                  7373737373211A1A1A1A1A212A2E0000026C6F4405612A31737373735C212121
                  2121212143380402000B71682D2E28254773737321292929292929295E3B5960
                  574472706D3A37263D73737321373737373737374D15666A5F06080B2D683727
                  3D73737321434343434343434C0E1D696E150000086743342473735C4D565656
                  565656565645020D5F2D000008675641247373215E5E5E5E5E5E5E5E5E5E1000
                  0100000008675E551F73732167676767676767676767660E0301020708696768
                  1F7373216A6A6A6A6A6A6A6A6A6A6A6A6457636F236A6A6A177373216E6E6E6E
                  6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E177373216E6E6E6E6E6E6E6E6A5E5B46
                  4656676A6E6E6E6E17737354696B6B6B6A695E2A1A120F121212181B46696E6E
                  17737373512121212151351A121212121218181A1A215B6E1173737373737373
                  737373737373351A18181A1A1B21214C11737373737373737373737373737373
                  4A201A1B21212929117373737373737373737373737373737373412121222928
                  31737373737373737373737373737373737373734B2035507373}
                ParentShowHint = False
                ShowHint = True
                OnClick = SpeedButton25Click
              end
              object btRestaurarRegistro: TSpeedButton
                Left = 215
                Top = 2
                Width = 51
                Height = 45
                Hint = 'Recuperar registro -  [PRO115]'
                Flat = True
                Glyph.Data = {
                  72040000424D7204000000000000320200002800000018000000180000000100
                  08000000000040020000120B0000120B00007F0000007F00000000000000FFFF
                  FF00FF00FF0000520200005101000051020000500100004F0100015703000156
                  03000155030001540300015302000153030001520200025A0400025904000258
                  040002570300025704000159040001580400025C0500025B0500037909000372
                  080003630700047D0A00047A0A0003600600035F070006910D00056209000562
                  0A00058F0D00058E0D00058C0D0006900E00068F0F00068E0E00079111000790
                  1000056A0B000896120007790E0009931300076A0E000A961400086A0F000A96
                  15000B9617000C9717000A7D13000A7B14000D991B00096D11000A7413000E9A
                  1C000A6E13000F9D1F00109F1F000C741700119F22000E841B000D7919000D78
                  180012A022000D761800108B1D000F831B000F7E1C001398230013A3270014A4
                  260015A7280016A72B0016A62A001181200018AA2D0018A92D00169528001383
                  23001689270019AB2F00169229001AAA31001CAF35001CAD33001BA531001A9F
                  2F0018952C00178C2A001FB439001FB43B001C9932001C99340022B63E001C98
                  33001F9C37001FA1390025BD440025BB430023AA400021A13B0022A03C0027B1
                  440027BC48002CC64F002CC44F0027AF45002CC14E0028B0470028AD470028AC
                  46002DBF4F002DC452002FBD540035D05E0036D05F0035CC5F0038D3640035CA
                  5F003CD86A003CD76A003BD1680042E2760041DC720002020202020202020202
                  0202020202020202020202020202020202020902020202020202020202020202
                  0202020202020202020909020202020202020202020202020202020202020202
                  02091102020202020202020202020202020202020202020202112A1302020202
                  02020202020202020202020202020202020F4010020202020202020202020202
                  0202020202020202020F5E1A0202020202020202060602020202020202020202
                  02146F410D020202020202020920060202020202020202020215746313020202
                  020202020A1820060202020202020202020A7079430D02020202020204681820
                  0602020202020202020D527D6D210A0202020202066226182004020202020202
                  02023A7C7B69371D090E0504075F2B23193006020202020202020B617E78725A
                  38343545502C2F2523183D06020202020202020A717A76736A60564F483B3229
                  24221B5B0A020202020202020B6777756C655D574C42362D27241F1C0A020202
                  02020202020B4D666E6B645C53493B332822510C02020202020202020202090D
                  46545958554E3E3931410602020202020202020202020202090B0D0A16474A3C
                  2E0602020202020202020202020202020202020212444B1E0302020202020202
                  020202020202020202020202103F170D02020202020202020202020202020202
                  0202020208090902020202020202020202020202020202020202020209090202
                  0202020202020202020202020202020202020202020202020202020202020202
                  02020202020202020202020202020202020202020202}
                ParentShowHint = False
                ShowHint = True
                OnClick = SpeedButton5Click
              end
              object btLixeiraCheia: TSpeedButton
                Left = 162
                Top = 2
                Width = 51
                Height = 45
                Hint = 'Ver registros da lixeira - [BAS018]'
                Flat = True
                Glyph.Data = {
                  F6060000424DF606000000000000360000002800000018000000180000000100
                  180000000000C0060000120B0000120B00000000000000000000FFFFFFFFFFFF
                  FFFEFFFFFFFFFFFFFFFFFEFFE8E8E0D1D1C9DDDCDFDEDFE1B7BEC2CCCDCEE3D9
                  DDF6EBEEFFF8FFFEFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFBC3C0B6CBC8B8D7CFB8EAE3B3E3E1B0
                  D0D1A4BFBF9FB2AE9D95928B98A097BDCDC1FCFAFDFFFEFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE3E2D0F8EFD9F7E7CDFB
                  E4C6FBE6B4FDE3B4EDD1AADBBEA1EAD2BAF8EED5DFE1C2B0B899948883B8AEAD
                  FEFAFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFFFFFFFFFFFFFFFCFCF5F8F5
                  D5FCEFCCFDE6C5FDE0C3E6CBBADBB4AEE8B5B7FAD2D0DFB5A7FCDDC3FDE4C3FD
                  E8C8F7EBDCC2B8AE8E867ED1D0CEFCF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFDE1D7B6FEF6CDFDEAC3FDE3C4EACDB6D4C5B4D4BBB6DFC0C0D6C7BBE5EA
                  CAEBF6D3F4FBD9F7F9DFE9F5D4F4F4D9ECE3D18F897FCBD0CCFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFEF7D4BC93E9CFA2FFF1CDEAD2BCE4CFC5DCC9C6D5C1C1
                  D6D5C566975E5AC45D28AA2D2BA3344EAC54B2E4ADE9FCD0FCF9DBF1EADA9691
                  8BFDF9FFFFFFFFFFFFFFFFFFFFFFFFFFFFF4D7DCB588D9B082F4D3B5F5E1D8DE
                  D1D7F1CEDFE4C5D0D3DDC552A44D05990700A200019202178B191F8527B3DFA0
                  FBFCD3FEEFD8A99B92E5E7E4FFFFFFFFFFFFFFFFFFFFFFFFF8DEBBE7B78AF2C5
                  9CFFF0D8ECE0DFE2DCE7F7D9D8EECDC4C9D4A7369B040995000498046CC96AAA
                  D8A649AF57478D39EFF7C3DDC6A4B5A293DBD9D8FDF2FDFFFFFFFFFFFFFFFFFD
                  F7C8ACE9B99AFCEFD9F0F3EAEDEBEEFAE8EFF6D4CBCFAEA1BBCE963499011391
                  03009E0555B75DEAF8EADDF6DD8CBB79AEC789D6D190BEAE89CDCACCECE5ECFF
                  FFFFFFFFFFFFF8ECF1C1A8F4D3B7FFFFEFF7FEFAF9F4F8FDE2F1DE9CBAD3C2B6
                  D7E7C1B7CAA585B77B55B74F50A846C6E5B8E6F7DFDCFAC6B0BF8CEFDBA4D7BA
                  9BBBB1B5E8DDE8FDFDFDFFFFFFF6EADBE8C5ADFDF0D7FBFEEEFAFEFCFFF9FDE2
                  B4C1E09DBACEBBB0B3CA9EE3EFD1F1E9E0F6F1E59CC38EA1E497BCE3B5CAF3B5
                  E4E9C2FEDDB6F3C7B3AD9DA1F2FFF0FFFFFFFFFFFFEFDDD0E8D1B9FFFEE7F7FC
                  EEFBFEFBFAE9EBCB9C9FD5ACA1DFB4AFC8CCA788C479DDF9D2FBEAF6A5BDA509
                  85141E841D2C841CCFEDB4F4D6AEFECFBFA99398F3FCEDFFFFFFFFFFFFE7D7C8
                  F6EAD0FEFFE7F8FFEFF9FCF5D5C3C1D0A9A5D2B2A6E6B3BDE4E0C841973966CA
                  68D4FAD4D1FFD621A92B0198020F9608BDFBAEE7DCA9FFD8C0AC9697EDF3E4FF
                  FEFFFFFFFFE8DCC9FEF9DEFFFEE5FCFEEDF9F8ECE5D8CDF8E8E0FDE2F3E2CBD9
                  CBD2C5A9DCA71C841C139D131FA319198B0E069A05049304B3FAADEEEDB8FEE0
                  C1AD9B97EFF2E5FFFEFFFFFFFFF2E6CEFFFFE0FFFDDFFEFDEAFCFBEBFDFCE9FE
                  FEECFCF5FDE3EDE9DEE7E1DFE0DE9FCA9C1B8F1911900929851824921D208B1E
                  C2F2C0F4EFC6FFEBCAB2AA9DE2EBDAFFFFFFFFFFFFFFFADFFDFAD6FEFCDCFDF8
                  DDFAF9E5F8FBE4F1FCE0E5FFE4EAFFEAF7FAF6F1DEEDF0E9ECD8F9D5A2DCA199
                  D898CEFFC795CC92D3E9D1FFF8DDFFF5D5BABAA7D3E0CCFFFFFFFFFFFFFFFFF0
                  F6FDDDF3FDD9F7FEDBFAFDE2F4FCE7EEFEEEDEFFF3E7FFFAF5FFFCFCFAF8F2EE
                  E8F5F8EBF9FFF3F5FFF1F3FDF9F3FBF2F5F8E8FFFEE5FDFADDCBC9B4CFCEC0FF
                  FCFFFFFFFFFFFCE3FDFDDBFDFEDAFFFED9FAF8D8F2FCE3ECFEECE7FDF8E7F8F4
                  EFF3EFFAF3EFEDE1DBEEE2DAF9EFE7FEFCF4F9F8F4FFFEF7FEFDE7FFFEE2FEFC
                  E0D5D3C1B8B8B1FFFFFFFFFFFFF6EDD4FDF8DBFFFCDAFFFADBFCF8E0EDF5E0D9
                  F3E0DDF0EBEAF6F4FAFBFAFFFCFBECE1E0DACBC8F9EFECFFFDF7F1E5D3D9C8AF
                  F8EBCAFFFBD7FFFEDEE7E4D1ADB0AEFFFFFFFFFFFFFCFAF2EDE0CEF4DFCCF8E5
                  D3F0E8D8D5E7D8D8FBF0E5FFFEEAFFFFF1FFFFF5FDFCEBF0EFD8DBDBF9FCFCFA
                  FCF8EBCEAADEBA8DE2C18EF0D6A2FFF8CFF7F0D9A7A59FFFFEFFFFFFFFFFFFFF
                  FFFEFFFFFFFFFFFEFFFFFCFFD8EEEDCFFAF8D4FEFCD7FFFDDCFEFEDDFEFDD9FB
                  FBCDF0EFDAFCFCDFFAF4E8C494F2C184F7C685F3C587F1CD99FCEBCCADA296FF
                  FDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE3F4FAD0F5F8C8EEEFC9F2F2
                  CDF8F7CCFAFACDFEFFCAFEFFC2F9FABDE8E3DDBE90F3C289FDCA8AFAC98BF8CE
                  9AE0C4A2C5B7A8FFFDFFFFFFFFFFFFFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFF5FFFFDBF5F7CEF0F2C7F3F7C2F4F9C2F8FD98C5C7DCC8A9E9C59C
                  EDC394F4C898E8C29ADEC6ACF2EAE1FFFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFDCF8FDCFF4FCBFEBF6B0
                  D6DDFDFBEDFDF3DBF6E4C3F4DDBAF8E8C9FDF4E4FFF4FFFFFFFF}
                ParentShowHint = False
                ShowHint = True
                OnClick = SpeedButton25Click
              end
              object SpeedButton68: TSpeedButton
                Left = 857
                Top = 40
                Width = 23
                Height = 21
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
              end
              object btSincronizarKit: TSpeedButton
                Left = 269
                Top = 2
                Width = 51
                Height = 45
                Hint = 'Sincronizar kit - [PRO462]'
                Flat = True
                Glyph.Data = {
                  36150000424D361500000000000036000000280000002A0000002A0000000100
                  18000000000000150000C40E0000C40E00000000000000000000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFAFAA7A1A45D555C443A
                  4140363C40363C40363C40363C40363C40363C40363C40363C40363C40363C40
                  363C40363C40363C40363C40363C40363C443A415D555DA7A2A5FAFAFAFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE5E4E44D454C6554868971D5977D
                  F1987EF3987EF3987EF3987EF3987EF3987EF3987EF3987EF3987EF3987EF398
                  7EF3987EF3987EF3987EF3987EF3987EF3977DF18871D462538550464CE6E5E5
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F94D444B7E68BE987EF3856DCD6955
                  966B589B6C599E6C599E6C599E6C599E6C599E6C599E6C599E6C599E6C599E6C
                  599E6C599E6C599E6C599E6C599E6B589B695596856ECD987EF37D67BD50464C
                  FAFAFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA6A1A3635487987EF3715EA8715CA5987E
                  F3987EF3987EF3987EF3987EF3987EF3987EF3987EF3987EF3987EF3987EF398
                  7EF3987EF3987EF3987EF3987EF3987EF3987EF3705CA4735EAA987EF3625385
                  A7A2A5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5C53598972D6836CCB715CA5987EF3987E
                  F3987EF3987EF3987EF3987EF3987EF3987EF3987EF3987EF3987EF3987EF398
                  7EF3987EF3987EF3987EF3987EF3987EF3987EF3987EF3705CA4856DCD8871D4
                  5D555DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF483C43977DF1695596987EF3987EF3987E
                  F3987EF3987EF3987EF3987EF3987EF3947BEC816AC47A69AC7969A9816CC195
                  7CED987EF3987EF3987EF3987EF3987EF3987EF3987EF3987EF3695596977DF1
                  483C43FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF453B42987EF36A5799987EF3987EF3987E
                  F3987EF3987EF3987EF38F76DE756A929291A1C4CCCFD0D9DACFD8D9C8D1D394
                  91A2786D958C75DA987EF3987EF3987EF3987EF3987EF3987EF36A5799987EF3
                  453B42FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF453B42987EF36A5799987EF3987EF38C75
                  D9786D939178E67F6DB49290A0C4CBCE857F99776A9A7A69AB7B6AAE76699A82
                  7B96C2CACE9897A67F6EB4987EF3987EF3987EF3987EF3987EF36A5799987EF3
                  453B42FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF453B42987EF36A5799987EF3987EF37668
                  A0CFD8D960537CB2B6C09795A57E6DB6987EF3987EF3987EF3987EF3987EF398
                  7EF37E6DB6908E9FB3B6C17F6DB4987EF3987EF3987EF3987EF36A5799987EF3
                  453B42FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF453B42987EF36A5799987EF3987EF37667
                  9FD7E2E393929C9795A58A73D4987EF3987EF3987EF3987EF3987EF3987EF398
                  7EF3987EF38B75D59290A19796A58D76DB987EF3987EF3987EF36A5799987EF3
                  453B42FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF453B42987EF36A5799987EF3987EF37667
                  9FEAF8F9E8F4F576717F787090937AE9987EF3987EF3987EF3987EF3987EF398
                  7EF3987EF3987EF3806DB8C1C8CD786E96987EF3987EF3987EF36A5799987EF3
                  453B42FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF453B42987EF36A5799987EF3987EF37B6A
                  AE8E8AA08F8CA28F8CA27E78919077E3987EF3987EF3987EF3987EF3987EF398
                  7EF3987EF3987EF3987EF3827C979492A3947AEA987EF3987EF36A5799987EF3
                  453B42FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF453B42987EF36A5799987EF3987EF3987E
                  F3987EF3987EF3987EF3987EF3987EF3987EF3987EF3987EF3987EF3987EF398
                  7EF3987EF3987EF3987EF3776A9BC6CED0826DC3987EF3987EF36A5799987EF3
                  453B42FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF453B42987EF36A5799987EF3987EF3987E
                  F3987EF3987EF3987EF3987EF3987EF3987EF3987EF3987EF3987EF3987EF398
                  7EF3987EF3987EF3987EF38671CC7D798A8671CC987EF3987EF36A5799987EF3
                  453B42FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF453B42987EF36A5799987EF3987EF38672
                  CD7D798B8671CC987EF3987EF3987EF3987EF3987EF3987EF3987EF3987EF398
                  7EF3987EF3987EF3987EF3987EF3987EF3987EF3987EF3987EF36A5799987EF3
                  453B42FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF453B42987EF36A5799987EF3987EF3816D
                  C2C7D0D1776A9C987EF3987EF3987EF3987EF3987EF3987EF3987EF3987EF398
                  7EF3987EF3987EF3987EF3987EF3987EF3987EF3987EF3987EF38870D3987EF3
                  453B42FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF453B42987EF36A5799987EF3987EF3937A
                  EA9594A3827C98987EF3987EF3987EF3987EF3987EF3987EF3987EF3987EF398
                  7EF39077E47E78918F8CA28F8CA28E8AA17B6BAE987EF3987EF36A5799987EF3
                  453B42FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF453B42987EF36A5799987EF3987EF3987E
                  F3796E95C0C5CB816EBA987EF3987EF3987EF3987EF3987EF3987EF3987EF398
                  7EF3937AE978709076717FE8F4F5EBF9FA76689F987EF3987EF37863B6987EF3
                  453B42FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF453B42987EF36A5799987EF3987EF3987E
                  F38C75DA999AA88F8E9F8C74D8987EF3987EF3987EF3987EF3987EF3987EF398
                  7EF3987EF38A73D49694A494949ED7E2E376689F987EF3987EF37863B5987EF3
                  453B42FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF453B42987EF36A5799987EF3987EF3987E
                  F3987EF37E6DB3B4B9C28F8E9F806DBA987EF3987EF3987EF3987EF3987EF398
                  7EF37E6DB69492A3B3B7C160537CCFD8D97668A0987EF3987EF38770D4987EF3
                  453B42FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF453B42987EF36A5799987EF3987EF3987E
                  F3987EF3987EF37E6DB39A99A7C0C6CB817B9776689A7B6AB07B6AAC776A9A84
                  7E98C2CACE9491A27E6CB39178E6786E938C75D9987EF3987EF3987EF3987EF3
                  453B42FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF453B42987EF36A5799987EF3987EF3987E
                  F3987EF3987EF3987EF38C73D8786D949493A3C8D1D3D0D9DAD0D9DAC5CECF93
                  90A2766B938F76DE987EF3987EF3987EF3987EF3987EF3987EF3987EF3987EF3
                  453B42FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF483C43977DF1695596987EF3987EF3987E
                  F3987EF3987EF3987EF3987EF3987EF3947BEC7F6BC07A6AA97A69AC816BC394
                  7BEC987EF3987EF3987EF3987EF3987EF3987EF3987EF3987EF3987EF3977DF1
                  483C43FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5C535A8A71D7836CCA715DA6987EF3987E
                  F3987EF3987EF3987EF3987EF3987EF3987EF3987EF3987EF3987EF3987EF398
                  7EF3987EF3987EF3987EF3987EF3987EF3987EF3987EF3987EF3987EF38971D5
                  5D545CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA5A0A265558A987EF3715DA6715DA6987E
                  F3987EF3987EF3987EF3987EF3987EF3987EF3987EF3987EF3987EF3987EF398
                  7EF3987EF3987EF3987EF3987EF3987EF3987EF3987EF3987EF3987EF3655486
                  A7A1A4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F84D444A7D68BF987EF3836CCA6956
                  976B589B6C599E6C599E6C599E6C599E6C599E6C599E6C599E6C599E6C599E6C
                  599E6C599E6C599E6C599E6D599F967DEF987EF3987EF3987EF37E68BE4D444B
                  F9F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE4E3E34D434A65558A8972D6977E
                  F2987EF3987EF3987EF3987EF3987EF3987EF3987EF3987EF3987EF3987EF398
                  7EF3987EF3987EF3987EF3987EF3987EF3977EF28971D56354874D454CE5E4E4
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F8A39FA15A5159443A
                  4140363C40363C40363C40363C40363C40363C40363C40363C40363C40363C40
                  363C40363C40363C40363C40363C40363C443A415C5359A6A1A3F9F9F9FFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000}
                ParentShowHint = False
                ShowHint = True
                OnClick = btSincronizarKitClick
              end
              object pnCorLote: TPanel
                Left = 614
                Top = 4
                Width = 49
                Height = 13
                BevelOuter = bvNone
                Color = 13303807
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clRed
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentBackground = False
                ParentFont = False
                TabOrder = 1
              end
              object ckPermOpcaoMarcadas: TCheckBox
                Left = 534
                Top = 3
                Width = 299
                Height = 17
                Hint = 'Salvar/permanecer op'#231#245'es marcadas na altera'#231#227'o em lote'
                Caption = 'Salvar/permanecer op'#231#245'es marcadas na altera'#231#227'o em lote'
                Color = clBtnFace
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentColor = False
                ParentFont = False
                ParentShowHint = False
                ShowHint = True
                TabOrder = 0
                OnClick = ckPermOpcaoMarcadasClick
              end
            end
          end
        end
        object tsAlterDadosLote: TTabSheet
          Caption = 'tsAlterDadosLote'
          ImageIndex = 7
          object ScrollBox6: TScrollBox
            Left = 0
            Top = 0
            Width = 895
            Height = 587
            Align = alClient
            TabOrder = 0
            object GroupBox9: TGroupBox
              Left = 0
              Top = 0
              Width = 891
              Height = 550
              Align = alTop
              Caption = 'ATUALIZAR INFORMA'#199#213'ES DO KIT'
              TabOrder = 0
              object Label473: TLabel
                Left = 8
                Top = 13
                Width = 855
                Height = 13
                Caption = 
                  'Dados  do Kit        -                    -                    -' +
                  '                    -                    -                    - ' +
                  '                   -                    -                    -  ' +
                  '                  -                    -                    -   ' +
                  '                 '
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlue
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
              end
              object pnSomenteKitTodo: TPanel
                Left = 1
                Top = 25
                Width = 280
                Height = 28
                TabOrder = 0
                object lbSomenteKitTodo: TLabel
                  Left = 98
                  Top = 7
                  Width = 84
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Somente Todo Kit'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                end
                object CheckBox22: TCheckBox
                  Left = 1
                  Top = 101
                  Width = 40
                  Height = 17
                  TabOrder = 1
                end
                object ckSomenteKitTodo: TCheckBox
                  Left = 21
                  Top = 6
                  Width = 45
                  Height = 17
                  TabOrder = 0
                  OnClick = ckSomenteKitTodoClick
                end
                object cbSomenteKitTodo: TComboBox
                  Left = 188
                  Top = 3
                  Width = 80
                  Height = 21
                  Hint = 'Somente Kit Todo'
                  Style = csDropDownList
                  ItemHeight = 13
                  ItemIndex = 0
                  TabOrder = 2
                  Text = ' '
                  Items.Strings = (
                    ' '
                    'N'
                    'S')
                end
              end
              object pnVendaOnline: TPanel
                Left = 283
                Top = 25
                Width = 280
                Height = 28
                TabOrder = 1
                object lbVendaOnline: TLabel
                  Left = 119
                  Top = 7
                  Width = 63
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Venda Online'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                end
                object CheckBox4: TCheckBox
                  Left = 1
                  Top = 101
                  Width = 40
                  Height = 17
                  TabOrder = 1
                end
                object ckVendaOnline: TCheckBox
                  Left = 21
                  Top = 6
                  Width = 45
                  Height = 17
                  TabOrder = 0
                  OnClick = ckVendaOnlineClick
                end
                object cbVendaOnline: TComboBox
                  Left = 188
                  Top = 3
                  Width = 80
                  Height = 21
                  Hint = 'Venda Online'
                  Style = csDropDownList
                  ItemHeight = 13
                  ItemIndex = 0
                  TabOrder = 2
                  Text = ' '
                  Items.Strings = (
                    ' '
                    'N'
                    'S')
                end
              end
            end
            object Panel119: TPanel
              Left = 0
              Top = 554
              Width = 891
              Height = 29
              Align = alBottom
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 1
              object btSalvarServLote: TBitBtn
                Left = 364
                Top = 0
                Width = 75
                Height = 25
                Hint = 'OK - [PRO461]'
                Caption = '&OK'
                TabOrder = 0
                OnClick = btSalvarServLoteClick
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
              object btnCancServLote: TBitBtn
                Left = 445
                Top = 0
                Width = 75
                Height = 25
                Hint = 'Cancelar'
                Caption = '&Cancela'
                TabOrder = 1
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
              object btSairServLote: TBitBtn
                Left = 604
                Top = 0
                Width = 75
                Height = 25
                Hint = 'Sair'
                Caption = '&Sair'
                TabOrder = 2
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
            end
          end
        end
      end
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 622
    Width = 910
    ExplicitTop = 622
    ExplicitWidth = 910
  end
  inherited pnStatusProcessamento: TPanel
    inherited lbTextoProcessamento: TLabel
      Width = 477
      Height = 21
    end
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
