object frmdbtojson: Tfrmdbtojson
  Left = 0
  Top = 0
  Caption = 'frmdbtojson'
  ClientHeight = 526
  ClientWidth = 904
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 35
    Width = 904
    Height = 466
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'PedVenda'
      object ed_nped: TMaskEdit
        Left = 3
        Top = 16
        Width = 54
        Height = 21
        TabOrder = 0
        Text = '1681'
      end
      object ed_tipo: TMaskEdit
        Left = 63
        Top = 16
        Width = 42
        Height = 21
        TabOrder = 1
        Text = 'REQ'
      end
      object BitBtn2: TBitBtn
        Left = 111
        Top = 14
        Width = 98
        Height = 25
        Caption = 'pedvenda'
        TabOrder = 2
        OnClick = BitBtn2Click
      end
      object BitBtn3: TBitBtn
        Left = 111
        Top = 45
        Width = 98
        Height = 25
        Caption = 'pedvenda_prod'
        TabOrder = 3
        OnClick = BitBtn3Click
      end
    end
    object tsSaida: TTabSheet
      Caption = 'tsSaida'
      ImageIndex = 1
      object Splitter1: TSplitter
        Left = 0
        Top = 193
        Width = 896
        Height = 3
        Cursor = crVSplit
        Align = alTop
        ExplicitTop = 89
        ExplicitWidth = 384
      end
      object memoJsonEncode: TMemo
        Left = 0
        Top = 0
        Width = 896
        Height = 193
        Align = alTop
        Lines.Strings = (
          'memoJsonEncode')
        TabOrder = 0
      end
      object memoJsonFormat: TMemo
        Left = 0
        Top = 196
        Width = 896
        Height = 242
        Align = alClient
        Lines.Strings = (
          'memoJsonFormat')
        TabOrder = 1
      end
    end
  end
  object BitBtn1: TBitBtn
    Left = 0
    Top = 501
    Width = 904
    Height = 25
    Align = alBottom
    Caption = 'Sair'
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 904
    Height = 35
    Align = alTop
    BorderWidth = 6
    Caption = 'Panel1'
    TabOrder = 2
    object ed_db: TMaskEdit
      Left = 7
      Top = 7
      Width = 832
      Height = 21
      Align = alClient
      TabOrder = 0
      Text = 'joaopedro-pc:D:\Hw\bases\producao\Hwauto.fdb'
      OnExit = ed_dbExit
    end
    object ed_cod_empresa: TMaskEdit
      Left = 839
      Top = 7
      Width = 58
      Height = 21
      Align = alRight
      TabOrder = 1
      Text = '1'
    end
  end
end
