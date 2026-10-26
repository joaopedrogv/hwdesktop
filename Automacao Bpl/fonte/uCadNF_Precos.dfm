inherited frmCadNFPrecos: TfrmCadNFPrecos
  AutoSize = True
  Caption = 'Defini'#231#227'o de Pre'#231'o de Venda dos Produtos - Margem'
  ClientHeight = 601
  ClientWidth = 741
  Position = poScreenCenter
  OnClose = FormClose
  ExplicitWidth = 749
  ExplicitHeight = 635
  PixelsPerInch = 96
  TextHeight = 13
  object pagePrecos: TPageControl
    Left = 0
    Top = 0
    Width = 741
    Height = 601
    ActivePage = tabPrecos
    Style = tsFlatButtons
    TabOrder = 0
    object tabPrecos: TTabSheet
      Caption = 'tabPrecos'
      TabVisible = False
      object Panel13: TPanel
        Left = 4
        Top = 3
        Width = 726
        Height = 582
        BevelKind = bkTile
        BevelOuter = bvNone
        TabOrder = 0
        object Panel15: TPanel
          Left = 15
          Top = 16
          Width = 688
          Height = 29
          BevelKind = bkTile
          BevelOuter = bvNone
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          object Label104: TLabel
            Left = 10
            Top = 6
            Width = 79
            Height = 13
            Caption = 'Nota Fiscal N'#186' '
          end
          object DBText6: TDBText
            Left = 90
            Top = 6
            Width = 48
            Height = 13
            AutoSize = True
            DataField = 'NUM_NF'
            DataSource = dtmNF.dsNf
          end
          object Bevel2: TBevel
            Left = 153
            Top = -6
            Width = 2
            Height = 50
          end
          object DBText7: TDBText
            Left = 167
            Top = 6
            Width = 284
            Height = 17
            DataField = 'DESCRICAO_ITEM'
            DataSource = dsItem
          end
          object DBText8: TDBText
            Left = 577
            Top = 6
            Width = 48
            Height = 13
            AutoSize = True
            DataField = 'NUM_FAB_PROD'
            DataSource = dsItem
          end
          object Bevel3: TBevel
            Left = 569
            Top = -9
            Width = 2
            Height = 50
          end
          object Bevel4: TBevel
            Left = 457
            Top = -25
            Width = 2
            Height = 50
          end
          object DBText9: TDBText
            Left = 515
            Top = 6
            Width = 48
            Height = 13
            AutoSize = True
            DataField = 'COD_PROD'
            DataSource = dsItem
          end
          object DBText10: TDBText
            Left = 465
            Top = 6
            Width = 40
            Height = 13
            BiDiMode = bdRightToLeft
            DataField = 'GRUPO_PROD'
            DataSource = dsItem
            ParentBiDiMode = False
          end
        end
        object GroupBox25: TGroupBox
          Left = 15
          Top = 51
          Width = 688
          Height = 122
          Caption = #218'ltimas 5 Notas Fiscais'
          TabOrder = 1
          object DBGrid10: TDBGrid
            Left = 2
            Top = 15
            Width = 684
            Height = 105
            Align = alClient
            DataSource = dtmNF.dsUltComp
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'NUM_NF'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NOME_CLIENTE'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DATA_LANC'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DESC_COND_PAG'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'QUANTIDADE'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VALOR_UNITARIO'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PREC_CUS_CNT'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PREC_CUSM_PROD'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PREC_VND_PROD'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PREC_VND_PRODA'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VALOR_DESCONTO_PERC'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'RATEIO_DESCONTO'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PMARGFIM'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PMARGFIM_A'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ALIQ_ICM'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ALIQ_IPI'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PERC_FRETE'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NITEM'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CODIGO_NOP'
                Visible = True
              end>
          end
        end
        object GroupBox26: TGroupBox
          Left = 15
          Top = 179
          Width = 688
          Height = 77
          Caption = 'Itens da Nota Fiscal'
          TabOrder = 2
          object DBGrid11: TDBGrid
            Left = 2
            Top = 15
            Width = 684
            Height = 60
            Align = alClient
            DataSource = dsItem
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ReadOnly = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnKeyDown = DBGrid11KeyDown
            Columns = <
              item
                Expanded = False
                FieldName = 'NUM_FAB_PROD'
                Title.Caption = 'Num Fab'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NITEM'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'PREC_CUS_CNT'
                Title.Caption = 'Custo NF'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PREC_CUSM_PROD'
                Title.Caption = 'Custo Medio'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PREC_VND_PROD'
                Title.Caption = 'Pre'#231'o Varejo'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PRCTB_ITEM'
                Title.Caption = 'MarkUp V'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'MARGEM_V_CALC'
                Title.Caption = 'Margem V'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PREC_VND_PRODA'
                Title.Caption = 'Pre'#231'o Atac'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PRCTB_ITEMA'
                Title.Caption = 'MarkUp A'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'MARGEM_A_CALC'
                Title.Caption = 'Margem A'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DESCRICAO_ITEM'
                Title.Caption = 'Descri'#231#227'o.'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'GRUPO_PROD'
                Title.Caption = 'Grupo.'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'COD_PROD'
                Title.Caption = 'C'#243'd Prod.'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CST'
                Title.Caption = 'CST.'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CSOSN'
                Title.Caption = 'CSOSN.'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'REFERENCIA'
                Title.Caption = 'Ref.'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NCM'
                Title.Caption = 'NCM/SH.'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DATA_VALIDADE'
                Title.Caption = 'Data Validade.'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'QUANTIDADE'
                Title.Caption = 'Qtde.'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VALOR_UNITARIO'
                Title.Caption = 'Valor Unit.'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VALOR_TOTAL'
                Title.Caption = 'Valor Tot.'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VALOR_ICM'
                Title.Caption = 'Valor ICMS.'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VALOR_ICMSUB'
                Title.Caption = 'Valor ICMS Sub.'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VALOR_ICMANT_SUB'
                Title.Caption = 'Valor ICMS Ant.'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VALOR_IPI'
                Title.Caption = 'Valor IPI.'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'RATEIO_DESCONTO'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'RATEIO_SEGURO'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'RATEIO_OUTDESP'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'RATEIO_FRETE'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'RATEIO_ACRES_FIN'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'RATEIO_DESP_PF'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PREC_CUS_REP'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'QTDEMB'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'QTDEMBREC'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VLREMBNF'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ALTERA_ESTOQUE_CFOP'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ALTERA_CUSTO_CFOP'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PREC_30_PROD'
                Title.Caption = 'Pre'#231'o 30d'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PRCTB_ITEM3'
                Title.Caption = 'Markup 30d'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'MARGEM_30_CALC'
                Title.Caption = 'Margem 30d'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PREC_60_PROD'
                Title.Caption = 'Pre'#231'o 60d'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PRCTB_ITEM6'
                Title.Caption = 'Markup 60d'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'MARGEM_60_CALC'
                Title.Caption = 'Margem 60d'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PREC_90_PROD'
                Title.Caption = 'Pre'#231'o 90d'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PRCTB_ITEM9'
                Title.Caption = 'Markup 90d'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'MARGEM_90_CALC'
                Title.Caption = 'Margem 90d'
                Visible = True
              end>
          end
        end
        object panelAntigo: TPanel
          Left = 15
          Top = 294
          Width = 688
          Height = 274
          BevelOuter = bvNone
          TabOrder = 3
          object lbPrecoVarejoAtual: TLabel
            Left = 648
            Top = 171
            Width = 22
            Height = 13
            Alignment = taRightJustify
            Caption = '0,00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label620: TLabel
            Left = 492
            Top = 171
            Width = 89
            Height = 13
            Caption = 'Preco Varejo Atual'
          end
          object Label624: TLabel
            Left = 492
            Top = 190
            Width = 98
            Height = 13
            Caption = 'Preco Atacado Atual'
          end
          object lbPrecoAtacadoAtual: TLabel
            Left = 648
            Top = 190
            Width = 22
            Height = 13
            Alignment = taRightJustify
            Caption = '0,00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object GroupBox33: TGroupBox
            Left = 0
            Top = 0
            Width = 688
            Height = 158
            Caption = 'Defini'#231#227'o de Pre'#231'os'
            TabOrder = 0
            object SpeedButton15: TSpeedButton
              Left = 11
              Top = 111
              Width = 36
              Height = 25
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
              Left = 53
              Top = 111
              Width = 36
              Height = 25
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
            object SpeedButton46: TSpeedButton
              Left = 11
              Top = 16
              Width = 23
              Height = 22
              Flat = True
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
              OnClick = SpeedButton46Click
            end
            object SpeedButton60: TSpeedButton
              Left = 11
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
              OnClick = SpeedButton60Click
            end
            object BitBtn28: TBitBtn
              Left = 595
              Top = 16
              Width = 75
              Height = 25
              Caption = 'Alterar'
              TabOrder = 0
              OnClick = BitBtn28Click
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
            object GroupBox27: TGroupBox
              Left = 103
              Top = 12
              Width = 170
              Height = 63
              Caption = 'Pre'#231'o a Vista - VAREJO'
              TabOrder = 1
              object Label165: TLabel
                Left = 14
                Top = 16
                Width = 60
                Height = 13
                Alignment = taCenter
                AutoSize = False
                Caption = 'MarkUp'
              end
              object Label166: TLabel
                Left = 78
                Top = 16
                Width = 80
                Height = 13
                Alignment = taCenter
                AutoSize = False
                Caption = 'Pre'#231'o'
              end
              object DBEdit1: TDBEdit
                Left = 14
                Top = 32
                Width = 60
                Height = 21
                DataField = 'PERCENT_CALC_V'
                DataSource = dsItem
                TabOrder = 0
                OnExit = DBEdit1Exit
              end
              object DBEdit2: TDBEdit
                Left = 78
                Top = 32
                Width = 80
                Height = 21
                DataField = 'PRECO_CALC_V'
                DataSource = dsItem
                TabOrder = 1
                OnExit = DBEdit1Exit
              end
            end
            object GroupBox28: TGroupBox
              Left = 416
              Top = 12
              Width = 174
              Height = 63
              Caption = 'Pre'#231'o a Vista - ATACADO'
              TabOrder = 2
              object Label102: TLabel
                Left = 14
                Top = 16
                Width = 60
                Height = 13
                Alignment = taCenter
                AutoSize = False
                Caption = 'MarkUp'
              end
              object Label103: TLabel
                Left = 78
                Top = 16
                Width = 80
                Height = 13
                Alignment = taCenter
                AutoSize = False
                Caption = 'Pre'#231'o'
              end
              object DBEdit3: TDBEdit
                Left = 14
                Top = 32
                Width = 60
                Height = 21
                DataField = 'PERCENT_CALC_A'
                DataSource = dsItem
                TabOrder = 0
                OnExit = DBEdit1Exit
              end
              object DBEdit4: TDBEdit
                Left = 78
                Top = 32
                Width = 80
                Height = 21
                DataField = 'PRECO_CALC_A'
                DataSource = dsItem
                TabOrder = 1
                OnExit = DBEdit1Exit
              end
            end
            object btSalvaMargemObtida: TBitBtn
              Left = 595
              Top = 46
              Width = 75
              Height = 25
              Hint = 'Salvar - [NF0066]'
              Caption = 'Salvar'
              TabOrder = 4
              OnClick = btSalvaMargemObtidaClick
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
            object BitBtn30: TBitBtn
              Left = 595
              Top = 111
              Width = 75
              Height = 25
              Caption = 'Cancelar'
              TabOrder = 5
              OnClick = BitBtn30Click
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
            object grupoPreco306090MarkupMargem: TGroupBox
              Left = 103
              Top = 81
              Width = 486
              Height = 62
              BiDiMode = bdLeftToRight
              Caption = 'Pre'#231'o a Prazo - 30 / 60 / 90 Dias - [ F2 ]'
              ParentBiDiMode = False
              TabOrder = 3
              object Label1: TLabel
                Left = 14
                Top = 17
                Width = 60
                Height = 13
                Alignment = taCenter
                AutoSize = False
                Caption = 'MarkUp'
              end
              object Label5: TLabel
                Left = 78
                Top = 17
                Width = 80
                Height = 13
                Alignment = taCenter
                AutoSize = False
                Caption = '30 Dias'
              end
              object Label6: TLabel
                Left = 170
                Top = 17
                Width = 60
                Height = 13
                Alignment = taCenter
                AutoSize = False
                Caption = 'MarkUp'
              end
              object Label7: TLabel
                Left = 236
                Top = 14
                Width = 80
                Height = 13
                Alignment = taCenter
                AutoSize = False
                Caption = '60 Dias'
              end
              object Label8: TLabel
                Left = 326
                Top = 17
                Width = 60
                Height = 13
                Alignment = taCenter
                AutoSize = False
                Caption = 'MarkUp'
              end
              object Label9: TLabel
                Left = 390
                Top = 17
                Width = 80
                Height = 13
                Alignment = taCenter
                AutoSize = False
                Caption = '90 Dias'
              end
              object DBEdit5: TDBEdit
                Left = 14
                Top = 33
                Width = 60
                Height = 21
                DataField = 'PERCENT_CALC_3'
                DataSource = dsItem
                TabOrder = 0
                OnExit = DBEdit1Exit
              end
              object DBEdit6: TDBEdit
                Left = 78
                Top = 33
                Width = 80
                Height = 21
                DataField = 'PRECO_CALC_3'
                DataSource = dsItem
                TabOrder = 1
                OnExit = DBEdit1Exit
              end
              object DBEdit7: TDBEdit
                Left = 170
                Top = 33
                Width = 60
                Height = 21
                DataField = 'PERCENT_CALC_6'
                DataSource = dsItem
                TabOrder = 2
                OnExit = DBEdit1Exit
              end
              object DBEdit8: TDBEdit
                Left = 234
                Top = 33
                Width = 80
                Height = 21
                DataField = 'PRECO_CALC_6'
                DataSource = dsItem
                TabOrder = 3
                OnExit = DBEdit1Exit
              end
              object DBEdit9: TDBEdit
                Left = 326
                Top = 33
                Width = 60
                Height = 21
                DataField = 'PERCENT_CALC_9'
                DataSource = dsItem
                TabOrder = 4
                OnExit = DBEdit1Exit
              end
              object DBEdit10: TDBEdit
                Left = 390
                Top = 33
                Width = 80
                Height = 21
                DataField = 'PRECO_CALC_9'
                DataSource = dsItem
                TabOrder = 5
                OnExit = DBEdit1Exit
              end
            end
            object panelPercentualAdicional: TPanel
              Left = 279
              Top = 19
              Width = 131
              Height = 59
              BevelOuter = bvNone
              TabOrder = 6
              object Panel2: TPanel
                Left = 0
                Top = 0
                Width = 65
                Height = 59
                Align = alLeft
                BevelOuter = bvNone
                TabOrder = 0
                object Label3: TLabel
                  Left = 0
                  Top = 38
                  Width = 65
                  Height = 19
                  Align = alTop
                  Alignment = taRightJustify
                  AutoSize = False
                  Caption = '% 90 dias'
                  ExplicitLeft = 1
                  ExplicitTop = 37
                  ExplicitWidth = 78
                end
                object Label4: TLabel
                  Left = 0
                  Top = 19
                  Width = 65
                  Height = 19
                  Align = alTop
                  Alignment = taRightJustify
                  AutoSize = False
                  Caption = '% 60 dias'
                  ExplicitLeft = 1
                  ExplicitWidth = 78
                end
                object Label10: TLabel
                  Left = 0
                  Top = 0
                  Width = 65
                  Height = 19
                  Align = alTop
                  Alignment = taRightJustify
                  AutoSize = False
                  Caption = '% 30 dias'
                  ExplicitLeft = -1
                  ExplicitTop = -5
                  ExplicitWidth = 70
                end
              end
              object Panel3: TPanel
                Left = 65
                Top = 0
                Width = 66
                Height = 59
                Align = alClient
                BevelOuter = bvNone
                TabOrder = 1
                object DBText1: TDBText
                  Left = 0
                  Top = 38
                  Width = 66
                  Height = 19
                  Align = alTop
                  Alignment = taRightJustify
                  DataField = 'PERC_AD_90'
                  DataSource = dtmNF.dsProd
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlue
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                  ExplicitLeft = 1
                  ExplicitTop = 1
                  ExplicitWidth = 71
                end
                object DBText2: TDBText
                  Left = 0
                  Top = 19
                  Width = 66
                  Height = 19
                  Align = alTop
                  Alignment = taRightJustify
                  DataField = 'PERC_AD_60'
                  DataSource = dtmNF.dsProd
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlue
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                  ExplicitLeft = 1
                  ExplicitTop = 1
                  ExplicitWidth = 71
                end
                object DBText3: TDBText
                  Left = 0
                  Top = 0
                  Width = 66
                  Height = 19
                  Align = alTop
                  Alignment = taRightJustify
                  DataField = 'PERC_AD_30'
                  DataSource = dtmNF.dsProd
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlue
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                  ExplicitLeft = 1
                  ExplicitTop = 1
                  ExplicitWidth = 71
                end
              end
            end
            object grupoPreco306090: TGroupBox
              Left = 95
              Top = 47
              Width = 486
              Height = 62
              BiDiMode = bdLeftToRight
              Caption = 'Pre'#231'o a Prazo - 30 / 60 / 90 Dias - [ F2 ]'
              ParentBiDiMode = False
              TabOrder = 7
              object Label11: TLabel
                Left = 46
                Top = 16
                Width = 80
                Height = 13
                Alignment = taCenter
                AutoSize = False
                Caption = '30 Dias'
              end
              object Label13: TLabel
                Left = 204
                Top = 13
                Width = 80
                Height = 13
                Alignment = taCenter
                AutoSize = False
                Caption = '60 Dias'
              end
              object Label15: TLabel
                Left = 358
                Top = 16
                Width = 80
                Height = 13
                Alignment = taCenter
                AutoSize = False
                Caption = '90 Dias'
              end
              object DBEdit12: TDBEdit
                Left = 46
                Top = 32
                Width = 80
                Height = 21
                DataField = 'PRECO_CALC_3'
                DataSource = dsItem
                TabOrder = 0
                OnExit = DBEdit1Exit
              end
              object DBEdit14: TDBEdit
                Left = 202
                Top = 32
                Width = 80
                Height = 21
                DataField = 'PRECO_CALC_6'
                DataSource = dsItem
                TabOrder = 1
                OnExit = DBEdit1Exit
              end
              object DBEdit16: TDBEdit
                Left = 358
                Top = 32
                Width = 80
                Height = 21
                DataField = 'PRECO_CALC_9'
                DataSource = dsItem
                TabOrder = 2
                OnExit = DBEdit1Exit
              end
            end
          end
          object GroupBox31: TGroupBox
            Left = 0
            Top = 158
            Width = 240
            Height = 83
            Caption = 'Varejo'
            Enabled = False
            TabOrder = 1
            object Label157: TLabel
              Left = 11
              Top = 29
              Width = 36
              Height = 13
              Caption = 'MarkUp'
            end
            object Label158: TLabel
              Left = 9
              Top = 53
              Width = 38
              Height = 13
              Caption = 'Margem'
            end
            object Label159: TLabel
              Left = 69
              Top = 10
              Width = 45
              Height = 13
              Caption = 'Esperado'
            end
            object Label160: TLabel
              Left = 158
              Top = 10
              Width = 32
              Height = 13
              Caption = 'Obtido'
            end
            object edVEMK: TEditHw
              Left = 53
              Top = 26
              Width = 75
              Height = 21
              TabOrder = 0
              Text = '               0,00'
              Formato = fFixed
              FormatSize = '0.2'
            end
            object edVOMK: TEditHw
              Left = 134
              Top = 26
              Width = 75
              Height = 21
              TabOrder = 1
              Text = '               0,00'
              Formato = fFixed
              FormatSize = '0.2'
            end
            object edVEMM: TEditHw
              Left = 53
              Top = 50
              Width = 75
              Height = 21
              TabOrder = 2
              Text = '               0,00'
              Formato = fFixed
              FormatSize = '0.2'
            end
            object edVOMM: TEditHw
              Left = 134
              Top = 50
              Width = 75
              Height = 21
              TabOrder = 3
              Text = '               0,00'
              Formato = fFixed
              FormatSize = '0.2'
            end
          end
          object GroupBox32: TGroupBox
            Left = 246
            Top = 158
            Width = 240
            Height = 83
            Caption = 'Atacado'
            Enabled = False
            TabOrder = 2
            object Label161: TLabel
              Left = 11
              Top = 29
              Width = 36
              Height = 13
              Caption = 'MarkUp'
            end
            object Label162: TLabel
              Left = 9
              Top = 53
              Width = 38
              Height = 13
              Caption = 'Margem'
            end
            object Label163: TLabel
              Left = 69
              Top = 10
              Width = 45
              Height = 13
              Caption = 'Esperado'
            end
            object Label164: TLabel
              Left = 158
              Top = 10
              Width = 32
              Height = 13
              Caption = 'Obtido'
            end
            object edAEMK: TEditHw
              Left = 53
              Top = 26
              Width = 75
              Height = 21
              TabOrder = 0
              Text = '               0,00'
              Formato = fFixed
              FormatSize = '0.2'
            end
            object edAOMK: TEditHw
              Left = 134
              Top = 26
              Width = 75
              Height = 21
              TabOrder = 1
              Text = '               0,00'
              Formato = fFixed
              FormatSize = '0.2'
            end
            object edAEMM: TEditHw
              Left = 53
              Top = 50
              Width = 75
              Height = 21
              TabOrder = 2
              Text = '               0,00'
              Formato = fFixed
              FormatSize = '0.2'
            end
            object edAOMM: TEditHw
              Left = 134
              Top = 50
              Width = 75
              Height = 21
              TabOrder = 3
              Text = '               0,00'
              Formato = fFixed
              FormatSize = '0.2'
            end
          end
          object BitBtn32: TBitBtn
            Left = 0
            Top = 247
            Width = 75
            Height = 25
            Caption = 'Voltar'
            ModalResult = 2
            TabOrder = 3
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
          object BitBtn122: TBitBtn
            Left = 492
            Top = 247
            Width = 93
            Height = 25
            Hint = 'Calculo da margem do produto'
            Caption = 'Calc. Margem'
            TabOrder = 4
            OnClick = BitBtn122Click
          end
          object panelPercDesc30DiasAvista: TPanel
            Left = 492
            Top = 208
            Width = 178
            Height = 23
            BevelOuter = bvNone
            TabOrder = 5
            object Label2: TLabel
              Left = 0
              Top = 0
              Width = 73
              Height = 23
              Align = alLeft
              Caption = '% 30 p/ Varejo'
              ExplicitHeight = 13
            end
            object DBText4: TDBText
              Left = 105
              Top = 0
              Width = 73
              Height = 23
              Align = alRight
              Alignment = taRightJustify
              DataField = 'PDESC_PR30_VAREJO'
              DataSource = dtmNF.dsProd
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ExplicitLeft = 104
              ExplicitTop = 1
              ExplicitHeight = 21
            end
          end
          object BitBtn1: TBitBtn
            Left = 591
            Top = 247
            Width = 79
            Height = 25
            Caption = 'Continuar'
            ModalResult = 1
            TabOrder = 6
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
        object panelConfs: TPanel
          Left = 15
          Top = 260
          Width = 688
          Height = 28
          Hint = 
            'Para alterar margens e markups ao alterar pre'#231'os use o processo ' +
            'NF0227'
          BevelEdges = [beLeft, beRight]
          BevelKind = bkTile
          BevelOuter = bvNone
          Caption = 'Alterar Pre'#231'os = N'#227'o | Alterar Margens = NAO '
          TabOrder = 4
        end
      end
    end
  end
  object dsItem: TDataSource
    Left = 704
    Top = 8
  end
end
