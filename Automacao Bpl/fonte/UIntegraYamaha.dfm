object FrmIntegraYamaha: TFrmIntegraYamaha
  Left = 0
  Top = 0
  BorderIcons = []
  Caption = 'Integra'#231#227'o com a Yamaha'
  ClientHeight = 279
  ClientWidth = 475
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  ShowHint = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 248
    Width = 475
    Height = 31
    Align = alBottom
    TabOrder = 0
    object BitBtn1: TBitBtn
      Left = 397
      Top = 3
      Width = 75
      Height = 25
      Caption = '&Fechar'
      TabOrder = 1
      OnClick = BitBtn1Click
      Kind = bkCancel
    end
    object BitBtn3: TBitBtn
      Left = 163
      Top = 3
      Width = 145
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
    Width = 475
    Height = 248
    Align = alClient
    Caption = 'Processar Pre'#231'o Yamaha'
    TabOrder = 1
    OnEnter = GroupBox1Enter
    object Label3: TLabel
      Left = 30
      Top = 168
      Width = 107
      Height = 13
      Caption = 'Nat. Op Padr'#227'o.......:'
    end
    object Label1: TLabel
      Left = 29
      Top = 195
      Width = 108
      Height = 13
      Caption = 'CST Padr'#227'o............:'
    end
    object Label2: TLabel
      Left = 29
      Top = 221
      Width = 106
      Height = 13
      Caption = 'Aliq Padr'#227'o............:'
    end
    object Label4: TLabel
      Left = 30
      Top = 66
      Width = 109
      Height = 13
      Caption = 'Nat. Op (ST)...........:'
    end
    object Label5: TLabel
      Left = 30
      Top = 95
      Width = 111
      Height = 13
      Caption = 'Nat. Op (TRIBUTADO):'
    end
    object Label6: TLabel
      Left = 254
      Top = 71
      Width = 88
      Height = 13
      Caption = 'Aliq (ST)...........:'
    end
    object Label7: TLabel
      Left = 254
      Top = 95
      Width = 90
      Height = 13
      Caption = 'Aliq (TRIBUTADO):'
    end
    object ckNCM: TCheckBox
      Left = 29
      Top = 34
      Width = 377
      Height = 17
      Caption = 
        'Usar tabela de NCM para definir se o produto '#233' st (60) ou tribut' +
        'ado (00)'
      TabOrder = 0
      OnClick = ckNCMClick
    end
    object meNatOpPadrao: TMaskEdit
      Left = 145
      Top = 165
      Width = 81
      Height = 21
      TabOrder = 6
    end
    object meCSTPadrao: TMaskEdit
      Left = 145
      Top = 192
      Width = 81
      Height = 21
      TabOrder = 7
    end
    object meALIQPadrao: TMaskEdit
      Left = 145
      Top = 218
      Width = 81
      Height = 21
      TabOrder = 8
    end
    object ckPadrao: TCheckBox
      Left = 29
      Top = 132
      Width = 377
      Height = 17
      Caption = 'Usar informa'#231#227'o padr'#227'o para todos produtos'
      TabOrder = 5
      OnClick = ckPadraoClick
    end
    object meNatOpSt: TMaskEdit
      Left = 145
      Top = 63
      Width = 81
      Height = 21
      TabOrder = 1
    end
    object meNatOpTributado: TMaskEdit
      Left = 145
      Top = 92
      Width = 81
      Height = 21
      TabOrder = 3
    end
    object meAliqSt: TMaskEdit
      Left = 348
      Top = 65
      Width = 81
      Height = 21
      TabOrder = 2
    end
    object meAliqTrib: TMaskEdit
      Left = 348
      Top = 92
      Width = 81
      Height = 21
      TabOrder = 4
    end
  end
end
