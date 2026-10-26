object FrmFabrica: TFrmFabrica
  Left = 0
  Top = 0
  Caption = 'FrmFabrica'
  ClientHeight = 27
  ClientWidth = 116
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
  object Timer1: TTimer
    Interval = 2000
    Left = 672
    Top = 32
  end
  object Timer2: TTimer
    Interval = 1
    OnTimer = Timer2Timer
  end
end
