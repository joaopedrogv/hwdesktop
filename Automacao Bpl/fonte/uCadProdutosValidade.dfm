inherited frmCadProdutosValidade: TfrmCadProdutosValidade
  Caption = 'Produtos Validade'
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
                ExplicitLeft = 0
                ExplicitTop = 0
                ExplicitWidth = 0
                ExplicitHeight = 0
                object GroupBox4: TGroupBox
                  Left = 0
                  Top = 0
                  Width = 775
                  Height = 318
                  Align = alTop
                  Caption = 'Cadastro Produtos Validade'
                  TabOrder = 0
                  object Panel4: TPanel
                    Left = 2
                    Top = 15
                    Width = 771
                    Height = 250
                    Align = alTop
                    BevelOuter = bvNone
                    TabOrder = 0
                    object Label6: TLabel
                      Left = 51
                      Top = 13
                      Width = 42
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Produto:'
                    end
                    object Label7: TLabel
                      Left = 60
                      Top = 44
                      Width = 33
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Grade:'
                    end
                    object Label8: TLabel
                      Left = 44
                      Top = 75
                      Width = 49
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Num Lote:'
                    end
                    object Label9: TLabel
                      Left = 41
                      Top = 107
                      Width = 52
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Qtde Lote:'
                    end
                    object Label10: TLabel
                      Left = 11
                      Top = 136
                      Width = 82
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Data Fabrica'#231#227'o:'
                    end
                    object Label11: TLabel
                      Left = 23
                      Top = 166
                      Width = 70
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Data Validade:'
                    end
                    object Label12: TLabel
                      Left = 25
                      Top = 198
                      Width = 68
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Qtde Compra:'
                    end
                    object Label13: TLabel
                      Left = 34
                      Top = 230
                      Width = 59
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Fornecedor:'
                    end
                    object Label18: TLabel
                      Left = 628
                      Top = 13
                      Width = 33
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Grupo:'
                    end
                    object Label19: TLabel
                      Left = 624
                      Top = 44
                      Width = 37
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Codigo:'
                    end
                    object DBEditCodGrade: TDBEdit
                      Left = 99
                      Top = 41
                      Width = 66
                      Height = 21
                      DataField = 'COD_GRADE'
                      DataSource = dtmProdutos.dsProdutosRastro
                      Enabled = False
                      TabOrder = 4
                    end
                    object DBEditNumLote: TDBEdit
                      Left = 99
                      Top = 72
                      Width = 94
                      Height = 21
                      DataField = 'NLOTE'
                      DataSource = dtmProdutos.dsProdutosRastro
                      TabOrder = 6
                    end
                    object DBEditQtdeLote: TDBEdit
                      Left = 99
                      Top = 104
                      Width = 94
                      Height = 21
                      DataField = 'QLOTE'
                      DataSource = dtmProdutos.dsProdutosRastro
                      TabOrder = 7
                    end
                    object DBEditDataFabricante: TDBEdit
                      Left = 99
                      Top = 133
                      Width = 94
                      Height = 21
                      DataField = 'DFAB'
                      DataSource = dtmProdutos.dsProdutosRastro
                      TabOrder = 8
                    end
                    object DBEditDataValidade: TDBEdit
                      Left = 99
                      Top = 163
                      Width = 94
                      Height = 21
                      DataField = 'DVAL'
                      DataSource = dtmProdutos.dsProdutosRastro
                      TabOrder = 9
                    end
                    object DBEditQtdeCompra: TDBEdit
                      Left = 99
                      Top = 195
                      Width = 94
                      Height = 21
                      DataField = 'QTDE_COMPRA'
                      DataSource = dtmProdutos.dsProdutosRastro
                      TabOrder = 10
                    end
                    object DBEditCodCliente: TDBEdit
                      Left = 99
                      Top = 227
                      Width = 66
                      Height = 21
                      DataField = 'COD_CLIENTE'
                      DataSource = dtmProdutos.dsProdutosRastro
                      TabOrder = 11
                      OnExit = DBEditCodClienteExit
                      OnKeyDown = DBEditCodClienteKeyDown
                    end
                    object DBEditGrupoProd: TDBEdit
                      Left = 667
                      Top = 10
                      Width = 66
                      Height = 21
                      DataField = 'GRUPO_PROD'
                      DataSource = dtmProdutos.dsProdutosRastro
                      Enabled = False
                      TabOrder = 2
                    end
                    object DBEditCodProd: TDBEdit
                      Left = 667
                      Top = 41
                      Width = 66
                      Height = 21
                      DataField = 'COD_PROD'
                      DataSource = dtmProdutos.dsProdutosRastro
                      Enabled = False
                      TabOrder = 3
                    end
                    object DBEditNumFabProd: TDBEdit
                      Left = 99
                      Top = 10
                      Width = 94
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'NUM_FAB_PROD_CALC'
                      DataSource = dtmProdutos.dsProdutosRastro
                      TabOrder = 0
                      OnExit = DBEditNumFabProdExit
                      OnKeyDown = DBEditNumFabProdKeyDown
                    end
                    object DBEditDescricaoProduto: TDBEdit
                      Left = 199
                      Top = 10
                      Width = 394
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'DESCR_PROD_CALC'
                      DataSource = dtmProdutos.dsProdutosRastro
                      Enabled = False
                      TabOrder = 1
                      OnExit = DBEditNumFabProdExit
                    end
                    object DBEditDescricaoGrade: TDBEdit
                      Left = 171
                      Top = 41
                      Width = 422
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'GRADE_CALC'
                      DataSource = dtmProdutos.dsProdutosRastro
                      Enabled = False
                      TabOrder = 5
                      OnExit = DBEditNumFabProdExit
                    end
                    object DBEditNomeCliente: TDBEdit
                      Left = 171
                      Top = 227
                      Width = 422
                      Height = 21
                      DataField = 'NOME_CLIENTE_CALC'
                      DataSource = dtmProdutos.dsProdutosRastro
                      Enabled = False
                      TabOrder = 12
                    end
                  end
                  object GroupBoxDocFiscal: TGroupBox
                    Left = 2
                    Top = 265
                    Width = 771
                    Height = 52
                    Align = alTop
                    Caption = 'Nota Fiscal'
                    TabOrder = 1
                    object Label14: TLabel
                      Left = 52
                      Top = 25
                      Width = 41
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Num NF:'
                    end
                    object Label15: TLabel
                      Left = 196
                      Top = 25
                      Width = 28
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Serie:'
                    end
                    object Label16: TLabel
                      Left = 316
                      Top = 25
                      Width = 52
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Data Lanc:'
                    end
                    object Label17: TLabel
                      Left = 466
                      Top = 25
                      Width = 55
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Valor Total:'
                    end
                    object DBEditNumNF: TDBEdit
                      Left = 99
                      Top = 20
                      Width = 66
                      Height = 21
                      DataField = 'NUM_NF'
                      DataSource = dtmProdutos.dsProdutosRastro
                      TabOrder = 0
                    end
                    object DBEditSerieNF: TDBEdit
                      Left = 230
                      Top = 20
                      Width = 66
                      Height = 21
                      DataField = 'SERIE'
                      DataSource = dtmProdutos.dsProdutosRastro
                      TabOrder = 1
                    end
                    object DBEditDataLancNF: TDBEdit
                      Left = 374
                      Top = 20
                      Width = 75
                      Height = 21
                      DataField = 'DATA_LANC'
                      DataSource = dtmProdutos.dsProdutosRastro
                      TabOrder = 2
                    end
                    object DBEditValorNF: TDBEdit
                      Left = 527
                      Top = 20
                      Width = 66
                      Height = 21
                      DataField = 'VALOR_TOTAL'
                      DataSource = dtmProdutos.dsProdutosRastro
                      TabOrder = 3
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
            Height = 81
            ExplicitHeight = 81
            inherited Label1: TLabel
              Top = 141
              Visible = False
              ExplicitTop = 141
            end
            inherited Label2: TLabel
              Top = 168
              Visible = False
              ExplicitTop = 168
            end
            inherited Label3: TLabel
              Top = 141
              ExplicitTop = 141
            end
            inherited Label4: TLabel
              Top = 168
              Visible = False
              ExplicitTop = 168
            end
            inherited Label5: TLabel
              Top = 141
              Visible = False
              ExplicitTop = 141
            end
            inherited imgInformation: TImage
              Height = 64
              ExplicitHeight = 168
            end
            object btSelectAll: TSpeedButton [6]
              Left = 498
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
              Left = 525
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
            inherited MaskEdit3: TMaskEdit
              Top = 160
              Visible = False
              ExplicitTop = 160
            end
            inherited MaskEdit1: TMaskEdit
              Top = 160
              Visible = False
              ExplicitTop = 160
            end
            inherited MaskEdit2: TMaskEdit
              Top = 160
              Visible = False
              ExplicitTop = 160
            end
            inherited ComboBox1: TComboBox
              Top = 133
              Visible = False
              ExplicitTop = 133
            end
            inherited ComboBox2: TComboBox
              Top = 133
              ExplicitTop = 133
            end
            inherited CheckBox3: TCheckBox
              Top = 165
              Enabled = False
              Visible = False
              ExplicitTop = 165
            end
            inherited CheckBox1: TCheckBox
              Top = 165
              Visible = False
              ExplicitTop = 165
            end
            inherited ComboBox3: TComboBox
              Top = 132
              Visible = False
              ExplicitTop = 132
            end
            inline FilterFramePadrao1: TFilterFramePadrao
              Left = 0
              Top = 13
              Width = 407
              Height = 54
              TabOrder = 11
              TabStop = True
              ExplicitTop = 13
              inherited pnCampo: TPanel
                inherited lbCampo: TLabel
                  ExplicitLeft = 21
                  ExplicitTop = 24
                end
              end
              inherited pnCondicao: TPanel
                inherited edCondicao: TComboBox
                  ExplicitLeft = 64
                  ExplicitWidth = 127
                end
              end
              inherited pnConteudos: TPanel
                inherited pnConteudo1: TPanel
                  inherited edConteudo1: TMaskEdit
                    ExplicitLeft = 64
                    ExplicitWidth = 140
                  end
                end
                inherited pnConteudo2: TPanel
                  inherited edConteudo2: TMaskEdit
                    ExplicitLeft = 64
                    ExplicitWidth = 72
                  end
                end
                inherited pnBtns: TPanel
                  inherited lbCountFiltros: TLabel
                    Width = 27
                    Height = 21
                  end
                end
              end
            end
          end
          inherited Panel1: TPanel
            Top = 81
            Height = 429
            ExplicitTop = 81
            ExplicitHeight = 429
            inherited Splitter1: TSplitter
              Height = 368
              ExplicitHeight = 264
            end
            inherited DBGrid1: TDBGrid
              Height = 368
              OnCellClick = DBGrid1CellClick
              OnDrawColumnCell = DBGrid1DrawColumnCell
              OnKeyDown = DBGrid1KeyDown
            end
            inherited Panel2: TPanel
              inherited SpeedButton2: TSpeedButton
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
                Left = 179
                Enabled = False
                Visible = False
                ExplicitLeft = 179
              end
              inherited SpeedButton26: TSpeedButton
                Flat = False
                Visible = False
              end
            end
            inherited GroupBox2: TGroupBox
              Height = 368
              ExplicitHeight = 368
              inherited ScrollBox2: TScrollBox
                Height = 351
                ExplicitHeight = 351
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
        object tsSelecionaGradeProd: TTabSheet
          Caption = 'tsSelecionaGradeProd'
          ImageIndex = 3
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object ScrollBox4: TScrollBox
            Left = 0
            Top = 0
            Width = 783
            Height = 510
            Align = alClient
            TabOrder = 0
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
                object Panel5: TPanel
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
                object Panel6: TPanel
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
              object BitBtn8: TBitBtn
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
                OnClick = BitBtn8Click
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
  inherited pnStatusProcessamento: TPanel
    inherited lbTextoProcessamento: TLabel
      Width = 477
      Height = 21
    end
  end
  object dsSelecionaGradeProd: TDataSource
    Left = 611
    Top = 373
  end
end
