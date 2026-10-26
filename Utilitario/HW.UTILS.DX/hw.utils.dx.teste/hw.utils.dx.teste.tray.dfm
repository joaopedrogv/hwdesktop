object TFrmTesteTrayApi: TTFrmTesteTrayApi
  Left = 0
  Top = 0
  ActiveControl = ed_codemp
  Caption = 'TFrmTesteTrayApi'
  ClientHeight = 813
  ClientWidth = 1276
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 1276
    Height = 41
    Align = alTop
    BevelKind = bkTile
    BevelOuter = bvNone
    TabOrder = 0
    object Label2: TLabel
      Left = 2
      Top = 11
      Width = 42
      Height = 13
      Alignment = taRightJustify
      Caption = 'Cod Emp'
    end
    object Label3: TLabel
      Left = 119
      Top = 12
      Width = 76
      Height = 13
      Caption = 'Banco de dados'
    end
    object ed_codemp: TEdit
      Left = 49
      Top = 8
      Width = 64
      Height = 21
      TabOrder = 0
      Text = '1'
      OnExit = ed_databaseExit
    end
    object ed_database: TComboBox
      Left = 201
      Top = 8
      Width = 500
      Height = 21
      ItemIndex = 0
      TabOrder = 1
      Text = 'joaopedro-pc:D:\Hw\bases\tray\Hwauto.fdb'
      OnExit = ed_databaseExit
      Items.Strings = (
        'joaopedro-pc:D:\Hw\bases\tray\Hwauto.fdb'
        'joaopedro-pc:D:\Hw\bases\producao\Hwauto.fdb')
    end
    object ed_params: TEdit
      Left = 707
      Top = 8
      Width = 238
      Height = 21
      TabOrder = 2
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 41
    Width = 1276
    Height = 772
    Align = alClient
    TabOrder = 1
    object Splitter1: TSplitter
      Left = 1
      Top = 533
      Width = 1274
      Height = 3
      Cursor = crVSplit
      Align = alBottom
      ExplicitTop = 42
      ExplicitWidth = 640
    end
    object ed_log: TMemo
      Left = 1
      Top = 42
      Width = 1274
      Height = 491
      Align = alClient
      Lines.Strings = (
        'ed_log')
      ScrollBars = ssVertical
      TabOrder = 0
    end
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 1274
      Height = 41
      Align = alTop
      TabOrder = 1
      object BitBtn1: TBitBtn
        Left = 362
        Top = 5
        Width = 75
        Height = 25
        Caption = 'Categorias'
        TabOrder = 0
        OnClick = BitBtn1Click
      end
      object BitBtn2: TBitBtn
        Left = 443
        Top = 5
        Width = 75
        Height = 25
        Caption = 'Variacoes'
        TabOrder = 1
        OnClick = BitBtn2Click
      end
      object BitBtn3: TBitBtn
        Left = 151
        Top = 5
        Width = 124
        Height = 25
        Caption = 'Obj Consulta Variacoes'
        TabOrder = 2
        OnClick = BitBtn3Click
      end
      object BitBtn4: TBitBtn
        Left = 13
        Top = 5
        Width = 132
        Height = 25
        Caption = 'Obj Consulta Categorias'
        TabOrder = 3
        OnClick = BitBtn4Click
      end
      object BitBtn5: TBitBtn
        Left = 524
        Top = 5
        Width = 85
        Height = 25
        Caption = 'Caracteristicas'
        TabOrder = 4
        OnClick = BitBtn5Click
      end
      object BitBtn6: TBitBtn
        Left = 615
        Top = 5
        Width = 75
        Height = 25
        Caption = 'Produtos'
        TabOrder = 5
        OnClick = BitBtn6Click
      end
      object BitBtn7: TBitBtn
        Left = 760
        Top = 5
        Width = 145
        Height = 25
        Caption = 'Formulario Vinculos'
        TabOrder = 6
        OnClick = BitBtn7Click
      end
    end
    object ed_log_serv: TMemo
      Left = 1
      Top = 536
      Width = 1274
      Height = 235
      Align = alBottom
      Lines.Strings = (
        'ed_log_serv')
      ScrollBars = ssVertical
      TabOrder = 2
    end
  end
end
