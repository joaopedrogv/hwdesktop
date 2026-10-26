inherited frmCalculoComissao: TfrmCalculoComissao
  Caption = 'Comiss'#245'es de Colaboradores'
  ClientHeight = 545
  ClientWidth = 776
  FormStyle = fsMDIChild
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  ExplicitWidth = 784
  ExplicitHeight = 579
  PixelsPerInch = 96
  TextHeight = 13
  object pg_principal: TPageControl
    Left = 0
    Top = 0
    Width = 776
    Height = 545
    ActivePage = ts_comissao
    Align = alClient
    Style = tsFlatButtons
    TabOrder = 0
    object ts_comissao: TTabSheet
      Caption = 'ts_comissao'
      object pnAll: TPanel
        Left = 0
        Top = 0
        Width = 768
        Height = 514
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object pnTop: TPanel
          Left = 0
          Top = 0
          Width = 768
          Height = 45
          Align = alTop
          BevelKind = bkTile
          BevelOuter = bvNone
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object Label1: TLabel
            Left = 16
            Top = 13
            Width = 69
            Height = 13
            BiDiMode = bdRightToLeft
            Caption = 'Colaborador'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentBiDiMode = False
            ParentFont = False
          end
          object Label2: TLabel
            Left = 353
            Top = 13
            Width = 66
            Height = 13
            BiDiMode = bdRightToLeft
            Caption = 'Data Inicial'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentBiDiMode = False
            ParentFont = False
          end
          object Label3: TLabel
            Left = 504
            Top = 15
            Width = 59
            Height = 13
            BiDiMode = bdRightToLeft
            Caption = 'Data Final'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentBiDiMode = False
            ParentFont = False
          end
          object DBLookupComboBox1: TDBLookupComboBox
            Left = 91
            Top = 10
            Width = 256
            Height = 21
            KeyField = 'COD_VENDEDOR'
            ListField = 'NOME_VENDEDOR'
            ListSource = dtmCalculoComissao.dsColabCom
            TabOrder = 0
          end
          object MaskEdit1: TMaskEdit
            Left = 425
            Top = 10
            Width = 73
            Height = 21
            EditMask = '!99/99/0000;1;_'
            MaxLength = 10
            TabOrder = 1
            Text = '  /  /    '
          end
          object MaskEdit2: TMaskEdit
            Left = 569
            Top = 10
            Width = 73
            Height = 21
            EditMask = '!99/99/0000;1;_'
            MaxLength = 10
            TabOrder = 2
            Text = '  /  /    '
          end
          object BitBtn1: TBitBtn
            Left = 648
            Top = 8
            Width = 83
            Height = 25
            Hint = 'Obter - [COMISS003]'
            Caption = 'Obter'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 3
            OnClick = BitBtn1Click
            Glyph.Data = {
              8A010000424D8A010000000000008A0000002800000010000000100000000100
              08000000000000010000120B0000120B00001500000015000000003100000038
              0000004800000384110006841100068F1600069823002398230006A123000BA1
              310031AB380038AB380040AB380040B6400048B6480050B6480050B6500060CA
              600073CA7300FF00FF00FFFFFF00131313131313131313131313131313131313
              1313131313131313131313131313131313131300020013131313131313131313
              1313130203020013131313131313131313131302040302001313131313131313
              1313130205050302001313131313131313131302080503030200131313131313
              13131302090606060502011313131313131313020B0C0A0A0A02011313131313
              131313020D100F0A020013131313131313131302101111020013131313131313
              131313020E120200131313131313131313131302070200131313131313131313
              1313130002001313131313131313131313131313131313131313131313131313
              1313131313131313131313131313}
          end
        end
        object pnPerfil: TPanel
          Left = 0
          Top = 45
          Width = 768
          Height = 115
          Align = alTop
          BevelKind = bkTile
          BevelOuter = bvNone
          TabOrder = 1
          object DBGrid1: TDBGrid
            Left = 0
            Top = 28
            Width = 764
            Height = 83
            Align = alClient
            DataSource = dtmCalculoComissao.dsPerfCom
            Options = [dgTitles, dgIndicator, dgColumnResize, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'CODIGO_PERFIL'
                Width = 45
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NOME_PERFIL'
                Width = 150
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PERC_PESO'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TIPO_PERFIL'
                Width = 120
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ABRANG_PERFIL'
                Width = 120
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'EM_CIMA_PERFIL'
                Width = 120
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TIPO_SERV_PROD'
                Width = 120
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'FLAG_SERV_PROD'
                Width = 64
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CONTEUDO_FLAG'
                Width = 64
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TABELAS_PERFIL'
                Width = 64
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DATA_CADASTRO'
                Width = 64
                Visible = True
              end>
          end
          object Panel1: TPanel
            Left = 0
            Top = 0
            Width = 764
            Height = 28
            Align = alTop
            BevelOuter = bvNone
            Caption = 'Perfis para o Colaborador'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
          end
        end
        object pnMetas: TPanel
          Left = 0
          Top = 160
          Width = 768
          Height = 115
          Align = alTop
          BevelKind = bkTile
          BevelOuter = bvNone
          TabOrder = 2
          object DBGrid2: TDBGrid
            Left = 0
            Top = 28
            Width = 764
            Height = 83
            Align = alClient
            DataSource = dtmCalculoComissao.dsMetasCom
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'CODIGO_META'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DESCRICAO_META'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VALOR_META'
                Width = 64
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VALOR_META1'
                Width = 64
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'COMISSAO_META'
                Width = 64
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'MES_META'
                Width = 64
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ANO_META'
                Width = 64
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TIPO_META'
                Width = 64
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DATA_CADASTRO'
                Width = 64
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CODIGO_PERFIL'
                Visible = True
              end>
          end
          object Panel3: TPanel
            Left = 0
            Top = 0
            Width = 764
            Height = 28
            Align = alTop
            BevelOuter = bvNone
            Caption = 'Metas'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
          end
        end
        object Panel2: TPanel
          Left = 0
          Top = 275
          Width = 768
          Height = 198
          Align = alClient
          BevelKind = bkTile
          BevelOuter = bvNone
          TabOrder = 3
          object Panel4: TPanel
            Left = 0
            Top = 0
            Width = 764
            Height = 28
            Align = alTop
            BevelOuter = bvNone
            Caption = 'Valores das Comiss'#245'es'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clMaroon
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
          end
          object DBGrid3: TDBGrid
            Left = 0
            Top = 28
            Width = 764
            Height = 166
            Align = alClient
            DataSource = dtmCalculoComissao.dsCalcComissao
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ReadOnly = True
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'CODIGO_PERFIL'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NOME_PERFIL'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VALORLIQMO'
                Width = 64
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VALORLIQPC'
                Width = 64
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VALORLUCROMO'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VALORLUCROPC'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VALORRECDIN'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VALORRECPRAZO'
                Width = 64
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VALORCOMISSPROD'
                Width = 64
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ABRANG_PERFIL'
                Width = 64
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TIPO_SERV_PROD'
                Width = 64
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TIPO_PERFIL'
                Width = 64
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'EM_CIMA_PERFIL'
                Width = 64
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PERCENTUALMETA'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'QTDEOSABERTAS'
                Width = 64
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VALORCOMISSAO'
                Visible = True
              end>
          end
        end
        object pnBotton: TPanel
          Left = 0
          Top = 473
          Width = 768
          Height = 41
          Align = alBottom
          BevelKind = bkTile
          BevelOuter = bvNone
          TabOrder = 4
          object BitBtn10: TBitBtn
            Left = 648
            Top = 6
            Width = 83
            Height = 25
            Hint = 'Sair desta tela'
            Caption = 'Sair'
            ModalResult = 2
            TabOrder = 2
            OnClick = BitBtn10Click
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
          object BitBtn2: TBitBtn
            Left = 287
            Top = 6
            Width = 93
            Height = 25
            Hint = 'Montar Excel - [COMISS004]'
            Caption = 'Imprimir'
            TabOrder = 0
            OnClick = BitBtn2Click
            Glyph.Data = {
              26030000424D2603000000000000260200002800000010000000100000000100
              08000000000000010000030F0000030F00007C0000007C0000002A0B11002A11
              11003111110031161600381C1C00401C1C002323230031313100603138006A31
              3800313838003838380040383800383140007331400038384000484848005848
              480060484800505048005850480060504800504050006A405000604850006A48
              5000505050006A50500073505000734858006A50580073505800845058005858
              5800605858006A585800607B58008F5060008F58600058606000606060006A60
              6000846060008F60600098606000606A60008F6A600073FF60006A606A007360
              6A007B606A00AB606A00586A6A006A6A6A008F6A6A00986A6A00A16A6A00846A
              73006A737300737373007B73730084737300AB737300B67373006A7B7300AB73
              7B00B6737B006A7B7B00737B7B007B7B7B00847B7B0073847B0098608400736A
              8400737B84007B7B8400987B8400738484007B848400848484008F848400A18F
              84008F608F008F8F8F00988F8F00A18F8F0098849800848F9800AB8F98008F98
              98009898980098A1A100A1A1A100ABA1AB00A1ABAB00ABABAB00ABCAAB00B6B6
              B600C0B6B600B6B6C000B6C0C000C0C0C000CAC0C000C0CAC000CAC0CA00C0CA
              CA00CACACA00D4CACA00CAD4D400D4D4D400D4E0D400E0CAE000D4E0E000E0E0
              E000EAE0E000E0EAE000E0EAEA00EAEAEA00F4EAEA00EAF4F400F4F4F400FF00
              FF00F4FFFF00FFFFFF0079797979797979797979797979797979797979797953
              3B3B3B3B3B5379797979797979790075785E615C7B61001A79797979790B0075
              786266617B63000B7979791A07070770693A3B5C75640707001328070C0B074F
              5A5B5C5C534B070F0A000B304E4D474E453B2D40444E495C2F000B4F5F5A3C1E
              1B1917181C1D520E5C00105A6C1F202B3E4241413F26250E600B3B5C65080907
              000000000007090E630B3B5C650007536D6D6D6D6D530602651079535B46235F
              7B7B78787878183D5B7979797979795F7B7B785353537979797979797979795F
              7A7B78536D537979797979797979795F7878785353797979797979797979795F
              53535353797979797979}
          end
          object BitBtn3: TBitBtn
            Left = 16
            Top = 6
            Width = 93
            Height = 25
            Caption = 'Enviar Folha'
            Enabled = False
            TabOrder = 1
            Visible = False
            Glyph.Data = {
              36050000424D3605000000000000360400002800000010000000100000000100
              08000000000000010000320B0000320B0000000100000001000000730800007B
              0800087B08000884080008841000088C10000894100008A51800108C2100109C
              210018AD2900EFA54A0031C64A00C6846B0042D66B00BD8C7300CE947300EFB5
              7300FFC67300BD847B00C6947B00CE9C7B0052D67B00B5848400B58C8400CE9C
              8400B5948C005AE78C00C6A59400F7CE9400C6A59C00F7CE9C00F7D69C00C6AD
              A500CEADA500F7D6A500CEB5AD00D6B5AD00C6BDAD00F7D6AD00F7DEAD00D6BD
              B500DEBDB500DEC6B500E7C6B500EFC6B500EFCEB500F7D6B500F7DEB500FFDE
              B500EFCEBD00F7DEBD00E7DEC600F7DEC600F7E7C600E7CECE00E7D6CE00F7E7
              CE00E7D6D600F7E7D600FFE7D600FFEFD600FFEFDE00FFEFE700FFF7E700FFF7
              EF00FFF7F700FFFFF700FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00444417171717
              1717171717171717174444441E3D36333027231F1D001D20174444441E3D3935
              332F2308090C001F17444444213F3B393504070A0C0E1B001744444421403B39
              020705040816001D1744444424433F3B050535332F001F1F174444442545413F
              05393635332723231744444429454241023B393635332F271744444429454542
              3F3F3B3935333030174444442A454545423F3E3B3935352F174444442B454545
              45423F3E3E3D3426174444442C454545454541413B1C1A18174444442C454545
              45454543370F110B0D444444324545454545454538141210444444442C424141
              4141414137141944444444442C2E2E2E2E2C2C2E291344444444}
          end
          object bt_detalhes: TBitBtn
            Left = 386
            Top = 6
            Width = 90
            Height = 25
            Caption = 'Detalhes'
            TabOrder = 3
            OnClick = bt_detalhesClick
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
          end
        end
      end
    end
    object ts_detalhes: TTabSheet
      Caption = 'ts_detalhes'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object ScrollBox1: TScrollBox
        Left = 0
        Top = 0
        Width = 768
        Height = 514
        Align = alClient
        BevelInner = bvNone
        BevelOuter = bvNone
        BorderStyle = bsNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Padding.Left = 6
        Padding.Right = 6
        Padding.Bottom = 6
        ParentFont = False
        TabOrder = 0
        object Panel5: TPanel
          Left = 6
          Top = 0
          Width = 756
          Height = 508
          Align = alClient
          BevelKind = bkTile
          BevelOuter = bvNone
          BorderWidth = 3
          TabOrder = 0
          object Splitter1: TSplitter
            Left = 3
            Top = 253
            Width = 746
            Height = 3
            Cursor = crVSplit
            Align = alTop
            ExplicitWidth = 248
          end
          object Panel6: TPanel
            Left = 3
            Top = 3
            Width = 746
            Height = 153
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 0
            object Label4: TLabel
              Left = 89
              Top = 8
              Width = 24
              Height = 13
              Alignment = taRightJustify
              Caption = 'Perfil'
            end
            object Label5: TLabel
              Left = 7
              Top = 54
              Width = 106
              Height = 13
              Alignment = taRightJustify
              Caption = 'Valor Liquido Produtos'
            end
            object Label6: TLabel
              Left = 41
              Top = 77
              Width = 72
              Height = 13
              Alignment = taRightJustify
              Caption = 'Lucro Produtos'
            end
            object Label7: TLabel
              Left = 27
              Top = 100
              Width = 86
              Height = 13
              Alignment = taRightJustify
              Caption = 'Comiss'#227'o Produto'
            end
            object Label8: TLabel
              Left = 26
              Top = 31
              Width = 87
              Height = 13
              Alignment = taRightJustify
              Caption = 'Peso ou Individual'
            end
            object Label9: TLabel
              Left = 520
              Top = 8
              Width = 91
              Height = 13
              Alignment = taRightJustify
              Caption = 'Produto ou Servi'#231'o'
            end
            object Label10: TLabel
              Left = 250
              Top = 54
              Width = 87
              Height = 13
              Alignment = taRightJustify
              Caption = 'Valor Liquido M.O.'
            end
            object Label11: TLabel
              Left = 288
              Top = 77
              Width = 49
              Height = 13
              Alignment = taRightJustify
              Caption = 'Lucro M.O'
            end
            object Label12: TLabel
              Left = 472
              Top = 77
              Width = 139
              Height = 13
              Alignment = taRightJustify
              Caption = 'Recebimento Cheque/Outros'
            end
            object Label13: TLabel
              Left = 259
              Top = 100
              Width = 78
              Height = 13
              Alignment = taRightJustify
              Caption = 'Percentual Meta'
            end
            object DBText1: TDBText
              Left = 119
              Top = 8
              Width = 218
              Height = 17
              DataField = 'NOME_PERFIL'
              DataSource = dtmCalculoComissao.dsCalcComissao
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBText2: TDBText
              Left = 119
              Top = 54
              Width = 125
              Height = 17
              Cursor = crHandPoint
              DataField = 'VALORLIQPC'
              DataSource = dtmCalculoComissao.dsCalcComissao
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 64
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              OnClick = DBText2Click
            end
            object DBText3: TDBText
              Left = 119
              Top = 77
              Width = 125
              Height = 17
              Cursor = crHandPoint
              DataField = 'VALORLUCROPC'
              DataSource = dtmCalculoComissao.dsCalcComissao
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 64
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              OnClick = DBText2Click
            end
            object DBText4: TDBText
              Left = 343
              Top = 54
              Width = 125
              Height = 17
              Cursor = crHandPoint
              DataField = 'VALORLIQMO'
              DataSource = dtmCalculoComissao.dsCalcComissao
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 16384
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              OnClick = DBText2Click
            end
            object DBText5: TDBText
              Left = 343
              Top = 77
              Width = 125
              Height = 17
              Cursor = crHandPoint
              DataField = 'VALORLUCROMO'
              DataSource = dtmCalculoComissao.dsCalcComissao
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 16384
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              OnClick = DBText2Click
            end
            object DBText6: TDBText
              Left = 617
              Top = 54
              Width = 125
              Height = 17
              Cursor = crHandPoint
              DataField = 'VALORRECDIN'
              DataSource = dtmCalculoComissao.dsCalcComissao
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 117
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              OnClick = DBText2Click
            end
            object DBText7: TDBText
              Left = 617
              Top = 77
              Width = 125
              Height = 17
              Cursor = crHandPoint
              DataField = 'VALORRECPRAZO'
              DataSource = dtmCalculoComissao.dsCalcComissao
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 117
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              OnClick = DBText2Click
            end
            object DBText8: TDBText
              Left = 119
              Top = 100
              Width = 125
              Height = 17
              Cursor = crHandPoint
              DataField = 'VALORCOMISSPROD'
              DataSource = dtmCalculoComissao.dsCalcComissao
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 64
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              OnClick = DBText2Click
            end
            object DBText9: TDBText
              Left = 119
              Top = 31
              Width = 125
              Height = 17
              Cursor = crHandPoint
              DataField = 'ABRANG_PERFIL'
              DataSource = dtmCalculoComissao.dsCalcComissao
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBText10: TDBText
              Left = 617
              Top = 8
              Width = 125
              Height = 17
              DataField = 'TIPO_SERV_PROD'
              DataSource = dtmCalculoComissao.dsCalcComissao
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBText11: TDBText
              Left = 343
              Top = 31
              Width = 125
              Height = 17
              DataField = 'EM_CIMA_PERFIL'
              DataSource = dtmCalculoComissao.dsCalcComissao
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBText12: TDBText
              Left = 343
              Top = 100
              Width = 125
              Height = 17
              DataField = 'PERCENTUALMETA'
              DataSource = dtmCalculoComissao.dsCalcComissao
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label14: TLabel
              Left = 284
              Top = 31
              Width = 53
              Height = 13
              Alignment = taRightJustify
              Caption = 'Em cima de'
            end
            object Label15: TLabel
              Left = 507
              Top = 54
              Width = 104
              Height = 13
              Alignment = taRightJustify
              Caption = 'Recebimento Dinheiro'
            end
            object Label16: TLabel
              Left = 541
              Top = 100
              Width = 70
              Height = 13
              Alignment = taRightJustify
              Caption = 'Valor comiss'#227'o'
            end
            object DBText13: TDBText
              Left = 617
              Top = 31
              Width = 125
              Height = 17
              DataField = 'QTDEOSABERTAS'
              DataSource = dtmCalculoComissao.dsCalcComissao
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBText14: TDBText
              Left = 617
              Top = 100
              Width = 125
              Height = 17
              Cursor = crHandPoint
              DataField = 'VALORCOMISSAO'
              DataSource = dtmCalculoComissao.dsCalcComissao
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              OnClick = DBText2Click
            end
            object Label17: TLabel
              Left = 521
              Top = 31
              Width = 90
              Height = 13
              Alignment = taRightJustify
              Caption = 'Qtde O.S. Abertas'
            end
            object DBText15: TDBText
              Left = 343
              Top = 8
              Width = 154
              Height = 17
              DataField = 'TIPO_PERFIL'
              DataSource = dtmCalculoComissao.dsCalcComissao
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Panel7: TPanel
              Left = 0
              Top = 119
              Width = 746
              Height = 34
              Align = alBottom
              BevelOuter = bvNone
              Padding.Left = 7
              Padding.Top = 2
              Padding.Right = 7
              Padding.Bottom = 5
              TabOrder = 0
              object Label18: TLabel
                Left = 7
                Top = 2
                Width = 657
                Height = 27
                Align = alClient
                AutoSize = False
                Caption = '* Clique nos campos coloridos acima para ver mais detalhes'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clOlive
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                Layout = tlCenter
                ExplicitLeft = 0
                ExplicitTop = 127
                ExplicitWidth = 746
                ExplicitHeight = 25
              end
              object BitBtn4: TBitBtn
                Left = 664
                Top = 2
                Width = 75
                Height = 27
                Align = alRight
                Caption = 'Voltar'
                TabOrder = 0
                OnClick = BitBtn4Click
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
          object Panel8: TPanel
            Left = 3
            Top = 256
            Width = 746
            Height = 245
            Align = alClient
            BevelOuter = bvNone
            Caption = 'Sem registros '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            object grid_detalhes: TDBGrid
              Left = 0
              Top = 0
              Width = 746
              Height = 245
              Align = alClient
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -12
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
            end
          end
          object ListBox1: TListBox
            Left = 3
            Top = 156
            Width = 746
            Height = 97
            Align = alTop
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Courier New'
            Font.Style = []
            ItemHeight = 16
            Items.Strings = (
              'Base de calculo: 125,30'
              'Valor final    :  33,14       ')
            ParentFont = False
            TabOrder = 2
          end
        end
      end
    end
  end
end
