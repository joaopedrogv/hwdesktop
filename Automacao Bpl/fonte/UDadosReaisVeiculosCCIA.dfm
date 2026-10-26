inherited frmDadosReaisVeiculosCCIA: TfrmDadosReaisVeiculosCCIA
  BorderIcons = [biSystemMenu]
  Caption = 'Cadastro de Dados Reais da Venda:'
  ClientHeight = 426
  ClientWidth = 698
  Position = poMainFormCenter
  ExplicitWidth = 706
  ExplicitHeight = 460
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 698
    Height = 426
    Align = alClient
    Caption = 'Entrada de Dados Real da Compra/Venda'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object GroupBox16: TGroupBox
      Left = 2
      Top = 15
      Width = 694
      Height = 194
      Align = alTop
      TabOrder = 0
      object Label86: TLabel
        Left = 44
        Top = 88
        Width = 120
        Height = 13
        Caption = 'Valor real da compra:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label87: TLabel
        Left = 363
        Top = 88
        Width = 112
        Height = 13
        Caption = 'Valor real da venda:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label88: TLabel
        Left = 17
        Top = 115
        Width = 147
        Height = 13
        Caption = 'Participa'#231#227'o do vendedor:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label89: TLabel
        Left = 337
        Top = 115
        Width = 138
        Height = 13
        Caption = 'Participa'#231#227'o do gerente:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label90: TLabel
        Left = 53
        Top = 142
        Width = 111
        Height = 13
        Caption = 'Comiss'#227'o do banco:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label93: TLabel
        Left = 358
        Top = 142
        Width = 117
        Height = 13
        Caption = 'Coeficiente utilizado:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label94: TLabel
        Left = 52
        Top = 169
        Width = 112
        Height = 13
        Caption = 'Despesa Financeira:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label32: TLabel
        Left = 347
        Top = 169
        Width = 128
        Height = 13
        Caption = 'Bonifica'#231#227'o de Fabrica:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Shape1: TShape
        Left = 2
        Top = 15
        Width = 690
        Height = 26
        Align = alTop
        ExplicitLeft = 1
        ExplicitTop = 3
        ExplicitWidth = 776
      end
      object Shape2: TShape
        Left = 2
        Top = 41
        Width = 690
        Height = 26
        Align = alTop
        ExplicitTop = 15
        ExplicitWidth = 776
      end
      object Label1: TLabel
        Left = 24
        Top = 22
        Width = 59
        Height = 13
        Caption = 'Vendedor:'
      end
      object Label2: TLabel
        Left = 24
        Top = 47
        Width = 88
        Height = 13
        Caption = 'Valor de Custo:'
      end
      object Label3: TLabel
        Left = 371
        Top = 47
        Width = 67
        Height = 13
        Caption = 'Custo Real:'
      end
      object Label4: TLabel
        Left = 89
        Top = 22
        Width = 13
        Height = 13
        Caption = '...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 118
        Top = 47
        Width = 13
        Height = 13
        Caption = '...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 444
        Top = 47
        Width = 13
        Height = 13
        Caption = '...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object EditHw1: TEditHw
        Left = 167
        Top = 85
        Width = 130
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        Text = '                                   0'
        Formato = fNumber
        FormatSize = '0.2'
      end
      object EditHw2: TEditHw
        Left = 478
        Top = 85
        Width = 130
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        Text = '                                   0'
        Formato = fNumber
        FormatSize = '0.2'
      end
      object EditHw3: TEditHw
        Left = 167
        Top = 112
        Width = 130
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        Text = '                                   0'
        Formato = fNumber
        FormatSize = '0.2'
      end
      object EditHw4: TEditHw
        Left = 478
        Top = 112
        Width = 130
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        Text = '                                   0'
        Formato = fNumber
        FormatSize = '0.2'
      end
      object EditHw5: TEditHw
        Left = 167
        Top = 139
        Width = 130
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        Text = '                                   0'
        Formato = fNumber
        FormatSize = '0.2'
      end
      object EditHw9: TEditHw
        Left = 167
        Top = 166
        Width = 130
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
        Text = '                                   0'
        Formato = fNumber
        FormatSize = '0.2'
      end
      object EditHw10: TEditHw
        Left = 478
        Top = 167
        Width = 130
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
        Text = '                                   0'
        Formato = fNumber
        FormatSize = '0.2'
      end
      object EditHw8: TEditHw
        Left = 478
        Top = 139
        Width = 130
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        Text = '                                   0'
        Formato = fNumber
        FormatSize = '0.2'
      end
    end
    object GroupBox17: TGroupBox
      Left = 2
      Top = 209
      Width = 694
      Height = 73
      Align = alTop
      TabOrder = 1
      object Label91: TLabel
        Left = 189
        Top = 20
        Width = 286
        Height = 13
        Caption = 'Participa'#231#227'o do retorno do banco para o vendedor:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label92: TLabel
        Left = 198
        Top = 46
        Width = 277
        Height = 13
        Caption = 'Participa'#231#227'o do retorno do banco para o gerente:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object EditHw7: TEditHw
        Left = 478
        Top = 44
        Width = 130
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        Text = '                                   0'
        Formato = fNumber
        FormatSize = '0.2'
      end
      object EditHw6: TEditHw
        Left = 478
        Top = 16
        Width = 130
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        Text = '                                   0'
        Formato = fNumber
        FormatSize = '0.2'
      end
    end
    object GroupBox18: TGroupBox
      Left = 2
      Top = 282
      Width = 694
      Height = 101
      Align = alClient
      TabOrder = 2
      object Label95: TLabel
        Left = 57
        Top = 24
        Width = 107
        Height = 13
        Caption = 'Local de Formento:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Memo1: TMemo
        Left = 168
        Top = 9
        Width = 439
        Height = 89
        TabOrder = 0
      end
    end
    object Panel1: TPanel
      Left = 2
      Top = 383
      Width = 694
      Height = 41
      Align = alBottom
      TabOrder = 3
      object BitBtn4: TBitBtn
        Left = 267
        Top = 6
        Width = 75
        Height = 25
        Caption = '&OK'
        TabOrder = 0
        OnClick = BitBtn4Click
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
      object BitBtn5: TBitBtn
        Left = 353
        Top = 6
        Width = 75
        Height = 25
        Caption = '&Cancela'
        TabOrder = 1
        OnClick = BitBtn5Click
        Glyph.Data = {
          12020000424D1202000000000000120100002800000010000000100000000100
          08000000000000010000120B0000120B0000370000003700000000000000FFFF
          FF00FF00FF001442E4001645EB001C4BE7000430EB000C35E4000E3CEB001037
          DB000027EB00002AEB000027E400012CEB00052BDC00062DE300092ED9000022
          EB000021E7000020E200001FDC000022DC000020D900001EEB00001FEB000020
          EB00001DE800001BE300001EE200001FE200001BDF00001CDF00001AEB00001A
          E2000017DF000019DF00001ADF000011EB000016EB000012E6000010DC000013
          DC000010D9000009EB00000BEB000008EA000008E700000ADF000004E2000005
          E2000004DF000005DF000003DB000004DA0000006E0002020202020202020202
          0202020202020202020202020202020202020202020202020236360202020202
          0236360202020202361A28360202020236302E36020202023621182A36020236
          332B34360202020202362419293636312C353602020202020202361E11272D2B
          3236020202020202020202361B26252F36020202020202020202023612172022
          36020202020202020202360F06131C0A2336020202020202023607080E363614
          0B1F3602020202023603041036020236160D1D36020202023605093602020202
          36150C3602020202023636020202020202363602020202020202020202020202
          02020202020202020202020202020202020202020202}
      end
    end
  end
end
