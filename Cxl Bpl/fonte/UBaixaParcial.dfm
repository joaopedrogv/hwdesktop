inherited FrmBaixaParcial: TFrmBaixaParcial
  Left = 456
  Top = 273
  Caption = 'Valor Parcial da Baixa'
  ClientHeight = 109
  ClientWidth = 323
  Position = poScreenCenter
  ExplicitWidth = 331
  ExplicitHeight = 143
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 24
    Width = 75
    Height = 13
    Caption = 'Valor da Baixa: '
  end
  object BitBtn1: TBitBtn
    Left = 64
    Top = 64
    Width = 75
    Height = 25
    Caption = '&OK'
    TabOrder = 0
    OnEnter = BitBtn1Enter
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 176
    Top = 64
    Width = 75
    Height = 25
    Caption = '&Cancela'
    TabOrder = 1
    Kind = bkCancel
  end
  object EditMoeda1: TEditMoeda
    Left = 98
    Top = 21
    Width = 121
    Height = 21
    Alignment = taRightJustify
    TabOrder = 2
    FormatReal = fMoney
    FormatSize = '10.2'
  end
end
