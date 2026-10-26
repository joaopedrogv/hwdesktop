object TribDFeIbsCbsGrupoCompraGovFrame: TTribDFeIbsCbsGrupoCompraGovFrame
  Left = 0
  Top = 0
  Width = 653
  Height = 54
  TabOrder = 0
  TabStop = True
  object pn1: TPanel
    Left = 0
    Top = 0
    Width = 653
    Height = 27
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitWidth = 743
    object lbAliqIbsUf: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 75
      Height = 21
      Align = alLeft
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Al'#237'quota IBS UF'
      Layout = tlCenter
    end
    object lbVIbsUF: TLabel
      AlignWithMargins = True
      Left = 165
      Top = 3
      Width = 75
      Height = 21
      Align = alLeft
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Valor IBS UF'
      Layout = tlCenter
    end
    object lbPIbsMun: TLabel
      AlignWithMargins = True
      Left = 327
      Top = 3
      Width = 75
      Height = 21
      Align = alLeft
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Al'#237'q IBS Mun'
      Layout = tlCenter
    end
    object lbVIbsMun: TLabel
      AlignWithMargins = True
      Left = 489
      Top = 3
      Width = 75
      Height = 21
      Align = alLeft
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Vlr IBS Munic'
      Layout = tlCenter
    end
    object edAliqIbsUf: TEditHw
      AlignWithMargins = True
      Left = 84
      Top = 3
      Width = 75
      Height = 21
      Align = alLeft
      TabOrder = 0
      Text = '0,0000'
      Formato = fNumber
      FormatSize = '0.4'
      ExplicitLeft = 134
    end
    object edVIbsUF: TEditHw
      AlignWithMargins = True
      Left = 246
      Top = 3
      Width = 75
      Height = 21
      Align = alLeft
      TabOrder = 1
      Text = '0,00'
      Formato = fNumber
      FormatSize = '0.2'
      ExplicitLeft = 311
    end
    object edAliqIbsMun: TEditHw
      AlignWithMargins = True
      Left = 408
      Top = 3
      Width = 75
      Height = 21
      Align = alLeft
      TabOrder = 2
      Text = '0,0000'
      Formato = fNumber
      FormatSize = '0.4'
      ExplicitLeft = 488
    end
    object edVIbsMun: TEditHw
      AlignWithMargins = True
      Left = 570
      Top = 3
      Width = 75
      Height = 21
      Align = alLeft
      TabOrder = 3
      Text = '0,00'
      Formato = fNumber
      FormatSize = '0.2'
      ExplicitLeft = 665
    end
  end
  object pn2: TPanel
    Left = 0
    Top = 27
    Width = 653
    Height = 27
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitWidth = 743
    object lbPCbs: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 75
      Height = 21
      Align = alLeft
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Al'#237'quota CBS'
      Layout = tlCenter
    end
    object lbVCbs: TLabel
      AlignWithMargins = True
      Left = 165
      Top = 3
      Width = 75
      Height = 21
      Align = alLeft
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Valor CBS'
      Layout = tlCenter
    end
    object edAliqCbs: TEditHw
      AlignWithMargins = True
      Left = 84
      Top = 3
      Width = 75
      Height = 21
      Align = alLeft
      TabOrder = 0
      Text = '0,0000'
      Formato = fNumber
      FormatSize = '0.4'
      ExplicitLeft = 134
    end
    object edVCbs: TEditHw
      AlignWithMargins = True
      Left = 246
      Top = 3
      Width = 75
      Height = 21
      Align = alLeft
      TabOrder = 1
      Text = '0,00'
      Formato = fNumber
      FormatSize = '0.2'
      ExplicitLeft = 311
    end
  end
end
