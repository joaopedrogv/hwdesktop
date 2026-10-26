inherited FrmDepreciacao: TFrmDepreciacao
  Left = 116
  Caption = 'Deprecia'#231#245'es do M'#234's'
  ClientHeight = 400
  ClientWidth = 938
  Position = poScreenCenter
  OnClose = FormClose
  ExplicitWidth = 954
  ExplicitHeight = 438
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 938
    Height = 41
    Align = alTop
    TabOrder = 0
    object Label14: TLabel
      Left = 11
      Top = 20
      Width = 23
      Height = 13
      Caption = 'M'#234's:'
    end
    object Label15: TLabel
      Left = 83
      Top = 20
      Width = 22
      Height = 13
      Caption = 'Ano:'
    end
    object Edit1: TEdit
      Left = 36
      Top = 12
      Width = 42
      Height = 21
      TabOrder = 0
    end
    object Edit2: TEdit
      Left = 114
      Top = 12
      Width = 53
      Height = 21
      TabOrder = 1
    end
    object BitBtn1: TBitBtn
      Left = 182
      Top = 8
      Width = 75
      Height = 25
      Hint = 'Verificar - [GES048]'
      Caption = 'Verificar >>'
      TabOrder = 2
      OnClick = BitBtn1Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 41
    Width = 938
    Height = 320
    Align = alTop
    BorderStyle = bsSingle
    TabOrder = 1
    object TLabel
      Left = 360
      Top = 152
      Width = 3
      Height = 13
    end
    object Label1: TLabel
      Left = 3
      Top = 279
      Width = 133
      Height = 13
      Caption = 'Valor Total da Deprecia'#231#227'o:'
    end
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 932
      Height = 267
      Align = alTop
      DataSource = DtDprec
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
    end
    object BitBtn2: TBitBtn
      Left = 388
      Top = 280
      Width = 157
      Height = 25
      Hint = 'Lancar Planilha Custos - [GES049]'
      Caption = 'Lan'#231'ar Planilha Custos'
      TabOrder = 1
      OnClick = BitBtn2Click
    end
    object EdtDeprec: TEditMoeda
      Left = 144
      Top = 271
      Width = 121
      Height = 21
      Alignment = taRightJustify
      Enabled = False
      TabOrder = 2
      FormatReal = fMoney
      FormatSize = '10.2'
    end
  end
  object BitBtn3: TBitBtn
    Left = 421
    Top = 367
    Width = 108
    Height = 25
    Caption = '&Fechar'
    TabOrder = 2
    OnClick = BitBtn3Click
    Glyph.Data = {
      0E030000424D0E030000000000003600000028000000110000000E0000000100
      180000000000D8020000C30E0000C30E00000000000000000000BFBFBF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000BFBFBFBFBFBFBFBFBF00BFBFBF000000007F7F007F7F007F7F007F7F
      007F7F007F7F007F7F007F7F007F7F007F7F007F7F000000BFBFBFBFBFBFBFBF
      BF00BFBFBF000000007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
      007F7F007F7F007F7F000000BFBFBFBFBFBFBFBFBF00BFBFBF000000007F7F00
      7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F000000
      BFBFBFBFBFBFBFBFBF00BFBFBF000000007F7F007F7F007F7F007F7F007F7F00
      7F7F007F7F007F7F007F7F007F7F007F7F000000BFBFBFBFBFBFBFBFBF00BFBF
      BF000000007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
      7F7F007F7F000000BFBFBFBFBFBFBFBFBF00BFBFBF000000007F7F007F7F007F
      7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F000000BFBFBFBF
      BFBFBFBFBF00BFBFBF000000007F7F007F7F007F7F007F7F007F7F007F7F007F
      7F007F7F007F7F007F7F007F7F000000BFBFBFBFBFBFBFBFBF00BFBFBF7F7F7F
      0000000000000000000000000000000000000000000000000000000000000000
      007F7F7FBFBFBFBFBFBFBFBFBF00BFBFBFBFBFBF000000FFFFFFFFFFFFFFFFFF
      000000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF7F0000BFBF
      BF00BFBFBFBFBFBFBFBFBF000000000000000000BFBFBFBFBFBFBFBFBFBFBFBF
      BFBFBFBFBFBFBFBFBFBFBFBFBFBFBF7F0000BFBFBF00BFBFBFBFBFBFBFBFBFBF
      BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF7F0000BFBFBF
      7F0000BFBFBFBFBFBF00BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
      BFBFBFBFBFBFBFBFBFBFBFBFBFBF7F00007F0000BFBFBFBFBFBFBFBFBF00BFBF
      BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
      BFBF7F00007F00007F0000BFBFBFBFBFBF00}
  end
  object DtDprec: TDataSource
    DataSet = DtmEquipamentos.qrBuscasEquip
    Left = 560
    Top = 16
  end
end
