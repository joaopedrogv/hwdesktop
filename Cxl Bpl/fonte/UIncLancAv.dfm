object FrmincLancAv: TFrmincLancAv
  Left = 219
  Top = 88
  Caption = 'Lan'#231'amento Avulso...'
  ClientHeight = 250
  ClientWidth = 586
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 14
    Top = 12
    Width = 100
    Height = 13
    Caption = 'Tipo de Lan'#231'amento:'
  end
  object Label2: TLabel
    Left = 26
    Top = 41
    Width = 88
    Height = 13
    Caption = 'Data Lan'#231'amento:'
  end
  object Label3: TLabel
    Left = 42
    Top = 68
    Width = 72
    Height = 13
    Caption = 'N. Documento:'
  end
  object Label4: TLabel
    Left = 69
    Top = 95
    Width = 45
    Height = 13
    Caption = 'Hist'#243'rico:'
  end
  object Label5: TLabel
    Left = 86
    Top = 122
    Width = 28
    Height = 13
    Caption = 'Valor:'
  end
  object Label6: TLabel
    Left = 67
    Top = 149
    Width = 47
    Height = 13
    Caption = 'N. Conta:'
  end
  object Label7: TLabel
    Left = 69
    Top = 175
    Width = 45
    Height = 13
    Caption = 'Controle:'
  end
  object Label48: TLabel
    Left = 199
    Top = 45
    Width = 136
    Height = 13
    Caption = 'Tipo da Conta a pagar: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label22: TLabel
    Left = 199
    Top = 28
    Width = 102
    Height = 13
    Caption = 'Depart da Conta: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label21: TLabel
    Left = 199
    Top = 12
    Width = 98
    Height = 13
    Caption = 'Grupo da Conta: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object ComboBox1: TComboBox
    Left = 120
    Top = 11
    Width = 73
    Height = 19
    Style = csOwnerDrawFixed
    ItemHeight = 13
    TabOrder = 0
    OnExit = ComboBox1Exit
    Items.Strings = (
      'S'
      'E')
  end
  object MaskEdit1: TMaskEdit
    Left = 120
    Top = 38
    Width = 73
    Height = 21
    Enabled = False
    EditMask = '!99/99/0000;1;_'
    MaxLength = 10
    TabOrder = 1
    Text = '  /  /    '
  end
  object Edit1: TEdit
    Left = 120
    Top = 65
    Width = 145
    Height = 21
    TabOrder = 2
  end
  object Edit2: TEdit
    Left = 120
    Top = 92
    Width = 249
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 3
  end
  object EditMoeda1: TEditMoeda
    Left = 120
    Top = 119
    Width = 121
    Height = 21
    Alignment = taRightJustify
    TabOrder = 4
    FormatReal = fNumber
    FormatSize = '10.2'
  end
  object ComboBox2: TComboBox
    Left = 120
    Top = 146
    Width = 352
    Height = 19
    Style = csOwnerDrawFixed
    ItemHeight = 13
    TabOrder = 5
    OnExit = ComboBox2Exit
  end
  object ComboBox3: TComboBox
    Left = 120
    Top = 172
    Width = 352
    Height = 19
    Style = csOwnerDrawFixed
    ItemHeight = 13
    TabOrder = 6
  end
  object Panel3: TPanel
    Left = 0
    Top = 215
    Width = 586
    Height = 35
    Align = alBottom
    BevelKind = bkTile
    BevelOuter = bvNone
    TabOrder = 7
    object BitBtn6: TBitBtn
      Left = 604
      Top = 1
      Width = 75
      Height = 25
      Caption = '&Sair'
      TabOrder = 2
      Glyph.Data = {
        2E020000424D2E020000000000002E0100002800000010000000100000000100
        08000000000000010000120B0000120B00003E0000003E00000000000000FFFF
        FF00FF00FF00BB410000BB420000FFF6EF00E69C5900E69D5900E9A36200FFF4
        EA00FFF8F200FECA9500FFCE9C00FFD4A900FEEBD800FEF0E200FFF2E500FFF3
        E700FFFBF700FECE9C00FED3A500FED5AA00FEDAB400FFDCB600FEDDB800FEDD
        BA00FFE3C500FEE2C400FFE5C900FFE6CA00FEE5CA00FFEBD500FEF3E700FFDA
        AD00FFEAD100FFFAF400FFD8A700FFD9A900FFDAAB00FFE1B800FFE7C700FEEE
        D900FFFBF600FFDCAC00FFE1B500FFE7C400FFEFD700FFEAC200FFFAEA00FFFE
        FB00FFFFFA00FFFFFE00315EFF002A56FF00123BFF00153DFF001841FF001A44
        FF001D47FF00072BFF00001EFF00000D66000202020202020202020202020202
        0202020202020202020202020202020202020204040404040404040404040402
        020202040132302E28272125242F04020202020401050F221B1614130B260402
        0202020401310A101F1A170D0C2B04020202020401013323110E1C18152C0402
        02020204010101332A20291D192D040202020204010101010112093D1E2E043D
        020202040101010101013D363D013D3C3D020204080606060606073D373D3B3D
        0202020203040404040404043D383D0202020202020202020202023D353D393D
        020202020202020202023D343D023D3A3D020202020202020202023D0202023D
        020202020202020202020202020202020202}
    end
    object BitBtn1: TBitBtn
      Left = 204
      Top = 3
      Width = 75
      Height = 25
      Caption = 'OK'
      Default = True
      TabOrder = 0
      OnClick = BitBtn1Click
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
    object BitBtn2: TBitBtn
      Left = 302
      Top = 3
      Width = 75
      Height = 25
      TabOrder = 1
      Kind = bkCancel
    end
  end
end
