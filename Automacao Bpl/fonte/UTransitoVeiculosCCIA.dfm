object FrmTransitoVeiculosCCIA: TFrmTransitoVeiculosCCIA
  Left = 0
  Top = 0
  BorderIcons = []
  ClientHeight = 386
  ClientWidth = 816
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 816
    Height = 77
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label30: TLabel
      Left = 0
      Top = 0
      Width = 816
      Height = 24
      Hint = 'Ve'#237'culo de Demonstra'#231#227'o'
      Align = alTop
      Alignment = taCenter
      Caption = 'CHASSIS DAS NOTAS...'
      Color = clCream
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      ExplicitWidth = 230
    end
    object Panel4: TPanel
      Left = 0
      Top = 24
      Width = 816
      Height = 53
      Align = alClient
      TabOrder = 0
      object Shape1: TShape
        Left = 1
        Top = 1
        Width = 814
        Height = 26
        Align = alTop
        ExplicitLeft = 0
        ExplicitTop = 6
      end
      object Shape2: TShape
        Left = 1
        Top = 27
        Width = 814
        Height = 26
        Align = alTop
        ExplicitLeft = 0
      end
      object Label1: TLabel
        Left = 16
        Top = 8
        Width = 44
        Height = 13
        Caption = 'Num NF:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 66
        Top = 8
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
      object Label2: TLabel
        Left = 131
        Top = 8
        Width = 48
        Height = 13
        Caption = 'Serie NF:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 183
        Top = 8
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
        Left = 259
        Top = 8
        Width = 79
        Height = 13
        Caption = 'Data Emiss'#227'o:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 344
        Top = 8
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
      object Label9: TLabel
        Left = 16
        Top = 34
        Width = 40
        Height = 13
        Caption = 'Status:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label10: TLabel
        Left = 66
        Top = 34
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
      object Label11: TLabel
        Left = 131
        Top = 34
        Width = 48
        Height = 13
        Caption = 'Valor NF:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label12: TLabel
        Left = 183
        Top = 34
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
      object Label13: TLabel
        Left = 298
        Top = 34
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
      object Label14: TLabel
        Left = 259
        Top = 33
        Width = 33
        Height = 13
        Caption = 'Frete:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label15: TLabel
        Left = 372
        Top = 34
        Width = 43
        Height = 13
        Caption = 'Seguro:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label16: TLabel
        Left = 421
        Top = 34
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
      object Label17: TLabel
        Left = 496
        Top = 34
        Width = 56
        Height = 13
        Caption = 'ICMS Sub:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label18: TLabel
        Left = 557
        Top = 34
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
      object Label19: TLabel
        Left = 616
        Top = 34
        Width = 62
        Height = 13
        Caption = 'Num Caixa:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label20: TLabel
        Left = 685
        Top = 34
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
      object Label21: TLabel
        Left = 616
        Top = 6
        Width = 104
        Height = 13
        Caption = 'Tipo Faturamento:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label22: TLabel
        Left = 726
        Top = 6
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
      object Label7: TLabel
        Left = 449
        Top = 6
        Width = 79
        Height = 13
        Caption = 'Data Emiss'#227'o:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label8: TLabel
        Left = 534
        Top = 6
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
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 77
    Width = 816
    Height = 309
    Align = alClient
    BevelOuter = bvNone
    Caption = 'Panel2'
    TabOrder = 1
    object DBGridTrans: TDBGrid
      Left = 286
      Top = 0
      Width = 530
      Height = 284
      Align = alClient
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      PopupMenu = PopupMenuTrans
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnColumnMoved = DBGridTransColumnMoved
      OnDrawColumnCell = DBGridTransDrawColumnCell
      OnTitleClick = DBGridTransTitleClick
    end
    object Panel3: TPanel
      Left = 0
      Top = 284
      Width = 816
      Height = 25
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 1
      object Label86: TLabel
        Left = 286
        Top = 4
        Width = 86
        Height = 13
        Caption = 'Ve'#237'culo Cancelado'
      end
      object Label90: TLabel
        Left = 112
        Top = 4
        Width = 98
        Height = 13
        Caption = 'Ve'#237'culo n'#227'o recebido'
      end
      object BitBtn4: TBitBtn
        Left = 696
        Top = 0
        Width = 120
        Height = 25
        Hint = 'OK'
        Align = alRight
        Caption = '&OK'
        TabOrder = 1
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
      object BitBtn19: TBitBtn
        Left = 576
        Top = 0
        Width = 120
        Height = 25
        Hint = 'Cancelar Ve'#237'culo - [VEI103]'
        Align = alRight
        Caption = '&Cancelar V'#233'iculo'
        TabOrder = 0
        OnClick = BitBtn19Click
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000C30E0000C30E00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF8491D5596DD0596DD08491
          D5FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA3
          ACD82B44C92A44CA334CCC334CCC2A44CA2B44C9A3ACD8FF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FF2B44C99EAAE49EAAE4223DC8223DC89EAA
          E49EAAE42B44C9FF00FFFF00FFFF00FFC39567B2773DC7A07AFF00FF7F8EDE2A
          44CA9EAAE4FFFFFF909EE1909EE1FFFFFF9EAAE42A44CA8491D5FF00FFFF00FF
          B2773DB2773DB98756FF00FF5268DD334CCC223DC8909EE1FFFFFFFFFFFF909E
          E1223DC8334CCC596DD0B3783EFFFFFFC39568B2773DC7A07AFF00FF5268DD33
          4CCC223DC8909EE1FFFFFFFFFFFF909EE1223DC8334CCC596DD0B3783EC39568
          FFFFFFFFFFFFFAFAFAFF00FF7F8EDE2A44CA9EAAE4FFFFFF909EE1909EE1FFFF
          FF9EAAE42A44CA8491D5B3783EB3783EB3783EB3783EB3783EFF00FFFF00FF2B
          44C99EAAE49EAAE4223DC8223DC89EAAE49EAAE42B44C9FF00FFB3783EB3783E
          B3783EB3783EB3783ECCB39AFF00FFA3ACD82B44C92A44CA334CCC334CCC2A44
          CA2B44C9A3ACD8FF00FFB3783EB3783EB3783EB3783EB3783EC9AB8EC39D78FF
          00FFFF00FF7F8EDE5268DD5268DD7F8EDEFF00FFFF00FFFF00FFB3783EFFFFFF
          FFFFFFFFFFFFB3793FC9AB8EB3783EBA8857FF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFBC8E61FF00FFB3783EC4966AFFFFFFFFFFFFB3793FC9AB8EB3783EB3
          783EB3783EBA8857BA8857BA8857BA8857B3783EB3783EFF00FFFF00FFB2773D
          FFFFFFFFFFFFB3793FC9AC8FB3783EB3783EB3783EB3783EB3783EB3783EB378
          3EB3783EB3783EFF00FFFF00FFC5A27FB3783EB3783EB3783EFF00FFB3783EB3
          783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFB3783EB3783EB3783EB3783EB3783EB3783EB378
          3EB3783EB3783EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC5A27FB3
          783EB3783EB3783EB3783EB3783EB3783EB3783EC5A27FFF00FF}
      end
      object Panel46: TPanel
        Left = 240
        Top = 4
        Width = 40
        Height = 13
        BevelOuter = bvNone
        Color = 39901
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 2
      end
      object Panel48: TPanel
        Left = 66
        Top = 4
        Width = 40
        Height = 13
        BevelOuter = bvNone
        Color = clMenuHighlight
        Font.Charset = CHINESEBIG5_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 3
      end
    end
    object GroupBoxTrans: TGroupBox
      Left = 0
      Top = 0
      Width = 286
      Height = 284
      Align = alLeft
      Caption = 'Configura'#231#227'o das Colunas'
      TabOrder = 2
      Visible = False
      object ScrollBoxTrans: TScrollBox
        Left = 2
        Top = 15
        Width = 282
        Height = 267
        Align = alClient
        BevelInner = bvNone
        BevelOuter = bvNone
        TabOrder = 0
        OnEnter = ScrollBoxTransEnter
        OnExit = ScrollBoxTransExit
      end
    end
  end
  object PopupMenuTrans: TPopupMenu
    Left = 771
    Top = 65529
    object MenuItem1: TMenuItem
      Caption = ' Configurar colunas'
      OnClick = MenuItem1Click
    end
    object MenuItem2: TMenuItem
      Caption = 'Resetar Configura'#231#245'es de colunas'
      OnClick = MenuItem2Click
    end
    object MenuItem3: TMenuItem
      Caption = 'Salvar dados no Excel'
      OnClick = MenuItem3Click
    end
    object MenuItem4: TMenuItem
      Caption = 'Reajustar Largura das colunas'
      OnClick = MenuItem4Click
    end
    object MenuItem5: TMenuItem
      Caption = 'Copiar para '#225'rea de transfer'#234'ncia'
      OnClick = MenuItem5Click
    end
  end
end
