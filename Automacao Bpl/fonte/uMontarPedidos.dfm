object FrmMontarPedidos: TFrmMontarPedidos
  Left = 0
  Top = 0
  Caption = 'Montar pedidos produtos em estoque'
  ClientHeight = 397
  ClientWidth = 585
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 585
    Height = 346
    Align = alClient
    Caption = 'Montar requisi'#231#245'es'
    TabOrder = 0
    object Label1: TLabel
      Left = 21
      Top = 165
      Width = 98
      Height = 26
      Alignment = taRightJustify
      Caption = 'Quantidade m'#225'xima itens por pedido:'
      WordWrap = True
    end
    object lbCliente: TLabel
      Left = 82
      Top = 34
      Width = 37
      Height = 13
      Caption = 'Cliente:'
    end
    object Label2: TLabel
      Left = 69
      Top = 69
      Width = 50
      Height = 13
      Alignment = taRightJustify
      Caption = 'Vendedor:'
    end
    object Label3: TLabel
      Left = 47
      Top = 138
      Width = 72
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tipo de Venda:'
    end
    object Label4: TLabel
      Left = 6
      Top = 199
      Width = 113
      Height = 26
      Alignment = taRightJustify
      Caption = 'Pre'#231'o venda (produtos sem pre'#231'o de varejo):'
      WordWrap = True
    end
    object Label5: TLabel
      Left = 69
      Top = 103
      Width = 50
      Height = 13
      Alignment = taRightJustify
      Caption = 'Cond Pag:'
    end
    object EditHwCodCliente: TEditHw
      Left = 125
      Top = 31
      Width = 63
      Height = 21
      TabOrder = 0
      Text = '                 0'
      OnExit = EditHwCodClienteExit
      OnKeyDown = EditHwCodClienteKeyDown
      Formato = fInteger
      FormatSize = '0.2'
    end
    object EditHwCodVendedor: TEditHw
      Left = 125
      Top = 66
      Width = 63
      Height = 21
      TabOrder = 2
      Text = '                 0'
      OnExit = EditHwCodVendedorExit
      OnKeyDown = EditHwCodVendedorKeyDown
      Formato = fInteger
      FormatSize = '0.2'
    end
    object ComboBoxTipoVenda: TComboBox
      Left = 125
      Top = 135
      Width = 195
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 6
    end
    object EditHwQtdeMaxItens: TEditHw
      Left = 125
      Top = 168
      Width = 63
      Height = 21
      TabOrder = 7
      Text = '                 0'
      Formato = fInteger
      FormatSize = '0.2'
    end
    object EditHwPrecoVenda: TEditHw
      Left = 125
      Top = 203
      Width = 63
      Height = 21
      TabOrder = 8
      Text = '                 0'
      Formato = fNumber
      FormatSize = '0.2'
    end
    object RadioGroupUtilizarEstoque: TRadioGroup
      Left = 2
      Top = 235
      Width = 581
      Height = 48
      Align = alBottom
      Caption = 'Utilizar estoque'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'F'#237'sico'
        'Dispon'#237'vel')
      TabOrder = 9
    end
    object EditNomeCliente: TEdit
      Left = 194
      Top = 31
      Width = 374
      Height = 21
      Enabled = False
      TabOrder = 1
      Text = 'EditNomeCliente'
    end
    object EditNomeVendedor: TEdit
      Left = 194
      Top = 66
      Width = 374
      Height = 21
      Enabled = False
      TabOrder = 3
      Text = 'EditNomeVendedor'
    end
    object RadioGroupOrdenarItens: TRadioGroup
      Left = 2
      Top = 283
      Width = 581
      Height = 61
      Align = alBottom
      Caption = 'Ordenar itens'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Por Descri'#231#227'o'
        'Por N'#250'mero Fabricante')
      TabOrder = 10
    end
    object EditHwCodCondPag: TEditHw
      Left = 125
      Top = 100
      Width = 63
      Height = 21
      TabOrder = 4
      Text = '                 0'
      OnExit = EditHwCodCondPagExit
      OnKeyDown = EditHwCodCondPagKeyDown
      Formato = fInteger
      FormatSize = '0.2'
    end
    object EditDescricaoCondPag: TEdit
      Left = 194
      Top = 100
      Width = 374
      Height = 21
      Enabled = False
      TabOrder = 5
      Text = 'EditDescricaoCondPag'
    end
  end
  object ProgressBar1: TProgressBar
    Left = 0
    Top = 380
    Width = 585
    Height = 17
    Align = alBottom
    TabOrder = 2
  end
  object Panel1: TPanel
    Left = 0
    Top = 346
    Width = 585
    Height = 34
    Align = alBottom
    BevelKind = bkTile
    BevelOuter = bvNone
    TabOrder = 1
    object BitBtnGerarPedidos: TBitBtn
      Left = 234
      Top = 3
      Width = 112
      Height = 25
      Hint = 'Montar pedidos - [VND271]'
      Caption = 'Montar pedidos'
      Default = True
      TabOrder = 0
      OnClick = BitBtnGerarPedidosClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object BitBtnSair: TBitBtn
      Left = 459
      Top = 3
      Width = 109
      Height = 25
      Hint = 'Sair'
      Caption = '&Sair'
      TabOrder = 1
      OnClick = BitBtnSairClick
      Kind = bkCancel
    end
  end
end
