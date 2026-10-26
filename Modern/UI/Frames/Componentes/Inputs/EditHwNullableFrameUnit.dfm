object EditHwNullableFrame: TEditHwNullableFrame
  Left = 0
  Top = 0
  Width = 105
  Height = 21
  TabOrder = 0
  TabStop = True
  object edDouble: TEditHw
    Left = 0
    Top = 0
    Width = 84
    Height = 21
    Align = alClient
    Enabled = False
    TabOrder = 0
    Text = '                  0,00'
    Formato = fNumber
    FormatSize = '0.2'
  end
  object ckNotNull: TCheckBox
    AlignWithMargins = True
    Left = 87
    Top = 3
    Width = 15
    Height = 15
    Hint = 'Marcado para preencher um valor e Desmarcado para deixar vazio'
    Align = alRight
    TabOrder = 1
    OnClick = ckNotNullClick
  end
end
