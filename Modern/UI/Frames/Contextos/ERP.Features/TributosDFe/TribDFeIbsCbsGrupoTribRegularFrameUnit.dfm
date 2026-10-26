object TribDFeIbsCbsGrupoTribRegularFrame: TTribDFeIbsCbsGrupoTribRegularFrame
  Left = 0
  Top = 0
  Width = 650
  Height = 54
  TabOrder = 0
  TabStop = True
  object pn1: TPanel
    Left = 0
    Top = 0
    Width = 650
    Height = 27
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object lbcClassTrib: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 75
      Height = 21
      Align = alLeft
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Cst/cClassTrib'
      Layout = tlCenter
    end
    object lbAliqIbsUF: TLabel
      AlignWithMargins = True
      Left = 165
      Top = 3
      Width = 75
      Height = 21
      Align = alLeft
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Al'#237'quota IBS UF'
      Layout = tlCenter
    end
    object lbValorIbsUf: TLabel
      AlignWithMargins = True
      Left = 327
      Top = 3
      Width = 75
      Height = 21
      Align = alLeft
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Valor IBS UF'
      Layout = tlCenter
    end
    object lbAliqIbsMun: TLabel
      AlignWithMargins = True
      Left = 489
      Top = 3
      Width = 75
      Height = 21
      Align = alLeft
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Al'#237'q IBS Mun'
      Layout = tlCenter
    end
    object edCst: TMaskEdit
      AlignWithMargins = True
      Left = 84
      Top = 3
      Width = 24
      Height = 21
      Align = alLeft
      EditMask = '!999;1;_'
      MaxLength = 3
      TabOrder = 0
      Text = '000'
    end
    object edcClassTrib: TMaskEdit
      AlignWithMargins = True
      Left = 114
      Top = 3
      Width = 45
      Height = 21
      Align = alLeft
      EditMask = '000-000;0;_'
      MaxLength = 7
      TabOrder = 1
      Text = '000001'
    end
    object edAliqIbsUF: TEditHw
      AlignWithMargins = True
      Left = 246
      Top = 3
      Width = 75
      Height = 21
      Align = alLeft
      TabOrder = 2
      Text = '0,0000'
      Formato = fNumber
      FormatSize = '0.4'
    end
    object edValorIbsUf: TEditHw
      AlignWithMargins = True
      Left = 408
      Top = 3
      Width = 75
      Height = 21
      Align = alLeft
      TabOrder = 3
      Text = '0,00'
      Formato = fNumber
      FormatSize = '0.2'
    end
    object edAliqIbsMun: TEditHw
      AlignWithMargins = True
      Left = 570
      Top = 3
      Width = 75
      Height = 21
      Align = alLeft
      TabOrder = 4
      Text = '0,0000'
      Formato = fNumber
      FormatSize = '0.4'
    end
  end
  object pn2: TPanel
    Left = 0
    Top = 27
    Width = 650
    Height = 27
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object lbValorIbsMun: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 75
      Height = 21
      Align = alLeft
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Vlr IBS Munic'
      Layout = tlCenter
    end
    object lbAliqCbs: TLabel
      AlignWithMargins = True
      Left = 165
      Top = 3
      Width = 75
      Height = 21
      Align = alLeft
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Al'#237'quota CBS'
      Layout = tlCenter
    end
    object lbValorCbs: TLabel
      AlignWithMargins = True
      Left = 327
      Top = 3
      Width = 75
      Height = 21
      Align = alLeft
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Valor CBS'
      Layout = tlCenter
    end
    object edValorIbsMun: TEditHw
      AlignWithMargins = True
      Left = 84
      Top = 3
      Width = 75
      Height = 21
      Align = alLeft
      TabOrder = 0
      Text = '0,00'
      Formato = fNumber
      FormatSize = '0.2'
    end
    object edAliqCbs: TEditHw
      AlignWithMargins = True
      Left = 246
      Top = 3
      Width = 75
      Height = 21
      Align = alLeft
      TabOrder = 1
      Text = '0,0000'
      Formato = fNumber
      FormatSize = '0.4'
    end
    object edValorCbs: TEditHw
      AlignWithMargins = True
      Left = 408
      Top = 3
      Width = 75
      Height = 21
      Align = alLeft
      TabOrder = 2
      Text = '0,00'
      Formato = fNumber
      FormatSize = '0.2'
    end
  end
end
