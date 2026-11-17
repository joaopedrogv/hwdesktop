object frmRegraFiscalSelecaoFrame: TfrmRegraFiscalSelecaoFrame
  Left = 0
  Top = 0
  Width = 395
  Height = 37
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  ParentColor = False
  ParentFont = False
  TabOrder = 0
  object cbSelecao: TComboBox
    Left = 0
    Top = 0
    Width = 395
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 0
    OnChange = cbSelecaoChange
  end
  object lblVigencia: TLabel
    Left = 0
    Top = 21
    Width = 395
    Height = 16
    AutoSize = False
    Visible = False
    Layout = tlCenter
  end
end
