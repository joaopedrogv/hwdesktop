inherited frmColunasExcel: TfrmColunasExcel
  Caption = 'Exporta'#231#227'o de dados para excel'
  ClientHeight = 560
  ClientWidth = 803
  Position = poMainFormCenter
  OnClose = FormClose
  ExplicitWidth = 811
  ExplicitHeight = 594
  PixelsPerInch = 96
  TextHeight = 13
  object pnPrincipal: TPanel
    Left = 0
    Top = 0
    Width = 803
    Height = 560
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 6
    TabOrder = 0
    object Splitter1: TSplitter
      Left = 377
      Top = 47
      Height = 507
      ExplicitLeft = 400
      ExplicitTop = 232
      ExplicitHeight = 100
    end
    object GroupBox2: TGroupBox
      Left = 6
      Top = 47
      Width = 371
      Height = 507
      Align = alLeft
      Caption = 'Colunas'
      TabOrder = 0
      object Panel3: TPanel
        Left = 2
        Top = 448
        Width = 367
        Height = 57
        Align = alBottom
        BorderWidth = 6
        TabOrder = 0
        object GroupBox4: TGroupBox
          Left = 7
          Top = 7
          Width = 353
          Height = 38
          Align = alTop
          Caption = '[F3] - Localizar'
          TabOrder = 0
          object Edit1: TEdit
            Left = 2
            Top = 15
            Width = 349
            Height = 21
            Align = alClient
            TabOrder = 0
            OnChange = Edit1Change
            OnEnter = Edit1Enter
            OnExit = Edit1Exit
            OnKeyDown = Edit1KeyDown
          end
        end
      end
      object DBGrid1: TDBGrid
        Left = 2
        Top = 15
        Width = 367
        Height = 409
        Align = alClient
        DataSource = DataSource1
        Options = [dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDrawColumnCell = DBGrid1DrawColumnCell
        OnDblClick = DBGrid1DblClick
        OnKeyDown = DBGrid1KeyDown
        Columns = <
          item
            Expanded = False
            FieldName = 'DISPLAY'
            Title.Caption = 'Colunas'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ordem'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'EXCEL_FORMAT'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'visivel'
            Visible = False
          end>
      end
      object Panel8: TPanel
        Left = 2
        Top = 424
        Width = 367
        Height = 24
        Align = alBottom
        BevelKind = bkFlat
        BevelOuter = bvNone
        Caption = 'Colunas selecionadas na cor azul'
        Color = clActiveCaption
        ParentBackground = False
        TabOrder = 2
      end
    end
    object Panel1: TPanel
      Left = 6
      Top = 6
      Width = 791
      Height = 41
      Align = alTop
      BevelKind = bkTile
      BevelOuter = bvNone
      Caption = 'Cadastro de Clientes'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
    object Panel2: TPanel
      Left = 380
      Top = 47
      Width = 417
      Height = 507
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 2
      object Splitter2: TSplitter
        Left = 0
        Top = 282
        Width = 417
        Height = 3
        Cursor = crVSplit
        Align = alBottom
        ExplicitTop = 0
        ExplicitWidth = 285
      end
      object GroupBox1: TGroupBox
        Left = 0
        Top = 78
        Width = 417
        Height = 204
        Align = alClient
        Caption = 'Posi'#231#227'o das colunas'
        TabOrder = 0
        object Panel5: TPanel
          Left = 2
          Top = 15
          Width = 413
          Height = 187
          Align = alClient
          BevelOuter = bvNone
          BorderWidth = 6
          TabOrder = 0
          object Panel6: TPanel
            Left = 6
            Top = 6
            Width = 401
            Height = 150
            Align = alClient
            BevelKind = bkTile
            BevelOuter = bvNone
            BorderWidth = 6
            TabOrder = 0
            object SpeedButton13: TSpeedButton
              Left = 6
              Top = 74
              Width = 385
              Height = 33
              Align = alBottom
              Caption = 'Ordenar'
              Glyph.Data = {
                36030000424D3603000000000000360000002800000010000000100000000100
                18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FF6C2A006828005D24005320004F1F004F
                1F004F1F004F1F004F1F004F1F004F1F00401800FF00FFFF00FFFF00FF973B00
                BB4900B44600AA4200A03F00993C00973B00973B00993C00993C00973B009E3E
                007B3000401800FF00FFFF00FFB84800E35900D45300CC5000C54D00BB4900B1
                4500AF4400AF4400AF4400AF4400B647009E3E004F1F00FF00FFFF00FFC74E00
                F05E00E15800D15200C74E00C04B00B64700AF4400AA4200A74100A54100AF44
                00993C00511F00FF00FFFF00FFCA4F00FF6802F66000E35900D45300CA4F00C2
                4C00BB4900B14500AA4200A74100AF4400993C004F1F00FF00FFFF00FFCA4F00
                FF7A16FF6C06FFFFFFFFFFFFD75400CF5100C74E00BD4A00FFFFFFFFFFFFAF44
                00993C004F1F00FF00FFFF00FFCA4F00FF9035FF750FFFFFFFFFFFFFFFFFFFDC
                5600D45300FFFFFFFFFFFFFFFFFFB647009C3D00511F00FF00FFFF00FFCA4F00
                FF9F4EFF7D19FF6A04FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC24C00C04B
                00A34000592300FF00FFFF00FFCA4F00FFA65AFF8221FF6E08FF6601FEFEFEFF
                FFFFFFFFFFFFFFFFD95500CF5100CC5000B145006A2900FF00FFFF00FFCA4F00
                FFAD67FF8A2DFF7813FF730DFF6903FFFFFFFFFFFFEE5D00E65A00DE5700D955
                00BD4A00792F00FF00FFFF00FFCA4F00FFB676FF9741FF7E1BFF7A16FF720CFF
                6B05FF6A04FF6400F05E00E95B00E65A00C74E00873500FF00FFFF00FFCA4F00
                FFBB7FFFB472FFA456FF9A46FF9035FF8424FF7A16FF6B05F86200F05E00F05E
                00D95500993C00FF00FFFF00FFCA4F00FFA558FFBB7FFFBD83FFB676FFAC65FF
                9D4AFF8728FF740EFF6601F86200FB6300E35900A54100FF00FFFF00FFFF00FF
                EE5D00FF700AFF720CFF700AFF6C06FF6601EE5D00DE5700D15200CC5000CF51
                00B84800FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
              OnClick = SpeedButton13Click
              ExplicitTop = 146
              ExplicitWidth = 111
            end
            object SpeedButton14: TSpeedButton
              Left = 6
              Top = 107
              Width = 385
              Height = 33
              Align = alBottom
              Caption = 'Ordenar'
              Glyph.Data = {
                36030000424D3603000000000000360000002800000010000000100000000100
                18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FF6C2A006828005D24005320004F1F004F
                1F004F1F004F1F004F1F004F1F004F1F00401800FF00FFFF00FFFF00FF973B00
                BB4900B44600AA4200A03F00993C00973B00973B00993C00993C00973B009E3E
                007B3000401800FF00FFFF00FFB84800E35900D45300CC5000C54D00BB4900B1
                4500AF4400AF4400AF4400AF4400B647009E3E004F1F00FF00FFFF00FFC74E00
                F05E00E15800D15200C74E00C04B00B64700AF4400AA4200A74100A54100AF44
                00993C00511F00FF00FFFF00FFCA4F00FF6802F66000E35900D45300CA4F00FF
                FFFFFFFFFFB14500AA4200A74100AF4400993C004F1F00FF00FFFF00FFCA4F00
                FF7A16FF6C06F66000E35900FEFEFEFFFFFFFFFFFFFFFFFFB44600AC4300AF44
                00993C004F1F00FF00FFFF00FFCA4F00FF9035FF750FFF6601FEFEFEFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFB84800B647009C3D00511F00FF00FFFF00FFCA4F00
                FF9F4EFF7D19FFFFFFFFFFFFFFFFFFE65A00DE5700FFFFFFFFFFFFFFFFFFC04B
                00A34000592300FF00FFFF00FFCA4F00FFA65AFF8221FFFFFFFFFFFFF05E00EE
                5D00EB5C00E15800FFFFFFFFFFFFCC5000B145006A2900FF00FFFF00FFCA4F00
                FFAD67FF8A2DFF7813FF730DFF6903FF6400F86200EE5D00E65A00DE5700D955
                00BD4A00792F00FF00FFFF00FFCA4F00FFB676FF9741FF7E1BFF7A16FF720CFF
                6B05FF6A04FF6400F05E00E95B00E65A00C74E00873500FF00FFFF00FFCA4F00
                FFBB7FFFB472FFA456FF9A46FF9035FF8424FF7A16FF6B05F86200F05E00F05E
                00D95500993C00FF00FFFF00FFCA4F00FFA558FFBB7FFFBD83FFB676FFAC65FF
                9D4AFF8728FF740EFF6601F86200FB6300E35900A54100FF00FFFF00FFFF00FF
                EE5D00FF700AFF720CFF700AFF6C06FF6601EE5D00DE5700D15200CC5000CF51
                00B84800FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
              OnClick = SpeedButton14Click
              ExplicitTop = 177
              ExplicitWidth = 111
            end
            object Panel9: TPanel
              Left = 6
              Top = 6
              Width = 385
              Height = 68
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 0
              object btNegrito: TSpeedButton
                Left = 3
                Top = 23
                Width = 105
                Height = 32
                Caption = 'Negrito'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Times New Roman'
                Font.Style = []
                ParentFont = False
                OnClick = btNegritoClick
              end
              object btCorFonte: TSpeedButton
                Left = 140
                Top = 23
                Width = 105
                Height = 32
                Caption = 'Cor Fonte'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Times New Roman'
                Font.Style = [fsBold]
                ParentFont = False
                OnClick = btCorFonteClick
              end
              object pnCorFundo: TPanel
                Left = 273
                Top = 23
                Width = 105
                Height = 32
                Cursor = crHandPoint
                BevelKind = bkTile
                BevelOuter = bvNone
                Caption = 'Cor Fundo'
                Color = clWhite
                Ctl3D = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Times New Roman'
                Font.Style = [fsBold]
                ParentBackground = False
                ParentCtl3D = False
                ParentFont = False
                TabOrder = 0
                OnClick = pnCorFundoClick
              end
              object ckPersonalizar: TCheckBox
                Left = 5
                Top = 0
                Width = 81
                Height = 17
                Caption = 'Personalizar'
                Color = clBtnFace
                ParentColor = False
                TabOrder = 1
                OnClick = ckPersonalizarClick
              end
            end
          end
          object BitBtn1: TBitBtn
            Left = 6
            Top = 156
            Width = 401
            Height = 25
            Align = alBottom
            Caption = 'Salvar modelo'
            TabOrder = 1
            OnClick = BitBtn1Click
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
        end
      end
      object Panel4: TPanel
        Left = 0
        Top = 466
        Width = 417
        Height = 41
        Align = alBottom
        BevelKind = bkTile
        BevelOuter = bvNone
        TabOrder = 1
        object BitBtn2: TBitBtn
          Left = 128
          Top = 6
          Width = 75
          Height = 25
          Caption = 'Cancelar'
          TabOrder = 0
          OnClick = BitBtn2Click
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
        object BitBtn3: TBitBtn
          Left = 209
          Top = 6
          Width = 75
          Height = 25
          Caption = 'Exportar'
          TabOrder = 1
          OnClick = BitBtn3Click
          Glyph.Data = {
            8E020000424D8E020000000000008E0100002800000010000000100000000100
            08000000000000010000120B0000120B0000560000005600000000000000FFFF
            FF00FF00FF00A5696A0095655F009D6B620098686000A36F6400FFFBFA00AD78
            6900A7746600BB7F6A00B47E6B00BF877000BA836D00BB704F00C48C7200D397
            7800CA917400C2805C00D0906B00D59A7900CE957600F4EBE600FEF4ED00FFFC
            FA00FCF4EE00FAEDE100FCF4ED00FEFCFA00EF993800E5A55F00F2D5B500F6E1
            CA00F8E7D400F7E6D400F7E7D500F8EDE100E2A35B00F0D0A900F6E1C900F4E1
            CA00FAEDDE00FAEEE000EECB9E00F4D5AD00F0D1AA00F2D7B400F2D7B500F4DD
            C000F3DCBF00F8E9D500FAEFE000EFCA9600F0CF9F00FCE7C900E3D3BB00FCEB
            D300FEEED400FBE5C000B7AD9C00FFF4E100FCF6EB00FFFBEE00FFFFFB00FFFF
            FC00006A0000016C0100016B01000A760A000D780D001C831C0023892300469F
            46004AA14A004DA34D004EA44E005FAD5F0060AD60006AB46A0078BB7800B4DA
            B400BBDDBB00EEF7EE00FAFCFA00F8F8FE000202020202424242424242424242
            424204030303034201010101010101010142063B2D3635420101010101010101
            0142053720272C4201504247544F424B0142073A31302E420101514346424F01
            01420A3D21322F420101014C424554010142093F2429324201014D424A434853
            01420C40252328420149424E0152444801420E011A1B33420101010101010101
            01420D0108182B4201010101010101010142100101191C424242424242424242
            424212010101191C2A2239383C030202020216010101011D3E34030303030202
            0202110101010101411703261E0F020202021501010101010155031F13020202
            02021414141414141414030B020202020202}
        end
      end
      object GroupBox3: TGroupBox
        Left = 0
        Top = 285
        Width = 417
        Height = 181
        Align = alBottom
        Caption = 
          'Modelos salvos - Bot'#227'o direito sobre o quadro abaixo para mais o' +
          'p'#231#245'es'
        TabOrder = 2
        object ListBox1: TListBox
          AlignWithMargins = True
          Left = 5
          Top = 18
          Width = 407
          Height = 158
          Style = lbOwnerDrawFixed
          Align = alClient
          Ctl3D = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemHeight = 18
          Items.Strings = (
            'EXPORTACAO 1'
            'EXPORTACAO 2'
            'EXPORTACAO 3'
            'EXPORTACAO 4')
          ParentCtl3D = False
          ParentFont = False
          PopupMenu = PopupMenu1
          TabOrder = 0
          OnDblClick = ListBox1DblClick
          OnKeyDown = ListBox1KeyDown
        end
      end
      object Panel7: TPanel
        Left = 0
        Top = 0
        Width = 417
        Height = 78
        Align = alTop
        BevelOuter = bvNone
        BorderWidth = 6
        TabOrder = 3
        object SpeedButton1: TSpeedButton
          Left = 6
          Top = 6
          Width = 405
          Height = 22
          Hint = 'Selecionar todos'
          Align = alTop
          Caption = '[F2] - Selecionar todos'
          OnClick = SpeedButton1Click
          ExplicitLeft = 10
          ExplicitWidth = 353
        end
        object SpeedButton2: TSpeedButton
          Left = 6
          Top = 28
          Width = 405
          Height = 22
          Align = alTop
          Caption = '[F4] - DesSelecionar todos'
          OnClick = SpeedButton2Click
          ExplicitLeft = 10
          ExplicitTop = 35
          ExplicitWidth = 353
        end
        object SpeedButton3: TSpeedButton
          Left = 6
          Top = 50
          Width = 405
          Height = 22
          Align = alTop
          Caption = '[F6] - Inverter sele'#231#227'o'
          OnClick = SpeedButton3Click
          ExplicitLeft = 10
          ExplicitTop = 57
          ExplicitWidth = 353
        end
      end
    end
  end
  object DataSource1: TDataSource
    AutoEdit = False
    Left = 336
    Top = 72
  end
  object FontDialog1: TFontDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Left = 248
    Top = 8
  end
  object ColorDialog1: TColorDialog
    Left = 216
    Top = 128
  end
  object PopupMenu1: TPopupMenu
    Left = 392
    Top = 288
    object AplicarEnter1: TMenuItem
      Caption = 'Aplicar'
      OnClick = AplicarEnter1Click
    end
    object Removermodelo1: TMenuItem
      Caption = 'Remover modelo - [Delete]'
      OnClick = Removermodelo1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object Exportarparaexcel1: TMenuItem
      Caption = 'Exportar direto - [Duplo clique]'
      OnClick = Exportarparaexcel1Click
    end
  end
end
