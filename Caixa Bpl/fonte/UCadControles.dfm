inherited frmCadControles: TfrmCadControles
  Left = 186
  Top = 52
  Caption = 'Controles'
  ClientHeight = 626
  ClientWidth = 881
  Scaled = False
  ExplicitWidth = 889
  ExplicitHeight = 660
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelFundo: TPanel
    Width = 881
    Height = 607
    ExplicitWidth = 881
    ExplicitHeight = 607
    inherited Splitter2: TSplitter
      Height = 605
      ExplicitHeight = 572
    end
    inherited PanelLeft: TPanel
      Width = 876
      Height = 605
      ExplicitWidth = 876
      ExplicitHeight = 605
      inherited PageControl1: TPageControl
        Width = 874
        Height = 603
        ExplicitWidth = 874
        ExplicitHeight = 603
        inherited TabSheet1: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 866
          ExplicitHeight = 572
          inherited ScrollBox1: TScrollBox
            Width = 866
            Height = 572
            ExplicitWidth = 866
            ExplicitHeight = 572
            inherited PageControl3: TPageControl
              Width = 866
              Height = 524
              OnChange = PageControl3Change
              ExplicitWidth = 866
              ExplicitHeight = 524
              inherited TabSheet3: TTabSheet
                Caption = 'Controles'
                ExplicitLeft = 4
                ExplicitTop = 27
                ExplicitWidth = 858
                ExplicitHeight = 493
                inherited ScrollBox3: TScrollBox
                  Width = 858
                  Height = 493
                  ExplicitWidth = 858
                  ExplicitHeight = 493
                  inherited GroupBox1: TGroupBox
                    Width = 854
                    Height = 489
                    Caption = 'Dados do controle'
                    ExplicitWidth = 854
                    ExplicitHeight = 489
                    object pnControlesTop: TPanel
                      Left = 2
                      Top = 15
                      Width = 850
                      Height = 35
                      Align = alTop
                      BevelOuter = bvNone
                      Enabled = False
                      TabOrder = 0
                      object Label35: TLabel
                        Left = 122
                        Top = 9
                        Width = 44
                        Height = 13
                        Caption = 'Unificada'
                        FocusControl = DBEdit1
                      end
                      object DBEditCodEmpresa: TDBEdit
                        Left = 172
                        Top = 6
                        Width = 68
                        Height = 21
                        Hint = 'C'#243'digo do empresa'
                        DataField = 'CODIGO_EMP'
                        DataSource = DtmCadBasicosCx.dsControles
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clSilver
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = []
                        ParentFont = False
                        ParentShowHint = False
                        ShowHint = False
                        TabOrder = 0
                      end
                      object ComboBoxCodEmpresa: TComboBox
                        Left = 243
                        Top = 6
                        Width = 391
                        Height = 21
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clSilver
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = []
                        ItemHeight = 13
                        ParentFont = False
                        TabOrder = 1
                        Text = 'ComboBoxCodEmpresa'
                      end
                    end
                    object pnControlesBottom: TPanel
                      Left = 2
                      Top = 50
                      Width = 850
                      Height = 437
                      Align = alClient
                      BevelOuter = bvNone
                      TabOrder = 1
                      object Label6: TLabel
                        Left = 74
                        Top = 9
                        Width = 92
                        Height = 13
                        Caption = 'C'#243'digo do Controle'
                        FocusControl = DBEdit1
                      end
                      object Label7: TLabel
                        Left = 412
                        Top = 9
                        Width = 82
                        Height = 13
                        Caption = 'Saldo Ini. Fluxo ?'
                      end
                      object Label8: TLabel
                        Left = 81
                        Top = 34
                        Width = 85
                        Height = 13
                        Caption = 'Controle Banc'#225'rio'
                      end
                      object Label9: TLabel
                        Left = 410
                        Top = 34
                        Width = 84
                        Height = 13
                        Caption = 'N'#250'mero do Banco'
                        FocusControl = DBEdit4
                      end
                      object Label10: TLabel
                        Left = 100
                        Top = 135
                        Width = 66
                        Height = 13
                        Caption = 'Nome do Ctrl.'
                        FocusControl = DBEdit5
                      end
                      object Label11: TLabel
                        Left = 88
                        Top = 184
                        Width = 78
                        Height = 13
                        Caption = 'Contato do Ctrl.'
                        FocusControl = DBEdit6
                      end
                      object Label12: TLabel
                        Left = 82
                        Top = 234
                        Width = 84
                        Height = 13
                        Caption = 'Endere'#231'o do Ctrl.'
                        FocusControl = DBEdit7
                      end
                      object Label13: TLabel
                        Left = 375
                        Top = 209
                        Width = 67
                        Height = 13
                        Caption = 'Bairro do Ctrl.'
                        FocusControl = DBEdit8
                      end
                      object Label14: TLabel
                        Left = 94
                        Top = 209
                        Width = 72
                        Height = 13
                        Caption = 'Cidade do Ctrl.'
                        FocusControl = DBEdit9
                      end
                      object Label15: TLabel
                        Left = 114
                        Top = 259
                        Width = 52
                        Height = 13
                        Caption = 'UF do Ctrl.'
                        FocusControl = DBEdit10
                      end
                      object Label16: TLabel
                        Left = 436
                        Top = 259
                        Width = 58
                        Height = 13
                        Caption = 'CEP do Ctrl.'
                        FocusControl = DBEdit11
                      end
                      object Label17: TLabel
                        Left = 85
                        Top = 283
                        Width = 81
                        Height = 13
                        Caption = 'Telefone do Ctrl.'
                        FocusControl = DBEdit12
                      end
                      object Label18: TLabel
                        Left = 386
                        Top = 59
                        Width = 108
                        Height = 13
                        Caption = 'N'#250'mero Conta do Ctrl.'
                        FocusControl = DBEdit13
                      end
                      object Label19: TLabel
                        Left = 102
                        Top = 84
                        Width = 64
                        Height = 13
                        Caption = 'Tipo de Plano'
                      end
                      object Label20: TLabel
                        Left = 83
                        Top = 109
                        Width = 83
                        Height = 13
                        Caption = 'Natureza do Ctrl.'
                      end
                      object Label21: TLabel
                        Left = 376
                        Top = 109
                        Width = 118
                        Height = 13
                        Caption = 'D'#233'b. Sa'#237'da Ctrl. Cont'#225'bil'
                      end
                      object Label22: TLabel
                        Left = 74
                        Top = 308
                        Width = 92
                        Height = 13
                        Caption = 'Saldo Anterior Ctrl.'
                        FocusControl = DBEdit17
                      end
                      object Label23: TLabel
                        Left = 416
                        Top = 308
                        Width = 78
                        Height = 13
                        Caption = 'Saldo Atual Ctrl.'
                        FocusControl = DBEdit18
                      end
                      object Label24: TLabel
                        Left = 395
                        Top = 283
                        Width = 99
                        Height = 13
                        Caption = 'Usar Boleto Banc'#225'rio'
                      end
                      object Label25: TLabel
                        Left = 67
                        Top = 331
                        Width = 99
                        Height = 13
                        Caption = 'Entrar em Condi'#231#245'es'
                      end
                      object Label26: TLabel
                        Left = 376
                        Top = 331
                        Width = 118
                        Height = 13
                        Caption = 'Controle de Documentos'
                      end
                      object Label27: TLabel
                        Left = 32
                        Top = 357
                        Width = 134
                        Height = 13
                        Caption = 'Indicador de Fluxo de Caixa'
                      end
                      object Label28: TLabel
                        Left = 370
                        Top = 357
                        Width = 124
                        Height = 13
                        Caption = 'Sequ'#234'ncia Dentro Quadro'
                        FocusControl = DBEdit23
                      end
                      object Label29: TLabel
                        Left = 20
                        Top = 378
                        Width = 146
                        Height = 13
                        Caption = 'Composi'#231#227'o de Saldo de Caixa'
                      end
                      object Label30: TLabel
                        Left = 369
                        Top = 378
                        Width = 125
                        Height = 13
                        Caption = 'Natureza de Lan'#231'amentos'
                      end
                      object Label40: TLabel
                        Left = 97
                        Top = 159
                        Width = 69
                        Height = 13
                        Caption = 'Nome Cont'#225'bil'
                        FocusControl = DBEdit2
                      end
                      object Label48: TLabel
                        Left = 128
                        Top = 59
                        Width = 38
                        Height = 13
                        Caption = 'Ag'#234'ncia'
                        FocusControl = DBEdit22
                      end
                      object DBEdit1: TDBEdit
                        Left = 172
                        Top = 0
                        Width = 134
                        Height = 21
                        Hint = 'C'#243'digo do controle informado pelo cliente.'
                        DataField = 'CODIGO_CTRL'
                        DataSource = DtmCadBasicosCx.dsControles
                        ParentShowHint = False
                        ShowHint = False
                        TabOrder = 0
                      end
                      object DBEdit4: TDBEdit
                        Left = 500
                        Top = 31
                        Width = 134
                        Height = 21
                        Hint = 'N'#250'mero do banco ao qual o controle se refere.'
                        DataField = 'N_BANCO_CTRL'
                        DataSource = DtmCadBasicosCx.dsControles
                        TabOrder = 3
                      end
                      object DBEdit5: TDBEdit
                        Left = 172
                        Top = 131
                        Width = 462
                        Height = 21
                        Hint = 'Nome dado ao controle (ex: Dinheiro). '
                        DataField = 'NOME_CTRL'
                        DataSource = DtmCadBasicosCx.dsControles
                        TabOrder = 9
                      end
                      object DBEdit6: TDBEdit
                        Left = 172
                        Top = 181
                        Width = 462
                        Height = 21
                        Hint = 'Contato do controle em caso de controle banc'#225'rio.'
                        DataField = 'CONTATO_CTRL'
                        DataSource = DtmCadBasicosCx.dsControles
                        TabOrder = 11
                      end
                      object DBEdit7: TDBEdit
                        Left = 172
                        Top = 231
                        Width = 462
                        Height = 21
                        Hint = 'Endere'#231'o do Controle.'
                        DataField = 'END_CTRL'
                        DataSource = DtmCadBasicosCx.dsControles
                        TabOrder = 14
                      end
                      object DBEdit8: TDBEdit
                        Left = 448
                        Top = 206
                        Width = 186
                        Height = 21
                        Hint = 'Bairro do Controle.'
                        DataField = 'BAIRRO_CTRL'
                        DataSource = DtmCadBasicosCx.dsControles
                        TabOrder = 13
                      end
                      object DBEdit9: TDBEdit
                        Left = 172
                        Top = 206
                        Width = 197
                        Height = 21
                        Hint = 'Cidade do Controle.'
                        DataField = 'CID_CTRL'
                        DataSource = DtmCadBasicosCx.dsControles
                        TabOrder = 12
                      end
                      object DBEdit10: TDBEdit
                        Left = 172
                        Top = 256
                        Width = 134
                        Height = 21
                        Hint = 'Estado do Controle.'
                        DataField = 'UF_CTRL'
                        DataSource = DtmCadBasicosCx.dsControles
                        TabOrder = 15
                      end
                      object DBEdit11: TDBEdit
                        Left = 500
                        Top = 256
                        Width = 134
                        Height = 21
                        Hint = 'Cep. do Controle.'
                        DataField = 'CEP_CTRL'
                        DataSource = DtmCadBasicosCx.dsControles
                        TabOrder = 16
                      end
                      object DBEdit12: TDBEdit
                        Left = 172
                        Top = 280
                        Width = 135
                        Height = 21
                        Hint = 'Telefone do Controle.'
                        DataField = 'FONE_CTRL'
                        DataSource = DtmCadBasicosCx.dsControles
                        TabOrder = 17
                      end
                      object DBEdit13: TDBEdit
                        Left = 500
                        Top = 56
                        Width = 134
                        Height = 21
                        Hint = 'N'#186' da conta do controle em caso de o controle ser banc'#225'rio.'
                        DataField = 'N_CONTA_CTRL'
                        DataSource = DtmCadBasicosCx.dsControles
                        TabOrder = 5
                      end
                      object DBEdit17: TDBEdit
                        Left = 172
                        Top = 305
                        Width = 134
                        Height = 21
                        Hint = 
                          'Possibilita ao usu'#225'rio visualizar saldo anterior da empresa asso' +
                          'ciado ao controle em quest'#227'o.'
                        DataField = 'SALDO_ANT_CTRL'
                        DataSource = DtmCadBasicosCx.dsControles
                        TabOrder = 19
                      end
                      object DBEdit18: TDBEdit
                        Left = 500
                        Top = 305
                        Width = 134
                        Height = 21
                        Hint = 
                          'Possibilita ao usu'#225'rio visualizar saldo atual da empresa associa' +
                          'do ao controle em quest'#227'o. '
                        DataField = 'SALDO_AT_CTRL'
                        DataSource = DtmCadBasicosCx.dsControles
                        TabOrder = 20
                      end
                      object DBEdit23: TDBEdit
                        Left = 500
                        Top = 354
                        Width = 134
                        Height = 21
                        Hint = 
                          'Sequ'#234'ncia desejada para aparecimento dos controles na quita'#231#227'o. ' +
                          '("Tela Formas de Pagamento").'
                        DataField = 'QSEQPERF'
                        DataSource = DtmCadBasicosCx.dsControles
                        TabOrder = 24
                      end
                      object DBComboBox1: TDBComboBox
                        Left = 500
                        Top = 6
                        Width = 134
                        Height = 21
                        Hint = 
                          'Define se controle entra ou n'#227'o no fluxo de caixa. Caso SIM, o f' +
                          'luxo de caixa tem a participa'#231#227'o do controle em quest'#227'o nas prev' +
                          'is'#245'es.'
                        DataField = 'FLUXO_CTRL'
                        DataSource = DtmCadBasicosCx.dsControles
                        ItemHeight = 13
                        Items.Strings = (
                          'SIM'
                          'N'#195'O')
                        TabOrder = 1
                        OnKeyPress = DBComboBox1KeyPress
                      end
                      object DBComboBox2: TDBComboBox
                        Left = 172
                        Top = 29
                        Width = 135
                        Height = 21
                        Hint = 'Campo utilizado para determinar se o controle '#233' banc'#225'rio ou n'#227'o.'
                        DataField = 'CONTR_BANC'
                        DataSource = DtmCadBasicosCx.dsControles
                        ItemHeight = 13
                        Items.Strings = (
                          'SIM'
                          'N'#195'O')
                        TabOrder = 2
                        OnKeyPress = DBComboBox2KeyPress
                      end
                      object DBComboBox3: TDBComboBox
                        Left = 172
                        Top = 81
                        Width = 134
                        Height = 21
                        Hint = 'Tipo do Plano usado para o controle.'
                        DataField = 'TP_PLANO'
                        DataSource = DtmCadBasicosCx.dsControles
                        ItemHeight = 13
                        Items.Strings = (
                          'C - Cart'#227'o'
                          'F - Financiamento'
                          'B - Boleta'
                          'E - Cheque Pr'#233
                          'O - Outros')
                        TabOrder = 6
                        OnKeyPress = DBComboBox3KeyPress
                      end
                      object DBComboBox4: TDBComboBox
                        Left = 172
                        Top = 106
                        Width = 134
                        Height = 21
                        Hint = 'Define a natureza do controle.'
                        DataField = 'NAT_CTRL'
                        DataSource = DtmCadBasicosCx.dsControles
                        ItemHeight = 13
                        Items.Strings = (
                          'A - A Vista'
                          'P - A Prazo')
                        TabOrder = 7
                        OnKeyPress = DBComboBox4KeyPress
                      end
                      object DBComboBox5: TDBComboBox
                        Left = 500
                        Top = 106
                        Width = 134
                        Height = 21
                        Hint = 
                          'Campo utilizado para que se possa permitir um acerto na emiss'#227'o ' +
                          'do caixa cont'#225'bil.'
                        DataField = 'DEB_SAI_CNT'
                        DataSource = DtmCadBasicosCx.dsControles
                        ItemHeight = 13
                        Items.Strings = (
                          'SIM'
                          'N'#195'O')
                        TabOrder = 8
                        OnKeyPress = DBComboBox5KeyPress
                      end
                      object DBComboBox6: TDBComboBox
                        Left = 500
                        Top = 280
                        Width = 134
                        Height = 21
                        Hint = 
                          'Define se ser'#225' ou n'#227'o feito o uso de boletos banc'#225'rios para o co' +
                          'ntrole.'
                        DataField = 'USAR_BOLETO'
                        DataSource = DtmCadBasicosCx.dsControles
                        ItemHeight = 13
                        Items.Strings = (
                          'SIM'
                          'N'#195'O')
                        TabOrder = 18
                        OnKeyPress = DBComboBox6KeyPress
                      end
                      object DBComboBox7: TDBComboBox
                        Left = 172
                        Top = 328
                        Width = 135
                        Height = 21
                        Hint = 
                          'Define se o controle entra ou n'#227'o nas condi'#231#245'es de recebimento (' +
                          '"Tela formas de Pagamento que '#233' aberta ap'#243's confirmar Ordem de S' +
                          'ervi'#231'os, Requisi'#231#245'es, etc.") no caixa auxiliar ou no retaguarda ' +
                          '("Automa'#231#227'o"), caso a empresa n'#227'o trabalhe com o caixa auxiliar.'
                        DataField = 'CXENT'
                        DataSource = DtmCadBasicosCx.dsControles
                        ItemHeight = 13
                        Items.Strings = (
                          'SIM'
                          'N'#195'O')
                        TabOrder = 21
                        OnKeyPress = DBComboBox7KeyPress
                      end
                      object DBComboBox8: TDBComboBox
                        Left = 500
                        Top = 328
                        Width = 134
                        Height = 21
                        Hint = 
                          'Possibilita ao usu'#225'rio integrar o dinheiro, os cheques, as Notas' +
                          ' aos controles de documentos indicados.'
                        DataField = 'DOCS'
                        DataSource = DtmCadBasicosCx.dsControles
                        ItemHeight = 13
                        Items.Strings = (
                          'S1 - Sim Cheque'
                          'S2 - Sim Creditos'
                          'N - N'#227'o (Dinheiro)')
                        TabOrder = 22
                        OnExit = DBComboBox8Exit
                        OnKeyPress = DBComboBox8KeyPress
                      end
                      object DBComboBox9: TDBComboBox
                        Left = 172
                        Top = 376
                        Width = 135
                        Height = 21
                        Hint = 
                          'Campo que define se o controle entra ou n'#227'o na composi'#231#227'o de sal' +
                          'do de caixa no boletim de caixa.'
                        DataField = 'COMPSALDO'
                        DataSource = DtmCadBasicosCx.dsControles
                        ItemHeight = 13
                        Items.Strings = (
                          'SIM'
                          'N'#195'O')
                        TabOrder = 25
                        OnKeyPress = DBComboBox9KeyPress
                      end
                      object DBComboBox10: TDBComboBox
                        Left = 500
                        Top = 376
                        Width = 134
                        Height = 21
                        Hint = 'Natureza dos lan'#231'amentos efetuados para este controle.'
                        DataField = 'NAT_LANC'
                        DataSource = DtmCadBasicosCx.dsControles
                        ItemHeight = 13
                        Items.Strings = (
                          'C - Cont'#225'bil'
                          'N - N'#227'o Cont'#225'bil')
                        TabOrder = 26
                        OnExit = DBComboBox10Exit
                        OnKeyPress = DBComboBox10KeyPress
                      end
                      object DBEdit14: TDBEdit
                        Left = 172
                        Top = 352
                        Width = 135
                        Height = 21
                        Hint = 
                          'Colocar 1 para que este Controle entre no Fluxo de Caixa como co' +
                          'nta a receber'
                        DataField = 'QPERF'
                        DataSource = DtmCadBasicosCx.dsControles
                        ParentShowHint = False
                        ShowHint = True
                        TabOrder = 23
                      end
                      object DBEdit2: TDBEdit
                        Left = 172
                        Top = 156
                        Width = 462
                        Height = 21
                        Hint = 'Nome dado ao controle (ex: Dinheiro). '
                        DataField = 'NOME_CONTABIL'
                        DataSource = DtmCadBasicosCx.dsControles
                        TabOrder = 10
                        OnEnter = DBEdit2Enter
                      end
                      object DBEdit22: TDBEdit
                        Left = 172
                        Top = 56
                        Width = 68
                        Height = 21
                        DataField = 'AGENCIA_CTRL'
                        DataSource = DtmCadBasicosCx.dsControles
                        TabOrder = 4
                      end
                    end
                  end
                end
              end
              object TabSheet4: TTabSheet
                Caption = 'Outros Controles/Dados'
                ImageIndex = 1
                OnShow = TabSheet4Show
                object ScrollBox5: TScrollBox
                  Left = 0
                  Top = 0
                  Width = 858
                  Height = 493
                  Align = alClient
                  BevelInner = bvNone
                  BevelOuter = bvNone
                  BorderStyle = bsNone
                  TabOrder = 0
                  object GroupBox4: TGroupBox
                    Left = 0
                    Top = 0
                    Width = 841
                    Height = 553
                    Align = alTop
                    Caption = ' Outros dados do Controle '
                    TabOrder = 0
                    OnEnter = GroupBox4Enter
                    object GroupBox5: TGroupBox
                      Left = 2
                      Top = 15
                      Width = 854
                      Height = 96
                      Align = alTop
                      Caption = ' Sped Fiscal  - NFC-e'
                      TabOrder = 0
                      object Label32: TLabel
                        Left = 64
                        Top = 18
                        Width = 93
                        Height = 13
                        Caption = 'Indicador de T'#237'tulo:'
                      end
                      object Label33: TLabel
                        Left = 26
                        Top = 45
                        Width = 131
                        Height = 13
                        Hint = 
                          'C'#243'digo da institui'#231#227'o que efetua o pagamento das vendas realizad' +
                          'as por esse controle (Cadastro do cliente)'
                        Alignment = taRightJustify
                        Caption = 'C'#243'd institui'#231#227'o pagamento:'
                        FocusControl = DBEdit3
                      end
                      object Label57: TLabel
                        Left = 537
                        Top = 18
                        Width = 109
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'NF-e/NFC-e Tipo Pag.:'
                      end
                      object Label58: TLabel
                        Left = 506
                        Top = 45
                        Width = 143
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'NF-e/NFC-e Bandeira Padr'#227'o:'
                        FocusControl = DBEdit3
                      end
                      object lb_cliente_inst_pagto: TLabel
                        Left = 220
                        Top = 45
                        Width = 227
                        Height = 13
                        AutoSize = False
                        Caption = 'lb_cliente_inst_pagto'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clBlue
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = []
                        ParentFont = False
                      end
                      object lb_cliente_inst_intermed_transacao: TLabel
                        Left = 220
                        Top = 69
                        Width = 227
                        Height = 13
                        AutoSize = False
                        Caption = 'lb_cliente_inst_intermed_transacao'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clBlue
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = []
                        ParentFont = False
                      end
                      object Label73: TLabel
                        Left = 521
                        Top = 72
                        Width = 128
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'SPED - Usar registro 1601:'
                        FocusControl = DBEdit3
                      end
                      object Label74: TLabel
                        Left = 16
                        Top = 72
                        Width = 141
                        Height = 13
                        Hint = 
                          'C'#243'digo da institui'#231#227'o que efetua a intermedia'#231#227'o da transa'#231#227'o, E' +
                          'x: Marketplaces, Deliverys, etc.(Cadastro do cliente)'
                        Alignment = taRightJustify
                        Caption = 'C'#243'd inst intermedia'#231#227'o trans:'
                        FocusControl = DBEdit3
                      end
                      object DBEdit3: TDBEdit
                        Left = 163
                        Top = 42
                        Width = 51
                        Height = 21
                        Hint = 
                          'C'#243'digo da institui'#231#227'o que efetua o pagamento das vendas realizad' +
                          'as por esse controle (Cadastro do cliente)'
                        DataField = 'CARTAO_SPED_PART'
                        DataSource = DtmCadBasicosCx.dsControles
                        TabOrder = 1
                        OnExit = DBEdit3Exit
                      end
                      object DBComboBox11: TDBComboBox
                        Left = 163
                        Top = 15
                        Width = 160
                        Height = 21
                        DataField = 'IND_TIT'
                        DataSource = DtmCadBasicosCx.dsControles
                        ItemHeight = 13
                        Items.Strings = (
                          '00- Duplicata;'
                          '01- Cheque;'
                          '02- Promiss'#243'ria;'
                          '03- Recibo;'
                          '99- Outros')
                        TabOrder = 0
                      end
                      object DBRadioGroup1: TDBRadioGroup
                        Left = 372
                        Top = 12
                        Width = 116
                        Height = 73
                        Caption = 'Registro 1601 como?'
                        DataField = 'CARTAO_SPED'
                        DataSource = DtmCadBasicosCx.dsControles
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = []
                        Items.Strings = (
                          '0 - N'#227'o'
                          '1 - D'#233'bito'
                          '2 - Cr'#233'dito')
                        ParentBackground = True
                        ParentFont = False
                        TabOrder = 6
                        Values.Strings = (
                          '0'
                          '1'
                          '2')
                        Visible = False
                      end
                      object lkFormaPagamento: TDBLookupComboBox
                        Left = 655
                        Top = 15
                        Width = 175
                        Height = 21
                        DataField = 'NFCE_TPAG'
                        DataSource = DtmCadBasicosCx.dsControles
                        DropDownWidth = 275
                        TabOrder = 3
                      end
                      object lkBandeira: TDBLookupComboBox
                        Left = 655
                        Top = 42
                        Width = 175
                        Height = 21
                        DataField = 'NFCE_TBAND'
                        DataSource = DtmCadBasicosCx.dsControles
                        DropDownWidth = 275
                        TabOrder = 4
                      end
                      object DBEdit29: TDBEdit
                        Left = 163
                        Top = 69
                        Width = 51
                        Height = 21
                        Hint = 
                          'C'#243'digo da institui'#231#227'o que efetua a intermedia'#231#227'o da transa'#231#227'o, E' +
                          'x: Marketplaces, Deliverys, etc.(Cadastro do cliente)'
                        DataField = 'CARTAO_SPED_PART_IT'
                        DataSource = DtmCadBasicosCx.dsControles
                        TabOrder = 2
                        OnExit = DBEdit29Exit
                      end
                      object edRegistro1601: TDBLookupComboBox
                        Left = 655
                        Top = 69
                        Width = 175
                        Height = 21
                        DataField = 'CARTAO_SPED'
                        DataSource = DtmCadBasicosCx.dsControles
                        DropDownWidth = 275
                        TabOrder = 5
                      end
                    end
                    object GroupBox9: TGroupBox
                      Left = 2
                      Top = 429
                      Width = 854
                      Height = 74
                      Align = alTop
                      Caption = 'Cart'#227'o de Cr'#233'dito'
                      TabOrder = 2
                      object Label39: TLabel
                        Left = 40
                        Top = 19
                        Width = 117
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Taxa Cart'#227'o de Cr'#233'dito:'
                        FocusControl = DBEdit16
                      end
                      object Label42: TLabel
                        Left = 45
                        Top = 46
                        Width = 111
                        Height = 13
                        Caption = 'N'#176' Conta Taxa Cart'#227'o:'
                        FocusControl = DBEdit19
                      end
                      object Label43: TLabel
                        Left = 385
                        Top = 19
                        Width = 177
                        Height = 13
                        Caption = 'Controle Saida Taxa Cart'#227'o (Banco):'
                        FocusControl = DBEdit20
                      end
                      object Label49: TLabel
                        Left = 447
                        Top = 46
                        Width = 115
                        Height = 13
                        Caption = 'N'#186' Conta Tarifa Cartao:'
                        FocusControl = DBEdit24
                      end
                      object DBEdit16: TDBEdit
                        Left = 163
                        Top = 16
                        Width = 134
                        Height = 21
                        Hint = 
                          'Campo n'#227'o utilizado no processamento de arquivos da Concilia'#231#227'o ' +
                          'de cart'#227'o'
                        DataField = 'TAXA_CARTAO'
                        DataSource = DtmCadBasicosCx.dsControles
                        ParentShowHint = False
                        ShowHint = True
                        TabOrder = 0
                      end
                      object DBEdit19: TDBEdit
                        Left = 163
                        Top = 43
                        Width = 134
                        Height = 21
                        DataField = 'N_CONTA_PLC_TX_CARTAO'
                        DataSource = DtmCadBasicosCx.dsControles
                        TabOrder = 3
                        OnExit = DBEdit19Exit
                        OnKeyDown = DBEdit19KeyDown
                      end
                      object DBEdit20: TDBEdit
                        Left = 568
                        Top = 16
                        Width = 42
                        Height = 21
                        Hint = 
                          'Campo n'#227'o utilizado no processamento de arquivos da Concilia'#231#227'o ' +
                          'de cart'#227'o'
                        DataField = 'CTRL_SAIDA_TX_CARTAO'
                        DataSource = DtmCadBasicosCx.dsControles
                        ParentShowHint = False
                        ShowHint = True
                        TabOrder = 1
                        OnExit = DBEdit20Exit
                        OnKeyDown = DBEdit20KeyDown
                      end
                      object Edit1: TEdit
                        Left = 616
                        Top = 16
                        Width = 214
                        Height = 21
                        Hint = 
                          'Campo n'#227'o utilizado no processamento de arquivos da Concilia'#231#227'o ' +
                          'de cart'#227'o'
                        Enabled = False
                        ParentShowHint = False
                        ShowHint = True
                        TabOrder = 2
                        Text = 'Edit1'
                      end
                      object DBEdit24: TDBEdit
                        Left = 567
                        Top = 43
                        Width = 134
                        Height = 21
                        DataField = 'N_CONTA_PLC_TARIFA_CARTAO'
                        DataSource = DtmCadBasicosCx.dsControles
                        TabOrder = 4
                      end
                    end
                    object Panel15: TPanel
                      Left = 2
                      Top = 111
                      Width = 854
                      Height = 318
                      Align = alTop
                      BevelOuter = bvNone
                      TabOrder = 1
                      object Label37: TLabel
                        Left = 189
                        Top = 279
                        Width = 461
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 
                          'Barrar/Desbarrar clientes ao (CADASTRAR/QUITAR/ESTORNA/TRANSFERI' +
                          'R)  Cr'#233'dito / Cheque:'
                      end
                      object Label38: TLabel
                        Left = 14
                        Top = 6
                        Width = 143
                        Height = 13
                        Caption = 'C'#243'digo do Finalizador do ECF:'
                        FocusControl = DBEdit15
                      end
                      object Label41: TLabel
                        Left = 30
                        Top = 33
                        Width = 127
                        Height = 13
                        Caption = 'Receber no Caixa Auxiliar:'
                      end
                      object Label44: TLabel
                        Left = 78
                        Top = 60
                        Width = 79
                        Height = 13
                        Caption = 'Gerar Comiss'#227'o:'
                      end
                      object Label45: TLabel
                        Left = 3
                        Top = 87
                        Width = 154
                        Height = 13
                        Caption = 'Entra no Prazo medio de venda:'
                      end
                      object Label46: TLabel
                        Left = 40
                        Top = 113
                        Width = 117
                        Height = 13
                        Caption = 'Sigla Venda para Mobile:'
                        FocusControl = DBEdit21
                      end
                      object Label47: TLabel
                        Left = 327
                        Top = 111
                        Width = 104
                        Height = 26
                        Caption = '(Ex.: B - Bonifica'#231#227'o, V - Varejo, etc.)'
                        WordWrap = True
                      end
                      object Label50: TLabel
                        Left = 443
                        Top = 6
                        Width = 207
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Forma de pagamento padr'#227'o para clientes:'
                      end
                      object Label51: TLabel
                        Left = 496
                        Top = 33
                        Width = 154
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'N'#227'o gerar registros Financeiros:'
                      end
                      object Label52: TLabel
                        Left = 563
                        Top = 60
                        Width = 87
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Baixa Autom'#225'tica:'
                      end
                      object Label53: TLabel
                        Left = 462
                        Top = 87
                        Width = 188
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Num Conta Sa'#237'da Plc Baixa Autom'#225'tica:'
                        FocusControl = DBEdit25
                      end
                      object Label54: TLabel
                        Left = 445
                        Top = 114
                        Width = 205
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Ativar controle de retorno de mercadorias:'
                      end
                      object Label55: TLabel
                        Left = 48
                        Top = 141
                        Width = 107
                        Height = 13
                        Caption = 'Tipo de Parcelamento:'
                        ParentShowHint = False
                        ShowHint = True
                      end
                      object Label56: TLabel
                        Left = 562
                        Top = 196
                        Width = 88
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Dia base parcelas:'
                        ParentShowHint = False
                        ShowHint = True
                      end
                      object lbDiasEntFluxo: TLabel
                        Left = 83
                        Top = 169
                        Width = 72
                        Height = 13
                        Caption = 'Dias Ent Fluxo:'
                        ParentShowHint = False
                        ShowHint = True
                      end
                      object Label59: TLabel
                        Left = 495
                        Top = 138
                        Width = 155
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Exibir controle na contrapartida:'
                        ParentShowHint = False
                        ShowHint = True
                      end
                      object Label60: TLabel
                        Left = 522
                        Top = 224
                        Width = 128
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Exibir relat'#243'rios financeiro:'
                        ParentShowHint = False
                        ShowHint = True
                      end
                      object Label61: TLabel
                        Left = 385
                        Top = 168
                        Width = 265
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Quitar conta a pagar utilizando cr'#233'ditos deste controle:'
                        ParentShowHint = False
                        ShowHint = True
                      end
                      object LabelClasseProgFid: TLabel
                        Left = 46
                        Top = 197
                        Width = 111
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Classe Prog Fidelidade:'
                        ParentShowHint = False
                        ShowHint = True
                      end
                      object Label75: TLabel
                        Left = 578
                        Top = 252
                        Width = 72
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Exibir controle:'
                        ParentShowHint = False
                        ShowHint = True
                      end
                      object Label76: TLabel
                        Left = 114
                        Top = 301
                        Width = 536
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 
                          'Barrar/Desbarrar clientes de acordo com a (DATA VENC + DIAS CAR'#202 +
                          'NCIA / DATA PREV REC) Cr'#233'dito / Cheque'
                      end
                      object DBComboBox12: TDBComboBox
                        Left = 656
                        Top = 276
                        Width = 175
                        Height = 21
                        DataField = 'BARRAR_AUTOMATICO'
                        DataSource = DtmCadBasicosCx.dsControles
                        ItemHeight = 13
                        Items.Strings = (
                          'SIM'
                          'NAO')
                        TabOrder = 19
                      end
                      object DBEdit15: TDBEdit
                        Left = 163
                        Top = 3
                        Width = 160
                        Height = 21
                        DataField = 'COD_FINALIZADOR'
                        DataSource = DtmCadBasicosCx.dsControles
                        TabOrder = 0
                      end
                      object DBComboBox13: TDBComboBox
                        Left = 163
                        Top = 30
                        Width = 160
                        Height = 21
                        DataField = 'ENTRA_PREST_CXL'
                        DataSource = DtmCadBasicosCx.dsControles
                        ItemHeight = 13
                        Items.Strings = (
                          'SIM'
                          'N'#195'O')
                        TabOrder = 2
                        OnKeyPress = DBComboBox9KeyPress
                      end
                      object DBComboBox14: TDBComboBox
                        Left = 163
                        Top = 57
                        Width = 160
                        Height = 21
                        DataField = 'GERAR_COMISSAO'
                        DataSource = DtmCadBasicosCx.dsControles
                        ItemHeight = 13
                        Items.Strings = (
                          'SIM'
                          'N'#195'O')
                        TabOrder = 4
                        OnKeyPress = DBComboBox9KeyPress
                      end
                      object DBComboBox15: TDBComboBox
                        Left = 163
                        Top = 84
                        Width = 160
                        Height = 21
                        DataField = 'ENTRA_PMV'
                        DataSource = DtmCadBasicosCx.dsControles
                        ItemHeight = 13
                        Items.Strings = (
                          'SIM'
                          'N'#195'O')
                        TabOrder = 6
                        OnKeyPress = DBComboBox9KeyPress
                      end
                      object DBEdit21: TDBEdit
                        Left = 163
                        Top = 110
                        Width = 160
                        Height = 21
                        CharCase = ecUpperCase
                        DataField = 'INICIAL_TPVND_MOBILE'
                        DataSource = DtmCadBasicosCx.dsControles
                        TabOrder = 8
                      end
                      object DBComboBox16: TDBComboBox
                        Left = 656
                        Top = 3
                        Width = 175
                        Height = 21
                        DataField = 'FP_PADRAO_CL'
                        DataSource = DtmCadBasicosCx.dsControles
                        ItemHeight = 13
                        Items.Strings = (
                          'SIM - NOVOS CLIENTES'
                          'TODOS - TODOS CLIENTE'
                          'N'#195'O - NENHUM CLIENTE')
                        TabOrder = 1
                        OnKeyPress = DBComboBox9KeyPress
                      end
                      object DBComboBox17: TDBComboBox
                        Left = 656
                        Top = 30
                        Width = 175
                        Height = 21
                        DataField = 'NAO_GERA_FINAN'
                        DataSource = DtmCadBasicosCx.dsControles
                        ItemHeight = 13
                        Items.Strings = (
                          'SIM'
                          'N'#195'O')
                        TabOrder = 3
                        OnKeyPress = DBComboBox9KeyPress
                      end
                      object DBComboBox18: TDBComboBox
                        Left = 656
                        Top = 57
                        Width = 175
                        Height = 21
                        DataField = 'BAIXA_AUTOMATICA'
                        DataSource = DtmCadBasicosCx.dsControles
                        ItemHeight = 13
                        Items.Strings = (
                          'SIM'
                          'N'#195'O')
                        TabOrder = 5
                        OnKeyPress = DBComboBox9KeyPress
                      end
                      object DBEdit25: TDBEdit
                        Left = 656
                        Top = 84
                        Width = 175
                        Height = 21
                        DataField = 'N_CONTA_BX_AUTO'
                        DataSource = DtmCadBasicosCx.dsControles
                        TabOrder = 7
                      end
                      object DBComboBox19: TDBComboBox
                        Left = 656
                        Top = 111
                        Width = 175
                        Height = 21
                        DataField = 'RETORNOS'
                        DataSource = DtmCadBasicosCx.dsControles
                        ItemHeight = 13
                        Items.Strings = (
                          'SIM'
                          'N'#195'O')
                        TabOrder = 9
                        OnKeyPress = DBComboBox9KeyPress
                      end
                      object DBComboBox20: TDBComboBox
                        Tag = 1
                        Left = 163
                        Top = 138
                        Width = 160
                        Height = 21
                        DataField = 'TIPO_PARCELAMENTO'
                        DataSource = DtmCadBasicosCx.dsControles
                        ItemHeight = 13
                        Items.Strings = (
                          'I1 - Parcelas iguais e diferen'#231'a na primeira'
                          'IN - Parcelas iguais e diferen'#231'a na '#250'ltima'
                          'T1 - Truncamento de parcelas e diferen'#231'a na primeira'
                          'TN - Truncamento de parcelas e diferen'#231'a na '#250'ltima'
                          'N - N'#227'o usar para este controle. Usar do config')
                        ParentShowHint = False
                        ShowHint = True
                        TabOrder = 10
                        OnKeyPress = DBComboBox9KeyPress
                      end
                      object DBComboBox21: TDBComboBox
                        Tag = 1
                        Left = 656
                        Top = 193
                        Width = 175
                        Height = 21
                        DataField = 'DIA_BASE_PARCELAMENTO'
                        DataSource = DtmCadBasicosCx.dsControles
                        ItemHeight = 13
                        Items.Strings = (
                          
                            'D1 - Dia de vencimento do cliente, se n'#227'o existir ser'#225' o dia atu' +
                            'al. Mesmo dia nas demais parcelas'
                          
                            'D2 - Dia de vencimento do cliente, se n'#227'o existir o usu'#225'rio deve' +
                            ' digitar. Mesmo dia nas demais parcelas'
                          
                            'D3 - Dia atual atribuido automaticamente. Mesmo dia nas demais p' +
                            'arcelas'
                          
                            'D4 - Dia digitado pelo usu'#225'rio no momento do parcelamento. Mesmo' +
                            ' dia nas demais parcelas'
                          
                            'D5 - 30 dias acrescidos em cada vencimento. Primeiro vencimento ' +
                            'dia D+30. Provavelmente ter'#225' dias diferentes nas demais parcelas'
                          
                            'D7 - Dia atual atribuido automaticamente. Mesmo dia nas demais p' +
                            'arcelas. Primeiro vencimento mes seguinte'
                          'N - N'#227'o usar para este controle. Usar do config')
                        ParentShowHint = False
                        ShowHint = True
                        TabOrder = 15
                        OnKeyPress = DBComboBox9KeyPress
                      end
                      object DBEdit26: TDBEdit
                        Left = 163
                        Top = 166
                        Width = 160
                        Height = 21
                        Hint = 'Quantidade de dias para entrada no fluxo do caixa'
                        CharCase = ecUpperCase
                        DataField = 'DIAS_ENT_FLUXO'
                        DataSource = DtmCadBasicosCx.dsControles
                        TabOrder = 12
                      end
                      object DBComboBox22: TDBComboBox
                        Tag = 1
                        Left = 656
                        Top = 137
                        Width = 175
                        Height = 21
                        Hint = 'Controles exibidos na tela da contrapartida'
                        DataField = 'CONTRAPARTIDA'
                        DataSource = DtmCadBasicosCx.dsControles
                        ItemHeight = 13
                        Items.Strings = (
                          'SIM'
                          'NAO')
                        ParentShowHint = False
                        ShowHint = True
                        TabOrder = 11
                        OnKeyPress = DBComboBox9KeyPress
                      end
                      object DBComboBox23: TDBComboBox
                        Tag = 1
                        Left = 656
                        Top = 221
                        Width = 175
                        Height = 21
                        Hint = 'Exibir controle em situa'#231#227'o de caixa / limite de cr'#233'ditos'
                        DataField = 'EXIBIR_RESUMO_FINANCEIRO'
                        DataSource = DtmCadBasicosCx.dsControles
                        ItemHeight = 13
                        Items.Strings = (
                          'SIM'
                          'NAO')
                        ParentShowHint = False
                        ShowHint = True
                        TabOrder = 16
                        OnKeyPress = DBComboBox9KeyPress
                      end
                      object DBComboBox24: TDBComboBox
                        Tag = 1
                        Left = 656
                        Top = 165
                        Width = 175
                        Height = 21
                        Hint = 'Quitar conta a pagar com a partir dos cr'#233'ditos'
                        DataField = 'RECEBER_CTP'
                        DataSource = DtmCadBasicosCx.dsControles
                        ItemHeight = 13
                        Items.Strings = (
                          'SIM'
                          'NAO')
                        ParentShowHint = False
                        ShowHint = True
                        TabOrder = 13
                        OnKeyPress = DBComboBox9KeyPress
                      end
                      object DBComboBoxClasseProgFid: TDBComboBox
                        Tag = 1
                        Left = 163
                        Top = 194
                        Width = 284
                        Height = 21
                        Style = csDropDownList
                        DataField = 'FP_REGRA_FIDELIDADE'
                        DataSource = DtmCadBasicosCx.dsControles
                        ItemHeight = 13
                        Items.Strings = (
                          'I1 - Parcelas iguais e diferen'#231'a na primeira'
                          'IN - Parcelas iguais e diferen'#231'a na '#250'ltima'
                          'T1 - Truncamento de parcelas e diferen'#231'a na primeira'
                          'TN - Truncamento de parcelas e diferen'#231'a na '#250'ltima'
                          'N - N'#227'o usar para este controle. Usar do config')
                        ParentShowHint = False
                        ShowHint = True
                        TabOrder = 14
                        OnKeyPress = DBComboBox9KeyPress
                      end
                      object DBComboBox26: TDBComboBox
                        Tag = 1
                        Left = 656
                        Top = 249
                        Width = 175
                        Height = 21
                        Hint = 'Exibir na situa'#231#227'o de caixa ou limite de cr'#233'dito'
                        DataField = 'EXIBIR_DOC'
                        DataSource = DtmCadBasicosCx.dsControles
                        ItemHeight = 13
                        Items.Strings = (
                          'A - AMBOS (SIT CAIXA / LIMITE CRED)'
                          'S - SITUACAO DE CAIXA'
                          'L - LIMITE DE CR'#201'DITOS'
                          'N - N'#195'O EXIBIR')
                        ParentShowHint = False
                        ShowHint = True
                        TabOrder = 18
                        OnKeyPress = DBComboBox9KeyPress
                      end
                      object DBComboBox27: TDBComboBox
                        Left = 656
                        Top = 300
                        Width = 175
                        Height = 21
                        DataField = 'BARRAMENTO_AUTOMATICO'
                        DataSource = DtmCadBasicosCx.dsControles
                        ItemHeight = 13
                        Items.Strings = (
                          'SIM'
                          'N'#195'O')
                        TabOrder = 17
                        OnKeyPress = DBComboBox9KeyPress
                      end
                    end
                    object GroupBox14: TGroupBox
                      Left = 2
                      Top = 503
                      Width = 854
                      Height = 40
                      Align = alTop
                      Caption = 'Configura'#231#245'es para o TEF'
                      TabOrder = 3
                      object Label68: TLabel
                        Left = 31
                        Top = 17
                        Width = 104
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Transa'#231#227'o eletr'#244'nica:'
                      end
                      object Label69: TLabel
                        Left = 289
                        Top = 17
                        Width = 88
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Id Carteira Digital:'
                      end
                      object Label70: TLabel
                        Left = 562
                        Top = 17
                        Width = 35
                        Height = 13
                        Hint = 'Id do Provedor de servi'#231'os de pagamento no Sitef'
                        Alignment = taRightJustify
                        Caption = 'Id PSP:'
                      end
                      object edTefTipo: TDBLookupComboBox
                        Left = 141
                        Top = 12
                        Width = 135
                        Height = 21
                        DataField = 'TEF_TIPO'
                        DataSource = DtmCadBasicosCx.dsControles
                        DropDownWidth = 275
                        TabOrder = 0
                      end
                      object edTefIdCartDig: TDBLookupComboBox
                        Left = 383
                        Top = 12
                        Width = 154
                        Height = 21
                        DataField = 'TEF_ID_CARTDIG'
                        DataSource = DtmCadBasicosCx.dsControles
                        DropDownWidth = 275
                        TabOrder = 1
                      end
                      object DBEdit28: TDBEdit
                        Left = 603
                        Top = 12
                        Width = 126
                        Height = 21
                        DataField = 'TEF_ID_PSP'
                        DataSource = DtmCadBasicosCx.dsControles
                        ParentShowHint = False
                        ShowHint = True
                        TabOrder = 2
                      end
                    end
                  end
                end
              end
              object TabSheet5: TTabSheet
                Caption = 'Controles de Balan'#231'o'
                ImageIndex = 2
                object ScrollBox6: TScrollBox
                  Left = 0
                  Top = 0
                  Width = 858
                  Height = 493
                  Align = alClient
                  TabOrder = 0
                  object Panel8: TPanel
                    Left = 0
                    Top = 0
                    Width = 854
                    Height = 489
                    Align = alTop
                    BevelOuter = bvNone
                    TabOrder = 0
                    object GroupBox8: TGroupBox
                      Left = 0
                      Top = 0
                      Width = 854
                      Height = 489
                      Align = alClient
                      Caption = ' Vincula'#231#227'o entre Controles  e Sequ'#234'ncia de Balan'#231'o '
                      TabOrder = 0
                      object GroupBox6: TGroupBox
                        Left = 2
                        Top = 42
                        Width = 850
                        Height = 168
                        Align = alTop
                        Caption = ' Dados Balan'#231'o '
                        TabOrder = 0
                        object DBGrid2: TDBGrid
                          Left = 2
                          Top = 15
                          Width = 846
                          Height = 151
                          Align = alClient
                          DataSource = DtmCadBasicosCx.dsBalanco
                          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                          ReadOnly = True
                          TabOrder = 0
                          TitleFont.Charset = DEFAULT_CHARSET
                          TitleFont.Color = clWindowText
                          TitleFont.Height = -11
                          TitleFont.Name = 'Tahoma'
                          TitleFont.Style = []
                          Columns = <
                            item
                              Expanded = False
                              FieldName = 'CODSEQ_BALANCO'
                              Visible = True
                            end
                            item
                              Expanded = False
                              FieldName = 'TIPO_BALANCO'
                              Visible = True
                            end
                            item
                              Expanded = False
                              FieldName = 'CODIGO_INT_BAL'
                              Visible = True
                            end
                            item
                              Expanded = False
                              FieldName = 'DESC_BALANCO'
                              Visible = True
                            end
                            item
                              Expanded = False
                              FieldName = 'ATIVO'
                              Visible = True
                            end
                            item
                              Expanded = False
                              FieldName = 'SUBTIPO'
                              Visible = True
                            end
                            item
                              Expanded = False
                              FieldName = 'SINAL'
                              Visible = True
                            end
                            item
                              Expanded = False
                              FieldName = 'PRAZOINICIAL'
                              Visible = True
                            end
                            item
                              Expanded = False
                              FieldName = 'PRAZOFINAL'
                              Visible = True
                            end>
                        end
                      end
                      object GroupBox7: TGroupBox
                        Left = 2
                        Top = 247
                        Width = 850
                        Height = 201
                        Align = alClient
                        Caption = ' Controles do Balan'#231'o '
                        TabOrder = 1
                        object DBGrid3: TDBGrid
                          Left = 2
                          Top = 15
                          Width = 846
                          Height = 184
                          Align = alClient
                          DataSource = DtmCadBasicosCx.dsCtrlBalanco
                          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                          ReadOnly = True
                          TabOrder = 0
                          TitleFont.Charset = DEFAULT_CHARSET
                          TitleFont.Color = clWindowText
                          TitleFont.Height = -11
                          TitleFont.Name = 'Tahoma'
                          TitleFont.Style = []
                          Columns = <
                            item
                              Expanded = False
                              FieldName = 'CODSEQ_BALANCO'
                              Visible = True
                            end
                            item
                              Expanded = False
                              FieldName = 'COD_EMPRESA'
                              Title.Caption = 'Cod. Empresa'
                              Visible = True
                            end
                            item
                              Expanded = False
                              FieldName = 'TIPO_BALANCO'
                              Title.Caption = 'Balan'#231'o'
                              Visible = True
                            end
                            item
                              Expanded = False
                              FieldName = 'CODIGO_INT_BAL'
                              Title.Caption = 'Seq. Interna Balan'#231'o'
                              Visible = True
                            end
                            item
                              Expanded = False
                              FieldName = 'DESC_BALANCO'
                              Title.Caption = 'Descri'#231#227'o Balan'#231'o'
                              Visible = True
                            end
                            item
                              Expanded = False
                              FieldName = 'SUBTIPO'
                              Title.Caption = 'Sub Tipo do Balan'#231'o'
                              Visible = True
                            end
                            item
                              Expanded = False
                              FieldName = 'SINAL'
                              Title.Caption = 'Sinal'
                              Visible = True
                            end
                            item
                              Expanded = False
                              FieldName = 'PRAZOINICIAL'
                              Title.Caption = 'Prazo Inicial'
                              Visible = True
                            end
                            item
                              Expanded = False
                              FieldName = 'PRAZOFINAL'
                              Title.Caption = 'Prazo Final'
                              Visible = True
                            end
                            item
                              Expanded = False
                              FieldName = 'IDENTIFICACAO_EMP'
                              Visible = True
                            end>
                        end
                      end
                      object Panel9: TPanel
                        Left = 2
                        Top = 210
                        Width = 850
                        Height = 37
                        Align = alTop
                        BevelKind = bkTile
                        BevelOuter = bvNone
                        TabOrder = 2
                        object BitBtn7: TBitBtn
                          Left = 164
                          Top = 6
                          Width = 107
                          Height = 25
                          Hint = 'Incluir Controle de Balan'#231'o - [CXG012]'
                          Caption = '&Incluir'
                          TabOrder = 0
                          OnClick = BitBtn7Click
                          Glyph.Data = {
                            36050000424D3605000000000000360400002800000010000000100000000100
                            08000000000000010000420B0000420B00000001000000010000B5847300AD73
                            8400B5848400B58C8400B5948C00D6BDB500C6C6C600EFD6C600CECECE00D6D6
                            D600DEDEDE00E7E7E700EFEFEF0042B5F7008CD6F700B5DEF700F7F7F700FF00
                            FF003184FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00111111111111
                            1111111111111111111111111101020202020202020202020211111111011313
                            1313131313131313021111111101131313131313131313130211111111011313
                            1313131313131313021111111101131313131313131313130211111111011313
                            1313131313131313021111111101131313131313131313130211111111011313
                            13131313131313130211111112121210101010101010101002111111120D120C
                            0C0C0C0C0C0C0C0C02111212120D1212120B0B0B0B0004030211120E0F0F0F0E
                            120A0A0A0600131302111212120F1212120909090600130211111111120F1208
                            0808080806000211111111111212120707070707050011111111}
                        end
                        object BitBtn8: TBitBtn
                          Left = 276
                          Top = 6
                          Width = 107
                          Height = 25
                          Hint = 'Excluir Controle de Balan'#231'o - [CXG011]'
                          Caption = '&Excluir'
                          TabOrder = 1
                          OnClick = BitBtn8Click
                          Glyph.Data = {
                            36050000424D3605000000000000360400002800000010000000100000000100
                            08000000000000010000220B0000220B000000010000000100000031DE000031
                            E7000031EF000031F700FF00FF000031FF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00040404040404
                            0404040404040404000004000004040404040404040404000004040000000404
                            0404040404040000040404000000000404040404040000040404040402000000
                            0404040400000404040404040404000000040000000404040404040404040400
                            0101010004040404040404040404040401010204040404040404040404040400
                            0201020304040404040404040404030201040403030404040404040404050203
                            0404040405030404040404040303050404040404040303040404040303030404
                            0404040404040403040403030304040404040404040404040404030304040404
                            0404040404040404040404040404040404040404040404040404}
                        end
                        object BitBtn12: TBitBtn
                          Left = 389
                          Top = 6
                          Width = 105
                          Height = 25
                          Hint = 'Ativar v'#237'nculo com o balan'#231'o - [CXG120]'
                          Caption = 'Ativar v'#237'nculo'
                          TabOrder = 2
                          OnClick = BitBtn12Click
                          Glyph.Data = {
                            36030000424D3603000000000000360000002800000010000000100000000100
                            18000000000000030000C40E0000C40E00000000000000000000FF00FFFF00FF
                            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                            FFFF00FF0354CBFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                            00FFFF00FFFF00FFFF00FFFF00FF0251C70C65DC0251C70251C7FF00FFFF00FF
                            0FC0F40FBCF5FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0251C7167A
                            EC1B9EF90251C7FF00FFFF00FFFF00FFFF00FF0FC0F40FBCF5FF00FFFF00FF02
                            51C70251C70251C70251C71475E91B93F70251C7FF00FFFF00FFFF00FFFF00FF
                            FF00FFFF00FFFF00FFFF00FF0354CB0557CF1475E945B0F345B0F31475E90251
                            C7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0D4743085DD51B
                            89F5106EE31B89F51B93F71B89F50251C7FF00FFFF00FFFF00FFFF00FFFF00FF
                            FF00FFFF00FF0569080D71130D47431475E945B0F30C65DC106EE31980F10251
                            C7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF01550109710F21BA4A1CA7440D
                            4743106EE31B89F50557CF0E68DF0251C7FF00FFFF00FFFF00FFFF00FFFF00FF
                            FF00FF025C0320B646176B1C21BA4A066F0B054B380C65DC1B89F50557CF0251
                            C7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF025C0320B6460D711305690805
                            6E09036704064A3C085DD50251C7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                            FF00FF025C031CA7440A7211036704025C03066F0B026004064A3CFF00FFFF00
                            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF09710F056908056E0903670402
                            6004015501015501FF00FF0FC0F40FBCF5FF00FFFF00FFFF00FFFF00FFFF00FF
                            0D71131EB146025C03005000005000005000005000FF00FFFF00FFFF00FF0FC0
                            F40FBCF5FF00FFFF00FFFF00FF04660B20B646056E09005000FF00FFFF00FFFF
                            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF015501015501
                            025C03005000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                            FFFF00FFFF00FFFF00FF09710F005000FF00FFFF00FFFF00FFFF00FFFF00FFFF
                            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                        end
                        object BitBtn46: TBitBtn
                          Left = 500
                          Top = 6
                          Width = 107
                          Height = 25
                          Hint = 'Desativar v'#237'nculo com o balan'#231'o - [CXG118]'
                          Caption = 'Desativar v'#237'nculo'
                          TabOrder = 3
                          OnClick = BitBtn46Click
                          Glyph.Data = {
                            46020000424D4602000000000000460100002800000010000000100000000100
                            08000000000000010000120B0000120B0000440000004400000000000000FFFF
                            FF00FF00FF00007F00000054000000520000004D0000004C0000004900000047
                            000001880200016A010001600100015F0100005B0100015B0200015303000266
                            0400025703000374060003730400035D0500035B0500076A0800035C0600046B
                            0800056E0C0006660C0007701100076F11000B8C1A000E7A1A00138622000C87
                            1F0020C13A001EB235002CD34A0015A533001AB6410032DC640042B2FF003EAB
                            FF002489E900288FF8002D96FF00116ED7001573E6001676E5001777E9002083
                            FE002184FF00268BFF000B64D7000D68E2001F81FF000150C6000252C6000558
                            D0000559D000075CD400116CE900393B3E00004DC400004DC200004BC000014E
                            C4000452CB006F707300020202020202020202020202023E3E02020202020202
                            020202403741382F2B3F020202020202020242393028292E3F02020202020202
                            02023F332D2A2C313F020202020202020202023F29343C363F02020202020202
                            020202023F323B353F02020202020202433D0202023F363A3F02020202170543
                            3D02434302023F3F02020202121D270502433D02020202020202020215262024
                            053D02433D02020202020202182621190A05433D020202020202020216251E11
                            0D03050202020202020202021C1A130B0C040502020202020202021F230F0807
                            070802020202020202021B221409020202020202020202020202100E06020202
                            02020202020202020202}
                        end
                      end
                      object Panel10: TPanel
                        Left = 2
                        Top = 448
                        Width = 850
                        Height = 39
                        Align = alBottom
                        BevelKind = bkTile
                        BevelOuter = bvNone
                        TabOrder = 3
                        object BitBtn45: TBitBtn
                          Left = 346
                          Top = 5
                          Width = 75
                          Height = 25
                          Hint = 'Sair'
                          Caption = 'Sair'
                          TabOrder = 0
                          OnClick = BitBtn45Click
                          Glyph.Data = {
                            2E020000424D2E020000000000002E0100002800000010000000100000000100
                            08000000000000010000120B0000120B00003E0000003E00000000000000FFFF
                            FF00FF00FF00BB410000BB420000FFF6EF00E69C5900E69D5900E9A36200FFF4
                            EA00FFF8F200FECA9500FFCE9C00FFD4A900FEEBD800FEF0E200FFF2E500FFF3
                            E700FFFBF700FECE9C00FED3A500FED5AA00FEDAB400FFDCB600FEDDB800FEDD
                            BA00FFE3C500FEE2C400FFE5C900FFE6CA00FEE5CA00FFEBD500FEF3E700FFDA
                            AD00FFEAD100FFFAF400FFD8A700FFD9A900FFDAAB00FFE1B800FFE7C700FEEE
                            D900FFFBF600FFDCAC00FFE1B500FFE7C400FFEFD700FFEAC200FFFAEA00FFFE
                            FB00FFFFFA00FFFFFE00315EFF002A56FF00123BFF00153DFF001841FF001A44
                            FF001D47FF00072BFF00001EFF00000D66000202020202020202020202020202
                            0202020202020202020202020202020202020204040404040404040404040402
                            020202040132302E28272125242F04020202020401050F221B1614130B260402
                            0202020401310A101F1A170D0C2B04020202020401013323110E1C18152C0402
                            02020204010101332A20291D192D040202020204010101010112093D1E2E043D
                            020202040101010101013D363D013D3C3D020204080606060606073D373D3B3D
                            0202020203040404040404043D383D0202020202020202020202023D353D393D
                            020202020202020202023D343D023D3A3D020202020202020202023D0202023D
                            020202020202020202020202020202020202}
                        end
                      end
                      object Panel11: TPanel
                        Left = 2
                        Top = 15
                        Width = 850
                        Height = 27
                        Align = alTop
                        BevelOuter = bvNone
                        TabOrder = 4
                        object Label36: TLabel
                          Left = 34
                          Top = 8
                          Width = 154
                          Height = 13
                          Caption = 'Codigo e  Nome do Controle'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = [fsBold]
                          ParentFont = False
                        end
                        object Label64: TLabel
                          Left = 495
                          Top = 6
                          Width = 237
                          Height = 16
                          Caption = 'DESATIVADO V'#205'NCULO COM BALAN'#199'O'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clRed
                          Font.Height = -13
                          Font.Name = 'Tahoma'
                          Font.Style = [fsBold]
                          ParentFont = False
                        end
                      end
                    end
                  end
                end
              end
              object TsSaldoBanco: TTabSheet
                Caption = 'Saldo Banco'
                ImageIndex = 3
                object Panel7: TPanel
                  Left = 17
                  Top = 16
                  Width = 246
                  Height = 128
                  TabOrder = 0
                  object Label31: TLabel
                    Left = 13
                    Top = 13
                    Width = 111
                    Height = 13
                    Caption = 'Data Para Modifica'#231#227'o:'
                  end
                  object Label34: TLabel
                    Left = 24
                    Top = 40
                    Width = 89
                    Height = 13
                    Caption = 'Valor Saldo Banco:'
                  end
                  object MaskEdit4: TMaskEdit
                    Left = 129
                    Top = 5
                    Width = 71
                    Height = 21
                    EditMask = '!99/99/0000;1;_'
                    MaxLength = 10
                    TabOrder = 0
                    Text = '  /  /    '
                  end
                  object EdtValorBanco: TEditMoeda
                    Left = 128
                    Top = 32
                    Width = 72
                    Height = 21
                    Alignment = taRightJustify
                    TabOrder = 1
                    FormatReal = fMoney
                    FormatSize = '10.2'
                  end
                  object BitBtn10: TBitBtn
                    Left = 48
                    Top = 80
                    Width = 75
                    Height = 25
                    Caption = 'OK'
                    Default = True
                    TabOrder = 2
                    OnClick = BitBtn10Click
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
                  object BitBtn11: TBitBtn
                    Left = 128
                    Top = 80
                    Width = 75
                    Height = 25
                    Cancel = True
                    Caption = 'Cancela'
                    TabOrder = 3
                    OnClick = BitBtn11Click
                    Glyph.Data = {
                      DE010000424DDE01000000000000760000002800000024000000120000000100
                      0400000000006801000000000000000000001000000000000000000000000000
                      80000080000000808000800000008000800080800000C0C0C000808080000000
                      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                      333333333333333333333333000033338833333333333333333F333333333333
                      0000333911833333983333333388F333333F3333000033391118333911833333
                      38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
                      911118111118333338F3338F833338F3000033333911111111833333338F3338
                      3333F8330000333333911111183333333338F333333F83330000333333311111
                      8333333333338F3333383333000033333339111183333333333338F333833333
                      00003333339111118333333333333833338F3333000033333911181118333333
                      33338333338F333300003333911183911183333333383338F338F33300003333
                      9118333911183333338F33838F338F33000033333913333391113333338FF833
                      38F338F300003333333333333919333333388333338FFF830000333333333333
                      3333333333333333333888330000333333333333333333333333333333333333
                      0000}
                    NumGlyphs = 2
                  end
                end
              end
              object tsControleUnificados: TTabSheet
                Caption = 'Controle Unificados'
                ImageIndex = 4
                object ScrollBox4: TScrollBox
                  Left = 0
                  Top = 0
                  Width = 858
                  Height = 493
                  Align = alClient
                  TabOrder = 0
                  object GroupBox11: TGroupBox
                    Left = 0
                    Top = 81
                    Width = 854
                    Height = 408
                    Align = alClient
                    Caption = 'Dados do controle'
                    TabOrder = 0
                    object GroupBox13: TGroupBox
                      Left = 2
                      Top = 15
                      Width = 850
                      Height = 130
                      Align = alTop
                      Caption = ' Sped Fiscal  - NFC-e'
                      TabOrder = 0
                      object Label63: TLabel
                        Left = 62
                        Top = 27
                        Width = 96
                        Height = 13
                        Caption = 'Indicador de T'#237'tulo :'
                      end
                      object Label65: TLabel
                        Left = 27
                        Top = 54
                        Width = 131
                        Height = 13
                        Hint = 
                          'C'#243'digo da institui'#231#227'o que efetua o pagamento das vendas realizad' +
                          'as por esse controle (Cadastro do cliente)'
                        Alignment = taRightJustify
                        Caption = 'C'#243'd institui'#231#227'o pagamento:'
                        FocusControl = DBEdit27
                      end
                      object lb_cliente_inst_pagto2: TLabel
                        Left = 304
                        Top = 56
                        Width = 108
                        Height = 13
                        Caption = 'lb_cliente_inst_pagto2'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clBlue
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = []
                        ParentFont = False
                      end
                      object Label72: TLabel
                        Left = 16
                        Top = 81
                        Width = 141
                        Height = 13
                        Hint = 
                          'C'#243'digo da institui'#231#227'o que efetua a intermedia'#231#227'o da transa'#231#227'o, E' +
                          'x: Marketplaces, Deliverys, etc.(Cadastro do cliente)'
                        Alignment = taRightJustify
                        Caption = 'C'#243'd inst intermedia'#231#227'o trans:'
                        FocusControl = DBEdit3
                      end
                      object lb_cliente_inst_intermed_transacao2: TLabel
                        Left = 304
                        Top = 81
                        Width = 227
                        Height = 13
                        AutoSize = False
                        Caption = 'lb_cliente_inst_intermed_transacao2'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clBlue
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = []
                        ParentFont = False
                      end
                      object DBEdit27: TDBEdit
                        Left = 164
                        Top = 51
                        Width = 134
                        Height = 21
                        Hint = 
                          'C'#243'digo da institui'#231#227'o que efetua o pagamento das vendas realizad' +
                          'as por esse controle (Cadastro do cliente)'
                        DataField = 'CARTAO_SPED_PART'
                        DataSource = DtmCadBasicosCx.dsControles
                        TabOrder = 1
                        OnExit = DBEdit3Exit
                      end
                      object DBComboBox25: TDBComboBox
                        Left = 164
                        Top = 24
                        Width = 134
                        Height = 21
                        DataField = 'IND_TIT'
                        DataSource = DtmCadBasicosCx.dsControles
                        ItemHeight = 13
                        Items.Strings = (
                          '00- Duplicata;'
                          '01- Cheque;'
                          '02- Promiss'#243'ria;'
                          '03- Recibo;'
                          '99- Outros')
                        TabOrder = 0
                      end
                      object DBEdit30: TDBEdit
                        Left = 163
                        Top = 78
                        Width = 135
                        Height = 21
                        Hint = 
                          'C'#243'digo da institui'#231#227'o que efetua a intermedia'#231#227'o da transa'#231#227'o, E' +
                          'x: Marketplaces, Deliverys, etc.(Cadastro do cliente)'
                        DataField = 'CARTAO_SPED_PART_IT'
                        DataSource = DtmCadBasicosCx.dsControles
                        TabOrder = 2
                        OnExit = DBEdit29Exit
                      end
                    end
                  end
                  object GroupBox12: TGroupBox
                    Left = 0
                    Top = 0
                    Width = 854
                    Height = 81
                    Align = alTop
                    Caption = 'Controle'
                    TabOrder = 1
                    object DBText1: TDBText
                      Left = 32
                      Top = 24
                      Width = 697
                      Height = 17
                      DataField = 'NOME_CTRL'
                      DataSource = DtmCadBasicosCx.dsControles
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label195: TLabel
                      Left = 32
                      Top = 47
                      Width = 44
                      Height = 13
                      Caption = 'Codigo: '
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object DBText2: TDBText
                      Left = 82
                      Top = 47
                      Width = 65
                      Height = 17
                      DataField = 'CODIGO_CTRL'
                      DataSource = DtmCadBasicosCx.dsControles
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clBlue
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label62: TLabel
                      Left = 200
                      Top = 47
                      Width = 55
                      Height = 13
                      Caption = 'Empresa: '
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object DBText3: TDBText
                      Left = 261
                      Top = 47
                      Width = 53
                      Height = 17
                      DataField = 'CODIGO_EMP'
                      DataSource = DtmCadBasicosCx.dsControles
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clBlue
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object lbEmpUnif2: TLabel
                      Left = 320
                      Top = 47
                      Width = 63
                      Height = 13
                      Caption = 'lbEmpUnif2'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clBlue
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                  end
                end
              end
            end
            inherited Panel3: TPanel
              Top = 524
              Width = 866
              ExplicitTop = 524
              ExplicitWidth = 866
              inherited BitBtn4: TBitBtn
                Hint = 'Salvar Registro - [CXG009]'
              end
              inherited BitBtn5: TBitBtn
                Hint = 'Cancelar Registro - [CXG010]'
              end
              object btDefinirEmp: TBitBtn
                Left = 190
                Top = 13
                Width = 110
                Height = 25
                Hint = 'Definir Empresas'
                Caption = '&Definir Empresas'
                TabOrder = 4
                OnClick = btDefinirEmpClick
                Glyph.Data = {
                  CE010000424DCE01000000000000CE0000002800000010000000100000000100
                  08000000000000010000120B0000120B0000260000002600000000000000FFFF
                  FF00FF00FF00A4262600BA414100BB444400BD4A4A00BD4B4B00BF4E4E00C050
                  5000C0515100C1535300C1545400C55C5C00CB6C6C00CF777700D17D7D00D483
                  8300004B0000098611000C9C19000A8615000C9518000D931A000F9E1C000F99
                  1C000E9D1D000F9D1E0011A4220011A02100139224001CB135001CA1340024BC
                  430029B548002EC6520035CA5E0039D465000202020202020202020202020202
                  0202020202020202020202020202020202020202020202021212020202020202
                  0202020202020212181B120202020202020202020202121F1C141D1202020202
                  02020202021223211E12171A1202020202020202122425201202121519120202
                  02020202021222120A03020212161202020202020203120C080B030202121312
                  02020202030F0E0803070903020202121202020310110D030203050803020202
                  12120202030E0302020202030603020202020202020302020202020203040302
                  0202020202020202020202020202030302020202020202020202020202020203
                  030202020202020202020202020202020202}
              end
            end
          end
        end
        inherited TabSheet2: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 866
          ExplicitHeight = 572
          inherited GroupBox3: TGroupBox
            Width = 866
            ExplicitWidth = 866
            inherited imgInformation: TImage
              Left = 840
              ExplicitLeft = 809
            end
            object btSelectAll: TSpeedButton [6]
              Left = 719
              Top = 17
              Width = 23
              Height = 21
              Hint = 'Selecionar todos'
              Flat = True
              Glyph.Data = {
                CE010000424DCE01000000000000CE0000002800000010000000100000000100
                08000000000000010000120B0000120B0000260000002600000000000000FFFF
                FF00FF00FF00A4262600BA414100BB444400BD4A4A00BD4B4B00BF4E4E00C050
                5000C0515100C1535300C1545400C55C5C00CB6C6C00CF777700D17D7D00D483
                8300004B0000098611000C9C19000A8615000C9518000D931A000F9E1C000F99
                1C000E9D1D000F9D1E0011A4220011A02100139224001CB135001CA1340024BC
                430029B548002EC6520035CA5E0039D465000202020202020202020202020202
                0202020202020202020202020202020202020202020202021212020202020202
                0202020202020212181B120202020202020202020202121F1C141D1202020202
                02020202021223211E12171A1202020202020202122425201202121519120202
                02020202021222120A03020212161202020202020203120C080B030202121312
                02020202030F0E0803070903020202121202020310110D030203050803020202
                12120202030E0302020202030603020202020202020302020202020203040302
                0202020202020202020202020202030302020202020202020202020202020203
                030202020202020202020202020202020202}
              ParentShowHint = False
              ShowHint = True
              OnClick = btSelectAllClick
            end
            object btUnSelectAll: TSpeedButton [7]
              Left = 746
              Top = 17
              Width = 23
              Height = 21
              Hint = 'Desfazer sele'#231#227'o'
              Flat = True
              Glyph.Data = {
                AA010000424DAA01000000000000AA0000002800000010000000100000000100
                08000000000000010000120B0000120B00001D0000001D00000000000000FFFF
                FF00FF00FF00CACACA00C4C4C400BFBFBF00BCBCBC00B8B8B800B5B5B500AEAE
                AE00ABABAB00A5A5A500A4A4A4009F9F9F009E9E9E009D9D9D009C9C9C009B9B
                9B009A9A9A009999990098989800979797009494940093939300929292008C8C
                8C008A8A8A007A7A7A0065656500020202020202020202020202020202020202
                02020202020202020202020202020202020202021C1C02020202020202020202
                0202021C12121C02020202020202020202021C0A0E15101C0202020202020202
                021C0508141C16131C020202020202021C04030B1C021C19141C020202020202
                021C081C0F1B02021C171C0202020202021B1C0D110E1B02021C1A1C02020202
                1B0809111B13101B0202021C1C02021B07060C1B021B16111B0202021C1C0202
                1B091B020202021B141B020202020202021B0202020202021B181B0202020202
                020202020202020202021B1B0202020202020202020202020202021B1B020202
                0202020202020202020202020202}
              ParentShowHint = False
              ShowHint = True
              OnClick = btUnSelectAllClick
            end
            inherited BitBtn1: TBitBtn
              Hint = 'Clique para pesquisar - [CXG001]'
            end
            inherited BitBtn3: TBitBtn
              Hint = 'Novo cadastro - [CXG002]'
            end
            inherited CheckBox3: TCheckBox
              Visible = False
            end
            inherited CheckBox1: TCheckBox
              Visible = False
            end
            object CheckBox2: TCheckBox
              Left = 444
              Top = 48
              Width = 140
              Height = 17
              Hint = 'Controles sem v'#237'nculo com balan'#231'o'
              Caption = 'Sem V'#237'nculo com Balan'#231'o'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 11
              OnClick = CheckBox1Click
            end
            object CheckBox4: TCheckBox
              Left = 587
              Top = 48
              Width = 187
              Height = 17
              Hint = 'Exbir controles outras empresas'
              Caption = 'Exibir controles outras empresa'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 12
              OnClick = CheckBox1Click
            end
          end
          inherited Panel1: TPanel
            Width = 866
            Height = 499
            ExplicitWidth = 866
            ExplicitHeight = 499
            inherited Splitter1: TSplitter
              Height = 438
              ExplicitTop = 57
              ExplicitHeight = 408
            end
            inherited DBGrid1: TDBGrid
              Width = 573
              Height = 438
              OnCellClick = DBGrid1CellClick
              OnDrawColumnCell = DBGrid1DrawColumnCell
              OnKeyDown = DBGrid1KeyDown
            end
            inherited Panel2: TPanel
              Width = 862
              ExplicitWidth = 862
              inherited SpeedButton1: TSpeedButton
                Hint = 'Editar Registro - [CXG004]'
              end
              inherited SpeedButton2: TSpeedButton
                Hint = 'Apagar Registro - [CXG005]'
                OnClick = SpeedButton2Click
              end
              inherited SpeedButton3: TSpeedButton
                Visible = False
              end
              inherited SpeedButton4: TSpeedButton
                Left = 235
                Top = 6
                OnClick = SpeedButton25Click
                ExplicitLeft = 235
                ExplicitTop = 6
              end
              inherited SpeedButton5: TSpeedButton
                Left = 178
                Hint = 'Recuperar registro - [CXG006]'
                OnClick = SpeedButton5Click
                ExplicitLeft = 178
              end
              inherited SpeedButton6: TSpeedButton
                Hint = 'Incluir Informa'#231#245'es para o Balanco Gerencial  - [CXG008]'
                Glyph.Data = {
                  76050000424D7605000000000000360300002800000018000000180000000100
                  08000000000040020000120B0000120B0000C0000000C0000000FF00FF000A74
                  00000872000007700500008F0000007E0000005B000007800600046C0700086D
                  0B00138F190015AB250014A82800128824001B9A340027B549000279200027AF
                  4B002CB853002BC85E0002692C000982410021955A00007A4900066B4A001191
                  6B001A99780000937D00006A600000887E00046B65000F8C8600016B6900056C
                  690062E0E000005D5F0071FBFF0077FCFF007CF4F8006EF9FF005EF2FF0065F3
                  FF0064EDF8004AEFFF004FE8F90052EDFF003DE6FF003EE9FF004BEAFF004CDB
                  ED0053D9ED005AD5E70067E0EF0066DDEC0025DBFB0027DFFF002CDFFF0033DE
                  FD003AE1FB0043E4FE0000D4FF0000CBF70000CDF70001CFF90002D2FF0005CF
                  FB0006D6FF000CD4FF000FD4FA0014D7FF0015D9FF0016D2F8001AD9FF0024D5
                  F70029C9EB0030D0F0003DC6E4004ACCE5004FC3DA0050C3DB0057CAE00000D1
                  FF0000CCFC0000CDFB0000C8F70000C3F20008CDF9000ECFFC001DC3E80031C4
                  E50033C4E50037C1E1003ABBD90048C3DE0043B4CE004EC0DD004BB8D20000B8
                  E80000B3E60000B2E50000ADDF0004B2E400036983000ABBEE000AAEDE000CB0
                  DF000EB3E10014B0DD0019BAE50018B6E10018B1DD001BB3DD001CB4DF0027BF
                  E60026B7DE0027B7DD0028B3DA0031BADD0034C0E6003BBBE00000ACE00000AC
                  DF0000A9DD0000AADD0000A3D60000A0D500009BCE0001AADD0009ADDE000AA9
                  D8000F9AC7001BADD800199CC6001D9CC60025A1C700269DC40029A2C9002B9F
                  C3002C9EC20032A8CB0036A4C600008FC4000091C400008FC300008FC2000395
                  C7000390C300038CBE000493C5001390BE001ABCF500148CB9001592BF001993
                  BF001C92BD001E94BC00229AC2002192BA002294BC002996BD002A95BC002C98
                  BE000089C2000088C000008AC0000084B8000083B700007DB1000189C100037E
                  B000037CAF000480B3000C81B1000F86B6001088B800228BB400248DB5000079
                  AE000189C3000578AC0000669A0000659900076EA0000066A000006499000062
                  970000609600005E94000A689B00146A9A000560950000000000000000000000
                  00000000B4B4B4B40000000000000000000000000000000000B4B4B4B3A9A7B1
                  B4B4B400000000000000000000000000B4885A4B4947565455617DB400000000
                  00000000000000B4352428302E38484340513C3DB400000000000000000000B6
                  602625292D3B393746425364B40000000000000000000000B4B44E333274834A
                  5881B4B40000000000000000000000000000B4B4A17E7C95B4B4000000000000
                  000000000000000000000000BD7B62BD00000000000000000000000000B4B4B4
                  B4000000BD7B63BD000000B4B4B4B400000000B4B470697979B4B400BD7F63BD
                  00B4B496671B17B4B400B48B5B726E687A7878B4BD8065BDB477761F14080210
                  1DB4B4342A2C3A36443F3EB4BD6B6ABD5F2216060312110115B400B4A0868482
                  9192AE00BD6F6CBD00180907040C0F0D20B70000B40000000000BD00BD7371BD
                  002319130B050A210000000000BC000000BD0000BD7559BD00001C1A0E001E00
                  000000000000BB00BE000000B95C4CB500000000660000000000000000AF9F9D
                  9E9B9A99AC5D4DAA93A8B2A3A2A4A6000000000000B08C8A89879C85AD4F50AB
                  94908F8D8F8EA500000000000000000000000000BA9798B80000000000000000
                  000000000000000000000000B45752B400000000000000000000000000000000
                  000000B4312F4541B4000000000000000000000000000000000000B45E272B6D
                  B400000000000000000000000000000000000000B4B4B4B40000000000000000
                  0000000000000000000000000000000000000000000000000000}
                OnClick = SpeedButton6Click
              end
              inherited SpeedButton7: TSpeedButton
                Hint = 'Atualiza Saldo Banc'#225'rio - [CXG072]'
                Glyph.Data = {
                  DA050000424DDA050000000000009A0300002800000018000000180000000100
                  08000000000040020000120B0000120B0000D9000000D9000000010097007D7A
                  A9008F8BBA00695DAC009288BA00998EBB009F95B000A99FBB00FAF7FF00AF9F
                  B700BCACC000AA9EAD00FF00FF00BDB4BB00AA999F00B6ADAF00C6BDBD00CCBF
                  B700C5BCB200C5C4BB00086E0600035A0500117D160035903A0016861F001C86
                  25002D8C3500419E4C0016B02B0015A5280016A7290016A72A0017AB2B0016A0
                  29004AA4560018B13000139F2D00139E2D0018A93100015D1300139E2F001BA4
                  360024B541005CAA6C001FBA410068B87A0018702F0053A769002F964C005DB4
                  750066A67800046B24003895570035794B00238E4A00035A2D0003582D000C60
                  3A0009603B00044E36000C5641000E4D4B0017676300FEFFFF0000282C000434
                  450000B5FF0000AFFF0000ABFF0000ADFF0000A4FF000A3E5C00009EFF00184C
                  6F00F8FCFF0009416E00093F6B00F4FAFF001891FF00007FFF000083FF00027B
                  ED0002284E00146DC400103D68000079FF000A80FF000075FF00006DF000093C
                  7900006DFF003C8EFE00004EC1000B50B70009398100DCEAFE002B7DFE002F80
                  FF00005FFF000050DE000045BD000326660006399500063990000C295D00347F
                  FF006CA3FF0095BCFF00D9E7FF00EEF4FF00075CFF00BDD3FF000051FE00004B
                  EF00011B51000538A500104ACB004B649D00032576002062FF00001653000131
                  B00001195E0001185A00032DA50031488900CCDAFF00003CFF0001185C000219
                  5E00041B6200506BBB0083A1FE000136F300021860000E2A87007996FE006884
                  FC00758CF600525F9F000228FF003652F6004859BC00505DA700001FFF00243F
                  F4000E1859002E42C200272D55000017F2000016E600051DDD00283CE100283C
                  DC003343DA00394ADD007078B5000011D400041AF4000617D7000C1CD000000F
                  F200000DE700000CDA00000CD300000CCF00000ABC000009B700000AB6000006
                  5B00010ED4000211DA000007D4000008CF000006CA000005C5000007C4000005
                  BF000005BB000007B7000006B50000049A00161DAC002F32A000393DA9009293
                  B5000004CC000003BD000002B8000003B8000003B7000002B5000002B1000003
                  AF000000AD000002AD000000A7000000A5000000A10000009D0000039C000001
                  990000039900000098000000900000008E000000870000008200000258000105
                  B80004048200131397005F5FA0006D6DA6008989AD00FFFFFF00000000000C0C
                  0C0C0C0C0C0C0CCED3CF0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C72CD
                  C9C1CFCF0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C1552CBCAA89D96CFCF0C0C
                  0C0C0C0C0C0C0C0C0C0C0C0C151D4CC7C8A79D95908571630C0C0C0C0C0C0C0C
                  0C0CCD68291C4BC6C8A8A5A29177704F51790C0C0C0C0C0C0CCFCC7B282059C4
                  CAB4A08A7E6A705544640C0C0C0C0C0C0CCFCB8025205EC3B5BF9AD73F6D5B5A
                  46640C0C0C0C0C0C0CCFC78025205EC0B5B39F8D887E6F56465C0C0C0C0C0C0C
                  0CCFC580251F67BECAA7AA91846C084E485C0C0C0C0C0C0C0CCFC280251E67B1
                  B5BE995F3FD76C56465C0C0C0C0C0C0C0CCFC080241E66B1CABF9BD75F6B6157
                  445C0C0C0C0C0C0C0CCFBC7A241E73B0B5BD984D6F696E4F455C0C0C0C0C0C0C
                  0CCFBB7A242173ADC8A6AB894A6D6A57445C0C0C0C0C0C0C0CCFAF8126267CD1
                  00B2A39E886B6055455C0C0C0C0C0C0C0CCFAF862A2C8703D5B6A4A18C7F6250
                  435C0C0C0C0C0C0C0CCFAE822A233E8F090F9C93977F6250425C0C0C0C0C0C0C
                  0CCFAC78191A1837498B0612B98E7458425C0C0C0C0C0C0C0CCFBAA92E2D2B1A
                  1838477504110B83535D0C0C0C0C0C0C0CCFB8B7653C343132171633417D020E
                  0E5C0C0C0C0C0C0C0CD2D51305B8763B3031322218273D92D00C0C0C0C0C0C0C
                  0C0CCFCFD60D078E5439302F2D1B14150C0C0C0C0C0C0C0C0C0C0C0CCFCF0112
                  109C493A36350C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0CCFCFD4100A94400C0C0C
                  0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0CCFCFCFCF0C0C0C0C0C0C0C0C0C0C}
                OnClick = SpeedButton7Click
              end
              inherited SpeedButton8: TSpeedButton
                Left = 349
                Hint = 'Consultar Movimentos dos Controles - [CXG071]'
                Glyph.Data = {
                  D6050000424DD605000000000000960300002800000018000000180000000100
                  08000000000040020000120B0000120B0000D8000000D800000000000000FFFF
                  FF00FF00FF00FFFEFE00A4787400986B6600A87D7800A97F7A00AA807B00A97F
                  7B00A97F7900AD837D00B2887E00BA8E8200B68B8000BE928300FCF9F800FBF8
                  F700C2968500CA9C8800C6998600CEA08900FAF6F400FFFDFC00D7A78C00D2A3
                  8A00DAA48200DEAD8E00DAAB8D00F8F2EE00FDFAF800FCF9F700FEF9F500F7EF
                  E800FCF5EF00F2E0CE00F4E6D800F5E9DD00F5ECE300FAF2EA00FCF6F000FEF9
                  F400FDF8F300FEFAF600FEFBF800FEFDFC00F2DEC800F8E6D200F3E3D200FAEF
                  E300FBF3EA00F5DEC200F3DDC400F8E7D200F8E9D800FAECDB00FBEFE100FAF0
                  E400FCF6EF00FEF9F300F3D9B600F4DBB900F4DCBC00F5DDBE00F5DEC000F6E0
                  C200F5DEC100F5DFC100F5DFC200F6E1C600F5E1C600F7E3C800F5E1C700F5E2
                  C800F7E3CA00F6E3C900F8E6CE00F6E4CC00F6E4CD00F9E9D400F7E7D200F8EA
                  D800FAECDA00F9ECDB00F9EDDD00FBEFE000FBF0E100FBF2E600FCF5EC00FCF6
                  EE00FEFBF700EFCD9A00EECC9900F0CF9F00F0CFA000F3D4A700F1D2A500F1D4
                  AA00F1D4AB00F4D9B200F2D7B000F2D7B100F4DAB600F3DAB600F5DCB800F3DA
                  B700F4DCB900F6DEBD00F4DCBB00F5DEBD00F6DFBF00F5E0C200F4DFC100F8E3
                  C600F7E3C700F6E3C800F8E6CD00F7E6CD00F8E7CF00F7E6CE00F9EAD400F8E9
                  D400FAEDDA00FAEDDB00FAF0E100FBF3E700FCF6ED00FDF8F100F0CE9800EECC
                  9700F0CF9A00F2D2A000F3D7AC00F3D8AD00F1D6AC00FCF7ED00FEFCF800FFFE
                  FC00FFFFFE00007F000000660000339933003385330012AB25001CB5380049C4
                  600020B9420025BE4C002AC2540055CE76002DC55C0030C9620033CB67005CD5
                  85007AFEFF0097FEFF009BFBFC00A8FFFF00A9FFFF00ADFFFF00AEFFFF00B4FF
                  FF00C7FFFF00D3FFFF00E4FFFF00F4FFFF00FCFFFF0072F9FE008CFBFE0091FC
                  FE00A0FCFE00B3FCFE006FF8FF0082F8FF0059EAFE00B6F6FF0049D5EE00BAEE
                  F60023D7FE004AC5DD006FE6FF008DE7FA00C6F5FF00E1F9FE00E3FAFF00F1FB
                  FD0036D9FE0030BCDD0063DAF500EBFBFF0011A7D20049C1E300AFE4F300129F
                  CB0020A2CB0044BADD00089DCF00078DBB000A82AF000DA2D4000C92C0000D81
                  AB000E80AA001385AF0035A7CD005CBEDF0092CEE4000682B6002692BF004A79
                  FF002E5FFF003F6EFF001C4DFF000033FF000B3EFF0000009A00020202020202
                  02020202020202020202CACACACACACA02020604040404040404040404040404
                  04C5B0B2BAB4B5C3CA020A34716E6863845F838280808085C5A8AEB2BAB4B5BF
                  C4CA072E4A443E676562605D5B818186C5A8AEB2BAB4B5BFC4CA07237649333E
                  696562605E5B8186C5A8AEB2BAB4B5BFC4CA07304F4E48423E3C6461605E5C86
                  C5ABAFB6B8BDB7C0CDCA0924528C8C8C8C8C3C64628C8C8EC5B1BBBEC1C2CCD0
                  CEC90825558C93908F8C3E3C658C9391C5B3AEB2BAB4B5BFCFC60B26578C9794
                  928C436C3C8C9795C5A8AEB2BAB4B5BFC4CA0C21588C9898968C48433E8C9899
                  C5A8AEB2BAB4B5BFC4CA0E1D7F8C8C8C8C8C4D46708C8C8EC5A8AEB2BAB4B5BF
                  C4CA0D168828278B5436504D48336C8DC5A9ADAC9A9BAABCC7CA0F118A2B228B
                  8B8B8B8B8B8B8B8DC5A6A5A3A19F9F9EA7CA12110189293A3231548B354E4642
                  4BC8B9A4A2A09D9CCB021411010117202827398B512F4D45404BC5C5C5C5C5C5
                  020213110101018920D7D7D7D7D74C736F6D6A66050202020202151F01010101
                  89D7D4D6D5D7784C47413F3D050202020202191F0101010101D7D3D2D4D77B4F
                  7472416B050202020202181F0101010101D7D1D1D3D77C374F75734105020202
                  02021C100101010101D7D7D7D7D77D56537877720502020202021B1E01010101
                  01010101172A597D3852794C0502020202021B1E0101010101010101012C2A7E
                  7D7C7A790502020202021B030101010101010101012D5A3B877D7C5305020202
                  02021A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A0202020202}
                OnClick = SpeedButton8Click
                ExplicitLeft = 349
              end
              inherited SpeedButton11: TSpeedButton
                Hint = 'Definir controles por empresa - [CXG123]'
                Glyph.Data = {
                  02060000424D0206000000000000C20300002800000018000000180000000100
                  08000000000040020000120B0000120B0000E3000000E300000000000000FFFF
                  FF00FF00FF00FFFEFF00A4676900A5686B00FFFEFE009365600093655E009263
                  5D009566600093655F00986963009E6E64008469640080676200A37266009D70
                  6500896A63009F6F6200A0706300A7756800986859009F6F6000AC796900A072
                  6400B17E6B00BB846E00B6816C00CB917300C58C7000C0896F00CF8E6800D498
                  7500CF967400FFFCFA00FFF8F300FFFBF800FFF4EB00FFFAF600FFEFE000FFF0
                  E200FFF0E300FFF2E600FFF4EA00FFF6EE00FFF8F200FECC9900FFCE9C00FECE
                  9D00FECF9F00FED1A300FFD5AA00FED4A900FED5AB00FED7AF00FFDAB500FEDA
                  B500FFDDBA00FFDEBC00FEDDBB00FFE3C700FFE5CB00FFE7CF00FEE6CE00FFEB
                  D800FFEEDE00FFF0E100FEEFE000FFF2E500FFF3E700FFF4E900FFF6ED00FFF7
                  EF00FFFBF700D5812700FECB9600FECC9700FECC9800FECE9900FECE9A00FECE
                  9C00FECF9D00FFD09F00FECF9E00FED09E00FED0A000FED3A300FFD4A500FED3
                  A400FED4A500FED4A600FED4A700FED5A700FED5A900FED5AA00FED7AB00FFD8
                  AD00FED7AD00FED8AD00FED8AF00FED8B000FFDAB200FED9B100FED9B200FEDA
                  B200FEDAB400FFDCB700FEDCB600FFDDB800FEDCB700FEDDB800FFDEBB00FEDD
                  BA00FFE0BD00FEDEBC00FEE0BF00FFE1C100FEE0C000FFE1C200FFE2C200FEE1
                  C100FFE3C500FEE2C400FFE3C600FEE3C500FEE3C600FEE3C700FFE5C900FFE5
                  CA00FEE5C900FFE6CB00FEE5CA00FFE6CC00FEE6CB00FEE6CC00FFE7CE00FFE9
                  D100FFEAD300FFEAD400FFEBD500FEEAD400FEEBD700FFEDD900FFEDDA00FFEE
                  DC00FFEFDD00FEEEDC00FFEFDE00FEEEDD00FFF0E000FEF0E100FFF3E600FEF2
                  E500FEF3E700FEF4E900FFF7EE00F8CE9C00FED9AF00FEE0BC00FEE0BD00FEE1
                  BF00FEE1C000FEE2C200FEE3C400FFE5C700FFE7CB00FEE6CA00FEE7CC00FEE9
                  CF00FEE9D000FEE9D100FEEAD300FEEBD400FEEBD500FFEDD700FFEDD800FEED
                  D900FFF0DE00FEEFDD00FFF2E200FFF3E500FFF4E700FEF3E600FFF6EB00FFF8
                  F000F6D3A700F8D9B100FEEAD100FFF2E100FEF2E300FFF6EA00FFF7ED00FFF8
                  EF00FEF7EE00FEF8F000FFFBF600EECE9E00F6E0C000F8E6CB00FEF6EB00FFFA
                  F300FEFAF400EED9B500FFFBF400FEFAF300FFFCF700FFFEFC00F7EEDA00EFE6
                  CF00FFFEFB00FFFEFA00FEFEFB00FFFFFE00AFB17400AFBA8400AFC49700648E
                  43005484370064934C0054893E0064995600548F470032772500327A2900327D
                  2E00008100000202020904040404040404040404040404040404040402020202
                  02086B386764605D5A57563231504E4C4C4C4C1702020202020B736F38686460
                  5F5B59565452514F4D4C4C1702020202020B75A0716C6965635F5C5933E25230
                  4F4E4D1702020202020B7A7972706E6A67613635E2E2E255522F4E1702020202
                  0207817E4B4B4B4B4B4B64E2DFD9E2DA5451501702020202020A883EA57B769F
                  3A6C66E2BA34D6E2E29D521702020202020C8AA98582A479A0706C6A676236C5
                  E2E2531702020202020D41ADAA40847E77743B6E396737603558331702020202
                  021093B08DAB88867C7BA2736DE2689E605E5B170202020202159695B18C893F
                  863DA479E2E2E26665635F1302020202021845B44B4B4B4B4B4B80E2E0DBE2DC
                  3967621402020202021A472B294491418BABA8E2C6A3D7E2E2BB671902020202
                  021CC02C46B444918F8CBC3FA73D78CBE2E26C1102020202021BC1C2C8469943
                  428F8EACA987A57D79A03C1202020202021FC92E9CBFB6B7BD9490AF8BE2A882
                  7C77A10F02020202021ECECA2E494847982AB293E2E2E288837F780E02020202
                  021D23254B4B4B4B4B4BBEE2E1DDE2DE3F83A516020202020222CFD22527CDB9
                  2D269AE2D094D8E2E2C7A60502020202022103CFD325C4C92EC1B847B5B428D1
                  E2E2AA0E020202020221010106D2234ACC2E49B89B98BE9692B1AE0E02020202
                  0221010101D5D2D425CC24C39C2CB69997B3900E020202020220202020202020
                  20202020202020202020200E0202020202020202020202020202020202020202
                  020202020202}
                OnClick = SpeedButton11Click
              end
              inherited SpeedButton12: TSpeedButton
                Left = 577
                Hint = 'Consulta de Taxas de E-Commerce - [CXG126]'
                Glyph.Data = {
                  360C0000424D360C000000000000360000002800000020000000200000000100
                  180000000000000C0000C40E0000C40E00000000000000000000FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FF8E8E8E0F0F0F000000545454FF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFD9D9D92929290000002A2A2ADBDBDBFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FF828282000000000000000000000000141414FF00
                  FFFF00FFFF00FFFF00FFFF00FFEDEDED000000000000000000000000000000EE
                  EEEEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FF000000000000A1A1A1FF00FF000000000000D9D9
                  D9FF00FFFF00FFFF00FFFF00FF6868680000003F3F3FFF00FF3D3D3D00000067
                  6767FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FF000000000000FF00FFFF00FF040404000000E6E6
                  E6FF00FFFF00FFFF00FFFF00FF7070700000006D6D6DFF00FF6C6C6C0000005C
                  5C5CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FF5151510000000000000000000000000000000E0E
                  0E080808070707070707090909080808000000000000040404000000000000C9
                  C9C9FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FF2C2C2C0000000000000000000000000000
                  000000000000000000000000000000000000000000000000000000008C8C8CFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFEFEFEFFFFFFDEDEDEBCBCBCBFBFBFBFBFBFBFBF
                  BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBEBEBEBEBEBEF8F8F8FF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FF4141410000000000000000000000000000000000
                  00000000000000000000000000000000000000000000000000000000000000BA
                  BABAFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FF0000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000088
                  8888FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FF000000000000FF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF99999900000000
                  00005D5D5DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FF979797000000313131FF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00000000
                  00000000000000006E6E6EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FF454545000000848484FF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00000000
                  0000060606000000000000181818FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FF000000000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF01010100
                  0000000000D8D8D80303030000000F0F0FFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFE3E3E3000000000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF3F3F3F00
                  00000000001E1E1E000000000000000000464646FF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FF909090000000383838FF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7D7D7D00
                  00000000000000000000003E3E3E000000000000FF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FF3E3E3E0000009E9E9EFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCACACA00
                  0000000000000000FF00FFFF00FF6E6E6E000000181818FF00FFFF00FFFF00FF
                  FF00FFFF00FF0000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000B9B9B9FF00FFFF00FF000000000000FF00FFFF00FFFF00FF
                  FF00FFDFDFDF0000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000828282FF00FFFF00FF424242000000939393FF00FFFF00FF
                  FF00FF7F7F7F0000003F3F3FFF00FFFF00FF7F7F7F000000676767FF00FFFF00
                  FFA5A5A5000000515151FF00FFFF00FFFF00FF000000000000FF00FFFF00FFFF
                  00FF878787000000676767FFFFFFFFFFFFA1A1A10000005B5B5B212121000000
                  000000000000000000929292FF00FFFF00FF5959590000001212122626262626
                  261111110000000B0B0B27272723232328282800000000000023232324242426
                  26261515150000000909092323232222221919190000003F3F3F323232000000
                  000000000000000000E3E3E3FF00FFFF00FF5252520000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000383838FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF656565000000555555C6C6C6C4C4
                  C46464640000003C3C3CC8C8C8BABABACCCCCC000000000000B3B3B3BDBDBDC4
                  C4C4656565000000404040C7C7C7C3C3C37A7A7A000000484848FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9494940000003F3F3FFF00FFFF00
                  FFA9A9A90000003C3C3CFF00FFFF00FFFF00FF000000000000FF00FFFF00FFFF
                  00FF737373000000717171FF00FFFF00FF787878000000737373FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE6E6E6000000000000FF00FFFF00
                  FFCDCDCD000000080808FF00FFFF00FFFF00FF000000000000FF00FFFF00FFFF
                  00FF3F3F3F000000989898FF00FFFF00FF0C0C0C000000B8B8B8FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0B0B0B000000969696FF00
                  FFFF00FF000000000000AEAEAE7777775E5E5E0000000000005050506F6F6FB1
                  B1B1050505000000E7E7E7FF00FFD0D0D0000000000000FF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9D9D9D000000000000EDED
                  ED69696900000000000000000000000000000000000000000000000000000000
                  0000000000000000515151E9E9E9171717000000656565FF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0B0B0B0000000000
                  0000000000000000000004040471717196969600000000000087878778787819
                  1919000000000000000000000000000000000000FF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFF1F1F10000000000
                  00000000D0D0D0000000000000FF00FFFF00FF000000000000FF00FFFF00FF00
                  0000000000BEBEBE111111000000000000C5C5C5FF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCFCFCF0000
                  000000002323232E2E2E000000111111FF00FF000000000000FF00FF40404000
                  00001010104242420000000000009D9D9DFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE0E0
                  E000000000000000000000000000000034343402020200000043434300000000
                  0000000000000000000000B9B9B9FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FF64646400000000000000000000000000000000000000000000000000
                  0000000000464646FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFA2A2A25252522121210606060202021C1C1C47474791
                  9191FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                OnClick = SpeedButton12Click
                ExplicitLeft = 577
              end
              inherited SpeedButton23: TSpeedButton
                Left = 520
                Hint = 
                  'Adicionar/Remover controle para vendas em todos clientes - [CXG1' +
                  '31]'
                Glyph.Data = {
                  76060000424D7606000000000000360400002800000018000000180000000100
                  08000000000040020000E30E0000E30E00000001000000000000107B10001084
                  100021A52100298C2900299C290029AD2900398C3100319C310031AD31004284
                  390039943900399C390039B53900527342004A8C42004A9C42004AA5420042BD
                  420042CE420018734A00528C4A0052A54A004ABD4A00296B520052B5520052C6
                  5200736B5A005AC65A00428463006B84630063A5630063BD630063CE6300315A
                  6B0073B56B006BCE6B0073AD730073CE730094B57B0084BD7B008CBD7B007BCE
                  7B007BD67B00316B840084B58400085A8C0039738C009CB58C008CBD8C009CDE
                  8C0039739400106B9C00216B9C005A849C0063849C00216BA5002173A500B5E7
                  A500297BAD003984AD00428CAD004A8CAD00107BB500217BB500428CB5004A94
                  B500217BBD004294BD005294BD00529CBD006BA5BD00D6E7BD00187BC6002184
                  C6002984C600298CC600318CC600428CC6003994C6004294C6004A94C60063A5
                  C6006BA5C600BDC6C600298CCE00398CCE002994CE00E7DECE00D6E7CE006BAD
                  D6003194DE005AADDE00218CE700298CE7004A9CE70073BDE7008CBDE7009CCE
                  E700ADCEE7002994EF0042A5EF004AB5EF007BBDEF00F7FFEF002994F700319C
                  F700399CF70042A5F70063ADF70052B5F700FF00FF003194FF00399CFF0042A5
                  FF004AADFF004AB5FF0052B5FF004ABDFF006BBDFF006BC6FF008CF7FF009CF7
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
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF006E6E6E6E6E6E
                  6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E
                  6E6E6E6E6E6E6E6E6E6E6E6E6E1D0D0707070707072D1B091A0A0A6E6E6E6E6E
                  6E6E6E6E240112021111111100621B1B1B1B1B0A6E6E6E6E6E6E6E6E03120811
                  1619310B281B1B1B1B1B1B1B0A6E6E6E6E6E6E6E0A050C161B311822471B1B1B
                  1B1B1B1B0A6E6E6E6E6E6E6E3004161B23391E676727391B1B1B1B096E6E6E6E
                  6E6E6E6E6E0616203915587A7A2C31251B1B096E6E6E6E6E6E6E6E6E6E6E0618
                  0F2F53535726292A18096E6E6E6E6E6E6E6E6E6E6E6E6E0E133B42423C1C1F0B
                  146E6E6E6E6E6E6E6E6E6E6E6E6E6E35485C5D5D5C3E176E6E6E6E6E6E6E6E6E
                  6E6E6E6E6E6E6E4263686F6F6963346E6E6E6E6E6E6E6E6E6E6E6E6E6E6E3A63
                  7070707070705D336E6E6E6E6E6E6E6E6E6E6E6E6E6E49707171717171716A21
                  6E6E6E6E6E6E6E6E6E6E6E6E6E366A717272767672726B2B6E6E6E6E6E6E6E6E
                  6E6E6E6E6E526B7273767476747672326E6E6E6E6E6E6E6E6E6E6E6E6E446474
                  7777776D656D6D2E6E6E6E6E6E6E6E6E6E6E6E6E6E513F545A5A494B4C4A5633
                  6E6E6E6E6E6E6E6E6E6E6E6E6E36384D5059666C5E55376E6E6E6E6E6E6E6E6E
                  6E6E6E6E6E6E384C5960605F5B4E336E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E40
                  4F59616043336E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E4641453D366E6E6E
                  6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E
                  6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E}
                OnClick = SpeedButton23Click
                ExplicitLeft = 520
              end
              inherited SpeedButton24: TSpeedButton
                Hint = 'Copiar Controle - [CXG147]'
                Glyph.Data = {
                  F6060000424DF606000000000000360000002800000018000000180000000100
                  180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF8E5D598E5D598E5D598E5D598E5D
                  598E5D598E5D598E5D598E5D598E5D598E5D598E5D598E5D598E5D59734241FF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF8E5D59FFDEBD
                  FED9B4FFD4ABFFCFA1FFCB9AFEC993FFC58CFFC287FFBF82FFBF81FFBF81FFBF
                  81FFBF81734241FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FF8E5D59FEE3C9FFE0C0FFDAB6FED7ADFED1A5FECE9DFFCA96FFC58FFFC289
                  FFC083FFBF81FFBF81FFBF81734241FF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FF91605AFEEAD7FEE5CCFFE1C2FFDCBAFED7B0FFD3A7FF
                  CF9FFFCA98FFC790FFC48AFFC186FFBF81FFBF81734241FF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF96655CFEEFE1FEEBD9DD903DDD90
                  3DDD903DDD903DDD903DDD903DDD903DDD903DDD903DFFC287FFC082734241FF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9C695EFFF4ED
                  FFF2E3FFEEDCFFE9D3FEE5C9FFDEC0FEDAB7FFD5ADFED1A5FECC9CFFC995FFC5
                  8FFFC488734241FF00FFFF00FF8E5D598E5D598E5D598E5D598E5D598E5D598E
                  5D59A16E60FEFAF6FEF7EFFEF3E7FEEEE0FEEAD5FEE5CCFEE1C2FFDCBAFED7B1
                  FFD3A7FFCF9FFFCB97FFC791734241FF00FFFF00FF8E5D59FFDEBDFED9B4FFD4
                  ABFFCFA1FFCB9AFEC993A97563FEFEFCFEFAF7DD903DDD903DDD903DDD903DDD
                  903DDD903DDD903DDD903DDD903DFFD0A3FFCC9A734241FF00FFFF00FF8E5D59
                  FEE3C9FFE0C0FFDAB6FED7ADFED1A5FECE9DB07B66FEFEFEFEFEFEFEFBF8FFF8
                  F3FEF4EDFEF0E3FEEDDCFEE9D3FEE5C9FEE0C0FFDCB6FFD5ADFFD1A5734241FF
                  00FFFF00FF91605AFEEAD7FEE5CCFFE1C2FFDCBAFED7B0FFD3A7B88269FEFEFE
                  FEFEFEFEFEFEFEFCFBFEFAF6FEF6EEFEF3E7FEEFDEFFEAD5FEE6CCFEE1C4FEDC
                  BAFED8B0734241FF00FFFF00FF96655CFEEFE1FEEBD9DD903DDD903DDD903DDD
                  903DC1896CFEFEFEFEFEFEDD903DDD903DDD903DDD903DDD903DDD903DDD903D
                  DD903DDD903DFEE3C6FFDEBD734241FF00FFFF00FF9C695EFFF4EDFFF2E3FFEE
                  DCFFE9D3FEE5C9FFDEC0C9906EFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
                  FBF8FEFAF3FEF4EDFEF0E5FEEDDCFEE9D3FFE3C9734241FF00FFFF00FFA16E60
                  FEFAF6FEF7EFFEF3E7FEEEE0FEEAD5FEE5CCD09672FEFEFEFEFEFEFEFEFEFEFE
                  FEFEFEFEFEFEFEFEFEFEFEFCFBF2EEEAD1CFCAC1BFBAA6A5A1969292734241FF
                  00FFFF00FFA97563FEFEFCFEFAF7DD903DDD903DDD903DDD903DD79C74FEFEFE
                  FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFBFAFA9C64599C64599C64
                  599D6559A0675BFF00FFFF00FFB07B66FEFEFEFEFEFEFEFBF8FFF8F3FEF4EDFE
                  F0E3DCA175FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
                  A0675BD9995CE79740DC832AA5686BFF00FFFF00FFB88269FEFEFEFEFEFEFEFE
                  FEFEFCFBFEFAF6FEF6EEE1A577FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
                  FEFEFEFEFEFEFEFEA0675BEEB164EB9E43DC832AFF00FFFF00FFFF00FFC1896C
                  FEFEFEFEFEFEDD903DDD903DDD903DDD903DE3A777FEFEFEFEFEFEFEFEFEFEFE
                  FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEA0675BD99F64EB9E43FF00FFFF00FFFF
                  00FFFF00FFC9906EFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEE1A577D1926D
                  D1926DD1926DD1926DD1926DD1926DD1926DD1926DD1926DA0675BD99F64FF00
                  FFFF00FFFF00FFFF00FFFF00FFD09672FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
                  FEFEFEFEFEFEFCFBF2EEEAD1CFCAC1BFBAA6A5A1969292734241FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD79C74FEFEFEFEFEFEFEFE
                  FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFBFAFA9C64599C64599C64599D6559A0
                  675BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDCA175
                  FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEA0675BD999
                  5CE79740DC832AA5686BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFE1A577FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
                  FEFEFEA0675BEEB164EB9E43DC832AFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFE3A777FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
                  FEFEFEFEFEFEFEFEFEFEFEA0675BD99F64EB9E43FF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE1A577D1926DD1926DD192
                  6DD1926DD1926DD1926DD1926DD1926DD1926DA0675BD99F64FF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                OnClick = SpeedButton24Click
              end
              inherited SpeedButton25: TSpeedButton
                Left = 235
                Hint = 'Ver registros da lixeira - [CXG007]'
                OnClick = SpeedButton25Click
                ExplicitLeft = 235
              end
              inherited SpeedButton26: TSpeedButton
                Visible = False
              end
            end
            inherited GroupBox2: TGroupBox
              Height = 438
              ExplicitHeight = 438
              inherited ScrollBox2: TScrollBox
                Height = 421
                ExplicitHeight = 421
              end
            end
          end
        end
        inherited tsMemo: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 866
          ExplicitHeight = 572
        end
        object TsSaldoCTrl: TTabSheet
          Caption = 'SaldoControles'
          ImageIndex = 3
          object Panel4: TPanel
            Left = 0
            Top = 0
            Width = 866
            Height = 41
            Align = alTop
            BevelKind = bkTile
            BevelOuter = bvNone
            Caption = 'VISUALIZA'#199#195'O DO CONTROLE:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -19
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object Panel5: TPanel
            Left = 0
            Top = 41
            Width = 866
            Height = 433
            Align = alTop
            TabOrder = 1
            object DBGrid4: TDBGrid
              Left = 1
              Top = 1
              Width = 864
              Height = 431
              Align = alClient
              DataSource = DtSaldoCtrl
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
            end
          end
          object Panel6: TPanel
            Left = 0
            Top = 474
            Width = 866
            Height = 41
            Align = alTop
            BevelKind = bkTile
            BevelOuter = bvNone
            TabOrder = 2
            object BitBtn9: TBitBtn
              Left = 336
              Top = 6
              Width = 107
              Height = 25
              Caption = 'OK'
              Default = True
              TabOrder = 0
              OnClick = BitBtn9Click
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
          end
        end
        object tsDefinirControlePorEmpresa: TTabSheet
          Caption = 'Definir Controles Por Empresa'
          ImageIndex = 4
          object pnDefinirControlePorEmpresa: TPanel
            Left = 16
            Top = 32
            Width = 704
            Height = 286
            BevelOuter = bvSpace
            TabOrder = 0
            object Panel12: TPanel
              Left = 1
              Top = 1
              Width = 702
              Height = 41
              Align = alTop
              BevelKind = bkTile
              BevelOuter = bvNone
              Caption = 'DEFINIR CONTROLES POR EMPRESA'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -19
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
            object pnDefinirControlePorEmpresaBottom: TPanel
              Left = 1
              Top = 253
              Width = 702
              Height = 32
              Align = alBottom
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 1
              object btnMultiempresaOK: TBitBtn
                Left = 271
                Top = 2
                Width = 75
                Height = 25
                Hint = 'OK - [BAS515/BAS516]'
                Caption = '&OK'
                TabOrder = 0
                OnClick = btnMultiempresaOKClick
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
              object btnMultiempresaCancelar: TBitBtn
                Left = 352
                Top = 2
                Width = 75
                Height = 25
                Hint = 'Cancelar'
                Caption = '&Cancela'
                TabOrder = 1
                OnClick = btnMultiempresaCancelarClick
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
            object pnDefinirControlePorEmpresaTop: TPanel
              Left = 1
              Top = 42
              Width = 702
              Height = 31
              Align = alTop
              BevelOuter = bvNone
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
              object btSelectAllDefControleEmpresa: TSpeedButton
                Left = 643
                Top = 6
                Width = 23
                Height = 21
                Hint = 'Selecionar todos'
                Flat = True
                Glyph.Data = {
                  CE010000424DCE01000000000000CE0000002800000010000000100000000100
                  08000000000000010000120B0000120B0000260000002600000000000000FFFF
                  FF00FF00FF00A4262600BA414100BB444400BD4A4A00BD4B4B00BF4E4E00C050
                  5000C0515100C1535300C1545400C55C5C00CB6C6C00CF777700D17D7D00D483
                  8300004B0000098611000C9C19000A8615000C9518000D931A000F9E1C000F99
                  1C000E9D1D000F9D1E0011A4220011A02100139224001CB135001CA1340024BC
                  430029B548002EC6520035CA5E0039D465000202020202020202020202020202
                  0202020202020202020202020202020202020202020202021212020202020202
                  0202020202020212181B120202020202020202020202121F1C141D1202020202
                  02020202021223211E12171A1202020202020202122425201202121519120202
                  02020202021222120A03020212161202020202020203120C080B030202121312
                  02020202030F0E0803070903020202121202020310110D030203050803020202
                  12120202030E0302020202030603020202020202020302020202020203040302
                  0202020202020202020202020202030302020202020202020202020202020203
                  030202020202020202020202020202020202}
                ParentShowHint = False
                ShowHint = True
                OnClick = btSelectAllDefControleEmpresaClick
              end
              object btUnSelectAllDefControleEmpresa: TSpeedButton
                Left = 672
                Top = 6
                Width = 23
                Height = 21
                Hint = 'Desfazer sele'#231#227'o'
                Flat = True
                Glyph.Data = {
                  AA010000424DAA01000000000000AA0000002800000010000000100000000100
                  08000000000000010000120B0000120B00001D0000001D00000000000000FFFF
                  FF00FF00FF00CACACA00C4C4C400BFBFBF00BCBCBC00B8B8B800B5B5B500AEAE
                  AE00ABABAB00A5A5A500A4A4A4009F9F9F009E9E9E009D9D9D009C9C9C009B9B
                  9B009A9A9A009999990098989800979797009494940093939300929292008C8C
                  8C008A8A8A007A7A7A0065656500020202020202020202020202020202020202
                  02020202020202020202020202020202020202021C1C02020202020202020202
                  0202021C12121C02020202020202020202021C0A0E15101C0202020202020202
                  021C0508141C16131C020202020202021C04030B1C021C19141C020202020202
                  021C081C0F1B02021C171C0202020202021B1C0D110E1B02021C1A1C02020202
                  1B0809111B13101B0202021C1C02021B07060C1B021B16111B0202021C1C0202
                  1B091B020202021B141B020202020202021B0202020202021B181B0202020202
                  020202020202020202021B1B0202020202020202020202020202021B1B020202
                  0202020202020202020202020202}
                ParentShowHint = False
                ShowHint = True
                OnClick = btUnSelectAllDefControleEmpresaClick
              end
            end
            object DBGridDefinirControlePorEmpresa: TDBGrid
              Left = 1
              Top = 73
              Width = 702
              Height = 180
              Align = alClient
              DataSource = DtmCadBasicosCx.dsEmpresaDefControle
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
              TabOrder = 3
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
              OnCellClick = DBGridDefinirControlePorEmpresaCellClick
              OnDrawColumnCell = DBGridDefinirControlePorEmpresaDrawColumnCell
              OnKeyDown = DBGridDefinirControlePorEmpresaKeyDown
              Columns = <
                item
                  Expanded = False
                  FieldName = 'SEL'
                  Title.Caption = 'Sel'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'COD_EMPRESA'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'IDENTIFICACAO_EMP'
                  Visible = True
                end>
            end
          end
        end
        object tsTaxaEcommerce: TTabSheet
          Caption = 'E-Commerce'
          ImageIndex = 5
          object pnTaxasConsulta: TPanel
            Left = 2
            Top = 334
            Width = 778
            Height = 194
            BevelKind = bkTile
            BevelOuter = bvNone
            Caption = 'pnTaxasConsulta'
            TabOrder = 1
            object pnTaxaNomeControle2: TPanel
              Left = 0
              Top = 0
              Width = 774
              Height = 23
              Align = alTop
              BevelKind = bkTile
              BevelOuter = bvNone
              Caption = 'pnTaxaNomeControle'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 0
            end
            object pnTaxasConsultaButtom: TPanel
              Left = 0
              Top = 149
              Width = 774
              Height = 41
              Align = alBottom
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 2
              object pnTaxasConsultaAlterar: TBitBtn
                Left = 347
                Top = 6
                Width = 75
                Height = 25
                Hint = 'Editar Registro - [CXG128]'
                Caption = 'Alterar'
                TabOrder = 0
                OnClick = pnTaxasConsultaAlterarClick
                Glyph.Data = {
                  36050000424D3605000000000000360400002800000010000000100000000100
                  08000000000000010000420B0000420B00000001000000010000000000000084
                  0000210021005A4A29004A3939005A5242004A4A4A005A524A0073524A005A52
                  52006300630073737300BD847B00C6947B00CE9C7B00B58484009C948400BD94
                  9400EFCE9400F7CE9400C6A59C00EFCE9C00F7CE9C00F7D69C00C6ADA500CEAD
                  A500F7D6A500C6ADAD00CEB5AD00D6B5AD00EFD6AD00F7D6AD00C6B5B500D6BD
                  B500DEBDB500DEC6B500E7C6B500EFC6B500EFCEB500F7D6B500F7DEB500D6C6
                  BD00DECEBD00EFCEBD00F7DEBD0000C6C600C6C6C600D6CEC600F7DEC600F7E7
                  C600E7CECE00E7D6CE00F7E7CE00E7D6D600F7E7D600FFE7D600FFEFD600FFEF
                  DE00FFEFE700FFF7E70021F7EF00FFF7EF0018F7F700FFF7F700FFFFF700FF00
                  FF0000FFFF0021FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0041410F0F0F0F
                  0F0F0F0F0F0F0F0F0F4141411438312C281E1A15121212170F41414114382E2E
                  2E2E2E2E2E2E2E150F414141183A3634302C1E15151512150F414141183B3634
                  31302805151515120F4141411C402E2E2E2E2E06002E2E150F4141411D443D3A
                  363431070000291E0F41414121443F3D39363407422D00290F41414121442E2E
                  2E2E2E0B3E2D002911414141224444443F3A393609422D001B41414123444444
                  443F3A3910432D002041414124442E2E2E2E2E2E3604422D0041414124444444
                  4444444032083C2D004141412B44444444444444330D030001004141243F3D3D
                  3D3D3D3D320D0801010241412426262626242426210C410A0A41}
              end
              object pnTaxasConsultaNovo: TBitBtn
                Left = 266
                Top = 6
                Width = 75
                Height = 25
                Hint = 'Novo Registro - [CXG127]'
                Caption = 'Novo '
                TabOrder = 1
                OnClick = pnTaxasConsultaNovoClick
                Glyph.Data = {
                  36050000424D3605000000000000360400002800000010000000100000000100
                  08000000000000010000420B0000420B00000001000000010000B5847300AD73
                  8400B5848400B58C8400B5948C00D6BDB500C6C6C600EFD6C600CECECE00D6D6
                  D600DEDEDE00E7E7E700EFEFEF0042B5F7008CD6F700B5DEF700F7F7F700FF00
                  FF003184FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00111111111111
                  1111111111111111111111111101020202020202020202020211111111011313
                  1313131313131313021111111101131313131313131313130211111111011313
                  1313131313131313021111111101131313131313131313130211111111011313
                  1313131313131313021111111101131313131313131313130211111111011313
                  13131313131313130211111112121210101010101010101002111111120D120C
                  0C0C0C0C0C0C0C0C02111212120D1212120B0B0B0B0004030211120E0F0F0F0E
                  120A0A0A0600131302111212120F1212120909090600130211111111120F1208
                  0808080806000211111111111212120707070707050011111111}
              end
              object pnTaxasConsultaDeletar: TBitBtn
                Left = 428
                Top = 6
                Width = 75
                Height = 25
                Hint = 'Excluir Registro - [CXG129]'
                Caption = 'Excluir'
                TabOrder = 2
                OnClick = pnTaxasConsultaDeletarClick
                Glyph.Data = {
                  36050000424D3605000000000000360400002800000010000000100000000100
                  08000000000000010000220B0000220B000000010000000100000031DE000031
                  E7000031EF000031F700FF00FF000031FF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00040404040404
                  0404040404040404000004000004040404040404040404000004040000000404
                  0404040404040000040404000000000404040404040000040404040402000000
                  0404040400000404040404040404000000040000000404040404040404040400
                  0101010004040404040404040404040401010204040404040404040404040400
                  0201020304040404040404040404030201040403030404040404040404050203
                  0404040405030404040404040303050404040404040303040404040303030404
                  0404040404040403040403030304040404040404040404040404030304040404
                  0404040404040404040404040404040404040404040404040404}
              end
              object pnTaxasConsultaCancel: TBitBtn
                Left = 688
                Top = 6
                Width = 75
                Height = 25
                Caption = 'Sair'
                ModalResult = 2
                TabOrder = 3
                OnClick = pnTaxasConsultaCancelClick
                Glyph.Data = {
                  2E020000424D2E020000000000002E0100002800000010000000100000000100
                  08000000000000010000120B0000120B00003E0000003E00000000000000FFFF
                  FF00FF00FF00BB410000BB420000FFF6EF00E69C5900E69D5900E9A36200FFF4
                  EA00FFF8F200FECA9500FFCE9C00FFD4A900FEEBD800FEF0E200FFF2E500FFF3
                  E700FFFBF700FECE9C00FED3A500FED5AA00FEDAB400FFDCB600FEDDB800FEDD
                  BA00FFE3C500FEE2C400FFE5C900FFE6CA00FEE5CA00FFEBD500FEF3E700FFDA
                  AD00FFEAD100FFFAF400FFD8A700FFD9A900FFDAAB00FFE1B800FFE7C700FEEE
                  D900FFFBF600FFDCAC00FFE1B500FFE7C400FFEFD700FFEAC200FFFAEA00FFFE
                  FB00FFFFFA00FFFFFE00315EFF002A56FF00123BFF00153DFF001841FF001A44
                  FF001D47FF00072BFF00001EFF00000D66000202020202020202020202020202
                  0202020202020202020202020202020202020204040404040404040404040402
                  020202040132302E28272125242F04020202020401050F221B1614130B260402
                  0202020401310A101F1A170D0C2B04020202020401013323110E1C18152C0402
                  02020204010101332A20291D192D040202020204010101010112093D1E2E043D
                  020202040101010101013D363D013D3C3D020204080606060606073D373D3B3D
                  0202020203040404040404043D383D0202020202020202020202023D353D393D
                  020202020202020202023D343D023D3A3D020202020202020202023D0202023D
                  020202020202020202020202020202020202}
              end
            end
            object DBGridTaxaConsulta: TDBGrid
              Left = 0
              Top = 53
              Width = 774
              Height = 96
              Align = alClient
              DataSource = DtmCadBasicosCx.dsTaxaEcommerce
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
              TabOrder = 3
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
              Columns = <
                item
                  Expanded = False
                  FieldName = 'VALOR_DE'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'VALOR_ATE'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'PARCELAS_DE'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'PARCELAS_ATE'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'HAB_TAXA_PROD'
                  Visible = False
                end
                item
                  Expanded = False
                  FieldName = 'TAXA_PROD'
                  Title.Caption = 'Comiss'#227'o sobre valor dos produtos  (%)'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'HAB_TAXA_FRETE'
                  Visible = False
                end
                item
                  Expanded = False
                  FieldName = 'TAXA_FRETE'
                  Title.Caption = 'Comiss'#227'o sobre valor do frete (%)'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'HAB_TAXA_POR_PEDIDO'
                  Title.Caption = 'Usar taxa adicional por pedido'
                  Visible = False
                end
                item
                  Expanded = False
                  FieldName = 'VL_TAXA_POR_PEDIDO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'HAB_TAXA_POR_ITEM'
                  Visible = False
                end
                item
                  Expanded = False
                  FieldName = 'VL_TAXA_POR_ITEM'
                  Title.Caption = 'Taxa por item (R$)'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'HAB_TAXA_POR_UNIDADE'
                  Visible = False
                end
                item
                  Expanded = False
                  FieldName = 'VL_TAXA_POR_UNIDADE'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'FRETE_CONTA_SMART_PLACE'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CONS_FRETE_REGRA'
                  Visible = True
                end>
            end
            object pnEmpUnif: TPanel
              Left = 0
              Top = 23
              Width = 774
              Height = 30
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 1
              object lbEmpUnif: TLabel
                Left = 33
                Top = 7
                Width = 48
                Height = 13
                Alignment = taRightJustify
                Caption = 'Unificada:'
              end
              object DBLookupComboBoxEmpUnif: TDBLookupComboBox
                Left = 164
                Top = 4
                Width = 380
                Height = 21
                Hint = 'Empresa Unificada'
                KeyField = 'COD_EMPRESA'
                ListField = 'IDENTIFICACAO_EMP'
                ListSource = DtmCadBasicosCx.dsEmpresasUnificadas
                TabOrder = 1
                OnExit = DBLookupComboBoxEmpUnifExit
              end
              object EditHwEmpUnif: TEditHw
                Left = 87
                Top = 4
                Width = 71
                Height = 21
                TabOrder = 0
                Text = '0'
                OnExit = EditHwEmpUnifExit
                Formato = fInteger
                FormatSize = '0.2'
              end
            end
          end
          object pnTaxasCadastro: TPanel
            Left = 2
            Top = 5
            Width = 778
            Height = 469
            BevelKind = bkTile
            BevelOuter = bvNone
            BorderWidth = 8
            TabOrder = 0
            Visible = False
            OnEnter = pnTaxasCadastroEnter
            object pnTaxaNomeControle: TPanel
              Left = 8
              Top = 8
              Width = 758
              Height = 27
              Align = alTop
              BevelKind = bkTile
              BevelOuter = bvNone
              Caption = 'pnTaxaNomeControle'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 0
            end
            object Panel13: TPanel
              Left = 8
              Top = 421
              Width = 758
              Height = 36
              Align = alBottom
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 1
              object pnTaxasCadastroCancel: TBitBtn
                Left = 358
                Top = 4
                Width = 75
                Height = 25
                Hint = 'Cancelar Registro'
                Caption = 'Cancelar'
                ModalResult = 2
                TabOrder = 1
                OnClick = pnTaxasCadastroCancelClick
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
              object pnTaxasCadastroOK: TBitBtn
                Left = 277
                Top = 4
                Width = 75
                Height = 25
                Hint = 'Salvar Registro - [CXG130]'
                Caption = 'Salvar'
                TabOrder = 0
                OnClick = pnTaxasCadastroOKClick
                Glyph.Data = {
                  36050000424D3605000000000000360400002800000010000000100000000100
                  08000000000000010000220B0000220B00000001000000010000942929009431
                  31009C3131009C393900A53939009C4242009C4A4A00A54A4A00B54A4A00AD52
                  4A00B5524A00A5525200AD525200B5525200B55A5200AD525A00AD5A5A00B55A
                  5A00BD5A5A00C65A5A00CE5A5A00CE636300CE6B6B00D66B6B00B5737300BD7B
                  73009C7B7B009C848400AD848400B5848400C6848400AD8C8C00B58C8C00C694
                  8C00AD949400C6949400A59C9C00B59C9C00D69C9C00BDA5A500D6A5A500D6AD
                  A500CEADAD00D6ADAD00DEADAD00CEB5B500D6B5B500CEBDBD00DEBDBD00E7BD
                  BD00E7C6C600C6CEC600CECEC600C6CECE00CECECE00D6CECE00E7CECE00E7D6
                  CE00D6D6D600DED6D600EFD6D600DEDED600D6DEDE00DEDEDE00E7DEDE00E7E7
                  E700EFEFEF00F7EFEF00F7F7EF00F7F7F700FFF7F700FFFFF700FF00FF00FFFF
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
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF004848100C0722
                  33343433332505050B4848191516111B27384647452D0002131048191515111A
                  05184046492E0102121048191515111C03032F42493200011210481915151120
                  0601243A493200011210481915151221231D1F27322C04041310481915151515
                  1515151313151515160F48190D111E282B292B2828292B26150C481909384544
                  4545454545454530130F48190A3C46434343434343434530130F48190A3C423A
                  3A3A3A3A3A3A4230130F48190A3C423B3F3F3F3F3F3B4230130F48190A3C4440
                  4040404040404230130F48190A3C423A3A3A3A3A3A3A4230130F48190A394643
                  4343434343434630130F4848092D3A363636363636363A2A0748}
              end
            end
            object pnTaxaClienteG: TPanel
              Left = 8
              Top = 35
              Width = 758
              Height = 386
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 2
              object pnTaxaGeral: TPanel
                Left = 0
                Top = 0
                Width = 496
                Height = 386
                Align = alClient
                BevelOuter = bvNone
                TabOrder = 0
                object GrTaxaParcelas: TGroupBox
                  Left = 0
                  Top = 80
                  Width = 496
                  Height = 40
                  Align = alTop
                  Caption = 'Parcelas'
                  TabOrder = 2
                  object Label66: TLabel
                    Left = 25
                    Top = 18
                    Width = 17
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'De:'
                  end
                  object Label67: TLabel
                    Left = 357
                    Top = 18
                    Width = 21
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'At'#233':'
                  end
                  object DBEditDe: TDBEdit
                    Left = 48
                    Top = 13
                    Width = 60
                    Height = 21
                    DataField = 'PARCELAS_DE'
                    DataSource = DtmCadBasicosCx.dsTaxaEcommerce
                    TabOrder = 0
                  end
                  object DBEditAte: TDBEdit
                    Left = 384
                    Top = 14
                    Width = 60
                    Height = 21
                    DataField = 'PARCELAS_ATE'
                    DataSource = DtmCadBasicosCx.dsTaxaEcommerce
                    TabOrder = 1
                  end
                end
                object GrTaxaProd: TGroupBox
                  Left = 0
                  Top = 120
                  Width = 496
                  Height = 40
                  Align = alTop
                  Caption = 'Comiss'#227'o sobre o valor dos produtos'
                  TabOrder = 3
                  object lbPercProd: TLabel
                    Left = 314
                    Top = 19
                    Width = 64
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Produto (%):'
                  end
                  object DBEditPercProd: TDBEdit
                    Left = 384
                    Top = 14
                    Width = 60
                    Height = 21
                    DataField = 'TAXA_PROD'
                    DataSource = DtmCadBasicosCx.dsTaxaEcommerce
                    TabOrder = 1
                    OnExit = DBEditPercProdExit
                  end
                  object DBCheckBoxTaxaProduto: TDBCheckBox
                    Left = 24
                    Top = 18
                    Width = 241
                    Height = 17
                    Caption = 'Utilizar comiss'#227'o sobre o valor dos produtos'
                    DataField = 'HAB_TAXA_PROD'
                    DataSource = DtmCadBasicosCx.dsTaxaEcommerce
                    TabOrder = 0
                    ValueChecked = 'S'
                    ValueUnchecked = 'N'
                    OnClick = DBCheckBoxTaxaProdutoClick
                  end
                end
                object GrTaxaAdicionalPedido: TGroupBox
                  Left = 0
                  Top = 200
                  Width = 496
                  Height = 40
                  Align = alTop
                  Caption = 'Taxa fixa por pedido'
                  TabOrder = 5
                  object lbValorPorPedido: TLabel
                    Left = 251
                    Top = 19
                    Width = 127
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Taxa fixa por pedido (R$):'
                  end
                  object DBEditTaxaPorPedido: TDBEdit
                    Left = 384
                    Top = 14
                    Width = 60
                    Height = 21
                    DataField = 'VL_TAXA_POR_PEDIDO'
                    DataSource = DtmCadBasicosCx.dsTaxaEcommerce
                    TabOrder = 1
                    OnExit = DBEditTaxaPorPedidoExit
                  end
                  object DBCheckBoxTaxaAdicionalPorPedido: TDBCheckBox
                    Left = 24
                    Top = 18
                    Width = 221
                    Height = 17
                    Caption = 'Utilizar taxa fixa por pedido'
                    DataField = 'HAB_TAXA_POR_PEDIDO'
                    DataSource = DtmCadBasicosCx.dsTaxaEcommerce
                    TabOrder = 0
                    ValueChecked = 'S'
                    ValueUnchecked = 'N'
                    OnClick = DBCheckBoxTaxaAdicionalPorPedidoClick
                  end
                end
                object GrTaxaAdicionalItemPedido: TGroupBox
                  Left = 0
                  Top = 240
                  Width = 496
                  Height = 40
                  Align = alTop
                  Caption = 'Taxa fixa por item'
                  TabOrder = 6
                  object lbValorPorItem: TLabel
                    Left = 266
                    Top = 19
                    Width = 112
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Taxa fixa por item(R$):'
                  end
                  object DBEditTaxaPorItem: TDBEdit
                    Left = 383
                    Top = 15
                    Width = 60
                    Height = 21
                    DataField = 'VL_TAXA_POR_ITEM'
                    DataSource = DtmCadBasicosCx.dsTaxaEcommerce
                    TabOrder = 1
                    OnExit = DBEditTaxaPorItemExit
                  end
                  object DBCheckBoxTaxaAdicionalPorItem: TDBCheckBox
                    Left = 24
                    Top = 18
                    Width = 241
                    Height = 17
                    Caption = 'Utilizar taxa fixa por item do pedido'
                    DataField = 'HAB_TAXA_POR_ITEM'
                    DataSource = DtmCadBasicosCx.dsTaxaEcommerce
                    TabOrder = 0
                    ValueChecked = 'S'
                    ValueUnchecked = 'N'
                    OnClick = DBCheckBoxTaxaAdicionalPorItemClick
                  end
                end
                object GroupBox10: TGroupBox
                  Left = 0
                  Top = 320
                  Width = 496
                  Height = 40
                  Align = alTop
                  Caption = 'Recebimento do frete por conta do Marketlace'
                  TabOrder = 8
                  object DBCheckBoxConsVlFreteTaxa: TDBCheckBox
                    Left = 24
                    Top = 18
                    Width = 265
                    Height = 17
                    Caption = 'Recebimento do frete por conta do Martetplace'
                    Color = clBtnFace
                    DataField = 'FRETE_CONTA_SMART_PLACE'
                    DataSource = DtmCadBasicosCx.dsTaxaEcommerce
                    ParentColor = False
                    TabOrder = 0
                    ValueChecked = 'S'
                    ValueUnchecked = 'N'
                    OnClick = DBCheckBoxConsVlFreteTaxaClick
                  end
                end
                object GrTaxaFrete: TGroupBox
                  Left = 0
                  Top = 160
                  Width = 496
                  Height = 40
                  Align = alTop
                  Caption = 'Comiss'#227'o sobre o valor do frete'
                  TabOrder = 4
                  object lbPercFrete: TLabel
                    Left = 326
                    Top = 19
                    Width = 52
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Frete (%):'
                  end
                  object DBCheckBoxTaxaFrete: TDBCheckBox
                    Left = 24
                    Top = 18
                    Width = 241
                    Height = 17
                    Caption = 'Utilizar comiss'#227'o sobre o valor do frete'
                    DataField = 'HAB_TAXA_FRETE'
                    DataSource = DtmCadBasicosCx.dsTaxaEcommerce
                    TabOrder = 0
                    ValueChecked = 'S'
                    ValueUnchecked = 'N'
                    OnClick = DBCheckBoxTaxaFreteClick
                  end
                  object DBEditPercFrete: TDBEdit
                    Left = 384
                    Top = 14
                    Width = 60
                    Height = 21
                    DataField = 'TAXA_FRETE'
                    DataSource = DtmCadBasicosCx.dsTaxaEcommerce
                    TabOrder = 1
                    OnExit = DBEditPercFreteExit
                  end
                end
                object GrTaxaValor: TGroupBox
                  Left = 0
                  Top = 40
                  Width = 496
                  Height = 40
                  Align = alTop
                  Caption = 'Valor entre'
                  TabOrder = 1
                  object lbValorDe: TLabel
                    Left = 25
                    Top = 17
                    Width = 17
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'De:'
                  end
                  object lbValorAte: TLabel
                    Left = 357
                    Top = 17
                    Width = 21
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'At'#233':'
                  end
                  object lbValorDe2: TLabel
                    Left = 110
                    Top = 17
                    Width = 21
                    Height = 13
                    Caption = '(R$)'
                  end
                  object lbValorAte2: TLabel
                    Left = 448
                    Top = 17
                    Width = 21
                    Height = 13
                    Caption = '(R$)'
                  end
                  object DBEditValorDe: TDBEdit
                    Left = 48
                    Top = 13
                    Width = 60
                    Height = 21
                    DataField = 'VALOR_DE'
                    DataSource = DtmCadBasicosCx.dsTaxaEcommerce
                    TabOrder = 0
                  end
                  object DBEditValorAte: TDBEdit
                    Left = 384
                    Top = 13
                    Width = 60
                    Height = 21
                    DataField = 'VALOR_ATE'
                    DataSource = DtmCadBasicosCx.dsTaxaEcommerce
                    TabOrder = 1
                  end
                end
                object GrTaxaRegra: TGroupBox
                  Left = 0
                  Top = 0
                  Width = 496
                  Height = 40
                  Align = alTop
                  Caption = 'Regra considerar valor de produtos e frete'
                  TabOrder = 0
                  object ckConsProd: TCheckBox
                    Left = 24
                    Top = 17
                    Width = 201
                    Height = 17
                    Caption = 'Produtos'
                    Checked = True
                    Enabled = False
                    State = cbChecked
                    TabOrder = 0
                  end
                  object DBCheckBoxConsFrete: TDBCheckBox
                    Left = 384
                    Top = 17
                    Width = 88
                    Height = 17
                    Caption = 'Frete'
                    DataField = 'CONS_FRETE_REGRA'
                    DataSource = DtmCadBasicosCx.dsTaxaEcommerce
                    TabOrder = 1
                    ValueChecked = 'S'
                    ValueUnchecked = 'N'
                  end
                end
                object GrTaxaAdicionalUnidadePedido: TGroupBox
                  Left = 0
                  Top = 280
                  Width = 496
                  Height = 40
                  Align = alTop
                  Caption = 'Taxa fixa por unidade'
                  TabOrder = 7
                  object lbValorPorUnidade: TLabel
                    Left = 245
                    Top = 19
                    Width = 133
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Taxa fixa por unidade (R$):'
                  end
                  object DBEditTaxaPorUnidade: TDBEdit
                    Left = 384
                    Top = 14
                    Width = 60
                    Height = 21
                    DataField = 'VL_TAXA_POR_UNIDADE'
                    DataSource = DtmCadBasicosCx.dsTaxaEcommerce
                    TabOrder = 1
                    OnExit = DBEditTaxaPorUnidadeExit
                  end
                  object DBCheckBoxTaxaAdicionalPorUnidade: TDBCheckBox
                    Left = 24
                    Top = 18
                    Width = 215
                    Height = 17
                    Caption = 'Utilizar taxa fixa por unidade do pedido'
                    DataField = 'HAB_TAXA_POR_UNIDADE'
                    DataSource = DtmCadBasicosCx.dsTaxaEcommerce
                    TabOrder = 0
                    ValueChecked = 'S'
                    ValueUnchecked = 'N'
                    OnClick = DBCheckBoxTaxaAdicionalPorUnidadeClick
                  end
                end
              end
              object pnTaxaRight: TPanel
                Left = 496
                Top = 0
                Width = 262
                Height = 386
                Align = alRight
                BevelKind = bkTile
                BevelOuter = bvNone
                TabOrder = 1
                object pnDescSimulacao: TPanel
                  Left = 0
                  Top = 123
                  Width = 258
                  Height = 20
                  Align = alTop
                  BevelOuter = bvNone
                  Caption = 'SIMULA'#199#195'O'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = [fsBold]
                  ParentFont = False
                  TabOrder = 1
                end
                object pnExFrete: TPanel
                  Left = 0
                  Top = 188
                  Width = 258
                  Height = 15
                  Align = alTop
                  Alignment = taLeftJustify
                  BevelOuter = bvNone
                  Caption = '      Frete:                       R$ 10,00     '
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = [fsUnderline]
                  ParentFont = False
                  TabOrder = 2
                end
                object pnExProd: TPanel
                  Left = 0
                  Top = 173
                  Width = 258
                  Height = 15
                  Align = alTop
                  Alignment = taLeftJustify
                  BevelOuter = bvNone
                  Caption = '      Produtos:                 R$ 90,00'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 3
                end
                object pnExPedido: TPanel
                  Left = 0
                  Top = 203
                  Width = 258
                  Height = 15
                  Align = alTop
                  Alignment = taLeftJustify
                  BevelOuter = bvNone
                  Caption = '      Total Pedido:            R$ 100,00'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 4
                end
                object pnDescTaxa: TPanel
                  Left = 0
                  Top = 218
                  Width = 258
                  Height = 20
                  Align = alTop
                  BevelOuter = bvNone
                  Caption = 'COMISS'#213'ES    E    TAXAS'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = [fsBold]
                  ParentFont = False
                  TabOrder = 5
                end
                object pnExTaxaAdPedido: TPanel
                  Left = 0
                  Top = 268
                  Width = 258
                  Height = 15
                  Align = alTop
                  Alignment = taLeftJustify
                  BevelOuter = bvNone
                  Caption = '      Taxa fixa (Pedido):       R$  0,00'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 6
                end
                object pnExQtdeItens: TPanel
                  Left = 0
                  Top = 143
                  Width = 258
                  Height = 15
                  Align = alTop
                  Alignment = taLeftJustify
                  BevelOuter = bvNone
                  Caption = '      Qtde Itens:               3'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 7
                end
                object pnExTaxaProd: TPanel
                  Left = 0
                  Top = 238
                  Width = 258
                  Height = 15
                  Align = alTop
                  Alignment = taLeftJustify
                  BevelOuter = bvNone
                  Caption = ' Comiss'#227'o (Produtos):        R$  0,00  -  0%'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 8
                end
                object pnExTaxaAdItem: TPanel
                  Left = 0
                  Top = 283
                  Width = 258
                  Height = 15
                  Align = alTop
                  Alignment = taLeftJustify
                  BevelOuter = bvNone
                  Caption = '      Taxa fixa (Item):            R$  0,00      '
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 9
                end
                object pnExTaxaFrete: TPanel
                  Left = 0
                  Top = 253
                  Width = 258
                  Height = 15
                  Align = alTop
                  Alignment = taLeftJustify
                  BevelOuter = bvNone
                  Caption = '       Comiss'#227'o (Frete):        R$  0,00  -  0%'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 10
                end
                object pnExTaxaAdTot: TPanel
                  Left = 0
                  Top = 328
                  Width = 258
                  Height = 15
                  Align = alTop
                  Alignment = taLeftJustify
                  BevelOuter = bvNone
                  Caption = '      Total:                             R$  0,00'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 11
                end
                object pnExConsFreteTaxa: TPanel
                  Left = 0
                  Top = 313
                  Width = 258
                  Height = 15
                  Align = alTop
                  Alignment = taLeftJustify
                  BevelOuter = bvNone
                  Caption = '      Frete Marketplace:        R$  0,00'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = [fsUnderline]
                  ParentFont = False
                  TabOrder = 12
                end
                object pnDescAreceber: TPanel
                  Left = 0
                  Top = 343
                  Width = 258
                  Height = 20
                  Align = alTop
                  BevelOuter = bvNone
                  Caption = 'A RECEBER'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = [fsBold]
                  ParentFont = False
                  TabOrder = 13
                end
                object pnExValorReceber: TPanel
                  Left = 0
                  Top = 363
                  Width = 258
                  Height = 15
                  Align = alTop
                  Alignment = taLeftJustify
                  BevelOuter = bvNone
                  Caption = '      Valor a receber:             R$  0,00'
                  TabOrder = 14
                end
                object pnVlProd: TPanel
                  Left = 0
                  Top = 20
                  Width = 258
                  Height = 103
                  Align = alTop
                  BevelOuter = bvNone
                  TabOrder = 0
                  object lbDesVlPord: TLabel
                    Left = 6
                    Top = 6
                    Width = 71
                    Height = 13
                    Caption = 'Produtos (R$):'
                  end
                  object lbDesVlFrete: TLabel
                    Left = 6
                    Top = 29
                    Width = 54
                    Height = 13
                    Caption = 'Frete (R$):'
                  end
                  object lbDesQtdeItens: TLabel
                    Left = 6
                    Top = 52
                    Width = 56
                    Height = 13
                    Caption = 'Qtde Itens:'
                  end
                  object lbDesPorUnidade: TLabel
                    Left = 6
                    Top = 76
                    Width = 70
                    Height = 13
                    Caption = 'Qtde Unidade:'
                  end
                  object EditHwVlProd: TEditHw
                    Left = 83
                    Top = 3
                    Width = 94
                    Height = 21
                    TabOrder = 0
                    Text = '0'
                    OnExit = EditHwVlProdExit
                    Formato = fNumber
                    FormatSize = '0.2'
                  end
                  object EditHwVlFrete: TEditHw
                    Left = 83
                    Top = 26
                    Width = 94
                    Height = 21
                    TabOrder = 1
                    Text = '0'
                    OnExit = EditHwVlFreteExit
                    Formato = fNumber
                    FormatSize = '0.2'
                  end
                  object EditHwQtdeItens: TEditHw
                    Left = 83
                    Top = 49
                    Width = 94
                    Height = 21
                    TabOrder = 2
                    Text = '0'
                    OnExit = EditHwQtdeItensExit
                    Formato = fInteger
                    FormatSize = '0.2'
                  end
                  object EditHwQtdeUnidade: TEditHw
                    Left = 83
                    Top = 73
                    Width = 94
                    Height = 21
                    TabOrder = 3
                    Text = '0'
                    OnExit = EditHwQtdeUnidadeExit
                    Formato = fInteger
                    FormatSize = '0.2'
                  end
                end
                object Panel14: TPanel
                  Left = 0
                  Top = 0
                  Width = 258
                  Height = 20
                  Align = alTop
                  BevelOuter = bvNone
                  Caption = 'DADOS PARA SIMULA'#199#195'O'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                  TabOrder = 15
                end
                object pnExTaxaAdUnidade: TPanel
                  Left = 0
                  Top = 298
                  Width = 258
                  Height = 15
                  Align = alTop
                  Alignment = taLeftJustify
                  BevelOuter = bvNone
                  Caption = '      Taxa fixa (Unidade):     R$  0,00      '
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 16
                end
                object pnExQtdeUnidades: TPanel
                  Left = 0
                  Top = 158
                  Width = 258
                  Height = 15
                  Align = alTop
                  Alignment = taLeftJustify
                  BevelOuter = bvNone
                  Caption = '      Qtde Unidades:        3'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 17
                end
              end
            end
          end
        end
        object tsControlesCliente: TTabSheet
          Caption = 'Controles Clientes (Vendas)'
          ImageIndex = 6
          object pnControlesCliente: TPanel
            Left = 1
            Top = 3
            Width = 560
            Height = 195
            TabOrder = 0
            object pnTopAlterarVendCli: TPanel
              Left = 1
              Top = 156
              Width = 558
              Height = 38
              Align = alBottom
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 0
              object BitBtn47: TBitBtn
                Left = 185
                Top = 4
                Width = 90
                Height = 25
                Hint = 'OK - [CXG132/CXG133]'
                Caption = '&OK'
                TabOrder = 0
                OnClick = BitBtn47Click
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
              object BitBtn53: TBitBtn
                Left = 279
                Top = 4
                Width = 90
                Height = 25
                Hint = 'Cancelar'
                Caption = '&Cancelar'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 1
                OnClick = BitBtn53Click
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
            object RadioGroup1: TRadioGroup
              Left = 1
              Top = 73
              Width = 558
              Height = 83
              Align = alClient
              Caption = 'Op'#231#245'es'
              ItemIndex = 0
              Items.Strings = (
                'Incluir controle padr'#227'o'
                'Remover controle padr'#227'o')
              TabOrder = 1
            end
            object GroupBox15: TGroupBox
              Left = 1
              Top = 1
              Width = 558
              Height = 72
              Align = alTop
              TabOrder = 2
              object DBText4: TDBText
                Left = 13
                Top = 19
                Width = 524
                Height = 17
                DataField = 'NOME_CTRL'
                DataSource = DtmCadBasicosCx.dsControles
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label71: TLabel
                Left = 13
                Top = 42
                Width = 44
                Height = 13
                Caption = 'Codigo: '
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object DBText5: TDBText
                Left = 63
                Top = 42
                Width = 65
                Height = 17
                DataField = 'CODIGO_CTRL'
                DataSource = DtmCadBasicosCx.dsControles
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlue
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
              end
            end
          end
        end
      end
    end
    inherited PanelFlash: TPanel
      Left = 845
      Top = 440
      Height = 559
      ExplicitLeft = 845
      ExplicitTop = 440
      ExplicitHeight = 559
      inherited bMarketingHW: TBitBtn
        Top = 537
        ExplicitTop = 537
      end
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 607
    Width = 881
    ExplicitTop = 607
    ExplicitWidth = 881
  end
  inherited pnStatusProcessamento: TPanel
    Left = 839
    ExplicitLeft = 839
    inherited lbTextoProcessamento: TLabel
      Width = 477
      Height = 21
    end
  end
  inherited PopupMenu1: TPopupMenu
    Left = 588
    Top = 17
    object MarcarTodosControles: TMenuItem
      Caption = 'Marcar Todos Controles'
      OnClick = MarcarTodosControlesClick
    end
    object DesmarcarTodosControles: TMenuItem
      Caption = 'Desmarcar Todos Controles'
      OnClick = DesmarcarTodosControlesClick
    end
  end
  inherited PopupMenu2: TPopupMenu
    Left = 646
    Top = 19
  end
  inherited Timer1: TTimer
    Left = 614
    Top = 19
  end
  inherited ApplicationEventsPadrao: TApplicationEvents
    Left = 758
    Top = 67
  end
  object OpenDialog1: TOpenDialog
    Left = 677
    Top = 19
  end
  object DtSaldoCtrl: TDataSource
    DataSet = DtmCadBasicosCx.qrBuscas
    Left = 720
    Top = 8
  end
end
