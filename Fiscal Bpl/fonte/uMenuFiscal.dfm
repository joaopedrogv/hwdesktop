object frmMenuFiscal: TfrmMenuFiscal
  Left = 358
  Top = 123
  Caption = 'Menu Fiscal'
  ClientHeight = 373
  ClientWidth = 254
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 2
    Top = -1
    Width = 249
    Height = 338
    Caption = 'Menu Fiscal'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object Button1: TButton
      Tag = 1
      Left = 18
      Top = 21
      Width = 214
      Height = 25
      BiDiMode = bdLeftToRight
      Caption = '1 -                        "LX"                             '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Tag = -1
      Left = 210
      Top = 52
      Width = 214
      Height = 25
      Caption = '2 -                      "LMFC"                          '
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 10
      Visible = False
      OnClick = Button2Click
    end
    object Button3: TButton
      Tag = -1
      Left = 210
      Top = 79
      Width = 214
      Height = 25
      Caption = '3 -                      "LMFS"                          '
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 11
      Visible = False
      OnClick = Button3Click
    end
    object Button4: TButton
      Tag = -1
      Left = 210
      Top = 107
      Width = 214
      Height = 25
      Caption = '4 -                "Espelho MFD"                  '
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 12
      Visible = False
      OnClick = Button4Click
    end
    object Button5: TButton
      Tag = 4
      Left = 18
      Top = 114
      Width = 214
      Height = 25
      Caption = '4 -                  "Arq. MFD"                       '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = Button5Click
    end
    object Button6: TButton
      Tag = -1
      Left = 210
      Top = 161
      Width = 214
      Height = 25
      Caption = '6 -                 "Tab. Prod."                      '
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 13
      Visible = False
      OnClick = Button6Click
    end
    object Button7: TButton
      Tag = -1
      Left = 210
      Top = 216
      Width = 214
      Height = 25
      Caption = '8 -          "Movimento por ECF"           '
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 15
      Visible = False
      OnClick = Button7Click
    end
    object Button8: TButton
      Tag = -1
      Left = 210
      Top = 243
      Width = 214
      Height = 25
      Caption = '9 -             "Meios de Pagto."              '
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 16
      Visible = False
      OnClick = Button8Click
    end
    object Button9: TButton
      Tag = -1
      Left = 210
      Top = 271
      Width = 214
      Height = 25
      Caption = '10 -             "DAVS Emitidos"                '
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 17
      Visible = False
      OnClick = Button9Click
    end
    object Button11: TButton
      Tag = 5
      Left = 18
      Top = 145
      Width = 214
      Height = 25
      Caption = '5 -      "Identifica'#231#227'o do PAF-ECF"     '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      OnClick = Button11Click
    end
    object Button13: TButton
      Tag = -1
      Left = 210
      Top = 189
      Width = 214
      Height = 25
      Caption = '7 -                  "Estoque"                        '
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 14
      Visible = False
      OnClick = Button13Click
    end
    object Button10: TButton
      Tag = 7
      Left = 18
      Top = 207
      Width = 214
      Height = 25
      Caption = '7 - "Tab. '#205'ndice T'#233'cnico Produ'#231#227'o" '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
      OnClick = Button10Click
    end
    object Button14: TButton
      Tag = 6
      Left = 18
      Top = 176
      Width = 214
      Height = 25
      Caption = '6 -          "Vendas do Per'#237'odo"             '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      OnClick = Button14Click
    end
    object EditFiscal2: TEditFiscal
      Left = 108
      Top = 305
      Width = 33
      Height = 24
      BiDiMode = bdRightToLeft
      ParentBiDiMode = False
      TabOrder = 9
      Text = '1'
    end
    object Button15: TButton
      Tag = 8
      Left = 18
      Top = 238
      Width = 214
      Height = 25
      Caption = '8 - "Par'#226'metros de Configura'#231#227'o"  '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 7
      OnClick = Button15Click
    end
    object Button16: TButton
      Tag = -1
      Left = 210
      Top = 412
      Width = 214
      Height = 25
      Caption = '15 -    "Conta de Clientes Abertas"   '
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 18
      Visible = False
      OnClick = Button16Click
    end
    object Button17: TButton
      Tag = -1
      Left = 210
      Top = 440
      Width = 214
      Height = 25
      Caption = '16-Confer'#234'ncia de Conta de Cliente"'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 19
      Visible = False
      OnClick = Button17Click
    end
    object Button18: TButton
      Tag = 2
      Left = 18
      Top = 52
      Width = 214
      Height = 25
      Caption = '2 -                      "LMF"                            '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = Button18Click
    end
    object Button19: TButton
      Tag = 3
      Left = 18
      Top = 83
      Width = 214
      Height = 25
      Caption = '3 -                  "Arq. MF"                         '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = Button19Click
    end
    object Button20: TButton
      Tag = 9
      Left = 18
      Top = 269
      Width = 214
      Height = 25
      Caption = '9 -        "Registros do PAF-ECF"          '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 8
      OnClick = Button20Click
    end
  end
  object Button12: TButton
    Left = 34
    Top = 343
    Width = 200
    Height = 25
    Caption = 'Sair (Esc)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = Button12Click
  end
  object Timer1: TTimer
    Interval = 2000
    Left = 208
    Top = 408
  end
end
