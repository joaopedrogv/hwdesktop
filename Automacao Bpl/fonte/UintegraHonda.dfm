inherited FrmIntegraHonda: TFrmIntegraHonda
  Left = 234
  Top = 26
  BorderIcons = []
  Caption = 'Integra'#231#227'o com a Honda'
  ClientHeight = 452
  ClientWidth = 491
  Position = poMainFormCenter
  OnClose = FormClose
  ExplicitWidth = 499
  ExplicitHeight = 486
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 377
    Width = 491
    Height = 44
    Align = alClient
    Style = tsButtons
    TabOrder = 4
  end
  object Panel1: TPanel
    Left = 0
    Top = 421
    Width = 491
    Height = 31
    Align = alBottom
    TabOrder = 3
    object BitBtn1: TBitBtn
      Left = 394
      Top = 6
      Width = 75
      Height = 25
      Caption = '&Fechar'
      TabOrder = 1
      OnClick = BitBtn1Click
      Kind = bkCancel
    end
    object BitBtn3: TBitBtn
      Left = 16
      Top = 6
      Width = 372
      Height = 25
      Hint = 'Processar Arquivos - [FAB013]'
      Caption = '&Processar Arquivos'
      Default = True
      TabOrder = 0
      OnClick = BitBtn3Click
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 491
    Height = 297
    Align = alTop
    Caption = 'Processar Pre'#231'o Honda'
    TabOrder = 0
    object Label3: TLabel
      Left = 89
      Top = 31
      Width = 48
      Height = 13
      Caption = 'MZ/M1...:'
    end
    object Label4: TLabel
      Left = 89
      Top = 50
      Width = 52
      Height = 13
      Caption = 'QZ/Q1....:'
    end
    object Label5: TLabel
      Left = 89
      Top = 74
      Width = 60
      Height = 13
      Caption = 'PZ...........:'
    end
    object Label6: TLabel
      Left = 89
      Top = 147
      Width = 61
      Height = 13
      Caption = 'H3...........:'
    end
    object Label7: TLabel
      Left = 90
      Top = 171
      Width = 61
      Height = 13
      Caption = 'H4...........:'
    end
    object Label11: TLabel
      Left = 89
      Top = 196
      Width = 61
      Height = 13
      Caption = 'H5...........:'
    end
    object Label12: TLabel
      Left = 89
      Top = 122
      Width = 61
      Height = 13
      Caption = 'H2...........:'
    end
    object Label13: TLabel
      Left = 262
      Top = 23
      Width = 61
      Height = 13
      Caption = 'H7...........:'
    end
    object Label14: TLabel
      Left = 90
      Top = 221
      Width = 61
      Height = 13
      Caption = 'H6...........:'
    end
    object Label15: TLabel
      Left = 262
      Top = 47
      Width = 61
      Height = 13
      Caption = 'H8...........:'
    end
    object Label16: TLabel
      Left = 263
      Top = 98
      Width = 62
      Height = 13
      Caption = 'CA...........:'
    end
    object Label17: TLabel
      Left = 262
      Top = 72
      Width = 61
      Height = 13
      Caption = 'PN...........:'
    end
    object Label18: TLabel
      Left = 89
      Top = 98
      Width = 61
      Height = 13
      Caption = 'H0...........:'
    end
    object Label23: TLabel
      Left = 255
      Top = 122
      Width = 59
      Height = 13
      Caption = 'Aliq.Padrao:'
    end
    object Label25: TLabel
      Left = 245
      Top = 145
      Width = 71
      Height = 13
      Caption = 'Nat. Op. Pad.:'
    end
    object Label9: TLabel
      Left = 335
      Top = 228
      Width = 43
      Height = 13
      Caption = 'Registro '
    end
    object Label10: TLabel
      Left = 233
      Top = 170
      Width = 81
      Height = 13
      Caption = 'Coeficiente Loja:'
    end
    object Label24: TLabel
      Left = 317
      Top = 275
      Width = 162
      Height = 13
      Caption = 'Pe'#231'a com Problemas nas simiilares'
    end
    object MaskEdit3: TMaskEdit
      Left = 143
      Top = 15
      Width = 81
      Height = 21
      TabOrder = 0
    end
    object MaskEdit4: TMaskEdit
      Left = 144
      Top = 42
      Width = 81
      Height = 21
      TabOrder = 1
    end
    object MaskEdit5: TMaskEdit
      Left = 144
      Top = 66
      Width = 81
      Height = 21
      TabOrder = 2
    end
    object MaskEdit6: TMaskEdit
      Left = 144
      Top = 139
      Width = 81
      Height = 21
      TabOrder = 5
    end
    object MaskEdit7: TMaskEdit
      Left = 144
      Top = 163
      Width = 81
      Height = 21
      TabOrder = 6
    end
    object MaskEdit9: TMaskEdit
      Left = 144
      Top = 188
      Width = 81
      Height = 21
      TabOrder = 7
    end
    object MaskEdit10: TMaskEdit
      Left = 144
      Top = 114
      Width = 81
      Height = 21
      TabOrder = 4
    end
    object MaskEdit11: TMaskEdit
      Left = 317
      Top = 15
      Width = 81
      Height = 21
      TabOrder = 9
    end
    object MaskEdit12: TMaskEdit
      Left = 144
      Top = 213
      Width = 81
      Height = 21
      TabOrder = 8
    end
    object MaskEdit13: TMaskEdit
      Left = 317
      Top = 39
      Width = 81
      Height = 21
      TabOrder = 10
    end
    object MaskEdit14: TMaskEdit
      Left = 317
      Top = 90
      Width = 81
      Height = 21
      TabOrder = 12
    end
    object MaskEdit15: TMaskEdit
      Left = 317
      Top = 64
      Width = 81
      Height = 21
      TabOrder = 11
    end
    object MaskEdit16: TMaskEdit
      Left = 144
      Top = 90
      Width = 81
      Height = 21
      TabOrder = 3
    end
    object MaskEdit21: TMaskEdit
      Left = 317
      Top = 114
      Width = 81
      Height = 21
      TabOrder = 13
    end
    object MaskEdit22: TMaskEdit
      Left = 317
      Top = 139
      Width = 81
      Height = 21
      TabOrder = 14
    end
    object MaskEdit8: TMaskEdit
      Left = 317
      Top = 166
      Width = 81
      Height = 21
      TabOrder = 15
    end
    object CheckBox1: TCheckBox
      Left = 41
      Top = 247
      Width = 111
      Height = 17
      Caption = 'Processa Similares'
      TabOrder = 16
    end
    object CheckBox2: TCheckBox
      Left = 41
      Top = 270
      Width = 195
      Height = 17
      Caption = 'Coeficiente em Cima Preco P'#250'blico'
      TabOrder = 17
    end
    object Memo1: TMemo
      Left = 317
      Top = 193
      Width = 164
      Height = 79
      TabOrder = 18
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 297
    Width = 491
    Height = 80
    Align = alTop
    Caption = 'Processar Contas a Pagar e Transito Honda'
    TabOrder = 1
    object CheckBox3: TCheckBox
      Left = 152
      Top = 20
      Width = 129
      Height = 17
      Caption = 'Tipo arquivo CRE'
      Enabled = False
      TabOrder = 0
    end
    object CheckBox4: TCheckBox
      Left = 152
      Top = 38
      Width = 129
      Height = 17
      Caption = 'Tipo arquivo FDC'
      Checked = True
      Enabled = False
      State = cbChecked
      TabOrder = 1
    end
    object CheckBox5: TCheckBox
      Left = 152
      Top = 58
      Width = 129
      Height = 17
      Caption = 'Tipo arquivo PCF'
      Checked = True
      Enabled = False
      State = cbChecked
      TabOrder = 2
    end
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 377
    Width = 491
    Height = 44
    Align = alClient
    Caption = 'Montar TSI'
    TabOrder = 2
    object Label21: TLabel
      Left = 73
      Top = 16
      Width = 57
      Height = 13
      Caption = 'Data Inicial:'
    end
    object Label22: TLabel
      Left = 217
      Top = 16
      Width = 52
      Height = 13
      Caption = 'Data Final:'
    end
    object MaskEdit19: TMaskEdit
      Left = 135
      Top = 14
      Width = 67
      Height = 21
      EditMask = '!99/99/0000;1;_'
      MaxLength = 10
      TabOrder = 0
      Text = '  /  /    '
    end
    object MaskEdit20: TMaskEdit
      Left = 273
      Top = 14
      Width = 68
      Height = 21
      EditMask = '!99/99/0000;1;_'
      MaxLength = 10
      TabOrder = 1
      Text = '  /  /    '
    end
    object BitBtn2: TBitBtn
      Left = 394
      Top = 11
      Width = 75
      Height = 25
      Hint = 'Montar Arquivo MSI - [FAB005]'
      Caption = '&OK'
      Default = True
      TabOrder = 2
      OnClick = BitBtn2Click
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 256
    Top = 272
  end
end
