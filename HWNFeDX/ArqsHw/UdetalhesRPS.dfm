object FrmDetalhesRPS: TFrmDetalhesRPS
  Left = 233
  Top = 94
  Caption = 'Detalhes do RPS'
  ClientHeight = 401
  ClientWidth = 748
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 49
    Width = 748
    Height = 138
    Align = alTop
    DataSource = DtmNFEHW.DtIbBuscasAdic
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 748
    Height = 49
    Align = alTop
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 12
      Width = 75
      Height = 24
      Caption = 'RPS N.:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object BitBtn1: TBitBtn
    Left = 312
    Top = 372
    Width = 75
    Height = 25
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 2
  end
  object Panel2: TPanel
    Left = 0
    Top = 187
    Width = 748
    Height = 41
    Align = alTop
    TabOrder = 3
    object Label2: TLabel
      Left = 8
      Top = 12
      Width = 153
      Height = 24
      Caption = 'Cancelamentos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object DBGrid2: TDBGrid
    Left = 0
    Top = 228
    Width = 748
    Height = 138
    Align = alTop
    DataSource = DtmNFEHW.DtNFSECanceladas
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
end
