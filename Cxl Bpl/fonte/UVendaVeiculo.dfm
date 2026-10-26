inherited FrmVendaMoto: TFrmVendaMoto
  Left = 148
  Top = 85
  Caption = 'Venda de Ve'#237'culo...'
  ClientHeight = 450
  ClientWidth = 674
  OnClose = FormClose
  ExplicitWidth = 682
  ExplicitHeight = 484
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 409
    Width = 674
    Height = 41
    Align = alBottom
    TabOrder = 0
    object BitBtn1: TBitBtn
      Left = 232
      Top = 8
      Width = 75
      Height = 25
      Caption = 'OK'
      Default = True
      ModalResult = 1
      TabOrder = 0
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
      Left = 312
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Cancela'
      TabOrder = 1
      Kind = bkCancel
    end
    object BitBtn5: TBitBtn
      Left = 543
      Top = 7
      Width = 127
      Height = 28
      Caption = 'Imprime NF'
      Enabled = False
      TabOrder = 2
      Glyph.Data = {
        66010000424D6601000000000000760000002800000014000000140000000100
        040000000000F000000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
        DDDDDDDD0000DDDDDDDDDDDDDDDDDDDD0000DDDDD7777777777DDDDD0000DDDD
        000000000007DDDD0000DDD07878787870707DDD0000DD0000000000000707DD
        0000DD0F8F8F8AAA8F0007DD0000DD08F8F8F999F80707DD0000DD0000000000
        0008707D0000DD08F8F8F8F8F080807D0000DDD0000000000F08007D0000DDDD
        0BFFFBFFF0F080DD0000DDDDD0F00000F0000DDD0000DDDDD0FBFFFBFF0DDDDD
        0000DDDDDD0F00000F0DDDDD0000DDDDDD0FFBFFFBF0DDDD0000DDDDDDD00000
        0000DDDD0000DDDDDDDDDDDDDDDDDDDD0000DDDDDDDDDDDDDDDDDDDD0000DDDD
        DDDDDDDDDDDDDDDD0000}
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 674
    Height = 409
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = 'Comando de Faturamento'
      object Label1: TLabel
        Left = 0
        Top = 9
        Width = 79
        Height = 13
        Caption = 'N'#186' do Comando:'
        FocusControl = DBEdit1
      end
      object Label2: TLabel
        Left = 22
        Top = 33
        Width = 56
        Height = 13
        Caption = 'Nota Fiscal:'
        FocusControl = DBEdit2
      end
      object Label3: TLabel
        Left = 2
        Top = 55
        Width = 71
        Height = 13
        Caption = 'Chassi Ve'#237'culo:'
        FocusControl = DBEDIT3
      end
      object Label5: TLabel
        Left = 14
        Top = 79
        Width = 62
        Height = 13
        Caption = 'Nome Resp.:'
        FocusControl = DBEdit5
      end
      object Label6: TLabel
        Left = 18
        Top = 102
        Width = 59
        Height = 13
        Caption = 'Fone Resp.:'
        FocusControl = DBEdit6
      end
      object Label7: TLabel
        Left = 474
        Top = 0
        Width = 85
        Height = 13
        Caption = 'Dados do Ve'#237'culo:'
        FocusControl = DBEDIT3
      end
      object Label8: TLabel
        Left = 190
        Top = 9
        Width = 72
        Height = 13
        Caption = 'Tipo de Venda:'
      end
      object Label4: TLabel
        Left = 18
        Top = 125
        Width = 60
        Height = 13
        Caption = 'Valor Real..:'
        FocusControl = DBEdit4
      end
      object Label9: TLabel
        Left = 8
        Top = 148
        Width = 67
        Height = 13
        Caption = 'VL a Receber:'
        FocusControl = DBEdit7
      end
      object Label10: TLabel
        Left = 8
        Top = 172
        Width = 71
        Height = 13
        Caption = 'Observa'#231#227'o 1:'
        FocusControl = DBEdit8
      end
      object Label11: TLabel
        Left = 8
        Top = 196
        Width = 71
        Height = 13
        Caption = 'Observa'#231#227'o 2:'
        FocusControl = DBEdit9
      end
      object Label12: TLabel
        Left = 8
        Top = 219
        Width = 71
        Height = 13
        Caption = 'Observa'#231#227'o 3:'
        FocusControl = DBEdit10
      end
      object Label13: TLabel
        Left = 8
        Top = 240
        Width = 71
        Height = 13
        Caption = 'Observa'#231#227'o 4:'
        FocusControl = DBEdit11
      end
      object Label14: TLabel
        Left = 8
        Top = 264
        Width = 71
        Height = 13
        Caption = 'Observa'#231#227'o 5:'
        FocusControl = DBEdit12
      end
      object Label32: TLabel
        Left = 400
        Top = 174
        Width = 28
        Height = 13
        Caption = 'Valor:'
      end
      object Label33: TLabel
        Left = 400
        Top = 198
        Width = 28
        Height = 13
        Caption = 'Valor:'
      end
      object Label34: TLabel
        Left = 400
        Top = 221
        Width = 28
        Height = 13
        Caption = 'Valor:'
      end
      object Label35: TLabel
        Left = 400
        Top = 245
        Width = 28
        Height = 13
        Caption = 'Valor:'
      end
      object Label36: TLabel
        Left = 400
        Top = 268
        Width = 28
        Height = 13
        Caption = 'Valor:'
      end
      object Label45: TLabel
        Left = 26
        Top = 288
        Width = 99
        Height = 13
        Caption = 'Recibos Antecipados'
      end
      object DBEdit1: TDBEdit
        Left = 85
        Top = 1
        Width = 99
        Height = 21
        Color = clScrollBar
        DataField = 'N_COMANDO'
        DataSource = DtmBalcao.DtComandoPesq
        Enabled = False
        TabOrder = 1
      end
      object DBEdit2: TDBEdit
        Left = 85
        Top = 25
        Width = 99
        Height = 21
        Color = clScrollBar
        DataField = 'NUM_NOTA_V'
        DataSource = DtmBalcao.DtComandoPesq
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowFrame
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object DBEDIT3: TDBEdit
        Left = 85
        Top = 48
        Width = 139
        Height = 21
        DataField = 'CHASSIV'
        DataSource = DtmBalcao.DtComandoPesq
        TabOrder = 3
      end
      object DBEdit5: TDBEdit
        Left = 85
        Top = 71
        Width = 244
        Height = 21
        CharCase = ecUpperCase
        DataField = 'NOME_RECEB'
        DataSource = DtmBalcao.DtComandoPesq
        TabOrder = 4
      end
      object DBEdit6: TDBEdit
        Left = 85
        Top = 94
        Width = 82
        Height = 21
        DataField = 'FONE_RECEB'
        DataSource = DtmBalcao.DtComandoPesq
        TabOrder = 5
      end
      object DBEdit4: TDBEdit
        Left = 85
        Top = 117
        Width = 82
        Height = 21
        DataField = 'VALOR_REAL'
        DataSource = DtmBalcao.DtComandoPesq
        TabOrder = 6
      end
      object DBEdit7: TDBEdit
        Left = 85
        Top = 140
        Width = 82
        Height = 21
        DataField = 'VALOR_A_REC'
        DataSource = DtmBalcao.DtComandoPesq
        TabOrder = 7
      end
      object DBEdit8: TDBEdit
        Left = 84
        Top = 166
        Width = 309
        Height = 21
        CharCase = ecUpperCase
        DataField = 'OBS1'
        DataSource = DtmBalcao.DtComandoPesq
        TabOrder = 8
      end
      object DBEdit9: TDBEdit
        Left = 84
        Top = 190
        Width = 310
        Height = 21
        CharCase = ecUpperCase
        DataField = 'OBS2'
        DataSource = DtmBalcao.DtComandoPesq
        TabOrder = 10
      end
      object DBEdit10: TDBEdit
        Left = 83
        Top = 213
        Width = 311
        Height = 21
        CharCase = ecUpperCase
        DataField = 'OBS3'
        DataSource = DtmBalcao.DtComandoPesq
        TabOrder = 12
      end
      object DBEdit11: TDBEdit
        Left = 83
        Top = 236
        Width = 311
        Height = 21
        CharCase = ecUpperCase
        DataField = 'OBS4'
        DataSource = DtmBalcao.DtComandoPesq
        TabOrder = 14
      end
      object DBEdit12: TDBEdit
        Left = 83
        Top = 259
        Width = 311
        Height = 21
        CharCase = ecUpperCase
        DataField = 'OBS5'
        DataSource = DtmBalcao.DtComandoPesq
        TabOrder = 16
      end
      object DBEdit21: TDBEdit
        Left = 436
        Top = 166
        Width = 77
        Height = 21
        DataField = 'VALOBS1'
        DataSource = DtmBalcao.DtComandoPesq
        TabOrder = 9
      end
      object DBEdit22: TDBEdit
        Left = 436
        Top = 190
        Width = 77
        Height = 21
        DataField = 'VALOBS2'
        DataSource = DtmBalcao.DtComandoPesq
        TabOrder = 11
      end
      object DBEdit23: TDBEdit
        Left = 436
        Top = 213
        Width = 77
        Height = 21
        DataField = 'VALOBS3'
        DataSource = DtmBalcao.DtComandoPesq
        TabOrder = 13
      end
      object DBEdit24: TDBEdit
        Left = 436
        Top = 237
        Width = 77
        Height = 21
        DataField = 'VALOBS4'
        DataSource = DtmBalcao.DtComandoPesq
        TabOrder = 15
      end
      object DBEdit25: TDBEdit
        Left = 436
        Top = 260
        Width = 77
        Height = 21
        DataField = 'VALOBS5'
        DataSource = DtmBalcao.DtComandoPesq
        TabOrder = 17
      end
      object DBComboBox3: TDBComboBox
        Left = 272
        Top = 0
        Width = 145
        Height = 21
        DataField = 'TIPO_VENDA_V'
        DataSource = DtmBalcao.DtComandoPesq
        ItemHeight = 13
        Items.Strings = (
          'Novo'
          'Usado')
        TabOrder = 0
      end
      object DBMemo3: TDBMemo
        Left = 360
        Top = 27
        Width = 321
        Height = 126
        DataField = 'DADOS_V'
        DataSource = DtmBalcao.DtComandoPesq
        TabOrder = 18
      end
      object DBGrid1: TDBGrid
        Left = 23
        Top = 304
        Width = 636
        Height = 78
        Color = clActiveBorder
        ReadOnly = True
        TabOrder = 19
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Dados da Nota Fiscal'
      Enabled = False
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label15: TLabel
        Left = 68
        Top = 10
        Width = 37
        Height = 13
        Caption = 'Cliente:'
      end
      object Label16: TLabel
        Left = 54
        Top = 34
        Width = 50
        Height = 13
        Caption = 'Vendedor:'
      end
      object Label17: TLabel
        Left = 50
        Top = 58
        Width = 55
        Height = 13
        Caption = 'Cond.Pag.:'
      end
      object Label18: TLabel
        Left = 48
        Top = 82
        Width = 56
        Height = 13
        Caption = 'Cod. Fiscal:'
      end
      object Label19: TLabel
        Left = 33
        Top = 106
        Width = 72
        Height = 13
        Caption = 'Nat.Opera'#231#227'o:'
      end
      object Label20: TLabel
        Left = 21
        Top = 130
        Width = 81
        Height = 13
        Caption = 'Pre'#231'o de Tabela:'
      end
      object Label21: TLabel
        Left = 76
        Top = 153
        Width = 30
        Height = 13
        Caption = 'Frete:'
      end
      object Label22: TLabel
        Left = 66
        Top = 176
        Width = 38
        Height = 13
        Caption = 'Seguro:'
      end
      object Label23: TLabel
        Left = 19
        Top = 199
        Width = 86
        Height = 13
        Caption = 'Outras Despesas:'
      end
      object Label24: TLabel
        Left = 58
        Top = 221
        Width = 47
        Height = 13
        Caption = 'Aliq.Icms:'
      end
      object Label25: TLabel
        Left = 26
        Top = 244
        Width = 73
        Height = 13
        Caption = 'Redu'#231#227'o Base?'
      end
      object Label26: TLabel
        Left = 54
        Top = 269
        Width = 49
        Height = 13
        Caption = 'Desconto:'
      end
      object Label27: TLabel
        Left = 30
        Top = 293
        Width = 72
        Height = 13
        Caption = 'Tipo de Venda:'
      end
      object Label28: TLabel
        Left = 2
        Top = 335
        Width = 130
        Height = 13
        Caption = 'Valor L'#237'quido da Nota:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBText1: TDBText
        Left = 144
        Top = 329
        Width = 89
        Height = 22
        DataField = 'VALTOT_V'
        DataSource = DtmBalcao.DtComandoPesq
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label29: TLabel
        Left = 272
        Top = 288
        Width = 63
        Height = 13
        Caption = 'N'#186' do Grupo:'
        Visible = False
      end
      object Label37: TLabel
        Left = 416
        Top = 288
        Width = 32
        Height = 13
        Caption = 'Pedra:'
        Visible = False
      end
      object DBEdit13: TDBEdit
        Left = 106
        Top = 73
        Width = 121
        Height = 21
        DataField = 'CODFISC_V'
        DataSource = DtmBalcao.DtComandoPesq
        TabOrder = 0
      end
      object DBEdit14: TDBEdit
        Left = 106
        Top = 121
        Width = 121
        Height = 21
        DataField = 'PRVEN_V'
        DataSource = DtmBalcao.DtComandoPesq
        TabOrder = 1
      end
      object DBEdit15: TDBEdit
        Left = 106
        Top = 144
        Width = 121
        Height = 21
        DataField = 'FRETE_V'
        DataSource = DtmBalcao.DtComandoPesq
        TabOrder = 2
      end
      object DBEdit16: TDBEdit
        Left = 106
        Top = 167
        Width = 121
        Height = 21
        DataField = 'SEGURO_V'
        DataSource = DtmBalcao.DtComandoPesq
        TabOrder = 3
      end
      object DBEdit17: TDBEdit
        Left = 106
        Top = 190
        Width = 121
        Height = 21
        DataField = 'OUTDESP_V'
        DataSource = DtmBalcao.DtComandoPesq
        TabOrder = 4
      end
      object DBEdit18: TDBEdit
        Left = 106
        Top = 213
        Width = 55
        Height = 21
        DataField = 'ALICM_V'
        DataSource = DtmBalcao.DtComandoPesq
        TabOrder = 5
      end
      object DBComboBox1: TDBComboBox
        Left = 106
        Top = 236
        Width = 145
        Height = 21
        DataField = 'REDB_V'
        DataSource = DtmBalcao.DtComandoPesq
        ItemHeight = 0
        Items.Strings = (
          'N - N'#227'o'
          'S - Sim')
        TabOrder = 6
      end
      object DBEdit19: TDBEdit
        Left = 106
        Top = 260
        Width = 121
        Height = 21
        DataField = 'OUTDESP_V'
        DataSource = DtmBalcao.DtComandoPesq
        TabOrder = 7
      end
      object DBComboBox2: TDBComboBox
        Left = 106
        Top = 284
        Width = 145
        Height = 21
        DataField = 'TIPO_V'
        DataSource = DtmBalcao.DtComandoPesq
        ItemHeight = 0
        Items.Strings = (
          'AV'
          'CDCP'
          'CP'
          'CT'
          'CTR'
          'CTA'
          'CTV'
          'CNH'
          'CDCT'
          'CC'
          'PP'
          'LSG'
          '')
        TabOrder = 8
      end
      object DBEdit20: TDBEdit
        Left = 340
        Top = 280
        Width = 61
        Height = 21
        DataField = 'GRUPO_C_V'
        DataSource = DtmBalcao.DtComandoPesq
        TabOrder = 9
        Visible = False
      end
      object DBEdit26: TDBEdit
        Left = 455
        Top = 279
        Width = 61
        Height = 21
        DataField = 'PEDRA_C_V'
        DataSource = DtmBalcao.DtComandoPesq
        TabOrder = 10
        Visible = False
      end
      object ComboBox1: TComboBox
        Left = 106
        Top = 0
        Width = 281
        Height = 21
        ItemHeight = 0
        TabOrder = 11
      end
      object ComboBox2: TComboBox
        Left = 106
        Top = 23
        Width = 281
        Height = 21
        ItemHeight = 0
        TabOrder = 12
      end
      object ComboBox3: TComboBox
        Left = 106
        Top = 46
        Width = 281
        Height = 21
        ItemHeight = 0
        TabOrder = 13
      end
      object ComboBox4: TComboBox
        Left = 106
        Top = 94
        Width = 281
        Height = 21
        ItemHeight = 0
        TabOrder = 14
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Dados Corpo NF e Observa'#231#245'es'
      ImageIndex = 2
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label30: TLabel
        Left = 8
        Top = 8
        Width = 203
        Height = 13
        Caption = 'Observa'#231#245'es para o Corpo da Nota Fiscal:'
      end
      object Label31: TLabel
        Left = 9
        Top = 183
        Width = 245
        Height = 13
        Caption = 'Observa'#231#245'es para Dados Adicionais da Nota Fiscal:'
      end
      object DBMemo1: TDBMemo
        Left = 8
        Top = 24
        Width = 649
        Height = 137
        DataField = 'INF_CORPO_V'
        DataSource = DtmBalcao.DtComandoPesq
        ScrollBars = ssVertical
        TabOrder = 0
      end
      object DBMemo2: TDBMemo
        Left = 8
        Top = 197
        Width = 649
        Height = 137
        DataField = 'OBS_V'
        DataSource = DtmBalcao.DtComandoPesq
        ScrollBars = ssVertical
        TabOrder = 1
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'Dados Transporte'
      ImageIndex = 3
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label38: TLabel
        Left = 1
        Top = 10
        Width = 85
        Height = 13
        Caption = 'Placa Ve'#237'culo:'
        FocusControl = DBEdit27
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label39: TLabel
        Left = 33
        Top = 35
        Width = 57
        Height = 13
        Caption = 'UF Placa:'
        FocusControl = DBEdit30
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label40: TLabel
        Left = 21
        Top = 85
        Width = 70
        Height = 13
        Caption = 'Quantidade:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label41: TLabel
        Left = 5
        Top = 59
        Width = 89
        Height = 13
        Caption = 'Frete P/ Conta:'
        FocusControl = DBEdit35
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label42: TLabel
        Left = 39
        Top = 114
        Width = 50
        Height = 13
        Caption = 'Esp'#233'cie:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label43: TLabel
        Left = 45
        Top = 138
        Width = 40
        Height = 13
        Caption = 'Marca:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label44: TLabel
        Left = 41
        Top = 164
        Width = 48
        Height = 13
        Caption = 'N'#250'mero:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label47: TLabel
        Left = 22
        Top = 189
        Width = 67
        Height = 13
        Caption = 'Peso Bruto:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label48: TLabel
        Left = 14
        Top = 216
        Width = 80
        Height = 13
        Caption = 'Peso L'#237'quido:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBEdit27: TDBEdit
        Left = 98
        Top = 3
        Width = 84
        Height = 21
        Color = clMenu
        DataField = 'PLACA_V_TR'
        DataSource = DtmBalcao.DtComandoPesq
        TabOrder = 0
      end
      object DBEdit30: TDBEdit
        Left = 98
        Top = 27
        Width = 28
        Height = 21
        Color = clMenu
        DataField = 'UF_PLACA_TR'
        DataSource = DtmBalcao.DtComandoPesq
        TabOrder = 1
      end
      object DBEdit35: TDBEdit
        Left = 97
        Top = 51
        Width = 28
        Height = 21
        Color = clMenu
        DataField = 'FRC_VND'
        DataSource = DtmBalcao.DtComandoPesq
        TabOrder = 2
      end
      object DBEdit36: TDBEdit
        Left = 97
        Top = 77
        Width = 56
        Height = 21
        Color = clMenu
        DataField = 'V_QUANT_VND'
        DataSource = DtmBalcao.DtComandoPesq
        TabOrder = 3
      end
      object DBEdit37: TDBEdit
        Left = 96
        Top = 103
        Width = 110
        Height = 21
        Color = clMenu
        DataField = 'ESPECIE_VND'
        DataSource = DtmBalcao.DtComandoPesq
        TabOrder = 4
      end
      object DBEdit38: TDBEdit
        Left = 96
        Top = 130
        Width = 85
        Height = 21
        Color = clMenu
        DataField = 'MARCA_VND'
        DataSource = DtmBalcao.DtComandoPesq
        TabOrder = 5
      end
      object DBEdit39: TDBEdit
        Left = 96
        Top = 156
        Width = 69
        Height = 21
        Color = clMenu
        DataField = 'NUMERO_VND'
        DataSource = DtmBalcao.DtComandoPesq
        TabOrder = 6
      end
      object DBEdit40: TDBEdit
        Left = 96
        Top = 181
        Width = 69
        Height = 21
        Color = clMenu
        DataField = 'PESO_B_VND'
        DataSource = DtmBalcao.DtComandoPesq
        TabOrder = 7
      end
      object DBEdit41: TDBEdit
        Left = 96
        Top = 208
        Width = 69
        Height = 21
        Color = clMenu
        DataField = 'PESO_L_VND'
        DataSource = DtmBalcao.DtComandoPesq
        TabOrder = 8
      end
    end
  end
end
