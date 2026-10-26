object TribDFeIbsCbsGrupoFrame: TTribDFeIbsCbsGrupoFrame
  Left = 0
  Top = 0
  Width = 660
  Height = 226
  TabOrder = 0
  TabStop = True
  object PageControl1: TPageControl
    Left = 0
    Top = 33
    Width = 660
    Height = 193
    ActivePage = tabIbsCbs
    Align = alTop
    MultiLine = True
    Style = tsFlatButtons
    TabOrder = 0
    object tabIbsCbs: TTabSheet
      Caption = '    Tributo Aplicado    '
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 652
        Height = 54
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        inline FrameGrupoIbsUF: TTribDFeIbsCbsGrupoValoresFrame
          Left = 0
          Top = 0
          Width = 651
          Height = 54
          Align = alLeft
          TabOrder = 0
          TabStop = True
        end
      end
      object Panel4: TPanel
        Left = 0
        Top = 54
        Width = 652
        Height = 54
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        inline FrameGrupoIbsMun: TTribDFeIbsCbsGrupoValoresFrame
          Left = 0
          Top = 0
          Width = 651
          Height = 54
          Align = alLeft
          TabOrder = 0
          TabStop = True
        end
      end
      object Panel5: TPanel
        Left = 0
        Top = 108
        Width = 652
        Height = 54
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 2
        inline FrameGrupoCBS: TTribDFeIbsCbsGrupoValoresFrame
          Left = 0
          Top = 0
          Width = 651
          Height = 54
          Align = alLeft
          TabOrder = 0
          TabStop = True
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = '     Tributa'#231#227'o Regular     '
      ImageIndex = 1
      object pnTribRegular: TPanel
        Left = 0
        Top = 0
        Width = 652
        Height = 73
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object pn_0: TPanel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 646
          Height = 13
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object lbTributacaoRegular: TLabel
            Left = 0
            Top = 0
            Width = 115
            Height = 13
            Align = alLeft
            Caption = 'Tributa'#231#227'o regular >>>'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ExplicitLeft = -19
            ExplicitTop = 3
          end
          object ckTributacaoRegular: TCheckBox
            Left = 115
            Top = 0
            Width = 140
            Height = 13
            Hint = 'Indicador se o Grupo da Tributa'#231#227'o Regular est'#225' presente ou n'#227'o'
            TabStop = False
            Align = alLeft
            Caption = 'Tributa'#231#227'o regular >>>'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            OnClick = ckTributacaoRegularClick
          end
        end
        inline FrameGrupoIbsCbsTribRegular1: TTribDFeIbsCbsGrupoTribRegularFrame
          Left = 0
          Top = 19
          Width = 652
          Height = 54
          Align = alTop
          TabOrder = 1
          TabStop = True
          ExplicitTop = 19
          ExplicitWidth = 652
          inherited pn1: TPanel
            Width = 652
            ExplicitWidth = 652
          end
          inherited pn2: TPanel
            Width = 652
            ExplicitWidth = 652
          end
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = '     Compra Governamental     '
      ImageIndex = 2
      object pnCompraGovIt: TPanel
        Left = 0
        Top = 0
        Width = 652
        Height = 73
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object Panel6: TPanel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 646
          Height = 13
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object lbCompraGovernamentalItem: TLabel
            Left = 0
            Top = 0
            Width = 140
            Height = 13
            Align = alLeft
            Caption = 'Compra Governamental >>>'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object ckCompraGovernamentalItem: TCheckBox
            Left = 140
            Top = 0
            Width = 162
            Height = 13
            Hint = 
              'Indicador se o Grupo de Compra Governamental est'#225' presente ou n'#227 +
              'o'
            Align = alLeft
            Caption = 'Compra Governamental >>>'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            OnClick = ckCompraGovernamentalItemClick
          end
        end
        inline FrameGrupoIbsCbsCompraGovItem1: TTribDFeIbsCbsGrupoCompraGovFrame
          Left = 0
          Top = 19
          Width = 652
          Height = 54
          Align = alTop
          TabOrder = 1
          TabStop = True
          ExplicitTop = 19
          ExplicitWidth = 652
          inherited pn1: TPanel
            Width = 652
            ExplicitWidth = 652
            inherited edAliqIbsUf: TEditHw
              ExplicitLeft = 84
            end
            inherited edVIbsUF: TEditHw
              ExplicitLeft = 246
            end
            inherited edAliqIbsMun: TEditHw
              ExplicitLeft = 408
            end
            inherited edVIbsMun: TEditHw
              ExplicitLeft = 570
            end
          end
          inherited pn2: TPanel
            Width = 652
            ExplicitWidth = 652
            inherited edAliqCbs: TEditHw
              ExplicitLeft = 84
            end
            inherited edVCbs: TEditHw
              ExplicitLeft = 246
            end
          end
        end
      end
    end
  end
  object pnBase: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 654
    Height = 27
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object Label1: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 76
      Height = 21
      Align = alLeft
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Base de c'#225'lculo'
      Layout = tlCenter
    end
    object edVBC: TEditHw
      AlignWithMargins = True
      Left = 85
      Top = 3
      Width = 75
      Height = 21
      Align = alLeft
      TabOrder = 0
      Text = '0,00'
      Formato = fNumber
      FormatSize = '0.2'
    end
  end
end
