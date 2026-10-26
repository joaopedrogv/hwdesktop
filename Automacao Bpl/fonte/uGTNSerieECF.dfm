object frmGtNSerieECF: TfrmGtNSerieECF
  Left = 288
  Top = 207
  Caption = 'Alterar n'#250'mero de s'#233'rie e grande total'
  ClientHeight = 86
  ClientWidth = 488
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Edit1: TEdit
    Left = 48
    Top = 16
    Width = 273
    Height = 21
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 48
    Top = 47
    Width = 273
    Height = 21
    TabOrder = 1
  end
  object Button1: TButton
    Left = 327
    Top = 12
    Width = 122
    Height = 25
    Caption = 'Numero de S'#233'rie'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 327
    Top = 43
    Width = 122
    Height = 25
    Caption = 'Grande Total'
    TabOrder = 3
    OnClick = Button2Click
  end
end
