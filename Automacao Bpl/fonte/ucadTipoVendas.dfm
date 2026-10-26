inherited frmCadTipoVendas: TfrmCadTipoVendas
  Caption = 'Tipos Vendas'
  ClientWidth = 804
  Scaled = False
  ExplicitWidth = 812
  ExplicitHeight = 598
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelFundo: TPanel
    Width = 804
    ExplicitWidth = 804
    inherited PanelLeft: TPanel
      Width = 799
      ExplicitWidth = 799
      inherited PageControl1: TPageControl
        Width = 797
        ExplicitWidth = 797
        inherited TabSheet1: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 789
          ExplicitHeight = 510
          inherited ScrollBox1: TScrollBox
            Width = 789
            ExplicitWidth = 789
            inherited PageControl3: TPageControl
              Width = 789
              ActivePage = tsCadastro
              ExplicitWidth = 789
              inherited TabSheet3: TTabSheet
                ExplicitLeft = 4
                ExplicitTop = 27
                ExplicitWidth = 781
                ExplicitHeight = 431
                inherited ScrollBox3: TScrollBox
                  Width = 781
                  ExplicitWidth = 781
                  inherited GroupBox1: TGroupBox
                    Width = 760
                    Height = 467
                    ExplicitWidth = 760
                    ExplicitHeight = 467
                  end
                end
              end
              object tsCadastro: TTabSheet
                Caption = 'tsCadastro'
                ImageIndex = 1
                object ScrollBox4: TScrollBox
                  Left = 0
                  Top = 0
                  Width = 781
                  Height = 431
                  Align = alClient
                  TabOrder = 0
                  object GroupBox4: TGroupBox
                    Left = 0
                    Top = 0
                    Width = 760
                    Height = 499
                    Align = alTop
                    Caption = 'Cadastro Tipos Vendas'
                    TabOrder = 0
                    object Label6: TLabel
                      Left = 128
                      Top = 16
                      Width = 37
                      Height = 13
                      Caption = 'C'#243'digo:'
                      FocusControl = DBEdit1
                    end
                    object Label7: TLabel
                      Left = 141
                      Top = 43
                      Width = 24
                      Height = 13
                      Caption = 'Tipo:'
                    end
                    object Label8: TLabel
                      Left = 115
                      Top = 70
                      Width = 50
                      Height = 13
                      Caption = 'Descri'#231#227'o:'
                      FocusControl = DBEdit3
                    end
                    object Label9: TLabel
                      Left = 109
                      Top = 97
                      Width = 56
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Tipo de OS:'
                      FocusControl = DBEdit4
                    end
                    object Label10: TLabel
                      Left = 139
                      Top = 124
                      Width = 26
                      Height = 13
                      Caption = 'Sigla:'
                      FocusControl = DBEdit5
                    end
                    object Label11: TLabel
                      Left = 131
                      Top = 151
                      Width = 34
                      Height = 13
                      Caption = 'Venda:'
                    end
                    object Label12: TLabel
                      Left = 96
                      Top = 178
                      Width = 69
                      Height = 13
                      Caption = 'Com Garantia:'
                    end
                    object Label13: TLabel
                      Left = 51
                      Top = 205
                      Width = 114
                      Height = 13
                      Caption = 'Permitir Cupom Servi'#231'o:'
                    end
                    object Label14: TLabel
                      Left = 87
                      Top = 259
                      Width = 78
                      Height = 13
                      Caption = 'Ordem Exibi'#231#227'o:'
                      FocusControl = DBEdit9
                    end
                    object Label15: TLabel
                      Left = 4
                      Top = 232
                      Width = 161
                      Height = 13
                      Caption = 'Confirmar Fechamento na Venda:'
                    end
                    object Label16: TLabel
                      Left = 505
                      Top = 97
                      Width = 117
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Usar Libera'#231#227'o Gerente:'
                    end
                    object Label17: TLabel
                      Left = 470
                      Top = 151
                      Width = 152
                      Height = 13
                      Caption = 'Usar Pre'#231'o de Custo no Pedido:'
                    end
                    object Label18: TLabel
                      Left = 495
                      Top = 124
                      Width = 127
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Usar Libera'#231#227'o Financeiro:'
                    end
                    object Label19: TLabel
                      Left = 322
                      Top = 351
                      Width = 401
                      Height = 26
                      Caption = 
                        '* Abater ou cancelar itens de vendas em aberto ao realizar uma n' +
                        'ova venda com o mesmo produto para o mesmo vendedor. '
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clRed
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                      WordWrap = True
                    end
                    object Label20: TLabel
                      Left = 25
                      Top = 358
                      Width = 140
                      Height = 26
                      Alignment = taRightJustify
                      Caption = 'Abater Itens ao realizar uma nova venda:'
                      WordWrap = True
                    end
                    object Label21: TLabel
                      Left = 89
                      Top = 440
                      Width = 76
                      Height = 13
                      Alignment = taRightJustify
                      Caption = #193'rea Execu'#231#227'o:'
                    end
                    object Label22: TLabel
                      Left = 322
                      Top = 418
                      Width = 368
                      Height = 13
                      Caption = 
                        '* Serve para usar este tipo de venda para saidas de produtos par' +
                        'a consumo'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clBlue
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                    end
                    object Label23: TLabel
                      Left = 3
                      Top = 386
                      Width = 162
                      Height = 26
                      Alignment = taRightJustify
                      Caption = 'N'#227'o Abater Itens ao realizar uma nova venda:'
                      WordWrap = True
                    end
                    object Label24: TLabel
                      Left = 318
                      Top = 385
                      Width = 433
                      Height = 26
                      Caption = 
                        '* N'#227'o abater ou cancelar itens de vendas de vendas em aberto ao ' +
                        'realizar uma nova com o mesmo produto para o mesmo vendedor.'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clRed
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                      WordWrap = True
                    end
                    object Label25: TLabel
                      Left = 461
                      Top = 16
                      Width = 161
                      Height = 13
                      Hint = 'M'#225'ximo de desconto por tipo'
                      Caption = 'M'#225'ximo de desconto por tipo(%):'
                      FocusControl = DBEdit1
                    end
                    object Label88: TLabel
                      Left = 507
                      Top = 70
                      Width = 115
                      Height = 13
                      Caption = 'M'#237'nimo Margem(Lq)(%):'
                    end
                    object Label83: TLabel
                      Left = 526
                      Top = 43
                      Width = 96
                      Height = 13
                      Caption = 'Mark up M'#237'nimo(%):'
                    end
                    object Label26: TLabel
                      Left = 103
                      Top = 286
                      Width = 62
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Observa'#231#227'o:'
                      FocusControl = DBEdit9
                    end
                    object Label27: TLabel
                      Left = 91
                      Top = 336
                      Width = 74
                      Height = 13
                      Caption = 'Restri'#231#227'o NFE: '
                    end
                    object Label28: TLabel
                      Left = 499
                      Top = 178
                      Width = 123
                      Height = 13
                      Caption = 'Lan'#231'ar D'#233'bito ou Cr'#233'dito:'
                    end
                    object Label29: TLabel
                      Left = 455
                      Top = 205
                      Width = 167
                      Height = 13
                      Caption = 'Verificar Func. Colaborador na OS:'
                    end
                    object Label30: TLabel
                      Left = 496
                      Top = 232
                      Width = 126
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Envio do pedido por email:'
                    end
                    object Label31: TLabel
                      Left = 534
                      Top = 334
                      Width = 88
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Imprimir Contrato:'
                    end
                    object Label32: TLabel
                      Left = 278
                      Top = 259
                      Width = 344
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 
                        'Venda CNT (Considera como venda para o Relatorio DRE Comparativo' +
                        '):'
                    end
                    object Label33: TLabel
                      Left = 16
                      Top = 418
                      Width = 149
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Indicador de Consumo Vendas:'
                    end
                    object Label34: TLabel
                      Left = 439
                      Top = 440
                      Width = 183
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Salvar itens REQ, OS e ORC autmatic:'
                    end
                    object Label35: TLabel
                      Left = 509
                      Top = 467
                      Width = 115
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Repetir Itens na Venda:'
                    end
                    object Label36: TLabel
                      Left = 96
                      Top = 467
                      Width = 67
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Gerar pontos:'
                    end
                    object Label37: TLabel
                      Left = 526
                      Top = 286
                      Width = 96
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Receber Financeiro:'
                    end
                    object DBEdit1: TDBEdit
                      Left = 171
                      Top = 13
                      Width = 89
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'COD_TIPO'
                      DataSource = DtmCadBasicos.dsTipoVendas
                      Enabled = False
                      TabOrder = 0
                    end
                    object DBEdit3: TDBEdit
                      Left = 171
                      Top = 67
                      Width = 264
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'DESCRICAO'
                      DataSource = DtmCadBasicos.dsTipoVendas
                      TabOrder = 2
                    end
                    object DBEdit4: TDBEdit
                      Left = 171
                      Top = 94
                      Width = 134
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'TIPO_OS'
                      DataSource = DtmCadBasicos.dsTipoVendas
                      TabOrder = 3
                      OnExit = DBEdit4Exit
                    end
                    object DBEdit5: TDBEdit
                      Left = 171
                      Top = 121
                      Width = 49
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'SIGLA'
                      DataSource = DtmCadBasicos.dsTipoVendas
                      TabOrder = 4
                      OnExit = DBEdit5Exit
                    end
                    object DBEdit9: TDBEdit
                      Left = 171
                      Top = 256
                      Width = 49
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'ORDEMEXIBICAO'
                      DataSource = DtmCadBasicos.dsTipoVendas
                      TabOrder = 9
                    end
                    object DBComboBox3: TDBComboBox
                      Left = 171
                      Top = 175
                      Width = 145
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'COMGARANTIA'
                      DataSource = DtmCadBasicos.dsTipoVendas
                      ItemHeight = 13
                      Items.Strings = (
                        'N - N'#195'O'
                        'S - SIM')
                      TabOrder = 6
                    end
                    object DBComboBox4: TDBComboBox
                      Left = 171
                      Top = 202
                      Width = 145
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'PERMITIR_CUPOM_SERVICO'
                      DataSource = DtmCadBasicos.dsTipoVendas
                      ItemHeight = 13
                      Items.Strings = (
                        'N - N'#195'O'
                        'S - SIM')
                      TabOrder = 7
                    end
                    object DBComboBox1: TDBComboBox
                      Left = 171
                      Top = 40
                      Width = 145
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'TIPO'
                      DataSource = DtmCadBasicos.dsTipoVendas
                      ItemHeight = 13
                      Items.Strings = (
                        'REQ'
                        'OS'
                        'ORC'
                        'TMO'
                        'VEI')
                      PopupMenu = PopupMenu1
                      TabOrder = 1
                      OnExit = DBComboBox1Exit
                    end
                    object DBComboBox2: TDBComboBox
                      Left = 171
                      Top = 148
                      Width = 145
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'VENDA'
                      DataSource = DtmCadBasicos.dsTipoVendas
                      ItemHeight = 13
                      Items.Strings = (
                        'N - N'#195'O'
                        'S - SIM')
                      TabOrder = 5
                    end
                    object DBComboBox5: TDBComboBox
                      Left = 171
                      Top = 229
                      Width = 264
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'CONFIGFECHVND'
                      DataSource = DtmCadBasicos.dsTipoVendas
                      ItemHeight = 13
                      Items.Strings = (
                        'E - ESCOLHER'
                        'F - FECHAR SEM CONFIRMAR'
                        'C -  CONFIRMAR SEM PERGUNTAR')
                      TabOrder = 8
                    end
                    object DBComboBox6: TDBComboBox
                      Left = 629
                      Top = 94
                      Width = 122
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'USAR_LIBERACAO_GERENTE'
                      DataSource = DtmCadBasicos.dsTipoVendas
                      ItemHeight = 13
                      Items.Strings = (
                        'SIM'
                        'NAO')
                      TabOrder = 20
                    end
                    object DBComboBox7: TDBComboBox
                      Left = 629
                      Top = 148
                      Width = 122
                      Height = 21
                      Hint = 
                        'Configura'#231#227'o para usar ou n'#227'o o pre'#231'o de custo no pedido de vend' +
                        'a. '
                      CharCase = ecUpperCase
                      DataField = 'USARPRECOCUSTO'
                      DataSource = DtmCadBasicos.dsTipoVendas
                      ItemHeight = 13
                      Items.Strings = (
                        'N'#195'O'
                        'SIM')
                      TabOrder = 22
                      OnKeyPress = DBComboBox7KeyPress
                    end
                    object DBComboBox8: TDBComboBox
                      Left = 628
                      Top = 121
                      Width = 122
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'USAR_LIBERACAO_FINANCEIRO'
                      DataSource = DtmCadBasicos.dsTipoVendas
                      ItemHeight = 13
                      Items.Strings = (
                        'SIM'
                        'NAO')
                      TabOrder = 21
                    end
                    object DBComboBox9: TDBComboBox
                      Left = 171
                      Top = 358
                      Width = 145
                      Height = 21
                      Hint = 
                        'Configura'#231#227'o para abater ou cancelar itens de vendas em aberto a' +
                        'o realizar uma nova venda do mesmo produto para o mesmo vendedor'
                      CharCase = ecUpperCase
                      DataField = 'USAR_CONFERENCIA_PRODUTO'
                      DataSource = DtmCadBasicos.dsTipoVendas
                      ItemHeight = 13
                      Items.Strings = (
                        'N'#195'O'
                        'SIM')
                      TabOrder = 12
                      OnExit = DBComboBox9Exit
                      OnKeyPress = DBComboBox9KeyPress
                    end
                    object DBComboBox10: TDBComboBox
                      Left = 171
                      Top = 410
                      Width = 145
                      Height = 21
                      Hint = 
                        'Configura'#231#227'o para cancelar item da venda em aberto ao realizar u' +
                        'ma nova venda do mesmo produto para o mesmo vendedor'
                      CharCase = ecUpperCase
                      DataField = 'CONSUMO'
                      DataSource = DtmCadBasicos.dsTipoVendas
                      ItemHeight = 13
                      Items.Strings = (
                        'N'#195'O'
                        'SIM')
                      TabOrder = 14
                      OnKeyPress = DBComboBox9KeyPress
                    end
                    object DBComboBox11: TDBComboBox
                      Left = 171
                      Top = 384
                      Width = 145
                      Height = 21
                      Hint = 
                        'Configura'#231#227'o para n'#227'o abater ou cancelar itens de vendas em aber' +
                        'to ao realizar uma nova venda do mesmo produto para o mesmo vend' +
                        'edor'
                      CharCase = ecUpperCase
                      DataField = 'N_USAR_CONFERENCIA_PRODUTO'
                      DataSource = DtmCadBasicos.dsTipoVendas
                      ItemHeight = 13
                      Items.Strings = (
                        'N'#195'O'
                        'SIM')
                      TabOrder = 13
                      OnExit = DBComboBox11Exit
                      OnKeyPress = DBComboBox9KeyPress
                    end
                    object EditHw1: TEditHw
                      Left = 629
                      Top = 13
                      Width = 120
                      Height = 21
                      Hint = 'M'#225'ximo de desconto permitido em um pedido de venda por tipo'
                      TabOrder = 17
                      Text = '                                   0'
                      Formato = fNumber
                      FormatSize = '0.2'
                    end
                    object EditHw2: TEditHw
                      Left = 629
                      Top = 40
                      Width = 120
                      Height = 21
                      Hint = 'Mark Up bruto m'#237'nimo de venda por tipo'
                      TabOrder = 18
                      Text = '                                   0'
                      Formato = fNumber
                      FormatSize = '0.2'
                    end
                    object EditHw3: TEditHw
                      Left = 629
                      Top = 67
                      Width = 120
                      Height = 21
                      Hint = 'Margem m'#237'nima na venda por tipo (Valor L'#237'quido)'
                      TabOrder = 19
                      Text = '                                   0'
                      Formato = fNumber
                      FormatSize = '0.2'
                    end
                    object DBMemo1: TDBMemo
                      Left = 171
                      Top = 281
                      Width = 342
                      Height = 44
                      DataField = 'OBSERVACAO'
                      DataSource = DtmCadBasicos.dsTipoVendas
                      TabOrder = 10
                    end
                    object DBComboBox12: TDBComboBox
                      Left = 171
                      Top = 331
                      Width = 264
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'TPREST'
                      DataSource = DtmCadBasicos.dsTipoVendas
                      ItemHeight = 13
                      Items.Strings = (
                        '0 - N'#195'O H'#193
                        '1 - ALIENA'#199#195'O FIDUCI'#193'RIA'
                        '2 - ARRENDAMENTO MERCANTIL'
                        '3 - RESERVA DE DOM'#205'NIO'
                        '4 - PENHOR DE VE'#205'CULOS'
                        '9 - OUTRAS')
                      TabOrder = 11
                      OnExit = DBComboBox1Exit
                    end
                    object DBComboBox13: TDBComboBox
                      Left = 629
                      Top = 175
                      Width = 122
                      Height = 21
                      Hint = 
                        'Lan'#231'ar d'#233'bitos e cr'#233'ditos na conta do colaborador quando configu' +
                        'rado na empresa'
                      CharCase = ecUpperCase
                      DataField = 'USAR_DEBCRED'
                      DataSource = DtmCadBasicos.dsTipoVendas
                      ItemHeight = 13
                      Items.Strings = (
                        'N - N'#195'O'
                        'S - SIM')
                      TabOrder = 23
                      OnKeyPress = DBComboBox7KeyPress
                    end
                    object DBComboBox14: TDBComboBox
                      Left = 629
                      Top = 202
                      Width = 122
                      Height = 21
                      Hint = 
                        'Verificar a fun'#231#227'o do colaborador ao incluir um item na OS (test' +
                        'ar'#225' se o colaborador '#233' VENDEDOR  - por padr'#227'o sempre ser'#225' verifi' +
                        'cado)'
                      CharCase = ecUpperCase
                      DataField = 'VERIFICA_FUNCCOLAB_ITOS'
                      DataSource = DtmCadBasicos.dsTipoVendas
                      ItemHeight = 13
                      Items.Strings = (
                        'N - N'#195'O'
                        'S - SIM')
                      TabOrder = 24
                      OnKeyPress = DBComboBox7KeyPress
                    end
                    object DBComboBox15: TDBComboBox
                      Left = 629
                      Top = 229
                      Width = 122
                      Height = 21
                      Hint = 'Envio do pedido por email'
                      CharCase = ecUpperCase
                      DataField = 'ENV_EMAIL'
                      DataSource = DtmCadBasicos.dsTipoVendas
                      ItemHeight = 13
                      Items.Strings = (
                        'N - N'#195'O'
                        'A - NA ABERTURA'
                        'F - NO FECHAMENTO ')
                      TabOrder = 25
                      OnKeyPress = DBComboBox7KeyPress
                    end
                    object DBComboBox16: TDBComboBox
                      Left = 629
                      Top = 331
                      Width = 122
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'IMP_CONTRATO_VEIC'
                      DataSource = DtmCadBasicos.dsTipoVendas
                      ItemHeight = 13
                      Items.Strings = (
                        'SIM'
                        'NAO')
                      TabOrder = 28
                      OnKeyPress = DBComboBox7KeyPress
                    end
                    object DBComboBox17: TDBComboBox
                      Left = 629
                      Top = 254
                      Width = 122
                      Height = 21
                      Hint = 
                        'Venda CNT (Considera como venda para o Relatorio DRE Comparativo' +
                        '):'
                      CharCase = ecUpperCase
                      DataField = 'VENDA_CNT'
                      DataSource = DtmCadBasicos.dsTipoVendas
                      ItemHeight = 13
                      Items.Strings = (
                        'SIM'
                        'NAO')
                      TabOrder = 26
                      OnKeyPress = DBComboBox7KeyPress
                    end
                    object DBEdit2: TDBEdit
                      Left = 171
                      Top = 437
                      Width = 264
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'AREA_EXEC'
                      DataSource = DtmCadBasicos.dsTipoVendas
                      TabOrder = 15
                    end
                    object DBComboBox18: TDBComboBox
                      Left = 628
                      Top = 437
                      Width = 122
                      Height = 21
                      Hint = 'Salvar itens REQ, OS e ORC automaticamente'
                      CharCase = ecUpperCase
                      DataField = 'SALVAR_ITENS_AUTOMATIC'
                      DataSource = DtmCadBasicos.dsTipoVendas
                      ItemHeight = 13
                      Items.Strings = (
                        'SIM'
                        'NAO')
                      TabOrder = 29
                      OnKeyPress = DBComboBox7KeyPress
                    end
                    object DBComboBox19: TDBComboBox
                      Left = 628
                      Top = 464
                      Width = 122
                      Height = 21
                      Hint = 'Repetir Itens na Venda'
                      CharCase = ecUpperCase
                      DataField = 'REPETIR_ITEMVND'
                      DataSource = DtmCadBasicos.dsTipoVendas
                      ItemHeight = 13
                      Items.Strings = (
                        'SIM'
                        'NAO')
                      TabOrder = 30
                      OnKeyPress = DBComboBox7KeyPress
                    end
                    object DBComboBox20: TDBComboBox
                      Left = 171
                      Top = 464
                      Width = 122
                      Height = 21
                      Hint = 'Gerar pontos programa de fidelidade'
                      CharCase = ecUpperCase
                      DataField = 'GERAR_PONTOS'
                      DataSource = DtmCadBasicos.dsTipoVendas
                      ItemHeight = 13
                      Items.Strings = (
                        'SIM'
                        'NAO')
                      TabOrder = 16
                      OnKeyPress = DBComboBox7KeyPress
                    end
                    object DBComboBox21: TDBComboBox
                      Left = 628
                      Top = 281
                      Width = 122
                      Height = 21
                      Hint = 'Receber pelo financeiro'
                      CharCase = ecUpperCase
                      DataField = 'RECEBER_FINANCEIRO'
                      DataSource = DtmCadBasicos.dsTipoVendas
                      ItemHeight = 13
                      Items.Strings = (
                        'SIM'
                        'NAO')
                      TabOrder = 27
                      OnKeyPress = DBComboBox7KeyPress
                    end
                  end
                end
              end
            end
            inherited Panel3: TPanel
              Width = 789
              ExplicitWidth = 789
              inherited BitBtn4: TBitBtn
                Hint = 'Confirmar Registro - [BAS252]'
              end
              inherited BitBtn5: TBitBtn
                Hint = 'Cancelar Registro'
              end
            end
          end
        end
        inherited TabSheet2: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 789
          ExplicitHeight = 510
          inherited GroupBox3: TGroupBox
            Width = 789
            ExplicitWidth = 789
            inherited imgInformation: TImage
              Left = 763
              ExplicitLeft = 763
            end
            inherited BitBtn1: TBitBtn
              Hint = 'Clique para pesquisar - [BAS246]'
            end
            inherited BitBtn3: TBitBtn
              Hint = 'Novo cadastro - [BAS247]'
            end
            inherited CheckBox3: TCheckBox
              Visible = False
            end
            inherited CheckBox1: TCheckBox
              Visible = False
            end
          end
          inherited Panel1: TPanel
            Width = 789
            ExplicitWidth = 789
            inherited Splitter1: TSplitter
              ExplicitHeight = 365
            end
            inherited DBGrid1: TDBGrid
              Width = 496
              DataSource = DataSource1
              OnKeyDown = DBGrid1KeyDown
            end
            inherited Panel2: TPanel
              Width = 785
              ExplicitWidth = 785
              inherited SpeedButton1: TSpeedButton
                Hint = 'Editar Registro - [BAS248]'
              end
              inherited SpeedButton2: TSpeedButton
                Hint = 'Apagar Registro - [BAS249]'
                OnClick = SpeedButton2Click
              end
              inherited SpeedButton3: TSpeedButton
                Hint = 'Imprimir - [BAS254]'
                OnClick = SpeedButton3Click
              end
              inherited SpeedButton4: TSpeedButton
                OnClick = SpeedButton25Click
              end
              inherited SpeedButton5: TSpeedButton
                Hint = 'Recuperar registro - [BAS251]'
                OnClick = SpeedButton5Click
              end
              inherited SpeedButton6: TSpeedButton
                Left = 291
                Hint = 'Conectar Tipo de Venda as Opera'#231#245'es Internas - [MOD028]'
                Glyph.Data = {
                  F6060000424DF606000000000000360000002800000018000000180000000100
                  180000000000C0060000120B0000120B00000000000000000000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7E3C0
                  F1CF97F6E0BEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFEEC470E39E1CE19918DF9314E8B665FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFF9E9C5E8A924E5A420E39E1CE19918DF9314F6E0BEFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6DDA0EAAF28E8A924E5A420E39E1CE199
                  18F1CF95FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9EBC5ECB52CEAAF28
                  E8AA24E6A420E39F1DF7E3C1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBD
                  B8B1C6A043ECB52CEAAF29E8AA25EFC470FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFD3D0CB7D72657E7366DFCEA5F7DEA2F9E9C4FFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFEFDFAF0CA85E3A12EE19B2AECC17EFEFCF9FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFE4E1DF81776A7C7164C8C3BDFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2D08AE4A11EE29B1AE09616DD9012EC
                  C17FFFFFFFFFFFFFFFFFFFFFFFFFEFEDEC887E727C7164B0A9A1FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEBB43CE7A722E4A1
                  1EE29B1ADF9516D38C1A7C71647C71647C71647C71647C71647C7164A0998FFD
                  FDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  EDBA3FE9AC26E6A622E4A01EE29A19D6921C7C71647C71647C71647C71647C71
                  647C7164A0998FFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFF5D990EBB12AE8AB26E6A621E4A01DEFC984FFFFFFFFFFFF
                  FFFFFFFFFFFFEFEDEC887E727C7164B0A9A1FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFAF5D88FEDB93EEAB43BF2CF89FE
                  FDFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE4E1DF81776A7C7164C8C3BDFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3D0CB7D
                  72657E7366DAC29DEFCB94F5DEBDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFBDB8B1BE8D35E09617DD8F12DA890DE7B161FFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8E7C3E5A420E39D1BE09616DD8F11DA88
                  0CF5DEBDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6DC9FE8AB25E5A420
                  E39D1BE09616DD8F11EEC991FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA
                  ECC6EBB12AE8AA25E5A320E29C1BE09616F6E1BFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFF3D179EBB12AE8AA25E5A320ECBF6CFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAECC6F6DCA0F9E8C3FFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
                OnClick = SpeedButton6Click
                ExplicitLeft = 291
              end
              inherited SpeedButton7: TSpeedButton
                Visible = False
              end
              inherited SpeedButton8: TSpeedButton
                Visible = False
              end
              inherited SpeedButton11: TSpeedButton
                Visible = False
              end
              inherited SpeedButton12: TSpeedButton
                Visible = False
              end
              inherited SpeedButton23: TSpeedButton
                Visible = False
              end
              inherited SpeedButton24: TSpeedButton
                Visible = False
              end
              inherited SpeedButton25: TSpeedButton
                Left = 177
                Hint = 'Ver registros da lixeira - [BAS253]'
                OnClick = SpeedButton25Click
                ExplicitLeft = 177
              end
              inherited SpeedButton26: TSpeedButton
                Visible = False
              end
            end
          end
        end
        inherited tsMemo: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 789
          ExplicitHeight = 510
        end
        object TabSheet4: TTabSheet
          Caption = 'TabSheet4'
          ImageIndex = 3
          object qrpPAgenda: TQuickRep
            Left = 3
            Top = 0
            Width = 794
            Height = 1123
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            DataSet = DtmCadBasicos.cdsTipoVendas
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
            Functions.Strings = (
              'PAGENUMBER'
              'COLUMNNUMBER'
              'REPORTTITLE')
            Functions.DATA = (
              '0'
              '0'
              #39#39)
            OnPreview = qrpPAgendaPreview
            Options = [FirstPageHeader, LastPageFooter]
            Page.Columns = 1
            Page.Orientation = poPortrait
            Page.PaperSize = A4
            Page.Values = (
              100.000000000000000000
              2970.000000000000000000
              100.000000000000000000
              2100.000000000000000000
              100.000000000000000000
              100.000000000000000000
              0.000000000000000000)
            PrinterSettings.Copies = 1
            PrinterSettings.OutputBin = Auto
            PrinterSettings.Duplex = False
            PrinterSettings.FirstPage = 0
            PrinterSettings.LastPage = 0
            PrinterSettings.UseStandardprinter = False
            PrinterSettings.UseCustomBinCode = False
            PrinterSettings.CustomBinCode = 0
            PrinterSettings.ExtendedDuplex = 0
            PrinterSettings.UseCustomPaperCode = False
            PrinterSettings.CustomPaperCode = 0
            PrinterSettings.PrintMetaFile = False
            PrinterSettings.PrintQuality = 0
            PrinterSettings.Collate = 0
            PrinterSettings.ColorOption = 0
            PrintIfEmpty = True
            SnapToGrid = True
            Units = MM
            Zoom = 100
            PrevFormStyle = fsStayOnTop
            PreviewInitialState = wsMaximized
            PrevInitialZoom = qrZoomToWidth
            PreviewDefaultSaveType = stQRP
            object TitleBand1: TQRBand
              Left = 38
              Top = 38
              Width = 718
              Height = 83
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              AlignToBottom = False
              Color = clWhite
              TransparentBand = False
              ForceNewColumn = False
              ForceNewPage = False
              Size.Values = (
                219.604166666666700000
                1899.708333333333000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              BandType = rbTitle
              object QRLabel1: TQRLabel
                Left = 0
                Top = 34
                Width = 206
                Height = 24
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  63.500000000000000000
                  0.000000000000000000
                  89.958333333333320000
                  545.041666666666700000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Cadastro Tipos Vendas'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -19
                Font.Name = 'Arial'
                Font.Style = [fsItalic]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 14
              end
              object QRLabel2: TQRLabel
                Left = 2
                Top = 61
                Width = 65
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  5.291666666666667000
                  161.395833333333300000
                  171.979166666666700000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Data/Hora:'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Arial'
                Font.Style = [fsBold, fsItalic]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
              object QRSysData1: TQRSysData
                Left = 73
                Top = 61
                Width = 69
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  193.145833333333300000
                  161.395833333333300000
                  182.562500000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                Color = clWhite
                Data = qrsDateTime
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Arial'
                Font.Style = [fsItalic]
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                FontSize = 10
              end
              object QRLabel3: TQRLabel
                Left = 607
                Top = 61
                Width = 47
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1606.020833333333000000
                  161.395833333333300000
                  124.354166666666700000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'P'#225'gina:'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Arial'
                Font.Style = [fsBold, fsItalic]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
              object QRSysData2: TQRSysData
                Left = 658
                Top = 61
                Width = 46
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1740.958333333333000000
                  161.395833333333300000
                  121.708333333333300000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                Color = clWhite
                Data = qrsPageNumber
                Transparent = False
                ExportAs = exptText
                FontSize = 10
              end
              object lbEmpresa: TQRLabel
                Left = 2
                Top = 10
                Width = 103
                Height = 24
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  63.500000000000000000
                  5.291666666666667000
                  26.458333333333330000
                  272.520833333333400000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'lbEmpresa'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -19
                Font.Name = 'Arial'
                Font.Style = [fsBold, fsItalic]
                OnPrint = lbEmpresaPrint
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 14
              end
            end
            object ColumnHeaderBand1: TQRBand
              Left = 38
              Top = 121
              Width = 718
              Height = 33
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              AlignToBottom = False
              Color = clWhite
              TransparentBand = False
              ForceNewColumn = False
              ForceNewPage = False
              Size.Values = (
                87.312500000000000000
                1899.708333333333000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              BandType = rbColumnHeader
              object QRShape1: TQRShape
                Left = 3
                Top = 1
                Width = 734
                Height = 3
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  7.937500000000000000
                  7.937500000000000000
                  2.645833333333333000
                  1942.041666666667000000)
                Brush.Color = clBlack
                Shape = qrsRectangle
                VertAdjust = 0
              end
              object QRShape2: TQRShape
                Left = 3
                Top = 27
                Width = 734
                Height = 3
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  7.937500000000000000
                  7.937500000000000000
                  71.437500000000000000
                  1942.041666666667000000)
                Brush.Color = clBlack
                Shape = qrsRectangle
                VertAdjust = 0
              end
              object QRLabel4: TQRLabel
                Left = 73
                Top = 6
                Width = 57
                Height = 20
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  52.916666666666670000
                  193.145833333333300000
                  15.875000000000000000
                  150.812500000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'C'#243'digo'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -16
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 12
              end
              object QRLabel5: TQRLabel
                Left = 264
                Top = 6
                Width = 78
                Height = 20
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  52.916666666666670000
                  698.500000000000000000
                  15.875000000000000000
                  206.375000000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Descri'#231#227'o'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -16
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 12
              end
              object QRLabel6: TQRLabel
                Left = 665
                Top = 7
                Width = 39
                Height = 20
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  52.916666666666670000
                  1759.479166666667000000
                  18.520833333333330000
                  103.187500000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Sigla'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -16
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 12
              end
              object QRLabel7: TQRLabel
                Left = 185
                Top = 6
                Width = 35
                Height = 20
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  52.916666666666670000
                  489.479166666666700000
                  15.875000000000000000
                  92.604166666666680000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Tipo'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -16
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 12
              end
              object QRLabel8: TQRLabel
                Left = 570
                Top = 156
                Width = 62
                Height = 20
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  52.916666666666670000
                  1508.125000000000000000
                  412.750000000000000000
                  164.041666666666700000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Tipo OS'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -16
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 12
              end
              object QRLabel9: TQRLabel
                Left = 523
                Top = 6
                Width = 62
                Height = 20
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  52.916666666666670000
                  1383.770833333333000000
                  15.875000000000000000
                  164.041666666666700000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Tipo OS'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -16
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 12
              end
            end
            object DetailBand1: TQRBand
              Left = 38
              Top = 154
              Width = 718
              Height = 19
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              AlignToBottom = False
              Color = clWhite
              TransparentBand = False
              ForceNewColumn = False
              ForceNewPage = False
              Size.Values = (
                50.270833333333330000
                1899.708333333333000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              BandType = rbDetail
              object QRDBText2: TQRDBText
                Left = 73
                Top = 0
                Width = 62
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  193.145833333333300000
                  0.000000000000000000
                  164.041666666666700000)
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Color = clWhite
                DataSet = DtmCadBasicos.cdsTipoVendas
                DataField = 'COD_TIPO'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 9
              end
              object QRDBText3: TQRDBText
                Left = 264
                Top = 0
                Width = 233
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  698.500000000000000000
                  0.000000000000000000
                  616.479166666666800000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Color = clWhite
                DataSet = DtmCadBasicos.cdsTipoVendas
                DataField = 'DESCRICAO'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 9
              end
              object QRDBText1: TQRDBText
                Left = 665
                Top = 3
                Width = 35
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1759.479166666667000000
                  7.937500000000000000
                  92.604166666666680000)
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Color = clWhite
                DataSet = DtmCadBasicos.cdsTipoVendas
                DataField = 'SIGLA'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 9
              end
              object QRDBText4: TQRDBText
                Left = 185
                Top = 2
                Width = 28
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  489.479166666666700000
                  5.291666666666667000
                  74.083333333333340000)
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Color = clWhite
                DataSet = DtmCadBasicos.cdsTipoVendas
                DataField = 'TIPO'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 9
              end
              object QRDBText5: TQRDBText
                Left = 523
                Top = 0
                Width = 122
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1383.770833333333000000
                  0.000000000000000000
                  322.791666666666700000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Color = clWhite
                DataSet = DtmCadBasicos.cdsTipoVendas
                DataField = 'TIPO_OS'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 9
              end
            end
            object PageFooterBand1: TQRBand
              Left = 38
              Top = 173
              Width = 718
              Height = 36
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              AlignToBottom = False
              Color = clWhite
              TransparentBand = False
              ForceNewColumn = False
              ForceNewPage = False
              Size.Values = (
                95.250000000000000000
                1899.708333333333000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              BandType = rbPageFooter
              object QRLabel15: TQRLabel
                Left = 3
                Top = 6
                Width = 210
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  7.937500000000000000
                  15.875000000000000000
                  555.625000000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'HW Sistemas e Computadores Ltda'
                Color = clWhite
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
              object QRShape3: TQRShape
                Left = 3
                Top = 4
                Width = 734
                Height = 3
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  7.937500000000000000
                  7.937500000000000000
                  10.583333333333330000
                  1942.041666666667000000)
                Brush.Color = clBlack
                Shape = qrsRectangle
                VertAdjust = 0
              end
            end
          end
        end
      end
    end
    inherited PanelFlash: TPanel
      Left = 536
      Top = 534
      ExplicitLeft = 536
      ExplicitTop = 534
    end
  end
  inherited StatusBar1: TStatusBar
    Width = 804
    ExplicitWidth = 804
  end
  inherited pnStatusProcessamento: TPanel
    inherited lbTextoProcessamento: TLabel
      Width = 477
      Height = 21
    end
  end
  inherited PopupMenu2: TPopupMenu
    Left = 590
    Top = 11
  end
  inherited Timer1: TTimer
    Left = 550
    Top = 11
  end
  inherited ApplicationEventsPadrao: TApplicationEvents
    Left = 518
    Top = 11
  end
  object DataSource1: TDataSource
    DataSet = DtmCadBasicos.cdsTipoVendas
    Left = 472
    Top = 8
  end
end
