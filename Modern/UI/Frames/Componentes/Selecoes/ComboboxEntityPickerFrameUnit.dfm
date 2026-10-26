object ComboboxEntityPickerFrame: TComboboxEntityPickerFrame
  Left = 0
  Top = 0
  Width = 320
  Height = 40
  TabOrder = 0
  object edEntity: TComboBox
    Left = 0
    Top = 0
    Width = 320
    Height = 21
    Margins.Left = 6
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alTop
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 0
    OnChange = edEntityChange
  end
  object pnVigencia: TPanel
    Left = 0
    Top = 21
    Width = 320
    Height = 19
    Align = alTop
    BevelEdges = [beBottom]
    BevelKind = bkTile
    BevelOuter = bvNone
    TabOrder = 1
    object lbInfo: TLabel
      AlignWithMargins = True
      Left = 0
      Top = 3
      Width = 28
      Height = 11
      Margins.Left = 0
      Align = alLeft
      Caption = 'lbInfo'
      Layout = tlCenter
      ExplicitHeight = 13
    end
  end
end
