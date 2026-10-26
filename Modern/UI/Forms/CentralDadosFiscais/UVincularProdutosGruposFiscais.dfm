inherited FrmVincularProdutosGruposFiscais: TFrmVincularProdutosGruposFiscais
  Left = 0
  Top = 0
  Caption = 'FrmVincularProdutosGruposFiscais'
  ClientHeight = 604
  ClientWidth = 895
  Padding.Left = 3
  Padding.Top = 3
  Padding.Right = 3
  Padding.Bottom = 3
  Position = poScreenCenter
  OnClose = FormClose
  ExplicitWidth = 903
  ExplicitHeight = 638
  PixelsPerInch = 96
  TextHeight = 13
  object pnBottom: TPanel
    Left = 3
    Top = 560
    Width = 889
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object btSair: TBitBtn
      AlignWithMargins = True
      Left = 6
      Top = 8
      Width = 79
      Height = 25
      Margins.Left = 6
      Margins.Top = 8
      Margins.Right = 6
      Margins.Bottom = 8
      Align = alLeft
      Caption = ' Sair'
      TabOrder = 0
      OnClick = btSairClick
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
  object pnTop: TPanel
    Left = 3
    Top = 3
    Width = 889
    Height = 22
    Align = alTop
    AutoSize = True
    BevelOuter = bvNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    object Label1: TLabel
      AlignWithMargins = True
      Left = 9
      Top = 3
      Width = 591
      Height = 16
      Margins.Left = 9
      Margins.Right = 9
      Align = alTop
      Alignment = taCenter
      Caption = 
        'Configurar v'#237'nculos dos Produtos/NCM'#39's com os Grupos Fiscais de ' +
        'Anexo da LC 214 de 2025'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
    end
  end
  object pnContent: TPanel
    Left = 3
    Top = 25
    Width = 889
    Height = 447
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object Splitter1: TSplitter
      Left = 0
      Top = 211
      Width = 889
      Height = 3
      Cursor = crVSplit
      Align = alBottom
      Visible = False
      ExplicitTop = 67
      ExplicitWidth = 390
    end
    object pnNCM: TPanel
      Left = 0
      Top = 33
      Width = 889
      Height = 178
      Align = alClient
      BevelEdges = [beBottom]
      BevelKind = bkTile
      BevelOuter = bvNone
      TabOrder = 0
      inline DbGridNcmsGrupoFiscalVincularFrame1: TDbGridNcmsGrupoFiscalVincularFrame
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 883
        Height = 145
        Align = alClient
        TabOrder = 0
        TabStop = True
        ExplicitLeft = 3
        ExplicitTop = 3
        ExplicitWidth = 883
        ExplicitHeight = 145
        inherited SplitterNcms: TSplitter
          Height = 145
          ExplicitHeight = 227
        end
        inherited pnNcm: TPanel
          Height = 145
          ExplicitHeight = 145
          inherited gridNcm: TDBGridFrame
            Height = 139
            ExplicitHeight = 139
            inherited DBGrid: TDBGrid
              Height = 111
            end
          end
        end
        inherited pnRaiz: TPanel
          Width = 583
          Height = 145
          ExplicitWidth = 583
          ExplicitHeight = 145
          inherited gridRaiz: TDBGrid
            Width = 448
            Height = 139
          end
          inherited pnAnexos: TPanel
            Height = 145
            ExplicitHeight = 145
            inherited gridAnexos: TDBGrid
              Height = 139
            end
          end
        end
      end
      object pnLinksNCM: TPanel
        Left = 0
        Top = 151
        Width = 889
        Height = 25
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
        object linkVincularUsandoNCM: TLabel
          AlignWithMargins = True
          Left = 18
          Top = 0
          Width = 225
          Height = 13
          Cursor = crHandPoint
          Margins.Left = 18
          Margins.Top = 0
          Margins.Right = 9
          Margins.Bottom = 0
          Align = alLeft
          Caption = 'Vincular NCM'#39's ao Grupo Fiscal do Anexo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlCenter
        end
        object linkVerProdutosPorNCM: TLabel
          AlignWithMargins = True
          Left = 261
          Top = 0
          Width = 117
          Height = 13
          Cursor = crHandPoint
          Margins.Left = 9
          Margins.Top = 0
          Margins.Right = 9
          Margins.Bottom = 0
          Align = alLeft
          Caption = 'Ver Produtos do NCM'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlCenter
          OnClick = linkVerProdutosPorNCMClick
        end
        object linkVerTodososProdutos: TLabel
          AlignWithMargins = True
          Left = 396
          Top = 0
          Width = 124
          Height = 13
          Cursor = crHandPoint
          Margins.Left = 9
          Margins.Top = 0
          Margins.Right = 9
          Margins.Bottom = 0
          Align = alLeft
          Caption = 'Ver todos os Produtos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlCenter
          OnClick = linkVerTodososProdutosClick
        end
      end
    end
    object pnParams: TPanel
      Left = 0
      Top = 0
      Width = 889
      Height = 33
      Align = alTop
      BevelEdges = [beTop, beBottom]
      BevelKind = bkTile
      BevelOuter = bvNone
      BorderWidth = 1
      TabOrder = 1
      object Label3: TLabel
        AlignWithMargins = True
        Left = 620
        Top = 4
        Width = 133
        Height = 13
        Align = alLeft
        Caption = 'Tipo de tributo selecionado:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Layout = tlCenter
      end
      object lbTipoTributo: TLabel
        AlignWithMargins = True
        Left = 759
        Top = 4
        Width = 140
        Height = 13
        Align = alLeft
        Caption = 'IBSCBS Imposto Seletivo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
      end
      object lbTipoVinculo: TLabel
        AlignWithMargins = True
        Left = 7
        Top = 4
        Width = 501
        Height = 13
        Margins.Left = 6
        Align = alLeft
        Caption = 
          'Produtos compativeis com 1 anexo apenas. Sem v'#237'nculo ou menor qu' +
          'e a data de revis'#227'o:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
      end
      object edDataRevisao: TMaskEdit
        AlignWithMargins = True
        Left = 514
        Top = 5
        Width = 100
        Height = 19
        Margins.Top = 4
        Margins.Bottom = 4
        Align = alLeft
        EditMask = '!99/99/0000 00:00;1;_'
        MaxLength = 16
        TabOrder = 0
        Text = '  /  /       :  '
        OnExit = edDataRevisaoExit
        ExplicitHeight = 21
      end
    end
    object pnProdutos: TPanel
      Left = 0
      Top = 214
      Width = 889
      Height = 233
      Align = alBottom
      BevelEdges = [beBottom]
      BevelKind = bkTile
      BevelOuter = bvNone
      TabOrder = 2
      Visible = False
      inline DBGridProdutosGrupoFiscalVincularFrame1: TDBGridProdutosGrupoFiscalVincularFrame
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 883
        Height = 200
        Align = alClient
        TabOrder = 0
        TabStop = True
        ExplicitLeft = 3
        ExplicitTop = 3
        ExplicitWidth = 883
        ExplicitHeight = 200
        inherited gridProdutos: TDBGridFrame
          Width = 877
          Height = 194
          ExplicitWidth = 877
          ExplicitHeight = 194
          inherited DBGrid: TDBGrid
            Width = 877
            Height = 166
          end
          inherited pnBtns: TPanel
            Width = 877
            ExplicitWidth = 877
          end
        end
      end
      object pnLinksProdutos: TPanel
        Left = 0
        Top = 206
        Width = 889
        Height = 25
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
        object linkVincularProdutos: TLabel
          AlignWithMargins = True
          Left = 18
          Top = 0
          Width = 246
          Height = 13
          Cursor = crHandPoint
          Margins.Left = 18
          Margins.Top = 0
          Margins.Right = 9
          Margins.Bottom = 0
          Align = alLeft
          Caption = 'Vincular Produtos ao Grupo Fiscal do Anexo.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlCenter
        end
        object linkVerPorNCM: TLabel
          AlignWithMargins = True
          Left = 282
          Top = 0
          Width = 68
          Height = 13
          Cursor = crHandPoint
          Margins.Left = 9
          Margins.Top = 0
          Margins.Right = 9
          Margins.Bottom = 0
          Align = alLeft
          Caption = 'Ver por NCM'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlCenter
          OnClick = linkVerPorNCMClick
        end
      end
    end
  end
  object pnGrupoFiscal: TPanel
    Left = 3
    Top = 472
    Width = 889
    Height = 88
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 3
    Visible = False
    object Label2: TLabel
      Left = 118
      Top = 21
      Width = 246
      Height = 13
      Caption = 'Selecione aqui o Grupo fiscal para continuar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btSelecaoContinuar: TBitBtn
      AlignWithMargins = True
      Left = 527
      Top = 38
      Width = 79
      Height = 25
      Cursor = crHandPoint
      Margins.Left = 6
      Margins.Top = 6
      Margins.Right = 6
      Margins.Bottom = 6
      Caption = 'Selecionar'
      TabOrder = 0
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        ECBC46E9B12AE8B029E8AF29E7AE28E6AD27E6AC27E5AB26E5AA25E4A924E3A7
        24E7B23FFFFFFFFFFFFFFFFFFFFFFFFFEAB32CA28F64B0A792B1A792B0A692AF
        A590ACA38EAAA08CA89F8AA89F8A9B885DE3A724FFFFFFFFFFFFFFFFFFFFFFFF
        EBB42CB4AB97E2E0DCE3E0DDE2E0DCE1DEDADFDCD8DBD7D3D6D2CDD1CDC8A89F
        8AE4A924FFFFFFFFFFFFFFFFFFFFFFFFEBB52DB8B09CE9E6E4E9E7E5CAB6A29B
        6A38DAD2C9E1DEDBDDDAD6D7D3CEA89F8AE5AA25FFFFFFFFFFFFFFFFFFFFFFFF
        ECB62EBCB4A2EEECEBCFBBA78E551B925C24996733DCD4CAE2DFDCDDDAD5ACA2
        8EE5AB26FFFFFFFFFFFFFFFFFFFFFFFFECB72EBFB6A5D3C0AE8E551BB79573E8
        E0DB9D6D3B996733DCD4CAE1DEDBAEA592E6AC27FFFFFFFFFFFFFFFFFFFFFFFF
        EDB82FC1BAA7D6C3B0BE9F7EF6F4F3F4F3F2E9E2DC9D6D3B996732DAD2C9B2A9
        94E6AD27FFFFFFFFFFFFFFFFFFFFFFFFEDB930C4BDAAF9F8F7F9F8F7F8F7F7F7
        F6F5F4F3F2E8E1DB9D6C3A9C6B39B4AB96E7AE28FFFFFFFFFFFFFFFFFFFFFFFF
        EEBB31C5BDABF9F8F8FAF9F8F9F8F8F8F7F7F6F5F4F2F0EFE5DFD9D1C0AFB5AC
        98E8AF29FFFFFFFFFFFFFFFFFFFFFFFFEFBC31C5BDABFAF9F9FBFAFAFAF9F8F9
        F8F7F6F5F4F2F1F0EEECEBE9E6E4B5AC98E8B029FFFFFFFFFFFFFFFFFFFFFFFF
        EFBD32B1A076C6BEABC6BEACC5BDABC3BDABC2BBA9BFB8A5BDB4A2B9B09CA492
        69E9B12AFFFFFFFFFFFFFFFFFFFFFFFFF2C64DEFBD32EFBC31EEBB31EDB930ED
        B82FECB72EECB62EEBB52DEBB42CEAB32CECBC46FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    end
    object btCancelSelecao: TBitBtn
      AlignWithMargins = True
      Left = 618
      Top = 38
      Width = 79
      Height = 25
      Cursor = crHandPoint
      Margins.Left = 6
      Margins.Top = 6
      Margins.Right = 6
      Margins.Bottom = 6
      Caption = 'Cancelar'
      TabOrder = 1
      OnClick = btCancelSelecaoClick
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
    inline ComboBoxGruposFiscaisFrame1: TComboBoxGruposFiscaisFrame
      Left = 118
      Top = 41
      Width = 400
      Height = 21
      TabOrder = 2
      TabStop = True
      ExplicitLeft = 118
      ExplicitTop = 41
      ExplicitWidth = 400
      inherited edGruposFiscais: TComboBox
        Width = 400
        ExplicitWidth = 400
      end
    end
  end
end
