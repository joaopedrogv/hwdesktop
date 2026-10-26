object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 427
  ClientWidth = 947
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 18
    Top = 134
    Width = 63
    Height = 13
    Caption = 'Cod Empresa'
  end
  object Label2: TLabel
    Left = 206
    Top = 134
    Width = 36
    Height = 13
    Caption = 'Per'#237'odo'
  end
  object Button1: TButton
    Left = 64
    Top = 32
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 0
    Visible = False
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 18
    Top = 104
    Width = 371
    Height = 21
    TabOrder = 1
    Text = 'Informe o endereco do banco de dados aqui'
  end
  object MaskEdit1: TMaskEdit
    Left = 87
    Top = 131
    Width = 59
    Height = 21
    TabOrder = 2
    Text = '1'
  end
  object MaskEdit2: TMaskEdit
    Left = 248
    Top = 131
    Width = 66
    Height = 21
    EditMask = '!99/99/0000;1;_'
    MaxLength = 10
    TabOrder = 3
    Text = '  /  /    '
  end
  object MaskEdit3: TMaskEdit
    Left = 320
    Top = 131
    Width = 69
    Height = 21
    EditMask = '!99/99/0000;1;_'
    MaxLength = 10
    TabOrder = 4
    Text = '  /  /    '
  end
  object BitBtn1: TBitBtn
    Left = 395
    Top = 104
    Width = 142
    Height = 48
    Caption = 'Verificar PISCOFINS'
    TabOrder = 5
    OnClick = BitBtn1Click
    Style = bsWin31
  end
  object Edit2: TEdit
    Left = 18
    Top = 168
    Width = 371
    Height = 21
    TabOrder = 6
    Text = '127.0.0.1:c:\basesauto\motomol\hwauto.fdb'
    Visible = False
  end
  object BitBtn2: TBitBtn
    Left = 18
    Top = 232
    Width = 371
    Height = 25
    Caption = 'Gerar SPED PISCOFINS'
    TabOrder = 7
    OnClick = BitBtn2Click
  end
  object ComboBox1: TComboBox
    Left = 18
    Top = 263
    Width = 371
    Height = 21
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 8
    Text = '192.168.254.5:D:\Hw\bases\motomol\HwAuto.fdb'
    Items.Strings = (
      '192.168.254.5:D:\Hw\bases\motomol\HwAuto.fdb'
      'D:\Hw\bases\producao\Hwauto.fdb'
      'D:\Hw\bases\motomol\HwAuto.fdb'
      'D:\Hw\bases\estereotipo\centro\Hwauto.fdb'
      'D:\Hw\bases\exemplo\HwAuto.fdb'
      'D:\Hw\bases\sped\Hwauto.fdb'
      'D:\Hw\bases\luz\Hw.fdb'
      'D:\Hw\bases\lestepan\Hw.fdb'
      'D:\Hw\bases\lestepan\HwCom.fdb'
      'D:\Hw\bases\lestepan\HwA.fdb'
      'D:\Hw\bases\lestepan\HwL.fdb'
      'D:\Hw\bases\lestepan\HwPIS.fdb')
  end
  object BitBtn3: TBitBtn
    Left = 448
    Top = 232
    Width = 75
    Height = 25
    Caption = 'Gerar CNP: 7'
    TabOrder = 9
    OnClick = BitBtn3Click
  end
  object BitBtn4: TBitBtn
    Left = 448
    Top = 263
    Width = 75
    Height = 25
    Caption = 'Gerar CNP: 0'
    TabOrder = 10
    OnClick = BitBtn4Click
  end
end
