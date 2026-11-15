object frmValidationPanelFrame: TfrmValidationPanelFrame
  Left = 0
  Top = 0
  Width = 736
  Height = 120
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  ParentColor = False
  ParentFont = False
  TabOrder = 0
  TabStop = False
  Visible = False
  object pnTitulo: TPanel
    Left = 0
    Top = 0
    Width = 736
    Height = 34
    Align = alTop
    BevelOuter = bvNone
    Caption = ''
    TabOrder = 0
    TabStop = False
    object lblTitulo: TLabel
      Left = 10
      Top = 9
      Width = 250
      Height = 16
      Caption = 'Revise os campos antes de salvar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object sbMensagens: TScrollBox
    Left = 0
    Top = 34
    Width = 736
    Height = 86
    HorzScrollBar.Visible = False
    Align = alClient
    AutoScroll = True
    BorderStyle = bsNone
    TabOrder = 1
    TabStop = False
    OnResize = sbMensagensResize
  end
end
