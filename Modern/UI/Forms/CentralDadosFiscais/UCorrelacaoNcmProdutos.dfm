inherited FrmCorrelacaoNcmProdutos: TFrmCorrelacaoNcmProdutos
  Left = 0
  Top = 0
  Caption = 'Rela'#231#227'o de NCM'#39's Produtos'
  ClientHeight = 524
  ClientWidth = 860
  Position = poScreenCenter
  OnClose = FormClose
  OnDestroy = FormDestroy
  ExplicitWidth = 868
  ExplicitHeight = 558
  PixelsPerInch = 96
  TextHeight = 13
  object pnTop: TPanel
    Left = 0
    Top = 0
    Width = 860
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
    TabOrder = 0
    object Label1: TLabel
      AlignWithMargins = True
      Left = 9
      Top = 3
      Width = 355
      Height = 16
      Margins.Left = 9
      Margins.Right = 9
      Align = alTop
      Alignment = taCenter
      Caption = 'Rela'#231#227'o de NCM'#39's Irregulares do cadastro de Produtos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
    end
  end
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 25
    Width = 854
    Height = 455
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object Splitter1: TSplitter
      Left = 227
      Top = 0
      Height = 455
      ExplicitLeft = 424
      ExplicitTop = 176
      ExplicitHeight = 100
    end
    object pnNcms: TPanel
      Left = 0
      Top = 0
      Width = 227
      Height = 455
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 0
      inline DBGridFrameNcms: TDBGridFrame
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 221
        Height = 424
        Align = alClient
        TabOrder = 0
        TabStop = True
        ExplicitLeft = 3
        ExplicitTop = 3
        ExplicitWidth = 221
        ExplicitHeight = 424
        inherited DBGrid: TDBGrid
          Width = 221
          Height = 396
        end
        inherited pnBtns: TPanel
          Width = 221
          ExplicitWidth = 221
        end
      end
      object pnLinksNCM: TPanel
        Left = 0
        Top = 430
        Width = 227
        Height = 25
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
        object linkVincularUsandoNCM: TLabel
          AlignWithMargins = True
          Left = 18
          Top = 0
          Width = 154
          Height = 13
          Cursor = crHandPoint
          Margins.Left = 18
          Margins.Top = 0
          Margins.Right = 9
          Margins.Bottom = 0
          Align = alLeft
          Caption = 'Corrigir NCM'#39's selecionados'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlCenter
          OnClick = linkVincularUsandoNCMClick
        end
      end
    end
    object pnProdutos: TPanel
      Left = 230
      Top = 0
      Width = 624
      Height = 455
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      inline DBGridFrameProdutos: TDBGridFrame
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 618
        Height = 424
        Align = alClient
        TabOrder = 0
        TabStop = True
        ExplicitLeft = 3
        ExplicitTop = 3
        ExplicitWidth = 618
        ExplicitHeight = 424
        inherited DBGrid: TDBGrid
          Width = 618
          Height = 396
        end
        inherited pnBtns: TPanel
          Width = 618
          ExplicitWidth = 618
        end
      end
      object Panel2: TPanel
        Left = 0
        Top = 430
        Width = 624
        Height = 25
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
        object Label2: TLabel
          AlignWithMargins = True
          Left = 18
          Top = 0
          Width = 172
          Height = 13
          Cursor = crHandPoint
          Margins.Left = 18
          Margins.Top = 0
          Margins.Right = 9
          Margins.Bottom = 0
          Align = alLeft
          Caption = 'Corrigir Produtos selecionados'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlCenter
        end
      end
    end
  end
  object pnBottom: TPanel
    Left = 0
    Top = 483
    Width = 860
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
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
end
