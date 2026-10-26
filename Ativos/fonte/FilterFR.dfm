object FilterFrame: TFilterFrame
  Left = 0
  Top = 0
  Width = 427
  Height = 46
  TabOrder = 0
  TabStop = True
  object SplitterCampo: TSplitter
    Left = 137
    Top = 0
    Height = 46
  end
  object spliterMeio: TSplitter
    Left = 241
    Top = 0
    Height = 46
    ExplicitLeft = 240
  end
  object pnCampo: TPanel
    Left = 0
    Top = 0
    Width = 137
    Height = 46
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 0
    object lbCampo: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 131
      Height = 13
      Align = alTop
      Caption = 'Campo'
      ExplicitWidth = 33
    end
    object edCampos: TComboBox
      AlignWithMargins = True
      Left = 3
      Top = 22
      Width = 131
      Height = 21
      Align = alTop
      ItemHeight = 13
      TabOrder = 0
      Text = 'edCampos'
      OnChange = edCamposChange
      OnExit = edCamposExit
    end
  end
  object pnCondicao: TPanel
    Left = 140
    Top = 0
    Width = 101
    Height = 46
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 1
    object lbCondicao: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 95
      Height = 13
      Align = alTop
      Caption = 'Condi'#231#227'o'
      ExplicitWidth = 44
    end
    object edCondicao: TComboBox
      AlignWithMargins = True
      Left = 3
      Top = 22
      Width = 95
      Height = 21
      Align = alTop
      ItemHeight = 13
      TabOrder = 0
      Text = 'Igual'
      OnChange = edCondicaoChange
      OnExit = edCondicaoExit
      Items.Strings = (
        'Come'#231'a'
        'Esta contido'
        'Igual'
        'Diferente'
        'Maior'
        'Maior ou Igual'
        'Menor'
        'Menor ou Igual')
    end
  end
  object pnConteudos: TPanel
    Left = 244
    Top = 0
    Width = 183
    Height = 46
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object SplitterConteudo: TSplitter
      Left = 75
      Top = 0
      Height = 46
      Align = alRight
      Visible = False
      ExplicitLeft = 78
    end
    object spliterBtn: TSplitter
      Left = 153
      Top = 0
      Height = 46
      Align = alRight
      ExplicitLeft = 156
    end
    object pnConteudo1: TPanel
      Left = 0
      Top = 0
      Width = 75
      Height = 46
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      object lbConteudo1: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 69
        Height = 13
        Align = alTop
        Caption = 'Conte'#250'do'
        ExplicitWidth = 47
      end
      object edConteudo1: TMaskEdit
        AlignWithMargins = True
        Left = 3
        Top = 22
        Width = 69
        Height = 21
        Align = alTop
        TabOrder = 0
        Text = 'edConteudo1'
        OnExit = edConteudo1Exit
      end
    end
    object pnConteudo2: TPanel
      Left = 78
      Top = 0
      Width = 75
      Height = 46
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 1
      Visible = False
      object lbConteudo2: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 69
        Height = 13
        Align = alTop
        Caption = 'Data Final'
        ExplicitWidth = 48
      end
      object edConteudo2: TMaskEdit
        AlignWithMargins = True
        Left = 3
        Top = 22
        Width = 69
        Height = 21
        Align = alTop
        EditMask = '!99/99/0000;1;_'
        MaxLength = 10
        TabOrder = 0
        Text = '  /  /    '
        OnExit = edConteudo2Exit
      end
    end
    object pnBtns: TPanel
      Left = 156
      Top = 0
      Width = 27
      Height = 46
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 2
      object lbCountFiltros: TLabel
        AlignWithMargins = True
        Left = 0
        Top = 3
        Width = 27
        Height = 13
        Cursor = crHandPoint
        Margins.Left = 0
        Margins.Right = 0
        Align = alTop
        Alignment = taCenter
        Caption = '+23'
        OnClick = lbCountFiltrosClick
        ExplicitWidth = 20
      end
      object btnAddFilter: TSpeedButton
        AlignWithMargins = True
        Left = 2
        Top = 20
        Width = 23
        Height = 22
        Cursor = crHandPoint
        Margins.Left = 2
        Margins.Top = 1
        Margins.Right = 2
        Margins.Bottom = 0
        Align = alTop
        Flat = True
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
        OnClick = btnAddFilterClick
        ExplicitLeft = 6
        ExplicitTop = 23
        ExplicitWidth = 27
      end
    end
  end
end
