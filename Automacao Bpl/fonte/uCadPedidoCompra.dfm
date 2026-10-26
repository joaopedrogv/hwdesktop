inherited frmCadPedidoCompra: TfrmCadPedidoCompra
  Left = 227
  Top = 66
  Caption = 'Pedido Compras'
  ClientHeight = 601
  Scaled = False
  ExplicitWidth = 806
  ExplicitHeight = 635
  PixelsPerInch = 96
  TextHeight = 13
  object Label25: TLabel [0]
    Left = 595
    Top = 235
    Width = 97
    Height = 13
    Caption = 'Quant.Pen.Itens:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  inherited PanelFundo: TPanel
    Height = 582
    BevelOuter = bvNone
    ExplicitHeight = 582
    inherited Splitter2: TSplitter
      Left = 0
      Top = 0
      Height = 582
      ExplicitLeft = 799
      ExplicitTop = 0
      ExplicitHeight = 580
    end
    inherited PanelLeft: TPanel
      Left = 3
      Top = 0
      Width = 795
      Height = 582
      BevelOuter = bvNone
      ExplicitLeft = 3
      ExplicitTop = 0
      ExplicitWidth = 795
      ExplicitHeight = 582
      inherited PageControl1: TPageControl
        Left = 0
        Top = 0
        Width = 795
        Height = 582
        ActivePage = TabSheet1
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 795
        ExplicitHeight = 582
        inherited TabSheet1: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 787
          ExplicitHeight = 551
          inherited ScrollBox1: TScrollBox
            Width = 787
            Height = 551
            ExplicitWidth = 787
            ExplicitHeight = 551
            inherited PageControl3: TPageControl
              Width = 787
              Height = 503
              ExplicitWidth = 787
              ExplicitHeight = 503
              inherited TabSheet3: TTabSheet
                ExplicitLeft = 4
                ExplicitTop = 27
                ExplicitWidth = 779
                ExplicitHeight = 472
                inherited ScrollBox3: TScrollBox
                  Width = 779
                  Height = 472
                  ExplicitWidth = 779
                  ExplicitHeight = 472
                  inherited GroupBox1: TGroupBox
                    Width = 775
                    Height = 116
                    Caption = 'Pedido de Mercadoria'
                    ParentBackground = False
                    OnExit = GroupBox1Exit
                    ExplicitWidth = 775
                    ExplicitHeight = 116
                    object Label6: TLabel
                      Left = 15
                      Top = 22
                      Width = 91
                      Height = 13
                      Caption = 'N'#250'mero Pedido:'
                      FocusControl = DBEdit1
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label7: TLabel
                      Left = 37
                      Top = 46
                      Width = 69
                      Height = 13
                      Caption = 'Fornecedor:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label8: TLabel
                      Left = 396
                      Top = 46
                      Width = 59
                      Height = 13
                      Caption = 'Vendedor:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label9: TLabel
                      Left = 387
                      Top = 71
                      Width = 68
                      Height = 13
                      Caption = 'Data Envio:'
                      FocusControl = DBEdit4
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label10: TLabel
                      Left = 76
                      Top = 71
                      Width = 30
                      Height = 13
                      Caption = 'Tipo:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label11: TLabel
                      Left = 576
                      Top = 21
                      Width = 41
                      Height = 13
                      Caption = 'Status:'
                      FocusControl = DBEdit6
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label12: TLabel
                      Left = 383
                      Top = 96
                      Width = 72
                      Height = 13
                      Caption = 'Dt Chegada:'
                      FocusControl = DBEdit7
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label13: TLabel
                      Left = 387
                      Top = 22
                      Width = 67
                      Height = 13
                      Caption = 'Valor Total:'
                      FocusControl = DBEdit8
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label29: TLabel
                      Left = 37
                      Top = 94
                      Width = 68
                      Height = 13
                      Caption = 'Cond. Pag.:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object DBEdit1: TDBEdit
                      Left = 112
                      Top = 16
                      Width = 120
                      Height = 21
                      Hint = 'N'#250'mero do pedido'
                      DataField = 'NUM_PED'
                      DataSource = dtmSugestaoCompras.dsPedidoCompra
                      Enabled = False
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clBlue
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                      ReadOnly = True
                      TabOrder = 0
                    end
                    object DBEdit4: TDBEdit
                      Left = 459
                      Top = 64
                      Width = 112
                      Height = 21
                      Hint = 'Data de fechamento do pedido'
                      DataField = 'DATA_ENV_PED'
                      DataSource = dtmSugestaoCompras.dsPedidoCompra
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 6
                    end
                    object DBEdit6: TDBEdit
                      Left = 620
                      Top = 16
                      Width = 85
                      Height = 21
                      Hint = 'Status do pedido'
                      CharCase = ecUpperCase
                      DataField = 'STATUS_PED'
                      DataSource = dtmSugestaoCompras.dsPedidoCompra
                      Enabled = False
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                      ReadOnly = True
                      TabOrder = 10
                    end
                    object DBEdit7: TDBEdit
                      Left = 459
                      Top = 88
                      Width = 112
                      Height = 21
                      Hint = 'Data de chegada do pedido'
                      DataField = 'DATA_CHG_PED'
                      DataSource = dtmSugestaoCompras.dsPedidoCompra
                      Enabled = False
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                      ReadOnly = True
                      TabOrder = 9
                    end
                    object DBEdit8: TDBEdit
                      Left = 459
                      Top = 16
                      Width = 110
                      Height = 21
                      Hint = 'Valor total do pedido'
                      DataField = 'VAL_TOT_PED'
                      DataSource = dtmSugestaoCompras.dsPedidoCompra
                      Enabled = False
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                      ReadOnly = True
                      TabOrder = 1
                    end
                    object DBLookupComboBox1: TDBLookupComboBox
                      Left = 459
                      Top = 40
                      Width = 246
                      Height = 21
                      Hint = '[F3: Consultar] - Vendedor que realizou o pedido'
                      DataField = 'COD_VENDEDOR'
                      DataSource = dtmSugestaoCompras.dsPedidoCompra
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      KeyField = 'COD_VENDEDOR'
                      ListField = 'NOME_VENDEDOR'
                      ListSource = dtmSugestaoCompras.dsLocVendedor
                      ParentFont = False
                      TabOrder = 4
                      OnEnter = DBLookupComboBox1Enter
                      OnExit = DBLookupComboBox1Exit
                      OnKeyDown = DBLookupComboBox1KeyDown
                    end
                    object DBLookupComboBox2: TDBLookupComboBox
                      Left = 159
                      Top = 40
                      Width = 215
                      Height = 21
                      Hint = '[F3: Consultar] - Fornecedor da mercadoria'
                      DataField = 'CODIGO_F'
                      DataSource = dtmSugestaoCompras.dsPedidoCompra
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      KeyField = 'COD_CLIENTE'
                      ListField = 'NOME_CLIENTE'
                      ListSource = dtmSugestaoCompras.dsLocFornecedor
                      ParentFont = False
                      TabOrder = 3
                      OnExit = DBLookupComboBox2Exit
                      OnKeyDown = DBEdit2KeyDown
                    end
                    object DBComboBox1: TDBComboBox
                      Left = 112
                      Top = 64
                      Width = 158
                      Height = 21
                      Hint = 'Indica se '#233' pedido URGENTE ou NORMAL'
                      Style = csDropDownList
                      CharCase = ecUpperCase
                      DataField = 'TIPO_PED'
                      DataSource = dtmSugestaoCompras.dsPedidoCompra
                      Font.Charset = ANSI_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ItemHeight = 13
                      Items.Strings = (
                        'NORMAL '
                        'URGENTE')
                      ParentFont = False
                      TabOrder = 5
                      OnKeyPress = DBComboBox1KeyPress
                    end
                    object DBEdit2: TDBEdit
                      Left = 112
                      Top = 40
                      Width = 43
                      Height = 21
                      Hint = '[F3: Consultar] - C'#243'digo do fornecedor da mercadoria'
                      CharCase = ecUpperCase
                      DataField = 'CODIGO_F'
                      DataSource = dtmSugestaoCompras.dsPedidoCompra
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 2
                      OnExit = DBEdit2Exit
                      OnKeyDown = DBEdit2KeyDown
                    end
                    object DBEdit14: TDBEdit
                      Left = 112
                      Top = 88
                      Width = 43
                      Height = 21
                      Hint = '[F3: Consultar] - C'#243'digo da Cond. Pag. da mercadoria'
                      CharCase = ecUpperCase
                      DataField = 'COD_COND_PAG'
                      DataSource = dtmSugestaoCompras.dsPedidoCompra
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 7
                      OnExit = DBEdit14Exit
                      OnKeyDown = DBEdit14KeyDown
                    end
                    object DBLookupComboBox3: TDBLookupComboBox
                      Left = 159
                      Top = 88
                      Width = 215
                      Height = 21
                      Hint = '[F3: Consultar] - Condi'#231#227'o de Pagamento do Pedido'
                      DataField = 'COD_COND_PAG'
                      DataSource = dtmSugestaoCompras.dsPedidoCompra
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      KeyField = 'COD_COND_PAG'
                      ListField = 'DESC_COND_PAG'
                      ListSource = dtmSugestaoCompras.dsCondPag
                      ParentFont = False
                      TabOrder = 8
                      OnExit = DBLookupComboBox3Exit
                      OnKeyDown = DBEdit14KeyDown
                    end
                    object DBCheckBox5: TDBCheckBox
                      Left = 608
                      Top = 67
                      Width = 93
                      Height = 17
                      Caption = 'Frete Base IPI'
                      DataField = 'FRETE_BASE_IPI'
                      DataSource = dtmSugestaoCompras.dsPedidoCompra
                      TabOrder = 11
                      ValueChecked = 'S'
                      ValueUnchecked = 'N'
                    end
                    object DBCheckBox8: TDBCheckBox
                      Left = 608
                      Top = 90
                      Width = 84
                      Height = 17
                      Caption = 'IPI Base ICM'
                      DataField = 'IPI_BASE_ICM'
                      DataSource = dtmSugestaoCompras.dsPedidoCompra
                      TabOrder = 12
                      ValueChecked = 'S'
                      ValueUnchecked = 'N'
                    end
                  end
                  object GroupBox4: TGroupBox
                    Left = 0
                    Top = 116
                    Width = 775
                    Height = 189
                    Align = alTop
                    Caption = 'Itens do Pedido'
                    TabOrder = 1
                    object Label17: TLabel
                      Left = 42
                      Top = 41
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
                    object Label18: TLabel
                      Left = 37
                      Top = 90
                      Width = 71
                      Height = 13
                      Caption = 'Quant.Itens:'
                      FocusControl = DBEdit16
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label19: TLabel
                      Left = 220
                      Top = 90
                      Width = 97
                      Height = 13
                      Caption = 'Quant.Pen.Itens:'
                      FocusControl = DBEdit17
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label20: TLabel
                      Left = 437
                      Top = 90
                      Width = 99
                      Height = 13
                      Caption = 'Quant.Min.Itens.:'
                      FocusControl = DBEdit18
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label21: TLabel
                      Left = 5
                      Top = 113
                      Width = 103
                      Height = 13
                      Caption = 'Val.Unit'#225'rio Itens:'
                      FocusControl = DBEdit19
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label22: TLabel
                      Left = 249
                      Top = 115
                      Width = 67
                      Height = 13
                      Caption = 'Valor Total:'
                      FocusControl = DBEdit20
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label14: TLabel
                      Left = 41
                      Top = 66
                      Width = 65
                      Height = 13
                      Caption = 'Cod.Grupo:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label15: TLabel
                      Left = 241
                      Top = 66
                      Width = 75
                      Height = 13
                      Caption = 'Cod.Produto:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label16: TLabel
                      Left = 25
                      Top = 18
                      Width = 83
                      Height = 13
                      Caption = 'N'#186'.Fabricante:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object SpeedButton13: TSpeedButton
                      Left = 223
                      Top = 15
                      Width = 23
                      Height = 21
                      Hint = 'Localizar produto'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
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
                      ParentFont = False
                      ParentShowHint = False
                      ShowHint = True
                      OnClick = SpeedButton13Click
                    end
                    object Label37: TLabel
                      Left = 248
                      Top = 18
                      Width = 69
                      Height = 13
                      Caption = 'Cod. Grade:'
                      FocusControl = DBEdit53
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label26: TLabel
                      Left = 62
                      Top = 137
                      Width = 46
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Mva(%):'
                      FocusControl = DBEdit11
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label27: TLabel
                      Left = 277
                      Top = 139
                      Width = 38
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'IPI(%):'
                      FocusControl = DBEdit12
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label28: TLabel
                      Left = 481
                      Top = 139
                      Width = 55
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Frete (%):'
                      FocusControl = DBEdit13
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label33: TLabel
                      Left = 435
                      Top = 115
                      Width = 101
                      Height = 13
                      Caption = 'Prec. Ult Compra:'
                      Enabled = False
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                      Visible = False
                    end
                    object Label36: TLabel
                      Left = 606
                      Top = 139
                      Width = 21
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'R$:'
                      FocusControl = DBEdit13
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object DBEdit16: TDBEdit
                      Left = 110
                      Top = 87
                      Width = 90
                      Height = 21
                      Hint = 'Quantidade do item no pedido'
                      DataField = 'QUANT_IT_PROD'
                      DataSource = dtmSugestaoCompras.dsItensPedido
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 5
                      OnExit = DBEdit16Exit
                    end
                    object DBEdit17: TDBEdit
                      Left = 321
                      Top = 87
                      Width = 90
                      Height = 21
                      Hint = 'Quantidade pendente do  item dentro da empresa'
                      DataField = 'QUANT_PEN_IT'
                      DataSource = dtmSugestaoCompras.dsItensPedido
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 6
                    end
                    object DBEdit18: TDBEdit
                      Left = 538
                      Top = 87
                      Width = 90
                      Height = 21
                      Hint = 'Quantidade m'#237'nima do produto'
                      DataField = 'QUANT_MIN_IT'
                      DataSource = dtmSugestaoCompras.dsItensPedido
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 7
                    end
                    object DBEdit19: TDBEdit
                      Left = 110
                      Top = 110
                      Width = 90
                      Height = 21
                      Hint = 'Valor unit'#225'rio do item'
                      DataField = 'VAL_UNT_IT'
                      DataSource = dtmSugestaoCompras.dsItensPedido
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 8
                      OnExit = DBEdit19Exit
                    end
                    object DBEdit20: TDBEdit
                      Left = 321
                      Top = 112
                      Width = 90
                      Height = 21
                      Hint = 'Valor total do item no pedido'
                      DataField = 'VAL_TOT_IT'
                      DataSource = dtmSugestaoCompras.dsItensPedido
                      Enabled = False
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 9
                    end
                    object DBEdit9: TDBEdit
                      Left = 110
                      Top = 63
                      Width = 90
                      Height = 21
                      Hint = '[F3: Consultar] - C'#243'digo do grupo do produto'
                      DataField = 'GRUPO_PROD'
                      DataSource = dtmSugestaoCompras.dsItensPedido
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 3
                      OnExit = DBEdit9Exit
                      OnKeyDown = DBEdit9KeyDown
                    end
                    object DBEdit10: TDBEdit
                      Left = 321
                      Top = 63
                      Width = 90
                      Height = 21
                      Hint = '[F3: Consultar] - C'#243'digo do produto'
                      DataField = 'COD_PROD'
                      DataSource = dtmSugestaoCompras.dsItensPedido
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 4
                      OnExit = DBEdit10Exit
                      OnKeyDown = DBEdit9KeyDown
                    end
                    object BitBtn16: TBitBtn
                      Left = 3
                      Top = 158
                      Width = 75
                      Height = 25
                      Hint = 'Incluir novo item no pedido - [SUG012]'
                      Caption = '&Incluir'
                      Font.Charset = ANSI_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                      TabOrder = 14
                      OnClick = BitBtn16Click
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
                      Left = 84
                      Top = 158
                      Width = 75
                      Height = 25
                      Hint = 'Salva altera'#231#227'oes nos itens - [SUG013]'
                      Caption = 'Salva'
                      Font.Charset = ANSI_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                      TabOrder = 15
                      OnClick = BitBtn17Click
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
                    object BitBtn18: TBitBtn
                      Left = 165
                      Top = 158
                      Width = 75
                      Height = 25
                      Hint = 'Alterar item existente - [SUG014]'
                      Caption = '&Alterar'
                      Font.Charset = ANSI_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                      TabOrder = 16
                      OnClick = BitBtn18Click
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
                    object BitBtn19: TBitBtn
                      Left = 246
                      Top = 158
                      Width = 75
                      Height = 25
                      Hint = 'Cancela altera'#231#227'oes ainda n'#227'o salvas no item'
                      Caption = 'Cancela'
                      Font.Charset = ANSI_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                      TabOrder = 17
                      OnClick = BitBtn19Click
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
                    object DBEdit3: TDBEdit
                      Left = 110
                      Top = 16
                      Width = 112
                      Height = 21
                      Hint = '[F3: Consultar] - N'#250'mero de Fabrica'#231#227'o'
                      CharCase = ecUpperCase
                      DataField = 'NUM_FAB_PROD'
                      DataSource = dtmSugestaoCompras.dsItensPedido
                      TabOrder = 0
                      OnEnter = DBEdit3Enter
                      OnExit = DBEdit3Exit
                      OnKeyDown = DBEdit9KeyDown
                    end
                    object DBEdit5: TDBEdit
                      Left = 110
                      Top = 39
                      Width = 517
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'DESCR_PROD'
                      DataSource = dtmSugestaoCompras.dsItensPedido
                      Enabled = False
                      TabOrder = 2
                    end
                    object BitBtn12: TBitBtn
                      Left = 327
                      Top = 158
                      Width = 75
                      Height = 25
                      Hint = 'Deleta item do pedido - [SUG016]'
                      Caption = '&Deletar'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                      TabOrder = 18
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
                    object DBEdit53: TDBEdit
                      Left = 320
                      Top = 16
                      Width = 90
                      Height = 21
                      DataField = 'COD_GRADE'
                      DataSource = dtmSugestaoCompras.dsItensPedido
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                      ReadOnly = True
                      TabOrder = 1
                    end
                    object DBEdit11: TDBEdit
                      Left = 110
                      Top = 133
                      Width = 90
                      Height = 21
                      Hint = 'Percentual do MVA'
                      DataField = 'MVA'
                      DataSource = dtmSugestaoCompras.dsItensPedido
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 10
                    end
                    object DBEdit12: TDBEdit
                      Left = 321
                      Top = 136
                      Width = 90
                      Height = 21
                      Hint = 'Percentual do IPI'
                      DataField = 'PERC_IPI'
                      DataSource = dtmSugestaoCompras.dsItensPedido
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 11
                    end
                    object DBEdit13: TDBEdit
                      Left = 538
                      Top = 136
                      Width = 62
                      Height = 21
                      Hint = 'Percentual do Frete'
                      DataField = 'PERC_FRETE'
                      DataSource = dtmSugestaoCompras.dsItensPedido
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 12
                      OnExit = DBEdit13Exit
                    end
                    object Edit3: TEdit
                      Left = 538
                      Top = 112
                      Width = 90
                      Height = 21
                      BiDiMode = bdRightToLeft
                      Enabled = False
                      ParentBiDiMode = False
                      TabOrder = 19
                      Text = 'Edit3'
                      Visible = False
                    end
                    object DBEdit15: TDBEdit
                      Left = 629
                      Top = 136
                      Width = 90
                      Height = 21
                      Hint = 'Valor do Frete'
                      DataField = 'FRETE'
                      DataSource = dtmSugestaoCompras.dsItensPedido
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 13
                      OnExit = DBEdit15Exit
                    end
                  end
                  object GroupBox5: TGroupBox
                    Left = 0
                    Top = 305
                    Width = 775
                    Height = 163
                    Align = alClient
                    TabOrder = 2
                    object DBGrid2: TDBGrid
                      Left = 2
                      Top = 15
                      Width = 771
                      Height = 146
                      Align = alClient
                      DataSource = dtmSugestaoCompras.dsItensPedido
                      ReadOnly = True
                      TabOrder = 0
                      TitleFont.Charset = DEFAULT_CHARSET
                      TitleFont.Color = clWindowText
                      TitleFont.Height = -11
                      TitleFont.Name = 'Tahoma'
                      TitleFont.Style = []
                      OnKeyDown = DBGrid2KeyDown
                      Columns = <
                        item
                          Expanded = False
                          FieldName = 'NITEM'
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
                          Width = 200
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'GRUPO_PROD'
                          Width = 64
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'COD_PROD'
                          Width = 64
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'COD_GRADE'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'QUANT_IT_PROD'
                          Width = 64
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'VAL_UNT_IT'
                          Width = 64
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'VAL_TOT_IT'
                          Width = 64
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'QUANT_PEN_IT'
                          Width = 64
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'QUANT_MIN_IT'
                          Width = 64
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'VL_V_EMP'
                          Width = 64
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'VL_V_HONDA'
                          Width = 64
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'NUM_COTACAO'
                          Width = 64
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'LOCACAO_PROD'
                          Width = 70
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'LOCACAO_PROD_1'
                          Width = 70
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'PESO_BRUT_PROD'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'PESO_LIQ_PROD'
                          Visible = True
                        end>
                    end
                  end
                end
              end
            end
            inherited Panel3: TPanel
              Top = 503
              Width = 787
              ExplicitTop = 503
              ExplicitWidth = 787
            end
          end
        end
        inherited TabSheet2: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 787
          ExplicitHeight = 551
          inherited GroupBox3: TGroupBox
            Width = 787
            Height = 193
            ExplicitWidth = 787
            ExplicitHeight = 193
            inherited imgInformation: TImage
              Left = 761
              Height = 176
              ExplicitLeft = 765
              ExplicitHeight = 176
            end
            inherited BitBtn1: TBitBtn
              Hint = 'Clique para pesquisar - [SUG001]'
            end
            inherited BitBtn3: TBitBtn
              Hint = 'Novo cadastro - [SUG002]'
            end
            inherited CheckBox3: TCheckBox
              Enabled = False
              Visible = False
            end
            object groupAdicional: TGroupBox
              Left = 3
              Top = 70
              Width = 277
              Height = 121
              Caption = 'Pesquisa Adicional'
              TabOrder = 11
              Visible = False
              OnExit = groupAdicionalExit
              object Label43: TLabel
                Left = 7
                Top = 54
                Width = 51
                Height = 13
                Caption = 'Conte'#250'do:'
              end
              object Label44: TLabel
                Left = 21
                Top = 28
                Width = 37
                Height = 13
                Caption = 'Campo:'
              end
              object Label45: TLabel
                Left = 157
                Top = 54
                Width = 16
                Height = 13
                Caption = 'at'#233
              end
              object Label46: TLabel
                Left = 10
                Top = 78
                Width = 48
                Height = 13
                Caption = 'Condi'#231#227'o:'
              end
              object ComboBox11: TComboBox
                Left = 64
                Top = 20
                Width = 203
                Height = 21
                Hint = 'Campo filtro da pesquisa adicional. Informe o campo desejado'
                ItemHeight = 13
                TabOrder = 0
                Text = 'ComboBox11'
                OnEnter = ComboBox1Enter
                OnExit = ComboBox11Exit
              end
              object MaskEdit7: TMaskEdit
                Left = 64
                Top = 46
                Width = 203
                Height = 21
                CharCase = ecUpperCase
                TabOrder = 1
              end
              object MaskEdit8: TMaskEdit
                Left = 193
                Top = 46
                Width = 74
                Height = 21
                EditMask = '!99/99/0000;1;_'
                MaxLength = 10
                TabOrder = 3
                Text = '  /  /    '
                Visible = False
              end
              object MaskEdit9: TMaskEdit
                Left = 64
                Top = 46
                Width = 72
                Height = 21
                EditMask = '!99/99/0000;1;_'
                MaxLength = 10
                TabOrder = 2
                Text = '  /  /    '
                Visible = False
              end
              object ComboBox12: TComboBox
                Left = 64
                Top = 72
                Width = 133
                Height = 21
                ItemHeight = 13
                TabOrder = 4
                Text = 'Come'#231'a'
                Items.Strings = (
                  'Come'#231'a'
                  'Igual'
                  'Diferente'
                  'Maior'
                  'Menor'
                  'Esta contido')
              end
            end
          end
          inherited Panel1: TPanel
            Top = 193
            Width = 787
            Height = 358
            ExplicitTop = 193
            ExplicitWidth = 787
            ExplicitHeight = 358
            inherited Splitter1: TSplitter
              Height = 297
              ExplicitHeight = 416
            end
            inherited DBGrid1: TDBGrid
              Width = 494
              Height = 297
              OnKeyDown = DBGrid1KeyDown
              Columns = <
                item
                  Expanded = False
                  FieldName = 'NUM_PED'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'COD_EMPRESA'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CODIGO_F'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'COD_VENDEDOR'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DATA_ENV_PED'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'TIPO_PED'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'STATUS_PED'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DATA_CHG_PED'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'VAL_TOT_PED'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ATIVO'
                  Visible = True
                end>
            end
            inherited Panel2: TPanel
              Width = 783
              ExplicitWidth = 783
              inherited SpeedButton1: TSpeedButton
                Hint = 'Editar Registro - [SUG003]'
              end
              inherited SpeedButton2: TSpeedButton
                Hint = 'Apagar Registro - [SUG004]'
                OnClick = SpeedButton2Click
              end
              inherited SpeedButton3: TSpeedButton
                Hint = 'Imprimir - [SUG006]'
                OnClick = SpeedButton3Click
              end
              inherited SpeedButton4: TSpeedButton
                OnClick = SpeedButton25Click
              end
              inherited SpeedButton5: TSpeedButton
                Hint = 'Recuperar registro - [SUG008]'
                OnClick = SpeedButton5Click
              end
              inherited SpeedButton6: TSpeedButton
                Hint = 
                  'Gera Arquivo de Pedido de Mercadorias ao Fabricante/Produtor - [' +
                  'SUG009]'
                Glyph.Data = {
                  AA050000424DAA050000000000006A0300002800000018000000180000000100
                  08000000000040020000120B0000120B0000CD000000CD00000000000000FFFF
                  FF007F7EB0007B79AF00FF00FF00FBFAFB00E2D9DC00A3676B00A4676900A669
                  6B00A5686A00A6696A00A5696A00A66A6B00AA6F7000AA707000AF828200FFFE
                  FE00AB7572009F6B6500A36B6400B07F7600A56B5F00A7756B00AC695900AC7F
                  7500AF6A5600811E00008320010083210100B5837400A77D7000BD9082008E2F
                  0C00B67660008A2B0700983E19009A442000DCC2B80095380F0095391100963A
                  1300963B1300963C1500963D1600973D1700A4512C00BF7D6000BC826800AF8B
                  7B00B8755500CF9D8400B7928000D5B19F00CF906C00CE957500E6D5CC00EEE0
                  D800FAF3EF00B0643700C4866200D1926D00D59A7700DCA17D00C5A48F00E0BB
                  A500F6E9E100F3E7E000B4642F00DA9D7500DCA37E00E6C7B200FEF7F200D387
                  4900D4894A00D18A4F00E6A97800E7AB7900E9B08100E7B08200E7C6AC00CBAF
                  9800E1974E00FAF0E600FCF8F400E0AB6F00EBC59C00F4E3D100F8F0E700F0D0
                  A900E0C2A000F4D7B500F0D5B400F2D9BB00F3DABC00E9BC7F00EAC08800EDC6
                  9300EECB9E00F8E5CC00FFF4E500EEC28000F2C98C00F3CE9700F6D3A000F4DA
                  B500F8E3C500EFC48000EFC58100EFC58300F0C78800F8D39600F2CE9500F4D4
                  A000F3D3A000FBDCAD00F6D9AB00FEE9C700FCEACE00F4CB8200F3CA8200F4CC
                  8300EEC58000F4CC8600F6CE8900F6D19100F0CE9300F8D9A000FAE2B700FCD4
                  8400FFE0A400FBE0AD00EBD9B700FFFEFC00F8D48400FFF6D800FFFEF800FFFC
                  E600FFFED700FFFFF600FFFFFC00004F0000004C000000520100015503000154
                  0300025C040002580300025C0500025B050003720800036E070003690700035F
                  060005890C00068F0D0005620A0004800B0005840C000698100006920E00057E
                  0C00056F0C00067F0D00097811000EA51D000B7B16000A6E12000F821C0015A4
                  280018A92D00138423001BB733001CA035001A922F0023BC41002DC24F0030C6
                  560035C660003FDC6F003ED96F0042E0750045E67A00F4F6FA002E50FC00889E
                  FF00889DFC002D4EFA002D4DF4002D4BF2002D48E6002C46DE008692D700001E
                  FF000222FF000222FE000221FC000323FE000324FE000323FB002C46E6002B44
                  DE00828CDC008087CF007E84D50004040404040404040404040404080D090B0B
                  0C0C0C0B0B08040404040404040404040404040F8A80837F7D7B7886810C0404
                  04040404040404040404040E875DCBC8C7C90365770C04040404040404040404
                  0404041289CAC3C1C1C1C402770C04040404040404040404040404198BBDC1C1
                  C1C1C1BF7C0C040404040404040404040404041E01C5C1C1C1C1C1C76F0C0404
                  04040404040404040404043701BBC1C1C1C1C1BE820B04040404040404040404
                  0404043E01BAC2C1C1C1C3C05A0A040404040404040404040404043F0101B9B8
                  C6BCCC5131070404040404040404040404040446010101018558201413180808
                  08080808080808080808044F0101010101B7104B4A040875697471706E6C7A79
                  6B08044E053A3A3A54391522040408765E5C596261605F6C6B08044C363D3D3D
                  3D9CA704040408502D2C2B2A292827446B080404040404048FAEB59004041764
                  2E1B1B1B1B1B1C556D0804040404048DABB4B6B09004178C471D1B1B1B1B3B7E
                  66080404040490A8B2B3B1AAA990308C53321B1B1B2356726708040404049090
                  90ADAF9090903D8C4842211B1B3C5B7368080404040404048EA6AC9004043D8C
                  0111331B24636A84400804040404040491A4A5900404458C0101112541573534
                  1F0804040404040499A39F900404458C0101014388381616161A040404040404
                  98A09E9004044D8C010101010106165249040404040404979B9A900404044D3A
                  3A3A3A3A3A26162F0490909194A2A19D9690040404044D3D3D3D3D3D3D3D1604
                  0404909092959293910404040404}
                OnClick = SpeedButton6Click
              end
              inherited SpeedButton7: TSpeedButton
                Left = 405
                Hint = 'Mercadorias pendentens - [SUG025]'
                Glyph.Data = {
                  F6060000424DF606000000000000360000002800000018000000180000000100
                  180000000000C0060000C30E0000C30E00000000000000000000FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FF7788DD7788DDA8B1DFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FF0125DA0125DA0004D00003D00125DA0125
                  DAFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0125DA0125DA0004D0FFFFFF
                  FFFFFF0003D00125DA0125DAFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0125DA0125DA01
                  25DA0011D5FFFFFFFFFFFF0010D50125DA0125DA0125DAFF00FF4ABCFF4ABCFF
                  4ABCFF4ABCFF4ABCFF4ABCFF4ABCFF4ABCFF4ABCFF4ABCFF4ABCFF75C6F6FF00
                  FF0125DA0125DA0125DA0125DA0000CD0000CC0125DA0125DA0125DA0125DAFF
                  00FF4ABCFF48BBFE48BBFE4ABCFF48BBFE48BBFE4ABCFF48BBFE48BBFE4ABCFF
                  48BBFF8DCCF17A8DEB0125DA0125DA0125DA000AD2FFFFFFFFFFFF0009D20125
                  DA0125DA0125DA7F8FDD4ABCFF48BBFE48BBFE4ABCFF48BBFE48BBFE4ABCFF48
                  BBFE48BBFE4ABCFF48BBFF8BCBF17D8FEB0125DA0125DA0125DA0007D2FFFFFF
                  FFFFFF0006D00125DA0125DA0125DA808FDD4ABCFF4ABCFF4ABCFF7474747474
                  74747474747474747474747474747474747474919191FF00FF0125DA0125DA01
                  25DA0006D0FFFFFFFFFFFF0003D00125DA0125DA0125DAFF00FF4ABCFF48BBFE
                  48BBFE4ABCFF48BBFE48BBFE4ABCFF48BBFE48BBFE4ABCFF48BBFF4CBCFEFF00
                  FF0125DA0125DA0125DA0003D0FFFFFFFFFFFF0001D00125DA0125DA0125DAFF
                  00FF4ABCFF48BBFE48BBFE747474747474747474747474747474747474747474
                  747474747474A0A0A0FF00FF0125DA0125DA0125DA0006D20004D00125DA0125
                  DA0125DAFF00FFFF00FF4ABCFF4ABCFF4ABCFF4ABCFF4ABCFF4ABCFF4ABCFF4A
                  BCFF4ABCFF4ABCFF4ABCFF4ABCFF4ABCFEA6D2ECFF00FF0125DA0125DA0006D2
                  0004D00125DA0125DAFF00FFFF00FFFF00FF4ABCFF48BBFE48BBFE7474747474
                  74747474747474747474747474747474747474747474747474747474A0A0A0FF
                  00FFFF00FF7C8EE87C8DE8FF00FFFF00FF8BCBF1FF00FFFF00FF4ABCFF4ABCFF
                  4ABCFF4ABCFF4ABCFF4ABCFF4ABCFF4ABCFF4ABCFF4ABCFF4ABCFF4ABCFF4ABC
                  FF4ABCFF4ABCFF4EBDFE72C5F78CCCF18DCCF174C6F64EBDFE4ABCFFFF00FFFF
                  00FF4ABCFF48BBFE48BBFE747474747474747474747474747474747474747474
                  7474747474747474747474747474747474747474747474747474744ABCFF48BB
                  FE48BBFEFF00FFFF00FF4ABCFF48BBFE48BBFE4ABCFF48BBFE48BBFE4ABCFF48
                  BBFE48BBFE4ABCFF48BBFF48BBFF48BBFE4ABCFF48BBFE48BBFE4ABCFF48BBFE
                  48BBFE4ABCFF48BBFE48BBFEFF00FFFF00FF4ABCFF48BBFE48BBFE7474747474
                  7474747474747474747474747474747474747474747448BBFE4ABCFF48BBFE48
                  BBFE4ABCFF48BBFE48BBFE4ABCFF48BBFE48BBFEFF00FFFF00FF4ABCFF4ABCFF
                  4ABCFF4ABCFF4ABCFF4ABCFF4ABCFF4ABCFF4ABCFF4ABCFF4ABCFF4ABCFF4ABC
                  FF4ABCFF4ABCFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FF4ABCFF48BBFE48BBFE747474747474747474747474747474747474747474
                  74747474747448BBFE4ABCFF4ABCFFFF00FF4ABCFF4ABCFF48BBFF48BBFF4ABC
                  FF53BDFCFF00FFFF00FF4ABCFF48BBFE48BBFE4ABCFF48BBFE48BBFE4ABCFF48
                  BBFE48BBFE4ABCFF48BBFF48BBFF48BBFE4ABCFF4ABCFFFF00FF4ABCFF4ABCFF
                  48BBFE4ABCFF5ABFFBFF00FFFF00FFFF00FF4ABCFF4ABCFF4ABCFF7474747474
                  747474747474747474747474747474747474747474744ABCFF4ABCFF4ABCFFFF
                  00FF4ABCFF4ABCFF4ABCFF5EC0FBFF00FFFF00FFFF00FFFF00FF4ABCFF48BBFE
                  48BBFE4ABCFF48BBFE48BBFE4ABCFF48BBFE48BBFE4ABCFF48BBFF48BBFF48BB
                  FE4ABCFF4ABCFFFF00FF4ABCFF4ABCFF5CC0FBFF00FFFF00FFFF00FFFF00FFFF
                  00FF4ABCFF48BBFE48BBFE4ABCFF48BBFE48BBFE4ABCFF48BBFE48BBFE4ABCFF
                  48BBFF48BBFF48BBFE4ABCFF4ABCFFFF00FF4ABCFF4ABCFFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FF4ABCFF4ABCFF4ABCFF4ABCFF4ABCFF4ABCFF4ABCFF4A
                  BCFF4ABCFF4ABCFF4ABCFF4ABCFF4ABCFF4ABCFF4ABCFFFF00FF4ABCFFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                OnClick = SpeedButton7Click
                ExplicitLeft = 405
              end
              inherited SpeedButton8: TSpeedButton
                Hint = 'Marcar Item para Produ'#231#227'o - [SUG024]'
                Glyph.Data = {
                  76060000424D7606000000000000360400002800000018000000180000000100
                  08000000000040020000220B0000220B00000001000000010000080808001810
                  1000181818002929210029292900393939004239390042423900EFA539004242
                  4200524A42005A52420042424A004A424A00313952004A4A5200EFA55200FFB5
                  52005A5A5A00E7AD6B00F7BD6B00AD7B7300AD847300B5847300BD8C73005A63
                  7B00AD7B7B009C847B00A5847B00AD847B00B58C7B00C68C7B00C6947B00CE94
                  7B00CE9C7B00D69C7B0084848400B5848400BD848400B58C8400BD8C8400BD94
                  8400C6948400C69C8400D6A58400DEA58400DEAD8400E7B584008C8C8C00CE9C
                  8C00CEA58C00D6A58C00DEAD8C00EFC68C00F7C68C00B5AD9400EFCE9400B5AD
                  9C00EFCE9C00F7CE9C00F7D69C00CEADA500BDB5A500DEC6A500EFCEA500F7CE
                  A500F7D6A500394AAD00848CAD00CEBDAD00D6C6AD00F7D6AD009494B500ADB5
                  B500F7D6B500F7DEB500526BBD00DEC6BD00E7CEBD00EFD6BD00F7DEBD00314A
                  C6009CA5C600E7CEC600EFCEC600EFD6C600EFDEC600F7DEC600F7E7C600FFE7
                  C6004A63CE00C6C6CE00DECECE00DED6CE00E7D6CE00E7DECE00F7DECE00F7E7
                  CE00FFE7CE001842D600214AD6007384D600DED6D600E7D6D600EFDED600F7E7
                  D600FFE7D600FFEFD6007B94DE009CA5DE00EFDEDE00F7E7DE00F7EFDE00FFEF
                  DE000839E7001039E7004A6BE700A5ADE700F7EFE700FFEFE700FFF7E7004A6B
                  EF00637BEF00738CEF008494EF0094A5EF00CED6EF00D6D6EF00EFEFEF00F7EF
                  EF00F7F7EF00FFF7EF004263F700426BF700CED6F700F7F7F700FFF7F700FFFF
                  F700FF00FF000842FF00295AFF00315AFF003163FF00426BFF006B8CFF00849C
                  FF009CB5FF00C6CEFF00EFEFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008A8A8A1A2525
                  252525252525252525252525252525258A8A8A8A8A1A5658504B4A47423A3A38
                  383838383838381E8A8A8A8A8A1A566157504A4747403A3A383838383838381E
                  8A8A8A8A8A1A60615757504A4747403A3A3838383838381E8A8A8A8A8A1A6169
                  615750504A4747403A3A38383838381E8A8A8A8A8A1A697069615757504A4747
                  403A3A383838381E8A8A8A8A8A1D6F706961615757504A4747403A3A3838381E
                  8A8A8A8A8A1D7676030B0B0B0B0B504A4747403A3A38381E8A8A8A8A8A1E7683
                  025C7C8B430A50504A4747403A3A381E8A8A8A8A8A27818304658475730D5750
                  504A4747403A381E8A8A8A8A8A28878902485B5C5A64605757504A4747403A1E
                  8A8A8A8A8A298795090909070C637B245750504A4747401E8A8A8A8A8A2A8795
                  878176766F6685796D5750504A47401E8A8A8A8A8A2B87959595888376766F7D
                  7A615750504A471E8A8A8A8A8A2B879524242424242476706961615750503F1B
                  8A8A8A8A8A3188950030494419097676706961614F45371B8A8A8A8A8A328895
                  0280868C4C1282767670705F453E391B8A8A8A8A8A338895046C8E91730F8883
                  78681716151515168A8A8A8A8A34889502527E95745189888353172F13100825
                  8A8A8A8A8A348895040909090E739295895317351411258A8A8A8A8A8A348895
                  80808080807E8E90935E173514258A8A8A8A8A8A8A3495959595959595959490
                  8F671735258A8A8A8A8A8A8A8A344E4F4F544E4E4E4E4D4D4D3D17258A8A8A8A
                  8A8A8A8A8A2D2C2C2C2C23222120201F1817258A8A8A8A8A8A8A}
                OnClick = SpeedButton8Click
              end
              inherited SpeedButton11: TSpeedButton
                Hint = 
                  'Remove o todos os registros da tabela de pendencias marcando-os ' +
                  'como recebidos - [SUG027]'
                Glyph.Data = {
                  6E040000424D6E040000000000002E0200002800000018000000180000000100
                  08000000000040020000120B0000120B00007E0000007E00000000000000FFFF
                  FF00FF00FF00FFFEFE00811E0000FFFCFB00BD4C0000FFFCFA00FFFBF800FFF0
                  E200FFF8F200FFEBD700FFF0E100FEEFE000FEF0E200FFF3E700FFF4E900FEF4
                  EA00FFF6ED00FFF7EF00FEF8F200FFFBF700FEFAF600FEFCFA00FEDDB800FEDE
                  BA00FEDEBB00FEDEBC00FFE1C000FFE2C200FFE2C400FFE3C400FEE2C400FEE3
                  C500FEE3C600FEE3C700FFE5C900FEE6CB00FEE6CC00FFE7CE00FFE9D100FFEA
                  D300FEEAD400FEEBD700FFEDD900FFEEDC00FFEFDE00FFF3E600FFF7EE00FEF6
                  ED00FEDDB700FEE0BB00FEE0BC00FEE0BD00FEE1BD00FFE1BF00FEE1BF00FEE2
                  C000FEE2C100FEE2C200FEE3C400FFE5C700FEE5C600FEE5C700FFE6C900FFE7
                  CA00FEE6C900FEE6CA00FEE7CC00FFE9D000FFEAD000FEE9CF00FEE9D000FEE9
                  D100FEEAD300FEEBD400FEEBD500FFEDD800FEEDD800FFEEDA00FEEDD900FFEF
                  DC00FFF0DE00FEEFDD00FEEFDE00FEF0E000FFF2E200FFF2E300FFF3E500FFF4
                  E700FFF6EB00FFF8F000FEF7EF00FFFAF400FEEAD100FEEDD700FEEEDA00FEF2
                  E200FEF2E300FEF3E500FEF4E700FFF6EA00FFF7ED00FFF8EF00FFFBF600FFFC
                  F800FEEFDA00FEF3E300FFF8EE00FFFAF300FFFAF200FFFBF400FEFAF300FFFC
                  F700FEFBF600FFFAF000FEFAF200FFFEFC00FEFCF700FFFEFB00FFFFFE00004B
                  000033DD670034DD660041F077004BFE82000202020202020202020202020202
                  0202020202020202020202020202020202020202020202020202020202020202
                  0202020202020202020202020202060606060606060606060606020202020202
                  020202020202061D40470B5358656E157701020202020202020202020202063A
                  3D44294F0C0F675D070302020202020202020202020206351F43452B5458120A
                  1575020202020202020202020202061B3A23442A6A6110676F05020202020202
                  0202020202020619382141494E2E2F3174710202027902020604040404040404
                  040404040404040404040202797902020633373B3F26464C4F0D581030747207
                  750102797D790202061A353B2243474B2C546259125B16077578797A7C790202
                  0618341C3C2444294D51090F5A5C6D08770302797B790202061834381E3F445E
                  5F2D555811137015177802027979020206321A353A3E25482A50525759666E68
                  6977020202790202060404040404040404040404040404040404020202020202
                  020202020202062042480B526B5A737675010202020202020202020202020639
                  22444A6056646C5D690302020202020202020202020206363C43484E52635A6E
                  157702020202020202020202020206343A3E274B4F0E10676807020202020202
                  0202020202020619382043284E2E2F6614150202020202020202020202020606
                  0606060606060606060602020202020202020202020202020202020202020202
                  0202020202020202020202020202020202020202020202020202020202020202
                  020202020202020202020202020202020202}
                OnClick = SpeedButton11Click
              end
              inherited SpeedButton12: TSpeedButton
                Enabled = False
                Visible = False
              end
              inherited SpeedButton23: TSpeedButton
                Enabled = False
                Visible = False
              end
              inherited SpeedButton24: TSpeedButton
                Enabled = False
                Visible = False
              end
              inherited SpeedButton25: TSpeedButton
                Hint = 'Ver registros da lixeira - [SUG007]'
                OnClick = SpeedButton25Click
              end
              inherited SpeedButton26: TSpeedButton
                Enabled = False
                Visible = False
              end
            end
            inherited GroupBox2: TGroupBox
              Height = 297
              ExplicitHeight = 297
              inherited ScrollBox2: TScrollBox
                Height = 280
                ExplicitHeight = 280
              end
            end
          end
        end
        inherited tsMemo: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 787
          ExplicitHeight = 551
        end
        object tsRelPedidoCompra: TTabSheet
          Caption = 'tsRelPedidoCompra'
          ImageIndex = 2
          object qrpPedidoCompra: TQuickRep
            Left = -13
            Top = 0
            Width = 816
            Height = 1056
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            BeforePrint = qrpPedidoCompraBeforePrint
            DataSet = dtmSugestaoCompras.CdsItensPedido
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
            OnPreview = qrpPedidoCompraPreview
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
            PreviewInitialState = wsNormal
            PrevInitialZoom = qrZoomToFit
            PreviewDefaultSaveType = stQRP
            object QRBand1: TQRBand
              Left = 38
              Top = 38
              Width = 740
              Height = 260
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
                687.916666666666700000
                1957.916666666667000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              BandType = rbPageHeader
              object QRLabel1: TQRLabel
                Left = 2
                Top = 171
                Width = 399
                Height = 24
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  63.500000000000000000
                  5.291666666666670000
                  452.437500000000000000
                  1055.687500000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Caption = 'Pedido'
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
                Top = 196
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
                  518.583333333333400000
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
                Top = 196
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
                  518.583333333333400000
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
                Left = 636
                Top = 196
                Width = 47
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1682.750000000000000000
                  518.583333333333400000
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
                Left = 689
                Top = 196
                Width = 46
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1822.979166666667000000
                  518.583333333333400000
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
                Left = 4
                Top = 210
                Width = 765
                Height = 3
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  7.937500000000000000
                  10.583333333333330000
                  555.625000000000000000
                  2024.062500000000000000)
                Brush.Color = clBlack
                Shape = qrsRectangle
                VertAdjust = 0
              end
              object QRShape2: TQRShape
                Left = 4
                Top = 255
                Width = 765
                Height = 3
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  7.937500000000000000
                  10.583333333333330000
                  674.687500000000000000
                  2024.062500000000000000)
                Brush.Color = clBlack
                Shape = qrsRectangle
                VertAdjust = 0
              end
              object QRLabel6: TQRLabel
                Left = 7
                Top = 219
                Width = 38
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  18.520833333333330000
                  579.437500000000000000
                  100.541666666666700000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'N.Fabr.'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRLabel5: TQRLabel
                Left = 91
                Top = 219
                Width = 55
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  240.770833333333300000
                  579.437500000000000000
                  145.520833333333300000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Descri'#231#227'o'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRLabel9: TQRLabel
                Left = 435
                Top = 219
                Width = 49
                Height = 31
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  82.020833333333340000
                  1150.937500000000000000
                  579.437500000000000000
                  129.645833333333300000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = True
                Caption = 'Pr. Ult. Compra'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRLabel11: TQRLabel
                Left = 525
                Top = 219
                Width = 28
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1389.062500000000000000
                  579.437500000000000000
                  74.083333333333340000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Total'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRLabel13: TQRLabel
                Left = 385
                Top = 219
                Width = 36
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1018.645833333333000000
                  579.437500000000000000
                  95.250000000000000000)
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Quant.'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRLabel7: TQRLabel
                Left = 8
                Top = 60
                Width = 79
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  21.166666666666670000
                  158.750000000000000000
                  209.020833333333300000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'N'#186' Pedido....:'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
              object QRLabel8: TQRLabel
                Left = 8
                Top = 81
                Width = 79
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  21.166666666666670000
                  214.312500000000000000
                  209.020833333333300000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Data Envio...:'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
              object QRLabel21: TQRLabel
                Left = 8
                Top = 103
                Width = 78
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  21.166666666666670000
                  272.520833333333400000
                  206.375000000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Fornecedor..:'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
              object QRLabel22: TQRLabel
                Left = 8
                Top = 125
                Width = 77
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  21.166666666666670000
                  330.729166666666700000
                  203.729166666666700000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Tipo Pedido.:'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
              object QRLabel23: TQRLabel
                Left = 8
                Top = 145
                Width = 226
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  21.166666666666670000
                  383.645833333333400000
                  597.958333333333400000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Total(De acordo com a '#250'ltima compra):'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
              object QRDBText7: TQRDBText
                Left = 94
                Top = 60
                Width = 98
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666700000
                  248.708333333333000000
                  158.750000000000000000
                  259.291666666667000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Color = clWhite
                DataSet = dtmSugestaoCompras.CdsPedidoCompra
                DataField = 'NUM_PED'
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
              object QRDBText12: TQRDBText
                Left = 94
                Top = 81
                Width = 98
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666700000
                  248.708333333333000000
                  214.312500000000000000
                  259.291666666667000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Color = clWhite
                DataSet = dtmSugestaoCompras.CdsPedidoCompra
                DataField = 'DATA_ENV_PED'
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
              object QRDBText19: TQRDBText
                Left = 94
                Top = 103
                Width = 67
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  248.708333333333300000
                  272.520833333333400000
                  177.270833333333300000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Color = clWhite
                DataSet = dtmSugestaoCompras.CdsPedidoCompra
                DataField = 'CODIGO_F'
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
              object QRDBText20: TQRDBText
                Left = 94
                Top = 125
                Width = 77
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666700000
                  248.708333333333000000
                  330.729166666667000000
                  203.729166666667000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Color = clWhite
                DataSet = dtmSugestaoCompras.CdsPedidoCompra
                DataField = 'TIPO_PED'
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
              object QRDBText21: TQRDBText
                Left = 243
                Top = 145
                Width = 104
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  642.937500000000000000
                  383.645833333333300000
                  275.166666666666700000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Color = clWhite
                DataSet = dtmSugestaoCompras.CdsPedidoCompra
                DataField = 'VAL_TOT_PED'
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
              object QRLabel4: TQRLabel
                Left = 679
                Top = 219
                Width = 50
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1796.520833333334000000
                  579.437500000000000000
                  132.291666666666700000)
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Caption = 'Valor Vnd'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRLabel14: TQRLabel
                Left = 559
                Top = 219
                Width = 68
                Height = 30
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  79.375000000000000000
                  1479.020833333333000000
                  579.437500000000000000
                  179.916666666666700000)
                Alignment = taCenter
                AlignToBand = False
                AutoSize = False
                AutoStretch = True
                Caption = 'Pr. Nova Compra'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRDBText8: TQRDBText
                Left = 174
                Top = 103
                Width = 100
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  460.375000000000000000
                  272.520833333333400000
                  264.583333333333400000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Color = clWhite
                DataSet = dtmSugestaoCompras.qrLocFornecedor
                DataField = 'NOME_CLIENTE'
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
              object QRLabel10: TQRLabel
                Left = 300
                Top = 3
                Width = 85
                Height = 20
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  52.916666666666670000
                  793.750000000000000000
                  7.937500000000000000
                  224.895833333333300000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'QRLabel10'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -16
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 12
              end
              object QRLabel15: TQRLabel
                Left = 259
                Top = 219
                Width = 34
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  685.270833333333400000
                  579.437500000000000000
                  89.958333333333340000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Grade'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRLabel16: TQRLabel
                Left = 645
                Top = 219
                Width = 28
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1706.562500000000000000
                  579.437500000000000000
                  74.083333333333340000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Total'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
            end
            object DetailBandPedidoCompra: TQRBand
              Left = 38
              Top = 298
              Width = 740
              Height = 17
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
                44.979166666666670000
                1957.916666666667000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              BandType = rbDetail
              object QRDBText3: TQRDBText
                Left = 7
                Top = 2
                Width = 81
                Height = 16
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  42.333333333333330000
                  18.520833333333330000
                  5.291666666666667000
                  214.312500000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Color = clWhite
                DataSet = dtmSugestaoCompras.CdsItensPedido
                DataField = 'NUM_FAB_PROD'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 7
              end
              object QRDBText4: TQRDBText
                Left = 91
                Top = 2
                Width = 162
                Height = 16
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  42.333333333333340000
                  240.770833333333300000
                  5.291666666666667000
                  428.625000000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Color = clWhite
                DataSet = dtmSugestaoCompras.CdsItensPedido
                DataField = 'DESCR_PROD'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 7
              end
              object QRDBText5: TQRDBText
                Left = 369
                Top = 1
                Width = 52
                Height = 16
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  42.333333333333340000
                  976.312500000000000000
                  2.645833333333333000
                  137.583333333333300000)
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Color = clWhite
                DataSet = dtmSugestaoCompras.CdsItensPedido
                DataField = 'QUANT_IT_PROD'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'Arial'
                Font.Style = []
                Mask = '0.00'
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 7
              end
              object QRDBText10: TQRDBText
                Left = 620
                Top = 1
                Width = 53
                Height = 16
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  42.333333333333340000
                  1640.416666666667000000
                  2.645833333333333000
                  140.229166666666700000)
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Color = clWhite
                DataSet = dtmSugestaoCompras.CdsItensPedido
                DataField = 'VAL_TOT_IT'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'Arial'
                Font.Style = []
                Mask = '0.00'
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 7
              end
              object QRDBText11: TQRDBText
                Left = 427
                Top = 1
                Width = 57
                Height = 16
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  42.333333333333340000
                  1129.770833333333000000
                  2.645833333333333000
                  150.812500000000000000)
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'Arial'
                Font.Style = []
                Mask = '0.00'
                OnPrint = QRDBText11Print
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 7
              end
              object QRDBText6: TQRDBText
                Left = 559
                Top = 1
                Width = 55
                Height = 16
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  42.333333333333340000
                  1479.020833333333000000
                  2.645833333333333000
                  145.520833333333300000)
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Color = clWhite
                DataSet = dtmSugestaoCompras.CdsItensPedido
                DataField = 'VAL_UNT_IT'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'Arial'
                Font.Style = []
                Mask = '0.00'
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 7
              end
              object QRDBText1: TQRDBText
                Left = 259
                Top = 0
                Width = 104
                Height = 16
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  42.333333333333340000
                  685.270833333333400000
                  0.000000000000000000
                  275.166666666666700000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Color = clWhite
                DataSet = dtmSugestaoCompras.CdsItensPedido
                DataField = 'DESCRICAO'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 7
              end
              object QRExpr2: TQRExpr
                Left = 679
                Top = 0
                Width = 50
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1796.520833333334000000
                  0.000000000000000000
                  132.291666666666700000)
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'Arial'
                Font.Style = []
                Color = clWhite
                ParentFont = False
                ResetAfterPrint = False
                Transparent = False
                WordWrap = True
                Expression = 'QUANT_IT_PROD * VL_V_EMP'
                Mask = '0.00'
                ExportAs = exptText
                FontSize = 7
              end
              object QRDBText2: TQRDBText
                Left = 490
                Top = 1
                Width = 63
                Height = 16
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  42.333333333333340000
                  1296.458333333333000000
                  2.645833333333333000
                  166.687500000000000000)
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'Arial'
                Font.Style = []
                Mask = '0.00'
                OnPrint = QRDBText2Print
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 7
              end
            end
            object SummaryBand1: TQRBand
              Left = 38
              Top = 315
              Width = 740
              Height = 58
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
                153.458333333333300000
                1957.916666666667000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              BandType = rbSummary
              object QRLabel24: TQRLabel
                Left = 5
                Top = 5
                Width = 248
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  13.229166666666670000
                  13.229166666666670000
                  656.166666666666800000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 
                  'Total do Pedido.................................................' +
                  '....:'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRLabel25: TQRLabel
                Left = 5
                Top = 24
                Width = 156
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  13.229166666666670000
                  63.500000000000000000
                  412.750000000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Quatidade Itens......................:'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRShape4: TQRShape
                Left = 3
                Top = 1
                Width = 765
                Height = 3
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  7.937500000000000000
                  7.937500000000000000
                  2.645833333333333000
                  2024.062500000000000000)
                Brush.Color = clBlack
                Shape = qrsRectangle
                VertAdjust = 0
              end
              object QRExpr1: TQRExpr
                Left = 373
                Top = 6
                Width = 180
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  986.895833333333400000
                  15.875000000000000000
                  476.250000000000000000)
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                Color = clWhite
                OnPrint = QRExpr1Print
                ParentFont = False
                ResetAfterPrint = False
                Transparent = False
                WordWrap = True
                Mask = 'R$0.00'
                ExportAs = exptText
                FontSize = 7
              end
              object QRExpr3: TQRExpr
                Left = 656
                Top = 6
                Width = 73
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1735.666666666667000000
                  15.875000000000000000
                  193.145833333333300000)
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                Color = clWhite
                ParentFont = False
                ResetAfterPrint = False
                Transparent = False
                WordWrap = True
                Expression = 'sum(VL_V_EMP)'
                Mask = 'R$0.00'
                ExportAs = exptText
                FontSize = 7
              end
              object QRExpr4: TQRExpr
                Left = 204
                Top = 24
                Width = 38
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  539.750000000000000000
                  63.500000000000000000
                  100.541666666666700000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                Color = clWhite
                ParentFont = False
                ResetAfterPrint = False
                Transparent = False
                WordWrap = True
                Expression = 'COUNT'
                Mask = '0.00'
                ExportAs = exptText
                FontSize = 8
              end
              object QRExpr6: TQRExpr
                Left = 600
                Top = 6
                Width = 73
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1587.500000000000000000
                  15.875000000000000000
                  193.145833333333300000)
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                Color = clWhite
                ParentFont = False
                ResetAfterPrint = False
                Transparent = False
                WordWrap = True
                Expression = 'sum(VAL_TOT_IT)'
                Mask = 'R$0.00'
                ExportAs = exptText
                FontSize = 7
              end
              object QRMemo1: TQRMemo
                Left = 204
                Top = 41
                Width = 525
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  539.750000000000000000
                  108.479166666666700000
                  1389.062500000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = True
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = []
                Lines.Strings = (
                  'QRMemo1')
                ParentFont = False
                Transparent = False
                WordWrap = True
                FontSize = 8
              end
              object QRLabel17: TQRLabel
                Left = 5
                Top = 41
                Width = 158
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  13.229166666666670000
                  108.479166666666700000
                  418.041666666666700000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Observa'#231#245'es...........................:'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
            end
            object QRBand3: TQRBand
              Left = 38
              Top = 373
              Width = 740
              Height = 26
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
                68.791666666666670000
                1957.916666666667000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              BandType = rbPageFooter
              object QRShape3: TQRShape
                Left = 4
                Top = 3
                Width = 765
                Height = 3
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  7.937500000000000000
                  10.583333333333330000
                  7.937500000000000000
                  2024.062500000000000000)
                Brush.Color = clBlack
                Shape = qrsRectangle
                VertAdjust = 0
              end
              object QRLabel12: TQRLabel
                Left = 5
                Top = 6
                Width = 65
                Height = 20
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  52.916666666666670000
                  13.229166666666670000
                  15.875000000000000000
                  171.979166666666700000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'QRLabel12'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
            end
          end
        end
        object tsArquivoPedido: TTabSheet
          Caption = 'Montar Arquivo Pedido'
          ImageIndex = 3
          object pnArquivoPedido: TGroupBox
            Left = 0
            Top = 0
            Width = 789
            Height = 377
            ParentBackground = False
            TabOrder = 0
            object Panel4: TPanel
              Left = 2
              Top = 15
              Width = 785
              Height = 360
              Align = alClient
              BevelOuter = bvNone
              BorderWidth = 4
              TabOrder = 0
              object GroupBox8: TGroupBox
                Left = 4
                Top = 4
                Width = 777
                Height = 105
                Align = alTop
                Caption = 'Arquivos Fabricante'
                TabOrder = 0
                object Label23: TLabel
                  Left = 21
                  Top = 36
                  Width = 86
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Pasta do Arquivo:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                end
                object SpeedButton9: TSpeedButton
                  Left = 604
                  Top = 32
                  Width = 23
                  Height = 22
                  Glyph.Data = {
                    A2010000424DA201000000000000A20000002800000010000000100000000100
                    08000000000000010000120B0000120B00001B0000001B00000000000000FFFF
                    FF00FF00FF009B390B009C3A0D009B3A0C009C3B0D00CC670100D06A0000DD88
                    2E00EBA45A00FFCF9200307C1A002C7E1A00307F1C0030801D002F811E002F83
                    20002E8622002E8723002C8D28002D8C28002C8F2A002C912B002C942F002C92
                    2D002B96300002020702020206060606060202020202020207070708060B0A09
                    0602020202020202070202020306040506020202020202020702020202020202
                    02020202020202020702020206060606060202020202020207070707060B0A09
                    0602020202020202070202020306040506020202020202020702020202020202
                    02020202020202020702020206060606060202020202020207070707060B0A09
                    0602020202020202070202020306040506020D0C020206060606060202020202
                    02020E0F0202060B0A0906020202020210141716130E03060405060202020202
                    10151A18120E0202020202020202020202021919020202020202020202020202
                    020211110202}
                  OnClick = SpeedButton9Click
                end
                object Edit2: TEdit
                  Left = 112
                  Top = 33
                  Width = 493
                  Height = 21
                  TabOrder = 0
                  Text = 'Edit2'
                end
                object BitBtn11: TBitBtn
                  Left = 325
                  Top = 60
                  Width = 75
                  Height = 25
                  Hint = 'Gravar itens do pedido em arquivo texto'
                  Caption = '&Concluir'
                  TabOrder = 1
                  OnClick = BitBtn11Click
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
              object GroupBox6: TGroupBox
                Left = 4
                Top = 214
                Width = 777
                Height = 105
                Align = alTop
                Caption = 'Marcar Pedido para Empresa Externa'
                TabOrder = 1
                object BitBtn9: TBitBtn
                  Left = 287
                  Top = 24
                  Width = 203
                  Height = 25
                  Caption = 'Marcar Pedido para Produ'#231#227'o'
                  TabOrder = 0
                  Glyph.Data = {
                    56010000424D5601000000000000560000002800000010000000100000000100
                    08000000000000010000120B0000120B0000080000000800000000000000FFFF
                    FF00FF00FF007A2D0600E79D5700AC8E4E0079B048009EC19D00020202020202
                    0202020202020202020202020202020202020202020202020202030303030202
                    0202030303030202020203070503020000020307050302000002030604030202
                    0202030604030202020203030303020202020303030302020202020202020202
                    0202020202020202020202020202020202020202020202020202020202020202
                    0202020202020202020202020202020202020202020202020202030303030202
                    0202030303030202020203070503020000020307050302000002030604030202
                    0202030604030202020203030303020202020303030302020202020202020202
                    0202020202020202020202020202020202020202020202020202}
                end
                object BitBtn10: TBitBtn
                  Left = 287
                  Top = 55
                  Width = 203
                  Height = 25
                  Caption = 'Desmarcar Pedido para Produ'#231#227'o'
                  TabOrder = 1
                  Glyph.Data = {
                    5A010000424D5A010000000000005A0000002800000010000000100000000100
                    08000000000000010000120B0000120B0000090000000900000000000000FFFF
                    FF00FF00FF00CACACA00BCBCBC00A6A6A600A5A5A50071717100303030000202
                    0202020202020202020202020202020202020202020202020202020202020707
                    0707020202020707070702020202070305070208080207030507020808020706
                    0407020202020706040702020202070707070202020207070707020202020202
                    0202020202020202020202020202020202020202020202020202020202020202
                    0202020202020202020202020202020202020202020202020202020202020707
                    0707020202020707070702020202070305070208080207030507020808020706
                    0407020202020706040702020202070707070202020207070707020202020202
                    020202020202020202020202020202020202020202020202020202020202}
                end
              end
              object GroupBox9: TGroupBox
                Left = 4
                Top = 109
                Width = 777
                Height = 105
                Align = alTop
                Caption = 'Arquivo no Layout Hw Sistemas'
                TabOrder = 2
                object Label24: TLabel
                  Left = 21
                  Top = 36
                  Width = 86
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Pasta do Arquivo:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                end
                object SpeedButton10: TSpeedButton
                  Left = 604
                  Top = 32
                  Width = 23
                  Height = 22
                  Glyph.Data = {
                    A2010000424DA201000000000000A20000002800000010000000100000000100
                    08000000000000010000120B0000120B00001B0000001B00000000000000FFFF
                    FF00FF00FF009B390B009C3A0D009B3A0C009C3B0D00CC670100D06A0000DD88
                    2E00EBA45A00FFCF9200307C1A002C7E1A00307F1C0030801D002F811E002F83
                    20002E8622002E8723002C8D28002D8C28002C8F2A002C912B002C942F002C92
                    2D002B96300002020702020206060606060202020202020207070708060B0A09
                    0602020202020202070202020306040506020202020202020702020202020202
                    02020202020202020702020206060606060202020202020207070707060B0A09
                    0602020202020202070202020306040506020202020202020702020202020202
                    02020202020202020702020206060606060202020202020207070707060B0A09
                    0602020202020202070202020306040506020D0C020206060606060202020202
                    02020E0F0202060B0A0906020202020210141716130E03060405060202020202
                    10151A18120E0202020202020202020202021919020202020202020202020202
                    020211110202}
                  OnClick = SpeedButton10Click
                end
                object Edit1: TEdit
                  Left = 112
                  Top = 33
                  Width = 493
                  Height = 21
                  TabOrder = 0
                  Text = 'Edit2'
                end
                object BitBtn13: TBitBtn
                  Left = 325
                  Top = 60
                  Width = 75
                  Height = 25
                  Hint = 'Gravar itens do pedido em arquivo texto'
                  Caption = '&Concluir'
                  TabOrder = 1
                  OnClick = BitBtn13Click
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
              object BitBtn7: TBitBtn
                Left = 355
                Top = 325
                Width = 75
                Height = 25
                Hint = 'Sair da tela de pedido'
                Caption = '&Voltar'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 3
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
        object tsSelecionaGradeProd: TTabSheet
          Caption = 'tsSelecionaGradeProd'
          ImageIndex = 5
          object ScrollBox4: TScrollBox
            Left = 0
            Top = 0
            Width = 787
            Height = 551
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
                    OnDblClick = DBGrid1DblClick
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
        object tsLancamento: TTabSheet
          Caption = 'tsLancamento'
          ImageIndex = 6
          object PageControl2: TPageControl
            Left = -4
            Top = 0
            Width = 469
            Height = 321
            ActivePage = tsLancParcelas
            TabOrder = 0
            object tsLancParcelas: TTabSheet
              Caption = 'tsLancParcelas'
              ImageIndex = 1
              object pnLancParcelas: TPanel
                Left = 0
                Top = 0
                Width = 461
                Height = 293
                Align = alClient
                BevelOuter = bvNone
                TabOrder = 0
                object Panel10: TPanel
                  Left = 0
                  Top = 0
                  Width = 461
                  Height = 68
                  Align = alTop
                  TabOrder = 0
                  object Label30: TLabel
                    Left = 11
                    Top = 22
                    Width = 24
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Valor'
                  end
                  object Label31: TLabel
                    Left = 168
                    Top = 22
                    Width = 44
                    Height = 13
                    Caption = 'Parcelas:'
                  end
                  object edcreditoQtdeParcelas: TSpinEdit
                    Left = 218
                    Top = 18
                    Width = 41
                    Height = 22
                    MaxValue = 99
                    MinValue = 0
                    TabOrder = 1
                    Value = 0
                  end
                  object GroupBox10: TGroupBox
                    Left = 265
                    Top = -2
                    Width = 193
                    Height = 40
                    Caption = 'Outras Formas'
                    TabOrder = 2
                    object edcreditoCondicaoPagamento: TComboBox
                      Left = 4
                      Top = 13
                      Width = 181
                      Height = 21
                      Style = csDropDownList
                      DropDownCount = 10
                      ItemHeight = 13
                      TabOrder = 0
                    end
                  end
                  object edCreditoValorCredito: TEditMoeda
                    Left = 41
                    Top = 18
                    Width = 121
                    Height = 21
                    Alignment = taRightJustify
                    TabOrder = 0
                    FormatReal = fMoney
                    FormatSize = '10.2'
                  end
                  object btGerar: TBitBtn
                    Left = 315
                    Top = 40
                    Width = 79
                    Height = 25
                    Hint = 'Gerar'
                    Caption = '&Gerar'
                    TabOrder = 3
                    OnClick = btGerarClick
                    Glyph.Data = {
                      36050000424D3605000000000000360400002800000010000000100000000100
                      08000000000000010000430B0000430B000000010000000100008C5A5A009C6B
                      6B00A57B73000000840084848400B58C8C0039529C00395AAD004A6BBD005A73
                      C600C6C6C6006384CE00F7E7CE00F7EFDE00FFF7E700FFFFEF00FF00FF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00101010070606
                      0606060606060607101010100805000000000000000000000710101008050D0D
                      0D0D0D0D0D0D0D000610101008050D040404040404040D000610101008050D0C
                      0C0C0C0C0C0C0D000610101008050D040404040404040D000610101008050D0D
                      0D0D0D0D0D0D0D010610101008050E0E030D0A03030A0E010610101009050F0F
                      030F030F0F030F010610101009050F0F030F0F0F0F030F020610101009050F0F
                      030F0303030A0F02061010100B0511030311031111111105061010100B051111
                      0311030303031105061010100B0511111111111111111105061010100B050505
                      050505050505050507101010100B090808080808080808081010}
                  end
                end
                object Panel11: TPanel
                  Left = 0
                  Top = 68
                  Width = 461
                  Height = 198
                  Align = alClient
                  Caption = 'Panel11'
                  TabOrder = 1
                  object GroupBox11: TGroupBox
                    Left = 1
                    Top = 1
                    Width = 459
                    Height = 196
                    Align = alClient
                    Caption = 'Condi'#231#245'es de Pagamento'
                    TabOrder = 0
                    object ListBox1: TListBox
                      Left = 2
                      Top = 15
                      Width = 455
                      Height = 179
                      Align = alClient
                      ItemHeight = 13
                      TabOrder = 0
                      OnDblClick = ListBox1DblClick
                    end
                    object ListBox2: TListBox
                      Left = 152
                      Top = 48
                      Width = 121
                      Height = 97
                      ItemHeight = 13
                      TabOrder = 1
                      Visible = False
                    end
                  end
                end
                object Panel12: TPanel
                  Left = 0
                  Top = 266
                  Width = 461
                  Height = 27
                  Align = alBottom
                  TabOrder = 2
                  object btSalvar: TBitBtn
                    Left = 1
                    Top = 1
                    Width = 459
                    Height = 25
                    Hint = 'Salvar'
                    HelpType = htKeyword
                    Align = alBottom
                    Caption = '&Salvar'
                    TabOrder = 0
                    OnClick = btSalvarClick
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
            end
            object tsLancEditParcelas: TTabSheet
              Caption = 'tsLancEditParcelas'
              ImageIndex = 2
              object pnLancEditParcelas: TPanel
                Left = 0
                Top = 0
                Width = 461
                Height = 118
                Align = alTop
                TabOrder = 0
                object Panel7: TPanel
                  Left = 1
                  Top = 1
                  Width = 459
                  Height = 75
                  Align = alClient
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  TabOrder = 0
                  object Label32: TLabel
                    Left = 17
                    Top = 16
                    Width = 58
                    Height = 13
                    Caption = 'Documento:'
                  end
                  object Label34: TLabel
                    Left = 95
                    Top = 16
                    Width = 59
                    Height = 13
                    Caption = 'Vencimento:'
                  end
                  object Label35: TLabel
                    Left = 174
                    Top = 16
                    Width = 28
                    Height = 13
                    Caption = 'Valor:'
                  end
                  object edCrDoc: TEdit
                    Left = 17
                    Top = 35
                    Width = 72
                    Height = 21
                    TabOrder = 0
                  end
                  object edCrVenc: TMaskEdit
                    Left = 95
                    Top = 35
                    Width = 72
                    Height = 21
                    EditMask = '!99/99/0000;1;_'
                    MaxLength = 10
                    TabOrder = 1
                    Text = '  /  /    '
                  end
                  object mValorParcelaCr: TEditMoeda
                    Left = 174
                    Top = 35
                    Width = 121
                    Height = 21
                    Alignment = taRightJustify
                    TabOrder = 2
                    FormatReal = fMoney
                    FormatSize = '10.2'
                  end
                end
                object Panel9: TPanel
                  Left = 1
                  Top = 76
                  Width = 459
                  Height = 41
                  Align = alBottom
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  TabOrder = 1
                  object SpeedButton14: TSpeedButton
                    Left = 47
                    Top = 6
                    Width = 86
                    Height = 25
                    Caption = '&OK'
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
                    OnClick = SpeedButton14Click
                  end
                  object SpeedButton15: TSpeedButton
                    Left = 139
                    Top = 6
                    Width = 86
                    Height = 25
                    Caption = '&Cancela'
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
                    OnClick = SpeedButton15Click
                  end
                end
              end
            end
          end
        end
        object tsPendencias: TTabSheet
          Caption = 'tsPendencias'
          ImageIndex = 7
          object pnItensPendentes: TPanel
            Left = 3
            Top = 3
            Width = 785
            Height = 545
            BevelKind = bkTile
            BevelOuter = bvNone
            BorderWidth = 6
            Caption = 'Informe o per'#237'odo acima e clique em "Pesquisar"'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            object Panel8: TPanel
              Left = 6
              Top = 6
              Width = 769
              Height = 27
              Align = alTop
              BevelKind = bkTile
              BevelOuter = bvNone
              Caption = 'Mercadorias pendentes de recebimento'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 0
            end
            object gridPendencias: TDBGrid
              Left = 6
              Top = 82
              Width = 769
              Height = 412
              Align = alClient
              DataSource = dsPendencias
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
              TabOrder = 1
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
              Visible = False
              OnKeyDown = gridPendenciasKeyDown
              OnKeyUp = gridPendenciasKeyUp
              OnTitleClick = gridPendenciasTitleClick
            end
            object Panel13: TPanel
              Left = 6
              Top = 494
              Width = 769
              Height = 41
              Align = alBottom
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 2
              object BitBtn14: TBitBtn
                Left = 312
                Top = 6
                Width = 140
                Height = 25
                Caption = '&Exportar para Excel'
                TabOrder = 0
                OnClick = BitBtn14Click
                Glyph.Data = {
                  36030000424D3603000000000000360000002800000010000000100000000100
                  18000000000000030000C30E0000C30E00000000000000000000FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FF83838363636363636363636363636363636363636363
                  6363636363636363636363636363636363848484FF00FFFF00FF666666FFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FF656565FF00FFFF00FF666666FFFFFF95959563636363636363636363636363
                  63637E7E7EFF00FFFF00FFFF00FFFF00FFAEAEAEFF00FFFF00FF666666FFFFFF
                  636363FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0F0F0FF00FFAB2D81AB2D81AB2D
                  81FF00FFFF00FFFF00FF666666FFFFFF636363FFFFFFFFFFFFC8813CC47A33C9
                  8C53CF9E6EFF00FFFF00FFAB2D81AB2D81AB2D81FF00FFFF00FF666666FFFFFF
                  636363FFFFFFFFFFFFE8BB8FCFA77FFF00FFFF00FFFF00FFFF00FFFF00FFAB2D
                  81AB2D81AB2D81FF00FF666666FFFFFF636363FFFFFFFFFFFFFFFFFFEAEAEAB0
                  2F85B02F85AD2F82AB2D81AB2D81AB2D81AB2D81AB2D81AB2D81666666FFFFFF
                  959595636363636363636363B8B8B8AB2D81AB2D81AB2D81AB2D81AB2D81AB2D
                  81AB2D81AB2D81AB2D81666666FFFFFF636363FFFFFFFFFFFFFFFFFFF1F1F1FF
                  00FFFF00FFFF00FFFF00FFFF00FFAB2D81AB2D81AB2D81FF00FF666666FFFFFF
                  636363FFFFFFFFFFFFC8813CC47A33C88A4ECE9965FF00FFFF00FFAB2D81AB2D
                  81AB2D81FF00FFFF00FF666666FFFFFF636363FFFFFFFFFFFFE8BB8FC1762CC2
                  7830E5CBB2FF00FFAB2D81AB2D81AB2D81FF00FFFF00FFFF00FF666666FFFFFF
                  636363FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F9FF00FFFF00FFFF00FFFF00
                  FFACACACFF00FFFF00FF666666FFFFFF95959563636363636363636363636363
                  6363636363636363636363A0A0A0FFFFFF656565FF00FFFF00FF666666FFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FF656565FF00FFFF00FF83838363636363636363636363636363636363636363
                  6363636363636363636363636363636363848484FF00FFFF00FF}
              end
              object BitBtn15: TBitBtn
                Left = 680
                Top = 6
                Width = 75
                Height = 25
                Caption = '&Sair'
                TabOrder = 1
                OnClick = BitBtn15Click
                Glyph.Data = {
                  36030000424D3603000000000000360000002800000010000000100000000100
                  18000000000000030000C30E0000C30E00000000000000000000FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FF5367CF334CCC334CCC334CCC334CCC33
                  4CCC334CCC334CCC334CCC334CCC334CCC5367CFFF00FFFF00FFFF00FF5367CF
                  334CCC334CCC334CCC334CCC334CCC334CCC334CCC334CCC334CCC334CCC334C
                  CC334CCC5367CFFF00FFFF00FF334CCC334CCC334CCC334CCC334CCC334CCC33
                  4CCC334CCC334CCC334CCC334CCC334CCC334CCC334CCCFF00FFFF00FF334CCC
                  334CCC334CCC334CCC7E8DDE3850CD334CCC334CCC3850CD7E8EDE334CCC334C
                  CC334CCC334CCCFF00FFFF00FF334CCC334CCC334CCC7A8BDDFFFFFFC2C9EF38
                  50CD3850CDC1C8EFFFFFFF7C8CDE334CCC334CCC334CCCFF00FFFF00FF334CCC
                  334CCC334CCC364FCCBCC4EEFFFFFFC2C9EFC1C8EFFFFFFFBDC5EE374FCD334C
                  CC334CCC334CCCFF00FFFF00FF334CCC334CCC334CCC334CCC364FCCBCC4EEFF
                  FFFFFFFFFFBDC5EE374FCD334CCC334CCC334CCC334CCCFF00FFFF00FF334CCC
                  334CCC334CCC334CCC3850CDC1C8EFFFFFFFFFFFFFC2C9EF3850CD334CCC334C
                  CC334CCC334CCCFF00FFFF00FF334CCC334CCC334CCC3850CDC1C8EFFFFFFFBD
                  C5EEBCC4EEFFFFFFC2C9EF3850CD334CCC334CCC334CCCFF00FFFF00FF334CCC
                  334CCC334CCC798ADDFFFFFFBDC5EE374FCD364FCCBCC4EEFFFFFF7B8BDE334C
                  CC334CCC334CCCFF00FFFF00FF334CCC334CCC334CCC334CCC7788DD374FCD33
                  4CCC334CCC364FCC7888DD334CCC334CCC334CCC334CCCFF00FFFF00FF334CCC
                  334CCC334CCC334CCC334CCC334CCC334CCC334CCC334CCC334CCC334CCC334C
                  CC334CCC334CCCFF00FFFF00FF5266CF334CCC334CCC334CCC334CCC334CCC33
                  4CCC334CCC334CCC334CCC334CCC334CCC334CCC5266CFFF00FFFF00FFFF00FF
                  5368CF334CCC334CCC334CCC334CCC334CCC334CCC334CCC334CCC334CCC334C
                  CC5368CFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
              end
              object BitBtn20: TBitBtn
                Left = 14
                Top = 6
                Width = 131
                Height = 25
                Hint = 
                  'Remove o registro da tabela de pendencias marcando-o como recebi' +
                  'do - [SUG026]'
                Caption = 'Remover pendencia'
                TabOrder = 2
                OnClick = BitBtn20Click
                Glyph.Data = {
                  46020000424D4602000000000000460100002800000010000000100000000100
                  08000000000000010000120B0000120B0000440000004400000000000000FFFF
                  FF00FF00FF00FFFEFE00811E0000FFFCFB00BD4C0000FFFCFA00FFFBF800FFFA
                  F600FFF8F200FFEBD800FFEEDD00FFF0E100FFF7EF00FFFBF700FEDEBA00FEDE
                  BB00FEE1C100FEE1C200FEE3C500FEE3C600FEE5C900FFE6CB00FEE6CB00FEE7
                  CE00FEEAD400FFEDD900FFEEDC00FEEEDC00FFEFDE00FFF0E000FFF3E600FEF4
                  E900FFF7EE00FEE0BC00FEE0BD00FEE1BD00FEE1BF00FEE2C200FEE5C700FEE7
                  CC00FFE9CF00FEE9CF00FFEAD100FEE9D100FEEBD400FEEBD500FFF4E700FEF3
                  E600FFF6EB00FFF8F000FFFAF400FEE5C500FEEDD700FEF0DE00FFF2E100FEF2
                  E300FEF4E700FFFCF800FEF6EB00FFFAF200FEFAF300FFFEFC00FFFEFB00FFFF
                  FE00004B00004BFE820002020202020202020202020202020202020202020202
                  020606060606060606060202020202020206352B1D31333B0101020202020202
                  020613172F0D32090301020202020202020625282C0C300A0701020242020604
                  0404040404040404040402424202062327162D1B1F3A0E090501424342020611
                  12282A361E20223E07030242420206102615291A1C39323D0841020242020604
                  04040404040404040404020202020202020627182E37210A0701020202020202
                  020626282D1C200E0F3F02020202020202062414190B383C3440020202020202
                  0206060606060606060602020202020202020202020202020202020202020202
                  02020202020202020202}
              end
            end
            object GroupBox12: TGroupBox
              Left = 6
              Top = 33
              Width = 769
              Height = 49
              Align = alTop
              Caption = 'Per'#237'odo'
              TabOrder = 3
              object Label41: TLabel
                Left = 32
                Top = 20
                Width = 57
                Height = 13
                Caption = 'Data Inicial:'
              end
              object Label42: TLabel
                Left = 176
                Top = 20
                Width = 48
                Height = 13
                Caption = 'Data Final'
              end
              object edDataIni: TMaskEdit
                Left = 95
                Top = 17
                Width = 74
                Height = 21
                EditMask = '!99/99/0000;1;_'
                MaxLength = 10
                TabOrder = 0
                Text = '  /  /    '
              end
              object edDataFim: TMaskEdit
                Left = 230
                Top = 17
                Width = 75
                Height = 21
                EditMask = '!99/99/0000;1;_'
                MaxLength = 10
                TabOrder = 1
                Text = '  /  /    '
              end
              object btPesquisar: TBitBtn
                Left = 344
                Top = 14
                Width = 81
                Height = 25
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
              object rbRazaoSocial: TRadioButton
                Left = 488
                Top = 27
                Width = 89
                Height = 17
                Caption = 'Raz'#227'o Social'
                TabOrder = 3
              end
              object rbNomeFantasia: TRadioButton
                Left = 488
                Top = 10
                Width = 98
                Height = 17
                Caption = 'Nome Fantasia'
                Checked = True
                TabOrder = 4
                TabStop = True
              end
            end
          end
        end
        object tsObservacao: TTabSheet
          Caption = 'tsObservacao'
          ImageIndex = 8
          object pnObservacao: TPanel
            Left = 3
            Top = 0
            Width = 673
            Height = 257
            Caption = 'pnObservacao'
            TabOrder = 0
            object DBMemo4: TDBMemo
              Left = 1
              Top = 1
              Width = 671
              Height = 214
              Align = alClient
              DataField = 'OBS'
              DataSource = dtmSugestaoCompras.dsPedidoCompra
              ScrollBars = ssVertical
              TabOrder = 0
            end
            object Panel74: TPanel
              Left = 1
              Top = 215
              Width = 671
              Height = 41
              Align = alBottom
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 1
              object BitBtn63: TBitBtn
                Left = 298
                Top = 6
                Width = 75
                Height = 25
                Caption = 'OK'
                TabOrder = 0
                OnClick = BitBtn63Click
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
          end
        end
        object tsImprimirRel: TTabSheet
          Caption = 'tsImprimirRel'
          ImageIndex = 9
          object pnImpressao: TPanel
            Left = 40
            Top = 24
            Width = 465
            Height = 169
            BevelKind = bkTile
            BevelOuter = bvNone
            BorderWidth = 6
            TabOrder = 0
            OnEnter = pnImpressaoEnter
            object GroupBox14: TGroupBox
              Left = 6
              Top = 6
              Width = 449
              Height = 112
              Align = alClient
              Caption = 'Relat'#243'rio'
              TabOrder = 0
              object RadioButtonGrafico: TRadioButton
                Left = 16
                Top = 24
                Width = 113
                Height = 17
                Caption = 'Gr'#225'fico'
                TabOrder = 0
                OnClick = RadioButtonGraficoClick
              end
              object RadioButtonMatricial: TRadioButton
                Left = 202
                Top = 24
                Width = 113
                Height = 17
                Caption = 'Matricial'
                TabOrder = 1
                OnClick = RadioButtonGraficoClick
              end
              object CheckBoxExibirLocacaoPeso: TCheckBox
                Left = 16
                Top = 76
                Width = 369
                Height = 17
                Caption = 'Imprimir loca'#231#227'o, loca'#231#227'o 1, peso bruto e peso l'#237'quido'
                TabOrder = 2
                OnClick = CheckBoxExibirLocacaoPesoClick
              end
              object CheckBoxExibirIpiMva: TCheckBox
                Left = 16
                Top = 53
                Width = 369
                Height = 17
                Caption = 'Imprimir IPI, MVA e Frete'
                TabOrder = 3
                OnClick = CheckBoxExibirIpiMvaClick
              end
            end
            object Panel67: TPanel
              Left = 6
              Top = 118
              Width = 449
              Height = 41
              Align = alBottom
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 1
              object BitBtn55: TBitBtn
                Left = 144
                Top = 6
                Width = 75
                Height = 25
                Hint = 'Imprimir'
                Caption = '&Imprimir'
                TabOrder = 0
                OnClick = BitBtn55Click
                Glyph.Data = {
                  42020000424D4202000000000000420000002800000010000000100000000100
                  10000300000000020000120B0000120B00000000000000000000007C0000E003
                  00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                  1F7C1F7C1F7C1F7C1F7C4B294B296C2D8D31AE35EF3DF03DCF39AD358C316B2D
                  4B291F7C1F7C1F7C1F7C9245DE7BFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
                  92451F7C1F7CB75D3146EF3DD65AFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F1963
                  EF3D3146B75D1042F75E734E6C2D5A6B5A6B5A6B5A6B5A6B5A6B5A6B5A6BF03D
                  734EF75E104210429452AE358610861086108610861086108610861086108610
                  AE35945210423146F75EAE358610861086108610861086108610861086108610
                  AE35F75E3146524ABD7795523246324632463246324632463246324632463246
                  9552BD77524A3146BD77F85ED85AD85AD85AD85AD85AD85AD85AD85AD85AD85A
                  F85EBD7731469A69524AB656D75AD75AD75AD75AD75AD75AD75AD75AD75AD75A
                  B656524A9A691F7C1F7C1F7CAD357B6FDE7BDE7BDE7BDE7BFF7FFF7F7B6FAD35
                  1F7C1F7C1F7C1F7C1F7C1F7CCE397B6FDE7BDE7BDE7BDE7BDE7BFF7F7B6FCE39
                  1F7C1F7C1F7C1F7C1F7C1F7CF03D7B6FDE7BDE7BDE7BDE7BDE7BDE7B7B6FF03D
                  1F7C1F7C1F7C1F7C1F7C1F7C1F7C7B6FDE7BDE7BDE7BDE7BDE7BDE7B7B6F1F7C
                  1F7C1F7C1F7C1F7C1F7C1F7C1F7C186339673967396739673967396718631F7C
                  1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                  1F7C1F7C1F7C}
              end
              object BitBtn56: TBitBtn
                Left = 225
                Top = 6
                Width = 75
                Height = 25
                Hint = 'Cancelar'
                Caption = '&Cancelar'
                TabOrder = 1
                OnClick = BitBtn56Click
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
            end
          end
        end
      end
    end
    inherited PanelFlash: TPanel
      Left = 802
      Top = 0
      Height = 582
      ExplicitLeft = 802
      ExplicitTop = 0
      ExplicitHeight = 582
      inherited bMarketingHW: TBitBtn
        Top = 560
        ExplicitTop = 560
      end
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 582
    ExplicitTop = 582
  end
  inherited pnStatusProcessamento: TPanel
    inherited lbTextoProcessamento: TLabel
      Width = 477
      Height = 21
    end
  end
  inherited PopupMenu2: TPopupMenu
    Left = 646
    Top = 75
  end
  inherited Timer1: TTimer
    Left = 382
    Top = 59
  end
  inherited ApplicationEventsPadrao: TApplicationEvents
    Left = 566
    Top = 51
  end
  object SaveTextFileDialog1: TSaveTextFileDialog
    DefaultExt = '*.txt'
    Filter = 'Texto simples (*.txt)|*.Txt'
    InitialDir = 'C:\'
    Options = [ofOverwritePrompt, ofExtensionDifferent, ofEnableSizing]
    Left = 422
    Top = 50
  end
  object dsSelecionaGradeProd: TDataSource
    Left = 611
    Top = 373
  end
  object dsPendencias: TDataSource
    AutoEdit = False
    DataSet = dtmSugestaoCompras.cdsPendPed
    Left = 688
    Top = 72
  end
end
