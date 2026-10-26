inherited FrmResumoProdutosGruposFiscais: TFrmResumoProdutosGruposFiscais
  Caption = 'Resumo dos Grupos Fiscais nos Produtos'
  ClientHeight = 298
  ClientWidth = 616
  ExplicitWidth = 624
  ExplicitHeight = 332
  PixelsPerInch = 96
  TextHeight = 13
  object ScrollBox1: TScrollBox
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 610
    Height = 245
    Align = alClient
    BorderStyle = bsNone
    TabOrder = 0
    object pnTop: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 604
      Height = 25
      Align = alTop
      AutoSize = True
      BevelOuter = bvNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object Label1: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 382
        Height = 19
        Align = alTop
        Alignment = taCenter
        Caption = 'Classificar Grupos Fiscais dos NCM'#39's / Produtos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
      end
    end
    object pnLog: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 201
      Width = 604
      Height = 41
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 1
      object edLog: TMemo
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 598
        Height = 35
        Align = alClient
        Lines.Strings = (
          'edLog')
        ReadOnly = True
        TabOrder = 0
      end
    end
    object pnAnexosGruposFiscaisImpSel: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 73
      Width = 604
      Height = 33
      Align = alTop
      BevelEdges = [beTop]
      BevelKind = bkTile
      BevelOuter = bvNone
      BorderWidth = 1
      TabOrder = 2
      object lbQtdeAnexosISelDisplay: TLabel
        AlignWithMargins = True
        Left = 4
        Top = 4
        Width = 380
        Height = 13
        Align = alLeft
        Caption = 
          'Produtos compatives com 1 anexo e podem ser configurador automat' +
          'icamente:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Layout = tlCenter
      end
      object lbQtdeAnexosISel: TLabel
        AlignWithMargins = True
        Left = 390
        Top = 4
        Width = 21
        Height = 13
        Align = alLeft
        Caption = '999'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
      end
      object btCriarGruposFiscaisImpSel: TSpeedButton
        AlignWithMargins = True
        Left = 417
        Top = 4
        Width = 96
        Height = 23
        Cursor = crHandPoint
        Align = alLeft
        Caption = 'Continuar'
      end
    end
    object Panel2: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 34
      Width = 604
      Height = 33
      Align = alTop
      BevelEdges = [beTop]
      BevelKind = bkTile
      BevelOuter = bvNone
      BorderWidth = 1
      TabOrder = 3
      object Label2: TLabel
        AlignWithMargins = True
        Left = 4
        Top = 4
        Width = 133
        Height = 23
        Align = alLeft
        Caption = 'Tipo de tributo selecionado:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Layout = tlCenter
        ExplicitHeight = 13
      end
      object Label3: TLabel
        AlignWithMargins = True
        Left = 143
        Top = 4
        Width = 140
        Height = 23
        Align = alLeft
        Caption = 'IBSCBS Imposto Seletivo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
        ExplicitHeight = 13
      end
      object Label5: TLabel
        AlignWithMargins = True
        Left = 289
        Top = 4
        Width = 160
        Height = 23
        Align = alLeft
        Caption = 'Listar dados revisados a partir de'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Layout = tlCenter
        ExplicitHeight = 13
      end
      object DateTimePicker2: TDateTimePicker
        AlignWithMargins = True
        Left = 455
        Top = 5
        Width = 104
        Height = 21
        Margins.Top = 4
        Margins.Bottom = 4
        Align = alLeft
        Date = 46013.373444918980000000
        Time = 46013.373444918980000000
        TabOrder = 0
      end
    end
    object Panel3: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 112
      Width = 604
      Height = 33
      Align = alTop
      BevelEdges = [beTop]
      BevelKind = bkTile
      BevelOuter = bvNone
      BorderWidth = 1
      TabOrder = 4
      object Label4: TLabel
        AlignWithMargins = True
        Left = 4
        Top = 4
        Width = 414
        Height = 13
        Align = alLeft
        Caption = 
          'Produtos compatives com mais de 1 anexos e precisam ser analisad' +
          'os individualmente:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Layout = tlCenter
      end
      object Label6: TLabel
        AlignWithMargins = True
        Left = 424
        Top = 4
        Width = 21
        Height = 13
        Align = alLeft
        Caption = '999'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
      end
      object SpeedButton1: TSpeedButton
        AlignWithMargins = True
        Left = 451
        Top = 4
        Width = 96
        Height = 23
        Cursor = crHandPoint
        Align = alLeft
        Caption = 'Continuar'
        ExplicitLeft = 417
      end
    end
    object Panel4: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 151
      Width = 604
      Height = 33
      Align = alTop
      BevelEdges = [beTop]
      BevelKind = bkTile
      BevelOuter = bvNone
      BorderWidth = 1
      TabOrder = 5
      object Label8: TLabel
        AlignWithMargins = True
        Left = 4
        Top = 4
        Width = 287
        Height = 13
        Align = alLeft
        Caption = 'Produtos incompatives com o atual grupo fiscal selecionado:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Layout = tlCenter
      end
      object Label9: TLabel
        AlignWithMargins = True
        Left = 297
        Top = 4
        Width = 21
        Height = 13
        Align = alLeft
        Caption = '999'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
      end
      object SpeedButton2: TSpeedButton
        AlignWithMargins = True
        Left = 324
        Top = 4
        Width = 96
        Height = 23
        Cursor = crHandPoint
        Align = alLeft
        Caption = 'Continuar'
        ExplicitLeft = 417
      end
    end
  end
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 254
    Width = 610
    Height = 41
    Align = alBottom
    BevelEdges = [beTop]
    BevelKind = bkTile
    BevelOuter = bvNone
    BorderWidth = 1
    TabOrder = 1
    object btSair: TBitBtn
      AlignWithMargins = True
      Left = 7
      Top = 7
      Width = 79
      Height = 25
      Margins.Left = 6
      Margins.Top = 6
      Margins.Right = 6
      Margins.Bottom = 6
      Align = alLeft
      Caption = ' Sair'
      TabOrder = 0
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
    object ProgressBar1: TProgressBar
      AlignWithMargins = True
      Left = 98
      Top = 7
      Width = 505
      Height = 25
      Margins.Left = 6
      Margins.Top = 6
      Margins.Right = 6
      Margins.Bottom = 6
      Align = alClient
      TabOrder = 1
    end
  end
end
