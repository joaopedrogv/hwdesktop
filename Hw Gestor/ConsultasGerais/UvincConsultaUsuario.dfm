object FrmvincUsuario: TFrmvincUsuario
  Left = 233
  Top = 94
  Caption = 'Vinculando Consulta a usu'#225'rio'
  ClientHeight = 411
  ClientWidth = 773
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 773
    Height = 41
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 10
      Top = 11
      Width = 148
      Height = 19
      Caption = '[NOME CONSULTA] '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 41
    Width = 773
    Height = 152
    Align = alTop
    DataSource = DtmConsGeral.Dtsenhas
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Panel2: TPanel
    Left = 0
    Top = 193
    Width = 773
    Height = 41
    Align = alTop
    TabOrder = 2
    object BitBtn1: TBitBtn
      Left = 280
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Incluir >>'
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 377
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Excluir'
      TabOrder = 1
      OnClick = BitBtn2Click
    end
  end
  object DBGrid2: TDBGrid
    Left = 0
    Top = 234
    Width = 773
    Height = 143
    Align = alTop
    DataSource = DtmConsGeral.DtSenhavinc
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object BitBtn3: TBitBtn
    Left = 352
    Top = 378
    Width = 75
    Height = 25
    Caption = 'Sair'
    TabOrder = 4
    OnClick = BitBtn3Click
  end
end
