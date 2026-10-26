object FrameGrupoIbsCbsCompraGovItem: TFrameGrupoIbsCbsCompraGovItem
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
    object lbAliqIbsUf: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 125
      Height = 21
      Align = alLeft
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Al'#237'quota IBS UF'
      Layout = tlCenter
    end
    object lbVIbsUF: TLabel
      AlignWithMargins = True
      Left = 215
      Top = 3
      Width = 90
      Height = 21
      Align = alLeft
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Valor IBS UF'
      Layout = tlCenter
    end
    object lbPIbsMun: TLabel
      AlignWithMargins = True
      Left = 392
      Top = 3
      Width = 90
      Height = 21
      Align = alLeft
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Al'#237'quota IBS Mun'
      Layout = tlCenter
    end
    object lbVIbsMun: TLabel
      AlignWithMargins = True
      Left = 569
      Top = 3
      Width = 90
      Height = 21
      Align = alLeft
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Vlr IBS Munic'#237'pio'
      Layout = tlCenter
      ExplicitLeft = 534
    end
    object edAliqIbsUf: TEditHw
      AlignWithMargins = True
      Left = 134
      Top = 3
      Width = 75
      Height = 21
      Align = alLeft
      TabOrder = 0
      Text = '           0,0000'
      Formato = fNumber
      FormatSize = '0.4'
    end
    object edVIbsUF: TEditHw
      AlignWithMargins = True
      Left = 311
      Top = 3
      Width = 75
      Height = 21
      Align = alLeft
      TabOrder = 1
      Text = '               0,00'
      Formato = fNumber
      FormatSize = '0.2'
    end
    object edAliqIbsMun: TEditHw
      AlignWithMargins = True
      Left = 488
      Top = 3
      Width = 75
      Height = 21
      Align = alLeft
      TabOrder = 2
      Text = '           0,0000'
      Formato = fNumber
      FormatSize = '0.4'
    end
    object edVIbsMun: TEditHw
      AlignWithMargins = True
      Left = 665
      Top = 3
      Width = 75
      Height = 21
      Align = alLeft
      TabOrder = 3
      Text = '               0,00'
      Formato = fNumber
      FormatSize = '0.2'
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
    object lbPCbs: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 125
      Height = 21
      Align = alLeft
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Al'#237'quota CBS'
      Layout = tlCenter
    end
    object lbVCbs: TLabel
      AlignWithMargins = True
      Left = 215
      Top = 3
      Width = 90
      Height = 21
      Align = alLeft
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Valor CBS'
      Layout = tlCenter
      ExplicitLeft = 392
    end
    object edAliqCbs: TEditHw
      AlignWithMargins = True
      Left = 134
      Top = 3
      Width = 75
      Height = 21
      Align = alLeft
      TabOrder = 0
      Text = '           0,0000'
      Formato = fNumber
      FormatSize = '0.4'
    end
    object edVCbs: TEditHw
      AlignWithMargins = True
      Left = 311
      Top = 3
      Width = 75
      Height = 21
      Align = alLeft
      TabOrder = 1
      Text = '               0,00'
      Formato = fNumber
      FormatSize = '0.2'
    end
  end
end
