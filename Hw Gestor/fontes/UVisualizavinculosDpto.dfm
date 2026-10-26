inherited FrmVisualDpto: TFrmVisualDpto
  Caption = 'Vincula'#231#227'o Vendedor por Departamento/Financeiro'
  ClientHeight = 282
  ClientWidth = 888
  Position = poScreenCenter
  ExplicitWidth = 904
  ExplicitHeight = 320
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 888
    Height = 225
    Align = alTop
    DataSource = DtBuscas
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object BitBtn1: TBitBtn
    Left = 409
    Top = 243
    Width = 75
    Height = 25
    TabOrder = 1
    Kind = bkOK
  end
  object DtBuscas: TDataSource
    DataSet = DtmGestorHw.QrBuscas
    Left = 360
    Top = 144
  end
end
