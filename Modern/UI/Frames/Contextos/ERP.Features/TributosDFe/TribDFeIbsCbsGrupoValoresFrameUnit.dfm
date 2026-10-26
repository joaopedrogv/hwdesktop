object TribDFeIbsCbsGrupoValoresFrame: TTribDFeIbsCbsGrupoValoresFrame
  Left = 0
  Top = 0
  Width = 651
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
        Width = 75
        Height = 21
        Align = alLeft
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Aliq  [TRIBUTO]'
        Layout = tlCenter
      end
      object lbPDif: TLabel
        AlignWithMargins = True
        Left = 165
        Top = 3
        Width = 75
        Height = 21
        Align = alLeft
        Alignment = taRightJustify
        AutoSize = False
        Caption = '% Diferimento'
        Layout = tlCenter
      end
      object edPAliq: TEditHw
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
      end
      object pnVDif: TPanel
        Left = 324
        Top = 0
        Width = 258
        Height = 27
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 1
        object Label9: TLabel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 75
          Height = 21
          Align = alLeft
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Vlr Diferimento'
          Layout = tlCenter
        end
        object edVDif: TEditHw
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
          Nullable = True
        end
      end
      object edPDif: TEditHw
        AlignWithMargins = True
        Left = 246
        Top = 3
        Width = 75
        Height = 21
        Align = alLeft
        TabOrder = 2
        Text = '0,0000'
        OnChange = edPDifChange
        Formato = fNumber
        FormatSize = '0.4'
        Nullable = True
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
        Width = 75
        Height = 21
        Align = alLeft
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Vlr trib devolvid'
        Layout = tlCenter
      end
      object lbPRed: TLabel
        AlignWithMargins = True
        Left = 165
        Top = 3
        Width = 75
        Height = 21
        Align = alLeft
        Alignment = taRightJustify
        AutoSize = False
        Caption = '% Redu'#231#227'o'
        Layout = tlCenter
        ExplicitLeft = 162
      end
      object edVDevTrib: TEditHw
        AlignWithMargins = True
        Left = 84
        Top = 3
        Width = 75
        Height = 21
        Align = alLeft
        TabOrder = 0
        Text = '0,00'
        OnChange = edVDevTribChange
        Formato = fNumber
        FormatSize = '0.2'
        Nullable = True
      end
      object pn2_1: TPanel
        Left = 324
        Top = 0
        Width = 324
        Height = 27
        Align = alLeft
        AutoSize = True
        BevelOuter = bvNone
        TabOrder = 1
        object lbVTrib: TLabel
          AlignWithMargins = True
          Left = 165
          Top = 3
          Width = 75
          Height = 21
          Align = alLeft
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Valor [TRIB]'
          Layout = tlCenter
          ExplicitLeft = 220
        end
        object pnVRed: TPanel
          Left = 0
          Top = 0
          Width = 162
          Height = 27
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 0
          object lbAliqEfet: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 75
            Height = 21
            Align = alLeft
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Al'#237'q Efetiva'
            Layout = tlCenter
          end
          object edPAliqEfet: TEditHw
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
            Nullable = True
          end
        end
        object edVtrib: TEditHw
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
        end
      end
      object edPRed: TEditHw
        AlignWithMargins = True
        Left = 246
        Top = 3
        Width = 75
        Height = 21
        Align = alLeft
        TabOrder = 2
        Text = '0,0000'
        OnChange = edPRedChange
        Formato = fNumber
        FormatSize = '0.4'
        Nullable = True
      end
    end
  end
end
