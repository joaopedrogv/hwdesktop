object Form3: TForm3
  Left = 0
  Top = 0
  Caption = 'Form3'
  ClientHeight = 539
  ClientWidth = 1048
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 82
    Width = 1048
    Height = 3
    Cursor = crVSplit
    Align = alTop
    ExplicitWidth = 416
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1048
    Height = 41
    Align = alTop
    BorderWidth = 6
    TabOrder = 0
    object BitBtn1: TBitBtn
      Left = 7
      Top = 7
      Width = 122
      Height = 27
      Align = alLeft
      Caption = 'Load from CVS file'
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 129
      Top = 7
      Width = 48
      Height = 27
      Align = alLeft
      Caption = 'Central'
      TabOrder = 1
      OnClick = BitBtn2Click
    end
    object BitBtn3: TBitBtn
      Left = 177
      Top = 7
      Width = 48
      Height = 27
      Align = alLeft
      Caption = 'Notify'
      TabOrder = 2
      OnClick = BitBtn3Click
    end
    object BitBtn4: TBitBtn
      Left = 225
      Top = 7
      Width = 64
      Height = 27
      Align = alLeft
      Caption = 'OpenNotify'
      TabOrder = 3
      OnClick = BitBtn4Click
    end
    object BitBtn5: TBitBtn
      Left = 289
      Top = 7
      Width = 80
      Height = 27
      Align = alLeft
      Caption = 'CentralCnpj<>'
      TabOrder = 4
      OnClick = BitBtn5Click
    end
    object BitBtn6: TBitBtn
      Left = 369
      Top = 7
      Width = 75
      Height = 27
      Align = alLeft
      Caption = 'CentralCLAt0'
      TabOrder = 5
    end
    object BitBtn7: TBitBtn
      Left = 444
      Top = 7
      Width = 75
      Height = 27
      Align = alLeft
      Caption = 'CentralUsAt0'
      TabOrder = 6
    end
    object BitBtn8: TBitBtn
      Left = 519
      Top = 7
      Width = 75
      Height = 27
      Align = alLeft
      Caption = 'NotifyCnpj<>'
      TabOrder = 7
    end
    object BitBtn9: TBitBtn
      Left = 594
      Top = 7
      Width = 71
      Height = 27
      Align = alLeft
      Caption = 'NotifyCLAt0'
      TabOrder = 8
    end
    object BitBtn10: TBitBtn
      Left = 665
      Top = 7
      Width = 69
      Height = 27
      Align = alLeft
      Caption = 'NotifyUsAt0'
      TabOrder = 9
    end
    object BitBtn11: TBitBtn
      Left = 734
      Top = 7
      Width = 75
      Height = 27
      Align = alLeft
      Caption = 'OpenCnpj<>'
      TabOrder = 10
      OnClick = BitBtn11Click
    end
    object BitBtn12: TBitBtn
      Left = 809
      Top = 7
      Width = 75
      Height = 27
      Align = alLeft
      Caption = 'NotifyUSDB'
      TabOrder = 11
      OnClick = BitBtn12Click
    end
    object BitBtn13: TBitBtn
      Left = 884
      Top = 7
      Width = 75
      Height = 27
      Align = alLeft
      Caption = 'OpenUsAt0'
      TabOrder = 12
    end
    object BitBtn16: TBitBtn
      Left = 965
      Top = 10
      Width = 51
      Height = 25
      Caption = 'LoadCSV2'
      TabOrder = 13
      OnClick = BitBtn16Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 85
    Width = 1048
    Height = 413
    Align = alClient
    BorderWidth = 6
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 7
      Top = 7
      Width = 1034
      Height = 344
      Align = alClient
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = DBGrid1DblClick
    end
    object pnMasks: TPanel
      Left = 7
      Top = 351
      Width = 1034
      Height = 55
      Align = alBottom
      BorderWidth = 6
      TabOrder = 1
      object sBox: TScrollBox
        Left = 7
        Top = 7
        Width = 1020
        Height = 41
        Align = alClient
        BevelInner = bvNone
        BevelOuter = bvNone
        BorderStyle = bsNone
        TabOrder = 0
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 498
    Width = 1048
    Height = 41
    Align = alBottom
    BorderWidth = 6
    TabOrder = 2
  end
  object Panel4: TPanel
    Left = 0
    Top = 41
    Width = 1048
    Height = 41
    Align = alTop
    BorderWidth = 6
    TabOrder = 3
    object BitBtn14: TBitBtn
      Left = 7
      Top = 7
      Width = 122
      Height = 27
      Align = alLeft
      Caption = 'Notifica'#231#245'esERP'
      TabOrder = 0
      OnClick = BitBtn14Click
    end
    object Memo1: TMemo
      Left = 204
      Top = 7
      Width = 837
      Height = 27
      Align = alClient
      Lines.Strings = (
        'Memo1')
      TabOrder = 1
    end
    object BitBtn15: TBitBtn
      Left = 129
      Top = 7
      Width = 75
      Height = 27
      Align = alLeft
      Caption = 'Teste tag'
      TabOrder = 2
      OnClick = BitBtn15Click
    end
  end
  object FileOpenDialog1: TFileOpenDialog
    FavoriteLinks = <>
    FileTypes = <>
    Options = []
    Left = 424
    Top = 200
  end
  object DataSource1: TDataSource
    Left = 960
    Top = 272
  end
end
