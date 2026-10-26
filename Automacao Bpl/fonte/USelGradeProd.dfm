inherited FrmSelGradeProd: TFrmSelGradeProd
  Left = 180
  Top = 173
  AutoSize = True
  BorderIcons = []
  Caption = 'Selecionar Grade do produto'
  ClientHeight = 239
  ClientWidth = 864
  Position = poOwnerFormCenter
  ExplicitWidth = 872
  ExplicitHeight = 273
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 204
    Width = 864
    Height = 35
    Align = alBottom
    BevelKind = bkTile
    BevelOuter = bvNone
    TabOrder = 1
    object Label1: TLabel
      Left = 88
      Top = 11
      Width = 228
      Height = 13
      Caption = 'Informe a quantidade a baixar da grade '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object BitBtn1: TBitBtn
      Left = 388
      Top = 4
      Width = 88
      Height = 25
      Hint = 'Assumir'
      Caption = '&Assume'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = BitBtn1Click
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
    object EditMoeda1: TEditMoeda
      Left = 620
      Top = 8
      Width = 88
      Height = 21
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      Visible = False
      FormatReal = fNumber
      FormatSize = '10.2'
      OnEnter = EditMoeda1Enter
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 864
    Height = 204
    Align = alClient
    DataSource = DataSource1
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
    OnKeyDown = DBGrid1KeyDown
  end
  object DataSource1: TDataSource
    Left = 568
    Top = 240
  end
end
