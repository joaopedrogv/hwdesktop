object MultiSelectAnexosFrame: TMultiSelectAnexosFrame
  Left = 0
  Top = 0
  Width = 481
  Height = 154
  TabOrder = 0
  TabStop = True
  object checkListAnexos: TCheckListBox
    AlignWithMargins = True
    Left = 3
    Top = 34
    Width = 475
    Height = 117
    Align = alClient
    ItemHeight = 17
    Items.Strings = (
      'q'
      'b'
      'c')
    Style = lbOwnerDrawVariable
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 481
    Height = 31
    Align = alTop
    AutoSize = True
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitWidth = 812
    object lbDataReferencia: TLabel
      AlignWithMargins = True
      Left = 88
      Top = 6
      Width = 68
      Height = 13
      Margins.Top = 6
      Margins.Right = 6
      Margins.Bottom = 6
      Align = alLeft
      Caption = '20/02/2002'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
    end
    object Label2: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 6
      Width = 79
      Height = 13
      Margins.Top = 6
      Margins.Bottom = 6
      Align = alLeft
      Caption = 'Data refer'#234'ncia:'
      Layout = tlCenter
    end
    object alr: TLabel
      AlignWithMargins = True
      Left = 332
      Top = 6
      Width = 121
      Height = 13
      Cursor = crHandPoint
      Margins.Left = 9
      Margins.Top = 6
      Margins.Right = 9
      Margins.Bottom = 6
      Align = alLeft
      Caption = 'Ver na LC214 de 2025'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
      OnClick = alrClick
    end
    object lbModoExibicao: TLabel
      AlignWithMargins = True
      Left = 171
      Top = 6
      Width = 143
      Height = 13
      Cursor = crHandPoint
      Margins.Left = 9
      Margins.Top = 6
      Margins.Right = 9
      Margins.Bottom = 6
      Align = alLeft
      Caption = 'Exibir no modo detalhado'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
      OnClick = lbModoExibicaoClick
    end
  end
end
