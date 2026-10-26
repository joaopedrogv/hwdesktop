object MaskEditNullableFrame: TMaskEditNullableFrame
  Left = 0
  Top = 0
  Width = 105
  Height = 21
  TabOrder = 0
  TabStop = True
  object ckNotNull: TCheckBox
    AlignWithMargins = True
    Left = 87
    Top = 3
    Width = 15
    Height = 15
    Align = alRight
    TabOrder = 0
    OnClick = ckNotNullClick
  end
  object edMask: TMaskEdit
    Left = 0
    Top = 0
    Width = 84
    Height = 21
    Align = alClient
    TabOrder = 1
    Text = 'edMask'
    ExplicitLeft = -8
    ExplicitWidth = 121
  end
end
