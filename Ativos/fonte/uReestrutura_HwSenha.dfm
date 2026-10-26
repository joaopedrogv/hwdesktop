object frmReestrutura_HwSenha: TfrmReestrutura_HwSenha
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Senha usu'#225'rio "HW"'
  ClientHeight = 97
  ClientWidth = 269
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 10
    Top = 12
    Width = 160
    Height = 13
    Caption = 'Informe a senha do usu'#225'rio "HW"'
  end
  object Edit1: TEdit
    Left = 10
    Top = 35
    Width = 249
    Height = 21
    PasswordChar = '*'
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 63
    Top = 62
    Width = 75
    Height = 25
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 1
  end
  object BitBtn2: TBitBtn
    Left = 144
    Top = 62
    Width = 75
    Height = 25
    Caption = 'Cancela'
    ModalResult = 2
    TabOrder = 2
  end
end
