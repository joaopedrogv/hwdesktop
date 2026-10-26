object FrameMonofasiaIbsCbs: TFrameMonofasiaIbsCbs
  Left = 0
  Top = 0
  Width = 739
  Height = 159
  TabOrder = 0
  TabStop = True
  object pnPadrao: TPanel
    Left = 0
    Top = 24
    Width = 739
    Height = 27
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object lbAliqIbsUf: TLabel
      AlignWithMargins = True
      Left = 63
      Top = 3
      Width = 42
      Height = 21
      Align = alLeft
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Qtde BC'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
    end
    object lbVIbsUF: TLabel
      AlignWithMargins = True
      Left = 177
      Top = 3
      Width = 75
      Height = 21
      Align = alLeft
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Aliq Ad Rem IBS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
    end
    object lbPIbsMun: TLabel
      AlignWithMargins = True
      Left = 456
      Top = 3
      Width = 75
      Height = 21
      Align = alLeft
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Aliq Ad Rem CBS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
      ExplicitLeft = 319
    end
    object lbVIbsMun: TLabel
      AlignWithMargins = True
      Left = 319
      Top = 3
      Width = 60
      Height = 21
      Align = alLeft
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Vlr IBS Mono'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
      ExplicitLeft = 229
      ExplicitTop = 6
    end
    object Label1: TLabel
      Left = 0
      Top = 0
      Width = 60
      Height = 27
      Align = alLeft
      Alignment = taCenter
      AutoSize = False
      Caption = 'Padr'#227'o......'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
      WordWrap = True
    end
    object Label2: TLabel
      AlignWithMargins = True
      Left = 598
      Top = 3
      Width = 60
      Height = 21
      Align = alLeft
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Vlr CBS Mono'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
    end
    object edQtBcPad: TEditHw
      AlignWithMargins = True
      Left = 111
      Top = 3
      Width = 60
      Height = 21
      Align = alLeft
      TabOrder = 0
      Text = '      0,0000'
      Formato = fNumber
      FormatSize = '0.4'
    end
    object edAliqAdRemIbs: TEditHw
      AlignWithMargins = True
      Left = 258
      Top = 3
      Width = 55
      Height = 21
      Align = alLeft
      TabOrder = 1
      Text = '    0,0000'
      Formato = fNumber
      FormatSize = '0.4'
    end
    object edAliqAdRemCbs: TEditHw
      AlignWithMargins = True
      Left = 537
      Top = 3
      Width = 55
      Height = 21
      Align = alLeft
      TabOrder = 3
      Text = '    0,0000'
      Formato = fNumber
      FormatSize = '0.4'
    end
    object edVlrMonoIbs: TEditHw
      AlignWithMargins = True
      Left = 385
      Top = 3
      Width = 65
      Height = 21
      Align = alLeft
      TabOrder = 2
      Text = '           0,00'
      Formato = fNumber
      FormatSize = '0.2'
    end
    object edVlrMonoCbs: TEditHw
      AlignWithMargins = True
      Left = 664
      Top = 3
      Width = 65
      Height = 21
      Align = alLeft
      TabOrder = 4
      Text = '           0,00'
      Formato = fNumber
      FormatSize = '0.2'
    end
  end
  object pn1: TPanel
    Left = 0
    Top = 0
    Width = 739
    Height = 24
    Align = alTop
    BevelOuter = bvNone
    Padding.Left = 108
    TabOrder = 0
    object ckMonoPadrao: TCheckBox
      AlignWithMargins = True
      Left = 111
      Top = 3
      Width = 141
      Height = 18
      Align = alLeft
      Caption = 'Monofasia Padr'#227'o'
      TabOrder = 0
    end
    object ckSujeitoRetencao: TCheckBox
      AlignWithMargins = True
      Left = 258
      Top = 3
      Width = 121
      Height = 18
      Align = alLeft
      Caption = 'Sujeita '#224' Reten'#231#227'o'
      TabOrder = 1
    end
    object ckRetidaAnt: TCheckBox
      AlignWithMargins = True
      Left = 385
      Top = 3
      Width = 146
      Height = 18
      Align = alLeft
      Caption = 'Retida Anteriormente'
      TabOrder = 2
    end
    object ckComDifer: TCheckBox
      AlignWithMargins = True
      Left = 537
      Top = 3
      Width = 123
      Height = 18
      Align = alLeft
      Caption = 'Com Diferimento'
      TabOrder = 3
    end
  end
  object pnReten: TPanel
    Left = 0
    Top = 51
    Width = 739
    Height = 27
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object Label3: TLabel
      AlignWithMargins = True
      Left = 63
      Top = 3
      Width = 42
      Height = 21
      Align = alLeft
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Qtde BC'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
    end
    object Label4: TLabel
      AlignWithMargins = True
      Left = 177
      Top = 3
      Width = 75
      Height = 21
      Align = alLeft
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Aliq Ad Rem IBS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
    end
    object Label5: TLabel
      AlignWithMargins = True
      Left = 456
      Top = 3
      Width = 75
      Height = 21
      Align = alLeft
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Aliq Ad Rem CBS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
      ExplicitLeft = 319
    end
    object Label6: TLabel
      AlignWithMargins = True
      Left = 319
      Top = 3
      Width = 60
      Height = 21
      Align = alLeft
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Vlr IBS Mono'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
      ExplicitLeft = 281
      ExplicitTop = 6
    end
    object Label7: TLabel
      Left = 0
      Top = 0
      Width = 60
      Height = 27
      Align = alLeft
      AutoSize = False
      Caption = 'Sujeita '#224' Reten'#231#227'o ...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
      WordWrap = True
    end
    object Label8: TLabel
      AlignWithMargins = True
      Left = 598
      Top = 3
      Width = 60
      Height = 21
      Align = alLeft
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Vlr CBS Mono'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
    end
    object edQtBcReten: TEditHw
      AlignWithMargins = True
      Left = 111
      Top = 3
      Width = 60
      Height = 21
      Align = alLeft
      TabOrder = 0
      Text = '      0,0000'
      Formato = fNumber
      FormatSize = '0.4'
    end
    object edAliqAdRemIbsReten: TEditHw
      AlignWithMargins = True
      Left = 258
      Top = 3
      Width = 55
      Height = 21
      Align = alLeft
      TabOrder = 1
      Text = '    0,0000'
      Formato = fNumber
      FormatSize = '0.4'
    end
    object edAliqAdRemCbsReten: TEditHw
      AlignWithMargins = True
      Left = 537
      Top = 3
      Width = 55
      Height = 21
      Align = alLeft
      TabOrder = 3
      Text = '    0,0000'
      Formato = fNumber
      FormatSize = '0.4'
    end
    object edVlrMonoIbsReten: TEditHw
      AlignWithMargins = True
      Left = 385
      Top = 3
      Width = 65
      Height = 21
      Align = alLeft
      TabOrder = 2
      Text = '           0,00'
      Formato = fNumber
      FormatSize = '0.2'
    end
    object edVlrMonoCbsReten: TEditHw
      AlignWithMargins = True
      Left = 664
      Top = 3
      Width = 65
      Height = 21
      Align = alLeft
      TabOrder = 4
      Text = '           0,00'
      Formato = fNumber
      FormatSize = '0.2'
    end
  end
  object pnRet: TPanel
    Left = 0
    Top = 78
    Width = 739
    Height = 27
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 3
    object Label9: TLabel
      AlignWithMargins = True
      Left = 63
      Top = 3
      Width = 42
      Height = 21
      Align = alLeft
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Qtde BC'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
    end
    object Label10: TLabel
      AlignWithMargins = True
      Left = 177
      Top = 3
      Width = 75
      Height = 21
      Align = alLeft
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Aliq Ad Rem IBS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
    end
    object Label11: TLabel
      AlignWithMargins = True
      Left = 456
      Top = 3
      Width = 75
      Height = 21
      Align = alLeft
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Aliq Ad Rem CBS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
      ExplicitLeft = 319
    end
    object Label12: TLabel
      AlignWithMargins = True
      Left = 319
      Top = 3
      Width = 60
      Height = 21
      Align = alLeft
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Vlr IBS Mono'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
      ExplicitLeft = 293
    end
    object Label13: TLabel
      Left = 0
      Top = 0
      Width = 60
      Height = 27
      Align = alLeft
      AutoSize = False
      Caption = 'Retida Anteriormente'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
      WordWrap = True
    end
    object Label14: TLabel
      AlignWithMargins = True
      Left = 598
      Top = 3
      Width = 60
      Height = 21
      Align = alLeft
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Vlr CBS Mono'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
    end
    object edQtBcRet: TEditHw
      AlignWithMargins = True
      Left = 111
      Top = 3
      Width = 60
      Height = 21
      Align = alLeft
      TabOrder = 0
      Text = '      0,0000'
      Formato = fNumber
      FormatSize = '0.4'
    end
    object edAliqAdRemIbsRet: TEditHw
      AlignWithMargins = True
      Left = 258
      Top = 3
      Width = 55
      Height = 21
      Align = alLeft
      TabOrder = 1
      Text = '    0,0000'
      Formato = fNumber
      FormatSize = '0.4'
    end
    object edAliqAdRemCbsRet: TEditHw
      AlignWithMargins = True
      Left = 537
      Top = 3
      Width = 55
      Height = 21
      Align = alLeft
      TabOrder = 3
      Text = '    0,0000'
      Formato = fNumber
      FormatSize = '0.4'
    end
    object edVlrMonoIbsRet: TEditHw
      AlignWithMargins = True
      Left = 385
      Top = 3
      Width = 65
      Height = 21
      Align = alLeft
      TabOrder = 2
      Text = '           0,00'
      Formato = fNumber
      FormatSize = '0.2'
    end
    object edVlrMonoCbsRet: TEditHw
      AlignWithMargins = True
      Left = 664
      Top = 3
      Width = 65
      Height = 21
      Align = alLeft
      TabOrder = 4
      Text = '           0,00'
      Formato = fNumber
      FormatSize = '0.2'
    end
  end
  object pnDifer: TPanel
    Left = 0
    Top = 105
    Width = 739
    Height = 27
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 4
    object Label15: TLabel
      AlignWithMargins = True
      Left = 63
      Top = 3
      Width = 189
      Height = 21
      Align = alLeft
      Alignment = taRightJustify
      AutoSize = False
      Caption = '% Diferimento IBS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
    end
    object Label16: TLabel
      AlignWithMargins = True
      Left = 319
      Top = 3
      Width = 60
      Height = 21
      Align = alLeft
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Vlr IBS Difer'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
    end
    object Label17: TLabel
      AlignWithMargins = True
      Left = 456
      Top = 3
      Width = 75
      Height = 21
      Align = alLeft
      Alignment = taRightJustify
      AutoSize = False
      Caption = '% Diferimen CBS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
    end
    object Label18: TLabel
      AlignWithMargins = True
      Left = 598
      Top = 3
      Width = 60
      Height = 21
      Align = alLeft
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Vlr CBS Difer'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
      ExplicitLeft = 461
    end
    object Label19: TLabel
      Left = 0
      Top = 0
      Width = 60
      Height = 27
      Align = alLeft
      AutoSize = False
      Caption = 'Com Diferimento.....'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
      WordWrap = True
    end
    object edPerdDifIbs: TEditHw
      AlignWithMargins = True
      Left = 258
      Top = 3
      Width = 55
      Height = 21
      Align = alLeft
      TabOrder = 0
      Text = '    0,0000'
      Formato = fNumber
      FormatSize = '0.4'
    end
    object edVlrDifIbs: TEditHw
      AlignWithMargins = True
      Left = 385
      Top = 3
      Width = 65
      Height = 21
      Align = alLeft
      TabOrder = 1
      Text = '           0,00'
      Formato = fNumber
      FormatSize = '0.2'
    end
    object edPerdDifCbs: TEditHw
      AlignWithMargins = True
      Left = 537
      Top = 3
      Width = 55
      Height = 21
      Align = alLeft
      TabOrder = 2
      Text = '    0,0000'
      Formato = fNumber
      FormatSize = '0.4'
    end
    object edVlrDifCbs: TEditHw
      AlignWithMargins = True
      Left = 664
      Top = 3
      Width = 65
      Height = 21
      Align = alLeft
      TabOrder = 3
      Text = '           0,00'
      Formato = fNumber
      FormatSize = '0.2'
    end
  end
  object pnTot: TPanel
    Left = 0
    Top = 132
    Width = 739
    Height = 27
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 5
    object Label44: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 376
      Height = 21
      Align = alLeft
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Total de IBS Monof'#225'sico'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
    end
    object Label26: TLabel
      AlignWithMargins = True
      Left = 456
      Top = 3
      Width = 202
      Height = 21
      Align = alLeft
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Total de CBS Monof'#225'sico'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
    end
    object edVlTotIbsMono: TEditHw
      AlignWithMargins = True
      Left = 385
      Top = 3
      Width = 65
      Height = 21
      Align = alLeft
      TabOrder = 0
      Text = '           0,00'
      Formato = fNumber
      FormatSize = '0.2'
    end
    object edVlTotCbsMono: TEditHw
      AlignWithMargins = True
      Left = 664
      Top = 3
      Width = 65
      Height = 21
      Align = alLeft
      TabOrder = 1
      Text = '           0,00'
      Formato = fNumber
      FormatSize = '0.2'
    end
  end
end
