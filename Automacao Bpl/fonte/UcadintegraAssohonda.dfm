object FrCadIntegraAssoHonda: TFrCadIntegraAssoHonda
  Left = 233
  Top = 94
  BorderIcons = []
  Caption = 'Incluir Dados para Integra'#231#227'o Assohonda'
  ClientHeight = 139
  ClientWidth = 398
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 16
    Width = 88
    Height = 13
    Caption = 'Data Lan'#231'amento:'
  end
  object Label2: TLabel
    Left = 58
    Top = 43
    Width = 38
    Height = 13
    Caption = 'Modelo:'
  end
  object Label3: TLabel
    Left = 37
    Top = 69
    Width = 59
    Height = 13
    Caption = 'Cor F'#225'brica:'
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 104
    Top = 35
    Width = 257
    Height = 21
    DataField = 'COD_MODELO'
    DataSource = dtmFabrica.DtcomunicaAssoHonda
    KeyField = 'CODIGO'
    ListField = 'DESCRICAO'
    ListSource = dtmFabrica.DtTipoModelo
    TabOrder = 1
  end
  object DBLookupComboBox2: TDBLookupComboBox
    Left = 104
    Top = 62
    Width = 257
    Height = 21
    DataField = 'COD_COR'
    DataSource = dtmFabrica.DtcomunicaAssoHonda
    KeyField = 'COD_COR'
    ListField = 'DESCRICAO_COR'
    ListSource = dtmFabrica.DtCodigoCorFab
    TabOrder = 2
  end
  object BitBtn1: TBitBtn
    Left = 112
    Top = 103
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 3
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
  object BitBtn2: TBitBtn
    Left = 209
    Top = 103
    Width = 75
    Height = 25
    TabOrder = 4
    Kind = bkCancel
  end
  object DBEdit1: TDBEdit
    Left = 104
    Top = 9
    Width = 121
    Height = 21
    DataField = 'DATA_ARQUIVO'
    DataSource = dtmFabrica.DtcomunicaAssoHonda
    TabOrder = 0
  end
end
