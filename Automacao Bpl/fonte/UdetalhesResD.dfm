inherited FrmDetalhesResD: TFrmDetalhesResD
  Caption = 'Detalhes do Resumo do Dia'
  ClientHeight = 296
  ClientWidth = 765
  Position = poScreenCenter
  OnClose = FormClose
  ExplicitWidth = 773
  ExplicitHeight = 330
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 765
    Height = 255
    Align = alClient
    DataSource = dtmTerminaisF.DtDetalhesResumoD
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Panel1: TPanel
    Left = 0
    Top = 255
    Width = 765
    Height = 41
    Align = alBottom
    TabOrder = 1
    object BitBtn1: TBitBtn
      Left = 344
      Top = 8
      Width = 75
      Height = 25
      TabOrder = 0
      OnClick = BitBtn1Click
      Kind = bkOK
    end
  end
end
