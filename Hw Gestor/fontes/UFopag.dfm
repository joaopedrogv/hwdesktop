inherited FrmFopag: TFrmFopag
  Left = 217
  Top = 44
  Caption = 'C'#225'lculo de Provisionamento FOPAG'
  ClientHeight = 612
  ClientWidth = 805
  Position = poScreenCenter
  ExplicitWidth = 813
  ExplicitHeight = 646
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 805
    Height = 41
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 175
      Top = 26
      Width = 156
      Height = 13
      Caption = 'Tipo de FOLHA DE PAGAMENTO:'
    end
    object Label14: TLabel
      Left = 11
      Top = 26
      Width = 23
      Height = 13
      Caption = 'M'#234's:'
    end
    object Label15: TLabel
      Left = 83
      Top = 26
      Width = 23
      Height = 13
      Caption = 'Ano:'
    end
    object ComboBox1: TComboBox
      Left = 337
      Top = 18
      Width = 145
      Height = 21
      ItemHeight = 13
      TabOrder = 2
      Text = 'FIXO'
      Items.Strings = (
        'FIXO'
        'VARI'#193'VEL')
    end
    object BitBtn1: TBitBtn
      Left = 486
      Top = 3
      Width = 169
      Height = 35
      Caption = 'Visualizar Contas >>'
      TabOrder = 3
      OnClick = BitBtn1Click
      Glyph.Data = {
        D6090000424DD6090000000000003604000028000000300000001E0000000100
        080000000000A0050000C30E0000C30E00000001000000000000000000007B00
        0000FF000000007B00007B7B000000FF0000FFFF0000007B7B007B7B7B00BDBD
        BD0000FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00090909090909
        0909090909090909090909090909090909090909090909090909090909090909
        0909090909090909090909090909090909090909090909090909090909090909
        0909090909090909090909090909090909090909090909090909090909090909
        0909090909090909090909090909090000000909090909090909090909090909
        0909090909090909090909090909090909090909090909090909090909090002
        0602010909090909090909090909090909090909090909090909090909090909
        0909090909090909090909090909000206060201090909090909090909090909
        0909090909090909090909090909090909090909090909090909090909090002
        0206060201090909090909090909090909090909090909090909090909090909
        0909090909090909090909090909080002020606020109090909090909090909
        0909090909090909090909090909090909090909090909090909090909090908
        0002020606020109090909090909090909090909090909090909090909090909
        0909090909090909090909090909090908000202060602010909090909090909
        0909090909090909090909090909090909090909090909090909090909090909
        0908000202060602010909090909090909090909090909090909090909090909
        0909090909090909090909090909090909090800020206060201090909090909
        0909090909090909090909090909090909090909090909090909090909090909
        0909090800020206060208090909090909090909090909090909090900000000
        000000000000000909090909090909090909090908000202060B090809090909
        0909090909090909090909090000030303030303030303000909090909090909
        090909090908000208090B090800000000000009090909090909090900050003
        0303030303030303000909090909090909090909090908000808090000040404
        0404040000090909090909090005050003030303030303030300090909090909
        09090909090909080008000404060B060B060B060B0809090909090900050000
        000303030303030303030009090909090902090909090909080004040B0B060B
        060B060B060B0809090909090005000606000000000000000000000909090909
        0902020909090909080004060B060B060B060B060B060B080909090900050006
        0001060000000000060109090902020202020202090909080004060B060B060B
        060B060B060B0608090909090005000606010606060606060601090909020202
        020202020909090800040B060B060B060B060B060B060B080909090900050006
        0001060000060101010109090909090909020209090909080004060B060B060B
        060B060B060B0608090909090900000606010606060601060109090909090909
        090209090909090800040B060B060B060B060B060B060B080909090909090006
        0001060606060101090909090909090909090909090909080004060B060B060B
        060B060B060B0608090909090909000606010101010101090909090909090909
        090909090909090908000B060B060B060B060B060B0608090909090909090006
        0606060000090909090909090909090909090909090909090800040B060B060B
        060B060B060B0809090909090909000000000000090909090909090909090909
        0909090909090909090800040B060B060B060B060B0809090909090909090909
        09090909090909090909090909090909090909090909090909090800000B060B
        060B060808090909090909090909090909090909090909090909090909090909
        0909090909090909090909090800080808080809090909090909090909090909
        0909090909090909090909090909090909090909090909090909090909090909
        0909090909090909090909090909090909090909090909090909090909090909
        0909090909090909090909090909090909090909090909090909}
    end
    object Edit1: TEdit
      Left = 36
      Top = 18
      Width = 42
      Height = 21
      TabOrder = 0
    end
    object Edit2: TEdit
      Left = 114
      Top = 18
      Width = 53
      Height = 21
      TabOrder = 1
    end
    object RadioButton1: TRadioButton
      Left = 659
      Top = 4
      Width = 141
      Height = 17
      Caption = 'Regime de Compet'#234'ncia'
      Checked = True
      TabOrder = 4
      TabStop = True
    end
    object RadioButton2: TRadioButton
      Left = 659
      Top = 21
      Width = 113
      Height = 17
      Caption = 'Regime de Caixa'
      TabOrder = 5
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 41
    Width = 805
    Height = 26
    Align = alTop
    Caption = 'Dados para C'#225'lculo de FOPAG'
    TabOrder = 1
  end
  object Panel3: TPanel
    Left = 0
    Top = 67
    Width = 805
    Height = 120
    Align = alTop
    Enabled = False
    TabOrder = 2
    object Label2: TLabel
      Left = 31
      Top = 14
      Width = 99
      Height = 13
      Caption = 'Valor Total da Folha:'
    end
    object Label3: TLabel
      Left = 11
      Top = 40
      Width = 119
      Height = 13
      Caption = 'N'#250'mero de Funcion'#225'rios:'
    end
    object Label4: TLabel
      Left = 63
      Top = 64
      Width = 67
      Height = 13
      Caption = 'Sal'#225'rio M'#233'dio:'
    end
    object Label5: TLabel
      Left = 53
      Top = 87
      Width = 77
      Height = 13
      Caption = 'Tipo de Regime:'
    end
    object Label6: TLabel
      Left = 384
      Top = 6
      Width = 311
      Height = 13
      Caption = 'Qtde Funcion'#225'rios que Sa'#237'ram da Empresa nos '#218'ltimos 12 meses:'
    end
    object Label7: TLabel
      Left = 403
      Top = 60
      Width = 46
      Height = 13
      Caption = 'INSS(%):'
    end
    object Label9: TLabel
      Left = 637
      Top = 63
      Width = 48
      Height = 13
      Caption = 'FGTS(%):'
    end
    object EdtValorFolha: TEditMoeda
      Left = 136
      Top = 6
      Width = 121
      Height = 21
      Alignment = taRightJustify
      TabOrder = 0
      FormatReal = fMoney
      FormatSize = '10.2'
      OnExit = EdtValorFolhaExit
    end
    object EdtNumeroFunc: TEditMoeda
      Left = 136
      Top = 32
      Width = 121
      Height = 21
      Alignment = taRightJustify
      TabOrder = 1
      FormatReal = fInteger
      FormatSize = '10.2'
      Valor = 1.000000000000000000
      OnExit = EdtNumeroFuncExit
    end
    object EdtSalMedio: TEditMoeda
      Left = 136
      Top = 56
      Width = 121
      Height = 21
      Alignment = taRightJustify
      Enabled = False
      TabOrder = 2
      FormatReal = fMoney
      FormatSize = '10.2'
    end
    object ComboBox2: TComboBox
      Left = 136
      Top = 82
      Width = 121
      Height = 21
      ItemHeight = 13
      TabOrder = 3
      Text = 'SIMPLES'
      OnExit = ComboBox2Exit
      Items.Strings = (
        'SIMPLES'
        'LUCRO REAL'
        'LUCRO PRESUMIDO')
    end
    object EdtNFuncSairam: TEditMoeda
      Left = 475
      Top = 25
      Width = 100
      Height = 32
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      FormatReal = fInteger
      FormatSize = '10.2'
      OnExit = EdtNFuncSairamExit
    end
    object EdtINSS: TEditMoeda
      Left = 365
      Top = 79
      Width = 100
      Height = 32
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      FormatReal = fNumber
      FormatSize = '10.2'
      OnExit = EdtINSSExit
    end
    object EdtFGTS: TEditMoeda
      Left = 585
      Top = 82
      Width = 100
      Height = 32
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      FormatReal = fNumber
      FormatSize = '10.2'
      Valor = 8.000000000000000000
      OnExit = EdtFGTSExit
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 187
    Width = 805
    Height = 32
    Align = alTop
    Caption = 'Valor a Transportar para a Planilha de Custos'
    TabOrder = 3
  end
  object Panel5: TPanel
    Left = 0
    Top = 219
    Width = 805
    Height = 393
    Align = alClient
    TabOrder = 4
    object Label8: TLabel
      Left = 389
      Top = 6
      Width = 78
      Height = 16
      Caption = 'TOTAL FGTS:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label10: TLabel
      Left = 365
      Top = 30
      Width = 102
      Height = 16
      Caption = 'INSS DA FOLHA:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label11: TLabel
      Left = 30
      Top = 75
      Width = 68
      Height = 16
      Caption = 'Provis'#245'es:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label12: TLabel
      Left = 325
      Top = 54
      Width = 142
      Height = 16
      Caption = 'TOTAL GASTO NO M'#202'S:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label13: TLabel
      Left = 315
      Top = 336
      Width = 152
      Height = 16
      Caption = 'TOTAL DAS PROVIS'#213'ES:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object EdttotalFGTS: TEditMoeda
      Left = 474
      Top = 1
      Width = 121
      Height = 21
      Alignment = taRightJustify
      Enabled = False
      TabOrder = 0
      FormatReal = fMoney
      FormatSize = '10.2'
    end
    object EdtTotalINSS: TEditMoeda
      Left = 474
      Top = 25
      Width = 121
      Height = 21
      Alignment = taRightJustify
      Enabled = False
      TabOrder = 1
      FormatReal = fMoney
      FormatSize = '10.2'
    end
    object StProvisoes: TStringGrid
      Left = 30
      Top = 90
      Width = 755
      Height = 236
      ColCount = 2
      FixedCols = 0
      RowCount = 9
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      ColWidths = (
        442
        124)
    end
    object EdtTotalGastoMes: TEditMoeda
      Left = 474
      Top = 49
      Width = 121
      Height = 21
      Alignment = taRightJustify
      Enabled = False
      TabOrder = 3
      FormatReal = fMoney
      FormatSize = '10.2'
    end
    object EdtTotalProvisoes: TEditMoeda
      Left = 474
      Top = 331
      Width = 125
      Height = 21
      Alignment = taRightJustify
      Enabled = False
      TabOrder = 4
      FormatReal = fMoney
      FormatSize = '10.2'
    end
    object BitBtn2: TBitBtn
      Left = 365
      Top = 358
      Width = 123
      Height = 28
      Hint = 'Grava Provisionamento Planilha de Custos'
      Caption = 'Gravar Planilha Custos'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      OnClick = BitBtn2Click
    end
    object BitBtn3: TBitBtn
      Left = 725
      Top = 362
      Width = 75
      Height = 25
      Caption = '&Fechar'
      TabOrder = 6
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
  end
end
