inherited FrmDescPrestacao: TFrmDescPrestacao
  Left = 420
  Top = 208
  Caption = 'Desconto em Valor Corrigido da Presta'#231#227'o'
  ClientHeight = 176
  ClientWidth = 417
  Position = poScreenCenter
  ExplicitWidth = 425
  ExplicitHeight = 210
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 96
    Top = 68
    Width = 137
    Height = 13
    Caption = 'Percentual do Desconto:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 53
    Top = 95
    Width = 187
    Height = 13
    Caption = 'Desconto sobre o Valor Corrigido:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 417
    Height = 41
    Align = alTop
    Caption = 'Panel1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 111
    Top = 143
    Width = 75
    Height = 25
    Caption = '&OK'
    TabOrder = 1
    OnEnter = BitBtn1Enter
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 231
    Top = 143
    Width = 75
    Height = 25
    Caption = '&Cancela'
    TabOrder = 2
    Kind = bkCancel
  end
  object EditHw1: TEditHw
    Left = 246
    Top = 65
    Width = 121
    Height = 21
    TabOrder = 3
    Text = '                                   0'
    OnEnter = EditHw1Enter
    Formato = fFixed
    FormatSize = '0.2'
  end
  object EditHw2: TEditHw
    Left = 246
    Top = 92
    Width = 121
    Height = 21
    TabOrder = 4
    Text = '                                   0'
    OnEnter = EditHw2Enter
    Formato = fNumber
    FormatSize = '10.2'
  end
end
