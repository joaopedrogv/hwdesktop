inherited FrmContasSalario: TFrmContasSalario
  Caption = 'Contas de Sal'#225'rios...'
  ClientHeight = 219
  ClientWidth = 751
  Position = poScreenCenter
  ExplicitWidth = 759
  ExplicitHeight = 253
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 8
    Top = 16
    Width = 729
    Height = 153
    DataSource = DtMapaFin
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object BitBtn1: TBitBtn
    Left = 344
    Top = 189
    Width = 75
    Height = 25
    TabOrder = 1
    Kind = bkOK
  end
  object DtMapaFin: TDataSource
    DataSet = dtmGestorHw.CdsMapaFinan
    Left = 368
    Top = 112
  end
end
