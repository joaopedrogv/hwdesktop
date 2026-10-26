object FrmPesqCxl: TFrmPesqCxl
  Left = 218
  Top = 88
  Caption = 'Pesquisa Caixa Auxiliar'
  ClientHeight = 144
  ClientWidth = 480
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 9
    Width = 82
    Height = 13
    Caption = 'Campo Pesquisa:'
  end
  object Label2: TLabel
    Left = 41
    Top = 33
    Width = 51
    Height = 13
    Caption = 'Conte'#250'do:'
  end
  object Label3: TLabel
    Left = 39
    Top = 58
    Width = 52
    Height = 13
    Caption = 'Data Final:'
    Visible = False
  end
  object ComboBox1: TComboBox
    Left = 96
    Top = 1
    Width = 241
    Height = 21
    ItemHeight = 13
    TabOrder = 0
    OnEnter = ComboBox1Enter
    OnExit = ComboBox1Exit
  end
  object MaskEdit1: TMaskEdit
    Left = 96
    Top = 24
    Width = 240
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 1
    OnChange = MaskEdit1Change
  end
  object MaskEdit2: TMaskEdit
    Left = 96
    Top = 48
    Width = 81
    Height = 21
    EditMask = '!99/99/0000;1;_'
    MaxLength = 10
    TabOrder = 2
    Text = '  /  /    '
    Visible = False
  end
  object RadioButton1: TRadioButton
    Left = 96
    Top = 80
    Width = 113
    Height = 17
    Caption = 'Localiza'#231#227'o'
    Checked = True
    TabOrder = 3
    TabStop = True
  end
  object RadioButton2: TRadioButton
    Left = 240
    Top = 79
    Width = 113
    Height = 17
    Caption = 'Filtro'
    Enabled = False
    TabOrder = 4
  end
  object BitBtn1: TBitBtn
    Left = 125
    Top = 106
    Width = 75
    Height = 25
    TabOrder = 5
    OnClick = BitBtn1Click
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 211
    Top = 106
    Width = 75
    Height = 25
    Caption = 'Cancela'
    TabOrder = 6
    Kind = bkCancel
  end
  object CheckBox1: TCheckBox
    Left = 344
    Top = 5
    Width = 97
    Height = 17
    Caption = 'Pesq.Exata'
    TabOrder = 7
  end
end
