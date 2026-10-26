inherited FrmobsCxl: TFrmobsCxl
  Caption = 'Observacao Caixa Auxiliar'
  ClientHeight = 188
  ClientWidth = 387
  Position = poScreenCenter
  ExplicitWidth = 395
  ExplicitHeight = 219
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 387
    Height = 188
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 90
      Height = 13
      Caption = 'Observacao Caixa:'
    end
    object DBEdit1: TDBEdit
      Left = 102
      Top = 8
      Width = 251
      Height = 21
      CharCase = ecUpperCase
      DataField = 'OBS_CXL_RQ'
      DataSource = DtmPedVenda.dsPedVenda
      TabOrder = 0
    end
    object GroupBox1: TGroupBox
      Left = 13
      Top = 40
      Width = 353
      Height = 105
      Caption = 'Entrada'
      TabOrder = 1
      object Label2: TLabel
        Left = 16
        Top = 32
        Width = 58
        Height = 13
        Caption = 'Modalidade:'
      end
      object Label3: TLabel
        Left = 7
        Top = 57
        Width = 67
        Height = 13
        Caption = 'Valor Entrada:'
      end
      object Label4: TLabel
        Left = 15
        Top = 78
        Width = 59
        Height = 13
        Caption = 'Vencimento:'
      end
      object DBLookupComboBox1: TDBLookupComboBox
        Left = 80
        Top = 23
        Width = 252
        Height = 21
        KeyField = 'CODIGO_CTRL'
        ListField = 'NOME_CTRL'
        ListSource = DataSource1
        TabOrder = 0
      end
      object MaskEdit1: TMaskEdit
        Left = 80
        Top = 72
        Width = 65
        Height = 21
        EditMask = '!99/99/0000;1;_'
        MaxLength = 10
        TabOrder = 2
        Text = '  /  /    '
      end
      object EditMoeda1: TEditMoeda
        Left = 80
        Top = 46
        Width = 121
        Height = 21
        Alignment = taRightJustify
        TabOrder = 1
        FormatReal = fNumber
        FormatSize = '10.2'
      end
    end
    object BitBtn2: TBitBtn
      Left = 192
      Top = 155
      Width = 75
      Height = 25
      Caption = 'Cancela'
      TabOrder = 3
      Kind = bkCancel
    end
    object BitBtn1: TBitBtn
      Left = 111
      Top = 155
      Width = 75
      Height = 25
      TabOrder = 2
      OnClick = BitBtn1Click
      Kind = bkOK
    end
  end
  object DataSource1: TDataSource
    DataSet = DtmPedVenda.QrControlesEnt
    Left = 269
    Top = 112
  end
end
