inherited FrmSelEtiquetaCli: TFrmSelEtiquetaCli
  Left = 386
  Top = 198
  AutoSize = True
  Caption = 'Etiquetas de Clientes'
  ClientHeight = 158
  ClientWidth = 444
  Position = poMainFormCenter
  ExplicitLeft = 386
  ExplicitTop = 198
  ExplicitWidth = 460
  ExplicitHeight = 194
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 444
    Height = 158
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 56
    ExplicitTop = 8
    ExplicitWidth = 185
    ExplicitHeight = 105
    object Label1: TLabel
      Left = 20
      Top = 36
      Width = 170
      Height = 13
      Caption = 'Selecione a etiqueta desejada'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBLookupComboBox1: TDBLookupComboBox
      Left = 20
      Top = 55
      Width = 409
      Height = 21
      DropDownAlign = daRight
      ListSource = DataSource1
      TabOrder = 0
    end
    object BitBtn1: TBitBtn
      Left = 137
      Top = 103
      Width = 75
      Height = 25
      TabOrder = 1
      Kind = bkOK
    end
    object BitBtn2: TBitBtn
      Left = 241
      Top = 103
      Width = 75
      Height = 25
      Caption = 'Cancela'
      TabOrder = 2
      Kind = bkCancel
    end
  end
  object DataSource1: TDataSource
    Left = 240
    Top = 8
  end
end
