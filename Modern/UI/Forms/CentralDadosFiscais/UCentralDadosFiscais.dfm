inherited FrmCentralDadosFiscais: TFrmCentralDadosFiscais
  Left = 0
  Top = 0
  Caption = 'Central de Dados Fiscais'
  ClientHeight = 613
  ClientWidth = 806
  Position = poScreenCenter
  OnClose = FormClose
  ExplicitWidth = 814
  ExplicitHeight = 647
  PixelsPerInch = 96
  TextHeight = 13
  object ScrollBox1: TScrollBox
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 800
    Height = 560
    Align = alClient
    BorderStyle = bsNone
    TabOrder = 0
    object pnTop: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 794
      Height = 25
      Align = alTop
      AutoSize = True
      BevelOuter = bvNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object Label1: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 788
        Height = 19
        Align = alTop
        Alignment = taCenter
        Caption = 'Central informa'#231#245'es fiscais relacionadas a RTC'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
        ExplicitWidth = 381
      end
    end
    object pnBancoCalcSERPRO: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 73
      Width = 794
      Height = 33
      Align = alTop
      BevelEdges = [beTop]
      BevelKind = bkTile
      BevelOuter = bvNone
      BorderWidth = 1
      TabOrder = 2
      object Label2: TLabel
        AlignWithMargins = True
        Left = 101
        Top = 4
        Width = 187
        Height = 23
        Align = alLeft
        Caption = 'Vers'#227'o da Base de dados sincronizada:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Layout = tlCenter
        ExplicitHeight = 13
      end
      object lbVersao: TLabel
        AlignWithMargins = True
        Left = 294
        Top = 4
        Width = 6
        Height = 23
        Align = alLeft
        Caption = '?'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
        ExplicitHeight = 13
      end
      object Label3: TLabel
        AlignWithMargins = True
        Left = 306
        Top = 4
        Width = 27
        Height = 23
        Align = alLeft
        Caption = 'Data:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Layout = tlCenter
        ExplicitHeight = 13
      end
      object lbDataVersao: TLabel
        AlignWithMargins = True
        Left = 339
        Top = 4
        Width = 6
        Height = 23
        Align = alLeft
        Caption = '?'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
        ExplicitHeight = 13
      end
      object btVerificarDbSerpro: TSpeedButton
        AlignWithMargins = True
        Left = 351
        Top = 4
        Width = 142
        Height = 23
        Cursor = crHandPoint
        Align = alLeft
        Caption = 'Verificar nova vers'#227'o'
        OnClick = btVerificarDbSerproClick
        ExplicitLeft = 462
        ExplicitTop = 10
      end
      object Label5: TLabel
        AlignWithMargins = True
        Left = 4
        Top = 4
        Width = 79
        Height = 23
        Align = alLeft
        Caption = 'Fonte de dados:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Layout = tlCenter
        ExplicitHeight = 13
      end
      object lbFonte: TLabel
        AlignWithMargins = True
        Left = 89
        Top = 4
        Width = 6
        Height = 23
        Align = alLeft
        Caption = '?'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
        ExplicitHeight = 13
      end
    end
    object pnAnexosGruposFiscaisIbsCbs: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 190
      Width = 794
      Height = 33
      Align = alTop
      BevelEdges = [beTop]
      BevelKind = bkTile
      BevelOuter = bvNone
      BorderWidth = 1
      TabOrder = 3
      object lbQtdeAnexosDisplay: TLabel
        AlignWithMargins = True
        Left = 4
        Top = 4
        Width = 184
        Height = 23
        Align = alLeft
        Caption = 'Anexos existentes na fonte de dados:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Layout = tlCenter
        ExplicitHeight = 13
      end
      object lbQtdeAnexos: TLabel
        AlignWithMargins = True
        Left = 194
        Top = 4
        Width = 6
        Height = 23
        Align = alLeft
        Caption = '?'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
        ExplicitHeight = 13
      end
      object lbQtdeAnexosCompatDisplay: TLabel
        AlignWithMargins = True
        Left = 206
        Top = 4
        Width = 175
        Height = 23
        Align = alLeft
        Caption = 'Anexos compat'#237'veis com o cadastro:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Layout = tlCenter
        ExplicitHeight = 13
      end
      object lbQtdeAnexosCompat: TLabel
        AlignWithMargins = True
        Left = 387
        Top = 4
        Width = 6
        Height = 23
        Align = alLeft
        Caption = '?'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
        ExplicitHeight = 13
      end
      object btCriarGruposFiscais: TSpeedButton
        AlignWithMargins = True
        Left = 603
        Top = 4
        Width = 100
        Height = 23
        Cursor = crHandPoint
        Align = alLeft
        Caption = 'Configurar'
        OnClick = btCriarGruposFiscaisClick
        ExplicitLeft = 469
        ExplicitTop = 0
      end
      object lbQtdeGruposFiscais: TLabel
        AlignWithMargins = True
        Left = 591
        Top = 4
        Width = 6
        Height = 23
        Align = alLeft
        Caption = '?'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
        ExplicitHeight = 13
      end
      object lbQtdeGruposFiscaisDisplay: TLabel
        AlignWithMargins = True
        Left = 399
        Top = 4
        Width = 186
        Height = 23
        Align = alLeft
        Caption = 'Grupos Fiscais de Anexos do cadastro:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Layout = tlCenter
        ExplicitHeight = 13
      end
    end
    object pnLog: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 516
      Width = 794
      Height = 41
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 6
      object edLog: TMemo
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 788
        Height = 35
        Align = alClient
        Lines.Strings = (
          'edLog')
        ReadOnly = True
        TabOrder = 0
      end
    end
    object Panel1: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 268
      Width = 794
      Height = 33
      Align = alTop
      BevelEdges = [beTop]
      BevelKind = bkTile
      BevelOuter = bvNone
      BorderWidth = 1
      TabOrder = 4
      object lbQtdeNcmsIbsCbsCompatDisplay: TLabel
        AlignWithMargins = True
        Left = 174
        Top = 4
        Width = 33
        Height = 23
        Align = alLeft
        Caption = 'NCM'#39's:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Layout = tlCenter
        ExplicitHeight = 13
      end
      object lbNcmsCompativeis1p1: TLabel
        AlignWithMargins = True
        Left = 213
        Top = 4
        Width = 6
        Height = 23
        Align = alLeft
        Caption = '?'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
        ExplicitHeight = 13
      end
      object Label9: TLabel
        AlignWithMargins = True
        Left = 225
        Top = 4
        Width = 47
        Height = 23
        Align = alLeft
        Caption = 'Produtos:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Layout = tlCenter
        ExplicitHeight = 13
      end
      object lbProdutosCompativeis1p1: TLabel
        AlignWithMargins = True
        Left = 278
        Top = 4
        Width = 6
        Height = 23
        Align = alLeft
        Caption = '?'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
        ExplicitHeight = 13
      end
      object btConfigurarProdutos1para1: TSpeedButton
        AlignWithMargins = True
        Left = 290
        Top = 4
        Width = 100
        Height = 23
        Cursor = crHandPoint
        Align = alLeft
        Caption = 'Configurar'
        OnClick = btConfigurarProdutos1para1Click
        ExplicitLeft = 637
      end
      object Label22: TLabel
        AlignWithMargins = True
        Left = 4
        Top = 4
        Width = 164
        Height = 23
        Align = alLeft
        Caption = 'Compat'#237'veis com 1 anexo apenas:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Layout = tlCenter
        ExplicitHeight = 13
      end
    end
    object Panel4: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 346
      Width = 794
      Height = 33
      Align = alTop
      BevelEdges = [beTop]
      BevelKind = bkTile
      BevelOuter = bvNone
      BorderWidth = 1
      ParentColor = True
      TabOrder = 5
      object Label13: TLabel
        AlignWithMargins = True
        Left = 85
        Top = 4
        Width = 116
        Height = 23
        Align = alLeft
        Caption = 'com anexo configurado:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Layout = tlCenter
        ExplicitHeight = 13
      end
      object Label14: TLabel
        Left = 1
        Top = 1
        Width = 81
        Height = 29
        Align = alLeft
        Caption = 'Incompat'#237'veis'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
        ExplicitHeight = 13
      end
      object Label6: TLabel
        AlignWithMargins = True
        Left = 207
        Top = 4
        Width = 33
        Height = 23
        Align = alLeft
        Caption = 'NCM'#39's:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Layout = tlCenter
        ExplicitHeight = 13
      end
      object lbProdutosIncompativeis: TLabel
        AlignWithMargins = True
        Left = 311
        Top = 4
        Width = 6
        Height = 23
        Align = alLeft
        Caption = '?'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
        ExplicitHeight = 13
      end
      object Label10: TLabel
        AlignWithMargins = True
        Left = 258
        Top = 4
        Width = 47
        Height = 23
        Align = alLeft
        Caption = 'Produtos:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Layout = tlCenter
        ExplicitHeight = 13
      end
      object lbNcmsIncompativeis: TLabel
        AlignWithMargins = True
        Left = 246
        Top = 4
        Width = 6
        Height = 23
        Align = alLeft
        Caption = '?'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
        ExplicitHeight = 13
      end
      object btConfigurarProdutosInconpativeis: TSpeedButton
        AlignWithMargins = True
        Left = 323
        Top = 4
        Width = 100
        Height = 23
        Cursor = crHandPoint
        Align = alLeft
        Caption = 'Configurar'
        OnClick = btConfigurarProdutosInconpativeisClick
        ExplicitLeft = 591
        ExplicitTop = 0
      end
    end
    object Panel7: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 34
      Width = 794
      Height = 33
      Align = alTop
      BevelEdges = [beTop]
      BevelKind = bkTile
      BevelOuter = bvNone
      BorderWidth = 1
      TabOrder = 1
      object Label4: TLabel
        AlignWithMargins = True
        Left = 4
        Top = 4
        Width = 177
        Height = 23
        Align = alLeft
        Caption = 'Escolha o tributo para lisar os dados:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Layout = tlCenter
        ExplicitHeight = 13
      end
      object Label7: TLabel
        AlignWithMargins = True
        Left = 328
        Top = 4
        Width = 90
        Height = 23
        Hint = 
          'Data utilizada para consultar os dados fiscais, considerando que' +
          ' esssa data precisa estar entre as datas inicial e final de vig'#234 +
          'ncia dos dados fiscais'
        Align = alLeft
        Caption = 'Data de refer'#234'ncia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Layout = tlCenter
        ExplicitHeight = 13
      end
      object cbTipoTributo: TComboBox
        AlignWithMargins = True
        Left = 187
        Top = 5
        Width = 135
        Height = 19
        Margins.Top = 4
        Margins.Bottom = 4
        Align = alLeft
        Style = csOwnerDrawFixed
        ItemHeight = 13
        ItemIndex = 0
        TabOrder = 0
        Text = 'Imposto Seletivo'
        OnChange = cbTipoTributoChange
        Items.Strings = (
          'Imposto Seletivo'
          'IBS e CBS')
      end
      object DateTimePicker1: TDateTimePicker
        AlignWithMargins = True
        Left = 424
        Top = 5
        Width = 104
        Height = 21
        Hint = 
          'Data utilizada para consultar os dados fiscais, considerando que' +
          ' esssa data precisa estar entre as datas inicial e final de vig'#234 +
          'ncia dos dados fiscais'
        Margins.Top = 4
        Margins.Bottom = 4
        Align = alLeft
        Date = 37307.373444918980000000
        Time = 37307.373444918980000000
        TabOrder = 1
        OnChange = DateTimePicker1Change
      end
    end
    object Panel8: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 307
      Width = 794
      Height = 33
      Align = alTop
      BevelEdges = [beTop]
      BevelKind = bkTile
      BevelOuter = bvNone
      BorderWidth = 1
      TabOrder = 7
      object Label18: TLabel
        AlignWithMargins = True
        Left = 183
        Top = 4
        Width = 33
        Height = 23
        Align = alLeft
        Caption = 'NCM'#39's:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Layout = tlCenter
        ExplicitHeight = 13
      end
      object lbNcmsCompativeisNp1: TLabel
        AlignWithMargins = True
        Left = 222
        Top = 4
        Width = 6
        Height = 23
        Align = alLeft
        Caption = '?'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
        ExplicitHeight = 13
      end
      object Label20: TLabel
        AlignWithMargins = True
        Left = 234
        Top = 4
        Width = 47
        Height = 23
        Align = alLeft
        Caption = 'Produtos:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Layout = tlCenter
        ExplicitHeight = 13
      end
      object lbProdutosCompativeisNp1: TLabel
        AlignWithMargins = True
        Left = 287
        Top = 4
        Width = 6
        Height = 23
        Align = alLeft
        Caption = '?'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
        ExplicitHeight = 13
      end
      object btConfigurarProdutosNpara1: TSpeedButton
        AlignWithMargins = True
        Left = 299
        Top = 4
        Width = 100
        Height = 23
        Cursor = crHandPoint
        Align = alLeft
        Caption = 'Configurar'
        OnClick = btConfigurarProdutosNpara1Click
        ExplicitTop = 10
      end
      object Label23: TLabel
        AlignWithMargins = True
        Left = 4
        Top = 4
        Width = 173
        Height = 23
        Align = alLeft
        Caption = 'Compat'#237'veis com mais de um anexo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Layout = tlCenter
        ExplicitHeight = 13
      end
    end
    object Panel9: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 229
      Width = 794
      Height = 33
      Align = alTop
      BevelEdges = [beTop]
      BevelKind = bkTile
      BevelOuter = bvNone
      BorderWidth = 1
      TabOrder = 8
      object Label24: TLabel
        AlignWithMargins = True
        Left = 158
        Top = 4
        Width = 33
        Height = 23
        Align = alLeft
        Caption = 'NCM'#39's:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Layout = tlCenter
        ExplicitHeight = 13
      end
      object lbNcmCompativeis: TLabel
        AlignWithMargins = True
        Left = 197
        Top = 4
        Width = 6
        Height = 23
        Align = alLeft
        Caption = '?'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
        ExplicitHeight = 13
      end
      object Label26: TLabel
        AlignWithMargins = True
        Left = 209
        Top = 4
        Width = 47
        Height = 23
        Align = alLeft
        Caption = 'Produtos:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Layout = tlCenter
        ExplicitHeight = 13
      end
      object lbProdutosCompativeis: TLabel
        AlignWithMargins = True
        Left = 262
        Top = 4
        Width = 6
        Height = 23
        Align = alLeft
        Caption = '?'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
        ExplicitHeight = 13
      end
      object Label29: TLabel
        AlignWithMargins = True
        Left = 4
        Top = 4
        Width = 148
        Height = 23
        Align = alLeft
        Caption = 'Compat'#237'veis com algum anexo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Layout = tlCenter
        ExplicitHeight = 13
      end
      object Label28: TLabel
        AlignWithMargins = True
        Left = 274
        Top = 4
        Width = 169
        Height = 23
        Align = alLeft
        Caption = 'Revis'#227'o dos produtos, Mais antiga:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Layout = tlCenter
        ExplicitHeight = 13
      end
      object lbRevisaoMaisAntiga: TLabel
        AlignWithMargins = True
        Left = 449
        Top = 4
        Width = 60
        Height = 23
        Align = alLeft
        Caption = '??/??/????'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
        ExplicitHeight = 13
      end
      object Label31: TLabel
        AlignWithMargins = True
        Left = 515
        Top = 4
        Width = 65
        Height = 23
        Align = alLeft
        Caption = 'Mais recente:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Layout = tlCenter
        ExplicitHeight = 13
      end
      object lbRevisaoMaisRecente: TLabel
        AlignWithMargins = True
        Left = 586
        Top = 4
        Width = 60
        Height = 23
        Align = alLeft
        Caption = '??/??/????'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
        ExplicitHeight = 13
      end
    end
    object Panel2: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 112
      Width = 794
      Height = 33
      Align = alTop
      BevelEdges = [beTop]
      BevelKind = bkTile
      BevelOuter = bvNone
      BorderWidth = 1
      TabOrder = 9
      object Label8: TLabel
        AlignWithMargins = True
        Left = 4
        Top = 4
        Width = 155
        Height = 23
        Hint = 
          'Informa'#231#245'es do cadastro de produtos configuradas corretamente, N' +
          'CM existente e dentro da vig'#234'ncia'
        Align = alLeft
        Caption = 'Quantidade de NCM'#39's regulares:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Layout = tlCenter
        ExplicitHeight = 13
      end
      object lbNcmRegulares: TLabel
        AlignWithMargins = True
        Left = 165
        Top = 4
        Width = 6
        Height = 23
        Hint = 
          'Informa'#231#245'es do cadastro de produtos configuradas corretamente, N' +
          'CM existente e dentro da vig'#234'ncia'
        Align = alLeft
        Caption = '?'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
        ExplicitHeight = 13
      end
      object Label12: TLabel
        AlignWithMargins = True
        Left = 177
        Top = 4
        Width = 181
        Height = 23
        Align = alLeft
        Caption = 'Quantidade de Produtos do cadastro:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Layout = tlCenter
        ExplicitHeight = 13
      end
      object lbProdutosRegulares: TLabel
        AlignWithMargins = True
        Left = 364
        Top = 4
        Width = 6
        Height = 23
        Align = alLeft
        Caption = '?'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
        ExplicitHeight = 13
      end
    end
    object Panel5: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 151
      Width = 794
      Height = 33
      Align = alTop
      BevelEdges = [beTop]
      BevelKind = bkTile
      BevelOuter = bvNone
      BorderWidth = 1
      TabOrder = 10
      object Label17: TLabel
        AlignWithMargins = True
        Left = 4
        Top = 4
        Width = 170
        Height = 23
        Hint = 
          'Quantidades de NCM'#39's inv'#225'lidos ou inexstentes, '#233' necess'#225'rio corr' +
          'igir para emiss'#227'o dos documentos fiscais'
        Align = alLeft
        Caption = 'Quantidade de NCM'#39's Inexistentes:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Layout = tlCenter
        ExplicitHeight = 13
      end
      object lbNcmsInexistentes: TLabel
        AlignWithMargins = True
        Left = 180
        Top = 4
        Width = 6
        Height = 23
        Hint = 
          'Quantidades de NCM'#39's inv'#225'lidos ou inexstentes, '#233' necess'#225'rio corr' +
          'igir para emiss'#227'o dos documentos fiscais'
        Align = alLeft
        Caption = '?'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
        ExplicitHeight = 13
      end
      object Label21: TLabel
        AlignWithMargins = True
        Left = 192
        Top = 4
        Width = 47
        Height = 23
        Hint = 
          'Quantidades de NCM'#39's inv'#225'lidos ou inexstentes, '#233' necess'#225'rio corr' +
          'igir para emiss'#227'o dos documentos fiscais'
        Align = alLeft
        Caption = 'Produtos:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Layout = tlCenter
        ExplicitHeight = 13
      end
      object lbProdutosInexistentes: TLabel
        AlignWithMargins = True
        Left = 245
        Top = 4
        Width = 6
        Height = 23
        Hint = 
          'Quantidades de NCM'#39's inv'#225'lidos ou inexstentes, '#233' necess'#225'rio corr' +
          'igir para emiss'#227'o dos documentos fiscais'
        Align = alLeft
        Caption = '?'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
        ExplicitHeight = 13
      end
      object Label35: TLabel
        AlignWithMargins = True
        Left = 257
        Top = 4
        Width = 176
        Height = 23
        Hint = 
          'Quantidades de NCM'#39's cuja data de vig'#234'ncia est'#225' expirada, '#233' nece' +
          'ss'#225'rio corrigir para emiss'#227'o dos documentos fiscais'
        Align = alLeft
        Caption = '   -   Quantidades de NCM'#39's Extintos:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Layout = tlCenter
        ExplicitHeight = 13
      end
      object lbNcmsExtintos: TLabel
        AlignWithMargins = True
        Left = 439
        Top = 4
        Width = 6
        Height = 23
        Hint = 
          'Quantidades de NCM'#39's cuja data de vig'#234'ncia est'#225' expirada, '#233' nece' +
          'ss'#225'rio corrigir para emiss'#227'o dos documentos fiscais'
        Align = alLeft
        Caption = '?'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
        ExplicitHeight = 13
      end
      object Label33: TLabel
        AlignWithMargins = True
        Left = 451
        Top = 4
        Width = 47
        Height = 23
        Hint = 
          'Quantidades de NCM'#39's cuja data de vig'#234'ncia est'#225' expirada, '#233' nece' +
          'ss'#225'rio corrigir para emiss'#227'o dos documentos fiscais'
        Align = alLeft
        Caption = 'Produtos:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Layout = tlCenter
        ExplicitHeight = 13
      end
      object lbProdutosExtintos: TLabel
        AlignWithMargins = True
        Left = 504
        Top = 4
        Width = 6
        Height = 23
        Hint = 
          'Quantidades de NCM'#39's cuja data de vig'#234'ncia est'#225' expirada, '#233' nece' +
          'ss'#225'rio corrigir para emiss'#227'o dos documentos fiscais'
        Align = alLeft
        Caption = '?'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
        ExplicitHeight = 13
      end
      object btCorrigirNCMs: TSpeedButton
        AlignWithMargins = True
        Left = 516
        Top = 4
        Width = 100
        Height = 23
        Cursor = crHandPoint
        Align = alLeft
        Caption = 'Corrigir'
        OnClick = btCorrigirNCMsClick
        ExplicitLeft = 469
        ExplicitTop = 0
      end
    end
  end
  object Panel3: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 569
    Width = 800
    Height = 41
    Align = alBottom
    BevelEdges = [beTop]
    BevelKind = bkTile
    BevelOuter = bvNone
    BorderWidth = 1
    TabOrder = 1
    object btSair: TBitBtn
      AlignWithMargins = True
      Left = 7
      Top = 7
      Width = 79
      Height = 25
      Margins.Left = 6
      Margins.Top = 6
      Margins.Right = 6
      Margins.Bottom = 6
      Align = alLeft
      Caption = ' Sair'
      TabOrder = 0
      OnClick = btSairClick
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000D30E0000D30E00000001000000010000AD4A0000B54A
        0000B5520000BD520000BD5A0000C65A0000C6630000CE630000CE6B0000D673
        0000DE730000DE7B0000E77B0000E7840000F7940000CE6B0800FF9C0800A542
        1000AD4A1000B5521000C6631000B55A2100CE732100B55A3100BD633100FFAD
        3100CE7B3900BD6B4200C6734200CE844200CE844A00BD735200BD7B5200C67B
        5200C6845A00C6846300FFBD6300C68C7300CE947B00CE9C8400FF00FF00FFFF
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
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00282828282828
        2828281F05002828282828282828282828282817050713282828282828282828
        2828282817060715282828282828282828282828281507062328280004040404
        040404232828000701282802090807070707061B28282706062328040B090711
        2727272828282800071328060D070A07232828282828281C070128070E13020B
        082028282828281C0701280F101D28020D0818282828280107132816191E2828
        140D0C03212513060623281A2421282828150C0D0B0908061228282622282828
        282827140808041B282828282828282828282828282828282828282828282828
        2828282828282828282828282828282828282828282828282828}
    end
    object ProgressBar1: TProgressBar
      AlignWithMargins = True
      Left = 98
      Top = 7
      Width = 695
      Height = 25
      Margins.Left = 6
      Margins.Top = 6
      Margins.Right = 6
      Margins.Bottom = 6
      Align = alClient
      TabOrder = 1
    end
  end
end
