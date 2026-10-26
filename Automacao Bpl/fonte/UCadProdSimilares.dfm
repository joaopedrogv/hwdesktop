inherited FrmCadProdSimilares: TFrmCadProdSimilares
  Left = 239
  Caption = 'Produtos / Grupos Similares'
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
              ActivePage = tsCadastroG
              inherited TabSheet3: TTabSheet
                ExplicitLeft = 4
                ExplicitTop = 27
                ExplicitWidth = 775
                ExplicitHeight = 431
                inherited ScrollBox3: TScrollBox
                  inherited GroupBox1: TGroupBox
                    Height = 94
                    ExplicitHeight = 94
                  end
                end
              end
              object tsCadastroG: TTabSheet
                Caption = 'tsCadastroG'
                ImageIndex = 1
                object ScrollBoxG: TScrollBox
                  Left = 0
                  Top = 0
                  Width = 775
                  Height = 431
                  Align = alClient
                  TabOrder = 0
                  object GroupBox4: TGroupBox
                    Left = 0
                    Top = 0
                    Width = 771
                    Height = 427
                    Align = alClient
                    Caption = 'Manuten'#231#227'o de Grupo Similar'
                    TabOrder = 0
                    object GroupBox6: TGroupBox
                      Left = 2
                      Top = 89
                      Width = 767
                      Height = 336
                      Align = alClient
                      Caption = 'Produtos'
                      TabOrder = 1
                      object PanelProduto: TPanel
                        Left = 2
                        Top = 15
                        Width = 763
                        Height = 73
                        Align = alTop
                        BevelOuter = bvNone
                        TabOrder = 0
                        object Label13: TLabel
                          Left = 342
                          Top = 19
                          Width = 39
                          Height = 13
                          Caption = 'Grupo:'
                          Font.Charset = ANSI_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -11
                          Font.Name = 'MS Sans Serif'
                          Font.Style = [fsBold]
                          ParentFont = False
                        end
                        object Label14: TLabel
                          Left = 463
                          Top = 20
                          Width = 44
                          Height = 13
                          Caption = 'C'#243'digo:'
                          FocusControl = DBEditGrupoProd
                          Font.Charset = ANSI_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -11
                          Font.Name = 'MS Sans Serif'
                          Font.Style = [fsBold]
                          ParentFont = False
                        end
                        object Label15: TLabel
                          Left = 67
                          Top = 49
                          Width = 62
                          Height = 13
                          Caption = 'Descri'#231#227'o:'
                          Font.Charset = ANSI_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -11
                          Font.Name = 'MS Sans Serif'
                          Font.Style = [fsBold]
                          ParentFont = False
                        end
                        object Label16: TLabel
                          Left = 28
                          Top = 20
                          Width = 101
                          Height = 13
                          Alignment = taRightJustify
                          Caption = 'Num. Fabrica'#231#227'o:'
                          Font.Charset = ANSI_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -11
                          Font.Name = 'MS Sans Serif'
                          Font.Style = [fsBold]
                          ParentFont = False
                        end
                        object DBEditGrupoProd: TDBEdit
                          Left = 385
                          Top = 17
                          Width = 68
                          Height = 21
                          CharCase = ecUpperCase
                          DataField = 'GRUPO_PROD'
                          DataSource = dtmProdutos.dsGrupoProdSimilaresItens
                          Enabled = False
                          TabOrder = 1
                        end
                        object DBEditCodigoProd: TDBEdit
                          Left = 513
                          Top = 17
                          Width = 91
                          Height = 21
                          CharCase = ecUpperCase
                          DataField = 'COD_PROD'
                          DataSource = dtmProdutos.dsGrupoProdSimilaresItens
                          Enabled = False
                          TabOrder = 2
                        end
                        object EditNumFabGrupo: TEdit
                          Left = 131
                          Top = 17
                          Width = 190
                          Height = 21
                          CharCase = ecUpperCase
                          TabOrder = 0
                          Text = 'EDITNUMFABGRUPO'
                          OnExit = EditNumFabGrupoExit
                          OnKeyDown = EditNumFabGrupoKeyDown
                        end
                        object EditDescrProdGrupo: TEdit
                          Left = 131
                          Top = 46
                          Width = 473
                          Height = 21
                          CharCase = ecUpperCase
                          Enabled = False
                          TabOrder = 3
                          Text = 'EDITDESCRPRODGRUPO'
                        end
                      end
                      object DBGrid3: TDBGrid
                        Left = 2
                        Top = 141
                        Width = 763
                        Height = 193
                        Align = alClient
                        DataSource = dtmProdutos.dsGrupoProdSimilaresItens
                        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                        PopupMenu = PopupMenuGrupoSim
                        TabOrder = 2
                        TitleFont.Charset = DEFAULT_CHARSET
                        TitleFont.Color = clWindowText
                        TitleFont.Height = -11
                        TitleFont.Name = 'Tahoma'
                        TitleFont.Style = []
                        OnDrawColumnCell = DBGrid3DrawColumnCell
                        Columns = <
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
                            FieldName = 'NUM_FAB_PROD'
                            Visible = True
                          end
                          item
                            Expanded = False
                            FieldName = 'DESCR_PROD'
                            Width = 440
                            Visible = True
                          end>
                      end
                      object pnOpcaoGrupo: TPanel
                        Left = 2
                        Top = 88
                        Width = 763
                        Height = 53
                        Align = alTop
                        BevelKind = bkTile
                        BevelOuter = bvNone
                        TabOrder = 1
                        object lbTextoBotaoDireito: TLabel
                          Left = 370
                          Top = 34
                          Width = 364
                          Height = 13
                          Alignment = taRightJustify
                          Caption = 
                            'Clique com bot'#227'o direito do mouse na tabela para alterar o produ' +
                            'to principal'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clBlue
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = []
                          ParentFont = False
                        end
                        object BitBtn_Novo_Produto: TBitBtn
                          Left = 224
                          Top = 5
                          Width = 75
                          Height = 25
                          Hint = 'Incluir - [PRO355]'
                          Caption = 'Incluir'
                          TabOrder = 0
                          OnClick = BitBtn_Novo_ProdutoClick
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
                        object BitBtn_Salvar_Produto: TBitBtn
                          Left = 305
                          Top = 5
                          Width = 75
                          Height = 25
                          Hint = 'Salvar - [PRO356]'
                          Caption = 'Salvar'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = []
                          ParentFont = False
                          TabOrder = 1
                          OnClick = BitBtn_Salvar_ProdutoClick
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
                        object BitBtn_Cancelar_Produto: TBitBtn
                          Left = 383
                          Top = 5
                          Width = 75
                          Height = 25
                          Hint = 'Cancelar'
                          Caption = 'Cancelar'
                          TabOrder = 2
                          OnClick = BitBtn_Cancelar_ProdutoClick
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
                        object BitBtn_Excluir_Produto: TBitBtn
                          Left = 461
                          Top = 5
                          Width = 75
                          Height = 25
                          Hint = 'Excluir - [PRO357]'
                          Caption = 'Excluir'
                          TabOrder = 3
                          OnClick = BitBtn_Excluir_ProdutoClick
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
                        object pnCorPrinc: TPanel
                          Left = 648
                          Top = 10
                          Width = 86
                          Height = 13
                          BevelOuter = bvNone
                          Caption = 'Principal'
                          Color = 10724723
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clCream
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = [fsBold]
                          ParentBackground = False
                          ParentFont = False
                          TabOrder = 4
                        end
                      end
                    end
                    object Panel4: TPanel
                      Left = 2
                      Top = 15
                      Width = 767
                      Height = 74
                      Align = alTop
                      BevelOuter = bvNone
                      TabOrder = 0
                      object lbCodigo: TLabel
                        Left = 87
                        Top = 17
                        Width = 44
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'C'#243'digo:'
                        FocusControl = DBEditCodigo
                        Font.Charset = ANSI_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object lbDescricao: TLabel
                        Left = 69
                        Top = 44
                        Width = 62
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Descri'#231#227'o:'
                        Font.Charset = ANSI_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object DBEditCodigo: TDBEdit
                        Left = 133
                        Top = 14
                        Width = 61
                        Height = 21
                        CharCase = ecUpperCase
                        DataField = 'COD_GRUPO_SIM'
                        DataSource = dtmProdutos.dsGrupoProdSimilares
                        Enabled = False
                        TabOrder = 0
                      end
                      object DBEditDescricao: TDBEdit
                        Left = 133
                        Top = 41
                        Width = 473
                        Height = 21
                        CharCase = ecUpperCase
                        DataField = 'DESCR_GRUPO'
                        DataSource = dtmProdutos.dsGrupoProdSimilares
                        TabOrder = 1
                      end
                    end
                  end
                end
              end
              object tsCadastroP: TTabSheet
                Caption = 'tsCadastroP'
                ImageIndex = 2
                object ScrollBoxP: TScrollBox
                  Left = 0
                  Top = 0
                  Width = 775
                  Height = 431
                  Align = alClient
                  TabOrder = 0
                  object GroupBox5: TGroupBox
                    Left = 0
                    Top = 0
                    Width = 771
                    Height = 427
                    Align = alClient
                    Caption = 'Manuten'#231#227'o de Produtos Similares'
                    TabOrder = 0
                    object Label221: TLabel
                      Left = 8
                      Top = 30
                      Width = 730
                      Height = 13
                      Caption = 
                        'PRODUTO  -                    -                    -            ' +
                        '        -                    -                    -             ' +
                        '       -                    -                    -              ' +
                        '      -                    -     '
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clBlue
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label6: TLabel
                      Left = 344
                      Top = 70
                      Width = 39
                      Height = 13
                      Caption = 'Grupo:'
                      FocusControl = DBEdit1
                      Font.Charset = ANSI_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label7: TLabel
                      Left = 465
                      Top = 71
                      Width = 44
                      Height = 13
                      Caption = 'C'#243'digo:'
                      FocusControl = DBEdit2
                      Font.Charset = ANSI_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label11: TLabel
                      Left = 69
                      Top = 100
                      Width = 62
                      Height = 13
                      Caption = 'Descri'#231#227'o:'
                      Font.Charset = ANSI_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object lbNumFab: TLabel
                      Left = 30
                      Top = 71
                      Width = 101
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Num. Fabrica'#231#227'o:'
                      FocusControl = DBEdit1
                      Font.Charset = ANSI_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label12: TLabel
                      Left = 8
                      Top = 141
                      Width = 725
                      Height = 13
                      Caption = 
                        'SIMILAR  -                    -                    -            ' +
                        '        -                    -                    -             ' +
                        '       -                    -                    -              ' +
                        '      -                    -     '
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clBlue
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object SpeedButton9: TSpeedButton
                      Left = 625
                      Top = 175
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
                      Visible = False
                      OnClick = SpeedButton9Click
                    end
                    object SpeedButton10: TSpeedButton
                      Left = 625
                      Top = 220
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
                      Visible = False
                      OnClick = SpeedButton10Click
                    end
                    object SpeedButton13: TSpeedButton
                      Left = 671
                      Top = 168
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
                      Visible = False
                      OnClick = SpeedButton9Click
                    end
                    object SpeedButton14: TSpeedButton
                      Left = 671
                      Top = 214
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
                      Visible = False
                      OnClick = SpeedButton10Click
                    end
                    object Label8: TLabel
                      Left = 344
                      Top = 184
                      Width = 39
                      Height = 13
                      Caption = 'Grupo:'
                      FocusControl = DBEdit3
                      Font.Charset = ANSI_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label9: TLabel
                      Left = 465
                      Top = 184
                      Width = 44
                      Height = 13
                      Caption = 'C'#243'digo:'
                      FocusControl = DBEdit4
                      Font.Charset = ANSI_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label10: TLabel
                      Left = 69
                      Top = 213
                      Width = 62
                      Height = 13
                      Caption = 'Descri'#231#227'o:'
                      FocusControl = DBEdit5
                      Font.Charset = ANSI_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object lbNumFabSim: TLabel
                      Left = 30
                      Top = 184
                      Width = 101
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Num. Fabrica'#231#227'o:'
                      Font.Charset = ANSI_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object DBEdit1: TDBEdit
                      Left = 385
                      Top = 66
                      Width = 61
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'GRUPO_PROD'
                      DataSource = dtmProdutos.dsProdSimiliar
                      Enabled = False
                      TabOrder = 1
                    end
                    object DBEdit2: TDBEdit
                      Left = 513
                      Top = 67
                      Width = 81
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'COD_PROD'
                      DataSource = dtmProdutos.dsProdSimiliar
                      Enabled = False
                      TabOrder = 2
                    end
                    object Edit1: TEdit
                      Left = 133
                      Top = 97
                      Width = 461
                      Height = 21
                      CharCase = ecUpperCase
                      Enabled = False
                      TabOrder = 3
                      Text = 'EDIT1'
                    end
                    object EditNumFab: TEdit
                      Left = 133
                      Top = 67
                      Width = 181
                      Height = 21
                      Hint = '[F3: Pesquisar]   [F4: Novo]  -  Produto'
                      CharCase = ecUpperCase
                      TabOrder = 0
                      Text = 'EDITNUMFAB'
                      OnExit = EditNumFabExit
                      OnKeyDown = EditNumFabKeyDown
                    end
                    object DBEdit3: TDBEdit
                      Left = 385
                      Top = 180
                      Width = 61
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'GRUPO_PS'
                      DataSource = dtmProdutos.dsProdSimiliar
                      Enabled = False
                      TabOrder = 5
                    end
                    object DBEdit4: TDBEdit
                      Left = 513
                      Top = 181
                      Width = 81
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'COD_PS'
                      DataSource = dtmProdutos.dsProdSimiliar
                      Enabled = False
                      TabOrder = 6
                    end
                    object DBEdit5: TDBEdit
                      Left = 133
                      Top = 210
                      Width = 461
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'DESCPSIM'
                      DataSource = dtmProdutos.dsProdSimiliar
                      Enabled = False
                      TabOrder = 7
                    end
                    object EditNumFabSim: TEdit
                      Left = 133
                      Top = 180
                      Width = 181
                      Height = 21
                      Hint = '[F3: Pesquisar]   [F4: Novo]  -  Produto'
                      CharCase = ecUpperCase
                      TabOrder = 4
                      Text = 'EDITNUMFABSIM'
                      OnExit = EditNumFabSimExit
                      OnKeyDown = EditNumFabSimKeyDown
                    end
                  end
                end
              end
            end
            inherited Panel3: TPanel
              inherited BitBtn4: TBitBtn
                Hint = 'Confirmar Registro - [PRO145]'
              end
              inherited BitBtn5: TBitBtn
                Hint = 'Cancelar Registro -[PRO146]'
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
            Height = 185
            ExplicitHeight = 185
            inherited imgInformation: TImage
              Height = 168
              ExplicitHeight = 83
            end
            object SpeedButton59: TSpeedButton [6]
              Left = 705
              Top = 14
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
            object btSelectAll: TSpeedButton [7]
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
            object btUnSelectAll: TSpeedButton [8]
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
              Hint = 'Clique para pesquisar - [PRO138]'
            end
            inherited BitBtn3: TBitBtn
              Hint = 'Novo cadastro - [PRO139]'
            end
            inherited CheckBox3: TCheckBox
              Enabled = False
              Visible = False
            end
            inherited CheckBox1: TCheckBox
              Left = 257
              ExplicitLeft = 257
            end
            object groupAdicional: TGroupBox
              Left = 2
              Top = 98
              Width = 779
              Height = 85
              Align = alCustom
              Caption = 'Pesquisa Adicional'
              TabOrder = 11
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
              object Label110: TLabel
                Left = 16
                Top = 28
                Width = 37
                Height = 13
                Caption = 'Campo:'
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
              object ComboBox11: TComboBox
                Left = 59
                Top = 20
                Width = 145
                Height = 21
                Hint = 'Campo filtro da pesquisa adicional. Informe o campo desejado'
                ItemHeight = 13
                TabOrder = 0
                Text = 'ComboBox11'
                OnEnter = ComboBox1Enter
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
            object RadioGroup3: TRadioGroup
              Left = 417
              Top = 38
              Width = 181
              Height = 31
              Caption = 'Tipo:'
              Color = clBtnFace
              Columns = 2
              Enabled = False
              ItemIndex = 0
              Items.Strings = (
                'Produtos'
                'Grupos')
              ParentColor = False
              TabOrder = 12
              OnClick = RadioGroup3Click
            end
          end
          inherited Panel1: TPanel
            Top = 185
            Height = 325
            ExplicitTop = 185
            ExplicitHeight = 325
            inherited Splitter1: TSplitter
              Height = 264
              ExplicitHeight = 376
            end
            inherited DBGrid1: TDBGrid
              Height = 264
              OnCellClick = DBGrid1CellClick
              OnDrawColumnCell = DBGrid1DrawColumnCell
              OnKeyDown = DBGrid1KeyDown
              Columns = <
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
                  FieldName = 'GRUPO_PS'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'COD_PS'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'COD_EMPRESA'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DESCPSIM'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ATIVO'
                  Visible = True
                end>
            end
            inherited Panel2: TPanel
              inherited SpeedButton1: TSpeedButton
                Hint = 'Editar Registro - [PRO140]'
              end
              inherited SpeedButton2: TSpeedButton
                Hint = 'Apagar Registro - [PRO141]'
                OnClick = SpeedButton2Click
              end
              inherited SpeedButton3: TSpeedButton
                Hint = 'Imprimir - [PRO147]'
                OnClick = SpeedButton3Click
              end
              inherited SpeedButton4: TSpeedButton
                OnClick = SpeedButton25Click
              end
              inherited SpeedButton5: TSpeedButton
                Hint = 'Recuperar registro - [PRO144]'
                OnClick = SpeedButton5Click
              end
              inherited SpeedButton6: TSpeedButton
                Enabled = False
              end
              inherited SpeedButton7: TSpeedButton
                Enabled = False
              end
              inherited SpeedButton8: TSpeedButton
                Enabled = False
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
                Hint = 'Ver registros da lixeira - [PRO143]'
                OnClick = SpeedButton25Click
              end
              inherited SpeedButton26: TSpeedButton
                Enabled = False
              end
            end
            inherited GroupBox2: TGroupBox
              Height = 264
              ExplicitHeight = 264
              inherited ScrollBox2: TScrollBox
                Height = 247
                ExplicitHeight = 247
              end
            end
            object DBGrid2: TDBGrid
              Left = 292
              Top = 153
              Width = 490
              Height = 264
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
              PopupMenu = PopupMenu3
              TabOrder = 3
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
              OnCellClick = DBGrid2CellClick
              OnColumnMoved = DBGrid2ColumnMoved
              OnDrawColumnCell = DBGrid2DrawColumnCell
              OnEditButtonClick = DBGrid2EditButtonClick
              OnKeyDown = DBGrid2KeyDown
              OnTitleClick = DBGrid2TitleClick
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
          Caption = 'Relat'#243'rio de Produtos Similares'
          ImageIndex = 2
          object qrpProdSimilar: TQuickRep
            Left = 0
            Top = 3
            Width = 816
            Height = 1056
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            DataSet = dtmProdutos.cdsProdSimiliar
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
            OnPreview = qrpProdSimilarPreview
            Options = [FirstPageHeader, LastPageFooter]
            Page.Columns = 1
            Page.Orientation = poPortrait
            Page.PaperSize = Letter
            Page.Values = (
              100.000000000000000000
              2794.000000000000000000
              100.000000000000000000
              2159.000000000000000000
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
            PrevInitialZoom = qrZoomToFit
            PreviewDefaultSaveType = stQRP
            object QRBand2: TQRBand
              Left = 38
              Top = 162
              Width = 740
              Height = 21
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
                55.562500000000000000
                1957.916666666667000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              BandType = rbDetail
              object QRDBText2: TQRDBText
                Left = 362
                Top = 0
                Width = 74
                Height = 19
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  50.270833333333330000
                  957.791666666666800000
                  0.000000000000000000
                  195.791666666666700000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Color = clWhite
                DataSet = dtmProdutos.cdsProdSimiliar
                DataField = 'COD_PS'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -15
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 11
              end
              object QRDBText3: TQRDBText
                Left = 494
                Top = 0
                Width = 77
                Height = 19
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  50.270833333333330000
                  1307.041666666667000000
                  0.000000000000000000
                  203.729166666666700000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Color = clWhite
                DataSet = dtmProdutos.cdsProdSimiliar
                DataField = 'DESCPSIM'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -15
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 11
              end
              object QRDBText4: TQRDBText
                Left = 247
                Top = 0
                Width = 83
                Height = 19
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  50.270833333333330000
                  653.520833333333400000
                  0.000000000000000000
                  219.604166666666700000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Color = clWhite
                DataSet = dtmProdutos.cdsProdSimiliar
                DataField = 'GRUPO_PS'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -15
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 11
              end
              object QRDBText5: TQRDBText
                Left = 136
                Top = 0
                Width = 74
                Height = 19
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  50.270833333333330000
                  359.833333333333300000
                  0.000000000000000000
                  195.791666666666700000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Color = clWhite
                DataSet = dtmProdutos.cdsProdSimiliar
                DataField = 'COD_PROD'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -15
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 11
              end
              object QRDBText6: TQRDBText
                Left = 5
                Top = 0
                Width = 107
                Height = 19
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  50.270833333333330000
                  13.229166666666670000
                  0.000000000000000000
                  283.104166666666700000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Color = clWhite
                DataSet = dtmProdutos.cdsProdSimiliar
                DataField = 'GRUPO_PROD'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -15
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 11
              end
            end
            object QRBand3: TQRBand
              Left = 38
              Top = 183
              Width = 740
              Height = 32
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
                84.666666666666680000
                1957.916666666667000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              BandType = rbPageFooter
              object QRShape3: TQRShape
                Left = 5
                Top = 7
                Width = 731
                Height = 3
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  7.937500000000000000
                  13.229166666666700000
                  18.520833333333300000
                  1934.104166666670000000)
                Brush.Color = clBlack
                Shape = qrsRectangle
                VertAdjust = 0
              end
              object QRLabel30: TQRLabel
                Left = 5
                Top = 13
                Width = 174
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  13.229166666666670000
                  34.395833333333340000
                  460.375000000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'HW Sistemas e Computadores Ltda.'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
            end
            object QRBand1: TQRBand
              Left = 38
              Top = 38
              Width = 740
              Height = 124
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              AlignToBottom = False
              BeforePrint = QRBand1BeforePrint
              Color = clWhite
              TransparentBand = False
              ForceNewColumn = False
              ForceNewPage = False
              Size.Values = (
                328.083333333333400000
                1957.916666666667000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              BandType = rbTitle
              object QRLabel1: TQRLabel
                Left = 2
                Top = 36
                Width = 431
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
                  1140.354166666670000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Caption = 'Cadastro de Produtos Similares'
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
              object QRLabel2: TQRLabel
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
              object QRSysData1: TQRSysData
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
              object QRLabel3: TQRLabel
                Left = 631
                Top = 61
                Width = 47
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1669.520833333333000000
                  161.395833333333300000
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
              object QRSysData2: TQRSysData
                Left = 682
                Top = 61
                Width = 46
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1804.458333333333000000
                  161.395833333333300000
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
              object QRShape1: TQRShape
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
              object QRShape2: TQRShape
                Left = 3
                Top = 115
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
                  304.270833333333000000
                  1942.041666666670000000)
                Brush.Color = clBlack
                Shape = qrsRectangle
                VertAdjust = 0
              end
              object QRLabel4: TQRLabel
                Left = 362
                Top = 86
                Width = 113
                Height = 23
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  60.854166666666680000
                  957.791666666666800000
                  227.541666666666700000
                  298.979166666666700000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'C'#243'd. Similar'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -19
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 14
              end
              object QRLabel5: TQRLabel
                Left = 494
                Top = 86
                Width = 95
                Height = 23
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  60.854166666666680000
                  1307.041666666667000000
                  227.541666666666700000
                  251.354166666666700000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Descri'#231#227'o'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -19
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 14
              end
              object QRLabel6: TQRLabel
                Left = 247
                Top = 86
                Width = 98
                Height = 23
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  60.854166666666680000
                  653.520833333333400000
                  227.541666666666700000
                  259.291666666666700000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'GR.Similar'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -19
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 14
              end
              object QRLabel7: TQRLabel
                Left = 136
                Top = 86
                Width = 68
                Height = 23
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  60.854166666666680000
                  359.833333333333400000
                  227.541666666666700000
                  179.916666666666700000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'C'#243'digo'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -19
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 14
              end
              object QRLabel8: TQRLabel
                Left = 5
                Top = 88
                Width = 60
                Height = 23
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  60.854166666666680000
                  13.229166666666670000
                  232.833333333333400000
                  158.750000000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Grupo'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -19
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 14
              end
              object QRLabel31: TQRLabel
                Left = 4
                Top = 7
                Width = 169
                Height = 25
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  66.145833333333340000
                  10.583333333333330000
                  18.520833333333330000
                  447.145833333333400000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'qrLabelEmpresa'
                Color = clWhite
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
            end
          end
        end
        object TabSheet5: TTabSheet
          Caption = 'Relat'#243'rio de Grupos de Similares'
          ImageIndex = 4
          object qrpGrupoProdSimilar: TQuickRep
            Left = 1
            Top = -10
            Width = 816
            Height = 1056
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            DataSet = dtmProdutos.cdsGrupoProdSimilares
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
            OnPreview = qrpGrupoProdSimilarPreview
            Options = [FirstPageHeader, LastPageFooter]
            Page.Columns = 1
            Page.Orientation = poPortrait
            Page.PaperSize = Letter
            Page.Values = (
              100.000000000000000000
              2794.000000000000000000
              100.000000000000000000
              2159.000000000000000000
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
            PrevInitialZoom = qrZoomToFit
            PreviewDefaultSaveType = stQRP
            object QRBand4: TQRBand
              Left = 38
              Top = 162
              Width = 740
              Height = 21
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
                55.562500000000000000
                1957.916666666667000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              BandType = rbDetail
              object QRDBText7: TQRDBText
                Left = 84
                Top = 0
                Width = 116
                Height = 19
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  50.270833333333330000
                  222.250000000000000000
                  0.000000000000000000
                  306.916666666666700000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Color = clWhite
                DataSet = dtmProdutos.cdsGrupoProdSimilares
                DataField = 'DESCR_GRUPO'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -15
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 11
              end
              object QRDBText10: TQRDBText
                Left = 5
                Top = 0
                Width = 129
                Height = 19
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  50.270833333333330000
                  13.229166666666670000
                  0.000000000000000000
                  341.312500000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Color = clWhite
                DataSet = dtmProdutos.cdsGrupoProdSimilares
                DataField = 'COD_GRUPO_SIM'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -15
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 11
              end
            end
            object QRBand5: TQRBand
              Left = 38
              Top = 183
              Width = 740
              Height = 32
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
                84.666666666666680000
                1957.916666666667000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              BandType = rbPageFooter
              object QRShape4: TQRShape
                Left = 5
                Top = 7
                Width = 731
                Height = 3
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  7.937500000000000000
                  13.229166666666700000
                  18.520833333333300000
                  1934.104166666670000000)
                Brush.Color = clBlack
                Shape = qrsRectangle
                VertAdjust = 0
              end
              object QRLabel9: TQRLabel
                Left = 5
                Top = 13
                Width = 174
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  13.229166666666670000
                  34.395833333333340000
                  460.375000000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'HW Sistemas e Computadores Ltda.'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
            end
            object QRBand6: TQRBand
              Left = 38
              Top = 38
              Width = 740
              Height = 124
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              AlignToBottom = False
              BeforePrint = QRBand6BeforePrint
              Color = clWhite
              TransparentBand = False
              ForceNewColumn = False
              ForceNewPage = False
              Size.Values = (
                328.083333333333400000
                1957.916666666667000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              BandType = rbTitle
              object QRLabel10: TQRLabel
                Left = 2
                Top = 36
                Width = 431
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
                  1140.354166666670000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Caption = 'Cadastro Grupos de Similares'
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
              object QRLabel11: TQRLabel
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
              object QRLabel12: TQRLabel
                Left = 631
                Top = 61
                Width = 47
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1669.520833333333000000
                  161.395833333333300000
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
              object QRSysData4: TQRSysData
                Left = 682
                Top = 61
                Width = 46
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1804.458333333333000000
                  161.395833333333300000
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
              object QRShape6: TQRShape
                Left = 3
                Top = 115
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
                  304.270833333333000000
                  1942.041666666670000000)
                Brush.Color = clBlack
                Shape = qrsRectangle
                VertAdjust = 0
              end
              object QRLabel14: TQRLabel
                Left = 84
                Top = 86
                Width = 95
                Height = 23
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  60.854166666666680000
                  222.250000000000000000
                  227.541666666666700000
                  251.354166666666700000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Descri'#231#227'o'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -19
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 14
              end
              object QRLabel16: TQRLabel
                Left = 3
                Top = 86
                Width = 68
                Height = 23
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  60.854166666666680000
                  7.937500000000000000
                  227.541666666666700000
                  179.916666666666700000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'C'#243'digo'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -19
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 14
              end
              object QRLabel18: TQRLabel
                Left = 4
                Top = 7
                Width = 169
                Height = 25
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  66.145833333333340000
                  10.583333333333330000
                  18.520833333333330000
                  447.145833333333400000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'qrLabelEmpresa'
                Color = clWhite
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
    Left = 572
    Top = 1
    object MarcarTodosProdSimilaresClick: TMenuItem
      Caption = 'Marcar Todos Produtos Similares'
      OnClick = MarcarTodosProdSimilaresClickClick
    end
    object DesmarcarTodosProdSimilaresClick: TMenuItem
      Caption = 'Desmarcar Todos Produtos Similares'
      OnClick = DesmarcarTodosProdSimilaresClickClick
    end
  end
  object PopupMenu3: TPopupMenu
    Left = 604
    Top = 1
    object Configurarcolunas2: TMenuItem
      Caption = 'Configurar colunas'
      OnClick = Configurarcolunas2Click
    end
    object ResetarConfiguraesdecolunas2: TMenuItem
      Caption = 'Resetar Configura'#231#245'es de colunas'
      OnClick = ResetarConfiguraesdecolunas2Click
    end
    object SalvardadosnoExcel2: TMenuItem
      Caption = 'Salvar dados no Excel'
      OnClick = SalvardadosnoExcel2Click
    end
    object ReajustarLarguradascolunas2: TMenuItem
      Caption = 'Reajustar Largura das colunas'
      OnClick = ReajustarLarguradascolunas2Click
    end
    object Copiarparareadetransferncia2: TMenuItem
      Caption = 'Copiar para '#225'rea de transfer'#234'ncia'
      OnClick = Copiarparareadetransferncia2Click
    end
    object MarcarTodosGrupoSimilaresClick: TMenuItem
      Caption = 'Marcar Todos Grupos de Similares'
      OnClick = MarcarTodosGrupoSimilaresClickClick
    end
    object DesmarcarTodosGrupoSimilaresClick: TMenuItem
      Caption = 'Desmarcar Todos Grupos de Similares'
      OnClick = DesmarcarTodosGrupoSimilaresClickClick
    end
  end
  object PopupMenuGrupoSim: TPopupMenu
    Left = 632
    Top = 196
    object AlterarProdPrincipal: TMenuItem
      Caption = 'Alterar Produto Principal - [PRO359]'
      OnClick = AlterarProdPrincipalClick
    end
  end
end
