inherited frmPlanoPagamento: TfrmPlanoPagamento
  Left = 367
  Top = 147
  Caption = 'Plano de Pagamento'
  ClientHeight = 446
  ClientWidth = 393
  Position = poMainFormCenter
  OnClose = FormClose
  ExplicitWidth = 401
  ExplicitHeight = 480
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 393
    Height = 396
    Align = alTop
    BevelKind = bkTile
    BevelOuter = bvLowered
    TabOrder = 0
    object Label1: TLabel
      Left = 74
      Top = 102
      Width = 45
      Height = 13
      Caption = 'Controle:'
    end
    object Label7: TLabel
      Left = 15
      Top = 75
      Width = 104
      Height = 13
      Caption = 'Valor a ser Calculado:'
    end
    object Label8: TLabel
      Left = 56
      Top = 21
      Width = 63
      Height = 13
      Caption = 'Valor Tabela:'
    end
    object Label9: TLabel
      Left = 16
      Top = 48
      Width = 103
      Height = 13
      Alignment = taRightJustify
      Caption = 'Percentual Desconto:'
    end
    object Label10: TLabel
      Left = 38
      Top = 370
      Width = 81
      Height = 13
      Caption = 'Valor da Parcela:'
    end
    object labelTipoVnd: TLabel
      Left = 252
      Top = 58
      Width = 117
      Height = 13
      Caption = 'TipoVenda                     .'
      Visible = False
      WordWrap = True
    end
    object edControle: TDBLookupComboBox
      Left = 125
      Top = 94
      Width = 252
      Height = 21
      KeyField = 'CODIGO_CTRL'
      ListField = 'NOME_CTRL'
      ListSource = dtmFP.dsControle
      TabOrder = 3
      OnExit = edControleExit
    end
    object grupoCalculo: TGroupBox
      Left = 15
      Top = 121
      Width = 362
      Height = 160
      Caption = 'Dados para o C'#225'lculo'
      TabOrder = 4
      object Label2: TLabel
        Left = 30
        Top = 25
        Width = 74
        Height = 13
        Caption = 'N'#186' de Parcelas:'
      end
      object Label3: TLabel
        Left = 7
        Top = 52
        Width = 97
        Height = 13
        Caption = 'Prazo para Primeira:'
      end
      object Label4: TLabel
        Left = 56
        Top = 79
        Width = 48
        Height = 13
        Caption = 'Intervalo:'
      end
      object Label5: TLabel
        Left = 20
        Top = 106
        Width = 84
        Height = 13
        Caption = 'Valor da Entrada:'
      end
      object Label6: TLabel
        Left = 17
        Top = 133
        Width = 87
        Height = 13
        Caption = 'Prazo da Entrada:'
      end
      object btGerar: TBitBtn
        Left = 267
        Top = 64
        Width = 75
        Height = 25
        Hint = 'Gerar - [FPG012]'
        Caption = '&Gerar >>'
        TabOrder = 5
        OnClick = btGerarClick
      end
      object edNumeroDeParcelas: TEditMoeda
        Left = 110
        Top = 17
        Width = 121
        Height = 21
        Alignment = taRightJustify
        TabOrder = 0
        FormatReal = fInteger
        FormatSize = '10.2'
      end
      object edPrazoPrimeiraParcela: TEditMoeda
        Left = 110
        Top = 44
        Width = 121
        Height = 21
        Alignment = taRightJustify
        TabOrder = 1
        FormatReal = fInteger
        FormatSize = '10.2'
      end
      object edIntervaloParcelas: TEditMoeda
        Left = 110
        Top = 71
        Width = 121
        Height = 21
        Alignment = taRightJustify
        TabOrder = 2
        FormatReal = fInteger
        FormatSize = '10.2'
      end
      object edValorEntrada: TEditMoeda
        Left = 110
        Top = 98
        Width = 121
        Height = 21
        Alignment = taRightJustify
        TabOrder = 3
        FormatReal = fMoney
        FormatSize = '10.2'
      end
      object edPrazoEntrada: TEditMoeda
        Left = 110
        Top = 125
        Width = 121
        Height = 21
        Alignment = taRightJustify
        TabOrder = 4
        FormatReal = fInteger
        FormatSize = '10.2'
        OnExit = edPrazoEntradaExit
      end
    end
    object Memo1: TMemo
      Left = 15
      Top = 287
      Width = 362
      Height = 69
      TabOrder = 5
    end
    object edValorVendaBruto: TEditMoeda
      Left = 125
      Top = 13
      Width = 121
      Height = 21
      Alignment = taRightJustify
      TabOrder = 0
      FormatReal = fMoney
      FormatSize = '10.2'
    end
    object edValorDesconto: TEditMoeda
      Left = 125
      Top = 40
      Width = 121
      Height = 21
      Alignment = taRightJustify
      TabOrder = 1
      FormatReal = fNumber
      FormatSize = '10.2'
      OnExit = edValorDescontoExit
    end
    object edValorVendaLiquido: TEditMoeda
      Left = 125
      Top = 67
      Width = 121
      Height = 21
      Alignment = taRightJustify
      Enabled = False
      TabOrder = 2
      FormatReal = fMoney
      FormatSize = '10.2'
    end
    object edValorDaParcela: TEditMoeda
      Left = 125
      Top = 362
      Width = 121
      Height = 21
      Alignment = taRightJustify
      TabOrder = 6
      FormatReal = fMoney
      FormatSize = '10.2'
    end
    object btVer: TBitBtn
      Left = 282
      Top = 362
      Width = 75
      Height = 25
      Hint = 'Ver - [FPG013]'
      Caption = '&Ver >>'
      TabOrder = 7
      OnClick = btVerClick
    end
    object rbVarejo: TRadioButton
      Left = 280
      Top = 13
      Width = 113
      Height = 17
      Caption = 'Varejo'
      Checked = True
      TabOrder = 8
      TabStop = True
    end
    object rbAtacado: TRadioButton
      Left = 280
      Top = 37
      Width = 113
      Height = 17
      Caption = 'Atacado'
      TabOrder = 9
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 402
    Width = 393
    Height = 44
    Align = alBottom
    BevelKind = bkTile
    BevelOuter = bvNone
    TabOrder = 1
    object btConfirmar: TBitBtn
      Left = 51
      Top = 7
      Width = 140
      Height = 25
      Hint = 'Confirmar Plano - [FPG014]'
      Caption = 'Confirmar Plano'
      Enabled = False
      TabOrder = 0
      OnClick = btConfirmarClick
    end
    object btCancelar: TBitBtn
      Left = 197
      Top = 7
      Width = 140
      Height = 25
      Hint = 'Sair sem confirmar'
      Caption = 'Sair sem Confirmar'
      TabOrder = 1
      OnClick = btCancelarClick
    end
  end
end
