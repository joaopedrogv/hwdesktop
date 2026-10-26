object FrmQrBuscaDlg: TFrmQrBuscaDlg
  Left = 290
  Top = 143
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Vizualizador de Relat'#243'rio : Buscar Texto'
  ClientHeight = 118
  ClientWidth = 339
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 67
    Height = 13
    Caption = 'Pesquisar por:'
  end
  object SpeedButton1: TSpeedButton
    Left = 8
    Top = 88
    Width = 113
    Height = 25
    Caption = 'Cancela'
    OnClick = SpeedButton1Click
  end
  object SpeedButton2: TSpeedButton
    Left = 219
    Top = 88
    Width = 113
    Height = 25
    Caption = 'Pesquisar'
    OnClick = SpeedButton2Click
  end
  object Edit1: TEdit
    Left = 8
    Top = 24
    Width = 324
    Height = 21
    TabOrder = 0
  end
  object CheckBox1: TCheckBox
    Left = 8
    Top = 56
    Width = 209
    Height = 17
    Caption = 'Sens'#237'vel a Mai'#250'sculo e Min'#250'sculo'
    TabOrder = 1
  end
end
