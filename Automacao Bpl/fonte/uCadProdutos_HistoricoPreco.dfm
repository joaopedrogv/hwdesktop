inherited frmCadProdutosHistPreco: TfrmCadProdutosHistPreco
  Caption = 'Hist'#243'rico de pre'#231'os, markup e margem'
  ClientHeight = 568
  ClientWidth = 815
  Position = poScreenCenter
  OnClose = FormClose
  ExplicitWidth = 823
  ExplicitHeight = 602
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 815
    Height = 568
    Align = alClient
    BevelOuter = bvNone
    Padding.Left = 6
    Padding.Right = 6
    Padding.Bottom = 6
    TabOrder = 0
    object Splitter1: TSplitter
      Left = 6
      Top = 320
      Width = 803
      Height = 3
      Cursor = crVSplit
      Align = alTop
      Beveled = True
      Visible = False
      ExplicitTop = 289
      ExplicitWidth = 187
    end
    object produtoPanel: TPanel
      Tag = 200
      Left = 6
      Top = 0
      Width = 803
      Height = 320
      Align = alTop
      BevelOuter = bvNone
      Padding.Top = 3
      Padding.Bottom = 6
      TabOrder = 0
      object GroupBox1: TGroupBox
        Left = 0
        Top = 3
        Width = 803
        Height = 311
        Align = alClient
        Caption = 'Produto'
        TabOrder = 0
        object Panel2: TPanel
          Left = 2
          Top = 15
          Width = 799
          Height = 168
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object btShow: TSpeedButton
            Left = 668
            Top = 51
            Width = 23
            Height = 22
            Hint = 'Ver lista de produtos'
            Flat = True
            Glyph.Data = {
              36050000424D3605000000000000360400002800000010000000100000000100
              08000000000000010000420B0000420B00000001000000010000B55A18005A6B
              7300AD7B73004A637B00EFBD8400B58C8C00A5948C00C6948C00B59C8C00BD9C
              8C00BD949400C6949400C69C9400CEAD9400F7CE9400C6A59C00CEA59C00C6AD
              9C00CEAD9C00F7CE9C004A7BA500CEADA500D6B5A500DEBDA500F7D6A500DEBD
              AD00DEC6AD00E7C6AD00FFDEAD00FFE7AD00CEB5B500F7DEB500FFE7B500D6BD
              BD00DED6BD00E7DEBD006B9CC600E7D6C600FFEFC600FFF7C600F7E7CE00FFF7
              CE00F7EFD600F7F7D600FFF7D600FFFFD6002184DE00FFFFDE001884E700188C
              E700218CEF00B5D6EF00F7F7EF00FFF7EF00FFFFEF00FFFFF700FF00FF004AB5
              FF0052B5FF0052BDFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0038030A383838
              383838383838383838382431140B383838383838383838383838393A32140B38
              38383838383838383838383A3A30140B3838383838383838383838383A393114
              0A3838383838383838383838383A392E0138020F161038383838383838383B33
              0608282D2D2D2315383838383838381E16262D2D2D2F36340538383838383807
              1F18292D0036373C22383838383838171D0E2925002525362A0C38383838381B
              1C0400000000002F2B1138383838381920040E2600262F2F2A0F38383838380C
              2626181300292C2D23383838383838381A3C350E041320270938383838383838
              38212A261D201F12383838383838383838380D12171738383838}
            OnClick = btShowClick
          end
          object btPrevius: TSpeedButton
            Left = 639
            Top = 23
            Width = 23
            Height = 22
            Hint = 'Ir para o registro anterior'
            Flat = True
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFC5BDB7B3A385FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F7F69D8976A77B4C8C65
              38FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFDDD7D3957454C59369CC9672936A41FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFEFEFEB9A799A1754EC9946ED7A27EDEAA869C71
              4CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEBE99B7B62A2
              704ABB8560CD9874DFAB87EBB896A37753FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFD6C7BC845838895734A26D48B9825DCA9470D9A481E0AD8AA273
              50FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBF9D857D5333845D3F9C7455B1
              8868C39A78CFA685D7AE8EDAB292A27655FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFC49F86956E4D99795CA78567B49171C09B7BCAA483D0AA89D2AC8AA173
              51FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE1CBBDAA7C59AF9274B8
              9A7CC0A182C8A787CCAB8BCEAC8CA27451FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFF3ECE8BF906FBD9E7FC6AB8CCAAE90CDB092CEB192A679
              55FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFDFDD5
              B39CC19977D3BB9DD4BB9DD4BB9DAD815DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9DAD0C2926EDEC7A8E1CDADB88C
              66FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFF8F5F3CA9E80DEBF9DC79D78FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE4CEBFEDE0
              D6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
            OnClick = btPreviusClick
          end
          object btNext: TSpeedButton
            Left = 668
            Top = 23
            Width = 23
            Height = 22
            Hint = 'Ir para o pr'#243'ximo registro'
            Flat = True
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB4A485C7BEB7FFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFF9C764AC09568A18D79F8F7F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9D754DE1AD8AD19F76997957DE
              D8D3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFF9C724CDBA783D39E7AC7926DA3774FBAA99AFEFEFEFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9A6D49D29D79CD9873C48E69B9
              825CA5724C9E7E65EFECE9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFF986845C9936EC58F6ABE8863B57E58A6704B94603D8C5F3ED8C8BDFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF986845C4916DC08D69BA8560AE
              7853A06B47905D3A7E4C2B754322BC9981FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFF9E704ECCA583CBA382C7A07FC09B7AB58E6EA47B5C8D6243794522C09A
              81FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA17451CDAB8BCCAA8AC9A787C5
              A484BF9E7FB8997AB28360E2CCBEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFA87B57D1B494D1B394CFB292CCAF90C4A383C19372F3EDE8FFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB18662D9C0A1D9BFA0D8BFA0C5
              9C7AD5B49DFEFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFBC916DE5D0B0E1C9A9C39370E9DAD0FFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC89F7DDEBE9CCA9E80F8F5F3FF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFEDDFD6E5CFC1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
            OnClick = btNextClick
          end
          object btHide: TSpeedButton
            Left = 639
            Top = 51
            Width = 23
            Height = 22
            Hint = 'Ver lista de produtos'
            Flat = True
            Glyph.Data = {
              36050000424D3605000000000000360400002800000010000000100000000100
              08000000000000010000420B0000420B00000001000000010000B55A18005A6B
              7300AD7B73004A637B00EFBD8400B58C8C00A5948C00C6948C00B59C8C00BD9C
              8C00BD949400C6949400C69C9400CEAD9400F7CE9400C6A59C00CEA59C00C6AD
              9C00CEAD9C00F7CE9C004A7BA500CEADA500D6B5A500DEBDA500F7D6A500DEBD
              AD00DEC6AD00E7C6AD00FFDEAD00FFE7AD00CEB5B500F7DEB500F7E7B500FFE7
              B500D6BDBD00DED6BD00E7DEBD006B9CC600E7D6C600FFEFC600FFF7C600F7E7
              CE00FFF7CE00F7EFD600F7F7D600FFF7D600FFFFD6002184DE00FFFFDE001884
              E700188CE700218CEF00B5D6EF00F7F7EF00FFF7EF00FFFFEF00FFFFF700FF00
              FF004AB5FF0052B5FF0052BDFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0039030A393939
              393939393939393939392532140B3939393939393939393939393A3B33140B39
              39393939393939393939393B3B31140B3939393939393939393939393B3A3214
              0A3939393939393939393939393B3A2F0139020F161039393939393939393C34
              0608292E2E2E2415393939393939391E16272E2E2E3037350539393939393907
              1F182A2E3037383D23393939393939171D0E2626262626372B0C39393939391B
              1C040000000000302C1139393939391921040E27303030302B0F39393939390C
              27271813202A2D2E24393939393939391A3D360E041321280939393939393939
              39222B271D211F12393939393939393939390D12171739393939}
            Visible = False
            OnClick = btHideClick
          end
          object DBText1: TDBText
            Left = 48
            Top = 0
            Width = 40
            Height = 17
            DataField = 'GRUPO_PROD'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label5: TLabel
            Left = 8
            Top = 0
            Width = 34
            Height = 13
            Alignment = taRightJustify
            Caption = 'Grupo'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBText2: TDBText
            Left = 141
            Top = 0
            Width = 43
            Height = 17
            DataField = 'COD_PROD'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label6: TLabel
            Left = 97
            Top = 0
            Width = 38
            Height = 13
            Alignment = taRightJustify
            Caption = 'Codigo'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label8: TLabel
            Left = 196
            Top = 0
            Width = 46
            Height = 13
            Alignment = taRightJustify
            Caption = 'Num fab'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBText3: TDBText
            Left = 248
            Top = 0
            Width = 104
            Height = 17
            DataField = 'NUM_FAB_PROD'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBText4: TDBText
            Left = 358
            Top = 0
            Width = 312
            Height = 17
            DataField = 'DESCR_PROD'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object GridPanel2: TGridPanel
            Left = 7
            Top = 20
            Width = 626
            Height = 149
            BevelKind = bkTile
            BevelOuter = bvNone
            BorderWidth = 3
            ColumnCollection = <
              item
                Value = 14.471780028943560000
              end
              item
                Value = 14.471780028943560000
              end
              item
                Value = 14.471780028943560000
              end
              item
                Value = 14.471780028943560000
              end
              item
                Value = 14.471780028943560000
              end
              item
                Value = 14.471780028943560000
              end
              item
                Value = 13.169319826338640000
              end>
            ControlCollection = <
              item
                Column = 0
                Control = Label13
                Row = 0
              end
              item
                Column = 1
                Control = Label14
                Row = 0
              end
              item
                Column = 2
                Control = Label15
                Row = 0
              end
              item
                Column = 3
                Control = Label16
                Row = 0
              end
              item
                Column = 4
                Control = Label17
                Row = 0
              end
              item
                Column = 5
                Control = Label32
                Row = 0
              end
              item
                Column = 6
                Control = Label33
                Row = 0
              end
              item
                Column = 0
                Control = Label34
                Row = 1
              end
              item
                Column = 1
                Control = DBText36
                Row = 1
              end
              item
                Column = 2
                Control = DBText37
                Row = 1
              end
              item
                Column = 3
                Control = DBText38
                Row = 1
              end
              item
                Column = 4
                Control = DBText39
                Row = 1
              end
              item
                Column = 5
                Control = DBText40
                Row = 1
              end
              item
                Column = 6
                Control = Label35
                Row = 1
              end
              item
                Column = 0
                Control = Label36
                Row = 2
              end
              item
                Column = 1
                Control = DBText41
                Row = 2
              end
              item
                Column = 2
                Control = DBText42
                Row = 2
              end
              item
                Column = 3
                Control = DBText43
                Row = 2
              end
              item
                Column = 4
                Control = DBText44
                Row = 2
              end
              item
                Column = 5
                Control = DBText45
                Row = 2
              end
              item
                Column = 6
                Control = Label37
                Row = 2
              end
              item
                Column = 0
                Control = Label38
                Row = 3
              end
              item
                Column = 1
                Control = DBText46
                Row = 3
              end
              item
                Column = 2
                Control = DBText47
                Row = 3
              end
              item
                Column = 3
                Control = DBText48
                Row = 3
              end
              item
                Column = 4
                Control = DBText49
                Row = 3
              end
              item
                Column = 5
                Control = DBText50
                Row = 3
              end
              item
                Column = 6
                Control = DBText51
                Row = 3
              end
              item
                Column = 0
                Control = Label39
                Row = 4
              end
              item
                Column = 1
                Control = DBText52
                Row = 4
              end
              item
                Column = 2
                Control = DBText53
                Row = 4
              end
              item
                Column = 3
                Control = DBText54
                Row = 4
              end
              item
                Column = 4
                Control = DBText55
                Row = 4
              end
              item
                Column = 5
                Control = DBText56
                Row = 4
              end
              item
                Column = 6
                Control = DBText57
                Row = 4
              end
              item
                Column = 0
                Control = Label40
                Row = 5
              end
              item
                Column = 1
                Control = DBText58
                Row = 5
              end
              item
                Column = 2
                Control = DBText59
                Row = 5
              end
              item
                Column = 3
                Control = DBText60
                Row = 5
              end
              item
                Column = 4
                Control = DBText61
                Row = 5
              end
              item
                Column = 5
                Control = DBText62
                Row = 5
              end
              item
                Column = 6
                Control = DBText63
                Row = 5
              end
              item
                Column = 0
                Control = Label41
                Row = 6
              end
              item
                Column = 1
                Control = DBText64
                Row = 6
              end
              item
                Column = 2
                Control = Label42
                Row = 6
              end
              item
                Column = 3
                Control = DBText65
                Row = 6
              end
              item
                Column = 4
                Control = Label43
                Row = 6
              end
              item
                Column = 5
                Control = DBText66
                Row = 6
              end
              item
                Column = 6
                Control = Label44
                Row = 6
              end>
            Padding.Right = 3
            RowCollection = <
              item
                SizeStyle = ssAbsolute
                Value = 32.000000000000000000
              end
              item
                SizeStyle = ssAbsolute
                Value = 18.000000000000000000
              end
              item
                SizeStyle = ssAbsolute
                Value = 18.000000000000000000
              end
              item
                SizeStyle = ssAbsolute
                Value = 18.000000000000000000
              end
              item
                SizeStyle = ssAbsolute
                Value = 18.000000000000000000
              end
              item
                SizeStyle = ssAbsolute
                Value = 18.000000000000000000
              end
              item
                SizeStyle = ssAbsolute
                Value = 18.000000000000000000
              end>
            TabOrder = 0
            object Label13: TLabel
              Left = 3
              Top = 3
              Width = 85
              Height = 32
              Align = alClient
              Alignment = taRightJustify
              Caption = 'Tipo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              Layout = tlCenter
              ExplicitLeft = 64
              ExplicitWidth = 24
              ExplicitHeight = 13
            end
            object Label14: TLabel
              Left = 91
              Top = 3
              Width = 85
              Height = 32
              Align = alClient
              Alignment = taRightJustify
              Caption = 'Pre'#231'o'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              Layout = tlCenter
              ExplicitLeft = 144
              ExplicitWidth = 32
              ExplicitHeight = 13
            end
            object Label15: TLabel
              Left = 179
              Top = 3
              Width = 85
              Height = 32
              Align = alClient
              Alignment = taRightJustify
              Caption = '%Markup desejado'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              Layout = tlCenter
              WordWrap = True
              ExplicitLeft = 205
              ExplicitWidth = 59
              ExplicitHeight = 26
            end
            object Label16: TLabel
              Left = 267
              Top = 3
              Width = 85
              Height = 32
              Align = alClient
              Alignment = taRightJustify
              Caption = '% Markup obtidido'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              Layout = tlCenter
              WordWrap = True
              ExplicitLeft = 290
              ExplicitWidth = 62
              ExplicitHeight = 26
            end
            object Label17: TLabel
              Left = 355
              Top = 3
              Width = 85
              Height = 32
              Align = alClient
              Alignment = taRightJustify
              Caption = '% Margem desejada'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              Layout = tlCenter
              WordWrap = True
              ExplicitLeft = 374
              ExplicitWidth = 66
              ExplicitHeight = 26
            end
            object Label32: TLabel
              Left = 443
              Top = 3
              Width = 85
              Height = 32
              Align = alClient
              Alignment = taRightJustify
              Caption = '% Margem obtida'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              Layout = tlCenter
              WordWrap = True
              ExplicitLeft = 462
              ExplicitWidth = 66
              ExplicitHeight = 26
            end
            object Label33: TLabel
              Left = 531
              Top = 3
              Width = 82
              Height = 32
              Align = alClient
              Alignment = taRightJustify
              Caption = '% adicional sobre Varejo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              Layout = tlCenter
              WordWrap = True
              ExplicitLeft = 541
              ExplicitWidth = 72
              ExplicitHeight = 26
            end
            object Label34: TLabel
              Left = 3
              Top = 35
              Width = 85
              Height = 18
              Align = alClient
              Alignment = taRightJustify
              Caption = 'Varejo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              ExplicitLeft = 49
              ExplicitWidth = 39
              ExplicitHeight = 14
            end
            object DBText36: TDBText
              Left = 91
              Top = 35
              Width = 85
              Height = 18
              Align = alClient
              Alignment = taRightJustify
              DataField = 'PREC_TAB_PROD'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              ExplicitLeft = 121
              ExplicitWidth = 34
              ExplicitHeight = 17
            end
            object DBText37: TDBText
              Left = 179
              Top = 35
              Width = 85
              Height = 18
              Align = alClient
              Alignment = taRightJustify
              DataField = 'PERC_TB_PROD'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              ExplicitLeft = 121
              ExplicitTop = 69
              ExplicitWidth = 103
              ExplicitHeight = 17
            end
            object DBText38: TDBText
              Left = 267
              Top = 35
              Width = 85
              Height = 18
              Align = alClient
              Alignment = taRightJustify
              DataField = 'MARKUP_V_CALC'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              ExplicitLeft = 121
              ExplicitTop = 103
              ExplicitWidth = 103
              ExplicitHeight = 17
            end
            object DBText39: TDBText
              Left = 355
              Top = 35
              Width = 85
              Height = 18
              Align = alClient
              Alignment = taRightJustify
              DataField = 'MARGEM_V_DESEJ'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              ExplicitLeft = 121
              ExplicitTop = 137
              ExplicitWidth = 103
              ExplicitHeight = 17
            end
            object DBText40: TDBText
              Left = 443
              Top = 35
              Width = 85
              Height = 18
              Align = alClient
              Alignment = taRightJustify
              DataField = 'MARGEM_V_CALC'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              ExplicitLeft = 121
              ExplicitTop = 171
              ExplicitWidth = 103
              ExplicitHeight = 17
            end
            object Label35: TLabel
              Left = 531
              Top = 35
              Width = 82
              Height = 18
              Align = alClient
              Alignment = taRightJustify
              Caption = 'Label18'
              Visible = False
              ExplicitLeft = 576
              ExplicitWidth = 37
              ExplicitHeight = 13
            end
            object Label36: TLabel
              Left = 3
              Top = 53
              Width = 85
              Height = 18
              Align = alClient
              Alignment = taRightJustify
              Caption = 'Atacado'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clMaroon
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              ExplicitLeft = 37
              ExplicitWidth = 51
              ExplicitHeight = 14
            end
            object DBText41: TDBText
              Left = 91
              Top = 53
              Width = 85
              Height = 18
              Align = alClient
              Alignment = taRightJustify
              DataField = 'PREC_PUBLICO'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clMaroon
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              ExplicitLeft = 224
              ExplicitTop = 35
              ExplicitWidth = 34
              ExplicitHeight = 17
            end
            object DBText42: TDBText
              Left = 179
              Top = 53
              Width = 85
              Height = 18
              Align = alClient
              Alignment = taRightJustify
              DataField = 'PERC_TB_PRODA'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clMaroon
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              ExplicitLeft = 224
              ExplicitTop = 69
              ExplicitWidth = 103
              ExplicitHeight = 17
            end
            object DBText43: TDBText
              Left = 267
              Top = 53
              Width = 85
              Height = 18
              Align = alClient
              Alignment = taRightJustify
              DataField = 'MARKUP_A_CALC'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clMaroon
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              ExplicitLeft = 224
              ExplicitTop = 103
              ExplicitWidth = 103
              ExplicitHeight = 17
            end
            object DBText44: TDBText
              Left = 355
              Top = 53
              Width = 85
              Height = 18
              Align = alClient
              Alignment = taRightJustify
              DataField = 'MARGEM_A_DESEJ'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clMaroon
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              ExplicitLeft = 224
              ExplicitTop = 137
              ExplicitWidth = 103
              ExplicitHeight = 17
            end
            object DBText45: TDBText
              Left = 443
              Top = 53
              Width = 85
              Height = 18
              Align = alClient
              Alignment = taRightJustify
              DataField = 'MARGEM_A_CALC'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clMaroon
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              ExplicitLeft = 224
              ExplicitTop = 171
              ExplicitWidth = 103
              ExplicitHeight = 17
            end
            object Label37: TLabel
              Left = 531
              Top = 53
              Width = 82
              Height = 18
              Align = alClient
              Alignment = taRightJustify
              Caption = 'Label18'
              Visible = False
              ExplicitLeft = 576
              ExplicitWidth = 37
              ExplicitHeight = 13
            end
            object Label38: TLabel
              Left = 3
              Top = 71
              Width = 85
              Height = 18
              Align = alClient
              Alignment = taRightJustify
              Caption = '30 dias'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              ExplicitLeft = 44
              ExplicitWidth = 44
              ExplicitHeight = 14
            end
            object DBText46: TDBText
              Left = 91
              Top = 71
              Width = 85
              Height = 18
              Align = alClient
              Alignment = taRightJustify
              DataField = 'PREC_30_PROD'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              ExplicitLeft = 327
              ExplicitTop = 35
              ExplicitWidth = 34
              ExplicitHeight = 17
            end
            object DBText47: TDBText
              Left = 179
              Top = 71
              Width = 85
              Height = 18
              Align = alClient
              Alignment = taRightJustify
              DataField = 'PERC_TB_PROD3'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              ExplicitLeft = 327
              ExplicitTop = 69
              ExplicitWidth = 34
              ExplicitHeight = 17
            end
            object DBText48: TDBText
              Left = 267
              Top = 71
              Width = 85
              Height = 18
              Align = alClient
              Alignment = taRightJustify
              DataField = 'MARKUP_30_CALC'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              ExplicitLeft = 327
              ExplicitTop = 103
              ExplicitWidth = 103
              ExplicitHeight = 17
            end
            object DBText49: TDBText
              Left = 355
              Top = 71
              Width = 85
              Height = 18
              Align = alClient
              Alignment = taRightJustify
              DataField = 'MARGEM_30_DESEJ'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              ExplicitLeft = 327
              ExplicitTop = 137
              ExplicitWidth = 103
              ExplicitHeight = 17
            end
            object DBText50: TDBText
              Left = 443
              Top = 71
              Width = 85
              Height = 18
              Align = alClient
              Alignment = taRightJustify
              DataField = 'MARGEM_30_CALC'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              ExplicitLeft = 327
              ExplicitTop = 171
              ExplicitWidth = 103
              ExplicitHeight = 17
            end
            object DBText51: TDBText
              Left = 531
              Top = 71
              Width = 82
              Height = 18
              Align = alClient
              Alignment = taRightJustify
              DataField = 'PERC_AD_30'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              ExplicitLeft = 327
              ExplicitTop = 137
              ExplicitWidth = 103
              ExplicitHeight = 17
            end
            object Label39: TLabel
              Left = 3
              Top = 89
              Width = 85
              Height = 18
              Align = alClient
              Alignment = taRightJustify
              Caption = '60 dias'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clMaroon
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              ExplicitLeft = 44
              ExplicitWidth = 44
              ExplicitHeight = 14
            end
            object DBText52: TDBText
              Left = 91
              Top = 89
              Width = 85
              Height = 18
              Align = alClient
              Alignment = taRightJustify
              DataField = 'PREC_60_PROD'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clMaroon
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              ExplicitLeft = 430
              ExplicitTop = 35
              ExplicitWidth = 34
              ExplicitHeight = 17
            end
            object DBText53: TDBText
              Left = 179
              Top = 89
              Width = 85
              Height = 18
              Align = alClient
              Alignment = taRightJustify
              DataField = 'PERC_TB_PROD6'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clMaroon
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              ExplicitLeft = 430
              ExplicitTop = 69
              ExplicitWidth = 34
              ExplicitHeight = 17
            end
            object DBText54: TDBText
              Left = 267
              Top = 89
              Width = 85
              Height = 18
              Align = alClient
              Alignment = taRightJustify
              DataField = 'MARKUP_60_CALC'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clMaroon
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              ExplicitLeft = 430
              ExplicitTop = 103
              ExplicitWidth = 103
              ExplicitHeight = 17
            end
            object DBText55: TDBText
              Left = 355
              Top = 89
              Width = 85
              Height = 18
              Align = alClient
              Alignment = taRightJustify
              DataField = 'MARGEM_60_DESEJ'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clMaroon
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              ExplicitLeft = 430
              ExplicitTop = 137
              ExplicitWidth = 103
              ExplicitHeight = 17
            end
            object DBText56: TDBText
              Left = 443
              Top = 89
              Width = 85
              Height = 18
              Align = alClient
              Alignment = taRightJustify
              DataField = 'MARGEM_60_CALC'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clMaroon
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              ExplicitLeft = 430
              ExplicitTop = 171
              ExplicitWidth = 103
              ExplicitHeight = 17
            end
            object DBText57: TDBText
              Left = 531
              Top = 89
              Width = 82
              Height = 18
              Align = alClient
              Alignment = taRightJustify
              DataField = 'PERC_AD_60'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clMaroon
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              ExplicitLeft = 430
              ExplicitTop = 137
              ExplicitWidth = 103
              ExplicitHeight = 17
            end
            object Label40: TLabel
              Left = 3
              Top = 107
              Width = 85
              Height = 18
              Align = alClient
              Alignment = taRightJustify
              Caption = '90 dias'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              ExplicitLeft = 44
              ExplicitWidth = 44
              ExplicitHeight = 14
            end
            object DBText58: TDBText
              Left = 91
              Top = 107
              Width = 85
              Height = 18
              Align = alClient
              Alignment = taRightJustify
              DataField = 'PREC_90_PROD'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              ExplicitLeft = 533
              ExplicitTop = 35
              ExplicitWidth = 34
              ExplicitHeight = 17
            end
            object DBText59: TDBText
              Left = 179
              Top = 107
              Width = 85
              Height = 18
              Align = alClient
              Alignment = taRightJustify
              DataField = 'PERC_TB_PROD9'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              ExplicitLeft = 533
              ExplicitTop = 69
              ExplicitWidth = 34
              ExplicitHeight = 17
            end
            object DBText60: TDBText
              Left = 267
              Top = 107
              Width = 85
              Height = 18
              Align = alClient
              Alignment = taRightJustify
              DataField = 'MARKUP_90_CALC'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              ExplicitLeft = 533
              ExplicitTop = 103
              ExplicitWidth = 104
              ExplicitHeight = 17
            end
            object DBText61: TDBText
              Left = 355
              Top = 107
              Width = 85
              Height = 18
              Align = alClient
              Alignment = taRightJustify
              DataField = 'MARGEM_90_DESEJ'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              ExplicitLeft = 533
              ExplicitTop = 137
              ExplicitWidth = 104
              ExplicitHeight = 17
            end
            object DBText62: TDBText
              Left = 443
              Top = 107
              Width = 85
              Height = 18
              Align = alClient
              Alignment = taRightJustify
              DataField = 'MARGEM_90_CALC'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              ExplicitLeft = 533
              ExplicitTop = 171
              ExplicitWidth = 104
              ExplicitHeight = 17
            end
            object DBText63: TDBText
              Left = 531
              Top = 107
              Width = 82
              Height = 18
              Align = alClient
              Alignment = taRightJustify
              DataField = 'PERC_AD_90'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              ExplicitLeft = 533
              ExplicitTop = 137
              ExplicitWidth = 104
              ExplicitHeight = 17
            end
            object Label41: TLabel
              Left = 3
              Top = 125
              Width = 85
              Height = 18
              Align = alClient
              Alignment = taRightJustify
              Caption = 'Promo'#231#227'o'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clMaroon
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              ExplicitLeft = 27
              ExplicitWidth = 61
              ExplicitHeight = 14
            end
            object DBText64: TDBText
              Left = 91
              Top = 125
              Width = 85
              Height = 18
              Align = alClient
              Alignment = taRightJustify
              DataField = 'PRECO_PROMOCAO'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clMaroon
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              ExplicitLeft = 637
              ExplicitTop = 35
              ExplicitWidth = 34
              ExplicitHeight = 17
            end
            object Label42: TLabel
              Left = 179
              Top = 125
              Width = 85
              Height = 18
              Align = alClient
              Alignment = taRightJustify
              Caption = 'Label18'
              Visible = False
              ExplicitLeft = 227
              ExplicitWidth = 37
              ExplicitHeight = 13
            end
            object DBText65: TDBText
              Left = 267
              Top = 125
              Width = 85
              Height = 18
              Align = alClient
              Alignment = taRightJustify
              DataField = 'MARKUP_PROMO_CALC'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clMaroon
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              ExplicitLeft = 637
              ExplicitTop = 103
              ExplicitWidth = 108
              ExplicitHeight = 17
            end
            object Label43: TLabel
              Left = 355
              Top = 125
              Width = 85
              Height = 18
              Align = alClient
              Alignment = taRightJustify
              Caption = 'Label18'
              Visible = False
              ExplicitLeft = 403
              ExplicitWidth = 37
              ExplicitHeight = 13
            end
            object DBText66: TDBText
              Left = 443
              Top = 125
              Width = 85
              Height = 18
              Align = alClient
              Alignment = taRightJustify
              DataField = 'MARGEM_PROMO_CALC'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clMaroon
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              ExplicitLeft = 637
              ExplicitTop = 171
              ExplicitWidth = 108
              ExplicitHeight = 17
            end
            object Label44: TLabel
              Left = 531
              Top = 125
              Width = 82
              Height = 18
              Align = alClient
              Alignment = taRightJustify
              Caption = 'Label18'
              Visible = False
              ExplicitLeft = 576
              ExplicitWidth = 37
              ExplicitHeight = 13
            end
          end
        end
        object gridProdutoPanel: TPanel
          Left = 2
          Top = 183
          Width = 799
          Height = 126
          Align = alClient
          BevelOuter = bvNone
          BorderWidth = 6
          TabOrder = 1
          Visible = False
          object gridProduto: TDBGrid
            Left = 6
            Top = 6
            Width = 787
            Height = 114
            Align = alClient
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnTitleClick = gridProdutoTitleClick
          end
        end
      end
    end
    object Panel3: TPanel
      Left = 6
      Top = 323
      Width = 803
      Height = 198
      Align = alClient
      BevelOuter = bvNone
      Padding.Bottom = 6
      TabOrder = 1
      object gridHistorico: TDBGrid
        Left = 0
        Top = 41
        Width = 803
        Height = 151
        Align = alClient
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnTitleClick = gridHistoricoTitleClick
        Columns = <
          item
            Expanded = False
            FieldName = 'COD_EMPRESA'
            Title.Caption = 'Emp'
            Width = 28
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TABELA'
            Title.Caption = 'Tabela'
            Width = 143
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QUANTIDADE'
            Title.Caption = 'Quantidade'
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DATA'
            Title.Caption = 'Data'
            Width = 115
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRECO'
            Title.Caption = 'Pre'#231'o'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MARKUP'
            Title.Caption = 'Markup'
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MARGEM'
            Title.Caption = 'Margem'
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'USUARIO'
            Title.Caption = 'Usu'#225'rio'
            Width = 156
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CUSTO'
            Title.Caption = 'Custo'
            Visible = True
          end>
      end
      object Panel5: TPanel
        Left = 0
        Top = 0
        Width = 803
        Height = 41
        Align = alTop
        BevelOuter = bvNone
        Padding.Left = 6
        TabOrder = 1
        object Label1: TLabel
          Left = 6
          Top = 0
          Width = 797
          Height = 11
          Align = alTop
          Caption = 'Filtros'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ExplicitWidth = 25
        end
        object Label2: TLabel
          Left = 18
          Top = 14
          Width = 32
          Height = 13
          Alignment = taRightJustify
          Caption = 'Tabela'
        end
        object Label3: TLabel
          Left = 231
          Top = 14
          Width = 56
          Height = 13
          Alignment = taRightJustify
          Caption = 'Quantidade'
        end
        object Label4: TLabel
          Left = 432
          Top = 14
          Width = 13
          Height = 13
          Caption = 'De'
        end
        object Label7: TLabel
          Left = 522
          Top = 14
          Width = 16
          Height = 13
          Caption = 'at'#233
        end
        object edTabela: TMaskEdit
          Left = 56
          Top = 10
          Width = 161
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 0
          Text = 'EDTABELA'
          OnChange = edTabelaChange
        end
        object edQtde: TEditHw
          Left = 293
          Top = 10
          Width = 121
          Height = 21
          TabOrder = 1
          Text = '                                   0'
          OnChange = edQtdeChange
          Formato = fNumber
          FormatSize = '0.3'
        end
        object eddataIni: TMaskEdit
          Left = 451
          Top = 10
          Width = 65
          Height = 21
          EditMask = '!99/99/0000;1;_'
          MaxLength = 10
          TabOrder = 2
          Text = '  /  /    '
          OnExit = eddataIniExit
        end
        object edDataFim: TMaskEdit
          Left = 544
          Top = 10
          Width = 65
          Height = 21
          EditMask = '!99/99/0000;1;_'
          MaxLength = 10
          TabOrder = 3
          Text = '  /  /    '
          OnExit = edDataFimExit
        end
        object ckTodasEmpresas: TCheckBox
          Left = 615
          Top = 12
          Width = 97
          Height = 17
          Caption = 'Todas empresas'
          TabOrder = 4
          OnClick = ckTodasEmpresasClick
        end
        object BitBtn1: TBitBtn
          Left = 718
          Top = 8
          Width = 75
          Height = 25
          Hint = 'Procurar'
          Caption = 'Procurar'
          TabOrder = 5
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
      end
    end
    object Panel4: TPanel
      Left = 6
      Top = 521
      Width = 803
      Height = 41
      Align = alBottom
      BevelKind = bkTile
      BevelOuter = bvNone
      TabOrder = 2
      object BitBtn2: TBitBtn
        Left = 18
        Top = 6
        Width = 75
        Height = 25
        Hint = 'Voltar'
        Caption = 'Voltar'
        TabOrder = 0
        OnClick = BitBtn2Click
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
