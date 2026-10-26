inherited FrmModImpG: TFrmModImpG
  Left = 518
  Top = 256
  Caption = 'Modo de Impress'#227'o...'
  ClientHeight = 111
  ClientWidth = 304
  Position = poScreenCenter
  OnShow = FormShow
  ExplicitLeft = 518
  ExplicitTop = 256
  ExplicitHeight = 147
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 84
    Top = 9
    Width = 137
    Height = 13
    Caption = 'Modo Impress'#227'o do Usu'#225'rio:'
  end
  object ComboBox1: TComboBox
    Left = 72
    Top = 36
    Width = 173
    Height = 21
    ItemHeight = 13
    TabOrder = 0
    Text = 'ComboBox1'
    Items.Strings = (
      'Epson'
      'Grafico'
      'HP'
      'Rima')
  end
  object BitBtn1: TBitBtn
    Left = 72
    Top = 78
    Width = 75
    Height = 25
    TabOrder = 1
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 170
    Top = 78
    Width = 75
    Height = 25
    Caption = 'Cancela'
    TabOrder = 2
    OnClick = BitBtn2Click
    Kind = bkCancel
  end
end
