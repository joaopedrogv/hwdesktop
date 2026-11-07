object frmFilterFrame: TfrmFilterFrame
  Left = 0
  Top = 0
  Width = 420
  Height = 60
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  ParentColor = False
  ParentFont = False
  TabOrder = 0
  object SplitterCampo: TSplitter
    Left = 207
    Top = 0
    Height = 33
    ExplicitHeight = 27
  end
  object pnCampo: TPanel
    Left = 0
    Top = 0
    Width = 207
    Height = 33
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 0
    object lbCampo: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 55
      Height = 27
      Align = alLeft
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Campo'
      Layout = tlCenter
      ExplicitLeft = 4
      ExplicitTop = 7
      ExplicitHeight = 13
    end
    object cbCampo: TComboBox
      AlignWithMargins = True
      Left = 64
      Top = 3
      Width = 140
      Height = 21
      Align = alClient
      Style = csDropDownList
      TabOrder = 0
      OnChange = CampoChange
    end
  end
  object pnCondicao: TPanel
    Left = 210
    Top = 0
    Width = 210
    Height = 33
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitWidth = 390
    object lbCondicao: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 55
      Height = 27
      Align = alLeft
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Condi'#231#227'o'
      Layout = tlCenter
    end
    object cbCondicao: TComboBox
      AlignWithMargins = True
      Left = 64
      Top = 3
      Width = 143
      Height = 21
      Align = alClient
      Style = csDropDownList
      TabOrder = 0
      OnChange = CondicaoChange
      ExplicitWidth = 323
    end
  end
  object pnValores: TPanel
    Left = 0
    Top = 33
    Width = 420
    Height = 27
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    ExplicitWidth = 600
    object SplitterConteudo: TSplitter
      Left = 207
      Top = 0
      Height = 27
      Visible = False
      ExplicitLeft = 200
      ExplicitHeight = 29
    end
    object spliterBtn: TSplitter
      Left = 362
      Top = 0
      Height = 27
      Align = alRight
      ExplicitLeft = 210
    end
    object pnConteudo1: TPanel
      Left = 0
      Top = 0
      Width = 207
      Height = 27
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 0
      object lbValor1: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 55
        Height = 21
        Align = alLeft
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Conte'#250'do'
        Layout = tlCenter
      end
      object edValor1: TMaskEdit
        AlignWithMargins = True
        Left = 64
        Top = 3
        Width = 140
        Height = 21
        Align = alClient
        TabOrder = 0
        Text = ''
        OnExit = ValorExit
      end
    end
    object pnConteudo2: TPanel
      Left = 210
      Top = 0
      Width = 152
      Height = 27
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      Visible = False
      ExplicitWidth = 336
      object lbValor2: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 55
        Height = 21
        Align = alLeft
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Conte'#250'do at'#233
        Layout = tlCenter
        ExplicitLeft = 210
      end
      object edValor2: TMaskEdit
        AlignWithMargins = True
        Left = 64
        Top = 3
        Width = 85
        Height = 21
        Align = alClient
        TabOrder = 0
        Text = ''
        OnExit = ValorExit
        ExplicitWidth = 323
      end
    end
    object pnBotoes: TPanel
      Left = 365
      Top = 0
      Width = 55
      Height = 27
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 2
      ExplicitLeft = 617
      object btnAdicionar: TSpeedButton
        AlignWithMargins = True
        Left = 24
        Top = 3
        Width = 28
        Height = 21
        Align = alRight
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -14
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000120B0000120B00000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEF9FCF2
          BCDDF2BCDDFEF9FCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFF2BCDDD42691D42691F2BCDDFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1B7DAD4
          2691D42691F1B7DAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFF1B7DAD42691D42691F1B7DAFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1B7DAD4
          2691D42691F1B7DAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFD
          F9C1E3F9BCE0F8BBDFF8BADFED98CAD454A1D353A0EC96C9F7B7DBF7B6DAF7B5
          D9F7BADBFEF9FCFFFFFFFFFFFFFAC3E5EE3BA9ED3AA7ED38A5EC36A3EC34A1EB
          319EEA2F9CE92D9AE92B97E82995E72793E62491F7BBDCFFFFFFFFFFFFFAC4E6
          EF40ADEF3EABEE3CA9ED3AA7ED38A5EC36A3EC34A1EB329FEA309CE92D9AE92B
          98E82996F8BCDEFFFFFFFFFFFFFFFAFDFBC5E7FAC0E4FABFE4FABFE3F693CFEE
          3AA7ED38A5F490CCF9BBE0F8BBDFF8BADEF8BEE0FEF9FCFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFABFE4EF3EACEE3CAAF9BEE2FFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAC1E5F0
          42B0F041AEFABFE3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFBC2E7F147B4F145B2FAC0E5FFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBC8EAF3
          4BB9F249B7FBC6E8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFAFDFCC8EBFBC8EAFFFAFDFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        ParentFont = False
        OnClick = AdicionarClick
        ExplicitLeft = 0
        ExplicitTop = 2
        ExplicitHeight = 25
      end
      object lblContador: TLabel
        AlignWithMargins = True
        Left = -2
        Top = 3
        Width = 20
        Height = 21
        Cursor = crHandPoint
        Align = alRight
        Alignment = taCenter
        Caption = '+23'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsUnderline]
        ParentFont = False
        Layout = tlCenter
        OnClick = ContadorClick
        ExplicitLeft = 65
        ExplicitHeight = 13
      end
    end
  end
end
