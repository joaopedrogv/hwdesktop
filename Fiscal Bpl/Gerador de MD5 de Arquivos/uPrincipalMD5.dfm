object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'MD5'
  ClientHeight = 87
  ClientWidth = 424
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object BitBtn1: TBitBtn
    Left = 8
    Top = 32
    Width = 75
    Height = 25
    Caption = 'MD5'
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object Edit1: TEdit
    Left = 89
    Top = 34
    Width = 320
    Height = 21
    TabOrder = 1
  end
  object OpenDialog1: TOpenDialog
    Left = 320
    Top = 112
  end
end
