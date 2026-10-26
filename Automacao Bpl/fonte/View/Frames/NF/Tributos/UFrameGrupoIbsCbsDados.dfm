object FrameGrupoIbsCbsDados: TFrameGrupoIbsCbsDados
  Left = 0
  Top = 0
  Width = 743
  Height = 54
  TabOrder = 0
  TabStop = True
  object pnTributo: TPanel
    Left = 0
    Top = 0
    Width = 743
    Height = 54
    BevelOuter = bvNone
    TabOrder = 0
    object pn1: TPanel
      Left = 0
      Top = 0
      Width = 743
      Height = 27
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object lbAliqTributo: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 125
        Height = 21
        Align = alLeft
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Al'#237'quota do  [TRIBUTO]'
        Layout = tlCenter
      end
      object lbPDif: TLabel
        AlignWithMargins = True
        Left = 215
        Top = 3
        Width = 70
        Height = 21
        Margins.Right = 0
        Align = alLeft
        Alignment = taRightJustify
        AutoSize = False
        Caption = '% Diferimento'
        Layout = tlCenter
        OnClick = lbPDifClick
      end
      object edPAliq: TEditHw
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
      object ckPDif: TCheckBox
        AlignWithMargins = True
        Left = 285
        Top = 3
        Width = 20
        Height = 21
        Margins.Left = 0
        TabStop = False
        Align = alLeft
        BiDiMode = bdRightToLeft
        ParentBiDiMode = False
        TabOrder = 1
        OnClick = ckPDifClick
        ExplicitLeft = 305
      end
      object pnVDif: TPanel
        Left = 308
        Top = 0
        Width = 258
        Height = 27
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 2
        object Label9: TLabel
          AlignWithMargins = True
          Left = 84
          Top = 3
          Width = 90
          Height = 21
          Align = alLeft
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Valor Diferimento'
          Layout = tlCenter
          ExplicitLeft = 69
        end
        object edPDif: TEditHw
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 75
          Height = 21
          Align = alLeft
          TabOrder = 0
          Text = '           0,0000'
          Formato = fNumber
          FormatSize = '0.4'
        end
        object edVDif: TEditHw
          AlignWithMargins = True
          Left = 180
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
    object pn2: TPanel
      Left = 0
      Top = 27
      Width = 743
      Height = 27
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object lbVDevTrib: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 107
        Height = 21
        Margins.Right = 0
        Align = alLeft
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Valor do trib devolvido'
        Layout = tlCenter
        OnClick = lbVDevTribClick
      end
      object ckVDevtrib: TCheckBox
        AlignWithMargins = True
        Left = 110
        Top = 3
        Width = 18
        Height = 21
        Margins.Left = 0
        TabStop = False
        Align = alLeft
        BiDiMode = bdRightToLeft
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBiDiMode = False
        ParentFont = False
        TabOrder = 0
        OnClick = ckVDevtribClick
        ExplicitLeft = 108
      end
      object edVDevTrib: TEditHw
        AlignWithMargins = True
        Left = 134
        Top = 3
        Width = 75
        Height = 21
        Align = alLeft
        TabOrder = 1
        Text = '               0,00'
        Formato = fNumber
        FormatSize = '0.2'
      end
      object pn2_1: TPanel
        Left = 212
        Top = 0
        Width = 531
        Height = 27
        Align = alLeft
        AutoSize = True
        BevelOuter = bvNone
        TabOrder = 2
        object lbVTrib: TLabel
          AlignWithMargins = True
          Left = 357
          Top = 3
          Width = 90
          Height = 21
          Align = alLeft
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Valor [TRIB]'
          Layout = tlCenter
          ExplicitLeft = 360
        end
        object lbPRed: TLabel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 70
          Height = 21
          Margins.Right = 0
          Align = alLeft
          Alignment = taRightJustify
          AutoSize = False
          Caption = '% Redu'#231#227'o'
          Layout = tlCenter
          OnClick = lbPRedClick
          ExplicitLeft = 6
        end
        object ckPRed: TCheckBox
          AlignWithMargins = True
          Left = 73
          Top = 3
          Width = 20
          Height = 21
          Margins.Left = 0
          TabStop = False
          Align = alLeft
          BiDiMode = bdRightToLeft
          ParentBiDiMode = False
          TabOrder = 0
          OnClick = ckPRedClick
          ExplicitLeft = 76
        end
        object pnVRed: TPanel
          Left = 96
          Top = 0
          Width = 258
          Height = 27
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 1
          ExplicitLeft = 99
          object lbAliqEfet: TLabel
            AlignWithMargins = True
            Left = 84
            Top = 3
            Width = 90
            Height = 21
            Align = alLeft
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Al'#237'quota Efetiva'
            Layout = tlCenter
            ExplicitLeft = 69
          end
          object edPRed: TEditHw
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 75
            Height = 21
            Align = alLeft
            TabOrder = 0
            Text = '           0,0000'
            Formato = fNumber
            FormatSize = '0.4'
          end
          object edPAliqEfet: TEditHw
            AlignWithMargins = True
            Left = 180
            Top = 3
            Width = 75
            Height = 21
            Align = alLeft
            TabOrder = 1
            Text = '           0,0000'
            Formato = fNumber
            FormatSize = '0.4'
          end
        end
        object edVtrib: TEditHw
          AlignWithMargins = True
          Left = 453
          Top = 3
          Width = 75
          Height = 21
          Align = alLeft
          TabOrder = 2
          Text = '               0,00'
          Formato = fNumber
          FormatSize = '0.2'
          ExplicitLeft = 456
        end
      end
    end
  end
end
