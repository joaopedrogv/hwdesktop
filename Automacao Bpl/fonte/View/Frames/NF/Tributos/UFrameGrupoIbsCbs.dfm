object FrameGrupoIbsCbs: TFrameGrupoIbsCbs
  Left = 0
  Top = 0
  Width = 1582
  Height = 335
  TabOrder = 0
  TabStop = True
  object pnBase: TPanel
    Left = 0
    Top = 0
    Width = 1582
    Height = 27
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 125
      Height = 21
      Align = alLeft
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Base de c'#225'lculo'
      Layout = tlCenter
    end
    object edVBC: TEditHw
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
  end
  object Panel2: TPanel
    Left = 0
    Top = 27
    Width = 1582
    Height = 308
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object Panel3: TPanel
      Left = 0
      Top = 0
      Width = 1582
      Height = 54
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      inline FrameGrupoIbsUF: TFrameGrupoIbsCbsDados
        Left = 0
        Top = 0
        Width = 743
        Height = 54
        TabOrder = 0
        TabStop = True
        inherited pnTributo: TPanel
          inherited pn1: TPanel
            inherited ckPDif: TCheckBox
              ExplicitLeft = 285
            end
          end
          inherited pn2: TPanel
            inherited ckVDevtrib: TCheckBox
              ExplicitLeft = 110
            end
            inherited pn2_1: TPanel
              inherited ckPRed: TCheckBox
                ExplicitLeft = 73
              end
              inherited pnVRed: TPanel
                ExplicitLeft = 96
              end
              inherited edVtrib: TEditHw
                ExplicitLeft = 453
              end
            end
          end
        end
      end
    end
    object Panel4: TPanel
      Left = 0
      Top = 54
      Width = 1582
      Height = 54
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      inline FrameGrupoIbsMun: TFrameGrupoIbsCbsDados
        Left = 0
        Top = 0
        Width = 743
        Height = 54
        TabOrder = 0
        TabStop = True
        inherited pnTributo: TPanel
          inherited pn1: TPanel
            inherited ckPDif: TCheckBox
              ExplicitLeft = 285
            end
          end
          inherited pn2: TPanel
            inherited ckVDevtrib: TCheckBox
              ExplicitLeft = 110
            end
            inherited pn2_1: TPanel
              inherited ckPRed: TCheckBox
                ExplicitLeft = 73
              end
              inherited pnVRed: TPanel
                ExplicitLeft = 96
              end
              inherited edVtrib: TEditHw
                ExplicitLeft = 453
              end
            end
          end
        end
      end
    end
    object Panel5: TPanel
      Left = 0
      Top = 108
      Width = 1582
      Height = 54
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 2
      inline FrameGrupoCBS: TFrameGrupoIbsCbsDados
        Left = 0
        Top = 0
        Width = 743
        Height = 54
        TabOrder = 0
        TabStop = True
        inherited pnTributo: TPanel
          inherited pn1: TPanel
            inherited ckPDif: TCheckBox
              ExplicitLeft = 285
            end
          end
          inherited pn2: TPanel
            inherited ckVDevtrib: TCheckBox
              ExplicitLeft = 110
            end
            inherited pn2_1: TPanel
              inherited ckPRed: TCheckBox
                ExplicitLeft = 73
              end
              inherited pnVRed: TPanel
                ExplicitLeft = 96
              end
              inherited edVtrib: TEditHw
                ExplicitLeft = 453
              end
            end
          end
        end
      end
    end
    object pnTribRegular: TPanel
      Left = 0
      Top = 162
      Width = 1582
      Height = 73
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 3
      inline FrameGrupoIbsCbsTribRegular1: TFrameGrupoIbsCbsTribRegular
        Left = 0
        Top = 19
        Width = 1582
        Height = 54
        Align = alTop
        TabOrder = 1
        TabStop = True
        ExplicitTop = 19
        ExplicitWidth = 1582
        inherited pn1: TPanel
          Width = 1582
          ExplicitWidth = 1582
          inherited lbcClassTrib: TLabel
            Height = 21
          end
        end
        inherited pn2: TPanel
          Width = 1582
          ExplicitWidth = 1582
          inherited lbValorIbsMun: TLabel
            ExplicitTop = 19
          end
        end
      end
      object pn_0: TPanel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 1576
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
    end
    object pnCompraGovIt: TPanel
      Left = 0
      Top = 235
      Width = 1582
      Height = 73
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 4
      inline FrameGrupoIbsCbsCompraGovItem1: TFrameGrupoIbsCbsCompraGovItem
        Left = 0
        Top = 19
        Width = 1582
        Height = 54
        Align = alTop
        TabOrder = 0
        TabStop = True
        ExplicitTop = 19
        ExplicitWidth = 1582
        inherited pn1: TPanel
          Width = 1582
          ExplicitWidth = 1582
        end
        inherited pn2: TPanel
          Width = 1582
          ExplicitWidth = 1582
        end
      end
      object Panel6: TPanel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 1576
        Height = 13
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
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
    end
  end
end
