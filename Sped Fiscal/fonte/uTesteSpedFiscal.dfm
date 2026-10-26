object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 310
  ClientWidth = 660
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
    Left = 280
    Top = 62
    Width = 75
    Height = 25
    Caption = 'BitBtn1'
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object Edit1: TEdit
    Left = 8
    Top = 8
    Width = 121
    Height = 21
    TabOrder = 1
    Text = '1'
  end
  object Edit2: TEdit
    Left = 8
    Top = 35
    Width = 633
    Height = 21
    TabOrder = 2
    Text = 'c:\basesauto\motomol\hwauto.fdb'
  end
  object Edit3: TEdit
    Left = 8
    Top = 99
    Width = 633
    Height = 21
    TabOrder = 3
    Text = 'c:\basesauto\exemplo\hwauto.fdb'
  end
  object BitBtn2: TBitBtn
    Left = 280
    Top = 126
    Width = 75
    Height = 25
    Caption = 'BitBtn2'
    TabOrder = 4
    OnClick = BitBtn2Click
  end
  object MaskEdit1: TMaskEdit
    Left = 8
    Top = 126
    Width = 119
    Height = 21
    EditMask = '!99/99/0000;1;_'
    MaxLength = 10
    TabOrder = 5
    Text = '  /  /    '
  end
  object MaskEdit2: TMaskEdit
    Left = 135
    Top = 126
    Width = 119
    Height = 21
    EditMask = '!99/99/0000;1;_'
    MaxLength = 10
    TabOrder = 6
    Text = '  /  /    '
  end
  object BitBtn3: TBitBtn
    Left = 280
    Top = 230
    Width = 75
    Height = 25
    Caption = 'BitBtn1'
    TabOrder = 7
    OnClick = BitBtn3Click
  end
  object Edit4: TEdit
    Left = 8
    Top = 176
    Width = 121
    Height = 21
    TabOrder = 8
    Text = '1'
  end
  object Edit5: TEdit
    Left = 8
    Top = 203
    Width = 633
    Height = 21
    TabOrder = 9
    Text = '127.0.0.1:D:\Hw\bases\producao\Hwauto.fdb'
  end
end
