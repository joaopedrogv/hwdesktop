inherited frmEmpresa: TfrmEmpresa
  Left = 277
  Top = 147
  Caption = 'Dados da Empresa'
  ClientHeight = 375
  ClientWidth = 596
  OnClose = FormClose
  OnShow = FormShow
  ExplicitLeft = 277
  ExplicitTop = 147
  ExplicitWidth = 612
  ExplicitHeight = 411
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 596
    Height = 325
    Align = alClient
    BevelKind = bkTile
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 94
      Top = 23
      Width = 37
      Height = 13
      Caption = 'C'#243'digo:'
      FocusControl = DBEdit1
    end
    object Label2: TLabel
      Left = 100
      Top = 50
      Width = 31
      Height = 13
      Caption = 'Nome:'
      FocusControl = DBEdit2
    end
    object Label3: TLabel
      Left = 82
      Top = 77
      Width = 49
      Height = 13
      Caption = 'Endere'#231'o:'
      FocusControl = DBEdit3
    end
    object Label4: TLabel
      Left = 99
      Top = 104
      Width = 32
      Height = 13
      Caption = 'Bairro:'
      FocusControl = DBEdit4
    end
    object Label5: TLabel
      Left = 94
      Top = 131
      Width = 37
      Height = 13
      Caption = 'Cidade:'
      FocusControl = DBEdit5
    end
    object Label6: TLabel
      Left = 108
      Top = 158
      Width = 23
      Height = 13
      Caption = 'CEP:'
      FocusControl = DBEdit6
    end
    object Label8: TLabel
      Left = 102
      Top = 185
      Width = 29
      Height = 13
      Caption = 'CNPJ:'
      FocusControl = DBEdit8
    end
    object Label9: TLabel
      Left = 63
      Top = 212
      Width = 68
      Height = 13
      Caption = 'Insc Estadual:'
      FocusControl = DBEdit9
    end
    object Label10: TLabel
      Left = 61
      Top = 239
      Width = 70
      Height = 13
      Caption = 'Insc Municipal:'
      FocusControl = DBEdit10
    end
    object Label11: TLabel
      Left = 85
      Top = 266
      Width = 46
      Height = 13
      Caption = 'Telefone:'
      FocusControl = DBEdit11
    end
    object Label12: TLabel
      Left = 427
      Top = 77
      Width = 41
      Height = 13
      Caption = 'N'#250'mero:'
      FocusControl = DBEdit12
    end
    object Label13: TLabel
      Left = 71
      Top = 293
      Width = 60
      Height = 13
      Caption = 'Propriet'#225'rio:'
      FocusControl = DBEdit13
    end
    object DBEdit1: TDBEdit
      Left = 137
      Top = 15
      Width = 134
      Height = 21
      DataField = 'COD_EMPRESA'
      DataSource = DtmFiscalHwF.dsEmp
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 137
      Top = 42
      Width = 394
      Height = 21
      DataField = 'NOME_EMP'
      DataSource = DtmFiscalHwF.dsEmp
      TabOrder = 1
    end
    object DBEdit3: TDBEdit
      Left = 137
      Top = 69
      Width = 281
      Height = 21
      DataField = 'ENDERECO_EMP'
      DataSource = DtmFiscalHwF.dsEmp
      TabOrder = 2
    end
    object DBEdit4: TDBEdit
      Left = 137
      Top = 96
      Width = 394
      Height = 21
      DataField = 'BAIRRO_EMP'
      DataSource = DtmFiscalHwF.dsEmp
      TabOrder = 3
    end
    object DBEdit5: TDBEdit
      Left = 137
      Top = 123
      Width = 394
      Height = 21
      DataField = 'CIDADE_EMP'
      DataSource = DtmFiscalHwF.dsEmp
      TabOrder = 4
    end
    object DBEdit6: TDBEdit
      Left = 137
      Top = 150
      Width = 121
      Height = 21
      DataField = 'CEP_EMP'
      DataSource = DtmFiscalHwF.dsEmp
      TabOrder = 5
    end
    object DBEdit8: TDBEdit
      Left = 137
      Top = 177
      Width = 238
      Height = 21
      DataField = 'CNPJ_EMP'
      DataSource = DtmFiscalHwF.dsEmp
      TabOrder = 6
    end
    object DBEdit9: TDBEdit
      Left = 137
      Top = 204
      Width = 238
      Height = 21
      DataField = 'IE_EMP'
      DataSource = DtmFiscalHwF.dsEmp
      TabOrder = 7
    end
    object DBEdit10: TDBEdit
      Left = 137
      Top = 231
      Width = 238
      Height = 21
      DataField = 'IM_EMP'
      DataSource = DtmFiscalHwF.dsEmp
      TabOrder = 8
    end
    object DBEdit11: TDBEdit
      Left = 137
      Top = 258
      Width = 121
      Height = 21
      DataField = 'TELEFONE_EMP'
      DataSource = DtmFiscalHwF.dsEmp
      TabOrder = 9
    end
    object DBEdit12: TDBEdit
      Left = 474
      Top = 69
      Width = 57
      Height = 21
      DataField = 'NUMERO_END'
      DataSource = DtmFiscalHwF.dsEmp
      TabOrder = 10
    end
    object DBEdit13: TDBEdit
      Left = 137
      Top = 285
      Width = 394
      Height = 21
      DataField = 'PROP_EMP'
      DataSource = DtmFiscalHwF.dsEmp
      TabOrder = 11
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 325
    Width = 596
    Height = 50
    Align = alBottom
    BevelKind = bkTile
    BevelOuter = bvNone
    TabOrder = 1
    object BitBtn1: TBitBtn
      Left = 259
      Top = 10
      Width = 75
      Height = 25
      Caption = 'OK'
      TabOrder = 0
      OnClick = BitBtn1Click
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000D30E0000D30E00000001000000010000008C00000094
        0000009C000000A5000000940800009C100000AD100000AD180000AD210000B5
        210000BD210018B5290000C62900319C310000CE310029AD390031B5420018C6
        420000D6420052A54A0029AD4A0029CE5A006BB5630000FF63008CBD7B00A5C6
        94005AE7A500FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF001B1B1B1B1B13
        04161B1B1B1B1B1B1B1B1B1B1B1B1B0B0A01181B1B1B1B1B1B1B1B1B1B1B160A
        0C030D1B1B1B1B1B1B1B1B1B1B1B050E0C0601191B1B1B1B1B1B1B1B1B130E0C
        170E02001B1B1B1B1B1B1B1B1B0B1517170A0C01181B1B1B1B1B1B1B1B111717
        13130C030D1B1B1B1B1B1B1B1B1B08081B1B070C01191B1B1B1B1B1B1B1B1B1B
        1B1B100C02001B1B1B1B1B1B1B1B1B1B1B1B1B090C01181B1B1B1B1B1B1B1B1B
        1B1B1B130C0F101B1B1B1B1B1B1B1B1B1B1B1B1B141A0F181B1B1B1B1B1B1B1B
        1B1B1B1B1012181B1B1B1B1B1B1B1B1B1B1B1B1B1B191B1B1B1B1B1B1B1B1B1B
        1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B}
    end
  end
end
