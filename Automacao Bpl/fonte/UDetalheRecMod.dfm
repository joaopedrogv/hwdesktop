inherited FrmDetalheRecMod: TFrmDetalheRecMod
  Left = 250
  Top = 102
  AutoSize = True
  Caption = 'Detalhes do Recebimento por Modalidade'
  ClientHeight = 585
  Position = poMainFormCenter
  ExplicitLeft = 250
  ExplicitTop = 102
  ExplicitWidth = 800
  ExplicitHeight = 621
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 784
    Height = 41
    Align = alTop
    Alignment = taLeftJustify
    Caption = '       '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object Label4: TLabel
      Left = 40
      Top = 19
      Width = 109
      Height = 20
      Caption = 'Lan'#231'amentos'
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 41
    Width = 784
    Height = 135
    Align = alTop
    DataSource = DtmClientes.dsLancQuit
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Panel2: TPanel
    Left = 0
    Top = 176
    Width = 784
    Height = 41
    Align = alTop
    Alignment = taLeftJustify
    Caption = '       '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    object Label1: TLabel
      Left = 384
      Top = 1
      Width = 303
      Height = 20
      Alignment = taRightJustify
      AutoSize = False
      Caption = '0,00'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label5: TLabel
      Left = 40
      Top = 20
      Width = 72
      Height = 20
      Caption = 'Cheques'
    end
  end
  object DBGrid2: TDBGrid
    Left = 0
    Top = 217
    Width = 784
    Height = 135
    Align = alTop
    DataSource = DtmClientes.dsCheqQuit
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Panel3: TPanel
    Left = 0
    Top = 352
    Width = 784
    Height = 41
    Align = alTop
    Alignment = taLeftJustify
    Caption = '      '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    object Label2: TLabel
      Left = 376
      Top = 1
      Width = 311
      Height = 20
      Alignment = taRightJustify
      AutoSize = False
      Caption = '0,00'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label6: TLabel
      Left = 40
      Top = 20
      Width = 68
      Height = 20
      Caption = 'Cr'#233'ditos'
    end
  end
  object DBGrid3: TDBGrid
    Left = 0
    Top = 393
    Width = 784
    Height = 135
    Align = alTop
    DataSource = DtmClientes.dsCredQuit
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Panel4: TPanel
    Left = 0
    Top = 528
    Width = 784
    Height = 57
    Align = alTop
    TabOrder = 6
    object Label3: TLabel
      Left = 397
      Top = 2
      Width = 290
      Height = 20
      Alignment = taRightJustify
      AutoSize = False
      Caption = '0,00'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object BitBtn1: TBitBtn
      Left = 354
      Top = 27
      Width = 75
      Height = 25
      TabOrder = 0
      Kind = bkOK
    end
  end
end
