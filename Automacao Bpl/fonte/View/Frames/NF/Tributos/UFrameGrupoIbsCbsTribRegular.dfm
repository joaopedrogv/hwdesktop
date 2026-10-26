object FrameGrupoIbsCbsTribRegular: TFrameGrupoIbsCbsTribRegular
  Left = 0
  Top = 0
  Width = 743
  Height = 54
  TabOrder = 0
  TabStop = True
  object pn1: TPanel
    Left = 0
    Top = 0
    Width = 743
    Height = 27
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object lbCst: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 32
      Height = 21
      Align = alLeft
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'CST'
      Layout = tlCenter
    end
    object lbcClassTrib: TLabel
      AlignWithMargins = True
      Left = 80
      Top = 3
      Width = 48
      Height = 21
      Align = alLeft
      Alignment = taRightJustify
      Caption = 'cClassTrib'
      Layout = tlCenter
      ExplicitHeight = 13
    end
    object lbAliqIbsUF: TLabel
      AlignWithMargins = True
      Left = 215
      Top = 3
      Width = 90
      Height = 21
      Align = alLeft
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Al'#237'quota IBS UF'
      Layout = tlCenter
    end
    object lbValorIbsUf: TLabel
      AlignWithMargins = True
      Left = 392
      Top = 3
      Width = 90
      Height = 21
      Align = alLeft
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Valor IBS UF'
      Layout = tlCenter
      ExplicitLeft = 377
    end
    object lbAliqIbsMun: TLabel
      AlignWithMargins = True
      Left = 569
      Top = 3
      Width = 90
      Height = 21
      Align = alLeft
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Al'#237'quota IBS Mun'
      Layout = tlCenter
      ExplicitLeft = 554
    end
    object edCst: TMaskEdit
      AlignWithMargins = True
      Left = 41
      Top = 3
      Width = 33
      Height = 21
      Align = alLeft
      EditMask = '!999;1;_'
      MaxLength = 3
      TabOrder = 0
      Text = '   '
    end
    object edcClassTrib: TMaskEdit
      AlignWithMargins = True
      Left = 134
      Top = 3
      Width = 75
      Height = 21
      Align = alLeft
      EditMask = '000-000;0;_'
      MaxLength = 7
      TabOrder = 1
    end
    object edAliqIbsUF: TEditHw
      AlignWithMargins = True
      Left = 311
      Top = 3
      Width = 75
      Height = 21
      Align = alLeft
      TabOrder = 2
      Text = '           0,0000'
      Formato = fNumber
      FormatSize = '0.4'
    end
    object edValorIbsUf: TEditHw
      AlignWithMargins = True
      Left = 488
      Top = 3
      Width = 75
      Height = 21
      Align = alLeft
      TabOrder = 3
      Text = '               0,00'
      Formato = fNumber
      FormatSize = '0.2'
    end
    object edAliqIbsMun: TEditHw
      AlignWithMargins = True
      Left = 665
      Top = 3
      Width = 75
      Height = 21
      Align = alLeft
      TabOrder = 4
      Text = '           0,0000'
      Formato = fNumber
      FormatSize = '0.4'
    end
  end
  object pn2: TPanel
    Left = 0
    Top = 27
    Width = 743
    Height = 27
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object lbValorIbsMun: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 125
      Height = 21
      Align = alLeft
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Valor IBS Munic'#237'pio'
      Layout = tlCenter
    end
    object lbAliqCbs: TLabel
      AlignWithMargins = True
      Left = 215
      Top = 3
      Width = 90
      Height = 21
      Align = alLeft
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Al'#237'quota CBS'
      Layout = tlCenter
    end
    object lbValorCbs: TLabel
      AlignWithMargins = True
      Left = 392
      Top = 3
      Width = 90
      Height = 21
      Align = alLeft
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Valor CBS'
      Layout = tlCenter
      ExplicitLeft = 377
    end
    object edValorIbsMun: TEditHw
      AlignWithMargins = True
      Left = 134
      Top = 3
      Width = 75
      Height = 21
      Align = alLeft
      TabOrder = 0
      Text = '               0,00'
      Formato = fNumber
      FormatSize = '0.2'
    end
    object edAliqCbs: TEditHw
      AlignWithMargins = True
      Left = 311
      Top = 3
      Width = 75
      Height = 21
      Align = alLeft
      TabOrder = 1
      Text = '           0,0000'
      Formato = fNumber
      FormatSize = '0.4'
    end
    object edValorCbs: TEditHw
      AlignWithMargins = True
      Left = 488
      Top = 3
      Width = 75
      Height = 21
      Align = alLeft
      TabOrder = 2
      Text = '               0,00'
      Formato = fNumber
      FormatSize = '0.2'
    end
  end
end
