object ComboBoxOpInternasFrame: TComboBoxOpInternasFrame
  Left = 0
  Top = 0
  Width = 320
  Height = 37
  TabOrder = 0
  TabStop = True
  object pnInfo: TPanel
    Left = 0
    Top = 21
    Width = 320
    Height = 16
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object lbInfo: TLabel
      AlignWithMargins = True
      Left = 0
      Top = 3
      Width = 28
      Height = 13
      Margins.Left = 0
      Margins.Bottom = 0
      Align = alLeft
      Caption = 'lbInfo'
      Layout = tlCenter
      ExplicitTop = -12
      ExplicitHeight = 317
    end
  end
  object edOpInternas: TComboBox
    AlignWithMargins = True
    Left = 0
    Top = 0
    Width = 320
    Height = 21
    Margins.Left = 0
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alClient
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 1
    OnChange = edOpInternasChange
    ExplicitWidth = 295
  end
end
