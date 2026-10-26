object frmComissaoPorVenda: TfrmComissaoPorVenda
  Left = 0
  Top = 0
  Caption = 'Comiss'#227'o por Venda'
  ClientHeight = 500
  ClientWidth = 883
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 883
    Height = 500
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'TabSheet1'
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 875
        Height = 41
        Align = alTop
        BevelKind = bkTile
        BevelOuter = bvNone
        TabOrder = 0
        object Label1: TLabel
          Left = 2
          Top = 11
          Width = 57
          Height = 13
          Caption = 'Data Inicial:'
        end
        object Label2: TLabel
          Left = 146
          Top = 11
          Width = 48
          Height = 13
          Caption = 'Data Final'
        end
        object edDataIni: TMaskEdit
          Left = 65
          Top = 8
          Width = 75
          Height = 21
          EditMask = '!99/99/0000;1;_'
          MaxLength = 10
          TabOrder = 0
          Text = '  /  /    '
        end
        object edDataFim: TMaskEdit
          Left = 200
          Top = 8
          Width = 75
          Height = 21
          EditMask = '!99/99/0000;1;_'
          MaxLength = 10
          TabOrder = 1
          Text = '  /  /    '
        end
        object btPesquisar: TBitBtn
          Left = 755
          Top = 0
          Width = 116
          Height = 37
          Hint = 'Pesquisar'
          Align = alRight
          Caption = '&Pesquisar'
          TabOrder = 2
          OnClick = btPesquisarClick
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
        object rbNomeFantasia: TRadioButton
          Left = 289
          Top = 2
          Width = 98
          Height = 17
          Caption = 'Nome Fantasia'
          TabOrder = 3
          OnClick = rbNomeFantasiaClick
        end
        object rbRazaoSocial: TRadioButton
          Left = 289
          Top = 19
          Width = 89
          Height = 17
          Caption = 'Raz'#227'o Social'
          TabOrder = 4
          OnClick = rbNomeFantasiaClick
        end
        object GroupBox3: TGroupBox
          Left = 401
          Top = -2
          Width = 150
          Height = 39
          Caption = 'Status'
          TabOrder = 5
          object rbFechada: TCheckBox
            Left = 7
            Top = 19
            Width = 63
            Height = 17
            Caption = 'Fechada'
            TabOrder = 0
          end
          object rbAberta: TCheckBox
            Left = 90
            Top = 19
            Width = 54
            Height = 17
            Caption = 'Aberta'
            TabOrder = 1
          end
        end
        object Panel29: TPanel
          Left = 572
          Top = 14
          Width = 86
          Height = 13
          BevelOuter = bvNone
          Caption = 'Aberta'
          Color = 9403451
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clCream
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentBackground = False
          ParentFont = False
          TabOrder = 6
        end
      end
      object Panel5: TPanel
        Left = 0
        Top = 431
        Width = 875
        Height = 41
        Align = alBottom
        BevelKind = bkTile
        BevelOuter = bvNone
        TabOrder = 2
        object btDefinirComissao: TBitBtn
          Left = 3
          Top = 6
          Width = 165
          Height = 25
          Hint = 'Definir comiss'#227'o - [VND168]'
          Caption = 'Definir comiss'#227'o'
          TabOrder = 0
          OnClick = btDefinirComissaoClick
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            20000000000000040000C30E0000C30E00000000000000000000000000000000
            00000000000000000000000000000000000000000000000000007FA6471C7FA6
            478D7FA647C67FA647C67FA6478D7FA6471C0000000000000000000000000000
            000000000000000000000000000000000000000000007FA647557FA647E27FA6
            47FF7FA647FF7FA647FF7FA647FF7FA647E27FA6475500000000676767B65454
            54FF545454FF545454FF545454FF5454543E7FA6471C7FA647E27FA647FF769F
            3AFFFFFFFFFF769F3AFF7DA244FF739E38FF7FA647E27FA6471C545454FFFDFD
            FDFFFFFFFFFFFFFFFFFFFFFFFFD7FFFFFF0B7FA6478D7FA647FF7FA647FFFFFF
            FFFFFFFFFFFFFFFFFFFF769F3AFF7DA646FF7FA647FF7FA6478D545454FFFDFD
            FDFFC0987BFFC0987BFFC0987BD7C0987B037FA647C67FA647FFFFFFFFFFFFFF
            FFFFBDD2A0FFFFFFFFFFFFFFFFFF769F3AFF7FA647FF7FA647C6545454FFFDFD
            FDFFC0987BFFFFFFFFFFFFFFFFD7FFFFFF037FA647C67FA647FFFFFFFFFFBDD2
            A0FF769F3AFFBDD2A0FFFFFFFFFFFFFFFFFF7FA647FF7FA647C6545454FFFDFD
            FDFFC0987BFFFFFFFFFFFFFFFFD7FFFFFF0C7FA6478D7FA647FF769F3AFF769F
            3AFF769F3AFF769F3AFFBDD2A0FFFFFFFFFF7FA647FF7FA6478D545454FFFDFD
            FDFFC0987BFFC0987BFFC0987BFFC0987B407FA6471C7FA647E27FA647FF7FA6
            47FF7FA647FF7FA647FF7FA647FFC1D4A6FF7FA647E27FA6471C545454FFFDFD
            FDFFC0987BFFC0987BFFC0987BFFC0987BDCC0987B027FA647557FA647E27FA6
            47FF7FA647FF7FA647FF7FA647FF7FA647E27FA6475500000000545454FFFDFD
            FDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA3FFFFFF027FA6471C7FA6
            478D7FA647C67FA647C67FA6478D7FA6471C0000000000000000545454FFFDFD
            FDFFA6A6A6FFA6A6A6FFA6A6A6FFA6A6A6FFA6A6A6FFFFFFFFD7FFFFFF38FEFE
            FE07FEFEFE01FDFDFD0154545406000000000000000000000000545454FFFDFD
            FDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF919191FF5454
            54D7545454D7545454D7545454D7000000000000000000000000545454FFFDFD
            FDFF8D8D8DFF696969FF949494FF949494FF949494FFFFFFFFFF545454FFFEFE
            FEFFFFFFFFFFB8B8B8FF676767D4000000000000000000000000545454FFFDFD
            FDFFC6C6C6FF696969FF949494FF8C8C8CFFAEAEAEFFFFFFFFFF545454FFFEFE
            FEFFB9B9B9FF676767DB6868681C000000000000000000000000545454FFFDFD
            FDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF545454FFB9B9
            B9FF676767DC6868681C00000000000000000000000000000000676767B65454
            54FF545454FF545454FF545454FF545454FF545454FF545454FF545454FF6767
            67D66868681D0000000000000000000000000000000000000000}
        end
        object btVoltar: TBitBtn
          Left = 706
          Top = 6
          Width = 165
          Height = 25
          Hint = 'Sair'
          Caption = '&Sair'
          TabOrder = 1
          OnClick = btVoltarClick
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
      object Panel68: TPanel
        Left = 0
        Top = 41
        Width = 875
        Height = 390
        Align = alClient
        BevelOuter = bvNone
        Caption = 'Panel68'
        TabOrder = 1
        object Splitter6: TSplitter
          Left = 0
          Top = 265
          Width = 875
          Height = 1
          Cursor = crVSplit
          Align = alBottom
          ExplicitTop = 291
          ExplicitWidth = 800
        end
        object PanelTreeView: TPanel
          Left = 0
          Top = 266
          Width = 875
          Height = 124
          Align = alBottom
          TabOrder = 0
          object GroupBox1: TGroupBox
            Left = 1
            Top = 1
            Width = 873
            Height = 122
            Align = alClient
            Caption = 'Formas de Pagamento'
            TabOrder = 0
            object DBGrid1: TDBGrid
              Left = 2
              Top = 15
              Width = 869
              Height = 105
              Align = alClient
              DataSource = DtmPedVenda.dsFormasPorVenda
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
                  FieldName = 'NOME_CTRL'
                  Title.Caption = 'Forma Pag'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DATA_MOV'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'VALORDOC'
                  Title.Caption = 'Valor Documento'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DATA_VENC'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NDOC'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'SEQFORM'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NPARCELA'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'COD_CONTROLE'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'COD_EMPRESA'
                  Visible = False
                end
                item
                  Expanded = False
                  FieldName = 'RECIBO'
                  Visible = False
                end
                item
                  Expanded = False
                  FieldName = 'HISTORICO'
                  Visible = False
                end
                item
                  Expanded = False
                  FieldName = 'DOCS'
                  Visible = False
                end
                item
                  Expanded = False
                  FieldName = 'REC_NUMVEND'
                  Visible = False
                end
                item
                  Expanded = False
                  FieldName = 'REC_TIPVEND'
                  Visible = False
                end
                item
                  Expanded = False
                  FieldName = 'PRG_FID'
                  Visible = False
                end>
            end
          end
        end
        object gridVendas: TDBGrid
          Left = 0
          Top = 0
          Width = 875
          Height = 265
          Align = alClient
          DataSource = DtmPedVenda.dsComissaoPorVendaCons
          ReadOnly = True
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnDrawColumnCell = gridVendasDrawColumnCell
          Columns = <
            item
              Expanded = False
              FieldName = 'NPED'
              Width = 59
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIPO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DATA_PED'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOME_CLIENTE'
              Width = 173
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VALOR_TOTAL'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VL_COMISSAO_VEND'
              Title.Caption = 'Comissao Vendedor'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PERC_COMISSAO_VEND'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'VL_COMISSAO_VEND1'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PERC_COMISSAO_VEND1'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'DATA_FECH'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LIMITE_CREDITO'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'DESC_COND_PAG'
              Width = 117
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOME_CTRL'
              Width = 151
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIPV'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'BARRADO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CIDADE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COD_CLIENTE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'AUTORIZADO_FINANCEIRO'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'OBS_CXL_RQ'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'IDMOBILE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NPEDMOB'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOME_VENDEDOR'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CPFCGC'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'APROVADA_GERENTE'
              Visible = False
            end>
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'TabSheet2'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object PanelComissaoPorVenda: TPanel
        Left = 1
        Top = 39
        Width = 808
        Height = 328
        TabOrder = 0
        OnEnter = PanelComissaoPorVendaEnter
        object Panel2: TPanel
          Left = 1
          Top = 291
          Width = 806
          Height = 36
          Align = alBottom
          BevelKind = bkTile
          BevelOuter = bvNone
          TabOrder = 1
          object BitBtn47: TBitBtn
            Left = 641
            Top = 3
            Width = 156
            Height = 25
            Hint = 'Sair'
            Caption = '(ESC) Sair'
            TabOrder = 0
            OnClick = BitBtn47Click
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
        object Panel4: TPanel
          Left = 1
          Top = 1
          Width = 806
          Height = 290
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object GroupBoxVendedor: TGroupBox
            Left = 0
            Top = 154
            Width = 806
            Height = 68
            Align = alTop
            Caption = 'Vendedor'
            TabOrder = 1
            object Label10: TLabel
              Left = 38
              Top = 40
              Width = 109
              Height = 13
              Alignment = taRightJustify
              Caption = 'Perc Comiss'#227'o (%):'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label11: TLabel
              Left = 322
              Top = 40
              Width = 119
              Height = 13
              Alignment = taRightJustify
              Caption = 'Valor Comiss'#227'o (R$):'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label15: TLabel
              Left = 88
              Top = 12
              Width = 59
              Height = 13
              Alignment = taRightJustify
              Caption = 'Vendedor:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label17: TLabel
              Left = 595
              Top = 12
              Width = 92
              Height = 13
              Alignment = taRightJustify
              Caption = 'Valor Produtos: '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBLookupComboBox1: TDBLookupComboBox
              Left = 153
              Top = 9
              Width = 394
              Height = 21
              KeyField = 'COD_VENDEDOR'
              ListField = 'NOME_VENDEDOR'
              ListSource = DtmPedVenda.dsComissaoVend
              TabOrder = 0
              OnExit = DBLookupComboBox1Exit
            end
            object EditHwPercVend: TEditHw
              Left = 153
              Top = 36
              Width = 100
              Height = 21
              TabOrder = 2
              Text = '0,00'
              OnExit = EditHwPercVendExit
              Formato = fNumber
              FormatSize = '0.2'
            end
            object EditHwVlVend: TEditHw
              Left = 447
              Top = 36
              Width = 100
              Height = 21
              TabOrder = 3
              Text = '0,00'
              OnExit = EditHwVlVendExit
              Formato = fNumber
              FormatSize = '0.2'
            end
            object EditHwVlProdVend: TEditHw
              Left = 691
              Top = 9
              Width = 100
              Height = 21
              Enabled = False
              TabOrder = 1
              Text = '0,00'
              Formato = fNumber
              FormatSize = '0.2'
            end
            object BitBtn1: TBitBtn
              Left = 722
              Top = 36
              Width = 75
              Height = 25
              Hint = 'Aplicar - [VND244]'
              Caption = 'Aplicar'
              Default = True
              TabOrder = 5
              OnClick = BitBtn1Click
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
            object BitBtn2: TBitBtn
              Left = 641
              Top = 36
              Width = 75
              Height = 25
              Hint = 'Alterar'
              Caption = 'Alterar'
              Default = True
              TabOrder = 4
              OnClick = BitBtn2Click
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
          end
          object GroupBox2: TGroupBox
            Left = 0
            Top = 0
            Width = 806
            Height = 154
            Align = alTop
            Caption = 'Totais'
            TabOrder = 0
            object Label3: TLabel
              Left = 67
              Top = 20
              Width = 80
              Height = 13
              Alignment = taRightJustify
              Caption = 'N'#186' do Pedido:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label4: TLabel
              Left = 103
              Top = 45
              Width = 44
              Height = 13
              Alignment = taRightJustify
              Caption = 'Cliente:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label5: TLabel
              Left = 88
              Top = 70
              Width = 59
              Height = 13
              Alignment = taRightJustify
              Caption = 'Vendedor:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label6: TLabel
              Left = 596
              Top = 20
              Width = 88
              Height = 13
              Alignment = taRightJustify
              Caption = 'Tipo de Venda:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label7: TLabel
              Left = 79
              Top = 94
              Width = 68
              Height = 13
              Alignment = taRightJustify
              Caption = 'Valor Bruto:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label8: TLabel
              Left = 360
              Top = 94
              Width = 81
              Height = 13
              Alignment = taRightJustify
              Caption = 'Valor L'#237'quido:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label9: TLabel
              Left = 77
              Top = 118
              Width = 70
              Height = 13
              Alignment = taRightJustify
              Caption = 'Custo Total:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label14: TLabel
              Left = 357
              Top = 118
              Width = 84
              Height = 13
              Alignment = taRightJustify
              Caption = 'Lucro L'#237'quido:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label19: TLabel
              Left = 556
              Top = 87
              Width = 128
              Height = 36
              Alignment = taRightJustify
              AutoSize = False
              Caption = 'Comiss'#227'o Total Vendedor (R$):'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              WordWrap = True
            end
            object Label20: TLabel
              Left = 579
              Top = 116
              Width = 105
              Height = 36
              Alignment = taRightJustify
              AutoSize = False
              Caption = 'Comiss'#227'o Total Vendedor (R$):'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              WordWrap = True
            end
            object DBEdit20: TDBEdit
              Left = 153
              Top = 17
              Width = 46
              Height = 21
              DataField = 'NPED'
              DataSource = DtmPedVenda.dsComissaoPorVendaCons
              Enabled = False
              TabOrder = 0
            end
            object DBEdit21: TDBEdit
              Left = 691
              Top = 17
              Width = 100
              Height = 21
              DataField = 'TIPV'
              DataSource = DtmPedVenda.dsComissaoPorVendaCons
              Enabled = False
              TabOrder = 1
            end
            object DBEdit22: TDBEdit
              Left = 153
              Top = 42
              Width = 638
              Height = 21
              DataField = 'NOME_CLIENTE'
              DataSource = DtmPedVenda.dsComissaoPorVendaCons
              Enabled = False
              TabOrder = 2
            end
            object DBEdit23: TDBEdit
              Left = 153
              Top = 67
              Width = 638
              Height = 21
              DataField = 'NOME_VENDEDOR'
              DataSource = DtmPedVenda.dsComissaoPorVendaCons
              Enabled = False
              TabOrder = 3
            end
            object DBEdit1: TDBEdit
              Left = 153
              Top = 91
              Width = 100
              Height = 21
              DataField = 'TOT_PROD'
              DataSource = DtmPedVenda.dsComissaoPorVendaCons
              Enabled = False
              TabOrder = 4
            end
            object DBEdit2: TDBEdit
              Left = 447
              Top = 91
              Width = 100
              Height = 21
              DataField = 'VALOR_TOTAL'
              DataSource = DtmPedVenda.dsComissaoPorVendaCons
              Enabled = False
              TabOrder = 5
            end
            object DBEdit3: TDBEdit
              Left = 153
              Top = 115
              Width = 100
              Height = 21
              DataField = 'CUSTO_TOTAL'
              DataSource = DtmPedVenda.dsComissaoPorVendaCons
              Enabled = False
              TabOrder = 6
            end
            object DBEdit4: TDBEdit
              Left = 447
              Top = 115
              Width = 100
              Height = 21
              DataField = 'LUCRO'
              DataSource = DtmPedVenda.dsComissaoPorVendaCons
              Enabled = False
              TabOrder = 7
            end
            object DBEdit5: TDBEdit
              Left = 691
              Top = 91
              Width = 100
              Height = 21
              DataField = 'VL_COMISSAO_VEND'
              DataSource = DtmPedVenda.dsComissaoPorVendaCons
              Enabled = False
              TabOrder = 8
            end
            object DBEdit6: TDBEdit
              Left = 691
              Top = 115
              Width = 100
              Height = 21
              DataField = 'VL_COMISSAO_VEND1'
              DataSource = DtmPedVenda.dsComissaoPorVendaCons
              Enabled = False
              TabOrder = 9
            end
          end
          object GroupBoxParticipante: TGroupBox
            Left = 0
            Top = 222
            Width = 806
            Height = 68
            Align = alBottom
            Caption = 'Participante'
            TabOrder = 2
            object Label12: TLabel
              Left = 38
              Top = 38
              Width = 109
              Height = 13
              Alignment = taRightJustify
              Caption = 'Perc Comiss'#227'o (%):'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label13: TLabel
              Left = 322
              Top = 38
              Width = 119
              Height = 13
              Alignment = taRightJustify
              Caption = 'Valor Comiss'#227'o (R$):'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label16: TLabel
              Left = 95
              Top = 14
              Width = 52
              Height = 13
              Alignment = taRightJustify
              Caption = 'Parceiro:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label18: TLabel
              Left = 595
              Top = 14
              Width = 92
              Height = 13
              Alignment = taRightJustify
              Caption = 'Valor Produtos: '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBLookupComboBox2: TDBLookupComboBox
              Left = 153
              Top = 11
              Width = 394
              Height = 21
              KeyField = 'COD_VENDEDOR1'
              ListField = 'NOME_PARTICIPANTE'
              ListSource = DtmPedVenda.dsComissaoPart
              TabOrder = 0
              OnExit = DBLookupComboBox2Exit
            end
            object EditHwPercPart: TEditHw
              Left = 153
              Top = 34
              Width = 100
              Height = 21
              TabOrder = 2
              Text = '0,00'
              OnExit = EditHwPercPartExit
              Formato = fNumber
              FormatSize = '0.2'
            end
            object EditHwVlPart: TEditHw
              Left = 447
              Top = 34
              Width = 100
              Height = 21
              TabOrder = 3
              Text = '0,00'
              OnExit = EditHwVlPartExit
              Formato = fNumber
              FormatSize = '0.2'
            end
            object EditHwVlProdPart: TEditHw
              Left = 693
              Top = 11
              Width = 100
              Height = 21
              Enabled = False
              TabOrder = 1
              Text = '0,00'
              Formato = fNumber
              FormatSize = '0.2'
            end
            object BitBtn3: TBitBtn
              Left = 722
              Top = 38
              Width = 75
              Height = 25
              Hint = 'Aplicar - [VND244]'
              Caption = 'Aplicar'
              Default = True
              TabOrder = 5
              OnClick = BitBtn3Click
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
            object BitBtn4: TBitBtn
              Left = 641
              Top = 38
              Width = 75
              Height = 25
              Hint = 'Alterar'
              Caption = 'Alterar'
              Default = True
              TabOrder = 4
              OnClick = BitBtn4Click
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
          end
        end
      end
    end
  end
end
